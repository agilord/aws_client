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

import 'v2022_07_26.endpoints.dart' as _endpoints;
export '../../shared/shared.dart' show AwsClientCredentials;

/// Amazon Application Recovery Controller (ARC) Region switch helps you to
/// quickly and reliably shift traffic away from an impaired Amazon Web Services
/// Region to a healthy Region. With Region switch, you can create plans that
/// define the steps to shift traffic for your application from one Amazon Web
/// Services Region to another.
///
/// Region switch provides a structured approach to multi-Region failover,
/// helping you to meet your recovery time objectives (RTOs) and maintain
/// business continuity during regional disruptions.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/r53recovery/latest/dg/region-switch.html">Region
/// switch in ARC</a> in the <i>Amazon Application Recovery Controller User
/// Guide</i>.
class ArcRegionSwitch {
  final _s.JsonProtocol _protocol;
  final _s.ServiceMetadata _service;
  final String? _region;
  final String? _endpointUrl;
  final bool _useFipsEndpoint;
  final bool _useDualStackEndpoint;
  factory ArcRegionSwitch({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
    bool useFipsEndpoint = false,
    bool useDualStackEndpoint = false,
  }) {
    final service = _s.ServiceMetadata(
      endpointPrefix: 'arc-region-switch',
    );
    return ArcRegionSwitch._(
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
      service: service,
      region: region,
      endpointUrl: endpointUrl,
      useFipsEndpoint: useFipsEndpoint,
      useDualStackEndpoint: useDualStackEndpoint,
    );
  }
  ArcRegionSwitch._({
    required _s.JsonProtocol protocol,
    required _s.ServiceMetadata service,
    required String? region,
    required String? endpointUrl,
    required bool useFipsEndpoint,
    required bool useDualStackEndpoint,
  })  : _protocol = protocol,
        _service = service,
        _region = region,
        _endpointUrl = endpointUrl,
        _useFipsEndpoint = useFipsEndpoint,
        _useDualStackEndpoint = useDualStackEndpoint;
  _s.Endpoint _resolveEndpoint({
    bool? useControlPlaneEndpoint,
  }) {
    return _s.Endpoint.fromResolved(
      _endpoints.resolveEndpoint(
        region: _region,
        endpoint: _endpointUrl,
        useFips: _useFipsEndpoint,
        useDualStack: _useDualStackEndpoint,
        useControlPlaneEndpoint: useControlPlaneEndpoint,
      ),
      service: _service,
      region: _region,
    );
  }

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

  /// Approves a step in a plan execution that requires manual approval. When
  /// you create a plan, you can include approval steps that require manual
  /// intervention before the execution can proceed. This operation allows you
  /// to provide that approval.
  ///
  /// You must specify the plan ARN, execution ID, step name, and approval
  /// status. You can also provide an optional comment explaining the approval
  /// decision.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [approval] :
  /// The status of approval for a plan execution step.
  ///
  /// Parameter [executionId] :
  /// The execution identifier of a plan execution.
  ///
  /// Parameter [planArn] :
  /// The Amazon Resource Name (ARN) of the plan.
  ///
  /// Parameter [stepName] :
  /// The name of a step in a plan execution.
  ///
  /// Parameter [comment] :
  /// A comment that you can enter about a plan execution.
  Future<void> approvePlanExecutionStep({
    required Approval approval,
    required String executionId,
    required String planArn,
    required String stepName,
    String? comment,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'ArcRegionSwitch.ApprovePlanExecutionStep'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'approval': approval.value,
        'executionId': executionId,
        'planArn': planArn,
        'stepName': stepName,
        if (comment != null) 'comment': comment,
      },
    );
  }

  /// Cancels an in-progress plan execution. This operation stops the execution
  /// of the plan and prevents any further steps from being processed.
  ///
  /// You must specify the plan ARN and execution ID. You can also provide an
  /// optional comment explaining why the execution was canceled.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [executionId] :
  /// The execution identifier of a plan execution.
  ///
  /// Parameter [planArn] :
  /// The Amazon Resource Name (ARN) of the plan.
  ///
  /// Parameter [comment] :
  /// A comment that you can enter about canceling a plan execution step.
  Future<void> cancelPlanExecution({
    required String executionId,
    required String planArn,
    String? comment,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'ArcRegionSwitch.CancelPlanExecution'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'executionId': executionId,
        'planArn': planArn,
        if (comment != null) 'comment': comment,
      },
    );
  }

  /// Retrieves the evaluation status of a Region switch plan. The evaluation
  /// status provides information about the last time the plan was evaluated and
  /// any warnings or issues detected.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [planArn] :
  /// The Amazon Resource Name (ARN) of the Region switch plan to retrieve
  /// evaluation status for.
  ///
  /// Parameter [maxResults] :
  /// The number of objects that you want to return with this call.
  ///
  /// Parameter [nextToken] :
  /// Specifies that you want to receive the next page of results. Valid only if
  /// you received a <code>nextToken</code> response in the previous request. If
  /// you did, it indicates that more output is available. Set this parameter to
  /// the value provided by the previous call's <code>nextToken</code> response
  /// to request the next page of results.
  Future<GetPlanEvaluationStatusResponse> getPlanEvaluationStatus({
    required String planArn,
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
      'X-Amz-Target': 'ArcRegionSwitch.GetPlanEvaluationStatus'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'planArn': planArn,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return GetPlanEvaluationStatusResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves detailed information about a specific plan execution. You must
  /// specify the plan ARN and execution ID.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [executionId] :
  /// The execution identifier of a plan execution.
  ///
  /// Parameter [planArn] :
  /// The Amazon Resource Name (ARN) of the plan with the execution to retrieve.
  ///
  /// Parameter [maxResults] :
  /// The number of objects that you want to return with this call.
  ///
  /// Parameter [nextToken] :
  /// Specifies that you want to receive the next page of results. Valid only if
  /// you received a <code>nextToken</code> response in the previous request. If
  /// you did, it indicates that more output is available. Set this parameter to
  /// the value provided by the previous call's <code>nextToken</code> response
  /// to request the next page of results.
  Future<GetPlanExecutionResponse> getPlanExecution({
    required String executionId,
    required String planArn,
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
      'X-Amz-Target': 'ArcRegionSwitch.GetPlanExecution'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'executionId': executionId,
        'planArn': planArn,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return GetPlanExecutionResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves information about a Region switch plan in a specific Amazon Web
  /// Services Region. This operation is useful for getting Region-specific
  /// information about a plan.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the plan in Region.
  Future<GetPlanInRegionResponse> getPlanInRegion({
    required String arn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'ArcRegionSwitch.GetPlanInRegion'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
      },
    );

    return GetPlanInRegionResponse.fromJson(jsonResponse.body);
  }

  /// Lists the events that occurred during a plan execution. These events
  /// provide a detailed timeline of the execution process.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [executionId] :
  /// The execution identifier of a plan execution.
  ///
  /// Parameter [planArn] :
  /// The Amazon Resource Name (ARN) of the plan.
  ///
  /// Parameter [maxResults] :
  /// The number of objects that you want to return with this call.
  ///
  /// Parameter [name] :
  /// The name of the plan execution event.
  ///
  /// Parameter [nextToken] :
  /// Specifies that you want to receive the next page of results. Valid only if
  /// you received a <code>nextToken</code> response in the previous request. If
  /// you did, it indicates that more output is available. Set this parameter to
  /// the value provided by the previous call's <code>nextToken</code> response
  /// to request the next page of results.
  Future<ListPlanExecutionEventsResponse> listPlanExecutionEvents({
    required String executionId,
    required String planArn,
    int? maxResults,
    String? name,
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
      'X-Amz-Target': 'ArcRegionSwitch.ListPlanExecutionEvents'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'executionId': executionId,
        'planArn': planArn,
        if (maxResults != null) 'maxResults': maxResults,
        if (name != null) 'name': name,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListPlanExecutionEventsResponse.fromJson(jsonResponse.body);
  }

  /// Lists the executions of a Region switch plan. This operation returns
  /// information about both current and historical executions.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [planArn] :
  /// The ARN for the plan.
  ///
  /// Parameter [maxResults] :
  /// The number of objects that you want to return with this call.
  ///
  /// Parameter [nextToken] :
  /// Specifies that you want to receive the next page of results. Valid only if
  /// you received a <code>nextToken</code> response in the previous request. If
  /// you did, it indicates that more output is available. Set this parameter to
  /// the value provided by the previous call's <code>nextToken</code> response
  /// to request the next page of results.
  ///
  /// Parameter [state] :
  /// The state of the plan execution. For example, the plan execution might be
  /// In Progress.
  Future<ListPlanExecutionsResponse> listPlanExecutions({
    required String planArn,
    int? maxResults,
    String? nextToken,
    ExecutionState? state,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'ArcRegionSwitch.ListPlanExecutions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'planArn': planArn,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (state != null) 'state': state.value,
      },
    );

    return ListPlanExecutionsResponse.fromJson(jsonResponse.body);
  }

  /// Lists all Region switch plans in your Amazon Web Services account that are
  /// available in the current Amazon Web Services Region.
  ///
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [maxResults] :
  /// The number of objects that you want to return with this call.
  ///
  /// Parameter [nextToken] :
  /// Specifies that you want to receive the next page of results. Valid only if
  /// you received a <code>nextToken</code> response in the previous request. If
  /// you did, it indicates that more output is available. Set this parameter to
  /// the value provided by the previous call's <code>nextToken</code> response
  /// to request the next page of results.
  Future<ListPlansInRegionResponse> listPlansInRegion({
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
      'X-Amz-Target': 'ArcRegionSwitch.ListPlansInRegion'
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

    return ListPlansInRegionResponse.fromJson(jsonResponse.body);
  }

  /// List the Amazon Route 53 health checks.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [IllegalArgumentException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the Amazon Route 53 health check
  /// request.
  ///
  /// Parameter [hostedZoneId] :
  /// The hosted zone ID for the health checks.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response.
  ///
  /// Parameter [nextToken] :
  /// Specifies that you want to receive the next page of results. Valid only if
  /// you received a <code>nextToken</code> response in the previous request. If
  /// you did, it indicates that more output is available. Set this parameter to
  /// the value provided by the previous call's <code>nextToken</code> response
  /// to request the next page of results.
  ///
  /// Parameter [recordName] :
  /// The record name for the health checks.
  Future<ListRoute53HealthChecksResponse> listRoute53HealthChecks({
    required String arn,
    String? hostedZoneId,
    int? maxResults,
    String? nextToken,
    String? recordName,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'ArcRegionSwitch.ListRoute53HealthChecks'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
        if (hostedZoneId != null) 'hostedZoneId': hostedZoneId,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (recordName != null) 'recordName': recordName,
      },
      endpoint: _resolveEndpoint(
        useControlPlaneEndpoint: true,
      ),
    );

    return ListRoute53HealthChecksResponse.fromJson(jsonResponse.body);
  }

  /// List the Amazon Route 53 health checks in a specific Amazon Web Services
  /// Region.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [IllegalArgumentException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the Arc Region Switch Plan.
  ///
  /// Parameter [hostedZoneId] :
  /// The hosted zone ID for the health checks.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response.
  ///
  /// Parameter [nextToken] :
  /// Specifies that you want to receive the next page of results. Valid only if
  /// you received a <code>nextToken</code> response in the previous request. If
  /// you did, it indicates that more output is available. Set this parameter to
  /// the value provided by the previous call's <code>nextToken</code> response
  /// to request the next page of results.
  ///
  /// Parameter [recordName] :
  /// The record name for the health checks.
  Future<ListRoute53HealthChecksInRegionResponse>
      listRoute53HealthChecksInRegion({
    required String arn,
    String? hostedZoneId,
    int? maxResults,
    String? nextToken,
    String? recordName,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'ArcRegionSwitch.ListRoute53HealthChecksInRegion'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
        if (hostedZoneId != null) 'hostedZoneId': hostedZoneId,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (recordName != null) 'recordName': recordName,
      },
    );

    return ListRoute53HealthChecksInRegionResponse.fromJson(jsonResponse.body);
  }

  /// Starts the execution of a Region switch plan. You can execute a plan in
  /// either <code>graceful</code> or <code>ungraceful</code> mode.
  ///
  /// Specifing <code>ungraceful</code> mode either changes the behavior of the
  /// execution blocks in a workflow or skips specific execution blocks.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [IllegalArgumentException].
  /// May throw [IllegalStateException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [action] :
  /// The action to perform. Valid values are <code>activate</code> (to shift
  /// traffic to the target Region) or <code>deactivate</code> (to shift traffic
  /// away from the target Region).
  ///
  /// Parameter [planArn] :
  /// The Amazon Resource Name (ARN) of the plan to execute.
  ///
  /// Parameter [targetRegion] :
  /// The Amazon Web Services Region to target with this execution. This is the
  /// Region that traffic will be shifted to or from, depending on the action.
  ///
  /// Parameter [comment] :
  /// An optional comment explaining why the plan execution is being started.
  ///
  /// Parameter [latestVersion] :
  /// A boolean value indicating whether to use the latest version of the plan.
  /// If set to false, you must specify a specific version.
  ///
  /// Parameter [mode] :
  /// The plan execution mode. Valid values are <code>graceful</code>, for
  /// starting the execution in graceful mode, or <code>ungraceful</code>, for
  /// starting the execution in ungraceful mode.
  ///
  /// Parameter [recoveryExecutionId] :
  /// The execution identifier of the recovery execution that ran in the
  /// opposite region post-recovery is ran in. Required when starting a
  /// post-recovery execution.
  Future<StartPlanExecutionResponse> startPlanExecution({
    required ExecutionAction action,
    required String planArn,
    required String targetRegion,
    String? comment,
    String? latestVersion,
    ExecutionMode? mode,
    String? recoveryExecutionId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'ArcRegionSwitch.StartPlanExecution'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'action': action.value,
        'planArn': planArn,
        'targetRegion': targetRegion,
        if (comment != null) 'comment': comment,
        if (latestVersion != null) 'latestVersion': latestVersion,
        if (mode != null) 'mode': mode.value,
        if (recoveryExecutionId != null)
          'recoveryExecutionId': recoveryExecutionId,
      },
    );

    return StartPlanExecutionResponse.fromJson(jsonResponse.body);
  }

  /// Updates an in-progress plan execution. This operation allows you to modify
  /// certain aspects of the execution, such as adding a comment or changing the
  /// action.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [IllegalStateException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [action] :
  /// The action specified for a plan execution, for example, Switch to Graceful
  /// or Pause.
  ///
  /// Parameter [executionId] :
  /// The execution identifier of a plan execution.
  ///
  /// Parameter [planArn] :
  /// The Amazon Resource Name (ARN) of the plan with the execution to update.
  ///
  /// Parameter [comment] :
  /// An optional comment about the plan execution.
  Future<void> updatePlanExecution({
    required UpdatePlanExecutionAction action,
    required String executionId,
    required String planArn,
    String? comment,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'ArcRegionSwitch.UpdatePlanExecution'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'action': action.value,
        'executionId': executionId,
        'planArn': planArn,
        if (comment != null) 'comment': comment,
      },
    );
  }

  /// Updates a specific step in an in-progress plan execution. This operation
  /// allows you to modify the step's comment or action.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [actionToTake] :
  /// The updated action to take for the step. This can be used to skip or retry
  /// a step.
  ///
  /// Parameter [comment] :
  /// An optional comment about the plan execution.
  ///
  /// Parameter [executionId] :
  /// The unique identifier of the plan execution containing the step to update.
  ///
  /// Parameter [planArn] :
  /// The Amazon Resource Name (ARN) of the plan containing the execution step
  /// to update.
  ///
  /// Parameter [stepName] :
  /// The name of the execution step to update.
  Future<void> updatePlanExecutionStep({
    required UpdatePlanExecutionStepAction actionToTake,
    required String comment,
    required String executionId,
    required String planArn,
    required String stepName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'ArcRegionSwitch.UpdatePlanExecutionStep'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'actionToTake': actionToTake.value,
        'comment': comment,
        'executionId': executionId,
        'planArn': planArn,
        'stepName': stepName,
      },
    );
  }

  /// Creates a new Region switch plan. A plan defines the steps required to
  /// shift traffic from one Amazon Web Services Region to another.
  ///
  /// You must specify a name for the plan, the primary Region, and at least one
  /// additional Region. You can also provide a description, execution role,
  /// recovery time objective, associated alarms, triggers, and workflows that
  /// define the steps to execute during a Region switch.
  ///
  /// Parameter [executionRole] :
  /// An execution role is a way to categorize a Region switch plan.
  ///
  /// Parameter [name] :
  /// The name of a Region switch plan.
  ///
  /// Parameter [recoveryApproach] :
  /// The recovery approach for a Region switch plan, which can be active/active
  /// (activeActive) or active/passive (activePassive).
  ///
  /// Parameter [regions] :
  /// An array that specifies the Amazon Web Services Regions for a Region
  /// switch plan. Specify two Regions.
  ///
  /// Parameter [workflows] :
  /// An array of workflows included in a Region switch plan.
  ///
  /// Parameter [associatedAlarms] :
  /// The alarms associated with a Region switch plan.
  ///
  /// Parameter [description] :
  /// The description of a Region switch plan.
  ///
  /// Parameter [primaryRegion] :
  /// The primary Amazon Web Services Region for the application. This is the
  /// Region where the application normally runs before any Region switch
  /// occurs.
  ///
  /// Parameter [recoveryTimeObjectiveMinutes] :
  /// Optionally, you can specify an recovery time objective for a Region switch
  /// plan, in minutes.
  ///
  /// Parameter [tags] :
  /// The tags to apply to the Region switch plan.
  ///
  /// Parameter [triggers] :
  /// The triggers associated with a Region switch plan.
  Future<CreatePlanResponse> createPlan({
    required String executionRole,
    required String name,
    required RecoveryApproach recoveryApproach,
    required List<String> regions,
    required List<Workflow> workflows,
    Map<String, AssociatedAlarm>? associatedAlarms,
    String? description,
    String? primaryRegion,
    int? recoveryTimeObjectiveMinutes,
    ReportConfiguration? reportConfiguration,
    Map<String, String>? tags,
    List<Trigger>? triggers,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'ArcRegionSwitch.CreatePlan'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'executionRole': executionRole,
        'name': name,
        'recoveryApproach': recoveryApproach.value,
        'regions': regions,
        'workflows': workflows,
        if (associatedAlarms != null) 'associatedAlarms': associatedAlarms,
        if (description != null) 'description': description,
        if (primaryRegion != null) 'primaryRegion': primaryRegion,
        if (recoveryTimeObjectiveMinutes != null)
          'recoveryTimeObjectiveMinutes': recoveryTimeObjectiveMinutes,
        if (reportConfiguration != null)
          'reportConfiguration': reportConfiguration,
        if (tags != null) 'tags': tags,
        if (triggers != null) 'triggers': triggers,
      },
      endpoint: _resolveEndpoint(
        useControlPlaneEndpoint: true,
      ),
    );

    return CreatePlanResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves detailed information about a Region switch plan. You must
  /// specify the ARN of the plan.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the plan.
  Future<GetPlanResponse> getPlan({
    required String arn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'ArcRegionSwitch.GetPlan'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
      },
      endpoint: _resolveEndpoint(
        useControlPlaneEndpoint: true,
      ),
    );

    return GetPlanResponse.fromJson(jsonResponse.body);
  }

  /// Updates an existing Region switch plan. You can modify the plan's
  /// description, workflows, execution role, recovery time objective,
  /// associated alarms, and triggers.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the plan.
  ///
  /// Parameter [executionRole] :
  /// The updated IAM role ARN that grants Region switch the permissions needed
  /// to execute the plan steps.
  ///
  /// Parameter [workflows] :
  /// The updated workflows for the Region switch plan.
  ///
  /// Parameter [associatedAlarms] :
  /// The updated CloudWatch alarms associated with the plan.
  ///
  /// Parameter [description] :
  /// The updated description for the Region switch plan.
  ///
  /// Parameter [recoveryTimeObjectiveMinutes] :
  /// The updated target recovery time objective (RTO) in minutes for the plan.
  ///
  /// Parameter [reportConfiguration] :
  /// The updated report configuration for the plan.
  ///
  /// Parameter [triggers] :
  /// The updated conditions that can automatically trigger the execution of the
  /// plan.
  Future<UpdatePlanResponse> updatePlan({
    required String arn,
    required String executionRole,
    required List<Workflow> workflows,
    Map<String, AssociatedAlarm>? associatedAlarms,
    String? description,
    int? recoveryTimeObjectiveMinutes,
    ReportConfiguration? reportConfiguration,
    List<Trigger>? triggers,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'ArcRegionSwitch.UpdatePlan'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
        'executionRole': executionRole,
        'workflows': workflows,
        if (associatedAlarms != null) 'associatedAlarms': associatedAlarms,
        if (description != null) 'description': description,
        if (recoveryTimeObjectiveMinutes != null)
          'recoveryTimeObjectiveMinutes': recoveryTimeObjectiveMinutes,
        if (reportConfiguration != null)
          'reportConfiguration': reportConfiguration,
        if (triggers != null) 'triggers': triggers,
      },
      endpoint: _resolveEndpoint(
        useControlPlaneEndpoint: true,
      ),
    );

    return UpdatePlanResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a Region switch plan. You must specify the ARN of the plan to
  /// delete.
  ///
  /// You cannot delete a plan that has an active execution in progress.
  ///
  /// May throw [IllegalStateException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the plan.
  Future<void> deletePlan({
    required String arn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'ArcRegionSwitch.DeletePlan'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
      },
      endpoint: _resolveEndpoint(
        useControlPlaneEndpoint: true,
      ),
    );
  }

  /// Lists all Region switch plans in your Amazon Web Services account.
  ///
  /// Parameter [maxResults] :
  /// The number of objects that you want to return with this call.
  ///
  /// Parameter [nextToken] :
  /// Specifies that you want to receive the next page of results. Valid only if
  /// you received a <code>nextToken</code> response in the previous request. If
  /// you did, it indicates that more output is available. Set this parameter to
  /// the value provided by the previous call's <code>nextToken</code> response
  /// to request the next page of results.
  Future<ListPlansResponse> listPlans({
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
      'X-Amz-Target': 'ArcRegionSwitch.ListPlans'
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
      endpoint: _resolveEndpoint(
        useControlPlaneEndpoint: true,
      ),
    );

    return ListPlansResponse.fromJson(jsonResponse.body);
  }

  /// Lists the tags attached to a Region switch resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the resource.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String arn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'ArcRegionSwitch.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
      },
      endpoint: _resolveEndpoint(
        useControlPlaneEndpoint: true,
      ),
    );

    return ListTagsForResourceResponse.fromJson(jsonResponse.body);
  }

  /// Adds or updates tags for a Region switch resource. You can assign metadata
  /// to your resources in the form of tags, which are key-value pairs.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) for a tag that you add to a resource.
  ///
  /// Parameter [tags] :
  /// Tags that you add to a resource. You can add a maximum of 50 tags in
  /// Region switch.
  Future<void> tagResource({
    required String arn,
    required Map<String, String> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'ArcRegionSwitch.TagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
        'tags': tags,
      },
      endpoint: _resolveEndpoint(
        useControlPlaneEndpoint: true,
      ),
    );
  }

  /// Removes tags from a Region switch resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) for a tag you remove a resource from.
  ///
  /// Parameter [resourceTagKeys] :
  /// Tag keys that you remove from a resource.
  Future<void> untagResource({
    required String arn,
    required List<String> resourceTagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'ArcRegionSwitch.UntagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
        'resourceTagKeys': resourceTagKeys,
      },
      endpoint: _resolveEndpoint(
        useControlPlaneEndpoint: true,
      ),
    );
  }
}

/// @nodoc
class ApprovePlanExecutionStepResponse {
  ApprovePlanExecutionStepResponse();

  factory ApprovePlanExecutionStepResponse.fromJson(Map<String, dynamic> _) {
    return ApprovePlanExecutionStepResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class CancelPlanExecutionResponse {
  CancelPlanExecutionResponse();

  factory CancelPlanExecutionResponse.fromJson(Map<String, dynamic> _) {
    return CancelPlanExecutionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class GetPlanEvaluationStatusResponse {
  /// The Amazon Resource Name (ARN) of the plan.
  final String planArn;

  /// The evaluation state for the plan.
  final EvaluationStatus? evaluationState;

  /// The version of the last evaluation of the plan.
  final String? lastEvaluatedVersion;

  /// The time of the last time that Region switch ran an evaluation of the plan.
  final DateTime? lastEvaluationTime;

  /// Specifies that you want to receive the next page of results. Valid only if
  /// you received a <code>nextToken</code> response in the previous request. If
  /// you did, it indicates that more output is available. Set this parameter to
  /// the value provided by the previous call's <code>nextToken</code> response to
  /// request the next page of results.
  final String? nextToken;

  /// The Amazon Web Services Region for the plan.
  final String? region;

  /// The current evaluation warnings for the plan.
  final List<ResourceWarning>? warnings;

  GetPlanEvaluationStatusResponse({
    required this.planArn,
    this.evaluationState,
    this.lastEvaluatedVersion,
    this.lastEvaluationTime,
    this.nextToken,
    this.region,
    this.warnings,
  });

  factory GetPlanEvaluationStatusResponse.fromJson(Map<String, dynamic> json) {
    return GetPlanEvaluationStatusResponse(
      planArn: (json['planArn'] as String?) ?? '',
      evaluationState: (json['evaluationState'] as String?)
          ?.let(EvaluationStatus.fromString),
      lastEvaluatedVersion: json['lastEvaluatedVersion'] as String?,
      lastEvaluationTime: timeStampFromJson(json['lastEvaluationTime']),
      nextToken: json['nextToken'] as String?,
      region: json['region'] as String?,
      warnings: (json['warnings'] as List?)
          ?.nonNulls
          .map((e) => ResourceWarning.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final planArn = this.planArn;
    final evaluationState = this.evaluationState;
    final lastEvaluatedVersion = this.lastEvaluatedVersion;
    final lastEvaluationTime = this.lastEvaluationTime;
    final nextToken = this.nextToken;
    final region = this.region;
    final warnings = this.warnings;
    return {
      'planArn': planArn,
      if (evaluationState != null) 'evaluationState': evaluationState.value,
      if (lastEvaluatedVersion != null)
        'lastEvaluatedVersion': lastEvaluatedVersion,
      if (lastEvaluationTime != null)
        'lastEvaluationTime': unixTimestampToJson(lastEvaluationTime),
      if (nextToken != null) 'nextToken': nextToken,
      if (region != null) 'region': region,
      if (warnings != null) 'warnings': warnings,
    };
  }
}

/// @nodoc
class GetPlanExecutionResponse {
  /// The plan execution action. Valid values are <code>activate</code>, to
  /// activate an Amazon Web Services Region, or <code>deactivate</code>, to
  /// deactivate a Region.
  final ExecutionAction executionAction;

  /// The execution identifier of a plan execution.
  final String executionId;

  /// The Amazon Web Services Region for a plan execution.
  final String executionRegion;

  /// The plan execution state. Provides the state of a plan execution, for
  /// example, In Progress or Paused by Operator.
  final ExecutionState executionState;

  /// The plan execution mode. Valid values are <code>graceful</code>, for
  /// graceful executions, or <code>ungraceful</code>, for ungraceful executions.
  final ExecutionMode mode;

  /// The Amazon Resource Name (ARN) of the plan.
  final String planArn;

  /// The time (UTC) when the plan execution started.
  final DateTime startTime;

  /// The actual recovery time that Region switch calculates for a plan execution.
  /// Actual recovery time includes the time for the plan to run added to the time
  /// elapsed until the application health alarms that you've specified are
  /// healthy again.
  final String? actualRecoveryTime;

  /// A comment included on the plan execution.
  final String? comment;

  /// The time (UTC) when the plan execution ended.
  final DateTime? endTime;

  /// Information about the location of a generated report, or the cause of its
  /// failure.
  final List<GeneratedReport>? generatedReportDetails;

  /// Specifies that you want to receive the next page of results. Valid only if
  /// you received a <code>nextToken</code> response in the previous request. If
  /// you did, it indicates that more output is available. Set this parameter to
  /// the value provided by the previous call's <code>nextToken</code> response to
  /// request the next page of results.
  final String? nextToken;

  /// The details of the Region switch plan.
  final Plan? plan;

  /// The unique identifier of the most recent recovery execution. Required when
  /// starting a post-recovery execution.
  final String? recoveryExecutionId;

  /// The states of the steps in the plan execution.
  final List<StepState>? stepStates;

  /// The timestamp when the plan execution was last updated.
  final DateTime? updatedAt;

  /// The version for the plan.
  final String? version;

  GetPlanExecutionResponse({
    required this.executionAction,
    required this.executionId,
    required this.executionRegion,
    required this.executionState,
    required this.mode,
    required this.planArn,
    required this.startTime,
    this.actualRecoveryTime,
    this.comment,
    this.endTime,
    this.generatedReportDetails,
    this.nextToken,
    this.plan,
    this.recoveryExecutionId,
    this.stepStates,
    this.updatedAt,
    this.version,
  });

  factory GetPlanExecutionResponse.fromJson(Map<String, dynamic> json) {
    return GetPlanExecutionResponse(
      executionAction: ExecutionAction.fromString(
          (json['executionAction'] as String?) ?? ''),
      executionId: (json['executionId'] as String?) ?? '',
      executionRegion: (json['executionRegion'] as String?) ?? '',
      executionState:
          ExecutionState.fromString((json['executionState'] as String?) ?? ''),
      mode: ExecutionMode.fromString((json['mode'] as String?) ?? ''),
      planArn: (json['planArn'] as String?) ?? '',
      startTime: nonNullableTimeStampFromJson(json['startTime'] ?? 0),
      actualRecoveryTime: json['actualRecoveryTime'] as String?,
      comment: json['comment'] as String?,
      endTime: timeStampFromJson(json['endTime']),
      generatedReportDetails: (json['generatedReportDetails'] as List?)
          ?.nonNulls
          .map((e) => GeneratedReport.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
      plan: json['plan'] != null
          ? Plan.fromJson(json['plan'] as Map<String, dynamic>)
          : null,
      recoveryExecutionId: json['recoveryExecutionId'] as String?,
      stepStates: (json['stepStates'] as List?)
          ?.nonNulls
          .map((e) => StepState.fromJson(e as Map<String, dynamic>))
          .toList(),
      updatedAt: timeStampFromJson(json['updatedAt']),
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final executionAction = this.executionAction;
    final executionId = this.executionId;
    final executionRegion = this.executionRegion;
    final executionState = this.executionState;
    final mode = this.mode;
    final planArn = this.planArn;
    final startTime = this.startTime;
    final actualRecoveryTime = this.actualRecoveryTime;
    final comment = this.comment;
    final endTime = this.endTime;
    final generatedReportDetails = this.generatedReportDetails;
    final nextToken = this.nextToken;
    final plan = this.plan;
    final recoveryExecutionId = this.recoveryExecutionId;
    final stepStates = this.stepStates;
    final updatedAt = this.updatedAt;
    final version = this.version;
    return {
      'executionAction': executionAction.value,
      'executionId': executionId,
      'executionRegion': executionRegion,
      'executionState': executionState.value,
      'mode': mode.value,
      'planArn': planArn,
      'startTime': unixTimestampToJson(startTime),
      if (actualRecoveryTime != null) 'actualRecoveryTime': actualRecoveryTime,
      if (comment != null) 'comment': comment,
      if (endTime != null) 'endTime': unixTimestampToJson(endTime),
      if (generatedReportDetails != null)
        'generatedReportDetails': generatedReportDetails,
      if (nextToken != null) 'nextToken': nextToken,
      if (plan != null) 'plan': plan,
      if (recoveryExecutionId != null)
        'recoveryExecutionId': recoveryExecutionId,
      if (stepStates != null) 'stepStates': stepStates,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
      if (version != null) 'version': version,
    };
  }
}

/// @nodoc
class GetPlanInRegionResponse {
  /// The details of the Region switch plan.
  final Plan? plan;

  GetPlanInRegionResponse({
    this.plan,
  });

  factory GetPlanInRegionResponse.fromJson(Map<String, dynamic> json) {
    return GetPlanInRegionResponse(
      plan: json['plan'] != null
          ? Plan.fromJson(json['plan'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final plan = this.plan;
    return {
      if (plan != null) 'plan': plan,
    };
  }
}

/// @nodoc
class ListPlanExecutionEventsResponse {
  /// The items in the plan execution event.
  final List<ExecutionEvent>? items;

  /// Specifies that you want to receive the next page of results. Valid only if
  /// you received a <code>nextToken</code> response in the previous request. If
  /// you did, it indicates that more output is available. Set this parameter to
  /// the value provided by the previous call's <code>nextToken</code> response to
  /// request the next page of results.
  final String? nextToken;

  ListPlanExecutionEventsResponse({
    this.items,
    this.nextToken,
  });

  factory ListPlanExecutionEventsResponse.fromJson(Map<String, dynamic> json) {
    return ListPlanExecutionEventsResponse(
      items: (json['items'] as List?)
          ?.nonNulls
          .map((e) => ExecutionEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListPlanExecutionsResponse {
  /// The items in the plan execution to return.
  final List<AbbreviatedExecution>? items;

  /// Specifies that you want to receive the next page of results. Valid only if
  /// you received a <code>nextToken</code> response in the previous request. If
  /// you did, it indicates that more output is available. Set this parameter to
  /// the value provided by the previous call's <code>nextToken</code> response to
  /// request the next page of results.
  final String? nextToken;

  ListPlanExecutionsResponse({
    this.items,
    this.nextToken,
  });

  factory ListPlanExecutionsResponse.fromJson(Map<String, dynamic> json) {
    return ListPlanExecutionsResponse(
      items: (json['items'] as List?)
          ?.nonNulls
          .map((e) => AbbreviatedExecution.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListPlansInRegionResponse {
  /// Specifies that you want to receive the next page of results. Valid only if
  /// you received a <code>nextToken</code> response in the previous request. If
  /// you did, it indicates that more output is available. Set this parameter to
  /// the value provided by the previous call's <code>nextToken</code> response to
  /// request the next page of results.
  final String? nextToken;

  /// The plans that were requested.
  final List<AbbreviatedPlan>? plans;

  ListPlansInRegionResponse({
    this.nextToken,
    this.plans,
  });

  factory ListPlansInRegionResponse.fromJson(Map<String, dynamic> json) {
    return ListPlansInRegionResponse(
      nextToken: json['nextToken'] as String?,
      plans: (json['plans'] as List?)
          ?.nonNulls
          .map((e) => AbbreviatedPlan.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final plans = this.plans;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (plans != null) 'plans': plans,
    };
  }
}

/// @nodoc
class ListRoute53HealthChecksResponse {
  /// List of the health checks requested.
  final List<Route53HealthCheck>? healthChecks;

  /// A pagination token. A response may contain no results while still including
  /// a <code>nextToken</code>. Continue paginating until <code>nextToken</code>
  /// is null to retrieve all results.
  final String? nextToken;

  ListRoute53HealthChecksResponse({
    this.healthChecks,
    this.nextToken,
  });

  factory ListRoute53HealthChecksResponse.fromJson(Map<String, dynamic> json) {
    return ListRoute53HealthChecksResponse(
      healthChecks: (json['healthChecks'] as List?)
          ?.nonNulls
          .map((e) => Route53HealthCheck.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final healthChecks = this.healthChecks;
    final nextToken = this.nextToken;
    return {
      if (healthChecks != null) 'healthChecks': healthChecks,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListRoute53HealthChecksInRegionResponse {
  /// List of the health checks requested.
  final List<Route53HealthCheck>? healthChecks;

  /// A pagination token. A response may contain no results while still including
  /// a <code>nextToken</code>. Continue paginating until <code>nextToken</code>
  /// is null to retrieve all results.
  final String? nextToken;

  ListRoute53HealthChecksInRegionResponse({
    this.healthChecks,
    this.nextToken,
  });

  factory ListRoute53HealthChecksInRegionResponse.fromJson(
      Map<String, dynamic> json) {
    return ListRoute53HealthChecksInRegionResponse(
      healthChecks: (json['healthChecks'] as List?)
          ?.nonNulls
          .map((e) => Route53HealthCheck.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final healthChecks = this.healthChecks;
    final nextToken = this.nextToken;
    return {
      if (healthChecks != null) 'healthChecks': healthChecks,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class StartPlanExecutionResponse {
  /// The Amazon Web Services Region to activate.
  final String? activateRegion;

  /// The Amazon Web Services Region to deactivate.
  final String? deactivateRegion;

  /// The execution identifier of a plan execution.
  final String? executionId;

  /// The details of the Region switch plan.
  final String? plan;

  /// The version of the plan, a unique number generated by Region switch.
  final String? planVersion;

  StartPlanExecutionResponse({
    this.activateRegion,
    this.deactivateRegion,
    this.executionId,
    this.plan,
    this.planVersion,
  });

  factory StartPlanExecutionResponse.fromJson(Map<String, dynamic> json) {
    return StartPlanExecutionResponse(
      activateRegion: json['activateRegion'] as String?,
      deactivateRegion: json['deactivateRegion'] as String?,
      executionId: json['executionId'] as String?,
      plan: json['plan'] as String?,
      planVersion: json['planVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final activateRegion = this.activateRegion;
    final deactivateRegion = this.deactivateRegion;
    final executionId = this.executionId;
    final plan = this.plan;
    final planVersion = this.planVersion;
    return {
      if (activateRegion != null) 'activateRegion': activateRegion,
      if (deactivateRegion != null) 'deactivateRegion': deactivateRegion,
      if (executionId != null) 'executionId': executionId,
      if (plan != null) 'plan': plan,
      if (planVersion != null) 'planVersion': planVersion,
    };
  }
}

/// @nodoc
class UpdatePlanExecutionResponse {
  UpdatePlanExecutionResponse();

  factory UpdatePlanExecutionResponse.fromJson(Map<String, dynamic> _) {
    return UpdatePlanExecutionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class UpdatePlanExecutionStepResponse {
  UpdatePlanExecutionStepResponse();

  factory UpdatePlanExecutionStepResponse.fromJson(Map<String, dynamic> _) {
    return UpdatePlanExecutionStepResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class CreatePlanResponse {
  /// The details of the created Region switch plan.
  final Plan? plan;

  CreatePlanResponse({
    this.plan,
  });

  factory CreatePlanResponse.fromJson(Map<String, dynamic> json) {
    return CreatePlanResponse(
      plan: json['plan'] != null
          ? Plan.fromJson(json['plan'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final plan = this.plan;
    return {
      if (plan != null) 'plan': plan,
    };
  }
}

/// @nodoc
class GetPlanResponse {
  /// The detailed information about the requested Region switch plan.
  final Plan? plan;

  GetPlanResponse({
    this.plan,
  });

  factory GetPlanResponse.fromJson(Map<String, dynamic> json) {
    return GetPlanResponse(
      plan: json['plan'] != null
          ? Plan.fromJson(json['plan'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final plan = this.plan;
    return {
      if (plan != null) 'plan': plan,
    };
  }
}

/// @nodoc
class UpdatePlanResponse {
  /// The details of the updated Region switch plan.
  final Plan? plan;

  UpdatePlanResponse({
    this.plan,
  });

  factory UpdatePlanResponse.fromJson(Map<String, dynamic> json) {
    return UpdatePlanResponse(
      plan: json['plan'] != null
          ? Plan.fromJson(json['plan'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final plan = this.plan;
    return {
      if (plan != null) 'plan': plan,
    };
  }
}

/// @nodoc
class DeletePlanResponse {
  DeletePlanResponse();

  factory DeletePlanResponse.fromJson(Map<String, dynamic> _) {
    return DeletePlanResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class ListPlansResponse {
  /// Specifies that you want to receive the next page of results. Valid only if
  /// you received a <code>nextToken</code> response in the previous request. If
  /// you did, it indicates that more output is available. Set this parameter to
  /// the value provided by the previous call's <code>nextToken</code> response to
  /// request the next page of results.
  final String? nextToken;

  /// The plans that were requested.
  final List<AbbreviatedPlan>? plans;

  ListPlansResponse({
    this.nextToken,
    this.plans,
  });

  factory ListPlansResponse.fromJson(Map<String, dynamic> json) {
    return ListPlansResponse(
      nextToken: json['nextToken'] as String?,
      plans: (json['plans'] as List?)
          ?.nonNulls
          .map((e) => AbbreviatedPlan.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final plans = this.plans;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (plans != null) 'plans': plans,
    };
  }
}

/// @nodoc
class ListTagsForResourceResponse {
  /// The tags for a resource.
  final Map<String, String>? resourceTags;

  ListTagsForResourceResponse({
    this.resourceTags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      resourceTags: (json['resourceTags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final resourceTags = this.resourceTags;
    return {
      if (resourceTags != null) 'resourceTags': resourceTags,
    };
  }
}

/// @nodoc
class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A summarized representation of a Region switch plan. This structure contains
/// key information about a plan without all the detailed workflow and step
/// data.
///
/// @nodoc
class AbbreviatedPlan {
  /// The Amazon Resource Name (ARN) of the Region switch plan.
  final String arn;

  /// The name of a Region switch plan.
  final String name;

  /// The owner of a Region switch plan.
  final String owner;

  /// The recovery approach for a Region switch plan, which can be active/active
  /// (activeActive) or active/passive (activePassive).
  final RecoveryApproach recoveryApproach;

  /// The Amazon Web Services Region specified for a Region switch plan.
  final List<String> regions;

  /// Specifies if this is the active plan execution at this time.
  final String? activePlanExecution;

  /// The description of a Region switch plan.
  final String? description;

  /// The execution role is a way to categorize a Region switch plan.
  final String? executionRole;

  /// The primary Region for a plan.
  final String? primaryRegion;

  /// The recovery time objective that you've specified.
  final int? recoveryTimeObjectiveMinutes;

  /// The timestamp when the plan execution was last updated.
  final DateTime? updatedAt;

  /// The version for the plan.
  final String? version;

  AbbreviatedPlan({
    required this.arn,
    required this.name,
    required this.owner,
    required this.recoveryApproach,
    required this.regions,
    this.activePlanExecution,
    this.description,
    this.executionRole,
    this.primaryRegion,
    this.recoveryTimeObjectiveMinutes,
    this.updatedAt,
    this.version,
  });

  factory AbbreviatedPlan.fromJson(Map<String, dynamic> json) {
    return AbbreviatedPlan(
      arn: (json['arn'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      owner: (json['owner'] as String?) ?? '',
      recoveryApproach: RecoveryApproach.fromString(
          (json['recoveryApproach'] as String?) ?? ''),
      regions: ((json['regions'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      activePlanExecution: json['activePlanExecution'] as String?,
      description: json['description'] as String?,
      executionRole: json['executionRole'] as String?,
      primaryRegion: json['primaryRegion'] as String?,
      recoveryTimeObjectiveMinutes:
          json['recoveryTimeObjectiveMinutes'] as int?,
      updatedAt: timeStampFromJson(json['updatedAt']),
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    final owner = this.owner;
    final recoveryApproach = this.recoveryApproach;
    final regions = this.regions;
    final activePlanExecution = this.activePlanExecution;
    final description = this.description;
    final executionRole = this.executionRole;
    final primaryRegion = this.primaryRegion;
    final recoveryTimeObjectiveMinutes = this.recoveryTimeObjectiveMinutes;
    final updatedAt = this.updatedAt;
    final version = this.version;
    return {
      'arn': arn,
      'name': name,
      'owner': owner,
      'recoveryApproach': recoveryApproach.value,
      'regions': regions,
      if (activePlanExecution != null)
        'activePlanExecution': activePlanExecution,
      if (description != null) 'description': description,
      if (executionRole != null) 'executionRole': executionRole,
      if (primaryRegion != null) 'primaryRegion': primaryRegion,
      if (recoveryTimeObjectiveMinutes != null)
        'recoveryTimeObjectiveMinutes': recoveryTimeObjectiveMinutes,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
      if (version != null) 'version': version,
    };
  }
}

/// @nodoc
class RecoveryApproach {
  static const activeActive = RecoveryApproach._('activeActive');
  static const activePassive = RecoveryApproach._('activePassive');

  final String value;

  const RecoveryApproach._(this.value);

  static const values = [activeActive, activePassive];

  static RecoveryApproach fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RecoveryApproach._(value));

  @override
  bool operator ==(other) => other is RecoveryApproach && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents a Region switch plan. A plan defines the steps required to shift
/// traffic from one Amazon Web Services Region to another.
///
/// @nodoc
class Plan {
  /// The Amazon Resource Name (ARN) of the plan.
  final String arn;

  /// The execution role for a plan.
  final String executionRole;

  /// The name for a plan.
  final String name;

  /// The owner of a plan.
  final String owner;

  /// The recovery approach for a Region switch plan, which can be active/active
  /// (activeActive) or active/passive (activePassive).
  final RecoveryApproach recoveryApproach;

  /// The Amazon Web Services Regions for a plan.
  final List<String> regions;

  /// The workflows for a plan.
  final List<Workflow> workflows;

  /// The associated application health alarms for a plan.
  final Map<String, AssociatedAlarm>? associatedAlarms;

  /// The description for a plan.
  final String? description;

  /// The primary Region for a plan.
  final String? primaryRegion;

  /// The recovery time objective for a plan.
  final int? recoveryTimeObjectiveMinutes;

  /// The report configuration for a plan.
  final ReportConfiguration? reportConfiguration;

  /// The triggers for a plan.
  final List<Trigger>? triggers;

  /// The timestamp when the plan was last updated.
  final DateTime? updatedAt;

  /// The version for the plan.
  final String? version;

  Plan({
    required this.arn,
    required this.executionRole,
    required this.name,
    required this.owner,
    required this.recoveryApproach,
    required this.regions,
    required this.workflows,
    this.associatedAlarms,
    this.description,
    this.primaryRegion,
    this.recoveryTimeObjectiveMinutes,
    this.reportConfiguration,
    this.triggers,
    this.updatedAt,
    this.version,
  });

  factory Plan.fromJson(Map<String, dynamic> json) {
    return Plan(
      arn: (json['arn'] as String?) ?? '',
      executionRole: (json['executionRole'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      owner: (json['owner'] as String?) ?? '',
      recoveryApproach: RecoveryApproach.fromString(
          (json['recoveryApproach'] as String?) ?? ''),
      regions: ((json['regions'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      workflows: ((json['workflows'] as List?) ?? const [])
          .nonNulls
          .map((e) => Workflow.fromJson(e as Map<String, dynamic>))
          .toList(),
      associatedAlarms: (json['associatedAlarms'] as Map<String, dynamic>?)
          ?.map((k, e) =>
              MapEntry(k, AssociatedAlarm.fromJson(e as Map<String, dynamic>))),
      description: json['description'] as String?,
      primaryRegion: json['primaryRegion'] as String?,
      recoveryTimeObjectiveMinutes:
          json['recoveryTimeObjectiveMinutes'] as int?,
      reportConfiguration: json['reportConfiguration'] != null
          ? ReportConfiguration.fromJson(
              json['reportConfiguration'] as Map<String, dynamic>)
          : null,
      triggers: (json['triggers'] as List?)
          ?.nonNulls
          .map((e) => Trigger.fromJson(e as Map<String, dynamic>))
          .toList(),
      updatedAt: timeStampFromJson(json['updatedAt']),
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final executionRole = this.executionRole;
    final name = this.name;
    final owner = this.owner;
    final recoveryApproach = this.recoveryApproach;
    final regions = this.regions;
    final workflows = this.workflows;
    final associatedAlarms = this.associatedAlarms;
    final description = this.description;
    final primaryRegion = this.primaryRegion;
    final recoveryTimeObjectiveMinutes = this.recoveryTimeObjectiveMinutes;
    final reportConfiguration = this.reportConfiguration;
    final triggers = this.triggers;
    final updatedAt = this.updatedAt;
    final version = this.version;
    return {
      'arn': arn,
      'executionRole': executionRole,
      'name': name,
      'owner': owner,
      'recoveryApproach': recoveryApproach.value,
      'regions': regions,
      'workflows': workflows,
      if (associatedAlarms != null) 'associatedAlarms': associatedAlarms,
      if (description != null) 'description': description,
      if (primaryRegion != null) 'primaryRegion': primaryRegion,
      if (recoveryTimeObjectiveMinutes != null)
        'recoveryTimeObjectiveMinutes': recoveryTimeObjectiveMinutes,
      if (reportConfiguration != null)
        'reportConfiguration': reportConfiguration,
      if (triggers != null) 'triggers': triggers,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
      if (version != null) 'version': version,
    };
  }
}

/// Configuration for automatic report generation for plan executions. When
/// configured, Region switch automatically generates a report after each plan
/// execution that includes execution events, plan configuration, and CloudWatch
/// alarm states.
///
/// @nodoc
class ReportConfiguration {
  /// The output configuration for the report.
  final List<ReportOutputConfiguration>? reportOutput;

  ReportConfiguration({
    this.reportOutput,
  });

  factory ReportConfiguration.fromJson(Map<String, dynamic> json) {
    return ReportConfiguration(
      reportOutput: (json['reportOutput'] as List?)
          ?.nonNulls
          .map((e) =>
              ReportOutputConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final reportOutput = this.reportOutput;
    return {
      if (reportOutput != null) 'reportOutput': reportOutput,
    };
  }
}

/// Configuration for report output destinations used in a Region switch plan.
///
/// @nodoc
class ReportOutputConfiguration {
  /// Configuration for delivering reports to an Amazon S3 bucket.
  final S3ReportOutputConfiguration? s3Configuration;

  ReportOutputConfiguration({
    this.s3Configuration,
  });

  factory ReportOutputConfiguration.fromJson(Map<String, dynamic> json) {
    return ReportOutputConfiguration(
      s3Configuration: json['s3Configuration'] != null
          ? S3ReportOutputConfiguration.fromJson(
              json['s3Configuration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Configuration = this.s3Configuration;
    return {
      if (s3Configuration != null) 's3Configuration': s3Configuration,
    };
  }
}

/// Configuration for delivering generated reports to an Amazon S3 bucket.
///
/// @nodoc
class S3ReportOutputConfiguration {
  /// The Amazon Web Services account ID that owns the S3 bucket. Required to
  /// ensure the bucket is still owned by the same expected owner at generation
  /// time.
  final String? bucketOwner;

  /// The S3 bucket name and optional prefix where reports are stored. Format:
  /// bucket-name or bucket-name/prefix.
  final String? bucketPath;

  S3ReportOutputConfiguration({
    this.bucketOwner,
    this.bucketPath,
  });

  factory S3ReportOutputConfiguration.fromJson(Map<String, dynamic> json) {
    return S3ReportOutputConfiguration(
      bucketOwner: json['bucketOwner'] as String?,
      bucketPath: json['bucketPath'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucketOwner = this.bucketOwner;
    final bucketPath = this.bucketPath;
    return {
      if (bucketOwner != null) 'bucketOwner': bucketOwner,
      if (bucketPath != null) 'bucketPath': bucketPath,
    };
  }
}

/// Defines a condition that can automatically trigger the execution of a Region
/// switch plan.
///
/// @nodoc
class Trigger {
  /// The action to perform when the trigger fires. Valid values include
  /// <code>activate</code> and <code>deactivate</code>.
  final WorkflowTargetAction action;

  /// The conditions that must be met for the trigger to fire.
  final List<TriggerCondition> conditions;

  /// The minimum time, in minutes, that must elapse between automatic executions
  /// of the plan.
  final int minDelayMinutesBetweenExecutions;

  /// The Amazon Web Services Region for a trigger.
  final String targetRegion;

  /// The description for a trigger.
  final String? description;

  Trigger({
    required this.action,
    required this.conditions,
    required this.minDelayMinutesBetweenExecutions,
    required this.targetRegion,
    this.description,
  });

  factory Trigger.fromJson(Map<String, dynamic> json) {
    return Trigger(
      action:
          WorkflowTargetAction.fromString((json['action'] as String?) ?? ''),
      conditions: ((json['conditions'] as List?) ?? const [])
          .nonNulls
          .map((e) => TriggerCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
      minDelayMinutesBetweenExecutions:
          (json['minDelayMinutesBetweenExecutions'] as int?) ?? 0,
      targetRegion: (json['targetRegion'] as String?) ?? '',
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final conditions = this.conditions;
    final minDelayMinutesBetweenExecutions =
        this.minDelayMinutesBetweenExecutions;
    final targetRegion = this.targetRegion;
    final description = this.description;
    return {
      'action': action.value,
      'conditions': conditions,
      'minDelayMinutesBetweenExecutions': minDelayMinutesBetweenExecutions,
      'targetRegion': targetRegion,
      if (description != null) 'description': description,
    };
  }
}

/// @nodoc
class WorkflowTargetAction {
  static const activate = WorkflowTargetAction._('activate');
  static const deactivate = WorkflowTargetAction._('deactivate');
  static const postRecovery = WorkflowTargetAction._('postRecovery');

  final String value;

  const WorkflowTargetAction._(this.value);

  static const values = [activate, deactivate, postRecovery];

  static WorkflowTargetAction fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => WorkflowTargetAction._(value));

  @override
  bool operator ==(other) =>
      other is WorkflowTargetAction && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Defines a condition that must be met for a trigger to fire.
///
/// @nodoc
class TriggerCondition {
  /// The name of the CloudWatch alarm associated with the condition.
  final String associatedAlarmName;

  /// The condition that must be met. Valid values include <code>green</code> and
  /// <code>red</code>.
  final AlarmCondition condition;

  TriggerCondition({
    required this.associatedAlarmName,
    required this.condition,
  });

  factory TriggerCondition.fromJson(Map<String, dynamic> json) {
    return TriggerCondition(
      associatedAlarmName: (json['associatedAlarmName'] as String?) ?? '',
      condition:
          AlarmCondition.fromString((json['condition'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final associatedAlarmName = this.associatedAlarmName;
    final condition = this.condition;
    return {
      'associatedAlarmName': associatedAlarmName,
      'condition': condition.value,
    };
  }
}

/// @nodoc
class AlarmCondition {
  static const red = AlarmCondition._('red');
  static const green = AlarmCondition._('green');

  final String value;

  const AlarmCondition._(this.value);

  static const values = [red, green];

  static AlarmCondition fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AlarmCondition._(value));

  @override
  bool operator ==(other) => other is AlarmCondition && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An Amazon CloudWatch alarm associated with a Region switch plan. These
/// alarms can be used to trigger automatic execution of the plan.
///
/// @nodoc
class AssociatedAlarm {
  /// The alarm type for an associated alarm. An associated CloudWatch alarm can
  /// be an application health alarm or a trigger alarm.
  final AlarmType alarmType;

  /// The resource identifier for alarms that you associate with a plan.
  final String resourceIdentifier;

  /// The cross account role for the configuration.
  final String? crossAccountRole;

  /// The external ID (secret key) for the configuration.
  final String? externalId;

  AssociatedAlarm({
    required this.alarmType,
    required this.resourceIdentifier,
    this.crossAccountRole,
    this.externalId,
  });

  factory AssociatedAlarm.fromJson(Map<String, dynamic> json) {
    return AssociatedAlarm(
      alarmType: AlarmType.fromString((json['alarmType'] as String?) ?? ''),
      resourceIdentifier: (json['resourceIdentifier'] as String?) ?? '',
      crossAccountRole: json['crossAccountRole'] as String?,
      externalId: json['externalId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final alarmType = this.alarmType;
    final resourceIdentifier = this.resourceIdentifier;
    final crossAccountRole = this.crossAccountRole;
    final externalId = this.externalId;
    return {
      'alarmType': alarmType.value,
      'resourceIdentifier': resourceIdentifier,
      if (crossAccountRole != null) 'crossAccountRole': crossAccountRole,
      if (externalId != null) 'externalId': externalId,
    };
  }
}

/// @nodoc
class AlarmType {
  static const applicationHealth = AlarmType._('applicationHealth');
  static const trigger = AlarmType._('trigger');

  final String value;

  const AlarmType._(this.value);

  static const values = [applicationHealth, trigger];

  static AlarmType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => AlarmType._(value));

  @override
  bool operator ==(other) => other is AlarmType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents a workflow in a Region switch plan. A workflow defines a sequence
/// of steps to execute during a Region switch.
///
/// @nodoc
class Workflow {
  /// The action that the workflow performs. Valid values include
  /// <code>activate</code> and <code>deactivate</code>.
  final WorkflowTargetAction workflowTargetAction;

  /// The steps that make up the workflow.
  final List<Step>? steps;

  /// The description of the workflow.
  final String? workflowDescription;

  /// The Amazon Web Services Region that the workflow targets.
  final String? workflowTargetRegion;

  Workflow({
    required this.workflowTargetAction,
    this.steps,
    this.workflowDescription,
    this.workflowTargetRegion,
  });

  factory Workflow.fromJson(Map<String, dynamic> json) {
    return Workflow(
      workflowTargetAction: WorkflowTargetAction.fromString(
          (json['workflowTargetAction'] as String?) ?? ''),
      steps: (json['steps'] as List?)
          ?.nonNulls
          .map((e) => Step.fromJson(e as Map<String, dynamic>))
          .toList(),
      workflowDescription: json['workflowDescription'] as String?,
      workflowTargetRegion: json['workflowTargetRegion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final workflowTargetAction = this.workflowTargetAction;
    final steps = this.steps;
    final workflowDescription = this.workflowDescription;
    final workflowTargetRegion = this.workflowTargetRegion;
    return {
      'workflowTargetAction': workflowTargetAction.value,
      if (steps != null) 'steps': steps,
      if (workflowDescription != null)
        'workflowDescription': workflowDescription,
      if (workflowTargetRegion != null)
        'workflowTargetRegion': workflowTargetRegion,
    };
  }
}

/// Represents a step in a Region switch plan workflow. Each step performs a
/// specific action during the Region switch process.
///
/// @nodoc
class Step {
  /// The configuration for an execution block in a workflow.
  final ExecutionBlockConfiguration executionBlockConfiguration;

  /// The type of an execution block in a workflow.
  final ExecutionBlockType executionBlockType;

  /// The name of a step in a workflow.
  final String name;

  /// The description of a step in a workflow.
  final String? description;

  Step({
    required this.executionBlockConfiguration,
    required this.executionBlockType,
    required this.name,
    this.description,
  });

  factory Step.fromJson(Map<String, dynamic> json) {
    return Step(
      executionBlockConfiguration: ExecutionBlockConfiguration.fromJson(
          (json['executionBlockConfiguration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      executionBlockType: ExecutionBlockType.fromString(
          (json['executionBlockType'] as String?) ?? ''),
      name: (json['name'] as String?) ?? '',
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final executionBlockConfiguration = this.executionBlockConfiguration;
    final executionBlockType = this.executionBlockType;
    final name = this.name;
    final description = this.description;
    return {
      'executionBlockConfiguration': executionBlockConfiguration,
      'executionBlockType': executionBlockType.value,
      'name': name,
      if (description != null) 'description': description,
    };
  }
}

/// Execution block configurations for a workflow in a Region switch plan. An
/// execution block represents a specific type of action to perform during a
/// Region switch.
///
/// @nodoc
class ExecutionBlockConfiguration {
  /// An ARC routing control execution block.
  final ArcRoutingControlConfiguration? arcRoutingControlConfig;

  /// An Aurora provisioned cluster scaling execution block.
  final AuroraProvisionedScalingConfiguration? auroraProvisionedScalingConfig;

  /// An Aurora Serverless scaling execution block.
  final AuroraServerlessScalingConfiguration? auroraServerlessScalingConfig;

  /// An Amazon Web Services Lambda execution block.
  final CustomActionLambdaConfiguration? customActionLambdaConfig;
  final DocumentDbConfiguration? documentDbConfig;

  /// An EC2 Auto Scaling group execution block.
  final Ec2AsgCapacityIncreaseConfiguration? ec2AsgCapacityIncreaseConfig;

  /// The capacity increase specified for the configuration.
  final EcsCapacityIncreaseConfiguration? ecsCapacityIncreaseConfig;

  /// An Amazon Web Services EKS resource scaling execution block.
  final EksResourceScalingConfiguration? eksResourceScalingConfig;

  /// A manual approval execution block.
  final ExecutionApprovalConfiguration? executionApprovalConfig;

  /// An Aurora Global Database execution block.
  final GlobalAuroraConfiguration? globalAuroraConfig;

  /// A Lambda event source mapping execution block.
  final LambdaEventSourceMappingConfiguration? lambdaEventSourceMappingConfig;

  /// A Neptune global database execution block.
  final NeptuneGlobalDatabaseConfiguration? neptuneGlobalDatabaseConfig;

  /// A parallel configuration execution block.
  final ParallelExecutionBlockConfiguration? parallelConfig;

  /// An Amazon RDS create cross-Region replica execution block.
  final RdsCreateCrossRegionReplicaConfiguration?
      rdsCreateCrossRegionReadReplicaConfig;

  /// An Amazon RDS promote read replica execution block.
  final RdsPromoteReadReplicaConfiguration? rdsPromoteReadReplicaConfig;

  /// A Region switch plan execution block.
  final RegionSwitchPlanConfiguration? regionSwitchPlanConfig;

  /// The Amazon Route 53 health check configuration.
  final Route53HealthCheckConfiguration? route53HealthCheckConfig;

  ExecutionBlockConfiguration({
    this.arcRoutingControlConfig,
    this.auroraProvisionedScalingConfig,
    this.auroraServerlessScalingConfig,
    this.customActionLambdaConfig,
    this.documentDbConfig,
    this.ec2AsgCapacityIncreaseConfig,
    this.ecsCapacityIncreaseConfig,
    this.eksResourceScalingConfig,
    this.executionApprovalConfig,
    this.globalAuroraConfig,
    this.lambdaEventSourceMappingConfig,
    this.neptuneGlobalDatabaseConfig,
    this.parallelConfig,
    this.rdsCreateCrossRegionReadReplicaConfig,
    this.rdsPromoteReadReplicaConfig,
    this.regionSwitchPlanConfig,
    this.route53HealthCheckConfig,
  });

  factory ExecutionBlockConfiguration.fromJson(Map<String, dynamic> json) {
    return ExecutionBlockConfiguration(
      arcRoutingControlConfig: json['arcRoutingControlConfig'] != null
          ? ArcRoutingControlConfiguration.fromJson(
              json['arcRoutingControlConfig'] as Map<String, dynamic>)
          : null,
      auroraProvisionedScalingConfig: json['auroraProvisionedScalingConfig'] !=
              null
          ? AuroraProvisionedScalingConfiguration.fromJson(
              json['auroraProvisionedScalingConfig'] as Map<String, dynamic>)
          : null,
      auroraServerlessScalingConfig:
          json['auroraServerlessScalingConfig'] != null
              ? AuroraServerlessScalingConfiguration.fromJson(
                  json['auroraServerlessScalingConfig'] as Map<String, dynamic>)
              : null,
      customActionLambdaConfig: json['customActionLambdaConfig'] != null
          ? CustomActionLambdaConfiguration.fromJson(
              json['customActionLambdaConfig'] as Map<String, dynamic>)
          : null,
      documentDbConfig: json['documentDbConfig'] != null
          ? DocumentDbConfiguration.fromJson(
              json['documentDbConfig'] as Map<String, dynamic>)
          : null,
      ec2AsgCapacityIncreaseConfig: json['ec2AsgCapacityIncreaseConfig'] != null
          ? Ec2AsgCapacityIncreaseConfiguration.fromJson(
              json['ec2AsgCapacityIncreaseConfig'] as Map<String, dynamic>)
          : null,
      ecsCapacityIncreaseConfig: json['ecsCapacityIncreaseConfig'] != null
          ? EcsCapacityIncreaseConfiguration.fromJson(
              json['ecsCapacityIncreaseConfig'] as Map<String, dynamic>)
          : null,
      eksResourceScalingConfig: json['eksResourceScalingConfig'] != null
          ? EksResourceScalingConfiguration.fromJson(
              json['eksResourceScalingConfig'] as Map<String, dynamic>)
          : null,
      executionApprovalConfig: json['executionApprovalConfig'] != null
          ? ExecutionApprovalConfiguration.fromJson(
              json['executionApprovalConfig'] as Map<String, dynamic>)
          : null,
      globalAuroraConfig: json['globalAuroraConfig'] != null
          ? GlobalAuroraConfiguration.fromJson(
              json['globalAuroraConfig'] as Map<String, dynamic>)
          : null,
      lambdaEventSourceMappingConfig: json['lambdaEventSourceMappingConfig'] !=
              null
          ? LambdaEventSourceMappingConfiguration.fromJson(
              json['lambdaEventSourceMappingConfig'] as Map<String, dynamic>)
          : null,
      neptuneGlobalDatabaseConfig: json['neptuneGlobalDatabaseConfig'] != null
          ? NeptuneGlobalDatabaseConfiguration.fromJson(
              json['neptuneGlobalDatabaseConfig'] as Map<String, dynamic>)
          : null,
      parallelConfig: json['parallelConfig'] != null
          ? ParallelExecutionBlockConfiguration.fromJson(
              json['parallelConfig'] as Map<String, dynamic>)
          : null,
      rdsCreateCrossRegionReadReplicaConfig:
          json['rdsCreateCrossRegionReadReplicaConfig'] != null
              ? RdsCreateCrossRegionReplicaConfiguration.fromJson(
                  json['rdsCreateCrossRegionReadReplicaConfig']
                      as Map<String, dynamic>)
              : null,
      rdsPromoteReadReplicaConfig: json['rdsPromoteReadReplicaConfig'] != null
          ? RdsPromoteReadReplicaConfiguration.fromJson(
              json['rdsPromoteReadReplicaConfig'] as Map<String, dynamic>)
          : null,
      regionSwitchPlanConfig: json['regionSwitchPlanConfig'] != null
          ? RegionSwitchPlanConfiguration.fromJson(
              json['regionSwitchPlanConfig'] as Map<String, dynamic>)
          : null,
      route53HealthCheckConfig: json['route53HealthCheckConfig'] != null
          ? Route53HealthCheckConfiguration.fromJson(
              json['route53HealthCheckConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arcRoutingControlConfig = this.arcRoutingControlConfig;
    final auroraProvisionedScalingConfig = this.auroraProvisionedScalingConfig;
    final auroraServerlessScalingConfig = this.auroraServerlessScalingConfig;
    final customActionLambdaConfig = this.customActionLambdaConfig;
    final documentDbConfig = this.documentDbConfig;
    final ec2AsgCapacityIncreaseConfig = this.ec2AsgCapacityIncreaseConfig;
    final ecsCapacityIncreaseConfig = this.ecsCapacityIncreaseConfig;
    final eksResourceScalingConfig = this.eksResourceScalingConfig;
    final executionApprovalConfig = this.executionApprovalConfig;
    final globalAuroraConfig = this.globalAuroraConfig;
    final lambdaEventSourceMappingConfig = this.lambdaEventSourceMappingConfig;
    final neptuneGlobalDatabaseConfig = this.neptuneGlobalDatabaseConfig;
    final parallelConfig = this.parallelConfig;
    final rdsCreateCrossRegionReadReplicaConfig =
        this.rdsCreateCrossRegionReadReplicaConfig;
    final rdsPromoteReadReplicaConfig = this.rdsPromoteReadReplicaConfig;
    final regionSwitchPlanConfig = this.regionSwitchPlanConfig;
    final route53HealthCheckConfig = this.route53HealthCheckConfig;
    return {
      if (arcRoutingControlConfig != null)
        'arcRoutingControlConfig': arcRoutingControlConfig,
      if (auroraProvisionedScalingConfig != null)
        'auroraProvisionedScalingConfig': auroraProvisionedScalingConfig,
      if (auroraServerlessScalingConfig != null)
        'auroraServerlessScalingConfig': auroraServerlessScalingConfig,
      if (customActionLambdaConfig != null)
        'customActionLambdaConfig': customActionLambdaConfig,
      if (documentDbConfig != null) 'documentDbConfig': documentDbConfig,
      if (ec2AsgCapacityIncreaseConfig != null)
        'ec2AsgCapacityIncreaseConfig': ec2AsgCapacityIncreaseConfig,
      if (ecsCapacityIncreaseConfig != null)
        'ecsCapacityIncreaseConfig': ecsCapacityIncreaseConfig,
      if (eksResourceScalingConfig != null)
        'eksResourceScalingConfig': eksResourceScalingConfig,
      if (executionApprovalConfig != null)
        'executionApprovalConfig': executionApprovalConfig,
      if (globalAuroraConfig != null) 'globalAuroraConfig': globalAuroraConfig,
      if (lambdaEventSourceMappingConfig != null)
        'lambdaEventSourceMappingConfig': lambdaEventSourceMappingConfig,
      if (neptuneGlobalDatabaseConfig != null)
        'neptuneGlobalDatabaseConfig': neptuneGlobalDatabaseConfig,
      if (parallelConfig != null) 'parallelConfig': parallelConfig,
      if (rdsCreateCrossRegionReadReplicaConfig != null)
        'rdsCreateCrossRegionReadReplicaConfig':
            rdsCreateCrossRegionReadReplicaConfig,
      if (rdsPromoteReadReplicaConfig != null)
        'rdsPromoteReadReplicaConfig': rdsPromoteReadReplicaConfig,
      if (regionSwitchPlanConfig != null)
        'regionSwitchPlanConfig': regionSwitchPlanConfig,
      if (route53HealthCheckConfig != null)
        'route53HealthCheckConfig': route53HealthCheckConfig,
    };
  }
}

/// @nodoc
class ExecutionBlockType {
  static const customActionLambda = ExecutionBlockType._('CustomActionLambda');
  static const manualApproval = ExecutionBlockType._('ManualApproval');
  static const auroraGlobalDatabase =
      ExecutionBlockType._('AuroraGlobalDatabase');
  static const eC2AutoScaling = ExecutionBlockType._('EC2AutoScaling');
  static const aRCRoutingControl = ExecutionBlockType._('ARCRoutingControl');
  static const aRCRegionSwitchPlan =
      ExecutionBlockType._('ARCRegionSwitchPlan');
  static const parallel = ExecutionBlockType._('Parallel');
  static const eCSServiceScaling = ExecutionBlockType._('ECSServiceScaling');
  static const eKSResourceScaling = ExecutionBlockType._('EKSResourceScaling');
  static const route53HealthCheck = ExecutionBlockType._('Route53HealthCheck');
  static const documentDb = ExecutionBlockType._('DocumentDb');
  static const rdsPromoteReadReplica =
      ExecutionBlockType._('RdsPromoteReadReplica');
  static const rdsCreateCrossRegionReplica =
      ExecutionBlockType._('RdsCreateCrossRegionReplica');
  static const lambdaEventSourceMapping =
      ExecutionBlockType._('LambdaEventSourceMapping');
  static const auroraServerlessScaling =
      ExecutionBlockType._('AuroraServerlessScaling');
  static const auroraProvisionedScaling =
      ExecutionBlockType._('AuroraProvisionedScaling');
  static const neptuneGlobalDatabase =
      ExecutionBlockType._('NeptuneGlobalDatabase');

  final String value;

  const ExecutionBlockType._(this.value);

  static const values = [
    customActionLambda,
    manualApproval,
    auroraGlobalDatabase,
    eC2AutoScaling,
    aRCRoutingControl,
    aRCRegionSwitchPlan,
    parallel,
    eCSServiceScaling,
    eKSResourceScaling,
    route53HealthCheck,
    documentDb,
    rdsPromoteReadReplica,
    rdsCreateCrossRegionReplica,
    lambdaEventSourceMapping,
    auroraServerlessScaling,
    auroraProvisionedScaling,
    neptuneGlobalDatabase
  ];

  static ExecutionBlockType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ExecutionBlockType._(value));

  @override
  bool operator ==(other) =>
      other is ExecutionBlockType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Configuration for Amazon Web Services Lambda functions that perform custom
/// actions during a Region switch.
///
/// @nodoc
class CustomActionLambdaConfiguration {
  /// The Amazon Web Services Lambda functions for the execution block.
  final List<Lambdas> lambdas;

  /// The Amazon Web Services Region for the function to run in. For recovery
  /// workflows use <code>activatingRegion</code> or
  /// <code>deactivatingRegion</code>. For post-recovery workflows, use
  /// <code>activeRegion</code> (the Region with customer traffic) or
  /// <code>inactiveRegion</code> (the Region with no customer traffic).
  final RegionToRunIn regionToRun;

  /// The retry interval specified.
  final double retryIntervalMinutes;

  /// The timeout value specified for the configuration.
  final int? timeoutMinutes;

  /// The settings for ungraceful execution.
  final LambdaUngraceful? ungraceful;

  CustomActionLambdaConfiguration({
    required this.lambdas,
    required this.regionToRun,
    required this.retryIntervalMinutes,
    this.timeoutMinutes,
    this.ungraceful,
  });

  factory CustomActionLambdaConfiguration.fromJson(Map<String, dynamic> json) {
    return CustomActionLambdaConfiguration(
      lambdas: ((json['lambdas'] as List?) ?? const [])
          .nonNulls
          .map((e) => Lambdas.fromJson(e as Map<String, dynamic>))
          .toList(),
      regionToRun:
          RegionToRunIn.fromString((json['regionToRun'] as String?) ?? ''),
      retryIntervalMinutes:
          _s.parseJsonDouble(json['retryIntervalMinutes']) ?? 0,
      timeoutMinutes: json['timeoutMinutes'] as int?,
      ungraceful: json['ungraceful'] != null
          ? LambdaUngraceful.fromJson(
              json['ungraceful'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final lambdas = this.lambdas;
    final regionToRun = this.regionToRun;
    final retryIntervalMinutes = this.retryIntervalMinutes;
    final timeoutMinutes = this.timeoutMinutes;
    final ungraceful = this.ungraceful;
    return {
      'lambdas': lambdas,
      'regionToRun': regionToRun.value,
      'retryIntervalMinutes': _s.encodeJsonDouble(retryIntervalMinutes),
      if (timeoutMinutes != null) 'timeoutMinutes': timeoutMinutes,
      if (ungraceful != null) 'ungraceful': ungraceful,
    };
  }
}

/// Configuration for increasing the capacity of Amazon EC2 Auto Scaling groups
/// during a Region switch.
///
/// @nodoc
class Ec2AsgCapacityIncreaseConfiguration {
  /// The EC2 Auto Scaling groups for the configuration.
  final List<Asg> asgs;

  /// The monitoring approach that you specify EC2 Auto Scaling groups for the
  /// configuration.
  final Ec2AsgCapacityMonitoringApproach? capacityMonitoringApproach;

  /// The target percentage that you specify for EC2 Auto Scaling groups. The
  /// default is 100.
  final int? targetPercent;

  /// The timeout value specified for the configuration.
  final int? timeoutMinutes;

  /// The settings for ungraceful execution.
  final Ec2Ungraceful? ungraceful;

  Ec2AsgCapacityIncreaseConfiguration({
    required this.asgs,
    this.capacityMonitoringApproach,
    this.targetPercent,
    this.timeoutMinutes,
    this.ungraceful,
  });

  factory Ec2AsgCapacityIncreaseConfiguration.fromJson(
      Map<String, dynamic> json) {
    return Ec2AsgCapacityIncreaseConfiguration(
      asgs: ((json['asgs'] as List?) ?? const [])
          .nonNulls
          .map((e) => Asg.fromJson(e as Map<String, dynamic>))
          .toList(),
      capacityMonitoringApproach:
          (json['capacityMonitoringApproach'] as String?)
              ?.let(Ec2AsgCapacityMonitoringApproach.fromString),
      targetPercent: json['targetPercent'] as int?,
      timeoutMinutes: json['timeoutMinutes'] as int?,
      ungraceful: json['ungraceful'] != null
          ? Ec2Ungraceful.fromJson(json['ungraceful'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final asgs = this.asgs;
    final capacityMonitoringApproach = this.capacityMonitoringApproach;
    final targetPercent = this.targetPercent;
    final timeoutMinutes = this.timeoutMinutes;
    final ungraceful = this.ungraceful;
    return {
      'asgs': asgs,
      if (capacityMonitoringApproach != null)
        'capacityMonitoringApproach': capacityMonitoringApproach.value,
      if (targetPercent != null) 'targetPercent': targetPercent,
      if (timeoutMinutes != null) 'timeoutMinutes': timeoutMinutes,
      if (ungraceful != null) 'ungraceful': ungraceful,
    };
  }
}

/// Configuration for approval steps in a Region switch plan execution. Approval
/// steps require manual intervention before the execution can proceed.
///
/// @nodoc
class ExecutionApprovalConfiguration {
  /// The IAM approval role for the configuration.
  final String approvalRole;

  /// The timeout value specified for the configuration.
  final int? timeoutMinutes;

  ExecutionApprovalConfiguration({
    required this.approvalRole,
    this.timeoutMinutes,
  });

  factory ExecutionApprovalConfiguration.fromJson(Map<String, dynamic> json) {
    return ExecutionApprovalConfiguration(
      approvalRole: (json['approvalRole'] as String?) ?? '',
      timeoutMinutes: json['timeoutMinutes'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final approvalRole = this.approvalRole;
    final timeoutMinutes = this.timeoutMinutes;
    return {
      'approvalRole': approvalRole,
      if (timeoutMinutes != null) 'timeoutMinutes': timeoutMinutes,
    };
  }
}

/// Configuration for ARC routing controls used in a Region switch plan. Routing
/// controls are simple on/off switches that you can use to shift traffic away
/// from an impaired Region.
///
/// @nodoc
class ArcRoutingControlConfiguration {
  /// The Region and ARC routing controls for the configuration.
  final Map<String, List<ArcRoutingControlState>> regionAndRoutingControls;

  /// The cross account role for the configuration.
  final String? crossAccountRole;

  /// The external ID (secret key) for the configuration.
  final String? externalId;

  /// The timeout value specified for the configuration.
  final int? timeoutMinutes;

  ArcRoutingControlConfiguration({
    required this.regionAndRoutingControls,
    this.crossAccountRole,
    this.externalId,
    this.timeoutMinutes,
  });

  factory ArcRoutingControlConfiguration.fromJson(Map<String, dynamic> json) {
    return ArcRoutingControlConfiguration(
      regionAndRoutingControls:
          ((json['regionAndRoutingControls'] as Map<String, dynamic>?) ??
                  const <String, dynamic>{})
              .map((k, e) => MapEntry(
                  k,
                  (e as List)
                      .nonNulls
                      .map((e) => ArcRoutingControlState.fromJson(
                          e as Map<String, dynamic>))
                      .toList())),
      crossAccountRole: json['crossAccountRole'] as String?,
      externalId: json['externalId'] as String?,
      timeoutMinutes: json['timeoutMinutes'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final regionAndRoutingControls = this.regionAndRoutingControls;
    final crossAccountRole = this.crossAccountRole;
    final externalId = this.externalId;
    final timeoutMinutes = this.timeoutMinutes;
    return {
      'regionAndRoutingControls': regionAndRoutingControls,
      if (crossAccountRole != null) 'crossAccountRole': crossAccountRole,
      if (externalId != null) 'externalId': externalId,
      if (timeoutMinutes != null) 'timeoutMinutes': timeoutMinutes,
    };
  }
}

/// Configuration for Amazon Aurora global databases used in a Region switch
/// plan.
///
/// @nodoc
class GlobalAuroraConfiguration {
  /// The behavior for a global database, that is, only allow switchover or also
  /// allow failover.
  final GlobalAuroraDefaultBehavior behavior;

  /// The database cluster Amazon Resource Names (ARNs) for a global database.
  final List<String> databaseClusterArns;

  /// The global cluster identifier for a global database.
  final String globalClusterIdentifier;

  /// The cross account role for the configuration.
  final String? crossAccountRole;

  /// The external ID (secret key) for the configuration.
  final String? externalId;

  /// The timeout value specified for the configuration.
  final int? timeoutMinutes;

  /// The settings for ungraceful execution.
  final GlobalAuroraUngraceful? ungraceful;

  GlobalAuroraConfiguration({
    required this.behavior,
    required this.databaseClusterArns,
    required this.globalClusterIdentifier,
    this.crossAccountRole,
    this.externalId,
    this.timeoutMinutes,
    this.ungraceful,
  });

  factory GlobalAuroraConfiguration.fromJson(Map<String, dynamic> json) {
    return GlobalAuroraConfiguration(
      behavior: GlobalAuroraDefaultBehavior.fromString(
          (json['behavior'] as String?) ?? ''),
      databaseClusterArns: ((json['databaseClusterArns'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      globalClusterIdentifier:
          (json['globalClusterIdentifier'] as String?) ?? '',
      crossAccountRole: json['crossAccountRole'] as String?,
      externalId: json['externalId'] as String?,
      timeoutMinutes: json['timeoutMinutes'] as int?,
      ungraceful: json['ungraceful'] != null
          ? GlobalAuroraUngraceful.fromJson(
              json['ungraceful'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final behavior = this.behavior;
    final databaseClusterArns = this.databaseClusterArns;
    final globalClusterIdentifier = this.globalClusterIdentifier;
    final crossAccountRole = this.crossAccountRole;
    final externalId = this.externalId;
    final timeoutMinutes = this.timeoutMinutes;
    final ungraceful = this.ungraceful;
    return {
      'behavior': behavior.value,
      'databaseClusterArns': databaseClusterArns,
      'globalClusterIdentifier': globalClusterIdentifier,
      if (crossAccountRole != null) 'crossAccountRole': crossAccountRole,
      if (externalId != null) 'externalId': externalId,
      if (timeoutMinutes != null) 'timeoutMinutes': timeoutMinutes,
      if (ungraceful != null) 'ungraceful': ungraceful,
    };
  }
}

/// Configuration for steps that should be executed in parallel during a Region
/// switch.
///
/// @nodoc
class ParallelExecutionBlockConfiguration {
  /// The steps for a parallel execution block.
  final List<Step> steps;

  ParallelExecutionBlockConfiguration({
    required this.steps,
  });

  factory ParallelExecutionBlockConfiguration.fromJson(
      Map<String, dynamic> json) {
    return ParallelExecutionBlockConfiguration(
      steps: ((json['steps'] as List?) ?? const [])
          .nonNulls
          .map((e) => Step.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final steps = this.steps;
    return {
      'steps': steps,
    };
  }
}

/// Configuration for nested Region switch plans. This allows one Region switch
/// plan to trigger another plan as part of its execution.
///
/// @nodoc
class RegionSwitchPlanConfiguration {
  /// The Amazon Resource Name (ARN) of the plan configuration.
  final String arn;

  /// The cross account role for the configuration.
  final String? crossAccountRole;

  /// The external ID (secret key) for the configuration.
  final String? externalId;

  RegionSwitchPlanConfiguration({
    required this.arn,
    this.crossAccountRole,
    this.externalId,
  });

  factory RegionSwitchPlanConfiguration.fromJson(Map<String, dynamic> json) {
    return RegionSwitchPlanConfiguration(
      arn: (json['arn'] as String?) ?? '',
      crossAccountRole: json['crossAccountRole'] as String?,
      externalId: json['externalId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final crossAccountRole = this.crossAccountRole;
    final externalId = this.externalId;
    return {
      'arn': arn,
      if (crossAccountRole != null) 'crossAccountRole': crossAccountRole,
      if (externalId != null) 'externalId': externalId,
    };
  }
}

/// The configuration for an Amazon Web Services ECS capacity increase.
///
/// @nodoc
class EcsCapacityIncreaseConfiguration {
  /// The services specified for the configuration.
  final List<Service> services;

  /// The monitoring approach specified for the configuration, for example,
  /// <code>Most_Recent</code>.
  final EcsCapacityMonitoringApproach? capacityMonitoringApproach;

  /// The target percentage specified for the configuration. The default is 100.
  final int? targetPercent;

  /// The timeout value specified for the configuration.
  final int? timeoutMinutes;

  /// The settings for ungraceful execution.
  final EcsUngraceful? ungraceful;

  EcsCapacityIncreaseConfiguration({
    required this.services,
    this.capacityMonitoringApproach,
    this.targetPercent,
    this.timeoutMinutes,
    this.ungraceful,
  });

  factory EcsCapacityIncreaseConfiguration.fromJson(Map<String, dynamic> json) {
    return EcsCapacityIncreaseConfiguration(
      services: ((json['services'] as List?) ?? const [])
          .nonNulls
          .map((e) => Service.fromJson(e as Map<String, dynamic>))
          .toList(),
      capacityMonitoringApproach:
          (json['capacityMonitoringApproach'] as String?)
              ?.let(EcsCapacityMonitoringApproach.fromString),
      targetPercent: json['targetPercent'] as int?,
      timeoutMinutes: json['timeoutMinutes'] as int?,
      ungraceful: json['ungraceful'] != null
          ? EcsUngraceful.fromJson(json['ungraceful'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final services = this.services;
    final capacityMonitoringApproach = this.capacityMonitoringApproach;
    final targetPercent = this.targetPercent;
    final timeoutMinutes = this.timeoutMinutes;
    final ungraceful = this.ungraceful;
    return {
      'services': services,
      if (capacityMonitoringApproach != null)
        'capacityMonitoringApproach': capacityMonitoringApproach.value,
      if (targetPercent != null) 'targetPercent': targetPercent,
      if (timeoutMinutes != null) 'timeoutMinutes': timeoutMinutes,
      if (ungraceful != null) 'ungraceful': ungraceful,
    };
  }
}

/// The Amazon Web Services EKS resource scaling configuration.
///
/// @nodoc
class EksResourceScalingConfiguration {
  /// The Kubernetes resource type for the configuration.
  final KubernetesResourceType kubernetesResourceType;

  /// The monitoring approach for the configuration, that is, whether it was
  /// sampled in the last 24 hours or autoscaled in the last 24 hours.
  final EksCapacityMonitoringApproach? capacityMonitoringApproach;

  /// The clusters for the configuration.
  final List<EksCluster>? eksClusters;

  /// The scaling resources for the configuration.
  final List<Map<String, Map<String, KubernetesScalingResource>>>?
      scalingResources;

  /// The target percentage for the configuration. The default is 100.
  final int? targetPercent;

  /// The timeout value specified for the configuration.
  final int? timeoutMinutes;

  /// The settings for ungraceful execution.
  final EksResourceScalingUngraceful? ungraceful;

  EksResourceScalingConfiguration({
    required this.kubernetesResourceType,
    this.capacityMonitoringApproach,
    this.eksClusters,
    this.scalingResources,
    this.targetPercent,
    this.timeoutMinutes,
    this.ungraceful,
  });

  factory EksResourceScalingConfiguration.fromJson(Map<String, dynamic> json) {
    return EksResourceScalingConfiguration(
      kubernetesResourceType: KubernetesResourceType.fromJson(
          (json['kubernetesResourceType'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      capacityMonitoringApproach:
          (json['capacityMonitoringApproach'] as String?)
              ?.let(EksCapacityMonitoringApproach.fromString),
      eksClusters: (json['eksClusters'] as List?)
          ?.nonNulls
          .map((e) => EksCluster.fromJson(e as Map<String, dynamic>))
          .toList(),
      scalingResources: (json['scalingResources'] as List?)
          ?.nonNulls
          .map((e) => (e as Map<String, dynamic>).map((k, e) => MapEntry(
              k,
              (e as Map<String, dynamic>).map((k, e) => MapEntry(
                  k,
                  KubernetesScalingResource.fromJson(
                      e as Map<String, dynamic>))))))
          .toList(),
      targetPercent: json['targetPercent'] as int?,
      timeoutMinutes: json['timeoutMinutes'] as int?,
      ungraceful: json['ungraceful'] != null
          ? EksResourceScalingUngraceful.fromJson(
              json['ungraceful'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final kubernetesResourceType = this.kubernetesResourceType;
    final capacityMonitoringApproach = this.capacityMonitoringApproach;
    final eksClusters = this.eksClusters;
    final scalingResources = this.scalingResources;
    final targetPercent = this.targetPercent;
    final timeoutMinutes = this.timeoutMinutes;
    final ungraceful = this.ungraceful;
    return {
      'kubernetesResourceType': kubernetesResourceType,
      if (capacityMonitoringApproach != null)
        'capacityMonitoringApproach': capacityMonitoringApproach.value,
      if (eksClusters != null) 'eksClusters': eksClusters,
      if (scalingResources != null) 'scalingResources': scalingResources,
      if (targetPercent != null) 'targetPercent': targetPercent,
      if (timeoutMinutes != null) 'timeoutMinutes': timeoutMinutes,
      if (ungraceful != null) 'ungraceful': ungraceful,
    };
  }
}

/// The Amazon Route 53 health check configuration.
///
/// @nodoc
class Route53HealthCheckConfiguration {
  /// The Amazon Route 53 health check configuration hosted zone ID.
  final String hostedZoneId;

  /// The Amazon Route 53 health check configuration record name.
  final String recordName;

  /// The cross account role for the configuration.
  final String? crossAccountRole;

  /// The external ID (secret key) for the configuration.
  final String? externalId;

  /// The Amazon Route 53 health check configuration record sets.
  final List<Route53ResourceRecordSet>? recordSets;

  /// The Amazon Route 53 health check configuration time out (in minutes).
  final int? timeoutMinutes;

  Route53HealthCheckConfiguration({
    required this.hostedZoneId,
    required this.recordName,
    this.crossAccountRole,
    this.externalId,
    this.recordSets,
    this.timeoutMinutes,
  });

  factory Route53HealthCheckConfiguration.fromJson(Map<String, dynamic> json) {
    return Route53HealthCheckConfiguration(
      hostedZoneId: (json['hostedZoneId'] as String?) ?? '',
      recordName: (json['recordName'] as String?) ?? '',
      crossAccountRole: json['crossAccountRole'] as String?,
      externalId: json['externalId'] as String?,
      recordSets: (json['recordSets'] as List?)
          ?.nonNulls
          .map((e) =>
              Route53ResourceRecordSet.fromJson(e as Map<String, dynamic>))
          .toList(),
      timeoutMinutes: json['timeoutMinutes'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final hostedZoneId = this.hostedZoneId;
    final recordName = this.recordName;
    final crossAccountRole = this.crossAccountRole;
    final externalId = this.externalId;
    final recordSets = this.recordSets;
    final timeoutMinutes = this.timeoutMinutes;
    return {
      'hostedZoneId': hostedZoneId,
      'recordName': recordName,
      if (crossAccountRole != null) 'crossAccountRole': crossAccountRole,
      if (externalId != null) 'externalId': externalId,
      if (recordSets != null) 'recordSets': recordSets,
      if (timeoutMinutes != null) 'timeoutMinutes': timeoutMinutes,
    };
  }
}

/// Configuration for Amazon DocumentDB global clusters used in a Region switch
/// plan.
///
/// @nodoc
class DocumentDbConfiguration {
  /// The behavior for a global cluster, that is, only allow switchover or also
  /// allow failover.
  final DocumentDbDefaultBehavior behavior;

  /// The database cluster Amazon Resource Names (ARNs) for a DocumentDB global
  /// cluster.
  final List<String> databaseClusterArns;

  /// The global cluster identifier for a DocumentDB global cluster.
  final String globalClusterIdentifier;

  /// The cross account role for the configuration.
  final String? crossAccountRole;

  /// The external ID (secret key) for the configuration.
  final String? externalId;

  /// The timeout value specified for the configuration.
  final int? timeoutMinutes;

  /// The settings for ungraceful execution.
  final DocumentDbUngraceful? ungraceful;

  DocumentDbConfiguration({
    required this.behavior,
    required this.databaseClusterArns,
    required this.globalClusterIdentifier,
    this.crossAccountRole,
    this.externalId,
    this.timeoutMinutes,
    this.ungraceful,
  });

  factory DocumentDbConfiguration.fromJson(Map<String, dynamic> json) {
    return DocumentDbConfiguration(
      behavior: DocumentDbDefaultBehavior.fromString(
          (json['behavior'] as String?) ?? ''),
      databaseClusterArns: ((json['databaseClusterArns'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      globalClusterIdentifier:
          (json['globalClusterIdentifier'] as String?) ?? '',
      crossAccountRole: json['crossAccountRole'] as String?,
      externalId: json['externalId'] as String?,
      timeoutMinutes: json['timeoutMinutes'] as int?,
      ungraceful: json['ungraceful'] != null
          ? DocumentDbUngraceful.fromJson(
              json['ungraceful'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final behavior = this.behavior;
    final databaseClusterArns = this.databaseClusterArns;
    final globalClusterIdentifier = this.globalClusterIdentifier;
    final crossAccountRole = this.crossAccountRole;
    final externalId = this.externalId;
    final timeoutMinutes = this.timeoutMinutes;
    final ungraceful = this.ungraceful;
    return {
      'behavior': behavior.value,
      'databaseClusterArns': databaseClusterArns,
      'globalClusterIdentifier': globalClusterIdentifier,
      if (crossAccountRole != null) 'crossAccountRole': crossAccountRole,
      if (externalId != null) 'externalId': externalId,
      if (timeoutMinutes != null) 'timeoutMinutes': timeoutMinutes,
      if (ungraceful != null) 'ungraceful': ungraceful,
    };
  }
}

/// Configuration for promoting an Amazon RDS read replica to a standalone
/// database instance during a Region switch.
///
/// @nodoc
class RdsPromoteReadReplicaConfiguration {
  /// A map of database instance ARNs for each Region in the plan.
  final Map<String, String> dbInstanceArnMap;

  /// The cross-account role for the configuration.
  final String? crossAccountRole;

  /// The external ID (secret key) for the configuration.
  final String? externalId;

  /// The timeout value specified for the configuration.
  final int? timeoutMinutes;

  RdsPromoteReadReplicaConfiguration({
    required this.dbInstanceArnMap,
    this.crossAccountRole,
    this.externalId,
    this.timeoutMinutes,
  });

  factory RdsPromoteReadReplicaConfiguration.fromJson(
      Map<String, dynamic> json) {
    return RdsPromoteReadReplicaConfiguration(
      dbInstanceArnMap: ((json['dbInstanceArnMap'] as Map<String, dynamic>?) ??
              const <String, dynamic>{})
          .map((k, e) => MapEntry(k, e as String)),
      crossAccountRole: json['crossAccountRole'] as String?,
      externalId: json['externalId'] as String?,
      timeoutMinutes: json['timeoutMinutes'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final dbInstanceArnMap = this.dbInstanceArnMap;
    final crossAccountRole = this.crossAccountRole;
    final externalId = this.externalId;
    final timeoutMinutes = this.timeoutMinutes;
    return {
      'dbInstanceArnMap': dbInstanceArnMap,
      if (crossAccountRole != null) 'crossAccountRole': crossAccountRole,
      if (externalId != null) 'externalId': externalId,
      if (timeoutMinutes != null) 'timeoutMinutes': timeoutMinutes,
    };
  }
}

/// Configuration for creating an Amazon RDS cross-Region read replica during
/// post-recovery in a Region switch.
///
/// @nodoc
class RdsCreateCrossRegionReplicaConfiguration {
  /// A map of database instance ARNs for each Region in the plan.
  final Map<String, String> dbInstanceArnMap;

  /// The cross-account role for the configuration.
  final String? crossAccountRole;

  /// The external ID (secret key) for the configuration.
  final String? externalId;

  /// The timeout value specified for the configuration.
  final int? timeoutMinutes;

  RdsCreateCrossRegionReplicaConfiguration({
    required this.dbInstanceArnMap,
    this.crossAccountRole,
    this.externalId,
    this.timeoutMinutes,
  });

  factory RdsCreateCrossRegionReplicaConfiguration.fromJson(
      Map<String, dynamic> json) {
    return RdsCreateCrossRegionReplicaConfiguration(
      dbInstanceArnMap: ((json['dbInstanceArnMap'] as Map<String, dynamic>?) ??
              const <String, dynamic>{})
          .map((k, e) => MapEntry(k, e as String)),
      crossAccountRole: json['crossAccountRole'] as String?,
      externalId: json['externalId'] as String?,
      timeoutMinutes: json['timeoutMinutes'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final dbInstanceArnMap = this.dbInstanceArnMap;
    final crossAccountRole = this.crossAccountRole;
    final externalId = this.externalId;
    final timeoutMinutes = this.timeoutMinutes;
    return {
      'dbInstanceArnMap': dbInstanceArnMap,
      if (crossAccountRole != null) 'crossAccountRole': crossAccountRole,
      if (externalId != null) 'externalId': externalId,
      if (timeoutMinutes != null) 'timeoutMinutes': timeoutMinutes,
    };
  }
}

/// Configuration for Amazon Web Services Lambda event source mappings used in a
/// Region switch plan.
///
/// @nodoc
class LambdaEventSourceMappingConfiguration {
  /// The action to take - whether to <code>enable</code> or <code>disable</code>
  /// an event source mapping.
  final EventSourceMappingAction action;

  /// Per-region configuration for which Lambda event source mapping to enable or
  /// disable when activating or deactivating a region.
  final Map<String, EventSourceMapping> regionEventSourceMappings;

  /// The timeout value specified for the configuration.
  final int? timeoutMinutes;

  /// The settings for ungraceful execution.
  final LambdaEventSourceMappingUngraceful? ungraceful;

  LambdaEventSourceMappingConfiguration({
    required this.action,
    required this.regionEventSourceMappings,
    this.timeoutMinutes,
    this.ungraceful,
  });

  factory LambdaEventSourceMappingConfiguration.fromJson(
      Map<String, dynamic> json) {
    return LambdaEventSourceMappingConfiguration(
      action: EventSourceMappingAction.fromString(
          (json['action'] as String?) ?? ''),
      regionEventSourceMappings:
          ((json['regionEventSourceMappings'] as Map<String, dynamic>?) ??
                  const <String, dynamic>{})
              .map((k, e) => MapEntry(
                  k, EventSourceMapping.fromJson(e as Map<String, dynamic>))),
      timeoutMinutes: json['timeoutMinutes'] as int?,
      ungraceful: json['ungraceful'] != null
          ? LambdaEventSourceMappingUngraceful.fromJson(
              json['ungraceful'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final regionEventSourceMappings = this.regionEventSourceMappings;
    final timeoutMinutes = this.timeoutMinutes;
    final ungraceful = this.ungraceful;
    return {
      'action': action.value,
      'regionEventSourceMappings': regionEventSourceMappings,
      if (timeoutMinutes != null) 'timeoutMinutes': timeoutMinutes,
      if (ungraceful != null) 'ungraceful': ungraceful,
    };
  }
}

/// Configuration for Amazon Aurora Serverless scaling used in a Region switch
/// plan.
///
/// @nodoc
class AuroraServerlessScalingConfiguration {
  /// The global cluster identifier for a global database.
  final String globalClusterIdentifier;

  /// Per-Region configuration that maps each Region to the Aurora database
  /// cluster ARN for scaling.
  final Map<String, String> regionDatabaseClusterArns;

  /// The cross account role for the configuration.
  final String? crossAccountRole;

  /// The external ID (secret key) for the configuration.
  final String? externalId;

  /// The target capacity percentage for Aurora Serverless scaling.
  final int? targetPercent;

  /// The timeout value specified for the configuration.
  final int? timeoutMinutes;

  AuroraServerlessScalingConfiguration({
    required this.globalClusterIdentifier,
    required this.regionDatabaseClusterArns,
    this.crossAccountRole,
    this.externalId,
    this.targetPercent,
    this.timeoutMinutes,
  });

  factory AuroraServerlessScalingConfiguration.fromJson(
      Map<String, dynamic> json) {
    return AuroraServerlessScalingConfiguration(
      globalClusterIdentifier:
          (json['globalClusterIdentifier'] as String?) ?? '',
      regionDatabaseClusterArns:
          ((json['regionDatabaseClusterArns'] as Map<String, dynamic>?) ??
                  const <String, dynamic>{})
              .map((k, e) => MapEntry(k, e as String)),
      crossAccountRole: json['crossAccountRole'] as String?,
      externalId: json['externalId'] as String?,
      targetPercent: json['targetPercent'] as int?,
      timeoutMinutes: json['timeoutMinutes'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final globalClusterIdentifier = this.globalClusterIdentifier;
    final regionDatabaseClusterArns = this.regionDatabaseClusterArns;
    final crossAccountRole = this.crossAccountRole;
    final externalId = this.externalId;
    final targetPercent = this.targetPercent;
    final timeoutMinutes = this.timeoutMinutes;
    return {
      'globalClusterIdentifier': globalClusterIdentifier,
      'regionDatabaseClusterArns': regionDatabaseClusterArns,
      if (crossAccountRole != null) 'crossAccountRole': crossAccountRole,
      if (externalId != null) 'externalId': externalId,
      if (targetPercent != null) 'targetPercent': targetPercent,
      if (timeoutMinutes != null) 'timeoutMinutes': timeoutMinutes,
    };
  }
}

/// Configuration for Amazon Aurora provisioned cluster scaling used in a Region
/// switch plan.
///
/// @nodoc
class AuroraProvisionedScalingConfiguration {
  /// The global cluster identifier for a global database.
  final String globalClusterIdentifier;

  /// Per-Region configuration that maps each Region to the Aurora database
  /// instance ARN for scaling.
  final Map<String, String> instanceArns;

  /// Per-Region configuration that maps each Region to the Aurora database
  /// cluster ARN for scaling.
  final Map<String, String> regionDatabaseClusterArns;

  /// The cross account role for the configuration.
  final String? crossAccountRole;

  /// The external ID (secret key) for the configuration.
  final String? externalId;

  /// The timeout value specified for the configuration.
  final int? timeoutMinutes;

  AuroraProvisionedScalingConfiguration({
    required this.globalClusterIdentifier,
    required this.instanceArns,
    required this.regionDatabaseClusterArns,
    this.crossAccountRole,
    this.externalId,
    this.timeoutMinutes,
  });

  factory AuroraProvisionedScalingConfiguration.fromJson(
      Map<String, dynamic> json) {
    return AuroraProvisionedScalingConfiguration(
      globalClusterIdentifier:
          (json['globalClusterIdentifier'] as String?) ?? '',
      instanceArns: ((json['instanceArns'] as Map<String, dynamic>?) ??
              const <String, dynamic>{})
          .map((k, e) => MapEntry(k, e as String)),
      regionDatabaseClusterArns:
          ((json['regionDatabaseClusterArns'] as Map<String, dynamic>?) ??
                  const <String, dynamic>{})
              .map((k, e) => MapEntry(k, e as String)),
      crossAccountRole: json['crossAccountRole'] as String?,
      externalId: json['externalId'] as String?,
      timeoutMinutes: json['timeoutMinutes'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final globalClusterIdentifier = this.globalClusterIdentifier;
    final instanceArns = this.instanceArns;
    final regionDatabaseClusterArns = this.regionDatabaseClusterArns;
    final crossAccountRole = this.crossAccountRole;
    final externalId = this.externalId;
    final timeoutMinutes = this.timeoutMinutes;
    return {
      'globalClusterIdentifier': globalClusterIdentifier,
      'instanceArns': instanceArns,
      'regionDatabaseClusterArns': regionDatabaseClusterArns,
      if (crossAccountRole != null) 'crossAccountRole': crossAccountRole,
      if (externalId != null) 'externalId': externalId,
      if (timeoutMinutes != null) 'timeoutMinutes': timeoutMinutes,
    };
  }
}

/// Configuration for Amazon Neptune global databases used in a Region switch
/// plan.
///
/// @nodoc
class NeptuneGlobalDatabaseConfiguration {
  /// The behavior for a global database, that is, only allow switchover or also
  /// allow failover.
  final NeptuneDefaultBehavior behavior;

  /// The global cluster identifier for a Neptune global database.
  final String globalClusterIdentifier;

  /// The database cluster Amazon Resource Names (ARNs) for a Neptune global
  /// database.
  final Map<String, String> regionDatabaseClusterArns;

  /// The cross account role for the configuration.
  final String? crossAccountRole;

  /// The external ID (secret key) for the configuration.
  final String? externalId;

  /// The timeout value specified for the configuration.
  final int? timeoutMinutes;

  /// The settings for ungraceful execution.
  final NeptuneUngraceful? ungraceful;

  NeptuneGlobalDatabaseConfiguration({
    required this.behavior,
    required this.globalClusterIdentifier,
    required this.regionDatabaseClusterArns,
    this.crossAccountRole,
    this.externalId,
    this.timeoutMinutes,
    this.ungraceful,
  });

  factory NeptuneGlobalDatabaseConfiguration.fromJson(
      Map<String, dynamic> json) {
    return NeptuneGlobalDatabaseConfiguration(
      behavior: NeptuneDefaultBehavior.fromString(
          (json['behavior'] as String?) ?? ''),
      globalClusterIdentifier:
          (json['globalClusterIdentifier'] as String?) ?? '',
      regionDatabaseClusterArns:
          ((json['regionDatabaseClusterArns'] as Map<String, dynamic>?) ??
                  const <String, dynamic>{})
              .map((k, e) => MapEntry(k, e as String)),
      crossAccountRole: json['crossAccountRole'] as String?,
      externalId: json['externalId'] as String?,
      timeoutMinutes: json['timeoutMinutes'] as int?,
      ungraceful: json['ungraceful'] != null
          ? NeptuneUngraceful.fromJson(
              json['ungraceful'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final behavior = this.behavior;
    final globalClusterIdentifier = this.globalClusterIdentifier;
    final regionDatabaseClusterArns = this.regionDatabaseClusterArns;
    final crossAccountRole = this.crossAccountRole;
    final externalId = this.externalId;
    final timeoutMinutes = this.timeoutMinutes;
    final ungraceful = this.ungraceful;
    return {
      'behavior': behavior.value,
      'globalClusterIdentifier': globalClusterIdentifier,
      'regionDatabaseClusterArns': regionDatabaseClusterArns,
      if (crossAccountRole != null) 'crossAccountRole': crossAccountRole,
      if (externalId != null) 'externalId': externalId,
      if (timeoutMinutes != null) 'timeoutMinutes': timeoutMinutes,
      if (ungraceful != null) 'ungraceful': ungraceful,
    };
  }
}

/// @nodoc
class NeptuneDefaultBehavior {
  static const switchoverOnly = NeptuneDefaultBehavior._('switchoverOnly');
  static const failover = NeptuneDefaultBehavior._('failover');

  final String value;

  const NeptuneDefaultBehavior._(this.value);

  static const values = [switchoverOnly, failover];

  static NeptuneDefaultBehavior fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => NeptuneDefaultBehavior._(value));

  @override
  bool operator ==(other) =>
      other is NeptuneDefaultBehavior && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Configuration for handling failures when performing operations on Neptune
/// global databases.
///
/// @nodoc
class NeptuneUngraceful {
  /// The settings for ungraceful execution.
  final NeptuneUngracefulBehavior? ungraceful;

  NeptuneUngraceful({
    this.ungraceful,
  });

  factory NeptuneUngraceful.fromJson(Map<String, dynamic> json) {
    return NeptuneUngraceful(
      ungraceful: (json['ungraceful'] as String?)
          ?.let(NeptuneUngracefulBehavior.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final ungraceful = this.ungraceful;
    return {
      if (ungraceful != null) 'ungraceful': ungraceful.value,
    };
  }
}

/// @nodoc
class NeptuneUngracefulBehavior {
  static const failover = NeptuneUngracefulBehavior._('failover');

  final String value;

  const NeptuneUngracefulBehavior._(this.value);

  static const values = [failover];

  static NeptuneUngracefulBehavior fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => NeptuneUngracefulBehavior._(value));

  @override
  bool operator ==(other) =>
      other is NeptuneUngracefulBehavior && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class EventSourceMappingAction {
  static const enable = EventSourceMappingAction._('enable');
  static const disable = EventSourceMappingAction._('disable');

  final String value;

  const EventSourceMappingAction._(this.value);

  static const values = [enable, disable];

  static EventSourceMappingAction fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EventSourceMappingAction._(value));

  @override
  bool operator ==(other) =>
      other is EventSourceMappingAction && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Specifies whether to skip enabling or disabling an event source mapping
/// during an ungraceful execution.
///
/// @nodoc
class LambdaEventSourceMappingUngraceful {
  /// Set to <code>skip</code> to skip executing this event source mapping step
  /// during an ungraceful execution.
  final LambdaEventSourceMappingUngracefulBehavior? behavior;

  LambdaEventSourceMappingUngraceful({
    this.behavior,
  });

  factory LambdaEventSourceMappingUngraceful.fromJson(
      Map<String, dynamic> json) {
    return LambdaEventSourceMappingUngraceful(
      behavior: (json['behavior'] as String?)
          ?.let(LambdaEventSourceMappingUngracefulBehavior.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final behavior = this.behavior;
    return {
      if (behavior != null) 'behavior': behavior.value,
    };
  }
}

/// @nodoc
class LambdaEventSourceMappingUngracefulBehavior {
  static const skip = LambdaEventSourceMappingUngracefulBehavior._('skip');

  final String value;

  const LambdaEventSourceMappingUngracefulBehavior._(this.value);

  static const values = [skip];

  static LambdaEventSourceMappingUngracefulBehavior fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => LambdaEventSourceMappingUngracefulBehavior._(value));

  @override
  bool operator ==(other) =>
      other is LambdaEventSourceMappingUngracefulBehavior &&
      other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The Amazon Web Services Lambda event source mapping configuration,
/// containing the resource ARN and optional cross-account configuration.
///
/// @nodoc
class EventSourceMapping {
  /// The Amazon Resource Name (ARN) of the Lambda event source mapping.
  final String arn;

  /// The cross account role for the configuration.
  final String? crossAccountRole;

  /// The external ID (secret key) for the configuration.
  final String? externalId;

  EventSourceMapping({
    required this.arn,
    this.crossAccountRole,
    this.externalId,
  });

  factory EventSourceMapping.fromJson(Map<String, dynamic> json) {
    return EventSourceMapping(
      arn: (json['arn'] as String?) ?? '',
      crossAccountRole: json['crossAccountRole'] as String?,
      externalId: json['externalId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final crossAccountRole = this.crossAccountRole;
    final externalId = this.externalId;
    return {
      'arn': arn,
      if (crossAccountRole != null) 'crossAccountRole': crossAccountRole,
      if (externalId != null) 'externalId': externalId,
    };
  }
}

/// @nodoc
class DocumentDbDefaultBehavior {
  static const switchoverOnly = DocumentDbDefaultBehavior._('switchoverOnly');
  static const failover = DocumentDbDefaultBehavior._('failover');

  final String value;

  const DocumentDbDefaultBehavior._(this.value);

  static const values = [switchoverOnly, failover];

  static DocumentDbDefaultBehavior fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DocumentDbDefaultBehavior._(value));

  @override
  bool operator ==(other) =>
      other is DocumentDbDefaultBehavior && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Configuration for handling failures when performing operations on DocumentDB
/// global clusters.
///
/// @nodoc
class DocumentDbUngraceful {
  /// The settings for ungraceful execution.
  final DocumentDbUngracefulBehavior? ungraceful;

  DocumentDbUngraceful({
    this.ungraceful,
  });

  factory DocumentDbUngraceful.fromJson(Map<String, dynamic> json) {
    return DocumentDbUngraceful(
      ungraceful: (json['ungraceful'] as String?)
          ?.let(DocumentDbUngracefulBehavior.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final ungraceful = this.ungraceful;
    return {
      if (ungraceful != null) 'ungraceful': ungraceful.value,
    };
  }
}

/// @nodoc
class DocumentDbUngracefulBehavior {
  static const failover = DocumentDbUngracefulBehavior._('failover');

  final String value;

  const DocumentDbUngracefulBehavior._(this.value);

  static const values = [failover];

  static DocumentDbUngracefulBehavior fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DocumentDbUngracefulBehavior._(value));

  @override
  bool operator ==(other) =>
      other is DocumentDbUngracefulBehavior && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The Amazon Route 53 record set.
///
/// @nodoc
class Route53ResourceRecordSet {
  /// The Amazon Route 53 record set identifier.
  final String? recordSetIdentifier;

  /// The Amazon Route 53 record set Region.
  final String? region;

  Route53ResourceRecordSet({
    this.recordSetIdentifier,
    this.region,
  });

  factory Route53ResourceRecordSet.fromJson(Map<String, dynamic> json) {
    return Route53ResourceRecordSet(
      recordSetIdentifier: json['recordSetIdentifier'] as String?,
      region: json['region'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final recordSetIdentifier = this.recordSetIdentifier;
    final region = this.region;
    return {
      if (recordSetIdentifier != null)
        'recordSetIdentifier': recordSetIdentifier,
      if (region != null) 'region': region,
    };
  }
}

/// Defines the type of Kubernetes resource to scale in an Amazon EKS cluster.
///
/// @nodoc
class KubernetesResourceType {
  /// The API version type for the Kubernetes resource.
  final String apiVersion;

  /// The kind for the Kubernetes resource.
  final String kind;

  KubernetesResourceType({
    required this.apiVersion,
    required this.kind,
  });

  factory KubernetesResourceType.fromJson(Map<String, dynamic> json) {
    return KubernetesResourceType(
      apiVersion: (json['apiVersion'] as String?) ?? '',
      kind: (json['kind'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final apiVersion = this.apiVersion;
    final kind = this.kind;
    return {
      'apiVersion': apiVersion,
      'kind': kind,
    };
  }
}

/// The ungraceful settings for Amazon Web Services EKS resource scaling.
///
/// @nodoc
class EksResourceScalingUngraceful {
  /// The minimum success percentage for the configuration.
  final int minimumSuccessPercentage;

  EksResourceScalingUngraceful({
    required this.minimumSuccessPercentage,
  });

  factory EksResourceScalingUngraceful.fromJson(Map<String, dynamic> json) {
    return EksResourceScalingUngraceful(
      minimumSuccessPercentage: (json['minimumSuccessPercentage'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final minimumSuccessPercentage = this.minimumSuccessPercentage;
    return {
      'minimumSuccessPercentage': minimumSuccessPercentage,
    };
  }
}

/// @nodoc
class EksCapacityMonitoringApproach {
  static const sampledMaxInLast24Hours =
      EksCapacityMonitoringApproach._('sampledMaxInLast24Hours');

  final String value;

  const EksCapacityMonitoringApproach._(this.value);

  static const values = [sampledMaxInLast24Hours];

  static EksCapacityMonitoringApproach fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EksCapacityMonitoringApproach._(value));

  @override
  bool operator ==(other) =>
      other is EksCapacityMonitoringApproach && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The Amazon Web Services EKS cluster execution block configuration.
///
/// @nodoc
class EksCluster {
  /// The Amazon Resource Name (ARN) of an Amazon Web Services EKS cluster.
  final String clusterArn;

  /// The cross account role for the configuration.
  final String? crossAccountRole;

  /// The external ID (secret key) for the configuration.
  final String? externalId;

  EksCluster({
    required this.clusterArn,
    this.crossAccountRole,
    this.externalId,
  });

  factory EksCluster.fromJson(Map<String, dynamic> json) {
    return EksCluster(
      clusterArn: (json['clusterArn'] as String?) ?? '',
      crossAccountRole: json['crossAccountRole'] as String?,
      externalId: json['externalId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clusterArn = this.clusterArn;
    final crossAccountRole = this.crossAccountRole;
    final externalId = this.externalId;
    return {
      'clusterArn': clusterArn,
      if (crossAccountRole != null) 'crossAccountRole': crossAccountRole,
      if (externalId != null) 'externalId': externalId,
    };
  }
}

/// Defines a Kubernetes resource to scale in an Amazon EKS cluster.
///
/// @nodoc
class KubernetesScalingResource {
  /// The name for the Kubernetes resource.
  final String name;

  /// The namespace for the Kubernetes resource.
  final String namespace;

  /// The hpaname for the Kubernetes resource.
  final String? hpaName;

  KubernetesScalingResource({
    required this.name,
    required this.namespace,
    this.hpaName,
  });

  factory KubernetesScalingResource.fromJson(Map<String, dynamic> json) {
    return KubernetesScalingResource(
      name: (json['name'] as String?) ?? '',
      namespace: (json['namespace'] as String?) ?? '',
      hpaName: json['hpaName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final namespace = this.namespace;
    final hpaName = this.hpaName;
    return {
      'name': name,
      'namespace': namespace,
      if (hpaName != null) 'hpaName': hpaName,
    };
  }
}

/// The settings for ungraceful execution.
///
/// @nodoc
class EcsUngraceful {
  /// The minimum success percentage specified for the configuration.
  final int minimumSuccessPercentage;

  EcsUngraceful({
    required this.minimumSuccessPercentage,
  });

  factory EcsUngraceful.fromJson(Map<String, dynamic> json) {
    return EcsUngraceful(
      minimumSuccessPercentage: (json['minimumSuccessPercentage'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final minimumSuccessPercentage = this.minimumSuccessPercentage;
    return {
      'minimumSuccessPercentage': minimumSuccessPercentage,
    };
  }
}

/// @nodoc
class EcsCapacityMonitoringApproach {
  static const sampledMaxInLast24Hours =
      EcsCapacityMonitoringApproach._('sampledMaxInLast24Hours');
  static const containerInsightsMaxInLast24Hours =
      EcsCapacityMonitoringApproach._('containerInsightsMaxInLast24Hours');

  final String value;

  const EcsCapacityMonitoringApproach._(this.value);

  static const values = [
    sampledMaxInLast24Hours,
    containerInsightsMaxInLast24Hours
  ];

  static EcsCapacityMonitoringApproach fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EcsCapacityMonitoringApproach._(value));

  @override
  bool operator ==(other) =>
      other is EcsCapacityMonitoringApproach && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The service for a cross account role.
///
/// @nodoc
class Service {
  /// The cluster Amazon Resource Name (ARN) for a service.
  final String? clusterArn;

  /// The cross account role for a service.
  final String? crossAccountRole;

  /// The external ID (secret key) for the service.
  final String? externalId;

  /// The Amazon Resource Name (ARN) for a service.
  final String? serviceArn;

  Service({
    this.clusterArn,
    this.crossAccountRole,
    this.externalId,
    this.serviceArn,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      clusterArn: json['clusterArn'] as String?,
      crossAccountRole: json['crossAccountRole'] as String?,
      externalId: json['externalId'] as String?,
      serviceArn: json['serviceArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clusterArn = this.clusterArn;
    final crossAccountRole = this.crossAccountRole;
    final externalId = this.externalId;
    final serviceArn = this.serviceArn;
    return {
      if (clusterArn != null) 'clusterArn': clusterArn,
      if (crossAccountRole != null) 'crossAccountRole': crossAccountRole,
      if (externalId != null) 'externalId': externalId,
      if (serviceArn != null) 'serviceArn': serviceArn,
    };
  }
}

/// @nodoc
class GlobalAuroraDefaultBehavior {
  static const switchoverOnly = GlobalAuroraDefaultBehavior._('switchoverOnly');
  static const failover = GlobalAuroraDefaultBehavior._('failover');

  final String value;

  const GlobalAuroraDefaultBehavior._(this.value);

  static const values = [switchoverOnly, failover];

  static GlobalAuroraDefaultBehavior fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => GlobalAuroraDefaultBehavior._(value));

  @override
  bool operator ==(other) =>
      other is GlobalAuroraDefaultBehavior && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Configuration for handling failures when performing operations on Aurora
/// global databases.
///
/// @nodoc
class GlobalAuroraUngraceful {
  /// The settings for ungraceful execution.
  final GlobalAuroraUngracefulBehavior? ungraceful;

  GlobalAuroraUngraceful({
    this.ungraceful,
  });

  factory GlobalAuroraUngraceful.fromJson(Map<String, dynamic> json) {
    return GlobalAuroraUngraceful(
      ungraceful: (json['ungraceful'] as String?)
          ?.let(GlobalAuroraUngracefulBehavior.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final ungraceful = this.ungraceful;
    return {
      if (ungraceful != null) 'ungraceful': ungraceful.value,
    };
  }
}

/// @nodoc
class GlobalAuroraUngracefulBehavior {
  static const failover = GlobalAuroraUngracefulBehavior._('failover');

  final String value;

  const GlobalAuroraUngracefulBehavior._(this.value);

  static const values = [failover];

  static GlobalAuroraUngracefulBehavior fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => GlobalAuroraUngracefulBehavior._(value));

  @override
  bool operator ==(other) =>
      other is GlobalAuroraUngracefulBehavior && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents the state of an ARC routing control.
///
/// @nodoc
class ArcRoutingControlState {
  /// The Amazon Resource Name (ARN) of a routing control.
  final String routingControlArn;

  /// The state of an ARC routing control, On or Off.
  final RoutingControlStateChange state;

  ArcRoutingControlState({
    required this.routingControlArn,
    required this.state,
  });

  factory ArcRoutingControlState.fromJson(Map<String, dynamic> json) {
    return ArcRoutingControlState(
      routingControlArn: (json['routingControlArn'] as String?) ?? '',
      state: RoutingControlStateChange.fromString(
          (json['state'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final routingControlArn = this.routingControlArn;
    final state = this.state;
    return {
      'routingControlArn': routingControlArn,
      'state': state.value,
    };
  }
}

/// @nodoc
class RoutingControlStateChange {
  static const on = RoutingControlStateChange._('On');
  static const off = RoutingControlStateChange._('Off');

  final String value;

  const RoutingControlStateChange._(this.value);

  static const values = [on, off];

  static RoutingControlStateChange fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RoutingControlStateChange._(value));

  @override
  bool operator ==(other) =>
      other is RoutingControlStateChange && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Configuration for handling failures when performing operations on EC2
/// resources.
///
/// @nodoc
class Ec2Ungraceful {
  /// The minimum success percentage that you specify for EC2 Auto Scaling groups.
  final int minimumSuccessPercentage;

  Ec2Ungraceful({
    required this.minimumSuccessPercentage,
  });

  factory Ec2Ungraceful.fromJson(Map<String, dynamic> json) {
    return Ec2Ungraceful(
      minimumSuccessPercentage: (json['minimumSuccessPercentage'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final minimumSuccessPercentage = this.minimumSuccessPercentage;
    return {
      'minimumSuccessPercentage': minimumSuccessPercentage,
    };
  }
}

/// @nodoc
class Ec2AsgCapacityMonitoringApproach {
  static const sampledMaxInLast24Hours =
      Ec2AsgCapacityMonitoringApproach._('sampledMaxInLast24Hours');
  static const autoscalingMaxInLast24Hours =
      Ec2AsgCapacityMonitoringApproach._('autoscalingMaxInLast24Hours');

  final String value;

  const Ec2AsgCapacityMonitoringApproach._(this.value);

  static const values = [sampledMaxInLast24Hours, autoscalingMaxInLast24Hours];

  static Ec2AsgCapacityMonitoringApproach fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => Ec2AsgCapacityMonitoringApproach._(value));

  @override
  bool operator ==(other) =>
      other is Ec2AsgCapacityMonitoringApproach && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Configuration for an Amazon EC2 Auto Scaling group used in a Region switch
/// plan.
///
/// @nodoc
class Asg {
  /// The Amazon Resource Name (ARN) of the EC2 Auto Scaling group.
  final String? arn;

  /// The cross account role for the configuration.
  final String? crossAccountRole;

  /// The external ID (secret key) for the configuration.
  final String? externalId;

  Asg({
    this.arn,
    this.crossAccountRole,
    this.externalId,
  });

  factory Asg.fromJson(Map<String, dynamic> json) {
    return Asg(
      arn: json['arn'] as String?,
      crossAccountRole: json['crossAccountRole'] as String?,
      externalId: json['externalId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final crossAccountRole = this.crossAccountRole;
    final externalId = this.externalId;
    return {
      if (arn != null) 'arn': arn,
      if (crossAccountRole != null) 'crossAccountRole': crossAccountRole,
      if (externalId != null) 'externalId': externalId,
    };
  }
}

/// @nodoc
class RegionToRunIn {
  static const activatingRegion = RegionToRunIn._('activatingRegion');
  static const deactivatingRegion = RegionToRunIn._('deactivatingRegion');
  static const activeRegion = RegionToRunIn._('activeRegion');
  static const inactiveRegion = RegionToRunIn._('inactiveRegion');

  final String value;

  const RegionToRunIn._(this.value);

  static const values = [
    activatingRegion,
    deactivatingRegion,
    activeRegion,
    inactiveRegion
  ];

  static RegionToRunIn fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RegionToRunIn._(value));

  @override
  bool operator ==(other) => other is RegionToRunIn && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Configuration for handling failures when invoking Lambda functions.
///
/// @nodoc
class LambdaUngraceful {
  /// The ungraceful behavior for a Lambda function, which must be set to
  /// <code>skip</code>.
  final LambdaUngracefulBehavior? behavior;

  LambdaUngraceful({
    this.behavior,
  });

  factory LambdaUngraceful.fromJson(Map<String, dynamic> json) {
    return LambdaUngraceful(
      behavior: (json['behavior'] as String?)
          ?.let(LambdaUngracefulBehavior.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final behavior = this.behavior;
    return {
      if (behavior != null) 'behavior': behavior.value,
    };
  }
}

/// @nodoc
class LambdaUngracefulBehavior {
  static const skip = LambdaUngracefulBehavior._('skip');

  final String value;

  const LambdaUngracefulBehavior._(this.value);

  static const values = [skip];

  static LambdaUngracefulBehavior fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => LambdaUngracefulBehavior._(value));

  @override
  bool operator ==(other) =>
      other is LambdaUngracefulBehavior && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Configuration for Amazon Web Services Lambda functions used in a Region
/// switch plan.
///
/// @nodoc
class Lambdas {
  /// The Amazon Resource Name (ARN) of the Lambda function.
  final String? arn;

  /// The cross account role for the configuration.
  final String? crossAccountRole;

  /// The external ID (secret key) for the configuration.
  final String? externalId;

  Lambdas({
    this.arn,
    this.crossAccountRole,
    this.externalId,
  });

  factory Lambdas.fromJson(Map<String, dynamic> json) {
    return Lambdas(
      arn: json['arn'] as String?,
      crossAccountRole: json['crossAccountRole'] as String?,
      externalId: json['externalId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final crossAccountRole = this.crossAccountRole;
    final externalId = this.externalId;
    return {
      if (arn != null) 'arn': arn,
      if (crossAccountRole != null) 'crossAccountRole': crossAccountRole,
      if (externalId != null) 'externalId': externalId,
    };
  }
}

/// @nodoc
class UpdatePlanExecutionStepAction {
  static const switchToUngraceful =
      UpdatePlanExecutionStepAction._('switchToUngraceful');
  static const skip = UpdatePlanExecutionStepAction._('skip');

  final String value;

  const UpdatePlanExecutionStepAction._(this.value);

  static const values = [switchToUngraceful, skip];

  static UpdatePlanExecutionStepAction fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => UpdatePlanExecutionStepAction._(value));

  @override
  bool operator ==(other) =>
      other is UpdatePlanExecutionStepAction && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class UpdatePlanExecutionAction {
  static const switchToGraceful =
      UpdatePlanExecutionAction._('switchToGraceful');
  static const switchToUngraceful =
      UpdatePlanExecutionAction._('switchToUngraceful');
  static const pause = UpdatePlanExecutionAction._('pause');
  static const resume = UpdatePlanExecutionAction._('resume');

  final String value;

  const UpdatePlanExecutionAction._(this.value);

  static const values = [switchToGraceful, switchToUngraceful, pause, resume];

  static UpdatePlanExecutionAction fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => UpdatePlanExecutionAction._(value));

  @override
  bool operator ==(other) =>
      other is UpdatePlanExecutionAction && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ExecutionAction {
  static const activate = ExecutionAction._('activate');
  static const deactivate = ExecutionAction._('deactivate');
  static const postRecovery = ExecutionAction._('postRecovery');

  final String value;

  const ExecutionAction._(this.value);

  static const values = [activate, deactivate, postRecovery];

  static ExecutionAction fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ExecutionAction._(value));

  @override
  bool operator ==(other) => other is ExecutionAction && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ExecutionMode {
  static const graceful = ExecutionMode._('graceful');
  static const ungraceful = ExecutionMode._('ungraceful');

  final String value;

  const ExecutionMode._(this.value);

  static const values = [graceful, ungraceful];

  static ExecutionMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ExecutionMode._(value));

  @override
  bool operator ==(other) => other is ExecutionMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The Amazon Route 53 health check.
///
/// @nodoc
class Route53HealthCheck {
  /// The Amazon Route 53 health check hosted zone ID.
  final String hostedZoneId;

  /// The Amazon Route 53 record name.
  final String recordName;

  /// The Amazon Route 53 Region.
  final String region;

  /// The Amazon Route 53 health check ID.
  final String? healthCheckId;

  /// The Amazon Route 53 health check status.
  final Route53HealthCheckStatus? status;

  Route53HealthCheck({
    required this.hostedZoneId,
    required this.recordName,
    required this.region,
    this.healthCheckId,
    this.status,
  });

  factory Route53HealthCheck.fromJson(Map<String, dynamic> json) {
    return Route53HealthCheck(
      hostedZoneId: (json['hostedZoneId'] as String?) ?? '',
      recordName: (json['recordName'] as String?) ?? '',
      region: (json['region'] as String?) ?? '',
      healthCheckId: json['healthCheckId'] as String?,
      status:
          (json['status'] as String?)?.let(Route53HealthCheckStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final hostedZoneId = this.hostedZoneId;
    final recordName = this.recordName;
    final region = this.region;
    final healthCheckId = this.healthCheckId;
    final status = this.status;
    return {
      'hostedZoneId': hostedZoneId,
      'recordName': recordName,
      'region': region,
      if (healthCheckId != null) 'healthCheckId': healthCheckId,
      if (status != null) 'status': status.value,
    };
  }
}

/// @nodoc
class Route53HealthCheckStatus {
  static const healthy = Route53HealthCheckStatus._('healthy');
  static const unhealthy = Route53HealthCheckStatus._('unhealthy');
  static const unknown = Route53HealthCheckStatus._('unknown');

  final String value;

  const Route53HealthCheckStatus._(this.value);

  static const values = [healthy, unhealthy, unknown];

  static Route53HealthCheckStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => Route53HealthCheckStatus._(value));

  @override
  bool operator ==(other) =>
      other is Route53HealthCheckStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A summarized representation of a plan execution. This structure contains key
/// information about an execution without all the detailed step data.
///
/// @nodoc
class AbbreviatedExecution {
  /// The plan execution action. Valid values are <code>activate</code>, to
  /// activate an Amazon Web Services Region, or <code>deactivate</code>, to
  /// deactivate a Region.
  final ExecutionAction executionAction;

  /// The execution identifier of a plan execution.
  final String executionId;

  /// The Amazon Web Services Region for a plan execution.
  final String executionRegion;

  /// The plan execution state. Provides the state of a plan execution, for
  /// example, In Progress or Paused by Operator.
  final ExecutionState executionState;

  /// The plan execution mode. Valid values are <code>graceful</code>, for
  /// graceful executions, or <code>ungraceful</code>, for ungraceful executions.
  final ExecutionMode mode;

  /// The Amazon Resource Name (ARN) of the plan.
  final String planArn;

  /// The timestamp when the plan execution was started.
  final DateTime startTime;

  /// The actual recovery time that Region switch calculates for a plan execution.
  /// Actual recovery time includes the time for the plan to run added to the time
  /// elapsed until the application health alarms that you've specified are
  /// healthy again.
  final String? actualRecoveryTime;

  /// An optional comment about the plan execution.
  final String? comment;

  /// The timestamp when the plan execution was ended.
  final DateTime? endTime;

  /// The unique identifier of the most recent recovery execution. Required when
  /// starting a post-recovery execution.
  final String? recoveryExecutionId;

  /// The timestamp when the plan execution was last updated.
  final DateTime? updatedAt;

  /// The version for the plan.
  final String? version;

  AbbreviatedExecution({
    required this.executionAction,
    required this.executionId,
    required this.executionRegion,
    required this.executionState,
    required this.mode,
    required this.planArn,
    required this.startTime,
    this.actualRecoveryTime,
    this.comment,
    this.endTime,
    this.recoveryExecutionId,
    this.updatedAt,
    this.version,
  });

  factory AbbreviatedExecution.fromJson(Map<String, dynamic> json) {
    return AbbreviatedExecution(
      executionAction: ExecutionAction.fromString(
          (json['executionAction'] as String?) ?? ''),
      executionId: (json['executionId'] as String?) ?? '',
      executionRegion: (json['executionRegion'] as String?) ?? '',
      executionState:
          ExecutionState.fromString((json['executionState'] as String?) ?? ''),
      mode: ExecutionMode.fromString((json['mode'] as String?) ?? ''),
      planArn: (json['planArn'] as String?) ?? '',
      startTime: nonNullableTimeStampFromJson(json['startTime'] ?? 0),
      actualRecoveryTime: json['actualRecoveryTime'] as String?,
      comment: json['comment'] as String?,
      endTime: timeStampFromJson(json['endTime']),
      recoveryExecutionId: json['recoveryExecutionId'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final executionAction = this.executionAction;
    final executionId = this.executionId;
    final executionRegion = this.executionRegion;
    final executionState = this.executionState;
    final mode = this.mode;
    final planArn = this.planArn;
    final startTime = this.startTime;
    final actualRecoveryTime = this.actualRecoveryTime;
    final comment = this.comment;
    final endTime = this.endTime;
    final recoveryExecutionId = this.recoveryExecutionId;
    final updatedAt = this.updatedAt;
    final version = this.version;
    return {
      'executionAction': executionAction.value,
      'executionId': executionId,
      'executionRegion': executionRegion,
      'executionState': executionState.value,
      'mode': mode.value,
      'planArn': planArn,
      'startTime': unixTimestampToJson(startTime),
      if (actualRecoveryTime != null) 'actualRecoveryTime': actualRecoveryTime,
      if (comment != null) 'comment': comment,
      if (endTime != null) 'endTime': unixTimestampToJson(endTime),
      if (recoveryExecutionId != null)
        'recoveryExecutionId': recoveryExecutionId,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
      if (version != null) 'version': version,
    };
  }
}

/// @nodoc
class ExecutionState {
  static const inProgress = ExecutionState._('inProgress');
  static const pausedByFailedStep = ExecutionState._('pausedByFailedStep');
  static const pausedByOperator = ExecutionState._('pausedByOperator');
  static const completed = ExecutionState._('completed');
  static const completedWithExceptions =
      ExecutionState._('completedWithExceptions');
  static const canceled = ExecutionState._('canceled');
  static const planExecutionTimedOut =
      ExecutionState._('planExecutionTimedOut');
  static const pendingManualApproval =
      ExecutionState._('pendingManualApproval');
  static const failed = ExecutionState._('failed');
  static const pending = ExecutionState._('pending');
  static const completedMonitoringApplicationHealth =
      ExecutionState._('completedMonitoringApplicationHealth');

  final String value;

  const ExecutionState._(this.value);

  static const values = [
    inProgress,
    pausedByFailedStep,
    pausedByOperator,
    completed,
    completedWithExceptions,
    canceled,
    planExecutionTimedOut,
    pendingManualApproval,
    failed,
    pending,
    completedMonitoringApplicationHealth
  ];

  static ExecutionState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ExecutionState._(value));

  @override
  bool operator ==(other) => other is ExecutionState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents an event that occurred during a plan execution. These events
/// provide a detailed timeline of the execution process.
///
/// @nodoc
class ExecutionEvent {
  /// The event ID for an execution event.
  final String eventId;

  /// The description for an execution event.
  final String? description;

  /// Errors for an execution event.
  final String? error;

  /// The execution block type for an execution event.
  final ExecutionBlockType? executionBlockType;

  /// The event ID of the previous execution event.
  final String? previousEventId;

  /// The resources for an execution event.
  final List<String>? resources;

  /// The step name for an execution event.
  final String? stepName;

  /// The timestamp for an execution event.
  final DateTime? timestamp;

  /// The type of an execution event.
  final ExecutionEventType? type;

  ExecutionEvent({
    required this.eventId,
    this.description,
    this.error,
    this.executionBlockType,
    this.previousEventId,
    this.resources,
    this.stepName,
    this.timestamp,
    this.type,
  });

  factory ExecutionEvent.fromJson(Map<String, dynamic> json) {
    return ExecutionEvent(
      eventId: (json['eventId'] as String?) ?? '',
      description: json['description'] as String?,
      error: json['error'] as String?,
      executionBlockType: (json['executionBlockType'] as String?)
          ?.let(ExecutionBlockType.fromString),
      previousEventId: json['previousEventId'] as String?,
      resources: (json['resources'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      stepName: json['stepName'] as String?,
      timestamp: timeStampFromJson(json['timestamp']),
      type: (json['type'] as String?)?.let(ExecutionEventType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final eventId = this.eventId;
    final description = this.description;
    final error = this.error;
    final executionBlockType = this.executionBlockType;
    final previousEventId = this.previousEventId;
    final resources = this.resources;
    final stepName = this.stepName;
    final timestamp = this.timestamp;
    final type = this.type;
    return {
      'eventId': eventId,
      if (description != null) 'description': description,
      if (error != null) 'error': error,
      if (executionBlockType != null)
        'executionBlockType': executionBlockType.value,
      if (previousEventId != null) 'previousEventId': previousEventId,
      if (resources != null) 'resources': resources,
      if (stepName != null) 'stepName': stepName,
      if (timestamp != null) 'timestamp': unixTimestampToJson(timestamp),
      if (type != null) 'type': type.value,
    };
  }
}

/// @nodoc
class ExecutionEventType {
  static const unknown = ExecutionEventType._('unknown');
  static const executionPending = ExecutionEventType._('executionPending');
  static const executionStarted = ExecutionEventType._('executionStarted');
  static const executionSucceeded = ExecutionEventType._('executionSucceeded');
  static const executionFailed = ExecutionEventType._('executionFailed');
  static const executionPausing = ExecutionEventType._('executionPausing');
  static const executionPaused = ExecutionEventType._('executionPaused');
  static const executionCanceling = ExecutionEventType._('executionCanceling');
  static const executionCanceled = ExecutionEventType._('executionCanceled');
  static const executionPendingApproval =
      ExecutionEventType._('executionPendingApproval');
  static const executionBehaviorChangedToUngraceful =
      ExecutionEventType._('executionBehaviorChangedToUngraceful');
  static const executionBehaviorChangedToGraceful =
      ExecutionEventType._('executionBehaviorChangedToGraceful');
  static const executionPendingChildPlanManualApproval =
      ExecutionEventType._('executionPendingChildPlanManualApproval');
  static const executionSuccessMonitoringApplicationHealth =
      ExecutionEventType._('executionSuccessMonitoringApplicationHealth');
  static const stepStarted = ExecutionEventType._('stepStarted');
  static const stepUpdate = ExecutionEventType._('stepUpdate');
  static const stepSucceeded = ExecutionEventType._('stepSucceeded');
  static const stepFailed = ExecutionEventType._('stepFailed');
  static const stepSkipped = ExecutionEventType._('stepSkipped');
  static const stepPausedByError = ExecutionEventType._('stepPausedByError');
  static const stepPausedByOperator =
      ExecutionEventType._('stepPausedByOperator');
  static const stepCanceled = ExecutionEventType._('stepCanceled');
  static const stepPendingApproval =
      ExecutionEventType._('stepPendingApproval');
  static const stepExecutionBehaviorChangedToUngraceful =
      ExecutionEventType._('stepExecutionBehaviorChangedToUngraceful');
  static const stepPendingApplicationHealthMonitor =
      ExecutionEventType._('stepPendingApplicationHealthMonitor');
  static const planEvaluationWarning =
      ExecutionEventType._('planEvaluationWarning');

  final String value;

  const ExecutionEventType._(this.value);

  static const values = [
    unknown,
    executionPending,
    executionStarted,
    executionSucceeded,
    executionFailed,
    executionPausing,
    executionPaused,
    executionCanceling,
    executionCanceled,
    executionPendingApproval,
    executionBehaviorChangedToUngraceful,
    executionBehaviorChangedToGraceful,
    executionPendingChildPlanManualApproval,
    executionSuccessMonitoringApplicationHealth,
    stepStarted,
    stepUpdate,
    stepSucceeded,
    stepFailed,
    stepSkipped,
    stepPausedByError,
    stepPausedByOperator,
    stepCanceled,
    stepPendingApproval,
    stepExecutionBehaviorChangedToUngraceful,
    stepPendingApplicationHealthMonitor,
    planEvaluationWarning
  ];

  static ExecutionEventType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ExecutionEventType._(value));

  @override
  bool operator ==(other) =>
      other is ExecutionEventType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Information about a generated execution report.
///
/// @nodoc
class GeneratedReport {
  /// The timestamp when the report was generated.
  final DateTime? reportGenerationTime;

  /// The output location or cause of a failure in report generation.
  final ReportOutput? reportOutput;

  GeneratedReport({
    this.reportGenerationTime,
    this.reportOutput,
  });

  factory GeneratedReport.fromJson(Map<String, dynamic> json) {
    return GeneratedReport(
      reportGenerationTime: timeStampFromJson(json['reportGenerationTime']),
      reportOutput: json['reportOutput'] != null
          ? ReportOutput.fromJson(json['reportOutput'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final reportGenerationTime = this.reportGenerationTime;
    final reportOutput = this.reportOutput;
    return {
      if (reportGenerationTime != null)
        'reportGenerationTime': unixTimestampToJson(reportGenerationTime),
      if (reportOutput != null) 'reportOutput': reportOutput,
    };
  }
}

/// The output location or cause of a failure in report generation.
///
/// @nodoc
class ReportOutput {
  /// The details about a failed report generation.
  final FailedReportOutput? failedReportOutput;

  /// Information about a report delivered to Amazon S3.
  final S3ReportOutput? s3ReportOutput;

  ReportOutput({
    this.failedReportOutput,
    this.s3ReportOutput,
  });

  factory ReportOutput.fromJson(Map<String, dynamic> json) {
    return ReportOutput(
      failedReportOutput: json['failedReportOutput'] != null
          ? FailedReportOutput.fromJson(
              json['failedReportOutput'] as Map<String, dynamic>)
          : null,
      s3ReportOutput: json['s3ReportOutput'] != null
          ? S3ReportOutput.fromJson(
              json['s3ReportOutput'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final failedReportOutput = this.failedReportOutput;
    final s3ReportOutput = this.s3ReportOutput;
    return {
      if (failedReportOutput != null) 'failedReportOutput': failedReportOutput,
      if (s3ReportOutput != null) 's3ReportOutput': s3ReportOutput,
    };
  }
}

/// Information about a report delivered to Amazon S3.
///
/// @nodoc
class S3ReportOutput {
  /// The S3 object key where the generated report is stored.
  final String? s3ObjectKey;

  S3ReportOutput({
    this.s3ObjectKey,
  });

  factory S3ReportOutput.fromJson(Map<String, dynamic> json) {
    return S3ReportOutput(
      s3ObjectKey: json['s3ObjectKey'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final s3ObjectKey = this.s3ObjectKey;
    return {
      if (s3ObjectKey != null) 's3ObjectKey': s3ObjectKey,
    };
  }
}

/// Information about a report generation that failed.
///
/// @nodoc
class FailedReportOutput {
  /// The error code for the failed report generation.
  final FailedReportErrorCode? errorCode;

  /// The error message for the failed report generation.
  final String? errorMessage;

  FailedReportOutput({
    this.errorCode,
    this.errorMessage,
  });

  factory FailedReportOutput.fromJson(Map<String, dynamic> json) {
    return FailedReportOutput(
      errorCode:
          (json['errorCode'] as String?)?.let(FailedReportErrorCode.fromString),
      errorMessage: json['errorMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    return {
      if (errorCode != null) 'errorCode': errorCode.value,
      if (errorMessage != null) 'errorMessage': errorMessage,
    };
  }
}

/// @nodoc
class FailedReportErrorCode {
  static const insufficientPermissions =
      FailedReportErrorCode._('insufficientPermissions');
  static const invalidResource = FailedReportErrorCode._('invalidResource');
  static const configurationError =
      FailedReportErrorCode._('configurationError');

  final String value;

  const FailedReportErrorCode._(this.value);

  static const values = [
    insufficientPermissions,
    invalidResource,
    configurationError
  ];

  static FailedReportErrorCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => FailedReportErrorCode._(value));

  @override
  bool operator ==(other) =>
      other is FailedReportErrorCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents the state of a step in a plan execution.
///
/// @nodoc
class StepState {
  /// The timestamp when a step endeded execution.
  final DateTime? endTime;

  /// The name of a step in a workflow.
  final String? name;

  /// The timestamp when a step started execution.
  final DateTime? startTime;

  /// The status of a step in a workflow. For example, a status might be Completed
  /// or Pending Approval.
  final StepStatus? status;

  /// The mode for a step execution. The mode can be Graceful or Ungraceful.
  final ExecutionMode? stepMode;

  StepState({
    this.endTime,
    this.name,
    this.startTime,
    this.status,
    this.stepMode,
  });

  factory StepState.fromJson(Map<String, dynamic> json) {
    return StepState(
      endTime: timeStampFromJson(json['endTime']),
      name: json['name'] as String?,
      startTime: timeStampFromJson(json['startTime']),
      status: (json['status'] as String?)?.let(StepStatus.fromString),
      stepMode: (json['stepMode'] as String?)?.let(ExecutionMode.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final endTime = this.endTime;
    final name = this.name;
    final startTime = this.startTime;
    final status = this.status;
    final stepMode = this.stepMode;
    return {
      if (endTime != null) 'endTime': unixTimestampToJson(endTime),
      if (name != null) 'name': name,
      if (startTime != null) 'startTime': unixTimestampToJson(startTime),
      if (status != null) 'status': status.value,
      if (stepMode != null) 'stepMode': stepMode.value,
    };
  }
}

/// @nodoc
class StepStatus {
  static const notStarted = StepStatus._('notStarted');
  static const running = StepStatus._('running');
  static const failed = StepStatus._('failed');
  static const completed = StepStatus._('completed');
  static const canceled = StepStatus._('canceled');
  static const skipped = StepStatus._('skipped');
  static const pendingApproval = StepStatus._('pendingApproval');

  final String value;

  const StepStatus._(this.value);

  static const values = [
    notStarted,
    running,
    failed,
    completed,
    canceled,
    skipped,
    pendingApproval
  ];

  static StepStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => StepStatus._(value));

  @override
  bool operator ==(other) => other is StepStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class EvaluationStatus {
  static const passed = EvaluationStatus._('passed');
  static const actionRequired = EvaluationStatus._('actionRequired');
  static const pendingEvaluation = EvaluationStatus._('pendingEvaluation');
  static const unknown = EvaluationStatus._('unknown');

  final String value;

  const EvaluationStatus._(this.value);

  static const values = [passed, actionRequired, pendingEvaluation, unknown];

  static EvaluationStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EvaluationStatus._(value));

  @override
  bool operator ==(other) => other is EvaluationStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents a warning about a resource in a Region switch plan.
///
/// @nodoc
class ResourceWarning {
  /// The version for the resource warning.
  final String version;

  /// The warning message about what needs to be corrected.
  final String warningMessage;

  /// The status of the resource warning.
  final ResourceWarningStatus warningStatus;

  /// The timestamp when the warning was last updated.
  final DateTime warningUpdatedTime;

  /// The Amazon Resource Name (ARN) of the resource.
  final String? resourceArn;

  /// The name of the step for the resource warning.
  final String? stepName;

  /// The workflow for the resource warning.
  final MinimalWorkflow? workflow;

  ResourceWarning({
    required this.version,
    required this.warningMessage,
    required this.warningStatus,
    required this.warningUpdatedTime,
    this.resourceArn,
    this.stepName,
    this.workflow,
  });

  factory ResourceWarning.fromJson(Map<String, dynamic> json) {
    return ResourceWarning(
      version: (json['version'] as String?) ?? '',
      warningMessage: (json['warningMessage'] as String?) ?? '',
      warningStatus: ResourceWarningStatus.fromString(
          (json['warningStatus'] as String?) ?? ''),
      warningUpdatedTime:
          nonNullableTimeStampFromJson(json['warningUpdatedTime'] ?? 0),
      resourceArn: json['resourceArn'] as String?,
      stepName: json['stepName'] as String?,
      workflow: json['workflow'] != null
          ? MinimalWorkflow.fromJson(json['workflow'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final version = this.version;
    final warningMessage = this.warningMessage;
    final warningStatus = this.warningStatus;
    final warningUpdatedTime = this.warningUpdatedTime;
    final resourceArn = this.resourceArn;
    final stepName = this.stepName;
    final workflow = this.workflow;
    return {
      'version': version,
      'warningMessage': warningMessage,
      'warningStatus': warningStatus.value,
      'warningUpdatedTime': unixTimestampToJson(warningUpdatedTime),
      if (resourceArn != null) 'resourceArn': resourceArn,
      if (stepName != null) 'stepName': stepName,
      if (workflow != null) 'workflow': workflow,
    };
  }
}

/// A simplified representation of a workflow in a Region switch plan.
///
/// @nodoc
class MinimalWorkflow {
  /// The action for a minimal workflow, which can be Activate or Deactivate.
  final ExecutionAction? action;

  /// The name for a minimal workflow
  final String? name;

  MinimalWorkflow({
    this.action,
    this.name,
  });

  factory MinimalWorkflow.fromJson(Map<String, dynamic> json) {
    return MinimalWorkflow(
      action: (json['action'] as String?)?.let(ExecutionAction.fromString),
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final name = this.name;
    return {
      if (action != null) 'action': action.value,
      if (name != null) 'name': name,
    };
  }
}

/// @nodoc
class ResourceWarningStatus {
  static const active = ResourceWarningStatus._('active');
  static const resolved = ResourceWarningStatus._('resolved');

  final String value;

  const ResourceWarningStatus._(this.value);

  static const values = [active, resolved];

  static ResourceWarningStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ResourceWarningStatus._(value));

  @override
  bool operator ==(other) =>
      other is ResourceWarningStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class Approval {
  static const approve = Approval._('approve');
  static const decline = Approval._('decline');

  final String value;

  const Approval._(this.value);

  static const values = [approve, decline];

  static Approval fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => Approval._(value));

  @override
  bool operator ==(other) => other is Approval && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

/// @nodoc
class IllegalArgumentException extends _s.GenericAwsException {
  IllegalArgumentException({String? type, String? message})
      : super(type: type, code: 'IllegalArgumentException', message: message);
}

/// @nodoc
class IllegalStateException extends _s.GenericAwsException {
  IllegalStateException({String? type, String? message})
      : super(type: type, code: 'IllegalStateException', message: message);
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

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'IllegalArgumentException': (type, message) =>
      IllegalArgumentException(type: type, message: message),
  'IllegalStateException': (type, message) =>
      IllegalStateException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
};
