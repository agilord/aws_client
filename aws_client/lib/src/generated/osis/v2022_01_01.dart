// ignore_for_file: deprecated_member_use_from_same_package
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
class OpenSearchIngestion {
  final _s.RestJsonProtocol _protocol;
  OpenSearchIngestion({
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
  /// May throw [DisabledOperationException].
  /// May throw [LimitExceededException].
  /// May throw [ValidationException].
  /// May throw [InternalException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ResourceNotFoundException].
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

  /// Deletes an OpenSearch Ingestion pipeline. For more information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/delete-pipeline.html">Deleting
  /// Amazon OpenSearch Ingestion pipelines</a>.
  ///
  /// May throw [DisabledOperationException].
  /// May throw [ValidationException].
  /// May throw [InternalException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
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

  /// Retrieves information about an OpenSearch Ingestion pipeline.
  ///
  /// May throw [DisabledOperationException].
  /// May throw [ValidationException].
  /// May throw [InternalException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
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
  /// May throw [DisabledOperationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
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
  /// May throw [DisabledOperationException].
  /// May throw [ValidationException].
  /// May throw [InternalException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
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

  /// Retrieves a list of all available blueprints for Data Prepper. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/creating-pipeline.html#pipeline-blueprint">Using
  /// blueprints to create a pipeline</a>.
  ///
  /// May throw [DisabledOperationException].
  /// May throw [ValidationException].
  /// May throw [InternalException].
  /// May throw [AccessDeniedException].
  /// May throw [InvalidPaginationTokenException].
  Future<ListPipelineBlueprintsResponse> listPipelineBlueprints() async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/2022-01-01/osis/listPipelineBlueprints',
      exceptionFnMap: _exceptionFns,
    );
    return ListPipelineBlueprintsResponse.fromJson(response);
  }

  /// Lists all OpenSearch Ingestion pipelines in the current Amazon Web
  /// Services account and Region. For more information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/list-pipeline.html">Viewing
  /// Amazon OpenSearch Ingestion pipelines</a>.
  ///
  /// May throw [DisabledOperationException].
  /// May throw [ValidationException].
  /// May throw [InternalException].
  /// May throw [AccessDeniedException].
  /// May throw [InvalidPaginationTokenException].
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
  /// May throw [DisabledOperationException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalException].
  /// May throw [AccessDeniedException].
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
      requestUri: '/2022-01-01/osis/listTagsForResource/',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Starts an OpenSearch Ingestion pipeline. For more information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/pipeline--stop-start.html#pipeline--start">Starting
  /// an OpenSearch Ingestion pipeline</a>.
  ///
  /// May throw [DisabledOperationException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
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
  /// May throw [DisabledOperationException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
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
  /// May throw [DisabledOperationException].
  /// May throw [LimitExceededException].
  /// May throw [ValidationException].
  /// May throw [InternalException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
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
      requestUri: '/2022-01-01/osis/tagResource/',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes one or more tags from an OpenSearch Ingestion pipeline. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/tag-pipeline.html">Tagging
  /// Amazon OpenSearch Ingestion pipelines</a>.
  ///
  /// May throw [DisabledOperationException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalException].
  /// May throw [AccessDeniedException].
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
      requestUri: '/2022-01-01/osis/untagResource/',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates an OpenSearch Ingestion pipeline. For more information, see <a
  /// href="https://docs.aws.amazon.com/opensearch-service/latest/developerguide/update-pipeline.html">Updating
  /// Amazon OpenSearch Ingestion pipelines</a>.
  ///
  /// May throw [DisabledOperationException].
  /// May throw [ValidationException].
  /// May throw [InternalException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
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
  Future<UpdatePipelineResponse> updatePipeline({
    required String pipelineName,
    BufferOptions? bufferOptions,
    EncryptionAtRestOptions? encryptionAtRestOptions,
    LogPublishingOptions? logPublishingOptions,
    int? maxUnits,
    int? minUnits,
    String? pipelineConfigurationBody,
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
  /// May throw [DisabledOperationException].
  /// May throw [AccessDeniedException].
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
      persistentBufferEnabled: json['PersistentBufferEnabled'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    final persistentBufferEnabled = this.persistentBufferEnabled;
    return {
      'PersistentBufferEnabled': persistentBufferEnabled,
    };
  }
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
      status: (json['Status'] as String?)?.toChangeProgressStageStatuses(),
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
      if (status != null) 'Status': status.toValue(),
    };
  }
}

enum ChangeProgressStageStatuses {
  pending,
  inProgress,
  completed,
  failed,
}

extension ChangeProgressStageStatusesValueExtension
    on ChangeProgressStageStatuses {
  String toValue() {
    switch (this) {
      case ChangeProgressStageStatuses.pending:
        return 'PENDING';
      case ChangeProgressStageStatuses.inProgress:
        return 'IN_PROGRESS';
      case ChangeProgressStageStatuses.completed:
        return 'COMPLETED';
      case ChangeProgressStageStatuses.failed:
        return 'FAILED';
    }
  }
}

extension ChangeProgressStageStatusesFromString on String {
  ChangeProgressStageStatuses toChangeProgressStageStatuses() {
    switch (this) {
      case 'PENDING':
        return ChangeProgressStageStatuses.pending;
      case 'IN_PROGRESS':
        return ChangeProgressStageStatuses.inProgress;
      case 'COMPLETED':
        return ChangeProgressStageStatuses.completed;
      case 'FAILED':
        return ChangeProgressStageStatuses.failed;
    }
    throw Exception('$this is not known in enum ChangeProgressStageStatuses');
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
          ?.whereNotNull()
          .map((e) => ChangeProgressStage.fromJson(e as Map<String, dynamic>))
          .toList(),
      startTime: timeStampFromJson(json['StartTime']),
      status: (json['Status'] as String?)?.toChangeProgressStatuses(),
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
      if (status != null) 'Status': status.toValue(),
      if (totalNumberOfStages != null)
        'TotalNumberOfStages': totalNumberOfStages,
    };
  }
}

enum ChangeProgressStatuses {
  pending,
  inProgress,
  completed,
  failed,
}

extension ChangeProgressStatusesValueExtension on ChangeProgressStatuses {
  String toValue() {
    switch (this) {
      case ChangeProgressStatuses.pending:
        return 'PENDING';
      case ChangeProgressStatuses.inProgress:
        return 'IN_PROGRESS';
      case ChangeProgressStatuses.completed:
        return 'COMPLETED';
      case ChangeProgressStatuses.failed:
        return 'FAILED';
    }
  }
}

extension ChangeProgressStatusesFromString on String {
  ChangeProgressStatuses toChangeProgressStatuses() {
    switch (this) {
      case 'PENDING':
        return ChangeProgressStatuses.pending;
      case 'IN_PROGRESS':
        return ChangeProgressStatuses.inProgress;
      case 'COMPLETED':
        return ChangeProgressStatuses.completed;
      case 'FAILED':
        return ChangeProgressStatuses.failed;
    }
    throw Exception('$this is not known in enum ChangeProgressStatuses');
  }
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
      logGroup: json['LogGroup'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final logGroup = this.logGroup;
    return {
      'LogGroup': logGroup,
    };
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

class DeletePipelineResponse {
  DeletePipelineResponse();

  factory DeletePipelineResponse.fromJson(Map<String, dynamic> _) {
    return DeletePipelineResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
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
      kmsKeyArn: json['KmsKeyArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final kmsKeyArn = this.kmsKeyArn;
    return {
      'KmsKeyArn': kmsKeyArn,
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
          ?.whereNotNull()
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

class ListPipelineBlueprintsResponse {
  /// A list of available blueprints for Data Prepper.
  final List<PipelineBlueprintSummary>? blueprints;

  ListPipelineBlueprintsResponse({
    this.blueprints,
  });

  factory ListPipelineBlueprintsResponse.fromJson(Map<String, dynamic> json) {
    return ListPipelineBlueprintsResponse(
      blueprints: (json['Blueprints'] as List?)
          ?.whereNotNull()
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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

  /// A list of VPC endpoints that OpenSearch Ingestion has created to other
  /// Amazon Web Services services.
  final List<ServiceVpcEndpoint>? serviceVpcEndpoints;

  /// The current status of the pipeline.
  final PipelineStatus? status;

  /// The reason for the current status of the pipeline.
  final PipelineStatusReason? statusReason;

  /// A list of tags associated with the given pipeline.
  final List<Tag>? tags;

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
    this.serviceVpcEndpoints,
    this.status,
    this.statusReason,
    this.tags,
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
          ?.whereNotNull()
          .map((e) => PipelineDestination.fromJson(e as Map<String, dynamic>))
          .toList(),
      encryptionAtRestOptions: json['EncryptionAtRestOptions'] != null
          ? EncryptionAtRestOptions.fromJson(
              json['EncryptionAtRestOptions'] as Map<String, dynamic>)
          : null,
      ingestEndpointUrls: (json['IngestEndpointUrls'] as List?)
          ?.whereNotNull()
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
      serviceVpcEndpoints: (json['ServiceVpcEndpoints'] as List?)
          ?.whereNotNull()
          .map((e) => ServiceVpcEndpoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: (json['Status'] as String?)?.toPipelineStatus(),
      statusReason: json['StatusReason'] != null
          ? PipelineStatusReason.fromJson(
              json['StatusReason'] as Map<String, dynamic>)
          : null,
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      vpcEndpoints: (json['VpcEndpoints'] as List?)
          ?.whereNotNull()
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
    final serviceVpcEndpoints = this.serviceVpcEndpoints;
    final status = this.status;
    final statusReason = this.statusReason;
    final tags = this.tags;
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
      if (serviceVpcEndpoints != null)
        'ServiceVpcEndpoints': serviceVpcEndpoints,
      if (status != null) 'Status': status.toValue(),
      if (statusReason != null) 'StatusReason': statusReason,
      if (tags != null) 'Tags': tags,
      if (vpcEndpoints != null) 'VpcEndpoints': vpcEndpoints,
    };
  }
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

enum PipelineStatus {
  creating,
  active,
  updating,
  deleting,
  createFailed,
  updateFailed,
  starting,
  startFailed,
  stopping,
  stopped,
}

extension PipelineStatusValueExtension on PipelineStatus {
  String toValue() {
    switch (this) {
      case PipelineStatus.creating:
        return 'CREATING';
      case PipelineStatus.active:
        return 'ACTIVE';
      case PipelineStatus.updating:
        return 'UPDATING';
      case PipelineStatus.deleting:
        return 'DELETING';
      case PipelineStatus.createFailed:
        return 'CREATE_FAILED';
      case PipelineStatus.updateFailed:
        return 'UPDATE_FAILED';
      case PipelineStatus.starting:
        return 'STARTING';
      case PipelineStatus.startFailed:
        return 'START_FAILED';
      case PipelineStatus.stopping:
        return 'STOPPING';
      case PipelineStatus.stopped:
        return 'STOPPED';
    }
  }
}

extension PipelineStatusFromString on String {
  PipelineStatus toPipelineStatus() {
    switch (this) {
      case 'CREATING':
        return PipelineStatus.creating;
      case 'ACTIVE':
        return PipelineStatus.active;
      case 'UPDATING':
        return PipelineStatus.updating;
      case 'DELETING':
        return PipelineStatus.deleting;
      case 'CREATE_FAILED':
        return PipelineStatus.createFailed;
      case 'UPDATE_FAILED':
        return PipelineStatus.updateFailed;
      case 'STARTING':
        return PipelineStatus.starting;
      case 'START_FAILED':
        return PipelineStatus.startFailed;
      case 'STOPPING':
        return PipelineStatus.stopping;
      case 'STOPPED':
        return PipelineStatus.stopped;
    }
    throw Exception('$this is not known in enum PipelineStatus');
  }
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
          ?.whereNotNull()
          .map((e) => PipelineDestination.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastUpdatedAt: timeStampFromJson(json['LastUpdatedAt']),
      maxUnits: json['MaxUnits'] as int?,
      minUnits: json['MinUnits'] as int?,
      pipelineArn: json['PipelineArn'] as String?,
      pipelineName: json['PipelineName'] as String?,
      status: (json['Status'] as String?)?.toPipelineStatus(),
      statusReason: json['StatusReason'] != null
          ? PipelineStatusReason.fromJson(
              json['StatusReason'] as Map<String, dynamic>)
          : null,
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
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
      if (status != null) 'Status': status.toValue(),
      if (statusReason != null) 'StatusReason': statusReason,
      if (tags != null) 'Tags': tags,
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
      serviceName: (json['ServiceName'] as String?)?.toVpcEndpointServiceName(),
      vpcEndpointId: json['VpcEndpointId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final serviceName = this.serviceName;
    final vpcEndpointId = this.vpcEndpointId;
    return {
      if (serviceName != null) 'ServiceName': serviceName.toValue(),
      if (vpcEndpointId != null) 'VpcEndpointId': vpcEndpointId,
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
      key: json['Key'] as String,
      value: json['Value'] as String,
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
          ?.whereNotNull()
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
      attachToVpc: json['AttachToVpc'] as bool,
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

enum VpcEndpointServiceName {
  opensearchServerless,
}

extension VpcEndpointServiceNameValueExtension on VpcEndpointServiceName {
  String toValue() {
    switch (this) {
      case VpcEndpointServiceName.opensearchServerless:
        return 'OPENSEARCH_SERVERLESS';
    }
  }
}

extension VpcEndpointServiceNameFromString on String {
  VpcEndpointServiceName toVpcEndpointServiceName() {
    switch (this) {
      case 'OPENSEARCH_SERVERLESS':
        return VpcEndpointServiceName.opensearchServerless;
    }
    throw Exception('$this is not known in enum VpcEndpointServiceName');
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

  VpcOptions({
    required this.subnetIds,
    this.securityGroupIds,
    this.vpcAttachmentOptions,
  });

  factory VpcOptions.fromJson(Map<String, dynamic> json) {
    return VpcOptions(
      subnetIds: (json['SubnetIds'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      securityGroupIds: (json['SecurityGroupIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      vpcAttachmentOptions: json['VpcAttachmentOptions'] != null
          ? VpcAttachmentOptions.fromJson(
              json['VpcAttachmentOptions'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final subnetIds = this.subnetIds;
    final securityGroupIds = this.securityGroupIds;
    final vpcAttachmentOptions = this.vpcAttachmentOptions;
    return {
      'SubnetIds': subnetIds,
      if (securityGroupIds != null) 'SecurityGroupIds': securityGroupIds,
      if (vpcAttachmentOptions != null)
        'VpcAttachmentOptions': vpcAttachmentOptions,
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
