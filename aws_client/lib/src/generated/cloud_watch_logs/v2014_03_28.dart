// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unintended_html_in_doc_comment
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

/// You can use Amazon CloudWatch Logs to monitor, store, and access your log
/// files from EC2 instances, CloudTrail, and other sources. You can then
/// retrieve the associated log data from CloudWatch Logs using the CloudWatch
/// console. Alternatively, you can use CloudWatch Logs commands in the Amazon
/// Web Services CLI, CloudWatch Logs API, or CloudWatch Logs SDK.
///
/// You can use CloudWatch Logs to:
///
/// <ul>
/// <li>
/// <b>Monitor logs from EC2 instances in real time</b>: You can use CloudWatch
/// Logs to monitor applications and systems using log data. For example,
/// CloudWatch Logs can track the number of errors that occur in your
/// application logs. Then, it can send you a notification whenever the rate of
/// errors exceeds a threshold that you specify. CloudWatch Logs uses your log
/// data for monitoring so no code changes are required. For example, you can
/// monitor application logs for specific literal terms (such as
/// "NullReferenceException"). You can also count the number of occurrences of a
/// literal term at a particular position in log data (such as "404" status
/// codes in an Apache access log). When the term you are searching for is
/// found, CloudWatch Logs reports the data to a CloudWatch metric that you
/// specify.
/// </li>
/// <li>
/// <b>Monitor CloudTrail logged events</b>: You can create alarms in CloudWatch
/// and receive notifications of particular API activity as captured by
/// CloudTrail. You can use the notification to perform troubleshooting.
/// </li>
/// <li>
/// <b>Archive log data</b>: You can use CloudWatch Logs to store your log data
/// in highly durable storage. You can change the log retention setting so that
/// any log events earlier than this setting are automatically deleted. The
/// CloudWatch Logs agent helps to quickly send both rotated and non-rotated log
/// data off of a host and into the log service. You can then access the raw log
/// data when you need it.
/// </li>
/// </ul>
class CloudWatchLogs {
  final _s.JsonProtocol _protocol;
  CloudWatchLogs({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'logs',
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

  /// Associates the specified KMS key with either one log group in the account,
  /// or with all stored CloudWatch Logs query insights results in the account.
  ///
  /// When you use <code>AssociateKmsKey</code>, you specify either the
  /// <code>logGroupName</code> parameter or the <code>resourceIdentifier</code>
  /// parameter. You can't specify both of those parameters in the same
  /// operation.
  ///
  /// <ul>
  /// <li>
  /// Specify the <code>logGroupName</code> parameter to cause log events
  /// ingested into that log group to be encrypted with that key. Only the log
  /// events ingested after the key is associated are encrypted with that key.
  ///
  /// Associating a KMS key with a log group overrides any existing associations
  /// between the log group and a KMS key. After a KMS key is associated with a
  /// log group, all newly ingested data for the log group is encrypted using
  /// the KMS key. This association is stored as long as the data encrypted with
  /// the KMS key is still within CloudWatch Logs. This enables CloudWatch Logs
  /// to decrypt this data whenever it is requested.
  ///
  /// Associating a key with a log group does not cause the results of queries
  /// of that log group to be encrypted with that key. To have query results
  /// encrypted with a KMS key, you must use an <code>AssociateKmsKey</code>
  /// operation with the <code>resourceIdentifier</code> parameter that
  /// specifies a <code>query-result</code> resource.
  /// </li>
  /// <li>
  /// Specify the <code>resourceIdentifier</code> parameter with a
  /// <code>query-result</code> resource, to use that key to encrypt the stored
  /// results of all future <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_StartQuery.html">StartQuery</a>
  /// operations in the account. The response from a <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_GetQueryResults.html">GetQueryResults</a>
  /// operation will still return the query results in plain text.
  ///
  /// Even if you have not associated a key with your query results, the query
  /// results are encrypted when stored, using the default CloudWatch Logs
  /// method.
  ///
  /// If you run a query from a monitoring account that queries logs in a source
  /// account, the query results key from the monitoring account, if any, is
  /// used.
  /// </li>
  /// </ul> <important>
  /// If you delete the key that is used to encrypt log events or log group
  /// query results, then all the associated stored log events or query results
  /// that were encrypted with that key will be unencryptable and unusable.
  /// </important> <note>
  /// CloudWatch Logs supports only symmetric KMS keys. Do not associate an
  /// asymmetric KMS key with your log group or query results. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html">Using
  /// Symmetric and Asymmetric Keys</a>.
  /// </note>
  /// It can take up to 5 minutes for this operation to take effect.
  ///
  /// If you attempt to associate a KMS key with a log group but the KMS key
  /// does not exist or the KMS key is disabled, you receive an
  /// <code>InvalidParameterException</code> error.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [OperationAbortedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [kmsKeyId] :
  /// The Amazon Resource Name (ARN) of the KMS key to use when encrypting log
  /// data. This must be a symmetric KMS key. For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-kms">Amazon
  /// Resource Names</a> and <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html">Using
  /// Symmetric and Asymmetric Keys</a>.
  ///
  /// Parameter [logGroupName] :
  /// The name of the log group.
  ///
  /// In your <code>AssociateKmsKey</code> operation, you must specify either
  /// the <code>resourceIdentifier</code> parameter or the <code>logGroup</code>
  /// parameter, but you can't specify both.
  ///
  /// Parameter [resourceIdentifier] :
  /// Specifies the target for this operation. You must specify one of the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// Specify the following ARN to have future <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_GetQueryResults.html">GetQueryResults</a>
  /// operations in this account encrypt the results with the specified KMS key.
  /// Replace <i>REGION</i> and <i>ACCOUNT_ID</i> with your Region and account
  /// ID.
  ///
  /// <code>arn:aws:logs:<i>REGION</i>:<i>ACCOUNT_ID</i>:query-result:*</code>
  /// </li>
  /// <li>
  /// Specify the ARN of a log group to have CloudWatch Logs use the KMS key to
  /// encrypt log events that are ingested and stored by that log group. The log
  /// group ARN must be in the following format. Replace <i>REGION</i> and
  /// <i>ACCOUNT_ID</i> with your Region and account ID.
  ///
  /// <code>arn:aws:logs:<i>REGION</i>:<i>ACCOUNT_ID</i>:log-group:<i>LOG_GROUP_NAME</i>
  /// </code>
  /// </li>
  /// </ul>
  /// In your <code>AssociateKmsKey</code> operation, you must specify either
  /// the <code>resourceIdentifier</code> parameter or the <code>logGroup</code>
  /// parameter, but you can't specify both.
  Future<void> associateKmsKey({
    required String kmsKeyId,
    String? logGroupName,
    String? resourceIdentifier,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.AssociateKmsKey'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'kmsKeyId': kmsKeyId,
        if (logGroupName != null) 'logGroupName': logGroupName,
        if (resourceIdentifier != null)
          'resourceIdentifier': resourceIdentifier,
      },
    );
  }

  /// Associates a data source with an S3 Table Integration for query access in
  /// the 'logs' namespace. This enables querying log data using analytics
  /// engines that support Iceberg such as Amazon Athena, Amazon Redshift, and
  /// Apache Spark.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [dataSource] :
  /// The data source to associate with the S3 Table Integration. Contains the
  /// name and type of the data source.
  ///
  /// Parameter [integrationArn] :
  /// The Amazon Resource Name (ARN) of the S3 Table Integration to associate
  /// the data source with.
  Future<AssociateSourceToS3TableIntegrationResponse>
      associateSourceToS3TableIntegration({
    required DataSource dataSource,
    required String integrationArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.AssociateSourceToS3TableIntegration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'dataSource': dataSource,
        'integrationArn': integrationArn,
      },
    );

    return AssociateSourceToS3TableIntegrationResponse.fromJson(
        jsonResponse.body);
  }

  /// Cancels the specified export task.
  ///
  /// The task must be in the <code>PENDING</code> or <code>RUNNING</code>
  /// state.
  ///
  /// May throw [InvalidOperationException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [taskId] :
  /// The ID of the export task.
  Future<void> cancelExportTask({
    required String taskId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.CancelExportTask'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'taskId': taskId,
      },
    );
  }

  /// Cancels an active import task and stops importing data from the CloudTrail
  /// Lake Event Data Store.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidOperationException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [importId] :
  /// The ID of the import task to cancel.
  Future<CancelImportTaskResponse> cancelImportTask({
    required String importId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.CancelImportTask'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'importId': importId,
      },
    );

    return CancelImportTaskResponse.fromJson(jsonResponse.body);
  }

  /// Creates a <i>delivery</i>. A delivery is a connection between a logical
  /// <i>delivery source</i> and a logical <i>delivery destination</i> that you
  /// have already created.
  ///
  /// Only some Amazon Web Services services support being configured as a
  /// delivery source using this operation. These services are listed as
  /// <b>Supported [V2 Permissions]</b> in the table at <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AWS-logs-and-resource-policy.html">Enabling
  /// logging from Amazon Web Services services.</a>
  ///
  /// A delivery destination can represent a log group in CloudWatch Logs, an
  /// Amazon S3 bucket, a delivery stream in Firehose, or X-Ray.
  ///
  /// To configure logs delivery between a supported Amazon Web Services service
  /// and a destination, you must do the following:
  ///
  /// <ul>
  /// <li>
  /// Create a delivery source, which is a logical object that represents the
  /// resource that is actually sending the logs. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliverySource.html">PutDeliverySource</a>.
  /// </li>
  /// <li>
  /// Create a <i>delivery destination</i>, which is a logical object that
  /// represents the actual delivery destination. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestination.html">PutDeliveryDestination</a>.
  /// </li>
  /// <li>
  /// If you are delivering logs cross-account, you must use <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestinationPolicy.html">PutDeliveryDestinationPolicy</a>
  /// in the destination account to assign an IAM policy to the destination.
  /// This policy allows delivery to that destination.
  /// </li>
  /// <li>
  /// Use <code>CreateDelivery</code> to create a <i>delivery</i> by pairing
  /// exactly one delivery source and one delivery destination.
  /// </li>
  /// </ul>
  /// You can configure a single delivery source to send logs to multiple
  /// destinations by creating multiple deliveries. You can also create multiple
  /// deliveries to configure multiple delivery sources to send logs to the same
  /// delivery destination.
  ///
  /// To update an existing delivery configuration, use <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_UpdateDeliveryConfiguration.html">UpdateDeliveryConfiguration</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [deliveryDestinationArn] :
  /// The ARN of the delivery destination to use for this delivery.
  ///
  /// Parameter [deliverySourceName] :
  /// The name of the delivery source to use for this delivery.
  ///
  /// Parameter [fieldDelimiter] :
  /// The field delimiter to use between record fields when the final output
  /// format of a delivery is in <code>Plain</code>, <code>W3C</code>, or
  /// <code>Raw</code> format.
  ///
  /// Parameter [recordFields] :
  /// The list of record fields to be delivered to the destination, in order. If
  /// the delivery's log source has mandatory fields, they must be included in
  /// this list.
  ///
  /// Parameter [s3DeliveryConfiguration] :
  /// This structure contains parameters that are valid only when the delivery's
  /// delivery destination is an S3 bucket.
  ///
  /// Parameter [tags] :
  /// An optional list of key-value pairs to associate with the resource.
  ///
  /// For more information about tagging, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// Amazon Web Services resources</a>
  Future<CreateDeliveryResponse> createDelivery({
    required String deliveryDestinationArn,
    required String deliverySourceName,
    String? fieldDelimiter,
    List<String>? recordFields,
    S3DeliveryConfiguration? s3DeliveryConfiguration,
    Map<String, String>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.CreateDelivery'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'deliveryDestinationArn': deliveryDestinationArn,
        'deliverySourceName': deliverySourceName,
        if (fieldDelimiter != null) 'fieldDelimiter': fieldDelimiter,
        if (recordFields != null) 'recordFields': recordFields,
        if (s3DeliveryConfiguration != null)
          's3DeliveryConfiguration': s3DeliveryConfiguration,
        if (tags != null) 'tags': tags,
      },
    );

    return CreateDeliveryResponse.fromJson(jsonResponse.body);
  }

  /// Creates an export task so that you can efficiently export data from a log
  /// group to an Amazon S3 bucket. When you perform a
  /// <code>CreateExportTask</code> operation, you must use credentials that
  /// have permission to write to the S3 bucket that you specify as the
  /// destination.
  ///
  /// Exporting log data to S3 buckets that are encrypted by KMS is supported.
  /// Exporting log data to Amazon S3 buckets that have S3 Object Lock enabled
  /// with a retention period is also supported.
  ///
  /// Exporting to S3 buckets that are encrypted with AES-256 is supported.
  ///
  /// This is an asynchronous call. If all the required information is provided,
  /// this operation initiates an export task and responds with the ID of the
  /// task. After the task has started, you can use <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeExportTasks.html">DescribeExportTasks</a>
  /// to get the status of the export task. Each account can only have one
  /// active (<code>RUNNING</code> or <code>PENDING</code>) export task at a
  /// time. To cancel an export task, use <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_CancelExportTask.html">CancelExportTask</a>.
  ///
  /// You can export logs from multiple log groups or multiple time ranges to
  /// the same S3 bucket. To separate log data for each export task, specify a
  /// prefix to be used as the Amazon S3 key prefix for all exported objects.
  /// <note>
  /// We recommend that you don't regularly export to Amazon S3 as a way to
  /// continuously archive your logs. For that use case, we instead recommend
  /// that you use subscriptions. For more information about subscriptions, see
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/Subscriptions.html">Real-time
  /// processing of log data with subscriptions</a>.
  /// </note> <note>
  /// Time-based sorting on chunks of log data inside an exported file is not
  /// guaranteed. You can sort the exported log field data by using Linux
  /// utilities.
  /// </note>
  ///
  /// May throw [InvalidParameterException].
  /// May throw [LimitExceededException].
  /// May throw [OperationAbortedException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [destination] :
  /// The name of S3 bucket for the exported log data. The bucket must be in the
  /// same Amazon Web Services Region.
  ///
  /// Parameter [from] :
  /// The start time of the range for the request, expressed as the number of
  /// milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>. Events with a
  /// timestamp earlier than this time are not exported.
  ///
  /// Parameter [logGroupName] :
  /// The name of the log group.
  ///
  /// Parameter [to] :
  /// The end time of the range for the request, expressed as the number of
  /// milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>. Events with a
  /// timestamp later than this time are not exported.
  ///
  /// You must specify a time that is not earlier than when this log group was
  /// created.
  ///
  /// Parameter [destinationPrefix] :
  /// The prefix used as the start of the key for every object exported. If you
  /// don't specify a value, the default is <code>exportedlogs</code>.
  ///
  /// The length of this parameter must comply with the S3 object key name
  /// length limits. The object key name is a sequence of Unicode characters
  /// with UTF-8 encoding, and can be up to 1,024 bytes.
  ///
  /// Parameter [logStreamNamePrefix] :
  /// Export only log streams that match the provided prefix. If you don't
  /// specify a value, no prefix filter is applied.
  ///
  /// Parameter [taskName] :
  /// The name of the export task.
  Future<CreateExportTaskResponse> createExportTask({
    required String destination,
    required int from,
    required String logGroupName,
    required int to,
    String? destinationPrefix,
    String? logStreamNamePrefix,
    String? taskName,
  }) async {
    _s.validateNumRange(
      'from',
      from,
      0,
      1152921504606846976,
      isRequired: true,
    );
    _s.validateNumRange(
      'to',
      to,
      0,
      1152921504606846976,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.CreateExportTask'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'destination': destination,
        'from': from,
        'logGroupName': logGroupName,
        'to': to,
        if (destinationPrefix != null) 'destinationPrefix': destinationPrefix,
        if (logStreamNamePrefix != null)
          'logStreamNamePrefix': logStreamNamePrefix,
        if (taskName != null) 'taskName': taskName,
      },
    );

    return CreateExportTaskResponse.fromJson(jsonResponse.body);
  }

  /// Starts an import from a data source to CloudWatch Log and creates a
  /// managed log group as the destination for the imported data. Currently, <a
  /// href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/query-event-data-store.html">CloudTrail
  /// Event Data Store</a> is the only supported data source.
  ///
  /// The import task must satisfy the following constraints:
  ///
  /// <ul>
  /// <li>
  /// The specified source must be in an ACTIVE state.
  /// </li>
  /// <li>
  /// The API caller must have permissions to access the data in the provided
  /// source and to perform iam:PassRole on the provided import role which has
  /// the same permissions, as described below.
  /// </li>
  /// <li>
  /// The provided IAM role must trust the "cloudtrail.amazonaws.com" principal
  /// and have the following permissions:
  ///
  /// <ul>
  /// <li>
  /// cloudtrail:GetEventDataStoreData
  /// </li>
  /// <li>
  /// logs:CreateLogGroup
  /// </li>
  /// <li>
  /// logs:CreateLogStream
  /// </li>
  /// <li>
  /// logs:PutResourcePolicy
  /// </li>
  /// <li>
  /// (If source has an associated Amazon Web Services KMS Key) kms:Decrypt
  /// </li>
  /// <li>
  /// (If source has an associated Amazon Web Services KMS Key)
  /// kms:GenerateDataKey
  /// </li>
  /// </ul>
  /// Example IAM policy for provided import role:
  ///
  /// <code>[ { "Effect": "Allow", "Action": "iam:PassRole", "Resource":
  /// "arn:aws:iam::123456789012:role/apiCallerCredentials", "Condition": {
  /// "StringLike": { "iam:AssociatedResourceARN":
  /// "arn:aws:logs:us-east-1:123456789012:log-group:aws/cloudtrail/f1d45bff-d0e3-4868-b5d9-2eb678aa32fb:*"
  /// } } }, { "Effect": "Allow", "Action": [ "cloudtrail:GetEventDataStoreData"
  /// ], "Resource": [
  /// "arn:aws:cloudtrail:us-east-1:123456789012:eventdatastore/f1d45bff-d0e3-4868-b5d9-2eb678aa32fb"
  /// ] }, { "Effect": "Allow", "Action": [ "logs:CreateImportTask",
  /// "logs:CreateLogGroup", "logs:CreateLogStream", "logs:PutResourcePolicy" ],
  /// "Resource": [
  /// "arn:aws:logs:us-east-1:123456789012:log-group:/aws/cloudtrail/*" ] }, {
  /// "Effect": "Allow", "Action": [ "kms:Decrypt", "kms:GenerateDataKey" ],
  /// "Resource": [
  /// "arn:aws:kms:us-east-1:123456789012:key/12345678-1234-1234-1234-123456789012"
  /// ] } ]</code>
  /// </li>
  /// <li>
  /// If the import source has a customer managed key, the
  /// "cloudtrail.amazonaws.com" principal needs permissions to perform
  /// kms:Decrypt and kms:GenerateDataKey.
  /// </li>
  /// <li>
  /// There can be no more than 3 active imports per account at a given time.
  /// </li>
  /// <li>
  /// The startEventTime must be less than or equal to endEventTime.
  /// </li>
  /// <li>
  /// The data being imported must be within the specified source's retention
  /// period.
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InvalidOperationException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [importRoleArn] :
  /// The ARN of the IAM role that grants CloudWatch Logs permission to import
  /// from the CloudTrail Lake Event Data Store.
  ///
  /// Parameter [importSourceArn] :
  /// The ARN of the source to import from.
  ///
  /// Parameter [importFilter] :
  /// Optional filters to constrain the import by CloudTrail event time. Times
  /// are specified in Unix timestamp milliseconds. The range of data being
  /// imported must be within the specified source's retention period.
  Future<CreateImportTaskResponse> createImportTask({
    required String importRoleArn,
    required String importSourceArn,
    ImportFilter? importFilter,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.CreateImportTask'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'importRoleArn': importRoleArn,
        'importSourceArn': importSourceArn,
        if (importFilter != null) 'importFilter': importFilter,
      },
    );

    return CreateImportTaskResponse.fromJson(jsonResponse.body);
  }

  /// Creates an <i>anomaly detector</i> that regularly scans one or more log
  /// groups and look for patterns and anomalies in the logs.
  ///
  /// An anomaly detector can help surface issues by automatically discovering
  /// anomalies in your log event traffic. An anomaly detector uses machine
  /// learning algorithms to scan log events and find <i>patterns</i>. A pattern
  /// is a shared text structure that recurs among your log fields. Patterns
  /// provide a useful tool for analyzing large sets of logs because a large
  /// number of log events can often be compressed into a few patterns.
  ///
  /// The anomaly detector uses pattern recognition to find
  /// <code>anomalies</code>, which are unusual log events. It uses the
  /// <code>evaluationFrequency</code> to compare current log events and
  /// patterns with trained baselines.
  ///
  /// Fields within a pattern are called <i>tokens</i>. Fields that vary within
  /// a pattern, such as a request ID or timestamp, are referred to as
  /// <i>dynamic tokens</i> and represented by <code><*></code>.
  ///
  /// The following is an example of a pattern:
  ///
  /// <code>[INFO] Request time: <*> ms</code>
  ///
  /// This pattern represents log events like <code>[INFO] Request time: 327
  /// ms</code> and other similar log events that differ only by the number, in
  /// this csse 327. When the pattern is displayed, the different numbers are
  /// replaced by <code><*></code>
  /// <note>
  /// Any parts of log events that are masked as sensitive data are not scanned
  /// for anomalies. For more information about masking sensitive data, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/mask-sensitive-log-data.html">Help
  /// protect sensitive log data with masking</a>.
  /// </note>
  ///
  /// May throw [InvalidParameterException].
  /// May throw [LimitExceededException].
  /// May throw [OperationAbortedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [logGroupArnList] :
  /// An array containing the ARN of the log group that this anomaly detector
  /// will watch. You can specify only one log group ARN.
  ///
  /// Parameter [anomalyVisibilityTime] :
  /// The number of days to have visibility on an anomaly. After this time
  /// period has elapsed for an anomaly, it will be automatically baselined and
  /// the anomaly detector will treat new occurrences of a similar anomaly as
  /// normal. Therefore, if you do not correct the cause of an anomaly during
  /// the time period specified in <code>anomalyVisibilityTime</code>, it will
  /// be considered normal going forward and will not be detected as an anomaly.
  ///
  /// Parameter [detectorName] :
  /// A name for this anomaly detector.
  ///
  /// Parameter [evaluationFrequency] :
  /// Specifies how often the anomaly detector is to run and look for anomalies.
  /// Set this value according to the frequency that the log group receives new
  /// logs. For example, if the log group receives new log events every 10
  /// minutes, then 15 minutes might be a good setting for
  /// <code>evaluationFrequency</code> .
  ///
  /// Parameter [filterPattern] :
  /// You can use this parameter to limit the anomaly detection model to examine
  /// only log events that match the pattern you specify here. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/FilterAndPatternSyntax.html">Filter
  /// and Pattern Syntax</a>.
  ///
  /// Parameter [kmsKeyId] :
  /// Optionally assigns a KMS key to secure this anomaly detector and its
  /// findings. If a key is assigned, the anomalies found and the model used by
  /// this detector are encrypted at rest with the key. If a key is assigned to
  /// an anomaly detector, a user must have permissions for both this key and
  /// for the anomaly detector to retrieve information about the anomalies that
  /// it finds.
  ///
  /// Make sure the value provided is a valid KMS key ARN. For more information
  /// about using a KMS key and to see the required IAM policy, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/LogsAnomalyDetection-KMS.html">Use
  /// a KMS key with an anomaly detector</a>.
  ///
  /// Parameter [tags] :
  /// An optional list of key-value pairs to associate with the resource.
  ///
  /// For more information about tagging, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// Amazon Web Services resources</a>
  Future<CreateLogAnomalyDetectorResponse> createLogAnomalyDetector({
    required List<String> logGroupArnList,
    int? anomalyVisibilityTime,
    String? detectorName,
    EvaluationFrequency? evaluationFrequency,
    String? filterPattern,
    String? kmsKeyId,
    Map<String, String>? tags,
  }) async {
    _s.validateNumRange(
      'anomalyVisibilityTime',
      anomalyVisibilityTime,
      7,
      90,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.CreateLogAnomalyDetector'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'logGroupArnList': logGroupArnList,
        if (anomalyVisibilityTime != null)
          'anomalyVisibilityTime': anomalyVisibilityTime,
        if (detectorName != null) 'detectorName': detectorName,
        if (evaluationFrequency != null)
          'evaluationFrequency': evaluationFrequency.value,
        if (filterPattern != null) 'filterPattern': filterPattern,
        if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
        if (tags != null) 'tags': tags,
      },
    );

    return CreateLogAnomalyDetectorResponse.fromJson(jsonResponse.body);
  }

  /// Creates a log group with the specified name. You can create up to
  /// 1,000,000 log groups per Region per account.
  ///
  /// You must use the following guidelines when naming a log group:
  ///
  /// <ul>
  /// <li>
  /// Log group names must be unique within a Region for an Amazon Web Services
  /// account.
  /// </li>
  /// <li>
  /// Log group names can be between 1 and 512 characters long.
  /// </li>
  /// <li>
  /// Log group names consist of the following characters: a-z, A-Z, 0-9, '_'
  /// (underscore), '-' (hyphen), '/' (forward slash), '.' (period), and '#'
  /// (number sign)
  /// </li>
  /// <li>
  /// Log group names can't start with the string <code>aws/</code>
  /// </li>
  /// </ul>
  /// When you create a log group, by default the log events in the log group do
  /// not expire. To set a retention policy so that events expire and are
  /// deleted after a specified time, use <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutRetentionPolicy.html">PutRetentionPolicy</a>.
  ///
  /// If you associate an KMS key with the log group, ingested data is encrypted
  /// using the KMS key. This association is stored as long as the data
  /// encrypted with the KMS key is still within CloudWatch Logs. This enables
  /// CloudWatch Logs to decrypt this data whenever it is requested.
  ///
  /// If you attempt to associate a KMS key with the log group but the KMS key
  /// does not exist or the KMS key is disabled, you receive an
  /// <code>InvalidParameterException</code> error.
  /// <important>
  /// CloudWatch Logs supports only symmetric KMS keys. Do not associate an
  /// asymmetric KMS key with your log group. For more information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html">Using
  /// Symmetric and Asymmetric Keys</a>.
  /// </important>
  ///
  /// May throw [InvalidParameterException].
  /// May throw [LimitExceededException].
  /// May throw [OperationAbortedException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [logGroupName] :
  /// A name for the log group.
  ///
  /// Parameter [deletionProtectionEnabled] :
  /// Use this parameter to enable deletion protection for the new log group.
  /// When enabled on a log group, deletion protection blocks all deletion
  /// operations until it is explicitly disabled. By default log groups are
  /// created without deletion protection enabled.
  ///
  /// Parameter [kmsKeyId] :
  /// The Amazon Resource Name (ARN) of the KMS key to use when encrypting log
  /// data. For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-kms">Amazon
  /// Resource Names</a>.
  ///
  /// Parameter [logGroupClass] :
  /// Use this parameter to specify the log group class for this log group.
  /// There are three classes:
  ///
  /// <ul>
  /// <li>
  /// The <code>Standard</code> log class supports all CloudWatch Logs features.
  /// </li>
  /// <li>
  /// The <code>Infrequent Access</code> log class supports a subset of
  /// CloudWatch Logs features and incurs lower costs.
  /// </li>
  /// <li>
  /// Use the <code>Delivery</code> log class only for delivering Lambda logs to
  /// store in Amazon S3 or Amazon Data Firehose. Log events in log groups in
  /// the Delivery class are kept in CloudWatch Logs for only one day. This log
  /// class doesn't offer rich CloudWatch Logs capabilities such as CloudWatch
  /// Logs Insights queries.
  /// </li>
  /// </ul>
  /// If you omit this parameter, the default of <code>STANDARD</code> is used.
  /// <important>
  /// The value of <code>logGroupClass</code> can't be changed after a log group
  /// is created.
  /// </important>
  /// For details about the features supported by each class, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch_Logs_Log_Classes.html">Log
  /// classes</a>
  ///
  /// Parameter [tags] :
  /// The key-value pairs to use for the tags.
  ///
  /// You can grant users access to certain log groups while preventing them
  /// from accessing other log groups. To do so, tag your groups and use IAM
  /// policies that refer to those tags. To assign tags when you create a log
  /// group, you must have either the <code>logs:TagResource</code> or
  /// <code>logs:TagLogGroup</code> permission. For more information about
  /// tagging, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// Amazon Web Services resources</a>. For more information about using tags
  /// to control access, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_tags.html">Controlling
  /// access to Amazon Web Services resources using tags</a>.
  Future<void> createLogGroup({
    required String logGroupName,
    bool? deletionProtectionEnabled,
    String? kmsKeyId,
    LogGroupClass? logGroupClass,
    Map<String, String>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.CreateLogGroup'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'logGroupName': logGroupName,
        if (deletionProtectionEnabled != null)
          'deletionProtectionEnabled': deletionProtectionEnabled,
        if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
        if (logGroupClass != null) 'logGroupClass': logGroupClass.value,
        if (tags != null) 'tags': tags,
      },
    );
  }

  /// Creates a log stream for the specified log group. A log stream is a
  /// sequence of log events that originate from a single source, such as an
  /// application instance or a resource that is being monitored.
  ///
  /// There is no limit on the number of log streams that you can create for a
  /// log group. There is a limit of 50 TPS on <code>CreateLogStream</code>
  /// operations, after which transactions are throttled.
  ///
  /// You must use the following guidelines when naming a log stream:
  ///
  /// <ul>
  /// <li>
  /// Log stream names must be unique within the log group.
  /// </li>
  /// <li>
  /// Log stream names can be between 1 and 512 characters long.
  /// </li>
  /// <li>
  /// Don't use ':' (colon) or '*' (asterisk) characters.
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [logGroupName] :
  /// The name of the log group.
  ///
  /// Parameter [logStreamName] :
  /// The name of the log stream.
  Future<void> createLogStream({
    required String logGroupName,
    required String logStreamName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.CreateLogStream'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'logGroupName': logGroupName,
        'logStreamName': logStreamName,
      },
    );
  }

  /// Creates a lookup table by uploading CSV data. You can use lookup tables to
  /// enrich log data in CloudWatch Logs Insights queries with reference data
  /// such as user details, application names, or error descriptions.
  ///
  /// The table name must be unique within your account and Region. The CSV
  /// content must include a header row with column names, use UTF-8 encoding,
  /// and not exceed 10 MB.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ValidationException].
  ///
  /// Parameter [lookupTableName] :
  /// The name of the lookup table. The name must be unique within your account
  /// and Region. The name can contain only alphanumeric characters and
  /// underscores, and can be up to 256 characters long.
  ///
  /// Parameter [tableBody] :
  /// The CSV content of the lookup table. The first row must be a header row
  /// with column names. The content must use UTF-8 encoding and not exceed 10
  /// MB.
  ///
  /// Parameter [description] :
  /// A description of the lookup table. The description can be up to 1024
  /// characters long.
  ///
  /// Parameter [kmsKeyId] :
  /// The ARN of the KMS key to use to encrypt the lookup table data. If you
  /// don't specify a key, the data is encrypted with an Amazon Web
  /// Services-owned key.
  ///
  /// Parameter [tags] :
  /// A list of key-value pairs to associate with the lookup table. You can
  /// associate as many as 50 tags with a lookup table. Tags can help you
  /// organize and categorize your resources.
  Future<CreateLookupTableResponse> createLookupTable({
    required String lookupTableName,
    required String tableBody,
    String? description,
    String? kmsKeyId,
    Map<String, String>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.CreateLookupTable'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'lookupTableName': lookupTableName,
        'tableBody': tableBody,
        if (description != null) 'description': description,
        if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
        if (tags != null) 'tags': tags,
      },
    );

    return CreateLookupTableResponse.fromJson(jsonResponse.body);
  }

  /// Creates a scheduled query that runs CloudWatch Logs Insights queries at
  /// regular intervals. Scheduled queries enable proactive monitoring by
  /// automatically executing queries to detect patterns and anomalies in your
  /// log data. Query results can be delivered to Amazon S3 for analysis or
  /// further processing.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [executionRoleArn] :
  /// The ARN of the IAM role that grants permissions to execute the query and
  /// deliver results to the specified destination. The role must have
  /// permissions to read from the specified log groups and write to the
  /// destination.
  ///
  /// Parameter [name] :
  /// The name of the scheduled query. The name must be unique within your
  /// account and region. Valid characters are alphanumeric characters, hyphens,
  /// underscores, and periods. Length must be between 1 and 255 characters.
  ///
  /// Parameter [queryLanguage] :
  /// The query language to use for the scheduled query. Valid values are
  /// <code>CWLI</code>, <code>PPL</code>, and <code>SQL</code>.
  ///
  /// Parameter [queryString] :
  /// The query string to execute. This is the same query syntax used in
  /// CloudWatch Logs Insights. Maximum length is 10,000 characters.
  ///
  /// Parameter [scheduleExpression] :
  /// A cron expression that defines when the scheduled query runs. The
  /// expression uses standard cron syntax and supports minute-level precision.
  /// Maximum length is 256 characters.
  ///
  /// Parameter [description] :
  /// An optional description for the scheduled query to help identify its
  /// purpose and functionality.
  ///
  /// Parameter [destinationConfiguration] :
  /// Configuration for where to deliver query results. Currently supports
  /// Amazon S3 destinations for storing query output.
  ///
  /// Parameter [logGroupIdentifiers] :
  /// An array of log group names or ARNs to query. You can specify between 1
  /// and 50 log groups. Log groups can be identified by name or full ARN.
  ///
  /// Parameter [scheduleEndTime] :
  /// The end time for the scheduled query in Unix epoch format. The query will
  /// stop executing after this time.
  ///
  /// Parameter [scheduleStartTime] :
  /// The start time for the scheduled query in Unix epoch format. The query
  /// will not execute before this time.
  ///
  /// Parameter [startTimeOffset] :
  /// The time offset in seconds that defines the lookback period for the query.
  /// This determines how far back in time the query searches from the execution
  /// time.
  ///
  /// Parameter [state] :
  /// The initial state of the scheduled query. Valid values are
  /// <code>ENABLED</code> and <code>DISABLED</code>. Default is
  /// <code>ENABLED</code>.
  ///
  /// Parameter [tags] :
  /// Key-value pairs to associate with the scheduled query for resource
  /// management and cost allocation.
  ///
  /// Parameter [timezone] :
  /// The timezone for evaluating the schedule expression. This determines when
  /// the scheduled query executes relative to the specified timezone.
  Future<CreateScheduledQueryResponse> createScheduledQuery({
    required String executionRoleArn,
    required String name,
    required QueryLanguage queryLanguage,
    required String queryString,
    required String scheduleExpression,
    String? description,
    DestinationConfiguration? destinationConfiguration,
    List<String>? logGroupIdentifiers,
    int? scheduleEndTime,
    int? scheduleStartTime,
    int? startTimeOffset,
    ScheduledQueryState? state,
    Map<String, String>? tags,
    String? timezone,
  }) async {
    _s.validateNumRange(
      'scheduleEndTime',
      scheduleEndTime,
      0,
      1152921504606846976,
    );
    _s.validateNumRange(
      'scheduleStartTime',
      scheduleStartTime,
      0,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.CreateScheduledQuery'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'executionRoleArn': executionRoleArn,
        'name': name,
        'queryLanguage': queryLanguage.value,
        'queryString': queryString,
        'scheduleExpression': scheduleExpression,
        if (description != null) 'description': description,
        if (destinationConfiguration != null)
          'destinationConfiguration': destinationConfiguration,
        if (logGroupIdentifiers != null)
          'logGroupIdentifiers': logGroupIdentifiers,
        if (scheduleEndTime != null) 'scheduleEndTime': scheduleEndTime,
        if (scheduleStartTime != null) 'scheduleStartTime': scheduleStartTime,
        if (startTimeOffset != null) 'startTimeOffset': startTimeOffset,
        if (state != null) 'state': state.value,
        if (tags != null) 'tags': tags,
        if (timezone != null) 'timezone': timezone,
      },
    );

    return CreateScheduledQueryResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a CloudWatch Logs account policy. This stops the account-wide
  /// policy from applying to log groups or data sources in the account. If you
  /// delete a data protection policy or subscription filter policy, any
  /// log-group level policies of those types remain in effect. This operation
  /// supports deletion of data source-based field index policies, including
  /// facet configurations, in addition to log group-based policies.
  ///
  /// To use this operation, you must be signed on with the correct permissions
  /// depending on the type of policy that you are deleting.
  ///
  /// <ul>
  /// <li>
  /// To delete a data protection policy, you must have the
  /// <code>logs:DeleteDataProtectionPolicy</code> and
  /// <code>logs:DeleteAccountPolicy</code> permissions.
  /// </li>
  /// <li>
  /// To delete a subscription filter policy, you must have the
  /// <code>logs:DeleteSubscriptionFilter</code> and
  /// <code>logs:DeleteAccountPolicy</code> permissions.
  /// </li>
  /// <li>
  /// To delete a transformer policy, you must have the
  /// <code>logs:DeleteTransformer</code> and
  /// <code>logs:DeleteAccountPolicy</code> permissions.
  /// </li>
  /// <li>
  /// To delete a field index policy, you must have the
  /// <code>logs:DeleteIndexPolicy</code> and
  /// <code>logs:DeleteAccountPolicy</code> permissions.
  ///
  /// If you delete a field index policy that included facet configurations,
  /// those facets will no longer be available for interactive exploration in
  /// the CloudWatch Logs Insights console. However, facet data is retained for
  /// up to 30 days.
  /// </li>
  /// </ul>
  /// If you delete a field index policy, the indexing of the log events that
  /// happened before you deleted the policy will still be used for up to 30
  /// days to improve CloudWatch Logs Insights queries.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [OperationAbortedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [policyName] :
  /// The name of the policy to delete.
  ///
  /// Parameter [policyType] :
  /// The type of policy to delete.
  Future<void> deleteAccountPolicy({
    required String policyName,
    required PolicyType policyType,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.DeleteAccountPolicy'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'policyName': policyName,
        'policyType': policyType.value,
      },
    );
  }

  /// Deletes the data protection policy from the specified log group.
  ///
  /// For more information about data protection policies, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDataProtectionPolicy.html">PutDataProtectionPolicy</a>.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [OperationAbortedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [logGroupIdentifier] :
  /// The name or ARN of the log group that you want to delete the data
  /// protection policy for.
  Future<void> deleteDataProtectionPolicy({
    required String logGroupIdentifier,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.DeleteDataProtectionPolicy'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'logGroupIdentifier': logGroupIdentifier,
      },
    );
  }

  /// Deletes a <i>delivery</i>. A delivery is a connection between a logical
  /// <i>delivery source</i> and a logical <i>delivery destination</i>. Deleting
  /// a delivery only deletes the connection between the delivery source and
  /// delivery destination. It does not delete the delivery destination or the
  /// delivery source.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [id] :
  /// The unique ID of the delivery to delete. You can find the ID of a delivery
  /// with the <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeDeliveries.html">DescribeDeliveries</a>
  /// operation.
  Future<void> deleteDelivery({
    required String id,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.DeleteDelivery'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'id': id,
      },
    );
  }

  /// Deletes a <i>delivery destination</i>. A delivery is a connection between
  /// a logical <i>delivery source</i> and a logical <i>delivery
  /// destination</i>.
  ///
  /// You can't delete a delivery destination if any current deliveries are
  /// associated with it. To find whether any deliveries are associated with
  /// this delivery destination, use the <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeDeliveries.html">DescribeDeliveries</a>
  /// operation and check the <code>deliveryDestinationArn</code> field in the
  /// results.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the delivery destination that you want to delete. You can find
  /// a list of delivery destination names by using the <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeDeliveryDestinations.html">DescribeDeliveryDestinations</a>
  /// operation.
  Future<void> deleteDeliveryDestination({
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.DeleteDeliveryDestination'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
      },
    );
  }

  /// Deletes a delivery destination policy. For more information about these
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestinationPolicy.html">PutDeliveryDestinationPolicy</a>.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ValidationException].
  ///
  /// Parameter [deliveryDestinationName] :
  /// The name of the delivery destination that you want to delete the policy
  /// for.
  Future<void> deleteDeliveryDestinationPolicy({
    required String deliveryDestinationName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.DeleteDeliveryDestinationPolicy'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'deliveryDestinationName': deliveryDestinationName,
      },
    );
  }

  /// Deletes a <i>delivery source</i>. A delivery is a connection between a
  /// logical <i>delivery source</i> and a logical <i>delivery destination</i>.
  ///
  /// You can't delete a delivery source if any current deliveries are
  /// associated with it. To find whether any deliveries are associated with
  /// this delivery source, use the <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeDeliveries.html">DescribeDeliveries</a>
  /// operation and check the <code>deliverySourceName</code> field in the
  /// results.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the delivery source that you want to delete.
  Future<void> deleteDeliverySource({
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.DeleteDeliverySource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
      },
    );
  }

  /// Deletes the specified destination, and eventually disables all the
  /// subscription filters that publish to it. This operation does not delete
  /// the physical resource encapsulated by the destination.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [OperationAbortedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [destinationName] :
  /// The name of the destination.
  Future<void> deleteDestination({
    required String destinationName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.DeleteDestination'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'destinationName': destinationName,
      },
    );
  }

  /// Deletes a log-group level field index policy that was applied to a single
  /// log group. The indexing of the log events that happened before you delete
  /// the policy will still be used for as many as 30 days to improve CloudWatch
  /// Logs Insights queries.
  ///
  /// If the deleted policy included facet configurations, those facets will no
  /// longer be available for interactive exploration in the CloudWatch Logs
  /// Insights console for this log group. However, facet data is retained for
  /// up to 30 days.
  ///
  /// You can't use this operation to delete an account-level index policy.
  /// Instead, use <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DeleteAccountPolicy.html">DeleteAccountPolicy</a>.
  ///
  /// If you delete a log-group level field index policy and there is an
  /// account-level field index policy, in a few minutes the log group begins
  /// using that account-wide policy to index new incoming log events. This
  /// operation only affects log group-level policies, including any facet
  /// configurations, and preserves any data source-based account policies that
  /// may apply to the log group.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [LimitExceededException].
  /// May throw [OperationAbortedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [logGroupIdentifier] :
  /// The log group to delete the index policy for. You can specify either the
  /// name or the ARN of the log group.
  Future<void> deleteIndexPolicy({
    required String logGroupIdentifier,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.DeleteIndexPolicy'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'logGroupIdentifier': logGroupIdentifier,
      },
    );
  }

  /// Deletes the integration between CloudWatch Logs and OpenSearch Service. If
  /// your integration has active vended logs dashboards, you must specify
  /// <code>true</code> for the <code>force</code> parameter, otherwise the
  /// operation will fail. If you delete the integration by setting
  /// <code>force</code> to <code>true</code>, all your vended logs dashboards
  /// powered by OpenSearch Service will be deleted and the data that was on
  /// them will no longer be accessible.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ValidationException].
  ///
  /// Parameter [integrationName] :
  /// The name of the integration to delete. To find the name of your
  /// integration, use <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_ListIntegrations.html">ListIntegrations</a>.
  ///
  /// Parameter [force] :
  /// Specify <code>true</code> to force the deletion of the integration even if
  /// vended logs dashboards currently exist.
  ///
  /// The default is <code>false</code>.
  Future<void> deleteIntegration({
    required String integrationName,
    bool? force,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.DeleteIntegration'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'integrationName': integrationName,
        if (force != null) 'force': force,
      },
    );
  }

  /// Deletes the specified CloudWatch Logs anomaly detector.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [OperationAbortedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [anomalyDetectorArn] :
  /// The ARN of the anomaly detector to delete. You can find the ARNs of log
  /// anomaly detectors in your account by using the <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_ListLogAnomalyDetectors.html">ListLogAnomalyDetectors</a>
  /// operation.
  Future<void> deleteLogAnomalyDetector({
    required String anomalyDetectorArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.DeleteLogAnomalyDetector'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'anomalyDetectorArn': anomalyDetectorArn,
      },
    );
  }

  /// Deletes the specified log group and permanently deletes all the archived
  /// log events associated with the log group.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [OperationAbortedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ValidationException].
  ///
  /// Parameter [logGroupName] :
  /// The name of the log group.
  Future<void> deleteLogGroup({
    required String logGroupName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.DeleteLogGroup'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'logGroupName': logGroupName,
      },
    );
  }

  /// Deletes the specified log stream and permanently deletes all the archived
  /// log events associated with the log stream.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [OperationAbortedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ValidationException].
  ///
  /// Parameter [logGroupName] :
  /// The name of the log group.
  ///
  /// Parameter [logStreamName] :
  /// The name of the log stream.
  Future<void> deleteLogStream({
    required String logGroupName,
    required String logStreamName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.DeleteLogStream'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'logGroupName': logGroupName,
        'logStreamName': logStreamName,
      },
    );
  }

  /// Deletes a lookup table permanently. This operation cannot be undone.
  ///
  /// Queries that reference a deleted table will return an error. Before
  /// deleting a lookup table, review any saved queries or dashboards that may
  /// reference it.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [lookupTableArn] :
  /// The ARN of the lookup table to delete.
  Future<void> deleteLookupTable({
    required String lookupTableArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.DeleteLookupTable'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'lookupTableArn': lookupTableArn,
      },
    );
  }

  /// Deletes the specified metric filter.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [OperationAbortedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [filterName] :
  /// The name of the metric filter.
  ///
  /// Parameter [logGroupName] :
  /// The name of the log group.
  Future<void> deleteMetricFilter({
    required String filterName,
    required String logGroupName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.DeleteMetricFilter'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'filterName': filterName,
        'logGroupName': logGroupName,
      },
    );
  }

  /// Deletes a saved CloudWatch Logs Insights query definition. A query
  /// definition contains details about a saved CloudWatch Logs Insights query.
  ///
  /// Each <code>DeleteQueryDefinition</code> operation can delete one query
  /// definition.
  ///
  /// You must have the <code>logs:DeleteQueryDefinition</code> permission to be
  /// able to perform this operation.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [queryDefinitionId] :
  /// The ID of the query definition that you want to delete. You can use <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeQueryDefinitions.html">DescribeQueryDefinitions</a>
  /// to retrieve the IDs of your saved query definitions.
  Future<DeleteQueryDefinitionResponse> deleteQueryDefinition({
    required String queryDefinitionId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.DeleteQueryDefinition'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'queryDefinitionId': queryDefinitionId,
      },
    );

    return DeleteQueryDefinitionResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a resource policy from this account. This revokes the access of
  /// the identities in that policy to put log events to this account.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [OperationAbortedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [expectedRevisionId] :
  /// The expected revision ID of the resource policy. Required when deleting a
  /// resource-scoped policy to prevent concurrent modifications.
  ///
  /// Parameter [policyName] :
  /// The name of the policy to be revoked. This parameter is required.
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the CloudWatch Logs resource for which the resource policy
  /// needs to be deleted
  Future<void> deleteResourcePolicy({
    String? expectedRevisionId,
    String? policyName,
    String? resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.DeleteResourcePolicy'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (expectedRevisionId != null)
          'expectedRevisionId': expectedRevisionId,
        if (policyName != null) 'policyName': policyName,
        if (resourceArn != null) 'resourceArn': resourceArn,
      },
    );
  }

  /// Deletes the specified retention policy.
  ///
  /// Log events do not expire if they belong to log groups without a retention
  /// policy.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [OperationAbortedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [logGroupName] :
  /// The name of the log group.
  Future<void> deleteRetentionPolicy({
    required String logGroupName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.DeleteRetentionPolicy'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'logGroupName': logGroupName,
      },
    );
  }

  /// Deletes a scheduled query and stops all future executions. This operation
  /// also removes any configured actions and associated resources.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identifier] :
  /// The ARN or name of the scheduled query to delete.
  Future<void> deleteScheduledQuery({
    required String identifier,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.DeleteScheduledQuery'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'identifier': identifier,
      },
    );
  }

  /// Deletes the specified subscription filter.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [OperationAbortedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [filterName] :
  /// The name of the subscription filter.
  ///
  /// Parameter [logGroupName] :
  /// The name of the log group.
  Future<void> deleteSubscriptionFilter({
    required String filterName,
    required String logGroupName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.DeleteSubscriptionFilter'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'filterName': filterName,
        'logGroupName': logGroupName,
      },
    );
  }

  /// Deletes the log transformer for the specified log group. As soon as you do
  /// this, the transformation of incoming log events according to that
  /// transformer stops. If this account has an account-level transformer that
  /// applies to this log group, the log group begins using that account-level
  /// transformer when this log-group level transformer is deleted.
  ///
  /// After you delete a transformer, be sure to edit any metric filters or
  /// subscription filters that relied on the transformed versions of the log
  /// events.
  ///
  /// May throw [InvalidOperationException].
  /// May throw [InvalidParameterException].
  /// May throw [OperationAbortedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [logGroupIdentifier] :
  /// Specify either the name or ARN of the log group to delete the transformer
  /// for. If the log group is in a source account and you are using a
  /// monitoring account, you must use the log group ARN.
  Future<void> deleteTransformer({
    required String logGroupIdentifier,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.DeleteTransformer'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'logGroupIdentifier': logGroupIdentifier,
      },
    );
  }

  /// Returns a list of all CloudWatch Logs account policies in the account.
  ///
  /// To use this operation, you must be signed on with the correct permissions
  /// depending on the type of policy that you are retrieving information for.
  ///
  /// <ul>
  /// <li>
  /// To see data protection policies, you must have the
  /// <code>logs:GetDataProtectionPolicy</code> and
  /// <code>logs:DescribeAccountPolicies</code> permissions.
  /// </li>
  /// <li>
  /// To see subscription filter policies, you must have the
  /// <code>logs:DescribeSubscriptionFilters</code> and
  /// <code>logs:DescribeAccountPolicies</code> permissions.
  /// </li>
  /// <li>
  /// To see transformer policies, you must have the
  /// <code>logs:GetTransformer</code> and
  /// <code>logs:DescribeAccountPolicies</code> permissions.
  /// </li>
  /// <li>
  /// To see field index policies, you must have the
  /// <code>logs:DescribeIndexPolicies</code> and
  /// <code>logs:DescribeAccountPolicies</code> permissions.
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidParameterException].
  /// May throw [OperationAbortedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [policyType] :
  /// Use this parameter to limit the returned policies to only the policies
  /// that match the policy type that you specify.
  ///
  /// Parameter [accountIdentifiers] :
  /// If you are using an account that is set up as a monitoring account for
  /// CloudWatch unified cross-account observability, you can use this to
  /// specify the account ID of a source account. If you do, the operation
  /// returns the account policy for the specified account. Currently, you can
  /// specify only one account ID in this parameter.
  ///
  /// If you omit this parameter, only the policy in the current account is
  /// returned.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of items to return. (You received this token
  /// from a previous call.)
  ///
  /// Parameter [policyName] :
  /// Use this parameter to limit the returned policies to only the policy with
  /// the name that you specify.
  Future<DescribeAccountPoliciesResponse> describeAccountPolicies({
    required PolicyType policyType,
    List<String>? accountIdentifiers,
    String? nextToken,
    String? policyName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.DescribeAccountPolicies'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'policyType': policyType.value,
        if (accountIdentifiers != null)
          'accountIdentifiers': accountIdentifiers,
        if (nextToken != null) 'nextToken': nextToken,
        if (policyName != null) 'policyName': policyName,
      },
    );

    return DescribeAccountPoliciesResponse.fromJson(jsonResponse.body);
  }

  /// Use this operation to return the valid and default values that are used
  /// when creating delivery sources, delivery destinations, and deliveries. For
  /// more information about deliveries, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_CreateDelivery.html">CreateDelivery</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [deliveryDestinationTypes] :
  /// Use this parameter to filter the response to include only the
  /// configuration templates that apply to the delivery destination types that
  /// you specify here.
  ///
  /// Parameter [limit] :
  /// Use this parameter to limit the number of configuration templates that are
  /// returned in the response.
  ///
  /// Parameter [logTypes] :
  /// Use this parameter to filter the response to include only the
  /// configuration templates that apply to the log types that you specify here.
  ///
  /// Parameter [resourceTypes] :
  /// Use this parameter to filter the response to include only the
  /// configuration templates that apply to the resource types that you specify
  /// here.
  ///
  /// Parameter [service] :
  /// Use this parameter to filter the response to include only the
  /// configuration templates that apply to the Amazon Web Services service that
  /// you specify here.
  Future<DescribeConfigurationTemplatesResponse>
      describeConfigurationTemplates({
    List<DeliveryDestinationType>? deliveryDestinationTypes,
    int? limit,
    List<String>? logTypes,
    String? nextToken,
    List<String>? resourceTypes,
    String? service,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.DescribeConfigurationTemplates'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (deliveryDestinationTypes != null)
          'deliveryDestinationTypes':
              deliveryDestinationTypes.map((e) => e.value).toList(),
        if (limit != null) 'limit': limit,
        if (logTypes != null) 'logTypes': logTypes,
        if (nextToken != null) 'nextToken': nextToken,
        if (resourceTypes != null) 'resourceTypes': resourceTypes,
        if (service != null) 'service': service,
      },
    );

    return DescribeConfigurationTemplatesResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves a list of the deliveries that have been created in the account.
  ///
  /// A <i>delivery</i> is a connection between a <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliverySource.html">
  /// <i>delivery source</i> </a> and a <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestination.html">
  /// <i>delivery destination</i> </a>.
  ///
  /// A delivery source represents an Amazon Web Services resource that sends
  /// logs to an logs delivery destination. The destination can be CloudWatch
  /// Logs, Amazon S3, Firehose or X-Ray. Only some Amazon Web Services services
  /// support being configured as a delivery source. These services are listed
  /// in <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AWS-logs-and-resource-policy.html">Enable
  /// logging from Amazon Web Services services.</a>
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [limit] :
  /// Optionally specify the maximum number of deliveries to return in the
  /// response.
  Future<DescribeDeliveriesResponse> describeDeliveries({
    int? limit,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.DescribeDeliveries'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (limit != null) 'limit': limit,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return DescribeDeliveriesResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves a list of the delivery destinations that have been created in
  /// the account.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [limit] :
  /// Optionally specify the maximum number of delivery destinations to return
  /// in the response.
  Future<DescribeDeliveryDestinationsResponse> describeDeliveryDestinations({
    int? limit,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.DescribeDeliveryDestinations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (limit != null) 'limit': limit,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return DescribeDeliveryDestinationsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves a list of the delivery sources that have been created in the
  /// account.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [limit] :
  /// Optionally specify the maximum number of delivery sources to return in the
  /// response.
  Future<DescribeDeliverySourcesResponse> describeDeliverySources({
    int? limit,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.DescribeDeliverySources'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (limit != null) 'limit': limit,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return DescribeDeliverySourcesResponse.fromJson(jsonResponse.body);
  }

  /// Lists all your destinations. The results are ASCII-sorted by destination
  /// name.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [destinationNamePrefix] :
  /// The prefix to match. If you don't specify a value, no prefix filter is
  /// applied.
  ///
  /// Parameter [limit] :
  /// The maximum number of items returned. If you don't specify a value, the
  /// default maximum value of 50 items is used.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of items to return. (You received this token
  /// from a previous call.)
  Future<DescribeDestinationsResponse> describeDestinations({
    String? destinationNamePrefix,
    int? limit,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.DescribeDestinations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (destinationNamePrefix != null)
          'DestinationNamePrefix': destinationNamePrefix,
        if (limit != null) 'limit': limit,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return DescribeDestinationsResponse.fromJson(jsonResponse.body);
  }

  /// Lists the specified export tasks. You can list all your export tasks or
  /// filter the results based on task ID or task status.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [limit] :
  /// The maximum number of items returned. If you don't specify a value, the
  /// default is up to 50 items.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of items to return. (You received this token
  /// from a previous call.)
  ///
  /// Parameter [statusCode] :
  /// The status code of the export task. Specifying a status code filters the
  /// results to zero or more export tasks.
  ///
  /// Parameter [taskId] :
  /// The ID of the export task. Specifying a task ID filters the results to one
  /// or zero export tasks.
  Future<DescribeExportTasksResponse> describeExportTasks({
    int? limit,
    String? nextToken,
    ExportTaskStatusCode? statusCode,
    String? taskId,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.DescribeExportTasks'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (limit != null) 'limit': limit,
        if (nextToken != null) 'nextToken': nextToken,
        if (statusCode != null) 'statusCode': statusCode.value,
        if (taskId != null) 'taskId': taskId,
      },
    );

    return DescribeExportTasksResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of custom and default field indexes which are discovered in
  /// log data. For more information about field index policies, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutIndexPolicy.html">PutIndexPolicy</a>.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [LimitExceededException].
  /// May throw [OperationAbortedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [logGroupIdentifiers] :
  /// An array containing the names or ARNs of the log groups that you want to
  /// retrieve field indexes for.
  Future<DescribeFieldIndexesResponse> describeFieldIndexes({
    required List<String> logGroupIdentifiers,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.DescribeFieldIndexes'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'logGroupIdentifiers': logGroupIdentifiers,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return DescribeFieldIndexesResponse.fromJson(jsonResponse.body);
  }

  /// Gets detailed information about the individual batches within an import
  /// task, including their status and any error messages. For CloudTrail Event
  /// Data Store sources, a batch refers to a subset of stored events grouped by
  /// their eventTime.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidOperationException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [importId] :
  /// The ID of the import task to get batch information for.
  ///
  /// Parameter [batchImportStatus] :
  /// Optional filter to list import batches by their status. Accepts multiple
  /// status values: IN_PROGRESS, CANCELLED, COMPLETED and FAILED.
  ///
  /// Parameter [limit] :
  /// The maximum number of import batches to return in the response. Default:
  /// 10
  ///
  /// Parameter [nextToken] :
  /// The pagination token for the next set of results.
  Future<DescribeImportTaskBatchesResponse> describeImportTaskBatches({
    required String importId,
    List<ImportStatus>? batchImportStatus,
    int? limit,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.DescribeImportTaskBatches'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'importId': importId,
        if (batchImportStatus != null)
          'batchImportStatus': batchImportStatus.map((e) => e.value).toList(),
        if (limit != null) 'limit': limit,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return DescribeImportTaskBatchesResponse.fromJson(jsonResponse.body);
  }

  /// Lists and describes import tasks, with optional filtering by import status
  /// and source ARN.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidOperationException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [importId] :
  /// Optional filter to describe a specific import task by its ID.
  ///
  /// Parameter [importSourceArn] :
  /// Optional filter to list imports from a specific source
  ///
  /// Parameter [importStatus] :
  /// Optional filter to list imports by their status. Valid values are
  /// IN_PROGRESS, CANCELLED, COMPLETED and FAILED.
  ///
  /// Parameter [limit] :
  /// The maximum number of import tasks to return in the response. Default: 50
  ///
  /// Parameter [nextToken] :
  /// The pagination token for the next set of results.
  Future<DescribeImportTasksResponse> describeImportTasks({
    String? importId,
    String? importSourceArn,
    ImportStatus? importStatus,
    int? limit,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.DescribeImportTasks'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (importId != null) 'importId': importId,
        if (importSourceArn != null) 'importSourceArn': importSourceArn,
        if (importStatus != null) 'importStatus': importStatus.value,
        if (limit != null) 'limit': limit,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return DescribeImportTasksResponse.fromJson(jsonResponse.body);
  }

  /// Returns the field index policies of the specified log group. For more
  /// information about field index policies, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutIndexPolicy.html">PutIndexPolicy</a>.
  ///
  /// If a specified log group has a log-group level index policy, that policy
  /// is returned by this operation.
  ///
  /// If a specified log group doesn't have a log-group level index policy, but
  /// an account-wide index policy applies to it, that account-wide policy is
  /// returned by this operation.
  ///
  /// To find information about only account-level policies, use <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeAccountPolicies.html">DescribeAccountPolicies</a>
  /// instead.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [LimitExceededException].
  /// May throw [OperationAbortedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [logGroupIdentifiers] :
  /// An array containing the name or ARN of the log group that you want to
  /// retrieve field index policies for.
  Future<DescribeIndexPoliciesResponse> describeIndexPolicies({
    required List<String> logGroupIdentifiers,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.DescribeIndexPolicies'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'logGroupIdentifiers': logGroupIdentifiers,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return DescribeIndexPoliciesResponse.fromJson(jsonResponse.body);
  }

  /// Returns information about log groups, including data sources that ingest
  /// into each log group. You can return all your log groups or filter the
  /// results by prefix. The results are ASCII-sorted by log group name.
  ///
  /// CloudWatch Logs doesn't support IAM policies that control access to the
  /// <code>DescribeLogGroups</code> action by using the
  /// <code>aws:ResourceTag/<i>key-name</i> </code> condition key. Other
  /// CloudWatch Logs actions do support the use of the
  /// <code>aws:ResourceTag/<i>key-name</i> </code> condition key to control
  /// access. For more information about using tags to control access, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_tags.html">Controlling
  /// access to Amazon Web Services resources using tags</a>.
  ///
  /// If you are using CloudWatch cross-account observability, you can use this
  /// operation in a monitoring account and view data from the linked source
  /// accounts. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Unified-Cross-Account.html">CloudWatch
  /// cross-account observability</a>.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [accountIdentifiers] :
  /// When <code>includeLinkedAccounts</code> is set to <code>true</code>, use
  /// this parameter to specify the list of accounts to search. You can specify
  /// as many as 20 account IDs in the array.
  ///
  /// Parameter [includeLinkedAccounts] :
  /// If you are using a monitoring account, set this to <code>true</code> to
  /// have the operation return log groups in the accounts listed in
  /// <code>accountIdentifiers</code>.
  ///
  /// If this parameter is set to <code>true</code> and
  /// <code>accountIdentifiers</code> contains a null value, the operation
  /// returns all log groups in the monitoring account and all log groups in all
  /// source accounts that are linked to the monitoring account.
  ///
  /// The default for this parameter is <code>false</code>.
  ///
  /// Parameter [limit] :
  /// The maximum number of items returned. If you don't specify a value, the
  /// default is up to 50 items.
  ///
  /// Parameter [logGroupClass] :
  /// Use this parameter to limit the results to only those log groups in the
  /// specified log group class. If you omit this parameter, log groups of all
  /// classes can be returned.
  ///
  /// Specifies the log group class for this log group. There are three classes:
  ///
  /// <ul>
  /// <li>
  /// The <code>Standard</code> log class supports all CloudWatch Logs features.
  /// </li>
  /// <li>
  /// The <code>Infrequent Access</code> log class supports a subset of
  /// CloudWatch Logs features and incurs lower costs.
  /// </li>
  /// <li>
  /// Use the <code>Delivery</code> log class only for delivering Lambda logs to
  /// store in Amazon S3 or Amazon Data Firehose. Log events in log groups in
  /// the Delivery class are kept in CloudWatch Logs for only one day. This log
  /// class doesn't offer rich CloudWatch Logs capabilities such as CloudWatch
  /// Logs Insights queries.
  /// </li>
  /// </ul>
  /// For details about the features supported by each class, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch_Logs_Log_Classes.html">Log
  /// classes</a>
  ///
  /// Parameter [logGroupIdentifiers] :
  /// Use this array to filter the list of log groups returned. If you specify
  /// this parameter, the only other filter that you can choose to specify is
  /// <code>includeLinkedAccounts</code>.
  ///
  /// If you are using this operation in a monitoring account, you can specify
  /// the ARNs of log groups in source accounts and in the monitoring account
  /// itself. If you are using this operation in an account that is not a
  /// cross-account monitoring account, you can specify only log group names in
  /// the same account as the operation.
  ///
  /// Parameter [logGroupNamePattern] :
  /// If you specify a string for this parameter, the operation returns only log
  /// groups that have names that match the string based on a case-sensitive
  /// substring search. For example, if you specify <code>DataLogs</code>, log
  /// groups named <code>DataLogs</code>, <code>aws/DataLogs</code>, and
  /// <code>GroupDataLogs</code> would match, but <code>datalogs</code>,
  /// <code>Data/log/s</code> and <code>Groupdata</code> would not match.
  ///
  /// If you specify <code>logGroupNamePattern</code> in your request, then only
  /// <code>arn</code>, <code>creationTime</code>, and <code>logGroupName</code>
  /// are included in the response.
  /// <note>
  /// <code>logGroupNamePattern</code> and <code>logGroupNamePrefix</code> are
  /// mutually exclusive. Only one of these parameters can be passed.
  /// </note>
  ///
  /// Parameter [logGroupNamePrefix] :
  /// The prefix to match.
  /// <note>
  /// <code>logGroupNamePrefix</code> and <code>logGroupNamePattern</code> are
  /// mutually exclusive. Only one of these parameters can be passed.
  /// </note>
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of items to return. (You received this token
  /// from a previous call.)
  Future<DescribeLogGroupsResponse> describeLogGroups({
    List<String>? accountIdentifiers,
    bool? includeLinkedAccounts,
    int? limit,
    LogGroupClass? logGroupClass,
    List<String>? logGroupIdentifiers,
    String? logGroupNamePattern,
    String? logGroupNamePrefix,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.DescribeLogGroups'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (accountIdentifiers != null)
          'accountIdentifiers': accountIdentifiers,
        if (includeLinkedAccounts != null)
          'includeLinkedAccounts': includeLinkedAccounts,
        if (limit != null) 'limit': limit,
        if (logGroupClass != null) 'logGroupClass': logGroupClass.value,
        if (logGroupIdentifiers != null)
          'logGroupIdentifiers': logGroupIdentifiers,
        if (logGroupNamePattern != null)
          'logGroupNamePattern': logGroupNamePattern,
        if (logGroupNamePrefix != null)
          'logGroupNamePrefix': logGroupNamePrefix,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return DescribeLogGroupsResponse.fromJson(jsonResponse.body);
  }

  /// Lists the log streams for the specified log group. You can list all the
  /// log streams or filter the results by prefix. You can also control how the
  /// results are ordered.
  ///
  /// You can specify the log group to search by using either
  /// <code>logGroupIdentifier</code> or <code>logGroupName</code>. You must
  /// include one of these two parameters, but you can't include both.
  ///
  /// This operation has a limit of 25 transactions per second, after which
  /// transactions are throttled.
  ///
  /// If you are using CloudWatch cross-account observability, you can use this
  /// operation in a monitoring account and view data from the linked source
  /// accounts. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Unified-Cross-Account.html">CloudWatch
  /// cross-account observability</a>.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [descending] :
  /// If the value is true, results are returned in descending order. If the
  /// value is to false, results are returned in ascending order. The default
  /// value is false.
  ///
  /// Parameter [limit] :
  /// The maximum number of items returned. If you don't specify a value, the
  /// default is up to 50 items.
  ///
  /// Parameter [logGroupIdentifier] :
  /// Specify either the name or ARN of the log group to view. If the log group
  /// is in a source account and you are using a monitoring account, you must
  /// use the log group ARN.
  /// <note>
  /// You must include either <code>logGroupIdentifier</code> or
  /// <code>logGroupName</code>, but not both.
  /// </note>
  ///
  /// Parameter [logGroupName] :
  /// The name of the log group.
  /// <note>
  /// You must include either <code>logGroupIdentifier</code> or
  /// <code>logGroupName</code>, but not both.
  /// </note>
  ///
  /// Parameter [logStreamNamePrefix] :
  /// The prefix to match.
  ///
  /// If <code>orderBy</code> is <code>LastEventTime</code>, you cannot specify
  /// this parameter.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of items to return. (You received this token
  /// from a previous call.)
  ///
  /// Parameter [orderBy] :
  /// If the value is <code>LogStreamName</code>, the results are ordered by log
  /// stream name. If the value is <code>LastEventTime</code>, the results are
  /// ordered by the event time. The default value is
  /// <code>LogStreamName</code>.
  ///
  /// If you order the results by event time, you cannot specify the
  /// <code>logStreamNamePrefix</code> parameter.
  ///
  /// <code>lastEventTimestamp</code> represents the time of the most recent log
  /// event in the log stream in CloudWatch Logs. This number is expressed as
  /// the number of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>.
  /// <code>lastEventTimestamp</code> updates on an eventual consistency basis.
  /// It typically updates in less than an hour from ingestion, but in rare
  /// situations might take longer.
  Future<DescribeLogStreamsResponse> describeLogStreams({
    bool? descending,
    int? limit,
    String? logGroupIdentifier,
    String? logGroupName,
    String? logStreamNamePrefix,
    String? nextToken,
    OrderBy? orderBy,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.DescribeLogStreams'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (descending != null) 'descending': descending,
        if (limit != null) 'limit': limit,
        if (logGroupIdentifier != null)
          'logGroupIdentifier': logGroupIdentifier,
        if (logGroupName != null) 'logGroupName': logGroupName,
        if (logStreamNamePrefix != null)
          'logStreamNamePrefix': logStreamNamePrefix,
        if (nextToken != null) 'nextToken': nextToken,
        if (orderBy != null) 'orderBy': orderBy.value,
      },
    );

    return DescribeLogStreamsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves metadata about lookup tables in your account. You can optionally
  /// filter the results by table name prefix. Results are sorted by table name
  /// in ascending order.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [lookupTableNamePrefix] :
  /// A prefix to filter lookup tables by name. Only tables whose names start
  /// with this prefix are returned. If you don't specify a prefix, all tables
  /// in the account and Region are returned.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of lookup tables to return in the response. The default
  /// value is 50 and the maximum value is 100.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of items to return. (You received this token
  /// from a previous call.)
  Future<DescribeLookupTablesResponse> describeLookupTables({
    String? lookupTableNamePrefix,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.DescribeLookupTables'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (lookupTableNamePrefix != null)
          'lookupTableNamePrefix': lookupTableNamePrefix,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return DescribeLookupTablesResponse.fromJson(jsonResponse.body);
  }

  /// Lists the specified metric filters. You can list all of the metric filters
  /// or filter the results by log name, prefix, metric name, or metric
  /// namespace. The results are ASCII-sorted by filter name.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [filterNamePrefix] :
  /// The prefix to match. CloudWatch Logs uses the value that you set here only
  /// if you also include the <code>logGroupName</code> parameter in your
  /// request.
  ///
  /// Parameter [limit] :
  /// The maximum number of items returned. If you don't specify a value, the
  /// default is up to 50 items.
  ///
  /// Parameter [logGroupName] :
  /// The name of the log group.
  ///
  /// Parameter [metricName] :
  /// Filters results to include only those with the specified metric name. If
  /// you include this parameter in your request, you must also include the
  /// <code>metricNamespace</code> parameter.
  ///
  /// Parameter [metricNamespace] :
  /// Filters results to include only those in the specified namespace. If you
  /// include this parameter in your request, you must also include the
  /// <code>metricName</code> parameter.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of items to return. (You received this token
  /// from a previous call.)
  Future<DescribeMetricFiltersResponse> describeMetricFilters({
    String? filterNamePrefix,
    int? limit,
    String? logGroupName,
    String? metricName,
    String? metricNamespace,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.DescribeMetricFilters'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filterNamePrefix != null) 'filterNamePrefix': filterNamePrefix,
        if (limit != null) 'limit': limit,
        if (logGroupName != null) 'logGroupName': logGroupName,
        if (metricName != null) 'metricName': metricName,
        if (metricNamespace != null) 'metricNamespace': metricNamespace,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return DescribeMetricFiltersResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of CloudWatch Logs Insights queries that are scheduled,
  /// running, or have been run recently in this account. You can request all
  /// queries or limit it to queries of a specific log group or queries with a
  /// certain status.
  ///
  /// This operation includes both interactive queries started directly by users
  /// and automated queries executed by scheduled query configurations.
  /// Scheduled query executions appear in the results alongside manually
  /// initiated queries, providing visibility into all query activity in your
  /// account.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [logGroupName] :
  /// Limits the returned queries to only those for the specified log group.
  ///
  /// Parameter [maxResults] :
  /// Limits the number of returned queries to the specified number.
  ///
  /// Parameter [queryLanguage] :
  /// Limits the returned queries to only the queries that use the specified
  /// query language.
  ///
  /// Parameter [status] :
  /// Limits the returned queries to only those that have the specified status.
  /// Valid values are <code>Cancelled</code>, <code>Complete</code>,
  /// <code>Failed</code>, <code>Running</code>, and <code>Scheduled</code>.
  Future<DescribeQueriesResponse> describeQueries({
    String? logGroupName,
    int? maxResults,
    String? nextToken,
    QueryLanguage? queryLanguage,
    QueryStatus? status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.DescribeQueries'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (logGroupName != null) 'logGroupName': logGroupName,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (queryLanguage != null) 'queryLanguage': queryLanguage.value,
        if (status != null) 'status': status.value,
      },
    );

    return DescribeQueriesResponse.fromJson(jsonResponse.body);
  }

  /// This operation returns a paginated list of your saved CloudWatch Logs
  /// Insights query definitions. You can retrieve query definitions from the
  /// current account or from a source account that is linked to the current
  /// account.
  ///
  /// You can use the <code>queryDefinitionNamePrefix</code> parameter to limit
  /// the results to only the query definitions that have names that start with
  /// a certain string.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [maxResults] :
  /// Limits the number of returned query definitions to the specified number.
  ///
  /// Parameter [queryDefinitionNamePrefix] :
  /// Use this parameter to filter your results to only the query definitions
  /// that have names that start with the prefix you specify.
  ///
  /// Parameter [queryLanguage] :
  /// The query language used for this query. For more information about the
  /// query languages that CloudWatch Logs supports, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_AnalyzeLogData_Languages.html">Supported
  /// query languages</a>.
  Future<DescribeQueryDefinitionsResponse> describeQueryDefinitions({
    int? maxResults,
    String? nextToken,
    String? queryDefinitionNamePrefix,
    QueryLanguage? queryLanguage,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.DescribeQueryDefinitions'
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
        if (queryDefinitionNamePrefix != null)
          'queryDefinitionNamePrefix': queryDefinitionNamePrefix,
        if (queryLanguage != null) 'queryLanguage': queryLanguage.value,
      },
    );

    return DescribeQueryDefinitionsResponse.fromJson(jsonResponse.body);
  }

  /// Lists the resource policies in this account.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [limit] :
  /// The maximum number of resource policies to be displayed with one call of
  /// this API.
  ///
  /// Parameter [policyScope] :
  /// Specifies the scope of the resource policy. Valid values are
  /// <code>ACCOUNT</code> or <code>RESOURCE</code>. When not specified,
  /// defaults to <code>ACCOUNT</code>.
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the CloudWatch Logs resource for which to query the resource
  /// policy.
  Future<DescribeResourcePoliciesResponse> describeResourcePolicies({
    int? limit,
    String? nextToken,
    PolicyScope? policyScope,
    String? resourceArn,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.DescribeResourcePolicies'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (limit != null) 'limit': limit,
        if (nextToken != null) 'nextToken': nextToken,
        if (policyScope != null) 'policyScope': policyScope.value,
        if (resourceArn != null) 'resourceArn': resourceArn,
      },
    );

    return DescribeResourcePoliciesResponse.fromJson(jsonResponse.body);
  }

  /// Lists the subscription filters for the specified log group. You can list
  /// all the subscription filters or filter the results by prefix. The results
  /// are ASCII-sorted by filter name.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [logGroupName] :
  /// The name of the log group.
  ///
  /// Parameter [filterNamePrefix] :
  /// The prefix to match. If you don't specify a value, no prefix filter is
  /// applied.
  ///
  /// Parameter [limit] :
  /// The maximum number of items returned. If you don't specify a value, the
  /// default is up to 50 items.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of items to return. (You received this token
  /// from a previous call.)
  Future<DescribeSubscriptionFiltersResponse> describeSubscriptionFilters({
    required String logGroupName,
    String? filterNamePrefix,
    int? limit,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.DescribeSubscriptionFilters'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'logGroupName': logGroupName,
        if (filterNamePrefix != null) 'filterNamePrefix': filterNamePrefix,
        if (limit != null) 'limit': limit,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return DescribeSubscriptionFiltersResponse.fromJson(jsonResponse.body);
  }

  /// Disassociates the specified KMS key from the specified log group or from
  /// all CloudWatch Logs Insights query results in the account.
  ///
  /// When you use <code>DisassociateKmsKey</code>, you specify either the
  /// <code>logGroupName</code> parameter or the <code>resourceIdentifier</code>
  /// parameter. You can't specify both of those parameters in the same
  /// operation.
  ///
  /// <ul>
  /// <li>
  /// Specify the <code>logGroupName</code> parameter to stop using the KMS key
  /// to encrypt future log events ingested and stored in the log group.
  /// Instead, they will be encrypted with the default CloudWatch Logs method.
  /// The log events that were ingested while the key was associated with the
  /// log group are still encrypted with that key. Therefore, CloudWatch Logs
  /// will need permissions for the key whenever that data is accessed.
  /// </li>
  /// <li>
  /// Specify the <code>resourceIdentifier</code> parameter with the
  /// <code>query-result</code> resource to stop using the KMS key to encrypt
  /// the results of all future <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_StartQuery.html">StartQuery</a>
  /// operations in the account. They will instead be encrypted with the default
  /// CloudWatch Logs method. The results from queries that ran while the key
  /// was associated with the account are still encrypted with that key.
  /// Therefore, CloudWatch Logs will need permissions for the key whenever that
  /// data is accessed.
  /// </li>
  /// </ul>
  /// It can take up to 5 minutes for this operation to take effect.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [OperationAbortedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [logGroupName] :
  /// The name of the log group.
  ///
  /// In your <code>DisassociateKmsKey</code> operation, you must specify either
  /// the <code>resourceIdentifier</code> parameter or the <code>logGroup</code>
  /// parameter, but you can't specify both.
  ///
  /// Parameter [resourceIdentifier] :
  /// Specifies the target for this operation. You must specify one of the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// Specify the ARN of a log group to stop having CloudWatch Logs use the KMS
  /// key to encrypt log events that are ingested and stored by that log group.
  /// After you run this operation, CloudWatch Logs encrypts ingested log events
  /// with the default CloudWatch Logs method. The log group ARN must be in the
  /// following format. Replace <i>REGION</i> and <i>ACCOUNT_ID</i> with your
  /// Region and account ID.
  ///
  /// <code>arn:aws:logs:<i>REGION</i>:<i>ACCOUNT_ID</i>:log-group:<i>LOG_GROUP_NAME</i>
  /// </code>
  /// </li>
  /// <li>
  /// Specify the following ARN to stop using this key to encrypt the results of
  /// future <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_StartQuery.html">StartQuery</a>
  /// operations in this account. Replace <i>REGION</i> and <i>ACCOUNT_ID</i>
  /// with your Region and account ID.
  ///
  /// <code>arn:aws:logs:<i>REGION</i>:<i>ACCOUNT_ID</i>:query-result:*</code>
  /// </li>
  /// </ul>
  /// In your <code>DisssociateKmsKey</code> operation, you must specify either
  /// the <code>resourceIdentifier</code> parameter or the <code>logGroup</code>
  /// parameter, but you can't specify both.
  Future<void> disassociateKmsKey({
    String? logGroupName,
    String? resourceIdentifier,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.DisassociateKmsKey'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (logGroupName != null) 'logGroupName': logGroupName,
        if (resourceIdentifier != null)
          'resourceIdentifier': resourceIdentifier,
      },
    );
  }

  /// Disassociates a data source from an S3 Table Integration, removing query
  /// access and deleting all associated data from the integration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identifier] :
  /// The unique identifier of the association to remove between the data source
  /// and S3 Table Integration.
  Future<DisassociateSourceFromS3TableIntegrationResponse>
      disassociateSourceFromS3TableIntegration({
    required String identifier,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.DisassociateSourceFromS3TableIntegration'
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

    return DisassociateSourceFromS3TableIntegrationResponse.fromJson(
        jsonResponse.body);
  }

  /// Lists log events from the specified log group. You can list all the log
  /// events or filter the results using one or more of the following:
  ///
  /// <ul>
  /// <li>
  /// A filter pattern
  /// </li>
  /// <li>
  /// A time range
  /// </li>
  /// <li>
  /// The log stream name, or a log stream name prefix that matches multiple log
  /// streams
  /// </li>
  /// </ul>
  /// You must have the <code>logs:FilterLogEvents</code> permission to perform
  /// this operation.
  ///
  /// You can specify the log group to search by using either
  /// <code>logGroupIdentifier</code> or <code>logGroupName</code>. You must
  /// include one of these two parameters, but you can't include both.
  ///
  /// <code>FilterLogEvents</code> is a paginated operation. Each page returned
  /// can contain up to 1 MB of log events or up to 10,000 log events. A
  /// returned page might only be partially full, or even empty. For example, if
  /// the result of a query would return 15,000 log events, the first page isn't
  /// guaranteed to have 10,000 log events even if they all fit into 1 MB.
  ///
  /// Partially full or empty pages don't necessarily mean that pagination is
  /// finished. If the results include a <code>nextToken</code>, there might be
  /// more log events available. You can return these additional log events by
  /// providing the nextToken in a subsequent <code>FilterLogEvents</code>
  /// operation. If the results don't include a <code>nextToken</code>, then
  /// pagination is finished.
  ///
  /// Specifying the <code>limit</code> parameter only guarantees that a single
  /// page doesn't return more log events than the specified limit, but it might
  /// return fewer events than the limit. This is the expected API behavior.
  ///
  /// The returned log events are sorted by event timestamp, the timestamp when
  /// the event was ingested by CloudWatch Logs, and the ID of the
  /// <code>PutLogEvents</code> request.
  ///
  /// If you are using CloudWatch cross-account observability, you can use this
  /// operation in a monitoring account and view data from the linked source
  /// accounts. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Unified-Cross-Account.html">CloudWatch
  /// cross-account observability</a>.
  /// <note>
  /// If you are using <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html">log
  /// transformation</a>, the <code>FilterLogEvents</code> operation returns
  /// only the original versions of log events, before they were transformed. To
  /// view the transformed versions, you must use a <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AnalyzingLogData.html">CloudWatch
  /// Logs query.</a>
  /// </note>
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [endTime] :
  /// The end of the time range, expressed as the number of milliseconds after
  /// <code>Jan 1, 1970 00:00:00 UTC</code>. Events with a timestamp later than
  /// this time are not returned.
  ///
  /// Parameter [filterPattern] :
  /// The filter pattern to use. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/FilterAndPatternSyntax.html">Filter
  /// and Pattern Syntax</a>.
  ///
  /// If not provided, all the events are matched.
  ///
  /// Parameter [interleaved] :
  /// If the value is true, the operation attempts to provide responses that
  /// contain events from multiple log streams within the log group, interleaved
  /// in a single response. If the value is false, all the matched log events in
  /// the first log stream are searched first, then those in the next log
  /// stream, and so on.
  ///
  /// <b>Important</b> As of June 17, 2019, this parameter is ignored and the
  /// value is assumed to be true. The response from this operation always
  /// interleaves events from multiple log streams within a log group.
  ///
  /// Parameter [limit] :
  /// The maximum number of events to return. The default is 10,000 events.
  ///
  /// Parameter [logGroupIdentifier] :
  /// Specify either the name or ARN of the log group to view log events from.
  /// If the log group is in a source account and you are using a monitoring
  /// account, you must use the log group ARN.
  /// <note>
  /// You must include either <code>logGroupIdentifier</code> or
  /// <code>logGroupName</code>, but not both.
  /// </note>
  ///
  /// Parameter [logGroupName] :
  /// The name of the log group to search.
  /// <note>
  /// You must include either <code>logGroupIdentifier</code> or
  /// <code>logGroupName</code>, but not both.
  /// </note>
  ///
  /// Parameter [logStreamNamePrefix] :
  /// Filters the results to include only events from log streams that have
  /// names starting with this prefix.
  ///
  /// If you specify a value for both <code>logStreamNamePrefix</code> and
  /// <code>logStreamNames</code>, the action returns an
  /// <code>InvalidParameterException</code> error.
  ///
  /// Parameter [logStreamNames] :
  /// Filters the results to only logs from the log streams in this list.
  ///
  /// If you specify a value for both <code>logStreamNames</code> and
  /// <code>logStreamNamePrefix</code>, the action returns an
  /// <code>InvalidParameterException</code> error.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of events to return. (You received this token
  /// from a previous call.)
  ///
  /// Parameter [startTime] :
  /// The start of the time range, expressed as the number of milliseconds after
  /// <code>Jan 1, 1970 00:00:00 UTC</code>. Events with a timestamp before this
  /// time are not returned.
  ///
  /// Parameter [unmask] :
  /// Specify <code>true</code> to display the log event fields with all
  /// sensitive data unmasked and visible. The default is <code>false</code>.
  ///
  /// To use this operation with this parameter, you must be signed into an
  /// account with the <code>logs:Unmask</code> permission.
  Future<FilterLogEventsResponse> filterLogEvents({
    int? endTime,
    String? filterPattern,
    bool? interleaved,
    int? limit,
    String? logGroupIdentifier,
    String? logGroupName,
    String? logStreamNamePrefix,
    List<String>? logStreamNames,
    String? nextToken,
    int? startTime,
    bool? unmask,
  }) async {
    _s.validateNumRange(
      'endTime',
      endTime,
      0,
      1152921504606846976,
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      10000,
    );
    _s.validateNumRange(
      'startTime',
      startTime,
      0,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.FilterLogEvents'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (endTime != null) 'endTime': endTime,
        if (filterPattern != null) 'filterPattern': filterPattern,
        if (interleaved != null) 'interleaved': interleaved,
        if (limit != null) 'limit': limit,
        if (logGroupIdentifier != null)
          'logGroupIdentifier': logGroupIdentifier,
        if (logGroupName != null) 'logGroupName': logGroupName,
        if (logStreamNamePrefix != null)
          'logStreamNamePrefix': logStreamNamePrefix,
        if (logStreamNames != null) 'logStreamNames': logStreamNames,
        if (nextToken != null) 'nextToken': nextToken,
        if (startTime != null) 'startTime': startTime,
        if (unmask != null) 'unmask': unmask,
      },
    );

    return FilterLogEventsResponse.fromJson(jsonResponse.body);
  }

  /// Returns information about a log group data protection policy.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [OperationAbortedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [logGroupIdentifier] :
  /// The name or ARN of the log group that contains the data protection policy
  /// that you want to see.
  Future<GetDataProtectionPolicyResponse> getDataProtectionPolicy({
    required String logGroupIdentifier,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.GetDataProtectionPolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'logGroupIdentifier': logGroupIdentifier,
      },
    );

    return GetDataProtectionPolicyResponse.fromJson(jsonResponse.body);
  }

  /// Returns complete information about one logical <i>delivery</i>. A delivery
  /// is a connection between a <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliverySource.html">
  /// <i>delivery source</i> </a> and a <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestination.html">
  /// <i>delivery destination</i> </a>.
  ///
  /// A delivery source represents an Amazon Web Services resource that sends
  /// logs to an logs delivery destination. The destination can be CloudWatch
  /// Logs, Amazon S3, or Firehose. Only some Amazon Web Services services
  /// support being configured as a delivery source. These services are listed
  /// in <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AWS-logs-and-resource-policy.html">Enable
  /// logging from Amazon Web Services services.</a>
  ///
  /// You need to specify the delivery <code>id</code> in this operation. You
  /// can find the IDs of the deliveries in your account with the <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeDeliveries.html">DescribeDeliveries</a>
  /// operation.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [id] :
  /// The ID of the delivery that you want to retrieve.
  Future<GetDeliveryResponse> getDelivery({
    required String id,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.GetDelivery'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'id': id,
      },
    );

    return GetDeliveryResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves complete information about one delivery destination.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the delivery destination that you want to retrieve.
  Future<GetDeliveryDestinationResponse> getDeliveryDestination({
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.GetDeliveryDestination'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
      },
    );

    return GetDeliveryDestinationResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the delivery destination policy assigned to the delivery
  /// destination that you specify. For more information about delivery
  /// destinations and their policies, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestinationPolicy.html">PutDeliveryDestinationPolicy</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ValidationException].
  ///
  /// Parameter [deliveryDestinationName] :
  /// The name of the delivery destination that you want to retrieve the policy
  /// of.
  Future<GetDeliveryDestinationPolicyResponse> getDeliveryDestinationPolicy({
    required String deliveryDestinationName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.GetDeliveryDestinationPolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'deliveryDestinationName': deliveryDestinationName,
      },
    );

    return GetDeliveryDestinationPolicyResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves complete information about one delivery source.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the delivery source that you want to retrieve.
  Future<GetDeliverySourceResponse> getDeliverySource({
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.GetDeliverySource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
      },
    );

    return GetDeliverySourceResponse.fromJson(jsonResponse.body);
  }

  /// Returns information about one integration between CloudWatch Logs and
  /// OpenSearch Service.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [integrationName] :
  /// The name of the integration that you want to find information about. To
  /// find the name of your integration, use <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_ListIntegrations.html">ListIntegrations</a>
  Future<GetIntegrationResponse> getIntegration({
    required String integrationName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.GetIntegration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'integrationName': integrationName,
      },
    );

    return GetIntegrationResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves information about the log anomaly detector that you specify. The
  /// KMS key ARN detected is valid.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [OperationAbortedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [anomalyDetectorArn] :
  /// The ARN of the anomaly detector to retrieve information about. You can
  /// find the ARNs of log anomaly detectors in your account by using the <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_ListLogAnomalyDetectors.html">ListLogAnomalyDetectors</a>
  /// operation.
  Future<GetLogAnomalyDetectorResponse> getLogAnomalyDetector({
    required String anomalyDetectorArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.GetLogAnomalyDetector'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'anomalyDetectorArn': anomalyDetectorArn,
      },
    );

    return GetLogAnomalyDetectorResponse.fromJson(jsonResponse.body);
  }

  /// Lists log events from the specified log stream. You can list all of the
  /// log events or filter using a time range.
  ///
  /// <code>GetLogEvents</code> is a paginated operation. Each page returned can
  /// contain up to 1 MB of log events or up to 10,000 log events. A returned
  /// page might only be partially full, or even empty. For example, if the
  /// result of a query would return 15,000 log events, the first page isn't
  /// guaranteed to have 10,000 log events even if they all fit into 1 MB.
  ///
  /// Partially full or empty pages don't necessarily mean that pagination is
  /// finished. As long as the <code>nextBackwardToken</code> or
  /// <code>nextForwardToken</code> returned is NOT equal to the
  /// <code>nextToken</code> that you passed into the API call, there might be
  /// more log events available. The token that you use depends on the direction
  /// you want to move in along the log stream. The returned tokens are never
  /// null.
  /// <note>
  /// If you set <code>startFromHead</code> to <code>true</code> and you don’t
  /// include <code>endTime</code> in your request, you can end up in a
  /// situation where the pagination doesn't terminate. This can happen when the
  /// new log events are being added to the target log streams faster than they
  /// are being read. This situation is a good use case for the CloudWatch Logs
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatchLogs_LiveTail.html">Live
  /// Tail</a> feature.
  /// </note>
  /// If you are using CloudWatch cross-account observability, you can use this
  /// operation in a monitoring account and view data from the linked source
  /// accounts. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Unified-Cross-Account.html">CloudWatch
  /// cross-account observability</a>.
  ///
  /// You can specify the log group to search by using either
  /// <code>logGroupIdentifier</code> or <code>logGroupName</code>. You must
  /// include one of these two parameters, but you can't include both.
  /// <note>
  /// If you are using <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html">log
  /// transformation</a>, the <code>GetLogEvents</code> operation returns only
  /// the original versions of log events, before they were transformed. To view
  /// the transformed versions, you must use a <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AnalyzingLogData.html">CloudWatch
  /// Logs query.</a>
  /// </note>
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [logStreamName] :
  /// The name of the log stream.
  ///
  /// Parameter [endTime] :
  /// The end of the time range, expressed as the number of milliseconds after
  /// <code>Jan 1, 1970 00:00:00 UTC</code>. Events with a timestamp equal to or
  /// later than this time are not included.
  ///
  /// Parameter [limit] :
  /// The maximum number of log events returned. If you don't specify a limit,
  /// the default is as many log events as can fit in a response size of 1 MB
  /// (up to 10,000 log events).
  ///
  /// Parameter [logGroupIdentifier] :
  /// Specify either the name or ARN of the log group to view events from. If
  /// the log group is in a source account and you are using a monitoring
  /// account, you must use the log group ARN.
  /// <note>
  /// You must include either <code>logGroupIdentifier</code> or
  /// <code>logGroupName</code>, but not both.
  /// </note>
  ///
  /// Parameter [logGroupName] :
  /// The name of the log group.
  /// <note>
  /// You must include either <code>logGroupIdentifier</code> or
  /// <code>logGroupName</code>, but not both.
  /// </note>
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of items to return. (You received this token
  /// from a previous call.)
  ///
  /// Parameter [startFromHead] :
  /// If the value is true, the earliest log events are returned first. If the
  /// value is false, the latest log events are returned first. The default
  /// value is false.
  ///
  /// If you are using a previous <code>nextForwardToken</code> value as the
  /// <code>nextToken</code> in this operation, you must specify
  /// <code>true</code> for <code>startFromHead</code>.
  ///
  /// Parameter [startTime] :
  /// The start of the time range, expressed as the number of milliseconds after
  /// <code>Jan 1, 1970 00:00:00 UTC</code>. Events with a timestamp equal to
  /// this time or later than this time are included. Events with a timestamp
  /// earlier than this time are not included.
  ///
  /// Parameter [unmask] :
  /// Specify <code>true</code> to display the log event fields with all
  /// sensitive data unmasked and visible. The default is <code>false</code>.
  ///
  /// To use this operation with this parameter, you must be signed into an
  /// account with the <code>logs:Unmask</code> permission.
  Future<GetLogEventsResponse> getLogEvents({
    required String logStreamName,
    int? endTime,
    int? limit,
    String? logGroupIdentifier,
    String? logGroupName,
    String? nextToken,
    bool? startFromHead,
    int? startTime,
    bool? unmask,
  }) async {
    _s.validateNumRange(
      'endTime',
      endTime,
      0,
      1152921504606846976,
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      10000,
    );
    _s.validateNumRange(
      'startTime',
      startTime,
      0,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.GetLogEvents'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'logStreamName': logStreamName,
        if (endTime != null) 'endTime': endTime,
        if (limit != null) 'limit': limit,
        if (logGroupIdentifier != null)
          'logGroupIdentifier': logGroupIdentifier,
        if (logGroupName != null) 'logGroupName': logGroupName,
        if (nextToken != null) 'nextToken': nextToken,
        if (startFromHead != null) 'startFromHead': startFromHead,
        if (startTime != null) 'startTime': startTime,
        if (unmask != null) 'unmask': unmask,
      },
    );

    return GetLogEventsResponse.fromJson(jsonResponse.body);
  }

  /// Discovers available fields for a specific data source and type. The
  /// response includes any field modifications introduced through pipelines,
  /// such as new fields or changed field types.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [OperationAbortedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [dataSourceName] :
  /// The name of the data source to retrieve log fields for.
  ///
  /// Parameter [dataSourceType] :
  /// The type of the data source to retrieve log fields for.
  Future<GetLogFieldsResponse> getLogFields({
    required String dataSourceName,
    required String dataSourceType,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.GetLogFields'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'dataSourceName': dataSourceName,
        'dataSourceType': dataSourceType,
      },
    );

    return GetLogFieldsResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of the fields that are included in log events in the
  /// specified log group. Includes the percentage of log events that contain
  /// each field. The search is limited to a time period that you specify.
  ///
  /// This operation is used for discovering fields within log group events. For
  /// discovering fields across data sources, use the GetLogFields operation.
  ///
  /// You can specify the log group to search by using either
  /// <code>logGroupIdentifier</code> or <code>logGroupName</code>. You must
  /// specify one of these parameters, but you can't specify both.
  ///
  /// In the results, fields that start with <code>@</code> are fields generated
  /// by CloudWatch Logs. For example, <code>@timestamp</code> is the timestamp
  /// of each log event. For more information about the fields that are
  /// generated by CloudWatch logs, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_AnalyzeLogData-discoverable-fields.html">Supported
  /// Logs and Discovered Fields</a>.
  ///
  /// The response results are sorted by the frequency percentage, starting with
  /// the highest percentage.
  ///
  /// If you are using CloudWatch cross-account observability, you can use this
  /// operation in a monitoring account and view data from the linked source
  /// accounts. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Unified-Cross-Account.html">CloudWatch
  /// cross-account observability</a>.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [logGroupIdentifier] :
  /// Specify either the name or ARN of the log group to view. If the log group
  /// is in a source account and you are using a monitoring account, you must
  /// specify the ARN.
  /// <note>
  /// You must include either <code>logGroupIdentifier</code> or
  /// <code>logGroupName</code>, but not both.
  /// </note>
  ///
  /// Parameter [logGroupName] :
  /// The name of the log group to search.
  /// <note>
  /// You must include either <code>logGroupIdentifier</code> or
  /// <code>logGroupName</code>, but not both.
  /// </note>
  ///
  /// Parameter [time] :
  /// The time to set as the center of the query. If you specify
  /// <code>time</code>, the 8 minutes before and 8 minutes after this time are
  /// searched. If you omit <code>time</code>, the most recent 15 minutes up to
  /// the current time are searched.
  ///
  /// The <code>time</code> value is specified as epoch time, which is the
  /// number of seconds since <code>January 1, 1970, 00:00:00 UTC</code>.
  Future<GetLogGroupFieldsResponse> getLogGroupFields({
    String? logGroupIdentifier,
    String? logGroupName,
    int? time,
  }) async {
    _s.validateNumRange(
      'time',
      time,
      0,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.GetLogGroupFields'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (logGroupIdentifier != null)
          'logGroupIdentifier': logGroupIdentifier,
        if (logGroupName != null) 'logGroupName': logGroupName,
        if (time != null) 'time': time,
      },
    );

    return GetLogGroupFieldsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves a large logging object (LLO) and streams it back. This API is
  /// used to fetch the content of large portions of log events that have been
  /// ingested through the PutOpenTelemetryLogs API. When log events contain
  /// fields that would cause the total event size to exceed 1MB, CloudWatch
  /// Logs automatically processes up to 10 fields, starting with the largest
  /// fields. Each field is truncated as needed to keep the total event size as
  /// close to 1MB as possible. The excess portions are stored as Large Log
  /// Objects (LLOs) and these fields are processed separately and LLO reference
  /// system fields (in the format <code>@ptr.$[path.to.field]</code>) are
  /// added. The path in the reference field reflects the original JSON
  /// structure where the large field was located. For example, this could be
  /// <code>@ptr.$['input']['message']</code>,
  /// <code>@ptr.$['AAA']['BBB']['CCC']['DDD']</code>,
  /// <code>@ptr.$['AAA']</code>, or any other path matching your log structure.
  /// <note>
  /// The <code>GetLogObject</code> API routes requests using SDK host prefix
  /// injection. SDK versions released before April 1, 2026 route to
  /// <code>streaming-logs.<i>Region</i>.amazonaws.com</code>, which does not
  /// support VPC endpoints. SDK versions released on or after April 1, 2026
  /// route to <code>stream-logs.<i>Region</i>.amazonaws.com</code>, which
  /// supports VPC endpoints. To set up a VPC endpoint for this API, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/cloudwatch-logs-and-interface-VPC.html#create-VPC-endpoint-for-CloudWatchLogs">Creating
  /// a VPC endpoint for CloudWatch Logs </a>.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidOperationException].
  /// May throw [InvalidParameterException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [logObjectPointer] :
  /// A pointer to the specific log object to retrieve. This is a required
  /// parameter that uniquely identifies the log object within CloudWatch Logs.
  /// The pointer is typically obtained from a previous query or filter
  /// operation.
  ///
  /// Parameter [unmask] :
  /// A boolean flag that indicates whether to unmask sensitive log data. When
  /// set to true, any masked or redacted data in the log object will be
  /// displayed in its original form. Default is false.
  Future<GetLogObjectResponse> getLogObject({
    required String logObjectPointer,
    bool? unmask,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.GetLogObject'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'logObjectPointer': logObjectPointer,
        if (unmask != null) 'unmask': unmask,
      },
    );

    return GetLogObjectResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves all of the fields and values of a single log event. All fields
  /// are retrieved, even if the original query that produced the
  /// <code>logRecordPointer</code> retrieved only a subset of fields. Fields
  /// are returned as field name/field value pairs.
  ///
  /// The full unparsed log event is returned within <code>@message</code>.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [logRecordPointer] :
  /// The pointer corresponding to the log event record you want to retrieve.
  /// You get this from the response of a <code>GetQueryResults</code>
  /// operation. In that response, the value of the <code>@ptr</code> field for
  /// a log event is the value to use as <code>logRecordPointer</code> to
  /// retrieve that complete log event record.
  ///
  /// Parameter [unmask] :
  /// Specify <code>true</code> to display the log event fields with all
  /// sensitive data unmasked and visible. The default is <code>false</code>.
  ///
  /// To use this operation with this parameter, you must be signed into an
  /// account with the <code>logs:Unmask</code> permission.
  Future<GetLogRecordResponse> getLogRecord({
    required String logRecordPointer,
    bool? unmask,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.GetLogRecord'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'logRecordPointer': logRecordPointer,
        if (unmask != null) 'unmask': unmask,
      },
    );

    return GetLogRecordResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the full content of a lookup table, including the CSV data.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [lookupTableArn] :
  /// The ARN of the lookup table to retrieve.
  Future<GetLookupTableResponse> getLookupTable({
    required String lookupTableArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.GetLookupTable'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'lookupTableArn': lookupTableArn,
      },
    );

    return GetLookupTableResponse.fromJson(jsonResponse.body);
  }

  /// Returns the results from the specified query.
  ///
  /// Only the fields requested in the query are returned, along with a
  /// <code>@ptr</code> field, which is the identifier for the log record. You
  /// can use the value of <code>@ptr</code> in a <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_GetLogRecord.html">GetLogRecord</a>
  /// operation to get the full log record.
  ///
  /// <code>GetQueryResults</code> does not start running a query. To run a
  /// query, use <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_StartQuery.html">StartQuery</a>.
  /// For more information about how long results of previous queries are
  /// available, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/cloudwatch_limits_cwl.html">CloudWatch
  /// Logs quotas</a>.
  ///
  /// If the value of the <code>Status</code> field in the output is
  /// <code>Running</code>, this operation returns only partial results. If you
  /// see a value of <code>Scheduled</code> or <code>Running</code> for the
  /// status, you can retry the operation later to see the final results.
  ///
  /// This operation is used both for retrieving results from interactive
  /// queries and from automated scheduled query executions. Scheduled queries
  /// use <code>GetQueryResults</code> internally to retrieve query results for
  /// processing and delivery to configured destinations.
  ///
  /// You can retrieve up to 100,000 log event results from a query, if
  /// available, by using pagination. Use the <code>nextToken</code> returned in
  /// the response to request additional pages of results, with each page
  /// returning up to 10,000 log events.
  ///
  /// If you are using CloudWatch cross-account observability, you can use this
  /// operation in a monitoring account to start queries in linked source
  /// accounts. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Unified-Cross-Account.html">CloudWatch
  /// cross-account observability</a>.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [queryId] :
  /// The ID number of the query.
  ///
  /// Parameter [maxItems] :
  /// The maximum number of log events to return in the response. The maximum is
  /// 10,000 log events per request. You can retrieve up to 100,000 log event
  /// results from a query by paginating with the <code>nextToken</code>.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of items to return. The token expires after 1
  /// hour.
  Future<GetQueryResultsResponse> getQueryResults({
    required String queryId,
    int? maxItems,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxItems',
      maxItems,
      0,
      10000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.GetQueryResults'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'queryId': queryId,
        if (maxItems != null) 'maxItems': maxItems,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return GetQueryResultsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves details about a specific scheduled query, including its
  /// configuration, execution status, and metadata.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identifier] :
  /// The ARN or name of the scheduled query to retrieve.
  Future<GetScheduledQueryResponse> getScheduledQuery({
    required String identifier,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.GetScheduledQuery'
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

    return GetScheduledQueryResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the execution history of a scheduled query within a specified
  /// time range, including query results and destination processing status.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [endTime] :
  /// The end time for the history query in Unix epoch format.
  ///
  /// Parameter [identifier] :
  /// The ARN or name of the scheduled query to retrieve history for.
  ///
  /// Parameter [startTime] :
  /// The start time for the history query in Unix epoch format.
  ///
  /// Parameter [executionStatuses] :
  /// An array of execution statuses to filter the history results. Only
  /// executions with the specified statuses are returned.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of history records to return. Valid range is 1 to 1000.
  Future<GetScheduledQueryHistoryResponse> getScheduledQueryHistory({
    required int endTime,
    required String identifier,
    required int startTime,
    List<ExecutionStatus>? executionStatuses,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'endTime',
      endTime,
      0,
      1152921504606846976,
      isRequired: true,
    );
    _s.validateNumRange(
      'startTime',
      startTime,
      0,
      1152921504606846976,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.GetScheduledQueryHistory'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'endTime': endTime,
        'identifier': identifier,
        'startTime': startTime,
        if (executionStatuses != null)
          'executionStatuses': executionStatuses.map((e) => e.value).toList(),
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return GetScheduledQueryHistoryResponse.fromJson(jsonResponse.body);
  }

  /// Returns the information about the log transformer associated with this log
  /// group.
  ///
  /// This operation returns data only for transformers created at the log group
  /// level. To get information for an account-level transformer, use <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeAccountPolicies.html">DescribeAccountPolicies</a>.
  ///
  /// May throw [InvalidOperationException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [logGroupIdentifier] :
  /// Specify either the name or ARN of the log group to return transformer
  /// information for. If the log group is in a source account and you are using
  /// a monitoring account, you must use the log group ARN.
  Future<GetTransformerResponse> getTransformer({
    required String logGroupIdentifier,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.GetTransformer'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'logGroupIdentifier': logGroupIdentifier,
      },
    );

    return GetTransformerResponse.fromJson(jsonResponse.body);
  }

  /// Returns an aggregate summary of all log groups in the Region grouped by
  /// specified data source characteristics. Supports optional filtering by log
  /// group class, name patterns, and data sources. If you perform this action
  /// in a monitoring account, you can also return aggregated summaries of log
  /// groups from source accounts that are linked to the monitoring account. For
  /// more information about using cross-account observability to set up
  /// monitoring accounts and source accounts, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Unified-Cross-Account.html">CloudWatch
  /// cross-account observability</a>.
  ///
  /// The operation aggregates log groups by data source name and type and
  /// optionally format, providing counts of log groups that share these
  /// characteristics. The operation paginates results. By default, it returns
  /// up to 50 results and includes a token to retrieve more results.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ValidationException].
  ///
  /// Parameter [groupBy] :
  /// Specifies how to group the log groups in the summary.
  ///
  /// Parameter [accountIdentifiers] :
  /// When <code>includeLinkedAccounts</code> is set to <code>true</code>, use
  /// this parameter to specify the list of accounts to search. You can specify
  /// as many as 20 account IDs in the array.
  ///
  /// Parameter [dataSources] :
  /// Filters the results by data source characteristics to include only log
  /// groups associated with the specified data sources.
  ///
  /// Parameter [includeLinkedAccounts] :
  /// If you are using a monitoring account, set this to <code>true</code> to
  /// have the operation return log groups in the accounts listed in
  /// <code>accountIdentifiers</code>.
  ///
  /// If this parameter is set to <code>true</code> and
  /// <code>accountIdentifiers</code> contains a null value, the operation
  /// returns all log groups in the monitoring account and all log groups in all
  /// source accounts that are linked to the monitoring account.
  ///
  /// The default for this parameter is <code>false</code>.
  ///
  /// Parameter [limit] :
  /// The maximum number of aggregated summaries to return. If you omit this
  /// parameter, the default is up to 50 aggregated summaries.
  ///
  /// Parameter [logGroupClass] :
  /// Filters the results by log group class to include only log groups of the
  /// specified class.
  ///
  /// Parameter [logGroupNamePattern] :
  /// Use this parameter to limit the returned log groups to only those with
  /// names that match the pattern that you specify. This parameter is a regular
  /// expression that can match prefixes and substrings, and supports wildcard
  /// matching and matching multiple patterns, as in the following examples.
  ///
  /// <ul>
  /// <li>
  /// Use <code>^</code> to match log group names by prefix.
  /// </li>
  /// <li>
  /// For a substring match, specify the string to match. All matches are case
  /// sensitive
  /// </li>
  /// <li>
  /// To match multiple patterns, separate them with a <code>|</code> as in the
  /// example <code>^/aws/lambda|discovery</code>
  /// </li>
  /// </ul>
  /// You can specify as many as five different regular expression patterns in
  /// this field, each of which must be between 3 and 24 characters. You can
  /// include the <code>^</code> symbol as many as five times, and include the
  /// <code>|</code> symbol as many as four times.
  Future<ListAggregateLogGroupSummariesResponse>
      listAggregateLogGroupSummaries({
    required ListAggregateLogGroupSummariesGroupBy groupBy,
    List<String>? accountIdentifiers,
    List<DataSourceFilter>? dataSources,
    bool? includeLinkedAccounts,
    int? limit,
    LogGroupClass? logGroupClass,
    String? logGroupNamePattern,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.ListAggregateLogGroupSummaries'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'groupBy': groupBy.value,
        if (accountIdentifiers != null)
          'accountIdentifiers': accountIdentifiers,
        if (dataSources != null) 'dataSources': dataSources,
        if (includeLinkedAccounts != null)
          'includeLinkedAccounts': includeLinkedAccounts,
        if (limit != null) 'limit': limit,
        if (logGroupClass != null) 'logGroupClass': logGroupClass.value,
        if (logGroupNamePattern != null)
          'logGroupNamePattern': logGroupNamePattern,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListAggregateLogGroupSummariesResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of anomalies that log anomaly detectors have found. For
  /// details about the structure format of each anomaly object that is
  /// returned, see the example in this section.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [OperationAbortedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [anomalyDetectorArn] :
  /// Use this to optionally limit the results to only the anomalies found by a
  /// certain anomaly detector.
  ///
  /// Parameter [limit] :
  /// The maximum number of items to return. If you don't specify a value, the
  /// default maximum value of 50 items is used.
  ///
  /// Parameter [suppressionState] :
  /// You can specify this parameter if you want to the operation to return only
  /// anomalies that are currently either suppressed or unsuppressed.
  Future<ListAnomaliesResponse> listAnomalies({
    String? anomalyDetectorArn,
    int? limit,
    String? nextToken,
    SuppressionState? suppressionState,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.ListAnomalies'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (anomalyDetectorArn != null)
          'anomalyDetectorArn': anomalyDetectorArn,
        if (limit != null) 'limit': limit,
        if (nextToken != null) 'nextToken': nextToken,
        if (suppressionState != null)
          'suppressionState': suppressionState.value,
      },
    );

    return ListAnomaliesResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of integrations between CloudWatch Logs and other services
  /// in this account. Currently, only one integration can be created in an
  /// account, and this integration must be with OpenSearch Service.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [integrationNamePrefix] :
  /// To limit the results to integrations that start with a certain name
  /// prefix, specify that name prefix here.
  ///
  /// Parameter [integrationStatus] :
  /// To limit the results to integrations with a certain status, specify that
  /// status here.
  ///
  /// Parameter [integrationType] :
  /// To limit the results to integrations of a certain type, specify that type
  /// here.
  Future<ListIntegrationsResponse> listIntegrations({
    String? integrationNamePrefix,
    IntegrationStatus? integrationStatus,
    IntegrationType? integrationType,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.ListIntegrations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (integrationNamePrefix != null)
          'integrationNamePrefix': integrationNamePrefix,
        if (integrationStatus != null)
          'integrationStatus': integrationStatus.value,
        if (integrationType != null) 'integrationType': integrationType.value,
      },
    );

    return ListIntegrationsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves a list of the log anomaly detectors in the account.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [OperationAbortedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [filterLogGroupArn] :
  /// Use this to optionally filter the results to only include anomaly
  /// detectors that are associated with the specified log group.
  ///
  /// Parameter [limit] :
  /// The maximum number of items to return. If you don't specify a value, the
  /// default maximum value of 50 items is used.
  Future<ListLogAnomalyDetectorsResponse> listLogAnomalyDetectors({
    String? filterLogGroupArn,
    int? limit,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.ListLogAnomalyDetectors'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filterLogGroupArn != null) 'filterLogGroupArn': filterLogGroupArn,
        if (limit != null) 'limit': limit,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListLogAnomalyDetectorsResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of log groups in the Region in your account. If you are
  /// performing this action in a monitoring account, you can choose to also
  /// return log groups from source accounts that are linked to the monitoring
  /// account. For more information about using cross-account observability to
  /// set up monitoring accounts and source accounts, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Unified-Cross-Account.html">
  /// CloudWatch cross-account observability</a>.
  ///
  /// You can optionally filter the results by log group class, log group name
  /// pattern, field indexes, data sources, field index names, or log group
  /// tags. If you specify more than one filter type, the results include log
  /// groups that satisfy all filters.
  ///
  /// This operation is paginated. By default, your first use of this operation
  /// returns 50 results, and includes a token to use in a subsequent operation
  /// to return more results.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [accountIdentifiers] :
  /// When <code>includeLinkedAccounts</code> is set to <code>true</code>, use
  /// this parameter to specify the list of accounts to search. You can specify
  /// as many as 20 account IDs in the array.
  ///
  /// Parameter [dataSources] :
  /// An array of data source filters to filter log groups by their associated
  /// data sources. You can filter by data source name, type, or both. Multiple
  /// filters within the same dimension are combined with OR logic, while
  /// filters across different dimensions are combined with AND logic.
  ///
  /// Parameter [fieldIndexNames] :
  /// An array of field index names to filter log groups that have specific
  /// field indexes. Only log groups containing all specified field indexes are
  /// returned. You can specify 1 to 20 field index names, each with 1 to 512
  /// characters.
  ///
  /// Parameter [includeLinkedAccounts] :
  /// If you are using a monitoring account, set this to <code>true</code> to
  /// have the operation return log groups in the accounts listed in
  /// <code>accountIdentifiers</code>.
  ///
  /// If this parameter is set to <code>true</code> and
  /// <code>accountIdentifiers</code> contains a null value, the operation
  /// returns all log groups in the monitoring account and all log groups in all
  /// source accounts that are linked to the monitoring account.
  ///
  /// The default for this parameter is <code>false</code>.
  ///
  /// Parameter [limit] :
  /// The maximum number of log groups to return. If you omit this parameter,
  /// the default is up to 50 log groups.
  ///
  /// Parameter [logGroupClass] :
  /// Use this parameter to limit the results to only those log groups in the
  /// specified log group class. If you omit this parameter, log groups of all
  /// classes can be returned.
  ///
  /// Parameter [logGroupNamePattern] :
  /// Use this parameter to limit the returned log groups to only those with
  /// names that match the pattern that you specify. This parameter is a regular
  /// expression that can match prefixes and substrings, and supports wildcard
  /// matching and matching multiple patterns, as in the following examples.
  ///
  /// <ul>
  /// <li>
  /// Use <code>^</code> to match log group names by prefix.
  /// </li>
  /// <li>
  /// For a substring match, specify the string to match. All matches are case
  /// sensitive
  /// </li>
  /// <li>
  /// To match multiple patterns, separate them with a <code>|</code> as in the
  /// example <code>^/aws/lambda|discovery</code>
  /// </li>
  /// </ul>
  /// You can specify as many as five different regular expression patterns in
  /// this field, each of which must be between 3 and 24 characters. You can
  /// include the <code>^</code> symbol as many as five times, and include the
  /// <code>|</code> symbol as many as four times.
  ///
  /// Parameter [logGroupTags] :
  /// An array of tag filters to return only log groups that have specific tags.
  /// Multiple filters are combined with AND logic.
  Future<ListLogGroupsResponse> listLogGroups({
    List<String>? accountIdentifiers,
    List<DataSourceFilter>? dataSources,
    List<String>? fieldIndexNames,
    bool? includeLinkedAccounts,
    int? limit,
    LogGroupClass? logGroupClass,
    String? logGroupNamePattern,
    List<TagFilter>? logGroupTags,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.ListLogGroups'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (accountIdentifiers != null)
          'accountIdentifiers': accountIdentifiers,
        if (dataSources != null) 'dataSources': dataSources,
        if (fieldIndexNames != null) 'fieldIndexNames': fieldIndexNames,
        if (includeLinkedAccounts != null)
          'includeLinkedAccounts': includeLinkedAccounts,
        if (limit != null) 'limit': limit,
        if (logGroupClass != null) 'logGroupClass': logGroupClass.value,
        if (logGroupNamePattern != null)
          'logGroupNamePattern': logGroupNamePattern,
        if (logGroupTags != null) 'logGroupTags': logGroupTags,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListLogGroupsResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of the log groups that were analyzed during a single
  /// CloudWatch Logs Insights query. This can be useful for queries that use
  /// log group name prefixes or the <code>filterIndex</code> command, because
  /// the log groups are dynamically selected in these cases.
  ///
  /// For more information about field indexes, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatchLogs-Field-Indexing.html">Create
  /// field indexes to improve query performance and reduce costs</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [queryId] :
  /// The ID of the query to use. This query ID is from the response to your <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_StartQuery.html">StartQuery</a>
  /// operation.
  ///
  /// Parameter [maxResults] :
  /// Limits the number of returned log groups to the specified number.
  Future<ListLogGroupsForQueryResponse> listLogGroupsForQuery({
    required String queryId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      50,
      500,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.ListLogGroupsForQuery'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'queryId': queryId,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListLogGroupsForQueryResponse.fromJson(jsonResponse.body);
  }

  /// Lists all scheduled queries in your account and region. You can filter
  /// results by state to show only enabled or disabled queries.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of scheduled queries to return. Valid range is 1 to
  /// 1000.
  ///
  /// Parameter [state] :
  /// Filter scheduled queries by state. Valid values are <code>ENABLED</code>
  /// and <code>DISABLED</code>. If not specified, all scheduled queries are
  /// returned.
  Future<ListScheduledQueriesResponse> listScheduledQueries({
    int? maxResults,
    String? nextToken,
    ScheduledQueryState? state,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.ListScheduledQueries'
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
        if (state != null) 'state': state.value,
      },
    );

    return ListScheduledQueriesResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of data source associations for a specified S3 Table
  /// Integration, showing which data sources are currently associated for query
  /// access.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [integrationArn] :
  /// The Amazon Resource Name (ARN) of the S3 Table Integration to list
  /// associations for.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of associations to return in a single call. Valid range
  /// is 1 to 100.
  Future<ListSourcesForS3TableIntegrationResponse>
      listSourcesForS3TableIntegration({
    required String integrationArn,
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
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.ListSourcesForS3TableIntegration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'integrationArn': integrationArn,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListSourcesForS3TableIntegrationResponse.fromJson(jsonResponse.body);
  }

  /// Displays the tags associated with a CloudWatch Logs resource. Currently,
  /// log groups and destinations support tagging.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource that you want to view tags for.
  ///
  /// The ARN format of a log group is
  /// <code>arn:aws:logs:<i>Region</i>:<i>account-id</i>:log-group:<i>log-group-name</i>
  /// </code>
  ///
  /// The ARN format of a destination is
  /// <code>arn:aws:logs:<i>Region</i>:<i>account-id</i>:destination:<i>destination-name</i>
  /// </code>
  ///
  /// For more information about ARN format, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/iam-access-control-overview-cwl.html">CloudWatch
  /// Logs resources and operations</a>.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.ListTagsForResource'
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

  /// <important>
  /// The ListTagsLogGroup operation is on the path to deprecation. We recommend
  /// that you use <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_ListTagsForResource.html">ListTagsForResource</a>
  /// instead.
  /// </important>
  /// Lists the tags for the specified log group.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [logGroupName] :
  /// The name of the log group.
  Future<ListTagsLogGroupResponse> listTagsLogGroup({
    required String logGroupName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.ListTagsLogGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'logGroupName': logGroupName,
      },
    );

    return ListTagsLogGroupResponse.fromJson(jsonResponse.body);
  }

  /// Creates an account-level data protection policy, subscription filter
  /// policy, field index policy, transformer policy, or metric extraction
  /// policy that applies to all log groups, a subset of log groups, or a data
  /// source name and type combination in the account.
  ///
  /// For field index policies, you can configure indexed fields as
  /// <i>facets</i> to enable interactive exploration of your logs. Facets
  /// provide value distributions and counts for indexed fields in the
  /// CloudWatch Logs Insights console without requiring query execution. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatchLogs-Facets.html">Use
  /// facets to group and explore logs</a>.
  ///
  /// To use this operation, you must be signed on with the correct permissions
  /// depending on the type of policy that you are creating.
  ///
  /// <ul>
  /// <li>
  /// To create a data protection policy, you must have the
  /// <code>logs:PutDataProtectionPolicy</code> and
  /// <code>logs:PutAccountPolicy</code> permissions.
  /// </li>
  /// <li>
  /// To create a subscription filter policy, you must have the
  /// <code>logs:PutSubscriptionFilter</code> and
  /// <code>logs:PutAccountPolicy</code> permissions.
  /// </li>
  /// <li>
  /// To create a transformer policy, you must have the
  /// <code>logs:PutTransformer</code> and <code>logs:PutAccountPolicy</code>
  /// permissions.
  /// </li>
  /// <li>
  /// To create a field index policy, you must have the
  /// <code>logs:PutIndexPolicy</code> and <code>logs:PutAccountPolicy</code>
  /// permissions.
  /// </li>
  /// <li>
  /// To configure facets for field index policies, you must have the
  /// <code>logs:PutIndexPolicy</code> and <code>logs:PutAccountPolicy</code>
  /// permissions.
  /// </li>
  /// <li>
  /// To create a metric extraction policy, you must have the
  /// <code>logs:PutMetricExtractionPolicy</code> and
  /// <code>logs:PutAccountPolicy</code> permissions.
  /// </li>
  /// </ul>
  /// <b>Data protection policy</b>
  ///
  /// A data protection policy can help safeguard sensitive data that's ingested
  /// by your log groups by auditing and masking the sensitive log data. Each
  /// account can have only one account-level data protection policy.
  /// <important>
  /// Sensitive data is detected and masked when it is ingested into a log
  /// group. When you set a data protection policy, log events ingested into the
  /// log groups before that time are not masked.
  /// </important>
  /// If you use <code>PutAccountPolicy</code> to create a data protection
  /// policy for your whole account, it applies to both existing log groups and
  /// all log groups that are created later in this account. The account-level
  /// policy is applied to existing log groups with eventual consistency. It
  /// might take up to 5 minutes before sensitive data in existing log groups
  /// begins to be masked.
  ///
  /// By default, when a user views a log event that includes masked data, the
  /// sensitive data is replaced by asterisks. A user who has the
  /// <code>logs:Unmask</code> permission can use a <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_GetLogEvents.html">GetLogEvents</a>
  /// or <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_FilterLogEvents.html">FilterLogEvents</a>
  /// operation with the <code>unmask</code> parameter set to <code>true</code>
  /// to view the unmasked log events. Users with the <code>logs:Unmask</code>
  /// can also view unmasked data in the CloudWatch Logs console by running a
  /// CloudWatch Logs Insights query with the <code>unmask</code> query command.
  ///
  /// For more information, including a list of types of data that can be
  /// audited and masked, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/mask-sensitive-log-data.html">Protect
  /// sensitive log data with masking</a>.
  ///
  /// To use the <code>PutAccountPolicy</code> operation for a data protection
  /// policy, you must be signed on with the
  /// <code>logs:PutDataProtectionPolicy</code> and
  /// <code>logs:PutAccountPolicy</code> permissions.
  ///
  /// The <code>PutAccountPolicy</code> operation applies to all log groups in
  /// the account. You can use <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDataProtectionPolicy.html">PutDataProtectionPolicy</a>
  /// to create a data protection policy that applies to just one log group. If
  /// a log group has its own data protection policy and the account also has an
  /// account-level data protection policy, then the two policies are
  /// cumulative. Any sensitive term specified in either policy is masked.
  ///
  /// <b>Subscription filter policy</b>
  ///
  /// A subscription filter policy sets up a real-time feed of log events from
  /// CloudWatch Logs to other Amazon Web Services services. Account-level
  /// subscription filter policies apply to both existing log groups and log
  /// groups that are created later in this account. Supported destinations are
  /// Kinesis Data Streams, Firehose, and Lambda. When log events are sent to
  /// the receiving service, they are Base64 encoded and compressed with the
  /// GZIP format.
  ///
  /// The following destinations are supported for subscription filters:
  ///
  /// <ul>
  /// <li>
  /// An Kinesis Data Streams data stream in the same account as the
  /// subscription policy, for same-account delivery.
  /// </li>
  /// <li>
  /// An Firehose data stream in the same account as the subscription policy,
  /// for same-account delivery.
  /// </li>
  /// <li>
  /// A Lambda function in the same account as the subscription policy, for
  /// same-account delivery.
  /// </li>
  /// <li>
  /// A logical destination in a different account created with <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDestination.html">PutDestination</a>,
  /// for cross-account delivery. Kinesis Data Streams and Firehose are
  /// supported as logical destinations.
  /// </li>
  /// </ul>
  /// Each account can have one account-level subscription filter policy per
  /// Region. If you are updating an existing filter, you must specify the
  /// correct name in <code>PolicyName</code>. To perform a
  /// <code>PutAccountPolicy</code> subscription filter operation for any
  /// destination except a Lambda function, you must also have the
  /// <code>iam:PassRole</code> permission.
  ///
  /// <b>Transformer policy</b>
  ///
  /// Creates or updates a <i>log transformer policy</i> for your account. You
  /// use log transformers to transform log events into a different format,
  /// making them easier for you to process and analyze. You can also transform
  /// logs from different sources into standardized formats that contain
  /// relevant, source-specific information. After you have created a
  /// transformer, CloudWatch Logs performs this transformation at the time of
  /// log ingestion. You can then refer to the transformed versions of the logs
  /// during operations such as querying with CloudWatch Logs Insights or
  /// creating metric filters or subscription filters.
  ///
  /// You can also use a transformer to copy metadata from metadata keys into
  /// the log events themselves. This metadata can include log group name, log
  /// stream name, account ID and Region.
  ///
  /// A transformer for a log group is a series of processors, where each
  /// processor applies one type of transformation to the log events ingested
  /// into this log group. For more information about the available processors
  /// to use in a transformer, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-Processors">
  /// Processors that you can use</a>.
  ///
  /// Having log events in standardized format enables visibility across your
  /// applications for your log analysis, reporting, and alarming needs.
  /// CloudWatch Logs provides transformation for common log types with
  /// out-of-the-box transformation templates for major Amazon Web Services log
  /// sources such as VPC flow logs, Lambda, and Amazon RDS. You can use
  /// pre-built transformation templates or create custom transformation
  /// policies.
  ///
  /// You can create transformers only for the log groups in the Standard log
  /// class.
  ///
  /// You can have one account-level transformer policy that applies to all log
  /// groups in the account. Or you can create as many as 20 account-level
  /// transformer policies that are each scoped to a subset of log groups with
  /// the <code>selectionCriteria</code> parameter. If you have multiple
  /// account-level transformer policies with selection criteria, no two of them
  /// can use the same or overlapping log group name prefixes. For example, if
  /// you have one policy filtered to log groups that start with
  /// <code>my-log</code>, you can't have another transformer policy filtered to
  /// <code>my-logpprod</code> or <code>my-logging</code>.
  ///
  /// You can also set up a transformer at the log-group level. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutTransformer.html">PutTransformer</a>.
  /// If there is both a log-group level transformer created with
  /// <code>PutTransformer</code> and an account-level transformer that could
  /// apply to the same log group, the log group uses only the log-group level
  /// transformer. It ignores the account-level transformer.
  ///
  /// <b>Field index policy</b>
  ///
  /// You can use field index policies to create indexes on fields found in log
  /// events for a log group or data source name and type combination. Creating
  /// field indexes can help lower the scan volume for CloudWatch Logs Insights
  /// queries that reference those fields, because these queries attempt to skip
  /// the processing of log events that are known to not match the indexed
  /// field. Good fields to index are fields that you often need to query for
  /// and fields or values that match only a small fraction of the total log
  /// events. Common examples of indexes include request ID, session ID, user
  /// IDs, or instance IDs. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatchLogs-Field-Indexing.html">Create
  /// field indexes to improve query performance and reduce costs</a>
  ///
  /// To find the fields that are in your log group events, use the <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_GetLogGroupFields.html">GetLogGroupFields</a>
  /// operation. To find the fields for a data source use the <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_GetLogFields.html">GetLogFields</a>
  /// operation.
  ///
  /// For example, suppose you have created a field index for
  /// <code>requestId</code>. Then, any CloudWatch Logs Insights query on that
  /// log group that includes <code>requestId = <i>value</i> </code> or
  /// <code>requestId in [<i>value</i>, <i>value</i>, ...]</code> will attempt
  /// to process only the log events where the indexed field matches the
  /// specified value.
  ///
  /// Matches of log events to the names of indexed fields are case-sensitive.
  /// For example, an indexed field of <code>RequestId</code> won't match a log
  /// event containing <code>requestId</code>.
  ///
  /// You can have one account-level field index policy that applies to all log
  /// groups in the account. Or you can create as many as 20 account-level field
  /// index policies that are each scoped to a subset of log groups using
  /// <code>LogGroupNamePrefix</code> with the <code>selectionCriteria</code>
  /// parameter. You can have another 20 account-level field index policies
  /// using <code>DataSourceName</code> and <code>DataSourceType</code> for the
  /// <code>selectionCriteria</code> parameter. If you have multiple
  /// account-level index policies with <code>LogGroupNamePrefix</code>
  /// selection criteria, no two of them can use the same or overlapping log
  /// group name prefixes. For example, if you have one policy filtered to log
  /// groups that start with <i>my-log</i>, you can't have another field index
  /// policy filtered to <i>my-logpprod</i> or <i>my-logging</i>. Similarly, if
  /// you have multiple account-level index policies with
  /// <code>DataSourceName</code> and <code>DataSourceType</code> selection
  /// criteria, no two of them can use the same data source name and type
  /// combination. For example, if you have one policy filtered to the data
  /// source name <code>amazon_vpc</code> and data source type <code>flow</code>
  /// you cannot create another policy with this combination.
  ///
  /// If you create an account-level field index policy in a monitoring account
  /// in cross-account observability, the policy is applied only to the
  /// monitoring account and not to any source accounts.
  ///
  /// CloudWatch Logs provides default field indexes for all log groups in the
  /// Standard log class. Default field indexes are automatically available for
  /// the following fields:
  ///
  /// <ul>
  /// <li>
  /// <code>@logStream</code>
  /// </li>
  /// <li>
  /// <code>@aws.region</code>
  /// </li>
  /// <li>
  /// <code>@aws.account</code>
  /// </li>
  /// <li>
  /// <code>@source.log</code>
  /// </li>
  /// <li>
  /// <code>@data_source_name</code>
  /// </li>
  /// <li>
  /// <code>@data_source_type</code>
  /// </li>
  /// <li>
  /// <code>@data_format</code>
  /// </li>
  /// <li>
  /// <code>traceId</code>
  /// </li>
  /// <li>
  /// <code>severityText</code>
  /// </li>
  /// <li>
  /// <code>attributes.session.id</code>
  /// </li>
  /// </ul>
  /// CloudWatch Logs provides default field indexes for certain data source
  /// name and type combinations as well. Default field indexes are
  /// automatically available for the following data source name and type
  /// combinations as identified in the following list:
  ///
  /// <code>amazon_vpc.flow</code>
  ///
  /// <ul>
  /// <li>
  /// <code>action</code>
  /// </li>
  /// <li>
  /// <code>logStatus</code>
  /// </li>
  /// <li>
  /// <code>region</code>
  /// </li>
  /// <li>
  /// <code>flowDirection</code>
  /// </li>
  /// <li>
  /// <code>type</code>
  /// </li>
  /// </ul>
  /// <code>amazon_route53.resolver_query</code>
  ///
  /// <ul>
  /// <li>
  /// <code>transport</code>
  /// </li>
  /// <li>
  /// <code>rcode</code>
  /// </li>
  /// </ul>
  /// <code>aws_waf.access</code>
  ///
  /// <ul>
  /// <li>
  /// <code>action</code>
  /// </li>
  /// <li>
  /// <code>httpRequest.country</code>
  /// </li>
  /// </ul>
  /// <code>aws_cloudtrail.data</code>, <code>aws_cloudtrail.management</code>
  ///
  /// <ul>
  /// <li>
  /// <code>eventSource</code>
  /// </li>
  /// <li>
  /// <code>eventName</code>
  /// </li>
  /// <li>
  /// <code>awsRegion</code>
  /// </li>
  /// <li>
  /// <code>userAgent</code>
  /// </li>
  /// <li>
  /// <code>errorCode</code>
  /// </li>
  /// <li>
  /// <code>eventType</code>
  /// </li>
  /// <li>
  /// <code>managementEvent</code>
  /// </li>
  /// <li>
  /// <code>readOnly</code>
  /// </li>
  /// <li>
  /// <code>eventCategory</code>
  /// </li>
  /// <li>
  /// <code>requestId</code>
  /// </li>
  /// </ul>
  /// Default field indexes are in addition to any custom field indexes you
  /// define within your policy. Default field indexes are not counted towards
  /// your <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatchLogs-Field-Indexing-Syntax">field
  /// index quota</a>.
  ///
  /// If you want to create a field index policy for a single log group, you can
  /// use <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutIndexPolicy.html">PutIndexPolicy</a>
  /// instead of <code>PutAccountPolicy</code>. If you do so, that log group
  /// will use that log-group level policy and any account-level policies that
  /// match at the data source level; any account-level policy that matches at
  /// the log group level (for example, no selection criteria or log group name
  /// prefix selection criteria) will be ignored.
  ///
  /// <b>Metric extraction policy</b>
  ///
  /// A metric extraction policy controls whether CloudWatch Metrics can be
  /// created through the Embedded Metrics Format (EMF) for log groups in your
  /// account. By default, EMF metric creation is enabled for all log groups.
  /// You can use metric extraction policies to disable EMF metric creation for
  /// your entire account or specific log groups.
  ///
  /// When a policy disables EMF metric creation for a log group, log events in
  /// the EMF format are still ingested, but no CloudWatch Metrics are created
  /// from them.
  /// <important>
  /// Creating a policy disables metrics for Amazon Web Services features that
  /// use EMF to create metrics, such as CloudWatch Container Insights and
  /// CloudWatch Application Signals. To prevent turning off those features by
  /// accident, we recommend that you exclude the underlying log-groups through
  /// a selection-criteria such as <code>LogGroupNamePrefix NOT IN
  /// ["/aws/containerinsights", "/aws/ecs/containerinsights",
  /// "/aws/application-signals/data"]</code>.
  /// </important>
  /// Each account can have either one account-level metric extraction policy
  /// that applies to all log groups, or up to 5 policies that are each scoped
  /// to a subset of log groups with the <code>selectionCriteria</code>
  /// parameter. The selection criteria supports filtering by
  /// <code>LogGroupName</code> and <code>LogGroupNamePrefix</code> using the
  /// operators <code>IN</code> and <code>NOT IN</code>. You can specify up to
  /// 50 values in each <code>IN</code> or <code>NOT IN</code> list.
  ///
  /// The selection criteria can be specified in these formats:
  ///
  /// <code>LogGroupName IN ["log-group-1", "log-group-2"]</code>
  ///
  /// <code>LogGroupNamePrefix NOT IN ["/aws/prefix1", "/aws/prefix2"]</code>
  ///
  /// If you have multiple account-level metric extraction policies with
  /// selection criteria, no two of them can have overlapping criteria. For
  /// example, if you have one policy with selection criteria
  /// <code>LogGroupNamePrefix IN ["my-log"]</code>, you can't have another
  /// metric extraction policy with selection criteria <code>LogGroupNamePrefix
  /// IN ["/my-log-prod"]</code> or <code>LogGroupNamePrefix IN
  /// ["/my-logging"]</code>, as the set of log groups matching these prefixes
  /// would be a subset of the log groups matching the first policy's prefix,
  /// creating an overlap.
  ///
  /// When using <code>NOT IN</code>, only one policy with this operator is
  /// allowed per account.
  ///
  /// When combining policies with <code>IN</code> and <code>NOT IN</code>
  /// operators, the overlap check ensures that policies don't have conflicting
  /// effects. Two policies with <code>IN</code> and <code>NOT IN</code>
  /// operators do not overlap if and only if every value in the <code>IN
  /// </code>policy is completely contained within some value in the <code>NOT
  /// IN</code> policy. For example:
  ///
  /// <ul>
  /// <li>
  /// If you have a <code>NOT IN</code> policy for prefix
  /// <code>"/aws/lambda"</code>, you can create an <code>IN</code> policy for
  /// the exact log group name <code>"/aws/lambda/function1"</code> because the
  /// set of log groups matching <code>"/aws/lambda/function1"</code> is a
  /// subset of the log groups matching <code>"/aws/lambda"</code>.
  /// </li>
  /// <li>
  /// If you have a <code>NOT IN</code> policy for prefix
  /// <code>"/aws/lambda"</code>, you cannot create an <code>IN</code> policy
  /// for prefix <code>"/aws"</code> because the set of log groups matching
  /// <code>"/aws"</code> is not a subset of the log groups matching
  /// <code>"/aws/lambda"</code>.
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidParameterException].
  /// May throw [LimitExceededException].
  /// May throw [OperationAbortedException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [policyDocument] :
  /// Specify the policy, in JSON.
  ///
  /// <b>Data protection policy</b>
  ///
  /// A data protection policy must include two JSON blocks:
  ///
  /// <ul>
  /// <li>
  /// The first block must include both a <code>DataIdentifer</code> array and
  /// an <code>Operation</code> property with an <code>Audit</code> action. The
  /// <code>DataIdentifer</code> array lists the types of sensitive data that
  /// you want to mask. For more information about the available options, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/mask-sensitive-log-data-types.html">Types
  /// of data that you can mask</a>.
  ///
  /// The <code>Operation</code> property with an <code>Audit</code> action is
  /// required to find the sensitive data terms. This <code>Audit</code> action
  /// must contain a <code>FindingsDestination</code> object. You can optionally
  /// use that <code>FindingsDestination</code> object to list one or more
  /// destinations to send audit findings to. If you specify destinations such
  /// as log groups, Firehose streams, and S3 buckets, they must already exist.
  /// </li>
  /// <li>
  /// The second block must include both a <code>DataIdentifer</code> array and
  /// an <code>Operation</code> property with an <code>Deidentify</code> action.
  /// The <code>DataIdentifer</code> array must exactly match the
  /// <code>DataIdentifer</code> array in the first block of the policy.
  ///
  /// The <code>Operation</code> property with the <code>Deidentify</code>
  /// action is what actually masks the data, and it must contain the <code>
  /// "MaskConfig": {}</code> object. The <code> "MaskConfig": {}</code> object
  /// must be empty.
  /// </li>
  /// </ul>
  /// For an example data protection policy, see the <b>Examples</b> section on
  /// this page.
  /// <important>
  /// The contents of the two <code>DataIdentifer</code> arrays must match
  /// exactly.
  /// </important>
  /// In addition to the two JSON blocks, the <code>policyDocument</code> can
  /// also include <code>Name</code>, <code>Description</code>, and
  /// <code>Version</code> fields. The <code>Name</code> is different than the
  /// operation's <code>policyName</code> parameter, and is used as a dimension
  /// when CloudWatch Logs reports audit findings metrics to CloudWatch.
  ///
  /// The JSON specified in <code>policyDocument</code> can be up to 30,720
  /// characters long.
  ///
  /// <b>Subscription filter policy</b>
  ///
  /// A subscription filter policy can include the following attributes in a
  /// JSON block:
  ///
  /// <ul>
  /// <li>
  /// <b>DestinationArn</b> The ARN of the destination to deliver log events to.
  /// Supported destinations are:
  ///
  /// <ul>
  /// <li>
  /// An Kinesis Data Streams data stream in the same account as the
  /// subscription policy, for same-account delivery.
  /// </li>
  /// <li>
  /// An Firehose data stream in the same account as the subscription policy,
  /// for same-account delivery.
  /// </li>
  /// <li>
  /// A Lambda function in the same account as the subscription policy, for
  /// same-account delivery.
  /// </li>
  /// <li>
  /// A logical destination in a different account created with <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDestination.html">PutDestination</a>,
  /// for cross-account delivery. Kinesis Data Streams and Firehose are
  /// supported as logical destinations.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b>RoleArn</b> The ARN of an IAM role that grants CloudWatch Logs
  /// permissions to deliver ingested log events to the destination stream. You
  /// don't need to provide the ARN when you are working with a logical
  /// destination for cross-account delivery.
  /// </li>
  /// <li>
  /// <b>FilterPattern</b> A filter pattern for subscribing to a filtered stream
  /// of log events.
  /// </li>
  /// <li>
  /// <b>Distribution</b> The method used to distribute log data to the
  /// destination. By default, log data is grouped by log stream, but the
  /// grouping can be set to <code>Random</code> for a more even distribution.
  /// This property is only applicable when the destination is an Kinesis Data
  /// Streams data stream.
  /// </li>
  /// </ul>
  /// <b>Transformer policy</b>
  ///
  /// A transformer policy must include one JSON block with the array of
  /// processors and their configurations. For more information about available
  /// processors, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-Processors">
  /// Processors that you can use</a>.
  ///
  /// <b>Field index policy</b>
  ///
  /// A field index filter policy can include the following attribute in a JSON
  /// block:
  ///
  /// <ul>
  /// <li>
  /// <b>Fields</b> The array of field indexes to create.
  /// </li>
  /// <li>
  /// <b>FieldsV2</b> The object of field indexes to create along with it's
  /// type.
  /// </li>
  /// </ul>
  /// It must contain at least one field index.
  ///
  /// The following is an example of an index policy document that creates
  /// indexes with different types.
  ///
  /// <code>"policyDocument": "{ \"Fields\": [ \"TransactionId\" ],
  /// \"FieldsV2\": {\"RequestId\": {\"type\": \"FIELD_INDEX\"}, \"APIName\":
  /// {\"type\": \"FACET\"}, \"StatusCode\": {\"type\": \"FACET\"}}}"</code>
  ///
  /// You can use <code>FieldsV2</code> to specify the type for each field.
  /// Supported types are <code>FIELD_INDEX</code> and <code>FACET</code>. Field
  /// names within <code>Fields</code> and <code>FieldsV2</code> must be
  /// mutually exclusive.
  ///
  /// Parameter [policyName] :
  /// A name for the policy. This must be unique within the account and cannot
  /// start with <code>aws/</code>.
  ///
  /// Parameter [policyType] :
  /// The type of policy that you're creating or updating.
  ///
  /// Parameter [scope] :
  /// Currently the only valid value for this parameter is <code>ALL</code>,
  /// which specifies that the data protection policy applies to all log groups
  /// in the account. If you omit this parameter, the default of
  /// <code>ALL</code> is used.
  ///
  /// Parameter [selectionCriteria] :
  /// Use this parameter to apply the new policy to a subset of log groups in
  /// the account or a data source name and type combination.
  ///
  /// Specifying <code>selectionCriteria</code> is valid only when you specify
  /// <code>SUBSCRIPTION_FILTER_POLICY</code>, <code>FIELD_INDEX_POLICY</code>
  /// or <code>TRANSFORMER_POLICY</code>for <code>policyType</code>.
  ///
  /// <ul>
  /// <li>
  /// If <code>policyType</code> is <code>SUBSCRIPTION_FILTER_POLICY</code>, the
  /// only supported <code>selectionCriteria</code> filter is <code>LogGroupName
  /// NOT IN []</code>
  /// </li>
  /// <li>
  /// If <code>policyType</code> is <code>TRANSFORMER_POLICY</code>, the only
  /// supported <code>selectionCriteria</code> filter is
  /// <code>LogGroupNamePrefix</code>
  /// </li>
  /// <li>
  /// If <code>policyType</code> is <code>FIELD_INDEX_POLICY</code>, the
  /// supported <code>selectionCriteria</code> filters are:
  ///
  /// <ul>
  /// <li>
  /// <code>LogGroupNamePrefix</code>
  /// </li>
  /// <li>
  /// <code>DataSourceName</code> AND <code>DataSourceType</code>
  /// </li>
  /// </ul>
  /// When you specify <code>selectionCriteria</code> for a field index policy
  /// you can use either <code>LogGroupNamePrefix</code> by itself or
  /// <code>DataSourceName</code> and <code>DataSourceType</code> together.
  /// </li>
  /// </ul>
  /// The <code>selectionCriteria</code> string can be up to 25KB in length. The
  /// length is determined by using its UTF-8 bytes.
  ///
  /// Using the <code>selectionCriteria</code> parameter with
  /// <code>SUBSCRIPTION_FILTER_POLICY</code> is useful to help prevent infinite
  /// loops. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/Subscriptions-recursion-prevention.html">Log
  /// recursion prevention</a>.
  Future<PutAccountPolicyResponse> putAccountPolicy({
    required String policyDocument,
    required String policyName,
    required PolicyType policyType,
    Scope? scope,
    String? selectionCriteria,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.PutAccountPolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'policyDocument': policyDocument,
        'policyName': policyName,
        'policyType': policyType.value,
        if (scope != null) 'scope': scope.value,
        if (selectionCriteria != null) 'selectionCriteria': selectionCriteria,
      },
    );

    return PutAccountPolicyResponse.fromJson(jsonResponse.body);
  }

  /// Enables or disables bearer token authentication for the specified log
  /// group. When enabled on a log group, bearer token authentication is enabled
  /// on operations until it is explicitly disabled.
  ///
  /// For information about the parameters that are common to all actions, see
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/CommonParameters.html">Common
  /// Parameters</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidOperationException].
  /// May throw [InvalidParameterException].
  /// May throw [OperationAbortedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [bearerTokenAuthenticationEnabled] :
  /// Whether to enable bearer token authentication.
  ///
  /// Type: Boolean
  ///
  /// Required: Yes
  ///
  /// Parameter [logGroupIdentifier] :
  /// The name or ARN of the log group.
  ///
  /// Type: String
  ///
  /// Length Constraints: Minimum length of 1. Maximum length of 512.
  ///
  /// Pattern: <code>[\.\-_/#A-Za-z0-9]+</code>
  ///
  /// Required: Yes
  Future<void> putBearerTokenAuthentication({
    required bool bearerTokenAuthenticationEnabled,
    required String logGroupIdentifier,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.PutBearerTokenAuthentication'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'bearerTokenAuthenticationEnabled': bearerTokenAuthenticationEnabled,
        'logGroupIdentifier': logGroupIdentifier,
      },
    );
  }

  /// Creates a data protection policy for the specified log group. A data
  /// protection policy can help safeguard sensitive data that's ingested by the
  /// log group by auditing and masking the sensitive log data.
  /// <important>
  /// Sensitive data is detected and masked when it is ingested into the log
  /// group. When you set a data protection policy, log events ingested into the
  /// log group before that time are not masked.
  /// </important>
  /// By default, when a user views a log event that includes masked data, the
  /// sensitive data is replaced by asterisks. A user who has the
  /// <code>logs:Unmask</code> permission can use a <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_GetLogEvents.html">GetLogEvents</a>
  /// or <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_FilterLogEvents.html">FilterLogEvents</a>
  /// operation with the <code>unmask</code> parameter set to <code>true</code>
  /// to view the unmasked log events. Users with the <code>logs:Unmask</code>
  /// can also view unmasked data in the CloudWatch Logs console by running a
  /// CloudWatch Logs Insights query with the <code>unmask</code> query command.
  ///
  /// For more information, including a list of types of data that can be
  /// audited and masked, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/mask-sensitive-log-data.html">Protect
  /// sensitive log data with masking</a>.
  ///
  /// The <code>PutDataProtectionPolicy</code> operation applies to only the
  /// specified log group. You can also use <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutAccountPolicy.html">PutAccountPolicy</a>
  /// to create an account-level data protection policy that applies to all log
  /// groups in the account, including both existing log groups and log groups
  /// that are created level. If a log group has its own data protection policy
  /// and the account also has an account-level data protection policy, then the
  /// two policies are cumulative. Any sensitive term specified in either policy
  /// is masked.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [LimitExceededException].
  /// May throw [OperationAbortedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [logGroupIdentifier] :
  /// Specify either the log group name or log group ARN.
  ///
  /// Parameter [policyDocument] :
  /// Specify the data protection policy, in JSON.
  ///
  /// This policy must include two JSON blocks:
  ///
  /// <ul>
  /// <li>
  /// The first block must include both a <code>DataIdentifer</code> array and
  /// an <code>Operation</code> property with an <code>Audit</code> action. The
  /// <code>DataIdentifer</code> array lists the types of sensitive data that
  /// you want to mask. For more information about the available options, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/mask-sensitive-log-data-types.html">Types
  /// of data that you can mask</a>.
  ///
  /// The <code>Operation</code> property with an <code>Audit</code> action is
  /// required to find the sensitive data terms. This <code>Audit</code> action
  /// must contain a <code>FindingsDestination</code> object. You can optionally
  /// use that <code>FindingsDestination</code> object to list one or more
  /// destinations to send audit findings to. If you specify destinations such
  /// as log groups, Firehose streams, and S3 buckets, they must already exist.
  /// </li>
  /// <li>
  /// The second block must include both a <code>DataIdentifer</code> array and
  /// an <code>Operation</code> property with an <code>Deidentify</code> action.
  /// The <code>DataIdentifer</code> array must exactly match the
  /// <code>DataIdentifer</code> array in the first block of the policy.
  ///
  /// The <code>Operation</code> property with the <code>Deidentify</code>
  /// action is what actually masks the data, and it must contain the <code>
  /// "MaskConfig": {}</code> object. The <code> "MaskConfig": {}</code> object
  /// must be empty.
  /// </li>
  /// </ul>
  /// For an example data protection policy, see the <b>Examples</b> section on
  /// this page.
  /// <important>
  /// The contents of the two <code>DataIdentifer</code> arrays must match
  /// exactly.
  /// </important>
  /// In addition to the two JSON blocks, the <code>policyDocument</code> can
  /// also include <code>Name</code>, <code>Description</code>, and
  /// <code>Version</code> fields. The <code>Name</code> is used as a dimension
  /// when CloudWatch Logs reports audit findings metrics to CloudWatch.
  ///
  /// The JSON specified in <code>policyDocument</code> can be up to 30,720
  /// characters.
  Future<PutDataProtectionPolicyResponse> putDataProtectionPolicy({
    required String logGroupIdentifier,
    required String policyDocument,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.PutDataProtectionPolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'logGroupIdentifier': logGroupIdentifier,
        'policyDocument': policyDocument,
      },
    );

    return PutDataProtectionPolicyResponse.fromJson(jsonResponse.body);
  }

  /// Creates or updates a logical <i>delivery destination</i>. A delivery
  /// destination is an Amazon Web Services resource that represents an Amazon
  /// Web Services service that logs can be sent to. CloudWatch Logs, Amazon S3,
  /// and Firehose are supported as logs delivery destinations and X-Ray as the
  /// trace delivery destination.
  ///
  /// To configure logs delivery between a supported Amazon Web Services service
  /// and a destination, you must do the following:
  ///
  /// <ul>
  /// <li>
  /// Create a delivery source, which is a logical object that represents the
  /// resource that is actually sending the logs. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliverySource.html">PutDeliverySource</a>.
  /// </li>
  /// <li>
  /// Use <code>PutDeliveryDestination</code> to create a <i>delivery
  /// destination</i> in the same account of the actual delivery destination.
  /// The delivery destination that you create is a logical object that
  /// represents the actual delivery destination.
  /// </li>
  /// <li>
  /// If you are delivering logs cross-account, you must use <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestinationPolicy.html">PutDeliveryDestinationPolicy</a>
  /// in the destination account to assign an IAM policy to the destination.
  /// This policy allows delivery to that destination.
  /// </li>
  /// <li>
  /// Use <code>CreateDelivery</code> to create a <i>delivery</i> by pairing
  /// exactly one delivery source and one delivery destination. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_CreateDelivery.html">CreateDelivery</a>.
  /// </li>
  /// </ul>
  /// You can configure a single delivery source to send logs to multiple
  /// destinations by creating multiple deliveries. You can also create multiple
  /// deliveries to configure multiple delivery sources to send logs to the same
  /// delivery destination.
  ///
  /// Only some Amazon Web Services services support being configured as a
  /// delivery source. These services are listed as <b>Supported [V2
  /// Permissions]</b> in the table at <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AWS-logs-and-resource-policy.html">Enabling
  /// logging from Amazon Web Services services.</a>
  ///
  /// If you use this operation to update an existing delivery destination, all
  /// the current delivery destination parameters are overwritten with the new
  /// parameter values that you specify.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// A name for this delivery destination. This name must be unique for all
  /// delivery destinations in your account.
  ///
  /// Parameter [deliveryDestinationConfiguration] :
  /// A structure that contains the ARN of the Amazon Web Services resource that
  /// will receive the logs.
  /// <note>
  /// <code>deliveryDestinationConfiguration</code> is required for CloudWatch
  /// Logs, Amazon S3, Firehose log delivery destinations and not required for
  /// X-Ray trace delivery destinations. <code>deliveryDestinationType</code> is
  /// needed for X-Ray trace delivery destinations but not required for other
  /// logs delivery destinations.
  /// </note>
  ///
  /// Parameter [deliveryDestinationType] :
  /// The type of delivery destination. This parameter specifies the target
  /// service where log data will be delivered. Valid values include:
  ///
  /// <ul>
  /// <li>
  /// <code>S3</code> - Amazon S3 for long-term storage and analytics
  /// </li>
  /// <li>
  /// <code>CWL</code> - CloudWatch Logs for centralized log management
  /// </li>
  /// <li>
  /// <code>FH</code> - Amazon Kinesis Data Firehose for real-time data
  /// streaming
  /// </li>
  /// <li>
  /// <code>XRAY</code> - Amazon Web Services X-Ray for distributed tracing and
  /// application monitoring
  /// </li>
  /// </ul>
  /// The delivery destination type determines the format and configuration
  /// options available for log delivery.
  ///
  /// Parameter [outputFormat] :
  /// The format for the logs that this delivery destination will receive.
  ///
  /// Parameter [tags] :
  /// An optional list of key-value pairs to associate with the resource.
  ///
  /// For more information about tagging, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// Amazon Web Services resources</a>
  Future<PutDeliveryDestinationResponse> putDeliveryDestination({
    required String name,
    DeliveryDestinationConfiguration? deliveryDestinationConfiguration,
    DeliveryDestinationType? deliveryDestinationType,
    OutputFormat? outputFormat,
    Map<String, String>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.PutDeliveryDestination'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
        if (deliveryDestinationConfiguration != null)
          'deliveryDestinationConfiguration': deliveryDestinationConfiguration,
        if (deliveryDestinationType != null)
          'deliveryDestinationType': deliveryDestinationType.value,
        if (outputFormat != null) 'outputFormat': outputFormat.value,
        if (tags != null) 'tags': tags,
      },
    );

    return PutDeliveryDestinationResponse.fromJson(jsonResponse.body);
  }

  /// Creates and assigns an IAM policy that grants permissions to CloudWatch
  /// Logs to deliver logs cross-account to a specified destination in this
  /// account. To configure the delivery of logs from an Amazon Web Services
  /// service in another account to a logs delivery destination in the current
  /// account, you must do the following:
  ///
  /// <ul>
  /// <li>
  /// Create a delivery source, which is a logical object that represents the
  /// resource that is actually sending the logs. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliverySource.html">PutDeliverySource</a>.
  /// </li>
  /// <li>
  /// Create a <i>delivery destination</i>, which is a logical object that
  /// represents the actual delivery destination. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestination.html">PutDeliveryDestination</a>.
  /// </li>
  /// <li>
  /// Use this operation in the destination account to assign an IAM policy to
  /// the destination. This policy allows delivery to that destination.
  /// </li>
  /// <li>
  /// Create a <i>delivery</i> by pairing exactly one delivery source and one
  /// delivery destination. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_CreateDelivery.html">CreateDelivery</a>.
  /// </li>
  /// </ul>
  /// Only some Amazon Web Services services support being configured as a
  /// delivery source. These services are listed as <b>Supported [V2
  /// Permissions]</b> in the table at <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AWS-logs-and-resource-policy.html">Enabling
  /// logging from Amazon Web Services services.</a>
  ///
  /// The contents of the policy must include two statements. One statement
  /// enables general logs delivery, and the other allows delivery to the chosen
  /// destination. See the examples for the needed policies.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ValidationException].
  ///
  /// Parameter [deliveryDestinationName] :
  /// The name of the delivery destination to assign this policy to.
  ///
  /// Parameter [deliveryDestinationPolicy] :
  /// The contents of the policy.
  Future<PutDeliveryDestinationPolicyResponse> putDeliveryDestinationPolicy({
    required String deliveryDestinationName,
    required String deliveryDestinationPolicy,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.PutDeliveryDestinationPolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'deliveryDestinationName': deliveryDestinationName,
        'deliveryDestinationPolicy': deliveryDestinationPolicy,
      },
    );

    return PutDeliveryDestinationPolicyResponse.fromJson(jsonResponse.body);
  }

  /// Creates or updates a logical <i>delivery source</i>. A delivery source
  /// represents an Amazon Web Services resource that sends logs to an logs
  /// delivery destination. The destination can be CloudWatch Logs, Amazon S3,
  /// Firehose or X-Ray for sending traces.
  ///
  /// To configure logs delivery between a delivery destination and an Amazon
  /// Web Services service that is supported as a delivery source, you must do
  /// the following:
  ///
  /// <ul>
  /// <li>
  /// Use <code>PutDeliverySource</code> to create a delivery source, which is a
  /// logical object that represents the resource that is actually sending the
  /// logs.
  /// </li>
  /// <li>
  /// Use <code>PutDeliveryDestination</code> to create a <i>delivery
  /// destination</i>, which is a logical object that represents the actual
  /// delivery destination. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestination.html">PutDeliveryDestination</a>.
  /// </li>
  /// <li>
  /// If you are delivering logs cross-account, you must use <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestinationPolicy.html">PutDeliveryDestinationPolicy</a>
  /// in the destination account to assign an IAM policy to the destination.
  /// This policy allows delivery to that destination.
  /// </li>
  /// <li>
  /// Use <code>CreateDelivery</code> to create a <i>delivery</i> by pairing
  /// exactly one delivery source and one delivery destination. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_CreateDelivery.html">CreateDelivery</a>.
  /// </li>
  /// </ul>
  /// You can configure a single delivery source to send logs to multiple
  /// destinations by creating multiple deliveries. You can also create multiple
  /// deliveries to configure multiple delivery sources to send logs to the same
  /// delivery destination.
  ///
  /// Only some Amazon Web Services services support being configured as a
  /// delivery source. These services are listed as <b>Supported [V2
  /// Permissions]</b> in the table at <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AWS-logs-and-resource-policy.html">Enabling
  /// logging from Amazon Web Services services.</a>
  ///
  /// If you use this operation to update an existing delivery source, all the
  /// current delivery source parameters are overwritten with the new parameter
  /// values that you specify.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [logType] :
  /// Defines the type of log that the source is sending.
  ///
  /// <ul>
  /// <li>
  /// For Amazon Bedrock Agents, the valid values are
  /// <code>APPLICATION_LOGS</code> and <code>EVENT_LOGS</code>.
  /// </li>
  /// <li>
  /// For Amazon Bedrock Knowledge Bases, the valid value is
  /// <code>APPLICATION_LOGS</code>.
  /// </li>
  /// <li>
  /// For Amazon Bedrock AgentCore Runtime, the valid values are
  /// <code>APPLICATION_LOGS</code>, <code>USAGE_LOGS</code> and
  /// <code>TRACES</code>.
  /// </li>
  /// <li>
  /// For Amazon Bedrock AgentCore Tools, the valid values are
  /// <code>APPLICATION_LOGS</code>, <code>USAGE_LOGS</code> and
  /// <code>TRACES</code>.
  /// </li>
  /// <li>
  /// For Amazon Bedrock AgentCore Identity, the valid values are
  /// <code>APPLICATION_LOGS</code> and <code>TRACES</code>.
  /// </li>
  /// <li>
  /// For Amazon Bedrock AgentCore Memory, the valid values are
  /// <code>APPLICATION_LOGS</code> and <code>TRACES</code>.
  /// </li>
  /// <li>
  /// For Amazon Bedrock AgentCore Gateway, the valid values are
  /// <code>APPLICATION_LOGS</code> and <code>TRACES</code>.
  /// </li>
  /// <li>
  /// For CloudFront, the valid value is <code>ACCESS_LOGS</code>.
  /// </li>
  /// <li>
  /// For DevOps Agent, the valid value is <code>APPLICATION_LOGS</code>.
  /// </li>
  /// <li>
  /// For Amazon CodeWhisperer, the valid value is <code>EVENT_LOGS</code>.
  /// </li>
  /// <li>
  /// For Elemental MediaPackage, the valid values are
  /// <code>EGRESS_ACCESS_LOGS</code> and <code>INGRESS_ACCESS_LOGS</code>.
  /// </li>
  /// <li>
  /// For Elemental MediaTailor, the valid values are
  /// <code>AD_DECISION_SERVER_LOGS</code>, <code>MANIFEST_SERVICE_LOGS</code>,
  /// and <code>TRANSCODE_LOGS</code>.
  /// </li>
  /// <li>
  /// For Amazon EKS Auto Mode, the valid values are
  /// <code>AUTO_MODE_BLOCK_STORAGE_LOGS</code>,
  /// <code>AUTO_MODE_COMPUTE_LOGS</code>, <code>AUTO_MODE_IPAM_LOGS</code>, and
  /// <code>AUTO_MODE_LOAD_BALANCING_LOGS</code>.
  /// </li>
  /// <li>
  /// For Entity Resolution, the valid value is <code>WORKFLOW_LOGS</code>.
  /// </li>
  /// <li>
  /// For IAM Identity Center, the valid value is <code>ERROR_LOGS</code>.
  /// </li>
  /// <li>
  /// For Network Firewall Proxy, the valid values are <code>ALERT_LOGS</code>,
  /// <code>ALLOW_LOGS</code>, and <code>DENY_LOGS</code>.
  /// </li>
  /// <li>
  /// For Network Load Balancer, the valid value is
  /// <code>NLB_ACCESS_LOGS</code>.
  /// </li>
  /// <li>
  /// For PCS, the valid values are <code>PCS_SCHEDULER_LOGS</code>,
  /// <code>PCS_JOBCOMP_LOGS</code>, and <code>PCS_SCHEDULER_AUDIT_LOGS</code>.
  /// </li>
  /// <li>
  /// For Quick, the valid values are <code>CHAT_LOGS</code> and
  /// <code>FEEDBACK_LOGS</code>.
  /// </li>
  /// <li>
  /// For Amazon Web Services RTB Fabric, the valid values is
  /// <code>APPLICATION_LOGS</code>.
  /// </li>
  /// <li>
  /// For Amazon Q, the valid values are <code>EVENT_LOGS</code> and
  /// <code>SYNC_JOB_LOGS</code>.
  /// </li>
  /// <li>
  /// For Amazon Web Services Security Hub CSPM, the valid value is
  /// <code>SECURITY_FINDING_LOGS</code>.
  /// </li>
  /// <li>
  /// For Amazon Web Services Security Hub, the valid value is
  /// <code>SECURITY_FINDING_LOGS</code>.
  /// </li>
  /// <li>
  /// For Amazon SES mail manager, the valid values are
  /// <code>APPLICATION_LOGS</code> and <code>TRAFFIC_POLICY_DEBUG_LOGS</code>.
  /// </li>
  /// <li>
  /// For Amazon WorkMail, the valid values are
  /// <code>ACCESS_CONTROL_LOGS</code>, <code>AUTHENTICATION_LOGS</code>,
  /// <code>WORKMAIL_AVAILABILITY_PROVIDER_LOGS</code>,
  /// <code>WORKMAIL_MAILBOX_ACCESS_LOGS</code>, and
  /// <code>WORKMAIL_PERSONAL_ACCESS_TOKEN_LOGS</code>.
  /// </li>
  /// <li>
  /// For Amazon VPC Route Server, the valid value is <code>EVENT_LOGS</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [name] :
  /// A name for this delivery source. This name must be unique for all delivery
  /// sources in your account.
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the Amazon Web Services resource that is generating and sending
  /// logs. For example,
  /// <code>arn:aws:workmail:us-east-1:123456789012:organization/m-1234EXAMPLEabcd1234abcd1234abcd1234</code>
  ///
  /// For the <code>SECURITY_FINDING_LOGS</code> logType, use a wildcard ARN for
  /// the hub resource. For Amazon Web Services Security Hub CSPM, use
  /// <code>arn:aws:securityhub:us-east-1:111122223333:hub/*</code> and for
  /// Amazon Web Services Security Hub, use
  /// <code>arn:aws:securityhub:us-east-1:111122223333:hubv2/*</code>
  ///
  /// Parameter [deliverySourceConfiguration] :
  /// A map of key-value pairs to configure the delivery source. Both keys and
  /// values must be between 1 and 255 characters in length. For example,
  /// <code>{"samplingRate": "50"}</code>.
  ///
  /// Parameter [tags] :
  /// An optional list of key-value pairs to associate with the resource.
  ///
  /// For more information about tagging, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// Amazon Web Services resources</a>
  Future<PutDeliverySourceResponse> putDeliverySource({
    required String logType,
    required String name,
    required String resourceArn,
    Map<String, String>? deliverySourceConfiguration,
    Map<String, String>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.PutDeliverySource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'logType': logType,
        'name': name,
        'resourceArn': resourceArn,
        if (deliverySourceConfiguration != null)
          'deliverySourceConfiguration': deliverySourceConfiguration,
        if (tags != null) 'tags': tags,
      },
    );

    return PutDeliverySourceResponse.fromJson(jsonResponse.body);
  }

  /// Creates or updates a destination. This operation is used only to create
  /// destinations for cross-account subscriptions.
  ///
  /// A destination encapsulates a physical resource (such as an Amazon Kinesis
  /// stream). With a destination, you can subscribe to a real-time stream of
  /// log events for a different account, ingested using <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutLogEvents.html">PutLogEvents</a>.
  ///
  /// Through an access policy, a destination controls what is written to it. By
  /// default, <code>PutDestination</code> does not set any access policy with
  /// the destination, which means a cross-account user cannot call <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutSubscriptionFilter.html">PutSubscriptionFilter</a>
  /// against this destination. To enable this, the destination owner must call
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDestinationPolicy.html">PutDestinationPolicy</a>
  /// after <code>PutDestination</code>.
  ///
  /// To perform a <code>PutDestination</code> operation, you must also have the
  /// <code>iam:PassRole</code> permission.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [OperationAbortedException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [destinationName] :
  /// A name for the destination.
  ///
  /// Parameter [roleArn] :
  /// The ARN of an IAM role that grants CloudWatch Logs permissions to call the
  /// Amazon Kinesis <code>PutRecord</code> operation on the destination stream.
  ///
  /// Parameter [targetArn] :
  /// The ARN of an Amazon Kinesis stream to which to deliver matching log
  /// events.
  ///
  /// Parameter [tags] :
  /// An optional list of key-value pairs to associate with the resource.
  ///
  /// For more information about tagging, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// Amazon Web Services resources</a>
  Future<PutDestinationResponse> putDestination({
    required String destinationName,
    required String roleArn,
    required String targetArn,
    Map<String, String>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.PutDestination'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'destinationName': destinationName,
        'roleArn': roleArn,
        'targetArn': targetArn,
        if (tags != null) 'tags': tags,
      },
    );

    return PutDestinationResponse.fromJson(jsonResponse.body);
  }

  /// Creates or updates an access policy associated with an existing
  /// destination. An access policy is an <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies_overview.html">IAM
  /// policy document</a> that is used to authorize claims to register a
  /// subscription filter against a given destination.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [OperationAbortedException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [accessPolicy] :
  /// An IAM policy document that authorizes cross-account users to deliver
  /// their log events to the associated destination. This can be up to 5120
  /// bytes.
  ///
  /// Parameter [destinationName] :
  /// A name for an existing destination.
  ///
  /// Parameter [forceUpdate] :
  /// Specify true if you are updating an existing destination policy to grant
  /// permission to an organization ID instead of granting permission to
  /// individual Amazon Web Services accounts. Before you update a destination
  /// policy this way, you must first update the subscription filters in the
  /// accounts that send logs to this destination. If you do not, the
  /// subscription filters might stop working. By specifying <code>true</code>
  /// for <code>forceUpdate</code>, you are affirming that you have already
  /// updated the subscription filters. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/Cross-Account-Log_Subscription-Update.html">
  /// Updating an existing cross-account subscription</a>
  ///
  /// If you omit this parameter, the default of <code>false</code> is used.
  Future<void> putDestinationPolicy({
    required String accessPolicy,
    required String destinationName,
    bool? forceUpdate,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.PutDestinationPolicy'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'accessPolicy': accessPolicy,
        'destinationName': destinationName,
        if (forceUpdate != null) 'forceUpdate': forceUpdate,
      },
    );
  }

  /// Creates or updates a <i>field index policy</i> for the specified log
  /// group. Only log groups in the Standard log class support field index
  /// policies. For more information about log classes, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch_Logs_Log_Classes.html">Log
  /// classes</a>.
  ///
  /// You can use field index policies to create <i>field indexes</i> on fields
  /// found in log events in the log group. Creating field indexes speeds up and
  /// lowers the costs for CloudWatch Logs Insights queries that reference those
  /// field indexes, because these queries attempt to skip the processing of log
  /// events that are known to not match the indexed field. Good fields to index
  /// are fields that you often need to query for and fields or values that
  /// match only a small fraction of the total log events. Common examples of
  /// indexes include request ID, session ID, userID, and instance IDs. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatchLogs-Field-Indexing.html">Create
  /// field indexes to improve query performance and reduce costs</a>.
  ///
  /// You can configure indexed fields as <i>facets</i> to enable interactive
  /// exploration and filtering of your logs in the CloudWatch Logs Insights
  /// console. Facets allow you to view value distributions and counts for
  /// indexed fields without running queries. When you create a field index, you
  /// can optionally set it as a facet to enable this interactive analysis
  /// capability. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatchLogs-Facets.html">Use
  /// facets to group and explore logs</a>.
  ///
  /// To find the fields that are in your log group events, use the <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_GetLogGroupFields.html">GetLogGroupFields</a>
  /// operation.
  ///
  /// For example, suppose you have created a field index for
  /// <code>requestId</code>. Then, any CloudWatch Logs Insights query on that
  /// log group that includes <code>requestId = <i>value</i> </code> or
  /// <code>requestId IN [<i>value</i>, <i>value</i>, ...]</code> will process
  /// fewer log events to reduce costs, and have improved performance.
  ///
  /// CloudWatch Logs provides default field indexes for all log groups in the
  /// Standard log class. Default field indexes are automatically available for
  /// the following fields:
  ///
  /// <ul>
  /// <li>
  /// <code>@logStream</code>
  /// </li>
  /// <li>
  /// <code>@aws.region</code>
  /// </li>
  /// <li>
  /// <code>@aws.account</code>
  /// </li>
  /// <li>
  /// <code>@source.log</code>
  /// </li>
  /// <li>
  /// <code>traceId</code>
  /// </li>
  /// </ul>
  /// Default field indexes are in addition to any custom field indexes you
  /// define within your policy. Default field indexes are not counted towards
  /// your field index quota.
  ///
  /// Each index policy has the following quotas and restrictions:
  ///
  /// <ul>
  /// <li>
  /// As many as 20 fields can be included in the policy.
  /// </li>
  /// <li>
  /// Each field name can include as many as 100 characters.
  /// </li>
  /// </ul>
  /// Matches of log events to the names of indexed fields are case-sensitive.
  /// For example, a field index of <code>RequestId</code> won't match a log
  /// event containing <code>requestId</code>.
  ///
  /// Log group-level field index policies created with
  /// <code>PutIndexPolicy</code> override account-level field index policies
  /// created with <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutAccountPolicy.html">PutAccountPolicy</a>
  /// that apply to log groups. If you use <code>PutIndexPolicy</code> to create
  /// a field index policy for a log group, that log group uses only that policy
  /// for log group-level indexing, including any facet configurations. The log
  /// group ignores any account-wide field index policy that applies to log
  /// groups, but data source-based account policies may still apply.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [LimitExceededException].
  /// May throw [OperationAbortedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [logGroupIdentifier] :
  /// Specify either the log group name or log group ARN to apply this field
  /// index policy to. If you specify an ARN, use the format
  /// arn:aws:logs:<i>region</i>:<i>account-id</i>:log-group:<i>log_group_name</i>
  /// Don't include an * at the end.
  ///
  /// Parameter [policyDocument] :
  /// The index policy document, in JSON format. The following is an example of
  /// an index policy document that creates indexes with different types.
  ///
  /// <code>"policyDocument": "{"Fields": [ "TransactionId" ], "FieldsV2":
  /// {"RequestId": {"type": "FIELD_INDEX"}, "APIName": {"type": "FACET"},
  /// "StatusCode": {"type": "FACET"}}}"</code>
  ///
  /// You can use <code>FieldsV2</code> to specify the type for each field.
  /// Supported types are <code>FIELD_INDEX</code> and <code>FACET</code>. Field
  /// names within <code>Fields</code> and <code>FieldsV2</code> must be
  /// mutually exclusive.
  ///
  /// The policy document must include at least one field index. For more
  /// information about the fields that can be included and other restrictions,
  /// see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatchLogs-Field-Indexing-Syntax.html">Field
  /// index syntax and quotas</a>.
  Future<PutIndexPolicyResponse> putIndexPolicy({
    required String logGroupIdentifier,
    required String policyDocument,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.PutIndexPolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'logGroupIdentifier': logGroupIdentifier,
        'policyDocument': policyDocument,
      },
    );

    return PutIndexPolicyResponse.fromJson(jsonResponse.body);
  }

  /// Creates an integration between CloudWatch Logs and another service in this
  /// account. Currently, only integrations with OpenSearch Service are
  /// supported, and currently you can have only one integration in your
  /// account.
  ///
  /// Integrating with OpenSearch Service makes it possible for you to create
  /// curated vended logs dashboards, powered by OpenSearch Service analytics.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatchLogs-OpenSearch-Dashboards.html">Vended
  /// log dashboards powered by Amazon OpenSearch Service</a>.
  ///
  /// You can use this operation only to create a new integration. You can't
  /// modify an existing integration.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ValidationException].
  ///
  /// Parameter [integrationName] :
  /// A name for the integration.
  ///
  /// Parameter [integrationType] :
  /// The type of integration. Currently, the only supported type is
  /// <code>OPENSEARCH</code>.
  ///
  /// Parameter [resourceConfig] :
  /// A structure that contains configuration information for the integration
  /// that you are creating.
  Future<PutIntegrationResponse> putIntegration({
    required String integrationName,
    required IntegrationType integrationType,
    required ResourceConfig resourceConfig,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.PutIntegration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'integrationName': integrationName,
        'integrationType': integrationType.value,
        'resourceConfig': resourceConfig,
      },
    );

    return PutIntegrationResponse.fromJson(jsonResponse.body);
  }

  /// Uploads a batch of log events to the specified log stream.
  /// <important>
  /// The sequence token is now ignored in <code>PutLogEvents</code> actions.
  /// <code>PutLogEvents</code> actions are always accepted and never return
  /// <code>InvalidSequenceTokenException</code> or
  /// <code>DataAlreadyAcceptedException</code> even if the sequence token is
  /// not valid. You can use parallel <code>PutLogEvents</code> actions on the
  /// same log stream.
  /// </important>
  /// The batch of events must satisfy the following constraints:
  ///
  /// <ul>
  /// <li>
  /// The maximum batch size is 1,048,576 bytes. This size is calculated as the
  /// sum of all event messages in UTF-8, plus 26 bytes for each log event.
  /// </li>
  /// <li>
  /// Events more than 2 hours in the future are rejected while processing
  /// remaining valid events.
  /// </li>
  /// <li>
  /// Events older than 14 days or preceding the log group's retention period
  /// are rejected while processing remaining valid events.
  /// </li>
  /// <li>
  /// The log events in the batch must be in chronological order by their
  /// timestamp. The timestamp is the time that the event occurred, expressed as
  /// the number of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>.
  /// (In Amazon Web Services Tools for PowerShell and the Amazon Web Services
  /// SDK for .NET, the timestamp is specified in .NET format:
  /// <code>yyyy-mm-ddThh:mm:ss</code>. For example,
  /// <code>2017-09-15T13:45:30</code>.)
  /// </li>
  /// <li>
  /// A batch of log events in a single request must be in a chronological
  /// order. Otherwise, the operation fails.
  /// </li>
  /// <li>
  /// Each log event can be no larger than 1 MB.
  /// </li>
  /// <li>
  /// The maximum number of log events in a batch is 10,000.
  /// </li>
  /// <li>
  /// For valid events (within 14 days in the past to 2 hours in future), the
  /// time span in a single batch cannot exceed 24 hours. Otherwise, the
  /// operation fails.
  /// </li>
  /// </ul> <important>
  /// The quota of five requests per second per log stream has been removed.
  /// Instead, <code>PutLogEvents</code> actions are throttled based on a
  /// per-second per-account quota. You can request an increase to the
  /// per-second throttling quota by using the Service Quotas service.
  /// </important>
  /// If a call to <code>PutLogEvents</code> returns
  /// "UnrecognizedClientException" the most likely cause is a non-valid Amazon
  /// Web Services access key ID or secret key.
  ///
  /// May throw [DataAlreadyAcceptedException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidSequenceTokenException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnrecognizedClientException].
  ///
  /// Parameter [logEvents] :
  /// The log events.
  ///
  /// Parameter [logGroupName] :
  /// The name of the log group.
  ///
  /// Parameter [logStreamName] :
  /// The name of the log stream.
  ///
  /// Parameter [entity] :
  /// The entity associated with the log events.
  ///
  /// Parameter [sequenceToken] :
  /// The sequence token obtained from the response of the previous
  /// <code>PutLogEvents</code> call.
  /// <important>
  /// The <code>sequenceToken</code> parameter is now ignored in
  /// <code>PutLogEvents</code> actions. <code>PutLogEvents</code> actions are
  /// now accepted and never return <code>InvalidSequenceTokenException</code>
  /// or <code>DataAlreadyAcceptedException</code> even if the sequence token is
  /// not valid.
  /// </important>
  Future<PutLogEventsResponse> putLogEvents({
    required List<InputLogEvent> logEvents,
    required String logGroupName,
    required String logStreamName,
    Entity? entity,
    String? sequenceToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.PutLogEvents'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'logEvents': logEvents,
        'logGroupName': logGroupName,
        'logStreamName': logStreamName,
        if (entity != null) 'entity': entity,
        if (sequenceToken != null) 'sequenceToken': sequenceToken,
      },
    );

    return PutLogEventsResponse.fromJson(jsonResponse.body);
  }

  /// Enables or disables deletion protection for the specified log group. When
  /// enabled on a log group, deletion protection blocks all deletion operations
  /// until it is explicitly disabled.
  ///
  /// For information about the parameters that are common to all actions, see
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/CommonParameters.html">Common
  /// Parameters</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidOperationException].
  /// May throw [InvalidParameterException].
  /// May throw [OperationAbortedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [deletionProtectionEnabled] :
  /// Whether to enable deletion protection.
  ///
  /// Type: Boolean
  ///
  /// Required: Yes
  ///
  /// Parameter [logGroupIdentifier] :
  /// The name or ARN of the log group.
  ///
  /// Type: String
  ///
  /// Length Constraints: Minimum length of 1. Maximum length of 512.
  ///
  /// Pattern: <code>[\.\-_/#A-Za-z0-9]+</code>
  ///
  /// Required: Yes
  Future<void> putLogGroupDeletionProtection({
    required bool deletionProtectionEnabled,
    required String logGroupIdentifier,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.PutLogGroupDeletionProtection'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'deletionProtectionEnabled': deletionProtectionEnabled,
        'logGroupIdentifier': logGroupIdentifier,
      },
    );
  }

  /// Creates or updates a metric filter and associates it with the specified
  /// log group. With metric filters, you can configure rules to extract metric
  /// data from log events ingested through <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutLogEvents.html">PutLogEvents</a>.
  ///
  /// The maximum number of metric filters that can be associated with a log
  /// group is 100.
  ///
  /// Using regular expressions in filter patterns is supported. For these
  /// filters, there is a quota of two regular expression patterns within a
  /// single filter pattern. There is also a quota of five regular expression
  /// patterns per log group. For more information about using regular
  /// expressions in filter patterns, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/FilterAndPatternSyntax.html">
  /// Filter pattern syntax for metric filters, subscription filters, filter log
  /// events, and Live Tail</a>.
  ///
  /// When you create a metric filter, you can also optionally assign a unit and
  /// dimensions to the metric that is created.
  /// <important>
  /// Metrics extracted from log events are charged as custom metrics. To
  /// prevent unexpected high charges, do not specify high-cardinality fields
  /// such as <code>IPAddress</code> or <code>requestID</code> as dimensions.
  /// Each different value found for a dimension is treated as a separate metric
  /// and accrues charges as a separate custom metric.
  ///
  /// CloudWatch Logs might disable a metric filter if it generates 1,000
  /// different name/value pairs for your specified dimensions within one hour.
  ///
  /// You can also set up a billing alarm to alert you if your charges are
  /// higher than expected. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/monitor_estimated_charges_with_cloudwatch.html">
  /// Creating a Billing Alarm to Monitor Your Estimated Amazon Web Services
  /// Charges</a>.
  /// </important>
  ///
  /// May throw [InvalidOperationException].
  /// May throw [InvalidParameterException].
  /// May throw [LimitExceededException].
  /// May throw [OperationAbortedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [filterName] :
  /// A name for the metric filter.
  ///
  /// Parameter [filterPattern] :
  /// A filter pattern for extracting metric data out of ingested log events.
  ///
  /// Parameter [logGroupName] :
  /// The name of the log group.
  ///
  /// Parameter [metricTransformations] :
  /// A collection of information that defines how metric data gets emitted.
  ///
  /// Parameter [applyOnTransformedLogs] :
  /// This parameter is valid only for log groups that have an active log
  /// transformer. For more information about log transformers, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutTransformer.html">PutTransformer</a>.
  ///
  /// If the log group uses either a log-group level or account-level
  /// transformer, and you specify <code>true</code>, the metric filter will be
  /// applied on the transformed version of the log events instead of the
  /// original ingested log events.
  ///
  /// Parameter [emitSystemFieldDimensions] :
  /// A list of system fields to emit as additional dimensions in the generated
  /// metrics. Valid values are <code>@aws.account</code> and
  /// <code>@aws.region</code>. These dimensions help identify the source of
  /// centralized log data and count toward the total dimension limit for metric
  /// filters.
  ///
  /// Parameter [fieldSelectionCriteria] :
  /// A filter expression that specifies which log events should be processed by
  /// this metric filter based on system fields such as source account and
  /// source region. Uses selection criteria syntax with operators like
  /// <code>=</code>, <code>!=</code>, <code>AND</code>, <code>OR</code>,
  /// <code>IN</code>, <code>NOT IN</code>. Example: <code>@aws.region =
  /// "us-east-1"</code> or <code>@aws.account IN ["123456789012",
  /// "987654321098"]</code>. Maximum length: 2000 characters.
  Future<void> putMetricFilter({
    required String filterName,
    required String filterPattern,
    required String logGroupName,
    required List<MetricTransformation> metricTransformations,
    bool? applyOnTransformedLogs,
    List<String>? emitSystemFieldDimensions,
    String? fieldSelectionCriteria,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.PutMetricFilter'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'filterName': filterName,
        'filterPattern': filterPattern,
        'logGroupName': logGroupName,
        'metricTransformations': metricTransformations,
        if (applyOnTransformedLogs != null)
          'applyOnTransformedLogs': applyOnTransformedLogs,
        if (emitSystemFieldDimensions != null)
          'emitSystemFieldDimensions': emitSystemFieldDimensions,
        if (fieldSelectionCriteria != null)
          'fieldSelectionCriteria': fieldSelectionCriteria,
      },
    );
  }

  /// Creates or updates a query definition for CloudWatch Logs Insights. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AnalyzingLogData.html">Analyzing
  /// Log Data with CloudWatch Logs Insights</a>.
  ///
  /// To update a query definition, specify its <code>queryDefinitionId</code>
  /// in your request. The values of <code>name</code>,
  /// <code>queryString</code>, and <code>logGroupNames</code> are changed to
  /// the values that you specify in your update operation. No current values
  /// are retained from the current query definition. For example, imagine
  /// updating a current query definition that includes log groups. If you don't
  /// specify the <code>logGroupNames</code> parameter in your update operation,
  /// the query definition changes to contain no log groups.
  ///
  /// You must have the <code>logs:PutQueryDefinition</code> permission to be
  /// able to perform this operation.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [name] :
  /// A name for the query definition. If you are saving numerous query
  /// definitions, we recommend that you name them. This way, you can find the
  /// ones you want by using the first part of the name as a filter in the
  /// <code>queryDefinitionNamePrefix</code> parameter of <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeQueryDefinitions.html">DescribeQueryDefinitions</a>.
  ///
  /// Parameter [queryString] :
  /// The query string to use for this definition. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_QuerySyntax.html">CloudWatch
  /// Logs Insights Query Syntax</a>.
  ///
  /// Parameter [clientToken] :
  /// Used as an idempotency token, to avoid returning an exception if the
  /// service receives the same request twice because of a network error.
  ///
  /// Parameter [logGroupNames] :
  /// Use this parameter to include specific log groups as part of your query
  /// definition. If your query uses the OpenSearch Service query language, you
  /// specify the log group names inside the <code>querystring</code> instead of
  /// here.
  ///
  /// If you are updating an existing query definition for the Logs Insights QL
  /// or OpenSearch Service PPL and you omit this parameter, then the updated
  /// definition will contain no log groups.
  ///
  /// Parameter [parameters] :
  /// Use this parameter to include specific query parameters as part of your
  /// query definition. Query parameters are supported only for Logs Insights QL
  /// queries. Query parameters allow you to use placeholder variables in your
  /// query string that are substituted with values at execution time. Use the
  /// <code>{{parameterName}}</code> syntax in your query string to reference a
  /// parameter.
  ///
  /// Parameter [queryDefinitionId] :
  /// If you are updating a query definition, use this parameter to specify the
  /// ID of the query definition that you want to update. You can use <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeQueryDefinitions.html">DescribeQueryDefinitions</a>
  /// to retrieve the IDs of your saved query definitions.
  ///
  /// If you are creating a query definition, do not specify this parameter.
  /// CloudWatch generates a unique ID for the new query definition and include
  /// it in the response to this operation.
  ///
  /// Parameter [queryLanguage] :
  /// Specify the query language to use for this query. The options are Logs
  /// Insights QL, OpenSearch PPL, and OpenSearch SQL. For more information
  /// about the query languages that CloudWatch Logs supports, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_AnalyzeLogData_Languages.html">Supported
  /// query languages</a>.
  Future<PutQueryDefinitionResponse> putQueryDefinition({
    required String name,
    required String queryString,
    String? clientToken,
    List<String>? logGroupNames,
    List<QueryParameter>? parameters,
    String? queryDefinitionId,
    QueryLanguage? queryLanguage,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.PutQueryDefinition'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
        'queryString': queryString,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (logGroupNames != null) 'logGroupNames': logGroupNames,
        if (parameters != null) 'parameters': parameters,
        if (queryDefinitionId != null) 'queryDefinitionId': queryDefinitionId,
        if (queryLanguage != null) 'queryLanguage': queryLanguage.value,
      },
    );

    return PutQueryDefinitionResponse.fromJson(jsonResponse.body);
  }

  /// Creates or updates a resource policy allowing other Amazon Web Services
  /// services to put log events to this account, such as Amazon Route 53. This
  /// API has the following restrictions:
  ///
  /// <ul>
  /// <li>
  /// <b>Supported actions</b> - Policy only supports
  /// <code>logs:PutLogEvents</code> and <code>logs:CreateLogStream </code>
  /// actions
  /// </li>
  /// <li>
  /// <b>Supported principals</b> - Policy only applies when operations are
  /// invoked by Amazon Web Services service principals (not IAM users, roles,
  /// or cross-account principals
  /// </li>
  /// <li>
  /// <b>Policy limits</b> - An account can have a maximum of 10 policies
  /// without resourceARN and one per LogGroup resourceARN
  /// </li>
  /// </ul> <important>
  /// Resource policies with actions invoked by non-Amazon Web Services service
  /// principals (such as IAM users, roles, or other Amazon Web Services
  /// accounts) will not be enforced. For access control involving these
  /// principals, use the IAM policies.
  /// </important>
  ///
  /// May throw [InvalidParameterException].
  /// May throw [LimitExceededException].
  /// May throw [OperationAbortedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [expectedRevisionId] :
  /// The expected revision ID of the resource policy. Required when
  /// <code>resourceArn</code> is provided to prevent concurrent modifications.
  /// Use <code>null</code> when creating a resource policy for the first time.
  ///
  /// Parameter [policyDocument] :
  /// Details of the new policy, including the identity of the principal that is
  /// enabled to put logs to this account. This is formatted as a JSON string.
  /// This parameter is required.
  ///
  /// The following example creates a resource policy enabling the Route 53
  /// service to put DNS query logs in to the specified log group. Replace
  /// <code>"logArn"</code> with the ARN of your CloudWatch Logs resource, such
  /// as a log group or log stream.
  ///
  /// CloudWatch Logs also supports <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_condition-keys.html#condition-keys-sourcearn">aws:SourceArn</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_condition-keys.html#condition-keys-sourceaccount">aws:SourceAccount</a>
  /// condition context keys.
  ///
  /// In the example resource policy, you would replace the value of
  /// <code>SourceArn</code> with the resource making the call from Route 53 to
  /// CloudWatch Logs. You would also replace the value of
  /// <code>SourceAccount</code> with the Amazon Web Services account ID making
  /// that call.
  ///
  ///
  ///
  /// <code>{ "Version": "2012-10-17", "Statement": [ { "Sid":
  /// "Route53LogsToCloudWatchLogs", "Effect": "Allow", "Principal": {
  /// "Service": [ "route53.amazonaws.com" ] }, "Action": "logs:PutLogEvents",
  /// "Resource": "logArn", "Condition": { "ArnLike": { "aws:SourceArn":
  /// "myRoute53ResourceArn" }, "StringEquals": { "aws:SourceAccount":
  /// "myAwsAccountId" } } } ] }</code>
  ///
  /// Parameter [policyName] :
  /// Name of the new policy. This parameter is required.
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the CloudWatch Logs resource to which the resource policy needs
  /// to be added or attached. Currently only supports LogGroup ARN.
  Future<PutResourcePolicyResponse> putResourcePolicy({
    String? expectedRevisionId,
    String? policyDocument,
    String? policyName,
    String? resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.PutResourcePolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (expectedRevisionId != null)
          'expectedRevisionId': expectedRevisionId,
        if (policyDocument != null) 'policyDocument': policyDocument,
        if (policyName != null) 'policyName': policyName,
        if (resourceArn != null) 'resourceArn': resourceArn,
      },
    );

    return PutResourcePolicyResponse.fromJson(jsonResponse.body);
  }

  /// Sets the retention of the specified log group. With a retention policy,
  /// you can configure the number of days for which to retain log events in the
  /// specified log group.
  /// <note>
  /// CloudWatch Logs doesn't immediately delete log events when they reach
  /// their retention setting. It typically takes up to 72 hours after that
  /// before log events are deleted, but in rare situations might take longer.
  ///
  /// To illustrate, imagine that you change a log group to have a longer
  /// retention setting when it contains log events that are past the expiration
  /// date, but haven't been deleted. Those log events will take up to 72 hours
  /// to be deleted after the new retention date is reached. To make sure that
  /// log data is deleted permanently, keep a log group at its lower retention
  /// setting until 72 hours after the previous retention period ends.
  /// Alternatively, wait to change the retention setting until you confirm that
  /// the earlier log events are deleted.
  ///
  /// When log events reach their retention setting they are marked for
  /// deletion. After they are marked for deletion, they do not add to your
  /// archival storage costs anymore, even if they are not actually deleted
  /// until later. These log events marked for deletion are also not included
  /// when you use an API to retrieve the <code>storedBytes</code> value to see
  /// how many bytes a log group is storing.
  /// </note>
  ///
  /// May throw [InvalidParameterException].
  /// May throw [OperationAbortedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [logGroupName] :
  /// The name of the log group.
  Future<void> putRetentionPolicy({
    required String logGroupName,
    required int retentionInDays,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.PutRetentionPolicy'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'logGroupName': logGroupName,
        'retentionInDays': retentionInDays,
      },
    );
  }

  /// Creates or updates a subscription filter and associates it with the
  /// specified log group. With subscription filters, you can subscribe to a
  /// real-time stream of log events ingested through <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutLogEvents.html">PutLogEvents</a>
  /// and have them delivered to a specific destination. When log events are
  /// sent to the receiving service, they are Base64 encoded and compressed with
  /// the GZIP format.
  ///
  /// The following destinations are supported for subscription filters:
  ///
  /// <ul>
  /// <li>
  /// An Amazon Kinesis data stream belonging to the same account as the
  /// subscription filter, for same-account delivery.
  /// </li>
  /// <li>
  /// A logical destination created with <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDestination.html">PutDestination</a>
  /// that belongs to a different account, for cross-account delivery. We
  /// currently support Kinesis Data Streams and Firehose as logical
  /// destinations.
  /// </li>
  /// <li>
  /// An Amazon Kinesis Data Firehose delivery stream that belongs to the same
  /// account as the subscription filter, for same-account delivery.
  /// </li>
  /// <li>
  /// An Lambda function that belongs to the same account as the subscription
  /// filter, for same-account delivery.
  /// </li>
  /// </ul>
  /// Each log group can have up to two subscription filters associated with it.
  /// If you are updating an existing filter, you must specify the correct name
  /// in <code>filterName</code>.
  ///
  /// Using regular expressions in filter patterns is supported. For these
  /// filters, there is a quotas of quota of two regular expression patterns
  /// within a single filter pattern. There is also a quota of five regular
  /// expression patterns per log group. For more information about using
  /// regular expressions in filter patterns, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/FilterAndPatternSyntax.html">
  /// Filter pattern syntax for metric filters, subscription filters, filter log
  /// events, and Live Tail</a>.
  ///
  /// To perform a <code>PutSubscriptionFilter</code> operation for any
  /// destination except a Lambda function, you must also have the
  /// <code>iam:PassRole</code> permission.
  ///
  /// May throw [InvalidOperationException].
  /// May throw [InvalidParameterException].
  /// May throw [LimitExceededException].
  /// May throw [OperationAbortedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [destinationArn] :
  /// The ARN of the destination to deliver matching log events to. Currently,
  /// the supported destinations are:
  ///
  /// <ul>
  /// <li>
  /// An Amazon Kinesis stream belonging to the same account as the subscription
  /// filter, for same-account delivery.
  /// </li>
  /// <li>
  /// A logical destination (specified using an ARN) belonging to a different
  /// account, for cross-account delivery.
  ///
  /// If you're setting up a cross-account subscription, the destination must
  /// have an IAM policy associated with it. The IAM policy must allow the
  /// sender to send logs to the destination. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDestinationPolicy.html">PutDestinationPolicy</a>.
  /// </li>
  /// <li>
  /// A Kinesis Data Firehose delivery stream belonging to the same account as
  /// the subscription filter, for same-account delivery.
  /// </li>
  /// <li>
  /// A Lambda function belonging to the same account as the subscription
  /// filter, for same-account delivery.
  /// </li>
  /// </ul>
  ///
  /// Parameter [filterName] :
  /// A name for the subscription filter. If you are updating an existing
  /// filter, you must specify the correct name in <code>filterName</code>. To
  /// find the name of the filter currently associated with a log group, use <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeSubscriptionFilters.html">DescribeSubscriptionFilters</a>.
  ///
  /// Parameter [filterPattern] :
  /// A filter pattern for subscribing to a filtered stream of log events.
  ///
  /// Parameter [logGroupName] :
  /// The name of the log group.
  ///
  /// Parameter [applyOnTransformedLogs] :
  /// This parameter is valid only for log groups that have an active log
  /// transformer. For more information about log transformers, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutTransformer.html">PutTransformer</a>.
  ///
  /// If the log group uses either a log-group level or account-level
  /// transformer, and you specify <code>true</code>, the subscription filter
  /// will be applied on the transformed version of the log events instead of
  /// the original ingested log events.
  ///
  /// Parameter [distribution] :
  /// The method used to distribute log data to the destination. By default, log
  /// data is grouped by log stream, but the grouping can be set to random for a
  /// more even distribution. This property is only applicable when the
  /// destination is an Amazon Kinesis data stream.
  ///
  /// Parameter [emitSystemFields] :
  /// A list of system fields to include in the log events sent to the
  /// subscription destination. Valid values are <code>@aws.account</code> and
  /// <code>@aws.region</code>. These fields provide source information for
  /// centralized log data in the forwarded payload.
  ///
  /// Parameter [fieldSelectionCriteria] :
  /// A filter expression that specifies which log events should be processed by
  /// this subscription filter based on system fields such as source account and
  /// source region. Uses selection criteria syntax with operators like
  /// <code>=</code>, <code>!=</code>, <code>AND</code>, <code>OR</code>,
  /// <code>IN</code>, <code>NOT IN</code>. Example: <code>@aws.region NOT IN
  /// ["cn-north-1"]</code> or <code>@aws.account = "123456789012" AND
  /// @aws.region = "us-east-1"</code>. Maximum length: 2000 characters.
  ///
  /// Parameter [roleArn] :
  /// The ARN of an IAM role that grants CloudWatch Logs permissions to deliver
  /// ingested log events to the destination stream. You don't need to provide
  /// the ARN when you are working with a logical destination for cross-account
  /// delivery.
  Future<void> putSubscriptionFilter({
    required String destinationArn,
    required String filterName,
    required String filterPattern,
    required String logGroupName,
    bool? applyOnTransformedLogs,
    Distribution? distribution,
    List<String>? emitSystemFields,
    String? fieldSelectionCriteria,
    String? roleArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.PutSubscriptionFilter'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'destinationArn': destinationArn,
        'filterName': filterName,
        'filterPattern': filterPattern,
        'logGroupName': logGroupName,
        if (applyOnTransformedLogs != null)
          'applyOnTransformedLogs': applyOnTransformedLogs,
        if (distribution != null) 'distribution': distribution.value,
        if (emitSystemFields != null) 'emitSystemFields': emitSystemFields,
        if (fieldSelectionCriteria != null)
          'fieldSelectionCriteria': fieldSelectionCriteria,
        if (roleArn != null) 'roleArn': roleArn,
      },
    );
  }

  /// Creates or updates a <i>log transformer</i> for a single log group. You
  /// use log transformers to transform log events into a different format,
  /// making them easier for you to process and analyze. You can also transform
  /// logs from different sources into standardized formats that contains
  /// relevant, source-specific information.
  ///
  /// After you have created a transformer, CloudWatch Logs performs the
  /// transformations at the time of log ingestion. You can then refer to the
  /// transformed versions of the logs during operations such as querying with
  /// CloudWatch Logs Insights or creating metric filters or subscription
  /// filers.
  ///
  /// You can also use a transformer to copy metadata from metadata keys into
  /// the log events themselves. This metadata can include log group name, log
  /// stream name, account ID and Region.
  ///
  /// A transformer for a log group is a series of processors, where each
  /// processor applies one type of transformation to the log events ingested
  /// into this log group. The processors work one after another, in the order
  /// that you list them, like a pipeline. For more information about the
  /// available processors to use in a transformer, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-Processors">
  /// Processors that you can use</a>.
  ///
  /// Having log events in standardized format enables visibility across your
  /// applications for your log analysis, reporting, and alarming needs.
  /// CloudWatch Logs provides transformation for common log types with
  /// out-of-the-box transformation templates for major Amazon Web Services log
  /// sources such as VPC flow logs, Lambda, and Amazon RDS. You can use
  /// pre-built transformation templates or create custom transformation
  /// policies.
  ///
  /// You can create transformers only for the log groups in the Standard log
  /// class.
  ///
  /// You can also set up a transformer at the account level. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutAccountPolicy.html">PutAccountPolicy</a>.
  /// If there is both a log-group level transformer created with
  /// <code>PutTransformer</code> and an account-level transformer that could
  /// apply to the same log group, the log group uses only the log-group level
  /// transformer. It ignores the account-level transformer.
  ///
  /// May throw [InvalidOperationException].
  /// May throw [InvalidParameterException].
  /// May throw [LimitExceededException].
  /// May throw [OperationAbortedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [logGroupIdentifier] :
  /// Specify either the name or ARN of the log group to create the transformer
  /// for.
  ///
  /// Parameter [transformerConfig] :
  /// This structure contains the configuration of this log transformer. A log
  /// transformer is an array of processors, where each processor applies one
  /// type of transformation to the log events that are ingested.
  Future<void> putTransformer({
    required String logGroupIdentifier,
    required List<Processor> transformerConfig,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.PutTransformer'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'logGroupIdentifier': logGroupIdentifier,
        'transformerConfig': transformerConfig,
      },
    );
  }

  /// Starts a Live Tail streaming session for one or more log groups. A Live
  /// Tail session returns a stream of log events that have been recently
  /// ingested in the log groups. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatchLogs_LiveTail.html">Use
  /// Live Tail to view logs in near real time</a>.
  ///
  /// The response to this operation is a response stream, over which the server
  /// sends live log events and the client receives them.
  ///
  /// The following objects are sent over the stream:
  ///
  /// <ul>
  /// <li>
  /// A single <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_LiveTailSessionStart.html">LiveTailSessionStart</a>
  /// object is sent at the start of the session.
  /// </li>
  /// <li>
  /// Every second, a <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_LiveTailSessionUpdate.html">LiveTailSessionUpdate</a>
  /// object is sent. Each of these objects contains an array of the actual log
  /// events.
  ///
  /// If no new log events were ingested in the past second, the
  /// <code>LiveTailSessionUpdate</code> object will contain an empty array.
  ///
  /// The array of log events contained in a <code>LiveTailSessionUpdate</code>
  /// can include as many as 500 log events. If the number of log events
  /// matching the request exceeds 500 per second, the log events are sampled
  /// down to 500 log events to be included in each
  /// <code>LiveTailSessionUpdate</code> object.
  ///
  /// If your client consumes the log events slower than the server produces
  /// them, CloudWatch Logs buffers up to 10 <code>LiveTailSessionUpdate</code>
  /// events or 5000 log events, after which it starts dropping the oldest
  /// events.
  /// </li>
  /// <li>
  /// A <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_StartLiveTailResponseStream.html#CWL-Type-StartLiveTailResponseStream-SessionStreamingException">SessionStreamingException</a>
  /// object is returned if an unknown error occurs on the server side.
  /// </li>
  /// <li>
  /// A <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_StartLiveTailResponseStream.html#CWL-Type-StartLiveTailResponseStream-SessionTimeoutException">SessionTimeoutException</a>
  /// object is returned when the session times out, after it has been kept open
  /// for three hours.
  /// </li>
  /// </ul> <note>
  /// The <code>StartLiveTail</code> API routes requests using SDK host prefix
  /// injection. SDK versions released before April 1, 2026 route to
  /// <code>streaming-logs.<i>Region</i>.amazonaws.com</code>, which does not
  /// support VPC endpoints. SDK versions released on or after April 1, 2026
  /// route to <code>stream-logs.<i>Region</i>.amazonaws.com</code>, which
  /// supports VPC endpoints. To set up a VPC endpoint for this API, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/cloudwatch-logs-and-interface-VPC.html#create-VPC-endpoint-for-CloudWatchLogs">Creating
  /// a VPC endpoint for CloudWatch Logs </a>.
  /// </note> <important>
  /// You can end a session before it times out by closing the session stream or
  /// by closing the client that is receiving the stream. The session also ends
  /// if the established connection between the client and the server breaks.
  /// </important>
  /// For examples of using an SDK to start a Live Tail session, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/example_cloudwatch-logs_StartLiveTail_section.html">
  /// Start a Live Tail session using an Amazon Web Services SDK</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidOperationException].
  /// May throw [InvalidParameterException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [logGroupIdentifiers] :
  /// An array where each item in the array is a log group to include in the
  /// Live Tail session.
  ///
  /// Specify each log group by its ARN.
  ///
  /// If you specify an ARN, the ARN can't end with an asterisk (*).
  /// <note>
  /// You can include up to 10 log groups.
  /// </note>
  ///
  /// Parameter [logEventFilterPattern] :
  /// An optional pattern to use to filter the results to include only log
  /// events that match the pattern. For example, a filter pattern of
  /// <code>error 404</code> causes only log events that include both
  /// <code>error</code> and <code>404</code> to be included in the Live Tail
  /// stream.
  ///
  /// Regular expression filter patterns are supported.
  ///
  /// For more information about filter pattern syntax, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/FilterAndPatternSyntax.html">Filter
  /// and Pattern Syntax</a>.
  ///
  /// Parameter [logStreamNamePrefixes] :
  /// If you specify this parameter, then only log events in the log streams
  /// that have names that start with the prefixes that you specify here are
  /// included in the Live Tail session.
  ///
  /// If you specify this field, you can't also specify the
  /// <code>logStreamNames</code> field.
  /// <note>
  /// You can specify this parameter only if you specify only one log group in
  /// <code>logGroupIdentifiers</code>.
  /// </note>
  ///
  /// Parameter [logStreamNames] :
  /// If you specify this parameter, then only log events in the log streams
  /// that you specify here are included in the Live Tail session.
  ///
  /// If you specify this field, you can't also specify the
  /// <code>logStreamNamePrefixes</code> field.
  /// <note>
  /// You can specify this parameter only if you specify only one log group in
  /// <code>logGroupIdentifiers</code>.
  /// </note>
  Future<StartLiveTailResponse> startLiveTail({
    required List<String> logGroupIdentifiers,
    String? logEventFilterPattern,
    List<String>? logStreamNamePrefixes,
    List<String>? logStreamNames,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.StartLiveTail'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'logGroupIdentifiers': logGroupIdentifiers,
        if (logEventFilterPattern != null)
          'logEventFilterPattern': logEventFilterPattern,
        if (logStreamNamePrefixes != null)
          'logStreamNamePrefixes': logStreamNamePrefixes,
        if (logStreamNames != null) 'logStreamNames': logStreamNames,
      },
    );

    return StartLiveTailResponse.fromJson(jsonResponse.body);
  }

  /// Starts a query of one or more log groups or data sources using CloudWatch
  /// Logs Insights. You specify the log groups or data sources and time range
  /// to query and the query string to use. You can query up to 10 data sources
  /// in a single query.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_QuerySyntax.html">CloudWatch
  /// Logs Insights Query Syntax</a>.
  ///
  /// After you run a query using <code>StartQuery</code>, the query results are
  /// stored by CloudWatch Logs. You can use <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_GetQueryResults.html">GetQueryResults</a>
  /// to retrieve the results of a query, using the <code>queryId</code> that
  /// <code>StartQuery</code> returns.
  ///
  /// Interactive queries started with <code>StartQuery</code> share concurrency
  /// limits with automated scheduled query executions. Both types of queries
  /// count toward the same regional concurrent query quota, so high scheduled
  /// query activity may affect the availability of concurrent slots for
  /// interactive queries.
  /// <note>
  /// To specify the log groups to query, a <code>StartQuery</code> operation
  /// must include one of the following:
  ///
  /// <ul>
  /// <li>
  /// Either exactly one of the following parameters: <code>logGroupName</code>,
  /// <code>logGroupNames</code>, or <code>logGroupIdentifiers</code>
  /// </li>
  /// <li>
  /// Or the <code>queryString</code> must include a <code>SOURCE</code> command
  /// to select log groups for the query. The <code>SOURCE</code> command can
  /// select log groups based on log group name prefix, account ID, and log
  /// class, or select data sources using dataSource syntax in LogsQL, PPL, and
  /// SQL. In LogsQL, the <code>SOURCE</code> command also supports filtering by
  /// log group tags.
  ///
  /// For more information about the <code>SOURCE</code> command, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_QuerySyntax-Source.html">SOURCE</a>.
  /// </li>
  /// </ul> </note>
  /// If you have associated a KMS key with the query results in this account,
  /// then <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_StartQuery.html">StartQuery</a>
  /// uses that key to encrypt the results when it stores them. If no key is
  /// associated with query results, the query results are encrypted with the
  /// default CloudWatch Logs encryption method.
  ///
  /// Queries time out after 60 minutes of runtime. If your queries are timing
  /// out, reduce the time range being searched or partition your query into a
  /// number of queries.
  ///
  /// If you are using CloudWatch cross-account observability, you can use this
  /// operation in a monitoring account to start a query in a linked source
  /// account. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Unified-Cross-Account.html">CloudWatch
  /// cross-account observability</a>. For a cross-account
  /// <code>StartQuery</code> operation, the query definition must be defined in
  /// the monitoring account.
  ///
  /// You can have up to 100 concurrent CloudWatch Logs insights queries,
  /// including queries that have been added to dashboards.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [LimitExceededException].
  /// May throw [MalformedQueryException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [endTime] :
  /// The end of the time range to query. The range is inclusive, so the
  /// specified end time is included in the query. Specified as epoch time, the
  /// number of seconds since <code>January 1, 1970, 00:00:00 UTC</code>.
  ///
  /// Parameter [queryString] :
  /// The query string to use. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_QuerySyntax.html">CloudWatch
  /// Logs Insights Query Syntax</a>.
  ///
  /// Parameter [startTime] :
  /// The beginning of the time range to query. The range is inclusive, so the
  /// specified start time is included in the query. Specified as epoch time,
  /// the number of seconds since <code>January 1, 1970, 00:00:00 UTC</code>.
  ///
  /// Parameter [limit] :
  /// The maximum number of log events to return in the query. If the query
  /// string uses the <code>fields</code> command, only the specified fields and
  /// their values are returned. The default is 10,000.
  ///
  /// The maximum value is 100,000.
  ///
  /// Parameter [logGroupIdentifiers] :
  /// The list of log groups to query. You can include up to 50 log groups.
  ///
  /// You can specify them by the log group name or ARN. If a log group that
  /// you're querying is in a source account and you're using a monitoring
  /// account, you must specify the ARN of the log group here. The query
  /// definition must also be defined in the monitoring account.
  ///
  /// If you specify an ARN, use the format
  /// arn:aws:logs:<i>region</i>:<i>account-id</i>:log-group:<i>log_group_name</i>
  /// Don't include an * at the end.
  ///
  /// A <code>StartQuery</code> operation must include exactly one of the
  /// following parameters: <code>logGroupName</code>,
  /// <code>logGroupNames</code>, or <code>logGroupIdentifiers</code>. The
  /// exception is queries using the OpenSearch Service SQL query language,
  /// where you specify the log group names inside the <code>querystring</code>
  /// instead of here.
  ///
  /// Parameter [logGroupName] :
  /// The log group on which to perform the query.
  /// <note>
  /// A <code>StartQuery</code> operation must include exactly one of the
  /// following parameters: <code>logGroupName</code>,
  /// <code>logGroupNames</code>, or <code>logGroupIdentifiers</code>. The
  /// exception is queries using the OpenSearch Service SQL query language,
  /// where you specify the log group names inside the <code>querystring</code>
  /// instead of here.
  /// </note>
  ///
  /// Parameter [logGroupNames] :
  /// The list of log groups to be queried. You can include up to 50 log groups.
  /// <note>
  /// A <code>StartQuery</code> operation must include exactly one of the
  /// following parameters: <code>logGroupName</code>,
  /// <code>logGroupNames</code>, or <code>logGroupIdentifiers</code>. The
  /// exception is queries using the OpenSearch Service SQL query language,
  /// where you specify the log group names inside the <code>querystring</code>
  /// instead of here.
  /// </note>
  ///
  /// Parameter [queryLanguage] :
  /// Specify the query language to use for this query. The options are Logs
  /// Insights QL, OpenSearch PPL, and OpenSearch SQL. For more information
  /// about the query languages that CloudWatch Logs supports, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_AnalyzeLogData_Languages.html">Supported
  /// query languages</a>.
  Future<StartQueryResponse> startQuery({
    required int endTime,
    required String queryString,
    required int startTime,
    int? limit,
    List<String>? logGroupIdentifiers,
    String? logGroupName,
    List<String>? logGroupNames,
    QueryLanguage? queryLanguage,
  }) async {
    _s.validateNumRange(
      'endTime',
      endTime,
      0,
      1152921504606846976,
      isRequired: true,
    );
    _s.validateNumRange(
      'startTime',
      startTime,
      0,
      1152921504606846976,
      isRequired: true,
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      100000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.StartQuery'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'endTime': endTime,
        'queryString': queryString,
        'startTime': startTime,
        if (limit != null) 'limit': limit,
        if (logGroupIdentifiers != null)
          'logGroupIdentifiers': logGroupIdentifiers,
        if (logGroupName != null) 'logGroupName': logGroupName,
        if (logGroupNames != null) 'logGroupNames': logGroupNames,
        if (queryLanguage != null) 'queryLanguage': queryLanguage.value,
      },
    );

    return StartQueryResponse.fromJson(jsonResponse.body);
  }

  /// Stops a CloudWatch Logs Insights query that is in progress. If the query
  /// has already ended, the operation returns an error indicating that the
  /// specified query is not running.
  ///
  /// This operation can be used to cancel both interactive queries and
  /// individual scheduled query executions. When used with scheduled queries,
  /// <code>StopQuery</code> cancels only the specific execution identified by
  /// the query ID, not the scheduled query configuration itself.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [queryId] :
  /// The ID number of the query to stop. To find this ID number, use
  /// <code>DescribeQueries</code>.
  Future<StopQueryResponse> stopQuery({
    required String queryId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.StopQuery'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'queryId': queryId,
      },
    );

    return StopQueryResponse.fromJson(jsonResponse.body);
  }

  /// <important>
  /// The TagLogGroup operation is on the path to deprecation. We recommend that
  /// you use <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_TagResource.html">TagResource</a>
  /// instead.
  /// </important>
  /// Adds or updates the specified tags for the specified log group.
  ///
  /// To list the tags for a log group, use <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_ListTagsForResource.html">ListTagsForResource</a>.
  /// To remove tags, use <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_UntagResource.html">UntagResource</a>.
  ///
  /// For more information about tags, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/Working-with-log-groups-and-streams.html#log-group-tagging">Tag
  /// Log Groups in Amazon CloudWatch Logs</a> in the <i>Amazon CloudWatch Logs
  /// User Guide</i>.
  ///
  /// CloudWatch Logs doesn't support IAM policies that prevent users from
  /// assigning specified tags to log groups using the
  /// <code>aws:Resource/<i>key-name</i> </code> or <code>aws:TagKeys</code>
  /// condition keys. For more information about using tags to control access,
  /// see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_tags.html">Controlling
  /// access to Amazon Web Services resources using tags</a>.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [logGroupName] :
  /// The name of the log group.
  ///
  /// Parameter [tags] :
  /// The key-value pairs to use for the tags.
  Future<void> tagLogGroup({
    required String logGroupName,
    required Map<String, String> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.TagLogGroup'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'logGroupName': logGroupName,
        'tags': tags,
      },
    );
  }

  /// Assigns one or more tags (key-value pairs) to the specified CloudWatch
  /// Logs resource. Currently, the only CloudWatch Logs resources that can be
  /// tagged are log groups and destinations.
  ///
  /// Tags can help you organize and categorize your resources. You can also use
  /// them to scope user permissions by granting a user permission to access or
  /// change only resources with certain tag values.
  ///
  /// Tags don't have any semantic meaning to Amazon Web Services and are
  /// interpreted strictly as strings of characters.
  ///
  /// You can use the <code>TagResource</code> action with a resource that
  /// already has tags. If you specify a new tag key for the alarm, this tag is
  /// appended to the list of tags associated with the alarm. If you specify a
  /// tag key that is already associated with the alarm, the new tag value that
  /// you specify replaces the previous value for that tag.
  ///
  /// You can associate as many as 50 tags with a CloudWatch Logs resource.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyTagsException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource that you're adding tags to.
  ///
  /// The ARN format of a log group is
  /// <code>arn:aws:logs:<i>Region</i>:<i>account-id</i>:log-group:<i>log-group-name</i>
  /// </code>
  ///
  /// The ARN format of a destination is
  /// <code>arn:aws:logs:<i>Region</i>:<i>account-id</i>:destination:<i>destination-name</i>
  /// </code>
  ///
  /// For more information about ARN format, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/iam-access-control-overview-cwl.html">CloudWatch
  /// Logs resources and operations</a>.
  ///
  /// Parameter [tags] :
  /// The list of key-value pairs to associate with the resource.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.TagResource'
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

  /// Tests the filter pattern of a metric filter against a sample of log event
  /// messages. You can use this operation to validate the correctness of a
  /// metric filter pattern.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [logEventMessages] :
  /// The log event messages to test.
  Future<TestMetricFilterResponse> testMetricFilter({
    required String filterPattern,
    required List<String> logEventMessages,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.TestMetricFilter'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'filterPattern': filterPattern,
        'logEventMessages': logEventMessages,
      },
    );

    return TestMetricFilterResponse.fromJson(jsonResponse.body);
  }

  /// Use this operation to test a log transformer. You enter the transformer
  /// configuration and a set of log events to test with. The operation responds
  /// with an array that includes the original log events and the transformed
  /// versions.
  ///
  /// May throw [InvalidOperationException].
  /// May throw [InvalidParameterException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [logEventMessages] :
  /// An array of the raw log events that you want to use to test this
  /// transformer.
  ///
  /// Parameter [transformerConfig] :
  /// This structure contains the configuration of this log transformer that you
  /// want to test. A log transformer is an array of processors, where each
  /// processor applies one type of transformation to the log events that are
  /// ingested.
  Future<TestTransformerResponse> testTransformer({
    required List<String> logEventMessages,
    required List<Processor> transformerConfig,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.TestTransformer'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'logEventMessages': logEventMessages,
        'transformerConfig': transformerConfig,
      },
    );

    return TestTransformerResponse.fromJson(jsonResponse.body);
  }

  /// <important>
  /// The UntagLogGroup operation is on the path to deprecation. We recommend
  /// that you use <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_UntagResource.html">UntagResource</a>
  /// instead.
  /// </important>
  /// Removes the specified tags from the specified log group.
  ///
  /// To list the tags for a log group, use <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_ListTagsForResource.html">ListTagsForResource</a>.
  /// To add tags, use <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_TagResource.html">TagResource</a>.
  ///
  /// When using IAM policies to control tag management for CloudWatch Logs log
  /// groups, the condition keys <code>aws:Resource/key-name</code> and
  /// <code>aws:TagKeys</code> cannot be used to restrict which tags users can
  /// assign.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [logGroupName] :
  /// The name of the log group.
  ///
  /// Parameter [tags] :
  /// The tag keys. The corresponding tags are removed from the log group.
  Future<void> untagLogGroup({
    required String logGroupName,
    required List<String> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.UntagLogGroup'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'logGroupName': logGroupName,
        'tags': tags,
      },
    );
  }

  /// Removes one or more tags from the specified resource.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the CloudWatch Logs resource that you're removing tags from.
  ///
  /// The ARN format of a log group is
  /// <code>arn:aws:logs:<i>Region</i>:<i>account-id</i>:log-group:<i>log-group-name</i>
  /// </code>
  ///
  /// The ARN format of a destination is
  /// <code>arn:aws:logs:<i>Region</i>:<i>account-id</i>:destination:<i>destination-name</i>
  /// </code>
  ///
  /// For more information about ARN format, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/iam-access-control-overview-cwl.html">CloudWatch
  /// Logs resources and operations</a>.
  ///
  /// Parameter [tagKeys] :
  /// The list of tag keys to remove from the resource.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.UntagResource'
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

  /// Use this operation to <i>suppress</i> anomaly detection for a specified
  /// anomaly or pattern. If you suppress an anomaly, CloudWatch Logs won't
  /// report new occurrences of that anomaly and won't update that anomaly with
  /// new data. If you suppress a pattern, CloudWatch Logs won't report any
  /// anomalies related to that pattern.
  ///
  /// You must specify either <code>anomalyId</code> or <code>patternId</code>,
  /// but you can't specify both parameters in the same operation.
  ///
  /// If you have previously used this operation to suppress detection of a
  /// pattern or anomaly, you can use it again to cause CloudWatch Logs to end
  /// the suppression. To do this, use this operation and specify the anomaly or
  /// pattern to stop suppressing, and omit the <code>suppressionType</code> and
  /// <code>suppressionPeriod</code> parameters.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [OperationAbortedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [anomalyDetectorArn] :
  /// The ARN of the anomaly detector that this operation is to act on.
  ///
  /// Parameter [anomalyId] :
  /// If you are suppressing or unsuppressing an anomaly, specify its unique ID
  /// here. You can find anomaly IDs by using the <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_ListAnomalies.html">ListAnomalies</a>
  /// operation.
  ///
  /// Parameter [baseline] :
  /// Set this to <code>true</code> to prevent CloudWatch Logs from displaying
  /// this behavior as an anomaly in the future. The behavior is then treated as
  /// baseline behavior. However, if similar but more severe occurrences of this
  /// behavior occur in the future, those will still be reported as anomalies.
  ///
  /// The default is <code>false</code>
  ///
  /// Parameter [patternId] :
  /// If you are suppressing or unsuppressing an pattern, specify its unique ID
  /// here. You can find pattern IDs by using the <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_ListAnomalies.html">ListAnomalies</a>
  /// operation.
  ///
  /// Parameter [suppressionPeriod] :
  /// If you are temporarily suppressing an anomaly or pattern, use this
  /// structure to specify how long the suppression is to last.
  ///
  /// Parameter [suppressionType] :
  /// Use this to specify whether the suppression to be temporary or infinite.
  /// If you specify <code>LIMITED</code>, you must also specify a
  /// <code>suppressionPeriod</code>. If you specify <code>INFINITE</code>, any
  /// value for <code>suppressionPeriod</code> is ignored.
  Future<void> updateAnomaly({
    required String anomalyDetectorArn,
    String? anomalyId,
    bool? baseline,
    String? patternId,
    SuppressionPeriod? suppressionPeriod,
    SuppressionType? suppressionType,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.UpdateAnomaly'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'anomalyDetectorArn': anomalyDetectorArn,
        if (anomalyId != null) 'anomalyId': anomalyId,
        if (baseline != null) 'baseline': baseline,
        if (patternId != null) 'patternId': patternId,
        if (suppressionPeriod != null) 'suppressionPeriod': suppressionPeriod,
        if (suppressionType != null) 'suppressionType': suppressionType.value,
      },
    );
  }

  /// Use this operation to update the configuration of a <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_Delivery.html">delivery</a>
  /// to change either the S3 path pattern or the format of the delivered logs.
  /// You can't use this operation to change the source or destination of the
  /// delivery.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [id] :
  /// The ID of the delivery to be updated by this request.
  ///
  /// Parameter [fieldDelimiter] :
  /// The field delimiter to use between record fields when the final output
  /// format of a delivery is in <code>Plain</code>, <code>W3C</code>, or
  /// <code>Raw</code> format.
  ///
  /// Parameter [recordFields] :
  /// The list of record fields to be delivered to the destination, in order. If
  /// the delivery's log source has mandatory fields, they must be included in
  /// this list.
  ///
  /// Parameter [s3DeliveryConfiguration] :
  /// This structure contains parameters that are valid only when the delivery's
  /// delivery destination is an S3 bucket.
  Future<void> updateDeliveryConfiguration({
    required String id,
    String? fieldDelimiter,
    List<String>? recordFields,
    S3DeliveryConfiguration? s3DeliveryConfiguration,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.UpdateDeliveryConfiguration'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'id': id,
        if (fieldDelimiter != null) 'fieldDelimiter': fieldDelimiter,
        if (recordFields != null) 'recordFields': recordFields,
        if (s3DeliveryConfiguration != null)
          's3DeliveryConfiguration': s3DeliveryConfiguration,
      },
    );
  }

  /// Updates an existing log anomaly detector.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [OperationAbortedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [anomalyDetectorArn] :
  /// The ARN of the anomaly detector that you want to update.
  ///
  /// Parameter [enabled] :
  /// Use this parameter to pause or restart the anomaly detector.
  ///
  /// Parameter [anomalyVisibilityTime] :
  /// The number of days to use as the life cycle of anomalies. After this time,
  /// anomalies are automatically baselined and the anomaly detector model will
  /// treat new occurrences of similar event as normal. Therefore, if you do not
  /// correct the cause of an anomaly during this time, it will be considered
  /// normal going forward and will not be detected.
  ///
  /// Parameter [evaluationFrequency] :
  /// Specifies how often the anomaly detector runs and look for anomalies. Set
  /// this value according to the frequency that the log group receives new
  /// logs. For example, if the log group receives new log events every 10
  /// minutes, then setting <code>evaluationFrequency</code> to
  /// <code>FIFTEEN_MIN</code> might be appropriate.
  Future<void> updateLogAnomalyDetector({
    required String anomalyDetectorArn,
    required bool enabled,
    int? anomalyVisibilityTime,
    EvaluationFrequency? evaluationFrequency,
    String? filterPattern,
  }) async {
    _s.validateNumRange(
      'anomalyVisibilityTime',
      anomalyVisibilityTime,
      7,
      90,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.UpdateLogAnomalyDetector'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'anomalyDetectorArn': anomalyDetectorArn,
        'enabled': enabled,
        if (anomalyVisibilityTime != null)
          'anomalyVisibilityTime': anomalyVisibilityTime,
        if (evaluationFrequency != null)
          'evaluationFrequency': evaluationFrequency.value,
        if (filterPattern != null) 'filterPattern': filterPattern,
      },
    );
  }

  /// Updates an existing lookup table by replacing all of its CSV content.
  /// After the update completes, queries that use this table will use the new
  /// data.
  ///
  /// This is a full replacement operation. All existing content is replaced
  /// with the new CSV data.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ValidationException].
  ///
  /// Parameter [lookupTableArn] :
  /// The ARN of the lookup table to update.
  ///
  /// Parameter [tableBody] :
  /// The new CSV content to replace the existing data. The first row must be a
  /// header row with column names. The content must use UTF-8 encoding and not
  /// exceed 10 MB.
  ///
  /// Parameter [description] :
  /// An updated description of the lookup table.
  ///
  /// Parameter [kmsKeyId] :
  /// The ARN of the KMS key to use to encrypt the lookup table data. You can
  /// use this parameter to add, update, or remove the KMS key. To remove the
  /// KMS key and use an Amazon Web Services-owned key instead, specify an empty
  /// string.
  Future<UpdateLookupTableResponse> updateLookupTable({
    required String lookupTableArn,
    required String tableBody,
    String? description,
    String? kmsKeyId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.UpdateLookupTable'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'lookupTableArn': lookupTableArn,
        'tableBody': tableBody,
        if (description != null) 'description': description,
        if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
      },
    );

    return UpdateLookupTableResponse.fromJson(jsonResponse.body);
  }

  /// Updates an existing scheduled query with new configuration. This operation
  /// uses PUT semantics, allowing modification of query parameters, schedule,
  /// and destinations.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [executionRoleArn] :
  /// The updated ARN of the IAM role that grants permissions to execute the
  /// query and deliver results.
  ///
  /// Parameter [identifier] :
  /// The ARN or name of the scheduled query to update.
  ///
  /// Parameter [queryLanguage] :
  /// The updated query language for the scheduled query.
  ///
  /// Parameter [queryString] :
  /// The updated query string to execute.
  ///
  /// Parameter [scheduleExpression] :
  /// The updated cron expression that defines when the scheduled query runs.
  ///
  /// Parameter [description] :
  /// An updated description for the scheduled query.
  ///
  /// Parameter [destinationConfiguration] :
  /// The updated configuration for where to deliver query results.
  ///
  /// Parameter [logGroupIdentifiers] :
  /// The updated array of log group names or ARNs to query.
  ///
  /// Parameter [scheduleEndTime] :
  /// The updated end time for the scheduled query in Unix epoch format.
  ///
  /// Parameter [scheduleStartTime] :
  /// The updated start time for the scheduled query in Unix epoch format.
  ///
  /// Parameter [startTimeOffset] :
  /// The updated time offset in seconds that defines the lookback period for
  /// the query.
  ///
  /// Parameter [state] :
  /// The updated state of the scheduled query.
  ///
  /// Parameter [timezone] :
  /// The updated timezone for evaluating the schedule expression.
  Future<UpdateScheduledQueryResponse> updateScheduledQuery({
    required String executionRoleArn,
    required String identifier,
    required QueryLanguage queryLanguage,
    required String queryString,
    required String scheduleExpression,
    String? description,
    DestinationConfiguration? destinationConfiguration,
    List<String>? logGroupIdentifiers,
    int? scheduleEndTime,
    int? scheduleStartTime,
    int? startTimeOffset,
    ScheduledQueryState? state,
    String? timezone,
  }) async {
    _s.validateNumRange(
      'scheduleEndTime',
      scheduleEndTime,
      0,
      1152921504606846976,
    );
    _s.validateNumRange(
      'scheduleStartTime',
      scheduleStartTime,
      0,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.UpdateScheduledQuery'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'executionRoleArn': executionRoleArn,
        'identifier': identifier,
        'queryLanguage': queryLanguage.value,
        'queryString': queryString,
        'scheduleExpression': scheduleExpression,
        if (description != null) 'description': description,
        if (destinationConfiguration != null)
          'destinationConfiguration': destinationConfiguration,
        if (logGroupIdentifiers != null)
          'logGroupIdentifiers': logGroupIdentifiers,
        if (scheduleEndTime != null) 'scheduleEndTime': scheduleEndTime,
        if (scheduleStartTime != null) 'scheduleStartTime': scheduleStartTime,
        if (startTimeOffset != null) 'startTimeOffset': startTimeOffset,
        if (state != null) 'state': state.value,
        if (timezone != null) 'timezone': timezone,
      },
    );

    return UpdateScheduledQueryResponse.fromJson(jsonResponse.body);
  }
}

class AssociateSourceToS3TableIntegrationResponse {
  /// The unique identifier for the association between the data source and S3
  /// Table Integration.
  final String? identifier;

  AssociateSourceToS3TableIntegrationResponse({
    this.identifier,
  });

  factory AssociateSourceToS3TableIntegrationResponse.fromJson(
      Map<String, dynamic> json) {
    return AssociateSourceToS3TableIntegrationResponse(
      identifier: json['identifier'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final identifier = this.identifier;
    return {
      if (identifier != null) 'identifier': identifier,
    };
  }
}

class CancelImportTaskResponse {
  /// The timestamp when the import task was created, expressed as the number of
  /// milliseconds after Jan 1, 1970 00:00:00 UTC.
  final int? creationTime;

  /// The ID of the cancelled import task.
  final String? importId;

  /// Statistics about the import progress at the time of cancellation.
  final ImportStatistics? importStatistics;

  /// The final status of the import task. This will be set to CANCELLED.
  final ImportStatus? importStatus;

  /// The timestamp when the import task was cancelled, expressed as the number of
  /// milliseconds after Jan 1, 1970 00:00:00 UTC.
  final int? lastUpdatedTime;

  CancelImportTaskResponse({
    this.creationTime,
    this.importId,
    this.importStatistics,
    this.importStatus,
    this.lastUpdatedTime,
  });

  factory CancelImportTaskResponse.fromJson(Map<String, dynamic> json) {
    return CancelImportTaskResponse(
      creationTime: json['creationTime'] as int?,
      importId: json['importId'] as String?,
      importStatistics: json['importStatistics'] != null
          ? ImportStatistics.fromJson(
              json['importStatistics'] as Map<String, dynamic>)
          : null,
      importStatus:
          (json['importStatus'] as String?)?.let(ImportStatus.fromString),
      lastUpdatedTime: json['lastUpdatedTime'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final importId = this.importId;
    final importStatistics = this.importStatistics;
    final importStatus = this.importStatus;
    final lastUpdatedTime = this.lastUpdatedTime;
    return {
      if (creationTime != null) 'creationTime': creationTime,
      if (importId != null) 'importId': importId,
      if (importStatistics != null) 'importStatistics': importStatistics,
      if (importStatus != null) 'importStatus': importStatus.value,
      if (lastUpdatedTime != null) 'lastUpdatedTime': lastUpdatedTime,
    };
  }
}

class CreateDeliveryResponse {
  /// A structure that contains information about the delivery that you just
  /// created.
  final Delivery? delivery;

  CreateDeliveryResponse({
    this.delivery,
  });

  factory CreateDeliveryResponse.fromJson(Map<String, dynamic> json) {
    return CreateDeliveryResponse(
      delivery: json['delivery'] != null
          ? Delivery.fromJson(json['delivery'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final delivery = this.delivery;
    return {
      if (delivery != null) 'delivery': delivery,
    };
  }
}

class CreateExportTaskResponse {
  /// The ID of the export task.
  final String? taskId;

  CreateExportTaskResponse({
    this.taskId,
  });

  factory CreateExportTaskResponse.fromJson(Map<String, dynamic> json) {
    return CreateExportTaskResponse(
      taskId: json['taskId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final taskId = this.taskId;
    return {
      if (taskId != null) 'taskId': taskId,
    };
  }
}

class CreateImportTaskResponse {
  /// The timestamp when the import task was created, expressed as the number of
  /// milliseconds after Jan 1, 1970 00:00:00 UTC.
  final int? creationTime;

  /// The ARN of the CloudWatch Logs log group created as the destination for the
  /// imported events.
  final String? importDestinationArn;

  /// A unique identifier for the import task.
  final String? importId;

  CreateImportTaskResponse({
    this.creationTime,
    this.importDestinationArn,
    this.importId,
  });

  factory CreateImportTaskResponse.fromJson(Map<String, dynamic> json) {
    return CreateImportTaskResponse(
      creationTime: json['creationTime'] as int?,
      importDestinationArn: json['importDestinationArn'] as String?,
      importId: json['importId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final importDestinationArn = this.importDestinationArn;
    final importId = this.importId;
    return {
      if (creationTime != null) 'creationTime': creationTime,
      if (importDestinationArn != null)
        'importDestinationArn': importDestinationArn,
      if (importId != null) 'importId': importId,
    };
  }
}

class CreateLogAnomalyDetectorResponse {
  /// The ARN of the log anomaly detector that you just created.
  final String? anomalyDetectorArn;

  CreateLogAnomalyDetectorResponse({
    this.anomalyDetectorArn,
  });

  factory CreateLogAnomalyDetectorResponse.fromJson(Map<String, dynamic> json) {
    return CreateLogAnomalyDetectorResponse(
      anomalyDetectorArn: json['anomalyDetectorArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final anomalyDetectorArn = this.anomalyDetectorArn;
    return {
      if (anomalyDetectorArn != null) 'anomalyDetectorArn': anomalyDetectorArn,
    };
  }
}

class CreateLookupTableResponse {
  /// The time when the lookup table was created, expressed as the number of
  /// milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>.
  final int? createdAt;

  /// The ARN of the lookup table that was created.
  final String? lookupTableArn;

  CreateLookupTableResponse({
    this.createdAt,
    this.lookupTableArn,
  });

  factory CreateLookupTableResponse.fromJson(Map<String, dynamic> json) {
    return CreateLookupTableResponse(
      createdAt: json['createdAt'] as int?,
      lookupTableArn: json['lookupTableArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final lookupTableArn = this.lookupTableArn;
    return {
      if (createdAt != null) 'createdAt': createdAt,
      if (lookupTableArn != null) 'lookupTableArn': lookupTableArn,
    };
  }
}

class CreateScheduledQueryResponse {
  /// The ARN of the created scheduled query.
  final String? scheduledQueryArn;

  /// The current state of the scheduled query.
  final ScheduledQueryState? state;

  CreateScheduledQueryResponse({
    this.scheduledQueryArn,
    this.state,
  });

  factory CreateScheduledQueryResponse.fromJson(Map<String, dynamic> json) {
    return CreateScheduledQueryResponse(
      scheduledQueryArn: json['scheduledQueryArn'] as String?,
      state: (json['state'] as String?)?.let(ScheduledQueryState.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final scheduledQueryArn = this.scheduledQueryArn;
    final state = this.state;
    return {
      if (scheduledQueryArn != null) 'scheduledQueryArn': scheduledQueryArn,
      if (state != null) 'state': state.value,
    };
  }
}

class DeleteIndexPolicyResponse {
  DeleteIndexPolicyResponse();

  factory DeleteIndexPolicyResponse.fromJson(Map<String, dynamic> _) {
    return DeleteIndexPolicyResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteIntegrationResponse {
  DeleteIntegrationResponse();

  factory DeleteIntegrationResponse.fromJson(Map<String, dynamic> _) {
    return DeleteIntegrationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteQueryDefinitionResponse {
  /// A value of TRUE indicates that the operation succeeded. FALSE indicates that
  /// the operation failed.
  final bool? success;

  DeleteQueryDefinitionResponse({
    this.success,
  });

  factory DeleteQueryDefinitionResponse.fromJson(Map<String, dynamic> json) {
    return DeleteQueryDefinitionResponse(
      success: json['success'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final success = this.success;
    return {
      if (success != null) 'success': success,
    };
  }
}

class DeleteScheduledQueryResponse {
  DeleteScheduledQueryResponse();

  factory DeleteScheduledQueryResponse.fromJson(Map<String, dynamic> _) {
    return DeleteScheduledQueryResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DescribeAccountPoliciesResponse {
  /// An array of structures that contain information about the CloudWatch Logs
  /// account policies that match the specified filters.
  final List<AccountPolicy>? accountPolicies;

  /// The token to use when requesting the next set of items. The token expires
  /// after 24 hours.
  final String? nextToken;

  DescribeAccountPoliciesResponse({
    this.accountPolicies,
    this.nextToken,
  });

  factory DescribeAccountPoliciesResponse.fromJson(Map<String, dynamic> json) {
    return DescribeAccountPoliciesResponse(
      accountPolicies: (json['accountPolicies'] as List?)
          ?.nonNulls
          .map((e) => AccountPolicy.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountPolicies = this.accountPolicies;
    final nextToken = this.nextToken;
    return {
      if (accountPolicies != null) 'accountPolicies': accountPolicies,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class DescribeConfigurationTemplatesResponse {
  /// An array of objects, where each object describes one configuration template
  /// that matches the filters that you specified in the request.
  final List<ConfigurationTemplate>? configurationTemplates;
  final String? nextToken;

  DescribeConfigurationTemplatesResponse({
    this.configurationTemplates,
    this.nextToken,
  });

  factory DescribeConfigurationTemplatesResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeConfigurationTemplatesResponse(
      configurationTemplates: (json['configurationTemplates'] as List?)
          ?.nonNulls
          .map((e) => ConfigurationTemplate.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final configurationTemplates = this.configurationTemplates;
    final nextToken = this.nextToken;
    return {
      if (configurationTemplates != null)
        'configurationTemplates': configurationTemplates,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class DescribeDeliveriesResponse {
  /// An array of structures. Each structure contains information about one
  /// delivery in the account.
  final List<Delivery>? deliveries;
  final String? nextToken;

  DescribeDeliveriesResponse({
    this.deliveries,
    this.nextToken,
  });

  factory DescribeDeliveriesResponse.fromJson(Map<String, dynamic> json) {
    return DescribeDeliveriesResponse(
      deliveries: (json['deliveries'] as List?)
          ?.nonNulls
          .map((e) => Delivery.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deliveries = this.deliveries;
    final nextToken = this.nextToken;
    return {
      if (deliveries != null) 'deliveries': deliveries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class DescribeDeliveryDestinationsResponse {
  /// An array of structures. Each structure contains information about one
  /// delivery destination in the account.
  final List<DeliveryDestination>? deliveryDestinations;
  final String? nextToken;

  DescribeDeliveryDestinationsResponse({
    this.deliveryDestinations,
    this.nextToken,
  });

  factory DescribeDeliveryDestinationsResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeDeliveryDestinationsResponse(
      deliveryDestinations: (json['deliveryDestinations'] as List?)
          ?.nonNulls
          .map((e) => DeliveryDestination.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deliveryDestinations = this.deliveryDestinations;
    final nextToken = this.nextToken;
    return {
      if (deliveryDestinations != null)
        'deliveryDestinations': deliveryDestinations,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class DescribeDeliverySourcesResponse {
  /// An array of structures. Each structure contains information about one
  /// delivery source in the account.
  final List<DeliverySource>? deliverySources;
  final String? nextToken;

  DescribeDeliverySourcesResponse({
    this.deliverySources,
    this.nextToken,
  });

  factory DescribeDeliverySourcesResponse.fromJson(Map<String, dynamic> json) {
    return DescribeDeliverySourcesResponse(
      deliverySources: (json['deliverySources'] as List?)
          ?.nonNulls
          .map((e) => DeliverySource.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deliverySources = this.deliverySources;
    final nextToken = this.nextToken;
    return {
      if (deliverySources != null) 'deliverySources': deliverySources,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class DescribeDestinationsResponse {
  /// The destinations.
  final List<Destination>? destinations;
  final String? nextToken;

  DescribeDestinationsResponse({
    this.destinations,
    this.nextToken,
  });

  factory DescribeDestinationsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeDestinationsResponse(
      destinations: (json['destinations'] as List?)
          ?.nonNulls
          .map((e) => Destination.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final destinations = this.destinations;
    final nextToken = this.nextToken;
    return {
      if (destinations != null) 'destinations': destinations,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class DescribeExportTasksResponse {
  /// The export tasks.
  final List<ExportTask>? exportTasks;
  final String? nextToken;

  DescribeExportTasksResponse({
    this.exportTasks,
    this.nextToken,
  });

  factory DescribeExportTasksResponse.fromJson(Map<String, dynamic> json) {
    return DescribeExportTasksResponse(
      exportTasks: (json['exportTasks'] as List?)
          ?.nonNulls
          .map((e) => ExportTask.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final exportTasks = this.exportTasks;
    final nextToken = this.nextToken;
    return {
      if (exportTasks != null) 'exportTasks': exportTasks,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class DescribeFieldIndexesResponse {
  /// An array containing the field index information.
  final List<FieldIndex>? fieldIndexes;
  final String? nextToken;

  DescribeFieldIndexesResponse({
    this.fieldIndexes,
    this.nextToken,
  });

  factory DescribeFieldIndexesResponse.fromJson(Map<String, dynamic> json) {
    return DescribeFieldIndexesResponse(
      fieldIndexes: (json['fieldIndexes'] as List?)
          ?.nonNulls
          .map((e) => FieldIndex.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fieldIndexes = this.fieldIndexes;
    final nextToken = this.nextToken;
    return {
      if (fieldIndexes != null) 'fieldIndexes': fieldIndexes,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class DescribeImportTaskBatchesResponse {
  /// The list of import batches that match the request filters.
  final List<ImportBatch>? importBatches;

  /// The ID of the import task.
  final String? importId;

  /// The ARN of the source being imported from.
  final String? importSourceArn;

  /// The token to use when requesting the next set of results. Not present if
  /// there are no additional results to retrieve.
  final String? nextToken;

  DescribeImportTaskBatchesResponse({
    this.importBatches,
    this.importId,
    this.importSourceArn,
    this.nextToken,
  });

  factory DescribeImportTaskBatchesResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeImportTaskBatchesResponse(
      importBatches: (json['importBatches'] as List?)
          ?.nonNulls
          .map((e) => ImportBatch.fromJson(e as Map<String, dynamic>))
          .toList(),
      importId: json['importId'] as String?,
      importSourceArn: json['importSourceArn'] as String?,
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final importBatches = this.importBatches;
    final importId = this.importId;
    final importSourceArn = this.importSourceArn;
    final nextToken = this.nextToken;
    return {
      if (importBatches != null) 'importBatches': importBatches,
      if (importId != null) 'importId': importId,
      if (importSourceArn != null) 'importSourceArn': importSourceArn,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class DescribeImportTasksResponse {
  /// The list of import tasks that match the request filters.
  final List<Import>? imports;

  /// The token to use when requesting the next set of results. Not present if
  /// there are no additional results to retrieve.
  final String? nextToken;

  DescribeImportTasksResponse({
    this.imports,
    this.nextToken,
  });

  factory DescribeImportTasksResponse.fromJson(Map<String, dynamic> json) {
    return DescribeImportTasksResponse(
      imports: (json['imports'] as List?)
          ?.nonNulls
          .map((e) => Import.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final imports = this.imports;
    final nextToken = this.nextToken;
    return {
      if (imports != null) 'imports': imports,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class DescribeIndexPoliciesResponse {
  /// An array containing the field index policies.
  final List<IndexPolicy>? indexPolicies;
  final String? nextToken;

  DescribeIndexPoliciesResponse({
    this.indexPolicies,
    this.nextToken,
  });

  factory DescribeIndexPoliciesResponse.fromJson(Map<String, dynamic> json) {
    return DescribeIndexPoliciesResponse(
      indexPolicies: (json['indexPolicies'] as List?)
          ?.nonNulls
          .map((e) => IndexPolicy.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final indexPolicies = this.indexPolicies;
    final nextToken = this.nextToken;
    return {
      if (indexPolicies != null) 'indexPolicies': indexPolicies,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class DescribeLogGroupsResponse {
  /// An array of structures, where each structure contains the information about
  /// one log group.
  final List<LogGroup>? logGroups;
  final String? nextToken;

  DescribeLogGroupsResponse({
    this.logGroups,
    this.nextToken,
  });

  factory DescribeLogGroupsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeLogGroupsResponse(
      logGroups: (json['logGroups'] as List?)
          ?.nonNulls
          .map((e) => LogGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final logGroups = this.logGroups;
    final nextToken = this.nextToken;
    return {
      if (logGroups != null) 'logGroups': logGroups,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class DescribeLogStreamsResponse {
  /// The log streams.
  final List<LogStream>? logStreams;
  final String? nextToken;

  DescribeLogStreamsResponse({
    this.logStreams,
    this.nextToken,
  });

  factory DescribeLogStreamsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeLogStreamsResponse(
      logStreams: (json['logStreams'] as List?)
          ?.nonNulls
          .map((e) => LogStream.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final logStreams = this.logStreams;
    final nextToken = this.nextToken;
    return {
      if (logStreams != null) 'logStreams': logStreams,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class DescribeLookupTablesResponse {
  /// An array of structures, where each structure contains metadata about one
  /// lookup table.
  final List<LookupTable>? lookupTables;

  /// The token to use when requesting the next set of items.
  final String? nextToken;

  DescribeLookupTablesResponse({
    this.lookupTables,
    this.nextToken,
  });

  factory DescribeLookupTablesResponse.fromJson(Map<String, dynamic> json) {
    return DescribeLookupTablesResponse(
      lookupTables: (json['lookupTables'] as List?)
          ?.nonNulls
          .map((e) => LookupTable.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lookupTables = this.lookupTables;
    final nextToken = this.nextToken;
    return {
      if (lookupTables != null) 'lookupTables': lookupTables,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class DescribeMetricFiltersResponse {
  /// The metric filters.
  final List<MetricFilter>? metricFilters;
  final String? nextToken;

  DescribeMetricFiltersResponse({
    this.metricFilters,
    this.nextToken,
  });

  factory DescribeMetricFiltersResponse.fromJson(Map<String, dynamic> json) {
    return DescribeMetricFiltersResponse(
      metricFilters: (json['metricFilters'] as List?)
          ?.nonNulls
          .map((e) => MetricFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final metricFilters = this.metricFilters;
    final nextToken = this.nextToken;
    return {
      if (metricFilters != null) 'metricFilters': metricFilters,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class DescribeQueriesResponse {
  final String? nextToken;

  /// The list of queries that match the request.
  final List<QueryInfo>? queries;

  DescribeQueriesResponse({
    this.nextToken,
    this.queries,
  });

  factory DescribeQueriesResponse.fromJson(Map<String, dynamic> json) {
    return DescribeQueriesResponse(
      nextToken: json['nextToken'] as String?,
      queries: (json['queries'] as List?)
          ?.nonNulls
          .map((e) => QueryInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final queries = this.queries;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (queries != null) 'queries': queries,
    };
  }
}

class DescribeQueryDefinitionsResponse {
  final String? nextToken;

  /// The list of query definitions that match your request.
  final List<QueryDefinition>? queryDefinitions;

  DescribeQueryDefinitionsResponse({
    this.nextToken,
    this.queryDefinitions,
  });

  factory DescribeQueryDefinitionsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeQueryDefinitionsResponse(
      nextToken: json['nextToken'] as String?,
      queryDefinitions: (json['queryDefinitions'] as List?)
          ?.nonNulls
          .map((e) => QueryDefinition.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final queryDefinitions = this.queryDefinitions;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (queryDefinitions != null) 'queryDefinitions': queryDefinitions,
    };
  }
}

class DescribeResourcePoliciesResponse {
  final String? nextToken;

  /// The resource policies that exist in this account.
  final List<ResourcePolicy>? resourcePolicies;

  DescribeResourcePoliciesResponse({
    this.nextToken,
    this.resourcePolicies,
  });

  factory DescribeResourcePoliciesResponse.fromJson(Map<String, dynamic> json) {
    return DescribeResourcePoliciesResponse(
      nextToken: json['nextToken'] as String?,
      resourcePolicies: (json['resourcePolicies'] as List?)
          ?.nonNulls
          .map((e) => ResourcePolicy.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final resourcePolicies = this.resourcePolicies;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (resourcePolicies != null) 'resourcePolicies': resourcePolicies,
    };
  }
}

class DescribeSubscriptionFiltersResponse {
  final String? nextToken;

  /// The subscription filters.
  final List<SubscriptionFilter>? subscriptionFilters;

  DescribeSubscriptionFiltersResponse({
    this.nextToken,
    this.subscriptionFilters,
  });

  factory DescribeSubscriptionFiltersResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeSubscriptionFiltersResponse(
      nextToken: json['nextToken'] as String?,
      subscriptionFilters: (json['subscriptionFilters'] as List?)
          ?.nonNulls
          .map((e) => SubscriptionFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final subscriptionFilters = this.subscriptionFilters;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (subscriptionFilters != null)
        'subscriptionFilters': subscriptionFilters,
    };
  }
}

class DisassociateSourceFromS3TableIntegrationResponse {
  /// The unique identifier of the association that was removed.
  final String? identifier;

  DisassociateSourceFromS3TableIntegrationResponse({
    this.identifier,
  });

  factory DisassociateSourceFromS3TableIntegrationResponse.fromJson(
      Map<String, dynamic> json) {
    return DisassociateSourceFromS3TableIntegrationResponse(
      identifier: json['identifier'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final identifier = this.identifier;
    return {
      if (identifier != null) 'identifier': identifier,
    };
  }
}

class FilterLogEventsResponse {
  /// The matched events.
  final List<FilteredLogEvent>? events;

  /// The token to use when requesting the next set of items. The token expires
  /// after 24 hours.
  ///
  /// If the results don't include a <code>nextToken</code>, then pagination is
  /// finished.
  final String? nextToken;

  /// <b>Important</b> As of May 15, 2020, this parameter is no longer supported.
  /// This parameter returns an empty list.
  ///
  /// Indicates which log streams have been searched and whether each has been
  /// searched completely.
  final List<SearchedLogStream>? searchedLogStreams;

  FilterLogEventsResponse({
    this.events,
    this.nextToken,
    this.searchedLogStreams,
  });

  factory FilterLogEventsResponse.fromJson(Map<String, dynamic> json) {
    return FilterLogEventsResponse(
      events: (json['events'] as List?)
          ?.nonNulls
          .map((e) => FilteredLogEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
      searchedLogStreams: (json['searchedLogStreams'] as List?)
          ?.nonNulls
          .map((e) => SearchedLogStream.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final events = this.events;
    final nextToken = this.nextToken;
    final searchedLogStreams = this.searchedLogStreams;
    return {
      if (events != null) 'events': events,
      if (nextToken != null) 'nextToken': nextToken,
      if (searchedLogStreams != null) 'searchedLogStreams': searchedLogStreams,
    };
  }
}

class GetDataProtectionPolicyResponse {
  /// The date and time that this policy was most recently updated.
  final int? lastUpdatedTime;

  /// The log group name or ARN that you specified in your request.
  final String? logGroupIdentifier;

  /// The data protection policy document for this log group.
  final String? policyDocument;

  GetDataProtectionPolicyResponse({
    this.lastUpdatedTime,
    this.logGroupIdentifier,
    this.policyDocument,
  });

  factory GetDataProtectionPolicyResponse.fromJson(Map<String, dynamic> json) {
    return GetDataProtectionPolicyResponse(
      lastUpdatedTime: json['lastUpdatedTime'] as int?,
      logGroupIdentifier: json['logGroupIdentifier'] as String?,
      policyDocument: json['policyDocument'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lastUpdatedTime = this.lastUpdatedTime;
    final logGroupIdentifier = this.logGroupIdentifier;
    final policyDocument = this.policyDocument;
    return {
      if (lastUpdatedTime != null) 'lastUpdatedTime': lastUpdatedTime,
      if (logGroupIdentifier != null) 'logGroupIdentifier': logGroupIdentifier,
      if (policyDocument != null) 'policyDocument': policyDocument,
    };
  }
}

class GetDeliveryResponse {
  /// A structure that contains information about the delivery.
  final Delivery? delivery;

  GetDeliveryResponse({
    this.delivery,
  });

  factory GetDeliveryResponse.fromJson(Map<String, dynamic> json) {
    return GetDeliveryResponse(
      delivery: json['delivery'] != null
          ? Delivery.fromJson(json['delivery'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final delivery = this.delivery;
    return {
      if (delivery != null) 'delivery': delivery,
    };
  }
}

class GetDeliveryDestinationResponse {
  /// A structure containing information about the delivery destination.
  final DeliveryDestination? deliveryDestination;

  GetDeliveryDestinationResponse({
    this.deliveryDestination,
  });

  factory GetDeliveryDestinationResponse.fromJson(Map<String, dynamic> json) {
    return GetDeliveryDestinationResponse(
      deliveryDestination: json['deliveryDestination'] != null
          ? DeliveryDestination.fromJson(
              json['deliveryDestination'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final deliveryDestination = this.deliveryDestination;
    return {
      if (deliveryDestination != null)
        'deliveryDestination': deliveryDestination,
    };
  }
}

class GetDeliveryDestinationPolicyResponse {
  /// The IAM policy for this delivery destination.
  final Policy? policy;

  GetDeliveryDestinationPolicyResponse({
    this.policy,
  });

  factory GetDeliveryDestinationPolicyResponse.fromJson(
      Map<String, dynamic> json) {
    return GetDeliveryDestinationPolicyResponse(
      policy: json['policy'] != null
          ? Policy.fromJson(json['policy'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final policy = this.policy;
    return {
      if (policy != null) 'policy': policy,
    };
  }
}

class GetDeliverySourceResponse {
  /// A structure containing information about the delivery source.
  final DeliverySource? deliverySource;

  GetDeliverySourceResponse({
    this.deliverySource,
  });

  factory GetDeliverySourceResponse.fromJson(Map<String, dynamic> json) {
    return GetDeliverySourceResponse(
      deliverySource: json['deliverySource'] != null
          ? DeliverySource.fromJson(
              json['deliverySource'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final deliverySource = this.deliverySource;
    return {
      if (deliverySource != null) 'deliverySource': deliverySource,
    };
  }
}

class GetIntegrationResponse {
  /// A structure that contains information about the integration configuration.
  /// For an integration with OpenSearch Service, this includes information about
  /// OpenSearch Service resources such as the collection, the workspace, and
  /// policies.
  final IntegrationDetails? integrationDetails;

  /// The name of the integration.
  final String? integrationName;

  /// The current status of this integration.
  final IntegrationStatus? integrationStatus;

  /// The type of integration. Integrations with OpenSearch Service have the type
  /// <code>OPENSEARCH</code>.
  final IntegrationType? integrationType;

  GetIntegrationResponse({
    this.integrationDetails,
    this.integrationName,
    this.integrationStatus,
    this.integrationType,
  });

  factory GetIntegrationResponse.fromJson(Map<String, dynamic> json) {
    return GetIntegrationResponse(
      integrationDetails: json['integrationDetails'] != null
          ? IntegrationDetails.fromJson(
              json['integrationDetails'] as Map<String, dynamic>)
          : null,
      integrationName: json['integrationName'] as String?,
      integrationStatus: (json['integrationStatus'] as String?)
          ?.let(IntegrationStatus.fromString),
      integrationType:
          (json['integrationType'] as String?)?.let(IntegrationType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final integrationDetails = this.integrationDetails;
    final integrationName = this.integrationName;
    final integrationStatus = this.integrationStatus;
    final integrationType = this.integrationType;
    return {
      if (integrationDetails != null) 'integrationDetails': integrationDetails,
      if (integrationName != null) 'integrationName': integrationName,
      if (integrationStatus != null)
        'integrationStatus': integrationStatus.value,
      if (integrationType != null) 'integrationType': integrationType.value,
    };
  }
}

class GetLogAnomalyDetectorResponse {
  /// Specifies whether the anomaly detector is currently active. To change its
  /// status, use the <code>enabled</code> parameter in the <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_UpdateLogAnomalyDetector.html">UpdateLogAnomalyDetector</a>
  /// operation.
  final AnomalyDetectorStatus? anomalyDetectorStatus;

  /// The number of days used as the life cycle of anomalies. After this time,
  /// anomalies are automatically baselined and the anomaly detector model will
  /// treat new occurrences of similar event as normal.
  final int? anomalyVisibilityTime;

  /// The date and time when this anomaly detector was created.
  final int? creationTimeStamp;

  /// The name of the log anomaly detector
  final String? detectorName;

  /// Specifies how often the anomaly detector runs and look for anomalies. Set
  /// this value according to the frequency that the log group receives new logs.
  /// For example, if the log group receives new log events every 10 minutes, then
  /// setting <code>evaluationFrequency</code> to <code>FIFTEEN_MIN</code> might
  /// be appropriate.
  final EvaluationFrequency? evaluationFrequency;
  final String? filterPattern;

  /// The ARN of the KMS key assigned to this anomaly detector, if any.
  final String? kmsKeyId;

  /// The date and time when this anomaly detector was most recently modified.
  final int? lastModifiedTimeStamp;

  /// An array of structures, where each structure contains the ARN of a log group
  /// associated with this anomaly detector.
  final List<String>? logGroupArnList;

  GetLogAnomalyDetectorResponse({
    this.anomalyDetectorStatus,
    this.anomalyVisibilityTime,
    this.creationTimeStamp,
    this.detectorName,
    this.evaluationFrequency,
    this.filterPattern,
    this.kmsKeyId,
    this.lastModifiedTimeStamp,
    this.logGroupArnList,
  });

  factory GetLogAnomalyDetectorResponse.fromJson(Map<String, dynamic> json) {
    return GetLogAnomalyDetectorResponse(
      anomalyDetectorStatus: (json['anomalyDetectorStatus'] as String?)
          ?.let(AnomalyDetectorStatus.fromString),
      anomalyVisibilityTime: json['anomalyVisibilityTime'] as int?,
      creationTimeStamp: json['creationTimeStamp'] as int?,
      detectorName: json['detectorName'] as String?,
      evaluationFrequency: (json['evaluationFrequency'] as String?)
          ?.let(EvaluationFrequency.fromString),
      filterPattern: json['filterPattern'] as String?,
      kmsKeyId: json['kmsKeyId'] as String?,
      lastModifiedTimeStamp: json['lastModifiedTimeStamp'] as int?,
      logGroupArnList: (json['logGroupArnList'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final anomalyDetectorStatus = this.anomalyDetectorStatus;
    final anomalyVisibilityTime = this.anomalyVisibilityTime;
    final creationTimeStamp = this.creationTimeStamp;
    final detectorName = this.detectorName;
    final evaluationFrequency = this.evaluationFrequency;
    final filterPattern = this.filterPattern;
    final kmsKeyId = this.kmsKeyId;
    final lastModifiedTimeStamp = this.lastModifiedTimeStamp;
    final logGroupArnList = this.logGroupArnList;
    return {
      if (anomalyDetectorStatus != null)
        'anomalyDetectorStatus': anomalyDetectorStatus.value,
      if (anomalyVisibilityTime != null)
        'anomalyVisibilityTime': anomalyVisibilityTime,
      if (creationTimeStamp != null) 'creationTimeStamp': creationTimeStamp,
      if (detectorName != null) 'detectorName': detectorName,
      if (evaluationFrequency != null)
        'evaluationFrequency': evaluationFrequency.value,
      if (filterPattern != null) 'filterPattern': filterPattern,
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
      if (lastModifiedTimeStamp != null)
        'lastModifiedTimeStamp': lastModifiedTimeStamp,
      if (logGroupArnList != null) 'logGroupArnList': logGroupArnList,
    };
  }
}

class GetLogEventsResponse {
  /// The events.
  final List<OutputLogEvent>? events;

  /// The token for the next set of items in the backward direction. The token
  /// expires after 24 hours. This token is not null. If you have reached the end
  /// of the stream, it returns the same token you passed in.
  final String? nextBackwardToken;

  /// The token for the next set of items in the forward direction. The token
  /// expires after 24 hours. If you have reached the end of the stream, it
  /// returns the same token you passed in.
  final String? nextForwardToken;

  GetLogEventsResponse({
    this.events,
    this.nextBackwardToken,
    this.nextForwardToken,
  });

  factory GetLogEventsResponse.fromJson(Map<String, dynamic> json) {
    return GetLogEventsResponse(
      events: (json['events'] as List?)
          ?.nonNulls
          .map((e) => OutputLogEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextBackwardToken: json['nextBackwardToken'] as String?,
      nextForwardToken: json['nextForwardToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final events = this.events;
    final nextBackwardToken = this.nextBackwardToken;
    final nextForwardToken = this.nextForwardToken;
    return {
      if (events != null) 'events': events,
      if (nextBackwardToken != null) 'nextBackwardToken': nextBackwardToken,
      if (nextForwardToken != null) 'nextForwardToken': nextForwardToken,
    };
  }
}

class GetLogFieldsResponse {
  /// The list of log fields for the specified data source, including field names
  /// and their data types.
  final List<LogFieldsListItem>? logFields;

  GetLogFieldsResponse({
    this.logFields,
  });

  factory GetLogFieldsResponse.fromJson(Map<String, dynamic> json) {
    return GetLogFieldsResponse(
      logFields: (json['logFields'] as List?)
          ?.nonNulls
          .map((e) => LogFieldsListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final logFields = this.logFields;
    return {
      if (logFields != null) 'logFields': logFields,
    };
  }
}

class GetLogGroupFieldsResponse {
  /// The array of fields found in the query. Each object in the array contains
  /// the name of the field, along with the percentage of time it appeared in the
  /// log events that were queried.
  final List<LogGroupField>? logGroupFields;

  GetLogGroupFieldsResponse({
    this.logGroupFields,
  });

  factory GetLogGroupFieldsResponse.fromJson(Map<String, dynamic> json) {
    return GetLogGroupFieldsResponse(
      logGroupFields: (json['logGroupFields'] as List?)
          ?.nonNulls
          .map((e) => LogGroupField.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final logGroupFields = this.logGroupFields;
    return {
      if (logGroupFields != null) 'logGroupFields': logGroupFields,
    };
  }
}

/// The response from the GetLogObject operation.
class GetLogObjectResponse {
  /// A stream of structured log data returned by the GetLogObject operation. This
  /// stream contains log events with their associated metadata and extracted
  /// fields.
  final GetLogObjectResponseStream? fieldStream;

  GetLogObjectResponse({
    this.fieldStream,
  });

  factory GetLogObjectResponse.fromJson(Map<String, dynamic> json) {
    return GetLogObjectResponse(
      fieldStream: json['fieldStream'] != null
          ? GetLogObjectResponseStream.fromJson(
              json['fieldStream'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final fieldStream = this.fieldStream;
    return {
      if (fieldStream != null) 'fieldStream': fieldStream,
    };
  }
}

class GetLogRecordResponse {
  /// The requested log event, as a JSON string.
  final Map<String, String>? logRecord;

  GetLogRecordResponse({
    this.logRecord,
  });

  factory GetLogRecordResponse.fromJson(Map<String, dynamic> json) {
    return GetLogRecordResponse(
      logRecord: (json['logRecord'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final logRecord = this.logRecord;
    return {
      if (logRecord != null) 'logRecord': logRecord,
    };
  }
}

class GetLookupTableResponse {
  /// The description of the lookup table.
  final String? description;

  /// The ARN of the KMS key used to encrypt the lookup table data, if applicable.
  final String? kmsKeyId;

  /// The time when the lookup table was last updated, expressed as the number of
  /// milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>.
  final int? lastUpdatedTime;

  /// The ARN of the lookup table.
  final String? lookupTableArn;

  /// The name of the lookup table.
  final String? lookupTableName;

  /// The size of the lookup table in bytes.
  final int? sizeBytes;

  /// The full CSV content of the lookup table.
  final String? tableBody;

  GetLookupTableResponse({
    this.description,
    this.kmsKeyId,
    this.lastUpdatedTime,
    this.lookupTableArn,
    this.lookupTableName,
    this.sizeBytes,
    this.tableBody,
  });

  factory GetLookupTableResponse.fromJson(Map<String, dynamic> json) {
    return GetLookupTableResponse(
      description: json['description'] as String?,
      kmsKeyId: json['kmsKeyId'] as String?,
      lastUpdatedTime: json['lastUpdatedTime'] as int?,
      lookupTableArn: json['lookupTableArn'] as String?,
      lookupTableName: json['lookupTableName'] as String?,
      sizeBytes: json['sizeBytes'] as int?,
      tableBody: json['tableBody'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final kmsKeyId = this.kmsKeyId;
    final lastUpdatedTime = this.lastUpdatedTime;
    final lookupTableArn = this.lookupTableArn;
    final lookupTableName = this.lookupTableName;
    final sizeBytes = this.sizeBytes;
    final tableBody = this.tableBody;
    return {
      if (description != null) 'description': description,
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
      if (lastUpdatedTime != null) 'lastUpdatedTime': lastUpdatedTime,
      if (lookupTableArn != null) 'lookupTableArn': lookupTableArn,
      if (lookupTableName != null) 'lookupTableName': lookupTableName,
      if (sizeBytes != null) 'sizeBytes': sizeBytes,
      if (tableBody != null) 'tableBody': tableBody,
    };
  }
}

class GetQueryResultsResponse {
  /// If you associated an KMS key with the CloudWatch Logs Insights query results
  /// in this account, this field displays the ARN of the key that's used to
  /// encrypt the query results when <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_StartQuery.html">StartQuery</a>
  /// stores them.
  final String? encryptionKey;

  /// If there are more log events remaining in the results, the response includes
  /// a <code>nextToken</code>. You can use this token in a subsequent
  /// <code>GetQueryResults</code> request to get the next set of results. You can
  /// retrieve up to 100,000 log event results from a query by paginating with
  /// this token.
  final String? nextToken;

  /// The query language used for this query. For more information about the query
  /// languages that CloudWatch Logs supports, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_AnalyzeLogData_Languages.html">Supported
  /// query languages</a>.
  final QueryLanguage? queryLanguage;

  /// The log events that matched the query criteria during the most recent time
  /// it ran.
  ///
  /// The <code>results</code> value is an array of arrays. Each log event is one
  /// object in the top-level array. Each of these log event objects is an array
  /// of <code>field</code>/<code>value</code> pairs.
  final List<List<ResultField>>? results;

  /// Includes the number of log events scanned by the query, the number of log
  /// events that matched the query criteria, and the total number of bytes in the
  /// scanned log events. These values reflect the full raw results of the query.
  final QueryStatistics? statistics;

  /// The status of the most recent running of the query. Possible values are
  /// <code>Cancelled</code>, <code>Complete</code>, <code>Failed</code>,
  /// <code>Running</code>, <code>Scheduled</code>, <code>Timeout</code>, and
  /// <code>Unknown</code>.
  ///
  /// Queries time out after 60 minutes of runtime. To avoid having your queries
  /// time out, reduce the time range being searched or partition your query into
  /// a number of queries.
  final QueryStatus? status;

  GetQueryResultsResponse({
    this.encryptionKey,
    this.nextToken,
    this.queryLanguage,
    this.results,
    this.statistics,
    this.status,
  });

  factory GetQueryResultsResponse.fromJson(Map<String, dynamic> json) {
    return GetQueryResultsResponse(
      encryptionKey: json['encryptionKey'] as String?,
      nextToken: json['nextToken'] as String?,
      queryLanguage:
          (json['queryLanguage'] as String?)?.let(QueryLanguage.fromString),
      results: (json['results'] as List?)
          ?.nonNulls
          .map((e) => (e as List)
              .nonNulls
              .map((e) => ResultField.fromJson(e as Map<String, dynamic>))
              .toList())
          .toList(),
      statistics: json['statistics'] != null
          ? QueryStatistics.fromJson(json['statistics'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)?.let(QueryStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final encryptionKey = this.encryptionKey;
    final nextToken = this.nextToken;
    final queryLanguage = this.queryLanguage;
    final results = this.results;
    final statistics = this.statistics;
    final status = this.status;
    return {
      if (encryptionKey != null) 'encryptionKey': encryptionKey,
      if (nextToken != null) 'nextToken': nextToken,
      if (queryLanguage != null) 'queryLanguage': queryLanguage.value,
      if (results != null) 'results': results,
      if (statistics != null) 'statistics': statistics,
      if (status != null) 'status': status.value,
    };
  }
}

class GetScheduledQueryResponse {
  /// The timestamp when the scheduled query was created.
  final int? creationTime;

  /// The description of the scheduled query.
  final String? description;

  /// Configuration for where query results are delivered.
  final DestinationConfiguration? destinationConfiguration;

  /// The ARN of the IAM role used to execute the query and deliver results.
  final String? executionRoleArn;

  /// The status of the most recent execution of the scheduled query.
  final ExecutionStatus? lastExecutionStatus;

  /// The timestamp when the scheduled query was last executed.
  final int? lastTriggeredTime;

  /// The timestamp when the scheduled query was last updated.
  final int? lastUpdatedTime;

  /// The log groups queried by the scheduled query.
  final List<String>? logGroupIdentifiers;

  /// The name of the scheduled query.
  final String? name;

  /// The query language used by the scheduled query.
  final QueryLanguage? queryLanguage;

  /// The query string executed by the scheduled query.
  final String? queryString;

  /// The end time for the scheduled query in Unix epoch format.
  final int? scheduleEndTime;

  /// The cron expression that defines when the scheduled query runs.
  final String? scheduleExpression;

  /// The start time for the scheduled query in Unix epoch format.
  final int? scheduleStartTime;

  /// The ARN of the scheduled query.
  final String? scheduledQueryArn;

  /// The time offset in seconds that defines the lookback period for the query.
  final int? startTimeOffset;

  /// The current state of the scheduled query.
  final ScheduledQueryState? state;

  /// The timezone used for evaluating the schedule expression.
  final String? timezone;

  GetScheduledQueryResponse({
    this.creationTime,
    this.description,
    this.destinationConfiguration,
    this.executionRoleArn,
    this.lastExecutionStatus,
    this.lastTriggeredTime,
    this.lastUpdatedTime,
    this.logGroupIdentifiers,
    this.name,
    this.queryLanguage,
    this.queryString,
    this.scheduleEndTime,
    this.scheduleExpression,
    this.scheduleStartTime,
    this.scheduledQueryArn,
    this.startTimeOffset,
    this.state,
    this.timezone,
  });

  factory GetScheduledQueryResponse.fromJson(Map<String, dynamic> json) {
    return GetScheduledQueryResponse(
      creationTime: json['creationTime'] as int?,
      description: json['description'] as String?,
      destinationConfiguration: json['destinationConfiguration'] != null
          ? DestinationConfiguration.fromJson(
              json['destinationConfiguration'] as Map<String, dynamic>)
          : null,
      executionRoleArn: json['executionRoleArn'] as String?,
      lastExecutionStatus: (json['lastExecutionStatus'] as String?)
          ?.let(ExecutionStatus.fromString),
      lastTriggeredTime: json['lastTriggeredTime'] as int?,
      lastUpdatedTime: json['lastUpdatedTime'] as int?,
      logGroupIdentifiers: (json['logGroupIdentifiers'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      name: json['name'] as String?,
      queryLanguage:
          (json['queryLanguage'] as String?)?.let(QueryLanguage.fromString),
      queryString: json['queryString'] as String?,
      scheduleEndTime: json['scheduleEndTime'] as int?,
      scheduleExpression: json['scheduleExpression'] as String?,
      scheduleStartTime: json['scheduleStartTime'] as int?,
      scheduledQueryArn: json['scheduledQueryArn'] as String?,
      startTimeOffset: json['startTimeOffset'] as int?,
      state: (json['state'] as String?)?.let(ScheduledQueryState.fromString),
      timezone: json['timezone'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final description = this.description;
    final destinationConfiguration = this.destinationConfiguration;
    final executionRoleArn = this.executionRoleArn;
    final lastExecutionStatus = this.lastExecutionStatus;
    final lastTriggeredTime = this.lastTriggeredTime;
    final lastUpdatedTime = this.lastUpdatedTime;
    final logGroupIdentifiers = this.logGroupIdentifiers;
    final name = this.name;
    final queryLanguage = this.queryLanguage;
    final queryString = this.queryString;
    final scheduleEndTime = this.scheduleEndTime;
    final scheduleExpression = this.scheduleExpression;
    final scheduleStartTime = this.scheduleStartTime;
    final scheduledQueryArn = this.scheduledQueryArn;
    final startTimeOffset = this.startTimeOffset;
    final state = this.state;
    final timezone = this.timezone;
    return {
      if (creationTime != null) 'creationTime': creationTime,
      if (description != null) 'description': description,
      if (destinationConfiguration != null)
        'destinationConfiguration': destinationConfiguration,
      if (executionRoleArn != null) 'executionRoleArn': executionRoleArn,
      if (lastExecutionStatus != null)
        'lastExecutionStatus': lastExecutionStatus.value,
      if (lastTriggeredTime != null) 'lastTriggeredTime': lastTriggeredTime,
      if (lastUpdatedTime != null) 'lastUpdatedTime': lastUpdatedTime,
      if (logGroupIdentifiers != null)
        'logGroupIdentifiers': logGroupIdentifiers,
      if (name != null) 'name': name,
      if (queryLanguage != null) 'queryLanguage': queryLanguage.value,
      if (queryString != null) 'queryString': queryString,
      if (scheduleEndTime != null) 'scheduleEndTime': scheduleEndTime,
      if (scheduleExpression != null) 'scheduleExpression': scheduleExpression,
      if (scheduleStartTime != null) 'scheduleStartTime': scheduleStartTime,
      if (scheduledQueryArn != null) 'scheduledQueryArn': scheduledQueryArn,
      if (startTimeOffset != null) 'startTimeOffset': startTimeOffset,
      if (state != null) 'state': state.value,
      if (timezone != null) 'timezone': timezone,
    };
  }
}

class GetScheduledQueryHistoryResponse {
  /// The name of the scheduled query.
  final String? name;
  final String? nextToken;

  /// The ARN of the scheduled query.
  final String? scheduledQueryArn;

  /// An array of execution history records for the scheduled query.
  final List<TriggerHistoryRecord>? triggerHistory;

  GetScheduledQueryHistoryResponse({
    this.name,
    this.nextToken,
    this.scheduledQueryArn,
    this.triggerHistory,
  });

  factory GetScheduledQueryHistoryResponse.fromJson(Map<String, dynamic> json) {
    return GetScheduledQueryHistoryResponse(
      name: json['name'] as String?,
      nextToken: json['nextToken'] as String?,
      scheduledQueryArn: json['scheduledQueryArn'] as String?,
      triggerHistory: (json['triggerHistory'] as List?)
          ?.nonNulls
          .map((e) => TriggerHistoryRecord.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final nextToken = this.nextToken;
    final scheduledQueryArn = this.scheduledQueryArn;
    final triggerHistory = this.triggerHistory;
    return {
      if (name != null) 'name': name,
      if (nextToken != null) 'nextToken': nextToken,
      if (scheduledQueryArn != null) 'scheduledQueryArn': scheduledQueryArn,
      if (triggerHistory != null) 'triggerHistory': triggerHistory,
    };
  }
}

class GetTransformerResponse {
  /// The creation time of the transformer, expressed as the number of
  /// milliseconds after Jan 1, 1970 00:00:00 UTC.
  final int? creationTime;

  /// The date and time when this transformer was most recently modified,
  /// expressed as the number of milliseconds after Jan 1, 1970 00:00:00 UTC.
  final int? lastModifiedTime;

  /// The ARN of the log group that you specified in your request.
  final String? logGroupIdentifier;

  /// This sructure contains the configuration of the requested transformer.
  final List<Processor>? transformerConfig;

  GetTransformerResponse({
    this.creationTime,
    this.lastModifiedTime,
    this.logGroupIdentifier,
    this.transformerConfig,
  });

  factory GetTransformerResponse.fromJson(Map<String, dynamic> json) {
    return GetTransformerResponse(
      creationTime: json['creationTime'] as int?,
      lastModifiedTime: json['lastModifiedTime'] as int?,
      logGroupIdentifier: json['logGroupIdentifier'] as String?,
      transformerConfig: (json['transformerConfig'] as List?)
          ?.nonNulls
          .map((e) => Processor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final lastModifiedTime = this.lastModifiedTime;
    final logGroupIdentifier = this.logGroupIdentifier;
    final transformerConfig = this.transformerConfig;
    return {
      if (creationTime != null) 'creationTime': creationTime,
      if (lastModifiedTime != null) 'lastModifiedTime': lastModifiedTime,
      if (logGroupIdentifier != null) 'logGroupIdentifier': logGroupIdentifier,
      if (transformerConfig != null) 'transformerConfig': transformerConfig,
    };
  }
}

class ListAggregateLogGroupSummariesResponse {
  /// The list of aggregate log group summaries grouped by the specified data
  /// source characteristics.
  final List<AggregateLogGroupSummary>? aggregateLogGroupSummaries;
  final String? nextToken;

  ListAggregateLogGroupSummariesResponse({
    this.aggregateLogGroupSummaries,
    this.nextToken,
  });

  factory ListAggregateLogGroupSummariesResponse.fromJson(
      Map<String, dynamic> json) {
    return ListAggregateLogGroupSummariesResponse(
      aggregateLogGroupSummaries: (json['aggregateLogGroupSummaries'] as List?)
          ?.nonNulls
          .map((e) =>
              AggregateLogGroupSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final aggregateLogGroupSummaries = this.aggregateLogGroupSummaries;
    final nextToken = this.nextToken;
    return {
      if (aggregateLogGroupSummaries != null)
        'aggregateLogGroupSummaries': aggregateLogGroupSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListAnomaliesResponse {
  /// An array of structures, where each structure contains information about one
  /// anomaly that a log anomaly detector has found.
  final List<Anomaly>? anomalies;
  final String? nextToken;

  ListAnomaliesResponse({
    this.anomalies,
    this.nextToken,
  });

  factory ListAnomaliesResponse.fromJson(Map<String, dynamic> json) {
    return ListAnomaliesResponse(
      anomalies: (json['anomalies'] as List?)
          ?.nonNulls
          .map((e) => Anomaly.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final anomalies = this.anomalies;
    final nextToken = this.nextToken;
    return {
      if (anomalies != null) 'anomalies': anomalies,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListIntegrationsResponse {
  /// An array, where each object in the array contains information about one
  /// CloudWatch Logs integration in this account.
  final List<IntegrationSummary>? integrationSummaries;

  ListIntegrationsResponse({
    this.integrationSummaries,
  });

  factory ListIntegrationsResponse.fromJson(Map<String, dynamic> json) {
    return ListIntegrationsResponse(
      integrationSummaries: (json['integrationSummaries'] as List?)
          ?.nonNulls
          .map((e) => IntegrationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final integrationSummaries = this.integrationSummaries;
    return {
      if (integrationSummaries != null)
        'integrationSummaries': integrationSummaries,
    };
  }
}

class ListLogAnomalyDetectorsResponse {
  /// An array of structures, where each structure in the array contains
  /// information about one anomaly detector.
  final List<AnomalyDetector>? anomalyDetectors;
  final String? nextToken;

  ListLogAnomalyDetectorsResponse({
    this.anomalyDetectors,
    this.nextToken,
  });

  factory ListLogAnomalyDetectorsResponse.fromJson(Map<String, dynamic> json) {
    return ListLogAnomalyDetectorsResponse(
      anomalyDetectors: (json['anomalyDetectors'] as List?)
          ?.nonNulls
          .map((e) => AnomalyDetector.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final anomalyDetectors = this.anomalyDetectors;
    final nextToken = this.nextToken;
    return {
      if (anomalyDetectors != null) 'anomalyDetectors': anomalyDetectors,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListLogGroupsResponse {
  /// An array of structures, where each structure contains the information about
  /// one log group.
  final List<LogGroupSummary>? logGroups;
  final String? nextToken;

  ListLogGroupsResponse({
    this.logGroups,
    this.nextToken,
  });

  factory ListLogGroupsResponse.fromJson(Map<String, dynamic> json) {
    return ListLogGroupsResponse(
      logGroups: (json['logGroups'] as List?)
          ?.nonNulls
          .map((e) => LogGroupSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final logGroups = this.logGroups;
    final nextToken = this.nextToken;
    return {
      if (logGroups != null) 'logGroups': logGroups,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListLogGroupsForQueryResponse {
  /// An array of the names and ARNs of the log groups that were processed in the
  /// query.
  final List<String>? logGroupIdentifiers;
  final String? nextToken;

  ListLogGroupsForQueryResponse({
    this.logGroupIdentifiers,
    this.nextToken,
  });

  factory ListLogGroupsForQueryResponse.fromJson(Map<String, dynamic> json) {
    return ListLogGroupsForQueryResponse(
      logGroupIdentifiers: (json['logGroupIdentifiers'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final logGroupIdentifiers = this.logGroupIdentifiers;
    final nextToken = this.nextToken;
    return {
      if (logGroupIdentifiers != null)
        'logGroupIdentifiers': logGroupIdentifiers,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListScheduledQueriesResponse {
  final String? nextToken;

  /// An array of scheduled query summary information.
  final List<ScheduledQuerySummary>? scheduledQueries;

  ListScheduledQueriesResponse({
    this.nextToken,
    this.scheduledQueries,
  });

  factory ListScheduledQueriesResponse.fromJson(Map<String, dynamic> json) {
    return ListScheduledQueriesResponse(
      nextToken: json['nextToken'] as String?,
      scheduledQueries: (json['scheduledQueries'] as List?)
          ?.nonNulls
          .map((e) => ScheduledQuerySummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final scheduledQueries = this.scheduledQueries;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (scheduledQueries != null) 'scheduledQueries': scheduledQueries,
    };
  }
}

class ListSourcesForS3TableIntegrationResponse {
  final String? nextToken;

  /// The list of data source associations for the specified S3 Table Integration.
  final List<S3TableIntegrationSource>? sources;

  ListSourcesForS3TableIntegrationResponse({
    this.nextToken,
    this.sources,
  });

  factory ListSourcesForS3TableIntegrationResponse.fromJson(
      Map<String, dynamic> json) {
    return ListSourcesForS3TableIntegrationResponse(
      nextToken: json['nextToken'] as String?,
      sources: (json['sources'] as List?)
          ?.nonNulls
          .map((e) =>
              S3TableIntegrationSource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final sources = this.sources;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (sources != null) 'sources': sources,
    };
  }
}

class ListTagsForResourceResponse {
  /// The list of tags associated with the requested resource.>
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

class ListTagsLogGroupResponse {
  /// The tags for the log group.
  final Map<String, String>? tags;

  ListTagsLogGroupResponse({
    this.tags,
  });

  factory ListTagsLogGroupResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsLogGroupResponse(
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

class PutAccountPolicyResponse {
  /// The account policy that you created.
  final AccountPolicy? accountPolicy;

  PutAccountPolicyResponse({
    this.accountPolicy,
  });

  factory PutAccountPolicyResponse.fromJson(Map<String, dynamic> json) {
    return PutAccountPolicyResponse(
      accountPolicy: json['accountPolicy'] != null
          ? AccountPolicy.fromJson(
              json['accountPolicy'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accountPolicy = this.accountPolicy;
    return {
      if (accountPolicy != null) 'accountPolicy': accountPolicy,
    };
  }
}

class PutDataProtectionPolicyResponse {
  /// The date and time that this policy was most recently updated.
  final int? lastUpdatedTime;

  /// The log group name or ARN that you specified in your request.
  final String? logGroupIdentifier;

  /// The data protection policy used for this log group.
  final String? policyDocument;

  PutDataProtectionPolicyResponse({
    this.lastUpdatedTime,
    this.logGroupIdentifier,
    this.policyDocument,
  });

  factory PutDataProtectionPolicyResponse.fromJson(Map<String, dynamic> json) {
    return PutDataProtectionPolicyResponse(
      lastUpdatedTime: json['lastUpdatedTime'] as int?,
      logGroupIdentifier: json['logGroupIdentifier'] as String?,
      policyDocument: json['policyDocument'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lastUpdatedTime = this.lastUpdatedTime;
    final logGroupIdentifier = this.logGroupIdentifier;
    final policyDocument = this.policyDocument;
    return {
      if (lastUpdatedTime != null) 'lastUpdatedTime': lastUpdatedTime,
      if (logGroupIdentifier != null) 'logGroupIdentifier': logGroupIdentifier,
      if (policyDocument != null) 'policyDocument': policyDocument,
    };
  }
}

class PutDeliveryDestinationResponse {
  /// A structure containing information about the delivery destination that you
  /// just created or updated.
  final DeliveryDestination? deliveryDestination;

  PutDeliveryDestinationResponse({
    this.deliveryDestination,
  });

  factory PutDeliveryDestinationResponse.fromJson(Map<String, dynamic> json) {
    return PutDeliveryDestinationResponse(
      deliveryDestination: json['deliveryDestination'] != null
          ? DeliveryDestination.fromJson(
              json['deliveryDestination'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final deliveryDestination = this.deliveryDestination;
    return {
      if (deliveryDestination != null)
        'deliveryDestination': deliveryDestination,
    };
  }
}

class PutDeliveryDestinationPolicyResponse {
  /// The contents of the policy that you just created.
  final Policy? policy;

  PutDeliveryDestinationPolicyResponse({
    this.policy,
  });

  factory PutDeliveryDestinationPolicyResponse.fromJson(
      Map<String, dynamic> json) {
    return PutDeliveryDestinationPolicyResponse(
      policy: json['policy'] != null
          ? Policy.fromJson(json['policy'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final policy = this.policy;
    return {
      if (policy != null) 'policy': policy,
    };
  }
}

class PutDeliverySourceResponse {
  /// A structure containing information about the delivery source that was just
  /// created or updated.
  final DeliverySource? deliverySource;

  PutDeliverySourceResponse({
    this.deliverySource,
  });

  factory PutDeliverySourceResponse.fromJson(Map<String, dynamic> json) {
    return PutDeliverySourceResponse(
      deliverySource: json['deliverySource'] != null
          ? DeliverySource.fromJson(
              json['deliverySource'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final deliverySource = this.deliverySource;
    return {
      if (deliverySource != null) 'deliverySource': deliverySource,
    };
  }
}

class PutDestinationResponse {
  /// The destination.
  final Destination? destination;

  PutDestinationResponse({
    this.destination,
  });

  factory PutDestinationResponse.fromJson(Map<String, dynamic> json) {
    return PutDestinationResponse(
      destination: json['destination'] != null
          ? Destination.fromJson(json['destination'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final destination = this.destination;
    return {
      if (destination != null) 'destination': destination,
    };
  }
}

class PutIndexPolicyResponse {
  /// The index policy that you just created or updated.
  final IndexPolicy? indexPolicy;

  PutIndexPolicyResponse({
    this.indexPolicy,
  });

  factory PutIndexPolicyResponse.fromJson(Map<String, dynamic> json) {
    return PutIndexPolicyResponse(
      indexPolicy: json['indexPolicy'] != null
          ? IndexPolicy.fromJson(json['indexPolicy'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final indexPolicy = this.indexPolicy;
    return {
      if (indexPolicy != null) 'indexPolicy': indexPolicy,
    };
  }
}

class PutIntegrationResponse {
  /// The name of the integration that you just created.
  final String? integrationName;

  /// The status of the integration that you just created.
  ///
  /// After you create an integration, it takes a few minutes to complete. During
  /// this time, you'll see the status as <code>PROVISIONING</code>.
  final IntegrationStatus? integrationStatus;

  PutIntegrationResponse({
    this.integrationName,
    this.integrationStatus,
  });

  factory PutIntegrationResponse.fromJson(Map<String, dynamic> json) {
    return PutIntegrationResponse(
      integrationName: json['integrationName'] as String?,
      integrationStatus: (json['integrationStatus'] as String?)
          ?.let(IntegrationStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final integrationName = this.integrationName;
    final integrationStatus = this.integrationStatus;
    return {
      if (integrationName != null) 'integrationName': integrationName,
      if (integrationStatus != null)
        'integrationStatus': integrationStatus.value,
    };
  }
}

class PutLogEventsResponse {
  /// The next sequence token.
  /// <important>
  /// This field has been deprecated.
  ///
  /// The sequence token is now ignored in <code>PutLogEvents</code> actions.
  /// <code>PutLogEvents</code> actions are always accepted even if the sequence
  /// token is not valid. You can use parallel <code>PutLogEvents</code> actions
  /// on the same log stream and you do not need to wait for the response of a
  /// previous <code>PutLogEvents</code> action to obtain the
  /// <code>nextSequenceToken</code> value.
  /// </important>
  final String? nextSequenceToken;

  /// Information about why the entity is rejected when calling
  /// <code>PutLogEvents</code>. Only returned when the entity is rejected.
  /// <note>
  /// When the entity is rejected, the events may still be accepted.
  /// </note>
  final RejectedEntityInfo? rejectedEntityInfo;

  /// The rejected events.
  final RejectedLogEventsInfo? rejectedLogEventsInfo;

  PutLogEventsResponse({
    this.nextSequenceToken,
    this.rejectedEntityInfo,
    this.rejectedLogEventsInfo,
  });

  factory PutLogEventsResponse.fromJson(Map<String, dynamic> json) {
    return PutLogEventsResponse(
      nextSequenceToken: json['nextSequenceToken'] as String?,
      rejectedEntityInfo: json['rejectedEntityInfo'] != null
          ? RejectedEntityInfo.fromJson(
              json['rejectedEntityInfo'] as Map<String, dynamic>)
          : null,
      rejectedLogEventsInfo: json['rejectedLogEventsInfo'] != null
          ? RejectedLogEventsInfo.fromJson(
              json['rejectedLogEventsInfo'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final nextSequenceToken = this.nextSequenceToken;
    final rejectedEntityInfo = this.rejectedEntityInfo;
    final rejectedLogEventsInfo = this.rejectedLogEventsInfo;
    return {
      if (nextSequenceToken != null) 'nextSequenceToken': nextSequenceToken,
      if (rejectedEntityInfo != null) 'rejectedEntityInfo': rejectedEntityInfo,
      if (rejectedLogEventsInfo != null)
        'rejectedLogEventsInfo': rejectedLogEventsInfo,
    };
  }
}

class PutQueryDefinitionResponse {
  /// The ID of the query definition.
  final String? queryDefinitionId;

  PutQueryDefinitionResponse({
    this.queryDefinitionId,
  });

  factory PutQueryDefinitionResponse.fromJson(Map<String, dynamic> json) {
    return PutQueryDefinitionResponse(
      queryDefinitionId: json['queryDefinitionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final queryDefinitionId = this.queryDefinitionId;
    return {
      if (queryDefinitionId != null) 'queryDefinitionId': queryDefinitionId,
    };
  }
}

class PutResourcePolicyResponse {
  /// The new policy.
  final ResourcePolicy? resourcePolicy;

  /// The revision ID of the created or updated resource policy. Only returned for
  /// resource-scoped policies.
  final String? revisionId;

  PutResourcePolicyResponse({
    this.resourcePolicy,
    this.revisionId,
  });

  factory PutResourcePolicyResponse.fromJson(Map<String, dynamic> json) {
    return PutResourcePolicyResponse(
      resourcePolicy: json['resourcePolicy'] != null
          ? ResourcePolicy.fromJson(
              json['resourcePolicy'] as Map<String, dynamic>)
          : null,
      revisionId: json['revisionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final resourcePolicy = this.resourcePolicy;
    final revisionId = this.revisionId;
    return {
      if (resourcePolicy != null) 'resourcePolicy': resourcePolicy,
      if (revisionId != null) 'revisionId': revisionId,
    };
  }
}

class StartLiveTailResponse {
  /// An object that includes the stream returned by your request. It can include
  /// both log events and exceptions.
  final StartLiveTailResponseStream? responseStream;

  StartLiveTailResponse({
    this.responseStream,
  });

  factory StartLiveTailResponse.fromJson(Map<String, dynamic> json) {
    return StartLiveTailResponse(
      responseStream: json['responseStream'] != null
          ? StartLiveTailResponseStream.fromJson(
              json['responseStream'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final responseStream = this.responseStream;
    return {
      if (responseStream != null) 'responseStream': responseStream,
    };
  }
}

class StartQueryResponse {
  /// The unique ID of the query.
  final String? queryId;

  StartQueryResponse({
    this.queryId,
  });

  factory StartQueryResponse.fromJson(Map<String, dynamic> json) {
    return StartQueryResponse(
      queryId: json['queryId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final queryId = this.queryId;
    return {
      if (queryId != null) 'queryId': queryId,
    };
  }
}

class StopQueryResponse {
  /// This is true if the query was stopped by the <code>StopQuery</code>
  /// operation.
  final bool? success;

  StopQueryResponse({
    this.success,
  });

  factory StopQueryResponse.fromJson(Map<String, dynamic> json) {
    return StopQueryResponse(
      success: json['success'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final success = this.success;
    return {
      if (success != null) 'success': success,
    };
  }
}

class TestMetricFilterResponse {
  /// The matched events.
  final List<MetricFilterMatchRecord>? matches;

  TestMetricFilterResponse({
    this.matches,
  });

  factory TestMetricFilterResponse.fromJson(Map<String, dynamic> json) {
    return TestMetricFilterResponse(
      matches: (json['matches'] as List?)
          ?.nonNulls
          .map((e) =>
              MetricFilterMatchRecord.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final matches = this.matches;
    return {
      if (matches != null) 'matches': matches,
    };
  }
}

class TestTransformerResponse {
  /// An array where each member of the array includes both the original version
  /// and the transformed version of one of the log events that you input.
  final List<TransformedLogRecord>? transformedLogs;

  TestTransformerResponse({
    this.transformedLogs,
  });

  factory TestTransformerResponse.fromJson(Map<String, dynamic> json) {
    return TestTransformerResponse(
      transformedLogs: (json['transformedLogs'] as List?)
          ?.nonNulls
          .map((e) => TransformedLogRecord.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final transformedLogs = this.transformedLogs;
    return {
      if (transformedLogs != null) 'transformedLogs': transformedLogs,
    };
  }
}

class UpdateDeliveryConfigurationResponse {
  UpdateDeliveryConfigurationResponse();

  factory UpdateDeliveryConfigurationResponse.fromJson(Map<String, dynamic> _) {
    return UpdateDeliveryConfigurationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateLookupTableResponse {
  /// The time when the lookup table was last updated, expressed as the number of
  /// milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>.
  final int? lastUpdatedTime;

  /// The ARN of the lookup table that was updated.
  final String? lookupTableArn;

  UpdateLookupTableResponse({
    this.lastUpdatedTime,
    this.lookupTableArn,
  });

  factory UpdateLookupTableResponse.fromJson(Map<String, dynamic> json) {
    return UpdateLookupTableResponse(
      lastUpdatedTime: json['lastUpdatedTime'] as int?,
      lookupTableArn: json['lookupTableArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lastUpdatedTime = this.lastUpdatedTime;
    final lookupTableArn = this.lookupTableArn;
    return {
      if (lastUpdatedTime != null) 'lastUpdatedTime': lastUpdatedTime,
      if (lookupTableArn != null) 'lookupTableArn': lookupTableArn,
    };
  }
}

class UpdateScheduledQueryResponse {
  /// The timestamp when the scheduled query was originally created.
  final int? creationTime;

  /// The description of the updated scheduled query.
  final String? description;

  /// The destination configuration of the updated scheduled query.
  final DestinationConfiguration? destinationConfiguration;

  /// The execution role ARN of the updated scheduled query.
  final String? executionRoleArn;

  /// The status of the most recent execution of the updated scheduled query.
  final ExecutionStatus? lastExecutionStatus;

  /// The timestamp when the updated scheduled query was last executed.
  final int? lastTriggeredTime;

  /// The timestamp when the scheduled query was last updated.
  final int? lastUpdatedTime;

  /// The log groups queried by the updated scheduled query.
  final List<String>? logGroupIdentifiers;

  /// The name of the updated scheduled query.
  final String? name;

  /// The query language of the updated scheduled query.
  final QueryLanguage? queryLanguage;

  /// The query string of the updated scheduled query.
  final String? queryString;

  /// The end time of the updated scheduled query.
  final int? scheduleEndTime;

  /// The cron expression of the updated scheduled query.
  final String? scheduleExpression;

  /// The start time of the updated scheduled query.
  final int? scheduleStartTime;

  /// The ARN of the updated scheduled query.
  final String? scheduledQueryArn;

  /// The time offset of the updated scheduled query.
  final int? startTimeOffset;

  /// The state of the updated scheduled query.
  final ScheduledQueryState? state;

  /// The timezone of the updated scheduled query.
  final String? timezone;

  UpdateScheduledQueryResponse({
    this.creationTime,
    this.description,
    this.destinationConfiguration,
    this.executionRoleArn,
    this.lastExecutionStatus,
    this.lastTriggeredTime,
    this.lastUpdatedTime,
    this.logGroupIdentifiers,
    this.name,
    this.queryLanguage,
    this.queryString,
    this.scheduleEndTime,
    this.scheduleExpression,
    this.scheduleStartTime,
    this.scheduledQueryArn,
    this.startTimeOffset,
    this.state,
    this.timezone,
  });

  factory UpdateScheduledQueryResponse.fromJson(Map<String, dynamic> json) {
    return UpdateScheduledQueryResponse(
      creationTime: json['creationTime'] as int?,
      description: json['description'] as String?,
      destinationConfiguration: json['destinationConfiguration'] != null
          ? DestinationConfiguration.fromJson(
              json['destinationConfiguration'] as Map<String, dynamic>)
          : null,
      executionRoleArn: json['executionRoleArn'] as String?,
      lastExecutionStatus: (json['lastExecutionStatus'] as String?)
          ?.let(ExecutionStatus.fromString),
      lastTriggeredTime: json['lastTriggeredTime'] as int?,
      lastUpdatedTime: json['lastUpdatedTime'] as int?,
      logGroupIdentifiers: (json['logGroupIdentifiers'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      name: json['name'] as String?,
      queryLanguage:
          (json['queryLanguage'] as String?)?.let(QueryLanguage.fromString),
      queryString: json['queryString'] as String?,
      scheduleEndTime: json['scheduleEndTime'] as int?,
      scheduleExpression: json['scheduleExpression'] as String?,
      scheduleStartTime: json['scheduleStartTime'] as int?,
      scheduledQueryArn: json['scheduledQueryArn'] as String?,
      startTimeOffset: json['startTimeOffset'] as int?,
      state: (json['state'] as String?)?.let(ScheduledQueryState.fromString),
      timezone: json['timezone'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final description = this.description;
    final destinationConfiguration = this.destinationConfiguration;
    final executionRoleArn = this.executionRoleArn;
    final lastExecutionStatus = this.lastExecutionStatus;
    final lastTriggeredTime = this.lastTriggeredTime;
    final lastUpdatedTime = this.lastUpdatedTime;
    final logGroupIdentifiers = this.logGroupIdentifiers;
    final name = this.name;
    final queryLanguage = this.queryLanguage;
    final queryString = this.queryString;
    final scheduleEndTime = this.scheduleEndTime;
    final scheduleExpression = this.scheduleExpression;
    final scheduleStartTime = this.scheduleStartTime;
    final scheduledQueryArn = this.scheduledQueryArn;
    final startTimeOffset = this.startTimeOffset;
    final state = this.state;
    final timezone = this.timezone;
    return {
      if (creationTime != null) 'creationTime': creationTime,
      if (description != null) 'description': description,
      if (destinationConfiguration != null)
        'destinationConfiguration': destinationConfiguration,
      if (executionRoleArn != null) 'executionRoleArn': executionRoleArn,
      if (lastExecutionStatus != null)
        'lastExecutionStatus': lastExecutionStatus.value,
      if (lastTriggeredTime != null) 'lastTriggeredTime': lastTriggeredTime,
      if (lastUpdatedTime != null) 'lastUpdatedTime': lastUpdatedTime,
      if (logGroupIdentifiers != null)
        'logGroupIdentifiers': logGroupIdentifiers,
      if (name != null) 'name': name,
      if (queryLanguage != null) 'queryLanguage': queryLanguage.value,
      if (queryString != null) 'queryString': queryString,
      if (scheduleEndTime != null) 'scheduleEndTime': scheduleEndTime,
      if (scheduleExpression != null) 'scheduleExpression': scheduleExpression,
      if (scheduleStartTime != null) 'scheduleStartTime': scheduleStartTime,
      if (scheduledQueryArn != null) 'scheduledQueryArn': scheduledQueryArn,
      if (startTimeOffset != null) 'startTimeOffset': startTimeOffset,
      if (state != null) 'state': state.value,
      if (timezone != null) 'timezone': timezone,
    };
  }
}

class QueryLanguage {
  static const cwli = QueryLanguage._('CWLI');
  static const sql = QueryLanguage._('SQL');
  static const ppl = QueryLanguage._('PPL');

  final String value;

  const QueryLanguage._(this.value);

  static const values = [cwli, sql, ppl];

  static QueryLanguage fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => QueryLanguage._(value));

  @override
  bool operator ==(other) => other is QueryLanguage && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Configuration for where to deliver scheduled query results. Specifies the
/// destination type and associated settings for result delivery.
class DestinationConfiguration {
  /// Configuration for delivering query results to Amazon S3.
  final S3Configuration s3Configuration;

  DestinationConfiguration({
    required this.s3Configuration,
  });

  factory DestinationConfiguration.fromJson(Map<String, dynamic> json) {
    return DestinationConfiguration(
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

class ScheduledQueryState {
  static const enabled = ScheduledQueryState._('ENABLED');
  static const disabled = ScheduledQueryState._('DISABLED');

  final String value;

  const ScheduledQueryState._(this.value);

  static const values = [enabled, disabled];

  static ScheduledQueryState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ScheduledQueryState._(value));

  @override
  bool operator ==(other) =>
      other is ScheduledQueryState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class ExecutionStatus {
  static const running = ExecutionStatus._('Running');
  static const invalidQuery = ExecutionStatus._('InvalidQuery');
  static const complete = ExecutionStatus._('Complete');
  static const failed = ExecutionStatus._('Failed');
  static const timeout = ExecutionStatus._('Timeout');

  final String value;

  const ExecutionStatus._(this.value);

  static const values = [running, invalidQuery, complete, failed, timeout];

  static ExecutionStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ExecutionStatus._(value));

  @override
  bool operator ==(other) => other is ExecutionStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Configuration for Amazon S3 destination where scheduled query results are
/// delivered.
class S3Configuration {
  /// The Amazon S3 URI where query results are delivered. Must be a valid S3 URI
  /// format.
  final String destinationIdentifier;

  /// The ARN of the IAM role that grants permissions to write query results to
  /// the specified Amazon S3 destination.
  final String roleArn;

  /// The Amazon Resource Name (ARN) of the KMS encryption key. Must belong to the
  /// same Amazon Web Services Region as the destination Amazon S3 bucket.
  final String? kmsKeyId;

  /// The Amazon Web Services accountId for the bucket owning account.
  final String? ownerAccountId;

  S3Configuration({
    required this.destinationIdentifier,
    required this.roleArn,
    this.kmsKeyId,
    this.ownerAccountId,
  });

  factory S3Configuration.fromJson(Map<String, dynamic> json) {
    return S3Configuration(
      destinationIdentifier: (json['destinationIdentifier'] as String?) ?? '',
      roleArn: (json['roleArn'] as String?) ?? '',
      kmsKeyId: json['kmsKeyId'] as String?,
      ownerAccountId: json['ownerAccountId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final destinationIdentifier = this.destinationIdentifier;
    final roleArn = this.roleArn;
    final kmsKeyId = this.kmsKeyId;
    final ownerAccountId = this.ownerAccountId;
    return {
      'destinationIdentifier': destinationIdentifier,
      'roleArn': roleArn,
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
      if (ownerAccountId != null) 'ownerAccountId': ownerAccountId,
    };
  }
}

class EvaluationFrequency {
  static const oneMin = EvaluationFrequency._('ONE_MIN');
  static const fiveMin = EvaluationFrequency._('FIVE_MIN');
  static const tenMin = EvaluationFrequency._('TEN_MIN');
  static const fifteenMin = EvaluationFrequency._('FIFTEEN_MIN');
  static const thirtyMin = EvaluationFrequency._('THIRTY_MIN');
  static const oneHour = EvaluationFrequency._('ONE_HOUR');

  final String value;

  const EvaluationFrequency._(this.value);

  static const values = [
    oneMin,
    fiveMin,
    tenMin,
    fifteenMin,
    thirtyMin,
    oneHour
  ];

  static EvaluationFrequency fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EvaluationFrequency._(value));

  @override
  bool operator ==(other) =>
      other is EvaluationFrequency && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// This structure contains delivery configurations that apply only when the
/// delivery destination resource is an S3 bucket.
class S3DeliveryConfiguration {
  /// This parameter causes the S3 objects that contain delivered logs to use a
  /// prefix structure that allows for integration with Apache Hive.
  final bool? enableHiveCompatiblePath;

  /// This string allows re-configuring the S3 object prefix to contain either
  /// static or variable sections. The valid variables to use in the suffix path
  /// will vary by each log source. To find the values supported for the suffix
  /// path for each log source, use the <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeConfigurationTemplates.html">DescribeConfigurationTemplates</a>
  /// operation and check the <code>allowedSuffixPathFields</code> field in the
  /// response.
  final String? suffixPath;

  S3DeliveryConfiguration({
    this.enableHiveCompatiblePath,
    this.suffixPath,
  });

  factory S3DeliveryConfiguration.fromJson(Map<String, dynamic> json) {
    return S3DeliveryConfiguration(
      enableHiveCompatiblePath: json['enableHiveCompatiblePath'] as bool?,
      suffixPath: json['suffixPath'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final enableHiveCompatiblePath = this.enableHiveCompatiblePath;
    final suffixPath = this.suffixPath;
    return {
      if (enableHiveCompatiblePath != null)
        'enableHiveCompatiblePath': enableHiveCompatiblePath,
      if (suffixPath != null) 'suffixPath': suffixPath,
    };
  }
}

class SuppressionType {
  static const limited = SuppressionType._('LIMITED');
  static const infinite = SuppressionType._('INFINITE');

  final String value;

  const SuppressionType._(this.value);

  static const values = [limited, infinite];

  static SuppressionType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SuppressionType._(value));

  @override
  bool operator ==(other) => other is SuppressionType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// If you are suppressing an anomaly temporariliy, this structure defines how
/// long the suppression period is to be.
class SuppressionPeriod {
  /// Specifies whether the value of <code>value</code> is in seconds, minutes, or
  /// hours.
  final SuppressionUnit? suppressionUnit;

  /// Specifies the number of seconds, minutes or hours to suppress this anomaly.
  /// There is no maximum.
  final int? value;

  SuppressionPeriod({
    this.suppressionUnit,
    this.value,
  });

  Map<String, dynamic> toJson() {
    final suppressionUnit = this.suppressionUnit;
    final value = this.value;
    return {
      if (suppressionUnit != null) 'suppressionUnit': suppressionUnit.value,
      if (value != null) 'value': value,
    };
  }
}

class SuppressionUnit {
  static const seconds = SuppressionUnit._('SECONDS');
  static const minutes = SuppressionUnit._('MINUTES');
  static const hours = SuppressionUnit._('HOURS');

  final String value;

  const SuppressionUnit._(this.value);

  static const values = [seconds, minutes, hours];

  static SuppressionUnit fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SuppressionUnit._(value));

  @override
  bool operator ==(other) => other is SuppressionUnit && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// This structure contains information for one log event that has been
/// processed by a log transformer.
class TransformedLogRecord {
  /// The original log event message before it was transformed.
  final String? eventMessage;

  /// The event number.
  final int? eventNumber;

  /// The log event message after being transformed.
  final String? transformedEventMessage;

  TransformedLogRecord({
    this.eventMessage,
    this.eventNumber,
    this.transformedEventMessage,
  });

  factory TransformedLogRecord.fromJson(Map<String, dynamic> json) {
    return TransformedLogRecord(
      eventMessage: json['eventMessage'] as String?,
      eventNumber: json['eventNumber'] as int?,
      transformedEventMessage: json['transformedEventMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final eventMessage = this.eventMessage;
    final eventNumber = this.eventNumber;
    final transformedEventMessage = this.transformedEventMessage;
    return {
      if (eventMessage != null) 'eventMessage': eventMessage,
      if (eventNumber != null) 'eventNumber': eventNumber,
      if (transformedEventMessage != null)
        'transformedEventMessage': transformedEventMessage,
    };
  }
}

/// This structure contains the information about one processor in a log
/// transformer.
class Processor {
  /// Use this parameter to include the <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-addKeys">
  /// addKeys</a> processor in your transformer.
  final AddKeys? addKeys;

  /// Use this parameter to include the <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-copyValue">
  /// copyValue</a> processor in your transformer.
  final CopyValue? copyValue;

  /// Use this parameter to include the <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-CSV">
  /// CSV</a> processor in your transformer.
  final CSV? csv;

  /// Use this parameter to include the <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-datetimeConverter">
  /// datetimeConverter</a> processor in your transformer.
  final DateTimeConverter? dateTimeConverter;

  /// Use this parameter to include the <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-deleteKeys">
  /// deleteKeys</a> processor in your transformer.
  final DeleteKeys? deleteKeys;

  /// Use this parameter to include the <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-grok">
  /// grok</a> processor in your transformer.
  final Grok? grok;

  /// Use this parameter to include the <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-listToMap">
  /// listToMap</a> processor in your transformer.
  final ListToMap? listToMap;

  /// Use this parameter to include the <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-lowerCaseString">
  /// lowerCaseString</a> processor in your transformer.
  final LowerCaseString? lowerCaseString;

  /// Use this parameter to include the <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-moveKeys">
  /// moveKeys</a> processor in your transformer.
  final MoveKeys? moveKeys;

  /// Use this parameter to include the <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-parseCloudfront">
  /// parseCloudfront</a> processor in your transformer.
  ///
  /// If you use this processor, it must be the first processor in your
  /// transformer.
  final ParseCloudfront? parseCloudfront;

  /// Use this parameter to include the <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-parseJSON">
  /// parseJSON</a> processor in your transformer.
  final ParseJSON? parseJSON;

  /// Use this parameter to include the <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-parseKeyValue">
  /// parseKeyValue</a> processor in your transformer.
  final ParseKeyValue? parseKeyValue;

  /// Use this parameter to include the <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-parsePostGres">
  /// parsePostGres</a> processor in your transformer.
  ///
  /// If you use this processor, it must be the first processor in your
  /// transformer.
  final ParsePostgres? parsePostgres;

  /// Use this parameter to include the <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-parseRoute53">
  /// parseRoute53</a> processor in your transformer.
  ///
  /// If you use this processor, it must be the first processor in your
  /// transformer.
  final ParseRoute53? parseRoute53;

  /// Use this parameter to convert logs into Open Cybersecurity Schema (OCSF)
  /// format.
  final ParseToOCSF? parseToOCSF;

  /// Use this parameter to include the <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-parseVPC">
  /// parseVPC</a> processor in your transformer.
  ///
  /// If you use this processor, it must be the first processor in your
  /// transformer.
  final ParseVPC? parseVPC;

  /// Use this parameter to include the <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-parseWAF">
  /// parseWAF</a> processor in your transformer.
  ///
  /// If you use this processor, it must be the first processor in your
  /// transformer.
  final ParseWAF? parseWAF;

  /// Use this parameter to include the <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-renameKeys">
  /// renameKeys</a> processor in your transformer.
  final RenameKeys? renameKeys;

  /// Use this parameter to include the <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-splitString">
  /// splitString</a> processor in your transformer.
  final SplitString? splitString;

  /// Use this parameter to include the <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-substituteString">
  /// substituteString</a> processor in your transformer.
  final SubstituteString? substituteString;

  /// Use this parameter to include the <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-trimString">
  /// trimString</a> processor in your transformer.
  final TrimString? trimString;

  /// Use this parameter to include the <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-typeConverter">
  /// typeConverter</a> processor in your transformer.
  final TypeConverter? typeConverter;

  /// Use this parameter to include the <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-upperCaseString">
  /// upperCaseString</a> processor in your transformer.
  final UpperCaseString? upperCaseString;

  Processor({
    this.addKeys,
    this.copyValue,
    this.csv,
    this.dateTimeConverter,
    this.deleteKeys,
    this.grok,
    this.listToMap,
    this.lowerCaseString,
    this.moveKeys,
    this.parseCloudfront,
    this.parseJSON,
    this.parseKeyValue,
    this.parsePostgres,
    this.parseRoute53,
    this.parseToOCSF,
    this.parseVPC,
    this.parseWAF,
    this.renameKeys,
    this.splitString,
    this.substituteString,
    this.trimString,
    this.typeConverter,
    this.upperCaseString,
  });

  factory Processor.fromJson(Map<String, dynamic> json) {
    return Processor(
      addKeys: json['addKeys'] != null
          ? AddKeys.fromJson(json['addKeys'] as Map<String, dynamic>)
          : null,
      copyValue: json['copyValue'] != null
          ? CopyValue.fromJson(json['copyValue'] as Map<String, dynamic>)
          : null,
      csv: json['csv'] != null
          ? CSV.fromJson(json['csv'] as Map<String, dynamic>)
          : null,
      dateTimeConverter: json['dateTimeConverter'] != null
          ? DateTimeConverter.fromJson(
              json['dateTimeConverter'] as Map<String, dynamic>)
          : null,
      deleteKeys: json['deleteKeys'] != null
          ? DeleteKeys.fromJson(json['deleteKeys'] as Map<String, dynamic>)
          : null,
      grok: json['grok'] != null
          ? Grok.fromJson(json['grok'] as Map<String, dynamic>)
          : null,
      listToMap: json['listToMap'] != null
          ? ListToMap.fromJson(json['listToMap'] as Map<String, dynamic>)
          : null,
      lowerCaseString: json['lowerCaseString'] != null
          ? LowerCaseString.fromJson(
              json['lowerCaseString'] as Map<String, dynamic>)
          : null,
      moveKeys: json['moveKeys'] != null
          ? MoveKeys.fromJson(json['moveKeys'] as Map<String, dynamic>)
          : null,
      parseCloudfront: json['parseCloudfront'] != null
          ? ParseCloudfront.fromJson(
              json['parseCloudfront'] as Map<String, dynamic>)
          : null,
      parseJSON: json['parseJSON'] != null
          ? ParseJSON.fromJson(json['parseJSON'] as Map<String, dynamic>)
          : null,
      parseKeyValue: json['parseKeyValue'] != null
          ? ParseKeyValue.fromJson(
              json['parseKeyValue'] as Map<String, dynamic>)
          : null,
      parsePostgres: json['parsePostgres'] != null
          ? ParsePostgres.fromJson(
              json['parsePostgres'] as Map<String, dynamic>)
          : null,
      parseRoute53: json['parseRoute53'] != null
          ? ParseRoute53.fromJson(json['parseRoute53'] as Map<String, dynamic>)
          : null,
      parseToOCSF: json['parseToOCSF'] != null
          ? ParseToOCSF.fromJson(json['parseToOCSF'] as Map<String, dynamic>)
          : null,
      parseVPC: json['parseVPC'] != null
          ? ParseVPC.fromJson(json['parseVPC'] as Map<String, dynamic>)
          : null,
      parseWAF: json['parseWAF'] != null
          ? ParseWAF.fromJson(json['parseWAF'] as Map<String, dynamic>)
          : null,
      renameKeys: json['renameKeys'] != null
          ? RenameKeys.fromJson(json['renameKeys'] as Map<String, dynamic>)
          : null,
      splitString: json['splitString'] != null
          ? SplitString.fromJson(json['splitString'] as Map<String, dynamic>)
          : null,
      substituteString: json['substituteString'] != null
          ? SubstituteString.fromJson(
              json['substituteString'] as Map<String, dynamic>)
          : null,
      trimString: json['trimString'] != null
          ? TrimString.fromJson(json['trimString'] as Map<String, dynamic>)
          : null,
      typeConverter: json['typeConverter'] != null
          ? TypeConverter.fromJson(
              json['typeConverter'] as Map<String, dynamic>)
          : null,
      upperCaseString: json['upperCaseString'] != null
          ? UpperCaseString.fromJson(
              json['upperCaseString'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final addKeys = this.addKeys;
    final copyValue = this.copyValue;
    final csv = this.csv;
    final dateTimeConverter = this.dateTimeConverter;
    final deleteKeys = this.deleteKeys;
    final grok = this.grok;
    final listToMap = this.listToMap;
    final lowerCaseString = this.lowerCaseString;
    final moveKeys = this.moveKeys;
    final parseCloudfront = this.parseCloudfront;
    final parseJSON = this.parseJSON;
    final parseKeyValue = this.parseKeyValue;
    final parsePostgres = this.parsePostgres;
    final parseRoute53 = this.parseRoute53;
    final parseToOCSF = this.parseToOCSF;
    final parseVPC = this.parseVPC;
    final parseWAF = this.parseWAF;
    final renameKeys = this.renameKeys;
    final splitString = this.splitString;
    final substituteString = this.substituteString;
    final trimString = this.trimString;
    final typeConverter = this.typeConverter;
    final upperCaseString = this.upperCaseString;
    return {
      if (addKeys != null) 'addKeys': addKeys,
      if (copyValue != null) 'copyValue': copyValue,
      if (csv != null) 'csv': csv,
      if (dateTimeConverter != null) 'dateTimeConverter': dateTimeConverter,
      if (deleteKeys != null) 'deleteKeys': deleteKeys,
      if (grok != null) 'grok': grok,
      if (listToMap != null) 'listToMap': listToMap,
      if (lowerCaseString != null) 'lowerCaseString': lowerCaseString,
      if (moveKeys != null) 'moveKeys': moveKeys,
      if (parseCloudfront != null) 'parseCloudfront': parseCloudfront,
      if (parseJSON != null) 'parseJSON': parseJSON,
      if (parseKeyValue != null) 'parseKeyValue': parseKeyValue,
      if (parsePostgres != null) 'parsePostgres': parsePostgres,
      if (parseRoute53 != null) 'parseRoute53': parseRoute53,
      if (parseToOCSF != null) 'parseToOCSF': parseToOCSF,
      if (parseVPC != null) 'parseVPC': parseVPC,
      if (parseWAF != null) 'parseWAF': parseWAF,
      if (renameKeys != null) 'renameKeys': renameKeys,
      if (splitString != null) 'splitString': splitString,
      if (substituteString != null) 'substituteString': substituteString,
      if (trimString != null) 'trimString': trimString,
      if (typeConverter != null) 'typeConverter': typeConverter,
      if (upperCaseString != null) 'upperCaseString': upperCaseString,
    };
  }
}

/// This processor adds new key-value pairs to the log event.
///
/// For more information about this processor including examples, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-addKeys">
/// addKeys</a> in the <i>CloudWatch Logs User Guide</i>.
class AddKeys {
  /// An array of objects, where each object contains the information about one
  /// key to add to the log event.
  final List<AddKeyEntry> entries;

  AddKeys({
    required this.entries,
  });

  factory AddKeys.fromJson(Map<String, dynamic> json) {
    return AddKeys(
      entries: ((json['entries'] as List?) ?? const [])
          .nonNulls
          .map((e) => AddKeyEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final entries = this.entries;
    return {
      'entries': entries,
    };
  }
}

/// This processor copies values within a log event. You can also use this
/// processor to add metadata to log events by copying the values of the
/// following metadata keys into the log events: <code>@logGroupName</code>,
/// <code>@logGroupStream</code>, <code>@accountId</code>,
/// <code>@regionName</code>.
///
/// For more information about this processor including examples, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-copyValue">
/// copyValue</a> in the <i>CloudWatch Logs User Guide</i>.
class CopyValue {
  /// An array of <code>CopyValueEntry</code> objects, where each object contains
  /// the information about one field value to copy.
  final List<CopyValueEntry> entries;

  CopyValue({
    required this.entries,
  });

  factory CopyValue.fromJson(Map<String, dynamic> json) {
    return CopyValue(
      entries: ((json['entries'] as List?) ?? const [])
          .nonNulls
          .map((e) => CopyValueEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final entries = this.entries;
    return {
      'entries': entries,
    };
  }
}

/// The <code>CSV</code> processor parses comma-separated values (CSV) from the
/// log events into columns.
///
/// For more information about this processor including examples, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-csv">
/// csv</a> in the <i>CloudWatch Logs User Guide</i>.
class CSV {
  /// An array of names to use for the columns in the transformed log event.
  ///
  /// If you omit this, default column names (<code>[column_1, column_2
  /// ...]</code>) are used.
  final List<String>? columns;

  /// The character used to separate each column in the original comma-separated
  /// value log event. If you omit this, the processor looks for the comma
  /// <code>,</code> character as the delimiter.
  final String? delimiter;

  /// The path to the parent field to put transformed key value pairs under. If
  /// you omit this value, the key value pairs will be placed under the root node.
  final String? destination;

  /// The character used used as a text qualifier for a single column of data. If
  /// you omit this, the double quotation mark <code>"</code> character is used.
  final String? quoteCharacter;

  /// The path to the field in the log event that has the comma separated values
  /// to be parsed. If you omit this value, the whole log message is processed.
  final String? source;

  CSV({
    this.columns,
    this.delimiter,
    this.destination,
    this.quoteCharacter,
    this.source,
  });

  factory CSV.fromJson(Map<String, dynamic> json) {
    return CSV(
      columns:
          (json['columns'] as List?)?.nonNulls.map((e) => e as String).toList(),
      delimiter: json['delimiter'] as String?,
      destination: json['destination'] as String?,
      quoteCharacter: json['quoteCharacter'] as String?,
      source: json['source'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final columns = this.columns;
    final delimiter = this.delimiter;
    final destination = this.destination;
    final quoteCharacter = this.quoteCharacter;
    final source = this.source;
    return {
      if (columns != null) 'columns': columns,
      if (delimiter != null) 'delimiter': delimiter,
      if (destination != null) 'destination': destination,
      if (quoteCharacter != null) 'quoteCharacter': quoteCharacter,
      if (source != null) 'source': source,
    };
  }
}

/// This processor converts a datetime string into a format that you specify.
///
/// For more information about this processor including examples, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-datetimeConverter">
/// datetimeConverter</a> in the <i>CloudWatch Logs User Guide</i>.
class DateTimeConverter {
  /// A list of patterns to match against the <code>source</code> field.
  final List<String> matchPatterns;

  /// The key to apply the date conversion to.
  final String source;

  /// The JSON field to store the result in.
  final String target;

  /// The locale of the source field. If you omit this, the default of
  /// <code>locale.ROOT</code> is used.
  final String? locale;

  /// The time zone of the source field. If you omit this, the default used is the
  /// UTC zone.
  final String? sourceTimezone;

  /// The datetime format to use for the converted data in the target field.
  ///
  /// If you omit this, the default of <code> yyyy-MM-dd'T'HH:mm:ss.SSS'Z</code>
  /// is used.
  final String? targetFormat;

  /// The time zone of the target field. If you omit this, the default used is the
  /// UTC zone.
  final String? targetTimezone;

  DateTimeConverter({
    required this.matchPatterns,
    required this.source,
    required this.target,
    this.locale,
    this.sourceTimezone,
    this.targetFormat,
    this.targetTimezone,
  });

  factory DateTimeConverter.fromJson(Map<String, dynamic> json) {
    return DateTimeConverter(
      matchPatterns: ((json['matchPatterns'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      source: (json['source'] as String?) ?? '',
      target: (json['target'] as String?) ?? '',
      locale: json['locale'] as String?,
      sourceTimezone: json['sourceTimezone'] as String?,
      targetFormat: json['targetFormat'] as String?,
      targetTimezone: json['targetTimezone'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final matchPatterns = this.matchPatterns;
    final source = this.source;
    final target = this.target;
    final locale = this.locale;
    final sourceTimezone = this.sourceTimezone;
    final targetFormat = this.targetFormat;
    final targetTimezone = this.targetTimezone;
    return {
      'matchPatterns': matchPatterns,
      'source': source,
      'target': target,
      if (locale != null) 'locale': locale,
      if (sourceTimezone != null) 'sourceTimezone': sourceTimezone,
      if (targetFormat != null) 'targetFormat': targetFormat,
      if (targetTimezone != null) 'targetTimezone': targetTimezone,
    };
  }
}

/// This processor deletes entries from a log event. These entries are key-value
/// pairs.
///
/// For more information about this processor including examples, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-deleteKeys">
/// deleteKeys</a> in the <i>CloudWatch Logs User Guide</i>.
class DeleteKeys {
  /// The list of keys to delete.
  final List<String> withKeys;

  DeleteKeys({
    required this.withKeys,
  });

  factory DeleteKeys.fromJson(Map<String, dynamic> json) {
    return DeleteKeys(
      withKeys: ((json['withKeys'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final withKeys = this.withKeys;
    return {
      'withKeys': withKeys,
    };
  }
}

/// This processor uses pattern matching to parse and structure unstructured
/// data. This processor can also extract fields from log messages.
///
/// For more information about this processor including examples, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation-Configurable.html#CloudWatch-Logs-Transformation-Grok">grok</a>
/// in the <i>CloudWatch Logs User Guide</i>.
class Grok {
  /// The grok pattern to match against the log event. For a list of supported
  /// grok patterns, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation-Configurable.html#CloudWatch-Logs-Transformation-Grok">Supported
  /// grok patterns</a>.
  final String match;

  /// The path to the field in the log event that you want to parse. If you omit
  /// this value, the whole log message is parsed.
  final String? source;

  Grok({
    required this.match,
    this.source,
  });

  factory Grok.fromJson(Map<String, dynamic> json) {
    return Grok(
      match: (json['match'] as String?) ?? '',
      source: json['source'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final match = this.match;
    final source = this.source;
    return {
      'match': match,
      if (source != null) 'source': source,
    };
  }
}

/// This processor takes a list of objects that contain key fields, and converts
/// them into a map of target keys.
///
/// For more information about this processor including examples, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation-Processors.html#CloudWatch-Logs-Transformation-listToMap">
/// listToMap</a> in the <i>CloudWatch Logs User Guide</i>.
class ListToMap {
  /// The key of the field to be extracted as keys in the generated map
  final String key;

  /// The key in the log event that has a list of objects that will be converted
  /// to a map.
  final String source;

  /// A Boolean value to indicate whether the list will be flattened into single
  /// items. Specify <code>true</code> to flatten the list. The default is
  /// <code>false</code>
  final bool? flatten;

  /// If you set <code>flatten</code> to <code>true</code>, use
  /// <code>flattenedElement</code> to specify which element, <code>first</code>
  /// or <code>last</code>, to keep.
  ///
  /// You must specify this parameter if <code>flatten</code> is <code>true</code>
  final FlattenedElement? flattenedElement;

  /// The key of the field that will hold the generated map
  final String? target;

  /// If this is specified, the values that you specify in this parameter will be
  /// extracted from the <code>source</code> objects and put into the values of
  /// the generated map. Otherwise, original objects in the source list will be
  /// put into the values of the generated map.
  final String? valueKey;

  ListToMap({
    required this.key,
    required this.source,
    this.flatten,
    this.flattenedElement,
    this.target,
    this.valueKey,
  });

  factory ListToMap.fromJson(Map<String, dynamic> json) {
    return ListToMap(
      key: (json['key'] as String?) ?? '',
      source: (json['source'] as String?) ?? '',
      flatten: json['flatten'] as bool?,
      flattenedElement: (json['flattenedElement'] as String?)
          ?.let(FlattenedElement.fromString),
      target: json['target'] as String?,
      valueKey: json['valueKey'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final source = this.source;
    final flatten = this.flatten;
    final flattenedElement = this.flattenedElement;
    final target = this.target;
    final valueKey = this.valueKey;
    return {
      'key': key,
      'source': source,
      if (flatten != null) 'flatten': flatten,
      if (flattenedElement != null) 'flattenedElement': flattenedElement.value,
      if (target != null) 'target': target,
      if (valueKey != null) 'valueKey': valueKey,
    };
  }
}

/// This processor converts a string to lowercase.
///
/// For more information about this processor including examples, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-lowerCaseString">
/// lowerCaseString</a> in the <i>CloudWatch Logs User Guide</i>.
class LowerCaseString {
  /// The array caontaining the keys of the fields to convert to lowercase.
  final List<String> withKeys;

  LowerCaseString({
    required this.withKeys,
  });

  factory LowerCaseString.fromJson(Map<String, dynamic> json) {
    return LowerCaseString(
      withKeys: ((json['withKeys'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final withKeys = this.withKeys;
    return {
      'withKeys': withKeys,
    };
  }
}

/// This processor moves a key from one field to another. The original key is
/// deleted.
///
/// For more information about this processor including examples, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-moveKeys">
/// moveKeys</a> in the <i>CloudWatch Logs User Guide</i>.
class MoveKeys {
  /// An array of objects, where each object contains the information about one
  /// key to move.
  final List<MoveKeyEntry> entries;

  MoveKeys({
    required this.entries,
  });

  factory MoveKeys.fromJson(Map<String, dynamic> json) {
    return MoveKeys(
      entries: ((json['entries'] as List?) ?? const [])
          .nonNulls
          .map((e) => MoveKeyEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final entries = this.entries;
    return {
      'entries': entries,
    };
  }
}

/// This processor parses CloudFront vended logs, extract fields, and convert
/// them into JSON format. Encoded field values are decoded. Values that are
/// integers and doubles are treated as such. For more information about this
/// processor including examples, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-parseCloudfront">
/// parseCloudfront</a>
///
/// For more information about CloudFront log format, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/AccessLogs.html">
/// Configure and use standard logs (access logs)</a>.
///
/// If you use this processor, it must be the first processor in your
/// transformer.
class ParseCloudfront {
  /// Omit this parameter and the whole log message will be processed by this
  /// processor. No other value than <code>@message</code> is allowed for
  /// <code>source</code>.
  final String? source;

  ParseCloudfront({
    this.source,
  });

  factory ParseCloudfront.fromJson(Map<String, dynamic> json) {
    return ParseCloudfront(
      source: json['source'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final source = this.source;
    return {
      if (source != null) 'source': source,
    };
  }
}

/// This processor parses log events that are in JSON format. It can extract
/// JSON key-value pairs and place them under a destination that you specify.
///
/// Additionally, because you must have at least one parse-type processor in a
/// transformer, you can use <code>ParseJSON</code> as that processor for
/// JSON-format logs, so that you can also apply other processors, such as
/// mutate processors, to these logs.
///
/// For more information about this processor including examples, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-parseJSON">
/// parseJSON</a> in the <i>CloudWatch Logs User Guide</i>.
class ParseJSON {
  /// The location to put the parsed key value pair into. If you omit this
  /// parameter, it is placed under the root node.
  final String? destination;

  /// Path to the field in the log event that will be parsed. Use dot notation to
  /// access child fields. For example, <code>store.book</code>
  final String? source;

  ParseJSON({
    this.destination,
    this.source,
  });

  factory ParseJSON.fromJson(Map<String, dynamic> json) {
    return ParseJSON(
      destination: json['destination'] as String?,
      source: json['source'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final destination = this.destination;
    final source = this.source;
    return {
      if (destination != null) 'destination': destination,
      if (source != null) 'source': source,
    };
  }
}

/// This processor parses a specified field in the original log event into
/// key-value pairs.
///
/// For more information about this processor including examples, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-parseKeyValue">
/// parseKeyValue</a> in the <i>CloudWatch Logs User Guide</i>.
class ParseKeyValue {
  /// The destination field to put the extracted key-value pairs into
  final String? destination;

  /// The field delimiter string that is used between key-value pairs in the
  /// original log events. If you omit this, the ampersand <code>&</code>
  /// character is used.
  final String? fieldDelimiter;

  /// If you want to add a prefix to all transformed keys, specify it here.
  final String? keyPrefix;

  /// The delimiter string to use between the key and value in each pair in the
  /// transformed log event.
  ///
  /// If you omit this, the equal <code>=</code> character is used.
  final String? keyValueDelimiter;

  /// A value to insert into the value field in the result, when a key-value pair
  /// is not successfully split.
  final String? nonMatchValue;

  /// Specifies whether to overwrite the value if the destination key already
  /// exists. If you omit this, the default is <code>false</code>.
  final bool? overwriteIfExists;

  /// Path to the field in the log event that will be parsed. Use dot notation to
  /// access child fields. For example, <code>store.book</code>
  final String? source;

  ParseKeyValue({
    this.destination,
    this.fieldDelimiter,
    this.keyPrefix,
    this.keyValueDelimiter,
    this.nonMatchValue,
    this.overwriteIfExists,
    this.source,
  });

  factory ParseKeyValue.fromJson(Map<String, dynamic> json) {
    return ParseKeyValue(
      destination: json['destination'] as String?,
      fieldDelimiter: json['fieldDelimiter'] as String?,
      keyPrefix: json['keyPrefix'] as String?,
      keyValueDelimiter: json['keyValueDelimiter'] as String?,
      nonMatchValue: json['nonMatchValue'] as String?,
      overwriteIfExists: json['overwriteIfExists'] as bool?,
      source: json['source'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final destination = this.destination;
    final fieldDelimiter = this.fieldDelimiter;
    final keyPrefix = this.keyPrefix;
    final keyValueDelimiter = this.keyValueDelimiter;
    final nonMatchValue = this.nonMatchValue;
    final overwriteIfExists = this.overwriteIfExists;
    final source = this.source;
    return {
      if (destination != null) 'destination': destination,
      if (fieldDelimiter != null) 'fieldDelimiter': fieldDelimiter,
      if (keyPrefix != null) 'keyPrefix': keyPrefix,
      if (keyValueDelimiter != null) 'keyValueDelimiter': keyValueDelimiter,
      if (nonMatchValue != null) 'nonMatchValue': nonMatchValue,
      if (overwriteIfExists != null) 'overwriteIfExists': overwriteIfExists,
      if (source != null) 'source': source,
    };
  }
}

/// Use this processor to parse Route 53 vended logs, extract fields, and and
/// convert them into a JSON format. This processor always processes the entire
/// log event message. For more information about this processor including
/// examples, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-parseRoute53">
/// parseRoute53</a>.
/// <important>
/// If you use this processor, it must be the first processor in your
/// transformer.
/// </important>
class ParseRoute53 {
  /// Omit this parameter and the whole log message will be processed by this
  /// processor. No other value than <code>@message</code> is allowed for
  /// <code>source</code>.
  final String? source;

  ParseRoute53({
    this.source,
  });

  factory ParseRoute53.fromJson(Map<String, dynamic> json) {
    return ParseRoute53(
      source: json['source'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final source = this.source;
    return {
      if (source != null) 'source': source,
    };
  }
}

/// This processor converts logs into <a href="https://ocsf.io">Open
/// Cybersecurity Schema Framework (OCSF)</a> events.
///
/// For more information about this processor including examples, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-parseToOCSF">parseToOCSF</a>
/// in the <i>CloudWatch Logs User Guide</i>.
class ParseToOCSF {
  /// Specify the service or process that produces the log events that will be
  /// converted with this processor.
  final EventSource eventSource;

  /// Specify which version of the OCSF schema to use for the transformed log
  /// events.
  final OCSFVersion ocsfVersion;

  /// The version of the OCSF mapping to use for parsing log data.
  final String? mappingVersion;

  /// The path to the field in the log event that you want to parse. If you omit
  /// this value, the whole log message is parsed.
  final String? source;

  ParseToOCSF({
    required this.eventSource,
    required this.ocsfVersion,
    this.mappingVersion,
    this.source,
  });

  factory ParseToOCSF.fromJson(Map<String, dynamic> json) {
    return ParseToOCSF(
      eventSource:
          EventSource.fromString((json['eventSource'] as String?) ?? ''),
      ocsfVersion:
          OCSFVersion.fromString((json['ocsfVersion'] as String?) ?? ''),
      mappingVersion: json['mappingVersion'] as String?,
      source: json['source'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final eventSource = this.eventSource;
    final ocsfVersion = this.ocsfVersion;
    final mappingVersion = this.mappingVersion;
    final source = this.source;
    return {
      'eventSource': eventSource.value,
      'ocsfVersion': ocsfVersion.value,
      if (mappingVersion != null) 'mappingVersion': mappingVersion,
      if (source != null) 'source': source,
    };
  }
}

/// Use this processor to parse RDS for PostgreSQL vended logs, extract fields,
/// and and convert them into a JSON format. This processor always processes the
/// entire log event message. For more information about this processor
/// including examples, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-parsePostGres">
/// parsePostGres</a>.
///
/// For more information about RDS for PostgreSQL log format, see <a
/// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_LogAccess.Concepts.PostgreSQL.html#USER_LogAccess.Concepts.PostgreSQL.Log_Format.log-line-prefix">
/// RDS for PostgreSQL database log filesTCP flag sequence</a>.
/// <important>
/// If you use this processor, it must be the first processor in your
/// transformer.
/// </important>
class ParsePostgres {
  /// Omit this parameter and the whole log message will be processed by this
  /// processor. No other value than <code>@message</code> is allowed for
  /// <code>source</code>.
  final String? source;

  ParsePostgres({
    this.source,
  });

  factory ParsePostgres.fromJson(Map<String, dynamic> json) {
    return ParsePostgres(
      source: json['source'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final source = this.source;
    return {
      if (source != null) 'source': source,
    };
  }
}

/// Use this processor to parse Amazon VPC vended logs, extract fields, and and
/// convert them into a JSON format. This processor always processes the entire
/// log event message.
///
/// This processor doesn't support custom log formats, such as NAT gateway logs.
/// For more information about custom log formats in Amazon VPC, see <a
/// href="https://docs.aws.amazon.com/vpc/latest/userguide/flow-logs-records-examples.html#flow-log-example-tcp-flag">
/// parseVPC</a> For more information about this processor including examples,
/// see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-parseVPC">
/// parseVPC</a>.
/// <important>
/// If you use this processor, it must be the first processor in your
/// transformer.
/// </important>
class ParseVPC {
  /// Omit this parameter and the whole log message will be processed by this
  /// processor. No other value than <code>@message</code> is allowed for
  /// <code>source</code>.
  final String? source;

  ParseVPC({
    this.source,
  });

  factory ParseVPC.fromJson(Map<String, dynamic> json) {
    return ParseVPC(
      source: json['source'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final source = this.source;
    return {
      if (source != null) 'source': source,
    };
  }
}

/// Use this processor to parse WAF vended logs, extract fields, and and convert
/// them into a JSON format. This processor always processes the entire log
/// event message. For more information about this processor including examples,
/// see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-parsePostGres">
/// parseWAF</a>.
///
/// For more information about WAF log format, see <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/logging-examples.html">
/// Log examples for web ACL traffic</a>.
/// <important>
/// If you use this processor, it must be the first processor in your
/// transformer.
/// </important>
class ParseWAF {
  /// Omit this parameter and the whole log message will be processed by this
  /// processor. No other value than <code>@message</code> is allowed for
  /// <code>source</code>.
  final String? source;

  ParseWAF({
    this.source,
  });

  factory ParseWAF.fromJson(Map<String, dynamic> json) {
    return ParseWAF(
      source: json['source'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final source = this.source;
    return {
      if (source != null) 'source': source,
    };
  }
}

/// Use this processor to rename keys in a log event.
///
/// For more information about this processor including examples, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-renameKeys">
/// renameKeys</a> in the <i>CloudWatch Logs User Guide</i>.
class RenameKeys {
  /// An array of <code>RenameKeyEntry</code> objects, where each object contains
  /// the information about a single key to rename.
  final List<RenameKeyEntry> entries;

  RenameKeys({
    required this.entries,
  });

  factory RenameKeys.fromJson(Map<String, dynamic> json) {
    return RenameKeys(
      entries: ((json['entries'] as List?) ?? const [])
          .nonNulls
          .map((e) => RenameKeyEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final entries = this.entries;
    return {
      'entries': entries,
    };
  }
}

/// Use this processor to split a field into an array of strings using a
/// delimiting character.
///
/// For more information about this processor including examples, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-splitString">
/// splitString</a> in the <i>CloudWatch Logs User Guide</i>.
class SplitString {
  /// An array of <code>SplitStringEntry</code> objects, where each object
  /// contains the information about one field to split.
  final List<SplitStringEntry> entries;

  SplitString({
    required this.entries,
  });

  factory SplitString.fromJson(Map<String, dynamic> json) {
    return SplitString(
      entries: ((json['entries'] as List?) ?? const [])
          .nonNulls
          .map((e) => SplitStringEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final entries = this.entries;
    return {
      'entries': entries,
    };
  }
}

/// This processor matches a key’s value against a regular expression and
/// replaces all matches with a replacement string.
///
/// For more information about this processor including examples, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-substituteString">
/// substituteString</a> in the <i>CloudWatch Logs User Guide</i>.
class SubstituteString {
  /// An array of objects, where each object contains the information about one
  /// key to match and replace.
  final List<SubstituteStringEntry> entries;

  SubstituteString({
    required this.entries,
  });

  factory SubstituteString.fromJson(Map<String, dynamic> json) {
    return SubstituteString(
      entries: ((json['entries'] as List?) ?? const [])
          .nonNulls
          .map((e) => SubstituteStringEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final entries = this.entries;
    return {
      'entries': entries,
    };
  }
}

/// Use this processor to remove leading and trailing whitespace.
///
/// For more information about this processor including examples, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-trimString">
/// trimString</a> in the <i>CloudWatch Logs User Guide</i>.
class TrimString {
  /// The array containing the keys of the fields to trim.
  final List<String> withKeys;

  TrimString({
    required this.withKeys,
  });

  factory TrimString.fromJson(Map<String, dynamic> json) {
    return TrimString(
      withKeys: ((json['withKeys'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final withKeys = this.withKeys;
    return {
      'withKeys': withKeys,
    };
  }
}

/// Use this processor to convert a value type associated with the specified key
/// to the specified type. It's a casting processor that changes the types of
/// the specified fields. Values can be converted into one of the following
/// datatypes: <code>integer</code>, <code>double</code>, <code>string</code>
/// and <code>boolean</code>.
///
/// For more information about this processor including examples, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-trimString">
/// trimString</a> in the <i>CloudWatch Logs User Guide</i>.
class TypeConverter {
  /// An array of <code>TypeConverterEntry</code> objects, where each object
  /// contains the information about one field to change the type of.
  final List<TypeConverterEntry> entries;

  TypeConverter({
    required this.entries,
  });

  factory TypeConverter.fromJson(Map<String, dynamic> json) {
    return TypeConverter(
      entries: ((json['entries'] as List?) ?? const [])
          .nonNulls
          .map((e) => TypeConverterEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final entries = this.entries;
    return {
      'entries': entries,
    };
  }
}

/// This processor converts a string field to uppercase.
///
/// For more information about this processor including examples, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-upperCaseString">
/// upperCaseString</a> in the <i>CloudWatch Logs User Guide</i>.
class UpperCaseString {
  /// The array of containing the keys of the field to convert to uppercase.
  final List<String> withKeys;

  UpperCaseString({
    required this.withKeys,
  });

  factory UpperCaseString.fromJson(Map<String, dynamic> json) {
    return UpperCaseString(
      withKeys: ((json['withKeys'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final withKeys = this.withKeys;
    return {
      'withKeys': withKeys,
    };
  }
}

/// This object defines one value type that will be converted using the <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-typeConverter">
/// typeConverter</a> processor.
class TypeConverterEntry {
  /// The key with the value that is to be converted to a different type.
  final String key;

  /// The type to convert the field value to. Valid values are
  /// <code>integer</code>, <code>double</code>, <code>string</code> and
  /// <code>boolean</code>.
  final Type type;

  TypeConverterEntry({
    required this.key,
    required this.type,
  });

  factory TypeConverterEntry.fromJson(Map<String, dynamic> json) {
    return TypeConverterEntry(
      key: (json['key'] as String?) ?? '',
      type: Type.fromString((json['type'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final type = this.type;
    return {
      'key': key,
      'type': type.value,
    };
  }
}

class Type {
  static const boolean = Type._('boolean');
  static const integer = Type._('integer');
  static const $double = Type._('double');
  static const string = Type._('string');

  final String value;

  const Type._(this.value);

  static const values = [boolean, integer, $double, string];

  static Type fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Type._(value));

  @override
  bool operator ==(other) => other is Type && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// This object defines one log field key that will be replaced using the <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-substituteString">
/// substituteString</a> processor.
class SubstituteStringEntry {
  /// The regular expression string to be replaced. Special regex characters such
  /// as [ and ] must be escaped using \\ when using double quotes and with \ when
  /// using single quotes. For more information, see <a
  /// href="https://docs.oracle.com/en/java/javase/17/docs/api/java.base/java/util/regex/Pattern.html">
  /// Class Pattern</a> on the Oracle web site.
  final String from;

  /// The key to modify
  final String source;

  /// The string to be substituted for each match of <code>from</code>
  final String to;

  SubstituteStringEntry({
    required this.from,
    required this.source,
    required this.to,
  });

  factory SubstituteStringEntry.fromJson(Map<String, dynamic> json) {
    return SubstituteStringEntry(
      from: (json['from'] as String?) ?? '',
      source: (json['source'] as String?) ?? '',
      to: (json['to'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final from = this.from;
    final source = this.source;
    final to = this.to;
    return {
      'from': from,
      'source': source,
      'to': to,
    };
  }
}

/// This object defines one log field that will be split with the <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-splitString">
/// splitString</a> processor.
class SplitStringEntry {
  /// The separator characters to split the string entry on.
  final String delimiter;

  /// The key of the field to split.
  final String source;

  SplitStringEntry({
    required this.delimiter,
    required this.source,
  });

  factory SplitStringEntry.fromJson(Map<String, dynamic> json) {
    return SplitStringEntry(
      delimiter: (json['delimiter'] as String?) ?? '',
      source: (json['source'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final delimiter = this.delimiter;
    final source = this.source;
    return {
      'delimiter': delimiter,
      'source': source,
    };
  }
}

/// This object defines one key that will be renamed with the <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-renameKey">
/// renameKey</a> processor.
class RenameKeyEntry {
  /// The key to rename
  final String key;

  /// The string to use for the new key name
  final String renameTo;

  /// Specifies whether to overwrite the existing value if the destination key
  /// already exists. The default is <code>false</code>
  final bool? overwriteIfExists;

  RenameKeyEntry({
    required this.key,
    required this.renameTo,
    this.overwriteIfExists,
  });

  factory RenameKeyEntry.fromJson(Map<String, dynamic> json) {
    return RenameKeyEntry(
      key: (json['key'] as String?) ?? '',
      renameTo: (json['renameTo'] as String?) ?? '',
      overwriteIfExists: json['overwriteIfExists'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final renameTo = this.renameTo;
    final overwriteIfExists = this.overwriteIfExists;
    return {
      'key': key,
      'renameTo': renameTo,
      if (overwriteIfExists != null) 'overwriteIfExists': overwriteIfExists,
    };
  }
}

class EventSource {
  static const cloudTrail = EventSource._('CloudTrail');
  static const route53Resolver = EventSource._('Route53Resolver');
  static const vPCFlow = EventSource._('VPCFlow');
  static const eKSAudit = EventSource._('EKSAudit');
  static const awswaf = EventSource._('AWSWAF');

  final String value;

  const EventSource._(this.value);

  static const values = [
    cloudTrail,
    route53Resolver,
    vPCFlow,
    eKSAudit,
    awswaf
  ];

  static EventSource fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => EventSource._(value));

  @override
  bool operator ==(other) => other is EventSource && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class OCSFVersion {
  static const v1_1 = OCSFVersion._('V1.1');
  static const v1_5 = OCSFVersion._('V1.5');

  final String value;

  const OCSFVersion._(this.value);

  static const values = [v1_1, v1_5];

  static OCSFVersion fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => OCSFVersion._(value));

  @override
  bool operator ==(other) => other is OCSFVersion && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// This object defines one key that will be moved with the <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-moveKey">
/// moveKey</a> processor.
class MoveKeyEntry {
  /// The key to move.
  final String source;

  /// The key to move to.
  final String target;

  /// Specifies whether to overwrite the value if the destination key already
  /// exists. If you omit this, the default is <code>false</code>.
  final bool? overwriteIfExists;

  MoveKeyEntry({
    required this.source,
    required this.target,
    this.overwriteIfExists,
  });

  factory MoveKeyEntry.fromJson(Map<String, dynamic> json) {
    return MoveKeyEntry(
      source: (json['source'] as String?) ?? '',
      target: (json['target'] as String?) ?? '',
      overwriteIfExists: json['overwriteIfExists'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final source = this.source;
    final target = this.target;
    final overwriteIfExists = this.overwriteIfExists;
    return {
      'source': source,
      'target': target,
      if (overwriteIfExists != null) 'overwriteIfExists': overwriteIfExists,
    };
  }
}

class FlattenedElement {
  static const first = FlattenedElement._('first');
  static const last = FlattenedElement._('last');

  final String value;

  const FlattenedElement._(this.value);

  static const values = [first, last];

  static FlattenedElement fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => FlattenedElement._(value));

  @override
  bool operator ==(other) => other is FlattenedElement && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// This object defines one value to be copied with the <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-copoyValue">
/// copyValue</a> processor.
class CopyValueEntry {
  /// The key to copy.
  final String source;

  /// The key of the field to copy the value to.
  final String target;

  /// Specifies whether to overwrite the value if the destination key already
  /// exists. If you omit this, the default is <code>false</code>.
  final bool? overwriteIfExists;

  CopyValueEntry({
    required this.source,
    required this.target,
    this.overwriteIfExists,
  });

  factory CopyValueEntry.fromJson(Map<String, dynamic> json) {
    return CopyValueEntry(
      source: (json['source'] as String?) ?? '',
      target: (json['target'] as String?) ?? '',
      overwriteIfExists: json['overwriteIfExists'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final source = this.source;
    final target = this.target;
    final overwriteIfExists = this.overwriteIfExists;
    return {
      'source': source,
      'target': target,
      if (overwriteIfExists != null) 'overwriteIfExists': overwriteIfExists,
    };
  }
}

/// This object defines one key that will be added with the <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html#CloudWatch-Logs-Transformation-addKey">
/// addKeys</a> processor.
class AddKeyEntry {
  /// The key of the new entry to be added to the log event
  final String key;

  /// The value of the new entry to be added to the log event
  final String value;

  /// Specifies whether to overwrite the value if the key already exists in the
  /// log event. If you omit this, the default is <code>false</code>.
  final bool? overwriteIfExists;

  AddKeyEntry({
    required this.key,
    required this.value,
    this.overwriteIfExists,
  });

  factory AddKeyEntry.fromJson(Map<String, dynamic> json) {
    return AddKeyEntry(
      key: (json['key'] as String?) ?? '',
      value: (json['value'] as String?) ?? '',
      overwriteIfExists: json['overwriteIfExists'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    final overwriteIfExists = this.overwriteIfExists;
    return {
      'key': key,
      'value': value,
      if (overwriteIfExists != null) 'overwriteIfExists': overwriteIfExists,
    };
  }
}

/// Represents a matched event.
class MetricFilterMatchRecord {
  /// The raw event data.
  final String? eventMessage;

  /// The event number.
  final int? eventNumber;

  /// The values extracted from the event data by the filter.
  final Map<String, String>? extractedValues;

  MetricFilterMatchRecord({
    this.eventMessage,
    this.eventNumber,
    this.extractedValues,
  });

  factory MetricFilterMatchRecord.fromJson(Map<String, dynamic> json) {
    return MetricFilterMatchRecord(
      eventMessage: json['eventMessage'] as String?,
      eventNumber: json['eventNumber'] as int?,
      extractedValues: (json['extractedValues'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final eventMessage = this.eventMessage;
    final eventNumber = this.eventNumber;
    final extractedValues = this.extractedValues;
    return {
      if (eventMessage != null) 'eventMessage': eventMessage,
      if (eventNumber != null) 'eventNumber': eventNumber,
      if (extractedValues != null) 'extractedValues': extractedValues,
    };
  }
}

/// This object includes the stream returned by your <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_StartLiveTail.html">StartLiveTail</a>
/// request.
class StartLiveTailResponseStream {
  /// This exception is returned if an unknown error occurs.
  final SessionStreamingException? sessionStreamingException;

  /// This exception is returned in the stream when the Live Tail session times
  /// out. Live Tail sessions time out after three hours.
  final SessionTimeoutException? sessionTimeoutException;

  /// This object contains information about this Live Tail session, including the
  /// log groups included and the log stream filters, if any.
  final LiveTailSessionStart? sessionStart;

  /// This object contains the log events and session metadata.
  final LiveTailSessionUpdate? sessionUpdate;

  StartLiveTailResponseStream({
    this.sessionStreamingException,
    this.sessionTimeoutException,
    this.sessionStart,
    this.sessionUpdate,
  });

  factory StartLiveTailResponseStream.fromJson(Map<String, dynamic> json) {
    return StartLiveTailResponseStream(
      sessionStreamingException: json['SessionStreamingException'] != null
          ? SessionStreamingException.fromJson(
              json['SessionStreamingException'] as Map<String, dynamic>)
          : null,
      sessionTimeoutException: json['SessionTimeoutException'] != null
          ? SessionTimeoutException.fromJson(
              json['SessionTimeoutException'] as Map<String, dynamic>)
          : null,
      sessionStart: json['sessionStart'] != null
          ? LiveTailSessionStart.fromJson(
              json['sessionStart'] as Map<String, dynamic>)
          : null,
      sessionUpdate: json['sessionUpdate'] != null
          ? LiveTailSessionUpdate.fromJson(
              json['sessionUpdate'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final sessionStreamingException = this.sessionStreamingException;
    final sessionTimeoutException = this.sessionTimeoutException;
    final sessionStart = this.sessionStart;
    final sessionUpdate = this.sessionUpdate;
    return {
      if (sessionStreamingException != null)
        'SessionStreamingException': sessionStreamingException,
      if (sessionTimeoutException != null)
        'SessionTimeoutException': sessionTimeoutException,
      if (sessionStart != null) 'sessionStart': sessionStart,
      if (sessionUpdate != null) 'sessionUpdate': sessionUpdate,
    };
  }
}

/// This object contains information about this Live Tail session, including the
/// log groups included and the log stream filters, if any.
class LiveTailSessionStart {
  /// An optional pattern to filter the results to include only log events that
  /// match the pattern. For example, a filter pattern of <code>error 404</code>
  /// displays only log events that include both <code>error</code> and
  /// <code>404</code>.
  ///
  /// For more information about filter pattern syntax, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/FilterAndPatternSyntax.html">Filter
  /// and Pattern Syntax</a>.
  final String? logEventFilterPattern;

  /// An array of the names and ARNs of the log groups included in this Live Tail
  /// session.
  final List<String>? logGroupIdentifiers;

  /// If your StartLiveTail operation request included a
  /// <code>logStreamNamePrefixes</code> parameter that filtered the session to
  /// only include log streams that have names that start with certain prefixes,
  /// these prefixes are listed here.
  final List<String>? logStreamNamePrefixes;

  /// If your StartLiveTail operation request included a
  /// <code>logStreamNames</code> parameter that filtered the session to only
  /// include certain log streams, these streams are listed here.
  final List<String>? logStreamNames;

  /// The unique ID generated by CloudWatch Logs to identify this Live Tail
  /// session request.
  final String? requestId;

  /// The unique ID generated by CloudWatch Logs to identify this Live Tail
  /// session.
  final String? sessionId;

  LiveTailSessionStart({
    this.logEventFilterPattern,
    this.logGroupIdentifiers,
    this.logStreamNamePrefixes,
    this.logStreamNames,
    this.requestId,
    this.sessionId,
  });

  factory LiveTailSessionStart.fromJson(Map<String, dynamic> json) {
    return LiveTailSessionStart(
      logEventFilterPattern: json['logEventFilterPattern'] as String?,
      logGroupIdentifiers: (json['logGroupIdentifiers'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      logStreamNamePrefixes: (json['logStreamNamePrefixes'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      logStreamNames: (json['logStreamNames'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      requestId: json['requestId'] as String?,
      sessionId: json['sessionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final logEventFilterPattern = this.logEventFilterPattern;
    final logGroupIdentifiers = this.logGroupIdentifiers;
    final logStreamNamePrefixes = this.logStreamNamePrefixes;
    final logStreamNames = this.logStreamNames;
    final requestId = this.requestId;
    final sessionId = this.sessionId;
    return {
      if (logEventFilterPattern != null)
        'logEventFilterPattern': logEventFilterPattern,
      if (logGroupIdentifiers != null)
        'logGroupIdentifiers': logGroupIdentifiers,
      if (logStreamNamePrefixes != null)
        'logStreamNamePrefixes': logStreamNamePrefixes,
      if (logStreamNames != null) 'logStreamNames': logStreamNames,
      if (requestId != null) 'requestId': requestId,
      if (sessionId != null) 'sessionId': sessionId,
    };
  }
}

/// This object contains the log events and metadata for a Live Tail session.
class LiveTailSessionUpdate {
  /// This object contains the session metadata for a Live Tail session.
  final LiveTailSessionMetadata? sessionMetadata;

  /// An array, where each member of the array includes the information for one
  /// log event in the Live Tail session.
  ///
  /// A <code>sessionResults</code> array can include as many as 500 log events.
  /// If the number of log events matching the request exceeds 500 per second, the
  /// log events are sampled down to 500 log events to be included in each
  /// <code>sessionUpdate</code> structure.
  final List<LiveTailSessionLogEvent>? sessionResults;

  LiveTailSessionUpdate({
    this.sessionMetadata,
    this.sessionResults,
  });

  factory LiveTailSessionUpdate.fromJson(Map<String, dynamic> json) {
    return LiveTailSessionUpdate(
      sessionMetadata: json['sessionMetadata'] != null
          ? LiveTailSessionMetadata.fromJson(
              json['sessionMetadata'] as Map<String, dynamic>)
          : null,
      sessionResults: (json['sessionResults'] as List?)
          ?.nonNulls
          .map((e) =>
              LiveTailSessionLogEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final sessionMetadata = this.sessionMetadata;
    final sessionResults = this.sessionResults;
    return {
      if (sessionMetadata != null) 'sessionMetadata': sessionMetadata,
      if (sessionResults != null) 'sessionResults': sessionResults,
    };
  }
}

/// This exception is returned in a Live Tail stream when the Live Tail session
/// times out. Live Tail sessions time out after three hours.
class SessionTimeoutException implements _s.AwsException {
  final String? message;

  SessionTimeoutException({
    this.message,
  });

  factory SessionTimeoutException.fromJson(Map<String, dynamic> json) {
    return SessionTimeoutException(
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'message': message,
    };
  }
}

/// This exception is returned if an unknown error occurs during a Live Tail
/// session.
class SessionStreamingException implements _s.AwsException {
  final String? message;

  SessionStreamingException({
    this.message,
  });

  factory SessionStreamingException.fromJson(Map<String, dynamic> json) {
    return SessionStreamingException(
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'message': message,
    };
  }
}

/// This object contains the metadata for one <code>LiveTailSessionUpdate</code>
/// structure. It indicates whether that update includes only a sample of 500
/// log events out of a larger number of ingested log events, or if it contains
/// all of the matching log events ingested during that second of time.
class LiveTailSessionMetadata {
  /// If this is <code>true</code>, then more than 500 log events matched the
  /// request for this update, and the <code>sessionResults</code> includes a
  /// sample of 500 of those events.
  ///
  /// If this is <code>false</code>, then 500 or fewer log events matched the
  /// request for this update, so no sampling was necessary. In this case, the
  /// <code>sessionResults</code> array includes all log events that matched your
  /// request during this time.
  final bool? sampled;

  LiveTailSessionMetadata({
    this.sampled,
  });

  factory LiveTailSessionMetadata.fromJson(Map<String, dynamic> json) {
    return LiveTailSessionMetadata(
      sampled: json['sampled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final sampled = this.sampled;
    return {
      if (sampled != null) 'sampled': sampled,
    };
  }
}

/// This object contains the information for one log event returned in a Live
/// Tail stream.
class LiveTailSessionLogEvent {
  /// The timestamp specifying when this log event was ingested into the log
  /// group.
  final int? ingestionTime;

  /// The name or ARN of the log group that ingested this log event.
  final String? logGroupIdentifier;

  /// The name of the log stream that ingested this log event.
  final String? logStreamName;

  /// The log event message text.
  final String? message;

  /// The timestamp specifying when this log event was created.
  final int? timestamp;

  LiveTailSessionLogEvent({
    this.ingestionTime,
    this.logGroupIdentifier,
    this.logStreamName,
    this.message,
    this.timestamp,
  });

  factory LiveTailSessionLogEvent.fromJson(Map<String, dynamic> json) {
    return LiveTailSessionLogEvent(
      ingestionTime: json['ingestionTime'] as int?,
      logGroupIdentifier: json['logGroupIdentifier'] as String?,
      logStreamName: json['logStreamName'] as String?,
      message: json['message'] as String?,
      timestamp: json['timestamp'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final ingestionTime = this.ingestionTime;
    final logGroupIdentifier = this.logGroupIdentifier;
    final logStreamName = this.logStreamName;
    final message = this.message;
    final timestamp = this.timestamp;
    return {
      if (ingestionTime != null) 'ingestionTime': ingestionTime,
      if (logGroupIdentifier != null) 'logGroupIdentifier': logGroupIdentifier,
      if (logStreamName != null) 'logStreamName': logStreamName,
      if (message != null) 'message': message,
      if (timestamp != null) 'timestamp': timestamp,
    };
  }
}

/// The method used to distribute log data to the destination, which can be
/// either random or grouped by log stream.
class Distribution {
  static const random = Distribution._('Random');
  static const byLogStream = Distribution._('ByLogStream');

  final String value;

  const Distribution._(this.value);

  static const values = [random, byLogStream];

  static Distribution fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => Distribution._(value));

  @override
  bool operator ==(other) => other is Distribution && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A policy enabling one or more entities to put logs to a log group in this
/// account.
class ResourcePolicy {
  /// Timestamp showing when this policy was last updated, expressed as the number
  /// of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>.
  final int? lastUpdatedTime;

  /// The details of the policy.
  final String? policyDocument;

  /// The name of the resource policy.
  final String? policyName;

  /// Specifies scope of the resource policy. Valid values are ACCOUNT or
  /// RESOURCE.
  final PolicyScope? policyScope;

  /// The ARN of the CloudWatch Logs resource to which the resource policy is
  /// attached. Only populated for resource-scoped policies.
  final String? resourceArn;

  /// The revision ID of the resource policy. Only populated for resource-scoped
  /// policies.
  final String? revisionId;

  ResourcePolicy({
    this.lastUpdatedTime,
    this.policyDocument,
    this.policyName,
    this.policyScope,
    this.resourceArn,
    this.revisionId,
  });

  factory ResourcePolicy.fromJson(Map<String, dynamic> json) {
    return ResourcePolicy(
      lastUpdatedTime: json['lastUpdatedTime'] as int?,
      policyDocument: json['policyDocument'] as String?,
      policyName: json['policyName'] as String?,
      policyScope:
          (json['policyScope'] as String?)?.let(PolicyScope.fromString),
      resourceArn: json['resourceArn'] as String?,
      revisionId: json['revisionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lastUpdatedTime = this.lastUpdatedTime;
    final policyDocument = this.policyDocument;
    final policyName = this.policyName;
    final policyScope = this.policyScope;
    final resourceArn = this.resourceArn;
    final revisionId = this.revisionId;
    return {
      if (lastUpdatedTime != null) 'lastUpdatedTime': lastUpdatedTime,
      if (policyDocument != null) 'policyDocument': policyDocument,
      if (policyName != null) 'policyName': policyName,
      if (policyScope != null) 'policyScope': policyScope.value,
      if (resourceArn != null) 'resourceArn': resourceArn,
      if (revisionId != null) 'revisionId': revisionId,
    };
  }
}

class PolicyScope {
  static const account = PolicyScope._('ACCOUNT');
  static const resource = PolicyScope._('RESOURCE');

  final String value;

  const PolicyScope._(this.value);

  static const values = [account, resource];

  static PolicyScope fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => PolicyScope._(value));

  @override
  bool operator ==(other) => other is PolicyScope && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// This structure defines a query parameter for a saved CloudWatch Logs
/// Insights query definition. Query parameters are supported only for Logs
/// Insights QL queries. They are placeholder variables that you can reference
/// in a query string using the <code>{{parameterName}}</code> syntax. Each
/// parameter can include a default value and a description.
class QueryParameter {
  /// The name of the query parameter. A query parameter name must start with a
  /// letter or underscore, and contain only letters, digits, and underscores.
  final String name;

  /// The default value to use for this query parameter if no value is supplied at
  /// execution time.
  final String? defaultValue;

  /// A description of the query parameter that explains its purpose or expected
  /// values.
  final String? description;

  QueryParameter({
    required this.name,
    this.defaultValue,
    this.description,
  });

  factory QueryParameter.fromJson(Map<String, dynamic> json) {
    return QueryParameter(
      name: (json['name'] as String?) ?? '',
      defaultValue: json['defaultValue'] as String?,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final defaultValue = this.defaultValue;
    final description = this.description;
    return {
      'name': name,
      if (defaultValue != null) 'defaultValue': defaultValue,
      if (description != null) 'description': description,
    };
  }
}

/// Indicates how to transform ingested log events to metric data in a
/// CloudWatch metric.
class MetricTransformation {
  /// The name of the CloudWatch metric.
  final String metricName;

  /// A custom namespace to contain your metric in CloudWatch. Use namespaces to
  /// group together metrics that are similar. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch_concepts.html#Namespace">Namespaces</a>.
  final String metricNamespace;

  /// The value to publish to the CloudWatch metric when a filter pattern matches
  /// a log event.
  final String metricValue;

  /// (Optional) The value to emit when a filter pattern does not match a log
  /// event. This value can be null.
  final double? defaultValue;

  /// The fields to use as dimensions for the metric. One metric filter can
  /// include as many as three dimensions.
  /// <important>
  /// Metrics extracted from log events are charged as custom metrics. To prevent
  /// unexpected high charges, do not specify high-cardinality fields such as
  /// <code>IPAddress</code> or <code>requestID</code> as dimensions. Each
  /// different value found for a dimension is treated as a separate metric and
  /// accrues charges as a separate custom metric.
  ///
  /// CloudWatch Logs disables a metric filter if it generates 1000 different
  /// name/value pairs for your specified dimensions within a certain amount of
  /// time. This helps to prevent accidental high charges.
  ///
  /// You can also set up a billing alarm to alert you if your charges are higher
  /// than expected. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/monitor_estimated_charges_with_cloudwatch.html">
  /// Creating a Billing Alarm to Monitor Your Estimated Amazon Web Services
  /// Charges</a>.
  /// </important>
  final Map<String, String>? dimensions;

  /// The unit to assign to the metric. If you omit this, the unit is set as
  /// <code>None</code>.
  final StandardUnit? unit;

  MetricTransformation({
    required this.metricName,
    required this.metricNamespace,
    required this.metricValue,
    this.defaultValue,
    this.dimensions,
    this.unit,
  });

  factory MetricTransformation.fromJson(Map<String, dynamic> json) {
    return MetricTransformation(
      metricName: (json['metricName'] as String?) ?? '',
      metricNamespace: (json['metricNamespace'] as String?) ?? '',
      metricValue: (json['metricValue'] as String?) ?? '',
      defaultValue: json['defaultValue'] as double?,
      dimensions: (json['dimensions'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      unit: (json['unit'] as String?)?.let(StandardUnit.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final metricName = this.metricName;
    final metricNamespace = this.metricNamespace;
    final metricValue = this.metricValue;
    final defaultValue = this.defaultValue;
    final dimensions = this.dimensions;
    final unit = this.unit;
    return {
      'metricName': metricName,
      'metricNamespace': metricNamespace,
      'metricValue': metricValue,
      if (defaultValue != null) 'defaultValue': defaultValue,
      if (dimensions != null) 'dimensions': dimensions,
      if (unit != null) 'unit': unit.value,
    };
  }
}

class StandardUnit {
  static const seconds = StandardUnit._('Seconds');
  static const microseconds = StandardUnit._('Microseconds');
  static const milliseconds = StandardUnit._('Milliseconds');
  static const bytes = StandardUnit._('Bytes');
  static const kilobytes = StandardUnit._('Kilobytes');
  static const megabytes = StandardUnit._('Megabytes');
  static const gigabytes = StandardUnit._('Gigabytes');
  static const terabytes = StandardUnit._('Terabytes');
  static const bits = StandardUnit._('Bits');
  static const kilobits = StandardUnit._('Kilobits');
  static const megabits = StandardUnit._('Megabits');
  static const gigabits = StandardUnit._('Gigabits');
  static const terabits = StandardUnit._('Terabits');
  static const percent = StandardUnit._('Percent');
  static const count = StandardUnit._('Count');
  static const bytesSecond = StandardUnit._('Bytes/Second');
  static const kilobytesSecond = StandardUnit._('Kilobytes/Second');
  static const megabytesSecond = StandardUnit._('Megabytes/Second');
  static const gigabytesSecond = StandardUnit._('Gigabytes/Second');
  static const terabytesSecond = StandardUnit._('Terabytes/Second');
  static const bitsSecond = StandardUnit._('Bits/Second');
  static const kilobitsSecond = StandardUnit._('Kilobits/Second');
  static const megabitsSecond = StandardUnit._('Megabits/Second');
  static const gigabitsSecond = StandardUnit._('Gigabits/Second');
  static const terabitsSecond = StandardUnit._('Terabits/Second');
  static const countSecond = StandardUnit._('Count/Second');
  static const none = StandardUnit._('None');

  final String value;

  const StandardUnit._(this.value);

  static const values = [
    seconds,
    microseconds,
    milliseconds,
    bytes,
    kilobytes,
    megabytes,
    gigabytes,
    terabytes,
    bits,
    kilobits,
    megabits,
    gigabits,
    terabits,
    percent,
    count,
    bytesSecond,
    kilobytesSecond,
    megabytesSecond,
    gigabytesSecond,
    terabytesSecond,
    bitsSecond,
    kilobitsSecond,
    megabitsSecond,
    gigabitsSecond,
    terabitsSecond,
    countSecond,
    none
  ];

  static StandardUnit fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => StandardUnit._(value));

  @override
  bool operator ==(other) => other is StandardUnit && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents the rejected events.
class RejectedLogEventsInfo {
  /// The expired log events.
  final int? expiredLogEventEndIndex;

  /// The index of the first log event that is too new. This field is inclusive.
  final int? tooNewLogEventStartIndex;

  /// The index of the last log event that is too old. This field is exclusive.
  final int? tooOldLogEventEndIndex;

  RejectedLogEventsInfo({
    this.expiredLogEventEndIndex,
    this.tooNewLogEventStartIndex,
    this.tooOldLogEventEndIndex,
  });

  factory RejectedLogEventsInfo.fromJson(Map<String, dynamic> json) {
    return RejectedLogEventsInfo(
      expiredLogEventEndIndex: json['expiredLogEventEndIndex'] as int?,
      tooNewLogEventStartIndex: json['tooNewLogEventStartIndex'] as int?,
      tooOldLogEventEndIndex: json['tooOldLogEventEndIndex'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final expiredLogEventEndIndex = this.expiredLogEventEndIndex;
    final tooNewLogEventStartIndex = this.tooNewLogEventStartIndex;
    final tooOldLogEventEndIndex = this.tooOldLogEventEndIndex;
    return {
      if (expiredLogEventEndIndex != null)
        'expiredLogEventEndIndex': expiredLogEventEndIndex,
      if (tooNewLogEventStartIndex != null)
        'tooNewLogEventStartIndex': tooNewLogEventStartIndex,
      if (tooOldLogEventEndIndex != null)
        'tooOldLogEventEndIndex': tooOldLogEventEndIndex,
    };
  }
}

/// If an entity is rejected when a <code>PutLogEvents</code> request was made,
/// this includes details about the reason for the rejection.
class RejectedEntityInfo {
  /// The type of error that caused the rejection of the entity when calling
  /// <code>PutLogEvents</code>.
  final EntityRejectionErrorType errorType;

  RejectedEntityInfo({
    required this.errorType,
  });

  factory RejectedEntityInfo.fromJson(Map<String, dynamic> json) {
    return RejectedEntityInfo(
      errorType: EntityRejectionErrorType.fromString(
          (json['errorType'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final errorType = this.errorType;
    return {
      'errorType': errorType.value,
    };
  }
}

class EntityRejectionErrorType {
  static const invalidEntity = EntityRejectionErrorType._('InvalidEntity');
  static const invalidTypeValue =
      EntityRejectionErrorType._('InvalidTypeValue');
  static const invalidKeyAttributes =
      EntityRejectionErrorType._('InvalidKeyAttributes');
  static const invalidAttributes =
      EntityRejectionErrorType._('InvalidAttributes');
  static const entitySizeTooLarge =
      EntityRejectionErrorType._('EntitySizeTooLarge');
  static const unsupportedLogGroupType =
      EntityRejectionErrorType._('UnsupportedLogGroupType');
  static const missingRequiredFields =
      EntityRejectionErrorType._('MissingRequiredFields');

  final String value;

  const EntityRejectionErrorType._(this.value);

  static const values = [
    invalidEntity,
    invalidTypeValue,
    invalidKeyAttributes,
    invalidAttributes,
    entitySizeTooLarge,
    unsupportedLogGroupType,
    missingRequiredFields
  ];

  static EntityRejectionErrorType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EntityRejectionErrorType._(value));

  @override
  bool operator ==(other) =>
      other is EntityRejectionErrorType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The entity associated with the log events in a <code>PutLogEvents</code>
/// call.
class Entity {
  /// Additional attributes of the entity that are not used to specify the
  /// identity of the entity. A list of key-value pairs.
  ///
  /// For details about how to use the attributes, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/adding-your-own-related-telemetry.html">How
  /// to add related information to telemetry</a> in the <i>CloudWatch User
  /// Guide</i>.
  final Map<String, String>? attributes;

  /// The attributes of the entity which identify the specific entity, as a list
  /// of key-value pairs. Entities with the same <code>keyAttributes</code> are
  /// considered to be the same entity.
  ///
  /// There are five allowed attributes (key names): <code>Type</code>,
  /// <code>ResourceType</code>, <code>Identifier</code> <code>Name</code>, and
  /// <code>Environment</code>.
  ///
  /// For details about how to use the key attributes, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/adding-your-own-related-telemetry.html">How
  /// to add related information to telemetry</a> in the <i>CloudWatch User
  /// Guide</i>.
  final Map<String, String>? keyAttributes;

  Entity({
    this.attributes,
    this.keyAttributes,
  });

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    final keyAttributes = this.keyAttributes;
    return {
      if (attributes != null) 'attributes': attributes,
      if (keyAttributes != null) 'keyAttributes': keyAttributes,
    };
  }
}

/// Represents a log event, which is a record of activity that was recorded by
/// the application or resource being monitored.
class InputLogEvent {
  /// The raw event message. Each log event can be no larger than 1 MB.
  final String message;

  /// The time the event occurred, expressed as the number of milliseconds after
  /// <code>Jan 1, 1970 00:00:00 UTC</code>.
  final int timestamp;

  InputLogEvent({
    required this.message,
    required this.timestamp,
  });

  Map<String, dynamic> toJson() {
    final message = this.message;
    final timestamp = this.timestamp;
    return {
      'message': message,
      'timestamp': timestamp,
    };
  }
}

class IntegrationStatus {
  static const provisioning = IntegrationStatus._('PROVISIONING');
  static const active = IntegrationStatus._('ACTIVE');
  static const failed = IntegrationStatus._('FAILED');

  final String value;

  const IntegrationStatus._(this.value);

  static const values = [provisioning, active, failed];

  static IntegrationStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => IntegrationStatus._(value));

  @override
  bool operator ==(other) => other is IntegrationStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// This structure contains configuration details about an integration between
/// CloudWatch Logs and another entity.
class ResourceConfig {
  /// This structure contains configuration details about an integration between
  /// CloudWatch Logs and OpenSearch Service.
  final OpenSearchResourceConfig? openSearchResourceConfig;

  ResourceConfig({
    this.openSearchResourceConfig,
  });

  Map<String, dynamic> toJson() {
    final openSearchResourceConfig = this.openSearchResourceConfig;
    return {
      if (openSearchResourceConfig != null)
        'openSearchResourceConfig': openSearchResourceConfig,
    };
  }
}

class IntegrationType {
  static const opensearch = IntegrationType._('OPENSEARCH');

  final String value;

  const IntegrationType._(this.value);

  static const values = [opensearch];

  static IntegrationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => IntegrationType._(value));

  @override
  bool operator ==(other) => other is IntegrationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// This structure contains configuration details about an integration between
/// CloudWatch Logs and OpenSearch Service.
class OpenSearchResourceConfig {
  /// Specify the ARNs of IAM roles and IAM users who you want to grant permission
  /// to for viewing the dashboards.
  /// <important>
  /// In addition to specifying these users here, you must also grant them the
  /// <b>CloudWatchOpenSearchDashboardAccess</b> IAM policy. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/OpenSearch-Dashboards-UserRoles.html">IAM
  /// policies for users</a>.
  /// </important>
  final List<String> dashboardViewerPrincipals;

  /// Specify the ARN of an IAM role that CloudWatch Logs will use to create the
  /// integration. This role must have the permissions necessary to access the
  /// OpenSearch Service collection to be able to create the dashboards. For more
  /// information about the permissions needed, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/OpenSearch-Dashboards-CreateRole.html">Permissions
  /// that the integration needs</a> in the CloudWatch Logs User Guide.
  final String dataSourceRoleArn;

  /// Specify how many days that you want the data derived by OpenSearch Service
  /// to be retained in the index that the dashboard refers to. This also sets the
  /// maximum time period that you can choose when viewing data in the dashboard.
  /// Choosing a longer time frame will incur additional costs.
  final int retentionDays;

  /// If you want to use an existing OpenSearch Service application for your
  /// integration with OpenSearch Service, specify it here. If you omit this, a
  /// new application will be created.
  final String? applicationArn;

  /// To have the vended dashboard data encrypted with KMS instead of the
  /// CloudWatch Logs default encryption method, specify the ARN of the KMS key
  /// that you want to use.
  final String? kmsKeyArn;

  OpenSearchResourceConfig({
    required this.dashboardViewerPrincipals,
    required this.dataSourceRoleArn,
    required this.retentionDays,
    this.applicationArn,
    this.kmsKeyArn,
  });

  Map<String, dynamic> toJson() {
    final dashboardViewerPrincipals = this.dashboardViewerPrincipals;
    final dataSourceRoleArn = this.dataSourceRoleArn;
    final retentionDays = this.retentionDays;
    final applicationArn = this.applicationArn;
    final kmsKeyArn = this.kmsKeyArn;
    return {
      'dashboardViewerPrincipals': dashboardViewerPrincipals,
      'dataSourceRoleArn': dataSourceRoleArn,
      'retentionDays': retentionDays,
      if (applicationArn != null) 'applicationArn': applicationArn,
      if (kmsKeyArn != null) 'kmsKeyArn': kmsKeyArn,
    };
  }
}

/// This structure contains information about one field index policy in this
/// account.
class IndexPolicy {
  /// The date and time that this index policy was most recently updated.
  final int? lastUpdateTime;

  /// The ARN of the log group that this index policy applies to.
  final String? logGroupIdentifier;

  /// The policy document for this index policy, in JSON format.
  final String? policyDocument;

  /// The name of this policy. Responses about log group-level field index
  /// policies don't have this field, because those policies don't have names.
  final String? policyName;

  /// This field indicates whether this is an account-level index policy or an
  /// index policy that applies only to a single log group.
  final IndexSource? source;

  IndexPolicy({
    this.lastUpdateTime,
    this.logGroupIdentifier,
    this.policyDocument,
    this.policyName,
    this.source,
  });

  factory IndexPolicy.fromJson(Map<String, dynamic> json) {
    return IndexPolicy(
      lastUpdateTime: json['lastUpdateTime'] as int?,
      logGroupIdentifier: json['logGroupIdentifier'] as String?,
      policyDocument: json['policyDocument'] as String?,
      policyName: json['policyName'] as String?,
      source: (json['source'] as String?)?.let(IndexSource.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final lastUpdateTime = this.lastUpdateTime;
    final logGroupIdentifier = this.logGroupIdentifier;
    final policyDocument = this.policyDocument;
    final policyName = this.policyName;
    final source = this.source;
    return {
      if (lastUpdateTime != null) 'lastUpdateTime': lastUpdateTime,
      if (logGroupIdentifier != null) 'logGroupIdentifier': logGroupIdentifier,
      if (policyDocument != null) 'policyDocument': policyDocument,
      if (policyName != null) 'policyName': policyName,
      if (source != null) 'source': source.value,
    };
  }
}

class IndexSource {
  static const account = IndexSource._('ACCOUNT');
  static const logGroup = IndexSource._('LOG_GROUP');

  final String value;

  const IndexSource._(this.value);

  static const values = [account, logGroup];

  static IndexSource fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => IndexSource._(value));

  @override
  bool operator ==(other) => other is IndexSource && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents a cross-account destination that receives subscription log
/// events.
class Destination {
  /// An IAM policy document that governs which Amazon Web Services accounts can
  /// create subscription filters against this destination.
  final String? accessPolicy;

  /// The ARN of this destination.
  final String? arn;

  /// The creation time of the destination, expressed as the number of
  /// milliseconds after Jan 1, 1970 00:00:00 UTC.
  final int? creationTime;

  /// The name of the destination.
  final String? destinationName;

  /// A role for impersonation, used when delivering log events to the target.
  final String? roleArn;

  /// The Amazon Resource Name (ARN) of the physical target where the log events
  /// are delivered (for example, a Kinesis stream).
  final String? targetArn;

  Destination({
    this.accessPolicy,
    this.arn,
    this.creationTime,
    this.destinationName,
    this.roleArn,
    this.targetArn,
  });

  factory Destination.fromJson(Map<String, dynamic> json) {
    return Destination(
      accessPolicy: json['accessPolicy'] as String?,
      arn: json['arn'] as String?,
      creationTime: json['creationTime'] as int?,
      destinationName: json['destinationName'] as String?,
      roleArn: json['roleArn'] as String?,
      targetArn: json['targetArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accessPolicy = this.accessPolicy;
    final arn = this.arn;
    final creationTime = this.creationTime;
    final destinationName = this.destinationName;
    final roleArn = this.roleArn;
    final targetArn = this.targetArn;
    return {
      if (accessPolicy != null) 'accessPolicy': accessPolicy,
      if (arn != null) 'arn': arn,
      if (creationTime != null) 'creationTime': creationTime,
      if (destinationName != null) 'destinationName': destinationName,
      if (roleArn != null) 'roleArn': roleArn,
      if (targetArn != null) 'targetArn': targetArn,
    };
  }
}

/// This structure contains information about one <i>delivery source</i> in your
/// account. A delivery source is an Amazon Web Services resource that sends
/// logs to an Amazon Web Services destination. The destination can be
/// CloudWatch Logs, Amazon S3, or Firehose.
///
/// Only some Amazon Web Services services support being configured as a
/// delivery source. These services are listed as <b>Supported [V2
/// Permissions]</b> in the table at <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AWS-logs-and-resource-policy.html">Enabling
/// logging from Amazon Web Services services.</a>
///
/// To configure logs delivery between a supported Amazon Web Services service
/// and a destination, you must do the following:
///
/// <ul>
/// <li>
/// Create a delivery source, which is a logical object that represents the
/// resource that is actually sending the logs. For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliverySource.html">PutDeliverySource</a>.
/// </li>
/// <li>
/// Create a <i>delivery destination</i>, which is a logical object that
/// represents the actual delivery destination. For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestination.html">PutDeliveryDestination</a>.
/// </li>
/// <li>
/// If you are delivering logs cross-account, you must use <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestinationPolicy.html">PutDeliveryDestinationPolicy</a>
/// in the destination account to assign an IAM policy to the destination. This
/// policy allows delivery to that destination.
/// </li>
/// <li>
/// Create a <i>delivery</i> by pairing exactly one delivery source and one
/// delivery destination. For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_CreateDelivery.html">CreateDelivery</a>.
/// </li>
/// </ul>
/// You can configure a single delivery source to send logs to multiple
/// destinations by creating multiple deliveries. You can also create multiple
/// deliveries to configure multiple delivery sources to send logs to the same
/// delivery destination.
class DeliverySource {
  /// The Amazon Resource Name (ARN) that uniquely identifies this delivery
  /// source.
  final String? arn;

  /// The map of key-value pairs that configure the delivery source.
  final Map<String, String>? deliverySourceConfiguration;

  /// The type of log that the source is sending. For valid values for this
  /// parameter, see the documentation for the source service.
  final String? logType;

  /// The unique name of the delivery source.
  final String? name;

  /// This array contains the ARN of the Amazon Web Services resource that sends
  /// logs and is represented by this delivery source. Currently, only one ARN can
  /// be in the array.
  final List<String>? resourceArns;

  /// The Amazon Web Services service that is sending logs.
  final String? service;

  /// The status of the delivery source. A delivery source can have the status
  /// <code>ACTIVE</code> or <code>INACTIVE</code>. Note: This value is defined
  /// for selective log types.
  final DeliverySourceStatus? status;

  /// The reason for the status of the delivery source. A status reason of
  /// <code>RESOURCE_DELETED</code> indicates that the resource associated with
  /// the delivery source has been deleted. Note: This value is defined for
  /// selective log types.
  final DeliverySourceStatusReason? statusReason;

  /// The tags that have been assigned to this delivery source.
  final Map<String, String>? tags;

  DeliverySource({
    this.arn,
    this.deliverySourceConfiguration,
    this.logType,
    this.name,
    this.resourceArns,
    this.service,
    this.status,
    this.statusReason,
    this.tags,
  });

  factory DeliverySource.fromJson(Map<String, dynamic> json) {
    return DeliverySource(
      arn: json['arn'] as String?,
      deliverySourceConfiguration:
          (json['deliverySourceConfiguration'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
      logType: json['logType'] as String?,
      name: json['name'] as String?,
      resourceArns: (json['resourceArns'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      service: json['service'] as String?,
      status: (json['status'] as String?)?.let(DeliverySourceStatus.fromString),
      statusReason: (json['statusReason'] as String?)
          ?.let(DeliverySourceStatusReason.fromString),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final deliverySourceConfiguration = this.deliverySourceConfiguration;
    final logType = this.logType;
    final name = this.name;
    final resourceArns = this.resourceArns;
    final service = this.service;
    final status = this.status;
    final statusReason = this.statusReason;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (deliverySourceConfiguration != null)
        'deliverySourceConfiguration': deliverySourceConfiguration,
      if (logType != null) 'logType': logType,
      if (name != null) 'name': name,
      if (resourceArns != null) 'resourceArns': resourceArns,
      if (service != null) 'service': service,
      if (status != null) 'status': status.value,
      if (statusReason != null) 'statusReason': statusReason.value,
      if (tags != null) 'tags': tags,
    };
  }
}

class DeliverySourceStatus {
  static const active = DeliverySourceStatus._('ACTIVE');
  static const inactive = DeliverySourceStatus._('INACTIVE');

  final String value;

  const DeliverySourceStatus._(this.value);

  static const values = [active, inactive];

  static DeliverySourceStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DeliverySourceStatus._(value));

  @override
  bool operator ==(other) =>
      other is DeliverySourceStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class DeliverySourceStatusReason {
  static const resourceDeleted =
      DeliverySourceStatusReason._('RESOURCE_DELETED');

  final String value;

  const DeliverySourceStatusReason._(this.value);

  static const values = [resourceDeleted];

  static DeliverySourceStatusReason fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DeliverySourceStatusReason._(value));

  @override
  bool operator ==(other) =>
      other is DeliverySourceStatusReason && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A structure that contains information about one delivery destination policy.
class Policy {
  /// The contents of the delivery destination policy.
  final String? deliveryDestinationPolicy;

  Policy({
    this.deliveryDestinationPolicy,
  });

  factory Policy.fromJson(Map<String, dynamic> json) {
    return Policy(
      deliveryDestinationPolicy: json['deliveryDestinationPolicy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deliveryDestinationPolicy = this.deliveryDestinationPolicy;
    return {
      if (deliveryDestinationPolicy != null)
        'deliveryDestinationPolicy': deliveryDestinationPolicy,
    };
  }
}

/// This structure contains information about one <i>delivery destination</i> in
/// your account. A delivery destination is an Amazon Web Services resource that
/// represents an Amazon Web Services service that logs can be sent to.
/// CloudWatch Logs, Amazon S3, Firehose, and X-Ray are supported as delivery
/// destinations.
///
/// To configure logs delivery between a supported Amazon Web Services service
/// and a destination, you must do the following:
///
/// <ul>
/// <li>
/// Create a delivery source, which is a logical object that represents the
/// resource that is actually sending the logs. For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliverySource.html">PutDeliverySource</a>.
/// </li>
/// <li>
/// Create a <i>delivery destination</i>, which is a logical object that
/// represents the actual delivery destination.
/// </li>
/// <li>
/// If you are delivering logs cross-account, you must use <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestinationPolicy.html">PutDeliveryDestinationPolicy</a>
/// in the destination account to assign an IAM policy to the destination. This
/// policy allows delivery to that destination.
/// </li>
/// <li>
/// Create a <i>delivery</i> by pairing exactly one delivery source and one
/// delivery destination. For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_CreateDelivery.html">CreateDelivery</a>.
/// </li>
/// </ul>
/// You can configure a single delivery source to send logs to multiple
/// destinations by creating multiple deliveries. You can also create multiple
/// deliveries to configure multiple delivery sources to send logs to the same
/// delivery destination.
class DeliveryDestination {
  /// The Amazon Resource Name (ARN) that uniquely identifies this delivery
  /// destination.
  final String? arn;

  /// A structure that contains the ARN of the Amazon Web Services resource that
  /// will receive the logs.
  final DeliveryDestinationConfiguration? deliveryDestinationConfiguration;

  /// Displays whether this delivery destination is CloudWatch Logs, Amazon S3,
  /// Firehose, or X-Ray.
  final DeliveryDestinationType? deliveryDestinationType;

  /// The name of this delivery destination.
  final String? name;

  /// The format of the logs that are sent to this delivery destination.
  final OutputFormat? outputFormat;

  /// The tags that have been assigned to this delivery destination.
  final Map<String, String>? tags;

  DeliveryDestination({
    this.arn,
    this.deliveryDestinationConfiguration,
    this.deliveryDestinationType,
    this.name,
    this.outputFormat,
    this.tags,
  });

  factory DeliveryDestination.fromJson(Map<String, dynamic> json) {
    return DeliveryDestination(
      arn: json['arn'] as String?,
      deliveryDestinationConfiguration:
          json['deliveryDestinationConfiguration'] != null
              ? DeliveryDestinationConfiguration.fromJson(
                  json['deliveryDestinationConfiguration']
                      as Map<String, dynamic>)
              : null,
      deliveryDestinationType: (json['deliveryDestinationType'] as String?)
          ?.let(DeliveryDestinationType.fromString),
      name: json['name'] as String?,
      outputFormat:
          (json['outputFormat'] as String?)?.let(OutputFormat.fromString),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final deliveryDestinationConfiguration =
        this.deliveryDestinationConfiguration;
    final deliveryDestinationType = this.deliveryDestinationType;
    final name = this.name;
    final outputFormat = this.outputFormat;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (deliveryDestinationConfiguration != null)
        'deliveryDestinationConfiguration': deliveryDestinationConfiguration,
      if (deliveryDestinationType != null)
        'deliveryDestinationType': deliveryDestinationType.value,
      if (name != null) 'name': name,
      if (outputFormat != null) 'outputFormat': outputFormat.value,
      if (tags != null) 'tags': tags,
    };
  }
}

class DeliveryDestinationType {
  static const s3 = DeliveryDestinationType._('S3');
  static const cwl = DeliveryDestinationType._('CWL');
  static const fh = DeliveryDestinationType._('FH');
  static const xray = DeliveryDestinationType._('XRAY');

  final String value;

  const DeliveryDestinationType._(this.value);

  static const values = [s3, cwl, fh, xray];

  static DeliveryDestinationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DeliveryDestinationType._(value));

  @override
  bool operator ==(other) =>
      other is DeliveryDestinationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class OutputFormat {
  static const json = OutputFormat._('json');
  static const plain = OutputFormat._('plain');
  static const w3c = OutputFormat._('w3c');
  static const raw = OutputFormat._('raw');
  static const parquet = OutputFormat._('parquet');

  final String value;

  const OutputFormat._(this.value);

  static const values = [json, plain, w3c, raw, parquet];

  static OutputFormat fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => OutputFormat._(value));

  @override
  bool operator ==(other) => other is OutputFormat && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A structure that contains information about one logs delivery destination.
class DeliveryDestinationConfiguration {
  /// The ARN of the Amazon Web Services destination that this delivery
  /// destination represents. That Amazon Web Services destination can be a log
  /// group in CloudWatch Logs, an Amazon S3 bucket, or a delivery stream in
  /// Firehose.
  final String destinationResourceArn;

  DeliveryDestinationConfiguration({
    required this.destinationResourceArn,
  });

  factory DeliveryDestinationConfiguration.fromJson(Map<String, dynamic> json) {
    return DeliveryDestinationConfiguration(
      destinationResourceArn: (json['destinationResourceArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final destinationResourceArn = this.destinationResourceArn;
    return {
      'destinationResourceArn': destinationResourceArn,
    };
  }
}

/// A structure that contains information about one CloudWatch Logs account
/// policy.
class AccountPolicy {
  /// The Amazon Web Services account ID that the policy applies to.
  final String? accountId;

  /// The date and time that this policy was most recently updated.
  final int? lastUpdatedTime;

  /// The policy document for this account policy.
  ///
  /// The JSON specified in <code>policyDocument</code> can be up to 30,720
  /// characters.
  final String? policyDocument;

  /// The name of the account policy.
  final String? policyName;

  /// The type of policy for this account policy.
  final PolicyType? policyType;

  /// The scope of the account policy.
  final Scope? scope;

  /// The log group selection criteria that is used for this policy.
  final String? selectionCriteria;

  AccountPolicy({
    this.accountId,
    this.lastUpdatedTime,
    this.policyDocument,
    this.policyName,
    this.policyType,
    this.scope,
    this.selectionCriteria,
  });

  factory AccountPolicy.fromJson(Map<String, dynamic> json) {
    return AccountPolicy(
      accountId: json['accountId'] as String?,
      lastUpdatedTime: json['lastUpdatedTime'] as int?,
      policyDocument: json['policyDocument'] as String?,
      policyName: json['policyName'] as String?,
      policyType: (json['policyType'] as String?)?.let(PolicyType.fromString),
      scope: (json['scope'] as String?)?.let(Scope.fromString),
      selectionCriteria: json['selectionCriteria'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final lastUpdatedTime = this.lastUpdatedTime;
    final policyDocument = this.policyDocument;
    final policyName = this.policyName;
    final policyType = this.policyType;
    final scope = this.scope;
    final selectionCriteria = this.selectionCriteria;
    return {
      if (accountId != null) 'accountId': accountId,
      if (lastUpdatedTime != null) 'lastUpdatedTime': lastUpdatedTime,
      if (policyDocument != null) 'policyDocument': policyDocument,
      if (policyName != null) 'policyName': policyName,
      if (policyType != null) 'policyType': policyType.value,
      if (scope != null) 'scope': scope.value,
      if (selectionCriteria != null) 'selectionCriteria': selectionCriteria,
    };
  }
}

class PolicyType {
  static const dataProtectionPolicy = PolicyType._('DATA_PROTECTION_POLICY');
  static const subscriptionFilterPolicy =
      PolicyType._('SUBSCRIPTION_FILTER_POLICY');
  static const fieldIndexPolicy = PolicyType._('FIELD_INDEX_POLICY');
  static const transformerPolicy = PolicyType._('TRANSFORMER_POLICY');
  static const metricExtractionPolicy =
      PolicyType._('METRIC_EXTRACTION_POLICY');

  final String value;

  const PolicyType._(this.value);

  static const values = [
    dataProtectionPolicy,
    subscriptionFilterPolicy,
    fieldIndexPolicy,
    transformerPolicy,
    metricExtractionPolicy
  ];

  static PolicyType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => PolicyType._(value));

  @override
  bool operator ==(other) => other is PolicyType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class Scope {
  static const all = Scope._('ALL');

  final String value;

  const Scope._(this.value);

  static const values = [all];

  static Scope fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Scope._(value));

  @override
  bool operator ==(other) => other is Scope && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents a data source association with an S3 Table Integration, including
/// its status and metadata.
class S3TableIntegrationSource {
  /// The timestamp when the data source association was created.
  final int? createdTimeStamp;

  /// The data source associated with the S3 Table Integration.
  final DataSource? dataSource;

  /// The unique identifier for this data source association.
  final String? identifier;

  /// The identifier of the parent data source for this association.
  final String? parentSourceIdentifier;

  /// The current status of the data source association.
  final S3TableIntegrationSourceStatus? status;

  /// Additional information about the status of the data source association.
  final String? statusReason;

  S3TableIntegrationSource({
    this.createdTimeStamp,
    this.dataSource,
    this.identifier,
    this.parentSourceIdentifier,
    this.status,
    this.statusReason,
  });

  factory S3TableIntegrationSource.fromJson(Map<String, dynamic> json) {
    return S3TableIntegrationSource(
      createdTimeStamp: json['createdTimeStamp'] as int?,
      dataSource: json['dataSource'] != null
          ? DataSource.fromJson(json['dataSource'] as Map<String, dynamic>)
          : null,
      identifier: json['identifier'] as String?,
      parentSourceIdentifier: json['parentSourceIdentifier'] as String?,
      status: (json['status'] as String?)
          ?.let(S3TableIntegrationSourceStatus.fromString),
      statusReason: json['statusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdTimeStamp = this.createdTimeStamp;
    final dataSource = this.dataSource;
    final identifier = this.identifier;
    final parentSourceIdentifier = this.parentSourceIdentifier;
    final status = this.status;
    final statusReason = this.statusReason;
    return {
      if (createdTimeStamp != null) 'createdTimeStamp': createdTimeStamp,
      if (dataSource != null) 'dataSource': dataSource,
      if (identifier != null) 'identifier': identifier,
      if (parentSourceIdentifier != null)
        'parentSourceIdentifier': parentSourceIdentifier,
      if (status != null) 'status': status.value,
      if (statusReason != null) 'statusReason': statusReason,
    };
  }
}

/// Represents a data source that categorizes logs by originating service and
/// log type, providing service-based organization complementing traditional log
/// groups.
class DataSource {
  /// The name of the data source.
  final String name;

  /// The type of the data source.
  final String? type;

  DataSource({
    required this.name,
    this.type,
  });

  factory DataSource.fromJson(Map<String, dynamic> json) {
    return DataSource(
      name: (json['name'] as String?) ?? '',
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final type = this.type;
    return {
      'name': name,
      if (type != null) 'type': type,
    };
  }
}

class S3TableIntegrationSourceStatus {
  static const active = S3TableIntegrationSourceStatus._('ACTIVE');
  static const unhealthy = S3TableIntegrationSourceStatus._('UNHEALTHY');
  static const failed = S3TableIntegrationSourceStatus._('FAILED');
  static const dataSourceDeleteInProgress =
      S3TableIntegrationSourceStatus._('DATA_SOURCE_DELETE_IN_PROGRESS');

  final String value;

  const S3TableIntegrationSourceStatus._(this.value);

  static const values = [active, unhealthy, failed, dataSourceDeleteInProgress];

  static S3TableIntegrationSourceStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => S3TableIntegrationSourceStatus._(value));

  @override
  bool operator ==(other) =>
      other is S3TableIntegrationSourceStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Summary information about a scheduled query, including basic configuration
/// and execution status.
class ScheduledQuerySummary {
  /// The timestamp when the scheduled query was created.
  final int? creationTime;

  /// Configuration for where query results are delivered.
  final DestinationConfiguration? destinationConfiguration;

  /// The status of the most recent execution.
  final ExecutionStatus? lastExecutionStatus;

  /// The timestamp when the scheduled query was last executed.
  final int? lastTriggeredTime;

  /// The timestamp when the scheduled query was last updated.
  final int? lastUpdatedTime;

  /// The name of the scheduled query.
  final String? name;

  /// The cron expression that defines when the scheduled query runs.
  final String? scheduleExpression;

  /// The ARN of the scheduled query.
  final String? scheduledQueryArn;

  /// The current state of the scheduled query.
  final ScheduledQueryState? state;

  /// The timezone used for evaluating the schedule expression.
  final String? timezone;

  ScheduledQuerySummary({
    this.creationTime,
    this.destinationConfiguration,
    this.lastExecutionStatus,
    this.lastTriggeredTime,
    this.lastUpdatedTime,
    this.name,
    this.scheduleExpression,
    this.scheduledQueryArn,
    this.state,
    this.timezone,
  });

  factory ScheduledQuerySummary.fromJson(Map<String, dynamic> json) {
    return ScheduledQuerySummary(
      creationTime: json['creationTime'] as int?,
      destinationConfiguration: json['destinationConfiguration'] != null
          ? DestinationConfiguration.fromJson(
              json['destinationConfiguration'] as Map<String, dynamic>)
          : null,
      lastExecutionStatus: (json['lastExecutionStatus'] as String?)
          ?.let(ExecutionStatus.fromString),
      lastTriggeredTime: json['lastTriggeredTime'] as int?,
      lastUpdatedTime: json['lastUpdatedTime'] as int?,
      name: json['name'] as String?,
      scheduleExpression: json['scheduleExpression'] as String?,
      scheduledQueryArn: json['scheduledQueryArn'] as String?,
      state: (json['state'] as String?)?.let(ScheduledQueryState.fromString),
      timezone: json['timezone'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final destinationConfiguration = this.destinationConfiguration;
    final lastExecutionStatus = this.lastExecutionStatus;
    final lastTriggeredTime = this.lastTriggeredTime;
    final lastUpdatedTime = this.lastUpdatedTime;
    final name = this.name;
    final scheduleExpression = this.scheduleExpression;
    final scheduledQueryArn = this.scheduledQueryArn;
    final state = this.state;
    final timezone = this.timezone;
    return {
      if (creationTime != null) 'creationTime': creationTime,
      if (destinationConfiguration != null)
        'destinationConfiguration': destinationConfiguration,
      if (lastExecutionStatus != null)
        'lastExecutionStatus': lastExecutionStatus.value,
      if (lastTriggeredTime != null) 'lastTriggeredTime': lastTriggeredTime,
      if (lastUpdatedTime != null) 'lastUpdatedTime': lastUpdatedTime,
      if (name != null) 'name': name,
      if (scheduleExpression != null) 'scheduleExpression': scheduleExpression,
      if (scheduledQueryArn != null) 'scheduledQueryArn': scheduledQueryArn,
      if (state != null) 'state': state.value,
      if (timezone != null) 'timezone': timezone,
    };
  }
}

/// This structure contains information about one log group in your account.
class LogGroupSummary {
  /// The Amazon Resource Name (ARN) of the log group.
  final String? logGroupArn;

  /// The log group class for this log group. For details about the features
  /// supported by each log group class, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch_Logs_Log_Classes.html">Log
  /// classes</a>
  final LogGroupClass? logGroupClass;

  /// The name of the log group.
  final String? logGroupName;

  LogGroupSummary({
    this.logGroupArn,
    this.logGroupClass,
    this.logGroupName,
  });

  factory LogGroupSummary.fromJson(Map<String, dynamic> json) {
    return LogGroupSummary(
      logGroupArn: json['logGroupArn'] as String?,
      logGroupClass:
          (json['logGroupClass'] as String?)?.let(LogGroupClass.fromString),
      logGroupName: json['logGroupName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final logGroupArn = this.logGroupArn;
    final logGroupClass = this.logGroupClass;
    final logGroupName = this.logGroupName;
    return {
      if (logGroupArn != null) 'logGroupArn': logGroupArn,
      if (logGroupClass != null) 'logGroupClass': logGroupClass.value,
      if (logGroupName != null) 'logGroupName': logGroupName,
    };
  }
}

class LogGroupClass {
  static const standard = LogGroupClass._('STANDARD');
  static const infrequentAccess = LogGroupClass._('INFREQUENT_ACCESS');
  static const delivery = LogGroupClass._('DELIVERY');

  final String value;

  const LogGroupClass._(this.value);

  static const values = [standard, infrequentAccess, delivery];

  static LogGroupClass fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => LogGroupClass._(value));

  @override
  bool operator ==(other) => other is LogGroupClass && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A tag filter that specifies a tag key and optional tag values for filtering
/// log groups by tags.
class TagFilter {
  /// The tag key to filter on.
  final String key;

  /// An optional list of tag values to filter on.
  ///
  /// <ul>
  /// <li>
  /// If you specify a filter that contains more than one value for a key, the
  /// response returns log groups that match any of the specified values for that
  /// key.
  /// </li>
  /// <li>
  /// If you don't specify values, the response returns all log groups that are
  /// tagged with that key, with any or no value.
  /// </li>
  /// <li>
  /// Use <code>*</code> for wildcard matching. For example, <code>prod*</code>
  /// matches values that start with <code>prod</code>.
  /// </li>
  /// <li>
  /// Use <code>!</code> as a prefix for negation. For example, <code>!prod</code>
  /// matches values that are not <code>prod</code>.
  /// </li>
  /// <li>
  /// Exact matching and negation are case-sensitive. Wildcard matching is
  /// case-insensitive.
  /// </li>
  /// </ul>
  final List<String>? values;

  TagFilter({
    required this.key,
    this.values,
  });

  Map<String, dynamic> toJson() {
    final key = this.key;
    final values = this.values;
    return {
      'key': key,
      if (values != null) 'values': values,
    };
  }
}

/// Filter criteria for data sources, used to specify which data sources to
/// include in operations based on name and type.
class DataSourceFilter {
  /// The name pattern to filter data sources by.
  final String name;

  /// The type pattern to filter data sources by.
  final String? type;

  DataSourceFilter({
    required this.name,
    this.type,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final type = this.type;
    return {
      'name': name,
      if (type != null) 'type': type,
    };
  }
}

/// Contains information about one anomaly detector in the account.
class AnomalyDetector {
  /// The ARN of the anomaly detector.
  final String? anomalyDetectorArn;

  /// Specifies the current status of the anomaly detector. To pause an anomaly
  /// detector, use the <code>enabled</code> parameter in the <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_UpdateLogAnomalyDetector.html">UpdateLogAnomalyDetector</a>
  /// operation.
  final AnomalyDetectorStatus? anomalyDetectorStatus;

  /// The number of days used as the life cycle of anomalies. After this time,
  /// anomalies are automatically baselined and the anomaly detector model will
  /// treat new occurrences of similar event as normal.
  final int? anomalyVisibilityTime;

  /// The date and time when this anomaly detector was created.
  final int? creationTimeStamp;

  /// The name of the anomaly detector.
  final String? detectorName;

  /// Specifies how often the anomaly detector runs and look for anomalies.
  final EvaluationFrequency? evaluationFrequency;
  final String? filterPattern;

  /// The ARN of the KMS key assigned to this anomaly detector, if any.
  final String? kmsKeyId;

  /// The date and time when this anomaly detector was most recently modified.
  final int? lastModifiedTimeStamp;

  /// A list of the ARNs of the log groups that this anomaly detector watches.
  final List<String>? logGroupArnList;

  AnomalyDetector({
    this.anomalyDetectorArn,
    this.anomalyDetectorStatus,
    this.anomalyVisibilityTime,
    this.creationTimeStamp,
    this.detectorName,
    this.evaluationFrequency,
    this.filterPattern,
    this.kmsKeyId,
    this.lastModifiedTimeStamp,
    this.logGroupArnList,
  });

  factory AnomalyDetector.fromJson(Map<String, dynamic> json) {
    return AnomalyDetector(
      anomalyDetectorArn: json['anomalyDetectorArn'] as String?,
      anomalyDetectorStatus: (json['anomalyDetectorStatus'] as String?)
          ?.let(AnomalyDetectorStatus.fromString),
      anomalyVisibilityTime: json['anomalyVisibilityTime'] as int?,
      creationTimeStamp: json['creationTimeStamp'] as int?,
      detectorName: json['detectorName'] as String?,
      evaluationFrequency: (json['evaluationFrequency'] as String?)
          ?.let(EvaluationFrequency.fromString),
      filterPattern: json['filterPattern'] as String?,
      kmsKeyId: json['kmsKeyId'] as String?,
      lastModifiedTimeStamp: json['lastModifiedTimeStamp'] as int?,
      logGroupArnList: (json['logGroupArnList'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final anomalyDetectorArn = this.anomalyDetectorArn;
    final anomalyDetectorStatus = this.anomalyDetectorStatus;
    final anomalyVisibilityTime = this.anomalyVisibilityTime;
    final creationTimeStamp = this.creationTimeStamp;
    final detectorName = this.detectorName;
    final evaluationFrequency = this.evaluationFrequency;
    final filterPattern = this.filterPattern;
    final kmsKeyId = this.kmsKeyId;
    final lastModifiedTimeStamp = this.lastModifiedTimeStamp;
    final logGroupArnList = this.logGroupArnList;
    return {
      if (anomalyDetectorArn != null) 'anomalyDetectorArn': anomalyDetectorArn,
      if (anomalyDetectorStatus != null)
        'anomalyDetectorStatus': anomalyDetectorStatus.value,
      if (anomalyVisibilityTime != null)
        'anomalyVisibilityTime': anomalyVisibilityTime,
      if (creationTimeStamp != null) 'creationTimeStamp': creationTimeStamp,
      if (detectorName != null) 'detectorName': detectorName,
      if (evaluationFrequency != null)
        'evaluationFrequency': evaluationFrequency.value,
      if (filterPattern != null) 'filterPattern': filterPattern,
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
      if (lastModifiedTimeStamp != null)
        'lastModifiedTimeStamp': lastModifiedTimeStamp,
      if (logGroupArnList != null) 'logGroupArnList': logGroupArnList,
    };
  }
}

class AnomalyDetectorStatus {
  static const initializing = AnomalyDetectorStatus._('INITIALIZING');
  static const training = AnomalyDetectorStatus._('TRAINING');
  static const analyzing = AnomalyDetectorStatus._('ANALYZING');
  static const failed = AnomalyDetectorStatus._('FAILED');
  static const deleted = AnomalyDetectorStatus._('DELETED');
  static const paused = AnomalyDetectorStatus._('PAUSED');

  final String value;

  const AnomalyDetectorStatus._(this.value);

  static const values = [
    initializing,
    training,
    analyzing,
    failed,
    deleted,
    paused
  ];

  static AnomalyDetectorStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AnomalyDetectorStatus._(value));

  @override
  bool operator ==(other) =>
      other is AnomalyDetectorStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// This structure contains information about one CloudWatch Logs integration.
/// This structure is returned by a <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_ListIntegrations.html">ListIntegrations</a>
/// operation.
class IntegrationSummary {
  /// The name of this integration.
  final String? integrationName;

  /// The current status of this integration.
  final IntegrationStatus? integrationStatus;

  /// The type of integration. Integrations with OpenSearch Service have the type
  /// <code>OPENSEARCH</code>.
  final IntegrationType? integrationType;

  IntegrationSummary({
    this.integrationName,
    this.integrationStatus,
    this.integrationType,
  });

  factory IntegrationSummary.fromJson(Map<String, dynamic> json) {
    return IntegrationSummary(
      integrationName: json['integrationName'] as String?,
      integrationStatus: (json['integrationStatus'] as String?)
          ?.let(IntegrationStatus.fromString),
      integrationType:
          (json['integrationType'] as String?)?.let(IntegrationType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final integrationName = this.integrationName;
    final integrationStatus = this.integrationStatus;
    final integrationType = this.integrationType;
    return {
      if (integrationName != null) 'integrationName': integrationName,
      if (integrationStatus != null)
        'integrationStatus': integrationStatus.value,
      if (integrationType != null) 'integrationType': integrationType.value,
    };
  }
}

/// This structure represents one anomaly that has been found by a logs anomaly
/// detector.
///
/// For more information about patterns and anomalies, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_CreateLogAnomalyDetector.html">CreateLogAnomalyDetector</a>.
class Anomaly {
  /// Specifies whether this anomaly is still ongoing.
  final bool active;

  /// The ARN of the anomaly detector that identified this anomaly.
  final String anomalyDetectorArn;

  /// The unique ID that CloudWatch Logs assigned to this anomaly.
  final String anomalyId;

  /// A human-readable description of the anomaly. This description is generated
  /// by CloudWatch Logs.
  final String description;

  /// The date and time when the anomaly detector first saw this anomaly. It is
  /// specified as epoch time, which is the number of seconds since <code>January
  /// 1, 1970, 00:00:00 UTC</code>.
  final int firstSeen;

  /// A map showing times when the anomaly detector ran, and the number of
  /// occurrences of this anomaly that were detected at each of those runs. The
  /// times are specified in epoch time, which is the number of seconds since
  /// <code>January 1, 1970, 00:00:00 UTC</code>.
  final Map<String, int> histogram;

  /// The date and time when the anomaly detector most recently saw this anomaly.
  /// It is specified as epoch time, which is the number of seconds since
  /// <code>January 1, 1970, 00:00:00 UTC</code>.
  final int lastSeen;

  /// An array of ARNS of the log groups that contained log events considered to
  /// be part of this anomaly.
  final List<String> logGroupArnList;

  /// An array of sample log event messages that are considered to be part of this
  /// anomaly.
  final List<LogEvent> logSamples;

  /// The ID of the pattern used to help identify this anomaly.
  final String patternId;

  /// The pattern used to help identify this anomaly, in string format.
  final String patternString;

  /// An array of structures where each structure contains information about one
  /// token that makes up the pattern.
  final List<PatternToken> patternTokens;

  /// Indicates the current state of this anomaly. If it is still being treated as
  /// an anomaly, the value is <code>Active</code>. If you have suppressed this
  /// anomaly by using the <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_UpdateAnomaly.html">UpdateAnomaly</a>
  /// operation, the value is <code>Suppressed</code>. If this behavior is now
  /// considered to be normal, the value is <code>Baseline</code>.
  final State state;

  /// If this anomaly is suppressed, this field is <code>true</code> if the
  /// suppression is because the pattern is suppressed. If <code>false</code>,
  /// then only this particular anomaly is suppressed.
  final bool? isPatternLevelSuppression;

  /// The pattern used to help identify this anomaly, in regular expression
  /// format.
  final String? patternRegex;

  /// The priority level of this anomaly, as determined by CloudWatch Logs.
  /// Priority is computed based on log severity labels such as <code>FATAL</code>
  /// and <code>ERROR</code> and the amount of deviation from the baseline.
  /// Possible values are <code>HIGH</code>, <code>MEDIUM</code>, and
  /// <code>LOW</code>.
  final String? priority;

  /// Indicates whether this anomaly is currently suppressed. To suppress an
  /// anomaly, use <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_UpdateAnomaly.html">UpdateAnomaly</a>.
  final bool? suppressed;

  /// If the anomaly is suppressed, this indicates when it was suppressed.
  final int? suppressedDate;

  /// If the anomaly is suppressed, this indicates when the suppression will end.
  /// If this value is <code>0</code>, the anomaly was suppressed with no
  /// expiration, with the <code>INFINITE</code> value.
  final int? suppressedUntil;

  Anomaly({
    required this.active,
    required this.anomalyDetectorArn,
    required this.anomalyId,
    required this.description,
    required this.firstSeen,
    required this.histogram,
    required this.lastSeen,
    required this.logGroupArnList,
    required this.logSamples,
    required this.patternId,
    required this.patternString,
    required this.patternTokens,
    required this.state,
    this.isPatternLevelSuppression,
    this.patternRegex,
    this.priority,
    this.suppressed,
    this.suppressedDate,
    this.suppressedUntil,
  });

  factory Anomaly.fromJson(Map<String, dynamic> json) {
    return Anomaly(
      active: (json['active'] as bool?) ?? false,
      anomalyDetectorArn: (json['anomalyDetectorArn'] as String?) ?? '',
      anomalyId: (json['anomalyId'] as String?) ?? '',
      description: (json['description'] as String?) ?? '',
      firstSeen: (json['firstSeen'] as int?) ?? 0,
      histogram: ((json['histogram'] as Map<String, dynamic>?) ??
              const <String, dynamic>{})
          .map((k, e) => MapEntry(k, e as int)),
      lastSeen: (json['lastSeen'] as int?) ?? 0,
      logGroupArnList: ((json['logGroupArnList'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      logSamples: ((json['logSamples'] as List?) ?? const [])
          .nonNulls
          .map((e) => LogEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
      patternId: (json['patternId'] as String?) ?? '',
      patternString: (json['patternString'] as String?) ?? '',
      patternTokens: ((json['patternTokens'] as List?) ?? const [])
          .nonNulls
          .map((e) => PatternToken.fromJson(e as Map<String, dynamic>))
          .toList(),
      state: State.fromString((json['state'] as String?) ?? ''),
      isPatternLevelSuppression: json['isPatternLevelSuppression'] as bool?,
      patternRegex: json['patternRegex'] as String?,
      priority: json['priority'] as String?,
      suppressed: json['suppressed'] as bool?,
      suppressedDate: json['suppressedDate'] as int?,
      suppressedUntil: json['suppressedUntil'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final active = this.active;
    final anomalyDetectorArn = this.anomalyDetectorArn;
    final anomalyId = this.anomalyId;
    final description = this.description;
    final firstSeen = this.firstSeen;
    final histogram = this.histogram;
    final lastSeen = this.lastSeen;
    final logGroupArnList = this.logGroupArnList;
    final logSamples = this.logSamples;
    final patternId = this.patternId;
    final patternString = this.patternString;
    final patternTokens = this.patternTokens;
    final state = this.state;
    final isPatternLevelSuppression = this.isPatternLevelSuppression;
    final patternRegex = this.patternRegex;
    final priority = this.priority;
    final suppressed = this.suppressed;
    final suppressedDate = this.suppressedDate;
    final suppressedUntil = this.suppressedUntil;
    return {
      'active': active,
      'anomalyDetectorArn': anomalyDetectorArn,
      'anomalyId': anomalyId,
      'description': description,
      'firstSeen': firstSeen,
      'histogram': histogram,
      'lastSeen': lastSeen,
      'logGroupArnList': logGroupArnList,
      'logSamples': logSamples,
      'patternId': patternId,
      'patternString': patternString,
      'patternTokens': patternTokens,
      'state': state.value,
      if (isPatternLevelSuppression != null)
        'isPatternLevelSuppression': isPatternLevelSuppression,
      if (patternRegex != null) 'patternRegex': patternRegex,
      if (priority != null) 'priority': priority,
      if (suppressed != null) 'suppressed': suppressed,
      if (suppressedDate != null) 'suppressedDate': suppressedDate,
      if (suppressedUntil != null) 'suppressedUntil': suppressedUntil,
    };
  }
}

class State {
  static const active = State._('Active');
  static const suppressed = State._('Suppressed');
  static const baseline = State._('Baseline');

  final String value;

  const State._(this.value);

  static const values = [active, suppressed, baseline];

  static State fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => State._(value));

  @override
  bool operator ==(other) => other is State && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A structure that contains information about one pattern token related to an
/// anomaly.
///
/// For more information about patterns and tokens, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_CreateLogAnomalyDetector.html">CreateLogAnomalyDetector</a>.
class PatternToken {
  /// For a dynamic token, this indicates where in the pattern that this token
  /// appears, related to other dynamic tokens. The dynamic token that appears
  /// first has a value of <code>1</code>, the one that appears second is
  /// <code>2</code>, and so on.
  final int? dynamicTokenPosition;

  /// Contains the values found for a dynamic token, and the number of times each
  /// value was found.
  final Map<String, int>? enumerations;

  /// A name that CloudWatch Logs assigned to this dynamic token to make the
  /// pattern more readable. The string part of the <code>inferredTokenName</code>
  /// gives you a clearer idea of the content of this token. The number part of
  /// the <code>inferredTokenName</code> shows where in the pattern this token
  /// appears, compared to other dynamic tokens. CloudWatch Logs assigns the
  /// string part of the name based on analyzing the content of the log events
  /// that contain it.
  ///
  /// For example, an inferred token name of <code>IPAddress-3</code> means that
  /// the token represents an IP address, and this token is the third dynamic
  /// token in the pattern.
  final String? inferredTokenName;

  /// Specifies whether this is a dynamic token.
  final bool? isDynamic;

  /// The string represented by this token. If this is a dynamic token, the value
  /// will be <code><*></code>
  final String? tokenString;

  PatternToken({
    this.dynamicTokenPosition,
    this.enumerations,
    this.inferredTokenName,
    this.isDynamic,
    this.tokenString,
  });

  factory PatternToken.fromJson(Map<String, dynamic> json) {
    return PatternToken(
      dynamicTokenPosition: json['dynamicTokenPosition'] as int?,
      enumerations: (json['enumerations'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as int)),
      inferredTokenName: json['inferredTokenName'] as String?,
      isDynamic: json['isDynamic'] as bool?,
      tokenString: json['tokenString'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dynamicTokenPosition = this.dynamicTokenPosition;
    final enumerations = this.enumerations;
    final inferredTokenName = this.inferredTokenName;
    final isDynamic = this.isDynamic;
    final tokenString = this.tokenString;
    return {
      if (dynamicTokenPosition != null)
        'dynamicTokenPosition': dynamicTokenPosition,
      if (enumerations != null) 'enumerations': enumerations,
      if (inferredTokenName != null) 'inferredTokenName': inferredTokenName,
      if (isDynamic != null) 'isDynamic': isDynamic,
      if (tokenString != null) 'tokenString': tokenString,
    };
  }
}

/// This structure contains the information for one sample log event that is
/// associated with an anomaly found by a log anomaly detector.
class LogEvent {
  /// The message content of the log event.
  final String? message;

  /// The time stamp of the log event.
  final int? timestamp;

  LogEvent({
    this.message,
    this.timestamp,
  });

  factory LogEvent.fromJson(Map<String, dynamic> json) {
    return LogEvent(
      message: json['message'] as String?,
      timestamp: json['timestamp'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    final timestamp = this.timestamp;
    return {
      if (message != null) 'message': message,
      if (timestamp != null) 'timestamp': timestamp,
    };
  }
}

class SuppressionState {
  static const suppressed = SuppressionState._('SUPPRESSED');
  static const unsuppressed = SuppressionState._('UNSUPPRESSED');

  final String value;

  const SuppressionState._(this.value);

  static const values = [suppressed, unsuppressed];

  static SuppressionState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SuppressionState._(value));

  @override
  bool operator ==(other) => other is SuppressionState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains an aggregate summary of log groups grouped by data source
/// characteristics, including the count of log groups and their grouping
/// identifiers.
class AggregateLogGroupSummary {
  /// An array of key-value pairs that identify the data source characteristics
  /// used to group the log groups.
  ///
  /// The size and content of this array depends on the <code>groupBy</code>
  /// parameter specified in the request.
  final List<GroupingIdentifier>? groupingIdentifiers;

  /// The number of log groups in this aggregate summary group.
  final int? logGroupCount;

  AggregateLogGroupSummary({
    this.groupingIdentifiers,
    this.logGroupCount,
  });

  factory AggregateLogGroupSummary.fromJson(Map<String, dynamic> json) {
    return AggregateLogGroupSummary(
      groupingIdentifiers: (json['groupingIdentifiers'] as List?)
          ?.nonNulls
          .map((e) => GroupingIdentifier.fromJson(e as Map<String, dynamic>))
          .toList(),
      logGroupCount: json['logGroupCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final groupingIdentifiers = this.groupingIdentifiers;
    final logGroupCount = this.logGroupCount;
    return {
      if (groupingIdentifiers != null)
        'groupingIdentifiers': groupingIdentifiers,
      if (logGroupCount != null) 'logGroupCount': logGroupCount,
    };
  }
}

/// A key-value pair that identifies how log groups are grouped in aggregate
/// summaries.
class GroupingIdentifier {
  /// The key that identifies the grouping characteristic. The format of the key
  /// uses dot notation. Examples are, <code>dataSource.Name</code>,
  /// <code>dataSource.Type</code>, and <code>dataSource.Format</code>.
  final String? key;

  /// The value associated with the grouping characteristic. Examples are
  /// <code>amazon_vpc</code>, <code>flow</code>, and <code>OCSF</code>.
  final String? value;

  GroupingIdentifier({
    this.key,
    this.value,
  });

  factory GroupingIdentifier.fromJson(Map<String, dynamic> json) {
    return GroupingIdentifier(
      key: json['key'] as String?,
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      if (key != null) 'key': key,
      if (value != null) 'value': value,
    };
  }
}

class ListAggregateLogGroupSummariesGroupBy {
  static const dataSourceNameTypeAndFormat =
      ListAggregateLogGroupSummariesGroupBy._(
          'DATA_SOURCE_NAME_TYPE_AND_FORMAT');
  static const dataSourceNameAndType =
      ListAggregateLogGroupSummariesGroupBy._('DATA_SOURCE_NAME_AND_TYPE');

  final String value;

  const ListAggregateLogGroupSummariesGroupBy._(this.value);

  static const values = [dataSourceNameTypeAndFormat, dataSourceNameAndType];

  static ListAggregateLogGroupSummariesGroupBy fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ListAggregateLogGroupSummariesGroupBy._(value));

  @override
  bool operator ==(other) =>
      other is ListAggregateLogGroupSummariesGroupBy && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A record of a scheduled query execution, including execution status,
/// timestamp, and destination processing results.
class TriggerHistoryRecord {
  /// Information about destination processing for this query execution.
  final List<ScheduledQueryDestination>? destinations;

  /// Error message if the query execution failed.
  final String? errorMessage;

  /// The execution status of the scheduled query run.
  final ExecutionStatus? executionStatus;

  /// The unique identifier for this query execution.
  final String? queryId;

  /// The timestamp when the scheduled query execution was triggered.
  final int? triggeredTimestamp;

  TriggerHistoryRecord({
    this.destinations,
    this.errorMessage,
    this.executionStatus,
    this.queryId,
    this.triggeredTimestamp,
  });

  factory TriggerHistoryRecord.fromJson(Map<String, dynamic> json) {
    return TriggerHistoryRecord(
      destinations: (json['destinations'] as List?)
          ?.nonNulls
          .map((e) =>
              ScheduledQueryDestination.fromJson(e as Map<String, dynamic>))
          .toList(),
      errorMessage: json['errorMessage'] as String?,
      executionStatus:
          (json['executionStatus'] as String?)?.let(ExecutionStatus.fromString),
      queryId: json['queryId'] as String?,
      triggeredTimestamp: json['triggeredTimestamp'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final destinations = this.destinations;
    final errorMessage = this.errorMessage;
    final executionStatus = this.executionStatus;
    final queryId = this.queryId;
    final triggeredTimestamp = this.triggeredTimestamp;
    return {
      if (destinations != null) 'destinations': destinations,
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (executionStatus != null) 'executionStatus': executionStatus.value,
      if (queryId != null) 'queryId': queryId,
      if (triggeredTimestamp != null) 'triggeredTimestamp': triggeredTimestamp,
    };
  }
}

/// Information about a destination where scheduled query results are processed,
/// including processing status and any error messages.
class ScheduledQueryDestination {
  /// The identifier for the destination where results are delivered.
  final String? destinationIdentifier;

  /// The type of destination for query results.
  final ScheduledQueryDestinationType? destinationType;

  /// Error message if destination processing failed.
  final String? errorMessage;

  /// The identifier of the processed result at the destination.
  final String? processedIdentifier;

  /// The processing status of the destination delivery.
  final ActionStatus? status;

  ScheduledQueryDestination({
    this.destinationIdentifier,
    this.destinationType,
    this.errorMessage,
    this.processedIdentifier,
    this.status,
  });

  factory ScheduledQueryDestination.fromJson(Map<String, dynamic> json) {
    return ScheduledQueryDestination(
      destinationIdentifier: json['destinationIdentifier'] as String?,
      destinationType: (json['destinationType'] as String?)
          ?.let(ScheduledQueryDestinationType.fromString),
      errorMessage: json['errorMessage'] as String?,
      processedIdentifier: json['processedIdentifier'] as String?,
      status: (json['status'] as String?)?.let(ActionStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final destinationIdentifier = this.destinationIdentifier;
    final destinationType = this.destinationType;
    final errorMessage = this.errorMessage;
    final processedIdentifier = this.processedIdentifier;
    final status = this.status;
    return {
      if (destinationIdentifier != null)
        'destinationIdentifier': destinationIdentifier,
      if (destinationType != null) 'destinationType': destinationType.value,
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (processedIdentifier != null)
        'processedIdentifier': processedIdentifier,
      if (status != null) 'status': status.value,
    };
  }
}

class ScheduledQueryDestinationType {
  static const s3 = ScheduledQueryDestinationType._('S3');

  final String value;

  const ScheduledQueryDestinationType._(this.value);

  static const values = [s3];

  static ScheduledQueryDestinationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ScheduledQueryDestinationType._(value));

  @override
  bool operator ==(other) =>
      other is ScheduledQueryDestinationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class ActionStatus {
  static const inProgress = ActionStatus._('IN_PROGRESS');
  static const clientError = ActionStatus._('CLIENT_ERROR');
  static const failed = ActionStatus._('FAILED');
  static const complete = ActionStatus._('COMPLETE');

  final String value;

  const ActionStatus._(this.value);

  static const values = [inProgress, clientError, failed, complete];

  static ActionStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ActionStatus._(value));

  @override
  bool operator ==(other) => other is ActionStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains the number of log events scanned by the query, the number of log
/// events that matched the query criteria, and the total number of bytes in the
/// log events that were scanned.
///
/// If the query involved log groups that have field index policies, the
/// estimated number of skipped log events and the total bytes of those skipped
/// log events are included. Using field indexes to skip log events in queries
/// reduces scan volume and improves performance. For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatchLogs-Field-Indexing.html">Create
/// field indexes to improve query performance and reduce scan volume</a>.
class QueryStatistics {
  /// The total number of bytes in the log events scanned during the query.
  final double? bytesScanned;

  /// An estimate of the number of bytes in the log events that were skipped when
  /// processing this query, because the query contained an indexed field.
  /// Skipping these entries lowers query costs and improves the query performance
  /// time. For more information about field indexes, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutIndexPolicy.html">PutIndexPolicy</a>.
  final double? estimatedBytesSkipped;

  /// An estimate of the number of log events that were skipped when processing
  /// this query, because the query contained an indexed field. Skipping these
  /// entries lowers query costs and improves the query performance time. For more
  /// information about field indexes, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutIndexPolicy.html">PutIndexPolicy</a>.
  final double? estimatedRecordsSkipped;

  /// The number of log groups that were scanned by this query.
  final double? logGroupsScanned;

  /// The number of log events that matched the query string.
  final double? recordsMatched;

  /// The total number of log events scanned during the query.
  final double? recordsScanned;

  QueryStatistics({
    this.bytesScanned,
    this.estimatedBytesSkipped,
    this.estimatedRecordsSkipped,
    this.logGroupsScanned,
    this.recordsMatched,
    this.recordsScanned,
  });

  factory QueryStatistics.fromJson(Map<String, dynamic> json) {
    return QueryStatistics(
      bytesScanned: json['bytesScanned'] as double?,
      estimatedBytesSkipped: json['estimatedBytesSkipped'] as double?,
      estimatedRecordsSkipped: json['estimatedRecordsSkipped'] as double?,
      logGroupsScanned: json['logGroupsScanned'] as double?,
      recordsMatched: json['recordsMatched'] as double?,
      recordsScanned: json['recordsScanned'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final bytesScanned = this.bytesScanned;
    final estimatedBytesSkipped = this.estimatedBytesSkipped;
    final estimatedRecordsSkipped = this.estimatedRecordsSkipped;
    final logGroupsScanned = this.logGroupsScanned;
    final recordsMatched = this.recordsMatched;
    final recordsScanned = this.recordsScanned;
    return {
      if (bytesScanned != null) 'bytesScanned': bytesScanned,
      if (estimatedBytesSkipped != null)
        'estimatedBytesSkipped': estimatedBytesSkipped,
      if (estimatedRecordsSkipped != null)
        'estimatedRecordsSkipped': estimatedRecordsSkipped,
      if (logGroupsScanned != null) 'logGroupsScanned': logGroupsScanned,
      if (recordsMatched != null) 'recordsMatched': recordsMatched,
      if (recordsScanned != null) 'recordsScanned': recordsScanned,
    };
  }
}

class QueryStatus {
  static const scheduled = QueryStatus._('Scheduled');
  static const running = QueryStatus._('Running');
  static const complete = QueryStatus._('Complete');
  static const failed = QueryStatus._('Failed');
  static const cancelled = QueryStatus._('Cancelled');
  static const timeout = QueryStatus._('Timeout');
  static const unknown = QueryStatus._('Unknown');

  final String value;

  const QueryStatus._(this.value);

  static const values = [
    scheduled,
    running,
    complete,
    failed,
    cancelled,
    timeout,
    unknown
  ];

  static QueryStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => QueryStatus._(value));

  @override
  bool operator ==(other) => other is QueryStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains one field from one log event returned by a CloudWatch Logs Insights
/// query, along with the value of that field.
///
/// For more information about the fields that are generated by CloudWatch logs,
/// see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_AnalyzeLogData-discoverable-fields.html">Supported
/// Logs and Discovered Fields</a>.
class ResultField {
  /// The log event field.
  final String? field;

  /// The value of this field.
  final String? value;

  ResultField({
    this.field,
    this.value,
  });

  factory ResultField.fromJson(Map<String, dynamic> json) {
    return ResultField(
      field: json['field'] as String?,
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final field = this.field;
    final value = this.value;
    return {
      if (field != null) 'field': field,
      if (value != null) 'value': value,
    };
  }
}

/// A stream of structured log data returned by the GetLogObject operation. This
/// stream contains log events with their associated metadata and extracted
/// fields.
class GetLogObjectResponseStream {
  /// An internal error occurred during the streaming of log data. This exception
  /// is thrown when there's an issue with the internal streaming mechanism used
  /// by the GetLogObject operation.
  final InternalStreamingException? internalStreamingException;
  final FieldsData? fields;

  GetLogObjectResponseStream({
    this.internalStreamingException,
    this.fields,
  });

  factory GetLogObjectResponseStream.fromJson(Map<String, dynamic> json) {
    return GetLogObjectResponseStream(
      internalStreamingException: json['InternalStreamingException'] != null
          ? InternalStreamingException.fromJson(
              json['InternalStreamingException'] as Map<String, dynamic>)
          : null,
      fields: json['fields'] != null
          ? FieldsData.fromJson(json['fields'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final internalStreamingException = this.internalStreamingException;
    final fields = this.fields;
    return {
      if (internalStreamingException != null)
        'InternalStreamingException': internalStreamingException,
      if (fields != null) 'fields': fields,
    };
  }
}

/// A structure containing the extracted fields from a log event. These fields
/// are extracted based on the log format and can be used for structured
/// querying and analysis.
class FieldsData {
  /// The actual log data content returned in the streaming response. This
  /// contains the fields and values of the log event in a structured format that
  /// can be parsed and processed by the client.
  final Uint8List? data;

  FieldsData({
    this.data,
  });

  factory FieldsData.fromJson(Map<String, dynamic> json) {
    return FieldsData(
      data: _s.decodeNullableUint8List(json['data'] as String?),
    );
  }

  Map<String, dynamic> toJson() {
    final data = this.data;
    return {
      if (data != null) 'data': base64Encode(data),
    };
  }
}

/// An internal error occurred during the streaming of log data. This exception
/// is thrown when there's an issue with the internal streaming mechanism used
/// by the GetLogObject operation.
class InternalStreamingException implements _s.AwsException {
  final String? message;

  InternalStreamingException({
    this.message,
  });

  factory InternalStreamingException.fromJson(Map<String, dynamic> json) {
    return InternalStreamingException(
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'message': message,
    };
  }
}

/// The fields contained in log events found by a <code>GetLogGroupFields</code>
/// operation, along with the percentage of queried log events in which each
/// field appears.
class LogGroupField {
  /// The name of a log field.
  final String? name;

  /// The percentage of log events queried that contained the field.
  final int? percent;

  LogGroupField({
    this.name,
    this.percent,
  });

  factory LogGroupField.fromJson(Map<String, dynamic> json) {
    return LogGroupField(
      name: json['name'] as String?,
      percent: json['percent'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final percent = this.percent;
    return {
      if (name != null) 'name': name,
      if (percent != null) 'percent': percent,
    };
  }
}

/// Represents a log field with its name and data type information for a
/// specific data source.
class LogFieldsListItem {
  /// The name of the log field.
  final String? logFieldName;

  /// The data type information for the log field.
  final LogFieldType? logFieldType;

  LogFieldsListItem({
    this.logFieldName,
    this.logFieldType,
  });

  factory LogFieldsListItem.fromJson(Map<String, dynamic> json) {
    return LogFieldsListItem(
      logFieldName: json['logFieldName'] as String?,
      logFieldType: json['logFieldType'] != null
          ? LogFieldType.fromJson(json['logFieldType'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final logFieldName = this.logFieldName;
    final logFieldType = this.logFieldType;
    return {
      if (logFieldName != null) 'logFieldName': logFieldName,
      if (logFieldType != null) 'logFieldType': logFieldType,
    };
  }
}

/// Defines the data type structure for a log field, including the type, element
/// information, and nested fields for complex types.
class LogFieldType {
  /// For array or collection types, specifies the element type information.
  final LogFieldType? element;

  /// For complex types, contains the nested field definitions.
  final List<LogFieldsListItem>? fields;

  /// The data type of the log field.
  final String? type;

  LogFieldType({
    this.element,
    this.fields,
    this.type,
  });

  factory LogFieldType.fromJson(Map<String, dynamic> json) {
    return LogFieldType(
      element: json['element'] != null
          ? LogFieldType.fromJson(json['element'] as Map<String, dynamic>)
          : null,
      fields: (json['fields'] as List?)
          ?.nonNulls
          .map((e) => LogFieldsListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final element = this.element;
    final fields = this.fields;
    final type = this.type;
    return {
      if (element != null) 'element': element,
      if (fields != null) 'fields': fields,
      if (type != null) 'type': type,
    };
  }
}

/// Represents a log event.
class OutputLogEvent {
  /// The time the event was ingested, expressed as the number of milliseconds
  /// after <code>Jan 1, 1970 00:00:00 UTC</code>.
  final int? ingestionTime;

  /// The data contained in the log event.
  final String? message;

  /// The time the event occurred, expressed as the number of milliseconds after
  /// <code>Jan 1, 1970 00:00:00 UTC</code>.
  final int? timestamp;

  OutputLogEvent({
    this.ingestionTime,
    this.message,
    this.timestamp,
  });

  factory OutputLogEvent.fromJson(Map<String, dynamic> json) {
    return OutputLogEvent(
      ingestionTime: json['ingestionTime'] as int?,
      message: json['message'] as String?,
      timestamp: json['timestamp'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final ingestionTime = this.ingestionTime;
    final message = this.message;
    final timestamp = this.timestamp;
    return {
      if (ingestionTime != null) 'ingestionTime': ingestionTime,
      if (message != null) 'message': message,
      if (timestamp != null) 'timestamp': timestamp,
    };
  }
}

/// This structure contains information about the integration configuration. For
/// an integration with OpenSearch Service, this includes information about
/// OpenSearch Service resources such as the collection, the workspace, and
/// policies.
///
/// This structure is returned by a <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_GetIntegration.html">GetIntegration</a>
/// operation.
class IntegrationDetails {
  /// This structure contains complete information about one integration between
  /// CloudWatch Logs and OpenSearch Service.
  final OpenSearchIntegrationDetails? openSearchIntegrationDetails;

  IntegrationDetails({
    this.openSearchIntegrationDetails,
  });

  factory IntegrationDetails.fromJson(Map<String, dynamic> json) {
    return IntegrationDetails(
      openSearchIntegrationDetails: json['openSearchIntegrationDetails'] != null
          ? OpenSearchIntegrationDetails.fromJson(
              json['openSearchIntegrationDetails'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final openSearchIntegrationDetails = this.openSearchIntegrationDetails;
    return {
      if (openSearchIntegrationDetails != null)
        'openSearchIntegrationDetails': openSearchIntegrationDetails,
    };
  }
}

/// This structure contains complete information about one CloudWatch Logs
/// integration. This structure is returned by a <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_GetIntegration.html">GetIntegration</a>
/// operation.
class OpenSearchIntegrationDetails {
  /// This structure contains information about the OpenSearch Service data access
  /// policy used for this integration. The access policy defines the access
  /// controls for the collection. This data access policy was automatically
  /// created as part of the integration setup. For more information about
  /// OpenSearch Service data access policies, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-data-access.html">Data
  /// access control for Amazon OpenSearch Serverless</a> in the OpenSearch
  /// Service Developer Guide.
  final OpenSearchDataAccessPolicy? accessPolicy;

  /// This structure contains information about the OpenSearch Service application
  /// used for this integration. An OpenSearch Service application is the web
  /// application that was created by the integration with CloudWatch Logs. It
  /// hosts the vended logs dashboards.
  final OpenSearchApplication? application;

  /// This structure contains information about the OpenSearch Service collection
  /// used for this integration. This collection was created as part of the
  /// integration setup. An OpenSearch Service collection is a logical grouping of
  /// one or more indexes that represent an analytics workload. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-collections.html">Creating
  /// and managing OpenSearch Service Serverless collections</a>.
  final OpenSearchCollection? collection;

  /// This structure contains information about the OpenSearch Service data source
  /// used for this integration. This data source was created as part of the
  /// integration setup. An OpenSearch Service data source defines the source and
  /// destination for OpenSearch Service queries. It includes the role required to
  /// execute queries and write to collections.
  ///
  /// For more information about OpenSearch Service data sources , see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/direct-query-s3-creating.html">Creating
  /// OpenSearch Service data source integrations with Amazon S3.</a>
  final OpenSearchDataSource? dataSource;

  /// This structure contains information about the OpenSearch Service encryption
  /// policy used for this integration. The encryption policy was created
  /// automatically when you created the integration. For more information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-encryption.html#serverless-encryption-policies">Encryption
  /// policies</a> in the OpenSearch Service Developer Guide.
  final OpenSearchEncryptionPolicy? encryptionPolicy;

  /// This structure contains information about the OpenSearch Service data
  /// lifecycle policy used for this integration. The lifecycle policy determines
  /// the lifespan of the data in the collection. It was automatically created as
  /// part of the integration setup.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-lifecycle.html">Using
  /// data lifecycle policies with OpenSearch Service Serverless</a> in the
  /// OpenSearch Service Developer Guide.
  final OpenSearchLifecyclePolicy? lifecyclePolicy;

  /// This structure contains information about the OpenSearch Service network
  /// policy used for this integration. The network policy assigns network access
  /// settings to collections. For more information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-network.html#serverless-network-policies">Network
  /// policies</a> in the OpenSearch Service Developer Guide.
  final OpenSearchNetworkPolicy? networkPolicy;

  /// This structure contains information about the OpenSearch Service workspace
  /// used for this integration. An OpenSearch Service workspace is the collection
  /// of dashboards along with other OpenSearch Service tools. This workspace was
  /// created automatically as part of the integration setup. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/application.html">Centralized
  /// OpenSearch user interface (Dashboards) with OpenSearch Service</a>.
  final OpenSearchWorkspace? workspace;

  OpenSearchIntegrationDetails({
    this.accessPolicy,
    this.application,
    this.collection,
    this.dataSource,
    this.encryptionPolicy,
    this.lifecyclePolicy,
    this.networkPolicy,
    this.workspace,
  });

  factory OpenSearchIntegrationDetails.fromJson(Map<String, dynamic> json) {
    return OpenSearchIntegrationDetails(
      accessPolicy: json['accessPolicy'] != null
          ? OpenSearchDataAccessPolicy.fromJson(
              json['accessPolicy'] as Map<String, dynamic>)
          : null,
      application: json['application'] != null
          ? OpenSearchApplication.fromJson(
              json['application'] as Map<String, dynamic>)
          : null,
      collection: json['collection'] != null
          ? OpenSearchCollection.fromJson(
              json['collection'] as Map<String, dynamic>)
          : null,
      dataSource: json['dataSource'] != null
          ? OpenSearchDataSource.fromJson(
              json['dataSource'] as Map<String, dynamic>)
          : null,
      encryptionPolicy: json['encryptionPolicy'] != null
          ? OpenSearchEncryptionPolicy.fromJson(
              json['encryptionPolicy'] as Map<String, dynamic>)
          : null,
      lifecyclePolicy: json['lifecyclePolicy'] != null
          ? OpenSearchLifecyclePolicy.fromJson(
              json['lifecyclePolicy'] as Map<String, dynamic>)
          : null,
      networkPolicy: json['networkPolicy'] != null
          ? OpenSearchNetworkPolicy.fromJson(
              json['networkPolicy'] as Map<String, dynamic>)
          : null,
      workspace: json['workspace'] != null
          ? OpenSearchWorkspace.fromJson(
              json['workspace'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accessPolicy = this.accessPolicy;
    final application = this.application;
    final collection = this.collection;
    final dataSource = this.dataSource;
    final encryptionPolicy = this.encryptionPolicy;
    final lifecyclePolicy = this.lifecyclePolicy;
    final networkPolicy = this.networkPolicy;
    final workspace = this.workspace;
    return {
      if (accessPolicy != null) 'accessPolicy': accessPolicy,
      if (application != null) 'application': application,
      if (collection != null) 'collection': collection,
      if (dataSource != null) 'dataSource': dataSource,
      if (encryptionPolicy != null) 'encryptionPolicy': encryptionPolicy,
      if (lifecyclePolicy != null) 'lifecyclePolicy': lifecyclePolicy,
      if (networkPolicy != null) 'networkPolicy': networkPolicy,
      if (workspace != null) 'workspace': workspace,
    };
  }
}

/// This structure contains information about the OpenSearch Service data source
/// used for this integration. This data source was created as part of the
/// integration setup. An OpenSearch Service data source defines the source and
/// destination for OpenSearch Service queries. It includes the role required to
/// execute queries and write to collections.
///
/// For more information about OpenSearch Service data sources , see <a
/// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/direct-query-s3-creating.html">Creating
/// OpenSearch Service data source integrations with Amazon S3.</a>
class OpenSearchDataSource {
  /// The name of the OpenSearch Service data source.
  final String? dataSourceName;

  /// This structure contains information about the status of this OpenSearch
  /// Service resource.
  final OpenSearchResourceStatus? status;

  OpenSearchDataSource({
    this.dataSourceName,
    this.status,
  });

  factory OpenSearchDataSource.fromJson(Map<String, dynamic> json) {
    return OpenSearchDataSource(
      dataSourceName: json['dataSourceName'] as String?,
      status: json['status'] != null
          ? OpenSearchResourceStatus.fromJson(
              json['status'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final dataSourceName = this.dataSourceName;
    final status = this.status;
    return {
      if (dataSourceName != null) 'dataSourceName': dataSourceName,
      if (status != null) 'status': status,
    };
  }
}

/// This structure contains information about the OpenSearch Service application
/// used for this integration. An OpenSearch Service application is the web
/// application created by the integration with CloudWatch Logs. It hosts the
/// vended logs dashboards.
class OpenSearchApplication {
  /// The Amazon Resource Name (ARN) of the application.
  final String? applicationArn;

  /// The endpoint of the application.
  final String? applicationEndpoint;

  /// The ID of the application.
  final String? applicationId;

  /// This structure contains information about the status of this OpenSearch
  /// Service resource.
  final OpenSearchResourceStatus? status;

  OpenSearchApplication({
    this.applicationArn,
    this.applicationEndpoint,
    this.applicationId,
    this.status,
  });

  factory OpenSearchApplication.fromJson(Map<String, dynamic> json) {
    return OpenSearchApplication(
      applicationArn: json['applicationArn'] as String?,
      applicationEndpoint: json['applicationEndpoint'] as String?,
      applicationId: json['applicationId'] as String?,
      status: json['status'] != null
          ? OpenSearchResourceStatus.fromJson(
              json['status'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationArn = this.applicationArn;
    final applicationEndpoint = this.applicationEndpoint;
    final applicationId = this.applicationId;
    final status = this.status;
    return {
      if (applicationArn != null) 'applicationArn': applicationArn,
      if (applicationEndpoint != null)
        'applicationEndpoint': applicationEndpoint,
      if (applicationId != null) 'applicationId': applicationId,
      if (status != null) 'status': status,
    };
  }
}

/// This structure contains information about the OpenSearch Service collection
/// used for this integration. An OpenSearch Service collection is a logical
/// grouping of one or more indexes that represent an analytics workload. For
/// more information, see <a
/// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-collections.html">Creating
/// and managing OpenSearch Service Serverless collections</a>.
class OpenSearchCollection {
  /// The ARN of the collection.
  final String? collectionArn;

  /// The endpoint of the collection.
  final String? collectionEndpoint;

  /// This structure contains information about the status of this OpenSearch
  /// Service resource.
  final OpenSearchResourceStatus? status;

  OpenSearchCollection({
    this.collectionArn,
    this.collectionEndpoint,
    this.status,
  });

  factory OpenSearchCollection.fromJson(Map<String, dynamic> json) {
    return OpenSearchCollection(
      collectionArn: json['collectionArn'] as String?,
      collectionEndpoint: json['collectionEndpoint'] as String?,
      status: json['status'] != null
          ? OpenSearchResourceStatus.fromJson(
              json['status'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final collectionArn = this.collectionArn;
    final collectionEndpoint = this.collectionEndpoint;
    final status = this.status;
    return {
      if (collectionArn != null) 'collectionArn': collectionArn,
      if (collectionEndpoint != null) 'collectionEndpoint': collectionEndpoint,
      if (status != null) 'status': status,
    };
  }
}

/// This structure contains information about the OpenSearch Service workspace
/// used for this integration. An OpenSearch Service workspace is the collection
/// of dashboards along with other OpenSearch Service tools. This workspace was
/// created automatically as part of the integration setup. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/application.html">Centralized
/// OpenSearch user interface (Dashboards) with OpenSearch Service</a>.
class OpenSearchWorkspace {
  /// This structure contains information about the status of an OpenSearch
  /// Service resource.
  final OpenSearchResourceStatus? status;

  /// The ID of this workspace.
  final String? workspaceId;

  OpenSearchWorkspace({
    this.status,
    this.workspaceId,
  });

  factory OpenSearchWorkspace.fromJson(Map<String, dynamic> json) {
    return OpenSearchWorkspace(
      status: json['status'] != null
          ? OpenSearchResourceStatus.fromJson(
              json['status'] as Map<String, dynamic>)
          : null,
      workspaceId: json['workspaceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final workspaceId = this.workspaceId;
    return {
      if (status != null) 'status': status,
      if (workspaceId != null) 'workspaceId': workspaceId,
    };
  }
}

/// This structure contains information about the OpenSearch Service encryption
/// policy used for this integration. The encryption policy was created
/// automatically when you created the integration. For more information, see <a
/// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-encryption.html#serverless-encryption-policies">Encryption
/// policies</a> in the OpenSearch Service Developer Guide.
class OpenSearchEncryptionPolicy {
  /// The name of the encryption policy.
  final String? policyName;

  /// This structure contains information about the status of this OpenSearch
  /// Service resource.
  final OpenSearchResourceStatus? status;

  OpenSearchEncryptionPolicy({
    this.policyName,
    this.status,
  });

  factory OpenSearchEncryptionPolicy.fromJson(Map<String, dynamic> json) {
    return OpenSearchEncryptionPolicy(
      policyName: json['policyName'] as String?,
      status: json['status'] != null
          ? OpenSearchResourceStatus.fromJson(
              json['status'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final policyName = this.policyName;
    final status = this.status;
    return {
      if (policyName != null) 'policyName': policyName,
      if (status != null) 'status': status,
    };
  }
}

/// This structure contains information about the OpenSearch Service network
/// policy used for this integration. The network policy assigns network access
/// settings to collections. For more information, see <a
/// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-network.html#serverless-network-policies">Network
/// policies</a> in the OpenSearch Service Developer Guide.
class OpenSearchNetworkPolicy {
  /// The name of the network policy.
  final String? policyName;

  /// This structure contains information about the status of this OpenSearch
  /// Service resource.
  final OpenSearchResourceStatus? status;

  OpenSearchNetworkPolicy({
    this.policyName,
    this.status,
  });

  factory OpenSearchNetworkPolicy.fromJson(Map<String, dynamic> json) {
    return OpenSearchNetworkPolicy(
      policyName: json['policyName'] as String?,
      status: json['status'] != null
          ? OpenSearchResourceStatus.fromJson(
              json['status'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final policyName = this.policyName;
    final status = this.status;
    return {
      if (policyName != null) 'policyName': policyName,
      if (status != null) 'status': status,
    };
  }
}

/// This structure contains information about the OpenSearch Service data access
/// policy used for this integration. The access policy defines the access
/// controls for the collection. This data access policy was automatically
/// created as part of the integration setup. For more information about
/// OpenSearch Service data access policies, see <a
/// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-data-access.html">Data
/// access control for Amazon OpenSearch Serverless</a> in the OpenSearch
/// Service Developer Guide.
class OpenSearchDataAccessPolicy {
  /// The name of the data access policy.
  final String? policyName;

  /// This structure contains information about the status of this OpenSearch
  /// Service resource.
  final OpenSearchResourceStatus? status;

  OpenSearchDataAccessPolicy({
    this.policyName,
    this.status,
  });

  factory OpenSearchDataAccessPolicy.fromJson(Map<String, dynamic> json) {
    return OpenSearchDataAccessPolicy(
      policyName: json['policyName'] as String?,
      status: json['status'] != null
          ? OpenSearchResourceStatus.fromJson(
              json['status'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final policyName = this.policyName;
    final status = this.status;
    return {
      if (policyName != null) 'policyName': policyName,
      if (status != null) 'status': status,
    };
  }
}

/// This structure contains information about the OpenSearch Service data
/// lifecycle policy used for this integration. The lifecycle policy determines
/// the lifespan of the data in the collection. It was automatically created as
/// part of the integration setup.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-lifecycle.html">Using
/// data lifecycle policies with OpenSearch Service Serverless</a> in the
/// OpenSearch Service Developer Guide.
class OpenSearchLifecyclePolicy {
  /// The name of the lifecycle policy.
  final String? policyName;

  /// This structure contains information about the status of this OpenSearch
  /// Service resource.
  final OpenSearchResourceStatus? status;

  OpenSearchLifecyclePolicy({
    this.policyName,
    this.status,
  });

  factory OpenSearchLifecyclePolicy.fromJson(Map<String, dynamic> json) {
    return OpenSearchLifecyclePolicy(
      policyName: json['policyName'] as String?,
      status: json['status'] != null
          ? OpenSearchResourceStatus.fromJson(
              json['status'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final policyName = this.policyName;
    final status = this.status;
    return {
      if (policyName != null) 'policyName': policyName,
      if (status != null) 'status': status,
    };
  }
}

/// This structure contains information about the status of an OpenSearch
/// Service resource.
class OpenSearchResourceStatus {
  /// The current status of this resource.
  final OpenSearchResourceStatusType? status;

  /// A message with additional information about the status of this resource.
  final String? statusMessage;

  OpenSearchResourceStatus({
    this.status,
    this.statusMessage,
  });

  factory OpenSearchResourceStatus.fromJson(Map<String, dynamic> json) {
    return OpenSearchResourceStatus(
      status: (json['status'] as String?)
          ?.let(OpenSearchResourceStatusType.fromString),
      statusMessage: json['statusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final statusMessage = this.statusMessage;
    return {
      if (status != null) 'status': status.value,
      if (statusMessage != null) 'statusMessage': statusMessage,
    };
  }
}

class OpenSearchResourceStatusType {
  static const active = OpenSearchResourceStatusType._('ACTIVE');
  static const notFound = OpenSearchResourceStatusType._('NOT_FOUND');
  static const error = OpenSearchResourceStatusType._('ERROR');

  final String value;

  const OpenSearchResourceStatusType._(this.value);

  static const values = [active, notFound, error];

  static OpenSearchResourceStatusType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => OpenSearchResourceStatusType._(value));

  @override
  bool operator ==(other) =>
      other is OpenSearchResourceStatusType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// This structure contains information about one <i>delivery</i> in your
/// account.
///
/// A delivery is a connection between a logical <i>delivery source</i> and a
/// logical <i>delivery destination</i>.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_CreateDelivery.html">CreateDelivery</a>.
///
/// To update an existing delivery configuration, use <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_UpdateDeliveryConfiguration.html">UpdateDeliveryConfiguration</a>.
class Delivery {
  /// The Amazon Resource Name (ARN) that uniquely identifies this delivery.
  final String? arn;

  /// The ARN of the delivery destination that is associated with this delivery.
  final String? deliveryDestinationArn;

  /// Displays whether the delivery destination associated with this delivery is
  /// CloudWatch Logs, Amazon S3, Firehose, or X-Ray.
  final DeliveryDestinationType? deliveryDestinationType;

  /// The name of the delivery source that is associated with this delivery.
  final String? deliverySourceName;

  /// The field delimiter that is used between record fields when the final output
  /// format of a delivery is in <code>Plain</code>, <code>W3C</code>, or
  /// <code>Raw</code> format.
  final String? fieldDelimiter;

  /// The unique ID that identifies this delivery in your account.
  final String? id;

  /// The record fields used in this delivery.
  final List<String>? recordFields;

  /// This structure contains delivery configurations that apply only when the
  /// delivery destination resource is an S3 bucket.
  final S3DeliveryConfiguration? s3DeliveryConfiguration;

  /// The tags that have been assigned to this delivery.
  final Map<String, String>? tags;

  Delivery({
    this.arn,
    this.deliveryDestinationArn,
    this.deliveryDestinationType,
    this.deliverySourceName,
    this.fieldDelimiter,
    this.id,
    this.recordFields,
    this.s3DeliveryConfiguration,
    this.tags,
  });

  factory Delivery.fromJson(Map<String, dynamic> json) {
    return Delivery(
      arn: json['arn'] as String?,
      deliveryDestinationArn: json['deliveryDestinationArn'] as String?,
      deliveryDestinationType: (json['deliveryDestinationType'] as String?)
          ?.let(DeliveryDestinationType.fromString),
      deliverySourceName: json['deliverySourceName'] as String?,
      fieldDelimiter: json['fieldDelimiter'] as String?,
      id: json['id'] as String?,
      recordFields: (json['recordFields'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      s3DeliveryConfiguration: json['s3DeliveryConfiguration'] != null
          ? S3DeliveryConfiguration.fromJson(
              json['s3DeliveryConfiguration'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final deliveryDestinationArn = this.deliveryDestinationArn;
    final deliveryDestinationType = this.deliveryDestinationType;
    final deliverySourceName = this.deliverySourceName;
    final fieldDelimiter = this.fieldDelimiter;
    final id = this.id;
    final recordFields = this.recordFields;
    final s3DeliveryConfiguration = this.s3DeliveryConfiguration;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (deliveryDestinationArn != null)
        'deliveryDestinationArn': deliveryDestinationArn,
      if (deliveryDestinationType != null)
        'deliveryDestinationType': deliveryDestinationType.value,
      if (deliverySourceName != null) 'deliverySourceName': deliverySourceName,
      if (fieldDelimiter != null) 'fieldDelimiter': fieldDelimiter,
      if (id != null) 'id': id,
      if (recordFields != null) 'recordFields': recordFields,
      if (s3DeliveryConfiguration != null)
        's3DeliveryConfiguration': s3DeliveryConfiguration,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Represents the search status of a log stream.
class SearchedLogStream {
  /// The name of the log stream.
  final String? logStreamName;

  /// Indicates whether all the events in this log stream were searched.
  final bool? searchedCompletely;

  SearchedLogStream({
    this.logStreamName,
    this.searchedCompletely,
  });

  factory SearchedLogStream.fromJson(Map<String, dynamic> json) {
    return SearchedLogStream(
      logStreamName: json['logStreamName'] as String?,
      searchedCompletely: json['searchedCompletely'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final logStreamName = this.logStreamName;
    final searchedCompletely = this.searchedCompletely;
    return {
      if (logStreamName != null) 'logStreamName': logStreamName,
      if (searchedCompletely != null) 'searchedCompletely': searchedCompletely,
    };
  }
}

/// Represents a matched event.
class FilteredLogEvent {
  /// The ID of the event.
  final String? eventId;

  /// The time the event was ingested, expressed as the number of milliseconds
  /// after <code>Jan 1, 1970 00:00:00 UTC</code>.
  final int? ingestionTime;

  /// The name of the log stream to which this event belongs.
  final String? logStreamName;

  /// The data contained in the log event.
  final String? message;

  /// The time the event occurred, expressed as the number of milliseconds after
  /// <code>Jan 1, 1970 00:00:00 UTC</code>.
  final int? timestamp;

  FilteredLogEvent({
    this.eventId,
    this.ingestionTime,
    this.logStreamName,
    this.message,
    this.timestamp,
  });

  factory FilteredLogEvent.fromJson(Map<String, dynamic> json) {
    return FilteredLogEvent(
      eventId: json['eventId'] as String?,
      ingestionTime: json['ingestionTime'] as int?,
      logStreamName: json['logStreamName'] as String?,
      message: json['message'] as String?,
      timestamp: json['timestamp'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final eventId = this.eventId;
    final ingestionTime = this.ingestionTime;
    final logStreamName = this.logStreamName;
    final message = this.message;
    final timestamp = this.timestamp;
    return {
      if (eventId != null) 'eventId': eventId,
      if (ingestionTime != null) 'ingestionTime': ingestionTime,
      if (logStreamName != null) 'logStreamName': logStreamName,
      if (message != null) 'message': message,
      if (timestamp != null) 'timestamp': timestamp,
    };
  }
}

/// Represents a subscription filter.
class SubscriptionFilter {
  /// This parameter is valid only for log groups that have an active log
  /// transformer. For more information about log transformers, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutTransformer.html">PutTransformer</a>.
  ///
  /// If this value is <code>true</code>, the subscription filter is applied on
  /// the transformed version of the log events instead of the original ingested
  /// log events.
  final bool? applyOnTransformedLogs;

  /// The creation time of the subscription filter, expressed as the number of
  /// milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>.
  final int? creationTime;

  /// The Amazon Resource Name (ARN) of the destination.
  final String? destinationArn;
  final Distribution? distribution;

  /// The list of system fields that are included in the log events sent to the
  /// subscription destination. Returns the <code>emitSystemFields</code> value if
  /// it was specified when the subscription filter was created.
  final List<String>? emitSystemFields;

  /// The filter expression that specifies which log events are processed by this
  /// subscription filter based on system fields. Returns the
  /// <code>fieldSelectionCriteria</code> value if it was specified when the
  /// subscription filter was created.
  final String? fieldSelectionCriteria;

  /// The name of the subscription filter.
  final String? filterName;
  final String? filterPattern;

  /// The name of the log group.
  final String? logGroupName;

  ///
  final String? roleArn;

  SubscriptionFilter({
    this.applyOnTransformedLogs,
    this.creationTime,
    this.destinationArn,
    this.distribution,
    this.emitSystemFields,
    this.fieldSelectionCriteria,
    this.filterName,
    this.filterPattern,
    this.logGroupName,
    this.roleArn,
  });

  factory SubscriptionFilter.fromJson(Map<String, dynamic> json) {
    return SubscriptionFilter(
      applyOnTransformedLogs: json['applyOnTransformedLogs'] as bool?,
      creationTime: json['creationTime'] as int?,
      destinationArn: json['destinationArn'] as String?,
      distribution:
          (json['distribution'] as String?)?.let(Distribution.fromString),
      emitSystemFields: (json['emitSystemFields'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      fieldSelectionCriteria: json['fieldSelectionCriteria'] as String?,
      filterName: json['filterName'] as String?,
      filterPattern: json['filterPattern'] as String?,
      logGroupName: json['logGroupName'] as String?,
      roleArn: json['roleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applyOnTransformedLogs = this.applyOnTransformedLogs;
    final creationTime = this.creationTime;
    final destinationArn = this.destinationArn;
    final distribution = this.distribution;
    final emitSystemFields = this.emitSystemFields;
    final fieldSelectionCriteria = this.fieldSelectionCriteria;
    final filterName = this.filterName;
    final filterPattern = this.filterPattern;
    final logGroupName = this.logGroupName;
    final roleArn = this.roleArn;
    return {
      if (applyOnTransformedLogs != null)
        'applyOnTransformedLogs': applyOnTransformedLogs,
      if (creationTime != null) 'creationTime': creationTime,
      if (destinationArn != null) 'destinationArn': destinationArn,
      if (distribution != null) 'distribution': distribution.value,
      if (emitSystemFields != null) 'emitSystemFields': emitSystemFields,
      if (fieldSelectionCriteria != null)
        'fieldSelectionCriteria': fieldSelectionCriteria,
      if (filterName != null) 'filterName': filterName,
      if (filterPattern != null) 'filterPattern': filterPattern,
      if (logGroupName != null) 'logGroupName': logGroupName,
      if (roleArn != null) 'roleArn': roleArn,
    };
  }
}

/// This structure contains details about a saved CloudWatch Logs Insights query
/// definition.
class QueryDefinition {
  /// The date that the query definition was most recently modified.
  final int? lastModified;

  /// If this query definition contains a list of log groups that it is limited
  /// to, that list appears here.
  final List<String>? logGroupNames;

  /// The name of the query definition.
  final String? name;

  /// If this query definition contains a list of query parameters that define
  /// placeholder variables for the query string, that list appears here.
  final List<QueryParameter>? parameters;

  /// The unique ID of the query definition.
  final String? queryDefinitionId;

  /// The query language used for this query. For more information about the query
  /// languages that CloudWatch Logs supports, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_AnalyzeLogData_Languages.html">Supported
  /// query languages</a>.
  final QueryLanguage? queryLanguage;

  /// The query string to use for this definition. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_QuerySyntax.html">CloudWatch
  /// Logs Insights Query Syntax</a>.
  final String? queryString;

  QueryDefinition({
    this.lastModified,
    this.logGroupNames,
    this.name,
    this.parameters,
    this.queryDefinitionId,
    this.queryLanguage,
    this.queryString,
  });

  factory QueryDefinition.fromJson(Map<String, dynamic> json) {
    return QueryDefinition(
      lastModified: json['lastModified'] as int?,
      logGroupNames: (json['logGroupNames'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      name: json['name'] as String?,
      parameters: (json['parameters'] as List?)
          ?.nonNulls
          .map((e) => QueryParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
      queryDefinitionId: json['queryDefinitionId'] as String?,
      queryLanguage:
          (json['queryLanguage'] as String?)?.let(QueryLanguage.fromString),
      queryString: json['queryString'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lastModified = this.lastModified;
    final logGroupNames = this.logGroupNames;
    final name = this.name;
    final parameters = this.parameters;
    final queryDefinitionId = this.queryDefinitionId;
    final queryLanguage = this.queryLanguage;
    final queryString = this.queryString;
    return {
      if (lastModified != null) 'lastModified': lastModified,
      if (logGroupNames != null) 'logGroupNames': logGroupNames,
      if (name != null) 'name': name,
      if (parameters != null) 'parameters': parameters,
      if (queryDefinitionId != null) 'queryDefinitionId': queryDefinitionId,
      if (queryLanguage != null) 'queryLanguage': queryLanguage.value,
      if (queryString != null) 'queryString': queryString,
    };
  }
}

/// Information about one CloudWatch Logs Insights query that matches the
/// request in a <code>DescribeQueries</code> operation.
class QueryInfo {
  /// The total number of bytes scanned by the query. This indicates the cost
  /// associated with the query.
  final double? bytesScanned;

  /// The date and time that this query was created.
  final int? createTime;

  /// The name of the log group scanned by this query.
  final String? logGroupName;

  /// The duration in milliseconds that the query took to execute.
  final int? queryDuration;

  /// The unique ID number of this query.
  final String? queryId;

  /// The query language used for this query. For more information about the query
  /// languages that CloudWatch Logs supports, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_AnalyzeLogData_Languages.html">Supported
  /// query languages</a>.
  final QueryLanguage? queryLanguage;

  /// The query string used in this query.
  final String? queryString;

  /// The status of this query. Possible values are <code>Cancelled</code>,
  /// <code>Complete</code>, <code>Failed</code>, <code>Running</code>,
  /// <code>Scheduled</code>, and <code>Unknown</code>.
  final QueryStatus? status;

  /// The ARN of the user who ran the query.
  final String? userIdentity;

  QueryInfo({
    this.bytesScanned,
    this.createTime,
    this.logGroupName,
    this.queryDuration,
    this.queryId,
    this.queryLanguage,
    this.queryString,
    this.status,
    this.userIdentity,
  });

  factory QueryInfo.fromJson(Map<String, dynamic> json) {
    return QueryInfo(
      bytesScanned: json['bytesScanned'] as double?,
      createTime: json['createTime'] as int?,
      logGroupName: json['logGroupName'] as String?,
      queryDuration: json['queryDuration'] as int?,
      queryId: json['queryId'] as String?,
      queryLanguage:
          (json['queryLanguage'] as String?)?.let(QueryLanguage.fromString),
      queryString: json['queryString'] as String?,
      status: (json['status'] as String?)?.let(QueryStatus.fromString),
      userIdentity: json['userIdentity'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bytesScanned = this.bytesScanned;
    final createTime = this.createTime;
    final logGroupName = this.logGroupName;
    final queryDuration = this.queryDuration;
    final queryId = this.queryId;
    final queryLanguage = this.queryLanguage;
    final queryString = this.queryString;
    final status = this.status;
    final userIdentity = this.userIdentity;
    return {
      if (bytesScanned != null) 'bytesScanned': bytesScanned,
      if (createTime != null) 'createTime': createTime,
      if (logGroupName != null) 'logGroupName': logGroupName,
      if (queryDuration != null) 'queryDuration': queryDuration,
      if (queryId != null) 'queryId': queryId,
      if (queryLanguage != null) 'queryLanguage': queryLanguage.value,
      if (queryString != null) 'queryString': queryString,
      if (status != null) 'status': status.value,
      if (userIdentity != null) 'userIdentity': userIdentity,
    };
  }
}

/// Metric filters express how CloudWatch Logs would extract metric observations
/// from ingested log events and transform them into metric data in a CloudWatch
/// metric.
class MetricFilter {
  /// This parameter is valid only for log groups that have an active log
  /// transformer. For more information about log transformers, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutTransformer.html">PutTransformer</a>.
  ///
  /// If this value is <code>true</code>, the metric filter is applied on the
  /// transformed version of the log events instead of the original ingested log
  /// events.
  final bool? applyOnTransformedLogs;

  /// The creation time of the metric filter, expressed as the number of
  /// milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>.
  final int? creationTime;

  /// The list of system fields that are emitted as additional dimensions in the
  /// generated metrics. Returns the <code>emitSystemFieldDimensions</code> value
  /// if it was specified when the metric filter was created.
  final List<String>? emitSystemFieldDimensions;

  /// The filter expression that specifies which log events are processed by this
  /// metric filter based on system fields. Returns the
  /// <code>fieldSelectionCriteria</code> value if it was specified when the
  /// metric filter was created.
  final String? fieldSelectionCriteria;

  /// The name of the metric filter.
  final String? filterName;
  final String? filterPattern;

  /// The name of the log group.
  final String? logGroupName;

  /// The metric transformations.
  final List<MetricTransformation>? metricTransformations;

  MetricFilter({
    this.applyOnTransformedLogs,
    this.creationTime,
    this.emitSystemFieldDimensions,
    this.fieldSelectionCriteria,
    this.filterName,
    this.filterPattern,
    this.logGroupName,
    this.metricTransformations,
  });

  factory MetricFilter.fromJson(Map<String, dynamic> json) {
    return MetricFilter(
      applyOnTransformedLogs: json['applyOnTransformedLogs'] as bool?,
      creationTime: json['creationTime'] as int?,
      emitSystemFieldDimensions: (json['emitSystemFieldDimensions'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      fieldSelectionCriteria: json['fieldSelectionCriteria'] as String?,
      filterName: json['filterName'] as String?,
      filterPattern: json['filterPattern'] as String?,
      logGroupName: json['logGroupName'] as String?,
      metricTransformations: (json['metricTransformations'] as List?)
          ?.nonNulls
          .map((e) => MetricTransformation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final applyOnTransformedLogs = this.applyOnTransformedLogs;
    final creationTime = this.creationTime;
    final emitSystemFieldDimensions = this.emitSystemFieldDimensions;
    final fieldSelectionCriteria = this.fieldSelectionCriteria;
    final filterName = this.filterName;
    final filterPattern = this.filterPattern;
    final logGroupName = this.logGroupName;
    final metricTransformations = this.metricTransformations;
    return {
      if (applyOnTransformedLogs != null)
        'applyOnTransformedLogs': applyOnTransformedLogs,
      if (creationTime != null) 'creationTime': creationTime,
      if (emitSystemFieldDimensions != null)
        'emitSystemFieldDimensions': emitSystemFieldDimensions,
      if (fieldSelectionCriteria != null)
        'fieldSelectionCriteria': fieldSelectionCriteria,
      if (filterName != null) 'filterName': filterName,
      if (filterPattern != null) 'filterPattern': filterPattern,
      if (logGroupName != null) 'logGroupName': logGroupName,
      if (metricTransformations != null)
        'metricTransformations': metricTransformations,
    };
  }
}

/// Contains metadata about a lookup table returned by
/// <code>DescribeLookupTables</code>.
class LookupTable {
  /// The description of the lookup table.
  final String? description;

  /// The ARN of the KMS key used to encrypt the lookup table data, if applicable.
  final String? kmsKeyId;

  /// The time when the lookup table was last updated, expressed as the number of
  /// milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>.
  final int? lastUpdatedTime;

  /// The ARN of the lookup table.
  final String? lookupTableArn;

  /// The name of the lookup table.
  final String? lookupTableName;

  /// The number of data rows in the lookup table, excluding the header row.
  final int? recordsCount;

  /// The size of the lookup table in bytes.
  final int? sizeBytes;

  /// The column headers from the first row of the CSV file.
  final List<String>? tableFields;

  LookupTable({
    this.description,
    this.kmsKeyId,
    this.lastUpdatedTime,
    this.lookupTableArn,
    this.lookupTableName,
    this.recordsCount,
    this.sizeBytes,
    this.tableFields,
  });

  factory LookupTable.fromJson(Map<String, dynamic> json) {
    return LookupTable(
      description: json['description'] as String?,
      kmsKeyId: json['kmsKeyId'] as String?,
      lastUpdatedTime: json['lastUpdatedTime'] as int?,
      lookupTableArn: json['lookupTableArn'] as String?,
      lookupTableName: json['lookupTableName'] as String?,
      recordsCount: json['recordsCount'] as int?,
      sizeBytes: json['sizeBytes'] as int?,
      tableFields: (json['tableFields'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final kmsKeyId = this.kmsKeyId;
    final lastUpdatedTime = this.lastUpdatedTime;
    final lookupTableArn = this.lookupTableArn;
    final lookupTableName = this.lookupTableName;
    final recordsCount = this.recordsCount;
    final sizeBytes = this.sizeBytes;
    final tableFields = this.tableFields;
    return {
      if (description != null) 'description': description,
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
      if (lastUpdatedTime != null) 'lastUpdatedTime': lastUpdatedTime,
      if (lookupTableArn != null) 'lookupTableArn': lookupTableArn,
      if (lookupTableName != null) 'lookupTableName': lookupTableName,
      if (recordsCount != null) 'recordsCount': recordsCount,
      if (sizeBytes != null) 'sizeBytes': sizeBytes,
      if (tableFields != null) 'tableFields': tableFields,
    };
  }
}

/// Represents a log stream, which is a sequence of log events from a single
/// emitter of logs.
class LogStream {
  /// The Amazon Resource Name (ARN) of the log stream.
  final String? arn;

  /// The creation time of the stream, expressed as the number of milliseconds
  /// after <code>Jan 1, 1970 00:00:00 UTC</code>.
  final int? creationTime;

  /// The time of the first event, expressed as the number of milliseconds after
  /// <code>Jan 1, 1970 00:00:00 UTC</code>.
  final int? firstEventTimestamp;

  /// The time of the most recent log event in the log stream in CloudWatch Logs.
  /// This number is expressed as the number of milliseconds after <code>Jan 1,
  /// 1970 00:00:00 UTC</code>. The <code>lastEventTime</code> value updates on an
  /// eventual consistency basis. It typically updates in less than an hour from
  /// ingestion, but in rare situations might take longer.
  final int? lastEventTimestamp;

  /// The ingestion time, expressed as the number of milliseconds after <code>Jan
  /// 1, 1970 00:00:00 UTC</code> The <code>lastIngestionTime</code> value updates
  /// on an eventual consistency basis. It typically updates in less than an hour
  /// after ingestion, but in rare situations might take longer.
  final int? lastIngestionTime;

  /// The name of the log stream.
  final String? logStreamName;

  /// The number of bytes stored.
  ///
  /// <b>Important:</b> As of June 17, 2019, this parameter is no longer supported
  /// for log streams, and is always reported as zero. This change applies only to
  /// log streams. The <code>storedBytes</code> parameter for log groups is not
  /// affected.
  final int? storedBytes;

  /// The sequence token.
  /// <important>
  /// The sequence token is now ignored in <code>PutLogEvents</code> actions.
  /// <code>PutLogEvents</code> actions are always accepted regardless of
  /// receiving an invalid sequence token. You don't need to obtain
  /// <code>uploadSequenceToken</code> to use a <code>PutLogEvents</code> action.
  /// </important>
  final String? uploadSequenceToken;

  LogStream({
    this.arn,
    this.creationTime,
    this.firstEventTimestamp,
    this.lastEventTimestamp,
    this.lastIngestionTime,
    this.logStreamName,
    this.storedBytes,
    this.uploadSequenceToken,
  });

  factory LogStream.fromJson(Map<String, dynamic> json) {
    return LogStream(
      arn: json['arn'] as String?,
      creationTime: json['creationTime'] as int?,
      firstEventTimestamp: json['firstEventTimestamp'] as int?,
      lastEventTimestamp: json['lastEventTimestamp'] as int?,
      lastIngestionTime: json['lastIngestionTime'] as int?,
      logStreamName: json['logStreamName'] as String?,
      storedBytes: json['storedBytes'] as int?,
      uploadSequenceToken: json['uploadSequenceToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final firstEventTimestamp = this.firstEventTimestamp;
    final lastEventTimestamp = this.lastEventTimestamp;
    final lastIngestionTime = this.lastIngestionTime;
    final logStreamName = this.logStreamName;
    final storedBytes = this.storedBytes;
    final uploadSequenceToken = this.uploadSequenceToken;
    return {
      if (arn != null) 'arn': arn,
      if (creationTime != null) 'creationTime': creationTime,
      if (firstEventTimestamp != null)
        'firstEventTimestamp': firstEventTimestamp,
      if (lastEventTimestamp != null) 'lastEventTimestamp': lastEventTimestamp,
      if (lastIngestionTime != null) 'lastIngestionTime': lastIngestionTime,
      if (logStreamName != null) 'logStreamName': logStreamName,
      if (storedBytes != null) 'storedBytes': storedBytes,
      if (uploadSequenceToken != null)
        'uploadSequenceToken': uploadSequenceToken,
    };
  }
}

class OrderBy {
  static const logStreamName = OrderBy._('LogStreamName');
  static const lastEventTime = OrderBy._('LastEventTime');

  final String value;

  const OrderBy._(this.value);

  static const values = [logStreamName, lastEventTime];

  static OrderBy fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => OrderBy._(value));

  @override
  bool operator ==(other) => other is OrderBy && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents a log group.
class LogGroup {
  /// The Amazon Resource Name (ARN) of the log group. This version of the ARN
  /// includes a trailing <code>:*</code> after the log group name.
  ///
  /// Use this version to refer to the ARN in IAM policies when specifying
  /// permissions for most API actions. The exception is when specifying
  /// permissions for <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_TagResource.html">TagResource</a>,
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_UntagResource.html">UntagResource</a>,
  /// and <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_ListTagsForResource.html">ListTagsForResource</a>.
  /// The permissions for those three actions require the ARN version that doesn't
  /// include a trailing <code>:*</code>.
  final String? arn;

  /// Indicates whether bearer token authentication is enabled for this log group.
  /// When enabled, bearer token authentication is allowed on operations until it
  /// is explicitly disabled.
  final bool? bearerTokenAuthenticationEnabled;

  /// The creation time of the log group, expressed as the number of milliseconds
  /// after Jan 1, 1970 00:00:00 UTC.
  final int? creationTime;

  /// Displays whether this log group has a protection policy, or whether it had
  /// one in the past. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDataProtectionPolicy.html">PutDataProtectionPolicy</a>.
  final DataProtectionStatus? dataProtectionStatus;

  /// Indicates whether deletion protection is enabled for this log group. When
  /// enabled, deletion protection blocks all deletion operations until it is
  /// explicitly disabled.
  final bool? deletionProtectionEnabled;

  /// Displays all the properties that this log group has inherited from
  /// account-level settings.
  final List<InheritedProperty>? inheritedProperties;

  /// The Amazon Resource Name (ARN) of the KMS key to use when encrypting log
  /// data.
  final String? kmsKeyId;

  /// The Amazon Resource Name (ARN) of the log group. This version of the ARN
  /// doesn't include a trailing <code>:*</code> after the log group name.
  ///
  /// Use this version to refer to the ARN in the following situations:
  ///
  /// <ul>
  /// <li>
  /// In the <code>logGroupIdentifier</code> input field in many CloudWatch Logs
  /// APIs.
  /// </li>
  /// <li>
  /// In the <code>resourceArn</code> field in tagging APIs
  /// </li>
  /// <li>
  /// In IAM policies, when specifying permissions for <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_TagResource.html">TagResource</a>,
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_UntagResource.html">UntagResource</a>,
  /// and <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_ListTagsForResource.html">ListTagsForResource</a>.
  /// </li>
  /// </ul>
  final String? logGroupArn;

  /// This specifies the log group class for this log group. There are three
  /// classes:
  ///
  /// <ul>
  /// <li>
  /// The <code>Standard</code> log class supports all CloudWatch Logs features.
  /// </li>
  /// <li>
  /// The <code>Infrequent Access</code> log class supports a subset of CloudWatch
  /// Logs features and incurs lower costs.
  /// </li>
  /// <li>
  /// Use the <code>Delivery</code> log class only for delivering Lambda logs to
  /// store in Amazon S3 or Amazon Data Firehose. Log events in log groups in the
  /// Delivery class are kept in CloudWatch Logs for only one day. This log class
  /// doesn't offer rich CloudWatch Logs capabilities such as CloudWatch Logs
  /// Insights queries.
  /// </li>
  /// </ul>
  /// For details about the features supported by the Standard and Infrequent
  /// Access classes, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch_Logs_Log_Classes.html">Log
  /// classes</a>
  final LogGroupClass? logGroupClass;

  /// The name of the log group.
  final String? logGroupName;

  /// The number of metric filters.
  final int? metricFilterCount;
  final int? retentionInDays;

  /// The number of bytes stored.
  final int? storedBytes;

  LogGroup({
    this.arn,
    this.bearerTokenAuthenticationEnabled,
    this.creationTime,
    this.dataProtectionStatus,
    this.deletionProtectionEnabled,
    this.inheritedProperties,
    this.kmsKeyId,
    this.logGroupArn,
    this.logGroupClass,
    this.logGroupName,
    this.metricFilterCount,
    this.retentionInDays,
    this.storedBytes,
  });

  factory LogGroup.fromJson(Map<String, dynamic> json) {
    return LogGroup(
      arn: json['arn'] as String?,
      bearerTokenAuthenticationEnabled:
          json['bearerTokenAuthenticationEnabled'] as bool?,
      creationTime: json['creationTime'] as int?,
      dataProtectionStatus: (json['dataProtectionStatus'] as String?)
          ?.let(DataProtectionStatus.fromString),
      deletionProtectionEnabled: json['deletionProtectionEnabled'] as bool?,
      inheritedProperties: (json['inheritedProperties'] as List?)
          ?.nonNulls
          .map((e) => InheritedProperty.fromString((e as String)))
          .toList(),
      kmsKeyId: json['kmsKeyId'] as String?,
      logGroupArn: json['logGroupArn'] as String?,
      logGroupClass:
          (json['logGroupClass'] as String?)?.let(LogGroupClass.fromString),
      logGroupName: json['logGroupName'] as String?,
      metricFilterCount: json['metricFilterCount'] as int?,
      retentionInDays: json['retentionInDays'] as int?,
      storedBytes: json['storedBytes'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final bearerTokenAuthenticationEnabled =
        this.bearerTokenAuthenticationEnabled;
    final creationTime = this.creationTime;
    final dataProtectionStatus = this.dataProtectionStatus;
    final deletionProtectionEnabled = this.deletionProtectionEnabled;
    final inheritedProperties = this.inheritedProperties;
    final kmsKeyId = this.kmsKeyId;
    final logGroupArn = this.logGroupArn;
    final logGroupClass = this.logGroupClass;
    final logGroupName = this.logGroupName;
    final metricFilterCount = this.metricFilterCount;
    final retentionInDays = this.retentionInDays;
    final storedBytes = this.storedBytes;
    return {
      if (arn != null) 'arn': arn,
      if (bearerTokenAuthenticationEnabled != null)
        'bearerTokenAuthenticationEnabled': bearerTokenAuthenticationEnabled,
      if (creationTime != null) 'creationTime': creationTime,
      if (dataProtectionStatus != null)
        'dataProtectionStatus': dataProtectionStatus.value,
      if (deletionProtectionEnabled != null)
        'deletionProtectionEnabled': deletionProtectionEnabled,
      if (inheritedProperties != null)
        'inheritedProperties': inheritedProperties.map((e) => e.value).toList(),
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
      if (logGroupArn != null) 'logGroupArn': logGroupArn,
      if (logGroupClass != null) 'logGroupClass': logGroupClass.value,
      if (logGroupName != null) 'logGroupName': logGroupName,
      if (metricFilterCount != null) 'metricFilterCount': metricFilterCount,
      if (retentionInDays != null) 'retentionInDays': retentionInDays,
      if (storedBytes != null) 'storedBytes': storedBytes,
    };
  }
}

class DataProtectionStatus {
  static const activated = DataProtectionStatus._('ACTIVATED');
  static const deleted = DataProtectionStatus._('DELETED');
  static const archived = DataProtectionStatus._('ARCHIVED');
  static const disabled = DataProtectionStatus._('DISABLED');

  final String value;

  const DataProtectionStatus._(this.value);

  static const values = [activated, deleted, archived, disabled];

  static DataProtectionStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DataProtectionStatus._(value));

  @override
  bool operator ==(other) =>
      other is DataProtectionStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class InheritedProperty {
  static const accountDataProtection =
      InheritedProperty._('ACCOUNT_DATA_PROTECTION');

  final String value;

  const InheritedProperty._(this.value);

  static const values = [accountDataProtection];

  static InheritedProperty fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => InheritedProperty._(value));

  @override
  bool operator ==(other) => other is InheritedProperty && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An import job to move data from CloudTrail Event Data Store to CloudWatch.
class Import {
  /// The timestamp when the import task was created, expressed as the number of
  /// milliseconds after Jan 1, 1970 00:00:00 UTC.
  final int? creationTime;

  /// Error message related to any failed imports
  final String? errorMessage;

  /// The ARN of the managed CloudWatch Logs log group where the events are being
  /// imported to.
  final String? importDestinationArn;

  /// The filter criteria used for this import task.
  final ImportFilter? importFilter;

  /// The unique identifier of the import task.
  final String? importId;

  /// The ARN of the CloudTrail Lake Event Data Store being imported from.
  final String? importSourceArn;

  /// Statistics about the import progress
  final ImportStatistics? importStatistics;

  /// The current status of the import task. Valid values are IN_PROGRESS,
  /// CANCELLED, COMPLETED and FAILED.
  final ImportStatus? importStatus;

  /// The timestamp when the import task was last updated, expressed as the number
  /// of milliseconds after Jan 1, 1970 00:00:00 UTC.
  final int? lastUpdatedTime;

  Import({
    this.creationTime,
    this.errorMessage,
    this.importDestinationArn,
    this.importFilter,
    this.importId,
    this.importSourceArn,
    this.importStatistics,
    this.importStatus,
    this.lastUpdatedTime,
  });

  factory Import.fromJson(Map<String, dynamic> json) {
    return Import(
      creationTime: json['creationTime'] as int?,
      errorMessage: json['errorMessage'] as String?,
      importDestinationArn: json['importDestinationArn'] as String?,
      importFilter: json['importFilter'] != null
          ? ImportFilter.fromJson(json['importFilter'] as Map<String, dynamic>)
          : null,
      importId: json['importId'] as String?,
      importSourceArn: json['importSourceArn'] as String?,
      importStatistics: json['importStatistics'] != null
          ? ImportStatistics.fromJson(
              json['importStatistics'] as Map<String, dynamic>)
          : null,
      importStatus:
          (json['importStatus'] as String?)?.let(ImportStatus.fromString),
      lastUpdatedTime: json['lastUpdatedTime'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final errorMessage = this.errorMessage;
    final importDestinationArn = this.importDestinationArn;
    final importFilter = this.importFilter;
    final importId = this.importId;
    final importSourceArn = this.importSourceArn;
    final importStatistics = this.importStatistics;
    final importStatus = this.importStatus;
    final lastUpdatedTime = this.lastUpdatedTime;
    return {
      if (creationTime != null) 'creationTime': creationTime,
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (importDestinationArn != null)
        'importDestinationArn': importDestinationArn,
      if (importFilter != null) 'importFilter': importFilter,
      if (importId != null) 'importId': importId,
      if (importSourceArn != null) 'importSourceArn': importSourceArn,
      if (importStatistics != null) 'importStatistics': importStatistics,
      if (importStatus != null) 'importStatus': importStatus.value,
      if (lastUpdatedTime != null) 'lastUpdatedTime': lastUpdatedTime,
    };
  }
}

class ImportStatus {
  static const inProgress = ImportStatus._('IN_PROGRESS');
  static const cancelled = ImportStatus._('CANCELLED');
  static const completed = ImportStatus._('COMPLETED');
  static const failed = ImportStatus._('FAILED');

  final String value;

  const ImportStatus._(this.value);

  static const values = [inProgress, cancelled, completed, failed];

  static ImportStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ImportStatus._(value));

  @override
  bool operator ==(other) => other is ImportStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Statistics about the import progress
class ImportStatistics {
  /// The total number of bytes that have been imported to the managed log group.
  final int? bytesImported;

  ImportStatistics({
    this.bytesImported,
  });

  factory ImportStatistics.fromJson(Map<String, dynamic> json) {
    return ImportStatistics(
      bytesImported: json['bytesImported'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final bytesImported = this.bytesImported;
    return {
      if (bytesImported != null) 'bytesImported': bytesImported,
    };
  }
}

/// The filter criteria used for import tasks
class ImportFilter {
  /// The end of the time range for events to import, expressed as the number of
  /// milliseconds after Jan 1, 1970 00:00:00 UTC.
  final int? endEventTime;

  /// The start of the time range for events to import, expressed as the number of
  /// milliseconds after Jan 1, 1970 00:00:00 UTC.
  final int? startEventTime;

  ImportFilter({
    this.endEventTime,
    this.startEventTime,
  });

  factory ImportFilter.fromJson(Map<String, dynamic> json) {
    return ImportFilter(
      endEventTime: json['endEventTime'] as int?,
      startEventTime: json['startEventTime'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final endEventTime = this.endEventTime;
    final startEventTime = this.startEventTime;
    return {
      if (endEventTime != null) 'endEventTime': endEventTime,
      if (startEventTime != null) 'startEventTime': startEventTime,
    };
  }
}

/// A collection of events being imported to CloudWatch
class ImportBatch {
  /// The unique identifier of the import batch.
  final String batchId;

  /// The current status of the import batch. Valid values are IN_PROGRESS,
  /// CANCELLED, COMPLETED and FAILED.
  final ImportStatus status;

  /// The error message if the batch failed to import. Only present when status is
  /// FAILED.
  final String? errorMessage;

  ImportBatch({
    required this.batchId,
    required this.status,
    this.errorMessage,
  });

  factory ImportBatch.fromJson(Map<String, dynamic> json) {
    return ImportBatch(
      batchId: (json['batchId'] as String?) ?? '',
      status: ImportStatus.fromString((json['status'] as String?) ?? ''),
      errorMessage: json['errorMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final batchId = this.batchId;
    final status = this.status;
    final errorMessage = this.errorMessage;
    return {
      'batchId': batchId,
      'status': status.value,
      if (errorMessage != null) 'errorMessage': errorMessage,
    };
  }
}

/// This structure describes one log event field that is used as an index in at
/// least one index policy in this account.
class FieldIndex {
  /// The string that this field index matches.
  final String? fieldIndexName;

  /// The time and date of the earliest log event that matches this field index,
  /// after the index policy that contains it was created.
  final int? firstEventTime;

  /// The time and date of the most recent log event that matches this field
  /// index.
  final int? lastEventTime;

  /// The most recent time that CloudWatch Logs scanned ingested log events to
  /// search for this field index to improve the speed of future CloudWatch Logs
  /// Insights queries that search for this field index.
  final int? lastScanTime;

  /// If this field index appears in an index policy that applies only to a single
  /// log group, the ARN of that log group is displayed here.
  final String? logGroupIdentifier;

  /// The type of index. Specify <code>FACET</code> for facet-based indexing or
  /// <code>FIELD_INDEX</code> for field-based indexing. This determines how the
  /// field is indexed and can be queried.
  final IndexType? type;

  FieldIndex({
    this.fieldIndexName,
    this.firstEventTime,
    this.lastEventTime,
    this.lastScanTime,
    this.logGroupIdentifier,
    this.type,
  });

  factory FieldIndex.fromJson(Map<String, dynamic> json) {
    return FieldIndex(
      fieldIndexName: json['fieldIndexName'] as String?,
      firstEventTime: json['firstEventTime'] as int?,
      lastEventTime: json['lastEventTime'] as int?,
      lastScanTime: json['lastScanTime'] as int?,
      logGroupIdentifier: json['logGroupIdentifier'] as String?,
      type: (json['type'] as String?)?.let(IndexType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final fieldIndexName = this.fieldIndexName;
    final firstEventTime = this.firstEventTime;
    final lastEventTime = this.lastEventTime;
    final lastScanTime = this.lastScanTime;
    final logGroupIdentifier = this.logGroupIdentifier;
    final type = this.type;
    return {
      if (fieldIndexName != null) 'fieldIndexName': fieldIndexName,
      if (firstEventTime != null) 'firstEventTime': firstEventTime,
      if (lastEventTime != null) 'lastEventTime': lastEventTime,
      if (lastScanTime != null) 'lastScanTime': lastScanTime,
      if (logGroupIdentifier != null) 'logGroupIdentifier': logGroupIdentifier,
      if (type != null) 'type': type.value,
    };
  }
}

class IndexType {
  static const facet = IndexType._('FACET');
  static const fieldIndex = IndexType._('FIELD_INDEX');

  final String value;

  const IndexType._(this.value);

  static const values = [facet, fieldIndex];

  static IndexType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => IndexType._(value));

  @override
  bool operator ==(other) => other is IndexType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents an export task.
class ExportTask {
  /// The name of the S3 bucket to which the log data was exported.
  final String? destination;

  /// The prefix that was used as the start of Amazon S3 key for every object
  /// exported.
  final String? destinationPrefix;

  /// Execution information about the export task.
  final ExportTaskExecutionInfo? executionInfo;

  /// The start time, expressed as the number of milliseconds after <code>Jan 1,
  /// 1970 00:00:00 UTC</code>. Events with a timestamp before this time are not
  /// exported.
  final int? from;

  /// The name of the log group from which logs data was exported.
  final String? logGroupName;

  /// The status of the export task.
  final ExportTaskStatus? status;

  /// The ID of the export task.
  final String? taskId;

  /// The name of the export task.
  final String? taskName;

  /// The end time, expressed as the number of milliseconds after <code>Jan 1,
  /// 1970 00:00:00 UTC</code>. Events with a timestamp later than this time are
  /// not exported.
  final int? to;

  ExportTask({
    this.destination,
    this.destinationPrefix,
    this.executionInfo,
    this.from,
    this.logGroupName,
    this.status,
    this.taskId,
    this.taskName,
    this.to,
  });

  factory ExportTask.fromJson(Map<String, dynamic> json) {
    return ExportTask(
      destination: json['destination'] as String?,
      destinationPrefix: json['destinationPrefix'] as String?,
      executionInfo: json['executionInfo'] != null
          ? ExportTaskExecutionInfo.fromJson(
              json['executionInfo'] as Map<String, dynamic>)
          : null,
      from: json['from'] as int?,
      logGroupName: json['logGroupName'] as String?,
      status: json['status'] != null
          ? ExportTaskStatus.fromJson(json['status'] as Map<String, dynamic>)
          : null,
      taskId: json['taskId'] as String?,
      taskName: json['taskName'] as String?,
      to: json['to'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final destination = this.destination;
    final destinationPrefix = this.destinationPrefix;
    final executionInfo = this.executionInfo;
    final from = this.from;
    final logGroupName = this.logGroupName;
    final status = this.status;
    final taskId = this.taskId;
    final taskName = this.taskName;
    final to = this.to;
    return {
      if (destination != null) 'destination': destination,
      if (destinationPrefix != null) 'destinationPrefix': destinationPrefix,
      if (executionInfo != null) 'executionInfo': executionInfo,
      if (from != null) 'from': from,
      if (logGroupName != null) 'logGroupName': logGroupName,
      if (status != null) 'status': status,
      if (taskId != null) 'taskId': taskId,
      if (taskName != null) 'taskName': taskName,
      if (to != null) 'to': to,
    };
  }
}

/// Represents the status of an export task.
class ExportTaskStatus {
  /// The status code of the export task.
  final ExportTaskStatusCode? code;

  /// The status message related to the status code.
  final String? message;

  ExportTaskStatus({
    this.code,
    this.message,
  });

  factory ExportTaskStatus.fromJson(Map<String, dynamic> json) {
    return ExportTaskStatus(
      code: (json['code'] as String?)?.let(ExportTaskStatusCode.fromString),
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    return {
      if (code != null) 'code': code.value,
      if (message != null) 'message': message,
    };
  }
}

/// Represents the status of an export task.
class ExportTaskExecutionInfo {
  /// The completion time of the export task, expressed as the number of
  /// milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>.
  final int? completionTime;

  /// The creation time of the export task, expressed as the number of
  /// milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>.
  final int? creationTime;

  ExportTaskExecutionInfo({
    this.completionTime,
    this.creationTime,
  });

  factory ExportTaskExecutionInfo.fromJson(Map<String, dynamic> json) {
    return ExportTaskExecutionInfo(
      completionTime: json['completionTime'] as int?,
      creationTime: json['creationTime'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final completionTime = this.completionTime;
    final creationTime = this.creationTime;
    return {
      if (completionTime != null) 'completionTime': completionTime,
      if (creationTime != null) 'creationTime': creationTime,
    };
  }
}

class ExportTaskStatusCode {
  static const cancelled = ExportTaskStatusCode._('CANCELLED');
  static const completed = ExportTaskStatusCode._('COMPLETED');
  static const failed = ExportTaskStatusCode._('FAILED');
  static const pending = ExportTaskStatusCode._('PENDING');
  static const pendingCancel = ExportTaskStatusCode._('PENDING_CANCEL');
  static const running = ExportTaskStatusCode._('RUNNING');

  final String value;

  const ExportTaskStatusCode._(this.value);

  static const values = [
    cancelled,
    completed,
    failed,
    pending,
    pendingCancel,
    running
  ];

  static ExportTaskStatusCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ExportTaskStatusCode._(value));

  @override
  bool operator ==(other) =>
      other is ExportTaskStatusCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A structure containing information about the deafult settings and available
/// settings that you can use to configure a <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_Delivery.html">delivery</a>
/// or a <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DeliveryDestination.html">delivery
/// destination</a>.
class ConfigurationTemplate {
  /// The action permissions that a caller needs to have to be able to
  /// successfully create a delivery source on the desired resource type when
  /// calling <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliverySource.html">PutDeliverySource</a>.
  final String? allowedActionForAllowVendedLogsDeliveryForResource;

  /// The valid values that a caller can use as field delimiters when calling <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_CreateDelivery.html">CreateDelivery</a>
  /// or <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_UpdateDeliveryConfiguration.html">UpdateDeliveryConfiguration</a>
  /// on a delivery that delivers in <code>Plain</code>, <code>W3C</code>, or
  /// <code>Raw</code> format.
  final List<String>? allowedFieldDelimiters;

  /// The allowed fields that a caller can use in the <code>recordFields</code>
  /// parameter of a <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_CreateDelivery.html">CreateDelivery</a>
  /// or <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_UpdateDeliveryConfiguration.html">UpdateDeliveryConfiguration</a>
  /// operation.
  final List<RecordField>? allowedFields;

  /// The list of delivery destination output formats that are supported by this
  /// log source.
  final List<OutputFormat>? allowedOutputFormats;

  /// The list of variable fields that can be used in the suffix path of a
  /// delivery that delivers to an S3 bucket.
  final List<String>? allowedSuffixPathFields;

  /// A mapping that displays the default value of each property within a
  /// delivery's configuration, if it is not specified in the request.
  final ConfigurationTemplateDeliveryConfigValues? defaultDeliveryConfigValues;

  /// A string specifying which destination type this configuration template
  /// applies to.
  final DeliveryDestinationType? deliveryDestinationType;

  /// The schema of the delivery source configuration that is available for this
  /// log type. Each element describes a configuration that can be set when
  /// calling <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliverySource.html">PutDeliverySource</a>,
  /// including the configuration name, type, and default value.
  final List<DeliverySourceConfigurationSchema>? deliverySourceConfiguration;

  /// A string specifying which log type this configuration template applies to.
  final String? logType;

  /// A string specifying which resource type this configuration template applies
  /// to.
  final String? resourceType;

  /// The S3 Tables integration configuration for this configuration template,
  /// including the datasource name and type.
  final S3TablesIntegration? s3TablesIntegration;

  /// A string specifying which service this configuration template applies to.
  /// For more information about supported services see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AWS-logs-and-resource-policy.html">Enable
  /// logging from Amazon Web Services services.</a>.
  final String? service;

  ConfigurationTemplate({
    this.allowedActionForAllowVendedLogsDeliveryForResource,
    this.allowedFieldDelimiters,
    this.allowedFields,
    this.allowedOutputFormats,
    this.allowedSuffixPathFields,
    this.defaultDeliveryConfigValues,
    this.deliveryDestinationType,
    this.deliverySourceConfiguration,
    this.logType,
    this.resourceType,
    this.s3TablesIntegration,
    this.service,
  });

  factory ConfigurationTemplate.fromJson(Map<String, dynamic> json) {
    return ConfigurationTemplate(
      allowedActionForAllowVendedLogsDeliveryForResource:
          json['allowedActionForAllowVendedLogsDeliveryForResource'] as String?,
      allowedFieldDelimiters: (json['allowedFieldDelimiters'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      allowedFields: (json['allowedFields'] as List?)
          ?.nonNulls
          .map((e) => RecordField.fromJson(e as Map<String, dynamic>))
          .toList(),
      allowedOutputFormats: (json['allowedOutputFormats'] as List?)
          ?.nonNulls
          .map((e) => OutputFormat.fromString((e as String)))
          .toList(),
      allowedSuffixPathFields: (json['allowedSuffixPathFields'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      defaultDeliveryConfigValues: json['defaultDeliveryConfigValues'] != null
          ? ConfigurationTemplateDeliveryConfigValues.fromJson(
              json['defaultDeliveryConfigValues'] as Map<String, dynamic>)
          : null,
      deliveryDestinationType: (json['deliveryDestinationType'] as String?)
          ?.let(DeliveryDestinationType.fromString),
      deliverySourceConfiguration:
          (json['deliverySourceConfiguration'] as List?)
              ?.nonNulls
              .map((e) => DeliverySourceConfigurationSchema.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      logType: json['logType'] as String?,
      resourceType: json['resourceType'] as String?,
      s3TablesIntegration: json['s3TablesIntegration'] != null
          ? S3TablesIntegration.fromJson(
              json['s3TablesIntegration'] as Map<String, dynamic>)
          : null,
      service: json['service'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final allowedActionForAllowVendedLogsDeliveryForResource =
        this.allowedActionForAllowVendedLogsDeliveryForResource;
    final allowedFieldDelimiters = this.allowedFieldDelimiters;
    final allowedFields = this.allowedFields;
    final allowedOutputFormats = this.allowedOutputFormats;
    final allowedSuffixPathFields = this.allowedSuffixPathFields;
    final defaultDeliveryConfigValues = this.defaultDeliveryConfigValues;
    final deliveryDestinationType = this.deliveryDestinationType;
    final deliverySourceConfiguration = this.deliverySourceConfiguration;
    final logType = this.logType;
    final resourceType = this.resourceType;
    final s3TablesIntegration = this.s3TablesIntegration;
    final service = this.service;
    return {
      if (allowedActionForAllowVendedLogsDeliveryForResource != null)
        'allowedActionForAllowVendedLogsDeliveryForResource':
            allowedActionForAllowVendedLogsDeliveryForResource,
      if (allowedFieldDelimiters != null)
        'allowedFieldDelimiters': allowedFieldDelimiters,
      if (allowedFields != null) 'allowedFields': allowedFields,
      if (allowedOutputFormats != null)
        'allowedOutputFormats':
            allowedOutputFormats.map((e) => e.value).toList(),
      if (allowedSuffixPathFields != null)
        'allowedSuffixPathFields': allowedSuffixPathFields,
      if (defaultDeliveryConfigValues != null)
        'defaultDeliveryConfigValues': defaultDeliveryConfigValues,
      if (deliveryDestinationType != null)
        'deliveryDestinationType': deliveryDestinationType.value,
      if (deliverySourceConfiguration != null)
        'deliverySourceConfiguration': deliverySourceConfiguration,
      if (logType != null) 'logType': logType,
      if (resourceType != null) 'resourceType': resourceType,
      if (s3TablesIntegration != null)
        's3TablesIntegration': s3TablesIntegration,
      if (service != null) 'service': service,
    };
  }
}

/// This structure contains the default values that are used for each
/// configuration parameter when you use <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_CreateDelivery.html">CreateDelivery</a>
/// to create a deliver under the current service type, resource type, and log
/// type.
class ConfigurationTemplateDeliveryConfigValues {
  /// The default field delimiter that is used in a <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_CreateDelivery.html">CreateDelivery</a>
  /// operation when the field delimiter is not specified in that operation. The
  /// field delimiter is used only when the final output delivery is in
  /// <code>Plain</code>, <code>W3C</code>, or <code>Raw</code> format.
  final String? fieldDelimiter;

  /// The default record fields that will be delivered when a list of record
  /// fields is not provided in a <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_CreateDelivery.html">CreateDelivery</a>
  /// operation.
  final List<String>? recordFields;

  /// The delivery parameters that are used when you create a delivery to a
  /// delivery destination that is an S3 Bucket.
  final S3DeliveryConfiguration? s3DeliveryConfiguration;

  ConfigurationTemplateDeliveryConfigValues({
    this.fieldDelimiter,
    this.recordFields,
    this.s3DeliveryConfiguration,
  });

  factory ConfigurationTemplateDeliveryConfigValues.fromJson(
      Map<String, dynamic> json) {
    return ConfigurationTemplateDeliveryConfigValues(
      fieldDelimiter: json['fieldDelimiter'] as String?,
      recordFields: (json['recordFields'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      s3DeliveryConfiguration: json['s3DeliveryConfiguration'] != null
          ? S3DeliveryConfiguration.fromJson(
              json['s3DeliveryConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final fieldDelimiter = this.fieldDelimiter;
    final recordFields = this.recordFields;
    final s3DeliveryConfiguration = this.s3DeliveryConfiguration;
    return {
      if (fieldDelimiter != null) 'fieldDelimiter': fieldDelimiter,
      if (recordFields != null) 'recordFields': recordFields,
      if (s3DeliveryConfiguration != null)
        's3DeliveryConfiguration': s3DeliveryConfiguration,
    };
  }
}

/// Contains information about the S3 Tables integration configuration for a
/// configuration template.
class S3TablesIntegration {
  /// The name of the S3 Tables datasource.
  final String? datasourceName;

  /// The type of the S3 Tables datasource.
  final String? datasourceType;

  S3TablesIntegration({
    this.datasourceName,
    this.datasourceType,
  });

  factory S3TablesIntegration.fromJson(Map<String, dynamic> json) {
    return S3TablesIntegration(
      datasourceName: json['datasourceName'] as String?,
      datasourceType: json['datasourceType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final datasourceName = this.datasourceName;
    final datasourceType = this.datasourceType;
    return {
      if (datasourceName != null) 'datasourceName': datasourceName,
      if (datasourceType != null) 'datasourceType': datasourceType,
    };
  }
}

/// A structure that describes a single configuration for a log type, including
/// its name, value type, default value, and the range of supported values.
class DeliverySourceConfigurationSchema {
  /// The default value of the configuration that is used when a value is not
  /// specified in a <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliverySource.html">PutDeliverySource</a>
  /// request.
  final String defaultValue;

  /// The name of the configuration.
  final String keyName;

  /// The data type of the configuration value. Valid values are
  /// <code>string</code>, <code>boolean</code>, <code>int</code>,
  /// <code>double</code>, and <code>long</code>.
  final DeliverySourceConfigurationSchemaValueType valueType;

  /// The maximum numeric value allowed for the configuration. This applies only
  /// when the <code>valueType</code> is a numeric type.
  final double? maxValue;

  /// The minimum numeric value allowed for the configuration. This applies only
  /// when the <code>valueType</code> is a numeric type.
  final double? minValue;

  /// The list of allowed values for the configuration. Empty for free-form
  /// configuration.
  final List<String>? supportedValues;

  DeliverySourceConfigurationSchema({
    required this.defaultValue,
    required this.keyName,
    required this.valueType,
    this.maxValue,
    this.minValue,
    this.supportedValues,
  });

  factory DeliverySourceConfigurationSchema.fromJson(
      Map<String, dynamic> json) {
    return DeliverySourceConfigurationSchema(
      defaultValue: (json['defaultValue'] as String?) ?? '',
      keyName: (json['keyName'] as String?) ?? '',
      valueType: DeliverySourceConfigurationSchemaValueType.fromString(
          (json['valueType'] as String?) ?? ''),
      maxValue: json['maxValue'] as double?,
      minValue: json['minValue'] as double?,
      supportedValues: (json['supportedValues'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final defaultValue = this.defaultValue;
    final keyName = this.keyName;
    final valueType = this.valueType;
    final maxValue = this.maxValue;
    final minValue = this.minValue;
    final supportedValues = this.supportedValues;
    return {
      'defaultValue': defaultValue,
      'keyName': keyName,
      'valueType': valueType.value,
      if (maxValue != null) 'maxValue': maxValue,
      if (minValue != null) 'minValue': minValue,
      if (supportedValues != null) 'supportedValues': supportedValues,
    };
  }
}

class DeliverySourceConfigurationSchemaValueType {
  static const string = DeliverySourceConfigurationSchemaValueType._('string');
  static const boolean =
      DeliverySourceConfigurationSchemaValueType._('boolean');
  static const $int = DeliverySourceConfigurationSchemaValueType._('int');
  static const $double = DeliverySourceConfigurationSchemaValueType._('double');
  static const long = DeliverySourceConfigurationSchemaValueType._('long');

  final String value;

  const DeliverySourceConfigurationSchemaValueType._(this.value);

  static const values = [string, boolean, $int, $double, long];

  static DeliverySourceConfigurationSchemaValueType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DeliverySourceConfigurationSchemaValueType._(value));

  @override
  bool operator ==(other) =>
      other is DeliverySourceConfigurationSchemaValueType &&
      other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A structure that represents a valid record field header and whether it is
/// mandatory.
class RecordField {
  /// If this is <code>true</code>, the record field must be present in the
  /// <code>recordFields</code> parameter provided to a <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_CreateDelivery.html">CreateDelivery</a>
  /// or <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_UpdateDeliveryConfiguration.html">UpdateDeliveryConfiguration</a>
  /// operation.
  final bool? mandatory;

  /// The name to use when specifying this record field in a <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_CreateDelivery.html">CreateDelivery</a>
  /// or <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_UpdateDeliveryConfiguration.html">UpdateDeliveryConfiguration</a>
  /// operation.
  final String? name;

  RecordField({
    this.mandatory,
    this.name,
  });

  factory RecordField.fromJson(Map<String, dynamic> json) {
    return RecordField(
      mandatory: json['mandatory'] as bool?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final mandatory = this.mandatory;
    final name = this.name;
    return {
      if (mandatory != null) 'mandatory': mandatory,
      if (name != null) 'name': name,
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

class DataAlreadyAcceptedException extends _s.GenericAwsException {
  DataAlreadyAcceptedException({String? type, String? message})
      : super(
            type: type, code: 'DataAlreadyAcceptedException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class InvalidOperationException extends _s.GenericAwsException {
  InvalidOperationException({String? type, String? message})
      : super(type: type, code: 'InvalidOperationException', message: message);
}

class InvalidParameterException extends _s.GenericAwsException {
  InvalidParameterException({String? type, String? message})
      : super(type: type, code: 'InvalidParameterException', message: message);
}

class InvalidSequenceTokenException extends _s.GenericAwsException {
  InvalidSequenceTokenException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidSequenceTokenException',
            message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class MalformedQueryException extends _s.GenericAwsException {
  MalformedQueryException({String? type, String? message})
      : super(type: type, code: 'MalformedQueryException', message: message);
}

class OperationAbortedException extends _s.GenericAwsException {
  OperationAbortedException({String? type, String? message})
      : super(type: type, code: 'OperationAbortedException', message: message);
}

class ResourceAlreadyExistsException extends _s.GenericAwsException {
  ResourceAlreadyExistsException({String? type, String? message})
      : super(
            type: type,
            code: 'ResourceAlreadyExistsException',
            message: message);
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

class ServiceUnavailableException extends _s.GenericAwsException {
  ServiceUnavailableException({String? type, String? message})
      : super(
            type: type, code: 'ServiceUnavailableException', message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class TooManyTagsException extends _s.GenericAwsException {
  TooManyTagsException({String? type, String? message})
      : super(type: type, code: 'TooManyTagsException', message: message);
}

class UnrecognizedClientException extends _s.GenericAwsException {
  UnrecognizedClientException({String? type, String? message})
      : super(
            type: type, code: 'UnrecognizedClientException', message: message);
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
  'DataAlreadyAcceptedException': (type, message) =>
      DataAlreadyAcceptedException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'InternalStreamingException': (type, message) =>
      InternalStreamingException(message: message),
  'InvalidOperationException': (type, message) =>
      InvalidOperationException(type: type, message: message),
  'InvalidParameterException': (type, message) =>
      InvalidParameterException(type: type, message: message),
  'InvalidSequenceTokenException': (type, message) =>
      InvalidSequenceTokenException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'MalformedQueryException': (type, message) =>
      MalformedQueryException(type: type, message: message),
  'OperationAbortedException': (type, message) =>
      OperationAbortedException(type: type, message: message),
  'ResourceAlreadyExistsException': (type, message) =>
      ResourceAlreadyExistsException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ServiceUnavailableException': (type, message) =>
      ServiceUnavailableException(type: type, message: message),
  'SessionStreamingException': (type, message) =>
      SessionStreamingException(message: message),
  'SessionTimeoutException': (type, message) =>
      SessionTimeoutException(message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'TooManyTagsException': (type, message) =>
      TooManyTagsException(type: type, message: message),
  'UnrecognizedClientException': (type, message) =>
      UnrecognizedClientException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
