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

part '2014-03-28.g.dart';

/// You can use Amazon CloudWatch Logs to monitor, store, and access your log
/// files from EC2 instances, AWS CloudTrail, or other sources. You can then
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
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
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
    @_s.required String kmsKeyId,
    @_s.required String logGroupName,
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
    _s.validateStringPattern(
      'logGroupName',
      logGroupName,
      r'''[\.\-_/#A-Za-z0-9]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.AssociateKmsKey'
    };
    final jsonResponse = await _protocol.send(
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
    @_s.required String taskId,
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
    final jsonResponse = await _protocol.send(
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
  /// The end time of the range for the request, expressed as the number of
  /// milliseconds after Jan 1, 1970 00:00:00 UTC. Events with a timestamp later
  /// than this time are not exported.
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
    @_s.required String destination,
    @_s.required int from,
    @_s.required String logGroupName,
    @_s.required int to,
    String destinationPrefix,
    String logStreamNamePrefix,
    String taskName,
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
    _s.validateStringPattern(
      'logGroupName',
      logGroupName,
      r'''[\.\-_/#A-Za-z0-9]+''',
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
    _s.validateStringPattern(
      'logStreamNamePrefix',
      logStreamNamePrefix,
      r'''[^:*]*''',
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
    @_s.required String logGroupName,
    String kmsKeyId,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(logGroupName, 'logGroupName');
    _s.validateStringLength(
      'logGroupName',
      logGroupName,
      1,
      512,
      isRequired: true,
    );
    _s.validateStringPattern(
      'logGroupName',
      logGroupName,
      r'''[\.\-_/#A-Za-z0-9]+''',
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
    final jsonResponse = await _protocol.send(
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
    @_s.required String logGroupName,
    @_s.required String logStreamName,
  }) async {
    ArgumentError.checkNotNull(logGroupName, 'logGroupName');
    _s.validateStringLength(
      'logGroupName',
      logGroupName,
      1,
      512,
      isRequired: true,
    );
    _s.validateStringPattern(
      'logGroupName',
      logGroupName,
      r'''[\.\-_/#A-Za-z0-9]+''',
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
    _s.validateStringPattern(
      'logStreamName',
      logStreamName,
      r'''[^:*]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.CreateLogStream'
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
    @_s.required String destinationName,
  }) async {
    ArgumentError.checkNotNull(destinationName, 'destinationName');
    _s.validateStringLength(
      'destinationName',
      destinationName,
      1,
      512,
      isRequired: true,
    );
    _s.validateStringPattern(
      'destinationName',
      destinationName,
      r'''[^:*]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.DeleteDestination'
    };
    final jsonResponse = await _protocol.send(
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
    @_s.required String logGroupName,
  }) async {
    ArgumentError.checkNotNull(logGroupName, 'logGroupName');
    _s.validateStringLength(
      'logGroupName',
      logGroupName,
      1,
      512,
      isRequired: true,
    );
    _s.validateStringPattern(
      'logGroupName',
      logGroupName,
      r'''[\.\-_/#A-Za-z0-9]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.DeleteLogGroup'
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
    @_s.required String logGroupName,
    @_s.required String logStreamName,
  }) async {
    ArgumentError.checkNotNull(logGroupName, 'logGroupName');
    _s.validateStringLength(
      'logGroupName',
      logGroupName,
      1,
      512,
      isRequired: true,
    );
    _s.validateStringPattern(
      'logGroupName',
      logGroupName,
      r'''[\.\-_/#A-Za-z0-9]+''',
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
    _s.validateStringPattern(
      'logStreamName',
      logStreamName,
      r'''[^:*]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.DeleteLogStream'
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
    @_s.required String filterName,
    @_s.required String logGroupName,
  }) async {
    ArgumentError.checkNotNull(filterName, 'filterName');
    _s.validateStringLength(
      'filterName',
      filterName,
      1,
      512,
      isRequired: true,
    );
    _s.validateStringPattern(
      'filterName',
      filterName,
      r'''[^:*]*''',
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
    _s.validateStringPattern(
      'logGroupName',
      logGroupName,
      r'''[\.\-_/#A-Za-z0-9]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.DeleteMetricFilter'
    };
    final jsonResponse = await _protocol.send(
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
    @_s.required String queryDefinitionId,
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
    String policyName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.DeleteResourcePolicy'
    };
    final jsonResponse = await _protocol.send(
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
    @_s.required String logGroupName,
  }) async {
    ArgumentError.checkNotNull(logGroupName, 'logGroupName');
    _s.validateStringLength(
      'logGroupName',
      logGroupName,
      1,
      512,
      isRequired: true,
    );
    _s.validateStringPattern(
      'logGroupName',
      logGroupName,
      r'''[\.\-_/#A-Za-z0-9]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.DeleteRetentionPolicy'
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
    @_s.required String filterName,
    @_s.required String logGroupName,
  }) async {
    ArgumentError.checkNotNull(filterName, 'filterName');
    _s.validateStringLength(
      'filterName',
      filterName,
      1,
      512,
      isRequired: true,
    );
    _s.validateStringPattern(
      'filterName',
      filterName,
      r'''[^:*]*''',
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
    _s.validateStringPattern(
      'logGroupName',
      logGroupName,
      r'''[\.\-_/#A-Za-z0-9]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.DeleteSubscriptionFilter'
    };
    final jsonResponse = await _protocol.send(
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
    String destinationNamePrefix,
    int limit,
    String nextToken,
  }) async {
    _s.validateStringLength(
      'destinationNamePrefix',
      destinationNamePrefix,
      1,
      512,
    );
    _s.validateStringPattern(
      'destinationNamePrefix',
      destinationNamePrefix,
      r'''[^:*]*''',
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
    int limit,
    String nextToken,
    ExportTaskStatusCode statusCode,
    String taskId,
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
    int limit,
    String logGroupNamePrefix,
    String nextToken,
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
    _s.validateStringPattern(
      'logGroupNamePrefix',
      logGroupNamePrefix,
      r'''[\.\-_/#A-Za-z0-9]+''',
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
  /// <code>lastEventTimeStamp</code> represents the time of the most recent log
  /// event in the log stream in CloudWatch Logs. This number is expressed as
  /// the number of milliseconds after Jan 1, 1970 00:00:00 UTC.
  /// <code>lastEventTimeStamp</code> updates on an eventual consistency basis.
  /// It typically updates in less than an hour from ingestion, but in rare
  /// situations might take longer.
  Future<DescribeLogStreamsResponse> describeLogStreams({
    @_s.required String logGroupName,
    bool descending,
    int limit,
    String logStreamNamePrefix,
    String nextToken,
    OrderBy orderBy,
  }) async {
    ArgumentError.checkNotNull(logGroupName, 'logGroupName');
    _s.validateStringLength(
      'logGroupName',
      logGroupName,
      1,
      512,
      isRequired: true,
    );
    _s.validateStringPattern(
      'logGroupName',
      logGroupName,
      r'''[\.\-_/#A-Za-z0-9]+''',
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
    _s.validateStringPattern(
      'logStreamNamePrefix',
      logStreamNamePrefix,
      r'''[^:*]*''',
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
    String filterNamePrefix,
    int limit,
    String logGroupName,
    String metricName,
    String metricNamespace,
    String nextToken,
  }) async {
    _s.validateStringLength(
      'filterNamePrefix',
      filterNamePrefix,
      1,
      512,
    );
    _s.validateStringPattern(
      'filterNamePrefix',
      filterNamePrefix,
      r'''[^:*]*''',
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
    _s.validateStringPattern(
      'logGroupName',
      logGroupName,
      r'''[\.\-_/#A-Za-z0-9]+''',
    );
    _s.validateStringLength(
      'metricName',
      metricName,
      0,
      255,
    );
    _s.validateStringPattern(
      'metricName',
      metricName,
      r'''[^:*$]*''',
    );
    _s.validateStringLength(
      'metricNamespace',
      metricNamespace,
      0,
      255,
    );
    _s.validateStringPattern(
      'metricNamespace',
      metricNamespace,
      r'''[^:*$]*''',
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
    String logGroupName,
    int maxResults,
    String nextToken,
    QueryStatus status,
  }) async {
    _s.validateStringLength(
      'logGroupName',
      logGroupName,
      1,
      512,
    );
    _s.validateStringPattern(
      'logGroupName',
      logGroupName,
      r'''[\.\-_/#A-Za-z0-9]+''',
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
    int maxResults,
    String nextToken,
    String queryDefinitionNamePrefix,
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
    _s.validateStringPattern(
      'queryDefinitionNamePrefix',
      queryDefinitionNamePrefix,
      r'''^([^:*\/]+\/?)*[^:*\/]+$''',
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
    int limit,
    String nextToken,
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
    @_s.required String logGroupName,
    String filterNamePrefix,
    int limit,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(logGroupName, 'logGroupName');
    _s.validateStringLength(
      'logGroupName',
      logGroupName,
      1,
      512,
      isRequired: true,
    );
    _s.validateStringPattern(
      'logGroupName',
      logGroupName,
      r'''[\.\-_/#A-Za-z0-9]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'filterNamePrefix',
      filterNamePrefix,
      1,
      512,
    );
    _s.validateStringPattern(
      'filterNamePrefix',
      filterNamePrefix,
      r'''[^:*]*''',
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
    @_s.required String logGroupName,
  }) async {
    ArgumentError.checkNotNull(logGroupName, 'logGroupName');
    _s.validateStringLength(
      'logGroupName',
      logGroupName,
      1,
      512,
      isRequired: true,
    );
    _s.validateStringPattern(
      'logGroupName',
      logGroupName,
      r'''[\.\-_/#A-Za-z0-9]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.DisassociateKmsKey'
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
  ///
  /// If you omit <code>startTime</code> and <code>endTime</code> the most
  /// recent log events are retrieved, to up 1 MB or 10,000 log events.
  Future<FilterLogEventsResponse> filterLogEvents({
    @_s.required String logGroupName,
    int endTime,
    String filterPattern,
    bool interleaved,
    int limit,
    String logStreamNamePrefix,
    List<String> logStreamNames,
    String nextToken,
    int startTime,
  }) async {
    ArgumentError.checkNotNull(logGroupName, 'logGroupName');
    _s.validateStringLength(
      'logGroupName',
      logGroupName,
      1,
      512,
      isRequired: true,
    );
    _s.validateStringPattern(
      'logGroupName',
      logGroupName,
      r'''[\.\-_/#A-Za-z0-9]+''',
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
    _s.validateStringPattern(
      'logStreamNamePrefix',
      logStreamNamePrefix,
      r'''[^:*]*''',
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
    @_s.required String logGroupName,
    @_s.required String logStreamName,
    int endTime,
    int limit,
    String nextToken,
    bool startFromHead,
    int startTime,
  }) async {
    ArgumentError.checkNotNull(logGroupName, 'logGroupName');
    _s.validateStringLength(
      'logGroupName',
      logGroupName,
      1,
      512,
      isRequired: true,
    );
    _s.validateStringPattern(
      'logGroupName',
      logGroupName,
      r'''[\.\-_/#A-Za-z0-9]+''',
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
    _s.validateStringPattern(
      'logStreamName',
      logStreamName,
      r'''[^:*]*''',
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
  /// <code>time</code>, the 8 minutes before and 8 minutes after this time are
  /// searched. If you omit <code>time</code>, the past 15 minutes are queried.
  ///
  /// The <code>time</code> value is specified as epoch time, the number of
  /// seconds since January 1, 1970, 00:00:00 UTC.
  Future<GetLogGroupFieldsResponse> getLogGroupFields({
    @_s.required String logGroupName,
    int time,
  }) async {
    ArgumentError.checkNotNull(logGroupName, 'logGroupName');
    _s.validateStringLength(
      'logGroupName',
      logGroupName,
      1,
      512,
      isRequired: true,
    );
    _s.validateStringPattern(
      'logGroupName',
      logGroupName,
      r'''[\.\-_/#A-Za-z0-9]+''',
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
    @_s.required String logRecordPointer,
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
    @_s.required String queryId,
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
    @_s.required String logGroupName,
  }) async {
    ArgumentError.checkNotNull(logGroupName, 'logGroupName');
    _s.validateStringLength(
      'logGroupName',
      logGroupName,
      1,
      512,
      isRequired: true,
    );
    _s.validateStringPattern(
      'logGroupName',
      logGroupName,
      r'''[\.\-_/#A-Za-z0-9]+''',
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
    @_s.required String destinationName,
    @_s.required String roleArn,
    @_s.required String targetArn,
  }) async {
    ArgumentError.checkNotNull(destinationName, 'destinationName');
    _s.validateStringLength(
      'destinationName',
      destinationName,
      1,
      512,
      isRequired: true,
    );
    _s.validateStringPattern(
      'destinationName',
      destinationName,
      r'''[^:*]*''',
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
    @_s.required String accessPolicy,
    @_s.required String destinationName,
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
    _s.validateStringPattern(
      'destinationName',
      destinationName,
      r'''[^:*]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.PutDestinationPolicy'
    };
    final jsonResponse = await _protocol.send(
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
    @_s.required List<InputLogEvent> logEvents,
    @_s.required String logGroupName,
    @_s.required String logStreamName,
    String sequenceToken,
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
    _s.validateStringPattern(
      'logGroupName',
      logGroupName,
      r'''[\.\-_/#A-Za-z0-9]+''',
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
    _s.validateStringPattern(
      'logStreamName',
      logStreamName,
      r'''[^:*]*''',
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
    @_s.required String filterName,
    @_s.required String filterPattern,
    @_s.required String logGroupName,
    @_s.required List<MetricTransformation> metricTransformations,
  }) async {
    ArgumentError.checkNotNull(filterName, 'filterName');
    _s.validateStringLength(
      'filterName',
      filterName,
      1,
      512,
      isRequired: true,
    );
    _s.validateStringPattern(
      'filterName',
      filterName,
      r'''[^:*]*''',
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
    _s.validateStringPattern(
      'logGroupName',
      logGroupName,
      r'''[\.\-_/#A-Za-z0-9]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(metricTransformations, 'metricTransformations');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.PutMetricFilter'
    };
    final jsonResponse = await _protocol.send(
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
    @_s.required String name,
    @_s.required String queryString,
    List<String> logGroupNames,
    String queryDefinitionId,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^([^:*\/]+\/?)*[^:*\/]+$''',
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
    String policyDocument,
    String policyName,
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
    @_s.required String logGroupName,
    @_s.required int retentionInDays,
  }) async {
    ArgumentError.checkNotNull(logGroupName, 'logGroupName');
    _s.validateStringLength(
      'logGroupName',
      logGroupName,
      1,
      512,
      isRequired: true,
    );
    _s.validateStringPattern(
      'logGroupName',
      logGroupName,
      r'''[\.\-_/#A-Za-z0-9]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(retentionInDays, 'retentionInDays');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.PutRetentionPolicy'
    };
    final jsonResponse = await _protocol.send(
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
  /// There can only be one subscription filter associated with a log group. If
  /// you are updating an existing filter, you must specify the correct name in
  /// <code>filterName</code>. Otherwise, the call fails because you cannot
  /// associate a second filter with a log group.
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
  /// filter, you must specify the correct name in <code>filterName</code>.
  /// Otherwise, the call fails because you cannot associate a second filter
  /// with a log group. To find the name of the filter currently associated with
  /// a log group, use <a
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
    @_s.required String destinationArn,
    @_s.required String filterName,
    @_s.required String filterPattern,
    @_s.required String logGroupName,
    Distribution distribution,
    String roleArn,
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
    _s.validateStringPattern(
      'filterName',
      filterName,
      r'''[^:*]*''',
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
    _s.validateStringPattern(
      'logGroupName',
      logGroupName,
      r'''[\.\-_/#A-Za-z0-9]+''',
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
    final jsonResponse = await _protocol.send(
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
    @_s.required int endTime,
    @_s.required String queryString,
    @_s.required int startTime,
    int limit,
    String logGroupName,
    List<String> logGroupNames,
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
    _s.validateStringPattern(
      'logGroupName',
      logGroupName,
      r'''[\.\-_/#A-Za-z0-9]+''',
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
    @_s.required String queryId,
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
    @_s.required String logGroupName,
    @_s.required Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(logGroupName, 'logGroupName');
    _s.validateStringLength(
      'logGroupName',
      logGroupName,
      1,
      512,
      isRequired: true,
    );
    _s.validateStringPattern(
      'logGroupName',
      logGroupName,
      r'''[\.\-_/#A-Za-z0-9]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.TagLogGroup'
    };
    final jsonResponse = await _protocol.send(
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
    @_s.required String filterPattern,
    @_s.required List<String> logEventMessages,
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
    @_s.required String logGroupName,
    @_s.required List<String> tags,
  }) async {
    ArgumentError.checkNotNull(logGroupName, 'logGroupName');
    _s.validateStringLength(
      'logGroupName',
      logGroupName,
      1,
      512,
      isRequired: true,
    );
    _s.validateStringPattern(
      'logGroupName',
      logGroupName,
      r'''[\.\-_/#A-Za-z0-9]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Logs_20140328.UntagLogGroup'
    };
    final jsonResponse = await _protocol.send(
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

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateExportTaskResponse {
  /// The ID of the export task.
  @_s.JsonKey(name: 'taskId')
  final String taskId;

  CreateExportTaskResponse({
    this.taskId,
  });
  factory CreateExportTaskResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateExportTaskResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteQueryDefinitionResponse {
  /// A value of TRUE indicates that the operation succeeded. FALSE indicates that
  /// the operation failed.
  @_s.JsonKey(name: 'success')
  final bool success;

  DeleteQueryDefinitionResponse({
    this.success,
  });
  factory DeleteQueryDefinitionResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteQueryDefinitionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeDestinationsResponse {
  /// The destinations.
  @_s.JsonKey(name: 'destinations')
  final List<Destination> destinations;
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  DescribeDestinationsResponse({
    this.destinations,
    this.nextToken,
  });
  factory DescribeDestinationsResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeDestinationsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeExportTasksResponse {
  /// The export tasks.
  @_s.JsonKey(name: 'exportTasks')
  final List<ExportTask> exportTasks;
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  DescribeExportTasksResponse({
    this.exportTasks,
    this.nextToken,
  });
  factory DescribeExportTasksResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeExportTasksResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeLogGroupsResponse {
  /// The log groups.
  ///
  /// If the <code>retentionInDays</code> value if not included for a log group,
  /// then that log group is set to have its events never expire.
  @_s.JsonKey(name: 'logGroups')
  final List<LogGroup> logGroups;
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  DescribeLogGroupsResponse({
    this.logGroups,
    this.nextToken,
  });
  factory DescribeLogGroupsResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeLogGroupsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeLogStreamsResponse {
  /// The log streams.
  @_s.JsonKey(name: 'logStreams')
  final List<LogStream> logStreams;
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  DescribeLogStreamsResponse({
    this.logStreams,
    this.nextToken,
  });
  factory DescribeLogStreamsResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeLogStreamsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeMetricFiltersResponse {
  /// The metric filters.
  @_s.JsonKey(name: 'metricFilters')
  final List<MetricFilter> metricFilters;
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  DescribeMetricFiltersResponse({
    this.metricFilters,
    this.nextToken,
  });
  factory DescribeMetricFiltersResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeMetricFiltersResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeQueriesResponse {
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// The list of queries that match the request.
  @_s.JsonKey(name: 'queries')
  final List<QueryInfo> queries;

  DescribeQueriesResponse({
    this.nextToken,
    this.queries,
  });
  factory DescribeQueriesResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeQueriesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeQueryDefinitionsResponse {
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// The list of query definitions that match your request.
  @_s.JsonKey(name: 'queryDefinitions')
  final List<QueryDefinition> queryDefinitions;

  DescribeQueryDefinitionsResponse({
    this.nextToken,
    this.queryDefinitions,
  });
  factory DescribeQueryDefinitionsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeQueryDefinitionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeResourcePoliciesResponse {
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// The resource policies that exist in this account.
  @_s.JsonKey(name: 'resourcePolicies')
  final List<ResourcePolicy> resourcePolicies;

  DescribeResourcePoliciesResponse({
    this.nextToken,
    this.resourcePolicies,
  });
  factory DescribeResourcePoliciesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeResourcePoliciesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeSubscriptionFiltersResponse {
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// The subscription filters.
  @_s.JsonKey(name: 'subscriptionFilters')
  final List<SubscriptionFilter> subscriptionFilters;

  DescribeSubscriptionFiltersResponse({
    this.nextToken,
    this.subscriptionFilters,
  });
  factory DescribeSubscriptionFiltersResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeSubscriptionFiltersResponseFromJson(json);
}

/// Represents a cross-account destination that receives subscription log
/// events.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Destination {
  /// An IAM policy document that governs which AWS accounts can create
  /// subscription filters against this destination.
  @_s.JsonKey(name: 'accessPolicy')
  final String accessPolicy;

  /// The ARN of this destination.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The creation time of the destination, expressed as the number of
  /// milliseconds after Jan 1, 1970 00:00:00 UTC.
  @_s.JsonKey(name: 'creationTime')
  final int creationTime;

  /// The name of the destination.
  @_s.JsonKey(name: 'destinationName')
  final String destinationName;

  /// A role for impersonation, used when delivering log events to the target.
  @_s.JsonKey(name: 'roleArn')
  final String roleArn;

  /// The Amazon Resource Name (ARN) of the physical target where the log events
  /// are delivered (for example, a Kinesis stream).
  @_s.JsonKey(name: 'targetArn')
  final String targetArn;

  Destination({
    this.accessPolicy,
    this.arn,
    this.creationTime,
    this.destinationName,
    this.roleArn,
    this.targetArn,
  });
  factory Destination.fromJson(Map<String, dynamic> json) =>
      _$DestinationFromJson(json);
}

/// The method used to distribute log data to the destination, which can be
/// either random or grouped by log stream.
enum Distribution {
  @_s.JsonValue('Random')
  random,
  @_s.JsonValue('ByLogStream')
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
    throw Exception('Unknown enum value: $this');
  }
}

/// Represents an export task.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ExportTask {
  /// The name of the S3 bucket to which the log data was exported.
  @_s.JsonKey(name: 'destination')
  final String destination;

  /// The prefix that was used as the start of Amazon S3 key for every object
  /// exported.
  @_s.JsonKey(name: 'destinationPrefix')
  final String destinationPrefix;

  /// Execution information about the export task.
  @_s.JsonKey(name: 'executionInfo')
  final ExportTaskExecutionInfo executionInfo;

  /// The start time, expressed as the number of milliseconds after Jan 1, 1970
  /// 00:00:00 UTC. Events with a timestamp before this time are not exported.
  @_s.JsonKey(name: 'from')
  final int from;

  /// The name of the log group from which logs data was exported.
  @_s.JsonKey(name: 'logGroupName')
  final String logGroupName;

  /// The status of the export task.
  @_s.JsonKey(name: 'status')
  final ExportTaskStatus status;

  /// The ID of the export task.
  @_s.JsonKey(name: 'taskId')
  final String taskId;

  /// The name of the export task.
  @_s.JsonKey(name: 'taskName')
  final String taskName;

  /// The end time, expressed as the number of milliseconds after Jan 1, 1970
  /// 00:00:00 UTC. Events with a timestamp later than this time are not exported.
  @_s.JsonKey(name: 'to')
  final int to;

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
  factory ExportTask.fromJson(Map<String, dynamic> json) =>
      _$ExportTaskFromJson(json);
}

/// Represents the status of an export task.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ExportTaskExecutionInfo {
  /// The completion time of the export task, expressed as the number of
  /// milliseconds after Jan 1, 1970 00:00:00 UTC.
  @_s.JsonKey(name: 'completionTime')
  final int completionTime;

  /// The creation time of the export task, expressed as the number of
  /// milliseconds after Jan 1, 1970 00:00:00 UTC.
  @_s.JsonKey(name: 'creationTime')
  final int creationTime;

  ExportTaskExecutionInfo({
    this.completionTime,
    this.creationTime,
  });
  factory ExportTaskExecutionInfo.fromJson(Map<String, dynamic> json) =>
      _$ExportTaskExecutionInfoFromJson(json);
}

/// Represents the status of an export task.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ExportTaskStatus {
  /// The status code of the export task.
  @_s.JsonKey(name: 'code')
  final ExportTaskStatusCode code;

  /// The status message related to the status code.
  @_s.JsonKey(name: 'message')
  final String message;

  ExportTaskStatus({
    this.code,
    this.message,
  });
  factory ExportTaskStatus.fromJson(Map<String, dynamic> json) =>
      _$ExportTaskStatusFromJson(json);
}

enum ExportTaskStatusCode {
  @_s.JsonValue('CANCELLED')
  cancelled,
  @_s.JsonValue('COMPLETED')
  completed,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('PENDING')
  pending,
  @_s.JsonValue('PENDING_CANCEL')
  pendingCancel,
  @_s.JsonValue('RUNNING')
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
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FilterLogEventsResponse {
  /// The matched events.
  @_s.JsonKey(name: 'events')
  final List<FilteredLogEvent> events;

  /// The token to use when requesting the next set of items. The token expires
  /// after 24 hours.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// <b>IMPORTANT</b> Starting on May 15, 2020, this parameter will be
  /// deprecated. This parameter will be an empty list after the deprecation
  /// occurs.
  ///
  /// Indicates which log streams have been searched and whether each has been
  /// searched completely.
  @_s.JsonKey(name: 'searchedLogStreams')
  final List<SearchedLogStream> searchedLogStreams;

  FilterLogEventsResponse({
    this.events,
    this.nextToken,
    this.searchedLogStreams,
  });
  factory FilterLogEventsResponse.fromJson(Map<String, dynamic> json) =>
      _$FilterLogEventsResponseFromJson(json);
}

/// Represents a matched event.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FilteredLogEvent {
  /// The ID of the event.
  @_s.JsonKey(name: 'eventId')
  final String eventId;

  /// The time the event was ingested, expressed as the number of milliseconds
  /// after Jan 1, 1970 00:00:00 UTC.
  @_s.JsonKey(name: 'ingestionTime')
  final int ingestionTime;

  /// The name of the log stream to which this event belongs.
  @_s.JsonKey(name: 'logStreamName')
  final String logStreamName;

  /// The data contained in the log event.
  @_s.JsonKey(name: 'message')
  final String message;

  /// The time the event occurred, expressed as the number of milliseconds after
  /// Jan 1, 1970 00:00:00 UTC.
  @_s.JsonKey(name: 'timestamp')
  final int timestamp;

  FilteredLogEvent({
    this.eventId,
    this.ingestionTime,
    this.logStreamName,
    this.message,
    this.timestamp,
  });
  factory FilteredLogEvent.fromJson(Map<String, dynamic> json) =>
      _$FilteredLogEventFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetLogEventsResponse {
  /// The events.
  @_s.JsonKey(name: 'events')
  final List<OutputLogEvent> events;

  /// The token for the next set of items in the backward direction. The token
  /// expires after 24 hours. This token is never null. If you have reached the
  /// end of the stream, it returns the same token you passed in.
  @_s.JsonKey(name: 'nextBackwardToken')
  final String nextBackwardToken;

  /// The token for the next set of items in the forward direction. The token
  /// expires after 24 hours. If you have reached the end of the stream, it
  /// returns the same token you passed in.
  @_s.JsonKey(name: 'nextForwardToken')
  final String nextForwardToken;

  GetLogEventsResponse({
    this.events,
    this.nextBackwardToken,
    this.nextForwardToken,
  });
  factory GetLogEventsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetLogEventsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetLogGroupFieldsResponse {
  /// The array of fields found in the query. Each object in the array contains
  /// the name of the field, along with the percentage of time it appeared in the
  /// log events that were queried.
  @_s.JsonKey(name: 'logGroupFields')
  final List<LogGroupField> logGroupFields;

  GetLogGroupFieldsResponse({
    this.logGroupFields,
  });
  factory GetLogGroupFieldsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetLogGroupFieldsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetLogRecordResponse {
  /// The requested log event, as a JSON string.
  @_s.JsonKey(name: 'logRecord')
  final Map<String, String> logRecord;

  GetLogRecordResponse({
    this.logRecord,
  });
  factory GetLogRecordResponse.fromJson(Map<String, dynamic> json) =>
      _$GetLogRecordResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetQueryResultsResponse {
  /// The log events that matched the query criteria during the most recent time
  /// it ran.
  ///
  /// The <code>results</code> value is an array of arrays. Each log event is one
  /// object in the top-level array. Each of these log event objects is an array
  /// of <code>field</code>/<code>value</code> pairs.
  @_s.JsonKey(name: 'results')
  final List<List<ResultField>> results;

  /// Includes the number of log events scanned by the query, the number of log
  /// events that matched the query criteria, and the total number of bytes in the
  /// log events that were scanned. These values reflect the full raw results of
  /// the query.
  @_s.JsonKey(name: 'statistics')
  final QueryStatistics statistics;

  /// The status of the most recent running of the query. Possible values are
  /// <code>Cancelled</code>, <code>Complete</code>, <code>Failed</code>,
  /// <code>Running</code>, <code>Scheduled</code>, <code>Timeout</code>, and
  /// <code>Unknown</code>.
  ///
  /// Queries time out after 15 minutes of execution. To avoid having your queries
  /// time out, reduce the time range being searched or partition your query into
  /// a number of queries.
  @_s.JsonKey(name: 'status')
  final QueryStatus status;

  GetQueryResultsResponse({
    this.results,
    this.statistics,
    this.status,
  });
  factory GetQueryResultsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetQueryResultsResponseFromJson(json);
}

/// Represents a log event, which is a record of activity that was recorded by
/// the application or resource being monitored.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class InputLogEvent {
  /// The raw event message.
  @_s.JsonKey(name: 'message')
  final String message;

  /// The time the event occurred, expressed as the number of milliseconds after
  /// Jan 1, 1970 00:00:00 UTC.
  @_s.JsonKey(name: 'timestamp')
  final int timestamp;

  InputLogEvent({
    @_s.required this.message,
    @_s.required this.timestamp,
  });
  Map<String, dynamic> toJson() => _$InputLogEventToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsLogGroupResponse {
  /// The tags for the log group.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  ListTagsLogGroupResponse({
    this.tags,
  });
  factory ListTagsLogGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsLogGroupResponseFromJson(json);
}

/// Represents a log group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LogGroup {
  /// The Amazon Resource Name (ARN) of the log group.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The creation time of the log group, expressed as the number of milliseconds
  /// after Jan 1, 1970 00:00:00 UTC.
  @_s.JsonKey(name: 'creationTime')
  final int creationTime;

  /// The Amazon Resource Name (ARN) of the CMK to use when encrypting log data.
  @_s.JsonKey(name: 'kmsKeyId')
  final String kmsKeyId;

  /// The name of the log group.
  @_s.JsonKey(name: 'logGroupName')
  final String logGroupName;

  /// The number of metric filters.
  @_s.JsonKey(name: 'metricFilterCount')
  final int metricFilterCount;
  @_s.JsonKey(name: 'retentionInDays')
  final int retentionInDays;

  /// The number of bytes stored.
  @_s.JsonKey(name: 'storedBytes')
  final int storedBytes;

  LogGroup({
    this.arn,
    this.creationTime,
    this.kmsKeyId,
    this.logGroupName,
    this.metricFilterCount,
    this.retentionInDays,
    this.storedBytes,
  });
  factory LogGroup.fromJson(Map<String, dynamic> json) =>
      _$LogGroupFromJson(json);
}

/// The fields contained in log events found by a <code>GetLogGroupFields</code>
/// operation, along with the percentage of queried log events in which each
/// field appears.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LogGroupField {
  /// The name of a log field.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The percentage of log events queried that contained the field.
  @_s.JsonKey(name: 'percent')
  final int percent;

  LogGroupField({
    this.name,
    this.percent,
  });
  factory LogGroupField.fromJson(Map<String, dynamic> json) =>
      _$LogGroupFieldFromJson(json);
}

/// Represents a log stream, which is a sequence of log events from a single
/// emitter of logs.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LogStream {
  /// The Amazon Resource Name (ARN) of the log stream.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The creation time of the stream, expressed as the number of milliseconds
  /// after Jan 1, 1970 00:00:00 UTC.
  @_s.JsonKey(name: 'creationTime')
  final int creationTime;

  /// The time of the first event, expressed as the number of milliseconds after
  /// Jan 1, 1970 00:00:00 UTC.
  @_s.JsonKey(name: 'firstEventTimestamp')
  final int firstEventTimestamp;

  /// The time of the most recent log event in the log stream in CloudWatch Logs.
  /// This number is expressed as the number of milliseconds after Jan 1, 1970
  /// 00:00:00 UTC. The <code>lastEventTime</code> value updates on an eventual
  /// consistency basis. It typically updates in less than an hour from ingestion,
  /// but in rare situations might take longer.
  @_s.JsonKey(name: 'lastEventTimestamp')
  final int lastEventTimestamp;

  /// The ingestion time, expressed as the number of milliseconds after Jan 1,
  /// 1970 00:00:00 UTC.
  @_s.JsonKey(name: 'lastIngestionTime')
  final int lastIngestionTime;

  /// The name of the log stream.
  @_s.JsonKey(name: 'logStreamName')
  final String logStreamName;

  /// The number of bytes stored.
  ///
  /// <b>Important:</b> On June 17, 2019, this parameter was deprecated for log
  /// streams, and is always reported as zero. This change applies only to log
  /// streams. The <code>storedBytes</code> parameter for log groups is not
  /// affected.
  @_s.JsonKey(name: 'storedBytes')
  final int storedBytes;

  /// The sequence token.
  @_s.JsonKey(name: 'uploadSequenceToken')
  final String uploadSequenceToken;

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
  factory LogStream.fromJson(Map<String, dynamic> json) =>
      _$LogStreamFromJson(json);
}

/// Metric filters express how CloudWatch Logs would extract metric observations
/// from ingested log events and transform them into metric data in a CloudWatch
/// metric.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MetricFilter {
  /// The creation time of the metric filter, expressed as the number of
  /// milliseconds after Jan 1, 1970 00:00:00 UTC.
  @_s.JsonKey(name: 'creationTime')
  final int creationTime;

  /// The name of the metric filter.
  @_s.JsonKey(name: 'filterName')
  final String filterName;
  @_s.JsonKey(name: 'filterPattern')
  final String filterPattern;

  /// The name of the log group.
  @_s.JsonKey(name: 'logGroupName')
  final String logGroupName;

  /// The metric transformations.
  @_s.JsonKey(name: 'metricTransformations')
  final List<MetricTransformation> metricTransformations;

  MetricFilter({
    this.creationTime,
    this.filterName,
    this.filterPattern,
    this.logGroupName,
    this.metricTransformations,
  });
  factory MetricFilter.fromJson(Map<String, dynamic> json) =>
      _$MetricFilterFromJson(json);
}

/// Represents a matched event.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MetricFilterMatchRecord {
  /// The raw event data.
  @_s.JsonKey(name: 'eventMessage')
  final String eventMessage;

  /// The event number.
  @_s.JsonKey(name: 'eventNumber')
  final int eventNumber;

  /// The values extracted from the event data by the filter.
  @_s.JsonKey(name: 'extractedValues')
  final Map<String, String> extractedValues;

  MetricFilterMatchRecord({
    this.eventMessage,
    this.eventNumber,
    this.extractedValues,
  });
  factory MetricFilterMatchRecord.fromJson(Map<String, dynamic> json) =>
      _$MetricFilterMatchRecordFromJson(json);
}

/// Indicates how to transform ingested log events to metric data in a
/// CloudWatch metric.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MetricTransformation {
  /// The name of the CloudWatch metric.
  @_s.JsonKey(name: 'metricName')
  final String metricName;

  /// A custom namespace to contain your metric in CloudWatch. Use namespaces to
  /// group together metrics that are similar. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch_concepts.html#Namespace">Namespaces</a>.
  @_s.JsonKey(name: 'metricNamespace')
  final String metricNamespace;

  /// The value to publish to the CloudWatch metric when a filter pattern matches
  /// a log event.
  @_s.JsonKey(name: 'metricValue')
  final String metricValue;

  /// (Optional) The value to emit when a filter pattern does not match a log
  /// event. This value can be null.
  @_s.JsonKey(name: 'defaultValue')
  final double defaultValue;

  MetricTransformation({
    @_s.required this.metricName,
    @_s.required this.metricNamespace,
    @_s.required this.metricValue,
    this.defaultValue,
  });
  factory MetricTransformation.fromJson(Map<String, dynamic> json) =>
      _$MetricTransformationFromJson(json);

  Map<String, dynamic> toJson() => _$MetricTransformationToJson(this);
}

enum OrderBy {
  @_s.JsonValue('LogStreamName')
  logStreamName,
  @_s.JsonValue('LastEventTime')
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
    throw Exception('Unknown enum value: $this');
  }
}

/// Represents a log event.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class OutputLogEvent {
  /// The time the event was ingested, expressed as the number of milliseconds
  /// after Jan 1, 1970 00:00:00 UTC.
  @_s.JsonKey(name: 'ingestionTime')
  final int ingestionTime;

  /// The data contained in the log event.
  @_s.JsonKey(name: 'message')
  final String message;

  /// The time the event occurred, expressed as the number of milliseconds after
  /// Jan 1, 1970 00:00:00 UTC.
  @_s.JsonKey(name: 'timestamp')
  final int timestamp;

  OutputLogEvent({
    this.ingestionTime,
    this.message,
    this.timestamp,
  });
  factory OutputLogEvent.fromJson(Map<String, dynamic> json) =>
      _$OutputLogEventFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutDestinationResponse {
  /// The destination.
  @_s.JsonKey(name: 'destination')
  final Destination destination;

  PutDestinationResponse({
    this.destination,
  });
  factory PutDestinationResponse.fromJson(Map<String, dynamic> json) =>
      _$PutDestinationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutLogEventsResponse {
  /// The next sequence token.
  @_s.JsonKey(name: 'nextSequenceToken')
  final String nextSequenceToken;

  /// The rejected events.
  @_s.JsonKey(name: 'rejectedLogEventsInfo')
  final RejectedLogEventsInfo rejectedLogEventsInfo;

  PutLogEventsResponse({
    this.nextSequenceToken,
    this.rejectedLogEventsInfo,
  });
  factory PutLogEventsResponse.fromJson(Map<String, dynamic> json) =>
      _$PutLogEventsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutQueryDefinitionResponse {
  /// The ID of the query definition.
  @_s.JsonKey(name: 'queryDefinitionId')
  final String queryDefinitionId;

  PutQueryDefinitionResponse({
    this.queryDefinitionId,
  });
  factory PutQueryDefinitionResponse.fromJson(Map<String, dynamic> json) =>
      _$PutQueryDefinitionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutResourcePolicyResponse {
  /// The new policy.
  @_s.JsonKey(name: 'resourcePolicy')
  final ResourcePolicy resourcePolicy;

  PutResourcePolicyResponse({
    this.resourcePolicy,
  });
  factory PutResourcePolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$PutResourcePolicyResponseFromJson(json);
}

/// This structure contains details about a saved CloudWatch Logs Insights query
/// definition.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class QueryDefinition {
  /// The date that the query definition was most recently modified.
  @_s.JsonKey(name: 'lastModified')
  final int lastModified;

  /// If this query definition contains a list of log groups that it is limited
  /// to, that list appears here.
  @_s.JsonKey(name: 'logGroupNames')
  final List<String> logGroupNames;

  /// The name of the query definition.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The unique ID of the query definition.
  @_s.JsonKey(name: 'queryDefinitionId')
  final String queryDefinitionId;

  /// The query string to use for this definition. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_QuerySyntax.html">CloudWatch
  /// Logs Insights Query Syntax</a>.
  @_s.JsonKey(name: 'queryString')
  final String queryString;

  QueryDefinition({
    this.lastModified,
    this.logGroupNames,
    this.name,
    this.queryDefinitionId,
    this.queryString,
  });
  factory QueryDefinition.fromJson(Map<String, dynamic> json) =>
      _$QueryDefinitionFromJson(json);
}

/// Information about one CloudWatch Logs Insights query that matches the
/// request in a <code>DescribeQueries</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class QueryInfo {
  /// The date and time that this query was created.
  @_s.JsonKey(name: 'createTime')
  final int createTime;

  /// The name of the log group scanned by this query.
  @_s.JsonKey(name: 'logGroupName')
  final String logGroupName;

  /// The unique ID number of this query.
  @_s.JsonKey(name: 'queryId')
  final String queryId;

  /// The query string used in this query.
  @_s.JsonKey(name: 'queryString')
  final String queryString;

  /// The status of this query. Possible values are <code>Cancelled</code>,
  /// <code>Complete</code>, <code>Failed</code>, <code>Running</code>,
  /// <code>Scheduled</code>, and <code>Unknown</code>.
  @_s.JsonKey(name: 'status')
  final QueryStatus status;

  QueryInfo({
    this.createTime,
    this.logGroupName,
    this.queryId,
    this.queryString,
    this.status,
  });
  factory QueryInfo.fromJson(Map<String, dynamic> json) =>
      _$QueryInfoFromJson(json);
}

/// Contains the number of log events scanned by the query, the number of log
/// events that matched the query criteria, and the total number of bytes in the
/// log events that were scanned.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class QueryStatistics {
  /// The total number of bytes in the log events scanned during the query.
  @_s.JsonKey(name: 'bytesScanned')
  final double bytesScanned;

  /// The number of log events that matched the query string.
  @_s.JsonKey(name: 'recordsMatched')
  final double recordsMatched;

  /// The total number of log events scanned during the query.
  @_s.JsonKey(name: 'recordsScanned')
  final double recordsScanned;

  QueryStatistics({
    this.bytesScanned,
    this.recordsMatched,
    this.recordsScanned,
  });
  factory QueryStatistics.fromJson(Map<String, dynamic> json) =>
      _$QueryStatisticsFromJson(json);
}

enum QueryStatus {
  @_s.JsonValue('Scheduled')
  scheduled,
  @_s.JsonValue('Running')
  running,
  @_s.JsonValue('Complete')
  complete,
  @_s.JsonValue('Failed')
  failed,
  @_s.JsonValue('Cancelled')
  cancelled,
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
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Represents the rejected events.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RejectedLogEventsInfo {
  /// The expired log events.
  @_s.JsonKey(name: 'expiredLogEventEndIndex')
  final int expiredLogEventEndIndex;

  /// The log events that are too new.
  @_s.JsonKey(name: 'tooNewLogEventStartIndex')
  final int tooNewLogEventStartIndex;

  /// The log events that are too old.
  @_s.JsonKey(name: 'tooOldLogEventEndIndex')
  final int tooOldLogEventEndIndex;

  RejectedLogEventsInfo({
    this.expiredLogEventEndIndex,
    this.tooNewLogEventStartIndex,
    this.tooOldLogEventEndIndex,
  });
  factory RejectedLogEventsInfo.fromJson(Map<String, dynamic> json) =>
      _$RejectedLogEventsInfoFromJson(json);
}

/// A policy enabling one or more entities to put logs to a log group in this
/// account.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResourcePolicy {
  /// Timestamp showing when this policy was last updated, expressed as the number
  /// of milliseconds after Jan 1, 1970 00:00:00 UTC.
  @_s.JsonKey(name: 'lastUpdatedTime')
  final int lastUpdatedTime;

  /// The details of the policy.
  @_s.JsonKey(name: 'policyDocument')
  final String policyDocument;

  /// The name of the resource policy.
  @_s.JsonKey(name: 'policyName')
  final String policyName;

  ResourcePolicy({
    this.lastUpdatedTime,
    this.policyDocument,
    this.policyName,
  });
  factory ResourcePolicy.fromJson(Map<String, dynamic> json) =>
      _$ResourcePolicyFromJson(json);
}

/// Contains one field from one log event returned by a CloudWatch Logs Insights
/// query, along with the value of that field.
///
/// For more information about the fields that are generated by CloudWatch logs,
/// see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_AnalyzeLogData-discoverable-fields.html">Supported
/// Logs and Discovered Fields</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResultField {
  /// The log event field.
  @_s.JsonKey(name: 'field')
  final String field;

  /// The value of this field.
  @_s.JsonKey(name: 'value')
  final String value;

  ResultField({
    this.field,
    this.value,
  });
  factory ResultField.fromJson(Map<String, dynamic> json) =>
      _$ResultFieldFromJson(json);
}

/// Represents the search status of a log stream.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SearchedLogStream {
  /// The name of the log stream.
  @_s.JsonKey(name: 'logStreamName')
  final String logStreamName;

  /// Indicates whether all the events in this log stream were searched.
  @_s.JsonKey(name: 'searchedCompletely')
  final bool searchedCompletely;

  SearchedLogStream({
    this.logStreamName,
    this.searchedCompletely,
  });
  factory SearchedLogStream.fromJson(Map<String, dynamic> json) =>
      _$SearchedLogStreamFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartQueryResponse {
  /// The unique ID of the query.
  @_s.JsonKey(name: 'queryId')
  final String queryId;

  StartQueryResponse({
    this.queryId,
  });
  factory StartQueryResponse.fromJson(Map<String, dynamic> json) =>
      _$StartQueryResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StopQueryResponse {
  /// This is true if the query was stopped by the <code>StopQuery</code>
  /// operation.
  @_s.JsonKey(name: 'success')
  final bool success;

  StopQueryResponse({
    this.success,
  });
  factory StopQueryResponse.fromJson(Map<String, dynamic> json) =>
      _$StopQueryResponseFromJson(json);
}

/// Represents a subscription filter.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SubscriptionFilter {
  /// The creation time of the subscription filter, expressed as the number of
  /// milliseconds after Jan 1, 1970 00:00:00 UTC.
  @_s.JsonKey(name: 'creationTime')
  final int creationTime;

  /// The Amazon Resource Name (ARN) of the destination.
  @_s.JsonKey(name: 'destinationArn')
  final String destinationArn;
  @_s.JsonKey(name: 'distribution')
  final Distribution distribution;

  /// The name of the subscription filter.
  @_s.JsonKey(name: 'filterName')
  final String filterName;
  @_s.JsonKey(name: 'filterPattern')
  final String filterPattern;

  /// The name of the log group.
  @_s.JsonKey(name: 'logGroupName')
  final String logGroupName;

  /// <p/>
  @_s.JsonKey(name: 'roleArn')
  final String roleArn;

  SubscriptionFilter({
    this.creationTime,
    this.destinationArn,
    this.distribution,
    this.filterName,
    this.filterPattern,
    this.logGroupName,
    this.roleArn,
  });
  factory SubscriptionFilter.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionFilterFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TestMetricFilterResponse {
  /// The matched events.
  @_s.JsonKey(name: 'matches')
  final List<MetricFilterMatchRecord> matches;

  TestMetricFilterResponse({
    this.matches,
  });
  factory TestMetricFilterResponse.fromJson(Map<String, dynamic> json) =>
      _$TestMetricFilterResponseFromJson(json);
}

class DataAlreadyAcceptedException extends _s.GenericAwsException {
  DataAlreadyAcceptedException({String type, String message})
      : super(
            type: type, code: 'DataAlreadyAcceptedException', message: message);
}

class InvalidOperationException extends _s.GenericAwsException {
  InvalidOperationException({String type, String message})
      : super(type: type, code: 'InvalidOperationException', message: message);
}

class InvalidParameterException extends _s.GenericAwsException {
  InvalidParameterException({String type, String message})
      : super(type: type, code: 'InvalidParameterException', message: message);
}

class InvalidSequenceTokenException extends _s.GenericAwsException {
  InvalidSequenceTokenException({String type, String message})
      : super(
            type: type,
            code: 'InvalidSequenceTokenException',
            message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String type, String message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class MalformedQueryException extends _s.GenericAwsException {
  MalformedQueryException({String type, String message})
      : super(type: type, code: 'MalformedQueryException', message: message);
}

class OperationAbortedException extends _s.GenericAwsException {
  OperationAbortedException({String type, String message})
      : super(type: type, code: 'OperationAbortedException', message: message);
}

class ResourceAlreadyExistsException extends _s.GenericAwsException {
  ResourceAlreadyExistsException({String type, String message})
      : super(
            type: type,
            code: 'ResourceAlreadyExistsException',
            message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceUnavailableException extends _s.GenericAwsException {
  ServiceUnavailableException({String type, String message})
      : super(
            type: type, code: 'ServiceUnavailableException', message: message);
}

class UnrecognizedClientException extends _s.GenericAwsException {
  UnrecognizedClientException({String type, String message})
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
