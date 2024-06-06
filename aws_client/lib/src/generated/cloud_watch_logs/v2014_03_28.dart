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
  /// Specify the <code>logGroupName</code> parameter to cause all log events
  /// stored in the log group to be encrypted with that key. Only the log events
  /// ingested after the key is associated are encrypted with that key.
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
  /// CloudWatch Logs supports only symmetric KMS keys. Do not use an associate
  /// an asymmetric KMS key with your log group or query results. For more
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
  /// May throw [ResourceNotFoundException].
  /// May throw [OperationAbortedException].
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

  /// Cancels the specified export task.
  ///
  /// The task must be in the <code>PENDING</code> or <code>RUNNING</code>
  /// state.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidOperationException].
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
  /// Amazon S3 bucket, or a delivery stream in Firehose.
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
  /// You can't update an existing delivery. You can only create and delete
  /// deliveries.
  ///
  /// May throw [ServiceUnavailableException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [deliveryDestinationArn] :
  /// The ARN of the delivery destination to use for this delivery.
  ///
  /// Parameter [deliverySourceName] :
  /// The name of the delivery source to use for this delivery.
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
  /// Time-based sorting on chunks of log data inside an exported file is not
  /// guaranteed. You can sort the exported log field data by using Linux
  /// utilities.
  /// </note>
  ///
  /// May throw [InvalidParameterException].
  /// May throw [LimitExceededException].
  /// May throw [OperationAbortedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceAlreadyExistsException].
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
  /// <i>dynamic tokens</i> and represented by <code>&lt;*&gt;</code>.
  ///
  /// The following is an example of a pattern:
  ///
  /// <code>[INFO] Request time: &lt;*&gt; ms</code>
  ///
  /// This pattern represents log events like <code>[INFO] Request time: 327
  /// ms</code> and other similar log events that differ only by the number, in
  /// this csse 327. When the pattern is displayed, the different numbers are
  /// replaced by <code>&lt;*&gt;</code>
  /// <note>
  /// Any parts of log events that are masked as sensitive data are not scanned
  /// for anomalies. For more information about masking sensitive data, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/mask-sensitive-log-data.html">Help
  /// protect sensitive log data with masking</a>.
  /// </note>
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [OperationAbortedException].
  /// May throw [LimitExceededException].
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
  /// For more information about using a KMS key and to see the required IAM
  /// policy, see <a
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
          'evaluationFrequency': evaluationFrequency.toValue(),
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
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [LimitExceededException].
  /// May throw [OperationAbortedException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [logGroupName] :
  /// A name for the log group.
  ///
  /// Parameter [kmsKeyId] :
  /// The Amazon Resource Name (ARN) of the KMS key to use when encrypting log
  /// data. For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-kms">Amazon
  /// Resource Names</a>.
  ///
  /// Parameter [logGroupClass] :
  /// Use this parameter to specify the log group class for this log group.
  /// There are two classes:
  ///
  /// <ul>
  /// <li>
  /// The <code>Standard</code> log class supports all CloudWatch Logs features.
  /// </li>
  /// <li>
  /// The <code>Infrequent Access</code> log class supports a subset of
  /// CloudWatch Logs features and incurs lower costs.
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
        if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
        if (logGroupClass != null) 'logGroupClass': logGroupClass.toValue(),
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

  /// Deletes a CloudWatch Logs account policy. This stops the policy from
  /// applying to all log groups or a subset of log groups in the account.
  /// Log-group level policies will still be in effect.
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
  /// </ul>
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [OperationAbortedException].
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
        'policyType': policyType.toValue(),
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

  /// Deletes s <i>delivery</i>. A delivery is a connection between a logical
  /// <i>delivery source</i> and a logical <i>delivery destination</i>. Deleting
  /// a delivery only deletes the connection between the delivery source and
  /// delivery destination. It does not delete the delivery destination or the
  /// delivery source.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [name] :
  /// The name of the delivery destination that you want to delete. You can find
  /// a list of delivery destionation names by using the <a
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
  /// May throw [ServiceUnavailableException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [OperationAbortedException].
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

  /// Deletes the specified CloudWatch Logs anomaly detector.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [OperationAbortedException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [OperationAbortedException].
  /// May throw [ServiceUnavailableException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [OperationAbortedException].
  /// May throw [ServiceUnavailableException].
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

  /// Deletes the specified metric filter.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [OperationAbortedException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [policyName] :
  /// The name of the policy to be revoked. This parameter is required.
  Future<void> deleteResourcePolicy({
    String? policyName,
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
        if (policyName != null) 'policyName': policyName,
      },
    );
  }

  /// Deletes the specified retention policy.
  ///
  /// Log events do not expire if they belong to log groups without a retention
  /// policy.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [OperationAbortedException].
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

  /// Deletes the specified subscription filter.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [OperationAbortedException].
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

  /// Returns a list of all CloudWatch Logs account policies in the account.
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
  /// Parameter [policyName] :
  /// Use this parameter to limit the returned policies to only the policy with
  /// the name that you specify.
  Future<DescribeAccountPoliciesResponse> describeAccountPolicies({
    required PolicyType policyType,
    List<String>? accountIdentifiers,
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
        'policyType': policyType.toValue(),
        if (accountIdentifiers != null)
          'accountIdentifiers': accountIdentifiers,
        if (policyName != null) 'policyName': policyName,
      },
    );

    return DescribeAccountPoliciesResponse.fromJson(jsonResponse.body);
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
  /// Logs, Amazon S3, or Firehose. Only some Amazon Web Services services
  /// support being configured as a delivery source. These services are listed
  /// in <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AWS-logs-and-resource-policy.html">Enable
  /// logging from Amazon Web Services services.</a>
  ///
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
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
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
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
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
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
        if (statusCode != null) 'statusCode': statusCode.toValue(),
        if (taskId != null) 'taskId': taskId,
      },
    );

    return DescribeExportTasksResponse.fromJson(jsonResponse.body);
  }

  /// Lists the specified log groups. You can list all your log groups or filter
  /// the results by prefix. The results are ASCII-sorted by log group name.
  ///
  /// CloudWatch Logs doesn’t support IAM policies that control access to the
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
  /// When <code>includeLinkedAccounts</code> is set to <code>True</code>, use
  /// this parameter to specify the list of accounts to search. You can specify
  /// as many as 20 account IDs in the array.
  ///
  /// Parameter [includeLinkedAccounts] :
  /// If you are using a monitoring account, set this to <code>True</code> to
  /// have the operation return log groups in the accounts listed in
  /// <code>accountIdentifiers</code>.
  ///
  /// If this parameter is set to <code>true</code> and
  /// <code>accountIdentifiers</code> contains a null value, the operation
  /// returns all log groups in the monitoring account and all log groups in all
  /// source accounts that are linked to the monitoring account.
  ///
  /// Parameter [limit] :
  /// The maximum number of items returned. If you don't specify a value, the
  /// default is up to 50 items.
  ///
  /// Parameter [logGroupClass] :
  /// Specifies the log group class for this log group. There are two classes:
  ///
  /// <ul>
  /// <li>
  /// The <code>Standard</code> log class supports all CloudWatch Logs features.
  /// </li>
  /// <li>
  /// The <code>Infrequent Access</code> log class supports a subset of
  /// CloudWatch Logs features and incurs lower costs.
  /// </li>
  /// </ul>
  /// For details about the features supported by each class, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch_Logs_Log_Classes.html">Log
  /// classes</a>
  ///
  /// Parameter [logGroupNamePattern] :
  /// If you specify a string for this parameter, the operation returns only log
  /// groups that have names that match the string based on a case-sensitive
  /// substring search. For example, if you specify <code>Foo</code>, log groups
  /// named <code>FooBar</code>, <code>aws/Foo</code>, and <code>GroupFoo</code>
  /// would match, but <code>foo</code>, <code>F/o/o</code> and
  /// <code>Froo</code> would not match.
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
        if (logGroupClass != null) 'logGroupClass': logGroupClass.toValue(),
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
  /// This operation has a limit of five transactions per second, after which
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
        if (orderBy != null) 'orderBy': orderBy.toValue(),
      },
    );

    return DescribeLogStreamsResponse.fromJson(jsonResponse.body);
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
  /// Parameter [status] :
  /// Limits the returned queries to only those that have the specified status.
  /// Valid values are <code>Cancelled</code>, <code>Complete</code>,
  /// <code>Failed</code>, <code>Running</code>, and <code>Scheduled</code>.
  Future<DescribeQueriesResponse> describeQueries({
    String? logGroupName,
    int? maxResults,
    String? nextToken,
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
        if (status != null) 'status': status.toValue(),
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
  Future<DescribeQueryDefinitionsResponse> describeQueryDefinitions({
    int? maxResults,
    String? nextToken,
    String? queryDefinitionNamePrefix,
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
  Future<DescribeResourcePoliciesResponse> describeResourcePolicies({
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
  /// May throw [ResourceNotFoundException].
  /// May throw [OperationAbortedException].
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

  /// Lists log events from the specified log group. You can list all the log
  /// events or filter the results using a filter pattern, a time range, and the
  /// name of the log stream.
  ///
  /// You must have the <code>logs:FilterLogEvents</code> permission to perform
  /// this operation.
  ///
  /// You can specify the log group to search by using either
  /// <code>logGroupIdentifier</code> or <code>logGroupName</code>. You must
  /// include one of these two parameters, but you can't include both.
  ///
  /// By default, this operation returns as many log events as can fit in 1 MB
  /// (up to 10,000 log events) or all the events found within the specified
  /// time range. If the results include a token, that means there are more log
  /// events available. You can get additional results by specifying the token
  /// in a subsequent call. This operation can return empty results while there
  /// are more log events available through the token.
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
  /// <code>logStreamNames</code>, but the value for
  /// <code>logStreamNamePrefix</code> does not match any log stream names
  /// specified in <code>logStreamNames</code>, the action returns an
  /// <code>InvalidParameterException</code> error.
  ///
  /// Parameter [logStreamNames] :
  /// Filters the results to only logs from the log streams in this list.
  ///
  /// If you specify a value for both <code>logStreamNamePrefix</code> and
  /// <code>logStreamNames</code>, the action returns an
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
  /// May throw [ServiceUnavailableException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
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
  /// May throw [ServiceUnavailableException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
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
  /// May throw [ServiceUnavailableException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
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
  /// May throw [ServiceUnavailableException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
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

  /// Retrieves information about the log anomaly detector that you specify.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [OperationAbortedException].
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
  /// By default, this operation returns as many log events as can fit in a
  /// response size of 1MB (up to 10,000 log events). You can get additional log
  /// events by specifying one of the tokens in a subsequent call. This
  /// operation can return empty results while there are more log events
  /// available through the token.
  ///
  /// If you are using CloudWatch cross-account observability, you can use this
  /// operation in a monitoring account and view data from the linked source
  /// accounts. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Unified-Cross-Account.html">CloudWatch
  /// cross-account observability</a>.
  ///
  /// You can specify the log group to search by using either
  /// <code>logGroupIdentifier</code> or <code>logGroupName</code>. You must
  /// include one of these two parameters, but you can't include both.
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

  /// Returns a list of the fields that are included in log events in the
  /// specified log group. Includes the percentage of log events that contain
  /// each field. The search is limited to a time period that you specify.
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
  Future<GetQueryResultsResponse> getQueryResults({
    required String queryId,
  }) async {
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
      },
    );

    return GetQueryResultsResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of anomalies that log anomaly detectors have found. For
  /// details about the structure format of each anomaly object that is
  /// returned, see the example in this section.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [OperationAbortedException].
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
          'suppressionState': suppressionState.toValue(),
      },
    );

    return ListAnomaliesResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves a list of the log anomaly detectors in the account.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [OperationAbortedException].
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
  @Deprecated('Please use the generic tagging API ListTagsForResource')
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

  /// Creates an account-level data protection policy or subscription filter
  /// policy that applies to all log groups or a subset of log groups in the
  /// account.
  ///
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
  /// Each account can have one account-level subscription filter policy. If you
  /// are updating an existing filter, you must specify the correct name in
  /// <code>PolicyName</code>. To perform a <code>PutAccountPolicy</code>
  /// subscription filter operation for any destination except a Lambda
  /// function, you must also have the <code>iam:PassRole</code> permission.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [OperationAbortedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [LimitExceededException].
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
  /// <b>Distribution</b>The method used to distribute log data to the
  /// destination. By default, log data is grouped by log stream, but the
  /// grouping can be set to <code>Random</code> for a more even distribution.
  /// This property is only applicable when the destination is an Kinesis Data
  /// Streams data stream.
  /// </li>
  /// </ul>
  ///
  /// Parameter [policyName] :
  /// A name for the policy. This must be unique within the account.
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
  /// Use this parameter to apply the subscription filter policy to a subset of
  /// log groups in the account. Currently, the only supported filter is
  /// <code>LogGroupName NOT IN []</code>. The <code>selectionCriteria</code>
  /// string can be up to 25KB in length. The length is determined by using its
  /// UTF-8 bytes.
  ///
  /// Using the <code>selectionCriteria</code> parameter is useful to help
  /// prevent infinite loops. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/Subscriptions-recursion-prevention.html">Log
  /// recursion prevention</a>.
  ///
  /// Specifing <code>selectionCriteria</code> is valid only when you specify
  /// <code> SUBSCRIPTION_FILTER_POLICY</code> for <code>policyType</code>.
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
        'policyType': policyType.toValue(),
        if (scope != null) 'scope': scope.toValue(),
        if (selectionCriteria != null) 'selectionCriteria': selectionCriteria,
      },
    );

    return PutAccountPolicyResponse.fromJson(jsonResponse.body);
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
  /// and Firehose are supported as logs delivery destinations.
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
  /// destination</i>, which is a logical object that represents the actual
  /// delivery destination.
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
  /// May throw [ServiceUnavailableException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [deliveryDestinationConfiguration] :
  /// A structure that contains the ARN of the Amazon Web Services resource that
  /// will receive the logs.
  ///
  /// Parameter [name] :
  /// A name for this delivery destination. This name must be unique for all
  /// delivery destinations in your account.
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
    required DeliveryDestinationConfiguration deliveryDestinationConfiguration,
    required String name,
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
        'deliveryDestinationConfiguration': deliveryDestinationConfiguration,
        'name': name,
        if (outputFormat != null) 'outputFormat': outputFormat.toValue(),
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
  /// May throw [ServiceUnavailableException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
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
  /// or Firehose.
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
  /// May throw [ServiceUnavailableException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [logType] :
  /// Defines the type of log that the source is sending.
  ///
  /// <ul>
  /// <li>
  /// For Amazon CodeWhisperer, the valid value is <code>EVENT_LOGS</code>.
  /// </li>
  /// <li>
  /// For IAM Identity Centerr, the valid value is <code>ERROR_LOGS</code>.
  /// </li>
  /// <li>
  /// For Amazon WorkMail, the valid values are
  /// <code>ACCESS_CONTROL_LOGS</code>, <code>AUTHENTICATION_LOGS</code>,
  /// <code>WORKMAIL_AVAILABILITY_PROVIDER_LOGS</code>, and
  /// <code>WORKMAIL_MAILBOX_ACCESS_LOGS</code>.
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
  /// None of the log events in the batch can be more than 2 hours in the
  /// future.
  /// </li>
  /// <li>
  /// None of the log events in the batch can be more than 14 days in the past.
  /// Also, none of the log events can be from earlier than the retention period
  /// of the log group.
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
  /// A batch of log events in a single request cannot span more than 24 hours.
  /// Otherwise, the operation fails.
  /// </li>
  /// <li>
  /// Each log event can be no larger than 256 KB.
  /// </li>
  /// <li>
  /// The maximum number of log events in a batch is 10,000.
  /// </li>
  /// <li> <important>
  /// The quota of five requests per second per log stream has been removed.
  /// Instead, <code>PutLogEvents</code> actions are throttled based on a
  /// per-second per-account quota. You can request an increase to the
  /// per-second throttling quota by using the Service Quotas service.
  /// </important> </li>
  /// </ul>
  /// If a call to <code>PutLogEvents</code> returns
  /// "UnrecognizedClientException" the most likely cause is a non-valid Amazon
  /// Web Services access key ID or secret key.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InvalidSequenceTokenException].
  /// May throw [DataAlreadyAcceptedException].
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
        if (sequenceToken != null) 'sequenceToken': sequenceToken,
      },
    );

    return PutLogEventsResponse.fromJson(jsonResponse.body);
  }

  /// Creates or updates a metric filter and associates it with the specified
  /// log group. With metric filters, you can configure rules to extract metric
  /// data from log events ingested through <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutLogEvents.html">PutLogEvents</a>.
  ///
  /// The maximum number of metric filters that can be associated with a log
  /// group is 100.
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
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [OperationAbortedException].
  /// May throw [LimitExceededException].
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
  Future<void> putMetricFilter({
    required String filterName,
    required String filterPattern,
    required String logGroupName,
    required List<MetricTransformation> metricTransformations,
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
  /// definition.
  ///
  /// If you are updating a query definition and you omit this parameter, then
  /// the updated definition will contain no log groups.
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
  Future<PutQueryDefinitionResponse> putQueryDefinition({
    required String name,
    required String queryString,
    String? clientToken,
    List<String>? logGroupNames,
    String? queryDefinitionId,
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
        if (queryDefinitionId != null) 'queryDefinitionId': queryDefinitionId,
      },
    );

    return PutQueryDefinitionResponse.fromJson(jsonResponse.body);
  }

  /// Creates or updates a resource policy allowing other Amazon Web Services
  /// services to put log events to this account, such as Amazon Route 53. An
  /// account can have up to 10 resource policies per Amazon Web Services
  /// Region.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceUnavailableException].
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
  /// <code>SourceArn</code> with the resource making the call from Route 53 to
  /// CloudWatch Logs. You would also replace the value of
  /// <code>SourceAccount</code> with the Amazon Web Services account ID making
  /// that call.
  /// <p/>
  /// <code>{ "Version": "2012-10-17", "Statement": [ { "Sid":
  /// "Route53LogsToCloudWatchLogs", "Effect": "Allow", "Principal": {
  /// "Service": [ "route53.amazonaws.com" ] }, "Action": "logs:PutLogEvents",
  /// "Resource": "logArn", "Condition": { "ArnLike": { "aws:SourceArn":
  /// "myRoute53ResourceArn" }, "StringEquals": { "aws:SourceAccount":
  /// "myAwsAccountId" } } } ] }</code>
  ///
  /// Parameter [policyName] :
  /// Name of the new policy. This parameter is required.
  Future<PutResourcePolicyResponse> putResourcePolicy({
    String? policyDocument,
    String? policyName,
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
        if (policyDocument != null) 'policyDocument': policyDocument,
        if (policyName != null) 'policyName': policyName,
      },
    );

    return PutResourcePolicyResponse.fromJson(jsonResponse.body);
  }

  /// Sets the retention of the specified log group. With a retention policy,
  /// you can configure the number of days for which to retain log events in the
  /// specified log group.
  /// <note>
  /// CloudWatch Logs doesn’t immediately delete log events when they reach
  /// their retention setting. It typically takes up to 72 hours after that
  /// before log events are deleted, but in rare situations might take longer.
  ///
  /// To illustrate, imagine that you change a log group to have a longer
  /// retention setting when it contains log events that are past the expiration
  /// date, but haven’t been deleted. Those log events will take up to 72 hours
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
  /// May throw [ResourceNotFoundException].
  /// May throw [OperationAbortedException].
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
  /// To perform a <code>PutSubscriptionFilter</code> operation for any
  /// destination except a Lambda function, you must also have the
  /// <code>iam:PassRole</code> permission.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [OperationAbortedException].
  /// May throw [LimitExceededException].
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
  /// Parameter [distribution] :
  /// The method used to distribute log data to the destination. By default, log
  /// data is grouped by log stream, but the grouping can be set to random for a
  /// more even distribution. This property is only applicable when the
  /// destination is an Amazon Kinesis data stream.
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
    Distribution? distribution,
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
        if (distribution != null) 'distribution': distribution.toValue(),
        if (roleArn != null) 'roleArn': roleArn,
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
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_SessionStreamingException.html">SessionStreamingException</a>
  /// object is returned if an unknown error occurs on the server side.
  /// </li>
  /// <li>
  /// A <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_SessionTimeoutException.html">SessionTimeoutException</a>
  /// object is returned when the session times out, after it has been kept open
  /// for three hours.
  /// </li>
  /// </ul> <important>
  /// You can end a session before it times out by closing the session stream or
  /// by closing the client that is receiving the stream. The session also ends
  /// if the established connection between the client and the server breaks.
  /// </important>
  /// For examples of using an SDK to start a Live Tail session, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/example_cloudwatch-logs_StartLiveTail_section.html">
  /// Start a Live Tail session using an Amazon Web Services SDK</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidOperationException].
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

  /// Schedules a query of a log group using CloudWatch Logs Insights. You
  /// specify the log group and time range to query and the query string to use.
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
  /// You can have up to 30 concurrent CloudWatch Logs insights queries,
  /// including queries that have been added to dashboards.
  ///
  /// May throw [MalformedQueryException].
  /// May throw [InvalidParameterException].
  /// May throw [LimitExceededException].
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
  /// their values are returned. The default is 1000.
  ///
  /// Parameter [logGroupIdentifiers] :
  /// The list of log groups to query. You can include up to 50 log groups.
  ///
  /// You can specify them by the log group name or ARN. If a log group that
  /// you're querying is in a source account and you're using a monitoring
  /// account, you must specify the ARN of the log group here. The query
  /// definition must also be defined in the monitoring account.
  ///
  /// If you specify an ARN, the ARN can't end with an asterisk (*).
  ///
  /// A <code>StartQuery</code> operation must include exactly one of the
  /// following parameters: <code>logGroupName</code>,
  /// <code>logGroupNames</code>, or <code>logGroupIdentifiers</code>.
  ///
  /// Parameter [logGroupName] :
  /// The log group on which to perform the query.
  /// <note>
  /// A <code>StartQuery</code> operation must include exactly one of the
  /// following parameters: <code>logGroupName</code>,
  /// <code>logGroupNames</code>, or <code>logGroupIdentifiers</code>.
  /// </note>
  ///
  /// Parameter [logGroupNames] :
  /// The list of log groups to be queried. You can include up to 50 log groups.
  /// <note>
  /// A <code>StartQuery</code> operation must include exactly one of the
  /// following parameters: <code>logGroupName</code>,
  /// <code>logGroupNames</code>, or <code>logGroupIdentifiers</code>.
  /// </note>
  Future<StartQueryResponse> startQuery({
    required int endTime,
    required String queryString,
    required int startTime,
    int? limit,
    List<String>? logGroupIdentifiers,
    String? logGroupName,
    List<String>? logGroupNames,
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
      10000,
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
      },
    );

    return StartQueryResponse.fromJson(jsonResponse.body);
  }

  /// Stops a CloudWatch Logs Insights query that is in progress. If the query
  /// has already ended, the operation returns an error indicating that the
  /// specified query is not running.
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
  /// CloudWatch Logs doesn’t support IAM policies that prevent users from
  /// assigning specified tags to log groups using the
  /// <code>aws:Resource/<i>key-name</i> </code> or <code>aws:TagKeys</code>
  /// condition keys. For more information about using tags to control access,
  /// see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_tags.html">Controlling
  /// access to Amazon Web Services resources using tags</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [logGroupName] :
  /// The name of the log group.
  ///
  /// Parameter [tags] :
  /// The key-value pairs to use for the tags.
  @Deprecated('Please use the generic tagging API TagResource')
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
  /// CloudWatch Logs doesn’t support IAM policies that prevent users from
  /// assigning specified tags to log groups using the
  /// <code>aws:Resource/<i>key-name</i> </code> or <code>aws:TagKeys</code>
  /// condition keys.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [logGroupName] :
  /// The name of the log group.
  ///
  /// Parameter [tags] :
  /// The tag keys. The corresponding tags are removed from the log group.
  @Deprecated('Please use the generic tagging API UntagResource')
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
  /// anomaly or pattern. If you suppress an anomaly, CloudWatch Logs won’t
  /// report new occurrences of that anomaly and won't update that anomaly with
  /// new data. If you suppress a pattern, CloudWatch Logs won’t report any
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
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [OperationAbortedException].
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
        if (patternId != null) 'patternId': patternId,
        if (suppressionPeriod != null) 'suppressionPeriod': suppressionPeriod,
        if (suppressionType != null)
          'suppressionType': suppressionType.toValue(),
      },
    );
  }

  /// Updates an existing log anomaly detector.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [OperationAbortedException].
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
          'evaluationFrequency': evaluationFrequency.toValue(),
        if (filterPattern != null) 'filterPattern': filterPattern,
      },
    );
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

  /// The log group selection criteria for this subscription filter policy.
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
      policyType: (json['policyType'] as String?)?.toPolicyType(),
      scope: (json['scope'] as String?)?.toScope(),
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
      if (policyType != null) 'policyType': policyType.toValue(),
      if (scope != null) 'scope': scope.toValue(),
      if (selectionCriteria != null) 'selectionCriteria': selectionCriteria,
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
      active: json['active'] as bool,
      anomalyDetectorArn: json['anomalyDetectorArn'] as String,
      anomalyId: json['anomalyId'] as String,
      description: json['description'] as String,
      firstSeen: json['firstSeen'] as int,
      histogram: (json['histogram'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(k, e as int)),
      lastSeen: json['lastSeen'] as int,
      logGroupArnList: (json['logGroupArnList'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      logSamples: (json['logSamples'] as List)
          .whereNotNull()
          .map((e) => LogEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
      patternId: json['patternId'] as String,
      patternString: json['patternString'] as String,
      patternTokens: (json['patternTokens'] as List)
          .whereNotNull()
          .map((e) => PatternToken.fromJson(e as Map<String, dynamic>))
          .toList(),
      state: (json['state'] as String).toState(),
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
      'state': state.toValue(),
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

  /// The ID of the KMS key assigned to this anomaly detector, if any.
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
      anomalyDetectorStatus:
          (json['anomalyDetectorStatus'] as String?)?.toAnomalyDetectorStatus(),
      anomalyVisibilityTime: json['anomalyVisibilityTime'] as int?,
      creationTimeStamp: json['creationTimeStamp'] as int?,
      detectorName: json['detectorName'] as String?,
      evaluationFrequency:
          (json['evaluationFrequency'] as String?)?.toEvaluationFrequency(),
      filterPattern: json['filterPattern'] as String?,
      kmsKeyId: json['kmsKeyId'] as String?,
      lastModifiedTimeStamp: json['lastModifiedTimeStamp'] as int?,
      logGroupArnList: (json['logGroupArnList'] as List?)
          ?.whereNotNull()
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
        'anomalyDetectorStatus': anomalyDetectorStatus.toValue(),
      if (anomalyVisibilityTime != null)
        'anomalyVisibilityTime': anomalyVisibilityTime,
      if (creationTimeStamp != null) 'creationTimeStamp': creationTimeStamp,
      if (detectorName != null) 'detectorName': detectorName,
      if (evaluationFrequency != null)
        'evaluationFrequency': evaluationFrequency.toValue(),
      if (filterPattern != null) 'filterPattern': filterPattern,
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
      if (lastModifiedTimeStamp != null)
        'lastModifiedTimeStamp': lastModifiedTimeStamp,
      if (logGroupArnList != null) 'logGroupArnList': logGroupArnList,
    };
  }
}

enum AnomalyDetectorStatus {
  initializing,
  training,
  analyzing,
  failed,
  deleted,
  paused,
}

extension AnomalyDetectorStatusValueExtension on AnomalyDetectorStatus {
  String toValue() {
    switch (this) {
      case AnomalyDetectorStatus.initializing:
        return 'INITIALIZING';
      case AnomalyDetectorStatus.training:
        return 'TRAINING';
      case AnomalyDetectorStatus.analyzing:
        return 'ANALYZING';
      case AnomalyDetectorStatus.failed:
        return 'FAILED';
      case AnomalyDetectorStatus.deleted:
        return 'DELETED';
      case AnomalyDetectorStatus.paused:
        return 'PAUSED';
    }
  }
}

extension AnomalyDetectorStatusFromString on String {
  AnomalyDetectorStatus toAnomalyDetectorStatus() {
    switch (this) {
      case 'INITIALIZING':
        return AnomalyDetectorStatus.initializing;
      case 'TRAINING':
        return AnomalyDetectorStatus.training;
      case 'ANALYZING':
        return AnomalyDetectorStatus.analyzing;
      case 'FAILED':
        return AnomalyDetectorStatus.failed;
      case 'DELETED':
        return AnomalyDetectorStatus.deleted;
      case 'PAUSED':
        return AnomalyDetectorStatus.paused;
    }
    throw Exception('$this is not known in enum AnomalyDetectorStatus');
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

enum DataProtectionStatus {
  activated,
  deleted,
  archived,
  disabled,
}

extension DataProtectionStatusValueExtension on DataProtectionStatus {
  String toValue() {
    switch (this) {
      case DataProtectionStatus.activated:
        return 'ACTIVATED';
      case DataProtectionStatus.deleted:
        return 'DELETED';
      case DataProtectionStatus.archived:
        return 'ARCHIVED';
      case DataProtectionStatus.disabled:
        return 'DISABLED';
    }
  }
}

extension DataProtectionStatusFromString on String {
  DataProtectionStatus toDataProtectionStatus() {
    switch (this) {
      case 'ACTIVATED':
        return DataProtectionStatus.activated;
      case 'DELETED':
        return DataProtectionStatus.deleted;
      case 'ARCHIVED':
        return DataProtectionStatus.archived;
      case 'DISABLED':
        return DataProtectionStatus.disabled;
    }
    throw Exception('$this is not known in enum DataProtectionStatus');
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

/// This structure contains information about one <i>delivery</i> in your
/// account.
///
/// A delivery is a connection between a logical <i>delivery source</i> and a
/// logical <i>delivery destination</i>.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_CreateDelivery.html">CreateDelivery</a>.
///
/// You can't update an existing delivery. You can only create and delete
/// deliveries.
class Delivery {
  /// The Amazon Resource Name (ARN) that uniquely identifies this delivery.
  final String? arn;

  /// The ARN of the delivery destination that is associated with this delivery.
  final String? deliveryDestinationArn;

  /// Displays whether the delivery destination associated with this delivery is
  /// CloudWatch Logs, Amazon S3, or Firehose.
  final DeliveryDestinationType? deliveryDestinationType;

  /// The name of the delivery source that is associated with this delivery.
  final String? deliverySourceName;

  /// The unique ID that identifies this delivery in your account.
  final String? id;

  /// The tags that have been assigned to this delivery.
  final Map<String, String>? tags;

  Delivery({
    this.arn,
    this.deliveryDestinationArn,
    this.deliveryDestinationType,
    this.deliverySourceName,
    this.id,
    this.tags,
  });

  factory Delivery.fromJson(Map<String, dynamic> json) {
    return Delivery(
      arn: json['arn'] as String?,
      deliveryDestinationArn: json['deliveryDestinationArn'] as String?,
      deliveryDestinationType: (json['deliveryDestinationType'] as String?)
          ?.toDeliveryDestinationType(),
      deliverySourceName: json['deliverySourceName'] as String?,
      id: json['id'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final deliveryDestinationArn = this.deliveryDestinationArn;
    final deliveryDestinationType = this.deliveryDestinationType;
    final deliverySourceName = this.deliverySourceName;
    final id = this.id;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (deliveryDestinationArn != null)
        'deliveryDestinationArn': deliveryDestinationArn,
      if (deliveryDestinationType != null)
        'deliveryDestinationType': deliveryDestinationType.toValue(),
      if (deliverySourceName != null) 'deliverySourceName': deliverySourceName,
      if (id != null) 'id': id,
      if (tags != null) 'tags': tags,
    };
  }
}

/// This structure contains information about one <i>delivery destination</i> in
/// your account. A delivery destination is an Amazon Web Services resource that
/// represents an Amazon Web Services service that logs can be sent to.
/// CloudWatch Logs, Amazon S3, are supported as Firehose delivery destinations.
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

  /// Displays whether this delivery destination is CloudWatch Logs, Amazon S3, or
  /// Firehose.
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
          ?.toDeliveryDestinationType(),
      name: json['name'] as String?,
      outputFormat: (json['outputFormat'] as String?)?.toOutputFormat(),
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
        'deliveryDestinationType': deliveryDestinationType.toValue(),
      if (name != null) 'name': name,
      if (outputFormat != null) 'outputFormat': outputFormat.toValue(),
      if (tags != null) 'tags': tags,
    };
  }
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
      destinationResourceArn: json['destinationResourceArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final destinationResourceArn = this.destinationResourceArn;
    return {
      'destinationResourceArn': destinationResourceArn,
    };
  }
}

enum DeliveryDestinationType {
  s3,
  cwl,
  fh,
}

extension DeliveryDestinationTypeValueExtension on DeliveryDestinationType {
  String toValue() {
    switch (this) {
      case DeliveryDestinationType.s3:
        return 'S3';
      case DeliveryDestinationType.cwl:
        return 'CWL';
      case DeliveryDestinationType.fh:
        return 'FH';
    }
  }
}

extension DeliveryDestinationTypeFromString on String {
  DeliveryDestinationType toDeliveryDestinationType() {
    switch (this) {
      case 'S3':
        return DeliveryDestinationType.s3;
      case 'CWL':
        return DeliveryDestinationType.cwl;
      case 'FH':
        return DeliveryDestinationType.fh;
    }
    throw Exception('$this is not known in enum DeliveryDestinationType');
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

  /// The tags that have been assigned to this delivery source.
  final Map<String, String>? tags;

  DeliverySource({
    this.arn,
    this.logType,
    this.name,
    this.resourceArns,
    this.service,
    this.tags,
  });

  factory DeliverySource.fromJson(Map<String, dynamic> json) {
    return DeliverySource(
      arn: json['arn'] as String?,
      logType: json['logType'] as String?,
      name: json['name'] as String?,
      resourceArns: (json['resourceArns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      service: json['service'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final logType = this.logType;
    final name = this.name;
    final resourceArns = this.resourceArns;
    final service = this.service;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (logType != null) 'logType': logType,
      if (name != null) 'name': name,
      if (resourceArns != null) 'resourceArns': resourceArns,
      if (service != null) 'service': service,
      if (tags != null) 'tags': tags,
    };
  }
}

class DescribeAccountPoliciesResponse {
  /// An array of structures that contain information about the CloudWatch Logs
  /// account policies that match the specified filters.
  final List<AccountPolicy>? accountPolicies;

  DescribeAccountPoliciesResponse({
    this.accountPolicies,
  });

  factory DescribeAccountPoliciesResponse.fromJson(Map<String, dynamic> json) {
    return DescribeAccountPoliciesResponse(
      accountPolicies: (json['accountPolicies'] as List?)
          ?.whereNotNull()
          .map((e) => AccountPolicy.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final accountPolicies = this.accountPolicies;
    return {
      if (accountPolicies != null) 'accountPolicies': accountPolicies,
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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

class DescribeLogGroupsResponse {
  /// The log groups.
  ///
  /// If the <code>retentionInDays</code> value is not included for a log group,
  /// then that log group's events do not expire.
  final List<LogGroup>? logGroups;
  final String? nextToken;

  DescribeLogGroupsResponse({
    this.logGroups,
    this.nextToken,
  });

  factory DescribeLogGroupsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeLogGroupsResponse(
      logGroups: (json['logGroups'] as List?)
          ?.whereNotNull()
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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

/// The method used to distribute log data to the destination, which can be
/// either random or grouped by log stream.
enum Distribution {
  random,
  byLogStream,
}

extension DistributionValueExtension on Distribution {
  String toValue() {
    switch (this) {
      case Distribution.random:
        return 'Random';
      case Distribution.byLogStream:
        return 'ByLogStream';
    }
  }
}

extension DistributionFromString on String {
  Distribution toDistribution() {
    switch (this) {
      case 'Random':
        return Distribution.random;
      case 'ByLogStream':
        return Distribution.byLogStream;
    }
    throw Exception('$this is not known in enum Distribution');
  }
}

enum EvaluationFrequency {
  oneMin,
  fiveMin,
  tenMin,
  fifteenMin,
  thirtyMin,
  oneHour,
}

extension EvaluationFrequencyValueExtension on EvaluationFrequency {
  String toValue() {
    switch (this) {
      case EvaluationFrequency.oneMin:
        return 'ONE_MIN';
      case EvaluationFrequency.fiveMin:
        return 'FIVE_MIN';
      case EvaluationFrequency.tenMin:
        return 'TEN_MIN';
      case EvaluationFrequency.fifteenMin:
        return 'FIFTEEN_MIN';
      case EvaluationFrequency.thirtyMin:
        return 'THIRTY_MIN';
      case EvaluationFrequency.oneHour:
        return 'ONE_HOUR';
    }
  }
}

extension EvaluationFrequencyFromString on String {
  EvaluationFrequency toEvaluationFrequency() {
    switch (this) {
      case 'ONE_MIN':
        return EvaluationFrequency.oneMin;
      case 'FIVE_MIN':
        return EvaluationFrequency.fiveMin;
      case 'TEN_MIN':
        return EvaluationFrequency.tenMin;
      case 'FIFTEEN_MIN':
        return EvaluationFrequency.fifteenMin;
      case 'THIRTY_MIN':
        return EvaluationFrequency.thirtyMin;
      case 'ONE_HOUR':
        return EvaluationFrequency.oneHour;
    }
    throw Exception('$this is not known in enum EvaluationFrequency');
  }
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
      code: (json['code'] as String?)?.toExportTaskStatusCode(),
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    return {
      if (code != null) 'code': code.toValue(),
      if (message != null) 'message': message,
    };
  }
}

enum ExportTaskStatusCode {
  cancelled,
  completed,
  failed,
  pending,
  pendingCancel,
  running,
}

extension ExportTaskStatusCodeValueExtension on ExportTaskStatusCode {
  String toValue() {
    switch (this) {
      case ExportTaskStatusCode.cancelled:
        return 'CANCELLED';
      case ExportTaskStatusCode.completed:
        return 'COMPLETED';
      case ExportTaskStatusCode.failed:
        return 'FAILED';
      case ExportTaskStatusCode.pending:
        return 'PENDING';
      case ExportTaskStatusCode.pendingCancel:
        return 'PENDING_CANCEL';
      case ExportTaskStatusCode.running:
        return 'RUNNING';
    }
  }
}

extension ExportTaskStatusCodeFromString on String {
  ExportTaskStatusCode toExportTaskStatusCode() {
    switch (this) {
      case 'CANCELLED':
        return ExportTaskStatusCode.cancelled;
      case 'COMPLETED':
        return ExportTaskStatusCode.completed;
      case 'FAILED':
        return ExportTaskStatusCode.failed;
      case 'PENDING':
        return ExportTaskStatusCode.pending;
      case 'PENDING_CANCEL':
        return ExportTaskStatusCode.pendingCancel;
      case 'RUNNING':
        return ExportTaskStatusCode.running;
    }
    throw Exception('$this is not known in enum ExportTaskStatusCode');
  }
}

class FilterLogEventsResponse {
  /// The matched events.
  final List<FilteredLogEvent>? events;

  /// The token to use when requesting the next set of items. The token expires
  /// after 24 hours.
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
          ?.whereNotNull()
          .map((e) => FilteredLogEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
      searchedLogStreams: (json['searchedLogStreams'] as List?)
          ?.whereNotNull()
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

  /// The ID of the KMS key assigned to this anomaly detector, if any.
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
      anomalyDetectorStatus:
          (json['anomalyDetectorStatus'] as String?)?.toAnomalyDetectorStatus(),
      anomalyVisibilityTime: json['anomalyVisibilityTime'] as int?,
      creationTimeStamp: json['creationTimeStamp'] as int?,
      detectorName: json['detectorName'] as String?,
      evaluationFrequency:
          (json['evaluationFrequency'] as String?)?.toEvaluationFrequency(),
      filterPattern: json['filterPattern'] as String?,
      kmsKeyId: json['kmsKeyId'] as String?,
      lastModifiedTimeStamp: json['lastModifiedTimeStamp'] as int?,
      logGroupArnList: (json['logGroupArnList'] as List?)
          ?.whereNotNull()
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
        'anomalyDetectorStatus': anomalyDetectorStatus.toValue(),
      if (anomalyVisibilityTime != null)
        'anomalyVisibilityTime': anomalyVisibilityTime,
      if (creationTimeStamp != null) 'creationTimeStamp': creationTimeStamp,
      if (detectorName != null) 'detectorName': detectorName,
      if (evaluationFrequency != null)
        'evaluationFrequency': evaluationFrequency.toValue(),
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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

class GetQueryResultsResponse {
  /// If you associated an KMS key with the CloudWatch Logs Insights query results
  /// in this account, this field displays the ARN of the key that's used to
  /// encrypt the query results when <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_StartQuery.html">StartQuery</a>
  /// stores them.
  final String? encryptionKey;

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
    this.results,
    this.statistics,
    this.status,
  });

  factory GetQueryResultsResponse.fromJson(Map<String, dynamic> json) {
    return GetQueryResultsResponse(
      encryptionKey: json['encryptionKey'] as String?,
      results: (json['results'] as List?)
          ?.whereNotNull()
          .map((e) => (e as List)
              .whereNotNull()
              .map((e) => ResultField.fromJson(e as Map<String, dynamic>))
              .toList())
          .toList(),
      statistics: json['statistics'] != null
          ? QueryStatistics.fromJson(json['statistics'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)?.toQueryStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final encryptionKey = this.encryptionKey;
    final results = this.results;
    final statistics = this.statistics;
    final status = this.status;
    return {
      if (encryptionKey != null) 'encryptionKey': encryptionKey,
      if (results != null) 'results': results,
      if (statistics != null) 'statistics': statistics,
      if (status != null) 'status': status.toValue(),
    };
  }
}

enum InheritedProperty {
  accountDataProtection,
}

extension InheritedPropertyValueExtension on InheritedProperty {
  String toValue() {
    switch (this) {
      case InheritedProperty.accountDataProtection:
        return 'ACCOUNT_DATA_PROTECTION';
    }
  }
}

extension InheritedPropertyFromString on String {
  InheritedProperty toInheritedProperty() {
    switch (this) {
      case 'ACCOUNT_DATA_PROTECTION':
        return InheritedProperty.accountDataProtection;
    }
    throw Exception('$this is not known in enum InheritedProperty');
  }
}

/// Represents a log event, which is a record of activity that was recorded by
/// the application or resource being monitored.
class InputLogEvent {
  /// The raw event message. Each log event can be no larger than 256 KB.
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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

class ListTagsForResourceResponse {
  /// The list of tags associated with the requested resource.&gt;
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

@Deprecated(
    'Please use the generic tagging API model ListTagsForResourceRequest and ListTagsForResourceResponse')
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
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      logStreamNamePrefixes: (json['logStreamNamePrefixes'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      logStreamNames: (json['logStreamNames'] as List?)
          ?.whereNotNull()
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
          ?.whereNotNull()
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

  /// The creation time of the log group, expressed as the number of milliseconds
  /// after Jan 1, 1970 00:00:00 UTC.
  final int? creationTime;

  /// Displays whether this log group has a protection policy, or whether it had
  /// one in the past. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDataProtectionPolicy.html">PutDataProtectionPolicy</a>.
  final DataProtectionStatus? dataProtectionStatus;

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

  /// This specifies the log group class for this log group. There are two
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
  /// </ul>
  /// For details about the features supported by each class, see <a
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
    this.creationTime,
    this.dataProtectionStatus,
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
      creationTime: json['creationTime'] as int?,
      dataProtectionStatus:
          (json['dataProtectionStatus'] as String?)?.toDataProtectionStatus(),
      inheritedProperties: (json['inheritedProperties'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toInheritedProperty())
          .toList(),
      kmsKeyId: json['kmsKeyId'] as String?,
      logGroupArn: json['logGroupArn'] as String?,
      logGroupClass: (json['logGroupClass'] as String?)?.toLogGroupClass(),
      logGroupName: json['logGroupName'] as String?,
      metricFilterCount: json['metricFilterCount'] as int?,
      retentionInDays: json['retentionInDays'] as int?,
      storedBytes: json['storedBytes'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final dataProtectionStatus = this.dataProtectionStatus;
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
      if (creationTime != null) 'creationTime': creationTime,
      if (dataProtectionStatus != null)
        'dataProtectionStatus': dataProtectionStatus.toValue(),
      if (inheritedProperties != null)
        'inheritedProperties':
            inheritedProperties.map((e) => e.toValue()).toList(),
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
      if (logGroupArn != null) 'logGroupArn': logGroupArn,
      if (logGroupClass != null) 'logGroupClass': logGroupClass.toValue(),
      if (logGroupName != null) 'logGroupName': logGroupName,
      if (metricFilterCount != null) 'metricFilterCount': metricFilterCount,
      if (retentionInDays != null) 'retentionInDays': retentionInDays,
      if (storedBytes != null) 'storedBytes': storedBytes,
    };
  }
}

enum LogGroupClass {
  standard,
  infrequentAccess,
}

extension LogGroupClassValueExtension on LogGroupClass {
  String toValue() {
    switch (this) {
      case LogGroupClass.standard:
        return 'STANDARD';
      case LogGroupClass.infrequentAccess:
        return 'INFREQUENT_ACCESS';
    }
  }
}

extension LogGroupClassFromString on String {
  LogGroupClass toLogGroupClass() {
    switch (this) {
      case 'STANDARD':
        return LogGroupClass.standard;
      case 'INFREQUENT_ACCESS':
        return LogGroupClass.infrequentAccess;
    }
    throw Exception('$this is not known in enum LogGroupClass');
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

/// Metric filters express how CloudWatch Logs would extract metric observations
/// from ingested log events and transform them into metric data in a CloudWatch
/// metric.
class MetricFilter {
  /// The creation time of the metric filter, expressed as the number of
  /// milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>.
  final int? creationTime;

  /// The name of the metric filter.
  final String? filterName;
  final String? filterPattern;

  /// The name of the log group.
  final String? logGroupName;

  /// The metric transformations.
  final List<MetricTransformation>? metricTransformations;

  MetricFilter({
    this.creationTime,
    this.filterName,
    this.filterPattern,
    this.logGroupName,
    this.metricTransformations,
  });

  factory MetricFilter.fromJson(Map<String, dynamic> json) {
    return MetricFilter(
      creationTime: json['creationTime'] as int?,
      filterName: json['filterName'] as String?,
      filterPattern: json['filterPattern'] as String?,
      logGroupName: json['logGroupName'] as String?,
      metricTransformations: (json['metricTransformations'] as List?)
          ?.whereNotNull()
          .map((e) => MetricTransformation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final filterName = this.filterName;
    final filterPattern = this.filterPattern;
    final logGroupName = this.logGroupName;
    final metricTransformations = this.metricTransformations;
    return {
      if (creationTime != null) 'creationTime': creationTime,
      if (filterName != null) 'filterName': filterName,
      if (filterPattern != null) 'filterPattern': filterPattern,
      if (logGroupName != null) 'logGroupName': logGroupName,
      if (metricTransformations != null)
        'metricTransformations': metricTransformations,
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
      metricName: json['metricName'] as String,
      metricNamespace: json['metricNamespace'] as String,
      metricValue: json['metricValue'] as String,
      defaultValue: json['defaultValue'] as double?,
      dimensions: (json['dimensions'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      unit: (json['unit'] as String?)?.toStandardUnit(),
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
      if (unit != null) 'unit': unit.toValue(),
    };
  }
}

enum OrderBy {
  logStreamName,
  lastEventTime,
}

extension OrderByValueExtension on OrderBy {
  String toValue() {
    switch (this) {
      case OrderBy.logStreamName:
        return 'LogStreamName';
      case OrderBy.lastEventTime:
        return 'LastEventTime';
    }
  }
}

extension OrderByFromString on String {
  OrderBy toOrderBy() {
    switch (this) {
      case 'LogStreamName':
        return OrderBy.logStreamName;
      case 'LastEventTime':
        return OrderBy.lastEventTime;
    }
    throw Exception('$this is not known in enum OrderBy');
  }
}

enum OutputFormat {
  json,
  plain,
  w3c,
  raw,
  parquet,
}

extension OutputFormatValueExtension on OutputFormat {
  String toValue() {
    switch (this) {
      case OutputFormat.json:
        return 'json';
      case OutputFormat.plain:
        return 'plain';
      case OutputFormat.w3c:
        return 'w3c';
      case OutputFormat.raw:
        return 'raw';
      case OutputFormat.parquet:
        return 'parquet';
    }
  }
}

extension OutputFormatFromString on String {
  OutputFormat toOutputFormat() {
    switch (this) {
      case 'json':
        return OutputFormat.json;
      case 'plain':
        return OutputFormat.plain;
      case 'w3c':
        return OutputFormat.w3c;
      case 'raw':
        return OutputFormat.raw;
      case 'parquet':
        return OutputFormat.parquet;
    }
    throw Exception('$this is not known in enum OutputFormat');
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

/// A tructures that contains information about one pattern token related to an
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

  /// Specifies whether this is a dynamic token.
  final bool? isDynamic;

  /// The string represented by this token. If this is a dynamic token, the value
  /// will be <code>&lt;*&gt;</code>
  final String? tokenString;

  PatternToken({
    this.dynamicTokenPosition,
    this.enumerations,
    this.isDynamic,
    this.tokenString,
  });

  factory PatternToken.fromJson(Map<String, dynamic> json) {
    return PatternToken(
      dynamicTokenPosition: json['dynamicTokenPosition'] as int?,
      enumerations: (json['enumerations'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as int)),
      isDynamic: json['isDynamic'] as bool?,
      tokenString: json['tokenString'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dynamicTokenPosition = this.dynamicTokenPosition;
    final enumerations = this.enumerations;
    final isDynamic = this.isDynamic;
    final tokenString = this.tokenString;
    return {
      if (dynamicTokenPosition != null)
        'dynamicTokenPosition': dynamicTokenPosition,
      if (enumerations != null) 'enumerations': enumerations,
      if (isDynamic != null) 'isDynamic': isDynamic,
      if (tokenString != null) 'tokenString': tokenString,
    };
  }
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

enum PolicyType {
  dataProtectionPolicy,
  subscriptionFilterPolicy,
}

extension PolicyTypeValueExtension on PolicyType {
  String toValue() {
    switch (this) {
      case PolicyType.dataProtectionPolicy:
        return 'DATA_PROTECTION_POLICY';
      case PolicyType.subscriptionFilterPolicy:
        return 'SUBSCRIPTION_FILTER_POLICY';
    }
  }
}

extension PolicyTypeFromString on String {
  PolicyType toPolicyType() {
    switch (this) {
      case 'DATA_PROTECTION_POLICY':
        return PolicyType.dataProtectionPolicy;
      case 'SUBSCRIPTION_FILTER_POLICY':
        return PolicyType.subscriptionFilterPolicy;
    }
    throw Exception('$this is not known in enum PolicyType');
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

  /// The rejected events.
  final RejectedLogEventsInfo? rejectedLogEventsInfo;

  PutLogEventsResponse({
    this.nextSequenceToken,
    this.rejectedLogEventsInfo,
  });

  factory PutLogEventsResponse.fromJson(Map<String, dynamic> json) {
    return PutLogEventsResponse(
      nextSequenceToken: json['nextSequenceToken'] as String?,
      rejectedLogEventsInfo: json['rejectedLogEventsInfo'] != null
          ? RejectedLogEventsInfo.fromJson(
              json['rejectedLogEventsInfo'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final nextSequenceToken = this.nextSequenceToken;
    final rejectedLogEventsInfo = this.rejectedLogEventsInfo;
    return {
      if (nextSequenceToken != null) 'nextSequenceToken': nextSequenceToken,
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

  PutResourcePolicyResponse({
    this.resourcePolicy,
  });

  factory PutResourcePolicyResponse.fromJson(Map<String, dynamic> json) {
    return PutResourcePolicyResponse(
      resourcePolicy: json['resourcePolicy'] != null
          ? ResourcePolicy.fromJson(
              json['resourcePolicy'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final resourcePolicy = this.resourcePolicy;
    return {
      if (resourcePolicy != null) 'resourcePolicy': resourcePolicy,
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

  /// The unique ID of the query definition.
  final String? queryDefinitionId;

  /// The query string to use for this definition. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_QuerySyntax.html">CloudWatch
  /// Logs Insights Query Syntax</a>.
  final String? queryString;

  QueryDefinition({
    this.lastModified,
    this.logGroupNames,
    this.name,
    this.queryDefinitionId,
    this.queryString,
  });

  factory QueryDefinition.fromJson(Map<String, dynamic> json) {
    return QueryDefinition(
      lastModified: json['lastModified'] as int?,
      logGroupNames: (json['logGroupNames'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      name: json['name'] as String?,
      queryDefinitionId: json['queryDefinitionId'] as String?,
      queryString: json['queryString'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lastModified = this.lastModified;
    final logGroupNames = this.logGroupNames;
    final name = this.name;
    final queryDefinitionId = this.queryDefinitionId;
    final queryString = this.queryString;
    return {
      if (lastModified != null) 'lastModified': lastModified,
      if (logGroupNames != null) 'logGroupNames': logGroupNames,
      if (name != null) 'name': name,
      if (queryDefinitionId != null) 'queryDefinitionId': queryDefinitionId,
      if (queryString != null) 'queryString': queryString,
    };
  }
}

/// Information about one CloudWatch Logs Insights query that matches the
/// request in a <code>DescribeQueries</code> operation.
class QueryInfo {
  /// The date and time that this query was created.
  final int? createTime;

  /// The name of the log group scanned by this query.
  final String? logGroupName;

  /// The unique ID number of this query.
  final String? queryId;

  /// The query string used in this query.
  final String? queryString;

  /// The status of this query. Possible values are <code>Cancelled</code>,
  /// <code>Complete</code>, <code>Failed</code>, <code>Running</code>,
  /// <code>Scheduled</code>, and <code>Unknown</code>.
  final QueryStatus? status;

  QueryInfo({
    this.createTime,
    this.logGroupName,
    this.queryId,
    this.queryString,
    this.status,
  });

  factory QueryInfo.fromJson(Map<String, dynamic> json) {
    return QueryInfo(
      createTime: json['createTime'] as int?,
      logGroupName: json['logGroupName'] as String?,
      queryId: json['queryId'] as String?,
      queryString: json['queryString'] as String?,
      status: (json['status'] as String?)?.toQueryStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final createTime = this.createTime;
    final logGroupName = this.logGroupName;
    final queryId = this.queryId;
    final queryString = this.queryString;
    final status = this.status;
    return {
      if (createTime != null) 'createTime': createTime,
      if (logGroupName != null) 'logGroupName': logGroupName,
      if (queryId != null) 'queryId': queryId,
      if (queryString != null) 'queryString': queryString,
      if (status != null) 'status': status.toValue(),
    };
  }
}

/// Contains the number of log events scanned by the query, the number of log
/// events that matched the query criteria, and the total number of bytes in the
/// log events that were scanned.
class QueryStatistics {
  /// The total number of bytes in the log events scanned during the query.
  final double? bytesScanned;

  /// The number of log events that matched the query string.
  final double? recordsMatched;

  /// The total number of log events scanned during the query.
  final double? recordsScanned;

  QueryStatistics({
    this.bytesScanned,
    this.recordsMatched,
    this.recordsScanned,
  });

  factory QueryStatistics.fromJson(Map<String, dynamic> json) {
    return QueryStatistics(
      bytesScanned: json['bytesScanned'] as double?,
      recordsMatched: json['recordsMatched'] as double?,
      recordsScanned: json['recordsScanned'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final bytesScanned = this.bytesScanned;
    final recordsMatched = this.recordsMatched;
    final recordsScanned = this.recordsScanned;
    return {
      if (bytesScanned != null) 'bytesScanned': bytesScanned,
      if (recordsMatched != null) 'recordsMatched': recordsMatched,
      if (recordsScanned != null) 'recordsScanned': recordsScanned,
    };
  }
}

enum QueryStatus {
  scheduled,
  running,
  complete,
  failed,
  cancelled,
  timeout,
  unknown,
}

extension QueryStatusValueExtension on QueryStatus {
  String toValue() {
    switch (this) {
      case QueryStatus.scheduled:
        return 'Scheduled';
      case QueryStatus.running:
        return 'Running';
      case QueryStatus.complete:
        return 'Complete';
      case QueryStatus.failed:
        return 'Failed';
      case QueryStatus.cancelled:
        return 'Cancelled';
      case QueryStatus.timeout:
        return 'Timeout';
      case QueryStatus.unknown:
        return 'Unknown';
    }
  }
}

extension QueryStatusFromString on String {
  QueryStatus toQueryStatus() {
    switch (this) {
      case 'Scheduled':
        return QueryStatus.scheduled;
      case 'Running':
        return QueryStatus.running;
      case 'Complete':
        return QueryStatus.complete;
      case 'Failed':
        return QueryStatus.failed;
      case 'Cancelled':
        return QueryStatus.cancelled;
      case 'Timeout':
        return QueryStatus.timeout;
      case 'Unknown':
        return QueryStatus.unknown;
    }
    throw Exception('$this is not known in enum QueryStatus');
  }
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

  ResourcePolicy({
    this.lastUpdatedTime,
    this.policyDocument,
    this.policyName,
  });

  factory ResourcePolicy.fromJson(Map<String, dynamic> json) {
    return ResourcePolicy(
      lastUpdatedTime: json['lastUpdatedTime'] as int?,
      policyDocument: json['policyDocument'] as String?,
      policyName: json['policyName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lastUpdatedTime = this.lastUpdatedTime;
    final policyDocument = this.policyDocument;
    final policyName = this.policyName;
    return {
      if (lastUpdatedTime != null) 'lastUpdatedTime': lastUpdatedTime,
      if (policyDocument != null) 'policyDocument': policyDocument,
      if (policyName != null) 'policyName': policyName,
    };
  }
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

enum Scope {
  all,
}

extension ScopeValueExtension on Scope {
  String toValue() {
    switch (this) {
      case Scope.all:
        return 'ALL';
    }
  }
}

extension ScopeFromString on String {
  Scope toScope() {
    switch (this) {
      case 'ALL':
        return Scope.all;
    }
    throw Exception('$this is not known in enum Scope');
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

/// his exception is returned if an unknown error occurs during a Live Tail
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

enum StandardUnit {
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
  none,
}

extension StandardUnitValueExtension on StandardUnit {
  String toValue() {
    switch (this) {
      case StandardUnit.seconds:
        return 'Seconds';
      case StandardUnit.microseconds:
        return 'Microseconds';
      case StandardUnit.milliseconds:
        return 'Milliseconds';
      case StandardUnit.bytes:
        return 'Bytes';
      case StandardUnit.kilobytes:
        return 'Kilobytes';
      case StandardUnit.megabytes:
        return 'Megabytes';
      case StandardUnit.gigabytes:
        return 'Gigabytes';
      case StandardUnit.terabytes:
        return 'Terabytes';
      case StandardUnit.bits:
        return 'Bits';
      case StandardUnit.kilobits:
        return 'Kilobits';
      case StandardUnit.megabits:
        return 'Megabits';
      case StandardUnit.gigabits:
        return 'Gigabits';
      case StandardUnit.terabits:
        return 'Terabits';
      case StandardUnit.percent:
        return 'Percent';
      case StandardUnit.count:
        return 'Count';
      case StandardUnit.bytesSecond:
        return 'Bytes/Second';
      case StandardUnit.kilobytesSecond:
        return 'Kilobytes/Second';
      case StandardUnit.megabytesSecond:
        return 'Megabytes/Second';
      case StandardUnit.gigabytesSecond:
        return 'Gigabytes/Second';
      case StandardUnit.terabytesSecond:
        return 'Terabytes/Second';
      case StandardUnit.bitsSecond:
        return 'Bits/Second';
      case StandardUnit.kilobitsSecond:
        return 'Kilobits/Second';
      case StandardUnit.megabitsSecond:
        return 'Megabits/Second';
      case StandardUnit.gigabitsSecond:
        return 'Gigabits/Second';
      case StandardUnit.terabitsSecond:
        return 'Terabits/Second';
      case StandardUnit.countSecond:
        return 'Count/Second';
      case StandardUnit.none:
        return 'None';
    }
  }
}

extension StandardUnitFromString on String {
  StandardUnit toStandardUnit() {
    switch (this) {
      case 'Seconds':
        return StandardUnit.seconds;
      case 'Microseconds':
        return StandardUnit.microseconds;
      case 'Milliseconds':
        return StandardUnit.milliseconds;
      case 'Bytes':
        return StandardUnit.bytes;
      case 'Kilobytes':
        return StandardUnit.kilobytes;
      case 'Megabytes':
        return StandardUnit.megabytes;
      case 'Gigabytes':
        return StandardUnit.gigabytes;
      case 'Terabytes':
        return StandardUnit.terabytes;
      case 'Bits':
        return StandardUnit.bits;
      case 'Kilobits':
        return StandardUnit.kilobits;
      case 'Megabits':
        return StandardUnit.megabits;
      case 'Gigabits':
        return StandardUnit.gigabits;
      case 'Terabits':
        return StandardUnit.terabits;
      case 'Percent':
        return StandardUnit.percent;
      case 'Count':
        return StandardUnit.count;
      case 'Bytes/Second':
        return StandardUnit.bytesSecond;
      case 'Kilobytes/Second':
        return StandardUnit.kilobytesSecond;
      case 'Megabytes/Second':
        return StandardUnit.megabytesSecond;
      case 'Gigabytes/Second':
        return StandardUnit.gigabytesSecond;
      case 'Terabytes/Second':
        return StandardUnit.terabytesSecond;
      case 'Bits/Second':
        return StandardUnit.bitsSecond;
      case 'Kilobits/Second':
        return StandardUnit.kilobitsSecond;
      case 'Megabits/Second':
        return StandardUnit.megabitsSecond;
      case 'Gigabits/Second':
        return StandardUnit.gigabitsSecond;
      case 'Terabits/Second':
        return StandardUnit.terabitsSecond;
      case 'Count/Second':
        return StandardUnit.countSecond;
      case 'None':
        return StandardUnit.none;
    }
    throw Exception('$this is not known in enum StandardUnit');
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

enum State {
  active,
  suppressed,
  baseline,
}

extension StateValueExtension on State {
  String toValue() {
    switch (this) {
      case State.active:
        return 'Active';
      case State.suppressed:
        return 'Suppressed';
      case State.baseline:
        return 'Baseline';
    }
  }
}

extension StateFromString on String {
  State toState() {
    switch (this) {
      case 'Active':
        return State.active;
      case 'Suppressed':
        return State.suppressed;
      case 'Baseline':
        return State.baseline;
    }
    throw Exception('$this is not known in enum State');
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

/// Represents a subscription filter.
class SubscriptionFilter {
  /// The creation time of the subscription filter, expressed as the number of
  /// milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>.
  final int? creationTime;

  /// The Amazon Resource Name (ARN) of the destination.
  final String? destinationArn;
  final Distribution? distribution;

  /// The name of the subscription filter.
  final String? filterName;
  final String? filterPattern;

  /// The name of the log group.
  final String? logGroupName;

  /// <p/>
  final String? roleArn;

  SubscriptionFilter({
    this.creationTime,
    this.destinationArn,
    this.distribution,
    this.filterName,
    this.filterPattern,
    this.logGroupName,
    this.roleArn,
  });

  factory SubscriptionFilter.fromJson(Map<String, dynamic> json) {
    return SubscriptionFilter(
      creationTime: json['creationTime'] as int?,
      destinationArn: json['destinationArn'] as String?,
      distribution: (json['distribution'] as String?)?.toDistribution(),
      filterName: json['filterName'] as String?,
      filterPattern: json['filterPattern'] as String?,
      logGroupName: json['logGroupName'] as String?,
      roleArn: json['roleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final destinationArn = this.destinationArn;
    final distribution = this.distribution;
    final filterName = this.filterName;
    final filterPattern = this.filterPattern;
    final logGroupName = this.logGroupName;
    final roleArn = this.roleArn;
    return {
      if (creationTime != null) 'creationTime': creationTime,
      if (destinationArn != null) 'destinationArn': destinationArn,
      if (distribution != null) 'distribution': distribution.toValue(),
      if (filterName != null) 'filterName': filterName,
      if (filterPattern != null) 'filterPattern': filterPattern,
      if (logGroupName != null) 'logGroupName': logGroupName,
      if (roleArn != null) 'roleArn': roleArn,
    };
  }
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
      if (suppressionUnit != null) 'suppressionUnit': suppressionUnit.toValue(),
      if (value != null) 'value': value,
    };
  }
}

enum SuppressionState {
  suppressed,
  unsuppressed,
}

extension SuppressionStateValueExtension on SuppressionState {
  String toValue() {
    switch (this) {
      case SuppressionState.suppressed:
        return 'SUPPRESSED';
      case SuppressionState.unsuppressed:
        return 'UNSUPPRESSED';
    }
  }
}

extension SuppressionStateFromString on String {
  SuppressionState toSuppressionState() {
    switch (this) {
      case 'SUPPRESSED':
        return SuppressionState.suppressed;
      case 'UNSUPPRESSED':
        return SuppressionState.unsuppressed;
    }
    throw Exception('$this is not known in enum SuppressionState');
  }
}

enum SuppressionType {
  limited,
  infinite,
}

extension SuppressionTypeValueExtension on SuppressionType {
  String toValue() {
    switch (this) {
      case SuppressionType.limited:
        return 'LIMITED';
      case SuppressionType.infinite:
        return 'INFINITE';
    }
  }
}

extension SuppressionTypeFromString on String {
  SuppressionType toSuppressionType() {
    switch (this) {
      case 'LIMITED':
        return SuppressionType.limited;
      case 'INFINITE':
        return SuppressionType.infinite;
    }
    throw Exception('$this is not known in enum SuppressionType');
  }
}

enum SuppressionUnit {
  seconds,
  minutes,
  hours,
}

extension SuppressionUnitValueExtension on SuppressionUnit {
  String toValue() {
    switch (this) {
      case SuppressionUnit.seconds:
        return 'SECONDS';
      case SuppressionUnit.minutes:
        return 'MINUTES';
      case SuppressionUnit.hours:
        return 'HOURS';
    }
  }
}

extension SuppressionUnitFromString on String {
  SuppressionUnit toSuppressionUnit() {
    switch (this) {
      case 'SECONDS':
        return SuppressionUnit.seconds;
      case 'MINUTES':
        return SuppressionUnit.minutes;
      case 'HOURS':
        return SuppressionUnit.hours;
    }
    throw Exception('$this is not known in enum SuppressionUnit');
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
          ?.whereNotNull()
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
