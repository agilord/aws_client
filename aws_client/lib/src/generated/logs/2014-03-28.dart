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

/// You can use Amazon CloudWatch Logs to monitor, store, and access your log
/// files from EC2 instances, AWS CloudTrail, and other sources. You can then
/// retrieve the associated log data from CloudWatch Logs using the CloudWatch
/// console, CloudWatch Logs commands in the AWS CLI, CloudWatch Logs API, or
/// CloudWatch Logs SDK.
///
/// You can use CloudWatch Logs to:
///
/// <ul>
/// <li>
/// <b>Monitor logs from EC2 instances in real-time</b>: You can use CloudWatch
/// Logs to monitor applications and systems using log data. For example,
/// CloudWatch Logs can track the number of errors that occur in your
/// application logs and send you a notification whenever the rate of errors
/// exceeds a threshold that you specify. CloudWatch Logs uses your log data for
/// monitoring so no code changes are required. For example, you can monitor
/// application logs for specific literal terms (such as
/// "NullReferenceException") or count the number of occurrences of a literal
/// term at a particular position in log data (such as "404" status codes in an
/// Apache access log). When the term you are searching for is found, CloudWatch
/// Logs reports the data to a CloudWatch metric that you specify.
/// </li>
/// <li>
/// <b>Monitor AWS CloudTrail logged events</b>: You can create alarms in
/// CloudWatch and receive notifications of particular API activity as captured
/// by CloudTrail. You can use the notification to perform troubleshooting.
/// </li>
/// <li>
/// <b>Archive log data</b>: You can use CloudWatch Logs to store your log data
/// in highly durable storage. You can change the log retention setting so that
/// any log events older than this setting are automatically deleted. The
/// CloudWatch Logs agent makes it easy to quickly send both rotated and
/// non-rotated log data off of a host and into the log service. You can then
/// access the raw log data when you need it.
/// </li>
/// </ul>
class CloudWatchLogs {
  final _s.JsonProtocol _protocol;
  CloudWatchLogs({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'logs',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Associates the specified AWS Key Management Service (AWS KMS) customer
  /// master key (CMK) with the specified log group.
  ///
  /// Associating an AWS KMS CMK with a log group overrides any existing
  /// associations between the log group and a CMK. After a CMK is associated
  /// with a log group, all newly ingested data for the log group is encrypted
  /// using the CMK. This association is stored as long as the data encrypted
  /// with the CMK is still within Amazon CloudWatch Logs. This enables Amazon
  /// CloudWatch Logs to decrypt this data whenever it is requested.
  /// <important>
  /// CloudWatch Logs supports only symmetric CMKs. Do not use an associate an
  /// asymmetric CMK with your log group. For more information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html">Using
  /// Symmetric and Asymmetric Keys</a>.
  /// </important>
  /// It can take up to 5 minutes for this operation to take effect.
  ///
  /// If you attempt to associate a CMK with a log group but the CMK does not
  /// exist or the CMK is disabled, you receive an
  /// <code>InvalidParameterException</code> error.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [OperationAbortedException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [kmsKeyId] :
  /// The Amazon Resource Name (ARN) of the CMK to use when encrypting log data.
  /// This must be a symmetric CMK. For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-kms">Amazon
  /// Resource Names - AWS Key Management Service (AWS KMS)</a> and <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html">Using
  /// Symmetric and Asymmetric Keys</a>.
  ///
  /// Parameter [logGroupName] :
  /// The name of the log group.
  Future<void> associateKmsKey({
    required String kmsKeyId,
    required String logGroupName,
  }) async {
    ArgumentError.checkNotNull(kmsKeyId, 'kmsKeyId');
    _s.validateStringLength(
      'kmsKeyId',
      kmsKeyId,
      0,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(logGroupName, 'logGroupName');
    _s.validateStringLength(
      'logGroupName',
      logGroupName,
      1,
      512,
      isRequired: true,
    );
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
        'logGroupName': logGroupName,
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
    ArgumentError.checkNotNull(taskId, 'taskId');
    _s.validateStringLength(
      'taskId',
      taskId,
      1,
      512,
      isRequired: true,
    );
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

  /// Creates an export task, which allows you to efficiently export data from a
  /// log group to an Amazon S3 bucket. When you perform a
  /// <code>CreateExportTask</code> operation, you must use credentials that
  /// have permission to write to the S3 bucket that you specify as the
  /// destination.
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
  /// the same S3 bucket. To separate out log data for each export task, you can
  /// specify a prefix to be used as the Amazon S3 key prefix for all exported
  /// objects.
  ///
  /// Exporting to S3 buckets that are encrypted with AES-256 is supported.
  /// Exporting to S3 buckets encrypted with SSE-KMS is not supported.
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
  /// same AWS region.
  ///
  /// Parameter [from] :
  /// The start time of the range for the request, expressed as the number of
  /// milliseconds after Jan 1, 1970 00:00:00 UTC. Events with a timestamp
  /// earlier than this time are not exported.
  ///
  /// Parameter [logGroupName] :
  /// The name of the log group.
  ///
  /// Parameter [to] :
  /// The end time of the range for the request, expreswatchlogsdocused as the
  /// number of milliseconds after Jan 1, 1970 00:00:00 UTC. Events with a
  /// timestamp later than this time are not exported.
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
    ArgumentError.checkNotNull(destination, 'destination');
    _s.validateStringLength(
      'destination',
      destination,
      1,
      512,
      isRequired: true,
    );
    ArgumentError.checkNotNull(from, 'from');
    _s.validateNumRange(
      'from',
      from,
      0,
      1152921504606846976,
      isRequired: true,
    );
    ArgumentError.checkNotNull(logGroupName, 'logGroupName');
    _s.validateStringLength(
      'logGroupName',
      logGroupName,
      1,
      512,
      isRequired: true,
    );
    ArgumentError.checkNotNull(to, 'to');
    _s.validateNumRange(
      'to',
      to,
      0,
      1152921504606846976,
      isRequired: true,
    );
    _s.validateStringLength(
      'logStreamNamePrefix',
      logStreamNamePrefix,
      1,
      512,
    );
    _s.validateStringLength(
      'taskName',
      taskName,
      1,
      512,
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

  /// Creates a log group with the specified name. You can create up to 20,000
  /// log groups per account.
  ///
  /// You must use the following guidelines when naming a log group:
  ///
  /// <ul>
  /// <li>
  /// Log group names must be unique within a region for an AWS account.
  /// </li>
  /// <li>
  /// Log group names can be between 1 and 512 characters long.
  /// </li>
  /// <li>
  /// Log group names consist of the following characters: a-z, A-Z, 0-9, '_'
  /// (underscore), '-' (hyphen), '/' (forward slash), '.' (period), and '#'
  /// (number sign)
  /// </li>
  /// </ul>
  /// When you create a log group, by default the log events in the log group
  /// never expire. To set a retention policy so that events expire and are
  /// deleted after a specified time, use <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutRetentionPolicy.html">PutRetentionPolicy</a>.
  ///
  /// If you associate a AWS Key Management Service (AWS KMS) customer master
  /// key (CMK) with the log group, ingested data is encrypted using the CMK.
  /// This association is stored as long as the data encrypted with the CMK is
  /// still within Amazon CloudWatch Logs. This enables Amazon CloudWatch Logs
  /// to decrypt this data whenever it is requested.
  ///
  /// If you attempt to associate a CMK with the log group but the CMK does not
  /// exist or the CMK is disabled, you receive an
  /// <code>InvalidParameterException</code> error.
  /// <important>
  /// CloudWatch Logs supports only symmetric CMKs. Do not associate an
  /// asymmetric CMK with your log group. For more information, see <a
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
  /// The name of the log group.
  ///
  /// Parameter [kmsKeyId] :
  /// The Amazon Resource Name (ARN) of the CMK to use when encrypting log data.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-kms">Amazon
  /// Resource Names - AWS Key Management Service (AWS KMS)</a>.
  ///
  /// Parameter [tags] :
  /// The key-value pairs to use for the tags.
  Future<void> createLogGroup({
    required String logGroupName,
    String? kmsKeyId,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(logGroupName, 'logGroupName');
    _s.validateStringLength(
      'logGroupName',
      logGroupName,
      1,
      512,
      isRequired: true,
    );
    _s.validateStringLength(
      'kmsKeyId',
      kmsKeyId,
      0,
      256,
    );
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
  /// The ':' (colon) and '*' (asterisk) characters are not allowed.
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
    ArgumentError.checkNotNull(logGroupName, 'logGroupName');
    _s.validateStringLength(
      'logGroupName',
      logGroupName,
      1,
      512,
      isRequired: true,
    );
    ArgumentError.checkNotNull(logStreamName, 'logStreamName');
    _s.validateStringLength(
      'logStreamName',
      logStreamName,
      1,
      512,
      isRequired: true,
    );
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
    ArgumentError.checkNotNull(destinationName, 'destinationName');
    _s.validateStringLength(
      'destinationName',
      destinationName,
      1,
      512,
      isRequired: true,
    );
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
    ArgumentError.checkNotNull(logGroupName, 'logGroupName');
    _s.validateStringLength(
      'logGroupName',
      logGroupName,
      1,
      512,
      isRequired: true,
    );
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
    ArgumentError.checkNotNull(logGroupName, 'logGroupName');
    _s.validateStringLength(
      'logGroupName',
      logGroupName,
      1,
      512,
      isRequired: true,
    );
    ArgumentError.checkNotNull(logStreamName, 'logStreamName');
    _s.validateStringLength(
      'logStreamName',
      logStreamName,
      1,
      512,
      isRequired: true,
    );
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
    ArgumentError.checkNotNull(filterName, 'filterName');
    _s.validateStringLength(
      'filterName',
      filterName,
      1,
      512,
      isRequired: true,
    );
    ArgumentError.checkNotNull(logGroupName, 'logGroupName');
    _s.validateStringLength(
      'logGroupName',
      logGroupName,
      1,
      512,
      isRequired: true,
    );
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
    ArgumentError.checkNotNull(queryDefinitionId, 'queryDefinitionId');
    _s.validateStringLength(
      'queryDefinitionId',
      queryDefinitionId,
      0,
      256,
      isRequired: true,
    );
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
    ArgumentError.checkNotNull(logGroupName, 'logGroupName');
    _s.validateStringLength(
      'logGroupName',
      logGroupName,
      1,
      512,
      isRequired: true,
    );
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
    ArgumentError.checkNotNull(filterName, 'filterName');
    _s.validateStringLength(
      'filterName',
      filterName,
      1,
      512,
      isRequired: true,
    );
    ArgumentError.checkNotNull(logGroupName, 'logGroupName');
    _s.validateStringLength(
      'logGroupName',
      logGroupName,
      1,
      512,
      isRequired: true,
    );
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
  /// default is up to 50 items.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of items to return. (You received this token
  /// from a previous call.)
  Future<DescribeDestinationsResponse> describeDestinations({
    String? destinationNamePrefix,
    int? limit,
    String? nextToken,
  }) async {
    _s.validateStringLength(
      'destinationNamePrefix',
      destinationNamePrefix,
      1,
      512,
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      50,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1152921504606846976,
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
  /// The ID of the export task. Specifying a task ID filters the results to
  /// zero or one export tasks.
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
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'taskId',
      taskId,
      1,
      512,
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
  /// May throw [InvalidParameterException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [limit] :
  /// The maximum number of items returned. If you don't specify a value, the
  /// default is up to 50 items.
  ///
  /// Parameter [logGroupNamePrefix] :
  /// The prefix to match.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of items to return. (You received this token
  /// from a previous call.)
  Future<DescribeLogGroupsResponse> describeLogGroups({
    int? limit,
    String? logGroupNamePrefix,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      50,
    );
    _s.validateStringLength(
      'logGroupNamePrefix',
      logGroupNamePrefix,
      1,
      512,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1152921504606846976,
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
        if (limit != null) 'limit': limit,
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
  /// This operation has a limit of five transactions per second, after which
  /// transactions are throttled.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [logGroupName] :
  /// The name of the log group.
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
  /// the number of milliseconds after Jan 1, 1970 00:00:00 UTC.
  /// <code>lastEventTimestamp</code> updates on an eventual consistency basis.
  /// It typically updates in less than an hour from ingestion, but in rare
  /// situations might take longer.
  Future<DescribeLogStreamsResponse> describeLogStreams({
    required String logGroupName,
    bool? descending,
    int? limit,
    String? logStreamNamePrefix,
    String? nextToken,
    OrderBy? orderBy,
  }) async {
    ArgumentError.checkNotNull(logGroupName, 'logGroupName');
    _s.validateStringLength(
      'logGroupName',
      logGroupName,
      1,
      512,
      isRequired: true,
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      50,
    );
    _s.validateStringLength(
      'logStreamNamePrefix',
      logStreamNamePrefix,
      1,
      512,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1152921504606846976,
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
        'logGroupName': logGroupName,
        if (descending != null) 'descending': descending,
        if (limit != null) 'limit': limit,
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
  /// The prefix to match. CloudWatch Logs uses the value you set here only if
  /// you also include the <code>logGroupName</code> parameter in your request.
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
    _s.validateStringLength(
      'filterNamePrefix',
      filterNamePrefix,
      1,
      512,
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      50,
    );
    _s.validateStringLength(
      'logGroupName',
      logGroupName,
      1,
      512,
    );
    _s.validateStringLength(
      'metricName',
      metricName,
      0,
      255,
    );
    _s.validateStringLength(
      'metricNamespace',
      metricNamespace,
      0,
      255,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1152921504606846976,
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
  /// executing, or have been executed recently in this account. You can request
  /// all queries or limit it to queries of a specific log group or queries with
  /// a certain status.
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
    _s.validateStringLength(
      'logGroupName',
      logGroupName,
      1,
      512,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1152921504606846976,
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
  /// Insights query definitions.
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
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'queryDefinitionNamePrefix',
      queryDefinitionNamePrefix,
      1,
      255,
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
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1152921504606846976,
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
    ArgumentError.checkNotNull(logGroupName, 'logGroupName');
    _s.validateStringLength(
      'logGroupName',
      logGroupName,
      1,
      512,
      isRequired: true,
    );
    _s.validateStringLength(
      'filterNamePrefix',
      filterNamePrefix,
      1,
      512,
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      50,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1152921504606846976,
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

  /// Disassociates the associated AWS Key Management Service (AWS KMS) customer
  /// master key (CMK) from the specified log group.
  ///
  /// After the AWS KMS CMK is disassociated from the log group, AWS CloudWatch
  /// Logs stops encrypting newly ingested data for the log group. All
  /// previously ingested data remains encrypted, and AWS CloudWatch Logs
  /// requires permissions for the CMK whenever the encrypted data is requested.
  ///
  /// Note that it can take up to 5 minutes for this operation to take effect.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [OperationAbortedException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [logGroupName] :
  /// The name of the log group.
  Future<void> disassociateKmsKey({
    required String logGroupName,
  }) async {
    ArgumentError.checkNotNull(logGroupName, 'logGroupName');
    _s.validateStringLength(
      'logGroupName',
      logGroupName,
      1,
      512,
      isRequired: true,
    );
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
        'logGroupName': logGroupName,
      },
    );
  }

  /// Lists log events from the specified log group. You can list all the log
  /// events or filter the results using a filter pattern, a time range, and the
  /// name of the log stream.
  ///
  /// By default, this operation returns as many log events as can fit in 1 MB
  /// (up to 10,000 log events) or all the events found within the time range
  /// that you specify. If the results include a token, then there are more log
  /// events available, and you can get additional results by specifying the
  /// token in a subsequent call. This operation can return empty results while
  /// there are more log events available through the token.
  ///
  /// The returned log events are sorted by event timestamp, the timestamp when
  /// the event was ingested by CloudWatch Logs, and the ID of the
  /// <code>PutLogEvents</code> request.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [logGroupName] :
  /// The name of the log group to search.
  ///
  /// Parameter [endTime] :
  /// The end of the time range, expressed as the number of milliseconds after
  /// Jan 1, 1970 00:00:00 UTC. Events with a timestamp later than this time are
  /// not returned.
  ///
  /// Parameter [filterPattern] :
  /// The filter pattern to use. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/FilterAndPatternSyntax.html">Filter
  /// and Pattern Syntax</a>.
  ///
  /// If not provided, all the events are matched.
  ///
  /// Parameter [interleaved] :
  /// If the value is true, the operation makes a best effort to provide
  /// responses that contain events from multiple log streams within the log
  /// group, interleaved in a single response. If the value is false, all the
  /// matched log events in the first log stream are searched first, then those
  /// in the next log stream, and so on. The default is false.
  ///
  /// <b>Important:</b> Starting on June 17, 2019, this parameter is ignored and
  /// the value is assumed to be true. The response from this operation always
  /// interleaves events from multiple log streams within a log group.
  ///
  /// Parameter [limit] :
  /// The maximum number of events to return. The default is 10,000 events.
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
  /// Jan 1, 1970 00:00:00 UTC. Events with a timestamp before this time are not
  /// returned.
  Future<FilterLogEventsResponse> filterLogEvents({
    required String logGroupName,
    int? endTime,
    String? filterPattern,
    bool? interleaved,
    int? limit,
    String? logStreamNamePrefix,
    List<String>? logStreamNames,
    String? nextToken,
    int? startTime,
  }) async {
    ArgumentError.checkNotNull(logGroupName, 'logGroupName');
    _s.validateStringLength(
      'logGroupName',
      logGroupName,
      1,
      512,
      isRequired: true,
    );
    _s.validateNumRange(
      'endTime',
      endTime,
      0,
      1152921504606846976,
    );
    _s.validateStringLength(
      'filterPattern',
      filterPattern,
      0,
      1024,
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      10000,
    );
    _s.validateStringLength(
      'logStreamNamePrefix',
      logStreamNamePrefix,
      1,
      512,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1152921504606846976,
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
        'logGroupName': logGroupName,
        if (endTime != null) 'endTime': endTime,
        if (filterPattern != null) 'filterPattern': filterPattern,
        if (interleaved != null) 'interleaved': interleaved,
        if (limit != null) 'limit': limit,
        if (logStreamNamePrefix != null)
          'logStreamNamePrefix': logStreamNamePrefix,
        if (logStreamNames != null) 'logStreamNames': logStreamNames,
        if (nextToken != null) 'nextToken': nextToken,
        if (startTime != null) 'startTime': startTime,
      },
    );

    return FilterLogEventsResponse.fromJson(jsonResponse.body);
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
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [logGroupName] :
  /// The name of the log group.
  ///
  /// Parameter [logStreamName] :
  /// The name of the log stream.
  ///
  /// Parameter [endTime] :
  /// The end of the time range, expressed as the number of milliseconds after
  /// Jan 1, 1970 00:00:00 UTC. Events with a timestamp equal to or later than
  /// this time are not included.
  ///
  /// Parameter [limit] :
  /// The maximum number of log events returned. If you don't specify a value,
  /// the maximum is as many log events as can fit in a response size of 1 MB,
  /// up to 10,000 log events.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of items to return. (You received this token
  /// from a previous call.)
  ///
  /// Using this token works only when you specify <code>true</code> for
  /// <code>startFromHead</code>.
  ///
  /// Parameter [startFromHead] :
  /// If the value is true, the earliest log events are returned first. If the
  /// value is false, the latest log events are returned first. The default
  /// value is false.
  ///
  /// If you are using <code>nextToken</code> in this operation, you must
  /// specify <code>true</code> for <code>startFromHead</code>.
  ///
  /// Parameter [startTime] :
  /// The start of the time range, expressed as the number of milliseconds after
  /// Jan 1, 1970 00:00:00 UTC. Events with a timestamp equal to this time or
  /// later than this time are included. Events with a timestamp earlier than
  /// this time are not included.
  Future<GetLogEventsResponse> getLogEvents({
    required String logGroupName,
    required String logStreamName,
    int? endTime,
    int? limit,
    String? nextToken,
    bool? startFromHead,
    int? startTime,
  }) async {
    ArgumentError.checkNotNull(logGroupName, 'logGroupName');
    _s.validateStringLength(
      'logGroupName',
      logGroupName,
      1,
      512,
      isRequired: true,
    );
    ArgumentError.checkNotNull(logStreamName, 'logStreamName');
    _s.validateStringLength(
      'logStreamName',
      logStreamName,
      1,
      512,
      isRequired: true,
    );
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
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1152921504606846976,
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
        'logGroupName': logGroupName,
        'logStreamName': logStreamName,
        if (endTime != null) 'endTime': endTime,
        if (limit != null) 'limit': limit,
        if (nextToken != null) 'nextToken': nextToken,
        if (startFromHead != null) 'startFromHead': startFromHead,
        if (startTime != null) 'startTime': startTime,
      },
    );

    return GetLogEventsResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of the fields that are included in log events in the
  /// specified log group, along with the percentage of log events that contain
  /// each field. The search is limited to a time period that you specify.
  ///
  /// In the results, fields that start with @ are fields generated by
  /// CloudWatch Logs. For example, <code>@timestamp</code> is the timestamp of
  /// each log event. For more information about the fields that are generated
  /// by CloudWatch logs, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_AnalyzeLogData-discoverable-fields.html">Supported
  /// Logs and Discovered Fields</a>.
  ///
  /// The response results are sorted by the frequency percentage, starting with
  /// the highest percentage.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [logGroupName] :
  /// The name of the log group to search.
  ///
  /// Parameter [time] :
  /// The time to set as the center of the query. If you specify
  /// <code>time</code>, the 15 minutes before this time are queries. If you
  /// omit <code>time</code> the 8 minutes before and 8 minutes after this time
  /// are searched.
  ///
  /// The <code>time</code> value is specified as epoch time, the number of
  /// seconds since January 1, 1970, 00:00:00 UTC.
  Future<GetLogGroupFieldsResponse> getLogGroupFields({
    required String logGroupName,
    int? time,
  }) async {
    ArgumentError.checkNotNull(logGroupName, 'logGroupName');
    _s.validateStringLength(
      'logGroupName',
      logGroupName,
      1,
      512,
      isRequired: true,
    );
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
        'logGroupName': logGroupName,
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
  Future<GetLogRecordResponse> getLogRecord({
    required String logRecordPointer,
  }) async {
    ArgumentError.checkNotNull(logRecordPointer, 'logRecordPointer');
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
  /// <code>GetQueryResults</code> does not start a query execution. To run a
  /// query, use <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_StartQuery.html">StartQuery</a>.
  ///
  /// If the value of the <code>Status</code> field in the output is
  /// <code>Running</code>, this operation returns only partial results. If you
  /// see a value of <code>Scheduled</code> or <code>Running</code> for the
  /// status, you can retry the operation later to see the final results.
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
    ArgumentError.checkNotNull(queryId, 'queryId');
    _s.validateStringLength(
      'queryId',
      queryId,
      0,
      256,
      isRequired: true,
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
      },
    );

    return GetQueryResultsResponse.fromJson(jsonResponse.body);
  }

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
    ArgumentError.checkNotNull(logGroupName, 'logGroupName');
    _s.validateStringLength(
      'logGroupName',
      logGroupName,
      1,
      512,
      isRequired: true,
    );
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

  /// Creates or updates a destination. This operation is used only to create
  /// destinations for cross-account subscriptions.
  ///
  /// A destination encapsulates a physical resource (such as an Amazon Kinesis
  /// stream) and enables you to subscribe to a real-time stream of log events
  /// for a different account, ingested using <a
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
  Future<PutDestinationResponse> putDestination({
    required String destinationName,
    required String roleArn,
    required String targetArn,
  }) async {
    ArgumentError.checkNotNull(destinationName, 'destinationName');
    _s.validateStringLength(
      'destinationName',
      destinationName,
      1,
      512,
      isRequired: true,
    );
    ArgumentError.checkNotNull(roleArn, 'roleArn');
    _s.validateStringLength(
      'roleArn',
      roleArn,
      1,
      1152921504606846976,
      isRequired: true,
    );
    ArgumentError.checkNotNull(targetArn, 'targetArn');
    _s.validateStringLength(
      'targetArn',
      targetArn,
      1,
      1152921504606846976,
      isRequired: true,
    );
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
  /// If multiple AWS accounts are sending logs to this destination, each sender
  /// account must be listed separately in the policy. The policy does not
  /// support specifying <code>*</code> as the Principal or the use of the
  /// <code>aws:PrincipalOrgId</code> global key.
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
  Future<void> putDestinationPolicy({
    required String accessPolicy,
    required String destinationName,
  }) async {
    ArgumentError.checkNotNull(accessPolicy, 'accessPolicy');
    _s.validateStringLength(
      'accessPolicy',
      accessPolicy,
      1,
      1152921504606846976,
      isRequired: true,
    );
    ArgumentError.checkNotNull(destinationName, 'destinationName');
    _s.validateStringLength(
      'destinationName',
      destinationName,
      1,
      512,
      isRequired: true,
    );
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
      },
    );
  }

  /// Uploads a batch of log events to the specified log stream.
  ///
  /// You must include the sequence token obtained from the response of the
  /// previous call. An upload in a newly created log stream does not require a
  /// sequence token. You can also get the sequence token in the
  /// <code>expectedSequenceToken</code> field from
  /// <code>InvalidSequenceTokenException</code>. If you call
  /// <code>PutLogEvents</code> twice within a narrow time period using the same
  /// value for <code>sequenceToken</code>, both calls might be successful or
  /// one might be rejected.
  ///
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
  /// None of the log events in the batch can be older than 14 days or older
  /// than the retention period of the log group.
  /// </li>
  /// <li>
  /// The log events in the batch must be in chronological order by their
  /// timestamp. The timestamp is the time the event occurred, expressed as the
  /// number of milliseconds after Jan 1, 1970 00:00:00 UTC. (In AWS Tools for
  /// PowerShell and the AWS SDK for .NET, the timestamp is specified in .NET
  /// format: yyyy-mm-ddThh:mm:ss. For example, 2017-09-15T13:45:30.)
  /// </li>
  /// <li>
  /// A batch of log events in a single request cannot span more than 24 hours.
  /// Otherwise, the operation fails.
  /// </li>
  /// <li>
  /// The maximum number of log events in a batch is 10,000.
  /// </li>
  /// <li>
  /// There is a quota of 5 requests per second per log stream. Additional
  /// requests are throttled. This quota can't be changed.
  /// </li>
  /// </ul>
  /// If a call to <code>PutLogEvents</code> returns
  /// "UnrecognizedClientException" the most likely cause is an invalid AWS
  /// access key ID or secret key.
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
  /// <code>PutLogEvents</code> call. An upload in a newly created log stream
  /// does not require a sequence token. You can also get the sequence token
  /// using <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeLogStreams.html">DescribeLogStreams</a>.
  /// If you call <code>PutLogEvents</code> twice within a narrow time period
  /// using the same value for <code>sequenceToken</code>, both calls might be
  /// successful or one might be rejected.
  Future<PutLogEventsResponse> putLogEvents({
    required List<InputLogEvent> logEvents,
    required String logGroupName,
    required String logStreamName,
    String? sequenceToken,
  }) async {
    ArgumentError.checkNotNull(logEvents, 'logEvents');
    ArgumentError.checkNotNull(logGroupName, 'logGroupName');
    _s.validateStringLength(
      'logGroupName',
      logGroupName,
      1,
      512,
      isRequired: true,
    );
    ArgumentError.checkNotNull(logStreamName, 'logStreamName');
    _s.validateStringLength(
      'logStreamName',
      logStreamName,
      1,
      512,
      isRequired: true,
    );
    _s.validateStringLength(
      'sequenceToken',
      sequenceToken,
      1,
      1152921504606846976,
    );
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
  /// log group. Metric filters allow you to configure rules to extract metric
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
  /// To help prevent accidental high charges, Amazon disables a metric filter
  /// if it generates 1000 different name/value pairs for the dimensions that
  /// you have specified within a certain amount of time.
  ///
  /// You can also set up a billing alarm to alert you if your charges are
  /// higher than expected. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/monitor_estimated_charges_with_cloudwatch.html">
  /// Creating a Billing Alarm to Monitor Your Estimated AWS Charges</a>.
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
    ArgumentError.checkNotNull(filterName, 'filterName');
    _s.validateStringLength(
      'filterName',
      filterName,
      1,
      512,
      isRequired: true,
    );
    ArgumentError.checkNotNull(filterPattern, 'filterPattern');
    _s.validateStringLength(
      'filterPattern',
      filterPattern,
      0,
      1024,
      isRequired: true,
    );
    ArgumentError.checkNotNull(logGroupName, 'logGroupName');
    _s.validateStringLength(
      'logGroupName',
      logGroupName,
      1,
      512,
      isRequired: true,
    );
    ArgumentError.checkNotNull(metricTransformations, 'metricTransformations');
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
  /// are retained from the current query definition. For example, if you update
  /// a current query definition that includes log groups, and you don't specify
  /// the <code>logGroupNames</code> parameter in your update operation, the
  /// query definition changes to contain no log groups.
  ///
  /// You must have the <code>logs:PutQueryDefinition</code> permission to be
  /// able to perform this operation.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [name] :
  /// A name for the query definition. If you are saving a lot of query
  /// definitions, we recommend that you name them so that you can easily find
  /// the ones you want by using the first part of the name as a filter in the
  /// <code>queryDefinitionNamePrefix</code> parameter of <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeQueryDefinitions.html">DescribeQueryDefinitions</a>.
  ///
  /// Parameter [queryString] :
  /// The query string to use for this definition. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_QuerySyntax.html">CloudWatch
  /// Logs Insights Query Syntax</a>.
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
    List<String>? logGroupNames,
    String? queryDefinitionId,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(queryString, 'queryString');
    _s.validateStringLength(
      'queryString',
      queryString,
      1,
      10000,
      isRequired: true,
    );
    _s.validateStringLength(
      'queryDefinitionId',
      queryDefinitionId,
      0,
      256,
    );
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
        if (logGroupNames != null) 'logGroupNames': logGroupNames,
        if (queryDefinitionId != null) 'queryDefinitionId': queryDefinitionId,
      },
    );

    return PutQueryDefinitionResponse.fromJson(jsonResponse.body);
  }

  /// Creates or updates a resource policy allowing other AWS services to put
  /// log events to this account, such as Amazon Route 53. An account can have
  /// up to 10 resource policies per AWS Region.
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
  /// <code>{ "Version": "2012-10-17", "Statement": [ { "Sid":
  /// "Route53LogsToCloudWatchLogs", "Effect": "Allow", "Principal": {
  /// "Service": [ "route53.amazonaws.com" ] }, "Action":"logs:PutLogEvents",
  /// "Resource": "logArn" } ] } </code>
  ///
  /// Parameter [policyName] :
  /// Name of the new policy. This parameter is required.
  Future<PutResourcePolicyResponse> putResourcePolicy({
    String? policyDocument,
    String? policyName,
  }) async {
    _s.validateStringLength(
      'policyDocument',
      policyDocument,
      1,
      5120,
    );
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

  /// Sets the retention of the specified log group. A retention policy allows
  /// you to configure the number of days for which to retain log events in the
  /// specified log group.
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
    ArgumentError.checkNotNull(logGroupName, 'logGroupName');
    _s.validateStringLength(
      'logGroupName',
      logGroupName,
      1,
      512,
      isRequired: true,
    );
    ArgumentError.checkNotNull(retentionInDays, 'retentionInDays');
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
  /// specified log group. Subscription filters allow you to subscribe to a
  /// real-time stream of log events ingested through <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutLogEvents.html">PutLogEvents</a>
  /// and have them delivered to a specific destination. When log events are
  /// sent to the receiving service, they are Base64 encoded and compressed with
  /// the gzip format.
  ///
  /// The following destinations are supported for subscription filters:
  ///
  /// <ul>
  /// <li>
  /// An Amazon Kinesis stream belonging to the same account as the subscription
  /// filter, for same-account delivery.
  /// </li>
  /// <li>
  /// A logical destination that belongs to a different account, for
  /// cross-account delivery.
  /// </li>
  /// <li>
  /// An Amazon Kinesis Firehose delivery stream that belongs to the same
  /// account as the subscription filter, for same-account delivery.
  /// </li>
  /// <li>
  /// An AWS Lambda function that belongs to the same account as the
  /// subscription filter, for same-account delivery.
  /// </li>
  /// </ul>
  /// Each log group can have up to two subscription filters associated with it.
  /// If you are updating an existing filter, you must specify the correct name
  /// in <code>filterName</code>.
  ///
  /// To perform a <code>PutSubscriptionFilter</code> operation, you must also
  /// have the <code>iam:PassRole</code> permission.
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
  /// If you are setting up a cross-account subscription, the destination must
  /// have an IAM policy associated with it that allows the sender to send logs
  /// to the destination. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDestinationPolicy.html">PutDestinationPolicy</a>.
  /// </li>
  /// <li>
  /// An Amazon Kinesis Firehose delivery stream belonging to the same account
  /// as the subscription filter, for same-account delivery.
  /// </li>
  /// <li>
  /// An AWS Lambda function belonging to the same account as the subscription
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
  /// destination is an Amazon Kinesis stream.
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
    ArgumentError.checkNotNull(destinationArn, 'destinationArn');
    _s.validateStringLength(
      'destinationArn',
      destinationArn,
      1,
      1152921504606846976,
      isRequired: true,
    );
    ArgumentError.checkNotNull(filterName, 'filterName');
    _s.validateStringLength(
      'filterName',
      filterName,
      1,
      512,
      isRequired: true,
    );
    ArgumentError.checkNotNull(filterPattern, 'filterPattern');
    _s.validateStringLength(
      'filterPattern',
      filterPattern,
      0,
      1024,
      isRequired: true,
    );
    ArgumentError.checkNotNull(logGroupName, 'logGroupName');
    _s.validateStringLength(
      'logGroupName',
      logGroupName,
      1,
      512,
      isRequired: true,
    );
    _s.validateStringLength(
      'roleArn',
      roleArn,
      1,
      1152921504606846976,
    );
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

  /// Schedules a query of a log group using CloudWatch Logs Insights. You
  /// specify the log group and time range to query and the query string to use.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_QuerySyntax.html">CloudWatch
  /// Logs Insights Query Syntax</a>.
  ///
  /// Queries time out after 15 minutes of execution. If your queries are timing
  /// out, reduce the time range being searched or partition your query into a
  /// number of queries.
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
  /// number of seconds since January 1, 1970, 00:00:00 UTC.
  ///
  /// Parameter [queryString] :
  /// The query string to use. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_QuerySyntax.html">CloudWatch
  /// Logs Insights Query Syntax</a>.
  ///
  /// Parameter [startTime] :
  /// The beginning of the time range to query. The range is inclusive, so the
  /// specified start time is included in the query. Specified as epoch time,
  /// the number of seconds since January 1, 1970, 00:00:00 UTC.
  ///
  /// Parameter [limit] :
  /// The maximum number of log events to return in the query. If the query
  /// string uses the <code>fields</code> command, only the specified fields and
  /// their values are returned. The default is 1000.
  ///
  /// Parameter [logGroupName] :
  /// The log group on which to perform the query.
  ///
  /// A <code>StartQuery</code> operation must include a
  /// <code>logGroupNames</code> or a <code>logGroupName</code> parameter, but
  /// not both.
  ///
  /// Parameter [logGroupNames] :
  /// The list of log groups to be queried. You can include up to 20 log groups.
  ///
  /// A <code>StartQuery</code> operation must include a
  /// <code>logGroupNames</code> or a <code>logGroupName</code> parameter, but
  /// not both.
  Future<StartQueryResponse> startQuery({
    required int endTime,
    required String queryString,
    required int startTime,
    int? limit,
    String? logGroupName,
    List<String>? logGroupNames,
  }) async {
    ArgumentError.checkNotNull(endTime, 'endTime');
    _s.validateNumRange(
      'endTime',
      endTime,
      0,
      1152921504606846976,
      isRequired: true,
    );
    ArgumentError.checkNotNull(queryString, 'queryString');
    _s.validateStringLength(
      'queryString',
      queryString,
      0,
      10000,
      isRequired: true,
    );
    ArgumentError.checkNotNull(startTime, 'startTime');
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
    _s.validateStringLength(
      'logGroupName',
      logGroupName,
      1,
      512,
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
    ArgumentError.checkNotNull(queryId, 'queryId');
    _s.validateStringLength(
      'queryId',
      queryId,
      0,
      256,
      isRequired: true,
    );
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

  /// Adds or updates the specified tags for the specified log group.
  ///
  /// To list the tags for a log group, use <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_ListTagsLogGroup.html">ListTagsLogGroup</a>.
  /// To remove tags, use <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_UntagLogGroup.html">UntagLogGroup</a>.
  ///
  /// For more information about tags, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/Working-with-log-groups-and-streams.html#log-group-tagging">Tag
  /// Log Groups in Amazon CloudWatch Logs</a> in the <i>Amazon CloudWatch Logs
  /// User Guide</i>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
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
    ArgumentError.checkNotNull(logGroupName, 'logGroupName');
    _s.validateStringLength(
      'logGroupName',
      logGroupName,
      1,
      512,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
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
    ArgumentError.checkNotNull(filterPattern, 'filterPattern');
    _s.validateStringLength(
      'filterPattern',
      filterPattern,
      0,
      1024,
      isRequired: true,
    );
    ArgumentError.checkNotNull(logEventMessages, 'logEventMessages');
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

  /// Removes the specified tags from the specified log group.
  ///
  /// To list the tags for a log group, use <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_ListTagsLogGroup.html">ListTagsLogGroup</a>.
  /// To add tags, use <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_TagLogGroup.html">TagLogGroup</a>.
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
    ArgumentError.checkNotNull(logGroupName, 'logGroupName');
    _s.validateStringLength(
      'logGroupName',
      logGroupName,
      1,
      512,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
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
  /// If the <code>retentionInDays</code> value if not included for a log group,
  /// then that log group is set to have its events never expire.
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
  /// An IAM policy document that governs which AWS accounts can create
  /// subscription filters against this destination.
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

extension on Distribution {
  String toValue() {
    switch (this) {
      case Distribution.random:
        return 'Random';
      case Distribution.byLogStream:
        return 'ByLogStream';
    }
  }
}

extension on String {
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

/// Represents an export task.
class ExportTask {
  /// The name of the S3 bucket to which the log data was exported.
  final String? destination;

  /// The prefix that was used as the start of Amazon S3 key for every object
  /// exported.
  final String? destinationPrefix;

  /// Execution information about the export task.
  final ExportTaskExecutionInfo? executionInfo;

  /// The start time, expressed as the number of milliseconds after Jan 1, 1970
  /// 00:00:00 UTC. Events with a timestamp before this time are not exported.
  final int? from;

  /// The name of the log group from which logs data was exported.
  final String? logGroupName;

  /// The status of the export task.
  final ExportTaskStatus? status;

  /// The ID of the export task.
  final String? taskId;

  /// The name of the export task.
  final String? taskName;

  /// The end time, expressed as the number of milliseconds after Jan 1, 1970
  /// 00:00:00 UTC. Events with a timestamp later than this time are not exported.
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
  /// milliseconds after Jan 1, 1970 00:00:00 UTC.
  final int? completionTime;

  /// The creation time of the export task, expressed as the number of
  /// milliseconds after Jan 1, 1970 00:00:00 UTC.
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

extension on ExportTaskStatusCode {
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

extension on String {
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

  /// <b>IMPORTANT</b> Starting on May 15, 2020, this parameter will be
  /// deprecated. This parameter will be an empty list after the deprecation
  /// occurs.
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
  /// after Jan 1, 1970 00:00:00 UTC.
  final int? ingestionTime;

  /// The name of the log stream to which this event belongs.
  final String? logStreamName;

  /// The data contained in the log event.
  final String? message;

  /// The time the event occurred, expressed as the number of milliseconds after
  /// Jan 1, 1970 00:00:00 UTC.
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

class GetLogEventsResponse {
  /// The events.
  final List<OutputLogEvent>? events;

  /// The token for the next set of items in the backward direction. The token
  /// expires after 24 hours. This token is never null. If you have reached the
  /// end of the stream, it returns the same token you passed in.
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
  /// The log events that matched the query criteria during the most recent time
  /// it ran.
  ///
  /// The <code>results</code> value is an array of arrays. Each log event is one
  /// object in the top-level array. Each of these log event objects is an array
  /// of <code>field</code>/<code>value</code> pairs.
  final List<List<ResultField>>? results;

  /// Includes the number of log events scanned by the query, the number of log
  /// events that matched the query criteria, and the total number of bytes in the
  /// log events that were scanned. These values reflect the full raw results of
  /// the query.
  final QueryStatistics? statistics;

  /// The status of the most recent running of the query. Possible values are
  /// <code>Cancelled</code>, <code>Complete</code>, <code>Failed</code>,
  /// <code>Running</code>, <code>Scheduled</code>, <code>Timeout</code>, and
  /// <code>Unknown</code>.
  ///
  /// Queries time out after 15 minutes of execution. To avoid having your queries
  /// time out, reduce the time range being searched or partition your query into
  /// a number of queries.
  final QueryStatus? status;

  GetQueryResultsResponse({
    this.results,
    this.statistics,
    this.status,
  });

  factory GetQueryResultsResponse.fromJson(Map<String, dynamic> json) {
    return GetQueryResultsResponse(
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
    final results = this.results;
    final statistics = this.statistics;
    final status = this.status;
    return {
      if (results != null) 'results': results,
      if (statistics != null) 'statistics': statistics,
      if (status != null) 'status': status.toValue(),
    };
  }
}

/// Represents a log event, which is a record of activity that was recorded by
/// the application or resource being monitored.
class InputLogEvent {
  /// The raw event message.
  final String message;

  /// The time the event occurred, expressed as the number of milliseconds after
  /// Jan 1, 1970 00:00:00 UTC.
  final int timestamp;

  InputLogEvent({
    required this.message,
    required this.timestamp,
  });

  factory InputLogEvent.fromJson(Map<String, dynamic> json) {
    return InputLogEvent(
      message: json['message'] as String,
      timestamp: json['timestamp'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    final timestamp = this.timestamp;
    return {
      'message': message,
      'timestamp': timestamp,
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

/// Represents a log group.
class LogGroup {
  /// The Amazon Resource Name (ARN) of the log group.
  final String? arn;

  /// The creation time of the log group, expressed as the number of milliseconds
  /// after Jan 1, 1970 00:00:00 UTC.
  final int? creationTime;

  /// The Amazon Resource Name (ARN) of the CMK to use when encrypting log data.
  final String? kmsKeyId;

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
    this.kmsKeyId,
    this.logGroupName,
    this.metricFilterCount,
    this.retentionInDays,
    this.storedBytes,
  });

  factory LogGroup.fromJson(Map<String, dynamic> json) {
    return LogGroup(
      arn: json['arn'] as String?,
      creationTime: json['creationTime'] as int?,
      kmsKeyId: json['kmsKeyId'] as String?,
      logGroupName: json['logGroupName'] as String?,
      metricFilterCount: json['metricFilterCount'] as int?,
      retentionInDays: json['retentionInDays'] as int?,
      storedBytes: json['storedBytes'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final kmsKeyId = this.kmsKeyId;
    final logGroupName = this.logGroupName;
    final metricFilterCount = this.metricFilterCount;
    final retentionInDays = this.retentionInDays;
    final storedBytes = this.storedBytes;
    return {
      if (arn != null) 'arn': arn,
      if (creationTime != null) 'creationTime': creationTime,
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
      if (logGroupName != null) 'logGroupName': logGroupName,
      if (metricFilterCount != null) 'metricFilterCount': metricFilterCount,
      if (retentionInDays != null) 'retentionInDays': retentionInDays,
      if (storedBytes != null) 'storedBytes': storedBytes,
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

/// Represents a log stream, which is a sequence of log events from a single
/// emitter of logs.
class LogStream {
  /// The Amazon Resource Name (ARN) of the log stream.
  final String? arn;

  /// The creation time of the stream, expressed as the number of milliseconds
  /// after Jan 1, 1970 00:00:00 UTC.
  final int? creationTime;

  /// The time of the first event, expressed as the number of milliseconds after
  /// Jan 1, 1970 00:00:00 UTC.
  final int? firstEventTimestamp;

  /// The time of the most recent log event in the log stream in CloudWatch Logs.
  /// This number is expressed as the number of milliseconds after Jan 1, 1970
  /// 00:00:00 UTC. The <code>lastEventTime</code> value updates on an eventual
  /// consistency basis. It typically updates in less than an hour from ingestion,
  /// but in rare situations might take longer.
  final int? lastEventTimestamp;

  /// The ingestion time, expressed as the number of milliseconds after Jan 1,
  /// 1970 00:00:00 UTC.
  final int? lastIngestionTime;

  /// The name of the log stream.
  final String? logStreamName;

  /// The number of bytes stored.
  ///
  /// <b>Important:</b> On June 17, 2019, this parameter was deprecated for log
  /// streams, and is always reported as zero. This change applies only to log
  /// streams. The <code>storedBytes</code> parameter for log groups is not
  /// affected.
  final int? storedBytes;

  /// The sequence token.
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
  /// milliseconds after Jan 1, 1970 00:00:00 UTC.
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
  /// To help prevent accidental high charges, Amazon disables a metric filter if
  /// it generates 1000 different name/value pairs for the dimensions that you
  /// have specified within a certain amount of time.
  ///
  /// You can also set up a billing alarm to alert you if your charges are higher
  /// than expected. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/monitor_estimated_charges_with_cloudwatch.html">
  /// Creating a Billing Alarm to Monitor Your Estimated AWS Charges</a>.
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

extension on OrderBy {
  String toValue() {
    switch (this) {
      case OrderBy.logStreamName:
        return 'LogStreamName';
      case OrderBy.lastEventTime:
        return 'LastEventTime';
    }
  }
}

extension on String {
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

/// Represents a log event.
class OutputLogEvent {
  /// The time the event was ingested, expressed as the number of milliseconds
  /// after Jan 1, 1970 00:00:00 UTC.
  final int? ingestionTime;

  /// The data contained in the log event.
  final String? message;

  /// The time the event occurred, expressed as the number of milliseconds after
  /// Jan 1, 1970 00:00:00 UTC.
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

extension on QueryStatus {
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

extension on String {
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

  /// The log events that are too new.
  final int? tooNewLogEventStartIndex;

  /// The log events that are too old.
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
  /// of milliseconds after Jan 1, 1970 00:00:00 UTC.
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

extension on StandardUnit {
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

extension on String {
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

/// Represents a subscription filter.
class SubscriptionFilter {
  /// The creation time of the subscription filter, expressed as the number of
  /// milliseconds after Jan 1, 1970 00:00:00 UTC.
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

class ServiceUnavailableException extends _s.GenericAwsException {
  ServiceUnavailableException({String? type, String? message})
      : super(
            type: type, code: 'ServiceUnavailableException', message: message);
}

class UnrecognizedClientException extends _s.GenericAwsException {
  UnrecognizedClientException({String? type, String? message})
      : super(
            type: type, code: 'UnrecognizedClientException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
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
  'ServiceUnavailableException': (type, message) =>
      ServiceUnavailableException(type: type, message: message),
  'UnrecognizedClientException': (type, message) =>
      UnrecognizedClientException(type: type, message: message),
};
