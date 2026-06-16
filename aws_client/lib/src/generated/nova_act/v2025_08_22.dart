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

/// The Nova Act service provides a REST API for managing AI-powered workflow
/// automation. It enables users to create workflow definitions, execute
/// workflow runs, manage sessions, and orchestrate acts (individual AI tasks)
/// with tool integrations.
class NovaAct {
  final _s.RestJsonProtocol _protocol;
  NovaAct({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'nova-act',
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

  /// Creates a new AI task (act) within a session that can interact with tools
  /// and perform specific actions.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [sessionId] :
  /// The unique identifier of the session to create the act in.
  ///
  /// Parameter [task] :
  /// The task description that defines what the act should accomplish.
  ///
  /// Parameter [workflowDefinitionName] :
  /// The name of the workflow definition containing the session.
  ///
  /// Parameter [workflowRunId] :
  /// The unique identifier of the workflow run containing the session.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [toolSpecs] :
  /// A list of tool specifications that the act can invoke to complete its
  /// task.
  Future<CreateActResponse> createAct({
    required String sessionId,
    required String task,
    required String workflowDefinitionName,
    required String workflowRunId,
    String? clientToken,
    List<ToolSpec>? toolSpecs,
  }) async {
    final $payload = <String, dynamic>{
      'task': task,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (toolSpecs != null) 'toolSpecs': toolSpecs,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/workflow-definitions/${Uri.encodeComponent(workflowDefinitionName)}/workflow-runs/${Uri.encodeComponent(workflowRunId)}/sessions/${Uri.encodeComponent(sessionId)}/acts',
      exceptionFnMap: _exceptionFns,
    );
    return CreateActResponse.fromJson(response);
  }

  /// Lists all acts within a specific session with their current status and
  /// execution details.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [workflowDefinitionName] :
  /// The name of the workflow definition containing the session.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of acts to return in a single response.
  ///
  /// Parameter [nextToken] :
  /// The token for retrieving the next page of results.
  ///
  /// Parameter [sessionId] :
  /// The unique identifier of the session to list acts for.
  ///
  /// Parameter [sortOrder] :
  /// The sort order for the returned acts (ascending or descending).
  ///
  /// Parameter [workflowRunId] :
  /// The unique identifier of the workflow run containing the session.
  Future<ListActsResponse> listActs({
    required String workflowDefinitionName,
    int? maxResults,
    String? nextToken,
    String? sessionId,
    SortOrder? sortOrder,
    String? workflowRunId,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (sessionId != null) 'sessionId': [sessionId],
      if (workflowRunId != null) 'workflowRunId': [workflowRunId],
    };
    final $payload = <String, dynamic>{
      if (sortOrder != null) 'sortOrder': sortOrder.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/workflow-definitions/${Uri.encodeComponent(workflowDefinitionName)}/acts',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListActsResponse.fromJson(response);
  }

  /// Executes the next step of an act, processing tool call results and
  /// returning new tool calls if needed.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [actId] :
  /// The unique identifier of the act to invoke the next step for.
  ///
  /// Parameter [callResults] :
  /// The results from previous tool calls that the act requested.
  ///
  /// Parameter [sessionId] :
  /// The unique identifier of the session containing the act.
  ///
  /// Parameter [workflowDefinitionName] :
  /// The name of the workflow definition containing the act.
  ///
  /// Parameter [workflowRunId] :
  /// The unique identifier of the workflow run containing the act.
  ///
  /// Parameter [previousStepId] :
  /// The identifier of the previous step, used for tracking execution flow.
  Future<InvokeActStepResponse> invokeActStep({
    required String actId,
    required List<CallResult> callResults,
    required String sessionId,
    required String workflowDefinitionName,
    required String workflowRunId,
    String? previousStepId,
  }) async {
    final $payload = <String, dynamic>{
      'callResults': callResults,
      if (previousStepId != null) 'previousStepId': previousStepId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/workflow-definitions/${Uri.encodeComponent(workflowDefinitionName)}/workflow-runs/${Uri.encodeComponent(workflowRunId)}/sessions/${Uri.encodeComponent(sessionId)}/acts/${Uri.encodeComponent(actId)}/invoke-step/',
      exceptionFnMap: _exceptionFns,
    );
    return InvokeActStepResponse.fromJson(response);
  }

  /// Updates an existing act's configuration, status, or error information.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [actId] :
  /// The unique identifier of the act to update.
  ///
  /// Parameter [sessionId] :
  /// The unique identifier of the session containing the act.
  ///
  /// Parameter [status] :
  /// The new status to set for the act.
  ///
  /// Parameter [workflowDefinitionName] :
  /// The name of the workflow definition containing the act.
  ///
  /// Parameter [workflowRunId] :
  /// The unique identifier of the workflow run containing the act.
  ///
  /// Parameter [error] :
  /// Error information to associate with the act, if applicable.
  Future<void> updateAct({
    required String actId,
    required String sessionId,
    required ActStatus status,
    required String workflowDefinitionName,
    required String workflowRunId,
    ActError? error,
  }) async {
    final $payload = <String, dynamic>{
      'status': status.value,
      if (error != null) 'error': error,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/workflow-definitions/${Uri.encodeComponent(workflowDefinitionName)}/workflow-runs/${Uri.encodeComponent(workflowRunId)}/sessions/${Uri.encodeComponent(sessionId)}/acts/${Uri.encodeComponent(actId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists all available AI models that can be used for workflow execution,
  /// including their status and compatibility information.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [clientCompatibilityVersion] :
  /// The client compatibility version to filter models by compatibility.
  Future<ListModelsResponse> listModels({
    required int clientCompatibilityVersion,
  }) async {
    final $query = <String, List<String>>{
      'clientCompatibilityVersion': [clientCompatibilityVersion.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/models',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListModelsResponse.fromJson(response);
  }

  /// Creates a new session context within a workflow run to manage conversation
  /// state and acts.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [workflowDefinitionName] :
  /// The name of the workflow definition containing the workflow run.
  ///
  /// Parameter [workflowRunId] :
  /// The unique identifier of the workflow run to create the session in.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  Future<CreateSessionResponse> createSession({
    required String workflowDefinitionName,
    required String workflowRunId,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/workflow-definitions/${Uri.encodeComponent(workflowDefinitionName)}/workflow-runs/${Uri.encodeComponent(workflowRunId)}/sessions',
      exceptionFnMap: _exceptionFns,
    );
    return CreateSessionResponse.fromJson(response);
  }

  /// Lists all sessions within a specific workflow run.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [workflowDefinitionName] :
  /// The name of the workflow definition containing the workflow run.
  ///
  /// Parameter [workflowRunId] :
  /// The unique identifier of the workflow run to list sessions for.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of sessions to return in a single response.
  ///
  /// Parameter [nextToken] :
  /// The token for retrieving the next page of results.
  ///
  /// Parameter [sortOrder] :
  /// The sort order for the returned sessions (ascending or descending).
  Future<ListSessionsResponse> listSessions({
    required String workflowDefinitionName,
    required String workflowRunId,
    int? maxResults,
    String? nextToken,
    SortOrder? sortOrder,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final $payload = <String, dynamic>{
      if (sortOrder != null) 'sortOrder': sortOrder.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/workflow-definitions/${Uri.encodeComponent(workflowDefinitionName)}/workflow-runs/${Uri.encodeComponent(workflowRunId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSessionsResponse.fromJson(response);
  }

  /// Creates a new workflow definition template that can be used to execute
  /// multiple workflow runs.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the workflow definition. Must be unique within your account
  /// and region.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [description] :
  /// An optional description of the workflow definition's purpose and
  /// functionality.
  ///
  /// Parameter [exportConfig] :
  /// Configuration for exporting workflow execution data to Amazon Simple
  /// Storage Service.
  Future<CreateWorkflowDefinitionResponse> createWorkflowDefinition({
    required String name,
    String? clientToken,
    String? description,
    WorkflowExportConfig? exportConfig,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (exportConfig != null) 'exportConfig': exportConfig,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/workflow-definitions',
      exceptionFnMap: _exceptionFns,
    );
    return CreateWorkflowDefinitionResponse.fromJson(response);
  }

  /// Retrieves the details and configuration of a specific workflow definition.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [workflowDefinitionName] :
  /// The name of the workflow definition to retrieve.
  Future<GetWorkflowDefinitionResponse> getWorkflowDefinition({
    required String workflowDefinitionName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/workflow-definitions/${Uri.encodeComponent(workflowDefinitionName)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetWorkflowDefinitionResponse.fromJson(response);
  }

  /// Deletes a workflow definition and all associated resources. This operation
  /// cannot be undone.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [workflowDefinitionName] :
  /// The name of the workflow definition to delete.
  Future<DeleteWorkflowDefinitionResponse> deleteWorkflowDefinition({
    required String workflowDefinitionName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/workflow-definitions/${Uri.encodeComponent(workflowDefinitionName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteWorkflowDefinitionResponse.fromJson(response);
  }

  /// Lists all workflow definitions in your account with optional filtering and
  /// pagination.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of workflow definitions to return in a single response.
  ///
  /// Parameter [nextToken] :
  /// The token for retrieving the next page of results.
  ///
  /// Parameter [sortOrder] :
  /// The sort order for the returned workflow definitions (ascending or
  /// descending).
  Future<ListWorkflowDefinitionsResponse> listWorkflowDefinitions({
    int? maxResults,
    String? nextToken,
    SortOrder? sortOrder,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final $payload = <String, dynamic>{
      if (sortOrder != null) 'sortOrder': sortOrder.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/workflow-definitions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListWorkflowDefinitionsResponse.fromJson(response);
  }

  /// Creates a new execution instance of a workflow definition with specified
  /// parameters.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [clientInfo] :
  /// Information about the client making the request, including compatibility
  /// version and SDK version.
  ///
  /// Parameter [modelId] :
  /// The ID of the AI model to use for workflow execution.
  ///
  /// Parameter [workflowDefinitionName] :
  /// The name of the workflow definition to execute.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [logGroupName] :
  /// The CloudWatch log group name for storing workflow execution logs.
  Future<CreateWorkflowRunResponse> createWorkflowRun({
    required ClientInfo clientInfo,
    required String modelId,
    required String workflowDefinitionName,
    String? clientToken,
    String? logGroupName,
  }) async {
    final $payload = <String, dynamic>{
      'clientInfo': clientInfo,
      'modelId': modelId,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (logGroupName != null) 'logGroupName': logGroupName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/workflow-definitions/${Uri.encodeComponent(workflowDefinitionName)}/workflow-runs',
      exceptionFnMap: _exceptionFns,
    );
    return CreateWorkflowRunResponse.fromJson(response);
  }

  /// Retrieves the current state, configuration, and execution details of a
  /// workflow run.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [workflowDefinitionName] :
  /// The name of the workflow definition containing the workflow run.
  ///
  /// Parameter [workflowRunId] :
  /// The unique identifier of the workflow run to retrieve.
  Future<GetWorkflowRunResponse> getWorkflowRun({
    required String workflowDefinitionName,
    required String workflowRunId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/workflow-definitions/${Uri.encodeComponent(workflowDefinitionName)}/workflow-runs/${Uri.encodeComponent(workflowRunId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetWorkflowRunResponse.fromJson(response);
  }

  /// Updates the configuration or state of an active workflow run.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [status] :
  /// The new status to set for the workflow run.
  ///
  /// Parameter [workflowDefinitionName] :
  /// The name of the workflow definition containing the workflow run.
  ///
  /// Parameter [workflowRunId] :
  /// The unique identifier of the workflow run to update.
  Future<void> updateWorkflowRun({
    required WorkflowRunStatus status,
    required String workflowDefinitionName,
    required String workflowRunId,
  }) async {
    final $payload = <String, dynamic>{
      'status': status.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/workflow-definitions/${Uri.encodeComponent(workflowDefinitionName)}/workflow-runs/${Uri.encodeComponent(workflowRunId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Terminates and cleans up a workflow run, stopping all associated acts and
  /// sessions.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [workflowDefinitionName] :
  /// The name of the workflow definition containing the workflow run.
  ///
  /// Parameter [workflowRunId] :
  /// The unique identifier of the workflow run to delete.
  Future<DeleteWorkflowRunResponse> deleteWorkflowRun({
    required String workflowDefinitionName,
    required String workflowRunId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/workflow-definitions/${Uri.encodeComponent(workflowDefinitionName)}/workflow-runs/${Uri.encodeComponent(workflowRunId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteWorkflowRunResponse.fromJson(response);
  }

  /// Lists all workflow runs for a specific workflow definition with optional
  /// filtering and pagination.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [workflowDefinitionName] :
  /// The name of the workflow definition to list workflow runs for.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of workflow runs to return in a single response.
  ///
  /// Parameter [nextToken] :
  /// The token for retrieving the next page of results.
  ///
  /// Parameter [sortOrder] :
  /// The sort order for the returned workflow runs (ascending or descending).
  Future<ListWorkflowRunsResponse> listWorkflowRuns({
    required String workflowDefinitionName,
    int? maxResults,
    String? nextToken,
    SortOrder? sortOrder,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final $payload = <String, dynamic>{
      if (sortOrder != null) 'sortOrder': sortOrder.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/workflow-definitions/${Uri.encodeComponent(workflowDefinitionName)}/workflow-runs',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListWorkflowRunsResponse.fromJson(response);
  }
}

class CreateActResponse {
  /// The unique identifier for the created act.
  final String actId;

  /// The initial status of the act after creation.
  final ActStatus status;

  CreateActResponse({
    required this.actId,
    required this.status,
  });

  factory CreateActResponse.fromJson(Map<String, dynamic> json) {
    return CreateActResponse(
      actId: (json['actId'] as String?) ?? '',
      status: ActStatus.fromString((json['status'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final actId = this.actId;
    final status = this.status;
    return {
      'actId': actId,
      'status': status.value,
    };
  }
}

class ListActsResponse {
  /// A list of summary information for acts in the session.
  final List<ActSummary> actSummaries;

  /// The token for retrieving the next page of results, if available.
  final String? nextToken;

  ListActsResponse({
    required this.actSummaries,
    this.nextToken,
  });

  factory ListActsResponse.fromJson(Map<String, dynamic> json) {
    return ListActsResponse(
      actSummaries: ((json['actSummaries'] as List?) ?? const [])
          .nonNulls
          .map((e) => ActSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final actSummaries = this.actSummaries;
    final nextToken = this.nextToken;
    return {
      'actSummaries': actSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class InvokeActStepResponse {
  /// A list of tool calls that the act wants to execute in this step.
  final List<Call> calls;

  /// The unique identifier for this execution step.
  final String stepId;

  InvokeActStepResponse({
    required this.calls,
    required this.stepId,
  });

  factory InvokeActStepResponse.fromJson(Map<String, dynamic> json) {
    return InvokeActStepResponse(
      calls: ((json['calls'] as List?) ?? const [])
          .nonNulls
          .map((e) => Call.fromJson(e as Map<String, dynamic>))
          .toList(),
      stepId: (json['stepId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final calls = this.calls;
    final stepId = this.stepId;
    return {
      'calls': calls,
      'stepId': stepId,
    };
  }
}

class UpdateActResponse {
  UpdateActResponse();

  factory UpdateActResponse.fromJson(Map<String, dynamic> _) {
    return UpdateActResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class ListModelsResponse {
  /// Information about client compatibility and supported models.
  final CompatibilityInformation compatibilityInformation;

  /// A list of model aliases that provide stable references to model versions.
  final List<ModelAlias> modelAliases;

  /// A list of available AI models with their status and compatibility
  /// information.
  final List<ModelSummary> modelSummaries;

  ListModelsResponse({
    required this.compatibilityInformation,
    required this.modelAliases,
    required this.modelSummaries,
  });

  factory ListModelsResponse.fromJson(Map<String, dynamic> json) {
    return ListModelsResponse(
      compatibilityInformation: CompatibilityInformation.fromJson(
          (json['compatibilityInformation'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      modelAliases: ((json['modelAliases'] as List?) ?? const [])
          .nonNulls
          .map((e) => ModelAlias.fromJson(e as Map<String, dynamic>))
          .toList(),
      modelSummaries: ((json['modelSummaries'] as List?) ?? const [])
          .nonNulls
          .map((e) => ModelSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final compatibilityInformation = this.compatibilityInformation;
    final modelAliases = this.modelAliases;
    final modelSummaries = this.modelSummaries;
    return {
      'compatibilityInformation': compatibilityInformation,
      'modelAliases': modelAliases,
      'modelSummaries': modelSummaries,
    };
  }
}

class CreateSessionResponse {
  /// The unique identifier for the created session.
  final String sessionId;

  CreateSessionResponse({
    required this.sessionId,
  });

  factory CreateSessionResponse.fromJson(Map<String, dynamic> json) {
    return CreateSessionResponse(
      sessionId: (json['sessionId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final sessionId = this.sessionId;
    return {
      'sessionId': sessionId,
    };
  }
}

class ListSessionsResponse {
  /// A list of summary information for sessions in the workflow run.
  final List<SessionSummary> sessionSummaries;

  /// The token for retrieving the next page of results, if available.
  final String? nextToken;

  ListSessionsResponse({
    required this.sessionSummaries,
    this.nextToken,
  });

  factory ListSessionsResponse.fromJson(Map<String, dynamic> json) {
    return ListSessionsResponse(
      sessionSummaries: ((json['sessionSummaries'] as List?) ?? const [])
          .nonNulls
          .map((e) => SessionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final sessionSummaries = this.sessionSummaries;
    final nextToken = this.nextToken;
    return {
      'sessionSummaries': sessionSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class CreateWorkflowDefinitionResponse {
  /// The current status of the workflow definition after creation.
  final WorkflowDefinitionStatus status;

  CreateWorkflowDefinitionResponse({
    required this.status,
  });

  factory CreateWorkflowDefinitionResponse.fromJson(Map<String, dynamic> json) {
    return CreateWorkflowDefinitionResponse(
      status: WorkflowDefinitionStatus.fromString(
          (json['status'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      'status': status.value,
    };
  }
}

class GetWorkflowDefinitionResponse {
  /// The Amazon Resource Name (ARN) of the workflow definition.
  final String arn;

  /// The timestamp when the workflow definition was created.
  final DateTime createdAt;

  /// The name of the workflow definition.
  final String name;

  /// The current status of the workflow definition.
  final WorkflowDefinitionStatus status;

  /// The description of the workflow definition.
  final String? description;

  /// The export configuration for the workflow definition.
  final WorkflowExportConfig? exportConfig;

  GetWorkflowDefinitionResponse({
    required this.arn,
    required this.createdAt,
    required this.name,
    required this.status,
    this.description,
    this.exportConfig,
  });

  factory GetWorkflowDefinitionResponse.fromJson(Map<String, dynamic> json) {
    return GetWorkflowDefinitionResponse(
      arn: (json['arn'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      name: (json['name'] as String?) ?? '',
      status: WorkflowDefinitionStatus.fromString(
          (json['status'] as String?) ?? ''),
      description: json['description'] as String?,
      exportConfig: json['exportConfig'] != null
          ? WorkflowExportConfig.fromJson(
              json['exportConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final name = this.name;
    final status = this.status;
    final description = this.description;
    final exportConfig = this.exportConfig;
    return {
      'arn': arn,
      'createdAt': iso8601ToJson(createdAt),
      'name': name,
      'status': status.value,
      if (description != null) 'description': description,
      if (exportConfig != null) 'exportConfig': exportConfig,
    };
  }
}

class DeleteWorkflowDefinitionResponse {
  /// The status of the workflow definition after deletion request.
  final WorkflowDefinitionStatus status;

  DeleteWorkflowDefinitionResponse({
    required this.status,
  });

  factory DeleteWorkflowDefinitionResponse.fromJson(Map<String, dynamic> json) {
    return DeleteWorkflowDefinitionResponse(
      status: WorkflowDefinitionStatus.fromString(
          (json['status'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      'status': status.value,
    };
  }
}

class ListWorkflowDefinitionsResponse {
  /// A list of summary information for workflow definitions.
  final List<WorkflowDefinitionSummary> workflowDefinitionSummaries;

  /// The token for retrieving the next page of results, if available.
  final String? nextToken;

  ListWorkflowDefinitionsResponse({
    required this.workflowDefinitionSummaries,
    this.nextToken,
  });

  factory ListWorkflowDefinitionsResponse.fromJson(Map<String, dynamic> json) {
    return ListWorkflowDefinitionsResponse(
      workflowDefinitionSummaries:
          ((json['workflowDefinitionSummaries'] as List?) ?? const [])
              .nonNulls
              .map((e) =>
                  WorkflowDefinitionSummary.fromJson(e as Map<String, dynamic>))
              .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final workflowDefinitionSummaries = this.workflowDefinitionSummaries;
    final nextToken = this.nextToken;
    return {
      'workflowDefinitionSummaries': workflowDefinitionSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class CreateWorkflowRunResponse {
  /// The initial status of the workflow run after creation.
  final WorkflowRunStatus status;

  /// The unique identifier for the created workflow run.
  final String workflowRunId;

  CreateWorkflowRunResponse({
    required this.status,
    required this.workflowRunId,
  });

  factory CreateWorkflowRunResponse.fromJson(Map<String, dynamic> json) {
    return CreateWorkflowRunResponse(
      status: WorkflowRunStatus.fromString((json['status'] as String?) ?? ''),
      workflowRunId: (json['workflowRunId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final workflowRunId = this.workflowRunId;
    return {
      'status': status.value,
      'workflowRunId': workflowRunId,
    };
  }
}

class GetWorkflowRunResponse {
  /// The ID of the AI model being used for this workflow run.
  final String modelId;

  /// The timestamp when the workflow run started execution.
  final DateTime startedAt;

  /// The current execution status of the workflow run.
  final WorkflowRunStatus status;

  /// The Amazon Resource Name (ARN) of the workflow run.
  final String workflowRunArn;

  /// The unique identifier of the workflow run.
  final String workflowRunId;

  /// The timestamp when the workflow run completed execution, if applicable.
  final DateTime? endedAt;

  /// The CloudWatch log group name for this workflow run's logs.
  final String? logGroupName;

  GetWorkflowRunResponse({
    required this.modelId,
    required this.startedAt,
    required this.status,
    required this.workflowRunArn,
    required this.workflowRunId,
    this.endedAt,
    this.logGroupName,
  });

  factory GetWorkflowRunResponse.fromJson(Map<String, dynamic> json) {
    return GetWorkflowRunResponse(
      modelId: (json['modelId'] as String?) ?? '',
      startedAt: nonNullableTimeStampFromJson(json['startedAt'] ?? 0),
      status: WorkflowRunStatus.fromString((json['status'] as String?) ?? ''),
      workflowRunArn: (json['workflowRunArn'] as String?) ?? '',
      workflowRunId: (json['workflowRunId'] as String?) ?? '',
      endedAt: timeStampFromJson(json['endedAt']),
      logGroupName: json['logGroupName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final modelId = this.modelId;
    final startedAt = this.startedAt;
    final status = this.status;
    final workflowRunArn = this.workflowRunArn;
    final workflowRunId = this.workflowRunId;
    final endedAt = this.endedAt;
    final logGroupName = this.logGroupName;
    return {
      'modelId': modelId,
      'startedAt': iso8601ToJson(startedAt),
      'status': status.value,
      'workflowRunArn': workflowRunArn,
      'workflowRunId': workflowRunId,
      if (endedAt != null) 'endedAt': iso8601ToJson(endedAt),
      if (logGroupName != null) 'logGroupName': logGroupName,
    };
  }
}

class UpdateWorkflowRunResponse {
  UpdateWorkflowRunResponse();

  factory UpdateWorkflowRunResponse.fromJson(Map<String, dynamic> _) {
    return UpdateWorkflowRunResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteWorkflowRunResponse {
  /// The status of the workflow run after deletion request.
  final WorkflowRunStatus status;

  DeleteWorkflowRunResponse({
    required this.status,
  });

  factory DeleteWorkflowRunResponse.fromJson(Map<String, dynamic> json) {
    return DeleteWorkflowRunResponse(
      status: WorkflowRunStatus.fromString((json['status'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      'status': status.value,
    };
  }
}

class ListWorkflowRunsResponse {
  /// A list of summary information for workflow runs.
  final List<WorkflowRunSummary> workflowRunSummaries;

  /// The token for retrieving the next page of results, if available.
  final String? nextToken;

  ListWorkflowRunsResponse({
    required this.workflowRunSummaries,
    this.nextToken,
  });

  factory ListWorkflowRunsResponse.fromJson(Map<String, dynamic> json) {
    return ListWorkflowRunsResponse(
      workflowRunSummaries: ((json['workflowRunSummaries'] as List?) ??
              const [])
          .nonNulls
          .map((e) => WorkflowRunSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final workflowRunSummaries = this.workflowRunSummaries;
    final nextToken = this.nextToken;
    return {
      'workflowRunSummaries': workflowRunSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Summary information about a workflow run, including execution status and
/// timing.
class WorkflowRunSummary {
  /// The timestamp when the workflow run started execution.
  final DateTime startedAt;

  /// The current execution status of the workflow run.
  final WorkflowRunStatus status;

  /// The Amazon Resource Name (ARN) of the workflow run.
  final String workflowRunArn;

  /// The unique identifier of the workflow run.
  final String workflowRunId;

  /// The timestamp when the workflow run completed execution, if applicable.
  final DateTime? endedAt;

  /// The location where trace information for this workflow run is stored.
  final TraceLocation? traceLocation;

  WorkflowRunSummary({
    required this.startedAt,
    required this.status,
    required this.workflowRunArn,
    required this.workflowRunId,
    this.endedAt,
    this.traceLocation,
  });

  factory WorkflowRunSummary.fromJson(Map<String, dynamic> json) {
    return WorkflowRunSummary(
      startedAt: nonNullableTimeStampFromJson(json['startedAt'] ?? 0),
      status: WorkflowRunStatus.fromString((json['status'] as String?) ?? ''),
      workflowRunArn: (json['workflowRunArn'] as String?) ?? '',
      workflowRunId: (json['workflowRunId'] as String?) ?? '',
      endedAt: timeStampFromJson(json['endedAt']),
      traceLocation: json['traceLocation'] != null
          ? TraceLocation.fromJson(
              json['traceLocation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final startedAt = this.startedAt;
    final status = this.status;
    final workflowRunArn = this.workflowRunArn;
    final workflowRunId = this.workflowRunId;
    final endedAt = this.endedAt;
    final traceLocation = this.traceLocation;
    return {
      'startedAt': iso8601ToJson(startedAt),
      'status': status.value,
      'workflowRunArn': workflowRunArn,
      'workflowRunId': workflowRunId,
      if (endedAt != null) 'endedAt': iso8601ToJson(endedAt),
      if (traceLocation != null) 'traceLocation': traceLocation,
    };
  }
}

class WorkflowRunStatus {
  static const running = WorkflowRunStatus._('RUNNING');
  static const succeeded = WorkflowRunStatus._('SUCCEEDED');
  static const failed = WorkflowRunStatus._('FAILED');
  static const timedOut = WorkflowRunStatus._('TIMED_OUT');
  static const deleting = WorkflowRunStatus._('DELETING');

  final String value;

  const WorkflowRunStatus._(this.value);

  static const values = [running, succeeded, failed, timedOut, deleting];

  static WorkflowRunStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => WorkflowRunStatus._(value));

  @override
  bool operator ==(other) => other is WorkflowRunStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Information about where trace data is stored for debugging and monitoring.
class TraceLocation {
  /// The specific location where the trace data is stored.
  final String location;

  /// The type of storage location for the trace data.
  final TraceLocationType locationType;

  TraceLocation({
    required this.location,
    required this.locationType,
  });

  factory TraceLocation.fromJson(Map<String, dynamic> json) {
    return TraceLocation(
      location: (json['location'] as String?) ?? '',
      locationType:
          TraceLocationType.fromString((json['locationType'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final location = this.location;
    final locationType = this.locationType;
    return {
      'location': location,
      'locationType': locationType.value,
    };
  }
}

class TraceLocationType {
  static const s3 = TraceLocationType._('S3');

  final String value;

  const TraceLocationType._(this.value);

  static const values = [s3];

  static TraceLocationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TraceLocationType._(value));

  @override
  bool operator ==(other) => other is TraceLocationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class SortOrder {
  static const ascending = SortOrder._('Ascending');
  static const descending = SortOrder._('Descending');

  final String value;

  const SortOrder._(this.value);

  static const values = [ascending, descending];

  static SortOrder fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => SortOrder._(value));

  @override
  bool operator ==(other) => other is SortOrder && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Information about the client making API requests, used for compatibility
/// checking.
class ClientInfo {
  /// The compatibility version of the client, used to ensure API compatibility.
  final int compatibilityVersion;

  /// The version of the SDK being used by the client.
  final String? sdkVersion;

  ClientInfo({
    required this.compatibilityVersion,
    this.sdkVersion,
  });

  Map<String, dynamic> toJson() {
    final compatibilityVersion = this.compatibilityVersion;
    final sdkVersion = this.sdkVersion;
    return {
      'compatibilityVersion': compatibilityVersion,
      if (sdkVersion != null) 'sdkVersion': sdkVersion,
    };
  }
}

/// Summary information about a workflow definition, used in list operations.
class WorkflowDefinitionSummary {
  /// The timestamp when the workflow definition was created.
  final DateTime createdAt;

  /// The current status of the workflow definition.
  final WorkflowDefinitionStatus status;

  /// The Amazon Resource Name (ARN) of the workflow definition.
  final String workflowDefinitionArn;

  /// The name of the workflow definition.
  final String workflowDefinitionName;

  WorkflowDefinitionSummary({
    required this.createdAt,
    required this.status,
    required this.workflowDefinitionArn,
    required this.workflowDefinitionName,
  });

  factory WorkflowDefinitionSummary.fromJson(Map<String, dynamic> json) {
    return WorkflowDefinitionSummary(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      status: WorkflowDefinitionStatus.fromString(
          (json['status'] as String?) ?? ''),
      workflowDefinitionArn: (json['workflowDefinitionArn'] as String?) ?? '',
      workflowDefinitionName: (json['workflowDefinitionName'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final status = this.status;
    final workflowDefinitionArn = this.workflowDefinitionArn;
    final workflowDefinitionName = this.workflowDefinitionName;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'status': status.value,
      'workflowDefinitionArn': workflowDefinitionArn,
      'workflowDefinitionName': workflowDefinitionName,
    };
  }
}

class WorkflowDefinitionStatus {
  static const active = WorkflowDefinitionStatus._('ACTIVE');
  static const deleting = WorkflowDefinitionStatus._('DELETING');

  final String value;

  const WorkflowDefinitionStatus._(this.value);

  static const values = [active, deleting];

  static WorkflowDefinitionStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => WorkflowDefinitionStatus._(value));

  @override
  bool operator ==(other) =>
      other is WorkflowDefinitionStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Configuration settings for exporting workflow execution data and logs to
/// Amazon Simple Storage Service (Amazon S3).
class WorkflowExportConfig {
  /// The name of your Amazon S3 bucket, that Nova Act uses to export your
  /// workflow data. Note that the IAM role used to access Nova Act must also have
  /// write permissions to this bucket.
  final String s3BucketName;

  /// An optional prefix for Amazon S3 object keys to organize exported data.
  final String? s3KeyPrefix;

  WorkflowExportConfig({
    required this.s3BucketName,
    this.s3KeyPrefix,
  });

  factory WorkflowExportConfig.fromJson(Map<String, dynamic> json) {
    return WorkflowExportConfig(
      s3BucketName: (json['s3BucketName'] as String?) ?? '',
      s3KeyPrefix: json['s3KeyPrefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final s3BucketName = this.s3BucketName;
    final s3KeyPrefix = this.s3KeyPrefix;
    return {
      's3BucketName': s3BucketName,
      if (s3KeyPrefix != null) 's3KeyPrefix': s3KeyPrefix,
    };
  }
}

/// Summary information about a session within a workflow run.
class SessionSummary {
  /// The unique identifier of the session.
  final String sessionId;

  SessionSummary({
    required this.sessionId,
  });

  factory SessionSummary.fromJson(Map<String, dynamic> json) {
    return SessionSummary(
      sessionId: (json['sessionId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final sessionId = this.sessionId;
    return {
      'sessionId': sessionId,
    };
  }
}

/// Information about client compatibility and supported model versions.
class CompatibilityInformation {
  /// The client compatibility version that was requested.
  final int clientCompatibilityVersion;

  /// A list of model IDs that are supported for the client compatibility version.
  final List<String> supportedModelIds;

  /// Additional information about compatibility requirements or recommendations.
  final String? message;

  CompatibilityInformation({
    required this.clientCompatibilityVersion,
    required this.supportedModelIds,
    this.message,
  });

  factory CompatibilityInformation.fromJson(Map<String, dynamic> json) {
    return CompatibilityInformation(
      clientCompatibilityVersion:
          (json['clientCompatibilityVersion'] as int?) ?? 0,
      supportedModelIds: ((json['supportedModelIds'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clientCompatibilityVersion = this.clientCompatibilityVersion;
    final supportedModelIds = this.supportedModelIds;
    final message = this.message;
    return {
      'clientCompatibilityVersion': clientCompatibilityVersion,
      'supportedModelIds': supportedModelIds,
      if (message != null) 'message': message,
    };
  }
}

/// An alias that provides a stable reference to a model version.
class ModelAlias {
  /// The name of the model alias.
  final String aliasName;

  /// The model ID that this alias currently points to.
  final String latestModelId;

  /// The resolved model ID after alias resolution.
  final String? resolvedModelId;

  ModelAlias({
    required this.aliasName,
    required this.latestModelId,
    this.resolvedModelId,
  });

  factory ModelAlias.fromJson(Map<String, dynamic> json) {
    return ModelAlias(
      aliasName: (json['aliasName'] as String?) ?? '',
      latestModelId: (json['latestModelId'] as String?) ?? '',
      resolvedModelId: json['resolvedModelId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final aliasName = this.aliasName;
    final latestModelId = this.latestModelId;
    final resolvedModelId = this.resolvedModelId;
    return {
      'aliasName': aliasName,
      'latestModelId': latestModelId,
      if (resolvedModelId != null) 'resolvedModelId': resolvedModelId,
    };
  }
}

/// Summary information about an available AI model.
class ModelSummary {
  /// The minimum client compatibility version required to use this model.
  final int minimumCompatibilityVersion;

  /// The unique identifier of the model.
  final String modelId;

  /// The lifecycle information for the model.
  final ModelLifecycle modelLifecycle;

  ModelSummary({
    required this.minimumCompatibilityVersion,
    required this.modelId,
    required this.modelLifecycle,
  });

  factory ModelSummary.fromJson(Map<String, dynamic> json) {
    return ModelSummary(
      minimumCompatibilityVersion:
          (json['minimumCompatibilityVersion'] as int?) ?? 0,
      modelId: (json['modelId'] as String?) ?? '',
      modelLifecycle: ModelLifecycle.fromJson(
          (json['modelLifecycle'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final minimumCompatibilityVersion = this.minimumCompatibilityVersion;
    final modelId = this.modelId;
    final modelLifecycle = this.modelLifecycle;
    return {
      'minimumCompatibilityVersion': minimumCompatibilityVersion,
      'modelId': modelId,
      'modelLifecycle': modelLifecycle,
    };
  }
}

/// Lifecycle information for an AI model.
class ModelLifecycle {
  /// The current lifecycle status of the model.
  final ModelStatus status;

  ModelLifecycle({
    required this.status,
  });

  factory ModelLifecycle.fromJson(Map<String, dynamic> json) {
    return ModelLifecycle(
      status: ModelStatus.fromString((json['status'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      'status': status.value,
    };
  }
}

class ModelStatus {
  static const active = ModelStatus._('ACTIVE');
  static const legacy = ModelStatus._('LEGACY');
  static const deprecated = ModelStatus._('DEPRECATED');
  static const preview = ModelStatus._('PREVIEW');

  final String value;

  const ModelStatus._(this.value);

  static const values = [active, legacy, deprecated, preview];

  static ModelStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ModelStatus._(value));

  @override
  bool operator ==(other) => other is ModelStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class ActStatus {
  static const running = ActStatus._('RUNNING');
  static const pendingClientAction = ActStatus._('PENDING_CLIENT_ACTION');
  static const pendingHumanAction = ActStatus._('PENDING_HUMAN_ACTION');
  static const succeeded = ActStatus._('SUCCEEDED');
  static const failed = ActStatus._('FAILED');
  static const timedOut = ActStatus._('TIMED_OUT');

  final String value;

  const ActStatus._(this.value);

  static const values = [
    running,
    pendingClientAction,
    pendingHumanAction,
    succeeded,
    failed,
    timedOut
  ];

  static ActStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ActStatus._(value));

  @override
  bool operator ==(other) => other is ActStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Error information when an act fails to execute successfully.
class ActError {
  /// A human-readable description of the error that occurred.
  final String message;

  /// The type or category of error that occurred.
  final String? type;

  ActError({
    required this.message,
    this.type,
  });

  Map<String, dynamic> toJson() {
    final message = this.message;
    final type = this.type;
    return {
      'message': message,
      if (type != null) 'type': type,
    };
  }
}

/// A request for the client to execute a specific tool with given parameters.
class Call {
  /// A unique identifier for this tool call, used to match results back to
  /// requests.
  final String callId;

  /// The input parameters for the tool call, formatted according to the tool's
  /// schema.
  final Object input;

  /// The name of the tool to invoke, following the pattern 'tool.{toolName}' or
  /// 'browser.{browserAction}'.
  final String name;

  Call({
    required this.callId,
    required this.input,
    required this.name,
  });

  factory Call.fromJson(Map<String, dynamic> json) {
    return Call(
      callId: (json['callId'] as String?) ?? '',
      input: json['input'] as Object,
      name: (json['name'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final callId = this.callId;
    final input = this.input;
    final name = this.name;
    return {
      'callId': callId,
      'input': input,
      'name': name,
    };
  }
}

/// The result returned from executing a tool call.
class CallResult {
  /// The content returned by the tool execution, which can include text or other
  /// media types.
  final List<CallResultContent> content;

  /// The identifier of the tool call that this result corresponds to.
  final String? callId;

  CallResult({
    required this.content,
    this.callId,
  });

  Map<String, dynamic> toJson() {
    final content = this.content;
    final callId = this.callId;
    return {
      'content': content,
      if (callId != null) 'callId': callId,
    };
  }
}

/// Content returned from a tool call execution.
class CallResultContent {
  /// Text content returned from the tool execution.
  final String? text;

  CallResultContent({
    this.text,
  });

  Map<String, dynamic> toJson() {
    final text = this.text;
    return {
      if (text != null) 'text': text,
    };
  }
}

/// Summary information about an act, including its status and execution timing.
class ActSummary {
  /// The unique identifier of the act.
  final String actId;

  /// The unique identifier of the session containing this act.
  final String sessionId;

  /// The timestamp when the act started execution.
  final DateTime startedAt;

  /// The current execution status of the act.
  final ActStatus status;

  /// The unique identifier of the workflow run containing this act.
  final String workflowRunId;

  /// The timestamp when the act completed execution, if applicable.
  final DateTime? endedAt;

  /// The location where trace information for this act is stored.
  final TraceLocation? traceLocation;

  ActSummary({
    required this.actId,
    required this.sessionId,
    required this.startedAt,
    required this.status,
    required this.workflowRunId,
    this.endedAt,
    this.traceLocation,
  });

  factory ActSummary.fromJson(Map<String, dynamic> json) {
    return ActSummary(
      actId: (json['actId'] as String?) ?? '',
      sessionId: (json['sessionId'] as String?) ?? '',
      startedAt: nonNullableTimeStampFromJson(json['startedAt'] ?? 0),
      status: ActStatus.fromString((json['status'] as String?) ?? ''),
      workflowRunId: (json['workflowRunId'] as String?) ?? '',
      endedAt: timeStampFromJson(json['endedAt']),
      traceLocation: json['traceLocation'] != null
          ? TraceLocation.fromJson(
              json['traceLocation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final actId = this.actId;
    final sessionId = this.sessionId;
    final startedAt = this.startedAt;
    final status = this.status;
    final workflowRunId = this.workflowRunId;
    final endedAt = this.endedAt;
    final traceLocation = this.traceLocation;
    return {
      'actId': actId,
      'sessionId': sessionId,
      'startedAt': iso8601ToJson(startedAt),
      'status': status.value,
      'workflowRunId': workflowRunId,
      if (endedAt != null) 'endedAt': iso8601ToJson(endedAt),
      if (traceLocation != null) 'traceLocation': traceLocation,
    };
  }
}

/// Specification for a tool that acts can invoke, including its name,
/// description, and input schema.
class ToolSpec {
  /// A description of what the tool does and how it should be used.
  final String description;

  /// The JSON schema that defines the expected input format for the tool.
  final ToolInputSchema inputSchema;

  /// The unique name of the tool that acts will use to invoke it.
  final String name;

  ToolSpec({
    required this.description,
    required this.inputSchema,
    required this.name,
  });

  Map<String, dynamic> toJson() {
    final description = this.description;
    final inputSchema = this.inputSchema;
    final name = this.name;
    return {
      'description': description,
      'inputSchema': inputSchema,
      'name': name,
    };
  }
}

/// The schema definition for tool input parameters.
class ToolInputSchema {
  /// The JSON schema that defines the expected input format for the tool.
  final Object? json;

  ToolInputSchema({
    this.json,
  });

  Map<String, dynamic> toJson() {
    final json = this.json;
    return {
      if (json != null) 'json': json,
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
