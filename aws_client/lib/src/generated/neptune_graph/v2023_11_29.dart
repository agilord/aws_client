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

/// Neptune Analytics is a new analytics database engine for Amazon Neptune that
/// helps customers get to insights faster by quickly processing large amounts
/// of graph data, invoking popular graph analytic algorithms in low-latency
/// queries, and getting analytics results in seconds.
class NeptuneGraph {
  final _s.RestJsonProtocol _protocol;
  NeptuneGraph({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'neptune-graph',
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

  /// Cancels a specified query.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [graphIdentifier] :
  /// The unique identifier of the Neptune Analytics graph.
  ///
  /// Parameter [queryId] :
  /// The unique identifier of the query to cancel.
  Future<void> cancelQuery({
    required String graphIdentifier,
    required String queryId,
  }) async {
    final headers = <String, String>{
      'graphIdentifier': graphIdentifier.toString(),
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/queries/${Uri.encodeComponent(queryId)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Execute an openCypher query.
  ///
  /// When invoking this operation in a Neptune Analytics cluster, the IAM user
  /// or role making the request must have a policy attached that allows one of
  /// the following IAM actions in that cluster, depending on the query:
  ///
  /// <ul>
  /// <li>
  /// neptune-graph:ReadDataViaQuery
  /// </li>
  /// <li>
  /// neptune-graph:WriteDataViaQuery
  /// </li>
  /// <li>
  /// neptune-graph:DeleteDataViaQuery
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [UnprocessableException].
  /// May throw [ValidationException].
  ///
  /// Parameter [graphIdentifier] :
  /// The unique identifier of the Neptune Analytics graph.
  ///
  /// Parameter [language] :
  /// The query language the query is written in. Currently only openCypher is
  /// supported.
  ///
  /// Parameter [queryString] :
  /// The query string to be executed.
  ///
  /// Parameter [explainMode] :
  /// The explain mode parameter returns a query explain instead of the actual
  /// query results. A query explain can be used to gather insights about the
  /// query execution such as planning decisions, time spent on each operator,
  /// solutions flowing etc.
  ///
  /// Parameter [parameters] :
  /// The data parameters the query can use in JSON format. For example:
  /// {"name": "john", "age": 20}. (optional)
  ///
  /// Parameter [planCache] :
  /// Query plan cache is a feature that saves the query plan and reuses it on
  /// successive executions of the same query. This reduces query latency, and
  /// works for both <code>READ</code> and <code>UPDATE</code> queries. The plan
  /// cache is an LRU cache with a 5 minute TTL and a capacity of 1000.
  ///
  /// Parameter [queryTimeoutMilliseconds] :
  /// Specifies the query timeout duration, in milliseconds. (optional)
  Future<ExecuteQueryOutput> executeQuery({
    required String graphIdentifier,
    required QueryLanguage language,
    required String queryString,
    ExplainMode? explainMode,
    Map<String, Document>? parameters,
    PlanCacheType? planCache,
    int? queryTimeoutMilliseconds,
  }) async {
    final headers = <String, String>{
      'graphIdentifier': graphIdentifier.toString(),
    };
    final $payload = <String, dynamic>{
      'language': language.value,
      'query': queryString,
      if (explainMode != null) 'explain': explainMode.value,
      if (parameters != null) 'parameters': parameters,
      if (planCache != null) 'planCache': planCache.value,
      if (queryTimeoutMilliseconds != null)
        'queryTimeoutMilliseconds': queryTimeoutMilliseconds,
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'POST',
      requestUri: '/queries',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return ExecuteQueryOutput(
      payload: await response.stream.toBytes(),
    );
  }

  /// Gets a graph summary for a property graph.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [graphIdentifier] :
  /// The unique identifier of the Neptune Analytics graph.
  ///
  /// Parameter [mode] :
  /// The summary mode can take one of two values: <code>basic</code> (the
  /// default), and <code>detailed</code>.
  Future<GetGraphSummaryOutput> getGraphSummary({
    required String graphIdentifier,
    GraphSummaryMode? mode,
  }) async {
    final headers = <String, String>{
      'graphIdentifier': graphIdentifier.toString(),
    };
    final $query = <String, List<String>>{
      if (mode != null) 'mode': [mode.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/summary',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetGraphSummaryOutput.fromJson(response);
  }

  /// Retrieves the status of a specified query.
  /// <note>
  /// When invoking this operation in a Neptune Analytics cluster, the IAM user
  /// or role making the request must have the
  /// <code>neptune-graph:GetQueryStatus</code> IAM action attached.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [graphIdentifier] :
  /// The unique identifier of the Neptune Analytics graph.
  ///
  /// Parameter [queryId] :
  /// The ID of the query in question.
  Future<GetQueryOutput> getQuery({
    required String graphIdentifier,
    required String queryId,
  }) async {
    final headers = <String, String>{
      'graphIdentifier': graphIdentifier.toString(),
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/queries/${Uri.encodeComponent(queryId)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetQueryOutput.fromJson(response);
  }

  /// Lists active openCypher queries.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [graphIdentifier] :
  /// The unique identifier of the Neptune Analytics graph.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be fetched by the API.
  ///
  /// Parameter [state] :
  /// Filtered list of queries based on state.
  Future<ListQueriesOutput> listQueries({
    required String graphIdentifier,
    required int maxResults,
    QueryStateInput? state,
  }) async {
    final headers = <String, String>{
      'graphIdentifier': graphIdentifier.toString(),
    };
    final $query = <String, List<String>>{
      'maxResults': [maxResults.toString()],
      if (state != null) 'state': [state.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/queries',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return ListQueriesOutput.fromJson(response);
  }

  /// Lists tags associated with a specified resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource.
  Future<ListTagsForResourceOutput> listTagsForResource({
    required String resourceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceOutput.fromJson(response);
  }

  /// Adds tags to the specified resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// ARN of the resource for which tags need to be added.
  ///
  /// Parameter [tags] :
  /// The tags to be assigned to the Neptune Analytics resource.
  ///
  /// The tags are metadata that are specified as a list of key-value pairs:
  ///
  /// <b>Key</b> (string) – A key is the required name of the tag. The string
  /// value can be from 1 to 128 Unicode characters in length. It can't be
  /// prefixed with <code>aws:</code> and can only contain the set of Unicode
  /// characters specified by this Java regular expression:
  /// <code>"^([\p{L}\p{Z}\p{N}_.:/=+\-]*)$")</code>.
  ///
  /// <b>Value</b> (string) – A value is the optional value of the tag. The
  /// string value can be from 1 to 256 Unicode characters in length. It can't
  /// be prefixed with <code>aws:</code> and can only contain the set of Unicode
  /// characters specified by this Java regular expression:
  /// <code>"^([\p{L}\p{Z}\p{N}_.:/=+\-]*)$")</code>.
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
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes the specified tags from the specified resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// ARN of the resource whose tag needs to be removed.
  ///
  /// Parameter [tagKeys] :
  /// Tag keys for the tags to be removed.
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
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates a new Neptune Analytics graph.
  ///
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [graphName] :
  /// A name for the new Neptune Analytics graph to be created.
  ///
  /// The name must contain from 1 to 63 letters, numbers, or hyphens, and its
  /// first character must be a letter. It cannot end with a hyphen or contain
  /// two consecutive hyphens. Only lowercase letters are allowed.
  ///
  /// Parameter [provisionedMemory] :
  /// The provisioned memory-optimized Neptune Capacity Units (m-NCUs) to use
  /// for the graph. Min = 16
  ///
  /// Parameter [deletionProtection] :
  /// Indicates whether or not to enable deletion protection on the graph. The
  /// graph can’t be deleted when deletion protection is enabled.
  /// (<code>true</code> or <code>false</code>).
  ///
  /// Parameter [kmsKeyIdentifier] :
  /// Specifies a KMS key to use to encrypt data in the new graph.
  ///
  /// Parameter [publicConnectivity] :
  /// Specifies whether or not the graph can be reachable over the internet. All
  /// access to graphs is IAM authenticated. (<code>true</code> to enable, or
  /// <code>false</code> to disable.
  ///
  /// Parameter [replicaCount] :
  /// The number of replicas in other AZs. Min =0, Max = 2, Default = 1.
  /// <important>
  /// Additional charges equivalent to the m-NCUs selected for the graph apply
  /// for each replica.
  /// </important>
  ///
  /// Parameter [tags] :
  /// Adds metadata tags to the new graph. These tags can also be used with cost
  /// allocation reporting, or used in a Condition statement in an IAM policy.
  ///
  /// Parameter [vectorSearchConfiguration] :
  /// Specifies the number of dimensions for vector embeddings that will be
  /// loaded into the graph. The value is specified as
  /// <code>dimension=</code>value. Max = 65,535
  Future<CreateGraphOutput> createGraph({
    required String graphName,
    required int provisionedMemory,
    bool? deletionProtection,
    String? kmsKeyIdentifier,
    bool? publicConnectivity,
    int? replicaCount,
    Map<String, String>? tags,
    VectorSearchConfiguration? vectorSearchConfiguration,
  }) async {
    _s.validateNumRange(
      'provisionedMemory',
      provisionedMemory,
      16,
      24576,
      isRequired: true,
    );
    _s.validateNumRange(
      'replicaCount',
      replicaCount,
      0,
      2,
    );
    final $payload = <String, dynamic>{
      'graphName': graphName,
      'provisionedMemory': provisionedMemory,
      if (deletionProtection != null) 'deletionProtection': deletionProtection,
      if (kmsKeyIdentifier != null) 'kmsKeyIdentifier': kmsKeyIdentifier,
      if (publicConnectivity != null) 'publicConnectivity': publicConnectivity,
      if (replicaCount != null) 'replicaCount': replicaCount,
      if (tags != null) 'tags': tags,
      if (vectorSearchConfiguration != null)
        'vectorSearchConfiguration': vectorSearchConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/graphs',
      exceptionFnMap: _exceptionFns,
    );
    return CreateGraphOutput.fromJson(response);
  }

  /// Deletes the specified graph. Graphs cannot be deleted if delete-protection
  /// is enabled.
  ///
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [graphIdentifier] :
  /// The unique identifier of the Neptune Analytics graph.
  ///
  /// Parameter [skipSnapshot] :
  /// Determines whether a final graph snapshot is created before the graph is
  /// deleted. If <code>true</code> is specified, no graph snapshot is created.
  /// If <code>false</code> is specified, a graph snapshot is created before the
  /// graph is deleted.
  Future<DeleteGraphOutput> deleteGraph({
    required String graphIdentifier,
    required bool skipSnapshot,
  }) async {
    final $query = <String, List<String>>{
      'skipSnapshot': [skipSnapshot.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/graphs/${Uri.encodeComponent(graphIdentifier)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteGraphOutput.fromJson(response);
  }

  /// Gets information about a specified graph.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [graphIdentifier] :
  /// The unique identifier of the Neptune Analytics graph.
  Future<GetGraphOutput> getGraph({
    required String graphIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/graphs/${Uri.encodeComponent(graphIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetGraphOutput.fromJson(response);
  }

  /// Lists available Neptune Analytics graphs.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [maxResults] :
  /// The total number of records to return in the command's output.
  ///
  /// If the total number of records available is more than the value specified,
  /// <code>nextToken</code> is provided in the command's output. To resume
  /// pagination, provide the <code>nextToken</code> output value in the
  /// <code>nextToken</code> argument of a subsequent command. Do not use the
  /// <code>nextToken</code> response element directly outside of the Amazon
  /// CLI.
  ///
  /// Parameter [nextToken] :
  /// Pagination token used to paginate output.
  ///
  /// When this value is provided as input, the service returns results from
  /// where the previous response left off. When this value is present in
  /// output, it indicates that there are more results to retrieve.
  Future<ListGraphsOutput> listGraphs({
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
      requestUri: '/graphs',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListGraphsOutput.fromJson(response);
  }

  /// Empties the data from a specified Neptune Analytics graph.
  ///
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [graphIdentifier] :
  /// ID of the graph to reset.
  ///
  /// Parameter [skipSnapshot] :
  /// Determines whether a final graph snapshot is created before the graph data
  /// is deleted. If set to <code>true</code>, no graph snapshot is created. If
  /// set to <code>false</code>, a graph snapshot is created before the data is
  /// deleted.
  Future<ResetGraphOutput> resetGraph({
    required String graphIdentifier,
    required bool skipSnapshot,
  }) async {
    final $payload = <String, dynamic>{
      'skipSnapshot': skipSnapshot,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/graphs/${Uri.encodeComponent(graphIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return ResetGraphOutput.fromJson(response);
  }

  /// Restores a graph from a snapshot.
  ///
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [graphName] :
  /// A name for the new Neptune Analytics graph to be created from the
  /// snapshot.
  ///
  /// The name must contain from 1 to 63 letters, numbers, or hyphens, and its
  /// first character must be a letter. It cannot end with a hyphen or contain
  /// two consecutive hyphens. Only lowercase letters are allowed.
  ///
  /// Parameter [snapshotIdentifier] :
  /// The ID of the snapshot in question.
  ///
  /// Parameter [deletionProtection] :
  /// A value that indicates whether the graph has deletion protection enabled.
  /// The graph can't be deleted when deletion protection is enabled.
  ///
  /// Parameter [provisionedMemory] :
  /// The provisioned memory-optimized Neptune Capacity Units (m-NCUs) to use
  /// for the graph.
  ///
  /// Min = 16
  ///
  /// Parameter [publicConnectivity] :
  /// Specifies whether or not the graph can be reachable over the internet. All
  /// access to graphs is IAM authenticated. (<code>true</code> to enable, or
  /// <code>false</code> to disable).
  ///
  /// Parameter [replicaCount] :
  /// The number of replicas in other AZs. Min =0, Max = 2, Default =1
  /// <important>
  /// Additional charges equivalent to the m-NCUs selected for the graph apply
  /// for each replica.
  /// </important>
  ///
  /// Parameter [tags] :
  /// Adds metadata tags to the snapshot. These tags can also be used with cost
  /// allocation reporting, or used in a Condition statement in an IAM policy.
  Future<RestoreGraphFromSnapshotOutput> restoreGraphFromSnapshot({
    required String graphName,
    required String snapshotIdentifier,
    bool? deletionProtection,
    int? provisionedMemory,
    bool? publicConnectivity,
    int? replicaCount,
    Map<String, String>? tags,
  }) async {
    _s.validateNumRange(
      'provisionedMemory',
      provisionedMemory,
      16,
      24576,
    );
    _s.validateNumRange(
      'replicaCount',
      replicaCount,
      0,
      2,
    );
    final $payload = <String, dynamic>{
      'graphName': graphName,
      if (deletionProtection != null) 'deletionProtection': deletionProtection,
      if (provisionedMemory != null) 'provisionedMemory': provisionedMemory,
      if (publicConnectivity != null) 'publicConnectivity': publicConnectivity,
      if (replicaCount != null) 'replicaCount': replicaCount,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/snapshots/${Uri.encodeComponent(snapshotIdentifier)}/restore',
      exceptionFnMap: _exceptionFns,
    );
    return RestoreGraphFromSnapshotOutput.fromJson(response);
  }

  /// Starts the specific graph.
  ///
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [graphIdentifier] :
  /// The unique identifier of the Neptune Analytics graph.
  Future<StartGraphOutput> startGraph({
    required String graphIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/graphs/${Uri.encodeComponent(graphIdentifier)}/start',
      exceptionFnMap: _exceptionFns,
    );
    return StartGraphOutput.fromJson(response);
  }

  /// Stops the specific graph.
  ///
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [graphIdentifier] :
  /// The unique identifier of the Neptune Analytics graph.
  Future<StopGraphOutput> stopGraph({
    required String graphIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/graphs/${Uri.encodeComponent(graphIdentifier)}/stop',
      exceptionFnMap: _exceptionFns,
    );
    return StopGraphOutput.fromJson(response);
  }

  /// Updates the configuration of a specified Neptune Analytics graph
  ///
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [graphIdentifier] :
  /// The unique identifier of the Neptune Analytics graph.
  ///
  /// Parameter [deletionProtection] :
  /// A value that indicates whether the graph has deletion protection enabled.
  /// The graph can't be deleted when deletion protection is enabled.
  ///
  /// Parameter [provisionedMemory] :
  /// The provisioned memory-optimized Neptune Capacity Units (m-NCUs) to use
  /// for the graph.
  ///
  /// Min = 16
  ///
  /// Parameter [publicConnectivity] :
  /// Specifies whether or not the graph can be reachable over the internet. All
  /// access to graphs is IAM authenticated. (<code>true</code> to enable, or
  /// <code>false</code> to disable.
  Future<UpdateGraphOutput> updateGraph({
    required String graphIdentifier,
    bool? deletionProtection,
    int? provisionedMemory,
    bool? publicConnectivity,
  }) async {
    _s.validateNumRange(
      'provisionedMemory',
      provisionedMemory,
      16,
      24576,
    );
    final $payload = <String, dynamic>{
      if (deletionProtection != null) 'deletionProtection': deletionProtection,
      if (provisionedMemory != null) 'provisionedMemory': provisionedMemory,
      if (publicConnectivity != null) 'publicConnectivity': publicConnectivity,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/graphs/${Uri.encodeComponent(graphIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateGraphOutput.fromJson(response);
  }

  /// Create a private graph endpoint to allow private access to the graph from
  /// within a VPC. You can attach security groups to the private graph
  /// endpoint.
  /// <note>
  /// VPC endpoint charges apply.
  /// </note>
  ///
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [graphIdentifier] :
  /// The unique identifier of the Neptune Analytics graph.
  ///
  /// Parameter [subnetIds] :
  /// Subnets in which private graph endpoint ENIs are created.
  ///
  /// Parameter [vpcId] :
  /// The VPC in which the private graph endpoint needs to be created.
  ///
  /// Parameter [vpcSecurityGroupIds] :
  /// Security groups to be attached to the private graph endpoint.
  Future<CreatePrivateGraphEndpointOutput> createPrivateGraphEndpoint({
    required String graphIdentifier,
    List<String>? subnetIds,
    String? vpcId,
    List<String>? vpcSecurityGroupIds,
  }) async {
    final $payload = <String, dynamic>{
      if (subnetIds != null) 'subnetIds': subnetIds,
      if (vpcId != null) 'vpcId': vpcId,
      if (vpcSecurityGroupIds != null)
        'vpcSecurityGroupIds': vpcSecurityGroupIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/graphs/${Uri.encodeComponent(graphIdentifier)}/endpoints/',
      exceptionFnMap: _exceptionFns,
    );
    return CreatePrivateGraphEndpointOutput.fromJson(response);
  }

  /// Deletes a private graph endpoint.
  ///
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [graphIdentifier] :
  /// The unique identifier of the Neptune Analytics graph.
  ///
  /// Parameter [vpcId] :
  /// The ID of the VPC where the private endpoint is located.
  Future<DeletePrivateGraphEndpointOutput> deletePrivateGraphEndpoint({
    required String graphIdentifier,
    required String vpcId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/graphs/${Uri.encodeComponent(graphIdentifier)}/endpoints/${Uri.encodeComponent(vpcId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeletePrivateGraphEndpointOutput.fromJson(response);
  }

  /// Retrieves information about a specified private endpoint.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [graphIdentifier] :
  /// The unique identifier of the Neptune Analytics graph.
  ///
  /// Parameter [vpcId] :
  /// The ID of the VPC where the private endpoint is located.
  Future<GetPrivateGraphEndpointOutput> getPrivateGraphEndpoint({
    required String graphIdentifier,
    required String vpcId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/graphs/${Uri.encodeComponent(graphIdentifier)}/endpoints/${Uri.encodeComponent(vpcId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetPrivateGraphEndpointOutput.fromJson(response);
  }

  /// Lists private endpoints for a specified Neptune Analytics graph.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [graphIdentifier] :
  /// The unique identifier of the Neptune Analytics graph.
  ///
  /// Parameter [maxResults] :
  /// The total number of records to return in the command's output.
  ///
  /// If the total number of records available is more than the value specified,
  /// <code>nextToken</code> is provided in the command's output. To resume
  /// pagination, provide the <code>nextToken</code> output value in the
  /// <code>nextToken</code> argument of a subsequent command. Do not use the
  /// <code>nextToken</code> response element directly outside of the Amazon
  /// CLI.
  ///
  /// Parameter [nextToken] :
  /// Pagination token used to paginate output.
  ///
  /// When this value is provided as input, the service returns results from
  /// where the previous response left off. When this value is present in
  /// output, it indicates that there are more results to retrieve.
  Future<ListPrivateGraphEndpointsOutput> listPrivateGraphEndpoints({
    required String graphIdentifier,
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
      requestUri: '/graphs/${Uri.encodeComponent(graphIdentifier)}/endpoints/',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListPrivateGraphEndpointsOutput.fromJson(response);
  }

  /// Creates a snapshot of the specific graph.
  ///
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [graphIdentifier] :
  /// The unique identifier of the Neptune Analytics graph.
  ///
  /// Parameter [snapshotName] :
  /// The snapshot name. For example: <code>my-snapshot-1</code>.
  ///
  /// The name must contain from 1 to 63 letters, numbers, or hyphens, and its
  /// first character must be a letter. It cannot end with a hyphen or contain
  /// two consecutive hyphens. Only lowercase letters are allowed.
  ///
  /// Parameter [tags] :
  /// Adds metadata tags to the new graph. These tags can also be used with cost
  /// allocation reporting, or used in a Condition statement in an IAM policy.
  Future<CreateGraphSnapshotOutput> createGraphSnapshot({
    required String graphIdentifier,
    required String snapshotName,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'graphIdentifier': graphIdentifier,
      'snapshotName': snapshotName,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/snapshots',
      exceptionFnMap: _exceptionFns,
    );
    return CreateGraphSnapshotOutput.fromJson(response);
  }

  /// Deletes the specified graph snapshot.
  ///
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [snapshotIdentifier] :
  /// ID of the graph snapshot to be deleted.
  Future<DeleteGraphSnapshotOutput> deleteGraphSnapshot({
    required String snapshotIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/snapshots/${Uri.encodeComponent(snapshotIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteGraphSnapshotOutput.fromJson(response);
  }

  /// Retrieves a specified graph snapshot.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [snapshotIdentifier] :
  /// The ID of the snapshot to retrieve.
  Future<GetGraphSnapshotOutput> getGraphSnapshot({
    required String snapshotIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/snapshots/${Uri.encodeComponent(snapshotIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetGraphSnapshotOutput.fromJson(response);
  }

  /// Lists available snapshots of a specified Neptune Analytics graph.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [graphIdentifier] :
  /// The unique identifier of the Neptune Analytics graph.
  ///
  /// Parameter [maxResults] :
  /// The total number of records to return in the command's output.
  ///
  /// If the total number of records available is more than the value specified,
  /// <code>nextToken</code> is provided in the command's output. To resume
  /// pagination, provide the <code>nextToken</code> output value in the
  /// <code>nextToken</code> argument of a subsequent command. Do not use the
  /// <code>nextToken</code> response element directly outside of the Amazon
  /// CLI.
  ///
  /// Parameter [nextToken] :
  /// Pagination token used to paginate output.
  ///
  /// When this value is provided as input, the service returns results from
  /// where the previous response left off. When this value is present in
  /// output, it indicates that there are more results to retrieve.
  Future<ListGraphSnapshotsOutput> listGraphSnapshots({
    String? graphIdentifier,
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
      if (graphIdentifier != null) 'graphIdentifier': [graphIdentifier],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/snapshots',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListGraphSnapshotsOutput.fromJson(response);
  }

  /// Cancel the specified export task.
  ///
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [taskIdentifier] :
  /// The unique identifier of the export task.
  Future<CancelExportTaskOutput> cancelExportTask({
    required String taskIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/exporttasks/${Uri.encodeComponent(taskIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return CancelExportTaskOutput.fromJson(response);
  }

  /// Deletes the specified import task.
  ///
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [taskIdentifier] :
  /// The unique identifier of the import task.
  Future<CancelImportTaskOutput> cancelImportTask({
    required String taskIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/importtasks/${Uri.encodeComponent(taskIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return CancelImportTaskOutput.fromJson(response);
  }

  /// Creates a new Neptune Analytics graph and imports data into it, either
  /// from Amazon Simple Storage Service (S3) or from a Neptune database or a
  /// Neptune database snapshot.
  ///
  /// The data can be loaded from files in S3 that in either the <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/bulk-load-tutorial-format-gremlin.html">Gremlin
  /// CSV format</a> or the <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/bulk-load-tutorial-format-opencypher.html">openCypher
  /// load format</a>.
  ///
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [graphName] :
  /// A name for the new Neptune Analytics graph to be created.
  ///
  /// The name must contain from 1 to 63 letters, numbers, or hyphens, and its
  /// first character must be a letter. It cannot end with a hyphen or contain
  /// two consecutive hyphens. Only lowercase letters are allowed.
  ///
  /// Parameter [roleArn] :
  /// The ARN of the IAM role that will allow access to the data that is to be
  /// imported.
  ///
  /// Parameter [source] :
  /// A URL identifying to the location of the data to be imported. This can be
  /// an Amazon S3 path, or can point to a Neptune database endpoint or
  /// snapshot.
  ///
  /// Parameter [blankNodeHandling] :
  /// The method to handle blank nodes in the dataset. Currently, only
  /// <code>convertToIri</code> is supported, meaning blank nodes are converted
  /// to unique IRIs at load time. Must be provided when format is
  /// <code>ntriples</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/neptune-analytics/latest/userguide/using-rdf-data.html#rdf-handling">Handling
  /// RDF values</a>.
  ///
  /// Parameter [deletionProtection] :
  /// Indicates whether or not to enable deletion protection on the graph. The
  /// graph can’t be deleted when deletion protection is enabled.
  /// (<code>true</code> or <code>false</code>).
  ///
  /// Parameter [failOnError] :
  /// If set to <code>true</code>, the task halts when an import error is
  /// encountered. If set to <code>false</code>, the task skips the data that
  /// caused the error and continues if possible.
  ///
  /// Parameter [format] :
  /// Specifies the format of S3 data to be imported. Valid values are
  /// <code>CSV</code>, which identifies the <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/bulk-load-tutorial-format-gremlin.html">Gremlin
  /// CSV format</a>, <code>OPEN_CYPHER</code>, which identifies the <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/bulk-load-tutorial-format-opencypher.html">openCypher
  /// load format</a>, or <code>ntriples</code>, which identifies the <a
  /// href="https://docs.aws.amazon.com/neptune-analytics/latest/userguide/using-rdf-data.html">RDF
  /// n-triples</a> format.
  ///
  /// Parameter [importOptions] :
  /// Contains options for controlling the import process. For example, if the
  /// <code>failOnError</code> key is set to <code>false</code>, the import
  /// skips problem data and attempts to continue (whereas if set to
  /// <code>true</code>, the default, or if omitted, the import operation halts
  /// immediately when an error is encountered.
  ///
  /// Parameter [kmsKeyIdentifier] :
  /// Specifies a KMS key to use to encrypt data imported into the new graph.
  ///
  /// Parameter [maxProvisionedMemory] :
  /// The maximum provisioned memory-optimized Neptune Capacity Units (m-NCUs)
  /// to use for the graph. Default: 1024, or the approved upper limit for your
  /// account.
  ///
  /// If both the minimum and maximum values are specified, the final
  /// <code>provisioned-memory</code> will be chosen per the actual size of your
  /// imported data. If neither value is specified, 128 m-NCUs are used.
  ///
  /// Parameter [minProvisionedMemory] :
  /// The minimum provisioned memory-optimized Neptune Capacity Units (m-NCUs)
  /// to use for the graph. Default: 16
  ///
  /// Parameter [parquetType] :
  /// The parquet type of the import task.
  ///
  /// Parameter [publicConnectivity] :
  /// Specifies whether or not the graph can be reachable over the internet. All
  /// access to graphs is IAM authenticated. (<code>true</code> to enable, or
  /// <code>false</code> to disable).
  ///
  /// Parameter [replicaCount] :
  /// The number of replicas in other AZs to provision on the new graph after
  /// import. Default = 0, Min = 0, Max = 2.
  /// <important>
  /// Additional charges equivalent to the m-NCUs selected for the graph apply
  /// for each replica.
  /// </important>
  ///
  /// Parameter [tags] :
  /// Adds metadata tags to the new graph. These tags can also be used with cost
  /// allocation reporting, or used in a Condition statement in an IAM policy.
  ///
  /// Parameter [vectorSearchConfiguration] :
  /// Specifies the number of dimensions for vector embeddings that will be
  /// loaded into the graph. The value is specified as
  /// <code>dimension=</code>value. Max = 65,535
  Future<CreateGraphUsingImportTaskOutput> createGraphUsingImportTask({
    required String graphName,
    required String roleArn,
    required String source,
    BlankNodeHandling? blankNodeHandling,
    bool? deletionProtection,
    bool? failOnError,
    Format? format,
    ImportOptions? importOptions,
    String? kmsKeyIdentifier,
    int? maxProvisionedMemory,
    int? minProvisionedMemory,
    ParquetType? parquetType,
    bool? publicConnectivity,
    int? replicaCount,
    Map<String, String>? tags,
    VectorSearchConfiguration? vectorSearchConfiguration,
  }) async {
    _s.validateNumRange(
      'maxProvisionedMemory',
      maxProvisionedMemory,
      16,
      24576,
    );
    _s.validateNumRange(
      'minProvisionedMemory',
      minProvisionedMemory,
      16,
      24576,
    );
    _s.validateNumRange(
      'replicaCount',
      replicaCount,
      0,
      2,
    );
    final $payload = <String, dynamic>{
      'graphName': graphName,
      'roleArn': roleArn,
      'source': source,
      if (blankNodeHandling != null)
        'blankNodeHandling': blankNodeHandling.value,
      if (deletionProtection != null) 'deletionProtection': deletionProtection,
      if (failOnError != null) 'failOnError': failOnError,
      if (format != null) 'format': format.value,
      if (importOptions != null) 'importOptions': importOptions,
      if (kmsKeyIdentifier != null) 'kmsKeyIdentifier': kmsKeyIdentifier,
      if (maxProvisionedMemory != null)
        'maxProvisionedMemory': maxProvisionedMemory,
      if (minProvisionedMemory != null)
        'minProvisionedMemory': minProvisionedMemory,
      if (parquetType != null) 'parquetType': parquetType.value,
      if (publicConnectivity != null) 'publicConnectivity': publicConnectivity,
      if (replicaCount != null) 'replicaCount': replicaCount,
      if (tags != null) 'tags': tags,
      if (vectorSearchConfiguration != null)
        'vectorSearchConfiguration': vectorSearchConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/importtasks',
      exceptionFnMap: _exceptionFns,
    );
    return CreateGraphUsingImportTaskOutput.fromJson(response);
  }

  /// Retrieves a specified export task.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [taskIdentifier] :
  /// The unique identifier of the export task.
  Future<GetExportTaskOutput> getExportTask({
    required String taskIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/exporttasks/${Uri.encodeComponent(taskIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetExportTaskOutput.fromJson(response);
  }

  /// Retrieves a specified import task.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [taskIdentifier] :
  /// The unique identifier of the import task.
  Future<GetImportTaskOutput> getImportTask({
    required String taskIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/importtasks/${Uri.encodeComponent(taskIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetImportTaskOutput.fromJson(response);
  }

  /// Retrieves a list of export tasks.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [graphIdentifier] :
  /// The unique identifier of the Neptune Analytics graph.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of export tasks to return.
  ///
  /// Parameter [nextToken] :
  /// Pagination token used to paginate input.
  Future<ListExportTasksOutput> listExportTasks({
    String? graphIdentifier,
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
      if (graphIdentifier != null) 'graphIdentifier': [graphIdentifier],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/exporttasks',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListExportTasksOutput.fromJson(response);
  }

  /// Lists import tasks.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The total number of records to return in the command's output.
  ///
  /// If the total number of records available is more than the value specified,
  /// <code>nextToken</code> is provided in the command's output. To resume
  /// pagination, provide the <code>nextToken</code> output value in the
  /// <code>nextToken</code> argument of a subsequent command. Do not use the
  /// <code>nextToken</code> response element directly outside of the Amazon
  /// CLI.
  ///
  /// Parameter [nextToken] :
  /// Pagination token used to paginate output.
  ///
  /// When this value is provided as input, the service returns results from
  /// where the previous response left off. When this value is present in
  /// output, it indicates that there are more results to retrieve.
  Future<ListImportTasksOutput> listImportTasks({
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
      requestUri: '/importtasks',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListImportTasksOutput.fromJson(response);
  }

  /// Export data from an existing Neptune Analytics graph to Amazon S3. The
  /// graph state should be <code>AVAILABLE</code>.
  ///
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [destination] :
  /// The Amazon S3 URI where data will be exported to.
  ///
  /// Parameter [format] :
  /// The format of the export task.
  ///
  /// Parameter [graphIdentifier] :
  /// The source graph identifier of the export task.
  ///
  /// Parameter [kmsKeyIdentifier] :
  /// The KMS key identifier of the export task.
  ///
  /// Parameter [roleArn] :
  /// The ARN of the IAM role that will allow data to be exported to the
  /// destination.
  ///
  /// Parameter [exportFilter] :
  /// The export filter of the export task.
  ///
  /// Parameter [parquetType] :
  /// The parquet type of the export task.
  ///
  /// Parameter [tags] :
  /// Tags to be applied to the export task.
  Future<StartExportTaskOutput> startExportTask({
    required String destination,
    required ExportFormat format,
    required String graphIdentifier,
    required String kmsKeyIdentifier,
    required String roleArn,
    ExportFilter? exportFilter,
    ParquetType? parquetType,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'destination': destination,
      'format': format.value,
      'graphIdentifier': graphIdentifier,
      'kmsKeyIdentifier': kmsKeyIdentifier,
      'roleArn': roleArn,
      if (exportFilter != null) 'exportFilter': exportFilter,
      if (parquetType != null) 'parquetType': parquetType.value,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/exporttasks',
      exceptionFnMap: _exceptionFns,
    );
    return StartExportTaskOutput.fromJson(response);
  }

  /// Import data into existing Neptune Analytics graph from Amazon Simple
  /// Storage Service (S3). The graph needs to be empty and in the AVAILABLE
  /// state.
  ///
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [graphIdentifier] :
  /// The unique identifier of the Neptune Analytics graph.
  ///
  /// Parameter [roleArn] :
  /// The ARN of the IAM role that will allow access to the data that is to be
  /// imported.
  ///
  /// Parameter [source] :
  /// A URL identifying the location of the data to be imported. This can be an
  /// Amazon S3 path, or can point to a Neptune database endpoint or snapshot.
  ///
  /// Parameter [blankNodeHandling] :
  /// The method to handle blank nodes in the dataset. Currently, only
  /// <code>convertToIri</code> is supported, meaning blank nodes are converted
  /// to unique IRIs at load time. Must be provided when format is
  /// <code>ntriples</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/neptune-analytics/latest/userguide/using-rdf-data.html#rdf-handling">Handling
  /// RDF values</a>.
  ///
  /// Parameter [failOnError] :
  /// If set to true, the task halts when an import error is encountered. If set
  /// to false, the task skips the data that caused the error and continues if
  /// possible.
  ///
  /// Parameter [format] :
  /// Specifies the format of Amazon S3 data to be imported. Valid values are
  /// CSV, which identifies the Gremlin CSV format or OPENCYPHER, which
  /// identifies the openCypher load format.
  ///
  /// Parameter [parquetType] :
  /// The parquet type of the import task.
  Future<StartImportTaskOutput> startImportTask({
    required String graphIdentifier,
    required String roleArn,
    required String source,
    BlankNodeHandling? blankNodeHandling,
    bool? failOnError,
    Format? format,
    ImportOptions? importOptions,
    ParquetType? parquetType,
  }) async {
    final $payload = <String, dynamic>{
      'roleArn': roleArn,
      'source': source,
      if (blankNodeHandling != null)
        'blankNodeHandling': blankNodeHandling.value,
      if (failOnError != null) 'failOnError': failOnError,
      if (format != null) 'format': format.value,
      if (importOptions != null) 'importOptions': importOptions,
      if (parquetType != null) 'parquetType': parquetType.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/graphs/${Uri.encodeComponent(graphIdentifier)}/importtasks',
      exceptionFnMap: _exceptionFns,
    );
    return StartImportTaskOutput.fromJson(response);
  }
}

class ExecuteQueryOutput {
  /// The query results.
  final Uint8List payload;

  ExecuteQueryOutput({
    required this.payload,
  });

  Map<String, dynamic> toJson() {
    final payload = this.payload;
    return {
      'payload': base64Encode(payload),
    };
  }
}

class GetGraphSummaryOutput {
  /// The graph summary.
  final GraphDataSummary? graphSummary;

  /// The timestamp, in ISO 8601 format, of the time at which Neptune Analytics
  /// last computed statistics.
  final DateTime? lastStatisticsComputationTime;

  /// Display the version of this tool.
  final String? version;

  GetGraphSummaryOutput({
    this.graphSummary,
    this.lastStatisticsComputationTime,
    this.version,
  });

  factory GetGraphSummaryOutput.fromJson(Map<String, dynamic> json) {
    return GetGraphSummaryOutput(
      graphSummary: json['graphSummary'] != null
          ? GraphDataSummary.fromJson(
              json['graphSummary'] as Map<String, dynamic>)
          : null,
      lastStatisticsComputationTime:
          timeStampFromJson(json['lastStatisticsComputationTime']),
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final graphSummary = this.graphSummary;
    final lastStatisticsComputationTime = this.lastStatisticsComputationTime;
    final version = this.version;
    return {
      if (graphSummary != null) 'graphSummary': graphSummary,
      if (lastStatisticsComputationTime != null)
        'lastStatisticsComputationTime':
            iso8601ToJson(lastStatisticsComputationTime),
      if (version != null) 'version': version,
    };
  }
}

class GetQueryOutput {
  /// The number of milliseconds the query has been running.
  final int? elapsed;

  /// The ID of the query in question.
  final String? id;

  /// The query in question.
  final String? queryString;

  /// State of the query.
  final QueryState? state;

  /// Indicates how long the query waited, in milliseconds.
  final int? waited;

  GetQueryOutput({
    this.elapsed,
    this.id,
    this.queryString,
    this.state,
    this.waited,
  });

  factory GetQueryOutput.fromJson(Map<String, dynamic> json) {
    return GetQueryOutput(
      elapsed: json['elapsed'] as int?,
      id: json['id'] as String?,
      queryString: json['queryString'] as String?,
      state: (json['state'] as String?)?.let(QueryState.fromString),
      waited: json['waited'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final elapsed = this.elapsed;
    final id = this.id;
    final queryString = this.queryString;
    final state = this.state;
    final waited = this.waited;
    return {
      if (elapsed != null) 'elapsed': elapsed,
      if (id != null) 'id': id,
      if (queryString != null) 'queryString': queryString,
      if (state != null) 'state': state.value,
      if (waited != null) 'waited': waited,
    };
  }
}

class ListQueriesOutput {
  /// A list of current openCypher queries.
  final List<QuerySummary> queries;

  ListQueriesOutput({
    required this.queries,
  });

  factory ListQueriesOutput.fromJson(Map<String, dynamic> json) {
    return ListQueriesOutput(
      queries: ((json['queries'] as List?) ?? const [])
          .nonNulls
          .map((e) => QuerySummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final queries = this.queries;
    return {
      'queries': queries,
    };
  }
}

class ListTagsForResourceOutput {
  /// The list of metadata tags associated with the resource.
  final Map<String, String>? tags;

  ListTagsForResourceOutput({
    this.tags,
  });

  factory ListTagsForResourceOutput.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceOutput(
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

class TagResourceOutput {
  TagResourceOutput();

  factory TagResourceOutput.fromJson(Map<String, dynamic> _) {
    return TagResourceOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UntagResourceOutput {
  UntagResourceOutput();

  factory UntagResourceOutput.fromJson(Map<String, dynamic> _) {
    return UntagResourceOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class CreateGraphOutput {
  /// The ARN of the graph.
  final String arn;

  /// The ID of the graph.
  final String id;

  /// The graph name. For example: <code>my-graph-1</code>.
  ///
  /// The name must contain from 1 to 63 letters, numbers, or hyphens, and its
  /// first character must be a letter. It cannot end with a hyphen or contain two
  /// consecutive hyphens. Only lowercase letters are allowed.
  final String name;

  /// The build number of the graph software.
  final String? buildNumber;

  /// The time when the graph was created.
  final DateTime? createTime;

  /// A value that indicates whether the graph has deletion protection enabled.
  /// The graph can't be deleted when deletion protection is enabled.
  final bool? deletionProtection;

  /// The graph endpoint.
  final String? endpoint;

  /// Specifies the KMS key used to encrypt data in the new graph.
  final String? kmsKeyIdentifier;

  /// The provisioned memory-optimized Neptune Capacity Units (m-NCUs) to use for
  /// the graph.
  ///
  /// Min = 16
  final int? provisionedMemory;

  /// Specifies whether or not the graph can be reachable over the internet. All
  /// access to graphs is IAM authenticated.
  /// <note>
  /// If enabling public connectivity for the first time, there will be a delay
  /// while it is enabled.
  /// </note>
  final bool? publicConnectivity;

  /// The number of replicas in other AZs.
  ///
  /// Default: If not specified, the default value is 1.
  final int? replicaCount;

  /// The ID of the source graph.
  final String? sourceSnapshotId;

  /// The current status of the graph.
  final GraphStatus? status;

  /// The reason the status was given.
  final String? statusReason;

  /// The vector-search configuration for the graph, which specifies the vector
  /// dimension to use in the vector index, if any.
  final VectorSearchConfiguration? vectorSearchConfiguration;

  CreateGraphOutput({
    required this.arn,
    required this.id,
    required this.name,
    this.buildNumber,
    this.createTime,
    this.deletionProtection,
    this.endpoint,
    this.kmsKeyIdentifier,
    this.provisionedMemory,
    this.publicConnectivity,
    this.replicaCount,
    this.sourceSnapshotId,
    this.status,
    this.statusReason,
    this.vectorSearchConfiguration,
  });

  factory CreateGraphOutput.fromJson(Map<String, dynamic> json) {
    return CreateGraphOutput(
      arn: (json['arn'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      buildNumber: json['buildNumber'] as String?,
      createTime: timeStampFromJson(json['createTime']),
      deletionProtection: json['deletionProtection'] as bool?,
      endpoint: json['endpoint'] as String?,
      kmsKeyIdentifier: json['kmsKeyIdentifier'] as String?,
      provisionedMemory: json['provisionedMemory'] as int?,
      publicConnectivity: json['publicConnectivity'] as bool?,
      replicaCount: json['replicaCount'] as int?,
      sourceSnapshotId: json['sourceSnapshotId'] as String?,
      status: (json['status'] as String?)?.let(GraphStatus.fromString),
      statusReason: json['statusReason'] as String?,
      vectorSearchConfiguration: json['vectorSearchConfiguration'] != null
          ? VectorSearchConfiguration.fromJson(
              json['vectorSearchConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final name = this.name;
    final buildNumber = this.buildNumber;
    final createTime = this.createTime;
    final deletionProtection = this.deletionProtection;
    final endpoint = this.endpoint;
    final kmsKeyIdentifier = this.kmsKeyIdentifier;
    final provisionedMemory = this.provisionedMemory;
    final publicConnectivity = this.publicConnectivity;
    final replicaCount = this.replicaCount;
    final sourceSnapshotId = this.sourceSnapshotId;
    final status = this.status;
    final statusReason = this.statusReason;
    final vectorSearchConfiguration = this.vectorSearchConfiguration;
    return {
      'arn': arn,
      'id': id,
      'name': name,
      if (buildNumber != null) 'buildNumber': buildNumber,
      if (createTime != null) 'createTime': unixTimestampToJson(createTime),
      if (deletionProtection != null) 'deletionProtection': deletionProtection,
      if (endpoint != null) 'endpoint': endpoint,
      if (kmsKeyIdentifier != null) 'kmsKeyIdentifier': kmsKeyIdentifier,
      if (provisionedMemory != null) 'provisionedMemory': provisionedMemory,
      if (publicConnectivity != null) 'publicConnectivity': publicConnectivity,
      if (replicaCount != null) 'replicaCount': replicaCount,
      if (sourceSnapshotId != null) 'sourceSnapshotId': sourceSnapshotId,
      if (status != null) 'status': status.value,
      if (statusReason != null) 'statusReason': statusReason,
      if (vectorSearchConfiguration != null)
        'vectorSearchConfiguration': vectorSearchConfiguration,
    };
  }
}

class DeleteGraphOutput {
  /// The ARN associated with the graph.
  final String arn;

  /// The unique identifier of the graph.
  final String id;

  /// The name of the graph.
  final String name;

  /// The build number associated with the graph.
  final String? buildNumber;

  /// The time at which the graph was created.
  final DateTime? createTime;

  /// If <code>true</code>, deletion protection was enabled for the graph.
  final bool? deletionProtection;

  /// The graph endpoint.
  final String? endpoint;

  /// The ID of the KMS key used to encrypt and decrypt graph data.
  final String? kmsKeyIdentifier;

  /// The number of memory-optimized Neptune Capacity Units (m-NCUs) allocated to
  /// the graph.
  final int? provisionedMemory;

  /// If <code>true</code>, the graph has a public endpoint, otherwise not.
  final bool? publicConnectivity;

  /// The number of replicas for the graph.
  final int? replicaCount;

  /// The ID of the snapshot from which the graph was created, if the graph was
  /// recovered from a snapshot.
  final String? sourceSnapshotId;

  /// The status of the graph.
  final GraphStatus? status;

  /// The reason for the status of the graph.
  final String? statusReason;
  final VectorSearchConfiguration? vectorSearchConfiguration;

  DeleteGraphOutput({
    required this.arn,
    required this.id,
    required this.name,
    this.buildNumber,
    this.createTime,
    this.deletionProtection,
    this.endpoint,
    this.kmsKeyIdentifier,
    this.provisionedMemory,
    this.publicConnectivity,
    this.replicaCount,
    this.sourceSnapshotId,
    this.status,
    this.statusReason,
    this.vectorSearchConfiguration,
  });

  factory DeleteGraphOutput.fromJson(Map<String, dynamic> json) {
    return DeleteGraphOutput(
      arn: (json['arn'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      buildNumber: json['buildNumber'] as String?,
      createTime: timeStampFromJson(json['createTime']),
      deletionProtection: json['deletionProtection'] as bool?,
      endpoint: json['endpoint'] as String?,
      kmsKeyIdentifier: json['kmsKeyIdentifier'] as String?,
      provisionedMemory: json['provisionedMemory'] as int?,
      publicConnectivity: json['publicConnectivity'] as bool?,
      replicaCount: json['replicaCount'] as int?,
      sourceSnapshotId: json['sourceSnapshotId'] as String?,
      status: (json['status'] as String?)?.let(GraphStatus.fromString),
      statusReason: json['statusReason'] as String?,
      vectorSearchConfiguration: json['vectorSearchConfiguration'] != null
          ? VectorSearchConfiguration.fromJson(
              json['vectorSearchConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final name = this.name;
    final buildNumber = this.buildNumber;
    final createTime = this.createTime;
    final deletionProtection = this.deletionProtection;
    final endpoint = this.endpoint;
    final kmsKeyIdentifier = this.kmsKeyIdentifier;
    final provisionedMemory = this.provisionedMemory;
    final publicConnectivity = this.publicConnectivity;
    final replicaCount = this.replicaCount;
    final sourceSnapshotId = this.sourceSnapshotId;
    final status = this.status;
    final statusReason = this.statusReason;
    final vectorSearchConfiguration = this.vectorSearchConfiguration;
    return {
      'arn': arn,
      'id': id,
      'name': name,
      if (buildNumber != null) 'buildNumber': buildNumber,
      if (createTime != null) 'createTime': unixTimestampToJson(createTime),
      if (deletionProtection != null) 'deletionProtection': deletionProtection,
      if (endpoint != null) 'endpoint': endpoint,
      if (kmsKeyIdentifier != null) 'kmsKeyIdentifier': kmsKeyIdentifier,
      if (provisionedMemory != null) 'provisionedMemory': provisionedMemory,
      if (publicConnectivity != null) 'publicConnectivity': publicConnectivity,
      if (replicaCount != null) 'replicaCount': replicaCount,
      if (sourceSnapshotId != null) 'sourceSnapshotId': sourceSnapshotId,
      if (status != null) 'status': status.value,
      if (statusReason != null) 'statusReason': statusReason,
      if (vectorSearchConfiguration != null)
        'vectorSearchConfiguration': vectorSearchConfiguration,
    };
  }
}

class GetGraphOutput {
  /// The ARN associated with the graph.
  final String arn;

  /// The unique identifier of the graph.
  final String id;

  /// The name of the graph.
  final String name;

  /// The build number of the graph.
  final String? buildNumber;

  /// The time at which the graph was created.
  final DateTime? createTime;

  /// If <code>true</code>, deletion protection is enabled for the graph.
  final bool? deletionProtection;

  /// The graph endpoint.
  final String? endpoint;

  /// The ID of the KMS key used to encrypt and decrypt graph data.
  final String? kmsKeyIdentifier;

  /// The number of memory-optimized Neptune Capacity Units (m-NCUs) allocated to
  /// the graph.
  final int? provisionedMemory;

  /// If <code>true</code>, the graph has a public endpoint, otherwise not.
  final bool? publicConnectivity;

  /// The number of replicas for the graph.
  final int? replicaCount;

  /// The ID of the snapshot from which the graph was created, if it was created
  /// from a snapshot.
  final String? sourceSnapshotId;

  /// The status of the graph.
  final GraphStatus? status;

  /// The reason that the graph has this status.
  final String? statusReason;
  final VectorSearchConfiguration? vectorSearchConfiguration;

  GetGraphOutput({
    required this.arn,
    required this.id,
    required this.name,
    this.buildNumber,
    this.createTime,
    this.deletionProtection,
    this.endpoint,
    this.kmsKeyIdentifier,
    this.provisionedMemory,
    this.publicConnectivity,
    this.replicaCount,
    this.sourceSnapshotId,
    this.status,
    this.statusReason,
    this.vectorSearchConfiguration,
  });

  factory GetGraphOutput.fromJson(Map<String, dynamic> json) {
    return GetGraphOutput(
      arn: (json['arn'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      buildNumber: json['buildNumber'] as String?,
      createTime: timeStampFromJson(json['createTime']),
      deletionProtection: json['deletionProtection'] as bool?,
      endpoint: json['endpoint'] as String?,
      kmsKeyIdentifier: json['kmsKeyIdentifier'] as String?,
      provisionedMemory: json['provisionedMemory'] as int?,
      publicConnectivity: json['publicConnectivity'] as bool?,
      replicaCount: json['replicaCount'] as int?,
      sourceSnapshotId: json['sourceSnapshotId'] as String?,
      status: (json['status'] as String?)?.let(GraphStatus.fromString),
      statusReason: json['statusReason'] as String?,
      vectorSearchConfiguration: json['vectorSearchConfiguration'] != null
          ? VectorSearchConfiguration.fromJson(
              json['vectorSearchConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final name = this.name;
    final buildNumber = this.buildNumber;
    final createTime = this.createTime;
    final deletionProtection = this.deletionProtection;
    final endpoint = this.endpoint;
    final kmsKeyIdentifier = this.kmsKeyIdentifier;
    final provisionedMemory = this.provisionedMemory;
    final publicConnectivity = this.publicConnectivity;
    final replicaCount = this.replicaCount;
    final sourceSnapshotId = this.sourceSnapshotId;
    final status = this.status;
    final statusReason = this.statusReason;
    final vectorSearchConfiguration = this.vectorSearchConfiguration;
    return {
      'arn': arn,
      'id': id,
      'name': name,
      if (buildNumber != null) 'buildNumber': buildNumber,
      if (createTime != null) 'createTime': unixTimestampToJson(createTime),
      if (deletionProtection != null) 'deletionProtection': deletionProtection,
      if (endpoint != null) 'endpoint': endpoint,
      if (kmsKeyIdentifier != null) 'kmsKeyIdentifier': kmsKeyIdentifier,
      if (provisionedMemory != null) 'provisionedMemory': provisionedMemory,
      if (publicConnectivity != null) 'publicConnectivity': publicConnectivity,
      if (replicaCount != null) 'replicaCount': replicaCount,
      if (sourceSnapshotId != null) 'sourceSnapshotId': sourceSnapshotId,
      if (status != null) 'status': status.value,
      if (statusReason != null) 'statusReason': statusReason,
      if (vectorSearchConfiguration != null)
        'vectorSearchConfiguration': vectorSearchConfiguration,
    };
  }
}

class ListGraphsOutput {
  /// A list of the graphs.
  final List<GraphSummary> graphs;

  /// Pagination token used to paginate output.
  ///
  /// When this value is provided as input, the service returns results from where
  /// the previous response left off. When this value is present in output, it
  /// indicates that there are more results to retrieve.
  final String? nextToken;

  ListGraphsOutput({
    required this.graphs,
    this.nextToken,
  });

  factory ListGraphsOutput.fromJson(Map<String, dynamic> json) {
    return ListGraphsOutput(
      graphs: ((json['graphs'] as List?) ?? const [])
          .nonNulls
          .map((e) => GraphSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final graphs = this.graphs;
    final nextToken = this.nextToken;
    return {
      'graphs': graphs,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ResetGraphOutput {
  /// The ARN associated with the graph.
  final String arn;

  /// The unique identifier of the graph.
  final String id;

  /// The name of the graph.
  final String name;

  /// The build number of the graph.
  final String? buildNumber;

  /// The time at which the graph was created.
  final DateTime? createTime;

  /// If <code>true</code>, deletion protection is enabled for the graph.
  final bool? deletionProtection;

  /// The graph endpoint.
  final String? endpoint;

  /// The ID of the KMS key used to encrypt and decrypt graph data.
  final String? kmsKeyIdentifier;

  /// The number of memory-optimized Neptune Capacity Units (m-NCUs) allocated to
  /// the graph.
  final int? provisionedMemory;

  /// If <code>true</code>, the graph has a public endpoint, otherwise not.
  final bool? publicConnectivity;

  /// The number of replicas for the graph.
  final int? replicaCount;

  /// The ID of the snapshot from which the graph was created, if any.
  final String? sourceSnapshotId;

  /// The status of the graph.
  final GraphStatus? status;

  /// The reason that the graph has this status.
  final String? statusReason;
  final VectorSearchConfiguration? vectorSearchConfiguration;

  ResetGraphOutput({
    required this.arn,
    required this.id,
    required this.name,
    this.buildNumber,
    this.createTime,
    this.deletionProtection,
    this.endpoint,
    this.kmsKeyIdentifier,
    this.provisionedMemory,
    this.publicConnectivity,
    this.replicaCount,
    this.sourceSnapshotId,
    this.status,
    this.statusReason,
    this.vectorSearchConfiguration,
  });

  factory ResetGraphOutput.fromJson(Map<String, dynamic> json) {
    return ResetGraphOutput(
      arn: (json['arn'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      buildNumber: json['buildNumber'] as String?,
      createTime: timeStampFromJson(json['createTime']),
      deletionProtection: json['deletionProtection'] as bool?,
      endpoint: json['endpoint'] as String?,
      kmsKeyIdentifier: json['kmsKeyIdentifier'] as String?,
      provisionedMemory: json['provisionedMemory'] as int?,
      publicConnectivity: json['publicConnectivity'] as bool?,
      replicaCount: json['replicaCount'] as int?,
      sourceSnapshotId: json['sourceSnapshotId'] as String?,
      status: (json['status'] as String?)?.let(GraphStatus.fromString),
      statusReason: json['statusReason'] as String?,
      vectorSearchConfiguration: json['vectorSearchConfiguration'] != null
          ? VectorSearchConfiguration.fromJson(
              json['vectorSearchConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final name = this.name;
    final buildNumber = this.buildNumber;
    final createTime = this.createTime;
    final deletionProtection = this.deletionProtection;
    final endpoint = this.endpoint;
    final kmsKeyIdentifier = this.kmsKeyIdentifier;
    final provisionedMemory = this.provisionedMemory;
    final publicConnectivity = this.publicConnectivity;
    final replicaCount = this.replicaCount;
    final sourceSnapshotId = this.sourceSnapshotId;
    final status = this.status;
    final statusReason = this.statusReason;
    final vectorSearchConfiguration = this.vectorSearchConfiguration;
    return {
      'arn': arn,
      'id': id,
      'name': name,
      if (buildNumber != null) 'buildNumber': buildNumber,
      if (createTime != null) 'createTime': unixTimestampToJson(createTime),
      if (deletionProtection != null) 'deletionProtection': deletionProtection,
      if (endpoint != null) 'endpoint': endpoint,
      if (kmsKeyIdentifier != null) 'kmsKeyIdentifier': kmsKeyIdentifier,
      if (provisionedMemory != null) 'provisionedMemory': provisionedMemory,
      if (publicConnectivity != null) 'publicConnectivity': publicConnectivity,
      if (replicaCount != null) 'replicaCount': replicaCount,
      if (sourceSnapshotId != null) 'sourceSnapshotId': sourceSnapshotId,
      if (status != null) 'status': status.value,
      if (statusReason != null) 'statusReason': statusReason,
      if (vectorSearchConfiguration != null)
        'vectorSearchConfiguration': vectorSearchConfiguration,
    };
  }
}

class RestoreGraphFromSnapshotOutput {
  /// The ARN associated with the graph.
  final String arn;

  /// The unique identifier of the graph.
  final String id;

  /// The name of the graph.
  final String name;

  /// The build number of the graph.
  final String? buildNumber;

  /// The time at which the graph was created.
  final DateTime? createTime;

  /// If <code>true</code>, deletion protection is enabled for the graph.
  final bool? deletionProtection;

  /// The graph endpoint.
  final String? endpoint;

  /// The ID of the KMS key used to encrypt and decrypt graph data.
  final String? kmsKeyIdentifier;

  /// The number of memory-optimized Neptune Capacity Units (m-NCUs) allocated to
  /// the graph.
  final int? provisionedMemory;

  /// If <code>true</code>, the graph has a public endpoint, otherwise not.
  final bool? publicConnectivity;

  /// The number of replicas for the graph.
  final int? replicaCount;

  /// The ID of the snapshot from which the graph was created, if any.
  final String? sourceSnapshotId;

  /// The status of the graph.
  final GraphStatus? status;

  /// The reason that the graph has this status.
  final String? statusReason;
  final VectorSearchConfiguration? vectorSearchConfiguration;

  RestoreGraphFromSnapshotOutput({
    required this.arn,
    required this.id,
    required this.name,
    this.buildNumber,
    this.createTime,
    this.deletionProtection,
    this.endpoint,
    this.kmsKeyIdentifier,
    this.provisionedMemory,
    this.publicConnectivity,
    this.replicaCount,
    this.sourceSnapshotId,
    this.status,
    this.statusReason,
    this.vectorSearchConfiguration,
  });

  factory RestoreGraphFromSnapshotOutput.fromJson(Map<String, dynamic> json) {
    return RestoreGraphFromSnapshotOutput(
      arn: (json['arn'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      buildNumber: json['buildNumber'] as String?,
      createTime: timeStampFromJson(json['createTime']),
      deletionProtection: json['deletionProtection'] as bool?,
      endpoint: json['endpoint'] as String?,
      kmsKeyIdentifier: json['kmsKeyIdentifier'] as String?,
      provisionedMemory: json['provisionedMemory'] as int?,
      publicConnectivity: json['publicConnectivity'] as bool?,
      replicaCount: json['replicaCount'] as int?,
      sourceSnapshotId: json['sourceSnapshotId'] as String?,
      status: (json['status'] as String?)?.let(GraphStatus.fromString),
      statusReason: json['statusReason'] as String?,
      vectorSearchConfiguration: json['vectorSearchConfiguration'] != null
          ? VectorSearchConfiguration.fromJson(
              json['vectorSearchConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final name = this.name;
    final buildNumber = this.buildNumber;
    final createTime = this.createTime;
    final deletionProtection = this.deletionProtection;
    final endpoint = this.endpoint;
    final kmsKeyIdentifier = this.kmsKeyIdentifier;
    final provisionedMemory = this.provisionedMemory;
    final publicConnectivity = this.publicConnectivity;
    final replicaCount = this.replicaCount;
    final sourceSnapshotId = this.sourceSnapshotId;
    final status = this.status;
    final statusReason = this.statusReason;
    final vectorSearchConfiguration = this.vectorSearchConfiguration;
    return {
      'arn': arn,
      'id': id,
      'name': name,
      if (buildNumber != null) 'buildNumber': buildNumber,
      if (createTime != null) 'createTime': unixTimestampToJson(createTime),
      if (deletionProtection != null) 'deletionProtection': deletionProtection,
      if (endpoint != null) 'endpoint': endpoint,
      if (kmsKeyIdentifier != null) 'kmsKeyIdentifier': kmsKeyIdentifier,
      if (provisionedMemory != null) 'provisionedMemory': provisionedMemory,
      if (publicConnectivity != null) 'publicConnectivity': publicConnectivity,
      if (replicaCount != null) 'replicaCount': replicaCount,
      if (sourceSnapshotId != null) 'sourceSnapshotId': sourceSnapshotId,
      if (status != null) 'status': status.value,
      if (statusReason != null) 'statusReason': statusReason,
      if (vectorSearchConfiguration != null)
        'vectorSearchConfiguration': vectorSearchConfiguration,
    };
  }
}

class StartGraphOutput {
  /// The ARN associated with the graph.
  final String arn;

  /// The unique identifier of the graph.
  final String id;

  /// The name of the graph.
  final String name;

  /// The build number of the graph.
  final String? buildNumber;

  /// The time at which the graph was created.
  final DateTime? createTime;

  /// If <code>true</code>, deletion protection is enabled for the graph.
  final bool? deletionProtection;

  /// The graph endpoint.
  final String? endpoint;

  /// The ID of the KMS key used to encrypt and decrypt graph data.
  final String? kmsKeyIdentifier;

  /// The number of memory-optimized Neptune Capacity Units (m-NCUs) allocated to
  /// the graph.
  final int? provisionedMemory;

  /// If <code>true</code>, the graph has a public endpoint, otherwise not.
  final bool? publicConnectivity;

  /// The number of replicas for the graph.
  final int? replicaCount;

  /// The ID of the snapshot from which the graph was created, if it was created
  /// from a snapshot.
  final String? sourceSnapshotId;

  /// The status of the graph.
  final GraphStatus? status;

  /// The reason that the graph has this status.
  final String? statusReason;
  final VectorSearchConfiguration? vectorSearchConfiguration;

  StartGraphOutput({
    required this.arn,
    required this.id,
    required this.name,
    this.buildNumber,
    this.createTime,
    this.deletionProtection,
    this.endpoint,
    this.kmsKeyIdentifier,
    this.provisionedMemory,
    this.publicConnectivity,
    this.replicaCount,
    this.sourceSnapshotId,
    this.status,
    this.statusReason,
    this.vectorSearchConfiguration,
  });

  factory StartGraphOutput.fromJson(Map<String, dynamic> json) {
    return StartGraphOutput(
      arn: (json['arn'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      buildNumber: json['buildNumber'] as String?,
      createTime: timeStampFromJson(json['createTime']),
      deletionProtection: json['deletionProtection'] as bool?,
      endpoint: json['endpoint'] as String?,
      kmsKeyIdentifier: json['kmsKeyIdentifier'] as String?,
      provisionedMemory: json['provisionedMemory'] as int?,
      publicConnectivity: json['publicConnectivity'] as bool?,
      replicaCount: json['replicaCount'] as int?,
      sourceSnapshotId: json['sourceSnapshotId'] as String?,
      status: (json['status'] as String?)?.let(GraphStatus.fromString),
      statusReason: json['statusReason'] as String?,
      vectorSearchConfiguration: json['vectorSearchConfiguration'] != null
          ? VectorSearchConfiguration.fromJson(
              json['vectorSearchConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final name = this.name;
    final buildNumber = this.buildNumber;
    final createTime = this.createTime;
    final deletionProtection = this.deletionProtection;
    final endpoint = this.endpoint;
    final kmsKeyIdentifier = this.kmsKeyIdentifier;
    final provisionedMemory = this.provisionedMemory;
    final publicConnectivity = this.publicConnectivity;
    final replicaCount = this.replicaCount;
    final sourceSnapshotId = this.sourceSnapshotId;
    final status = this.status;
    final statusReason = this.statusReason;
    final vectorSearchConfiguration = this.vectorSearchConfiguration;
    return {
      'arn': arn,
      'id': id,
      'name': name,
      if (buildNumber != null) 'buildNumber': buildNumber,
      if (createTime != null) 'createTime': unixTimestampToJson(createTime),
      if (deletionProtection != null) 'deletionProtection': deletionProtection,
      if (endpoint != null) 'endpoint': endpoint,
      if (kmsKeyIdentifier != null) 'kmsKeyIdentifier': kmsKeyIdentifier,
      if (provisionedMemory != null) 'provisionedMemory': provisionedMemory,
      if (publicConnectivity != null) 'publicConnectivity': publicConnectivity,
      if (replicaCount != null) 'replicaCount': replicaCount,
      if (sourceSnapshotId != null) 'sourceSnapshotId': sourceSnapshotId,
      if (status != null) 'status': status.value,
      if (statusReason != null) 'statusReason': statusReason,
      if (vectorSearchConfiguration != null)
        'vectorSearchConfiguration': vectorSearchConfiguration,
    };
  }
}

class StopGraphOutput {
  /// The ARN associated with the graph.
  final String arn;

  /// The unique identifier of the graph.
  final String id;

  /// The name of the graph.
  final String name;

  /// The build number of the graph.
  final String? buildNumber;

  /// The time at which the graph was created.
  final DateTime? createTime;

  /// If <code>true</code>, deletion protection is enabled for the graph.
  final bool? deletionProtection;

  /// The graph endpoint.
  final String? endpoint;

  /// The ID of the KMS key used to encrypt and decrypt graph data.
  final String? kmsKeyIdentifier;

  /// The number of memory-optimized Neptune Capacity Units (m-NCUs) allocated to
  /// the graph.
  final int? provisionedMemory;

  /// If true, the graph has a public endpoint, otherwise not.
  final bool? publicConnectivity;

  /// The number of replicas for the graph.
  final int? replicaCount;

  /// The ID of the snapshot from which the graph was created, if it was created
  /// from a snapshot.
  final String? sourceSnapshotId;

  /// The status of the graph.
  final GraphStatus? status;

  /// The reason that the graph has this status.
  final String? statusReason;
  final VectorSearchConfiguration? vectorSearchConfiguration;

  StopGraphOutput({
    required this.arn,
    required this.id,
    required this.name,
    this.buildNumber,
    this.createTime,
    this.deletionProtection,
    this.endpoint,
    this.kmsKeyIdentifier,
    this.provisionedMemory,
    this.publicConnectivity,
    this.replicaCount,
    this.sourceSnapshotId,
    this.status,
    this.statusReason,
    this.vectorSearchConfiguration,
  });

  factory StopGraphOutput.fromJson(Map<String, dynamic> json) {
    return StopGraphOutput(
      arn: (json['arn'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      buildNumber: json['buildNumber'] as String?,
      createTime: timeStampFromJson(json['createTime']),
      deletionProtection: json['deletionProtection'] as bool?,
      endpoint: json['endpoint'] as String?,
      kmsKeyIdentifier: json['kmsKeyIdentifier'] as String?,
      provisionedMemory: json['provisionedMemory'] as int?,
      publicConnectivity: json['publicConnectivity'] as bool?,
      replicaCount: json['replicaCount'] as int?,
      sourceSnapshotId: json['sourceSnapshotId'] as String?,
      status: (json['status'] as String?)?.let(GraphStatus.fromString),
      statusReason: json['statusReason'] as String?,
      vectorSearchConfiguration: json['vectorSearchConfiguration'] != null
          ? VectorSearchConfiguration.fromJson(
              json['vectorSearchConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final name = this.name;
    final buildNumber = this.buildNumber;
    final createTime = this.createTime;
    final deletionProtection = this.deletionProtection;
    final endpoint = this.endpoint;
    final kmsKeyIdentifier = this.kmsKeyIdentifier;
    final provisionedMemory = this.provisionedMemory;
    final publicConnectivity = this.publicConnectivity;
    final replicaCount = this.replicaCount;
    final sourceSnapshotId = this.sourceSnapshotId;
    final status = this.status;
    final statusReason = this.statusReason;
    final vectorSearchConfiguration = this.vectorSearchConfiguration;
    return {
      'arn': arn,
      'id': id,
      'name': name,
      if (buildNumber != null) 'buildNumber': buildNumber,
      if (createTime != null) 'createTime': unixTimestampToJson(createTime),
      if (deletionProtection != null) 'deletionProtection': deletionProtection,
      if (endpoint != null) 'endpoint': endpoint,
      if (kmsKeyIdentifier != null) 'kmsKeyIdentifier': kmsKeyIdentifier,
      if (provisionedMemory != null) 'provisionedMemory': provisionedMemory,
      if (publicConnectivity != null) 'publicConnectivity': publicConnectivity,
      if (replicaCount != null) 'replicaCount': replicaCount,
      if (sourceSnapshotId != null) 'sourceSnapshotId': sourceSnapshotId,
      if (status != null) 'status': status.value,
      if (statusReason != null) 'statusReason': statusReason,
      if (vectorSearchConfiguration != null)
        'vectorSearchConfiguration': vectorSearchConfiguration,
    };
  }
}

class UpdateGraphOutput {
  /// The ARN associated with the graph.
  final String arn;

  /// The unique identifier of the graph.
  final String id;

  /// The name of the graph.
  final String name;

  /// The build number of the graph.
  final String? buildNumber;

  /// The time at which the graph was created.
  final DateTime? createTime;

  /// If <code>true</code>, deletion protection is enabled for the graph.
  final bool? deletionProtection;

  /// The graph endpoint.
  final String? endpoint;

  /// The ID of the KMS key used to encrypt and decrypt graph data.
  final String? kmsKeyIdentifier;

  /// The number of memory-optimized Neptune Capacity Units (m-NCUs) allocated to
  /// the graph.
  final int? provisionedMemory;

  /// If <code>true</code>, the graph has a public endpoint, otherwise not.
  final bool? publicConnectivity;

  /// The number of replicas for the graph.
  final int? replicaCount;

  /// The ID of the snapshot from which the graph was created, if any.
  final String? sourceSnapshotId;

  /// The status of the graph.
  final GraphStatus? status;

  /// The reason that the graph has this status.
  final String? statusReason;
  final VectorSearchConfiguration? vectorSearchConfiguration;

  UpdateGraphOutput({
    required this.arn,
    required this.id,
    required this.name,
    this.buildNumber,
    this.createTime,
    this.deletionProtection,
    this.endpoint,
    this.kmsKeyIdentifier,
    this.provisionedMemory,
    this.publicConnectivity,
    this.replicaCount,
    this.sourceSnapshotId,
    this.status,
    this.statusReason,
    this.vectorSearchConfiguration,
  });

  factory UpdateGraphOutput.fromJson(Map<String, dynamic> json) {
    return UpdateGraphOutput(
      arn: (json['arn'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      buildNumber: json['buildNumber'] as String?,
      createTime: timeStampFromJson(json['createTime']),
      deletionProtection: json['deletionProtection'] as bool?,
      endpoint: json['endpoint'] as String?,
      kmsKeyIdentifier: json['kmsKeyIdentifier'] as String?,
      provisionedMemory: json['provisionedMemory'] as int?,
      publicConnectivity: json['publicConnectivity'] as bool?,
      replicaCount: json['replicaCount'] as int?,
      sourceSnapshotId: json['sourceSnapshotId'] as String?,
      status: (json['status'] as String?)?.let(GraphStatus.fromString),
      statusReason: json['statusReason'] as String?,
      vectorSearchConfiguration: json['vectorSearchConfiguration'] != null
          ? VectorSearchConfiguration.fromJson(
              json['vectorSearchConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final name = this.name;
    final buildNumber = this.buildNumber;
    final createTime = this.createTime;
    final deletionProtection = this.deletionProtection;
    final endpoint = this.endpoint;
    final kmsKeyIdentifier = this.kmsKeyIdentifier;
    final provisionedMemory = this.provisionedMemory;
    final publicConnectivity = this.publicConnectivity;
    final replicaCount = this.replicaCount;
    final sourceSnapshotId = this.sourceSnapshotId;
    final status = this.status;
    final statusReason = this.statusReason;
    final vectorSearchConfiguration = this.vectorSearchConfiguration;
    return {
      'arn': arn,
      'id': id,
      'name': name,
      if (buildNumber != null) 'buildNumber': buildNumber,
      if (createTime != null) 'createTime': unixTimestampToJson(createTime),
      if (deletionProtection != null) 'deletionProtection': deletionProtection,
      if (endpoint != null) 'endpoint': endpoint,
      if (kmsKeyIdentifier != null) 'kmsKeyIdentifier': kmsKeyIdentifier,
      if (provisionedMemory != null) 'provisionedMemory': provisionedMemory,
      if (publicConnectivity != null) 'publicConnectivity': publicConnectivity,
      if (replicaCount != null) 'replicaCount': replicaCount,
      if (sourceSnapshotId != null) 'sourceSnapshotId': sourceSnapshotId,
      if (status != null) 'status': status.value,
      if (statusReason != null) 'statusReason': statusReason,
      if (vectorSearchConfiguration != null)
        'vectorSearchConfiguration': vectorSearchConfiguration,
    };
  }
}

class CreatePrivateGraphEndpointOutput {
  /// Status of the private graph endpoint.
  final PrivateGraphEndpointStatus status;

  /// Subnets in which the private graph endpoint ENIs are created.
  final List<String> subnetIds;

  /// VPC in which the private graph endpoint is created.
  final String vpcId;

  /// Endpoint ID of the private graph endpoint.
  final String? vpcEndpointId;

  CreatePrivateGraphEndpointOutput({
    required this.status,
    required this.subnetIds,
    required this.vpcId,
    this.vpcEndpointId,
  });

  factory CreatePrivateGraphEndpointOutput.fromJson(Map<String, dynamic> json) {
    return CreatePrivateGraphEndpointOutput(
      status: PrivateGraphEndpointStatus.fromString(
          (json['status'] as String?) ?? ''),
      subnetIds: ((json['subnetIds'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      vpcId: (json['vpcId'] as String?) ?? '',
      vpcEndpointId: json['vpcEndpointId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final subnetIds = this.subnetIds;
    final vpcId = this.vpcId;
    final vpcEndpointId = this.vpcEndpointId;
    return {
      'status': status.value,
      'subnetIds': subnetIds,
      'vpcId': vpcId,
      if (vpcEndpointId != null) 'vpcEndpointId': vpcEndpointId,
    };
  }
}

class DeletePrivateGraphEndpointOutput {
  /// The status of the delete operation.
  final PrivateGraphEndpointStatus status;

  /// The subnet IDs involved.
  final List<String> subnetIds;

  /// The ID of the VPC where the private endpoint was deleted.
  final String vpcId;

  /// The ID of the VPC endpoint that was deleted.
  final String? vpcEndpointId;

  DeletePrivateGraphEndpointOutput({
    required this.status,
    required this.subnetIds,
    required this.vpcId,
    this.vpcEndpointId,
  });

  factory DeletePrivateGraphEndpointOutput.fromJson(Map<String, dynamic> json) {
    return DeletePrivateGraphEndpointOutput(
      status: PrivateGraphEndpointStatus.fromString(
          (json['status'] as String?) ?? ''),
      subnetIds: ((json['subnetIds'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      vpcId: (json['vpcId'] as String?) ?? '',
      vpcEndpointId: json['vpcEndpointId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final subnetIds = this.subnetIds;
    final vpcId = this.vpcId;
    final vpcEndpointId = this.vpcEndpointId;
    return {
      'status': status.value,
      'subnetIds': subnetIds,
      'vpcId': vpcId,
      if (vpcEndpointId != null) 'vpcEndpointId': vpcEndpointId,
    };
  }
}

class GetPrivateGraphEndpointOutput {
  /// The current status of the private endpoint.
  final PrivateGraphEndpointStatus status;

  /// The subnet IDs involved.
  final List<String> subnetIds;

  /// The ID of the VPC where the private endpoint is located.
  final String vpcId;

  /// The ID of the private endpoint.
  final String? vpcEndpointId;

  GetPrivateGraphEndpointOutput({
    required this.status,
    required this.subnetIds,
    required this.vpcId,
    this.vpcEndpointId,
  });

  factory GetPrivateGraphEndpointOutput.fromJson(Map<String, dynamic> json) {
    return GetPrivateGraphEndpointOutput(
      status: PrivateGraphEndpointStatus.fromString(
          (json['status'] as String?) ?? ''),
      subnetIds: ((json['subnetIds'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      vpcId: (json['vpcId'] as String?) ?? '',
      vpcEndpointId: json['vpcEndpointId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final subnetIds = this.subnetIds;
    final vpcId = this.vpcId;
    final vpcEndpointId = this.vpcEndpointId;
    return {
      'status': status.value,
      'subnetIds': subnetIds,
      'vpcId': vpcId,
      if (vpcEndpointId != null) 'vpcEndpointId': vpcEndpointId,
    };
  }
}

class ListPrivateGraphEndpointsOutput {
  /// A list of private endpoints for the specified Neptune Analytics graph.
  final List<PrivateGraphEndpointSummary> privateGraphEndpoints;

  /// Pagination token used to paginate output.
  ///
  /// When this value is provided as input, the service returns results from where
  /// the previous response left off. When this value is present in output, it
  /// indicates that there are more results to retrieve.
  final String? nextToken;

  ListPrivateGraphEndpointsOutput({
    required this.privateGraphEndpoints,
    this.nextToken,
  });

  factory ListPrivateGraphEndpointsOutput.fromJson(Map<String, dynamic> json) {
    return ListPrivateGraphEndpointsOutput(
      privateGraphEndpoints: ((json['privateGraphEndpoints'] as List?) ??
              const [])
          .nonNulls
          .map((e) =>
              PrivateGraphEndpointSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final privateGraphEndpoints = this.privateGraphEndpoints;
    final nextToken = this.nextToken;
    return {
      'privateGraphEndpoints': privateGraphEndpoints,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class CreateGraphSnapshotOutput {
  /// The ARN of the snapshot created.
  final String arn;

  /// The ID of the snapshot created.
  final String id;

  /// The name of the snapshot created.
  final String name;

  /// The ID of the KMS key used to encrypt and decrypt graph data.
  final String? kmsKeyIdentifier;

  /// The snapshot creation time
  final DateTime? snapshotCreateTime;

  /// The Id of the Neptune Analytics graph from which the snapshot is created.
  final String? sourceGraphId;

  /// The current state of the snapshot.
  final SnapshotStatus? status;

  CreateGraphSnapshotOutput({
    required this.arn,
    required this.id,
    required this.name,
    this.kmsKeyIdentifier,
    this.snapshotCreateTime,
    this.sourceGraphId,
    this.status,
  });

  factory CreateGraphSnapshotOutput.fromJson(Map<String, dynamic> json) {
    return CreateGraphSnapshotOutput(
      arn: (json['arn'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      kmsKeyIdentifier: json['kmsKeyIdentifier'] as String?,
      snapshotCreateTime: timeStampFromJson(json['snapshotCreateTime']),
      sourceGraphId: json['sourceGraphId'] as String?,
      status: (json['status'] as String?)?.let(SnapshotStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final name = this.name;
    final kmsKeyIdentifier = this.kmsKeyIdentifier;
    final snapshotCreateTime = this.snapshotCreateTime;
    final sourceGraphId = this.sourceGraphId;
    final status = this.status;
    return {
      'arn': arn,
      'id': id,
      'name': name,
      if (kmsKeyIdentifier != null) 'kmsKeyIdentifier': kmsKeyIdentifier,
      if (snapshotCreateTime != null)
        'snapshotCreateTime': unixTimestampToJson(snapshotCreateTime),
      if (sourceGraphId != null) 'sourceGraphId': sourceGraphId,
      if (status != null) 'status': status.value,
    };
  }
}

class DeleteGraphSnapshotOutput {
  /// The ARN of the graph snapshot.
  final String arn;

  /// The unique identifier of the graph snapshot.
  final String id;

  /// The snapshot name. For example: <code>my-snapshot-1</code>.
  ///
  /// The name must contain from 1 to 63 letters, numbers, or hyphens, and its
  /// first character must be a letter. It cannot end with a hyphen or contain two
  /// consecutive hyphens. Only lowercase letters are allowed.
  final String name;

  /// The ID of the KMS key used to encrypt and decrypt the snapshot.
  final String? kmsKeyIdentifier;

  /// The time when the snapshot was created.
  final DateTime? snapshotCreateTime;

  /// The graph identifier for the graph from which the snapshot was created.
  final String? sourceGraphId;

  /// The status of the graph snapshot.
  final SnapshotStatus? status;

  DeleteGraphSnapshotOutput({
    required this.arn,
    required this.id,
    required this.name,
    this.kmsKeyIdentifier,
    this.snapshotCreateTime,
    this.sourceGraphId,
    this.status,
  });

  factory DeleteGraphSnapshotOutput.fromJson(Map<String, dynamic> json) {
    return DeleteGraphSnapshotOutput(
      arn: (json['arn'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      kmsKeyIdentifier: json['kmsKeyIdentifier'] as String?,
      snapshotCreateTime: timeStampFromJson(json['snapshotCreateTime']),
      sourceGraphId: json['sourceGraphId'] as String?,
      status: (json['status'] as String?)?.let(SnapshotStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final name = this.name;
    final kmsKeyIdentifier = this.kmsKeyIdentifier;
    final snapshotCreateTime = this.snapshotCreateTime;
    final sourceGraphId = this.sourceGraphId;
    final status = this.status;
    return {
      'arn': arn,
      'id': id,
      'name': name,
      if (kmsKeyIdentifier != null) 'kmsKeyIdentifier': kmsKeyIdentifier,
      if (snapshotCreateTime != null)
        'snapshotCreateTime': unixTimestampToJson(snapshotCreateTime),
      if (sourceGraphId != null) 'sourceGraphId': sourceGraphId,
      if (status != null) 'status': status.value,
    };
  }
}

class GetGraphSnapshotOutput {
  /// The ARN of the graph snapshot.
  final String arn;

  /// The unique identifier of the graph snapshot.
  final String id;

  /// The snapshot name. For example: <code>my-snapshot-1</code>.
  ///
  /// The name must contain from 1 to 63 letters, numbers, or hyphens, and its
  /// first character must be a letter. It cannot end with a hyphen or contain two
  /// consecutive hyphens. Only lowercase letters are allowed.
  final String name;

  /// The ID of the KMS key used to encrypt and decrypt the snapshot.
  final String? kmsKeyIdentifier;

  /// The time when the snapshot was created.
  final DateTime? snapshotCreateTime;

  /// The graph identifier for the graph for which a snapshot is to be created.
  final String? sourceGraphId;

  /// The status of the graph snapshot.
  final SnapshotStatus? status;

  GetGraphSnapshotOutput({
    required this.arn,
    required this.id,
    required this.name,
    this.kmsKeyIdentifier,
    this.snapshotCreateTime,
    this.sourceGraphId,
    this.status,
  });

  factory GetGraphSnapshotOutput.fromJson(Map<String, dynamic> json) {
    return GetGraphSnapshotOutput(
      arn: (json['arn'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      kmsKeyIdentifier: json['kmsKeyIdentifier'] as String?,
      snapshotCreateTime: timeStampFromJson(json['snapshotCreateTime']),
      sourceGraphId: json['sourceGraphId'] as String?,
      status: (json['status'] as String?)?.let(SnapshotStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final name = this.name;
    final kmsKeyIdentifier = this.kmsKeyIdentifier;
    final snapshotCreateTime = this.snapshotCreateTime;
    final sourceGraphId = this.sourceGraphId;
    final status = this.status;
    return {
      'arn': arn,
      'id': id,
      'name': name,
      if (kmsKeyIdentifier != null) 'kmsKeyIdentifier': kmsKeyIdentifier,
      if (snapshotCreateTime != null)
        'snapshotCreateTime': unixTimestampToJson(snapshotCreateTime),
      if (sourceGraphId != null) 'sourceGraphId': sourceGraphId,
      if (status != null) 'status': status.value,
    };
  }
}

class ListGraphSnapshotsOutput {
  /// The requested list of snapshots.
  final List<GraphSnapshotSummary> graphSnapshots;

  /// Pagination token used to paginate output.
  ///
  /// When this value is provided as input, the service returns results from where
  /// the previous response left off. When this value is present in output, it
  /// indicates that there are more results to retrieve.
  final String? nextToken;

  ListGraphSnapshotsOutput({
    required this.graphSnapshots,
    this.nextToken,
  });

  factory ListGraphSnapshotsOutput.fromJson(Map<String, dynamic> json) {
    return ListGraphSnapshotsOutput(
      graphSnapshots: ((json['graphSnapshots'] as List?) ?? const [])
          .nonNulls
          .map((e) => GraphSnapshotSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final graphSnapshots = this.graphSnapshots;
    final nextToken = this.nextToken;
    return {
      'graphSnapshots': graphSnapshots,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class CancelExportTaskOutput {
  /// The Amazon S3 URI of the cancelled export task where data will be exported
  /// to.
  final String destination;

  /// The format of the cancelled export task.
  final ExportFormat format;

  /// The source graph identifier of the cancelled export task.
  final String graphId;

  /// The KMS key identifier of the cancelled export task.
  final String kmsKeyIdentifier;

  /// The ARN of the IAM role that will allow the exporting of data to the
  /// destination.
  final String roleArn;

  /// The current status of the export task. The status is <code>CANCELLING</code>
  /// when the export task is cancelled.
  final ExportTaskStatus status;

  /// The unique identifier of the export task.
  final String taskId;

  /// The parquet type of the cancelled export task.
  final ParquetType? parquetType;

  /// The reason that the export task has this status value.
  final String? statusReason;

  CancelExportTaskOutput({
    required this.destination,
    required this.format,
    required this.graphId,
    required this.kmsKeyIdentifier,
    required this.roleArn,
    required this.status,
    required this.taskId,
    this.parquetType,
    this.statusReason,
  });

  factory CancelExportTaskOutput.fromJson(Map<String, dynamic> json) {
    return CancelExportTaskOutput(
      destination: (json['destination'] as String?) ?? '',
      format: ExportFormat.fromString((json['format'] as String?) ?? ''),
      graphId: (json['graphId'] as String?) ?? '',
      kmsKeyIdentifier: (json['kmsKeyIdentifier'] as String?) ?? '',
      roleArn: (json['roleArn'] as String?) ?? '',
      status: ExportTaskStatus.fromString((json['status'] as String?) ?? ''),
      taskId: (json['taskId'] as String?) ?? '',
      parquetType:
          (json['parquetType'] as String?)?.let(ParquetType.fromString),
      statusReason: json['statusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final destination = this.destination;
    final format = this.format;
    final graphId = this.graphId;
    final kmsKeyIdentifier = this.kmsKeyIdentifier;
    final roleArn = this.roleArn;
    final status = this.status;
    final taskId = this.taskId;
    final parquetType = this.parquetType;
    final statusReason = this.statusReason;
    return {
      'destination': destination,
      'format': format.value,
      'graphId': graphId,
      'kmsKeyIdentifier': kmsKeyIdentifier,
      'roleArn': roleArn,
      'status': status.value,
      'taskId': taskId,
      if (parquetType != null) 'parquetType': parquetType.value,
      if (statusReason != null) 'statusReason': statusReason,
    };
  }
}

class CancelImportTaskOutput {
  /// The ARN of the IAM role that will allow access to the data that is to be
  /// imported.
  final String roleArn;

  /// A URL identifying to the location of the data to be imported. This can be an
  /// Amazon S3 path, or can point to a Neptune database endpoint or snapshot.
  final String source;

  /// Current status of the task. Status is CANCELLING when the import task is
  /// cancelled.
  final ImportTaskStatus status;

  /// The unique identifier of the import task.
  final String taskId;

  /// Specifies the format of S3 data to be imported. Valid values are
  /// <code>CSV</code>, which identifies the <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/bulk-load-tutorial-format-gremlin.html">Gremlin
  /// CSV format</a> or <code>OPENCYPHER</code>, which identifies the <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/bulk-load-tutorial-format-opencypher.html">openCypher
  /// load format</a>.
  final Format? format;

  /// The unique identifier of the Neptune Analytics graph.
  final String? graphId;

  /// The parquet type of the cancelled import task.
  final ParquetType? parquetType;

  CancelImportTaskOutput({
    required this.roleArn,
    required this.source,
    required this.status,
    required this.taskId,
    this.format,
    this.graphId,
    this.parquetType,
  });

  factory CancelImportTaskOutput.fromJson(Map<String, dynamic> json) {
    return CancelImportTaskOutput(
      roleArn: (json['roleArn'] as String?) ?? '',
      source: (json['source'] as String?) ?? '',
      status: ImportTaskStatus.fromString((json['status'] as String?) ?? ''),
      taskId: (json['taskId'] as String?) ?? '',
      format: (json['format'] as String?)?.let(Format.fromString),
      graphId: json['graphId'] as String?,
      parquetType:
          (json['parquetType'] as String?)?.let(ParquetType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final roleArn = this.roleArn;
    final source = this.source;
    final status = this.status;
    final taskId = this.taskId;
    final format = this.format;
    final graphId = this.graphId;
    final parquetType = this.parquetType;
    return {
      'roleArn': roleArn,
      'source': source,
      'status': status.value,
      'taskId': taskId,
      if (format != null) 'format': format.value,
      if (graphId != null) 'graphId': graphId,
      if (parquetType != null) 'parquetType': parquetType.value,
    };
  }
}

class CreateGraphUsingImportTaskOutput {
  /// The ARN of the IAM role that will allow access to the data that is to be
  /// imported.
  final String roleArn;

  /// A URL identifying to the location of the data to be imported. This can be an
  /// Amazon S3 path, or can point to a Neptune database endpoint or snapshot.
  final String source;

  /// The status of the import task.
  final ImportTaskStatus status;

  /// The unique identifier of the import task.
  final String taskId;

  /// Specifies the format of S3 data to be imported. Valid values are
  /// <code>CSV</code>, which identifies the <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/bulk-load-tutorial-format-gremlin.html">Gremlin
  /// CSV format</a>, <code>OPENCYPHER</code>, which identifies the <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/bulk-load-tutorial-format-opencypher.html">openCypher
  /// load format</a>, or <code>ntriples</code>, which identifies the <a
  /// href="https://docs.aws.amazon.com/neptune-analytics/latest/userguide/using-rdf-data.html">RDF
  /// n-triples</a> format.
  final Format? format;

  /// The unique identifier of the Neptune Analytics graph.
  final String? graphId;

  /// Contains options for controlling the import process. For example, if the
  /// <code>failOnError</code> key is set to <code>false</code>, the import skips
  /// problem data and attempts to continue (whereas if set to <code>true</code>,
  /// the default, or if omitted, the import operation halts immediately when an
  /// error is encountered.
  final ImportOptions? importOptions;

  /// The parquet type of the import task.
  final ParquetType? parquetType;

  CreateGraphUsingImportTaskOutput({
    required this.roleArn,
    required this.source,
    required this.status,
    required this.taskId,
    this.format,
    this.graphId,
    this.importOptions,
    this.parquetType,
  });

  factory CreateGraphUsingImportTaskOutput.fromJson(Map<String, dynamic> json) {
    return CreateGraphUsingImportTaskOutput(
      roleArn: (json['roleArn'] as String?) ?? '',
      source: (json['source'] as String?) ?? '',
      status: ImportTaskStatus.fromString((json['status'] as String?) ?? ''),
      taskId: (json['taskId'] as String?) ?? '',
      format: (json['format'] as String?)?.let(Format.fromString),
      graphId: json['graphId'] as String?,
      importOptions: json['importOptions'] != null
          ? ImportOptions.fromJson(
              json['importOptions'] as Map<String, dynamic>)
          : null,
      parquetType:
          (json['parquetType'] as String?)?.let(ParquetType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final roleArn = this.roleArn;
    final source = this.source;
    final status = this.status;
    final taskId = this.taskId;
    final format = this.format;
    final graphId = this.graphId;
    final importOptions = this.importOptions;
    final parquetType = this.parquetType;
    return {
      'roleArn': roleArn,
      'source': source,
      'status': status.value,
      'taskId': taskId,
      if (format != null) 'format': format.value,
      if (graphId != null) 'graphId': graphId,
      if (importOptions != null) 'importOptions': importOptions,
      if (parquetType != null) 'parquetType': parquetType.value,
    };
  }
}

class GetExportTaskOutput {
  /// The Amazon S3 URI of the export task where data will be exported.
  final String destination;

  /// The format of the export task.
  final ExportFormat format;

  /// The source graph identifier of the export task.
  final String graphId;

  /// The KMS key identifier of the export task.
  final String kmsKeyIdentifier;

  /// The ARN of the IAM role that will allow data to be exported to the
  /// destination.
  final String roleArn;

  /// The current status of the export task.
  final ExportTaskStatus status;

  /// The unique identifier of the export task.
  final String taskId;

  /// The export filter of the export task.
  final ExportFilter? exportFilter;

  /// The details of the export task.
  final ExportTaskDetails? exportTaskDetails;

  /// The parquet type of the export task.
  final ParquetType? parquetType;

  /// The reason that the export task has this status value.
  final String? statusReason;

  GetExportTaskOutput({
    required this.destination,
    required this.format,
    required this.graphId,
    required this.kmsKeyIdentifier,
    required this.roleArn,
    required this.status,
    required this.taskId,
    this.exportFilter,
    this.exportTaskDetails,
    this.parquetType,
    this.statusReason,
  });

  factory GetExportTaskOutput.fromJson(Map<String, dynamic> json) {
    return GetExportTaskOutput(
      destination: (json['destination'] as String?) ?? '',
      format: ExportFormat.fromString((json['format'] as String?) ?? ''),
      graphId: (json['graphId'] as String?) ?? '',
      kmsKeyIdentifier: (json['kmsKeyIdentifier'] as String?) ?? '',
      roleArn: (json['roleArn'] as String?) ?? '',
      status: ExportTaskStatus.fromString((json['status'] as String?) ?? ''),
      taskId: (json['taskId'] as String?) ?? '',
      exportFilter: json['exportFilter'] != null
          ? ExportFilter.fromJson(json['exportFilter'] as Map<String, dynamic>)
          : null,
      exportTaskDetails: json['exportTaskDetails'] != null
          ? ExportTaskDetails.fromJson(
              json['exportTaskDetails'] as Map<String, dynamic>)
          : null,
      parquetType:
          (json['parquetType'] as String?)?.let(ParquetType.fromString),
      statusReason: json['statusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final destination = this.destination;
    final format = this.format;
    final graphId = this.graphId;
    final kmsKeyIdentifier = this.kmsKeyIdentifier;
    final roleArn = this.roleArn;
    final status = this.status;
    final taskId = this.taskId;
    final exportFilter = this.exportFilter;
    final exportTaskDetails = this.exportTaskDetails;
    final parquetType = this.parquetType;
    final statusReason = this.statusReason;
    return {
      'destination': destination,
      'format': format.value,
      'graphId': graphId,
      'kmsKeyIdentifier': kmsKeyIdentifier,
      'roleArn': roleArn,
      'status': status.value,
      'taskId': taskId,
      if (exportFilter != null) 'exportFilter': exportFilter,
      if (exportTaskDetails != null) 'exportTaskDetails': exportTaskDetails,
      if (parquetType != null) 'parquetType': parquetType.value,
      if (statusReason != null) 'statusReason': statusReason,
    };
  }
}

class GetImportTaskOutput {
  /// The ARN of the IAM role that will allow access to the data that is to be
  /// imported.
  final String roleArn;

  /// A URL identifying to the location of the data to be imported. This can be an
  /// Amazon S3 path, or can point to a Neptune database endpoint or snapshot
  final String source;

  /// The status of the import task:
  ///
  /// <ul>
  /// <li>
  /// <b>INITIALIZING</b> – The necessary resources needed to create the graph are
  /// being prepared.
  /// </li>
  /// <li>
  /// <b>ANALYZING_DATA</b> – The data is being analyzed to determine the optimal
  /// infrastructure configuration for the new graph.
  /// </li>
  /// <li>
  /// <b>RE_PROVISIONING</b> – The data did not fit into the provisioned graph, so
  /// it is being re-provisioned with more capacity.
  /// </li>
  /// <li>
  /// <b>IMPORTING</b> – The data is being loaded.
  /// </li>
  /// <li>
  /// <b>ERROR_ENCOUNTERED</b> – An error has been encountered while trying to
  /// create the graph and import the data.
  /// </li>
  /// <li>
  /// <b>ERROR_ENCOUNTERED_ROLLING_BACK</b> – Because of the error that was
  /// encountered, the graph is being rolled back and all its resources released.
  /// </li>
  /// <li>
  /// <b>SUCCEEDED</b> – Graph creation and data loading succeeded.
  /// </li>
  /// <li>
  /// <b>FAILED</b> – Graph creation or data loading failed. When the status is
  /// <code>FAILED</code>, you can use <code>get-graphs</code> to get more
  /// information about the state of the graph.
  /// </li>
  /// <li>
  /// <b>CANCELLING</b> – Because you cancelled the import task, cancellation is
  /// in progress.
  /// </li>
  /// <li>
  /// <b>CANCELLED</b> – You have successfully cancelled the import task.
  /// </li>
  /// </ul>
  final ImportTaskStatus status;

  /// The unique identifier of the import task.
  final String taskId;

  /// The number of the current attempts to execute the import task.
  final int? attemptNumber;

  /// Specifies the format of S3 data to be imported. Valid values are
  /// <code>CSV</code>, which identifies the <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/bulk-load-tutorial-format-gremlin.html">Gremlin
  /// CSV format</a> or <code>OPENCYPHER</code>, which identifies the <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/bulk-load-tutorial-format-opencypher.html">openCypher
  /// load format</a>.
  final Format? format;

  /// The unique identifier of the Neptune Analytics graph.
  final String? graphId;

  /// Contains options for controlling the import process. For example, if the
  /// <code>failOnError</code> key is set to <code>false</code>, the import skips
  /// problem data and attempts to continue (whereas if set to <code>true</code>,
  /// the default, or if omitted, the import operation halts immediately when an
  /// error is encountered.
  final ImportOptions? importOptions;

  /// Contains details about the specified import task.
  final ImportTaskDetails? importTaskDetails;

  /// The parquet type of the import task.
  final ParquetType? parquetType;

  /// The reason that the import task has this status value.
  final String? statusReason;

  GetImportTaskOutput({
    required this.roleArn,
    required this.source,
    required this.status,
    required this.taskId,
    this.attemptNumber,
    this.format,
    this.graphId,
    this.importOptions,
    this.importTaskDetails,
    this.parquetType,
    this.statusReason,
  });

  factory GetImportTaskOutput.fromJson(Map<String, dynamic> json) {
    return GetImportTaskOutput(
      roleArn: (json['roleArn'] as String?) ?? '',
      source: (json['source'] as String?) ?? '',
      status: ImportTaskStatus.fromString((json['status'] as String?) ?? ''),
      taskId: (json['taskId'] as String?) ?? '',
      attemptNumber: json['attemptNumber'] as int?,
      format: (json['format'] as String?)?.let(Format.fromString),
      graphId: json['graphId'] as String?,
      importOptions: json['importOptions'] != null
          ? ImportOptions.fromJson(
              json['importOptions'] as Map<String, dynamic>)
          : null,
      importTaskDetails: json['importTaskDetails'] != null
          ? ImportTaskDetails.fromJson(
              json['importTaskDetails'] as Map<String, dynamic>)
          : null,
      parquetType:
          (json['parquetType'] as String?)?.let(ParquetType.fromString),
      statusReason: json['statusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final roleArn = this.roleArn;
    final source = this.source;
    final status = this.status;
    final taskId = this.taskId;
    final attemptNumber = this.attemptNumber;
    final format = this.format;
    final graphId = this.graphId;
    final importOptions = this.importOptions;
    final importTaskDetails = this.importTaskDetails;
    final parquetType = this.parquetType;
    final statusReason = this.statusReason;
    return {
      'roleArn': roleArn,
      'source': source,
      'status': status.value,
      'taskId': taskId,
      if (attemptNumber != null) 'attemptNumber': attemptNumber,
      if (format != null) 'format': format.value,
      if (graphId != null) 'graphId': graphId,
      if (importOptions != null) 'importOptions': importOptions,
      if (importTaskDetails != null) 'importTaskDetails': importTaskDetails,
      if (parquetType != null) 'parquetType': parquetType.value,
      if (statusReason != null) 'statusReason': statusReason,
    };
  }
}

class ListExportTasksOutput {
  /// The requested list of export tasks.
  final List<ExportTaskSummary> tasks;

  /// Pagination token used to paginate output.
  final String? nextToken;

  ListExportTasksOutput({
    required this.tasks,
    this.nextToken,
  });

  factory ListExportTasksOutput.fromJson(Map<String, dynamic> json) {
    return ListExportTasksOutput(
      tasks: ((json['tasks'] as List?) ?? const [])
          .nonNulls
          .map((e) => ExportTaskSummary.fromJson(e as Map<String, dynamic>))
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

class ListImportTasksOutput {
  /// The requested list of import tasks.
  final List<ImportTaskSummary> tasks;

  /// Pagination token used to paginate output.
  ///
  /// When this value is provided as input, the service returns results from where
  /// the previous response left off. When this value is present in output, it
  /// indicates that there are more results to retrieve.
  final String? nextToken;

  ListImportTasksOutput({
    required this.tasks,
    this.nextToken,
  });

  factory ListImportTasksOutput.fromJson(Map<String, dynamic> json) {
    return ListImportTasksOutput(
      tasks: ((json['tasks'] as List?) ?? const [])
          .nonNulls
          .map((e) => ImportTaskSummary.fromJson(e as Map<String, dynamic>))
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

class StartExportTaskOutput {
  /// The Amazon S3 URI of the export task where data will be exported to.
  final String destination;

  /// The format of the export task.
  final ExportFormat format;

  /// The source graph identifier of the export task.
  final String graphId;

  /// The KMS key identifier of the export task.
  final String kmsKeyIdentifier;

  /// The ARN of the IAM role that will allow data to be exported to the
  /// destination.
  final String roleArn;

  /// The current status of the export task.
  final ExportTaskStatus status;

  /// The unique identifier of the export task.
  final String taskId;

  /// The export filter of the export task.
  final ExportFilter? exportFilter;

  /// The parquet type of the export task.
  final ParquetType? parquetType;

  /// The reason that the export task has this status value.
  final String? statusReason;

  StartExportTaskOutput({
    required this.destination,
    required this.format,
    required this.graphId,
    required this.kmsKeyIdentifier,
    required this.roleArn,
    required this.status,
    required this.taskId,
    this.exportFilter,
    this.parquetType,
    this.statusReason,
  });

  factory StartExportTaskOutput.fromJson(Map<String, dynamic> json) {
    return StartExportTaskOutput(
      destination: (json['destination'] as String?) ?? '',
      format: ExportFormat.fromString((json['format'] as String?) ?? ''),
      graphId: (json['graphId'] as String?) ?? '',
      kmsKeyIdentifier: (json['kmsKeyIdentifier'] as String?) ?? '',
      roleArn: (json['roleArn'] as String?) ?? '',
      status: ExportTaskStatus.fromString((json['status'] as String?) ?? ''),
      taskId: (json['taskId'] as String?) ?? '',
      exportFilter: json['exportFilter'] != null
          ? ExportFilter.fromJson(json['exportFilter'] as Map<String, dynamic>)
          : null,
      parquetType:
          (json['parquetType'] as String?)?.let(ParquetType.fromString),
      statusReason: json['statusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final destination = this.destination;
    final format = this.format;
    final graphId = this.graphId;
    final kmsKeyIdentifier = this.kmsKeyIdentifier;
    final roleArn = this.roleArn;
    final status = this.status;
    final taskId = this.taskId;
    final exportFilter = this.exportFilter;
    final parquetType = this.parquetType;
    final statusReason = this.statusReason;
    return {
      'destination': destination,
      'format': format.value,
      'graphId': graphId,
      'kmsKeyIdentifier': kmsKeyIdentifier,
      'roleArn': roleArn,
      'status': status.value,
      'taskId': taskId,
      if (exportFilter != null) 'exportFilter': exportFilter,
      if (parquetType != null) 'parquetType': parquetType.value,
      if (statusReason != null) 'statusReason': statusReason,
    };
  }
}

class StartImportTaskOutput {
  /// The ARN of the IAM role that will allow access to the data that is to be
  /// imported.
  final String roleArn;

  /// A URL identifying the location of the data to be imported. This can be an
  /// Amazon S3 path, or can point to a Neptune database endpoint or snapshot.
  final String source;

  /// The status of the import task.
  final ImportTaskStatus status;

  /// The unique identifier of the import task.
  final String taskId;

  /// Specifies the format of Amazon S3 data to be imported. Valid values are CSV,
  /// which identifies the Gremlin CSV format or OPENCYPHER, which identifies the
  /// openCypher load format.
  final Format? format;

  /// The unique identifier of the Neptune Analytics graph.
  final String? graphId;
  final ImportOptions? importOptions;

  /// The parquet type of the import task.
  final ParquetType? parquetType;

  StartImportTaskOutput({
    required this.roleArn,
    required this.source,
    required this.status,
    required this.taskId,
    this.format,
    this.graphId,
    this.importOptions,
    this.parquetType,
  });

  factory StartImportTaskOutput.fromJson(Map<String, dynamic> json) {
    return StartImportTaskOutput(
      roleArn: (json['roleArn'] as String?) ?? '',
      source: (json['source'] as String?) ?? '',
      status: ImportTaskStatus.fromString((json['status'] as String?) ?? ''),
      taskId: (json['taskId'] as String?) ?? '',
      format: (json['format'] as String?)?.let(Format.fromString),
      graphId: json['graphId'] as String?,
      importOptions: json['importOptions'] != null
          ? ImportOptions.fromJson(
              json['importOptions'] as Map<String, dynamic>)
          : null,
      parquetType:
          (json['parquetType'] as String?)?.let(ParquetType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final roleArn = this.roleArn;
    final source = this.source;
    final status = this.status;
    final taskId = this.taskId;
    final format = this.format;
    final graphId = this.graphId;
    final importOptions = this.importOptions;
    final parquetType = this.parquetType;
    return {
      'roleArn': roleArn,
      'source': source,
      'status': status.value,
      'taskId': taskId,
      if (format != null) 'format': format.value,
      if (graphId != null) 'graphId': graphId,
      if (importOptions != null) 'importOptions': importOptions,
      if (parquetType != null) 'parquetType': parquetType.value,
    };
  }
}

class Format {
  static const csv = Format._('CSV');
  static const openCypher = Format._('OPEN_CYPHER');
  static const parquet = Format._('PARQUET');
  static const ntriples = Format._('NTRIPLES');

  final String value;

  const Format._(this.value);

  static const values = [csv, openCypher, parquet, ntriples];

  static Format fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Format._(value));

  @override
  bool operator ==(other) => other is Format && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class ParquetType {
  static const columnar = ParquetType._('COLUMNAR');

  final String value;

  const ParquetType._(this.value);

  static const values = [columnar];

  static ParquetType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ParquetType._(value));

  @override
  bool operator ==(other) => other is ParquetType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class ImportTaskStatus {
  static const initializing = ImportTaskStatus._('INITIALIZING');
  static const exporting = ImportTaskStatus._('EXPORTING');
  static const analyzingData = ImportTaskStatus._('ANALYZING_DATA');
  static const importing = ImportTaskStatus._('IMPORTING');
  static const reprovisioning = ImportTaskStatus._('REPROVISIONING');
  static const rollingBack = ImportTaskStatus._('ROLLING_BACK');
  static const succeeded = ImportTaskStatus._('SUCCEEDED');
  static const failed = ImportTaskStatus._('FAILED');
  static const cancelling = ImportTaskStatus._('CANCELLING');
  static const cancelled = ImportTaskStatus._('CANCELLED');
  static const deleted = ImportTaskStatus._('DELETED');

  final String value;

  const ImportTaskStatus._(this.value);

  static const values = [
    initializing,
    exporting,
    analyzingData,
    importing,
    reprovisioning,
    rollingBack,
    succeeded,
    failed,
    cancelling,
    cancelled,
    deleted
  ];

  static ImportTaskStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ImportTaskStatus._(value));

  @override
  bool operator ==(other) => other is ImportTaskStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Options for how to perform an import.
class ImportOptions {
  /// Options for importing data from a Neptune database.
  final NeptuneImportOptions? neptune;

  ImportOptions({
    this.neptune,
  });

  factory ImportOptions.fromJson(Map<String, dynamic> json) {
    return ImportOptions(
      neptune: json['neptune'] != null
          ? NeptuneImportOptions.fromJson(
              json['neptune'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final neptune = this.neptune;
    return {
      if (neptune != null) 'neptune': neptune,
    };
  }
}

/// Options for how to import Neptune data.
class NeptuneImportOptions {
  /// The KMS key to use to encrypt data in the S3 bucket where the graph data is
  /// exported
  final String s3ExportKmsKeyId;

  /// The path to an S3 bucket from which to import data.
  final String s3ExportPath;

  /// Neptune Analytics supports label-less vertices and no labels are assigned
  /// unless one is explicitly provided. Neptune assigns default labels when none
  /// is explicitly provided. When importing the data into Neptune Analytics, the
  /// default vertex labels can be omitted by setting
  /// <i>preserveDefaultVertexLabels</i> to false. Note that if the vertex only
  /// has default labels, and has no other properties or edges, then the vertex
  /// will effectively not get imported into Neptune Analytics when
  /// preserveDefaultVertexLabels is set to false.
  final bool? preserveDefaultVertexLabels;

  /// Neptune Analytics currently does not support user defined edge ids. The edge
  /// ids are not imported by default. They are imported if <i>preserveEdgeIds</i>
  /// is set to true, and ids are stored as properties on the relationships with
  /// the property name <i>neptuneEdgeId</i>.
  final bool? preserveEdgeIds;

  NeptuneImportOptions({
    required this.s3ExportKmsKeyId,
    required this.s3ExportPath,
    this.preserveDefaultVertexLabels,
    this.preserveEdgeIds,
  });

  factory NeptuneImportOptions.fromJson(Map<String, dynamic> json) {
    return NeptuneImportOptions(
      s3ExportKmsKeyId: (json['s3ExportKmsKeyId'] as String?) ?? '',
      s3ExportPath: (json['s3ExportPath'] as String?) ?? '',
      preserveDefaultVertexLabels: json['preserveDefaultVertexLabels'] as bool?,
      preserveEdgeIds: json['preserveEdgeIds'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final s3ExportKmsKeyId = this.s3ExportKmsKeyId;
    final s3ExportPath = this.s3ExportPath;
    final preserveDefaultVertexLabels = this.preserveDefaultVertexLabels;
    final preserveEdgeIds = this.preserveEdgeIds;
    return {
      's3ExportKmsKeyId': s3ExportKmsKeyId,
      's3ExportPath': s3ExportPath,
      if (preserveDefaultVertexLabels != null)
        'preserveDefaultVertexLabels': preserveDefaultVertexLabels,
      if (preserveEdgeIds != null) 'preserveEdgeIds': preserveEdgeIds,
    };
  }
}

class BlankNodeHandling {
  static const convertToIri = BlankNodeHandling._('convertToIri');

  final String value;

  const BlankNodeHandling._(this.value);

  static const values = [convertToIri];

  static BlankNodeHandling fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => BlankNodeHandling._(value));

  @override
  bool operator ==(other) => other is BlankNodeHandling && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class ExportTaskStatus {
  static const initializing = ExportTaskStatus._('INITIALIZING');
  static const exporting = ExportTaskStatus._('EXPORTING');
  static const succeeded = ExportTaskStatus._('SUCCEEDED');
  static const failed = ExportTaskStatus._('FAILED');
  static const cancelling = ExportTaskStatus._('CANCELLING');
  static const cancelled = ExportTaskStatus._('CANCELLED');
  static const deleted = ExportTaskStatus._('DELETED');

  final String value;

  const ExportTaskStatus._(this.value);

  static const values = [
    initializing,
    exporting,
    succeeded,
    failed,
    cancelling,
    cancelled,
    deleted
  ];

  static ExportTaskStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ExportTaskStatus._(value));

  @override
  bool operator ==(other) => other is ExportTaskStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class ExportFormat {
  static const parquet = ExportFormat._('PARQUET');
  static const csv = ExportFormat._('CSV');

  final String value;

  const ExportFormat._(this.value);

  static const values = [parquet, csv];

  static ExportFormat fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ExportFormat._(value));

  @override
  bool operator ==(other) => other is ExportFormat && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// This is the top-level field for specifying vertex or edge filters. If the
/// ExportFilter is not provided, then all properties for all labels will be
/// exported. If the ExportFilter is provided but is an empty object, then no
/// data will be exported.
class ExportFilter {
  /// Used to specify filters on a per-label basis for edges. This allows you to
  /// control which edge labels and properties are included in the export.
  final Map<String, ExportFilterElement>? edgeFilter;

  /// Used to specify filters on a per-label basis for vertices. This allows you
  /// to control which vertex labels and properties are included in the export.
  final Map<String, ExportFilterElement>? vertexFilter;

  ExportFilter({
    this.edgeFilter,
    this.vertexFilter,
  });

  factory ExportFilter.fromJson(Map<String, dynamic> json) {
    return ExportFilter(
      edgeFilter: (json['edgeFilter'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, ExportFilterElement.fromJson(e as Map<String, dynamic>))),
      vertexFilter: (json['vertexFilter'] as Map<String, dynamic>?)?.map((k,
              e) =>
          MapEntry(k, ExportFilterElement.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final edgeFilter = this.edgeFilter;
    final vertexFilter = this.vertexFilter;
    return {
      if (edgeFilter != null) 'edgeFilter': edgeFilter,
      if (vertexFilter != null) 'vertexFilter': vertexFilter,
    };
  }
}

/// Specifies which properties of that label should be included in the export.
class ExportFilterElement {
  /// Each property is defined by a key-value pair, where the key is the desired
  /// output property name (e.g. "name"), and the value is an object.
  final Map<String, ExportFilterPropertyAttributes>? properties;

  ExportFilterElement({
    this.properties,
  });

  factory ExportFilterElement.fromJson(Map<String, dynamic> json) {
    return ExportFilterElement(
      properties: (json['properties'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(
              k,
              ExportFilterPropertyAttributes.fromJson(
                  e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final properties = this.properties;
    return {
      if (properties != null) 'properties': properties,
    };
  }
}

/// A structure representing a property's attributes. It is a map object of
/// outputType, sourcePropertyName and multiValueHandling.
class ExportFilterPropertyAttributes {
  /// Specifies how to handle properties that have multiple values. Can be either
  /// <code>TO_LIST</code> to export all values as a list, or
  /// <code>PICK_FIRST</code> to export the first value encountered. If not
  /// specified, the default value is <code>PICK_FIRST</code>.
  final MultiValueHandlingType? multiValueHandling;

  /// Specifies the data type to use for the property in the exported data (e.g.
  /// "String", "Int", "Float"). If a type is not provided, the export process
  /// will determine the type. If a given property is present as multiple types
  /// (e.g. one vertex has "height" stored as a double, and another edge has it
  /// stored as a string), the type will be of Any type, otherwise, it will be the
  /// type of the property as present in vertices.
  final String? outputType;

  /// The name of the property as it exists in the original graph data. If not
  /// provided, it is assumed that the key matches the desired sourcePropertyName.
  final String? sourcePropertyName;

  ExportFilterPropertyAttributes({
    this.multiValueHandling,
    this.outputType,
    this.sourcePropertyName,
  });

  factory ExportFilterPropertyAttributes.fromJson(Map<String, dynamic> json) {
    return ExportFilterPropertyAttributes(
      multiValueHandling: (json['multiValueHandling'] as String?)
          ?.let(MultiValueHandlingType.fromString),
      outputType: json['outputType'] as String?,
      sourcePropertyName: json['sourcePropertyName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final multiValueHandling = this.multiValueHandling;
    final outputType = this.outputType;
    final sourcePropertyName = this.sourcePropertyName;
    return {
      if (multiValueHandling != null)
        'multiValueHandling': multiValueHandling.value,
      if (outputType != null) 'outputType': outputType,
      if (sourcePropertyName != null) 'sourcePropertyName': sourcePropertyName,
    };
  }
}

class MultiValueHandlingType {
  static const toList = MultiValueHandlingType._('TO_LIST');
  static const pickFirst = MultiValueHandlingType._('PICK_FIRST');

  final String value;

  const MultiValueHandlingType._(this.value);

  static const values = [toList, pickFirst];

  static MultiValueHandlingType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MultiValueHandlingType._(value));

  @override
  bool operator ==(other) =>
      other is MultiValueHandlingType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Details about an import task.
class ImportTaskSummary {
  /// The ARN of the IAM role that will allow access to the data that is to be
  /// imported.
  final String roleArn;

  /// A URL identifying to the location of the data to be imported. This can be an
  /// Amazon S3 path, or can point to a Neptune database endpoint or snapshot
  final String source;

  /// Status of the import task.
  final ImportTaskStatus status;

  /// The unique identifier of the import task.
  final String taskId;

  /// Specifies the format of S3 data to be imported. Valid values are
  /// <code>CSV</code>, which identifies the <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/bulk-load-tutorial-format-gremlin.html">Gremlin
  /// CSV format</a> or <code>OPENCYPHER</code>, which identies the <a
  /// href="https://docs.aws.amazon.com/neptune/latest/userguide/bulk-load-tutorial-format-opencypher.html">openCypher
  /// load format</a>.
  final Format? format;

  /// The unique identifier of the Neptune Analytics graph.
  final String? graphId;

  /// The parquet type of the import task.
  final ParquetType? parquetType;

  ImportTaskSummary({
    required this.roleArn,
    required this.source,
    required this.status,
    required this.taskId,
    this.format,
    this.graphId,
    this.parquetType,
  });

  factory ImportTaskSummary.fromJson(Map<String, dynamic> json) {
    return ImportTaskSummary(
      roleArn: (json['roleArn'] as String?) ?? '',
      source: (json['source'] as String?) ?? '',
      status: ImportTaskStatus.fromString((json['status'] as String?) ?? ''),
      taskId: (json['taskId'] as String?) ?? '',
      format: (json['format'] as String?)?.let(Format.fromString),
      graphId: json['graphId'] as String?,
      parquetType:
          (json['parquetType'] as String?)?.let(ParquetType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final roleArn = this.roleArn;
    final source = this.source;
    final status = this.status;
    final taskId = this.taskId;
    final format = this.format;
    final graphId = this.graphId;
    final parquetType = this.parquetType;
    return {
      'roleArn': roleArn,
      'source': source,
      'status': status.value,
      'taskId': taskId,
      if (format != null) 'format': format.value,
      if (graphId != null) 'graphId': graphId,
      if (parquetType != null) 'parquetType': parquetType.value,
    };
  }
}

/// Provides details about an export task.
class ExportTaskSummary {
  /// The Amazon S3 URI of the export task where data will be exported to.
  final String destination;

  /// The format of the export task.
  final ExportFormat format;

  /// The source graph identifier of the export task.
  final String graphId;

  /// The KMS key identifier of the export task.
  final String kmsKeyIdentifier;

  /// The ARN of the IAM role that will allow the data to be exported to the
  /// destination.
  final String roleArn;

  /// The current status of the export task.
  final ExportTaskStatus status;

  /// The unique identifier of the export task.
  final String taskId;

  /// The parquet type of the export task.
  final ParquetType? parquetType;

  /// The reason that the export task has this status value.
  final String? statusReason;

  ExportTaskSummary({
    required this.destination,
    required this.format,
    required this.graphId,
    required this.kmsKeyIdentifier,
    required this.roleArn,
    required this.status,
    required this.taskId,
    this.parquetType,
    this.statusReason,
  });

  factory ExportTaskSummary.fromJson(Map<String, dynamic> json) {
    return ExportTaskSummary(
      destination: (json['destination'] as String?) ?? '',
      format: ExportFormat.fromString((json['format'] as String?) ?? ''),
      graphId: (json['graphId'] as String?) ?? '',
      kmsKeyIdentifier: (json['kmsKeyIdentifier'] as String?) ?? '',
      roleArn: (json['roleArn'] as String?) ?? '',
      status: ExportTaskStatus.fromString((json['status'] as String?) ?? ''),
      taskId: (json['taskId'] as String?) ?? '',
      parquetType:
          (json['parquetType'] as String?)?.let(ParquetType.fromString),
      statusReason: json['statusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final destination = this.destination;
    final format = this.format;
    final graphId = this.graphId;
    final kmsKeyIdentifier = this.kmsKeyIdentifier;
    final roleArn = this.roleArn;
    final status = this.status;
    final taskId = this.taskId;
    final parquetType = this.parquetType;
    final statusReason = this.statusReason;
    return {
      'destination': destination,
      'format': format.value,
      'graphId': graphId,
      'kmsKeyIdentifier': kmsKeyIdentifier,
      'roleArn': roleArn,
      'status': status.value,
      'taskId': taskId,
      if (parquetType != null) 'parquetType': parquetType.value,
      if (statusReason != null) 'statusReason': statusReason,
    };
  }
}

/// Contains details about an import task.
class ImportTaskDetails {
  /// The number of dictionary entries in the import task.
  final int dictionaryEntryCount;

  /// The number of errors encountered so far.
  final int errorCount;

  /// The percentage progress so far.
  final int progressPercentage;

  /// Time at which the import task started.
  final DateTime startTime;

  /// The number of statements in the import task.
  final int statementCount;

  /// Status of the import task.
  final String status;

  /// Seconds elapsed since the import task started.
  final int timeElapsedSeconds;

  /// Details about the errors that have been encountered.
  final String? errorDetails;

  ImportTaskDetails({
    required this.dictionaryEntryCount,
    required this.errorCount,
    required this.progressPercentage,
    required this.startTime,
    required this.statementCount,
    required this.status,
    required this.timeElapsedSeconds,
    this.errorDetails,
  });

  factory ImportTaskDetails.fromJson(Map<String, dynamic> json) {
    return ImportTaskDetails(
      dictionaryEntryCount: (json['dictionaryEntryCount'] as int?) ?? 0,
      errorCount: (json['errorCount'] as int?) ?? 0,
      progressPercentage: (json['progressPercentage'] as int?) ?? 0,
      startTime: nonNullableTimeStampFromJson(json['startTime'] ?? 0),
      statementCount: (json['statementCount'] as int?) ?? 0,
      status: (json['status'] as String?) ?? '',
      timeElapsedSeconds: (json['timeElapsedSeconds'] as int?) ?? 0,
      errorDetails: json['errorDetails'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dictionaryEntryCount = this.dictionaryEntryCount;
    final errorCount = this.errorCount;
    final progressPercentage = this.progressPercentage;
    final startTime = this.startTime;
    final statementCount = this.statementCount;
    final status = this.status;
    final timeElapsedSeconds = this.timeElapsedSeconds;
    final errorDetails = this.errorDetails;
    return {
      'dictionaryEntryCount': dictionaryEntryCount,
      'errorCount': errorCount,
      'progressPercentage': progressPercentage,
      'startTime': unixTimestampToJson(startTime),
      'statementCount': statementCount,
      'status': status,
      'timeElapsedSeconds': timeElapsedSeconds,
      if (errorDetails != null) 'errorDetails': errorDetails,
    };
  }
}

/// Contains details about the specified export task.
class ExportTaskDetails {
  /// The number of progress percentage of the export task.
  final int progressPercentage;

  /// The start time of the export task.
  final DateTime startTime;

  /// The time elapsed, in seconds, since the start time of the export task.
  final int timeElapsedSeconds;

  /// The number of exported edges.
  final int? numEdgesWritten;

  /// The number of exported vertices.
  final int? numVerticesWritten;

  ExportTaskDetails({
    required this.progressPercentage,
    required this.startTime,
    required this.timeElapsedSeconds,
    this.numEdgesWritten,
    this.numVerticesWritten,
  });

  factory ExportTaskDetails.fromJson(Map<String, dynamic> json) {
    return ExportTaskDetails(
      progressPercentage: (json['progressPercentage'] as int?) ?? 0,
      startTime: nonNullableTimeStampFromJson(json['startTime'] ?? 0),
      timeElapsedSeconds: (json['timeElapsedSeconds'] as int?) ?? 0,
      numEdgesWritten: json['numEdgesWritten'] as int?,
      numVerticesWritten: json['numVerticesWritten'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final progressPercentage = this.progressPercentage;
    final startTime = this.startTime;
    final timeElapsedSeconds = this.timeElapsedSeconds;
    final numEdgesWritten = this.numEdgesWritten;
    final numVerticesWritten = this.numVerticesWritten;
    return {
      'progressPercentage': progressPercentage,
      'startTime': unixTimestampToJson(startTime),
      'timeElapsedSeconds': timeElapsedSeconds,
      if (numEdgesWritten != null) 'numEdgesWritten': numEdgesWritten,
      if (numVerticesWritten != null) 'numVerticesWritten': numVerticesWritten,
    };
  }
}

/// Specifies the number of dimensions for vector embeddings loaded into the
/// graph. Max = 65535
class VectorSearchConfiguration {
  /// The number of dimensions.
  final int dimension;

  VectorSearchConfiguration({
    required this.dimension,
  });

  factory VectorSearchConfiguration.fromJson(Map<String, dynamic> json) {
    return VectorSearchConfiguration(
      dimension: (json['dimension'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final dimension = this.dimension;
    return {
      'dimension': dimension,
    };
  }
}

/// Details about a graph snapshot.
class GraphSnapshotSummary {
  /// The ARN of the graph snapshot.
  final String arn;

  /// The unique identifier of the graph snapshot.
  final String id;

  /// The snapshot name. For example: <code>my-snapshot-1</code>.
  ///
  /// The name must contain from 1 to 63 letters, numbers, or hyphens, and its
  /// first character must be a letter. It cannot end with a hyphen or contain two
  /// consecutive hyphens. Only lowercase letters are allowed.
  final String name;

  /// The ID of the KMS key used to encrypt and decrypt the snapshot.
  final String? kmsKeyIdentifier;

  /// The time when the snapshot was created.
  final DateTime? snapshotCreateTime;

  /// The graph identifier for the graph for which a snapshot is to be created.
  final String? sourceGraphId;

  /// The status of the graph snapshot.
  final SnapshotStatus? status;

  GraphSnapshotSummary({
    required this.arn,
    required this.id,
    required this.name,
    this.kmsKeyIdentifier,
    this.snapshotCreateTime,
    this.sourceGraphId,
    this.status,
  });

  factory GraphSnapshotSummary.fromJson(Map<String, dynamic> json) {
    return GraphSnapshotSummary(
      arn: (json['arn'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      kmsKeyIdentifier: json['kmsKeyIdentifier'] as String?,
      snapshotCreateTime: timeStampFromJson(json['snapshotCreateTime']),
      sourceGraphId: json['sourceGraphId'] as String?,
      status: (json['status'] as String?)?.let(SnapshotStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final name = this.name;
    final kmsKeyIdentifier = this.kmsKeyIdentifier;
    final snapshotCreateTime = this.snapshotCreateTime;
    final sourceGraphId = this.sourceGraphId;
    final status = this.status;
    return {
      'arn': arn,
      'id': id,
      'name': name,
      if (kmsKeyIdentifier != null) 'kmsKeyIdentifier': kmsKeyIdentifier,
      if (snapshotCreateTime != null)
        'snapshotCreateTime': unixTimestampToJson(snapshotCreateTime),
      if (sourceGraphId != null) 'sourceGraphId': sourceGraphId,
      if (status != null) 'status': status.value,
    };
  }
}

class SnapshotStatus {
  static const creating = SnapshotStatus._('CREATING');
  static const available = SnapshotStatus._('AVAILABLE');
  static const deleting = SnapshotStatus._('DELETING');
  static const failed = SnapshotStatus._('FAILED');

  final String value;

  const SnapshotStatus._(this.value);

  static const values = [creating, available, deleting, failed];

  static SnapshotStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SnapshotStatus._(value));

  @override
  bool operator ==(other) => other is SnapshotStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Details about a private graph endpoint.
class PrivateGraphEndpointSummary {
  /// The status of the private graph endpoint.
  final PrivateGraphEndpointStatus status;

  /// The subnet IDs associated with the private graph endpoint.
  final List<String> subnetIds;

  /// The ID of the VPC in which the private graph endpoint is located.
  final String vpcId;

  /// The ID of the VPC endpoint.
  final String? vpcEndpointId;

  PrivateGraphEndpointSummary({
    required this.status,
    required this.subnetIds,
    required this.vpcId,
    this.vpcEndpointId,
  });

  factory PrivateGraphEndpointSummary.fromJson(Map<String, dynamic> json) {
    return PrivateGraphEndpointSummary(
      status: PrivateGraphEndpointStatus.fromString(
          (json['status'] as String?) ?? ''),
      subnetIds: ((json['subnetIds'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      vpcId: (json['vpcId'] as String?) ?? '',
      vpcEndpointId: json['vpcEndpointId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final subnetIds = this.subnetIds;
    final vpcId = this.vpcId;
    final vpcEndpointId = this.vpcEndpointId;
    return {
      'status': status.value,
      'subnetIds': subnetIds,
      'vpcId': vpcId,
      if (vpcEndpointId != null) 'vpcEndpointId': vpcEndpointId,
    };
  }
}

class PrivateGraphEndpointStatus {
  static const creating = PrivateGraphEndpointStatus._('CREATING');
  static const available = PrivateGraphEndpointStatus._('AVAILABLE');
  static const deleting = PrivateGraphEndpointStatus._('DELETING');
  static const failed = PrivateGraphEndpointStatus._('FAILED');

  final String value;

  const PrivateGraphEndpointStatus._(this.value);

  static const values = [creating, available, deleting, failed];

  static PrivateGraphEndpointStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PrivateGraphEndpointStatus._(value));

  @override
  bool operator ==(other) =>
      other is PrivateGraphEndpointStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class GraphStatus {
  static const creating = GraphStatus._('CREATING');
  static const available = GraphStatus._('AVAILABLE');
  static const deleting = GraphStatus._('DELETING');
  static const resetting = GraphStatus._('RESETTING');
  static const updating = GraphStatus._('UPDATING');
  static const snapshotting = GraphStatus._('SNAPSHOTTING');
  static const failed = GraphStatus._('FAILED');
  static const importing = GraphStatus._('IMPORTING');
  static const starting = GraphStatus._('STARTING');
  static const stopping = GraphStatus._('STOPPING');
  static const stopped = GraphStatus._('STOPPED');

  final String value;

  const GraphStatus._(this.value);

  static const values = [
    creating,
    available,
    deleting,
    resetting,
    updating,
    snapshotting,
    failed,
    importing,
    starting,
    stopping,
    stopped
  ];

  static GraphStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => GraphStatus._(value));

  @override
  bool operator ==(other) => other is GraphStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Summary details about a graph.
class GraphSummary {
  /// The ARN associated with the graph.
  final String arn;

  /// The unique identifier of the graph.
  final String id;

  /// The name of the graph.
  final String name;

  /// If <code>true</code>, deletion protection is enabled for the graph.
  final bool? deletionProtection;

  /// The graph endpoint.
  final String? endpoint;

  /// The ID of the KMS key used to encrypt and decrypt graph data.
  final String? kmsKeyIdentifier;

  /// The number of memory-optimized Neptune Capacity Units (m-NCUs) allocated to
  /// the graph.
  final int? provisionedMemory;

  /// If <code>true</code>, the graph has a public endpoint, otherwise not.
  final bool? publicConnectivity;

  /// The number of replicas for the graph.
  final int? replicaCount;

  /// The status of the graph.
  final GraphStatus? status;

  GraphSummary({
    required this.arn,
    required this.id,
    required this.name,
    this.deletionProtection,
    this.endpoint,
    this.kmsKeyIdentifier,
    this.provisionedMemory,
    this.publicConnectivity,
    this.replicaCount,
    this.status,
  });

  factory GraphSummary.fromJson(Map<String, dynamic> json) {
    return GraphSummary(
      arn: (json['arn'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      deletionProtection: json['deletionProtection'] as bool?,
      endpoint: json['endpoint'] as String?,
      kmsKeyIdentifier: json['kmsKeyIdentifier'] as String?,
      provisionedMemory: json['provisionedMemory'] as int?,
      publicConnectivity: json['publicConnectivity'] as bool?,
      replicaCount: json['replicaCount'] as int?,
      status: (json['status'] as String?)?.let(GraphStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final name = this.name;
    final deletionProtection = this.deletionProtection;
    final endpoint = this.endpoint;
    final kmsKeyIdentifier = this.kmsKeyIdentifier;
    final provisionedMemory = this.provisionedMemory;
    final publicConnectivity = this.publicConnectivity;
    final replicaCount = this.replicaCount;
    final status = this.status;
    return {
      'arn': arn,
      'id': id,
      'name': name,
      if (deletionProtection != null) 'deletionProtection': deletionProtection,
      if (endpoint != null) 'endpoint': endpoint,
      if (kmsKeyIdentifier != null) 'kmsKeyIdentifier': kmsKeyIdentifier,
      if (provisionedMemory != null) 'provisionedMemory': provisionedMemory,
      if (publicConnectivity != null) 'publicConnectivity': publicConnectivity,
      if (replicaCount != null) 'replicaCount': replicaCount,
      if (status != null) 'status': status.value,
    };
  }
}

/// Details of the query listed.
class QuerySummary {
  /// The running time of the query, in milliseconds.
  final int? elapsed;

  /// A string representation of the id of the query.
  final String? id;

  /// The actual query text. The <code>queryString</code> may be truncated if the
  /// actual query string is too long.
  final String? queryString;

  /// State of the query.
  final QueryState? state;

  /// The amount of time, in milliseconds, the query has waited in the queue
  /// before being picked up by a worker thread.
  final int? waited;

  QuerySummary({
    this.elapsed,
    this.id,
    this.queryString,
    this.state,
    this.waited,
  });

  factory QuerySummary.fromJson(Map<String, dynamic> json) {
    return QuerySummary(
      elapsed: json['elapsed'] as int?,
      id: json['id'] as String?,
      queryString: json['queryString'] as String?,
      state: (json['state'] as String?)?.let(QueryState.fromString),
      waited: json['waited'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final elapsed = this.elapsed;
    final id = this.id;
    final queryString = this.queryString;
    final state = this.state;
    final waited = this.waited;
    return {
      if (elapsed != null) 'elapsed': elapsed,
      if (id != null) 'id': id,
      if (queryString != null) 'queryString': queryString,
      if (state != null) 'state': state.value,
      if (waited != null) 'waited': waited,
    };
  }
}

class QueryState {
  static const running = QueryState._('RUNNING');
  static const waiting = QueryState._('WAITING');
  static const cancelling = QueryState._('CANCELLING');

  final String value;

  const QueryState._(this.value);

  static const values = [running, waiting, cancelling];

  static QueryState fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => QueryState._(value));

  @override
  bool operator ==(other) => other is QueryState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class QueryStateInput {
  static const all = QueryStateInput._('ALL');
  static const running = QueryStateInput._('RUNNING');
  static const waiting = QueryStateInput._('WAITING');
  static const cancelling = QueryStateInput._('CANCELLING');

  final String value;

  const QueryStateInput._(this.value);

  static const values = [all, running, waiting, cancelling];

  static QueryStateInput fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => QueryStateInput._(value));

  @override
  bool operator ==(other) => other is QueryStateInput && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Summary information about the graph.
class GraphDataSummary {
  /// A list of the edge labels in the graph.
  final List<String>? edgeLabels;

  /// A list of the distinct edge properties in the graph, along with the count of
  /// edges where each property is used.
  final List<Map<String, int>>? edgeProperties;

  /// This field is only present when the requested mode is DETAILED. It contains
  /// a list of edge structures.
  final List<EdgeStructure>? edgeStructures;

  /// A list of distinct node labels in the graph.
  final List<String>? nodeLabels;

  /// A list of the distinct node properties in the graph, along with the count of
  /// nodes where each property is used.
  final List<Map<String, int>>? nodeProperties;

  /// This field is only present when the requested mode is DETAILED. It contains
  /// a list of node structures.
  final List<NodeStructure>? nodeStructures;

  /// The number of unique edge labels in the graph.
  final int? numEdgeLabels;

  /// The number of edge properties in the graph.
  final int? numEdgeProperties;

  /// The number of edges in the graph.
  final int? numEdges;

  /// The number of distinct node labels in the graph.
  final int? numNodeLabels;

  /// The number of distinct node properties in the graph.
  final int? numNodeProperties;

  /// The number of nodes in the graph.
  final int? numNodes;

  /// The total number of usages of all edge properties.
  final int? totalEdgePropertyValues;

  /// The total number of usages of all node properties.
  final int? totalNodePropertyValues;

  GraphDataSummary({
    this.edgeLabels,
    this.edgeProperties,
    this.edgeStructures,
    this.nodeLabels,
    this.nodeProperties,
    this.nodeStructures,
    this.numEdgeLabels,
    this.numEdgeProperties,
    this.numEdges,
    this.numNodeLabels,
    this.numNodeProperties,
    this.numNodes,
    this.totalEdgePropertyValues,
    this.totalNodePropertyValues,
  });

  factory GraphDataSummary.fromJson(Map<String, dynamic> json) {
    return GraphDataSummary(
      edgeLabels: (json['edgeLabels'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      edgeProperties: (json['edgeProperties'] as List?)
          ?.nonNulls
          .map((e) =>
              (e as Map<String, dynamic>).map((k, e) => MapEntry(k, e as int)))
          .toList(),
      edgeStructures: (json['edgeStructures'] as List?)
          ?.nonNulls
          .map((e) => EdgeStructure.fromJson(e as Map<String, dynamic>))
          .toList(),
      nodeLabels: (json['nodeLabels'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      nodeProperties: (json['nodeProperties'] as List?)
          ?.nonNulls
          .map((e) =>
              (e as Map<String, dynamic>).map((k, e) => MapEntry(k, e as int)))
          .toList(),
      nodeStructures: (json['nodeStructures'] as List?)
          ?.nonNulls
          .map((e) => NodeStructure.fromJson(e as Map<String, dynamic>))
          .toList(),
      numEdgeLabels: json['numEdgeLabels'] as int?,
      numEdgeProperties: json['numEdgeProperties'] as int?,
      numEdges: json['numEdges'] as int?,
      numNodeLabels: json['numNodeLabels'] as int?,
      numNodeProperties: json['numNodeProperties'] as int?,
      numNodes: json['numNodes'] as int?,
      totalEdgePropertyValues: json['totalEdgePropertyValues'] as int?,
      totalNodePropertyValues: json['totalNodePropertyValues'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final edgeLabels = this.edgeLabels;
    final edgeProperties = this.edgeProperties;
    final edgeStructures = this.edgeStructures;
    final nodeLabels = this.nodeLabels;
    final nodeProperties = this.nodeProperties;
    final nodeStructures = this.nodeStructures;
    final numEdgeLabels = this.numEdgeLabels;
    final numEdgeProperties = this.numEdgeProperties;
    final numEdges = this.numEdges;
    final numNodeLabels = this.numNodeLabels;
    final numNodeProperties = this.numNodeProperties;
    final numNodes = this.numNodes;
    final totalEdgePropertyValues = this.totalEdgePropertyValues;
    final totalNodePropertyValues = this.totalNodePropertyValues;
    return {
      if (edgeLabels != null) 'edgeLabels': edgeLabels,
      if (edgeProperties != null) 'edgeProperties': edgeProperties,
      if (edgeStructures != null) 'edgeStructures': edgeStructures,
      if (nodeLabels != null) 'nodeLabels': nodeLabels,
      if (nodeProperties != null) 'nodeProperties': nodeProperties,
      if (nodeStructures != null) 'nodeStructures': nodeStructures,
      if (numEdgeLabels != null) 'numEdgeLabels': numEdgeLabels,
      if (numEdgeProperties != null) 'numEdgeProperties': numEdgeProperties,
      if (numEdges != null) 'numEdges': numEdges,
      if (numNodeLabels != null) 'numNodeLabels': numNodeLabels,
      if (numNodeProperties != null) 'numNodeProperties': numNodeProperties,
      if (numNodes != null) 'numNodes': numNodes,
      if (totalEdgePropertyValues != null)
        'totalEdgePropertyValues': totalEdgePropertyValues,
      if (totalNodePropertyValues != null)
        'totalNodePropertyValues': totalNodePropertyValues,
    };
  }
}

/// Contains information about an edge in a Neptune Analytics graph.
class EdgeStructure {
  /// The number of instances of the edge in the graph.
  final int? count;

  /// A list of the properties associated with the edge.
  final List<String>? edgeProperties;

  EdgeStructure({
    this.count,
    this.edgeProperties,
  });

  factory EdgeStructure.fromJson(Map<String, dynamic> json) {
    return EdgeStructure(
      count: json['count'] as int?,
      edgeProperties: (json['edgeProperties'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final count = this.count;
    final edgeProperties = this.edgeProperties;
    return {
      if (count != null) 'count': count,
      if (edgeProperties != null) 'edgeProperties': edgeProperties,
    };
  }
}

/// Information about a node.
class NodeStructure {
  /// The number of instances of this node.
  final int? count;

  /// The outgoing edge labels associated with this node.
  final List<String>? distinctOutgoingEdgeLabels;

  /// Properties associated with this node.
  final List<String>? nodeProperties;

  NodeStructure({
    this.count,
    this.distinctOutgoingEdgeLabels,
    this.nodeProperties,
  });

  factory NodeStructure.fromJson(Map<String, dynamic> json) {
    return NodeStructure(
      count: json['count'] as int?,
      distinctOutgoingEdgeLabels: (json['distinctOutgoingEdgeLabels'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      nodeProperties: (json['nodeProperties'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final count = this.count;
    final distinctOutgoingEdgeLabels = this.distinctOutgoingEdgeLabels;
    final nodeProperties = this.nodeProperties;
    return {
      if (count != null) 'count': count,
      if (distinctOutgoingEdgeLabels != null)
        'distinctOutgoingEdgeLabels': distinctOutgoingEdgeLabels,
      if (nodeProperties != null) 'nodeProperties': nodeProperties,
    };
  }
}

class GraphSummaryMode {
  static const basic = GraphSummaryMode._('BASIC');
  static const detailed = GraphSummaryMode._('DETAILED');

  final String value;

  const GraphSummaryMode._(this.value);

  static const values = [basic, detailed];

  static GraphSummaryMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => GraphSummaryMode._(value));

  @override
  bool operator ==(other) => other is GraphSummaryMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class QueryLanguage {
  static const openCypher = QueryLanguage._('OPEN_CYPHER');

  final String value;

  const QueryLanguage._(this.value);

  static const values = [openCypher];

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

class PlanCacheType {
  static const enabled = PlanCacheType._('ENABLED');
  static const disabled = PlanCacheType._('DISABLED');
  static const auto = PlanCacheType._('AUTO');

  final String value;

  const PlanCacheType._(this.value);

  static const values = [enabled, disabled, auto];

  static PlanCacheType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PlanCacheType._(value));

  @override
  bool operator ==(other) => other is PlanCacheType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class ExplainMode {
  static const static = ExplainMode._('STATIC');
  static const details = ExplainMode._('DETAILS');

  final String value;

  const ExplainMode._(this.value);

  static const values = [static, details];

  static ExplainMode fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ExplainMode._(value));

  @override
  bool operator ==(other) => other is ExplainMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class Document {
  Document();

  Map<String, dynamic> toJson() {
    return {};
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

class UnprocessableException extends _s.GenericAwsException {
  UnprocessableException({String? type, String? message})
      : super(type: type, code: 'UnprocessableException', message: message);
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
  'UnprocessableException': (type, message) =>
      UnprocessableException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
