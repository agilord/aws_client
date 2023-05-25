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
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        nonNullableTimeStampFromJson,
        timeStampFromJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

/// Step Functions is a service that lets you coordinate the components of
/// distributed applications and microservices using visual workflows.
class SFN {
  final _s.JsonProtocol _protocol;
  SFN({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'states',
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

  /// Creates an activity. An activity is a task that you write in any
  /// programming language and host on any machine that has access to Step
  /// Functions. Activities must poll Step Functions using the
  /// <code>GetActivityTask</code> API action and respond using
  /// <code>SendTask*</code> API actions. This function lets Step Functions know
  /// the existence of your activity and returns an identifier for use in a
  /// state machine and when polling from the activity.
  /// <note>
  /// This operation is eventually consistent. The results are best effort and
  /// may not reflect very recent updates and changes.
  /// </note> <note>
  /// <code>CreateActivity</code> is an idempotent API. Subsequent requests
  /// won’t create a duplicate resource if it was already created.
  /// <code>CreateActivity</code>'s idempotency check is based on the activity
  /// <code>name</code>. If a following request has different <code>tags</code>
  /// values, Step Functions will ignore these differences and treat it as an
  /// idempotent request of the previous. In this case, <code>tags</code> will
  /// not be updated, even if they are different.
  /// </note>
  ///
  /// May throw [ActivityLimitExceeded].
  /// May throw [InvalidName].
  /// May throw [TooManyTags].
  ///
  /// Parameter [name] :
  /// The name of the activity to create. This name must be unique for your
  /// Amazon Web Services account and region for 90 days. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/step-functions/latest/dg/limits.html#service-limits-state-machine-executions">
  /// Limits Related to State Machine Executions</a> in the <i>Step Functions
  /// Developer Guide</i>.
  ///
  /// A name must <i>not</i> contain:
  ///
  /// <ul>
  /// <li>
  /// white space
  /// </li>
  /// <li>
  /// brackets <code>&lt; &gt; { } [ ]</code>
  /// </li>
  /// <li>
  /// wildcard characters <code>? *</code>
  /// </li>
  /// <li>
  /// special characters <code>" # % \ ^ | ~ ` $ &amp; , ; : /</code>
  /// </li>
  /// <li>
  /// control characters (<code>U+0000-001F</code>, <code>U+007F-009F</code>)
  /// </li>
  /// </ul>
  /// To enable logging with CloudWatch Logs, the name should only contain 0-9,
  /// A-Z, a-z, - and _.
  ///
  /// Parameter [tags] :
  /// The list of tags to add to a resource.
  ///
  /// An array of key-value pairs. For more information, see <a
  /// href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html">Using
  /// Cost Allocation Tags</a> in the <i>Amazon Web Services Billing and Cost
  /// Management User Guide</i>, and <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_iam-tags.html">Controlling
  /// Access Using IAM Tags</a>.
  ///
  /// Tags may only contain Unicode letters, digits, white space, or these
  /// symbols: <code>_ . : / = + - @</code>.
  Future<CreateActivityOutput> createActivity({
    required String name,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSStepFunctions.CreateActivity'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
        if (tags != null) 'tags': tags,
      },
    );

    return CreateActivityOutput.fromJson(jsonResponse.body);
  }

  /// Creates a state machine. A state machine consists of a collection of
  /// states that can do work (<code>Task</code> states), determine to which
  /// states to transition next (<code>Choice</code> states), stop an execution
  /// with an error (<code>Fail</code> states), and so on. State machines are
  /// specified using a JSON-based, structured language. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/step-functions/latest/dg/concepts-amazon-states-language.html">Amazon
  /// States Language</a> in the Step Functions User Guide.
  /// <note>
  /// This operation is eventually consistent. The results are best effort and
  /// may not reflect very recent updates and changes.
  /// </note> <note>
  /// <code>CreateStateMachine</code> is an idempotent API. Subsequent requests
  /// won’t create a duplicate resource if it was already created.
  /// <code>CreateStateMachine</code>'s idempotency check is based on the state
  /// machine <code>name</code>, <code>definition</code>, <code>type</code>,
  /// <code>LoggingConfiguration</code> and <code>TracingConfiguration</code>.
  /// If a following request has a different <code>roleArn</code> or
  /// <code>tags</code>, Step Functions will ignore these differences and treat
  /// it as an idempotent request of the previous. In this case,
  /// <code>roleArn</code> and <code>tags</code> will not be updated, even if
  /// they are different.
  /// </note>
  ///
  /// May throw [InvalidArn].
  /// May throw [InvalidDefinition].
  /// May throw [InvalidName].
  /// May throw [InvalidLoggingConfiguration].
  /// May throw [InvalidTracingConfiguration].
  /// May throw [StateMachineAlreadyExists].
  /// May throw [StateMachineDeleting].
  /// May throw [StateMachineLimitExceeded].
  /// May throw [StateMachineTypeNotSupported].
  /// May throw [TooManyTags].
  ///
  /// Parameter [definition] :
  /// The Amazon States Language definition of the state machine. See <a
  /// href="https://docs.aws.amazon.com/step-functions/latest/dg/concepts-amazon-states-language.html">Amazon
  /// States Language</a>.
  ///
  /// Parameter [name] :
  /// The name of the state machine.
  ///
  /// A name must <i>not</i> contain:
  ///
  /// <ul>
  /// <li>
  /// white space
  /// </li>
  /// <li>
  /// brackets <code>&lt; &gt; { } [ ]</code>
  /// </li>
  /// <li>
  /// wildcard characters <code>? *</code>
  /// </li>
  /// <li>
  /// special characters <code>" # % \ ^ | ~ ` $ &amp; , ; : /</code>
  /// </li>
  /// <li>
  /// control characters (<code>U+0000-001F</code>, <code>U+007F-009F</code>)
  /// </li>
  /// </ul>
  /// To enable logging with CloudWatch Logs, the name should only contain 0-9,
  /// A-Z, a-z, - and _.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role to use for this state
  /// machine.
  ///
  /// Parameter [loggingConfiguration] :
  /// Defines what execution history events are logged and where they are
  /// logged.
  /// <note>
  /// By default, the <code>level</code> is set to <code>OFF</code>. For more
  /// information see <a
  /// href="https://docs.aws.amazon.com/step-functions/latest/dg/cloudwatch-log-level.html">Log
  /// Levels</a> in the Step Functions User Guide.
  /// </note>
  ///
  /// Parameter [tags] :
  /// Tags to be added when creating a state machine.
  ///
  /// An array of key-value pairs. For more information, see <a
  /// href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html">Using
  /// Cost Allocation Tags</a> in the <i>Amazon Web Services Billing and Cost
  /// Management User Guide</i>, and <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_iam-tags.html">Controlling
  /// Access Using IAM Tags</a>.
  ///
  /// Tags may only contain Unicode letters, digits, white space, or these
  /// symbols: <code>_ . : / = + - @</code>.
  ///
  /// Parameter [tracingConfiguration] :
  /// Selects whether X-Ray tracing is enabled.
  ///
  /// Parameter [type] :
  /// Determines whether a Standard or Express state machine is created. The
  /// default is <code>STANDARD</code>. You cannot update the <code>type</code>
  /// of a state machine once it has been created.
  Future<CreateStateMachineOutput> createStateMachine({
    required String definition,
    required String name,
    required String roleArn,
    LoggingConfiguration? loggingConfiguration,
    List<Tag>? tags,
    TracingConfiguration? tracingConfiguration,
    StateMachineType? type,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSStepFunctions.CreateStateMachine'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'definition': definition,
        'name': name,
        'roleArn': roleArn,
        if (loggingConfiguration != null)
          'loggingConfiguration': loggingConfiguration,
        if (tags != null) 'tags': tags,
        if (tracingConfiguration != null)
          'tracingConfiguration': tracingConfiguration,
        if (type != null) 'type': type.toValue(),
      },
    );

    return CreateStateMachineOutput.fromJson(jsonResponse.body);
  }

  /// Deletes an activity.
  ///
  /// May throw [InvalidArn].
  ///
  /// Parameter [activityArn] :
  /// The Amazon Resource Name (ARN) of the activity to delete.
  Future<void> deleteActivity({
    required String activityArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSStepFunctions.DeleteActivity'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'activityArn': activityArn,
      },
    );
  }

  /// Deletes a state machine. This is an asynchronous operation: It sets the
  /// state machine's status to <code>DELETING</code> and begins the deletion
  /// process.
  ///
  /// If the given state machine Amazon Resource Name (ARN) is a qualified state
  /// machine ARN, it will fail with ValidationException.
  ///
  /// A qualified state machine ARN refers to a <i>Distributed Map state</i>
  /// defined within a state machine. For example, the qualified state machine
  /// ARN
  /// <code>arn:partition:states:region:account-id:stateMachine:stateMachineName/mapStateLabel</code>
  /// refers to a <i>Distributed Map state</i> with a label
  /// <code>mapStateLabel</code> in the state machine named
  /// <code>stateMachineName</code>.
  /// <note>
  /// For <code>EXPRESS</code> state machines, the deletion will happen
  /// eventually (usually less than a minute). Running executions may emit logs
  /// after <code>DeleteStateMachine</code> API is called.
  /// </note>
  ///
  /// May throw [InvalidArn].
  /// May throw [ValidationException].
  ///
  /// Parameter [stateMachineArn] :
  /// The Amazon Resource Name (ARN) of the state machine to delete.
  Future<void> deleteStateMachine({
    required String stateMachineArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSStepFunctions.DeleteStateMachine'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'stateMachineArn': stateMachineArn,
      },
    );
  }

  /// Describes an activity.
  /// <note>
  /// This operation is eventually consistent. The results are best effort and
  /// may not reflect very recent updates and changes.
  /// </note>
  ///
  /// May throw [ActivityDoesNotExist].
  /// May throw [InvalidArn].
  ///
  /// Parameter [activityArn] :
  /// The Amazon Resource Name (ARN) of the activity to describe.
  Future<DescribeActivityOutput> describeActivity({
    required String activityArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSStepFunctions.DescribeActivity'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'activityArn': activityArn,
      },
    );

    return DescribeActivityOutput.fromJson(jsonResponse.body);
  }

  /// Provides all information about a state machine execution, such as the
  /// state machine associated with the execution, the execution input and
  /// output, and relevant execution metadata. Use this API action to return the
  /// Map Run ARN if the execution was dispatched by a Map Run.
  /// <note>
  /// This operation is eventually consistent. The results are best effort and
  /// may not reflect very recent updates and changes.
  /// </note>
  /// This API action is not supported by <code>EXPRESS</code> state machine
  /// executions unless they were dispatched by a Map Run.
  ///
  /// May throw [ExecutionDoesNotExist].
  /// May throw [InvalidArn].
  ///
  /// Parameter [executionArn] :
  /// The Amazon Resource Name (ARN) of the execution to describe.
  Future<DescribeExecutionOutput> describeExecution({
    required String executionArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSStepFunctions.DescribeExecution'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'executionArn': executionArn,
      },
    );

    return DescribeExecutionOutput.fromJson(jsonResponse.body);
  }

  /// Provides information about a Map Run's configuration, progress, and
  /// results. For more information, see <a
  /// href="https://docs.aws.amazon.com/step-functions/latest/dg/concepts-examine-map-run.html">Examining
  /// Map Run</a> in the <i>Step Functions Developer Guide</i>.
  ///
  /// May throw [ResourceNotFound].
  /// May throw [InvalidArn].
  ///
  /// Parameter [mapRunArn] :
  /// The Amazon Resource Name (ARN) that identifies a Map Run.
  Future<DescribeMapRunOutput> describeMapRun({
    required String mapRunArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSStepFunctions.DescribeMapRun'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'mapRunArn': mapRunArn,
      },
    );

    return DescribeMapRunOutput.fromJson(jsonResponse.body);
  }

  /// Provides information about a state machine's definition, its IAM role
  /// Amazon Resource Name (ARN), and configuration. If the state machine ARN is
  /// a qualified state machine ARN, the response returned includes the
  /// <code>Map</code> state's label.
  ///
  /// A qualified state machine ARN refers to a <i>Distributed Map state</i>
  /// defined within a state machine. For example, the qualified state machine
  /// ARN
  /// <code>arn:partition:states:region:account-id:stateMachine:stateMachineName/mapStateLabel</code>
  /// refers to a <i>Distributed Map state</i> with a label
  /// <code>mapStateLabel</code> in the state machine named
  /// <code>stateMachineName</code>.
  /// <note>
  /// This operation is eventually consistent. The results are best effort and
  /// may not reflect very recent updates and changes.
  /// </note>
  ///
  /// May throw [InvalidArn].
  /// May throw [StateMachineDoesNotExist].
  ///
  /// Parameter [stateMachineArn] :
  /// The Amazon Resource Name (ARN) of the state machine to describe.
  Future<DescribeStateMachineOutput> describeStateMachine({
    required String stateMachineArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSStepFunctions.DescribeStateMachine'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'stateMachineArn': stateMachineArn,
      },
    );

    return DescribeStateMachineOutput.fromJson(jsonResponse.body);
  }

  /// Provides information about a state machine's definition, its execution
  /// role ARN, and configuration. If an execution was dispatched by a Map Run,
  /// the Map Run is returned in the response. Additionally, the state machine
  /// returned will be the state machine associated with the Map Run.
  /// <note>
  /// This operation is eventually consistent. The results are best effort and
  /// may not reflect very recent updates and changes.
  /// </note>
  /// This API action is not supported by <code>EXPRESS</code> state machines.
  ///
  /// May throw [ExecutionDoesNotExist].
  /// May throw [InvalidArn].
  ///
  /// Parameter [executionArn] :
  /// The Amazon Resource Name (ARN) of the execution you want state machine
  /// information for.
  Future<DescribeStateMachineForExecutionOutput>
      describeStateMachineForExecution({
    required String executionArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSStepFunctions.DescribeStateMachineForExecution'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'executionArn': executionArn,
      },
    );

    return DescribeStateMachineForExecutionOutput.fromJson(jsonResponse.body);
  }

  /// Used by workers to retrieve a task (with the specified activity ARN) which
  /// has been scheduled for execution by a running state machine. This
  /// initiates a long poll, where the service holds the HTTP connection open
  /// and responds as soon as a task becomes available (i.e. an execution of a
  /// task of this type is needed.) The maximum time the service holds on to the
  /// request before responding is 60 seconds. If no task is available within 60
  /// seconds, the poll returns a <code>taskToken</code> with a null string.
  /// <note>
  /// This API action isn't logged in CloudTrail.
  /// </note> <important>
  /// Workers should set their client side socket timeout to at least 65 seconds
  /// (5 seconds higher than the maximum time the service may hold the poll
  /// request).
  ///
  /// Polling with <code>GetActivityTask</code> can cause latency in some
  /// implementations. See <a
  /// href="https://docs.aws.amazon.com/step-functions/latest/dg/bp-activity-pollers.html">Avoid
  /// Latency When Polling for Activity Tasks</a> in the Step Functions
  /// Developer Guide.
  /// </important>
  ///
  /// May throw [ActivityDoesNotExist].
  /// May throw [ActivityWorkerLimitExceeded].
  /// May throw [InvalidArn].
  ///
  /// Parameter [activityArn] :
  /// The Amazon Resource Name (ARN) of the activity to retrieve tasks from
  /// (assigned when you create the task using <a>CreateActivity</a>.)
  ///
  /// Parameter [workerName] :
  /// You can provide an arbitrary name in order to identify the worker that the
  /// task is assigned to. This name is used when it is logged in the execution
  /// history.
  Future<GetActivityTaskOutput> getActivityTask({
    required String activityArn,
    String? workerName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSStepFunctions.GetActivityTask'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'activityArn': activityArn,
        if (workerName != null) 'workerName': workerName,
      },
    );

    return GetActivityTaskOutput.fromJson(jsonResponse.body);
  }

  /// Returns the history of the specified execution as a list of events. By
  /// default, the results are returned in ascending order of the
  /// <code>timeStamp</code> of the events. Use the <code>reverseOrder</code>
  /// parameter to get the latest events first.
  ///
  /// If <code>nextToken</code> is returned, there are more results available.
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. Make the call again using the returned token to retrieve the next
  /// page. Keep all other arguments unchanged. Each pagination token expires
  /// after 24 hours. Using an expired pagination token will return an <i>HTTP
  /// 400 InvalidToken</i> error.
  ///
  /// This API action is not supported by <code>EXPRESS</code> state machines.
  ///
  /// May throw [ExecutionDoesNotExist].
  /// May throw [InvalidArn].
  /// May throw [InvalidToken].
  ///
  /// Parameter [executionArn] :
  /// The Amazon Resource Name (ARN) of the execution.
  ///
  /// Parameter [includeExecutionData] :
  /// You can select whether execution data (input or output of a history event)
  /// is returned. The default is <code>true</code>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results that are returned per call. You can use
  /// <code>nextToken</code> to obtain further pages of results. The default is
  /// 100 and the maximum allowed page size is 1000. A value of 0 uses the
  /// default.
  ///
  /// This is only an upper limit. The actual number of results returned per
  /// call might be fewer than the specified maximum.
  ///
  /// Parameter [nextToken] :
  /// If <code>nextToken</code> is returned, there are more results available.
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. Make the call again using the returned token to retrieve the next
  /// page. Keep all other arguments unchanged. Each pagination token expires
  /// after 24 hours. Using an expired pagination token will return an <i>HTTP
  /// 400 InvalidToken</i> error.
  ///
  /// Parameter [reverseOrder] :
  /// Lists events in descending order of their <code>timeStamp</code>.
  Future<GetExecutionHistoryOutput> getExecutionHistory({
    required String executionArn,
    bool? includeExecutionData,
    int? maxResults,
    String? nextToken,
    bool? reverseOrder,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSStepFunctions.GetExecutionHistory'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'executionArn': executionArn,
        if (includeExecutionData != null)
          'includeExecutionData': includeExecutionData,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (reverseOrder != null) 'reverseOrder': reverseOrder,
      },
    );

    return GetExecutionHistoryOutput.fromJson(jsonResponse.body);
  }

  /// Lists the existing activities.
  ///
  /// If <code>nextToken</code> is returned, there are more results available.
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. Make the call again using the returned token to retrieve the next
  /// page. Keep all other arguments unchanged. Each pagination token expires
  /// after 24 hours. Using an expired pagination token will return an <i>HTTP
  /// 400 InvalidToken</i> error.
  /// <note>
  /// This operation is eventually consistent. The results are best effort and
  /// may not reflect very recent updates and changes.
  /// </note>
  ///
  /// May throw [InvalidToken].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results that are returned per call. You can use
  /// <code>nextToken</code> to obtain further pages of results. The default is
  /// 100 and the maximum allowed page size is 1000. A value of 0 uses the
  /// default.
  ///
  /// This is only an upper limit. The actual number of results returned per
  /// call might be fewer than the specified maximum.
  ///
  /// Parameter [nextToken] :
  /// If <code>nextToken</code> is returned, there are more results available.
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. Make the call again using the returned token to retrieve the next
  /// page. Keep all other arguments unchanged. Each pagination token expires
  /// after 24 hours. Using an expired pagination token will return an <i>HTTP
  /// 400 InvalidToken</i> error.
  Future<ListActivitiesOutput> listActivities({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSStepFunctions.ListActivities'
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

    return ListActivitiesOutput.fromJson(jsonResponse.body);
  }

  /// Lists all executions of a state machine or a Map Run. You can list all
  /// executions related to a state machine by specifying a state machine Amazon
  /// Resource Name (ARN), or those related to a Map Run by specifying a Map Run
  /// ARN.
  ///
  /// Results are sorted by time, with the most recent execution first.
  ///
  /// If <code>nextToken</code> is returned, there are more results available.
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. Make the call again using the returned token to retrieve the next
  /// page. Keep all other arguments unchanged. Each pagination token expires
  /// after 24 hours. Using an expired pagination token will return an <i>HTTP
  /// 400 InvalidToken</i> error.
  /// <note>
  /// This operation is eventually consistent. The results are best effort and
  /// may not reflect very recent updates and changes.
  /// </note>
  /// This API action is not supported by <code>EXPRESS</code> state machines.
  ///
  /// May throw [InvalidArn].
  /// May throw [InvalidToken].
  /// May throw [StateMachineDoesNotExist].
  /// May throw [StateMachineTypeNotSupported].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFound].
  ///
  /// Parameter [mapRunArn] :
  /// The Amazon Resource Name (ARN) of the Map Run that started the child
  /// workflow executions. If the <code>mapRunArn</code> field is specified, a
  /// list of all of the child workflow executions started by a Map Run is
  /// returned. For more information, see <a
  /// href="https://docs.aws.amazon.com/step-functions/latest/dg/concepts-examine-map-run.html">Examining
  /// Map Run</a> in the <i>Step Functions Developer Guide</i>.
  ///
  /// You can specify either a <code>mapRunArn</code> or a
  /// <code>stateMachineArn</code>, but not both.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results that are returned per call. You can use
  /// <code>nextToken</code> to obtain further pages of results. The default is
  /// 100 and the maximum allowed page size is 1000. A value of 0 uses the
  /// default.
  ///
  /// This is only an upper limit. The actual number of results returned per
  /// call might be fewer than the specified maximum.
  ///
  /// Parameter [nextToken] :
  /// If <code>nextToken</code> is returned, there are more results available.
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. Make the call again using the returned token to retrieve the next
  /// page. Keep all other arguments unchanged. Each pagination token expires
  /// after 24 hours. Using an expired pagination token will return an <i>HTTP
  /// 400 InvalidToken</i> error.
  ///
  /// Parameter [stateMachineArn] :
  /// The Amazon Resource Name (ARN) of the state machine whose executions is
  /// listed.
  ///
  /// You can specify either a <code>mapRunArn</code> or a
  /// <code>stateMachineArn</code>, but not both.
  ///
  /// Parameter [statusFilter] :
  /// If specified, only list the executions whose current execution status
  /// matches the given filter.
  Future<ListExecutionsOutput> listExecutions({
    String? mapRunArn,
    int? maxResults,
    String? nextToken,
    String? stateMachineArn,
    ExecutionStatus? statusFilter,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSStepFunctions.ListExecutions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (mapRunArn != null) 'mapRunArn': mapRunArn,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (stateMachineArn != null) 'stateMachineArn': stateMachineArn,
        if (statusFilter != null) 'statusFilter': statusFilter.toValue(),
      },
    );

    return ListExecutionsOutput.fromJson(jsonResponse.body);
  }

  /// Lists all Map Runs that were started by a given state machine execution.
  /// Use this API action to obtain Map Run ARNs, and then call
  /// <code>DescribeMapRun</code> to obtain more information, if needed.
  ///
  /// May throw [ExecutionDoesNotExist].
  /// May throw [InvalidArn].
  /// May throw [InvalidToken].
  ///
  /// Parameter [executionArn] :
  /// The Amazon Resource Name (ARN) of the execution for which the Map Runs
  /// must be listed.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results that are returned per call. You can use
  /// <code>nextToken</code> to obtain further pages of results. The default is
  /// 100 and the maximum allowed page size is 1000. A value of 0 uses the
  /// default.
  ///
  /// This is only an upper limit. The actual number of results returned per
  /// call might be fewer than the specified maximum.
  ///
  /// Parameter [nextToken] :
  /// If <code>nextToken</code> is returned, there are more results available.
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. Make the call again using the returned token to retrieve the next
  /// page. Keep all other arguments unchanged. Each pagination token expires
  /// after 24 hours. Using an expired pagination token will return an <i>HTTP
  /// 400 InvalidToken</i> error.
  Future<ListMapRunsOutput> listMapRuns({
    required String executionArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSStepFunctions.ListMapRuns'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'executionArn': executionArn,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListMapRunsOutput.fromJson(jsonResponse.body);
  }

  /// Lists the existing state machines.
  ///
  /// If <code>nextToken</code> is returned, there are more results available.
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. Make the call again using the returned token to retrieve the next
  /// page. Keep all other arguments unchanged. Each pagination token expires
  /// after 24 hours. Using an expired pagination token will return an <i>HTTP
  /// 400 InvalidToken</i> error.
  /// <note>
  /// This operation is eventually consistent. The results are best effort and
  /// may not reflect very recent updates and changes.
  /// </note>
  ///
  /// May throw [InvalidToken].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results that are returned per call. You can use
  /// <code>nextToken</code> to obtain further pages of results. The default is
  /// 100 and the maximum allowed page size is 1000. A value of 0 uses the
  /// default.
  ///
  /// This is only an upper limit. The actual number of results returned per
  /// call might be fewer than the specified maximum.
  ///
  /// Parameter [nextToken] :
  /// If <code>nextToken</code> is returned, there are more results available.
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. Make the call again using the returned token to retrieve the next
  /// page. Keep all other arguments unchanged. Each pagination token expires
  /// after 24 hours. Using an expired pagination token will return an <i>HTTP
  /// 400 InvalidToken</i> error.
  Future<ListStateMachinesOutput> listStateMachines({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSStepFunctions.ListStateMachines'
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

    return ListStateMachinesOutput.fromJson(jsonResponse.body);
  }

  /// List tags for a given resource.
  ///
  /// Tags may only contain Unicode letters, digits, white space, or these
  /// symbols: <code>_ . : / = + - @</code>.
  ///
  /// May throw [InvalidArn].
  /// May throw [ResourceNotFound].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) for the Step Functions state machine or
  /// activity.
  Future<ListTagsForResourceOutput> listTagsForResource({
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSStepFunctions.ListTagsForResource'
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

    return ListTagsForResourceOutput.fromJson(jsonResponse.body);
  }

  /// Used by activity workers and task states using the <a
  /// href="https://docs.aws.amazon.com/step-functions/latest/dg/connect-to-resource.html#connect-wait-token">callback</a>
  /// pattern to report that the task identified by the <code>taskToken</code>
  /// failed.
  ///
  /// May throw [TaskDoesNotExist].
  /// May throw [InvalidToken].
  /// May throw [TaskTimedOut].
  ///
  /// Parameter [taskToken] :
  /// The token that represents this task. Task tokens are generated by Step
  /// Functions when tasks are assigned to a worker, or in the <a
  /// href="https://docs.aws.amazon.com/step-functions/latest/dg/input-output-contextobject.html">context
  /// object</a> when a workflow enters a task state. See
  /// <a>GetActivityTaskOutput$taskToken</a>.
  ///
  /// Parameter [cause] :
  /// A more detailed explanation of the cause of the failure.
  ///
  /// Parameter [error] :
  /// The error code of the failure.
  Future<void> sendTaskFailure({
    required String taskToken,
    String? cause,
    String? error,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSStepFunctions.SendTaskFailure'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'taskToken': taskToken,
        if (cause != null) 'cause': cause,
        if (error != null) 'error': error,
      },
    );
  }

  /// Used by activity workers and task states using the <a
  /// href="https://docs.aws.amazon.com/step-functions/latest/dg/connect-to-resource.html#connect-wait-token">callback</a>
  /// pattern to report to Step Functions that the task represented by the
  /// specified <code>taskToken</code> is still making progress. This action
  /// resets the <code>Heartbeat</code> clock. The <code>Heartbeat</code>
  /// threshold is specified in the state machine's Amazon States Language
  /// definition (<code>HeartbeatSeconds</code>). This action does not in itself
  /// create an event in the execution history. However, if the task times out,
  /// the execution history contains an <code>ActivityTimedOut</code> entry for
  /// activities, or a <code>TaskTimedOut</code> entry for for tasks using the
  /// <a
  /// href="https://docs.aws.amazon.com/step-functions/latest/dg/connect-to-resource.html#connect-sync">job
  /// run</a> or <a
  /// href="https://docs.aws.amazon.com/step-functions/latest/dg/connect-to-resource.html#connect-wait-token">callback</a>
  /// pattern.
  /// <note>
  /// The <code>Timeout</code> of a task, defined in the state machine's Amazon
  /// States Language definition, is its maximum allowed duration, regardless of
  /// the number of <a>SendTaskHeartbeat</a> requests received. Use
  /// <code>HeartbeatSeconds</code> to configure the timeout interval for
  /// heartbeats.
  /// </note>
  ///
  /// May throw [TaskDoesNotExist].
  /// May throw [InvalidToken].
  /// May throw [TaskTimedOut].
  ///
  /// Parameter [taskToken] :
  /// The token that represents this task. Task tokens are generated by Step
  /// Functions when tasks are assigned to a worker, or in the <a
  /// href="https://docs.aws.amazon.com/step-functions/latest/dg/input-output-contextobject.html">context
  /// object</a> when a workflow enters a task state. See
  /// <a>GetActivityTaskOutput$taskToken</a>.
  Future<void> sendTaskHeartbeat({
    required String taskToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSStepFunctions.SendTaskHeartbeat'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'taskToken': taskToken,
      },
    );
  }

  /// Used by activity workers and task states using the <a
  /// href="https://docs.aws.amazon.com/step-functions/latest/dg/connect-to-resource.html#connect-wait-token">callback</a>
  /// pattern to report that the task identified by the <code>taskToken</code>
  /// completed successfully.
  ///
  /// May throw [TaskDoesNotExist].
  /// May throw [InvalidOutput].
  /// May throw [InvalidToken].
  /// May throw [TaskTimedOut].
  ///
  /// Parameter [output] :
  /// The JSON output of the task. Length constraints apply to the payload size,
  /// and are expressed as bytes in UTF-8 encoding.
  ///
  /// Parameter [taskToken] :
  /// The token that represents this task. Task tokens are generated by Step
  /// Functions when tasks are assigned to a worker, or in the <a
  /// href="https://docs.aws.amazon.com/step-functions/latest/dg/input-output-contextobject.html">context
  /// object</a> when a workflow enters a task state. See
  /// <a>GetActivityTaskOutput$taskToken</a>.
  Future<void> sendTaskSuccess({
    required String output,
    required String taskToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSStepFunctions.SendTaskSuccess'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'output': output,
        'taskToken': taskToken,
      },
    );
  }

  /// Starts a state machine execution. If the given state machine Amazon
  /// Resource Name (ARN) is a qualified state machine ARN, it will fail with
  /// ValidationException.
  ///
  /// A qualified state machine ARN refers to a <i>Distributed Map state</i>
  /// defined within a state machine. For example, the qualified state machine
  /// ARN
  /// <code>arn:partition:states:region:account-id:stateMachine:stateMachineName/mapStateLabel</code>
  /// refers to a <i>Distributed Map state</i> with a label
  /// <code>mapStateLabel</code> in the state machine named
  /// <code>stateMachineName</code>.
  /// <note>
  /// <code>StartExecution</code> is idempotent for <code>STANDARD</code>
  /// workflows. For a <code>STANDARD</code> workflow, if
  /// <code>StartExecution</code> is called with the same name and input as a
  /// running execution, the call will succeed and return the same response as
  /// the original request. If the execution is closed or if the input is
  /// different, it will return a <code>400 ExecutionAlreadyExists</code> error.
  /// Names can be reused after 90 days.
  ///
  /// <code>StartExecution</code> is not idempotent for <code>EXPRESS</code>
  /// workflows.
  /// </note>
  ///
  /// May throw [ExecutionLimitExceeded].
  /// May throw [ExecutionAlreadyExists].
  /// May throw [InvalidArn].
  /// May throw [InvalidExecutionInput].
  /// May throw [InvalidName].
  /// May throw [StateMachineDoesNotExist].
  /// May throw [StateMachineDeleting].
  /// May throw [ValidationException].
  ///
  /// Parameter [stateMachineArn] :
  /// The Amazon Resource Name (ARN) of the state machine to execute.
  ///
  /// Parameter [input] :
  /// The string that contains the JSON input data for the execution, for
  /// example:
  ///
  /// <code>"input": "{\"first_name\" : \"test\"}"</code>
  /// <note>
  /// If you don't include any JSON input data, you still must include the two
  /// braces, for example: <code>"input": "{}"</code>
  /// </note>
  /// Length constraints apply to the payload size, and are expressed as bytes
  /// in UTF-8 encoding.
  ///
  /// Parameter [name] :
  /// The name of the execution. This name must be unique for your Amazon Web
  /// Services account, region, and state machine for 90 days. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/step-functions/latest/dg/limits.html#service-limits-state-machine-executions">
  /// Limits Related to State Machine Executions</a> in the <i>Step Functions
  /// Developer Guide</i>.
  ///
  /// A name must <i>not</i> contain:
  ///
  /// <ul>
  /// <li>
  /// white space
  /// </li>
  /// <li>
  /// brackets <code>&lt; &gt; { } [ ]</code>
  /// </li>
  /// <li>
  /// wildcard characters <code>? *</code>
  /// </li>
  /// <li>
  /// special characters <code>" # % \ ^ | ~ ` $ &amp; , ; : /</code>
  /// </li>
  /// <li>
  /// control characters (<code>U+0000-001F</code>, <code>U+007F-009F</code>)
  /// </li>
  /// </ul>
  /// To enable logging with CloudWatch Logs, the name should only contain 0-9,
  /// A-Z, a-z, - and _.
  ///
  /// Parameter [traceHeader] :
  /// Passes the X-Ray trace header. The trace header can also be passed in the
  /// request payload.
  Future<StartExecutionOutput> startExecution({
    required String stateMachineArn,
    String? input,
    String? name,
    String? traceHeader,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSStepFunctions.StartExecution'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'stateMachineArn': stateMachineArn,
        if (input != null) 'input': input,
        if (name != null) 'name': name,
        if (traceHeader != null) 'traceHeader': traceHeader,
      },
    );

    return StartExecutionOutput.fromJson(jsonResponse.body);
  }

  /// Starts a Synchronous Express state machine execution.
  /// <code>StartSyncExecution</code> is not available for <code>STANDARD</code>
  /// workflows.
  /// <note>
  /// <code>StartSyncExecution</code> will return a <code>200 OK</code>
  /// response, even if your execution fails, because the status code in the API
  /// response doesn't reflect function errors. Error codes are reserved for
  /// errors that prevent your execution from running, such as permissions
  /// errors, limit errors, or issues with your state machine code and
  /// configuration.
  /// </note> <note>
  /// This API action isn't logged in CloudTrail.
  /// </note>
  ///
  /// May throw [InvalidArn].
  /// May throw [InvalidExecutionInput].
  /// May throw [InvalidName].
  /// May throw [StateMachineDoesNotExist].
  /// May throw [StateMachineDeleting].
  /// May throw [StateMachineTypeNotSupported].
  ///
  /// Parameter [stateMachineArn] :
  /// The Amazon Resource Name (ARN) of the state machine to execute.
  ///
  /// Parameter [input] :
  /// The string that contains the JSON input data for the execution, for
  /// example:
  ///
  /// <code>"input": "{\"first_name\" : \"test\"}"</code>
  /// <note>
  /// If you don't include any JSON input data, you still must include the two
  /// braces, for example: <code>"input": "{}"</code>
  /// </note>
  /// Length constraints apply to the payload size, and are expressed as bytes
  /// in UTF-8 encoding.
  ///
  /// Parameter [name] :
  /// The name of the execution.
  ///
  /// Parameter [traceHeader] :
  /// Passes the X-Ray trace header. The trace header can also be passed in the
  /// request payload.
  Future<StartSyncExecutionOutput> startSyncExecution({
    required String stateMachineArn,
    String? input,
    String? name,
    String? traceHeader,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSStepFunctions.StartSyncExecution'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'stateMachineArn': stateMachineArn,
        if (input != null) 'input': input,
        if (name != null) 'name': name,
        if (traceHeader != null) 'traceHeader': traceHeader,
      },
    );

    return StartSyncExecutionOutput.fromJson(jsonResponse.body);
  }

  /// Stops an execution.
  ///
  /// This API action is not supported by <code>EXPRESS</code> state machines.
  ///
  /// May throw [ExecutionDoesNotExist].
  /// May throw [InvalidArn].
  /// May throw [ValidationException].
  ///
  /// Parameter [executionArn] :
  /// The Amazon Resource Name (ARN) of the execution to stop.
  ///
  /// Parameter [cause] :
  /// A more detailed explanation of the cause of the failure.
  ///
  /// Parameter [error] :
  /// The error code of the failure.
  Future<StopExecutionOutput> stopExecution({
    required String executionArn,
    String? cause,
    String? error,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSStepFunctions.StopExecution'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'executionArn': executionArn,
        if (cause != null) 'cause': cause,
        if (error != null) 'error': error,
      },
    );

    return StopExecutionOutput.fromJson(jsonResponse.body);
  }

  /// Add a tag to a Step Functions resource.
  ///
  /// An array of key-value pairs. For more information, see <a
  /// href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html">Using
  /// Cost Allocation Tags</a> in the <i>Amazon Web Services Billing and Cost
  /// Management User Guide</i>, and <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_iam-tags.html">Controlling
  /// Access Using IAM Tags</a>.
  ///
  /// Tags may only contain Unicode letters, digits, white space, or these
  /// symbols: <code>_ . : / = + - @</code>.
  ///
  /// May throw [InvalidArn].
  /// May throw [ResourceNotFound].
  /// May throw [TooManyTags].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) for the Step Functions state machine or
  /// activity.
  ///
  /// Parameter [tags] :
  /// The list of tags to add to a resource.
  ///
  /// Tags may only contain Unicode letters, digits, white space, or these
  /// symbols: <code>_ . : / = + - @</code>.
  Future<void> tagResource({
    required String resourceArn,
    required List<Tag> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSStepFunctions.TagResource'
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

  /// Remove a tag from a Step Functions resource
  ///
  /// May throw [InvalidArn].
  /// May throw [ResourceNotFound].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) for the Step Functions state machine or
  /// activity.
  ///
  /// Parameter [tagKeys] :
  /// The list of tags to remove from the resource.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSStepFunctions.UntagResource'
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

  /// Updates an in-progress Map Run's configuration to include changes to the
  /// settings that control maximum concurrency and Map Run failure.
  ///
  /// May throw [ResourceNotFound].
  /// May throw [InvalidArn].
  /// May throw [ValidationException].
  ///
  /// Parameter [mapRunArn] :
  /// The Amazon Resource Name (ARN) of a Map Run.
  ///
  /// Parameter [maxConcurrency] :
  /// The maximum number of child workflow executions that can be specified to
  /// run in parallel for the Map Run at the same time.
  ///
  /// Parameter [toleratedFailureCount] :
  /// The maximum number of failed items before the Map Run fails.
  ///
  /// Parameter [toleratedFailurePercentage] :
  /// The maximum percentage of failed items before the Map Run fails.
  Future<void> updateMapRun({
    required String mapRunArn,
    int? maxConcurrency,
    int? toleratedFailureCount,
    double? toleratedFailurePercentage,
  }) async {
    _s.validateNumRange(
      'maxConcurrency',
      maxConcurrency,
      0,
      1152921504606846976,
    );
    _s.validateNumRange(
      'toleratedFailureCount',
      toleratedFailureCount,
      0,
      1152921504606846976,
    );
    _s.validateNumRange(
      'toleratedFailurePercentage',
      toleratedFailurePercentage,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSStepFunctions.UpdateMapRun'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'mapRunArn': mapRunArn,
        if (maxConcurrency != null) 'maxConcurrency': maxConcurrency,
        if (toleratedFailureCount != null)
          'toleratedFailureCount': toleratedFailureCount,
        if (toleratedFailurePercentage != null)
          'toleratedFailurePercentage': toleratedFailurePercentage,
      },
    );
  }

  /// Updates an existing state machine by modifying its
  /// <code>definition</code>, <code>roleArn</code>, or
  /// <code>loggingConfiguration</code>. Running executions will continue to use
  /// the previous <code>definition</code> and <code>roleArn</code>. You must
  /// include at least one of <code>definition</code> or <code>roleArn</code> or
  /// you will receive a <code>MissingRequiredParameter</code> error.
  ///
  /// If the given state machine Amazon Resource Name (ARN) is a qualified state
  /// machine ARN, it will fail with ValidationException.
  ///
  /// A qualified state machine ARN refers to a <i>Distributed Map state</i>
  /// defined within a state machine. For example, the qualified state machine
  /// ARN
  /// <code>arn:partition:states:region:account-id:stateMachine:stateMachineName/mapStateLabel</code>
  /// refers to a <i>Distributed Map state</i> with a label
  /// <code>mapStateLabel</code> in the state machine named
  /// <code>stateMachineName</code>.
  /// <note>
  /// All <code>StartExecution</code> calls within a few seconds will use the
  /// updated <code>definition</code> and <code>roleArn</code>. Executions
  /// started immediately after calling <code>UpdateStateMachine</code> may use
  /// the previous state machine <code>definition</code> and
  /// <code>roleArn</code>.
  /// </note>
  ///
  /// May throw [InvalidArn].
  /// May throw [InvalidDefinition].
  /// May throw [InvalidLoggingConfiguration].
  /// May throw [InvalidTracingConfiguration].
  /// May throw [MissingRequiredParameter].
  /// May throw [StateMachineDeleting].
  /// May throw [StateMachineDoesNotExist].
  /// May throw [ValidationException].
  ///
  /// Parameter [stateMachineArn] :
  /// The Amazon Resource Name (ARN) of the state machine.
  ///
  /// Parameter [definition] :
  /// The Amazon States Language definition of the state machine. See <a
  /// href="https://docs.aws.amazon.com/step-functions/latest/dg/concepts-amazon-states-language.html">Amazon
  /// States Language</a>.
  ///
  /// Parameter [loggingConfiguration] :
  /// The <code>LoggingConfiguration</code> data type is used to set CloudWatch
  /// Logs options.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role of the state machine.
  ///
  /// Parameter [tracingConfiguration] :
  /// Selects whether X-Ray tracing is enabled.
  Future<UpdateStateMachineOutput> updateStateMachine({
    required String stateMachineArn,
    String? definition,
    LoggingConfiguration? loggingConfiguration,
    String? roleArn,
    TracingConfiguration? tracingConfiguration,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSStepFunctions.UpdateStateMachine'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'stateMachineArn': stateMachineArn,
        if (definition != null) 'definition': definition,
        if (loggingConfiguration != null)
          'loggingConfiguration': loggingConfiguration,
        if (roleArn != null) 'roleArn': roleArn,
        if (tracingConfiguration != null)
          'tracingConfiguration': tracingConfiguration,
      },
    );

    return UpdateStateMachineOutput.fromJson(jsonResponse.body);
  }
}

/// Contains details about an activity that failed during an execution.
class ActivityFailedEventDetails {
  /// A more detailed explanation of the cause of the failure.
  final String? cause;

  /// The error code of the failure.
  final String? error;

  ActivityFailedEventDetails({
    this.cause,
    this.error,
  });

  factory ActivityFailedEventDetails.fromJson(Map<String, dynamic> json) {
    return ActivityFailedEventDetails(
      cause: json['cause'] as String?,
      error: json['error'] as String?,
    );
  }
}

/// Contains details about an activity.
class ActivityListItem {
  /// The Amazon Resource Name (ARN) that identifies the activity.
  final String activityArn;

  /// The date the activity is created.
  final DateTime creationDate;

  /// The name of the activity.
  ///
  /// A name must <i>not</i> contain:
  ///
  /// <ul>
  /// <li>
  /// white space
  /// </li>
  /// <li>
  /// brackets <code>&lt; &gt; { } [ ]</code>
  /// </li>
  /// <li>
  /// wildcard characters <code>? *</code>
  /// </li>
  /// <li>
  /// special characters <code>" # % \ ^ | ~ ` $ &amp; , ; : /</code>
  /// </li>
  /// <li>
  /// control characters (<code>U+0000-001F</code>, <code>U+007F-009F</code>)
  /// </li>
  /// </ul>
  /// To enable logging with CloudWatch Logs, the name should only contain 0-9,
  /// A-Z, a-z, - and _.
  final String name;

  ActivityListItem({
    required this.activityArn,
    required this.creationDate,
    required this.name,
  });

  factory ActivityListItem.fromJson(Map<String, dynamic> json) {
    return ActivityListItem(
      activityArn: json['activityArn'] as String,
      creationDate:
          nonNullableTimeStampFromJson(json['creationDate'] as Object),
      name: json['name'] as String,
    );
  }
}

/// Contains details about an activity schedule failure that occurred during an
/// execution.
class ActivityScheduleFailedEventDetails {
  /// A more detailed explanation of the cause of the failure.
  final String? cause;

  /// The error code of the failure.
  final String? error;

  ActivityScheduleFailedEventDetails({
    this.cause,
    this.error,
  });

  factory ActivityScheduleFailedEventDetails.fromJson(
      Map<String, dynamic> json) {
    return ActivityScheduleFailedEventDetails(
      cause: json['cause'] as String?,
      error: json['error'] as String?,
    );
  }
}

/// Contains details about an activity scheduled during an execution.
class ActivityScheduledEventDetails {
  /// The Amazon Resource Name (ARN) of the scheduled activity.
  final String resource;

  /// The maximum allowed duration between two heartbeats for the activity task.
  final int? heartbeatInSeconds;

  /// The JSON data input to the activity task. Length constraints apply to the
  /// payload size, and are expressed as bytes in UTF-8 encoding.
  final String? input;

  /// Contains details about the input for an execution history event.
  final HistoryEventExecutionDataDetails? inputDetails;

  /// The maximum allowed duration of the activity task.
  final int? timeoutInSeconds;

  ActivityScheduledEventDetails({
    required this.resource,
    this.heartbeatInSeconds,
    this.input,
    this.inputDetails,
    this.timeoutInSeconds,
  });

  factory ActivityScheduledEventDetails.fromJson(Map<String, dynamic> json) {
    return ActivityScheduledEventDetails(
      resource: json['resource'] as String,
      heartbeatInSeconds: json['heartbeatInSeconds'] as int?,
      input: json['input'] as String?,
      inputDetails: json['inputDetails'] != null
          ? HistoryEventExecutionDataDetails.fromJson(
              json['inputDetails'] as Map<String, dynamic>)
          : null,
      timeoutInSeconds: json['timeoutInSeconds'] as int?,
    );
  }
}

/// Contains details about the start of an activity during an execution.
class ActivityStartedEventDetails {
  /// The name of the worker that the task is assigned to. These names are
  /// provided by the workers when calling <a>GetActivityTask</a>.
  final String? workerName;

  ActivityStartedEventDetails({
    this.workerName,
  });

  factory ActivityStartedEventDetails.fromJson(Map<String, dynamic> json) {
    return ActivityStartedEventDetails(
      workerName: json['workerName'] as String?,
    );
  }
}

/// Contains details about an activity that successfully terminated during an
/// execution.
class ActivitySucceededEventDetails {
  /// The JSON data output by the activity task. Length constraints apply to the
  /// payload size, and are expressed as bytes in UTF-8 encoding.
  final String? output;

  /// Contains details about the output of an execution history event.
  final HistoryEventExecutionDataDetails? outputDetails;

  ActivitySucceededEventDetails({
    this.output,
    this.outputDetails,
  });

  factory ActivitySucceededEventDetails.fromJson(Map<String, dynamic> json) {
    return ActivitySucceededEventDetails(
      output: json['output'] as String?,
      outputDetails: json['outputDetails'] != null
          ? HistoryEventExecutionDataDetails.fromJson(
              json['outputDetails'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// Contains details about an activity timeout that occurred during an
/// execution.
class ActivityTimedOutEventDetails {
  /// A more detailed explanation of the cause of the timeout.
  final String? cause;

  /// The error code of the failure.
  final String? error;

  ActivityTimedOutEventDetails({
    this.cause,
    this.error,
  });

  factory ActivityTimedOutEventDetails.fromJson(Map<String, dynamic> json) {
    return ActivityTimedOutEventDetails(
      cause: json['cause'] as String?,
      error: json['error'] as String?,
    );
  }
}

/// An object that describes workflow billing details.
class BillingDetails {
  /// Billed duration of your workflow, in milliseconds.
  final int? billedDurationInMilliseconds;

  /// Billed memory consumption of your workflow, in MB.
  final int? billedMemoryUsedInMB;

  BillingDetails({
    this.billedDurationInMilliseconds,
    this.billedMemoryUsedInMB,
  });

  factory BillingDetails.fromJson(Map<String, dynamic> json) {
    return BillingDetails(
      billedDurationInMilliseconds:
          json['billedDurationInMilliseconds'] as int?,
      billedMemoryUsedInMB: json['billedMemoryUsedInMB'] as int?,
    );
  }
}

/// Provides details about execution input or output.
class CloudWatchEventsExecutionDataDetails {
  /// Indicates whether input or output was included in the response. Always
  /// <code>true</code> for API calls.
  final bool? included;

  CloudWatchEventsExecutionDataDetails({
    this.included,
  });

  factory CloudWatchEventsExecutionDataDetails.fromJson(
      Map<String, dynamic> json) {
    return CloudWatchEventsExecutionDataDetails(
      included: json['included'] as bool?,
    );
  }
}

/// <p/>
class CloudWatchLogsLogGroup {
  /// The ARN of the the CloudWatch log group to which you want your logs emitted
  /// to. The ARN must end with <code>:*</code>
  final String? logGroupArn;

  CloudWatchLogsLogGroup({
    this.logGroupArn,
  });

  factory CloudWatchLogsLogGroup.fromJson(Map<String, dynamic> json) {
    return CloudWatchLogsLogGroup(
      logGroupArn: json['logGroupArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final logGroupArn = this.logGroupArn;
    return {
      if (logGroupArn != null) 'logGroupArn': logGroupArn,
    };
  }
}

class CreateActivityOutput {
  /// The Amazon Resource Name (ARN) that identifies the created activity.
  final String activityArn;

  /// The date the activity is created.
  final DateTime creationDate;

  CreateActivityOutput({
    required this.activityArn,
    required this.creationDate,
  });

  factory CreateActivityOutput.fromJson(Map<String, dynamic> json) {
    return CreateActivityOutput(
      activityArn: json['activityArn'] as String,
      creationDate:
          nonNullableTimeStampFromJson(json['creationDate'] as Object),
    );
  }
}

class CreateStateMachineOutput {
  /// The date the state machine is created.
  final DateTime creationDate;

  /// The Amazon Resource Name (ARN) that identifies the created state machine.
  final String stateMachineArn;

  CreateStateMachineOutput({
    required this.creationDate,
    required this.stateMachineArn,
  });

  factory CreateStateMachineOutput.fromJson(Map<String, dynamic> json) {
    return CreateStateMachineOutput(
      creationDate:
          nonNullableTimeStampFromJson(json['creationDate'] as Object),
      stateMachineArn: json['stateMachineArn'] as String,
    );
  }
}

class DeleteActivityOutput {
  DeleteActivityOutput();

  factory DeleteActivityOutput.fromJson(Map<String, dynamic> _) {
    return DeleteActivityOutput();
  }
}

class DeleteStateMachineOutput {
  DeleteStateMachineOutput();

  factory DeleteStateMachineOutput.fromJson(Map<String, dynamic> _) {
    return DeleteStateMachineOutput();
  }
}

class DescribeActivityOutput {
  /// The Amazon Resource Name (ARN) that identifies the activity.
  final String activityArn;

  /// The date the activity is created.
  final DateTime creationDate;

  /// The name of the activity.
  ///
  /// A name must <i>not</i> contain:
  ///
  /// <ul>
  /// <li>
  /// white space
  /// </li>
  /// <li>
  /// brackets <code>&lt; &gt; { } [ ]</code>
  /// </li>
  /// <li>
  /// wildcard characters <code>? *</code>
  /// </li>
  /// <li>
  /// special characters <code>" # % \ ^ | ~ ` $ &amp; , ; : /</code>
  /// </li>
  /// <li>
  /// control characters (<code>U+0000-001F</code>, <code>U+007F-009F</code>)
  /// </li>
  /// </ul>
  /// To enable logging with CloudWatch Logs, the name should only contain 0-9,
  /// A-Z, a-z, - and _.
  final String name;

  DescribeActivityOutput({
    required this.activityArn,
    required this.creationDate,
    required this.name,
  });

  factory DescribeActivityOutput.fromJson(Map<String, dynamic> json) {
    return DescribeActivityOutput(
      activityArn: json['activityArn'] as String,
      creationDate:
          nonNullableTimeStampFromJson(json['creationDate'] as Object),
      name: json['name'] as String,
    );
  }
}

class DescribeExecutionOutput {
  /// The Amazon Resource Name (ARN) that identifies the execution.
  final String executionArn;

  /// The date the execution is started.
  final DateTime startDate;

  /// The Amazon Resource Name (ARN) of the executed stated machine.
  final String stateMachineArn;

  /// The current status of the execution.
  final ExecutionStatus status;

  /// The cause string if the state machine execution failed.
  final String? cause;

  /// The error string if the state machine execution failed.
  final String? error;

  /// The string that contains the JSON input data of the execution. Length
  /// constraints apply to the payload size, and are expressed as bytes in UTF-8
  /// encoding.
  final String? input;
  final CloudWatchEventsExecutionDataDetails? inputDetails;

  /// The Amazon Resource Name (ARN) that identifies a Map Run, which dispatched
  /// this execution.
  final String? mapRunArn;

  /// The name of the execution.
  ///
  /// A name must <i>not</i> contain:
  ///
  /// <ul>
  /// <li>
  /// white space
  /// </li>
  /// <li>
  /// brackets <code>&lt; &gt; { } [ ]</code>
  /// </li>
  /// <li>
  /// wildcard characters <code>? *</code>
  /// </li>
  /// <li>
  /// special characters <code>" # % \ ^ | ~ ` $ &amp; , ; : /</code>
  /// </li>
  /// <li>
  /// control characters (<code>U+0000-001F</code>, <code>U+007F-009F</code>)
  /// </li>
  /// </ul>
  /// To enable logging with CloudWatch Logs, the name should only contain 0-9,
  /// A-Z, a-z, - and _.
  final String? name;

  /// The JSON output data of the execution. Length constraints apply to the
  /// payload size, and are expressed as bytes in UTF-8 encoding.
  /// <note>
  /// This field is set only if the execution succeeds. If the execution fails,
  /// this field is null.
  /// </note>
  final String? output;
  final CloudWatchEventsExecutionDataDetails? outputDetails;

  /// If the execution has already ended, the date the execution stopped.
  final DateTime? stopDate;

  /// The X-Ray trace header that was passed to the execution.
  final String? traceHeader;

  DescribeExecutionOutput({
    required this.executionArn,
    required this.startDate,
    required this.stateMachineArn,
    required this.status,
    this.cause,
    this.error,
    this.input,
    this.inputDetails,
    this.mapRunArn,
    this.name,
    this.output,
    this.outputDetails,
    this.stopDate,
    this.traceHeader,
  });

  factory DescribeExecutionOutput.fromJson(Map<String, dynamic> json) {
    return DescribeExecutionOutput(
      executionArn: json['executionArn'] as String,
      startDate: nonNullableTimeStampFromJson(json['startDate'] as Object),
      stateMachineArn: json['stateMachineArn'] as String,
      status: (json['status'] as String).toExecutionStatus(),
      cause: json['cause'] as String?,
      error: json['error'] as String?,
      input: json['input'] as String?,
      inputDetails: json['inputDetails'] != null
          ? CloudWatchEventsExecutionDataDetails.fromJson(
              json['inputDetails'] as Map<String, dynamic>)
          : null,
      mapRunArn: json['mapRunArn'] as String?,
      name: json['name'] as String?,
      output: json['output'] as String?,
      outputDetails: json['outputDetails'] != null
          ? CloudWatchEventsExecutionDataDetails.fromJson(
              json['outputDetails'] as Map<String, dynamic>)
          : null,
      stopDate: timeStampFromJson(json['stopDate']),
      traceHeader: json['traceHeader'] as String?,
    );
  }
}

class DescribeMapRunOutput {
  /// The Amazon Resource Name (ARN) that identifies the execution in which the
  /// Map Run was started.
  final String executionArn;

  /// A JSON object that contains information about the total number of child
  /// workflow executions for the Map Run, and the count of child workflow
  /// executions for each status, such as <code>failed</code> and
  /// <code>succeeded</code>.
  final MapRunExecutionCounts executionCounts;

  /// A JSON object that contains information about the total number of items, and
  /// the item count for each processing status, such as <code>pending</code> and
  /// <code>failed</code>.
  final MapRunItemCounts itemCounts;

  /// The Amazon Resource Name (ARN) that identifies a Map Run.
  final String mapRunArn;

  /// The maximum number of child workflow executions configured to run in
  /// parallel for the Map Run at the same time.
  final int maxConcurrency;

  /// The date when the Map Run was started.
  final DateTime startDate;

  /// The current status of the Map Run.
  final MapRunStatus status;

  /// The maximum number of failed child workflow executions before the Map Run
  /// fails.
  final int toleratedFailureCount;

  /// The maximum percentage of failed child workflow executions before the Map
  /// Run fails.
  final double toleratedFailurePercentage;

  /// The date when the Map Run was stopped.
  final DateTime? stopDate;

  DescribeMapRunOutput({
    required this.executionArn,
    required this.executionCounts,
    required this.itemCounts,
    required this.mapRunArn,
    required this.maxConcurrency,
    required this.startDate,
    required this.status,
    required this.toleratedFailureCount,
    required this.toleratedFailurePercentage,
    this.stopDate,
  });

  factory DescribeMapRunOutput.fromJson(Map<String, dynamic> json) {
    return DescribeMapRunOutput(
      executionArn: json['executionArn'] as String,
      executionCounts: MapRunExecutionCounts.fromJson(
          json['executionCounts'] as Map<String, dynamic>),
      itemCounts:
          MapRunItemCounts.fromJson(json['itemCounts'] as Map<String, dynamic>),
      mapRunArn: json['mapRunArn'] as String,
      maxConcurrency: json['maxConcurrency'] as int,
      startDate: nonNullableTimeStampFromJson(json['startDate'] as Object),
      status: (json['status'] as String).toMapRunStatus(),
      toleratedFailureCount: json['toleratedFailureCount'] as int,
      toleratedFailurePercentage: json['toleratedFailurePercentage'] as double,
      stopDate: timeStampFromJson(json['stopDate']),
    );
  }
}

class DescribeStateMachineForExecutionOutput {
  /// The Amazon States Language definition of the state machine. See <a
  /// href="https://docs.aws.amazon.com/step-functions/latest/dg/concepts-amazon-states-language.html">Amazon
  /// States Language</a>.
  final String definition;

  /// The name of the state machine associated with the execution.
  final String name;

  /// The Amazon Resource Name (ARN) of the IAM role of the State Machine for the
  /// execution.
  final String roleArn;

  /// The Amazon Resource Name (ARN) of the state machine associated with the
  /// execution.
  final String stateMachineArn;

  /// The date and time the state machine associated with an execution was
  /// updated. For a newly created state machine, this is the creation date.
  final DateTime updateDate;

  /// A user-defined or an auto-generated string that identifies a
  /// <code>Map</code> state. This ﬁeld is returned only if the
  /// <code>executionArn</code> is a child workflow execution that was started by
  /// a Distributed Map state.
  final String? label;
  final LoggingConfiguration? loggingConfiguration;

  /// The Amazon Resource Name (ARN) of the Map Run that started the child
  /// workflow execution. This field is returned only if the
  /// <code>executionArn</code> is a child workflow execution that was started by
  /// a Distributed Map state.
  final String? mapRunArn;

  /// Selects whether X-Ray tracing is enabled.
  final TracingConfiguration? tracingConfiguration;

  DescribeStateMachineForExecutionOutput({
    required this.definition,
    required this.name,
    required this.roleArn,
    required this.stateMachineArn,
    required this.updateDate,
    this.label,
    this.loggingConfiguration,
    this.mapRunArn,
    this.tracingConfiguration,
  });

  factory DescribeStateMachineForExecutionOutput.fromJson(
      Map<String, dynamic> json) {
    return DescribeStateMachineForExecutionOutput(
      definition: json['definition'] as String,
      name: json['name'] as String,
      roleArn: json['roleArn'] as String,
      stateMachineArn: json['stateMachineArn'] as String,
      updateDate: nonNullableTimeStampFromJson(json['updateDate'] as Object),
      label: json['label'] as String?,
      loggingConfiguration: json['loggingConfiguration'] != null
          ? LoggingConfiguration.fromJson(
              json['loggingConfiguration'] as Map<String, dynamic>)
          : null,
      mapRunArn: json['mapRunArn'] as String?,
      tracingConfiguration: json['tracingConfiguration'] != null
          ? TracingConfiguration.fromJson(
              json['tracingConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }
}

class DescribeStateMachineOutput {
  /// The date the state machine is created.
  final DateTime creationDate;

  /// The Amazon States Language definition of the state machine. See <a
  /// href="https://docs.aws.amazon.com/step-functions/latest/dg/concepts-amazon-states-language.html">Amazon
  /// States Language</a>.
  final String definition;

  /// The name of the state machine.
  ///
  /// A name must <i>not</i> contain:
  ///
  /// <ul>
  /// <li>
  /// white space
  /// </li>
  /// <li>
  /// brackets <code>&lt; &gt; { } [ ]</code>
  /// </li>
  /// <li>
  /// wildcard characters <code>? *</code>
  /// </li>
  /// <li>
  /// special characters <code>" # % \ ^ | ~ ` $ &amp; , ; : /</code>
  /// </li>
  /// <li>
  /// control characters (<code>U+0000-001F</code>, <code>U+007F-009F</code>)
  /// </li>
  /// </ul>
  /// To enable logging with CloudWatch Logs, the name should only contain 0-9,
  /// A-Z, a-z, - and _.
  final String name;

  /// The Amazon Resource Name (ARN) of the IAM role used when creating this state
  /// machine. (The IAM role maintains security by granting Step Functions access
  /// to Amazon Web Services resources.)
  final String roleArn;

  /// The Amazon Resource Name (ARN) that identifies the state machine.
  final String stateMachineArn;

  /// The <code>type</code> of the state machine (<code>STANDARD</code> or
  /// <code>EXPRESS</code>).
  final StateMachineType type;

  /// A user-defined or an auto-generated string that identifies a
  /// <code>Map</code> state. This parameter is present only if the
  /// <code>stateMachineArn</code> specified in input is a qualified state machine
  /// ARN.
  final String? label;
  final LoggingConfiguration? loggingConfiguration;

  /// The current status of the state machine.
  final StateMachineStatus? status;

  /// Selects whether X-Ray tracing is enabled.
  final TracingConfiguration? tracingConfiguration;

  DescribeStateMachineOutput({
    required this.creationDate,
    required this.definition,
    required this.name,
    required this.roleArn,
    required this.stateMachineArn,
    required this.type,
    this.label,
    this.loggingConfiguration,
    this.status,
    this.tracingConfiguration,
  });

  factory DescribeStateMachineOutput.fromJson(Map<String, dynamic> json) {
    return DescribeStateMachineOutput(
      creationDate:
          nonNullableTimeStampFromJson(json['creationDate'] as Object),
      definition: json['definition'] as String,
      name: json['name'] as String,
      roleArn: json['roleArn'] as String,
      stateMachineArn: json['stateMachineArn'] as String,
      type: (json['type'] as String).toStateMachineType(),
      label: json['label'] as String?,
      loggingConfiguration: json['loggingConfiguration'] != null
          ? LoggingConfiguration.fromJson(
              json['loggingConfiguration'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)?.toStateMachineStatus(),
      tracingConfiguration: json['tracingConfiguration'] != null
          ? TracingConfiguration.fromJson(
              json['tracingConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// Contains details about an abort of an execution.
class ExecutionAbortedEventDetails {
  /// A more detailed explanation of the cause of the failure.
  final String? cause;

  /// The error code of the failure.
  final String? error;

  ExecutionAbortedEventDetails({
    this.cause,
    this.error,
  });

  factory ExecutionAbortedEventDetails.fromJson(Map<String, dynamic> json) {
    return ExecutionAbortedEventDetails(
      cause: json['cause'] as String?,
      error: json['error'] as String?,
    );
  }
}

/// Contains details about an execution failure event.
class ExecutionFailedEventDetails {
  /// A more detailed explanation of the cause of the failure.
  final String? cause;

  /// The error code of the failure.
  final String? error;

  ExecutionFailedEventDetails({
    this.cause,
    this.error,
  });

  factory ExecutionFailedEventDetails.fromJson(Map<String, dynamic> json) {
    return ExecutionFailedEventDetails(
      cause: json['cause'] as String?,
      error: json['error'] as String?,
    );
  }
}

/// Contains details about an execution.
class ExecutionListItem {
  /// The Amazon Resource Name (ARN) that identifies the execution.
  final String executionArn;

  /// The name of the execution.
  ///
  /// A name must <i>not</i> contain:
  ///
  /// <ul>
  /// <li>
  /// white space
  /// </li>
  /// <li>
  /// brackets <code>&lt; &gt; { } [ ]</code>
  /// </li>
  /// <li>
  /// wildcard characters <code>? *</code>
  /// </li>
  /// <li>
  /// special characters <code>" # % \ ^ | ~ ` $ &amp; , ; : /</code>
  /// </li>
  /// <li>
  /// control characters (<code>U+0000-001F</code>, <code>U+007F-009F</code>)
  /// </li>
  /// </ul>
  /// To enable logging with CloudWatch Logs, the name should only contain 0-9,
  /// A-Z, a-z, - and _.
  final String name;

  /// The date the execution started.
  final DateTime startDate;

  /// The Amazon Resource Name (ARN) of the executed state machine.
  final String stateMachineArn;

  /// The current status of the execution.
  final ExecutionStatus status;

  /// The total number of items processed in a child workflow execution. This
  /// field is returned only if <code>mapRunArn</code> was specified in the
  /// <code>ListExecutions</code> API action. If <code>stateMachineArn</code> was
  /// specified in <code>ListExecutions</code>, the <code>itemCount</code> field
  /// isn't returned.
  final int? itemCount;

  /// The Amazon Resource Name (ARN) of a Map Run. This field is returned only if
  /// <code>mapRunArn</code> was specified in the <code>ListExecutions</code> API
  /// action. If <code>stateMachineArn</code> was specified in
  /// <code>ListExecutions</code>, the <code>mapRunArn</code> isn't returned.
  final String? mapRunArn;

  /// If the execution already ended, the date the execution stopped.
  final DateTime? stopDate;

  ExecutionListItem({
    required this.executionArn,
    required this.name,
    required this.startDate,
    required this.stateMachineArn,
    required this.status,
    this.itemCount,
    this.mapRunArn,
    this.stopDate,
  });

  factory ExecutionListItem.fromJson(Map<String, dynamic> json) {
    return ExecutionListItem(
      executionArn: json['executionArn'] as String,
      name: json['name'] as String,
      startDate: nonNullableTimeStampFromJson(json['startDate'] as Object),
      stateMachineArn: json['stateMachineArn'] as String,
      status: (json['status'] as String).toExecutionStatus(),
      itemCount: json['itemCount'] as int?,
      mapRunArn: json['mapRunArn'] as String?,
      stopDate: timeStampFromJson(json['stopDate']),
    );
  }
}

/// Contains details about the start of the execution.
class ExecutionStartedEventDetails {
  /// The JSON data input to the execution. Length constraints apply to the
  /// payload size, and are expressed as bytes in UTF-8 encoding.
  final String? input;

  /// Contains details about the input for an execution history event.
  final HistoryEventExecutionDataDetails? inputDetails;

  /// The Amazon Resource Name (ARN) of the IAM role used for executing Lambda
  /// tasks.
  final String? roleArn;

  ExecutionStartedEventDetails({
    this.input,
    this.inputDetails,
    this.roleArn,
  });

  factory ExecutionStartedEventDetails.fromJson(Map<String, dynamic> json) {
    return ExecutionStartedEventDetails(
      input: json['input'] as String?,
      inputDetails: json['inputDetails'] != null
          ? HistoryEventExecutionDataDetails.fromJson(
              json['inputDetails'] as Map<String, dynamic>)
          : null,
      roleArn: json['roleArn'] as String?,
    );
  }
}

enum ExecutionStatus {
  running,
  succeeded,
  failed,
  timedOut,
  aborted,
}

extension ExecutionStatusValueExtension on ExecutionStatus {
  String toValue() {
    switch (this) {
      case ExecutionStatus.running:
        return 'RUNNING';
      case ExecutionStatus.succeeded:
        return 'SUCCEEDED';
      case ExecutionStatus.failed:
        return 'FAILED';
      case ExecutionStatus.timedOut:
        return 'TIMED_OUT';
      case ExecutionStatus.aborted:
        return 'ABORTED';
    }
  }
}

extension ExecutionStatusFromString on String {
  ExecutionStatus toExecutionStatus() {
    switch (this) {
      case 'RUNNING':
        return ExecutionStatus.running;
      case 'SUCCEEDED':
        return ExecutionStatus.succeeded;
      case 'FAILED':
        return ExecutionStatus.failed;
      case 'TIMED_OUT':
        return ExecutionStatus.timedOut;
      case 'ABORTED':
        return ExecutionStatus.aborted;
    }
    throw Exception('$this is not known in enum ExecutionStatus');
  }
}

/// Contains details about the successful termination of the execution.
class ExecutionSucceededEventDetails {
  /// The JSON data output by the execution. Length constraints apply to the
  /// payload size, and are expressed as bytes in UTF-8 encoding.
  final String? output;

  /// Contains details about the output of an execution history event.
  final HistoryEventExecutionDataDetails? outputDetails;

  ExecutionSucceededEventDetails({
    this.output,
    this.outputDetails,
  });

  factory ExecutionSucceededEventDetails.fromJson(Map<String, dynamic> json) {
    return ExecutionSucceededEventDetails(
      output: json['output'] as String?,
      outputDetails: json['outputDetails'] != null
          ? HistoryEventExecutionDataDetails.fromJson(
              json['outputDetails'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// Contains details about the execution timeout that occurred during the
/// execution.
class ExecutionTimedOutEventDetails {
  /// A more detailed explanation of the cause of the timeout.
  final String? cause;

  /// The error code of the failure.
  final String? error;

  ExecutionTimedOutEventDetails({
    this.cause,
    this.error,
  });

  factory ExecutionTimedOutEventDetails.fromJson(Map<String, dynamic> json) {
    return ExecutionTimedOutEventDetails(
      cause: json['cause'] as String?,
      error: json['error'] as String?,
    );
  }
}

class GetActivityTaskOutput {
  /// The string that contains the JSON input data for the task. Length
  /// constraints apply to the payload size, and are expressed as bytes in UTF-8
  /// encoding.
  final String? input;

  /// A token that identifies the scheduled task. This token must be copied and
  /// included in subsequent calls to <a>SendTaskHeartbeat</a>,
  /// <a>SendTaskSuccess</a> or <a>SendTaskFailure</a> in order to report the
  /// progress or completion of the task.
  final String? taskToken;

  GetActivityTaskOutput({
    this.input,
    this.taskToken,
  });

  factory GetActivityTaskOutput.fromJson(Map<String, dynamic> json) {
    return GetActivityTaskOutput(
      input: json['input'] as String?,
      taskToken: json['taskToken'] as String?,
    );
  }
}

class GetExecutionHistoryOutput {
  /// The list of events that occurred in the execution.
  final List<HistoryEvent> events;

  /// If <code>nextToken</code> is returned, there are more results available. The
  /// value of <code>nextToken</code> is a unique pagination token for each page.
  /// Make the call again using the returned token to retrieve the next page. Keep
  /// all other arguments unchanged. Each pagination token expires after 24 hours.
  /// Using an expired pagination token will return an <i>HTTP 400
  /// InvalidToken</i> error.
  final String? nextToken;

  GetExecutionHistoryOutput({
    required this.events,
    this.nextToken,
  });

  factory GetExecutionHistoryOutput.fromJson(Map<String, dynamic> json) {
    return GetExecutionHistoryOutput(
      events: (json['events'] as List)
          .whereNotNull()
          .map((e) => HistoryEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }
}

/// Contains details about the events of an execution.
class HistoryEvent {
  /// The id of the event. Events are numbered sequentially, starting at one.
  final int id;

  /// The date and time the event occurred.
  final DateTime timestamp;

  /// The type of the event.
  final HistoryEventType type;
  final ActivityFailedEventDetails? activityFailedEventDetails;

  /// Contains details about an activity schedule event that failed during an
  /// execution.
  final ActivityScheduleFailedEventDetails? activityScheduleFailedEventDetails;
  final ActivityScheduledEventDetails? activityScheduledEventDetails;
  final ActivityStartedEventDetails? activityStartedEventDetails;
  final ActivitySucceededEventDetails? activitySucceededEventDetails;
  final ActivityTimedOutEventDetails? activityTimedOutEventDetails;
  final ExecutionAbortedEventDetails? executionAbortedEventDetails;
  final ExecutionFailedEventDetails? executionFailedEventDetails;
  final ExecutionStartedEventDetails? executionStartedEventDetails;
  final ExecutionSucceededEventDetails? executionSucceededEventDetails;
  final ExecutionTimedOutEventDetails? executionTimedOutEventDetails;
  final LambdaFunctionFailedEventDetails? lambdaFunctionFailedEventDetails;
  final LambdaFunctionScheduleFailedEventDetails?
      lambdaFunctionScheduleFailedEventDetails;
  final LambdaFunctionScheduledEventDetails?
      lambdaFunctionScheduledEventDetails;

  /// Contains details about a lambda function that failed to start during an
  /// execution.
  final LambdaFunctionStartFailedEventDetails?
      lambdaFunctionStartFailedEventDetails;

  /// Contains details about a Lambda function that terminated successfully during
  /// an execution.
  final LambdaFunctionSucceededEventDetails?
      lambdaFunctionSucceededEventDetails;
  final LambdaFunctionTimedOutEventDetails? lambdaFunctionTimedOutEventDetails;

  /// Contains details about an iteration of a Map state that was aborted.
  final MapIterationEventDetails? mapIterationAbortedEventDetails;

  /// Contains details about an iteration of a Map state that failed.
  final MapIterationEventDetails? mapIterationFailedEventDetails;

  /// Contains details about an iteration of a Map state that was started.
  final MapIterationEventDetails? mapIterationStartedEventDetails;

  /// Contains details about an iteration of a Map state that succeeded.
  final MapIterationEventDetails? mapIterationSucceededEventDetails;

  /// Contains error and cause details about a Map Run that failed.
  final MapRunFailedEventDetails? mapRunFailedEventDetails;

  /// Contains details, such as <code>mapRunArn</code>, and the start date and
  /// time of a Map Run. <code>mapRunArn</code> is the Amazon Resource Name (ARN)
  /// of the Map Run that was started.
  final MapRunStartedEventDetails? mapRunStartedEventDetails;

  /// Contains details about Map state that was started.
  final MapStateStartedEventDetails? mapStateStartedEventDetails;

  /// The id of the previous event.
  final int? previousEventId;
  final StateEnteredEventDetails? stateEnteredEventDetails;
  final StateExitedEventDetails? stateExitedEventDetails;

  /// Contains details about the failure of a task.
  final TaskFailedEventDetails? taskFailedEventDetails;

  /// Contains details about a task that was scheduled.
  final TaskScheduledEventDetails? taskScheduledEventDetails;

  /// Contains details about a task that failed to start.
  final TaskStartFailedEventDetails? taskStartFailedEventDetails;

  /// Contains details about a task that was started.
  final TaskStartedEventDetails? taskStartedEventDetails;

  /// Contains details about a task that where the submit failed.
  final TaskSubmitFailedEventDetails? taskSubmitFailedEventDetails;

  /// Contains details about a submitted task.
  final TaskSubmittedEventDetails? taskSubmittedEventDetails;

  /// Contains details about a task that succeeded.
  final TaskSucceededEventDetails? taskSucceededEventDetails;

  /// Contains details about a task that timed out.
  final TaskTimedOutEventDetails? taskTimedOutEventDetails;

  HistoryEvent({
    required this.id,
    required this.timestamp,
    required this.type,
    this.activityFailedEventDetails,
    this.activityScheduleFailedEventDetails,
    this.activityScheduledEventDetails,
    this.activityStartedEventDetails,
    this.activitySucceededEventDetails,
    this.activityTimedOutEventDetails,
    this.executionAbortedEventDetails,
    this.executionFailedEventDetails,
    this.executionStartedEventDetails,
    this.executionSucceededEventDetails,
    this.executionTimedOutEventDetails,
    this.lambdaFunctionFailedEventDetails,
    this.lambdaFunctionScheduleFailedEventDetails,
    this.lambdaFunctionScheduledEventDetails,
    this.lambdaFunctionStartFailedEventDetails,
    this.lambdaFunctionSucceededEventDetails,
    this.lambdaFunctionTimedOutEventDetails,
    this.mapIterationAbortedEventDetails,
    this.mapIterationFailedEventDetails,
    this.mapIterationStartedEventDetails,
    this.mapIterationSucceededEventDetails,
    this.mapRunFailedEventDetails,
    this.mapRunStartedEventDetails,
    this.mapStateStartedEventDetails,
    this.previousEventId,
    this.stateEnteredEventDetails,
    this.stateExitedEventDetails,
    this.taskFailedEventDetails,
    this.taskScheduledEventDetails,
    this.taskStartFailedEventDetails,
    this.taskStartedEventDetails,
    this.taskSubmitFailedEventDetails,
    this.taskSubmittedEventDetails,
    this.taskSucceededEventDetails,
    this.taskTimedOutEventDetails,
  });

  factory HistoryEvent.fromJson(Map<String, dynamic> json) {
    return HistoryEvent(
      id: json['id'] as int,
      timestamp: nonNullableTimeStampFromJson(json['timestamp'] as Object),
      type: (json['type'] as String).toHistoryEventType(),
      activityFailedEventDetails: json['activityFailedEventDetails'] != null
          ? ActivityFailedEventDetails.fromJson(
              json['activityFailedEventDetails'] as Map<String, dynamic>)
          : null,
      activityScheduleFailedEventDetails:
          json['activityScheduleFailedEventDetails'] != null
              ? ActivityScheduleFailedEventDetails.fromJson(
                  json['activityScheduleFailedEventDetails']
                      as Map<String, dynamic>)
              : null,
      activityScheduledEventDetails:
          json['activityScheduledEventDetails'] != null
              ? ActivityScheduledEventDetails.fromJson(
                  json['activityScheduledEventDetails'] as Map<String, dynamic>)
              : null,
      activityStartedEventDetails: json['activityStartedEventDetails'] != null
          ? ActivityStartedEventDetails.fromJson(
              json['activityStartedEventDetails'] as Map<String, dynamic>)
          : null,
      activitySucceededEventDetails:
          json['activitySucceededEventDetails'] != null
              ? ActivitySucceededEventDetails.fromJson(
                  json['activitySucceededEventDetails'] as Map<String, dynamic>)
              : null,
      activityTimedOutEventDetails: json['activityTimedOutEventDetails'] != null
          ? ActivityTimedOutEventDetails.fromJson(
              json['activityTimedOutEventDetails'] as Map<String, dynamic>)
          : null,
      executionAbortedEventDetails: json['executionAbortedEventDetails'] != null
          ? ExecutionAbortedEventDetails.fromJson(
              json['executionAbortedEventDetails'] as Map<String, dynamic>)
          : null,
      executionFailedEventDetails: json['executionFailedEventDetails'] != null
          ? ExecutionFailedEventDetails.fromJson(
              json['executionFailedEventDetails'] as Map<String, dynamic>)
          : null,
      executionStartedEventDetails: json['executionStartedEventDetails'] != null
          ? ExecutionStartedEventDetails.fromJson(
              json['executionStartedEventDetails'] as Map<String, dynamic>)
          : null,
      executionSucceededEventDetails: json['executionSucceededEventDetails'] !=
              null
          ? ExecutionSucceededEventDetails.fromJson(
              json['executionSucceededEventDetails'] as Map<String, dynamic>)
          : null,
      executionTimedOutEventDetails:
          json['executionTimedOutEventDetails'] != null
              ? ExecutionTimedOutEventDetails.fromJson(
                  json['executionTimedOutEventDetails'] as Map<String, dynamic>)
              : null,
      lambdaFunctionFailedEventDetails:
          json['lambdaFunctionFailedEventDetails'] != null
              ? LambdaFunctionFailedEventDetails.fromJson(
                  json['lambdaFunctionFailedEventDetails']
                      as Map<String, dynamic>)
              : null,
      lambdaFunctionScheduleFailedEventDetails:
          json['lambdaFunctionScheduleFailedEventDetails'] != null
              ? LambdaFunctionScheduleFailedEventDetails.fromJson(
                  json['lambdaFunctionScheduleFailedEventDetails']
                      as Map<String, dynamic>)
              : null,
      lambdaFunctionScheduledEventDetails:
          json['lambdaFunctionScheduledEventDetails'] != null
              ? LambdaFunctionScheduledEventDetails.fromJson(
                  json['lambdaFunctionScheduledEventDetails']
                      as Map<String, dynamic>)
              : null,
      lambdaFunctionStartFailedEventDetails:
          json['lambdaFunctionStartFailedEventDetails'] != null
              ? LambdaFunctionStartFailedEventDetails.fromJson(
                  json['lambdaFunctionStartFailedEventDetails']
                      as Map<String, dynamic>)
              : null,
      lambdaFunctionSucceededEventDetails:
          json['lambdaFunctionSucceededEventDetails'] != null
              ? LambdaFunctionSucceededEventDetails.fromJson(
                  json['lambdaFunctionSucceededEventDetails']
                      as Map<String, dynamic>)
              : null,
      lambdaFunctionTimedOutEventDetails:
          json['lambdaFunctionTimedOutEventDetails'] != null
              ? LambdaFunctionTimedOutEventDetails.fromJson(
                  json['lambdaFunctionTimedOutEventDetails']
                      as Map<String, dynamic>)
              : null,
      mapIterationAbortedEventDetails:
          json['mapIterationAbortedEventDetails'] != null
              ? MapIterationEventDetails.fromJson(
                  json['mapIterationAbortedEventDetails']
                      as Map<String, dynamic>)
              : null,
      mapIterationFailedEventDetails: json['mapIterationFailedEventDetails'] !=
              null
          ? MapIterationEventDetails.fromJson(
              json['mapIterationFailedEventDetails'] as Map<String, dynamic>)
          : null,
      mapIterationStartedEventDetails:
          json['mapIterationStartedEventDetails'] != null
              ? MapIterationEventDetails.fromJson(
                  json['mapIterationStartedEventDetails']
                      as Map<String, dynamic>)
              : null,
      mapIterationSucceededEventDetails:
          json['mapIterationSucceededEventDetails'] != null
              ? MapIterationEventDetails.fromJson(
                  json['mapIterationSucceededEventDetails']
                      as Map<String, dynamic>)
              : null,
      mapRunFailedEventDetails: json['mapRunFailedEventDetails'] != null
          ? MapRunFailedEventDetails.fromJson(
              json['mapRunFailedEventDetails'] as Map<String, dynamic>)
          : null,
      mapRunStartedEventDetails: json['mapRunStartedEventDetails'] != null
          ? MapRunStartedEventDetails.fromJson(
              json['mapRunStartedEventDetails'] as Map<String, dynamic>)
          : null,
      mapStateStartedEventDetails: json['mapStateStartedEventDetails'] != null
          ? MapStateStartedEventDetails.fromJson(
              json['mapStateStartedEventDetails'] as Map<String, dynamic>)
          : null,
      previousEventId: json['previousEventId'] as int?,
      stateEnteredEventDetails: json['stateEnteredEventDetails'] != null
          ? StateEnteredEventDetails.fromJson(
              json['stateEnteredEventDetails'] as Map<String, dynamic>)
          : null,
      stateExitedEventDetails: json['stateExitedEventDetails'] != null
          ? StateExitedEventDetails.fromJson(
              json['stateExitedEventDetails'] as Map<String, dynamic>)
          : null,
      taskFailedEventDetails: json['taskFailedEventDetails'] != null
          ? TaskFailedEventDetails.fromJson(
              json['taskFailedEventDetails'] as Map<String, dynamic>)
          : null,
      taskScheduledEventDetails: json['taskScheduledEventDetails'] != null
          ? TaskScheduledEventDetails.fromJson(
              json['taskScheduledEventDetails'] as Map<String, dynamic>)
          : null,
      taskStartFailedEventDetails: json['taskStartFailedEventDetails'] != null
          ? TaskStartFailedEventDetails.fromJson(
              json['taskStartFailedEventDetails'] as Map<String, dynamic>)
          : null,
      taskStartedEventDetails: json['taskStartedEventDetails'] != null
          ? TaskStartedEventDetails.fromJson(
              json['taskStartedEventDetails'] as Map<String, dynamic>)
          : null,
      taskSubmitFailedEventDetails: json['taskSubmitFailedEventDetails'] != null
          ? TaskSubmitFailedEventDetails.fromJson(
              json['taskSubmitFailedEventDetails'] as Map<String, dynamic>)
          : null,
      taskSubmittedEventDetails: json['taskSubmittedEventDetails'] != null
          ? TaskSubmittedEventDetails.fromJson(
              json['taskSubmittedEventDetails'] as Map<String, dynamic>)
          : null,
      taskSucceededEventDetails: json['taskSucceededEventDetails'] != null
          ? TaskSucceededEventDetails.fromJson(
              json['taskSucceededEventDetails'] as Map<String, dynamic>)
          : null,
      taskTimedOutEventDetails: json['taskTimedOutEventDetails'] != null
          ? TaskTimedOutEventDetails.fromJson(
              json['taskTimedOutEventDetails'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// Provides details about input or output in an execution history event.
class HistoryEventExecutionDataDetails {
  /// Indicates whether input or output was truncated in the response. Always
  /// <code>false</code> for API calls.
  final bool? truncated;

  HistoryEventExecutionDataDetails({
    this.truncated,
  });

  factory HistoryEventExecutionDataDetails.fromJson(Map<String, dynamic> json) {
    return HistoryEventExecutionDataDetails(
      truncated: json['truncated'] as bool?,
    );
  }
}

enum HistoryEventType {
  activityFailed,
  activityScheduled,
  activityScheduleFailed,
  activityStarted,
  activitySucceeded,
  activityTimedOut,
  choiceStateEntered,
  choiceStateExited,
  executionAborted,
  executionFailed,
  executionStarted,
  executionSucceeded,
  executionTimedOut,
  failStateEntered,
  lambdaFunctionFailed,
  lambdaFunctionScheduled,
  lambdaFunctionScheduleFailed,
  lambdaFunctionStarted,
  lambdaFunctionStartFailed,
  lambdaFunctionSucceeded,
  lambdaFunctionTimedOut,
  mapIterationAborted,
  mapIterationFailed,
  mapIterationStarted,
  mapIterationSucceeded,
  mapStateAborted,
  mapStateEntered,
  mapStateExited,
  mapStateFailed,
  mapStateStarted,
  mapStateSucceeded,
  parallelStateAborted,
  parallelStateEntered,
  parallelStateExited,
  parallelStateFailed,
  parallelStateStarted,
  parallelStateSucceeded,
  passStateEntered,
  passStateExited,
  succeedStateEntered,
  succeedStateExited,
  taskFailed,
  taskScheduled,
  taskStarted,
  taskStartFailed,
  taskStateAborted,
  taskStateEntered,
  taskStateExited,
  taskSubmitFailed,
  taskSubmitted,
  taskSucceeded,
  taskTimedOut,
  waitStateAborted,
  waitStateEntered,
  waitStateExited,
  mapRunAborted,
  mapRunFailed,
  mapRunStarted,
  mapRunSucceeded,
}

extension HistoryEventTypeValueExtension on HistoryEventType {
  String toValue() {
    switch (this) {
      case HistoryEventType.activityFailed:
        return 'ActivityFailed';
      case HistoryEventType.activityScheduled:
        return 'ActivityScheduled';
      case HistoryEventType.activityScheduleFailed:
        return 'ActivityScheduleFailed';
      case HistoryEventType.activityStarted:
        return 'ActivityStarted';
      case HistoryEventType.activitySucceeded:
        return 'ActivitySucceeded';
      case HistoryEventType.activityTimedOut:
        return 'ActivityTimedOut';
      case HistoryEventType.choiceStateEntered:
        return 'ChoiceStateEntered';
      case HistoryEventType.choiceStateExited:
        return 'ChoiceStateExited';
      case HistoryEventType.executionAborted:
        return 'ExecutionAborted';
      case HistoryEventType.executionFailed:
        return 'ExecutionFailed';
      case HistoryEventType.executionStarted:
        return 'ExecutionStarted';
      case HistoryEventType.executionSucceeded:
        return 'ExecutionSucceeded';
      case HistoryEventType.executionTimedOut:
        return 'ExecutionTimedOut';
      case HistoryEventType.failStateEntered:
        return 'FailStateEntered';
      case HistoryEventType.lambdaFunctionFailed:
        return 'LambdaFunctionFailed';
      case HistoryEventType.lambdaFunctionScheduled:
        return 'LambdaFunctionScheduled';
      case HistoryEventType.lambdaFunctionScheduleFailed:
        return 'LambdaFunctionScheduleFailed';
      case HistoryEventType.lambdaFunctionStarted:
        return 'LambdaFunctionStarted';
      case HistoryEventType.lambdaFunctionStartFailed:
        return 'LambdaFunctionStartFailed';
      case HistoryEventType.lambdaFunctionSucceeded:
        return 'LambdaFunctionSucceeded';
      case HistoryEventType.lambdaFunctionTimedOut:
        return 'LambdaFunctionTimedOut';
      case HistoryEventType.mapIterationAborted:
        return 'MapIterationAborted';
      case HistoryEventType.mapIterationFailed:
        return 'MapIterationFailed';
      case HistoryEventType.mapIterationStarted:
        return 'MapIterationStarted';
      case HistoryEventType.mapIterationSucceeded:
        return 'MapIterationSucceeded';
      case HistoryEventType.mapStateAborted:
        return 'MapStateAborted';
      case HistoryEventType.mapStateEntered:
        return 'MapStateEntered';
      case HistoryEventType.mapStateExited:
        return 'MapStateExited';
      case HistoryEventType.mapStateFailed:
        return 'MapStateFailed';
      case HistoryEventType.mapStateStarted:
        return 'MapStateStarted';
      case HistoryEventType.mapStateSucceeded:
        return 'MapStateSucceeded';
      case HistoryEventType.parallelStateAborted:
        return 'ParallelStateAborted';
      case HistoryEventType.parallelStateEntered:
        return 'ParallelStateEntered';
      case HistoryEventType.parallelStateExited:
        return 'ParallelStateExited';
      case HistoryEventType.parallelStateFailed:
        return 'ParallelStateFailed';
      case HistoryEventType.parallelStateStarted:
        return 'ParallelStateStarted';
      case HistoryEventType.parallelStateSucceeded:
        return 'ParallelStateSucceeded';
      case HistoryEventType.passStateEntered:
        return 'PassStateEntered';
      case HistoryEventType.passStateExited:
        return 'PassStateExited';
      case HistoryEventType.succeedStateEntered:
        return 'SucceedStateEntered';
      case HistoryEventType.succeedStateExited:
        return 'SucceedStateExited';
      case HistoryEventType.taskFailed:
        return 'TaskFailed';
      case HistoryEventType.taskScheduled:
        return 'TaskScheduled';
      case HistoryEventType.taskStarted:
        return 'TaskStarted';
      case HistoryEventType.taskStartFailed:
        return 'TaskStartFailed';
      case HistoryEventType.taskStateAborted:
        return 'TaskStateAborted';
      case HistoryEventType.taskStateEntered:
        return 'TaskStateEntered';
      case HistoryEventType.taskStateExited:
        return 'TaskStateExited';
      case HistoryEventType.taskSubmitFailed:
        return 'TaskSubmitFailed';
      case HistoryEventType.taskSubmitted:
        return 'TaskSubmitted';
      case HistoryEventType.taskSucceeded:
        return 'TaskSucceeded';
      case HistoryEventType.taskTimedOut:
        return 'TaskTimedOut';
      case HistoryEventType.waitStateAborted:
        return 'WaitStateAborted';
      case HistoryEventType.waitStateEntered:
        return 'WaitStateEntered';
      case HistoryEventType.waitStateExited:
        return 'WaitStateExited';
      case HistoryEventType.mapRunAborted:
        return 'MapRunAborted';
      case HistoryEventType.mapRunFailed:
        return 'MapRunFailed';
      case HistoryEventType.mapRunStarted:
        return 'MapRunStarted';
      case HistoryEventType.mapRunSucceeded:
        return 'MapRunSucceeded';
    }
  }
}

extension HistoryEventTypeFromString on String {
  HistoryEventType toHistoryEventType() {
    switch (this) {
      case 'ActivityFailed':
        return HistoryEventType.activityFailed;
      case 'ActivityScheduled':
        return HistoryEventType.activityScheduled;
      case 'ActivityScheduleFailed':
        return HistoryEventType.activityScheduleFailed;
      case 'ActivityStarted':
        return HistoryEventType.activityStarted;
      case 'ActivitySucceeded':
        return HistoryEventType.activitySucceeded;
      case 'ActivityTimedOut':
        return HistoryEventType.activityTimedOut;
      case 'ChoiceStateEntered':
        return HistoryEventType.choiceStateEntered;
      case 'ChoiceStateExited':
        return HistoryEventType.choiceStateExited;
      case 'ExecutionAborted':
        return HistoryEventType.executionAborted;
      case 'ExecutionFailed':
        return HistoryEventType.executionFailed;
      case 'ExecutionStarted':
        return HistoryEventType.executionStarted;
      case 'ExecutionSucceeded':
        return HistoryEventType.executionSucceeded;
      case 'ExecutionTimedOut':
        return HistoryEventType.executionTimedOut;
      case 'FailStateEntered':
        return HistoryEventType.failStateEntered;
      case 'LambdaFunctionFailed':
        return HistoryEventType.lambdaFunctionFailed;
      case 'LambdaFunctionScheduled':
        return HistoryEventType.lambdaFunctionScheduled;
      case 'LambdaFunctionScheduleFailed':
        return HistoryEventType.lambdaFunctionScheduleFailed;
      case 'LambdaFunctionStarted':
        return HistoryEventType.lambdaFunctionStarted;
      case 'LambdaFunctionStartFailed':
        return HistoryEventType.lambdaFunctionStartFailed;
      case 'LambdaFunctionSucceeded':
        return HistoryEventType.lambdaFunctionSucceeded;
      case 'LambdaFunctionTimedOut':
        return HistoryEventType.lambdaFunctionTimedOut;
      case 'MapIterationAborted':
        return HistoryEventType.mapIterationAborted;
      case 'MapIterationFailed':
        return HistoryEventType.mapIterationFailed;
      case 'MapIterationStarted':
        return HistoryEventType.mapIterationStarted;
      case 'MapIterationSucceeded':
        return HistoryEventType.mapIterationSucceeded;
      case 'MapStateAborted':
        return HistoryEventType.mapStateAborted;
      case 'MapStateEntered':
        return HistoryEventType.mapStateEntered;
      case 'MapStateExited':
        return HistoryEventType.mapStateExited;
      case 'MapStateFailed':
        return HistoryEventType.mapStateFailed;
      case 'MapStateStarted':
        return HistoryEventType.mapStateStarted;
      case 'MapStateSucceeded':
        return HistoryEventType.mapStateSucceeded;
      case 'ParallelStateAborted':
        return HistoryEventType.parallelStateAborted;
      case 'ParallelStateEntered':
        return HistoryEventType.parallelStateEntered;
      case 'ParallelStateExited':
        return HistoryEventType.parallelStateExited;
      case 'ParallelStateFailed':
        return HistoryEventType.parallelStateFailed;
      case 'ParallelStateStarted':
        return HistoryEventType.parallelStateStarted;
      case 'ParallelStateSucceeded':
        return HistoryEventType.parallelStateSucceeded;
      case 'PassStateEntered':
        return HistoryEventType.passStateEntered;
      case 'PassStateExited':
        return HistoryEventType.passStateExited;
      case 'SucceedStateEntered':
        return HistoryEventType.succeedStateEntered;
      case 'SucceedStateExited':
        return HistoryEventType.succeedStateExited;
      case 'TaskFailed':
        return HistoryEventType.taskFailed;
      case 'TaskScheduled':
        return HistoryEventType.taskScheduled;
      case 'TaskStarted':
        return HistoryEventType.taskStarted;
      case 'TaskStartFailed':
        return HistoryEventType.taskStartFailed;
      case 'TaskStateAborted':
        return HistoryEventType.taskStateAborted;
      case 'TaskStateEntered':
        return HistoryEventType.taskStateEntered;
      case 'TaskStateExited':
        return HistoryEventType.taskStateExited;
      case 'TaskSubmitFailed':
        return HistoryEventType.taskSubmitFailed;
      case 'TaskSubmitted':
        return HistoryEventType.taskSubmitted;
      case 'TaskSucceeded':
        return HistoryEventType.taskSucceeded;
      case 'TaskTimedOut':
        return HistoryEventType.taskTimedOut;
      case 'WaitStateAborted':
        return HistoryEventType.waitStateAborted;
      case 'WaitStateEntered':
        return HistoryEventType.waitStateEntered;
      case 'WaitStateExited':
        return HistoryEventType.waitStateExited;
      case 'MapRunAborted':
        return HistoryEventType.mapRunAborted;
      case 'MapRunFailed':
        return HistoryEventType.mapRunFailed;
      case 'MapRunStarted':
        return HistoryEventType.mapRunStarted;
      case 'MapRunSucceeded':
        return HistoryEventType.mapRunSucceeded;
    }
    throw Exception('$this is not known in enum HistoryEventType');
  }
}

/// Contains details about a Lambda function that failed during an execution.
class LambdaFunctionFailedEventDetails {
  /// A more detailed explanation of the cause of the failure.
  final String? cause;

  /// The error code of the failure.
  final String? error;

  LambdaFunctionFailedEventDetails({
    this.cause,
    this.error,
  });

  factory LambdaFunctionFailedEventDetails.fromJson(Map<String, dynamic> json) {
    return LambdaFunctionFailedEventDetails(
      cause: json['cause'] as String?,
      error: json['error'] as String?,
    );
  }
}

/// Contains details about a failed Lambda function schedule event that occurred
/// during an execution.
class LambdaFunctionScheduleFailedEventDetails {
  /// A more detailed explanation of the cause of the failure.
  final String? cause;

  /// The error code of the failure.
  final String? error;

  LambdaFunctionScheduleFailedEventDetails({
    this.cause,
    this.error,
  });

  factory LambdaFunctionScheduleFailedEventDetails.fromJson(
      Map<String, dynamic> json) {
    return LambdaFunctionScheduleFailedEventDetails(
      cause: json['cause'] as String?,
      error: json['error'] as String?,
    );
  }
}

/// Contains details about a Lambda function scheduled during an execution.
class LambdaFunctionScheduledEventDetails {
  /// The Amazon Resource Name (ARN) of the scheduled Lambda function.
  final String resource;

  /// The JSON data input to the Lambda function. Length constraints apply to the
  /// payload size, and are expressed as bytes in UTF-8 encoding.
  final String? input;

  /// Contains details about input for an execution history event.
  final HistoryEventExecutionDataDetails? inputDetails;

  /// The credentials that Step Functions uses for the task.
  final TaskCredentials? taskCredentials;

  /// The maximum allowed duration of the Lambda function.
  final int? timeoutInSeconds;

  LambdaFunctionScheduledEventDetails({
    required this.resource,
    this.input,
    this.inputDetails,
    this.taskCredentials,
    this.timeoutInSeconds,
  });

  factory LambdaFunctionScheduledEventDetails.fromJson(
      Map<String, dynamic> json) {
    return LambdaFunctionScheduledEventDetails(
      resource: json['resource'] as String,
      input: json['input'] as String?,
      inputDetails: json['inputDetails'] != null
          ? HistoryEventExecutionDataDetails.fromJson(
              json['inputDetails'] as Map<String, dynamic>)
          : null,
      taskCredentials: json['taskCredentials'] != null
          ? TaskCredentials.fromJson(
              json['taskCredentials'] as Map<String, dynamic>)
          : null,
      timeoutInSeconds: json['timeoutInSeconds'] as int?,
    );
  }
}

/// Contains details about a lambda function that failed to start during an
/// execution.
class LambdaFunctionStartFailedEventDetails {
  /// A more detailed explanation of the cause of the failure.
  final String? cause;

  /// The error code of the failure.
  final String? error;

  LambdaFunctionStartFailedEventDetails({
    this.cause,
    this.error,
  });

  factory LambdaFunctionStartFailedEventDetails.fromJson(
      Map<String, dynamic> json) {
    return LambdaFunctionStartFailedEventDetails(
      cause: json['cause'] as String?,
      error: json['error'] as String?,
    );
  }
}

/// Contains details about a Lambda function that successfully terminated during
/// an execution.
class LambdaFunctionSucceededEventDetails {
  /// The JSON data output by the Lambda function. Length constraints apply to the
  /// payload size, and are expressed as bytes in UTF-8 encoding.
  final String? output;

  /// Contains details about the output of an execution history event.
  final HistoryEventExecutionDataDetails? outputDetails;

  LambdaFunctionSucceededEventDetails({
    this.output,
    this.outputDetails,
  });

  factory LambdaFunctionSucceededEventDetails.fromJson(
      Map<String, dynamic> json) {
    return LambdaFunctionSucceededEventDetails(
      output: json['output'] as String?,
      outputDetails: json['outputDetails'] != null
          ? HistoryEventExecutionDataDetails.fromJson(
              json['outputDetails'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// Contains details about a Lambda function timeout that occurred during an
/// execution.
class LambdaFunctionTimedOutEventDetails {
  /// A more detailed explanation of the cause of the timeout.
  final String? cause;

  /// The error code of the failure.
  final String? error;

  LambdaFunctionTimedOutEventDetails({
    this.cause,
    this.error,
  });

  factory LambdaFunctionTimedOutEventDetails.fromJson(
      Map<String, dynamic> json) {
    return LambdaFunctionTimedOutEventDetails(
      cause: json['cause'] as String?,
      error: json['error'] as String?,
    );
  }
}

class ListActivitiesOutput {
  /// The list of activities.
  final List<ActivityListItem> activities;

  /// If <code>nextToken</code> is returned, there are more results available. The
  /// value of <code>nextToken</code> is a unique pagination token for each page.
  /// Make the call again using the returned token to retrieve the next page. Keep
  /// all other arguments unchanged. Each pagination token expires after 24 hours.
  /// Using an expired pagination token will return an <i>HTTP 400
  /// InvalidToken</i> error.
  final String? nextToken;

  ListActivitiesOutput({
    required this.activities,
    this.nextToken,
  });

  factory ListActivitiesOutput.fromJson(Map<String, dynamic> json) {
    return ListActivitiesOutput(
      activities: (json['activities'] as List)
          .whereNotNull()
          .map((e) => ActivityListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }
}

class ListExecutionsOutput {
  /// The list of matching executions.
  final List<ExecutionListItem> executions;

  /// If <code>nextToken</code> is returned, there are more results available. The
  /// value of <code>nextToken</code> is a unique pagination token for each page.
  /// Make the call again using the returned token to retrieve the next page. Keep
  /// all other arguments unchanged. Each pagination token expires after 24 hours.
  /// Using an expired pagination token will return an <i>HTTP 400
  /// InvalidToken</i> error.
  final String? nextToken;

  ListExecutionsOutput({
    required this.executions,
    this.nextToken,
  });

  factory ListExecutionsOutput.fromJson(Map<String, dynamic> json) {
    return ListExecutionsOutput(
      executions: (json['executions'] as List)
          .whereNotNull()
          .map((e) => ExecutionListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }
}

class ListMapRunsOutput {
  /// An array that lists information related to a Map Run, such as the Amazon
  /// Resource Name (ARN) of the Map Run and the ARN of the state machine that
  /// started the Map Run.
  final List<MapRunListItem> mapRuns;

  /// If <code>nextToken</code> is returned, there are more results available. The
  /// value of <code>nextToken</code> is a unique pagination token for each page.
  /// Make the call again using the returned token to retrieve the next page. Keep
  /// all other arguments unchanged. Each pagination token expires after 24 hours.
  /// Using an expired pagination token will return an <i>HTTP 400
  /// InvalidToken</i> error.
  final String? nextToken;

  ListMapRunsOutput({
    required this.mapRuns,
    this.nextToken,
  });

  factory ListMapRunsOutput.fromJson(Map<String, dynamic> json) {
    return ListMapRunsOutput(
      mapRuns: (json['mapRuns'] as List)
          .whereNotNull()
          .map((e) => MapRunListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }
}

class ListStateMachinesOutput {
  final List<StateMachineListItem> stateMachines;

  /// If <code>nextToken</code> is returned, there are more results available. The
  /// value of <code>nextToken</code> is a unique pagination token for each page.
  /// Make the call again using the returned token to retrieve the next page. Keep
  /// all other arguments unchanged. Each pagination token expires after 24 hours.
  /// Using an expired pagination token will return an <i>HTTP 400
  /// InvalidToken</i> error.
  final String? nextToken;

  ListStateMachinesOutput({
    required this.stateMachines,
    this.nextToken,
  });

  factory ListStateMachinesOutput.fromJson(Map<String, dynamic> json) {
    return ListStateMachinesOutput(
      stateMachines: (json['stateMachines'] as List)
          .whereNotNull()
          .map((e) => StateMachineListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }
}

class ListTagsForResourceOutput {
  /// An array of tags associated with the resource.
  final List<Tag>? tags;

  ListTagsForResourceOutput({
    this.tags,
  });

  factory ListTagsForResourceOutput.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceOutput(
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// <p/>
class LogDestination {
  /// An object describing a CloudWatch log group. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-logs-loggroup.html">AWS::Logs::LogGroup</a>
  /// in the CloudFormation User Guide.
  final CloudWatchLogsLogGroup? cloudWatchLogsLogGroup;

  LogDestination({
    this.cloudWatchLogsLogGroup,
  });

  factory LogDestination.fromJson(Map<String, dynamic> json) {
    return LogDestination(
      cloudWatchLogsLogGroup: json['cloudWatchLogsLogGroup'] != null
          ? CloudWatchLogsLogGroup.fromJson(
              json['cloudWatchLogsLogGroup'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final cloudWatchLogsLogGroup = this.cloudWatchLogsLogGroup;
    return {
      if (cloudWatchLogsLogGroup != null)
        'cloudWatchLogsLogGroup': cloudWatchLogsLogGroup,
    };
  }
}

enum LogLevel {
  all,
  error,
  fatal,
  off,
}

extension LogLevelValueExtension on LogLevel {
  String toValue() {
    switch (this) {
      case LogLevel.all:
        return 'ALL';
      case LogLevel.error:
        return 'ERROR';
      case LogLevel.fatal:
        return 'FATAL';
      case LogLevel.off:
        return 'OFF';
    }
  }
}

extension LogLevelFromString on String {
  LogLevel toLogLevel() {
    switch (this) {
      case 'ALL':
        return LogLevel.all;
      case 'ERROR':
        return LogLevel.error;
      case 'FATAL':
        return LogLevel.fatal;
      case 'OFF':
        return LogLevel.off;
    }
    throw Exception('$this is not known in enum LogLevel');
  }
}

/// The <code>LoggingConfiguration</code> data type is used to set CloudWatch
/// Logs options.
class LoggingConfiguration {
  /// An array of objects that describes where your execution history events will
  /// be logged. Limited to size 1. Required, if your log level is not set to
  /// <code>OFF</code>.
  final List<LogDestination>? destinations;

  /// Determines whether execution data is included in your log. When set to
  /// <code>false</code>, data is excluded.
  final bool? includeExecutionData;

  /// Defines which category of execution history events are logged.
  final LogLevel? level;

  LoggingConfiguration({
    this.destinations,
    this.includeExecutionData,
    this.level,
  });

  factory LoggingConfiguration.fromJson(Map<String, dynamic> json) {
    return LoggingConfiguration(
      destinations: (json['destinations'] as List?)
          ?.whereNotNull()
          .map((e) => LogDestination.fromJson(e as Map<String, dynamic>))
          .toList(),
      includeExecutionData: json['includeExecutionData'] as bool?,
      level: (json['level'] as String?)?.toLogLevel(),
    );
  }

  Map<String, dynamic> toJson() {
    final destinations = this.destinations;
    final includeExecutionData = this.includeExecutionData;
    final level = this.level;
    return {
      if (destinations != null) 'destinations': destinations,
      if (includeExecutionData != null)
        'includeExecutionData': includeExecutionData,
      if (level != null) 'level': level.toValue(),
    };
  }
}

/// Contains details about an iteration of a Map state.
class MapIterationEventDetails {
  /// The index of the array belonging to the Map state iteration.
  final int? index;

  /// The name of the iteration’s parent Map state.
  final String? name;

  MapIterationEventDetails({
    this.index,
    this.name,
  });

  factory MapIterationEventDetails.fromJson(Map<String, dynamic> json) {
    return MapIterationEventDetails(
      index: json['index'] as int?,
      name: json['name'] as String?,
    );
  }
}

/// Contains details about all of the child workflow executions started by a Map
/// Run.
class MapRunExecutionCounts {
  /// The total number of child workflow executions that were started by a Map Run
  /// and were running, but were either stopped by the user or by Step Functions
  /// because the Map Run failed.
  final int aborted;

  /// The total number of child workflow executions that were started by a Map
  /// Run, but have failed.
  final int failed;

  /// The total number of child workflow executions that were started by a Map
  /// Run, but haven't started executing yet.
  final int pending;

  /// Returns the count of child workflow executions whose results were written by
  /// <code>ResultWriter</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/step-functions/latest/dg/input-output-resultwriter.html">ResultWriter</a>
  /// in the <i>Step Functions Developer Guide</i>.
  final int resultsWritten;

  /// The total number of child workflow executions that were started by a Map Run
  /// and are currently in-progress.
  final int running;

  /// The total number of child workflow executions that were started by a Map Run
  /// and have completed successfully.
  final int succeeded;

  /// The total number of child workflow executions that were started by a Map Run
  /// and have timed out.
  final int timedOut;

  /// The total number of child workflow executions that were started by a Map
  /// Run.
  final int total;

  MapRunExecutionCounts({
    required this.aborted,
    required this.failed,
    required this.pending,
    required this.resultsWritten,
    required this.running,
    required this.succeeded,
    required this.timedOut,
    required this.total,
  });

  factory MapRunExecutionCounts.fromJson(Map<String, dynamic> json) {
    return MapRunExecutionCounts(
      aborted: json['aborted'] as int,
      failed: json['failed'] as int,
      pending: json['pending'] as int,
      resultsWritten: json['resultsWritten'] as int,
      running: json['running'] as int,
      succeeded: json['succeeded'] as int,
      timedOut: json['timedOut'] as int,
      total: json['total'] as int,
    );
  }
}

/// Contains details about a Map Run failure event that occurred during a state
/// machine execution.
class MapRunFailedEventDetails {
  /// A more detailed explanation of the cause of the failure.
  final String? cause;

  /// The error code of the Map Run failure.
  final String? error;

  MapRunFailedEventDetails({
    this.cause,
    this.error,
  });

  factory MapRunFailedEventDetails.fromJson(Map<String, dynamic> json) {
    return MapRunFailedEventDetails(
      cause: json['cause'] as String?,
      error: json['error'] as String?,
    );
  }
}

/// Contains details about items that were processed in all of the child
/// workflow executions that were started by a Map Run.
class MapRunItemCounts {
  /// The total number of items processed in child workflow executions that were
  /// either stopped by the user or by Step Functions, because the Map Run failed.
  final int aborted;

  /// The total number of items processed in child workflow executions that have
  /// failed.
  final int failed;

  /// The total number of items to process in child workflow executions that
  /// haven't started running yet.
  final int pending;

  /// Returns the count of items whose results were written by
  /// <code>ResultWriter</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/step-functions/latest/dg/input-output-resultwriter.html">ResultWriter</a>
  /// in the <i>Step Functions Developer Guide</i>.
  final int resultsWritten;

  /// The total number of items being processed in child workflow executions that
  /// are currently in-progress.
  final int running;

  /// The total number of items processed in child workflow executions that have
  /// completed successfully.
  final int succeeded;

  /// The total number of items processed in child workflow executions that have
  /// timed out.
  final int timedOut;

  /// The total number of items processed in all the child workflow executions
  /// started by a Map Run.
  final int total;

  MapRunItemCounts({
    required this.aborted,
    required this.failed,
    required this.pending,
    required this.resultsWritten,
    required this.running,
    required this.succeeded,
    required this.timedOut,
    required this.total,
  });

  factory MapRunItemCounts.fromJson(Map<String, dynamic> json) {
    return MapRunItemCounts(
      aborted: json['aborted'] as int,
      failed: json['failed'] as int,
      pending: json['pending'] as int,
      resultsWritten: json['resultsWritten'] as int,
      running: json['running'] as int,
      succeeded: json['succeeded'] as int,
      timedOut: json['timedOut'] as int,
      total: json['total'] as int,
    );
  }
}

/// Contains details about a specific Map Run.
class MapRunListItem {
  /// The <code>executionArn</code> of the execution from which the Map Run was
  /// started.
  final String executionArn;

  /// The Amazon Resource Name (ARN) of the Map Run.
  final String mapRunArn;

  /// The date on which the Map Run started.
  final DateTime startDate;

  /// The Amazon Resource Name (ARN) of the executed state machine.
  final String stateMachineArn;

  /// The date on which the Map Run stopped.
  final DateTime? stopDate;

  MapRunListItem({
    required this.executionArn,
    required this.mapRunArn,
    required this.startDate,
    required this.stateMachineArn,
    this.stopDate,
  });

  factory MapRunListItem.fromJson(Map<String, dynamic> json) {
    return MapRunListItem(
      executionArn: json['executionArn'] as String,
      mapRunArn: json['mapRunArn'] as String,
      startDate: nonNullableTimeStampFromJson(json['startDate'] as Object),
      stateMachineArn: json['stateMachineArn'] as String,
      stopDate: timeStampFromJson(json['stopDate']),
    );
  }
}

/// Contains details about a Map Run that was started during a state machine
/// execution.
class MapRunStartedEventDetails {
  /// The Amazon Resource Name (ARN) of a Map Run that was started.
  final String? mapRunArn;

  MapRunStartedEventDetails({
    this.mapRunArn,
  });

  factory MapRunStartedEventDetails.fromJson(Map<String, dynamic> json) {
    return MapRunStartedEventDetails(
      mapRunArn: json['mapRunArn'] as String?,
    );
  }
}

enum MapRunStatus {
  running,
  succeeded,
  failed,
  aborted,
}

extension MapRunStatusValueExtension on MapRunStatus {
  String toValue() {
    switch (this) {
      case MapRunStatus.running:
        return 'RUNNING';
      case MapRunStatus.succeeded:
        return 'SUCCEEDED';
      case MapRunStatus.failed:
        return 'FAILED';
      case MapRunStatus.aborted:
        return 'ABORTED';
    }
  }
}

extension MapRunStatusFromString on String {
  MapRunStatus toMapRunStatus() {
    switch (this) {
      case 'RUNNING':
        return MapRunStatus.running;
      case 'SUCCEEDED':
        return MapRunStatus.succeeded;
      case 'FAILED':
        return MapRunStatus.failed;
      case 'ABORTED':
        return MapRunStatus.aborted;
    }
    throw Exception('$this is not known in enum MapRunStatus');
  }
}

/// Details about a Map state that was started.
class MapStateStartedEventDetails {
  /// The size of the array for Map state iterations.
  final int? length;

  MapStateStartedEventDetails({
    this.length,
  });

  factory MapStateStartedEventDetails.fromJson(Map<String, dynamic> json) {
    return MapStateStartedEventDetails(
      length: json['length'] as int?,
    );
  }
}

class SendTaskFailureOutput {
  SendTaskFailureOutput();

  factory SendTaskFailureOutput.fromJson(Map<String, dynamic> _) {
    return SendTaskFailureOutput();
  }
}

class SendTaskHeartbeatOutput {
  SendTaskHeartbeatOutput();

  factory SendTaskHeartbeatOutput.fromJson(Map<String, dynamic> _) {
    return SendTaskHeartbeatOutput();
  }
}

class SendTaskSuccessOutput {
  SendTaskSuccessOutput();

  factory SendTaskSuccessOutput.fromJson(Map<String, dynamic> _) {
    return SendTaskSuccessOutput();
  }
}

class StartExecutionOutput {
  /// The Amazon Resource Name (ARN) that identifies the execution.
  final String executionArn;

  /// The date the execution is started.
  final DateTime startDate;

  StartExecutionOutput({
    required this.executionArn,
    required this.startDate,
  });

  factory StartExecutionOutput.fromJson(Map<String, dynamic> json) {
    return StartExecutionOutput(
      executionArn: json['executionArn'] as String,
      startDate: nonNullableTimeStampFromJson(json['startDate'] as Object),
    );
  }
}

class StartSyncExecutionOutput {
  /// The Amazon Resource Name (ARN) that identifies the execution.
  final String executionArn;

  /// The date the execution is started.
  final DateTime startDate;

  /// The current status of the execution.
  final SyncExecutionStatus status;

  /// If the execution has already ended, the date the execution stopped.
  final DateTime stopDate;

  /// An object that describes workflow billing details, including billed duration
  /// and memory use.
  final BillingDetails? billingDetails;

  /// A more detailed explanation of the cause of the failure.
  final String? cause;

  /// The error code of the failure.
  final String? error;

  /// The string that contains the JSON input data of the execution. Length
  /// constraints apply to the payload size, and are expressed as bytes in UTF-8
  /// encoding.
  final String? input;
  final CloudWatchEventsExecutionDataDetails? inputDetails;

  /// The name of the execution.
  final String? name;

  /// The JSON output data of the execution. Length constraints apply to the
  /// payload size, and are expressed as bytes in UTF-8 encoding.
  /// <note>
  /// This field is set only if the execution succeeds. If the execution fails,
  /// this field is null.
  /// </note>
  final String? output;
  final CloudWatchEventsExecutionDataDetails? outputDetails;

  /// The Amazon Resource Name (ARN) that identifies the state machine.
  final String? stateMachineArn;

  /// The X-Ray trace header that was passed to the execution.
  final String? traceHeader;

  StartSyncExecutionOutput({
    required this.executionArn,
    required this.startDate,
    required this.status,
    required this.stopDate,
    this.billingDetails,
    this.cause,
    this.error,
    this.input,
    this.inputDetails,
    this.name,
    this.output,
    this.outputDetails,
    this.stateMachineArn,
    this.traceHeader,
  });

  factory StartSyncExecutionOutput.fromJson(Map<String, dynamic> json) {
    return StartSyncExecutionOutput(
      executionArn: json['executionArn'] as String,
      startDate: nonNullableTimeStampFromJson(json['startDate'] as Object),
      status: (json['status'] as String).toSyncExecutionStatus(),
      stopDate: nonNullableTimeStampFromJson(json['stopDate'] as Object),
      billingDetails: json['billingDetails'] != null
          ? BillingDetails.fromJson(
              json['billingDetails'] as Map<String, dynamic>)
          : null,
      cause: json['cause'] as String?,
      error: json['error'] as String?,
      input: json['input'] as String?,
      inputDetails: json['inputDetails'] != null
          ? CloudWatchEventsExecutionDataDetails.fromJson(
              json['inputDetails'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      output: json['output'] as String?,
      outputDetails: json['outputDetails'] != null
          ? CloudWatchEventsExecutionDataDetails.fromJson(
              json['outputDetails'] as Map<String, dynamic>)
          : null,
      stateMachineArn: json['stateMachineArn'] as String?,
      traceHeader: json['traceHeader'] as String?,
    );
  }
}

/// Contains details about a state entered during an execution.
class StateEnteredEventDetails {
  /// The name of the state.
  final String name;

  /// The string that contains the JSON input data for the state. Length
  /// constraints apply to the payload size, and are expressed as bytes in UTF-8
  /// encoding.
  final String? input;

  /// Contains details about the input for an execution history event.
  final HistoryEventExecutionDataDetails? inputDetails;

  StateEnteredEventDetails({
    required this.name,
    this.input,
    this.inputDetails,
  });

  factory StateEnteredEventDetails.fromJson(Map<String, dynamic> json) {
    return StateEnteredEventDetails(
      name: json['name'] as String,
      input: json['input'] as String?,
      inputDetails: json['inputDetails'] != null
          ? HistoryEventExecutionDataDetails.fromJson(
              json['inputDetails'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// Contains details about an exit from a state during an execution.
class StateExitedEventDetails {
  /// The name of the state.
  ///
  /// A name must <i>not</i> contain:
  ///
  /// <ul>
  /// <li>
  /// white space
  /// </li>
  /// <li>
  /// brackets <code>&lt; &gt; { } [ ]</code>
  /// </li>
  /// <li>
  /// wildcard characters <code>? *</code>
  /// </li>
  /// <li>
  /// special characters <code>" # % \ ^ | ~ ` $ &amp; , ; : /</code>
  /// </li>
  /// <li>
  /// control characters (<code>U+0000-001F</code>, <code>U+007F-009F</code>)
  /// </li>
  /// </ul>
  /// To enable logging with CloudWatch Logs, the name should only contain 0-9,
  /// A-Z, a-z, - and _.
  final String name;

  /// The JSON output data of the state. Length constraints apply to the payload
  /// size, and are expressed as bytes in UTF-8 encoding.
  final String? output;

  /// Contains details about the output of an execution history event.
  final HistoryEventExecutionDataDetails? outputDetails;

  StateExitedEventDetails({
    required this.name,
    this.output,
    this.outputDetails,
  });

  factory StateExitedEventDetails.fromJson(Map<String, dynamic> json) {
    return StateExitedEventDetails(
      name: json['name'] as String,
      output: json['output'] as String?,
      outputDetails: json['outputDetails'] != null
          ? HistoryEventExecutionDataDetails.fromJson(
              json['outputDetails'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// Contains details about the state machine.
class StateMachineListItem {
  /// The date the state machine is created.
  final DateTime creationDate;

  /// The name of the state machine.
  ///
  /// A name must <i>not</i> contain:
  ///
  /// <ul>
  /// <li>
  /// white space
  /// </li>
  /// <li>
  /// brackets <code>&lt; &gt; { } [ ]</code>
  /// </li>
  /// <li>
  /// wildcard characters <code>? *</code>
  /// </li>
  /// <li>
  /// special characters <code>" # % \ ^ | ~ ` $ &amp; , ; : /</code>
  /// </li>
  /// <li>
  /// control characters (<code>U+0000-001F</code>, <code>U+007F-009F</code>)
  /// </li>
  /// </ul>
  /// To enable logging with CloudWatch Logs, the name should only contain 0-9,
  /// A-Z, a-z, - and _.
  final String name;

  /// The Amazon Resource Name (ARN) that identifies the state machine.
  final String stateMachineArn;

  /// <p/>
  final StateMachineType type;

  StateMachineListItem({
    required this.creationDate,
    required this.name,
    required this.stateMachineArn,
    required this.type,
  });

  factory StateMachineListItem.fromJson(Map<String, dynamic> json) {
    return StateMachineListItem(
      creationDate:
          nonNullableTimeStampFromJson(json['creationDate'] as Object),
      name: json['name'] as String,
      stateMachineArn: json['stateMachineArn'] as String,
      type: (json['type'] as String).toStateMachineType(),
    );
  }
}

enum StateMachineStatus {
  active,
  deleting,
}

extension StateMachineStatusValueExtension on StateMachineStatus {
  String toValue() {
    switch (this) {
      case StateMachineStatus.active:
        return 'ACTIVE';
      case StateMachineStatus.deleting:
        return 'DELETING';
    }
  }
}

extension StateMachineStatusFromString on String {
  StateMachineStatus toStateMachineStatus() {
    switch (this) {
      case 'ACTIVE':
        return StateMachineStatus.active;
      case 'DELETING':
        return StateMachineStatus.deleting;
    }
    throw Exception('$this is not known in enum StateMachineStatus');
  }
}

enum StateMachineType {
  standard,
  express,
}

extension StateMachineTypeValueExtension on StateMachineType {
  String toValue() {
    switch (this) {
      case StateMachineType.standard:
        return 'STANDARD';
      case StateMachineType.express:
        return 'EXPRESS';
    }
  }
}

extension StateMachineTypeFromString on String {
  StateMachineType toStateMachineType() {
    switch (this) {
      case 'STANDARD':
        return StateMachineType.standard;
      case 'EXPRESS':
        return StateMachineType.express;
    }
    throw Exception('$this is not known in enum StateMachineType');
  }
}

class StopExecutionOutput {
  /// The date the execution is stopped.
  final DateTime stopDate;

  StopExecutionOutput({
    required this.stopDate,
  });

  factory StopExecutionOutput.fromJson(Map<String, dynamic> json) {
    return StopExecutionOutput(
      stopDate: nonNullableTimeStampFromJson(json['stopDate'] as Object),
    );
  }
}

enum SyncExecutionStatus {
  succeeded,
  failed,
  timedOut,
}

extension SyncExecutionStatusValueExtension on SyncExecutionStatus {
  String toValue() {
    switch (this) {
      case SyncExecutionStatus.succeeded:
        return 'SUCCEEDED';
      case SyncExecutionStatus.failed:
        return 'FAILED';
      case SyncExecutionStatus.timedOut:
        return 'TIMED_OUT';
    }
  }
}

extension SyncExecutionStatusFromString on String {
  SyncExecutionStatus toSyncExecutionStatus() {
    switch (this) {
      case 'SUCCEEDED':
        return SyncExecutionStatus.succeeded;
      case 'FAILED':
        return SyncExecutionStatus.failed;
      case 'TIMED_OUT':
        return SyncExecutionStatus.timedOut;
    }
    throw Exception('$this is not known in enum SyncExecutionStatus');
  }
}

/// Tags are key-value pairs that can be associated with Step Functions state
/// machines and activities.
///
/// An array of key-value pairs. For more information, see <a
/// href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html">Using
/// Cost Allocation Tags</a> in the <i>Amazon Web Services Billing and Cost
/// Management User Guide</i>, and <a
/// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_iam-tags.html">Controlling
/// Access Using IAM Tags</a>.
///
/// Tags may only contain Unicode letters, digits, white space, or these
/// symbols: <code>_ . : / = + - @</code>.
class Tag {
  /// The key of a tag.
  final String? key;

  /// The value of a tag.
  final String? value;

  Tag({
    this.key,
    this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
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

class TagResourceOutput {
  TagResourceOutput();

  factory TagResourceOutput.fromJson(Map<String, dynamic> _) {
    return TagResourceOutput();
  }
}

/// Contains details about the credentials that Step Functions uses for a task.
class TaskCredentials {
  /// The ARN of an IAM role that Step Functions assumes for the task. The role
  /// can allow cross-account access to resources.
  final String? roleArn;

  TaskCredentials({
    this.roleArn,
  });

  factory TaskCredentials.fromJson(Map<String, dynamic> json) {
    return TaskCredentials(
      roleArn: json['roleArn'] as String?,
    );
  }
}

/// Contains details about a task failure event.
class TaskFailedEventDetails {
  /// The action of the resource called by a task state.
  final String resource;

  /// The service name of the resource in a task state.
  final String resourceType;

  /// A more detailed explanation of the cause of the failure.
  final String? cause;

  /// The error code of the failure.
  final String? error;

  TaskFailedEventDetails({
    required this.resource,
    required this.resourceType,
    this.cause,
    this.error,
  });

  factory TaskFailedEventDetails.fromJson(Map<String, dynamic> json) {
    return TaskFailedEventDetails(
      resource: json['resource'] as String,
      resourceType: json['resourceType'] as String,
      cause: json['cause'] as String?,
      error: json['error'] as String?,
    );
  }
}

/// Contains details about a task scheduled during an execution.
class TaskScheduledEventDetails {
  /// The JSON data passed to the resource referenced in a task state. Length
  /// constraints apply to the payload size, and are expressed as bytes in UTF-8
  /// encoding.
  final String parameters;

  /// The region of the scheduled task
  final String region;

  /// The action of the resource called by a task state.
  final String resource;

  /// The service name of the resource in a task state.
  final String resourceType;

  /// The maximum allowed duration between two heartbeats for the task.
  final int? heartbeatInSeconds;

  /// The credentials that Step Functions uses for the task.
  final TaskCredentials? taskCredentials;

  /// The maximum allowed duration of the task.
  final int? timeoutInSeconds;

  TaskScheduledEventDetails({
    required this.parameters,
    required this.region,
    required this.resource,
    required this.resourceType,
    this.heartbeatInSeconds,
    this.taskCredentials,
    this.timeoutInSeconds,
  });

  factory TaskScheduledEventDetails.fromJson(Map<String, dynamic> json) {
    return TaskScheduledEventDetails(
      parameters: json['parameters'] as String,
      region: json['region'] as String,
      resource: json['resource'] as String,
      resourceType: json['resourceType'] as String,
      heartbeatInSeconds: json['heartbeatInSeconds'] as int?,
      taskCredentials: json['taskCredentials'] != null
          ? TaskCredentials.fromJson(
              json['taskCredentials'] as Map<String, dynamic>)
          : null,
      timeoutInSeconds: json['timeoutInSeconds'] as int?,
    );
  }
}

/// Contains details about a task that failed to start during an execution.
class TaskStartFailedEventDetails {
  /// The action of the resource called by a task state.
  final String resource;

  /// The service name of the resource in a task state.
  final String resourceType;

  /// A more detailed explanation of the cause of the failure.
  final String? cause;

  /// The error code of the failure.
  final String? error;

  TaskStartFailedEventDetails({
    required this.resource,
    required this.resourceType,
    this.cause,
    this.error,
  });

  factory TaskStartFailedEventDetails.fromJson(Map<String, dynamic> json) {
    return TaskStartFailedEventDetails(
      resource: json['resource'] as String,
      resourceType: json['resourceType'] as String,
      cause: json['cause'] as String?,
      error: json['error'] as String?,
    );
  }
}

/// Contains details about the start of a task during an execution.
class TaskStartedEventDetails {
  /// The action of the resource called by a task state.
  final String resource;

  /// The service name of the resource in a task state.
  final String resourceType;

  TaskStartedEventDetails({
    required this.resource,
    required this.resourceType,
  });

  factory TaskStartedEventDetails.fromJson(Map<String, dynamic> json) {
    return TaskStartedEventDetails(
      resource: json['resource'] as String,
      resourceType: json['resourceType'] as String,
    );
  }
}

/// Contains details about a task that failed to submit during an execution.
class TaskSubmitFailedEventDetails {
  /// The action of the resource called by a task state.
  final String resource;

  /// The service name of the resource in a task state.
  final String resourceType;

  /// A more detailed explanation of the cause of the failure.
  final String? cause;

  /// The error code of the failure.
  final String? error;

  TaskSubmitFailedEventDetails({
    required this.resource,
    required this.resourceType,
    this.cause,
    this.error,
  });

  factory TaskSubmitFailedEventDetails.fromJson(Map<String, dynamic> json) {
    return TaskSubmitFailedEventDetails(
      resource: json['resource'] as String,
      resourceType: json['resourceType'] as String,
      cause: json['cause'] as String?,
      error: json['error'] as String?,
    );
  }
}

/// Contains details about a task submitted to a resource .
class TaskSubmittedEventDetails {
  /// The action of the resource called by a task state.
  final String resource;

  /// The service name of the resource in a task state.
  final String resourceType;

  /// The response from a resource when a task has started. Length constraints
  /// apply to the payload size, and are expressed as bytes in UTF-8 encoding.
  final String? output;

  /// Contains details about the output of an execution history event.
  final HistoryEventExecutionDataDetails? outputDetails;

  TaskSubmittedEventDetails({
    required this.resource,
    required this.resourceType,
    this.output,
    this.outputDetails,
  });

  factory TaskSubmittedEventDetails.fromJson(Map<String, dynamic> json) {
    return TaskSubmittedEventDetails(
      resource: json['resource'] as String,
      resourceType: json['resourceType'] as String,
      output: json['output'] as String?,
      outputDetails: json['outputDetails'] != null
          ? HistoryEventExecutionDataDetails.fromJson(
              json['outputDetails'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// Contains details about the successful completion of a task state.
class TaskSucceededEventDetails {
  /// The action of the resource called by a task state.
  final String resource;

  /// The service name of the resource in a task state.
  final String resourceType;

  /// The full JSON response from a resource when a task has succeeded. This
  /// response becomes the output of the related task. Length constraints apply to
  /// the payload size, and are expressed as bytes in UTF-8 encoding.
  final String? output;

  /// Contains details about the output of an execution history event.
  final HistoryEventExecutionDataDetails? outputDetails;

  TaskSucceededEventDetails({
    required this.resource,
    required this.resourceType,
    this.output,
    this.outputDetails,
  });

  factory TaskSucceededEventDetails.fromJson(Map<String, dynamic> json) {
    return TaskSucceededEventDetails(
      resource: json['resource'] as String,
      resourceType: json['resourceType'] as String,
      output: json['output'] as String?,
      outputDetails: json['outputDetails'] != null
          ? HistoryEventExecutionDataDetails.fromJson(
              json['outputDetails'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// Contains details about a resource timeout that occurred during an execution.
class TaskTimedOutEventDetails {
  /// The action of the resource called by a task state.
  final String resource;

  /// The service name of the resource in a task state.
  final String resourceType;

  /// A more detailed explanation of the cause of the failure.
  final String? cause;

  /// The error code of the failure.
  final String? error;

  TaskTimedOutEventDetails({
    required this.resource,
    required this.resourceType,
    this.cause,
    this.error,
  });

  factory TaskTimedOutEventDetails.fromJson(Map<String, dynamic> json) {
    return TaskTimedOutEventDetails(
      resource: json['resource'] as String,
      resourceType: json['resourceType'] as String,
      cause: json['cause'] as String?,
      error: json['error'] as String?,
    );
  }
}

/// Selects whether or not the state machine's X-Ray tracing is enabled. Default
/// is <code>false</code>
class TracingConfiguration {
  /// When set to <code>true</code>, X-Ray tracing is enabled.
  final bool? enabled;

  TracingConfiguration({
    this.enabled,
  });

  factory TracingConfiguration.fromJson(Map<String, dynamic> json) {
    return TracingConfiguration(
      enabled: json['enabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    return {
      if (enabled != null) 'enabled': enabled,
    };
  }
}

class UntagResourceOutput {
  UntagResourceOutput();

  factory UntagResourceOutput.fromJson(Map<String, dynamic> _) {
    return UntagResourceOutput();
  }
}

class UpdateMapRunOutput {
  UpdateMapRunOutput();

  factory UpdateMapRunOutput.fromJson(Map<String, dynamic> _) {
    return UpdateMapRunOutput();
  }
}

class UpdateStateMachineOutput {
  /// The date and time the state machine was updated.
  final DateTime updateDate;

  UpdateStateMachineOutput({
    required this.updateDate,
  });

  factory UpdateStateMachineOutput.fromJson(Map<String, dynamic> json) {
    return UpdateStateMachineOutput(
      updateDate: nonNullableTimeStampFromJson(json['updateDate'] as Object),
    );
  }
}

class ActivityDoesNotExist extends _s.GenericAwsException {
  ActivityDoesNotExist({String? type, String? message})
      : super(type: type, code: 'ActivityDoesNotExist', message: message);
}

class ActivityLimitExceeded extends _s.GenericAwsException {
  ActivityLimitExceeded({String? type, String? message})
      : super(type: type, code: 'ActivityLimitExceeded', message: message);
}

class ActivityWorkerLimitExceeded extends _s.GenericAwsException {
  ActivityWorkerLimitExceeded({String? type, String? message})
      : super(
            type: type, code: 'ActivityWorkerLimitExceeded', message: message);
}

class ExecutionAlreadyExists extends _s.GenericAwsException {
  ExecutionAlreadyExists({String? type, String? message})
      : super(type: type, code: 'ExecutionAlreadyExists', message: message);
}

class ExecutionDoesNotExist extends _s.GenericAwsException {
  ExecutionDoesNotExist({String? type, String? message})
      : super(type: type, code: 'ExecutionDoesNotExist', message: message);
}

class ExecutionLimitExceeded extends _s.GenericAwsException {
  ExecutionLimitExceeded({String? type, String? message})
      : super(type: type, code: 'ExecutionLimitExceeded', message: message);
}

class InvalidArn extends _s.GenericAwsException {
  InvalidArn({String? type, String? message})
      : super(type: type, code: 'InvalidArn', message: message);
}

class InvalidDefinition extends _s.GenericAwsException {
  InvalidDefinition({String? type, String? message})
      : super(type: type, code: 'InvalidDefinition', message: message);
}

class InvalidExecutionInput extends _s.GenericAwsException {
  InvalidExecutionInput({String? type, String? message})
      : super(type: type, code: 'InvalidExecutionInput', message: message);
}

class InvalidLoggingConfiguration extends _s.GenericAwsException {
  InvalidLoggingConfiguration({String? type, String? message})
      : super(
            type: type, code: 'InvalidLoggingConfiguration', message: message);
}

class InvalidName extends _s.GenericAwsException {
  InvalidName({String? type, String? message})
      : super(type: type, code: 'InvalidName', message: message);
}

class InvalidOutput extends _s.GenericAwsException {
  InvalidOutput({String? type, String? message})
      : super(type: type, code: 'InvalidOutput', message: message);
}

class InvalidToken extends _s.GenericAwsException {
  InvalidToken({String? type, String? message})
      : super(type: type, code: 'InvalidToken', message: message);
}

class InvalidTracingConfiguration extends _s.GenericAwsException {
  InvalidTracingConfiguration({String? type, String? message})
      : super(
            type: type, code: 'InvalidTracingConfiguration', message: message);
}

class MissingRequiredParameter extends _s.GenericAwsException {
  MissingRequiredParameter({String? type, String? message})
      : super(type: type, code: 'MissingRequiredParameter', message: message);
}

class ResourceNotFound extends _s.GenericAwsException {
  ResourceNotFound({String? type, String? message})
      : super(type: type, code: 'ResourceNotFound', message: message);
}

class StateMachineAlreadyExists extends _s.GenericAwsException {
  StateMachineAlreadyExists({String? type, String? message})
      : super(type: type, code: 'StateMachineAlreadyExists', message: message);
}

class StateMachineDeleting extends _s.GenericAwsException {
  StateMachineDeleting({String? type, String? message})
      : super(type: type, code: 'StateMachineDeleting', message: message);
}

class StateMachineDoesNotExist extends _s.GenericAwsException {
  StateMachineDoesNotExist({String? type, String? message})
      : super(type: type, code: 'StateMachineDoesNotExist', message: message);
}

class StateMachineLimitExceeded extends _s.GenericAwsException {
  StateMachineLimitExceeded({String? type, String? message})
      : super(type: type, code: 'StateMachineLimitExceeded', message: message);
}

class StateMachineTypeNotSupported extends _s.GenericAwsException {
  StateMachineTypeNotSupported({String? type, String? message})
      : super(
            type: type, code: 'StateMachineTypeNotSupported', message: message);
}

class TaskDoesNotExist extends _s.GenericAwsException {
  TaskDoesNotExist({String? type, String? message})
      : super(type: type, code: 'TaskDoesNotExist', message: message);
}

class TaskTimedOut extends _s.GenericAwsException {
  TaskTimedOut({String? type, String? message})
      : super(type: type, code: 'TaskTimedOut', message: message);
}

class TooManyTags extends _s.GenericAwsException {
  TooManyTags({String? type, String? message})
      : super(type: type, code: 'TooManyTags', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ActivityDoesNotExist': (type, message) =>
      ActivityDoesNotExist(type: type, message: message),
  'ActivityLimitExceeded': (type, message) =>
      ActivityLimitExceeded(type: type, message: message),
  'ActivityWorkerLimitExceeded': (type, message) =>
      ActivityWorkerLimitExceeded(type: type, message: message),
  'ExecutionAlreadyExists': (type, message) =>
      ExecutionAlreadyExists(type: type, message: message),
  'ExecutionDoesNotExist': (type, message) =>
      ExecutionDoesNotExist(type: type, message: message),
  'ExecutionLimitExceeded': (type, message) =>
      ExecutionLimitExceeded(type: type, message: message),
  'InvalidArn': (type, message) => InvalidArn(type: type, message: message),
  'InvalidDefinition': (type, message) =>
      InvalidDefinition(type: type, message: message),
  'InvalidExecutionInput': (type, message) =>
      InvalidExecutionInput(type: type, message: message),
  'InvalidLoggingConfiguration': (type, message) =>
      InvalidLoggingConfiguration(type: type, message: message),
  'InvalidName': (type, message) => InvalidName(type: type, message: message),
  'InvalidOutput': (type, message) =>
      InvalidOutput(type: type, message: message),
  'InvalidToken': (type, message) => InvalidToken(type: type, message: message),
  'InvalidTracingConfiguration': (type, message) =>
      InvalidTracingConfiguration(type: type, message: message),
  'MissingRequiredParameter': (type, message) =>
      MissingRequiredParameter(type: type, message: message),
  'ResourceNotFound': (type, message) =>
      ResourceNotFound(type: type, message: message),
  'StateMachineAlreadyExists': (type, message) =>
      StateMachineAlreadyExists(type: type, message: message),
  'StateMachineDeleting': (type, message) =>
      StateMachineDeleting(type: type, message: message),
  'StateMachineDoesNotExist': (type, message) =>
      StateMachineDoesNotExist(type: type, message: message),
  'StateMachineLimitExceeded': (type, message) =>
      StateMachineLimitExceeded(type: type, message: message),
  'StateMachineTypeNotSupported': (type, message) =>
      StateMachineTypeNotSupported(type: type, message: message),
  'TaskDoesNotExist': (type, message) =>
      TaskDoesNotExist(type: type, message: message),
  'TaskTimedOut': (type, message) => TaskTimedOut(type: type, message: message),
  'TooManyTags': (type, message) => TooManyTags(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
