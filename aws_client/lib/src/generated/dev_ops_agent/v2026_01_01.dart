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

import 'v2026_01_01.endpoints.dart' as _endpoints;
export '../../shared/shared.dart' show AwsClientCredentials;

/// AWS DevOps Agent is your always-available operations teammate. It resolves
/// and proactively prevents incidents, optimizes application reliability and
/// performance, and handles on-demand SRE tasks across AWS, multicloud, and
/// on-premises environments. AWS DevOps Agent investigates incidents as an
/// experienced DevOps engineer would. It learns your applications and their
/// relationships. It works with your observability tools, runbooks, code
/// repositories, and CI/CD pipelines. The agent correlates telemetry, code, and
/// deployment data across all of them.
class DevOpsAgent {
  final _s.RestJsonProtocol _protocol;
  factory DevOpsAgent({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
    bool useFipsEndpoint = false,
    bool useDualStackEndpoint = false,
    bool disableHostPrefix = false,
  }) {
    final service = _s.ServiceMetadata(
      endpointPrefix: 'aidevops',
    );
    return DevOpsAgent._(
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
        disableHostPrefix: disableHostPrefix,
      ),
    );
  }
  DevOpsAgent._({
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

  /// Creates a new backlog task in the specified agent space
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [agentSpaceId] :
  /// The unique identifier for the agent space where the task will be created
  ///
  /// Parameter [priority] :
  /// The priority level of the task
  ///
  /// Parameter [taskType] :
  /// The type of task being created
  ///
  /// Parameter [title] :
  /// The title of the backlog task
  ///
  /// Parameter [clientToken] :
  /// Client-provided token for idempotent operations
  ///
  /// Parameter [description] :
  /// Optional detailed description of the task
  ///
  /// Parameter [reference] :
  /// Optional reference information for the task
  Future<CreateBacklogTaskResponse> createBacklogTask({
    required String agentSpaceId,
    required Priority priority,
    required TaskType taskType,
    required String title,
    String? clientToken,
    String? description,
    ReferenceInput? reference,
  }) async {
    final $payload = <String, dynamic>{
      'priority': priority.value,
      'taskType': taskType.value,
      'title': title,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (reference != null) 'reference': reference,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/backlog/agent-space/${Uri.encodeComponent(agentSpaceId)}/tasks',
      hostPrefix: 'dp.',
      exceptionFnMap: _exceptionFns,
    );
    return CreateBacklogTaskResponse.fromJson(response);
  }

  /// Creates a new chat execution in the specified agent space
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [userId] :
  /// The user identifier for the chat. This field is deprecated and will be
  /// ignored — the service resolves user identity from the authenticated
  /// session.
  ///
  /// Parameter [userType] :
  /// The authentication type of the user
  Future<CreateChatResponse> createChat({
    required String agentSpaceId,
    String? userId,
    UserType? userType,
  }) async {
    final $query = <String, List<String>>{
      if (userId != null) 'userId': [userId],
      if (userType != null) 'userType': [userType.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/agents/agent-space/${Uri.encodeComponent(agentSpaceId)}/chat/create',
      queryParams: $query,
      hostPrefix: 'dp.',
      exceptionFnMap: _exceptionFns,
    );
    return CreateChatResponse.fromJson(response);
  }

  /// Retrieves monthly account usage metrics and limits for the AWS account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  Future<GetAccountUsageOutput> getAccountUsage() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/usage/account',
      hostPrefix: 'dp.',
      exceptionFnMap: _exceptionFns,
    );
    return GetAccountUsageOutput.fromJson(response);
  }

  /// Gets a backlog task for the specified agent space and task id
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [agentSpaceId] :
  /// The unique identifier for the agent space containing the task
  ///
  /// Parameter [taskId] :
  /// The unique identifier of the task to retrieve
  Future<GetBacklogTaskResponse> getBacklogTask({
    required String agentSpaceId,
    required String taskId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/backlog/agent-space/${Uri.encodeComponent(agentSpaceId)}/tasks/${Uri.encodeComponent(taskId)}',
      hostPrefix: 'dp.',
      exceptionFnMap: _exceptionFns,
    );
    return GetBacklogTaskResponse.fromJson(response);
  }

  /// Retrieves a specific recommendation by its ID
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [agentSpaceId] :
  /// The unique identifier for the agent space containing the recommendation
  ///
  /// Parameter [recommendationId] :
  /// The unique identifier for the recommendation to retrieve
  ///
  /// Parameter [recommendationVersion] :
  /// Specific version of the recommendation to retrieve. If not specified,
  /// returns the latest version.
  Future<GetRecommendationResponse> getRecommendation({
    required String agentSpaceId,
    required String recommendationId,
    int? recommendationVersion,
  }) async {
    final $query = <String, List<String>>{
      if (recommendationVersion != null)
        'recommendationVersion': [recommendationVersion.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/backlog/agent-space/${Uri.encodeComponent(agentSpaceId)}/recommendations/${Uri.encodeComponent(recommendationId)}',
      queryParams: $query,
      hostPrefix: 'dp.',
      exceptionFnMap: _exceptionFns,
    );
    return GetRecommendationResponse.fromJson(response);
  }

  /// Lists backlog tasks in the specified agent space with optional filtering
  /// and sorting
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [agentSpaceId] :
  /// The unique identifier for the agent space containing the tasks
  ///
  /// Parameter [filter] :
  /// Filter criteria to apply when listing tasks Filtering restrictions: - Each
  /// filter field list is limited to a single value - Filtering by Priority and
  /// Status at the same time when not filtering by Type is not permitted -
  /// Timestamp filters (createdAfter, createdBefore) can be combined with other
  /// filters when not sorting by priority
  ///
  /// Parameter [limit] :
  /// Maximum number of tasks to return in a single response (1-1000, default:
  /// 100)
  ///
  /// Parameter [nextToken] :
  /// Token for retrieving the next page of results
  ///
  /// Parameter [order] :
  /// Sort order for the tasks based on sortField (default: DESC)
  ///
  /// Parameter [sortField] :
  /// Field to sort by Sorting restrictions: - Only sorting on createdAt is
  /// supported when using priority or status filters alone. - Sorting by
  /// priority is not supported when using Timestamp filters (createdAfter,
  /// createdBefore)
  Future<ListBacklogTasksResponse> listBacklogTasks({
    required String agentSpaceId,
    TaskFilter? filter,
    int? limit,
    String? nextToken,
    TaskSortOrder? order,
    TaskSortField? sortField,
  }) async {
    final $payload = <String, dynamic>{
      if (filter != null) 'filter': filter,
      if (limit != null) 'limit': limit,
      if (nextToken != null) 'nextToken': nextToken,
      if (order != null) 'order': order.value,
      if (sortField != null) 'sortField': sortField.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/backlog/agent-space/${Uri.encodeComponent(agentSpaceId)}/tasks/list',
      hostPrefix: 'dp.',
      exceptionFnMap: _exceptionFns,
    );
    return ListBacklogTasksResponse.fromJson(response);
  }

  /// Retrieves a paginated list of the user's recent chat executions
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to return
  ///
  /// Parameter [nextToken] :
  /// Token for pagination
  ///
  /// Parameter [userId] :
  /// The user identifier to list chats for. This field is deprecated and will
  /// be ignored — the service resolves user identity from the authenticated
  /// session.
  Future<ListChatsResponse> listChats({
    required String agentSpaceId,
    int? maxResults,
    String? nextToken,
    String? userId,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (userId != null) 'userId': [userId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/agents/agent-space/${Uri.encodeComponent(agentSpaceId)}/chat/list',
      queryParams: $query,
      hostPrefix: 'dp.',
      exceptionFnMap: _exceptionFns,
    );
    return ListChatsResponse.fromJson(response);
  }

  /// List executions
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [agentSpaceId] :
  /// The unique identifier for the agent space
  ///
  /// Parameter [taskId] :
  /// The unique identifier of the task whose executions to retrieve
  ///
  /// Parameter [limit] :
  /// Maximum number of executions to return
  ///
  /// Parameter [nextToken] :
  /// Token for pagination to retrieve the next set of results
  Future<ListExecutionsResponse> listExecutions({
    required String agentSpaceId,
    required String taskId,
    int? limit,
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      'taskId': taskId,
      if (limit != null) 'limit': limit,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/journal/agent-space/${Uri.encodeComponent(agentSpaceId)}/executions',
      hostPrefix: 'dp.',
      exceptionFnMap: _exceptionFns,
    );
    return ListExecutionsResponse.fromJson(response);
  }

  /// Lists goals in the specified agent space with optional filtering
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [agentSpaceId] :
  /// The unique identifier for the agent space
  ///
  /// Parameter [goalType] :
  /// Filter goals by goal type
  ///
  /// Parameter [limit] :
  /// Maximum number of goals to return
  ///
  /// Parameter [nextToken] :
  /// Pagination token for the next set of results
  ///
  /// Parameter [status] :
  /// Filter goals by goal status
  Future<ListGoalsResponse> listGoals({
    required String agentSpaceId,
    GoalType? goalType,
    int? limit,
    String? nextToken,
    GoalStatus? status,
  }) async {
    final $payload = <String, dynamic>{
      if (goalType != null) 'goalType': goalType.value,
      if (limit != null) 'limit': limit,
      if (nextToken != null) 'nextToken': nextToken,
      if (status != null) 'status': status.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/backlog/agent-space/${Uri.encodeComponent(agentSpaceId)}/goals/list',
      hostPrefix: 'dp.',
      exceptionFnMap: _exceptionFns,
    );
    return ListGoalsResponse.fromJson(response);
  }

  /// List journal records for a specific execution
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [agentSpaceId] :
  /// The unique identifier for the agent space containing the execution
  ///
  /// Parameter [executionId] :
  /// The unique identifier of the execution whose journal records to retrieve
  ///
  /// Parameter [limit] :
  /// Maximum number of records to return in a single response (1-100, default:
  /// 100)
  ///
  /// Parameter [nextToken] :
  /// Token for retrieving the next page of results
  ///
  /// Parameter [order] :
  /// Sort order for the records based on timestamp (default: DESC)
  ///
  /// Parameter [recordType] :
  /// Filter records by type (empty string returns all types)
  Future<ListJournalRecordsResponse> listJournalRecords({
    required String agentSpaceId,
    required String executionId,
    int? limit,
    String? nextToken,
    OrderType? order,
    String? recordType,
  }) async {
    final $payload = <String, dynamic>{
      'executionId': executionId,
      if (limit != null) 'limit': limit,
      if (nextToken != null) 'nextToken': nextToken,
      if (order != null) 'order': order.value,
      if (recordType != null) 'recordType': recordType,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/journal/agent-space/${Uri.encodeComponent(agentSpaceId)}/journalRecords',
      hostPrefix: 'dp.',
      exceptionFnMap: _exceptionFns,
    );
    return ListJournalRecordsResponse.fromJson(response);
  }

  /// List pending messages for a specific execution.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [executionId] :
  /// The unique identifier of the execution whose journal records to retrieve
  Future<ListPendingMessagesResponse> listPendingMessages({
    required String agentSpaceId,
    required String executionId,
  }) async {
    final $payload = <String, dynamic>{
      'executionId': executionId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/agents/agent-space/${Uri.encodeComponent(agentSpaceId)}/pendingMessages',
      hostPrefix: 'dp.',
      exceptionFnMap: _exceptionFns,
    );
    return ListPendingMessagesResponse.fromJson(response);
  }

  /// Lists recommendations for the specified agent space
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [agentSpaceId] :
  /// The unique identifier for the agent space containing the recommendations
  ///
  /// Parameter [goalId] :
  /// Optional goal ID to filter recommendations by specific goal
  ///
  /// Parameter [limit] :
  /// Maximum number of recommendations to return in a single response
  ///
  /// Parameter [nextToken] :
  /// Token for retrieving the next page of results
  ///
  /// Parameter [priority] :
  /// Optional priority to filter recommendations by priority level
  ///
  /// Parameter [status] :
  /// Optional status to filter recommendations by their current status
  ///
  /// Parameter [taskId] :
  /// Optional task ID to filter recommendations by specific task
  Future<ListRecommendationsResponse> listRecommendations({
    required String agentSpaceId,
    String? goalId,
    int? limit,
    String? nextToken,
    RecommendationPriority? priority,
    RecommendationStatus? status,
    String? taskId,
  }) async {
    final $payload = <String, dynamic>{
      if (goalId != null) 'goalId': goalId,
      if (limit != null) 'limit': limit,
      if (nextToken != null) 'nextToken': nextToken,
      if (priority != null) 'priority': priority.value,
      if (status != null) 'status': status.value,
      if (taskId != null) 'taskId': taskId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/backlog/agent-space/${Uri.encodeComponent(agentSpaceId)}/recommendations/list',
      hostPrefix: 'dp.',
      exceptionFnMap: _exceptionFns,
    );
    return ListRecommendationsResponse.fromJson(response);
  }

  /// Lists tags for the specified AWS DevOps Agent resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      hostPrefix: 'cp.',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Sends a chat message and streams the response for the specified agent
  /// space execution
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [agentSpaceId] :
  /// The agent space identifier
  ///
  /// Parameter [content] :
  /// The user message content
  ///
  /// Parameter [executionId] :
  /// The execution identifier for the chat session
  ///
  /// Parameter [context] :
  /// Optional context for the message
  ///
  /// Parameter [userId] :
  /// User identifier. This field is deprecated and will be ignored — the
  /// service resolves user identity from the authenticated session.
  Future<SendMessageResponse> sendMessage({
    required String agentSpaceId,
    required String content,
    required String executionId,
    SendMessageContext? context,
    String? userId,
  }) async {
    final $payload = <String, dynamic>{
      'content': content,
      'executionId': executionId,
      if (context != null) 'context': context,
      if (userId != null) 'userId': userId,
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/agents/agent-space/${Uri.encodeComponent(agentSpaceId)}/chat/sendMessage',
      hostPrefix: 'dp.',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return SendMessageResponse(
      events: SendMessageEvents.fromJson($json),
    );
  }

  /// Adds or overwrites tags for the specified AWS DevOps Agent resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource to tag.
  ///
  /// Parameter [tags] :
  /// Tags to add to the resource.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    final $payload = <String, dynamic>{
      'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      hostPrefix: 'cp.',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes tags from the specified AWS DevOps Agent resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource to untag.
  ///
  /// Parameter [tagKeys] :
  /// Tag keys to remove.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final $query = <String, List<String>>{
      'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      hostPrefix: 'cp.',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Update an existing backlog task.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [agentSpaceId] :
  /// The unique identifier for the agent space containing the task
  ///
  /// Parameter [taskId] :
  /// The unique identifier of the task to update
  ///
  /// Parameter [clientToken] :
  /// Client-provided token for idempotent operations
  ///
  /// Parameter [taskStatus] :
  /// Updated task status
  Future<UpdateBacklogTaskResponse> updateBacklogTask({
    required String agentSpaceId,
    required String taskId,
    String? clientToken,
    TaskStatus? taskStatus,
  }) async {
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (taskStatus != null) 'taskStatus': taskStatus.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/backlog/agent-space/${Uri.encodeComponent(agentSpaceId)}/tasks/${Uri.encodeComponent(taskId)}',
      hostPrefix: 'dp.',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateBacklogTaskResponse.fromJson(response);
  }

  /// Update an existing goal
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [agentSpaceId] :
  /// The unique identifier for the agent space containing the goal
  ///
  /// Parameter [goalId] :
  /// The unique identifier of the goal to update
  ///
  /// Parameter [clientToken] :
  /// Client-provided token for idempotent operations
  ///
  /// Parameter [evaluationSchedule] :
  /// Update goal schedule state
  Future<UpdateGoalResponse> updateGoal({
    required String agentSpaceId,
    required String goalId,
    String? clientToken,
    GoalScheduleInput? evaluationSchedule,
  }) async {
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (evaluationSchedule != null) 'evaluationSchedule': evaluationSchedule,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/backlog/agent-space/${Uri.encodeComponent(agentSpaceId)}/goals/${Uri.encodeComponent(goalId)}',
      hostPrefix: 'dp.',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateGoalResponse.fromJson(response);
  }

  /// Updates an existing recommendation with new content, status, or metadata
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [agentSpaceId] :
  /// The unique identifier for the agent space containing the recommendation
  ///
  /// Parameter [recommendationId] :
  /// The unique identifier for the recommendation to update
  ///
  /// Parameter [additionalContext] :
  /// Additional context for recommendation
  ///
  /// Parameter [clientToken] :
  /// A unique token that ensures idempotency of the request
  ///
  /// Parameter [status] :
  /// Current status of the recommendation
  Future<UpdateRecommendationResponse> updateRecommendation({
    required String agentSpaceId,
    required String recommendationId,
    String? additionalContext,
    String? clientToken,
    RecommendationStatus? status,
  }) async {
    final $payload = <String, dynamic>{
      if (additionalContext != null) 'additionalContext': additionalContext,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (status != null) 'status': status.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/backlog/agent-space/${Uri.encodeComponent(agentSpaceId)}/recommendations/${Uri.encodeComponent(recommendationId)}',
      hostPrefix: 'dp.',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateRecommendationResponse.fromJson(response);
  }

  /// Creates a new AgentSpace with the specified name and description.
  /// Duplicate space names are allowed.
  ///
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [InvalidParameterException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the AgentSpace.
  ///
  /// Parameter [clientToken] :
  /// Client-provided token to ensure request idempotency. When the same token
  /// is provided in subsequent calls, the same response is returned within a
  /// 8-hour window.
  ///
  /// Parameter [description] :
  /// The description of the AgentSpace.
  ///
  /// Parameter [kmsKeyArn] :
  /// The ARN of the AWS Key Management Service (AWS KMS) customer managed key
  /// that's used to encrypt resources.
  ///
  /// Parameter [locale] :
  /// The locale for the AgentSpace, which determines the language used in agent
  /// responses.
  ///
  /// Parameter [tags] :
  /// Tags to add to the AgentSpace at creation time.
  Future<CreateAgentSpaceOutput> createAgentSpace({
    required String name,
    String? clientToken,
    String? description,
    String? kmsKeyArn,
    String? locale,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (kmsKeyArn != null) 'kmsKeyArn': kmsKeyArn,
      if (locale != null) 'locale': locale,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/agentspaces',
      hostPrefix: 'cp.',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAgentSpaceOutput.fromJson(response);
  }

  /// Retrieves detailed information about a specific AgentSpace.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [agentSpaceId] :
  /// The unique identifier of the AgentSpace
  Future<GetAgentSpaceOutput> getAgentSpace({
    required String agentSpaceId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/agentspaces/${Uri.encodeComponent(agentSpaceId)}',
      hostPrefix: 'cp.',
      exceptionFnMap: _exceptionFns,
    );
    return GetAgentSpaceOutput.fromJson(response);
  }

  /// Updates the information of an existing AgentSpace.
  ///
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [agentSpaceId] :
  /// The unique identifier of the AgentSpace
  ///
  /// Parameter [description] :
  /// The updated description of the AgentSpace.
  ///
  /// Parameter [locale] :
  /// The updated locale for the AgentSpace, which determines the language used
  /// in agent responses.
  ///
  /// Parameter [name] :
  /// The updated name of the AgentSpace.
  Future<UpdateAgentSpaceOutput> updateAgentSpace({
    required String agentSpaceId,
    String? description,
    String? locale,
    String? name,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'description': description,
      if (locale != null) 'locale': locale,
      if (name != null) 'name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/v1/agentspaces/${Uri.encodeComponent(agentSpaceId)}',
      hostPrefix: 'cp.',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateAgentSpaceOutput.fromJson(response);
  }

  /// Deletes an AgentSpace. This operation is idempotent and returns a 204 No
  /// Content response on success.
  ///
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [agentSpaceId] :
  /// The unique identifier of the AgentSpace
  Future<void> deleteAgentSpace({
    required String agentSpaceId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/agentspaces/${Uri.encodeComponent(agentSpaceId)}',
      hostPrefix: 'cp.',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Disable the Operator App for the specified AgentSpace
  ///
  /// May throw [IdentityCenterServiceException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [agentSpaceId] :
  /// The unique identifier of the AgentSpace
  ///
  /// Parameter [authFlow] :
  /// The authentication flow configured for the operator App. e.g. idc
  Future<void> disableOperatorApp({
    required String agentSpaceId,
    AuthFlow? authFlow,
  }) async {
    final headers = <String, String>{
      if (authFlow != null) 'x-amzn-app-auth-flow': authFlow.value,
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v1/agentspaces/${Uri.encodeComponent(agentSpaceId)}/operator',
      headers: headers,
      hostPrefix: 'cp.',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Enable the Operator App to access the given AgentSpace
  ///
  /// May throw [IdentityCenterServiceException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [agentSpaceId] :
  /// The unique identifier of the AgentSpace
  ///
  /// Parameter [authFlow] :
  /// The authentication flow configured for the operator App. e.g. iam or idc
  ///
  /// Parameter [operatorAppRoleArn] :
  /// The IAM role end users assume to access AIDevOps APIs
  ///
  /// Parameter [idcInstanceArn] :
  /// The IdC instance Arn used to create an IdC auth application
  ///
  /// Parameter [idpClientId] :
  /// The OIDC client ID for the IdP application
  ///
  /// Parameter [idpClientSecret] :
  /// The OIDC client secret for the IdP application
  ///
  /// Parameter [issuerUrl] :
  /// The OIDC issuer URL of the external Identity Provider
  ///
  /// Parameter [provider] :
  /// The Identity Provider name (e.g., Entra, Okta, Google)
  Future<EnableOperatorAppOutput> enableOperatorApp({
    required String agentSpaceId,
    required AuthFlow authFlow,
    required String operatorAppRoleArn,
    String? idcInstanceArn,
    String? idpClientId,
    String? idpClientSecret,
    String? issuerUrl,
    String? provider,
  }) async {
    final $payload = <String, dynamic>{
      'authFlow': authFlow.value,
      'operatorAppRoleArn': operatorAppRoleArn,
      if (idcInstanceArn != null) 'idcInstanceArn': idcInstanceArn,
      if (idpClientId != null) 'idpClientId': idpClientId,
      if (idpClientSecret != null) 'idpClientSecret': idpClientSecret,
      if (issuerUrl != null) 'issuerUrl': issuerUrl,
      if (provider != null) 'provider': provider,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v1/agentspaces/${Uri.encodeComponent(agentSpaceId)}/operator',
      hostPrefix: 'cp.',
      exceptionFnMap: _exceptionFns,
    );
    return EnableOperatorAppOutput.fromJson(response);
  }

  /// Get the full auth configuration of operator including any enabled auth
  /// flow
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [agentSpaceId] :
  /// The unique identifier of the AgentSpace
  Future<GetOperatorAppOutput> getOperatorApp({
    required String agentSpaceId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/agentspaces/${Uri.encodeComponent(agentSpaceId)}/operator',
      hostPrefix: 'cp.',
      exceptionFnMap: _exceptionFns,
    );
    return GetOperatorAppOutput.fromJson(response);
  }

  /// Update the external Identity Provider configuration for the Operator App
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [agentSpaceId] :
  /// The unique identifier of the AgentSpace
  ///
  /// Parameter [idpClientSecret] :
  /// The OIDC client secret for the IdP application
  Future<UpdateOperatorAppIdpConfigOutput> updateOperatorAppIdpConfig({
    required String agentSpaceId,
    String? idpClientSecret,
  }) async {
    final $payload = <String, dynamic>{
      if (idpClientSecret != null) 'idpClientSecret': idpClientSecret,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/v1/agentspaces/${Uri.encodeComponent(agentSpaceId)}/operator/idp',
      hostPrefix: 'cp.',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateOperatorAppIdpConfigOutput.fromJson(response);
  }

  /// Lists all AgentSpaces with optional pagination.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// Token for the next page of results.
  Future<ListAgentSpacesOutput> listAgentSpaces({
    int? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/v1/agentspaces/list',
      queryParams: $query,
      hostPrefix: 'cp.',
      exceptionFnMap: _exceptionFns,
    );
    return ListAgentSpacesOutput.fromJson(response);
  }

  /// Adds a specific service association to an AgentSpace. It overwrites the
  /// existing association of the same service. Returns 201 Created on success.
  ///
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [agentSpaceId] :
  /// The unique identifier of the AgentSpace
  ///
  /// Parameter [configuration] :
  /// The configuration that directs how AgentSpace interacts with the given
  /// service.
  ///
  /// Parameter [serviceId] :
  /// The unique identifier of the service.
  Future<AssociateServiceOutput> associateService({
    required String agentSpaceId,
    required ServiceConfiguration configuration,
    required String serviceId,
  }) async {
    final $payload = <String, dynamic>{
      'configuration': configuration,
      'serviceId': serviceId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v1/agentspaces/${Uri.encodeComponent(agentSpaceId)}/associations',
      hostPrefix: 'cp.',
      exceptionFnMap: _exceptionFns,
    );
    return AssociateServiceOutput.fromJson(response);
  }

  /// Retrieves given associations configured for a specific AgentSpace.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [agentSpaceId] :
  /// The unique identifier of the AgentSpace
  ///
  /// Parameter [associationId] :
  /// The unique identifier of the given association.
  Future<GetAssociationOutput> getAssociation({
    required String agentSpaceId,
    required String associationId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/agentspaces/${Uri.encodeComponent(agentSpaceId)}/associations/${Uri.encodeComponent(associationId)}',
      hostPrefix: 'cp.',
      exceptionFnMap: _exceptionFns,
    );
    return GetAssociationOutput.fromJson(response);
  }

  /// Partially updates the configuration of an existing service association for
  /// an AgentSpace. Present fields are fully replaced; absent fields are left
  /// unchanged. Returns 200 OK on success.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [agentSpaceId] :
  /// The unique identifier of the AgentSpace
  ///
  /// Parameter [associationId] :
  /// The unique identifier of the given association.
  ///
  /// Parameter [configuration] :
  /// The configuration that directs how AgentSpace interacts with the given
  /// service. The entire configuration is replaced on update.
  Future<UpdateAssociationOutput> updateAssociation({
    required String agentSpaceId,
    required String associationId,
    required ServiceConfiguration configuration,
  }) async {
    final $payload = <String, dynamic>{
      'configuration': configuration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/v1/agentspaces/${Uri.encodeComponent(agentSpaceId)}/associations/${Uri.encodeComponent(associationId)}',
      hostPrefix: 'cp.',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateAssociationOutput.fromJson(response);
  }

  /// Deletes a specific service association from an AgentSpace. This operation
  /// is idempotent and returns a 204 No Content response on success.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [agentSpaceId] :
  /// The unique identifier of the AgentSpace
  ///
  /// Parameter [associationId] :
  /// The unique identifier of the given association.
  Future<void> disassociateService({
    required String agentSpaceId,
    required String associationId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v1/agentspaces/${Uri.encodeComponent(agentSpaceId)}/associations/${Uri.encodeComponent(associationId)}',
      hostPrefix: 'cp.',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// List all webhooks for given Association
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [agentSpaceId] :
  /// The unique identifier of the AgentSpace
  ///
  /// Parameter [associationId] :
  /// The unique identifier of the given association.
  Future<ListWebhooksOutput> listWebhooks({
    required String agentSpaceId,
    required String associationId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/v1/agentspaces/${Uri.encodeComponent(agentSpaceId)}/associations/${Uri.encodeComponent(associationId)}/webhooks/list',
      hostPrefix: 'cp.',
      exceptionFnMap: _exceptionFns,
    );
    return ListWebhooksOutput.fromJson(response);
  }

  /// List all associations for given AgentSpace
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [agentSpaceId] :
  /// The unique identifier of the AgentSpace
  ///
  /// Parameter [filterServiceTypes] :
  /// A comma-separated list of service types to filter list associations output
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// Token for the next page of results.
  Future<ListAssociationsOutput> listAssociations({
    required String agentSpaceId,
    String? filterServiceTypes,
    int? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (filterServiceTypes != null)
        'filterServiceTypes': [filterServiceTypes],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/v1/agentspaces/${Uri.encodeComponent(agentSpaceId)}/associations/list',
      queryParams: $query,
      hostPrefix: 'cp.',
      exceptionFnMap: _exceptionFns,
    );
    return ListAssociationsOutput.fromJson(response);
  }

  /// Validates an aws association and set status and returns a 204 No Content
  /// response on success.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [agentSpaceId] :
  /// The unique identifier of the AgentSpace
  Future<void> validateAwsAssociations({
    required String agentSpaceId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/v1/agentspaces/${Uri.encodeComponent(agentSpaceId)}/associations/validate',
      hostPrefix: 'cp.',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates a Private Connection to a target resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [mode] :
  /// Private Connection mode configuration.
  ///
  /// Parameter [name] :
  /// Unique name for this Private Connection within the account.
  ///
  /// Parameter [tags] :
  /// Tags to add to the Private Connection at creation time.
  Future<CreatePrivateConnectionOutput> createPrivateConnection({
    required PrivateConnectionMode mode,
    required String name,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'mode': mode,
      'name': name,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/private-connections',
      hostPrefix: 'cp.',
      exceptionFnMap: _exceptionFns,
    );
    return CreatePrivateConnectionOutput.fromJson(response);
  }

  /// Retrieves details of an existing Private Connection.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the Private Connection.
  Future<DescribePrivateConnectionOutput> describePrivateConnection({
    required String name,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/private-connections/${Uri.encodeComponent(name)}',
      hostPrefix: 'cp.',
      exceptionFnMap: _exceptionFns,
    );
    return DescribePrivateConnectionOutput.fromJson(response);
  }

  /// Deletes a Private Connection. The deletion is asynchronous and returns
  /// DELETE_IN_PROGRESS status.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the Private Connection.
  Future<DeletePrivateConnectionOutput> deletePrivateConnection({
    required String name,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/private-connections/${Uri.encodeComponent(name)}',
      hostPrefix: 'cp.',
      exceptionFnMap: _exceptionFns,
    );
    return DeletePrivateConnectionOutput.fromJson(response);
  }

  /// Lists all Private Connections in the caller's account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  Future<ListPrivateConnectionsOutput> listPrivateConnections() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/private-connections',
      hostPrefix: 'cp.',
      exceptionFnMap: _exceptionFns,
    );
    return ListPrivateConnectionsOutput.fromJson(response);
  }

  /// Updates the certificate associated with a Private Connection.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [certificate] :
  /// The new certificate for the Private Connection.
  ///
  /// Parameter [name] :
  /// The name of the Private Connection.
  Future<UpdatePrivateConnectionCertificateOutput>
      updatePrivateConnectionCertificate({
    required String certificate,
    required String name,
  }) async {
    final $payload = <String, dynamic>{
      'certificate': certificate,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v1/private-connections/${Uri.encodeComponent(name)}/certificate',
      hostPrefix: 'cp.',
      exceptionFnMap: _exceptionFns,
    );
    return UpdatePrivateConnectionCertificateOutput.fromJson(response);
  }

  /// This operation registers the specified service
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [serviceDetails] :
  /// Service-specific authorization configuration parameters
  ///
  /// Parameter [kmsKeyArn] :
  /// The ARN of the AWS Key Management Service (AWS KMS) customer managed key
  /// that's used to encrypt resources.
  ///
  /// Parameter [name] :
  /// The display name for the service registration.
  ///
  /// Parameter [privateConnectionName] :
  /// The name of the private connection to use for VPC connectivity.
  ///
  /// Parameter [tags] :
  /// Tags to add to the Service at registration time.
  Future<RegisterServiceOutput> registerService({
    required PostRegisterServiceSupportedService service,
    required ServiceDetails serviceDetails,
    String? kmsKeyArn,
    String? name,
    String? privateConnectionName,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'serviceDetails': serviceDetails,
      if (kmsKeyArn != null) 'kmsKeyArn': kmsKeyArn,
      if (name != null) 'name': name,
      if (privateConnectionName != null)
        'privateConnectionName': privateConnectionName,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/register/${Uri.encodeComponent(service.value)}',
      hostPrefix: 'cp.',
      exceptionFnMap: _exceptionFns,
    );
    return RegisterServiceOutput.fromJson(response);
  }

  /// Retrieves given service by it's unique identifier
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [serviceId] :
  /// The unique identifier of the given service.
  Future<GetServiceOutput> getService({
    required String serviceId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/services/${Uri.encodeComponent(serviceId)}',
      hostPrefix: 'cp.',
      exceptionFnMap: _exceptionFns,
    );
    return GetServiceOutput.fromJson(response);
  }

  /// Deregister a service
  ///
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [serviceId] :
  /// The service id to deregister. A service can only be deregistered if it is
  /// not associated with any AgentSpace.
  Future<void> deregisterService({
    required String serviceId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/services/${Uri.encodeComponent(serviceId)}',
      hostPrefix: 'cp.',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// List a list of registered service on the account level.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [filterServiceType] :
  /// Optional filter to list only services of a specific type.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// Token for the next page of results.
  Future<ListServicesOutput> listServices({
    Service? filterServiceType,
    int? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (filterServiceType != null)
        'filterServiceType': [filterServiceType.value],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/v1/services/list',
      queryParams: $query,
      hostPrefix: 'cp.',
      exceptionFnMap: _exceptionFns,
    );
    return ListServicesOutput.fromJson(response);
  }
}

/// Response structure containing the created backlog task
///
/// @nodoc
class CreateBacklogTaskResponse {
  /// The newly created task object
  final Task task;

  CreateBacklogTaskResponse({
    required this.task,
  });

  factory CreateBacklogTaskResponse.fromJson(Map<String, dynamic> json) {
    return CreateBacklogTaskResponse(
      task: Task.fromJson(
          (json['task'] as Map<String, dynamic>?) ?? const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final task = this.task;
    return {
      'task': task,
    };
  }
}

/// Response structure for creating a new chat
///
/// @nodoc
class CreateChatResponse {
  /// Timestamp when the chat was created
  final DateTime createdAt;

  /// The unique identifier for the created execution
  final String executionId;

  CreateChatResponse({
    required this.createdAt,
    required this.executionId,
  });

  factory CreateChatResponse.fromJson(Map<String, dynamic> json) {
    return CreateChatResponse(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      executionId: (json['executionId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final executionId = this.executionId;
    return {
      'createdAt': unixTimestampToJson(createdAt),
      'executionId': executionId,
    };
  }
}

/// @nodoc
class GetAccountUsageOutput {
  /// The end time of the usage tracking period
  final DateTime usagePeriodEndTime;

  /// The start time of the usage tracking period
  final DateTime usagePeriodStartTime;

  /// Monthly evaluation hours usage and limit for an account
  final UsageMetric? monthlyAccountEvaluationHours;

  /// Monthly investigation hours usage and limit for an account
  final UsageMetric? monthlyAccountInvestigationHours;

  /// Monthly on-demand hours usage and limit for an account
  final UsageMetric? monthlyAccountOnDemandHours;

  /// Monthly system learning hours usage and limit for an account
  final UsageMetric? monthlyAccountSystemLearningHours;

  GetAccountUsageOutput({
    required this.usagePeriodEndTime,
    required this.usagePeriodStartTime,
    this.monthlyAccountEvaluationHours,
    this.monthlyAccountInvestigationHours,
    this.monthlyAccountOnDemandHours,
    this.monthlyAccountSystemLearningHours,
  });

  factory GetAccountUsageOutput.fromJson(Map<String, dynamic> json) {
    return GetAccountUsageOutput(
      usagePeriodEndTime:
          nonNullableTimeStampFromJson(json['usagePeriodEndTime'] ?? 0),
      usagePeriodStartTime:
          nonNullableTimeStampFromJson(json['usagePeriodStartTime'] ?? 0),
      monthlyAccountEvaluationHours:
          json['monthlyAccountEvaluationHours'] != null
              ? UsageMetric.fromJson(
                  json['monthlyAccountEvaluationHours'] as Map<String, dynamic>)
              : null,
      monthlyAccountInvestigationHours:
          json['monthlyAccountInvestigationHours'] != null
              ? UsageMetric.fromJson(json['monthlyAccountInvestigationHours']
                  as Map<String, dynamic>)
              : null,
      monthlyAccountOnDemandHours: json['monthlyAccountOnDemandHours'] != null
          ? UsageMetric.fromJson(
              json['monthlyAccountOnDemandHours'] as Map<String, dynamic>)
          : null,
      monthlyAccountSystemLearningHours:
          json['monthlyAccountSystemLearningHours'] != null
              ? UsageMetric.fromJson(json['monthlyAccountSystemLearningHours']
                  as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final usagePeriodEndTime = this.usagePeriodEndTime;
    final usagePeriodStartTime = this.usagePeriodStartTime;
    final monthlyAccountEvaluationHours = this.monthlyAccountEvaluationHours;
    final monthlyAccountInvestigationHours =
        this.monthlyAccountInvestigationHours;
    final monthlyAccountOnDemandHours = this.monthlyAccountOnDemandHours;
    final monthlyAccountSystemLearningHours =
        this.monthlyAccountSystemLearningHours;
    return {
      'usagePeriodEndTime': iso8601ToJson(usagePeriodEndTime),
      'usagePeriodStartTime': iso8601ToJson(usagePeriodStartTime),
      if (monthlyAccountEvaluationHours != null)
        'monthlyAccountEvaluationHours': monthlyAccountEvaluationHours,
      if (monthlyAccountInvestigationHours != null)
        'monthlyAccountInvestigationHours': monthlyAccountInvestigationHours,
      if (monthlyAccountOnDemandHours != null)
        'monthlyAccountOnDemandHours': monthlyAccountOnDemandHours,
      if (monthlyAccountSystemLearningHours != null)
        'monthlyAccountSystemLearningHours': monthlyAccountSystemLearningHours,
    };
  }
}

/// Response structure containing the requested backlog task
///
/// @nodoc
class GetBacklogTaskResponse {
  /// The requested task object
  final Task task;

  GetBacklogTaskResponse({
    required this.task,
  });

  factory GetBacklogTaskResponse.fromJson(Map<String, dynamic> json) {
    return GetBacklogTaskResponse(
      task: Task.fromJson(
          (json['task'] as Map<String, dynamic>?) ?? const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final task = this.task;
    return {
      'task': task,
    };
  }
}

/// Response structure containing the requested recommendation
///
/// @nodoc
class GetRecommendationResponse {
  /// The requested recommendation
  final Recommendation recommendation;

  GetRecommendationResponse({
    required this.recommendation,
  });

  factory GetRecommendationResponse.fromJson(Map<String, dynamic> json) {
    return GetRecommendationResponse(
      recommendation: Recommendation.fromJson(
          (json['recommendation'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final recommendation = this.recommendation;
    return {
      'recommendation': recommendation,
    };
  }
}

/// Response structure containing a list of backlog tasks
///
/// @nodoc
class ListBacklogTasksResponse {
  /// List of backlog tasks
  final List<Task> tasks;

  /// Token for retrieving the next page of results, if more results are available
  final String? nextToken;

  ListBacklogTasksResponse({
    required this.tasks,
    this.nextToken,
  });

  factory ListBacklogTasksResponse.fromJson(Map<String, dynamic> json) {
    return ListBacklogTasksResponse(
      tasks: ((json['tasks'] as List?) ?? const [])
          .nonNulls
          .map((e) => Task.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final tasks = this.tasks;
    final nextToken = this.nextToken;
    return {
      'tasks': tasks,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Response structure for listing chats
///
/// @nodoc
class ListChatsResponse {
  /// List of recent chat executions
  final List<ChatExecution> executions;

  /// Token for retrieving the next page of results
  final String? nextToken;

  ListChatsResponse({
    required this.executions,
    this.nextToken,
  });

  factory ListChatsResponse.fromJson(Map<String, dynamic> json) {
    return ListChatsResponse(
      executions: ((json['executions'] as List?) ?? const [])
          .nonNulls
          .map((e) => ChatExecution.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final executions = this.executions;
    final nextToken = this.nextToken;
    return {
      'executions': executions,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Response structure containing executions
///
/// @nodoc
class ListExecutionsResponse {
  /// List of executions
  final List<Execution> executions;

  /// Token for retrieving the next page of results, if available
  final String? nextToken;

  ListExecutionsResponse({
    required this.executions,
    this.nextToken,
  });

  factory ListExecutionsResponse.fromJson(Map<String, dynamic> json) {
    return ListExecutionsResponse(
      executions: ((json['executions'] as List?) ?? const [])
          .nonNulls
          .map((e) => Execution.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final executions = this.executions;
    final nextToken = this.nextToken;
    return {
      'executions': executions,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Response structure containing the list of goals
///
/// @nodoc
class ListGoalsResponse {
  /// List of goals matching the criteria
  final List<Goal> goals;

  /// Pagination token for the next set of results
  final String? nextToken;

  ListGoalsResponse({
    required this.goals,
    this.nextToken,
  });

  factory ListGoalsResponse.fromJson(Map<String, dynamic> json) {
    return ListGoalsResponse(
      goals: ((json['goals'] as List?) ?? const [])
          .nonNulls
          .map((e) => Goal.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final goals = this.goals;
    final nextToken = this.nextToken;
    return {
      'goals': goals,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Response structure containing a list of journal records
///
/// @nodoc
class ListJournalRecordsResponse {
  /// List of journal records matching the request criteria
  final List<JournalRecord> records;

  /// Token for retrieving the next page of results, if more results are available
  final String? nextToken;

  ListJournalRecordsResponse({
    required this.records,
    this.nextToken,
  });

  factory ListJournalRecordsResponse.fromJson(Map<String, dynamic> json) {
    return ListJournalRecordsResponse(
      records: ((json['records'] as List?) ?? const [])
          .nonNulls
          .map((e) => JournalRecord.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final records = this.records;
    final nextToken = this.nextToken;
    return {
      'records': records,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Response structure containing a list of pending messages
///
/// @nodoc
class ListPendingMessagesResponse {
  final String agentSpaceId;

  /// Timestamp when the pending messages were created.
  final DateTime createdAt;

  /// The unique identifier for the execution.
  final String executionId;

  /// The list of pending messages for the execution.
  final List<PendingMessage> messages;

  ListPendingMessagesResponse({
    required this.agentSpaceId,
    required this.createdAt,
    required this.executionId,
    required this.messages,
  });

  factory ListPendingMessagesResponse.fromJson(Map<String, dynamic> json) {
    return ListPendingMessagesResponse(
      agentSpaceId: (json['agentSpaceId'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      executionId: (json['executionId'] as String?) ?? '',
      messages: ((json['messages'] as List?) ?? const [])
          .nonNulls
          .map((e) => PendingMessage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final agentSpaceId = this.agentSpaceId;
    final createdAt = this.createdAt;
    final executionId = this.executionId;
    final messages = this.messages;
    return {
      'agentSpaceId': agentSpaceId,
      'createdAt': unixTimestampToJson(createdAt),
      'executionId': executionId,
      'messages': messages,
    };
  }
}

/// Response structure containing a list of recommendations
///
/// @nodoc
class ListRecommendationsResponse {
  /// List of recommendations matching the request criteria
  final List<Recommendation> recommendations;

  /// Token for retrieving the next page of results, if more results are available
  final String? nextToken;

  ListRecommendationsResponse({
    required this.recommendations,
    this.nextToken,
  });

  factory ListRecommendationsResponse.fromJson(Map<String, dynamic> json) {
    return ListRecommendationsResponse(
      recommendations: ((json['recommendations'] as List?) ?? const [])
          .nonNulls
          .map((e) => Recommendation.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final recommendations = this.recommendations;
    final nextToken = this.nextToken;
    return {
      'recommendations': recommendations,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListTagsForResourceResponse {
  /// Tags associated with the resource.
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    required this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags:
          ((json['tags'] as Map<String, dynamic>?) ?? const <String, dynamic>{})
              .map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      'tags': tags,
    };
  }
}

/// Response structure for sending chat message events
///
/// @nodoc
class SendMessageResponse {
  /// The stream of chat message events
  final SendMessageEvents events;

  SendMessageResponse({
    required this.events,
  });

  Map<String, dynamic> toJson() {
    final events = this.events;
    return {
      'events': events,
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

/// Response structure containing the updated task
///
/// @nodoc
class UpdateBacklogTaskResponse {
  /// The updated task object
  final Task task;

  UpdateBacklogTaskResponse({
    required this.task,
  });

  factory UpdateBacklogTaskResponse.fromJson(Map<String, dynamic> json) {
    return UpdateBacklogTaskResponse(
      task: Task.fromJson(
          (json['task'] as Map<String, dynamic>?) ?? const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final task = this.task;
    return {
      'task': task,
    };
  }
}

/// Response structure containing the updated goal
///
/// @nodoc
class UpdateGoalResponse {
  /// The updated goal object
  final Goal goal;

  UpdateGoalResponse({
    required this.goal,
  });

  factory UpdateGoalResponse.fromJson(Map<String, dynamic> json) {
    return UpdateGoalResponse(
      goal: Goal.fromJson(
          (json['goal'] as Map<String, dynamic>?) ?? const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final goal = this.goal;
    return {
      'goal': goal,
    };
  }
}

/// Response structure containing the updated recommendation
///
/// @nodoc
class UpdateRecommendationResponse {
  /// The updated recommendation
  final Recommendation recommendation;

  UpdateRecommendationResponse({
    required this.recommendation,
  });

  factory UpdateRecommendationResponse.fromJson(Map<String, dynamic> json) {
    return UpdateRecommendationResponse(
      recommendation: Recommendation.fromJson(
          (json['recommendation'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final recommendation = this.recommendation;
    return {
      'recommendation': recommendation,
    };
  }
}

/// Output containing the newly created AgentSpace.
///
/// @nodoc
class CreateAgentSpaceOutput {
  final AgentSpace agentSpace;

  /// Tags associated with the created AgentSpace.
  final Map<String, String>? tags;

  CreateAgentSpaceOutput({
    required this.agentSpace,
    this.tags,
  });

  factory CreateAgentSpaceOutput.fromJson(Map<String, dynamic> json) {
    return CreateAgentSpaceOutput(
      agentSpace: AgentSpace.fromJson(
          (json['agentSpace'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final agentSpace = this.agentSpace;
    final tags = this.tags;
    return {
      'agentSpace': agentSpace,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Output containing the requested AgentSpace details.
///
/// @nodoc
class GetAgentSpaceOutput {
  final AgentSpace agentSpace;

  /// Tags associated with the AgentSpace.
  final Map<String, String>? tags;

  GetAgentSpaceOutput({
    required this.agentSpace,
    this.tags,
  });

  factory GetAgentSpaceOutput.fromJson(Map<String, dynamic> json) {
    return GetAgentSpaceOutput(
      agentSpace: AgentSpace.fromJson(
          (json['agentSpace'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final agentSpace = this.agentSpace;
    final tags = this.tags;
    return {
      'agentSpace': agentSpace,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Output containing the updated AgentSpace.
///
/// @nodoc
class UpdateAgentSpaceOutput {
  final AgentSpace agentSpace;

  UpdateAgentSpaceOutput({
    required this.agentSpace,
  });

  factory UpdateAgentSpaceOutput.fromJson(Map<String, dynamic> json) {
    return UpdateAgentSpaceOutput(
      agentSpace: AgentSpace.fromJson(
          (json['agentSpace'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final agentSpace = this.agentSpace;
    return {
      'agentSpace': agentSpace,
    };
  }
}

/// Empty output for successful AgentSpace deletion.
///
/// @nodoc
class DeleteAgentSpaceOutput {
  DeleteAgentSpaceOutput();

  factory DeleteAgentSpaceOutput.fromJson(Map<String, dynamic> _) {
    return DeleteAgentSpaceOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Output containing the enabled Operator App configuration.
///
/// @nodoc
class EnableOperatorAppOutput {
  /// The unique identifier of the AgentSpace
  final String agentSpaceId;
  final IamAuthConfiguration? iam;
  final IdcAuthConfiguration? idc;
  final IdpAuthConfiguration? idp;

  EnableOperatorAppOutput({
    required this.agentSpaceId,
    this.iam,
    this.idc,
    this.idp,
  });

  factory EnableOperatorAppOutput.fromJson(Map<String, dynamic> json) {
    return EnableOperatorAppOutput(
      agentSpaceId: (json['agentSpaceId'] as String?) ?? '',
      iam: json['iam'] != null
          ? IamAuthConfiguration.fromJson(json['iam'] as Map<String, dynamic>)
          : null,
      idc: json['idc'] != null
          ? IdcAuthConfiguration.fromJson(json['idc'] as Map<String, dynamic>)
          : null,
      idp: json['idp'] != null
          ? IdpAuthConfiguration.fromJson(json['idp'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final agentSpaceId = this.agentSpaceId;
    final iam = this.iam;
    final idc = this.idc;
    final idp = this.idp;
    return {
      'agentSpaceId': agentSpaceId,
      if (iam != null) 'iam': iam,
      if (idc != null) 'idc': idc,
      if (idp != null) 'idp': idp,
    };
  }
}

/// Output containing the Operator App configuration including authentication
/// details.
///
/// @nodoc
class GetOperatorAppOutput {
  final IamAuthConfiguration? iam;
  final IdcAuthConfiguration? idc;
  final IdpAuthConfiguration? idp;

  GetOperatorAppOutput({
    this.iam,
    this.idc,
    this.idp,
  });

  factory GetOperatorAppOutput.fromJson(Map<String, dynamic> json) {
    return GetOperatorAppOutput(
      iam: json['iam'] != null
          ? IamAuthConfiguration.fromJson(json['iam'] as Map<String, dynamic>)
          : null,
      idc: json['idc'] != null
          ? IdcAuthConfiguration.fromJson(json['idc'] as Map<String, dynamic>)
          : null,
      idp: json['idp'] != null
          ? IdpAuthConfiguration.fromJson(json['idp'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final iam = this.iam;
    final idc = this.idc;
    final idp = this.idp;
    return {
      if (iam != null) 'iam': iam,
      if (idc != null) 'idc': idc,
      if (idp != null) 'idp': idp,
    };
  }
}

/// Output containing the updated IdP configuration.
///
/// @nodoc
class UpdateOperatorAppIdpConfigOutput {
  /// The unique identifier of the AgentSpace
  final String agentSpaceId;
  final IdpAuthConfiguration idp;

  UpdateOperatorAppIdpConfigOutput({
    required this.agentSpaceId,
    required this.idp,
  });

  factory UpdateOperatorAppIdpConfigOutput.fromJson(Map<String, dynamic> json) {
    return UpdateOperatorAppIdpConfigOutput(
      agentSpaceId: (json['agentSpaceId'] as String?) ?? '',
      idp: IdpAuthConfiguration.fromJson(
          (json['idp'] as Map<String, dynamic>?) ?? const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final agentSpaceId = this.agentSpaceId;
    final idp = this.idp;
    return {
      'agentSpaceId': agentSpaceId,
      'idp': idp,
    };
  }
}

/// Output containing a list of AgentSpaces and pagination token.
///
/// @nodoc
class ListAgentSpacesOutput {
  /// The list of AgentSpaces.
  final List<AgentSpace> agentSpaces;

  /// Token to retrieve the next page of results, if there are more results.
  final String? nextToken;

  ListAgentSpacesOutput({
    required this.agentSpaces,
    this.nextToken,
  });

  factory ListAgentSpacesOutput.fromJson(Map<String, dynamic> json) {
    return ListAgentSpacesOutput(
      agentSpaces: ((json['agentSpaces'] as List?) ?? const [])
          .nonNulls
          .map((e) => AgentSpace.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final agentSpaces = this.agentSpaces;
    final nextToken = this.nextToken;
    return {
      'agentSpaces': agentSpaces,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Output containing the newly created association and optional webhook
/// configuration.
///
/// @nodoc
class AssociateServiceOutput {
  final Association association;

  /// Generic webhook configuration
  final GenericWebhook? webhook;

  AssociateServiceOutput({
    required this.association,
    this.webhook,
  });

  factory AssociateServiceOutput.fromJson(Map<String, dynamic> json) {
    return AssociateServiceOutput(
      association: Association.fromJson(
          (json['association'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      webhook: json['webhook'] != null
          ? GenericWebhook.fromJson(json['webhook'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final association = this.association;
    final webhook = this.webhook;
    return {
      'association': association,
      if (webhook != null) 'webhook': webhook,
    };
  }
}

/// Output containing the requested association details.
///
/// @nodoc
class GetAssociationOutput {
  final Association association;

  GetAssociationOutput({
    required this.association,
  });

  factory GetAssociationOutput.fromJson(Map<String, dynamic> json) {
    return GetAssociationOutput(
      association: Association.fromJson(
          (json['association'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final association = this.association;
    return {
      'association': association,
    };
  }
}

/// Output containing the updated association and optional webhook
/// configuration.
///
/// @nodoc
class UpdateAssociationOutput {
  final Association association;

  /// Generic webhook configuration
  final GenericWebhook? webhook;

  UpdateAssociationOutput({
    required this.association,
    this.webhook,
  });

  factory UpdateAssociationOutput.fromJson(Map<String, dynamic> json) {
    return UpdateAssociationOutput(
      association: Association.fromJson(
          (json['association'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      webhook: json['webhook'] != null
          ? GenericWebhook.fromJson(json['webhook'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final association = this.association;
    final webhook = this.webhook;
    return {
      'association': association,
      if (webhook != null) 'webhook': webhook,
    };
  }
}

/// Empty output for successful service disassociation.
///
/// @nodoc
class DisassociateServiceOutput {
  DisassociateServiceOutput();

  factory DisassociateServiceOutput.fromJson(Map<String, dynamic> _) {
    return DisassociateServiceOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Output containing a list of service association webhooks.
///
/// @nodoc
class ListWebhooksOutput {
  /// The list of association webhooks.
  final List<Webhook> webhooks;

  ListWebhooksOutput({
    required this.webhooks,
  });

  factory ListWebhooksOutput.fromJson(Map<String, dynamic> json) {
    return ListWebhooksOutput(
      webhooks: ((json['webhooks'] as List?) ?? const [])
          .nonNulls
          .map((e) => Webhook.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final webhooks = this.webhooks;
    return {
      'webhooks': webhooks,
    };
  }
}

/// Output containing a list of service associations and pagination token.
///
/// @nodoc
class ListAssociationsOutput {
  /// The list of associations.
  final List<Association> associations;

  /// Token to retrieve the next page of results, if there are more results.
  final String? nextToken;

  ListAssociationsOutput({
    required this.associations,
    this.nextToken,
  });

  factory ListAssociationsOutput.fromJson(Map<String, dynamic> json) {
    return ListAssociationsOutput(
      associations: ((json['associations'] as List?) ?? const [])
          .nonNulls
          .map((e) => Association.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final associations = this.associations;
    final nextToken = this.nextToken;
    return {
      'associations': associations,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Empty Output for successful validating an aws association
///
/// @nodoc
class ValidateAwsAssociationsOutput {
  ValidateAwsAssociationsOutput();

  factory ValidateAwsAssociationsOutput.fromJson(Map<String, dynamic> _) {
    return ValidateAwsAssociationsOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Output containing the newly created Private Connection summary.
///
/// @nodoc
class CreatePrivateConnectionOutput {
  /// The name of the Private Connection.
  final String name;

  /// The status of the Private Connection.
  final PrivateConnectionStatus status;

  /// The type of the Private Connection.
  final PrivateConnectionType type;

  /// The expiry time of the certificate associated with the Private Connection.
  /// Only present when a certificate is associated.
  final DateTime? certificateExpiryTime;

  /// IP address or DNS name of the target resource. Only present for
  /// service-managed Private Connections.
  final String? hostAddress;

  /// The Resource Configuration ARN. Only present for self-managed Private
  /// Connections.
  final String? resourceConfigurationId;

  /// The service-managed Resource Gateway ARN. Only present for service-managed
  /// Private Connections.
  final String? resourceGatewayId;

  /// Tags associated with the created Private Connection.
  final Map<String, String>? tags;

  /// VPC identifier of the service-managed Resource Gateway. Only present for
  /// service-managed Private Connections.
  final String? vpcId;

  CreatePrivateConnectionOutput({
    required this.name,
    required this.status,
    required this.type,
    this.certificateExpiryTime,
    this.hostAddress,
    this.resourceConfigurationId,
    this.resourceGatewayId,
    this.tags,
    this.vpcId,
  });

  factory CreatePrivateConnectionOutput.fromJson(Map<String, dynamic> json) {
    return CreatePrivateConnectionOutput(
      name: (json['name'] as String?) ?? '',
      status:
          PrivateConnectionStatus.fromString((json['status'] as String?) ?? ''),
      type: PrivateConnectionType.fromString((json['type'] as String?) ?? ''),
      certificateExpiryTime: timeStampFromJson(json['certificateExpiryTime']),
      hostAddress: json['hostAddress'] as String?,
      resourceConfigurationId: json['resourceConfigurationId'] as String?,
      resourceGatewayId: json['resourceGatewayId'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      vpcId: json['vpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final status = this.status;
    final type = this.type;
    final certificateExpiryTime = this.certificateExpiryTime;
    final hostAddress = this.hostAddress;
    final resourceConfigurationId = this.resourceConfigurationId;
    final resourceGatewayId = this.resourceGatewayId;
    final tags = this.tags;
    final vpcId = this.vpcId;
    return {
      'name': name,
      'status': status.value,
      'type': type.value,
      if (certificateExpiryTime != null)
        'certificateExpiryTime': iso8601ToJson(certificateExpiryTime),
      if (hostAddress != null) 'hostAddress': hostAddress,
      if (resourceConfigurationId != null)
        'resourceConfigurationId': resourceConfigurationId,
      if (resourceGatewayId != null) 'resourceGatewayId': resourceGatewayId,
      if (tags != null) 'tags': tags,
      if (vpcId != null) 'vpcId': vpcId,
    };
  }
}

/// Output containing the Private Connection details.
///
/// @nodoc
class DescribePrivateConnectionOutput {
  /// The name of the Private Connection.
  final String name;

  /// The status of the Private Connection.
  final PrivateConnectionStatus status;

  /// The type of the Private Connection.
  final PrivateConnectionType type;

  /// The expiry time of the certificate associated with the Private Connection.
  /// Only present when a certificate is associated.
  final DateTime? certificateExpiryTime;

  /// IP address or DNS name of the target resource. Only present for
  /// service-managed Private Connections.
  final String? hostAddress;

  /// The Resource Configuration ARN. Only present for self-managed Private
  /// Connections.
  final String? resourceConfigurationId;

  /// The service-managed Resource Gateway ARN. Only present for service-managed
  /// Private Connections.
  final String? resourceGatewayId;

  /// Tags associated with the Private Connection.
  final Map<String, String>? tags;

  /// VPC identifier of the service-managed Resource Gateway. Only present for
  /// service-managed Private Connections.
  final String? vpcId;

  DescribePrivateConnectionOutput({
    required this.name,
    required this.status,
    required this.type,
    this.certificateExpiryTime,
    this.hostAddress,
    this.resourceConfigurationId,
    this.resourceGatewayId,
    this.tags,
    this.vpcId,
  });

  factory DescribePrivateConnectionOutput.fromJson(Map<String, dynamic> json) {
    return DescribePrivateConnectionOutput(
      name: (json['name'] as String?) ?? '',
      status:
          PrivateConnectionStatus.fromString((json['status'] as String?) ?? ''),
      type: PrivateConnectionType.fromString((json['type'] as String?) ?? ''),
      certificateExpiryTime: timeStampFromJson(json['certificateExpiryTime']),
      hostAddress: json['hostAddress'] as String?,
      resourceConfigurationId: json['resourceConfigurationId'] as String?,
      resourceGatewayId: json['resourceGatewayId'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      vpcId: json['vpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final status = this.status;
    final type = this.type;
    final certificateExpiryTime = this.certificateExpiryTime;
    final hostAddress = this.hostAddress;
    final resourceConfigurationId = this.resourceConfigurationId;
    final resourceGatewayId = this.resourceGatewayId;
    final tags = this.tags;
    final vpcId = this.vpcId;
    return {
      'name': name,
      'status': status.value,
      'type': type.value,
      if (certificateExpiryTime != null)
        'certificateExpiryTime': iso8601ToJson(certificateExpiryTime),
      if (hostAddress != null) 'hostAddress': hostAddress,
      if (resourceConfigurationId != null)
        'resourceConfigurationId': resourceConfigurationId,
      if (resourceGatewayId != null) 'resourceGatewayId': resourceGatewayId,
      if (tags != null) 'tags': tags,
      if (vpcId != null) 'vpcId': vpcId,
    };
  }
}

/// Output containing the status of the Private Connection deletion.
///
/// @nodoc
class DeletePrivateConnectionOutput {
  /// The name of the Private Connection.
  final String name;

  /// The status of the Private Connection.
  final PrivateConnectionStatus status;

  DeletePrivateConnectionOutput({
    required this.name,
    required this.status,
  });

  factory DeletePrivateConnectionOutput.fromJson(Map<String, dynamic> json) {
    return DeletePrivateConnectionOutput(
      name: (json['name'] as String?) ?? '',
      status:
          PrivateConnectionStatus.fromString((json['status'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final status = this.status;
    return {
      'name': name,
      'status': status.value,
    };
  }
}

/// Output containing the list of Private Connections.
///
/// @nodoc
class ListPrivateConnectionsOutput {
  /// The list of Private Connections.
  final List<PrivateConnectionSummary> privateConnections;

  ListPrivateConnectionsOutput({
    required this.privateConnections,
  });

  factory ListPrivateConnectionsOutput.fromJson(Map<String, dynamic> json) {
    return ListPrivateConnectionsOutput(
      privateConnections: ((json['privateConnections'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              PrivateConnectionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final privateConnections = this.privateConnections;
    return {
      'privateConnections': privateConnections,
    };
  }
}

/// Output containing the updated Private Connection summary.
///
/// @nodoc
class UpdatePrivateConnectionCertificateOutput {
  /// The name of the Private Connection.
  final String name;

  /// The status of the Private Connection.
  final PrivateConnectionStatus status;

  /// The type of the Private Connection.
  final PrivateConnectionType type;

  /// The expiry time of the certificate associated with the Private Connection.
  /// Only present when a certificate is associated.
  final DateTime? certificateExpiryTime;

  /// IP address or DNS name of the target resource. Only present for
  /// service-managed Private Connections.
  final String? hostAddress;

  /// The Resource Configuration ARN. Only present for self-managed Private
  /// Connections.
  final String? resourceConfigurationId;

  /// The service-managed Resource Gateway ARN. Only present for service-managed
  /// Private Connections.
  final String? resourceGatewayId;

  /// VPC identifier of the service-managed Resource Gateway. Only present for
  /// service-managed Private Connections.
  final String? vpcId;

  UpdatePrivateConnectionCertificateOutput({
    required this.name,
    required this.status,
    required this.type,
    this.certificateExpiryTime,
    this.hostAddress,
    this.resourceConfigurationId,
    this.resourceGatewayId,
    this.vpcId,
  });

  factory UpdatePrivateConnectionCertificateOutput.fromJson(
      Map<String, dynamic> json) {
    return UpdatePrivateConnectionCertificateOutput(
      name: (json['name'] as String?) ?? '',
      status:
          PrivateConnectionStatus.fromString((json['status'] as String?) ?? ''),
      type: PrivateConnectionType.fromString((json['type'] as String?) ?? ''),
      certificateExpiryTime: timeStampFromJson(json['certificateExpiryTime']),
      hostAddress: json['hostAddress'] as String?,
      resourceConfigurationId: json['resourceConfigurationId'] as String?,
      resourceGatewayId: json['resourceGatewayId'] as String?,
      vpcId: json['vpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final status = this.status;
    final type = this.type;
    final certificateExpiryTime = this.certificateExpiryTime;
    final hostAddress = this.hostAddress;
    final resourceConfigurationId = this.resourceConfigurationId;
    final resourceGatewayId = this.resourceGatewayId;
    final vpcId = this.vpcId;
    return {
      'name': name,
      'status': status.value,
      'type': type.value,
      if (certificateExpiryTime != null)
        'certificateExpiryTime': iso8601ToJson(certificateExpiryTime),
      if (hostAddress != null) 'hostAddress': hostAddress,
      if (resourceConfigurationId != null)
        'resourceConfigurationId': resourceConfigurationId,
      if (resourceGatewayId != null) 'resourceGatewayId': resourceGatewayId,
      if (vpcId != null) 'vpcId': vpcId,
    };
  }
}

/// Output containing the service ID and any additional steps required for
/// registration.
///
/// @nodoc
class RegisterServiceOutput {
  /// Indicates if additional steps are required to complete service registration
  /// (e.g., 3-legged OAuth)
  final AdditionalServiceRegistrationStep? additionalStep;

  /// The ARN of the AWS Key Management Service (AWS KMS) customer managed key
  /// that's used to encrypt resources.
  final String? kmsKeyArn;

  /// Service ID - present when registration is complete, absent when additional
  /// steps are required
  final String? serviceId;

  /// Tags associated with the registered Service.
  final Map<String, String>? tags;

  RegisterServiceOutput({
    this.additionalStep,
    this.kmsKeyArn,
    this.serviceId,
    this.tags,
  });

  factory RegisterServiceOutput.fromJson(Map<String, dynamic> json) {
    return RegisterServiceOutput(
      additionalStep: json['additionalStep'] != null
          ? AdditionalServiceRegistrationStep.fromJson(
              json['additionalStep'] as Map<String, dynamic>)
          : null,
      kmsKeyArn: json['kmsKeyArn'] as String?,
      serviceId: json['serviceId'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final additionalStep = this.additionalStep;
    final kmsKeyArn = this.kmsKeyArn;
    final serviceId = this.serviceId;
    final tags = this.tags;
    return {
      if (additionalStep != null) 'additionalStep': additionalStep,
      if (kmsKeyArn != null) 'kmsKeyArn': kmsKeyArn,
      if (serviceId != null) 'serviceId': serviceId,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Output containing the requested service details.
///
/// @nodoc
class GetServiceOutput {
  final RegisteredService service;

  /// Tags associated with the Service.
  final Map<String, String>? tags;

  GetServiceOutput({
    required this.service,
    this.tags,
  });

  factory GetServiceOutput.fromJson(Map<String, dynamic> json) {
    return GetServiceOutput(
      service: RegisteredService.fromJson(
          (json['service'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final service = this.service;
    final tags = this.tags;
    return {
      'service': service,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Empty output for successful service deregistration.
///
/// @nodoc
class DeregisterServiceOutput {
  DeregisterServiceOutput();

  factory DeregisterServiceOutput.fromJson(Map<String, dynamic> _) {
    return DeregisterServiceOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Output containing a list of registered services and pagination token.
///
/// @nodoc
class ListServicesOutput {
  final List<RegisteredService> services;

  /// Token to retrieve the next page of results, if there are more results.
  final String? nextToken;

  ListServicesOutput({
    required this.services,
    this.nextToken,
  });

  factory ListServicesOutput.fromJson(Map<String, dynamic> json) {
    return ListServicesOutput(
      services: ((json['services'] as List?) ?? const [])
          .nonNulls
          .map((e) => RegisteredService.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final services = this.services;
    final nextToken = this.nextToken;
    return {
      'services': services,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Represents a registered service with its configuration and accessible
/// resources.
///
/// @nodoc
class RegisteredService {
  /// The unique identifier of a service.
  final String serviceId;

  /// The service type e.g github or dynatrace
  final Service serviceType;

  /// List of accessible resources for this service.
  final List<Document>? accessibleResources;

  /// Additional details specific to the service type.
  final AdditionalServiceDetails? additionalServiceDetails;

  /// The ARN of the AWS Key Management Service (AWS KMS) customer managed key
  /// that's used to encrypt resources.
  final String? kmsKeyArn;

  /// The display name of the registered service.
  final String? name;

  /// The name of the private connection used for VPC connectivity.
  final String? privateConnectionName;

  RegisteredService({
    required this.serviceId,
    required this.serviceType,
    this.accessibleResources,
    this.additionalServiceDetails,
    this.kmsKeyArn,
    this.name,
    this.privateConnectionName,
  });

  factory RegisteredService.fromJson(Map<String, dynamic> json) {
    return RegisteredService(
      serviceId: (json['serviceId'] as String?) ?? '',
      serviceType: Service.fromString((json['serviceType'] as String?) ?? ''),
      accessibleResources: (json['accessibleResources'] as List?)
          ?.nonNulls
          .map((e) => Document.fromJson(e as Map<String, dynamic>))
          .toList(),
      additionalServiceDetails: json['additionalServiceDetails'] != null
          ? AdditionalServiceDetails.fromJson(
              json['additionalServiceDetails'] as Map<String, dynamic>)
          : null,
      kmsKeyArn: json['kmsKeyArn'] as String?,
      name: json['name'] as String?,
      privateConnectionName: json['privateConnectionName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final serviceId = this.serviceId;
    final serviceType = this.serviceType;
    final accessibleResources = this.accessibleResources;
    final additionalServiceDetails = this.additionalServiceDetails;
    final kmsKeyArn = this.kmsKeyArn;
    final name = this.name;
    final privateConnectionName = this.privateConnectionName;
    return {
      'serviceId': serviceId,
      'serviceType': serviceType.value,
      if (accessibleResources != null)
        'accessibleResources': accessibleResources,
      if (additionalServiceDetails != null)
        'additionalServiceDetails': additionalServiceDetails,
      if (kmsKeyArn != null) 'kmsKeyArn': kmsKeyArn,
      if (name != null) 'name': name,
      if (privateConnectionName != null)
        'privateConnectionName': privateConnectionName,
    };
  }
}

/// Enumeration of all supported service types, combining OAuth 3-legged, client
/// credentials, and simple token authentication methods.
///
/// @nodoc
class Service {
  static const github = Service._('github');
  static const slack = Service._('slack');
  static const azure = Service._('azure');
  static const azuredevops = Service._('azuredevops');
  static const dynatrace = Service._('dynatrace');
  static const servicenow = Service._('servicenow');
  static const pagerduty = Service._('pagerduty');
  static const gitlab = Service._('gitlab');
  static const eventChannel = Service._('eventChannel');
  static const mcpservernewrelic = Service._('mcpservernewrelic');
  static const mcpservergrafana = Service._('mcpservergrafana');
  static const mcpserverdatadog = Service._('mcpserverdatadog');
  static const mcpserver = Service._('mcpserver');
  static const mcpserversplunk = Service._('mcpserversplunk');
  static const azureidentity = Service._('azureidentity');
  static const mcpserversigv4 = Service._('mcpserversigv4');

  final String value;

  const Service._(this.value);

  static const values = [
    github,
    slack,
    azure,
    azuredevops,
    dynatrace,
    servicenow,
    pagerduty,
    gitlab,
    eventChannel,
    mcpservernewrelic,
    mcpservergrafana,
    mcpserverdatadog,
    mcpserver,
    mcpserversplunk,
    azureidentity,
    mcpserversigv4
  ];

  static Service fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => Service._(value));

  @override
  bool operator ==(other) => other is Service && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Union of service-specific details for different service types.
///
/// @nodoc
class AdditionalServiceDetails {
  /// Azure DevOps specific service details.
  final RegisteredAzureDevOpsServiceDetails? azuredevops;

  /// Azure identity details for services using Azure authentication.
  final RegisteredAzureIdentityDetails? azureidentity;

  /// GitHub-specific service details.
  final RegisteredGithubServiceDetails? github;

  /// GitLab-specific service details.
  final RegisteredGitLabServiceDetails? gitlab;

  /// MCP server-specific service details.
  final RegisteredMCPServerDetails? mcpserver;

  /// Datadog MCP server-specific service details.
  final RegisteredMCPServerDetails? mcpserverdatadog;

  /// Grafana MCP server-specific service details.
  final RegisteredGrafanaServerDetails? mcpservergrafana;

  /// New Relic MCP server-specific service details.
  final RegisteredNewRelicDetails? mcpservernewrelic;

  /// SigV4-authenticated MCP server-specific service details.
  final RegisteredMCPServerSigV4Details? mcpserversigv4;

  /// Splunk MCP server-specific service details.
  final RegisteredMCPServerDetails? mcpserversplunk;

  /// Pagerduty service details.
  final RegisteredPagerDutyDetails? pagerduty;

  /// ServiceNow-specific service details.
  final RegisteredServiceNowDetails? servicenow;

  /// Slack-specific service details.
  final RegisteredSlackServiceDetails? slack;

  AdditionalServiceDetails({
    this.azuredevops,
    this.azureidentity,
    this.github,
    this.gitlab,
    this.mcpserver,
    this.mcpserverdatadog,
    this.mcpservergrafana,
    this.mcpservernewrelic,
    this.mcpserversigv4,
    this.mcpserversplunk,
    this.pagerduty,
    this.servicenow,
    this.slack,
  });

  factory AdditionalServiceDetails.fromJson(Map<String, dynamic> json) {
    return AdditionalServiceDetails(
      azuredevops: json['azuredevops'] != null
          ? RegisteredAzureDevOpsServiceDetails.fromJson(
              json['azuredevops'] as Map<String, dynamic>)
          : null,
      azureidentity: json['azureidentity'] != null
          ? RegisteredAzureIdentityDetails.fromJson(
              json['azureidentity'] as Map<String, dynamic>)
          : null,
      github: json['github'] != null
          ? RegisteredGithubServiceDetails.fromJson(
              json['github'] as Map<String, dynamic>)
          : null,
      gitlab: json['gitlab'] != null
          ? RegisteredGitLabServiceDetails.fromJson(
              json['gitlab'] as Map<String, dynamic>)
          : null,
      mcpserver: json['mcpserver'] != null
          ? RegisteredMCPServerDetails.fromJson(
              json['mcpserver'] as Map<String, dynamic>)
          : null,
      mcpserverdatadog: json['mcpserverdatadog'] != null
          ? RegisteredMCPServerDetails.fromJson(
              json['mcpserverdatadog'] as Map<String, dynamic>)
          : null,
      mcpservergrafana: json['mcpservergrafana'] != null
          ? RegisteredGrafanaServerDetails.fromJson(
              json['mcpservergrafana'] as Map<String, dynamic>)
          : null,
      mcpservernewrelic: json['mcpservernewrelic'] != null
          ? RegisteredNewRelicDetails.fromJson(
              json['mcpservernewrelic'] as Map<String, dynamic>)
          : null,
      mcpserversigv4: json['mcpserversigv4'] != null
          ? RegisteredMCPServerSigV4Details.fromJson(
              json['mcpserversigv4'] as Map<String, dynamic>)
          : null,
      mcpserversplunk: json['mcpserversplunk'] != null
          ? RegisteredMCPServerDetails.fromJson(
              json['mcpserversplunk'] as Map<String, dynamic>)
          : null,
      pagerduty: json['pagerduty'] != null
          ? RegisteredPagerDutyDetails.fromJson(
              json['pagerduty'] as Map<String, dynamic>)
          : null,
      servicenow: json['servicenow'] != null
          ? RegisteredServiceNowDetails.fromJson(
              json['servicenow'] as Map<String, dynamic>)
          : null,
      slack: json['slack'] != null
          ? RegisteredSlackServiceDetails.fromJson(
              json['slack'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final azuredevops = this.azuredevops;
    final azureidentity = this.azureidentity;
    final github = this.github;
    final gitlab = this.gitlab;
    final mcpserver = this.mcpserver;
    final mcpserverdatadog = this.mcpserverdatadog;
    final mcpservergrafana = this.mcpservergrafana;
    final mcpservernewrelic = this.mcpservernewrelic;
    final mcpserversigv4 = this.mcpserversigv4;
    final mcpserversplunk = this.mcpserversplunk;
    final pagerduty = this.pagerduty;
    final servicenow = this.servicenow;
    final slack = this.slack;
    return {
      if (azuredevops != null) 'azuredevops': azuredevops,
      if (azureidentity != null) 'azureidentity': azureidentity,
      if (github != null) 'github': github,
      if (gitlab != null) 'gitlab': gitlab,
      if (mcpserver != null) 'mcpserver': mcpserver,
      if (mcpserverdatadog != null) 'mcpserverdatadog': mcpserverdatadog,
      if (mcpservergrafana != null) 'mcpservergrafana': mcpservergrafana,
      if (mcpservernewrelic != null) 'mcpservernewrelic': mcpservernewrelic,
      if (mcpserversigv4 != null) 'mcpserversigv4': mcpserversigv4,
      if (mcpserversplunk != null) 'mcpserversplunk': mcpserversplunk,
      if (pagerduty != null) 'pagerduty': pagerduty,
      if (servicenow != null) 'servicenow': servicenow,
      if (slack != null) 'slack': slack,
    };
  }
}

/// Details specific to a registered GitHub service.
///
/// @nodoc
class RegisteredGithubServiceDetails {
  /// The GitHub repository owner name.
  final String owner;

  /// The GitHub repository owner type.
  final GithubRepoOwnerType ownerType;

  /// The GitHub Enterprise Server instance URL (absent for github.com).
  final String? targetUrl;

  RegisteredGithubServiceDetails({
    required this.owner,
    required this.ownerType,
    this.targetUrl,
  });

  factory RegisteredGithubServiceDetails.fromJson(Map<String, dynamic> json) {
    return RegisteredGithubServiceDetails(
      owner: (json['owner'] as String?) ?? '',
      ownerType:
          GithubRepoOwnerType.fromString((json['ownerType'] as String?) ?? ''),
      targetUrl: json['targetUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final owner = this.owner;
    final ownerType = this.ownerType;
    final targetUrl = this.targetUrl;
    return {
      'owner': owner,
      'ownerType': ownerType.value,
      if (targetUrl != null) 'targetUrl': targetUrl,
    };
  }
}

/// Details specific to a registered Slack workspace.
///
/// @nodoc
class RegisteredSlackServiceDetails {
  /// The Slack team ID.
  final String teamId;

  /// The Slack team name.
  final String teamName;

  RegisteredSlackServiceDetails({
    required this.teamId,
    required this.teamName,
  });

  factory RegisteredSlackServiceDetails.fromJson(Map<String, dynamic> json) {
    return RegisteredSlackServiceDetails(
      teamId: (json['teamId'] as String?) ?? '',
      teamName: (json['teamName'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final teamId = this.teamId;
    final teamName = this.teamName;
    return {
      'teamId': teamId,
      'teamName': teamName,
    };
  }
}

/// Details specific to a registered MCP (Model Context Protocol) server.
///
/// @nodoc
class RegisteredMCPServerDetails {
  /// The MCP server uses this authorization method.
  final MCPServerAuthorizationMethod authorizationMethod;

  /// The MCP server endpoint URL.
  final String endpoint;

  /// The MCP server name.
  final String name;

  /// If the MCP server uses API key authentication, these details are provided.
  final String? apiKeyHeader;

  /// Optional description for the MCP server.
  final String? description;

  RegisteredMCPServerDetails({
    required this.authorizationMethod,
    required this.endpoint,
    required this.name,
    this.apiKeyHeader,
    this.description,
  });

  factory RegisteredMCPServerDetails.fromJson(Map<String, dynamic> json) {
    return RegisteredMCPServerDetails(
      authorizationMethod: MCPServerAuthorizationMethod.fromString(
          (json['authorizationMethod'] as String?) ?? ''),
      endpoint: (json['endpoint'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      apiKeyHeader: json['apiKeyHeader'] as String?,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final authorizationMethod = this.authorizationMethod;
    final endpoint = this.endpoint;
    final name = this.name;
    final apiKeyHeader = this.apiKeyHeader;
    final description = this.description;
    return {
      'authorizationMethod': authorizationMethod.value,
      'endpoint': endpoint,
      'name': name,
      if (apiKeyHeader != null) 'apiKeyHeader': apiKeyHeader,
      if (description != null) 'description': description,
    };
  }
}

/// Details specific to a registered ServiceNow instance.
///
/// @nodoc
class RegisteredServiceNowDetails {
  /// The ServiceNow instance url
  final String? instanceUrl;

  RegisteredServiceNowDetails({
    this.instanceUrl,
  });

  factory RegisteredServiceNowDetails.fromJson(Map<String, dynamic> json) {
    return RegisteredServiceNowDetails(
      instanceUrl: json['instanceUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final instanceUrl = this.instanceUrl;
    return {
      if (instanceUrl != null) 'instanceUrl': instanceUrl,
    };
  }
}

/// Details specific to a registered GitLab instance.
///
/// @nodoc
class RegisteredGitLabServiceDetails {
  /// The GitLab instance URL.
  final String targetUrl;

  /// Type of GitLab access token
  final GitLabTokenType tokenType;

  /// Optional GitLab group ID for group-level access tokens
  final String? groupId;

  RegisteredGitLabServiceDetails({
    required this.targetUrl,
    required this.tokenType,
    this.groupId,
  });

  factory RegisteredGitLabServiceDetails.fromJson(Map<String, dynamic> json) {
    return RegisteredGitLabServiceDetails(
      targetUrl: (json['targetUrl'] as String?) ?? '',
      tokenType:
          GitLabTokenType.fromString((json['tokenType'] as String?) ?? ''),
      groupId: json['groupId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final targetUrl = this.targetUrl;
    final tokenType = this.tokenType;
    final groupId = this.groupId;
    return {
      'targetUrl': targetUrl,
      'tokenType': tokenType.value,
      if (groupId != null) 'groupId': groupId,
    };
  }
}

/// Details specific to a registered NewRelic instance.
///
/// @nodoc
class RegisteredNewRelicDetails {
  /// The NewRelic account ID.
  final String accountId;

  /// The NewRelic region (determines API endpoint).
  final NewRelicRegion region;

  /// Optional user description.
  final String? description;

  RegisteredNewRelicDetails({
    required this.accountId,
    required this.region,
    this.description,
  });

  factory RegisteredNewRelicDetails.fromJson(Map<String, dynamic> json) {
    return RegisteredNewRelicDetails(
      accountId: (json['accountId'] as String?) ?? '',
      region: NewRelicRegion.fromString((json['region'] as String?) ?? ''),
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final region = this.region;
    final description = this.description;
    return {
      'accountId': accountId,
      'region': region.value,
      if (description != null) 'description': description,
    };
  }
}

/// Details specific to a registered Azure DevOps service.
///
/// @nodoc
class RegisteredAzureDevOpsServiceDetails {
  /// The Azure DevOps Organization name associated with the service.
  final String organizationName;

  RegisteredAzureDevOpsServiceDetails({
    required this.organizationName,
  });

  factory RegisteredAzureDevOpsServiceDetails.fromJson(
      Map<String, dynamic> json) {
    return RegisteredAzureDevOpsServiceDetails(
      organizationName: (json['organizationName'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final organizationName = this.organizationName;
    return {
      'organizationName': organizationName,
    };
  }
}

/// Details specific to a registered Azure identity using AWS Outbound Identity
/// Federation.
///
/// @nodoc
class RegisteredAzureIdentityDetails {
  /// The client ID of the service principal or managed identity used for
  /// authentication.
  final String clientId;

  /// The Azure Active Directory tenant ID for the identity.
  final String tenantId;

  /// The role ARN to be assumed by DevOps Agent for requesting Web Identity
  /// Token.
  final String webIdentityRoleArn;

  /// The audiences for the Web Identity Token.
  final List<String> webIdentityTokenAudiences;

  RegisteredAzureIdentityDetails({
    required this.clientId,
    required this.tenantId,
    required this.webIdentityRoleArn,
    required this.webIdentityTokenAudiences,
  });

  factory RegisteredAzureIdentityDetails.fromJson(Map<String, dynamic> json) {
    return RegisteredAzureIdentityDetails(
      clientId: (json['clientId'] as String?) ?? '',
      tenantId: (json['tenantId'] as String?) ?? '',
      webIdentityRoleArn: (json['webIdentityRoleArn'] as String?) ?? '',
      webIdentityTokenAudiences:
          ((json['webIdentityTokenAudiences'] as List?) ?? const [])
              .nonNulls
              .map((e) => e as String)
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final clientId = this.clientId;
    final tenantId = this.tenantId;
    final webIdentityRoleArn = this.webIdentityRoleArn;
    final webIdentityTokenAudiences = this.webIdentityTokenAudiences;
    return {
      'clientId': clientId,
      'tenantId': tenantId,
      'webIdentityRoleArn': webIdentityRoleArn,
      'webIdentityTokenAudiences': webIdentityTokenAudiences,
    };
  }
}

/// Details specific to a registered Grafana server, used by the built-in MCP
/// server.
///
/// @nodoc
class RegisteredGrafanaServerDetails {
  /// The authz method used by the MCP server.
  final MCPServerAuthorizationMethod authorizationMethod;

  /// Grafana instance URL (e.g., https://your-instance.grafana.net)
  final String endpoint;

  RegisteredGrafanaServerDetails({
    required this.authorizationMethod,
    required this.endpoint,
  });

  factory RegisteredGrafanaServerDetails.fromJson(Map<String, dynamic> json) {
    return RegisteredGrafanaServerDetails(
      authorizationMethod: MCPServerAuthorizationMethod.fromString(
          (json['authorizationMethod'] as String?) ?? ''),
      endpoint: (json['endpoint'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final authorizationMethod = this.authorizationMethod;
    final endpoint = this.endpoint;
    return {
      'authorizationMethod': authorizationMethod.value,
      'endpoint': endpoint,
    };
  }
}

/// Details specific to a registered PagerDuty service.
///
/// @nodoc
class RegisteredPagerDutyDetails {
  /// The scopes that were assigned to the service
  final List<String> scopes;

  RegisteredPagerDutyDetails({
    required this.scopes,
  });

  factory RegisteredPagerDutyDetails.fromJson(Map<String, dynamic> json) {
    return RegisteredPagerDutyDetails(
      scopes: ((json['scopes'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final scopes = this.scopes;
    return {
      'scopes': scopes,
    };
  }
}

/// Details specific to a registered SigV4-authenticated MCP server.
///
/// @nodoc
class RegisteredMCPServerSigV4Details {
  /// MCP server endpoint URL.
  final String endpoint;

  /// MCP server name.
  final String name;

  /// AWS region for SigV4 signing. Use '*' for SigV4a multi-region signing.
  final String region;

  /// IAM role ARN to assume for SigV4 signing.
  final String roleArn;

  /// AWS service name for SigV4 signing.
  final String service;

  /// Custom headers for the SigV4 MCP server.
  final Map<String, String>? customHeaders;

  /// Optional description for the MCP server.
  final String? description;

  RegisteredMCPServerSigV4Details({
    required this.endpoint,
    required this.name,
    required this.region,
    required this.roleArn,
    required this.service,
    this.customHeaders,
    this.description,
  });

  factory RegisteredMCPServerSigV4Details.fromJson(Map<String, dynamic> json) {
    return RegisteredMCPServerSigV4Details(
      endpoint: (json['endpoint'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      region: (json['region'] as String?) ?? '',
      roleArn: (json['roleArn'] as String?) ?? '',
      service: (json['service'] as String?) ?? '',
      customHeaders: (json['customHeaders'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final endpoint = this.endpoint;
    final name = this.name;
    final region = this.region;
    final roleArn = this.roleArn;
    final service = this.service;
    final customHeaders = this.customHeaders;
    final description = this.description;
    return {
      'endpoint': endpoint,
      'name': name,
      'region': region,
      'roleArn': roleArn,
      'service': service,
      if (customHeaders != null) 'customHeaders': customHeaders,
      if (description != null) 'description': description,
    };
  }
}

/// Supported authorization methods for MCP servers.
///
/// @nodoc
class MCPServerAuthorizationMethod {
  static const oauthClientCredentials =
      MCPServerAuthorizationMethod._('oauth-client-credentials');
  static const oauth_3lo = MCPServerAuthorizationMethod._('oauth-3lo');
  static const apiKey = MCPServerAuthorizationMethod._('api-key');
  static const bearerToken = MCPServerAuthorizationMethod._('bearer-token');

  final String value;

  const MCPServerAuthorizationMethod._(this.value);

  static const values = [
    oauthClientCredentials,
    oauth_3lo,
    apiKey,
    bearerToken
  ];

  static MCPServerAuthorizationMethod fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MCPServerAuthorizationMethod._(value));

  @override
  bool operator ==(other) =>
      other is MCPServerAuthorizationMethod && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The NewRelic region (determines API endpoint).
///
/// @nodoc
class NewRelicRegion {
  static const us = NewRelicRegion._('US');
  static const eu = NewRelicRegion._('EU');

  final String value;

  const NewRelicRegion._(this.value);

  static const values = [us, eu];

  static NewRelicRegion fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => NewRelicRegion._(value));

  @override
  bool operator ==(other) => other is NewRelicRegion && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Type of GitLab access token.
///
/// @nodoc
class GitLabTokenType {
  static const personal = GitLabTokenType._('personal');
  static const group = GitLabTokenType._('group');

  final String value;

  const GitLabTokenType._(this.value);

  static const values = [personal, group];

  static GitLabTokenType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => GitLabTokenType._(value));

  @override
  bool operator ==(other) => other is GitLabTokenType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Type of GitHub repository owner.
///
/// @nodoc
class GithubRepoOwnerType {
  static const organization = GithubRepoOwnerType._('organization');
  static const user = GithubRepoOwnerType._('user');

  final String value;

  const GithubRepoOwnerType._(this.value);

  static const values = [organization, user];

  static GithubRepoOwnerType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => GithubRepoOwnerType._(value));

  @override
  bool operator ==(other) =>
      other is GithubRepoOwnerType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Additional steps required to complete service registration.
///
/// @nodoc
class AdditionalServiceRegistrationStep {
  /// OAuth authorization step required.
  final OAuthAdditionalStepDetails? oauth;

  AdditionalServiceRegistrationStep({
    this.oauth,
  });

  factory AdditionalServiceRegistrationStep.fromJson(
      Map<String, dynamic> json) {
    return AdditionalServiceRegistrationStep(
      oauth: json['oauth'] != null
          ? OAuthAdditionalStepDetails.fromJson(
              json['oauth'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final oauth = this.oauth;
    return {
      if (oauth != null) 'oauth': oauth,
    };
  }
}

/// Details for completing OAuth authorization step.
///
/// @nodoc
class OAuthAdditionalStepDetails {
  /// The URL to redirect the user to for OAuth authorization.
  final String authorizationUrl;

  OAuthAdditionalStepDetails({
    required this.authorizationUrl,
  });

  factory OAuthAdditionalStepDetails.fromJson(Map<String, dynamic> json) {
    return OAuthAdditionalStepDetails(
      authorizationUrl: (json['authorizationUrl'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final authorizationUrl = this.authorizationUrl;
    return {
      'authorizationUrl': authorizationUrl,
    };
  }
}

/// Services that can be registered via the post-registration API (excludes
/// OAuth 3LO services).
///
/// @nodoc
class PostRegisterServiceSupportedService {
  static const dynatrace = PostRegisterServiceSupportedService._('dynatrace');
  static const servicenow = PostRegisterServiceSupportedService._('servicenow');
  static const pagerduty = PostRegisterServiceSupportedService._('pagerduty');
  static const gitlab = PostRegisterServiceSupportedService._('gitlab');
  static const eventChannel =
      PostRegisterServiceSupportedService._('eventChannel');
  static const mcpservernewrelic =
      PostRegisterServiceSupportedService._('mcpservernewrelic');
  static const mcpservergrafana =
      PostRegisterServiceSupportedService._('mcpservergrafana');
  static const mcpserverdatadog =
      PostRegisterServiceSupportedService._('mcpserverdatadog');
  static const mcpserver = PostRegisterServiceSupportedService._('mcpserver');
  static const mcpserversplunk =
      PostRegisterServiceSupportedService._('mcpserversplunk');
  static const azureidentity =
      PostRegisterServiceSupportedService._('azureidentity');
  static const mcpserversigv4 =
      PostRegisterServiceSupportedService._('mcpserversigv4');

  final String value;

  const PostRegisterServiceSupportedService._(this.value);

  static const values = [
    dynatrace,
    servicenow,
    pagerduty,
    gitlab,
    eventChannel,
    mcpservernewrelic,
    mcpservergrafana,
    mcpserverdatadog,
    mcpserver,
    mcpserversplunk,
    azureidentity,
    mcpserversigv4
  ];

  static PostRegisterServiceSupportedService fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PostRegisterServiceSupportedService._(value));

  @override
  bool operator ==(other) =>
      other is PostRegisterServiceSupportedService && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Union of service-specific configuration details for service registration.
///
/// @nodoc
class ServiceDetails {
  /// Azure integration with AWS Outbound Identity Federation specific service
  /// details.
  final RegisteredAzureIdentityDetails? azureidentity;

  /// Dynatrace-specific service details.
  final DynatraceServiceDetails? dynatrace;

  /// Event Channel specific service details.
  final EventChannelDetails? eventChannel;

  /// GitLab-specific service details.
  final GitLabDetails? gitlab;

  /// MCP server-specific service details.
  final MCPServerDetails? mcpserver;

  /// Datadog MCP server-specific service details.
  final DatadogServiceDetails? mcpserverdatadog;

  /// Datadog MCP server-specific service details.
  final GrafanaServiceDetails? mcpservergrafana;

  /// New Relic-specific service details.
  final NewRelicServiceDetails? mcpservernewrelic;

  /// SigV4-authenticated MCP server-specific service details.
  final MCPServerSigV4ServiceDetails? mcpserversigv4;

  /// Splunk MCP server-specific service details.
  final MCPServerDetails? mcpserversplunk;

  /// PagerDuty specific service details.
  final PagerDutyDetails? pagerduty;

  /// ServiceNow-specific service details.
  final ServiceNowServiceDetails? servicenow;

  ServiceDetails({
    this.azureidentity,
    this.dynatrace,
    this.eventChannel,
    this.gitlab,
    this.mcpserver,
    this.mcpserverdatadog,
    this.mcpservergrafana,
    this.mcpservernewrelic,
    this.mcpserversigv4,
    this.mcpserversplunk,
    this.pagerduty,
    this.servicenow,
  });

  Map<String, dynamic> toJson() {
    final azureidentity = this.azureidentity;
    final dynatrace = this.dynatrace;
    final eventChannel = this.eventChannel;
    final gitlab = this.gitlab;
    final mcpserver = this.mcpserver;
    final mcpserverdatadog = this.mcpserverdatadog;
    final mcpservergrafana = this.mcpservergrafana;
    final mcpservernewrelic = this.mcpservernewrelic;
    final mcpserversigv4 = this.mcpserversigv4;
    final mcpserversplunk = this.mcpserversplunk;
    final pagerduty = this.pagerduty;
    final servicenow = this.servicenow;
    return {
      if (azureidentity != null) 'azureidentity': azureidentity,
      if (dynatrace != null) 'dynatrace': dynatrace,
      if (eventChannel != null) 'eventChannel': eventChannel,
      if (gitlab != null) 'gitlab': gitlab,
      if (mcpserver != null) 'mcpserver': mcpserver,
      if (mcpserverdatadog != null) 'mcpserverdatadog': mcpserverdatadog,
      if (mcpservergrafana != null) 'mcpservergrafana': mcpservergrafana,
      if (mcpservernewrelic != null) 'mcpservernewrelic': mcpservernewrelic,
      if (mcpserversigv4 != null) 'mcpserversigv4': mcpserversigv4,
      if (mcpserversplunk != null) 'mcpserversplunk': mcpserversplunk,
      if (pagerduty != null) 'pagerduty': pagerduty,
      if (servicenow != null) 'servicenow': servicenow,
    };
  }
}

/// Complete service details for Dynatrace integration.
///
/// @nodoc
class DynatraceServiceDetails {
  /// Dynatrace resource account urn.
  final String accountUrn;

  /// Dynatrace OAuth client credentials configuration. Use this when registering
  /// with OAuth client credentials flow.
  final DynatraceServiceAuthorizationConfig? authorizationConfig;

  DynatraceServiceDetails({
    required this.accountUrn,
    this.authorizationConfig,
  });

  Map<String, dynamic> toJson() {
    final accountUrn = this.accountUrn;
    final authorizationConfig = this.authorizationConfig;
    return {
      'accountUrn': accountUrn,
      if (authorizationConfig != null)
        'authorizationConfig': authorizationConfig,
    };
  }
}

/// Complete service details for ServiceNow integration.
///
/// @nodoc
class ServiceNowServiceDetails {
  /// ServiceNow instance URL.
  final String instanceUrl;

  /// ServiceNow OAuth client credentials configuration. Use this when registering
  /// with OAuth client credentials flow.
  final ServiceNowServiceAuthorizationConfig? authorizationConfig;

  ServiceNowServiceDetails({
    required this.instanceUrl,
    this.authorizationConfig,
  });

  Map<String, dynamic> toJson() {
    final instanceUrl = this.instanceUrl;
    final authorizationConfig = this.authorizationConfig;
    return {
      'instanceUrl': instanceUrl,
      if (authorizationConfig != null)
        'authorizationConfig': authorizationConfig,
    };
  }
}

/// Complete service details for Datadog MCP server integration.
///
/// @nodoc
class DatadogServiceDetails {
  /// Datadog MCP server authorization configuration (only authorization discovery
  /// is supported).
  final DatadogAuthorizationConfig authorizationConfig;

  /// MCP server endpoint URL.
  final String endpoint;

  /// MCP server name.
  final String name;

  /// Optional description for the MCP server.
  final String? description;

  DatadogServiceDetails({
    required this.authorizationConfig,
    required this.endpoint,
    required this.name,
    this.description,
  });

  Map<String, dynamic> toJson() {
    final authorizationConfig = this.authorizationConfig;
    final endpoint = this.endpoint;
    final name = this.name;
    final description = this.description;
    return {
      'authorizationConfig': authorizationConfig,
      'endpoint': endpoint,
      'name': name,
      if (description != null) 'description': description,
    };
  }
}

/// Complete service details for MCP server integration.
///
/// @nodoc
class MCPServerDetails {
  /// MCP server authorization configuration.
  final MCPServerAuthorizationConfig authorizationConfig;

  /// MCP server endpoint URL.
  final String endpoint;

  /// MCP server name.
  final String name;

  /// Optional description for the MCP server.
  final String? description;

  MCPServerDetails({
    required this.authorizationConfig,
    required this.endpoint,
    required this.name,
    this.description,
  });

  Map<String, dynamic> toJson() {
    final authorizationConfig = this.authorizationConfig;
    final endpoint = this.endpoint;
    final name = this.name;
    final description = this.description;
    return {
      'authorizationConfig': authorizationConfig,
      'endpoint': endpoint,
      'name': name,
      if (description != null) 'description': description,
    };
  }
}

/// Service details for GitLab integration.
///
/// @nodoc
class GitLabDetails {
  /// GitLab instance URL (e.g., https://gitlab.com or self-hosted instance).
  final String targetUrl;

  /// Type of GitLab access token
  final GitLabTokenType tokenType;

  /// GitLab access token value
  final String tokenValue;

  /// Optional GitLab group ID for group-level access tokens
  final String? groupId;

  GitLabDetails({
    required this.targetUrl,
    required this.tokenType,
    required this.tokenValue,
    this.groupId,
  });

  Map<String, dynamic> toJson() {
    final targetUrl = this.targetUrl;
    final tokenType = this.tokenType;
    final tokenValue = this.tokenValue;
    final groupId = this.groupId;
    return {
      'targetUrl': targetUrl,
      'tokenType': tokenType.value,
      'tokenValue': tokenValue,
      if (groupId != null) 'groupId': groupId,
    };
  }
}

/// Complete service details for New Relic integration.
///
/// @nodoc
class NewRelicServiceDetails {
  /// New Relic MCP server authorization configuration.
  final NewRelicServiceAuthorizationConfig authorizationConfig;

  NewRelicServiceDetails({
    required this.authorizationConfig,
  });

  Map<String, dynamic> toJson() {
    final authorizationConfig = this.authorizationConfig;
    return {
      'authorizationConfig': authorizationConfig,
    };
  }
}

/// Service details for Event Channel integration.
///
/// @nodoc
class EventChannelDetails {
  /// The type of event channel
  final EventChannelType? type;

  EventChannelDetails({
    this.type,
  });

  Map<String, dynamic> toJson() {
    final type = this.type;
    return {
      if (type != null) 'type': type.value,
    };
  }
}

/// Complete service details for Grafana MCP server integration.
///
/// @nodoc
class GrafanaServiceDetails {
  /// Grafana MCP server authorization configuration (experimental).
  final MCPServerAuthorizationConfig authorizationConfig;

  /// MCP server endpoint URL.
  final String endpoint;

  /// MCP server name.
  final String name;

  /// Optional description for the MCP server.
  final String? description;

  GrafanaServiceDetails({
    required this.authorizationConfig,
    required this.endpoint,
    required this.name,
    this.description,
  });

  Map<String, dynamic> toJson() {
    final authorizationConfig = this.authorizationConfig;
    final endpoint = this.endpoint;
    final name = this.name;
    final description = this.description;
    return {
      'authorizationConfig': authorizationConfig,
      'endpoint': endpoint,
      'name': name,
      if (description != null) 'description': description,
    };
  }
}

/// Complete service details for PagerDuty integration
///
/// @nodoc
class PagerDutyDetails {
  /// PagerDuty authorization configuration
  final PagerDutyAuthorizationConfig authorizationConfig;

  /// PagerDuty scopes.
  final List<String> scopes;

  PagerDutyDetails({
    required this.authorizationConfig,
    required this.scopes,
  });

  Map<String, dynamic> toJson() {
    final authorizationConfig = this.authorizationConfig;
    final scopes = this.scopes;
    return {
      'authorizationConfig': authorizationConfig,
      'scopes': scopes,
    };
  }
}

/// Complete service details for SigV4-authenticated MCP server integration.
///
/// @nodoc
class MCPServerSigV4ServiceDetails {
  /// MCP Server SigV4 authorization configuration.
  final MCPServerSigV4AuthorizationConfig authorizationConfig;

  /// MCP server endpoint URL.
  final String endpoint;

  /// MCP server name.
  final String name;

  /// Optional description for the MCP server.
  final String? description;

  MCPServerSigV4ServiceDetails({
    required this.authorizationConfig,
    required this.endpoint,
    required this.name,
    this.description,
  });

  Map<String, dynamic> toJson() {
    final authorizationConfig = this.authorizationConfig;
    final endpoint = this.endpoint;
    final name = this.name;
    final description = this.description;
    return {
      'authorizationConfig': authorizationConfig,
      'endpoint': endpoint,
      'name': name,
      if (description != null) 'description': description,
    };
  }
}

/// Authorization configuration for SigV4-authenticated MCP server.
///
/// @nodoc
class MCPServerSigV4AuthorizationConfig {
  /// AWS region for SigV4 signing. Use '*' for SigV4a multi-region signing.
  final String region;

  /// IAM role ARN to assume for SigV4 signing.
  final String roleArn;

  /// AWS service name for SigV4 signing.
  final String service;

  /// Custom headers for the SigV4 MCP server.
  final Map<String, String>? customHeaders;

  MCPServerSigV4AuthorizationConfig({
    required this.region,
    required this.roleArn,
    required this.service,
    this.customHeaders,
  });

  Map<String, dynamic> toJson() {
    final region = this.region;
    final roleArn = this.roleArn;
    final service = this.service;
    final customHeaders = this.customHeaders;
    return {
      'region': region,
      'roleArn': roleArn,
      'service': service,
      if (customHeaders != null) 'customHeaders': customHeaders,
    };
  }
}

/// Authorization configuration options for PagerDuty service.
///
/// @nodoc
class PagerDutyAuthorizationConfig {
  /// OAuth client credentials configuration.
  final PagerDutyOAuthClientCredentialsConfig? oAuthClientCredentials;

  PagerDutyAuthorizationConfig({
    this.oAuthClientCredentials,
  });

  Map<String, dynamic> toJson() {
    final oAuthClientCredentials = this.oAuthClientCredentials;
    return {
      if (oAuthClientCredentials != null)
        'oAuthClientCredentials': oAuthClientCredentials,
    };
  }
}

/// OAuth client credentials configuration for PagerDuty.
///
/// @nodoc
class PagerDutyOAuthClientCredentialsConfig {
  /// OAuth client ID for authenticating with the service.
  final String clientId;

  /// OAuth client secret for authenticating with the service.
  final String clientSecret;

  /// User friendly OAuth client name specified by end user.
  final String? clientName;

  /// OAuth token exchange parameters for authenticating with the service.
  final Map<String, String>? exchangeParameters;

  PagerDutyOAuthClientCredentialsConfig({
    required this.clientId,
    required this.clientSecret,
    this.clientName,
    this.exchangeParameters,
  });

  Map<String, dynamic> toJson() {
    final clientId = this.clientId;
    final clientSecret = this.clientSecret;
    final clientName = this.clientName;
    final exchangeParameters = this.exchangeParameters;
    return {
      'clientId': clientId,
      'clientSecret': clientSecret,
      if (clientName != null) 'clientName': clientName,
      if (exchangeParameters != null) 'exchangeParameters': exchangeParameters,
    };
  }
}

/// Authorization configuration options for MCP server, supporting OAuth, API
/// key, bearer token, and authorization discovery methods.
///
/// @nodoc
class MCPServerAuthorizationConfig {
  /// MCP server configuration with API key authentication.
  final MCPServerAPIKeyConfig? apiKey;

  /// MCP server authorization discovery configuration.
  final MCPServerAuthorizationDiscoveryConfig? authorizationDiscovery;

  /// MCP server configuration with Bearer token (RFC 6750).
  final MCPServerBearerTokenConfig? bearerToken;

  /// MCP server configuration with OAuth 3LO.
  final MCPServerOAuth3LOConfig? oAuth3LO;

  /// MCP server configuration with OAuth client credentials.
  final MCPServerOAuthClientCredentialsConfig? oAuthClientCredentials;

  MCPServerAuthorizationConfig({
    this.apiKey,
    this.authorizationDiscovery,
    this.bearerToken,
    this.oAuth3LO,
    this.oAuthClientCredentials,
  });

  Map<String, dynamic> toJson() {
    final apiKey = this.apiKey;
    final authorizationDiscovery = this.authorizationDiscovery;
    final bearerToken = this.bearerToken;
    final oAuth3LO = this.oAuth3LO;
    final oAuthClientCredentials = this.oAuthClientCredentials;
    return {
      if (apiKey != null) 'apiKey': apiKey,
      if (authorizationDiscovery != null)
        'authorizationDiscovery': authorizationDiscovery,
      if (bearerToken != null) 'bearerToken': bearerToken,
      if (oAuth3LO != null) 'oAuth3LO': oAuth3LO,
      if (oAuthClientCredentials != null)
        'oAuthClientCredentials': oAuthClientCredentials,
    };
  }
}

/// OAuth client credentials configuration for MCP server.
///
/// @nodoc
class MCPServerOAuthClientCredentialsConfig {
  /// OAuth client ID for authenticating with the service.
  final String clientId;

  /// OAuth client secret for authenticating with the service.
  final String clientSecret;

  /// OAuth token exchange URL.
  final String exchangeUrl;

  /// User friendly OAuth client name specified by end user.
  final String? clientName;

  /// OAuth token exchange parameters for authenticating with the service.
  final Map<String, String>? exchangeParameters;

  /// OAuth scopes for 3LO authentication. The service will always request scope
  /// offline_access.
  final List<String>? scopes;

  MCPServerOAuthClientCredentialsConfig({
    required this.clientId,
    required this.clientSecret,
    required this.exchangeUrl,
    this.clientName,
    this.exchangeParameters,
    this.scopes,
  });

  Map<String, dynamic> toJson() {
    final clientId = this.clientId;
    final clientSecret = this.clientSecret;
    final exchangeUrl = this.exchangeUrl;
    final clientName = this.clientName;
    final exchangeParameters = this.exchangeParameters;
    final scopes = this.scopes;
    return {
      'clientId': clientId,
      'clientSecret': clientSecret,
      'exchangeUrl': exchangeUrl,
      if (clientName != null) 'clientName': clientName,
      if (exchangeParameters != null) 'exchangeParameters': exchangeParameters,
      if (scopes != null) 'scopes': scopes,
    };
  }
}

/// OAuth 3-legged authorization configuration for MCP server.
///
/// @nodoc
class MCPServerOAuth3LOConfig {
  /// OAuth authorization URL for 3LO authentication.
  final String authorizationUrl;

  /// OAuth client ID for authenticating with the service.
  final String clientId;

  /// OAuth token exchange URL.
  final String exchangeUrl;

  /// The endpoint to return to after OAuth flow completes (must be AWS console
  /// domain)
  final String returnToEndpoint;

  /// User friendly OAuth client name specified by end user.
  final String? clientName;

  /// OAuth client secret for authenticating with the service. Required for
  /// confidential clients or when PKCE is not supported. Optional for public
  /// clients using PKCE.
  final String? clientSecret;

  /// OAuth token exchange parameters for authenticating with the service.
  final Map<String, String>? exchangeParameters;

  /// OAuth scopes for 3LO authentication. The service will always request scope
  /// offline_access.
  final List<String>? scopes;

  /// Whether the service supports PKCE (Proof Key for Code Exchange) for enhanced
  /// security during the OAuth flow.
  final bool? supportCodeChallenge;

  MCPServerOAuth3LOConfig({
    required this.authorizationUrl,
    required this.clientId,
    required this.exchangeUrl,
    required this.returnToEndpoint,
    this.clientName,
    this.clientSecret,
    this.exchangeParameters,
    this.scopes,
    this.supportCodeChallenge,
  });

  Map<String, dynamic> toJson() {
    final authorizationUrl = this.authorizationUrl;
    final clientId = this.clientId;
    final exchangeUrl = this.exchangeUrl;
    final returnToEndpoint = this.returnToEndpoint;
    final clientName = this.clientName;
    final clientSecret = this.clientSecret;
    final exchangeParameters = this.exchangeParameters;
    final scopes = this.scopes;
    final supportCodeChallenge = this.supportCodeChallenge;
    return {
      'authorizationUrl': authorizationUrl,
      'clientId': clientId,
      'exchangeUrl': exchangeUrl,
      'returnToEndpoint': returnToEndpoint,
      if (clientName != null) 'clientName': clientName,
      if (clientSecret != null) 'clientSecret': clientSecret,
      if (exchangeParameters != null) 'exchangeParameters': exchangeParameters,
      if (scopes != null) 'scopes': scopes,
      if (supportCodeChallenge != null)
        'supportCodeChallenge': supportCodeChallenge,
    };
  }
}

/// API key configuration for MCP server.
///
/// @nodoc
class MCPServerAPIKeyConfig {
  /// HTTP header name to send the API key in requests to the service.
  final String apiKeyHeader;

  /// User friendly API key name specified by end user.
  final String apiKeyName;

  /// API key value for authenticating with the service.
  final String apiKeyValue;

  MCPServerAPIKeyConfig({
    required this.apiKeyHeader,
    required this.apiKeyName,
    required this.apiKeyValue,
  });

  Map<String, dynamic> toJson() {
    final apiKeyHeader = this.apiKeyHeader;
    final apiKeyName = this.apiKeyName;
    final apiKeyValue = this.apiKeyValue;
    return {
      'apiKeyHeader': apiKeyHeader,
      'apiKeyName': apiKeyName,
      'apiKeyValue': apiKeyValue,
    };
  }
}

/// Bearer token configuration for MCP server (RFC 6750).
///
/// @nodoc
class MCPServerBearerTokenConfig {
  /// User friendly bearer token name specified by end user.
  final String tokenName;

  /// Bearer token value in alphanumeric for authenticating with the service.
  final String tokenValue;

  /// HTTP header name to send the bearer token in requests to the service.
  /// Defaults to 'Authorization' per RFC 6750.
  final String? authorizationHeader;

  MCPServerBearerTokenConfig({
    required this.tokenName,
    required this.tokenValue,
    this.authorizationHeader,
  });

  Map<String, dynamic> toJson() {
    final tokenName = this.tokenName;
    final tokenValue = this.tokenValue;
    final authorizationHeader = this.authorizationHeader;
    return {
      'tokenName': tokenName,
      'tokenValue': tokenValue,
      if (authorizationHeader != null)
        'authorizationHeader': authorizationHeader,
    };
  }
}

/// Authorization discovery configuration for MCP server.
///
/// @nodoc
class MCPServerAuthorizationDiscoveryConfig {
  /// The endpoint to return to after OAuth flow completes (must be AWS console
  /// domain)
  final String returnToEndpoint;

  MCPServerAuthorizationDiscoveryConfig({
    required this.returnToEndpoint,
  });

  Map<String, dynamic> toJson() {
    final returnToEndpoint = this.returnToEndpoint;
    return {
      'returnToEndpoint': returnToEndpoint,
    };
  }
}

/// Event Channel type
///
/// @nodoc
class EventChannelType {
  static const webhook = EventChannelType._('webhook');

  final String value;

  const EventChannelType._(this.value);

  static const values = [webhook];

  static EventChannelType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EventChannelType._(value));

  @override
  bool operator ==(other) => other is EventChannelType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Authorization configuration options for New Relic service.
///
/// @nodoc
class NewRelicServiceAuthorizationConfig {
  /// New Relic API Key authentication (apiKey, accountId, region).
  final NewRelicApiKeyConfig? apiKey;

  NewRelicServiceAuthorizationConfig({
    this.apiKey,
  });

  Map<String, dynamic> toJson() {
    final apiKey = this.apiKey;
    return {
      if (apiKey != null) 'apiKey': apiKey,
    };
  }
}

/// API key authentication configuration for New Relic service.
///
/// @nodoc
class NewRelicApiKeyConfig {
  /// New Relic Account ID
  final String accountId;

  /// New Relic User API Key
  final String apiKey;

  /// New Relic region (US or EU)
  final NewRelicRegion region;

  /// List of alert policy IDs grouping related conditions
  final List<String>? alertPolicyIds;

  /// List of monitored APM application IDs in New Relic
  final List<String>? applicationIds;

  /// List of globally unique IDs for New Relic resources (apps, hosts, services)
  final List<String>? entityGuids;

  NewRelicApiKeyConfig({
    required this.accountId,
    required this.apiKey,
    required this.region,
    this.alertPolicyIds,
    this.applicationIds,
    this.entityGuids,
  });

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final apiKey = this.apiKey;
    final region = this.region;
    final alertPolicyIds = this.alertPolicyIds;
    final applicationIds = this.applicationIds;
    final entityGuids = this.entityGuids;
    return {
      'accountId': accountId,
      'apiKey': apiKey,
      'region': region.value,
      if (alertPolicyIds != null) 'alertPolicyIds': alertPolicyIds,
      if (applicationIds != null) 'applicationIds': applicationIds,
      if (entityGuids != null) 'entityGuids': entityGuids,
    };
  }
}

/// Authorization configuration for Datadog MCP server (uses authorization
/// discovery only).
///
/// @nodoc
class DatadogAuthorizationConfig {
  /// Datadog MCP server authorization discovery configuration.
  final MCPServerAuthorizationDiscoveryConfig? authorizationDiscovery;

  DatadogAuthorizationConfig({
    this.authorizationDiscovery,
  });

  Map<String, dynamic> toJson() {
    final authorizationDiscovery = this.authorizationDiscovery;
    return {
      if (authorizationDiscovery != null)
        'authorizationDiscovery': authorizationDiscovery,
    };
  }
}

/// Authorization configuration options for ServiceNow service.
///
/// @nodoc
class ServiceNowServiceAuthorizationConfig {
  /// OAuth client credentials configuration.
  final ServiceNowOAuthClientCredentialsConfig? oAuthClientCredentials;

  ServiceNowServiceAuthorizationConfig({
    this.oAuthClientCredentials,
  });

  Map<String, dynamic> toJson() {
    final oAuthClientCredentials = this.oAuthClientCredentials;
    return {
      if (oAuthClientCredentials != null)
        'oAuthClientCredentials': oAuthClientCredentials,
    };
  }
}

/// OAuth client credentials configuration for ServiceNow.
///
/// @nodoc
class ServiceNowOAuthClientCredentialsConfig {
  /// OAuth client ID for authenticating with the service.
  final String clientId;

  /// OAuth client secret for authenticating with the service.
  final String clientSecret;

  /// User friendly OAuth client name specified by end user.
  final String? clientName;

  /// OAuth token exchange parameters for authenticating with the service.
  final Map<String, String>? exchangeParameters;

  ServiceNowOAuthClientCredentialsConfig({
    required this.clientId,
    required this.clientSecret,
    this.clientName,
    this.exchangeParameters,
  });

  Map<String, dynamic> toJson() {
    final clientId = this.clientId;
    final clientSecret = this.clientSecret;
    final clientName = this.clientName;
    final exchangeParameters = this.exchangeParameters;
    return {
      'clientId': clientId,
      'clientSecret': clientSecret,
      if (clientName != null) 'clientName': clientName,
      if (exchangeParameters != null) 'exchangeParameters': exchangeParameters,
    };
  }
}

/// Authorization configuration options for Dynatrace service.
///
/// @nodoc
class DynatraceServiceAuthorizationConfig {
  /// OAuth client credentials configuration.
  final DynatraceOAuthClientCredentialsConfig? oAuthClientCredentials;

  DynatraceServiceAuthorizationConfig({
    this.oAuthClientCredentials,
  });

  Map<String, dynamic> toJson() {
    final oAuthClientCredentials = this.oAuthClientCredentials;
    return {
      if (oAuthClientCredentials != null)
        'oAuthClientCredentials': oAuthClientCredentials,
    };
  }
}

/// OAuth client credentials configuration for Dynatrace.
///
/// @nodoc
class DynatraceOAuthClientCredentialsConfig {
  /// OAuth client ID for authenticating with the service.
  final String clientId;

  /// OAuth client secret for authenticating with the service.
  final String clientSecret;

  /// User friendly OAuth client name specified by end user.
  final String? clientName;

  /// OAuth token exchange parameters for authenticating with the service.
  final Map<String, String>? exchangeParameters;

  DynatraceOAuthClientCredentialsConfig({
    required this.clientId,
    required this.clientSecret,
    this.clientName,
    this.exchangeParameters,
  });

  Map<String, dynamic> toJson() {
    final clientId = this.clientId;
    final clientSecret = this.clientSecret;
    final clientName = this.clientName;
    final exchangeParameters = this.exchangeParameters;
    return {
      'clientId': clientId,
      'clientSecret': clientSecret,
      if (clientName != null) 'clientName': clientName,
      if (exchangeParameters != null) 'exchangeParameters': exchangeParameters,
    };
  }
}

/// The type of Private Connection.
///
/// @nodoc
class PrivateConnectionType {
  static const selfManaged = PrivateConnectionType._('SELF_MANAGED');
  static const serviceManaged = PrivateConnectionType._('SERVICE_MANAGED');

  final String value;

  const PrivateConnectionType._(this.value);

  static const values = [selfManaged, serviceManaged];

  static PrivateConnectionType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PrivateConnectionType._(value));

  @override
  bool operator ==(other) =>
      other is PrivateConnectionType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Status of a Private Connection.
///
/// @nodoc
class PrivateConnectionStatus {
  static const active = PrivateConnectionStatus._('ACTIVE');
  static const createInProgress =
      PrivateConnectionStatus._('CREATE_IN_PROGRESS');
  static const createFailed = PrivateConnectionStatus._('CREATE_FAILED');
  static const deleteInProgress =
      PrivateConnectionStatus._('DELETE_IN_PROGRESS');
  static const deleteFailed = PrivateConnectionStatus._('DELETE_FAILED');

  final String value;

  const PrivateConnectionStatus._(this.value);

  static const values = [
    active,
    createInProgress,
    createFailed,
    deleteInProgress,
    deleteFailed
  ];

  static PrivateConnectionStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PrivateConnectionStatus._(value));

  @override
  bool operator ==(other) =>
      other is PrivateConnectionStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Summary of a Private Connection.
///
/// @nodoc
class PrivateConnectionSummary {
  /// The name of the Private Connection.
  final String name;

  /// The status of the Private Connection.
  final PrivateConnectionStatus status;

  /// The type of the Private Connection.
  final PrivateConnectionType type;

  /// The expiry time of the certificate associated with the Private Connection.
  /// Only present when a certificate is associated.
  final DateTime? certificateExpiryTime;

  /// IP address or DNS name of the target resource. Only present for
  /// service-managed Private Connections.
  final String? hostAddress;

  /// The Resource Configuration ARN. Only present for self-managed Private
  /// Connections.
  final String? resourceConfigurationId;

  /// The service-managed Resource Gateway ARN. Only present for service-managed
  /// Private Connections.
  final String? resourceGatewayId;

  /// VPC identifier of the service-managed Resource Gateway. Only present for
  /// service-managed Private Connections.
  final String? vpcId;

  PrivateConnectionSummary({
    required this.name,
    required this.status,
    required this.type,
    this.certificateExpiryTime,
    this.hostAddress,
    this.resourceConfigurationId,
    this.resourceGatewayId,
    this.vpcId,
  });

  factory PrivateConnectionSummary.fromJson(Map<String, dynamic> json) {
    return PrivateConnectionSummary(
      name: (json['name'] as String?) ?? '',
      status:
          PrivateConnectionStatus.fromString((json['status'] as String?) ?? ''),
      type: PrivateConnectionType.fromString((json['type'] as String?) ?? ''),
      certificateExpiryTime: timeStampFromJson(json['certificateExpiryTime']),
      hostAddress: json['hostAddress'] as String?,
      resourceConfigurationId: json['resourceConfigurationId'] as String?,
      resourceGatewayId: json['resourceGatewayId'] as String?,
      vpcId: json['vpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final status = this.status;
    final type = this.type;
    final certificateExpiryTime = this.certificateExpiryTime;
    final hostAddress = this.hostAddress;
    final resourceConfigurationId = this.resourceConfigurationId;
    final resourceGatewayId = this.resourceGatewayId;
    final vpcId = this.vpcId;
    return {
      'name': name,
      'status': status.value,
      'type': type.value,
      if (certificateExpiryTime != null)
        'certificateExpiryTime': iso8601ToJson(certificateExpiryTime),
      if (hostAddress != null) 'hostAddress': hostAddress,
      if (resourceConfigurationId != null)
        'resourceConfigurationId': resourceConfigurationId,
      if (resourceGatewayId != null) 'resourceGatewayId': resourceGatewayId,
      if (vpcId != null) 'vpcId': vpcId,
    };
  }
}

/// Private Connection mode — either service-managed or self-managed.
///
/// @nodoc
class PrivateConnectionMode {
  /// Caller manages their own resource configuration.
  final SelfManagedInput? selfManaged;

  /// Service manages the Resource Gateway lifecycle.
  final ServiceManagedInput? serviceManaged;

  PrivateConnectionMode({
    this.selfManaged,
    this.serviceManaged,
  });

  Map<String, dynamic> toJson() {
    final selfManaged = this.selfManaged;
    final serviceManaged = this.serviceManaged;
    return {
      if (selfManaged != null) 'selfManaged': selfManaged,
      if (serviceManaged != null) 'serviceManaged': serviceManaged,
    };
  }
}

/// Configuration for a service-managed Private Connection.
///
/// @nodoc
class ServiceManagedInput {
  /// IP address or DNS name of the target resource.
  final String hostAddress;

  /// Subnets that the service-managed Resource Gateway will span.
  final List<String> subnetIds;

  /// VPC to create the service-managed Resource Gateway in.
  final String vpcId;

  /// Certificate for the Private Connection.
  final String? certificate;

  /// IP address type of the service-managed Resource Gateway.
  final IpAddressType? ipAddressType;

  /// Number of IPv4 addresses in each ENI for the service-managed Resource
  /// Gateway.
  final int? ipv4AddressesPerEni;

  /// TCP port ranges that a consumer can use to access the resource.
  final List<String>? portRanges;

  /// Security groups to attach to the service-managed Resource Gateway. If not
  /// specified, a default security group is created.
  final List<String>? securityGroupIds;

  ServiceManagedInput({
    required this.hostAddress,
    required this.subnetIds,
    required this.vpcId,
    this.certificate,
    this.ipAddressType,
    this.ipv4AddressesPerEni,
    this.portRanges,
    this.securityGroupIds,
  });

  Map<String, dynamic> toJson() {
    final hostAddress = this.hostAddress;
    final subnetIds = this.subnetIds;
    final vpcId = this.vpcId;
    final certificate = this.certificate;
    final ipAddressType = this.ipAddressType;
    final ipv4AddressesPerEni = this.ipv4AddressesPerEni;
    final portRanges = this.portRanges;
    final securityGroupIds = this.securityGroupIds;
    return {
      'hostAddress': hostAddress,
      'subnetIds': subnetIds,
      'vpcId': vpcId,
      if (certificate != null) 'certificate': certificate,
      if (ipAddressType != null) 'ipAddressType': ipAddressType.value,
      if (ipv4AddressesPerEni != null)
        'ipv4AddressesPerEni': ipv4AddressesPerEni,
      if (portRanges != null) 'portRanges': portRanges,
      if (securityGroupIds != null) 'securityGroupIds': securityGroupIds,
    };
  }
}

/// Configuration for a self-managed Private Connection.
///
/// @nodoc
class SelfManagedInput {
  /// The ID or ARN of the resource configuration.
  final String resourceConfigurationId;

  /// Certificate for the Private Connection.
  final String? certificate;

  SelfManagedInput({
    required this.resourceConfigurationId,
    this.certificate,
  });

  Map<String, dynamic> toJson() {
    final resourceConfigurationId = this.resourceConfigurationId;
    final certificate = this.certificate;
    return {
      'resourceConfigurationId': resourceConfigurationId,
      if (certificate != null) 'certificate': certificate,
    };
  }
}

/// IP address type for a Resource Gateway.
///
/// @nodoc
class IpAddressType {
  static const ipv4 = IpAddressType._('IPV4');
  static const ipv6 = IpAddressType._('IPV6');
  static const dualStack = IpAddressType._('DUAL_STACK');

  final String value;

  const IpAddressType._(this.value);

  static const values = [ipv4, ipv6, dualStack];

  static IpAddressType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => IpAddressType._(value));

  @override
  bool operator ==(other) => other is IpAddressType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents a service association within an AgentSpace, defining how the
/// agent interacts with external services.
///
/// @nodoc
class Association {
  /// The unique identifier of the AgentSpace
  final String agentSpaceId;

  /// The unique identifier of the given association.
  final String associationId;

  /// The configuration that directs how AgentSpace interacts with the given
  /// service.
  final ServiceConfiguration configuration;

  /// The timestamp when the resource was created.
  final DateTime createdAt;

  /// The identifier for associated service
  final String serviceId;

  /// The timestamp when the resource was last updated.
  final DateTime updatedAt;

  /// Validation status
  final ValidationStatus? status;

  Association({
    required this.agentSpaceId,
    required this.associationId,
    required this.configuration,
    required this.createdAt,
    required this.serviceId,
    required this.updatedAt,
    this.status,
  });

  factory Association.fromJson(Map<String, dynamic> json) {
    return Association(
      agentSpaceId: (json['agentSpaceId'] as String?) ?? '',
      associationId: (json['associationId'] as String?) ?? '',
      configuration: ServiceConfiguration.fromJson(
          (json['configuration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      serviceId: (json['serviceId'] as String?) ?? '',
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      status: (json['status'] as String?)?.let(ValidationStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final agentSpaceId = this.agentSpaceId;
    final associationId = this.associationId;
    final configuration = this.configuration;
    final createdAt = this.createdAt;
    final serviceId = this.serviceId;
    final updatedAt = this.updatedAt;
    final status = this.status;
    return {
      'agentSpaceId': agentSpaceId,
      'associationId': associationId,
      'configuration': configuration,
      'createdAt': iso8601ToJson(createdAt),
      'serviceId': serviceId,
      'updatedAt': iso8601ToJson(updatedAt),
      if (status != null) 'status': status.value,
    };
  }
}

/// Represents the validation state of an association.
///
/// @nodoc
class ValidationStatus {
  static const valid = ValidationStatus._('valid');
  static const invalid = ValidationStatus._('invalid');
  static const pendingConfirmation = ValidationStatus._('pending-confirmation');

  final String value;

  const ValidationStatus._(this.value);

  static const values = [valid, invalid, pendingConfirmation];

  static ValidationStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ValidationStatus._(value));

  @override
  bool operator ==(other) => other is ValidationStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Union of all supported service configuration types. Each service has its own
/// specific configuration structure.
///
/// @nodoc
class ServiceConfiguration {
  /// AWS monitor account configuration.
  final AWSConfiguration? aws;

  /// Azure subscription integration configuration.
  final AzureConfiguration? azure;

  /// Azure DevOps project integration configuration.
  final AzureDevOpsConfiguration? azuredevops;

  /// Dynatrace monitoring integration configuration.
  final DynatraceConfiguration? dynatrace;

  /// Event Channel instance integration configuration.
  final EventChannelConfiguration? eventChannel;

  /// GitHub repository integration configuration.
  final GitHubConfiguration? github;

  /// GitLab project integration configuration.
  final GitLabConfiguration? gitlab;

  /// MCP (Model Context Protocol) server integration configuration.
  final MCPServerConfiguration? mcpserver;

  /// Datadog MCP server integration configuration.
  final MCPServerDatadogConfiguration? mcpserverdatadog;

  /// Grafana MCP server integration configuration.
  final MCPServerGrafanaConfiguration? mcpservergrafana;

  /// NewRelic instance integration configuration.
  final MCPServerNewRelicConfiguration? mcpservernewrelic;

  /// SigV4-authenticated MCP server integration configuration.
  final MCPServerSigV4Configuration? mcpserversigv4;

  /// Splunk MCP server integration configuration.
  final MCPServerSplunkConfiguration? mcpserversplunk;

  /// PagerDuty integration configuration
  final PagerDutyConfiguration? pagerduty;

  /// ServiceNow instance integration configuration.
  final ServiceNowConfiguration? servicenow;

  /// Slack workspace integration configuration.
  final SlackConfiguration? slack;

  /// AWS source account configuration for monitoring resources.
  final SourceAwsConfiguration? sourceAws;

  ServiceConfiguration({
    this.aws,
    this.azure,
    this.azuredevops,
    this.dynatrace,
    this.eventChannel,
    this.github,
    this.gitlab,
    this.mcpserver,
    this.mcpserverdatadog,
    this.mcpservergrafana,
    this.mcpservernewrelic,
    this.mcpserversigv4,
    this.mcpserversplunk,
    this.pagerduty,
    this.servicenow,
    this.slack,
    this.sourceAws,
  });

  factory ServiceConfiguration.fromJson(Map<String, dynamic> json) {
    return ServiceConfiguration(
      aws: json['aws'] != null
          ? AWSConfiguration.fromJson(json['aws'] as Map<String, dynamic>)
          : null,
      azure: json['azure'] != null
          ? AzureConfiguration.fromJson(json['azure'] as Map<String, dynamic>)
          : null,
      azuredevops: json['azuredevops'] != null
          ? AzureDevOpsConfiguration.fromJson(
              json['azuredevops'] as Map<String, dynamic>)
          : null,
      dynatrace: json['dynatrace'] != null
          ? DynatraceConfiguration.fromJson(
              json['dynatrace'] as Map<String, dynamic>)
          : null,
      eventChannel: json['eventChannel'] != null
          ? EventChannelConfiguration.fromJson(
              json['eventChannel'] as Map<String, dynamic>)
          : null,
      github: json['github'] != null
          ? GitHubConfiguration.fromJson(json['github'] as Map<String, dynamic>)
          : null,
      gitlab: json['gitlab'] != null
          ? GitLabConfiguration.fromJson(json['gitlab'] as Map<String, dynamic>)
          : null,
      mcpserver: json['mcpserver'] != null
          ? MCPServerConfiguration.fromJson(
              json['mcpserver'] as Map<String, dynamic>)
          : null,
      mcpserverdatadog: json['mcpserverdatadog'] != null
          ? MCPServerDatadogConfiguration.fromJson(
              json['mcpserverdatadog'] as Map<String, dynamic>)
          : null,
      mcpservergrafana: json['mcpservergrafana'] != null
          ? MCPServerGrafanaConfiguration.fromJson(
              json['mcpservergrafana'] as Map<String, dynamic>)
          : null,
      mcpservernewrelic: json['mcpservernewrelic'] != null
          ? MCPServerNewRelicConfiguration.fromJson(
              json['mcpservernewrelic'] as Map<String, dynamic>)
          : null,
      mcpserversigv4: json['mcpserversigv4'] != null
          ? MCPServerSigV4Configuration.fromJson(
              json['mcpserversigv4'] as Map<String, dynamic>)
          : null,
      mcpserversplunk: json['mcpserversplunk'] != null
          ? MCPServerSplunkConfiguration.fromJson(
              json['mcpserversplunk'] as Map<String, dynamic>)
          : null,
      pagerduty: json['pagerduty'] != null
          ? PagerDutyConfiguration.fromJson(
              json['pagerduty'] as Map<String, dynamic>)
          : null,
      servicenow: json['servicenow'] != null
          ? ServiceNowConfiguration.fromJson(
              json['servicenow'] as Map<String, dynamic>)
          : null,
      slack: json['slack'] != null
          ? SlackConfiguration.fromJson(json['slack'] as Map<String, dynamic>)
          : null,
      sourceAws: json['sourceAws'] != null
          ? SourceAwsConfiguration.fromJson(
              json['sourceAws'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final aws = this.aws;
    final azure = this.azure;
    final azuredevops = this.azuredevops;
    final dynatrace = this.dynatrace;
    final eventChannel = this.eventChannel;
    final github = this.github;
    final gitlab = this.gitlab;
    final mcpserver = this.mcpserver;
    final mcpserverdatadog = this.mcpserverdatadog;
    final mcpservergrafana = this.mcpservergrafana;
    final mcpservernewrelic = this.mcpservernewrelic;
    final mcpserversigv4 = this.mcpserversigv4;
    final mcpserversplunk = this.mcpserversplunk;
    final pagerduty = this.pagerduty;
    final servicenow = this.servicenow;
    final slack = this.slack;
    final sourceAws = this.sourceAws;
    return {
      if (aws != null) 'aws': aws,
      if (azure != null) 'azure': azure,
      if (azuredevops != null) 'azuredevops': azuredevops,
      if (dynatrace != null) 'dynatrace': dynatrace,
      if (eventChannel != null) 'eventChannel': eventChannel,
      if (github != null) 'github': github,
      if (gitlab != null) 'gitlab': gitlab,
      if (mcpserver != null) 'mcpserver': mcpserver,
      if (mcpserverdatadog != null) 'mcpserverdatadog': mcpserverdatadog,
      if (mcpservergrafana != null) 'mcpservergrafana': mcpservergrafana,
      if (mcpservernewrelic != null) 'mcpservernewrelic': mcpservernewrelic,
      if (mcpserversigv4 != null) 'mcpserversigv4': mcpserversigv4,
      if (mcpserversplunk != null) 'mcpserversplunk': mcpserversplunk,
      if (pagerduty != null) 'pagerduty': pagerduty,
      if (servicenow != null) 'servicenow': servicenow,
      if (slack != null) 'slack': slack,
      if (sourceAws != null) 'sourceAws': sourceAws,
    };
  }
}

/// Configuration for AWS source account integration. Note: passRole check on
/// 'assumableRoleArn' is not supported.
///
/// @nodoc
class SourceAwsConfiguration {
  /// AWS Account Id corresponding to provided resources.
  final String accountId;

  /// Account Type 'source' for AIDevOps monitoring.
  final SourceAccountType accountType;

  /// Role ARN to be assumed by AIDevOps to operate on behalf of customer.
  final String assumableRoleArn;

  /// External ID for additional security when assuming the role. Used to prevent
  /// the confused deputy problem.
  final String? externalId;

  SourceAwsConfiguration({
    required this.accountId,
    required this.accountType,
    required this.assumableRoleArn,
    this.externalId,
  });

  factory SourceAwsConfiguration.fromJson(Map<String, dynamic> json) {
    return SourceAwsConfiguration(
      accountId: (json['accountId'] as String?) ?? '',
      accountType:
          SourceAccountType.fromString((json['accountType'] as String?) ?? ''),
      assumableRoleArn: (json['assumableRoleArn'] as String?) ?? '',
      externalId: json['externalId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final accountType = this.accountType;
    final assumableRoleArn = this.assumableRoleArn;
    final externalId = this.externalId;
    return {
      'accountId': accountId,
      'accountType': accountType.value,
      'assumableRoleArn': assumableRoleArn,
      if (externalId != null) 'externalId': externalId,
    };
  }
}

/// Configuration for AWS monitor account integration, allowing AIDevOps to
/// monitor AWS resources.
///
/// @nodoc
class AWSConfiguration {
  /// AWS Account Id corresponding to provided resources.
  final String accountId;

  /// Account Type 'monitor' for AIDevOps monitoring.
  final MonitorAccountType accountType;

  /// Role ARN to be assumed by AIDevOps to operate on behalf of customer.
  final String assumableRoleArn;

  AWSConfiguration({
    required this.accountId,
    required this.accountType,
    required this.assumableRoleArn,
  });

  factory AWSConfiguration.fromJson(Map<String, dynamic> json) {
    return AWSConfiguration(
      accountId: (json['accountId'] as String?) ?? '',
      accountType:
          MonitorAccountType.fromString((json['accountType'] as String?) ?? ''),
      assumableRoleArn: (json['assumableRoleArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final accountType = this.accountType;
    final assumableRoleArn = this.assumableRoleArn;
    return {
      'accountId': accountId,
      'accountType': accountType.value,
      'assumableRoleArn': assumableRoleArn,
    };
  }
}

/// Configuration for GitHub repository integration.
///
/// @nodoc
class GitHubConfiguration {
  /// The GitHub repository owner name.
  final String owner;
  final GithubRepoOwnerType ownerType;

  /// Associated Github repo ID
  final String repoId;

  /// Associated Github repo name
  final String repoName;

  /// GitHub instance identifier (e.g., github.com or github.enterprise.com)
  final String? instanceIdentifier;

  GitHubConfiguration({
    required this.owner,
    required this.ownerType,
    required this.repoId,
    required this.repoName,
    this.instanceIdentifier,
  });

  factory GitHubConfiguration.fromJson(Map<String, dynamic> json) {
    return GitHubConfiguration(
      owner: (json['owner'] as String?) ?? '',
      ownerType:
          GithubRepoOwnerType.fromString((json['ownerType'] as String?) ?? ''),
      repoId: (json['repoId'] as String?) ?? '',
      repoName: (json['repoName'] as String?) ?? '',
      instanceIdentifier: json['instanceIdentifier'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final owner = this.owner;
    final ownerType = this.ownerType;
    final repoId = this.repoId;
    final repoName = this.repoName;
    final instanceIdentifier = this.instanceIdentifier;
    return {
      'owner': owner,
      'ownerType': ownerType.value,
      'repoId': repoId,
      'repoName': repoName,
      if (instanceIdentifier != null) 'instanceIdentifier': instanceIdentifier,
    };
  }
}

/// Configuration for Slack workspace integration.
///
/// @nodoc
class SlackConfiguration {
  /// Transmission targets for agent notifications
  final SlackTransmissionTarget transmissionTarget;

  /// Associated Slack workspace ID
  final String workspaceId;

  /// Associated Slack workspace name
  final String workspaceName;

  SlackConfiguration({
    required this.transmissionTarget,
    required this.workspaceId,
    required this.workspaceName,
  });

  factory SlackConfiguration.fromJson(Map<String, dynamic> json) {
    return SlackConfiguration(
      transmissionTarget: SlackTransmissionTarget.fromJson(
          (json['transmissionTarget'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      workspaceId: (json['workspaceId'] as String?) ?? '',
      workspaceName: (json['workspaceName'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final transmissionTarget = this.transmissionTarget;
    final workspaceId = this.workspaceId;
    final workspaceName = this.workspaceName;
    return {
      'transmissionTarget': transmissionTarget,
      'workspaceId': workspaceId,
      'workspaceName': workspaceName,
    };
  }
}

/// Configuration for Dynatrace monitoring integration.
///
/// @nodoc
class DynatraceConfiguration {
  /// Dynatrace environment id
  final String envId;

  /// List of Dynatrace resources to monitor
  final List<String>? resources;

  DynatraceConfiguration({
    required this.envId,
    this.resources,
  });

  factory DynatraceConfiguration.fromJson(Map<String, dynamic> json) {
    return DynatraceConfiguration(
      envId: (json['envId'] as String?) ?? '',
      resources: (json['resources'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final envId = this.envId;
    final resources = this.resources;
    return {
      'envId': envId,
      if (resources != null) 'resources': resources,
    };
  }
}

/// Configuration for ServiceNow instance integration.
///
/// @nodoc
class ServiceNowConfiguration {
  /// Scoped down authentication scopes for fine grained control
  final List<String>? authScopes;

  /// ServiceNow instance ID
  final String? instanceId;

  ServiceNowConfiguration({
    this.authScopes,
    this.instanceId,
  });

  factory ServiceNowConfiguration.fromJson(Map<String, dynamic> json) {
    return ServiceNowConfiguration(
      authScopes: (json['authScopes'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      instanceId: json['instanceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final authScopes = this.authScopes;
    final instanceId = this.instanceId;
    return {
      if (authScopes != null) 'authScopes': authScopes,
      if (instanceId != null) 'instanceId': instanceId,
    };
  }
}

/// Mixin for webhook update support.
///
/// @nodoc
class MCPServerNewRelicConfiguration {
  /// New Relic Account ID
  final String accountId;

  /// MCP server endpoint URL (e.g., https://mcp.newrelic.com/mcp/)
  final String endpoint;

  MCPServerNewRelicConfiguration({
    required this.accountId,
    required this.endpoint,
  });

  factory MCPServerNewRelicConfiguration.fromJson(Map<String, dynamic> json) {
    return MCPServerNewRelicConfiguration(
      accountId: (json['accountId'] as String?) ?? '',
      endpoint: (json['endpoint'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final endpoint = this.endpoint;
    return {
      'accountId': accountId,
      'endpoint': endpoint,
    };
  }
}

/// Mixin for webhook update support.
///
/// @nodoc
class MCPServerDatadogConfiguration {
  MCPServerDatadogConfiguration();

  factory MCPServerDatadogConfiguration.fromJson(Map<String, dynamic> _) {
    return MCPServerDatadogConfiguration();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Configuration for Model Context Protocol (MCP) server integration.
///
/// @nodoc
class MCPServerConfiguration {
  /// List of MCP tools can be used with the association.
  final List<String> tools;

  MCPServerConfiguration({
    required this.tools,
  });

  factory MCPServerConfiguration.fromJson(Map<String, dynamic> json) {
    return MCPServerConfiguration(
      tools: ((json['tools'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final tools = this.tools;
    return {
      'tools': tools,
    };
  }
}

/// Configuration for GitLab project integration.
///
/// @nodoc
class GitLabConfiguration {
  /// GitLab numeric project ID.
  final String projectId;

  /// Full GitLab project path (e.g., namespace/project-name).
  final String projectPath;

  /// GitLab instance identifier (e.g., gitlab.com or
  /// e2e.gamma.dev.us-east-1.gitlab.falco.ai.aws.dev)
  final String? instanceIdentifier;

  GitLabConfiguration({
    required this.projectId,
    required this.projectPath,
    this.instanceIdentifier,
  });

  factory GitLabConfiguration.fromJson(Map<String, dynamic> json) {
    return GitLabConfiguration(
      projectId: (json['projectId'] as String?) ?? '',
      projectPath: (json['projectPath'] as String?) ?? '',
      instanceIdentifier: json['instanceIdentifier'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final projectId = this.projectId;
    final projectPath = this.projectPath;
    final instanceIdentifier = this.instanceIdentifier;
    return {
      'projectId': projectId,
      'projectPath': projectPath,
      if (instanceIdentifier != null) 'instanceIdentifier': instanceIdentifier,
    };
  }
}

/// Mixin for webhook update support.
///
/// @nodoc
class MCPServerSplunkConfiguration {
  MCPServerSplunkConfiguration();

  factory MCPServerSplunkConfiguration.fromJson(Map<String, dynamic> _) {
    return MCPServerSplunkConfiguration();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Configuration for Event Channel integration.
///
/// @nodoc
class EventChannelConfiguration {
  EventChannelConfiguration();

  factory EventChannelConfiguration.fromJson(Map<String, dynamic> _) {
    return EventChannelConfiguration();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Configuration for Azure subscription integration.
///
/// @nodoc
class AzureConfiguration {
  /// Azure subscription ID corresponding to provided resources.
  final String subscriptionId;

  AzureConfiguration({
    required this.subscriptionId,
  });

  factory AzureConfiguration.fromJson(Map<String, dynamic> json) {
    return AzureConfiguration(
      subscriptionId: (json['subscriptionId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final subscriptionId = this.subscriptionId;
    return {
      'subscriptionId': subscriptionId,
    };
  }
}

/// Configuration for Azure DevOps project integration.
///
/// @nodoc
class AzureDevOpsConfiguration {
  /// Azure DevOps organization name.
  final String organizationName;

  /// Azure DevOps project ID.
  final String projectId;

  /// Azure DevOps project name.
  final String projectName;

  AzureDevOpsConfiguration({
    required this.organizationName,
    required this.projectId,
    required this.projectName,
  });

  factory AzureDevOpsConfiguration.fromJson(Map<String, dynamic> json) {
    return AzureDevOpsConfiguration(
      organizationName: (json['organizationName'] as String?) ?? '',
      projectId: (json['projectId'] as String?) ?? '',
      projectName: (json['projectName'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final organizationName = this.organizationName;
    final projectId = this.projectId;
    final projectName = this.projectName;
    return {
      'organizationName': organizationName,
      'projectId': projectId,
      'projectName': projectName,
    };
  }
}

/// Configuration for Grafana MCP server integration, used with an AWS-hosted
/// MCP server.
///
/// @nodoc
class MCPServerGrafanaConfiguration {
  /// Grafana instance URL (e.g., https://your-instance.grafana.net)
  final String endpoint;

  /// The Grafana organization ID that can be used.
  final String? organizationId;

  /// List of MCP tools that can be used.
  final List<String>? tools;

  MCPServerGrafanaConfiguration({
    required this.endpoint,
    this.organizationId,
    this.tools,
  });

  factory MCPServerGrafanaConfiguration.fromJson(Map<String, dynamic> json) {
    return MCPServerGrafanaConfiguration(
      endpoint: (json['endpoint'] as String?) ?? '',
      organizationId: json['organizationId'] as String?,
      tools:
          (json['tools'] as List?)?.nonNulls.map((e) => e as String).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final endpoint = this.endpoint;
    final organizationId = this.organizationId;
    final tools = this.tools;
    return {
      'endpoint': endpoint,
      if (organizationId != null) 'organizationId': organizationId,
      if (tools != null) 'tools': tools,
    };
  }
}

/// Configuration for Pagerduty integration.
///
/// @nodoc
class PagerDutyConfiguration {
  /// Email to be used in Pagerduty API header
  final String customerEmail;

  /// List of Pagerduty service available for the association.
  final List<String> services;

  PagerDutyConfiguration({
    required this.customerEmail,
    required this.services,
  });

  factory PagerDutyConfiguration.fromJson(Map<String, dynamic> json) {
    return PagerDutyConfiguration(
      customerEmail: (json['customerEmail'] as String?) ?? '',
      services: ((json['services'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final customerEmail = this.customerEmail;
    final services = this.services;
    return {
      'customerEmail': customerEmail,
      'services': services,
    };
  }
}

/// Configuration for SigV4-authenticated MCP server integration.
///
/// @nodoc
class MCPServerSigV4Configuration {
  /// List of MCP tools available for the association.
  final List<String> tools;

  MCPServerSigV4Configuration({
    required this.tools,
  });

  factory MCPServerSigV4Configuration.fromJson(Map<String, dynamic> json) {
    return MCPServerSigV4Configuration(
      tools: ((json['tools'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final tools = this.tools;
    return {
      'tools': tools,
    };
  }
}

/// Defines Slack channels for different types of agent notifications.
///
/// @nodoc
class SlackTransmissionTarget {
  /// Destination for On-call Agent (Ops1)
  final SlackChannel opsOncallTarget;

  /// Destination for SRE Agent (Ops1.5)
  final SlackChannel? opsSRETarget;

  SlackTransmissionTarget({
    required this.opsOncallTarget,
    this.opsSRETarget,
  });

  factory SlackTransmissionTarget.fromJson(Map<String, dynamic> json) {
    return SlackTransmissionTarget(
      opsOncallTarget: SlackChannel.fromJson(
          (json['opsOncallTarget'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      opsSRETarget: json['opsSRETarget'] != null
          ? SlackChannel.fromJson(json['opsSRETarget'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final opsOncallTarget = this.opsOncallTarget;
    final opsSRETarget = this.opsSRETarget;
    return {
      'opsOncallTarget': opsOncallTarget,
      if (opsSRETarget != null) 'opsSRETarget': opsSRETarget,
    };
  }
}

/// Represents a Slack channel with its ID and optional name.
///
/// @nodoc
class SlackChannel {
  /// Slack channel ID
  final String channelId;

  /// Slack channel name
  final String? channelName;

  SlackChannel({
    required this.channelId,
    this.channelName,
  });

  factory SlackChannel.fromJson(Map<String, dynamic> json) {
    return SlackChannel(
      channelId: (json['channelId'] as String?) ?? '',
      channelName: json['channelName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final channelId = this.channelId;
    final channelName = this.channelName;
    return {
      'channelId': channelId,
      if (channelName != null) 'channelName': channelName,
    };
  }
}

/// AWS association type for monitoring account.
///
/// @nodoc
class MonitorAccountType {
  static const monitor = MonitorAccountType._('monitor');

  final String value;

  const MonitorAccountType._(this.value);

  static const values = [monitor];

  static MonitorAccountType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MonitorAccountType._(value));

  @override
  bool operator ==(other) =>
      other is MonitorAccountType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// AWS association type for source account.
///
/// @nodoc
class SourceAccountType {
  static const source = SourceAccountType._('source');

  final String value;

  const SourceAccountType._(this.value);

  static const values = [source];

  static SourceAccountType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SourceAccountType._(value));

  @override
  bool operator ==(other) => other is SourceAccountType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents a complete Webhook with all its properties, and unique
/// identifier.
///
/// @nodoc
class Webhook {
  /// The unique identifier of the Webhook
  final String webhookId;

  /// Webhook endpoint URL.
  final String webhookUrl;

  /// Webhook authentication type.
  final WebhookType? webhookType;

  Webhook({
    required this.webhookId,
    required this.webhookUrl,
    this.webhookType,
  });

  factory Webhook.fromJson(Map<String, dynamic> json) {
    return Webhook(
      webhookId: (json['webhookId'] as String?) ?? '',
      webhookUrl: (json['webhookUrl'] as String?) ?? '',
      webhookType:
          (json['webhookType'] as String?)?.let(WebhookType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final webhookId = this.webhookId;
    final webhookUrl = this.webhookUrl;
    final webhookType = this.webhookType;
    return {
      'webhookId': webhookId,
      'webhookUrl': webhookUrl,
      if (webhookType != null) 'webhookType': webhookType.value,
    };
  }
}

/// Webhook authentication type.
///
/// @nodoc
class WebhookType {
  static const hmac = WebhookType._('hmac');
  static const apikey = WebhookType._('apikey');
  static const gitlab = WebhookType._('gitlab');
  static const pagerduty = WebhookType._('pagerduty');

  final String value;

  const WebhookType._(this.value);

  static const values = [hmac, apikey, gitlab, pagerduty];

  static WebhookType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => WebhookType._(value));

  @override
  bool operator ==(other) => other is WebhookType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Generic webhook configuration for services that support webhook
/// notifications.
///
/// @nodoc
class GenericWebhook {
  /// API Key for API Key webhook authentication
  final String? apiKey;

  /// The unique webhook identifier
  final String? webhookId;

  /// The webhook secret for authentication
  final String? webhookSecret;

  /// The webhook authentication type
  final WebhookType? webhookType;

  /// The webhook URL endpoint
  final String? webhookUrl;

  GenericWebhook({
    this.apiKey,
    this.webhookId,
    this.webhookSecret,
    this.webhookType,
    this.webhookUrl,
  });

  factory GenericWebhook.fromJson(Map<String, dynamic> json) {
    return GenericWebhook(
      apiKey: json['apiKey'] as String?,
      webhookId: json['webhookId'] as String?,
      webhookSecret: json['webhookSecret'] as String?,
      webhookType:
          (json['webhookType'] as String?)?.let(WebhookType.fromString),
      webhookUrl: json['webhookUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final apiKey = this.apiKey;
    final webhookId = this.webhookId;
    final webhookSecret = this.webhookSecret;
    final webhookType = this.webhookType;
    final webhookUrl = this.webhookUrl;
    return {
      if (apiKey != null) 'apiKey': apiKey,
      if (webhookId != null) 'webhookId': webhookId,
      if (webhookSecret != null) 'webhookSecret': webhookSecret,
      if (webhookType != null) 'webhookType': webhookType.value,
      if (webhookUrl != null) 'webhookUrl': webhookUrl,
    };
  }
}

/// Represents a complete AgentSpace with all its properties, timestamps,
/// encryption settings, and unique identifier.
///
/// @nodoc
class AgentSpace {
  /// The unique identifier of the AgentSpace
  final String agentSpaceId;

  /// The timestamp when the resource was created.
  final DateTime createdAt;

  /// The name of the AgentSpace.
  final String name;

  /// The timestamp when the resource was last updated.
  final DateTime updatedAt;

  /// The description of the AgentSpace.
  final String? description;

  /// The ARN of the AWS Key Management Service (AWS KMS) customer managed key
  /// that's used to encrypt resources.
  final String? kmsKeyArn;

  /// The locale for the AgentSpace, which determines the language used in agent
  /// responses.
  final String? locale;

  AgentSpace({
    required this.agentSpaceId,
    required this.createdAt,
    required this.name,
    required this.updatedAt,
    this.description,
    this.kmsKeyArn,
    this.locale,
  });

  factory AgentSpace.fromJson(Map<String, dynamic> json) {
    return AgentSpace(
      agentSpaceId: (json['agentSpaceId'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      name: (json['name'] as String?) ?? '',
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      description: json['description'] as String?,
      kmsKeyArn: json['kmsKeyArn'] as String?,
      locale: json['locale'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final agentSpaceId = this.agentSpaceId;
    final createdAt = this.createdAt;
    final name = this.name;
    final updatedAt = this.updatedAt;
    final description = this.description;
    final kmsKeyArn = this.kmsKeyArn;
    final locale = this.locale;
    return {
      'agentSpaceId': agentSpaceId,
      'createdAt': iso8601ToJson(createdAt),
      'name': name,
      'updatedAt': iso8601ToJson(updatedAt),
      if (description != null) 'description': description,
      if (kmsKeyArn != null) 'kmsKeyArn': kmsKeyArn,
      if (locale != null) 'locale': locale,
    };
  }
}

/// Configuration for external Identity Provider OIDC authentication flow for
/// the Operator App.
///
/// @nodoc
class IdpAuthConfiguration {
  /// The OIDC client ID for the IdP application
  final String clientId;

  /// The timestamp when the Operator App IdP auth flow was enabled.
  final DateTime createdAt;

  /// The OIDC issuer URL of the external Identity Provider
  final String issuerUrl;

  /// The IAM role end users assume to access AIDevOps APIs
  final String operatorAppRoleArn;

  /// The Identity Provider name (e.g., Entra, Okta, Google)
  final String provider;

  /// The timestamp when the Operator App IdP auth flow was updated.
  final DateTime? updatedAt;

  IdpAuthConfiguration({
    required this.clientId,
    required this.createdAt,
    required this.issuerUrl,
    required this.operatorAppRoleArn,
    required this.provider,
    this.updatedAt,
  });

  factory IdpAuthConfiguration.fromJson(Map<String, dynamic> json) {
    return IdpAuthConfiguration(
      clientId: (json['clientId'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      issuerUrl: (json['issuerUrl'] as String?) ?? '',
      operatorAppRoleArn: (json['operatorAppRoleArn'] as String?) ?? '',
      provider: (json['provider'] as String?) ?? '',
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final clientId = this.clientId;
    final createdAt = this.createdAt;
    final issuerUrl = this.issuerUrl;
    final operatorAppRoleArn = this.operatorAppRoleArn;
    final provider = this.provider;
    final updatedAt = this.updatedAt;
    return {
      'clientId': clientId,
      'createdAt': iso8601ToJson(createdAt),
      'issuerUrl': issuerUrl,
      'operatorAppRoleArn': operatorAppRoleArn,
      'provider': provider,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// Configuration for IAM-based authentication flow for the Operator App.
///
/// @nodoc
class IamAuthConfiguration {
  /// The timestamp when the Operator App IAM auth flow was enabled.
  final DateTime createdAt;

  /// The IAM role end users assume to access AIDevOps APIs
  final String operatorAppRoleArn;

  /// The timestamp when the Operator App IAM auth flow was updated.
  final DateTime? updatedAt;

  IamAuthConfiguration({
    required this.createdAt,
    required this.operatorAppRoleArn,
    this.updatedAt,
  });

  factory IamAuthConfiguration.fromJson(Map<String, dynamic> json) {
    return IamAuthConfiguration(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      operatorAppRoleArn: (json['operatorAppRoleArn'] as String?) ?? '',
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final operatorAppRoleArn = this.operatorAppRoleArn;
    final updatedAt = this.updatedAt;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'operatorAppRoleArn': operatorAppRoleArn,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// Configuration for AWS Identity Center (IdC) authentication flow for the
/// Operator App.
///
/// @nodoc
class IdcAuthConfiguration {
  /// The timestamp when the Operator App IdC auth flow was enabled.
  final DateTime createdAt;

  /// The IdC instance Arn used to create an IdC auth application
  final String idcInstanceArn;

  /// The IAM role end users assume to access AIDevOps APIs
  final String operatorAppRoleArn;

  /// The IdC application Arn created for IdC auth
  final String? idcApplicationArn;

  /// The timestamp when the Operator App IdC auth flow was updated.
  final DateTime? updatedAt;

  IdcAuthConfiguration({
    required this.createdAt,
    required this.idcInstanceArn,
    required this.operatorAppRoleArn,
    this.idcApplicationArn,
    this.updatedAt,
  });

  factory IdcAuthConfiguration.fromJson(Map<String, dynamic> json) {
    return IdcAuthConfiguration(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      idcInstanceArn: (json['idcInstanceArn'] as String?) ?? '',
      operatorAppRoleArn: (json['operatorAppRoleArn'] as String?) ?? '',
      idcApplicationArn: json['idcApplicationArn'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final idcInstanceArn = this.idcInstanceArn;
    final operatorAppRoleArn = this.operatorAppRoleArn;
    final idcApplicationArn = this.idcApplicationArn;
    final updatedAt = this.updatedAt;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'idcInstanceArn': idcInstanceArn,
      'operatorAppRoleArn': operatorAppRoleArn,
      if (idcApplicationArn != null) 'idcApplicationArn': idcApplicationArn,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// Authentication flow type for operator app.
///
/// @nodoc
class AuthFlow {
  static const iam = AuthFlow._('iam');
  static const idc = AuthFlow._('idc');
  static const idp = AuthFlow._('idp');

  final String value;

  const AuthFlow._(this.value);

  static const values = [iam, idc, idp];

  static AuthFlow fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => AuthFlow._(value));

  @override
  bool operator ==(other) => other is AuthFlow && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents a recommendation with all its properties and metadata
///
/// @nodoc
class Recommendation {
  /// ARN of the agent space this recommendation belongs to
  final String agentSpaceArn;

  /// Content of the recommendation
  final RecommendationContent content;

  /// Timestamp when this recommendation was created
  final DateTime createdAt;

  /// Priority level of the recommendation
  final RecommendationPriority priority;

  /// The unique identifier for this recommendation
  final String recommendationId;

  /// Current status of the recommendation
  final RecommendationStatus status;

  /// ID of the task that generated the recommendation
  final String taskId;

  /// The title of the recommendation
  final String title;

  /// Timestamp when this recommendation was last updated
  final DateTime updatedAt;

  /// Version number for optimistic locking
  final int version;

  /// Additional context for recommendation
  final String? additionalContext;

  /// ID of the goal this recommendation is associated with
  final String? goalId;

  /// Version of the goal at the time this recommendation was generated
  final int? goalVersion;

  /// Position in ranked list (1 = highest priority)
  final int? rankPosition;

  /// Timestamp when the recommendation was last ranked
  final DateTime? rankedAt;

  Recommendation({
    required this.agentSpaceArn,
    required this.content,
    required this.createdAt,
    required this.priority,
    required this.recommendationId,
    required this.status,
    required this.taskId,
    required this.title,
    required this.updatedAt,
    required this.version,
    this.additionalContext,
    this.goalId,
    this.goalVersion,
    this.rankPosition,
    this.rankedAt,
  });

  factory Recommendation.fromJson(Map<String, dynamic> json) {
    return Recommendation(
      agentSpaceArn: (json['agentSpaceArn'] as String?) ?? '',
      content: RecommendationContent.fromJson(
          (json['content'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      priority: RecommendationPriority.fromString(
          (json['priority'] as String?) ?? ''),
      recommendationId: (json['recommendationId'] as String?) ?? '',
      status:
          RecommendationStatus.fromString((json['status'] as String?) ?? ''),
      taskId: (json['taskId'] as String?) ?? '',
      title: (json['title'] as String?) ?? '',
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      version: (json['version'] as int?) ?? 0,
      additionalContext: json['additionalContext'] as String?,
      goalId: json['goalId'] as String?,
      goalVersion: json['goalVersion'] as int?,
      rankPosition: json['rankPosition'] as int?,
      rankedAt: timeStampFromJson(json['rankedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final agentSpaceArn = this.agentSpaceArn;
    final content = this.content;
    final createdAt = this.createdAt;
    final priority = this.priority;
    final recommendationId = this.recommendationId;
    final status = this.status;
    final taskId = this.taskId;
    final title = this.title;
    final updatedAt = this.updatedAt;
    final version = this.version;
    final additionalContext = this.additionalContext;
    final goalId = this.goalId;
    final goalVersion = this.goalVersion;
    final rankPosition = this.rankPosition;
    final rankedAt = this.rankedAt;
    return {
      'agentSpaceArn': agentSpaceArn,
      'content': content,
      'createdAt': iso8601ToJson(createdAt),
      'priority': priority.value,
      'recommendationId': recommendationId,
      'status': status.value,
      'taskId': taskId,
      'title': title,
      'updatedAt': iso8601ToJson(updatedAt),
      'version': version,
      if (additionalContext != null) 'additionalContext': additionalContext,
      if (goalId != null) 'goalId': goalId,
      if (goalVersion != null) 'goalVersion': goalVersion,
      if (rankPosition != null) 'rankPosition': rankPosition,
      if (rankedAt != null) 'rankedAt': iso8601ToJson(rankedAt),
    };
  }
}

/// Content of a recommendation
///
/// @nodoc
class RecommendationContent {
  /// A brief summary of the recommendation.
  final String summary;

  /// Agent-ready specification with detailed implementation steps
  final String? spec;

  RecommendationContent({
    required this.summary,
    this.spec,
  });

  factory RecommendationContent.fromJson(Map<String, dynamic> json) {
    return RecommendationContent(
      summary: (json['summary'] as String?) ?? '',
      spec: json['spec'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final summary = this.summary;
    final spec = this.spec;
    return {
      'summary': summary,
      if (spec != null) 'spec': spec,
    };
  }
}

/// Status of a recommendation
///
/// @nodoc
class RecommendationStatus {
  static const proposed = RecommendationStatus._('PROPOSED');
  static const accepted = RecommendationStatus._('ACCEPTED');
  static const rejected = RecommendationStatus._('REJECTED');
  static const closed = RecommendationStatus._('CLOSED');
  static const completed = RecommendationStatus._('COMPLETED');
  static const updateInProgress = RecommendationStatus._('UPDATE_IN_PROGRESS');

  final String value;

  const RecommendationStatus._(this.value);

  static const values = [
    proposed,
    accepted,
    rejected,
    closed,
    completed,
    updateInProgress
  ];

  static RecommendationStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RecommendationStatus._(value));

  @override
  bool operator ==(other) =>
      other is RecommendationStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Priority level of a recommendation
///
/// @nodoc
class RecommendationPriority {
  static const high = RecommendationPriority._('HIGH');
  static const medium = RecommendationPriority._('MEDIUM');
  static const low = RecommendationPriority._('LOW');

  final String value;

  const RecommendationPriority._(this.value);

  static const values = [high, medium, low];

  static RecommendationPriority fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RecommendationPriority._(value));

  @override
  bool operator ==(other) =>
      other is RecommendationPriority && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents a goal with all its properties and metadata
///
/// @nodoc
class Goal {
  /// The unique identifier for the agent space containing this goal
  final String agentSpaceArn;

  /// Content of the goal
  final GoalContent content;

  /// Timestamp when this goal was created
  final DateTime createdAt;

  /// The unique identifier for this goal
  final String goalId;

  /// Type of goal based on its origin
  final GoalType goalType;

  /// Current status of the goal itself
  final GoalStatus status;

  /// The title of the goal
  final String title;

  /// Timestamp when this goal was last updated
  final DateTime updatedAt;

  /// Version number for optimistic locking
  final int version;

  /// Goal Schedule. Allows to schedule the goal to run periodically, as well as
  /// disable a goal temporarily
  final GoalSchedule? evaluationSchedule;

  /// Timestamp when the goal was last evaluated
  final DateTime? lastEvaluatedAt;

  /// ID of the most recent successful task associated with this goal
  final String? lastSuccessfulTaskId;

  /// ID of the most recent task associated with this goal
  final String? lastTaskId;

  Goal({
    required this.agentSpaceArn,
    required this.content,
    required this.createdAt,
    required this.goalId,
    required this.goalType,
    required this.status,
    required this.title,
    required this.updatedAt,
    required this.version,
    this.evaluationSchedule,
    this.lastEvaluatedAt,
    this.lastSuccessfulTaskId,
    this.lastTaskId,
  });

  factory Goal.fromJson(Map<String, dynamic> json) {
    return Goal(
      agentSpaceArn: (json['agentSpaceArn'] as String?) ?? '',
      content: GoalContent.fromJson(
          (json['content'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      goalId: (json['goalId'] as String?) ?? '',
      goalType: GoalType.fromString((json['goalType'] as String?) ?? ''),
      status: GoalStatus.fromString((json['status'] as String?) ?? ''),
      title: (json['title'] as String?) ?? '',
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      version: (json['version'] as int?) ?? 0,
      evaluationSchedule: json['evaluationSchedule'] != null
          ? GoalSchedule.fromJson(
              json['evaluationSchedule'] as Map<String, dynamic>)
          : null,
      lastEvaluatedAt: timeStampFromJson(json['lastEvaluatedAt']),
      lastSuccessfulTaskId: json['lastSuccessfulTaskId'] as String?,
      lastTaskId: json['lastTaskId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final agentSpaceArn = this.agentSpaceArn;
    final content = this.content;
    final createdAt = this.createdAt;
    final goalId = this.goalId;
    final goalType = this.goalType;
    final status = this.status;
    final title = this.title;
    final updatedAt = this.updatedAt;
    final version = this.version;
    final evaluationSchedule = this.evaluationSchedule;
    final lastEvaluatedAt = this.lastEvaluatedAt;
    final lastSuccessfulTaskId = this.lastSuccessfulTaskId;
    final lastTaskId = this.lastTaskId;
    return {
      'agentSpaceArn': agentSpaceArn,
      'content': content,
      'createdAt': iso8601ToJson(createdAt),
      'goalId': goalId,
      'goalType': goalType.value,
      'status': status.value,
      'title': title,
      'updatedAt': iso8601ToJson(updatedAt),
      'version': version,
      if (evaluationSchedule != null) 'evaluationSchedule': evaluationSchedule,
      if (lastEvaluatedAt != null)
        'lastEvaluatedAt': iso8601ToJson(lastEvaluatedAt),
      if (lastSuccessfulTaskId != null)
        'lastSuccessfulTaskId': lastSuccessfulTaskId,
      if (lastTaskId != null) 'lastTaskId': lastTaskId,
    };
  }
}

/// Content of a goal
///
/// @nodoc
class GoalContent {
  /// A detailed description of the goal.
  final String description;

  /// The objectives to be achieved for this goal.
  final String objectives;

  GoalContent({
    required this.description,
    required this.objectives,
  });

  factory GoalContent.fromJson(Map<String, dynamic> json) {
    return GoalContent(
      description: (json['description'] as String?) ?? '',
      objectives: (json['objectives'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final objectives = this.objectives;
    return {
      'description': description,
      'objectives': objectives,
    };
  }
}

/// Possible states of a goal throughout its lifecycle
///
/// @nodoc
class GoalStatus {
  static const active = GoalStatus._('ACTIVE');
  static const paused = GoalStatus._('PAUSED');
  static const complete = GoalStatus._('COMPLETE');

  final String value;

  const GoalStatus._(this.value);

  static const values = [active, paused, complete];

  static GoalStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => GoalStatus._(value));

  @override
  bool operator ==(other) => other is GoalStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Type of goal based on its origin
///
/// @nodoc
class GoalType {
  static const customerDefined = GoalType._('CUSTOMER_DEFINED');
  static const oncallReport = GoalType._('ONCALL_REPORT');

  final String value;

  const GoalType._(this.value);

  static const values = [customerDefined, oncallReport];

  static GoalType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => GoalType._(value));

  @override
  bool operator ==(other) => other is GoalType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Schedule configuration for goal evaluations
///
/// @nodoc
class GoalSchedule {
  /// Whether the schedule is enabled or disabled
  final SchedulerState state;

  /// Schedule expression (e.g., 'rate(7 days)')
  final String? expression;

  GoalSchedule({
    required this.state,
    this.expression,
  });

  factory GoalSchedule.fromJson(Map<String, dynamic> json) {
    return GoalSchedule(
      state: SchedulerState.fromString((json['state'] as String?) ?? ''),
      expression: json['expression'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final state = this.state;
    final expression = this.expression;
    return {
      'state': state.value,
      if (expression != null) 'expression': expression,
    };
  }
}

/// State of Goal Schedule. Mirrors EventBridge Scheduler State
///
/// @nodoc
class SchedulerState {
  static const enabled = SchedulerState._('ENABLED');
  static const disabled = SchedulerState._('DISABLED');

  final String value;

  const SchedulerState._(this.value);

  static const values = [enabled, disabled];

  static SchedulerState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SchedulerState._(value));

  @override
  bool operator ==(other) => other is SchedulerState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Schedule configuration for updating goal evaluations
///
/// @nodoc
class GoalScheduleInput {
  /// Whether the schedule is enabled or disabled
  final SchedulerState state;

  GoalScheduleInput({
    required this.state,
  });

  Map<String, dynamic> toJson() {
    final state = this.state;
    return {
      'state': state.value,
    };
  }
}

/// Represents a backlog task with all its properties and metadata
///
/// @nodoc
class Task {
  /// The unique identifier for the agent space containing this task
  final String agentSpaceId;

  /// Timestamp when this task was created
  final DateTime createdAt;

  /// The priority level of this task
  final Priority priority;

  /// The current status of this task
  final TaskStatus status;

  /// The unique identifier for this task
  final String taskId;

  /// The type of this task
  final TaskType taskType;

  /// The title of the task
  final String title;

  /// Timestamp when this task was last updated
  final DateTime updatedAt;

  /// Version number for optimistic locking
  final int version;

  /// Optional detailed description of the task
  final String? description;

  /// The execution ID associated with this task, if any
  final String? executionId;

  /// Indicates if this task has other tasks linked to it
  final bool? hasLinkedTasks;

  /// Optional metadata for the task
  final Document? metadata;

  /// The task ID of the primary investigation this task is linked to
  final String? primaryTaskId;

  /// Optional reference information linking this task to external systems
  final ReferenceOutput? reference;

  /// Explanation for why the task status was changed (e.g., linked reason)
  final String? statusReason;

  /// Optional support metadata for the task
  final Document? supportMetadata;

  Task({
    required this.agentSpaceId,
    required this.createdAt,
    required this.priority,
    required this.status,
    required this.taskId,
    required this.taskType,
    required this.title,
    required this.updatedAt,
    required this.version,
    this.description,
    this.executionId,
    this.hasLinkedTasks,
    this.metadata,
    this.primaryTaskId,
    this.reference,
    this.statusReason,
    this.supportMetadata,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      agentSpaceId: (json['agentSpaceId'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      priority: Priority.fromString((json['priority'] as String?) ?? ''),
      status: TaskStatus.fromString((json['status'] as String?) ?? ''),
      taskId: (json['taskId'] as String?) ?? '',
      taskType: TaskType.fromString((json['taskType'] as String?) ?? ''),
      title: (json['title'] as String?) ?? '',
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      version: (json['version'] as int?) ?? 0,
      description: json['description'] as String?,
      executionId: json['executionId'] as String?,
      hasLinkedTasks: json['hasLinkedTasks'] as bool?,
      metadata: json['metadata'] != null
          ? Document.fromJson(json['metadata'] as Map<String, dynamic>)
          : null,
      primaryTaskId: json['primaryTaskId'] as String?,
      reference: json['reference'] != null
          ? ReferenceOutput.fromJson(json['reference'] as Map<String, dynamic>)
          : null,
      statusReason: json['statusReason'] as String?,
      supportMetadata: json['supportMetadata'] != null
          ? Document.fromJson(json['supportMetadata'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final agentSpaceId = this.agentSpaceId;
    final createdAt = this.createdAt;
    final priority = this.priority;
    final status = this.status;
    final taskId = this.taskId;
    final taskType = this.taskType;
    final title = this.title;
    final updatedAt = this.updatedAt;
    final version = this.version;
    final description = this.description;
    final executionId = this.executionId;
    final hasLinkedTasks = this.hasLinkedTasks;
    final metadata = this.metadata;
    final primaryTaskId = this.primaryTaskId;
    final reference = this.reference;
    final statusReason = this.statusReason;
    final supportMetadata = this.supportMetadata;
    return {
      'agentSpaceId': agentSpaceId,
      'createdAt': iso8601ToJson(createdAt),
      'priority': priority.value,
      'status': status.value,
      'taskId': taskId,
      'taskType': taskType.value,
      'title': title,
      'updatedAt': iso8601ToJson(updatedAt),
      'version': version,
      if (description != null) 'description': description,
      if (executionId != null) 'executionId': executionId,
      if (hasLinkedTasks != null) 'hasLinkedTasks': hasLinkedTasks,
      if (metadata != null) 'metadata': metadata,
      if (primaryTaskId != null) 'primaryTaskId': primaryTaskId,
      if (reference != null) 'reference': reference,
      if (statusReason != null) 'statusReason': statusReason,
      if (supportMetadata != null) 'supportMetadata': supportMetadata,
    };
  }
}

/// Reference information linking a task to external systems - for output
/// without validation
///
/// @nodoc
class ReferenceOutput {
  /// Association identifier of the external system
  final String associationId;

  /// The unique identifier in the external system
  final String referenceId;

  /// URL to access the reference in the external system
  final String referenceUrl;

  /// The name of the external system
  final String system;

  /// Optional title for the reference
  final String? title;

  ReferenceOutput({
    required this.associationId,
    required this.referenceId,
    required this.referenceUrl,
    required this.system,
    this.title,
  });

  factory ReferenceOutput.fromJson(Map<String, dynamic> json) {
    return ReferenceOutput(
      associationId: (json['associationId'] as String?) ?? '',
      referenceId: (json['referenceId'] as String?) ?? '',
      referenceUrl: (json['referenceUrl'] as String?) ?? '',
      system: (json['system'] as String?) ?? '',
      title: json['title'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final associationId = this.associationId;
    final referenceId = this.referenceId;
    final referenceUrl = this.referenceUrl;
    final system = this.system;
    final title = this.title;
    return {
      'associationId': associationId,
      'referenceId': referenceId,
      'referenceUrl': referenceUrl,
      'system': system,
      if (title != null) 'title': title,
    };
  }
}

/// Types of tasks that can be created in the backlog
///
/// @nodoc
class TaskType {
  static const investigation = TaskType._('INVESTIGATION');
  static const evaluation = TaskType._('EVALUATION');

  final String value;

  const TaskType._(this.value);

  static const values = [investigation, evaluation];

  static TaskType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => TaskType._(value));

  @override
  bool operator ==(other) => other is TaskType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Priority levels for tasks, from highest to lowest urgency
///
/// @nodoc
class Priority {
  static const critical = Priority._('CRITICAL');
  static const high = Priority._('HIGH');
  static const medium = Priority._('MEDIUM');
  static const low = Priority._('LOW');
  static const minimal = Priority._('MINIMAL');

  final String value;

  const Priority._(this.value);

  static const values = [critical, high, medium, low, minimal];

  static Priority fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => Priority._(value));

  @override
  bool operator ==(other) => other is Priority && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Possible states of a task throughout its lifecycle
///
/// @nodoc
class TaskStatus {
  static const pendingTriage = TaskStatus._('PENDING_TRIAGE');
  static const linked = TaskStatus._('LINKED');
  static const pendingStart = TaskStatus._('PENDING_START');
  static const inProgress = TaskStatus._('IN_PROGRESS');
  static const pendingCustomerApproval =
      TaskStatus._('PENDING_CUSTOMER_APPROVAL');
  static const completed = TaskStatus._('COMPLETED');
  static const failed = TaskStatus._('FAILED');
  static const timedOut = TaskStatus._('TIMED_OUT');
  static const canceled = TaskStatus._('CANCELED');

  final String value;

  const TaskStatus._(this.value);

  static const values = [
    pendingTriage,
    linked,
    pendingStart,
    inProgress,
    pendingCustomerApproval,
    completed,
    failed,
    timedOut,
    canceled
  ];

  static TaskStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => TaskStatus._(value));

  @override
  bool operator ==(other) => other is TaskStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Event stream for chat message responses using the content block model.
/// Events follow a lifecycle: responseCreated -&gt; responseInProgress -&gt;
/// (contentBlockStart/contentBlockDelta/contentBlockStop events) -&gt;
/// responseCompleted|responseFailed SendMessage always uses content block mode
/// — legacy per-field events (outputTextDelta, functionCallArgumentsDelta,
/// etc.) are not emitted.
///
/// @nodoc
class SendMessageEvents {
  /// Emitted for each incremental content delta within a content block
  final SendMessageContentBlockDeltaEvent? contentBlockDelta;

  /// Emitted when a new content block starts
  final SendMessageContentBlockStartEvent? contentBlockStart;

  /// Emitted when a content block is complete
  final SendMessageContentBlockStopEvent? contentBlockStop;

  /// Heartbeat event sent periodically to keep the connection alive during idle
  /// periods
  final SendMessageHeartbeatEvent? heartbeat;

  /// Emitted when the response completes successfully
  final SendMessageResponseCompletedEvent? responseCompleted;

  /// Emitted when the response is created
  final SendMessageResponseCreatedEvent? responseCreated;

  /// Emitted when the response fails
  final SendMessageResponseFailedEvent? responseFailed;

  /// Emitted while the response is being generated
  final SendMessageResponseInProgressEvent? responseInProgress;

  /// Emitted to provide a summary of agent actions
  final SendMessageSummaryEvent? summary;

  SendMessageEvents({
    this.contentBlockDelta,
    this.contentBlockStart,
    this.contentBlockStop,
    this.heartbeat,
    this.responseCompleted,
    this.responseCreated,
    this.responseFailed,
    this.responseInProgress,
    this.summary,
  });

  factory SendMessageEvents.fromJson(Map<String, dynamic> json) {
    return SendMessageEvents(
      contentBlockDelta: json['contentBlockDelta'] != null
          ? SendMessageContentBlockDeltaEvent.fromJson(
              json['contentBlockDelta'] as Map<String, dynamic>)
          : null,
      contentBlockStart: json['contentBlockStart'] != null
          ? SendMessageContentBlockStartEvent.fromJson(
              json['contentBlockStart'] as Map<String, dynamic>)
          : null,
      contentBlockStop: json['contentBlockStop'] != null
          ? SendMessageContentBlockStopEvent.fromJson(
              json['contentBlockStop'] as Map<String, dynamic>)
          : null,
      heartbeat: json['heartbeat'] != null
          ? SendMessageHeartbeatEvent.fromJson(
              json['heartbeat'] as Map<String, dynamic>)
          : null,
      responseCompleted: json['responseCompleted'] != null
          ? SendMessageResponseCompletedEvent.fromJson(
              json['responseCompleted'] as Map<String, dynamic>)
          : null,
      responseCreated: json['responseCreated'] != null
          ? SendMessageResponseCreatedEvent.fromJson(
              json['responseCreated'] as Map<String, dynamic>)
          : null,
      responseFailed: json['responseFailed'] != null
          ? SendMessageResponseFailedEvent.fromJson(
              json['responseFailed'] as Map<String, dynamic>)
          : null,
      responseInProgress: json['responseInProgress'] != null
          ? SendMessageResponseInProgressEvent.fromJson(
              json['responseInProgress'] as Map<String, dynamic>)
          : null,
      summary: json['summary'] != null
          ? SendMessageSummaryEvent.fromJson(
              json['summary'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final contentBlockDelta = this.contentBlockDelta;
    final contentBlockStart = this.contentBlockStart;
    final contentBlockStop = this.contentBlockStop;
    final heartbeat = this.heartbeat;
    final responseCompleted = this.responseCompleted;
    final responseCreated = this.responseCreated;
    final responseFailed = this.responseFailed;
    final responseInProgress = this.responseInProgress;
    final summary = this.summary;
    return {
      if (contentBlockDelta != null) 'contentBlockDelta': contentBlockDelta,
      if (contentBlockStart != null) 'contentBlockStart': contentBlockStart,
      if (contentBlockStop != null) 'contentBlockStop': contentBlockStop,
      if (heartbeat != null) 'heartbeat': heartbeat,
      if (responseCompleted != null) 'responseCompleted': responseCompleted,
      if (responseCreated != null) 'responseCreated': responseCreated,
      if (responseFailed != null) 'responseFailed': responseFailed,
      if (responseInProgress != null) 'responseInProgress': responseInProgress,
      if (summary != null) 'summary': summary,
    };
  }
}

/// Event emitted when the response is created
///
/// @nodoc
class SendMessageResponseCreatedEvent {
  /// The response ID
  final String? responseId;

  /// Event sequence number
  final int? sequenceNumber;

  SendMessageResponseCreatedEvent({
    this.responseId,
    this.sequenceNumber,
  });

  factory SendMessageResponseCreatedEvent.fromJson(Map<String, dynamic> json) {
    return SendMessageResponseCreatedEvent(
      responseId: json['responseId'] as String?,
      sequenceNumber: json['sequenceNumber'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final responseId = this.responseId;
    final sequenceNumber = this.sequenceNumber;
    return {
      if (responseId != null) 'responseId': responseId,
      if (sequenceNumber != null) 'sequenceNumber': sequenceNumber,
    };
  }
}

/// Event emitted while the response is being generated
///
/// @nodoc
class SendMessageResponseInProgressEvent {
  /// The response ID
  final String? responseId;

  /// Event sequence number
  final int? sequenceNumber;

  SendMessageResponseInProgressEvent({
    this.responseId,
    this.sequenceNumber,
  });

  factory SendMessageResponseInProgressEvent.fromJson(
      Map<String, dynamic> json) {
    return SendMessageResponseInProgressEvent(
      responseId: json['responseId'] as String?,
      sequenceNumber: json['sequenceNumber'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final responseId = this.responseId;
    final sequenceNumber = this.sequenceNumber;
    return {
      if (responseId != null) 'responseId': responseId,
      if (sequenceNumber != null) 'sequenceNumber': sequenceNumber,
    };
  }
}

/// Event emitted when the response completes successfully
///
/// @nodoc
class SendMessageResponseCompletedEvent {
  /// The response ID
  final String? responseId;

  /// Event sequence number
  final int? sequenceNumber;

  /// Token usage information
  final SendMessageUsageInfo? usage;

  SendMessageResponseCompletedEvent({
    this.responseId,
    this.sequenceNumber,
    this.usage,
  });

  factory SendMessageResponseCompletedEvent.fromJson(
      Map<String, dynamic> json) {
    return SendMessageResponseCompletedEvent(
      responseId: json['responseId'] as String?,
      sequenceNumber: json['sequenceNumber'] as int?,
      usage: json['usage'] != null
          ? SendMessageUsageInfo.fromJson(json['usage'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final responseId = this.responseId;
    final sequenceNumber = this.sequenceNumber;
    final usage = this.usage;
    return {
      if (responseId != null) 'responseId': responseId,
      if (sequenceNumber != null) 'sequenceNumber': sequenceNumber,
      if (usage != null) 'usage': usage,
    };
  }
}

/// Event emitted when the response fails
///
/// @nodoc
class SendMessageResponseFailedEvent {
  /// Error code
  final String? errorCode;

  /// Error message
  final String? errorMessage;

  /// The response ID
  final String? responseId;

  /// Event sequence number
  final int? sequenceNumber;

  SendMessageResponseFailedEvent({
    this.errorCode,
    this.errorMessage,
    this.responseId,
    this.sequenceNumber,
  });

  factory SendMessageResponseFailedEvent.fromJson(Map<String, dynamic> json) {
    return SendMessageResponseFailedEvent(
      errorCode: json['errorCode'] as String?,
      errorMessage: json['errorMessage'] as String?,
      responseId: json['responseId'] as String?,
      sequenceNumber: json['sequenceNumber'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final responseId = this.responseId;
    final sequenceNumber = this.sequenceNumber;
    return {
      if (errorCode != null) 'errorCode': errorCode,
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (responseId != null) 'responseId': responseId,
      if (sequenceNumber != null) 'sequenceNumber': sequenceNumber,
    };
  }
}

/// Event summarizing agent actions
///
/// @nodoc
class SendMessageSummaryEvent {
  /// Summary content
  final String? content;

  /// Event sequence number
  final int? sequenceNumber;

  SendMessageSummaryEvent({
    this.content,
    this.sequenceNumber,
  });

  factory SendMessageSummaryEvent.fromJson(Map<String, dynamic> json) {
    return SendMessageSummaryEvent(
      content: json['content'] as String?,
      sequenceNumber: json['sequenceNumber'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final content = this.content;
    final sequenceNumber = this.sequenceNumber;
    return {
      if (content != null) 'content': content,
      if (sequenceNumber != null) 'sequenceNumber': sequenceNumber,
    };
  }
}

/// Heartbeat event to keep connection alive
///
/// @nodoc
class SendMessageHeartbeatEvent {
  SendMessageHeartbeatEvent();

  factory SendMessageHeartbeatEvent.fromJson(Map<String, dynamic> _) {
    return SendMessageHeartbeatEvent();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Event emitted when a new content block starts
///
/// @nodoc
class SendMessageContentBlockStartEvent {
  /// Block identifier
  final String? id;

  /// Zero-based index of the content block
  final int? index;

  /// Optional parent block ID for nested content blocks (e.g. subagent tool
  /// calls)
  final String? parentId;

  /// Event sequence number
  final int? sequenceNumber;

  /// The type of content in this block
  final String? type;

  SendMessageContentBlockStartEvent({
    this.id,
    this.index,
    this.parentId,
    this.sequenceNumber,
    this.type,
  });

  factory SendMessageContentBlockStartEvent.fromJson(
      Map<String, dynamic> json) {
    return SendMessageContentBlockStartEvent(
      id: json['id'] as String?,
      index: json['index'] as int?,
      parentId: json['parentId'] as String?,
      sequenceNumber: json['sequenceNumber'] as int?,
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final index = this.index;
    final parentId = this.parentId;
    final sequenceNumber = this.sequenceNumber;
    final type = this.type;
    return {
      if (id != null) 'id': id,
      if (index != null) 'index': index,
      if (parentId != null) 'parentId': parentId,
      if (sequenceNumber != null) 'sequenceNumber': sequenceNumber,
      if (type != null) 'type': type,
    };
  }
}

/// Event emitted for each incremental content delta within a content block
///
/// @nodoc
class SendMessageContentBlockDeltaEvent {
  /// The incremental content delta
  final SendMessageContentBlockDelta? delta;

  /// Zero-based index of the content block
  final int? index;

  /// Event sequence number
  final int? sequenceNumber;

  SendMessageContentBlockDeltaEvent({
    this.delta,
    this.index,
    this.sequenceNumber,
  });

  factory SendMessageContentBlockDeltaEvent.fromJson(
      Map<String, dynamic> json) {
    return SendMessageContentBlockDeltaEvent(
      delta: json['delta'] != null
          ? SendMessageContentBlockDelta.fromJson(
              json['delta'] as Map<String, dynamic>)
          : null,
      index: json['index'] as int?,
      sequenceNumber: json['sequenceNumber'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final delta = this.delta;
    final index = this.index;
    final sequenceNumber = this.sequenceNumber;
    return {
      if (delta != null) 'delta': delta,
      if (index != null) 'index': index,
      if (sequenceNumber != null) 'sequenceNumber': sequenceNumber,
    };
  }
}

/// Event emitted when a content block is complete
///
/// @nodoc
class SendMessageContentBlockStopEvent {
  /// Zero-based index of the content block
  final int? index;

  /// Whether this is the final content block in the response
  final bool? last;

  /// Event sequence number
  final int? sequenceNumber;

  /// The accumulated complete content text
  final String? text;

  /// The type of content in this block
  final String? type;

  SendMessageContentBlockStopEvent({
    this.index,
    this.last,
    this.sequenceNumber,
    this.text,
    this.type,
  });

  factory SendMessageContentBlockStopEvent.fromJson(Map<String, dynamic> json) {
    return SendMessageContentBlockStopEvent(
      index: json['index'] as int?,
      last: json['last'] as bool?,
      sequenceNumber: json['sequenceNumber'] as int?,
      text: json['text'] as String?,
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final index = this.index;
    final last = this.last;
    final sequenceNumber = this.sequenceNumber;
    final text = this.text;
    final type = this.type;
    return {
      if (index != null) 'index': index,
      if (last != null) 'last': last,
      if (sequenceNumber != null) 'sequenceNumber': sequenceNumber,
      if (text != null) 'text': text,
      if (type != null) 'type': type,
    };
  }
}

/// Union of possible delta payloads within a content block delta event
///
/// @nodoc
class SendMessageContentBlockDelta {
  /// JSON delta for structured content blocks
  final SendMessageJsonDelta? jsonDelta;

  /// Text delta for text-based content blocks
  final SendMessageTextDelta? textDelta;

  SendMessageContentBlockDelta({
    this.jsonDelta,
    this.textDelta,
  });

  factory SendMessageContentBlockDelta.fromJson(Map<String, dynamic> json) {
    return SendMessageContentBlockDelta(
      jsonDelta: json['jsonDelta'] != null
          ? SendMessageJsonDelta.fromJson(
              json['jsonDelta'] as Map<String, dynamic>)
          : null,
      textDelta: json['textDelta'] != null
          ? SendMessageTextDelta.fromJson(
              json['textDelta'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final jsonDelta = this.jsonDelta;
    final textDelta = this.textDelta;
    return {
      if (jsonDelta != null) 'jsonDelta': jsonDelta,
      if (textDelta != null) 'textDelta': textDelta,
    };
  }
}

/// Text delta containing a text fragment
///
/// @nodoc
class SendMessageTextDelta {
  /// The text fragment
  final String? text;

  SendMessageTextDelta({
    this.text,
  });

  factory SendMessageTextDelta.fromJson(Map<String, dynamic> json) {
    return SendMessageTextDelta(
      text: json['text'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final text = this.text;
    return {
      if (text != null) 'text': text,
    };
  }
}

/// JSON delta containing partial JSON
///
/// @nodoc
class SendMessageJsonDelta {
  /// Partial JSON string
  final String? partialJson;

  SendMessageJsonDelta({
    this.partialJson,
  });

  factory SendMessageJsonDelta.fromJson(Map<String, dynamic> json) {
    return SendMessageJsonDelta(
      partialJson: json['partialJson'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final partialJson = this.partialJson;
    return {
      if (partialJson != null) 'partialJson': partialJson,
    };
  }
}

/// Token usage information
///
/// @nodoc
class SendMessageUsageInfo {
  /// Number of input tokens
  final int? inputTokens;

  /// Number of output tokens
  final int? outputTokens;

  /// Total tokens used
  final int? totalTokens;

  SendMessageUsageInfo({
    this.inputTokens,
    this.outputTokens,
    this.totalTokens,
  });

  factory SendMessageUsageInfo.fromJson(Map<String, dynamic> json) {
    return SendMessageUsageInfo(
      inputTokens: json['inputTokens'] as int?,
      outputTokens: json['outputTokens'] as int?,
      totalTokens: json['totalTokens'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final inputTokens = this.inputTokens;
    final outputTokens = this.outputTokens;
    final totalTokens = this.totalTokens;
    return {
      if (inputTokens != null) 'inputTokens': inputTokens,
      if (outputTokens != null) 'outputTokens': outputTokens,
      if (totalTokens != null) 'totalTokens': totalTokens,
    };
  }
}

/// Context object for additional message metadata
///
/// @nodoc
class SendMessageContext {
  /// The current page or view the user is on
  final String? currentPage;

  /// The ID of the last message in the conversation
  final String? lastMessage;

  /// Response to a UI prompt (not a text conversation message)
  final String? userActionResponse;

  SendMessageContext({
    this.currentPage,
    this.lastMessage,
    this.userActionResponse,
  });

  Map<String, dynamic> toJson() {
    final currentPage = this.currentPage;
    final lastMessage = this.lastMessage;
    final userActionResponse = this.userActionResponse;
    return {
      if (currentPage != null) 'currentPage': currentPage,
      if (lastMessage != null) 'lastMessage': lastMessage,
      if (userActionResponse != null) 'userActionResponse': userActionResponse,
    };
  }
}

/// Represents a pending message in an agent execution.
///
/// @nodoc
class PendingMessage {
  /// The message content.
  final Message message;

  /// The unique identifier for this pending message.
  final String messageId;

  PendingMessage({
    required this.message,
    required this.messageId,
  });

  factory PendingMessage.fromJson(Map<String, dynamic> json) {
    return PendingMessage(
      message: Message.fromJson((json['message'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
      messageId: (json['messageId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    final messageId = this.messageId;
    return {
      'message': message,
      'messageId': messageId,
    };
  }
}

/// A message in a conversation, either from the user or the assistant.
///
/// @nodoc
class Message {
  /// A message from the assistant.
  final List<AssistantMessageBlock>? assistantMessage;

  /// A message from the user.
  final List<UserMessageBlock>? userMessage;

  Message({
    this.assistantMessage,
    this.userMessage,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      assistantMessage: (json['assistantMessage'] as List?)
          ?.nonNulls
          .map((e) => AssistantMessageBlock.fromJson(e as Map<String, dynamic>))
          .toList(),
      userMessage: (json['userMessage'] as List?)
          ?.nonNulls
          .map((e) => UserMessageBlock.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final assistantMessage = this.assistantMessage;
    final userMessage = this.userMessage;
    return {
      if (assistantMessage != null) 'assistantMessage': assistantMessage,
      if (userMessage != null) 'userMessage': userMessage,
    };
  }
}

/// A block of content in an assistant message.
///
/// @nodoc
class AssistantMessageBlock {
  /// Text content from the assistant.
  final String? text;

  /// Tool use request from the assistant.
  final Document? toolUse;

  AssistantMessageBlock({
    this.text,
    this.toolUse,
  });

  factory AssistantMessageBlock.fromJson(Map<String, dynamic> json) {
    return AssistantMessageBlock(
      text: json['text'] as String?,
      toolUse: json['toolUse'] != null
          ? Document.fromJson(json['toolUse'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final text = this.text;
    final toolUse = this.toolUse;
    return {
      if (text != null) 'text': text,
      if (toolUse != null) 'toolUse': toolUse,
    };
  }
}

/// A block of content in a user message.
///
/// @nodoc
class UserMessageBlock {
  /// Text content from the user.
  final String? text;

  /// Tool execution result provided by the user.
  final Document? toolResult;

  UserMessageBlock({
    this.text,
    this.toolResult,
  });

  factory UserMessageBlock.fromJson(Map<String, dynamic> json) {
    return UserMessageBlock(
      text: json['text'] as String?,
      toolResult: json['toolResult'] != null
          ? Document.fromJson(json['toolResult'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final text = this.text;
    final toolResult = this.toolResult;
    return {
      if (text != null) 'text': text,
      if (toolResult != null) 'toolResult': toolResult,
    };
  }
}

/// Represents a journal record containing execution details and content
///
/// @nodoc
class JournalRecord {
  /// The unique identifier for the agent space containing this record
  final String agentSpaceId;

  /// The content of this journal record
  final Document content;

  /// Timestamp when this journal record was created
  final DateTime createdAt;

  /// The execution ID associated with this journal record
  final String executionId;

  /// The unique identifier for this journal record
  final String recordId;

  /// The type of this journal record
  final String recordType;

  /// Reference to the user associated with this journal record
  final UserReference? userReference;

  JournalRecord({
    required this.agentSpaceId,
    required this.content,
    required this.createdAt,
    required this.executionId,
    required this.recordId,
    required this.recordType,
    this.userReference,
  });

  factory JournalRecord.fromJson(Map<String, dynamic> json) {
    return JournalRecord(
      agentSpaceId: (json['agentSpaceId'] as String?) ?? '',
      content: Document.fromJson((json['content'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      executionId: (json['executionId'] as String?) ?? '',
      recordId: (json['recordId'] as String?) ?? '',
      recordType: (json['recordType'] as String?) ?? '',
      userReference: json['userReference'] != null
          ? UserReference.fromJson(
              json['userReference'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final agentSpaceId = this.agentSpaceId;
    final content = this.content;
    final createdAt = this.createdAt;
    final executionId = this.executionId;
    final recordId = this.recordId;
    final recordType = this.recordType;
    final userReference = this.userReference;
    return {
      'agentSpaceId': agentSpaceId,
      'content': content,
      'createdAt': unixTimestampToJson(createdAt),
      'executionId': executionId,
      'recordId': recordId,
      'recordType': recordType,
      if (userReference != null) 'userReference': userReference,
    };
  }
}

/// Reference to a user in the system
///
/// @nodoc
class UserReference {
  /// The unique identifier for the user
  final String userId;

  /// The type of user
  final UserType userType;

  UserReference({
    required this.userId,
    required this.userType,
  });

  factory UserReference.fromJson(Map<String, dynamic> json) {
    return UserReference(
      userId: (json['userId'] as String?) ?? '',
      userType: UserType.fromString((json['userType'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final userId = this.userId;
    final userType = this.userType;
    return {
      'userId': userId,
      'userType': userType.value,
    };
  }
}

/// Types of users in the system
///
/// @nodoc
class UserType {
  static const iam = UserType._('IAM');
  static const idc = UserType._('IDC');
  static const idp = UserType._('IDP');

  final String value;

  const UserType._(this.value);

  static const values = [iam, idc, idp];

  static UserType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => UserType._(value));

  @override
  bool operator ==(other) => other is UserType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Sort order options for journal operations
///
/// @nodoc
class OrderType {
  static const asc = OrderType._('ASC');
  static const desc = OrderType._('DESC');

  final String value;

  const OrderType._(this.value);

  static const values = [asc, desc];

  static OrderType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => OrderType._(value));

  @override
  bool operator ==(other) => other is OrderType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents an execution instance with its lifecycle information
///
/// @nodoc
class Execution {
  /// The unique identifier for the agent space containing this execution
  final String agentSpaceId;

  /// The specific subtask being executed by the agent
  final String agentSubTask;

  /// Timestamp when this execution was created
  final DateTime createdAt;

  /// The unique identifier for this execution
  final String executionId;

  /// The current status of this execution
  final ExecutionStatus executionStatus;

  /// Timestamp when this execution was last updated
  final DateTime updatedAt;

  /// The type of agent that performed this execution.
  final String? agentType;

  /// The identifier of the parent execution, if this is a child execution
  final String? parentExecutionId;

  /// The unique identifier for the user session associated with this execution
  final String? uid;

  Execution({
    required this.agentSpaceId,
    required this.agentSubTask,
    required this.createdAt,
    required this.executionId,
    required this.executionStatus,
    required this.updatedAt,
    this.agentType,
    this.parentExecutionId,
    this.uid,
  });

  factory Execution.fromJson(Map<String, dynamic> json) {
    return Execution(
      agentSpaceId: (json['agentSpaceId'] as String?) ?? '',
      agentSubTask: (json['agentSubTask'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      executionId: (json['executionId'] as String?) ?? '',
      executionStatus: ExecutionStatus.fromString(
          (json['executionStatus'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      agentType: json['agentType'] as String?,
      parentExecutionId: json['parentExecutionId'] as String?,
      uid: json['uid'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final agentSpaceId = this.agentSpaceId;
    final agentSubTask = this.agentSubTask;
    final createdAt = this.createdAt;
    final executionId = this.executionId;
    final executionStatus = this.executionStatus;
    final updatedAt = this.updatedAt;
    final agentType = this.agentType;
    final parentExecutionId = this.parentExecutionId;
    final uid = this.uid;
    return {
      'agentSpaceId': agentSpaceId,
      'agentSubTask': agentSubTask,
      'createdAt': unixTimestampToJson(createdAt),
      'executionId': executionId,
      'executionStatus': executionStatus.value,
      'updatedAt': unixTimestampToJson(updatedAt),
      if (agentType != null) 'agentType': agentType,
      if (parentExecutionId != null) 'parentExecutionId': parentExecutionId,
      if (uid != null) 'uid': uid,
    };
  }
}

/// Possible states of an execution
///
/// @nodoc
class ExecutionStatus {
  static const failed = ExecutionStatus._('FAILED');
  static const running = ExecutionStatus._('RUNNING');
  static const stopped = ExecutionStatus._('STOPPED');
  static const canceled = ExecutionStatus._('CANCELED');
  static const timedOut = ExecutionStatus._('TIMED_OUT');

  final String value;

  const ExecutionStatus._(this.value);

  static const values = [failed, running, stopped, canceled, timedOut];

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

/// A single chat execution summary
///
/// @nodoc
class ChatExecution {
  /// Timestamp when the chat was created
  final DateTime createdAt;

  /// The unique identifier for the execution
  final String executionId;

  /// Summary or title of the chat
  final String? summary;

  /// Timestamp when the chat was last updated
  final DateTime? updatedAt;

  ChatExecution({
    required this.createdAt,
    required this.executionId,
    this.summary,
    this.updatedAt,
  });

  factory ChatExecution.fromJson(Map<String, dynamic> json) {
    return ChatExecution(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      executionId: (json['executionId'] as String?) ?? '',
      summary: json['summary'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final executionId = this.executionId;
    final summary = this.summary;
    final updatedAt = this.updatedAt;
    return {
      'createdAt': unixTimestampToJson(createdAt),
      'executionId': executionId,
      if (summary != null) 'summary': summary,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// Filter criteria for listing backlog tasks, supporting time range, priority,
/// status, and type filters.
///
/// @nodoc
class TaskFilter {
  /// Filter for tasks created after this timestamp inclusive
  final DateTime? createdAfter;

  /// Filter for tasks created before this timestamp exclusive
  final DateTime? createdBefore;

  /// Filter by primary task ID to get linked tasks
  final String? primaryTaskId;

  /// Filter by priority (single value only)
  final List<Priority>? priority;

  /// Filter by status (single value only)
  final List<TaskStatus>? status;

  /// Filter by task type (single value only)
  final List<TaskType>? taskType;

  TaskFilter({
    this.createdAfter,
    this.createdBefore,
    this.primaryTaskId,
    this.priority,
    this.status,
    this.taskType,
  });

  Map<String, dynamic> toJson() {
    final createdAfter = this.createdAfter;
    final createdBefore = this.createdBefore;
    final primaryTaskId = this.primaryTaskId;
    final priority = this.priority;
    final status = this.status;
    final taskType = this.taskType;
    return {
      if (createdAfter != null) 'createdAfter': iso8601ToJson(createdAfter),
      if (createdBefore != null) 'createdBefore': iso8601ToJson(createdBefore),
      if (primaryTaskId != null) 'primaryTaskId': primaryTaskId,
      if (priority != null) 'priority': priority.map((e) => e.value).toList(),
      if (status != null) 'status': status.map((e) => e.value).toList(),
      if (taskType != null) 'taskType': taskType.map((e) => e.value).toList(),
    };
  }
}

/// Fields available for sorting tasks
///
/// @nodoc
class TaskSortField {
  static const createdAt = TaskSortField._('CREATED_AT');
  static const priority = TaskSortField._('PRIORITY');

  final String value;

  const TaskSortField._(this.value);

  static const values = [createdAt, priority];

  static TaskSortField fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TaskSortField._(value));

  @override
  bool operator ==(other) => other is TaskSortField && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Sort order options
///
/// @nodoc
class TaskSortOrder {
  static const asc = TaskSortOrder._('ASC');
  static const desc = TaskSortOrder._('DESC');

  final String value;

  const TaskSortOrder._(this.value);

  static const values = [asc, desc];

  static TaskSortOrder fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TaskSortOrder._(value));

  @override
  bool operator ==(other) => other is TaskSortOrder && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents a usage metric with its configured limit and current usage value.
///
/// @nodoc
class UsageMetric {
  /// Configured limit for this metric.
  final int limit;

  /// Current usage for this metric
  final double usage;

  UsageMetric({
    required this.limit,
    required this.usage,
  });

  factory UsageMetric.fromJson(Map<String, dynamic> json) {
    return UsageMetric(
      limit: (json['limit'] as int?) ?? 0,
      usage: _s.parseJsonDouble(json['usage']) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final limit = this.limit;
    final usage = this.usage;
    return {
      'limit': limit,
      'usage': _s.encodeJsonDouble(usage),
    };
  }
}

/// Reference information linking a task to external systems - for input with
/// validation
///
/// @nodoc
class ReferenceInput {
  /// Association identifier of the external system
  final String associationId;

  /// The unique identifier in the external system
  final String referenceId;

  /// URL to access the reference in the external system
  final String referenceUrl;

  /// The name of the external system
  final String system;

  /// Optional title for the reference
  final String? title;

  ReferenceInput({
    required this.associationId,
    required this.referenceId,
    required this.referenceUrl,
    required this.system,
    this.title,
  });

  Map<String, dynamic> toJson() {
    final associationId = this.associationId;
    final referenceId = this.referenceId;
    final referenceUrl = this.referenceUrl;
    final system = this.system;
    final title = this.title;
    return {
      'associationId': associationId,
      'referenceId': referenceId,
      'referenceUrl': referenceUrl,
      'system': system,
      if (title != null) 'title': title,
    };
  }
}

/// @nodoc
class Document {
  Document();

  factory Document.fromJson(Map<String, dynamic> _) {
    return Document();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

/// @nodoc
class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

/// @nodoc
class IdentityCenterServiceException extends _s.GenericAwsException {
  IdentityCenterServiceException({String? type, String? message})
      : super(
            type: type,
            code: 'IdentityCenterServiceException',
            message: message);
}

/// @nodoc
class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

/// @nodoc
class InvalidParameterException extends _s.GenericAwsException {
  InvalidParameterException({String? type, String? message})
      : super(type: type, code: 'InvalidParameterException', message: message);
}

/// @nodoc
class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

/// @nodoc
class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

/// @nodoc
class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

/// @nodoc
class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'IdentityCenterServiceException': (type, message) =>
      IdentityCenterServiceException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'InvalidParameterException': (type, message) =>
      InvalidParameterException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
