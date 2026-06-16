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

/// Use the Amazon OpenSearch Ingestion API to create and manage ingestion
/// pipelines. OpenSearch Ingestion is a fully managed data collector that
/// delivers real-time log and trace data to OpenSearch Service domains. For
/// more information, see <a
/// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/ingestion.html">Getting
/// data into your cluster using OpenSearch Ingestion</a>.
class Osis {
  final _s.RestJsonProtocol _protocol;
  Osis({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'osis',
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

  /// Creates an OpenSearch Ingestion pipeline. For more information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/creating-pipeline.html">Creating
  /// Amazon OpenSearch Ingestion pipelines</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [DisabledOperationException].
  /// May throw [InternalException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxUnits] :
  /// The maximum pipeline capacity, in Ingestion Compute Units (ICUs).
  ///
  /// Parameter [minUnits] :
  /// The minimum pipeline capacity, in Ingestion Compute Units (ICUs).
  ///
  /// Parameter [pipelineConfigurationBody] :
  /// The pipeline configuration in YAML format. The command accepts the
  /// pipeline configuration as a string or within a .yaml file. If you provide
  /// the configuration as a string, each new line must be escaped with
  /// <code>\n</code>.
  ///
  /// Parameter [pipelineName] :
  /// The name of the OpenSearch Ingestion pipeline to create. Pipeline names
  /// are unique across the pipelines owned by an account within an Amazon Web
  /// Services Region.
  ///
  /// Parameter [bufferOptions] :
  /// Key-value pairs to configure persistent buffering for the pipeline.
  ///
  /// Parameter [encryptionAtRestOptions] :
  /// Key-value pairs to configure encryption for data that is written to a
  /// persistent buffer.
  ///
  /// Parameter [logPublishingOptions] :
  /// Key-value pairs to configure log publishing.
  ///
  /// Parameter [pipelineRoleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role that grants the pipeline
  /// permission to access Amazon Web Services resources.
  ///
  /// Parameter [tags] :
  /// List of tags to add to the pipeline upon creation.
  ///
  /// Parameter [vpcOptions] :
  /// Container for the values required to configure VPC access for the
  /// pipeline. If you don't specify these values, OpenSearch Ingestion creates
  /// the pipeline with a public endpoint.
  Future<CreatePipelineResponse> createPipeline({
    required int maxUnits,
    required int minUnits,
    required String pipelineConfigurationBody,
    required String pipelineName,
    BufferOptions? bufferOptions,
    EncryptionAtRestOptions? encryptionAtRestOptions,
    LogPublishingOptions? logPublishingOptions,
    String? pipelineRoleArn,
    List<Tag>? tags,
    VpcOptions? vpcOptions,
  }) async {
    _s.validateNumRange(
      'maxUnits',
      maxUnits,
      1,
      1152921504606846976,
      isRequired: true,
    );
    _s.validateNumRange(
      'minUnits',
      minUnits,
      1,
      1152921504606846976,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'MaxUnits': maxUnits,
      'MinUnits': minUnits,
      'PipelineConfigurationBody': pipelineConfigurationBody,
      'PipelineName': pipelineName,
      if (bufferOptions != null) 'BufferOptions': bufferOptions,
      if (encryptionAtRestOptions != null)
        'EncryptionAtRestOptions': encryptionAtRestOptions,
      if (logPublishingOptions != null)
        'LogPublishingOptions': logPublishingOptions,
      if (pipelineRoleArn != null) 'PipelineRoleArn': pipelineRoleArn,
      if (tags != null) 'Tags': tags,
      if (vpcOptions != null) 'VpcOptions': vpcOptions,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2022-01-01/osis/createPipeline',
      exceptionFnMap: _exceptionFns,
    );
    return CreatePipelineResponse.fromJson(response);
  }

  /// Creates a VPC endpoint for an OpenSearch Ingestion pipeline. Pipeline
  /// endpoints allow you to ingest data from your VPC into pipelines that you
  /// have access to.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [DisabledOperationException].
  /// May throw [InternalException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [pipelineArn] :
  /// The Amazon Resource Name (ARN) of the pipeline to create the endpoint for.
  ///
  /// Parameter [vpcOptions] :
  /// Container for the VPC configuration for the pipeline endpoint, including
  /// subnet IDs and security group IDs.
  Future<CreatePipelineEndpointResponse> createPipelineEndpoint({
    required String pipelineArn,
    required PipelineEndpointVpcOptions vpcOptions,
  }) async {
    final $payload = <String, dynamic>{
      'PipelineArn': pipelineArn,
      'VpcOptions': vpcOptions,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2022-01-01/osis/createPipelineEndpoint',
      exceptionFnMap: _exceptionFns,
    );
    return CreatePipelineEndpointResponse.fromJson(response);
  }

  /// Deletes an OpenSearch Ingestion pipeline. For more information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/delete-pipeline.html">Deleting
  /// Amazon OpenSearch Ingestion pipelines</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [DisabledOperationException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [pipelineName] :
  /// The name of the pipeline to delete.
  Future<void> deletePipeline({
    required String pipelineName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2022-01-01/osis/deletePipeline/${Uri.encodeComponent(pipelineName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a VPC endpoint for an OpenSearch Ingestion pipeline.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [DisabledOperationException].
  /// May throw [InternalException].
  /// May throw [ValidationException].
  ///
  /// Parameter [endpointId] :
  /// The unique identifier of the pipeline endpoint to delete.
  Future<void> deletePipelineEndpoint({
    required String endpointId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2022-01-01/osis/deletePipelineEndpoint/${Uri.encodeComponent(endpointId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a resource-based policy from an OpenSearch Ingestion resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [DisabledOperationException].
  /// May throw [InternalException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource from which to delete the
  /// policy.
  Future<void> deleteResourcePolicy({
    required String resourceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2022-01-01/osis/resourcePolicy/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Retrieves information about an OpenSearch Ingestion pipeline.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [DisabledOperationException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [pipelineName] :
  /// The name of the pipeline.
  Future<GetPipelineResponse> getPipeline({
    required String pipelineName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2022-01-01/osis/getPipeline/${Uri.encodeComponent(pipelineName)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetPipelineResponse.fromJson(response);
  }

  /// Retrieves information about a specific blueprint for OpenSearch Ingestion.
  /// Blueprints are templates for the configuration needed for a
  /// <code>CreatePipeline</code> request. For more information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/creating-pipeline.html#pipeline-blueprint">Using
  /// blueprints to create a pipeline</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [DisabledOperationException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [blueprintName] :
  /// The name of the blueprint to retrieve.
  ///
  /// Parameter [format] :
  /// The format format of the blueprint to retrieve.
  Future<GetPipelineBlueprintResponse> getPipelineBlueprint({
    required String blueprintName,
    String? format,
  }) async {
    final $query = <String, List<String>>{
      if (format != null) 'format': [format],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2022-01-01/osis/getPipelineBlueprint/${Uri.encodeComponent(blueprintName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetPipelineBlueprintResponse.fromJson(response);
  }

  /// Returns progress information for the current change happening on an
  /// OpenSearch Ingestion pipeline. Currently, this operation only returns
  /// information when a pipeline is being created.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/creating-pipeline.html#get-pipeline-progress">Tracking
  /// the status of pipeline creation</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [DisabledOperationException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [pipelineName] :
  /// The name of the pipeline.
  Future<GetPipelineChangeProgressResponse> getPipelineChangeProgress({
    required String pipelineName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2022-01-01/osis/getPipelineChangeProgress/${Uri.encodeComponent(pipelineName)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetPipelineChangeProgressResponse.fromJson(response);
  }

  /// Retrieves the resource-based policy attached to an OpenSearch Ingestion
  /// resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [DisabledOperationException].
  /// May throw [InternalException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource for which to retrieve the
  /// policy.
  Future<GetResourcePolicyResponse> getResourcePolicy({
    required String resourceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2022-01-01/osis/resourcePolicy/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetResourcePolicyResponse.fromJson(response);
  }

  /// Retrieves a list of all available blueprints for Data Prepper. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/creating-pipeline.html#pipeline-blueprint">Using
  /// blueprints to create a pipeline</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [DisabledOperationException].
  /// May throw [InternalException].
  /// May throw [InvalidPaginationTokenException].
  /// May throw [ValidationException].
  Future<ListPipelineBlueprintsResponse> listPipelineBlueprints() async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/2022-01-01/osis/listPipelineBlueprints',
      exceptionFnMap: _exceptionFns,
    );
    return ListPipelineBlueprintsResponse.fromJson(response);
  }

  /// Lists the pipeline endpoints connected to pipelines in your account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [DisabledOperationException].
  /// May throw [InternalException].
  /// May throw [LimitExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of pipeline endpoint connections to return in the
  /// response.
  ///
  /// Parameter [nextToken] :
  /// If your initial <code>ListPipelineEndpointConnections</code> operation
  /// returns a <code>nextToken</code>, you can include the returned
  /// <code>nextToken</code> in subsequent
  /// <code>ListPipelineEndpointConnections</code> operations, which returns
  /// results in the next page.
  Future<ListPipelineEndpointConnectionsResponse>
      listPipelineEndpointConnections({
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
      requestUri: '/2022-01-01/osis/listPipelineEndpointConnections',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListPipelineEndpointConnectionsResponse.fromJson(response);
  }

  /// Lists all pipeline endpoints in your account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [DisabledOperationException].
  /// May throw [InternalException].
  /// May throw [LimitExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of pipeline endpoints to return in the response.
  ///
  /// Parameter [nextToken] :
  /// If your initial <code>ListPipelineEndpoints</code> operation returns a
  /// <code>NextToken</code>, you can include the returned
  /// <code>NextToken</code> in subsequent <code>ListPipelineEndpoints</code>
  /// operations, which returns results in the next page.
  Future<ListPipelineEndpointsResponse> listPipelineEndpoints({
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
      requestUri: '/2022-01-01/osis/listPipelineEndpoints',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListPipelineEndpointsResponse.fromJson(response);
  }

  /// Lists all OpenSearch Ingestion pipelines in the current Amazon Web
  /// Services account and Region. For more information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/list-pipeline.html">Viewing
  /// Amazon OpenSearch Ingestion pipelines</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [DisabledOperationException].
  /// May throw [InternalException].
  /// May throw [InvalidPaginationTokenException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// An optional parameter that specifies the maximum number of results to
  /// return. You can use <code>nextToken</code> to get the next page of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// If your initial <code>ListPipelines</code> operation returns a
  /// <code>nextToken</code>, you can include the returned
  /// <code>nextToken</code> in subsequent <code>ListPipelines</code>
  /// operations, which returns results in the next page.
  Future<ListPipelinesResponse> listPipelines({
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
      requestUri: '/2022-01-01/osis/listPipelines',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListPipelinesResponse.fromJson(response);
  }

  /// Lists all resource tags associated with an OpenSearch Ingestion pipeline.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/tag-pipeline.html">Tagging
  /// Amazon OpenSearch Ingestion pipelines</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [DisabledOperationException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the pipeline to retrieve tags for.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String arn,
  }) async {
    final $query = <String, List<String>>{
      'arn': [arn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2022-01-01/osis/listTagsForResource',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Attaches a resource-based policy to an OpenSearch Ingestion resource.
  /// Resource-based policies grant permissions to principals to perform actions
  /// on the resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [DisabledOperationException].
  /// May throw [InternalException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [policy] :
  /// The resource-based policy document in JSON format.
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource to attach the policy to.
  Future<PutResourcePolicyResponse> putResourcePolicy({
    required String policy,
    required String resourceArn,
  }) async {
    final $payload = <String, dynamic>{
      'Policy': policy,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/2022-01-01/osis/resourcePolicy/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return PutResourcePolicyResponse.fromJson(response);
  }

  /// Revokes pipeline endpoints from specified endpoint IDs.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [DisabledOperationException].
  /// May throw [InternalException].
  /// May throw [LimitExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [endpointIds] :
  /// A list of endpoint IDs for which to revoke access to the pipeline.
  ///
  /// Parameter [pipelineArn] :
  /// The Amazon Resource Name (ARN) of the pipeline from which to revoke
  /// endpoint connections.
  Future<RevokePipelineEndpointConnectionsResponse>
      revokePipelineEndpointConnections({
    required List<String> endpointIds,
    required String pipelineArn,
  }) async {
    final $payload = <String, dynamic>{
      'EndpointIds': endpointIds,
      'PipelineArn': pipelineArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2022-01-01/osis/revokePipelineEndpointConnections',
      exceptionFnMap: _exceptionFns,
    );
    return RevokePipelineEndpointConnectionsResponse.fromJson(response);
  }

  /// Starts an OpenSearch Ingestion pipeline. For more information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/pipeline--stop-start.html#pipeline--start">Starting
  /// an OpenSearch Ingestion pipeline</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [DisabledOperationException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [pipelineName] :
  /// The name of the pipeline to start.
  Future<StartPipelineResponse> startPipeline({
    required String pipelineName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri:
          '/2022-01-01/osis/startPipeline/${Uri.encodeComponent(pipelineName)}',
      exceptionFnMap: _exceptionFns,
    );
    return StartPipelineResponse.fromJson(response);
  }

  /// Stops an OpenSearch Ingestion pipeline. For more information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/pipeline--stop-start.html#pipeline--stop">Stopping
  /// an OpenSearch Ingestion pipeline</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [DisabledOperationException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [pipelineName] :
  /// The name of the pipeline to stop.
  Future<StopPipelineResponse> stopPipeline({
    required String pipelineName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri:
          '/2022-01-01/osis/stopPipeline/${Uri.encodeComponent(pipelineName)}',
      exceptionFnMap: _exceptionFns,
    );
    return StopPipelineResponse.fromJson(response);
  }

  /// Tags an OpenSearch Ingestion pipeline. For more information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/tag-pipeline.html">Tagging
  /// Amazon OpenSearch Ingestion pipelines</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [DisabledOperationException].
  /// May throw [InternalException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the pipeline to tag.
  ///
  /// Parameter [tags] :
  /// The list of key-value tags to add to the pipeline.
  Future<void> tagResource({
    required String arn,
    required List<Tag> tags,
  }) async {
    final $query = <String, List<String>>{
      'arn': [arn],
    };
    final $payload = <String, dynamic>{
      'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2022-01-01/osis/tagResource',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes one or more tags from an OpenSearch Ingestion pipeline. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/tag-pipeline.html">Tagging
  /// Amazon OpenSearch Ingestion pipelines</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [DisabledOperationException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the pipeline to remove tags from.
  ///
  /// Parameter [tagKeys] :
  /// The tag keys to remove.
  Future<void> untagResource({
    required String arn,
    required List<String> tagKeys,
  }) async {
    final $query = <String, List<String>>{
      'arn': [arn],
    };
    final $payload = <String, dynamic>{
      'TagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2022-01-01/osis/untagResource',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates an OpenSearch Ingestion pipeline. For more information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/update-pipeline.html">Updating
  /// Amazon OpenSearch Ingestion pipelines</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [DisabledOperationException].
  /// May throw [InternalException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [pipelineName] :
  /// The name of the pipeline to update.
  ///
  /// Parameter [bufferOptions] :
  /// Key-value pairs to configure persistent buffering for the pipeline.
  ///
  /// Parameter [encryptionAtRestOptions] :
  /// Key-value pairs to configure encryption for data that is written to a
  /// persistent buffer.
  ///
  /// Parameter [logPublishingOptions] :
  /// Key-value pairs to configure log publishing.
  ///
  /// Parameter [maxUnits] :
  /// The maximum pipeline capacity, in Ingestion Compute Units (ICUs)
  ///
  /// Parameter [minUnits] :
  /// The minimum pipeline capacity, in Ingestion Compute Units (ICUs).
  ///
  /// Parameter [pipelineConfigurationBody] :
  /// The pipeline configuration in YAML format. The command accepts the
  /// pipeline configuration as a string or within a .yaml file. If you provide
  /// the configuration as a string, each new line must be escaped with
  /// <code>\n</code>.
  ///
  /// Parameter [pipelineRoleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role that grants the pipeline
  /// permission to access Amazon Web Services resources.
  Future<UpdatePipelineResponse> updatePipeline({
    required String pipelineName,
    BufferOptions? bufferOptions,
    EncryptionAtRestOptions? encryptionAtRestOptions,
    LogPublishingOptions? logPublishingOptions,
    int? maxUnits,
    int? minUnits,
    String? pipelineConfigurationBody,
    String? pipelineRoleArn,
  }) async {
    _s.validateNumRange(
      'maxUnits',
      maxUnits,
      1,
      1152921504606846976,
    );
    _s.validateNumRange(
      'minUnits',
      minUnits,
      1,
      1152921504606846976,
    );
    final $payload = <String, dynamic>{
      if (bufferOptions != null) 'BufferOptions': bufferOptions,
      if (encryptionAtRestOptions != null)
        'EncryptionAtRestOptions': encryptionAtRestOptions,
      if (logPublishingOptions != null)
        'LogPublishingOptions': logPublishingOptions,
      if (maxUnits != null) 'MaxUnits': maxUnits,
      if (minUnits != null) 'MinUnits': minUnits,
      if (pipelineConfigurationBody != null)
        'PipelineConfigurationBody': pipelineConfigurationBody,
      if (pipelineRoleArn != null) 'PipelineRoleArn': pipelineRoleArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/2022-01-01/osis/updatePipeline/${Uri.encodeComponent(pipelineName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdatePipelineResponse.fromJson(response);
  }

  /// Checks whether an OpenSearch Ingestion pipeline configuration is valid
  /// prior to creation. For more information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/creating-pipeline.html">Creating
  /// Amazon OpenSearch Ingestion pipelines</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [DisabledOperationException].
  /// May throw [InternalException].
  /// May throw [ValidationException].
  ///
  /// Parameter [pipelineConfigurationBody] :
  /// The pipeline configuration in YAML format. The command accepts the
  /// pipeline configuration as a string or within a .yaml file. If you provide
  /// the configuration as a string, each new line must be escaped with
  /// <code>\n</code>.
  Future<ValidatePipelineResponse> validatePipeline({
    required String pipelineConfigurationBody,
  }) async {
    final $payload = <String, dynamic>{
      'PipelineConfigurationBody': pipelineConfigurationBody,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2022-01-01/osis/validatePipeline',
      exceptionFnMap: _exceptionFns,
    );
    return ValidatePipelineResponse.fromJson(response);
  }
}

class CreatePipelineResponse {
  /// Container for information about the created pipeline.
  final Pipeline? pipeline;

  CreatePipelineResponse({
    this.pipeline,
  });

  factory CreatePipelineResponse.fromJson(Map<String, dynamic> json) {
    return CreatePipelineResponse(
      pipeline: json['Pipeline'] != null
          ? Pipeline.fromJson(json['Pipeline'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final pipeline = this.pipeline;
    return {
      if (pipeline != null) 'Pipeline': pipeline,
    };
  }
}

class CreatePipelineEndpointResponse {
  /// The unique identifier of the pipeline endpoint.
  final String? endpointId;

  /// The Amazon Resource Name (ARN) of the pipeline associated with the endpoint.
  final String? pipelineArn;

  /// The current status of the pipeline endpoint.
  final PipelineEndpointStatus? status;

  /// The ID of the VPC where the pipeline endpoint was created.
  final String? vpcId;

  CreatePipelineEndpointResponse({
    this.endpointId,
    this.pipelineArn,
    this.status,
    this.vpcId,
  });

  factory CreatePipelineEndpointResponse.fromJson(Map<String, dynamic> json) {
    return CreatePipelineEndpointResponse(
      endpointId: json['EndpointId'] as String?,
      pipelineArn: json['PipelineArn'] as String?,
      status:
          (json['Status'] as String?)?.let(PipelineEndpointStatus.fromString),
      vpcId: json['VpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final endpointId = this.endpointId;
    final pipelineArn = this.pipelineArn;
    final status = this.status;
    final vpcId = this.vpcId;
    return {
      if (endpointId != null) 'EndpointId': endpointId,
      if (pipelineArn != null) 'PipelineArn': pipelineArn,
      if (status != null) 'Status': status.value,
      if (vpcId != null) 'VpcId': vpcId,
    };
  }
}

class DeletePipelineResponse {
  DeletePipelineResponse();

  factory DeletePipelineResponse.fromJson(Map<String, dynamic> _) {
    return DeletePipelineResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeletePipelineEndpointResponse {
  DeletePipelineEndpointResponse();

  factory DeletePipelineEndpointResponse.fromJson(Map<String, dynamic> _) {
    return DeletePipelineEndpointResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteResourcePolicyResponse {
  DeleteResourcePolicyResponse();

  factory DeleteResourcePolicyResponse.fromJson(Map<String, dynamic> _) {
    return DeleteResourcePolicyResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class GetPipelineResponse {
  /// Detailed information about the requested pipeline.
  final Pipeline? pipeline;

  GetPipelineResponse({
    this.pipeline,
  });

  factory GetPipelineResponse.fromJson(Map<String, dynamic> json) {
    return GetPipelineResponse(
      pipeline: json['Pipeline'] != null
          ? Pipeline.fromJson(json['Pipeline'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final pipeline = this.pipeline;
    return {
      if (pipeline != null) 'Pipeline': pipeline,
    };
  }
}

class GetPipelineBlueprintResponse {
  /// The requested blueprint in YAML format.
  final PipelineBlueprint? blueprint;

  /// The format of the blueprint.
  final String? format;

  GetPipelineBlueprintResponse({
    this.blueprint,
    this.format,
  });

  factory GetPipelineBlueprintResponse.fromJson(Map<String, dynamic> json) {
    return GetPipelineBlueprintResponse(
      blueprint: json['Blueprint'] != null
          ? PipelineBlueprint.fromJson(
              json['Blueprint'] as Map<String, dynamic>)
          : null,
      format: json['Format'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final blueprint = this.blueprint;
    final format = this.format;
    return {
      if (blueprint != null) 'Blueprint': blueprint,
      if (format != null) 'Format': format,
    };
  }
}

class GetPipelineChangeProgressResponse {
  /// The current status of the change happening on the pipeline.
  final List<ChangeProgressStatus>? changeProgressStatuses;

  GetPipelineChangeProgressResponse({
    this.changeProgressStatuses,
  });

  factory GetPipelineChangeProgressResponse.fromJson(
      Map<String, dynamic> json) {
    return GetPipelineChangeProgressResponse(
      changeProgressStatuses: (json['ChangeProgressStatuses'] as List?)
          ?.nonNulls
          .map((e) => ChangeProgressStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final changeProgressStatuses = this.changeProgressStatuses;
    return {
      if (changeProgressStatuses != null)
        'ChangeProgressStatuses': changeProgressStatuses,
    };
  }
}

class GetResourcePolicyResponse {
  /// The resource-based policy document in JSON format.
  final String? policy;

  /// The Amazon Resource Name (ARN) of the resource.
  final String? resourceArn;

  GetResourcePolicyResponse({
    this.policy,
    this.resourceArn,
  });

  factory GetResourcePolicyResponse.fromJson(Map<String, dynamic> json) {
    return GetResourcePolicyResponse(
      policy: json['Policy'] as String?,
      resourceArn: json['ResourceArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final policy = this.policy;
    final resourceArn = this.resourceArn;
    return {
      if (policy != null) 'Policy': policy,
      if (resourceArn != null) 'ResourceArn': resourceArn,
    };
  }
}

class ListPipelineBlueprintsResponse {
  /// A list of available blueprints for Data Prepper.
  final List<PipelineBlueprintSummary>? blueprints;

  ListPipelineBlueprintsResponse({
    this.blueprints,
  });

  factory ListPipelineBlueprintsResponse.fromJson(Map<String, dynamic> json) {
    return ListPipelineBlueprintsResponse(
      blueprints: (json['Blueprints'] as List?)
          ?.nonNulls
          .map((e) =>
              PipelineBlueprintSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final blueprints = this.blueprints;
    return {
      if (blueprints != null) 'Blueprints': blueprints,
    };
  }
}

class ListPipelineEndpointConnectionsResponse {
  /// When <code>nextToken</code> is returned, there are more results available.
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. Make the call again using the returned token to retrieve the next
  /// page.
  final String? nextToken;

  /// A list of pipeline endpoint connections.
  final List<PipelineEndpointConnection>? pipelineEndpointConnections;

  ListPipelineEndpointConnectionsResponse({
    this.nextToken,
    this.pipelineEndpointConnections,
  });

  factory ListPipelineEndpointConnectionsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListPipelineEndpointConnectionsResponse(
      nextToken: json['NextToken'] as String?,
      pipelineEndpointConnections: (json['PipelineEndpointConnections']
              as List?)
          ?.nonNulls
          .map((e) =>
              PipelineEndpointConnection.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final pipelineEndpointConnections = this.pipelineEndpointConnections;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (pipelineEndpointConnections != null)
        'PipelineEndpointConnections': pipelineEndpointConnections,
    };
  }
}

class ListPipelineEndpointsResponse {
  /// When <code>NextToken</code> is returned, there are more results available.
  /// The value of <code>NextToken</code> is a unique pagination token for each
  /// page. Make the call again using the returned token to retrieve the next
  /// page.
  final String? nextToken;

  /// A list of pipeline endpoints.
  final List<PipelineEndpoint>? pipelineEndpoints;

  ListPipelineEndpointsResponse({
    this.nextToken,
    this.pipelineEndpoints,
  });

  factory ListPipelineEndpointsResponse.fromJson(Map<String, dynamic> json) {
    return ListPipelineEndpointsResponse(
      nextToken: json['NextToken'] as String?,
      pipelineEndpoints: (json['PipelineEndpoints'] as List?)
          ?.nonNulls
          .map((e) => PipelineEndpoint.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final pipelineEndpoints = this.pipelineEndpoints;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (pipelineEndpoints != null) 'PipelineEndpoints': pipelineEndpoints,
    };
  }
}

class ListPipelinesResponse {
  /// When <code>nextToken</code> is returned, there are more results available.
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. Make the call again using the returned token to retrieve the next
  /// page.
  final String? nextToken;

  /// A list of all existing Data Prepper pipelines.
  final List<PipelineSummary>? pipelines;

  ListPipelinesResponse({
    this.nextToken,
    this.pipelines,
  });

  factory ListPipelinesResponse.fromJson(Map<String, dynamic> json) {
    return ListPipelinesResponse(
      nextToken: json['NextToken'] as String?,
      pipelines: (json['Pipelines'] as List?)
          ?.nonNulls
          .map((e) => PipelineSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final pipelines = this.pipelines;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (pipelines != null) 'Pipelines': pipelines,
    };
  }
}

class ListTagsForResourceResponse {
  /// A list of tags associated with the given pipeline.
  final List<Tag>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['Tags'] as List?)
          ?.nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'Tags': tags,
    };
  }
}

class PutResourcePolicyResponse {
  /// The resource-based policy document that was attached to the resource.
  final String? policy;

  /// The Amazon Resource Name (ARN) of the resource.
  final String? resourceArn;

  PutResourcePolicyResponse({
    this.policy,
    this.resourceArn,
  });

  factory PutResourcePolicyResponse.fromJson(Map<String, dynamic> json) {
    return PutResourcePolicyResponse(
      policy: json['Policy'] as String?,
      resourceArn: json['ResourceArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final policy = this.policy;
    final resourceArn = this.resourceArn;
    return {
      if (policy != null) 'Policy': policy,
      if (resourceArn != null) 'ResourceArn': resourceArn,
    };
  }
}

class RevokePipelineEndpointConnectionsResponse {
  /// The Amazon Resource Name (ARN) of the pipeline from which endpoint
  /// connections were revoked.
  final String? pipelineArn;

  RevokePipelineEndpointConnectionsResponse({
    this.pipelineArn,
  });

  factory RevokePipelineEndpointConnectionsResponse.fromJson(
      Map<String, dynamic> json) {
    return RevokePipelineEndpointConnectionsResponse(
      pipelineArn: json['PipelineArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final pipelineArn = this.pipelineArn;
    return {
      if (pipelineArn != null) 'PipelineArn': pipelineArn,
    };
  }
}

class StartPipelineResponse {
  final Pipeline? pipeline;

  StartPipelineResponse({
    this.pipeline,
  });

  factory StartPipelineResponse.fromJson(Map<String, dynamic> json) {
    return StartPipelineResponse(
      pipeline: json['Pipeline'] != null
          ? Pipeline.fromJson(json['Pipeline'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final pipeline = this.pipeline;
    return {
      if (pipeline != null) 'Pipeline': pipeline,
    };
  }
}

class StopPipelineResponse {
  final Pipeline? pipeline;

  StopPipelineResponse({
    this.pipeline,
  });

  factory StopPipelineResponse.fromJson(Map<String, dynamic> json) {
    return StopPipelineResponse(
      pipeline: json['Pipeline'] != null
          ? Pipeline.fromJson(json['Pipeline'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final pipeline = this.pipeline;
    return {
      if (pipeline != null) 'Pipeline': pipeline,
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

class UpdatePipelineResponse {
  /// Container for information about the updated pipeline.
  final Pipeline? pipeline;

  UpdatePipelineResponse({
    this.pipeline,
  });

  factory UpdatePipelineResponse.fromJson(Map<String, dynamic> json) {
    return UpdatePipelineResponse(
      pipeline: json['Pipeline'] != null
          ? Pipeline.fromJson(json['Pipeline'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final pipeline = this.pipeline;
    return {
      if (pipeline != null) 'Pipeline': pipeline,
    };
  }
}

class ValidatePipelineResponse {
  /// A list of errors if the configuration is invalid.
  final List<ValidationMessage>? errors;

  /// A boolean indicating whether or not the pipeline configuration is valid.
  final bool? isValid;

  ValidatePipelineResponse({
    this.errors,
    this.isValid,
  });

  factory ValidatePipelineResponse.fromJson(Map<String, dynamic> json) {
    return ValidatePipelineResponse(
      errors: (json['Errors'] as List?)
          ?.nonNulls
          .map((e) => ValidationMessage.fromJson(e as Map<String, dynamic>))
          .toList(),
      isValid: json['isValid'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    final isValid = this.isValid;
    return {
      if (errors != null) 'Errors': errors,
      if (isValid != null) 'isValid': isValid,
    };
  }
}

/// A validation message associated with a <code>ValidatePipeline</code> request
/// in OpenSearch Ingestion.
class ValidationMessage {
  /// The validation message.
  final String? message;

  ValidationMessage({
    this.message,
  });

  factory ValidationMessage.fromJson(Map<String, dynamic> json) {
    return ValidationMessage(
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

/// Information about an existing OpenSearch Ingestion pipeline.
class Pipeline {
  final BufferOptions? bufferOptions;

  /// The date and time when the pipeline was created.
  final DateTime? createdAt;

  /// Destinations to which the pipeline writes data.
  final List<PipelineDestination>? destinations;
  final EncryptionAtRestOptions? encryptionAtRestOptions;

  /// The ingestion endpoints for the pipeline, which you can send data to.
  final List<String>? ingestEndpointUrls;

  /// The date and time when the pipeline was last updated.
  final DateTime? lastUpdatedAt;

  /// Key-value pairs that represent log publishing settings.
  final LogPublishingOptions? logPublishingOptions;

  /// The maximum pipeline capacity, in Ingestion Compute Units (ICUs).
  final int? maxUnits;

  /// The minimum pipeline capacity, in Ingestion Compute Units (ICUs).
  final int? minUnits;

  /// The Amazon Resource Name (ARN) of the pipeline.
  final String? pipelineArn;

  /// The Data Prepper pipeline configuration in YAML format.
  final String? pipelineConfigurationBody;

  /// The name of the pipeline.
  final String? pipelineName;

  /// The Amazon Resource Name (ARN) of the IAM role that the pipeline uses to
  /// access AWS resources.
  final String? pipelineRoleArn;

  /// A list of VPC endpoints that OpenSearch Ingestion has created to other
  /// Amazon Web Services services.
  final List<ServiceVpcEndpoint>? serviceVpcEndpoints;

  /// The current status of the pipeline.
  final PipelineStatus? status;

  /// The reason for the current status of the pipeline.
  final PipelineStatusReason? statusReason;

  /// A list of tags associated with the given pipeline.
  final List<Tag>? tags;

  /// The VPC endpoint service name for the pipeline.
  final String? vpcEndpointService;

  /// The VPC interface endpoints that have access to the pipeline.
  final List<VpcEndpoint>? vpcEndpoints;

  Pipeline({
    this.bufferOptions,
    this.createdAt,
    this.destinations,
    this.encryptionAtRestOptions,
    this.ingestEndpointUrls,
    this.lastUpdatedAt,
    this.logPublishingOptions,
    this.maxUnits,
    this.minUnits,
    this.pipelineArn,
    this.pipelineConfigurationBody,
    this.pipelineName,
    this.pipelineRoleArn,
    this.serviceVpcEndpoints,
    this.status,
    this.statusReason,
    this.tags,
    this.vpcEndpointService,
    this.vpcEndpoints,
  });

  factory Pipeline.fromJson(Map<String, dynamic> json) {
    return Pipeline(
      bufferOptions: json['BufferOptions'] != null
          ? BufferOptions.fromJson(
              json['BufferOptions'] as Map<String, dynamic>)
          : null,
      createdAt: timeStampFromJson(json['CreatedAt']),
      destinations: (json['Destinations'] as List?)
          ?.nonNulls
          .map((e) => PipelineDestination.fromJson(e as Map<String, dynamic>))
          .toList(),
      encryptionAtRestOptions: json['EncryptionAtRestOptions'] != null
          ? EncryptionAtRestOptions.fromJson(
              json['EncryptionAtRestOptions'] as Map<String, dynamic>)
          : null,
      ingestEndpointUrls: (json['IngestEndpointUrls'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      lastUpdatedAt: timeStampFromJson(json['LastUpdatedAt']),
      logPublishingOptions: json['LogPublishingOptions'] != null
          ? LogPublishingOptions.fromJson(
              json['LogPublishingOptions'] as Map<String, dynamic>)
          : null,
      maxUnits: json['MaxUnits'] as int?,
      minUnits: json['MinUnits'] as int?,
      pipelineArn: json['PipelineArn'] as String?,
      pipelineConfigurationBody: json['PipelineConfigurationBody'] as String?,
      pipelineName: json['PipelineName'] as String?,
      pipelineRoleArn: json['PipelineRoleArn'] as String?,
      serviceVpcEndpoints: (json['ServiceVpcEndpoints'] as List?)
          ?.nonNulls
          .map((e) => ServiceVpcEndpoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: (json['Status'] as String?)?.let(PipelineStatus.fromString),
      statusReason: json['StatusReason'] != null
          ? PipelineStatusReason.fromJson(
              json['StatusReason'] as Map<String, dynamic>)
          : null,
      tags: (json['Tags'] as List?)
          ?.nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      vpcEndpointService: json['VpcEndpointService'] as String?,
      vpcEndpoints: (json['VpcEndpoints'] as List?)
          ?.nonNulls
          .map((e) => VpcEndpoint.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final bufferOptions = this.bufferOptions;
    final createdAt = this.createdAt;
    final destinations = this.destinations;
    final encryptionAtRestOptions = this.encryptionAtRestOptions;
    final ingestEndpointUrls = this.ingestEndpointUrls;
    final lastUpdatedAt = this.lastUpdatedAt;
    final logPublishingOptions = this.logPublishingOptions;
    final maxUnits = this.maxUnits;
    final minUnits = this.minUnits;
    final pipelineArn = this.pipelineArn;
    final pipelineConfigurationBody = this.pipelineConfigurationBody;
    final pipelineName = this.pipelineName;
    final pipelineRoleArn = this.pipelineRoleArn;
    final serviceVpcEndpoints = this.serviceVpcEndpoints;
    final status = this.status;
    final statusReason = this.statusReason;
    final tags = this.tags;
    final vpcEndpointService = this.vpcEndpointService;
    final vpcEndpoints = this.vpcEndpoints;
    return {
      if (bufferOptions != null) 'BufferOptions': bufferOptions,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (destinations != null) 'Destinations': destinations,
      if (encryptionAtRestOptions != null)
        'EncryptionAtRestOptions': encryptionAtRestOptions,
      if (ingestEndpointUrls != null) 'IngestEndpointUrls': ingestEndpointUrls,
      if (lastUpdatedAt != null)
        'LastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (logPublishingOptions != null)
        'LogPublishingOptions': logPublishingOptions,
      if (maxUnits != null) 'MaxUnits': maxUnits,
      if (minUnits != null) 'MinUnits': minUnits,
      if (pipelineArn != null) 'PipelineArn': pipelineArn,
      if (pipelineConfigurationBody != null)
        'PipelineConfigurationBody': pipelineConfigurationBody,
      if (pipelineName != null) 'PipelineName': pipelineName,
      if (pipelineRoleArn != null) 'PipelineRoleArn': pipelineRoleArn,
      if (serviceVpcEndpoints != null)
        'ServiceVpcEndpoints': serviceVpcEndpoints,
      if (status != null) 'Status': status.value,
      if (statusReason != null) 'StatusReason': statusReason,
      if (tags != null) 'Tags': tags,
      if (vpcEndpointService != null) 'VpcEndpointService': vpcEndpointService,
      if (vpcEndpoints != null) 'VpcEndpoints': vpcEndpoints,
    };
  }
}

class PipelineStatus {
  static const creating = PipelineStatus._('CREATING');
  static const active = PipelineStatus._('ACTIVE');
  static const updating = PipelineStatus._('UPDATING');
  static const deleting = PipelineStatus._('DELETING');
  static const createFailed = PipelineStatus._('CREATE_FAILED');
  static const updateFailed = PipelineStatus._('UPDATE_FAILED');
  static const starting = PipelineStatus._('STARTING');
  static const startFailed = PipelineStatus._('START_FAILED');
  static const stopping = PipelineStatus._('STOPPING');
  static const stopped = PipelineStatus._('STOPPED');

  final String value;

  const PipelineStatus._(this.value);

  static const values = [
    creating,
    active,
    updating,
    deleting,
    createFailed,
    updateFailed,
    starting,
    startFailed,
    stopping,
    stopped
  ];

  static PipelineStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PipelineStatus._(value));

  @override
  bool operator ==(other) => other is PipelineStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Information about a pipeline's current status.
class PipelineStatusReason {
  /// A description of why a pipeline has a certain status.
  final String? description;

  PipelineStatusReason({
    this.description,
  });

  factory PipelineStatusReason.fromJson(Map<String, dynamic> json) {
    return PipelineStatusReason(
      description: json['Description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    return {
      if (description != null) 'Description': description,
    };
  }
}

/// Container for the values required to configure logging for the pipeline. If
/// you don't specify these values, OpenSearch Ingestion will not publish logs
/// from your application to CloudWatch Logs.
class LogPublishingOptions {
  /// The destination for OpenSearch Ingestion logs sent to Amazon CloudWatch
  /// Logs. This parameter is required if <code>IsLoggingEnabled</code> is set to
  /// <code>true</code>.
  final CloudWatchLogDestination? cloudWatchLogDestination;

  /// Whether logs should be published.
  final bool? isLoggingEnabled;

  LogPublishingOptions({
    this.cloudWatchLogDestination,
    this.isLoggingEnabled,
  });

  factory LogPublishingOptions.fromJson(Map<String, dynamic> json) {
    return LogPublishingOptions(
      cloudWatchLogDestination: json['CloudWatchLogDestination'] != null
          ? CloudWatchLogDestination.fromJson(
              json['CloudWatchLogDestination'] as Map<String, dynamic>)
          : null,
      isLoggingEnabled: json['IsLoggingEnabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final cloudWatchLogDestination = this.cloudWatchLogDestination;
    final isLoggingEnabled = this.isLoggingEnabled;
    return {
      if (cloudWatchLogDestination != null)
        'CloudWatchLogDestination': cloudWatchLogDestination,
      if (isLoggingEnabled != null) 'IsLoggingEnabled': isLoggingEnabled,
    };
  }
}

/// Options that specify the configuration of a persistent buffer. To configure
/// how OpenSearch Ingestion encrypts this data, set the
/// <code>EncryptionAtRestOptions</code>. For more information, see <a
/// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/osis-features-overview.html#persistent-buffering">Persistent
/// buffering</a>.
class BufferOptions {
  /// Whether persistent buffering should be enabled.
  final bool persistentBufferEnabled;

  BufferOptions({
    required this.persistentBufferEnabled,
  });

  factory BufferOptions.fromJson(Map<String, dynamic> json) {
    return BufferOptions(
      persistentBufferEnabled:
          (json['PersistentBufferEnabled'] as bool?) ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    final persistentBufferEnabled = this.persistentBufferEnabled;
    return {
      'PersistentBufferEnabled': persistentBufferEnabled,
    };
  }
}

/// Options to control how OpenSearch encrypts buffer data.
class EncryptionAtRestOptions {
  /// The ARN of the KMS key used to encrypt buffer data. By default, data is
  /// encrypted using an Amazon Web Services owned key.
  final String kmsKeyArn;

  EncryptionAtRestOptions({
    required this.kmsKeyArn,
  });

  factory EncryptionAtRestOptions.fromJson(Map<String, dynamic> json) {
    return EncryptionAtRestOptions(
      kmsKeyArn: (json['KmsKeyArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final kmsKeyArn = this.kmsKeyArn;
    return {
      'KmsKeyArn': kmsKeyArn,
    };
  }
}

/// A tag (key-value pair) for an OpenSearch Ingestion pipeline.
class Tag {
  /// The tag key. Tag keys must be unique for the pipeline to which they are
  /// attached.
  final String key;

  /// The value assigned to the corresponding tag key. Tag values can be null and
  /// don't have to be unique in a tag set. For example, you can have a key value
  /// pair in a tag set of <code>project : Trinity</code> and <code>cost-center :
  /// Trinity</code>
  final String value;

  Tag({
    required this.key,
    required this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: (json['Key'] as String?) ?? '',
      value: (json['Value'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'Key': key,
      'Value': value,
    };
  }
}

/// An object representing the destination of a pipeline.
class PipelineDestination {
  /// The endpoint receiving data from the pipeline.
  final String? endpoint;

  /// The name of the service receiving data from the pipeline.
  final String? serviceName;

  PipelineDestination({
    this.endpoint,
    this.serviceName,
  });

  factory PipelineDestination.fromJson(Map<String, dynamic> json) {
    return PipelineDestination(
      endpoint: json['Endpoint'] as String?,
      serviceName: json['ServiceName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final endpoint = this.endpoint;
    final serviceName = this.serviceName;
    return {
      if (endpoint != null) 'Endpoint': endpoint,
      if (serviceName != null) 'ServiceName': serviceName,
    };
  }
}

/// A container for information about VPC endpoints that were created to other
/// services
class ServiceVpcEndpoint {
  /// The name of the service for which a VPC endpoint was created.
  final VpcEndpointServiceName? serviceName;

  /// The unique identifier of the VPC endpoint that was created.
  final String? vpcEndpointId;

  ServiceVpcEndpoint({
    this.serviceName,
    this.vpcEndpointId,
  });

  factory ServiceVpcEndpoint.fromJson(Map<String, dynamic> json) {
    return ServiceVpcEndpoint(
      serviceName: (json['ServiceName'] as String?)
          ?.let(VpcEndpointServiceName.fromString),
      vpcEndpointId: json['VpcEndpointId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final serviceName = this.serviceName;
    final vpcEndpointId = this.vpcEndpointId;
    return {
      if (serviceName != null) 'ServiceName': serviceName.value,
      if (vpcEndpointId != null) 'VpcEndpointId': vpcEndpointId,
    };
  }
}

class VpcEndpointServiceName {
  static const opensearchServerless =
      VpcEndpointServiceName._('OPENSEARCH_SERVERLESS');

  final String value;

  const VpcEndpointServiceName._(this.value);

  static const values = [opensearchServerless];

  static VpcEndpointServiceName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => VpcEndpointServiceName._(value));

  @override
  bool operator ==(other) =>
      other is VpcEndpointServiceName && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An OpenSearch Ingestion-managed VPC endpoint that will access one or more
/// pipelines.
class VpcEndpoint {
  /// The unique identifier of the endpoint.
  final String? vpcEndpointId;

  /// The ID for your VPC. Amazon Web Services PrivateLink generates this value
  /// when you create a VPC.
  final String? vpcId;

  /// Information about the VPC, including associated subnets and security groups.
  final VpcOptions? vpcOptions;

  VpcEndpoint({
    this.vpcEndpointId,
    this.vpcId,
    this.vpcOptions,
  });

  factory VpcEndpoint.fromJson(Map<String, dynamic> json) {
    return VpcEndpoint(
      vpcEndpointId: json['VpcEndpointId'] as String?,
      vpcId: json['VpcId'] as String?,
      vpcOptions: json['VpcOptions'] != null
          ? VpcOptions.fromJson(json['VpcOptions'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final vpcEndpointId = this.vpcEndpointId;
    final vpcId = this.vpcId;
    final vpcOptions = this.vpcOptions;
    return {
      if (vpcEndpointId != null) 'VpcEndpointId': vpcEndpointId,
      if (vpcId != null) 'VpcId': vpcId,
      if (vpcOptions != null) 'VpcOptions': vpcOptions,
    };
  }
}

/// Options that specify the subnets and security groups for an OpenSearch
/// Ingestion VPC endpoint.
class VpcOptions {
  /// A list of subnet IDs associated with the VPC endpoint.
  final List<String> subnetIds;

  /// A list of security groups associated with the VPC endpoint.
  final List<String>? securityGroupIds;

  /// Options for attaching a VPC to a pipeline.
  final VpcAttachmentOptions? vpcAttachmentOptions;

  /// Defines whether you or Amazon OpenSearch Ingestion service create and manage
  /// the VPC endpoint configured for the pipeline.
  final VpcEndpointManagement? vpcEndpointManagement;

  VpcOptions({
    required this.subnetIds,
    this.securityGroupIds,
    this.vpcAttachmentOptions,
    this.vpcEndpointManagement,
  });

  factory VpcOptions.fromJson(Map<String, dynamic> json) {
    return VpcOptions(
      subnetIds: ((json['SubnetIds'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      securityGroupIds: (json['SecurityGroupIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      vpcAttachmentOptions: json['VpcAttachmentOptions'] != null
          ? VpcAttachmentOptions.fromJson(
              json['VpcAttachmentOptions'] as Map<String, dynamic>)
          : null,
      vpcEndpointManagement: (json['VpcEndpointManagement'] as String?)
          ?.let(VpcEndpointManagement.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final subnetIds = this.subnetIds;
    final securityGroupIds = this.securityGroupIds;
    final vpcAttachmentOptions = this.vpcAttachmentOptions;
    final vpcEndpointManagement = this.vpcEndpointManagement;
    return {
      'SubnetIds': subnetIds,
      if (securityGroupIds != null) 'SecurityGroupIds': securityGroupIds,
      if (vpcAttachmentOptions != null)
        'VpcAttachmentOptions': vpcAttachmentOptions,
      if (vpcEndpointManagement != null)
        'VpcEndpointManagement': vpcEndpointManagement.value,
    };
  }
}

/// Options for attaching a VPC to pipeline.
class VpcAttachmentOptions {
  /// Whether a VPC is attached to the pipeline.
  final bool attachToVpc;

  /// The CIDR block to be reserved for OpenSearch Ingestion to create elastic
  /// network interfaces (ENIs).
  final String? cidrBlock;

  VpcAttachmentOptions({
    required this.attachToVpc,
    this.cidrBlock,
  });

  factory VpcAttachmentOptions.fromJson(Map<String, dynamic> json) {
    return VpcAttachmentOptions(
      attachToVpc: (json['AttachToVpc'] as bool?) ?? false,
      cidrBlock: json['CidrBlock'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attachToVpc = this.attachToVpc;
    final cidrBlock = this.cidrBlock;
    return {
      'AttachToVpc': attachToVpc,
      if (cidrBlock != null) 'CidrBlock': cidrBlock,
    };
  }
}

class VpcEndpointManagement {
  static const customer = VpcEndpointManagement._('CUSTOMER');
  static const service = VpcEndpointManagement._('SERVICE');

  final String value;

  const VpcEndpointManagement._(this.value);

  static const values = [customer, service];

  static VpcEndpointManagement fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => VpcEndpointManagement._(value));

  @override
  bool operator ==(other) =>
      other is VpcEndpointManagement && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The destination for OpenSearch Ingestion logs sent to Amazon CloudWatch.
class CloudWatchLogDestination {
  /// The name of the CloudWatch Logs group to send pipeline logs to. You can
  /// specify an existing log group or create a new one. For example,
  /// <code>/aws/vendedlogs/OpenSearchService/pipelines</code>.
  final String logGroup;

  CloudWatchLogDestination({
    required this.logGroup,
  });

  factory CloudWatchLogDestination.fromJson(Map<String, dynamic> json) {
    return CloudWatchLogDestination(
      logGroup: (json['LogGroup'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final logGroup = this.logGroup;
    return {
      'LogGroup': logGroup,
    };
  }
}

/// Summary information for an OpenSearch Ingestion pipeline.
class PipelineSummary {
  /// The date and time when the pipeline was created.
  final DateTime? createdAt;

  /// A list of destinations to which the pipeline writes data.
  final List<PipelineDestination>? destinations;

  /// The date and time when the pipeline was last updated.
  final DateTime? lastUpdatedAt;

  /// The maximum pipeline capacity, in Ingestion Compute Units (ICUs).
  final int? maxUnits;

  /// The minimum pipeline capacity, in Ingestion Compute Units (ICUs).
  final int? minUnits;

  /// The Amazon Resource Name (ARN) of the pipeline.
  final String? pipelineArn;

  /// The name of the pipeline.
  final String? pipelineName;

  /// The current status of the pipeline.
  final PipelineStatus? status;
  final PipelineStatusReason? statusReason;

  /// A list of tags associated with the given pipeline.
  final List<Tag>? tags;

  PipelineSummary({
    this.createdAt,
    this.destinations,
    this.lastUpdatedAt,
    this.maxUnits,
    this.minUnits,
    this.pipelineArn,
    this.pipelineName,
    this.status,
    this.statusReason,
    this.tags,
  });

  factory PipelineSummary.fromJson(Map<String, dynamic> json) {
    return PipelineSummary(
      createdAt: timeStampFromJson(json['CreatedAt']),
      destinations: (json['Destinations'] as List?)
          ?.nonNulls
          .map((e) => PipelineDestination.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastUpdatedAt: timeStampFromJson(json['LastUpdatedAt']),
      maxUnits: json['MaxUnits'] as int?,
      minUnits: json['MinUnits'] as int?,
      pipelineArn: json['PipelineArn'] as String?,
      pipelineName: json['PipelineName'] as String?,
      status: (json['Status'] as String?)?.let(PipelineStatus.fromString),
      statusReason: json['StatusReason'] != null
          ? PipelineStatusReason.fromJson(
              json['StatusReason'] as Map<String, dynamic>)
          : null,
      tags: (json['Tags'] as List?)
          ?.nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final destinations = this.destinations;
    final lastUpdatedAt = this.lastUpdatedAt;
    final maxUnits = this.maxUnits;
    final minUnits = this.minUnits;
    final pipelineArn = this.pipelineArn;
    final pipelineName = this.pipelineName;
    final status = this.status;
    final statusReason = this.statusReason;
    final tags = this.tags;
    return {
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (destinations != null) 'Destinations': destinations,
      if (lastUpdatedAt != null)
        'LastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (maxUnits != null) 'MaxUnits': maxUnits,
      if (minUnits != null) 'MinUnits': minUnits,
      if (pipelineArn != null) 'PipelineArn': pipelineArn,
      if (pipelineName != null) 'PipelineName': pipelineName,
      if (status != null) 'Status': status.value,
      if (statusReason != null) 'StatusReason': statusReason,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// Represents a VPC endpoint for an OpenSearch Ingestion pipeline, enabling
/// private connectivity between your VPC and the pipeline.
class PipelineEndpoint {
  /// The unique identifier for the pipeline endpoint.
  final String? endpointId;

  /// The URL used to ingest data to the pipeline through the VPC endpoint.
  final String? ingestEndpointUrl;

  /// The Amazon Resource Name (ARN) of the pipeline associated with this
  /// endpoint.
  final String? pipelineArn;

  /// The current status of the pipeline endpoint.
  final PipelineEndpointStatus? status;

  /// The ID of the VPC where the pipeline endpoint is created.
  final String? vpcId;

  /// Configuration options for the VPC endpoint, including subnet and security
  /// group settings.
  final PipelineEndpointVpcOptions? vpcOptions;

  PipelineEndpoint({
    this.endpointId,
    this.ingestEndpointUrl,
    this.pipelineArn,
    this.status,
    this.vpcId,
    this.vpcOptions,
  });

  factory PipelineEndpoint.fromJson(Map<String, dynamic> json) {
    return PipelineEndpoint(
      endpointId: json['EndpointId'] as String?,
      ingestEndpointUrl: json['IngestEndpointUrl'] as String?,
      pipelineArn: json['PipelineArn'] as String?,
      status:
          (json['Status'] as String?)?.let(PipelineEndpointStatus.fromString),
      vpcId: json['VpcId'] as String?,
      vpcOptions: json['VpcOptions'] != null
          ? PipelineEndpointVpcOptions.fromJson(
              json['VpcOptions'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final endpointId = this.endpointId;
    final ingestEndpointUrl = this.ingestEndpointUrl;
    final pipelineArn = this.pipelineArn;
    final status = this.status;
    final vpcId = this.vpcId;
    final vpcOptions = this.vpcOptions;
    return {
      if (endpointId != null) 'EndpointId': endpointId,
      if (ingestEndpointUrl != null) 'IngestEndpointUrl': ingestEndpointUrl,
      if (pipelineArn != null) 'PipelineArn': pipelineArn,
      if (status != null) 'Status': status.value,
      if (vpcId != null) 'VpcId': vpcId,
      if (vpcOptions != null) 'VpcOptions': vpcOptions,
    };
  }
}

class PipelineEndpointStatus {
  static const creating = PipelineEndpointStatus._('CREATING');
  static const active = PipelineEndpointStatus._('ACTIVE');
  static const createFailed = PipelineEndpointStatus._('CREATE_FAILED');
  static const deleting = PipelineEndpointStatus._('DELETING');
  static const revoking = PipelineEndpointStatus._('REVOKING');
  static const revoked = PipelineEndpointStatus._('REVOKED');

  final String value;

  const PipelineEndpointStatus._(this.value);

  static const values = [
    creating,
    active,
    createFailed,
    deleting,
    revoking,
    revoked
  ];

  static PipelineEndpointStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PipelineEndpointStatus._(value));

  @override
  bool operator ==(other) =>
      other is PipelineEndpointStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Configuration settings for the VPC endpoint, specifying network access
/// controls.
class PipelineEndpointVpcOptions {
  /// A list of security group IDs that control network access to the pipeline
  /// endpoint.
  final List<String>? securityGroupIds;

  /// A list of subnet IDs where the pipeline endpoint network interfaces are
  /// created.
  final List<String>? subnetIds;

  PipelineEndpointVpcOptions({
    this.securityGroupIds,
    this.subnetIds,
  });

  factory PipelineEndpointVpcOptions.fromJson(Map<String, dynamic> json) {
    return PipelineEndpointVpcOptions(
      securityGroupIds: (json['SecurityGroupIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      subnetIds: (json['SubnetIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final securityGroupIds = this.securityGroupIds;
    final subnetIds = this.subnetIds;
    return {
      if (securityGroupIds != null) 'SecurityGroupIds': securityGroupIds,
      if (subnetIds != null) 'SubnetIds': subnetIds,
    };
  }
}

/// Represents a connection to a pipeline endpoint, containing details about the
/// endpoint association.
class PipelineEndpointConnection {
  /// The unique identifier of the endpoint in the connection.
  final String? endpointId;

  /// The Amazon Resource Name (ARN) of the pipeline in the endpoint connection.
  final String? pipelineArn;

  /// The current status of the pipeline endpoint connection.
  final PipelineEndpointStatus? status;

  /// The Amazon Web Services account ID that owns the VPC endpoint used in this
  /// connection.
  final String? vpcEndpointOwner;

  PipelineEndpointConnection({
    this.endpointId,
    this.pipelineArn,
    this.status,
    this.vpcEndpointOwner,
  });

  factory PipelineEndpointConnection.fromJson(Map<String, dynamic> json) {
    return PipelineEndpointConnection(
      endpointId: json['EndpointId'] as String?,
      pipelineArn: json['PipelineArn'] as String?,
      status:
          (json['Status'] as String?)?.let(PipelineEndpointStatus.fromString),
      vpcEndpointOwner: json['VpcEndpointOwner'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final endpointId = this.endpointId;
    final pipelineArn = this.pipelineArn;
    final status = this.status;
    final vpcEndpointOwner = this.vpcEndpointOwner;
    return {
      if (endpointId != null) 'EndpointId': endpointId,
      if (pipelineArn != null) 'PipelineArn': pipelineArn,
      if (status != null) 'Status': status.value,
      if (vpcEndpointOwner != null) 'VpcEndpointOwner': vpcEndpointOwner,
    };
  }
}

/// A summary of an OpenSearch Ingestion blueprint.
class PipelineBlueprintSummary {
  /// The name of the blueprint.
  final String? blueprintName;

  /// A description of the blueprint.
  final String? displayDescription;

  /// The display name of the blueprint.
  final String? displayName;

  /// The name of the service that the blueprint is associated with.
  final String? service;

  /// The use case that the blueprint relates to.
  final String? useCase;

  PipelineBlueprintSummary({
    this.blueprintName,
    this.displayDescription,
    this.displayName,
    this.service,
    this.useCase,
  });

  factory PipelineBlueprintSummary.fromJson(Map<String, dynamic> json) {
    return PipelineBlueprintSummary(
      blueprintName: json['BlueprintName'] as String?,
      displayDescription: json['DisplayDescription'] as String?,
      displayName: json['DisplayName'] as String?,
      service: json['Service'] as String?,
      useCase: json['UseCase'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final blueprintName = this.blueprintName;
    final displayDescription = this.displayDescription;
    final displayName = this.displayName;
    final service = this.service;
    final useCase = this.useCase;
    return {
      if (blueprintName != null) 'BlueprintName': blueprintName,
      if (displayDescription != null) 'DisplayDescription': displayDescription,
      if (displayName != null) 'DisplayName': displayName,
      if (service != null) 'Service': service,
      if (useCase != null) 'UseCase': useCase,
    };
  }
}

/// The progress details of a pipeline configuration change.
class ChangeProgressStatus {
  /// Information about the stages that the pipeline is going through to perform
  /// the configuration change.
  final List<ChangeProgressStage>? changeProgressStages;

  /// The time at which the configuration change is made on the pipeline.
  final DateTime? startTime;

  /// The overall status of the pipeline configuration change.
  final ChangeProgressStatuses? status;

  /// The total number of stages required for the pipeline configuration change.
  final int? totalNumberOfStages;

  ChangeProgressStatus({
    this.changeProgressStages,
    this.startTime,
    this.status,
    this.totalNumberOfStages,
  });

  factory ChangeProgressStatus.fromJson(Map<String, dynamic> json) {
    return ChangeProgressStatus(
      changeProgressStages: (json['ChangeProgressStages'] as List?)
          ?.nonNulls
          .map((e) => ChangeProgressStage.fromJson(e as Map<String, dynamic>))
          .toList(),
      startTime: timeStampFromJson(json['StartTime']),
      status:
          (json['Status'] as String?)?.let(ChangeProgressStatuses.fromString),
      totalNumberOfStages: json['TotalNumberOfStages'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final changeProgressStages = this.changeProgressStages;
    final startTime = this.startTime;
    final status = this.status;
    final totalNumberOfStages = this.totalNumberOfStages;
    return {
      if (changeProgressStages != null)
        'ChangeProgressStages': changeProgressStages,
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      if (status != null) 'Status': status.value,
      if (totalNumberOfStages != null)
        'TotalNumberOfStages': totalNumberOfStages,
    };
  }
}

class ChangeProgressStatuses {
  static const pending = ChangeProgressStatuses._('PENDING');
  static const inProgress = ChangeProgressStatuses._('IN_PROGRESS');
  static const completed = ChangeProgressStatuses._('COMPLETED');
  static const failed = ChangeProgressStatuses._('FAILED');

  final String value;

  const ChangeProgressStatuses._(this.value);

  static const values = [pending, inProgress, completed, failed];

  static ChangeProgressStatuses fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ChangeProgressStatuses._(value));

  @override
  bool operator ==(other) =>
      other is ChangeProgressStatuses && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Progress details for a specific stage of a pipeline configuration change.
class ChangeProgressStage {
  /// A description of the stage.
  final String? description;

  /// The most recent updated timestamp of the stage.
  final DateTime? lastUpdatedAt;

  /// The name of the stage.
  final String? name;

  /// The current status of the stage that the change is in.
  final ChangeProgressStageStatuses? status;

  ChangeProgressStage({
    this.description,
    this.lastUpdatedAt,
    this.name,
    this.status,
  });

  factory ChangeProgressStage.fromJson(Map<String, dynamic> json) {
    return ChangeProgressStage(
      description: json['Description'] as String?,
      lastUpdatedAt: timeStampFromJson(json['LastUpdatedAt']),
      name: json['Name'] as String?,
      status: (json['Status'] as String?)
          ?.let(ChangeProgressStageStatuses.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final lastUpdatedAt = this.lastUpdatedAt;
    final name = this.name;
    final status = this.status;
    return {
      if (description != null) 'Description': description,
      if (lastUpdatedAt != null)
        'LastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (name != null) 'Name': name,
      if (status != null) 'Status': status.value,
    };
  }
}

class ChangeProgressStageStatuses {
  static const pending = ChangeProgressStageStatuses._('PENDING');
  static const inProgress = ChangeProgressStageStatuses._('IN_PROGRESS');
  static const completed = ChangeProgressStageStatuses._('COMPLETED');
  static const failed = ChangeProgressStageStatuses._('FAILED');

  final String value;

  const ChangeProgressStageStatuses._(this.value);

  static const values = [pending, inProgress, completed, failed];

  static ChangeProgressStageStatuses fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ChangeProgressStageStatuses._(value));

  @override
  bool operator ==(other) =>
      other is ChangeProgressStageStatuses && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Container for information about an OpenSearch Ingestion blueprint.
class PipelineBlueprint {
  /// The name of the blueprint.
  final String? blueprintName;

  /// A description of the blueprint.
  final String? displayDescription;

  /// The display name of the blueprint.
  final String? displayName;

  /// The YAML configuration of the blueprint.
  final String? pipelineConfigurationBody;

  /// The name of the service that the blueprint is associated with.
  final String? service;

  /// The use case that the blueprint relates to.
  final String? useCase;

  PipelineBlueprint({
    this.blueprintName,
    this.displayDescription,
    this.displayName,
    this.pipelineConfigurationBody,
    this.service,
    this.useCase,
  });

  factory PipelineBlueprint.fromJson(Map<String, dynamic> json) {
    return PipelineBlueprint(
      blueprintName: json['BlueprintName'] as String?,
      displayDescription: json['DisplayDescription'] as String?,
      displayName: json['DisplayName'] as String?,
      pipelineConfigurationBody: json['PipelineConfigurationBody'] as String?,
      service: json['Service'] as String?,
      useCase: json['UseCase'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final blueprintName = this.blueprintName;
    final displayDescription = this.displayDescription;
    final displayName = this.displayName;
    final pipelineConfigurationBody = this.pipelineConfigurationBody;
    final service = this.service;
    final useCase = this.useCase;
    return {
      if (blueprintName != null) 'BlueprintName': blueprintName,
      if (displayDescription != null) 'DisplayDescription': displayDescription,
      if (displayName != null) 'DisplayName': displayName,
      if (pipelineConfigurationBody != null)
        'PipelineConfigurationBody': pipelineConfigurationBody,
      if (service != null) 'Service': service,
      if (useCase != null) 'UseCase': useCase,
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

class DisabledOperationException extends _s.GenericAwsException {
  DisabledOperationException({String? type, String? message})
      : super(type: type, code: 'DisabledOperationException', message: message);
}

class InternalException extends _s.GenericAwsException {
  InternalException({String? type, String? message})
      : super(type: type, code: 'InternalException', message: message);
}

class InvalidPaginationTokenException extends _s.GenericAwsException {
  InvalidPaginationTokenException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidPaginationTokenException',
            message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
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

class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'DisabledOperationException': (type, message) =>
      DisabledOperationException(type: type, message: message),
  'InternalException': (type, message) =>
      InternalException(type: type, message: message),
  'InvalidPaginationTokenException': (type, message) =>
      InvalidPaginationTokenException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'ResourceAlreadyExistsException': (type, message) =>
      ResourceAlreadyExistsException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
