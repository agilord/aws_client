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

/// The Amazon Web Services Deadline Cloud API provides infrastructure and
/// centralized management for your projects. Use the Deadline Cloud API to
/// onboard users, assign projects, and attach permissions specific to their job
/// function.
///
/// With Deadline Cloud, content production teams can deploy resources for their
/// workforce securely in the cloud, reducing the costs of added physical
/// infrastructure. Keep your content production operations secure, while
/// allowing your contributors to access the tools they need, such as scalable
/// high-speed storage, licenses, and cost management services.
class Deadline {
  final _s.RestJsonProtocol _protocol;
  Deadline({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'deadline',
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

  /// Retrieves multiple jobs in a single request. This is a batch version of
  /// the <code>GetJob</code> API.
  ///
  /// The result of getting each job is reported individually in the response.
  /// Because the batch request can result in a combination of successful and
  /// unsuccessful actions, you should check for batch errors even when the call
  /// returns an HTTP status code of 200.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identifiers] :
  /// The list of job identifiers to retrieve. You can specify up to 100
  /// identifiers per request.
  Future<BatchGetJobResponse> batchGetJob({
    required List<BatchGetJobIdentifier> identifiers,
  }) async {
    final $payload = <String, dynamic>{
      'identifiers': identifiers,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2023-10-12/batch-get-job',
      exceptionFnMap: _exceptionFns,
    );
    return BatchGetJobResponse.fromJson(response);
  }

  /// Retrieves multiple sessions in a single request. This is a batch version
  /// of the <code>GetSession</code> API.
  ///
  /// The result of getting each session is reported individually in the
  /// response. Because the batch request can result in a combination of
  /// successful and unsuccessful actions, you should check for batch errors
  /// even when the call returns an HTTP status code of 200.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identifiers] :
  /// The list of session identifiers to retrieve. You can specify up to 100
  /// identifiers per request.
  Future<BatchGetSessionResponse> batchGetSession({
    required List<BatchGetSessionIdentifier> identifiers,
  }) async {
    final $payload = <String, dynamic>{
      'identifiers': identifiers,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2023-10-12/batch-get-session',
      exceptionFnMap: _exceptionFns,
    );
    return BatchGetSessionResponse.fromJson(response);
  }

  /// Retrieves multiple session actions in a single request. This is a batch
  /// version of the <code>GetSessionAction</code> API.
  ///
  /// The result of getting each session action is reported individually in the
  /// response. Because the batch request can result in a combination of
  /// successful and unsuccessful actions, you should check for batch errors
  /// even when the call returns an HTTP status code of 200.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identifiers] :
  /// The list of session action identifiers to retrieve. You can specify up to
  /// 100 identifiers per request.
  Future<BatchGetSessionActionResponse> batchGetSessionAction({
    required List<BatchGetSessionActionIdentifier> identifiers,
  }) async {
    final $payload = <String, dynamic>{
      'identifiers': identifiers,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2023-10-12/batch-get-session-action',
      exceptionFnMap: _exceptionFns,
    );
    return BatchGetSessionActionResponse.fromJson(response);
  }

  /// Retrieves multiple steps in a single request. This is a batch version of
  /// the <code>GetStep</code> API.
  ///
  /// The result of getting each step is reported individually in the response.
  /// Because the batch request can result in a combination of successful and
  /// unsuccessful actions, you should check for batch errors even when the call
  /// returns an HTTP status code of 200.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identifiers] :
  /// The list of step identifiers to retrieve. You can specify up to 100
  /// identifiers per request.
  Future<BatchGetStepResponse> batchGetStep({
    required List<BatchGetStepIdentifier> identifiers,
  }) async {
    final $payload = <String, dynamic>{
      'identifiers': identifiers,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2023-10-12/batch-get-step',
      exceptionFnMap: _exceptionFns,
    );
    return BatchGetStepResponse.fromJson(response);
  }

  /// Retrieves multiple tasks in a single request. This is a batch version of
  /// the <code>GetTask</code> API.
  ///
  /// The result of getting each task is reported individually in the response.
  /// Because the batch request can result in a combination of successful and
  /// unsuccessful actions, you should check for batch errors even when the call
  /// returns an HTTP status code of 200.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identifiers] :
  /// The list of task identifiers to retrieve. You can specify up to 100
  /// identifiers per request.
  Future<BatchGetTaskResponse> batchGetTask({
    required List<BatchGetTaskIdentifier> identifiers,
  }) async {
    final $payload = <String, dynamic>{
      'identifiers': identifiers,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2023-10-12/batch-get-task',
      exceptionFnMap: _exceptionFns,
    );
    return BatchGetTaskResponse.fromJson(response);
  }

  /// Retrieves multiple workers in a single request. This is a batch version of
  /// the <code>GetWorker</code> API.
  ///
  /// The result of getting each worker is reported individually in the
  /// response. Because the batch request can result in a combination of
  /// successful and unsuccessful actions, you should check for batch errors
  /// even when the call returns an HTTP status code of 200.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identifiers] :
  /// The list of worker identifiers to retrieve. You can specify up to 100
  /// identifiers per request.
  Future<BatchGetWorkerResponse> batchGetWorker({
    required List<BatchGetWorkerIdentifier> identifiers,
  }) async {
    final $payload = <String, dynamic>{
      'identifiers': identifiers,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2023-10-12/batch-get-worker',
      exceptionFnMap: _exceptionFns,
    );
    return BatchGetWorkerResponse.fromJson(response);
  }

  /// Updates multiple jobs in a single request. This is a batch version of the
  /// <code>UpdateJob</code> API.
  ///
  /// The result of updating each job is reported individually in the response.
  /// Because the batch request can result in a combination of successful and
  /// unsuccessful actions, you should check for batch errors even when the call
  /// returns an HTTP status code of 200.
  ///
  /// When you change the status of a job to <code>ARCHIVED</code>, the job
  /// can't be scheduled or archived.
  /// <important>
  /// An archived job and its steps and tasks are deleted after 120 days. The
  /// job can't be recovered.
  /// </important>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [jobs] :
  /// The list of jobs to update. You can specify up to 100 jobs per request.
  ///
  /// Parameter [clientToken] :
  /// The unique token which the server uses to recognize retries of the same
  /// request.
  Future<BatchUpdateJobResponse> batchUpdateJob({
    required List<BatchUpdateJobItem> jobs,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      if (clientToken != null) 'X-Amz-Client-Token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      'jobs': jobs,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/2023-10-12/batch-update-job',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return BatchUpdateJobResponse.fromJson(response);
  }

  /// Updates multiple tasks in a single request. This is a batch version of the
  /// <code>UpdateTask</code> API.
  ///
  /// The result of updating each task is reported individually in the response.
  /// Because the batch request can result in a combination of successful and
  /// unsuccessful actions, you should check for batch errors even when the call
  /// returns an HTTP status code of 200.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [tasks] :
  /// The list of tasks to update. You can specify up to 100 tasks per request.
  ///
  /// Parameter [clientToken] :
  /// The unique token which the server uses to recognize retries of the same
  /// request.
  Future<BatchUpdateTaskResponse> batchUpdateTask({
    required List<BatchUpdateTaskItem> tasks,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      if (clientToken != null) 'X-Amz-Client-Token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      'tasks': tasks,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/2023-10-12/batch-update-task',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return BatchUpdateTaskResponse.fromJson(response);
  }

  /// Creates an association between a queue and a fleet.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The ID of the farm that the queue and fleet belong to.
  ///
  /// Parameter [fleetId] :
  /// The fleet ID.
  ///
  /// Parameter [queueId] :
  /// The queue ID.
  Future<void> createQueueFleetAssociation({
    required String farmId,
    required String fleetId,
    required String queueId,
  }) async {
    final $payload = <String, dynamic>{
      'fleetId': fleetId,
      'queueId': queueId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queue-fleet-associations',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Associates a limit with a particular queue. After the limit is associated,
  /// all workers for jobs that specify the limit associated with the queue are
  /// subject to the limit. You can't associate two limits with the same
  /// <code>amountRequirementName</code> to the same queue.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The unique identifier of the farm that contains the queue and limit to
  /// associate.
  ///
  /// Parameter [limitId] :
  /// The unique identifier of the limit to associate with the queue.
  ///
  /// Parameter [queueId] :
  /// The unique identifier of the queue to associate with the limit.
  Future<void> createQueueLimitAssociation({
    required String farmId,
    required String limitId,
    required String queueId,
  }) async {
    final $payload = <String, dynamic>{
      'limitId': limitId,
      'queueId': queueId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queue-limit-associations',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a queue-fleet association.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID of the farm that holds the queue-fleet association.
  ///
  /// Parameter [fleetId] :
  /// The fleet ID of the queue-fleet association.
  ///
  /// Parameter [queueId] :
  /// The queue ID of the queue-fleet association.
  Future<void> deleteQueueFleetAssociation({
    required String farmId,
    required String fleetId,
    required String queueId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queue-fleet-associations/${Uri.encodeComponent(queueId)}/${Uri.encodeComponent(fleetId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes the association between a queue and a limit. You must use the
  /// <code>UpdateQueueLimitAssociation</code> operation to set the status to
  /// <code>STOP_LIMIT_USAGE_AND_COMPLETE_TASKS</code> or
  /// <code>STOP_LIMIT_USAGE_AND_CANCEL_TASKS</code>. The status does not change
  /// immediately. Use the <code>GetQueueLimitAssociation</code> operation to
  /// see if the status changed to <code>STOPPED</code> before deleting the
  /// association.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The unique identifier of the farm that contains the queue and limit to
  /// disassociate.
  ///
  /// Parameter [limitId] :
  /// The unique identifier of the limit to disassociate.
  ///
  /// Parameter [queueId] :
  /// The unique identifier of the queue to disassociate.
  Future<void> deleteQueueLimitAssociation({
    required String farmId,
    required String limitId,
    required String queueId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queue-limit-associations/${Uri.encodeComponent(queueId)}/${Uri.encodeComponent(limitId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Gets a queue-fleet association.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID of the farm that contains the queue-fleet association.
  ///
  /// Parameter [fleetId] :
  /// The fleet ID for the queue-fleet association.
  ///
  /// Parameter [queueId] :
  /// The queue ID for the queue-fleet association.
  Future<GetQueueFleetAssociationResponse> getQueueFleetAssociation({
    required String farmId,
    required String fleetId,
    required String queueId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queue-fleet-associations/${Uri.encodeComponent(queueId)}/${Uri.encodeComponent(fleetId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetQueueFleetAssociationResponse.fromJson(response);
  }

  /// Gets information about a specific association between a queue and a limit.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The unique identifier of the farm that contains the associated queue and
  /// limit.
  ///
  /// Parameter [limitId] :
  /// The unique identifier of the limit associated with the queue.
  ///
  /// Parameter [queueId] :
  /// The unique identifier of the queue associated with the limit.
  Future<GetQueueLimitAssociationResponse> getQueueLimitAssociation({
    required String farmId,
    required String limitId,
    required String queueId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queue-limit-associations/${Uri.encodeComponent(queueId)}/${Uri.encodeComponent(limitId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetQueueLimitAssociationResponse.fromJson(response);
  }

  /// Gets a set of statistics for queues or farms. Before you can call the
  /// <code>GetSessionStatisticsAggregation</code> operation, you must first
  /// call the <code>StartSessionsStatisticsAggregation</code> operation.
  /// Statistics are available for 1 hour after you call the
  /// <code>StartSessionsStatisticsAggregation</code> operation.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [aggregationId] :
  /// The identifier returned by the
  /// <code>StartSessionsStatisticsAggregation</code> operation that identifies
  /// the aggregated statistics.
  ///
  /// Parameter [farmId] :
  /// The identifier of the farm to include in the statistics. This should be
  /// the same as the farm ID used in the call to the
  /// <code>StartSessionsStatisticsAggregation</code> operation.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or <code>null</code> to start from
  /// the beginning.
  Future<GetSessionsStatisticsAggregationResponse>
      getSessionsStatisticsAggregation({
    required String aggregationId,
    required String farmId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      'aggregationId': [aggregationId],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/sessions-statistics-aggregation',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetSessionsStatisticsAggregationResponse.fromJson(response);
  }

  /// A list of the available metered products.
  ///
  /// May throw [InternalServerErrorException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or <code>null</code> to start from
  /// the beginning.
  Future<ListAvailableMeteredProductsResponse> listAvailableMeteredProducts({
    int? maxResults,
    String? nextToken,
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
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2023-10-12/metered-products',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAvailableMeteredProductsResponse.fromJson(response);
  }

  /// Lists queue-fleet associations.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [farmId] :
  /// The farm ID for the queue-fleet association list.
  ///
  /// Parameter [fleetId] :
  /// The fleet ID for the queue-fleet association list.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or <code>null</code> to start from
  /// the beginning.
  ///
  /// Parameter [queueId] :
  /// The queue ID for the queue-fleet association list.
  Future<ListQueueFleetAssociationsResponse> listQueueFleetAssociations({
    required String farmId,
    String? fleetId,
    int? maxResults,
    String? nextToken,
    String? queueId,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (fleetId != null) 'fleetId': [fleetId],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (queueId != null) 'queueId': [queueId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queue-fleet-associations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListQueueFleetAssociationsResponse.fromJson(response);
  }

  /// Gets a list of the associations between queues and limits defined in a
  /// farm.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [farmId] :
  /// The unique identifier of the farm that contains the limits and
  /// associations.
  ///
  /// Parameter [limitId] :
  /// Specifies that the operation should return only the queue limit
  /// associations for the specified limit. If you specify both the
  /// <code>queueId</code> and the <code>limitId</code>, only the specified
  /// limit is returned if it exists.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of associations to return in each page of results.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or <code>null</code> to start from
  /// the beginning.
  ///
  /// Parameter [queueId] :
  /// Specifies that the operation should return only the queue limit
  /// associations for the specified queue. If you specify both the
  /// <code>queueId</code> and the <code>limitId</code>, only the specified
  /// limit is returned if it exists.
  Future<ListQueueLimitAssociationsResponse> listQueueLimitAssociations({
    required String farmId,
    String? limitId,
    int? maxResults,
    String? nextToken,
    String? queueId,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (limitId != null) 'limitId': [limitId],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (queueId != null) 'queueId': [queueId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queue-limit-associations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListQueueLimitAssociationsResponse.fromJson(response);
  }

  /// Lists tags for a resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The resource ARN to list tags for.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2023-10-12/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Searches for jobs.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID of the job.
  ///
  /// Parameter [itemOffset] :
  /// The offset for the search results.
  ///
  /// Parameter [queueIds] :
  /// The queue ID to use in the job search.
  ///
  /// Parameter [filterExpressions] :
  /// The search terms for a resource.
  ///
  /// Parameter [pageSize] :
  /// Specifies the number of results to return.
  ///
  /// Parameter [sortExpressions] :
  /// The search terms for a resource.
  Future<SearchJobsResponse> searchJobs({
    required String farmId,
    required int itemOffset,
    required List<String> queueIds,
    SearchGroupedFilterExpressions? filterExpressions,
    int? pageSize,
    List<SearchSortExpression>? sortExpressions,
  }) async {
    final $payload = <String, dynamic>{
      'itemOffset': itemOffset,
      'queueIds': queueIds,
      if (filterExpressions != null) 'filterExpressions': filterExpressions,
      if (pageSize != null) 'pageSize': pageSize,
      if (sortExpressions != null) 'sortExpressions': sortExpressions,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/search/jobs',
      exceptionFnMap: _exceptionFns,
    );
    return SearchJobsResponse.fromJson(response);
  }

  /// Searches for steps.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID to use for the step search.
  ///
  /// Parameter [itemOffset] :
  /// The offset for the search results.
  ///
  /// Parameter [queueIds] :
  /// The queue IDs in the step search.
  ///
  /// Parameter [filterExpressions] :
  /// The search terms for a resource.
  ///
  /// Parameter [jobId] :
  /// The job ID to use in the step search.
  ///
  /// Parameter [pageSize] :
  /// Specifies the number of results to return.
  ///
  /// Parameter [sortExpressions] :
  /// The search terms for a resource.
  Future<SearchStepsResponse> searchSteps({
    required String farmId,
    required int itemOffset,
    required List<String> queueIds,
    SearchGroupedFilterExpressions? filterExpressions,
    String? jobId,
    int? pageSize,
    List<SearchSortExpression>? sortExpressions,
  }) async {
    final $payload = <String, dynamic>{
      'itemOffset': itemOffset,
      'queueIds': queueIds,
      if (filterExpressions != null) 'filterExpressions': filterExpressions,
      if (jobId != null) 'jobId': jobId,
      if (pageSize != null) 'pageSize': pageSize,
      if (sortExpressions != null) 'sortExpressions': sortExpressions,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/search/steps',
      exceptionFnMap: _exceptionFns,
    );
    return SearchStepsResponse.fromJson(response);
  }

  /// Searches for tasks.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID of the task.
  ///
  /// Parameter [itemOffset] :
  /// The offset for the search results.
  ///
  /// Parameter [queueIds] :
  /// The queue IDs to include in the search.
  ///
  /// Parameter [filterExpressions] :
  /// The search terms for a resource.
  ///
  /// Parameter [jobId] :
  /// The job ID for the task search.
  ///
  /// Parameter [pageSize] :
  /// Specifies the number of results to return.
  ///
  /// Parameter [sortExpressions] :
  /// The search terms for a resource.
  Future<SearchTasksResponse> searchTasks({
    required String farmId,
    required int itemOffset,
    required List<String> queueIds,
    SearchGroupedFilterExpressions? filterExpressions,
    String? jobId,
    int? pageSize,
    List<SearchSortExpression>? sortExpressions,
  }) async {
    final $payload = <String, dynamic>{
      'itemOffset': itemOffset,
      'queueIds': queueIds,
      if (filterExpressions != null) 'filterExpressions': filterExpressions,
      if (jobId != null) 'jobId': jobId,
      if (pageSize != null) 'pageSize': pageSize,
      if (sortExpressions != null) 'sortExpressions': sortExpressions,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/search/tasks',
      exceptionFnMap: _exceptionFns,
    );
    return SearchTasksResponse.fromJson(response);
  }

  /// Searches for workers.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID in the workers search.
  ///
  /// Parameter [fleetIds] :
  /// The fleet ID of the workers to search for.
  ///
  /// Parameter [itemOffset] :
  /// The offset for the search results.
  ///
  /// Parameter [filterExpressions] :
  /// The search terms for a resource.
  ///
  /// Parameter [pageSize] :
  /// Specifies the number of results to return.
  ///
  /// Parameter [sortExpressions] :
  /// The search terms for a resource.
  Future<SearchWorkersResponse> searchWorkers({
    required String farmId,
    required List<String> fleetIds,
    required int itemOffset,
    SearchGroupedFilterExpressions? filterExpressions,
    int? pageSize,
    List<SearchSortExpression>? sortExpressions,
  }) async {
    final $payload = <String, dynamic>{
      'fleetIds': fleetIds,
      'itemOffset': itemOffset,
      if (filterExpressions != null) 'filterExpressions': filterExpressions,
      if (pageSize != null) 'pageSize': pageSize,
      if (sortExpressions != null) 'sortExpressions': sortExpressions,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/search/workers',
      exceptionFnMap: _exceptionFns,
    );
    return SearchWorkersResponse.fromJson(response);
  }

  /// Starts an asynchronous request for getting aggregated statistics about
  /// queues and farms. Get the statistics using the
  /// <code>GetSessionsStatisticsAggregation</code> operation. You can only have
  /// one running aggregation for your Deadline Cloud farm. Call the
  /// <code>GetSessionsStatisticsAggregation</code> operation and check the
  /// <code>status</code> field to see if an aggregation is running. Statistics
  /// are available for 1 hour after you call the
  /// <code>StartSessionsStatisticsAggregation</code> operation.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [endTime] :
  /// The Linux timestamp of the date and time that the statistics end.
  ///
  /// Parameter [farmId] :
  /// The identifier of the farm that contains queues or fleets to return
  /// statistics for.
  ///
  /// Parameter [groupBy] :
  /// The field to use to group the statistics.
  ///
  /// Parameter [resourceIds] :
  /// A list of fleet IDs or queue IDs to gather statistics for.
  ///
  /// Parameter [startTime] :
  /// The Linux timestamp of the date and time that the statistics start.
  ///
  /// Parameter [statistics] :
  /// One to four statistics to return.
  ///
  /// Parameter [period] :
  /// The period to aggregate the statistics.
  ///
  /// Parameter [timezone] :
  /// The timezone to use for the statistics. Use UTC notation such as "UTC+8."
  Future<StartSessionsStatisticsAggregationResponse>
      startSessionsStatisticsAggregation({
    required DateTime endTime,
    required String farmId,
    required List<UsageGroupByField> groupBy,
    required SessionsStatisticsResources resourceIds,
    required DateTime startTime,
    required List<UsageStatistic> statistics,
    Period? period,
    String? timezone,
  }) async {
    final $payload = <String, dynamic>{
      'endTime': iso8601ToJson(endTime),
      'groupBy': groupBy.map((e) => e.value).toList(),
      'resourceIds': resourceIds,
      'startTime': iso8601ToJson(startTime),
      'statistics': statistics.map((e) => e.value).toList(),
      if (period != null) 'period': period.value,
      if (timezone != null) 'timezone': timezone,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/sessions-statistics-aggregation',
      exceptionFnMap: _exceptionFns,
    );
    return StartSessionsStatisticsAggregationResponse.fromJson(response);
  }

  /// Tags a resource using the resource's ARN and desired tags.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource to apply tags to.
  ///
  /// Parameter [tags] :
  /// Each tag consists of a tag key and a tag value. Tag keys and values are
  /// both required, but tag values can be empty strings.
  Future<void> tagResource({
    required String resourceArn,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2023-10-12/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes a tag from a resource using the resource's ARN and tag to remove.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource to remove the tag from.
  ///
  /// Parameter [tagKeys] :
  /// They keys of the tag.
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
      requestUri: '/2023-10-12/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates a queue-fleet association.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID to update.
  ///
  /// Parameter [fleetId] :
  /// The fleet ID to update.
  ///
  /// Parameter [queueId] :
  /// The queue ID to update.
  ///
  /// Parameter [status] :
  /// The status to update.
  Future<void> updateQueueFleetAssociation({
    required String farmId,
    required String fleetId,
    required String queueId,
    required UpdateQueueFleetAssociationStatus status,
  }) async {
    final $payload = <String, dynamic>{
      'status': status.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queue-fleet-associations/${Uri.encodeComponent(queueId)}/${Uri.encodeComponent(fleetId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the status of the queue. If you set the status to one of the
  /// <code>STOP_LIMIT_USAGE*</code> values, there will be a delay before the
  /// status transitions to the <code>STOPPED</code> state.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The unique identifier of the farm that contains the associated queues and
  /// limits.
  ///
  /// Parameter [limitId] :
  /// The unique identifier of the limit associated to the queue.
  ///
  /// Parameter [queueId] :
  /// The unique identifier of the queue associated to the limit.
  ///
  /// Parameter [status] :
  /// Sets the status of the limit. You can mark the limit active, or you can
  /// stop usage of the limit and either complete existing tasks or cancel any
  /// existing tasks immediately.
  Future<void> updateQueueLimitAssociation({
    required String farmId,
    required String limitId,
    required String queueId,
    required UpdateQueueLimitAssociationStatus status,
  }) async {
    final $payload = <String, dynamic>{
      'status': status.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queue-limit-associations/${Uri.encodeComponent(queueId)}/${Uri.encodeComponent(limitId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates a farm to allow space for queues and fleets. Farms are the space
  /// where the components of your renders gather and are pieced together in the
  /// cloud. Farms contain budgets and allow you to enforce permissions.
  /// Deadline Cloud farms are a useful container for large projects.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [displayName] :
  /// The display name of the farm.
  /// <important>
  /// This field can store any content. Escape or encode this content before
  /// displaying it on a webpage or any other system that might interpret the
  /// content of this field.
  /// </important>
  ///
  /// Parameter [clientToken] :
  /// The unique token which the server uses to recognize retries of the same
  /// request.
  ///
  /// Parameter [costScaleFactor] :
  /// A multiplier applied to the farm's calculated costs for usage data and
  /// budget tracking. A value less than 1 represents a discount, a value
  /// greater than 1 represents a premium, and a value of 1 represents no
  /// adjustment. The default value is 1.
  ///
  /// Parameter [description] :
  /// The description of the farm.
  /// <important>
  /// This field can store any content. Escape or encode this content before
  /// displaying it on a webpage or any other system that might interpret the
  /// content of this field.
  /// </important>
  ///
  /// Parameter [kmsKeyArn] :
  /// The ARN of the KMS key to use on the farm.
  ///
  /// Parameter [tags] :
  /// The tags to add to your farm. Each tag consists of a tag key and a tag
  /// value. Tag keys and values are both required, but tag values can be empty
  /// strings.
  Future<CreateFarmResponse> createFarm({
    required String displayName,
    String? clientToken,
    double? costScaleFactor,
    String? description,
    String? kmsKeyArn,
    Map<String, String>? tags,
  }) async {
    _s.validateNumRange(
      'costScaleFactor',
      costScaleFactor,
      0,
      100,
    );
    final headers = <String, String>{
      if (clientToken != null) 'X-Amz-Client-Token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      'displayName': displayName,
      if (costScaleFactor != null) 'costScaleFactor': costScaleFactor,
      if (description != null) 'description': description,
      if (kmsKeyArn != null) 'kmsKeyArn': kmsKeyArn,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2023-10-12/farms',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreateFarmResponse.fromJson(response);
  }

  /// Get a farm.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID of the farm.
  Future<GetFarmResponse> getFarm({
    required String farmId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2023-10-12/farms/${Uri.encodeComponent(farmId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetFarmResponse.fromJson(response);
  }

  /// Updates a farm.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID to update.
  ///
  /// Parameter [costScaleFactor] :
  /// A multiplier applied to the farm's calculated costs for usage data and
  /// budget tracking. A value less than 1 represents a discount, a value
  /// greater than 1 represents a premium, and a value of 1 represents no
  /// adjustment.
  ///
  /// Parameter [description] :
  /// The description of the farm to update.
  /// <important>
  /// This field can store any content. Escape or encode this content before
  /// displaying it on a webpage or any other system that might interpret the
  /// content of this field.
  /// </important>
  ///
  /// Parameter [displayName] :
  /// The display name of the farm to update.
  /// <important>
  /// This field can store any content. Escape or encode this content before
  /// displaying it on a webpage or any other system that might interpret the
  /// content of this field.
  /// </important>
  Future<void> updateFarm({
    required String farmId,
    double? costScaleFactor,
    String? description,
    String? displayName,
  }) async {
    _s.validateNumRange(
      'costScaleFactor',
      costScaleFactor,
      0,
      100,
    );
    final $payload = <String, dynamic>{
      if (costScaleFactor != null) 'costScaleFactor': costScaleFactor,
      if (description != null) 'description': description,
      if (displayName != null) 'displayName': displayName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/2023-10-12/farms/${Uri.encodeComponent(farmId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a farm.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID of the farm to delete.
  Future<void> deleteFarm({
    required String farmId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/2023-10-12/farms/${Uri.encodeComponent(farmId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists farms.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or <code>null</code> to start from
  /// the beginning.
  ///
  /// Parameter [principalId] :
  /// The principal ID of the member to list on the farm.
  Future<ListFarmsResponse> listFarms({
    int? maxResults,
    String? nextToken,
    String? principalId,
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
      if (principalId != null) 'principalId': [principalId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2023-10-12/farms',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListFarmsResponse.fromJson(response);
  }

  /// Assigns a farm membership level to a member.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The ID of the farm to associate with the member.
  ///
  /// Parameter [identityStoreId] :
  /// The identity store ID of the member to associate with the farm.
  ///
  /// Parameter [membershipLevel] :
  /// The principal's membership level for the associated farm.
  ///
  /// Parameter [principalId] :
  /// The member's principal ID to associate with the farm.
  ///
  /// Parameter [principalType] :
  /// The principal type of the member to associate with the farm.
  Future<void> associateMemberToFarm({
    required String farmId,
    required String identityStoreId,
    required MembershipLevel membershipLevel,
    required String principalId,
    required DeadlinePrincipalType principalType,
  }) async {
    final $payload = <String, dynamic>{
      'identityStoreId': identityStoreId,
      'membershipLevel': membershipLevel.value,
      'principalType': principalType.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/members/${Uri.encodeComponent(principalId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates a limit that manages the distribution of shared resources, such as
  /// floating licenses. A limit can throttle work assignments, help manage
  /// workloads, and track current usage. Before you use a limit, you must
  /// associate the limit with one or more queues.
  ///
  /// You must add the <code>amountRequirementName</code> to a step in a job
  /// template to declare the limit requirement.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [amountRequirementName] :
  /// The value that you specify as the <code>name</code> in the
  /// <code>amounts</code> field of the <code>hostRequirements</code> in a step
  /// of a job template to declare the limit requirement.
  ///
  /// Parameter [displayName] :
  /// The display name of the limit.
  /// <important>
  /// This field can store any content. Escape or encode this content before
  /// displaying it on a webpage or any other system that might interpret the
  /// content of this field.
  /// </important>
  ///
  /// Parameter [farmId] :
  /// The farm ID of the farm that contains the limit.
  ///
  /// Parameter [maxCount] :
  /// The maximum number of resources constrained by this limit. When all of the
  /// resources are in use, steps that require the limit won't be scheduled
  /// until the resource is available.
  ///
  /// The <code>maxCount</code> must not be 0. If the value is -1, there is no
  /// restriction on the number of resources that can be acquired for this
  /// limit.
  ///
  /// Parameter [clientToken] :
  /// The unique token which the server uses to recognize retries of the same
  /// request.
  ///
  /// Parameter [description] :
  /// A description of the limit. A description helps you identify the purpose
  /// of the limit.
  /// <important>
  /// This field can store any content. Escape or encode this content before
  /// displaying it on a webpage or any other system that might interpret the
  /// content of this field.
  /// </important>
  Future<CreateLimitResponse> createLimit({
    required String amountRequirementName,
    required String displayName,
    required String farmId,
    required int maxCount,
    String? clientToken,
    String? description,
  }) async {
    _s.validateNumRange(
      'maxCount',
      maxCount,
      -1,
      2147483647,
      isRequired: true,
    );
    final headers = <String, String>{
      if (clientToken != null) 'X-Amz-Client-Token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      'amountRequirementName': amountRequirementName,
      'displayName': displayName,
      'maxCount': maxCount,
      if (description != null) 'description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/limits',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreateLimitResponse.fromJson(response);
  }

  /// Creates a storage profile that specifies the operating system, file type,
  /// and file location of resources used on a farm.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [displayName] :
  /// The display name of the storage profile.
  /// <important>
  /// This field can store any content. Escape or encode this content before
  /// displaying it on a webpage or any other system that might interpret the
  /// content of this field.
  /// </important>
  ///
  /// Parameter [farmId] :
  /// The farm ID of the farm to connect to the storage profile.
  ///
  /// Parameter [osFamily] :
  /// The type of operating system (OS) for the storage profile.
  ///
  /// Parameter [clientToken] :
  /// The unique token which the server uses to recognize retries of the same
  /// request.
  ///
  /// Parameter [fileSystemLocations] :
  /// File system paths to include in the storage profile.
  Future<CreateStorageProfileResponse> createStorageProfile({
    required String displayName,
    required String farmId,
    required StorageProfileOperatingSystemFamily osFamily,
    String? clientToken,
    List<FileSystemLocation>? fileSystemLocations,
  }) async {
    final headers = <String, String>{
      if (clientToken != null) 'X-Amz-Client-Token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      'displayName': displayName,
      'osFamily': osFamily.value,
      if (fileSystemLocations != null)
        'fileSystemLocations': fileSystemLocations,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/storage-profiles',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreateStorageProfileResponse.fromJson(response);
  }

  /// Removes a limit from the specified farm. Before you delete a limit you
  /// must use the <code>DeleteQueueLimitAssociation</code> operation to remove
  /// the association with any queues.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The unique identifier of the farm that contains the limit to delete.
  ///
  /// Parameter [limitId] :
  /// The unique identifier of the limit to delete.
  Future<void> deleteLimit({
    required String farmId,
    required String limitId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/limits/${Uri.encodeComponent(limitId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a storage profile.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID of the farm from which to remove the storage profile.
  ///
  /// Parameter [storageProfileId] :
  /// The storage profile ID of the storage profile to delete.
  Future<void> deleteStorageProfile({
    required String farmId,
    required String storageProfileId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/storage-profiles/${Uri.encodeComponent(storageProfileId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Disassociates a member from a farm.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID of the farm to disassociate from the member.
  ///
  /// Parameter [principalId] :
  /// A member's principal ID to disassociate from a farm.
  Future<void> disassociateMemberFromFarm({
    required String farmId,
    required String principalId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/members/${Uri.encodeComponent(principalId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Gets information about a specific limit.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The unique identifier of the farm that contains the limit.
  ///
  /// Parameter [limitId] :
  /// The unique identifier of the limit to return.
  Future<GetLimitResponse> getLimit({
    required String farmId,
    required String limitId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/limits/${Uri.encodeComponent(limitId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetLimitResponse.fromJson(response);
  }

  /// Gets a storage profile.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID for the storage profile.
  ///
  /// Parameter [storageProfileId] :
  /// The storage profile ID.
  Future<GetStorageProfileResponse> getStorageProfile({
    required String farmId,
    required String storageProfileId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/storage-profiles/${Uri.encodeComponent(storageProfileId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetStorageProfileResponse.fromJson(response);
  }

  /// Lists the members of a farm.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or <code>null</code> to start from
  /// the beginning.
  Future<ListFarmMembersResponse> listFarmMembers({
    required String farmId,
    int? maxResults,
    String? nextToken,
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
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/members',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListFarmMembersResponse.fromJson(response);
  }

  /// Gets a list of limits defined in the specified farm.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The unique identifier of the farm that contains the limits.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of limits to return in each page of results.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or <code>null</code> to start from
  /// the beginning.
  Future<ListLimitsResponse> listLimits({
    required String farmId,
    int? maxResults,
    String? nextToken,
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
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/limits',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListLimitsResponse.fromJson(response);
  }

  /// Lists storage profiles.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID of the storage profile.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or <code>null</code> to start from
  /// the beginning.
  Future<ListStorageProfilesResponse> listStorageProfiles({
    required String farmId,
    int? maxResults,
    String? nextToken,
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
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/storage-profiles',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListStorageProfilesResponse.fromJson(response);
  }

  /// Updates the properties of the specified limit.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The unique identifier of the farm that contains the limit.
  ///
  /// Parameter [limitId] :
  /// The unique identifier of the limit to update.
  ///
  /// Parameter [description] :
  /// The new description of the limit.
  /// <important>
  /// This field can store any content. Escape or encode this content before
  /// displaying it on a webpage or any other system that might interpret the
  /// content of this field.
  /// </important>
  ///
  /// Parameter [displayName] :
  /// The new display name of the limit.
  /// <important>
  /// This field can store any content. Escape or encode this content before
  /// displaying it on a webpage or any other system that might interpret the
  /// content of this field.
  /// </important>
  ///
  /// Parameter [maxCount] :
  /// The maximum number of resources constrained by this limit. When all of the
  /// resources are in use, steps that require the limit won't be scheduled
  /// until the resource is available.
  ///
  /// If more than the new maximum number is currently in use, running jobs
  /// finish but no new jobs are started until the number of resources in use is
  /// below the new maximum number.
  ///
  /// The <code>maxCount</code> must not be 0. If the value is -1, there is no
  /// restriction on the number of resources that can be acquired for this
  /// limit.
  Future<void> updateLimit({
    required String farmId,
    required String limitId,
    String? description,
    String? displayName,
    int? maxCount,
  }) async {
    _s.validateNumRange(
      'maxCount',
      maxCount,
      -1,
      2147483647,
    );
    final $payload = <String, dynamic>{
      if (description != null) 'description': description,
      if (displayName != null) 'displayName': displayName,
      if (maxCount != null) 'maxCount': maxCount,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/limits/${Uri.encodeComponent(limitId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates a storage profile.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID to update.
  ///
  /// Parameter [storageProfileId] :
  /// The storage profile ID to update.
  ///
  /// Parameter [clientToken] :
  /// The unique token which the server uses to recognize retries of the same
  /// request.
  ///
  /// Parameter [displayName] :
  /// The display name of the storage profile to update.
  /// <important>
  /// This field can store any content. Escape or encode this content before
  /// displaying it on a webpage or any other system that might interpret the
  /// content of this field.
  /// </important>
  ///
  /// Parameter [fileSystemLocationsToAdd] :
  /// The file system location names to add.
  ///
  /// Parameter [fileSystemLocationsToRemove] :
  /// The file system location names to remove.
  ///
  /// Parameter [osFamily] :
  /// The OS system to update.
  Future<void> updateStorageProfile({
    required String farmId,
    required String storageProfileId,
    String? clientToken,
    String? displayName,
    List<FileSystemLocation>? fileSystemLocationsToAdd,
    List<FileSystemLocation>? fileSystemLocationsToRemove,
    StorageProfileOperatingSystemFamily? osFamily,
  }) async {
    final headers = <String, String>{
      if (clientToken != null) 'X-Amz-Client-Token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      if (displayName != null) 'displayName': displayName,
      if (fileSystemLocationsToAdd != null)
        'fileSystemLocationsToAdd': fileSystemLocationsToAdd,
      if (fileSystemLocationsToRemove != null)
        'fileSystemLocationsToRemove': fileSystemLocationsToRemove,
      if (osFamily != null) 'osFamily': osFamily.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/storage-profiles/${Uri.encodeComponent(storageProfileId)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates a budget to set spending thresholds for your rendering activity.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [actions] :
  /// The budget actions to specify what happens when the budget runs out.
  ///
  /// Parameter [approximateDollarLimit] :
  /// The dollar limit based on consumed usage.
  ///
  /// Parameter [displayName] :
  /// The display name of the budget.
  /// <important>
  /// This field can store any content. Escape or encode this content before
  /// displaying it on a webpage or any other system that might interpret the
  /// content of this field.
  /// </important>
  ///
  /// Parameter [farmId] :
  /// The farm ID to include in this budget.
  ///
  /// Parameter [schedule] :
  /// The schedule to associate with this budget.
  ///
  /// Parameter [usageTrackingResource] :
  /// The queue ID provided to this budget to track usage.
  ///
  /// Parameter [clientToken] :
  /// The unique token which the server uses to recognize retries of the same
  /// request.
  ///
  /// Parameter [description] :
  /// The description of the budget.
  /// <important>
  /// This field can store any content. Escape or encode this content before
  /// displaying it on a webpage or any other system that might interpret the
  /// content of this field.
  /// </important>
  ///
  /// Parameter [tags] :
  /// Each tag consists of a tag key and a tag value. Tag keys and values are
  /// both required, but tag values can be empty strings.
  Future<CreateBudgetResponse> createBudget({
    required List<BudgetActionToAdd> actions,
    required double approximateDollarLimit,
    required String displayName,
    required String farmId,
    required BudgetSchedule schedule,
    required UsageTrackingResource usageTrackingResource,
    String? clientToken,
    String? description,
    Map<String, String>? tags,
  }) async {
    _s.validateNumRange(
      'approximateDollarLimit',
      approximateDollarLimit,
      0.01,
      1152921504606846976,
      isRequired: true,
    );
    final headers = <String, String>{
      if (clientToken != null) 'X-Amz-Client-Token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      'actions': actions,
      'approximateDollarLimit': approximateDollarLimit,
      'displayName': displayName,
      'schedule': schedule,
      'usageTrackingResource': usageTrackingResource,
      if (description != null) 'description': description,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/budgets',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreateBudgetResponse.fromJson(response);
  }

  /// Get a budget.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [budgetId] :
  /// The budget ID.
  ///
  /// Parameter [farmId] :
  /// The farm ID of the farm connected to the budget.
  Future<GetBudgetResponse> getBudget({
    required String budgetId,
    required String farmId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/budgets/${Uri.encodeComponent(budgetId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetBudgetResponse.fromJson(response);
  }

  /// Updates a budget that sets spending thresholds for rendering activity.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [budgetId] :
  /// The budget ID to update.
  ///
  /// Parameter [farmId] :
  /// The farm ID of the budget to update.
  ///
  /// Parameter [actionsToAdd] :
  /// The budget actions to add. Budget actions specify what happens when the
  /// budget runs out.
  ///
  /// Parameter [actionsToRemove] :
  /// The budget actions to remove from the budget.
  ///
  /// Parameter [approximateDollarLimit] :
  /// The dollar limit to update on the budget. Based on consumed usage.
  ///
  /// Parameter [clientToken] :
  /// The unique token which the server uses to recognize retries of the same
  /// request.
  ///
  /// Parameter [description] :
  /// The description of the budget to update.
  /// <important>
  /// This field can store any content. Escape or encode this content before
  /// displaying it on a webpage or any other system that might interpret the
  /// content of this field.
  /// </important>
  ///
  /// Parameter [displayName] :
  /// The display name of the budget to update.
  /// <important>
  /// This field can store any content. Escape or encode this content before
  /// displaying it on a webpage or any other system that might interpret the
  /// content of this field.
  /// </important>
  ///
  /// Parameter [schedule] :
  /// The schedule to update.
  ///
  /// Parameter [status] :
  /// Updates the status of the budget.
  ///
  /// <ul>
  /// <li>
  /// <code>ACTIVE</code>–The budget is being evaluated.
  /// </li>
  /// <li>
  /// <code>INACTIVE</code>–The budget is inactive. This can include Expired,
  /// Canceled, or deleted Deleted statuses.
  /// </li>
  /// </ul>
  Future<void> updateBudget({
    required String budgetId,
    required String farmId,
    List<BudgetActionToAdd>? actionsToAdd,
    List<BudgetActionToRemove>? actionsToRemove,
    double? approximateDollarLimit,
    String? clientToken,
    String? description,
    String? displayName,
    BudgetSchedule? schedule,
    BudgetStatus? status,
  }) async {
    _s.validateNumRange(
      'approximateDollarLimit',
      approximateDollarLimit,
      0.01,
      1152921504606846976,
    );
    final headers = <String, String>{
      if (clientToken != null) 'X-Amz-Client-Token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      if (actionsToAdd != null) 'actionsToAdd': actionsToAdd,
      if (actionsToRemove != null) 'actionsToRemove': actionsToRemove,
      if (approximateDollarLimit != null)
        'approximateDollarLimit': approximateDollarLimit,
      if (description != null) 'description': description,
      if (displayName != null) 'displayName': displayName,
      if (schedule != null) 'schedule': schedule,
      if (status != null) 'status': status.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/budgets/${Uri.encodeComponent(budgetId)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a budget.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [budgetId] :
  /// The budget ID of the budget to delete.
  ///
  /// Parameter [farmId] :
  /// The farm ID of the farm to remove from the budget.
  Future<void> deleteBudget({
    required String budgetId,
    required String farmId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/budgets/${Uri.encodeComponent(budgetId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// A list of budgets in a farm.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID associated with the budgets.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or <code>null</code> to start from
  /// the beginning.
  ///
  /// Parameter [status] :
  /// The status to list for the budgets.
  Future<ListBudgetsResponse> listBudgets({
    required String farmId,
    int? maxResults,
    String? nextToken,
    BudgetStatus? status,
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
      if (status != null) 'status': [status.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/budgets',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListBudgetsResponse.fromJson(response);
  }

  /// Creates a fleet. Fleets gather information relating to compute, or
  /// capacity, for renders within your farms. You can choose to manage your own
  /// capacity or opt to have fleets fully managed by Deadline Cloud.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [configuration] :
  /// The configuration settings for the fleet. Customer managed fleets are
  /// self-managed. Service managed Amazon EC2 fleets are managed by Deadline
  /// Cloud.
  ///
  /// Parameter [displayName] :
  /// The display name of the fleet.
  /// <important>
  /// This field can store any content. Escape or encode this content before
  /// displaying it on a webpage or any other system that might interpret the
  /// content of this field.
  /// </important>
  ///
  /// Parameter [farmId] :
  /// The farm ID of the farm to connect to the fleet.
  ///
  /// Parameter [maxWorkerCount] :
  /// The maximum number of workers for the fleet.
  ///
  /// Deadline Cloud limits the number of workers to less than or equal to the
  /// fleet's maximum worker count. The service maintains eventual consistency
  /// for the worker count. If you make multiple rapid calls to
  /// <code>CreateWorker</code> before the field updates, you might exceed your
  /// fleet's maximum worker count. For example, if your
  /// <code>maxWorkerCount</code> is 10 and you currently have 9 workers, making
  /// two quick <code>CreateWorker</code> calls might successfully create 2
  /// workers instead of 1, resulting in 11 total workers.
  ///
  /// Parameter [roleArn] :
  /// The IAM role ARN for the role that the fleet's workers will use.
  ///
  /// Parameter [clientToken] :
  /// The unique token which the server uses to recognize retries of the same
  /// request.
  ///
  /// Parameter [description] :
  /// The description of the fleet.
  /// <important>
  /// This field can store any content. Escape or encode this content before
  /// displaying it on a webpage or any other system that might interpret the
  /// content of this field.
  /// </important>
  ///
  /// Parameter [hostConfiguration] :
  /// Provides a script that runs as a worker is starting up that you can use to
  /// provide additional configuration for workers in your fleet.
  ///
  /// Parameter [minWorkerCount] :
  /// The minimum number of workers for the fleet.
  ///
  /// Parameter [tags] :
  /// Each tag consists of a tag key and a tag value. Tag keys and values are
  /// both required, but tag values can be empty strings.
  Future<CreateFleetResponse> createFleet({
    required FleetConfiguration configuration,
    required String displayName,
    required String farmId,
    required int maxWorkerCount,
    required String roleArn,
    String? clientToken,
    String? description,
    HostConfiguration? hostConfiguration,
    int? minWorkerCount,
    Map<String, String>? tags,
  }) async {
    _s.validateNumRange(
      'maxWorkerCount',
      maxWorkerCount,
      0,
      2147483647,
      isRequired: true,
    );
    _s.validateNumRange(
      'minWorkerCount',
      minWorkerCount,
      0,
      2147483647,
    );
    final headers = <String, String>{
      if (clientToken != null) 'X-Amz-Client-Token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      'configuration': configuration,
      'displayName': displayName,
      'maxWorkerCount': maxWorkerCount,
      'roleArn': roleArn,
      if (description != null) 'description': description,
      if (hostConfiguration != null) 'hostConfiguration': hostConfiguration,
      if (minWorkerCount != null) 'minWorkerCount': minWorkerCount,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/fleets',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreateFleetResponse.fromJson(response);
  }

  /// Get a fleet.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID of the farm in the fleet.
  ///
  /// Parameter [fleetId] :
  /// The fleet ID of the fleet to get.
  Future<GetFleetResponse> getFleet({
    required String farmId,
    required String fleetId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/fleets/${Uri.encodeComponent(fleetId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetFleetResponse.fromJson(response);
  }

  /// Updates a fleet.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID to update.
  ///
  /// Parameter [fleetId] :
  /// The fleet ID to update.
  ///
  /// Parameter [clientToken] :
  /// The unique token which the server uses to recognize retries of the same
  /// request.
  ///
  /// Parameter [configuration] :
  /// The fleet configuration to update.
  ///
  /// Parameter [description] :
  /// The description of the fleet to update.
  /// <important>
  /// This field can store any content. Escape or encode this content before
  /// displaying it on a webpage or any other system that might interpret the
  /// content of this field.
  /// </important>
  ///
  /// Parameter [displayName] :
  /// The display name of the fleet to update.
  /// <important>
  /// This field can store any content. Escape or encode this content before
  /// displaying it on a webpage or any other system that might interpret the
  /// content of this field.
  /// </important>
  ///
  /// Parameter [hostConfiguration] :
  /// Provides a script that runs as a worker is starting up that you can use to
  /// provide additional configuration for workers in your fleet.
  ///
  /// Parameter [maxWorkerCount] :
  /// The maximum number of workers in the fleet.
  ///
  /// Deadline Cloud limits the number of workers to less than or equal to the
  /// fleet's maximum worker count. The service maintains eventual consistency
  /// for the worker count. If you make multiple rapid calls to
  /// <code>CreateWorker</code> before the field updates, you might exceed your
  /// fleet's maximum worker count. For example, if your
  /// <code>maxWorkerCount</code> is 10 and you currently have 9 workers, making
  /// two quick <code>CreateWorker</code> calls might successfully create 2
  /// workers instead of 1, resulting in 11 total workers.
  ///
  /// Parameter [minWorkerCount] :
  /// The minimum number of workers in the fleet.
  ///
  /// Parameter [roleArn] :
  /// The IAM role ARN that the fleet's workers assume while running jobs.
  Future<void> updateFleet({
    required String farmId,
    required String fleetId,
    String? clientToken,
    FleetConfiguration? configuration,
    String? description,
    String? displayName,
    HostConfiguration? hostConfiguration,
    int? maxWorkerCount,
    int? minWorkerCount,
    String? roleArn,
  }) async {
    _s.validateNumRange(
      'maxWorkerCount',
      maxWorkerCount,
      0,
      2147483647,
    );
    _s.validateNumRange(
      'minWorkerCount',
      minWorkerCount,
      0,
      2147483647,
    );
    final headers = <String, String>{
      if (clientToken != null) 'X-Amz-Client-Token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      if (configuration != null) 'configuration': configuration,
      if (description != null) 'description': description,
      if (displayName != null) 'displayName': displayName,
      if (hostConfiguration != null) 'hostConfiguration': hostConfiguration,
      if (maxWorkerCount != null) 'maxWorkerCount': maxWorkerCount,
      if (minWorkerCount != null) 'minWorkerCount': minWorkerCount,
      if (roleArn != null) 'roleArn': roleArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/fleets/${Uri.encodeComponent(fleetId)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a fleet.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID of the farm to remove from the fleet.
  ///
  /// Parameter [fleetId] :
  /// The fleet ID of the fleet to delete.
  ///
  /// Parameter [clientToken] :
  /// The unique token which the server uses to recognize retries of the same
  /// request.
  Future<void> deleteFleet({
    required String farmId,
    required String fleetId,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      if (clientToken != null) 'X-Amz-Client-Token': clientToken.toString(),
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/fleets/${Uri.encodeComponent(fleetId)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists fleets.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID of the fleets.
  ///
  /// Parameter [displayName] :
  /// The display names of a list of fleets.
  /// <important>
  /// This field can store any content. Escape or encode this content before
  /// displaying it on a webpage or any other system that might interpret the
  /// content of this field.
  /// </important>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or <code>null</code> to start from
  /// the beginning.
  ///
  /// Parameter [principalId] :
  /// The principal ID of the members to include in the fleet.
  ///
  /// Parameter [status] :
  /// The status of the fleet.
  Future<ListFleetsResponse> listFleets({
    required String farmId,
    String? displayName,
    int? maxResults,
    String? nextToken,
    String? principalId,
    FleetStatus? status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (displayName != null) 'displayName': [displayName],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (principalId != null) 'principalId': [principalId],
      if (status != null) 'status': [status.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/fleets',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListFleetsResponse.fromJson(response);
  }

  /// Assigns a fleet membership level to a member.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID of the fleet to associate with the member.
  ///
  /// Parameter [fleetId] :
  /// The ID of the fleet to associate with a member.
  ///
  /// Parameter [identityStoreId] :
  /// The member's identity store ID to associate with the fleet.
  ///
  /// Parameter [membershipLevel] :
  /// The principal's membership level for the associated fleet.
  ///
  /// Parameter [principalId] :
  /// The member's principal ID to associate with a fleet.
  ///
  /// Parameter [principalType] :
  /// The member's principal type to associate with the fleet.
  Future<void> associateMemberToFleet({
    required String farmId,
    required String fleetId,
    required String identityStoreId,
    required MembershipLevel membershipLevel,
    required String principalId,
    required DeadlinePrincipalType principalType,
  }) async {
    final $payload = <String, dynamic>{
      'identityStoreId': identityStoreId,
      'membershipLevel': membershipLevel.value,
      'principalType': principalType.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/fleets/${Uri.encodeComponent(fleetId)}/members/${Uri.encodeComponent(principalId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Get Amazon Web Services credentials from the fleet role. The IAM
  /// permissions of the credentials are scoped down to have read-only access.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID for the fleet's farm.
  ///
  /// Parameter [fleetId] :
  /// The fleet ID.
  Future<AssumeFleetRoleForReadResponse> assumeFleetRoleForRead({
    required String farmId,
    required String fleetId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/fleets/${Uri.encodeComponent(fleetId)}/read-roles',
      exceptionFnMap: _exceptionFns,
    );
    return AssumeFleetRoleForReadResponse.fromJson(response);
  }

  /// Disassociates a member from a fleet.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID of the fleet to disassociate a member from.
  ///
  /// Parameter [fleetId] :
  /// The fleet ID of the fleet to from which to disassociate a member.
  ///
  /// Parameter [principalId] :
  /// A member's principal ID to disassociate from a fleet.
  Future<void> disassociateMemberFromFleet({
    required String farmId,
    required String fleetId,
    required String principalId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/fleets/${Uri.encodeComponent(fleetId)}/members/${Uri.encodeComponent(principalId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists fleet members.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID of the fleet.
  ///
  /// Parameter [fleetId] :
  /// The fleet ID to include on the list.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or <code>null</code> to start from
  /// the beginning.
  Future<ListFleetMembersResponse> listFleetMembers({
    required String farmId,
    required String fleetId,
    int? maxResults,
    String? nextToken,
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
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/fleets/${Uri.encodeComponent(fleetId)}/members',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListFleetMembersResponse.fromJson(response);
  }

  /// Gets a persistent volume.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID of the farm that contains the fleet.
  ///
  /// Parameter [fleetId] :
  /// The fleet ID of the fleet that contains the volume.
  ///
  /// Parameter [volumeId] :
  /// The volume ID of the volume to retrieve.
  Future<GetVolumeResponse> getVolume({
    required String farmId,
    required String fleetId,
    required String volumeId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/fleets/${Uri.encodeComponent(fleetId)}/volumes/${Uri.encodeComponent(volumeId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetVolumeResponse.fromJson(response);
  }

  /// Deletes a persistent volume.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID of the farm that contains the fleet.
  ///
  /// Parameter [fleetId] :
  /// The fleet ID of the fleet that contains the volume.
  ///
  /// Parameter [volumeId] :
  /// The volume ID of the volume to delete.
  Future<void> deleteVolume({
    required String farmId,
    required String fleetId,
    required String volumeId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/fleets/${Uri.encodeComponent(fleetId)}/volumes/${Uri.encodeComponent(volumeId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists the persistent volumes in a fleet.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID of the farm that contains the fleet.
  ///
  /// Parameter [fleetId] :
  /// The fleet ID of the fleet that contains the volumes.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or <code>null</code> to start from
  /// the beginning.
  Future<ListVolumesResponse> listVolumes({
    required String farmId,
    required String fleetId,
    int? maxResults,
    String? nextToken,
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
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/fleets/${Uri.encodeComponent(fleetId)}/volumes',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListVolumesResponse.fromJson(response);
  }

  /// Creates a worker. A worker tells your instance how much processing power
  /// (vCPU), and memory (GiB) you’ll need to assemble the digital assets held
  /// within a particular instance. You can specify certain instance types to
  /// use, or let the worker know which instances types to exclude.
  ///
  /// Deadline Cloud limits the number of workers to less than or equal to the
  /// fleet's maximum worker count. The service maintains eventual consistency
  /// for the worker count. If you make multiple rapid calls to
  /// <code>CreateWorker</code> before the field updates, you might exceed your
  /// fleet's maximum worker count. For example, if your
  /// <code>maxWorkerCount</code> is 10 and you currently have 9 workers, making
  /// two quick <code>CreateWorker</code> calls might successfully create 2
  /// workers instead of 1, resulting in 11 total workers.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID of the farm to connect to the worker.
  ///
  /// Parameter [fleetId] :
  /// The fleet ID to connect to the worker.
  ///
  /// Parameter [clientToken] :
  /// The unique token which the server uses to recognize retries of the same
  /// request.
  ///
  /// Parameter [hostProperties] :
  /// The IP address and host name of the worker.
  ///
  /// Parameter [tags] :
  /// Each tag consists of a tag key and a tag value. Tag keys and values are
  /// both required, but tag values can be empty strings.
  Future<CreateWorkerResponse> createWorker({
    required String farmId,
    required String fleetId,
    String? clientToken,
    HostPropertiesRequest? hostProperties,
    Map<String, String>? tags,
  }) async {
    final headers = <String, String>{
      if (clientToken != null) 'X-Amz-Client-Token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      if (hostProperties != null) 'hostProperties': hostProperties,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/fleets/${Uri.encodeComponent(fleetId)}/workers',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreateWorkerResponse.fromJson(response);
  }

  /// Gets a worker.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID for the worker.
  ///
  /// Parameter [fleetId] :
  /// The fleet ID of the worker.
  ///
  /// Parameter [workerId] :
  /// The worker ID.
  Future<GetWorkerResponse> getWorker({
    required String farmId,
    required String fleetId,
    required String workerId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/fleets/${Uri.encodeComponent(fleetId)}/workers/${Uri.encodeComponent(workerId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetWorkerResponse.fromJson(response);
  }

  /// Updates a worker.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID to update.
  ///
  /// Parameter [fleetId] :
  /// The fleet ID to update.
  ///
  /// Parameter [workerId] :
  /// The worker ID to update.
  ///
  /// Parameter [capabilities] :
  /// The worker capabilities to update.
  ///
  /// Parameter [hostProperties] :
  /// The host properties to update.
  ///
  /// Parameter [status] :
  /// The worker status to update.
  Future<UpdateWorkerResponse> updateWorker({
    required String farmId,
    required String fleetId,
    required String workerId,
    WorkerCapabilities? capabilities,
    HostPropertiesRequest? hostProperties,
    UpdatedWorkerStatus? status,
  }) async {
    final $payload = <String, dynamic>{
      if (capabilities != null) 'capabilities': capabilities,
      if (hostProperties != null) 'hostProperties': hostProperties,
      if (status != null) 'status': status.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/fleets/${Uri.encodeComponent(fleetId)}/workers/${Uri.encodeComponent(workerId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateWorkerResponse.fromJson(response);
  }

  /// Deletes a worker.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID of the worker to delete.
  ///
  /// Parameter [fleetId] :
  /// The fleet ID of the worker to delete.
  ///
  /// Parameter [workerId] :
  /// The worker ID of the worker to delete.
  Future<void> deleteWorker({
    required String farmId,
    required String fleetId,
    required String workerId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/fleets/${Uri.encodeComponent(fleetId)}/workers/${Uri.encodeComponent(workerId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists workers.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID connected to the workers.
  ///
  /// Parameter [fleetId] :
  /// The fleet ID of the workers.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or <code>null</code> to start from
  /// the beginning.
  Future<ListWorkersResponse> listWorkers({
    required String farmId,
    required String fleetId,
    int? maxResults,
    String? nextToken,
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
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/fleets/${Uri.encodeComponent(fleetId)}/workers',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListWorkersResponse.fromJson(response);
  }

  /// Get credentials from the fleet role for a worker.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID for the fleet's farm.
  ///
  /// Parameter [fleetId] :
  /// The fleet ID that contains the worker.
  ///
  /// Parameter [workerId] :
  /// The ID of the worker assuming the fleet role.
  Future<AssumeFleetRoleForWorkerResponse> assumeFleetRoleForWorker({
    required String farmId,
    required String fleetId,
    required String workerId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/fleets/${Uri.encodeComponent(fleetId)}/workers/${Uri.encodeComponent(workerId)}/fleet-roles',
      exceptionFnMap: _exceptionFns,
    );
    return AssumeFleetRoleForWorkerResponse.fromJson(response);
  }

  /// Allows a worker to assume a queue role.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID of the worker assuming the queue role.
  ///
  /// Parameter [fleetId] :
  /// The fleet ID of the worker assuming the queue role.
  ///
  /// Parameter [queueId] :
  /// The queue ID of the worker assuming the queue role.
  ///
  /// Parameter [workerId] :
  /// The worker ID of the worker assuming the queue role.
  Future<AssumeQueueRoleForWorkerResponse> assumeQueueRoleForWorker({
    required String farmId,
    required String fleetId,
    required String queueId,
    required String workerId,
  }) async {
    final $query = <String, List<String>>{
      'queueId': [queueId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/fleets/${Uri.encodeComponent(fleetId)}/workers/${Uri.encodeComponent(workerId)}/queue-roles',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return AssumeQueueRoleForWorkerResponse.fromJson(response);
  }

  /// Get batched job details for a worker.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID of the worker that's fetching job details. The worker must
  /// have an assignment on a job to fetch job details.
  ///
  /// Parameter [fleetId] :
  /// The fleet ID of the worker that's fetching job details. The worker must
  /// have an assignment on a job to fetch job details.
  ///
  /// Parameter [identifiers] :
  /// The job identifiers to include within the job entity batch details.
  ///
  /// Parameter [workerId] :
  /// The worker ID of the worker containing the job details to get.
  Future<BatchGetJobEntityResponse> batchGetJobEntity({
    required String farmId,
    required String fleetId,
    required List<JobEntityIdentifiersUnion> identifiers,
    required String workerId,
  }) async {
    final $payload = <String, dynamic>{
      'identifiers': identifiers,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/fleets/${Uri.encodeComponent(fleetId)}/workers/${Uri.encodeComponent(workerId)}/batchGetJobEntity',
      exceptionFnMap: _exceptionFns,
    );
    return BatchGetJobEntityResponse.fromJson(response);
  }

  /// Lists sessions for a worker.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID for the session.
  ///
  /// Parameter [fleetId] :
  /// The fleet ID for the session.
  ///
  /// Parameter [workerId] :
  /// The worker ID for the session.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or <code>null</code> to start from
  /// the beginning.
  Future<ListSessionsForWorkerResponse> listSessionsForWorker({
    required String farmId,
    required String fleetId,
    required String workerId,
    int? maxResults,
    String? nextToken,
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
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/fleets/${Uri.encodeComponent(fleetId)}/workers/${Uri.encodeComponent(workerId)}/sessions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSessionsForWorkerResponse.fromJson(response);
  }

  /// Updates the schedule for a worker.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID to update.
  ///
  /// Parameter [fleetId] :
  /// The fleet ID to update.
  ///
  /// Parameter [workerId] :
  /// The worker ID to update.
  ///
  /// Parameter [updatedSessionActions] :
  /// The session actions associated with the worker schedule to update.
  Future<UpdateWorkerScheduleResponse> updateWorkerSchedule({
    required String farmId,
    required String fleetId,
    required String workerId,
    Map<String, UpdatedSessionActionInfo>? updatedSessionActions,
  }) async {
    final $payload = <String, dynamic>{
      if (updatedSessionActions != null)
        'updatedSessionActions': updatedSessionActions,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/fleets/${Uri.encodeComponent(fleetId)}/workers/${Uri.encodeComponent(workerId)}/schedule',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateWorkerScheduleResponse.fromJson(response);
  }

  /// Creates a queue to coordinate the order in which jobs run on a farm. A
  /// queue can also specify where to pull resources and indicate where to
  /// output completed jobs.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [displayName] :
  /// The display name of the queue.
  /// <important>
  /// This field can store any content. Escape or encode this content before
  /// displaying it on a webpage or any other system that might interpret the
  /// content of this field.
  /// </important>
  ///
  /// Parameter [farmId] :
  /// The farm ID of the farm to connect to the queue.
  ///
  /// Parameter [allowedStorageProfileIds] :
  /// The storage profile IDs to include in the queue.
  ///
  /// Parameter [clientToken] :
  /// The unique token which the server uses to recognize retries of the same
  /// request.
  ///
  /// Parameter [defaultBudgetAction] :
  /// The default action to take on a queue if a budget isn't configured.
  ///
  /// Parameter [description] :
  /// The description of the queue.
  /// <important>
  /// This field can store any content. Escape or encode this content before
  /// displaying it on a webpage or any other system that might interpret the
  /// content of this field.
  /// </important>
  ///
  /// Parameter [jobAttachmentSettings] :
  /// The job attachment settings for the queue. These are the Amazon S3 bucket
  /// name and the Amazon S3 prefix.
  ///
  /// Parameter [jobRunAsUser] :
  /// The jobs in the queue run as the specified POSIX user.
  ///
  /// Parameter [requiredFileSystemLocationNames] :
  /// The file system location name to include in the queue.
  ///
  /// Parameter [roleArn] :
  /// The IAM role ARN that workers will use while running jobs for this queue.
  ///
  /// Parameter [schedulingConfiguration] :
  /// The scheduling configuration for the queue. This configuration determines
  /// how workers are assigned to jobs in the queue.
  ///
  /// If not specified, the queue defaults to the <code>priorityFifo</code>
  /// scheduling configuration.
  ///
  /// Parameter [tags] :
  /// Each tag consists of a tag key and a tag value. Tag keys and values are
  /// both required, but tag values can be empty strings.
  Future<CreateQueueResponse> createQueue({
    required String displayName,
    required String farmId,
    List<String>? allowedStorageProfileIds,
    String? clientToken,
    DefaultQueueBudgetAction? defaultBudgetAction,
    String? description,
    JobAttachmentSettings? jobAttachmentSettings,
    JobRunAsUser? jobRunAsUser,
    List<String>? requiredFileSystemLocationNames,
    String? roleArn,
    SchedulingConfiguration? schedulingConfiguration,
    Map<String, String>? tags,
  }) async {
    final headers = <String, String>{
      if (clientToken != null) 'X-Amz-Client-Token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      'displayName': displayName,
      if (allowedStorageProfileIds != null)
        'allowedStorageProfileIds': allowedStorageProfileIds,
      if (defaultBudgetAction != null)
        'defaultBudgetAction': defaultBudgetAction.value,
      if (description != null) 'description': description,
      if (jobAttachmentSettings != null)
        'jobAttachmentSettings': jobAttachmentSettings,
      if (jobRunAsUser != null) 'jobRunAsUser': jobRunAsUser,
      if (requiredFileSystemLocationNames != null)
        'requiredFileSystemLocationNames': requiredFileSystemLocationNames,
      if (roleArn != null) 'roleArn': roleArn,
      if (schedulingConfiguration != null)
        'schedulingConfiguration': schedulingConfiguration,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreateQueueResponse.fromJson(response);
  }

  /// Gets a queue.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID of the farm in the queue.
  ///
  /// Parameter [queueId] :
  /// The queue ID for the queue to retrieve.
  Future<GetQueueResponse> getQueue({
    required String farmId,
    required String queueId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues/${Uri.encodeComponent(queueId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetQueueResponse.fromJson(response);
  }

  /// Updates a queue.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID to update in the queue.
  ///
  /// Parameter [queueId] :
  /// The queue ID to update.
  ///
  /// Parameter [allowedStorageProfileIdsToAdd] :
  /// The storage profile IDs to add.
  ///
  /// Parameter [allowedStorageProfileIdsToRemove] :
  /// The storage profile ID to remove.
  ///
  /// Parameter [clientToken] :
  /// The idempotency token to update in the queue.
  ///
  /// Parameter [defaultBudgetAction] :
  /// The default action to take for a queue update if a budget isn't
  /// configured.
  ///
  /// Parameter [description] :
  /// The description of the queue to update.
  /// <important>
  /// This field can store any content. Escape or encode this content before
  /// displaying it on a webpage or any other system that might interpret the
  /// content of this field.
  /// </important>
  ///
  /// Parameter [displayName] :
  /// The display name of the queue to update.
  /// <important>
  /// This field can store any content. Escape or encode this content before
  /// displaying it on a webpage or any other system that might interpret the
  /// content of this field.
  /// </important>
  ///
  /// Parameter [jobAttachmentSettings] :
  /// The job attachment settings to update for the queue.
  ///
  /// Parameter [jobRunAsUser] :
  /// Update the jobs in the queue to run as a specified POSIX user.
  ///
  /// Parameter [requiredFileSystemLocationNamesToAdd] :
  /// The required file system location names to add to the queue.
  ///
  /// Parameter [requiredFileSystemLocationNamesToRemove] :
  /// The required file system location names to remove from the queue.
  ///
  /// Parameter [roleArn] :
  /// The IAM role ARN that's used to run jobs from this queue.
  ///
  /// Parameter [schedulingConfiguration] :
  /// The scheduling configuration for the queue. This configuration determines
  /// how workers are assigned to jobs in the queue.
  ///
  /// When updating the scheduling configuration, the entire configuration is
  /// replaced.
  ///
  /// In-progress tasks run to completion before the new scheduling
  /// configuration takes effect.
  Future<void> updateQueue({
    required String farmId,
    required String queueId,
    List<String>? allowedStorageProfileIdsToAdd,
    List<String>? allowedStorageProfileIdsToRemove,
    String? clientToken,
    DefaultQueueBudgetAction? defaultBudgetAction,
    String? description,
    String? displayName,
    JobAttachmentSettings? jobAttachmentSettings,
    JobRunAsUser? jobRunAsUser,
    List<String>? requiredFileSystemLocationNamesToAdd,
    List<String>? requiredFileSystemLocationNamesToRemove,
    String? roleArn,
    SchedulingConfiguration? schedulingConfiguration,
  }) async {
    final headers = <String, String>{
      if (clientToken != null) 'X-Amz-Client-Token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      if (allowedStorageProfileIdsToAdd != null)
        'allowedStorageProfileIdsToAdd': allowedStorageProfileIdsToAdd,
      if (allowedStorageProfileIdsToRemove != null)
        'allowedStorageProfileIdsToRemove': allowedStorageProfileIdsToRemove,
      if (defaultBudgetAction != null)
        'defaultBudgetAction': defaultBudgetAction.value,
      if (description != null) 'description': description,
      if (displayName != null) 'displayName': displayName,
      if (jobAttachmentSettings != null)
        'jobAttachmentSettings': jobAttachmentSettings,
      if (jobRunAsUser != null) 'jobRunAsUser': jobRunAsUser,
      if (requiredFileSystemLocationNamesToAdd != null)
        'requiredFileSystemLocationNamesToAdd':
            requiredFileSystemLocationNamesToAdd,
      if (requiredFileSystemLocationNamesToRemove != null)
        'requiredFileSystemLocationNamesToRemove':
            requiredFileSystemLocationNamesToRemove,
      if (roleArn != null) 'roleArn': roleArn,
      if (schedulingConfiguration != null)
        'schedulingConfiguration': schedulingConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues/${Uri.encodeComponent(queueId)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a queue.
  /// <important>
  /// You can't recover the jobs in a queue if you delete the queue. Deleting
  /// the queue also deletes the jobs in that queue.
  /// </important>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The ID of the farm from which to remove the queue.
  ///
  /// Parameter [queueId] :
  /// The queue ID of the queue to delete.
  Future<void> deleteQueue({
    required String farmId,
    required String queueId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues/${Uri.encodeComponent(queueId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists queues.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID of the queue.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or <code>null</code> to start from
  /// the beginning.
  ///
  /// Parameter [principalId] :
  /// The principal IDs to include in the list of queues.
  ///
  /// Parameter [status] :
  /// The status of the queues listed.
  ///
  /// <ul>
  /// <li>
  /// <code>ACTIVE</code>–The queues are active.
  /// </li>
  /// <li>
  /// <code>SCHEDULING</code>–The queues are scheduling.
  /// </li>
  /// <li>
  /// <code>SCHEDULING_BLOCKED</code>–The queue scheduling is blocked for these
  /// queues.
  /// </li>
  /// </ul>
  Future<ListQueuesResponse> listQueues({
    required String farmId,
    int? maxResults,
    String? nextToken,
    String? principalId,
    QueueStatus? status,
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
      if (principalId != null) 'principalId': [principalId],
      if (status != null) 'status': [status.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListQueuesResponse.fromJson(response);
  }

  /// Assigns a queue membership level to a member
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID of the queue to associate with the member.
  ///
  /// Parameter [identityStoreId] :
  /// The member's identity store ID to associate with the queue.
  ///
  /// Parameter [membershipLevel] :
  /// The principal's membership level for the associated queue.
  ///
  /// Parameter [principalId] :
  /// The member's principal ID to associate with the queue.
  ///
  /// Parameter [principalType] :
  /// The member's principal type to associate with the queue.
  ///
  /// Parameter [queueId] :
  /// The ID of the queue to associate to the member.
  Future<void> associateMemberToQueue({
    required String farmId,
    required String identityStoreId,
    required MembershipLevel membershipLevel,
    required String principalId,
    required DeadlinePrincipalType principalType,
    required String queueId,
  }) async {
    final $payload = <String, dynamic>{
      'identityStoreId': identityStoreId,
      'membershipLevel': membershipLevel.value,
      'principalType': principalType.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues/${Uri.encodeComponent(queueId)}/members/${Uri.encodeComponent(principalId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Gets Amazon Web Services credentials from the queue role. The IAM
  /// permissions of the credentials are scoped down to have read-only access.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID of the farm containing the queue.
  ///
  /// Parameter [queueId] :
  /// The queue ID.
  Future<AssumeQueueRoleForReadResponse> assumeQueueRoleForRead({
    required String farmId,
    required String queueId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues/${Uri.encodeComponent(queueId)}/read-roles',
      exceptionFnMap: _exceptionFns,
    );
    return AssumeQueueRoleForReadResponse.fromJson(response);
  }

  /// Allows a user to assume a role for a queue.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID of the queue that the user assumes the role for.
  ///
  /// Parameter [queueId] :
  /// The queue ID of the queue that the user assumes the role for.
  Future<AssumeQueueRoleForUserResponse> assumeQueueRoleForUser({
    required String farmId,
    required String queueId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues/${Uri.encodeComponent(queueId)}/user-roles',
      exceptionFnMap: _exceptionFns,
    );
    return AssumeQueueRoleForUserResponse.fromJson(response);
  }

  /// Creates an environment for a queue that defines how jobs in the queue run.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID of the farm to connect to the environment.
  ///
  /// Parameter [priority] :
  /// Sets the priority of the environments in the queue from 0 to 10,000, where
  /// 0 is the highest priority (activated first and deactivated last). If two
  /// environments share the same priority value, the environment created first
  /// takes higher priority.
  ///
  /// Parameter [queueId] :
  /// The queue ID to connect the queue and environment.
  ///
  /// Parameter [template] :
  /// The environment template to use in the queue.
  ///
  /// Parameter [templateType] :
  /// The template's file type, <code>JSON</code> or <code>YAML</code>.
  ///
  /// Parameter [clientToken] :
  /// The unique token which the server uses to recognize retries of the same
  /// request.
  Future<CreateQueueEnvironmentResponse> createQueueEnvironment({
    required String farmId,
    required int priority,
    required String queueId,
    required String template,
    required EnvironmentTemplateType templateType,
    String? clientToken,
  }) async {
    _s.validateNumRange(
      'priority',
      priority,
      0,
      10000,
      isRequired: true,
    );
    final headers = <String, String>{
      if (clientToken != null) 'X-Amz-Client-Token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      'priority': priority,
      'template': template,
      'templateType': templateType.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues/${Uri.encodeComponent(queueId)}/environments',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreateQueueEnvironmentResponse.fromJson(response);
  }

  /// Deletes a queue environment.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID of the farm from which to remove the queue environment.
  ///
  /// Parameter [queueEnvironmentId] :
  /// The queue environment ID of the queue environment to delete.
  ///
  /// Parameter [queueId] :
  /// The queue ID of the queue environment to delete.
  Future<void> deleteQueueEnvironment({
    required String farmId,
    required String queueEnvironmentId,
    required String queueId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues/${Uri.encodeComponent(queueId)}/environments/${Uri.encodeComponent(queueEnvironmentId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Disassociates a member from a queue.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID for the queue to disassociate from a member.
  ///
  /// Parameter [principalId] :
  /// A member's principal ID to disassociate from a queue.
  ///
  /// Parameter [queueId] :
  /// The queue ID of the queue in which you're disassociating from a member.
  Future<void> disassociateMemberFromQueue({
    required String farmId,
    required String principalId,
    required String queueId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues/${Uri.encodeComponent(queueId)}/members/${Uri.encodeComponent(principalId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Gets a queue environment.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID for the queue environment.
  ///
  /// Parameter [queueEnvironmentId] :
  /// The queue environment ID.
  ///
  /// Parameter [queueId] :
  /// The queue ID for the queue environment.
  Future<GetQueueEnvironmentResponse> getQueueEnvironment({
    required String farmId,
    required String queueEnvironmentId,
    required String queueId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues/${Uri.encodeComponent(queueId)}/environments/${Uri.encodeComponent(queueEnvironmentId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetQueueEnvironmentResponse.fromJson(response);
  }

  /// Gets a storage profile for a queue.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID for the queue in storage profile.
  ///
  /// Parameter [queueId] :
  /// The queue ID the queue in the storage profile.
  ///
  /// Parameter [storageProfileId] :
  /// The storage profile ID for the storage profile in the queue.
  Future<GetStorageProfileForQueueResponse> getStorageProfileForQueue({
    required String farmId,
    required String queueId,
    required String storageProfileId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues/${Uri.encodeComponent(queueId)}/storage-profiles/${Uri.encodeComponent(storageProfileId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetStorageProfileForQueueResponse.fromJson(response);
  }

  /// Lists queue environments.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID for the queue environment list.
  ///
  /// Parameter [queueId] :
  /// The queue ID for the queue environment list.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or <code>null</code> to start from
  /// the beginning.
  Future<ListQueueEnvironmentsResponse> listQueueEnvironments({
    required String farmId,
    required String queueId,
    int? maxResults,
    String? nextToken,
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
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues/${Uri.encodeComponent(queueId)}/environments',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListQueueEnvironmentsResponse.fromJson(response);
  }

  /// Lists the members in a queue.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID for the queue.
  ///
  /// Parameter [queueId] :
  /// The queue ID to include on the list.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or <code>null</code> to start from
  /// the beginning.
  Future<ListQueueMembersResponse> listQueueMembers({
    required String farmId,
    required String queueId,
    int? maxResults,
    String? nextToken,
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
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues/${Uri.encodeComponent(queueId)}/members',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListQueueMembersResponse.fromJson(response);
  }

  /// Lists storage profiles for a queue.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID of the queue's storage profile.
  ///
  /// Parameter [queueId] :
  /// The queue ID for the storage profile.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or <code>null</code> to start from
  /// the beginning.
  Future<ListStorageProfilesForQueueResponse> listStorageProfilesForQueue({
    required String farmId,
    required String queueId,
    int? maxResults,
    String? nextToken,
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
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues/${Uri.encodeComponent(queueId)}/storage-profiles',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListStorageProfilesForQueueResponse.fromJson(response);
  }

  /// Updates the queue environment.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID of the queue environment to update.
  ///
  /// Parameter [queueEnvironmentId] :
  /// The queue environment ID to update.
  ///
  /// Parameter [queueId] :
  /// The queue ID of the queue environment to update.
  ///
  /// Parameter [clientToken] :
  /// The unique token which the server uses to recognize retries of the same
  /// request.
  ///
  /// Parameter [priority] :
  /// The priority to update.
  ///
  /// Parameter [template] :
  /// The template to update.
  ///
  /// Parameter [templateType] :
  /// The template type to update.
  Future<void> updateQueueEnvironment({
    required String farmId,
    required String queueEnvironmentId,
    required String queueId,
    String? clientToken,
    int? priority,
    String? template,
    EnvironmentTemplateType? templateType,
  }) async {
    _s.validateNumRange(
      'priority',
      priority,
      0,
      10000,
    );
    final headers = <String, String>{
      if (clientToken != null) 'X-Amz-Client-Token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      if (priority != null) 'priority': priority,
      if (template != null) 'template': template,
      if (templateType != null) 'templateType': templateType.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues/${Uri.encodeComponent(queueId)}/environments/${Uri.encodeComponent(queueEnvironmentId)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates a job. A job is a set of instructions that Deadline Cloud uses to
  /// schedule and run work on available workers. For more information, see <a
  /// href="https://docs.aws.amazon.com/deadline-cloud/latest/userguide/deadline-cloud-jobs.html">Deadline
  /// Cloud jobs</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID of the farm to connect to the job.
  ///
  /// Parameter [priority] :
  /// The priority of the job. The highest priority (first scheduled) is 100.
  /// When two jobs have the same priority, the oldest job is scheduled first.
  ///
  /// Parameter [queueId] :
  /// The ID of the queue that the job is submitted to.
  ///
  /// Parameter [attachments] :
  /// The attachments for the job. Attach files required for the job to run to a
  /// render job.
  ///
  /// Parameter [clientToken] :
  /// The unique token which the server uses to recognize retries of the same
  /// request.
  ///
  /// Parameter [descriptionOverride] :
  /// A custom description to override the job description derived from the job
  /// template.
  ///
  /// Parameter [maxFailedTasksCount] :
  /// The number of task failures before the job stops running and is marked as
  /// <code>FAILED</code>.
  ///
  /// Parameter [maxRetriesPerTask] :
  /// The maximum number of retries for each task.
  ///
  /// Parameter [maxWorkerCount] :
  /// The maximum number of worker hosts that can concurrently process a job.
  /// When the <code>maxWorkerCount</code> is reached, no more workers will be
  /// assigned to process the job, even if the fleets assigned to the job's
  /// queue has available workers.
  ///
  /// You can't set the <code>maxWorkerCount</code> to 0. If you set it to -1,
  /// there is no maximum number of workers.
  ///
  /// If you don't specify the <code>maxWorkerCount</code>, Deadline Cloud won't
  /// throttle the number of workers used to process the job.
  ///
  /// Parameter [nameOverride] :
  /// A custom name to override the job name derived from the job template.
  ///
  /// Parameter [parameters] :
  /// The parameters for the job.
  ///
  /// Parameter [sourceJobId] :
  /// The job ID for the source job.
  ///
  /// Parameter [storageProfileId] :
  /// The storage profile ID for the storage profile to connect to the job.
  ///
  /// Parameter [tags] :
  /// The tags to add to your job. Each tag consists of a tag key and a tag
  /// value. Tag keys and values are both required, but tag values can be empty
  /// strings.
  ///
  /// Parameter [targetTaskRunStatus] :
  /// The initial job status when it is created. Jobs that are created with a
  /// <code>SUSPENDED</code> status will not run until manually requeued.
  ///
  /// Parameter [template] :
  /// The job template to use for this job.
  ///
  /// Parameter [templateType] :
  /// The file type for the job template.
  Future<CreateJobResponse> createJob({
    required String farmId,
    required int priority,
    required String queueId,
    Attachments? attachments,
    String? clientToken,
    String? descriptionOverride,
    int? maxFailedTasksCount,
    int? maxRetriesPerTask,
    int? maxWorkerCount,
    String? nameOverride,
    Map<String, JobParameter>? parameters,
    String? sourceJobId,
    String? storageProfileId,
    Map<String, String>? tags,
    CreateJobTargetTaskRunStatus? targetTaskRunStatus,
    String? template,
    JobTemplateType? templateType,
  }) async {
    _s.validateNumRange(
      'priority',
      priority,
      0,
      100,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxFailedTasksCount',
      maxFailedTasksCount,
      0,
      2147483647,
    );
    _s.validateNumRange(
      'maxRetriesPerTask',
      maxRetriesPerTask,
      0,
      2147483647,
    );
    _s.validateNumRange(
      'maxWorkerCount',
      maxWorkerCount,
      -1,
      2147483647,
    );
    final headers = <String, String>{
      if (clientToken != null) 'X-Amz-Client-Token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      'priority': priority,
      if (attachments != null) 'attachments': attachments,
      if (descriptionOverride != null)
        'descriptionOverride': descriptionOverride,
      if (maxFailedTasksCount != null)
        'maxFailedTasksCount': maxFailedTasksCount,
      if (maxRetriesPerTask != null) 'maxRetriesPerTask': maxRetriesPerTask,
      if (maxWorkerCount != null) 'maxWorkerCount': maxWorkerCount,
      if (nameOverride != null) 'nameOverride': nameOverride,
      if (parameters != null) 'parameters': parameters,
      if (sourceJobId != null) 'sourceJobId': sourceJobId,
      if (storageProfileId != null) 'storageProfileId': storageProfileId,
      if (tags != null) 'tags': tags,
      if (targetTaskRunStatus != null)
        'targetTaskRunStatus': targetTaskRunStatus.value,
      if (template != null) 'template': template,
      if (templateType != null) 'templateType': templateType.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues/${Uri.encodeComponent(queueId)}/jobs',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreateJobResponse.fromJson(response);
  }

  /// Gets a Deadline Cloud job.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID of the farm in the job.
  ///
  /// Parameter [jobId] :
  /// The job ID.
  ///
  /// Parameter [queueId] :
  /// The queue ID associated with the job.
  Future<GetJobResponse> getJob({
    required String farmId,
    required String jobId,
    required String queueId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues/${Uri.encodeComponent(queueId)}/jobs/${Uri.encodeComponent(jobId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetJobResponse.fromJson(response);
  }

  /// Updates a job.
  ///
  /// When you change the status of the job to <code>ARCHIVED</code>, the job
  /// can't be scheduled or archived.
  /// <important>
  /// An archived jobs and its steps and tasks are deleted after 120 days. The
  /// job can't be recovered.
  /// </important>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID of the job to update.
  ///
  /// Parameter [jobId] :
  /// The job ID to update.
  ///
  /// Parameter [queueId] :
  /// The queue ID of the job to update.
  ///
  /// Parameter [clientToken] :
  /// The unique token which the server uses to recognize retries of the same
  /// request.
  ///
  /// Parameter [description] :
  /// The updated job description.
  ///
  /// Parameter [lifecycleStatus] :
  /// The status of a job in its lifecycle. When you change the status of the
  /// job to <code>ARCHIVED</code>, the job can't be scheduled or archived.
  /// <important>
  /// An archived jobs and its steps and tasks are deleted after 120 days. The
  /// job can't be recovered.
  /// </important>
  ///
  /// Parameter [maxFailedTasksCount] :
  /// The number of task failures before the job stops running and is marked as
  /// <code>FAILED</code>.
  ///
  /// Parameter [maxRetriesPerTask] :
  /// The maximum number of retries for a job.
  ///
  /// Parameter [maxWorkerCount] :
  /// The maximum number of worker hosts that can concurrently process a job.
  /// When the <code>maxWorkerCount</code> is reached, no more workers will be
  /// assigned to process the job, even if the fleets assigned to the job's
  /// queue has available workers.
  ///
  /// You can't set the <code>maxWorkerCount</code> to 0. If you set it to -1,
  /// there is no maximum number of workers.
  ///
  /// If you don't specify the <code>maxWorkerCount</code>, the default is -1.
  ///
  /// The maximum number of workers that can process tasks in the job.
  ///
  /// Parameter [name] :
  /// The updated job name.
  ///
  /// Parameter [priority] :
  /// The updated job priority.
  ///
  /// Parameter [targetTaskRunStatus] :
  /// The task status to update the job's tasks to.
  Future<void> updateJob({
    required String farmId,
    required String jobId,
    required String queueId,
    String? clientToken,
    String? description,
    UpdateJobLifecycleStatus? lifecycleStatus,
    int? maxFailedTasksCount,
    int? maxRetriesPerTask,
    int? maxWorkerCount,
    String? name,
    int? priority,
    JobTargetTaskRunStatus? targetTaskRunStatus,
  }) async {
    _s.validateNumRange(
      'maxFailedTasksCount',
      maxFailedTasksCount,
      0,
      2147483647,
    );
    _s.validateNumRange(
      'maxRetriesPerTask',
      maxRetriesPerTask,
      0,
      2147483647,
    );
    _s.validateNumRange(
      'maxWorkerCount',
      maxWorkerCount,
      -1,
      2147483647,
    );
    _s.validateNumRange(
      'priority',
      priority,
      0,
      100,
    );
    final headers = <String, String>{
      if (clientToken != null) 'X-Amz-Client-Token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      if (description != null) 'description': description,
      if (lifecycleStatus != null) 'lifecycleStatus': lifecycleStatus.value,
      if (maxFailedTasksCount != null)
        'maxFailedTasksCount': maxFailedTasksCount,
      if (maxRetriesPerTask != null) 'maxRetriesPerTask': maxRetriesPerTask,
      if (maxWorkerCount != null) 'maxWorkerCount': maxWorkerCount,
      if (name != null) 'name': name,
      if (priority != null) 'priority': priority,
      if (targetTaskRunStatus != null)
        'targetTaskRunStatus': targetTaskRunStatus.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues/${Uri.encodeComponent(queueId)}/jobs/${Uri.encodeComponent(jobId)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists jobs.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID for the jobs.
  ///
  /// Parameter [queueId] :
  /// The queue ID for the job.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or <code>null</code> to start from
  /// the beginning.
  ///
  /// Parameter [principalId] :
  /// The principal ID of the members on the jobs.
  Future<ListJobsResponse> listJobs({
    required String farmId,
    required String queueId,
    int? maxResults,
    String? nextToken,
    String? principalId,
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
      if (principalId != null) 'principalId': [principalId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues/${Uri.encodeComponent(queueId)}/jobs',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListJobsResponse.fromJson(response);
  }

  /// Assigns a job membership level to a member
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID of the job to associate with the member.
  ///
  /// Parameter [identityStoreId] :
  /// The member's identity store ID to associate with the job.
  ///
  /// Parameter [jobId] :
  /// The job ID to associate with the member.
  ///
  /// Parameter [membershipLevel] :
  /// The principal's membership level for the associated job.
  ///
  /// Parameter [principalId] :
  /// The member's principal ID to associate with the job.
  ///
  /// Parameter [principalType] :
  /// The member's principal type to associate with the job.
  ///
  /// Parameter [queueId] :
  /// The queue ID to associate to the member.
  Future<void> associateMemberToJob({
    required String farmId,
    required String identityStoreId,
    required String jobId,
    required MembershipLevel membershipLevel,
    required String principalId,
    required DeadlinePrincipalType principalType,
    required String queueId,
  }) async {
    final $payload = <String, dynamic>{
      'identityStoreId': identityStoreId,
      'membershipLevel': membershipLevel.value,
      'principalType': principalType.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues/${Uri.encodeComponent(queueId)}/jobs/${Uri.encodeComponent(jobId)}/members/${Uri.encodeComponent(principalId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Copies a job template to an Amazon S3 bucket.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID to copy.
  ///
  /// Parameter [jobId] :
  /// The job ID to copy.
  ///
  /// Parameter [queueId] :
  /// The queue ID to copy.
  ///
  /// Parameter [targetS3Location] :
  /// The Amazon S3 bucket name and key where you would like to add a copy of
  /// the job template.
  Future<CopyJobTemplateResponse> copyJobTemplate({
    required String farmId,
    required String jobId,
    required String queueId,
    required S3Location targetS3Location,
  }) async {
    final $payload = <String, dynamic>{
      'targetS3Location': targetS3Location,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues/${Uri.encodeComponent(queueId)}/jobs/${Uri.encodeComponent(jobId)}/template',
      exceptionFnMap: _exceptionFns,
    );
    return CopyJobTemplateResponse.fromJson(response);
  }

  /// Disassociates a member from a job.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID for the job to disassociate from the member.
  ///
  /// Parameter [jobId] :
  /// The job ID to disassociate from a member in a job.
  ///
  /// Parameter [principalId] :
  /// A member's principal ID to disassociate from a job.
  ///
  /// Parameter [queueId] :
  /// The queue ID connected to a job for which you're disassociating a member.
  Future<void> disassociateMemberFromJob({
    required String farmId,
    required String jobId,
    required String principalId,
    required String queueId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues/${Uri.encodeComponent(queueId)}/jobs/${Uri.encodeComponent(jobId)}/members/${Uri.encodeComponent(principalId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Gets a session.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID for the session.
  ///
  /// Parameter [jobId] :
  /// The job ID for the session.
  ///
  /// Parameter [queueId] :
  /// The queue ID for the session.
  ///
  /// Parameter [sessionId] :
  /// The session ID.
  Future<GetSessionResponse> getSession({
    required String farmId,
    required String jobId,
    required String queueId,
    required String sessionId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues/${Uri.encodeComponent(queueId)}/jobs/${Uri.encodeComponent(jobId)}/sessions/${Uri.encodeComponent(sessionId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetSessionResponse.fromJson(response);
  }

  /// Gets a session action for the job.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID for the session action.
  ///
  /// Parameter [jobId] :
  /// The job ID for the session.
  ///
  /// Parameter [queueId] :
  /// The queue ID for the session action.
  ///
  /// Parameter [sessionActionId] :
  /// The session action ID for the session.
  Future<GetSessionActionResponse> getSessionAction({
    required String farmId,
    required String jobId,
    required String queueId,
    required String sessionActionId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues/${Uri.encodeComponent(queueId)}/jobs/${Uri.encodeComponent(jobId)}/session-actions/${Uri.encodeComponent(sessionActionId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetSessionActionResponse.fromJson(response);
  }

  /// Gets a step.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID for the step.
  ///
  /// Parameter [jobId] :
  /// The job ID for the step.
  ///
  /// Parameter [queueId] :
  /// The queue ID for the step.
  ///
  /// Parameter [stepId] :
  /// The step ID.
  Future<GetStepResponse> getStep({
    required String farmId,
    required String jobId,
    required String queueId,
    required String stepId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues/${Uri.encodeComponent(queueId)}/jobs/${Uri.encodeComponent(jobId)}/steps/${Uri.encodeComponent(stepId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetStepResponse.fromJson(response);
  }

  /// Gets a task.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID of the farm connected to the task.
  ///
  /// Parameter [jobId] :
  /// The job ID of the job connected to the task.
  ///
  /// Parameter [queueId] :
  /// The queue ID for the queue connected to the task.
  ///
  /// Parameter [stepId] :
  /// The step ID for the step connected to the task.
  ///
  /// Parameter [taskId] :
  /// The task ID.
  Future<GetTaskResponse> getTask({
    required String farmId,
    required String jobId,
    required String queueId,
    required String stepId,
    required String taskId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues/${Uri.encodeComponent(queueId)}/jobs/${Uri.encodeComponent(jobId)}/steps/${Uri.encodeComponent(stepId)}/tasks/${Uri.encodeComponent(taskId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetTaskResponse.fromJson(response);
  }

  /// Lists members on a job.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID of the job to list.
  ///
  /// Parameter [jobId] :
  /// The job ID to include on the list.
  ///
  /// Parameter [queueId] :
  /// The queue ID to include on the list.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or <code>null</code> to start from
  /// the beginning.
  Future<ListJobMembersResponse> listJobMembers({
    required String farmId,
    required String jobId,
    required String queueId,
    int? maxResults,
    String? nextToken,
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
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues/${Uri.encodeComponent(queueId)}/jobs/${Uri.encodeComponent(jobId)}/members',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListJobMembersResponse.fromJson(response);
  }

  /// Lists parameter definitions of a job.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID of the job to list.
  ///
  /// Parameter [jobId] :
  /// The job ID to include on the list.
  ///
  /// Parameter [queueId] :
  /// The queue ID to include on the list.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or <code>null</code> to start from
  /// the beginning.
  Future<ListJobParameterDefinitionsResponse> listJobParameterDefinitions({
    required String farmId,
    required String jobId,
    required String queueId,
    int? maxResults,
    String? nextToken,
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
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues/${Uri.encodeComponent(queueId)}/jobs/${Uri.encodeComponent(jobId)}/parameter-definitions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListJobParameterDefinitionsResponse.fromJson(response);
  }

  /// Lists session actions.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID for the session actions list.
  ///
  /// Parameter [jobId] :
  /// The job ID for the session actions list.
  ///
  /// Parameter [queueId] :
  /// The queue ID for the session actions list.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or <code>null</code> to start from
  /// the beginning.
  ///
  /// Parameter [sessionId] :
  /// The session ID to include on the sessions action list.
  ///
  /// Parameter [taskId] :
  /// The task ID for the session actions list.
  Future<ListSessionActionsResponse> listSessionActions({
    required String farmId,
    required String jobId,
    required String queueId,
    int? maxResults,
    String? nextToken,
    String? sessionId,
    String? taskId,
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
      if (taskId != null) 'taskId': [taskId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues/${Uri.encodeComponent(queueId)}/jobs/${Uri.encodeComponent(jobId)}/session-actions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSessionActionsResponse.fromJson(response);
  }

  /// Lists sessions.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID for the list of sessions.
  ///
  /// Parameter [jobId] :
  /// The job ID for the list of sessions.
  ///
  /// Parameter [queueId] :
  /// The queue ID for the list of sessions
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or <code>null</code> to start from
  /// the beginning.
  Future<ListSessionsResponse> listSessions({
    required String farmId,
    required String jobId,
    required String queueId,
    int? maxResults,
    String? nextToken,
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
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues/${Uri.encodeComponent(queueId)}/jobs/${Uri.encodeComponent(jobId)}/sessions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSessionsResponse.fromJson(response);
  }

  /// Lists step consumers.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID for the list of step consumers.
  ///
  /// Parameter [jobId] :
  /// The job ID for the step consumer.
  ///
  /// Parameter [queueId] :
  /// The queue ID for the step consumer.
  ///
  /// Parameter [stepId] :
  /// The step ID to include on the list.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or <code>null</code> to start from
  /// the beginning.
  Future<ListStepConsumersResponse> listStepConsumers({
    required String farmId,
    required String jobId,
    required String queueId,
    required String stepId,
    int? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues/${Uri.encodeComponent(queueId)}/jobs/${Uri.encodeComponent(jobId)}/steps/${Uri.encodeComponent(stepId)}/consumers',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListStepConsumersResponse.fromJson(response);
  }

  /// Lists the dependencies for a step.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID for the step dependencies list.
  ///
  /// Parameter [jobId] :
  /// The job ID for the step dependencies list.
  ///
  /// Parameter [queueId] :
  /// The queue ID for the step dependencies list.
  ///
  /// Parameter [stepId] :
  /// The step ID to include on the list.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or <code>null</code> to start from
  /// the beginning.
  Future<ListStepDependenciesResponse> listStepDependencies({
    required String farmId,
    required String jobId,
    required String queueId,
    required String stepId,
    int? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues/${Uri.encodeComponent(queueId)}/jobs/${Uri.encodeComponent(jobId)}/steps/${Uri.encodeComponent(stepId)}/dependencies',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListStepDependenciesResponse.fromJson(response);
  }

  /// Lists steps for a job.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID to include on the list of steps.
  ///
  /// Parameter [jobId] :
  /// The job ID to include on the list of steps.
  ///
  /// Parameter [queueId] :
  /// The queue ID to include on the list of steps.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or <code>null</code> to start from
  /// the beginning.
  Future<ListStepsResponse> listSteps({
    required String farmId,
    required String jobId,
    required String queueId,
    int? maxResults,
    String? nextToken,
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
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues/${Uri.encodeComponent(queueId)}/jobs/${Uri.encodeComponent(jobId)}/steps',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListStepsResponse.fromJson(response);
  }

  /// Lists tasks for a job.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID connected to the tasks.
  ///
  /// Parameter [jobId] :
  /// The job ID for the tasks.
  ///
  /// Parameter [queueId] :
  /// The queue ID connected to the tasks.
  ///
  /// Parameter [stepId] :
  /// The step ID for the tasks.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or <code>null</code> to start from
  /// the beginning.
  Future<ListTasksResponse> listTasks({
    required String farmId,
    required String jobId,
    required String queueId,
    required String stepId,
    int? maxResults,
    String? nextToken,
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
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues/${Uri.encodeComponent(queueId)}/jobs/${Uri.encodeComponent(jobId)}/steps/${Uri.encodeComponent(stepId)}/tasks',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListTasksResponse.fromJson(response);
  }

  /// Updates a session.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID to update in the session.
  ///
  /// Parameter [jobId] :
  /// The job ID to update in the session.
  ///
  /// Parameter [queueId] :
  /// The queue ID to update in the session.
  ///
  /// Parameter [sessionId] :
  /// The session ID to update.
  ///
  /// Parameter [targetLifecycleStatus] :
  /// The life cycle status to update in the session.
  ///
  /// Parameter [clientToken] :
  /// The unique token which the server uses to recognize retries of the same
  /// request.
  Future<void> updateSession({
    required String farmId,
    required String jobId,
    required String queueId,
    required String sessionId,
    required SessionLifecycleTargetStatus targetLifecycleStatus,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      if (clientToken != null) 'X-Amz-Client-Token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      'targetLifecycleStatus': targetLifecycleStatus.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues/${Uri.encodeComponent(queueId)}/jobs/${Uri.encodeComponent(jobId)}/sessions/${Uri.encodeComponent(sessionId)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates a step.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID to update.
  ///
  /// Parameter [jobId] :
  /// The job ID to update.
  ///
  /// Parameter [queueId] :
  /// The queue ID to update.
  ///
  /// Parameter [stepId] :
  /// The step ID to update.
  ///
  /// Parameter [targetTaskRunStatus] :
  /// The task status to update the step's tasks to.
  ///
  /// Parameter [clientToken] :
  /// The unique token which the server uses to recognize retries of the same
  /// request.
  Future<void> updateStep({
    required String farmId,
    required String jobId,
    required String queueId,
    required String stepId,
    required StepTargetTaskRunStatus targetTaskRunStatus,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      if (clientToken != null) 'X-Amz-Client-Token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      'targetTaskRunStatus': targetTaskRunStatus.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues/${Uri.encodeComponent(queueId)}/jobs/${Uri.encodeComponent(jobId)}/steps/${Uri.encodeComponent(stepId)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates a task.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID to update.
  ///
  /// Parameter [jobId] :
  /// The job ID to update.
  ///
  /// Parameter [queueId] :
  /// The queue ID to update.
  ///
  /// Parameter [stepId] :
  /// The step ID to update.
  ///
  /// Parameter [targetRunStatus] :
  /// The run status with which to start the task.
  ///
  /// Parameter [taskId] :
  /// The task ID to update.
  ///
  /// Parameter [clientToken] :
  /// The unique token which the server uses to recognize retries of the same
  /// request.
  Future<void> updateTask({
    required String farmId,
    required String jobId,
    required String queueId,
    required String stepId,
    required TaskTargetRunStatus targetRunStatus,
    required String taskId,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      if (clientToken != null) 'X-Amz-Client-Token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      'targetRunStatus': targetRunStatus.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues/${Uri.encodeComponent(queueId)}/jobs/${Uri.encodeComponent(jobId)}/steps/${Uri.encodeComponent(stepId)}/tasks/${Uri.encodeComponent(taskId)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates a license endpoint to integrate your various licensed software
  /// used for rendering on Deadline Cloud.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [securityGroupIds] :
  /// The security group IDs.
  ///
  /// Parameter [subnetIds] :
  /// The subnet IDs.
  ///
  /// Parameter [vpcId] :
  /// The VPC (virtual private cloud) ID to use with the license endpoint.
  ///
  /// Parameter [clientToken] :
  /// The unique token which the server uses to recognize retries of the same
  /// request.
  ///
  /// Parameter [tags] :
  /// Each tag consists of a tag key and a tag value. Tag keys and values are
  /// both required, but tag values can be empty strings.
  Future<CreateLicenseEndpointResponse> createLicenseEndpoint({
    required List<String> securityGroupIds,
    required List<String> subnetIds,
    required String vpcId,
    String? clientToken,
    Map<String, String>? tags,
  }) async {
    final headers = <String, String>{
      if (clientToken != null) 'X-Amz-Client-Token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      'securityGroupIds': securityGroupIds,
      'subnetIds': subnetIds,
      'vpcId': vpcId,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2023-10-12/license-endpoints',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreateLicenseEndpointResponse.fromJson(response);
  }

  /// Gets a licence endpoint.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [licenseEndpointId] :
  /// The license endpoint ID.
  Future<GetLicenseEndpointResponse> getLicenseEndpoint({
    required String licenseEndpointId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/license-endpoints/${Uri.encodeComponent(licenseEndpointId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetLicenseEndpointResponse.fromJson(response);
  }

  /// Deletes a license endpoint.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [licenseEndpointId] :
  /// The license endpoint ID of the license endpoint to delete.
  Future<void> deleteLicenseEndpoint({
    required String licenseEndpointId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2023-10-12/license-endpoints/${Uri.encodeComponent(licenseEndpointId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists license endpoints.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or <code>null</code> to start from
  /// the beginning.
  Future<ListLicenseEndpointsResponse> listLicenseEndpoints({
    int? maxResults,
    String? nextToken,
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
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2023-10-12/license-endpoints',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListLicenseEndpointsResponse.fromJson(response);
  }

  /// Deletes a metered product.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [licenseEndpointId] :
  /// The ID of the license endpoint from which to remove the metered product.
  ///
  /// Parameter [productId] :
  /// The product ID to remove from the license endpoint.
  Future<void> deleteMeteredProduct({
    required String licenseEndpointId,
    required String productId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2023-10-12/license-endpoints/${Uri.encodeComponent(licenseEndpointId)}/metered-products/${Uri.encodeComponent(productId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists metered products.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [licenseEndpointId] :
  /// The license endpoint ID to include on the list of metered products.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or <code>null</code> to start from
  /// the beginning.
  Future<ListMeteredProductsResponse> listMeteredProducts({
    required String licenseEndpointId,
    int? maxResults,
    String? nextToken,
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
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/license-endpoints/${Uri.encodeComponent(licenseEndpointId)}/metered-products',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListMeteredProductsResponse.fromJson(response);
  }

  /// Adds a metered product.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [licenseEndpointId] :
  /// The license endpoint ID to add to the metered product.
  ///
  /// Parameter [productId] :
  /// The product ID to add to the metered product.
  Future<void> putMeteredProduct({
    required String licenseEndpointId,
    required String productId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri:
          '/2023-10-12/license-endpoints/${Uri.encodeComponent(licenseEndpointId)}/metered-products/${Uri.encodeComponent(productId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates an Amazon Web Services Deadline Cloud monitor that you can use to
  /// view your farms, queues, and fleets. After you submit a job, you can track
  /// the progress of the tasks and steps that make up the job, and then
  /// download the job's results.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [displayName] :
  /// The name that you give the monitor that is displayed in the Deadline Cloud
  /// console.
  /// <important>
  /// This field can store any content. Escape or encode this content before
  /// displaying it on a webpage or any other system that might interpret the
  /// content of this field.
  /// </important>
  ///
  /// Parameter [identityCenterInstanceArn] :
  /// The Amazon Resource Name of the IAM Identity Center instance that
  /// authenticates monitor users.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name of the IAM role that the monitor uses to connect
  /// to Deadline Cloud. Every user that signs in to the monitor using IAM
  /// Identity Center uses this role to access Deadline Cloud resources.
  ///
  /// Parameter [subdomain] :
  /// The subdomain to use when creating the monitor URL. The full URL of the
  /// monitor is subdomain.Region.deadlinecloud.amazonaws.com.
  ///
  /// Parameter [clientToken] :
  /// The unique token which the server uses to recognize retries of the same
  /// request.
  ///
  /// Parameter [identityCenterRegion] :
  /// The Region where IAM Identity Center is enabled. Required when IAM
  /// Identity Center is in a different Region than the monitor.
  ///
  /// Parameter [tags] :
  /// The tags to add to your monitor. Each tag consists of a tag key and a tag
  /// value. Tag keys and values are both required, but tag values can be empty
  /// strings.
  Future<CreateMonitorResponse> createMonitor({
    required String displayName,
    required String identityCenterInstanceArn,
    required String roleArn,
    required String subdomain,
    String? clientToken,
    String? identityCenterRegion,
    Map<String, String>? tags,
  }) async {
    final headers = <String, String>{
      if (clientToken != null) 'X-Amz-Client-Token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      'displayName': displayName,
      'identityCenterInstanceArn': identityCenterInstanceArn,
      'roleArn': roleArn,
      'subdomain': subdomain,
      if (identityCenterRegion != null)
        'identityCenterRegion': identityCenterRegion,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2023-10-12/monitors',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreateMonitorResponse.fromJson(response);
  }

  /// Gets information about the specified monitor.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [monitorId] :
  /// The unique identifier for the monitor. This ID is returned by the
  /// <code>CreateMonitor</code> operation.
  Future<GetMonitorResponse> getMonitor({
    required String monitorId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2023-10-12/monitors/${Uri.encodeComponent(monitorId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetMonitorResponse.fromJson(response);
  }

  /// Modifies the settings for a Deadline Cloud monitor. You can modify one or
  /// all of the settings when you call <code>UpdateMonitor</code>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [monitorId] :
  /// The unique identifier of the monitor to update.
  ///
  /// Parameter [displayName] :
  /// The new value to use for the monitor's display name.
  /// <important>
  /// This field can store any content. Escape or encode this content before
  /// displaying it on a webpage or any other system that might interpret the
  /// content of this field.
  /// </important>
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name of the new IAM role to use with the monitor.
  ///
  /// Parameter [subdomain] :
  /// The new value of the subdomain to use when forming the monitor URL.
  Future<void> updateMonitor({
    required String monitorId,
    String? displayName,
    String? roleArn,
    String? subdomain,
  }) async {
    final $payload = <String, dynamic>{
      if (displayName != null) 'displayName': displayName,
      if (roleArn != null) 'roleArn': roleArn,
      if (subdomain != null) 'subdomain': subdomain,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/2023-10-12/monitors/${Uri.encodeComponent(monitorId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes a Deadline Cloud monitor. After you delete a monitor, you can
  /// create a new one and attach farms to the monitor.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [monitorId] :
  /// The unique identifier of the monitor to delete. This ID is returned by the
  /// <code>CreateMonitor</code> operation, and is included in the response to
  /// the <code>GetMonitor</code> operation.
  Future<void> deleteMonitor({
    required String monitorId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/2023-10-12/monitors/${Uri.encodeComponent(monitorId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Gets a list of your monitors in Deadline Cloud.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or <code>null</code> to start from
  /// the beginning.
  Future<ListMonitorsResponse> listMonitors({
    int? maxResults,
    String? nextToken,
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
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2023-10-12/monitors',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListMonitorsResponse.fromJson(response);
  }

  /// Gets the settings for a Deadline Cloud monitor.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [monitorId] :
  /// The unique identifier of the monitor. This ID is returned by the
  /// <code>CreateMonitor</code> operation, and is included in the response to
  /// the <code>ListMonitors</code> operation.
  Future<GetMonitorSettingsResponse> getMonitorSettings({
    required String monitorId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/monitors/${Uri.encodeComponent(monitorId)}/settings',
      exceptionFnMap: _exceptionFns,
    );
    return GetMonitorSettingsResponse.fromJson(response);
  }

  /// Updates the settings for a Deadline Cloud monitor. Keys present in the
  /// request are upserted; keys absent are left unchanged. Send an empty string
  /// value to delete a key.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [monitorId] :
  /// The unique identifier of the monitor to update settings for.
  ///
  /// Parameter [settings] :
  /// The monitor settings to update as key-value pairs. Keys present in the
  /// request are upserted; keys absent are left unchanged. Send an empty string
  /// value to delete a key.
  Future<void> updateMonitorSettings({
    required String monitorId,
    required Map<String, String> settings,
  }) async {
    final $payload = <String, dynamic>{
      'settings': settings,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/2023-10-12/monitors/${Uri.encodeComponent(monitorId)}/settings',
      exceptionFnMap: _exceptionFns,
    );
  }
}

class BatchGetJobResponse {
  /// A list of errors for jobs that could not be retrieved.
  final List<BatchGetJobError> errors;

  /// A list of jobs that were successfully retrieved.
  final List<BatchGetJobItem> jobs;

  BatchGetJobResponse({
    required this.errors,
    required this.jobs,
  });

  factory BatchGetJobResponse.fromJson(Map<String, dynamic> json) {
    return BatchGetJobResponse(
      errors: ((json['errors'] as List?) ?? const [])
          .nonNulls
          .map((e) => BatchGetJobError.fromJson(e as Map<String, dynamic>))
          .toList(),
      jobs: ((json['jobs'] as List?) ?? const [])
          .nonNulls
          .map((e) => BatchGetJobItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    final jobs = this.jobs;
    return {
      'errors': errors,
      'jobs': jobs,
    };
  }
}

class BatchGetSessionResponse {
  /// A list of errors for sessions that could not be retrieved.
  final List<BatchGetSessionError> errors;

  /// A list of sessions that were successfully retrieved.
  final List<BatchGetSessionItem> sessions;

  BatchGetSessionResponse({
    required this.errors,
    required this.sessions,
  });

  factory BatchGetSessionResponse.fromJson(Map<String, dynamic> json) {
    return BatchGetSessionResponse(
      errors: ((json['errors'] as List?) ?? const [])
          .nonNulls
          .map((e) => BatchGetSessionError.fromJson(e as Map<String, dynamic>))
          .toList(),
      sessions: ((json['sessions'] as List?) ?? const [])
          .nonNulls
          .map((e) => BatchGetSessionItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    final sessions = this.sessions;
    return {
      'errors': errors,
      'sessions': sessions,
    };
  }
}

class BatchGetSessionActionResponse {
  /// A list of errors for session actions that could not be retrieved.
  final List<BatchGetSessionActionError> errors;

  /// A list of session actions that were successfully retrieved.
  final List<BatchGetSessionActionItem> sessionActions;

  BatchGetSessionActionResponse({
    required this.errors,
    required this.sessionActions,
  });

  factory BatchGetSessionActionResponse.fromJson(Map<String, dynamic> json) {
    return BatchGetSessionActionResponse(
      errors: ((json['errors'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              BatchGetSessionActionError.fromJson(e as Map<String, dynamic>))
          .toList(),
      sessionActions: ((json['sessionActions'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              BatchGetSessionActionItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    final sessionActions = this.sessionActions;
    return {
      'errors': errors,
      'sessionActions': sessionActions,
    };
  }
}

class BatchGetStepResponse {
  /// A list of errors for steps that could not be retrieved.
  final List<BatchGetStepError> errors;

  /// A list of steps that were successfully retrieved.
  final List<BatchGetStepItem> steps;

  BatchGetStepResponse({
    required this.errors,
    required this.steps,
  });

  factory BatchGetStepResponse.fromJson(Map<String, dynamic> json) {
    return BatchGetStepResponse(
      errors: ((json['errors'] as List?) ?? const [])
          .nonNulls
          .map((e) => BatchGetStepError.fromJson(e as Map<String, dynamic>))
          .toList(),
      steps: ((json['steps'] as List?) ?? const [])
          .nonNulls
          .map((e) => BatchGetStepItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    final steps = this.steps;
    return {
      'errors': errors,
      'steps': steps,
    };
  }
}

class BatchGetTaskResponse {
  /// A list of errors for tasks that could not be retrieved.
  final List<BatchGetTaskError> errors;

  /// A list of tasks that were successfully retrieved.
  final List<BatchGetTaskItem> tasks;

  BatchGetTaskResponse({
    required this.errors,
    required this.tasks,
  });

  factory BatchGetTaskResponse.fromJson(Map<String, dynamic> json) {
    return BatchGetTaskResponse(
      errors: ((json['errors'] as List?) ?? const [])
          .nonNulls
          .map((e) => BatchGetTaskError.fromJson(e as Map<String, dynamic>))
          .toList(),
      tasks: ((json['tasks'] as List?) ?? const [])
          .nonNulls
          .map((e) => BatchGetTaskItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    final tasks = this.tasks;
    return {
      'errors': errors,
      'tasks': tasks,
    };
  }
}

class BatchGetWorkerResponse {
  /// A list of errors for workers that could not be retrieved.
  final List<BatchGetWorkerError> errors;

  /// A list of workers that were successfully retrieved.
  final List<BatchGetWorkerItem> workers;

  BatchGetWorkerResponse({
    required this.errors,
    required this.workers,
  });

  factory BatchGetWorkerResponse.fromJson(Map<String, dynamic> json) {
    return BatchGetWorkerResponse(
      errors: ((json['errors'] as List?) ?? const [])
          .nonNulls
          .map((e) => BatchGetWorkerError.fromJson(e as Map<String, dynamic>))
          .toList(),
      workers: ((json['workers'] as List?) ?? const [])
          .nonNulls
          .map((e) => BatchGetWorkerItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    final workers = this.workers;
    return {
      'errors': errors,
      'workers': workers,
    };
  }
}

class BatchUpdateJobResponse {
  /// A list of errors for jobs that could not be updated.
  final List<BatchUpdateJobError> errors;

  BatchUpdateJobResponse({
    required this.errors,
  });

  factory BatchUpdateJobResponse.fromJson(Map<String, dynamic> json) {
    return BatchUpdateJobResponse(
      errors: ((json['errors'] as List?) ?? const [])
          .nonNulls
          .map((e) => BatchUpdateJobError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    return {
      'errors': errors,
    };
  }
}

class BatchUpdateTaskResponse {
  /// A list of errors for tasks that could not be updated.
  final List<BatchUpdateTaskError> errors;

  BatchUpdateTaskResponse({
    required this.errors,
  });

  factory BatchUpdateTaskResponse.fromJson(Map<String, dynamic> json) {
    return BatchUpdateTaskResponse(
      errors: ((json['errors'] as List?) ?? const [])
          .nonNulls
          .map((e) => BatchUpdateTaskError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    return {
      'errors': errors,
    };
  }
}

class CreateQueueFleetAssociationResponse {
  CreateQueueFleetAssociationResponse();

  factory CreateQueueFleetAssociationResponse.fromJson(Map<String, dynamic> _) {
    return CreateQueueFleetAssociationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class CreateQueueLimitAssociationResponse {
  CreateQueueLimitAssociationResponse();

  factory CreateQueueLimitAssociationResponse.fromJson(Map<String, dynamic> _) {
    return CreateQueueLimitAssociationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteQueueFleetAssociationResponse {
  DeleteQueueFleetAssociationResponse();

  factory DeleteQueueFleetAssociationResponse.fromJson(Map<String, dynamic> _) {
    return DeleteQueueFleetAssociationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteQueueLimitAssociationResponse {
  DeleteQueueLimitAssociationResponse();

  factory DeleteQueueLimitAssociationResponse.fromJson(Map<String, dynamic> _) {
    return DeleteQueueLimitAssociationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Domain fields for QueueFleetAssociation summary/response shapes, ordered
/// before timestamps.
class GetQueueFleetAssociationResponse {
  /// The date and time the resource was created.
  final DateTime createdAt;

  /// The user or system that created this resource.
  final String createdBy;

  /// The fleet ID for the queue-fleet association.
  final String fleetId;

  /// The queue ID for the queue-fleet association.
  final String queueId;

  /// The status of the queue-fleet association.
  final QueueFleetAssociationStatus status;

  /// The date and time the resource was updated.
  final DateTime? updatedAt;

  /// The user or system that updated this resource.
  final String? updatedBy;

  GetQueueFleetAssociationResponse({
    required this.createdAt,
    required this.createdBy,
    required this.fleetId,
    required this.queueId,
    required this.status,
    this.updatedAt,
    this.updatedBy,
  });

  factory GetQueueFleetAssociationResponse.fromJson(Map<String, dynamic> json) {
    return GetQueueFleetAssociationResponse(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      createdBy: (json['createdBy'] as String?) ?? '',
      fleetId: (json['fleetId'] as String?) ?? '',
      queueId: (json['queueId'] as String?) ?? '',
      status: QueueFleetAssociationStatus.fromString(
          (json['status'] as String?) ?? ''),
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final fleetId = this.fleetId;
    final queueId = this.queueId;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'createdBy': createdBy,
      'fleetId': fleetId,
      'queueId': queueId,
      'status': status.value,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

/// Domain fields for QueueLimitAssociation summary/response shapes, ordered
/// before timestamps.
class GetQueueLimitAssociationResponse {
  /// The Unix timestamp of the date and time that the association was created.
  final DateTime createdAt;

  /// The user identifier of the person that created the association.
  final String createdBy;

  /// The unique identifier of the limit associated with the queue.
  final String limitId;

  /// The unique identifier of the queue associated with the limit.
  final String queueId;

  /// The current status of the limit.
  final QueueLimitAssociationStatus status;

  /// The Unix timestamp of the date and time that the association was last
  /// updated.
  final DateTime? updatedAt;

  /// The user identifier of the person that last updated the association.
  final String? updatedBy;

  GetQueueLimitAssociationResponse({
    required this.createdAt,
    required this.createdBy,
    required this.limitId,
    required this.queueId,
    required this.status,
    this.updatedAt,
    this.updatedBy,
  });

  factory GetQueueLimitAssociationResponse.fromJson(Map<String, dynamic> json) {
    return GetQueueLimitAssociationResponse(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      createdBy: (json['createdBy'] as String?) ?? '',
      limitId: (json['limitId'] as String?) ?? '',
      queueId: (json['queueId'] as String?) ?? '',
      status: QueueLimitAssociationStatus.fromString(
          (json['status'] as String?) ?? ''),
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final limitId = this.limitId;
    final queueId = this.queueId;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'createdBy': createdBy,
      'limitId': limitId,
      'queueId': queueId,
      'status': status.value,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

/// Shared pagination field for List operation outputs (nextToken).
class GetSessionsStatisticsAggregationResponse {
  /// The status of the aggregated results. An aggregation may fail or time out if
  /// the results are too large. If this happens, you can call the
  /// <code>StartSessionsStatisticsAggregation</code> operation after you reduce
  /// the aggregation time frame, reduce the number of queues or fleets in the
  /// aggregation, or increase the period length.
  ///
  /// If you call the <code>StartSessionsStatisticsAggregation </code> operation
  /// when the status is <code>IN_PROGRESS</code>, you will receive a
  /// <code>ThrottlingException</code>.
  final SessionsStatisticsAggregationStatus status;

  /// If Deadline Cloud returns <code>nextToken</code>, then there are more
  /// results available. The value of <code>nextToken</code> is a unique
  /// pagination token for each page. To retrieve the next page, call the
  /// operation again using the returned token. Keep all other arguments
  /// unchanged. If no results remain, then <code>nextToken</code> is set to
  /// <code>null</code>. Each pagination token expires after 24 hours. If you
  /// provide a token that isn't valid, then you receive an HTTP 400
  /// <code>ValidationException</code> error.
  final String? nextToken;

  /// The statistics for the specified fleets or queues.
  final List<Statistics>? statistics;

  /// A message that describes the status.
  final String? statusMessage;

  GetSessionsStatisticsAggregationResponse({
    required this.status,
    this.nextToken,
    this.statistics,
    this.statusMessage,
  });

  factory GetSessionsStatisticsAggregationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetSessionsStatisticsAggregationResponse(
      status: SessionsStatisticsAggregationStatus.fromString(
          (json['status'] as String?) ?? ''),
      nextToken: json['nextToken'] as String?,
      statistics: (json['statistics'] as List?)
          ?.nonNulls
          .map((e) => Statistics.fromJson(e as Map<String, dynamic>))
          .toList(),
      statusMessage: json['statusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final nextToken = this.nextToken;
    final statistics = this.statistics;
    final statusMessage = this.statusMessage;
    return {
      'status': status.value,
      if (nextToken != null) 'nextToken': nextToken,
      if (statistics != null) 'statistics': statistics,
      if (statusMessage != null) 'statusMessage': statusMessage,
    };
  }
}

/// Shared pagination field for List operation outputs (nextToken).
class ListAvailableMeteredProductsResponse {
  /// The metered products.
  final List<MeteredProductSummary> meteredProducts;

  /// If Deadline Cloud returns <code>nextToken</code>, then there are more
  /// results available. The value of <code>nextToken</code> is a unique
  /// pagination token for each page. To retrieve the next page, call the
  /// operation again using the returned token. Keep all other arguments
  /// unchanged. If no results remain, then <code>nextToken</code> is set to
  /// <code>null</code>. Each pagination token expires after 24 hours. If you
  /// provide a token that isn't valid, then you receive an HTTP 400
  /// <code>ValidationException</code> error.
  final String? nextToken;

  ListAvailableMeteredProductsResponse({
    required this.meteredProducts,
    this.nextToken,
  });

  factory ListAvailableMeteredProductsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListAvailableMeteredProductsResponse(
      meteredProducts: ((json['meteredProducts'] as List?) ?? const [])
          .nonNulls
          .map((e) => MeteredProductSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final meteredProducts = this.meteredProducts;
    final nextToken = this.nextToken;
    return {
      'meteredProducts': meteredProducts,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Shared pagination field for List operation outputs (nextToken).
class ListQueueFleetAssociationsResponse {
  /// The queue-fleet associations on the list.
  final List<QueueFleetAssociationSummary> queueFleetAssociations;

  /// If Deadline Cloud returns <code>nextToken</code>, then there are more
  /// results available. The value of <code>nextToken</code> is a unique
  /// pagination token for each page. To retrieve the next page, call the
  /// operation again using the returned token. Keep all other arguments
  /// unchanged. If no results remain, then <code>nextToken</code> is set to
  /// <code>null</code>. Each pagination token expires after 24 hours. If you
  /// provide a token that isn't valid, then you receive an HTTP 400
  /// <code>ValidationException</code> error.
  final String? nextToken;

  ListQueueFleetAssociationsResponse({
    required this.queueFleetAssociations,
    this.nextToken,
  });

  factory ListQueueFleetAssociationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListQueueFleetAssociationsResponse(
      queueFleetAssociations: ((json['queueFleetAssociations'] as List?) ??
              const [])
          .nonNulls
          .map((e) =>
              QueueFleetAssociationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final queueFleetAssociations = this.queueFleetAssociations;
    final nextToken = this.nextToken;
    return {
      'queueFleetAssociations': queueFleetAssociations,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Shared pagination field for List operation outputs (nextToken).
class ListQueueLimitAssociationsResponse {
  /// A list of associations between limits and queues in the farm specified in
  /// the request.
  final List<QueueLimitAssociationSummary> queueLimitAssociations;

  /// If Deadline Cloud returns <code>nextToken</code>, then there are more
  /// results available. The value of <code>nextToken</code> is a unique
  /// pagination token for each page. To retrieve the next page, call the
  /// operation again using the returned token. Keep all other arguments
  /// unchanged. If no results remain, then <code>nextToken</code> is set to
  /// <code>null</code>. Each pagination token expires after 24 hours. If you
  /// provide a token that isn't valid, then you receive an HTTP 400
  /// <code>ValidationException</code> error.
  final String? nextToken;

  ListQueueLimitAssociationsResponse({
    required this.queueLimitAssociations,
    this.nextToken,
  });

  factory ListQueueLimitAssociationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListQueueLimitAssociationsResponse(
      queueLimitAssociations: ((json['queueLimitAssociations'] as List?) ??
              const [])
          .nonNulls
          .map((e) =>
              QueueLimitAssociationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final queueLimitAssociations = this.queueLimitAssociations;
    final nextToken = this.nextToken;
    return {
      'queueLimitAssociations': queueLimitAssociations,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListTagsForResourceResponse {
  /// Each tag consists of a tag key and a tag value. Tag keys and values are both
  /// required, but tag values can be empty strings.
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

/// Shared output fields for all Search operations (nextItemOffset,
/// totalResults).
class SearchJobsResponse {
  /// The jobs in the search.
  final List<JobSearchSummary> jobs;

  /// The total number of results in the search.
  final int totalResults;

  /// The next item offset for the search results.
  final int? nextItemOffset;

  SearchJobsResponse({
    required this.jobs,
    required this.totalResults,
    this.nextItemOffset,
  });

  factory SearchJobsResponse.fromJson(Map<String, dynamic> json) {
    return SearchJobsResponse(
      jobs: ((json['jobs'] as List?) ?? const [])
          .nonNulls
          .map((e) => JobSearchSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalResults: (json['totalResults'] as int?) ?? 0,
      nextItemOffset: json['nextItemOffset'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobs = this.jobs;
    final totalResults = this.totalResults;
    final nextItemOffset = this.nextItemOffset;
    return {
      'jobs': jobs,
      'totalResults': totalResults,
      if (nextItemOffset != null) 'nextItemOffset': nextItemOffset,
    };
  }
}

/// Shared output fields for all Search operations (nextItemOffset,
/// totalResults).
class SearchStepsResponse {
  /// The steps in the search.
  final List<StepSearchSummary> steps;

  /// The total number of results in the search.
  final int totalResults;

  /// The next item offset for the search results.
  final int? nextItemOffset;

  SearchStepsResponse({
    required this.steps,
    required this.totalResults,
    this.nextItemOffset,
  });

  factory SearchStepsResponse.fromJson(Map<String, dynamic> json) {
    return SearchStepsResponse(
      steps: ((json['steps'] as List?) ?? const [])
          .nonNulls
          .map((e) => StepSearchSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalResults: (json['totalResults'] as int?) ?? 0,
      nextItemOffset: json['nextItemOffset'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final steps = this.steps;
    final totalResults = this.totalResults;
    final nextItemOffset = this.nextItemOffset;
    return {
      'steps': steps,
      'totalResults': totalResults,
      if (nextItemOffset != null) 'nextItemOffset': nextItemOffset,
    };
  }
}

/// Shared output fields for all Search operations (nextItemOffset,
/// totalResults).
class SearchTasksResponse {
  /// Tasks in the search.
  final List<TaskSearchSummary> tasks;

  /// The total number of results in the search.
  final int totalResults;

  /// The next item offset for the search results.
  final int? nextItemOffset;

  SearchTasksResponse({
    required this.tasks,
    required this.totalResults,
    this.nextItemOffset,
  });

  factory SearchTasksResponse.fromJson(Map<String, dynamic> json) {
    return SearchTasksResponse(
      tasks: ((json['tasks'] as List?) ?? const [])
          .nonNulls
          .map((e) => TaskSearchSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalResults: (json['totalResults'] as int?) ?? 0,
      nextItemOffset: json['nextItemOffset'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final tasks = this.tasks;
    final totalResults = this.totalResults;
    final nextItemOffset = this.nextItemOffset;
    return {
      'tasks': tasks,
      'totalResults': totalResults,
      if (nextItemOffset != null) 'nextItemOffset': nextItemOffset,
    };
  }
}

/// Shared output fields for all Search operations (nextItemOffset,
/// totalResults).
class SearchWorkersResponse {
  /// The total number of results in the search.
  final int totalResults;

  /// The workers for the search.
  final List<WorkerSearchSummary> workers;

  /// The next item offset for the search results.
  final int? nextItemOffset;

  SearchWorkersResponse({
    required this.totalResults,
    required this.workers,
    this.nextItemOffset,
  });

  factory SearchWorkersResponse.fromJson(Map<String, dynamic> json) {
    return SearchWorkersResponse(
      totalResults: (json['totalResults'] as int?) ?? 0,
      workers: ((json['workers'] as List?) ?? const [])
          .nonNulls
          .map((e) => WorkerSearchSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextItemOffset: json['nextItemOffset'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final totalResults = this.totalResults;
    final workers = this.workers;
    final nextItemOffset = this.nextItemOffset;
    return {
      'totalResults': totalResults,
      'workers': workers,
      if (nextItemOffset != null) 'nextItemOffset': nextItemOffset,
    };
  }
}

class StartSessionsStatisticsAggregationResponse {
  /// A unique identifier for the aggregated statistics. Use this identifier with
  /// the <code>GetAggregatedStatisticsForSessions</code> operation to return the
  /// statistics.
  final String aggregationId;

  StartSessionsStatisticsAggregationResponse({
    required this.aggregationId,
  });

  factory StartSessionsStatisticsAggregationResponse.fromJson(
      Map<String, dynamic> json) {
    return StartSessionsStatisticsAggregationResponse(
      aggregationId: (json['aggregationId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final aggregationId = this.aggregationId;
    return {
      'aggregationId': aggregationId,
    };
  }
}

class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateQueueFleetAssociationResponse {
  UpdateQueueFleetAssociationResponse();

  factory UpdateQueueFleetAssociationResponse.fromJson(Map<String, dynamic> _) {
    return UpdateQueueFleetAssociationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateQueueLimitAssociationResponse {
  UpdateQueueLimitAssociationResponse();

  factory UpdateQueueLimitAssociationResponse.fromJson(Map<String, dynamic> _) {
    return UpdateQueueLimitAssociationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Mixin that adds an optional ARN field to response structures. Apply to
/// SummaryMixins (flows into Get, Summary, and BatchGet) and Create outputs.
class CreateFarmResponse {
  /// The farm ID.
  final String farmId;

  CreateFarmResponse({
    required this.farmId,
  });

  factory CreateFarmResponse.fromJson(Map<String, dynamic> json) {
    return CreateFarmResponse(
      farmId: (json['farmId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final farmId = this.farmId;
    return {
      'farmId': farmId,
    };
  }
}

/// Mixin that adds an optional ARN field to response structures. Apply to
/// SummaryMixins (flows into Get, Summary, and BatchGet) and Create outputs.
class GetFarmResponse {
  /// A multiplier applied to the farm's calculated costs for usage data and
  /// budget tracking. A value less than 1 represents a discount, a value greater
  /// than 1 represents a premium, and a value of 1 represents no adjustment.
  final double costScaleFactor;

  /// The date and time the resource was created.
  final DateTime createdAt;

  /// The user or system that created this resource.
  final String createdBy;

  /// The display name of the farm.
  /// <important>
  /// This field can store any content. Escape or encode this content before
  /// displaying it on a webpage or any other system that might interpret the
  /// content of this field.
  /// </important>
  final String displayName;

  /// The farm ID of the farm to get.
  final String farmId;

  /// The description of the farm.
  /// <important>
  /// This field can store any content. Escape or encode this content before
  /// displaying it on a webpage or any other system that might interpret the
  /// content of this field.
  /// </important>
  final String? description;

  /// The ARN of the KMS key used on the farm.
  final String? kmsKeyArn;

  /// The date and time the resource was updated.
  final DateTime? updatedAt;

  /// The user or system that updated this resource.
  final String? updatedBy;

  GetFarmResponse({
    required this.costScaleFactor,
    required this.createdAt,
    required this.createdBy,
    required this.displayName,
    required this.farmId,
    this.description,
    this.kmsKeyArn,
    this.updatedAt,
    this.updatedBy,
  });

  factory GetFarmResponse.fromJson(Map<String, dynamic> json) {
    return GetFarmResponse(
      costScaleFactor: (json['costScaleFactor'] as double?) ?? 0,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      createdBy: (json['createdBy'] as String?) ?? '',
      displayName: (json['displayName'] as String?) ?? '',
      farmId: (json['farmId'] as String?) ?? '',
      description: json['description'] as String?,
      kmsKeyArn: json['kmsKeyArn'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final costScaleFactor = this.costScaleFactor;
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final displayName = this.displayName;
    final farmId = this.farmId;
    final description = this.description;
    final kmsKeyArn = this.kmsKeyArn;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      'costScaleFactor': costScaleFactor,
      'createdAt': iso8601ToJson(createdAt),
      'createdBy': createdBy,
      'displayName': displayName,
      'farmId': farmId,
      if (description != null) 'description': description,
      if (kmsKeyArn != null) 'kmsKeyArn': kmsKeyArn,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

class UpdateFarmResponse {
  UpdateFarmResponse();

  factory UpdateFarmResponse.fromJson(Map<String, dynamic> _) {
    return UpdateFarmResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteFarmResponse {
  DeleteFarmResponse();

  factory DeleteFarmResponse.fromJson(Map<String, dynamic> _) {
    return DeleteFarmResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Shared pagination field for List operation outputs (nextToken).
class ListFarmsResponse {
  /// Farms on the list.
  final List<FarmSummary> farms;

  /// If Deadline Cloud returns <code>nextToken</code>, then there are more
  /// results available. The value of <code>nextToken</code> is a unique
  /// pagination token for each page. To retrieve the next page, call the
  /// operation again using the returned token. Keep all other arguments
  /// unchanged. If no results remain, then <code>nextToken</code> is set to
  /// <code>null</code>. Each pagination token expires after 24 hours. If you
  /// provide a token that isn't valid, then you receive an HTTP 400
  /// <code>ValidationException</code> error.
  final String? nextToken;

  ListFarmsResponse({
    required this.farms,
    this.nextToken,
  });

  factory ListFarmsResponse.fromJson(Map<String, dynamic> json) {
    return ListFarmsResponse(
      farms: ((json['farms'] as List?) ?? const [])
          .nonNulls
          .map((e) => FarmSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final farms = this.farms;
    final nextToken = this.nextToken;
    return {
      'farms': farms,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class AssociateMemberToFarmResponse {
  AssociateMemberToFarmResponse();

  factory AssociateMemberToFarmResponse.fromJson(Map<String, dynamic> _) {
    return AssociateMemberToFarmResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class CreateLimitResponse {
  /// A unique identifier for the limit. Use this identifier in other operations,
  /// such as <code>CreateQueueLimitAssociation</code> and
  /// <code>DeleteLimit</code>.
  final String limitId;

  CreateLimitResponse({
    required this.limitId,
  });

  factory CreateLimitResponse.fromJson(Map<String, dynamic> json) {
    return CreateLimitResponse(
      limitId: (json['limitId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final limitId = this.limitId;
    return {
      'limitId': limitId,
    };
  }
}

class CreateStorageProfileResponse {
  /// The storage profile ID.
  final String storageProfileId;

  CreateStorageProfileResponse({
    required this.storageProfileId,
  });

  factory CreateStorageProfileResponse.fromJson(Map<String, dynamic> json) {
    return CreateStorageProfileResponse(
      storageProfileId: (json['storageProfileId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final storageProfileId = this.storageProfileId;
    return {
      'storageProfileId': storageProfileId,
    };
  }
}

class DeleteLimitResponse {
  DeleteLimitResponse();

  factory DeleteLimitResponse.fromJson(Map<String, dynamic> _) {
    return DeleteLimitResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteStorageProfileResponse {
  DeleteStorageProfileResponse();

  factory DeleteStorageProfileResponse.fromJson(Map<String, dynamic> _) {
    return DeleteStorageProfileResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DisassociateMemberFromFarmResponse {
  DisassociateMemberFromFarmResponse();

  factory DisassociateMemberFromFarmResponse.fromJson(Map<String, dynamic> _) {
    return DisassociateMemberFromFarmResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Domain fields for Limit summary/response shapes, ordered before timestamps.
class GetLimitResponse {
  /// The value that you specify as the <code>name</code> in the
  /// <code>amounts</code> field of the <code>hostRequirements</code> in a step of
  /// a job template to declare the limit requirement.
  final String amountRequirementName;

  /// The Unix timestamp of the date and time that the limit was created.
  final DateTime createdAt;

  /// The user identifier of the person that created the limit.
  final String createdBy;

  /// The number of resources from the limit that are being used by jobs. The
  /// result is delayed and may not be the count at the time that you called the
  /// operation.
  final int currentCount;

  /// The display name of the limit.
  /// <important>
  /// This field can store any content. Escape or encode this content before
  /// displaying it on a webpage or any other system that might interpret the
  /// content of this field.
  /// </important>
  final String displayName;

  /// The unique identifier of the farm that contains the limit.
  final String farmId;

  /// The unique identifier of the limit.
  final String limitId;

  /// The maximum number of resources constrained by this limit. When all of the
  /// resources are in use, steps that require the limit won't be scheduled until
  /// the resource is available.
  ///
  /// The <code>maxValue</code> must not be 0. If the value is -1, there is no
  /// restriction on the number of resources that can be acquired for this limit.
  final int maxCount;

  /// The description of the limit that helps identify what the limit is used for.
  /// <important>
  /// This field can store any content. Escape or encode this content before
  /// displaying it on a webpage or any other system that might interpret the
  /// content of this field.
  /// </important>
  final String? description;

  /// The Unix timestamp of the date and time that the limit was last updated.
  final DateTime? updatedAt;

  /// The user identifier of the person that last updated the limit.
  final String? updatedBy;

  GetLimitResponse({
    required this.amountRequirementName,
    required this.createdAt,
    required this.createdBy,
    required this.currentCount,
    required this.displayName,
    required this.farmId,
    required this.limitId,
    required this.maxCount,
    this.description,
    this.updatedAt,
    this.updatedBy,
  });

  factory GetLimitResponse.fromJson(Map<String, dynamic> json) {
    return GetLimitResponse(
      amountRequirementName: (json['amountRequirementName'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      createdBy: (json['createdBy'] as String?) ?? '',
      currentCount: (json['currentCount'] as int?) ?? 0,
      displayName: (json['displayName'] as String?) ?? '',
      farmId: (json['farmId'] as String?) ?? '',
      limitId: (json['limitId'] as String?) ?? '',
      maxCount: (json['maxCount'] as int?) ?? 0,
      description: json['description'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final amountRequirementName = this.amountRequirementName;
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final currentCount = this.currentCount;
    final displayName = this.displayName;
    final farmId = this.farmId;
    final limitId = this.limitId;
    final maxCount = this.maxCount;
    final description = this.description;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      'amountRequirementName': amountRequirementName,
      'createdAt': iso8601ToJson(createdAt),
      'createdBy': createdBy,
      'currentCount': currentCount,
      'displayName': displayName,
      'farmId': farmId,
      'limitId': limitId,
      'maxCount': maxCount,
      if (description != null) 'description': description,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

class GetStorageProfileResponse {
  /// The date and time the resource was created.
  final DateTime createdAt;

  /// The user or system that created this resource.
  final String createdBy;

  /// The display name of the storage profile.
  /// <important>
  /// This field can store any content. Escape or encode this content before
  /// displaying it on a webpage or any other system that might interpret the
  /// content of this field.
  /// </important>
  final String displayName;

  /// The operating system (OS) for the storage profile.
  final StorageProfileOperatingSystemFamily osFamily;

  /// The storage profile ID.
  final String storageProfileId;

  /// The location of the files for the storage profile.
  final List<FileSystemLocation>? fileSystemLocations;

  /// The date and time the resource was updated.
  final DateTime? updatedAt;

  /// The user or system that updated this resource.
  final String? updatedBy;

  GetStorageProfileResponse({
    required this.createdAt,
    required this.createdBy,
    required this.displayName,
    required this.osFamily,
    required this.storageProfileId,
    this.fileSystemLocations,
    this.updatedAt,
    this.updatedBy,
  });

  factory GetStorageProfileResponse.fromJson(Map<String, dynamic> json) {
    return GetStorageProfileResponse(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      createdBy: (json['createdBy'] as String?) ?? '',
      displayName: (json['displayName'] as String?) ?? '',
      osFamily: StorageProfileOperatingSystemFamily.fromString(
          (json['osFamily'] as String?) ?? ''),
      storageProfileId: (json['storageProfileId'] as String?) ?? '',
      fileSystemLocations: (json['fileSystemLocations'] as List?)
          ?.nonNulls
          .map((e) => FileSystemLocation.fromJson(e as Map<String, dynamic>))
          .toList(),
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final displayName = this.displayName;
    final osFamily = this.osFamily;
    final storageProfileId = this.storageProfileId;
    final fileSystemLocations = this.fileSystemLocations;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'createdBy': createdBy,
      'displayName': displayName,
      'osFamily': osFamily.value,
      'storageProfileId': storageProfileId,
      if (fileSystemLocations != null)
        'fileSystemLocations': fileSystemLocations,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

/// Shared pagination field for List operation outputs (nextToken).
class ListFarmMembersResponse {
  /// The members on the list.
  final List<FarmMember> members;

  /// If Deadline Cloud returns <code>nextToken</code>, then there are more
  /// results available. The value of <code>nextToken</code> is a unique
  /// pagination token for each page. To retrieve the next page, call the
  /// operation again using the returned token. Keep all other arguments
  /// unchanged. If no results remain, then <code>nextToken</code> is set to
  /// <code>null</code>. Each pagination token expires after 24 hours. If you
  /// provide a token that isn't valid, then you receive an HTTP 400
  /// <code>ValidationException</code> error.
  final String? nextToken;

  ListFarmMembersResponse({
    required this.members,
    this.nextToken,
  });

  factory ListFarmMembersResponse.fromJson(Map<String, dynamic> json) {
    return ListFarmMembersResponse(
      members: ((json['members'] as List?) ?? const [])
          .nonNulls
          .map((e) => FarmMember.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final members = this.members;
    final nextToken = this.nextToken;
    return {
      'members': members,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Shared pagination field for List operation outputs (nextToken).
class ListLimitsResponse {
  /// A list of limits that the farm contains.
  final List<LimitSummary> limits;

  /// If Deadline Cloud returns <code>nextToken</code>, then there are more
  /// results available. The value of <code>nextToken</code> is a unique
  /// pagination token for each page. To retrieve the next page, call the
  /// operation again using the returned token. Keep all other arguments
  /// unchanged. If no results remain, then <code>nextToken</code> is set to
  /// <code>null</code>. Each pagination token expires after 24 hours. If you
  /// provide a token that isn't valid, then you receive an HTTP 400
  /// <code>ValidationException</code> error.
  final String? nextToken;

  ListLimitsResponse({
    required this.limits,
    this.nextToken,
  });

  factory ListLimitsResponse.fromJson(Map<String, dynamic> json) {
    return ListLimitsResponse(
      limits: ((json['limits'] as List?) ?? const [])
          .nonNulls
          .map((e) => LimitSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final limits = this.limits;
    final nextToken = this.nextToken;
    return {
      'limits': limits,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Shared pagination field for List operation outputs (nextToken).
class ListStorageProfilesResponse {
  /// The storage profiles.
  final List<StorageProfileSummary> storageProfiles;

  /// If Deadline Cloud returns <code>nextToken</code>, then there are more
  /// results available. The value of <code>nextToken</code> is a unique
  /// pagination token for each page. To retrieve the next page, call the
  /// operation again using the returned token. Keep all other arguments
  /// unchanged. If no results remain, then <code>nextToken</code> is set to
  /// <code>null</code>. Each pagination token expires after 24 hours. If you
  /// provide a token that isn't valid, then you receive an HTTP 400
  /// <code>ValidationException</code> error.
  final String? nextToken;

  ListStorageProfilesResponse({
    required this.storageProfiles,
    this.nextToken,
  });

  factory ListStorageProfilesResponse.fromJson(Map<String, dynamic> json) {
    return ListStorageProfilesResponse(
      storageProfiles: ((json['storageProfiles'] as List?) ?? const [])
          .nonNulls
          .map((e) => StorageProfileSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final storageProfiles = this.storageProfiles;
    final nextToken = this.nextToken;
    return {
      'storageProfiles': storageProfiles,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class UpdateLimitResponse {
  UpdateLimitResponse();

  factory UpdateLimitResponse.fromJson(Map<String, dynamic> _) {
    return UpdateLimitResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateStorageProfileResponse {
  UpdateStorageProfileResponse();

  factory UpdateStorageProfileResponse.fromJson(Map<String, dynamic> _) {
    return UpdateStorageProfileResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Mixin that adds an optional ARN field to response structures. Apply to
/// SummaryMixins (flows into Get, Summary, and BatchGet) and Create outputs.
class CreateBudgetResponse {
  /// The budget ID.
  final String budgetId;

  CreateBudgetResponse({
    required this.budgetId,
  });

  factory CreateBudgetResponse.fromJson(Map<String, dynamic> json) {
    return CreateBudgetResponse(
      budgetId: (json['budgetId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final budgetId = this.budgetId;
    return {
      'budgetId': budgetId,
    };
  }
}

/// Mixin that adds an optional ARN field to response structures. Apply to
/// SummaryMixins (flows into Get, Summary, and BatchGet) and Create outputs.
class GetBudgetResponse {
  /// The budget actions for the budget.
  final List<ResponseBudgetAction> actions;

  /// The consumed usage limit for the budget.
  final double approximateDollarLimit;

  /// The budget ID.
  final String budgetId;

  /// The date and time the resource was created.
  final DateTime createdAt;

  /// The user or system that created this resource.
  final String createdBy;

  /// The display name of the budget.
  /// <important>
  /// This field can store any content. Escape or encode this content before
  /// displaying it on a webpage or any other system that might interpret the
  /// content of this field.
  /// </important>
  final String displayName;

  /// The budget schedule.
  final BudgetSchedule schedule;

  /// The status of the budget.
  ///
  /// <ul>
  /// <li>
  /// <code>ACTIVE</code>–Get a budget being evaluated.
  /// </li>
  /// <li>
  /// <code>INACTIVE</code>–Get an inactive budget. This can include expired,
  /// canceled, or deleted statuses.
  /// </li>
  /// </ul>
  final BudgetStatus status;

  /// The resource that the budget is tracking usage for.
  final UsageTrackingResource usageTrackingResource;

  /// The usages of the budget.
  final ConsumedUsages usages;

  /// The description of the budget.
  /// <important>
  /// This field can store any content. Escape or encode this content before
  /// displaying it on a webpage or any other system that might interpret the
  /// content of this field.
  /// </important>
  final String? description;

  /// The date and time the queue stopped.
  final DateTime? queueStoppedAt;

  /// The date and time the resource was updated.
  final DateTime? updatedAt;

  /// The user or system that updated this resource.
  final String? updatedBy;

  GetBudgetResponse({
    required this.actions,
    required this.approximateDollarLimit,
    required this.budgetId,
    required this.createdAt,
    required this.createdBy,
    required this.displayName,
    required this.schedule,
    required this.status,
    required this.usageTrackingResource,
    required this.usages,
    this.description,
    this.queueStoppedAt,
    this.updatedAt,
    this.updatedBy,
  });

  factory GetBudgetResponse.fromJson(Map<String, dynamic> json) {
    return GetBudgetResponse(
      actions: ((json['actions'] as List?) ?? const [])
          .nonNulls
          .map((e) => ResponseBudgetAction.fromJson(e as Map<String, dynamic>))
          .toList(),
      approximateDollarLimit: (json['approximateDollarLimit'] as double?) ?? 0,
      budgetId: (json['budgetId'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      createdBy: (json['createdBy'] as String?) ?? '',
      displayName: (json['displayName'] as String?) ?? '',
      schedule: BudgetSchedule.fromJson(
          (json['schedule'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      status: BudgetStatus.fromString((json['status'] as String?) ?? ''),
      usageTrackingResource: UsageTrackingResource.fromJson(
          (json['usageTrackingResource'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      usages: ConsumedUsages.fromJson(
          (json['usages'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      description: json['description'] as String?,
      queueStoppedAt: timeStampFromJson(json['queueStoppedAt']),
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final actions = this.actions;
    final approximateDollarLimit = this.approximateDollarLimit;
    final budgetId = this.budgetId;
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final displayName = this.displayName;
    final schedule = this.schedule;
    final status = this.status;
    final usageTrackingResource = this.usageTrackingResource;
    final usages = this.usages;
    final description = this.description;
    final queueStoppedAt = this.queueStoppedAt;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      'actions': actions,
      'approximateDollarLimit': approximateDollarLimit,
      'budgetId': budgetId,
      'createdAt': iso8601ToJson(createdAt),
      'createdBy': createdBy,
      'displayName': displayName,
      'schedule': schedule,
      'status': status.value,
      'usageTrackingResource': usageTrackingResource,
      'usages': usages,
      if (description != null) 'description': description,
      if (queueStoppedAt != null)
        'queueStoppedAt': iso8601ToJson(queueStoppedAt),
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

class UpdateBudgetResponse {
  UpdateBudgetResponse();

  factory UpdateBudgetResponse.fromJson(Map<String, dynamic> _) {
    return UpdateBudgetResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteBudgetResponse {
  DeleteBudgetResponse();

  factory DeleteBudgetResponse.fromJson(Map<String, dynamic> _) {
    return DeleteBudgetResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Shared pagination field for List operation outputs (nextToken).
class ListBudgetsResponse {
  /// The budgets to include on the list.
  final List<BudgetSummary> budgets;

  /// If Deadline Cloud returns <code>nextToken</code>, then there are more
  /// results available. The value of <code>nextToken</code> is a unique
  /// pagination token for each page. To retrieve the next page, call the
  /// operation again using the returned token. Keep all other arguments
  /// unchanged. If no results remain, then <code>nextToken</code> is set to
  /// <code>null</code>. Each pagination token expires after 24 hours. If you
  /// provide a token that isn't valid, then you receive an HTTP 400
  /// <code>ValidationException</code> error.
  final String? nextToken;

  ListBudgetsResponse({
    required this.budgets,
    this.nextToken,
  });

  factory ListBudgetsResponse.fromJson(Map<String, dynamic> json) {
    return ListBudgetsResponse(
      budgets: ((json['budgets'] as List?) ?? const [])
          .nonNulls
          .map((e) => BudgetSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final budgets = this.budgets;
    final nextToken = this.nextToken;
    return {
      'budgets': budgets,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Mixin that adds an optional ARN field to response structures. Apply to
/// SummaryMixins (flows into Get, Summary, and BatchGet) and Create outputs.
class CreateFleetResponse {
  /// The fleet ID.
  final String fleetId;

  CreateFleetResponse({
    required this.fleetId,
  });

  factory CreateFleetResponse.fromJson(Map<String, dynamic> json) {
    return CreateFleetResponse(
      fleetId: (json['fleetId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final fleetId = this.fleetId;
    return {
      'fleetId': fleetId,
    };
  }
}

/// Mixin that adds an optional ARN field to response structures. Apply to
/// SummaryMixins (flows into Get, Summary, and BatchGet) and Create outputs.
class GetFleetResponse {
  /// The configuration setting for the fleet.
  final FleetConfiguration configuration;

  /// The date and time the resource was created.
  final DateTime createdAt;

  /// The user or system that created this resource.
  final String createdBy;

  /// The display name of the fleet.
  /// <important>
  /// This field can store any content. Escape or encode this content before
  /// displaying it on a webpage or any other system that might interpret the
  /// content of this field.
  /// </important>
  final String displayName;

  /// The farm ID of the farm in the fleet.
  final String farmId;

  /// The fleet ID.
  final String fleetId;

  /// The maximum number of workers specified in the fleet.
  final int maxWorkerCount;

  /// The minimum number of workers specified in the fleet.
  final int minWorkerCount;

  /// The IAM role ARN.
  final String roleArn;

  /// The status of the fleet.
  final FleetStatus status;

  /// The number of workers in the fleet.
  final int workerCount;

  /// The Auto Scaling status of the fleet. Either <code>GROWING</code>,
  /// <code>STEADY</code>, or <code>SHRINKING</code>.
  final AutoScalingStatus? autoScalingStatus;

  /// Outlines what the fleet is capable of for minimums, maximums, and naming, in
  /// addition to attribute names and values.
  final FleetCapabilities? capabilities;

  /// The description of the fleet.
  /// <important>
  /// This field can store any content. Escape or encode this content before
  /// displaying it on a webpage or any other system that might interpret the
  /// content of this field.
  /// </important>
  final String? description;

  /// The script that runs as a worker is starting up that you can use to provide
  /// additional configuration for workers in your fleet.
  final HostConfiguration? hostConfiguration;

  /// A message that communicates a suspended status of the fleet.
  final String? statusMessage;

  /// The number of target workers in the fleet.
  final int? targetWorkerCount;

  /// The date and time the resource was updated.
  final DateTime? updatedAt;

  /// The user or system that updated this resource.
  final String? updatedBy;

  GetFleetResponse({
    required this.configuration,
    required this.createdAt,
    required this.createdBy,
    required this.displayName,
    required this.farmId,
    required this.fleetId,
    required this.maxWorkerCount,
    required this.minWorkerCount,
    required this.roleArn,
    required this.status,
    required this.workerCount,
    this.autoScalingStatus,
    this.capabilities,
    this.description,
    this.hostConfiguration,
    this.statusMessage,
    this.targetWorkerCount,
    this.updatedAt,
    this.updatedBy,
  });

  factory GetFleetResponse.fromJson(Map<String, dynamic> json) {
    return GetFleetResponse(
      configuration: FleetConfiguration.fromJson(
          (json['configuration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      createdBy: (json['createdBy'] as String?) ?? '',
      displayName: (json['displayName'] as String?) ?? '',
      farmId: (json['farmId'] as String?) ?? '',
      fleetId: (json['fleetId'] as String?) ?? '',
      maxWorkerCount: (json['maxWorkerCount'] as int?) ?? 0,
      minWorkerCount: (json['minWorkerCount'] as int?) ?? 0,
      roleArn: (json['roleArn'] as String?) ?? '',
      status: FleetStatus.fromString((json['status'] as String?) ?? ''),
      workerCount: (json['workerCount'] as int?) ?? 0,
      autoScalingStatus: (json['autoScalingStatus'] as String?)
          ?.let(AutoScalingStatus.fromString),
      capabilities: json['capabilities'] != null
          ? FleetCapabilities.fromJson(
              json['capabilities'] as Map<String, dynamic>)
          : null,
      description: json['description'] as String?,
      hostConfiguration: json['hostConfiguration'] != null
          ? HostConfiguration.fromJson(
              json['hostConfiguration'] as Map<String, dynamic>)
          : null,
      statusMessage: json['statusMessage'] as String?,
      targetWorkerCount: json['targetWorkerCount'] as int?,
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final displayName = this.displayName;
    final farmId = this.farmId;
    final fleetId = this.fleetId;
    final maxWorkerCount = this.maxWorkerCount;
    final minWorkerCount = this.minWorkerCount;
    final roleArn = this.roleArn;
    final status = this.status;
    final workerCount = this.workerCount;
    final autoScalingStatus = this.autoScalingStatus;
    final capabilities = this.capabilities;
    final description = this.description;
    final hostConfiguration = this.hostConfiguration;
    final statusMessage = this.statusMessage;
    final targetWorkerCount = this.targetWorkerCount;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      'configuration': configuration,
      'createdAt': iso8601ToJson(createdAt),
      'createdBy': createdBy,
      'displayName': displayName,
      'farmId': farmId,
      'fleetId': fleetId,
      'maxWorkerCount': maxWorkerCount,
      'minWorkerCount': minWorkerCount,
      'roleArn': roleArn,
      'status': status.value,
      'workerCount': workerCount,
      if (autoScalingStatus != null)
        'autoScalingStatus': autoScalingStatus.value,
      if (capabilities != null) 'capabilities': capabilities,
      if (description != null) 'description': description,
      if (hostConfiguration != null) 'hostConfiguration': hostConfiguration,
      if (statusMessage != null) 'statusMessage': statusMessage,
      if (targetWorkerCount != null) 'targetWorkerCount': targetWorkerCount,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

class UpdateFleetResponse {
  UpdateFleetResponse();

  factory UpdateFleetResponse.fromJson(Map<String, dynamic> _) {
    return UpdateFleetResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteFleetResponse {
  DeleteFleetResponse();

  factory DeleteFleetResponse.fromJson(Map<String, dynamic> _) {
    return DeleteFleetResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Shared pagination field for List operation outputs (nextToken).
class ListFleetsResponse {
  /// The fleets on the list.
  final List<FleetSummary> fleets;

  /// If Deadline Cloud returns <code>nextToken</code>, then there are more
  /// results available. The value of <code>nextToken</code> is a unique
  /// pagination token for each page. To retrieve the next page, call the
  /// operation again using the returned token. Keep all other arguments
  /// unchanged. If no results remain, then <code>nextToken</code> is set to
  /// <code>null</code>. Each pagination token expires after 24 hours. If you
  /// provide a token that isn't valid, then you receive an HTTP 400
  /// <code>ValidationException</code> error.
  final String? nextToken;

  ListFleetsResponse({
    required this.fleets,
    this.nextToken,
  });

  factory ListFleetsResponse.fromJson(Map<String, dynamic> json) {
    return ListFleetsResponse(
      fleets: ((json['fleets'] as List?) ?? const [])
          .nonNulls
          .map((e) => FleetSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fleets = this.fleets;
    final nextToken = this.nextToken;
    return {
      'fleets': fleets,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class AssociateMemberToFleetResponse {
  AssociateMemberToFleetResponse();

  factory AssociateMemberToFleetResponse.fromJson(Map<String, dynamic> _) {
    return AssociateMemberToFleetResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Shared response body for AssumeRole operations where credentials are
/// required. AssumeQueueRoleForWorkerResponse is excluded because credentials
/// is optional there because Queue.roleArn is optional, so the mixin's
/// @required trait would be incorrect.
class AssumeFleetRoleForReadResponse {
  /// The credentials for the fleet role.
  final AwsCredentials credentials;

  AssumeFleetRoleForReadResponse({
    required this.credentials,
  });

  factory AssumeFleetRoleForReadResponse.fromJson(Map<String, dynamic> json) {
    return AssumeFleetRoleForReadResponse(
      credentials: AwsCredentials.fromJson(
          (json['credentials'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final credentials = this.credentials;
    return {
      'credentials': credentials,
    };
  }
}

class DisassociateMemberFromFleetResponse {
  DisassociateMemberFromFleetResponse();

  factory DisassociateMemberFromFleetResponse.fromJson(Map<String, dynamic> _) {
    return DisassociateMemberFromFleetResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Shared pagination field for List operation outputs (nextToken).
class ListFleetMembersResponse {
  /// The members on the list.
  final List<FleetMember> members;

  /// If Deadline Cloud returns <code>nextToken</code>, then there are more
  /// results available. The value of <code>nextToken</code> is a unique
  /// pagination token for each page. To retrieve the next page, call the
  /// operation again using the returned token. Keep all other arguments
  /// unchanged. If no results remain, then <code>nextToken</code> is set to
  /// <code>null</code>. Each pagination token expires after 24 hours. If you
  /// provide a token that isn't valid, then you receive an HTTP 400
  /// <code>ValidationException</code> error.
  final String? nextToken;

  ListFleetMembersResponse({
    required this.members,
    this.nextToken,
  });

  factory ListFleetMembersResponse.fromJson(Map<String, dynamic> json) {
    return ListFleetMembersResponse(
      members: ((json['members'] as List?) ?? const [])
          .nonNulls
          .map((e) => FleetMember.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final members = this.members;
    final nextToken = this.nextToken;
    return {
      'members': members,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Mixin that adds an optional ARN field to response structures. Apply to
/// SummaryMixins (flows into Get, Summary, and BatchGet) and Create outputs.
class GetVolumeResponse {
  /// The Availability Zone ID of the volume.
  final String availabilityZoneId;

  /// The date and time the resource was created.
  final DateTime createdAt;

  /// The farm ID of the farm that contains the fleet.
  final String farmId;

  /// The fleet ID of the fleet that contains the volume.
  final String fleetId;

  /// The volume size in GiB.
  final int sizeGiB;

  /// The state of the volume.
  final VolumeState state;

  /// The volume ID.
  final String volumeId;

  /// The EBS volume type.
  final EbsVolumeType volumeType;

  /// The worker ID of the worker the volume is attached to.
  final String? attachedWorkerId;

  /// The date and time the volume expires and will be deleted.
  final DateTime? expiresAt;

  /// The IOPS of the volume.
  final int? iops;

  /// The date and time the volume was last assigned to a worker.
  final DateTime? lastAssignedAt;

  /// The date and time the volume was last released from a worker.
  final DateTime? lastReleasedAt;

  /// The throughput of the volume in MiB.
  final int? throughputMiB;

  GetVolumeResponse({
    required this.availabilityZoneId,
    required this.createdAt,
    required this.farmId,
    required this.fleetId,
    required this.sizeGiB,
    required this.state,
    required this.volumeId,
    required this.volumeType,
    this.attachedWorkerId,
    this.expiresAt,
    this.iops,
    this.lastAssignedAt,
    this.lastReleasedAt,
    this.throughputMiB,
  });

  factory GetVolumeResponse.fromJson(Map<String, dynamic> json) {
    return GetVolumeResponse(
      availabilityZoneId: (json['availabilityZoneId'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      farmId: (json['farmId'] as String?) ?? '',
      fleetId: (json['fleetId'] as String?) ?? '',
      sizeGiB: (json['sizeGiB'] as int?) ?? 0,
      state: VolumeState.fromString((json['state'] as String?) ?? ''),
      volumeId: (json['volumeId'] as String?) ?? '',
      volumeType:
          EbsVolumeType.fromString((json['volumeType'] as String?) ?? ''),
      attachedWorkerId: json['attachedWorkerId'] as String?,
      expiresAt: timeStampFromJson(json['expiresAt']),
      iops: json['iops'] as int?,
      lastAssignedAt: timeStampFromJson(json['lastAssignedAt']),
      lastReleasedAt: timeStampFromJson(json['lastReleasedAt']),
      throughputMiB: json['throughputMiB'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final availabilityZoneId = this.availabilityZoneId;
    final createdAt = this.createdAt;
    final farmId = this.farmId;
    final fleetId = this.fleetId;
    final sizeGiB = this.sizeGiB;
    final state = this.state;
    final volumeId = this.volumeId;
    final volumeType = this.volumeType;
    final attachedWorkerId = this.attachedWorkerId;
    final expiresAt = this.expiresAt;
    final iops = this.iops;
    final lastAssignedAt = this.lastAssignedAt;
    final lastReleasedAt = this.lastReleasedAt;
    final throughputMiB = this.throughputMiB;
    return {
      'availabilityZoneId': availabilityZoneId,
      'createdAt': iso8601ToJson(createdAt),
      'farmId': farmId,
      'fleetId': fleetId,
      'sizeGiB': sizeGiB,
      'state': state.value,
      'volumeId': volumeId,
      'volumeType': volumeType.value,
      if (attachedWorkerId != null) 'attachedWorkerId': attachedWorkerId,
      if (expiresAt != null) 'expiresAt': iso8601ToJson(expiresAt),
      if (iops != null) 'iops': iops,
      if (lastAssignedAt != null)
        'lastAssignedAt': iso8601ToJson(lastAssignedAt),
      if (lastReleasedAt != null)
        'lastReleasedAt': iso8601ToJson(lastReleasedAt),
      if (throughputMiB != null) 'throughputMiB': throughputMiB,
    };
  }
}

class DeleteVolumeResponse {
  DeleteVolumeResponse();

  factory DeleteVolumeResponse.fromJson(Map<String, dynamic> _) {
    return DeleteVolumeResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Shared pagination field for List operation outputs (nextToken).
class ListVolumesResponse {
  /// The volumes on the list.
  final List<VolumeSummary> volumes;

  /// If Deadline Cloud returns <code>nextToken</code>, then there are more
  /// results available. The value of <code>nextToken</code> is a unique
  /// pagination token for each page. To retrieve the next page, call the
  /// operation again using the returned token. Keep all other arguments
  /// unchanged. If no results remain, then <code>nextToken</code> is set to
  /// <code>null</code>. Each pagination token expires after 24 hours. If you
  /// provide a token that isn't valid, then you receive an HTTP 400
  /// <code>ValidationException</code> error.
  final String? nextToken;

  ListVolumesResponse({
    required this.volumes,
    this.nextToken,
  });

  factory ListVolumesResponse.fromJson(Map<String, dynamic> json) {
    return ListVolumesResponse(
      volumes: ((json['volumes'] as List?) ?? const [])
          .nonNulls
          .map((e) => VolumeSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final volumes = this.volumes;
    final nextToken = this.nextToken;
    return {
      'volumes': volumes,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Mixin that adds an optional ARN field to response structures. Apply to
/// SummaryMixins (flows into Get, Summary, and BatchGet) and Create outputs.
class CreateWorkerResponse {
  /// The worker ID.
  final String workerId;

  CreateWorkerResponse({
    required this.workerId,
  });

  factory CreateWorkerResponse.fromJson(Map<String, dynamic> json) {
    return CreateWorkerResponse(
      workerId: (json['workerId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final workerId = this.workerId;
    return {
      'workerId': workerId,
    };
  }
}

/// Mixin that adds an optional ARN field to response structures. Apply to
/// SummaryMixins (flows into Get, Summary, and BatchGet) and Create outputs.
class GetWorkerResponse {
  /// The date and time the resource was created.
  final DateTime createdAt;

  /// The user or system that created this resource.
  final String createdBy;

  /// The farm ID.
  final String farmId;

  /// The fleet ID.
  final String fleetId;

  /// The status of the worker.
  final WorkerStatus status;

  /// The worker ID.
  final String workerId;

  /// The host properties for the worker.
  final HostPropertiesResponse? hostProperties;

  /// The logs for the associated worker.
  final LogConfiguration? log;

  /// The date and time the resource was updated.
  final DateTime? updatedAt;

  /// The user or system that updated this resource.
  final String? updatedBy;

  GetWorkerResponse({
    required this.createdAt,
    required this.createdBy,
    required this.farmId,
    required this.fleetId,
    required this.status,
    required this.workerId,
    this.hostProperties,
    this.log,
    this.updatedAt,
    this.updatedBy,
  });

  factory GetWorkerResponse.fromJson(Map<String, dynamic> json) {
    return GetWorkerResponse(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      createdBy: (json['createdBy'] as String?) ?? '',
      farmId: (json['farmId'] as String?) ?? '',
      fleetId: (json['fleetId'] as String?) ?? '',
      status: WorkerStatus.fromString((json['status'] as String?) ?? ''),
      workerId: (json['workerId'] as String?) ?? '',
      hostProperties: json['hostProperties'] != null
          ? HostPropertiesResponse.fromJson(
              json['hostProperties'] as Map<String, dynamic>)
          : null,
      log: json['log'] != null
          ? LogConfiguration.fromJson(json['log'] as Map<String, dynamic>)
          : null,
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final farmId = this.farmId;
    final fleetId = this.fleetId;
    final status = this.status;
    final workerId = this.workerId;
    final hostProperties = this.hostProperties;
    final log = this.log;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'createdBy': createdBy,
      'farmId': farmId,
      'fleetId': fleetId,
      'status': status.value,
      'workerId': workerId,
      if (hostProperties != null) 'hostProperties': hostProperties,
      if (log != null) 'log': log,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

class UpdateWorkerResponse {
  /// The script that runs as a worker is starting up that you can use to provide
  /// additional configuration for workers in your fleet.
  final HostConfiguration? hostConfiguration;

  /// The worker log to update.
  final LogConfiguration? log;

  UpdateWorkerResponse({
    this.hostConfiguration,
    this.log,
  });

  factory UpdateWorkerResponse.fromJson(Map<String, dynamic> json) {
    return UpdateWorkerResponse(
      hostConfiguration: json['hostConfiguration'] != null
          ? HostConfiguration.fromJson(
              json['hostConfiguration'] as Map<String, dynamic>)
          : null,
      log: json['log'] != null
          ? LogConfiguration.fromJson(json['log'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final hostConfiguration = this.hostConfiguration;
    final log = this.log;
    return {
      if (hostConfiguration != null) 'hostConfiguration': hostConfiguration,
      if (log != null) 'log': log,
    };
  }
}

class DeleteWorkerResponse {
  DeleteWorkerResponse();

  factory DeleteWorkerResponse.fromJson(Map<String, dynamic> _) {
    return DeleteWorkerResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Shared pagination field for List operation outputs (nextToken).
class ListWorkersResponse {
  /// The workers on the list.
  final List<WorkerSummary> workers;

  /// If Deadline Cloud returns <code>nextToken</code>, then there are more
  /// results available. The value of <code>nextToken</code> is a unique
  /// pagination token for each page. To retrieve the next page, call the
  /// operation again using the returned token. Keep all other arguments
  /// unchanged. If no results remain, then <code>nextToken</code> is set to
  /// <code>null</code>. Each pagination token expires after 24 hours. If you
  /// provide a token that isn't valid, then you receive an HTTP 400
  /// <code>ValidationException</code> error.
  final String? nextToken;

  ListWorkersResponse({
    required this.workers,
    this.nextToken,
  });

  factory ListWorkersResponse.fromJson(Map<String, dynamic> json) {
    return ListWorkersResponse(
      workers: ((json['workers'] as List?) ?? const [])
          .nonNulls
          .map((e) => WorkerSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final workers = this.workers;
    final nextToken = this.nextToken;
    return {
      'workers': workers,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Shared response body for AssumeRole operations where credentials are
/// required. AssumeQueueRoleForWorkerResponse is excluded because credentials
/// is optional there because Queue.roleArn is optional, so the mixin's
/// @required trait would be incorrect.
class AssumeFleetRoleForWorkerResponse {
  /// The credentials for the worker.
  final AwsCredentials credentials;

  AssumeFleetRoleForWorkerResponse({
    required this.credentials,
  });

  factory AssumeFleetRoleForWorkerResponse.fromJson(Map<String, dynamic> json) {
    return AssumeFleetRoleForWorkerResponse(
      credentials: AwsCredentials.fromJson(
          (json['credentials'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final credentials = this.credentials;
    return {
      'credentials': credentials,
    };
  }
}

class AssumeQueueRoleForWorkerResponse {
  /// The Amazon Web Services credentials for the role that the worker is
  /// assuming.
  final AwsCredentials? credentials;

  AssumeQueueRoleForWorkerResponse({
    this.credentials,
  });

  factory AssumeQueueRoleForWorkerResponse.fromJson(Map<String, dynamic> json) {
    return AssumeQueueRoleForWorkerResponse(
      credentials: json['credentials'] != null
          ? AwsCredentials.fromJson(json['credentials'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final credentials = this.credentials;
    return {
      if (credentials != null) 'credentials': credentials,
    };
  }
}

class BatchGetJobEntityResponse {
  /// A list of the job entities, or details, in the batch.
  final List<JobEntity> entities;

  /// A list of errors from the job error logs for the batch.
  final List<GetJobEntityError> errors;

  BatchGetJobEntityResponse({
    required this.entities,
    required this.errors,
  });

  factory BatchGetJobEntityResponse.fromJson(Map<String, dynamic> json) {
    return BatchGetJobEntityResponse(
      entities: ((json['entities'] as List?) ?? const [])
          .nonNulls
          .map((e) => JobEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      errors: ((json['errors'] as List?) ?? const [])
          .nonNulls
          .map((e) => GetJobEntityError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final entities = this.entities;
    final errors = this.errors;
    return {
      'entities': entities,
      'errors': errors,
    };
  }
}

/// Shared pagination field for List operation outputs (nextToken).
class ListSessionsForWorkerResponse {
  /// The sessions in the response.
  final List<WorkerSessionSummary> sessions;

  /// The token for the next set of results, or <code>null</code> to start from
  /// the beginning.
  final String? nextToken;

  ListSessionsForWorkerResponse({
    required this.sessions,
    this.nextToken,
  });

  factory ListSessionsForWorkerResponse.fromJson(Map<String, dynamic> json) {
    return ListSessionsForWorkerResponse(
      sessions: ((json['sessions'] as List?) ?? const [])
          .nonNulls
          .map((e) => WorkerSessionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final sessions = this.sessions;
    final nextToken = this.nextToken;
    return {
      'sessions': sessions,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class UpdateWorkerScheduleResponse {
  /// The assigned sessions to update.
  final Map<String, AssignedSession> assignedSessions;

  /// The session actions associated with the worker schedule to cancel.
  final Map<String, List<String>> cancelSessionActions;

  /// Updates the time interval (in seconds) for the schedule.
  final int updateIntervalSeconds;

  /// The status to update the worker to.
  final DesiredWorkerStatus? desiredWorkerStatus;

  UpdateWorkerScheduleResponse({
    required this.assignedSessions,
    required this.cancelSessionActions,
    required this.updateIntervalSeconds,
    this.desiredWorkerStatus,
  });

  factory UpdateWorkerScheduleResponse.fromJson(Map<String, dynamic> json) {
    return UpdateWorkerScheduleResponse(
      assignedSessions: ((json['assignedSessions'] as Map<String, dynamic>?) ??
              const <String, dynamic>{})
          .map((k, e) =>
              MapEntry(k, AssignedSession.fromJson(e as Map<String, dynamic>))),
      cancelSessionActions:
          ((json['cancelSessionActions'] as Map<String, dynamic>?) ??
                  const <String, dynamic>{})
              .map((k, e) => MapEntry(
                  k, (e as List).nonNulls.map((e) => e as String).toList())),
      updateIntervalSeconds: (json['updateIntervalSeconds'] as int?) ?? 0,
      desiredWorkerStatus: (json['desiredWorkerStatus'] as String?)
          ?.let(DesiredWorkerStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final assignedSessions = this.assignedSessions;
    final cancelSessionActions = this.cancelSessionActions;
    final updateIntervalSeconds = this.updateIntervalSeconds;
    final desiredWorkerStatus = this.desiredWorkerStatus;
    return {
      'assignedSessions': assignedSessions,
      'cancelSessionActions': cancelSessionActions,
      'updateIntervalSeconds': updateIntervalSeconds,
      if (desiredWorkerStatus != null)
        'desiredWorkerStatus': desiredWorkerStatus.value,
    };
  }
}

/// Mixin that adds an optional ARN field to response structures. Apply to
/// SummaryMixins (flows into Get, Summary, and BatchGet) and Create outputs.
class CreateQueueResponse {
  /// The queue ID.
  final String queueId;

  CreateQueueResponse({
    required this.queueId,
  });

  factory CreateQueueResponse.fromJson(Map<String, dynamic> json) {
    return CreateQueueResponse(
      queueId: (json['queueId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final queueId = this.queueId;
    return {
      'queueId': queueId,
    };
  }
}

/// Mixin that adds an optional ARN field to response structures. Apply to
/// SummaryMixins (flows into Get, Summary, and BatchGet) and Create outputs.
class GetQueueResponse {
  /// The date and time the resource was created.
  final DateTime createdAt;

  /// The user or system that created this resource.
  final String createdBy;

  /// The default action taken on a queue if a budget wasn't configured.
  final DefaultQueueBudgetAction defaultBudgetAction;

  /// The display name of the queue.
  /// <important>
  /// This field can store any content. Escape or encode this content before
  /// displaying it on a webpage or any other system that might interpret the
  /// content of this field.
  /// </important>
  final String displayName;

  /// The farm ID for the queue.
  final String farmId;

  /// The queue ID.
  final String queueId;

  /// The status of the queue.
  ///
  /// <ul>
  /// <li>
  /// <code>ACTIVE</code>–The queue is active.
  /// </li>
  /// <li>
  /// <code>SCHEDULING</code>–The queue is scheduling.
  /// </li>
  /// <li>
  /// <code>SCHEDULING_BLOCKED</code>–The queue scheduling is blocked. See the
  /// provided reason.
  /// </li>
  /// </ul>
  final QueueStatus status;

  /// The storage profile IDs for the queue.
  final List<String>? allowedStorageProfileIds;

  /// The reason the queue was blocked.
  final QueueBlockedReason? blockedReason;

  /// The description of the queue.
  /// <important>
  /// This field can store any content. Escape or encode this content before
  /// displaying it on a webpage or any other system that might interpret the
  /// content of this field.
  /// </important>
  final String? description;

  /// The job attachment settings for the queue.
  final JobAttachmentSettings? jobAttachmentSettings;

  /// The jobs in the queue ran as this specified POSIX user.
  final JobRunAsUser? jobRunAsUser;

  /// A list of the required file system location names in the queue.
  final List<String>? requiredFileSystemLocationNames;

  /// The IAM role ARN.
  final String? roleArn;

  /// The scheduling configuration for the queue. This configuration determines
  /// how workers are assigned to jobs in the queue.
  final SchedulingConfiguration? schedulingConfiguration;

  /// The date and time the resource was updated.
  final DateTime? updatedAt;

  /// The user or system that updated this resource.
  final String? updatedBy;

  GetQueueResponse({
    required this.createdAt,
    required this.createdBy,
    required this.defaultBudgetAction,
    required this.displayName,
    required this.farmId,
    required this.queueId,
    required this.status,
    this.allowedStorageProfileIds,
    this.blockedReason,
    this.description,
    this.jobAttachmentSettings,
    this.jobRunAsUser,
    this.requiredFileSystemLocationNames,
    this.roleArn,
    this.schedulingConfiguration,
    this.updatedAt,
    this.updatedBy,
  });

  factory GetQueueResponse.fromJson(Map<String, dynamic> json) {
    return GetQueueResponse(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      createdBy: (json['createdBy'] as String?) ?? '',
      defaultBudgetAction: DefaultQueueBudgetAction.fromString(
          (json['defaultBudgetAction'] as String?) ?? ''),
      displayName: (json['displayName'] as String?) ?? '',
      farmId: (json['farmId'] as String?) ?? '',
      queueId: (json['queueId'] as String?) ?? '',
      status: QueueStatus.fromString((json['status'] as String?) ?? ''),
      allowedStorageProfileIds: (json['allowedStorageProfileIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      blockedReason: (json['blockedReason'] as String?)
          ?.let(QueueBlockedReason.fromString),
      description: json['description'] as String?,
      jobAttachmentSettings: json['jobAttachmentSettings'] != null
          ? JobAttachmentSettings.fromJson(
              json['jobAttachmentSettings'] as Map<String, dynamic>)
          : null,
      jobRunAsUser: json['jobRunAsUser'] != null
          ? JobRunAsUser.fromJson(json['jobRunAsUser'] as Map<String, dynamic>)
          : null,
      requiredFileSystemLocationNames:
          (json['requiredFileSystemLocationNames'] as List?)
              ?.nonNulls
              .map((e) => e as String)
              .toList(),
      roleArn: json['roleArn'] as String?,
      schedulingConfiguration: json['schedulingConfiguration'] != null
          ? SchedulingConfiguration.fromJson(
              json['schedulingConfiguration'] as Map<String, dynamic>)
          : null,
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final defaultBudgetAction = this.defaultBudgetAction;
    final displayName = this.displayName;
    final farmId = this.farmId;
    final queueId = this.queueId;
    final status = this.status;
    final allowedStorageProfileIds = this.allowedStorageProfileIds;
    final blockedReason = this.blockedReason;
    final description = this.description;
    final jobAttachmentSettings = this.jobAttachmentSettings;
    final jobRunAsUser = this.jobRunAsUser;
    final requiredFileSystemLocationNames =
        this.requiredFileSystemLocationNames;
    final roleArn = this.roleArn;
    final schedulingConfiguration = this.schedulingConfiguration;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'createdBy': createdBy,
      'defaultBudgetAction': defaultBudgetAction.value,
      'displayName': displayName,
      'farmId': farmId,
      'queueId': queueId,
      'status': status.value,
      if (allowedStorageProfileIds != null)
        'allowedStorageProfileIds': allowedStorageProfileIds,
      if (blockedReason != null) 'blockedReason': blockedReason.value,
      if (description != null) 'description': description,
      if (jobAttachmentSettings != null)
        'jobAttachmentSettings': jobAttachmentSettings,
      if (jobRunAsUser != null) 'jobRunAsUser': jobRunAsUser,
      if (requiredFileSystemLocationNames != null)
        'requiredFileSystemLocationNames': requiredFileSystemLocationNames,
      if (roleArn != null) 'roleArn': roleArn,
      if (schedulingConfiguration != null)
        'schedulingConfiguration': schedulingConfiguration,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

class UpdateQueueResponse {
  UpdateQueueResponse();

  factory UpdateQueueResponse.fromJson(Map<String, dynamic> _) {
    return UpdateQueueResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteQueueResponse {
  DeleteQueueResponse();

  factory DeleteQueueResponse.fromJson(Map<String, dynamic> _) {
    return DeleteQueueResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Shared pagination field for List operation outputs (nextToken).
class ListQueuesResponse {
  /// The queues on the list.
  final List<QueueSummary> queues;

  /// If Deadline Cloud returns <code>nextToken</code>, then there are more
  /// results available. The value of <code>nextToken</code> is a unique
  /// pagination token for each page. To retrieve the next page, call the
  /// operation again using the returned token. Keep all other arguments
  /// unchanged. If no results remain, then <code>nextToken</code> is set to
  /// <code>null</code>. Each pagination token expires after 24 hours. If you
  /// provide a token that isn't valid, then you receive an HTTP 400
  /// <code>ValidationException</code> error.
  final String? nextToken;

  ListQueuesResponse({
    required this.queues,
    this.nextToken,
  });

  factory ListQueuesResponse.fromJson(Map<String, dynamic> json) {
    return ListQueuesResponse(
      queues: ((json['queues'] as List?) ?? const [])
          .nonNulls
          .map((e) => QueueSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final queues = this.queues;
    final nextToken = this.nextToken;
    return {
      'queues': queues,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class AssociateMemberToQueueResponse {
  AssociateMemberToQueueResponse();

  factory AssociateMemberToQueueResponse.fromJson(Map<String, dynamic> _) {
    return AssociateMemberToQueueResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Shared response body for AssumeRole operations where credentials are
/// required. AssumeQueueRoleForWorkerResponse is excluded because credentials
/// is optional there because Queue.roleArn is optional, so the mixin's
/// @required trait would be incorrect.
class AssumeQueueRoleForReadResponse {
  /// The credentials for the queue role.
  final AwsCredentials credentials;

  AssumeQueueRoleForReadResponse({
    required this.credentials,
  });

  factory AssumeQueueRoleForReadResponse.fromJson(Map<String, dynamic> json) {
    return AssumeQueueRoleForReadResponse(
      credentials: AwsCredentials.fromJson(
          (json['credentials'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final credentials = this.credentials;
    return {
      'credentials': credentials,
    };
  }
}

/// Shared response body for AssumeRole operations where credentials are
/// required. AssumeQueueRoleForWorkerResponse is excluded because credentials
/// is optional there because Queue.roleArn is optional, so the mixin's
/// @required trait would be incorrect.
class AssumeQueueRoleForUserResponse {
  /// The credentials for the queue role that a user has access to.
  final AwsCredentials credentials;

  AssumeQueueRoleForUserResponse({
    required this.credentials,
  });

  factory AssumeQueueRoleForUserResponse.fromJson(Map<String, dynamic> json) {
    return AssumeQueueRoleForUserResponse(
      credentials: AwsCredentials.fromJson(
          (json['credentials'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final credentials = this.credentials;
    return {
      'credentials': credentials,
    };
  }
}

class CreateQueueEnvironmentResponse {
  /// The queue environment ID.
  final String queueEnvironmentId;

  CreateQueueEnvironmentResponse({
    required this.queueEnvironmentId,
  });

  factory CreateQueueEnvironmentResponse.fromJson(Map<String, dynamic> json) {
    return CreateQueueEnvironmentResponse(
      queueEnvironmentId: (json['queueEnvironmentId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final queueEnvironmentId = this.queueEnvironmentId;
    return {
      'queueEnvironmentId': queueEnvironmentId,
    };
  }
}

class DeleteQueueEnvironmentResponse {
  DeleteQueueEnvironmentResponse();

  factory DeleteQueueEnvironmentResponse.fromJson(Map<String, dynamic> _) {
    return DeleteQueueEnvironmentResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DisassociateMemberFromQueueResponse {
  DisassociateMemberFromQueueResponse();

  factory DisassociateMemberFromQueueResponse.fromJson(Map<String, dynamic> _) {
    return DisassociateMemberFromQueueResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class GetQueueEnvironmentResponse {
  /// The date and time the resource was created.
  final DateTime createdAt;

  /// The user or system that created this resource.&gt;
  final String createdBy;

  /// The name of the queue environment.
  final String name;

  /// The priority of the queue environment.
  final int priority;

  /// The queue environment ID.
  final String queueEnvironmentId;

  /// The template for the queue environment.
  final String template;

  /// The type of template for the queue environment.
  final EnvironmentTemplateType templateType;

  /// The date and time the resource was updated.
  final DateTime? updatedAt;

  /// The user or system that updated this resource.
  final String? updatedBy;

  GetQueueEnvironmentResponse({
    required this.createdAt,
    required this.createdBy,
    required this.name,
    required this.priority,
    required this.queueEnvironmentId,
    required this.template,
    required this.templateType,
    this.updatedAt,
    this.updatedBy,
  });

  factory GetQueueEnvironmentResponse.fromJson(Map<String, dynamic> json) {
    return GetQueueEnvironmentResponse(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      createdBy: (json['createdBy'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      priority: (json['priority'] as int?) ?? 0,
      queueEnvironmentId: (json['queueEnvironmentId'] as String?) ?? '',
      template: (json['template'] as String?) ?? '',
      templateType: EnvironmentTemplateType.fromString(
          (json['templateType'] as String?) ?? ''),
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final name = this.name;
    final priority = this.priority;
    final queueEnvironmentId = this.queueEnvironmentId;
    final template = this.template;
    final templateType = this.templateType;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'createdBy': createdBy,
      'name': name,
      'priority': priority,
      'queueEnvironmentId': queueEnvironmentId,
      'template': template,
      'templateType': templateType.value,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

class GetStorageProfileForQueueResponse {
  /// The display name of the storage profile connected to a queue.
  /// <important>
  /// This field can store any content. Escape or encode this content before
  /// displaying it on a webpage or any other system that might interpret the
  /// content of this field.
  /// </important>
  final String displayName;

  /// The operating system of the storage profile in the queue.
  final StorageProfileOperatingSystemFamily osFamily;

  /// The storage profile ID.
  final String storageProfileId;

  /// The location of the files for the storage profile within the queue.
  final List<FileSystemLocation>? fileSystemLocations;

  GetStorageProfileForQueueResponse({
    required this.displayName,
    required this.osFamily,
    required this.storageProfileId,
    this.fileSystemLocations,
  });

  factory GetStorageProfileForQueueResponse.fromJson(
      Map<String, dynamic> json) {
    return GetStorageProfileForQueueResponse(
      displayName: (json['displayName'] as String?) ?? '',
      osFamily: StorageProfileOperatingSystemFamily.fromString(
          (json['osFamily'] as String?) ?? ''),
      storageProfileId: (json['storageProfileId'] as String?) ?? '',
      fileSystemLocations: (json['fileSystemLocations'] as List?)
          ?.nonNulls
          .map((e) => FileSystemLocation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final displayName = this.displayName;
    final osFamily = this.osFamily;
    final storageProfileId = this.storageProfileId;
    final fileSystemLocations = this.fileSystemLocations;
    return {
      'displayName': displayName,
      'osFamily': osFamily.value,
      'storageProfileId': storageProfileId,
      if (fileSystemLocations != null)
        'fileSystemLocations': fileSystemLocations,
    };
  }
}

/// Shared pagination field for List operation outputs (nextToken).
class ListQueueEnvironmentsResponse {
  /// The environments to include in the queue environments list.
  final List<QueueEnvironmentSummary> environments;

  /// If Deadline Cloud returns <code>nextToken</code>, then there are more
  /// results available. The value of <code>nextToken</code> is a unique
  /// pagination token for each page. To retrieve the next page, call the
  /// operation again using the returned token. Keep all other arguments
  /// unchanged. If no results remain, then <code>nextToken</code> is set to
  /// <code>null</code>. Each pagination token expires after 24 hours. If you
  /// provide a token that isn't valid, then you receive an HTTP 400
  /// <code>ValidationException</code> error.
  final String? nextToken;

  ListQueueEnvironmentsResponse({
    required this.environments,
    this.nextToken,
  });

  factory ListQueueEnvironmentsResponse.fromJson(Map<String, dynamic> json) {
    return ListQueueEnvironmentsResponse(
      environments: ((json['environments'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              QueueEnvironmentSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final environments = this.environments;
    final nextToken = this.nextToken;
    return {
      'environments': environments,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Shared pagination field for List operation outputs (nextToken).
class ListQueueMembersResponse {
  /// The members on the list.
  final List<QueueMember> members;

  /// If Deadline Cloud returns <code>nextToken</code>, then there are more
  /// results available. The value of <code>nextToken</code> is a unique
  /// pagination token for each page. To retrieve the next page, call the
  /// operation again using the returned token. Keep all other arguments
  /// unchanged. If no results remain, then <code>nextToken</code> is set to
  /// <code>null</code>. Each pagination token expires after 24 hours. If you
  /// provide a token that isn't valid, then you receive an HTTP 400
  /// <code>ValidationException</code> error.
  final String? nextToken;

  ListQueueMembersResponse({
    required this.members,
    this.nextToken,
  });

  factory ListQueueMembersResponse.fromJson(Map<String, dynamic> json) {
    return ListQueueMembersResponse(
      members: ((json['members'] as List?) ?? const [])
          .nonNulls
          .map((e) => QueueMember.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final members = this.members;
    final nextToken = this.nextToken;
    return {
      'members': members,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Shared pagination field for List operation outputs (nextToken).
class ListStorageProfilesForQueueResponse {
  /// The storage profiles in the queue.
  final List<StorageProfileSummary> storageProfiles;

  /// If Deadline Cloud returns <code>nextToken</code>, then there are more
  /// results available. The value of <code>nextToken</code> is a unique
  /// pagination token for each page. To retrieve the next page, call the
  /// operation again using the returned token. Keep all other arguments
  /// unchanged. If no results remain, then <code>nextToken</code> is set to
  /// <code>null</code>. Each pagination token expires after 24 hours. If you
  /// provide a token that isn't valid, then you receive an HTTP 400
  /// <code>ValidationException</code> error.
  final String? nextToken;

  ListStorageProfilesForQueueResponse({
    required this.storageProfiles,
    this.nextToken,
  });

  factory ListStorageProfilesForQueueResponse.fromJson(
      Map<String, dynamic> json) {
    return ListStorageProfilesForQueueResponse(
      storageProfiles: ((json['storageProfiles'] as List?) ?? const [])
          .nonNulls
          .map((e) => StorageProfileSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final storageProfiles = this.storageProfiles;
    final nextToken = this.nextToken;
    return {
      'storageProfiles': storageProfiles,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class UpdateQueueEnvironmentResponse {
  UpdateQueueEnvironmentResponse();

  factory UpdateQueueEnvironmentResponse.fromJson(Map<String, dynamic> _) {
    return UpdateQueueEnvironmentResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Mixin that adds an optional ARN field to response structures. Apply to
/// SummaryMixins (flows into Get, Summary, and BatchGet) and Create outputs.
class CreateJobResponse {
  /// The job ID.
  final String jobId;

  CreateJobResponse({
    required this.jobId,
  });

  factory CreateJobResponse.fromJson(Map<String, dynamic> json) {
    return CreateJobResponse(
      jobId: (json['jobId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    return {
      'jobId': jobId,
    };
  }
}

/// Mixin that adds an optional ARN field to response structures. Apply to
/// SummaryMixins (flows into Get, Summary, and BatchGet) and Create outputs.
class GetJobResponse {
  /// The date and time the resource was created.
  final DateTime createdAt;

  /// The user or system that created this resource.
  final String createdBy;

  /// The job ID.
  final String jobId;

  /// The life cycle status for the job.
  final JobLifecycleStatus lifecycleStatus;

  /// A message that communicates the status of the life cycle for the job.
  final String lifecycleStatusMessage;

  /// The name of the job.
  final String name;

  /// The job priority.
  final int priority;

  /// The attachments for the job.
  final Attachments? attachments;

  /// The description of the job.
  /// <important>
  /// This field can store any content. Escape or encode this content before
  /// displaying it on a webpage or any other system that might interpret the
  /// content of this field.
  /// </important>
  final String? description;

  /// The date and time the resource ended running.
  final DateTime? endedAt;

  /// The number of task failures before the job stops running and is marked as
  /// <code>FAILED</code>.
  final int? maxFailedTasksCount;

  /// The maximum number of retries per failed tasks.
  final int? maxRetriesPerTask;

  /// The maximum number of worker hosts that can concurrently process a job. When
  /// the <code>maxWorkerCount</code> is reached, no more workers will be assigned
  /// to process the job, even if the fleets assigned to the job's queue has
  /// available workers.
  ///
  /// If you don't set the <code>maxWorkerCount</code> when you create a job, this
  /// value is not returned in the response.
  final int? maxWorkerCount;

  /// The parameters for the job.
  final Map<String, JobParameter>? parameters;

  /// The job ID for the source job.
  final String? sourceJobId;

  /// The date and time the resource started running.
  final DateTime? startedAt;

  /// The storage profile ID associated with the job.
  final String? storageProfileId;

  /// The task status with which the job started.
  final JobTargetTaskRunStatus? targetTaskRunStatus;

  /// The total number of times tasks from the job failed and were retried.
  final int? taskFailureRetryCount;

  /// The task run status for the job.
  final TaskRunStatus? taskRunStatus;

  /// The number of tasks running on the job.
  final Map<TaskRunStatus, int>? taskRunStatusCounts;

  /// The date and time the resource was updated.
  final DateTime? updatedAt;

  /// The user or system that updated this resource.
  final String? updatedBy;

  GetJobResponse({
    required this.createdAt,
    required this.createdBy,
    required this.jobId,
    required this.lifecycleStatus,
    required this.lifecycleStatusMessage,
    required this.name,
    required this.priority,
    this.attachments,
    this.description,
    this.endedAt,
    this.maxFailedTasksCount,
    this.maxRetriesPerTask,
    this.maxWorkerCount,
    this.parameters,
    this.sourceJobId,
    this.startedAt,
    this.storageProfileId,
    this.targetTaskRunStatus,
    this.taskFailureRetryCount,
    this.taskRunStatus,
    this.taskRunStatusCounts,
    this.updatedAt,
    this.updatedBy,
  });

  factory GetJobResponse.fromJson(Map<String, dynamic> json) {
    return GetJobResponse(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      createdBy: (json['createdBy'] as String?) ?? '',
      jobId: (json['jobId'] as String?) ?? '',
      lifecycleStatus: JobLifecycleStatus.fromString(
          (json['lifecycleStatus'] as String?) ?? ''),
      lifecycleStatusMessage: (json['lifecycleStatusMessage'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      priority: (json['priority'] as int?) ?? 0,
      attachments: json['attachments'] != null
          ? Attachments.fromJson(json['attachments'] as Map<String, dynamic>)
          : null,
      description: json['description'] as String?,
      endedAt: timeStampFromJson(json['endedAt']),
      maxFailedTasksCount: json['maxFailedTasksCount'] as int?,
      maxRetriesPerTask: json['maxRetriesPerTask'] as int?,
      maxWorkerCount: json['maxWorkerCount'] as int?,
      parameters: (json['parameters'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, JobParameter.fromJson(e as Map<String, dynamic>))),
      sourceJobId: json['sourceJobId'] as String?,
      startedAt: timeStampFromJson(json['startedAt']),
      storageProfileId: json['storageProfileId'] as String?,
      targetTaskRunStatus: (json['targetTaskRunStatus'] as String?)
          ?.let(JobTargetTaskRunStatus.fromString),
      taskFailureRetryCount: json['taskFailureRetryCount'] as int?,
      taskRunStatus:
          (json['taskRunStatus'] as String?)?.let(TaskRunStatus.fromString),
      taskRunStatusCounts:
          (json['taskRunStatusCounts'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(TaskRunStatus.fromString(k), e as int)),
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final jobId = this.jobId;
    final lifecycleStatus = this.lifecycleStatus;
    final lifecycleStatusMessage = this.lifecycleStatusMessage;
    final name = this.name;
    final priority = this.priority;
    final attachments = this.attachments;
    final description = this.description;
    final endedAt = this.endedAt;
    final maxFailedTasksCount = this.maxFailedTasksCount;
    final maxRetriesPerTask = this.maxRetriesPerTask;
    final maxWorkerCount = this.maxWorkerCount;
    final parameters = this.parameters;
    final sourceJobId = this.sourceJobId;
    final startedAt = this.startedAt;
    final storageProfileId = this.storageProfileId;
    final targetTaskRunStatus = this.targetTaskRunStatus;
    final taskFailureRetryCount = this.taskFailureRetryCount;
    final taskRunStatus = this.taskRunStatus;
    final taskRunStatusCounts = this.taskRunStatusCounts;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'createdBy': createdBy,
      'jobId': jobId,
      'lifecycleStatus': lifecycleStatus.value,
      'lifecycleStatusMessage': lifecycleStatusMessage,
      'name': name,
      'priority': priority,
      if (attachments != null) 'attachments': attachments,
      if (description != null) 'description': description,
      if (endedAt != null) 'endedAt': iso8601ToJson(endedAt),
      if (maxFailedTasksCount != null)
        'maxFailedTasksCount': maxFailedTasksCount,
      if (maxRetriesPerTask != null) 'maxRetriesPerTask': maxRetriesPerTask,
      if (maxWorkerCount != null) 'maxWorkerCount': maxWorkerCount,
      if (parameters != null) 'parameters': parameters,
      if (sourceJobId != null) 'sourceJobId': sourceJobId,
      if (startedAt != null) 'startedAt': iso8601ToJson(startedAt),
      if (storageProfileId != null) 'storageProfileId': storageProfileId,
      if (targetTaskRunStatus != null)
        'targetTaskRunStatus': targetTaskRunStatus.value,
      if (taskFailureRetryCount != null)
        'taskFailureRetryCount': taskFailureRetryCount,
      if (taskRunStatus != null) 'taskRunStatus': taskRunStatus.value,
      if (taskRunStatusCounts != null)
        'taskRunStatusCounts':
            taskRunStatusCounts.map((k, e) => MapEntry(k.value, e)),
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

class UpdateJobResponse {
  UpdateJobResponse();

  factory UpdateJobResponse.fromJson(Map<String, dynamic> _) {
    return UpdateJobResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Shared pagination field for List operation outputs (nextToken).
class ListJobsResponse {
  /// The jobs on the list.
  final List<JobSummary> jobs;

  /// If Deadline Cloud returns <code>nextToken</code>, then there are more
  /// results available. The value of <code>nextToken</code> is a unique
  /// pagination token for each page. To retrieve the next page, call the
  /// operation again using the returned token. Keep all other arguments
  /// unchanged. If no results remain, then <code>nextToken</code> is set to
  /// <code>null</code>. Each pagination token expires after 24 hours. If you
  /// provide a token that isn't valid, then you receive an HTTP 400
  /// <code>ValidationException</code> error.
  final String? nextToken;

  ListJobsResponse({
    required this.jobs,
    this.nextToken,
  });

  factory ListJobsResponse.fromJson(Map<String, dynamic> json) {
    return ListJobsResponse(
      jobs: ((json['jobs'] as List?) ?? const [])
          .nonNulls
          .map((e) => JobSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobs = this.jobs;
    final nextToken = this.nextToken;
    return {
      'jobs': jobs,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class AssociateMemberToJobResponse {
  AssociateMemberToJobResponse();

  factory AssociateMemberToJobResponse.fromJson(Map<String, dynamic> _) {
    return AssociateMemberToJobResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class CopyJobTemplateResponse {
  /// The format of the job template, either <code>JSON</code> or
  /// <code>YAML</code>.
  final JobTemplateType templateType;

  CopyJobTemplateResponse({
    required this.templateType,
  });

  factory CopyJobTemplateResponse.fromJson(Map<String, dynamic> json) {
    return CopyJobTemplateResponse(
      templateType:
          JobTemplateType.fromString((json['templateType'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final templateType = this.templateType;
    return {
      'templateType': templateType.value,
    };
  }
}

class DisassociateMemberFromJobResponse {
  DisassociateMemberFromJobResponse();

  factory DisassociateMemberFromJobResponse.fromJson(Map<String, dynamic> _) {
    return DisassociateMemberFromJobResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Session lifecycle/status fields, ordered after IDs in session shapes.
class GetSessionResponse {
  /// The fleet ID for the session.
  final String fleetId;

  /// The life cycle status of the session.
  final SessionLifecycleStatus lifecycleStatus;

  /// The session log.
  final LogConfiguration log;

  /// The session ID.
  final String sessionId;

  /// The date and time the resource started running.
  final DateTime startedAt;

  /// The worker ID for the session.
  final String workerId;

  /// The date and time the resource ended running.
  final DateTime? endedAt;

  /// Provides the Amazon EC2 properties of the host.
  final HostPropertiesResponse? hostProperties;

  /// The life cycle status with which the session started.
  final SessionLifecycleTargetStatus? targetLifecycleStatus;

  /// The date and time the resource was updated.
  final DateTime? updatedAt;

  /// The user or system that updated this resource.
  final String? updatedBy;

  /// The worker log for the session.
  final LogConfiguration? workerLog;

  GetSessionResponse({
    required this.fleetId,
    required this.lifecycleStatus,
    required this.log,
    required this.sessionId,
    required this.startedAt,
    required this.workerId,
    this.endedAt,
    this.hostProperties,
    this.targetLifecycleStatus,
    this.updatedAt,
    this.updatedBy,
    this.workerLog,
  });

  factory GetSessionResponse.fromJson(Map<String, dynamic> json) {
    return GetSessionResponse(
      fleetId: (json['fleetId'] as String?) ?? '',
      lifecycleStatus: SessionLifecycleStatus.fromString(
          (json['lifecycleStatus'] as String?) ?? ''),
      log: LogConfiguration.fromJson(
          (json['log'] as Map<String, dynamic>?) ?? const <String, dynamic>{}),
      sessionId: (json['sessionId'] as String?) ?? '',
      startedAt: nonNullableTimeStampFromJson(json['startedAt'] ?? 0),
      workerId: (json['workerId'] as String?) ?? '',
      endedAt: timeStampFromJson(json['endedAt']),
      hostProperties: json['hostProperties'] != null
          ? HostPropertiesResponse.fromJson(
              json['hostProperties'] as Map<String, dynamic>)
          : null,
      targetLifecycleStatus: (json['targetLifecycleStatus'] as String?)
          ?.let(SessionLifecycleTargetStatus.fromString),
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
      workerLog: json['workerLog'] != null
          ? LogConfiguration.fromJson(json['workerLog'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final fleetId = this.fleetId;
    final lifecycleStatus = this.lifecycleStatus;
    final log = this.log;
    final sessionId = this.sessionId;
    final startedAt = this.startedAt;
    final workerId = this.workerId;
    final endedAt = this.endedAt;
    final hostProperties = this.hostProperties;
    final targetLifecycleStatus = this.targetLifecycleStatus;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    final workerLog = this.workerLog;
    return {
      'fleetId': fleetId,
      'lifecycleStatus': lifecycleStatus.value,
      'log': log,
      'sessionId': sessionId,
      'startedAt': iso8601ToJson(startedAt),
      'workerId': workerId,
      if (endedAt != null) 'endedAt': iso8601ToJson(endedAt),
      if (hostProperties != null) 'hostProperties': hostProperties,
      if (targetLifecycleStatus != null)
        'targetLifecycleStatus': targetLifecycleStatus.value,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
      if (workerLog != null) 'workerLog': workerLog,
    };
  }
}

class GetSessionActionResponse {
  /// The session action definition.
  final SessionActionDefinition definition;

  /// The session action ID.
  final String sessionActionId;

  /// The session ID for the session action.
  final String sessionId;

  /// The status of the session action.
  final SessionActionStatus status;

  /// The limits and their amounts acquired during a session action. If no limits
  /// were acquired during the session, this field isn't returned.
  final List<AcquiredLimit>? acquiredLimits;

  /// The date and time the resource ended running.
  final DateTime? endedAt;

  /// The list of manifest properties that describe file attachments for the task
  /// run.
  final List<TaskRunManifestPropertiesResponse>? manifests;

  /// The process exit code. The default Deadline Cloud worker agent converts
  /// unsigned 32-bit exit codes to signed 32-bit exit codes.
  final int? processExitCode;

  /// The message that communicates the progress of the session action.
  final String? progressMessage;

  /// The percentage completed for a session action.
  final double? progressPercent;

  /// The date and time the resource started running.
  final DateTime? startedAt;

  /// The Linux timestamp of the date and time the session action was last
  /// updated.
  final DateTime? workerUpdatedAt;

  GetSessionActionResponse({
    required this.definition,
    required this.sessionActionId,
    required this.sessionId,
    required this.status,
    this.acquiredLimits,
    this.endedAt,
    this.manifests,
    this.processExitCode,
    this.progressMessage,
    this.progressPercent,
    this.startedAt,
    this.workerUpdatedAt,
  });

  factory GetSessionActionResponse.fromJson(Map<String, dynamic> json) {
    return GetSessionActionResponse(
      definition: SessionActionDefinition.fromJson(
          (json['definition'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      sessionActionId: (json['sessionActionId'] as String?) ?? '',
      sessionId: (json['sessionId'] as String?) ?? '',
      status: SessionActionStatus.fromString((json['status'] as String?) ?? ''),
      acquiredLimits: (json['acquiredLimits'] as List?)
          ?.nonNulls
          .map((e) => AcquiredLimit.fromJson(e as Map<String, dynamic>))
          .toList(),
      endedAt: timeStampFromJson(json['endedAt']),
      manifests: (json['manifests'] as List?)
          ?.nonNulls
          .map((e) => TaskRunManifestPropertiesResponse.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      processExitCode: json['processExitCode'] as int?,
      progressMessage: json['progressMessage'] as String?,
      progressPercent: json['progressPercent'] as double?,
      startedAt: timeStampFromJson(json['startedAt']),
      workerUpdatedAt: timeStampFromJson(json['workerUpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final definition = this.definition;
    final sessionActionId = this.sessionActionId;
    final sessionId = this.sessionId;
    final status = this.status;
    final acquiredLimits = this.acquiredLimits;
    final endedAt = this.endedAt;
    final manifests = this.manifests;
    final processExitCode = this.processExitCode;
    final progressMessage = this.progressMessage;
    final progressPercent = this.progressPercent;
    final startedAt = this.startedAt;
    final workerUpdatedAt = this.workerUpdatedAt;
    return {
      'definition': definition,
      'sessionActionId': sessionActionId,
      'sessionId': sessionId,
      'status': status.value,
      if (acquiredLimits != null) 'acquiredLimits': acquiredLimits,
      if (endedAt != null) 'endedAt': iso8601ToJson(endedAt),
      if (manifests != null) 'manifests': manifests,
      if (processExitCode != null) 'processExitCode': processExitCode,
      if (progressMessage != null) 'progressMessage': progressMessage,
      if (progressPercent != null) 'progressPercent': progressPercent,
      if (startedAt != null) 'startedAt': iso8601ToJson(startedAt),
      if (workerUpdatedAt != null)
        'workerUpdatedAt': iso8601ToJson(workerUpdatedAt),
    };
  }
}

class GetStepResponse {
  /// The date and time the resource was created.
  final DateTime createdAt;

  /// The user or system that created this resource.
  final String createdBy;

  /// The life cycle status of the step.
  final StepLifecycleStatus lifecycleStatus;

  /// The name of the step.
  final String name;

  /// The step ID.
  final String stepId;

  /// The task run status for the job.
  final TaskRunStatus taskRunStatus;

  /// The number of tasks running on the job.
  final Map<TaskRunStatus, int> taskRunStatusCounts;

  /// The number of dependencies in the step.
  final DependencyCounts? dependencyCounts;

  /// The description of the step.
  /// <important>
  /// This field can store any content. Escape or encode this content before
  /// displaying it on a webpage or any other system that might interpret the
  /// content of this field.
  /// </important>
  final String? description;

  /// The date and time the resource ended running.
  final DateTime? endedAt;

  /// A message that describes the lifecycle status of the step.
  final String? lifecycleStatusMessage;

  /// A list of step parameters and the combination expression for the step.
  final ParameterSpace? parameterSpace;

  /// The required capabilities of the step.
  final StepRequiredCapabilities? requiredCapabilities;

  /// The date and time the resource started running.
  final DateTime? startedAt;

  /// The task status with which the job started.
  final StepTargetTaskRunStatus? targetTaskRunStatus;

  /// The total number of times tasks from the step failed and were retried.
  final int? taskFailureRetryCount;

  /// The date and time the resource was updated.
  final DateTime? updatedAt;

  /// The user or system that updated this resource.
  final String? updatedBy;

  GetStepResponse({
    required this.createdAt,
    required this.createdBy,
    required this.lifecycleStatus,
    required this.name,
    required this.stepId,
    required this.taskRunStatus,
    required this.taskRunStatusCounts,
    this.dependencyCounts,
    this.description,
    this.endedAt,
    this.lifecycleStatusMessage,
    this.parameterSpace,
    this.requiredCapabilities,
    this.startedAt,
    this.targetTaskRunStatus,
    this.taskFailureRetryCount,
    this.updatedAt,
    this.updatedBy,
  });

  factory GetStepResponse.fromJson(Map<String, dynamic> json) {
    return GetStepResponse(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      createdBy: (json['createdBy'] as String?) ?? '',
      lifecycleStatus: StepLifecycleStatus.fromString(
          (json['lifecycleStatus'] as String?) ?? ''),
      name: (json['name'] as String?) ?? '',
      stepId: (json['stepId'] as String?) ?? '',
      taskRunStatus:
          TaskRunStatus.fromString((json['taskRunStatus'] as String?) ?? ''),
      taskRunStatusCounts:
          ((json['taskRunStatusCounts'] as Map<String, dynamic>?) ??
                  const <String, dynamic>{})
              .map((k, e) => MapEntry(TaskRunStatus.fromString(k), e as int)),
      dependencyCounts: json['dependencyCounts'] != null
          ? DependencyCounts.fromJson(
              json['dependencyCounts'] as Map<String, dynamic>)
          : null,
      description: json['description'] as String?,
      endedAt: timeStampFromJson(json['endedAt']),
      lifecycleStatusMessage: json['lifecycleStatusMessage'] as String?,
      parameterSpace: json['parameterSpace'] != null
          ? ParameterSpace.fromJson(
              json['parameterSpace'] as Map<String, dynamic>)
          : null,
      requiredCapabilities: json['requiredCapabilities'] != null
          ? StepRequiredCapabilities.fromJson(
              json['requiredCapabilities'] as Map<String, dynamic>)
          : null,
      startedAt: timeStampFromJson(json['startedAt']),
      targetTaskRunStatus: (json['targetTaskRunStatus'] as String?)
          ?.let(StepTargetTaskRunStatus.fromString),
      taskFailureRetryCount: json['taskFailureRetryCount'] as int?,
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final lifecycleStatus = this.lifecycleStatus;
    final name = this.name;
    final stepId = this.stepId;
    final taskRunStatus = this.taskRunStatus;
    final taskRunStatusCounts = this.taskRunStatusCounts;
    final dependencyCounts = this.dependencyCounts;
    final description = this.description;
    final endedAt = this.endedAt;
    final lifecycleStatusMessage = this.lifecycleStatusMessage;
    final parameterSpace = this.parameterSpace;
    final requiredCapabilities = this.requiredCapabilities;
    final startedAt = this.startedAt;
    final targetTaskRunStatus = this.targetTaskRunStatus;
    final taskFailureRetryCount = this.taskFailureRetryCount;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'createdBy': createdBy,
      'lifecycleStatus': lifecycleStatus.value,
      'name': name,
      'stepId': stepId,
      'taskRunStatus': taskRunStatus.value,
      'taskRunStatusCounts':
          taskRunStatusCounts.map((k, e) => MapEntry(k.value, e)),
      if (dependencyCounts != null) 'dependencyCounts': dependencyCounts,
      if (description != null) 'description': description,
      if (endedAt != null) 'endedAt': iso8601ToJson(endedAt),
      if (lifecycleStatusMessage != null)
        'lifecycleStatusMessage': lifecycleStatusMessage,
      if (parameterSpace != null) 'parameterSpace': parameterSpace,
      if (requiredCapabilities != null)
        'requiredCapabilities': requiredCapabilities,
      if (startedAt != null) 'startedAt': iso8601ToJson(startedAt),
      if (targetTaskRunStatus != null)
        'targetTaskRunStatus': targetTaskRunStatus.value,
      if (taskFailureRetryCount != null)
        'taskFailureRetryCount': taskFailureRetryCount,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

class GetTaskResponse {
  /// The date and time the resource was created.
  final DateTime createdAt;

  /// The user or system that created this resource.
  final String createdBy;

  /// The run status for the task.
  final TaskRunStatus runStatus;

  /// The task ID.
  final String taskId;

  /// The date and time the resource ended running.
  final DateTime? endedAt;

  /// The number of times that the task failed and was retried.
  final int? failureRetryCount;

  /// The latest session action ID for the task.
  final String? latestSessionActionId;

  /// The parameters for the task.
  final Map<String, TaskParameterValue>? parameters;

  /// The date and time the resource started running.
  final DateTime? startedAt;

  /// The run status with which to start the task.
  final TaskTargetRunStatus? targetRunStatus;

  /// The date and time the resource was updated.
  final DateTime? updatedAt;

  /// The user or system that updated this resource.
  final String? updatedBy;

  GetTaskResponse({
    required this.createdAt,
    required this.createdBy,
    required this.runStatus,
    required this.taskId,
    this.endedAt,
    this.failureRetryCount,
    this.latestSessionActionId,
    this.parameters,
    this.startedAt,
    this.targetRunStatus,
    this.updatedAt,
    this.updatedBy,
  });

  factory GetTaskResponse.fromJson(Map<String, dynamic> json) {
    return GetTaskResponse(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      createdBy: (json['createdBy'] as String?) ?? '',
      runStatus: TaskRunStatus.fromString((json['runStatus'] as String?) ?? ''),
      taskId: (json['taskId'] as String?) ?? '',
      endedAt: timeStampFromJson(json['endedAt']),
      failureRetryCount: json['failureRetryCount'] as int?,
      latestSessionActionId: json['latestSessionActionId'] as String?,
      parameters: (json['parameters'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, TaskParameterValue.fromJson(e as Map<String, dynamic>))),
      startedAt: timeStampFromJson(json['startedAt']),
      targetRunStatus: (json['targetRunStatus'] as String?)
          ?.let(TaskTargetRunStatus.fromString),
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final runStatus = this.runStatus;
    final taskId = this.taskId;
    final endedAt = this.endedAt;
    final failureRetryCount = this.failureRetryCount;
    final latestSessionActionId = this.latestSessionActionId;
    final parameters = this.parameters;
    final startedAt = this.startedAt;
    final targetRunStatus = this.targetRunStatus;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'createdBy': createdBy,
      'runStatus': runStatus.value,
      'taskId': taskId,
      if (endedAt != null) 'endedAt': iso8601ToJson(endedAt),
      if (failureRetryCount != null) 'failureRetryCount': failureRetryCount,
      if (latestSessionActionId != null)
        'latestSessionActionId': latestSessionActionId,
      if (parameters != null) 'parameters': parameters,
      if (startedAt != null) 'startedAt': iso8601ToJson(startedAt),
      if (targetRunStatus != null) 'targetRunStatus': targetRunStatus.value,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

/// Shared pagination field for List operation outputs (nextToken).
class ListJobMembersResponse {
  /// The members on the list.
  final List<JobMember> members;

  /// If Deadline Cloud returns <code>nextToken</code>, then there are more
  /// results available. The value of <code>nextToken</code> is a unique
  /// pagination token for each page. To retrieve the next page, call the
  /// operation again using the returned token. Keep all other arguments
  /// unchanged. If no results remain, then <code>nextToken</code> is set to
  /// <code>null</code>. Each pagination token expires after 24 hours. If you
  /// provide a token that isn't valid, then you receive an HTTP 400
  /// <code>ValidationException</code> error.
  final String? nextToken;

  ListJobMembersResponse({
    required this.members,
    this.nextToken,
  });

  factory ListJobMembersResponse.fromJson(Map<String, dynamic> json) {
    return ListJobMembersResponse(
      members: ((json['members'] as List?) ?? const [])
          .nonNulls
          .map((e) => JobMember.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final members = this.members;
    final nextToken = this.nextToken;
    return {
      'members': members,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Shared pagination field for List operation outputs (nextToken).
class ListJobParameterDefinitionsResponse {
  /// Lists parameter definitions of a job.
  final List<Object> jobParameterDefinitions;

  /// If Deadline Cloud returns <code>nextToken</code>, then there are more
  /// results available. The value of <code>nextToken</code> is a unique
  /// pagination token for each page. To retrieve the next page, call the
  /// operation again using the returned token. Keep all other arguments
  /// unchanged. If no results remain, then <code>nextToken</code> is set to
  /// <code>null</code>. Each pagination token expires after 24 hours. If you
  /// provide a token that isn't valid, then you receive an HTTP 400
  /// <code>ValidationException</code> error.
  final String? nextToken;

  ListJobParameterDefinitionsResponse({
    required this.jobParameterDefinitions,
    this.nextToken,
  });

  factory ListJobParameterDefinitionsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListJobParameterDefinitionsResponse(
      jobParameterDefinitions:
          ((json['jobParameterDefinitions'] as List?) ?? const [])
              .nonNulls
              .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobParameterDefinitions = this.jobParameterDefinitions;
    final nextToken = this.nextToken;
    return {
      'jobParameterDefinitions': jobParameterDefinitions,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Shared pagination field for List operation outputs (nextToken).
class ListSessionActionsResponse {
  /// The session actions.
  final List<SessionActionSummary> sessionActions;

  /// If Deadline Cloud returns <code>nextToken</code>, then there are more
  /// results available. The value of <code>nextToken</code> is a unique
  /// pagination token for each page. To retrieve the next page, call the
  /// operation again using the returned token. Keep all other arguments
  /// unchanged. If no results remain, then <code>nextToken</code> is set to
  /// <code>null</code>. Each pagination token expires after 24 hours. If you
  /// provide a token that isn't valid, then you receive an HTTP 400
  /// <code>ValidationException</code> error.
  final String? nextToken;

  ListSessionActionsResponse({
    required this.sessionActions,
    this.nextToken,
  });

  factory ListSessionActionsResponse.fromJson(Map<String, dynamic> json) {
    return ListSessionActionsResponse(
      sessionActions: ((json['sessionActions'] as List?) ?? const [])
          .nonNulls
          .map((e) => SessionActionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final sessionActions = this.sessionActions;
    final nextToken = this.nextToken;
    return {
      'sessionActions': sessionActions,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Shared pagination field for List operation outputs (nextToken).
class ListSessionsResponse {
  /// The sessions on the list.
  final List<SessionSummary> sessions;

  /// If Deadline Cloud returns <code>nextToken</code>, then there are more
  /// results available. The value of <code>nextToken</code> is a unique
  /// pagination token for each page. To retrieve the next page, call the
  /// operation again using the returned token. Keep all other arguments
  /// unchanged. If no results remain, then <code>nextToken</code> is set to
  /// <code>null</code>. Each pagination token expires after 24 hours. If you
  /// provide a token that isn't valid, then you receive an HTTP 400
  /// <code>ValidationException</code> error.
  final String? nextToken;

  ListSessionsResponse({
    required this.sessions,
    this.nextToken,
  });

  factory ListSessionsResponse.fromJson(Map<String, dynamic> json) {
    return ListSessionsResponse(
      sessions: ((json['sessions'] as List?) ?? const [])
          .nonNulls
          .map((e) => SessionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final sessions = this.sessions;
    final nextToken = this.nextToken;
    return {
      'sessions': sessions,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Shared pagination field for List operation outputs (nextToken).
class ListStepConsumersResponse {
  /// The consumers on the list.
  final List<StepConsumer> consumers;

  /// If Deadline Cloud returns <code>nextToken</code>, then there are more
  /// results available. The value of <code>nextToken</code> is a unique
  /// pagination token for each page. To retrieve the next page, call the
  /// operation again using the returned token. Keep all other arguments
  /// unchanged. If no results remain, then <code>nextToken</code> is set to
  /// <code>null</code>. Each pagination token expires after 24 hours. If you
  /// provide a token that isn't valid, then you receive an HTTP 400
  /// <code>ValidationException</code> error.
  final String? nextToken;

  ListStepConsumersResponse({
    required this.consumers,
    this.nextToken,
  });

  factory ListStepConsumersResponse.fromJson(Map<String, dynamic> json) {
    return ListStepConsumersResponse(
      consumers: ((json['consumers'] as List?) ?? const [])
          .nonNulls
          .map((e) => StepConsumer.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final consumers = this.consumers;
    final nextToken = this.nextToken;
    return {
      'consumers': consumers,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Shared pagination field for List operation outputs (nextToken).
class ListStepDependenciesResponse {
  /// The dependencies on the list.
  final List<StepDependency> dependencies;

  /// If Deadline Cloud returns <code>nextToken</code>, then there are more
  /// results available. The value of <code>nextToken</code> is a unique
  /// pagination token for each page. To retrieve the next page, call the
  /// operation again using the returned token. Keep all other arguments
  /// unchanged. If no results remain, then <code>nextToken</code> is set to
  /// <code>null</code>. Each pagination token expires after 24 hours. If you
  /// provide a token that isn't valid, then you receive an HTTP 400
  /// <code>ValidationException</code> error.
  final String? nextToken;

  ListStepDependenciesResponse({
    required this.dependencies,
    this.nextToken,
  });

  factory ListStepDependenciesResponse.fromJson(Map<String, dynamic> json) {
    return ListStepDependenciesResponse(
      dependencies: ((json['dependencies'] as List?) ?? const [])
          .nonNulls
          .map((e) => StepDependency.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dependencies = this.dependencies;
    final nextToken = this.nextToken;
    return {
      'dependencies': dependencies,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Shared pagination field for List operation outputs (nextToken).
class ListStepsResponse {
  /// The steps on the list.
  final List<StepSummary> steps;

  /// If Deadline Cloud returns <code>nextToken</code>, then there are more
  /// results available. The value of <code>nextToken</code> is a unique
  /// pagination token for each page. To retrieve the next page, call the
  /// operation again using the returned token. Keep all other arguments
  /// unchanged. If no results remain, then <code>nextToken</code> is set to
  /// <code>null</code>. Each pagination token expires after 24 hours. If you
  /// provide a token that isn't valid, then you receive an HTTP 400
  /// <code>ValidationException</code> error.
  final String? nextToken;

  ListStepsResponse({
    required this.steps,
    this.nextToken,
  });

  factory ListStepsResponse.fromJson(Map<String, dynamic> json) {
    return ListStepsResponse(
      steps: ((json['steps'] as List?) ?? const [])
          .nonNulls
          .map((e) => StepSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final steps = this.steps;
    final nextToken = this.nextToken;
    return {
      'steps': steps,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Shared pagination field for List operation outputs (nextToken).
class ListTasksResponse {
  /// Tasks for the job.
  final List<TaskSummary> tasks;

  /// If Deadline Cloud returns <code>nextToken</code>, then there are more
  /// results available. The value of <code>nextToken</code> is a unique
  /// pagination token for each page. To retrieve the next page, call the
  /// operation again using the returned token. Keep all other arguments
  /// unchanged. If no results remain, then <code>nextToken</code> is set to
  /// <code>null</code>. Each pagination token expires after 24 hours. If you
  /// provide a token that isn't valid, then you receive an HTTP 400
  /// <code>ValidationException</code> error.
  final String? nextToken;

  ListTasksResponse({
    required this.tasks,
    this.nextToken,
  });

  factory ListTasksResponse.fromJson(Map<String, dynamic> json) {
    return ListTasksResponse(
      tasks: ((json['tasks'] as List?) ?? const [])
          .nonNulls
          .map((e) => TaskSummary.fromJson(e as Map<String, dynamic>))
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

class UpdateSessionResponse {
  UpdateSessionResponse();

  factory UpdateSessionResponse.fromJson(Map<String, dynamic> _) {
    return UpdateSessionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateStepResponse {
  UpdateStepResponse();

  factory UpdateStepResponse.fromJson(Map<String, dynamic> _) {
    return UpdateStepResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateTaskResponse {
  UpdateTaskResponse();

  factory UpdateTaskResponse.fromJson(Map<String, dynamic> _) {
    return UpdateTaskResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Mixin that adds an optional ARN field to response structures. Apply to
/// SummaryMixins (flows into Get, Summary, and BatchGet) and Create outputs.
class CreateLicenseEndpointResponse {
  /// The license endpoint ID.
  final String licenseEndpointId;

  CreateLicenseEndpointResponse({
    required this.licenseEndpointId,
  });

  factory CreateLicenseEndpointResponse.fromJson(Map<String, dynamic> json) {
    return CreateLicenseEndpointResponse(
      licenseEndpointId: (json['licenseEndpointId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final licenseEndpointId = this.licenseEndpointId;
    return {
      'licenseEndpointId': licenseEndpointId,
    };
  }
}

/// Mixin that adds an optional ARN field to response structures. Apply to
/// SummaryMixins (flows into Get, Summary, and BatchGet) and Create outputs.
class GetLicenseEndpointResponse {
  /// The license endpoint ID.
  final String licenseEndpointId;

  /// The status of the license endpoint.
  final LicenseEndpointStatus status;

  /// The status message of the license endpoint.
  final String statusMessage;

  /// The DNS name.
  final String? dnsName;

  /// The security group IDs for the license endpoint.
  final List<String>? securityGroupIds;

  /// The subnet IDs.
  final List<String>? subnetIds;

  /// The VPC (virtual private cloud) ID associated with the license endpoint.
  final String? vpcId;

  GetLicenseEndpointResponse({
    required this.licenseEndpointId,
    required this.status,
    required this.statusMessage,
    this.dnsName,
    this.securityGroupIds,
    this.subnetIds,
    this.vpcId,
  });

  factory GetLicenseEndpointResponse.fromJson(Map<String, dynamic> json) {
    return GetLicenseEndpointResponse(
      licenseEndpointId: (json['licenseEndpointId'] as String?) ?? '',
      status:
          LicenseEndpointStatus.fromString((json['status'] as String?) ?? ''),
      statusMessage: (json['statusMessage'] as String?) ?? '',
      dnsName: json['dnsName'] as String?,
      securityGroupIds: (json['securityGroupIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      subnetIds: (json['subnetIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      vpcId: json['vpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final licenseEndpointId = this.licenseEndpointId;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final dnsName = this.dnsName;
    final securityGroupIds = this.securityGroupIds;
    final subnetIds = this.subnetIds;
    final vpcId = this.vpcId;
    return {
      'licenseEndpointId': licenseEndpointId,
      'status': status.value,
      'statusMessage': statusMessage,
      if (dnsName != null) 'dnsName': dnsName,
      if (securityGroupIds != null) 'securityGroupIds': securityGroupIds,
      if (subnetIds != null) 'subnetIds': subnetIds,
      if (vpcId != null) 'vpcId': vpcId,
    };
  }
}

class DeleteLicenseEndpointResponse {
  DeleteLicenseEndpointResponse();

  factory DeleteLicenseEndpointResponse.fromJson(Map<String, dynamic> _) {
    return DeleteLicenseEndpointResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Shared pagination field for List operation outputs (nextToken).
class ListLicenseEndpointsResponse {
  /// The license endpoints.
  final List<LicenseEndpointSummary> licenseEndpoints;

  /// If Deadline Cloud returns <code>nextToken</code>, then there are more
  /// results available. The value of <code>nextToken</code> is a unique
  /// pagination token for each page. To retrieve the next page, call the
  /// operation again using the returned token. Keep all other arguments
  /// unchanged. If no results remain, then <code>nextToken</code> is set to
  /// <code>null</code>. Each pagination token expires after 24 hours. If you
  /// provide a token that isn't valid, then you receive an HTTP 400
  /// <code>ValidationException</code> error.
  final String? nextToken;

  ListLicenseEndpointsResponse({
    required this.licenseEndpoints,
    this.nextToken,
  });

  factory ListLicenseEndpointsResponse.fromJson(Map<String, dynamic> json) {
    return ListLicenseEndpointsResponse(
      licenseEndpoints: ((json['licenseEndpoints'] as List?) ?? const [])
          .nonNulls
          .map(
              (e) => LicenseEndpointSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final licenseEndpoints = this.licenseEndpoints;
    final nextToken = this.nextToken;
    return {
      'licenseEndpoints': licenseEndpoints,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class DeleteMeteredProductResponse {
  DeleteMeteredProductResponse();

  factory DeleteMeteredProductResponse.fromJson(Map<String, dynamic> _) {
    return DeleteMeteredProductResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Shared pagination field for List operation outputs (nextToken).
class ListMeteredProductsResponse {
  /// The metered products to list.
  final List<MeteredProductSummary> meteredProducts;

  /// If Deadline Cloud returns <code>nextToken</code>, then there are more
  /// results available. The value of <code>nextToken</code> is a unique
  /// pagination token for each page. To retrieve the next page, call the
  /// operation again using the returned token. Keep all other arguments
  /// unchanged. If no results remain, then <code>nextToken</code> is set to
  /// <code>null</code>. Each pagination token expires after 24 hours. If you
  /// provide a token that isn't valid, then you receive an HTTP 400
  /// <code>ValidationException</code> error.
  final String? nextToken;

  ListMeteredProductsResponse({
    required this.meteredProducts,
    this.nextToken,
  });

  factory ListMeteredProductsResponse.fromJson(Map<String, dynamic> json) {
    return ListMeteredProductsResponse(
      meteredProducts: ((json['meteredProducts'] as List?) ?? const [])
          .nonNulls
          .map((e) => MeteredProductSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final meteredProducts = this.meteredProducts;
    final nextToken = this.nextToken;
    return {
      'meteredProducts': meteredProducts,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class PutMeteredProductResponse {
  PutMeteredProductResponse();

  factory PutMeteredProductResponse.fromJson(Map<String, dynamic> _) {
    return PutMeteredProductResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Mixin that adds an optional ARN field to response structures. Apply to
/// SummaryMixins (flows into Get, Summary, and BatchGet) and Create outputs.
class CreateMonitorResponse {
  /// The Amazon Resource Name that IAM Identity Center assigns to the monitor.
  final String identityCenterApplicationArn;

  /// The unique identifier of the monitor.
  final String monitorId;

  CreateMonitorResponse({
    required this.identityCenterApplicationArn,
    required this.monitorId,
  });

  factory CreateMonitorResponse.fromJson(Map<String, dynamic> json) {
    return CreateMonitorResponse(
      identityCenterApplicationArn:
          (json['identityCenterApplicationArn'] as String?) ?? '',
      monitorId: (json['monitorId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final identityCenterApplicationArn = this.identityCenterApplicationArn;
    final monitorId = this.monitorId;
    return {
      'identityCenterApplicationArn': identityCenterApplicationArn,
      'monitorId': monitorId,
    };
  }
}

/// Mixin that adds an optional ARN field to response structures. Apply to
/// SummaryMixins (flows into Get, Summary, and BatchGet) and Create outputs.
class GetMonitorResponse {
  /// The UNIX timestamp of the date and time that the monitor was created.
  final DateTime createdAt;

  /// The user name of the person that created the monitor.
  final String createdBy;

  /// The name used to identify the monitor on the Deadline Cloud console.
  /// <important>
  /// This field can store any content. Escape or encode this content before
  /// displaying it on a webpage or any other system that might interpret the
  /// content of this field.
  /// </important>
  final String displayName;

  /// The Amazon Resource Name that the IAM Identity Center assigned to the
  /// monitor when it was created.
  final String identityCenterApplicationArn;

  /// The Amazon Resource Name of the IAM Identity Center instance responsible for
  /// authenticating monitor users.
  final String identityCenterInstanceArn;

  /// The unique identifier for the monitor.
  final String monitorId;

  /// The Amazon Resource Name of the IAM role for the monitor. Users of the
  /// monitor use this role to access Deadline Cloud resources.
  final String roleArn;

  /// The subdomain used for the monitor URL. The full URL of the monitor is
  /// subdomain.Region.deadlinecloud.amazonaws.com.
  final String subdomain;

  /// The complete URL of the monitor. The full URL of the monitor is
  /// subdomain.Region.deadlinecloud.amazonaws.com.
  final String url;

  /// The Region where IAM Identity Center is enabled.
  final String? identityCenterRegion;

  /// The UNIX timestamp of the last date and time that the monitor was updated.
  final DateTime? updatedAt;

  /// The user name of the person that last updated the monitor.
  final String? updatedBy;

  GetMonitorResponse({
    required this.createdAt,
    required this.createdBy,
    required this.displayName,
    required this.identityCenterApplicationArn,
    required this.identityCenterInstanceArn,
    required this.monitorId,
    required this.roleArn,
    required this.subdomain,
    required this.url,
    this.identityCenterRegion,
    this.updatedAt,
    this.updatedBy,
  });

  factory GetMonitorResponse.fromJson(Map<String, dynamic> json) {
    return GetMonitorResponse(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      createdBy: (json['createdBy'] as String?) ?? '',
      displayName: (json['displayName'] as String?) ?? '',
      identityCenterApplicationArn:
          (json['identityCenterApplicationArn'] as String?) ?? '',
      identityCenterInstanceArn:
          (json['identityCenterInstanceArn'] as String?) ?? '',
      monitorId: (json['monitorId'] as String?) ?? '',
      roleArn: (json['roleArn'] as String?) ?? '',
      subdomain: (json['subdomain'] as String?) ?? '',
      url: (json['url'] as String?) ?? '',
      identityCenterRegion: json['identityCenterRegion'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final displayName = this.displayName;
    final identityCenterApplicationArn = this.identityCenterApplicationArn;
    final identityCenterInstanceArn = this.identityCenterInstanceArn;
    final monitorId = this.monitorId;
    final roleArn = this.roleArn;
    final subdomain = this.subdomain;
    final url = this.url;
    final identityCenterRegion = this.identityCenterRegion;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'createdBy': createdBy,
      'displayName': displayName,
      'identityCenterApplicationArn': identityCenterApplicationArn,
      'identityCenterInstanceArn': identityCenterInstanceArn,
      'monitorId': monitorId,
      'roleArn': roleArn,
      'subdomain': subdomain,
      'url': url,
      if (identityCenterRegion != null)
        'identityCenterRegion': identityCenterRegion,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

class UpdateMonitorResponse {
  UpdateMonitorResponse();

  factory UpdateMonitorResponse.fromJson(Map<String, dynamic> _) {
    return UpdateMonitorResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteMonitorResponse {
  DeleteMonitorResponse();

  factory DeleteMonitorResponse.fromJson(Map<String, dynamic> _) {
    return DeleteMonitorResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Shared pagination field for List operation outputs (nextToken).
class ListMonitorsResponse {
  /// A list of <code>MonitorSummary</code> objects that describe your monitors in
  /// the Deadline Cloud.
  final List<MonitorSummary> monitors;

  /// If Deadline Cloud returns <code>nextToken</code>, then there are more
  /// results available. The value of <code>nextToken</code> is a unique
  /// pagination token for each page. To retrieve the next page, call the
  /// operation again using the returned token. Keep all other arguments
  /// unchanged. If no results remain, then <code>nextToken</code> is set to
  /// <code>null</code>. Each pagination token expires after 24 hours. If you
  /// provide a token that isn't valid, then you receive an HTTP 400
  /// <code>ValidationException</code> error.
  final String? nextToken;

  ListMonitorsResponse({
    required this.monitors,
    this.nextToken,
  });

  factory ListMonitorsResponse.fromJson(Map<String, dynamic> json) {
    return ListMonitorsResponse(
      monitors: ((json['monitors'] as List?) ?? const [])
          .nonNulls
          .map((e) => MonitorSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final monitors = this.monitors;
    final nextToken = this.nextToken;
    return {
      'monitors': monitors,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class GetMonitorSettingsResponse {
  /// The monitor settings as key-value pairs.
  final Map<String, String> settings;

  GetMonitorSettingsResponse({
    required this.settings,
  });

  factory GetMonitorSettingsResponse.fromJson(Map<String, dynamic> json) {
    return GetMonitorSettingsResponse(
      settings: ((json['settings'] as Map<String, dynamic>?) ??
              const <String, dynamic>{})
          .map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final settings = this.settings;
    return {
      'settings': settings,
    };
  }
}

class UpdateMonitorSettingsResponse {
  UpdateMonitorSettingsResponse();

  factory UpdateMonitorSettingsResponse.fromJson(Map<String, dynamic> _) {
    return UpdateMonitorSettingsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Provides information about a monitor in Deadline Cloud.
class MonitorSummary {
  /// The UNIX timestamp of the date and time that the monitor was created.
  final DateTime createdAt;

  /// The user name of the person that created the monitor.
  final String createdBy;

  /// The name of the monitor that displays on the Deadline Cloud console.
  /// <important>
  /// This field can store any content. Escape or encode this content before
  /// displaying it on a webpage or any other system that might interpret the
  /// content of this field.
  /// </important>
  final String displayName;

  /// The Amazon Resource Name that the IAM Identity Center assigned to the
  /// monitor when it was created.
  final String identityCenterApplicationArn;

  /// The Amazon Resource Name of the IAM Identity Center instance responsible for
  /// authenticating monitor users.
  final String identityCenterInstanceArn;

  /// The unique identifier for the monitor.
  final String monitorId;

  /// The Amazon Resource Name of the IAM role for the monitor. Users of the
  /// monitor use this role to access Deadline Cloud resources.
  final String roleArn;

  /// The subdomain used for the monitor URL. The full URL of the monitor is
  /// subdomain.Region.deadlinecloud.amazonaws.com.
  final String subdomain;

  /// The complete URL of the monitor. The full URL of the monitor is
  /// subdomain.Region.deadlinecloud.amazonaws.com.
  final String url;

  /// The Region where IAM Identity Center is enabled.
  final String? identityCenterRegion;

  /// The UNIX timestamp of the date and time that the monitor was last updated.
  final DateTime? updatedAt;

  /// The user name of the person that last updated the monitor.
  final String? updatedBy;

  MonitorSummary({
    required this.createdAt,
    required this.createdBy,
    required this.displayName,
    required this.identityCenterApplicationArn,
    required this.identityCenterInstanceArn,
    required this.monitorId,
    required this.roleArn,
    required this.subdomain,
    required this.url,
    this.identityCenterRegion,
    this.updatedAt,
    this.updatedBy,
  });

  factory MonitorSummary.fromJson(Map<String, dynamic> json) {
    return MonitorSummary(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      createdBy: (json['createdBy'] as String?) ?? '',
      displayName: (json['displayName'] as String?) ?? '',
      identityCenterApplicationArn:
          (json['identityCenterApplicationArn'] as String?) ?? '',
      identityCenterInstanceArn:
          (json['identityCenterInstanceArn'] as String?) ?? '',
      monitorId: (json['monitorId'] as String?) ?? '',
      roleArn: (json['roleArn'] as String?) ?? '',
      subdomain: (json['subdomain'] as String?) ?? '',
      url: (json['url'] as String?) ?? '',
      identityCenterRegion: json['identityCenterRegion'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final displayName = this.displayName;
    final identityCenterApplicationArn = this.identityCenterApplicationArn;
    final identityCenterInstanceArn = this.identityCenterInstanceArn;
    final monitorId = this.monitorId;
    final roleArn = this.roleArn;
    final subdomain = this.subdomain;
    final url = this.url;
    final identityCenterRegion = this.identityCenterRegion;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'createdBy': createdBy,
      'displayName': displayName,
      'identityCenterApplicationArn': identityCenterApplicationArn,
      'identityCenterInstanceArn': identityCenterInstanceArn,
      'monitorId': monitorId,
      'roleArn': roleArn,
      'subdomain': subdomain,
      'url': url,
      if (identityCenterRegion != null)
        'identityCenterRegion': identityCenterRegion,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

/// The details of a metered product.
class MeteredProductSummary {
  /// The family to which the metered product belongs.
  final String family;

  /// The port on which the metered product should run.
  final int port;

  /// The product ID.
  final String productId;

  /// The vendor.
  final String vendor;

  MeteredProductSummary({
    required this.family,
    required this.port,
    required this.productId,
    required this.vendor,
  });

  factory MeteredProductSummary.fromJson(Map<String, dynamic> json) {
    return MeteredProductSummary(
      family: (json['family'] as String?) ?? '',
      port: (json['port'] as int?) ?? 0,
      productId: (json['productId'] as String?) ?? '',
      vendor: (json['vendor'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final family = this.family;
    final port = this.port;
    final productId = this.productId;
    final vendor = this.vendor;
    return {
      'family': family,
      'port': port,
      'productId': productId,
      'vendor': vendor,
    };
  }
}

/// The details for a license endpoint.
class LicenseEndpointSummary {
  /// The license endpoint ID.
  final String? licenseEndpointId;

  /// The status of the license endpoint.
  final LicenseEndpointStatus? status;

  /// The status message of the license endpoint.
  final String? statusMessage;

  /// The VPC (virtual private cloud) ID associated with the license endpoint.
  final String? vpcId;

  LicenseEndpointSummary({
    this.licenseEndpointId,
    this.status,
    this.statusMessage,
    this.vpcId,
  });

  factory LicenseEndpointSummary.fromJson(Map<String, dynamic> json) {
    return LicenseEndpointSummary(
      licenseEndpointId: json['licenseEndpointId'] as String?,
      status:
          (json['status'] as String?)?.let(LicenseEndpointStatus.fromString),
      statusMessage: json['statusMessage'] as String?,
      vpcId: json['vpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final licenseEndpointId = this.licenseEndpointId;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final vpcId = this.vpcId;
    return {
      if (licenseEndpointId != null) 'licenseEndpointId': licenseEndpointId,
      if (status != null) 'status': status.value,
      if (statusMessage != null) 'statusMessage': statusMessage,
      if (vpcId != null) 'vpcId': vpcId,
    };
  }
}

class LicenseEndpointStatus {
  static const createInProgress = LicenseEndpointStatus._('CREATE_IN_PROGRESS');
  static const deleteInProgress = LicenseEndpointStatus._('DELETE_IN_PROGRESS');
  static const ready = LicenseEndpointStatus._('READY');
  static const notReady = LicenseEndpointStatus._('NOT_READY');

  final String value;

  const LicenseEndpointStatus._(this.value);

  static const values = [createInProgress, deleteInProgress, ready, notReady];

  static LicenseEndpointStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => LicenseEndpointStatus._(value));

  @override
  bool operator ==(other) =>
      other is LicenseEndpointStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class TaskTargetRunStatus {
  static const ready = TaskTargetRunStatus._('READY');
  static const failed = TaskTargetRunStatus._('FAILED');
  static const succeeded = TaskTargetRunStatus._('SUCCEEDED');
  static const canceled = TaskTargetRunStatus._('CANCELED');
  static const suspended = TaskTargetRunStatus._('SUSPENDED');
  static const pending = TaskTargetRunStatus._('PENDING');

  final String value;

  const TaskTargetRunStatus._(this.value);

  static const values = [
    ready,
    failed,
    succeeded,
    canceled,
    suspended,
    pending
  ];

  static TaskTargetRunStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TaskTargetRunStatus._(value));

  @override
  bool operator ==(other) =>
      other is TaskTargetRunStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class StepTargetTaskRunStatus {
  static const ready = StepTargetTaskRunStatus._('READY');
  static const failed = StepTargetTaskRunStatus._('FAILED');
  static const succeeded = StepTargetTaskRunStatus._('SUCCEEDED');
  static const canceled = StepTargetTaskRunStatus._('CANCELED');
  static const suspended = StepTargetTaskRunStatus._('SUSPENDED');
  static const pending = StepTargetTaskRunStatus._('PENDING');

  final String value;

  const StepTargetTaskRunStatus._(this.value);

  static const values = [
    ready,
    failed,
    succeeded,
    canceled,
    suspended,
    pending
  ];

  static StepTargetTaskRunStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => StepTargetTaskRunStatus._(value));

  @override
  bool operator ==(other) =>
      other is StepTargetTaskRunStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class SessionLifecycleTargetStatus {
  static const ended = SessionLifecycleTargetStatus._('ENDED');

  final String value;

  const SessionLifecycleTargetStatus._(this.value);

  static const values = [ended];

  static SessionLifecycleTargetStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SessionLifecycleTargetStatus._(value));

  @override
  bool operator ==(other) =>
      other is SessionLifecycleTargetStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The details of a task.
class TaskSummary {
  /// The date and time the resource was created.
  final DateTime createdAt;

  /// The user or system that created this resource.
  final String createdBy;

  /// The run status of the task.
  final TaskRunStatus runStatus;

  /// The task ID.
  final String taskId;

  /// The date and time the resource ended running.
  final DateTime? endedAt;

  /// The number of times that the task failed and was retried.
  final int? failureRetryCount;

  /// The latest session action ID for the task.
  final String? latestSessionActionId;

  /// The task parameters.
  final Map<String, TaskParameterValue>? parameters;

  /// The date and time the resource started running.
  final DateTime? startedAt;

  /// The run status on which the started.
  final TaskTargetRunStatus? targetRunStatus;

  /// The date and time the resource was updated.
  final DateTime? updatedAt;

  /// The user or system that updated this resource.
  final String? updatedBy;

  TaskSummary({
    required this.createdAt,
    required this.createdBy,
    required this.runStatus,
    required this.taskId,
    this.endedAt,
    this.failureRetryCount,
    this.latestSessionActionId,
    this.parameters,
    this.startedAt,
    this.targetRunStatus,
    this.updatedAt,
    this.updatedBy,
  });

  factory TaskSummary.fromJson(Map<String, dynamic> json) {
    return TaskSummary(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      createdBy: (json['createdBy'] as String?) ?? '',
      runStatus: TaskRunStatus.fromString((json['runStatus'] as String?) ?? ''),
      taskId: (json['taskId'] as String?) ?? '',
      endedAt: timeStampFromJson(json['endedAt']),
      failureRetryCount: json['failureRetryCount'] as int?,
      latestSessionActionId: json['latestSessionActionId'] as String?,
      parameters: (json['parameters'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, TaskParameterValue.fromJson(e as Map<String, dynamic>))),
      startedAt: timeStampFromJson(json['startedAt']),
      targetRunStatus: (json['targetRunStatus'] as String?)
          ?.let(TaskTargetRunStatus.fromString),
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final runStatus = this.runStatus;
    final taskId = this.taskId;
    final endedAt = this.endedAt;
    final failureRetryCount = this.failureRetryCount;
    final latestSessionActionId = this.latestSessionActionId;
    final parameters = this.parameters;
    final startedAt = this.startedAt;
    final targetRunStatus = this.targetRunStatus;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'createdBy': createdBy,
      'runStatus': runStatus.value,
      'taskId': taskId,
      if (endedAt != null) 'endedAt': iso8601ToJson(endedAt),
      if (failureRetryCount != null) 'failureRetryCount': failureRetryCount,
      if (latestSessionActionId != null)
        'latestSessionActionId': latestSessionActionId,
      if (parameters != null) 'parameters': parameters,
      if (startedAt != null) 'startedAt': iso8601ToJson(startedAt),
      if (targetRunStatus != null) 'targetRunStatus': targetRunStatus.value,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

class TaskRunStatus {
  static const pending = TaskRunStatus._('PENDING');
  static const ready = TaskRunStatus._('READY');
  static const assigned = TaskRunStatus._('ASSIGNED');
  static const starting = TaskRunStatus._('STARTING');
  static const scheduled = TaskRunStatus._('SCHEDULED');
  static const interrupting = TaskRunStatus._('INTERRUPTING');
  static const running = TaskRunStatus._('RUNNING');
  static const suspended = TaskRunStatus._('SUSPENDED');
  static const canceled = TaskRunStatus._('CANCELED');
  static const failed = TaskRunStatus._('FAILED');
  static const succeeded = TaskRunStatus._('SUCCEEDED');
  static const notCompatible = TaskRunStatus._('NOT_COMPATIBLE');

  final String value;

  const TaskRunStatus._(this.value);

  static const values = [
    pending,
    ready,
    assigned,
    starting,
    scheduled,
    interrupting,
    running,
    suspended,
    canceled,
    failed,
    succeeded,
    notCompatible
  ];

  static TaskRunStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TaskRunStatus._(value));

  @override
  bool operator ==(other) => other is TaskRunStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The data types for the task parameters.
class TaskParameterValue {
  /// A range (for example 1-10) or selection of specific (for example 1,3,7,8,10)
  /// integers represented as a string.
  final String? chunkInt;

  /// A double precision IEEE-754 floating point number represented as a string.
  final String? float;

  /// A signed integer represented as a string.
  final String? intValue;

  /// A file system path represented as a string.
  final String? path;

  /// A UTF-8 string.
  final String? string;

  TaskParameterValue({
    this.chunkInt,
    this.float,
    this.intValue,
    this.path,
    this.string,
  });

  factory TaskParameterValue.fromJson(Map<String, dynamic> json) {
    return TaskParameterValue(
      chunkInt: json['chunkInt'] as String?,
      float: json['float'] as String?,
      intValue: json['int'] as String?,
      path: json['path'] as String?,
      string: json['string'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final chunkInt = this.chunkInt;
    final float = this.float;
    final intValue = this.intValue;
    final path = this.path;
    final string = this.string;
    return {
      if (chunkInt != null) 'chunkInt': chunkInt,
      if (float != null) 'float': float,
      if (intValue != null) 'int': intValue,
      if (path != null) 'path': path,
      if (string != null) 'string': string,
    };
  }
}

/// The details for a step.
class StepSummary {
  /// The date and time the resource was created.
  final DateTime createdAt;

  /// The user or system that created this resource.
  final String createdBy;

  /// The life cycle status.
  final StepLifecycleStatus lifecycleStatus;

  /// The name of the step.
  final String name;

  /// The step ID.
  final String stepId;

  /// The task run status for the job.
  ///
  /// <ul>
  /// <li>
  /// <code>PENDING</code>–pending and waiting for resources.
  /// </li>
  /// <li>
  /// <code>READY</code>–ready to process.
  /// </li>
  /// <li>
  /// <code>ASSIGNED</code>–assigned and will run next on a worker.
  /// </li>
  /// <li>
  /// <code>SCHEDULED</code>–scheduled to run on a worker.
  /// </li>
  /// <li>
  /// <code>INTERRUPTING</code>–being interrupted.
  /// </li>
  /// <li>
  /// <code>RUNNING</code>–running on a worker.
  /// </li>
  /// <li>
  /// <code>SUSPENDED</code>–the task is suspended.
  /// </li>
  /// <li>
  /// <code>CANCELED</code>–the task has been canceled.
  /// </li>
  /// <li>
  /// <code>FAILED</code>–the task has failed.
  /// </li>
  /// <li>
  /// <code>SUCCEEDED</code>–the task has succeeded.
  /// </li>
  /// </ul>
  final TaskRunStatus taskRunStatus;

  /// The number of tasks running on the job.
  final Map<TaskRunStatus, int> taskRunStatusCounts;

  /// The number of dependencies for the step.
  final DependencyCounts? dependencyCounts;

  /// The date and time the resource ended running.
  final DateTime? endedAt;

  /// A message that describes the lifecycle of the step.
  final String? lifecycleStatusMessage;

  /// The date and time the resource started running.
  final DateTime? startedAt;

  /// The task status to update the job's tasks to.
  final StepTargetTaskRunStatus? targetTaskRunStatus;

  /// The total number of times tasks from the step failed and were retried.
  final int? taskFailureRetryCount;

  /// The date and time the resource was updated.
  final DateTime? updatedAt;

  /// The user or system that updated this resource.
  final String? updatedBy;

  StepSummary({
    required this.createdAt,
    required this.createdBy,
    required this.lifecycleStatus,
    required this.name,
    required this.stepId,
    required this.taskRunStatus,
    required this.taskRunStatusCounts,
    this.dependencyCounts,
    this.endedAt,
    this.lifecycleStatusMessage,
    this.startedAt,
    this.targetTaskRunStatus,
    this.taskFailureRetryCount,
    this.updatedAt,
    this.updatedBy,
  });

  factory StepSummary.fromJson(Map<String, dynamic> json) {
    return StepSummary(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      createdBy: (json['createdBy'] as String?) ?? '',
      lifecycleStatus: StepLifecycleStatus.fromString(
          (json['lifecycleStatus'] as String?) ?? ''),
      name: (json['name'] as String?) ?? '',
      stepId: (json['stepId'] as String?) ?? '',
      taskRunStatus:
          TaskRunStatus.fromString((json['taskRunStatus'] as String?) ?? ''),
      taskRunStatusCounts:
          ((json['taskRunStatusCounts'] as Map<String, dynamic>?) ??
                  const <String, dynamic>{})
              .map((k, e) => MapEntry(TaskRunStatus.fromString(k), e as int)),
      dependencyCounts: json['dependencyCounts'] != null
          ? DependencyCounts.fromJson(
              json['dependencyCounts'] as Map<String, dynamic>)
          : null,
      endedAt: timeStampFromJson(json['endedAt']),
      lifecycleStatusMessage: json['lifecycleStatusMessage'] as String?,
      startedAt: timeStampFromJson(json['startedAt']),
      targetTaskRunStatus: (json['targetTaskRunStatus'] as String?)
          ?.let(StepTargetTaskRunStatus.fromString),
      taskFailureRetryCount: json['taskFailureRetryCount'] as int?,
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final lifecycleStatus = this.lifecycleStatus;
    final name = this.name;
    final stepId = this.stepId;
    final taskRunStatus = this.taskRunStatus;
    final taskRunStatusCounts = this.taskRunStatusCounts;
    final dependencyCounts = this.dependencyCounts;
    final endedAt = this.endedAt;
    final lifecycleStatusMessage = this.lifecycleStatusMessage;
    final startedAt = this.startedAt;
    final targetTaskRunStatus = this.targetTaskRunStatus;
    final taskFailureRetryCount = this.taskFailureRetryCount;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'createdBy': createdBy,
      'lifecycleStatus': lifecycleStatus.value,
      'name': name,
      'stepId': stepId,
      'taskRunStatus': taskRunStatus.value,
      'taskRunStatusCounts':
          taskRunStatusCounts.map((k, e) => MapEntry(k.value, e)),
      if (dependencyCounts != null) 'dependencyCounts': dependencyCounts,
      if (endedAt != null) 'endedAt': iso8601ToJson(endedAt),
      if (lifecycleStatusMessage != null)
        'lifecycleStatusMessage': lifecycleStatusMessage,
      if (startedAt != null) 'startedAt': iso8601ToJson(startedAt),
      if (targetTaskRunStatus != null)
        'targetTaskRunStatus': targetTaskRunStatus.value,
      if (taskFailureRetryCount != null)
        'taskFailureRetryCount': taskFailureRetryCount,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

class StepLifecycleStatus {
  static const createComplete = StepLifecycleStatus._('CREATE_COMPLETE');
  static const updateInProgress = StepLifecycleStatus._('UPDATE_IN_PROGRESS');
  static const updateFailed = StepLifecycleStatus._('UPDATE_FAILED');
  static const updateSucceeded = StepLifecycleStatus._('UPDATE_SUCCEEDED');

  final String value;

  const StepLifecycleStatus._(this.value);

  static const values = [
    createComplete,
    updateInProgress,
    updateFailed,
    updateSucceeded
  ];

  static StepLifecycleStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => StepLifecycleStatus._(value));

  @override
  bool operator ==(other) =>
      other is StepLifecycleStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The number of dependencies for the consumer.
class DependencyCounts {
  /// The number of consumers resolved.
  final int consumersResolved;

  /// The number of unresolved consumers.
  final int consumersUnresolved;

  /// The number of resolved dependencies.
  final int dependenciesResolved;

  /// The number of unresolved dependencies.
  final int dependenciesUnresolved;

  DependencyCounts({
    required this.consumersResolved,
    required this.consumersUnresolved,
    required this.dependenciesResolved,
    required this.dependenciesUnresolved,
  });

  factory DependencyCounts.fromJson(Map<String, dynamic> json) {
    return DependencyCounts(
      consumersResolved: (json['consumersResolved'] as int?) ?? 0,
      consumersUnresolved: (json['consumersUnresolved'] as int?) ?? 0,
      dependenciesResolved: (json['dependenciesResolved'] as int?) ?? 0,
      dependenciesUnresolved: (json['dependenciesUnresolved'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final consumersResolved = this.consumersResolved;
    final consumersUnresolved = this.consumersUnresolved;
    final dependenciesResolved = this.dependenciesResolved;
    final dependenciesUnresolved = this.dependenciesUnresolved;
    return {
      'consumersResolved': consumersResolved,
      'consumersUnresolved': consumersUnresolved,
      'dependenciesResolved': dependenciesResolved,
      'dependenciesUnresolved': dependenciesUnresolved,
    };
  }
}

/// The details of step dependency.
class StepDependency {
  /// The step dependency status.
  final DependencyConsumerResolutionStatus status;

  /// The step ID.
  final String stepId;

  StepDependency({
    required this.status,
    required this.stepId,
  });

  factory StepDependency.fromJson(Map<String, dynamic> json) {
    return StepDependency(
      status: DependencyConsumerResolutionStatus.fromString(
          (json['status'] as String?) ?? ''),
      stepId: (json['stepId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final stepId = this.stepId;
    return {
      'status': status.value,
      'stepId': stepId,
    };
  }
}

class DependencyConsumerResolutionStatus {
  static const resolved = DependencyConsumerResolutionStatus._('RESOLVED');
  static const unresolved = DependencyConsumerResolutionStatus._('UNRESOLVED');

  final String value;

  const DependencyConsumerResolutionStatus._(this.value);

  static const values = [resolved, unresolved];

  static DependencyConsumerResolutionStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DependencyConsumerResolutionStatus._(value));

  @override
  bool operator ==(other) =>
      other is DependencyConsumerResolutionStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The details of a step consumer.
class StepConsumer {
  /// The step consumer status.
  final DependencyConsumerResolutionStatus status;

  /// The step ID.
  final String stepId;

  StepConsumer({
    required this.status,
    required this.stepId,
  });

  factory StepConsumer.fromJson(Map<String, dynamic> json) {
    return StepConsumer(
      status: DependencyConsumerResolutionStatus.fromString(
          (json['status'] as String?) ?? ''),
      stepId: (json['stepId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final stepId = this.stepId;
    return {
      'status': status.value,
      'stepId': stepId,
    };
  }
}

/// The summary of a session.
class SessionSummary {
  /// The fleet ID.
  final String fleetId;

  /// The life cycle status for the session.
  final SessionLifecycleStatus lifecycleStatus;

  /// The session ID.
  final String sessionId;

  /// The date and time the resource started running.
  final DateTime startedAt;

  /// The worker ID.
  final String workerId;

  /// The date and time the resource ended running.
  final DateTime? endedAt;

  /// The target life cycle status for the session.
  final SessionLifecycleTargetStatus? targetLifecycleStatus;

  /// The date and time the resource was updated.
  final DateTime? updatedAt;

  /// The user or system that updated this resource.
  final String? updatedBy;

  SessionSummary({
    required this.fleetId,
    required this.lifecycleStatus,
    required this.sessionId,
    required this.startedAt,
    required this.workerId,
    this.endedAt,
    this.targetLifecycleStatus,
    this.updatedAt,
    this.updatedBy,
  });

  factory SessionSummary.fromJson(Map<String, dynamic> json) {
    return SessionSummary(
      fleetId: (json['fleetId'] as String?) ?? '',
      lifecycleStatus: SessionLifecycleStatus.fromString(
          (json['lifecycleStatus'] as String?) ?? ''),
      sessionId: (json['sessionId'] as String?) ?? '',
      startedAt: nonNullableTimeStampFromJson(json['startedAt'] ?? 0),
      workerId: (json['workerId'] as String?) ?? '',
      endedAt: timeStampFromJson(json['endedAt']),
      targetLifecycleStatus: (json['targetLifecycleStatus'] as String?)
          ?.let(SessionLifecycleTargetStatus.fromString),
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fleetId = this.fleetId;
    final lifecycleStatus = this.lifecycleStatus;
    final sessionId = this.sessionId;
    final startedAt = this.startedAt;
    final workerId = this.workerId;
    final endedAt = this.endedAt;
    final targetLifecycleStatus = this.targetLifecycleStatus;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      'fleetId': fleetId,
      'lifecycleStatus': lifecycleStatus.value,
      'sessionId': sessionId,
      'startedAt': iso8601ToJson(startedAt),
      'workerId': workerId,
      if (endedAt != null) 'endedAt': iso8601ToJson(endedAt),
      if (targetLifecycleStatus != null)
        'targetLifecycleStatus': targetLifecycleStatus.value,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

class SessionLifecycleStatus {
  static const started = SessionLifecycleStatus._('STARTED');
  static const updateInProgress =
      SessionLifecycleStatus._('UPDATE_IN_PROGRESS');
  static const updateSucceeded = SessionLifecycleStatus._('UPDATE_SUCCEEDED');
  static const updateFailed = SessionLifecycleStatus._('UPDATE_FAILED');
  static const ended = SessionLifecycleStatus._('ENDED');

  final String value;

  const SessionLifecycleStatus._(this.value);

  static const values = [
    started,
    updateInProgress,
    updateSucceeded,
    updateFailed,
    ended
  ];

  static SessionLifecycleStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SessionLifecycleStatus._(value));

  @override
  bool operator ==(other) =>
      other is SessionLifecycleStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The details of a session action.
class SessionActionSummary {
  /// The session action definition.
  final SessionActionDefinitionSummary definition;

  /// The session action ID.
  final String sessionActionId;

  /// The status of the session action.
  final SessionActionStatus status;

  /// The date and time the resource ended running.
  final DateTime? endedAt;

  /// The list of manifest properties that describe file attachments for the task
  /// run.
  final List<TaskRunManifestPropertiesResponse>? manifests;

  /// The completion percentage for the session action.
  final double? progressPercent;

  /// The date and time the resource started running.
  final DateTime? startedAt;

  /// The Linux timestamp of the last date and time that the session action was
  /// updated.
  final DateTime? workerUpdatedAt;

  SessionActionSummary({
    required this.definition,
    required this.sessionActionId,
    required this.status,
    this.endedAt,
    this.manifests,
    this.progressPercent,
    this.startedAt,
    this.workerUpdatedAt,
  });

  factory SessionActionSummary.fromJson(Map<String, dynamic> json) {
    return SessionActionSummary(
      definition: SessionActionDefinitionSummary.fromJson(
          (json['definition'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      sessionActionId: (json['sessionActionId'] as String?) ?? '',
      status: SessionActionStatus.fromString((json['status'] as String?) ?? ''),
      endedAt: timeStampFromJson(json['endedAt']),
      manifests: (json['manifests'] as List?)
          ?.nonNulls
          .map((e) => TaskRunManifestPropertiesResponse.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      progressPercent: json['progressPercent'] as double?,
      startedAt: timeStampFromJson(json['startedAt']),
      workerUpdatedAt: timeStampFromJson(json['workerUpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final definition = this.definition;
    final sessionActionId = this.sessionActionId;
    final status = this.status;
    final endedAt = this.endedAt;
    final manifests = this.manifests;
    final progressPercent = this.progressPercent;
    final startedAt = this.startedAt;
    final workerUpdatedAt = this.workerUpdatedAt;
    return {
      'definition': definition,
      'sessionActionId': sessionActionId,
      'status': status.value,
      if (endedAt != null) 'endedAt': iso8601ToJson(endedAt),
      if (manifests != null) 'manifests': manifests,
      if (progressPercent != null) 'progressPercent': progressPercent,
      if (startedAt != null) 'startedAt': iso8601ToJson(startedAt),
      if (workerUpdatedAt != null)
        'workerUpdatedAt': iso8601ToJson(workerUpdatedAt),
    };
  }
}

class SessionActionStatus {
  static const assigned = SessionActionStatus._('ASSIGNED');
  static const running = SessionActionStatus._('RUNNING');
  static const canceling = SessionActionStatus._('CANCELING');
  static const succeeded = SessionActionStatus._('SUCCEEDED');
  static const failed = SessionActionStatus._('FAILED');
  static const interrupted = SessionActionStatus._('INTERRUPTED');
  static const canceled = SessionActionStatus._('CANCELED');
  static const neverAttempted = SessionActionStatus._('NEVER_ATTEMPTED');
  static const scheduled = SessionActionStatus._('SCHEDULED');
  static const reclaiming = SessionActionStatus._('RECLAIMING');
  static const reclaimed = SessionActionStatus._('RECLAIMED');

  final String value;

  const SessionActionStatus._(this.value);

  static const values = [
    assigned,
    running,
    canceling,
    succeeded,
    failed,
    interrupted,
    canceled,
    neverAttempted,
    scheduled,
    reclaiming,
    reclaimed
  ];

  static SessionActionStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SessionActionStatus._(value));

  @override
  bool operator ==(other) =>
      other is SessionActionStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The details of a session action definition.
class SessionActionDefinitionSummary {
  /// The environment to enter into.
  final EnvironmentEnterSessionActionDefinitionSummary? envEnter;

  /// The environment to exit from.
  final EnvironmentExitSessionActionDefinitionSummary? envExit;

  /// The session action definition summary for syncing input job attachments.
  final SyncInputJobAttachmentsSessionActionDefinitionSummary?
      syncInputJobAttachments;

  /// The task run.
  final TaskRunSessionActionDefinitionSummary? taskRun;

  SessionActionDefinitionSummary({
    this.envEnter,
    this.envExit,
    this.syncInputJobAttachments,
    this.taskRun,
  });

  factory SessionActionDefinitionSummary.fromJson(Map<String, dynamic> json) {
    return SessionActionDefinitionSummary(
      envEnter: json['envEnter'] != null
          ? EnvironmentEnterSessionActionDefinitionSummary.fromJson(
              json['envEnter'] as Map<String, dynamic>)
          : null,
      envExit: json['envExit'] != null
          ? EnvironmentExitSessionActionDefinitionSummary.fromJson(
              json['envExit'] as Map<String, dynamic>)
          : null,
      syncInputJobAttachments: json['syncInputJobAttachments'] != null
          ? SyncInputJobAttachmentsSessionActionDefinitionSummary.fromJson(
              json['syncInputJobAttachments'] as Map<String, dynamic>)
          : null,
      taskRun: json['taskRun'] != null
          ? TaskRunSessionActionDefinitionSummary.fromJson(
              json['taskRun'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final envEnter = this.envEnter;
    final envExit = this.envExit;
    final syncInputJobAttachments = this.syncInputJobAttachments;
    final taskRun = this.taskRun;
    return {
      if (envEnter != null) 'envEnter': envEnter,
      if (envExit != null) 'envExit': envExit,
      if (syncInputJobAttachments != null)
        'syncInputJobAttachments': syncInputJobAttachments,
      if (taskRun != null) 'taskRun': taskRun,
    };
  }
}

/// Defines the environment a session action enters in.
class EnvironmentEnterSessionActionDefinitionSummary {
  /// The environment ID.
  final String environmentId;

  EnvironmentEnterSessionActionDefinitionSummary({
    required this.environmentId,
  });

  factory EnvironmentEnterSessionActionDefinitionSummary.fromJson(
      Map<String, dynamic> json) {
    return EnvironmentEnterSessionActionDefinitionSummary(
      environmentId: (json['environmentId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final environmentId = this.environmentId;
    return {
      'environmentId': environmentId,
    };
  }
}

/// A summary of the environment details for which a session action to exits.
class EnvironmentExitSessionActionDefinitionSummary {
  /// The environment ID.
  final String environmentId;

  EnvironmentExitSessionActionDefinitionSummary({
    required this.environmentId,
  });

  factory EnvironmentExitSessionActionDefinitionSummary.fromJson(
      Map<String, dynamic> json) {
    return EnvironmentExitSessionActionDefinitionSummary(
      environmentId: (json['environmentId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final environmentId = this.environmentId;
    return {
      'environmentId': environmentId,
    };
  }
}

/// The details of a task run in a session action.
class TaskRunSessionActionDefinitionSummary {
  /// The step ID.
  final String stepId;

  /// The parameters of a task run in a session action.
  final Map<String, TaskParameterValue>? parameters;

  /// The task ID.
  final String? taskId;

  TaskRunSessionActionDefinitionSummary({
    required this.stepId,
    this.parameters,
    this.taskId,
  });

  factory TaskRunSessionActionDefinitionSummary.fromJson(
      Map<String, dynamic> json) {
    return TaskRunSessionActionDefinitionSummary(
      stepId: (json['stepId'] as String?) ?? '',
      parameters: (json['parameters'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, TaskParameterValue.fromJson(e as Map<String, dynamic>))),
      taskId: json['taskId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final stepId = this.stepId;
    final parameters = this.parameters;
    final taskId = this.taskId;
    return {
      'stepId': stepId,
      if (parameters != null) 'parameters': parameters,
      if (taskId != null) 'taskId': taskId,
    };
  }
}

/// The summary of the session action definition for syncing input job
/// attachments.
class SyncInputJobAttachmentsSessionActionDefinitionSummary {
  /// The step ID for the sync input job attachments session action summary.
  final String? stepId;

  SyncInputJobAttachmentsSessionActionDefinitionSummary({
    this.stepId,
  });

  factory SyncInputJobAttachmentsSessionActionDefinitionSummary.fromJson(
      Map<String, dynamic> json) {
    return SyncInputJobAttachmentsSessionActionDefinitionSummary(
      stepId: json['stepId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final stepId = this.stepId;
    return {
      if (stepId != null) 'stepId': stepId,
    };
  }
}

/// The manifest properties for a task run, corresponding to the manifest
/// properties in the job.
class TaskRunManifestPropertiesResponse {
  /// The hash value of the file.
  final String? outputManifestHash;

  /// The manifest file path.
  final String? outputManifestPath;

  TaskRunManifestPropertiesResponse({
    this.outputManifestHash,
    this.outputManifestPath,
  });

  factory TaskRunManifestPropertiesResponse.fromJson(
      Map<String, dynamic> json) {
    return TaskRunManifestPropertiesResponse(
      outputManifestHash: json['outputManifestHash'] as String?,
      outputManifestPath: json['outputManifestPath'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final outputManifestHash = this.outputManifestHash;
    final outputManifestPath = this.outputManifestPath;
    return {
      if (outputManifestHash != null) 'outputManifestHash': outputManifestHash,
      if (outputManifestPath != null) 'outputManifestPath': outputManifestPath,
    };
  }
}

/// The details for a job member.
class JobMember {
  /// The farm ID.
  final String farmId;

  /// The identity store ID.
  final String identityStoreId;

  /// The job ID.
  final String jobId;

  /// The job member's membership level.
  final MembershipLevel membershipLevel;

  /// The principal ID of the job member.
  final String principalId;

  /// The principal type of the job member.
  final DeadlinePrincipalType principalType;

  /// The queue ID.
  final String queueId;

  JobMember({
    required this.farmId,
    required this.identityStoreId,
    required this.jobId,
    required this.membershipLevel,
    required this.principalId,
    required this.principalType,
    required this.queueId,
  });

  factory JobMember.fromJson(Map<String, dynamic> json) {
    return JobMember(
      farmId: (json['farmId'] as String?) ?? '',
      identityStoreId: (json['identityStoreId'] as String?) ?? '',
      jobId: (json['jobId'] as String?) ?? '',
      membershipLevel: MembershipLevel.fromString(
          (json['membershipLevel'] as String?) ?? ''),
      principalId: (json['principalId'] as String?) ?? '',
      principalType: DeadlinePrincipalType.fromString(
          (json['principalType'] as String?) ?? ''),
      queueId: (json['queueId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final farmId = this.farmId;
    final identityStoreId = this.identityStoreId;
    final jobId = this.jobId;
    final membershipLevel = this.membershipLevel;
    final principalId = this.principalId;
    final principalType = this.principalType;
    final queueId = this.queueId;
    return {
      'farmId': farmId,
      'identityStoreId': identityStoreId,
      'jobId': jobId,
      'membershipLevel': membershipLevel.value,
      'principalId': principalId,
      'principalType': principalType.value,
      'queueId': queueId,
    };
  }
}

class DeadlinePrincipalType {
  static const user = DeadlinePrincipalType._('USER');
  static const group = DeadlinePrincipalType._('GROUP');

  final String value;

  const DeadlinePrincipalType._(this.value);

  static const values = [user, group];

  static DeadlinePrincipalType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DeadlinePrincipalType._(value));

  @override
  bool operator ==(other) =>
      other is DeadlinePrincipalType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class MembershipLevel {
  static const viewer = MembershipLevel._('VIEWER');
  static const contributor = MembershipLevel._('CONTRIBUTOR');
  static const owner = MembershipLevel._('OWNER');
  static const manager = MembershipLevel._('MANAGER');

  final String value;

  const MembershipLevel._(this.value);

  static const values = [viewer, contributor, owner, manager];

  static MembershipLevel fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MembershipLevel._(value));

  @override
  bool operator ==(other) => other is MembershipLevel && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The details of required step capabilities.
class StepRequiredCapabilities {
  /// The capability amounts that the step requires.
  final List<StepAmountCapability> amounts;

  /// The capability attributes that the step requires.
  final List<StepAttributeCapability> attributes;

  StepRequiredCapabilities({
    required this.amounts,
    required this.attributes,
  });

  factory StepRequiredCapabilities.fromJson(Map<String, dynamic> json) {
    return StepRequiredCapabilities(
      amounts: ((json['amounts'] as List?) ?? const [])
          .nonNulls
          .map((e) => StepAmountCapability.fromJson(e as Map<String, dynamic>))
          .toList(),
      attributes: ((json['attributes'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              StepAttributeCapability.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final amounts = this.amounts;
    final attributes = this.attributes;
    return {
      'amounts': amounts,
      'attributes': attributes,
    };
  }
}

/// The details of a search for two or more step parameters.
class ParameterSpace {
  /// The parameters to search for.
  final List<StepParameter> parameters;

  /// The combination expression to use in the search.
  final String? combination;

  ParameterSpace({
    required this.parameters,
    this.combination,
  });

  factory ParameterSpace.fromJson(Map<String, dynamic> json) {
    return ParameterSpace(
      parameters: ((json['parameters'] as List?) ?? const [])
          .nonNulls
          .map((e) => StepParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
      combination: json['combination'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final parameters = this.parameters;
    final combination = this.combination;
    return {
      'parameters': parameters,
      if (combination != null) 'combination': combination,
    };
  }
}

/// The details of a step parameter.
class StepParameter {
  /// The name of the parameter.
  final String name;

  /// The data type of the parameter.
  final StepParameterType type;

  /// The configuration for task chunking.
  final StepParameterChunks? chunks;

  StepParameter({
    required this.name,
    required this.type,
    this.chunks,
  });

  factory StepParameter.fromJson(Map<String, dynamic> json) {
    return StepParameter(
      name: (json['name'] as String?) ?? '',
      type: StepParameterType.fromString((json['type'] as String?) ?? ''),
      chunks: json['chunks'] != null
          ? StepParameterChunks.fromJson(json['chunks'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final type = this.type;
    final chunks = this.chunks;
    return {
      'name': name,
      'type': type.value,
      if (chunks != null) 'chunks': chunks,
    };
  }
}

class StepParameterType {
  static const $int = StepParameterType._('INT');
  static const float = StepParameterType._('FLOAT');
  static const string = StepParameterType._('STRING');
  static const path = StepParameterType._('PATH');
  static const chunkInt = StepParameterType._('CHUNK_INT');

  final String value;

  const StepParameterType._(this.value);

  static const values = [$int, float, string, path, chunkInt];

  static StepParameterType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => StepParameterType._(value));

  @override
  bool operator ==(other) => other is StepParameterType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Defines how a step parameter range should be divided into chunks.
class StepParameterChunks {
  /// The number of tasks to combine into a single chunk by default.
  final int defaultTaskCount;

  /// Specifies whether the chunked ranges must be contiguous or can have gaps
  /// between them.
  final RangeConstraint rangeConstraint;

  /// The number of seconds to aim for when forming chunks.
  final int? targetRuntimeSeconds;

  StepParameterChunks({
    required this.defaultTaskCount,
    required this.rangeConstraint,
    this.targetRuntimeSeconds,
  });

  factory StepParameterChunks.fromJson(Map<String, dynamic> json) {
    return StepParameterChunks(
      defaultTaskCount: (json['defaultTaskCount'] as int?) ?? 0,
      rangeConstraint: RangeConstraint.fromString(
          (json['rangeConstraint'] as String?) ?? ''),
      targetRuntimeSeconds: json['targetRuntimeSeconds'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final defaultTaskCount = this.defaultTaskCount;
    final rangeConstraint = this.rangeConstraint;
    final targetRuntimeSeconds = this.targetRuntimeSeconds;
    return {
      'defaultTaskCount': defaultTaskCount,
      'rangeConstraint': rangeConstraint.value,
      if (targetRuntimeSeconds != null)
        'targetRuntimeSeconds': targetRuntimeSeconds,
    };
  }
}

class RangeConstraint {
  static const contiguous = RangeConstraint._('CONTIGUOUS');
  static const noncontiguous = RangeConstraint._('NONCONTIGUOUS');

  final String value;

  const RangeConstraint._(this.value);

  static const values = [contiguous, noncontiguous];

  static RangeConstraint fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RangeConstraint._(value));

  @override
  bool operator ==(other) => other is RangeConstraint && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The details outlining the minimum and maximum capability of a step.
class StepAmountCapability {
  /// The name of the step.
  final String name;

  /// The maximum amount.
  final double? max;

  /// The minimum amount.
  final double? min;

  /// The amount value.
  final double? value;

  StepAmountCapability({
    required this.name,
    this.max,
    this.min,
    this.value,
  });

  factory StepAmountCapability.fromJson(Map<String, dynamic> json) {
    return StepAmountCapability(
      name: (json['name'] as String?) ?? '',
      max: json['max'] as double?,
      min: json['min'] as double?,
      value: json['value'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final max = this.max;
    final min = this.min;
    final value = this.value;
    return {
      'name': name,
      if (max != null) 'max': max,
      if (min != null) 'min': min,
      if (value != null) 'value': value,
    };
  }
}

/// The list of step attributes.
class StepAttributeCapability {
  /// The name of the step attribute.
  final String name;

  /// Requires all of the step attribute values.
  final List<String>? allOf;

  /// Requires any of the step attributes in a given list.
  final List<String>? anyOf;

  StepAttributeCapability({
    required this.name,
    this.allOf,
    this.anyOf,
  });

  factory StepAttributeCapability.fromJson(Map<String, dynamic> json) {
    return StepAttributeCapability(
      name: (json['name'] as String?) ?? '',
      allOf:
          (json['allOf'] as List?)?.nonNulls.map((e) => e as String).toList(),
      anyOf:
          (json['anyOf'] as List?)?.nonNulls.map((e) => e as String).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final allOf = this.allOf;
    final anyOf = this.anyOf;
    return {
      'name': name,
      if (allOf != null) 'allOf': allOf,
      if (anyOf != null) 'anyOf': anyOf,
    };
  }
}

/// The definition of the session action.
class SessionActionDefinition {
  /// The environment to enter into.
  final EnvironmentEnterSessionActionDefinition? envEnter;

  /// The environment to exit from.
  final EnvironmentExitSessionActionDefinition? envExit;

  /// The session action definition for syncing input job attachments.
  final SyncInputJobAttachmentsSessionActionDefinition? syncInputJobAttachments;

  /// The task run in the session.
  final TaskRunSessionActionDefinition? taskRun;

  SessionActionDefinition({
    this.envEnter,
    this.envExit,
    this.syncInputJobAttachments,
    this.taskRun,
  });

  factory SessionActionDefinition.fromJson(Map<String, dynamic> json) {
    return SessionActionDefinition(
      envEnter: json['envEnter'] != null
          ? EnvironmentEnterSessionActionDefinition.fromJson(
              json['envEnter'] as Map<String, dynamic>)
          : null,
      envExit: json['envExit'] != null
          ? EnvironmentExitSessionActionDefinition.fromJson(
              json['envExit'] as Map<String, dynamic>)
          : null,
      syncInputJobAttachments: json['syncInputJobAttachments'] != null
          ? SyncInputJobAttachmentsSessionActionDefinition.fromJson(
              json['syncInputJobAttachments'] as Map<String, dynamic>)
          : null,
      taskRun: json['taskRun'] != null
          ? TaskRunSessionActionDefinition.fromJson(
              json['taskRun'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final envEnter = this.envEnter;
    final envExit = this.envExit;
    final syncInputJobAttachments = this.syncInputJobAttachments;
    final taskRun = this.taskRun;
    return {
      if (envEnter != null) 'envEnter': envEnter,
      if (envExit != null) 'envExit': envExit,
      if (syncInputJobAttachments != null)
        'syncInputJobAttachments': syncInputJobAttachments,
      if (taskRun != null) 'taskRun': taskRun,
    };
  }
}

/// The environment ID to use to enter a session action.
class EnvironmentEnterSessionActionDefinition {
  /// The environment ID.
  final String environmentId;

  EnvironmentEnterSessionActionDefinition({
    required this.environmentId,
  });

  factory EnvironmentEnterSessionActionDefinition.fromJson(
      Map<String, dynamic> json) {
    return EnvironmentEnterSessionActionDefinition(
      environmentId: (json['environmentId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final environmentId = this.environmentId;
    return {
      'environmentId': environmentId,
    };
  }
}

/// Defines the environment a session action exits from.
class EnvironmentExitSessionActionDefinition {
  /// The environment ID.
  final String environmentId;

  EnvironmentExitSessionActionDefinition({
    required this.environmentId,
  });

  factory EnvironmentExitSessionActionDefinition.fromJson(
      Map<String, dynamic> json) {
    return EnvironmentExitSessionActionDefinition(
      environmentId: (json['environmentId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final environmentId = this.environmentId;
    return {
      'environmentId': environmentId,
    };
  }
}

/// The task, step, and parameters for the task run in the session action.
class TaskRunSessionActionDefinition {
  /// The task parameters.
  final Map<String, TaskParameterValue> parameters;

  /// The step ID.
  final String stepId;

  /// The task ID.
  final String? taskId;

  TaskRunSessionActionDefinition({
    required this.parameters,
    required this.stepId,
    this.taskId,
  });

  factory TaskRunSessionActionDefinition.fromJson(Map<String, dynamic> json) {
    return TaskRunSessionActionDefinition(
      parameters: ((json['parameters'] as Map<String, dynamic>?) ??
              const <String, dynamic>{})
          .map((k, e) => MapEntry(
              k, TaskParameterValue.fromJson(e as Map<String, dynamic>))),
      stepId: (json['stepId'] as String?) ?? '',
      taskId: json['taskId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final parameters = this.parameters;
    final stepId = this.stepId;
    final taskId = this.taskId;
    return {
      'parameters': parameters,
      'stepId': stepId,
      if (taskId != null) 'taskId': taskId,
    };
  }
}

/// The session action definition for syncing input job attachments.
class SyncInputJobAttachmentsSessionActionDefinition {
  /// The step ID for the sync input job attachments session action.
  final String? stepId;

  SyncInputJobAttachmentsSessionActionDefinition({
    this.stepId,
  });

  factory SyncInputJobAttachmentsSessionActionDefinition.fromJson(
      Map<String, dynamic> json) {
    return SyncInputJobAttachmentsSessionActionDefinition(
      stepId: json['stepId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final stepId = this.stepId;
    return {
      if (stepId != null) 'stepId': stepId,
    };
  }
}

/// Provides information about the number of resources used.
class AcquiredLimit {
  /// The number of limit resources used.
  final int count;

  /// The unique identifier of the limit.
  final String limitId;

  AcquiredLimit({
    required this.count,
    required this.limitId,
  });

  factory AcquiredLimit.fromJson(Map<String, dynamic> json) {
    return AcquiredLimit(
      count: (json['count'] as int?) ?? 0,
      limitId: (json['limitId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final count = this.count;
    final limitId = this.limitId;
    return {
      'count': count,
      'limitId': limitId,
    };
  }
}

/// Log configuration details.
class LogConfiguration {
  /// The log drivers for worker related logs.
  final String logDriver;

  /// The log configuration error details.
  final String? error;

  /// The options for a log driver.
  final Map<String, String>? options;

  /// The parameters for the log configuration.
  final Map<String, String>? parameters;

  LogConfiguration({
    required this.logDriver,
    this.error,
    this.options,
    this.parameters,
  });

  factory LogConfiguration.fromJson(Map<String, dynamic> json) {
    return LogConfiguration(
      logDriver: (json['logDriver'] as String?) ?? '',
      error: json['error'] as String?,
      options: (json['options'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      parameters: (json['parameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final logDriver = this.logDriver;
    final error = this.error;
    final options = this.options;
    final parameters = this.parameters;
    return {
      'logDriver': logDriver,
      if (error != null) 'error': error,
      if (options != null) 'options': options,
      if (parameters != null) 'parameters': parameters,
    };
  }
}

/// The host property details.
class HostPropertiesResponse {
  /// The ARN of the host EC2 instance.
  final String? ec2InstanceArn;

  /// The instance type of the host EC2 instance.
  final String? ec2InstanceType;

  /// The host name.
  final String? hostName;

  /// The IP address of the host.
  final IpAddresses? ipAddresses;

  HostPropertiesResponse({
    this.ec2InstanceArn,
    this.ec2InstanceType,
    this.hostName,
    this.ipAddresses,
  });

  factory HostPropertiesResponse.fromJson(Map<String, dynamic> json) {
    return HostPropertiesResponse(
      ec2InstanceArn: json['ec2InstanceArn'] as String?,
      ec2InstanceType: json['ec2InstanceType'] as String?,
      hostName: json['hostName'] as String?,
      ipAddresses: json['ipAddresses'] != null
          ? IpAddresses.fromJson(json['ipAddresses'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final ec2InstanceArn = this.ec2InstanceArn;
    final ec2InstanceType = this.ec2InstanceType;
    final hostName = this.hostName;
    final ipAddresses = this.ipAddresses;
    return {
      if (ec2InstanceArn != null) 'ec2InstanceArn': ec2InstanceArn,
      if (ec2InstanceType != null) 'ec2InstanceType': ec2InstanceType,
      if (hostName != null) 'hostName': hostName,
      if (ipAddresses != null) 'ipAddresses': ipAddresses,
    };
  }
}

/// The IP addresses for a host.
class IpAddresses {
  /// The IpV4 address of the network.
  final List<String>? ipV4Addresses;

  /// The IpV6 address for the network and node component.
  final List<String>? ipV6Addresses;

  IpAddresses({
    this.ipV4Addresses,
    this.ipV6Addresses,
  });

  factory IpAddresses.fromJson(Map<String, dynamic> json) {
    return IpAddresses(
      ipV4Addresses: (json['ipV4Addresses'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      ipV6Addresses: (json['ipV6Addresses'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final ipV4Addresses = this.ipV4Addresses;
    final ipV6Addresses = this.ipV6Addresses;
    return {
      if (ipV4Addresses != null) 'ipV4Addresses': ipV4Addresses,
      if (ipV6Addresses != null) 'ipV6Addresses': ipV6Addresses,
    };
  }
}

class JobTemplateType {
  static const json = JobTemplateType._('JSON');
  static const yaml = JobTemplateType._('YAML');

  final String value;

  const JobTemplateType._(this.value);

  static const values = [json, yaml];

  static JobTemplateType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => JobTemplateType._(value));

  @override
  bool operator ==(other) => other is JobTemplateType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The Amazon S3 location information.
class S3Location {
  /// The name of the Amazon S3 bucket.
  final String bucketName;

  /// The Amazon S3 object key that uniquely identifies the Amazon S3 bucket.
  final String key;

  S3Location({
    required this.bucketName,
    required this.key,
  });

  Map<String, dynamic> toJson() {
    final bucketName = this.bucketName;
    final key = this.key;
    return {
      'bucketName': bucketName,
      'key': key,
    };
  }
}

/// A summary of job details.
class JobSummary {
  /// The date and time the resource was created.
  final DateTime createdAt;

  /// The user or system that created this resource.
  final String createdBy;

  /// The job ID.
  final String jobId;

  /// The life cycle status.
  final JobLifecycleStatus lifecycleStatus;

  /// The life cycle status message.
  final String lifecycleStatusMessage;

  /// The job name.
  final String name;

  /// The job priority.
  final int priority;

  /// The date and time the resource ended running.
  final DateTime? endedAt;

  /// The number of task failures before the job stops running and is marked as
  /// <code>FAILED</code>.
  final int? maxFailedTasksCount;

  /// The maximum number of retries for a job.
  final int? maxRetriesPerTask;

  /// The maximum number of worker hosts that can concurrently process a job. When
  /// the <code>maxWorkerCount</code> is reached, no more workers will be assigned
  /// to process the job, even if the fleets assigned to the job's queue has
  /// available workers.
  ///
  /// You can't set the <code>maxWorkerCount</code> to 0. If you set it to -1,
  /// there is no maximum number of workers.
  ///
  /// If you don't specify the <code>maxWorkerCount</code>, the default is -1.
  final int? maxWorkerCount;

  /// The job ID for the source job.
  final String? sourceJobId;

  /// The date and time the resource started running.
  final DateTime? startedAt;

  /// The task status to update the job's tasks to.
  final JobTargetTaskRunStatus? targetTaskRunStatus;

  /// The total number of times tasks from the job failed and were retried.
  final int? taskFailureRetryCount;

  /// The task run status for the job.
  ///
  /// <ul>
  /// <li>
  /// <code>PENDING</code>–pending and waiting for resources.
  /// </li>
  /// <li>
  /// <code>READY</code>–ready to be processed.
  /// </li>
  /// <li>
  /// <code>ASSIGNED</code>–assigned and will run next on a worker.
  /// </li>
  /// <li>
  /// <code>SCHEDULED</code>–scheduled to be run on a worker.
  /// </li>
  /// <li>
  /// <code>INTERRUPTING</code>–being interrupted.
  /// </li>
  /// <li>
  /// <code>RUNNING</code>–running on a worker.
  /// </li>
  /// <li>
  /// <code>SUSPENDED</code>–the task is suspended.
  /// </li>
  /// <li>
  /// <code>CANCELED</code>–the task has been canceled.
  /// </li>
  /// <li>
  /// <code>FAILED</code>–the task has failed.
  /// </li>
  /// <li>
  /// <code>SUCCEEDED</code>–the task has succeeded.
  /// </li>
  /// </ul>
  final TaskRunStatus? taskRunStatus;

  /// The number of tasks running on the job.
  final Map<TaskRunStatus, int>? taskRunStatusCounts;

  /// The date and time the resource was updated.
  final DateTime? updatedAt;

  /// The user or system that updated this resource.
  final String? updatedBy;

  JobSummary({
    required this.createdAt,
    required this.createdBy,
    required this.jobId,
    required this.lifecycleStatus,
    required this.lifecycleStatusMessage,
    required this.name,
    required this.priority,
    this.endedAt,
    this.maxFailedTasksCount,
    this.maxRetriesPerTask,
    this.maxWorkerCount,
    this.sourceJobId,
    this.startedAt,
    this.targetTaskRunStatus,
    this.taskFailureRetryCount,
    this.taskRunStatus,
    this.taskRunStatusCounts,
    this.updatedAt,
    this.updatedBy,
  });

  factory JobSummary.fromJson(Map<String, dynamic> json) {
    return JobSummary(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      createdBy: (json['createdBy'] as String?) ?? '',
      jobId: (json['jobId'] as String?) ?? '',
      lifecycleStatus: JobLifecycleStatus.fromString(
          (json['lifecycleStatus'] as String?) ?? ''),
      lifecycleStatusMessage: (json['lifecycleStatusMessage'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      priority: (json['priority'] as int?) ?? 0,
      endedAt: timeStampFromJson(json['endedAt']),
      maxFailedTasksCount: json['maxFailedTasksCount'] as int?,
      maxRetriesPerTask: json['maxRetriesPerTask'] as int?,
      maxWorkerCount: json['maxWorkerCount'] as int?,
      sourceJobId: json['sourceJobId'] as String?,
      startedAt: timeStampFromJson(json['startedAt']),
      targetTaskRunStatus: (json['targetTaskRunStatus'] as String?)
          ?.let(JobTargetTaskRunStatus.fromString),
      taskFailureRetryCount: json['taskFailureRetryCount'] as int?,
      taskRunStatus:
          (json['taskRunStatus'] as String?)?.let(TaskRunStatus.fromString),
      taskRunStatusCounts:
          (json['taskRunStatusCounts'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(TaskRunStatus.fromString(k), e as int)),
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final jobId = this.jobId;
    final lifecycleStatus = this.lifecycleStatus;
    final lifecycleStatusMessage = this.lifecycleStatusMessage;
    final name = this.name;
    final priority = this.priority;
    final endedAt = this.endedAt;
    final maxFailedTasksCount = this.maxFailedTasksCount;
    final maxRetriesPerTask = this.maxRetriesPerTask;
    final maxWorkerCount = this.maxWorkerCount;
    final sourceJobId = this.sourceJobId;
    final startedAt = this.startedAt;
    final targetTaskRunStatus = this.targetTaskRunStatus;
    final taskFailureRetryCount = this.taskFailureRetryCount;
    final taskRunStatus = this.taskRunStatus;
    final taskRunStatusCounts = this.taskRunStatusCounts;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'createdBy': createdBy,
      'jobId': jobId,
      'lifecycleStatus': lifecycleStatus.value,
      'lifecycleStatusMessage': lifecycleStatusMessage,
      'name': name,
      'priority': priority,
      if (endedAt != null) 'endedAt': iso8601ToJson(endedAt),
      if (maxFailedTasksCount != null)
        'maxFailedTasksCount': maxFailedTasksCount,
      if (maxRetriesPerTask != null) 'maxRetriesPerTask': maxRetriesPerTask,
      if (maxWorkerCount != null) 'maxWorkerCount': maxWorkerCount,
      if (sourceJobId != null) 'sourceJobId': sourceJobId,
      if (startedAt != null) 'startedAt': iso8601ToJson(startedAt),
      if (targetTaskRunStatus != null)
        'targetTaskRunStatus': targetTaskRunStatus.value,
      if (taskFailureRetryCount != null)
        'taskFailureRetryCount': taskFailureRetryCount,
      if (taskRunStatus != null) 'taskRunStatus': taskRunStatus.value,
      if (taskRunStatusCounts != null)
        'taskRunStatusCounts':
            taskRunStatusCounts.map((k, e) => MapEntry(k.value, e)),
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

class JobLifecycleStatus {
  static const createInProgress = JobLifecycleStatus._('CREATE_IN_PROGRESS');
  static const createFailed = JobLifecycleStatus._('CREATE_FAILED');
  static const createComplete = JobLifecycleStatus._('CREATE_COMPLETE');
  static const uploadInProgress = JobLifecycleStatus._('UPLOAD_IN_PROGRESS');
  static const uploadFailed = JobLifecycleStatus._('UPLOAD_FAILED');
  static const updateInProgress = JobLifecycleStatus._('UPDATE_IN_PROGRESS');
  static const updateFailed = JobLifecycleStatus._('UPDATE_FAILED');
  static const updateSucceeded = JobLifecycleStatus._('UPDATE_SUCCEEDED');
  static const archived = JobLifecycleStatus._('ARCHIVED');

  final String value;

  const JobLifecycleStatus._(this.value);

  static const values = [
    createInProgress,
    createFailed,
    createComplete,
    uploadInProgress,
    uploadFailed,
    updateInProgress,
    updateFailed,
    updateSucceeded,
    archived
  ];

  static JobLifecycleStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => JobLifecycleStatus._(value));

  @override
  bool operator ==(other) =>
      other is JobLifecycleStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class JobTargetTaskRunStatus {
  static const ready = JobTargetTaskRunStatus._('READY');
  static const failed = JobTargetTaskRunStatus._('FAILED');
  static const succeeded = JobTargetTaskRunStatus._('SUCCEEDED');
  static const canceled = JobTargetTaskRunStatus._('CANCELED');
  static const suspended = JobTargetTaskRunStatus._('SUSPENDED');
  static const pending = JobTargetTaskRunStatus._('PENDING');

  final String value;

  const JobTargetTaskRunStatus._(this.value);

  static const values = [
    ready,
    failed,
    succeeded,
    canceled,
    suspended,
    pending
  ];

  static JobTargetTaskRunStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => JobTargetTaskRunStatus._(value));

  @override
  bool operator ==(other) =>
      other is JobTargetTaskRunStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class UpdateJobLifecycleStatus {
  static const archived = UpdateJobLifecycleStatus._('ARCHIVED');

  final String value;

  const UpdateJobLifecycleStatus._(this.value);

  static const values = [archived];

  static UpdateJobLifecycleStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => UpdateJobLifecycleStatus._(value));

  @override
  bool operator ==(other) =>
      other is UpdateJobLifecycleStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The job attachments.
class Attachments {
  /// The manifest properties for the attachments.
  final List<ManifestProperties> manifests;

  /// The file system location for the attachments.
  final JobAttachmentsFileSystem? fileSystem;

  Attachments({
    required this.manifests,
    this.fileSystem,
  });

  factory Attachments.fromJson(Map<String, dynamic> json) {
    return Attachments(
      manifests: ((json['manifests'] as List?) ?? const [])
          .nonNulls
          .map((e) => ManifestProperties.fromJson(e as Map<String, dynamic>))
          .toList(),
      fileSystem: (json['fileSystem'] as String?)
          ?.let(JobAttachmentsFileSystem.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final manifests = this.manifests;
    final fileSystem = this.fileSystem;
    return {
      'manifests': manifests,
      if (fileSystem != null) 'fileSystem': fileSystem.value,
    };
  }
}

class JobAttachmentsFileSystem {
  static const copied = JobAttachmentsFileSystem._('COPIED');
  static const virtual = JobAttachmentsFileSystem._('VIRTUAL');

  final String value;

  const JobAttachmentsFileSystem._(this.value);

  static const values = [copied, virtual];

  static JobAttachmentsFileSystem fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => JobAttachmentsFileSystem._(value));

  @override
  bool operator ==(other) =>
      other is JobAttachmentsFileSystem && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The details of the manifest that links a job's source information.
class ManifestProperties {
  /// The file's root path.
  final String rootPath;

  /// The format of the root path.
  final PathFormat rootPathFormat;

  /// The file system location name.
  final String? fileSystemLocationName;

  /// The hash value of the file.
  final String? inputManifestHash;

  /// The file path.
  final String? inputManifestPath;

  /// The file path relative to the directory.
  final List<String>? outputRelativeDirectories;

  ManifestProperties({
    required this.rootPath,
    required this.rootPathFormat,
    this.fileSystemLocationName,
    this.inputManifestHash,
    this.inputManifestPath,
    this.outputRelativeDirectories,
  });

  factory ManifestProperties.fromJson(Map<String, dynamic> json) {
    return ManifestProperties(
      rootPath: (json['rootPath'] as String?) ?? '',
      rootPathFormat:
          PathFormat.fromString((json['rootPathFormat'] as String?) ?? ''),
      fileSystemLocationName: json['fileSystemLocationName'] as String?,
      inputManifestHash: json['inputManifestHash'] as String?,
      inputManifestPath: json['inputManifestPath'] as String?,
      outputRelativeDirectories: (json['outputRelativeDirectories'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final rootPath = this.rootPath;
    final rootPathFormat = this.rootPathFormat;
    final fileSystemLocationName = this.fileSystemLocationName;
    final inputManifestHash = this.inputManifestHash;
    final inputManifestPath = this.inputManifestPath;
    final outputRelativeDirectories = this.outputRelativeDirectories;
    return {
      'rootPath': rootPath,
      'rootPathFormat': rootPathFormat.value,
      if (fileSystemLocationName != null)
        'fileSystemLocationName': fileSystemLocationName,
      if (inputManifestHash != null) 'inputManifestHash': inputManifestHash,
      if (inputManifestPath != null) 'inputManifestPath': inputManifestPath,
      if (outputRelativeDirectories != null)
        'outputRelativeDirectories': outputRelativeDirectories,
    };
  }
}

class PathFormat {
  static const windows = PathFormat._('windows');
  static const posix = PathFormat._('posix');

  final String value;

  const PathFormat._(this.value);

  static const values = [windows, posix];

  static PathFormat fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => PathFormat._(value));

  @override
  bool operator ==(other) => other is PathFormat && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The details of job parameters.
class JobParameter {
  /// A double precision IEEE-754 floating point number represented as a string.
  final String? float;

  /// A signed integer represented as a string.
  final String? intValue;

  /// A file system path represented as a string.
  final String? path;

  /// A UTF-8 string.
  final String? string;

  JobParameter({
    this.float,
    this.intValue,
    this.path,
    this.string,
  });

  factory JobParameter.fromJson(Map<String, dynamic> json) {
    return JobParameter(
      float: json['float'] as String?,
      intValue: json['int'] as String?,
      path: json['path'] as String?,
      string: json['string'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final float = this.float;
    final intValue = this.intValue;
    final path = this.path;
    final string = this.string;
    return {
      if (float != null) 'float': float,
      if (intValue != null) 'int': intValue,
      if (path != null) 'path': path,
      if (string != null) 'string': string,
    };
  }
}

class CreateJobTargetTaskRunStatus {
  static const ready = CreateJobTargetTaskRunStatus._('READY');
  static const suspended = CreateJobTargetTaskRunStatus._('SUSPENDED');

  final String value;

  const CreateJobTargetTaskRunStatus._(this.value);

  static const values = [ready, suspended];

  static CreateJobTargetTaskRunStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CreateJobTargetTaskRunStatus._(value));

  @override
  bool operator ==(other) =>
      other is CreateJobTargetTaskRunStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class EnvironmentTemplateType {
  static const json = EnvironmentTemplateType._('JSON');
  static const yaml = EnvironmentTemplateType._('YAML');

  final String value;

  const EnvironmentTemplateType._(this.value);

  static const values = [json, yaml];

  static EnvironmentTemplateType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EnvironmentTemplateType._(value));

  @override
  bool operator ==(other) =>
      other is EnvironmentTemplateType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The details of a storage profile.
class StorageProfileSummary {
  /// The display name of the storage profile summary to update.
  /// <important>
  /// This field can store any content. Escape or encode this content before
  /// displaying it on a webpage or any other system that might interpret the
  /// content of this field.
  /// </important>
  final String displayName;

  /// The operating system (OS) family.
  final StorageProfileOperatingSystemFamily osFamily;

  /// The storage profile ID.
  final String storageProfileId;

  StorageProfileSummary({
    required this.displayName,
    required this.osFamily,
    required this.storageProfileId,
  });

  factory StorageProfileSummary.fromJson(Map<String, dynamic> json) {
    return StorageProfileSummary(
      displayName: (json['displayName'] as String?) ?? '',
      osFamily: StorageProfileOperatingSystemFamily.fromString(
          (json['osFamily'] as String?) ?? ''),
      storageProfileId: (json['storageProfileId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final displayName = this.displayName;
    final osFamily = this.osFamily;
    final storageProfileId = this.storageProfileId;
    return {
      'displayName': displayName,
      'osFamily': osFamily.value,
      'storageProfileId': storageProfileId,
    };
  }
}

class StorageProfileOperatingSystemFamily {
  static const windows = StorageProfileOperatingSystemFamily._('WINDOWS');
  static const linux = StorageProfileOperatingSystemFamily._('LINUX');
  static const macos = StorageProfileOperatingSystemFamily._('MACOS');

  final String value;

  const StorageProfileOperatingSystemFamily._(this.value);

  static const values = [windows, linux, macos];

  static StorageProfileOperatingSystemFamily fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => StorageProfileOperatingSystemFamily._(value));

  @override
  bool operator ==(other) =>
      other is StorageProfileOperatingSystemFamily && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The details of a queue member.
class QueueMember {
  /// The farm ID.
  final String farmId;

  /// The identity store ID.
  final String identityStoreId;

  /// The queue member's membership level.
  final MembershipLevel membershipLevel;

  /// The principal ID of the queue member.
  final String principalId;

  /// The principal type of the queue member.
  final DeadlinePrincipalType principalType;

  /// The queue ID.
  final String queueId;

  QueueMember({
    required this.farmId,
    required this.identityStoreId,
    required this.membershipLevel,
    required this.principalId,
    required this.principalType,
    required this.queueId,
  });

  factory QueueMember.fromJson(Map<String, dynamic> json) {
    return QueueMember(
      farmId: (json['farmId'] as String?) ?? '',
      identityStoreId: (json['identityStoreId'] as String?) ?? '',
      membershipLevel: MembershipLevel.fromString(
          (json['membershipLevel'] as String?) ?? ''),
      principalId: (json['principalId'] as String?) ?? '',
      principalType: DeadlinePrincipalType.fromString(
          (json['principalType'] as String?) ?? ''),
      queueId: (json['queueId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final farmId = this.farmId;
    final identityStoreId = this.identityStoreId;
    final membershipLevel = this.membershipLevel;
    final principalId = this.principalId;
    final principalType = this.principalType;
    final queueId = this.queueId;
    return {
      'farmId': farmId,
      'identityStoreId': identityStoreId,
      'membershipLevel': membershipLevel.value,
      'principalId': principalId,
      'principalType': principalType.value,
      'queueId': queueId,
    };
  }
}

/// The summary of a queue environment.
class QueueEnvironmentSummary {
  /// The name of the queue environment.
  final String name;

  /// The queue environment's priority.
  final int priority;

  /// The queue environment ID.
  final String queueEnvironmentId;

  QueueEnvironmentSummary({
    required this.name,
    required this.priority,
    required this.queueEnvironmentId,
  });

  factory QueueEnvironmentSummary.fromJson(Map<String, dynamic> json) {
    return QueueEnvironmentSummary(
      name: (json['name'] as String?) ?? '',
      priority: (json['priority'] as int?) ?? 0,
      queueEnvironmentId: (json['queueEnvironmentId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final priority = this.priority;
    final queueEnvironmentId = this.queueEnvironmentId;
    return {
      'name': name,
      'priority': priority,
      'queueEnvironmentId': queueEnvironmentId,
    };
  }
}

/// The details of the file system location for the resource.
class FileSystemLocation {
  /// The location name.
  final String name;

  /// The file path.
  final String path;

  /// The type of file.
  final FileSystemLocationType type;

  FileSystemLocation({
    required this.name,
    required this.path,
    required this.type,
  });

  factory FileSystemLocation.fromJson(Map<String, dynamic> json) {
    return FileSystemLocation(
      name: (json['name'] as String?) ?? '',
      path: (json['path'] as String?) ?? '',
      type: FileSystemLocationType.fromString((json['type'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final path = this.path;
    final type = this.type;
    return {
      'name': name,
      'path': path,
      'type': type.value,
    };
  }
}

class FileSystemLocationType {
  static const shared = FileSystemLocationType._('SHARED');
  static const local = FileSystemLocationType._('LOCAL');

  final String value;

  const FileSystemLocationType._(this.value);

  static const values = [shared, local];

  static FileSystemLocationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => FileSystemLocationType._(value));

  @override
  bool operator ==(other) =>
      other is FileSystemLocationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The Identity and Access Management credentials.
class AwsCredentials {
  /// The IAM access key ID.
  final String accessKeyId;

  /// The expiration date and time of the IAM credentials.
  final DateTime expiration;

  /// The IAM secret access key.
  final String secretAccessKey;

  /// The IAM session token
  final String sessionToken;

  AwsCredentials({
    required this.accessKeyId,
    required this.expiration,
    required this.secretAccessKey,
    required this.sessionToken,
  });

  factory AwsCredentials.fromJson(Map<String, dynamic> json) {
    return AwsCredentials(
      accessKeyId: (json['accessKeyId'] as String?) ?? '',
      expiration: nonNullableTimeStampFromJson(json['expiration'] ?? 0),
      secretAccessKey: (json['secretAccessKey'] as String?) ?? '',
      sessionToken: (json['sessionToken'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final accessKeyId = this.accessKeyId;
    final expiration = this.expiration;
    final secretAccessKey = this.secretAccessKey;
    final sessionToken = this.sessionToken;
    return {
      'accessKeyId': accessKeyId,
      'expiration': iso8601ToJson(expiration),
      'secretAccessKey': secretAccessKey,
      'sessionToken': sessionToken,
    };
  }
}

/// The details of a queue summary.
class QueueSummary {
  /// The date and time the resource was created.
  final DateTime createdAt;

  /// The user or system that created this resource.
  final String createdBy;

  /// The default action taken on a queue summary if a budget wasn't configured.
  final DefaultQueueBudgetAction defaultBudgetAction;

  /// The display name of the queue summary to update.
  /// <important>
  /// This field can store any content. Escape or encode this content before
  /// displaying it on a webpage or any other system that might interpret the
  /// content of this field.
  /// </important>
  final String displayName;

  /// The farm ID.
  final String farmId;

  /// The queue ID.
  final String queueId;

  /// That status of the queue.
  final QueueStatus status;

  /// The reason the queue is blocked, if applicable.
  final QueueBlockedReason? blockedReason;

  /// The date and time the resource was updated.
  final DateTime? updatedAt;

  /// The user or system that updated this resource.
  final String? updatedBy;

  QueueSummary({
    required this.createdAt,
    required this.createdBy,
    required this.defaultBudgetAction,
    required this.displayName,
    required this.farmId,
    required this.queueId,
    required this.status,
    this.blockedReason,
    this.updatedAt,
    this.updatedBy,
  });

  factory QueueSummary.fromJson(Map<String, dynamic> json) {
    return QueueSummary(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      createdBy: (json['createdBy'] as String?) ?? '',
      defaultBudgetAction: DefaultQueueBudgetAction.fromString(
          (json['defaultBudgetAction'] as String?) ?? ''),
      displayName: (json['displayName'] as String?) ?? '',
      farmId: (json['farmId'] as String?) ?? '',
      queueId: (json['queueId'] as String?) ?? '',
      status: QueueStatus.fromString((json['status'] as String?) ?? ''),
      blockedReason: (json['blockedReason'] as String?)
          ?.let(QueueBlockedReason.fromString),
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final defaultBudgetAction = this.defaultBudgetAction;
    final displayName = this.displayName;
    final farmId = this.farmId;
    final queueId = this.queueId;
    final status = this.status;
    final blockedReason = this.blockedReason;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'createdBy': createdBy,
      'defaultBudgetAction': defaultBudgetAction.value,
      'displayName': displayName,
      'farmId': farmId,
      'queueId': queueId,
      'status': status.value,
      if (blockedReason != null) 'blockedReason': blockedReason.value,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

class QueueStatus {
  static const idle = QueueStatus._('IDLE');
  static const scheduling = QueueStatus._('SCHEDULING');
  static const schedulingBlocked = QueueStatus._('SCHEDULING_BLOCKED');

  final String value;

  const QueueStatus._(this.value);

  static const values = [idle, scheduling, schedulingBlocked];

  static QueueStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => QueueStatus._(value));

  @override
  bool operator ==(other) => other is QueueStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class DefaultQueueBudgetAction {
  static const none = DefaultQueueBudgetAction._('NONE');
  static const stopSchedulingAndCompleteTasks =
      DefaultQueueBudgetAction._('STOP_SCHEDULING_AND_COMPLETE_TASKS');
  static const stopSchedulingAndCancelTasks =
      DefaultQueueBudgetAction._('STOP_SCHEDULING_AND_CANCEL_TASKS');

  final String value;

  const DefaultQueueBudgetAction._(this.value);

  static const values = [
    none,
    stopSchedulingAndCompleteTasks,
    stopSchedulingAndCancelTasks
  ];

  static DefaultQueueBudgetAction fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DefaultQueueBudgetAction._(value));

  @override
  bool operator ==(other) =>
      other is DefaultQueueBudgetAction && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class QueueBlockedReason {
  static const noBudgetConfigured =
      QueueBlockedReason._('NO_BUDGET_CONFIGURED');
  static const budgetThresholdReached =
      QueueBlockedReason._('BUDGET_THRESHOLD_REACHED');

  final String value;

  const QueueBlockedReason._(this.value);

  static const values = [noBudgetConfigured, budgetThresholdReached];

  static QueueBlockedReason fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => QueueBlockedReason._(value));

  @override
  bool operator ==(other) =>
      other is QueueBlockedReason && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The job attachment settings. These are the Amazon S3 bucket name and the
/// Amazon S3 prefix.
class JobAttachmentSettings {
  /// The root prefix.
  final String rootPrefix;

  /// The Amazon S3 bucket name.
  final String s3BucketName;

  JobAttachmentSettings({
    required this.rootPrefix,
    required this.s3BucketName,
  });

  factory JobAttachmentSettings.fromJson(Map<String, dynamic> json) {
    return JobAttachmentSettings(
      rootPrefix: (json['rootPrefix'] as String?) ?? '',
      s3BucketName: (json['s3BucketName'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final rootPrefix = this.rootPrefix;
    final s3BucketName = this.s3BucketName;
    return {
      'rootPrefix': rootPrefix,
      's3BucketName': s3BucketName,
    };
  }
}

/// Identifies the user for a job.
class JobRunAsUser {
  /// Specifies whether the job should run using the queue's system user or if the
  /// job should run using the worker agent system user.
  final RunAs runAs;

  /// The user and group that the jobs in the queue run as.
  final PosixUser? posix;

  /// Identifies a Microsoft Windows user.
  final WindowsUser? windows;

  JobRunAsUser({
    required this.runAs,
    this.posix,
    this.windows,
  });

  factory JobRunAsUser.fromJson(Map<String, dynamic> json) {
    return JobRunAsUser(
      runAs: RunAs.fromString((json['runAs'] as String?) ?? ''),
      posix: json['posix'] != null
          ? PosixUser.fromJson(json['posix'] as Map<String, dynamic>)
          : null,
      windows: json['windows'] != null
          ? WindowsUser.fromJson(json['windows'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final runAs = this.runAs;
    final posix = this.posix;
    final windows = this.windows;
    return {
      'runAs': runAs.value,
      if (posix != null) 'posix': posix,
      if (windows != null) 'windows': windows,
    };
  }
}

/// The scheduling configuration for a queue. Defines the strategy used to
/// assign workers to jobs.
class SchedulingConfiguration {
  /// Workers are distributed evenly across all jobs at the highest priority
  /// level. When workers cannot be evenly divided, the extra workers are assigned
  /// to the jobs submitted earliest. If a job has fewer remaining tasks than its
  /// share of workers, the surplus workers are redistributed to other jobs at the
  /// same priority level.
  final PriorityBalancedSchedulingConfiguration? priorityBalanced;

  /// Workers are assigned to the highest-priority job first. When multiple jobs
  /// share the same priority, the job submitted earliest receives workers first.
  /// This is the default scheduling configuration for new queues.
  final PriorityFifoSchedulingConfiguration? priorityFifo;

  /// Workers are assigned to jobs based on a weighted formula that considers job
  /// priority, error count, submission time, and the number of tasks currently
  /// rendering. Each factor has a configurable weight that determines its
  /// influence on scheduling decisions.
  final WeightedBalancedSchedulingConfiguration? weightedBalanced;

  SchedulingConfiguration({
    this.priorityBalanced,
    this.priorityFifo,
    this.weightedBalanced,
  });

  factory SchedulingConfiguration.fromJson(Map<String, dynamic> json) {
    return SchedulingConfiguration(
      priorityBalanced: json['priorityBalanced'] != null
          ? PriorityBalancedSchedulingConfiguration.fromJson(
              json['priorityBalanced'] as Map<String, dynamic>)
          : null,
      priorityFifo: json['priorityFifo'] != null
          ? PriorityFifoSchedulingConfiguration.fromJson(
              json['priorityFifo'] as Map<String, dynamic>)
          : null,
      weightedBalanced: json['weightedBalanced'] != null
          ? WeightedBalancedSchedulingConfiguration.fromJson(
              json['weightedBalanced'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final priorityBalanced = this.priorityBalanced;
    final priorityFifo = this.priorityFifo;
    final weightedBalanced = this.weightedBalanced;
    return {
      if (priorityBalanced != null) 'priorityBalanced': priorityBalanced,
      if (priorityFifo != null) 'priorityFifo': priorityFifo,
      if (weightedBalanced != null) 'weightedBalanced': weightedBalanced,
    };
  }
}

/// Configuration for priority first-in, first-out (FIFO) scheduling. Workers
/// are assigned to the highest-priority job first. When multiple jobs share the
/// same priority, the job submitted earliest receives workers first.
class PriorityFifoSchedulingConfiguration {
  PriorityFifoSchedulingConfiguration();

  factory PriorityFifoSchedulingConfiguration.fromJson(Map<String, dynamic> _) {
    return PriorityFifoSchedulingConfiguration();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Configuration for priority balanced scheduling. Workers are distributed
/// evenly across all jobs at the highest priority level.
class PriorityBalancedSchedulingConfiguration {
  /// The rendering task buffer controls worker stickiness. A worker only switches
  /// from its current job to another job at the same priority if the other job
  /// has fewer rendering tasks by more than this buffer value. Higher values make
  /// workers stickier to their current jobs. The default value is <code>1</code>.
  final int? renderingTaskBuffer;

  PriorityBalancedSchedulingConfiguration({
    this.renderingTaskBuffer,
  });

  factory PriorityBalancedSchedulingConfiguration.fromJson(
      Map<String, dynamic> json) {
    return PriorityBalancedSchedulingConfiguration(
      renderingTaskBuffer: json['renderingTaskBuffer'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final renderingTaskBuffer = this.renderingTaskBuffer;
    return {
      if (renderingTaskBuffer != null)
        'renderingTaskBuffer': renderingTaskBuffer,
    };
  }
}

/// Configuration for weighted balanced scheduling. Workers are assigned to jobs
/// based on a weighted formula:
///
/// <code>weight = (priority * priorityWeight) + (errors * errorWeight) +
/// ((currentTime - submissionTime) * submissionTimeWeight) + ((renderingTasks -
/// renderingTaskBuffer) * renderingTaskWeight)</code>
///
/// The job with the highest calculated weight is scheduled first. Workers are
/// distributed evenly amongst jobs with the same weight.
class WeightedBalancedSchedulingConfiguration {
  /// The weight applied to the number of errors on a job. A negative value means
  /// jobs without errors are scheduled first. A value of <code>0</code> means
  /// errors are ignored. The default value is <code>-10.0</code>.
  final double? errorWeight;

  /// Overrides the weighted scheduling formula for jobs at the maximum priority
  /// (100). When set, jobs with priority 100 are always scheduled first
  /// regardless of their calculated weight. When absent, maximum priority jobs
  /// use the standard weighted formula.
  final SchedulingMaxPriorityOverride? maxPriorityOverride;

  /// Overrides the weighted scheduling formula for jobs at the minimum priority
  /// (0). When set, jobs with priority 0 are always scheduled last regardless of
  /// their calculated weight. When absent, minimum priority jobs use the standard
  /// weighted formula.
  final SchedulingMinPriorityOverride? minPriorityOverride;

  /// The weight applied to job priority in the scheduling formula. Higher values
  /// give more influence to job priority. A value of <code>0</code> means
  /// priority is ignored. The default value is <code>100.0</code>.
  final double? priorityWeight;

  /// The rendering task buffer is subtracted from the number of rendering tasks
  /// before applying the rendering task weight. This creates a stickiness effect
  /// where workers prefer to stay with their current job. Higher values make
  /// workers stickier. The default value is <code>1</code>. The buffer is only
  /// applied in the weight calculation for a job if the worker is currently
  /// assigned to that job.
  final int? renderingTaskBuffer;

  /// The weight applied to the number of tasks currently rendering on a job. A
  /// negative value means jobs that are not already rendering are scheduled next.
  /// A value of <code>0</code> means the rendering state is ignored. The default
  /// value is <code>-100.0</code>.
  final double? renderingTaskWeight;

  /// The weight applied to job submission time. A positive value means earlier
  /// jobs are scheduled first. A value of <code>0</code> means submission time is
  /// ignored. The default value is <code>3.0</code>.
  final double? submissionTimeWeight;

  WeightedBalancedSchedulingConfiguration({
    this.errorWeight,
    this.maxPriorityOverride,
    this.minPriorityOverride,
    this.priorityWeight,
    this.renderingTaskBuffer,
    this.renderingTaskWeight,
    this.submissionTimeWeight,
  });

  factory WeightedBalancedSchedulingConfiguration.fromJson(
      Map<String, dynamic> json) {
    return WeightedBalancedSchedulingConfiguration(
      errorWeight: json['errorWeight'] as double?,
      maxPriorityOverride: json['maxPriorityOverride'] != null
          ? SchedulingMaxPriorityOverride.fromJson(
              json['maxPriorityOverride'] as Map<String, dynamic>)
          : null,
      minPriorityOverride: json['minPriorityOverride'] != null
          ? SchedulingMinPriorityOverride.fromJson(
              json['minPriorityOverride'] as Map<String, dynamic>)
          : null,
      priorityWeight: json['priorityWeight'] as double?,
      renderingTaskBuffer: json['renderingTaskBuffer'] as int?,
      renderingTaskWeight: json['renderingTaskWeight'] as double?,
      submissionTimeWeight: json['submissionTimeWeight'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorWeight = this.errorWeight;
    final maxPriorityOverride = this.maxPriorityOverride;
    final minPriorityOverride = this.minPriorityOverride;
    final priorityWeight = this.priorityWeight;
    final renderingTaskBuffer = this.renderingTaskBuffer;
    final renderingTaskWeight = this.renderingTaskWeight;
    final submissionTimeWeight = this.submissionTimeWeight;
    return {
      if (errorWeight != null) 'errorWeight': errorWeight,
      if (maxPriorityOverride != null)
        'maxPriorityOverride': maxPriorityOverride,
      if (minPriorityOverride != null)
        'minPriorityOverride': minPriorityOverride,
      if (priorityWeight != null) 'priorityWeight': priorityWeight,
      if (renderingTaskBuffer != null)
        'renderingTaskBuffer': renderingTaskBuffer,
      if (renderingTaskWeight != null)
        'renderingTaskWeight': renderingTaskWeight,
      if (submissionTimeWeight != null)
        'submissionTimeWeight': submissionTimeWeight,
    };
  }
}

/// Defines the override behavior for jobs at the maximum priority (100) in
/// weighted balanced scheduling.
class SchedulingMaxPriorityOverride {
  /// Jobs at the maximum priority (100) are always scheduled before other jobs,
  /// regardless of the weighted scheduling formula. If multiple jobs have
  /// priority 100, ties are broken using the standard weighted formula.
  final SchedulingMaxPriorityOverrideAlwaysScheduleFirst? alwaysScheduleFirst;

  SchedulingMaxPriorityOverride({
    this.alwaysScheduleFirst,
  });

  factory SchedulingMaxPriorityOverride.fromJson(Map<String, dynamic> json) {
    return SchedulingMaxPriorityOverride(
      alwaysScheduleFirst: json['alwaysScheduleFirst'] != null
          ? SchedulingMaxPriorityOverrideAlwaysScheduleFirst.fromJson(
              json['alwaysScheduleFirst'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final alwaysScheduleFirst = this.alwaysScheduleFirst;
    return {
      if (alwaysScheduleFirst != null)
        'alwaysScheduleFirst': alwaysScheduleFirst,
    };
  }
}

/// Defines the override behavior for jobs at the minimum priority (0) in
/// weighted balanced scheduling.
class SchedulingMinPriorityOverride {
  /// Jobs at the minimum priority (0) are always scheduled after all other jobs,
  /// regardless of the weighted scheduling formula. If multiple jobs have
  /// priority 0, ties are broken using the standard weighted formula.
  final SchedulingMinPriorityOverrideAlwaysScheduleLast? alwaysScheduleLast;

  SchedulingMinPriorityOverride({
    this.alwaysScheduleLast,
  });

  factory SchedulingMinPriorityOverride.fromJson(Map<String, dynamic> json) {
    return SchedulingMinPriorityOverride(
      alwaysScheduleLast: json['alwaysScheduleLast'] != null
          ? SchedulingMinPriorityOverrideAlwaysScheduleLast.fromJson(
              json['alwaysScheduleLast'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final alwaysScheduleLast = this.alwaysScheduleLast;
    return {
      if (alwaysScheduleLast != null) 'alwaysScheduleLast': alwaysScheduleLast,
    };
  }
}

/// Specifies that jobs at the minimum priority (0) are always scheduled last.
class SchedulingMinPriorityOverrideAlwaysScheduleLast {
  SchedulingMinPriorityOverrideAlwaysScheduleLast();

  factory SchedulingMinPriorityOverrideAlwaysScheduleLast.fromJson(
      Map<String, dynamic> _) {
    return SchedulingMinPriorityOverrideAlwaysScheduleLast();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Specifies that jobs at the maximum priority (100) are always scheduled
/// first.
class SchedulingMaxPriorityOverrideAlwaysScheduleFirst {
  SchedulingMaxPriorityOverrideAlwaysScheduleFirst();

  factory SchedulingMaxPriorityOverrideAlwaysScheduleFirst.fromJson(
      Map<String, dynamic> _) {
    return SchedulingMaxPriorityOverrideAlwaysScheduleFirst();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The POSIX user.
class PosixUser {
  /// The name of the POSIX user's group.
  final String group;

  /// The name of the POSIX user.
  final String user;

  PosixUser({
    required this.group,
    required this.user,
  });

  factory PosixUser.fromJson(Map<String, dynamic> json) {
    return PosixUser(
      group: (json['group'] as String?) ?? '',
      user: (json['user'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final group = this.group;
    final user = this.user;
    return {
      'group': group,
      'user': user,
    };
  }
}

/// The Windows user details.
class WindowsUser {
  /// The password ARN for the Windows user.
  final String passwordArn;

  /// The user.
  final String user;

  WindowsUser({
    required this.passwordArn,
    required this.user,
  });

  factory WindowsUser.fromJson(Map<String, dynamic> json) {
    return WindowsUser(
      passwordArn: (json['passwordArn'] as String?) ?? '',
      user: (json['user'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final passwordArn = this.passwordArn;
    final user = this.user;
    return {
      'passwordArn': passwordArn,
      'user': user,
    };
  }
}

class RunAs {
  static const queueConfiguredUser = RunAs._('QUEUE_CONFIGURED_USER');
  static const workerAgentUser = RunAs._('WORKER_AGENT_USER');

  final String value;

  const RunAs._(this.value);

  static const values = [queueConfiguredUser, workerAgentUser];

  static RunAs fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => RunAs._(value));

  @override
  bool operator ==(other) => other is RunAs && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class DesiredWorkerStatus {
  static const stopped = DesiredWorkerStatus._('STOPPED');

  final String value;

  const DesiredWorkerStatus._(this.value);

  static const values = [stopped];

  static DesiredWorkerStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DesiredWorkerStatus._(value));

  @override
  bool operator ==(other) =>
      other is DesiredWorkerStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The assigned session for the worker.
class AssignedSession {
  /// The job ID for the assigned session.
  final String jobId;

  /// The log configuration for the worker's assigned session.
  final LogConfiguration logConfiguration;

  /// The queue ID of the assigned session.
  final String queueId;

  /// The session actions to apply to the assigned session.
  final List<AssignedSessionAction> sessionActions;

  AssignedSession({
    required this.jobId,
    required this.logConfiguration,
    required this.queueId,
    required this.sessionActions,
  });

  factory AssignedSession.fromJson(Map<String, dynamic> json) {
    return AssignedSession(
      jobId: (json['jobId'] as String?) ?? '',
      logConfiguration: LogConfiguration.fromJson(
          (json['logConfiguration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      queueId: (json['queueId'] as String?) ?? '',
      sessionActions: ((json['sessionActions'] as List?) ?? const [])
          .nonNulls
          .map((e) => AssignedSessionAction.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    final logConfiguration = this.logConfiguration;
    final queueId = this.queueId;
    final sessionActions = this.sessionActions;
    return {
      'jobId': jobId,
      'logConfiguration': logConfiguration,
      'queueId': queueId,
      'sessionActions': sessionActions,
    };
  }
}

/// The action for a session defined by the session action ID.
class AssignedSessionAction {
  /// The definition of the assigned session action.
  final AssignedSessionActionDefinition definition;

  /// The session action ID for the assigned session.
  final String sessionActionId;

  AssignedSessionAction({
    required this.definition,
    required this.sessionActionId,
  });

  factory AssignedSessionAction.fromJson(Map<String, dynamic> json) {
    return AssignedSessionAction(
      definition: AssignedSessionActionDefinition.fromJson(
          (json['definition'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      sessionActionId: (json['sessionActionId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final definition = this.definition;
    final sessionActionId = this.sessionActionId;
    return {
      'definition': definition,
      'sessionActionId': sessionActionId,
    };
  }
}

/// The definition of the assigned session action.
class AssignedSessionActionDefinition {
  /// The environment a session starts on.
  final AssignedEnvironmentEnterSessionActionDefinition? envEnter;

  /// The environment a session exits from.
  final AssignedEnvironmentExitSessionActionDefinition? envExit;

  /// The job attachments to sync for the assigned session action.
  final AssignedSyncInputJobAttachmentsSessionActionDefinition?
      syncInputJobAttachments;

  /// The task run.
  final AssignedTaskRunSessionActionDefinition? taskRun;

  AssignedSessionActionDefinition({
    this.envEnter,
    this.envExit,
    this.syncInputJobAttachments,
    this.taskRun,
  });

  factory AssignedSessionActionDefinition.fromJson(Map<String, dynamic> json) {
    return AssignedSessionActionDefinition(
      envEnter: json['envEnter'] != null
          ? AssignedEnvironmentEnterSessionActionDefinition.fromJson(
              json['envEnter'] as Map<String, dynamic>)
          : null,
      envExit: json['envExit'] != null
          ? AssignedEnvironmentExitSessionActionDefinition.fromJson(
              json['envExit'] as Map<String, dynamic>)
          : null,
      syncInputJobAttachments: json['syncInputJobAttachments'] != null
          ? AssignedSyncInputJobAttachmentsSessionActionDefinition.fromJson(
              json['syncInputJobAttachments'] as Map<String, dynamic>)
          : null,
      taskRun: json['taskRun'] != null
          ? AssignedTaskRunSessionActionDefinition.fromJson(
              json['taskRun'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final envEnter = this.envEnter;
    final envExit = this.envExit;
    final syncInputJobAttachments = this.syncInputJobAttachments;
    final taskRun = this.taskRun;
    return {
      if (envEnter != null) 'envEnter': envEnter,
      if (envExit != null) 'envExit': envExit,
      if (syncInputJobAttachments != null)
        'syncInputJobAttachments': syncInputJobAttachments,
      if (taskRun != null) 'taskRun': taskRun,
    };
  }
}

/// The assigned starting environment for a worker during session.
class AssignedEnvironmentEnterSessionActionDefinition {
  /// The environment ID of the assigned environment at the start of a session.
  final String environmentId;

  AssignedEnvironmentEnterSessionActionDefinition({
    required this.environmentId,
  });

  factory AssignedEnvironmentEnterSessionActionDefinition.fromJson(
      Map<String, dynamic> json) {
    return AssignedEnvironmentEnterSessionActionDefinition(
      environmentId: (json['environmentId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final environmentId = this.environmentId;
    return {
      'environmentId': environmentId,
    };
  }
}

/// The assigned environment when a worker exits a session.
class AssignedEnvironmentExitSessionActionDefinition {
  /// The environment ID of the assigned environment when exiting a session.
  final String environmentId;

  AssignedEnvironmentExitSessionActionDefinition({
    required this.environmentId,
  });

  factory AssignedEnvironmentExitSessionActionDefinition.fromJson(
      Map<String, dynamic> json) {
    return AssignedEnvironmentExitSessionActionDefinition(
      environmentId: (json['environmentId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final environmentId = this.environmentId;
    return {
      'environmentId': environmentId,
    };
  }
}

/// The specific task, step, and parameters to include.
class AssignedTaskRunSessionActionDefinition {
  /// The parameters to include.
  final Map<String, TaskParameterValue> parameters;

  /// The step ID.
  final String stepId;

  /// The task ID.
  final String? taskId;

  AssignedTaskRunSessionActionDefinition({
    required this.parameters,
    required this.stepId,
    this.taskId,
  });

  factory AssignedTaskRunSessionActionDefinition.fromJson(
      Map<String, dynamic> json) {
    return AssignedTaskRunSessionActionDefinition(
      parameters: ((json['parameters'] as Map<String, dynamic>?) ??
              const <String, dynamic>{})
          .map((k, e) => MapEntry(
              k, TaskParameterValue.fromJson(e as Map<String, dynamic>))),
      stepId: (json['stepId'] as String?) ?? '',
      taskId: json['taskId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final parameters = this.parameters;
    final stepId = this.stepId;
    final taskId = this.taskId;
    return {
      'parameters': parameters,
      'stepId': stepId,
      if (taskId != null) 'taskId': taskId,
    };
  }
}

/// The assigned session action definition for syncing input job attachments.
class AssignedSyncInputJobAttachmentsSessionActionDefinition {
  /// The step ID for the assigned sync input job attachments session action.
  final String? stepId;

  AssignedSyncInputJobAttachmentsSessionActionDefinition({
    this.stepId,
  });

  factory AssignedSyncInputJobAttachmentsSessionActionDefinition.fromJson(
      Map<String, dynamic> json) {
    return AssignedSyncInputJobAttachmentsSessionActionDefinition(
      stepId: json['stepId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final stepId = this.stepId;
    return {
      if (stepId != null) 'stepId': stepId,
    };
  }
}

/// The updated session action information as it relates to completion and
/// progress of the session.
class UpdatedSessionActionInfo {
  /// The status of the session upon completion.
  final CompletedStatus? completedStatus;

  /// The date and time the resource ended running.
  final DateTime? endedAt;

  /// A list of output manifest properties reported by the worker agent, with each
  /// entry corresponding to a manifest property in the job.
  final List<TaskRunManifestPropertiesRequest>? manifests;

  /// The process exit code. The default Deadline Cloud worker agent converts
  /// unsigned 32-bit exit codes to signed 32-bit exit codes.
  final int? processExitCode;

  /// A message to indicate the progress of the updated session action.
  final String? progressMessage;

  /// The percentage completed.
  final double? progressPercent;

  /// The date and time the resource started running.
  final DateTime? startedAt;

  /// The updated time.
  final DateTime? updatedAt;

  UpdatedSessionActionInfo({
    this.completedStatus,
    this.endedAt,
    this.manifests,
    this.processExitCode,
    this.progressMessage,
    this.progressPercent,
    this.startedAt,
    this.updatedAt,
  });

  Map<String, dynamic> toJson() {
    final completedStatus = this.completedStatus;
    final endedAt = this.endedAt;
    final manifests = this.manifests;
    final processExitCode = this.processExitCode;
    final progressMessage = this.progressMessage;
    final progressPercent = this.progressPercent;
    final startedAt = this.startedAt;
    final updatedAt = this.updatedAt;
    return {
      if (completedStatus != null) 'completedStatus': completedStatus.value,
      if (endedAt != null) 'endedAt': iso8601ToJson(endedAt),
      if (manifests != null) 'manifests': manifests,
      if (processExitCode != null) 'processExitCode': processExitCode,
      if (progressMessage != null) 'progressMessage': progressMessage,
      if (progressPercent != null) 'progressPercent': progressPercent,
      if (startedAt != null) 'startedAt': iso8601ToJson(startedAt),
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

class CompletedStatus {
  static const succeeded = CompletedStatus._('SUCCEEDED');
  static const failed = CompletedStatus._('FAILED');
  static const interrupted = CompletedStatus._('INTERRUPTED');
  static const canceled = CompletedStatus._('CANCELED');
  static const neverAttempted = CompletedStatus._('NEVER_ATTEMPTED');

  final String value;

  const CompletedStatus._(this.value);

  static const values = [
    succeeded,
    failed,
    interrupted,
    canceled,
    neverAttempted
  ];

  static CompletedStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CompletedStatus._(value));

  @override
  bool operator ==(other) => other is CompletedStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The output manifest properties reported by the worker agent for a completed
/// task run.
class TaskRunManifestPropertiesRequest {
  /// The hash value of the file.
  final String? outputManifestHash;

  /// The manifest file path.
  final String? outputManifestPath;

  TaskRunManifestPropertiesRequest({
    this.outputManifestHash,
    this.outputManifestPath,
  });

  Map<String, dynamic> toJson() {
    final outputManifestHash = this.outputManifestHash;
    final outputManifestPath = this.outputManifestPath;
    return {
      if (outputManifestHash != null) 'outputManifestHash': outputManifestHash,
      if (outputManifestPath != null) 'outputManifestPath': outputManifestPath,
    };
  }
}

/// Summarizes the session for a particular worker.
class WorkerSessionSummary {
  /// The job ID for the job associated with the worker's session.
  final String jobId;

  /// The life cycle status for the worker's session.
  final SessionLifecycleStatus lifecycleStatus;

  /// The queue ID for the queue associated to the worker.
  final String queueId;

  /// The session ID for the session action.
  final String sessionId;

  /// The date and time the resource started running.
  final DateTime startedAt;

  /// The date and time the resource ended running.
  final DateTime? endedAt;

  /// The life cycle status
  final SessionLifecycleTargetStatus? targetLifecycleStatus;

  WorkerSessionSummary({
    required this.jobId,
    required this.lifecycleStatus,
    required this.queueId,
    required this.sessionId,
    required this.startedAt,
    this.endedAt,
    this.targetLifecycleStatus,
  });

  factory WorkerSessionSummary.fromJson(Map<String, dynamic> json) {
    return WorkerSessionSummary(
      jobId: (json['jobId'] as String?) ?? '',
      lifecycleStatus: SessionLifecycleStatus.fromString(
          (json['lifecycleStatus'] as String?) ?? ''),
      queueId: (json['queueId'] as String?) ?? '',
      sessionId: (json['sessionId'] as String?) ?? '',
      startedAt: nonNullableTimeStampFromJson(json['startedAt'] ?? 0),
      endedAt: timeStampFromJson(json['endedAt']),
      targetLifecycleStatus: (json['targetLifecycleStatus'] as String?)
          ?.let(SessionLifecycleTargetStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    final lifecycleStatus = this.lifecycleStatus;
    final queueId = this.queueId;
    final sessionId = this.sessionId;
    final startedAt = this.startedAt;
    final endedAt = this.endedAt;
    final targetLifecycleStatus = this.targetLifecycleStatus;
    return {
      'jobId': jobId,
      'lifecycleStatus': lifecycleStatus.value,
      'queueId': queueId,
      'sessionId': sessionId,
      'startedAt': iso8601ToJson(startedAt),
      if (endedAt != null) 'endedAt': iso8601ToJson(endedAt),
      if (targetLifecycleStatus != null)
        'targetLifecycleStatus': targetLifecycleStatus.value,
    };
  }
}

/// The error for the job entity.
class GetJobEntityError {
  /// The environment details for the failed job entity.
  final EnvironmentDetailsError? environmentDetails;

  /// The job attachment details for the failed job entity.
  final JobAttachmentDetailsError? jobAttachmentDetails;

  /// The job details for the failed job entity.
  final JobDetailsError? jobDetails;

  /// The step details for the failed job entity.
  final StepDetailsError? stepDetails;

  GetJobEntityError({
    this.environmentDetails,
    this.jobAttachmentDetails,
    this.jobDetails,
    this.stepDetails,
  });

  factory GetJobEntityError.fromJson(Map<String, dynamic> json) {
    return GetJobEntityError(
      environmentDetails: json['environmentDetails'] != null
          ? EnvironmentDetailsError.fromJson(
              json['environmentDetails'] as Map<String, dynamic>)
          : null,
      jobAttachmentDetails: json['jobAttachmentDetails'] != null
          ? JobAttachmentDetailsError.fromJson(
              json['jobAttachmentDetails'] as Map<String, dynamic>)
          : null,
      jobDetails: json['jobDetails'] != null
          ? JobDetailsError.fromJson(json['jobDetails'] as Map<String, dynamic>)
          : null,
      stepDetails: json['stepDetails'] != null
          ? StepDetailsError.fromJson(
              json['stepDetails'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final environmentDetails = this.environmentDetails;
    final jobAttachmentDetails = this.jobAttachmentDetails;
    final jobDetails = this.jobDetails;
    final stepDetails = this.stepDetails;
    return {
      if (environmentDetails != null) 'environmentDetails': environmentDetails,
      if (jobAttachmentDetails != null)
        'jobAttachmentDetails': jobAttachmentDetails,
      if (jobDetails != null) 'jobDetails': jobDetails,
      if (stepDetails != null) 'stepDetails': stepDetails,
    };
  }
}

/// The details of a job error.
class JobDetailsError {
  /// The error code.
  final JobEntityErrorCode code;

  /// The job ID.
  final String jobId;

  /// The error message detailing the error's cause.
  final String message;

  JobDetailsError({
    required this.code,
    required this.jobId,
    required this.message,
  });

  factory JobDetailsError.fromJson(Map<String, dynamic> json) {
    return JobDetailsError(
      code: JobEntityErrorCode.fromString((json['code'] as String?) ?? ''),
      jobId: (json['jobId'] as String?) ?? '',
      message: (json['message'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final jobId = this.jobId;
    final message = this.message;
    return {
      'code': code.value,
      'jobId': jobId,
      'message': message,
    };
  }
}

/// The error details for job attachments.
class JobAttachmentDetailsError {
  /// The error code.
  final JobEntityErrorCode code;

  /// The job ID.
  final String jobId;

  /// The error message detailing the error's cause.
  final String message;

  JobAttachmentDetailsError({
    required this.code,
    required this.jobId,
    required this.message,
  });

  factory JobAttachmentDetailsError.fromJson(Map<String, dynamic> json) {
    return JobAttachmentDetailsError(
      code: JobEntityErrorCode.fromString((json['code'] as String?) ?? ''),
      jobId: (json['jobId'] as String?) ?? '',
      message: (json['message'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final jobId = this.jobId;
    final message = this.message;
    return {
      'code': code.value,
      'jobId': jobId,
      'message': message,
    };
  }
}

/// The details of the step error.
class StepDetailsError {
  /// The error code.
  final JobEntityErrorCode code;

  /// The job ID.
  final String jobId;

  /// The error message detailing the error's cause.
  final String message;

  /// The step ID.
  final String stepId;

  StepDetailsError({
    required this.code,
    required this.jobId,
    required this.message,
    required this.stepId,
  });

  factory StepDetailsError.fromJson(Map<String, dynamic> json) {
    return StepDetailsError(
      code: JobEntityErrorCode.fromString((json['code'] as String?) ?? ''),
      jobId: (json['jobId'] as String?) ?? '',
      message: (json['message'] as String?) ?? '',
      stepId: (json['stepId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final jobId = this.jobId;
    final message = this.message;
    final stepId = this.stepId;
    return {
      'code': code.value,
      'jobId': jobId,
      'message': message,
      'stepId': stepId,
    };
  }
}

/// The error details for the environment.
class EnvironmentDetailsError {
  /// The error code.
  final JobEntityErrorCode code;

  /// The environment ID.
  final String environmentId;

  /// The job ID.
  final String jobId;

  /// The error message detailing the error's cause.
  final String message;

  EnvironmentDetailsError({
    required this.code,
    required this.environmentId,
    required this.jobId,
    required this.message,
  });

  factory EnvironmentDetailsError.fromJson(Map<String, dynamic> json) {
    return EnvironmentDetailsError(
      code: JobEntityErrorCode.fromString((json['code'] as String?) ?? ''),
      environmentId: (json['environmentId'] as String?) ?? '',
      jobId: (json['jobId'] as String?) ?? '',
      message: (json['message'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final environmentId = this.environmentId;
    final jobId = this.jobId;
    final message = this.message;
    return {
      'code': code.value,
      'environmentId': environmentId,
      'jobId': jobId,
      'message': message,
    };
  }
}

class JobEntityErrorCode {
  static const accessDeniedException =
      JobEntityErrorCode._('AccessDeniedException');
  static const internalServerException =
      JobEntityErrorCode._('InternalServerException');
  static const validationException =
      JobEntityErrorCode._('ValidationException');
  static const resourceNotFoundException =
      JobEntityErrorCode._('ResourceNotFoundException');
  static const maxPayloadSizeExceeded =
      JobEntityErrorCode._('MaxPayloadSizeExceeded');
  static const conflictException = JobEntityErrorCode._('ConflictException');

  final String value;

  const JobEntityErrorCode._(this.value);

  static const values = [
    accessDeniedException,
    internalServerException,
    validationException,
    resourceNotFoundException,
    maxPayloadSizeExceeded,
    conflictException
  ];

  static JobEntityErrorCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => JobEntityErrorCode._(value));

  @override
  bool operator ==(other) =>
      other is JobEntityErrorCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The details of a job entity.
class JobEntity {
  /// The environment details for the job entity.
  final EnvironmentDetailsEntity? environmentDetails;

  /// The job attachment details.
  final JobAttachmentDetailsEntity? jobAttachmentDetails;

  /// The job details.
  final JobDetailsEntity? jobDetails;

  /// The step details.
  final StepDetailsEntity? stepDetails;

  JobEntity({
    this.environmentDetails,
    this.jobAttachmentDetails,
    this.jobDetails,
    this.stepDetails,
  });

  factory JobEntity.fromJson(Map<String, dynamic> json) {
    return JobEntity(
      environmentDetails: json['environmentDetails'] != null
          ? EnvironmentDetailsEntity.fromJson(
              json['environmentDetails'] as Map<String, dynamic>)
          : null,
      jobAttachmentDetails: json['jobAttachmentDetails'] != null
          ? JobAttachmentDetailsEntity.fromJson(
              json['jobAttachmentDetails'] as Map<String, dynamic>)
          : null,
      jobDetails: json['jobDetails'] != null
          ? JobDetailsEntity.fromJson(
              json['jobDetails'] as Map<String, dynamic>)
          : null,
      stepDetails: json['stepDetails'] != null
          ? StepDetailsEntity.fromJson(
              json['stepDetails'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final environmentDetails = this.environmentDetails;
    final jobAttachmentDetails = this.jobAttachmentDetails;
    final jobDetails = this.jobDetails;
    final stepDetails = this.stepDetails;
    return {
      if (environmentDetails != null) 'environmentDetails': environmentDetails,
      if (jobAttachmentDetails != null)
        'jobAttachmentDetails': jobAttachmentDetails,
      if (jobDetails != null) 'jobDetails': jobDetails,
      if (stepDetails != null) 'stepDetails': stepDetails,
    };
  }
}

/// The job details for a specific job.
class JobDetailsEntity {
  /// The job ID.
  final String jobId;

  /// The log group name.
  final String logGroupName;

  /// The schema version.
  final String schemaVersion;

  /// The job attachment settings.
  final JobAttachmentSettings? jobAttachmentSettings;

  /// The user name and group that the job uses when run.
  final JobRunAsUser? jobRunAsUser;

  /// The parameters.
  final Map<String, JobParameter>? parameters;

  /// The path mapping rules.
  final List<PathMappingRule>? pathMappingRules;

  /// The queue role ARN.
  final String? queueRoleArn;

  JobDetailsEntity({
    required this.jobId,
    required this.logGroupName,
    required this.schemaVersion,
    this.jobAttachmentSettings,
    this.jobRunAsUser,
    this.parameters,
    this.pathMappingRules,
    this.queueRoleArn,
  });

  factory JobDetailsEntity.fromJson(Map<String, dynamic> json) {
    return JobDetailsEntity(
      jobId: (json['jobId'] as String?) ?? '',
      logGroupName: (json['logGroupName'] as String?) ?? '',
      schemaVersion: (json['schemaVersion'] as String?) ?? '',
      jobAttachmentSettings: json['jobAttachmentSettings'] != null
          ? JobAttachmentSettings.fromJson(
              json['jobAttachmentSettings'] as Map<String, dynamic>)
          : null,
      jobRunAsUser: json['jobRunAsUser'] != null
          ? JobRunAsUser.fromJson(json['jobRunAsUser'] as Map<String, dynamic>)
          : null,
      parameters: (json['parameters'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, JobParameter.fromJson(e as Map<String, dynamic>))),
      pathMappingRules: (json['pathMappingRules'] as List?)
          ?.nonNulls
          .map((e) => PathMappingRule.fromJson(e as Map<String, dynamic>))
          .toList(),
      queueRoleArn: json['queueRoleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    final logGroupName = this.logGroupName;
    final schemaVersion = this.schemaVersion;
    final jobAttachmentSettings = this.jobAttachmentSettings;
    final jobRunAsUser = this.jobRunAsUser;
    final parameters = this.parameters;
    final pathMappingRules = this.pathMappingRules;
    final queueRoleArn = this.queueRoleArn;
    return {
      'jobId': jobId,
      'logGroupName': logGroupName,
      'schemaVersion': schemaVersion,
      if (jobAttachmentSettings != null)
        'jobAttachmentSettings': jobAttachmentSettings,
      if (jobRunAsUser != null) 'jobRunAsUser': jobRunAsUser,
      if (parameters != null) 'parameters': parameters,
      if (pathMappingRules != null) 'pathMappingRules': pathMappingRules,
      if (queueRoleArn != null) 'queueRoleArn': queueRoleArn,
    };
  }
}

/// The job attachments.
class JobAttachmentDetailsEntity {
  /// The job attachments.
  final Attachments attachments;

  /// The job ID.
  final String jobId;

  JobAttachmentDetailsEntity({
    required this.attachments,
    required this.jobId,
  });

  factory JobAttachmentDetailsEntity.fromJson(Map<String, dynamic> json) {
    return JobAttachmentDetailsEntity(
      attachments: Attachments.fromJson(
          (json['attachments'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      jobId: (json['jobId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final attachments = this.attachments;
    final jobId = this.jobId;
    return {
      'attachments': attachments,
      'jobId': jobId,
    };
  }
}

/// The details of a step entity.
class StepDetailsEntity {
  /// The dependencies for a step.
  final List<String> dependencies;

  /// The job ID.
  final String jobId;

  /// The schema version for a step template.
  final String schemaVersion;

  /// The step ID.
  final String stepId;

  /// The template for a step.
  final Object template;

  StepDetailsEntity({
    required this.dependencies,
    required this.jobId,
    required this.schemaVersion,
    required this.stepId,
    required this.template,
  });

  factory StepDetailsEntity.fromJson(Map<String, dynamic> json) {
    return StepDetailsEntity(
      dependencies: ((json['dependencies'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      jobId: (json['jobId'] as String?) ?? '',
      schemaVersion: (json['schemaVersion'] as String?) ?? '',
      stepId: (json['stepId'] as String?) ?? '',
      template: json['template'] as Object,
    );
  }

  Map<String, dynamic> toJson() {
    final dependencies = this.dependencies;
    final jobId = this.jobId;
    final schemaVersion = this.schemaVersion;
    final stepId = this.stepId;
    final template = this.template;
    return {
      'dependencies': dependencies,
      'jobId': jobId,
      'schemaVersion': schemaVersion,
      'stepId': stepId,
      'template': template,
    };
  }
}

/// The details of a specified environment.
class EnvironmentDetailsEntity {
  /// The environment ID.
  final String environmentId;

  /// The job ID.
  final String jobId;

  /// The schema version in the environment.
  final String schemaVersion;

  /// The template used for the environment.
  final Object template;

  EnvironmentDetailsEntity({
    required this.environmentId,
    required this.jobId,
    required this.schemaVersion,
    required this.template,
  });

  factory EnvironmentDetailsEntity.fromJson(Map<String, dynamic> json) {
    return EnvironmentDetailsEntity(
      environmentId: (json['environmentId'] as String?) ?? '',
      jobId: (json['jobId'] as String?) ?? '',
      schemaVersion: (json['schemaVersion'] as String?) ?? '',
      template: json['template'] as Object,
    );
  }

  Map<String, dynamic> toJson() {
    final environmentId = this.environmentId;
    final jobId = this.jobId;
    final schemaVersion = this.schemaVersion;
    final template = this.template;
    return {
      'environmentId': environmentId,
      'jobId': jobId,
      'schemaVersion': schemaVersion,
      'template': template,
    };
  }
}

/// The details of a source and destination path.
class PathMappingRule {
  /// The destination path.
  final String destinationPath;

  /// The source path.
  final String sourcePath;

  /// The source path format.
  final PathFormat sourcePathFormat;

  PathMappingRule({
    required this.destinationPath,
    required this.sourcePath,
    required this.sourcePathFormat,
  });

  factory PathMappingRule.fromJson(Map<String, dynamic> json) {
    return PathMappingRule(
      destinationPath: (json['destinationPath'] as String?) ?? '',
      sourcePath: (json['sourcePath'] as String?) ?? '',
      sourcePathFormat:
          PathFormat.fromString((json['sourcePathFormat'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final destinationPath = this.destinationPath;
    final sourcePath = this.sourcePath;
    final sourcePathFormat = this.sourcePathFormat;
    return {
      'destinationPath': destinationPath,
      'sourcePath': sourcePath,
      'sourcePathFormat': sourcePathFormat.value,
    };
  }
}

/// The details of a job entity identifier.
class JobEntityIdentifiersUnion {
  /// The environment details.
  final EnvironmentDetailsIdentifiers? environmentDetails;

  /// The job attachment details.
  final JobAttachmentDetailsIdentifiers? jobAttachmentDetails;

  /// The job details.
  final JobDetailsIdentifiers? jobDetails;

  /// The step details.
  final StepDetailsIdentifiers? stepDetails;

  JobEntityIdentifiersUnion({
    this.environmentDetails,
    this.jobAttachmentDetails,
    this.jobDetails,
    this.stepDetails,
  });

  Map<String, dynamic> toJson() {
    final environmentDetails = this.environmentDetails;
    final jobAttachmentDetails = this.jobAttachmentDetails;
    final jobDetails = this.jobDetails;
    final stepDetails = this.stepDetails;
    return {
      if (environmentDetails != null) 'environmentDetails': environmentDetails,
      if (jobAttachmentDetails != null)
        'jobAttachmentDetails': jobAttachmentDetails,
      if (jobDetails != null) 'jobDetails': jobDetails,
      if (stepDetails != null) 'stepDetails': stepDetails,
    };
  }
}

/// The identifiers for a job.
class JobDetailsIdentifiers {
  /// The job ID.
  final String jobId;

  JobDetailsIdentifiers({
    required this.jobId,
  });

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    return {
      'jobId': jobId,
    };
  }
}

/// Identifier details for job attachments.
class JobAttachmentDetailsIdentifiers {
  /// The job ID.
  final String jobId;

  JobAttachmentDetailsIdentifiers({
    required this.jobId,
  });

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    return {
      'jobId': jobId,
    };
  }
}

/// The details of identifiers for a step.
class StepDetailsIdentifiers {
  /// The job ID.
  final String jobId;

  /// The step ID.
  final String stepId;

  StepDetailsIdentifiers({
    required this.jobId,
    required this.stepId,
  });

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    final stepId = this.stepId;
    return {
      'jobId': jobId,
      'stepId': stepId,
    };
  }
}

/// The IDs of the job and environment.
class EnvironmentDetailsIdentifiers {
  /// The environment ID.
  final String environmentId;

  /// The job ID.
  final String jobId;

  EnvironmentDetailsIdentifiers({
    required this.environmentId,
    required this.jobId,
  });

  Map<String, dynamic> toJson() {
    final environmentId = this.environmentId;
    final jobId = this.jobId;
    return {
      'environmentId': environmentId,
      'jobId': jobId,
    };
  }
}

/// The summary of details for a worker.
class WorkerSummary {
  /// The date and time the resource was created.
  final DateTime createdAt;

  /// The user or system that created this resource.
  final String createdBy;

  /// The farm ID.
  final String farmId;

  /// The fleet ID.
  final String fleetId;

  /// The status of the worker.
  final WorkerStatus status;

  /// The worker ID.
  final String workerId;

  /// The host properties of the worker.
  final HostPropertiesResponse? hostProperties;

  /// The log configuration for the worker.
  final LogConfiguration? log;

  /// The date and time the resource was updated.
  final DateTime? updatedAt;

  /// The user or system that updated this resource.
  final String? updatedBy;

  WorkerSummary({
    required this.createdAt,
    required this.createdBy,
    required this.farmId,
    required this.fleetId,
    required this.status,
    required this.workerId,
    this.hostProperties,
    this.log,
    this.updatedAt,
    this.updatedBy,
  });

  factory WorkerSummary.fromJson(Map<String, dynamic> json) {
    return WorkerSummary(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      createdBy: (json['createdBy'] as String?) ?? '',
      farmId: (json['farmId'] as String?) ?? '',
      fleetId: (json['fleetId'] as String?) ?? '',
      status: WorkerStatus.fromString((json['status'] as String?) ?? ''),
      workerId: (json['workerId'] as String?) ?? '',
      hostProperties: json['hostProperties'] != null
          ? HostPropertiesResponse.fromJson(
              json['hostProperties'] as Map<String, dynamic>)
          : null,
      log: json['log'] != null
          ? LogConfiguration.fromJson(json['log'] as Map<String, dynamic>)
          : null,
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final farmId = this.farmId;
    final fleetId = this.fleetId;
    final status = this.status;
    final workerId = this.workerId;
    final hostProperties = this.hostProperties;
    final log = this.log;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'createdBy': createdBy,
      'farmId': farmId,
      'fleetId': fleetId,
      'status': status.value,
      'workerId': workerId,
      if (hostProperties != null) 'hostProperties': hostProperties,
      if (log != null) 'log': log,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

class WorkerStatus {
  static const created = WorkerStatus._('CREATED');
  static const started = WorkerStatus._('STARTED');
  static const stopping = WorkerStatus._('STOPPING');
  static const stopped = WorkerStatus._('STOPPED');
  static const notResponding = WorkerStatus._('NOT_RESPONDING');
  static const notCompatible = WorkerStatus._('NOT_COMPATIBLE');
  static const running = WorkerStatus._('RUNNING');
  static const idle = WorkerStatus._('IDLE');

  final String value;

  const WorkerStatus._(this.value);

  static const values = [
    created,
    started,
    stopping,
    stopped,
    notResponding,
    notCompatible,
    running,
    idle
  ];

  static WorkerStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => WorkerStatus._(value));

  @override
  bool operator ==(other) => other is WorkerStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Provides a script that runs as a worker is starting up that you can use to
/// provide additional configuration for workers in your fleet.
///
/// To remove a script from a fleet, use the <a
/// href="https://docs.aws.amazon.com/deadline-cloud/latest/APIReference/API_UpdateFleet.html">UpdateFleet</a>
/// operation with the <code>hostConfiguration</code> <code>scriptBody</code>
/// parameter set to an empty string ("").
class HostConfiguration {
  /// The text of the script that runs as a worker is starting up that you can use
  /// to provide additional configuration for workers in your fleet. The script
  /// runs after a worker enters the <code>STARTING</code> state and before the
  /// worker processes tasks.
  ///
  /// For more information about using the script, see <a
  /// href="https://docs.aws.amazon.com/deadline-cloud/latest/developerguide/smf-admin.html">Run
  /// scripts as an administrator to configure workers</a> in the <i>Deadline
  /// Cloud Developer Guide</i>.
  /// <important>
  /// The script runs as an administrative user (<code>sudo root</code> on Linux,
  /// as an Administrator on Windows).
  /// </important>
  final String scriptBody;

  /// The maximum time that the host configuration can run. If the timeout
  /// expires, the worker enters the <code>NOT RESPONDING</code> state and shuts
  /// down. You are charged for the time that the worker is running the host
  /// configuration script.
  /// <note>
  /// You should configure your fleet for a maximum of one worker while testing
  /// your host configuration script to avoid starting additional workers.
  /// </note>
  /// The default is 300 seconds (5 minutes).
  final int? scriptTimeoutSeconds;

  HostConfiguration({
    required this.scriptBody,
    this.scriptTimeoutSeconds,
  });

  factory HostConfiguration.fromJson(Map<String, dynamic> json) {
    return HostConfiguration(
      scriptBody: (json['scriptBody'] as String?) ?? '',
      scriptTimeoutSeconds: json['scriptTimeoutSeconds'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final scriptBody = this.scriptBody;
    final scriptTimeoutSeconds = this.scriptTimeoutSeconds;
    return {
      'scriptBody': scriptBody,
      if (scriptTimeoutSeconds != null)
        'scriptTimeoutSeconds': scriptTimeoutSeconds,
    };
  }
}

class UpdatedWorkerStatus {
  static const started = UpdatedWorkerStatus._('STARTED');
  static const stopping = UpdatedWorkerStatus._('STOPPING');
  static const stopped = UpdatedWorkerStatus._('STOPPED');

  final String value;

  const UpdatedWorkerStatus._(this.value);

  static const values = [started, stopping, stopped];

  static UpdatedWorkerStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => UpdatedWorkerStatus._(value));

  @override
  bool operator ==(other) =>
      other is UpdatedWorkerStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The details for worker capabilities.
class WorkerCapabilities {
  /// The worker capabilities amounts on a list of worker capabilities.
  final List<WorkerAmountCapability> amounts;

  /// The worker attribute capabilities in the list of attribute capabilities.
  final List<WorkerAttributeCapability> attributes;

  WorkerCapabilities({
    required this.amounts,
    required this.attributes,
  });

  Map<String, dynamic> toJson() {
    final amounts = this.amounts;
    final attributes = this.attributes;
    return {
      'amounts': amounts,
      'attributes': attributes,
    };
  }
}

/// The host property details.
class HostPropertiesRequest {
  /// The host name.
  final String? hostName;

  /// The IP address of the host.
  final IpAddresses? ipAddresses;

  HostPropertiesRequest({
    this.hostName,
    this.ipAddresses,
  });

  Map<String, dynamic> toJson() {
    final hostName = this.hostName;
    final ipAddresses = this.ipAddresses;
    return {
      if (hostName != null) 'hostName': hostName,
      if (ipAddresses != null) 'ipAddresses': ipAddresses,
    };
  }
}

/// The details of the worker attribute capability.
class WorkerAttributeCapability {
  /// The name of the worker attribute capability.
  final String name;

  /// The values of the worker amount capability.
  final List<String> values;

  WorkerAttributeCapability({
    required this.name,
    required this.values,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      'name': name,
      'values': values,
    };
  }
}

/// The details of the worker amount capability.
class WorkerAmountCapability {
  /// The name of the worker amount capability.
  final String name;

  /// The value of the worker amount capability.
  final double value;

  WorkerAmountCapability({
    required this.name,
    required this.value,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      'name': name,
      'value': value,
    };
  }
}

/// The summary of a persistent volume.
class VolumeSummary {
  /// The Availability Zone ID of the volume.
  final String availabilityZoneId;

  /// The farm ID of the farm that contains the fleet.
  final String farmId;

  /// The fleet ID of the fleet that contains the volume.
  final String fleetId;

  /// The volume size in GiB.
  final int sizeGiB;

  /// The state of the volume.
  final VolumeState state;

  /// The volume ID.
  final String volumeId;

  /// The worker ID of the worker the volume is attached to.
  final String? attachedWorkerId;

  VolumeSummary({
    required this.availabilityZoneId,
    required this.farmId,
    required this.fleetId,
    required this.sizeGiB,
    required this.state,
    required this.volumeId,
    this.attachedWorkerId,
  });

  factory VolumeSummary.fromJson(Map<String, dynamic> json) {
    return VolumeSummary(
      availabilityZoneId: (json['availabilityZoneId'] as String?) ?? '',
      farmId: (json['farmId'] as String?) ?? '',
      fleetId: (json['fleetId'] as String?) ?? '',
      sizeGiB: (json['sizeGiB'] as int?) ?? 0,
      state: VolumeState.fromString((json['state'] as String?) ?? ''),
      volumeId: (json['volumeId'] as String?) ?? '',
      attachedWorkerId: json['attachedWorkerId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final availabilityZoneId = this.availabilityZoneId;
    final farmId = this.farmId;
    final fleetId = this.fleetId;
    final sizeGiB = this.sizeGiB;
    final state = this.state;
    final volumeId = this.volumeId;
    final attachedWorkerId = this.attachedWorkerId;
    return {
      'availabilityZoneId': availabilityZoneId,
      'farmId': farmId,
      'fleetId': fleetId,
      'sizeGiB': sizeGiB,
      'state': state.value,
      'volumeId': volumeId,
      if (attachedWorkerId != null) 'attachedWorkerId': attachedWorkerId,
    };
  }
}

/// The state of a persistent volume.
class VolumeState {
  static const pendingCreation = VolumeState._('PENDING_CREATION');
  static const pendingAttachment = VolumeState._('PENDING_ATTACHMENT');
  static const inUse = VolumeState._('IN_USE');
  static const available = VolumeState._('AVAILABLE');
  static const pendingDeletion = VolumeState._('PENDING_DELETION');

  final String value;

  const VolumeState._(this.value);

  static const values = [
    pendingCreation,
    pendingAttachment,
    inUse,
    available,
    pendingDeletion
  ];

  static VolumeState fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => VolumeState._(value));

  @override
  bool operator ==(other) => other is VolumeState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The EBS volume type.
class EbsVolumeType {
  static const gp3 = EbsVolumeType._('gp3');

  final String value;

  const EbsVolumeType._(this.value);

  static const values = [gp3];

  static EbsVolumeType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EbsVolumeType._(value));

  @override
  bool operator ==(other) => other is EbsVolumeType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The fleet member.
class FleetMember {
  /// The farm ID.
  final String farmId;

  /// The fleet ID.
  final String fleetId;

  /// The identity store ID.
  final String identityStoreId;

  /// The fleet member's membership level.
  final MembershipLevel membershipLevel;

  /// The principal ID of the fleet member.
  final String principalId;

  /// The principal type of the fleet member.
  final DeadlinePrincipalType principalType;

  FleetMember({
    required this.farmId,
    required this.fleetId,
    required this.identityStoreId,
    required this.membershipLevel,
    required this.principalId,
    required this.principalType,
  });

  factory FleetMember.fromJson(Map<String, dynamic> json) {
    return FleetMember(
      farmId: (json['farmId'] as String?) ?? '',
      fleetId: (json['fleetId'] as String?) ?? '',
      identityStoreId: (json['identityStoreId'] as String?) ?? '',
      membershipLevel: MembershipLevel.fromString(
          (json['membershipLevel'] as String?) ?? ''),
      principalId: (json['principalId'] as String?) ?? '',
      principalType: DeadlinePrincipalType.fromString(
          (json['principalType'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final farmId = this.farmId;
    final fleetId = this.fleetId;
    final identityStoreId = this.identityStoreId;
    final membershipLevel = this.membershipLevel;
    final principalId = this.principalId;
    final principalType = this.principalType;
    return {
      'farmId': farmId,
      'fleetId': fleetId,
      'identityStoreId': identityStoreId,
      'membershipLevel': membershipLevel.value,
      'principalId': principalId,
      'principalType': principalType.value,
    };
  }
}

/// The details of a fleet.
class FleetSummary {
  /// The configuration details for the fleet.
  final FleetConfiguration configuration;

  /// The date and time the resource was created.
  final DateTime createdAt;

  /// The user or system that created this resource.
  final String createdBy;

  /// The display name of the fleet summary to update.
  /// <important>
  /// This field can store any content. Escape or encode this content before
  /// displaying it on a webpage or any other system that might interpret the
  /// content of this field.
  /// </important>
  final String displayName;

  /// The farm ID.
  final String farmId;

  /// The fleet ID.
  final String fleetId;

  /// The maximum number of workers specified in the fleet.
  final int maxWorkerCount;

  /// The minimum number of workers in the fleet.
  final int minWorkerCount;

  /// The status of the fleet.
  final FleetStatus status;

  /// The number of workers in the fleet summary.
  final int workerCount;

  /// The Auto Scaling status of a fleet.
  final AutoScalingStatus? autoScalingStatus;

  /// A message that communicates a suspended status of the fleet.
  final String? statusMessage;

  /// The target number of workers in a fleet.
  final int? targetWorkerCount;

  /// The date and time the resource was updated.
  final DateTime? updatedAt;

  /// The user or system that updated this resource.
  final String? updatedBy;

  FleetSummary({
    required this.configuration,
    required this.createdAt,
    required this.createdBy,
    required this.displayName,
    required this.farmId,
    required this.fleetId,
    required this.maxWorkerCount,
    required this.minWorkerCount,
    required this.status,
    required this.workerCount,
    this.autoScalingStatus,
    this.statusMessage,
    this.targetWorkerCount,
    this.updatedAt,
    this.updatedBy,
  });

  factory FleetSummary.fromJson(Map<String, dynamic> json) {
    return FleetSummary(
      configuration: FleetConfiguration.fromJson(
          (json['configuration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      createdBy: (json['createdBy'] as String?) ?? '',
      displayName: (json['displayName'] as String?) ?? '',
      farmId: (json['farmId'] as String?) ?? '',
      fleetId: (json['fleetId'] as String?) ?? '',
      maxWorkerCount: (json['maxWorkerCount'] as int?) ?? 0,
      minWorkerCount: (json['minWorkerCount'] as int?) ?? 0,
      status: FleetStatus.fromString((json['status'] as String?) ?? ''),
      workerCount: (json['workerCount'] as int?) ?? 0,
      autoScalingStatus: (json['autoScalingStatus'] as String?)
          ?.let(AutoScalingStatus.fromString),
      statusMessage: json['statusMessage'] as String?,
      targetWorkerCount: json['targetWorkerCount'] as int?,
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final displayName = this.displayName;
    final farmId = this.farmId;
    final fleetId = this.fleetId;
    final maxWorkerCount = this.maxWorkerCount;
    final minWorkerCount = this.minWorkerCount;
    final status = this.status;
    final workerCount = this.workerCount;
    final autoScalingStatus = this.autoScalingStatus;
    final statusMessage = this.statusMessage;
    final targetWorkerCount = this.targetWorkerCount;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      'configuration': configuration,
      'createdAt': iso8601ToJson(createdAt),
      'createdBy': createdBy,
      'displayName': displayName,
      'farmId': farmId,
      'fleetId': fleetId,
      'maxWorkerCount': maxWorkerCount,
      'minWorkerCount': minWorkerCount,
      'status': status.value,
      'workerCount': workerCount,
      if (autoScalingStatus != null)
        'autoScalingStatus': autoScalingStatus.value,
      if (statusMessage != null) 'statusMessage': statusMessage,
      if (targetWorkerCount != null) 'targetWorkerCount': targetWorkerCount,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

class FleetStatus {
  static const active = FleetStatus._('ACTIVE');
  static const createInProgress = FleetStatus._('CREATE_IN_PROGRESS');
  static const updateInProgress = FleetStatus._('UPDATE_IN_PROGRESS');
  static const createFailed = FleetStatus._('CREATE_FAILED');
  static const updateFailed = FleetStatus._('UPDATE_FAILED');
  static const suspended = FleetStatus._('SUSPENDED');

  final String value;

  const FleetStatus._(this.value);

  static const values = [
    active,
    createInProgress,
    updateInProgress,
    createFailed,
    updateFailed,
    suspended
  ];

  static FleetStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => FleetStatus._(value));

  @override
  bool operator ==(other) => other is FleetStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class AutoScalingStatus {
  static const growing = AutoScalingStatus._('GROWING');
  static const steady = AutoScalingStatus._('STEADY');
  static const shrinking = AutoScalingStatus._('SHRINKING');

  final String value;

  const AutoScalingStatus._(this.value);

  static const values = [growing, steady, shrinking];

  static AutoScalingStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AutoScalingStatus._(value));

  @override
  bool operator ==(other) => other is AutoScalingStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Fleet configuration details.
class FleetConfiguration {
  /// The customer managed fleets within a fleet configuration.
  final CustomerManagedFleetConfiguration? customerManaged;

  /// The service managed Amazon EC2 instances for a fleet configuration.
  final ServiceManagedEc2FleetConfiguration? serviceManagedEc2;

  FleetConfiguration({
    this.customerManaged,
    this.serviceManagedEc2,
  });

  factory FleetConfiguration.fromJson(Map<String, dynamic> json) {
    return FleetConfiguration(
      customerManaged: json['customerManaged'] != null
          ? CustomerManagedFleetConfiguration.fromJson(
              json['customerManaged'] as Map<String, dynamic>)
          : null,
      serviceManagedEc2: json['serviceManagedEc2'] != null
          ? ServiceManagedEc2FleetConfiguration.fromJson(
              json['serviceManagedEc2'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final customerManaged = this.customerManaged;
    final serviceManagedEc2 = this.serviceManagedEc2;
    return {
      if (customerManaged != null) 'customerManaged': customerManaged,
      if (serviceManagedEc2 != null) 'serviceManagedEc2': serviceManagedEc2,
    };
  }
}

/// The configuration details for a customer managed fleet.
class CustomerManagedFleetConfiguration {
  /// The Auto Scaling mode for the customer managed fleet.
  final AutoScalingMode mode;

  /// The worker capabilities for the customer managed fleet.
  final CustomerManagedWorkerCapabilities workerCapabilities;

  /// The auto scaling configuration settings for the customer managed fleet.
  final CustomerManagedAutoScalingConfiguration? autoScalingConfiguration;

  /// The storage profile ID for the customer managed fleet.
  final String? storageProfileId;

  /// The tag propagation mode for the customer managed fleet.
  final TagPropagationMode? tagPropagationMode;

  CustomerManagedFleetConfiguration({
    required this.mode,
    required this.workerCapabilities,
    this.autoScalingConfiguration,
    this.storageProfileId,
    this.tagPropagationMode,
  });

  factory CustomerManagedFleetConfiguration.fromJson(
      Map<String, dynamic> json) {
    return CustomerManagedFleetConfiguration(
      mode: AutoScalingMode.fromString((json['mode'] as String?) ?? ''),
      workerCapabilities: CustomerManagedWorkerCapabilities.fromJson(
          (json['workerCapabilities'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      autoScalingConfiguration: json['autoScalingConfiguration'] != null
          ? CustomerManagedAutoScalingConfiguration.fromJson(
              json['autoScalingConfiguration'] as Map<String, dynamic>)
          : null,
      storageProfileId: json['storageProfileId'] as String?,
      tagPropagationMode: (json['tagPropagationMode'] as String?)
          ?.let(TagPropagationMode.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final mode = this.mode;
    final workerCapabilities = this.workerCapabilities;
    final autoScalingConfiguration = this.autoScalingConfiguration;
    final storageProfileId = this.storageProfileId;
    final tagPropagationMode = this.tagPropagationMode;
    return {
      'mode': mode.value,
      'workerCapabilities': workerCapabilities,
      if (autoScalingConfiguration != null)
        'autoScalingConfiguration': autoScalingConfiguration,
      if (storageProfileId != null) 'storageProfileId': storageProfileId,
      if (tagPropagationMode != null)
        'tagPropagationMode': tagPropagationMode.value,
    };
  }
}

/// The configuration details for a service managed EC2 fleet.
class ServiceManagedEc2FleetConfiguration {
  /// The instance capabilities for the service managed EC2 fleet.
  final ServiceManagedEc2InstanceCapabilities instanceCapabilities;

  /// The instance market options for the service managed EC2 fleet.
  final ServiceManagedEc2InstanceMarketOptions instanceMarketOptions;

  /// The auto scaling configuration settings for the service managed EC2 fleet.
  final ServiceManagedEc2AutoScalingConfiguration? autoScalingConfiguration;

  /// The persistent volume configuration for the service managed EC2 fleet.
  final PersistentVolumeConfiguration? persistentVolumeConfiguration;

  /// The storage profile ID for the service managed EC2 fleet.
  final String? storageProfileId;

  /// The VPC configuration for the service managed EC2 fleet.
  final VpcConfiguration? vpcConfiguration;

  ServiceManagedEc2FleetConfiguration({
    required this.instanceCapabilities,
    required this.instanceMarketOptions,
    this.autoScalingConfiguration,
    this.persistentVolumeConfiguration,
    this.storageProfileId,
    this.vpcConfiguration,
  });

  factory ServiceManagedEc2FleetConfiguration.fromJson(
      Map<String, dynamic> json) {
    return ServiceManagedEc2FleetConfiguration(
      instanceCapabilities: ServiceManagedEc2InstanceCapabilities.fromJson(
          (json['instanceCapabilities'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      instanceMarketOptions: ServiceManagedEc2InstanceMarketOptions.fromJson(
          (json['instanceMarketOptions'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      autoScalingConfiguration: json['autoScalingConfiguration'] != null
          ? ServiceManagedEc2AutoScalingConfiguration.fromJson(
              json['autoScalingConfiguration'] as Map<String, dynamic>)
          : null,
      persistentVolumeConfiguration:
          json['persistentVolumeConfiguration'] != null
              ? PersistentVolumeConfiguration.fromJson(
                  json['persistentVolumeConfiguration'] as Map<String, dynamic>)
              : null,
      storageProfileId: json['storageProfileId'] as String?,
      vpcConfiguration: json['vpcConfiguration'] != null
          ? VpcConfiguration.fromJson(
              json['vpcConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final instanceCapabilities = this.instanceCapabilities;
    final instanceMarketOptions = this.instanceMarketOptions;
    final autoScalingConfiguration = this.autoScalingConfiguration;
    final persistentVolumeConfiguration = this.persistentVolumeConfiguration;
    final storageProfileId = this.storageProfileId;
    final vpcConfiguration = this.vpcConfiguration;
    return {
      'instanceCapabilities': instanceCapabilities,
      'instanceMarketOptions': instanceMarketOptions,
      if (autoScalingConfiguration != null)
        'autoScalingConfiguration': autoScalingConfiguration,
      if (persistentVolumeConfiguration != null)
        'persistentVolumeConfiguration': persistentVolumeConfiguration,
      if (storageProfileId != null) 'storageProfileId': storageProfileId,
      if (vpcConfiguration != null) 'vpcConfiguration': vpcConfiguration,
    };
  }
}

/// The Amazon EC2 instance capabilities.
class ServiceManagedEc2InstanceCapabilities {
  /// The CPU architecture type.
  final CpuArchitectureType cpuArchitectureType;

  /// The memory, as MiB, for the Amazon EC2 instance type.
  final MemoryMiBRange memoryMiB;

  /// The operating system (OS) family.
  final ServiceManagedFleetOperatingSystemFamily osFamily;

  /// The amount of vCPU to require for instances in this fleet.
  final VCpuCountRange vCpuCount;

  /// Describes the GPU accelerator capabilities required for worker host
  /// instances in this fleet.
  final AcceleratorCapabilities? acceleratorCapabilities;

  /// The allowable Amazon EC2 instance types.
  final List<String>? allowedInstanceTypes;

  /// The custom capability amounts to require for instances in this fleet.
  final List<FleetAmountCapability>? customAmounts;

  /// The custom capability attributes to require for instances in this fleet.
  final List<FleetAttributeCapability>? customAttributes;

  /// The instance types to exclude from the fleet.
  final List<String>? excludedInstanceTypes;

  /// The root EBS volume.
  final Ec2EbsVolume? rootEbsVolume;

  ServiceManagedEc2InstanceCapabilities({
    required this.cpuArchitectureType,
    required this.memoryMiB,
    required this.osFamily,
    required this.vCpuCount,
    this.acceleratorCapabilities,
    this.allowedInstanceTypes,
    this.customAmounts,
    this.customAttributes,
    this.excludedInstanceTypes,
    this.rootEbsVolume,
  });

  factory ServiceManagedEc2InstanceCapabilities.fromJson(
      Map<String, dynamic> json) {
    return ServiceManagedEc2InstanceCapabilities(
      cpuArchitectureType: CpuArchitectureType.fromString(
          (json['cpuArchitectureType'] as String?) ?? ''),
      memoryMiB: MemoryMiBRange.fromJson(
          (json['memoryMiB'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      osFamily: ServiceManagedFleetOperatingSystemFamily.fromString(
          (json['osFamily'] as String?) ?? ''),
      vCpuCount: VCpuCountRange.fromJson(
          (json['vCpuCount'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      acceleratorCapabilities: json['acceleratorCapabilities'] != null
          ? AcceleratorCapabilities.fromJson(
              json['acceleratorCapabilities'] as Map<String, dynamic>)
          : null,
      allowedInstanceTypes: (json['allowedInstanceTypes'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      customAmounts: (json['customAmounts'] as List?)
          ?.nonNulls
          .map((e) => FleetAmountCapability.fromJson(e as Map<String, dynamic>))
          .toList(),
      customAttributes: (json['customAttributes'] as List?)
          ?.nonNulls
          .map((e) =>
              FleetAttributeCapability.fromJson(e as Map<String, dynamic>))
          .toList(),
      excludedInstanceTypes: (json['excludedInstanceTypes'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      rootEbsVolume: json['rootEbsVolume'] != null
          ? Ec2EbsVolume.fromJson(json['rootEbsVolume'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final cpuArchitectureType = this.cpuArchitectureType;
    final memoryMiB = this.memoryMiB;
    final osFamily = this.osFamily;
    final vCpuCount = this.vCpuCount;
    final acceleratorCapabilities = this.acceleratorCapabilities;
    final allowedInstanceTypes = this.allowedInstanceTypes;
    final customAmounts = this.customAmounts;
    final customAttributes = this.customAttributes;
    final excludedInstanceTypes = this.excludedInstanceTypes;
    final rootEbsVolume = this.rootEbsVolume;
    return {
      'cpuArchitectureType': cpuArchitectureType.value,
      'memoryMiB': memoryMiB,
      'osFamily': osFamily.value,
      'vCpuCount': vCpuCount,
      if (acceleratorCapabilities != null)
        'acceleratorCapabilities': acceleratorCapabilities,
      if (allowedInstanceTypes != null)
        'allowedInstanceTypes': allowedInstanceTypes,
      if (customAmounts != null) 'customAmounts': customAmounts,
      if (customAttributes != null) 'customAttributes': customAttributes,
      if (excludedInstanceTypes != null)
        'excludedInstanceTypes': excludedInstanceTypes,
      if (rootEbsVolume != null) 'rootEbsVolume': rootEbsVolume,
    };
  }
}

/// The details of the Amazon EC2 instance market options for a service managed
/// fleet.
class ServiceManagedEc2InstanceMarketOptions {
  /// The Amazon EC2 instance type.
  final Ec2MarketType type;

  ServiceManagedEc2InstanceMarketOptions({
    required this.type,
  });

  factory ServiceManagedEc2InstanceMarketOptions.fromJson(
      Map<String, dynamic> json) {
    return ServiceManagedEc2InstanceMarketOptions(
      type: Ec2MarketType.fromString((json['type'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    return {
      'type': type.value,
    };
  }
}

/// The configuration options for a service managed fleet's VPC.
class VpcConfiguration {
  /// The ARNs of the VPC Lattice resource configurations attached to the fleet.
  final List<String>? resourceConfigurationArns;

  VpcConfiguration({
    this.resourceConfigurationArns,
  });

  factory VpcConfiguration.fromJson(Map<String, dynamic> json) {
    return VpcConfiguration(
      resourceConfigurationArns: (json['resourceConfigurationArns'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final resourceConfigurationArns = this.resourceConfigurationArns;
    return {
      if (resourceConfigurationArns != null)
        'resourceConfigurationArns': resourceConfigurationArns,
    };
  }
}

/// Specifies the persistent EBS volume configuration for workers in a service
/// managed fleet.
class PersistentVolumeConfiguration {
  /// The file system path where the persistent volume is mounted on the worker
  /// instance.
  final String mountPath;

  /// The IOPS per persistent volume. The default is 3000.
  final int? iops;

  /// The number of hours a persistent volume can remain unused before it is
  /// deleted. The default is 168 (7 days).
  final int? lastUsedTtlHours;

  /// The persistent volume size in GiB. The default is 250.
  final int? sizeGiB;

  /// The throughput per persistent volume in MiB. The default is 125.
  final int? throughputMiB;

  PersistentVolumeConfiguration({
    required this.mountPath,
    this.iops,
    this.lastUsedTtlHours,
    this.sizeGiB,
    this.throughputMiB,
  });

  factory PersistentVolumeConfiguration.fromJson(Map<String, dynamic> json) {
    return PersistentVolumeConfiguration(
      mountPath: (json['mountPath'] as String?) ?? '',
      iops: json['iops'] as int?,
      lastUsedTtlHours: json['lastUsedTtlHours'] as int?,
      sizeGiB: json['sizeGiB'] as int?,
      throughputMiB: json['throughputMiB'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final mountPath = this.mountPath;
    final iops = this.iops;
    final lastUsedTtlHours = this.lastUsedTtlHours;
    final sizeGiB = this.sizeGiB;
    final throughputMiB = this.throughputMiB;
    return {
      'mountPath': mountPath,
      if (iops != null) 'iops': iops,
      if (lastUsedTtlHours != null) 'lastUsedTtlHours': lastUsedTtlHours,
      if (sizeGiB != null) 'sizeGiB': sizeGiB,
      if (throughputMiB != null) 'throughputMiB': throughputMiB,
    };
  }
}

/// The auto scaling configuration settings for a service managed EC2 fleet.
class ServiceManagedEc2AutoScalingConfiguration {
  /// The number of workers that can be added per minute to the fleet. The default
  /// is 10 workers per minute.
  final int? scaleOutWorkersPerMinute;

  /// The number of idle workers maintained and ready to process incoming tasks.
  /// The default is 0.
  final int? standbyWorkerCount;

  /// The number of seconds that a worker can remain idle before it is shut down.
  /// The default is 300 seconds (5 minutes).
  final int? workerIdleDurationSeconds;

  ServiceManagedEc2AutoScalingConfiguration({
    this.scaleOutWorkersPerMinute,
    this.standbyWorkerCount,
    this.workerIdleDurationSeconds,
  });

  factory ServiceManagedEc2AutoScalingConfiguration.fromJson(
      Map<String, dynamic> json) {
    return ServiceManagedEc2AutoScalingConfiguration(
      scaleOutWorkersPerMinute: json['scaleOutWorkersPerMinute'] as int?,
      standbyWorkerCount: json['standbyWorkerCount'] as int?,
      workerIdleDurationSeconds: json['workerIdleDurationSeconds'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final scaleOutWorkersPerMinute = this.scaleOutWorkersPerMinute;
    final standbyWorkerCount = this.standbyWorkerCount;
    final workerIdleDurationSeconds = this.workerIdleDurationSeconds;
    return {
      if (scaleOutWorkersPerMinute != null)
        'scaleOutWorkersPerMinute': scaleOutWorkersPerMinute,
      if (standbyWorkerCount != null) 'standbyWorkerCount': standbyWorkerCount,
      if (workerIdleDurationSeconds != null)
        'workerIdleDurationSeconds': workerIdleDurationSeconds,
    };
  }
}

class Ec2MarketType {
  static const onDemand = Ec2MarketType._('on-demand');
  static const spot = Ec2MarketType._('spot');
  static const waitAndSave = Ec2MarketType._('wait-and-save');

  final String value;

  const Ec2MarketType._(this.value);

  static const values = [onDemand, spot, waitAndSave];

  static Ec2MarketType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => Ec2MarketType._(value));

  @override
  bool operator ==(other) => other is Ec2MarketType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The allowable range of vCPU processing power for the fleet.
class VCpuCountRange {
  /// The minimum amount of vCPU.
  final int min;

  /// The maximum amount of vCPU.
  final int? max;

  VCpuCountRange({
    required this.min,
    this.max,
  });

  factory VCpuCountRange.fromJson(Map<String, dynamic> json) {
    return VCpuCountRange(
      min: (json['min'] as int?) ?? 0,
      max: json['max'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final min = this.min;
    final max = this.max;
    return {
      'min': min,
      if (max != null) 'max': max,
    };
  }
}

/// The range of memory in MiB.
class MemoryMiBRange {
  /// The minimum amount of memory (in MiB).
  final int min;

  /// The maximum amount of memory (in MiB).
  final int? max;

  MemoryMiBRange({
    required this.min,
    this.max,
  });

  factory MemoryMiBRange.fromJson(Map<String, dynamic> json) {
    return MemoryMiBRange(
      min: (json['min'] as int?) ?? 0,
      max: json['max'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final min = this.min;
    final max = this.max;
    return {
      'min': min,
      if (max != null) 'max': max,
    };
  }
}

class ServiceManagedFleetOperatingSystemFamily {
  static const windows = ServiceManagedFleetOperatingSystemFamily._('WINDOWS');
  static const linux = ServiceManagedFleetOperatingSystemFamily._('LINUX');

  final String value;

  const ServiceManagedFleetOperatingSystemFamily._(this.value);

  static const values = [windows, linux];

  static ServiceManagedFleetOperatingSystemFamily fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ServiceManagedFleetOperatingSystemFamily._(value));

  @override
  bool operator ==(other) =>
      other is ServiceManagedFleetOperatingSystemFamily && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class CpuArchitectureType {
  static const x86_64 = CpuArchitectureType._('x86_64');
  static const arm64 = CpuArchitectureType._('arm64');

  final String value;

  const CpuArchitectureType._(this.value);

  static const values = [x86_64, arm64];

  static CpuArchitectureType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CpuArchitectureType._(value));

  @override
  bool operator ==(other) =>
      other is CpuArchitectureType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Specifies the EBS volume.
class Ec2EbsVolume {
  /// The IOPS per volume.
  final int? iops;

  /// The EBS volume size in GiB.
  final int? sizeGiB;

  /// The throughput per volume in MiB.
  final int? throughputMiB;

  Ec2EbsVolume({
    this.iops,
    this.sizeGiB,
    this.throughputMiB,
  });

  factory Ec2EbsVolume.fromJson(Map<String, dynamic> json) {
    return Ec2EbsVolume(
      iops: json['iops'] as int?,
      sizeGiB: json['sizeGiB'] as int?,
      throughputMiB: json['throughputMiB'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final iops = this.iops;
    final sizeGiB = this.sizeGiB;
    final throughputMiB = this.throughputMiB;
    return {
      if (iops != null) 'iops': iops,
      if (sizeGiB != null) 'sizeGiB': sizeGiB,
      if (throughputMiB != null) 'throughputMiB': throughputMiB,
    };
  }
}

/// Provides information about the GPU accelerators used for jobs processed by a
/// fleet.
/// <important>
/// Accelerator capabilities cannot be used with wait-and-save fleets. If you
/// specify accelerator capabilities, you must use either spot or on-demand
/// instance market options.
/// </important> <note>
/// Each accelerator type maps to specific EC2 instance families:
///
/// <ul>
/// <li>
/// <code>t4</code>: Uses G4dn instance family
/// </li>
/// <li>
/// <code>a10g</code>: Uses G5 instance family
/// </li>
/// <li>
/// <code>l4</code>: Uses G6 and Gr6 instance families
/// </li>
/// <li>
/// <code>l40s</code>: Uses G6e instance family
/// </li>
/// <li>
/// <code>rtx-pro-server-6000</code>: Uses G7e instance family
/// </li>
/// </ul> </note>
class AcceleratorCapabilities {
  /// A list of accelerator capabilities requested for this fleet. Only Amazon
  /// Elastic Compute Cloud instances that provide these capabilities will be
  /// used. For example, if you specify both L4 and T4 chips, Amazon Web Services
  /// Deadline Cloud will use Amazon EC2 instances that have either the L4 or the
  /// T4 chip installed.
  /// <important>
  /// <ul>
  /// <li>
  /// You must specify at least one accelerator selection.
  /// </li>
  /// <li>
  /// You cannot specify the same accelerator name multiple times in the
  /// selections list.
  /// </li>
  /// <li>
  /// All accelerators in the selections must use the same runtime version.
  /// </li>
  /// </ul> </important>
  final List<AcceleratorSelection> selections;

  /// The number of GPU accelerators specified for worker hosts in this fleet.
  /// <important>
  /// You must specify either <code>acceleratorCapabilities.count.max</code> or
  /// <code>allowedInstanceTypes</code> when using accelerator capabilities. If
  /// you don't specify a maximum count, Amazon Web Services Deadline Cloud uses
  /// the instance types you specify in <code>allowedInstanceTypes</code> to
  /// determine the maximum number of accelerators.
  /// </important>
  final AcceleratorCountRange? count;

  AcceleratorCapabilities({
    required this.selections,
    this.count,
  });

  factory AcceleratorCapabilities.fromJson(Map<String, dynamic> json) {
    return AcceleratorCapabilities(
      selections: ((json['selections'] as List?) ?? const [])
          .nonNulls
          .map((e) => AcceleratorSelection.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: json['count'] != null
          ? AcceleratorCountRange.fromJson(
              json['count'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final selections = this.selections;
    final count = this.count;
    return {
      'selections': selections,
      if (count != null) 'count': count,
    };
  }
}

/// Defines the fleet's capability name, minimum, and maximum.
class FleetAttributeCapability {
  /// The name of the fleet attribute capability for the worker.
  final String name;

  /// The number of fleet attribute capabilities.
  final List<String> values;

  FleetAttributeCapability({
    required this.name,
    required this.values,
  });

  factory FleetAttributeCapability.fromJson(Map<String, dynamic> json) {
    return FleetAttributeCapability(
      name: (json['name'] as String?) ?? '',
      values: ((json['values'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      'name': name,
      'values': values,
    };
  }
}

/// The fleet amount and attribute capabilities.
class FleetAmountCapability {
  /// The minimum amount of fleet worker capability.
  final double min;

  /// The name of the fleet capability.
  final String name;

  /// The maximum amount of the fleet worker capability.
  final double? max;

  FleetAmountCapability({
    required this.min,
    required this.name,
    this.max,
  });

  factory FleetAmountCapability.fromJson(Map<String, dynamic> json) {
    return FleetAmountCapability(
      min: (json['min'] as double?) ?? 0,
      name: (json['name'] as String?) ?? '',
      max: json['max'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final min = this.min;
    final name = this.name;
    final max = this.max;
    return {
      'min': min,
      'name': name,
      if (max != null) 'max': max,
    };
  }
}

/// Defines the maximum and minimum number of GPU accelerators required for a
/// worker instance..
class AcceleratorCountRange {
  /// The minimum number of GPU accelerators in the worker host.
  final int min;

  /// The maximum number of GPU accelerators in the worker host.
  final int? max;

  AcceleratorCountRange({
    required this.min,
    this.max,
  });

  factory AcceleratorCountRange.fromJson(Map<String, dynamic> json) {
    return AcceleratorCountRange(
      min: (json['min'] as int?) ?? 0,
      max: json['max'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final min = this.min;
    final max = this.max;
    return {
      'min': min,
      if (max != null) 'max': max,
    };
  }
}

/// Describes a specific GPU accelerator required for an Amazon Elastic Compute
/// Cloud worker host.
class AcceleratorSelection {
  /// The name of the chip used by the GPU accelerator.
  ///
  /// The available GPU accelerators are:
  ///
  /// <ul>
  /// <li>
  /// <code>t4</code> - NVIDIA T4 Tensor Core GPU (16 GiB memory)
  /// </li>
  /// <li>
  /// <code>a10g</code> - NVIDIA A10G Tensor Core GPU (24 GiB memory)
  /// </li>
  /// <li>
  /// <code>l4</code> - NVIDIA L4 Tensor Core GPU (24 GiB memory)
  /// </li>
  /// <li>
  /// <code>l40s</code> - NVIDIA L40S Tensor Core GPU (48 GiB memory)
  /// </li>
  /// <li>
  /// <code>rtx-pro-server-6000</code> - NVIDIA RTX PRO Server 6000 GPU (96 GiB
  /// memory)
  /// </li>
  /// </ul>
  final AcceleratorName name;

  /// Specifies the runtime driver to use for the GPU accelerator. You must use
  /// the same runtime for all GPUs in a fleet.
  ///
  /// You can choose from the following runtimes:
  ///
  /// <ul>
  /// <li>
  /// <code>latest</code> - Use the latest runtime available for the chip. If you
  /// specify <code>latest</code> and a new version of the runtime is released,
  /// the new version of the runtime is used.
  /// </li>
  /// <li>
  /// <code>grid:r580</code> - <a
  /// href="https://docs.nvidia.com/vgpu/19.0/index.html">NVIDIA vGPU software
  /// 19</a>
  /// </li>
  /// <li>
  /// <code>grid:r570</code> - <a
  /// href="https://docs.nvidia.com/vgpu/18.0/index.html">NVIDIA vGPU software
  /// 18</a>
  /// </li>
  /// <li>
  /// <code>grid:r535</code> - <a
  /// href="https://docs.nvidia.com/vgpu/16.0/index.html">NVIDIA vGPU software
  /// 16</a>
  /// </li>
  /// </ul>
  /// If you don't specify a runtime, Amazon Web Services Deadline Cloud uses
  /// <code>latest</code> as the default. However, if you have multiple
  /// accelerators and specify <code>latest</code> for some and leave others
  /// blank, Amazon Web Services Deadline Cloud raises an exception.
  /// <important>
  /// Not all runtimes are compatible with all accelerator types:
  ///
  /// <ul>
  /// <li>
  /// <code>t4</code> and <code>a10g</code>: Support all runtimes
  /// (<code>grid:r580</code>, <code>grid:r570</code>, <code>grid:r535</code>)
  /// </li>
  /// <li>
  /// <code>l4</code> and <code>l40s</code>: Only support <code>grid:r570</code>
  /// and newer
  /// </li>
  /// <li>
  /// <code>rtx-pro-server-6000</code>: Only supports <code>grid:r580</code>
  /// </li>
  /// </ul>
  /// All accelerators in a fleet must use the same runtime version. You cannot
  /// mix different runtime versions within a single fleet.
  /// </important> <note>
  /// When you specify <code>latest</code>, it resolves to <code>grid:r580</code>
  /// for all currently supported accelerators.
  /// </note>
  final String? runtime;

  AcceleratorSelection({
    required this.name,
    this.runtime,
  });

  factory AcceleratorSelection.fromJson(Map<String, dynamic> json) {
    return AcceleratorSelection(
      name: AcceleratorName.fromString((json['name'] as String?) ?? ''),
      runtime: json['runtime'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final runtime = this.runtime;
    return {
      'name': name.value,
      if (runtime != null) 'runtime': runtime,
    };
  }
}

class AcceleratorName {
  static const t4 = AcceleratorName._('t4');
  static const a10g = AcceleratorName._('a10g');
  static const l4 = AcceleratorName._('l4');
  static const l40s = AcceleratorName._('l40s');
  static const rtxProServer_6000 = AcceleratorName._('rtx-pro-server-6000');

  final String value;

  const AcceleratorName._(this.value);

  static const values = [t4, a10g, l4, l40s, rtxProServer_6000];

  static AcceleratorName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AcceleratorName._(value));

  @override
  bool operator ==(other) => other is AcceleratorName && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class AutoScalingMode {
  static const noScaling = AutoScalingMode._('NO_SCALING');
  static const eventBasedAutoScaling =
      AutoScalingMode._('EVENT_BASED_AUTO_SCALING');

  final String value;

  const AutoScalingMode._(this.value);

  static const values = [noScaling, eventBasedAutoScaling];

  static AutoScalingMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AutoScalingMode._(value));

  @override
  bool operator ==(other) => other is AutoScalingMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The auto scaling configuration settings for a customer managed fleet.
class CustomerManagedAutoScalingConfiguration {
  /// The number of workers that can be added per minute to the fleet. The default
  /// is 10 workers per minute.
  final int? scaleOutWorkersPerMinute;

  /// The number of idle workers maintained and ready to process incoming tasks.
  /// The default is 0.
  final int? standbyWorkerCount;

  /// The number of seconds that a worker can remain idle before it is shut down.
  /// The default is 300 seconds (5 minutes).
  final int? workerIdleDurationSeconds;

  CustomerManagedAutoScalingConfiguration({
    this.scaleOutWorkersPerMinute,
    this.standbyWorkerCount,
    this.workerIdleDurationSeconds,
  });

  factory CustomerManagedAutoScalingConfiguration.fromJson(
      Map<String, dynamic> json) {
    return CustomerManagedAutoScalingConfiguration(
      scaleOutWorkersPerMinute: json['scaleOutWorkersPerMinute'] as int?,
      standbyWorkerCount: json['standbyWorkerCount'] as int?,
      workerIdleDurationSeconds: json['workerIdleDurationSeconds'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final scaleOutWorkersPerMinute = this.scaleOutWorkersPerMinute;
    final standbyWorkerCount = this.standbyWorkerCount;
    final workerIdleDurationSeconds = this.workerIdleDurationSeconds;
    return {
      if (scaleOutWorkersPerMinute != null)
        'scaleOutWorkersPerMinute': scaleOutWorkersPerMinute,
      if (standbyWorkerCount != null) 'standbyWorkerCount': standbyWorkerCount,
      if (workerIdleDurationSeconds != null)
        'workerIdleDurationSeconds': workerIdleDurationSeconds,
    };
  }
}

/// The worker capabilities for a customer managed workflow.
class CustomerManagedWorkerCapabilities {
  /// The CPU architecture type for the customer managed worker capabilities.
  final CpuArchitectureType cpuArchitectureType;

  /// The memory (MiB).
  final MemoryMiBRange memoryMiB;

  /// The operating system (OS) family.
  final CustomerManagedFleetOperatingSystemFamily osFamily;

  /// The vCPU count for the customer manged worker capabilities.
  final VCpuCountRange vCpuCount;

  /// The range of the accelerator.
  final AcceleratorCountRange? acceleratorCount;

  /// The total memory (MiB) for the customer managed worker capabilities.
  final AcceleratorTotalMemoryMiBRange? acceleratorTotalMemoryMiB;

  /// The accelerator types for the customer managed worker capabilities.
  final List<AcceleratorType>? acceleratorTypes;

  /// Custom requirement ranges for customer managed worker capabilities.
  final List<FleetAmountCapability>? customAmounts;

  /// Custom attributes for the customer manged worker capabilities.
  final List<FleetAttributeCapability>? customAttributes;

  CustomerManagedWorkerCapabilities({
    required this.cpuArchitectureType,
    required this.memoryMiB,
    required this.osFamily,
    required this.vCpuCount,
    this.acceleratorCount,
    this.acceleratorTotalMemoryMiB,
    this.acceleratorTypes,
    this.customAmounts,
    this.customAttributes,
  });

  factory CustomerManagedWorkerCapabilities.fromJson(
      Map<String, dynamic> json) {
    return CustomerManagedWorkerCapabilities(
      cpuArchitectureType: CpuArchitectureType.fromString(
          (json['cpuArchitectureType'] as String?) ?? ''),
      memoryMiB: MemoryMiBRange.fromJson(
          (json['memoryMiB'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      osFamily: CustomerManagedFleetOperatingSystemFamily.fromString(
          (json['osFamily'] as String?) ?? ''),
      vCpuCount: VCpuCountRange.fromJson(
          (json['vCpuCount'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      acceleratorCount: json['acceleratorCount'] != null
          ? AcceleratorCountRange.fromJson(
              json['acceleratorCount'] as Map<String, dynamic>)
          : null,
      acceleratorTotalMemoryMiB: json['acceleratorTotalMemoryMiB'] != null
          ? AcceleratorTotalMemoryMiBRange.fromJson(
              json['acceleratorTotalMemoryMiB'] as Map<String, dynamic>)
          : null,
      acceleratorTypes: (json['acceleratorTypes'] as List?)
          ?.nonNulls
          .map((e) => AcceleratorType.fromString((e as String)))
          .toList(),
      customAmounts: (json['customAmounts'] as List?)
          ?.nonNulls
          .map((e) => FleetAmountCapability.fromJson(e as Map<String, dynamic>))
          .toList(),
      customAttributes: (json['customAttributes'] as List?)
          ?.nonNulls
          .map((e) =>
              FleetAttributeCapability.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final cpuArchitectureType = this.cpuArchitectureType;
    final memoryMiB = this.memoryMiB;
    final osFamily = this.osFamily;
    final vCpuCount = this.vCpuCount;
    final acceleratorCount = this.acceleratorCount;
    final acceleratorTotalMemoryMiB = this.acceleratorTotalMemoryMiB;
    final acceleratorTypes = this.acceleratorTypes;
    final customAmounts = this.customAmounts;
    final customAttributes = this.customAttributes;
    return {
      'cpuArchitectureType': cpuArchitectureType.value,
      'memoryMiB': memoryMiB,
      'osFamily': osFamily.value,
      'vCpuCount': vCpuCount,
      if (acceleratorCount != null) 'acceleratorCount': acceleratorCount,
      if (acceleratorTotalMemoryMiB != null)
        'acceleratorTotalMemoryMiB': acceleratorTotalMemoryMiB,
      if (acceleratorTypes != null)
        'acceleratorTypes': acceleratorTypes.map((e) => e.value).toList(),
      if (customAmounts != null) 'customAmounts': customAmounts,
      if (customAttributes != null) 'customAttributes': customAttributes,
    };
  }
}

class TagPropagationMode {
  static const noPropagation = TagPropagationMode._('NO_PROPAGATION');
  static const propagateTagsToWorkersAtLaunch =
      TagPropagationMode._('PROPAGATE_TAGS_TO_WORKERS_AT_LAUNCH');

  final String value;

  const TagPropagationMode._(this.value);

  static const values = [noPropagation, propagateTagsToWorkersAtLaunch];

  static TagPropagationMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TagPropagationMode._(value));

  @override
  bool operator ==(other) =>
      other is TagPropagationMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Defines the maximum and minimum amount of memory, in MiB, to use for the
/// accelerator.
class AcceleratorTotalMemoryMiBRange {
  /// The minimum amount of memory to use for the accelerator, measured in MiB.
  final int min;

  /// The maximum amount of memory to use for the accelerator, measured in MiB.
  final int? max;

  AcceleratorTotalMemoryMiBRange({
    required this.min,
    this.max,
  });

  factory AcceleratorTotalMemoryMiBRange.fromJson(Map<String, dynamic> json) {
    return AcceleratorTotalMemoryMiBRange(
      min: (json['min'] as int?) ?? 0,
      max: json['max'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final min = this.min;
    final max = this.max;
    return {
      'min': min,
      if (max != null) 'max': max,
    };
  }
}

class CustomerManagedFleetOperatingSystemFamily {
  static const windows = CustomerManagedFleetOperatingSystemFamily._('WINDOWS');
  static const linux = CustomerManagedFleetOperatingSystemFamily._('LINUX');
  static const macos = CustomerManagedFleetOperatingSystemFamily._('MACOS');

  final String value;

  const CustomerManagedFleetOperatingSystemFamily._(this.value);

  static const values = [windows, linux, macos];

  static CustomerManagedFleetOperatingSystemFamily fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CustomerManagedFleetOperatingSystemFamily._(value));

  @override
  bool operator ==(other) =>
      other is CustomerManagedFleetOperatingSystemFamily &&
      other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class AcceleratorType {
  static const gpu = AcceleratorType._('gpu');

  final String value;

  const AcceleratorType._(this.value);

  static const values = [gpu];

  static AcceleratorType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AcceleratorType._(value));

  @override
  bool operator ==(other) => other is AcceleratorType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The amounts and attributes of fleets.
class FleetCapabilities {
  /// Amount capabilities of the fleet.
  final List<FleetAmountCapability>? amounts;

  /// Attribute capabilities of the fleet.
  final List<FleetAttributeCapability>? attributes;

  FleetCapabilities({
    this.amounts,
    this.attributes,
  });

  factory FleetCapabilities.fromJson(Map<String, dynamic> json) {
    return FleetCapabilities(
      amounts: (json['amounts'] as List?)
          ?.nonNulls
          .map((e) => FleetAmountCapability.fromJson(e as Map<String, dynamic>))
          .toList(),
      attributes: (json['attributes'] as List?)
          ?.nonNulls
          .map((e) =>
              FleetAttributeCapability.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final amounts = this.amounts;
    final attributes = this.attributes;
    return {
      if (amounts != null) 'amounts': amounts,
      if (attributes != null) 'attributes': attributes,
    };
  }
}

/// The budget summary.
class BudgetSummary {
  /// The approximate dollar limit of the budget.
  final double approximateDollarLimit;

  /// The budget ID.
  final String budgetId;

  /// The date and time the resource was created.
  final DateTime createdAt;

  /// The user or system that created this resource.
  final String createdBy;

  /// The display name of the budget summary to update.
  /// <important>
  /// This field can store any content. Escape or encode this content before
  /// displaying it on a webpage or any other system that might interpret the
  /// content of this field.
  /// </important>
  final String displayName;

  /// The status of the budget.
  ///
  /// <ul>
  /// <li>
  /// <code>ACTIVE</code>–The budget is being evaluated.
  /// </li>
  /// <li>
  /// <code>INACTIVE</code>–The budget is inactive. This can include Expired,
  /// Canceled, or deleted Deleted statuses.
  /// </li>
  /// </ul>
  final BudgetStatus status;

  /// The resource used to track expenditure in the budget.
  final UsageTrackingResource usageTrackingResource;

  /// The consumed usage for the budget.
  final ConsumedUsages usages;

  /// The description of the budget summary.
  /// <important>
  /// This field can store any content. Escape or encode this content before
  /// displaying it on a webpage or any other system that might interpret the
  /// content of this field.
  /// </important>
  final String? description;

  /// The date and time the resource was updated.
  final DateTime? updatedAt;

  /// The user or system that updated this resource.
  final String? updatedBy;

  BudgetSummary({
    required this.approximateDollarLimit,
    required this.budgetId,
    required this.createdAt,
    required this.createdBy,
    required this.displayName,
    required this.status,
    required this.usageTrackingResource,
    required this.usages,
    this.description,
    this.updatedAt,
    this.updatedBy,
  });

  factory BudgetSummary.fromJson(Map<String, dynamic> json) {
    return BudgetSummary(
      approximateDollarLimit: (json['approximateDollarLimit'] as double?) ?? 0,
      budgetId: (json['budgetId'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      createdBy: (json['createdBy'] as String?) ?? '',
      displayName: (json['displayName'] as String?) ?? '',
      status: BudgetStatus.fromString((json['status'] as String?) ?? ''),
      usageTrackingResource: UsageTrackingResource.fromJson(
          (json['usageTrackingResource'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      usages: ConsumedUsages.fromJson(
          (json['usages'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      description: json['description'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final approximateDollarLimit = this.approximateDollarLimit;
    final budgetId = this.budgetId;
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final displayName = this.displayName;
    final status = this.status;
    final usageTrackingResource = this.usageTrackingResource;
    final usages = this.usages;
    final description = this.description;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      'approximateDollarLimit': approximateDollarLimit,
      'budgetId': budgetId,
      'createdAt': iso8601ToJson(createdAt),
      'createdBy': createdBy,
      'displayName': displayName,
      'status': status.value,
      'usageTrackingResource': usageTrackingResource,
      'usages': usages,
      if (description != null) 'description': description,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

/// The usage details of the allotted budget.
class UsageTrackingResource {
  /// The queue ID.
  final String? queueId;

  UsageTrackingResource({
    this.queueId,
  });

  factory UsageTrackingResource.fromJson(Map<String, dynamic> json) {
    return UsageTrackingResource(
      queueId: json['queueId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final queueId = this.queueId;
    return {
      if (queueId != null) 'queueId': queueId,
    };
  }
}

class BudgetStatus {
  static const active = BudgetStatus._('ACTIVE');
  static const inactive = BudgetStatus._('INACTIVE');

  final String value;

  const BudgetStatus._(this.value);

  static const values = [active, inactive];

  static BudgetStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => BudgetStatus._(value));

  @override
  bool operator ==(other) => other is BudgetStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The consumed usage for the resource.
class ConsumedUsages {
  /// The amount of the budget consumed.
  final double approximateDollarUsage;

  ConsumedUsages({
    required this.approximateDollarUsage,
  });

  factory ConsumedUsages.fromJson(Map<String, dynamic> json) {
    return ConsumedUsages(
      approximateDollarUsage: (json['approximateDollarUsage'] as double?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final approximateDollarUsage = this.approximateDollarUsage;
    return {
      'approximateDollarUsage': approximateDollarUsage,
    };
  }
}

/// The start and end time of the budget.
class BudgetSchedule {
  /// The fixed start and end time of the budget's schedule.
  final FixedBudgetSchedule? fixed;

  BudgetSchedule({
    this.fixed,
  });

  factory BudgetSchedule.fromJson(Map<String, dynamic> json) {
    return BudgetSchedule(
      fixed: json['fixed'] != null
          ? FixedBudgetSchedule.fromJson(json['fixed'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final fixed = this.fixed;
    return {
      if (fixed != null) 'fixed': fixed,
    };
  }
}

/// The details of a fixed budget schedule.
class FixedBudgetSchedule {
  /// When the budget ends.
  final DateTime endTime;

  /// When the budget starts.
  final DateTime startTime;

  FixedBudgetSchedule({
    required this.endTime,
    required this.startTime,
  });

  factory FixedBudgetSchedule.fromJson(Map<String, dynamic> json) {
    return FixedBudgetSchedule(
      endTime: nonNullableTimeStampFromJson(json['endTime'] ?? 0),
      startTime: nonNullableTimeStampFromJson(json['startTime'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final endTime = this.endTime;
    final startTime = this.startTime;
    return {
      'endTime': iso8601ToJson(endTime),
      'startTime': iso8601ToJson(startTime),
    };
  }
}

/// The budget action to remove.
class BudgetActionToRemove {
  /// The percentage threshold for the budget action to remove.
  final double thresholdPercentage;

  /// The type of budget action to remove.
  final BudgetActionType type;

  BudgetActionToRemove({
    required this.thresholdPercentage,
    required this.type,
  });

  Map<String, dynamic> toJson() {
    final thresholdPercentage = this.thresholdPercentage;
    final type = this.type;
    return {
      'thresholdPercentage': thresholdPercentage,
      'type': type.value,
    };
  }
}

class BudgetActionType {
  static const stopSchedulingAndCompleteTasks =
      BudgetActionType._('STOP_SCHEDULING_AND_COMPLETE_TASKS');
  static const stopSchedulingAndCancelTasks =
      BudgetActionType._('STOP_SCHEDULING_AND_CANCEL_TASKS');

  final String value;

  const BudgetActionType._(this.value);

  static const values = [
    stopSchedulingAndCompleteTasks,
    stopSchedulingAndCancelTasks
  ];

  static BudgetActionType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => BudgetActionType._(value));

  @override
  bool operator ==(other) => other is BudgetActionType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The budget action to add.
class BudgetActionToAdd {
  /// The percentage threshold for the budget action to add.
  final double thresholdPercentage;

  /// The type of budget action to add.
  final BudgetActionType type;

  /// A description for the budget action to add.
  /// <important>
  /// This field can store any content. Escape or encode this content before
  /// displaying it on a webpage or any other system that might interpret the
  /// content of this field.
  /// </important>
  final String? description;

  BudgetActionToAdd({
    required this.thresholdPercentage,
    required this.type,
    this.description,
  });

  Map<String, dynamic> toJson() {
    final thresholdPercentage = this.thresholdPercentage;
    final type = this.type;
    final description = this.description;
    return {
      'thresholdPercentage': thresholdPercentage,
      'type': type.value,
      if (description != null) 'description': description,
    };
  }
}

/// The details of a budget action.
class ResponseBudgetAction {
  /// The percentage threshold for the budget.
  final double thresholdPercentage;

  /// The action taken on the budget once scheduling stops.
  final BudgetActionType type;

  /// The budget action description.
  /// <important>
  /// This field can store any content. Escape or encode this content before
  /// displaying it on a webpage or any other system that might interpret the
  /// content of this field.
  /// </important>
  final String? description;

  ResponseBudgetAction({
    required this.thresholdPercentage,
    required this.type,
    this.description,
  });

  factory ResponseBudgetAction.fromJson(Map<String, dynamic> json) {
    return ResponseBudgetAction(
      thresholdPercentage: (json['thresholdPercentage'] as double?) ?? 0,
      type: BudgetActionType.fromString((json['type'] as String?) ?? ''),
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final thresholdPercentage = this.thresholdPercentage;
    final type = this.type;
    final description = this.description;
    return {
      'thresholdPercentage': thresholdPercentage,
      'type': type.value,
      if (description != null) 'description': description,
    };
  }
}

/// Provides information about a specific limit.
class LimitSummary {
  /// The value that you specify as the <code>name</code> in the
  /// <code>amounts</code> field of the <code>hostRequirements</code> in a step of
  /// a job template to declare the limit requirement.
  final String amountRequirementName;

  /// The Unix timestamp of the date and time that the limit was created.
  final DateTime createdAt;

  /// The user identifier of the person that created the limit.
  final String createdBy;

  /// The number of resources from the limit that are being used by jobs. The
  /// result is delayed and may not be the count at the time that you called the
  /// operation.
  final int currentCount;

  /// The name of the limit used in lists to identify the limit.
  /// <important>
  /// This field can store any content. Escape or encode this content before
  /// displaying it on a webpage or any other system that might interpret the
  /// content of this field.
  /// </important>
  final String displayName;

  /// The unique identifier of the farm that contains the limit.
  final String farmId;

  /// The unique identifier of the limit.
  final String limitId;

  /// The maximum number of resources constrained by this limit. When all of the
  /// resources are in use, steps that require the limit won't be scheduled until
  /// the resource is available.
  ///
  /// The <code>maxValue</code> must not be 0. If the value is -1, there is no
  /// restriction on the number of resources that can be acquired for this limit.
  final int maxCount;

  /// The Unix timestamp of the date and time that the limit was last updated.
  final DateTime? updatedAt;

  /// The user identifier of the person that last updated the limit.
  final String? updatedBy;

  LimitSummary({
    required this.amountRequirementName,
    required this.createdAt,
    required this.createdBy,
    required this.currentCount,
    required this.displayName,
    required this.farmId,
    required this.limitId,
    required this.maxCount,
    this.updatedAt,
    this.updatedBy,
  });

  factory LimitSummary.fromJson(Map<String, dynamic> json) {
    return LimitSummary(
      amountRequirementName: (json['amountRequirementName'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      createdBy: (json['createdBy'] as String?) ?? '',
      currentCount: (json['currentCount'] as int?) ?? 0,
      displayName: (json['displayName'] as String?) ?? '',
      farmId: (json['farmId'] as String?) ?? '',
      limitId: (json['limitId'] as String?) ?? '',
      maxCount: (json['maxCount'] as int?) ?? 0,
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final amountRequirementName = this.amountRequirementName;
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final currentCount = this.currentCount;
    final displayName = this.displayName;
    final farmId = this.farmId;
    final limitId = this.limitId;
    final maxCount = this.maxCount;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      'amountRequirementName': amountRequirementName,
      'createdAt': iso8601ToJson(createdAt),
      'createdBy': createdBy,
      'currentCount': currentCount,
      'displayName': displayName,
      'farmId': farmId,
      'limitId': limitId,
      'maxCount': maxCount,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

/// The member of a farm.
class FarmMember {
  /// The farm ID of the farm member.
  final String farmId;

  /// The identity store ID of the farm member.
  final String identityStoreId;

  /// The farm member's membership level.
  final MembershipLevel membershipLevel;

  /// The principal ID of the farm member.
  final String principalId;

  /// The principal type of the farm member.
  final DeadlinePrincipalType principalType;

  FarmMember({
    required this.farmId,
    required this.identityStoreId,
    required this.membershipLevel,
    required this.principalId,
    required this.principalType,
  });

  factory FarmMember.fromJson(Map<String, dynamic> json) {
    return FarmMember(
      farmId: (json['farmId'] as String?) ?? '',
      identityStoreId: (json['identityStoreId'] as String?) ?? '',
      membershipLevel: MembershipLevel.fromString(
          (json['membershipLevel'] as String?) ?? ''),
      principalId: (json['principalId'] as String?) ?? '',
      principalType: DeadlinePrincipalType.fromString(
          (json['principalType'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final farmId = this.farmId;
    final identityStoreId = this.identityStoreId;
    final membershipLevel = this.membershipLevel;
    final principalId = this.principalId;
    final principalType = this.principalType;
    return {
      'farmId': farmId,
      'identityStoreId': identityStoreId,
      'membershipLevel': membershipLevel.value,
      'principalId': principalId,
      'principalType': principalType.value,
    };
  }
}

/// The summary of details for a farm.
class FarmSummary {
  /// The date and time the resource was created.
  final DateTime createdAt;

  /// The user or system that created this resource.
  final String createdBy;

  /// The display name of the farm.
  /// <important>
  /// This field can store any content. Escape or encode this content before
  /// displaying it on a webpage or any other system that might interpret the
  /// content of this field.
  /// </important>
  final String displayName;

  /// The farm ID.
  final String farmId;

  /// The ARN for the KMS key.
  final String? kmsKeyArn;

  /// The date and time the resource was updated.
  final DateTime? updatedAt;

  /// The user or system that updated this resource.
  final String? updatedBy;

  FarmSummary({
    required this.createdAt,
    required this.createdBy,
    required this.displayName,
    required this.farmId,
    this.kmsKeyArn,
    this.updatedAt,
    this.updatedBy,
  });

  factory FarmSummary.fromJson(Map<String, dynamic> json) {
    return FarmSummary(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      createdBy: (json['createdBy'] as String?) ?? '',
      displayName: (json['displayName'] as String?) ?? '',
      farmId: (json['farmId'] as String?) ?? '',
      kmsKeyArn: json['kmsKeyArn'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final displayName = this.displayName;
    final farmId = this.farmId;
    final kmsKeyArn = this.kmsKeyArn;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'createdBy': createdBy,
      'displayName': displayName,
      'farmId': farmId,
      if (kmsKeyArn != null) 'kmsKeyArn': kmsKeyArn,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

class UpdateQueueLimitAssociationStatus {
  static const active = UpdateQueueLimitAssociationStatus._('ACTIVE');
  static const stopLimitUsageAndCompleteTasks =
      UpdateQueueLimitAssociationStatus._(
          'STOP_LIMIT_USAGE_AND_COMPLETE_TASKS');
  static const stopLimitUsageAndCancelTasks =
      UpdateQueueLimitAssociationStatus._('STOP_LIMIT_USAGE_AND_CANCEL_TASKS');

  final String value;

  const UpdateQueueLimitAssociationStatus._(this.value);

  static const values = [
    active,
    stopLimitUsageAndCompleteTasks,
    stopLimitUsageAndCancelTasks
  ];

  static UpdateQueueLimitAssociationStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => UpdateQueueLimitAssociationStatus._(value));

  @override
  bool operator ==(other) =>
      other is UpdateQueueLimitAssociationStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class UpdateQueueFleetAssociationStatus {
  static const active = UpdateQueueFleetAssociationStatus._('ACTIVE');
  static const stopSchedulingAndCompleteTasks =
      UpdateQueueFleetAssociationStatus._('STOP_SCHEDULING_AND_COMPLETE_TASKS');
  static const stopSchedulingAndCancelTasks =
      UpdateQueueFleetAssociationStatus._('STOP_SCHEDULING_AND_CANCEL_TASKS');

  final String value;

  const UpdateQueueFleetAssociationStatus._(this.value);

  static const values = [
    active,
    stopSchedulingAndCompleteTasks,
    stopSchedulingAndCancelTasks
  ];

  static UpdateQueueFleetAssociationStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => UpdateQueueFleetAssociationStatus._(value));

  @override
  bool operator ==(other) =>
      other is UpdateQueueFleetAssociationStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Specifies the fleet IDs or queue IDs to return statistics. You can specify
/// only fleet IDs or queue IDS, not both.
class SessionsStatisticsResources {
  /// One to 10 fleet IDs that specify the fleets to return statistics for. If you
  /// specify the <code>fleetIds</code> field, you can't specify the
  /// <code>queueIds</code> field.
  final List<String>? fleetIds;

  /// One to 10 queue IDs that specify the queues to return statistics for. If you
  /// specify the <code>queueIds</code> field, you can't specify the
  /// <code>fleetIds</code> field.
  final List<String>? queueIds;

  SessionsStatisticsResources({
    this.fleetIds,
    this.queueIds,
  });

  Map<String, dynamic> toJson() {
    final fleetIds = this.fleetIds;
    final queueIds = this.queueIds;
    return {
      if (fleetIds != null) 'fleetIds': fleetIds,
      if (queueIds != null) 'queueIds': queueIds,
    };
  }
}

class Period {
  static const hourly = Period._('HOURLY');
  static const daily = Period._('DAILY');
  static const weekly = Period._('WEEKLY');
  static const monthly = Period._('MONTHLY');

  final String value;

  const Period._(this.value);

  static const values = [hourly, daily, weekly, monthly];

  static Period fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Period._(value));

  @override
  bool operator ==(other) => other is Period && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class UsageStatistic {
  static const sum = UsageStatistic._('SUM');
  static const min = UsageStatistic._('MIN');
  static const max = UsageStatistic._('MAX');
  static const avg = UsageStatistic._('AVG');

  final String value;

  const UsageStatistic._(this.value);

  static const values = [sum, min, max, avg];

  static UsageStatistic fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => UsageStatistic._(value));

  @override
  bool operator ==(other) => other is UsageStatistic && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class UsageGroupByField {
  static const queueId = UsageGroupByField._('QUEUE_ID');
  static const fleetId = UsageGroupByField._('FLEET_ID');
  static const jobId = UsageGroupByField._('JOB_ID');
  static const userId = UsageGroupByField._('USER_ID');
  static const usageType = UsageGroupByField._('USAGE_TYPE');
  static const instanceType = UsageGroupByField._('INSTANCE_TYPE');
  static const licenseProduct = UsageGroupByField._('LICENSE_PRODUCT');

  final String value;

  const UsageGroupByField._(this.value);

  static const values = [
    queueId,
    fleetId,
    jobId,
    userId,
    usageType,
    instanceType,
    licenseProduct
  ];

  static UsageGroupByField fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => UsageGroupByField._(value));

  @override
  bool operator ==(other) => other is UsageGroupByField && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The details of a worker search.
class WorkerSearchSummary {
  /// The date and time the resource was created.
  final DateTime? createdAt;

  /// The user or system that created this resource.
  final String? createdBy;

  /// The fleet ID.
  final String? fleetId;

  /// Provides the Amazon EC2 instance properties of the worker host.
  final HostPropertiesResponse? hostProperties;

  /// The status of the worker search.
  final WorkerStatus? status;

  /// The date and time the resource was updated.
  final DateTime? updatedAt;

  /// The user or system that updated this resource.
  final String? updatedBy;

  /// The worker ID.
  final String? workerId;

  WorkerSearchSummary({
    this.createdAt,
    this.createdBy,
    this.fleetId,
    this.hostProperties,
    this.status,
    this.updatedAt,
    this.updatedBy,
    this.workerId,
  });

  factory WorkerSearchSummary.fromJson(Map<String, dynamic> json) {
    return WorkerSearchSummary(
      createdAt: timeStampFromJson(json['createdAt']),
      createdBy: json['createdBy'] as String?,
      fleetId: json['fleetId'] as String?,
      hostProperties: json['hostProperties'] != null
          ? HostPropertiesResponse.fromJson(
              json['hostProperties'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)?.let(WorkerStatus.fromString),
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
      workerId: json['workerId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final fleetId = this.fleetId;
    final hostProperties = this.hostProperties;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    final workerId = this.workerId;
    return {
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (createdBy != null) 'createdBy': createdBy,
      if (fleetId != null) 'fleetId': fleetId,
      if (hostProperties != null) 'hostProperties': hostProperties,
      if (status != null) 'status': status.value,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
      if (workerId != null) 'workerId': workerId,
    };
  }
}

/// The search terms for a resource.
class SearchGroupedFilterExpressions {
  /// The filters to use for the search.
  final List<SearchFilterExpression> filters;

  /// The operators to include in the search.
  final LogicalOperator operator;

  SearchGroupedFilterExpressions({
    required this.filters,
    required this.operator,
  });

  Map<String, dynamic> toJson() {
    final filters = this.filters;
    final operator = this.operator;
    return {
      'filters': filters,
      'operator': operator.value,
    };
  }
}

/// The resources to search.
class SearchSortExpression {
  /// Options for sorting by a field.
  final FieldSortExpression? fieldSort;

  /// Options for sorting by a parameter.
  final ParameterSortExpression? parameterSort;

  /// Options for sorting a particular user's jobs first.
  final UserJobsFirst? userJobsFirst;

  SearchSortExpression({
    this.fieldSort,
    this.parameterSort,
    this.userJobsFirst,
  });

  Map<String, dynamic> toJson() {
    final fieldSort = this.fieldSort;
    final parameterSort = this.parameterSort;
    final userJobsFirst = this.userJobsFirst;
    return {
      if (fieldSort != null) 'fieldSort': fieldSort,
      if (parameterSort != null) 'parameterSort': parameterSort,
      if (userJobsFirst != null) 'userJobsFirst': userJobsFirst,
    };
  }
}

/// Allows setting a specific user's job to run first.
class UserJobsFirst {
  /// The user's ID.
  final String userIdentityId;

  UserJobsFirst({
    required this.userIdentityId,
  });

  Map<String, dynamic> toJson() {
    final userIdentityId = this.userIdentityId;
    return {
      'userIdentityId': userIdentityId,
    };
  }
}

/// The field sorting order and name of the field.
class FieldSortExpression {
  /// The name of the field.
  final String name;

  /// The sort order for the field.
  final SortOrder sortOrder;

  FieldSortExpression({
    required this.name,
    required this.sortOrder,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final sortOrder = this.sortOrder;
    return {
      'name': name,
      'sortOrder': sortOrder.value,
    };
  }
}

/// Organizes parameters according to your specifications.
class ParameterSortExpression {
  /// The parameter name to sort by.
  final String name;

  /// The sort order for the parameter.
  final SortOrder sortOrder;

  ParameterSortExpression({
    required this.name,
    required this.sortOrder,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final sortOrder = this.sortOrder;
    return {
      'name': name,
      'sortOrder': sortOrder.value,
    };
  }
}

class SortOrder {
  static const ascending = SortOrder._('ASCENDING');
  static const descending = SortOrder._('DESCENDING');

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

class LogicalOperator {
  static const and = LogicalOperator._('AND');
  static const or = LogicalOperator._('OR');

  final String value;

  const LogicalOperator._(this.value);

  static const values = [and, or];

  static LogicalOperator fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => LogicalOperator._(value));

  @override
  bool operator ==(other) => other is LogicalOperator && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The type of search filter to apply.
class SearchFilterExpression {
  /// Filters based on date and time.
  final DateTimeFilterExpression? dateTimeFilter;

  /// Filters by group.
  final SearchGroupedFilterExpressions? groupFilter;

  /// Filters by parameter.
  final ParameterFilterExpression? parameterFilter;

  /// Filters by a specified search term.
  final SearchTermFilterExpression? searchTermFilter;

  /// Filters by a string.
  final StringFilterExpression? stringFilter;

  /// Filters by a list of strings.
  final StringListFilterExpression? stringListFilter;

  SearchFilterExpression({
    this.dateTimeFilter,
    this.groupFilter,
    this.parameterFilter,
    this.searchTermFilter,
    this.stringFilter,
    this.stringListFilter,
  });

  Map<String, dynamic> toJson() {
    final dateTimeFilter = this.dateTimeFilter;
    final groupFilter = this.groupFilter;
    final parameterFilter = this.parameterFilter;
    final searchTermFilter = this.searchTermFilter;
    final stringFilter = this.stringFilter;
    final stringListFilter = this.stringListFilter;
    return {
      if (dateTimeFilter != null) 'dateTimeFilter': dateTimeFilter,
      if (groupFilter != null) 'groupFilter': groupFilter,
      if (parameterFilter != null) 'parameterFilter': parameterFilter,
      if (searchTermFilter != null) 'searchTermFilter': searchTermFilter,
      if (stringFilter != null) 'stringFilter': stringFilter,
      if (stringListFilter != null) 'stringListFilter': stringListFilter,
    };
  }
}

/// The time stamp in date-time format.
class DateTimeFilterExpression {
  /// The date and time.
  final DateTime dateTime;

  /// The name of the date-time field to filter on.
  final String name;

  /// The type of comparison to use to filter the results.
  final ComparisonOperator operator;

  DateTimeFilterExpression({
    required this.dateTime,
    required this.name,
    required this.operator,
  });

  Map<String, dynamic> toJson() {
    final dateTime = this.dateTime;
    final name = this.name;
    final operator = this.operator;
    return {
      'dateTime': iso8601ToJson(dateTime),
      'name': name,
      'operator': operator.value,
    };
  }
}

/// The details of a filtered search for parameters.
class ParameterFilterExpression {
  /// The name of the parameter to filter on.
  final String name;

  /// The type of comparison to use to filter results.
  final ComparisonOperator operator;

  /// The parameter's value.
  final String value;

  ParameterFilterExpression({
    required this.name,
    required this.operator,
    required this.value,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final operator = this.operator;
    final value = this.value;
    return {
      'name': name,
      'operator': operator.value,
      'value': value,
    };
  }
}

/// Searches for a particular search term.
class SearchTermFilterExpression {
  /// The term to search for.
  final String searchTerm;

  /// Specifies how Deadline Cloud matches your search term in the results. If you
  /// don't specify a <code>matchType</code> the default is
  /// <code>FUZZY_MATCH</code>.
  ///
  /// <ul>
  /// <li>
  /// <code>FUZZY_MATCH</code> - Matches if a portion of the search term is found
  /// in the result.
  /// </li>
  /// <li>
  /// <code>CONTAINS</code> - Matches if the exact search term is contained in the
  /// result.
  /// </li>
  /// </ul>
  final SearchTermMatchingType? matchType;

  SearchTermFilterExpression({
    required this.searchTerm,
    this.matchType,
  });

  Map<String, dynamic> toJson() {
    final searchTerm = this.searchTerm;
    final matchType = this.matchType;
    return {
      'searchTerm': searchTerm,
      if (matchType != null) 'matchType': matchType.value,
    };
  }
}

/// Searches for a particular string.
class StringFilterExpression {
  /// The field name to search.
  final String name;

  /// The type of comparison to use for this search.
  final ComparisonOperator operator;

  /// The string to search for.
  final String value;

  StringFilterExpression({
    required this.name,
    required this.operator,
    required this.value,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final operator = this.operator;
    final value = this.value;
    return {
      'name': name,
      'operator': operator.value,
      'value': value,
    };
  }
}

/// Searches for a particular list of strings.
class StringListFilterExpression {
  /// The field name to search.
  final String name;

  /// The type of comparison to use for this search.
  final ComparisonOperator operator;

  /// The list of string values to search for.
  final List<String> values;

  StringListFilterExpression({
    required this.name,
    required this.operator,
    required this.values,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final operator = this.operator;
    final values = this.values;
    return {
      'name': name,
      'operator': operator.value,
      'values': values,
    };
  }
}

class ComparisonOperator {
  static const equal = ComparisonOperator._('EQUAL');
  static const notEqual = ComparisonOperator._('NOT_EQUAL');
  static const greaterThanEqualTo =
      ComparisonOperator._('GREATER_THAN_EQUAL_TO');
  static const greaterThan = ComparisonOperator._('GREATER_THAN');
  static const lessThanEqualTo = ComparisonOperator._('LESS_THAN_EQUAL_TO');
  static const lessThan = ComparisonOperator._('LESS_THAN');
  static const anyEquals = ComparisonOperator._('ANY_EQUALS');
  static const allNotEquals = ComparisonOperator._('ALL_NOT_EQUALS');

  final String value;

  const ComparisonOperator._(this.value);

  static const values = [
    equal,
    notEqual,
    greaterThanEqualTo,
    greaterThan,
    lessThanEqualTo,
    lessThan,
    anyEquals,
    allNotEquals
  ];

  static ComparisonOperator fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ComparisonOperator._(value));

  @override
  bool operator ==(other) =>
      other is ComparisonOperator && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class SearchTermMatchingType {
  static const fuzzyMatch = SearchTermMatchingType._('FUZZY_MATCH');
  static const contains = SearchTermMatchingType._('CONTAINS');

  final String value;

  const SearchTermMatchingType._(this.value);

  static const values = [fuzzyMatch, contains];

  static SearchTermMatchingType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SearchTermMatchingType._(value));

  @override
  bool operator ==(other) =>
      other is SearchTermMatchingType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The details of a task search.
class TaskSearchSummary {
  /// The date and time the resource ended running.
  final DateTime? endedAt;

  /// The number of times that the task failed and was retried.
  final int? failureRetryCount;

  /// The job ID.
  final String? jobId;

  /// The latest session action ID for the task.
  final String? latestSessionActionId;

  /// The parameters to search for.
  final Map<String, TaskParameterValue>? parameters;

  /// The queue ID.
  final String? queueId;

  /// The run status of the task.
  final TaskRunStatus? runStatus;

  /// The date and time the resource started running.
  final DateTime? startedAt;

  /// The step ID.
  final String? stepId;

  /// The run status that the task is being updated to.
  final TaskTargetRunStatus? targetRunStatus;

  /// The task ID.
  final String? taskId;

  /// The date and time the resource was updated.
  final DateTime? updatedAt;

  /// The user or system that updated this resource.
  final String? updatedBy;

  TaskSearchSummary({
    this.endedAt,
    this.failureRetryCount,
    this.jobId,
    this.latestSessionActionId,
    this.parameters,
    this.queueId,
    this.runStatus,
    this.startedAt,
    this.stepId,
    this.targetRunStatus,
    this.taskId,
    this.updatedAt,
    this.updatedBy,
  });

  factory TaskSearchSummary.fromJson(Map<String, dynamic> json) {
    return TaskSearchSummary(
      endedAt: timeStampFromJson(json['endedAt']),
      failureRetryCount: json['failureRetryCount'] as int?,
      jobId: json['jobId'] as String?,
      latestSessionActionId: json['latestSessionActionId'] as String?,
      parameters: (json['parameters'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, TaskParameterValue.fromJson(e as Map<String, dynamic>))),
      queueId: json['queueId'] as String?,
      runStatus: (json['runStatus'] as String?)?.let(TaskRunStatus.fromString),
      startedAt: timeStampFromJson(json['startedAt']),
      stepId: json['stepId'] as String?,
      targetRunStatus: (json['targetRunStatus'] as String?)
          ?.let(TaskTargetRunStatus.fromString),
      taskId: json['taskId'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final endedAt = this.endedAt;
    final failureRetryCount = this.failureRetryCount;
    final jobId = this.jobId;
    final latestSessionActionId = this.latestSessionActionId;
    final parameters = this.parameters;
    final queueId = this.queueId;
    final runStatus = this.runStatus;
    final startedAt = this.startedAt;
    final stepId = this.stepId;
    final targetRunStatus = this.targetRunStatus;
    final taskId = this.taskId;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      if (endedAt != null) 'endedAt': iso8601ToJson(endedAt),
      if (failureRetryCount != null) 'failureRetryCount': failureRetryCount,
      if (jobId != null) 'jobId': jobId,
      if (latestSessionActionId != null)
        'latestSessionActionId': latestSessionActionId,
      if (parameters != null) 'parameters': parameters,
      if (queueId != null) 'queueId': queueId,
      if (runStatus != null) 'runStatus': runStatus.value,
      if (startedAt != null) 'startedAt': iso8601ToJson(startedAt),
      if (stepId != null) 'stepId': stepId,
      if (targetRunStatus != null) 'targetRunStatus': targetRunStatus.value,
      if (taskId != null) 'taskId': taskId,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

/// The details of a step search.
class StepSearchSummary {
  /// The date and time the resource was created.
  final DateTime? createdAt;

  /// The user or system that created this resource.
  final String? createdBy;

  /// The date and time the resource ended running.
  final DateTime? endedAt;

  /// The job ID.
  final String? jobId;

  /// The life cycle status.
  final StepLifecycleStatus? lifecycleStatus;

  /// The life cycle status message.
  final String? lifecycleStatusMessage;

  /// The step name.
  final String? name;

  /// The parameters and combination expressions for the search.
  final ParameterSpace? parameterSpace;

  /// The queue ID.
  final String? queueId;

  /// The date and time the resource started running.
  final DateTime? startedAt;

  /// The step ID.
  final String? stepId;

  /// The task status to update the job's tasks to.
  final StepTargetTaskRunStatus? targetTaskRunStatus;

  /// The total number of times tasks from the step failed and were retried.
  final int? taskFailureRetryCount;

  /// The task run status for the job.
  ///
  /// <ul>
  /// <li>
  /// <code>PENDING</code>–pending and waiting for resources.
  /// </li>
  /// <li>
  /// <code>READY</code>–ready to be processed.
  /// </li>
  /// <li>
  /// <code>ASSIGNED</code>–assigned and will run next on a worker.
  /// </li>
  /// <li>
  /// <code>SCHEDULED</code>–scheduled to be run on a worker.
  /// </li>
  /// <li>
  /// <code>INTERRUPTING</code>–being interrupted.
  /// </li>
  /// <li>
  /// <code>RUNNING</code>–running on a worker.
  /// </li>
  /// <li>
  /// <code>SUSPENDED</code>–the task is suspended.
  /// </li>
  /// <li>
  /// <code>CANCELED</code>–the task has been canceled.
  /// </li>
  /// <li>
  /// <code>FAILED</code>–the task has failed.
  /// </li>
  /// <li>
  /// <code>SUCCEEDED</code>–the task has succeeded.
  /// </li>
  /// </ul>
  final TaskRunStatus? taskRunStatus;

  /// The number of tasks running on the job.
  final Map<TaskRunStatus, int>? taskRunStatusCounts;

  /// The date and time the resource was updated.
  final DateTime? updatedAt;

  /// The user or system that updated this resource.
  final String? updatedBy;

  StepSearchSummary({
    this.createdAt,
    this.createdBy,
    this.endedAt,
    this.jobId,
    this.lifecycleStatus,
    this.lifecycleStatusMessage,
    this.name,
    this.parameterSpace,
    this.queueId,
    this.startedAt,
    this.stepId,
    this.targetTaskRunStatus,
    this.taskFailureRetryCount,
    this.taskRunStatus,
    this.taskRunStatusCounts,
    this.updatedAt,
    this.updatedBy,
  });

  factory StepSearchSummary.fromJson(Map<String, dynamic> json) {
    return StepSearchSummary(
      createdAt: timeStampFromJson(json['createdAt']),
      createdBy: json['createdBy'] as String?,
      endedAt: timeStampFromJson(json['endedAt']),
      jobId: json['jobId'] as String?,
      lifecycleStatus: (json['lifecycleStatus'] as String?)
          ?.let(StepLifecycleStatus.fromString),
      lifecycleStatusMessage: json['lifecycleStatusMessage'] as String?,
      name: json['name'] as String?,
      parameterSpace: json['parameterSpace'] != null
          ? ParameterSpace.fromJson(
              json['parameterSpace'] as Map<String, dynamic>)
          : null,
      queueId: json['queueId'] as String?,
      startedAt: timeStampFromJson(json['startedAt']),
      stepId: json['stepId'] as String?,
      targetTaskRunStatus: (json['targetTaskRunStatus'] as String?)
          ?.let(StepTargetTaskRunStatus.fromString),
      taskFailureRetryCount: json['taskFailureRetryCount'] as int?,
      taskRunStatus:
          (json['taskRunStatus'] as String?)?.let(TaskRunStatus.fromString),
      taskRunStatusCounts:
          (json['taskRunStatusCounts'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(TaskRunStatus.fromString(k), e as int)),
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final endedAt = this.endedAt;
    final jobId = this.jobId;
    final lifecycleStatus = this.lifecycleStatus;
    final lifecycleStatusMessage = this.lifecycleStatusMessage;
    final name = this.name;
    final parameterSpace = this.parameterSpace;
    final queueId = this.queueId;
    final startedAt = this.startedAt;
    final stepId = this.stepId;
    final targetTaskRunStatus = this.targetTaskRunStatus;
    final taskFailureRetryCount = this.taskFailureRetryCount;
    final taskRunStatus = this.taskRunStatus;
    final taskRunStatusCounts = this.taskRunStatusCounts;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (createdBy != null) 'createdBy': createdBy,
      if (endedAt != null) 'endedAt': iso8601ToJson(endedAt),
      if (jobId != null) 'jobId': jobId,
      if (lifecycleStatus != null) 'lifecycleStatus': lifecycleStatus.value,
      if (lifecycleStatusMessage != null)
        'lifecycleStatusMessage': lifecycleStatusMessage,
      if (name != null) 'name': name,
      if (parameterSpace != null) 'parameterSpace': parameterSpace,
      if (queueId != null) 'queueId': queueId,
      if (startedAt != null) 'startedAt': iso8601ToJson(startedAt),
      if (stepId != null) 'stepId': stepId,
      if (targetTaskRunStatus != null)
        'targetTaskRunStatus': targetTaskRunStatus.value,
      if (taskFailureRetryCount != null)
        'taskFailureRetryCount': taskFailureRetryCount,
      if (taskRunStatus != null) 'taskRunStatus': taskRunStatus.value,
      if (taskRunStatusCounts != null)
        'taskRunStatusCounts':
            taskRunStatusCounts.map((k, e) => MapEntry(k.value, e)),
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

/// The details of a job search.
class JobSearchSummary {
  /// The date and time the resource was created.
  final DateTime? createdAt;

  /// The user or system that created this resource.
  final String? createdBy;

  /// The date and time the resource ended running.
  final DateTime? endedAt;

  /// The job ID.
  final String? jobId;

  /// The job parameters.
  final Map<String, JobParameter>? jobParameters;

  /// The life cycle status.
  final JobLifecycleStatus? lifecycleStatus;

  /// The life cycle status message.
  final String? lifecycleStatusMessage;

  /// The number of task failures before the job stops running and is marked as
  /// <code>FAILED</code>.
  final int? maxFailedTasksCount;

  /// The maximum number of retries for a job.
  final int? maxRetriesPerTask;

  /// The maximum number of worker hosts that can concurrently process a job. When
  /// the <code>maxWorkerCount</code> is reached, no more workers will be assigned
  /// to process the job, even if the fleets assigned to the job's queue has
  /// available workers.
  ///
  /// You can't set the <code>maxWorkerCount</code> to 0. If you set it to -1,
  /// there is no maximum number of workers.
  ///
  /// If you don't specify the <code>maxWorkerCount</code>, the default is -1.
  final int? maxWorkerCount;

  /// The job name.
  final String? name;

  /// The job priority.
  final int? priority;

  /// The queue ID.
  final String? queueId;

  /// The job ID for the source job.
  final String? sourceJobId;

  /// The date and time the resource started running.
  final DateTime? startedAt;

  /// The task status to update the job's tasks to.
  final JobTargetTaskRunStatus? targetTaskRunStatus;

  /// The total number of times tasks from the job failed and were retried.
  final int? taskFailureRetryCount;

  /// The task run status for the job.
  ///
  /// <ul>
  /// <li>
  /// <code>PENDING</code>–pending and waiting for resources.
  /// </li>
  /// <li>
  /// <code>READY</code>–ready to be processed.
  /// </li>
  /// <li>
  /// <code>ASSIGNED</code>–assigned and will run next on a worker.
  /// </li>
  /// <li>
  /// <code>SCHEDULED</code>–scheduled to be run on a worker.
  /// </li>
  /// <li>
  /// <code>INTERRUPTING</code>–being interrupted.
  /// </li>
  /// <li>
  /// <code>RUNNING</code>–running on a worker.
  /// </li>
  /// <li>
  /// <code>SUSPENDED</code>–the task is suspended.
  /// </li>
  /// <li>
  /// <code>CANCELED</code>–the task has been canceled.
  /// </li>
  /// <li>
  /// <code>FAILED</code>–the task has failed.
  /// </li>
  /// <li>
  /// <code>SUCCEEDED</code>–the task has succeeded.
  /// </li>
  /// </ul>
  final TaskRunStatus? taskRunStatus;

  /// The number of tasks running on the job.
  final Map<TaskRunStatus, int>? taskRunStatusCounts;

  /// The date and time the resource was updated.
  final DateTime? updatedAt;

  /// The user or system that updated this resource.
  final String? updatedBy;

  JobSearchSummary({
    this.createdAt,
    this.createdBy,
    this.endedAt,
    this.jobId,
    this.jobParameters,
    this.lifecycleStatus,
    this.lifecycleStatusMessage,
    this.maxFailedTasksCount,
    this.maxRetriesPerTask,
    this.maxWorkerCount,
    this.name,
    this.priority,
    this.queueId,
    this.sourceJobId,
    this.startedAt,
    this.targetTaskRunStatus,
    this.taskFailureRetryCount,
    this.taskRunStatus,
    this.taskRunStatusCounts,
    this.updatedAt,
    this.updatedBy,
  });

  factory JobSearchSummary.fromJson(Map<String, dynamic> json) {
    return JobSearchSummary(
      createdAt: timeStampFromJson(json['createdAt']),
      createdBy: json['createdBy'] as String?,
      endedAt: timeStampFromJson(json['endedAt']),
      jobId: json['jobId'] as String?,
      jobParameters: (json['jobParameters'] as Map<String, dynamic>?)?.map(
          (k, e) =>
              MapEntry(k, JobParameter.fromJson(e as Map<String, dynamic>))),
      lifecycleStatus: (json['lifecycleStatus'] as String?)
          ?.let(JobLifecycleStatus.fromString),
      lifecycleStatusMessage: json['lifecycleStatusMessage'] as String?,
      maxFailedTasksCount: json['maxFailedTasksCount'] as int?,
      maxRetriesPerTask: json['maxRetriesPerTask'] as int?,
      maxWorkerCount: json['maxWorkerCount'] as int?,
      name: json['name'] as String?,
      priority: json['priority'] as int?,
      queueId: json['queueId'] as String?,
      sourceJobId: json['sourceJobId'] as String?,
      startedAt: timeStampFromJson(json['startedAt']),
      targetTaskRunStatus: (json['targetTaskRunStatus'] as String?)
          ?.let(JobTargetTaskRunStatus.fromString),
      taskFailureRetryCount: json['taskFailureRetryCount'] as int?,
      taskRunStatus:
          (json['taskRunStatus'] as String?)?.let(TaskRunStatus.fromString),
      taskRunStatusCounts:
          (json['taskRunStatusCounts'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(TaskRunStatus.fromString(k), e as int)),
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final endedAt = this.endedAt;
    final jobId = this.jobId;
    final jobParameters = this.jobParameters;
    final lifecycleStatus = this.lifecycleStatus;
    final lifecycleStatusMessage = this.lifecycleStatusMessage;
    final maxFailedTasksCount = this.maxFailedTasksCount;
    final maxRetriesPerTask = this.maxRetriesPerTask;
    final maxWorkerCount = this.maxWorkerCount;
    final name = this.name;
    final priority = this.priority;
    final queueId = this.queueId;
    final sourceJobId = this.sourceJobId;
    final startedAt = this.startedAt;
    final targetTaskRunStatus = this.targetTaskRunStatus;
    final taskFailureRetryCount = this.taskFailureRetryCount;
    final taskRunStatus = this.taskRunStatus;
    final taskRunStatusCounts = this.taskRunStatusCounts;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (createdBy != null) 'createdBy': createdBy,
      if (endedAt != null) 'endedAt': iso8601ToJson(endedAt),
      if (jobId != null) 'jobId': jobId,
      if (jobParameters != null) 'jobParameters': jobParameters,
      if (lifecycleStatus != null) 'lifecycleStatus': lifecycleStatus.value,
      if (lifecycleStatusMessage != null)
        'lifecycleStatusMessage': lifecycleStatusMessage,
      if (maxFailedTasksCount != null)
        'maxFailedTasksCount': maxFailedTasksCount,
      if (maxRetriesPerTask != null) 'maxRetriesPerTask': maxRetriesPerTask,
      if (maxWorkerCount != null) 'maxWorkerCount': maxWorkerCount,
      if (name != null) 'name': name,
      if (priority != null) 'priority': priority,
      if (queueId != null) 'queueId': queueId,
      if (sourceJobId != null) 'sourceJobId': sourceJobId,
      if (startedAt != null) 'startedAt': iso8601ToJson(startedAt),
      if (targetTaskRunStatus != null)
        'targetTaskRunStatus': targetTaskRunStatus.value,
      if (taskFailureRetryCount != null)
        'taskFailureRetryCount': taskFailureRetryCount,
      if (taskRunStatus != null) 'taskRunStatus': taskRunStatus.value,
      if (taskRunStatusCounts != null)
        'taskRunStatusCounts':
            taskRunStatusCounts.map((k, e) => MapEntry(k.value, e)),
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

/// Provides information about the association between a queue and a limit.
class QueueLimitAssociationSummary {
  /// The Unix timestamp of the date and time that the association was created.
  final DateTime createdAt;

  /// The user identifier of the person that created the association.
  final String createdBy;

  /// The unique identifier of the limit in the association.
  final String limitId;

  /// The unique identifier of the queue in the association.
  final String queueId;

  /// The status of task scheduling in the queue-limit association.
  ///
  /// <ul>
  /// <li>
  /// <code>ACTIVE</code> - Association is active.
  /// </li>
  /// <li>
  /// <code>STOP_LIMIT_USAGE_AND_COMPLETE_TASKS</code> - Association has stopped
  /// scheduling new tasks and is completing current tasks.
  /// </li>
  /// <li>
  /// <code>STOP_LIMIT_USAGE_AND_CANCEL_TASKS</code> - Association has stopped
  /// scheduling new tasks and is canceling current tasks.
  /// </li>
  /// <li>
  /// <code>STOPPED</code> - Association has been stopped.
  /// </li>
  /// </ul>
  final QueueLimitAssociationStatus status;

  /// The Unix timestamp of the date and time that the association was last
  /// updated.
  final DateTime? updatedAt;

  /// The user identifier of the person that updated the association.
  final String? updatedBy;

  QueueLimitAssociationSummary({
    required this.createdAt,
    required this.createdBy,
    required this.limitId,
    required this.queueId,
    required this.status,
    this.updatedAt,
    this.updatedBy,
  });

  factory QueueLimitAssociationSummary.fromJson(Map<String, dynamic> json) {
    return QueueLimitAssociationSummary(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      createdBy: (json['createdBy'] as String?) ?? '',
      limitId: (json['limitId'] as String?) ?? '',
      queueId: (json['queueId'] as String?) ?? '',
      status: QueueLimitAssociationStatus.fromString(
          (json['status'] as String?) ?? ''),
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final limitId = this.limitId;
    final queueId = this.queueId;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'createdBy': createdBy,
      'limitId': limitId,
      'queueId': queueId,
      'status': status.value,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

class QueueLimitAssociationStatus {
  static const active = QueueLimitAssociationStatus._('ACTIVE');
  static const stopLimitUsageAndCompleteTasks =
      QueueLimitAssociationStatus._('STOP_LIMIT_USAGE_AND_COMPLETE_TASKS');
  static const stopLimitUsageAndCancelTasks =
      QueueLimitAssociationStatus._('STOP_LIMIT_USAGE_AND_CANCEL_TASKS');
  static const stopped = QueueLimitAssociationStatus._('STOPPED');

  final String value;

  const QueueLimitAssociationStatus._(this.value);

  static const values = [
    active,
    stopLimitUsageAndCompleteTasks,
    stopLimitUsageAndCancelTasks,
    stopped
  ];

  static QueueLimitAssociationStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => QueueLimitAssociationStatus._(value));

  @override
  bool operator ==(other) =>
      other is QueueLimitAssociationStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The details of a queue-fleet association.
class QueueFleetAssociationSummary {
  /// The date and time the resource was created.
  final DateTime createdAt;

  /// The user or system that created this resource.
  final String createdBy;

  /// The fleet ID.
  final String fleetId;

  /// The queue ID.
  final String queueId;

  /// The status of task scheduling in the queue-fleet association.
  ///
  /// <ul>
  /// <li>
  /// <code>ACTIVE</code>–Association is active.
  /// </li>
  /// <li>
  /// <code>STOP_SCHEDULING_AND_COMPLETE_TASKS</code>–Association has stopped
  /// scheduling new tasks and is completing current tasks.
  /// </li>
  /// <li>
  /// <code>STOP_SCHEDULING_AND_CANCEL_TASKS</code>–Association has stopped
  /// scheduling new tasks and is canceling current tasks.
  /// </li>
  /// <li>
  /// <code>STOPPED</code>–Association has been stopped.
  /// </li>
  /// </ul>
  final QueueFleetAssociationStatus status;

  /// The date and time the resource was updated.
  final DateTime? updatedAt;

  /// The user or system that updated this resource.
  final String? updatedBy;

  QueueFleetAssociationSummary({
    required this.createdAt,
    required this.createdBy,
    required this.fleetId,
    required this.queueId,
    required this.status,
    this.updatedAt,
    this.updatedBy,
  });

  factory QueueFleetAssociationSummary.fromJson(Map<String, dynamic> json) {
    return QueueFleetAssociationSummary(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      createdBy: (json['createdBy'] as String?) ?? '',
      fleetId: (json['fleetId'] as String?) ?? '',
      queueId: (json['queueId'] as String?) ?? '',
      status: QueueFleetAssociationStatus.fromString(
          (json['status'] as String?) ?? ''),
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final fleetId = this.fleetId;
    final queueId = this.queueId;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'createdBy': createdBy,
      'fleetId': fleetId,
      'queueId': queueId,
      'status': status.value,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

class QueueFleetAssociationStatus {
  static const active = QueueFleetAssociationStatus._('ACTIVE');
  static const stopSchedulingAndCompleteTasks =
      QueueFleetAssociationStatus._('STOP_SCHEDULING_AND_COMPLETE_TASKS');
  static const stopSchedulingAndCancelTasks =
      QueueFleetAssociationStatus._('STOP_SCHEDULING_AND_CANCEL_TASKS');
  static const stopped = QueueFleetAssociationStatus._('STOPPED');

  final String value;

  const QueueFleetAssociationStatus._(this.value);

  static const values = [
    active,
    stopSchedulingAndCompleteTasks,
    stopSchedulingAndCancelTasks,
    stopped
  ];

  static QueueFleetAssociationStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => QueueFleetAssociationStatus._(value));

  @override
  bool operator ==(other) =>
      other is QueueFleetAssociationStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class SessionsStatisticsAggregationStatus {
  static const inProgress =
      SessionsStatisticsAggregationStatus._('IN_PROGRESS');
  static const timeout = SessionsStatisticsAggregationStatus._('TIMEOUT');
  static const failed = SessionsStatisticsAggregationStatus._('FAILED');
  static const completed = SessionsStatisticsAggregationStatus._('COMPLETED');

  final String value;

  const SessionsStatisticsAggregationStatus._(this.value);

  static const values = [inProgress, timeout, failed, completed];

  static SessionsStatisticsAggregationStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SessionsStatisticsAggregationStatus._(value));

  @override
  bool operator ==(other) =>
      other is SessionsStatisticsAggregationStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A list of statistics for a session.
class Statistics {
  /// How the statistics should appear in USD. Options include: minimum, maximum,
  /// average or sum.
  final Stats costInUsd;

  /// The number of instances in a list of statistics.
  final int count;

  /// The total aggregated runtime.
  final Stats runtimeInSeconds;

  /// The end time for the aggregation.
  final DateTime? aggregationEndTime;

  /// The start time for the aggregation.
  final DateTime? aggregationStartTime;

  /// The fleet ID.
  final String? fleetId;

  /// The type of instance.
  final String? instanceType;

  /// The job ID.
  final String? jobId;

  /// The job name.
  final String? jobName;

  /// The licensed product.
  final String? licenseProduct;

  /// The queue ID.
  final String? queueId;

  /// The type of usage for the statistics.
  final UsageType? usageType;

  /// The user ID.
  final String? userId;

  Statistics({
    required this.costInUsd,
    required this.count,
    required this.runtimeInSeconds,
    this.aggregationEndTime,
    this.aggregationStartTime,
    this.fleetId,
    this.instanceType,
    this.jobId,
    this.jobName,
    this.licenseProduct,
    this.queueId,
    this.usageType,
    this.userId,
  });

  factory Statistics.fromJson(Map<String, dynamic> json) {
    return Statistics(
      costInUsd: Stats.fromJson((json['costInUsd'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
      count: (json['count'] as int?) ?? 0,
      runtimeInSeconds: Stats.fromJson(
          (json['runtimeInSeconds'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      aggregationEndTime: timeStampFromJson(json['aggregationEndTime']),
      aggregationStartTime: timeStampFromJson(json['aggregationStartTime']),
      fleetId: json['fleetId'] as String?,
      instanceType: json['instanceType'] as String?,
      jobId: json['jobId'] as String?,
      jobName: json['jobName'] as String?,
      licenseProduct: json['licenseProduct'] as String?,
      queueId: json['queueId'] as String?,
      usageType: (json['usageType'] as String?)?.let(UsageType.fromString),
      userId: json['userId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final costInUsd = this.costInUsd;
    final count = this.count;
    final runtimeInSeconds = this.runtimeInSeconds;
    final aggregationEndTime = this.aggregationEndTime;
    final aggregationStartTime = this.aggregationStartTime;
    final fleetId = this.fleetId;
    final instanceType = this.instanceType;
    final jobId = this.jobId;
    final jobName = this.jobName;
    final licenseProduct = this.licenseProduct;
    final queueId = this.queueId;
    final usageType = this.usageType;
    final userId = this.userId;
    return {
      'costInUsd': costInUsd,
      'count': count,
      'runtimeInSeconds': runtimeInSeconds,
      if (aggregationEndTime != null)
        'aggregationEndTime': iso8601ToJson(aggregationEndTime),
      if (aggregationStartTime != null)
        'aggregationStartTime': iso8601ToJson(aggregationStartTime),
      if (fleetId != null) 'fleetId': fleetId,
      if (instanceType != null) 'instanceType': instanceType,
      if (jobId != null) 'jobId': jobId,
      if (jobName != null) 'jobName': jobName,
      if (licenseProduct != null) 'licenseProduct': licenseProduct,
      if (queueId != null) 'queueId': queueId,
      if (usageType != null) 'usageType': usageType.value,
      if (userId != null) 'userId': userId,
    };
  }
}

class UsageType {
  static const compute = UsageType._('COMPUTE');
  static const license = UsageType._('LICENSE');

  final String value;

  const UsageType._(this.value);

  static const values = [compute, license];

  static UsageType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => UsageType._(value));

  @override
  bool operator ==(other) => other is UsageType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The minimum, maximum, average, and sum.
class Stats {
  /// The average of the usage statistics.
  final double? avg;

  /// The maximum among the usage statistics.
  final double? max;

  /// The minimum of the usage statistics.
  final double? min;

  /// The sum of the usage statistics.
  final double? sum;

  Stats({
    this.avg,
    this.max,
    this.min,
    this.sum,
  });

  factory Stats.fromJson(Map<String, dynamic> json) {
    return Stats(
      avg: json['avg'] as double?,
      max: json['max'] as double?,
      min: json['min'] as double?,
      sum: json['sum'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final avg = this.avg;
    final max = this.max;
    final min = this.min;
    final sum = this.sum;
    return {
      if (avg != null) 'avg': avg,
      if (max != null) 'max': max,
      if (min != null) 'min': min,
      if (sum != null) 'sum': sum,
    };
  }
}

/// The error details for a task that could not be updated in a batch update
/// operation.
class BatchUpdateTaskError {
  /// The error code.
  final BatchUpdateTaskErrorCode code;

  /// The farm ID of the task that could not be updated.
  final String farmId;

  /// The job ID of the task that could not be updated.
  final String jobId;

  /// The error message.
  final String message;

  /// The queue ID of the task that could not be updated.
  final String queueId;

  /// The step ID of the task that could not be updated.
  final String stepId;

  /// The task ID of the task that could not be updated.
  final String taskId;

  BatchUpdateTaskError({
    required this.code,
    required this.farmId,
    required this.jobId,
    required this.message,
    required this.queueId,
    required this.stepId,
    required this.taskId,
  });

  factory BatchUpdateTaskError.fromJson(Map<String, dynamic> json) {
    return BatchUpdateTaskError(
      code:
          BatchUpdateTaskErrorCode.fromString((json['code'] as String?) ?? ''),
      farmId: (json['farmId'] as String?) ?? '',
      jobId: (json['jobId'] as String?) ?? '',
      message: (json['message'] as String?) ?? '',
      queueId: (json['queueId'] as String?) ?? '',
      stepId: (json['stepId'] as String?) ?? '',
      taskId: (json['taskId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final farmId = this.farmId;
    final jobId = this.jobId;
    final message = this.message;
    final queueId = this.queueId;
    final stepId = this.stepId;
    final taskId = this.taskId;
    return {
      'code': code.value,
      'farmId': farmId,
      'jobId': jobId,
      'message': message,
      'queueId': queueId,
      'stepId': stepId,
      'taskId': taskId,
    };
  }
}

class BatchUpdateTaskErrorCode {
  static const conflictException =
      BatchUpdateTaskErrorCode._('ConflictException');
  static const internalServerErrorException =
      BatchUpdateTaskErrorCode._('InternalServerErrorException');
  static const resourceNotFoundException =
      BatchUpdateTaskErrorCode._('ResourceNotFoundException');
  static const validationException =
      BatchUpdateTaskErrorCode._('ValidationException');
  static const accessDeniedException =
      BatchUpdateTaskErrorCode._('AccessDeniedException');
  static const throttlingException =
      BatchUpdateTaskErrorCode._('ThrottlingException');

  final String value;

  const BatchUpdateTaskErrorCode._(this.value);

  static const values = [
    conflictException,
    internalServerErrorException,
    resourceNotFoundException,
    validationException,
    accessDeniedException,
    throttlingException
  ];

  static BatchUpdateTaskErrorCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => BatchUpdateTaskErrorCode._(value));

  @override
  bool operator ==(other) =>
      other is BatchUpdateTaskErrorCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The details of a task to update in a batch update operation.
class BatchUpdateTaskItem {
  /// The farm ID of the task to update.
  final String farmId;

  /// The job ID of the task to update.
  final String jobId;

  /// The queue ID of the task to update.
  final String queueId;

  /// The step ID of the task to update.
  final String stepId;

  /// The run status with which to start the task.
  final TaskTargetRunStatus targetRunStatus;

  /// The task ID of the task to update.
  final String taskId;

  BatchUpdateTaskItem({
    required this.farmId,
    required this.jobId,
    required this.queueId,
    required this.stepId,
    required this.targetRunStatus,
    required this.taskId,
  });

  Map<String, dynamic> toJson() {
    final farmId = this.farmId;
    final jobId = this.jobId;
    final queueId = this.queueId;
    final stepId = this.stepId;
    final targetRunStatus = this.targetRunStatus;
    final taskId = this.taskId;
    return {
      'farmId': farmId,
      'jobId': jobId,
      'queueId': queueId,
      'stepId': stepId,
      'targetRunStatus': targetRunStatus.value,
      'taskId': taskId,
    };
  }
}

/// The error details for a job that could not be updated in a batch update
/// operation.
class BatchUpdateJobError {
  /// The error code.
  final BatchUpdateJobErrorCode code;

  /// The farm ID of the job that could not be updated.
  final String farmId;

  /// The job ID of the job that could not be updated.
  final String jobId;

  /// The error message.
  final String message;

  /// The queue ID of the job that could not be updated.
  final String queueId;

  BatchUpdateJobError({
    required this.code,
    required this.farmId,
    required this.jobId,
    required this.message,
    required this.queueId,
  });

  factory BatchUpdateJobError.fromJson(Map<String, dynamic> json) {
    return BatchUpdateJobError(
      code: BatchUpdateJobErrorCode.fromString((json['code'] as String?) ?? ''),
      farmId: (json['farmId'] as String?) ?? '',
      jobId: (json['jobId'] as String?) ?? '',
      message: (json['message'] as String?) ?? '',
      queueId: (json['queueId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final farmId = this.farmId;
    final jobId = this.jobId;
    final message = this.message;
    final queueId = this.queueId;
    return {
      'code': code.value,
      'farmId': farmId,
      'jobId': jobId,
      'message': message,
      'queueId': queueId,
    };
  }
}

class BatchUpdateJobErrorCode {
  static const conflictException =
      BatchUpdateJobErrorCode._('ConflictException');
  static const internalServerErrorException =
      BatchUpdateJobErrorCode._('InternalServerErrorException');
  static const resourceNotFoundException =
      BatchUpdateJobErrorCode._('ResourceNotFoundException');
  static const validationException =
      BatchUpdateJobErrorCode._('ValidationException');
  static const accessDeniedException =
      BatchUpdateJobErrorCode._('AccessDeniedException');
  static const throttlingException =
      BatchUpdateJobErrorCode._('ThrottlingException');

  final String value;

  const BatchUpdateJobErrorCode._(this.value);

  static const values = [
    conflictException,
    internalServerErrorException,
    resourceNotFoundException,
    validationException,
    accessDeniedException,
    throttlingException
  ];

  static BatchUpdateJobErrorCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => BatchUpdateJobErrorCode._(value));

  @override
  bool operator ==(other) =>
      other is BatchUpdateJobErrorCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The details of a job to update in a batch update operation.
class BatchUpdateJobItem {
  /// The farm ID of the job to update.
  final String farmId;

  /// The job ID of the job to update.
  final String jobId;

  /// The queue ID of the job to update.
  final String queueId;

  /// The description of the job to update.
  final String? description;

  /// The status of a job in its lifecycle. When you change the status of the job
  /// to <code>ARCHIVED</code>, the job can't be scheduled or archived.
  /// <important>
  /// An archived job and its steps and tasks are deleted after 120 days. The job
  /// can't be recovered.
  /// </important>
  final UpdateJobLifecycleStatus? lifecycleStatus;

  /// The number of task failures before the job stops running and is marked as
  /// <code>FAILED</code>.
  final int? maxFailedTasksCount;

  /// The maximum number of retries per failed tasks.
  final int? maxRetriesPerTask;

  /// The maximum number of worker hosts that can concurrently process a job.
  final int? maxWorkerCount;

  /// The name of the job to update.
  final String? name;

  /// The job priority to update.
  final int? priority;

  /// The task status to update the job's tasks to.
  final JobTargetTaskRunStatus? targetTaskRunStatus;

  BatchUpdateJobItem({
    required this.farmId,
    required this.jobId,
    required this.queueId,
    this.description,
    this.lifecycleStatus,
    this.maxFailedTasksCount,
    this.maxRetriesPerTask,
    this.maxWorkerCount,
    this.name,
    this.priority,
    this.targetTaskRunStatus,
  });

  Map<String, dynamic> toJson() {
    final farmId = this.farmId;
    final jobId = this.jobId;
    final queueId = this.queueId;
    final description = this.description;
    final lifecycleStatus = this.lifecycleStatus;
    final maxFailedTasksCount = this.maxFailedTasksCount;
    final maxRetriesPerTask = this.maxRetriesPerTask;
    final maxWorkerCount = this.maxWorkerCount;
    final name = this.name;
    final priority = this.priority;
    final targetTaskRunStatus = this.targetTaskRunStatus;
    return {
      'farmId': farmId,
      'jobId': jobId,
      'queueId': queueId,
      if (description != null) 'description': description,
      if (lifecycleStatus != null) 'lifecycleStatus': lifecycleStatus.value,
      if (maxFailedTasksCount != null)
        'maxFailedTasksCount': maxFailedTasksCount,
      if (maxRetriesPerTask != null) 'maxRetriesPerTask': maxRetriesPerTask,
      if (maxWorkerCount != null) 'maxWorkerCount': maxWorkerCount,
      if (name != null) 'name': name,
      if (priority != null) 'priority': priority,
      if (targetTaskRunStatus != null)
        'targetTaskRunStatus': targetTaskRunStatus.value,
    };
  }
}

/// The error details for a worker that could not be retrieved in a batch get
/// operation.
class BatchGetWorkerError {
  /// The error code.
  final BatchGetWorkerErrorCode code;

  /// The farm ID of the worker that could not be retrieved.
  final String farmId;

  /// The fleet ID of the worker that could not be retrieved.
  final String fleetId;

  /// The error message.
  final String message;

  /// The worker ID of the worker that could not be retrieved.
  final String workerId;

  BatchGetWorkerError({
    required this.code,
    required this.farmId,
    required this.fleetId,
    required this.message,
    required this.workerId,
  });

  factory BatchGetWorkerError.fromJson(Map<String, dynamic> json) {
    return BatchGetWorkerError(
      code: BatchGetWorkerErrorCode.fromString((json['code'] as String?) ?? ''),
      farmId: (json['farmId'] as String?) ?? '',
      fleetId: (json['fleetId'] as String?) ?? '',
      message: (json['message'] as String?) ?? '',
      workerId: (json['workerId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final farmId = this.farmId;
    final fleetId = this.fleetId;
    final message = this.message;
    final workerId = this.workerId;
    return {
      'code': code.value,
      'farmId': farmId,
      'fleetId': fleetId,
      'message': message,
      'workerId': workerId,
    };
  }
}

class BatchGetWorkerErrorCode {
  static const internalServerErrorException =
      BatchGetWorkerErrorCode._('InternalServerErrorException');
  static const resourceNotFoundException =
      BatchGetWorkerErrorCode._('ResourceNotFoundException');
  static const validationException =
      BatchGetWorkerErrorCode._('ValidationException');

  final String value;

  const BatchGetWorkerErrorCode._(this.value);

  static const values = [
    internalServerErrorException,
    resourceNotFoundException,
    validationException
  ];

  static BatchGetWorkerErrorCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => BatchGetWorkerErrorCode._(value));

  @override
  bool operator ==(other) =>
      other is BatchGetWorkerErrorCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The details of a worker returned in a batch get operation.
class BatchGetWorkerItem {
  /// The date and time the resource was created.
  final DateTime createdAt;

  /// The user or system that created this resource.
  final String createdBy;

  /// The farm ID of the worker.
  final String farmId;

  /// The fleet ID of the worker.
  final String fleetId;

  /// The status of the worker.
  final WorkerStatus status;

  /// The worker ID.
  final String workerId;

  /// The host properties for the worker.
  final HostPropertiesResponse? hostProperties;

  /// The log configuration for the worker.
  final LogConfiguration? log;

  /// The date and time the resource was updated.
  final DateTime? updatedAt;

  /// The user or system that updated this resource.
  final String? updatedBy;

  BatchGetWorkerItem({
    required this.createdAt,
    required this.createdBy,
    required this.farmId,
    required this.fleetId,
    required this.status,
    required this.workerId,
    this.hostProperties,
    this.log,
    this.updatedAt,
    this.updatedBy,
  });

  factory BatchGetWorkerItem.fromJson(Map<String, dynamic> json) {
    return BatchGetWorkerItem(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      createdBy: (json['createdBy'] as String?) ?? '',
      farmId: (json['farmId'] as String?) ?? '',
      fleetId: (json['fleetId'] as String?) ?? '',
      status: WorkerStatus.fromString((json['status'] as String?) ?? ''),
      workerId: (json['workerId'] as String?) ?? '',
      hostProperties: json['hostProperties'] != null
          ? HostPropertiesResponse.fromJson(
              json['hostProperties'] as Map<String, dynamic>)
          : null,
      log: json['log'] != null
          ? LogConfiguration.fromJson(json['log'] as Map<String, dynamic>)
          : null,
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final farmId = this.farmId;
    final fleetId = this.fleetId;
    final status = this.status;
    final workerId = this.workerId;
    final hostProperties = this.hostProperties;
    final log = this.log;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'createdBy': createdBy,
      'farmId': farmId,
      'fleetId': fleetId,
      'status': status.value,
      'workerId': workerId,
      if (hostProperties != null) 'hostProperties': hostProperties,
      if (log != null) 'log': log,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

/// The identifiers for a worker.
class BatchGetWorkerIdentifier {
  /// The farm ID of the worker.
  final String farmId;

  /// The fleet ID of the worker.
  final String fleetId;

  /// The worker ID.
  final String workerId;

  BatchGetWorkerIdentifier({
    required this.farmId,
    required this.fleetId,
    required this.workerId,
  });

  Map<String, dynamic> toJson() {
    final farmId = this.farmId;
    final fleetId = this.fleetId;
    final workerId = this.workerId;
    return {
      'farmId': farmId,
      'fleetId': fleetId,
      'workerId': workerId,
    };
  }
}

/// The error details for a task that could not be retrieved in a batch get
/// operation.
class BatchGetTaskError {
  /// The error code.
  final BatchGetTaskErrorCode code;

  /// The farm ID of the task that could not be retrieved.
  final String farmId;

  /// The job ID of the task that could not be retrieved.
  final String jobId;

  /// The error message.
  final String message;

  /// The queue ID of the task that could not be retrieved.
  final String queueId;

  /// The step ID of the task that could not be retrieved.
  final String stepId;

  /// The task ID of the task that could not be retrieved.
  final String taskId;

  BatchGetTaskError({
    required this.code,
    required this.farmId,
    required this.jobId,
    required this.message,
    required this.queueId,
    required this.stepId,
    required this.taskId,
  });

  factory BatchGetTaskError.fromJson(Map<String, dynamic> json) {
    return BatchGetTaskError(
      code: BatchGetTaskErrorCode.fromString((json['code'] as String?) ?? ''),
      farmId: (json['farmId'] as String?) ?? '',
      jobId: (json['jobId'] as String?) ?? '',
      message: (json['message'] as String?) ?? '',
      queueId: (json['queueId'] as String?) ?? '',
      stepId: (json['stepId'] as String?) ?? '',
      taskId: (json['taskId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final farmId = this.farmId;
    final jobId = this.jobId;
    final message = this.message;
    final queueId = this.queueId;
    final stepId = this.stepId;
    final taskId = this.taskId;
    return {
      'code': code.value,
      'farmId': farmId,
      'jobId': jobId,
      'message': message,
      'queueId': queueId,
      'stepId': stepId,
      'taskId': taskId,
    };
  }
}

class BatchGetTaskErrorCode {
  static const internalServerErrorException =
      BatchGetTaskErrorCode._('InternalServerErrorException');
  static const resourceNotFoundException =
      BatchGetTaskErrorCode._('ResourceNotFoundException');
  static const validationException =
      BatchGetTaskErrorCode._('ValidationException');
  static const accessDeniedException =
      BatchGetTaskErrorCode._('AccessDeniedException');
  static const throttlingException =
      BatchGetTaskErrorCode._('ThrottlingException');

  final String value;

  const BatchGetTaskErrorCode._(this.value);

  static const values = [
    internalServerErrorException,
    resourceNotFoundException,
    validationException,
    accessDeniedException,
    throttlingException
  ];

  static BatchGetTaskErrorCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => BatchGetTaskErrorCode._(value));

  @override
  bool operator ==(other) =>
      other is BatchGetTaskErrorCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The details of a task returned in a batch get operation.
class BatchGetTaskItem {
  /// The date and time the resource was created.
  final DateTime createdAt;

  /// The user or system that created this resource.
  final String createdBy;

  /// The farm ID of the task.
  final String farmId;

  /// The job ID of the task.
  final String jobId;

  /// The queue ID of the task.
  final String queueId;

  /// The run status of the task.
  final TaskRunStatus runStatus;

  /// The step ID of the task.
  final String stepId;

  /// The task ID.
  final String taskId;

  /// The date and time the resource ended running.
  final DateTime? endedAt;

  /// The number of times the task failed and was retried.
  final int? failureRetryCount;

  /// The latest session action for the task.
  final String? latestSessionActionId;

  /// The parameters for the task.
  final Map<String, TaskParameterValue>? parameters;

  /// The date and time the resource started running.
  final DateTime? startedAt;

  /// The run status with which to start the task.
  final TaskTargetRunStatus? targetRunStatus;

  /// The date and time the resource was updated.
  final DateTime? updatedAt;

  /// The user or system that updated this resource.
  final String? updatedBy;

  BatchGetTaskItem({
    required this.createdAt,
    required this.createdBy,
    required this.farmId,
    required this.jobId,
    required this.queueId,
    required this.runStatus,
    required this.stepId,
    required this.taskId,
    this.endedAt,
    this.failureRetryCount,
    this.latestSessionActionId,
    this.parameters,
    this.startedAt,
    this.targetRunStatus,
    this.updatedAt,
    this.updatedBy,
  });

  factory BatchGetTaskItem.fromJson(Map<String, dynamic> json) {
    return BatchGetTaskItem(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      createdBy: (json['createdBy'] as String?) ?? '',
      farmId: (json['farmId'] as String?) ?? '',
      jobId: (json['jobId'] as String?) ?? '',
      queueId: (json['queueId'] as String?) ?? '',
      runStatus: TaskRunStatus.fromString((json['runStatus'] as String?) ?? ''),
      stepId: (json['stepId'] as String?) ?? '',
      taskId: (json['taskId'] as String?) ?? '',
      endedAt: timeStampFromJson(json['endedAt']),
      failureRetryCount: json['failureRetryCount'] as int?,
      latestSessionActionId: json['latestSessionActionId'] as String?,
      parameters: (json['parameters'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, TaskParameterValue.fromJson(e as Map<String, dynamic>))),
      startedAt: timeStampFromJson(json['startedAt']),
      targetRunStatus: (json['targetRunStatus'] as String?)
          ?.let(TaskTargetRunStatus.fromString),
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final farmId = this.farmId;
    final jobId = this.jobId;
    final queueId = this.queueId;
    final runStatus = this.runStatus;
    final stepId = this.stepId;
    final taskId = this.taskId;
    final endedAt = this.endedAt;
    final failureRetryCount = this.failureRetryCount;
    final latestSessionActionId = this.latestSessionActionId;
    final parameters = this.parameters;
    final startedAt = this.startedAt;
    final targetRunStatus = this.targetRunStatus;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'createdBy': createdBy,
      'farmId': farmId,
      'jobId': jobId,
      'queueId': queueId,
      'runStatus': runStatus.value,
      'stepId': stepId,
      'taskId': taskId,
      if (endedAt != null) 'endedAt': iso8601ToJson(endedAt),
      if (failureRetryCount != null) 'failureRetryCount': failureRetryCount,
      if (latestSessionActionId != null)
        'latestSessionActionId': latestSessionActionId,
      if (parameters != null) 'parameters': parameters,
      if (startedAt != null) 'startedAt': iso8601ToJson(startedAt),
      if (targetRunStatus != null) 'targetRunStatus': targetRunStatus.value,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

/// The identifiers for a task.
class BatchGetTaskIdentifier {
  /// The farm ID of the task.
  final String farmId;

  /// The job ID of the task.
  final String jobId;

  /// The queue ID of the task.
  final String queueId;

  /// The step ID of the task.
  final String stepId;

  /// The task ID.
  final String taskId;

  BatchGetTaskIdentifier({
    required this.farmId,
    required this.jobId,
    required this.queueId,
    required this.stepId,
    required this.taskId,
  });

  Map<String, dynamic> toJson() {
    final farmId = this.farmId;
    final jobId = this.jobId;
    final queueId = this.queueId;
    final stepId = this.stepId;
    final taskId = this.taskId;
    return {
      'farmId': farmId,
      'jobId': jobId,
      'queueId': queueId,
      'stepId': stepId,
      'taskId': taskId,
    };
  }
}

/// The error details for a step that could not be retrieved in a batch get
/// operation.
class BatchGetStepError {
  /// The error code.
  final BatchGetStepErrorCode code;

  /// The farm ID of the step that could not be retrieved.
  final String farmId;

  /// The job ID of the step that could not be retrieved.
  final String jobId;

  /// The error message.
  final String message;

  /// The queue ID of the step that could not be retrieved.
  final String queueId;

  /// The step ID of the step that could not be retrieved.
  final String stepId;

  BatchGetStepError({
    required this.code,
    required this.farmId,
    required this.jobId,
    required this.message,
    required this.queueId,
    required this.stepId,
  });

  factory BatchGetStepError.fromJson(Map<String, dynamic> json) {
    return BatchGetStepError(
      code: BatchGetStepErrorCode.fromString((json['code'] as String?) ?? ''),
      farmId: (json['farmId'] as String?) ?? '',
      jobId: (json['jobId'] as String?) ?? '',
      message: (json['message'] as String?) ?? '',
      queueId: (json['queueId'] as String?) ?? '',
      stepId: (json['stepId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final farmId = this.farmId;
    final jobId = this.jobId;
    final message = this.message;
    final queueId = this.queueId;
    final stepId = this.stepId;
    return {
      'code': code.value,
      'farmId': farmId,
      'jobId': jobId,
      'message': message,
      'queueId': queueId,
      'stepId': stepId,
    };
  }
}

class BatchGetStepErrorCode {
  static const internalServerErrorException =
      BatchGetStepErrorCode._('InternalServerErrorException');
  static const resourceNotFoundException =
      BatchGetStepErrorCode._('ResourceNotFoundException');
  static const validationException =
      BatchGetStepErrorCode._('ValidationException');
  static const accessDeniedException =
      BatchGetStepErrorCode._('AccessDeniedException');
  static const throttlingException =
      BatchGetStepErrorCode._('ThrottlingException');

  final String value;

  const BatchGetStepErrorCode._(this.value);

  static const values = [
    internalServerErrorException,
    resourceNotFoundException,
    validationException,
    accessDeniedException,
    throttlingException
  ];

  static BatchGetStepErrorCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => BatchGetStepErrorCode._(value));

  @override
  bool operator ==(other) =>
      other is BatchGetStepErrorCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The details of a step returned in a batch get operation.
class BatchGetStepItem {
  /// The date and time the resource was created.
  final DateTime createdAt;

  /// The user or system that created this resource.
  final String createdBy;

  /// The farm ID of the step.
  final String farmId;

  /// The job ID of the step.
  final String jobId;

  /// The life cycle status of the step.
  final StepLifecycleStatus lifecycleStatus;

  /// The name of the step.
  final String name;

  /// The queue ID of the step.
  final String queueId;

  /// The step ID.
  final String stepId;

  /// The task run status for the step.
  final TaskRunStatus taskRunStatus;

  /// The number of tasks for each run status for the step.
  final Map<TaskRunStatus, int> taskRunStatusCounts;

  /// The number of dependencies for the step.
  final DependencyCounts? dependencyCounts;

  /// The description of the step.
  final String? description;

  /// The date and time the resource ended running.
  final DateTime? endedAt;

  /// A message that communicates the status of the life cycle.
  final String? lifecycleStatusMessage;

  /// The parameter space for the step.
  final ParameterSpace? parameterSpace;

  /// The required capabilities for the step.
  final StepRequiredCapabilities? requiredCapabilities;

  /// The date and time the resource started running.
  final DateTime? startedAt;

  /// The task status to start with on the step.
  final StepTargetTaskRunStatus? targetTaskRunStatus;

  /// The number of times that tasks failed and were retried.
  final int? taskFailureRetryCount;

  /// The date and time the resource was updated.
  final DateTime? updatedAt;

  /// The user or system that updated this resource.
  final String? updatedBy;

  BatchGetStepItem({
    required this.createdAt,
    required this.createdBy,
    required this.farmId,
    required this.jobId,
    required this.lifecycleStatus,
    required this.name,
    required this.queueId,
    required this.stepId,
    required this.taskRunStatus,
    required this.taskRunStatusCounts,
    this.dependencyCounts,
    this.description,
    this.endedAt,
    this.lifecycleStatusMessage,
    this.parameterSpace,
    this.requiredCapabilities,
    this.startedAt,
    this.targetTaskRunStatus,
    this.taskFailureRetryCount,
    this.updatedAt,
    this.updatedBy,
  });

  factory BatchGetStepItem.fromJson(Map<String, dynamic> json) {
    return BatchGetStepItem(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      createdBy: (json['createdBy'] as String?) ?? '',
      farmId: (json['farmId'] as String?) ?? '',
      jobId: (json['jobId'] as String?) ?? '',
      lifecycleStatus: StepLifecycleStatus.fromString(
          (json['lifecycleStatus'] as String?) ?? ''),
      name: (json['name'] as String?) ?? '',
      queueId: (json['queueId'] as String?) ?? '',
      stepId: (json['stepId'] as String?) ?? '',
      taskRunStatus:
          TaskRunStatus.fromString((json['taskRunStatus'] as String?) ?? ''),
      taskRunStatusCounts:
          ((json['taskRunStatusCounts'] as Map<String, dynamic>?) ??
                  const <String, dynamic>{})
              .map((k, e) => MapEntry(TaskRunStatus.fromString(k), e as int)),
      dependencyCounts: json['dependencyCounts'] != null
          ? DependencyCounts.fromJson(
              json['dependencyCounts'] as Map<String, dynamic>)
          : null,
      description: json['description'] as String?,
      endedAt: timeStampFromJson(json['endedAt']),
      lifecycleStatusMessage: json['lifecycleStatusMessage'] as String?,
      parameterSpace: json['parameterSpace'] != null
          ? ParameterSpace.fromJson(
              json['parameterSpace'] as Map<String, dynamic>)
          : null,
      requiredCapabilities: json['requiredCapabilities'] != null
          ? StepRequiredCapabilities.fromJson(
              json['requiredCapabilities'] as Map<String, dynamic>)
          : null,
      startedAt: timeStampFromJson(json['startedAt']),
      targetTaskRunStatus: (json['targetTaskRunStatus'] as String?)
          ?.let(StepTargetTaskRunStatus.fromString),
      taskFailureRetryCount: json['taskFailureRetryCount'] as int?,
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final farmId = this.farmId;
    final jobId = this.jobId;
    final lifecycleStatus = this.lifecycleStatus;
    final name = this.name;
    final queueId = this.queueId;
    final stepId = this.stepId;
    final taskRunStatus = this.taskRunStatus;
    final taskRunStatusCounts = this.taskRunStatusCounts;
    final dependencyCounts = this.dependencyCounts;
    final description = this.description;
    final endedAt = this.endedAt;
    final lifecycleStatusMessage = this.lifecycleStatusMessage;
    final parameterSpace = this.parameterSpace;
    final requiredCapabilities = this.requiredCapabilities;
    final startedAt = this.startedAt;
    final targetTaskRunStatus = this.targetTaskRunStatus;
    final taskFailureRetryCount = this.taskFailureRetryCount;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'createdBy': createdBy,
      'farmId': farmId,
      'jobId': jobId,
      'lifecycleStatus': lifecycleStatus.value,
      'name': name,
      'queueId': queueId,
      'stepId': stepId,
      'taskRunStatus': taskRunStatus.value,
      'taskRunStatusCounts':
          taskRunStatusCounts.map((k, e) => MapEntry(k.value, e)),
      if (dependencyCounts != null) 'dependencyCounts': dependencyCounts,
      if (description != null) 'description': description,
      if (endedAt != null) 'endedAt': iso8601ToJson(endedAt),
      if (lifecycleStatusMessage != null)
        'lifecycleStatusMessage': lifecycleStatusMessage,
      if (parameterSpace != null) 'parameterSpace': parameterSpace,
      if (requiredCapabilities != null)
        'requiredCapabilities': requiredCapabilities,
      if (startedAt != null) 'startedAt': iso8601ToJson(startedAt),
      if (targetTaskRunStatus != null)
        'targetTaskRunStatus': targetTaskRunStatus.value,
      if (taskFailureRetryCount != null)
        'taskFailureRetryCount': taskFailureRetryCount,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

/// The identifiers for a step.
class BatchGetStepIdentifier {
  /// The farm ID of the step.
  final String farmId;

  /// The job ID of the step.
  final String jobId;

  /// The queue ID of the step.
  final String queueId;

  /// The step ID.
  final String stepId;

  BatchGetStepIdentifier({
    required this.farmId,
    required this.jobId,
    required this.queueId,
    required this.stepId,
  });

  Map<String, dynamic> toJson() {
    final farmId = this.farmId;
    final jobId = this.jobId;
    final queueId = this.queueId;
    final stepId = this.stepId;
    return {
      'farmId': farmId,
      'jobId': jobId,
      'queueId': queueId,
      'stepId': stepId,
    };
  }
}

/// The error details for a session action that could not be retrieved in a
/// batch get operation.
class BatchGetSessionActionError {
  /// The error code.
  final BatchGetSessionActionErrorCode code;

  /// The farm ID of the session action that could not be retrieved.
  final String farmId;

  /// The job ID of the session action that could not be retrieved.
  final String jobId;

  /// The error message.
  final String message;

  /// The queue ID of the session action that could not be retrieved.
  final String queueId;

  /// The session action ID of the session action that could not be retrieved.
  final String sessionActionId;

  BatchGetSessionActionError({
    required this.code,
    required this.farmId,
    required this.jobId,
    required this.message,
    required this.queueId,
    required this.sessionActionId,
  });

  factory BatchGetSessionActionError.fromJson(Map<String, dynamic> json) {
    return BatchGetSessionActionError(
      code: BatchGetSessionActionErrorCode.fromString(
          (json['code'] as String?) ?? ''),
      farmId: (json['farmId'] as String?) ?? '',
      jobId: (json['jobId'] as String?) ?? '',
      message: (json['message'] as String?) ?? '',
      queueId: (json['queueId'] as String?) ?? '',
      sessionActionId: (json['sessionActionId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final farmId = this.farmId;
    final jobId = this.jobId;
    final message = this.message;
    final queueId = this.queueId;
    final sessionActionId = this.sessionActionId;
    return {
      'code': code.value,
      'farmId': farmId,
      'jobId': jobId,
      'message': message,
      'queueId': queueId,
      'sessionActionId': sessionActionId,
    };
  }
}

class BatchGetSessionActionErrorCode {
  static const internalServerErrorException =
      BatchGetSessionActionErrorCode._('InternalServerErrorException');
  static const resourceNotFoundException =
      BatchGetSessionActionErrorCode._('ResourceNotFoundException');
  static const validationException =
      BatchGetSessionActionErrorCode._('ValidationException');

  final String value;

  const BatchGetSessionActionErrorCode._(this.value);

  static const values = [
    internalServerErrorException,
    resourceNotFoundException,
    validationException
  ];

  static BatchGetSessionActionErrorCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => BatchGetSessionActionErrorCode._(value));

  @override
  bool operator ==(other) =>
      other is BatchGetSessionActionErrorCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The details of a session action returned in a batch get operation.
class BatchGetSessionActionItem {
  /// The session action definition.
  final SessionActionDefinition definition;

  /// The farm ID of the session action.
  final String farmId;

  /// The job ID of the session action.
  final String jobId;

  /// The queue ID of the session action.
  final String queueId;

  /// The session action ID.
  final String sessionActionId;

  /// The session ID for the session action.
  final String sessionId;

  /// The status of the session action.
  final SessionActionStatus status;

  /// The limits that were acquired for the session action.
  final List<AcquiredLimit>? acquiredLimits;

  /// The date and time the resource ended running.
  final DateTime? endedAt;

  /// The manifests for the session action.
  final List<TaskRunManifestPropertiesResponse>? manifests;

  /// The exit code to apply to the session action.
  final int? processExitCode;

  /// The message that communicates the progress of the session action.
  final String? progressMessage;

  /// The completion percentage for the session action.
  final double? progressPercent;

  /// The date and time the resource started running.
  final DateTime? startedAt;

  /// The date and time the resource was updated by a worker.
  final DateTime? workerUpdatedAt;

  BatchGetSessionActionItem({
    required this.definition,
    required this.farmId,
    required this.jobId,
    required this.queueId,
    required this.sessionActionId,
    required this.sessionId,
    required this.status,
    this.acquiredLimits,
    this.endedAt,
    this.manifests,
    this.processExitCode,
    this.progressMessage,
    this.progressPercent,
    this.startedAt,
    this.workerUpdatedAt,
  });

  factory BatchGetSessionActionItem.fromJson(Map<String, dynamic> json) {
    return BatchGetSessionActionItem(
      definition: SessionActionDefinition.fromJson(
          (json['definition'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      farmId: (json['farmId'] as String?) ?? '',
      jobId: (json['jobId'] as String?) ?? '',
      queueId: (json['queueId'] as String?) ?? '',
      sessionActionId: (json['sessionActionId'] as String?) ?? '',
      sessionId: (json['sessionId'] as String?) ?? '',
      status: SessionActionStatus.fromString((json['status'] as String?) ?? ''),
      acquiredLimits: (json['acquiredLimits'] as List?)
          ?.nonNulls
          .map((e) => AcquiredLimit.fromJson(e as Map<String, dynamic>))
          .toList(),
      endedAt: timeStampFromJson(json['endedAt']),
      manifests: (json['manifests'] as List?)
          ?.nonNulls
          .map((e) => TaskRunManifestPropertiesResponse.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      processExitCode: json['processExitCode'] as int?,
      progressMessage: json['progressMessage'] as String?,
      progressPercent: json['progressPercent'] as double?,
      startedAt: timeStampFromJson(json['startedAt']),
      workerUpdatedAt: timeStampFromJson(json['workerUpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final definition = this.definition;
    final farmId = this.farmId;
    final jobId = this.jobId;
    final queueId = this.queueId;
    final sessionActionId = this.sessionActionId;
    final sessionId = this.sessionId;
    final status = this.status;
    final acquiredLimits = this.acquiredLimits;
    final endedAt = this.endedAt;
    final manifests = this.manifests;
    final processExitCode = this.processExitCode;
    final progressMessage = this.progressMessage;
    final progressPercent = this.progressPercent;
    final startedAt = this.startedAt;
    final workerUpdatedAt = this.workerUpdatedAt;
    return {
      'definition': definition,
      'farmId': farmId,
      'jobId': jobId,
      'queueId': queueId,
      'sessionActionId': sessionActionId,
      'sessionId': sessionId,
      'status': status.value,
      if (acquiredLimits != null) 'acquiredLimits': acquiredLimits,
      if (endedAt != null) 'endedAt': iso8601ToJson(endedAt),
      if (manifests != null) 'manifests': manifests,
      if (processExitCode != null) 'processExitCode': processExitCode,
      if (progressMessage != null) 'progressMessage': progressMessage,
      if (progressPercent != null) 'progressPercent': progressPercent,
      if (startedAt != null) 'startedAt': iso8601ToJson(startedAt),
      if (workerUpdatedAt != null)
        'workerUpdatedAt': iso8601ToJson(workerUpdatedAt),
    };
  }
}

/// The identifiers for a session action.
class BatchGetSessionActionIdentifier {
  /// The farm ID of the session action.
  final String farmId;

  /// The job ID of the session action.
  final String jobId;

  /// The queue ID of the session action.
  final String queueId;

  /// The session action ID.
  final String sessionActionId;

  BatchGetSessionActionIdentifier({
    required this.farmId,
    required this.jobId,
    required this.queueId,
    required this.sessionActionId,
  });

  Map<String, dynamic> toJson() {
    final farmId = this.farmId;
    final jobId = this.jobId;
    final queueId = this.queueId;
    final sessionActionId = this.sessionActionId;
    return {
      'farmId': farmId,
      'jobId': jobId,
      'queueId': queueId,
      'sessionActionId': sessionActionId,
    };
  }
}

/// The error details for a session that could not be retrieved in a batch get
/// operation.
class BatchGetSessionError {
  /// The error code.
  final BatchGetSessionErrorCode code;

  /// The farm ID of the session that could not be retrieved.
  final String farmId;

  /// The job ID of the session that could not be retrieved.
  final String jobId;

  /// The error message.
  final String message;

  /// The queue ID of the session that could not be retrieved.
  final String queueId;

  /// The session ID of the session that could not be retrieved.
  final String sessionId;

  BatchGetSessionError({
    required this.code,
    required this.farmId,
    required this.jobId,
    required this.message,
    required this.queueId,
    required this.sessionId,
  });

  factory BatchGetSessionError.fromJson(Map<String, dynamic> json) {
    return BatchGetSessionError(
      code:
          BatchGetSessionErrorCode.fromString((json['code'] as String?) ?? ''),
      farmId: (json['farmId'] as String?) ?? '',
      jobId: (json['jobId'] as String?) ?? '',
      message: (json['message'] as String?) ?? '',
      queueId: (json['queueId'] as String?) ?? '',
      sessionId: (json['sessionId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final farmId = this.farmId;
    final jobId = this.jobId;
    final message = this.message;
    final queueId = this.queueId;
    final sessionId = this.sessionId;
    return {
      'code': code.value,
      'farmId': farmId,
      'jobId': jobId,
      'message': message,
      'queueId': queueId,
      'sessionId': sessionId,
    };
  }
}

class BatchGetSessionErrorCode {
  static const internalServerErrorException =
      BatchGetSessionErrorCode._('InternalServerErrorException');
  static const resourceNotFoundException =
      BatchGetSessionErrorCode._('ResourceNotFoundException');
  static const validationException =
      BatchGetSessionErrorCode._('ValidationException');

  final String value;

  const BatchGetSessionErrorCode._(this.value);

  static const values = [
    internalServerErrorException,
    resourceNotFoundException,
    validationException
  ];

  static BatchGetSessionErrorCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => BatchGetSessionErrorCode._(value));

  @override
  bool operator ==(other) =>
      other is BatchGetSessionErrorCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The details of a session returned in a batch get operation.
class BatchGetSessionItem {
  /// The farm ID of the session.
  final String farmId;

  /// The fleet ID of the session.
  final String fleetId;

  /// The job ID of the session.
  final String jobId;

  /// The life cycle status of the session.
  final SessionLifecycleStatus lifecycleStatus;

  /// The session log.
  final LogConfiguration log;

  /// The queue ID of the session.
  final String queueId;

  /// The session ID.
  final String sessionId;

  /// The date and time the resource started running.
  final DateTime startedAt;

  /// The worker ID of the session.
  final String workerId;

  /// The date and time the resource ended running.
  final DateTime? endedAt;

  /// The host properties for the session.
  final HostPropertiesResponse? hostProperties;

  /// The target life cycle status for the session.
  final SessionLifecycleTargetStatus? targetLifecycleStatus;

  /// The date and time the resource was updated.
  final DateTime? updatedAt;

  /// The user or system that updated this resource.
  final String? updatedBy;

  /// The worker log for the session.
  final LogConfiguration? workerLog;

  BatchGetSessionItem({
    required this.farmId,
    required this.fleetId,
    required this.jobId,
    required this.lifecycleStatus,
    required this.log,
    required this.queueId,
    required this.sessionId,
    required this.startedAt,
    required this.workerId,
    this.endedAt,
    this.hostProperties,
    this.targetLifecycleStatus,
    this.updatedAt,
    this.updatedBy,
    this.workerLog,
  });

  factory BatchGetSessionItem.fromJson(Map<String, dynamic> json) {
    return BatchGetSessionItem(
      farmId: (json['farmId'] as String?) ?? '',
      fleetId: (json['fleetId'] as String?) ?? '',
      jobId: (json['jobId'] as String?) ?? '',
      lifecycleStatus: SessionLifecycleStatus.fromString(
          (json['lifecycleStatus'] as String?) ?? ''),
      log: LogConfiguration.fromJson(
          (json['log'] as Map<String, dynamic>?) ?? const <String, dynamic>{}),
      queueId: (json['queueId'] as String?) ?? '',
      sessionId: (json['sessionId'] as String?) ?? '',
      startedAt: nonNullableTimeStampFromJson(json['startedAt'] ?? 0),
      workerId: (json['workerId'] as String?) ?? '',
      endedAt: timeStampFromJson(json['endedAt']),
      hostProperties: json['hostProperties'] != null
          ? HostPropertiesResponse.fromJson(
              json['hostProperties'] as Map<String, dynamic>)
          : null,
      targetLifecycleStatus: (json['targetLifecycleStatus'] as String?)
          ?.let(SessionLifecycleTargetStatus.fromString),
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
      workerLog: json['workerLog'] != null
          ? LogConfiguration.fromJson(json['workerLog'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final farmId = this.farmId;
    final fleetId = this.fleetId;
    final jobId = this.jobId;
    final lifecycleStatus = this.lifecycleStatus;
    final log = this.log;
    final queueId = this.queueId;
    final sessionId = this.sessionId;
    final startedAt = this.startedAt;
    final workerId = this.workerId;
    final endedAt = this.endedAt;
    final hostProperties = this.hostProperties;
    final targetLifecycleStatus = this.targetLifecycleStatus;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    final workerLog = this.workerLog;
    return {
      'farmId': farmId,
      'fleetId': fleetId,
      'jobId': jobId,
      'lifecycleStatus': lifecycleStatus.value,
      'log': log,
      'queueId': queueId,
      'sessionId': sessionId,
      'startedAt': iso8601ToJson(startedAt),
      'workerId': workerId,
      if (endedAt != null) 'endedAt': iso8601ToJson(endedAt),
      if (hostProperties != null) 'hostProperties': hostProperties,
      if (targetLifecycleStatus != null)
        'targetLifecycleStatus': targetLifecycleStatus.value,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
      if (workerLog != null) 'workerLog': workerLog,
    };
  }
}

/// The identifiers for a session.
class BatchGetSessionIdentifier {
  /// The farm ID of the session.
  final String farmId;

  /// The job ID of the session.
  final String jobId;

  /// The queue ID of the session.
  final String queueId;

  /// The session ID.
  final String sessionId;

  BatchGetSessionIdentifier({
    required this.farmId,
    required this.jobId,
    required this.queueId,
    required this.sessionId,
  });

  Map<String, dynamic> toJson() {
    final farmId = this.farmId;
    final jobId = this.jobId;
    final queueId = this.queueId;
    final sessionId = this.sessionId;
    return {
      'farmId': farmId,
      'jobId': jobId,
      'queueId': queueId,
      'sessionId': sessionId,
    };
  }
}

/// The error details for a job that could not be retrieved in a batch get
/// operation.
class BatchGetJobError {
  /// The error code.
  final BatchGetJobErrorCode code;

  /// The farm ID of the job that could not be retrieved.
  final String farmId;

  /// The job ID of the job that could not be retrieved.
  final String jobId;

  /// The error message.
  final String message;

  /// The queue ID of the job that could not be retrieved.
  final String queueId;

  BatchGetJobError({
    required this.code,
    required this.farmId,
    required this.jobId,
    required this.message,
    required this.queueId,
  });

  factory BatchGetJobError.fromJson(Map<String, dynamic> json) {
    return BatchGetJobError(
      code: BatchGetJobErrorCode.fromString((json['code'] as String?) ?? ''),
      farmId: (json['farmId'] as String?) ?? '',
      jobId: (json['jobId'] as String?) ?? '',
      message: (json['message'] as String?) ?? '',
      queueId: (json['queueId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final farmId = this.farmId;
    final jobId = this.jobId;
    final message = this.message;
    final queueId = this.queueId;
    return {
      'code': code.value,
      'farmId': farmId,
      'jobId': jobId,
      'message': message,
      'queueId': queueId,
    };
  }
}

class BatchGetJobErrorCode {
  static const internalServerErrorException =
      BatchGetJobErrorCode._('InternalServerErrorException');
  static const resourceNotFoundException =
      BatchGetJobErrorCode._('ResourceNotFoundException');
  static const validationException =
      BatchGetJobErrorCode._('ValidationException');
  static const accessDeniedException =
      BatchGetJobErrorCode._('AccessDeniedException');
  static const throttlingException =
      BatchGetJobErrorCode._('ThrottlingException');

  final String value;

  const BatchGetJobErrorCode._(this.value);

  static const values = [
    internalServerErrorException,
    resourceNotFoundException,
    validationException,
    accessDeniedException,
    throttlingException
  ];

  static BatchGetJobErrorCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => BatchGetJobErrorCode._(value));

  @override
  bool operator ==(other) =>
      other is BatchGetJobErrorCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The details of a job returned in a batch get operation.
class BatchGetJobItem {
  /// The date and time the resource was created.
  final DateTime createdAt;

  /// The user or system that created this resource.
  final String createdBy;

  /// The farm ID of the job.
  final String farmId;

  /// The job ID.
  final String jobId;

  /// The life cycle status of the job.
  final JobLifecycleStatus lifecycleStatus;

  /// A message that communicates the status of the life cycle.
  final String lifecycleStatusMessage;

  /// The name of the job.
  final String name;

  /// The job priority.
  final int priority;

  /// The queue ID of the job.
  final String queueId;

  /// The attachments for the job.
  final Attachments? attachments;

  /// The description of the job.
  final String? description;

  /// The date and time the resource ended running.
  final DateTime? endedAt;

  /// The number of task failures before the job stops running and is marked as
  /// <code>FAILED</code>.
  final int? maxFailedTasksCount;

  /// The maximum number of retries per failed tasks.
  final int? maxRetriesPerTask;

  /// The maximum number of worker hosts that can concurrently process a job.
  final int? maxWorkerCount;

  /// The parameters for the job.
  final Map<String, JobParameter>? parameters;

  /// The job ID for the source job.
  final String? sourceJobId;

  /// The date and time the resource started running.
  final DateTime? startedAt;

  /// The storage profile ID associated with the job.
  final String? storageProfileId;

  /// The task status to start with on the job.
  final JobTargetTaskRunStatus? targetTaskRunStatus;

  /// The number of times that tasks failed and were retried.
  final int? taskFailureRetryCount;

  /// The task run status for the job.
  final TaskRunStatus? taskRunStatus;

  /// The number of tasks for each run status for the job.
  final Map<TaskRunStatus, int>? taskRunStatusCounts;

  /// The date and time the resource was updated.
  final DateTime? updatedAt;

  /// The user or system that updated this resource.
  final String? updatedBy;

  BatchGetJobItem({
    required this.createdAt,
    required this.createdBy,
    required this.farmId,
    required this.jobId,
    required this.lifecycleStatus,
    required this.lifecycleStatusMessage,
    required this.name,
    required this.priority,
    required this.queueId,
    this.attachments,
    this.description,
    this.endedAt,
    this.maxFailedTasksCount,
    this.maxRetriesPerTask,
    this.maxWorkerCount,
    this.parameters,
    this.sourceJobId,
    this.startedAt,
    this.storageProfileId,
    this.targetTaskRunStatus,
    this.taskFailureRetryCount,
    this.taskRunStatus,
    this.taskRunStatusCounts,
    this.updatedAt,
    this.updatedBy,
  });

  factory BatchGetJobItem.fromJson(Map<String, dynamic> json) {
    return BatchGetJobItem(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      createdBy: (json['createdBy'] as String?) ?? '',
      farmId: (json['farmId'] as String?) ?? '',
      jobId: (json['jobId'] as String?) ?? '',
      lifecycleStatus: JobLifecycleStatus.fromString(
          (json['lifecycleStatus'] as String?) ?? ''),
      lifecycleStatusMessage: (json['lifecycleStatusMessage'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      priority: (json['priority'] as int?) ?? 0,
      queueId: (json['queueId'] as String?) ?? '',
      attachments: json['attachments'] != null
          ? Attachments.fromJson(json['attachments'] as Map<String, dynamic>)
          : null,
      description: json['description'] as String?,
      endedAt: timeStampFromJson(json['endedAt']),
      maxFailedTasksCount: json['maxFailedTasksCount'] as int?,
      maxRetriesPerTask: json['maxRetriesPerTask'] as int?,
      maxWorkerCount: json['maxWorkerCount'] as int?,
      parameters: (json['parameters'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, JobParameter.fromJson(e as Map<String, dynamic>))),
      sourceJobId: json['sourceJobId'] as String?,
      startedAt: timeStampFromJson(json['startedAt']),
      storageProfileId: json['storageProfileId'] as String?,
      targetTaskRunStatus: (json['targetTaskRunStatus'] as String?)
          ?.let(JobTargetTaskRunStatus.fromString),
      taskFailureRetryCount: json['taskFailureRetryCount'] as int?,
      taskRunStatus:
          (json['taskRunStatus'] as String?)?.let(TaskRunStatus.fromString),
      taskRunStatusCounts:
          (json['taskRunStatusCounts'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(TaskRunStatus.fromString(k), e as int)),
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final farmId = this.farmId;
    final jobId = this.jobId;
    final lifecycleStatus = this.lifecycleStatus;
    final lifecycleStatusMessage = this.lifecycleStatusMessage;
    final name = this.name;
    final priority = this.priority;
    final queueId = this.queueId;
    final attachments = this.attachments;
    final description = this.description;
    final endedAt = this.endedAt;
    final maxFailedTasksCount = this.maxFailedTasksCount;
    final maxRetriesPerTask = this.maxRetriesPerTask;
    final maxWorkerCount = this.maxWorkerCount;
    final parameters = this.parameters;
    final sourceJobId = this.sourceJobId;
    final startedAt = this.startedAt;
    final storageProfileId = this.storageProfileId;
    final targetTaskRunStatus = this.targetTaskRunStatus;
    final taskFailureRetryCount = this.taskFailureRetryCount;
    final taskRunStatus = this.taskRunStatus;
    final taskRunStatusCounts = this.taskRunStatusCounts;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'createdBy': createdBy,
      'farmId': farmId,
      'jobId': jobId,
      'lifecycleStatus': lifecycleStatus.value,
      'lifecycleStatusMessage': lifecycleStatusMessage,
      'name': name,
      'priority': priority,
      'queueId': queueId,
      if (attachments != null) 'attachments': attachments,
      if (description != null) 'description': description,
      if (endedAt != null) 'endedAt': iso8601ToJson(endedAt),
      if (maxFailedTasksCount != null)
        'maxFailedTasksCount': maxFailedTasksCount,
      if (maxRetriesPerTask != null) 'maxRetriesPerTask': maxRetriesPerTask,
      if (maxWorkerCount != null) 'maxWorkerCount': maxWorkerCount,
      if (parameters != null) 'parameters': parameters,
      if (sourceJobId != null) 'sourceJobId': sourceJobId,
      if (startedAt != null) 'startedAt': iso8601ToJson(startedAt),
      if (storageProfileId != null) 'storageProfileId': storageProfileId,
      if (targetTaskRunStatus != null)
        'targetTaskRunStatus': targetTaskRunStatus.value,
      if (taskFailureRetryCount != null)
        'taskFailureRetryCount': taskFailureRetryCount,
      if (taskRunStatus != null) 'taskRunStatus': taskRunStatus.value,
      if (taskRunStatusCounts != null)
        'taskRunStatusCounts':
            taskRunStatusCounts.map((k, e) => MapEntry(k.value, e)),
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

/// The identifiers for a job.
class BatchGetJobIdentifier {
  /// The farm ID of the job.
  final String farmId;

  /// The job ID.
  final String jobId;

  /// The queue ID of the job.
  final String queueId;

  BatchGetJobIdentifier({
    required this.farmId,
    required this.jobId,
    required this.queueId,
  });

  Map<String, dynamic> toJson() {
    final farmId = this.farmId;
    final jobId = this.jobId;
    final queueId = this.queueId;
    return {
      'farmId': farmId,
      'jobId': jobId,
      'queueId': queueId,
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

class InternalServerErrorException extends _s.GenericAwsException {
  InternalServerErrorException({String? type, String? message})
      : super(
            type: type, code: 'InternalServerErrorException', message: message);
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
  'InternalServerErrorException': (type, message) =>
      InternalServerErrorException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
