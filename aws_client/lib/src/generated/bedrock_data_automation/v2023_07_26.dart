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

/// Amazon Bedrock Data Automation BuildTime
class BedrockDataAutomation {
  final _s.RestJsonProtocol _protocol;
  BedrockDataAutomation({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'bedrock-data-automation',
            signingName: 'bedrock',
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

  /// Copies a Blueprint from one stage to another
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [blueprintArn] :
  /// Blueprint to be copied
  ///
  /// Parameter [sourceStage] :
  /// Source stage to copy from
  ///
  /// Parameter [targetStage] :
  /// Target stage to copy to
  ///
  /// Parameter [clientToken] :
  /// Client token for idempotency
  Future<void> copyBlueprintStage({
    required String blueprintArn,
    required BlueprintStage sourceStage,
    required BlueprintStage targetStage,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'sourceStage': sourceStage.value,
      'targetStage': targetStage.value,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/blueprints/${Uri.encodeComponent(blueprintArn)}/copy-stage',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates a new version of an existing Amazon Bedrock Data Automation
  /// Blueprint
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [blueprintArn] :
  /// ARN generated at the server side when a Blueprint is created
  Future<CreateBlueprintVersionResponse> createBlueprintVersion({
    required String blueprintArn,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/blueprints/${Uri.encodeComponent(blueprintArn)}/versions/',
      exceptionFnMap: _exceptionFns,
    );
    return CreateBlueprintVersionResponse.fromJson(response);
  }

  /// Gets an existing entity based on entity type from the library
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [entityId] :
  /// Unique identifier for the entity
  ///
  /// Parameter [entityType] :
  /// The entity type for which the entity is requested
  ///
  /// Parameter [libraryArn] :
  /// ARN generated at the server side when a DataAutomationLibrary is created
  Future<GetDataAutomationLibraryEntityResponse>
      getDataAutomationLibraryEntity({
    required String entityId,
    required EntityType entityType,
    required String libraryArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/data-automation-libraries/${Uri.encodeComponent(libraryArn)}/entityType/${Uri.encodeComponent(entityType.value)}/entities/${Uri.encodeComponent(entityId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetDataAutomationLibraryEntityResponse.fromJson(response);
  }

  /// Lists all stored entities in the library
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [entityType] :
  /// The entity type for which the entity list is requested
  ///
  /// Parameter [libraryArn] :
  /// ARN generated at the server side when a DataAutomationLibrary is created
  ///
  /// Parameter [nextToken] :
  /// Pagination token for retrieving the next set of results
  Future<ListDataAutomationLibraryEntitiesResponse>
      listDataAutomationLibraryEntities({
    required EntityType entityType,
    required String libraryArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/data-automation-libraries/${Uri.encodeComponent(libraryArn)}/entityType/${Uri.encodeComponent(entityType.value)}/entities/',
      exceptionFnMap: _exceptionFns,
    );
    return ListDataAutomationLibraryEntitiesResponse.fromJson(response);
  }

  /// List tags for an Amazon Bedrock Data Automation resource
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceARN,
  }) async {
    final $payload = <String, dynamic>{
      'resourceARN': resourceARN,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/listTagsForResource',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Tag an Amazon Bedrock Data Automation resource
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  Future<void> tagResource({
    required String resourceARN,
    required List<Tag> tags,
  }) async {
    final $payload = <String, dynamic>{
      'resourceARN': resourceARN,
      'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tagResource',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Untag an Amazon Bedrock Data Automation resource
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  Future<void> untagResource({
    required String resourceARN,
    required List<String> tagKeys,
  }) async {
    final $payload = <String, dynamic>{
      'resourceARN': resourceARN,
      'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/untagResource',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Invoke an async job to perform Blueprint Optimization
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [blueprint] :
  /// Blueprint to be optimized
  ///
  /// Parameter [dataAutomationProfileArn] :
  /// Data automation profile ARN
  ///
  /// Parameter [outputConfiguration] :
  /// Output configuration where the results should be placed
  ///
  /// Parameter [samples] :
  /// List of Blueprint Optimization Samples
  ///
  /// Parameter [encryptionConfiguration] :
  /// Encryption configuration.
  ///
  /// Parameter [tags] :
  /// List of tags.
  Future<InvokeBlueprintOptimizationAsyncResponse>
      invokeBlueprintOptimizationAsync({
    required BlueprintOptimizationObject blueprint,
    required String dataAutomationProfileArn,
    required BlueprintOptimizationOutputConfiguration outputConfiguration,
    required List<BlueprintOptimizationSample> samples,
    EncryptionConfiguration? encryptionConfiguration,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'blueprint': blueprint,
      'dataAutomationProfileArn': dataAutomationProfileArn,
      'outputConfiguration': outputConfiguration,
      'samples': samples,
      if (encryptionConfiguration != null)
        'encryptionConfiguration': encryptionConfiguration,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/invokeBlueprintOptimizationAsync',
      exceptionFnMap: _exceptionFns,
    );
    return InvokeBlueprintOptimizationAsyncResponse.fromJson(response);
  }

  /// API used to get blueprint optimization status.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [invocationArn] :
  /// Invocation arn.
  Future<GetBlueprintOptimizationStatusResponse>
      getBlueprintOptimizationStatus({
    required String invocationArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/getBlueprintOptimizationStatus/${Uri.encodeComponent(invocationArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetBlueprintOptimizationStatusResponse.fromJson(response);
  }

  /// Creates an Amazon Bedrock Data Automation Blueprint
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  Future<CreateBlueprintResponse> createBlueprint({
    required String blueprintName,
    required String schema,
    required Type type,
    BlueprintStage? blueprintStage,
    String? clientToken,
    EncryptionConfiguration? encryptionConfiguration,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'blueprintName': blueprintName,
      'schema': schema,
      'type': type.value,
      if (blueprintStage != null) 'blueprintStage': blueprintStage.value,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (encryptionConfiguration != null)
        'encryptionConfiguration': encryptionConfiguration,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/blueprints/',
      exceptionFnMap: _exceptionFns,
    );
    return CreateBlueprintResponse.fromJson(response);
  }

  /// Gets an existing Amazon Bedrock Data Automation Blueprint
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [blueprintArn] :
  /// ARN generated at the server side when a Blueprint is created
  ///
  /// Parameter [blueprintStage] :
  /// Optional field to get a specific Blueprint stage
  ///
  /// Parameter [blueprintVersion] :
  /// Optional field to get a specific Blueprint version
  Future<GetBlueprintResponse> getBlueprint({
    required String blueprintArn,
    BlueprintStage? blueprintStage,
    String? blueprintVersion,
  }) async {
    final $payload = <String, dynamic>{
      if (blueprintStage != null) 'blueprintStage': blueprintStage.value,
      if (blueprintVersion != null) 'blueprintVersion': blueprintVersion,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/blueprints/${Uri.encodeComponent(blueprintArn)}/',
      exceptionFnMap: _exceptionFns,
    );
    return GetBlueprintResponse.fromJson(response);
  }

  /// Updates an existing Amazon Bedrock Data Automation Blueprint
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [blueprintArn] :
  /// ARN generated at the server side when a Blueprint is created
  Future<UpdateBlueprintResponse> updateBlueprint({
    required String blueprintArn,
    required String schema,
    BlueprintStage? blueprintStage,
    EncryptionConfiguration? encryptionConfiguration,
  }) async {
    final $payload = <String, dynamic>{
      'schema': schema,
      if (blueprintStage != null) 'blueprintStage': blueprintStage.value,
      if (encryptionConfiguration != null)
        'encryptionConfiguration': encryptionConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/blueprints/${Uri.encodeComponent(blueprintArn)}/',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateBlueprintResponse.fromJson(response);
  }

  /// Deletes an existing Amazon Bedrock Data Automation Blueprint
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [blueprintArn] :
  /// ARN generated at the server side when a Blueprint is created
  ///
  /// Parameter [blueprintVersion] :
  /// Optional field to delete a specific Blueprint version
  Future<void> deleteBlueprint({
    required String blueprintArn,
    String? blueprintVersion,
  }) async {
    final $query = <String, List<String>>{
      if (blueprintVersion != null) 'blueprintVersion': [blueprintVersion],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/blueprints/${Uri.encodeComponent(blueprintArn)}/',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists all existing Amazon Bedrock Data Automation Blueprints
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  Future<ListBlueprintsResponse> listBlueprints({
    String? blueprintArn,
    BlueprintStageFilter? blueprintStageFilter,
    int? maxResults,
    String? nextToken,
    DataAutomationProjectFilter? projectFilter,
    ResourceOwner? resourceOwner,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      if (blueprintArn != null) 'blueprintArn': blueprintArn,
      if (blueprintStageFilter != null)
        'blueprintStageFilter': blueprintStageFilter.value,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (projectFilter != null) 'projectFilter': projectFilter,
      if (resourceOwner != null) 'resourceOwner': resourceOwner.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/blueprints/',
      exceptionFnMap: _exceptionFns,
    );
    return ListBlueprintsResponse.fromJson(response);
  }

  /// Async API: Invoke data automation library ingestion job
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [entityType] :
  /// The entity type for which DataAutomationLibraryIngestionJob is being run
  ///
  /// Parameter [inputConfiguration] :
  /// Input configuration of DataAutomationLibraryIngestionJob request
  ///
  /// Parameter [libraryArn] :
  /// ARN generated at the server side when a DataAutomationLibrary is created
  ///
  /// Parameter [operationType] :
  /// The operation to be performed by DataAutomationLibraryIngestionJob
  ///
  /// Parameter [outputConfiguration] :
  /// Output configuration of DataAutomationLibraryIngestionJob
  ///
  /// Parameter [clientToken] :
  /// Idempotency token
  ///
  /// Parameter [notificationConfiguration] :
  /// Notification configuration.
  ///
  /// Parameter [tags] :
  /// List of tags
  Future<InvokeDataAutomationLibraryIngestionJobResponse>
      invokeDataAutomationLibraryIngestionJob({
    required EntityType entityType,
    required InputConfiguration inputConfiguration,
    required String libraryArn,
    required LibraryIngestionJobOperationType operationType,
    required OutputConfiguration outputConfiguration,
    String? clientToken,
    NotificationConfiguration? notificationConfiguration,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'entityType': entityType.value,
      'inputConfiguration': inputConfiguration,
      'operationType': operationType.value,
      'outputConfiguration': outputConfiguration,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (notificationConfiguration != null)
        'notificationConfiguration': notificationConfiguration,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/data-automation-libraries/${Uri.encodeComponent(libraryArn)}/library-ingestion-jobs/',
      exceptionFnMap: _exceptionFns,
    );
    return InvokeDataAutomationLibraryIngestionJobResponse.fromJson(response);
  }

  /// API used to get status of data automation library ingestion job
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [jobArn] :
  /// ARN of the DataAutomationLibraryIngestionJob
  ///
  /// Parameter [libraryArn] :
  /// ARN generated at the server side when a DataAutomationLibrary is created
  Future<GetDataAutomationLibraryIngestionJobResponse>
      getDataAutomationLibraryIngestionJob({
    required String jobArn,
    required String libraryArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/data-automation-libraries/${Uri.encodeComponent(libraryArn)}/library-ingestion-jobs/${Uri.encodeComponent(jobArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetDataAutomationLibraryIngestionJobResponse.fromJson(response);
  }

  /// Lists all data automation library ingestion jobs
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [libraryArn] :
  /// ARN generated at the server side when a DataAutomationLibrary is created
  ///
  /// Parameter [nextToken] :
  /// Pagination token for retrieving the next set of results
  Future<ListDataAutomationLibraryIngestionJobsResponse>
      listDataAutomationLibraryIngestionJobs({
    required String libraryArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/data-automation-libraries/${Uri.encodeComponent(libraryArn)}/library-ingestion-jobs/',
      exceptionFnMap: _exceptionFns,
    );
    return ListDataAutomationLibraryIngestionJobsResponse.fromJson(response);
  }

  /// Creates an Amazon Bedrock Data Automation Library
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  Future<CreateDataAutomationLibraryResponse> createDataAutomationLibrary({
    required String libraryName,
    String? clientToken,
    EncryptionConfiguration? encryptionConfiguration,
    String? libraryDescription,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'libraryName': libraryName,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (encryptionConfiguration != null)
        'encryptionConfiguration': encryptionConfiguration,
      if (libraryDescription != null) 'libraryDescription': libraryDescription,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/data-automation-libraries/',
      exceptionFnMap: _exceptionFns,
    );
    return CreateDataAutomationLibraryResponse.fromJson(response);
  }

  /// Gets an existing Amazon Bedrock Data Automation Library
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [libraryArn] :
  /// ARN generated at the server side when a DataAutomationLibrary is created
  Future<GetDataAutomationLibraryResponse> getDataAutomationLibrary({
    required String libraryArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/data-automation-libraries/${Uri.encodeComponent(libraryArn)}/',
      exceptionFnMap: _exceptionFns,
    );
    return GetDataAutomationLibraryResponse.fromJson(response);
  }

  /// Updates an existing Amazon Bedrock Data Automation Library
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [libraryArn] :
  /// ARN generated at the server side when a DataAutomationLibrary is created
  Future<UpdateDataAutomationLibraryResponse> updateDataAutomationLibrary({
    required String libraryArn,
    String? clientToken,
    String? libraryDescription,
  }) async {
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (libraryDescription != null) 'libraryDescription': libraryDescription,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/data-automation-libraries/${Uri.encodeComponent(libraryArn)}/',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateDataAutomationLibraryResponse.fromJson(response);
  }

  /// Deletes an existing Amazon Bedrock Data Automation Library
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [libraryArn] :
  /// ARN generated at the server side when a DataAutomationLibrary is created
  Future<DeleteDataAutomationLibraryResponse> deleteDataAutomationLibrary({
    required String libraryArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/data-automation-libraries/${Uri.encodeComponent(libraryArn)}/',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteDataAutomationLibraryResponse.fromJson(response);
  }

  /// Lists all existing Amazon Bedrock Data Automation Libraries
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  Future<ListDataAutomationLibrariesResponse> listDataAutomationLibraries({
    int? maxResults,
    String? nextToken,
    DataAutomationProjectFilter? projectFilter,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (projectFilter != null) 'projectFilter': projectFilter,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/data-automation-libraries/',
      exceptionFnMap: _exceptionFns,
    );
    return ListDataAutomationLibrariesResponse.fromJson(response);
  }

  /// Creates an Amazon Bedrock Data Automation Project
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  Future<CreateDataAutomationProjectResponse> createDataAutomationProject({
    required String projectName,
    required StandardOutputConfiguration standardOutputConfiguration,
    String? clientToken,
    CustomOutputConfiguration? customOutputConfiguration,
    DataAutomationLibraryConfiguration? dataAutomationLibraryConfiguration,
    EncryptionConfiguration? encryptionConfiguration,
    OverrideConfiguration? overrideConfiguration,
    String? projectDescription,
    DataAutomationProjectStage? projectStage,
    DataAutomationProjectType? projectType,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'projectName': projectName,
      'standardOutputConfiguration': standardOutputConfiguration,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (customOutputConfiguration != null)
        'customOutputConfiguration': customOutputConfiguration,
      if (dataAutomationLibraryConfiguration != null)
        'dataAutomationLibraryConfiguration':
            dataAutomationLibraryConfiguration,
      if (encryptionConfiguration != null)
        'encryptionConfiguration': encryptionConfiguration,
      if (overrideConfiguration != null)
        'overrideConfiguration': overrideConfiguration,
      if (projectDescription != null) 'projectDescription': projectDescription,
      if (projectStage != null) 'projectStage': projectStage.value,
      if (projectType != null) 'projectType': projectType.value,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/data-automation-projects/',
      exceptionFnMap: _exceptionFns,
    );
    return CreateDataAutomationProjectResponse.fromJson(response);
  }

  /// Gets an existing Amazon Bedrock Data Automation Project
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [projectArn] :
  /// ARN generated at the server side when a DataAutomationProject is created
  ///
  /// Parameter [projectStage] :
  /// Optional field to delete a specific DataAutomationProject stage
  Future<GetDataAutomationProjectResponse> getDataAutomationProject({
    required String projectArn,
    DataAutomationProjectStage? projectStage,
  }) async {
    final $payload = <String, dynamic>{
      if (projectStage != null) 'projectStage': projectStage.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/data-automation-projects/${Uri.encodeComponent(projectArn)}/',
      exceptionFnMap: _exceptionFns,
    );
    return GetDataAutomationProjectResponse.fromJson(response);
  }

  /// Updates an existing Amazon Bedrock Data Automation Project
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [projectArn] :
  /// ARN generated at the server side when a DataAutomationProject is created
  Future<UpdateDataAutomationProjectResponse> updateDataAutomationProject({
    required String projectArn,
    required StandardOutputConfiguration standardOutputConfiguration,
    CustomOutputConfiguration? customOutputConfiguration,
    DataAutomationLibraryConfiguration? dataAutomationLibraryConfiguration,
    EncryptionConfiguration? encryptionConfiguration,
    OverrideConfiguration? overrideConfiguration,
    String? projectDescription,
    DataAutomationProjectStage? projectStage,
  }) async {
    final $payload = <String, dynamic>{
      'standardOutputConfiguration': standardOutputConfiguration,
      if (customOutputConfiguration != null)
        'customOutputConfiguration': customOutputConfiguration,
      if (dataAutomationLibraryConfiguration != null)
        'dataAutomationLibraryConfiguration':
            dataAutomationLibraryConfiguration,
      if (encryptionConfiguration != null)
        'encryptionConfiguration': encryptionConfiguration,
      if (overrideConfiguration != null)
        'overrideConfiguration': overrideConfiguration,
      if (projectDescription != null) 'projectDescription': projectDescription,
      if (projectStage != null) 'projectStage': projectStage.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/data-automation-projects/${Uri.encodeComponent(projectArn)}/',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateDataAutomationProjectResponse.fromJson(response);
  }

  /// Deletes an existing Amazon Bedrock Data Automation Project
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [projectArn] :
  /// ARN generated at the server side when a DataAutomationProject is created
  Future<DeleteDataAutomationProjectResponse> deleteDataAutomationProject({
    required String projectArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/data-automation-projects/${Uri.encodeComponent(projectArn)}/',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteDataAutomationProjectResponse.fromJson(response);
  }

  /// Lists all existing Amazon Bedrock Data Automation Projects
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  Future<ListDataAutomationProjectsResponse> listDataAutomationProjects({
    BlueprintFilter? blueprintFilter,
    DataAutomationLibraryFilter? libraryFilter,
    int? maxResults,
    String? nextToken,
    DataAutomationProjectStageFilter? projectStageFilter,
    ResourceOwner? resourceOwner,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      if (blueprintFilter != null) 'blueprintFilter': blueprintFilter,
      if (libraryFilter != null) 'libraryFilter': libraryFilter,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (projectStageFilter != null)
        'projectStageFilter': projectStageFilter.value,
      if (resourceOwner != null) 'resourceOwner': resourceOwner.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/data-automation-projects/',
      exceptionFnMap: _exceptionFns,
    );
    return ListDataAutomationProjectsResponse.fromJson(response);
  }
}

/// CopyBlueprintStage Response
class CopyBlueprintStageResponse {
  CopyBlueprintStageResponse();

  factory CopyBlueprintStageResponse.fromJson(Map<String, dynamic> _) {
    return CopyBlueprintStageResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Create Blueprint Version Response
class CreateBlueprintVersionResponse {
  final Blueprint blueprint;

  CreateBlueprintVersionResponse({
    required this.blueprint,
  });

  factory CreateBlueprintVersionResponse.fromJson(Map<String, dynamic> json) {
    return CreateBlueprintVersionResponse(
      blueprint: Blueprint.fromJson(
          (json['blueprint'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final blueprint = this.blueprint;
    return {
      'blueprint': blueprint,
    };
  }
}

/// Get DataAutomationLibraryEntity Response
class GetDataAutomationLibraryEntityResponse {
  /// Detailed information about the entity
  final EntityDetails? entity;

  GetDataAutomationLibraryEntityResponse({
    this.entity,
  });

  factory GetDataAutomationLibraryEntityResponse.fromJson(
      Map<String, dynamic> json) {
    return GetDataAutomationLibraryEntityResponse(
      entity: json['entity'] != null
          ? EntityDetails.fromJson(json['entity'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final entity = this.entity;
    return {
      if (entity != null) 'entity': entity,
    };
  }
}

/// List DataAutomationLibraryEntities Response
class ListDataAutomationLibraryEntitiesResponse {
  /// List of entities
  final List<DataAutomationLibraryEntitySummary>? entities;

  /// Pagination token for retrieving the next set of results
  final String? nextToken;

  ListDataAutomationLibraryEntitiesResponse({
    this.entities,
    this.nextToken,
  });

  factory ListDataAutomationLibraryEntitiesResponse.fromJson(
      Map<String, dynamic> json) {
    return ListDataAutomationLibraryEntitiesResponse(
      entities: (json['entities'] as List?)
          ?.nonNulls
          .map((e) => DataAutomationLibraryEntitySummary.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final entities = this.entities;
    final nextToken = this.nextToken;
    return {
      if (entities != null) 'entities': entities,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListTagsForResourceResponse {
  final List<Tag>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['tags'] as List?)
          ?.nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'tags': tags,
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

/// Invoke Blueprint Optimization Async Response
class InvokeBlueprintOptimizationAsyncResponse {
  /// ARN of the blueprint optimization job
  final String invocationArn;

  InvokeBlueprintOptimizationAsyncResponse({
    required this.invocationArn,
  });

  factory InvokeBlueprintOptimizationAsyncResponse.fromJson(
      Map<String, dynamic> json) {
    return InvokeBlueprintOptimizationAsyncResponse(
      invocationArn: (json['invocationArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final invocationArn = this.invocationArn;
    return {
      'invocationArn': invocationArn,
    };
  }
}

/// Response of GetBlueprintOptimizationStatus API.
class GetBlueprintOptimizationStatusResponse {
  /// Error Message.
  final String? errorMessage;

  /// Error Type.
  final String? errorType;

  /// Output configuration.
  final BlueprintOptimizationOutputConfiguration? outputConfiguration;

  /// Job Status.
  final BlueprintOptimizationJobStatus? status;

  GetBlueprintOptimizationStatusResponse({
    this.errorMessage,
    this.errorType,
    this.outputConfiguration,
    this.status,
  });

  factory GetBlueprintOptimizationStatusResponse.fromJson(
      Map<String, dynamic> json) {
    return GetBlueprintOptimizationStatusResponse(
      errorMessage: json['errorMessage'] as String?,
      errorType: json['errorType'] as String?,
      outputConfiguration: json['outputConfiguration'] != null
          ? BlueprintOptimizationOutputConfiguration.fromJson(
              json['outputConfiguration'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)
          ?.let(BlueprintOptimizationJobStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final errorMessage = this.errorMessage;
    final errorType = this.errorType;
    final outputConfiguration = this.outputConfiguration;
    final status = this.status;
    return {
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (errorType != null) 'errorType': errorType,
      if (outputConfiguration != null)
        'outputConfiguration': outputConfiguration,
      if (status != null) 'status': status.value,
    };
  }
}

/// Create Blueprint Response
class CreateBlueprintResponse {
  final Blueprint blueprint;

  CreateBlueprintResponse({
    required this.blueprint,
  });

  factory CreateBlueprintResponse.fromJson(Map<String, dynamic> json) {
    return CreateBlueprintResponse(
      blueprint: Blueprint.fromJson(
          (json['blueprint'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final blueprint = this.blueprint;
    return {
      'blueprint': blueprint,
    };
  }
}

/// Get Blueprint Response
class GetBlueprintResponse {
  final Blueprint blueprint;

  GetBlueprintResponse({
    required this.blueprint,
  });

  factory GetBlueprintResponse.fromJson(Map<String, dynamic> json) {
    return GetBlueprintResponse(
      blueprint: Blueprint.fromJson(
          (json['blueprint'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final blueprint = this.blueprint;
    return {
      'blueprint': blueprint,
    };
  }
}

/// Update Blueprint Response
class UpdateBlueprintResponse {
  final Blueprint blueprint;

  UpdateBlueprintResponse({
    required this.blueprint,
  });

  factory UpdateBlueprintResponse.fromJson(Map<String, dynamic> json) {
    return UpdateBlueprintResponse(
      blueprint: Blueprint.fromJson(
          (json['blueprint'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final blueprint = this.blueprint;
    return {
      'blueprint': blueprint,
    };
  }
}

/// Delete Blueprint Response
class DeleteBlueprintResponse {
  DeleteBlueprintResponse();

  factory DeleteBlueprintResponse.fromJson(Map<String, dynamic> _) {
    return DeleteBlueprintResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// List Blueprint Response
class ListBlueprintsResponse {
  final List<BlueprintSummary> blueprints;
  final String? nextToken;

  ListBlueprintsResponse({
    required this.blueprints,
    this.nextToken,
  });

  factory ListBlueprintsResponse.fromJson(Map<String, dynamic> json) {
    return ListBlueprintsResponse(
      blueprints: ((json['blueprints'] as List?) ?? const [])
          .nonNulls
          .map((e) => BlueprintSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final blueprints = this.blueprints;
    final nextToken = this.nextToken;
    return {
      'blueprints': blueprints,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Invoke DataAutomationLibraryIngestionJob Response
class InvokeDataAutomationLibraryIngestionJobResponse {
  /// ARN of the DataAutomationLibraryIngestionJob
  final String? jobArn;

  InvokeDataAutomationLibraryIngestionJobResponse({
    this.jobArn,
  });

  factory InvokeDataAutomationLibraryIngestionJobResponse.fromJson(
      Map<String, dynamic> json) {
    return InvokeDataAutomationLibraryIngestionJobResponse(
      jobArn: json['jobArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobArn = this.jobArn;
    return {
      if (jobArn != null) 'jobArn': jobArn,
    };
  }
}

/// Get DataAutomationLibraryIngestionJob Response
class GetDataAutomationLibraryIngestionJobResponse {
  /// Contains the information of a library ingestion job
  final DataAutomationLibraryIngestionJob? job;

  GetDataAutomationLibraryIngestionJobResponse({
    this.job,
  });

  factory GetDataAutomationLibraryIngestionJobResponse.fromJson(
      Map<String, dynamic> json) {
    return GetDataAutomationLibraryIngestionJobResponse(
      job: json['job'] != null
          ? DataAutomationLibraryIngestionJob.fromJson(
              json['job'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final job = this.job;
    return {
      if (job != null) 'job': job,
    };
  }
}

/// List DataAutomationLibraryIngestionJobs Response
class ListDataAutomationLibraryIngestionJobsResponse {
  /// List of data automation library ingestion jobs
  final List<DataAutomationLibraryIngestionJobSummary>? jobs;

  /// Pagination token for retrieving the next set of results
  final String? nextToken;

  ListDataAutomationLibraryIngestionJobsResponse({
    this.jobs,
    this.nextToken,
  });

  factory ListDataAutomationLibraryIngestionJobsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListDataAutomationLibraryIngestionJobsResponse(
      jobs: (json['jobs'] as List?)
          ?.nonNulls
          .map((e) => DataAutomationLibraryIngestionJobSummary.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobs = this.jobs;
    final nextToken = this.nextToken;
    return {
      if (jobs != null) 'jobs': jobs,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Create DataAutomationLibrary Response
class CreateDataAutomationLibraryResponse {
  final String? libraryArn;
  final DataAutomationLibraryStatus? status;

  CreateDataAutomationLibraryResponse({
    this.libraryArn,
    this.status,
  });

  factory CreateDataAutomationLibraryResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateDataAutomationLibraryResponse(
      libraryArn: json['libraryArn'] as String?,
      status: (json['status'] as String?)
          ?.let(DataAutomationLibraryStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final libraryArn = this.libraryArn;
    final status = this.status;
    return {
      if (libraryArn != null) 'libraryArn': libraryArn,
      if (status != null) 'status': status.value,
    };
  }
}

/// Get DataAutomationLibrary Response
class GetDataAutomationLibraryResponse {
  final DataAutomationLibrary? library;

  GetDataAutomationLibraryResponse({
    this.library,
  });

  factory GetDataAutomationLibraryResponse.fromJson(Map<String, dynamic> json) {
    return GetDataAutomationLibraryResponse(
      library: json['library'] != null
          ? DataAutomationLibrary.fromJson(
              json['library'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final library = this.library;
    return {
      if (library != null) 'library': library,
    };
  }
}

/// Update DataAutomationLibrary Response
class UpdateDataAutomationLibraryResponse {
  final String? libraryArn;
  final DataAutomationLibraryStatus? status;

  UpdateDataAutomationLibraryResponse({
    this.libraryArn,
    this.status,
  });

  factory UpdateDataAutomationLibraryResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateDataAutomationLibraryResponse(
      libraryArn: json['libraryArn'] as String?,
      status: (json['status'] as String?)
          ?.let(DataAutomationLibraryStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final libraryArn = this.libraryArn;
    final status = this.status;
    return {
      if (libraryArn != null) 'libraryArn': libraryArn,
      if (status != null) 'status': status.value,
    };
  }
}

/// Delete DataAutomationLibrary Response
class DeleteDataAutomationLibraryResponse {
  final String? libraryArn;
  final DataAutomationLibraryStatus? status;

  DeleteDataAutomationLibraryResponse({
    this.libraryArn,
    this.status,
  });

  factory DeleteDataAutomationLibraryResponse.fromJson(
      Map<String, dynamic> json) {
    return DeleteDataAutomationLibraryResponse(
      libraryArn: json['libraryArn'] as String?,
      status: (json['status'] as String?)
          ?.let(DataAutomationLibraryStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final libraryArn = this.libraryArn;
    final status = this.status;
    return {
      if (libraryArn != null) 'libraryArn': libraryArn,
      if (status != null) 'status': status.value,
    };
  }
}

/// List DataAutomationLibraries Response
class ListDataAutomationLibrariesResponse {
  final List<DataAutomationLibrarySummary>? libraries;
  final String? nextToken;

  ListDataAutomationLibrariesResponse({
    this.libraries,
    this.nextToken,
  });

  factory ListDataAutomationLibrariesResponse.fromJson(
      Map<String, dynamic> json) {
    return ListDataAutomationLibrariesResponse(
      libraries: (json['libraries'] as List?)
          ?.nonNulls
          .map((e) =>
              DataAutomationLibrarySummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final libraries = this.libraries;
    final nextToken = this.nextToken;
    return {
      if (libraries != null) 'libraries': libraries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Create DataAutomationProject Response
class CreateDataAutomationProjectResponse {
  final String projectArn;
  final DataAutomationProjectStage? projectStage;
  final DataAutomationProjectStatus? status;

  CreateDataAutomationProjectResponse({
    required this.projectArn,
    this.projectStage,
    this.status,
  });

  factory CreateDataAutomationProjectResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateDataAutomationProjectResponse(
      projectArn: (json['projectArn'] as String?) ?? '',
      projectStage: (json['projectStage'] as String?)
          ?.let(DataAutomationProjectStage.fromString),
      status: (json['status'] as String?)
          ?.let(DataAutomationProjectStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final projectArn = this.projectArn;
    final projectStage = this.projectStage;
    final status = this.status;
    return {
      'projectArn': projectArn,
      if (projectStage != null) 'projectStage': projectStage.value,
      if (status != null) 'status': status.value,
    };
  }
}

/// Get DataAutomationProject Response
class GetDataAutomationProjectResponse {
  final DataAutomationProject project;

  GetDataAutomationProjectResponse({
    required this.project,
  });

  factory GetDataAutomationProjectResponse.fromJson(Map<String, dynamic> json) {
    return GetDataAutomationProjectResponse(
      project: DataAutomationProject.fromJson(
          (json['project'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final project = this.project;
    return {
      'project': project,
    };
  }
}

/// Update DataAutomationProject Response
class UpdateDataAutomationProjectResponse {
  final String projectArn;
  final DataAutomationProjectStage? projectStage;
  final DataAutomationProjectStatus? status;

  UpdateDataAutomationProjectResponse({
    required this.projectArn,
    this.projectStage,
    this.status,
  });

  factory UpdateDataAutomationProjectResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateDataAutomationProjectResponse(
      projectArn: (json['projectArn'] as String?) ?? '',
      projectStage: (json['projectStage'] as String?)
          ?.let(DataAutomationProjectStage.fromString),
      status: (json['status'] as String?)
          ?.let(DataAutomationProjectStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final projectArn = this.projectArn;
    final projectStage = this.projectStage;
    final status = this.status;
    return {
      'projectArn': projectArn,
      if (projectStage != null) 'projectStage': projectStage.value,
      if (status != null) 'status': status.value,
    };
  }
}

/// Delete DataAutomationProject Response
class DeleteDataAutomationProjectResponse {
  final String projectArn;
  final DataAutomationProjectStatus? status;

  DeleteDataAutomationProjectResponse({
    required this.projectArn,
    this.status,
  });

  factory DeleteDataAutomationProjectResponse.fromJson(
      Map<String, dynamic> json) {
    return DeleteDataAutomationProjectResponse(
      projectArn: (json['projectArn'] as String?) ?? '',
      status: (json['status'] as String?)
          ?.let(DataAutomationProjectStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final projectArn = this.projectArn;
    final status = this.status;
    return {
      'projectArn': projectArn,
      if (status != null) 'status': status.value,
    };
  }
}

/// List DataAutomationProject Response
class ListDataAutomationProjectsResponse {
  final List<DataAutomationProjectSummary> projects;
  final String? nextToken;

  ListDataAutomationProjectsResponse({
    required this.projects,
    this.nextToken,
  });

  factory ListDataAutomationProjectsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListDataAutomationProjectsResponse(
      projects: ((json['projects'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              DataAutomationProjectSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final projects = this.projects;
    final nextToken = this.nextToken;
    return {
      'projects': projects,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Summary of a DataAutomationProject
class DataAutomationProjectSummary {
  final DateTime creationTime;
  final String projectArn;
  final String? projectName;
  final DataAutomationProjectStage? projectStage;
  final DataAutomationProjectType? projectType;

  DataAutomationProjectSummary({
    required this.creationTime,
    required this.projectArn,
    this.projectName,
    this.projectStage,
    this.projectType,
  });

  factory DataAutomationProjectSummary.fromJson(Map<String, dynamic> json) {
    return DataAutomationProjectSummary(
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      projectArn: (json['projectArn'] as String?) ?? '',
      projectName: json['projectName'] as String?,
      projectStage: (json['projectStage'] as String?)
          ?.let(DataAutomationProjectStage.fromString),
      projectType: (json['projectType'] as String?)
          ?.let(DataAutomationProjectType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final projectArn = this.projectArn;
    final projectName = this.projectName;
    final projectStage = this.projectStage;
    final projectType = this.projectType;
    return {
      'creationTime': iso8601ToJson(creationTime),
      'projectArn': projectArn,
      if (projectName != null) 'projectName': projectName,
      if (projectStage != null) 'projectStage': projectStage.value,
      if (projectType != null) 'projectType': projectType.value,
    };
  }
}

/// Stage of the Project
class DataAutomationProjectStage {
  static const development = DataAutomationProjectStage._('DEVELOPMENT');
  static const live = DataAutomationProjectStage._('LIVE');

  final String value;

  const DataAutomationProjectStage._(this.value);

  static const values = [development, live];

  static DataAutomationProjectStage fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DataAutomationProjectStage._(value));

  @override
  bool operator ==(other) =>
      other is DataAutomationProjectStage && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Type of the DataAutomationProject
class DataAutomationProjectType {
  static const async = DataAutomationProjectType._('ASYNC');
  static const sync = DataAutomationProjectType._('SYNC');

  final String value;

  const DataAutomationProjectType._(this.value);

  static const values = [async, sync];

  static DataAutomationProjectType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DataAutomationProjectType._(value));

  @override
  bool operator ==(other) =>
      other is DataAutomationProjectType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Project Stage filter
class DataAutomationProjectStageFilter {
  static const development = DataAutomationProjectStageFilter._('DEVELOPMENT');
  static const live = DataAutomationProjectStageFilter._('LIVE');
  static const all = DataAutomationProjectStageFilter._('ALL');

  final String value;

  const DataAutomationProjectStageFilter._(this.value);

  static const values = [development, live, all];

  static DataAutomationProjectStageFilter fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DataAutomationProjectStageFilter._(value));

  @override
  bool operator ==(other) =>
      other is DataAutomationProjectStageFilter && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Blueprint Filter
class BlueprintFilter {
  final String blueprintArn;
  final BlueprintStage? blueprintStage;
  final String? blueprintVersion;

  BlueprintFilter({
    required this.blueprintArn,
    this.blueprintStage,
    this.blueprintVersion,
  });

  Map<String, dynamic> toJson() {
    final blueprintArn = this.blueprintArn;
    final blueprintStage = this.blueprintStage;
    final blueprintVersion = this.blueprintVersion;
    return {
      'blueprintArn': blueprintArn,
      if (blueprintStage != null) 'blueprintStage': blueprintStage.value,
      if (blueprintVersion != null) 'blueprintVersion': blueprintVersion,
    };
  }
}

/// Resource Owner
class ResourceOwner {
  static const service = ResourceOwner._('SERVICE');
  static const account = ResourceOwner._('ACCOUNT');

  final String value;

  const ResourceOwner._(this.value);

  static const values = [service, account];

  static ResourceOwner fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ResourceOwner._(value));

  @override
  bool operator ==(other) => other is ResourceOwner && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Data Automation Library Filter
class DataAutomationLibraryFilter {
  final String libraryArn;

  DataAutomationLibraryFilter({
    required this.libraryArn,
  });

  Map<String, dynamic> toJson() {
    final libraryArn = this.libraryArn;
    return {
      'libraryArn': libraryArn,
    };
  }
}

/// Stage of the Blueprint
class BlueprintStage {
  static const development = BlueprintStage._('DEVELOPMENT');
  static const live = BlueprintStage._('LIVE');

  final String value;

  const BlueprintStage._(this.value);

  static const values = [development, live];

  static BlueprintStage fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => BlueprintStage._(value));

  @override
  bool operator ==(other) => other is BlueprintStage && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Status of Data Automation Project
class DataAutomationProjectStatus {
  static const completed = DataAutomationProjectStatus._('COMPLETED');
  static const inProgress = DataAutomationProjectStatus._('IN_PROGRESS');
  static const failed = DataAutomationProjectStatus._('FAILED');

  final String value;

  const DataAutomationProjectStatus._(this.value);

  static const values = [completed, inProgress, failed];

  static DataAutomationProjectStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DataAutomationProjectStatus._(value));

  @override
  bool operator ==(other) =>
      other is DataAutomationProjectStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Standard output configuration
class StandardOutputConfiguration {
  final AudioStandardOutputConfiguration? audio;
  final DocumentStandardOutputConfiguration? document;
  final ImageStandardOutputConfiguration? image;
  final VideoStandardOutputConfiguration? video;

  StandardOutputConfiguration({
    this.audio,
    this.document,
    this.image,
    this.video,
  });

  factory StandardOutputConfiguration.fromJson(Map<String, dynamic> json) {
    return StandardOutputConfiguration(
      audio: json['audio'] != null
          ? AudioStandardOutputConfiguration.fromJson(
              json['audio'] as Map<String, dynamic>)
          : null,
      document: json['document'] != null
          ? DocumentStandardOutputConfiguration.fromJson(
              json['document'] as Map<String, dynamic>)
          : null,
      image: json['image'] != null
          ? ImageStandardOutputConfiguration.fromJson(
              json['image'] as Map<String, dynamic>)
          : null,
      video: json['video'] != null
          ? VideoStandardOutputConfiguration.fromJson(
              json['video'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final audio = this.audio;
    final document = this.document;
    final image = this.image;
    final video = this.video;
    return {
      if (audio != null) 'audio': audio,
      if (document != null) 'document': document,
      if (image != null) 'image': image,
      if (video != null) 'video': video,
    };
  }
}

/// Custom output configuration
class CustomOutputConfiguration {
  final List<BlueprintItem>? blueprints;
  final DocumentCustomOutputConfiguration? document;

  CustomOutputConfiguration({
    this.blueprints,
    this.document,
  });

  factory CustomOutputConfiguration.fromJson(Map<String, dynamic> json) {
    return CustomOutputConfiguration(
      blueprints: (json['blueprints'] as List?)
          ?.nonNulls
          .map((e) => BlueprintItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      document: json['document'] != null
          ? DocumentCustomOutputConfiguration.fromJson(
              json['document'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final blueprints = this.blueprints;
    final document = this.document;
    return {
      if (blueprints != null) 'blueprints': blueprints,
      if (document != null) 'document': document,
    };
  }
}

/// Override configuration
class OverrideConfiguration {
  final AudioOverrideConfiguration? audio;
  final DocumentOverrideConfiguration? document;
  final ImageOverrideConfiguration? image;
  final ModalityRoutingConfiguration? modalityRouting;
  final VideoOverrideConfiguration? video;

  OverrideConfiguration({
    this.audio,
    this.document,
    this.image,
    this.modalityRouting,
    this.video,
  });

  factory OverrideConfiguration.fromJson(Map<String, dynamic> json) {
    return OverrideConfiguration(
      audio: json['audio'] != null
          ? AudioOverrideConfiguration.fromJson(
              json['audio'] as Map<String, dynamic>)
          : null,
      document: json['document'] != null
          ? DocumentOverrideConfiguration.fromJson(
              json['document'] as Map<String, dynamic>)
          : null,
      image: json['image'] != null
          ? ImageOverrideConfiguration.fromJson(
              json['image'] as Map<String, dynamic>)
          : null,
      modalityRouting: json['modalityRouting'] != null
          ? ModalityRoutingConfiguration.fromJson(
              json['modalityRouting'] as Map<String, dynamic>)
          : null,
      video: json['video'] != null
          ? VideoOverrideConfiguration.fromJson(
              json['video'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final audio = this.audio;
    final document = this.document;
    final image = this.image;
    final modalityRouting = this.modalityRouting;
    final video = this.video;
    return {
      if (audio != null) 'audio': audio,
      if (document != null) 'document': document,
      if (image != null) 'image': image,
      if (modalityRouting != null) 'modalityRouting': modalityRouting,
      if (video != null) 'video': video,
    };
  }
}

/// DataAutomation Library configuration
class DataAutomationLibraryConfiguration {
  final List<DataAutomationLibraryItem>? libraries;

  DataAutomationLibraryConfiguration({
    this.libraries,
  });

  factory DataAutomationLibraryConfiguration.fromJson(
      Map<String, dynamic> json) {
    return DataAutomationLibraryConfiguration(
      libraries: (json['libraries'] as List?)
          ?.nonNulls
          .map((e) =>
              DataAutomationLibraryItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final libraries = this.libraries;
    return {
      if (libraries != null) 'libraries': libraries,
    };
  }
}

/// KMS Encryption Configuration
class EncryptionConfiguration {
  final String kmsKeyId;
  final Map<String, String>? kmsEncryptionContext;

  EncryptionConfiguration({
    required this.kmsKeyId,
    this.kmsEncryptionContext,
  });

  Map<String, dynamic> toJson() {
    final kmsKeyId = this.kmsKeyId;
    final kmsEncryptionContext = this.kmsEncryptionContext;
    return {
      'kmsKeyId': kmsKeyId,
      if (kmsEncryptionContext != null)
        'kmsEncryptionContext': kmsEncryptionContext,
    };
  }
}

/// DataAutomationLibrary Item
class DataAutomationLibraryItem {
  final String libraryArn;

  DataAutomationLibraryItem({
    required this.libraryArn,
  });

  factory DataAutomationLibraryItem.fromJson(Map<String, dynamic> json) {
    return DataAutomationLibraryItem(
      libraryArn: (json['libraryArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final libraryArn = this.libraryArn;
    return {
      'libraryArn': libraryArn,
    };
  }
}

/// Override Configuration of Document
class DocumentOverrideConfiguration {
  final ModalityProcessingConfiguration? modalityProcessing;
  final SensitiveDataConfiguration? sensitiveDataConfiguration;
  final SplitterConfiguration? splitter;

  DocumentOverrideConfiguration({
    this.modalityProcessing,
    this.sensitiveDataConfiguration,
    this.splitter,
  });

  factory DocumentOverrideConfiguration.fromJson(Map<String, dynamic> json) {
    return DocumentOverrideConfiguration(
      modalityProcessing: json['modalityProcessing'] != null
          ? ModalityProcessingConfiguration.fromJson(
              json['modalityProcessing'] as Map<String, dynamic>)
          : null,
      sensitiveDataConfiguration: json['sensitiveDataConfiguration'] != null
          ? SensitiveDataConfiguration.fromJson(
              json['sensitiveDataConfiguration'] as Map<String, dynamic>)
          : null,
      splitter: json['splitter'] != null
          ? SplitterConfiguration.fromJson(
              json['splitter'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final modalityProcessing = this.modalityProcessing;
    final sensitiveDataConfiguration = this.sensitiveDataConfiguration;
    final splitter = this.splitter;
    return {
      if (modalityProcessing != null) 'modalityProcessing': modalityProcessing,
      if (sensitiveDataConfiguration != null)
        'sensitiveDataConfiguration': sensitiveDataConfiguration,
      if (splitter != null) 'splitter': splitter,
    };
  }
}

/// Override Configuration of Image
class ImageOverrideConfiguration {
  final ModalityProcessingConfiguration? modalityProcessing;
  final SensitiveDataConfiguration? sensitiveDataConfiguration;

  ImageOverrideConfiguration({
    this.modalityProcessing,
    this.sensitiveDataConfiguration,
  });

  factory ImageOverrideConfiguration.fromJson(Map<String, dynamic> json) {
    return ImageOverrideConfiguration(
      modalityProcessing: json['modalityProcessing'] != null
          ? ModalityProcessingConfiguration.fromJson(
              json['modalityProcessing'] as Map<String, dynamic>)
          : null,
      sensitiveDataConfiguration: json['sensitiveDataConfiguration'] != null
          ? SensitiveDataConfiguration.fromJson(
              json['sensitiveDataConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final modalityProcessing = this.modalityProcessing;
    final sensitiveDataConfiguration = this.sensitiveDataConfiguration;
    return {
      if (modalityProcessing != null) 'modalityProcessing': modalityProcessing,
      if (sensitiveDataConfiguration != null)
        'sensitiveDataConfiguration': sensitiveDataConfiguration,
    };
  }
}

/// Override Configuration of Video
class VideoOverrideConfiguration {
  final ModalityProcessingConfiguration? modalityProcessing;
  final SensitiveDataConfiguration? sensitiveDataConfiguration;

  VideoOverrideConfiguration({
    this.modalityProcessing,
    this.sensitiveDataConfiguration,
  });

  factory VideoOverrideConfiguration.fromJson(Map<String, dynamic> json) {
    return VideoOverrideConfiguration(
      modalityProcessing: json['modalityProcessing'] != null
          ? ModalityProcessingConfiguration.fromJson(
              json['modalityProcessing'] as Map<String, dynamic>)
          : null,
      sensitiveDataConfiguration: json['sensitiveDataConfiguration'] != null
          ? SensitiveDataConfiguration.fromJson(
              json['sensitiveDataConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final modalityProcessing = this.modalityProcessing;
    final sensitiveDataConfiguration = this.sensitiveDataConfiguration;
    return {
      if (modalityProcessing != null) 'modalityProcessing': modalityProcessing,
      if (sensitiveDataConfiguration != null)
        'sensitiveDataConfiguration': sensitiveDataConfiguration,
    };
  }
}

/// Override Configuration of Audio
class AudioOverrideConfiguration {
  final AudioLanguageConfiguration? languageConfiguration;
  final ModalityProcessingConfiguration? modalityProcessing;
  final SensitiveDataConfiguration? sensitiveDataConfiguration;

  AudioOverrideConfiguration({
    this.languageConfiguration,
    this.modalityProcessing,
    this.sensitiveDataConfiguration,
  });

  factory AudioOverrideConfiguration.fromJson(Map<String, dynamic> json) {
    return AudioOverrideConfiguration(
      languageConfiguration: json['languageConfiguration'] != null
          ? AudioLanguageConfiguration.fromJson(
              json['languageConfiguration'] as Map<String, dynamic>)
          : null,
      modalityProcessing: json['modalityProcessing'] != null
          ? ModalityProcessingConfiguration.fromJson(
              json['modalityProcessing'] as Map<String, dynamic>)
          : null,
      sensitiveDataConfiguration: json['sensitiveDataConfiguration'] != null
          ? SensitiveDataConfiguration.fromJson(
              json['sensitiveDataConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final languageConfiguration = this.languageConfiguration;
    final modalityProcessing = this.modalityProcessing;
    final sensitiveDataConfiguration = this.sensitiveDataConfiguration;
    return {
      if (languageConfiguration != null)
        'languageConfiguration': languageConfiguration,
      if (modalityProcessing != null) 'modalityProcessing': modalityProcessing,
      if (sensitiveDataConfiguration != null)
        'sensitiveDataConfiguration': sensitiveDataConfiguration,
    };
  }
}

/// Configuration for routing file type to desired modality
class ModalityRoutingConfiguration {
  final DesiredModality? jpeg;
  final DesiredModality? mov;
  final DesiredModality? mp4;
  final DesiredModality? png;

  ModalityRoutingConfiguration({
    this.jpeg,
    this.mov,
    this.mp4,
    this.png,
  });

  factory ModalityRoutingConfiguration.fromJson(Map<String, dynamic> json) {
    return ModalityRoutingConfiguration(
      jpeg: (json['jpeg'] as String?)?.let(DesiredModality.fromString),
      mov: (json['mov'] as String?)?.let(DesiredModality.fromString),
      mp4: (json['mp4'] as String?)?.let(DesiredModality.fromString),
      png: (json['png'] as String?)?.let(DesiredModality.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final jpeg = this.jpeg;
    final mov = this.mov;
    final mp4 = this.mp4;
    final png = this.png;
    return {
      if (jpeg != null) 'jpeg': jpeg.value,
      if (mov != null) 'mov': mov.value,
      if (mp4 != null) 'mp4': mp4.value,
      if (png != null) 'png': png.value,
    };
  }
}

/// Desired Modality types
class DesiredModality {
  static const image = DesiredModality._('IMAGE');
  static const document = DesiredModality._('DOCUMENT');
  static const audio = DesiredModality._('AUDIO');
  static const video = DesiredModality._('VIDEO');

  final String value;

  const DesiredModality._(this.value);

  static const values = [image, document, audio, video];

  static DesiredModality fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DesiredModality._(value));

  @override
  bool operator ==(other) => other is DesiredModality && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Configuration to enable/disable processing of modality
class ModalityProcessingConfiguration {
  final State? state;

  ModalityProcessingConfiguration({
    this.state,
  });

  factory ModalityProcessingConfiguration.fromJson(Map<String, dynamic> json) {
    return ModalityProcessingConfiguration(
      state: (json['state'] as String?)?.let(State.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final state = this.state;
    return {
      if (state != null) 'state': state.value,
    };
  }
}

/// Optional configuration for audio language settings
class AudioLanguageConfiguration {
  final AudioGenerativeOutputLanguage? generativeOutputLanguage;

  /// Enable multiple language identification in audio
  final bool? identifyMultipleLanguages;
  final List<Language>? inputLanguages;

  AudioLanguageConfiguration({
    this.generativeOutputLanguage,
    this.identifyMultipleLanguages,
    this.inputLanguages,
  });

  factory AudioLanguageConfiguration.fromJson(Map<String, dynamic> json) {
    return AudioLanguageConfiguration(
      generativeOutputLanguage: (json['generativeOutputLanguage'] as String?)
          ?.let(AudioGenerativeOutputLanguage.fromString),
      identifyMultipleLanguages: json['identifyMultipleLanguages'] as bool?,
      inputLanguages: (json['inputLanguages'] as List?)
          ?.nonNulls
          .map((e) => Language.fromString((e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final generativeOutputLanguage = this.generativeOutputLanguage;
    final identifyMultipleLanguages = this.identifyMultipleLanguages;
    final inputLanguages = this.inputLanguages;
    return {
      if (generativeOutputLanguage != null)
        'generativeOutputLanguage': generativeOutputLanguage.value,
      if (identifyMultipleLanguages != null)
        'identifyMultipleLanguages': identifyMultipleLanguages,
      if (inputLanguages != null)
        'inputLanguages': inputLanguages.map((e) => e.value).toList(),
    };
  }
}

/// Configuration for sensitive data detection and redaction
class SensitiveDataConfiguration {
  /// Mode for sensitive data detection
  final SensitiveDataDetectionMode detectionMode;

  /// Scope of detection - what types of sensitive data to detect
  final List<SensitiveDataDetectionScopeType>? detectionScope;

  /// Configuration for PII entities detection and redaction
  final PIIEntitiesConfiguration? piiEntitiesConfiguration;

  SensitiveDataConfiguration({
    required this.detectionMode,
    this.detectionScope,
    this.piiEntitiesConfiguration,
  });

  factory SensitiveDataConfiguration.fromJson(Map<String, dynamic> json) {
    return SensitiveDataConfiguration(
      detectionMode: SensitiveDataDetectionMode.fromString(
          (json['detectionMode'] as String?) ?? ''),
      detectionScope: (json['detectionScope'] as List?)
          ?.nonNulls
          .map((e) => SensitiveDataDetectionScopeType.fromString((e as String)))
          .toList(),
      piiEntitiesConfiguration: json['piiEntitiesConfiguration'] != null
          ? PIIEntitiesConfiguration.fromJson(
              json['piiEntitiesConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final detectionMode = this.detectionMode;
    final detectionScope = this.detectionScope;
    final piiEntitiesConfiguration = this.piiEntitiesConfiguration;
    return {
      'detectionMode': detectionMode.value,
      if (detectionScope != null)
        'detectionScope': detectionScope.map((e) => e.value).toList(),
      if (piiEntitiesConfiguration != null)
        'piiEntitiesConfiguration': piiEntitiesConfiguration,
    };
  }
}

/// Mode for sensitive data detection
class SensitiveDataDetectionMode {
  static const detection = SensitiveDataDetectionMode._('DETECTION');
  static const detectionAndRedaction =
      SensitiveDataDetectionMode._('DETECTION_AND_REDACTION');

  final String value;

  const SensitiveDataDetectionMode._(this.value);

  static const values = [detection, detectionAndRedaction];

  static SensitiveDataDetectionMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SensitiveDataDetectionMode._(value));

  @override
  bool operator ==(other) =>
      other is SensitiveDataDetectionMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Configuration for PII entities detection and redaction
class PIIEntitiesConfiguration {
  /// Types of PII entities to detect
  final List<PIIEntityType>? piiEntityTypes;

  /// Mode for redacting detected PII
  final PIIRedactionMaskMode? redactionMaskMode;

  PIIEntitiesConfiguration({
    this.piiEntityTypes,
    this.redactionMaskMode,
  });

  factory PIIEntitiesConfiguration.fromJson(Map<String, dynamic> json) {
    return PIIEntitiesConfiguration(
      piiEntityTypes: (json['piiEntityTypes'] as List?)
          ?.nonNulls
          .map((e) => PIIEntityType.fromString((e as String)))
          .toList(),
      redactionMaskMode: (json['redactionMaskMode'] as String?)
          ?.let(PIIRedactionMaskMode.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final piiEntityTypes = this.piiEntityTypes;
    final redactionMaskMode = this.redactionMaskMode;
    return {
      if (piiEntityTypes != null)
        'piiEntityTypes': piiEntityTypes.map((e) => e.value).toList(),
      if (redactionMaskMode != null)
        'redactionMaskMode': redactionMaskMode.value,
    };
  }
}

/// Mode for redacting detected PII
class PIIRedactionMaskMode {
  static const pii = PIIRedactionMaskMode._('PII');
  static const entityType = PIIRedactionMaskMode._('ENTITY_TYPE');

  final String value;

  const PIIRedactionMaskMode._(this.value);

  static const values = [pii, entityType];

  static PIIRedactionMaskMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PIIRedactionMaskMode._(value));

  @override
  bool operator ==(other) =>
      other is PIIRedactionMaskMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Types of PII entities that can be detected, we will support every types that
/// Guardrails can support
class PIIEntityType {
  static const all = PIIEntityType._('ALL');
  static const address = PIIEntityType._('ADDRESS');
  static const age = PIIEntityType._('AGE');
  static const name = PIIEntityType._('NAME');
  static const email = PIIEntityType._('EMAIL');
  static const phone = PIIEntityType._('PHONE');
  static const username = PIIEntityType._('USERNAME');
  static const password = PIIEntityType._('PASSWORD');
  static const driverId = PIIEntityType._('DRIVER_ID');
  static const licensePlate = PIIEntityType._('LICENSE_PLATE');
  static const vehicleIdentificationNumber =
      PIIEntityType._('VEHICLE_IDENTIFICATION_NUMBER');
  static const creditDebitCardCvv = PIIEntityType._('CREDIT_DEBIT_CARD_CVV');
  static const creditDebitCardExpiry =
      PIIEntityType._('CREDIT_DEBIT_CARD_EXPIRY');
  static const creditDebitCardNumber =
      PIIEntityType._('CREDIT_DEBIT_CARD_NUMBER');
  static const pin = PIIEntityType._('PIN');
  static const internationalBankAccountNumber =
      PIIEntityType._('INTERNATIONAL_BANK_ACCOUNT_NUMBER');
  static const swiftCode = PIIEntityType._('SWIFT_CODE');
  static const ipAddress = PIIEntityType._('IP_ADDRESS');
  static const macAddress = PIIEntityType._('MAC_ADDRESS');
  static const url = PIIEntityType._('URL');
  static const awsAccessKey = PIIEntityType._('AWS_ACCESS_KEY');
  static const awsSecretKey = PIIEntityType._('AWS_SECRET_KEY');
  static const usBankAccountNumber = PIIEntityType._('US_BANK_ACCOUNT_NUMBER');
  static const usBankRoutingNumber = PIIEntityType._('US_BANK_ROUTING_NUMBER');
  static const usIndividualTaxIdentificationNumber =
      PIIEntityType._('US_INDIVIDUAL_TAX_IDENTIFICATION_NUMBER');
  static const usPassportNumber = PIIEntityType._('US_PASSPORT_NUMBER');
  static const usSocialSecurityNumber =
      PIIEntityType._('US_SOCIAL_SECURITY_NUMBER');
  static const caHealthNumber = PIIEntityType._('CA_HEALTH_NUMBER');
  static const caSocialInsuranceNumber =
      PIIEntityType._('CA_SOCIAL_INSURANCE_NUMBER');
  static const ukNationalHealthServiceNumber =
      PIIEntityType._('UK_NATIONAL_HEALTH_SERVICE_NUMBER');
  static const ukNationalInsuranceNumber =
      PIIEntityType._('UK_NATIONAL_INSURANCE_NUMBER');
  static const ukUniqueTaxpayerReferenceNumber =
      PIIEntityType._('UK_UNIQUE_TAXPAYER_REFERENCE_NUMBER');

  final String value;

  const PIIEntityType._(this.value);

  static const values = [
    all,
    address,
    age,
    name,
    email,
    phone,
    username,
    password,
    driverId,
    licensePlate,
    vehicleIdentificationNumber,
    creditDebitCardCvv,
    creditDebitCardExpiry,
    creditDebitCardNumber,
    pin,
    internationalBankAccountNumber,
    swiftCode,
    ipAddress,
    macAddress,
    url,
    awsAccessKey,
    awsSecretKey,
    usBankAccountNumber,
    usBankRoutingNumber,
    usIndividualTaxIdentificationNumber,
    usPassportNumber,
    usSocialSecurityNumber,
    caHealthNumber,
    caSocialInsuranceNumber,
    ukNationalHealthServiceNumber,
    ukNationalInsuranceNumber,
    ukUniqueTaxpayerReferenceNumber
  ];

  static PIIEntityType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PIIEntityType._(value));

  @override
  bool operator ==(other) => other is PIIEntityType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Types of sensitive data detection scope
class SensitiveDataDetectionScopeType {
  static const standard = SensitiveDataDetectionScopeType._('STANDARD');
  static const custom = SensitiveDataDetectionScopeType._('CUSTOM');

  final String value;

  const SensitiveDataDetectionScopeType._(this.value);

  static const values = [standard, custom];

  static SensitiveDataDetectionScopeType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SensitiveDataDetectionScopeType._(value));

  @override
  bool operator ==(other) =>
      other is SensitiveDataDetectionScopeType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Configuration for Audio output language
class AudioGenerativeOutputLanguage {
  static const $default = AudioGenerativeOutputLanguage._('DEFAULT');
  static const en = AudioGenerativeOutputLanguage._('EN');

  final String value;

  const AudioGenerativeOutputLanguage._(this.value);

  static const values = [$default, en];

  static AudioGenerativeOutputLanguage fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AudioGenerativeOutputLanguage._(value));

  @override
  bool operator ==(other) =>
      other is AudioGenerativeOutputLanguage && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Supported input languages
class Language {
  static const en = Language._('EN');
  static const de = Language._('DE');
  static const es = Language._('ES');
  static const fr = Language._('FR');
  static const it = Language._('IT');
  static const pt = Language._('PT');
  static const ja = Language._('JA');
  static const ko = Language._('KO');
  static const cn = Language._('CN');
  static const tw = Language._('TW');
  static const hk = Language._('HK');

  final String value;

  const Language._(this.value);

  static const values = [en, de, es, fr, it, pt, ja, ko, cn, tw, hk];

  static Language fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => Language._(value));

  @override
  bool operator ==(other) => other is Language && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// State
class State {
  static const enabled = State._('ENABLED');
  static const disabled = State._('DISABLED');

  final String value;

  const State._(this.value);

  static const values = [enabled, disabled];

  static State fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => State._(value));

  @override
  bool operator ==(other) => other is State && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Configuration of Splitter
class SplitterConfiguration {
  final State? state;

  SplitterConfiguration({
    this.state,
  });

  factory SplitterConfiguration.fromJson(Map<String, dynamic> json) {
    return SplitterConfiguration(
      state: (json['state'] as String?)?.let(State.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final state = this.state;
    return {
      if (state != null) 'state': state.value,
    };
  }
}

/// Custom Configuration of Document
class DocumentCustomOutputConfiguration {
  final List<BlueprintItem>? fallbackBlueprints;

  DocumentCustomOutputConfiguration({
    this.fallbackBlueprints,
  });

  factory DocumentCustomOutputConfiguration.fromJson(
      Map<String, dynamic> json) {
    return DocumentCustomOutputConfiguration(
      fallbackBlueprints: (json['fallbackBlueprints'] as List?)
          ?.nonNulls
          .map((e) => BlueprintItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final fallbackBlueprints = this.fallbackBlueprints;
    return {
      if (fallbackBlueprints != null) 'fallbackBlueprints': fallbackBlueprints,
    };
  }
}

/// Blueprint Item
class BlueprintItem {
  final String blueprintArn;
  final BlueprintStage? blueprintStage;
  final String? blueprintVersion;

  BlueprintItem({
    required this.blueprintArn,
    this.blueprintStage,
    this.blueprintVersion,
  });

  factory BlueprintItem.fromJson(Map<String, dynamic> json) {
    return BlueprintItem(
      blueprintArn: (json['blueprintArn'] as String?) ?? '',
      blueprintStage:
          (json['blueprintStage'] as String?)?.let(BlueprintStage.fromString),
      blueprintVersion: json['blueprintVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final blueprintArn = this.blueprintArn;
    final blueprintStage = this.blueprintStage;
    final blueprintVersion = this.blueprintVersion;
    return {
      'blueprintArn': blueprintArn,
      if (blueprintStage != null) 'blueprintStage': blueprintStage.value,
      if (blueprintVersion != null) 'blueprintVersion': blueprintVersion,
    };
  }
}

/// Standard Output Configuration of Document
class DocumentStandardOutputConfiguration {
  final DocumentStandardExtraction? extraction;
  final DocumentStandardGenerativeField? generativeField;
  final DocumentOutputFormat? outputFormat;

  DocumentStandardOutputConfiguration({
    this.extraction,
    this.generativeField,
    this.outputFormat,
  });

  factory DocumentStandardOutputConfiguration.fromJson(
      Map<String, dynamic> json) {
    return DocumentStandardOutputConfiguration(
      extraction: json['extraction'] != null
          ? DocumentStandardExtraction.fromJson(
              json['extraction'] as Map<String, dynamic>)
          : null,
      generativeField: json['generativeField'] != null
          ? DocumentStandardGenerativeField.fromJson(
              json['generativeField'] as Map<String, dynamic>)
          : null,
      outputFormat: json['outputFormat'] != null
          ? DocumentOutputFormat.fromJson(
              json['outputFormat'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final extraction = this.extraction;
    final generativeField = this.generativeField;
    final outputFormat = this.outputFormat;
    return {
      if (extraction != null) 'extraction': extraction,
      if (generativeField != null) 'generativeField': generativeField,
      if (outputFormat != null) 'outputFormat': outputFormat,
    };
  }
}

/// Standard Output Configuration of Image
class ImageStandardOutputConfiguration {
  final ImageStandardExtraction? extraction;
  final ImageStandardGenerativeField? generativeField;

  ImageStandardOutputConfiguration({
    this.extraction,
    this.generativeField,
  });

  factory ImageStandardOutputConfiguration.fromJson(Map<String, dynamic> json) {
    return ImageStandardOutputConfiguration(
      extraction: json['extraction'] != null
          ? ImageStandardExtraction.fromJson(
              json['extraction'] as Map<String, dynamic>)
          : null,
      generativeField: json['generativeField'] != null
          ? ImageStandardGenerativeField.fromJson(
              json['generativeField'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final extraction = this.extraction;
    final generativeField = this.generativeField;
    return {
      if (extraction != null) 'extraction': extraction,
      if (generativeField != null) 'generativeField': generativeField,
    };
  }
}

/// Standard Output Configuration of Video
class VideoStandardOutputConfiguration {
  final VideoStandardExtraction? extraction;
  final VideoStandardGenerativeField? generativeField;

  VideoStandardOutputConfiguration({
    this.extraction,
    this.generativeField,
  });

  factory VideoStandardOutputConfiguration.fromJson(Map<String, dynamic> json) {
    return VideoStandardOutputConfiguration(
      extraction: json['extraction'] != null
          ? VideoStandardExtraction.fromJson(
              json['extraction'] as Map<String, dynamic>)
          : null,
      generativeField: json['generativeField'] != null
          ? VideoStandardGenerativeField.fromJson(
              json['generativeField'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final extraction = this.extraction;
    final generativeField = this.generativeField;
    return {
      if (extraction != null) 'extraction': extraction,
      if (generativeField != null) 'generativeField': generativeField,
    };
  }
}

/// Standard Output Configuration of Audio
class AudioStandardOutputConfiguration {
  final AudioStandardExtraction? extraction;
  final AudioStandardGenerativeField? generativeField;

  AudioStandardOutputConfiguration({
    this.extraction,
    this.generativeField,
  });

  factory AudioStandardOutputConfiguration.fromJson(Map<String, dynamic> json) {
    return AudioStandardOutputConfiguration(
      extraction: json['extraction'] != null
          ? AudioStandardExtraction.fromJson(
              json['extraction'] as Map<String, dynamic>)
          : null,
      generativeField: json['generativeField'] != null
          ? AudioStandardGenerativeField.fromJson(
              json['generativeField'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final extraction = this.extraction;
    final generativeField = this.generativeField;
    return {
      if (extraction != null) 'extraction': extraction,
      if (generativeField != null) 'generativeField': generativeField,
    };
  }
}

/// Standard Extraction Configuration of Audio
class AudioStandardExtraction {
  final AudioExtractionCategory category;

  AudioStandardExtraction({
    required this.category,
  });

  factory AudioStandardExtraction.fromJson(Map<String, dynamic> json) {
    return AudioStandardExtraction(
      category: AudioExtractionCategory.fromJson(
          (json['category'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final category = this.category;
    return {
      'category': category,
    };
  }
}

/// Standard Generative Field Configuration of Audio
class AudioStandardGenerativeField {
  final State state;
  final List<AudioStandardGenerativeFieldType>? types;

  AudioStandardGenerativeField({
    required this.state,
    this.types,
  });

  factory AudioStandardGenerativeField.fromJson(Map<String, dynamic> json) {
    return AudioStandardGenerativeField(
      state: State.fromString((json['state'] as String?) ?? ''),
      types: (json['types'] as List?)
          ?.nonNulls
          .map(
              (e) => AudioStandardGenerativeFieldType.fromString((e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final state = this.state;
    final types = this.types;
    return {
      'state': state.value,
      if (types != null) 'types': types.map((e) => e.value).toList(),
    };
  }
}

class AudioStandardGenerativeFieldType {
  static const audioSummary =
      AudioStandardGenerativeFieldType._('AUDIO_SUMMARY');
  static const iab = AudioStandardGenerativeFieldType._('IAB');
  static const topicSummary =
      AudioStandardGenerativeFieldType._('TOPIC_SUMMARY');

  final String value;

  const AudioStandardGenerativeFieldType._(this.value);

  static const values = [audioSummary, iab, topicSummary];

  static AudioStandardGenerativeFieldType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AudioStandardGenerativeFieldType._(value));

  @override
  bool operator ==(other) =>
      other is AudioStandardGenerativeFieldType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Category of Audio Extraction
class AudioExtractionCategory {
  final State state;
  final AudioExtractionCategoryTypeConfiguration? typeConfiguration;
  final List<AudioExtractionCategoryType>? types;

  AudioExtractionCategory({
    required this.state,
    this.typeConfiguration,
    this.types,
  });

  factory AudioExtractionCategory.fromJson(Map<String, dynamic> json) {
    return AudioExtractionCategory(
      state: State.fromString((json['state'] as String?) ?? ''),
      typeConfiguration: json['typeConfiguration'] != null
          ? AudioExtractionCategoryTypeConfiguration.fromJson(
              json['typeConfiguration'] as Map<String, dynamic>)
          : null,
      types: (json['types'] as List?)
          ?.nonNulls
          .map((e) => AudioExtractionCategoryType.fromString((e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final state = this.state;
    final typeConfiguration = this.typeConfiguration;
    final types = this.types;
    return {
      'state': state.value,
      if (typeConfiguration != null) 'typeConfiguration': typeConfiguration,
      if (types != null) 'types': types.map((e) => e.value).toList(),
    };
  }
}

/// Configuration for different audio extraction category types
class AudioExtractionCategoryTypeConfiguration {
  final TranscriptConfiguration? transcript;

  AudioExtractionCategoryTypeConfiguration({
    this.transcript,
  });

  factory AudioExtractionCategoryTypeConfiguration.fromJson(
      Map<String, dynamic> json) {
    return AudioExtractionCategoryTypeConfiguration(
      transcript: json['transcript'] != null
          ? TranscriptConfiguration.fromJson(
              json['transcript'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final transcript = this.transcript;
    return {
      if (transcript != null) 'transcript': transcript,
    };
  }
}

/// Configuration for transcript related features
class TranscriptConfiguration {
  final ChannelLabelingConfiguration? channelLabeling;
  final SpeakerLabelingConfiguration? speakerLabeling;

  TranscriptConfiguration({
    this.channelLabeling,
    this.speakerLabeling,
  });

  factory TranscriptConfiguration.fromJson(Map<String, dynamic> json) {
    return TranscriptConfiguration(
      channelLabeling: json['channelLabeling'] != null
          ? ChannelLabelingConfiguration.fromJson(
              json['channelLabeling'] as Map<String, dynamic>)
          : null,
      speakerLabeling: json['speakerLabeling'] != null
          ? SpeakerLabelingConfiguration.fromJson(
              json['speakerLabeling'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final channelLabeling = this.channelLabeling;
    final speakerLabeling = this.speakerLabeling;
    return {
      if (channelLabeling != null) 'channelLabeling': channelLabeling,
      if (speakerLabeling != null) 'speakerLabeling': speakerLabeling,
    };
  }
}

/// Speaker labeling configuration
class SpeakerLabelingConfiguration {
  final State state;

  SpeakerLabelingConfiguration({
    required this.state,
  });

  factory SpeakerLabelingConfiguration.fromJson(Map<String, dynamic> json) {
    return SpeakerLabelingConfiguration(
      state: State.fromString((json['state'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final state = this.state;
    return {
      'state': state.value,
    };
  }
}

/// Channel labeling configuration
class ChannelLabelingConfiguration {
  final State state;

  ChannelLabelingConfiguration({
    required this.state,
  });

  factory ChannelLabelingConfiguration.fromJson(Map<String, dynamic> json) {
    return ChannelLabelingConfiguration(
      state: State.fromString((json['state'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final state = this.state;
    return {
      'state': state.value,
    };
  }
}

class AudioExtractionCategoryType {
  static const audioContentModeration =
      AudioExtractionCategoryType._('AUDIO_CONTENT_MODERATION');
  static const transcript = AudioExtractionCategoryType._('TRANSCRIPT');
  static const topicContentModeration =
      AudioExtractionCategoryType._('TOPIC_CONTENT_MODERATION');

  final String value;

  const AudioExtractionCategoryType._(this.value);

  static const values = [
    audioContentModeration,
    transcript,
    topicContentModeration
  ];

  static AudioExtractionCategoryType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AudioExtractionCategoryType._(value));

  @override
  bool operator ==(other) =>
      other is AudioExtractionCategoryType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Standard Extraction Configuration of Video
class VideoStandardExtraction {
  final VideoBoundingBox boundingBox;
  final VideoExtractionCategory category;

  VideoStandardExtraction({
    required this.boundingBox,
    required this.category,
  });

  factory VideoStandardExtraction.fromJson(Map<String, dynamic> json) {
    return VideoStandardExtraction(
      boundingBox: VideoBoundingBox.fromJson(
          (json['boundingBox'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      category: VideoExtractionCategory.fromJson(
          (json['category'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final boundingBox = this.boundingBox;
    final category = this.category;
    return {
      'boundingBox': boundingBox,
      'category': category,
    };
  }
}

/// Standard Generative Field Configuration of Video
class VideoStandardGenerativeField {
  final State state;
  final List<VideoStandardGenerativeFieldType>? types;

  VideoStandardGenerativeField({
    required this.state,
    this.types,
  });

  factory VideoStandardGenerativeField.fromJson(Map<String, dynamic> json) {
    return VideoStandardGenerativeField(
      state: State.fromString((json['state'] as String?) ?? ''),
      types: (json['types'] as List?)
          ?.nonNulls
          .map(
              (e) => VideoStandardGenerativeFieldType.fromString((e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final state = this.state;
    final types = this.types;
    return {
      'state': state.value,
      if (types != null) 'types': types.map((e) => e.value).toList(),
    };
  }
}

class VideoStandardGenerativeFieldType {
  static const videoSummary =
      VideoStandardGenerativeFieldType._('VIDEO_SUMMARY');
  static const iab = VideoStandardGenerativeFieldType._('IAB');
  static const chapterSummary =
      VideoStandardGenerativeFieldType._('CHAPTER_SUMMARY');

  final String value;

  const VideoStandardGenerativeFieldType._(this.value);

  static const values = [videoSummary, iab, chapterSummary];

  static VideoStandardGenerativeFieldType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => VideoStandardGenerativeFieldType._(value));

  @override
  bool operator ==(other) =>
      other is VideoStandardGenerativeFieldType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Category of Video Extraction
class VideoExtractionCategory {
  final State state;
  final List<VideoExtractionCategoryType>? types;

  VideoExtractionCategory({
    required this.state,
    this.types,
  });

  factory VideoExtractionCategory.fromJson(Map<String, dynamic> json) {
    return VideoExtractionCategory(
      state: State.fromString((json['state'] as String?) ?? ''),
      types: (json['types'] as List?)
          ?.nonNulls
          .map((e) => VideoExtractionCategoryType.fromString((e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final state = this.state;
    final types = this.types;
    return {
      'state': state.value,
      if (types != null) 'types': types.map((e) => e.value).toList(),
    };
  }
}

/// Bounding Box Configuration of Video Extraction
class VideoBoundingBox {
  final State state;

  VideoBoundingBox({
    required this.state,
  });

  factory VideoBoundingBox.fromJson(Map<String, dynamic> json) {
    return VideoBoundingBox(
      state: State.fromString((json['state'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final state = this.state;
    return {
      'state': state.value,
    };
  }
}

class VideoExtractionCategoryType {
  static const contentModeration =
      VideoExtractionCategoryType._('CONTENT_MODERATION');
  static const textDetection = VideoExtractionCategoryType._('TEXT_DETECTION');
  static const transcript = VideoExtractionCategoryType._('TRANSCRIPT');
  static const logos = VideoExtractionCategoryType._('LOGOS');

  final String value;

  const VideoExtractionCategoryType._(this.value);

  static const values = [contentModeration, textDetection, transcript, logos];

  static VideoExtractionCategoryType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => VideoExtractionCategoryType._(value));

  @override
  bool operator ==(other) =>
      other is VideoExtractionCategoryType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Standard Extraction Configuration of Image
class ImageStandardExtraction {
  final ImageBoundingBox boundingBox;
  final ImageExtractionCategory category;

  ImageStandardExtraction({
    required this.boundingBox,
    required this.category,
  });

  factory ImageStandardExtraction.fromJson(Map<String, dynamic> json) {
    return ImageStandardExtraction(
      boundingBox: ImageBoundingBox.fromJson(
          (json['boundingBox'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      category: ImageExtractionCategory.fromJson(
          (json['category'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final boundingBox = this.boundingBox;
    final category = this.category;
    return {
      'boundingBox': boundingBox,
      'category': category,
    };
  }
}

/// Standard Generative Field Configuration of Image
class ImageStandardGenerativeField {
  final State state;
  final List<ImageStandardGenerativeFieldType>? types;

  ImageStandardGenerativeField({
    required this.state,
    this.types,
  });

  factory ImageStandardGenerativeField.fromJson(Map<String, dynamic> json) {
    return ImageStandardGenerativeField(
      state: State.fromString((json['state'] as String?) ?? ''),
      types: (json['types'] as List?)
          ?.nonNulls
          .map(
              (e) => ImageStandardGenerativeFieldType.fromString((e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final state = this.state;
    final types = this.types;
    return {
      'state': state.value,
      if (types != null) 'types': types.map((e) => e.value).toList(),
    };
  }
}

class ImageStandardGenerativeFieldType {
  static const imageSummary =
      ImageStandardGenerativeFieldType._('IMAGE_SUMMARY');
  static const iab = ImageStandardGenerativeFieldType._('IAB');

  final String value;

  const ImageStandardGenerativeFieldType._(this.value);

  static const values = [imageSummary, iab];

  static ImageStandardGenerativeFieldType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ImageStandardGenerativeFieldType._(value));

  @override
  bool operator ==(other) =>
      other is ImageStandardGenerativeFieldType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Category of Image Extraction
class ImageExtractionCategory {
  final State state;
  final List<ImageExtractionCategoryType>? types;

  ImageExtractionCategory({
    required this.state,
    this.types,
  });

  factory ImageExtractionCategory.fromJson(Map<String, dynamic> json) {
    return ImageExtractionCategory(
      state: State.fromString((json['state'] as String?) ?? ''),
      types: (json['types'] as List?)
          ?.nonNulls
          .map((e) => ImageExtractionCategoryType.fromString((e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final state = this.state;
    final types = this.types;
    return {
      'state': state.value,
      if (types != null) 'types': types.map((e) => e.value).toList(),
    };
  }
}

/// Bounding Box Configuration of Image Extraction
class ImageBoundingBox {
  final State state;

  ImageBoundingBox({
    required this.state,
  });

  factory ImageBoundingBox.fromJson(Map<String, dynamic> json) {
    return ImageBoundingBox(
      state: State.fromString((json['state'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final state = this.state;
    return {
      'state': state.value,
    };
  }
}

class ImageExtractionCategoryType {
  static const contentModeration =
      ImageExtractionCategoryType._('CONTENT_MODERATION');
  static const textDetection = ImageExtractionCategoryType._('TEXT_DETECTION');
  static const logos = ImageExtractionCategoryType._('LOGOS');

  final String value;

  const ImageExtractionCategoryType._(this.value);

  static const values = [contentModeration, textDetection, logos];

  static ImageExtractionCategoryType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ImageExtractionCategoryType._(value));

  @override
  bool operator ==(other) =>
      other is ImageExtractionCategoryType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Standard Extraction Configuration of Document
class DocumentStandardExtraction {
  final DocumentBoundingBox boundingBox;
  final DocumentExtractionGranularity granularity;

  DocumentStandardExtraction({
    required this.boundingBox,
    required this.granularity,
  });

  factory DocumentStandardExtraction.fromJson(Map<String, dynamic> json) {
    return DocumentStandardExtraction(
      boundingBox: DocumentBoundingBox.fromJson(
          (json['boundingBox'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      granularity: DocumentExtractionGranularity.fromJson(
          (json['granularity'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final boundingBox = this.boundingBox;
    final granularity = this.granularity;
    return {
      'boundingBox': boundingBox,
      'granularity': granularity,
    };
  }
}

/// Standard Generative Field Configuration of Document
class DocumentStandardGenerativeField {
  final State state;

  DocumentStandardGenerativeField({
    required this.state,
  });

  factory DocumentStandardGenerativeField.fromJson(Map<String, dynamic> json) {
    return DocumentStandardGenerativeField(
      state: State.fromString((json['state'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final state = this.state;
    return {
      'state': state.value,
    };
  }
}

/// Output Format of Document
class DocumentOutputFormat {
  final DocumentOutputAdditionalFileFormat additionalFileFormat;
  final DocumentOutputTextFormat textFormat;

  DocumentOutputFormat({
    required this.additionalFileFormat,
    required this.textFormat,
  });

  factory DocumentOutputFormat.fromJson(Map<String, dynamic> json) {
    return DocumentOutputFormat(
      additionalFileFormat: DocumentOutputAdditionalFileFormat.fromJson(
          (json['additionalFileFormat'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      textFormat: DocumentOutputTextFormat.fromJson(
          (json['textFormat'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final additionalFileFormat = this.additionalFileFormat;
    final textFormat = this.textFormat;
    return {
      'additionalFileFormat': additionalFileFormat,
      'textFormat': textFormat,
    };
  }
}

/// Text Format of Document Output
class DocumentOutputTextFormat {
  final List<DocumentOutputTextFormatType>? types;

  DocumentOutputTextFormat({
    this.types,
  });

  factory DocumentOutputTextFormat.fromJson(Map<String, dynamic> json) {
    return DocumentOutputTextFormat(
      types: (json['types'] as List?)
          ?.nonNulls
          .map((e) => DocumentOutputTextFormatType.fromString((e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final types = this.types;
    return {
      if (types != null) 'types': types.map((e) => e.value).toList(),
    };
  }
}

/// Additional File Format of Document Output
class DocumentOutputAdditionalFileFormat {
  final State state;

  DocumentOutputAdditionalFileFormat({
    required this.state,
  });

  factory DocumentOutputAdditionalFileFormat.fromJson(
      Map<String, dynamic> json) {
    return DocumentOutputAdditionalFileFormat(
      state: State.fromString((json['state'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final state = this.state;
    return {
      'state': state.value,
    };
  }
}

class DocumentOutputTextFormatType {
  static const plainText = DocumentOutputTextFormatType._('PLAIN_TEXT');
  static const markdown = DocumentOutputTextFormatType._('MARKDOWN');
  static const html = DocumentOutputTextFormatType._('HTML');
  static const csv = DocumentOutputTextFormatType._('CSV');

  final String value;

  const DocumentOutputTextFormatType._(this.value);

  static const values = [plainText, markdown, html, csv];

  static DocumentOutputTextFormatType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DocumentOutputTextFormatType._(value));

  @override
  bool operator ==(other) =>
      other is DocumentOutputTextFormatType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Granularity of Document Extraction
class DocumentExtractionGranularity {
  final List<DocumentExtractionGranularityType>? types;

  DocumentExtractionGranularity({
    this.types,
  });

  factory DocumentExtractionGranularity.fromJson(Map<String, dynamic> json) {
    return DocumentExtractionGranularity(
      types: (json['types'] as List?)
          ?.nonNulls
          .map((e) =>
              DocumentExtractionGranularityType.fromString((e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final types = this.types;
    return {
      if (types != null) 'types': types.map((e) => e.value).toList(),
    };
  }
}

/// Bounding Box Configuration of Document Extraction
class DocumentBoundingBox {
  final State state;

  DocumentBoundingBox({
    required this.state,
  });

  factory DocumentBoundingBox.fromJson(Map<String, dynamic> json) {
    return DocumentBoundingBox(
      state: State.fromString((json['state'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final state = this.state;
    return {
      'state': state.value,
    };
  }
}

class DocumentExtractionGranularityType {
  static const document = DocumentExtractionGranularityType._('DOCUMENT');
  static const page = DocumentExtractionGranularityType._('PAGE');
  static const element = DocumentExtractionGranularityType._('ELEMENT');
  static const word = DocumentExtractionGranularityType._('WORD');
  static const line = DocumentExtractionGranularityType._('LINE');

  final String value;

  const DocumentExtractionGranularityType._(this.value);

  static const values = [document, page, element, word, line];

  static DocumentExtractionGranularityType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DocumentExtractionGranularityType._(value));

  @override
  bool operator ==(other) =>
      other is DocumentExtractionGranularityType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains the information of a DataAutomationProject.
class DataAutomationProject {
  final DateTime creationTime;
  final DateTime lastModifiedTime;
  final String projectArn;
  final String projectName;
  final DataAutomationProjectStatus status;
  final CustomOutputConfiguration? customOutputConfiguration;
  final DataAutomationLibraryConfiguration? dataAutomationLibraryConfiguration;
  final Map<String, String>? kmsEncryptionContext;
  final String? kmsKeyId;
  final OverrideConfiguration? overrideConfiguration;
  final String? projectDescription;
  final DataAutomationProjectStage? projectStage;
  final DataAutomationProjectType? projectType;
  final StandardOutputConfiguration? standardOutputConfiguration;

  DataAutomationProject({
    required this.creationTime,
    required this.lastModifiedTime,
    required this.projectArn,
    required this.projectName,
    required this.status,
    this.customOutputConfiguration,
    this.dataAutomationLibraryConfiguration,
    this.kmsEncryptionContext,
    this.kmsKeyId,
    this.overrideConfiguration,
    this.projectDescription,
    this.projectStage,
    this.projectType,
    this.standardOutputConfiguration,
  });

  factory DataAutomationProject.fromJson(Map<String, dynamic> json) {
    return DataAutomationProject(
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      lastModifiedTime:
          nonNullableTimeStampFromJson(json['lastModifiedTime'] ?? 0),
      projectArn: (json['projectArn'] as String?) ?? '',
      projectName: (json['projectName'] as String?) ?? '',
      status: DataAutomationProjectStatus.fromString(
          (json['status'] as String?) ?? ''),
      customOutputConfiguration: json['customOutputConfiguration'] != null
          ? CustomOutputConfiguration.fromJson(
              json['customOutputConfiguration'] as Map<String, dynamic>)
          : null,
      dataAutomationLibraryConfiguration:
          json['dataAutomationLibraryConfiguration'] != null
              ? DataAutomationLibraryConfiguration.fromJson(
                  json['dataAutomationLibraryConfiguration']
                      as Map<String, dynamic>)
              : null,
      kmsEncryptionContext:
          (json['kmsEncryptionContext'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
      kmsKeyId: json['kmsKeyId'] as String?,
      overrideConfiguration: json['overrideConfiguration'] != null
          ? OverrideConfiguration.fromJson(
              json['overrideConfiguration'] as Map<String, dynamic>)
          : null,
      projectDescription: json['projectDescription'] as String?,
      projectStage: (json['projectStage'] as String?)
          ?.let(DataAutomationProjectStage.fromString),
      projectType: (json['projectType'] as String?)
          ?.let(DataAutomationProjectType.fromString),
      standardOutputConfiguration: json['standardOutputConfiguration'] != null
          ? StandardOutputConfiguration.fromJson(
              json['standardOutputConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final lastModifiedTime = this.lastModifiedTime;
    final projectArn = this.projectArn;
    final projectName = this.projectName;
    final status = this.status;
    final customOutputConfiguration = this.customOutputConfiguration;
    final dataAutomationLibraryConfiguration =
        this.dataAutomationLibraryConfiguration;
    final kmsEncryptionContext = this.kmsEncryptionContext;
    final kmsKeyId = this.kmsKeyId;
    final overrideConfiguration = this.overrideConfiguration;
    final projectDescription = this.projectDescription;
    final projectStage = this.projectStage;
    final projectType = this.projectType;
    final standardOutputConfiguration = this.standardOutputConfiguration;
    return {
      'creationTime': iso8601ToJson(creationTime),
      'lastModifiedTime': iso8601ToJson(lastModifiedTime),
      'projectArn': projectArn,
      'projectName': projectName,
      'status': status.value,
      if (customOutputConfiguration != null)
        'customOutputConfiguration': customOutputConfiguration,
      if (dataAutomationLibraryConfiguration != null)
        'dataAutomationLibraryConfiguration':
            dataAutomationLibraryConfiguration,
      if (kmsEncryptionContext != null)
        'kmsEncryptionContext': kmsEncryptionContext,
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
      if (overrideConfiguration != null)
        'overrideConfiguration': overrideConfiguration,
      if (projectDescription != null) 'projectDescription': projectDescription,
      if (projectStage != null) 'projectStage': projectStage.value,
      if (projectType != null) 'projectType': projectType.value,
      if (standardOutputConfiguration != null)
        'standardOutputConfiguration': standardOutputConfiguration,
    };
  }
}

/// Key value pair of a tag
class Tag {
  final String key;
  final String value;

  Tag({
    required this.key,
    required this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: (json['key'] as String?) ?? '',
      value: (json['value'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'key': key,
      'value': value,
    };
  }
}

/// Summary of a DataAutomationLibrary
class DataAutomationLibrarySummary {
  final DateTime creationTime;
  final String libraryArn;
  final String? libraryName;

  DataAutomationLibrarySummary({
    required this.creationTime,
    required this.libraryArn,
    this.libraryName,
  });

  factory DataAutomationLibrarySummary.fromJson(Map<String, dynamic> json) {
    return DataAutomationLibrarySummary(
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      libraryArn: (json['libraryArn'] as String?) ?? '',
      libraryName: json['libraryName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final libraryArn = this.libraryArn;
    final libraryName = this.libraryName;
    return {
      'creationTime': iso8601ToJson(creationTime),
      'libraryArn': libraryArn,
      if (libraryName != null) 'libraryName': libraryName,
    };
  }
}

/// Data Automation Project Filter
class DataAutomationProjectFilter {
  final String projectArn;
  final DataAutomationProjectStage? projectStage;

  DataAutomationProjectFilter({
    required this.projectArn,
    this.projectStage,
  });

  Map<String, dynamic> toJson() {
    final projectArn = this.projectArn;
    final projectStage = this.projectStage;
    return {
      'projectArn': projectArn,
      if (projectStage != null) 'projectStage': projectStage.value,
    };
  }
}

/// Status of DataAutomationLibrary
class DataAutomationLibraryStatus {
  static const active = DataAutomationLibraryStatus._('ACTIVE');
  static const deleting = DataAutomationLibraryStatus._('DELETING');

  final String value;

  const DataAutomationLibraryStatus._(this.value);

  static const values = [active, deleting];

  static DataAutomationLibraryStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DataAutomationLibraryStatus._(value));

  @override
  bool operator ==(other) =>
      other is DataAutomationLibraryStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains the information of a DataAutomationLibrary.
class DataAutomationLibrary {
  final DateTime creationTime;
  final String libraryArn;
  final String libraryName;
  final DataAutomationLibraryStatus status;
  final List<EntityTypeInfo>? entityTypes;
  final Map<String, String>? kmsEncryptionContext;
  final String? kmsKeyId;
  final String? libraryDescription;

  DataAutomationLibrary({
    required this.creationTime,
    required this.libraryArn,
    required this.libraryName,
    required this.status,
    this.entityTypes,
    this.kmsEncryptionContext,
    this.kmsKeyId,
    this.libraryDescription,
  });

  factory DataAutomationLibrary.fromJson(Map<String, dynamic> json) {
    return DataAutomationLibrary(
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      libraryArn: (json['libraryArn'] as String?) ?? '',
      libraryName: (json['libraryName'] as String?) ?? '',
      status: DataAutomationLibraryStatus.fromString(
          (json['status'] as String?) ?? ''),
      entityTypes: (json['entityTypes'] as List?)
          ?.nonNulls
          .map((e) => EntityTypeInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      kmsEncryptionContext:
          (json['kmsEncryptionContext'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
      kmsKeyId: json['kmsKeyId'] as String?,
      libraryDescription: json['libraryDescription'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final libraryArn = this.libraryArn;
    final libraryName = this.libraryName;
    final status = this.status;
    final entityTypes = this.entityTypes;
    final kmsEncryptionContext = this.kmsEncryptionContext;
    final kmsKeyId = this.kmsKeyId;
    final libraryDescription = this.libraryDescription;
    return {
      'creationTime': iso8601ToJson(creationTime),
      'libraryArn': libraryArn,
      'libraryName': libraryName,
      'status': status.value,
      if (entityTypes != null) 'entityTypes': entityTypes,
      if (kmsEncryptionContext != null)
        'kmsEncryptionContext': kmsEncryptionContext,
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
      if (libraryDescription != null) 'libraryDescription': libraryDescription,
    };
  }
}

/// Information about an entity type in the DataAutomationLibrary
class EntityTypeInfo {
  final EntityType entityType;
  final String? entityMetadata;

  EntityTypeInfo({
    required this.entityType,
    this.entityMetadata,
  });

  factory EntityTypeInfo.fromJson(Map<String, dynamic> json) {
    return EntityTypeInfo(
      entityType: EntityType.fromString((json['entityType'] as String?) ?? ''),
      entityMetadata: json['entityMetadata'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final entityType = this.entityType;
    final entityMetadata = this.entityMetadata;
    return {
      'entityType': entityType.value,
      if (entityMetadata != null) 'entityMetadata': entityMetadata,
    };
  }
}

/// Entity types supported in DataAutomationLibraries
class EntityType {
  static const vocabulary = EntityType._('VOCABULARY');

  final String value;

  const EntityType._(this.value);

  static const values = [vocabulary];

  static EntityType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => EntityType._(value));

  @override
  bool operator ==(other) => other is EntityType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Summary of a DataAutomationLibraryIngestionJob
class DataAutomationLibraryIngestionJobSummary {
  final DateTime creationTime;
  final EntityType entityType;
  final String jobArn;
  final LibraryIngestionJobStatus jobStatus;
  final LibraryIngestionJobOperationType operationType;
  final DateTime? completionTime;

  DataAutomationLibraryIngestionJobSummary({
    required this.creationTime,
    required this.entityType,
    required this.jobArn,
    required this.jobStatus,
    required this.operationType,
    this.completionTime,
  });

  factory DataAutomationLibraryIngestionJobSummary.fromJson(
      Map<String, dynamic> json) {
    return DataAutomationLibraryIngestionJobSummary(
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      entityType: EntityType.fromString((json['entityType'] as String?) ?? ''),
      jobArn: (json['jobArn'] as String?) ?? '',
      jobStatus: LibraryIngestionJobStatus.fromString(
          (json['jobStatus'] as String?) ?? ''),
      operationType: LibraryIngestionJobOperationType.fromString(
          (json['operationType'] as String?) ?? ''),
      completionTime: timeStampFromJson(json['completionTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final entityType = this.entityType;
    final jobArn = this.jobArn;
    final jobStatus = this.jobStatus;
    final operationType = this.operationType;
    final completionTime = this.completionTime;
    return {
      'creationTime': iso8601ToJson(creationTime),
      'entityType': entityType.value,
      'jobArn': jobArn,
      'jobStatus': jobStatus.value,
      'operationType': operationType.value,
      if (completionTime != null)
        'completionTime': iso8601ToJson(completionTime),
    };
  }
}

/// Status of DataAutomationLibraryIngestionJob
class LibraryIngestionJobStatus {
  static const inProgress = LibraryIngestionJobStatus._('IN_PROGRESS');
  static const completed = LibraryIngestionJobStatus._('COMPLETED');
  static const completedWithErrors =
      LibraryIngestionJobStatus._('COMPLETED_WITH_ERRORS');
  static const failed = LibraryIngestionJobStatus._('FAILED');

  final String value;

  const LibraryIngestionJobStatus._(this.value);

  static const values = [inProgress, completed, completedWithErrors, failed];

  static LibraryIngestionJobStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => LibraryIngestionJobStatus._(value));

  @override
  bool operator ==(other) =>
      other is LibraryIngestionJobStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// DataAutomationLibraryIngestionJob operation type
class LibraryIngestionJobOperationType {
  static const upsert = LibraryIngestionJobOperationType._('UPSERT');
  static const delete = LibraryIngestionJobOperationType._('DELETE');

  final String value;

  const LibraryIngestionJobOperationType._(this.value);

  static const values = [upsert, delete];

  static LibraryIngestionJobOperationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => LibraryIngestionJobOperationType._(value));

  @override
  bool operator ==(other) =>
      other is LibraryIngestionJobOperationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains the information of a DataAutomationLibraryIngestionJob
class DataAutomationLibraryIngestionJob {
  /// Timestamp when the DataAutomationLibraryIngestionJob was created
  final DateTime creationTime;

  /// The entity type associated with DataAutomationLibraryIngestionJob
  final EntityType entityType;

  /// ARN of the DataAutomationLibraryIngestionJob
  final String jobArn;

  /// The status of the DataAutomationLibraryIngestionJob
  final LibraryIngestionJobStatus jobStatus;

  /// The operation associated with DataAutomationLibraryIngestionJob
  final LibraryIngestionJobOperationType operationType;

  /// Output configuration of DataAutomationLibraryIngestionJob
  final OutputConfiguration outputConfiguration;

  /// Timestamp when the DataAutomationLibraryIngestionJob was completed
  final DateTime? completionTime;

  /// Error message
  final String? errorMessage;

  /// Error type
  final String? errorType;

  DataAutomationLibraryIngestionJob({
    required this.creationTime,
    required this.entityType,
    required this.jobArn,
    required this.jobStatus,
    required this.operationType,
    required this.outputConfiguration,
    this.completionTime,
    this.errorMessage,
    this.errorType,
  });

  factory DataAutomationLibraryIngestionJob.fromJson(
      Map<String, dynamic> json) {
    return DataAutomationLibraryIngestionJob(
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      entityType: EntityType.fromString((json['entityType'] as String?) ?? ''),
      jobArn: (json['jobArn'] as String?) ?? '',
      jobStatus: LibraryIngestionJobStatus.fromString(
          (json['jobStatus'] as String?) ?? ''),
      operationType: LibraryIngestionJobOperationType.fromString(
          (json['operationType'] as String?) ?? ''),
      outputConfiguration: OutputConfiguration.fromJson(
          (json['outputConfiguration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      completionTime: timeStampFromJson(json['completionTime']),
      errorMessage: json['errorMessage'] as String?,
      errorType: json['errorType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final entityType = this.entityType;
    final jobArn = this.jobArn;
    final jobStatus = this.jobStatus;
    final operationType = this.operationType;
    final outputConfiguration = this.outputConfiguration;
    final completionTime = this.completionTime;
    final errorMessage = this.errorMessage;
    final errorType = this.errorType;
    return {
      'creationTime': iso8601ToJson(creationTime),
      'entityType': entityType.value,
      'jobArn': jobArn,
      'jobStatus': jobStatus.value,
      'operationType': operationType.value,
      'outputConfiguration': outputConfiguration,
      if (completionTime != null)
        'completionTime': iso8601ToJson(completionTime),
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (errorType != null) 'errorType': errorType,
    };
  }
}

/// Output configuration for DataAutomationLibraryIngestionJob
class OutputConfiguration {
  /// S3 Uri
  final String s3Uri;

  OutputConfiguration({
    required this.s3Uri,
  });

  factory OutputConfiguration.fromJson(Map<String, dynamic> json) {
    return OutputConfiguration(
      s3Uri: (json['s3Uri'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final s3Uri = this.s3Uri;
    return {
      's3Uri': s3Uri,
    };
  }
}

/// Input configuration for DataAutomationLibraryIngestionJob
class InputConfiguration {
  /// Input Payload
  final InlinePayload? inlinePayload;

  /// S3 object
  final S3Object? s3Object;

  InputConfiguration({
    this.inlinePayload,
    this.s3Object,
  });

  Map<String, dynamic> toJson() {
    final inlinePayload = this.inlinePayload;
    final s3Object = this.s3Object;
    return {
      if (inlinePayload != null) 'inlinePayload': inlinePayload,
      if (s3Object != null) 's3Object': s3Object,
    };
  }
}

/// Notification configuration.
class NotificationConfiguration {
  /// Event bridge configuration.
  final EventBridgeConfiguration eventBridgeConfiguration;

  NotificationConfiguration({
    required this.eventBridgeConfiguration,
  });

  Map<String, dynamic> toJson() {
    final eventBridgeConfiguration = this.eventBridgeConfiguration;
    return {
      'eventBridgeConfiguration': eventBridgeConfiguration,
    };
  }
}

/// Event bridge configuration.
class EventBridgeConfiguration {
  /// Event bridge flag.
  final bool eventBridgeEnabled;

  EventBridgeConfiguration({
    required this.eventBridgeEnabled,
  });

  Map<String, dynamic> toJson() {
    final eventBridgeEnabled = this.eventBridgeEnabled;
    return {
      'eventBridgeEnabled': eventBridgeEnabled,
    };
  }
}

/// S3 object
class S3Object {
  /// S3 uri.
  final String s3Uri;

  /// S3 object version.
  final String? version;

  S3Object({
    required this.s3Uri,
    this.version,
  });

  factory S3Object.fromJson(Map<String, dynamic> json) {
    return S3Object(
      s3Uri: (json['s3Uri'] as String?) ?? '',
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Uri = this.s3Uri;
    final version = this.version;
    return {
      's3Uri': s3Uri,
      if (version != null) 'version': version,
    };
  }
}

/// Input payload structure definition
class InlinePayload {
  final DeleteEntitiesInfo? deleteEntitiesInfo;
  final List<UpsertEntityInfo>? upsertEntitiesInfo;

  InlinePayload({
    this.deleteEntitiesInfo,
    this.upsertEntitiesInfo,
  });

  Map<String, dynamic> toJson() {
    final deleteEntitiesInfo = this.deleteEntitiesInfo;
    final upsertEntitiesInfo = this.upsertEntitiesInfo;
    return {
      if (deleteEntitiesInfo != null) 'deleteEntitiesInfo': deleteEntitiesInfo,
      if (upsertEntitiesInfo != null) 'upsertEntitiesInfo': upsertEntitiesInfo,
    };
  }
}

/// Input for entities needed to be deleted
class DeleteEntitiesInfo {
  final List<String> entityIds;

  DeleteEntitiesInfo({
    required this.entityIds,
  });

  Map<String, dynamic> toJson() {
    final entityIds = this.entityIds;
    return {
      'entityIds': entityIds,
    };
  }
}

/// Input configuration for upserting data in a
/// DataAutomationLibraryIngestionJob
class UpsertEntityInfo {
  final VocabularyEntityInfo? vocabulary;

  UpsertEntityInfo({
    this.vocabulary,
  });

  Map<String, dynamic> toJson() {
    final vocabulary = this.vocabulary;
    return {
      if (vocabulary != null) 'vocabulary': vocabulary,
    };
  }
}

/// Vocabulary entity info with detailed information
class VocabularyEntityInfo {
  final Language language;
  final List<Phrase> phrases;
  final String? description;
  final String? entityId;

  VocabularyEntityInfo({
    required this.language,
    required this.phrases,
    this.description,
    this.entityId,
  });

  Map<String, dynamic> toJson() {
    final language = this.language;
    final phrases = this.phrases;
    final description = this.description;
    final entityId = this.entityId;
    return {
      'language': language.value,
      'phrases': phrases,
      if (description != null) 'description': description,
      if (entityId != null) 'entityId': entityId,
    };
  }
}

/// Phrase structure for vocabulary
class Phrase {
  final String text;
  final String? displayAsText;

  Phrase({
    required this.text,
    this.displayAsText,
  });

  factory Phrase.fromJson(Map<String, dynamic> json) {
    return Phrase(
      text: (json['text'] as String?) ?? '',
      displayAsText: json['displayAsText'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final text = this.text;
    final displayAsText = this.displayAsText;
    return {
      'text': text,
      if (displayAsText != null) 'displayAsText': displayAsText,
    };
  }
}

/// Summary of a Blueprint
class BlueprintSummary {
  final String blueprintArn;
  final DateTime creationTime;
  final String? blueprintName;
  final BlueprintStage? blueprintStage;
  final String? blueprintVersion;
  final DateTime? lastModifiedTime;

  BlueprintSummary({
    required this.blueprintArn,
    required this.creationTime,
    this.blueprintName,
    this.blueprintStage,
    this.blueprintVersion,
    this.lastModifiedTime,
  });

  factory BlueprintSummary.fromJson(Map<String, dynamic> json) {
    return BlueprintSummary(
      blueprintArn: (json['blueprintArn'] as String?) ?? '',
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      blueprintName: json['blueprintName'] as String?,
      blueprintStage:
          (json['blueprintStage'] as String?)?.let(BlueprintStage.fromString),
      blueprintVersion: json['blueprintVersion'] as String?,
      lastModifiedTime: timeStampFromJson(json['lastModifiedTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final blueprintArn = this.blueprintArn;
    final creationTime = this.creationTime;
    final blueprintName = this.blueprintName;
    final blueprintStage = this.blueprintStage;
    final blueprintVersion = this.blueprintVersion;
    final lastModifiedTime = this.lastModifiedTime;
    return {
      'blueprintArn': blueprintArn,
      'creationTime': iso8601ToJson(creationTime),
      if (blueprintName != null) 'blueprintName': blueprintName,
      if (blueprintStage != null) 'blueprintStage': blueprintStage.value,
      if (blueprintVersion != null) 'blueprintVersion': blueprintVersion,
      if (lastModifiedTime != null)
        'lastModifiedTime': iso8601ToJson(lastModifiedTime),
    };
  }
}

/// Blueprint Stage filter
class BlueprintStageFilter {
  static const development = BlueprintStageFilter._('DEVELOPMENT');
  static const live = BlueprintStageFilter._('LIVE');
  static const all = BlueprintStageFilter._('ALL');

  final String value;

  const BlueprintStageFilter._(this.value);

  static const values = [development, live, all];

  static BlueprintStageFilter fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => BlueprintStageFilter._(value));

  @override
  bool operator ==(other) =>
      other is BlueprintStageFilter && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains the information of a Blueprint.
class Blueprint {
  final String blueprintArn;
  final String blueprintName;
  final DateTime creationTime;
  final DateTime lastModifiedTime;
  final String schema;
  final Type type;
  final BlueprintStage? blueprintStage;
  final String? blueprintVersion;
  final Map<String, String>? kmsEncryptionContext;
  final String? kmsKeyId;
  final List<BlueprintOptimizationSample>? optimizationSamples;
  final DateTime? optimizationTime;

  Blueprint({
    required this.blueprintArn,
    required this.blueprintName,
    required this.creationTime,
    required this.lastModifiedTime,
    required this.schema,
    required this.type,
    this.blueprintStage,
    this.blueprintVersion,
    this.kmsEncryptionContext,
    this.kmsKeyId,
    this.optimizationSamples,
    this.optimizationTime,
  });

  factory Blueprint.fromJson(Map<String, dynamic> json) {
    return Blueprint(
      blueprintArn: (json['blueprintArn'] as String?) ?? '',
      blueprintName: (json['blueprintName'] as String?) ?? '',
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      lastModifiedTime:
          nonNullableTimeStampFromJson(json['lastModifiedTime'] ?? 0),
      schema: (json['schema'] as String?) ?? '',
      type: Type.fromString((json['type'] as String?) ?? ''),
      blueprintStage:
          (json['blueprintStage'] as String?)?.let(BlueprintStage.fromString),
      blueprintVersion: json['blueprintVersion'] as String?,
      kmsEncryptionContext:
          (json['kmsEncryptionContext'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
      kmsKeyId: json['kmsKeyId'] as String?,
      optimizationSamples: (json['optimizationSamples'] as List?)
          ?.nonNulls
          .map((e) =>
              BlueprintOptimizationSample.fromJson(e as Map<String, dynamic>))
          .toList(),
      optimizationTime: timeStampFromJson(json['optimizationTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final blueprintArn = this.blueprintArn;
    final blueprintName = this.blueprintName;
    final creationTime = this.creationTime;
    final lastModifiedTime = this.lastModifiedTime;
    final schema = this.schema;
    final type = this.type;
    final blueprintStage = this.blueprintStage;
    final blueprintVersion = this.blueprintVersion;
    final kmsEncryptionContext = this.kmsEncryptionContext;
    final kmsKeyId = this.kmsKeyId;
    final optimizationSamples = this.optimizationSamples;
    final optimizationTime = this.optimizationTime;
    return {
      'blueprintArn': blueprintArn,
      'blueprintName': blueprintName,
      'creationTime': iso8601ToJson(creationTime),
      'lastModifiedTime': iso8601ToJson(lastModifiedTime),
      'schema': schema,
      'type': type.value,
      if (blueprintStage != null) 'blueprintStage': blueprintStage.value,
      if (blueprintVersion != null) 'blueprintVersion': blueprintVersion,
      if (kmsEncryptionContext != null)
        'kmsEncryptionContext': kmsEncryptionContext,
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
      if (optimizationSamples != null)
        'optimizationSamples': optimizationSamples,
      if (optimizationTime != null)
        'optimizationTime': iso8601ToJson(optimizationTime),
    };
  }
}

/// Type
class Type {
  static const document = Type._('DOCUMENT');
  static const image = Type._('IMAGE');
  static const audio = Type._('AUDIO');
  static const video = Type._('VIDEO');

  final String value;

  const Type._(this.value);

  static const values = [document, image, audio, video];

  static Type fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Type._(value));

  @override
  bool operator ==(other) => other is Type && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Blueprint Recommendation Sample
class BlueprintOptimizationSample {
  /// S3 Object of the asset
  final S3Object assetS3Object;

  /// Ground truth for the Blueprint and Asset combination
  final S3Object groundTruthS3Object;

  BlueprintOptimizationSample({
    required this.assetS3Object,
    required this.groundTruthS3Object,
  });

  factory BlueprintOptimizationSample.fromJson(Map<String, dynamic> json) {
    return BlueprintOptimizationSample(
      assetS3Object: S3Object.fromJson(
          (json['assetS3Object'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      groundTruthS3Object: S3Object.fromJson(
          (json['groundTruthS3Object'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final assetS3Object = this.assetS3Object;
    final groundTruthS3Object = this.groundTruthS3Object;
    return {
      'assetS3Object': assetS3Object,
      'groundTruthS3Object': groundTruthS3Object,
    };
  }
}

/// List of status supported by optimization jobs
class BlueprintOptimizationJobStatus {
  static const created = BlueprintOptimizationJobStatus._('Created');
  static const inProgress = BlueprintOptimizationJobStatus._('InProgress');
  static const success = BlueprintOptimizationJobStatus._('Success');
  static const serviceError = BlueprintOptimizationJobStatus._('ServiceError');
  static const clientError = BlueprintOptimizationJobStatus._('ClientError');

  final String value;

  const BlueprintOptimizationJobStatus._(this.value);

  static const values = [
    created,
    inProgress,
    success,
    serviceError,
    clientError
  ];

  static BlueprintOptimizationJobStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => BlueprintOptimizationJobStatus._(value));

  @override
  bool operator ==(other) =>
      other is BlueprintOptimizationJobStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Blueprint Optimization Output configuration.
class BlueprintOptimizationOutputConfiguration {
  /// S3 object.
  final S3Object s3Object;

  BlueprintOptimizationOutputConfiguration({
    required this.s3Object,
  });

  factory BlueprintOptimizationOutputConfiguration.fromJson(
      Map<String, dynamic> json) {
    return BlueprintOptimizationOutputConfiguration(
      s3Object: S3Object.fromJson((json['s3Object'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final s3Object = this.s3Object;
    return {
      's3Object': s3Object,
    };
  }
}

/// Structure for single blueprint entity.
class BlueprintOptimizationObject {
  /// Arn of blueprint.
  final String blueprintArn;

  /// Stage of blueprint.
  final BlueprintStage? stage;

  BlueprintOptimizationObject({
    required this.blueprintArn,
    this.stage,
  });

  Map<String, dynamic> toJson() {
    final blueprintArn = this.blueprintArn;
    final stage = this.stage;
    return {
      'blueprintArn': blueprintArn,
      if (stage != null) 'stage': stage.value,
    };
  }
}

/// Summarized information about an entity
class DataAutomationLibraryEntitySummary {
  final VocabularyEntitySummary? vocabulary;

  DataAutomationLibraryEntitySummary({
    this.vocabulary,
  });

  factory DataAutomationLibraryEntitySummary.fromJson(
      Map<String, dynamic> json) {
    return DataAutomationLibraryEntitySummary(
      vocabulary: json['vocabulary'] != null
          ? VocabularyEntitySummary.fromJson(
              json['vocabulary'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final vocabulary = this.vocabulary;
    return {
      if (vocabulary != null) 'vocabulary': vocabulary,
    };
  }
}

/// Summary of a Vocabulary entity
class VocabularyEntitySummary {
  final String? description;
  final String? entityId;
  final Language? language;
  final DateTime? lastModifiedTime;

  /// num of phrases in the entity
  final int? numOfPhrases;

  VocabularyEntitySummary({
    this.description,
    this.entityId,
    this.language,
    this.lastModifiedTime,
    this.numOfPhrases,
  });

  factory VocabularyEntitySummary.fromJson(Map<String, dynamic> json) {
    return VocabularyEntitySummary(
      description: json['description'] as String?,
      entityId: json['entityId'] as String?,
      language: (json['language'] as String?)?.let(Language.fromString),
      lastModifiedTime: timeStampFromJson(json['lastModifiedTime']),
      numOfPhrases: json['numOfPhrases'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final entityId = this.entityId;
    final language = this.language;
    final lastModifiedTime = this.lastModifiedTime;
    final numOfPhrases = this.numOfPhrases;
    return {
      if (description != null) 'description': description,
      if (entityId != null) 'entityId': entityId,
      if (language != null) 'language': language.value,
      if (lastModifiedTime != null)
        'lastModifiedTime': iso8601ToJson(lastModifiedTime),
      if (numOfPhrases != null) 'numOfPhrases': numOfPhrases,
    };
  }
}

/// Detailed information about an entity
class EntityDetails {
  final VocabularyEntity? vocabulary;

  EntityDetails({
    this.vocabulary,
  });

  factory EntityDetails.fromJson(Map<String, dynamic> json) {
    return EntityDetails(
      vocabulary: json['vocabulary'] != null
          ? VocabularyEntity.fromJson(
              json['vocabulary'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final vocabulary = this.vocabulary;
    return {
      if (vocabulary != null) 'vocabulary': vocabulary,
    };
  }
}

/// Vocabulary entity with detailed information
class VocabularyEntity {
  final String? description;
  final String? entityId;
  final Language? language;
  final DateTime? lastModifiedTime;
  final List<Phrase>? phrases;

  VocabularyEntity({
    this.description,
    this.entityId,
    this.language,
    this.lastModifiedTime,
    this.phrases,
  });

  factory VocabularyEntity.fromJson(Map<String, dynamic> json) {
    return VocabularyEntity(
      description: json['description'] as String?,
      entityId: json['entityId'] as String?,
      language: (json['language'] as String?)?.let(Language.fromString),
      lastModifiedTime: timeStampFromJson(json['lastModifiedTime']),
      phrases: (json['phrases'] as List?)
          ?.nonNulls
          .map((e) => Phrase.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final entityId = this.entityId;
    final language = this.language;
    final lastModifiedTime = this.lastModifiedTime;
    final phrases = this.phrases;
    return {
      if (description != null) 'description': description,
      if (entityId != null) 'entityId': entityId,
      if (language != null) 'language': language.value,
      if (lastModifiedTime != null)
        'lastModifiedTime': iso8601ToJson(lastModifiedTime),
      if (phrases != null) 'phrases': phrases,
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
