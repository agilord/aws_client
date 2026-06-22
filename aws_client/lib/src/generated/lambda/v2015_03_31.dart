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

import 'v2015_03_31.endpoints.dart' as _endpoints;
export '../../shared/shared.dart' show AwsClientCredentials;

/// Lambda is a compute service that lets you run code without provisioning or
/// managing servers. Lambda runs your code on a high-availability compute
/// infrastructure and performs all of the administration of the compute
/// resources, including server and operating system maintenance, capacity
/// provisioning and automatic scaling, code monitoring and logging. With
/// Lambda, you can run code for virtually any type of application or backend
/// service. For more information about the Lambda service, see <a
/// href="https://docs.aws.amazon.com/lambda/latest/dg/welcome.html">What is
/// Lambda</a> in the <b>Lambda Developer Guide</b>.
class Lambda {
  final _s.RestJsonProtocol _protocol;
  factory Lambda({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
    bool useFipsEndpoint = false,
    bool useDualStackEndpoint = false,
  }) {
    final service = _s.ServiceMetadata(
      endpointPrefix: 'lambda',
    );
    return Lambda._(
      protocol: _s.RestJsonProtocol(
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
  Lambda._({
    required _s.RestJsonProtocol protocol,
  }) : _protocol = protocol;

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

  /// Saves the progress of a <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/durable-functions.html">durable
  /// function</a> execution during runtime. This API is used by the Lambda
  /// durable functions SDK to checkpoint completed steps and schedule
  /// asynchronous operations. You typically don't need to call this API
  /// directly as the SDK handles checkpointing automatically.
  ///
  /// Each checkpoint operation consumes the current checkpoint token and
  /// returns a new one for the next checkpoint. This ensures that checkpoints
  /// are applied in the correct order and prevents duplicate or out-of-order
  /// state updates.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [checkpointToken] :
  /// A unique token that identifies the current checkpoint state. This token is
  /// provided by the Lambda runtime and must be used to ensure checkpoints are
  /// applied in the correct order. Each checkpoint operation consumes this
  /// token and returns a new one.
  ///
  /// Parameter [durableExecutionArn] :
  /// The Amazon Resource Name (ARN) of the durable execution.
  ///
  /// Parameter [clientToken] :
  /// An optional idempotency token to ensure that duplicate checkpoint requests
  /// are handled correctly. If provided, Lambda uses this token to detect and
  /// handle duplicate requests within a 15-minute window.
  ///
  /// Parameter [updates] :
  /// An array of state updates to apply during this checkpoint. Each update
  /// represents a change to the execution state, such as completing a step,
  /// starting a callback, or scheduling a timer. Updates are applied atomically
  /// as part of the checkpoint operation.
  Future<CheckpointDurableExecutionResponse> checkpointDurableExecution({
    required String checkpointToken,
    required String durableExecutionArn,
    String? clientToken,
    List<OperationUpdate>? updates,
  }) async {
    final $payload = <String, dynamic>{
      'CheckpointToken': checkpointToken,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (updates != null) 'Updates': updates,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/2025-12-01/durable-executions/${Uri.encodeComponent(durableExecutionArn)}/checkpoint',
      exceptionFnMap: _exceptionFns,
    );
    return CheckpointDurableExecutionResponse.fromJson(response);
  }

  /// Deletes a Lambda function. To delete a specific function version, use the
  /// <code>Qualifier</code> parameter. Otherwise, all versions and aliases are
  /// deleted. This doesn't require the user to have explicit permissions for
  /// <a>DeleteAlias</a>.
  /// <note>
  /// A deleted Lambda function cannot be recovered. Ensure that you specify the
  /// correct function name and version before deleting.
  /// </note>
  /// To delete Lambda event source mappings that invoke a function, use
  /// <a>DeleteEventSourceMapping</a>. For Amazon Web Services services and
  /// resources that invoke your function directly, delete the trigger in the
  /// service where you originally configured it.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [functionName] :
  /// The name or ARN of the Lambda function or version.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> – <code>my-function</code> (name-only),
  /// <code>my-function:1</code> (with version).
  /// </li>
  /// <li>
  /// <b>Function ARN</b> –
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> – <code>123456789012:function:my-function</code>.
  /// </li>
  /// </ul>
  /// You can append a version number or alias to any of the formats. The length
  /// constraint applies only to the full ARN. If you specify only the function
  /// name, it is limited to 64 characters in length.
  ///
  /// Parameter [qualifier] :
  /// Specify a version to delete. You can't delete a version that an alias
  /// references.
  Future<DeleteFunctionResponse> deleteFunction({
    required String functionName,
    String? qualifier,
  }) async {
    final $query = <String, List<String>>{
      if (qualifier != null) 'Qualifier': [qualifier],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/2015-03-31/functions/${Uri.encodeComponent(functionName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteFunctionResponse.fromJson(response);
  }

  /// Deletes the configuration for asynchronous invocation for a function,
  /// version, or alias.
  ///
  /// To configure options for asynchronous invocation, use
  /// <a>PutFunctionEventInvokeConfig</a>.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [functionName] :
  /// The name or ARN of the Lambda function, version, or alias.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> - <code>my-function</code> (name-only),
  /// <code>my-function:v1</code> (with alias).
  /// </li>
  /// <li>
  /// <b>Function ARN</b> -
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> - <code>123456789012:function:my-function</code>.
  /// </li>
  /// </ul>
  /// You can append a version number or alias to any of the formats. The length
  /// constraint applies only to the full ARN. If you specify only the function
  /// name, it is limited to 64 characters in length.
  ///
  /// Parameter [qualifier] :
  /// A version number or alias name.
  Future<void> deleteFunctionEventInvokeConfig({
    required String functionName,
    String? qualifier,
  }) async {
    final $query = <String, List<String>>{
      if (qualifier != null) 'Qualifier': [qualifier],
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2019-09-25/functions/${Uri.encodeComponent(functionName)}/event-invoke-config',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Retrieves details about your account's <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/limits.html">limits</a>
  /// and usage in an Amazon Web Services Region.
  ///
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  Future<GetAccountSettingsResponse> getAccountSettings() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2016-08-19/account-settings',
      exceptionFnMap: _exceptionFns,
    );
    return GetAccountSettingsResponse.fromJson(response);
  }

  /// Retrieves detailed information about a specific <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/durable-functions.html">durable
  /// execution</a>, including its current status, input payload, result or
  /// error information, and execution metadata such as start time and usage
  /// statistics.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [durableExecutionArn] :
  /// The Amazon Resource Name (ARN) of the durable execution.
  Future<GetDurableExecutionResponse> getDurableExecution({
    required String durableExecutionArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2025-12-01/durable-executions/${Uri.encodeComponent(durableExecutionArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetDurableExecutionResponse.fromJson(response);
  }

  /// Retrieves the execution history for a <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/durable-functions.html">durable
  /// execution</a>, showing all the steps, callbacks, and events that occurred
  /// during the execution. This provides a detailed audit trail of the
  /// execution's progress over time.
  ///
  /// The history is available while the execution is running and for a
  /// retention period after it completes (1-90 days, default 30 days). You can
  /// control whether to include execution data such as step results and
  /// callback payloads.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [durableExecutionArn] :
  /// The Amazon Resource Name (ARN) of the durable execution.
  ///
  /// Parameter [includeExecutionData] :
  /// Specifies whether to include execution data such as step results and
  /// callback payloads in the history events. Set to <code>true</code> to
  /// include data, or <code>false</code> to exclude it for a more compact
  /// response. The default is <code>true</code>.
  ///
  /// Parameter [marker] :
  /// If <code>NextMarker</code> was returned from a previous request, use this
  /// value to retrieve the next page of results. Each pagination token expires
  /// after 24 hours.
  ///
  /// Parameter [maxItems] :
  /// The maximum number of history events to return per call. You can use
  /// <code>Marker</code> to retrieve additional pages of results. The default
  /// is 100 and the maximum allowed is 1000. A value of 0 uses the default.
  ///
  /// Parameter [reverseOrder] :
  /// When set to <code>true</code>, returns the history events in reverse
  /// chronological order (newest first). By default, events are returned in
  /// chronological order (oldest first).
  Future<GetDurableExecutionHistoryResponse> getDurableExecutionHistory({
    required String durableExecutionArn,
    bool? includeExecutionData,
    String? marker,
    int? maxItems,
    bool? reverseOrder,
  }) async {
    _s.validateNumRange(
      'maxItems',
      maxItems,
      0,
      1000,
    );
    final $query = <String, List<String>>{
      if (includeExecutionData != null)
        'IncludeExecutionData': [includeExecutionData.toString()],
      if (marker != null) 'Marker': [marker],
      if (maxItems != null) 'MaxItems': [maxItems.toString()],
      if (reverseOrder != null) 'ReverseOrder': [reverseOrder.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2025-12-01/durable-executions/${Uri.encodeComponent(durableExecutionArn)}/history',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetDurableExecutionHistoryResponse.fromJson(response);
  }

  /// Retrieves the current execution state required for the replay process
  /// during <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/durable-functions.html">durable
  /// function</a> execution. This API is used by the Lambda durable functions
  /// SDK to get state information needed for replay. You typically don't need
  /// to call this API directly as the SDK handles state management
  /// automatically.
  ///
  /// The response contains operations ordered by start sequence number in
  /// ascending order. Completed operations with children don't include child
  /// operation details since they don't need to be replayed.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [checkpointToken] :
  /// A checkpoint token that identifies the current state of the execution.
  /// This token is provided by the Lambda runtime and ensures that state
  /// retrieval is consistent with the current execution context.
  ///
  /// Parameter [durableExecutionArn] :
  /// The Amazon Resource Name (ARN) of the durable execution.
  ///
  /// Parameter [marker] :
  /// If <code>NextMarker</code> was returned from a previous request, use this
  /// value to retrieve the next page of operations. Each pagination token
  /// expires after 24 hours.
  ///
  /// Parameter [maxItems] :
  /// The maximum number of operations to return per call. You can use
  /// <code>Marker</code> to retrieve additional pages of results. The default
  /// is 100 and the maximum allowed is 1000. A value of 0 uses the default.
  Future<GetDurableExecutionStateResponse> getDurableExecutionState({
    required String checkpointToken,
    required String durableExecutionArn,
    String? marker,
    int? maxItems,
  }) async {
    _s.validateNumRange(
      'maxItems',
      maxItems,
      0,
      1000,
    );
    final $query = <String, List<String>>{
      'CheckpointToken': [checkpointToken],
      if (marker != null) 'Marker': [marker],
      if (maxItems != null) 'MaxItems': [maxItems.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2025-12-01/durable-executions/${Uri.encodeComponent(durableExecutionArn)}/state',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetDurableExecutionStateResponse.fromJson(response);
  }

  /// Retrieves the configuration for asynchronous invocation for a function,
  /// version, or alias.
  ///
  /// To configure options for asynchronous invocation, use
  /// <a>PutFunctionEventInvokeConfig</a>.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [functionName] :
  /// The name or ARN of the Lambda function, version, or alias.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> - <code>my-function</code> (name-only),
  /// <code>my-function:v1</code> (with alias).
  /// </li>
  /// <li>
  /// <b>Function ARN</b> -
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> - <code>123456789012:function:my-function</code>.
  /// </li>
  /// </ul>
  /// You can append a version number or alias to any of the formats. The length
  /// constraint applies only to the full ARN. If you specify only the function
  /// name, it is limited to 64 characters in length.
  ///
  /// Parameter [qualifier] :
  /// A version number or alias name.
  Future<FunctionEventInvokeConfig> getFunctionEventInvokeConfig({
    required String functionName,
    String? qualifier,
  }) async {
    final $query = <String, List<String>>{
      if (qualifier != null) 'Qualifier': [qualifier],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2019-09-25/functions/${Uri.encodeComponent(functionName)}/event-invoke-config',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return FunctionEventInvokeConfig.fromJson(response);
  }

  /// Returns a list of <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/durable-functions.html">durable
  /// executions</a> for a specified Lambda function. You can filter the results
  /// by execution name, status, and start time range. This API supports
  /// pagination for large result sets.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [functionName] :
  /// The name or ARN of the Lambda function. You can specify a function name, a
  /// partial ARN, or a full ARN.
  ///
  /// Parameter [durableExecutionName] :
  /// Filter executions by name. Only executions with names that matches this
  /// string are returned.
  ///
  /// Parameter [marker] :
  /// Pagination token from a previous request to continue retrieving results.
  ///
  /// Parameter [maxItems] :
  /// Maximum number of executions to return (1-1000). Default is 100.
  ///
  /// Parameter [qualifier] :
  /// The function version or alias. If not specified, lists executions for the
  /// $LATEST version.
  ///
  /// Parameter [reverseOrder] :
  /// Set to true to return results in reverse chronological order (newest
  /// first). Default is false.
  ///
  /// Parameter [startedAfter] :
  /// Filter executions that started after this timestamp (ISO 8601 format).
  ///
  /// Parameter [startedBefore] :
  /// Filter executions that started before this timestamp (ISO 8601 format).
  ///
  /// Parameter [statuses] :
  /// Filter executions by status. Valid values: RUNNING, SUCCEEDED, FAILED,
  /// TIMED_OUT, STOPPED.
  Future<ListDurableExecutionsByFunctionResponse>
      listDurableExecutionsByFunction({
    required String functionName,
    String? durableExecutionName,
    String? marker,
    int? maxItems,
    String? qualifier,
    bool? reverseOrder,
    DateTime? startedAfter,
    DateTime? startedBefore,
    List<ExecutionStatus>? statuses,
  }) async {
    _s.validateNumRange(
      'maxItems',
      maxItems,
      0,
      1000,
    );
    final $query = <String, List<String>>{
      if (durableExecutionName != null)
        'DurableExecutionName': [durableExecutionName],
      if (marker != null) 'Marker': [marker],
      if (maxItems != null) 'MaxItems': [maxItems.toString()],
      if (qualifier != null) 'Qualifier': [qualifier],
      if (reverseOrder != null) 'ReverseOrder': [reverseOrder.toString()],
      if (startedAfter != null)
        'StartedAfter': [_s.iso8601ToJson(startedAfter).toString()],
      if (startedBefore != null)
        'StartedBefore': [_s.iso8601ToJson(startedBefore).toString()],
      if (statuses != null) 'Statuses': statuses.map((e) => e.value).toList(),
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2025-12-01/functions/${Uri.encodeComponent(functionName)}/durable-executions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDurableExecutionsByFunctionResponse.fromJson(response);
  }

  /// Retrieves a list of configurations for asynchronous invocation for a
  /// function.
  ///
  /// To configure options for asynchronous invocation, use
  /// <a>PutFunctionEventInvokeConfig</a>.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [functionName] :
  /// The name or ARN of the Lambda function.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> - <code>my-function</code>.
  /// </li>
  /// <li>
  /// <b>Function ARN</b> -
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> - <code>123456789012:function:my-function</code>.
  /// </li>
  /// </ul>
  /// The length constraint applies only to the full ARN. If you specify only
  /// the function name, it is limited to 64 characters in length.
  ///
  /// Parameter [marker] :
  /// Specify the pagination token that's returned by a previous request to
  /// retrieve the next page of results.
  ///
  /// Parameter [maxItems] :
  /// The maximum number of configurations to return.
  Future<ListFunctionEventInvokeConfigsResponse>
      listFunctionEventInvokeConfigs({
    required String functionName,
    String? marker,
    int? maxItems,
  }) async {
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (marker != null) 'Marker': [marker],
      if (maxItems != null) 'MaxItems': [maxItems.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2019-09-25/functions/${Uri.encodeComponent(functionName)}/event-invoke-config/list',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListFunctionEventInvokeConfigsResponse.fromJson(response);
  }

  /// Returns a function, event source mapping, or code signing configuration's
  /// <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/tagging.html">tags</a>.
  /// You can also view function tags with <a>GetFunction</a>.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [resource] :
  /// The resource's Amazon Resource Name (ARN). Note: Lambda does not support
  /// adding tags to function aliases or versions.
  Future<ListTagsResponse> listTags({
    required String resource,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2017-03-31/tags/${Uri.encodeComponent(resource)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsResponse.fromJson(response);
  }

  /// Configures options for <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/invocation-async.html">asynchronous
  /// invocation</a> on a function, version, or alias. If a configuration
  /// already exists for a function, version, or alias, this operation
  /// overwrites it. If you exclude any settings, they are removed. To set one
  /// option without affecting existing settings for other options, use
  /// <a>UpdateFunctionEventInvokeConfig</a>.
  ///
  /// By default, Lambda retries an asynchronous invocation twice if the
  /// function returns an error. It retains events in a queue for up to six
  /// hours. When an event fails all processing attempts or stays in the
  /// asynchronous invocation queue for too long, Lambda discards it. To retain
  /// discarded events, configure a dead-letter queue with
  /// <a>UpdateFunctionConfiguration</a>.
  ///
  /// To send an invocation record to a queue, topic, S3 bucket, function, or
  /// event bus, specify a <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/invocation-async.html#invocation-async-destinations">destination</a>.
  /// You can configure separate destinations for successful invocations
  /// (on-success) and events that fail all processing attempts (on-failure).
  /// You can configure destinations in addition to or instead of a dead-letter
  /// queue.
  /// <note>
  /// S3 buckets are supported only for on-failure destinations. To retain
  /// records of successful invocations, use another destination type.
  /// </note>
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [functionName] :
  /// The name or ARN of the Lambda function, version, or alias.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> - <code>my-function</code> (name-only),
  /// <code>my-function:v1</code> (with alias).
  /// </li>
  /// <li>
  /// <b>Function ARN</b> -
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> - <code>123456789012:function:my-function</code>.
  /// </li>
  /// </ul>
  /// You can append a version number or alias to any of the formats. The length
  /// constraint applies only to the full ARN. If you specify only the function
  /// name, it is limited to 64 characters in length.
  ///
  /// Parameter [destinationConfig] :
  /// A destination for events after they have been sent to a function for
  /// processing.
  /// <p class="title"> <b>Destinations</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function</b> - The Amazon Resource Name (ARN) of a Lambda function.
  /// </li>
  /// <li>
  /// <b>Queue</b> - The ARN of a standard SQS queue.
  /// </li>
  /// <li>
  /// <b>Bucket</b> - The ARN of an Amazon S3 bucket.
  /// </li>
  /// <li>
  /// <b>Topic</b> - The ARN of a standard SNS topic.
  /// </li>
  /// <li>
  /// <b>Event Bus</b> - The ARN of an Amazon EventBridge event bus.
  /// </li>
  /// </ul> <note>
  /// S3 buckets are supported only for on-failure destinations. To retain
  /// records of successful invocations, use another destination type.
  /// </note>
  ///
  /// Parameter [maximumEventAgeInSeconds] :
  /// The maximum age of a request that Lambda sends to a function for
  /// processing.
  ///
  /// Parameter [maximumRetryAttempts] :
  /// The maximum number of times to retry when the function returns an error.
  ///
  /// Parameter [qualifier] :
  /// A version number or alias name.
  Future<FunctionEventInvokeConfig> putFunctionEventInvokeConfig({
    required String functionName,
    DestinationConfig? destinationConfig,
    int? maximumEventAgeInSeconds,
    int? maximumRetryAttempts,
    String? qualifier,
  }) async {
    _s.validateNumRange(
      'maximumEventAgeInSeconds',
      maximumEventAgeInSeconds,
      60,
      21600,
    );
    _s.validateNumRange(
      'maximumRetryAttempts',
      maximumRetryAttempts,
      0,
      2,
    );
    final $query = <String, List<String>>{
      if (qualifier != null) 'Qualifier': [qualifier],
    };
    final $payload = <String, dynamic>{
      if (destinationConfig != null) 'DestinationConfig': destinationConfig,
      if (maximumEventAgeInSeconds != null)
        'MaximumEventAgeInSeconds': maximumEventAgeInSeconds,
      if (maximumRetryAttempts != null)
        'MaximumRetryAttempts': maximumRetryAttempts,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/2019-09-25/functions/${Uri.encodeComponent(functionName)}/event-invoke-config',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return FunctionEventInvokeConfig.fromJson(response);
  }

  /// Sends a failure response for a callback operation in a durable execution.
  /// Use this API when an external system cannot complete a callback operation
  /// successfully.
  ///
  /// May throw [CallbackTimeoutException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [callbackId] :
  /// The unique identifier for the callback operation.
  ///
  /// Parameter [error] :
  /// Error details describing why the callback operation failed.
  Future<void> sendDurableExecutionCallbackFailure({
    required String callbackId,
    ErrorObject? error,
  }) async {
    final response = await _protocol.send(
      payload: error,
      method: 'POST',
      requestUri:
          '/2025-12-01/durable-execution-callbacks/${Uri.encodeComponent(callbackId)}/fail',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Sends a heartbeat signal for a long-running callback operation to prevent
  /// timeout. Use this API to extend the callback timeout period while the
  /// external operation is still in progress.
  ///
  /// May throw [CallbackTimeoutException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [callbackId] :
  /// The unique identifier for the callback operation.
  Future<void> sendDurableExecutionCallbackHeartbeat({
    required String callbackId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/2025-12-01/durable-execution-callbacks/${Uri.encodeComponent(callbackId)}/heartbeat',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Sends a successful completion response for a callback operation in a
  /// durable execution. Use this API when an external system has successfully
  /// completed a callback operation.
  ///
  /// May throw [CallbackTimeoutException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [callbackId] :
  /// The unique identifier for the callback operation.
  ///
  /// Parameter [result] :
  /// The result data from the successful callback operation. Maximum size is
  /// 256 KB.
  Future<void> sendDurableExecutionCallbackSuccess({
    required String callbackId,
    Uint8List? result,
  }) async {
    final response = await _protocol.send(
      payload: result,
      method: 'POST',
      requestUri:
          '/2025-12-01/durable-execution-callbacks/${Uri.encodeComponent(callbackId)}/succeed',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Stops a running <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/durable-functions.html">durable
  /// execution</a>. The execution transitions to STOPPED status and cannot be
  /// resumed. Any in-progress operations are terminated.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [durableExecutionArn] :
  /// The Amazon Resource Name (ARN) of the durable execution.
  ///
  /// Parameter [error] :
  /// Optional error details explaining why the execution is being stopped.
  Future<StopDurableExecutionResponse> stopDurableExecution({
    required String durableExecutionArn,
    ErrorObject? error,
  }) async {
    final response = await _protocol.send(
      payload: error,
      method: 'POST',
      requestUri:
          '/2025-12-01/durable-executions/${Uri.encodeComponent(durableExecutionArn)}/stop',
      exceptionFnMap: _exceptionFns,
    );
    return StopDurableExecutionResponse.fromJson(response);
  }

  /// Adds <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/tagging.html">tags</a>
  /// to a function, event source mapping, or code signing configuration.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [resource] :
  /// The resource's Amazon Resource Name (ARN).
  ///
  /// Parameter [tags] :
  /// A list of tags to apply to the resource.
  Future<void> tagResource({
    required String resource,
    required Map<String, String> tags,
  }) async {
    final $payload = <String, dynamic>{
      'Tags': tags,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2017-03-31/tags/${Uri.encodeComponent(resource)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/tagging.html">tags</a>
  /// from a function, event source mapping, or code signing configuration.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [resource] :
  /// The resource's Amazon Resource Name (ARN).
  ///
  /// Parameter [tagKeys] :
  /// A list of tag keys to remove from the resource.
  Future<void> untagResource({
    required String resource,
    required List<String> tagKeys,
  }) async {
    final $query = <String, List<String>>{
      'tagKeys': tagKeys,
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/2017-03-31/tags/${Uri.encodeComponent(resource)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the configuration for asynchronous invocation for a function,
  /// version, or alias.
  ///
  /// To configure options for asynchronous invocation, use
  /// <a>PutFunctionEventInvokeConfig</a>.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [functionName] :
  /// The name or ARN of the Lambda function, version, or alias.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> - <code>my-function</code> (name-only),
  /// <code>my-function:v1</code> (with alias).
  /// </li>
  /// <li>
  /// <b>Function ARN</b> -
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> - <code>123456789012:function:my-function</code>.
  /// </li>
  /// </ul>
  /// You can append a version number or alias to any of the formats. The length
  /// constraint applies only to the full ARN. If you specify only the function
  /// name, it is limited to 64 characters in length.
  ///
  /// Parameter [destinationConfig] :
  /// A destination for events after they have been sent to a function for
  /// processing.
  /// <p class="title"> <b>Destinations</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function</b> - The Amazon Resource Name (ARN) of a Lambda function.
  /// </li>
  /// <li>
  /// <b>Queue</b> - The ARN of a standard SQS queue.
  /// </li>
  /// <li>
  /// <b>Bucket</b> - The ARN of an Amazon S3 bucket.
  /// </li>
  /// <li>
  /// <b>Topic</b> - The ARN of a standard SNS topic.
  /// </li>
  /// <li>
  /// <b>Event Bus</b> - The ARN of an Amazon EventBridge event bus.
  /// </li>
  /// </ul> <note>
  /// S3 buckets are supported only for on-failure destinations. To retain
  /// records of successful invocations, use another destination type.
  /// </note>
  ///
  /// Parameter [maximumEventAgeInSeconds] :
  /// The maximum age of a request that Lambda sends to a function for
  /// processing.
  ///
  /// Parameter [maximumRetryAttempts] :
  /// The maximum number of times to retry when the function returns an error.
  ///
  /// Parameter [qualifier] :
  /// A version number or alias name.
  Future<FunctionEventInvokeConfig> updateFunctionEventInvokeConfig({
    required String functionName,
    DestinationConfig? destinationConfig,
    int? maximumEventAgeInSeconds,
    int? maximumRetryAttempts,
    String? qualifier,
  }) async {
    _s.validateNumRange(
      'maximumEventAgeInSeconds',
      maximumEventAgeInSeconds,
      60,
      21600,
    );
    _s.validateNumRange(
      'maximumRetryAttempts',
      maximumRetryAttempts,
      0,
      2,
    );
    final $query = <String, List<String>>{
      if (qualifier != null) 'Qualifier': [qualifier],
    };
    final $payload = <String, dynamic>{
      if (destinationConfig != null) 'DestinationConfig': destinationConfig,
      if (maximumEventAgeInSeconds != null)
        'MaximumEventAgeInSeconds': maximumEventAgeInSeconds,
      if (maximumRetryAttempts != null)
        'MaximumRetryAttempts': maximumRetryAttempts,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/2019-09-25/functions/${Uri.encodeComponent(functionName)}/event-invoke-config',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return FunctionEventInvokeConfig.fromJson(response);
  }

  /// Creates a capacity provider that manages compute resources for Lambda
  /// functions
  ///
  /// May throw [CapacityProviderLimitExceededException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceConflictException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [capacityProviderName] :
  /// The name of the capacity provider.
  ///
  /// Parameter [permissionsConfig] :
  /// The permissions configuration that specifies the IAM role ARN used by the
  /// capacity provider to manage compute resources.
  ///
  /// Parameter [vpcConfig] :
  /// The VPC configuration for the capacity provider, including subnet IDs and
  /// security group IDs where compute instances will be launched.
  ///
  /// Parameter [capacityProviderScalingConfig] :
  /// The scaling configuration that defines how the capacity provider scales
  /// compute instances, including maximum vCPU count and scaling policies.
  ///
  /// Parameter [instanceRequirements] :
  /// The instance requirements that specify the compute instance
  /// characteristics, including architectures and allowed or excluded instance
  /// types.
  ///
  /// Parameter [kmsKeyArn] :
  /// The ARN of the KMS key used to encrypt data associated with the capacity
  /// provider.
  ///
  /// Parameter [propagateTags] :
  /// The tag propagation configuration for the capacity provider. Specifies
  /// tags to apply to managed resources at launch.
  ///
  /// Parameter [tags] :
  /// A list of tags to associate with the capacity provider.
  Future<CreateCapacityProviderResponse> createCapacityProvider({
    required String capacityProviderName,
    required CapacityProviderPermissionsConfig permissionsConfig,
    required CapacityProviderVpcConfig vpcConfig,
    CapacityProviderScalingConfig? capacityProviderScalingConfig,
    InstanceRequirements? instanceRequirements,
    String? kmsKeyArn,
    PropagateTags? propagateTags,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'CapacityProviderName': capacityProviderName,
      'PermissionsConfig': permissionsConfig,
      'VpcConfig': vpcConfig,
      if (capacityProviderScalingConfig != null)
        'CapacityProviderScalingConfig': capacityProviderScalingConfig,
      if (instanceRequirements != null)
        'InstanceRequirements': instanceRequirements,
      if (kmsKeyArn != null) 'KmsKeyArn': kmsKeyArn,
      if (propagateTags != null) 'PropagateTags': propagateTags,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2025-11-30/capacity-providers',
      exceptionFnMap: _exceptionFns,
    );
    return CreateCapacityProviderResponse.fromJson(response);
  }

  /// Retrieves information about a specific capacity provider, including its
  /// configuration, state, and associated resources.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [capacityProviderName] :
  /// The name of the capacity provider to retrieve.
  Future<GetCapacityProviderResponse> getCapacityProvider({
    required String capacityProviderName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2025-11-30/capacity-providers/${Uri.encodeComponent(capacityProviderName)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetCapacityProviderResponse.fromJson(response);
  }

  /// Updates the configuration of an existing capacity provider.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [capacityProviderName] :
  /// The name of the capacity provider to update.
  ///
  /// Parameter [capacityProviderScalingConfig] :
  /// The updated scaling configuration for the capacity provider.
  Future<UpdateCapacityProviderResponse> updateCapacityProvider({
    required String capacityProviderName,
    CapacityProviderScalingConfig? capacityProviderScalingConfig,
    PropagateTags? propagateTags,
  }) async {
    final $payload = <String, dynamic>{
      if (capacityProviderScalingConfig != null)
        'CapacityProviderScalingConfig': capacityProviderScalingConfig,
      if (propagateTags != null) 'PropagateTags': propagateTags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/2025-11-30/capacity-providers/${Uri.encodeComponent(capacityProviderName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateCapacityProviderResponse.fromJson(response);
  }

  /// Deletes a capacity provider. You cannot delete a capacity provider that is
  /// currently being used by Lambda functions.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [capacityProviderName] :
  /// The name of the capacity provider to delete.
  Future<DeleteCapacityProviderResponse> deleteCapacityProvider({
    required String capacityProviderName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2025-11-30/capacity-providers/${Uri.encodeComponent(capacityProviderName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteCapacityProviderResponse.fromJson(response);
  }

  /// Returns a list of capacity providers in your account.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [marker] :
  /// Specify the pagination token that's returned by a previous request to
  /// retrieve the next page of results.
  ///
  /// Parameter [maxItems] :
  /// The maximum number of capacity providers to return.
  ///
  /// Parameter [state] :
  /// Filter capacity providers by their current state.
  Future<ListCapacityProvidersResponse> listCapacityProviders({
    String? marker,
    int? maxItems,
    CapacityProviderState? state,
  }) async {
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (marker != null) 'Marker': [marker],
      if (maxItems != null) 'MaxItems': [maxItems.toString()],
      if (state != null) 'State': [state.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2025-11-30/capacity-providers',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListCapacityProvidersResponse.fromJson(response);
  }

  /// Returns a list of function versions that are configured to use a specific
  /// capacity provider.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [capacityProviderName] :
  /// The name of the capacity provider to list function versions for.
  ///
  /// Parameter [marker] :
  /// Specify the pagination token that's returned by a previous request to
  /// retrieve the next page of results.
  ///
  /// Parameter [maxItems] :
  /// The maximum number of function versions to return in the response.
  Future<ListFunctionVersionsByCapacityProviderResponse>
      listFunctionVersionsByCapacityProvider({
    required String capacityProviderName,
    String? marker,
    int? maxItems,
  }) async {
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (marker != null) 'Marker': [marker],
      if (maxItems != null) 'MaxItems': [maxItems.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2025-11-30/capacity-providers/${Uri.encodeComponent(capacityProviderName)}/function-versions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListFunctionVersionsByCapacityProviderResponse.fromJson(response);
  }

  /// Creates a code signing configuration. A <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-codesigning.html">code
  /// signing configuration</a> defines a list of allowed signing profiles and
  /// defines the code-signing validation policy (action to be taken if
  /// deployment validation checks fail).
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ServiceException].
  ///
  /// Parameter [allowedPublishers] :
  /// Signing profiles for this code signing configuration.
  ///
  /// Parameter [codeSigningPolicies] :
  /// The code signing policies define the actions to take if the validation
  /// checks fail.
  ///
  /// Parameter [description] :
  /// Descriptive name for this code signing configuration.
  ///
  /// Parameter [tags] :
  /// A list of tags to add to the code signing configuration.
  Future<CreateCodeSigningConfigResponse> createCodeSigningConfig({
    required AllowedPublishers allowedPublishers,
    CodeSigningPolicies? codeSigningPolicies,
    String? description,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'AllowedPublishers': allowedPublishers,
      if (codeSigningPolicies != null)
        'CodeSigningPolicies': codeSigningPolicies,
      if (description != null) 'Description': description,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2020-04-22/code-signing-configs',
      exceptionFnMap: _exceptionFns,
    );
    return CreateCodeSigningConfigResponse.fromJson(response);
  }

  /// Returns a list of <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuring-codesigning.html">code
  /// signing configurations</a>. A request returns up to 10,000 configurations
  /// per call. You can use the <code>MaxItems</code> parameter to return fewer
  /// configurations per call.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ServiceException].
  ///
  /// Parameter [marker] :
  /// Specify the pagination token that's returned by a previous request to
  /// retrieve the next page of results.
  ///
  /// Parameter [maxItems] :
  /// Maximum number of items to return.
  Future<ListCodeSigningConfigsResponse> listCodeSigningConfigs({
    String? marker,
    int? maxItems,
  }) async {
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      10000,
    );
    final $query = <String, List<String>>{
      if (marker != null) 'Marker': [marker],
      if (maxItems != null) 'MaxItems': [maxItems.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2020-04-22/code-signing-configs',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListCodeSigningConfigsResponse.fromJson(response);
  }

  /// Deletes the code signing configuration. You can delete the code signing
  /// configuration only if no function is using it.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  ///
  /// Parameter [codeSigningConfigArn] :
  /// The The Amazon Resource Name (ARN) of the code signing configuration.
  Future<void> deleteCodeSigningConfig({
    required String codeSigningConfigArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2020-04-22/code-signing-configs/${Uri.encodeComponent(codeSigningConfigArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns information about the specified code signing configuration.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  ///
  /// Parameter [codeSigningConfigArn] :
  /// The The Amazon Resource Name (ARN) of the code signing configuration.
  Future<GetCodeSigningConfigResponse> getCodeSigningConfig({
    required String codeSigningConfigArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2020-04-22/code-signing-configs/${Uri.encodeComponent(codeSigningConfigArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetCodeSigningConfigResponse.fromJson(response);
  }

  /// List the functions that use the specified code signing configuration. You
  /// can use this method prior to deleting a code signing configuration, to
  /// verify that no functions are using it.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  ///
  /// Parameter [codeSigningConfigArn] :
  /// The The Amazon Resource Name (ARN) of the code signing configuration.
  ///
  /// Parameter [marker] :
  /// Specify the pagination token that's returned by a previous request to
  /// retrieve the next page of results.
  ///
  /// Parameter [maxItems] :
  /// Maximum number of items to return.
  Future<ListFunctionsByCodeSigningConfigResponse>
      listFunctionsByCodeSigningConfig({
    required String codeSigningConfigArn,
    String? marker,
    int? maxItems,
  }) async {
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      10000,
    );
    final $query = <String, List<String>>{
      if (marker != null) 'Marker': [marker],
      if (maxItems != null) 'MaxItems': [maxItems.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2020-04-22/code-signing-configs/${Uri.encodeComponent(codeSigningConfigArn)}/functions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListFunctionsByCodeSigningConfigResponse.fromJson(response);
  }

  /// Update the code signing configuration. Changes to the code signing
  /// configuration take effect the next time a user tries to deploy a code
  /// package to the function.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  ///
  /// Parameter [codeSigningConfigArn] :
  /// The The Amazon Resource Name (ARN) of the code signing configuration.
  ///
  /// Parameter [allowedPublishers] :
  /// Signing profiles for this code signing configuration.
  ///
  /// Parameter [codeSigningPolicies] :
  /// The code signing policy.
  ///
  /// Parameter [description] :
  /// Descriptive name for this code signing configuration.
  Future<UpdateCodeSigningConfigResponse> updateCodeSigningConfig({
    required String codeSigningConfigArn,
    AllowedPublishers? allowedPublishers,
    CodeSigningPolicies? codeSigningPolicies,
    String? description,
  }) async {
    final $payload = <String, dynamic>{
      if (allowedPublishers != null) 'AllowedPublishers': allowedPublishers,
      if (codeSigningPolicies != null)
        'CodeSigningPolicies': codeSigningPolicies,
      if (description != null) 'Description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/2020-04-22/code-signing-configs/${Uri.encodeComponent(codeSigningConfigArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateCodeSigningConfigResponse.fromJson(response);
  }

  /// Creates a mapping between an event source and an Lambda function. Lambda
  /// reads items from the event source and invokes the function.
  ///
  /// For details about how to configure different event sources, see the
  /// following topics.
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/with-ddb.html#services-dynamodb-eventsourcemapping">
  /// Amazon DynamoDB Streams</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/with-kinesis.html#services-kinesis-eventsourcemapping">
  /// Amazon Kinesis</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/with-sqs.html#events-sqs-eventsource">
  /// Amazon SQS</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/with-mq.html#services-mq-eventsourcemapping">
  /// Amazon MQ and RabbitMQ</a>
  /// </li>
  /// <li>
  /// <a href="https://docs.aws.amazon.com/lambda/latest/dg/with-msk.html">
  /// Amazon MSK</a>
  /// </li>
  /// <li>
  /// <a href="https://docs.aws.amazon.com/lambda/latest/dg/kafka-smaa.html">
  /// Apache Kafka</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/with-documentdb.html">
  /// Amazon DocumentDB</a>
  /// </li>
  /// </ul>
  /// The following error handling options are available for stream sources
  /// (DynamoDB, Kinesis, Amazon MSK, and self-managed Apache Kafka):
  ///
  /// <ul>
  /// <li>
  /// <code>BisectBatchOnFunctionError</code> – If the function returns an
  /// error, split the batch in two and retry.
  /// </li>
  /// <li>
  /// <code>MaximumRecordAgeInSeconds</code> – Discard records older than the
  /// specified age. The default value is infinite (-1). When set to infinite
  /// (-1), failed records are retried until the record expires
  /// </li>
  /// <li>
  /// <code>MaximumRetryAttempts</code> – Discard records after the specified
  /// number of retries. The default value is infinite (-1). When set to
  /// infinite (-1), failed records are retried until the record expires.
  /// </li>
  /// <li>
  /// <code>OnFailure</code> – Send discarded records to an Amazon SQS queue,
  /// Amazon SNS topic, Kafka topic, or Amazon S3 bucket. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/invocation-async-retain-records.html#invocation-async-destinations">Adding
  /// a destination</a>.
  /// </li>
  /// </ul>
  /// The following option is available only for DynamoDB and Kinesis event
  /// sources:
  ///
  /// <ul>
  /// <li>
  /// <code>ParallelizationFactor</code> – Process multiple batches from each
  /// shard concurrently.
  /// </li>
  /// </ul>
  /// For information about which configuration parameters apply to each event
  /// source, see the following topics.
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/with-ddb.html#services-ddb-params">
  /// Amazon DynamoDB Streams</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/with-kinesis.html#services-kinesis-params">
  /// Amazon Kinesis</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/with-sqs.html#services-sqs-params">
  /// Amazon SQS</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/with-mq.html#services-mq-params">
  /// Amazon MQ and RabbitMQ</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/with-msk.html#services-msk-parms">
  /// Amazon MSK</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/with-kafka.html#services-kafka-parms">
  /// Apache Kafka</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/with-documentdb.html#docdb-configuration">
  /// Amazon DocumentDB</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [functionName] :
  /// The name or ARN of the Lambda function.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> – <code>MyFunction</code>.
  /// </li>
  /// <li>
  /// <b>Function ARN</b> –
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.
  /// </li>
  /// <li>
  /// <b>Version or Alias ARN</b> –
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction:PROD</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> – <code>123456789012:function:MyFunction</code>.
  /// </li>
  /// </ul>
  /// The length constraint applies only to the full ARN. If you specify only
  /// the function name, it's limited to 64 characters in length.
  ///
  /// Parameter [amazonManagedKafkaEventSourceConfig] :
  /// Specific configuration settings for an Amazon Managed Streaming for Apache
  /// Kafka (Amazon MSK) event source.
  ///
  /// Parameter [batchSize] :
  /// The maximum number of records in each batch that Lambda pulls from your
  /// stream or queue and sends to your function. Lambda passes all of the
  /// records in the batch to the function in a single call, up to the payload
  /// limit for synchronous invocation (6 MB).
  ///
  /// <ul>
  /// <li>
  /// <b>Amazon Kinesis</b> – Default 100. Max 10,000.
  /// </li>
  /// <li>
  /// <b>Amazon DynamoDB Streams</b> – Default 100. Max 10,000.
  /// </li>
  /// <li>
  /// <b>Amazon Simple Queue Service</b> – Default 10. For standard queues the
  /// max is 10,000. For FIFO queues the max is 10.
  /// </li>
  /// <li>
  /// <b>Amazon Managed Streaming for Apache Kafka</b> – Default 100. Max
  /// 10,000.
  /// </li>
  /// <li>
  /// <b>Self-managed Apache Kafka</b> – Default 100. Max 10,000.
  /// </li>
  /// <li>
  /// <b>Amazon MQ (ActiveMQ and RabbitMQ)</b> – Default 100. Max 10,000.
  /// </li>
  /// <li>
  /// <b>DocumentDB</b> – Default 100. Max 10,000.
  /// </li>
  /// </ul>
  ///
  /// Parameter [bisectBatchOnFunctionError] :
  /// (Kinesis, DynamoDB Streams, Amazon MSK, and self-managed Apache Kafka) If
  /// the function returns an error, split the batch in two and retry.
  ///
  /// Parameter [destinationConfig] :
  /// (Kinesis, DynamoDB Streams, Amazon MSK, and self-managed Apache Kafka) A
  /// configuration object that specifies the destination of an event after
  /// Lambda processes it.
  ///
  /// Parameter [documentDBEventSourceConfig] :
  /// Specific configuration settings for a DocumentDB event source.
  ///
  /// Parameter [enabled] :
  /// When true, the event source mapping is active. When false, Lambda pauses
  /// polling and invocation.
  ///
  /// Default: True
  ///
  /// Parameter [eventSourceArn] :
  /// The Amazon Resource Name (ARN) of the event source.
  ///
  /// <ul>
  /// <li>
  /// <b>Amazon Kinesis</b> – The ARN of the data stream or a stream consumer.
  /// </li>
  /// <li>
  /// <b>Amazon DynamoDB Streams</b> – The ARN of the stream.
  /// </li>
  /// <li>
  /// <b>Amazon Simple Queue Service</b> – The ARN of the queue.
  /// </li>
  /// <li>
  /// <b>Amazon Managed Streaming for Apache Kafka</b> – The ARN of the cluster
  /// or the ARN of the VPC connection (for <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/with-msk.html#msk-multi-vpc">cross-account
  /// event source mappings</a>).
  /// </li>
  /// <li>
  /// <b>Amazon MQ</b> – The ARN of the broker.
  /// </li>
  /// <li>
  /// <b>Amazon DocumentDB</b> – The ARN of the DocumentDB change stream.
  /// </li>
  /// </ul>
  ///
  /// Parameter [filterCriteria] :
  /// An object that defines the filter criteria that determine whether Lambda
  /// should process an event. For more information, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/invocation-eventfiltering.html">Lambda
  /// event filtering</a>.
  ///
  /// Parameter [functionResponseTypes] :
  /// (Kinesis, DynamoDB Streams, Amazon MSK, self-managed Apache Kafka, and
  /// Amazon SQS) A list of current response type enums applied to the event
  /// source mapping.
  ///
  /// Parameter [kMSKeyArn] :
  /// The ARN of the Key Management Service (KMS) customer managed key that
  /// Lambda uses to encrypt your function's <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/invocation-eventfiltering.html#filtering-basics">filter
  /// criteria</a>. By default, Lambda does not encrypt your filter criteria
  /// object. Specify this property to encrypt data using your own customer
  /// managed key.
  ///
  /// Parameter [loggingConfig] :
  /// (Amazon MSK, and self-managed Apache Kafka only) The logging configuration
  /// for your event source. For more information, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/esm-logging.html">Event
  /// source mapping logging</a>.
  ///
  /// Parameter [maximumBatchingWindowInSeconds] :
  /// The maximum amount of time, in seconds, that Lambda spends gathering
  /// records before invoking the function. You can configure
  /// <code>MaximumBatchingWindowInSeconds</code> to any value from 0 seconds to
  /// 300 seconds in increments of seconds.
  ///
  /// For Kinesis, DynamoDB, and Amazon SQS event sources, the default batching
  /// window is 0 seconds. For Amazon MSK, Self-managed Apache Kafka, Amazon MQ,
  /// and DocumentDB event sources, the default batching window is 500 ms. Note
  /// that because you can only change
  /// <code>MaximumBatchingWindowInSeconds</code> in increments of seconds, you
  /// cannot revert back to the 500 ms default batching window after you have
  /// changed it. To restore the default batching window, you must create a new
  /// event source mapping.
  ///
  /// Related setting: For Kinesis, DynamoDB, and Amazon SQS event sources, when
  /// you set <code>BatchSize</code> to a value greater than 10, you must set
  /// <code>MaximumBatchingWindowInSeconds</code> to at least 1.
  ///
  /// Parameter [maximumRecordAgeInSeconds] :
  /// (Kinesis, DynamoDB Streams, Amazon MSK, and self-managed Apache Kafka)
  /// Discard records older than the specified age. The default value is
  /// infinite (-1).
  ///
  /// Parameter [maximumRetryAttempts] :
  /// (Kinesis, DynamoDB Streams, Amazon MSK, and self-managed Apache Kafka)
  /// Discard records after the specified number of retries. The default value
  /// is infinite (-1). When set to infinite (-1), failed records are retried
  /// until the record expires.
  ///
  /// Parameter [metricsConfig] :
  /// The metrics configuration for your event source. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/monitoring-metrics-types.html#event-source-mapping-metrics">Event
  /// source mapping metrics</a>.
  ///
  /// Parameter [parallelizationFactor] :
  /// (Kinesis and DynamoDB Streams only) The number of batches to process from
  /// each shard concurrently.
  ///
  /// Parameter [provisionedPollerConfig] :
  /// (Amazon SQS, Amazon MSK, and self-managed Apache Kafka only) The
  /// provisioned mode configuration for the event source. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/invocation-eventsourcemapping.html#invocation-eventsourcemapping-provisioned-mode">provisioned
  /// mode</a>.
  ///
  /// Parameter [queues] :
  /// (MQ) The name of the Amazon MQ broker destination queue to consume.
  ///
  /// Parameter [scalingConfig] :
  /// (Amazon SQS only) The scaling configuration for the event source. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/with-sqs.html#events-sqs-max-concurrency">Configuring
  /// maximum concurrency for Amazon SQS event sources</a>.
  ///
  /// Parameter [selfManagedEventSource] :
  /// The self-managed Apache Kafka cluster to receive records from.
  ///
  /// Parameter [selfManagedKafkaEventSourceConfig] :
  /// Specific configuration settings for a self-managed Apache Kafka event
  /// source.
  ///
  /// Parameter [sourceAccessConfigurations] :
  /// An array of authentication protocols or VPC components required to secure
  /// your event source.
  ///
  /// Parameter [startingPosition] :
  /// The position in a stream from which to start reading. Required for Amazon
  /// Kinesis and Amazon DynamoDB Stream event sources.
  /// <code>AT_TIMESTAMP</code> is supported only for Amazon Kinesis streams,
  /// Amazon DocumentDB, Amazon MSK, and self-managed Apache Kafka.
  ///
  /// Parameter [startingPositionTimestamp] :
  /// With <code>StartingPosition</code> set to <code>AT_TIMESTAMP</code>, the
  /// time from which to start reading. <code>StartingPositionTimestamp</code>
  /// cannot be in the future.
  ///
  /// Parameter [tags] :
  /// A list of tags to apply to the event source mapping.
  ///
  /// Parameter [topics] :
  /// The name of the Kafka topic.
  ///
  /// Parameter [tumblingWindowInSeconds] :
  /// (Kinesis and DynamoDB Streams only) The duration in seconds of a
  /// processing window for DynamoDB and Kinesis Streams event sources. A value
  /// of 0 seconds indicates no tumbling window.
  Future<EventSourceMappingConfiguration> createEventSourceMapping({
    required String functionName,
    AmazonManagedKafkaEventSourceConfig? amazonManagedKafkaEventSourceConfig,
    int? batchSize,
    bool? bisectBatchOnFunctionError,
    DestinationConfig? destinationConfig,
    DocumentDBEventSourceConfig? documentDBEventSourceConfig,
    bool? enabled,
    String? eventSourceArn,
    FilterCriteria? filterCriteria,
    List<FunctionResponseType>? functionResponseTypes,
    String? kMSKeyArn,
    EventSourceMappingLoggingConfig? loggingConfig,
    int? maximumBatchingWindowInSeconds,
    int? maximumRecordAgeInSeconds,
    int? maximumRetryAttempts,
    EventSourceMappingMetricsConfig? metricsConfig,
    int? parallelizationFactor,
    ProvisionedPollerConfig? provisionedPollerConfig,
    List<String>? queues,
    ScalingConfig? scalingConfig,
    SelfManagedEventSource? selfManagedEventSource,
    SelfManagedKafkaEventSourceConfig? selfManagedKafkaEventSourceConfig,
    List<SourceAccessConfiguration>? sourceAccessConfigurations,
    EventSourcePosition? startingPosition,
    DateTime? startingPositionTimestamp,
    Map<String, String>? tags,
    List<String>? topics,
    int? tumblingWindowInSeconds,
  }) async {
    _s.validateNumRange(
      'batchSize',
      batchSize,
      1,
      10000,
    );
    _s.validateNumRange(
      'maximumBatchingWindowInSeconds',
      maximumBatchingWindowInSeconds,
      0,
      300,
    );
    _s.validateNumRange(
      'maximumRecordAgeInSeconds',
      maximumRecordAgeInSeconds,
      -1,
      604800,
    );
    _s.validateNumRange(
      'maximumRetryAttempts',
      maximumRetryAttempts,
      -1,
      10000,
    );
    _s.validateNumRange(
      'parallelizationFactor',
      parallelizationFactor,
      1,
      10,
    );
    _s.validateNumRange(
      'tumblingWindowInSeconds',
      tumblingWindowInSeconds,
      0,
      900,
    );
    final $payload = <String, dynamic>{
      'FunctionName': functionName,
      if (amazonManagedKafkaEventSourceConfig != null)
        'AmazonManagedKafkaEventSourceConfig':
            amazonManagedKafkaEventSourceConfig,
      if (batchSize != null) 'BatchSize': batchSize,
      if (bisectBatchOnFunctionError != null)
        'BisectBatchOnFunctionError': bisectBatchOnFunctionError,
      if (destinationConfig != null) 'DestinationConfig': destinationConfig,
      if (documentDBEventSourceConfig != null)
        'DocumentDBEventSourceConfig': documentDBEventSourceConfig,
      if (enabled != null) 'Enabled': enabled,
      if (eventSourceArn != null) 'EventSourceArn': eventSourceArn,
      if (filterCriteria != null) 'FilterCriteria': filterCriteria,
      if (functionResponseTypes != null)
        'FunctionResponseTypes':
            functionResponseTypes.map((e) => e.value).toList(),
      if (kMSKeyArn != null) 'KMSKeyArn': kMSKeyArn,
      if (loggingConfig != null) 'LoggingConfig': loggingConfig,
      if (maximumBatchingWindowInSeconds != null)
        'MaximumBatchingWindowInSeconds': maximumBatchingWindowInSeconds,
      if (maximumRecordAgeInSeconds != null)
        'MaximumRecordAgeInSeconds': maximumRecordAgeInSeconds,
      if (maximumRetryAttempts != null)
        'MaximumRetryAttempts': maximumRetryAttempts,
      if (metricsConfig != null) 'MetricsConfig': metricsConfig,
      if (parallelizationFactor != null)
        'ParallelizationFactor': parallelizationFactor,
      if (provisionedPollerConfig != null)
        'ProvisionedPollerConfig': provisionedPollerConfig,
      if (queues != null) 'Queues': queues,
      if (scalingConfig != null) 'ScalingConfig': scalingConfig,
      if (selfManagedEventSource != null)
        'SelfManagedEventSource': selfManagedEventSource,
      if (selfManagedKafkaEventSourceConfig != null)
        'SelfManagedKafkaEventSourceConfig': selfManagedKafkaEventSourceConfig,
      if (sourceAccessConfigurations != null)
        'SourceAccessConfigurations': sourceAccessConfigurations,
      if (startingPosition != null) 'StartingPosition': startingPosition.value,
      if (startingPositionTimestamp != null)
        'StartingPositionTimestamp':
            unixTimestampToJson(startingPositionTimestamp),
      if (tags != null) 'Tags': tags,
      if (topics != null) 'Topics': topics,
      if (tumblingWindowInSeconds != null)
        'TumblingWindowInSeconds': tumblingWindowInSeconds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2015-03-31/event-source-mappings',
      exceptionFnMap: _exceptionFns,
    );
    return EventSourceMappingConfiguration.fromJson(response);
  }

  /// Returns details about an event source mapping. You can get the identifier
  /// of a mapping from the output of <a>ListEventSourceMappings</a>.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [uuid] :
  /// The identifier of the event source mapping.
  Future<EventSourceMappingConfiguration> getEventSourceMapping({
    required String uuid,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2015-03-31/event-source-mappings/${Uri.encodeComponent(uuid)}',
      exceptionFnMap: _exceptionFns,
    );
    return EventSourceMappingConfiguration.fromJson(response);
  }

  /// Updates an event source mapping. You can change the function that Lambda
  /// invokes, or pause invocation and resume later from the same location.
  ///
  /// For details about how to configure different event sources, see the
  /// following topics.
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/with-ddb.html#services-dynamodb-eventsourcemapping">
  /// Amazon DynamoDB Streams</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/with-kinesis.html#services-kinesis-eventsourcemapping">
  /// Amazon Kinesis</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/with-sqs.html#events-sqs-eventsource">
  /// Amazon SQS</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/with-mq.html#services-mq-eventsourcemapping">
  /// Amazon MQ and RabbitMQ</a>
  /// </li>
  /// <li>
  /// <a href="https://docs.aws.amazon.com/lambda/latest/dg/with-msk.html">
  /// Amazon MSK</a>
  /// </li>
  /// <li>
  /// <a href="https://docs.aws.amazon.com/lambda/latest/dg/kafka-smaa.html">
  /// Apache Kafka</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/with-documentdb.html">
  /// Amazon DocumentDB</a>
  /// </li>
  /// </ul>
  /// The following error handling options are available for stream sources
  /// (DynamoDB, Kinesis, Amazon MSK, and self-managed Apache Kafka):
  ///
  /// <ul>
  /// <li>
  /// <code>BisectBatchOnFunctionError</code> – If the function returns an
  /// error, split the batch in two and retry.
  /// </li>
  /// <li>
  /// <code>MaximumRecordAgeInSeconds</code> – Discard records older than the
  /// specified age. The default value is infinite (-1). When set to infinite
  /// (-1), failed records are retried until the record expires
  /// </li>
  /// <li>
  /// <code>MaximumRetryAttempts</code> – Discard records after the specified
  /// number of retries. The default value is infinite (-1). When set to
  /// infinite (-1), failed records are retried until the record expires.
  /// </li>
  /// <li>
  /// <code>OnFailure</code> – Send discarded records to an Amazon SQS queue,
  /// Amazon SNS topic, Kafka topic, or Amazon S3 bucket. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/invocation-async-retain-records.html#invocation-async-destinations">Adding
  /// a destination</a>.
  /// </li>
  /// </ul>
  /// The following option is available only for DynamoDB and Kinesis event
  /// sources:
  ///
  /// <ul>
  /// <li>
  /// <code>ParallelizationFactor</code> – Process multiple batches from each
  /// shard concurrently.
  /// </li>
  /// </ul>
  /// For information about which configuration parameters apply to each event
  /// source, see the following topics.
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/with-ddb.html#services-ddb-params">
  /// Amazon DynamoDB Streams</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/with-kinesis.html#services-kinesis-params">
  /// Amazon Kinesis</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/with-sqs.html#services-sqs-params">
  /// Amazon SQS</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/with-mq.html#services-mq-params">
  /// Amazon MQ and RabbitMQ</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/with-msk.html#services-msk-parms">
  /// Amazon MSK</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/with-kafka.html#services-kafka-parms">
  /// Apache Kafka</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/with-documentdb.html#docdb-configuration">
  /// Amazon DocumentDB</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceConflictException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [uuid] :
  /// The identifier of the event source mapping.
  ///
  /// Parameter [batchSize] :
  /// The maximum number of records in each batch that Lambda pulls from your
  /// stream or queue and sends to your function. Lambda passes all of the
  /// records in the batch to the function in a single call, up to the payload
  /// limit for synchronous invocation (6 MB).
  ///
  /// <ul>
  /// <li>
  /// <b>Amazon Kinesis</b> – Default 100. Max 10,000.
  /// </li>
  /// <li>
  /// <b>Amazon DynamoDB Streams</b> – Default 100. Max 10,000.
  /// </li>
  /// <li>
  /// <b>Amazon Simple Queue Service</b> – Default 10. For standard queues the
  /// max is 10,000. For FIFO queues the max is 10.
  /// </li>
  /// <li>
  /// <b>Amazon Managed Streaming for Apache Kafka</b> – Default 100. Max
  /// 10,000.
  /// </li>
  /// <li>
  /// <b>Self-managed Apache Kafka</b> – Default 100. Max 10,000.
  /// </li>
  /// <li>
  /// <b>Amazon MQ (ActiveMQ and RabbitMQ)</b> – Default 100. Max 10,000.
  /// </li>
  /// <li>
  /// <b>DocumentDB</b> – Default 100. Max 10,000.
  /// </li>
  /// </ul>
  ///
  /// Parameter [bisectBatchOnFunctionError] :
  /// (Kinesis, DynamoDB Streams, Amazon MSK, and self-managed Apache Kafka) If
  /// the function returns an error, split the batch in two and retry.
  ///
  /// Parameter [destinationConfig] :
  /// (Kinesis, DynamoDB Streams, Amazon MSK, and self-managed Apache Kafka) A
  /// configuration object that specifies the destination of an event after
  /// Lambda processes it.
  ///
  /// Parameter [documentDBEventSourceConfig] :
  /// Specific configuration settings for a DocumentDB event source.
  ///
  /// Parameter [enabled] :
  /// When true, the event source mapping is active. When false, Lambda pauses
  /// polling and invocation.
  ///
  /// Default: True
  ///
  /// Parameter [filterCriteria] :
  /// An object that defines the filter criteria that determine whether Lambda
  /// should process an event. For more information, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/invocation-eventfiltering.html">Lambda
  /// event filtering</a>.
  ///
  /// Parameter [functionName] :
  /// The name or ARN of the Lambda function.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> – <code>MyFunction</code>.
  /// </li>
  /// <li>
  /// <b>Function ARN</b> –
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.
  /// </li>
  /// <li>
  /// <b>Version or Alias ARN</b> –
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction:PROD</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> – <code>123456789012:function:MyFunction</code>.
  /// </li>
  /// </ul>
  /// The length constraint applies only to the full ARN. If you specify only
  /// the function name, it's limited to 64 characters in length.
  ///
  /// Parameter [functionResponseTypes] :
  /// (Kinesis, DynamoDB Streams, Amazon MSK, self-managed Apache Kafka, and
  /// Amazon SQS) A list of current response type enums applied to the event
  /// source mapping.
  ///
  /// Parameter [kMSKeyArn] :
  /// The ARN of the Key Management Service (KMS) customer managed key that
  /// Lambda uses to encrypt your function's <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/invocation-eventfiltering.html#filtering-basics">filter
  /// criteria</a>. By default, Lambda does not encrypt your filter criteria
  /// object. Specify this property to encrypt data using your own customer
  /// managed key.
  ///
  /// Parameter [maximumBatchingWindowInSeconds] :
  /// The maximum amount of time, in seconds, that Lambda spends gathering
  /// records before invoking the function. You can configure
  /// <code>MaximumBatchingWindowInSeconds</code> to any value from 0 seconds to
  /// 300 seconds in increments of seconds.
  ///
  /// For Kinesis, DynamoDB, and Amazon SQS event sources, the default batching
  /// window is 0 seconds. For Amazon MSK, Self-managed Apache Kafka, Amazon MQ,
  /// and DocumentDB event sources, the default batching window is 500 ms. Note
  /// that because you can only change
  /// <code>MaximumBatchingWindowInSeconds</code> in increments of seconds, you
  /// cannot revert back to the 500 ms default batching window after you have
  /// changed it. To restore the default batching window, you must create a new
  /// event source mapping.
  ///
  /// Related setting: For Kinesis, DynamoDB, and Amazon SQS event sources, when
  /// you set <code>BatchSize</code> to a value greater than 10, you must set
  /// <code>MaximumBatchingWindowInSeconds</code> to at least 1.
  ///
  /// Parameter [maximumRecordAgeInSeconds] :
  /// (Kinesis, DynamoDB Streams, Amazon MSK, and self-managed Apache Kafka)
  /// Discard records older than the specified age. The default value is
  /// infinite (-1).
  ///
  /// Parameter [maximumRetryAttempts] :
  /// (Kinesis, DynamoDB Streams, Amazon MSK, and self-managed Apache Kafka)
  /// Discard records after the specified number of retries. The default value
  /// is infinite (-1). When set to infinite (-1), failed records are retried
  /// until the record expires.
  ///
  /// Parameter [metricsConfig] :
  /// The metrics configuration for your event source. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/monitoring-metrics-types.html#event-source-mapping-metrics">Event
  /// source mapping metrics</a>.
  ///
  /// Parameter [parallelizationFactor] :
  /// (Kinesis and DynamoDB Streams only) The number of batches to process from
  /// each shard concurrently.
  ///
  /// Parameter [provisionedPollerConfig] :
  /// (Amazon SQS, Amazon MSK, and self-managed Apache Kafka only) The
  /// provisioned mode configuration for the event source. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/invocation-eventsourcemapping.html#invocation-eventsourcemapping-provisioned-mode">provisioned
  /// mode</a>.
  ///
  /// Parameter [scalingConfig] :
  /// (Amazon SQS only) The scaling configuration for the event source. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/with-sqs.html#events-sqs-max-concurrency">Configuring
  /// maximum concurrency for Amazon SQS event sources</a>.
  ///
  /// Parameter [sourceAccessConfigurations] :
  /// An array of authentication protocols or VPC components required to secure
  /// your event source.
  ///
  /// Parameter [tumblingWindowInSeconds] :
  /// (Kinesis and DynamoDB Streams only) The duration in seconds of a
  /// processing window for DynamoDB and Kinesis Streams event sources. A value
  /// of 0 seconds indicates no tumbling window.
  Future<EventSourceMappingConfiguration> updateEventSourceMapping({
    required String uuid,
    AmazonManagedKafkaEventSourceConfig? amazonManagedKafkaEventSourceConfig,
    int? batchSize,
    bool? bisectBatchOnFunctionError,
    DestinationConfig? destinationConfig,
    DocumentDBEventSourceConfig? documentDBEventSourceConfig,
    bool? enabled,
    FilterCriteria? filterCriteria,
    String? functionName,
    List<FunctionResponseType>? functionResponseTypes,
    String? kMSKeyArn,
    EventSourceMappingLoggingConfig? loggingConfig,
    int? maximumBatchingWindowInSeconds,
    int? maximumRecordAgeInSeconds,
    int? maximumRetryAttempts,
    EventSourceMappingMetricsConfig? metricsConfig,
    int? parallelizationFactor,
    ProvisionedPollerConfig? provisionedPollerConfig,
    ScalingConfig? scalingConfig,
    SelfManagedKafkaEventSourceConfig? selfManagedKafkaEventSourceConfig,
    List<SourceAccessConfiguration>? sourceAccessConfigurations,
    int? tumblingWindowInSeconds,
  }) async {
    _s.validateNumRange(
      'batchSize',
      batchSize,
      1,
      10000,
    );
    _s.validateNumRange(
      'maximumBatchingWindowInSeconds',
      maximumBatchingWindowInSeconds,
      0,
      300,
    );
    _s.validateNumRange(
      'maximumRecordAgeInSeconds',
      maximumRecordAgeInSeconds,
      -1,
      604800,
    );
    _s.validateNumRange(
      'maximumRetryAttempts',
      maximumRetryAttempts,
      -1,
      10000,
    );
    _s.validateNumRange(
      'parallelizationFactor',
      parallelizationFactor,
      1,
      10,
    );
    _s.validateNumRange(
      'tumblingWindowInSeconds',
      tumblingWindowInSeconds,
      0,
      900,
    );
    final $payload = <String, dynamic>{
      if (amazonManagedKafkaEventSourceConfig != null)
        'AmazonManagedKafkaEventSourceConfig':
            amazonManagedKafkaEventSourceConfig,
      if (batchSize != null) 'BatchSize': batchSize,
      if (bisectBatchOnFunctionError != null)
        'BisectBatchOnFunctionError': bisectBatchOnFunctionError,
      if (destinationConfig != null) 'DestinationConfig': destinationConfig,
      if (documentDBEventSourceConfig != null)
        'DocumentDBEventSourceConfig': documentDBEventSourceConfig,
      if (enabled != null) 'Enabled': enabled,
      if (filterCriteria != null) 'FilterCriteria': filterCriteria,
      if (functionName != null) 'FunctionName': functionName,
      if (functionResponseTypes != null)
        'FunctionResponseTypes':
            functionResponseTypes.map((e) => e.value).toList(),
      if (kMSKeyArn != null) 'KMSKeyArn': kMSKeyArn,
      if (loggingConfig != null) 'LoggingConfig': loggingConfig,
      if (maximumBatchingWindowInSeconds != null)
        'MaximumBatchingWindowInSeconds': maximumBatchingWindowInSeconds,
      if (maximumRecordAgeInSeconds != null)
        'MaximumRecordAgeInSeconds': maximumRecordAgeInSeconds,
      if (maximumRetryAttempts != null)
        'MaximumRetryAttempts': maximumRetryAttempts,
      if (metricsConfig != null) 'MetricsConfig': metricsConfig,
      if (parallelizationFactor != null)
        'ParallelizationFactor': parallelizationFactor,
      if (provisionedPollerConfig != null)
        'ProvisionedPollerConfig': provisionedPollerConfig,
      if (scalingConfig != null) 'ScalingConfig': scalingConfig,
      if (selfManagedKafkaEventSourceConfig != null)
        'SelfManagedKafkaEventSourceConfig': selfManagedKafkaEventSourceConfig,
      if (sourceAccessConfigurations != null)
        'SourceAccessConfigurations': sourceAccessConfigurations,
      if (tumblingWindowInSeconds != null)
        'TumblingWindowInSeconds': tumblingWindowInSeconds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/2015-03-31/event-source-mappings/${Uri.encodeComponent(uuid)}',
      exceptionFnMap: _exceptionFns,
    );
    return EventSourceMappingConfiguration.fromJson(response);
  }

  /// Deletes an <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/intro-invocation-modes.html">event
  /// source mapping</a>. You can get the identifier of a mapping from the
  /// output of <a>ListEventSourceMappings</a>.
  ///
  /// When you delete an event source mapping, it enters a <code>Deleting</code>
  /// state and might not be completely deleted for several seconds.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceConflictException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [uuid] :
  /// The identifier of the event source mapping.
  Future<EventSourceMappingConfiguration> deleteEventSourceMapping({
    required String uuid,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2015-03-31/event-source-mappings/${Uri.encodeComponent(uuid)}',
      exceptionFnMap: _exceptionFns,
    );
    return EventSourceMappingConfiguration.fromJson(response);
  }

  /// Lists event source mappings. Specify an <code>EventSourceArn</code> to
  /// show only event source mappings for a single event source.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [eventSourceArn] :
  /// The Amazon Resource Name (ARN) of the event source.
  ///
  /// <ul>
  /// <li>
  /// <b>Amazon Kinesis</b> – The ARN of the data stream or a stream consumer.
  /// </li>
  /// <li>
  /// <b>Amazon DynamoDB Streams</b> – The ARN of the stream.
  /// </li>
  /// <li>
  /// <b>Amazon Simple Queue Service</b> – The ARN of the queue.
  /// </li>
  /// <li>
  /// <b>Amazon Managed Streaming for Apache Kafka</b> – The ARN of the cluster
  /// or the ARN of the VPC connection (for <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/with-msk.html#msk-multi-vpc">cross-account
  /// event source mappings</a>).
  /// </li>
  /// <li>
  /// <b>Amazon MQ</b> – The ARN of the broker.
  /// </li>
  /// <li>
  /// <b>Amazon DocumentDB</b> – The ARN of the DocumentDB change stream.
  /// </li>
  /// </ul>
  ///
  /// Parameter [functionName] :
  /// The name or ARN of the Lambda function.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> – <code>MyFunction</code>.
  /// </li>
  /// <li>
  /// <b>Function ARN</b> –
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.
  /// </li>
  /// <li>
  /// <b>Version or Alias ARN</b> –
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction:PROD</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> – <code>123456789012:function:MyFunction</code>.
  /// </li>
  /// </ul>
  /// The length constraint applies only to the full ARN. If you specify only
  /// the function name, it's limited to 64 characters in length.
  ///
  /// Parameter [marker] :
  /// A pagination token returned by a previous call.
  ///
  /// Parameter [maxItems] :
  /// The maximum number of event source mappings to return. Note that
  /// ListEventSourceMappings returns a maximum of 100 items in each response,
  /// even if you set the number higher.
  Future<ListEventSourceMappingsResponse> listEventSourceMappings({
    String? eventSourceArn,
    String? functionName,
    String? marker,
    int? maxItems,
  }) async {
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      10000,
    );
    final $query = <String, List<String>>{
      if (eventSourceArn != null) 'EventSourceArn': [eventSourceArn],
      if (functionName != null) 'FunctionName': [functionName],
      if (marker != null) 'Marker': [marker],
      if (maxItems != null) 'MaxItems': [maxItems.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2015-03-31/event-source-mappings',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListEventSourceMappingsResponse.fromJson(response);
  }

  /// Creates a Lambda function. To create a function, you need a <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/gettingstarted-package.html">deployment
  /// package</a> and an <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/intro-permission-model.html#lambda-intro-execution-role">execution
  /// role</a>. The deployment package is a .zip file archive or container image
  /// that contains your function code. The execution role grants the function
  /// permission to use Amazon Web Services services, such as Amazon CloudWatch
  /// Logs for log streaming and X-Ray for request tracing.
  ///
  /// If the deployment package is a <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-images.html">container
  /// image</a>, then you set the package type to <code>Image</code>. For a
  /// container image, the code property must include the URI of a container
  /// image in the Amazon ECR registry. You do not need to specify the handler
  /// and runtime properties.
  ///
  /// If the deployment package is a <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/gettingstarted-package.html#gettingstarted-package-zip">.zip
  /// file archive</a>, then you set the package type to <code>Zip</code>. For a
  /// .zip file archive, the code property specifies the location of the .zip
  /// file. You must also specify the handler and runtime properties. The code
  /// in the deployment package must be compatible with the target instruction
  /// set architecture of the function (<code>x86-64</code> or
  /// <code>arm64</code>). If you do not specify the architecture, then the
  /// default value is <code>x86-64</code>.
  ///
  /// When you create a function, Lambda provisions an instance of the function
  /// and its supporting resources. If your function connects to a VPC, this
  /// process can take a minute or so. During this time, you can't invoke or
  /// modify the function. The <code>State</code>, <code>StateReason</code>, and
  /// <code>StateReasonCode</code> fields in the response from
  /// <a>GetFunctionConfiguration</a> indicate when the function is ready to
  /// invoke. For more information, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/functions-states.html">Lambda
  /// function states</a>.
  ///
  /// A function has an unpublished version, and can have published versions and
  /// aliases. The unpublished version changes when you update your function's
  /// code and configuration. A published version is a snapshot of your function
  /// code and configuration that can't be changed. An alias is a named resource
  /// that maps to a version, and can be changed to map to a different version.
  /// Use the <code>Publish</code> parameter to create version <code>1</code> of
  /// your function from its initial configuration.
  ///
  /// The other parameters let you configure version-specific and function-level
  /// settings. You can modify version-specific settings later with
  /// <a>UpdateFunctionConfiguration</a>. Function-level settings apply to both
  /// the unpublished and published versions of the function, and include tags
  /// (<a>TagResource</a>) and per-function concurrency limits
  /// (<a>PutFunctionConcurrency</a>).
  ///
  /// You can use code signing if your deployment package is a .zip file
  /// archive. To enable code signing for this function, specify the ARN of a
  /// code-signing configuration. When a user attempts to deploy a code package
  /// with <a>UpdateFunctionCode</a>, Lambda checks that the code package has a
  /// valid signature from a trusted publisher. The code-signing configuration
  /// includes set of signing profiles, which define the trusted publishers for
  /// this function.
  ///
  /// If another Amazon Web Services account or an Amazon Web Services service
  /// invokes your function, use <a>AddPermission</a> to grant permission by
  /// creating a resource-based Identity and Access Management (IAM) policy. You
  /// can grant permissions at the function level, on a version, or on an alias.
  ///
  /// To invoke your function directly, use <a>Invoke</a>. To invoke your
  /// function in response to events in other Amazon Web Services services,
  /// create an event source mapping (<a>CreateEventSourceMapping</a>), or
  /// configure a function trigger in the other service. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-invocation.html">Invoking
  /// Lambda functions</a>.
  ///
  /// May throw [CodeSigningConfigNotFoundException].
  /// May throw [CodeStorageExceededException].
  /// May throw [CodeVerificationFailedException].
  /// May throw [FunctionVersionsPerCapacityProviderLimitExceededException].
  /// May throw [InvalidCodeSignatureException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [code] :
  /// The code for the function.
  ///
  /// Parameter [functionName] :
  /// The name or ARN of the Lambda function.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> – <code>my-function</code>.
  /// </li>
  /// <li>
  /// <b>Function ARN</b> –
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> – <code>123456789012:function:my-function</code>.
  /// </li>
  /// </ul>
  /// The length constraint applies only to the full ARN. If you specify only
  /// the function name, it is limited to 64 characters in length.
  ///
  /// Parameter [role] :
  /// The Amazon Resource Name (ARN) of the function's execution role.
  ///
  /// Parameter [architectures] :
  /// The instruction set architecture that the function supports. Enter a
  /// string array with one of the valid values (arm64 or x86_64). The default
  /// value is <code>x86_64</code>.
  ///
  /// Parameter [capacityProviderConfig] :
  /// Configuration for the capacity provider that manages compute resources for
  /// Lambda functions.
  ///
  /// Parameter [codeSigningConfigArn] :
  /// To enable code signing for this function, specify the ARN of a
  /// code-signing configuration. A code-signing configuration includes a set of
  /// signing profiles, which define the trusted publishers for this function.
  ///
  /// Parameter [deadLetterConfig] :
  /// A dead-letter queue configuration that specifies the queue or topic where
  /// Lambda sends asynchronous events when they fail processing. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/invocation-async.html#invocation-dlq">Dead-letter
  /// queues</a>.
  ///
  /// Parameter [description] :
  /// A description of the function.
  ///
  /// Parameter [durableConfig] :
  /// Configuration settings for durable functions. Enables creating functions
  /// with durability that can remember their state and continue execution even
  /// after interruptions.
  ///
  /// Parameter [environment] :
  /// Environment variables that are accessible from function code during
  /// execution.
  ///
  /// Parameter [ephemeralStorage] :
  /// The size of the function's <code>/tmp</code> directory in MB. The default
  /// value is 512, but can be any whole number between 512 and 10,240 MB. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-function-common.html#configuration-ephemeral-storage">Configuring
  /// ephemeral storage (console)</a>.
  ///
  /// Parameter [fileSystemConfigs] :
  /// Connection settings for an Amazon EFS file system or an Amazon S3 Files
  /// file system.
  ///
  /// Parameter [handler] :
  /// The name of the method within your code that Lambda calls to run your
  /// function. Handler is required if the deployment package is a .zip file
  /// archive. The format includes the file name. It can also include namespaces
  /// and other qualifiers, depending on the runtime. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/foundation-progmodel.html">Lambda
  /// programming model</a>.
  ///
  /// Parameter [imageConfig] :
  /// Container image <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/images-create.html#images-parms">configuration
  /// values</a> that override the values in the container image Dockerfile.
  ///
  /// Parameter [kMSKeyArn] :
  /// The ARN of the Key Management Service (KMS) customer managed key that's
  /// used to encrypt the following resources:
  ///
  /// <ul>
  /// <li>
  /// The function's <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-envvars.html#configuration-envvars-encryption">environment
  /// variables</a>.
  /// </li>
  /// <li>
  /// The function's <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/snapstart-security.html">Lambda
  /// SnapStart</a> snapshots.
  /// </li>
  /// <li>
  /// When used with <code>SourceKMSKeyArn</code>, the unzipped version of the
  /// .zip deployment package that's used for function invocations. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/encrypt-zip-package.html#enable-zip-custom-encryption">
  /// Specifying a customer managed key for Lambda</a>.
  /// </li>
  /// <li>
  /// The optimized version of the container image that's used for function
  /// invocations. Note that this is not the same key that's used to protect
  /// your container image in the Amazon Elastic Container Registry (Amazon
  /// ECR). For more information, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/images-create.html#images-lifecycle">Function
  /// lifecycle</a>.
  /// </li>
  /// </ul>
  /// If you don't provide a customer managed key, Lambda uses an <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-owned-cmk">Amazon
  /// Web Services owned key</a> or an <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-managed-cmk">Amazon
  /// Web Services managed key</a>.
  ///
  /// Parameter [layers] :
  /// A list of <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">function
  /// layers</a> to add to the function's execution environment. Specify each
  /// layer by its ARN, including the version.
  ///
  /// Parameter [loggingConfig] :
  /// The function's Amazon CloudWatch Logs configuration settings.
  ///
  /// Parameter [memorySize] :
  /// The amount of <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-function-common.html#configuration-memory-console">memory
  /// available to the function</a> at runtime. Increasing the function memory
  /// also increases its CPU allocation. The default value is 128 MB. The value
  /// can be any multiple of 1 MB.
  ///
  /// Parameter [packageType] :
  /// The type of deployment package. Set to <code>Image</code> for container
  /// image and set to <code>Zip</code> for .zip file archive.
  ///
  /// Parameter [publish] :
  /// Set to true to publish the first version of the function during creation.
  ///
  /// Parameter [publishTo] :
  /// Specifies where to publish the function version or configuration.
  ///
  /// Parameter [runtime] :
  /// The identifier of the function's <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html">
  /// runtime</a>. Runtime is required if the deployment package is a .zip file
  /// archive. Specifying a runtime results in an error if you're deploying a
  /// function using a container image.
  ///
  /// The following list includes deprecated runtimes. Lambda blocks creating
  /// new functions and updating existing functions shortly after each runtime
  /// is deprecated. For more information, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html#runtime-deprecation-levels">Runtime
  /// use after deprecation</a>.
  ///
  /// For a list of all currently supported runtimes, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html#runtimes-supported">Supported
  /// runtimes</a>.
  ///
  /// Parameter [snapStart] :
  /// The function's <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/snapstart.html">SnapStart</a>
  /// setting.
  ///
  /// Parameter [tags] :
  /// A list of <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/tagging.html">tags</a>
  /// to apply to the function.
  ///
  /// Parameter [tenancyConfig] :
  /// Configuration for multi-tenant applications that use Lambda functions.
  /// Defines tenant isolation settings and resource allocations. Required for
  /// functions supporting multiple tenants.
  ///
  /// Parameter [timeout] :
  /// The amount of time (in seconds) that Lambda allows a function to run
  /// before stopping it. The default is 3 seconds. The maximum allowed value is
  /// 900 seconds. For more information, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/runtimes-context.html">Lambda
  /// execution environment</a>.
  ///
  /// Parameter [tracingConfig] :
  /// Set <code>Mode</code> to <code>Active</code> to sample and trace a subset
  /// of incoming requests with <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/services-xray.html">X-Ray</a>.
  ///
  /// Parameter [vpcConfig] :
  /// For network connectivity to Amazon Web Services resources in a VPC,
  /// specify a list of security groups and subnets in the VPC. When you connect
  /// a function to a VPC, it can access resources and the internet only through
  /// that VPC. For more information, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-vpc.html">Configuring
  /// a Lambda function to access resources in a VPC</a>.
  Future<FunctionConfiguration> createFunction({
    required FunctionCode code,
    required String functionName,
    required String role,
    List<Architecture>? architectures,
    CapacityProviderConfig? capacityProviderConfig,
    String? codeSigningConfigArn,
    DeadLetterConfig? deadLetterConfig,
    String? description,
    DurableConfig? durableConfig,
    Environment? environment,
    EphemeralStorage? ephemeralStorage,
    List<FileSystemConfig>? fileSystemConfigs,
    String? handler,
    ImageConfig? imageConfig,
    String? kMSKeyArn,
    List<String>? layers,
    LoggingConfig? loggingConfig,
    int? memorySize,
    PackageType? packageType,
    bool? publish,
    FunctionVersionLatestPublished? publishTo,
    Runtime? runtime,
    SnapStart? snapStart,
    Map<String, String>? tags,
    TenancyConfig? tenancyConfig,
    int? timeout,
    TracingConfig? tracingConfig,
    VpcConfig? vpcConfig,
  }) async {
    _s.validateNumRange(
      'memorySize',
      memorySize,
      128,
      32768,
    );
    _s.validateNumRange(
      'timeout',
      timeout,
      1,
      1152921504606846976,
    );
    final $payload = <String, dynamic>{
      'Code': code,
      'FunctionName': functionName,
      'Role': role,
      if (architectures != null)
        'Architectures': architectures.map((e) => e.value).toList(),
      if (capacityProviderConfig != null)
        'CapacityProviderConfig': capacityProviderConfig,
      if (codeSigningConfigArn != null)
        'CodeSigningConfigArn': codeSigningConfigArn,
      if (deadLetterConfig != null) 'DeadLetterConfig': deadLetterConfig,
      if (description != null) 'Description': description,
      if (durableConfig != null) 'DurableConfig': durableConfig,
      if (environment != null) 'Environment': environment,
      if (ephemeralStorage != null) 'EphemeralStorage': ephemeralStorage,
      if (fileSystemConfigs != null) 'FileSystemConfigs': fileSystemConfigs,
      if (handler != null) 'Handler': handler,
      if (imageConfig != null) 'ImageConfig': imageConfig,
      if (kMSKeyArn != null) 'KMSKeyArn': kMSKeyArn,
      if (layers != null) 'Layers': layers,
      if (loggingConfig != null) 'LoggingConfig': loggingConfig,
      if (memorySize != null) 'MemorySize': memorySize,
      if (packageType != null) 'PackageType': packageType.value,
      if (publish != null) 'Publish': publish,
      if (publishTo != null) 'PublishTo': publishTo.value,
      if (runtime != null) 'Runtime': runtime.value,
      if (snapStart != null) 'SnapStart': snapStart,
      if (tags != null) 'Tags': tags,
      if (tenancyConfig != null) 'TenancyConfig': tenancyConfig,
      if (timeout != null) 'Timeout': timeout,
      if (tracingConfig != null) 'TracingConfig': tracingConfig,
      if (vpcConfig != null) 'VpcConfig': vpcConfig,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2015-03-31/functions',
      exceptionFnMap: _exceptionFns,
    );
    return FunctionConfiguration.fromJson(response);
  }

  /// Returns a list of Lambda functions, with the version-specific
  /// configuration of each. Lambda returns up to 50 functions per call.
  ///
  /// Set <code>FunctionVersion</code> to <code>ALL</code> to include all
  /// published versions of each function in addition to the unpublished
  /// version.
  /// <note>
  /// The <code>ListFunctions</code> operation returns a subset of the
  /// <a>FunctionConfiguration</a> fields. To get the additional fields (State,
  /// StateReasonCode, StateReason, LastUpdateStatus, LastUpdateStatusReason,
  /// LastUpdateStatusReasonCode, RuntimeVersionConfig) for a function or
  /// version, use <a>GetFunction</a>.
  /// </note>
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [functionVersion] :
  /// Set to <code>ALL</code> to include entries for all published versions of
  /// each function.
  ///
  /// Parameter [marker] :
  /// Specify the pagination token that's returned by a previous request to
  /// retrieve the next page of results.
  ///
  /// Parameter [masterRegion] :
  /// For Lambda@Edge functions, the Amazon Web Services Region of the master
  /// function. For example, <code>us-east-1</code> filters the list of
  /// functions to include only Lambda@Edge functions replicated from a master
  /// function in US East (N. Virginia). If specified, you must set
  /// <code>FunctionVersion</code> to <code>ALL</code>.
  ///
  /// Parameter [maxItems] :
  /// The maximum number of functions to return in the response. Note that
  /// <code>ListFunctions</code> returns a maximum of 50 items in each response,
  /// even if you set the number higher.
  Future<ListFunctionsResponse> listFunctions({
    FunctionVersion? functionVersion,
    String? marker,
    String? masterRegion,
    int? maxItems,
  }) async {
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      10000,
    );
    final $query = <String, List<String>>{
      if (functionVersion != null) 'FunctionVersion': [functionVersion.value],
      if (marker != null) 'Marker': [marker],
      if (masterRegion != null) 'MasterRegion': [masterRegion],
      if (maxItems != null) 'MaxItems': [maxItems.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2015-03-31/functions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListFunctionsResponse.fromJson(response);
  }

  /// Creates a Lambda function URL with the specified configuration parameters.
  /// A function URL is a dedicated HTTP(S) endpoint that you can use to invoke
  /// your function.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [authType] :
  /// The type of authentication that your function URL uses. Set to
  /// <code>AWS_IAM</code> if you want to restrict access to authenticated users
  /// only. Set to <code>NONE</code> if you want to bypass IAM authentication to
  /// create a public endpoint. For more information, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/urls-auth.html">Control
  /// access to Lambda function URLs</a>.
  ///
  /// Parameter [functionName] :
  /// The name or ARN of the Lambda function.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> – <code>my-function</code>.
  /// </li>
  /// <li>
  /// <b>Function ARN</b> –
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> – <code>123456789012:function:my-function</code>.
  /// </li>
  /// </ul>
  /// The length constraint applies only to the full ARN. If you specify only
  /// the function name, it is limited to 64 characters in length.
  ///
  /// Parameter [cors] :
  /// The <a
  /// href="https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS">cross-origin
  /// resource sharing (CORS)</a> settings for your function URL.
  ///
  /// Parameter [invokeMode] :
  /// Use one of the following options:
  ///
  /// <ul>
  /// <li>
  /// <code>BUFFERED</code> – This is the default option. Lambda invokes your
  /// function using the <code>Invoke</code> API operation. Invocation results
  /// are available when the payload is complete. The maximum payload size is 6
  /// MB.
  /// </li>
  /// <li>
  /// <code>RESPONSE_STREAM</code> – Your function streams payload results as
  /// they become available. Lambda invokes your function using the
  /// <code>InvokeWithResponseStream</code> API operation. The maximum response
  /// payload size is 200 MB.
  /// </li>
  /// </ul>
  ///
  /// Parameter [qualifier] :
  /// The alias name.
  Future<CreateFunctionUrlConfigResponse> createFunctionUrlConfig({
    required FunctionUrlAuthType authType,
    required String functionName,
    Cors? cors,
    InvokeMode? invokeMode,
    String? qualifier,
  }) async {
    final $query = <String, List<String>>{
      if (qualifier != null) 'Qualifier': [qualifier],
    };
    final $payload = <String, dynamic>{
      'AuthType': authType.value,
      if (cors != null) 'Cors': cors,
      if (invokeMode != null) 'InvokeMode': invokeMode.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/2021-10-31/functions/${Uri.encodeComponent(functionName)}/url',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return CreateFunctionUrlConfigResponse.fromJson(response);
  }

  /// Removes a concurrent execution limit from a function.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [functionName] :
  /// The name or ARN of the Lambda function.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> – <code>my-function</code>.
  /// </li>
  /// <li>
  /// <b>Function ARN</b> –
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> – <code>123456789012:function:my-function</code>.
  /// </li>
  /// </ul>
  /// The length constraint applies only to the full ARN. If you specify only
  /// the function name, it is limited to 64 characters in length.
  Future<void> deleteFunctionConcurrency({
    required String functionName,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2017-10-31/functions/${Uri.encodeComponent(functionName)}/concurrency',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a Lambda function URL. When you delete a function URL, you can't
  /// recover it. Creating a new function URL results in a different URL
  /// address.
  ///
  /// May throw [ResourceConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [functionName] :
  /// The name or ARN of the Lambda function.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> – <code>my-function</code>.
  /// </li>
  /// <li>
  /// <b>Function ARN</b> –
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> – <code>123456789012:function:my-function</code>.
  /// </li>
  /// </ul>
  /// The length constraint applies only to the full ARN. If you specify only
  /// the function name, it is limited to 64 characters in length.
  ///
  /// Parameter [qualifier] :
  /// The alias name.
  Future<void> deleteFunctionUrlConfig({
    required String functionName,
    String? qualifier,
  }) async {
    final $query = <String, List<String>>{
      if (qualifier != null) 'Qualifier': [qualifier],
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2021-10-31/functions/${Uri.encodeComponent(functionName)}/url',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns details about the reserved concurrency configuration for a
  /// function. To set a concurrency limit for a function, use
  /// <a>PutFunctionConcurrency</a>.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [functionName] :
  /// The name or ARN of the Lambda function.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> – <code>my-function</code>.
  /// </li>
  /// <li>
  /// <b>Function ARN</b> –
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> – <code>123456789012:function:my-function</code>.
  /// </li>
  /// </ul>
  /// The length constraint applies only to the full ARN. If you specify only
  /// the function name, it is limited to 64 characters in length.
  Future<GetFunctionConcurrencyResponse> getFunctionConcurrency({
    required String functionName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2019-09-30/functions/${Uri.encodeComponent(functionName)}/concurrency',
      exceptionFnMap: _exceptionFns,
    );
    return GetFunctionConcurrencyResponse.fromJson(response);
  }

  /// Returns details about a Lambda function URL.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [functionName] :
  /// The name or ARN of the Lambda function.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> – <code>my-function</code>.
  /// </li>
  /// <li>
  /// <b>Function ARN</b> –
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> – <code>123456789012:function:my-function</code>.
  /// </li>
  /// </ul>
  /// The length constraint applies only to the full ARN. If you specify only
  /// the function name, it is limited to 64 characters in length.
  ///
  /// Parameter [qualifier] :
  /// The alias name.
  Future<GetFunctionUrlConfigResponse> getFunctionUrlConfig({
    required String functionName,
    String? qualifier,
  }) async {
    final $query = <String, List<String>>{
      if (qualifier != null) 'Qualifier': [qualifier],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2021-10-31/functions/${Uri.encodeComponent(functionName)}/url',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetFunctionUrlConfigResponse.fromJson(response);
  }

  /// Returns a list of Lambda function URLs for the specified function.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [functionName] :
  /// The name or ARN of the Lambda function.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> – <code>my-function</code>.
  /// </li>
  /// <li>
  /// <b>Function ARN</b> –
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> – <code>123456789012:function:my-function</code>.
  /// </li>
  /// </ul>
  /// The length constraint applies only to the full ARN. If you specify only
  /// the function name, it is limited to 64 characters in length.
  ///
  /// Parameter [marker] :
  /// Specify the pagination token that's returned by a previous request to
  /// retrieve the next page of results.
  ///
  /// Parameter [maxItems] :
  /// The maximum number of function URLs to return in the response. Note that
  /// <code>ListFunctionUrlConfigs</code> returns a maximum of 50 items in each
  /// response, even if you set the number higher.
  Future<ListFunctionUrlConfigsResponse> listFunctionUrlConfigs({
    required String functionName,
    String? marker,
    int? maxItems,
  }) async {
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (marker != null) 'Marker': [marker],
      if (maxItems != null) 'MaxItems': [maxItems.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2021-10-31/functions/${Uri.encodeComponent(functionName)}/urls',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListFunctionUrlConfigsResponse.fromJson(response);
  }

  /// Retrieves a list of provisioned concurrency configurations for a function.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [functionName] :
  /// The name or ARN of the Lambda function.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> – <code>my-function</code>.
  /// </li>
  /// <li>
  /// <b>Function ARN</b> –
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> – <code>123456789012:function:my-function</code>.
  /// </li>
  /// </ul>
  /// The length constraint applies only to the full ARN. If you specify only
  /// the function name, it is limited to 64 characters in length.
  ///
  /// Parameter [marker] :
  /// Specify the pagination token that's returned by a previous request to
  /// retrieve the next page of results.
  ///
  /// Parameter [maxItems] :
  /// Specify a number to limit the number of configurations returned.
  Future<ListProvisionedConcurrencyConfigsResponse>
      listProvisionedConcurrencyConfigs({
    required String functionName,
    String? marker,
    int? maxItems,
  }) async {
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (marker != null) 'Marker': [marker],
      if (maxItems != null) 'MaxItems': [maxItems.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2019-09-30/functions/${Uri.encodeComponent(functionName)}/provisioned-concurrency?List=ALL',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListProvisionedConcurrencyConfigsResponse.fromJson(response);
  }

  /// Sets the maximum number of simultaneous executions for a function, and
  /// reserves capacity for that concurrency level.
  ///
  /// Concurrency settings apply to the function as a whole, including all
  /// published versions and the unpublished version. Reserving concurrency both
  /// ensures that your function has capacity to process the specified number of
  /// events simultaneously, and prevents it from scaling beyond that level. Use
  /// <a>GetFunction</a> to see the current setting for a function.
  ///
  /// Use <a>GetAccountSettings</a> to see your Regional concurrency limit. You
  /// can reserve concurrency for as many functions as you like, as long as you
  /// leave at least 100 simultaneous executions unreserved for functions that
  /// aren't configured with a per-function limit. For more information, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/invocation-scaling.html">Lambda
  /// function scaling</a>.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [functionName] :
  /// The name or ARN of the Lambda function.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> – <code>my-function</code>.
  /// </li>
  /// <li>
  /// <b>Function ARN</b> –
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> – <code>123456789012:function:my-function</code>.
  /// </li>
  /// </ul>
  /// The length constraint applies only to the full ARN. If you specify only
  /// the function name, it is limited to 64 characters in length.
  ///
  /// Parameter [reservedConcurrentExecutions] :
  /// The number of simultaneous executions to reserve for the function.
  Future<Concurrency> putFunctionConcurrency({
    required String functionName,
    required int reservedConcurrentExecutions,
  }) async {
    _s.validateNumRange(
      'reservedConcurrentExecutions',
      reservedConcurrentExecutions,
      0,
      1152921504606846976,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'ReservedConcurrentExecutions': reservedConcurrentExecutions,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/2017-10-31/functions/${Uri.encodeComponent(functionName)}/concurrency',
      exceptionFnMap: _exceptionFns,
    );
    return Concurrency.fromJson(response);
  }

  /// Updates a Lambda function's code. If code signing is enabled for the
  /// function, the code package must be signed by a trusted publisher. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-codesigning.html">Configuring
  /// code signing for Lambda</a>.
  ///
  /// If the function's package type is <code>Image</code>, then you must
  /// specify the code package in <code>ImageUri</code> as the URI of a <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-images.html">container
  /// image</a> in the Amazon ECR registry.
  ///
  /// If the function's package type is <code>Zip</code>, then you must specify
  /// the deployment package as a <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/gettingstarted-package.html#gettingstarted-package-zip">.zip
  /// file archive</a>. Enter the Amazon S3 bucket and key of the code .zip file
  /// location. You can also provide the function code inline using the
  /// <code>ZipFile</code> field.
  ///
  /// The code in the deployment package must be compatible with the target
  /// instruction set architecture of the function (<code>x86-64</code> or
  /// <code>arm64</code>).
  ///
  /// The function's code is locked when you publish a version. You can't modify
  /// the code of a published version, only the unpublished version.
  /// <note>
  /// For a function defined as a container image, Lambda resolves the image tag
  /// to an image digest. In Amazon ECR, if you update the image tag to a new
  /// image, Lambda does not automatically update the function.
  /// </note>
  ///
  /// May throw [CodeSigningConfigNotFoundException].
  /// May throw [CodeStorageExceededException].
  /// May throw [CodeVerificationFailedException].
  /// May throw [InvalidCodeSignatureException].
  /// May throw [InvalidParameterValueException].
  /// May throw [PreconditionFailedException].
  /// May throw [ResourceConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [functionName] :
  /// The name or ARN of the Lambda function.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> – <code>my-function</code>.
  /// </li>
  /// <li>
  /// <b>Function ARN</b> –
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> – <code>123456789012:function:my-function</code>.
  /// </li>
  /// </ul>
  /// The length constraint applies only to the full ARN. If you specify only
  /// the function name, it is limited to 64 characters in length.
  ///
  /// Parameter [architectures] :
  /// The instruction set architecture that the function supports. Enter a
  /// string array with one of the valid values (arm64 or x86_64). The default
  /// value is <code>x86_64</code>.
  ///
  /// Parameter [dryRun] :
  /// Set to true to validate the request parameters and access permissions
  /// without modifying the function code.
  ///
  /// Parameter [imageUri] :
  /// URI of a container image in the Amazon ECR registry. Do not use for a
  /// function defined with a .zip file archive.
  ///
  /// Parameter [publish] :
  /// Set to true to publish a new version of the function after updating the
  /// code. This has the same effect as calling <a>PublishVersion</a>
  /// separately.
  ///
  /// Parameter [publishTo] :
  /// Specifies where to publish the function version or configuration.
  ///
  /// Parameter [revisionId] :
  /// Update the function only if the revision ID matches the ID that's
  /// specified. Use this option to avoid modifying a function that has changed
  /// since you last read it.
  ///
  /// Parameter [s3Bucket] :
  /// An Amazon S3 bucket in the same Amazon Web Services Region as your
  /// function. The bucket can be in a different Amazon Web Services account.
  /// Use only with a function defined with a .zip file archive deployment
  /// package.
  ///
  /// Parameter [s3Key] :
  /// The Amazon S3 key of the deployment package. Use only with a function
  /// defined with a .zip file archive deployment package.
  ///
  /// Parameter [s3ObjectVersion] :
  /// For versioned objects, the version of the deployment package object to
  /// use.
  ///
  /// Parameter [sourceKMSKeyArn] :
  /// The ARN of the Key Management Service (KMS) customer managed key that's
  /// used to encrypt your function's .zip deployment package. If you don't
  /// provide a customer managed key, Lambda uses an Amazon Web Services managed
  /// key.
  ///
  /// Parameter [zipFile] :
  /// The base64-encoded contents of the deployment package. Amazon Web Services
  /// SDK and CLI clients handle the encoding for you. Use only with a function
  /// defined with a .zip file archive deployment package.
  Future<FunctionConfiguration> updateFunctionCode({
    required String functionName,
    List<Architecture>? architectures,
    bool? dryRun,
    String? imageUri,
    bool? publish,
    FunctionVersionLatestPublished? publishTo,
    String? revisionId,
    String? s3Bucket,
    String? s3Key,
    String? s3ObjectVersion,
    String? sourceKMSKeyArn,
    Uint8List? zipFile,
  }) async {
    final $payload = <String, dynamic>{
      if (architectures != null)
        'Architectures': architectures.map((e) => e.value).toList(),
      if (dryRun != null) 'DryRun': dryRun,
      if (imageUri != null) 'ImageUri': imageUri,
      if (publish != null) 'Publish': publish,
      if (publishTo != null) 'PublishTo': publishTo.value,
      if (revisionId != null) 'RevisionId': revisionId,
      if (s3Bucket != null) 'S3Bucket': s3Bucket,
      if (s3Key != null) 'S3Key': s3Key,
      if (s3ObjectVersion != null) 'S3ObjectVersion': s3ObjectVersion,
      if (sourceKMSKeyArn != null) 'SourceKMSKeyArn': sourceKMSKeyArn,
      if (zipFile != null) 'ZipFile': base64Encode(zipFile),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/2015-03-31/functions/${Uri.encodeComponent(functionName)}/code',
      exceptionFnMap: _exceptionFns,
    );
    return FunctionConfiguration.fromJson(response);
  }

  /// Modify the version-specific settings of a Lambda function.
  ///
  /// When you update a function, Lambda provisions an instance of the function
  /// and its supporting resources. If your function connects to a VPC, this
  /// process can take a minute. During this time, you can't modify the
  /// function, but you can still invoke it. The <code>LastUpdateStatus</code>,
  /// <code>LastUpdateStatusReason</code>, and
  /// <code>LastUpdateStatusReasonCode</code> fields in the response from
  /// <a>GetFunctionConfiguration</a> indicate when the update is complete and
  /// the function is processing events with the new configuration. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/functions-states.html">Lambda
  /// function states</a>.
  ///
  /// These settings can vary between versions of a function and are locked when
  /// you publish a version. You can't modify the configuration of a published
  /// version, only the unpublished version.
  ///
  /// To configure function concurrency, use <a>PutFunctionConcurrency</a>. To
  /// grant invoke permissions to an Amazon Web Services account or Amazon Web
  /// Services service, use <a>AddPermission</a>.
  ///
  /// May throw [CodeSigningConfigNotFoundException].
  /// May throw [CodeVerificationFailedException].
  /// May throw [InvalidCodeSignatureException].
  /// May throw [InvalidParameterValueException].
  /// May throw [PreconditionFailedException].
  /// May throw [ResourceConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [functionName] :
  /// The name or ARN of the Lambda function.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> – <code>my-function</code>.
  /// </li>
  /// <li>
  /// <b>Function ARN</b> –
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> – <code>123456789012:function:my-function</code>.
  /// </li>
  /// </ul>
  /// The length constraint applies only to the full ARN. If you specify only
  /// the function name, it is limited to 64 characters in length.
  ///
  /// Parameter [capacityProviderConfig] :
  /// Configuration for the capacity provider that manages compute resources for
  /// Lambda functions.
  ///
  /// Parameter [deadLetterConfig] :
  /// A dead-letter queue configuration that specifies the queue or topic where
  /// Lambda sends asynchronous events when they fail processing. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/invocation-async.html#invocation-dlq">Dead-letter
  /// queues</a>.
  ///
  /// Parameter [description] :
  /// A description of the function.
  ///
  /// Parameter [durableConfig] :
  /// Configuration settings for durable functions. Allows updating execution
  /// timeout and retention period for functions with durability enabled.
  ///
  /// Parameter [environment] :
  /// Environment variables that are accessible from function code during
  /// execution.
  ///
  /// Parameter [ephemeralStorage] :
  /// The size of the function's <code>/tmp</code> directory in MB. The default
  /// value is 512, but can be any whole number between 512 and 10,240 MB. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-function-common.html#configuration-ephemeral-storage">Configuring
  /// ephemeral storage (console)</a>.
  ///
  /// Parameter [fileSystemConfigs] :
  /// Connection settings for an Amazon EFS file system or an Amazon S3 Files
  /// file system.
  ///
  /// Parameter [handler] :
  /// The name of the method within your code that Lambda calls to run your
  /// function. Handler is required if the deployment package is a .zip file
  /// archive. The format includes the file name. It can also include namespaces
  /// and other qualifiers, depending on the runtime. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/foundation-progmodel.html">Lambda
  /// programming model</a>.
  ///
  /// Parameter [imageConfig] :
  /// <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/images-create.html#images-parms">Container
  /// image configuration values</a> that override the values in the container
  /// image Docker file.
  ///
  /// Parameter [kMSKeyArn] :
  /// The ARN of the Key Management Service (KMS) customer managed key that's
  /// used to encrypt the following resources:
  ///
  /// <ul>
  /// <li>
  /// The function's <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-envvars.html#configuration-envvars-encryption">environment
  /// variables</a>.
  /// </li>
  /// <li>
  /// The function's <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/snapstart-security.html">Lambda
  /// SnapStart</a> snapshots.
  /// </li>
  /// <li>
  /// When used with <code>SourceKMSKeyArn</code>, the unzipped version of the
  /// .zip deployment package that's used for function invocations. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/encrypt-zip-package.html#enable-zip-custom-encryption">
  /// Specifying a customer managed key for Lambda</a>.
  /// </li>
  /// <li>
  /// The optimized version of the container image that's used for function
  /// invocations. Note that this is not the same key that's used to protect
  /// your container image in the Amazon Elastic Container Registry (Amazon
  /// ECR). For more information, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/images-create.html#images-lifecycle">Function
  /// lifecycle</a>.
  /// </li>
  /// </ul>
  /// If you don't provide a customer managed key, Lambda uses an <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-owned-cmk">Amazon
  /// Web Services owned key</a> or an <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-managed-cmk">Amazon
  /// Web Services managed key</a>.
  ///
  /// Parameter [layers] :
  /// A list of <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">function
  /// layers</a> to add to the function's execution environment. Specify each
  /// layer by its ARN, including the version.
  ///
  /// Parameter [loggingConfig] :
  /// The function's Amazon CloudWatch Logs configuration settings.
  ///
  /// Parameter [memorySize] :
  /// The amount of <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-function-common.html#configuration-memory-console">memory
  /// available to the function</a> at runtime. Increasing the function memory
  /// also increases its CPU allocation. The default value is 128 MB. The value
  /// can be any multiple of 1 MB.
  ///
  /// Parameter [revisionId] :
  /// Update the function only if the revision ID matches the ID that's
  /// specified. Use this option to avoid modifying a function that has changed
  /// since you last read it.
  ///
  /// Parameter [role] :
  /// The Amazon Resource Name (ARN) of the function's execution role.
  ///
  /// Parameter [runtime] :
  /// The identifier of the function's <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html">
  /// runtime</a>. Runtime is required if the deployment package is a .zip file
  /// archive. Specifying a runtime results in an error if you're deploying a
  /// function using a container image.
  ///
  /// The following list includes deprecated runtimes. Lambda blocks creating
  /// new functions and updating existing functions shortly after each runtime
  /// is deprecated. For more information, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html#runtime-deprecation-levels">Runtime
  /// use after deprecation</a>.
  ///
  /// For a list of all currently supported runtimes, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html#runtimes-supported">Supported
  /// runtimes</a>.
  ///
  /// Parameter [snapStart] :
  /// The function's <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/snapstart.html">SnapStart</a>
  /// setting.
  ///
  /// Parameter [timeout] :
  /// The amount of time (in seconds) that Lambda allows a function to run
  /// before stopping it. The default is 3 seconds. The maximum allowed value is
  /// 900 seconds. For more information, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/runtimes-context.html">Lambda
  /// execution environment</a>.
  ///
  /// Parameter [tracingConfig] :
  /// Set <code>Mode</code> to <code>Active</code> to sample and trace a subset
  /// of incoming requests with <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/services-xray.html">X-Ray</a>.
  ///
  /// Parameter [vpcConfig] :
  /// For network connectivity to Amazon Web Services resources in a VPC,
  /// specify a list of security groups and subnets in the VPC. When you connect
  /// a function to a VPC, it can access resources and the internet only through
  /// that VPC. For more information, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-vpc.html">Configuring
  /// a Lambda function to access resources in a VPC</a>.
  Future<FunctionConfiguration> updateFunctionConfiguration({
    required String functionName,
    CapacityProviderConfig? capacityProviderConfig,
    DeadLetterConfig? deadLetterConfig,
    String? description,
    DurableConfig? durableConfig,
    Environment? environment,
    EphemeralStorage? ephemeralStorage,
    List<FileSystemConfig>? fileSystemConfigs,
    String? handler,
    ImageConfig? imageConfig,
    String? kMSKeyArn,
    List<String>? layers,
    LoggingConfig? loggingConfig,
    int? memorySize,
    String? revisionId,
    String? role,
    Runtime? runtime,
    SnapStart? snapStart,
    int? timeout,
    TracingConfig? tracingConfig,
    VpcConfig? vpcConfig,
  }) async {
    _s.validateNumRange(
      'memorySize',
      memorySize,
      128,
      32768,
    );
    _s.validateNumRange(
      'timeout',
      timeout,
      1,
      1152921504606846976,
    );
    final $payload = <String, dynamic>{
      if (capacityProviderConfig != null)
        'CapacityProviderConfig': capacityProviderConfig,
      if (deadLetterConfig != null) 'DeadLetterConfig': deadLetterConfig,
      if (description != null) 'Description': description,
      if (durableConfig != null) 'DurableConfig': durableConfig,
      if (environment != null) 'Environment': environment,
      if (ephemeralStorage != null) 'EphemeralStorage': ephemeralStorage,
      if (fileSystemConfigs != null) 'FileSystemConfigs': fileSystemConfigs,
      if (handler != null) 'Handler': handler,
      if (imageConfig != null) 'ImageConfig': imageConfig,
      if (kMSKeyArn != null) 'KMSKeyArn': kMSKeyArn,
      if (layers != null) 'Layers': layers,
      if (loggingConfig != null) 'LoggingConfig': loggingConfig,
      if (memorySize != null) 'MemorySize': memorySize,
      if (revisionId != null) 'RevisionId': revisionId,
      if (role != null) 'Role': role,
      if (runtime != null) 'Runtime': runtime.value,
      if (snapStart != null) 'SnapStart': snapStart,
      if (timeout != null) 'Timeout': timeout,
      if (tracingConfig != null) 'TracingConfig': tracingConfig,
      if (vpcConfig != null) 'VpcConfig': vpcConfig,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/2015-03-31/functions/${Uri.encodeComponent(functionName)}/configuration',
      exceptionFnMap: _exceptionFns,
    );
    return FunctionConfiguration.fromJson(response);
  }

  /// Updates the configuration for a Lambda function URL.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [functionName] :
  /// The name or ARN of the Lambda function.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> – <code>my-function</code>.
  /// </li>
  /// <li>
  /// <b>Function ARN</b> –
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> – <code>123456789012:function:my-function</code>.
  /// </li>
  /// </ul>
  /// The length constraint applies only to the full ARN. If you specify only
  /// the function name, it is limited to 64 characters in length.
  ///
  /// Parameter [authType] :
  /// The type of authentication that your function URL uses. Set to
  /// <code>AWS_IAM</code> if you want to restrict access to authenticated users
  /// only. Set to <code>NONE</code> if you want to bypass IAM authentication to
  /// create a public endpoint. For more information, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/urls-auth.html">Control
  /// access to Lambda function URLs</a>.
  ///
  /// Parameter [cors] :
  /// The <a
  /// href="https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS">cross-origin
  /// resource sharing (CORS)</a> settings for your function URL.
  ///
  /// Parameter [invokeMode] :
  /// Use one of the following options:
  ///
  /// <ul>
  /// <li>
  /// <code>BUFFERED</code> – This is the default option. Lambda invokes your
  /// function using the <code>Invoke</code> API operation. Invocation results
  /// are available when the payload is complete. The maximum payload size is 6
  /// MB.
  /// </li>
  /// <li>
  /// <code>RESPONSE_STREAM</code> – Your function streams payload results as
  /// they become available. Lambda invokes your function using the
  /// <code>InvokeWithResponseStream</code> API operation. The maximum response
  /// payload size is 200 MB.
  /// </li>
  /// </ul>
  ///
  /// Parameter [qualifier] :
  /// The alias name.
  Future<UpdateFunctionUrlConfigResponse> updateFunctionUrlConfig({
    required String functionName,
    FunctionUrlAuthType? authType,
    Cors? cors,
    InvokeMode? invokeMode,
    String? qualifier,
  }) async {
    final $query = <String, List<String>>{
      if (qualifier != null) 'Qualifier': [qualifier],
    };
    final $payload = <String, dynamic>{
      if (authType != null) 'AuthType': authType.value,
      if (cors != null) 'Cors': cors,
      if (invokeMode != null) 'InvokeMode': invokeMode.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/2021-10-31/functions/${Uri.encodeComponent(functionName)}/url',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return UpdateFunctionUrlConfigResponse.fromJson(response);
  }

  /// Removes the code signing configuration from the function.
  ///
  /// May throw [CodeSigningConfigNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [functionName] :
  /// The name or ARN of the Lambda function.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> - <code>MyFunction</code>.
  /// </li>
  /// <li>
  /// <b>Function ARN</b> -
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.
  /// </li>
  /// </ul>
  /// The length constraint applies only to the full ARN. If you specify only
  /// the function name, it is limited to 64 characters in length.
  Future<void> deleteFunctionCodeSigningConfig({
    required String functionName,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2020-06-30/functions/${Uri.encodeComponent(functionName)}/code-signing-config',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns information about the function or function version, with a link to
  /// download the deployment package that's valid for 10 minutes. If you
  /// specify a function version, only details that are specific to that version
  /// are returned.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [functionName] :
  /// The name or ARN of the Lambda function, version, or alias.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> – <code>my-function</code> (name-only),
  /// <code>my-function:v1</code> (with alias).
  /// </li>
  /// <li>
  /// <b>Function ARN</b> –
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> – <code>123456789012:function:my-function</code>.
  /// </li>
  /// </ul>
  /// You can append a version number or alias to any of the formats. The length
  /// constraint applies only to the full ARN. If you specify only the function
  /// name, it is limited to 64 characters in length.
  ///
  /// Parameter [qualifier] :
  /// Specify a version or alias to get details about a published version of the
  /// function.
  Future<GetFunctionResponse> getFunction({
    required String functionName,
    String? qualifier,
  }) async {
    final $query = <String, List<String>>{
      if (qualifier != null) 'Qualifier': [qualifier],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2015-03-31/functions/${Uri.encodeComponent(functionName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetFunctionResponse.fromJson(response);
  }

  /// Returns the code signing configuration for the specified function.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [functionName] :
  /// The name or ARN of the Lambda function.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> - <code>MyFunction</code>.
  /// </li>
  /// <li>
  /// <b>Function ARN</b> -
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.
  /// </li>
  /// </ul>
  /// The length constraint applies only to the full ARN. If you specify only
  /// the function name, it is limited to 64 characters in length.
  Future<GetFunctionCodeSigningConfigResponse> getFunctionCodeSigningConfig({
    required String functionName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2020-06-30/functions/${Uri.encodeComponent(functionName)}/code-signing-config',
      exceptionFnMap: _exceptionFns,
    );
    return GetFunctionCodeSigningConfigResponse.fromJson(response);
  }

  /// Returns the version-specific settings of a Lambda function or version. The
  /// output includes only options that can vary between versions of a function.
  /// To modify these settings, use <a>UpdateFunctionConfiguration</a>.
  ///
  /// To get all of a function's details, including function-level settings, use
  /// <a>GetFunction</a>.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [functionName] :
  /// The name or ARN of the Lambda function, version, or alias.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> – <code>my-function</code> (name-only),
  /// <code>my-function:v1</code> (with alias).
  /// </li>
  /// <li>
  /// <b>Function ARN</b> –
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> – <code>123456789012:function:my-function</code>.
  /// </li>
  /// </ul>
  /// You can append a version number or alias to any of the formats. The length
  /// constraint applies only to the full ARN. If you specify only the function
  /// name, it is limited to 64 characters in length.
  ///
  /// Parameter [qualifier] :
  /// Specify a version or alias to get details about a published version of the
  /// function.
  Future<FunctionConfiguration> getFunctionConfiguration({
    required String functionName,
    String? qualifier,
  }) async {
    final $query = <String, List<String>>{
      if (qualifier != null) 'Qualifier': [qualifier],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2015-03-31/functions/${Uri.encodeComponent(functionName)}/configuration',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return FunctionConfiguration.fromJson(response);
  }

  /// Returns your function's <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/invocation-recursion.html">recursive
  /// loop detection</a> configuration.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [functionName] :
  /// The name of the function.
  Future<GetFunctionRecursionConfigResponse> getFunctionRecursionConfig({
    required String functionName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2024-08-31/functions/${Uri.encodeComponent(functionName)}/recursion-config',
      exceptionFnMap: _exceptionFns,
    );
    return GetFunctionRecursionConfigResponse.fromJson(response);
  }

  /// Retrieves the scaling configuration for a Lambda Managed Instances
  /// function.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [functionName] :
  /// The name or ARN of the Lambda function.
  ///
  /// Parameter [qualifier] :
  /// Specify a version or alias to get the scaling configuration for a
  /// published version of the function.
  Future<GetFunctionScalingConfigResponse> getFunctionScalingConfig({
    required String functionName,
    required String qualifier,
  }) async {
    final $query = <String, List<String>>{
      'Qualifier': [qualifier],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2025-11-30/functions/${Uri.encodeComponent(functionName)}/function-scaling-config',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetFunctionScalingConfigResponse.fromJson(response);
  }

  /// Returns the <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/access-control-resource-based.html">resource-based
  /// IAM policy</a> for a function, version, or alias.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [functionName] :
  /// The name or ARN of the Lambda function, version, or alias.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> – <code>my-function</code> (name-only),
  /// <code>my-function:v1</code> (with alias).
  /// </li>
  /// <li>
  /// <b>Function ARN</b> –
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> – <code>123456789012:function:my-function</code>.
  /// </li>
  /// </ul>
  /// You can append a version number or alias to any of the formats. The length
  /// constraint applies only to the full ARN. If you specify only the function
  /// name, it is limited to 64 characters in length.
  ///
  /// Parameter [qualifier] :
  /// Specify a version or alias to get the policy for that resource.
  Future<GetPolicyResponse> getPolicy({
    required String functionName,
    String? qualifier,
  }) async {
    final $query = <String, List<String>>{
      if (qualifier != null) 'Qualifier': [qualifier],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2015-03-31/functions/${Uri.encodeComponent(functionName)}/policy',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetPolicyResponse.fromJson(response);
  }

  /// Retrieves the runtime management configuration for a function's version.
  /// If the runtime update mode is <b>Manual</b>, this includes the ARN of the
  /// runtime version and the runtime update mode. If the runtime update mode is
  /// <b>Auto</b> or <b>Function update</b>, this includes the runtime update
  /// mode and <code>null</code> is returned for the ARN. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/runtimes-update.html">Runtime
  /// updates</a>.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [functionName] :
  /// The name or ARN of the Lambda function.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> – <code>my-function</code>.
  /// </li>
  /// <li>
  /// <b>Function ARN</b> –
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> – <code>123456789012:function:my-function</code>.
  /// </li>
  /// </ul>
  /// The length constraint applies only to the full ARN. If you specify only
  /// the function name, it is limited to 64 characters in length.
  ///
  /// Parameter [qualifier] :
  /// Specify a version of the function. This can be <code>$LATEST</code> or a
  /// published version number. If no value is specified, the configuration for
  /// the <code>$LATEST</code> version is returned.
  Future<GetRuntimeManagementConfigResponse> getRuntimeManagementConfig({
    required String functionName,
    String? qualifier,
  }) async {
    final $query = <String, List<String>>{
      if (qualifier != null) 'Qualifier': [qualifier],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2021-07-20/functions/${Uri.encodeComponent(functionName)}/runtime-management-config',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetRuntimeManagementConfigResponse.fromJson(response);
  }

  /// Invokes a Lambda function. You can invoke a function synchronously (and
  /// wait for the response), or asynchronously. By default, Lambda invokes your
  /// function synchronously (i.e. the<code>InvocationType</code> is
  /// <code>RequestResponse</code>). To invoke a function asynchronously, set
  /// <code>InvocationType</code> to <code>Event</code>. Lambda passes the
  /// <code>ClientContext</code> object to your function for synchronous
  /// invocations only.
  ///
  /// For synchronous invocations, the maximum payload size is 6 MB. For
  /// asynchronous invocations, the maximum payload size is 1 MB.
  ///
  /// For <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/invocation-sync.html">synchronous
  /// invocation</a>, details about the function response, including errors, are
  /// included in the response body and headers. For either invocation type, you
  /// can find more information in the <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/monitoring-functions.html">execution
  /// log</a> and <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-x-ray.html">trace</a>.
  ///
  /// When an error occurs, your function may be invoked multiple times. Retry
  /// behavior varies by error type, client, event source, and invocation type.
  /// For example, if you invoke a function asynchronously and it returns an
  /// error, Lambda executes the function up to two more times. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/invocation-retries.html">Error
  /// handling and automatic retries in Lambda</a>.
  ///
  /// For <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/invocation-async.html">asynchronous
  /// invocation</a>, Lambda adds events to a queue before sending them to your
  /// function. If your function does not have enough capacity to keep up with
  /// the queue, events may be lost. Occasionally, your function may receive the
  /// same event multiple times, even if no error occurs. To retain events that
  /// were not processed, configure your function with a <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/invocation-async.html#invocation-dlq">dead-letter
  /// queue</a>.
  ///
  /// The status code in the API response doesn't reflect function errors. Error
  /// codes are reserved for errors that prevent your function from executing,
  /// such as permissions errors, <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/gettingstarted-limits.html">quota</a>
  /// errors, or issues with your function's code and configuration. For
  /// example, Lambda returns <code>TooManyRequestsException</code> if running
  /// the function would cause you to exceed a concurrency limit at either the
  /// account level (<code>ConcurrentInvocationLimitExceeded</code>) or function
  /// level (<code>ReservedFunctionConcurrentInvocationLimitExceeded</code>).
  ///
  /// For functions with a long timeout, your client might disconnect during
  /// synchronous invocation while it waits for a response. Configure your HTTP
  /// client, SDK, firewall, proxy, or operating system to allow for long
  /// connections with timeout or keep-alive settings.
  ///
  /// This operation requires permission for the <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/list_awslambda.html">lambda:InvokeFunction</a>
  /// action. For details on how to set up permissions for cross-account
  /// invocations, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/access-control-resource-based.html#permissions-resource-xaccountinvoke">Granting
  /// function access to other accounts</a>.
  ///
  /// May throw [DurableExecutionAlreadyStartedException].
  /// May throw [EC2AccessDeniedException].
  /// May throw [EC2ThrottledException].
  /// May throw [EC2UnexpectedException].
  /// May throw [EFSIOException].
  /// May throw [EFSMountConnectivityException].
  /// May throw [EFSMountFailureException].
  /// May throw [EFSMountTimeoutException].
  /// May throw [ENILimitReachedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidRequestContentException].
  /// May throw [InvalidRuntimeException].
  /// May throw [InvalidSecurityGroupIDException].
  /// May throw [InvalidSubnetIDException].
  /// May throw [InvalidZipFileException].
  /// May throw [KMSAccessDeniedException].
  /// May throw [KMSDisabledException].
  /// May throw [KMSInvalidStateException].
  /// May throw [KMSNotFoundException].
  /// May throw [NoPublishedVersionException].
  /// May throw [RecursiveInvocationException].
  /// May throw [RequestTooLargeException].
  /// May throw [ResourceConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceNotReadyException].
  /// May throw [S3FilesMountConnectivityException].
  /// May throw [S3FilesMountFailureException].
  /// May throw [S3FilesMountTimeoutException].
  /// May throw [SerializedRequestEntityTooLargeException].
  /// May throw [ServiceException].
  /// May throw [SnapStartException].
  /// May throw [SnapStartNotReadyException].
  /// May throw [SnapStartTimeoutException].
  /// May throw [SubnetIPAddressLimitReachedException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnsupportedMediaTypeException].
  ///
  /// Parameter [functionName] :
  /// The name or ARN of the Lambda function, version, or alias.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> – <code>my-function</code> (name-only),
  /// <code>my-function:v1</code> (with alias).
  /// </li>
  /// <li>
  /// <b>Function ARN</b> –
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> – <code>123456789012:function:my-function</code>.
  /// </li>
  /// </ul>
  /// You can append a version number or alias to any of the formats. The length
  /// constraint applies only to the full ARN. If you specify only the function
  /// name, it is limited to 64 characters in length.
  ///
  /// Parameter [clientContext] :
  /// Up to 3,583 bytes of base64-encoded data about the invoking client to pass
  /// to the function in the context object. Lambda passes the
  /// <code>ClientContext</code> object to your function for synchronous
  /// invocations only.
  ///
  /// Parameter [durableExecutionName] :
  /// Optional unique name for the durable execution. When you start your
  /// special function, you can give it a unique name to identify this specific
  /// execution. It's like giving a nickname to a task.
  ///
  /// Parameter [invocationType] :
  /// Choose from the following options.
  ///
  /// <ul>
  /// <li>
  /// <code>RequestResponse</code> (default) – Invoke the function
  /// synchronously. Keep the connection open until the function returns a
  /// response or times out. The API response includes the function response and
  /// additional data.
  /// </li>
  /// <li>
  /// <code>Event</code> – Invoke the function asynchronously. Send events that
  /// fail multiple times to the function's dead-letter queue (if one is
  /// configured). The API response only includes a status code.
  /// </li>
  /// <li>
  /// <code>DryRun</code> – Validate parameter values and verify that the user
  /// or role has permission to invoke the function.
  /// </li>
  /// </ul>
  ///
  /// Parameter [logType] :
  /// Set to <code>Tail</code> to include the execution log in the response.
  /// Applies to synchronously invoked functions only.
  ///
  /// Parameter [payload] :
  /// The JSON that you want to provide to your Lambda function as input. The
  /// maximum payload size is 6 MB for synchronous invocations and 1 MB for
  /// asynchronous invocations.
  ///
  /// You can enter the JSON directly. For example, <code>--payload '{ "key":
  /// "value" }'</code>. You can also specify a file path. For example,
  /// <code>--payload file://payload.json</code>.
  ///
  /// Parameter [qualifier] :
  /// Specify a version or alias to invoke a published version of the function.
  ///
  /// Parameter [tenantId] :
  /// The identifier of the tenant in a multi-tenant Lambda function.
  Future<InvocationResponse> invoke({
    required String functionName,
    String? clientContext,
    String? durableExecutionName,
    InvocationType? invocationType,
    LogType? logType,
    Uint8List? payload,
    String? qualifier,
    String? tenantId,
  }) async {
    final headers = <String, String>{
      if (clientContext != null)
        'X-Amz-Client-Context': clientContext.toString(),
      if (durableExecutionName != null)
        'X-Amz-Durable-Execution-Name': durableExecutionName.toString(),
      if (invocationType != null) 'X-Amz-Invocation-Type': invocationType.value,
      if (logType != null) 'X-Amz-Log-Type': logType.value,
      if (tenantId != null) 'X-Amz-Tenant-Id': tenantId.toString(),
    };
    final $query = <String, List<String>>{
      if (qualifier != null) 'Qualifier': [qualifier],
    };
    final response = await _protocol.sendRaw(
      payload: payload,
      method: 'POST',
      requestUri:
          '/2015-03-31/functions/${Uri.encodeComponent(functionName)}/invocations',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return InvocationResponse(
      payload: await response.stream.toBytes(),
      durableExecutionArn: _s.extractHeaderStringValue(
          response.headers, 'X-Amz-Durable-Execution-Arn'),
      executedVersion: _s.extractHeaderStringValue(
          response.headers, 'X-Amz-Executed-Version'),
      functionError:
          _s.extractHeaderStringValue(response.headers, 'X-Amz-Function-Error'),
      logResult:
          _s.extractHeaderStringValue(response.headers, 'X-Amz-Log-Result'),
      statusCode: response.statusCode,
    );
  }

  /// <note>
  /// For asynchronous function invocation, use <a>Invoke</a>.
  /// </note>
  /// Invokes a function asynchronously.
  /// <note>
  /// The payload limit is 256KB. For larger payloads, for up to 1MB, use
  /// <a>Invoke</a>.
  /// </note> <note>
  /// If you do use the InvokeAsync action, note that it doesn't support the use
  /// of X-Ray active tracing. Trace ID is not propagated to the function, even
  /// if X-Ray active tracing is turned on.
  /// </note>
  ///
  /// May throw [InvalidRequestContentException].
  /// May throw [InvalidRuntimeException].
  /// May throw [ResourceConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  ///
  /// Parameter [functionName] :
  /// The name or ARN of the Lambda function.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> – <code>my-function</code>.
  /// </li>
  /// <li>
  /// <b>Function ARN</b> –
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> – <code>123456789012:function:my-function</code>.
  /// </li>
  /// </ul>
  /// The length constraint applies only to the full ARN. If you specify only
  /// the function name, it is limited to 64 characters in length.
  ///
  /// Parameter [invokeArgs] :
  /// The JSON that you want to provide to your Lambda function as input.
  Future<InvokeAsyncResponse> invokeAsync({
    required String functionName,
    required Uint8List invokeArgs,
  }) async {
    final response = await _protocol.send(
      payload: invokeArgs,
      method: 'POST',
      requestUri:
          '/2014-11-13/functions/${Uri.encodeComponent(functionName)}/invoke-async',
      exceptionFnMap: _exceptionFns,
    );
    return InvokeAsyncResponse.fromJson(response);
  }

  /// Configure your Lambda functions to stream response payloads back to
  /// clients. For more information, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-response-streaming.html">Configuring
  /// a Lambda function to stream responses</a>.
  ///
  /// This operation requires permission for the <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/list_awslambda.html">lambda:InvokeFunction</a>
  /// action. For details on how to set up permissions for cross-account
  /// invocations, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/access-control-resource-based.html#permissions-resource-xaccountinvoke">Granting
  /// function access to other accounts</a>.
  ///
  /// May throw [EC2AccessDeniedException].
  /// May throw [EC2ThrottledException].
  /// May throw [EC2UnexpectedException].
  /// May throw [EFSIOException].
  /// May throw [EFSMountConnectivityException].
  /// May throw [EFSMountFailureException].
  /// May throw [EFSMountTimeoutException].
  /// May throw [ENILimitReachedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidRequestContentException].
  /// May throw [InvalidRuntimeException].
  /// May throw [InvalidSecurityGroupIDException].
  /// May throw [InvalidSubnetIDException].
  /// May throw [InvalidZipFileException].
  /// May throw [KMSAccessDeniedException].
  /// May throw [KMSDisabledException].
  /// May throw [KMSInvalidStateException].
  /// May throw [KMSNotFoundException].
  /// May throw [NoPublishedVersionException].
  /// May throw [RecursiveInvocationException].
  /// May throw [RequestTooLargeException].
  /// May throw [ResourceConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceNotReadyException].
  /// May throw [S3FilesMountConnectivityException].
  /// May throw [S3FilesMountFailureException].
  /// May throw [S3FilesMountTimeoutException].
  /// May throw [SerializedRequestEntityTooLargeException].
  /// May throw [ServiceException].
  /// May throw [SnapStartException].
  /// May throw [SnapStartNotReadyException].
  /// May throw [SnapStartTimeoutException].
  /// May throw [SubnetIPAddressLimitReachedException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnsupportedMediaTypeException].
  ///
  /// Parameter [functionName] :
  /// The name or ARN of the Lambda function.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> – <code>my-function</code>.
  /// </li>
  /// <li>
  /// <b>Function ARN</b> –
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> – <code>123456789012:function:my-function</code>.
  /// </li>
  /// </ul>
  /// The length constraint applies only to the full ARN. If you specify only
  /// the function name, it is limited to 64 characters in length.
  ///
  /// Parameter [clientContext] :
  /// Up to 3,583 bytes of base64-encoded data about the invoking client to pass
  /// to the function in the context object.
  ///
  /// Parameter [invocationType] :
  /// Use one of the following options:
  ///
  /// <ul>
  /// <li>
  /// <code>RequestResponse</code> (default) – Invoke the function
  /// synchronously. Keep the connection open until the function returns a
  /// response or times out. The API operation response includes the function
  /// response and additional data.
  /// </li>
  /// <li>
  /// <code>DryRun</code> – Validate parameter values and verify that the IAM
  /// user or role has permission to invoke the function.
  /// </li>
  /// </ul>
  ///
  /// Parameter [logType] :
  /// Set to <code>Tail</code> to include the execution log in the response.
  /// Applies to synchronously invoked functions only.
  ///
  /// Parameter [payload] :
  /// The JSON that you want to provide to your Lambda function as input.
  ///
  /// You can enter the JSON directly. For example, <code>--payload '{ "key":
  /// "value" }'</code>. You can also specify a file path. For example,
  /// <code>--payload file://payload.json</code>.
  ///
  /// Parameter [qualifier] :
  /// The alias name.
  ///
  /// Parameter [tenantId] :
  /// The identifier of the tenant in a multi-tenant Lambda function.
  Future<InvokeWithResponseStreamResponse> invokeWithResponseStream({
    required String functionName,
    String? clientContext,
    ResponseStreamingInvocationType? invocationType,
    LogType? logType,
    Uint8List? payload,
    String? qualifier,
    String? tenantId,
  }) async {
    final headers = <String, String>{
      if (clientContext != null)
        'X-Amz-Client-Context': clientContext.toString(),
      if (invocationType != null) 'X-Amz-Invocation-Type': invocationType.value,
      if (logType != null) 'X-Amz-Log-Type': logType.value,
      if (tenantId != null) 'X-Amz-Tenant-Id': tenantId.toString(),
    };
    final $query = <String, List<String>>{
      if (qualifier != null) 'Qualifier': [qualifier],
    };
    final response = await _protocol.sendRaw(
      payload: payload,
      method: 'POST',
      requestUri:
          '/2021-11-15/functions/${Uri.encodeComponent(functionName)}/response-streaming-invocations',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return InvokeWithResponseStreamResponse(
      eventStream: InvokeWithResponseStreamResponseEvent.fromJson($json),
      executedVersion: _s.extractHeaderStringValue(
          response.headers, 'X-Amz-Executed-Version'),
      responseStreamContentType:
          _s.extractHeaderStringValue(response.headers, 'Content-Type'),
      statusCode: response.statusCode,
    );
  }

  /// Update the code signing configuration for the function. Changes to the
  /// code signing configuration take effect the next time a user tries to
  /// deploy a code package to the function.
  ///
  /// May throw [CodeSigningConfigNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [codeSigningConfigArn] :
  /// The The Amazon Resource Name (ARN) of the code signing configuration.
  ///
  /// Parameter [functionName] :
  /// The name or ARN of the Lambda function.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> - <code>MyFunction</code>.
  /// </li>
  /// <li>
  /// <b>Function ARN</b> -
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.
  /// </li>
  /// </ul>
  /// The length constraint applies only to the full ARN. If you specify only
  /// the function name, it is limited to 64 characters in length.
  Future<PutFunctionCodeSigningConfigResponse> putFunctionCodeSigningConfig({
    required String codeSigningConfigArn,
    required String functionName,
  }) async {
    final $payload = <String, dynamic>{
      'CodeSigningConfigArn': codeSigningConfigArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/2020-06-30/functions/${Uri.encodeComponent(functionName)}/code-signing-config',
      exceptionFnMap: _exceptionFns,
    );
    return PutFunctionCodeSigningConfigResponse.fromJson(response);
  }

  /// Sets your function's <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/invocation-recursion.html">recursive
  /// loop detection</a> configuration.
  ///
  /// When you configure a Lambda function to output to the same service or
  /// resource that invokes the function, it's possible to create an infinite
  /// recursive loop. For example, a Lambda function might write a message to an
  /// Amazon Simple Queue Service (Amazon SQS) queue, which then invokes the
  /// same function. This invocation causes the function to write another
  /// message to the queue, which in turn invokes the function again.
  ///
  /// Lambda can detect certain types of recursive loops shortly after they
  /// occur. When Lambda detects a recursive loop and your function's recursive
  /// loop detection configuration is set to <code>Terminate</code>, it stops
  /// your function being invoked and notifies you.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [functionName] :
  /// The name or ARN of the Lambda function.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> – <code>my-function</code>.
  /// </li>
  /// <li>
  /// <b>Function ARN</b> –
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> – <code>123456789012:function:my-function</code>.
  /// </li>
  /// </ul>
  /// The length constraint applies only to the full ARN. If you specify only
  /// the function name, it is limited to 64 characters in length.
  ///
  /// Parameter [recursiveLoop] :
  /// If you set your function's recursive loop detection configuration to
  /// <code>Allow</code>, Lambda doesn't take any action when it detects your
  /// function being invoked as part of a recursive loop. We recommend that you
  /// only use this setting if your design intentionally uses a Lambda function
  /// to write data back to the same Amazon Web Services resource that invokes
  /// it.
  ///
  /// If you set your function's recursive loop detection configuration to
  /// <code>Terminate</code>, Lambda stops your function being invoked and
  /// notifies you when it detects your function being invoked as part of a
  /// recursive loop.
  ///
  /// By default, Lambda sets your function's configuration to
  /// <code>Terminate</code>.
  /// <important>
  /// If your design intentionally uses a Lambda function to write data back to
  /// the same Amazon Web Services resource that invokes the function, then use
  /// caution and implement suitable guard rails to prevent unexpected charges
  /// being billed to your Amazon Web Services account. To learn more about best
  /// practices for using recursive invocation patterns, see <a
  /// href="https://serverlessland.com/content/service/lambda/guides/aws-lambda-operator-guide/recursive-runaway">Recursive
  /// patterns that cause run-away Lambda functions</a> in Serverless Land.
  /// </important>
  Future<PutFunctionRecursionConfigResponse> putFunctionRecursionConfig({
    required String functionName,
    required RecursiveLoop recursiveLoop,
  }) async {
    final $payload = <String, dynamic>{
      'RecursiveLoop': recursiveLoop.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/2024-08-31/functions/${Uri.encodeComponent(functionName)}/recursion-config',
      exceptionFnMap: _exceptionFns,
    );
    return PutFunctionRecursionConfigResponse.fromJson(response);
  }

  /// Sets the scaling configuration for a Lambda Managed Instances function.
  /// The scaling configuration defines the minimum and maximum number of
  /// execution environments that can be provisioned for the function, allowing
  /// you to control scaling behavior and resource allocation.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [functionName] :
  /// The name or ARN of the Lambda function.
  ///
  /// Parameter [qualifier] :
  /// Specify a version or alias to set the scaling configuration for a
  /// published version of the function.
  ///
  /// Parameter [functionScalingConfig] :
  /// The scaling configuration to apply to the function, including minimum and
  /// maximum execution environment limits.
  Future<PutFunctionScalingConfigResponse> putFunctionScalingConfig({
    required String functionName,
    required String qualifier,
    FunctionScalingConfig? functionScalingConfig,
  }) async {
    final $query = <String, List<String>>{
      'Qualifier': [qualifier],
    };
    final $payload = <String, dynamic>{
      if (functionScalingConfig != null)
        'FunctionScalingConfig': functionScalingConfig,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/2025-11-30/functions/${Uri.encodeComponent(functionName)}/function-scaling-config',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return PutFunctionScalingConfigResponse.fromJson(response);
  }

  /// Sets the runtime management configuration for a function's version. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/runtimes-update.html">Runtime
  /// updates</a>.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [functionName] :
  /// The name or ARN of the Lambda function.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> – <code>my-function</code>.
  /// </li>
  /// <li>
  /// <b>Function ARN</b> –
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> – <code>123456789012:function:my-function</code>.
  /// </li>
  /// </ul>
  /// The length constraint applies only to the full ARN. If you specify only
  /// the function name, it is limited to 64 characters in length.
  ///
  /// Parameter [updateRuntimeOn] :
  /// Specify the runtime update mode.
  ///
  /// <ul>
  /// <li>
  /// <b>Auto (default)</b> - Automatically update to the most recent and secure
  /// runtime version using a <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/runtimes-update.html#runtime-management-two-phase">Two-phase
  /// runtime version rollout</a>. This is the best choice for most customers to
  /// ensure they always benefit from runtime updates.
  /// </li>
  /// <li>
  /// <b>Function update</b> - Lambda updates the runtime of your function to
  /// the most recent and secure runtime version when you update your function.
  /// This approach synchronizes runtime updates with function deployments,
  /// giving you control over when runtime updates are applied and allowing you
  /// to detect and mitigate rare runtime update incompatibilities early. When
  /// using this setting, you need to regularly update your functions to keep
  /// their runtime up-to-date.
  /// </li>
  /// <li>
  /// <b>Manual</b> - You specify a runtime version in your function
  /// configuration. The function will use this runtime version indefinitely. In
  /// the rare case where a new runtime version is incompatible with an existing
  /// function, this allows you to roll back your function to an earlier runtime
  /// version. For more information, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/runtimes-update.html#runtime-management-rollback">Roll
  /// back a runtime version</a>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [qualifier] :
  /// Specify a version of the function. This can be <code>$LATEST</code> or a
  /// published version number. If no value is specified, the configuration for
  /// the <code>$LATEST</code> version is returned.
  ///
  /// Parameter [runtimeVersionArn] :
  /// The ARN of the runtime version you want the function to use.
  /// <note>
  /// This is only required if you're using the <b>Manual</b> runtime update
  /// mode.
  /// </note>
  Future<PutRuntimeManagementConfigResponse> putRuntimeManagementConfig({
    required String functionName,
    required UpdateRuntimeOn updateRuntimeOn,
    String? qualifier,
    String? runtimeVersionArn,
  }) async {
    final $query = <String, List<String>>{
      if (qualifier != null) 'Qualifier': [qualifier],
    };
    final $payload = <String, dynamic>{
      'UpdateRuntimeOn': updateRuntimeOn.value,
      if (runtimeVersionArn != null) 'RuntimeVersionArn': runtimeVersionArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/2021-07-20/functions/${Uri.encodeComponent(functionName)}/runtime-management-config',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return PutRuntimeManagementConfigResponse.fromJson(response);
  }

  /// Creates an <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-aliases.html">alias</a>
  /// for a Lambda function version. Use aliases to provide clients with a
  /// function identifier that you can update to invoke a different version.
  ///
  /// You can also map an alias to split invocation requests between two
  /// versions. Use the <code>RoutingConfig</code> parameter to specify a second
  /// version and the percentage of invocation requests that it receives.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [functionName] :
  /// The name or ARN of the Lambda function.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> - <code>MyFunction</code>.
  /// </li>
  /// <li>
  /// <b>Function ARN</b> -
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.
  /// </li>
  /// </ul>
  /// The length constraint applies only to the full ARN. If you specify only
  /// the function name, it is limited to 64 characters in length.
  ///
  /// Parameter [functionVersion] :
  /// The function version that the alias invokes.
  ///
  /// Parameter [name] :
  /// The name of the alias.
  ///
  /// Parameter [description] :
  /// A description of the alias.
  ///
  /// Parameter [routingConfig] :
  /// The <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-aliases.html#configuring-alias-routing">routing
  /// configuration</a> of the alias.
  Future<AliasConfiguration> createAlias({
    required String functionName,
    required String functionVersion,
    required String name,
    String? description,
    AliasRoutingConfiguration? routingConfig,
  }) async {
    final $payload = <String, dynamic>{
      'FunctionVersion': functionVersion,
      'Name': name,
      if (description != null) 'Description': description,
      if (routingConfig != null) 'RoutingConfig': routingConfig,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/2015-03-31/functions/${Uri.encodeComponent(functionName)}/aliases',
      exceptionFnMap: _exceptionFns,
    );
    return AliasConfiguration.fromJson(response);
  }

  /// Returns details about a Lambda function <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-aliases.html">alias</a>.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [functionName] :
  /// The name or ARN of the Lambda function.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> - <code>MyFunction</code>.
  /// </li>
  /// <li>
  /// <b>Function ARN</b> -
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.
  /// </li>
  /// </ul>
  /// The length constraint applies only to the full ARN. If you specify only
  /// the function name, it is limited to 64 characters in length.
  ///
  /// Parameter [name] :
  /// The name of the alias.
  Future<AliasConfiguration> getAlias({
    required String functionName,
    required String name,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2015-03-31/functions/${Uri.encodeComponent(functionName)}/aliases/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return AliasConfiguration.fromJson(response);
  }

  /// Updates the configuration of a Lambda function <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-aliases.html">alias</a>.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [PreconditionFailedException].
  /// May throw [ResourceConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [functionName] :
  /// The name or ARN of the Lambda function.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> - <code>MyFunction</code>.
  /// </li>
  /// <li>
  /// <b>Function ARN</b> -
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.
  /// </li>
  /// </ul>
  /// The length constraint applies only to the full ARN. If you specify only
  /// the function name, it is limited to 64 characters in length.
  ///
  /// Parameter [name] :
  /// The name of the alias.
  ///
  /// Parameter [description] :
  /// A description of the alias.
  ///
  /// Parameter [functionVersion] :
  /// The function version that the alias invokes.
  ///
  /// Parameter [revisionId] :
  /// Only update the alias if the revision ID matches the ID that's specified.
  /// Use this option to avoid modifying an alias that has changed since you
  /// last read it.
  ///
  /// Parameter [routingConfig] :
  /// The <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-aliases.html#configuring-alias-routing">routing
  /// configuration</a> of the alias.
  Future<AliasConfiguration> updateAlias({
    required String functionName,
    required String name,
    String? description,
    String? functionVersion,
    String? revisionId,
    AliasRoutingConfiguration? routingConfig,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'Description': description,
      if (functionVersion != null) 'FunctionVersion': functionVersion,
      if (revisionId != null) 'RevisionId': revisionId,
      if (routingConfig != null) 'RoutingConfig': routingConfig,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/2015-03-31/functions/${Uri.encodeComponent(functionName)}/aliases/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return AliasConfiguration.fromJson(response);
  }

  /// Deletes a Lambda function <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-aliases.html">alias</a>.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceConflictException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [functionName] :
  /// The name or ARN of the Lambda function.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> - <code>MyFunction</code>.
  /// </li>
  /// <li>
  /// <b>Function ARN</b> -
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.
  /// </li>
  /// </ul>
  /// The length constraint applies only to the full ARN. If you specify only
  /// the function name, it is limited to 64 characters in length.
  ///
  /// Parameter [name] :
  /// The name of the alias.
  Future<void> deleteAlias({
    required String functionName,
    required String name,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2015-03-31/functions/${Uri.encodeComponent(functionName)}/aliases/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns a list of <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-aliases.html">aliases</a>
  /// for a Lambda function.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [functionName] :
  /// The name or ARN of the Lambda function.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> - <code>MyFunction</code>.
  /// </li>
  /// <li>
  /// <b>Function ARN</b> -
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.
  /// </li>
  /// </ul>
  /// The length constraint applies only to the full ARN. If you specify only
  /// the function name, it is limited to 64 characters in length.
  ///
  /// Parameter [functionVersion] :
  /// Specify a function version to only list aliases that invoke that version.
  ///
  /// Parameter [marker] :
  /// Specify the pagination token that's returned by a previous request to
  /// retrieve the next page of results.
  ///
  /// Parameter [maxItems] :
  /// Limit the number of aliases returned.
  Future<ListAliasesResponse> listAliases({
    required String functionName,
    String? functionVersion,
    String? marker,
    int? maxItems,
  }) async {
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      10000,
    );
    final $query = <String, List<String>>{
      if (functionVersion != null) 'FunctionVersion': [functionVersion],
      if (marker != null) 'Marker': [marker],
      if (maxItems != null) 'MaxItems': [maxItems.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2015-03-31/functions/${Uri.encodeComponent(functionName)}/aliases',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAliasesResponse.fromJson(response);
  }

  /// Creates a <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html">version</a>
  /// from the current code and configuration of a function. Use versions to
  /// create a snapshot of your function code and configuration that doesn't
  /// change.
  ///
  /// Lambda doesn't publish a version if the function's configuration and code
  /// haven't changed since the last version. Use <a>UpdateFunctionCode</a> or
  /// <a>UpdateFunctionConfiguration</a> to update the function before
  /// publishing a version.
  ///
  /// Clients can invoke versions directly or with an alias. To create an alias,
  /// use <a>CreateAlias</a>.
  ///
  /// May throw [CodeStorageExceededException].
  /// May throw [FunctionVersionsPerCapacityProviderLimitExceededException].
  /// May throw [InvalidParameterValueException].
  /// May throw [PreconditionFailedException].
  /// May throw [ResourceConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [functionName] :
  /// The name or ARN of the Lambda function.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> - <code>MyFunction</code>.
  /// </li>
  /// <li>
  /// <b>Function ARN</b> -
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.
  /// </li>
  /// </ul>
  /// The length constraint applies only to the full ARN. If you specify only
  /// the function name, it is limited to 64 characters in length.
  ///
  /// Parameter [codeSha256] :
  /// Only publish a version if the hash value matches the value that's
  /// specified. Use this option to avoid publishing a version if the function
  /// code has changed since you last updated it. You can get the hash for the
  /// version that you uploaded from the output of <a>UpdateFunctionCode</a>.
  ///
  /// Parameter [description] :
  /// A description for the version to override the description in the function
  /// configuration.
  ///
  /// Parameter [publishTo] :
  /// Specifies where to publish the function version or configuration.
  ///
  /// Parameter [revisionId] :
  /// Only update the function if the revision ID matches the ID that's
  /// specified. Use this option to avoid publishing a version if the function
  /// configuration has changed since you last updated it.
  Future<FunctionConfiguration> publishVersion({
    required String functionName,
    String? codeSha256,
    String? description,
    FunctionVersionLatestPublished? publishTo,
    String? revisionId,
  }) async {
    final $payload = <String, dynamic>{
      if (codeSha256 != null) 'CodeSha256': codeSha256,
      if (description != null) 'Description': description,
      if (publishTo != null) 'PublishTo': publishTo.value,
      if (revisionId != null) 'RevisionId': revisionId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/2015-03-31/functions/${Uri.encodeComponent(functionName)}/versions',
      exceptionFnMap: _exceptionFns,
    );
    return FunctionConfiguration.fromJson(response);
  }

  /// Returns a list of <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html">versions</a>,
  /// with the version-specific configuration of each. Lambda returns up to 50
  /// versions per call.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [functionName] :
  /// The name or ARN of the Lambda function.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> - <code>MyFunction</code>.
  /// </li>
  /// <li>
  /// <b>Function ARN</b> -
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.
  /// </li>
  /// </ul>
  /// The length constraint applies only to the full ARN. If you specify only
  /// the function name, it is limited to 64 characters in length.
  ///
  /// Parameter [marker] :
  /// Specify the pagination token that's returned by a previous request to
  /// retrieve the next page of results.
  ///
  /// Parameter [maxItems] :
  /// The maximum number of versions to return. Note that
  /// <code>ListVersionsByFunction</code> returns a maximum of 50 items in each
  /// response, even if you set the number higher.
  Future<ListVersionsByFunctionResponse> listVersionsByFunction({
    required String functionName,
    String? marker,
    int? maxItems,
  }) async {
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      10000,
    );
    final $query = <String, List<String>>{
      if (marker != null) 'Marker': [marker],
      if (maxItems != null) 'MaxItems': [maxItems.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2015-03-31/functions/${Uri.encodeComponent(functionName)}/versions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListVersionsByFunctionResponse.fromJson(response);
  }

  /// Lists <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/invocation-layers.html">Lambda
  /// layers</a> and shows information about the latest version of each. Specify
  /// a <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html">runtime
  /// identifier</a> to list only layers that indicate that they're compatible
  /// with that runtime. Specify a compatible architecture to include only
  /// layers that are compatible with that <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/foundation-arch.html">instruction
  /// set architecture</a>.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [compatibleArchitecture] :
  /// The compatible <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/foundation-arch.html">instruction
  /// set architecture</a>.
  ///
  /// Parameter [compatibleRuntime] :
  /// A runtime identifier.
  ///
  /// The following list includes deprecated runtimes. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html#runtime-deprecation-levels">Runtime
  /// use after deprecation</a>.
  ///
  /// For a list of all currently supported runtimes, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html#runtimes-supported">Supported
  /// runtimes</a>.
  ///
  /// Parameter [marker] :
  /// A pagination token returned by a previous call.
  ///
  /// Parameter [maxItems] :
  /// The maximum number of layers to return.
  Future<ListLayersResponse> listLayers({
    Architecture? compatibleArchitecture,
    Runtime? compatibleRuntime,
    String? marker,
    int? maxItems,
  }) async {
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (compatibleArchitecture != null)
        'CompatibleArchitecture': [compatibleArchitecture.value],
      if (compatibleRuntime != null)
        'CompatibleRuntime': [compatibleRuntime.value],
      if (marker != null) 'Marker': [marker],
      if (maxItems != null) 'MaxItems': [maxItems.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2018-10-31/layers',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListLayersResponse.fromJson(response);
  }

  /// Lists the versions of an <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">Lambda
  /// layer</a>. Versions that have been deleted aren't listed. Specify a <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html">runtime
  /// identifier</a> to list only versions that indicate that they're compatible
  /// with that runtime. Specify a compatible architecture to include only layer
  /// versions that are compatible with that architecture.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [layerName] :
  /// The name or Amazon Resource Name (ARN) of the layer.
  ///
  /// Parameter [compatibleArchitecture] :
  /// The compatible <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/foundation-arch.html">instruction
  /// set architecture</a>.
  ///
  /// Parameter [compatibleRuntime] :
  /// A runtime identifier.
  ///
  /// The following list includes deprecated runtimes. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html#runtime-deprecation-levels">Runtime
  /// use after deprecation</a>.
  ///
  /// For a list of all currently supported runtimes, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html#runtimes-supported">Supported
  /// runtimes</a>.
  ///
  /// Parameter [marker] :
  /// A pagination token returned by a previous call.
  ///
  /// Parameter [maxItems] :
  /// The maximum number of versions to return.
  Future<ListLayerVersionsResponse> listLayerVersions({
    required String layerName,
    Architecture? compatibleArchitecture,
    Runtime? compatibleRuntime,
    String? marker,
    int? maxItems,
  }) async {
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (compatibleArchitecture != null)
        'CompatibleArchitecture': [compatibleArchitecture.value],
      if (compatibleRuntime != null)
        'CompatibleRuntime': [compatibleRuntime.value],
      if (marker != null) 'Marker': [marker],
      if (maxItems != null) 'MaxItems': [maxItems.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2018-10-31/layers/${Uri.encodeComponent(layerName)}/versions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListLayerVersionsResponse.fromJson(response);
  }

  /// Adds permissions to the resource-based policy of a version of an <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">Lambda
  /// layer</a>. Use this action to grant layer usage permission to other
  /// accounts. You can grant permission to a single account, all accounts in an
  /// organization, or all Amazon Web Services accounts.
  ///
  /// To revoke permission, call <a>RemoveLayerVersionPermission</a> with the
  /// statement ID that you specified when you added it.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [PolicyLengthExceededException].
  /// May throw [PreconditionFailedException].
  /// May throw [ResourceConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [action] :
  /// The API action that grants access to the layer. For example,
  /// <code>lambda:GetLayerVersion</code>.
  ///
  /// Parameter [layerName] :
  /// The name or Amazon Resource Name (ARN) of the layer.
  ///
  /// Parameter [principal] :
  /// An account ID, or <code>*</code> to grant layer usage permission to all
  /// accounts in an organization, or all Amazon Web Services accounts (if
  /// <code>organizationId</code> is not specified). For the last case, make
  /// sure that you really do want all Amazon Web Services accounts to have
  /// usage permission to this layer.
  ///
  /// Parameter [statementId] :
  /// An identifier that distinguishes the policy from others on the same layer
  /// version.
  ///
  /// Parameter [versionNumber] :
  /// The version number.
  ///
  /// Parameter [organizationId] :
  /// With the principal set to <code>*</code>, grant permission to all accounts
  /// in the specified organization.
  ///
  /// Parameter [revisionId] :
  /// Only update the policy if the revision ID matches the ID specified. Use
  /// this option to avoid modifying a policy that has changed since you last
  /// read it.
  Future<AddLayerVersionPermissionResponse> addLayerVersionPermission({
    required String action,
    required String layerName,
    required String principal,
    required String statementId,
    required int versionNumber,
    String? organizationId,
    String? revisionId,
  }) async {
    final $query = <String, List<String>>{
      if (revisionId != null) 'RevisionId': [revisionId],
    };
    final $payload = <String, dynamic>{
      'Action': action,
      'Principal': principal,
      'StatementId': statementId,
      if (organizationId != null) 'OrganizationId': organizationId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/2018-10-31/layers/${Uri.encodeComponent(layerName)}/versions/${Uri.encodeComponent(versionNumber.toString())}/policy',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return AddLayerVersionPermissionResponse.fromJson(response);
  }

  /// Deletes a version of an <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">Lambda
  /// layer</a>. Deleted versions can no longer be viewed or added to functions.
  /// To avoid breaking functions, a copy of the version remains in Lambda until
  /// no functions refer to it.
  ///
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [layerName] :
  /// The name or Amazon Resource Name (ARN) of the layer.
  ///
  /// Parameter [versionNumber] :
  /// The version number.
  Future<void> deleteLayerVersion({
    required String layerName,
    required int versionNumber,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2018-10-31/layers/${Uri.encodeComponent(layerName)}/versions/${Uri.encodeComponent(versionNumber.toString())}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns information about a version of an <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">Lambda
  /// layer</a>, with a link to download the layer archive that's valid for 10
  /// minutes.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [layerName] :
  /// The name or Amazon Resource Name (ARN) of the layer.
  ///
  /// Parameter [versionNumber] :
  /// The version number.
  Future<GetLayerVersionResponse> getLayerVersion({
    required String layerName,
    required int versionNumber,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2018-10-31/layers/${Uri.encodeComponent(layerName)}/versions/${Uri.encodeComponent(versionNumber.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return GetLayerVersionResponse.fromJson(response);
  }

  /// Returns information about a version of an <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">Lambda
  /// layer</a>, with a link to download the layer archive that's valid for 10
  /// minutes.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [arn] :
  /// The ARN of the layer version.
  Future<GetLayerVersionResponse> getLayerVersionByArn({
    required String arn,
  }) async {
    final $query = <String, List<String>>{
      'Arn': [arn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2018-10-31/layers?find=LayerVersion',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetLayerVersionResponse.fromJson(response);
  }

  /// Returns the permission policy for a version of an <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">Lambda
  /// layer</a>. For more information, see <a>AddLayerVersionPermission</a>.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [layerName] :
  /// The name or Amazon Resource Name (ARN) of the layer.
  ///
  /// Parameter [versionNumber] :
  /// The version number.
  Future<GetLayerVersionPolicyResponse> getLayerVersionPolicy({
    required String layerName,
    required int versionNumber,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2018-10-31/layers/${Uri.encodeComponent(layerName)}/versions/${Uri.encodeComponent(versionNumber.toString())}/policy',
      exceptionFnMap: _exceptionFns,
    );
    return GetLayerVersionPolicyResponse.fromJson(response);
  }

  /// Creates an <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">Lambda
  /// layer</a> from a ZIP archive. Each time you call
  /// <code>PublishLayerVersion</code> with the same layer name, a new version
  /// is created.
  ///
  /// Add layers to your function with <a>CreateFunction</a> or
  /// <a>UpdateFunctionConfiguration</a>.
  ///
  /// May throw [CodeStorageExceededException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [content] :
  /// The function layer archive.
  ///
  /// Parameter [layerName] :
  /// The name or Amazon Resource Name (ARN) of the layer.
  ///
  /// Parameter [compatibleArchitectures] :
  /// A list of compatible <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/foundation-arch.html">instruction
  /// set architectures</a>.
  ///
  /// Parameter [compatibleRuntimes] :
  /// A list of compatible <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html">function
  /// runtimes</a>. Used for filtering with <a>ListLayers</a> and
  /// <a>ListLayerVersions</a>.
  ///
  /// The following list includes deprecated runtimes. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html#runtime-support-policy">Runtime
  /// deprecation policy</a>.
  ///
  /// Parameter [description] :
  /// The description of the version.
  ///
  /// Parameter [licenseInfo] :
  /// The layer's software license. It can be any of the following:
  ///
  /// <ul>
  /// <li>
  /// An <a href="https://spdx.org/licenses/">SPDX license identifier</a>. For
  /// example, <code>MIT</code>.
  /// </li>
  /// <li>
  /// The URL of a license hosted on the internet. For example,
  /// <code>https://opensource.org/licenses/MIT</code>.
  /// </li>
  /// <li>
  /// The full text of the license.
  /// </li>
  /// </ul>
  Future<PublishLayerVersionResponse> publishLayerVersion({
    required LayerVersionContentInput content,
    required String layerName,
    List<Architecture>? compatibleArchitectures,
    List<Runtime>? compatibleRuntimes,
    String? description,
    String? licenseInfo,
  }) async {
    final $payload = <String, dynamic>{
      'Content': content,
      if (compatibleArchitectures != null)
        'CompatibleArchitectures':
            compatibleArchitectures.map((e) => e.value).toList(),
      if (compatibleRuntimes != null)
        'CompatibleRuntimes': compatibleRuntimes.map((e) => e.value).toList(),
      if (description != null) 'Description': description,
      if (licenseInfo != null) 'LicenseInfo': licenseInfo,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/2018-10-31/layers/${Uri.encodeComponent(layerName)}/versions',
      exceptionFnMap: _exceptionFns,
    );
    return PublishLayerVersionResponse.fromJson(response);
  }

  /// Removes a statement from the permissions policy for a version of an <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">Lambda
  /// layer</a>. For more information, see <a>AddLayerVersionPermission</a>.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [PreconditionFailedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [layerName] :
  /// The name or Amazon Resource Name (ARN) of the layer.
  ///
  /// Parameter [statementId] :
  /// The identifier that was specified when the statement was added.
  ///
  /// Parameter [versionNumber] :
  /// The version number.
  ///
  /// Parameter [revisionId] :
  /// Only update the policy if the revision ID matches the ID specified. Use
  /// this option to avoid modifying a policy that has changed since you last
  /// read it.
  Future<void> removeLayerVersionPermission({
    required String layerName,
    required String statementId,
    required int versionNumber,
    String? revisionId,
  }) async {
    final $query = <String, List<String>>{
      if (revisionId != null) 'RevisionId': [revisionId],
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2018-10-31/layers/${Uri.encodeComponent(layerName)}/versions/${Uri.encodeComponent(versionNumber.toString())}/policy/${Uri.encodeComponent(statementId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Grants a <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_principal.html#Principal_specifying">principal</a>
  /// permission to use a function. You can apply the policy at the function
  /// level, or specify a qualifier to restrict access to a single version or
  /// alias. If you use a qualifier, the invoker must use the full Amazon
  /// Resource Name (ARN) of that version or alias to invoke the function. Note:
  /// Lambda does not support adding policies to version $LATEST.
  ///
  /// To grant permission to another account, specify the account ID as the
  /// <code>Principal</code>. To grant permission to an organization defined in
  /// Organizations, specify the organization ID as the
  /// <code>PrincipalOrgID</code>. For Amazon Web Services services, the
  /// principal is a domain-style identifier that the service defines, such as
  /// <code>s3.amazonaws.com</code> or <code>sns.amazonaws.com</code>. For
  /// Amazon Web Services services, you can also specify the ARN of the
  /// associated resource as the <code>SourceArn</code>. If you grant permission
  /// to a service principal without specifying the source, other accounts could
  /// potentially configure resources in their account to invoke your Lambda
  /// function.
  ///
  /// This operation adds a statement to a resource-based permissions policy for
  /// the function. For more information about function policies, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/access-control-resource-based.html">Using
  /// resource-based policies for Lambda</a>.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [PolicyLengthExceededException].
  /// May throw [PreconditionFailedException].
  /// May throw [ResourceConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [action] :
  /// The action that the principal can use on the function. For example,
  /// <code>lambda:InvokeFunction</code> or <code>lambda:GetFunction</code>.
  ///
  /// Parameter [functionName] :
  /// The name or ARN of the Lambda function, version, or alias.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> – <code>my-function</code> (name-only),
  /// <code>my-function:v1</code> (with alias).
  /// </li>
  /// <li>
  /// <b>Function ARN</b> –
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> – <code>123456789012:function:my-function</code>.
  /// </li>
  /// </ul>
  /// You can append a version number or alias to any of the formats. The length
  /// constraint applies only to the full ARN. If you specify only the function
  /// name, it is limited to 64 characters in length.
  ///
  /// Parameter [principal] :
  /// The Amazon Web Services service, Amazon Web Services account, IAM user, or
  /// IAM role that invokes the function. If you specify a service, use
  /// <code>SourceArn</code> or <code>SourceAccount</code> to limit who can
  /// invoke the function through that service.
  ///
  /// Parameter [statementId] :
  /// A statement identifier that differentiates the statement from others in
  /// the same policy.
  ///
  /// Parameter [eventSourceToken] :
  /// For Alexa Smart Home functions, a token that the invoker must supply.
  ///
  /// Parameter [functionUrlAuthType] :
  /// The type of authentication that your function URL uses. Set to
  /// <code>AWS_IAM</code> if you want to restrict access to authenticated users
  /// only. Set to <code>NONE</code> if you want to bypass IAM authentication to
  /// create a public endpoint. For more information, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/urls-auth.html">Control
  /// access to Lambda function URLs</a>.
  ///
  /// Parameter [invokedViaFunctionUrl] :
  /// Indicates whether the permission applies when the function is invoked
  /// through a function URL.
  ///
  /// Parameter [principalOrgID] :
  /// The identifier for your organization in Organizations. Use this to grant
  /// permissions to all the Amazon Web Services accounts under this
  /// organization.
  ///
  /// Parameter [qualifier] :
  /// Specify a version or alias to add permissions to a published version of
  /// the function.
  ///
  /// Parameter [revisionId] :
  /// Update the policy only if the revision ID matches the ID that's specified.
  /// Use this option to avoid modifying a policy that has changed since you
  /// last read it.
  ///
  /// Parameter [sourceAccount] :
  /// For Amazon Web Services service, the ID of the Amazon Web Services account
  /// that owns the resource. Use this together with <code>SourceArn</code> to
  /// ensure that the specified account owns the resource. It is possible for an
  /// Amazon S3 bucket to be deleted by its owner and recreated by another
  /// account.
  ///
  /// Parameter [sourceArn] :
  /// For Amazon Web Services services, the ARN of the Amazon Web Services
  /// resource that invokes the function. For example, an Amazon S3 bucket or
  /// Amazon SNS topic.
  ///
  /// Note that Lambda configures the comparison using the
  /// <code>StringLike</code> operator.
  Future<AddPermissionResponse> addPermission({
    required String action,
    required String functionName,
    required String principal,
    required String statementId,
    String? eventSourceToken,
    FunctionUrlAuthType? functionUrlAuthType,
    bool? invokedViaFunctionUrl,
    String? principalOrgID,
    String? qualifier,
    String? revisionId,
    String? sourceAccount,
    String? sourceArn,
  }) async {
    final $query = <String, List<String>>{
      if (qualifier != null) 'Qualifier': [qualifier],
    };
    final $payload = <String, dynamic>{
      'Action': action,
      'Principal': principal,
      'StatementId': statementId,
      if (eventSourceToken != null) 'EventSourceToken': eventSourceToken,
      if (functionUrlAuthType != null)
        'FunctionUrlAuthType': functionUrlAuthType.value,
      if (invokedViaFunctionUrl != null)
        'InvokedViaFunctionUrl': invokedViaFunctionUrl,
      if (principalOrgID != null) 'PrincipalOrgID': principalOrgID,
      if (revisionId != null) 'RevisionId': revisionId,
      if (sourceAccount != null) 'SourceAccount': sourceAccount,
      if (sourceArn != null) 'SourceArn': sourceArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/2015-03-31/functions/${Uri.encodeComponent(functionName)}/policy',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return AddPermissionResponse.fromJson(response);
  }

  /// Revokes function-use permission from an Amazon Web Services service or
  /// another Amazon Web Services account. You can get the ID of the statement
  /// from the output of <a>GetPolicy</a>.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [PreconditionFailedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [functionName] :
  /// The name or ARN of the Lambda function, version, or alias.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> – <code>my-function</code> (name-only),
  /// <code>my-function:v1</code> (with alias).
  /// </li>
  /// <li>
  /// <b>Function ARN</b> –
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> – <code>123456789012:function:my-function</code>.
  /// </li>
  /// </ul>
  /// You can append a version number or alias to any of the formats. The length
  /// constraint applies only to the full ARN. If you specify only the function
  /// name, it is limited to 64 characters in length.
  ///
  /// Parameter [statementId] :
  /// Statement ID of the permission to remove.
  ///
  /// Parameter [qualifier] :
  /// Specify a version or alias to remove permissions from a published version
  /// of the function.
  ///
  /// Parameter [revisionId] :
  /// Update the policy only if the revision ID matches the ID that's specified.
  /// Use this option to avoid modifying a policy that has changed since you
  /// last read it.
  Future<void> removePermission({
    required String functionName,
    required String statementId,
    String? qualifier,
    String? revisionId,
  }) async {
    final $query = <String, List<String>>{
      if (qualifier != null) 'Qualifier': [qualifier],
      if (revisionId != null) 'RevisionId': [revisionId],
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2015-03-31/functions/${Uri.encodeComponent(functionName)}/policy/${Uri.encodeComponent(statementId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Adds a provisioned concurrency configuration to a function's alias or
  /// version.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [functionName] :
  /// The name or ARN of the Lambda function.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> – <code>my-function</code>.
  /// </li>
  /// <li>
  /// <b>Function ARN</b> –
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> – <code>123456789012:function:my-function</code>.
  /// </li>
  /// </ul>
  /// The length constraint applies only to the full ARN. If you specify only
  /// the function name, it is limited to 64 characters in length.
  ///
  /// Parameter [provisionedConcurrentExecutions] :
  /// The amount of provisioned concurrency to allocate for the version or
  /// alias.
  ///
  /// Parameter [qualifier] :
  /// The version number or alias name.
  Future<PutProvisionedConcurrencyConfigResponse>
      putProvisionedConcurrencyConfig({
    required String functionName,
    required int provisionedConcurrentExecutions,
    required String qualifier,
  }) async {
    _s.validateNumRange(
      'provisionedConcurrentExecutions',
      provisionedConcurrentExecutions,
      1,
      1152921504606846976,
      isRequired: true,
    );
    final $query = <String, List<String>>{
      'Qualifier': [qualifier],
    };
    final $payload = <String, dynamic>{
      'ProvisionedConcurrentExecutions': provisionedConcurrentExecutions,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/2019-09-30/functions/${Uri.encodeComponent(functionName)}/provisioned-concurrency',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return PutProvisionedConcurrencyConfigResponse.fromJson(response);
  }

  /// Retrieves the provisioned concurrency configuration for a function's alias
  /// or version.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ProvisionedConcurrencyConfigNotFoundException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [functionName] :
  /// The name or ARN of the Lambda function.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> – <code>my-function</code>.
  /// </li>
  /// <li>
  /// <b>Function ARN</b> –
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> – <code>123456789012:function:my-function</code>.
  /// </li>
  /// </ul>
  /// The length constraint applies only to the full ARN. If you specify only
  /// the function name, it is limited to 64 characters in length.
  ///
  /// Parameter [qualifier] :
  /// The version number or alias name.
  Future<GetProvisionedConcurrencyConfigResponse>
      getProvisionedConcurrencyConfig({
    required String functionName,
    required String qualifier,
  }) async {
    final $query = <String, List<String>>{
      'Qualifier': [qualifier],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2019-09-30/functions/${Uri.encodeComponent(functionName)}/provisioned-concurrency',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetProvisionedConcurrencyConfigResponse.fromJson(response);
  }

  /// Deletes the provisioned concurrency configuration for a function.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [functionName] :
  /// The name or ARN of the Lambda function.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> – <code>my-function</code>.
  /// </li>
  /// <li>
  /// <b>Function ARN</b> –
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> – <code>123456789012:function:my-function</code>.
  /// </li>
  /// </ul>
  /// The length constraint applies only to the full ARN. If you specify only
  /// the function name, it is limited to 64 characters in length.
  ///
  /// Parameter [qualifier] :
  /// The version number or alias name.
  Future<void> deleteProvisionedConcurrencyConfig({
    required String functionName,
    required String qualifier,
  }) async {
    final $query = <String, List<String>>{
      'Qualifier': [qualifier],
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2019-09-30/functions/${Uri.encodeComponent(functionName)}/provisioned-concurrency',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }
}

/// The response from the CheckpointDurableExecution operation.
///
/// @nodoc
class CheckpointDurableExecutionResponse {
  /// Updated execution state information that includes any changes that occurred
  /// since the last checkpoint, such as completed callbacks or expired timers.
  /// This allows the SDK to update its internal state during replay.
  final CheckpointUpdatedExecutionState newExecutionState;

  /// A new checkpoint token to use for the next checkpoint operation. This token
  /// replaces the one provided in the request and must be used for subsequent
  /// checkpoints to maintain proper ordering.
  final String? checkpointToken;

  CheckpointDurableExecutionResponse({
    required this.newExecutionState,
    this.checkpointToken,
  });

  factory CheckpointDurableExecutionResponse.fromJson(
      Map<String, dynamic> json) {
    return CheckpointDurableExecutionResponse(
      newExecutionState: CheckpointUpdatedExecutionState.fromJson(
          (json['NewExecutionState'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      checkpointToken: json['CheckpointToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final newExecutionState = this.newExecutionState;
    final checkpointToken = this.checkpointToken;
    return {
      'NewExecutionState': newExecutionState,
      if (checkpointToken != null) 'CheckpointToken': checkpointToken,
    };
  }
}

/// @nodoc
class DeleteFunctionResponse {
  /// The HTTP status code returned by the operation.
  final int? statusCode;

  DeleteFunctionResponse({
    this.statusCode,
  });

  factory DeleteFunctionResponse.fromJson(Map<String, dynamic> json) {
    return DeleteFunctionResponse(
      statusCode: json['StatusCode'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final statusCode = this.statusCode;
    return {};
  }
}

/// @nodoc
class GetAccountSettingsResponse {
  /// Limits that are related to concurrency and code storage.
  final AccountLimit? accountLimit;

  /// The number of functions and amount of storage in use.
  final AccountUsage? accountUsage;

  GetAccountSettingsResponse({
    this.accountLimit,
    this.accountUsage,
  });

  factory GetAccountSettingsResponse.fromJson(Map<String, dynamic> json) {
    return GetAccountSettingsResponse(
      accountLimit: json['AccountLimit'] != null
          ? AccountLimit.fromJson(json['AccountLimit'] as Map<String, dynamic>)
          : null,
      accountUsage: json['AccountUsage'] != null
          ? AccountUsage.fromJson(json['AccountUsage'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accountLimit = this.accountLimit;
    final accountUsage = this.accountUsage;
    return {
      if (accountLimit != null) 'AccountLimit': accountLimit,
      if (accountUsage != null) 'AccountUsage': accountUsage,
    };
  }
}

/// The response from the GetDurableExecution operation, containing detailed
/// information about the durable execution.
///
/// @nodoc
class GetDurableExecutionResponse {
  /// The Amazon Resource Name (ARN) of the durable execution.
  final String durableExecutionArn;

  /// The name of the durable execution. This is either the name you provided when
  /// invoking the function, or a system-generated unique identifier if no name
  /// was provided.
  final String durableExecutionName;

  /// The Amazon Resource Name (ARN) of the Lambda function that was invoked to
  /// start this durable execution.
  final String functionArn;

  /// The date and time when the durable execution started, in Unix timestamp
  /// format.
  final DateTime startTimestamp;

  /// The current status of the durable execution. Valid values are
  /// <code>RUNNING</code>, <code>SUCCEEDED</code>, <code>FAILED</code>,
  /// <code>TIMED_OUT</code>, and <code>STOPPED</code>.
  final ExecutionStatus status;

  /// The date and time when the durable execution ended, in Unix timestamp
  /// format. This field is only present if the execution has completed (status is
  /// <code>SUCCEEDED</code>, <code>FAILED</code>, <code>TIMED_OUT</code>, or
  /// <code>STOPPED</code>).
  final DateTime? endTimestamp;

  /// Error information if the durable execution failed. This field is only
  /// present when the execution status is <code>FAILED</code>,
  /// <code>TIMED_OUT</code>, or <code>STOPPED</code>. The combined size of all
  /// error fields is limited to 256 KB.
  final ErrorObject? error;

  /// The JSON input payload that was provided when the durable execution was
  /// started. For asynchronous invocations, this is limited to 256 KB. For
  /// synchronous invocations, this can be up to 6 MB.
  final String? inputPayload;

  /// The JSON result returned by the durable execution if it completed
  /// successfully. This field is only present when the execution status is
  /// <code>SUCCEEDED</code>. The result is limited to 256 KB.
  final String? result;

  /// The trace headers associated with the durable execution.
  final TraceHeader? traceHeader;

  /// The version of the Lambda function that was invoked for this durable
  /// execution. This ensures that all replays during the execution use the same
  /// function version.
  final String? version;

  GetDurableExecutionResponse({
    required this.durableExecutionArn,
    required this.durableExecutionName,
    required this.functionArn,
    required this.startTimestamp,
    required this.status,
    this.endTimestamp,
    this.error,
    this.inputPayload,
    this.result,
    this.traceHeader,
    this.version,
  });

  factory GetDurableExecutionResponse.fromJson(Map<String, dynamic> json) {
    return GetDurableExecutionResponse(
      durableExecutionArn: (json['DurableExecutionArn'] as String?) ?? '',
      durableExecutionName: (json['DurableExecutionName'] as String?) ?? '',
      functionArn: (json['FunctionArn'] as String?) ?? '',
      startTimestamp: nonNullableTimeStampFromJson(json['StartTimestamp'] ?? 0),
      status: ExecutionStatus.fromString((json['Status'] as String?) ?? ''),
      endTimestamp: timeStampFromJson(json['EndTimestamp']),
      error: json['Error'] != null
          ? ErrorObject.fromJson(json['Error'] as Map<String, dynamic>)
          : null,
      inputPayload: json['InputPayload'] as String?,
      result: json['Result'] as String?,
      traceHeader: json['TraceHeader'] != null
          ? TraceHeader.fromJson(json['TraceHeader'] as Map<String, dynamic>)
          : null,
      version: json['Version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final durableExecutionArn = this.durableExecutionArn;
    final durableExecutionName = this.durableExecutionName;
    final functionArn = this.functionArn;
    final startTimestamp = this.startTimestamp;
    final status = this.status;
    final endTimestamp = this.endTimestamp;
    final error = this.error;
    final inputPayload = this.inputPayload;
    final result = this.result;
    final traceHeader = this.traceHeader;
    final version = this.version;
    return {
      'DurableExecutionArn': durableExecutionArn,
      'DurableExecutionName': durableExecutionName,
      'FunctionArn': functionArn,
      'StartTimestamp': unixTimestampToJson(startTimestamp),
      'Status': status.value,
      if (endTimestamp != null)
        'EndTimestamp': unixTimestampToJson(endTimestamp),
      if (error != null) 'Error': error,
      if (inputPayload != null) 'InputPayload': inputPayload,
      if (result != null) 'Result': result,
      if (traceHeader != null) 'TraceHeader': traceHeader,
      if (version != null) 'Version': version,
    };
  }
}

/// The response from the GetDurableExecutionHistory operation, containing the
/// execution history and events.
///
/// @nodoc
class GetDurableExecutionHistoryResponse {
  /// An array of execution history events, ordered chronologically unless
  /// <code>ReverseOrder</code> is set to <code>true</code>. Each event represents
  /// a significant occurrence during the execution, such as step completion or
  /// callback resolution.
  final List<Event> events;

  /// If present, indicates that more history events are available. Use this value
  /// as the <code>Marker</code> parameter in a subsequent request to retrieve the
  /// next page of results.
  final String? nextMarker;

  GetDurableExecutionHistoryResponse({
    required this.events,
    this.nextMarker,
  });

  factory GetDurableExecutionHistoryResponse.fromJson(
      Map<String, dynamic> json) {
    return GetDurableExecutionHistoryResponse(
      events: ((json['Events'] as List?) ?? const [])
          .nonNulls
          .map((e) => Event.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextMarker: json['NextMarker'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final events = this.events;
    final nextMarker = this.nextMarker;
    return {
      'Events': events,
      if (nextMarker != null) 'NextMarker': nextMarker,
    };
  }
}

/// The response from the GetDurableExecutionState operation, containing the
/// current execution state for replay.
///
/// @nodoc
class GetDurableExecutionStateResponse {
  /// An array of operations that represent the current state of the durable
  /// execution. Operations are ordered by their start sequence number in
  /// ascending order and include information needed for replay processing.
  final List<Operation> operations;

  /// If present, indicates that more operations are available. Use this value as
  /// the <code>Marker</code> parameter in a subsequent request to retrieve the
  /// next page of results.
  final String? nextMarker;

  GetDurableExecutionStateResponse({
    required this.operations,
    this.nextMarker,
  });

  factory GetDurableExecutionStateResponse.fromJson(Map<String, dynamic> json) {
    return GetDurableExecutionStateResponse(
      operations: ((json['Operations'] as List?) ?? const [])
          .nonNulls
          .map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextMarker: json['NextMarker'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final operations = this.operations;
    final nextMarker = this.nextMarker;
    return {
      'Operations': operations,
      if (nextMarker != null) 'NextMarker': nextMarker,
    };
  }
}

/// @nodoc
class FunctionEventInvokeConfig {
  /// A destination for events after they have been sent to a function for
  /// processing.
  /// <p class="title"> <b>Destinations</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function</b> - The Amazon Resource Name (ARN) of a Lambda function.
  /// </li>
  /// <li>
  /// <b>Queue</b> - The ARN of a standard SQS queue.
  /// </li>
  /// <li>
  /// <b>Bucket</b> - The ARN of an Amazon S3 bucket.
  /// </li>
  /// <li>
  /// <b>Topic</b> - The ARN of a standard SNS topic.
  /// </li>
  /// <li>
  /// <b>Event Bus</b> - The ARN of an Amazon EventBridge event bus.
  /// </li>
  /// </ul> <note>
  /// S3 buckets are supported only for on-failure destinations. To retain records
  /// of successful invocations, use another destination type.
  /// </note>
  final DestinationConfig? destinationConfig;

  /// The Amazon Resource Name (ARN) of the function.
  final String? functionArn;

  /// The date and time that the configuration was last updated.
  final DateTime? lastModified;

  /// The maximum age of a request that Lambda sends to a function for processing.
  final int? maximumEventAgeInSeconds;

  /// The maximum number of times to retry when the function returns an error.
  final int? maximumRetryAttempts;

  FunctionEventInvokeConfig({
    this.destinationConfig,
    this.functionArn,
    this.lastModified,
    this.maximumEventAgeInSeconds,
    this.maximumRetryAttempts,
  });

  factory FunctionEventInvokeConfig.fromJson(Map<String, dynamic> json) {
    return FunctionEventInvokeConfig(
      destinationConfig: json['DestinationConfig'] != null
          ? DestinationConfig.fromJson(
              json['DestinationConfig'] as Map<String, dynamic>)
          : null,
      functionArn: json['FunctionArn'] as String?,
      lastModified: timeStampFromJson(json['LastModified']),
      maximumEventAgeInSeconds: json['MaximumEventAgeInSeconds'] as int?,
      maximumRetryAttempts: json['MaximumRetryAttempts'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final destinationConfig = this.destinationConfig;
    final functionArn = this.functionArn;
    final lastModified = this.lastModified;
    final maximumEventAgeInSeconds = this.maximumEventAgeInSeconds;
    final maximumRetryAttempts = this.maximumRetryAttempts;
    return {
      if (destinationConfig != null) 'DestinationConfig': destinationConfig,
      if (functionArn != null) 'FunctionArn': functionArn,
      if (lastModified != null)
        'LastModified': unixTimestampToJson(lastModified),
      if (maximumEventAgeInSeconds != null)
        'MaximumEventAgeInSeconds': maximumEventAgeInSeconds,
      if (maximumRetryAttempts != null)
        'MaximumRetryAttempts': maximumRetryAttempts,
    };
  }
}

/// The response from the ListDurableExecutionsByFunction operation, containing
/// a list of durable executions and pagination information.
///
/// @nodoc
class ListDurableExecutionsByFunctionResponse {
  /// List of durable execution summaries matching the filter criteria.
  final List<Execution>? durableExecutions;

  /// Pagination token for retrieving additional results. Present only if there
  /// are more results available.
  final String? nextMarker;

  ListDurableExecutionsByFunctionResponse({
    this.durableExecutions,
    this.nextMarker,
  });

  factory ListDurableExecutionsByFunctionResponse.fromJson(
      Map<String, dynamic> json) {
    return ListDurableExecutionsByFunctionResponse(
      durableExecutions: (json['DurableExecutions'] as List?)
          ?.nonNulls
          .map((e) => Execution.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextMarker: json['NextMarker'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final durableExecutions = this.durableExecutions;
    final nextMarker = this.nextMarker;
    return {
      if (durableExecutions != null) 'DurableExecutions': durableExecutions,
      if (nextMarker != null) 'NextMarker': nextMarker,
    };
  }
}

/// @nodoc
class ListFunctionEventInvokeConfigsResponse {
  /// A list of configurations.
  final List<FunctionEventInvokeConfig>? functionEventInvokeConfigs;

  /// The pagination token that's included if more results are available.
  final String? nextMarker;

  ListFunctionEventInvokeConfigsResponse({
    this.functionEventInvokeConfigs,
    this.nextMarker,
  });

  factory ListFunctionEventInvokeConfigsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListFunctionEventInvokeConfigsResponse(
      functionEventInvokeConfigs: (json['FunctionEventInvokeConfigs'] as List?)
          ?.nonNulls
          .map((e) =>
              FunctionEventInvokeConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextMarker: json['NextMarker'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final functionEventInvokeConfigs = this.functionEventInvokeConfigs;
    final nextMarker = this.nextMarker;
    return {
      if (functionEventInvokeConfigs != null)
        'FunctionEventInvokeConfigs': functionEventInvokeConfigs,
      if (nextMarker != null) 'NextMarker': nextMarker,
    };
  }
}

/// @nodoc
class ListTagsResponse {
  /// The function's tags.
  final Map<String, String>? tags;

  ListTagsResponse({
    this.tags,
  });

  factory ListTagsResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsResponse(
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'Tags': tags,
    };
  }
}

/// @nodoc
class SendDurableExecutionCallbackFailureResponse {
  SendDurableExecutionCallbackFailureResponse();

  factory SendDurableExecutionCallbackFailureResponse.fromJson(
      Map<String, dynamic> _) {
    return SendDurableExecutionCallbackFailureResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class SendDurableExecutionCallbackHeartbeatResponse {
  SendDurableExecutionCallbackHeartbeatResponse();

  factory SendDurableExecutionCallbackHeartbeatResponse.fromJson(
      Map<String, dynamic> _) {
    return SendDurableExecutionCallbackHeartbeatResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class SendDurableExecutionCallbackSuccessResponse {
  SendDurableExecutionCallbackSuccessResponse();

  factory SendDurableExecutionCallbackSuccessResponse.fromJson(
      Map<String, dynamic> _) {
    return SendDurableExecutionCallbackSuccessResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class StopDurableExecutionResponse {
  /// The timestamp when the execution was stopped (ISO 8601 format).
  final DateTime stopTimestamp;

  StopDurableExecutionResponse({
    required this.stopTimestamp,
  });

  factory StopDurableExecutionResponse.fromJson(Map<String, dynamic> json) {
    return StopDurableExecutionResponse(
      stopTimestamp: nonNullableTimeStampFromJson(json['StopTimestamp'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final stopTimestamp = this.stopTimestamp;
    return {
      'StopTimestamp': unixTimestampToJson(stopTimestamp),
    };
  }
}

/// @nodoc
class CreateCapacityProviderResponse {
  /// Information about the capacity provider that was created.
  final CapacityProvider capacityProvider;

  CreateCapacityProviderResponse({
    required this.capacityProvider,
  });

  factory CreateCapacityProviderResponse.fromJson(Map<String, dynamic> json) {
    return CreateCapacityProviderResponse(
      capacityProvider: CapacityProvider.fromJson(
          (json['CapacityProvider'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final capacityProvider = this.capacityProvider;
    return {
      'CapacityProvider': capacityProvider,
    };
  }
}

/// @nodoc
class GetCapacityProviderResponse {
  /// Information about the capacity provider, including its configuration and
  /// current state.
  final CapacityProvider capacityProvider;

  GetCapacityProviderResponse({
    required this.capacityProvider,
  });

  factory GetCapacityProviderResponse.fromJson(Map<String, dynamic> json) {
    return GetCapacityProviderResponse(
      capacityProvider: CapacityProvider.fromJson(
          (json['CapacityProvider'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final capacityProvider = this.capacityProvider;
    return {
      'CapacityProvider': capacityProvider,
    };
  }
}

/// @nodoc
class UpdateCapacityProviderResponse {
  /// Information about the updated capacity provider.
  final CapacityProvider capacityProvider;

  UpdateCapacityProviderResponse({
    required this.capacityProvider,
  });

  factory UpdateCapacityProviderResponse.fromJson(Map<String, dynamic> json) {
    return UpdateCapacityProviderResponse(
      capacityProvider: CapacityProvider.fromJson(
          (json['CapacityProvider'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final capacityProvider = this.capacityProvider;
    return {
      'CapacityProvider': capacityProvider,
    };
  }
}

/// @nodoc
class DeleteCapacityProviderResponse {
  /// Information about the deleted capacity provider.
  final CapacityProvider capacityProvider;

  DeleteCapacityProviderResponse({
    required this.capacityProvider,
  });

  factory DeleteCapacityProviderResponse.fromJson(Map<String, dynamic> json) {
    return DeleteCapacityProviderResponse(
      capacityProvider: CapacityProvider.fromJson(
          (json['CapacityProvider'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final capacityProvider = this.capacityProvider;
    return {
      'CapacityProvider': capacityProvider,
    };
  }
}

/// @nodoc
class ListCapacityProvidersResponse {
  /// A list of capacity providers in your account.
  final List<CapacityProvider> capacityProviders;

  /// The pagination token that's included if more results are available.
  final String? nextMarker;

  ListCapacityProvidersResponse({
    required this.capacityProviders,
    this.nextMarker,
  });

  factory ListCapacityProvidersResponse.fromJson(Map<String, dynamic> json) {
    return ListCapacityProvidersResponse(
      capacityProviders: ((json['CapacityProviders'] as List?) ?? const [])
          .nonNulls
          .map((e) => CapacityProvider.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextMarker: json['NextMarker'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final capacityProviders = this.capacityProviders;
    final nextMarker = this.nextMarker;
    return {
      'CapacityProviders': capacityProviders,
      if (nextMarker != null) 'NextMarker': nextMarker,
    };
  }
}

/// @nodoc
class ListFunctionVersionsByCapacityProviderResponse {
  /// The Amazon Resource Name (ARN) of the capacity provider.
  final String capacityProviderArn;

  /// A list of function versions that use the specified capacity provider.
  final List<FunctionVersionsByCapacityProviderListItem> functionVersions;

  /// The pagination token that's included if more results are available.
  final String? nextMarker;

  ListFunctionVersionsByCapacityProviderResponse({
    required this.capacityProviderArn,
    required this.functionVersions,
    this.nextMarker,
  });

  factory ListFunctionVersionsByCapacityProviderResponse.fromJson(
      Map<String, dynamic> json) {
    return ListFunctionVersionsByCapacityProviderResponse(
      capacityProviderArn: (json['CapacityProviderArn'] as String?) ?? '',
      functionVersions: ((json['FunctionVersions'] as List?) ?? const [])
          .nonNulls
          .map((e) => FunctionVersionsByCapacityProviderListItem.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextMarker: json['NextMarker'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final capacityProviderArn = this.capacityProviderArn;
    final functionVersions = this.functionVersions;
    final nextMarker = this.nextMarker;
    return {
      'CapacityProviderArn': capacityProviderArn,
      'FunctionVersions': functionVersions,
      if (nextMarker != null) 'NextMarker': nextMarker,
    };
  }
}

/// @nodoc
class CreateCodeSigningConfigResponse {
  /// The code signing configuration.
  final CodeSigningConfig codeSigningConfig;

  CreateCodeSigningConfigResponse({
    required this.codeSigningConfig,
  });

  factory CreateCodeSigningConfigResponse.fromJson(Map<String, dynamic> json) {
    return CreateCodeSigningConfigResponse(
      codeSigningConfig: CodeSigningConfig.fromJson(
          (json['CodeSigningConfig'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final codeSigningConfig = this.codeSigningConfig;
    return {
      'CodeSigningConfig': codeSigningConfig,
    };
  }
}

/// @nodoc
class ListCodeSigningConfigsResponse {
  /// The code signing configurations
  final List<CodeSigningConfig>? codeSigningConfigs;

  /// The pagination token that's included if more results are available.
  final String? nextMarker;

  ListCodeSigningConfigsResponse({
    this.codeSigningConfigs,
    this.nextMarker,
  });

  factory ListCodeSigningConfigsResponse.fromJson(Map<String, dynamic> json) {
    return ListCodeSigningConfigsResponse(
      codeSigningConfigs: (json['CodeSigningConfigs'] as List?)
          ?.nonNulls
          .map((e) => CodeSigningConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextMarker: json['NextMarker'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final codeSigningConfigs = this.codeSigningConfigs;
    final nextMarker = this.nextMarker;
    return {
      if (codeSigningConfigs != null) 'CodeSigningConfigs': codeSigningConfigs,
      if (nextMarker != null) 'NextMarker': nextMarker,
    };
  }
}

/// @nodoc
class DeleteCodeSigningConfigResponse {
  DeleteCodeSigningConfigResponse();

  factory DeleteCodeSigningConfigResponse.fromJson(Map<String, dynamic> _) {
    return DeleteCodeSigningConfigResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class GetCodeSigningConfigResponse {
  /// The code signing configuration
  final CodeSigningConfig codeSigningConfig;

  GetCodeSigningConfigResponse({
    required this.codeSigningConfig,
  });

  factory GetCodeSigningConfigResponse.fromJson(Map<String, dynamic> json) {
    return GetCodeSigningConfigResponse(
      codeSigningConfig: CodeSigningConfig.fromJson(
          (json['CodeSigningConfig'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final codeSigningConfig = this.codeSigningConfig;
    return {
      'CodeSigningConfig': codeSigningConfig,
    };
  }
}

/// @nodoc
class ListFunctionsByCodeSigningConfigResponse {
  /// The function ARNs.
  final List<String>? functionArns;

  /// The pagination token that's included if more results are available.
  final String? nextMarker;

  ListFunctionsByCodeSigningConfigResponse({
    this.functionArns,
    this.nextMarker,
  });

  factory ListFunctionsByCodeSigningConfigResponse.fromJson(
      Map<String, dynamic> json) {
    return ListFunctionsByCodeSigningConfigResponse(
      functionArns: (json['FunctionArns'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      nextMarker: json['NextMarker'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final functionArns = this.functionArns;
    final nextMarker = this.nextMarker;
    return {
      if (functionArns != null) 'FunctionArns': functionArns,
      if (nextMarker != null) 'NextMarker': nextMarker,
    };
  }
}

/// @nodoc
class UpdateCodeSigningConfigResponse {
  /// The code signing configuration
  final CodeSigningConfig codeSigningConfig;

  UpdateCodeSigningConfigResponse({
    required this.codeSigningConfig,
  });

  factory UpdateCodeSigningConfigResponse.fromJson(Map<String, dynamic> json) {
    return UpdateCodeSigningConfigResponse(
      codeSigningConfig: CodeSigningConfig.fromJson(
          (json['CodeSigningConfig'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final codeSigningConfig = this.codeSigningConfig;
    return {
      'CodeSigningConfig': codeSigningConfig,
    };
  }
}

/// A mapping between an Amazon Web Services resource and a Lambda function. For
/// details, see <a>CreateEventSourceMapping</a>.
///
/// @nodoc
class EventSourceMappingConfiguration {
  /// Specific configuration settings for an Amazon Managed Streaming for Apache
  /// Kafka (Amazon MSK) event source.
  final AmazonManagedKafkaEventSourceConfig?
      amazonManagedKafkaEventSourceConfig;

  /// The maximum number of records in each batch that Lambda pulls from your
  /// stream or queue and sends to your function. Lambda passes all of the records
  /// in the batch to the function in a single call, up to the payload limit for
  /// synchronous invocation (6 MB).
  ///
  /// Default value: Varies by service. For Amazon SQS, the default is 10. For all
  /// other services, the default is 100.
  ///
  /// Related setting: When you set <code>BatchSize</code> to a value greater than
  /// 10, you must set <code>MaximumBatchingWindowInSeconds</code> to at least 1.
  final int? batchSize;

  /// (Kinesis, DynamoDB Streams, Amazon MSK, and self-managed Apache Kafka) If
  /// the function returns an error, split the batch in two and retry. The default
  /// value is false.
  final bool? bisectBatchOnFunctionError;

  /// (Kinesis, DynamoDB Streams, Amazon MSK, and self-managed Apache Kafka) A
  /// configuration object that specifies the destination of an event after Lambda
  /// processes it.
  final DestinationConfig? destinationConfig;

  /// Specific configuration settings for a DocumentDB event source.
  final DocumentDBEventSourceConfig? documentDBEventSourceConfig;

  /// The Amazon Resource Name (ARN) of the event source.
  final String? eventSourceArn;

  /// The Amazon Resource Name (ARN) of the event source mapping.
  final String? eventSourceMappingArn;

  /// An object that defines the filter criteria that determine whether Lambda
  /// should process an event. For more information, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/invocation-eventfiltering.html">Lambda
  /// event filtering</a>.
  ///
  /// If filter criteria is encrypted, this field shows up as <code>null</code> in
  /// the response of ListEventSourceMapping API calls. You can view this field in
  /// plaintext in the response of GetEventSourceMapping and
  /// DeleteEventSourceMapping calls if you have <code>kms:Decrypt</code>
  /// permissions for the correct KMS key.
  final FilterCriteria? filterCriteria;

  /// An object that contains details about an error related to filter criteria
  /// encryption.
  final FilterCriteriaError? filterCriteriaError;

  /// The ARN of the Lambda function.
  final String? functionArn;

  /// (Kinesis, DynamoDB Streams, Amazon MSK, self-managed Apache Kafka, and
  /// Amazon SQS) A list of current response type enums applied to the event
  /// source mapping.
  final List<FunctionResponseType>? functionResponseTypes;

  /// The ARN of the Key Management Service (KMS) customer managed key that Lambda
  /// uses to encrypt your function's <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/invocation-eventfiltering.html#filtering-basics">filter
  /// criteria</a>.
  final String? kMSKeyArn;

  /// The date that the event source mapping was last updated or that its state
  /// changed.
  final DateTime? lastModified;

  /// The result of the event source mapping's last processing attempt.
  final String? lastProcessingResult;

  /// (Amazon MSK, and self-managed Apache Kafka only) The logging configuration
  /// for your event source. For more information, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/esm-logging.html">Event
  /// source mapping logging</a>.
  final EventSourceMappingLoggingConfig? loggingConfig;

  /// The maximum amount of time, in seconds, that Lambda spends gathering records
  /// before invoking the function. You can configure
  /// <code>MaximumBatchingWindowInSeconds</code> to any value from 0 seconds to
  /// 300 seconds in increments of seconds.
  ///
  /// For streams and Amazon SQS event sources, the default batching window is 0
  /// seconds. For Amazon MSK, Self-managed Apache Kafka, Amazon MQ, and
  /// DocumentDB event sources, the default batching window is 500 ms. Note that
  /// because you can only change <code>MaximumBatchingWindowInSeconds</code> in
  /// increments of seconds, you cannot revert back to the 500 ms default batching
  /// window after you have changed it. To restore the default batching window,
  /// you must create a new event source mapping.
  ///
  /// Related setting: For streams and Amazon SQS event sources, when you set
  /// <code>BatchSize</code> to a value greater than 10, you must set
  /// <code>MaximumBatchingWindowInSeconds</code> to at least 1.
  final int? maximumBatchingWindowInSeconds;

  /// (Kinesis, DynamoDB Streams, Amazon MSK, and self-managed Apache Kafka)
  /// Discard records older than the specified age. The default value is -1, which
  /// sets the maximum age to infinite. When the value is set to infinite, Lambda
  /// never discards old records.
  /// <note>
  /// The minimum valid value for maximum record age is 60s. Although values less
  /// than 60 and greater than -1 fall within the parameter's absolute range, they
  /// are not allowed
  /// </note>
  final int? maximumRecordAgeInSeconds;

  /// (Kinesis, DynamoDB Streams, Amazon MSK, and self-managed Apache Kafka)
  /// Discard records after the specified number of retries. The default value is
  /// -1, which sets the maximum number of retries to infinite. When
  /// MaximumRetryAttempts is infinite, Lambda retries failed records until the
  /// record expires in the event source.
  final int? maximumRetryAttempts;

  /// The metrics configuration for your event source. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/monitoring-metrics-types.html#event-source-mapping-metrics">Event
  /// source mapping metrics</a>.
  final EventSourceMappingMetricsConfig? metricsConfig;

  /// (Kinesis and DynamoDB Streams only) The number of batches to process
  /// concurrently from each shard. The default value is 1.
  final int? parallelizationFactor;

  /// (Amazon SQS, Amazon MSK, and self-managed Apache Kafka only) The provisioned
  /// mode configuration for the event source. For more information, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/invocation-eventsourcemapping.html#invocation-eventsourcemapping-provisioned-mode">provisioned
  /// mode</a>.
  final ProvisionedPollerConfig? provisionedPollerConfig;

  /// (Amazon MQ) The name of the Amazon MQ broker destination queue to consume.
  final List<String>? queues;

  /// (Amazon SQS only) The scaling configuration for the event source. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/with-sqs.html#events-sqs-max-concurrency">Configuring
  /// maximum concurrency for Amazon SQS event sources</a>.
  final ScalingConfig? scalingConfig;

  /// The self-managed Apache Kafka cluster for your event source.
  final SelfManagedEventSource? selfManagedEventSource;

  /// Specific configuration settings for a self-managed Apache Kafka event
  /// source.
  final SelfManagedKafkaEventSourceConfig? selfManagedKafkaEventSourceConfig;

  /// An array of the authentication protocol, VPC components, or virtual host to
  /// secure and define your event source.
  final List<SourceAccessConfiguration>? sourceAccessConfigurations;

  /// The position in a stream from which to start reading. Required for Amazon
  /// Kinesis and Amazon DynamoDB Stream event sources. <code>AT_TIMESTAMP</code>
  /// is supported only for Amazon Kinesis streams, Amazon DocumentDB, Amazon MSK,
  /// and self-managed Apache Kafka.
  final EventSourcePosition? startingPosition;

  /// With <code>StartingPosition</code> set to <code>AT_TIMESTAMP</code>, the
  /// time from which to start reading. <code>StartingPositionTimestamp</code>
  /// cannot be in the future.
  final DateTime? startingPositionTimestamp;

  /// The state of the event source mapping. It can be one of the following:
  /// <code>Creating</code>, <code>Enabling</code>, <code>Enabled</code>,
  /// <code>Disabling</code>, <code>Disabled</code>, <code>Updating</code>, or
  /// <code>Deleting</code>.
  final String? state;

  /// Indicates whether a user or Lambda made the last change to the event source
  /// mapping.
  final String? stateTransitionReason;

  /// The name of the Kafka topic.
  final List<String>? topics;

  /// (Kinesis and DynamoDB Streams only) The duration in seconds of a processing
  /// window for DynamoDB and Kinesis Streams event sources. A value of 0 seconds
  /// indicates no tumbling window.
  final int? tumblingWindowInSeconds;

  /// The identifier of the event source mapping.
  final String? uuid;

  EventSourceMappingConfiguration({
    this.amazonManagedKafkaEventSourceConfig,
    this.batchSize,
    this.bisectBatchOnFunctionError,
    this.destinationConfig,
    this.documentDBEventSourceConfig,
    this.eventSourceArn,
    this.eventSourceMappingArn,
    this.filterCriteria,
    this.filterCriteriaError,
    this.functionArn,
    this.functionResponseTypes,
    this.kMSKeyArn,
    this.lastModified,
    this.lastProcessingResult,
    this.loggingConfig,
    this.maximumBatchingWindowInSeconds,
    this.maximumRecordAgeInSeconds,
    this.maximumRetryAttempts,
    this.metricsConfig,
    this.parallelizationFactor,
    this.provisionedPollerConfig,
    this.queues,
    this.scalingConfig,
    this.selfManagedEventSource,
    this.selfManagedKafkaEventSourceConfig,
    this.sourceAccessConfigurations,
    this.startingPosition,
    this.startingPositionTimestamp,
    this.state,
    this.stateTransitionReason,
    this.topics,
    this.tumblingWindowInSeconds,
    this.uuid,
  });

  factory EventSourceMappingConfiguration.fromJson(Map<String, dynamic> json) {
    return EventSourceMappingConfiguration(
      amazonManagedKafkaEventSourceConfig:
          json['AmazonManagedKafkaEventSourceConfig'] != null
              ? AmazonManagedKafkaEventSourceConfig.fromJson(
                  json['AmazonManagedKafkaEventSourceConfig']
                      as Map<String, dynamic>)
              : null,
      batchSize: json['BatchSize'] as int?,
      bisectBatchOnFunctionError: json['BisectBatchOnFunctionError'] as bool?,
      destinationConfig: json['DestinationConfig'] != null
          ? DestinationConfig.fromJson(
              json['DestinationConfig'] as Map<String, dynamic>)
          : null,
      documentDBEventSourceConfig: json['DocumentDBEventSourceConfig'] != null
          ? DocumentDBEventSourceConfig.fromJson(
              json['DocumentDBEventSourceConfig'] as Map<String, dynamic>)
          : null,
      eventSourceArn: json['EventSourceArn'] as String?,
      eventSourceMappingArn: json['EventSourceMappingArn'] as String?,
      filterCriteria: json['FilterCriteria'] != null
          ? FilterCriteria.fromJson(
              json['FilterCriteria'] as Map<String, dynamic>)
          : null,
      filterCriteriaError: json['FilterCriteriaError'] != null
          ? FilterCriteriaError.fromJson(
              json['FilterCriteriaError'] as Map<String, dynamic>)
          : null,
      functionArn: json['FunctionArn'] as String?,
      functionResponseTypes: (json['FunctionResponseTypes'] as List?)
          ?.nonNulls
          .map((e) => FunctionResponseType.fromString((e as String)))
          .toList(),
      kMSKeyArn: json['KMSKeyArn'] as String?,
      lastModified: timeStampFromJson(json['LastModified']),
      lastProcessingResult: json['LastProcessingResult'] as String?,
      loggingConfig: json['LoggingConfig'] != null
          ? EventSourceMappingLoggingConfig.fromJson(
              json['LoggingConfig'] as Map<String, dynamic>)
          : null,
      maximumBatchingWindowInSeconds:
          json['MaximumBatchingWindowInSeconds'] as int?,
      maximumRecordAgeInSeconds: json['MaximumRecordAgeInSeconds'] as int?,
      maximumRetryAttempts: json['MaximumRetryAttempts'] as int?,
      metricsConfig: json['MetricsConfig'] != null
          ? EventSourceMappingMetricsConfig.fromJson(
              json['MetricsConfig'] as Map<String, dynamic>)
          : null,
      parallelizationFactor: json['ParallelizationFactor'] as int?,
      provisionedPollerConfig: json['ProvisionedPollerConfig'] != null
          ? ProvisionedPollerConfig.fromJson(
              json['ProvisionedPollerConfig'] as Map<String, dynamic>)
          : null,
      queues:
          (json['Queues'] as List?)?.nonNulls.map((e) => e as String).toList(),
      scalingConfig: json['ScalingConfig'] != null
          ? ScalingConfig.fromJson(
              json['ScalingConfig'] as Map<String, dynamic>)
          : null,
      selfManagedEventSource: json['SelfManagedEventSource'] != null
          ? SelfManagedEventSource.fromJson(
              json['SelfManagedEventSource'] as Map<String, dynamic>)
          : null,
      selfManagedKafkaEventSourceConfig:
          json['SelfManagedKafkaEventSourceConfig'] != null
              ? SelfManagedKafkaEventSourceConfig.fromJson(
                  json['SelfManagedKafkaEventSourceConfig']
                      as Map<String, dynamic>)
              : null,
      sourceAccessConfigurations: (json['SourceAccessConfigurations'] as List?)
          ?.nonNulls
          .map((e) =>
              SourceAccessConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      startingPosition: (json['StartingPosition'] as String?)
          ?.let(EventSourcePosition.fromString),
      startingPositionTimestamp:
          timeStampFromJson(json['StartingPositionTimestamp']),
      state: json['State'] as String?,
      stateTransitionReason: json['StateTransitionReason'] as String?,
      topics:
          (json['Topics'] as List?)?.nonNulls.map((e) => e as String).toList(),
      tumblingWindowInSeconds: json['TumblingWindowInSeconds'] as int?,
      uuid: json['UUID'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final amazonManagedKafkaEventSourceConfig =
        this.amazonManagedKafkaEventSourceConfig;
    final batchSize = this.batchSize;
    final bisectBatchOnFunctionError = this.bisectBatchOnFunctionError;
    final destinationConfig = this.destinationConfig;
    final documentDBEventSourceConfig = this.documentDBEventSourceConfig;
    final eventSourceArn = this.eventSourceArn;
    final eventSourceMappingArn = this.eventSourceMappingArn;
    final filterCriteria = this.filterCriteria;
    final filterCriteriaError = this.filterCriteriaError;
    final functionArn = this.functionArn;
    final functionResponseTypes = this.functionResponseTypes;
    final kMSKeyArn = this.kMSKeyArn;
    final lastModified = this.lastModified;
    final lastProcessingResult = this.lastProcessingResult;
    final loggingConfig = this.loggingConfig;
    final maximumBatchingWindowInSeconds = this.maximumBatchingWindowInSeconds;
    final maximumRecordAgeInSeconds = this.maximumRecordAgeInSeconds;
    final maximumRetryAttempts = this.maximumRetryAttempts;
    final metricsConfig = this.metricsConfig;
    final parallelizationFactor = this.parallelizationFactor;
    final provisionedPollerConfig = this.provisionedPollerConfig;
    final queues = this.queues;
    final scalingConfig = this.scalingConfig;
    final selfManagedEventSource = this.selfManagedEventSource;
    final selfManagedKafkaEventSourceConfig =
        this.selfManagedKafkaEventSourceConfig;
    final sourceAccessConfigurations = this.sourceAccessConfigurations;
    final startingPosition = this.startingPosition;
    final startingPositionTimestamp = this.startingPositionTimestamp;
    final state = this.state;
    final stateTransitionReason = this.stateTransitionReason;
    final topics = this.topics;
    final tumblingWindowInSeconds = this.tumblingWindowInSeconds;
    final uuid = this.uuid;
    return {
      if (amazonManagedKafkaEventSourceConfig != null)
        'AmazonManagedKafkaEventSourceConfig':
            amazonManagedKafkaEventSourceConfig,
      if (batchSize != null) 'BatchSize': batchSize,
      if (bisectBatchOnFunctionError != null)
        'BisectBatchOnFunctionError': bisectBatchOnFunctionError,
      if (destinationConfig != null) 'DestinationConfig': destinationConfig,
      if (documentDBEventSourceConfig != null)
        'DocumentDBEventSourceConfig': documentDBEventSourceConfig,
      if (eventSourceArn != null) 'EventSourceArn': eventSourceArn,
      if (eventSourceMappingArn != null)
        'EventSourceMappingArn': eventSourceMappingArn,
      if (filterCriteria != null) 'FilterCriteria': filterCriteria,
      if (filterCriteriaError != null)
        'FilterCriteriaError': filterCriteriaError,
      if (functionArn != null) 'FunctionArn': functionArn,
      if (functionResponseTypes != null)
        'FunctionResponseTypes':
            functionResponseTypes.map((e) => e.value).toList(),
      if (kMSKeyArn != null) 'KMSKeyArn': kMSKeyArn,
      if (lastModified != null)
        'LastModified': unixTimestampToJson(lastModified),
      if (lastProcessingResult != null)
        'LastProcessingResult': lastProcessingResult,
      if (loggingConfig != null) 'LoggingConfig': loggingConfig,
      if (maximumBatchingWindowInSeconds != null)
        'MaximumBatchingWindowInSeconds': maximumBatchingWindowInSeconds,
      if (maximumRecordAgeInSeconds != null)
        'MaximumRecordAgeInSeconds': maximumRecordAgeInSeconds,
      if (maximumRetryAttempts != null)
        'MaximumRetryAttempts': maximumRetryAttempts,
      if (metricsConfig != null) 'MetricsConfig': metricsConfig,
      if (parallelizationFactor != null)
        'ParallelizationFactor': parallelizationFactor,
      if (provisionedPollerConfig != null)
        'ProvisionedPollerConfig': provisionedPollerConfig,
      if (queues != null) 'Queues': queues,
      if (scalingConfig != null) 'ScalingConfig': scalingConfig,
      if (selfManagedEventSource != null)
        'SelfManagedEventSource': selfManagedEventSource,
      if (selfManagedKafkaEventSourceConfig != null)
        'SelfManagedKafkaEventSourceConfig': selfManagedKafkaEventSourceConfig,
      if (sourceAccessConfigurations != null)
        'SourceAccessConfigurations': sourceAccessConfigurations,
      if (startingPosition != null) 'StartingPosition': startingPosition.value,
      if (startingPositionTimestamp != null)
        'StartingPositionTimestamp':
            unixTimestampToJson(startingPositionTimestamp),
      if (state != null) 'State': state,
      if (stateTransitionReason != null)
        'StateTransitionReason': stateTransitionReason,
      if (topics != null) 'Topics': topics,
      if (tumblingWindowInSeconds != null)
        'TumblingWindowInSeconds': tumblingWindowInSeconds,
      if (uuid != null) 'UUID': uuid,
    };
  }
}

/// @nodoc
class ListEventSourceMappingsResponse {
  /// A list of event source mappings.
  final List<EventSourceMappingConfiguration>? eventSourceMappings;

  /// A pagination token that's returned when the response doesn't contain all
  /// event source mappings.
  final String? nextMarker;

  ListEventSourceMappingsResponse({
    this.eventSourceMappings,
    this.nextMarker,
  });

  factory ListEventSourceMappingsResponse.fromJson(Map<String, dynamic> json) {
    return ListEventSourceMappingsResponse(
      eventSourceMappings: (json['EventSourceMappings'] as List?)
          ?.nonNulls
          .map((e) => EventSourceMappingConfiguration.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextMarker: json['NextMarker'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final eventSourceMappings = this.eventSourceMappings;
    final nextMarker = this.nextMarker;
    return {
      if (eventSourceMappings != null)
        'EventSourceMappings': eventSourceMappings,
      if (nextMarker != null) 'NextMarker': nextMarker,
    };
  }
}

/// Details about a function's configuration.
///
/// @nodoc
class FunctionConfiguration {
  /// The instruction set architecture that the function supports. Architecture is
  /// a string array with one of the valid values. The default architecture value
  /// is <code>x86_64</code>.
  final List<Architecture>? architectures;

  /// Configuration for the capacity provider that manages compute resources for
  /// Lambda functions.
  final CapacityProviderConfig? capacityProviderConfig;

  /// The SHA256 hash of the function's deployment package.
  final String? codeSha256;

  /// The size of the function's deployment package, in bytes.
  final int? codeSize;

  /// The SHA256 hash of the function configuration.
  final String? configSha256;

  /// The function's dead letter queue.
  final DeadLetterConfig? deadLetterConfig;

  /// The function's description.
  final String? description;

  /// The function's durable execution configuration settings, if the function is
  /// configured for durability.
  final DurableConfig? durableConfig;

  /// The function's <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-envvars.html">environment
  /// variables</a>. Omitted from CloudTrail logs.
  final EnvironmentResponse? environment;

  /// The size of the function's <code>/tmp</code> directory in MB. The default
  /// value is 512, but can be any whole number between 512 and 10,240 MB. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-function-common.html#configuration-ephemeral-storage">Configuring
  /// ephemeral storage (console)</a>.
  final EphemeralStorage? ephemeralStorage;

  /// Connection settings for an <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-filesystem.html">Amazon
  /// EFS file system</a> or an <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-filesystem.html">Amazon
  /// S3 Files file system</a>.
  final List<FileSystemConfig>? fileSystemConfigs;

  /// The function's Amazon Resource Name (ARN).
  final String? functionArn;

  /// The name of the function.
  final String? functionName;

  /// The function that Lambda calls to begin running your function.
  final String? handler;

  /// The function's image configuration values.
  final ImageConfigResponse? imageConfigResponse;

  /// The ARN of the Key Management Service (KMS) customer managed key that's used
  /// to encrypt the following resources:
  ///
  /// <ul>
  /// <li>
  /// The function's <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-envvars.html#configuration-envvars-encryption">environment
  /// variables</a>.
  /// </li>
  /// <li>
  /// The function's <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/snapstart-security.html">Lambda
  /// SnapStart</a> snapshots.
  /// </li>
  /// <li>
  /// When used with <code>SourceKMSKeyArn</code>, the unzipped version of the
  /// .zip deployment package that's used for function invocations. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/encrypt-zip-package.html#enable-zip-custom-encryption">
  /// Specifying a customer managed key for Lambda</a>.
  /// </li>
  /// <li>
  /// The optimized version of the container image that's used for function
  /// invocations. Note that this is not the same key that's used to protect your
  /// container image in the Amazon Elastic Container Registry (Amazon ECR). For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/images-create.html#images-lifecycle">Function
  /// lifecycle</a>.
  /// </li>
  /// </ul>
  /// If you don't provide a customer managed key, Lambda uses an <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-owned-cmk">Amazon
  /// Web Services owned key</a> or an <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-managed-cmk">Amazon
  /// Web Services managed key</a>.
  final String? kMSKeyArn;

  /// The date and time that the function was last updated, in <a
  /// href="https://www.w3.org/TR/NOTE-datetime">ISO-8601 format</a>
  /// (YYYY-MM-DDThh:mm:ss.sTZD).
  final String? lastModified;

  /// The status of the last update that was performed on the function. This is
  /// first set to <code>Successful</code> after function creation completes.
  final LastUpdateStatus? lastUpdateStatus;

  /// The reason for the last update that was performed on the function.
  final String? lastUpdateStatusReason;

  /// The reason code for the last update that was performed on the function.
  final LastUpdateStatusReasonCode? lastUpdateStatusReasonCode;

  /// The function's <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">layers</a>.
  final List<Layer>? layers;

  /// The function's Amazon CloudWatch Logs configuration settings.
  final LoggingConfig? loggingConfig;

  /// For Lambda@Edge functions, the ARN of the main function.
  final String? masterArn;

  /// The amount of memory available to the function at runtime.
  final int? memorySize;

  /// The type of deployment package. Set to <code>Image</code> for container
  /// image and set <code>Zip</code> for .zip file archive.
  final PackageType? packageType;

  /// The latest updated revision of the function or alias.
  final String? revisionId;

  /// The function's execution role.
  final String? role;

  /// The identifier of the function's <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html">
  /// runtime</a>. Runtime is required if the deployment package is a .zip file
  /// archive. Specifying a runtime results in an error if you're deploying a
  /// function using a container image.
  ///
  /// The following list includes deprecated runtimes. Lambda blocks creating new
  /// functions and updating existing functions shortly after each runtime is
  /// deprecated. For more information, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html#runtime-deprecation-levels">Runtime
  /// use after deprecation</a>.
  ///
  /// For a list of all currently supported runtimes, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html#runtimes-supported">Supported
  /// runtimes</a>.
  final Runtime? runtime;

  /// The ARN of the runtime and any errors that occured.
  final RuntimeVersionConfig? runtimeVersionConfig;

  /// The ARN of the signing job.
  final String? signingJobArn;

  /// The ARN of the signing profile version.
  final String? signingProfileVersionArn;

  /// Set <code>ApplyOn</code> to <code>PublishedVersions</code> to create a
  /// snapshot of the initialized execution environment when you publish a
  /// function version. For more information, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/snapstart.html">Improving
  /// startup performance with Lambda SnapStart</a>.
  final SnapStartResponse? snapStart;

  /// The current state of the function. When the state is <code>Inactive</code>,
  /// you can reactivate the function by invoking it.
  final State? state;

  /// The reason for the function's current state.
  final String? stateReason;

  /// The reason code for the function's current state. When the code is
  /// <code>Creating</code>, you can't invoke or modify the function.
  final StateReasonCode? stateReasonCode;

  /// The function's tenant isolation configuration settings. Determines whether
  /// the Lambda function runs on a shared or dedicated infrastructure per unique
  /// tenant.
  final TenancyConfig? tenancyConfig;

  /// The amount of time in seconds that Lambda allows a function to run before
  /// stopping it.
  final int? timeout;

  /// The function's X-Ray tracing configuration.
  final TracingConfigResponse? tracingConfig;

  /// The version of the Lambda function.
  final String? version;

  /// The function's networking configuration.
  final VpcConfigResponse? vpcConfig;

  FunctionConfiguration({
    this.architectures,
    this.capacityProviderConfig,
    this.codeSha256,
    this.codeSize,
    this.configSha256,
    this.deadLetterConfig,
    this.description,
    this.durableConfig,
    this.environment,
    this.ephemeralStorage,
    this.fileSystemConfigs,
    this.functionArn,
    this.functionName,
    this.handler,
    this.imageConfigResponse,
    this.kMSKeyArn,
    this.lastModified,
    this.lastUpdateStatus,
    this.lastUpdateStatusReason,
    this.lastUpdateStatusReasonCode,
    this.layers,
    this.loggingConfig,
    this.masterArn,
    this.memorySize,
    this.packageType,
    this.revisionId,
    this.role,
    this.runtime,
    this.runtimeVersionConfig,
    this.signingJobArn,
    this.signingProfileVersionArn,
    this.snapStart,
    this.state,
    this.stateReason,
    this.stateReasonCode,
    this.tenancyConfig,
    this.timeout,
    this.tracingConfig,
    this.version,
    this.vpcConfig,
  });

  factory FunctionConfiguration.fromJson(Map<String, dynamic> json) {
    return FunctionConfiguration(
      architectures: (json['Architectures'] as List?)
          ?.nonNulls
          .map((e) => Architecture.fromString((e as String)))
          .toList(),
      capacityProviderConfig: json['CapacityProviderConfig'] != null
          ? CapacityProviderConfig.fromJson(
              json['CapacityProviderConfig'] as Map<String, dynamic>)
          : null,
      codeSha256: json['CodeSha256'] as String?,
      codeSize: json['CodeSize'] as int?,
      configSha256: json['ConfigSha256'] as String?,
      deadLetterConfig: json['DeadLetterConfig'] != null
          ? DeadLetterConfig.fromJson(
              json['DeadLetterConfig'] as Map<String, dynamic>)
          : null,
      description: json['Description'] as String?,
      durableConfig: json['DurableConfig'] != null
          ? DurableConfig.fromJson(
              json['DurableConfig'] as Map<String, dynamic>)
          : null,
      environment: json['Environment'] != null
          ? EnvironmentResponse.fromJson(
              json['Environment'] as Map<String, dynamic>)
          : null,
      ephemeralStorage: json['EphemeralStorage'] != null
          ? EphemeralStorage.fromJson(
              json['EphemeralStorage'] as Map<String, dynamic>)
          : null,
      fileSystemConfigs: (json['FileSystemConfigs'] as List?)
          ?.nonNulls
          .map((e) => FileSystemConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
      functionArn: json['FunctionArn'] as String?,
      functionName: json['FunctionName'] as String?,
      handler: json['Handler'] as String?,
      imageConfigResponse: json['ImageConfigResponse'] != null
          ? ImageConfigResponse.fromJson(
              json['ImageConfigResponse'] as Map<String, dynamic>)
          : null,
      kMSKeyArn: json['KMSKeyArn'] as String?,
      lastModified: json['LastModified'] as String?,
      lastUpdateStatus: (json['LastUpdateStatus'] as String?)
          ?.let(LastUpdateStatus.fromString),
      lastUpdateStatusReason: json['LastUpdateStatusReason'] as String?,
      lastUpdateStatusReasonCode:
          (json['LastUpdateStatusReasonCode'] as String?)
              ?.let(LastUpdateStatusReasonCode.fromString),
      layers: (json['Layers'] as List?)
          ?.nonNulls
          .map((e) => Layer.fromJson(e as Map<String, dynamic>))
          .toList(),
      loggingConfig: json['LoggingConfig'] != null
          ? LoggingConfig.fromJson(
              json['LoggingConfig'] as Map<String, dynamic>)
          : null,
      masterArn: json['MasterArn'] as String?,
      memorySize: json['MemorySize'] as int?,
      packageType:
          (json['PackageType'] as String?)?.let(PackageType.fromString),
      revisionId: json['RevisionId'] as String?,
      role: json['Role'] as String?,
      runtime: (json['Runtime'] as String?)?.let(Runtime.fromString),
      runtimeVersionConfig: json['RuntimeVersionConfig'] != null
          ? RuntimeVersionConfig.fromJson(
              json['RuntimeVersionConfig'] as Map<String, dynamic>)
          : null,
      signingJobArn: json['SigningJobArn'] as String?,
      signingProfileVersionArn: json['SigningProfileVersionArn'] as String?,
      snapStart: json['SnapStart'] != null
          ? SnapStartResponse.fromJson(
              json['SnapStart'] as Map<String, dynamic>)
          : null,
      state: (json['State'] as String?)?.let(State.fromString),
      stateReason: json['StateReason'] as String?,
      stateReasonCode:
          (json['StateReasonCode'] as String?)?.let(StateReasonCode.fromString),
      tenancyConfig: json['TenancyConfig'] != null
          ? TenancyConfig.fromJson(
              json['TenancyConfig'] as Map<String, dynamic>)
          : null,
      timeout: json['Timeout'] as int?,
      tracingConfig: json['TracingConfig'] != null
          ? TracingConfigResponse.fromJson(
              json['TracingConfig'] as Map<String, dynamic>)
          : null,
      version: json['Version'] as String?,
      vpcConfig: json['VpcConfig'] != null
          ? VpcConfigResponse.fromJson(
              json['VpcConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final architectures = this.architectures;
    final capacityProviderConfig = this.capacityProviderConfig;
    final codeSha256 = this.codeSha256;
    final codeSize = this.codeSize;
    final configSha256 = this.configSha256;
    final deadLetterConfig = this.deadLetterConfig;
    final description = this.description;
    final durableConfig = this.durableConfig;
    final environment = this.environment;
    final ephemeralStorage = this.ephemeralStorage;
    final fileSystemConfigs = this.fileSystemConfigs;
    final functionArn = this.functionArn;
    final functionName = this.functionName;
    final handler = this.handler;
    final imageConfigResponse = this.imageConfigResponse;
    final kMSKeyArn = this.kMSKeyArn;
    final lastModified = this.lastModified;
    final lastUpdateStatus = this.lastUpdateStatus;
    final lastUpdateStatusReason = this.lastUpdateStatusReason;
    final lastUpdateStatusReasonCode = this.lastUpdateStatusReasonCode;
    final layers = this.layers;
    final loggingConfig = this.loggingConfig;
    final masterArn = this.masterArn;
    final memorySize = this.memorySize;
    final packageType = this.packageType;
    final revisionId = this.revisionId;
    final role = this.role;
    final runtime = this.runtime;
    final runtimeVersionConfig = this.runtimeVersionConfig;
    final signingJobArn = this.signingJobArn;
    final signingProfileVersionArn = this.signingProfileVersionArn;
    final snapStart = this.snapStart;
    final state = this.state;
    final stateReason = this.stateReason;
    final stateReasonCode = this.stateReasonCode;
    final tenancyConfig = this.tenancyConfig;
    final timeout = this.timeout;
    final tracingConfig = this.tracingConfig;
    final version = this.version;
    final vpcConfig = this.vpcConfig;
    return {
      if (architectures != null)
        'Architectures': architectures.map((e) => e.value).toList(),
      if (capacityProviderConfig != null)
        'CapacityProviderConfig': capacityProviderConfig,
      if (codeSha256 != null) 'CodeSha256': codeSha256,
      if (codeSize != null) 'CodeSize': codeSize,
      if (configSha256 != null) 'ConfigSha256': configSha256,
      if (deadLetterConfig != null) 'DeadLetterConfig': deadLetterConfig,
      if (description != null) 'Description': description,
      if (durableConfig != null) 'DurableConfig': durableConfig,
      if (environment != null) 'Environment': environment,
      if (ephemeralStorage != null) 'EphemeralStorage': ephemeralStorage,
      if (fileSystemConfigs != null) 'FileSystemConfigs': fileSystemConfigs,
      if (functionArn != null) 'FunctionArn': functionArn,
      if (functionName != null) 'FunctionName': functionName,
      if (handler != null) 'Handler': handler,
      if (imageConfigResponse != null)
        'ImageConfigResponse': imageConfigResponse,
      if (kMSKeyArn != null) 'KMSKeyArn': kMSKeyArn,
      if (lastModified != null) 'LastModified': lastModified,
      if (lastUpdateStatus != null) 'LastUpdateStatus': lastUpdateStatus.value,
      if (lastUpdateStatusReason != null)
        'LastUpdateStatusReason': lastUpdateStatusReason,
      if (lastUpdateStatusReasonCode != null)
        'LastUpdateStatusReasonCode': lastUpdateStatusReasonCode.value,
      if (layers != null) 'Layers': layers,
      if (loggingConfig != null) 'LoggingConfig': loggingConfig,
      if (masterArn != null) 'MasterArn': masterArn,
      if (memorySize != null) 'MemorySize': memorySize,
      if (packageType != null) 'PackageType': packageType.value,
      if (revisionId != null) 'RevisionId': revisionId,
      if (role != null) 'Role': role,
      if (runtime != null) 'Runtime': runtime.value,
      if (runtimeVersionConfig != null)
        'RuntimeVersionConfig': runtimeVersionConfig,
      if (signingJobArn != null) 'SigningJobArn': signingJobArn,
      if (signingProfileVersionArn != null)
        'SigningProfileVersionArn': signingProfileVersionArn,
      if (snapStart != null) 'SnapStart': snapStart,
      if (state != null) 'State': state.value,
      if (stateReason != null) 'StateReason': stateReason,
      if (stateReasonCode != null) 'StateReasonCode': stateReasonCode.value,
      if (tenancyConfig != null) 'TenancyConfig': tenancyConfig,
      if (timeout != null) 'Timeout': timeout,
      if (tracingConfig != null) 'TracingConfig': tracingConfig,
      if (version != null) 'Version': version,
      if (vpcConfig != null) 'VpcConfig': vpcConfig,
    };
  }
}

/// A list of Lambda functions.
///
/// @nodoc
class ListFunctionsResponse {
  /// A list of Lambda functions.
  final List<FunctionConfiguration>? functions;

  /// The pagination token that's included if more results are available.
  final String? nextMarker;

  ListFunctionsResponse({
    this.functions,
    this.nextMarker,
  });

  factory ListFunctionsResponse.fromJson(Map<String, dynamic> json) {
    return ListFunctionsResponse(
      functions: (json['Functions'] as List?)
          ?.nonNulls
          .map((e) => FunctionConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextMarker: json['NextMarker'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final functions = this.functions;
    final nextMarker = this.nextMarker;
    return {
      if (functions != null) 'Functions': functions,
      if (nextMarker != null) 'NextMarker': nextMarker,
    };
  }
}

/// @nodoc
class CreateFunctionUrlConfigResponse {
  /// The type of authentication that your function URL uses. Set to
  /// <code>AWS_IAM</code> if you want to restrict access to authenticated users
  /// only. Set to <code>NONE</code> if you want to bypass IAM authentication to
  /// create a public endpoint. For more information, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/urls-auth.html">Control
  /// access to Lambda function URLs</a>.
  final FunctionUrlAuthType authType;

  /// When the function URL was created, in <a
  /// href="https://www.w3.org/TR/NOTE-datetime">ISO-8601 format</a>
  /// (YYYY-MM-DDThh:mm:ss.sTZD).
  final String creationTime;

  /// The Amazon Resource Name (ARN) of your function.
  final String functionArn;

  /// The HTTP URL endpoint for your function.
  final String functionUrl;

  /// The <a
  /// href="https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS">cross-origin
  /// resource sharing (CORS)</a> settings for your function URL.
  final Cors? cors;

  /// Use one of the following options:
  ///
  /// <ul>
  /// <li>
  /// <code>BUFFERED</code> – This is the default option. Lambda invokes your
  /// function using the <code>Invoke</code> API operation. Invocation results are
  /// available when the payload is complete. The maximum payload size is 6 MB.
  /// </li>
  /// <li>
  /// <code>RESPONSE_STREAM</code> – Your function streams payload results as they
  /// become available. Lambda invokes your function using the
  /// <code>InvokeWithResponseStream</code> API operation. The maximum response
  /// payload size is 200 MB.
  /// </li>
  /// </ul>
  final InvokeMode? invokeMode;

  CreateFunctionUrlConfigResponse({
    required this.authType,
    required this.creationTime,
    required this.functionArn,
    required this.functionUrl,
    this.cors,
    this.invokeMode,
  });

  factory CreateFunctionUrlConfigResponse.fromJson(Map<String, dynamic> json) {
    return CreateFunctionUrlConfigResponse(
      authType:
          FunctionUrlAuthType.fromString((json['AuthType'] as String?) ?? ''),
      creationTime: (json['CreationTime'] as String?) ?? '',
      functionArn: (json['FunctionArn'] as String?) ?? '',
      functionUrl: (json['FunctionUrl'] as String?) ?? '',
      cors: json['Cors'] != null
          ? Cors.fromJson(json['Cors'] as Map<String, dynamic>)
          : null,
      invokeMode: (json['InvokeMode'] as String?)?.let(InvokeMode.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final authType = this.authType;
    final creationTime = this.creationTime;
    final functionArn = this.functionArn;
    final functionUrl = this.functionUrl;
    final cors = this.cors;
    final invokeMode = this.invokeMode;
    return {
      'AuthType': authType.value,
      'CreationTime': creationTime,
      'FunctionArn': functionArn,
      'FunctionUrl': functionUrl,
      if (cors != null) 'Cors': cors,
      if (invokeMode != null) 'InvokeMode': invokeMode.value,
    };
  }
}

/// @nodoc
class GetFunctionConcurrencyResponse {
  /// The number of simultaneous executions that are reserved for the function.
  final int? reservedConcurrentExecutions;

  GetFunctionConcurrencyResponse({
    this.reservedConcurrentExecutions,
  });

  factory GetFunctionConcurrencyResponse.fromJson(Map<String, dynamic> json) {
    return GetFunctionConcurrencyResponse(
      reservedConcurrentExecutions:
          json['ReservedConcurrentExecutions'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final reservedConcurrentExecutions = this.reservedConcurrentExecutions;
    return {
      if (reservedConcurrentExecutions != null)
        'ReservedConcurrentExecutions': reservedConcurrentExecutions,
    };
  }
}

/// @nodoc
class GetFunctionUrlConfigResponse {
  /// The type of authentication that your function URL uses. Set to
  /// <code>AWS_IAM</code> if you want to restrict access to authenticated users
  /// only. Set to <code>NONE</code> if you want to bypass IAM authentication to
  /// create a public endpoint. For more information, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/urls-auth.html">Control
  /// access to Lambda function URLs</a>.
  final FunctionUrlAuthType authType;

  /// When the function URL was created, in <a
  /// href="https://www.w3.org/TR/NOTE-datetime">ISO-8601 format</a>
  /// (YYYY-MM-DDThh:mm:ss.sTZD).
  final String creationTime;

  /// The Amazon Resource Name (ARN) of your function.
  final String functionArn;

  /// The HTTP URL endpoint for your function.
  final String functionUrl;

  /// When the function URL configuration was last updated, in <a
  /// href="https://www.w3.org/TR/NOTE-datetime">ISO-8601 format</a>
  /// (YYYY-MM-DDThh:mm:ss.sTZD).
  final String lastModifiedTime;

  /// The <a
  /// href="https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS">cross-origin
  /// resource sharing (CORS)</a> settings for your function URL.
  final Cors? cors;

  /// Use one of the following options:
  ///
  /// <ul>
  /// <li>
  /// <code>BUFFERED</code> – This is the default option. Lambda invokes your
  /// function using the <code>Invoke</code> API operation. Invocation results are
  /// available when the payload is complete. The maximum payload size is 6 MB.
  /// </li>
  /// <li>
  /// <code>RESPONSE_STREAM</code> – Your function streams payload results as they
  /// become available. Lambda invokes your function using the
  /// <code>InvokeWithResponseStream</code> API operation. The maximum response
  /// payload size is 200 MB.
  /// </li>
  /// </ul>
  final InvokeMode? invokeMode;

  GetFunctionUrlConfigResponse({
    required this.authType,
    required this.creationTime,
    required this.functionArn,
    required this.functionUrl,
    required this.lastModifiedTime,
    this.cors,
    this.invokeMode,
  });

  factory GetFunctionUrlConfigResponse.fromJson(Map<String, dynamic> json) {
    return GetFunctionUrlConfigResponse(
      authType:
          FunctionUrlAuthType.fromString((json['AuthType'] as String?) ?? ''),
      creationTime: (json['CreationTime'] as String?) ?? '',
      functionArn: (json['FunctionArn'] as String?) ?? '',
      functionUrl: (json['FunctionUrl'] as String?) ?? '',
      lastModifiedTime: (json['LastModifiedTime'] as String?) ?? '',
      cors: json['Cors'] != null
          ? Cors.fromJson(json['Cors'] as Map<String, dynamic>)
          : null,
      invokeMode: (json['InvokeMode'] as String?)?.let(InvokeMode.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final authType = this.authType;
    final creationTime = this.creationTime;
    final functionArn = this.functionArn;
    final functionUrl = this.functionUrl;
    final lastModifiedTime = this.lastModifiedTime;
    final cors = this.cors;
    final invokeMode = this.invokeMode;
    return {
      'AuthType': authType.value,
      'CreationTime': creationTime,
      'FunctionArn': functionArn,
      'FunctionUrl': functionUrl,
      'LastModifiedTime': lastModifiedTime,
      if (cors != null) 'Cors': cors,
      if (invokeMode != null) 'InvokeMode': invokeMode.value,
    };
  }
}

/// @nodoc
class ListFunctionUrlConfigsResponse {
  /// A list of function URL configurations.
  final List<FunctionUrlConfig> functionUrlConfigs;

  /// The pagination token that's included if more results are available.
  final String? nextMarker;

  ListFunctionUrlConfigsResponse({
    required this.functionUrlConfigs,
    this.nextMarker,
  });

  factory ListFunctionUrlConfigsResponse.fromJson(Map<String, dynamic> json) {
    return ListFunctionUrlConfigsResponse(
      functionUrlConfigs: ((json['FunctionUrlConfigs'] as List?) ?? const [])
          .nonNulls
          .map((e) => FunctionUrlConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextMarker: json['NextMarker'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final functionUrlConfigs = this.functionUrlConfigs;
    final nextMarker = this.nextMarker;
    return {
      'FunctionUrlConfigs': functionUrlConfigs,
      if (nextMarker != null) 'NextMarker': nextMarker,
    };
  }
}

/// @nodoc
class ListProvisionedConcurrencyConfigsResponse {
  /// The pagination token that's included if more results are available.
  final String? nextMarker;

  /// A list of provisioned concurrency configurations.
  final List<ProvisionedConcurrencyConfigListItem>?
      provisionedConcurrencyConfigs;

  ListProvisionedConcurrencyConfigsResponse({
    this.nextMarker,
    this.provisionedConcurrencyConfigs,
  });

  factory ListProvisionedConcurrencyConfigsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListProvisionedConcurrencyConfigsResponse(
      nextMarker: json['NextMarker'] as String?,
      provisionedConcurrencyConfigs:
          (json['ProvisionedConcurrencyConfigs'] as List?)
              ?.nonNulls
              .map((e) => ProvisionedConcurrencyConfigListItem.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextMarker = this.nextMarker;
    final provisionedConcurrencyConfigs = this.provisionedConcurrencyConfigs;
    return {
      if (nextMarker != null) 'NextMarker': nextMarker,
      if (provisionedConcurrencyConfigs != null)
        'ProvisionedConcurrencyConfigs': provisionedConcurrencyConfigs,
    };
  }
}

/// @nodoc
class Concurrency {
  /// The number of concurrent executions that are reserved for this function. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-concurrency.html">Managing
  /// Lambda reserved concurrency</a>.
  final int? reservedConcurrentExecutions;

  Concurrency({
    this.reservedConcurrentExecutions,
  });

  factory Concurrency.fromJson(Map<String, dynamic> json) {
    return Concurrency(
      reservedConcurrentExecutions:
          json['ReservedConcurrentExecutions'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final reservedConcurrentExecutions = this.reservedConcurrentExecutions;
    return {
      if (reservedConcurrentExecutions != null)
        'ReservedConcurrentExecutions': reservedConcurrentExecutions,
    };
  }
}

/// @nodoc
class UpdateFunctionUrlConfigResponse {
  /// The type of authentication that your function URL uses. Set to
  /// <code>AWS_IAM</code> if you want to restrict access to authenticated users
  /// only. Set to <code>NONE</code> if you want to bypass IAM authentication to
  /// create a public endpoint. For more information, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/urls-auth.html">Control
  /// access to Lambda function URLs</a>.
  final FunctionUrlAuthType authType;

  /// When the function URL was created, in <a
  /// href="https://www.w3.org/TR/NOTE-datetime">ISO-8601 format</a>
  /// (YYYY-MM-DDThh:mm:ss.sTZD).
  final String creationTime;

  /// The Amazon Resource Name (ARN) of your function.
  final String functionArn;

  /// The HTTP URL endpoint for your function.
  final String functionUrl;

  /// When the function URL configuration was last updated, in <a
  /// href="https://www.w3.org/TR/NOTE-datetime">ISO-8601 format</a>
  /// (YYYY-MM-DDThh:mm:ss.sTZD).
  final String lastModifiedTime;

  /// The <a
  /// href="https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS">cross-origin
  /// resource sharing (CORS)</a> settings for your function URL.
  final Cors? cors;

  /// Use one of the following options:
  ///
  /// <ul>
  /// <li>
  /// <code>BUFFERED</code> – This is the default option. Lambda invokes your
  /// function using the <code>Invoke</code> API operation. Invocation results are
  /// available when the payload is complete. The maximum payload size is 6 MB.
  /// </li>
  /// <li>
  /// <code>RESPONSE_STREAM</code> – Your function streams payload results as they
  /// become available. Lambda invokes your function using the
  /// <code>InvokeWithResponseStream</code> API operation. The maximum response
  /// payload size is 200 MB.
  /// </li>
  /// </ul>
  final InvokeMode? invokeMode;

  UpdateFunctionUrlConfigResponse({
    required this.authType,
    required this.creationTime,
    required this.functionArn,
    required this.functionUrl,
    required this.lastModifiedTime,
    this.cors,
    this.invokeMode,
  });

  factory UpdateFunctionUrlConfigResponse.fromJson(Map<String, dynamic> json) {
    return UpdateFunctionUrlConfigResponse(
      authType:
          FunctionUrlAuthType.fromString((json['AuthType'] as String?) ?? ''),
      creationTime: (json['CreationTime'] as String?) ?? '',
      functionArn: (json['FunctionArn'] as String?) ?? '',
      functionUrl: (json['FunctionUrl'] as String?) ?? '',
      lastModifiedTime: (json['LastModifiedTime'] as String?) ?? '',
      cors: json['Cors'] != null
          ? Cors.fromJson(json['Cors'] as Map<String, dynamic>)
          : null,
      invokeMode: (json['InvokeMode'] as String?)?.let(InvokeMode.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final authType = this.authType;
    final creationTime = this.creationTime;
    final functionArn = this.functionArn;
    final functionUrl = this.functionUrl;
    final lastModifiedTime = this.lastModifiedTime;
    final cors = this.cors;
    final invokeMode = this.invokeMode;
    return {
      'AuthType': authType.value,
      'CreationTime': creationTime,
      'FunctionArn': functionArn,
      'FunctionUrl': functionUrl,
      'LastModifiedTime': lastModifiedTime,
      if (cors != null) 'Cors': cors,
      if (invokeMode != null) 'InvokeMode': invokeMode.value,
    };
  }
}

/// @nodoc
class GetFunctionResponse {
  /// The deployment package of the function or version.
  final FunctionCodeLocation? code;

  /// The function's <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/concurrent-executions.html">reserved
  /// concurrency</a>.
  final Concurrency? concurrency;

  /// The configuration of the function or version.
  final FunctionConfiguration? configuration;

  /// The function's <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/tagging.html">tags</a>.
  /// Lambda returns tag data only if you have explicit allow permissions for <a
  /// href="https://docs.aws.amazon.com/lambda/latest/api/API_ListTags.html">lambda:ListTags</a>.
  final Map<String, String>? tags;

  /// An object that contains details about an error related to retrieving tags.
  final TagsError? tagsError;

  GetFunctionResponse({
    this.code,
    this.concurrency,
    this.configuration,
    this.tags,
    this.tagsError,
  });

  factory GetFunctionResponse.fromJson(Map<String, dynamic> json) {
    return GetFunctionResponse(
      code: json['Code'] != null
          ? FunctionCodeLocation.fromJson(json['Code'] as Map<String, dynamic>)
          : null,
      concurrency: json['Concurrency'] != null
          ? Concurrency.fromJson(json['Concurrency'] as Map<String, dynamic>)
          : null,
      configuration: json['Configuration'] != null
          ? FunctionConfiguration.fromJson(
              json['Configuration'] as Map<String, dynamic>)
          : null,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      tagsError: json['TagsError'] != null
          ? TagsError.fromJson(json['TagsError'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final concurrency = this.concurrency;
    final configuration = this.configuration;
    final tags = this.tags;
    final tagsError = this.tagsError;
    return {
      if (code != null) 'Code': code,
      if (concurrency != null) 'Concurrency': concurrency,
      if (configuration != null) 'Configuration': configuration,
      if (tags != null) 'Tags': tags,
      if (tagsError != null) 'TagsError': tagsError,
    };
  }
}

/// @nodoc
class GetFunctionCodeSigningConfigResponse {
  /// The The Amazon Resource Name (ARN) of the code signing configuration.
  final String codeSigningConfigArn;

  /// The name or ARN of the Lambda function.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> - <code>MyFunction</code>.
  /// </li>
  /// <li>
  /// <b>Function ARN</b> -
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.
  /// </li>
  /// </ul>
  /// The length constraint applies only to the full ARN. If you specify only the
  /// function name, it is limited to 64 characters in length.
  final String functionName;

  GetFunctionCodeSigningConfigResponse({
    required this.codeSigningConfigArn,
    required this.functionName,
  });

  factory GetFunctionCodeSigningConfigResponse.fromJson(
      Map<String, dynamic> json) {
    return GetFunctionCodeSigningConfigResponse(
      codeSigningConfigArn: (json['CodeSigningConfigArn'] as String?) ?? '',
      functionName: (json['FunctionName'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final codeSigningConfigArn = this.codeSigningConfigArn;
    final functionName = this.functionName;
    return {
      'CodeSigningConfigArn': codeSigningConfigArn,
      'FunctionName': functionName,
    };
  }
}

/// @nodoc
class GetFunctionRecursionConfigResponse {
  /// If your function's recursive loop detection configuration is
  /// <code>Allow</code>, Lambda doesn't take any action when it detects your
  /// function being invoked as part of a recursive loop.
  ///
  /// If your function's recursive loop detection configuration is
  /// <code>Terminate</code>, Lambda stops your function being invoked and
  /// notifies you when it detects your function being invoked as part of a
  /// recursive loop.
  ///
  /// By default, Lambda sets your function's configuration to
  /// <code>Terminate</code>. You can update this configuration using the
  /// <a>PutFunctionRecursionConfig</a> action.
  final RecursiveLoop? recursiveLoop;

  GetFunctionRecursionConfigResponse({
    this.recursiveLoop,
  });

  factory GetFunctionRecursionConfigResponse.fromJson(
      Map<String, dynamic> json) {
    return GetFunctionRecursionConfigResponse(
      recursiveLoop:
          (json['RecursiveLoop'] as String?)?.let(RecursiveLoop.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final recursiveLoop = this.recursiveLoop;
    return {
      if (recursiveLoop != null) 'RecursiveLoop': recursiveLoop.value,
    };
  }
}

/// @nodoc
class GetFunctionScalingConfigResponse {
  /// The scaling configuration that is currently applied to the function. This
  /// represents the actual scaling settings in effect.
  final FunctionScalingConfig? appliedFunctionScalingConfig;

  /// The Amazon Resource Name (ARN) of the function.
  final String? functionArn;

  /// The scaling configuration that was requested for the function.
  final FunctionScalingConfig? requestedFunctionScalingConfig;

  GetFunctionScalingConfigResponse({
    this.appliedFunctionScalingConfig,
    this.functionArn,
    this.requestedFunctionScalingConfig,
  });

  factory GetFunctionScalingConfigResponse.fromJson(Map<String, dynamic> json) {
    return GetFunctionScalingConfigResponse(
      appliedFunctionScalingConfig: json['AppliedFunctionScalingConfig'] != null
          ? FunctionScalingConfig.fromJson(
              json['AppliedFunctionScalingConfig'] as Map<String, dynamic>)
          : null,
      functionArn: json['FunctionArn'] as String?,
      requestedFunctionScalingConfig: json['RequestedFunctionScalingConfig'] !=
              null
          ? FunctionScalingConfig.fromJson(
              json['RequestedFunctionScalingConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final appliedFunctionScalingConfig = this.appliedFunctionScalingConfig;
    final functionArn = this.functionArn;
    final requestedFunctionScalingConfig = this.requestedFunctionScalingConfig;
    return {
      if (appliedFunctionScalingConfig != null)
        'AppliedFunctionScalingConfig': appliedFunctionScalingConfig,
      if (functionArn != null) 'FunctionArn': functionArn,
      if (requestedFunctionScalingConfig != null)
        'RequestedFunctionScalingConfig': requestedFunctionScalingConfig,
    };
  }
}

/// @nodoc
class GetPolicyResponse {
  /// The resource-based policy.
  final String? policy;

  /// A unique identifier for the current revision of the policy.
  final String? revisionId;

  GetPolicyResponse({
    this.policy,
    this.revisionId,
  });

  factory GetPolicyResponse.fromJson(Map<String, dynamic> json) {
    return GetPolicyResponse(
      policy: json['Policy'] as String?,
      revisionId: json['RevisionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final policy = this.policy;
    final revisionId = this.revisionId;
    return {
      if (policy != null) 'Policy': policy,
      if (revisionId != null) 'RevisionId': revisionId,
    };
  }
}

/// @nodoc
class GetRuntimeManagementConfigResponse {
  /// The Amazon Resource Name (ARN) of your function.
  final String? functionArn;

  /// The ARN of the runtime the function is configured to use. If the runtime
  /// update mode is <b>Manual</b>, the ARN is returned, otherwise
  /// <code>null</code> is returned.
  final String? runtimeVersionArn;

  /// The current runtime update mode of the function.
  final UpdateRuntimeOn? updateRuntimeOn;

  GetRuntimeManagementConfigResponse({
    this.functionArn,
    this.runtimeVersionArn,
    this.updateRuntimeOn,
  });

  factory GetRuntimeManagementConfigResponse.fromJson(
      Map<String, dynamic> json) {
    return GetRuntimeManagementConfigResponse(
      functionArn: json['FunctionArn'] as String?,
      runtimeVersionArn: json['RuntimeVersionArn'] as String?,
      updateRuntimeOn:
          (json['UpdateRuntimeOn'] as String?)?.let(UpdateRuntimeOn.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final functionArn = this.functionArn;
    final runtimeVersionArn = this.runtimeVersionArn;
    final updateRuntimeOn = this.updateRuntimeOn;
    return {
      if (functionArn != null) 'FunctionArn': functionArn,
      if (runtimeVersionArn != null) 'RuntimeVersionArn': runtimeVersionArn,
      if (updateRuntimeOn != null) 'UpdateRuntimeOn': updateRuntimeOn.value,
    };
  }
}

/// @nodoc
class InvocationResponse {
  /// The ARN of the durable execution that was started. This is returned when
  /// invoking a durable function and provides a unique identifier for tracking
  /// the execution.
  final String? durableExecutionArn;

  /// The version of the function that executed. When you invoke a function with
  /// an alias, this indicates which version the alias resolved to.
  final String? executedVersion;

  /// If present, indicates that an error occurred during function execution.
  /// Details about the error are included in the response payload.
  final String? functionError;

  /// The last 4 KB of the execution log, which is base64-encoded.
  final String? logResult;

  /// The response from the function, or an error object.
  final Uint8List? payload;

  /// The HTTP status code is in the 200 range for a successful request. For the
  /// <code>RequestResponse</code> invocation type, this status code is 200. For
  /// the <code>Event</code> invocation type, this status code is 202. For the
  /// <code>DryRun</code> invocation type, the status code is 204.
  final int? statusCode;

  InvocationResponse({
    this.durableExecutionArn,
    this.executedVersion,
    this.functionError,
    this.logResult,
    this.payload,
    this.statusCode,
  });

  Map<String, dynamic> toJson() {
    final durableExecutionArn = this.durableExecutionArn;
    final executedVersion = this.executedVersion;
    final functionError = this.functionError;
    final logResult = this.logResult;
    final payload = this.payload;
    final statusCode = this.statusCode;
    return {
      if (payload != null) 'Payload': base64Encode(payload),
    };
  }
}

/// A success response (<code>202 Accepted</code>) indicates that the request is
/// queued for invocation.
///
/// @nodoc
class InvokeAsyncResponse {
  /// The status code.
  final int? status;

  InvokeAsyncResponse({
    this.status,
  });

  factory InvokeAsyncResponse.fromJson(Map<String, dynamic> json) {
    return InvokeAsyncResponse(
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {};
  }
}

/// @nodoc
class InvokeWithResponseStreamResponse {
  /// The stream of response payloads.
  final InvokeWithResponseStreamResponseEvent? eventStream;

  /// The version of the function that executed. When you invoke a function with
  /// an alias, this indicates which version the alias resolved to.
  final String? executedVersion;

  /// The type of data the stream is returning.
  final String? responseStreamContentType;

  /// For a successful request, the HTTP status code is in the 200 range. For the
  /// <code>RequestResponse</code> invocation type, this status code is 200. For
  /// the <code>DryRun</code> invocation type, this status code is 204.
  final int? statusCode;

  InvokeWithResponseStreamResponse({
    this.eventStream,
    this.executedVersion,
    this.responseStreamContentType,
    this.statusCode,
  });

  Map<String, dynamic> toJson() {
    final eventStream = this.eventStream;
    final executedVersion = this.executedVersion;
    final responseStreamContentType = this.responseStreamContentType;
    final statusCode = this.statusCode;
    return {
      if (eventStream != null) 'EventStream': eventStream,
    };
  }
}

/// @nodoc
class PutFunctionCodeSigningConfigResponse {
  /// The The Amazon Resource Name (ARN) of the code signing configuration.
  final String codeSigningConfigArn;

  /// The name or ARN of the Lambda function.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> - <code>MyFunction</code>.
  /// </li>
  /// <li>
  /// <b>Function ARN</b> -
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.
  /// </li>
  /// </ul>
  /// The length constraint applies only to the full ARN. If you specify only the
  /// function name, it is limited to 64 characters in length.
  final String functionName;

  PutFunctionCodeSigningConfigResponse({
    required this.codeSigningConfigArn,
    required this.functionName,
  });

  factory PutFunctionCodeSigningConfigResponse.fromJson(
      Map<String, dynamic> json) {
    return PutFunctionCodeSigningConfigResponse(
      codeSigningConfigArn: (json['CodeSigningConfigArn'] as String?) ?? '',
      functionName: (json['FunctionName'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final codeSigningConfigArn = this.codeSigningConfigArn;
    final functionName = this.functionName;
    return {
      'CodeSigningConfigArn': codeSigningConfigArn,
      'FunctionName': functionName,
    };
  }
}

/// @nodoc
class PutFunctionRecursionConfigResponse {
  /// The status of your function's recursive loop detection configuration.
  ///
  /// When this value is set to <code>Allow</code>and Lambda detects your function
  /// being invoked as part of a recursive loop, it doesn't take any action.
  ///
  /// When this value is set to <code>Terminate</code> and Lambda detects your
  /// function being invoked as part of a recursive loop, it stops your function
  /// being invoked and notifies you.
  final RecursiveLoop? recursiveLoop;

  PutFunctionRecursionConfigResponse({
    this.recursiveLoop,
  });

  factory PutFunctionRecursionConfigResponse.fromJson(
      Map<String, dynamic> json) {
    return PutFunctionRecursionConfigResponse(
      recursiveLoop:
          (json['RecursiveLoop'] as String?)?.let(RecursiveLoop.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final recursiveLoop = this.recursiveLoop;
    return {
      if (recursiveLoop != null) 'RecursiveLoop': recursiveLoop.value,
    };
  }
}

/// @nodoc
class PutFunctionScalingConfigResponse {
  /// The current state of the function after applying the scaling configuration.
  final State? functionState;

  PutFunctionScalingConfigResponse({
    this.functionState,
  });

  factory PutFunctionScalingConfigResponse.fromJson(Map<String, dynamic> json) {
    return PutFunctionScalingConfigResponse(
      functionState: (json['FunctionState'] as String?)?.let(State.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final functionState = this.functionState;
    return {
      if (functionState != null) 'FunctionState': functionState.value,
    };
  }
}

/// @nodoc
class PutRuntimeManagementConfigResponse {
  /// The ARN of the function
  final String functionArn;

  /// The runtime update mode.
  final UpdateRuntimeOn updateRuntimeOn;

  /// The ARN of the runtime the function is configured to use. If the runtime
  /// update mode is <b>manual</b>, the ARN is returned, otherwise
  /// <code>null</code> is returned.
  final String? runtimeVersionArn;

  PutRuntimeManagementConfigResponse({
    required this.functionArn,
    required this.updateRuntimeOn,
    this.runtimeVersionArn,
  });

  factory PutRuntimeManagementConfigResponse.fromJson(
      Map<String, dynamic> json) {
    return PutRuntimeManagementConfigResponse(
      functionArn: (json['FunctionArn'] as String?) ?? '',
      updateRuntimeOn: UpdateRuntimeOn.fromString(
          (json['UpdateRuntimeOn'] as String?) ?? ''),
      runtimeVersionArn: json['RuntimeVersionArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final functionArn = this.functionArn;
    final updateRuntimeOn = this.updateRuntimeOn;
    final runtimeVersionArn = this.runtimeVersionArn;
    return {
      'FunctionArn': functionArn,
      'UpdateRuntimeOn': updateRuntimeOn.value,
      if (runtimeVersionArn != null) 'RuntimeVersionArn': runtimeVersionArn,
    };
  }
}

/// Provides configuration information about a Lambda function <a
/// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-aliases.html">alias</a>.
///
/// @nodoc
class AliasConfiguration {
  /// The Amazon Resource Name (ARN) of the alias.
  final String? aliasArn;

  /// A description of the alias.
  final String? description;

  /// The function version that the alias invokes.
  final String? functionVersion;

  /// The name of the alias.
  final String? name;

  /// A unique identifier that changes when you update the alias.
  final String? revisionId;

  /// The <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-traffic-shifting-using-aliases.html">routing
  /// configuration</a> of the alias.
  final AliasRoutingConfiguration? routingConfig;

  AliasConfiguration({
    this.aliasArn,
    this.description,
    this.functionVersion,
    this.name,
    this.revisionId,
    this.routingConfig,
  });

  factory AliasConfiguration.fromJson(Map<String, dynamic> json) {
    return AliasConfiguration(
      aliasArn: json['AliasArn'] as String?,
      description: json['Description'] as String?,
      functionVersion: json['FunctionVersion'] as String?,
      name: json['Name'] as String?,
      revisionId: json['RevisionId'] as String?,
      routingConfig: json['RoutingConfig'] != null
          ? AliasRoutingConfiguration.fromJson(
              json['RoutingConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final aliasArn = this.aliasArn;
    final description = this.description;
    final functionVersion = this.functionVersion;
    final name = this.name;
    final revisionId = this.revisionId;
    final routingConfig = this.routingConfig;
    return {
      if (aliasArn != null) 'AliasArn': aliasArn,
      if (description != null) 'Description': description,
      if (functionVersion != null) 'FunctionVersion': functionVersion,
      if (name != null) 'Name': name,
      if (revisionId != null) 'RevisionId': revisionId,
      if (routingConfig != null) 'RoutingConfig': routingConfig,
    };
  }
}

/// @nodoc
class ListAliasesResponse {
  /// A list of aliases.
  final List<AliasConfiguration>? aliases;

  /// The pagination token that's included if more results are available.
  final String? nextMarker;

  ListAliasesResponse({
    this.aliases,
    this.nextMarker,
  });

  factory ListAliasesResponse.fromJson(Map<String, dynamic> json) {
    return ListAliasesResponse(
      aliases: (json['Aliases'] as List?)
          ?.nonNulls
          .map((e) => AliasConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextMarker: json['NextMarker'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final aliases = this.aliases;
    final nextMarker = this.nextMarker;
    return {
      if (aliases != null) 'Aliases': aliases,
      if (nextMarker != null) 'NextMarker': nextMarker,
    };
  }
}

/// @nodoc
class ListVersionsByFunctionResponse {
  /// The pagination token that's included if more results are available.
  final String? nextMarker;

  /// A list of Lambda function versions.
  final List<FunctionConfiguration>? versions;

  ListVersionsByFunctionResponse({
    this.nextMarker,
    this.versions,
  });

  factory ListVersionsByFunctionResponse.fromJson(Map<String, dynamic> json) {
    return ListVersionsByFunctionResponse(
      nextMarker: json['NextMarker'] as String?,
      versions: (json['Versions'] as List?)
          ?.nonNulls
          .map((e) => FunctionConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextMarker = this.nextMarker;
    final versions = this.versions;
    return {
      if (nextMarker != null) 'NextMarker': nextMarker,
      if (versions != null) 'Versions': versions,
    };
  }
}

/// @nodoc
class ListLayersResponse {
  /// A list of function layers.
  final List<LayersListItem>? layers;

  /// A pagination token returned when the response doesn't contain all layers.
  final String? nextMarker;

  ListLayersResponse({
    this.layers,
    this.nextMarker,
  });

  factory ListLayersResponse.fromJson(Map<String, dynamic> json) {
    return ListLayersResponse(
      layers: (json['Layers'] as List?)
          ?.nonNulls
          .map((e) => LayersListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextMarker: json['NextMarker'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final layers = this.layers;
    final nextMarker = this.nextMarker;
    return {
      if (layers != null) 'Layers': layers,
      if (nextMarker != null) 'NextMarker': nextMarker,
    };
  }
}

/// @nodoc
class ListLayerVersionsResponse {
  /// A list of versions.
  final List<LayerVersionsListItem>? layerVersions;

  /// A pagination token returned when the response doesn't contain all versions.
  final String? nextMarker;

  ListLayerVersionsResponse({
    this.layerVersions,
    this.nextMarker,
  });

  factory ListLayerVersionsResponse.fromJson(Map<String, dynamic> json) {
    return ListLayerVersionsResponse(
      layerVersions: (json['LayerVersions'] as List?)
          ?.nonNulls
          .map((e) => LayerVersionsListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextMarker: json['NextMarker'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final layerVersions = this.layerVersions;
    final nextMarker = this.nextMarker;
    return {
      if (layerVersions != null) 'LayerVersions': layerVersions,
      if (nextMarker != null) 'NextMarker': nextMarker,
    };
  }
}

/// @nodoc
class AddLayerVersionPermissionResponse {
  /// A unique identifier for the current revision of the policy.
  final String? revisionId;

  /// The permission statement.
  final String? statement;

  AddLayerVersionPermissionResponse({
    this.revisionId,
    this.statement,
  });

  factory AddLayerVersionPermissionResponse.fromJson(
      Map<String, dynamic> json) {
    return AddLayerVersionPermissionResponse(
      revisionId: json['RevisionId'] as String?,
      statement: json['Statement'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final revisionId = this.revisionId;
    final statement = this.statement;
    return {
      if (revisionId != null) 'RevisionId': revisionId,
      if (statement != null) 'Statement': statement,
    };
  }
}

/// @nodoc
class GetLayerVersionResponse {
  /// A list of compatible <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/foundation-arch.html">instruction
  /// set architectures</a>.
  final List<Architecture>? compatibleArchitectures;

  /// The layer's compatible runtimes.
  ///
  /// The following list includes deprecated runtimes. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html#runtime-deprecation-levels">Runtime
  /// use after deprecation</a>.
  ///
  /// For a list of all currently supported runtimes, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html#runtimes-supported">Supported
  /// runtimes</a>.
  final List<Runtime>? compatibleRuntimes;

  /// Details about the layer version.
  final LayerVersionContentOutput? content;

  /// The date that the layer version was created, in <a
  /// href="https://www.w3.org/TR/NOTE-datetime">ISO-8601 format</a>
  /// (YYYY-MM-DDThh:mm:ss.sTZD).
  final String? createdDate;

  /// The description of the version.
  final String? description;

  /// The ARN of the layer.
  final String? layerArn;

  /// The ARN of the layer version.
  final String? layerVersionArn;

  /// The layer's software license.
  final String? licenseInfo;

  /// The version number.
  final int? version;

  GetLayerVersionResponse({
    this.compatibleArchitectures,
    this.compatibleRuntimes,
    this.content,
    this.createdDate,
    this.description,
    this.layerArn,
    this.layerVersionArn,
    this.licenseInfo,
    this.version,
  });

  factory GetLayerVersionResponse.fromJson(Map<String, dynamic> json) {
    return GetLayerVersionResponse(
      compatibleArchitectures: (json['CompatibleArchitectures'] as List?)
          ?.nonNulls
          .map((e) => Architecture.fromString((e as String)))
          .toList(),
      compatibleRuntimes: (json['CompatibleRuntimes'] as List?)
          ?.nonNulls
          .map((e) => Runtime.fromString((e as String)))
          .toList(),
      content: json['Content'] != null
          ? LayerVersionContentOutput.fromJson(
              json['Content'] as Map<String, dynamic>)
          : null,
      createdDate: json['CreatedDate'] as String?,
      description: json['Description'] as String?,
      layerArn: json['LayerArn'] as String?,
      layerVersionArn: json['LayerVersionArn'] as String?,
      licenseInfo: json['LicenseInfo'] as String?,
      version: json['Version'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final compatibleArchitectures = this.compatibleArchitectures;
    final compatibleRuntimes = this.compatibleRuntimes;
    final content = this.content;
    final createdDate = this.createdDate;
    final description = this.description;
    final layerArn = this.layerArn;
    final layerVersionArn = this.layerVersionArn;
    final licenseInfo = this.licenseInfo;
    final version = this.version;
    return {
      if (compatibleArchitectures != null)
        'CompatibleArchitectures':
            compatibleArchitectures.map((e) => e.value).toList(),
      if (compatibleRuntimes != null)
        'CompatibleRuntimes': compatibleRuntimes.map((e) => e.value).toList(),
      if (content != null) 'Content': content,
      if (createdDate != null) 'CreatedDate': createdDate,
      if (description != null) 'Description': description,
      if (layerArn != null) 'LayerArn': layerArn,
      if (layerVersionArn != null) 'LayerVersionArn': layerVersionArn,
      if (licenseInfo != null) 'LicenseInfo': licenseInfo,
      if (version != null) 'Version': version,
    };
  }
}

/// @nodoc
class GetLayerVersionPolicyResponse {
  /// The policy document.
  final String? policy;

  /// A unique identifier for the current revision of the policy.
  final String? revisionId;

  GetLayerVersionPolicyResponse({
    this.policy,
    this.revisionId,
  });

  factory GetLayerVersionPolicyResponse.fromJson(Map<String, dynamic> json) {
    return GetLayerVersionPolicyResponse(
      policy: json['Policy'] as String?,
      revisionId: json['RevisionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final policy = this.policy;
    final revisionId = this.revisionId;
    return {
      if (policy != null) 'Policy': policy,
      if (revisionId != null) 'RevisionId': revisionId,
    };
  }
}

/// @nodoc
class PublishLayerVersionResponse {
  /// A list of compatible <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/foundation-arch.html">instruction
  /// set architectures</a>.
  final List<Architecture>? compatibleArchitectures;

  /// The layer's compatible runtimes.
  ///
  /// The following list includes deprecated runtimes. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html#runtime-deprecation-levels">Runtime
  /// use after deprecation</a>.
  ///
  /// For a list of all currently supported runtimes, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html#runtimes-supported">Supported
  /// runtimes</a>.
  final List<Runtime>? compatibleRuntimes;

  /// Details about the layer version.
  final LayerVersionContentOutput? content;

  /// The date that the layer version was created, in <a
  /// href="https://www.w3.org/TR/NOTE-datetime">ISO-8601 format</a>
  /// (YYYY-MM-DDThh:mm:ss.sTZD).
  final String? createdDate;

  /// The description of the version.
  final String? description;

  /// The ARN of the layer.
  final String? layerArn;

  /// The ARN of the layer version.
  final String? layerVersionArn;

  /// The layer's software license.
  final String? licenseInfo;

  /// The version number.
  final int? version;

  PublishLayerVersionResponse({
    this.compatibleArchitectures,
    this.compatibleRuntimes,
    this.content,
    this.createdDate,
    this.description,
    this.layerArn,
    this.layerVersionArn,
    this.licenseInfo,
    this.version,
  });

  factory PublishLayerVersionResponse.fromJson(Map<String, dynamic> json) {
    return PublishLayerVersionResponse(
      compatibleArchitectures: (json['CompatibleArchitectures'] as List?)
          ?.nonNulls
          .map((e) => Architecture.fromString((e as String)))
          .toList(),
      compatibleRuntimes: (json['CompatibleRuntimes'] as List?)
          ?.nonNulls
          .map((e) => Runtime.fromString((e as String)))
          .toList(),
      content: json['Content'] != null
          ? LayerVersionContentOutput.fromJson(
              json['Content'] as Map<String, dynamic>)
          : null,
      createdDate: json['CreatedDate'] as String?,
      description: json['Description'] as String?,
      layerArn: json['LayerArn'] as String?,
      layerVersionArn: json['LayerVersionArn'] as String?,
      licenseInfo: json['LicenseInfo'] as String?,
      version: json['Version'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final compatibleArchitectures = this.compatibleArchitectures;
    final compatibleRuntimes = this.compatibleRuntimes;
    final content = this.content;
    final createdDate = this.createdDate;
    final description = this.description;
    final layerArn = this.layerArn;
    final layerVersionArn = this.layerVersionArn;
    final licenseInfo = this.licenseInfo;
    final version = this.version;
    return {
      if (compatibleArchitectures != null)
        'CompatibleArchitectures':
            compatibleArchitectures.map((e) => e.value).toList(),
      if (compatibleRuntimes != null)
        'CompatibleRuntimes': compatibleRuntimes.map((e) => e.value).toList(),
      if (content != null) 'Content': content,
      if (createdDate != null) 'CreatedDate': createdDate,
      if (description != null) 'Description': description,
      if (layerArn != null) 'LayerArn': layerArn,
      if (layerVersionArn != null) 'LayerVersionArn': layerVersionArn,
      if (licenseInfo != null) 'LicenseInfo': licenseInfo,
      if (version != null) 'Version': version,
    };
  }
}

/// @nodoc
class AddPermissionResponse {
  /// The permission statement that's added to the function policy.
  final String? statement;

  AddPermissionResponse({
    this.statement,
  });

  factory AddPermissionResponse.fromJson(Map<String, dynamic> json) {
    return AddPermissionResponse(
      statement: json['Statement'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final statement = this.statement;
    return {
      if (statement != null) 'Statement': statement,
    };
  }
}

/// @nodoc
class PutProvisionedConcurrencyConfigResponse {
  /// The amount of provisioned concurrency allocated. When a weighted alias is
  /// used during linear and canary deployments, this value fluctuates depending
  /// on the amount of concurrency that is provisioned for the function versions.
  final int? allocatedProvisionedConcurrentExecutions;

  /// The amount of provisioned concurrency available.
  final int? availableProvisionedConcurrentExecutions;

  /// The date and time that a user last updated the configuration, in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601
  /// format</a>.
  final String? lastModified;

  /// The amount of provisioned concurrency requested.
  final int? requestedProvisionedConcurrentExecutions;

  /// The status of the allocation process.
  final ProvisionedConcurrencyStatusEnum? status;

  /// For failed allocations, the reason that provisioned concurrency could not be
  /// allocated.
  final String? statusReason;

  PutProvisionedConcurrencyConfigResponse({
    this.allocatedProvisionedConcurrentExecutions,
    this.availableProvisionedConcurrentExecutions,
    this.lastModified,
    this.requestedProvisionedConcurrentExecutions,
    this.status,
    this.statusReason,
  });

  factory PutProvisionedConcurrencyConfigResponse.fromJson(
      Map<String, dynamic> json) {
    return PutProvisionedConcurrencyConfigResponse(
      allocatedProvisionedConcurrentExecutions:
          json['AllocatedProvisionedConcurrentExecutions'] as int?,
      availableProvisionedConcurrentExecutions:
          json['AvailableProvisionedConcurrentExecutions'] as int?,
      lastModified: json['LastModified'] as String?,
      requestedProvisionedConcurrentExecutions:
          json['RequestedProvisionedConcurrentExecutions'] as int?,
      status: (json['Status'] as String?)
          ?.let(ProvisionedConcurrencyStatusEnum.fromString),
      statusReason: json['StatusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final allocatedProvisionedConcurrentExecutions =
        this.allocatedProvisionedConcurrentExecutions;
    final availableProvisionedConcurrentExecutions =
        this.availableProvisionedConcurrentExecutions;
    final lastModified = this.lastModified;
    final requestedProvisionedConcurrentExecutions =
        this.requestedProvisionedConcurrentExecutions;
    final status = this.status;
    final statusReason = this.statusReason;
    return {
      if (allocatedProvisionedConcurrentExecutions != null)
        'AllocatedProvisionedConcurrentExecutions':
            allocatedProvisionedConcurrentExecutions,
      if (availableProvisionedConcurrentExecutions != null)
        'AvailableProvisionedConcurrentExecutions':
            availableProvisionedConcurrentExecutions,
      if (lastModified != null) 'LastModified': lastModified,
      if (requestedProvisionedConcurrentExecutions != null)
        'RequestedProvisionedConcurrentExecutions':
            requestedProvisionedConcurrentExecutions,
      if (status != null) 'Status': status.value,
      if (statusReason != null) 'StatusReason': statusReason,
    };
  }
}

/// @nodoc
class GetProvisionedConcurrencyConfigResponse {
  /// The amount of provisioned concurrency allocated. When a weighted alias is
  /// used during linear and canary deployments, this value fluctuates depending
  /// on the amount of concurrency that is provisioned for the function versions.
  final int? allocatedProvisionedConcurrentExecutions;

  /// The amount of provisioned concurrency available.
  final int? availableProvisionedConcurrentExecutions;

  /// The date and time that a user last updated the configuration, in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601
  /// format</a>.
  final String? lastModified;

  /// The amount of provisioned concurrency requested.
  final int? requestedProvisionedConcurrentExecutions;

  /// The status of the allocation process.
  final ProvisionedConcurrencyStatusEnum? status;

  /// For failed allocations, the reason that provisioned concurrency could not be
  /// allocated.
  final String? statusReason;

  GetProvisionedConcurrencyConfigResponse({
    this.allocatedProvisionedConcurrentExecutions,
    this.availableProvisionedConcurrentExecutions,
    this.lastModified,
    this.requestedProvisionedConcurrentExecutions,
    this.status,
    this.statusReason,
  });

  factory GetProvisionedConcurrencyConfigResponse.fromJson(
      Map<String, dynamic> json) {
    return GetProvisionedConcurrencyConfigResponse(
      allocatedProvisionedConcurrentExecutions:
          json['AllocatedProvisionedConcurrentExecutions'] as int?,
      availableProvisionedConcurrentExecutions:
          json['AvailableProvisionedConcurrentExecutions'] as int?,
      lastModified: json['LastModified'] as String?,
      requestedProvisionedConcurrentExecutions:
          json['RequestedProvisionedConcurrentExecutions'] as int?,
      status: (json['Status'] as String?)
          ?.let(ProvisionedConcurrencyStatusEnum.fromString),
      statusReason: json['StatusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final allocatedProvisionedConcurrentExecutions =
        this.allocatedProvisionedConcurrentExecutions;
    final availableProvisionedConcurrentExecutions =
        this.availableProvisionedConcurrentExecutions;
    final lastModified = this.lastModified;
    final requestedProvisionedConcurrentExecutions =
        this.requestedProvisionedConcurrentExecutions;
    final status = this.status;
    final statusReason = this.statusReason;
    return {
      if (allocatedProvisionedConcurrentExecutions != null)
        'AllocatedProvisionedConcurrentExecutions':
            allocatedProvisionedConcurrentExecutions,
      if (availableProvisionedConcurrentExecutions != null)
        'AvailableProvisionedConcurrentExecutions':
            availableProvisionedConcurrentExecutions,
      if (lastModified != null) 'LastModified': lastModified,
      if (requestedProvisionedConcurrentExecutions != null)
        'RequestedProvisionedConcurrentExecutions':
            requestedProvisionedConcurrentExecutions,
      if (status != null) 'Status': status.value,
      if (statusReason != null) 'StatusReason': statusReason,
    };
  }
}

/// @nodoc
class ProvisionedConcurrencyStatusEnum {
  static const inProgress = ProvisionedConcurrencyStatusEnum._('IN_PROGRESS');
  static const ready = ProvisionedConcurrencyStatusEnum._('READY');
  static const failed = ProvisionedConcurrencyStatusEnum._('FAILED');

  final String value;

  const ProvisionedConcurrencyStatusEnum._(this.value);

  static const values = [inProgress, ready, failed];

  static ProvisionedConcurrencyStatusEnum fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ProvisionedConcurrencyStatusEnum._(value));

  @override
  bool operator ==(other) =>
      other is ProvisionedConcurrencyStatusEnum && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class FunctionUrlAuthType {
  static const none = FunctionUrlAuthType._('NONE');
  static const awsIam = FunctionUrlAuthType._('AWS_IAM');

  final String value;

  const FunctionUrlAuthType._(this.value);

  static const values = [none, awsIam];

  static FunctionUrlAuthType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => FunctionUrlAuthType._(value));

  @override
  bool operator ==(other) =>
      other is FunctionUrlAuthType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Details about a version of an <a
/// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">Lambda
/// layer</a>.
///
/// @nodoc
class LayerVersionContentOutput {
  /// The SHA-256 hash of the layer archive.
  final String? codeSha256;

  /// The size of the layer archive in bytes.
  final int? codeSize;

  /// A link to the layer archive in Amazon S3 that is valid for 10 minutes.
  final String? location;

  /// The Amazon Resource Name (ARN) of a signing job.
  final String? signingJobArn;

  /// The Amazon Resource Name (ARN) for a signing profile version.
  final String? signingProfileVersionArn;

  LayerVersionContentOutput({
    this.codeSha256,
    this.codeSize,
    this.location,
    this.signingJobArn,
    this.signingProfileVersionArn,
  });

  factory LayerVersionContentOutput.fromJson(Map<String, dynamic> json) {
    return LayerVersionContentOutput(
      codeSha256: json['CodeSha256'] as String?,
      codeSize: json['CodeSize'] as int?,
      location: json['Location'] as String?,
      signingJobArn: json['SigningJobArn'] as String?,
      signingProfileVersionArn: json['SigningProfileVersionArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final codeSha256 = this.codeSha256;
    final codeSize = this.codeSize;
    final location = this.location;
    final signingJobArn = this.signingJobArn;
    final signingProfileVersionArn = this.signingProfileVersionArn;
    return {
      if (codeSha256 != null) 'CodeSha256': codeSha256,
      if (codeSize != null) 'CodeSize': codeSize,
      if (location != null) 'Location': location,
      if (signingJobArn != null) 'SigningJobArn': signingJobArn,
      if (signingProfileVersionArn != null)
        'SigningProfileVersionArn': signingProfileVersionArn,
    };
  }
}

/// @nodoc
class Architecture {
  static const x86_64 = Architecture._('x86_64');
  static const arm64 = Architecture._('arm64');

  final String value;

  const Architecture._(this.value);

  static const values = [x86_64, arm64];

  static Architecture fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => Architecture._(value));

  @override
  bool operator ==(other) => other is Architecture && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class Runtime {
  static const nodejs = Runtime._('nodejs');
  static const nodejs4_3 = Runtime._('nodejs4.3');
  static const nodejs6_10 = Runtime._('nodejs6.10');
  static const nodejs8_10 = Runtime._('nodejs8.10');
  static const nodejs10X = Runtime._('nodejs10.x');
  static const nodejs12X = Runtime._('nodejs12.x');
  static const nodejs14X = Runtime._('nodejs14.x');
  static const nodejs16X = Runtime._('nodejs16.x');
  static const java8 = Runtime._('java8');
  static const java8Al2 = Runtime._('java8.al2');
  static const java11 = Runtime._('java11');
  static const python2_7 = Runtime._('python2.7');
  static const python3_6 = Runtime._('python3.6');
  static const python3_7 = Runtime._('python3.7');
  static const python3_8 = Runtime._('python3.8');
  static const python3_9 = Runtime._('python3.9');
  static const dotnetcore1_0 = Runtime._('dotnetcore1.0');
  static const dotnetcore2_0 = Runtime._('dotnetcore2.0');
  static const dotnetcore2_1 = Runtime._('dotnetcore2.1');
  static const dotnetcore3_1 = Runtime._('dotnetcore3.1');
  static const dotnet6 = Runtime._('dotnet6');
  static const dotnet8 = Runtime._('dotnet8');
  static const nodejs4_3Edge = Runtime._('nodejs4.3-edge');
  static const go1X = Runtime._('go1.x');
  static const ruby2_5 = Runtime._('ruby2.5');
  static const ruby2_7 = Runtime._('ruby2.7');
  static const provided = Runtime._('provided');
  static const providedAl2 = Runtime._('provided.al2');
  static const nodejs18X = Runtime._('nodejs18.x');
  static const python3_10 = Runtime._('python3.10');
  static const java17 = Runtime._('java17');
  static const ruby3_2 = Runtime._('ruby3.2');
  static const ruby3_3 = Runtime._('ruby3.3');
  static const ruby3_4 = Runtime._('ruby3.4');
  static const python3_11 = Runtime._('python3.11');
  static const nodejs20X = Runtime._('nodejs20.x');
  static const providedAl2023 = Runtime._('provided.al2023');
  static const python3_12 = Runtime._('python3.12');
  static const java21 = Runtime._('java21');
  static const python3_13 = Runtime._('python3.13');
  static const nodejs22X = Runtime._('nodejs22.x');
  static const nodejs24X = Runtime._('nodejs24.x');
  static const python3_14 = Runtime._('python3.14');
  static const java25 = Runtime._('java25');
  static const dotnet10 = Runtime._('dotnet10');
  static const ruby4_0 = Runtime._('ruby4.0');

  final String value;

  const Runtime._(this.value);

  static const values = [
    nodejs,
    nodejs4_3,
    nodejs6_10,
    nodejs8_10,
    nodejs10X,
    nodejs12X,
    nodejs14X,
    nodejs16X,
    java8,
    java8Al2,
    java11,
    python2_7,
    python3_6,
    python3_7,
    python3_8,
    python3_9,
    dotnetcore1_0,
    dotnetcore2_0,
    dotnetcore2_1,
    dotnetcore3_1,
    dotnet6,
    dotnet8,
    nodejs4_3Edge,
    go1X,
    ruby2_5,
    ruby2_7,
    provided,
    providedAl2,
    nodejs18X,
    python3_10,
    java17,
    ruby3_2,
    ruby3_3,
    ruby3_4,
    python3_11,
    nodejs20X,
    providedAl2023,
    python3_12,
    java21,
    python3_13,
    nodejs22X,
    nodejs24X,
    python3_14,
    java25,
    dotnet10,
    ruby4_0
  ];

  static Runtime fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => Runtime._(value));

  @override
  bool operator ==(other) => other is Runtime && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A ZIP archive that contains the contents of an <a
/// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">Lambda
/// layer</a>. You can specify either an Amazon S3 location, or upload a layer
/// archive directly.
///
/// @nodoc
class LayerVersionContentInput {
  /// The Amazon S3 bucket of the layer archive.
  final String? s3Bucket;

  /// The Amazon S3 key of the layer archive.
  final String? s3Key;

  /// For versioned objects, the version of the layer archive object to use.
  final String? s3ObjectVersion;

  /// The base64-encoded contents of the layer archive. Amazon Web Services SDK
  /// and Amazon Web Services CLI clients handle the encoding for you.
  final Uint8List? zipFile;

  LayerVersionContentInput({
    this.s3Bucket,
    this.s3Key,
    this.s3ObjectVersion,
    this.zipFile,
  });

  Map<String, dynamic> toJson() {
    final s3Bucket = this.s3Bucket;
    final s3Key = this.s3Key;
    final s3ObjectVersion = this.s3ObjectVersion;
    final zipFile = this.zipFile;
    return {
      if (s3Bucket != null) 'S3Bucket': s3Bucket,
      if (s3Key != null) 'S3Key': s3Key,
      if (s3ObjectVersion != null) 'S3ObjectVersion': s3ObjectVersion,
      if (zipFile != null) 'ZipFile': base64Encode(zipFile),
    };
  }
}

/// Details about a version of an <a
/// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">Lambda
/// layer</a>.
///
/// @nodoc
class LayerVersionsListItem {
  /// A list of compatible <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/foundation-arch.html">instruction
  /// set architectures</a>.
  final List<Architecture>? compatibleArchitectures;

  /// The layer's compatible runtimes.
  ///
  /// The following list includes deprecated runtimes. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html#runtime-deprecation-levels">Runtime
  /// use after deprecation</a>.
  ///
  /// For a list of all currently supported runtimes, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html#runtimes-supported">Supported
  /// runtimes</a>.
  final List<Runtime>? compatibleRuntimes;

  /// The date that the version was created, in ISO 8601 format. For example,
  /// <code>2018-11-27T15:10:45.123+0000</code>.
  final String? createdDate;

  /// The description of the version.
  final String? description;

  /// The ARN of the layer version.
  final String? layerVersionArn;

  /// The layer's open-source license.
  final String? licenseInfo;

  /// The version number.
  final int? version;

  LayerVersionsListItem({
    this.compatibleArchitectures,
    this.compatibleRuntimes,
    this.createdDate,
    this.description,
    this.layerVersionArn,
    this.licenseInfo,
    this.version,
  });

  factory LayerVersionsListItem.fromJson(Map<String, dynamic> json) {
    return LayerVersionsListItem(
      compatibleArchitectures: (json['CompatibleArchitectures'] as List?)
          ?.nonNulls
          .map((e) => Architecture.fromString((e as String)))
          .toList(),
      compatibleRuntimes: (json['CompatibleRuntimes'] as List?)
          ?.nonNulls
          .map((e) => Runtime.fromString((e as String)))
          .toList(),
      createdDate: json['CreatedDate'] as String?,
      description: json['Description'] as String?,
      layerVersionArn: json['LayerVersionArn'] as String?,
      licenseInfo: json['LicenseInfo'] as String?,
      version: json['Version'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final compatibleArchitectures = this.compatibleArchitectures;
    final compatibleRuntimes = this.compatibleRuntimes;
    final createdDate = this.createdDate;
    final description = this.description;
    final layerVersionArn = this.layerVersionArn;
    final licenseInfo = this.licenseInfo;
    final version = this.version;
    return {
      if (compatibleArchitectures != null)
        'CompatibleArchitectures':
            compatibleArchitectures.map((e) => e.value).toList(),
      if (compatibleRuntimes != null)
        'CompatibleRuntimes': compatibleRuntimes.map((e) => e.value).toList(),
      if (createdDate != null) 'CreatedDate': createdDate,
      if (description != null) 'Description': description,
      if (layerVersionArn != null) 'LayerVersionArn': layerVersionArn,
      if (licenseInfo != null) 'LicenseInfo': licenseInfo,
      if (version != null) 'Version': version,
    };
  }
}

/// Details about an <a
/// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">Lambda
/// layer</a>.
///
/// @nodoc
class LayersListItem {
  /// The newest version of the layer.
  final LayerVersionsListItem? latestMatchingVersion;

  /// The Amazon Resource Name (ARN) of the function layer.
  final String? layerArn;

  /// The name of the layer.
  final String? layerName;

  LayersListItem({
    this.latestMatchingVersion,
    this.layerArn,
    this.layerName,
  });

  factory LayersListItem.fromJson(Map<String, dynamic> json) {
    return LayersListItem(
      latestMatchingVersion: json['LatestMatchingVersion'] != null
          ? LayerVersionsListItem.fromJson(
              json['LatestMatchingVersion'] as Map<String, dynamic>)
          : null,
      layerArn: json['LayerArn'] as String?,
      layerName: json['LayerName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final latestMatchingVersion = this.latestMatchingVersion;
    final layerArn = this.layerArn;
    final layerName = this.layerName;
    return {
      if (latestMatchingVersion != null)
        'LatestMatchingVersion': latestMatchingVersion,
      if (layerArn != null) 'LayerArn': layerArn,
      if (layerName != null) 'LayerName': layerName,
    };
  }
}

/// @nodoc
class FunctionVersionLatestPublished {
  static const latestPublished =
      FunctionVersionLatestPublished._('LATEST_PUBLISHED');

  final String value;

  const FunctionVersionLatestPublished._(this.value);

  static const values = [latestPublished];

  static FunctionVersionLatestPublished fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => FunctionVersionLatestPublished._(value));

  @override
  bool operator ==(other) =>
      other is FunctionVersionLatestPublished && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The <a
/// href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-traffic-shifting-using-aliases.html">traffic-shifting</a>
/// configuration of a Lambda function alias.
///
/// @nodoc
class AliasRoutingConfiguration {
  /// The second version, and the percentage of traffic that's routed to it.
  final Map<String, double>? additionalVersionWeights;

  AliasRoutingConfiguration({
    this.additionalVersionWeights,
  });

  factory AliasRoutingConfiguration.fromJson(Map<String, dynamic> json) {
    return AliasRoutingConfiguration(
      additionalVersionWeights:
          (json['AdditionalVersionWeights'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, _s.parseJsonDouble(e)!)),
    );
  }

  Map<String, dynamic> toJson() {
    final additionalVersionWeights = this.additionalVersionWeights;
    return {
      if (additionalVersionWeights != null)
        'AdditionalVersionWeights': additionalVersionWeights
            .map((k, e) => MapEntry(k, _s.encodeJsonDouble(e))),
    };
  }
}

/// @nodoc
class UpdateRuntimeOn {
  static const auto = UpdateRuntimeOn._('Auto');
  static const manual = UpdateRuntimeOn._('Manual');
  static const functionUpdate = UpdateRuntimeOn._('FunctionUpdate');

  final String value;

  const UpdateRuntimeOn._(this.value);

  static const values = [auto, manual, functionUpdate];

  static UpdateRuntimeOn fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => UpdateRuntimeOn._(value));

  @override
  bool operator ==(other) => other is UpdateRuntimeOn && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class State {
  static const pending = State._('Pending');
  static const active = State._('Active');
  static const inactive = State._('Inactive');
  static const failed = State._('Failed');
  static const deactivating = State._('Deactivating');
  static const deactivated = State._('Deactivated');
  static const activeNonInvocable = State._('ActiveNonInvocable');
  static const deleting = State._('Deleting');

  final String value;

  const State._(this.value);

  static const values = [
    pending,
    active,
    inactive,
    failed,
    deactivating,
    deactivated,
    activeNonInvocable,
    deleting
  ];

  static State fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => State._(value));

  @override
  bool operator ==(other) => other is State && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Configuration that defines the scaling behavior for a Lambda Managed
/// Instances function, including the minimum and maximum number of execution
/// environments that can be provisioned.
///
/// @nodoc
class FunctionScalingConfig {
  /// The maximum number of execution environments that can be provisioned for the
  /// function.
  final int? maxExecutionEnvironments;

  /// The minimum number of execution environments to maintain for the function.
  final int? minExecutionEnvironments;

  FunctionScalingConfig({
    this.maxExecutionEnvironments,
    this.minExecutionEnvironments,
  });

  factory FunctionScalingConfig.fromJson(Map<String, dynamic> json) {
    return FunctionScalingConfig(
      maxExecutionEnvironments: json['MaxExecutionEnvironments'] as int?,
      minExecutionEnvironments: json['MinExecutionEnvironments'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final maxExecutionEnvironments = this.maxExecutionEnvironments;
    final minExecutionEnvironments = this.minExecutionEnvironments;
    return {
      if (maxExecutionEnvironments != null)
        'MaxExecutionEnvironments': maxExecutionEnvironments,
      if (minExecutionEnvironments != null)
        'MinExecutionEnvironments': minExecutionEnvironments,
    };
  }
}

/// @nodoc
class RecursiveLoop {
  static const allow = RecursiveLoop._('Allow');
  static const terminate = RecursiveLoop._('Terminate');

  final String value;

  const RecursiveLoop._(this.value);

  static const values = [allow, terminate];

  static RecursiveLoop fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RecursiveLoop._(value));

  @override
  bool operator ==(other) => other is RecursiveLoop && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An object that includes a chunk of the response payload. When the stream has
/// ended, Lambda includes a <code>InvokeComplete</code> object.
///
/// @nodoc
class InvokeWithResponseStreamResponseEvent {
  /// An object that's returned when the stream has ended and all the payload
  /// chunks have been returned.
  final InvokeWithResponseStreamCompleteEvent? invokeComplete;

  /// A chunk of the streamed response payload.
  final InvokeResponseStreamUpdate? payloadChunk;

  InvokeWithResponseStreamResponseEvent({
    this.invokeComplete,
    this.payloadChunk,
  });

  factory InvokeWithResponseStreamResponseEvent.fromJson(
      Map<String, dynamic> json) {
    return InvokeWithResponseStreamResponseEvent(
      invokeComplete: json['InvokeComplete'] != null
          ? InvokeWithResponseStreamCompleteEvent.fromJson(
              json['InvokeComplete'] as Map<String, dynamic>)
          : null,
      payloadChunk: json['PayloadChunk'] != null
          ? InvokeResponseStreamUpdate.fromJson(
              json['PayloadChunk'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final invokeComplete = this.invokeComplete;
    final payloadChunk = this.payloadChunk;
    return {
      if (invokeComplete != null) 'InvokeComplete': invokeComplete,
      if (payloadChunk != null) 'PayloadChunk': payloadChunk,
    };
  }
}

/// A chunk of the streamed response payload.
///
/// @nodoc
class InvokeResponseStreamUpdate {
  /// Data returned by your Lambda function.
  final Uint8List? payload;

  InvokeResponseStreamUpdate({
    this.payload,
  });

  factory InvokeResponseStreamUpdate.fromJson(Map<String, dynamic> json) {
    return InvokeResponseStreamUpdate(
      payload: _s.decodeNullableUint8List(json['Payload'] as String?),
    );
  }

  Map<String, dynamic> toJson() {
    final payload = this.payload;
    return {
      if (payload != null) 'Payload': base64Encode(payload),
    };
  }
}

/// A response confirming that the event stream is complete.
///
/// @nodoc
class InvokeWithResponseStreamCompleteEvent {
  /// An error code.
  final String? errorCode;

  /// The details of any returned error.
  final String? errorDetails;

  /// The last 4 KB of the execution log, which is base64-encoded.
  final String? logResult;

  InvokeWithResponseStreamCompleteEvent({
    this.errorCode,
    this.errorDetails,
    this.logResult,
  });

  factory InvokeWithResponseStreamCompleteEvent.fromJson(
      Map<String, dynamic> json) {
    return InvokeWithResponseStreamCompleteEvent(
      errorCode: json['ErrorCode'] as String?,
      errorDetails: json['ErrorDetails'] as String?,
      logResult: json['LogResult'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorDetails = this.errorDetails;
    final logResult = this.logResult;
    return {
      if (errorCode != null) 'ErrorCode': errorCode,
      if (errorDetails != null) 'ErrorDetails': errorDetails,
      if (logResult != null) 'LogResult': logResult,
    };
  }
}

/// @nodoc
class ResponseStreamingInvocationType {
  static const requestResponse =
      ResponseStreamingInvocationType._('RequestResponse');
  static const dryRun = ResponseStreamingInvocationType._('DryRun');

  final String value;

  const ResponseStreamingInvocationType._(this.value);

  static const values = [requestResponse, dryRun];

  static ResponseStreamingInvocationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ResponseStreamingInvocationType._(value));

  @override
  bool operator ==(other) =>
      other is ResponseStreamingInvocationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class LogType {
  static const none = LogType._('None');
  static const tail = LogType._('Tail');

  final String value;

  const LogType._(this.value);

  static const values = [none, tail];

  static LogType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => LogType._(value));

  @override
  bool operator ==(other) => other is LogType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class InvocationType {
  static const event = InvocationType._('Event');
  static const requestResponse = InvocationType._('RequestResponse');
  static const dryRun = InvocationType._('DryRun');

  final String value;

  const InvocationType._(this.value);

  static const values = [event, requestResponse, dryRun];

  static InvocationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => InvocationType._(value));

  @override
  bool operator ==(other) => other is InvocationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Details about a function's deployment package.
///
/// @nodoc
class FunctionCodeLocation {
  /// URI of a container image in the Amazon ECR registry.
  final String? imageUri;

  /// A presigned URL that you can use to download the deployment package.
  final String? location;

  /// The service that's hosting the file.
  final String? repositoryType;

  /// The resolved URI for the image.
  final String? resolvedImageUri;

  /// The ARN of the Key Management Service (KMS) customer managed key that's used
  /// to encrypt your function's .zip deployment package. If you don't provide a
  /// customer managed key, Lambda uses an <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-owned-cmk">Amazon
  /// Web Services owned key</a>.
  final String? sourceKMSKeyArn;

  FunctionCodeLocation({
    this.imageUri,
    this.location,
    this.repositoryType,
    this.resolvedImageUri,
    this.sourceKMSKeyArn,
  });

  factory FunctionCodeLocation.fromJson(Map<String, dynamic> json) {
    return FunctionCodeLocation(
      imageUri: json['ImageUri'] as String?,
      location: json['Location'] as String?,
      repositoryType: json['RepositoryType'] as String?,
      resolvedImageUri: json['ResolvedImageUri'] as String?,
      sourceKMSKeyArn: json['SourceKMSKeyArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final imageUri = this.imageUri;
    final location = this.location;
    final repositoryType = this.repositoryType;
    final resolvedImageUri = this.resolvedImageUri;
    final sourceKMSKeyArn = this.sourceKMSKeyArn;
    return {
      if (imageUri != null) 'ImageUri': imageUri,
      if (location != null) 'Location': location,
      if (repositoryType != null) 'RepositoryType': repositoryType,
      if (resolvedImageUri != null) 'ResolvedImageUri': resolvedImageUri,
      if (sourceKMSKeyArn != null) 'SourceKMSKeyArn': sourceKMSKeyArn,
    };
  }
}

/// An object that contains details about an error related to retrieving tags.
///
/// @nodoc
class TagsError {
  /// The error code.
  final String errorCode;

  /// The error message.
  final String message;

  TagsError({
    required this.errorCode,
    required this.message,
  });

  factory TagsError.fromJson(Map<String, dynamic> json) {
    return TagsError(
      errorCode: (json['ErrorCode'] as String?) ?? '',
      message: (json['Message'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final message = this.message;
    return {
      'ErrorCode': errorCode,
      'Message': message,
    };
  }
}

/// The <a
/// href="https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS">cross-origin
/// resource sharing (CORS)</a> settings for your Lambda function URL. Use CORS
/// to grant access to your function URL from any origin. You can also use CORS
/// to control access for specific HTTP headers and methods in requests to your
/// function URL.
///
/// @nodoc
class Cors {
  /// Whether to allow cookies or other credentials in requests to your function
  /// URL. The default is <code>false</code>.
  final bool? allowCredentials;

  /// The HTTP headers that origins can include in requests to your function URL.
  /// For example: <code>Date</code>, <code>Keep-Alive</code>,
  /// <code>X-Custom-Header</code>.
  final List<String>? allowHeaders;

  /// The HTTP methods that are allowed when calling your function URL. For
  /// example: <code>GET</code>, <code>POST</code>, <code>DELETE</code>, or the
  /// wildcard character (<code>*</code>).
  final List<String>? allowMethods;

  /// The origins that can access your function URL. You can list any number of
  /// specific origins, separated by a comma. For example:
  /// <code>https://www.example.com</code>, <code>http://localhost:60905</code>.
  ///
  /// Alternatively, you can grant access to all origins using the wildcard
  /// character (<code>*</code>).
  final List<String>? allowOrigins;

  /// The HTTP headers in your function response that you want to expose to
  /// origins that call your function URL. For example: <code>Date</code>,
  /// <code>Keep-Alive</code>, <code>X-Custom-Header</code>.
  final List<String>? exposeHeaders;

  /// The maximum amount of time, in seconds, that web browsers can cache results
  /// of a preflight request. By default, this is set to <code>0</code>, which
  /// means that the browser doesn't cache results.
  final int? maxAge;

  Cors({
    this.allowCredentials,
    this.allowHeaders,
    this.allowMethods,
    this.allowOrigins,
    this.exposeHeaders,
    this.maxAge,
  });

  factory Cors.fromJson(Map<String, dynamic> json) {
    return Cors(
      allowCredentials: json['AllowCredentials'] as bool?,
      allowHeaders: (json['AllowHeaders'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      allowMethods: (json['AllowMethods'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      allowOrigins: (json['AllowOrigins'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      exposeHeaders: (json['ExposeHeaders'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      maxAge: json['MaxAge'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final allowCredentials = this.allowCredentials;
    final allowHeaders = this.allowHeaders;
    final allowMethods = this.allowMethods;
    final allowOrigins = this.allowOrigins;
    final exposeHeaders = this.exposeHeaders;
    final maxAge = this.maxAge;
    return {
      if (allowCredentials != null) 'AllowCredentials': allowCredentials,
      if (allowHeaders != null) 'AllowHeaders': allowHeaders,
      if (allowMethods != null) 'AllowMethods': allowMethods,
      if (allowOrigins != null) 'AllowOrigins': allowOrigins,
      if (exposeHeaders != null) 'ExposeHeaders': exposeHeaders,
      if (maxAge != null) 'MaxAge': maxAge,
    };
  }
}

/// @nodoc
class InvokeMode {
  static const buffered = InvokeMode._('BUFFERED');
  static const responseStream = InvokeMode._('RESPONSE_STREAM');

  final String value;

  const InvokeMode._(this.value);

  static const values = [buffered, responseStream];

  static InvokeMode fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => InvokeMode._(value));

  @override
  bool operator ==(other) => other is InvokeMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The VPC security groups and subnets that are attached to a Lambda function.
/// For more information, see <a
/// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-vpc.html">Configuring
/// a Lambda function to access resources in a VPC</a>.
///
/// @nodoc
class VpcConfig {
  /// Allows outbound IPv6 traffic on VPC functions that are connected to
  /// dual-stack subnets.
  final bool? ipv6AllowedForDualStack;

  /// A list of VPC security group IDs.
  final List<String>? securityGroupIds;

  /// A list of VPC subnet IDs.
  final List<String>? subnetIds;

  VpcConfig({
    this.ipv6AllowedForDualStack,
    this.securityGroupIds,
    this.subnetIds,
  });

  Map<String, dynamic> toJson() {
    final ipv6AllowedForDualStack = this.ipv6AllowedForDualStack;
    final securityGroupIds = this.securityGroupIds;
    final subnetIds = this.subnetIds;
    return {
      if (ipv6AllowedForDualStack != null)
        'Ipv6AllowedForDualStack': ipv6AllowedForDualStack,
      if (securityGroupIds != null) 'SecurityGroupIds': securityGroupIds,
      if (subnetIds != null) 'SubnetIds': subnetIds,
    };
  }
}

/// A function's environment variable settings. You can use environment
/// variables to adjust your function's behavior without updating code. An
/// environment variable is a pair of strings that are stored in a function's
/// version-specific configuration.
///
/// @nodoc
class Environment {
  /// Environment variable key-value pairs. For more information, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-envvars.html">Using
  /// Lambda environment variables</a>.
  final Map<String, String>? variables;

  Environment({
    this.variables,
  });

  Map<String, dynamic> toJson() {
    final variables = this.variables;
    return {
      if (variables != null) 'Variables': variables,
    };
  }
}

/// The <a
/// href="https://docs.aws.amazon.com/lambda/latest/dg/invocation-async-retain-records.html#invocation-dlq">dead-letter
/// queue</a> for failed asynchronous invocations.
///
/// @nodoc
class DeadLetterConfig {
  /// The Amazon Resource Name (ARN) of an Amazon SQS queue or Amazon SNS topic.
  final String? targetArn;

  DeadLetterConfig({
    this.targetArn,
  });

  factory DeadLetterConfig.fromJson(Map<String, dynamic> json) {
    return DeadLetterConfig(
      targetArn: json['TargetArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final targetArn = this.targetArn;
    return {
      if (targetArn != null) 'TargetArn': targetArn,
    };
  }
}

/// The function's <a
/// href="https://docs.aws.amazon.com/lambda/latest/dg/services-xray.html">X-Ray</a>
/// tracing configuration. To sample and record incoming requests, set
/// <code>Mode</code> to <code>Active</code>.
///
/// @nodoc
class TracingConfig {
  /// The tracing mode.
  final TracingMode? mode;

  TracingConfig({
    this.mode,
  });

  Map<String, dynamic> toJson() {
    final mode = this.mode;
    return {
      if (mode != null) 'Mode': mode.value,
    };
  }
}

/// Configuration values that override the container image Dockerfile settings.
/// For more information, see <a
/// href="https://docs.aws.amazon.com/lambda/latest/dg/images-create.html#images-parms">Container
/// image settings</a>.
///
/// @nodoc
class ImageConfig {
  /// Specifies parameters that you want to pass in with ENTRYPOINT.
  final List<String>? command;

  /// Specifies the entry point to their application, which is typically the
  /// location of the runtime executable.
  final List<String>? entryPoint;

  /// Specifies the working directory.
  final String? workingDirectory;

  ImageConfig({
    this.command,
    this.entryPoint,
    this.workingDirectory,
  });

  factory ImageConfig.fromJson(Map<String, dynamic> json) {
    return ImageConfig(
      command:
          (json['Command'] as List?)?.nonNulls.map((e) => e as String).toList(),
      entryPoint: (json['EntryPoint'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      workingDirectory: json['WorkingDirectory'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final command = this.command;
    final entryPoint = this.entryPoint;
    final workingDirectory = this.workingDirectory;
    return {
      if (command != null) 'Command': command,
      if (entryPoint != null) 'EntryPoint': entryPoint,
      if (workingDirectory != null) 'WorkingDirectory': workingDirectory,
    };
  }
}

/// The size of the function's <code>/tmp</code> directory in MB. The default
/// value is 512, but can be any whole number between 512 and 10,240 MB. For
/// more information, see <a
/// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-function-common.html#configuration-ephemeral-storage">Configuring
/// ephemeral storage (console)</a>.
///
/// @nodoc
class EphemeralStorage {
  /// The size of the function's <code>/tmp</code> directory.
  final int size;

  EphemeralStorage({
    required this.size,
  });

  factory EphemeralStorage.fromJson(Map<String, dynamic> json) {
    return EphemeralStorage(
      size: (json['Size'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final size = this.size;
    return {
      'Size': size,
    };
  }
}

/// The function's <a
/// href="https://docs.aws.amazon.com/lambda/latest/dg/snapstart.html">Lambda
/// SnapStart</a> setting. Set <code>ApplyOn</code> to
/// <code>PublishedVersions</code> to create a snapshot of the initialized
/// execution environment when you publish a function version.
///
/// @nodoc
class SnapStart {
  /// Set to <code>PublishedVersions</code> to create a snapshot of the
  /// initialized execution environment when you publish a function version.
  final SnapStartApplyOn? applyOn;

  SnapStart({
    this.applyOn,
  });

  Map<String, dynamic> toJson() {
    final applyOn = this.applyOn;
    return {
      if (applyOn != null) 'ApplyOn': applyOn.value,
    };
  }
}

/// The function's Amazon CloudWatch Logs configuration settings.
///
/// @nodoc
class LoggingConfig {
  /// Set this property to filter the application logs for your function that
  /// Lambda sends to CloudWatch. Lambda only sends application logs at the
  /// selected level of detail and lower, where <code>TRACE</code> is the highest
  /// level and <code>FATAL</code> is the lowest.
  final ApplicationLogLevel? applicationLogLevel;

  /// The format in which Lambda sends your function's application and system logs
  /// to CloudWatch. Select between plain text and structured JSON.
  final LogFormat? logFormat;

  /// The name of the Amazon CloudWatch log group the function sends logs to. By
  /// default, Lambda functions send logs to a default log group named
  /// <code>/aws/lambda/&lt;function name&gt;</code>. To use a different log
  /// group, enter an existing log group or enter a new log group name.
  final String? logGroup;

  /// Set this property to filter the system logs for your function that Lambda
  /// sends to CloudWatch. Lambda only sends system logs at the selected level of
  /// detail and lower, where <code>DEBUG</code> is the highest level and
  /// <code>WARN</code> is the lowest.
  final SystemLogLevel? systemLogLevel;

  LoggingConfig({
    this.applicationLogLevel,
    this.logFormat,
    this.logGroup,
    this.systemLogLevel,
  });

  factory LoggingConfig.fromJson(Map<String, dynamic> json) {
    return LoggingConfig(
      applicationLogLevel: (json['ApplicationLogLevel'] as String?)
          ?.let(ApplicationLogLevel.fromString),
      logFormat: (json['LogFormat'] as String?)?.let(LogFormat.fromString),
      logGroup: json['LogGroup'] as String?,
      systemLogLevel:
          (json['SystemLogLevel'] as String?)?.let(SystemLogLevel.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationLogLevel = this.applicationLogLevel;
    final logFormat = this.logFormat;
    final logGroup = this.logGroup;
    final systemLogLevel = this.systemLogLevel;
    return {
      if (applicationLogLevel != null)
        'ApplicationLogLevel': applicationLogLevel.value,
      if (logFormat != null) 'LogFormat': logFormat.value,
      if (logGroup != null) 'LogGroup': logGroup,
      if (systemLogLevel != null) 'SystemLogLevel': systemLogLevel.value,
    };
  }
}

/// Configuration for the capacity provider that manages compute resources for
/// Lambda functions.
///
/// @nodoc
class CapacityProviderConfig {
  /// Configuration for Lambda-managed instances used by the capacity provider.
  final LambdaManagedInstancesCapacityProviderConfig
      lambdaManagedInstancesCapacityProviderConfig;

  CapacityProviderConfig({
    required this.lambdaManagedInstancesCapacityProviderConfig,
  });

  factory CapacityProviderConfig.fromJson(Map<String, dynamic> json) {
    return CapacityProviderConfig(
      lambdaManagedInstancesCapacityProviderConfig:
          LambdaManagedInstancesCapacityProviderConfig.fromJson(
              (json['LambdaManagedInstancesCapacityProviderConfig']
                      as Map<String, dynamic>?) ??
                  const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final lambdaManagedInstancesCapacityProviderConfig =
        this.lambdaManagedInstancesCapacityProviderConfig;
    return {
      'LambdaManagedInstancesCapacityProviderConfig':
          lambdaManagedInstancesCapacityProviderConfig,
    };
  }
}

/// Configuration settings for <a
/// href="https://docs.aws.amazon.com/lambda/latest/dg/durable-functions.html">durable
/// functions</a>, including execution timeout and retention period for
/// execution history.
///
/// @nodoc
class DurableConfig {
  /// The maximum time (in seconds) that a durable execution can run before timing
  /// out. This timeout applies to the entire durable execution, not individual
  /// function invocations.
  final int? executionTimeout;

  /// The number of days to retain execution history after a durable execution
  /// completes. After this period, execution history is no longer available
  /// through the GetDurableExecutionHistory API.
  final int? retentionPeriodInDays;

  DurableConfig({
    this.executionTimeout,
    this.retentionPeriodInDays,
  });

  factory DurableConfig.fromJson(Map<String, dynamic> json) {
    return DurableConfig(
      executionTimeout: json['ExecutionTimeout'] as int?,
      retentionPeriodInDays: json['RetentionPeriodInDays'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final executionTimeout = this.executionTimeout;
    final retentionPeriodInDays = this.retentionPeriodInDays;
    return {
      if (executionTimeout != null) 'ExecutionTimeout': executionTimeout,
      if (retentionPeriodInDays != null)
        'RetentionPeriodInDays': retentionPeriodInDays,
    };
  }
}

/// Configuration for Lambda-managed instances used by the capacity provider.
///
/// @nodoc
class LambdaManagedInstancesCapacityProviderConfig {
  /// The Amazon Resource Name (ARN) of the capacity provider.
  final String capacityProviderArn;

  /// The amount of memory in GiB allocated per vCPU for execution environments.
  final double? executionEnvironmentMemoryGiBPerVCpu;

  /// The maximum number of concurrent execution environments that can run on each
  /// compute instance.
  final int? perExecutionEnvironmentMaxConcurrency;

  LambdaManagedInstancesCapacityProviderConfig({
    required this.capacityProviderArn,
    this.executionEnvironmentMemoryGiBPerVCpu,
    this.perExecutionEnvironmentMaxConcurrency,
  });

  factory LambdaManagedInstancesCapacityProviderConfig.fromJson(
      Map<String, dynamic> json) {
    return LambdaManagedInstancesCapacityProviderConfig(
      capacityProviderArn: (json['CapacityProviderArn'] as String?) ?? '',
      executionEnvironmentMemoryGiBPerVCpu:
          _s.parseJsonDouble(json['ExecutionEnvironmentMemoryGiBPerVCpu']),
      perExecutionEnvironmentMaxConcurrency:
          json['PerExecutionEnvironmentMaxConcurrency'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final capacityProviderArn = this.capacityProviderArn;
    final executionEnvironmentMemoryGiBPerVCpu =
        this.executionEnvironmentMemoryGiBPerVCpu;
    final perExecutionEnvironmentMaxConcurrency =
        this.perExecutionEnvironmentMaxConcurrency;
    return {
      'CapacityProviderArn': capacityProviderArn,
      if (executionEnvironmentMemoryGiBPerVCpu != null)
        'ExecutionEnvironmentMemoryGiBPerVCpu':
            _s.encodeJsonDouble(executionEnvironmentMemoryGiBPerVCpu),
      if (perExecutionEnvironmentMaxConcurrency != null)
        'PerExecutionEnvironmentMaxConcurrency':
            perExecutionEnvironmentMaxConcurrency,
    };
  }
}

/// @nodoc
class LogFormat {
  static const json = LogFormat._('JSON');
  static const text = LogFormat._('Text');

  final String value;

  const LogFormat._(this.value);

  static const values = [json, text];

  static LogFormat fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => LogFormat._(value));

  @override
  bool operator ==(other) => other is LogFormat && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ApplicationLogLevel {
  static const trace = ApplicationLogLevel._('TRACE');
  static const debug = ApplicationLogLevel._('DEBUG');
  static const info = ApplicationLogLevel._('INFO');
  static const warn = ApplicationLogLevel._('WARN');
  static const error = ApplicationLogLevel._('ERROR');
  static const fatal = ApplicationLogLevel._('FATAL');

  final String value;

  const ApplicationLogLevel._(this.value);

  static const values = [trace, debug, info, warn, error, fatal];

  static ApplicationLogLevel fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ApplicationLogLevel._(value));

  @override
  bool operator ==(other) =>
      other is ApplicationLogLevel && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class SystemLogLevel {
  static const debug = SystemLogLevel._('DEBUG');
  static const info = SystemLogLevel._('INFO');
  static const warn = SystemLogLevel._('WARN');

  final String value;

  const SystemLogLevel._(this.value);

  static const values = [debug, info, warn];

  static SystemLogLevel fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SystemLogLevel._(value));

  @override
  bool operator ==(other) => other is SystemLogLevel && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class SnapStartApplyOn {
  static const publishedVersions = SnapStartApplyOn._('PublishedVersions');
  static const none = SnapStartApplyOn._('None');

  final String value;

  const SnapStartApplyOn._(this.value);

  static const values = [publishedVersions, none];

  static SnapStartApplyOn fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SnapStartApplyOn._(value));

  @override
  bool operator ==(other) => other is SnapStartApplyOn && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Details about the connection between a Lambda function and an <a
/// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-filesystem.html">Amazon
/// EFS file system</a> or an <a
/// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-filesystem.html">Amazon
/// S3 Files file system</a>.
///
/// @nodoc
class FileSystemConfig {
  /// The Amazon Resource Name (ARN) of the Amazon EFS or Amazon S3 Files access
  /// point that provides access to the file system.
  final String arn;

  /// The path where the function can access the file system, starting with
  /// <code>/mnt/</code>.
  final String localMountPath;

  FileSystemConfig({
    required this.arn,
    required this.localMountPath,
  });

  factory FileSystemConfig.fromJson(Map<String, dynamic> json) {
    return FileSystemConfig(
      arn: (json['Arn'] as String?) ?? '',
      localMountPath: (json['LocalMountPath'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final localMountPath = this.localMountPath;
    return {
      'Arn': arn,
      'LocalMountPath': localMountPath,
    };
  }
}

/// @nodoc
class TracingMode {
  static const active = TracingMode._('Active');
  static const passThrough = TracingMode._('PassThrough');

  final String value;

  const TracingMode._(this.value);

  static const values = [active, passThrough];

  static TracingMode fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => TracingMode._(value));

  @override
  bool operator ==(other) => other is TracingMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Details about the provisioned concurrency configuration for a function alias
/// or version.
///
/// @nodoc
class ProvisionedConcurrencyConfigListItem {
  /// The amount of provisioned concurrency allocated. When a weighted alias is
  /// used during linear and canary deployments, this value fluctuates depending
  /// on the amount of concurrency that is provisioned for the function versions.
  final int? allocatedProvisionedConcurrentExecutions;

  /// The amount of provisioned concurrency available.
  final int? availableProvisionedConcurrentExecutions;

  /// The Amazon Resource Name (ARN) of the alias or version.
  final String? functionArn;

  /// The date and time that a user last updated the configuration, in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601
  /// format</a>.
  final String? lastModified;

  /// The amount of provisioned concurrency requested.
  final int? requestedProvisionedConcurrentExecutions;

  /// The status of the allocation process.
  final ProvisionedConcurrencyStatusEnum? status;

  /// For failed allocations, the reason that provisioned concurrency could not be
  /// allocated.
  final String? statusReason;

  ProvisionedConcurrencyConfigListItem({
    this.allocatedProvisionedConcurrentExecutions,
    this.availableProvisionedConcurrentExecutions,
    this.functionArn,
    this.lastModified,
    this.requestedProvisionedConcurrentExecutions,
    this.status,
    this.statusReason,
  });

  factory ProvisionedConcurrencyConfigListItem.fromJson(
      Map<String, dynamic> json) {
    return ProvisionedConcurrencyConfigListItem(
      allocatedProvisionedConcurrentExecutions:
          json['AllocatedProvisionedConcurrentExecutions'] as int?,
      availableProvisionedConcurrentExecutions:
          json['AvailableProvisionedConcurrentExecutions'] as int?,
      functionArn: json['FunctionArn'] as String?,
      lastModified: json['LastModified'] as String?,
      requestedProvisionedConcurrentExecutions:
          json['RequestedProvisionedConcurrentExecutions'] as int?,
      status: (json['Status'] as String?)
          ?.let(ProvisionedConcurrencyStatusEnum.fromString),
      statusReason: json['StatusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final allocatedProvisionedConcurrentExecutions =
        this.allocatedProvisionedConcurrentExecutions;
    final availableProvisionedConcurrentExecutions =
        this.availableProvisionedConcurrentExecutions;
    final functionArn = this.functionArn;
    final lastModified = this.lastModified;
    final requestedProvisionedConcurrentExecutions =
        this.requestedProvisionedConcurrentExecutions;
    final status = this.status;
    final statusReason = this.statusReason;
    return {
      if (allocatedProvisionedConcurrentExecutions != null)
        'AllocatedProvisionedConcurrentExecutions':
            allocatedProvisionedConcurrentExecutions,
      if (availableProvisionedConcurrentExecutions != null)
        'AvailableProvisionedConcurrentExecutions':
            availableProvisionedConcurrentExecutions,
      if (functionArn != null) 'FunctionArn': functionArn,
      if (lastModified != null) 'LastModified': lastModified,
      if (requestedProvisionedConcurrentExecutions != null)
        'RequestedProvisionedConcurrentExecutions':
            requestedProvisionedConcurrentExecutions,
      if (status != null) 'Status': status.value,
      if (statusReason != null) 'StatusReason': statusReason,
    };
  }
}

/// Details about a Lambda function URL.
///
/// @nodoc
class FunctionUrlConfig {
  /// The type of authentication that your function URL uses. Set to
  /// <code>AWS_IAM</code> if you want to restrict access to authenticated users
  /// only. Set to <code>NONE</code> if you want to bypass IAM authentication to
  /// create a public endpoint. For more information, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/urls-auth.html">Security
  /// and auth model for Lambda function URLs</a>.
  final FunctionUrlAuthType authType;

  /// When the function URL was created, in <a
  /// href="https://www.w3.org/TR/NOTE-datetime">ISO-8601 format</a>
  /// (YYYY-MM-DDThh:mm:ss.sTZD).
  final String creationTime;

  /// The Amazon Resource Name (ARN) of your function.
  final String functionArn;

  /// The HTTP URL endpoint for your function.
  final String functionUrl;

  /// When the function URL configuration was last updated, in <a
  /// href="https://www.w3.org/TR/NOTE-datetime">ISO-8601 format</a>
  /// (YYYY-MM-DDThh:mm:ss.sTZD).
  final String lastModifiedTime;

  /// The <a
  /// href="https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS">cross-origin
  /// resource sharing (CORS)</a> settings for your function URL.
  final Cors? cors;

  /// Use one of the following options:
  ///
  /// <ul>
  /// <li>
  /// <code>BUFFERED</code> – This is the default option. Lambda invokes your
  /// function using the <code>Invoke</code> API operation. Invocation results are
  /// available when the payload is complete. The maximum payload size is 6 MB.
  /// </li>
  /// <li>
  /// <code>RESPONSE_STREAM</code> – Your function streams payload results as they
  /// become available. Lambda invokes your function using the
  /// <code>InvokeWithResponseStream</code> API operation. The maximum response
  /// payload size is 200 MB.
  /// </li>
  /// </ul>
  final InvokeMode? invokeMode;

  FunctionUrlConfig({
    required this.authType,
    required this.creationTime,
    required this.functionArn,
    required this.functionUrl,
    required this.lastModifiedTime,
    this.cors,
    this.invokeMode,
  });

  factory FunctionUrlConfig.fromJson(Map<String, dynamic> json) {
    return FunctionUrlConfig(
      authType:
          FunctionUrlAuthType.fromString((json['AuthType'] as String?) ?? ''),
      creationTime: (json['CreationTime'] as String?) ?? '',
      functionArn: (json['FunctionArn'] as String?) ?? '',
      functionUrl: (json['FunctionUrl'] as String?) ?? '',
      lastModifiedTime: (json['LastModifiedTime'] as String?) ?? '',
      cors: json['Cors'] != null
          ? Cors.fromJson(json['Cors'] as Map<String, dynamic>)
          : null,
      invokeMode: (json['InvokeMode'] as String?)?.let(InvokeMode.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final authType = this.authType;
    final creationTime = this.creationTime;
    final functionArn = this.functionArn;
    final functionUrl = this.functionUrl;
    final lastModifiedTime = this.lastModifiedTime;
    final cors = this.cors;
    final invokeMode = this.invokeMode;
    return {
      'AuthType': authType.value,
      'CreationTime': creationTime,
      'FunctionArn': functionArn,
      'FunctionUrl': functionUrl,
      'LastModifiedTime': lastModifiedTime,
      if (cors != null) 'Cors': cors,
      if (invokeMode != null) 'InvokeMode': invokeMode.value,
    };
  }
}

/// @nodoc
class FunctionVersion {
  static const all = FunctionVersion._('ALL');

  final String value;

  const FunctionVersion._(this.value);

  static const values = [all];

  static FunctionVersion fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => FunctionVersion._(value));

  @override
  bool operator ==(other) => other is FunctionVersion && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The VPC security groups and subnets that are attached to a Lambda function.
///
/// @nodoc
class VpcConfigResponse {
  /// Allows outbound IPv6 traffic on VPC functions that are connected to
  /// dual-stack subnets.
  final bool? ipv6AllowedForDualStack;

  /// A list of VPC security group IDs.
  final List<String>? securityGroupIds;

  /// A list of VPC subnet IDs.
  final List<String>? subnetIds;

  /// The ID of the VPC.
  final String? vpcId;

  VpcConfigResponse({
    this.ipv6AllowedForDualStack,
    this.securityGroupIds,
    this.subnetIds,
    this.vpcId,
  });

  factory VpcConfigResponse.fromJson(Map<String, dynamic> json) {
    return VpcConfigResponse(
      ipv6AllowedForDualStack: json['Ipv6AllowedForDualStack'] as bool?,
      securityGroupIds: (json['SecurityGroupIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      subnetIds: (json['SubnetIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      vpcId: json['VpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ipv6AllowedForDualStack = this.ipv6AllowedForDualStack;
    final securityGroupIds = this.securityGroupIds;
    final subnetIds = this.subnetIds;
    final vpcId = this.vpcId;
    return {
      if (ipv6AllowedForDualStack != null)
        'Ipv6AllowedForDualStack': ipv6AllowedForDualStack,
      if (securityGroupIds != null) 'SecurityGroupIds': securityGroupIds,
      if (subnetIds != null) 'SubnetIds': subnetIds,
      if (vpcId != null) 'VpcId': vpcId,
    };
  }
}

/// The results of an operation to update or read environment variables. If the
/// operation succeeds, the response contains the environment variables. If it
/// fails, the response contains details about the error.
///
/// @nodoc
class EnvironmentResponse {
  /// Error messages for environment variables that couldn't be applied.
  final EnvironmentError? error;

  /// Environment variable key-value pairs. Omitted from CloudTrail logs.
  final Map<String, String>? variables;

  EnvironmentResponse({
    this.error,
    this.variables,
  });

  factory EnvironmentResponse.fromJson(Map<String, dynamic> json) {
    return EnvironmentResponse(
      error: json['Error'] != null
          ? EnvironmentError.fromJson(json['Error'] as Map<String, dynamic>)
          : null,
      variables: (json['Variables'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final error = this.error;
    final variables = this.variables;
    return {
      if (error != null) 'Error': error,
      if (variables != null) 'Variables': variables,
    };
  }
}

/// The function's X-Ray tracing configuration.
///
/// @nodoc
class TracingConfigResponse {
  /// The tracing mode.
  final TracingMode? mode;

  TracingConfigResponse({
    this.mode,
  });

  factory TracingConfigResponse.fromJson(Map<String, dynamic> json) {
    return TracingConfigResponse(
      mode: (json['Mode'] as String?)?.let(TracingMode.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final mode = this.mode;
    return {
      if (mode != null) 'Mode': mode.value,
    };
  }
}

/// @nodoc
class StateReasonCode {
  static const idle = StateReasonCode._('Idle');
  static const creating = StateReasonCode._('Creating');
  static const restoring = StateReasonCode._('Restoring');
  static const eniLimitExceeded = StateReasonCode._('EniLimitExceeded');
  static const insufficientRolePermissions =
      StateReasonCode._('InsufficientRolePermissions');
  static const invalidConfiguration = StateReasonCode._('InvalidConfiguration');
  static const internalError = StateReasonCode._('InternalError');
  static const subnetOutOfIPAddresses =
      StateReasonCode._('SubnetOutOfIPAddresses');
  static const invalidSubnet = StateReasonCode._('InvalidSubnet');
  static const invalidSecurityGroup = StateReasonCode._('InvalidSecurityGroup');
  static const imageDeleted = StateReasonCode._('ImageDeleted');
  static const imageAccessDenied = StateReasonCode._('ImageAccessDenied');
  static const invalidImage = StateReasonCode._('InvalidImage');
  static const kMSKeyAccessDenied = StateReasonCode._('KMSKeyAccessDenied');
  static const kMSKeyNotFound = StateReasonCode._('KMSKeyNotFound');
  static const invalidStateKMSKey = StateReasonCode._('InvalidStateKMSKey');
  static const disabledKMSKey = StateReasonCode._('DisabledKMSKey');
  static const eFSIOError = StateReasonCode._('EFSIOError');
  static const eFSMountConnectivityError =
      StateReasonCode._('EFSMountConnectivityError');
  static const eFSMountFailure = StateReasonCode._('EFSMountFailure');
  static const eFSMountTimeout = StateReasonCode._('EFSMountTimeout');
  static const invalidRuntime = StateReasonCode._('InvalidRuntime');
  static const invalidZipFileException =
      StateReasonCode._('InvalidZipFileException');
  static const functionError = StateReasonCode._('FunctionError');
  static const drainingDurableExecutions =
      StateReasonCode._('DrainingDurableExecutions');
  static const vcpuLimitExceeded = StateReasonCode._('VcpuLimitExceeded');
  static const capacityProviderScalingLimitExceeded =
      StateReasonCode._('CapacityProviderScalingLimitExceeded');
  static const insufficientCapacity = StateReasonCode._('InsufficientCapacity');
  static const eC2RequestLimitExceeded =
      StateReasonCode._('EC2RequestLimitExceeded');
  static const functionErrorInitTimeout =
      StateReasonCode._('FunctionError.InitTimeout');
  static const functionErrorRuntimeInitError =
      StateReasonCode._('FunctionError.RuntimeInitError');
  static const functionErrorExtensionInitError =
      StateReasonCode._('FunctionError.ExtensionInitError');
  static const functionErrorInvalidEntryPoint =
      StateReasonCode._('FunctionError.InvalidEntryPoint');
  static const functionErrorInvalidWorkingDirectory =
      StateReasonCode._('FunctionError.InvalidWorkingDirectory');
  static const functionErrorPermissionDenied =
      StateReasonCode._('FunctionError.PermissionDenied');
  static const functionErrorTooManyExtensions =
      StateReasonCode._('FunctionError.TooManyExtensions');
  static const functionErrorInitResourceExhausted =
      StateReasonCode._('FunctionError.InitResourceExhausted');
  static const disallowedByVpcEncryptionControl =
      StateReasonCode._('DisallowedByVpcEncryptionControl');

  final String value;

  const StateReasonCode._(this.value);

  static const values = [
    idle,
    creating,
    restoring,
    eniLimitExceeded,
    insufficientRolePermissions,
    invalidConfiguration,
    internalError,
    subnetOutOfIPAddresses,
    invalidSubnet,
    invalidSecurityGroup,
    imageDeleted,
    imageAccessDenied,
    invalidImage,
    kMSKeyAccessDenied,
    kMSKeyNotFound,
    invalidStateKMSKey,
    disabledKMSKey,
    eFSIOError,
    eFSMountConnectivityError,
    eFSMountFailure,
    eFSMountTimeout,
    invalidRuntime,
    invalidZipFileException,
    functionError,
    drainingDurableExecutions,
    vcpuLimitExceeded,
    capacityProviderScalingLimitExceeded,
    insufficientCapacity,
    eC2RequestLimitExceeded,
    functionErrorInitTimeout,
    functionErrorRuntimeInitError,
    functionErrorExtensionInitError,
    functionErrorInvalidEntryPoint,
    functionErrorInvalidWorkingDirectory,
    functionErrorPermissionDenied,
    functionErrorTooManyExtensions,
    functionErrorInitResourceExhausted,
    disallowedByVpcEncryptionControl
  ];

  static StateReasonCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => StateReasonCode._(value));

  @override
  bool operator ==(other) => other is StateReasonCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class LastUpdateStatus {
  static const successful = LastUpdateStatus._('Successful');
  static const failed = LastUpdateStatus._('Failed');
  static const inProgress = LastUpdateStatus._('InProgress');

  final String value;

  const LastUpdateStatus._(this.value);

  static const values = [successful, failed, inProgress];

  static LastUpdateStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => LastUpdateStatus._(value));

  @override
  bool operator ==(other) => other is LastUpdateStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class LastUpdateStatusReasonCode {
  static const eniLimitExceeded =
      LastUpdateStatusReasonCode._('EniLimitExceeded');
  static const insufficientRolePermissions =
      LastUpdateStatusReasonCode._('InsufficientRolePermissions');
  static const invalidConfiguration =
      LastUpdateStatusReasonCode._('InvalidConfiguration');
  static const internalError = LastUpdateStatusReasonCode._('InternalError');
  static const subnetOutOfIPAddresses =
      LastUpdateStatusReasonCode._('SubnetOutOfIPAddresses');
  static const invalidSubnet = LastUpdateStatusReasonCode._('InvalidSubnet');
  static const invalidSecurityGroup =
      LastUpdateStatusReasonCode._('InvalidSecurityGroup');
  static const imageDeleted = LastUpdateStatusReasonCode._('ImageDeleted');
  static const imageAccessDenied =
      LastUpdateStatusReasonCode._('ImageAccessDenied');
  static const invalidImage = LastUpdateStatusReasonCode._('InvalidImage');
  static const kMSKeyAccessDenied =
      LastUpdateStatusReasonCode._('KMSKeyAccessDenied');
  static const kMSKeyNotFound = LastUpdateStatusReasonCode._('KMSKeyNotFound');
  static const invalidStateKMSKey =
      LastUpdateStatusReasonCode._('InvalidStateKMSKey');
  static const disabledKMSKey = LastUpdateStatusReasonCode._('DisabledKMSKey');
  static const eFSIOError = LastUpdateStatusReasonCode._('EFSIOError');
  static const eFSMountConnectivityError =
      LastUpdateStatusReasonCode._('EFSMountConnectivityError');
  static const eFSMountFailure =
      LastUpdateStatusReasonCode._('EFSMountFailure');
  static const eFSMountTimeout =
      LastUpdateStatusReasonCode._('EFSMountTimeout');
  static const invalidRuntime = LastUpdateStatusReasonCode._('InvalidRuntime');
  static const invalidZipFileException =
      LastUpdateStatusReasonCode._('InvalidZipFileException');
  static const functionError = LastUpdateStatusReasonCode._('FunctionError');
  static const vcpuLimitExceeded =
      LastUpdateStatusReasonCode._('VcpuLimitExceeded');
  static const capacityProviderScalingLimitExceeded =
      LastUpdateStatusReasonCode._('CapacityProviderScalingLimitExceeded');
  static const insufficientCapacity =
      LastUpdateStatusReasonCode._('InsufficientCapacity');
  static const eC2RequestLimitExceeded =
      LastUpdateStatusReasonCode._('EC2RequestLimitExceeded');
  static const functionErrorInitTimeout =
      LastUpdateStatusReasonCode._('FunctionError.InitTimeout');
  static const functionErrorRuntimeInitError =
      LastUpdateStatusReasonCode._('FunctionError.RuntimeInitError');
  static const functionErrorExtensionInitError =
      LastUpdateStatusReasonCode._('FunctionError.ExtensionInitError');
  static const functionErrorInvalidEntryPoint =
      LastUpdateStatusReasonCode._('FunctionError.InvalidEntryPoint');
  static const functionErrorInvalidWorkingDirectory =
      LastUpdateStatusReasonCode._('FunctionError.InvalidWorkingDirectory');
  static const functionErrorPermissionDenied =
      LastUpdateStatusReasonCode._('FunctionError.PermissionDenied');
  static const functionErrorTooManyExtensions =
      LastUpdateStatusReasonCode._('FunctionError.TooManyExtensions');
  static const functionErrorInitResourceExhausted =
      LastUpdateStatusReasonCode._('FunctionError.InitResourceExhausted');
  static const disallowedByVpcEncryptionControl =
      LastUpdateStatusReasonCode._('DisallowedByVpcEncryptionControl');
  static const creating = LastUpdateStatusReasonCode._('Creating');

  final String value;

  const LastUpdateStatusReasonCode._(this.value);

  static const values = [
    eniLimitExceeded,
    insufficientRolePermissions,
    invalidConfiguration,
    internalError,
    subnetOutOfIPAddresses,
    invalidSubnet,
    invalidSecurityGroup,
    imageDeleted,
    imageAccessDenied,
    invalidImage,
    kMSKeyAccessDenied,
    kMSKeyNotFound,
    invalidStateKMSKey,
    disabledKMSKey,
    eFSIOError,
    eFSMountConnectivityError,
    eFSMountFailure,
    eFSMountTimeout,
    invalidRuntime,
    invalidZipFileException,
    functionError,
    vcpuLimitExceeded,
    capacityProviderScalingLimitExceeded,
    insufficientCapacity,
    eC2RequestLimitExceeded,
    functionErrorInitTimeout,
    functionErrorRuntimeInitError,
    functionErrorExtensionInitError,
    functionErrorInvalidEntryPoint,
    functionErrorInvalidWorkingDirectory,
    functionErrorPermissionDenied,
    functionErrorTooManyExtensions,
    functionErrorInitResourceExhausted,
    disallowedByVpcEncryptionControl,
    creating
  ];

  static LastUpdateStatusReasonCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => LastUpdateStatusReasonCode._(value));

  @override
  bool operator ==(other) =>
      other is LastUpdateStatusReasonCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class PackageType {
  static const zip = PackageType._('Zip');
  static const image = PackageType._('Image');

  final String value;

  const PackageType._(this.value);

  static const values = [zip, image];

  static PackageType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => PackageType._(value));

  @override
  bool operator ==(other) => other is PackageType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Response to a <code>GetFunctionConfiguration</code> request.
///
/// @nodoc
class ImageConfigResponse {
  /// Error response to <code>GetFunctionConfiguration</code>.
  final ImageConfigError? error;

  /// Configuration values that override the container image Dockerfile.
  final ImageConfig? imageConfig;

  ImageConfigResponse({
    this.error,
    this.imageConfig,
  });

  factory ImageConfigResponse.fromJson(Map<String, dynamic> json) {
    return ImageConfigResponse(
      error: json['Error'] != null
          ? ImageConfigError.fromJson(json['Error'] as Map<String, dynamic>)
          : null,
      imageConfig: json['ImageConfig'] != null
          ? ImageConfig.fromJson(json['ImageConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final error = this.error;
    final imageConfig = this.imageConfig;
    return {
      if (error != null) 'Error': error,
      if (imageConfig != null) 'ImageConfig': imageConfig,
    };
  }
}

/// The function's <a
/// href="https://docs.aws.amazon.com/lambda/latest/dg/snapstart.html">SnapStart</a>
/// setting.
///
/// @nodoc
class SnapStartResponse {
  /// When set to <code>PublishedVersions</code>, Lambda creates a snapshot of the
  /// execution environment when you publish a function version.
  final SnapStartApplyOn? applyOn;

  /// When you provide a <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-versions.html#versioning-versions-using">qualified
  /// Amazon Resource Name (ARN)</a>, this response element indicates whether
  /// SnapStart is activated for the specified function version.
  final SnapStartOptimizationStatus? optimizationStatus;

  SnapStartResponse({
    this.applyOn,
    this.optimizationStatus,
  });

  factory SnapStartResponse.fromJson(Map<String, dynamic> json) {
    return SnapStartResponse(
      applyOn: (json['ApplyOn'] as String?)?.let(SnapStartApplyOn.fromString),
      optimizationStatus: (json['OptimizationStatus'] as String?)
          ?.let(SnapStartOptimizationStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final applyOn = this.applyOn;
    final optimizationStatus = this.optimizationStatus;
    return {
      if (applyOn != null) 'ApplyOn': applyOn.value,
      if (optimizationStatus != null)
        'OptimizationStatus': optimizationStatus.value,
    };
  }
}

/// The ARN of the runtime and any errors that occured.
///
/// @nodoc
class RuntimeVersionConfig {
  /// Error response when Lambda is unable to retrieve the runtime version for a
  /// function.
  final RuntimeVersionError? error;

  /// The ARN of the runtime version you want the function to use.
  final String? runtimeVersionArn;

  RuntimeVersionConfig({
    this.error,
    this.runtimeVersionArn,
  });

  factory RuntimeVersionConfig.fromJson(Map<String, dynamic> json) {
    return RuntimeVersionConfig(
      error: json['Error'] != null
          ? RuntimeVersionError.fromJson(json['Error'] as Map<String, dynamic>)
          : null,
      runtimeVersionArn: json['RuntimeVersionArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final error = this.error;
    final runtimeVersionArn = this.runtimeVersionArn;
    return {
      if (error != null) 'Error': error,
      if (runtimeVersionArn != null) 'RuntimeVersionArn': runtimeVersionArn,
    };
  }
}

/// Specifies the tenant isolation mode configuration for a Lambda function.
/// This allows you to configure specific tenant isolation strategies for your
/// function invocations. Tenant isolation configuration cannot be modified
/// after function creation.
///
/// @nodoc
class TenancyConfig {
  /// Tenant isolation mode allows for invocation to be sent to a corresponding
  /// execution environment dedicated to a specific tenant ID.
  final TenantIsolationMode tenantIsolationMode;

  TenancyConfig({
    required this.tenantIsolationMode,
  });

  factory TenancyConfig.fromJson(Map<String, dynamic> json) {
    return TenancyConfig(
      tenantIsolationMode: TenantIsolationMode.fromString(
          (json['TenantIsolationMode'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final tenantIsolationMode = this.tenantIsolationMode;
    return {
      'TenantIsolationMode': tenantIsolationMode.value,
    };
  }
}

/// @nodoc
class TenantIsolationMode {
  static const perTenant = TenantIsolationMode._('PER_TENANT');

  final String value;

  const TenantIsolationMode._(this.value);

  static const values = [perTenant];

  static TenantIsolationMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TenantIsolationMode._(value));

  @override
  bool operator ==(other) =>
      other is TenantIsolationMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Any error returned when the runtime version information for the function
/// could not be retrieved.
///
/// @nodoc
class RuntimeVersionError {
  /// The error code.
  final String? errorCode;

  /// The error message.
  final String? message;

  RuntimeVersionError({
    this.errorCode,
    this.message,
  });

  factory RuntimeVersionError.fromJson(Map<String, dynamic> json) {
    return RuntimeVersionError(
      errorCode: json['ErrorCode'] as String?,
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final message = this.message;
    return {
      if (errorCode != null) 'ErrorCode': errorCode,
      if (message != null) 'Message': message,
    };
  }
}

/// @nodoc
class SnapStartOptimizationStatus {
  static const on = SnapStartOptimizationStatus._('On');
  static const off = SnapStartOptimizationStatus._('Off');

  final String value;

  const SnapStartOptimizationStatus._(this.value);

  static const values = [on, off];

  static SnapStartOptimizationStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SnapStartOptimizationStatus._(value));

  @override
  bool operator ==(other) =>
      other is SnapStartOptimizationStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Error response to <code>GetFunctionConfiguration</code>.
///
/// @nodoc
class ImageConfigError {
  /// Error code.
  final String? errorCode;

  /// Error message.
  final String? message;

  ImageConfigError({
    this.errorCode,
    this.message,
  });

  factory ImageConfigError.fromJson(Map<String, dynamic> json) {
    return ImageConfigError(
      errorCode: json['ErrorCode'] as String?,
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final message = this.message;
    return {
      if (errorCode != null) 'ErrorCode': errorCode,
      if (message != null) 'Message': message,
    };
  }
}

/// An <a
/// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">Lambda
/// layer</a>.
///
/// @nodoc
class Layer {
  /// The Amazon Resource Name (ARN) of the function layer.
  final String? arn;

  /// The size of the layer archive in bytes.
  final int? codeSize;

  /// The Amazon Resource Name (ARN) of a signing job.
  final String? signingJobArn;

  /// The Amazon Resource Name (ARN) for a signing profile version.
  final String? signingProfileVersionArn;

  Layer({
    this.arn,
    this.codeSize,
    this.signingJobArn,
    this.signingProfileVersionArn,
  });

  factory Layer.fromJson(Map<String, dynamic> json) {
    return Layer(
      arn: json['Arn'] as String?,
      codeSize: json['CodeSize'] as int?,
      signingJobArn: json['SigningJobArn'] as String?,
      signingProfileVersionArn: json['SigningProfileVersionArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final codeSize = this.codeSize;
    final signingJobArn = this.signingJobArn;
    final signingProfileVersionArn = this.signingProfileVersionArn;
    return {
      if (arn != null) 'Arn': arn,
      if (codeSize != null) 'CodeSize': codeSize,
      if (signingJobArn != null) 'SigningJobArn': signingJobArn,
      if (signingProfileVersionArn != null)
        'SigningProfileVersionArn': signingProfileVersionArn,
    };
  }
}

/// Error messages for environment variables that couldn't be applied.
///
/// @nodoc
class EnvironmentError {
  /// The error code.
  final String? errorCode;

  /// The error message.
  final String? message;

  EnvironmentError({
    this.errorCode,
    this.message,
  });

  factory EnvironmentError.fromJson(Map<String, dynamic> json) {
    return EnvironmentError(
      errorCode: json['ErrorCode'] as String?,
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final message = this.message;
    return {
      if (errorCode != null) 'ErrorCode': errorCode,
      if (message != null) 'Message': message,
    };
  }
}

/// The code for the Lambda function. You can either specify an object in Amazon
/// S3, upload a .zip file archive deployment package directly, or specify the
/// URI of a container image.
///
/// @nodoc
class FunctionCode {
  /// URI of a <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-images.html">container
  /// image</a> in the Amazon ECR registry.
  final String? imageUri;

  /// An Amazon S3 bucket in the same Amazon Web Services Region as your function.
  /// The bucket can be in a different Amazon Web Services account.
  final String? s3Bucket;

  /// The Amazon S3 key of the deployment package.
  final String? s3Key;

  /// For versioned objects, the version of the deployment package object to use.
  final String? s3ObjectVersion;

  /// The ARN of the Key Management Service (KMS) customer managed key that's used
  /// to encrypt your function's .zip deployment package. If you don't provide a
  /// customer managed key, Lambda uses an <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-owned-cmk">Amazon
  /// Web Services owned key</a>.
  final String? sourceKMSKeyArn;

  /// The base64-encoded contents of the deployment package. Amazon Web Services
  /// SDK and CLI clients handle the encoding for you.
  final Uint8List? zipFile;

  FunctionCode({
    this.imageUri,
    this.s3Bucket,
    this.s3Key,
    this.s3ObjectVersion,
    this.sourceKMSKeyArn,
    this.zipFile,
  });

  Map<String, dynamic> toJson() {
    final imageUri = this.imageUri;
    final s3Bucket = this.s3Bucket;
    final s3Key = this.s3Key;
    final s3ObjectVersion = this.s3ObjectVersion;
    final sourceKMSKeyArn = this.sourceKMSKeyArn;
    final zipFile = this.zipFile;
    return {
      if (imageUri != null) 'ImageUri': imageUri,
      if (s3Bucket != null) 'S3Bucket': s3Bucket,
      if (s3Key != null) 'S3Key': s3Key,
      if (s3ObjectVersion != null) 'S3ObjectVersion': s3ObjectVersion,
      if (sourceKMSKeyArn != null) 'SourceKMSKeyArn': sourceKMSKeyArn,
      if (zipFile != null) 'ZipFile': base64Encode(zipFile),
    };
  }
}

/// An object that contains the filters for an event source.
///
/// @nodoc
class FilterCriteria {
  /// A list of filters.
  final List<Filter>? filters;

  FilterCriteria({
    this.filters,
  });

  factory FilterCriteria.fromJson(Map<String, dynamic> json) {
    return FilterCriteria(
      filters: (json['Filters'] as List?)
          ?.nonNulls
          .map((e) => Filter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final filters = this.filters;
    return {
      if (filters != null) 'Filters': filters,
    };
  }
}

/// A configuration object that specifies the destination of an event after
/// Lambda processes it. For more information, see <a
/// href="https://docs.aws.amazon.com/lambda/latest/dg/invocation-async-retain-records.html#invocation-async-destinations">Adding
/// a destination</a>.
///
/// @nodoc
class DestinationConfig {
  /// The destination configuration for failed invocations.
  final OnFailure? onFailure;

  /// The destination configuration for successful invocations. Not supported in
  /// <code>CreateEventSourceMapping</code> or
  /// <code>UpdateEventSourceMapping</code>.
  final OnSuccess? onSuccess;

  DestinationConfig({
    this.onFailure,
    this.onSuccess,
  });

  factory DestinationConfig.fromJson(Map<String, dynamic> json) {
    return DestinationConfig(
      onFailure: json['OnFailure'] != null
          ? OnFailure.fromJson(json['OnFailure'] as Map<String, dynamic>)
          : null,
      onSuccess: json['OnSuccess'] != null
          ? OnSuccess.fromJson(json['OnSuccess'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final onFailure = this.onFailure;
    final onSuccess = this.onSuccess;
    return {
      if (onFailure != null) 'OnFailure': onFailure,
      if (onSuccess != null) 'OnSuccess': onSuccess,
    };
  }
}

/// (Amazon SQS only) The scaling configuration for the event source. To remove
/// the configuration, pass an empty value.
///
/// @nodoc
class ScalingConfig {
  /// Limits the number of concurrent instances that the Amazon SQS event source
  /// can invoke.
  final int? maximumConcurrency;

  ScalingConfig({
    this.maximumConcurrency,
  });

  factory ScalingConfig.fromJson(Map<String, dynamic> json) {
    return ScalingConfig(
      maximumConcurrency: json['MaximumConcurrency'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final maximumConcurrency = this.maximumConcurrency;
    return {
      if (maximumConcurrency != null) 'MaximumConcurrency': maximumConcurrency,
    };
  }
}

/// Specific configuration settings for an Amazon Managed Streaming for Apache
/// Kafka (Amazon MSK) event source.
///
/// @nodoc
class AmazonManagedKafkaEventSourceConfig {
  /// The identifier for the Kafka consumer group to join. The consumer group ID
  /// must be unique among all your Kafka event sources. After creating a Kafka
  /// event source mapping with the consumer group ID specified, you cannot update
  /// this value. For more information, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/with-msk.html#services-msk-consumer-group-id">Customizable
  /// consumer group ID</a>.
  final String? consumerGroupId;

  /// Specific configuration settings for a Kafka schema registry.
  final KafkaSchemaRegistryConfig? schemaRegistryConfig;

  AmazonManagedKafkaEventSourceConfig({
    this.consumerGroupId,
    this.schemaRegistryConfig,
  });

  factory AmazonManagedKafkaEventSourceConfig.fromJson(
      Map<String, dynamic> json) {
    return AmazonManagedKafkaEventSourceConfig(
      consumerGroupId: json['ConsumerGroupId'] as String?,
      schemaRegistryConfig: json['SchemaRegistryConfig'] != null
          ? KafkaSchemaRegistryConfig.fromJson(
              json['SchemaRegistryConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final consumerGroupId = this.consumerGroupId;
    final schemaRegistryConfig = this.schemaRegistryConfig;
    return {
      if (consumerGroupId != null) 'ConsumerGroupId': consumerGroupId,
      if (schemaRegistryConfig != null)
        'SchemaRegistryConfig': schemaRegistryConfig,
    };
  }
}

/// Specific configuration settings for a self-managed Apache Kafka event
/// source.
///
/// @nodoc
class SelfManagedKafkaEventSourceConfig {
  /// The identifier for the Kafka consumer group to join. The consumer group ID
  /// must be unique among all your Kafka event sources. After creating a Kafka
  /// event source mapping with the consumer group ID specified, you cannot update
  /// this value. For more information, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/with-kafka-process.html#services-smaa-topic-add">Customizable
  /// consumer group ID</a>.
  final String? consumerGroupId;

  /// Specific configuration settings for a Kafka schema registry.
  final KafkaSchemaRegistryConfig? schemaRegistryConfig;

  SelfManagedKafkaEventSourceConfig({
    this.consumerGroupId,
    this.schemaRegistryConfig,
  });

  factory SelfManagedKafkaEventSourceConfig.fromJson(
      Map<String, dynamic> json) {
    return SelfManagedKafkaEventSourceConfig(
      consumerGroupId: json['ConsumerGroupId'] as String?,
      schemaRegistryConfig: json['SchemaRegistryConfig'] != null
          ? KafkaSchemaRegistryConfig.fromJson(
              json['SchemaRegistryConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final consumerGroupId = this.consumerGroupId;
    final schemaRegistryConfig = this.schemaRegistryConfig;
    return {
      if (consumerGroupId != null) 'ConsumerGroupId': consumerGroupId,
      if (schemaRegistryConfig != null)
        'SchemaRegistryConfig': schemaRegistryConfig,
    };
  }
}

/// Specific configuration settings for a DocumentDB event source.
///
/// @nodoc
class DocumentDBEventSourceConfig {
  /// The name of the collection to consume within the database. If you do not
  /// specify a collection, Lambda consumes all collections.
  final String? collectionName;

  /// The name of the database to consume within the DocumentDB cluster.
  final String? databaseName;

  /// Determines what DocumentDB sends to your event stream during document update
  /// operations. If set to UpdateLookup, DocumentDB sends a delta describing the
  /// changes, along with a copy of the entire document. Otherwise, DocumentDB
  /// sends only a partial document that contains the changes.
  final FullDocument? fullDocument;

  DocumentDBEventSourceConfig({
    this.collectionName,
    this.databaseName,
    this.fullDocument,
  });

  factory DocumentDBEventSourceConfig.fromJson(Map<String, dynamic> json) {
    return DocumentDBEventSourceConfig(
      collectionName: json['CollectionName'] as String?,
      databaseName: json['DatabaseName'] as String?,
      fullDocument:
          (json['FullDocument'] as String?)?.let(FullDocument.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final collectionName = this.collectionName;
    final databaseName = this.databaseName;
    final fullDocument = this.fullDocument;
    return {
      if (collectionName != null) 'CollectionName': collectionName,
      if (databaseName != null) 'DatabaseName': databaseName,
      if (fullDocument != null) 'FullDocument': fullDocument.value,
    };
  }
}

/// The metrics configuration for your event source. Use this configuration
/// object to define which metrics you want your event source mapping to
/// produce.
///
/// @nodoc
class EventSourceMappingMetricsConfig {
  /// The metrics you want your event source mapping to produce, including
  /// <code>EventCount</code>, <code>ErrorCount</code>, <code>KafkaMetrics</code>.
  ///
  /// <ul>
  /// <li>
  /// <code>EventCount</code> to receive metrics related to the number of events
  /// processed by your event source mapping.
  /// </li>
  /// <li>
  /// <code>ErrorCount</code> (Amazon MSK and self-managed Apache Kafka) to
  /// receive metrics related to the number of errors in your event source mapping
  /// processing.
  /// </li>
  /// <li>
  /// <code>KafkaMetrics</code> (Amazon MSK and self-managed Apache Kafka) to
  /// receive metrics related to the Kafka consumers from your event source
  /// mapping.
  /// </li>
  /// </ul>
  /// For more information about these metrics, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/monitoring-metrics-types.html#event-source-mapping-metrics">
  /// Event source mapping metrics</a>.
  final List<EventSourceMappingMetric>? metrics;

  EventSourceMappingMetricsConfig({
    this.metrics,
  });

  factory EventSourceMappingMetricsConfig.fromJson(Map<String, dynamic> json) {
    return EventSourceMappingMetricsConfig(
      metrics: (json['Metrics'] as List?)
          ?.nonNulls
          .map((e) => EventSourceMappingMetric.fromString((e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final metrics = this.metrics;
    return {
      if (metrics != null) 'Metrics': metrics.map((e) => e.value).toList(),
    };
  }
}

/// (Amazon MSK, and self-managed Apache Kafka only) The logging configuration
/// for your event source. Use this configuration object to define the level of
/// logs for your event source mapping.
///
/// @nodoc
class EventSourceMappingLoggingConfig {
  /// The log level you want your event source mapping to use. Lambda event poller
  /// only sends system logs at the selected level of detail and lower, where
  /// <code>DEBUG</code> is the highest level and <code>WARN</code> is the lowest.
  /// For more information about these metrics, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/esm-logging.html"> Event
  /// source mapping logging</a>.
  final EventSourceMappingSystemLogLevel? systemLogLevel;

  EventSourceMappingLoggingConfig({
    this.systemLogLevel,
  });

  factory EventSourceMappingLoggingConfig.fromJson(Map<String, dynamic> json) {
    return EventSourceMappingLoggingConfig(
      systemLogLevel: (json['SystemLogLevel'] as String?)
          ?.let(EventSourceMappingSystemLogLevel.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final systemLogLevel = this.systemLogLevel;
    return {
      if (systemLogLevel != null) 'SystemLogLevel': systemLogLevel.value,
    };
  }
}

/// The <a
/// href="https://docs.aws.amazon.com/lambda/latest/dg/invocation-eventsourcemapping.html#invocation-eventsourcemapping-provisioned-mode">
/// provisioned mode</a> configuration for the event source. Use Provisioned
/// Mode to customize the minimum and maximum number of event pollers for your
/// event source.
///
/// @nodoc
class ProvisionedPollerConfig {
  /// The maximum number of event pollers this event source can scale up to. For
  /// Amazon SQS events source mappings, default is 200, and minimum value allowed
  /// is 2. For Amazon MSK and self-managed Apache Kafka event source mappings,
  /// default is 200, and minimum value allowed is 1.
  final int? maximumPollers;

  /// The minimum number of event pollers this event source can scale down to. For
  /// Amazon SQS events source mappings, default is 2, and minimum 2 required. For
  /// Amazon MSK and self-managed Apache Kafka event source mappings, default is
  /// 1.
  final int? minimumPollers;

  /// (Amazon MSK and self-managed Apache Kafka) The name of the provisioned
  /// poller group. Use this option to group multiple ESMs within the event
  /// source's VPC to share Event Poller Unit (EPU) capacity. You can use this
  /// option to optimize Provisioned mode costs for your ESMs. You can group up to
  /// 100 ESMs per poller group and aggregate maximum pollers across all ESMs in a
  /// group cannot exceed 2000.
  final String? pollerGroupName;

  ProvisionedPollerConfig({
    this.maximumPollers,
    this.minimumPollers,
    this.pollerGroupName,
  });

  factory ProvisionedPollerConfig.fromJson(Map<String, dynamic> json) {
    return ProvisionedPollerConfig(
      maximumPollers: json['MaximumPollers'] as int?,
      minimumPollers: json['MinimumPollers'] as int?,
      pollerGroupName: json['PollerGroupName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final maximumPollers = this.maximumPollers;
    final minimumPollers = this.minimumPollers;
    final pollerGroupName = this.pollerGroupName;
    return {
      if (maximumPollers != null) 'MaximumPollers': maximumPollers,
      if (minimumPollers != null) 'MinimumPollers': minimumPollers,
      if (pollerGroupName != null) 'PollerGroupName': pollerGroupName,
    };
  }
}

/// @nodoc
class EventSourceMappingSystemLogLevel {
  static const debug = EventSourceMappingSystemLogLevel._('DEBUG');
  static const info = EventSourceMappingSystemLogLevel._('INFO');
  static const warn = EventSourceMappingSystemLogLevel._('WARN');

  final String value;

  const EventSourceMappingSystemLogLevel._(this.value);

  static const values = [debug, info, warn];

  static EventSourceMappingSystemLogLevel fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EventSourceMappingSystemLogLevel._(value));

  @override
  bool operator ==(other) =>
      other is EventSourceMappingSystemLogLevel && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class EventSourceMappingMetric {
  static const eventCount = EventSourceMappingMetric._('EventCount');
  static const errorCount = EventSourceMappingMetric._('ErrorCount');
  static const kafkaMetrics = EventSourceMappingMetric._('KafkaMetrics');

  final String value;

  const EventSourceMappingMetric._(this.value);

  static const values = [eventCount, errorCount, kafkaMetrics];

  static EventSourceMappingMetric fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EventSourceMappingMetric._(value));

  @override
  bool operator ==(other) =>
      other is EventSourceMappingMetric && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class FullDocument {
  static const updateLookup = FullDocument._('UpdateLookup');
  static const $default = FullDocument._('Default');

  final String value;

  const FullDocument._(this.value);

  static const values = [updateLookup, $default];

  static FullDocument fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => FullDocument._(value));

  @override
  bool operator ==(other) => other is FullDocument && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Specific configuration settings for a Kafka schema registry.
///
/// @nodoc
class KafkaSchemaRegistryConfig {
  /// An array of access configuration objects that tell Lambda how to
  /// authenticate with your schema registry.
  final List<KafkaSchemaRegistryAccessConfig>? accessConfigs;

  /// The record format that Lambda delivers to your function after schema
  /// validation.
  ///
  /// <ul>
  /// <li>
  /// Choose <code>JSON</code> to have Lambda deliver the record to your function
  /// as a standard JSON object.
  /// </li>
  /// <li>
  /// Choose <code>SOURCE</code> to have Lambda deliver the record to your
  /// function in its original source format. Lambda removes all schema metadata,
  /// such as the schema ID, before sending the record to your function.
  /// </li>
  /// </ul>
  final SchemaRegistryEventRecordFormat? eventRecordFormat;

  /// The URI for your schema registry. The correct URI format depends on the type
  /// of schema registry you're using.
  ///
  /// <ul>
  /// <li>
  /// For Glue schema registries, use the ARN of the registry.
  /// </li>
  /// <li>
  /// For Confluent schema registries, use the URL of the registry.
  /// </li>
  /// </ul>
  final String? schemaRegistryURI;

  /// An array of schema validation configuration objects, which tell Lambda the
  /// message attributes you want to validate and filter using your schema
  /// registry.
  final List<KafkaSchemaValidationConfig>? schemaValidationConfigs;

  KafkaSchemaRegistryConfig({
    this.accessConfigs,
    this.eventRecordFormat,
    this.schemaRegistryURI,
    this.schemaValidationConfigs,
  });

  factory KafkaSchemaRegistryConfig.fromJson(Map<String, dynamic> json) {
    return KafkaSchemaRegistryConfig(
      accessConfigs: (json['AccessConfigs'] as List?)
          ?.nonNulls
          .map((e) => KafkaSchemaRegistryAccessConfig.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      eventRecordFormat: (json['EventRecordFormat'] as String?)
          ?.let(SchemaRegistryEventRecordFormat.fromString),
      schemaRegistryURI: json['SchemaRegistryURI'] as String?,
      schemaValidationConfigs: (json['SchemaValidationConfigs'] as List?)
          ?.nonNulls
          .map((e) =>
              KafkaSchemaValidationConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final accessConfigs = this.accessConfigs;
    final eventRecordFormat = this.eventRecordFormat;
    final schemaRegistryURI = this.schemaRegistryURI;
    final schemaValidationConfigs = this.schemaValidationConfigs;
    return {
      if (accessConfigs != null) 'AccessConfigs': accessConfigs,
      if (eventRecordFormat != null)
        'EventRecordFormat': eventRecordFormat.value,
      if (schemaRegistryURI != null) 'SchemaRegistryURI': schemaRegistryURI,
      if (schemaValidationConfigs != null)
        'SchemaValidationConfigs': schemaValidationConfigs,
    };
  }
}

/// @nodoc
class SchemaRegistryEventRecordFormat {
  static const json = SchemaRegistryEventRecordFormat._('JSON');
  static const source = SchemaRegistryEventRecordFormat._('SOURCE');

  final String value;

  const SchemaRegistryEventRecordFormat._(this.value);

  static const values = [json, source];

  static SchemaRegistryEventRecordFormat fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SchemaRegistryEventRecordFormat._(value));

  @override
  bool operator ==(other) =>
      other is SchemaRegistryEventRecordFormat && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Specific schema validation configuration settings that tell Lambda the
/// message attributes you want to validate and filter using your schema
/// registry.
///
/// @nodoc
class KafkaSchemaValidationConfig {
  /// The attributes you want your schema registry to validate and filter for. If
  /// you selected <code>JSON</code> as the <code>EventRecordFormat</code>, Lambda
  /// also deserializes the selected message attributes.
  final KafkaSchemaValidationAttribute? attribute;

  KafkaSchemaValidationConfig({
    this.attribute,
  });

  factory KafkaSchemaValidationConfig.fromJson(Map<String, dynamic> json) {
    return KafkaSchemaValidationConfig(
      attribute: (json['Attribute'] as String?)
          ?.let(KafkaSchemaValidationAttribute.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final attribute = this.attribute;
    return {
      if (attribute != null) 'Attribute': attribute.value,
    };
  }
}

/// @nodoc
class KafkaSchemaValidationAttribute {
  static const key = KafkaSchemaValidationAttribute._('KEY');
  static const $value = KafkaSchemaValidationAttribute._('VALUE');

  final String value;

  const KafkaSchemaValidationAttribute._(this.value);

  static const values = [key, $value];

  static KafkaSchemaValidationAttribute fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => KafkaSchemaValidationAttribute._(value));

  @override
  bool operator ==(other) =>
      other is KafkaSchemaValidationAttribute && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Specific access configuration settings that tell Lambda how to authenticate
/// with your schema registry.
///
/// If you're working with an Glue schema registry, don't provide authentication
/// details in this object. Instead, ensure that your execution role has the
/// required permissions for Lambda to access your cluster.
///
/// If you're working with a Confluent schema registry, choose the
/// authentication method in the <code>Type</code> field, and provide the
/// Secrets Manager secret ARN in the <code>URI</code> field.
///
/// @nodoc
class KafkaSchemaRegistryAccessConfig {
  /// The type of authentication Lambda uses to access your schema registry.
  final KafkaSchemaRegistryAuthType? type;

  /// The URI of the secret (Secrets Manager secret ARN) to authenticate with your
  /// schema registry.
  final String? uri;

  KafkaSchemaRegistryAccessConfig({
    this.type,
    this.uri,
  });

  factory KafkaSchemaRegistryAccessConfig.fromJson(Map<String, dynamic> json) {
    return KafkaSchemaRegistryAccessConfig(
      type: (json['Type'] as String?)
          ?.let(KafkaSchemaRegistryAuthType.fromString),
      uri: json['URI'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final uri = this.uri;
    return {
      if (type != null) 'Type': type.value,
      if (uri != null) 'URI': uri,
    };
  }
}

/// @nodoc
class KafkaSchemaRegistryAuthType {
  static const basicAuth = KafkaSchemaRegistryAuthType._('BASIC_AUTH');
  static const clientCertificateTlsAuth =
      KafkaSchemaRegistryAuthType._('CLIENT_CERTIFICATE_TLS_AUTH');
  static const serverRootCaCertificate =
      KafkaSchemaRegistryAuthType._('SERVER_ROOT_CA_CERTIFICATE');

  final String value;

  const KafkaSchemaRegistryAuthType._(this.value);

  static const values = [
    basicAuth,
    clientCertificateTlsAuth,
    serverRootCaCertificate
  ];

  static KafkaSchemaRegistryAuthType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => KafkaSchemaRegistryAuthType._(value));

  @override
  bool operator ==(other) =>
      other is KafkaSchemaRegistryAuthType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class FunctionResponseType {
  static const reportBatchItemFailures =
      FunctionResponseType._('ReportBatchItemFailures');

  final String value;

  const FunctionResponseType._(this.value);

  static const values = [reportBatchItemFailures];

  static FunctionResponseType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => FunctionResponseType._(value));

  @override
  bool operator ==(other) =>
      other is FunctionResponseType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// To secure and define access to your event source, you can specify the
/// authentication protocol, VPC components, or virtual host.
///
/// @nodoc
class SourceAccessConfiguration {
  /// The type of authentication protocol, VPC components, or virtual host for
  /// your event source. For example: <code>"Type":"SASL_SCRAM_512_AUTH"</code>.
  ///
  /// <ul>
  /// <li>
  /// <code>BASIC_AUTH</code> – (Amazon MQ) The Secrets Manager secret that stores
  /// your broker credentials.
  /// </li>
  /// <li>
  /// <code>BASIC_AUTH</code> – (Self-managed Apache Kafka) The Secrets Manager
  /// ARN of your secret key used for SASL/PLAIN authentication of your Apache
  /// Kafka brokers.
  /// </li>
  /// <li>
  /// <code>VPC_SUBNET</code> – (Self-managed Apache Kafka) The subnets associated
  /// with your VPC. Lambda connects to these subnets to fetch data from your
  /// self-managed Apache Kafka cluster.
  /// </li>
  /// <li>
  /// <code>VPC_SECURITY_GROUP</code> – (Self-managed Apache Kafka) The VPC
  /// security group used to manage access to your self-managed Apache Kafka
  /// brokers.
  /// </li>
  /// <li>
  /// <code>SASL_SCRAM_256_AUTH</code> – (Self-managed Apache Kafka) The Secrets
  /// Manager ARN of your secret key used for SASL SCRAM-256 authentication of
  /// your self-managed Apache Kafka brokers.
  /// </li>
  /// <li>
  /// <code>SASL_SCRAM_512_AUTH</code> – (Amazon MSK, Self-managed Apache Kafka)
  /// The Secrets Manager ARN of your secret key used for SASL SCRAM-512
  /// authentication of your self-managed Apache Kafka brokers.
  /// </li>
  /// <li>
  /// <code>VIRTUAL_HOST</code> –- (RabbitMQ) The name of the virtual host in your
  /// RabbitMQ broker. Lambda uses this RabbitMQ host as the event source. This
  /// property cannot be specified in an UpdateEventSourceMapping API call.
  /// </li>
  /// <li>
  /// <code>CLIENT_CERTIFICATE_TLS_AUTH</code> – (Amazon MSK, self-managed Apache
  /// Kafka) The Secrets Manager ARN of your secret key containing the certificate
  /// chain (X.509 PEM), private key (PKCS#8 PEM), and private key password
  /// (optional) used for mutual TLS authentication of your MSK/Apache Kafka
  /// brokers.
  /// </li>
  /// <li>
  /// <code>SERVER_ROOT_CA_CERTIFICATE</code> – (Self-managed Apache Kafka) The
  /// Secrets Manager ARN of your secret key containing the root CA certificate
  /// (X.509 PEM) used for TLS encryption of your Apache Kafka brokers.
  /// </li>
  /// </ul>
  final SourceAccessType? type;

  /// The value for your chosen configuration in <code>Type</code>. For example:
  /// <code>"URI":
  /// "arn:aws:secretsmanager:us-east-1:01234567890:secret:MyBrokerSecretName"</code>.
  final String? uri;

  SourceAccessConfiguration({
    this.type,
    this.uri,
  });

  factory SourceAccessConfiguration.fromJson(Map<String, dynamic> json) {
    return SourceAccessConfiguration(
      type: (json['Type'] as String?)?.let(SourceAccessType.fromString),
      uri: json['URI'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final uri = this.uri;
    return {
      if (type != null) 'Type': type.value,
      if (uri != null) 'URI': uri,
    };
  }
}

/// @nodoc
class SourceAccessType {
  static const basicAuth = SourceAccessType._('BASIC_AUTH');
  static const vpcSubnet = SourceAccessType._('VPC_SUBNET');
  static const vpcSecurityGroup = SourceAccessType._('VPC_SECURITY_GROUP');
  static const saslScram_512Auth = SourceAccessType._('SASL_SCRAM_512_AUTH');
  static const saslScram_256Auth = SourceAccessType._('SASL_SCRAM_256_AUTH');
  static const virtualHost = SourceAccessType._('VIRTUAL_HOST');
  static const clientCertificateTlsAuth =
      SourceAccessType._('CLIENT_CERTIFICATE_TLS_AUTH');
  static const serverRootCaCertificate =
      SourceAccessType._('SERVER_ROOT_CA_CERTIFICATE');

  final String value;

  const SourceAccessType._(this.value);

  static const values = [
    basicAuth,
    vpcSubnet,
    vpcSecurityGroup,
    saslScram_512Auth,
    saslScram_256Auth,
    virtualHost,
    clientCertificateTlsAuth,
    serverRootCaCertificate
  ];

  static SourceAccessType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SourceAccessType._(value));

  @override
  bool operator ==(other) => other is SourceAccessType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A destination for events that were processed successfully.
///
/// To retain records of successful <a
/// href="https://docs.aws.amazon.com/lambda/latest/dg/invocation-async.html#invocation-async-destinations">asynchronous
/// invocations</a>, you can configure an Amazon SNS topic, Amazon SQS queue,
/// Lambda function, or Amazon EventBridge event bus as the destination.
/// <note>
/// <code>OnSuccess</code> is not supported in
/// <code>CreateEventSourceMapping</code> or
/// <code>UpdateEventSourceMapping</code> requests.
/// </note>
///
/// @nodoc
class OnSuccess {
  /// The Amazon Resource Name (ARN) of the destination resource.
  /// <note>
  /// Amazon SNS destinations have a message size limit of 256 KB. If the combined
  /// size of the function request and response payload exceeds the limit, Lambda
  /// will drop the payload when sending <code>OnFailure</code> event to the
  /// destination. For details on this behavior, refer to <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/invocation-async-retain-records.html">Retaining
  /// records of asynchronous invocations</a>.
  /// </note>
  final String? destination;

  OnSuccess({
    this.destination,
  });

  factory OnSuccess.fromJson(Map<String, dynamic> json) {
    return OnSuccess(
      destination: json['Destination'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final destination = this.destination;
    return {
      if (destination != null) 'Destination': destination,
    };
  }
}

/// A destination for events that failed processing. For more information, see
/// <a
/// href="https://docs.aws.amazon.com/lambda/latest/dg/invocation-async-retain-records.html#invocation-async-destinations">Adding
/// a destination</a>.
///
/// @nodoc
class OnFailure {
  /// The Amazon Resource Name (ARN) of the destination resource.
  ///
  /// To retain records of failed invocations from <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/with-kinesis.html">Kinesis</a>,
  /// <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/with-ddb.html">DynamoDB</a>,
  /// <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/kafka-on-failure.html">self-managed
  /// Apache Kafka</a>, or <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/kafka-on-failure.html">Amazon
  /// MSK</a>, you can configure an Amazon SNS topic, Amazon SQS queue, Amazon S3
  /// bucket, or Kafka topic as the destination.
  /// <note>
  /// Amazon SNS destinations have a message size limit of 256 KB. If the combined
  /// size of the function request and response payload exceeds the limit, Lambda
  /// will drop the payload when sending <code>OnFailure</code> event to the
  /// destination. For details on this behavior, refer to <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/invocation-async-retain-records.html">Retaining
  /// records of asynchronous invocations</a>.
  /// </note>
  /// To retain records of failed invocations from <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/with-kinesis.html">Kinesis</a>,
  /// <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/with-ddb.html">DynamoDB</a>,
  /// <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/with-kafka.html#services-smaa-onfailure-destination">self-managed
  /// Kafka</a> or <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/with-msk.html#services-msk-onfailure-destination">Amazon
  /// MSK</a>, you can configure an Amazon SNS topic, Amazon SQS queue, or Amazon
  /// S3 bucket as the destination.
  final String? destination;

  OnFailure({
    this.destination,
  });

  factory OnFailure.fromJson(Map<String, dynamic> json) {
    return OnFailure(
      destination: json['Destination'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final destination = this.destination;
    return {
      if (destination != null) 'Destination': destination,
    };
  }
}

/// A structure within a <code>FilterCriteria</code> object that defines an
/// event filtering pattern.
///
/// @nodoc
class Filter {
  /// A filter pattern. For more information on the syntax of a filter pattern,
  /// see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/invocation-eventfiltering.html#filtering-syntax">
  /// Filter rule syntax</a>.
  final String? pattern;

  Filter({
    this.pattern,
  });

  factory Filter.fromJson(Map<String, dynamic> json) {
    return Filter(
      pattern: json['Pattern'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final pattern = this.pattern;
    return {
      if (pattern != null) 'Pattern': pattern,
    };
  }
}

/// @nodoc
class EventSourcePosition {
  static const trimHorizon = EventSourcePosition._('TRIM_HORIZON');
  static const latest = EventSourcePosition._('LATEST');
  static const atTimestamp = EventSourcePosition._('AT_TIMESTAMP');

  final String value;

  const EventSourcePosition._(this.value);

  static const values = [trimHorizon, latest, atTimestamp];

  static EventSourcePosition fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EventSourcePosition._(value));

  @override
  bool operator ==(other) =>
      other is EventSourcePosition && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The self-managed Apache Kafka cluster for your event source.
///
/// @nodoc
class SelfManagedEventSource {
  /// The list of bootstrap servers for your Kafka brokers in the following
  /// format: <code>"KAFKA_BOOTSTRAP_SERVERS":
  /// \["abc.xyz.com:xxxx","abc2.xyz.com:xxxx"\]</code>.
  final Map<EndPointType, List<String>>? endpoints;

  SelfManagedEventSource({
    this.endpoints,
  });

  factory SelfManagedEventSource.fromJson(Map<String, dynamic> json) {
    return SelfManagedEventSource(
      endpoints: (json['Endpoints'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(EndPointType.fromString(k),
              (e as List).nonNulls.map((e) => e as String).toList())),
    );
  }

  Map<String, dynamic> toJson() {
    final endpoints = this.endpoints;
    return {
      if (endpoints != null)
        'Endpoints': endpoints.map((k, e) => MapEntry(k.value, e)),
    };
  }
}

/// An object that contains details about an error related to filter criteria
/// encryption.
///
/// @nodoc
class FilterCriteriaError {
  /// The KMS exception that resulted from filter criteria encryption or
  /// decryption.
  final String? errorCode;

  /// The error message.
  final String? message;

  FilterCriteriaError({
    this.errorCode,
    this.message,
  });

  factory FilterCriteriaError.fromJson(Map<String, dynamic> json) {
    return FilterCriteriaError(
      errorCode: json['ErrorCode'] as String?,
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final message = this.message;
    return {
      if (errorCode != null) 'ErrorCode': errorCode,
      if (message != null) 'Message': message,
    };
  }
}

/// @nodoc
class EndPointType {
  static const kafkaBootstrapServers =
      EndPointType._('KAFKA_BOOTSTRAP_SERVERS');

  final String value;

  const EndPointType._(this.value);

  static const values = [kafkaBootstrapServers];

  static EndPointType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => EndPointType._(value));

  @override
  bool operator ==(other) => other is EndPointType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Details about a <a
/// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-codesigning.html">Code
/// signing configuration</a>.
///
/// @nodoc
class CodeSigningConfig {
  /// List of allowed publishers.
  final AllowedPublishers allowedPublishers;

  /// The Amazon Resource Name (ARN) of the Code signing configuration.
  final String codeSigningConfigArn;

  /// Unique identifer for the Code signing configuration.
  final String codeSigningConfigId;

  /// The code signing policy controls the validation failure action for signature
  /// mismatch or expiry.
  final CodeSigningPolicies codeSigningPolicies;

  /// The date and time that the Code signing configuration was last modified, in
  /// ISO-8601 format (YYYY-MM-DDThh:mm:ss.sTZD).
  final String lastModified;

  /// Code signing configuration description.
  final String? description;

  CodeSigningConfig({
    required this.allowedPublishers,
    required this.codeSigningConfigArn,
    required this.codeSigningConfigId,
    required this.codeSigningPolicies,
    required this.lastModified,
    this.description,
  });

  factory CodeSigningConfig.fromJson(Map<String, dynamic> json) {
    return CodeSigningConfig(
      allowedPublishers: AllowedPublishers.fromJson(
          (json['AllowedPublishers'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      codeSigningConfigArn: (json['CodeSigningConfigArn'] as String?) ?? '',
      codeSigningConfigId: (json['CodeSigningConfigId'] as String?) ?? '',
      codeSigningPolicies: CodeSigningPolicies.fromJson(
          (json['CodeSigningPolicies'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      lastModified: (json['LastModified'] as String?) ?? '',
      description: json['Description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final allowedPublishers = this.allowedPublishers;
    final codeSigningConfigArn = this.codeSigningConfigArn;
    final codeSigningConfigId = this.codeSigningConfigId;
    final codeSigningPolicies = this.codeSigningPolicies;
    final lastModified = this.lastModified;
    final description = this.description;
    return {
      'AllowedPublishers': allowedPublishers,
      'CodeSigningConfigArn': codeSigningConfigArn,
      'CodeSigningConfigId': codeSigningConfigId,
      'CodeSigningPolicies': codeSigningPolicies,
      'LastModified': lastModified,
      if (description != null) 'Description': description,
    };
  }
}

/// List of signing profiles that can sign a code package.
///
/// @nodoc
class AllowedPublishers {
  /// The Amazon Resource Name (ARN) for each of the signing profiles. A signing
  /// profile defines a trusted user who can sign a code package.
  final List<String> signingProfileVersionArns;

  AllowedPublishers({
    required this.signingProfileVersionArns,
  });

  factory AllowedPublishers.fromJson(Map<String, dynamic> json) {
    return AllowedPublishers(
      signingProfileVersionArns:
          ((json['SigningProfileVersionArns'] as List?) ?? const [])
              .nonNulls
              .map((e) => e as String)
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final signingProfileVersionArns = this.signingProfileVersionArns;
    return {
      'SigningProfileVersionArns': signingProfileVersionArns,
    };
  }
}

/// Code signing configuration <a
/// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-codesigning.html#config-codesigning-policies">policies</a>
/// specify the validation failure action for signature mismatch or expiry.
///
/// @nodoc
class CodeSigningPolicies {
  /// Code signing configuration policy for deployment validation failure. If you
  /// set the policy to <code>Enforce</code>, Lambda blocks the deployment request
  /// if signature validation checks fail. If you set the policy to
  /// <code>Warn</code>, Lambda allows the deployment and issues a new Amazon
  /// CloudWatch metric (<code>SignatureValidationErrors</code>) and also stores
  /// the warning in the CloudTrail log.
  ///
  /// Default value: <code>Warn</code>
  final CodeSigningPolicy? untrustedArtifactOnDeployment;

  CodeSigningPolicies({
    this.untrustedArtifactOnDeployment,
  });

  factory CodeSigningPolicies.fromJson(Map<String, dynamic> json) {
    return CodeSigningPolicies(
      untrustedArtifactOnDeployment:
          (json['UntrustedArtifactOnDeployment'] as String?)
              ?.let(CodeSigningPolicy.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final untrustedArtifactOnDeployment = this.untrustedArtifactOnDeployment;
    return {
      if (untrustedArtifactOnDeployment != null)
        'UntrustedArtifactOnDeployment': untrustedArtifactOnDeployment.value,
    };
  }
}

/// @nodoc
class CodeSigningPolicy {
  static const warn = CodeSigningPolicy._('Warn');
  static const enforce = CodeSigningPolicy._('Enforce');

  final String value;

  const CodeSigningPolicy._(this.value);

  static const values = [warn, enforce];

  static CodeSigningPolicy fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CodeSigningPolicy._(value));

  @override
  bool operator ==(other) => other is CodeSigningPolicy && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Information about a function version that uses a specific capacity provider,
/// including its ARN and current state.
///
/// @nodoc
class FunctionVersionsByCapacityProviderListItem {
  /// The Amazon Resource Name (ARN) of the function version.
  final String functionArn;

  /// The current state of the function version.
  final State state;

  FunctionVersionsByCapacityProviderListItem({
    required this.functionArn,
    required this.state,
  });

  factory FunctionVersionsByCapacityProviderListItem.fromJson(
      Map<String, dynamic> json) {
    return FunctionVersionsByCapacityProviderListItem(
      functionArn: (json['FunctionArn'] as String?) ?? '',
      state: State.fromString((json['State'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final functionArn = this.functionArn;
    final state = this.state;
    return {
      'FunctionArn': functionArn,
      'State': state.value,
    };
  }
}

/// A capacity provider manages compute resources for Lambda functions.
///
/// @nodoc
class CapacityProvider {
  /// The Amazon Resource Name (ARN) of the capacity provider.
  final String capacityProviderArn;

  /// The permissions configuration for the capacity provider.
  final CapacityProviderPermissionsConfig permissionsConfig;

  /// The current state of the capacity provider.
  final CapacityProviderState state;

  /// The VPC configuration for the capacity provider.
  final CapacityProviderVpcConfig vpcConfig;

  /// The scaling configuration for the capacity provider.
  final CapacityProviderScalingConfig? capacityProviderScalingConfig;

  /// The instance requirements for compute resources managed by the capacity
  /// provider.
  final InstanceRequirements? instanceRequirements;

  /// The ARN of the KMS key used to encrypt the capacity provider's resources.
  final String? kmsKeyArn;

  /// The date and time when the capacity provider was last modified.
  final String? lastModified;
  final PropagateTags? propagateTags;

  CapacityProvider({
    required this.capacityProviderArn,
    required this.permissionsConfig,
    required this.state,
    required this.vpcConfig,
    this.capacityProviderScalingConfig,
    this.instanceRequirements,
    this.kmsKeyArn,
    this.lastModified,
    this.propagateTags,
  });

  factory CapacityProvider.fromJson(Map<String, dynamic> json) {
    return CapacityProvider(
      capacityProviderArn: (json['CapacityProviderArn'] as String?) ?? '',
      permissionsConfig: CapacityProviderPermissionsConfig.fromJson(
          (json['PermissionsConfig'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      state: CapacityProviderState.fromString((json['State'] as String?) ?? ''),
      vpcConfig: CapacityProviderVpcConfig.fromJson(
          (json['VpcConfig'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      capacityProviderScalingConfig:
          json['CapacityProviderScalingConfig'] != null
              ? CapacityProviderScalingConfig.fromJson(
                  json['CapacityProviderScalingConfig'] as Map<String, dynamic>)
              : null,
      instanceRequirements: json['InstanceRequirements'] != null
          ? InstanceRequirements.fromJson(
              json['InstanceRequirements'] as Map<String, dynamic>)
          : null,
      kmsKeyArn: json['KmsKeyArn'] as String?,
      lastModified: json['LastModified'] as String?,
      propagateTags: json['PropagateTags'] != null
          ? PropagateTags.fromJson(
              json['PropagateTags'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final capacityProviderArn = this.capacityProviderArn;
    final permissionsConfig = this.permissionsConfig;
    final state = this.state;
    final vpcConfig = this.vpcConfig;
    final capacityProviderScalingConfig = this.capacityProviderScalingConfig;
    final instanceRequirements = this.instanceRequirements;
    final kmsKeyArn = this.kmsKeyArn;
    final lastModified = this.lastModified;
    final propagateTags = this.propagateTags;
    return {
      'CapacityProviderArn': capacityProviderArn,
      'PermissionsConfig': permissionsConfig,
      'State': state.value,
      'VpcConfig': vpcConfig,
      if (capacityProviderScalingConfig != null)
        'CapacityProviderScalingConfig': capacityProviderScalingConfig,
      if (instanceRequirements != null)
        'InstanceRequirements': instanceRequirements,
      if (kmsKeyArn != null) 'KmsKeyArn': kmsKeyArn,
      if (lastModified != null) 'LastModified': lastModified,
      if (propagateTags != null) 'PropagateTags': propagateTags,
    };
  }
}

/// @nodoc
class CapacityProviderState {
  static const pending = CapacityProviderState._('Pending');
  static const active = CapacityProviderState._('Active');
  static const failed = CapacityProviderState._('Failed');
  static const deleting = CapacityProviderState._('Deleting');

  final String value;

  const CapacityProviderState._(this.value);

  static const values = [pending, active, failed, deleting];

  static CapacityProviderState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CapacityProviderState._(value));

  @override
  bool operator ==(other) =>
      other is CapacityProviderState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// VPC configuration that specifies the network settings for compute instances
/// managed by the capacity provider.
///
/// @nodoc
class CapacityProviderVpcConfig {
  /// A list of security group IDs that control network access for compute
  /// instances managed by the capacity provider.
  final List<String> securityGroupIds;

  /// A list of subnet IDs where the capacity provider launches compute instances.
  final List<String> subnetIds;

  CapacityProviderVpcConfig({
    required this.securityGroupIds,
    required this.subnetIds,
  });

  factory CapacityProviderVpcConfig.fromJson(Map<String, dynamic> json) {
    return CapacityProviderVpcConfig(
      securityGroupIds: ((json['SecurityGroupIds'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      subnetIds: ((json['SubnetIds'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final securityGroupIds = this.securityGroupIds;
    final subnetIds = this.subnetIds;
    return {
      'SecurityGroupIds': securityGroupIds,
      'SubnetIds': subnetIds,
    };
  }
}

/// Configuration that specifies the permissions required for the capacity
/// provider to manage compute resources.
///
/// @nodoc
class CapacityProviderPermissionsConfig {
  /// The ARN of the IAM role that the capacity provider uses to manage compute
  /// instances and other Amazon Web Services resources.
  final String capacityProviderOperatorRoleArn;

  CapacityProviderPermissionsConfig({
    required this.capacityProviderOperatorRoleArn,
  });

  factory CapacityProviderPermissionsConfig.fromJson(
      Map<String, dynamic> json) {
    return CapacityProviderPermissionsConfig(
      capacityProviderOperatorRoleArn:
          (json['CapacityProviderOperatorRoleArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final capacityProviderOperatorRoleArn =
        this.capacityProviderOperatorRoleArn;
    return {
      'CapacityProviderOperatorRoleArn': capacityProviderOperatorRoleArn,
    };
  }
}

/// Specifications that define the characteristics and constraints for compute
/// instances used by the capacity provider.
///
/// @nodoc
class InstanceRequirements {
  /// A list of EC2 instance types that the capacity provider is allowed to use.
  /// If not specified, all compatible instance types are allowed.
  final List<String>? allowedInstanceTypes;

  /// A list of supported CPU architectures for compute instances. Valid values
  /// include <code>x86_64</code> and <code>arm64</code>.
  final List<Architecture>? architectures;

  /// A list of EC2 instance types that the capacity provider should not use, even
  /// if they meet other requirements.
  final List<String>? excludedInstanceTypes;

  InstanceRequirements({
    this.allowedInstanceTypes,
    this.architectures,
    this.excludedInstanceTypes,
  });

  factory InstanceRequirements.fromJson(Map<String, dynamic> json) {
    return InstanceRequirements(
      allowedInstanceTypes: (json['AllowedInstanceTypes'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      architectures: (json['Architectures'] as List?)
          ?.nonNulls
          .map((e) => Architecture.fromString((e as String)))
          .toList(),
      excludedInstanceTypes: (json['ExcludedInstanceTypes'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final allowedInstanceTypes = this.allowedInstanceTypes;
    final architectures = this.architectures;
    final excludedInstanceTypes = this.excludedInstanceTypes;
    return {
      if (allowedInstanceTypes != null)
        'AllowedInstanceTypes': allowedInstanceTypes,
      if (architectures != null)
        'Architectures': architectures.map((e) => e.value).toList(),
      if (excludedInstanceTypes != null)
        'ExcludedInstanceTypes': excludedInstanceTypes,
    };
  }
}

/// Configuration that defines how the capacity provider scales compute
/// instances based on demand and policies.
///
/// @nodoc
class CapacityProviderScalingConfig {
  /// The maximum number of vCPUs that the capacity provider can provision across
  /// all compute instances.
  final int? maxVCpuCount;

  /// The scaling mode that determines how the capacity provider responds to
  /// changes in demand.
  final CapacityProviderScalingMode? scalingMode;

  /// A list of scaling policies that define how the capacity provider scales
  /// compute instances based on metrics and thresholds.
  final List<TargetTrackingScalingPolicy>? scalingPolicies;

  CapacityProviderScalingConfig({
    this.maxVCpuCount,
    this.scalingMode,
    this.scalingPolicies,
  });

  factory CapacityProviderScalingConfig.fromJson(Map<String, dynamic> json) {
    return CapacityProviderScalingConfig(
      maxVCpuCount: json['MaxVCpuCount'] as int?,
      scalingMode: (json['ScalingMode'] as String?)
          ?.let(CapacityProviderScalingMode.fromString),
      scalingPolicies: (json['ScalingPolicies'] as List?)
          ?.nonNulls
          .map((e) =>
              TargetTrackingScalingPolicy.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final maxVCpuCount = this.maxVCpuCount;
    final scalingMode = this.scalingMode;
    final scalingPolicies = this.scalingPolicies;
    return {
      if (maxVCpuCount != null) 'MaxVCpuCount': maxVCpuCount,
      if (scalingMode != null) 'ScalingMode': scalingMode.value,
      if (scalingPolicies != null) 'ScalingPolicies': scalingPolicies,
    };
  }
}

/// Configuration for tag propagation to managed resources launched by the
/// capacity provider.
///
/// @nodoc
class PropagateTags {
  /// A list of tags to apply to managed resources when <code>Mode</code> is set
  /// to <code>Explicit</code>. You can specify up to 40 tags.
  final Map<String, String>? explicitTags;

  /// The tag propagation mode. Set to <code>Explicit</code> to propagate the tags
  /// specified in <code>ExplicitTags</code> to managed resources. Set to
  /// <code>None</code> to disable tag propagation.
  final PropagateTagsMode? mode;

  PropagateTags({
    this.explicitTags,
    this.mode,
  });

  factory PropagateTags.fromJson(Map<String, dynamic> json) {
    return PropagateTags(
      explicitTags: (json['ExplicitTags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      mode: (json['Mode'] as String?)?.let(PropagateTagsMode.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final explicitTags = this.explicitTags;
    final mode = this.mode;
    return {
      if (explicitTags != null) 'ExplicitTags': explicitTags,
      if (mode != null) 'Mode': mode.value,
    };
  }
}

/// @nodoc
class PropagateTagsMode {
  static const none = PropagateTagsMode._('None');
  static const explicit = PropagateTagsMode._('Explicit');

  final String value;

  const PropagateTagsMode._(this.value);

  static const values = [none, explicit];

  static PropagateTagsMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PropagateTagsMode._(value));

  @override
  bool operator ==(other) => other is PropagateTagsMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class CapacityProviderScalingMode {
  static const auto = CapacityProviderScalingMode._('Auto');
  static const manual = CapacityProviderScalingMode._('Manual');

  final String value;

  const CapacityProviderScalingMode._(this.value);

  static const values = [auto, manual];

  static CapacityProviderScalingMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CapacityProviderScalingMode._(value));

  @override
  bool operator ==(other) =>
      other is CapacityProviderScalingMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A scaling policy for the capacity provider that automatically adjusts
/// capacity to maintain a target value for a specific metric.
///
/// @nodoc
class TargetTrackingScalingPolicy {
  /// The predefined metric type to track for scaling decisions.
  final CapacityProviderPredefinedMetricType predefinedMetricType;

  /// The target value for the metric that the scaling policy attempts to maintain
  /// through scaling actions.
  final double targetValue;

  TargetTrackingScalingPolicy({
    required this.predefinedMetricType,
    required this.targetValue,
  });

  factory TargetTrackingScalingPolicy.fromJson(Map<String, dynamic> json) {
    return TargetTrackingScalingPolicy(
      predefinedMetricType: CapacityProviderPredefinedMetricType.fromString(
          (json['PredefinedMetricType'] as String?) ?? ''),
      targetValue: _s.parseJsonDouble(json['TargetValue']) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final predefinedMetricType = this.predefinedMetricType;
    final targetValue = this.targetValue;
    return {
      'PredefinedMetricType': predefinedMetricType.value,
      'TargetValue': _s.encodeJsonDouble(targetValue),
    };
  }
}

/// @nodoc
class CapacityProviderPredefinedMetricType {
  static const lambdaCapacityProviderAverageCPUUtilization =
      CapacityProviderPredefinedMetricType._(
          'LambdaCapacityProviderAverageCPUUtilization');

  final String value;

  const CapacityProviderPredefinedMetricType._(this.value);

  static const values = [lambdaCapacityProviderAverageCPUUtilization];

  static CapacityProviderPredefinedMetricType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CapacityProviderPredefinedMetricType._(value));

  @override
  bool operator ==(other) =>
      other is CapacityProviderPredefinedMetricType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An object that contains error information.
///
/// @nodoc
class ErrorObject {
  /// Machine-readable error data.
  final String? errorData;

  /// A human-readable error message.
  final String? errorMessage;

  /// The error type.
  final String? errorType;

  /// Stack trace information for the error.
  final List<String>? stackTrace;

  ErrorObject({
    this.errorData,
    this.errorMessage,
    this.errorType,
    this.stackTrace,
  });

  factory ErrorObject.fromJson(Map<String, dynamic> json) {
    return ErrorObject(
      errorData: json['ErrorData'] as String?,
      errorMessage: json['ErrorMessage'] as String?,
      errorType: json['ErrorType'] as String?,
      stackTrace: (json['StackTrace'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errorData = this.errorData;
    final errorMessage = this.errorMessage;
    final errorType = this.errorType;
    final stackTrace = this.stackTrace;
    return {
      if (errorData != null) 'ErrorData': errorData,
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (errorType != null) 'ErrorType': errorType,
      if (stackTrace != null) 'StackTrace': stackTrace,
    };
  }
}

/// Information about a <a
/// href="https://docs.aws.amazon.com/lambda/latest/dg/durable-functions.html">durable
/// execution</a>.
///
/// @nodoc
class Execution {
  /// The Amazon Resource Name (ARN) of the durable execution, if this execution
  /// is a durable execution.
  final String durableExecutionArn;

  /// The unique name of the durable execution, if one was provided when the
  /// execution was started.
  final String durableExecutionName;

  /// The Amazon Resource Name (ARN) of the Lambda function.
  final String functionArn;

  /// The date and time when the durable execution started, in <a
  /// href="https://www.w3.org/TR/NOTE-datetime">ISO-8601 format</a>
  /// (YYYY-MM-DDThh:mm:ss.sTZD).
  final DateTime startTimestamp;

  /// The current status of the durable execution.
  final ExecutionStatus status;

  /// The date and time when the durable execution ended, in <a
  /// href="https://www.w3.org/TR/NOTE-datetime">ISO-8601 format</a>
  /// (YYYY-MM-DDThh:mm:ss.sTZD).
  final DateTime? endTimestamp;

  Execution({
    required this.durableExecutionArn,
    required this.durableExecutionName,
    required this.functionArn,
    required this.startTimestamp,
    required this.status,
    this.endTimestamp,
  });

  factory Execution.fromJson(Map<String, dynamic> json) {
    return Execution(
      durableExecutionArn: (json['DurableExecutionArn'] as String?) ?? '',
      durableExecutionName: (json['DurableExecutionName'] as String?) ?? '',
      functionArn: (json['FunctionArn'] as String?) ?? '',
      startTimestamp: nonNullableTimeStampFromJson(json['StartTimestamp'] ?? 0),
      status: ExecutionStatus.fromString((json['Status'] as String?) ?? ''),
      endTimestamp: timeStampFromJson(json['EndTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final durableExecutionArn = this.durableExecutionArn;
    final durableExecutionName = this.durableExecutionName;
    final functionArn = this.functionArn;
    final startTimestamp = this.startTimestamp;
    final status = this.status;
    final endTimestamp = this.endTimestamp;
    return {
      'DurableExecutionArn': durableExecutionArn,
      'DurableExecutionName': durableExecutionName,
      'FunctionArn': functionArn,
      'StartTimestamp': unixTimestampToJson(startTimestamp),
      'Status': status.value,
      if (endTimestamp != null)
        'EndTimestamp': unixTimestampToJson(endTimestamp),
    };
  }
}

/// @nodoc
class ExecutionStatus {
  static const running = ExecutionStatus._('RUNNING');
  static const succeeded = ExecutionStatus._('SUCCEEDED');
  static const failed = ExecutionStatus._('FAILED');
  static const timedOut = ExecutionStatus._('TIMED_OUT');
  static const stopped = ExecutionStatus._('STOPPED');

  final String value;

  const ExecutionStatus._(this.value);

  static const values = [running, succeeded, failed, timedOut, stopped];

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

/// Information about an operation within a durable execution.
///
/// @nodoc
class Operation {
  /// The unique identifier for this operation.
  final String id;

  /// The date and time when the operation started, in <a
  /// href="https://www.w3.org/TR/NOTE-datetime">ISO-8601 format</a>
  /// (YYYY-MM-DDThh:mm:ss.sTZD).
  final DateTime startTimestamp;

  /// The current status of the operation.
  final OperationStatus status;

  /// The type of operation.
  final OperationType type;
  final CallbackDetails? callbackDetails;
  final ChainedInvokeDetails? chainedInvokeDetails;

  /// Details about the context, if this operation represents a context.
  final ContextDetails? contextDetails;

  /// The date and time when the operation ended, in <a
  /// href="https://www.w3.org/TR/NOTE-datetime">ISO-8601 format</a>
  /// (YYYY-MM-DDThh:mm:ss.sTZD).
  final DateTime? endTimestamp;

  /// Details about the execution, if this operation represents an execution.
  final ExecutionDetails? executionDetails;

  /// The customer-provided name for this operation.
  final String? name;

  /// The unique identifier of the parent operation, if this operation is running
  /// within a child context.
  final String? parentId;

  /// Details about the step, if this operation represents a step.
  final StepDetails? stepDetails;

  /// The subtype of the operation, providing additional categorization.
  final String? subType;

  /// Details about the wait operation, if this operation represents a wait.
  final WaitDetails? waitDetails;

  Operation({
    required this.id,
    required this.startTimestamp,
    required this.status,
    required this.type,
    this.callbackDetails,
    this.chainedInvokeDetails,
    this.contextDetails,
    this.endTimestamp,
    this.executionDetails,
    this.name,
    this.parentId,
    this.stepDetails,
    this.subType,
    this.waitDetails,
  });

  factory Operation.fromJson(Map<String, dynamic> json) {
    return Operation(
      id: (json['Id'] as String?) ?? '',
      startTimestamp: nonNullableTimeStampFromJson(json['StartTimestamp'] ?? 0),
      status: OperationStatus.fromString((json['Status'] as String?) ?? ''),
      type: OperationType.fromString((json['Type'] as String?) ?? ''),
      callbackDetails: json['CallbackDetails'] != null
          ? CallbackDetails.fromJson(
              json['CallbackDetails'] as Map<String, dynamic>)
          : null,
      chainedInvokeDetails: json['ChainedInvokeDetails'] != null
          ? ChainedInvokeDetails.fromJson(
              json['ChainedInvokeDetails'] as Map<String, dynamic>)
          : null,
      contextDetails: json['ContextDetails'] != null
          ? ContextDetails.fromJson(
              json['ContextDetails'] as Map<String, dynamic>)
          : null,
      endTimestamp: timeStampFromJson(json['EndTimestamp']),
      executionDetails: json['ExecutionDetails'] != null
          ? ExecutionDetails.fromJson(
              json['ExecutionDetails'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
      parentId: json['ParentId'] as String?,
      stepDetails: json['StepDetails'] != null
          ? StepDetails.fromJson(json['StepDetails'] as Map<String, dynamic>)
          : null,
      subType: json['SubType'] as String?,
      waitDetails: json['WaitDetails'] != null
          ? WaitDetails.fromJson(json['WaitDetails'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final startTimestamp = this.startTimestamp;
    final status = this.status;
    final type = this.type;
    final callbackDetails = this.callbackDetails;
    final chainedInvokeDetails = this.chainedInvokeDetails;
    final contextDetails = this.contextDetails;
    final endTimestamp = this.endTimestamp;
    final executionDetails = this.executionDetails;
    final name = this.name;
    final parentId = this.parentId;
    final stepDetails = this.stepDetails;
    final subType = this.subType;
    final waitDetails = this.waitDetails;
    return {
      'Id': id,
      'StartTimestamp': unixTimestampToJson(startTimestamp),
      'Status': status.value,
      'Type': type.value,
      if (callbackDetails != null) 'CallbackDetails': callbackDetails,
      if (chainedInvokeDetails != null)
        'ChainedInvokeDetails': chainedInvokeDetails,
      if (contextDetails != null) 'ContextDetails': contextDetails,
      if (endTimestamp != null)
        'EndTimestamp': unixTimestampToJson(endTimestamp),
      if (executionDetails != null) 'ExecutionDetails': executionDetails,
      if (name != null) 'Name': name,
      if (parentId != null) 'ParentId': parentId,
      if (stepDetails != null) 'StepDetails': stepDetails,
      if (subType != null) 'SubType': subType,
      if (waitDetails != null) 'WaitDetails': waitDetails,
    };
  }
}

/// @nodoc
class OperationType {
  static const execution = OperationType._('EXECUTION');
  static const context = OperationType._('CONTEXT');
  static const step = OperationType._('STEP');
  static const wait = OperationType._('WAIT');
  static const callback = OperationType._('CALLBACK');
  static const chainedInvoke = OperationType._('CHAINED_INVOKE');

  final String value;

  const OperationType._(this.value);

  static const values = [
    execution,
    context,
    step,
    wait,
    callback,
    chainedInvoke
  ];

  static OperationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => OperationType._(value));

  @override
  bool operator ==(other) => other is OperationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class OperationStatus {
  static const started = OperationStatus._('STARTED');
  static const pending = OperationStatus._('PENDING');
  static const ready = OperationStatus._('READY');
  static const succeeded = OperationStatus._('SUCCEEDED');
  static const failed = OperationStatus._('FAILED');
  static const cancelled = OperationStatus._('CANCELLED');
  static const timedOut = OperationStatus._('TIMED_OUT');
  static const stopped = OperationStatus._('STOPPED');

  final String value;

  const OperationStatus._(this.value);

  static const values = [
    started,
    pending,
    ready,
    succeeded,
    failed,
    cancelled,
    timedOut,
    stopped
  ];

  static OperationStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => OperationStatus._(value));

  @override
  bool operator ==(other) => other is OperationStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Details about a <a
/// href="https://docs.aws.amazon.com/lambda/latest/dg/durable-functions.html">durable
/// execution</a>.
///
/// @nodoc
class ExecutionDetails {
  /// The original input payload provided for the durable execution.
  final String? inputPayload;

  ExecutionDetails({
    this.inputPayload,
  });

  factory ExecutionDetails.fromJson(Map<String, dynamic> json) {
    return ExecutionDetails(
      inputPayload: json['InputPayload'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final inputPayload = this.inputPayload;
    return {
      if (inputPayload != null) 'InputPayload': inputPayload,
    };
  }
}

/// Details about a durable execution context.
///
/// @nodoc
class ContextDetails {
  /// Details about the context failure.
  final ErrorObject? error;

  /// Whether the state data of child operations of this completed context should
  /// be included in the invoke payload and <code>GetDurableExecutionState</code>
  /// response.
  final bool? replayChildren;

  /// The response payload from the context.
  final String? result;

  ContextDetails({
    this.error,
    this.replayChildren,
    this.result,
  });

  factory ContextDetails.fromJson(Map<String, dynamic> json) {
    return ContextDetails(
      error: json['Error'] != null
          ? ErrorObject.fromJson(json['Error'] as Map<String, dynamic>)
          : null,
      replayChildren: json['ReplayChildren'] as bool?,
      result: json['Result'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final error = this.error;
    final replayChildren = this.replayChildren;
    final result = this.result;
    return {
      if (error != null) 'Error': error,
      if (replayChildren != null) 'ReplayChildren': replayChildren,
      if (result != null) 'Result': result,
    };
  }
}

/// Details about a step operation.
///
/// @nodoc
class StepDetails {
  /// The current attempt number for this step.
  final int? attempt;

  /// Details about the step failure.
  final ErrorObject? error;

  /// The date and time when the next attempt is scheduled, in <a
  /// href="https://www.w3.org/TR/NOTE-datetime">ISO-8601 format</a>
  /// (YYYY-MM-DDThh:mm:ss.sTZD). Only populated when the step is in a pending
  /// state.
  final DateTime? nextAttemptTimestamp;

  /// The JSON response payload from the step operation.
  final String? result;

  StepDetails({
    this.attempt,
    this.error,
    this.nextAttemptTimestamp,
    this.result,
  });

  factory StepDetails.fromJson(Map<String, dynamic> json) {
    return StepDetails(
      attempt: json['Attempt'] as int?,
      error: json['Error'] != null
          ? ErrorObject.fromJson(json['Error'] as Map<String, dynamic>)
          : null,
      nextAttemptTimestamp: timeStampFromJson(json['NextAttemptTimestamp']),
      result: json['Result'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attempt = this.attempt;
    final error = this.error;
    final nextAttemptTimestamp = this.nextAttemptTimestamp;
    final result = this.result;
    return {
      if (attempt != null) 'Attempt': attempt,
      if (error != null) 'Error': error,
      if (nextAttemptTimestamp != null)
        'NextAttemptTimestamp': unixTimestampToJson(nextAttemptTimestamp),
      if (result != null) 'Result': result,
    };
  }
}

/// Details about a wait operation.
///
/// @nodoc
class WaitDetails {
  /// The date and time when the wait operation is scheduled to complete, in <a
  /// href="https://www.w3.org/TR/NOTE-datetime">ISO-8601 format</a>
  /// (YYYY-MM-DDThh:mm:ss.sTZD).
  final DateTime? scheduledEndTimestamp;

  WaitDetails({
    this.scheduledEndTimestamp,
  });

  factory WaitDetails.fromJson(Map<String, dynamic> json) {
    return WaitDetails(
      scheduledEndTimestamp: timeStampFromJson(json['ScheduledEndTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final scheduledEndTimestamp = this.scheduledEndTimestamp;
    return {
      if (scheduledEndTimestamp != null)
        'ScheduledEndTimestamp': unixTimestampToJson(scheduledEndTimestamp),
    };
  }
}

/// Contains details about a callback operation in a durable execution,
/// including the callback token and timeout configuration.
///
/// @nodoc
class CallbackDetails {
  /// The callback ID. Callback IDs are generated by the
  /// <code>DurableContext</code> when a durable function calls
  /// <code>ctx.waitForCallback</code>.
  final String? callbackId;

  /// An error object that contains details about the failure.
  final ErrorObject? error;

  /// The response payload from the callback operation as a string.
  final String? result;

  CallbackDetails({
    this.callbackId,
    this.error,
    this.result,
  });

  factory CallbackDetails.fromJson(Map<String, dynamic> json) {
    return CallbackDetails(
      callbackId: json['CallbackId'] as String?,
      error: json['Error'] != null
          ? ErrorObject.fromJson(json['Error'] as Map<String, dynamic>)
          : null,
      result: json['Result'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final callbackId = this.callbackId;
    final error = this.error;
    final result = this.result;
    return {
      if (callbackId != null) 'CallbackId': callbackId,
      if (error != null) 'Error': error,
      if (result != null) 'Result': result,
    };
  }
}

/// Contains details about a chained function invocation in a durable execution,
/// including the target function and invocation parameters.
///
/// @nodoc
class ChainedInvokeDetails {
  /// Details about the chained invocation failure.
  final ErrorObject? error;

  /// The response payload from the chained invocation.
  final String? result;

  ChainedInvokeDetails({
    this.error,
    this.result,
  });

  factory ChainedInvokeDetails.fromJson(Map<String, dynamic> json) {
    return ChainedInvokeDetails(
      error: json['Error'] != null
          ? ErrorObject.fromJson(json['Error'] as Map<String, dynamic>)
          : null,
      result: json['Result'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final error = this.error;
    final result = this.result;
    return {
      if (error != null) 'Error': error,
      if (result != null) 'Result': result,
    };
  }
}

/// An event that occurred during the execution of a durable function.
///
/// @nodoc
class Event {
  final CallbackFailedDetails? callbackFailedDetails;
  final CallbackStartedDetails? callbackStartedDetails;
  final CallbackSucceededDetails? callbackSucceededDetails;
  final CallbackTimedOutDetails? callbackTimedOutDetails;
  final ChainedInvokeFailedDetails? chainedInvokeFailedDetails;
  final ChainedInvokeStartedDetails? chainedInvokeStartedDetails;

  /// Details about a chained invocation that was stopped.
  final ChainedInvokeStoppedDetails? chainedInvokeStoppedDetails;

  /// Details about a chained invocation that succeeded.
  final ChainedInvokeSucceededDetails? chainedInvokeSucceededDetails;

  /// Details about a chained invocation that timed out.
  final ChainedInvokeTimedOutDetails? chainedInvokeTimedOutDetails;

  /// Details about a context that failed.
  final ContextFailedDetails? contextFailedDetails;

  /// Details about a context that started.
  final ContextStartedDetails? contextStartedDetails;

  /// Details about a context that succeeded.
  final ContextSucceededDetails? contextSucceededDetails;

  /// The unique identifier for this event. Event IDs increment sequentially.
  final int? eventId;

  /// The date and time when this event occurred, in <a
  /// href="https://www.w3.org/TR/NOTE-datetime">ISO-8601 format</a>
  /// (YYYY-MM-DDThh:mm:ss.sTZD).
  final DateTime? eventTimestamp;

  /// The type of event that occurred.
  final EventType? eventType;

  /// Details about an execution that failed.
  final ExecutionFailedDetails? executionFailedDetails;

  /// Details about an execution that started.
  final ExecutionStartedDetails? executionStartedDetails;

  /// Details about an execution that was stopped.
  final ExecutionStoppedDetails? executionStoppedDetails;

  /// Details about an execution that succeeded.
  final ExecutionSucceededDetails? executionSucceededDetails;

  /// Details about an execution that timed out.
  final ExecutionTimedOutDetails? executionTimedOutDetails;

  /// The unique identifier for this operation.
  final String? id;

  /// Details about a function invocation that completed.
  final InvocationCompletedDetails? invocationCompletedDetails;

  /// The customer-provided name for this operation.
  final String? name;

  /// The unique identifier of the parent operation, if this operation is running
  /// within a child context.
  final String? parentId;

  /// Details about a step that failed.
  final StepFailedDetails? stepFailedDetails;

  /// Details about a step that started.
  final StepStartedDetails? stepStartedDetails;

  /// Details about a step that succeeded.
  final StepSucceededDetails? stepSucceededDetails;

  /// The subtype of the event, providing additional categorization.
  final String? subType;

  /// Details about a wait operation that was cancelled.
  final WaitCancelledDetails? waitCancelledDetails;

  /// Details about a wait operation that started.
  final WaitStartedDetails? waitStartedDetails;

  /// Details about a wait operation that succeeded.
  final WaitSucceededDetails? waitSucceededDetails;

  Event({
    this.callbackFailedDetails,
    this.callbackStartedDetails,
    this.callbackSucceededDetails,
    this.callbackTimedOutDetails,
    this.chainedInvokeFailedDetails,
    this.chainedInvokeStartedDetails,
    this.chainedInvokeStoppedDetails,
    this.chainedInvokeSucceededDetails,
    this.chainedInvokeTimedOutDetails,
    this.contextFailedDetails,
    this.contextStartedDetails,
    this.contextSucceededDetails,
    this.eventId,
    this.eventTimestamp,
    this.eventType,
    this.executionFailedDetails,
    this.executionStartedDetails,
    this.executionStoppedDetails,
    this.executionSucceededDetails,
    this.executionTimedOutDetails,
    this.id,
    this.invocationCompletedDetails,
    this.name,
    this.parentId,
    this.stepFailedDetails,
    this.stepStartedDetails,
    this.stepSucceededDetails,
    this.subType,
    this.waitCancelledDetails,
    this.waitStartedDetails,
    this.waitSucceededDetails,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      callbackFailedDetails: json['CallbackFailedDetails'] != null
          ? CallbackFailedDetails.fromJson(
              json['CallbackFailedDetails'] as Map<String, dynamic>)
          : null,
      callbackStartedDetails: json['CallbackStartedDetails'] != null
          ? CallbackStartedDetails.fromJson(
              json['CallbackStartedDetails'] as Map<String, dynamic>)
          : null,
      callbackSucceededDetails: json['CallbackSucceededDetails'] != null
          ? CallbackSucceededDetails.fromJson(
              json['CallbackSucceededDetails'] as Map<String, dynamic>)
          : null,
      callbackTimedOutDetails: json['CallbackTimedOutDetails'] != null
          ? CallbackTimedOutDetails.fromJson(
              json['CallbackTimedOutDetails'] as Map<String, dynamic>)
          : null,
      chainedInvokeFailedDetails: json['ChainedInvokeFailedDetails'] != null
          ? ChainedInvokeFailedDetails.fromJson(
              json['ChainedInvokeFailedDetails'] as Map<String, dynamic>)
          : null,
      chainedInvokeStartedDetails: json['ChainedInvokeStartedDetails'] != null
          ? ChainedInvokeStartedDetails.fromJson(
              json['ChainedInvokeStartedDetails'] as Map<String, dynamic>)
          : null,
      chainedInvokeStoppedDetails: json['ChainedInvokeStoppedDetails'] != null
          ? ChainedInvokeStoppedDetails.fromJson(
              json['ChainedInvokeStoppedDetails'] as Map<String, dynamic>)
          : null,
      chainedInvokeSucceededDetails:
          json['ChainedInvokeSucceededDetails'] != null
              ? ChainedInvokeSucceededDetails.fromJson(
                  json['ChainedInvokeSucceededDetails'] as Map<String, dynamic>)
              : null,
      chainedInvokeTimedOutDetails: json['ChainedInvokeTimedOutDetails'] != null
          ? ChainedInvokeTimedOutDetails.fromJson(
              json['ChainedInvokeTimedOutDetails'] as Map<String, dynamic>)
          : null,
      contextFailedDetails: json['ContextFailedDetails'] != null
          ? ContextFailedDetails.fromJson(
              json['ContextFailedDetails'] as Map<String, dynamic>)
          : null,
      contextStartedDetails: json['ContextStartedDetails'] != null
          ? ContextStartedDetails.fromJson(
              json['ContextStartedDetails'] as Map<String, dynamic>)
          : null,
      contextSucceededDetails: json['ContextSucceededDetails'] != null
          ? ContextSucceededDetails.fromJson(
              json['ContextSucceededDetails'] as Map<String, dynamic>)
          : null,
      eventId: json['EventId'] as int?,
      eventTimestamp: timeStampFromJson(json['EventTimestamp']),
      eventType: (json['EventType'] as String?)?.let(EventType.fromString),
      executionFailedDetails: json['ExecutionFailedDetails'] != null
          ? ExecutionFailedDetails.fromJson(
              json['ExecutionFailedDetails'] as Map<String, dynamic>)
          : null,
      executionStartedDetails: json['ExecutionStartedDetails'] != null
          ? ExecutionStartedDetails.fromJson(
              json['ExecutionStartedDetails'] as Map<String, dynamic>)
          : null,
      executionStoppedDetails: json['ExecutionStoppedDetails'] != null
          ? ExecutionStoppedDetails.fromJson(
              json['ExecutionStoppedDetails'] as Map<String, dynamic>)
          : null,
      executionSucceededDetails: json['ExecutionSucceededDetails'] != null
          ? ExecutionSucceededDetails.fromJson(
              json['ExecutionSucceededDetails'] as Map<String, dynamic>)
          : null,
      executionTimedOutDetails: json['ExecutionTimedOutDetails'] != null
          ? ExecutionTimedOutDetails.fromJson(
              json['ExecutionTimedOutDetails'] as Map<String, dynamic>)
          : null,
      id: json['Id'] as String?,
      invocationCompletedDetails: json['InvocationCompletedDetails'] != null
          ? InvocationCompletedDetails.fromJson(
              json['InvocationCompletedDetails'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
      parentId: json['ParentId'] as String?,
      stepFailedDetails: json['StepFailedDetails'] != null
          ? StepFailedDetails.fromJson(
              json['StepFailedDetails'] as Map<String, dynamic>)
          : null,
      stepStartedDetails: json['StepStartedDetails'] != null
          ? StepStartedDetails.fromJson(
              json['StepStartedDetails'] as Map<String, dynamic>)
          : null,
      stepSucceededDetails: json['StepSucceededDetails'] != null
          ? StepSucceededDetails.fromJson(
              json['StepSucceededDetails'] as Map<String, dynamic>)
          : null,
      subType: json['SubType'] as String?,
      waitCancelledDetails: json['WaitCancelledDetails'] != null
          ? WaitCancelledDetails.fromJson(
              json['WaitCancelledDetails'] as Map<String, dynamic>)
          : null,
      waitStartedDetails: json['WaitStartedDetails'] != null
          ? WaitStartedDetails.fromJson(
              json['WaitStartedDetails'] as Map<String, dynamic>)
          : null,
      waitSucceededDetails: json['WaitSucceededDetails'] != null
          ? WaitSucceededDetails.fromJson(
              json['WaitSucceededDetails'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final callbackFailedDetails = this.callbackFailedDetails;
    final callbackStartedDetails = this.callbackStartedDetails;
    final callbackSucceededDetails = this.callbackSucceededDetails;
    final callbackTimedOutDetails = this.callbackTimedOutDetails;
    final chainedInvokeFailedDetails = this.chainedInvokeFailedDetails;
    final chainedInvokeStartedDetails = this.chainedInvokeStartedDetails;
    final chainedInvokeStoppedDetails = this.chainedInvokeStoppedDetails;
    final chainedInvokeSucceededDetails = this.chainedInvokeSucceededDetails;
    final chainedInvokeTimedOutDetails = this.chainedInvokeTimedOutDetails;
    final contextFailedDetails = this.contextFailedDetails;
    final contextStartedDetails = this.contextStartedDetails;
    final contextSucceededDetails = this.contextSucceededDetails;
    final eventId = this.eventId;
    final eventTimestamp = this.eventTimestamp;
    final eventType = this.eventType;
    final executionFailedDetails = this.executionFailedDetails;
    final executionStartedDetails = this.executionStartedDetails;
    final executionStoppedDetails = this.executionStoppedDetails;
    final executionSucceededDetails = this.executionSucceededDetails;
    final executionTimedOutDetails = this.executionTimedOutDetails;
    final id = this.id;
    final invocationCompletedDetails = this.invocationCompletedDetails;
    final name = this.name;
    final parentId = this.parentId;
    final stepFailedDetails = this.stepFailedDetails;
    final stepStartedDetails = this.stepStartedDetails;
    final stepSucceededDetails = this.stepSucceededDetails;
    final subType = this.subType;
    final waitCancelledDetails = this.waitCancelledDetails;
    final waitStartedDetails = this.waitStartedDetails;
    final waitSucceededDetails = this.waitSucceededDetails;
    return {
      if (callbackFailedDetails != null)
        'CallbackFailedDetails': callbackFailedDetails,
      if (callbackStartedDetails != null)
        'CallbackStartedDetails': callbackStartedDetails,
      if (callbackSucceededDetails != null)
        'CallbackSucceededDetails': callbackSucceededDetails,
      if (callbackTimedOutDetails != null)
        'CallbackTimedOutDetails': callbackTimedOutDetails,
      if (chainedInvokeFailedDetails != null)
        'ChainedInvokeFailedDetails': chainedInvokeFailedDetails,
      if (chainedInvokeStartedDetails != null)
        'ChainedInvokeStartedDetails': chainedInvokeStartedDetails,
      if (chainedInvokeStoppedDetails != null)
        'ChainedInvokeStoppedDetails': chainedInvokeStoppedDetails,
      if (chainedInvokeSucceededDetails != null)
        'ChainedInvokeSucceededDetails': chainedInvokeSucceededDetails,
      if (chainedInvokeTimedOutDetails != null)
        'ChainedInvokeTimedOutDetails': chainedInvokeTimedOutDetails,
      if (contextFailedDetails != null)
        'ContextFailedDetails': contextFailedDetails,
      if (contextStartedDetails != null)
        'ContextStartedDetails': contextStartedDetails,
      if (contextSucceededDetails != null)
        'ContextSucceededDetails': contextSucceededDetails,
      if (eventId != null) 'EventId': eventId,
      if (eventTimestamp != null)
        'EventTimestamp': unixTimestampToJson(eventTimestamp),
      if (eventType != null) 'EventType': eventType.value,
      if (executionFailedDetails != null)
        'ExecutionFailedDetails': executionFailedDetails,
      if (executionStartedDetails != null)
        'ExecutionStartedDetails': executionStartedDetails,
      if (executionStoppedDetails != null)
        'ExecutionStoppedDetails': executionStoppedDetails,
      if (executionSucceededDetails != null)
        'ExecutionSucceededDetails': executionSucceededDetails,
      if (executionTimedOutDetails != null)
        'ExecutionTimedOutDetails': executionTimedOutDetails,
      if (id != null) 'Id': id,
      if (invocationCompletedDetails != null)
        'InvocationCompletedDetails': invocationCompletedDetails,
      if (name != null) 'Name': name,
      if (parentId != null) 'ParentId': parentId,
      if (stepFailedDetails != null) 'StepFailedDetails': stepFailedDetails,
      if (stepStartedDetails != null) 'StepStartedDetails': stepStartedDetails,
      if (stepSucceededDetails != null)
        'StepSucceededDetails': stepSucceededDetails,
      if (subType != null) 'SubType': subType,
      if (waitCancelledDetails != null)
        'WaitCancelledDetails': waitCancelledDetails,
      if (waitStartedDetails != null) 'WaitStartedDetails': waitStartedDetails,
      if (waitSucceededDetails != null)
        'WaitSucceededDetails': waitSucceededDetails,
    };
  }
}

/// @nodoc
class EventType {
  static const executionStarted = EventType._('ExecutionStarted');
  static const executionSucceeded = EventType._('ExecutionSucceeded');
  static const executionFailed = EventType._('ExecutionFailed');
  static const executionTimedOut = EventType._('ExecutionTimedOut');
  static const executionStopped = EventType._('ExecutionStopped');
  static const contextStarted = EventType._('ContextStarted');
  static const contextSucceeded = EventType._('ContextSucceeded');
  static const contextFailed = EventType._('ContextFailed');
  static const waitStarted = EventType._('WaitStarted');
  static const waitSucceeded = EventType._('WaitSucceeded');
  static const waitCancelled = EventType._('WaitCancelled');
  static const stepStarted = EventType._('StepStarted');
  static const stepSucceeded = EventType._('StepSucceeded');
  static const stepFailed = EventType._('StepFailed');
  static const chainedInvokeStarted = EventType._('ChainedInvokeStarted');
  static const chainedInvokeSucceeded = EventType._('ChainedInvokeSucceeded');
  static const chainedInvokeFailed = EventType._('ChainedInvokeFailed');
  static const chainedInvokeTimedOut = EventType._('ChainedInvokeTimedOut');
  static const chainedInvokeStopped = EventType._('ChainedInvokeStopped');
  static const callbackStarted = EventType._('CallbackStarted');
  static const callbackSucceeded = EventType._('CallbackSucceeded');
  static const callbackFailed = EventType._('CallbackFailed');
  static const callbackTimedOut = EventType._('CallbackTimedOut');
  static const invocationCompleted = EventType._('InvocationCompleted');

  final String value;

  const EventType._(this.value);

  static const values = [
    executionStarted,
    executionSucceeded,
    executionFailed,
    executionTimedOut,
    executionStopped,
    contextStarted,
    contextSucceeded,
    contextFailed,
    waitStarted,
    waitSucceeded,
    waitCancelled,
    stepStarted,
    stepSucceeded,
    stepFailed,
    chainedInvokeStarted,
    chainedInvokeSucceeded,
    chainedInvokeFailed,
    chainedInvokeTimedOut,
    chainedInvokeStopped,
    callbackStarted,
    callbackSucceeded,
    callbackFailed,
    callbackTimedOut,
    invocationCompleted
  ];

  static EventType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => EventType._(value));

  @override
  bool operator ==(other) => other is EventType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Details about a durable execution that started.
///
/// @nodoc
class ExecutionStartedDetails {
  /// The maximum amount of time that the durable execution is allowed to run, in
  /// seconds.
  final int executionTimeout;

  /// The input payload provided for the durable execution.
  final EventInput input;

  ExecutionStartedDetails({
    required this.executionTimeout,
    required this.input,
  });

  factory ExecutionStartedDetails.fromJson(Map<String, dynamic> json) {
    return ExecutionStartedDetails(
      executionTimeout: (json['ExecutionTimeout'] as int?) ?? 0,
      input: EventInput.fromJson((json['Input'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final executionTimeout = this.executionTimeout;
    final input = this.input;
    return {
      'ExecutionTimeout': executionTimeout,
      'Input': input,
    };
  }
}

/// Details about a <a
/// href="https://docs.aws.amazon.com/lambda/latest/dg/durable-functions.html">durable
/// execution</a> that succeeded.
///
/// @nodoc
class ExecutionSucceededDetails {
  /// The response payload from the successful operation.
  final EventResult result;

  ExecutionSucceededDetails({
    required this.result,
  });

  factory ExecutionSucceededDetails.fromJson(Map<String, dynamic> json) {
    return ExecutionSucceededDetails(
      result: EventResult.fromJson((json['Result'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final result = this.result;
    return {
      'Result': result,
    };
  }
}

/// Details about a failed <a
/// href="https://docs.aws.amazon.com/lambda/latest/dg/durable-functions.html">durable
/// execution</a>.
///
/// @nodoc
class ExecutionFailedDetails {
  /// Details about the execution failure.
  final EventError error;

  ExecutionFailedDetails({
    required this.error,
  });

  factory ExecutionFailedDetails.fromJson(Map<String, dynamic> json) {
    return ExecutionFailedDetails(
      error: EventError.fromJson((json['Error'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final error = this.error;
    return {
      'Error': error,
    };
  }
}

/// Details about a <a
/// href="https://docs.aws.amazon.com/lambda/latest/dg/durable-functions.html">durable
/// execution</a> that timed out.
///
/// @nodoc
class ExecutionTimedOutDetails {
  /// Details about the execution timeout.
  final EventError? error;

  ExecutionTimedOutDetails({
    this.error,
  });

  factory ExecutionTimedOutDetails.fromJson(Map<String, dynamic> json) {
    return ExecutionTimedOutDetails(
      error: json['Error'] != null
          ? EventError.fromJson(json['Error'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final error = this.error;
    return {
      if (error != null) 'Error': error,
    };
  }
}

/// Details about a <a
/// href="https://docs.aws.amazon.com/lambda/latest/dg/durable-functions.html">durable
/// execution</a> that stopped.
///
/// @nodoc
class ExecutionStoppedDetails {
  /// Details about why the execution stopped.
  final EventError error;

  ExecutionStoppedDetails({
    required this.error,
  });

  factory ExecutionStoppedDetails.fromJson(Map<String, dynamic> json) {
    return ExecutionStoppedDetails(
      error: EventError.fromJson((json['Error'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final error = this.error;
    return {
      'Error': error,
    };
  }
}

/// Details about a context that has started.
///
/// @nodoc
class ContextStartedDetails {
  ContextStartedDetails();

  factory ContextStartedDetails.fromJson(Map<String, dynamic> _) {
    return ContextStartedDetails();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Details about a context that succeeded.
///
/// @nodoc
class ContextSucceededDetails {
  /// The JSON response payload from the successful context.
  final EventResult result;

  ContextSucceededDetails({
    required this.result,
  });

  factory ContextSucceededDetails.fromJson(Map<String, dynamic> json) {
    return ContextSucceededDetails(
      result: EventResult.fromJson((json['Result'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final result = this.result;
    return {
      'Result': result,
    };
  }
}

/// Details about a context that failed.
///
/// @nodoc
class ContextFailedDetails {
  /// Details about the context failure.
  final EventError error;

  ContextFailedDetails({
    required this.error,
  });

  factory ContextFailedDetails.fromJson(Map<String, dynamic> json) {
    return ContextFailedDetails(
      error: EventError.fromJson((json['Error'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final error = this.error;
    return {
      'Error': error,
    };
  }
}

/// Details about a wait operation that has started.
///
/// @nodoc
class WaitStartedDetails {
  /// The duration to wait, in seconds.
  final int duration;

  /// The date and time when the wait operation is scheduled to complete, in <a
  /// href="https://www.w3.org/TR/NOTE-datetime">ISO-8601 format</a>
  /// (YYYY-MM-DDThh:mm:ss.sTZD).
  final DateTime scheduledEndTimestamp;

  WaitStartedDetails({
    required this.duration,
    required this.scheduledEndTimestamp,
  });

  factory WaitStartedDetails.fromJson(Map<String, dynamic> json) {
    return WaitStartedDetails(
      duration: (json['Duration'] as int?) ?? 0,
      scheduledEndTimestamp:
          nonNullableTimeStampFromJson(json['ScheduledEndTimestamp'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final duration = this.duration;
    final scheduledEndTimestamp = this.scheduledEndTimestamp;
    return {
      'Duration': duration,
      'ScheduledEndTimestamp': unixTimestampToJson(scheduledEndTimestamp),
    };
  }
}

/// Details about a wait operation that succeeded.
///
/// @nodoc
class WaitSucceededDetails {
  /// The wait duration, in seconds.
  final int? duration;

  WaitSucceededDetails({
    this.duration,
  });

  factory WaitSucceededDetails.fromJson(Map<String, dynamic> json) {
    return WaitSucceededDetails(
      duration: json['Duration'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final duration = this.duration;
    return {
      if (duration != null) 'Duration': duration,
    };
  }
}

/// Details about a wait operation that was cancelled.
///
/// @nodoc
class WaitCancelledDetails {
  /// Details about why the wait operation was cancelled.
  final EventError? error;

  WaitCancelledDetails({
    this.error,
  });

  factory WaitCancelledDetails.fromJson(Map<String, dynamic> json) {
    return WaitCancelledDetails(
      error: json['Error'] != null
          ? EventError.fromJson(json['Error'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final error = this.error;
    return {
      if (error != null) 'Error': error,
    };
  }
}

/// Details about a step that has started.
///
/// @nodoc
class StepStartedDetails {
  StepStartedDetails();

  factory StepStartedDetails.fromJson(Map<String, dynamic> _) {
    return StepStartedDetails();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Details about a step that succeeded.
///
/// @nodoc
class StepSucceededDetails {
  /// The response payload from the successful operation.
  final EventResult result;

  /// Information about retry attempts for this step operation.
  final RetryDetails retryDetails;

  StepSucceededDetails({
    required this.result,
    required this.retryDetails,
  });

  factory StepSucceededDetails.fromJson(Map<String, dynamic> json) {
    return StepSucceededDetails(
      result: EventResult.fromJson((json['Result'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
      retryDetails: RetryDetails.fromJson(
          (json['RetryDetails'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final result = this.result;
    final retryDetails = this.retryDetails;
    return {
      'Result': result,
      'RetryDetails': retryDetails,
    };
  }
}

/// Details about a step that failed.
///
/// @nodoc
class StepFailedDetails {
  /// Details about the step failure.
  final EventError error;

  /// Information about retry attempts for this step operation.
  final RetryDetails retryDetails;

  StepFailedDetails({
    required this.error,
    required this.retryDetails,
  });

  factory StepFailedDetails.fromJson(Map<String, dynamic> json) {
    return StepFailedDetails(
      error: EventError.fromJson((json['Error'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
      retryDetails: RetryDetails.fromJson(
          (json['RetryDetails'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final error = this.error;
    final retryDetails = this.retryDetails;
    return {
      'Error': error,
      'RetryDetails': retryDetails,
    };
  }
}

/// Contains details about a chained function invocation that has started
/// execution, including start time and execution context.
///
/// @nodoc
class ChainedInvokeStartedDetails {
  /// The name or ARN of the Lambda function being invoked.
  final String functionName;

  /// The Amazon Resource Name (ARN) that identifies the durable execution.
  final String? durableExecutionArn;

  /// The version of the function that was executed.
  final String? executedVersion;

  /// The JSON input payload provided to the chained invocation.
  final EventInput? input;

  /// The tenant identifier for the chained invocation.
  final String? tenantId;

  ChainedInvokeStartedDetails({
    required this.functionName,
    this.durableExecutionArn,
    this.executedVersion,
    this.input,
    this.tenantId,
  });

  factory ChainedInvokeStartedDetails.fromJson(Map<String, dynamic> json) {
    return ChainedInvokeStartedDetails(
      functionName: (json['FunctionName'] as String?) ?? '',
      durableExecutionArn: json['DurableExecutionArn'] as String?,
      executedVersion: json['ExecutedVersion'] as String?,
      input: json['Input'] != null
          ? EventInput.fromJson(json['Input'] as Map<String, dynamic>)
          : null,
      tenantId: json['TenantId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final functionName = this.functionName;
    final durableExecutionArn = this.durableExecutionArn;
    final executedVersion = this.executedVersion;
    final input = this.input;
    final tenantId = this.tenantId;
    return {
      'FunctionName': functionName,
      if (durableExecutionArn != null)
        'DurableExecutionArn': durableExecutionArn,
      if (executedVersion != null) 'ExecutedVersion': executedVersion,
      if (input != null) 'Input': input,
      if (tenantId != null) 'TenantId': tenantId,
    };
  }
}

/// Details about a chained invocation that succeeded.
///
/// @nodoc
class ChainedInvokeSucceededDetails {
  /// The response payload from the successful operation.
  final EventResult result;

  ChainedInvokeSucceededDetails({
    required this.result,
  });

  factory ChainedInvokeSucceededDetails.fromJson(Map<String, dynamic> json) {
    return ChainedInvokeSucceededDetails(
      result: EventResult.fromJson((json['Result'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final result = this.result;
    return {
      'Result': result,
    };
  }
}

/// Contains details about a failed chained function invocation, including error
/// information and failure reason.
///
/// @nodoc
class ChainedInvokeFailedDetails {
  /// Details about the chained invocation failure.
  final EventError error;

  ChainedInvokeFailedDetails({
    required this.error,
  });

  factory ChainedInvokeFailedDetails.fromJson(Map<String, dynamic> json) {
    return ChainedInvokeFailedDetails(
      error: EventError.fromJson((json['Error'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final error = this.error;
    return {
      'Error': error,
    };
  }
}

/// Details about a chained invocation that timed out.
///
/// @nodoc
class ChainedInvokeTimedOutDetails {
  /// Details about the chained invocation timeout.
  final EventError error;

  ChainedInvokeTimedOutDetails({
    required this.error,
  });

  factory ChainedInvokeTimedOutDetails.fromJson(Map<String, dynamic> json) {
    return ChainedInvokeTimedOutDetails(
      error: EventError.fromJson((json['Error'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final error = this.error;
    return {
      'Error': error,
    };
  }
}

/// Details about a chained invocation that was stopped.
///
/// @nodoc
class ChainedInvokeStoppedDetails {
  /// Details about why the chained invocation stopped.
  final EventError error;

  ChainedInvokeStoppedDetails({
    required this.error,
  });

  factory ChainedInvokeStoppedDetails.fromJson(Map<String, dynamic> json) {
    return ChainedInvokeStoppedDetails(
      error: EventError.fromJson((json['Error'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final error = this.error;
    return {
      'Error': error,
    };
  }
}

/// Contains details about a callback operation that has started, including
/// timing information and callback metadata.
///
/// @nodoc
class CallbackStartedDetails {
  /// The callback ID. Callback IDs are generated by the
  /// <code>DurableContext</code> when a durable function calls
  /// <code>ctx.waitForCallback</code>.
  final String callbackId;

  /// The heartbeat timeout value, in seconds.
  final int? heartbeatTimeout;

  /// The timeout value, in seconds.
  final int? timeout;

  CallbackStartedDetails({
    required this.callbackId,
    this.heartbeatTimeout,
    this.timeout,
  });

  factory CallbackStartedDetails.fromJson(Map<String, dynamic> json) {
    return CallbackStartedDetails(
      callbackId: (json['CallbackId'] as String?) ?? '',
      heartbeatTimeout: json['HeartbeatTimeout'] as int?,
      timeout: json['Timeout'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final callbackId = this.callbackId;
    final heartbeatTimeout = this.heartbeatTimeout;
    final timeout = this.timeout;
    return {
      'CallbackId': callbackId,
      if (heartbeatTimeout != null) 'HeartbeatTimeout': heartbeatTimeout,
      if (timeout != null) 'Timeout': timeout,
    };
  }
}

/// Contains details about a successfully completed callback operation,
/// including the result data and completion timestamp.
///
/// @nodoc
class CallbackSucceededDetails {
  /// The response payload from the successful operation.
  final EventResult result;

  CallbackSucceededDetails({
    required this.result,
  });

  factory CallbackSucceededDetails.fromJson(Map<String, dynamic> json) {
    return CallbackSucceededDetails(
      result: EventResult.fromJson((json['Result'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final result = this.result;
    return {
      'Result': result,
    };
  }
}

/// Contains details about a failed callback operation, including error
/// information and the reason for failure.
///
/// @nodoc
class CallbackFailedDetails {
  /// An error object that contains details about the failure.
  final EventError error;

  CallbackFailedDetails({
    required this.error,
  });

  factory CallbackFailedDetails.fromJson(Map<String, dynamic> json) {
    return CallbackFailedDetails(
      error: EventError.fromJson((json['Error'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final error = this.error;
    return {
      'Error': error,
    };
  }
}

/// Contains details about a callback operation that timed out, including
/// timeout duration and any partial results.
///
/// @nodoc
class CallbackTimedOutDetails {
  /// Details about the callback timeout.
  final EventError error;

  CallbackTimedOutDetails({
    required this.error,
  });

  factory CallbackTimedOutDetails.fromJson(Map<String, dynamic> json) {
    return CallbackTimedOutDetails(
      error: EventError.fromJson((json['Error'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final error = this.error;
    return {
      'Error': error,
    };
  }
}

/// Details about a function invocation that completed.
///
/// @nodoc
class InvocationCompletedDetails {
  /// The date and time when the invocation ended, in <a
  /// href="https://www.w3.org/TR/NOTE-datetime">ISO-8601 format</a>
  /// (YYYY-MM-DDThh:mm:ss.sTZD).
  final DateTime endTimestamp;

  /// The request ID for the invocation.
  final String requestId;

  /// The date and time when the invocation started, in <a
  /// href="https://www.w3.org/TR/NOTE-datetime">ISO-8601 format</a>
  /// (YYYY-MM-DDThh:mm:ss.sTZD).
  final DateTime startTimestamp;

  /// Details about the invocation failure.
  final EventError? error;

  InvocationCompletedDetails({
    required this.endTimestamp,
    required this.requestId,
    required this.startTimestamp,
    this.error,
  });

  factory InvocationCompletedDetails.fromJson(Map<String, dynamic> json) {
    return InvocationCompletedDetails(
      endTimestamp: nonNullableTimeStampFromJson(json['EndTimestamp'] ?? 0),
      requestId: (json['RequestId'] as String?) ?? '',
      startTimestamp: nonNullableTimeStampFromJson(json['StartTimestamp'] ?? 0),
      error: json['Error'] != null
          ? EventError.fromJson(json['Error'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final endTimestamp = this.endTimestamp;
    final requestId = this.requestId;
    final startTimestamp = this.startTimestamp;
    final error = this.error;
    return {
      'EndTimestamp': unixTimestampToJson(endTimestamp),
      'RequestId': requestId,
      'StartTimestamp': unixTimestampToJson(startTimestamp),
      if (error != null) 'Error': error,
    };
  }
}

/// Error information for an event.
///
/// @nodoc
class EventError {
  /// The error payload.
  final ErrorObject? payload;

  /// Indicates if the error payload was truncated due to size limits.
  final bool? truncated;

  EventError({
    this.payload,
    this.truncated,
  });

  factory EventError.fromJson(Map<String, dynamic> json) {
    return EventError(
      payload: json['Payload'] != null
          ? ErrorObject.fromJson(json['Payload'] as Map<String, dynamic>)
          : null,
      truncated: json['Truncated'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final payload = this.payload;
    final truncated = this.truncated;
    return {
      if (payload != null) 'Payload': payload,
      if (truncated != null) 'Truncated': truncated,
    };
  }
}

/// Result information for an event.
///
/// @nodoc
class EventResult {
  /// The result payload.
  final String? payload;

  /// Indicates if the error payload was truncated due to size limits.
  final bool? truncated;

  EventResult({
    this.payload,
    this.truncated,
  });

  factory EventResult.fromJson(Map<String, dynamic> json) {
    return EventResult(
      payload: json['Payload'] as String?,
      truncated: json['Truncated'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final payload = this.payload;
    final truncated = this.truncated;
    return {
      if (payload != null) 'Payload': payload,
      if (truncated != null) 'Truncated': truncated,
    };
  }
}

/// Input information for an event.
///
/// @nodoc
class EventInput {
  /// The input payload.
  final String? payload;

  /// Indicates if the error payload was truncated due to size limits.
  final bool? truncated;

  EventInput({
    this.payload,
    this.truncated,
  });

  factory EventInput.fromJson(Map<String, dynamic> json) {
    return EventInput(
      payload: json['Payload'] as String?,
      truncated: json['Truncated'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final payload = this.payload;
    final truncated = this.truncated;
    return {
      if (payload != null) 'Payload': payload,
      if (truncated != null) 'Truncated': truncated,
    };
  }
}

/// Information about retry attempts for an operation.
///
/// @nodoc
class RetryDetails {
  /// The current attempt number for this operation.
  final int? currentAttempt;

  /// The delay before the next retry attempt, in seconds.
  final int? nextAttemptDelaySeconds;

  RetryDetails({
    this.currentAttempt,
    this.nextAttemptDelaySeconds,
  });

  factory RetryDetails.fromJson(Map<String, dynamic> json) {
    return RetryDetails(
      currentAttempt: json['CurrentAttempt'] as int?,
      nextAttemptDelaySeconds: json['NextAttemptDelaySeconds'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final currentAttempt = this.currentAttempt;
    final nextAttemptDelaySeconds = this.nextAttemptDelaySeconds;
    return {
      if (currentAttempt != null) 'CurrentAttempt': currentAttempt,
      if (nextAttemptDelaySeconds != null)
        'NextAttemptDelaySeconds': nextAttemptDelaySeconds,
    };
  }
}

/// Contains trace headers for the Lambda durable execution.
///
/// @nodoc
class TraceHeader {
  /// The X-Ray trace header associated with the durable execution.
  final String? xAmznTraceId;

  TraceHeader({
    this.xAmznTraceId,
  });

  factory TraceHeader.fromJson(Map<String, dynamic> json) {
    return TraceHeader(
      xAmznTraceId: json['XAmznTraceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final xAmznTraceId = this.xAmznTraceId;
    return {
      if (xAmznTraceId != null) 'XAmznTraceId': xAmznTraceId,
    };
  }
}

/// Limits that are related to concurrency and storage. All file and storage
/// sizes are in bytes.
///
/// @nodoc
class AccountLimit {
  /// The maximum size of a function's deployment package and layers when they're
  /// extracted.
  final int? codeSizeUnzipped;

  /// The maximum size of a deployment package when it's uploaded directly to
  /// Lambda. Use Amazon S3 for larger files.
  final int? codeSizeZipped;

  /// The maximum number of simultaneous function executions.
  final int? concurrentExecutions;

  /// The amount of storage space that you can use for all deployment packages and
  /// layer archives.
  final int? totalCodeSize;

  /// The maximum number of simultaneous function executions, minus the capacity
  /// that's reserved for individual functions with <a>PutFunctionConcurrency</a>.
  final int? unreservedConcurrentExecutions;

  AccountLimit({
    this.codeSizeUnzipped,
    this.codeSizeZipped,
    this.concurrentExecutions,
    this.totalCodeSize,
    this.unreservedConcurrentExecutions,
  });

  factory AccountLimit.fromJson(Map<String, dynamic> json) {
    return AccountLimit(
      codeSizeUnzipped: json['CodeSizeUnzipped'] as int?,
      codeSizeZipped: json['CodeSizeZipped'] as int?,
      concurrentExecutions: json['ConcurrentExecutions'] as int?,
      totalCodeSize: json['TotalCodeSize'] as int?,
      unreservedConcurrentExecutions:
          json['UnreservedConcurrentExecutions'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final codeSizeUnzipped = this.codeSizeUnzipped;
    final codeSizeZipped = this.codeSizeZipped;
    final concurrentExecutions = this.concurrentExecutions;
    final totalCodeSize = this.totalCodeSize;
    final unreservedConcurrentExecutions = this.unreservedConcurrentExecutions;
    return {
      if (codeSizeUnzipped != null) 'CodeSizeUnzipped': codeSizeUnzipped,
      if (codeSizeZipped != null) 'CodeSizeZipped': codeSizeZipped,
      if (concurrentExecutions != null)
        'ConcurrentExecutions': concurrentExecutions,
      if (totalCodeSize != null) 'TotalCodeSize': totalCodeSize,
      if (unreservedConcurrentExecutions != null)
        'UnreservedConcurrentExecutions': unreservedConcurrentExecutions,
    };
  }
}

/// The number of functions and amount of storage in use.
///
/// @nodoc
class AccountUsage {
  /// The number of Lambda functions.
  final int? functionCount;

  /// The amount of storage space, in bytes, that's being used by deployment
  /// packages and layer archives.
  final int? totalCodeSize;

  AccountUsage({
    this.functionCount,
    this.totalCodeSize,
  });

  factory AccountUsage.fromJson(Map<String, dynamic> json) {
    return AccountUsage(
      functionCount: json['FunctionCount'] as int?,
      totalCodeSize: json['TotalCodeSize'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final functionCount = this.functionCount;
    final totalCodeSize = this.totalCodeSize;
    return {
      if (functionCount != null) 'FunctionCount': functionCount,
      if (totalCodeSize != null) 'TotalCodeSize': totalCodeSize,
    };
  }
}

/// Contains operations that have been updated since the last checkpoint, such
/// as completed asynchronous work like timers or callbacks.
///
/// @nodoc
class CheckpointUpdatedExecutionState {
  /// Indicates that more results are available. Use this value in a subsequent
  /// call to retrieve the next page of results.
  final String? nextMarker;

  /// A list of operations that have been updated since the last checkpoint.
  final List<Operation>? operations;

  CheckpointUpdatedExecutionState({
    this.nextMarker,
    this.operations,
  });

  factory CheckpointUpdatedExecutionState.fromJson(Map<String, dynamic> json) {
    return CheckpointUpdatedExecutionState(
      nextMarker: json['NextMarker'] as String?,
      operations: (json['Operations'] as List?)
          ?.nonNulls
          .map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextMarker = this.nextMarker;
    final operations = this.operations;
    return {
      if (nextMarker != null) 'NextMarker': nextMarker,
      if (operations != null) 'Operations': operations,
    };
  }
}

/// An update to be applied to an operation during checkpointing.
///
/// @nodoc
class OperationUpdate {
  /// The action to take on the operation.
  final OperationAction action;

  /// The unique identifier for this operation.
  final String id;

  /// The type of operation to update.
  final OperationType type;
  final CallbackOptions? callbackOptions;
  final ChainedInvokeOptions? chainedInvokeOptions;

  /// Options for context operations.
  final ContextOptions? contextOptions;

  /// The error information for failed operations.
  final ErrorObject? error;

  /// The customer-provided name for this operation.
  final String? name;

  /// The unique identifier of the parent operation, if this operation is running
  /// within a child context.
  final String? parentId;

  /// The payload for successful operations.
  final String? payload;

  /// Options for step operations.
  final StepOptions? stepOptions;

  /// The subtype of the operation, providing additional categorization.
  final String? subType;

  /// Options for wait operations.
  final WaitOptions? waitOptions;

  OperationUpdate({
    required this.action,
    required this.id,
    required this.type,
    this.callbackOptions,
    this.chainedInvokeOptions,
    this.contextOptions,
    this.error,
    this.name,
    this.parentId,
    this.payload,
    this.stepOptions,
    this.subType,
    this.waitOptions,
  });

  Map<String, dynamic> toJson() {
    final action = this.action;
    final id = this.id;
    final type = this.type;
    final callbackOptions = this.callbackOptions;
    final chainedInvokeOptions = this.chainedInvokeOptions;
    final contextOptions = this.contextOptions;
    final error = this.error;
    final name = this.name;
    final parentId = this.parentId;
    final payload = this.payload;
    final stepOptions = this.stepOptions;
    final subType = this.subType;
    final waitOptions = this.waitOptions;
    return {
      'Action': action.value,
      'Id': id,
      'Type': type.value,
      if (callbackOptions != null) 'CallbackOptions': callbackOptions,
      if (chainedInvokeOptions != null)
        'ChainedInvokeOptions': chainedInvokeOptions,
      if (contextOptions != null) 'ContextOptions': contextOptions,
      if (error != null) 'Error': error,
      if (name != null) 'Name': name,
      if (parentId != null) 'ParentId': parentId,
      if (payload != null) 'Payload': payload,
      if (stepOptions != null) 'StepOptions': stepOptions,
      if (subType != null) 'SubType': subType,
      if (waitOptions != null) 'WaitOptions': waitOptions,
    };
  }
}

/// @nodoc
class OperationAction {
  static const start = OperationAction._('START');
  static const succeed = OperationAction._('SUCCEED');
  static const fail = OperationAction._('FAIL');
  static const retry = OperationAction._('RETRY');
  static const cancel = OperationAction._('CANCEL');

  final String value;

  const OperationAction._(this.value);

  static const values = [start, succeed, fail, retry, cancel];

  static OperationAction fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => OperationAction._(value));

  @override
  bool operator ==(other) => other is OperationAction && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Configuration options for a durable execution context.
///
/// @nodoc
class ContextOptions {
  /// Whether the state data of children of the completed context should be
  /// included in the invoke payload and <code>GetDurableExecutionState</code>
  /// response.
  final bool? replayChildren;

  ContextOptions({
    this.replayChildren,
  });

  Map<String, dynamic> toJson() {
    final replayChildren = this.replayChildren;
    return {
      if (replayChildren != null) 'ReplayChildren': replayChildren,
    };
  }
}

/// Configuration options for a step operation.
///
/// @nodoc
class StepOptions {
  /// The delay in seconds before the next retry attempt.
  final int? nextAttemptDelaySeconds;

  StepOptions({
    this.nextAttemptDelaySeconds,
  });

  Map<String, dynamic> toJson() {
    final nextAttemptDelaySeconds = this.nextAttemptDelaySeconds;
    return {
      if (nextAttemptDelaySeconds != null)
        'NextAttemptDelaySeconds': nextAttemptDelaySeconds,
    };
  }
}

/// Specifies how long to pause the durable execution.
///
/// @nodoc
class WaitOptions {
  /// The duration to wait, in seconds.
  final int? waitSeconds;

  WaitOptions({
    this.waitSeconds,
  });

  Map<String, dynamic> toJson() {
    final waitSeconds = this.waitSeconds;
    return {
      if (waitSeconds != null) 'WaitSeconds': waitSeconds,
    };
  }
}

/// Configuration options for callback operations in durable executions,
/// including timeout settings and retry behavior.
///
/// @nodoc
class CallbackOptions {
  /// The heartbeat timeout for the callback operation, in seconds. If not
  /// specified or set to 0, heartbeat timeout is disabled.
  final int? heartbeatTimeoutSeconds;

  /// The timeout for the callback operation in seconds. If not specified or set
  /// to 0, the callback has no timeout.
  final int? timeoutSeconds;

  CallbackOptions({
    this.heartbeatTimeoutSeconds,
    this.timeoutSeconds,
  });

  Map<String, dynamic> toJson() {
    final heartbeatTimeoutSeconds = this.heartbeatTimeoutSeconds;
    final timeoutSeconds = this.timeoutSeconds;
    return {
      if (heartbeatTimeoutSeconds != null)
        'HeartbeatTimeoutSeconds': heartbeatTimeoutSeconds,
      if (timeoutSeconds != null) 'TimeoutSeconds': timeoutSeconds,
    };
  }
}

/// Configuration options for chained function invocations in durable
/// executions, including retry settings and timeout configuration.
///
/// @nodoc
class ChainedInvokeOptions {
  /// The name or ARN of the Lambda function to invoke.
  final String functionName;

  /// The tenant identifier for the chained invocation.
  final String? tenantId;

  ChainedInvokeOptions({
    required this.functionName,
    this.tenantId,
  });

  Map<String, dynamic> toJson() {
    final functionName = this.functionName;
    final tenantId = this.tenantId;
    return {
      'FunctionName': functionName,
      if (tenantId != null) 'TenantId': tenantId,
    };
  }
}

/// @nodoc
class CallbackTimeoutException extends _s.GenericAwsException {
  CallbackTimeoutException({String? type, String? message})
      : super(type: type, code: 'CallbackTimeoutException', message: message);
}

/// @nodoc
class CapacityProviderLimitExceededException extends _s.GenericAwsException {
  CapacityProviderLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'CapacityProviderLimitExceededException',
            message: message);
}

/// @nodoc
class CodeSigningConfigNotFoundException extends _s.GenericAwsException {
  CodeSigningConfigNotFoundException({String? type, String? message})
      : super(
            type: type,
            code: 'CodeSigningConfigNotFoundException',
            message: message);
}

/// @nodoc
class CodeStorageExceededException extends _s.GenericAwsException {
  CodeStorageExceededException({String? type, String? message})
      : super(
            type: type, code: 'CodeStorageExceededException', message: message);
}

/// @nodoc
class CodeVerificationFailedException extends _s.GenericAwsException {
  CodeVerificationFailedException({String? type, String? message})
      : super(
            type: type,
            code: 'CodeVerificationFailedException',
            message: message);
}

/// @nodoc
class DurableExecutionAlreadyStartedException extends _s.GenericAwsException {
  DurableExecutionAlreadyStartedException({String? type, String? message})
      : super(
            type: type,
            code: 'DurableExecutionAlreadyStartedException',
            message: message);
}

/// @nodoc
class EC2AccessDeniedException extends _s.GenericAwsException {
  EC2AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'EC2AccessDeniedException', message: message);
}

/// @nodoc
class EC2ThrottledException extends _s.GenericAwsException {
  EC2ThrottledException({String? type, String? message})
      : super(type: type, code: 'EC2ThrottledException', message: message);
}

/// @nodoc
class EC2UnexpectedException extends _s.GenericAwsException {
  EC2UnexpectedException({String? type, String? message})
      : super(type: type, code: 'EC2UnexpectedException', message: message);
}

/// @nodoc
class EFSIOException extends _s.GenericAwsException {
  EFSIOException({String? type, String? message})
      : super(type: type, code: 'EFSIOException', message: message);
}

/// @nodoc
class EFSMountConnectivityException extends _s.GenericAwsException {
  EFSMountConnectivityException({String? type, String? message})
      : super(
            type: type,
            code: 'EFSMountConnectivityException',
            message: message);
}

/// @nodoc
class EFSMountFailureException extends _s.GenericAwsException {
  EFSMountFailureException({String? type, String? message})
      : super(type: type, code: 'EFSMountFailureException', message: message);
}

/// @nodoc
class EFSMountTimeoutException extends _s.GenericAwsException {
  EFSMountTimeoutException({String? type, String? message})
      : super(type: type, code: 'EFSMountTimeoutException', message: message);
}

/// @nodoc
class ENILimitReachedException extends _s.GenericAwsException {
  ENILimitReachedException({String? type, String? message})
      : super(type: type, code: 'ENILimitReachedException', message: message);
}

/// @nodoc
class FunctionVersionsPerCapacityProviderLimitExceededException
    extends _s.GenericAwsException {
  FunctionVersionsPerCapacityProviderLimitExceededException(
      {String? type, String? message})
      : super(
            type: type,
            code: 'FunctionVersionsPerCapacityProviderLimitExceededException',
            message: message);
}

/// @nodoc
class InvalidCodeSignatureException extends _s.GenericAwsException {
  InvalidCodeSignatureException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidCodeSignatureException',
            message: message);
}

/// @nodoc
class InvalidParameterValueException extends _s.GenericAwsException {
  InvalidParameterValueException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidParameterValueException',
            message: message);
}

/// @nodoc
class InvalidRequestContentException extends _s.GenericAwsException {
  InvalidRequestContentException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidRequestContentException',
            message: message);
}

/// @nodoc
class InvalidRuntimeException extends _s.GenericAwsException {
  InvalidRuntimeException({String? type, String? message})
      : super(type: type, code: 'InvalidRuntimeException', message: message);
}

/// @nodoc
class InvalidSecurityGroupIDException extends _s.GenericAwsException {
  InvalidSecurityGroupIDException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidSecurityGroupIDException',
            message: message);
}

/// @nodoc
class InvalidSubnetIDException extends _s.GenericAwsException {
  InvalidSubnetIDException({String? type, String? message})
      : super(type: type, code: 'InvalidSubnetIDException', message: message);
}

/// @nodoc
class InvalidZipFileException extends _s.GenericAwsException {
  InvalidZipFileException({String? type, String? message})
      : super(type: type, code: 'InvalidZipFileException', message: message);
}

/// @nodoc
class KMSAccessDeniedException extends _s.GenericAwsException {
  KMSAccessDeniedException({String? type, String? message})
      : super(type: type, code: 'KMSAccessDeniedException', message: message);
}

/// @nodoc
class KMSDisabledException extends _s.GenericAwsException {
  KMSDisabledException({String? type, String? message})
      : super(type: type, code: 'KMSDisabledException', message: message);
}

/// @nodoc
class KMSInvalidStateException extends _s.GenericAwsException {
  KMSInvalidStateException({String? type, String? message})
      : super(type: type, code: 'KMSInvalidStateException', message: message);
}

/// @nodoc
class KMSNotFoundException extends _s.GenericAwsException {
  KMSNotFoundException({String? type, String? message})
      : super(type: type, code: 'KMSNotFoundException', message: message);
}

/// @nodoc
class NoPublishedVersionException extends _s.GenericAwsException {
  NoPublishedVersionException({String? type, String? message})
      : super(
            type: type, code: 'NoPublishedVersionException', message: message);
}

/// @nodoc
class PolicyLengthExceededException extends _s.GenericAwsException {
  PolicyLengthExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'PolicyLengthExceededException',
            message: message);
}

/// @nodoc
class PreconditionFailedException extends _s.GenericAwsException {
  PreconditionFailedException({String? type, String? message})
      : super(
            type: type, code: 'PreconditionFailedException', message: message);
}

/// @nodoc
class ProvisionedConcurrencyConfigNotFoundException
    extends _s.GenericAwsException {
  ProvisionedConcurrencyConfigNotFoundException({String? type, String? message})
      : super(
            type: type,
            code: 'ProvisionedConcurrencyConfigNotFoundException',
            message: message);
}

/// @nodoc
class RecursiveInvocationException extends _s.GenericAwsException {
  RecursiveInvocationException({String? type, String? message})
      : super(
            type: type, code: 'RecursiveInvocationException', message: message);
}

/// @nodoc
class RequestTooLargeException extends _s.GenericAwsException {
  RequestTooLargeException({String? type, String? message})
      : super(type: type, code: 'RequestTooLargeException', message: message);
}

/// @nodoc
class ResourceConflictException extends _s.GenericAwsException {
  ResourceConflictException({String? type, String? message})
      : super(type: type, code: 'ResourceConflictException', message: message);
}

/// @nodoc
class ResourceInUseException extends _s.GenericAwsException {
  ResourceInUseException({String? type, String? message})
      : super(type: type, code: 'ResourceInUseException', message: message);
}

/// @nodoc
class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

/// @nodoc
class ResourceNotReadyException extends _s.GenericAwsException {
  ResourceNotReadyException({String? type, String? message})
      : super(type: type, code: 'ResourceNotReadyException', message: message);
}

/// @nodoc
class S3FilesMountConnectivityException extends _s.GenericAwsException {
  S3FilesMountConnectivityException({String? type, String? message})
      : super(
            type: type,
            code: 'S3FilesMountConnectivityException',
            message: message);
}

/// @nodoc
class S3FilesMountFailureException extends _s.GenericAwsException {
  S3FilesMountFailureException({String? type, String? message})
      : super(
            type: type, code: 'S3FilesMountFailureException', message: message);
}

/// @nodoc
class S3FilesMountTimeoutException extends _s.GenericAwsException {
  S3FilesMountTimeoutException({String? type, String? message})
      : super(
            type: type, code: 'S3FilesMountTimeoutException', message: message);
}

/// @nodoc
class SerializedRequestEntityTooLargeException extends _s.GenericAwsException {
  SerializedRequestEntityTooLargeException({String? type, String? message})
      : super(
            type: type,
            code: 'SerializedRequestEntityTooLargeException',
            message: message);
}

/// @nodoc
class ServiceException extends _s.GenericAwsException {
  ServiceException({String? type, String? message})
      : super(type: type, code: 'ServiceException', message: message);
}

/// @nodoc
class SnapStartException extends _s.GenericAwsException {
  SnapStartException({String? type, String? message})
      : super(type: type, code: 'SnapStartException', message: message);
}

/// @nodoc
class SnapStartNotReadyException extends _s.GenericAwsException {
  SnapStartNotReadyException({String? type, String? message})
      : super(type: type, code: 'SnapStartNotReadyException', message: message);
}

/// @nodoc
class SnapStartTimeoutException extends _s.GenericAwsException {
  SnapStartTimeoutException({String? type, String? message})
      : super(type: type, code: 'SnapStartTimeoutException', message: message);
}

/// @nodoc
class SubnetIPAddressLimitReachedException extends _s.GenericAwsException {
  SubnetIPAddressLimitReachedException({String? type, String? message})
      : super(
            type: type,
            code: 'SubnetIPAddressLimitReachedException',
            message: message);
}

/// @nodoc
class TooManyRequestsException extends _s.GenericAwsException {
  TooManyRequestsException({String? type, String? message})
      : super(type: type, code: 'TooManyRequestsException', message: message);
}

/// @nodoc
class UnsupportedMediaTypeException extends _s.GenericAwsException {
  UnsupportedMediaTypeException({String? type, String? message})
      : super(
            type: type,
            code: 'UnsupportedMediaTypeException',
            message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'CallbackTimeoutException': (type, message) =>
      CallbackTimeoutException(type: type, message: message),
  'CapacityProviderLimitExceededException': (type, message) =>
      CapacityProviderLimitExceededException(type: type, message: message),
  'CodeSigningConfigNotFoundException': (type, message) =>
      CodeSigningConfigNotFoundException(type: type, message: message),
  'CodeStorageExceededException': (type, message) =>
      CodeStorageExceededException(type: type, message: message),
  'CodeVerificationFailedException': (type, message) =>
      CodeVerificationFailedException(type: type, message: message),
  'DurableExecutionAlreadyStartedException': (type, message) =>
      DurableExecutionAlreadyStartedException(type: type, message: message),
  'EC2AccessDeniedException': (type, message) =>
      EC2AccessDeniedException(type: type, message: message),
  'EC2ThrottledException': (type, message) =>
      EC2ThrottledException(type: type, message: message),
  'EC2UnexpectedException': (type, message) =>
      EC2UnexpectedException(type: type, message: message),
  'EFSIOException': (type, message) =>
      EFSIOException(type: type, message: message),
  'EFSMountConnectivityException': (type, message) =>
      EFSMountConnectivityException(type: type, message: message),
  'EFSMountFailureException': (type, message) =>
      EFSMountFailureException(type: type, message: message),
  'EFSMountTimeoutException': (type, message) =>
      EFSMountTimeoutException(type: type, message: message),
  'ENILimitReachedException': (type, message) =>
      ENILimitReachedException(type: type, message: message),
  'FunctionVersionsPerCapacityProviderLimitExceededException':
      (type, message) =>
          FunctionVersionsPerCapacityProviderLimitExceededException(
              type: type, message: message),
  'InvalidCodeSignatureException': (type, message) =>
      InvalidCodeSignatureException(type: type, message: message),
  'InvalidParameterValueException': (type, message) =>
      InvalidParameterValueException(type: type, message: message),
  'InvalidRequestContentException': (type, message) =>
      InvalidRequestContentException(type: type, message: message),
  'InvalidRuntimeException': (type, message) =>
      InvalidRuntimeException(type: type, message: message),
  'InvalidSecurityGroupIDException': (type, message) =>
      InvalidSecurityGroupIDException(type: type, message: message),
  'InvalidSubnetIDException': (type, message) =>
      InvalidSubnetIDException(type: type, message: message),
  'InvalidZipFileException': (type, message) =>
      InvalidZipFileException(type: type, message: message),
  'KMSAccessDeniedException': (type, message) =>
      KMSAccessDeniedException(type: type, message: message),
  'KMSDisabledException': (type, message) =>
      KMSDisabledException(type: type, message: message),
  'KMSInvalidStateException': (type, message) =>
      KMSInvalidStateException(type: type, message: message),
  'KMSNotFoundException': (type, message) =>
      KMSNotFoundException(type: type, message: message),
  'NoPublishedVersionException': (type, message) =>
      NoPublishedVersionException(type: type, message: message),
  'PolicyLengthExceededException': (type, message) =>
      PolicyLengthExceededException(type: type, message: message),
  'PreconditionFailedException': (type, message) =>
      PreconditionFailedException(type: type, message: message),
  'ProvisionedConcurrencyConfigNotFoundException': (type, message) =>
      ProvisionedConcurrencyConfigNotFoundException(
          type: type, message: message),
  'RecursiveInvocationException': (type, message) =>
      RecursiveInvocationException(type: type, message: message),
  'RequestTooLargeException': (type, message) =>
      RequestTooLargeException(type: type, message: message),
  'ResourceConflictException': (type, message) =>
      ResourceConflictException(type: type, message: message),
  'ResourceInUseException': (type, message) =>
      ResourceInUseException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ResourceNotReadyException': (type, message) =>
      ResourceNotReadyException(type: type, message: message),
  'S3FilesMountConnectivityException': (type, message) =>
      S3FilesMountConnectivityException(type: type, message: message),
  'S3FilesMountFailureException': (type, message) =>
      S3FilesMountFailureException(type: type, message: message),
  'S3FilesMountTimeoutException': (type, message) =>
      S3FilesMountTimeoutException(type: type, message: message),
  'SerializedRequestEntityTooLargeException': (type, message) =>
      SerializedRequestEntityTooLargeException(type: type, message: message),
  'ServiceException': (type, message) =>
      ServiceException(type: type, message: message),
  'SnapStartException': (type, message) =>
      SnapStartException(type: type, message: message),
  'SnapStartNotReadyException': (type, message) =>
      SnapStartNotReadyException(type: type, message: message),
  'SnapStartTimeoutException': (type, message) =>
      SnapStartTimeoutException(type: type, message: message),
  'SubnetIPAddressLimitReachedException': (type, message) =>
      SubnetIPAddressLimitReachedException(type: type, message: message),
  'TooManyRequestsException': (type, message) =>
      TooManyRequestsException(type: type, message: message),
  'UnsupportedMediaTypeException': (type, message) =>
      UnsupportedMediaTypeException(type: type, message: message),
};
