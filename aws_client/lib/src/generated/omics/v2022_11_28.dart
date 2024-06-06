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

/// This is the <i>AWS HealthOmics API Reference</i>. For an introduction to the
/// service, see <a href="https://docs.aws.amazon.com/omics/latest/dev/">What is
/// AWS HealthOmics?</a> in the <i>AWS HealthOmics User Guide</i>.
class Omics {
  final _s.RestJsonProtocol _protocol;
  Omics({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'omics',
            signingName: 'omics',
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

  /// Stops a multipart upload.
  ///
  /// May throw [InternalServerException].
  /// May throw [NotSupportedOperationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [RequestTimeoutException].
  ///
  /// Parameter [sequenceStoreId] :
  /// The sequence store ID for the store involved in the multipart upload.
  ///
  /// Parameter [uploadId] :
  /// The ID for the multipart upload.
  Future<void> abortMultipartReadSetUpload({
    required String sequenceStoreId,
    required String uploadId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/sequencestore/${Uri.encodeComponent(sequenceStoreId)}/upload/${Uri.encodeComponent(uploadId)}/abort',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Accept a resource share request.
  ///
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [shareId] :
  /// The ID of the resource share.
  Future<AcceptShareResponse> acceptShare({
    required String shareId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/share/${Uri.encodeComponent(shareId)}',
      exceptionFnMap: _exceptionFns,
    );
    return AcceptShareResponse.fromJson(response);
  }

  /// Deletes one or more read sets.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [RequestTimeoutException].
  ///
  /// Parameter [ids] :
  /// The read sets' IDs.
  ///
  /// Parameter [sequenceStoreId] :
  /// The read sets' sequence store ID.
  Future<BatchDeleteReadSetResponse> batchDeleteReadSet({
    required List<String> ids,
    required String sequenceStoreId,
  }) async {
    final $payload = <String, dynamic>{
      'ids': ids,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/sequencestore/${Uri.encodeComponent(sequenceStoreId)}/readset/batch/delete',
      exceptionFnMap: _exceptionFns,
    );
    return BatchDeleteReadSetResponse.fromJson(response);
  }

  /// Cancels an annotation import job.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [jobId] :
  /// The job's ID.
  Future<void> cancelAnnotationImportJob({
    required String jobId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/import/annotation/${Uri.encodeComponent(jobId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Cancels a run.
  ///
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [RequestTimeoutException].
  ///
  /// Parameter [id] :
  /// The run's ID.
  Future<void> cancelRun({
    required String id,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/run/${Uri.encodeComponent(id)}/cancel',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Cancels a variant import job.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [jobId] :
  /// The job's ID.
  Future<void> cancelVariantImportJob({
    required String jobId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/import/variant/${Uri.encodeComponent(jobId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Concludes a multipart upload once you have uploaded all the components.
  ///
  /// May throw [InternalServerException].
  /// May throw [NotSupportedOperationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [RequestTimeoutException].
  ///
  /// Parameter [parts] :
  /// The individual uploads or parts of a multipart upload.
  ///
  /// Parameter [sequenceStoreId] :
  /// The sequence store ID for the store involved in the multipart upload.
  ///
  /// Parameter [uploadId] :
  /// The ID for the multipart upload.
  Future<CompleteMultipartReadSetUploadResponse>
      completeMultipartReadSetUpload({
    required List<CompleteReadSetUploadPartListItem> parts,
    required String sequenceStoreId,
    required String uploadId,
  }) async {
    final $payload = <String, dynamic>{
      'parts': parts,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/sequencestore/${Uri.encodeComponent(sequenceStoreId)}/upload/${Uri.encodeComponent(uploadId)}/complete',
      exceptionFnMap: _exceptionFns,
    );
    return CompleteMultipartReadSetUploadResponse.fromJson(response);
  }

  /// Creates an annotation store.
  ///
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [storeFormat] :
  /// The annotation file format of the store.
  ///
  /// Parameter [description] :
  /// A description for the store.
  ///
  /// Parameter [name] :
  /// A name for the store.
  ///
  /// Parameter [reference] :
  /// The genome reference for the store's annotations.
  ///
  /// Parameter [sseConfig] :
  /// Server-side encryption (SSE) settings for the store.
  ///
  /// Parameter [storeOptions] :
  /// File parsing options for the annotation store.
  ///
  /// Parameter [tags] :
  /// Tags for the store.
  ///
  /// Parameter [versionName] :
  /// The name given to an annotation store version to distinguish it from other
  /// versions.
  Future<CreateAnnotationStoreResponse> createAnnotationStore({
    required StoreFormat storeFormat,
    String? description,
    String? name,
    ReferenceItem? reference,
    SseConfig? sseConfig,
    StoreOptions? storeOptions,
    Map<String, String>? tags,
    String? versionName,
  }) async {
    final $payload = <String, dynamic>{
      'storeFormat': storeFormat.toValue(),
      if (description != null) 'description': description,
      if (name != null) 'name': name,
      if (reference != null) 'reference': reference,
      if (sseConfig != null) 'sseConfig': sseConfig,
      if (storeOptions != null) 'storeOptions': storeOptions,
      if (tags != null) 'tags': tags,
      if (versionName != null) 'versionName': versionName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/annotationStore',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAnnotationStoreResponse.fromJson(response);
  }

  /// Creates a new version of an annotation store.
  ///
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The name of an annotation store version from which versions are being
  /// created.
  ///
  /// Parameter [versionName] :
  /// The name given to an annotation store version to distinguish it from other
  /// versions.
  ///
  /// Parameter [description] :
  /// The description of an annotation store version.
  ///
  /// Parameter [tags] :
  /// Any tags added to annotation store version.
  ///
  /// Parameter [versionOptions] :
  /// The options for an annotation store version.
  Future<CreateAnnotationStoreVersionResponse> createAnnotationStoreVersion({
    required String name,
    required String versionName,
    String? description,
    Map<String, String>? tags,
    VersionOptions? versionOptions,
  }) async {
    final $payload = <String, dynamic>{
      'versionName': versionName,
      if (description != null) 'description': description,
      if (tags != null) 'tags': tags,
      if (versionOptions != null) 'versionOptions': versionOptions,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/annotationStore/${Uri.encodeComponent(name)}/version',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAnnotationStoreVersionResponse.fromJson(response);
  }

  /// Begins a multipart read set upload.
  ///
  /// May throw [InternalServerException].
  /// May throw [NotSupportedOperationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [RequestTimeoutException].
  ///
  /// Parameter [name] :
  /// The name of the read set.
  ///
  /// Parameter [sampleId] :
  /// The source's sample ID.
  ///
  /// Parameter [sequenceStoreId] :
  /// The sequence store ID for the store that is the destination of the
  /// multipart uploads.
  ///
  /// Parameter [sourceFileType] :
  /// The type of file being uploaded.
  ///
  /// Parameter [subjectId] :
  /// The source's subject ID.
  ///
  /// Parameter [clientToken] :
  /// An idempotency token that can be used to avoid triggering multiple
  /// multipart uploads.
  ///
  /// Parameter [description] :
  /// The description of the read set.
  ///
  /// Parameter [generatedFrom] :
  /// Where the source originated.
  ///
  /// Parameter [referenceArn] :
  /// The ARN of the reference.
  ///
  /// Parameter [tags] :
  /// Any tags to add to the read set.
  Future<CreateMultipartReadSetUploadResponse> createMultipartReadSetUpload({
    required String name,
    required String sampleId,
    required String sequenceStoreId,
    required FileType sourceFileType,
    required String subjectId,
    String? clientToken,
    String? description,
    String? generatedFrom,
    String? referenceArn,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      'sampleId': sampleId,
      'sourceFileType': sourceFileType.toValue(),
      'subjectId': subjectId,
      if (clientToken != null) 'clientToken': clientToken,
      if (description != null) 'description': description,
      if (generatedFrom != null) 'generatedFrom': generatedFrom,
      if (referenceArn != null) 'referenceArn': referenceArn,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/sequencestore/${Uri.encodeComponent(sequenceStoreId)}/upload',
      exceptionFnMap: _exceptionFns,
    );
    return CreateMultipartReadSetUploadResponse.fromJson(response);
  }

  /// Creates a reference store.
  ///
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [RequestTimeoutException].
  ///
  /// Parameter [name] :
  /// A name for the store.
  ///
  /// Parameter [clientToken] :
  /// To ensure that requests don't run multiple times, specify a unique token
  /// for each request.
  ///
  /// Parameter [description] :
  /// A description for the store.
  ///
  /// Parameter [sseConfig] :
  /// Server-side encryption (SSE) settings for the store.
  ///
  /// Parameter [tags] :
  /// Tags for the store.
  Future<CreateReferenceStoreResponse> createReferenceStore({
    required String name,
    String? clientToken,
    String? description,
    SseConfig? sseConfig,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      if (clientToken != null) 'clientToken': clientToken,
      if (description != null) 'description': description,
      if (sseConfig != null) 'sseConfig': sseConfig,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/referencestore',
      exceptionFnMap: _exceptionFns,
    );
    return CreateReferenceStoreResponse.fromJson(response);
  }

  /// Creates a run group.
  ///
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [RequestTimeoutException].
  ///
  /// Parameter [maxCpus] :
  /// The maximum number of CPUs to use in the group.
  ///
  /// Parameter [maxDuration] :
  /// A maximum run time for the group in minutes.
  ///
  /// Parameter [maxGpus] :
  /// The maximum GPUs that can be used by a run group.
  ///
  /// Parameter [maxRuns] :
  /// The maximum number of concurrent runs for the group.
  ///
  /// Parameter [name] :
  /// A name for the group.
  ///
  /// Parameter [requestId] :
  /// To ensure that requests don't run multiple times, specify a unique ID for
  /// each request.
  ///
  /// Parameter [tags] :
  /// Tags for the group.
  Future<CreateRunGroupResponse> createRunGroup({
    int? maxCpus,
    int? maxDuration,
    int? maxGpus,
    int? maxRuns,
    String? name,
    String? requestId,
    Map<String, String>? tags,
  }) async {
    _s.validateNumRange(
      'maxCpus',
      maxCpus,
      1,
      100000,
    );
    _s.validateNumRange(
      'maxDuration',
      maxDuration,
      1,
      100000,
    );
    _s.validateNumRange(
      'maxGpus',
      maxGpus,
      1,
      100000,
    );
    _s.validateNumRange(
      'maxRuns',
      maxRuns,
      1,
      100000,
    );
    final $payload = <String, dynamic>{
      if (maxCpus != null) 'maxCpus': maxCpus,
      if (maxDuration != null) 'maxDuration': maxDuration,
      if (maxGpus != null) 'maxGpus': maxGpus,
      if (maxRuns != null) 'maxRuns': maxRuns,
      if (name != null) 'name': name,
      'requestId': requestId ?? _s.generateIdempotencyToken(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/runGroup',
      exceptionFnMap: _exceptionFns,
    );
    return CreateRunGroupResponse.fromJson(response);
  }

  /// Creates a sequence store.
  ///
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [RequestTimeoutException].
  ///
  /// Parameter [name] :
  /// A name for the store.
  ///
  /// Parameter [clientToken] :
  /// To ensure that requests don't run multiple times, specify a unique token
  /// for each request.
  ///
  /// Parameter [description] :
  /// A description for the store.
  ///
  /// Parameter [eTagAlgorithmFamily] :
  /// The ETag algorithm family to use for ingested read sets.
  ///
  /// Parameter [fallbackLocation] :
  /// An S3 location that is used to store files that have failed a direct
  /// upload.
  ///
  /// Parameter [sseConfig] :
  /// Server-side encryption (SSE) settings for the store.
  ///
  /// Parameter [tags] :
  /// Tags for the store.
  Future<CreateSequenceStoreResponse> createSequenceStore({
    required String name,
    String? clientToken,
    String? description,
    ETagAlgorithmFamily? eTagAlgorithmFamily,
    String? fallbackLocation,
    SseConfig? sseConfig,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      if (clientToken != null) 'clientToken': clientToken,
      if (description != null) 'description': description,
      if (eTagAlgorithmFamily != null)
        'eTagAlgorithmFamily': eTagAlgorithmFamily.toValue(),
      if (fallbackLocation != null) 'fallbackLocation': fallbackLocation,
      if (sseConfig != null) 'sseConfig': sseConfig,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/sequencestore',
      exceptionFnMap: _exceptionFns,
    );
    return CreateSequenceStoreResponse.fromJson(response);
  }

  /// Creates a cross-account shared resource. The resource owner makes an offer
  /// to share the resource with the principal subscriber (an AWS user with a
  /// different account than the resource owner).
  ///
  /// The following resources support cross-account sharing:
  ///
  /// <ul>
  /// <li>
  /// Healthomics variant stores
  /// </li>
  /// <li>
  /// Healthomics annotation stores
  /// </li>
  /// <li>
  /// Private workflows
  /// </li>
  /// </ul>
  ///
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [principalSubscriber] :
  /// The principal subscriber is the account being offered shared access to the
  /// resource.
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource to be shared.
  ///
  /// Parameter [shareName] :
  /// A name that the owner defines for the share.
  Future<CreateShareResponse> createShare({
    required String principalSubscriber,
    required String resourceArn,
    String? shareName,
  }) async {
    final $payload = <String, dynamic>{
      'principalSubscriber': principalSubscriber,
      'resourceArn': resourceArn,
      if (shareName != null) 'shareName': shareName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/share',
      exceptionFnMap: _exceptionFns,
    );
    return CreateShareResponse.fromJson(response);
  }

  /// Creates a variant store.
  ///
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [reference] :
  /// The genome reference for the store's variants.
  ///
  /// Parameter [description] :
  /// A description for the store.
  ///
  /// Parameter [name] :
  /// A name for the store.
  ///
  /// Parameter [sseConfig] :
  /// Server-side encryption (SSE) settings for the store.
  ///
  /// Parameter [tags] :
  /// Tags for the store.
  Future<CreateVariantStoreResponse> createVariantStore({
    required ReferenceItem reference,
    String? description,
    String? name,
    SseConfig? sseConfig,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'reference': reference,
      if (description != null) 'description': description,
      if (name != null) 'name': name,
      if (sseConfig != null) 'sseConfig': sseConfig,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/variantStore',
      exceptionFnMap: _exceptionFns,
    );
    return CreateVariantStoreResponse.fromJson(response);
  }

  /// Creates a workflow.
  ///
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [RequestTimeoutException].
  ///
  /// Parameter [accelerators] :
  /// The computational accelerator specified to run the workflow.
  ///
  /// Parameter [definitionUri] :
  /// The URI of a definition for the workflow.
  ///
  /// Parameter [definitionZip] :
  /// A ZIP archive for the workflow.
  ///
  /// Parameter [description] :
  /// A description for the workflow.
  ///
  /// Parameter [engine] :
  /// An engine for the workflow.
  ///
  /// Parameter [main] :
  /// The path of the main definition file for the workflow.
  ///
  /// Parameter [name] :
  /// A name for the workflow.
  ///
  /// Parameter [parameterTemplate] :
  /// A parameter template for the workflow.
  ///
  /// Parameter [requestId] :
  /// To ensure that requests don't run multiple times, specify a unique ID for
  /// each request.
  ///
  /// Parameter [storageCapacity] :
  /// The storage capacity for the workflow in gibibytes.
  ///
  /// Parameter [tags] :
  /// Tags for the workflow.
  Future<CreateWorkflowResponse> createWorkflow({
    Accelerators? accelerators,
    String? definitionUri,
    Uint8List? definitionZip,
    String? description,
    WorkflowEngine? engine,
    String? main,
    String? name,
    Map<String, WorkflowParameter>? parameterTemplate,
    String? requestId,
    int? storageCapacity,
    Map<String, String>? tags,
  }) async {
    _s.validateNumRange(
      'storageCapacity',
      storageCapacity,
      0,
      100000,
    );
    final $payload = <String, dynamic>{
      if (accelerators != null) 'accelerators': accelerators.toValue(),
      if (definitionUri != null) 'definitionUri': definitionUri,
      if (definitionZip != null) 'definitionZip': base64Encode(definitionZip),
      if (description != null) 'description': description,
      if (engine != null) 'engine': engine.toValue(),
      if (main != null) 'main': main,
      if (name != null) 'name': name,
      if (parameterTemplate != null) 'parameterTemplate': parameterTemplate,
      'requestId': requestId ?? _s.generateIdempotencyToken(),
      if (storageCapacity != null) 'storageCapacity': storageCapacity,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/workflow',
      exceptionFnMap: _exceptionFns,
    );
    return CreateWorkflowResponse.fromJson(response);
  }

  /// Deletes an annotation store.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The store's name.
  ///
  /// Parameter [force] :
  /// Whether to force deletion.
  Future<DeleteAnnotationStoreResponse> deleteAnnotationStore({
    required String name,
    bool? force,
  }) async {
    final $query = <String, List<String>>{
      if (force != null) 'force': [force.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/annotationStore/${Uri.encodeComponent(name)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteAnnotationStoreResponse.fromJson(response);
  }

  /// Deletes one or multiple versions of an annotation store.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The name of the annotation store from which versions are being deleted.
  ///
  /// Parameter [versions] :
  /// The versions of an annotation store to be deleted.
  ///
  /// Parameter [force] :
  /// Forces the deletion of an annotation store version when imports are
  /// in-progress..
  Future<DeleteAnnotationStoreVersionsResponse> deleteAnnotationStoreVersions({
    required String name,
    required List<String> versions,
    bool? force,
  }) async {
    final $query = <String, List<String>>{
      if (force != null) 'force': [force.toString()],
    };
    final $payload = <String, dynamic>{
      'versions': versions,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/annotationStore/${Uri.encodeComponent(name)}/versions/delete',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteAnnotationStoreVersionsResponse.fromJson(response);
  }

  /// Deletes a genome reference.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [RequestTimeoutException].
  ///
  /// Parameter [id] :
  /// The reference's ID.
  ///
  /// Parameter [referenceStoreId] :
  /// The reference's store ID.
  Future<void> deleteReference({
    required String id,
    required String referenceStoreId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/referencestore/${Uri.encodeComponent(referenceStoreId)}/reference/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a genome reference store.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [RequestTimeoutException].
  ///
  /// Parameter [id] :
  /// The store's ID.
  Future<void> deleteReferenceStore({
    required String id,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/referencestore/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a workflow run.
  ///
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [RequestTimeoutException].
  ///
  /// Parameter [id] :
  /// The run's ID.
  Future<void> deleteRun({
    required String id,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/run/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a workflow run group.
  ///
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [RequestTimeoutException].
  ///
  /// Parameter [id] :
  /// The run group's ID.
  Future<void> deleteRunGroup({
    required String id,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/runGroup/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a sequence store.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [RequestTimeoutException].
  ///
  /// Parameter [id] :
  /// The sequence store's ID.
  Future<void> deleteSequenceStore({
    required String id,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/sequencestore/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a resource share. If you are the resource owner, the subscriber
  /// will no longer have access to the shared resource. If you are the
  /// subscriber, this operation deletes your access to the share.
  ///
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [shareId] :
  /// The ID for the resource share to be deleted.
  Future<DeleteShareResponse> deleteShare({
    required String shareId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/share/${Uri.encodeComponent(shareId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteShareResponse.fromJson(response);
  }

  /// Deletes a variant store.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The store's name.
  ///
  /// Parameter [force] :
  /// Whether to force deletion.
  Future<DeleteVariantStoreResponse> deleteVariantStore({
    required String name,
    bool? force,
  }) async {
    final $query = <String, List<String>>{
      if (force != null) 'force': [force.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/variantStore/${Uri.encodeComponent(name)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteVariantStoreResponse.fromJson(response);
  }

  /// Deletes a workflow.
  ///
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [RequestTimeoutException].
  ///
  /// Parameter [id] :
  /// The workflow's ID.
  Future<void> deleteWorkflow({
    required String id,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/workflow/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Gets information about an annotation import job.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [jobId] :
  /// The job's ID.
  Future<GetAnnotationImportResponse> getAnnotationImportJob({
    required String jobId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/import/annotation/${Uri.encodeComponent(jobId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetAnnotationImportResponse.fromJson(response);
  }

  /// Gets information about an annotation store.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The store's name.
  Future<GetAnnotationStoreResponse> getAnnotationStore({
    required String name,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/annotationStore/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetAnnotationStoreResponse.fromJson(response);
  }

  /// Retrieves the metadata for an annotation store version.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The name given to an annotation store version to distinguish it from
  /// others.
  ///
  /// Parameter [versionName] :
  /// The name given to an annotation store version to distinguish it from
  /// others.
  Future<GetAnnotationStoreVersionResponse> getAnnotationStoreVersion({
    required String name,
    required String versionName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/annotationStore/${Uri.encodeComponent(name)}/version/${Uri.encodeComponent(versionName)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetAnnotationStoreVersionResponse.fromJson(response);
  }

  /// Gets a file from a read set.
  ///
  /// May throw [InternalServerException].
  /// May throw [RangeNotSatisfiableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [RequestTimeoutException].
  ///
  /// Parameter [id] :
  /// The read set's ID.
  ///
  /// Parameter [partNumber] :
  /// The part number to retrieve.
  ///
  /// Parameter [sequenceStoreId] :
  /// The read set's sequence store ID.
  ///
  /// Parameter [file] :
  /// The file to retrieve.
  Future<GetReadSetResponse> getReadSet({
    required String id,
    required int partNumber,
    required String sequenceStoreId,
    ReadSetFile? file,
  }) async {
    _s.validateNumRange(
      'partNumber',
      partNumber,
      1,
      10000,
      isRequired: true,
    );
    final $query = <String, List<String>>{
      'partNumber': [partNumber.toString()],
      if (file != null) 'file': [file.toValue()],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/sequencestore/${Uri.encodeComponent(sequenceStoreId)}/readset/${Uri.encodeComponent(id)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetReadSetResponse(
      payload: await response.stream.toBytes(),
    );
  }

  /// Gets information about a read set activation job.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [RequestTimeoutException].
  ///
  /// Parameter [id] :
  /// The job's ID.
  ///
  /// Parameter [sequenceStoreId] :
  /// The job's sequence store ID.
  Future<GetReadSetActivationJobResponse> getReadSetActivationJob({
    required String id,
    required String sequenceStoreId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/sequencestore/${Uri.encodeComponent(sequenceStoreId)}/activationjob/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetReadSetActivationJobResponse.fromJson(response);
  }

  /// Gets information about a read set export job.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [RequestTimeoutException].
  ///
  /// Parameter [id] :
  /// The job's ID.
  ///
  /// Parameter [sequenceStoreId] :
  /// The job's sequence store ID.
  Future<GetReadSetExportJobResponse> getReadSetExportJob({
    required String id,
    required String sequenceStoreId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/sequencestore/${Uri.encodeComponent(sequenceStoreId)}/exportjob/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetReadSetExportJobResponse.fromJson(response);
  }

  /// Gets information about a read set import job.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [RequestTimeoutException].
  ///
  /// Parameter [id] :
  /// The job's ID.
  ///
  /// Parameter [sequenceStoreId] :
  /// The job's sequence store ID.
  Future<GetReadSetImportJobResponse> getReadSetImportJob({
    required String id,
    required String sequenceStoreId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/sequencestore/${Uri.encodeComponent(sequenceStoreId)}/importjob/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetReadSetImportJobResponse.fromJson(response);
  }

  /// Gets details about a read set.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [RequestTimeoutException].
  ///
  /// Parameter [id] :
  /// The read set's ID.
  ///
  /// Parameter [sequenceStoreId] :
  /// The read set's sequence store ID.
  Future<GetReadSetMetadataResponse> getReadSetMetadata({
    required String id,
    required String sequenceStoreId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/sequencestore/${Uri.encodeComponent(sequenceStoreId)}/readset/${Uri.encodeComponent(id)}/metadata',
      exceptionFnMap: _exceptionFns,
    );
    return GetReadSetMetadataResponse.fromJson(response);
  }

  /// Gets a reference file.
  ///
  /// May throw [InternalServerException].
  /// May throw [RangeNotSatisfiableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [RequestTimeoutException].
  ///
  /// Parameter [id] :
  /// The reference's ID.
  ///
  /// Parameter [partNumber] :
  /// The part number to retrieve.
  ///
  /// Parameter [referenceStoreId] :
  /// The reference's store ID.
  ///
  /// Parameter [file] :
  /// The file to retrieve.
  ///
  /// Parameter [range] :
  /// The range to retrieve.
  Future<GetReferenceResponse> getReference({
    required String id,
    required int partNumber,
    required String referenceStoreId,
    ReferenceFile? file,
    String? range,
  }) async {
    _s.validateNumRange(
      'partNumber',
      partNumber,
      1,
      10000,
      isRequired: true,
    );
    final headers = <String, String>{
      if (range != null) 'Range': range.toString(),
    };
    final $query = <String, List<String>>{
      'partNumber': [partNumber.toString()],
      if (file != null) 'file': [file.toValue()],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/referencestore/${Uri.encodeComponent(referenceStoreId)}/reference/${Uri.encodeComponent(id)}',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetReferenceResponse(
      payload: await response.stream.toBytes(),
    );
  }

  /// Gets information about a reference import job.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [RequestTimeoutException].
  ///
  /// Parameter [id] :
  /// The job's ID.
  ///
  /// Parameter [referenceStoreId] :
  /// The job's reference store ID.
  Future<GetReferenceImportJobResponse> getReferenceImportJob({
    required String id,
    required String referenceStoreId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/referencestore/${Uri.encodeComponent(referenceStoreId)}/importjob/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetReferenceImportJobResponse.fromJson(response);
  }

  /// Gets information about a genome reference's metadata.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [RequestTimeoutException].
  ///
  /// Parameter [id] :
  /// The reference's ID.
  ///
  /// Parameter [referenceStoreId] :
  /// The reference's reference store ID.
  Future<GetReferenceMetadataResponse> getReferenceMetadata({
    required String id,
    required String referenceStoreId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/referencestore/${Uri.encodeComponent(referenceStoreId)}/reference/${Uri.encodeComponent(id)}/metadata',
      exceptionFnMap: _exceptionFns,
    );
    return GetReferenceMetadataResponse.fromJson(response);
  }

  /// Gets information about a reference store.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [RequestTimeoutException].
  ///
  /// Parameter [id] :
  /// The store's ID.
  Future<GetReferenceStoreResponse> getReferenceStore({
    required String id,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/referencestore/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetReferenceStoreResponse.fromJson(response);
  }

  /// Gets information about a workflow run.
  ///
  /// If a workflow is shared with you, you cannot export information about the
  /// run.
  ///
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [RequestTimeoutException].
  ///
  /// Parameter [id] :
  /// The run's ID.
  ///
  /// Parameter [export] :
  /// The run's export format.
  Future<GetRunResponse> getRun({
    required String id,
    List<RunExport>? export,
  }) async {
    final $query = <String, List<String>>{
      if (export != null) 'export': export.map((e) => e.toValue()).toList(),
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/run/${Uri.encodeComponent(id)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetRunResponse.fromJson(response);
  }

  /// Gets information about a workflow run group.
  ///
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [RequestTimeoutException].
  ///
  /// Parameter [id] :
  /// The group's ID.
  Future<GetRunGroupResponse> getRunGroup({
    required String id,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/runGroup/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetRunGroupResponse.fromJson(response);
  }

  /// Gets information about a workflow run task.
  ///
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [RequestTimeoutException].
  ///
  /// Parameter [id] :
  /// The workflow run ID.
  ///
  /// Parameter [taskId] :
  /// The task's ID.
  Future<GetRunTaskResponse> getRunTask({
    required String id,
    required String taskId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/run/${Uri.encodeComponent(id)}/task/${Uri.encodeComponent(taskId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetRunTaskResponse.fromJson(response);
  }

  /// Gets information about a sequence store.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [RequestTimeoutException].
  ///
  /// Parameter [id] :
  /// The store's ID.
  Future<GetSequenceStoreResponse> getSequenceStore({
    required String id,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/sequencestore/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetSequenceStoreResponse.fromJson(response);
  }

  /// Retrieves the metadata for the specified resource share.
  ///
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [shareId] :
  /// The ID of the share.
  Future<GetShareResponse> getShare({
    required String shareId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/share/${Uri.encodeComponent(shareId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetShareResponse.fromJson(response);
  }

  /// Gets information about a variant import job.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [jobId] :
  /// The job's ID.
  Future<GetVariantImportResponse> getVariantImportJob({
    required String jobId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/import/variant/${Uri.encodeComponent(jobId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetVariantImportResponse.fromJson(response);
  }

  /// Gets information about a variant store.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The store's name.
  Future<GetVariantStoreResponse> getVariantStore({
    required String name,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/variantStore/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetVariantStoreResponse.fromJson(response);
  }

  /// Gets information about a workflow.
  ///
  /// If a workflow is shared with you, you cannot export the workflow.
  ///
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [RequestTimeoutException].
  ///
  /// Parameter [id] :
  /// The workflow's ID.
  ///
  /// Parameter [export] :
  /// The export format for the workflow.
  ///
  /// Parameter [type] :
  /// The workflow's type.
  ///
  /// Parameter [workflowOwnerId] :
  /// The ID of the workflow owner.
  Future<GetWorkflowResponse> getWorkflow({
    required String id,
    List<WorkflowExport>? export,
    WorkflowType? type,
    String? workflowOwnerId,
  }) async {
    final $query = <String, List<String>>{
      if (export != null) 'export': export.map((e) => e.toValue()).toList(),
      if (type != null) 'type': [type.toValue()],
      if (workflowOwnerId != null) 'workflowOwnerId': [workflowOwnerId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/workflow/${Uri.encodeComponent(id)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetWorkflowResponse.fromJson(response);
  }

  /// Retrieves a list of annotation import jobs.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [filter] :
  /// A filter to apply to the list.
  ///
  /// Parameter [ids] :
  /// IDs of annotation import jobs to retrieve.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of jobs to return in one page of results.
  ///
  /// Parameter [nextToken] :
  /// Specifies the pagination token from a previous request to retrieve the
  /// next page of results.
  Future<ListAnnotationImportJobsResponse> listAnnotationImportJobs({
    ListAnnotationImportJobsFilter? filter,
    List<String>? ids,
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
    final $payload = <String, dynamic>{
      if (filter != null) 'filter': filter,
      if (ids != null) 'ids': ids,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/import/annotations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAnnotationImportJobsResponse.fromJson(response);
  }

  /// Lists the versions of an annotation store.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The name of an annotation store.
  ///
  /// Parameter [filter] :
  /// A filter to apply to the list of annotation store versions.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of annotation store versions to return in one page of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// Specifies the pagination token from a previous request to retrieve the
  /// next page of results.
  Future<ListAnnotationStoreVersionsResponse> listAnnotationStoreVersions({
    required String name,
    ListAnnotationStoreVersionsFilter? filter,
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
    final $payload = <String, dynamic>{
      if (filter != null) 'filter': filter,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/annotationStore/${Uri.encodeComponent(name)}/versions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAnnotationStoreVersionsResponse.fromJson(response);
  }

  /// Retrieves a list of annotation stores.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [filter] :
  /// A filter to apply to the list.
  ///
  /// Parameter [ids] :
  /// IDs of stores to list.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of stores to return in one page of results.
  ///
  /// Parameter [nextToken] :
  /// Specify the pagination token from a previous request to retrieve the next
  /// page of results.
  Future<ListAnnotationStoresResponse> listAnnotationStores({
    ListAnnotationStoresFilter? filter,
    List<String>? ids,
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
    final $payload = <String, dynamic>{
      if (filter != null) 'filter': filter,
      if (ids != null) 'ids': ids,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/annotationStores',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAnnotationStoresResponse.fromJson(response);
  }

  /// Lists multipart read set uploads and for in progress uploads. Once the
  /// upload is completed, a read set is created and the upload will no longer
  /// be returned in the response.
  ///
  /// May throw [InternalServerException].
  /// May throw [NotSupportedOperationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [RequestTimeoutException].
  ///
  /// Parameter [sequenceStoreId] :
  /// The Sequence Store ID used for the multipart uploads.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of multipart uploads returned in a page.
  ///
  /// Parameter [nextToken] :
  /// Next token returned in the response of a previous
  /// ListMultipartReadSetUploads call. Used to get the next page of results.
  Future<ListMultipartReadSetUploadsResponse> listMultipartReadSetUploads({
    required String sequenceStoreId,
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
      method: 'POST',
      requestUri:
          '/sequencestore/${Uri.encodeComponent(sequenceStoreId)}/uploads',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListMultipartReadSetUploadsResponse.fromJson(response);
  }

  /// Retrieves a list of read set activation jobs.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [RequestTimeoutException].
  ///
  /// Parameter [sequenceStoreId] :
  /// The read set's sequence store ID.
  ///
  /// Parameter [filter] :
  /// A filter to apply to the list.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of read set activation jobs to return in one page of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// Specify the pagination token from a previous request to retrieve the next
  /// page of results.
  Future<ListReadSetActivationJobsResponse> listReadSetActivationJobs({
    required String sequenceStoreId,
    ActivateReadSetFilter? filter,
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
    final $payload = <String, dynamic>{
      if (filter != null) 'filter': filter,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/sequencestore/${Uri.encodeComponent(sequenceStoreId)}/activationjobs',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListReadSetActivationJobsResponse.fromJson(response);
  }

  /// Retrieves a list of read set export jobs.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [RequestTimeoutException].
  ///
  /// Parameter [sequenceStoreId] :
  /// The jobs' sequence store ID.
  ///
  /// Parameter [filter] :
  /// A filter to apply to the list.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of jobs to return in one page of results.
  ///
  /// Parameter [nextToken] :
  /// Specify the pagination token from a previous request to retrieve the next
  /// page of results.
  Future<ListReadSetExportJobsResponse> listReadSetExportJobs({
    required String sequenceStoreId,
    ExportReadSetFilter? filter,
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
    final $payload = <String, dynamic>{
      if (filter != null) 'filter': filter,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/sequencestore/${Uri.encodeComponent(sequenceStoreId)}/exportjobs',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListReadSetExportJobsResponse.fromJson(response);
  }

  /// Retrieves a list of read set import jobs.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [RequestTimeoutException].
  ///
  /// Parameter [sequenceStoreId] :
  /// The jobs' sequence store ID.
  ///
  /// Parameter [filter] :
  /// A filter to apply to the list.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of jobs to return in one page of results.
  ///
  /// Parameter [nextToken] :
  /// Specify the pagination token from a previous request to retrieve the next
  /// page of results.
  Future<ListReadSetImportJobsResponse> listReadSetImportJobs({
    required String sequenceStoreId,
    ImportReadSetFilter? filter,
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
    final $payload = <String, dynamic>{
      if (filter != null) 'filter': filter,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/sequencestore/${Uri.encodeComponent(sequenceStoreId)}/importjobs',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListReadSetImportJobsResponse.fromJson(response);
  }

  /// This operation will list all parts in a requested multipart upload for a
  /// sequence store.
  ///
  /// May throw [InternalServerException].
  /// May throw [NotSupportedOperationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [RequestTimeoutException].
  ///
  /// Parameter [partSource] :
  /// The source file for the upload part.
  ///
  /// Parameter [sequenceStoreId] :
  /// The Sequence Store ID used for the multipart uploads.
  ///
  /// Parameter [uploadId] :
  /// The ID for the initiated multipart upload.
  ///
  /// Parameter [filter] :
  /// Attributes used to filter for a specific subset of read set part uploads.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of read set upload parts returned in a page.
  ///
  /// Parameter [nextToken] :
  /// Next token returned in the response of a previous
  /// ListReadSetUploadPartsRequest call. Used to get the next page of results.
  Future<ListReadSetUploadPartsResponse> listReadSetUploadParts({
    required ReadSetPartSource partSource,
    required String sequenceStoreId,
    required String uploadId,
    ReadSetUploadPartListFilter? filter,
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
    final $payload = <String, dynamic>{
      'partSource': partSource.toValue(),
      if (filter != null) 'filter': filter,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/sequencestore/${Uri.encodeComponent(sequenceStoreId)}/upload/${Uri.encodeComponent(uploadId)}/parts',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListReadSetUploadPartsResponse.fromJson(response);
  }

  /// Retrieves a list of read sets.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [RequestTimeoutException].
  ///
  /// Parameter [sequenceStoreId] :
  /// The jobs' sequence store ID.
  ///
  /// Parameter [filter] :
  /// A filter to apply to the list.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of read sets to return in one page of results.
  ///
  /// Parameter [nextToken] :
  /// Specify the pagination token from a previous request to retrieve the next
  /// page of results.
  Future<ListReadSetsResponse> listReadSets({
    required String sequenceStoreId,
    ReadSetFilter? filter,
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
    final $payload = <String, dynamic>{
      if (filter != null) 'filter': filter,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/sequencestore/${Uri.encodeComponent(sequenceStoreId)}/readsets',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListReadSetsResponse.fromJson(response);
  }

  /// Retrieves a list of reference import jobs.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [RequestTimeoutException].
  ///
  /// Parameter [referenceStoreId] :
  /// The job's reference store ID.
  ///
  /// Parameter [filter] :
  /// A filter to apply to the list.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of jobs to return in one page of results.
  ///
  /// Parameter [nextToken] :
  /// Specify the pagination token from a previous request to retrieve the next
  /// page of results.
  Future<ListReferenceImportJobsResponse> listReferenceImportJobs({
    required String referenceStoreId,
    ImportReferenceFilter? filter,
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
    final $payload = <String, dynamic>{
      if (filter != null) 'filter': filter,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/referencestore/${Uri.encodeComponent(referenceStoreId)}/importjobs',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListReferenceImportJobsResponse.fromJson(response);
  }

  /// Retrieves a list of reference stores.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [RequestTimeoutException].
  ///
  /// Parameter [filter] :
  /// A filter to apply to the list.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of stores to return in one page of results.
  ///
  /// Parameter [nextToken] :
  /// Specify the pagination token from a previous request to retrieve the next
  /// page of results.
  Future<ListReferenceStoresResponse> listReferenceStores({
    ReferenceStoreFilter? filter,
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
    final $payload = <String, dynamic>{
      if (filter != null) 'filter': filter,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/referencestores',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListReferenceStoresResponse.fromJson(response);
  }

  /// Retrieves a list of references.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [RequestTimeoutException].
  ///
  /// Parameter [referenceStoreId] :
  /// The references' reference store ID.
  ///
  /// Parameter [filter] :
  /// A filter to apply to the list.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of references to return in one page of results.
  ///
  /// Parameter [nextToken] :
  /// Specify the pagination token from a previous request to retrieve the next
  /// page of results.
  Future<ListReferencesResponse> listReferences({
    required String referenceStoreId,
    ReferenceFilter? filter,
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
    final $payload = <String, dynamic>{
      if (filter != null) 'filter': filter,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/referencestore/${Uri.encodeComponent(referenceStoreId)}/references',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListReferencesResponse.fromJson(response);
  }

  /// Retrieves a list of run groups.
  ///
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [RequestTimeoutException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of run groups to return in one page of results.
  ///
  /// Parameter [name] :
  /// The run groups' name.
  ///
  /// Parameter [startingToken] :
  /// Specify the pagination token from a previous request to retrieve the next
  /// page of results.
  Future<ListRunGroupsResponse> listRunGroups({
    int? maxResults,
    String? name,
    String? startingToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (name != null) 'name': [name],
      if (startingToken != null) 'startingToken': [startingToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/runGroup',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListRunGroupsResponse.fromJson(response);
  }

  /// Retrieves a list of tasks for a run.
  ///
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [RequestTimeoutException].
  ///
  /// Parameter [id] :
  /// The run's ID.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of run tasks to return in one page of results.
  ///
  /// Parameter [startingToken] :
  /// Specify the pagination token from a previous request to retrieve the next
  /// page of results.
  ///
  /// Parameter [status] :
  /// Filter the list by status.
  Future<ListRunTasksResponse> listRunTasks({
    required String id,
    int? maxResults,
    String? startingToken,
    TaskStatus? status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (startingToken != null) 'startingToken': [startingToken],
      if (status != null) 'status': [status.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/run/${Uri.encodeComponent(id)}/task',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListRunTasksResponse.fromJson(response);
  }

  /// Retrieves a list of runs.
  ///
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [RequestTimeoutException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of runs to return in one page of results.
  ///
  /// Parameter [name] :
  /// Filter the list by run name.
  ///
  /// Parameter [runGroupId] :
  /// Filter the list by run group ID.
  ///
  /// Parameter [startingToken] :
  /// Specify the pagination token from a previous request to retrieve the next
  /// page of results.
  ///
  /// Parameter [status] :
  /// The status of a run.
  Future<ListRunsResponse> listRuns({
    int? maxResults,
    String? name,
    String? runGroupId,
    String? startingToken,
    RunStatus? status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (name != null) 'name': [name],
      if (runGroupId != null) 'runGroupId': [runGroupId],
      if (startingToken != null) 'startingToken': [startingToken],
      if (status != null) 'status': [status.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/run',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListRunsResponse.fromJson(response);
  }

  /// Retrieves a list of sequence stores.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [RequestTimeoutException].
  ///
  /// Parameter [filter] :
  /// A filter to apply to the list.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of stores to return in one page of results.
  ///
  /// Parameter [nextToken] :
  /// Specify the pagination token from a previous request to retrieve the next
  /// page of results.
  Future<ListSequenceStoresResponse> listSequenceStores({
    SequenceStoreFilter? filter,
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
    final $payload = <String, dynamic>{
      if (filter != null) 'filter': filter,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/sequencestores',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSequenceStoresResponse.fromJson(response);
  }

  /// Retrieves the resource shares associated with an account. Use the filter
  /// parameter to retrieve a specific subset of the shares.
  ///
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [resourceOwner] :
  /// The account that owns the resource shares.
  ///
  /// Parameter [filter] :
  /// Attributes that you use to filter for a specific subset of resource
  /// shares.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of shares to return in one page of results.
  ///
  /// Parameter [nextToken] :
  /// Next token returned in the response of a previous
  /// ListReadSetUploadPartsRequest call. Used to get the next page of results.
  Future<ListSharesResponse> listShares({
    required ResourceOwner resourceOwner,
    Filter? filter,
    int? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final $payload = <String, dynamic>{
      'resourceOwner': resourceOwner.toValue(),
      if (filter != null) 'filter': filter,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/shares',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSharesResponse.fromJson(response);
  }

  /// Retrieves a list of tags for a resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [RequestTimeoutException].
  ///
  /// Parameter [resourceArn] :
  /// The resource's ARN.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Retrieves a list of variant import jobs.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [filter] :
  /// A filter to apply to the list.
  ///
  /// Parameter [ids] :
  /// A list of job IDs.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of import jobs to return in one page of results.
  ///
  /// Parameter [nextToken] :
  /// Specify the pagination token from a previous request to retrieve the next
  /// page of results.
  Future<ListVariantImportJobsResponse> listVariantImportJobs({
    ListVariantImportJobsFilter? filter,
    List<String>? ids,
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
    final $payload = <String, dynamic>{
      if (filter != null) 'filter': filter,
      if (ids != null) 'ids': ids,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/import/variants',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListVariantImportJobsResponse.fromJson(response);
  }

  /// Retrieves a list of variant stores.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [filter] :
  /// A filter to apply to the list.
  ///
  /// Parameter [ids] :
  /// A list of store IDs.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of stores to return in one page of results.
  ///
  /// Parameter [nextToken] :
  /// Specify the pagination token from a previous request to retrieve the next
  /// page of results.
  Future<ListVariantStoresResponse> listVariantStores({
    ListVariantStoresFilter? filter,
    List<String>? ids,
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
    final $payload = <String, dynamic>{
      if (filter != null) 'filter': filter,
      if (ids != null) 'ids': ids,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/variantStores',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListVariantStoresResponse.fromJson(response);
  }

  /// Retrieves a list of workflows.
  ///
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [RequestTimeoutException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of workflows to return in one page of results.
  ///
  /// Parameter [name] :
  /// Filter the list by workflow name.
  ///
  /// Parameter [startingToken] :
  /// Specify the pagination token from a previous request to retrieve the next
  /// page of results.
  ///
  /// Parameter [type] :
  /// Filter the list by workflow type.
  Future<ListWorkflowsResponse> listWorkflows({
    int? maxResults,
    String? name,
    String? startingToken,
    WorkflowType? type,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (name != null) 'name': [name],
      if (startingToken != null) 'startingToken': [startingToken],
      if (type != null) 'type': [type.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/workflow',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListWorkflowsResponse.fromJson(response);
  }

  /// Starts an annotation import job.
  ///
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [destinationName] :
  /// A destination annotation store for the job.
  ///
  /// Parameter [items] :
  /// Items to import.
  ///
  /// Parameter [roleArn] :
  /// A service role for the job.
  ///
  /// Parameter [annotationFields] :
  /// The annotation schema generated by the parsed annotation data.
  ///
  /// Parameter [formatOptions] :
  /// Formatting options for the annotation file.
  ///
  /// Parameter [runLeftNormalization] :
  /// The job's left normalization setting.
  ///
  /// Parameter [versionName] :
  /// The name of the annotation store version.
  Future<StartAnnotationImportResponse> startAnnotationImportJob({
    required String destinationName,
    required List<AnnotationImportItemSource> items,
    required String roleArn,
    Map<String, String>? annotationFields,
    FormatOptions? formatOptions,
    bool? runLeftNormalization,
    String? versionName,
  }) async {
    final $payload = <String, dynamic>{
      'destinationName': destinationName,
      'items': items,
      'roleArn': roleArn,
      if (annotationFields != null) 'annotationFields': annotationFields,
      if (formatOptions != null) 'formatOptions': formatOptions,
      if (runLeftNormalization != null)
        'runLeftNormalization': runLeftNormalization,
      if (versionName != null) 'versionName': versionName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/import/annotation',
      exceptionFnMap: _exceptionFns,
    );
    return StartAnnotationImportResponse.fromJson(response);
  }

  /// Activates an archived read set. To reduce storage charges, Amazon Omics
  /// archives unused read sets after 30 days.
  ///
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [RequestTimeoutException].
  ///
  /// Parameter [sequenceStoreId] :
  /// The read set's sequence store ID.
  ///
  /// Parameter [sources] :
  /// The job's source files.
  ///
  /// Parameter [clientToken] :
  /// To ensure that jobs don't run multiple times, specify a unique token for
  /// each job.
  Future<StartReadSetActivationJobResponse> startReadSetActivationJob({
    required String sequenceStoreId,
    required List<StartReadSetActivationJobSourceItem> sources,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'sources': sources,
      if (clientToken != null) 'clientToken': clientToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/sequencestore/${Uri.encodeComponent(sequenceStoreId)}/activationjob',
      exceptionFnMap: _exceptionFns,
    );
    return StartReadSetActivationJobResponse.fromJson(response);
  }

  /// Exports a read set to Amazon S3.
  ///
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [RequestTimeoutException].
  ///
  /// Parameter [destination] :
  /// A location for exported files in Amazon S3.
  ///
  /// Parameter [roleArn] :
  /// A service role for the job.
  ///
  /// Parameter [sequenceStoreId] :
  /// The read set's sequence store ID.
  ///
  /// Parameter [sources] :
  /// The job's source files.
  ///
  /// Parameter [clientToken] :
  /// To ensure that jobs don't run multiple times, specify a unique token for
  /// each job.
  Future<StartReadSetExportJobResponse> startReadSetExportJob({
    required String destination,
    required String roleArn,
    required String sequenceStoreId,
    required List<ExportReadSet> sources,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'destination': destination,
      'roleArn': roleArn,
      'sources': sources,
      if (clientToken != null) 'clientToken': clientToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/sequencestore/${Uri.encodeComponent(sequenceStoreId)}/exportjob',
      exceptionFnMap: _exceptionFns,
    );
    return StartReadSetExportJobResponse.fromJson(response);
  }

  /// Starts a read set import job.
  ///
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [RequestTimeoutException].
  ///
  /// Parameter [roleArn] :
  /// A service role for the job.
  ///
  /// Parameter [sequenceStoreId] :
  /// The read set's sequence store ID.
  ///
  /// Parameter [sources] :
  /// The job's source files.
  ///
  /// Parameter [clientToken] :
  /// To ensure that jobs don't run multiple times, specify a unique token for
  /// each job.
  Future<StartReadSetImportJobResponse> startReadSetImportJob({
    required String roleArn,
    required String sequenceStoreId,
    required List<StartReadSetImportJobSourceItem> sources,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'roleArn': roleArn,
      'sources': sources,
      if (clientToken != null) 'clientToken': clientToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/sequencestore/${Uri.encodeComponent(sequenceStoreId)}/importjob',
      exceptionFnMap: _exceptionFns,
    );
    return StartReadSetImportJobResponse.fromJson(response);
  }

  /// Starts a reference import job.
  ///
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [RequestTimeoutException].
  ///
  /// Parameter [referenceStoreId] :
  /// The job's reference store ID.
  ///
  /// Parameter [roleArn] :
  /// A service role for the job.
  ///
  /// Parameter [sources] :
  /// The job's source files.
  ///
  /// Parameter [clientToken] :
  /// To ensure that jobs don't run multiple times, specify a unique token for
  /// each job.
  Future<StartReferenceImportJobResponse> startReferenceImportJob({
    required String referenceStoreId,
    required String roleArn,
    required List<StartReferenceImportJobSourceItem> sources,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'roleArn': roleArn,
      'sources': sources,
      if (clientToken != null) 'clientToken': clientToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/referencestore/${Uri.encodeComponent(referenceStoreId)}/importjob',
      exceptionFnMap: _exceptionFns,
    );
    return StartReferenceImportJobResponse.fromJson(response);
  }

  /// Starts a workflow run. To duplicate a run, specify the run's ID and a role
  /// ARN. The remaining parameters are copied from the previous run.
  ///
  /// StartRun will not support re-run for a workflow that is shared with you.
  ///
  /// The total number of runs in your account is subject to a quota per Region.
  /// To avoid needing to delete runs manually, you can set the retention mode
  /// to <code>REMOVE</code>. Runs with this setting are deleted automatically
  /// when the run quoata is exceeded.
  ///
  /// By default, the run uses STATIC storage. For STATIC storage, set the
  /// <code>storageCapacity</code> field. You can set the storage type to
  /// DYNAMIC. You do not set <code>storageCapacity</code>, because HealthOmics
  /// dynamically scales the storage up or down as required. For more
  /// information about static and dynamic storage, see <a
  /// href="https://docs.aws.amazon.com/omics/latest/dev/Using-workflows.html">Running
  /// workflows</a> in the <i>AWS HealthOmics User Guide</i>.
  ///
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [RequestTimeoutException].
  ///
  /// Parameter [roleArn] :
  /// A service role for the run.
  ///
  /// Parameter [logLevel] :
  /// A log level for the run.
  ///
  /// Parameter [name] :
  /// A name for the run.
  ///
  /// Parameter [outputUri] :
  /// An output URI for the run.
  ///
  /// Parameter [parameters] :
  /// Parameters for the run.
  ///
  /// Parameter [priority] :
  /// A priority for the run.
  ///
  /// Parameter [requestId] :
  /// To ensure that requests don't run multiple times, specify a unique ID for
  /// each request.
  ///
  /// Parameter [retentionMode] :
  /// The retention mode for the run.
  ///
  /// Parameter [runGroupId] :
  /// The run's group ID.
  ///
  /// Parameter [runId] :
  /// The ID of a run to duplicate.
  ///
  /// Parameter [storageCapacity] :
  /// A storage capacity for the run in gibibytes. This field is not required if
  /// the storage type is dynamic (the system ignores any value that you enter).
  ///
  /// Parameter [storageType] :
  /// The run's storage type. By default, the run uses STATIC storage type,
  /// which allocates a fixed amount of storage. If you set the storage type to
  /// DYNAMIC, HealthOmics dynamically scales the storage up or down, based on
  /// file system utilization.
  ///
  /// Parameter [tags] :
  /// Tags for the run.
  ///
  /// Parameter [workflowId] :
  /// The run's workflow ID.
  ///
  /// Parameter [workflowOwnerId] :
  /// The ID of the workflow owner.
  ///
  /// Parameter [workflowType] :
  /// The run's workflow type.
  Future<StartRunResponse> startRun({
    required String roleArn,
    RunLogLevel? logLevel,
    String? name,
    String? outputUri,
    RunParameters? parameters,
    int? priority,
    String? requestId,
    RunRetentionMode? retentionMode,
    String? runGroupId,
    String? runId,
    int? storageCapacity,
    StorageType? storageType,
    Map<String, String>? tags,
    String? workflowId,
    String? workflowOwnerId,
    WorkflowType? workflowType,
  }) async {
    _s.validateNumRange(
      'priority',
      priority,
      0,
      100000,
    );
    _s.validateNumRange(
      'storageCapacity',
      storageCapacity,
      0,
      100000,
    );
    final $payload = <String, dynamic>{
      'roleArn': roleArn,
      if (logLevel != null) 'logLevel': logLevel.toValue(),
      if (name != null) 'name': name,
      if (outputUri != null) 'outputUri': outputUri,
      if (parameters != null) 'parameters': parameters,
      if (priority != null) 'priority': priority,
      'requestId': requestId ?? _s.generateIdempotencyToken(),
      if (retentionMode != null) 'retentionMode': retentionMode.toValue(),
      if (runGroupId != null) 'runGroupId': runGroupId,
      if (runId != null) 'runId': runId,
      if (storageCapacity != null) 'storageCapacity': storageCapacity,
      if (storageType != null) 'storageType': storageType.toValue(),
      if (tags != null) 'tags': tags,
      if (workflowId != null) 'workflowId': workflowId,
      if (workflowOwnerId != null) 'workflowOwnerId': workflowOwnerId,
      if (workflowType != null) 'workflowType': workflowType.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/run',
      exceptionFnMap: _exceptionFns,
    );
    return StartRunResponse.fromJson(response);
  }

  /// Starts a variant import job.
  ///
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [destinationName] :
  /// The destination variant store for the job.
  ///
  /// Parameter [items] :
  /// Items to import.
  ///
  /// Parameter [roleArn] :
  /// A service role for the job.
  ///
  /// Parameter [annotationFields] :
  /// The annotation schema generated by the parsed annotation data.
  ///
  /// Parameter [runLeftNormalization] :
  /// The job's left normalization setting.
  Future<StartVariantImportResponse> startVariantImportJob({
    required String destinationName,
    required List<VariantImportItemSource> items,
    required String roleArn,
    Map<String, String>? annotationFields,
    bool? runLeftNormalization,
  }) async {
    final $payload = <String, dynamic>{
      'destinationName': destinationName,
      'items': items,
      'roleArn': roleArn,
      if (annotationFields != null) 'annotationFields': annotationFields,
      if (runLeftNormalization != null)
        'runLeftNormalization': runLeftNormalization,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/import/variant',
      exceptionFnMap: _exceptionFns,
    );
    return StartVariantImportResponse.fromJson(response);
  }

  /// Tags a resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [RequestTimeoutException].
  ///
  /// Parameter [resourceArn] :
  /// The resource's ARN.
  ///
  /// Parameter [tags] :
  /// Tags for the resource.
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

  /// Removes tags from a resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [RequestTimeoutException].
  ///
  /// Parameter [resourceArn] :
  /// The resource's ARN.
  ///
  /// Parameter [tagKeys] :
  /// Keys of tags to remove.
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

  /// Updates an annotation store.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// A name for the store.
  ///
  /// Parameter [description] :
  /// A description for the store.
  Future<UpdateAnnotationStoreResponse> updateAnnotationStore({
    required String name,
    String? description,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/annotationStore/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateAnnotationStoreResponse.fromJson(response);
  }

  /// Updates the description of an annotation store version.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The name of an annotation store.
  ///
  /// Parameter [versionName] :
  /// The name of an annotation store version.
  ///
  /// Parameter [description] :
  /// The description of an annotation store.
  Future<UpdateAnnotationStoreVersionResponse> updateAnnotationStoreVersion({
    required String name,
    required String versionName,
    String? description,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/annotationStore/${Uri.encodeComponent(name)}/version/${Uri.encodeComponent(versionName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateAnnotationStoreVersionResponse.fromJson(response);
  }

  /// Updates a run group.
  ///
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [RequestTimeoutException].
  ///
  /// Parameter [id] :
  /// The group's ID.
  ///
  /// Parameter [maxCpus] :
  /// The maximum number of CPUs to use.
  ///
  /// Parameter [maxDuration] :
  /// A maximum run time for the group in minutes.
  ///
  /// Parameter [maxGpus] :
  /// The maximum GPUs that can be used by a run group.
  ///
  /// Parameter [maxRuns] :
  /// The maximum number of concurrent runs for the group.
  ///
  /// Parameter [name] :
  /// A name for the group.
  Future<void> updateRunGroup({
    required String id,
    int? maxCpus,
    int? maxDuration,
    int? maxGpus,
    int? maxRuns,
    String? name,
  }) async {
    _s.validateNumRange(
      'maxCpus',
      maxCpus,
      1,
      100000,
    );
    _s.validateNumRange(
      'maxDuration',
      maxDuration,
      1,
      100000,
    );
    _s.validateNumRange(
      'maxGpus',
      maxGpus,
      1,
      100000,
    );
    _s.validateNumRange(
      'maxRuns',
      maxRuns,
      1,
      100000,
    );
    final $payload = <String, dynamic>{
      if (maxCpus != null) 'maxCpus': maxCpus,
      if (maxDuration != null) 'maxDuration': maxDuration,
      if (maxGpus != null) 'maxGpus': maxGpus,
      if (maxRuns != null) 'maxRuns': maxRuns,
      if (name != null) 'name': name,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/runGroup/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates a variant store.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// A name for the store.
  ///
  /// Parameter [description] :
  /// A description for the store.
  Future<UpdateVariantStoreResponse> updateVariantStore({
    required String name,
    String? description,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/variantStore/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateVariantStoreResponse.fromJson(response);
  }

  /// Updates a workflow.
  ///
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [RequestTimeoutException].
  ///
  /// Parameter [id] :
  /// The workflow's ID.
  ///
  /// Parameter [description] :
  /// A description for the workflow.
  ///
  /// Parameter [name] :
  /// A name for the workflow.
  Future<void> updateWorkflow({
    required String id,
    String? description,
    String? name,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'description': description,
      if (name != null) 'name': name,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/workflow/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This operation uploads a specific part of a read set. If you upload a new
  /// part using a previously used part number, the previously uploaded part
  /// will be overwritten.
  ///
  /// May throw [InternalServerException].
  /// May throw [NotSupportedOperationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [RequestTimeoutException].
  ///
  /// Parameter [partNumber] :
  /// The number of the part being uploaded.
  ///
  /// Parameter [partSource] :
  /// The source file for an upload part.
  ///
  /// Parameter [payload] :
  /// The read set data to upload for a part.
  ///
  /// Parameter [sequenceStoreId] :
  /// The Sequence Store ID used for the multipart upload.
  ///
  /// Parameter [uploadId] :
  /// The ID for the initiated multipart upload.
  Future<UploadReadSetPartResponse> uploadReadSetPart({
    required int partNumber,
    required ReadSetPartSource partSource,
    required Uint8List payload,
    required String sequenceStoreId,
    required String uploadId,
  }) async {
    _s.validateNumRange(
      'partNumber',
      partNumber,
      1,
      10000,
      isRequired: true,
    );
    final $query = <String, List<String>>{
      'partNumber': [partNumber.toString()],
      'partSource': [partSource.toValue()],
    };
    final response = await _protocol.send(
      payload: payload,
      method: 'PUT',
      requestUri:
          '/sequencestore/${Uri.encodeComponent(sequenceStoreId)}/upload/${Uri.encodeComponent(uploadId)}/part',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return UploadReadSetPartResponse.fromJson(response);
  }
}

class AbortMultipartReadSetUploadResponse {
  AbortMultipartReadSetUploadResponse();

  factory AbortMultipartReadSetUploadResponse.fromJson(Map<String, dynamic> _) {
    return AbortMultipartReadSetUploadResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum Accelerators {
  gpu,
}

extension AcceleratorsValueExtension on Accelerators {
  String toValue() {
    switch (this) {
      case Accelerators.gpu:
        return 'GPU';
    }
  }
}

extension AcceleratorsFromString on String {
  Accelerators toAccelerators() {
    switch (this) {
      case 'GPU':
        return Accelerators.gpu;
    }
    throw Exception('$this is not known in enum Accelerators');
  }
}

class AcceptShareResponse {
  /// The status of the resource share.
  final ShareStatus? status;

  AcceptShareResponse({
    this.status,
  });

  factory AcceptShareResponse.fromJson(Map<String, dynamic> json) {
    return AcceptShareResponse(
      status: (json['status'] as String?)?.toShareStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      if (status != null) 'status': status.toValue(),
    };
  }
}

/// A read set activation job filter.
class ActivateReadSetFilter {
  /// The filter's start date.
  final DateTime? createdAfter;

  /// The filter's end date.
  final DateTime? createdBefore;

  /// The filter's status.
  final ReadSetActivationJobStatus? status;

  ActivateReadSetFilter({
    this.createdAfter,
    this.createdBefore,
    this.status,
  });

  Map<String, dynamic> toJson() {
    final createdAfter = this.createdAfter;
    final createdBefore = this.createdBefore;
    final status = this.status;
    return {
      if (createdAfter != null) 'createdAfter': iso8601ToJson(createdAfter),
      if (createdBefore != null) 'createdBefore': iso8601ToJson(createdBefore),
      if (status != null) 'status': status.toValue(),
    };
  }
}

/// A read set activation job.
class ActivateReadSetJobItem {
  /// When the job was created.
  final DateTime creationTime;

  /// The job's ID.
  final String id;

  /// The job's sequence store ID.
  final String sequenceStoreId;

  /// The job's status.
  final ReadSetActivationJobStatus status;

  /// When the job completed.
  final DateTime? completionTime;

  ActivateReadSetJobItem({
    required this.creationTime,
    required this.id,
    required this.sequenceStoreId,
    required this.status,
    this.completionTime,
  });

  factory ActivateReadSetJobItem.fromJson(Map<String, dynamic> json) {
    return ActivateReadSetJobItem(
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      id: json['id'] as String,
      sequenceStoreId: json['sequenceStoreId'] as String,
      status: (json['status'] as String).toReadSetActivationJobStatus(),
      completionTime: timeStampFromJson(json['completionTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final id = this.id;
    final sequenceStoreId = this.sequenceStoreId;
    final status = this.status;
    final completionTime = this.completionTime;
    return {
      'creationTime': iso8601ToJson(creationTime),
      'id': id,
      'sequenceStoreId': sequenceStoreId,
      'status': status.toValue(),
      if (completionTime != null)
        'completionTime': iso8601ToJson(completionTime),
    };
  }
}

/// A source for a read set activation job.
class ActivateReadSetSourceItem {
  /// The source's read set ID.
  final String readSetId;

  /// The source's status.
  final ReadSetActivationJobItemStatus status;

  /// The source's status message.
  final String? statusMessage;

  ActivateReadSetSourceItem({
    required this.readSetId,
    required this.status,
    this.statusMessage,
  });

  factory ActivateReadSetSourceItem.fromJson(Map<String, dynamic> json) {
    return ActivateReadSetSourceItem(
      readSetId: json['readSetId'] as String,
      status: (json['status'] as String).toReadSetActivationJobItemStatus(),
      statusMessage: json['statusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final readSetId = this.readSetId;
    final status = this.status;
    final statusMessage = this.statusMessage;
    return {
      'readSetId': readSetId,
      'status': status.toValue(),
      if (statusMessage != null) 'statusMessage': statusMessage,
    };
  }
}

/// Details about an imported annotation item.
class AnnotationImportItemDetail {
  /// The item's job status.
  final JobStatus jobStatus;

  /// The source file's location in Amazon S3.
  final String source;

  AnnotationImportItemDetail({
    required this.jobStatus,
    required this.source,
  });

  factory AnnotationImportItemDetail.fromJson(Map<String, dynamic> json) {
    return AnnotationImportItemDetail(
      jobStatus: (json['jobStatus'] as String).toJobStatus(),
      source: json['source'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final jobStatus = this.jobStatus;
    final source = this.source;
    return {
      'jobStatus': jobStatus.toValue(),
      'source': source,
    };
  }
}

/// A source for an annotation import job.
class AnnotationImportItemSource {
  /// The source file's location in Amazon S3.
  final String source;

  AnnotationImportItemSource({
    required this.source,
  });

  Map<String, dynamic> toJson() {
    final source = this.source;
    return {
      'source': source,
    };
  }
}

/// An annotation import job.
class AnnotationImportJobItem {
  /// When the job was created.
  final DateTime creationTime;

  /// The job's destination annotation store.
  final String destinationName;

  /// The job's ID.
  final String id;

  /// The job's service role ARN.
  final String roleArn;

  /// The job's status.
  final JobStatus status;

  /// When the job was updated.
  final DateTime updateTime;

  /// The name of the annotation store version.
  final String versionName;

  /// The annotation schema generated by the parsed annotation data.
  final Map<String, String>? annotationFields;

  /// When the job completed.
  final DateTime? completionTime;

  /// The job's left normalization setting.
  final bool? runLeftNormalization;

  AnnotationImportJobItem({
    required this.creationTime,
    required this.destinationName,
    required this.id,
    required this.roleArn,
    required this.status,
    required this.updateTime,
    required this.versionName,
    this.annotationFields,
    this.completionTime,
    this.runLeftNormalization,
  });

  factory AnnotationImportJobItem.fromJson(Map<String, dynamic> json) {
    return AnnotationImportJobItem(
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      destinationName: json['destinationName'] as String,
      id: json['id'] as String,
      roleArn: json['roleArn'] as String,
      status: (json['status'] as String).toJobStatus(),
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] as Object),
      versionName: json['versionName'] as String,
      annotationFields: (json['annotationFields'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      completionTime: timeStampFromJson(json['completionTime']),
      runLeftNormalization: json['runLeftNormalization'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final destinationName = this.destinationName;
    final id = this.id;
    final roleArn = this.roleArn;
    final status = this.status;
    final updateTime = this.updateTime;
    final versionName = this.versionName;
    final annotationFields = this.annotationFields;
    final completionTime = this.completionTime;
    final runLeftNormalization = this.runLeftNormalization;
    return {
      'creationTime': iso8601ToJson(creationTime),
      'destinationName': destinationName,
      'id': id,
      'roleArn': roleArn,
      'status': status.toValue(),
      'updateTime': iso8601ToJson(updateTime),
      'versionName': versionName,
      if (annotationFields != null) 'annotationFields': annotationFields,
      if (completionTime != null)
        'completionTime': iso8601ToJson(completionTime),
      if (runLeftNormalization != null)
        'runLeftNormalization': runLeftNormalization,
    };
  }
}

/// An annotation store.
class AnnotationStoreItem {
  /// The store's creation time.
  final DateTime creationTime;

  /// The store's description.
  final String description;

  /// The store's ID.
  final String id;

  /// The store's name.
  final String name;

  /// The store's genome reference.
  final ReferenceItem reference;

  /// The store's server-side encryption (SSE) settings.
  final SseConfig sseConfig;

  /// The store's status.
  final StoreStatus status;

  /// The store's status message.
  final String statusMessage;

  /// The store's ARN.
  final String storeArn;

  /// The store's file format.
  final StoreFormat storeFormat;

  /// The store's size in bytes.
  final int storeSizeBytes;

  /// When the store was updated.
  final DateTime updateTime;

  AnnotationStoreItem({
    required this.creationTime,
    required this.description,
    required this.id,
    required this.name,
    required this.reference,
    required this.sseConfig,
    required this.status,
    required this.statusMessage,
    required this.storeArn,
    required this.storeFormat,
    required this.storeSizeBytes,
    required this.updateTime,
  });

  factory AnnotationStoreItem.fromJson(Map<String, dynamic> json) {
    return AnnotationStoreItem(
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      description: json['description'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      reference:
          ReferenceItem.fromJson(json['reference'] as Map<String, dynamic>),
      sseConfig: SseConfig.fromJson(json['sseConfig'] as Map<String, dynamic>),
      status: (json['status'] as String).toStoreStatus(),
      statusMessage: json['statusMessage'] as String,
      storeArn: json['storeArn'] as String,
      storeFormat: (json['storeFormat'] as String).toStoreFormat(),
      storeSizeBytes: json['storeSizeBytes'] as int,
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] as Object),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final description = this.description;
    final id = this.id;
    final name = this.name;
    final reference = this.reference;
    final sseConfig = this.sseConfig;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final storeArn = this.storeArn;
    final storeFormat = this.storeFormat;
    final storeSizeBytes = this.storeSizeBytes;
    final updateTime = this.updateTime;
    return {
      'creationTime': iso8601ToJson(creationTime),
      'description': description,
      'id': id,
      'name': name,
      'reference': reference,
      'sseConfig': sseConfig,
      'status': status.toValue(),
      'statusMessage': statusMessage,
      'storeArn': storeArn,
      'storeFormat': storeFormat.toValue(),
      'storeSizeBytes': storeSizeBytes,
      'updateTime': iso8601ToJson(updateTime),
    };
  }
}

/// Annotation store versions.
class AnnotationStoreVersionItem {
  /// The time stamp for when an annotation store version was created.
  final DateTime creationTime;

  /// The description of an annotation store version.
  final String description;

  /// The annotation store version ID.
  final String id;

  /// A name given to an annotation store version to distinguish it from others.
  final String name;

  /// The status of an annotation store version.
  final VersionStatus status;

  /// The status of an annotation store version.
  final String statusMessage;

  /// The store ID for an annotation store version.
  final String storeId;

  /// The time stamp for when an annotation store version was updated.
  final DateTime updateTime;

  /// The Arn for an annotation store version.
  final String versionArn;

  /// The name of an annotation store version.
  final String versionName;

  /// The size of an annotation store version in Bytes.
  final int versionSizeBytes;

  AnnotationStoreVersionItem({
    required this.creationTime,
    required this.description,
    required this.id,
    required this.name,
    required this.status,
    required this.statusMessage,
    required this.storeId,
    required this.updateTime,
    required this.versionArn,
    required this.versionName,
    required this.versionSizeBytes,
  });

  factory AnnotationStoreVersionItem.fromJson(Map<String, dynamic> json) {
    return AnnotationStoreVersionItem(
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      description: json['description'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      status: (json['status'] as String).toVersionStatus(),
      statusMessage: json['statusMessage'] as String,
      storeId: json['storeId'] as String,
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] as Object),
      versionArn: json['versionArn'] as String,
      versionName: json['versionName'] as String,
      versionSizeBytes: json['versionSizeBytes'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final description = this.description;
    final id = this.id;
    final name = this.name;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final storeId = this.storeId;
    final updateTime = this.updateTime;
    final versionArn = this.versionArn;
    final versionName = this.versionName;
    final versionSizeBytes = this.versionSizeBytes;
    return {
      'creationTime': iso8601ToJson(creationTime),
      'description': description,
      'id': id,
      'name': name,
      'status': status.toValue(),
      'statusMessage': statusMessage,
      'storeId': storeId,
      'updateTime': iso8601ToJson(updateTime),
      'versionArn': versionArn,
      'versionName': versionName,
      'versionSizeBytes': versionSizeBytes,
    };
  }
}

enum AnnotationType {
  generic,
  chrPos,
  chrPosRefAlt,
  chrStartEndOneBase,
  chrStartEndRefAltOneBase,
  chrStartEndZeroBase,
  chrStartEndRefAltZeroBase,
}

extension AnnotationTypeValueExtension on AnnotationType {
  String toValue() {
    switch (this) {
      case AnnotationType.generic:
        return 'GENERIC';
      case AnnotationType.chrPos:
        return 'CHR_POS';
      case AnnotationType.chrPosRefAlt:
        return 'CHR_POS_REF_ALT';
      case AnnotationType.chrStartEndOneBase:
        return 'CHR_START_END_ONE_BASE';
      case AnnotationType.chrStartEndRefAltOneBase:
        return 'CHR_START_END_REF_ALT_ONE_BASE';
      case AnnotationType.chrStartEndZeroBase:
        return 'CHR_START_END_ZERO_BASE';
      case AnnotationType.chrStartEndRefAltZeroBase:
        return 'CHR_START_END_REF_ALT_ZERO_BASE';
    }
  }
}

extension AnnotationTypeFromString on String {
  AnnotationType toAnnotationType() {
    switch (this) {
      case 'GENERIC':
        return AnnotationType.generic;
      case 'CHR_POS':
        return AnnotationType.chrPos;
      case 'CHR_POS_REF_ALT':
        return AnnotationType.chrPosRefAlt;
      case 'CHR_START_END_ONE_BASE':
        return AnnotationType.chrStartEndOneBase;
      case 'CHR_START_END_REF_ALT_ONE_BASE':
        return AnnotationType.chrStartEndRefAltOneBase;
      case 'CHR_START_END_ZERO_BASE':
        return AnnotationType.chrStartEndZeroBase;
      case 'CHR_START_END_REF_ALT_ZERO_BASE':
        return AnnotationType.chrStartEndRefAltZeroBase;
    }
    throw Exception('$this is not known in enum AnnotationType');
  }
}

class BatchDeleteReadSetResponse {
  /// Errors returned by individual delete operations.
  final List<ReadSetBatchError>? errors;

  BatchDeleteReadSetResponse({
    this.errors,
  });

  factory BatchDeleteReadSetResponse.fromJson(Map<String, dynamic> json) {
    return BatchDeleteReadSetResponse(
      errors: (json['errors'] as List?)
          ?.whereNotNull()
          .map((e) => ReadSetBatchError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    return {
      if (errors != null) 'errors': errors,
    };
  }
}

class CancelAnnotationImportResponse {
  CancelAnnotationImportResponse();

  factory CancelAnnotationImportResponse.fromJson(Map<String, dynamic> _) {
    return CancelAnnotationImportResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class CancelVariantImportResponse {
  CancelVariantImportResponse();

  factory CancelVariantImportResponse.fromJson(Map<String, dynamic> _) {
    return CancelVariantImportResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class CompleteMultipartReadSetUploadResponse {
  /// The read set ID created for an uploaded read set.
  final String readSetId;

  CompleteMultipartReadSetUploadResponse({
    required this.readSetId,
  });

  factory CompleteMultipartReadSetUploadResponse.fromJson(
      Map<String, dynamic> json) {
    return CompleteMultipartReadSetUploadResponse(
      readSetId: json['readSetId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final readSetId = this.readSetId;
    return {
      'readSetId': readSetId,
    };
  }
}

/// Part of the response to the CompleteReadSetUpload API, including metadata.
class CompleteReadSetUploadPartListItem {
  /// A unique identifier used to confirm that parts are being added to the
  /// correct upload.
  final String checksum;

  /// A number identifying the part in a read set upload.
  final int partNumber;

  /// The source file of the part being uploaded.
  final ReadSetPartSource partSource;

  CompleteReadSetUploadPartListItem({
    required this.checksum,
    required this.partNumber,
    required this.partSource,
  });

  Map<String, dynamic> toJson() {
    final checksum = this.checksum;
    final partNumber = this.partNumber;
    final partSource = this.partSource;
    return {
      'checksum': checksum,
      'partNumber': partNumber,
      'partSource': partSource.toValue(),
    };
  }
}

class CreateAnnotationStoreResponse {
  /// When the store was created.
  final DateTime creationTime;

  /// The store's ID.
  final String id;

  /// The store's name.
  final String name;

  /// The store's status.
  final StoreStatus status;

  /// The name given to an annotation store version to distinguish it from other
  /// versions.
  final String versionName;

  /// The store's genome reference. Required for all stores except TSV format with
  /// generic annotations.
  final ReferenceItem? reference;

  /// The annotation file format of the store.
  final StoreFormat? storeFormat;

  /// The store's file parsing options.
  final StoreOptions? storeOptions;

  CreateAnnotationStoreResponse({
    required this.creationTime,
    required this.id,
    required this.name,
    required this.status,
    required this.versionName,
    this.reference,
    this.storeFormat,
    this.storeOptions,
  });

  factory CreateAnnotationStoreResponse.fromJson(Map<String, dynamic> json) {
    return CreateAnnotationStoreResponse(
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      id: json['id'] as String,
      name: json['name'] as String,
      status: (json['status'] as String).toStoreStatus(),
      versionName: json['versionName'] as String,
      reference: json['reference'] != null
          ? ReferenceItem.fromJson(json['reference'] as Map<String, dynamic>)
          : null,
      storeFormat: (json['storeFormat'] as String?)?.toStoreFormat(),
      storeOptions: json['storeOptions'] != null
          ? StoreOptions.fromJson(json['storeOptions'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final id = this.id;
    final name = this.name;
    final status = this.status;
    final versionName = this.versionName;
    final reference = this.reference;
    final storeFormat = this.storeFormat;
    final storeOptions = this.storeOptions;
    return {
      'creationTime': iso8601ToJson(creationTime),
      'id': id,
      'name': name,
      'status': status.toValue(),
      'versionName': versionName,
      if (reference != null) 'reference': reference,
      if (storeFormat != null) 'storeFormat': storeFormat.toValue(),
      if (storeOptions != null) 'storeOptions': storeOptions,
    };
  }
}

class CreateAnnotationStoreVersionResponse {
  /// The time stamp for the creation of an annotation store version.
  final DateTime creationTime;

  /// A generated ID for the annotation store
  final String id;

  /// The name given to an annotation store version to distinguish it from other
  /// versions.
  final String name;

  /// The status of a annotation store version.
  final VersionStatus status;

  /// The ID for the annotation store from which new versions are being created.
  final String storeId;

  /// The name given to an annotation store version to distinguish it from other
  /// versions.
  final String versionName;

  /// The options for an annotation store version.
  final VersionOptions? versionOptions;

  CreateAnnotationStoreVersionResponse({
    required this.creationTime,
    required this.id,
    required this.name,
    required this.status,
    required this.storeId,
    required this.versionName,
    this.versionOptions,
  });

  factory CreateAnnotationStoreVersionResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateAnnotationStoreVersionResponse(
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      id: json['id'] as String,
      name: json['name'] as String,
      status: (json['status'] as String).toVersionStatus(),
      storeId: json['storeId'] as String,
      versionName: json['versionName'] as String,
      versionOptions: json['versionOptions'] != null
          ? VersionOptions.fromJson(
              json['versionOptions'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final id = this.id;
    final name = this.name;
    final status = this.status;
    final storeId = this.storeId;
    final versionName = this.versionName;
    final versionOptions = this.versionOptions;
    return {
      'creationTime': iso8601ToJson(creationTime),
      'id': id,
      'name': name,
      'status': status.toValue(),
      'storeId': storeId,
      'versionName': versionName,
      if (versionOptions != null) 'versionOptions': versionOptions,
    };
  }
}

class CreateMultipartReadSetUploadResponse {
  /// The creation time of the multipart upload.
  final DateTime creationTime;

  /// The read set source's reference ARN.
  final String referenceArn;

  /// The source's sample ID.
  final String sampleId;

  /// The sequence store ID for the store that the read set will be created in.
  final String sequenceStoreId;

  /// The file type of the read set source.
  final FileType sourceFileType;

  /// The source's subject ID.
  final String subjectId;

  /// The ID for the initiated multipart upload.
  final String uploadId;

  /// The description of the read set.
  final String? description;

  /// The source of the read set.
  final String? generatedFrom;

  /// The name of the read set.
  final String? name;

  /// The tags to add to the read set.
  final Map<String, String>? tags;

  CreateMultipartReadSetUploadResponse({
    required this.creationTime,
    required this.referenceArn,
    required this.sampleId,
    required this.sequenceStoreId,
    required this.sourceFileType,
    required this.subjectId,
    required this.uploadId,
    this.description,
    this.generatedFrom,
    this.name,
    this.tags,
  });

  factory CreateMultipartReadSetUploadResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateMultipartReadSetUploadResponse(
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      referenceArn: json['referenceArn'] as String,
      sampleId: json['sampleId'] as String,
      sequenceStoreId: json['sequenceStoreId'] as String,
      sourceFileType: (json['sourceFileType'] as String).toFileType(),
      subjectId: json['subjectId'] as String,
      uploadId: json['uploadId'] as String,
      description: json['description'] as String?,
      generatedFrom: json['generatedFrom'] as String?,
      name: json['name'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final referenceArn = this.referenceArn;
    final sampleId = this.sampleId;
    final sequenceStoreId = this.sequenceStoreId;
    final sourceFileType = this.sourceFileType;
    final subjectId = this.subjectId;
    final uploadId = this.uploadId;
    final description = this.description;
    final generatedFrom = this.generatedFrom;
    final name = this.name;
    final tags = this.tags;
    return {
      'creationTime': iso8601ToJson(creationTime),
      'referenceArn': referenceArn,
      'sampleId': sampleId,
      'sequenceStoreId': sequenceStoreId,
      'sourceFileType': sourceFileType.toValue(),
      'subjectId': subjectId,
      'uploadId': uploadId,
      if (description != null) 'description': description,
      if (generatedFrom != null) 'generatedFrom': generatedFrom,
      if (name != null) 'name': name,
      if (tags != null) 'tags': tags,
    };
  }
}

class CreateReferenceStoreResponse {
  /// The store's ARN.
  final String arn;

  /// When the store was created.
  final DateTime creationTime;

  /// The store's ID.
  final String id;

  /// The store's description.
  final String? description;

  /// The store's name.
  final String? name;

  /// The store's SSE settings.
  final SseConfig? sseConfig;

  CreateReferenceStoreResponse({
    required this.arn,
    required this.creationTime,
    required this.id,
    this.description,
    this.name,
    this.sseConfig,
  });

  factory CreateReferenceStoreResponse.fromJson(Map<String, dynamic> json) {
    return CreateReferenceStoreResponse(
      arn: json['arn'] as String,
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      id: json['id'] as String,
      description: json['description'] as String?,
      name: json['name'] as String?,
      sseConfig: json['sseConfig'] != null
          ? SseConfig.fromJson(json['sseConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final id = this.id;
    final description = this.description;
    final name = this.name;
    final sseConfig = this.sseConfig;
    return {
      'arn': arn,
      'creationTime': iso8601ToJson(creationTime),
      'id': id,
      if (description != null) 'description': description,
      if (name != null) 'name': name,
      if (sseConfig != null) 'sseConfig': sseConfig,
    };
  }
}

class CreateRunGroupResponse {
  /// The group's ARN.
  final String? arn;

  /// The group's ID.
  final String? id;

  /// Tags for the run group.
  final Map<String, String>? tags;

  CreateRunGroupResponse({
    this.arn,
    this.id,
    this.tags,
  });

  factory CreateRunGroupResponse.fromJson(Map<String, dynamic> json) {
    return CreateRunGroupResponse(
      arn: json['arn'] as String?,
      id: json['id'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (id != null) 'id': id,
      if (tags != null) 'tags': tags,
    };
  }
}

class CreateSequenceStoreResponse {
  /// The store's ARN.
  final String arn;

  /// When the store was created.
  final DateTime creationTime;

  /// The store's ID.
  final String id;

  /// The store's description.
  final String? description;

  /// The algorithm family of the ETag.
  final ETagAlgorithmFamily? eTagAlgorithmFamily;

  /// An S3 location that is used to store files that have failed a direct upload.
  final String? fallbackLocation;

  /// The store's name.
  final String? name;

  /// The store's SSE settings.
  final SseConfig? sseConfig;

  CreateSequenceStoreResponse({
    required this.arn,
    required this.creationTime,
    required this.id,
    this.description,
    this.eTagAlgorithmFamily,
    this.fallbackLocation,
    this.name,
    this.sseConfig,
  });

  factory CreateSequenceStoreResponse.fromJson(Map<String, dynamic> json) {
    return CreateSequenceStoreResponse(
      arn: json['arn'] as String,
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      id: json['id'] as String,
      description: json['description'] as String?,
      eTagAlgorithmFamily:
          (json['eTagAlgorithmFamily'] as String?)?.toETagAlgorithmFamily(),
      fallbackLocation: json['fallbackLocation'] as String?,
      name: json['name'] as String?,
      sseConfig: json['sseConfig'] != null
          ? SseConfig.fromJson(json['sseConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final id = this.id;
    final description = this.description;
    final eTagAlgorithmFamily = this.eTagAlgorithmFamily;
    final fallbackLocation = this.fallbackLocation;
    final name = this.name;
    final sseConfig = this.sseConfig;
    return {
      'arn': arn,
      'creationTime': iso8601ToJson(creationTime),
      'id': id,
      if (description != null) 'description': description,
      if (eTagAlgorithmFamily != null)
        'eTagAlgorithmFamily': eTagAlgorithmFamily.toValue(),
      if (fallbackLocation != null) 'fallbackLocation': fallbackLocation,
      if (name != null) 'name': name,
      if (sseConfig != null) 'sseConfig': sseConfig,
    };
  }
}

class CreateShareResponse {
  /// The ID that HealthOmics generates for the share.
  final String? shareId;

  /// The name of the share.
  final String? shareName;

  /// The status of the share.
  final ShareStatus? status;

  CreateShareResponse({
    this.shareId,
    this.shareName,
    this.status,
  });

  factory CreateShareResponse.fromJson(Map<String, dynamic> json) {
    return CreateShareResponse(
      shareId: json['shareId'] as String?,
      shareName: json['shareName'] as String?,
      status: (json['status'] as String?)?.toShareStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final shareId = this.shareId;
    final shareName = this.shareName;
    final status = this.status;
    return {
      if (shareId != null) 'shareId': shareId,
      if (shareName != null) 'shareName': shareName,
      if (status != null) 'status': status.toValue(),
    };
  }
}

class CreateVariantStoreResponse {
  /// When the store was created.
  final DateTime creationTime;

  /// The store's ID.
  final String id;

  /// The store's name.
  final String name;

  /// The store's status.
  final StoreStatus status;

  /// The store's genome reference.
  final ReferenceItem? reference;

  CreateVariantStoreResponse({
    required this.creationTime,
    required this.id,
    required this.name,
    required this.status,
    this.reference,
  });

  factory CreateVariantStoreResponse.fromJson(Map<String, dynamic> json) {
    return CreateVariantStoreResponse(
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      id: json['id'] as String,
      name: json['name'] as String,
      status: (json['status'] as String).toStoreStatus(),
      reference: json['reference'] != null
          ? ReferenceItem.fromJson(json['reference'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final id = this.id;
    final name = this.name;
    final status = this.status;
    final reference = this.reference;
    return {
      'creationTime': iso8601ToJson(creationTime),
      'id': id,
      'name': name,
      'status': status.toValue(),
      if (reference != null) 'reference': reference,
    };
  }
}

class CreateWorkflowResponse {
  /// The workflow's ARN.
  final String? arn;

  /// The workflow's ID.
  final String? id;

  /// The workflow's status.
  final WorkflowStatus? status;

  /// The workflow's tags.
  final Map<String, String>? tags;

  CreateWorkflowResponse({
    this.arn,
    this.id,
    this.status,
    this.tags,
  });

  factory CreateWorkflowResponse.fromJson(Map<String, dynamic> json) {
    return CreateWorkflowResponse(
      arn: json['arn'] as String?,
      id: json['id'] as String?,
      status: (json['status'] as String?)?.toWorkflowStatus(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final status = this.status;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (id != null) 'id': id,
      if (status != null) 'status': status.toValue(),
      if (tags != null) 'tags': tags,
    };
  }
}

enum CreationType {
  import,
  upload,
}

extension CreationTypeValueExtension on CreationType {
  String toValue() {
    switch (this) {
      case CreationType.import:
        return 'IMPORT';
      case CreationType.upload:
        return 'UPLOAD';
    }
  }
}

extension CreationTypeFromString on String {
  CreationType toCreationType() {
    switch (this) {
      case 'IMPORT':
        return CreationType.import;
      case 'UPLOAD':
        return CreationType.upload;
    }
    throw Exception('$this is not known in enum CreationType');
  }
}

class DeleteAnnotationStoreResponse {
  /// The store's status.
  final StoreStatus status;

  DeleteAnnotationStoreResponse({
    required this.status,
  });

  factory DeleteAnnotationStoreResponse.fromJson(Map<String, dynamic> json) {
    return DeleteAnnotationStoreResponse(
      status: (json['status'] as String).toStoreStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      'status': status.toValue(),
    };
  }
}

class DeleteAnnotationStoreVersionsResponse {
  /// Any errors that occur when attempting to delete an annotation store version.
  final List<VersionDeleteError>? errors;

  DeleteAnnotationStoreVersionsResponse({
    this.errors,
  });

  factory DeleteAnnotationStoreVersionsResponse.fromJson(
      Map<String, dynamic> json) {
    return DeleteAnnotationStoreVersionsResponse(
      errors: (json['errors'] as List?)
          ?.whereNotNull()
          .map((e) => VersionDeleteError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    return {
      if (errors != null) 'errors': errors,
    };
  }
}

class DeleteReferenceResponse {
  DeleteReferenceResponse();

  factory DeleteReferenceResponse.fromJson(Map<String, dynamic> _) {
    return DeleteReferenceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteReferenceStoreResponse {
  DeleteReferenceStoreResponse();

  factory DeleteReferenceStoreResponse.fromJson(Map<String, dynamic> _) {
    return DeleteReferenceStoreResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteSequenceStoreResponse {
  DeleteSequenceStoreResponse();

  factory DeleteSequenceStoreResponse.fromJson(Map<String, dynamic> _) {
    return DeleteSequenceStoreResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteShareResponse {
  /// The status of the share being deleted.
  final ShareStatus? status;

  DeleteShareResponse({
    this.status,
  });

  factory DeleteShareResponse.fromJson(Map<String, dynamic> json) {
    return DeleteShareResponse(
      status: (json['status'] as String?)?.toShareStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      if (status != null) 'status': status.toValue(),
    };
  }
}

class DeleteVariantStoreResponse {
  /// The store's status.
  final StoreStatus status;

  DeleteVariantStoreResponse({
    required this.status,
  });

  factory DeleteVariantStoreResponse.fromJson(Map<String, dynamic> json) {
    return DeleteVariantStoreResponse(
      status: (json['status'] as String).toStoreStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      'status': status.toValue(),
    };
  }
}

/// The entity tag (ETag) is a hash of the object representing its semantic
/// content.
class ETag {
  /// The algorithm used to calculate the read set’s ETag(s).
  final ETagAlgorithm? algorithm;

  /// The ETag hash calculated on Source1 of the read set.
  final String? source1;

  /// The ETag hash calculated on Source2 of the read set.
  final String? source2;

  ETag({
    this.algorithm,
    this.source1,
    this.source2,
  });

  factory ETag.fromJson(Map<String, dynamic> json) {
    return ETag(
      algorithm: (json['algorithm'] as String?)?.toETagAlgorithm(),
      source1: json['source1'] as String?,
      source2: json['source2'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final algorithm = this.algorithm;
    final source1 = this.source1;
    final source2 = this.source2;
    return {
      if (algorithm != null) 'algorithm': algorithm.toValue(),
      if (source1 != null) 'source1': source1,
      if (source2 != null) 'source2': source2,
    };
  }
}

enum ETagAlgorithm {
  fastqMD5up,
  bamMD5up,
  cramMD5up,
  fastqSHA256up,
  bamSHA256up,
  cramSHA256up,
  fastqSHA512up,
  bamSHA512up,
  cramSHA512up,
}

extension ETagAlgorithmValueExtension on ETagAlgorithm {
  String toValue() {
    switch (this) {
      case ETagAlgorithm.fastqMD5up:
        return 'FASTQ_MD5up';
      case ETagAlgorithm.bamMD5up:
        return 'BAM_MD5up';
      case ETagAlgorithm.cramMD5up:
        return 'CRAM_MD5up';
      case ETagAlgorithm.fastqSHA256up:
        return 'FASTQ_SHA256up';
      case ETagAlgorithm.bamSHA256up:
        return 'BAM_SHA256up';
      case ETagAlgorithm.cramSHA256up:
        return 'CRAM_SHA256up';
      case ETagAlgorithm.fastqSHA512up:
        return 'FASTQ_SHA512up';
      case ETagAlgorithm.bamSHA512up:
        return 'BAM_SHA512up';
      case ETagAlgorithm.cramSHA512up:
        return 'CRAM_SHA512up';
    }
  }
}

extension ETagAlgorithmFromString on String {
  ETagAlgorithm toETagAlgorithm() {
    switch (this) {
      case 'FASTQ_MD5up':
        return ETagAlgorithm.fastqMD5up;
      case 'BAM_MD5up':
        return ETagAlgorithm.bamMD5up;
      case 'CRAM_MD5up':
        return ETagAlgorithm.cramMD5up;
      case 'FASTQ_SHA256up':
        return ETagAlgorithm.fastqSHA256up;
      case 'BAM_SHA256up':
        return ETagAlgorithm.bamSHA256up;
      case 'CRAM_SHA256up':
        return ETagAlgorithm.cramSHA256up;
      case 'FASTQ_SHA512up':
        return ETagAlgorithm.fastqSHA512up;
      case 'BAM_SHA512up':
        return ETagAlgorithm.bamSHA512up;
      case 'CRAM_SHA512up':
        return ETagAlgorithm.cramSHA512up;
    }
    throw Exception('$this is not known in enum ETagAlgorithm');
  }
}

enum ETagAlgorithmFamily {
  mD5up,
  sHA256up,
  sHA512up,
}

extension ETagAlgorithmFamilyValueExtension on ETagAlgorithmFamily {
  String toValue() {
    switch (this) {
      case ETagAlgorithmFamily.mD5up:
        return 'MD5up';
      case ETagAlgorithmFamily.sHA256up:
        return 'SHA256up';
      case ETagAlgorithmFamily.sHA512up:
        return 'SHA512up';
    }
  }
}

extension ETagAlgorithmFamilyFromString on String {
  ETagAlgorithmFamily toETagAlgorithmFamily() {
    switch (this) {
      case 'MD5up':
        return ETagAlgorithmFamily.mD5up;
      case 'SHA256up':
        return ETagAlgorithmFamily.sHA256up;
      case 'SHA512up':
        return ETagAlgorithmFamily.sHA512up;
    }
    throw Exception('$this is not known in enum ETagAlgorithmFamily');
  }
}

enum EncryptionType {
  kms,
}

extension EncryptionTypeValueExtension on EncryptionType {
  String toValue() {
    switch (this) {
      case EncryptionType.kms:
        return 'KMS';
    }
  }
}

extension EncryptionTypeFromString on String {
  EncryptionType toEncryptionType() {
    switch (this) {
      case 'KMS':
        return EncryptionType.kms;
    }
    throw Exception('$this is not known in enum EncryptionType');
  }
}

/// A read set.
class ExportReadSet {
  /// The set's ID.
  final String readSetId;

  ExportReadSet({
    required this.readSetId,
  });

  Map<String, dynamic> toJson() {
    final readSetId = this.readSetId;
    return {
      'readSetId': readSetId,
    };
  }
}

/// Details about a read set.
class ExportReadSetDetail {
  /// The set's ID.
  final String id;

  /// The set's status.
  final ReadSetExportJobItemStatus status;

  /// The set's status message.
  final String? statusMessage;

  ExportReadSetDetail({
    required this.id,
    required this.status,
    this.statusMessage,
  });

  factory ExportReadSetDetail.fromJson(Map<String, dynamic> json) {
    return ExportReadSetDetail(
      id: json['id'] as String,
      status: (json['status'] as String).toReadSetExportJobItemStatus(),
      statusMessage: json['statusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final status = this.status;
    final statusMessage = this.statusMessage;
    return {
      'id': id,
      'status': status.toValue(),
      if (statusMessage != null) 'statusMessage': statusMessage,
    };
  }
}

/// An read set export job filter.
class ExportReadSetFilter {
  /// The filter's start date.
  final DateTime? createdAfter;

  /// The filter's end date.
  final DateTime? createdBefore;

  /// A status to filter on.
  final ReadSetExportJobStatus? status;

  ExportReadSetFilter({
    this.createdAfter,
    this.createdBefore,
    this.status,
  });

  Map<String, dynamic> toJson() {
    final createdAfter = this.createdAfter;
    final createdBefore = this.createdBefore;
    final status = this.status;
    return {
      if (createdAfter != null) 'createdAfter': iso8601ToJson(createdAfter),
      if (createdBefore != null) 'createdBefore': iso8601ToJson(createdBefore),
      if (status != null) 'status': status.toValue(),
    };
  }
}

/// Details about a read set export job.
class ExportReadSetJobDetail {
  /// When the job was created.
  final DateTime creationTime;

  /// The job's destination in Amazon S3.
  final String destination;

  /// The job's ID.
  final String id;

  /// The job's sequence store ID.
  final String sequenceStoreId;

  /// The job's status.
  final ReadSetExportJobStatus status;

  /// When the job completed.
  final DateTime? completionTime;

  ExportReadSetJobDetail({
    required this.creationTime,
    required this.destination,
    required this.id,
    required this.sequenceStoreId,
    required this.status,
    this.completionTime,
  });

  factory ExportReadSetJobDetail.fromJson(Map<String, dynamic> json) {
    return ExportReadSetJobDetail(
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      destination: json['destination'] as String,
      id: json['id'] as String,
      sequenceStoreId: json['sequenceStoreId'] as String,
      status: (json['status'] as String).toReadSetExportJobStatus(),
      completionTime: timeStampFromJson(json['completionTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final destination = this.destination;
    final id = this.id;
    final sequenceStoreId = this.sequenceStoreId;
    final status = this.status;
    final completionTime = this.completionTime;
    return {
      'creationTime': iso8601ToJson(creationTime),
      'destination': destination,
      'id': id,
      'sequenceStoreId': sequenceStoreId,
      'status': status.toValue(),
      if (completionTime != null)
        'completionTime': iso8601ToJson(completionTime),
    };
  }
}

/// Details about a file.
class FileInformation {
  /// The file's content length.
  final int? contentLength;

  /// The file's part size.
  final int? partSize;

  /// The S3 URI metadata of a sequence store.
  final ReadSetS3Access? s3Access;

  /// The file's total parts.
  final int? totalParts;

  FileInformation({
    this.contentLength,
    this.partSize,
    this.s3Access,
    this.totalParts,
  });

  factory FileInformation.fromJson(Map<String, dynamic> json) {
    return FileInformation(
      contentLength: json['contentLength'] as int?,
      partSize: json['partSize'] as int?,
      s3Access: json['s3Access'] != null
          ? ReadSetS3Access.fromJson(json['s3Access'] as Map<String, dynamic>)
          : null,
      totalParts: json['totalParts'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final contentLength = this.contentLength;
    final partSize = this.partSize;
    final s3Access = this.s3Access;
    final totalParts = this.totalParts;
    return {
      if (contentLength != null) 'contentLength': contentLength,
      if (partSize != null) 'partSize': partSize,
      if (s3Access != null) 's3Access': s3Access,
      if (totalParts != null) 'totalParts': totalParts,
    };
  }
}

enum FileType {
  fastq,
  bam,
  cram,
  ubam,
}

extension FileTypeValueExtension on FileType {
  String toValue() {
    switch (this) {
      case FileType.fastq:
        return 'FASTQ';
      case FileType.bam:
        return 'BAM';
      case FileType.cram:
        return 'CRAM';
      case FileType.ubam:
        return 'UBAM';
    }
  }
}

extension FileTypeFromString on String {
  FileType toFileType() {
    switch (this) {
      case 'FASTQ':
        return FileType.fastq;
      case 'BAM':
        return FileType.bam;
      case 'CRAM':
        return FileType.cram;
      case 'UBAM':
        return FileType.ubam;
    }
    throw Exception('$this is not known in enum FileType');
  }
}

/// Use filters to return a subset of resources. You can define filters for
/// specific parameters, such as the resource status.
class Filter {
  /// Filter based on the Amazon Resource Number (ARN) of the resource. You can
  /// specify up to 10 values.
  final List<String>? resourceArns;

  /// Filter based on the resource status. You can specify up to 10 values.
  final List<ShareStatus>? status;

  /// The type of resources to be filtered. You can specify one or more of the
  /// resource types.
  final List<ShareResourceType>? type;

  Filter({
    this.resourceArns,
    this.status,
    this.type,
  });

  Map<String, dynamic> toJson() {
    final resourceArns = this.resourceArns;
    final status = this.status;
    final type = this.type;
    return {
      if (resourceArns != null) 'resourceArns': resourceArns,
      if (status != null) 'status': status.map((e) => e.toValue()).toList(),
      if (type != null) 'type': type.map((e) => e.toValue()).toList(),
    };
  }
}

/// Formatting options for a file.
class FormatOptions {
  /// Options for a TSV file.
  final TsvOptions? tsvOptions;

  /// Options for a VCF file.
  final VcfOptions? vcfOptions;

  FormatOptions({
    this.tsvOptions,
    this.vcfOptions,
  });

  factory FormatOptions.fromJson(Map<String, dynamic> json) {
    return FormatOptions(
      tsvOptions: json['tsvOptions'] != null
          ? TsvOptions.fromJson(json['tsvOptions'] as Map<String, dynamic>)
          : null,
      vcfOptions: json['vcfOptions'] != null
          ? VcfOptions.fromJson(json['vcfOptions'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final tsvOptions = this.tsvOptions;
    final vcfOptions = this.vcfOptions;
    return {
      if (tsvOptions != null) 'tsvOptions': tsvOptions,
      if (vcfOptions != null) 'vcfOptions': vcfOptions,
    };
  }
}

enum FormatToHeaderKey {
  chr,
  start,
  end,
  ref,
  alt,
  pos,
}

extension FormatToHeaderKeyValueExtension on FormatToHeaderKey {
  String toValue() {
    switch (this) {
      case FormatToHeaderKey.chr:
        return 'CHR';
      case FormatToHeaderKey.start:
        return 'START';
      case FormatToHeaderKey.end:
        return 'END';
      case FormatToHeaderKey.ref:
        return 'REF';
      case FormatToHeaderKey.alt:
        return 'ALT';
      case FormatToHeaderKey.pos:
        return 'POS';
    }
  }
}

extension FormatToHeaderKeyFromString on String {
  FormatToHeaderKey toFormatToHeaderKey() {
    switch (this) {
      case 'CHR':
        return FormatToHeaderKey.chr;
      case 'START':
        return FormatToHeaderKey.start;
      case 'END':
        return FormatToHeaderKey.end;
      case 'REF':
        return FormatToHeaderKey.ref;
      case 'ALT':
        return FormatToHeaderKey.alt;
      case 'POS':
        return FormatToHeaderKey.pos;
    }
    throw Exception('$this is not known in enum FormatToHeaderKey');
  }
}

class GetAnnotationImportResponse {
  /// When the job completed.
  final DateTime completionTime;

  /// When the job was created.
  final DateTime creationTime;

  /// The job's destination annotation store.
  final String destinationName;
  final FormatOptions formatOptions;

  /// The job's ID.
  final String id;

  /// The job's imported items.
  final List<AnnotationImportItemDetail> items;

  /// The job's service role ARN.
  final String roleArn;

  /// The job's left normalization setting.
  final bool runLeftNormalization;

  /// The job's status.
  final JobStatus status;

  /// The job's status message.
  final String statusMessage;

  /// When the job was updated.
  final DateTime updateTime;

  /// The name of the annotation store version.
  final String versionName;

  /// The annotation schema generated by the parsed annotation data.
  final Map<String, String>? annotationFields;

  GetAnnotationImportResponse({
    required this.completionTime,
    required this.creationTime,
    required this.destinationName,
    required this.formatOptions,
    required this.id,
    required this.items,
    required this.roleArn,
    required this.runLeftNormalization,
    required this.status,
    required this.statusMessage,
    required this.updateTime,
    required this.versionName,
    this.annotationFields,
  });

  factory GetAnnotationImportResponse.fromJson(Map<String, dynamic> json) {
    return GetAnnotationImportResponse(
      completionTime:
          nonNullableTimeStampFromJson(json['completionTime'] as Object),
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      destinationName: json['destinationName'] as String,
      formatOptions:
          FormatOptions.fromJson(json['formatOptions'] as Map<String, dynamic>),
      id: json['id'] as String,
      items: (json['items'] as List)
          .whereNotNull()
          .map((e) =>
              AnnotationImportItemDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      roleArn: json['roleArn'] as String,
      runLeftNormalization: json['runLeftNormalization'] as bool,
      status: (json['status'] as String).toJobStatus(),
      statusMessage: json['statusMessage'] as String,
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] as Object),
      versionName: json['versionName'] as String,
      annotationFields: (json['annotationFields'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final completionTime = this.completionTime;
    final creationTime = this.creationTime;
    final destinationName = this.destinationName;
    final formatOptions = this.formatOptions;
    final id = this.id;
    final items = this.items;
    final roleArn = this.roleArn;
    final runLeftNormalization = this.runLeftNormalization;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final updateTime = this.updateTime;
    final versionName = this.versionName;
    final annotationFields = this.annotationFields;
    return {
      'completionTime': iso8601ToJson(completionTime),
      'creationTime': iso8601ToJson(creationTime),
      'destinationName': destinationName,
      'formatOptions': formatOptions,
      'id': id,
      'items': items,
      'roleArn': roleArn,
      'runLeftNormalization': runLeftNormalization,
      'status': status.toValue(),
      'statusMessage': statusMessage,
      'updateTime': iso8601ToJson(updateTime),
      'versionName': versionName,
      if (annotationFields != null) 'annotationFields': annotationFields,
    };
  }
}

class GetAnnotationStoreResponse {
  /// When the store was created.
  final DateTime creationTime;

  /// The store's description.
  final String description;

  /// The store's ID.
  final String id;

  /// The store's name.
  final String name;

  /// An integer indicating how many versions of an annotation store exist.
  final int numVersions;

  /// The store's genome reference.
  final ReferenceItem reference;

  /// The store's server-side encryption (SSE) settings.
  final SseConfig sseConfig;

  /// The store's status.
  final StoreStatus status;

  /// A status message.
  final String statusMessage;

  /// The store's ARN.
  final String storeArn;

  /// The store's size in bytes.
  final int storeSizeBytes;

  /// The store's tags.
  final Map<String, String> tags;

  /// When the store was updated.
  final DateTime updateTime;

  /// The store's annotation file format.
  final StoreFormat? storeFormat;

  /// The store's parsing options.
  final StoreOptions? storeOptions;

  GetAnnotationStoreResponse({
    required this.creationTime,
    required this.description,
    required this.id,
    required this.name,
    required this.numVersions,
    required this.reference,
    required this.sseConfig,
    required this.status,
    required this.statusMessage,
    required this.storeArn,
    required this.storeSizeBytes,
    required this.tags,
    required this.updateTime,
    this.storeFormat,
    this.storeOptions,
  });

  factory GetAnnotationStoreResponse.fromJson(Map<String, dynamic> json) {
    return GetAnnotationStoreResponse(
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      description: json['description'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      numVersions: json['numVersions'] as int,
      reference:
          ReferenceItem.fromJson(json['reference'] as Map<String, dynamic>),
      sseConfig: SseConfig.fromJson(json['sseConfig'] as Map<String, dynamic>),
      status: (json['status'] as String).toStoreStatus(),
      statusMessage: json['statusMessage'] as String,
      storeArn: json['storeArn'] as String,
      storeSizeBytes: json['storeSizeBytes'] as int,
      tags: (json['tags'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(k, e as String)),
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] as Object),
      storeFormat: (json['storeFormat'] as String?)?.toStoreFormat(),
      storeOptions: json['storeOptions'] != null
          ? StoreOptions.fromJson(json['storeOptions'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final description = this.description;
    final id = this.id;
    final name = this.name;
    final numVersions = this.numVersions;
    final reference = this.reference;
    final sseConfig = this.sseConfig;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final storeArn = this.storeArn;
    final storeSizeBytes = this.storeSizeBytes;
    final tags = this.tags;
    final updateTime = this.updateTime;
    final storeFormat = this.storeFormat;
    final storeOptions = this.storeOptions;
    return {
      'creationTime': iso8601ToJson(creationTime),
      'description': description,
      'id': id,
      'name': name,
      'numVersions': numVersions,
      'reference': reference,
      'sseConfig': sseConfig,
      'status': status.toValue(),
      'statusMessage': statusMessage,
      'storeArn': storeArn,
      'storeSizeBytes': storeSizeBytes,
      'tags': tags,
      'updateTime': iso8601ToJson(updateTime),
      if (storeFormat != null) 'storeFormat': storeFormat.toValue(),
      if (storeOptions != null) 'storeOptions': storeOptions,
    };
  }
}

class GetAnnotationStoreVersionResponse {
  /// The time stamp for when an annotation store version was created.
  final DateTime creationTime;

  /// The description for an annotation store version.
  final String description;

  /// The annotation store version ID.
  final String id;

  /// The name of the annotation store.
  final String name;

  /// The status of an annotation store version.
  final VersionStatus status;

  /// The status of an annotation store version.
  final String statusMessage;

  /// The store ID for annotation store version.
  final String storeId;

  /// Any tags associated with an annotation store version.
  final Map<String, String> tags;

  /// The time stamp for when an annotation store version was updated.
  final DateTime updateTime;

  /// The Arn for the annotation store.
  final String versionArn;

  /// The name given to an annotation store version to distinguish it from others.
  final String versionName;

  /// The size of the annotation store version in Bytes.
  final int versionSizeBytes;

  /// The options for an annotation store version.
  final VersionOptions? versionOptions;

  GetAnnotationStoreVersionResponse({
    required this.creationTime,
    required this.description,
    required this.id,
    required this.name,
    required this.status,
    required this.statusMessage,
    required this.storeId,
    required this.tags,
    required this.updateTime,
    required this.versionArn,
    required this.versionName,
    required this.versionSizeBytes,
    this.versionOptions,
  });

  factory GetAnnotationStoreVersionResponse.fromJson(
      Map<String, dynamic> json) {
    return GetAnnotationStoreVersionResponse(
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      description: json['description'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      status: (json['status'] as String).toVersionStatus(),
      statusMessage: json['statusMessage'] as String,
      storeId: json['storeId'] as String,
      tags: (json['tags'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(k, e as String)),
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] as Object),
      versionArn: json['versionArn'] as String,
      versionName: json['versionName'] as String,
      versionSizeBytes: json['versionSizeBytes'] as int,
      versionOptions: json['versionOptions'] != null
          ? VersionOptions.fromJson(
              json['versionOptions'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final description = this.description;
    final id = this.id;
    final name = this.name;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final storeId = this.storeId;
    final tags = this.tags;
    final updateTime = this.updateTime;
    final versionArn = this.versionArn;
    final versionName = this.versionName;
    final versionSizeBytes = this.versionSizeBytes;
    final versionOptions = this.versionOptions;
    return {
      'creationTime': iso8601ToJson(creationTime),
      'description': description,
      'id': id,
      'name': name,
      'status': status.toValue(),
      'statusMessage': statusMessage,
      'storeId': storeId,
      'tags': tags,
      'updateTime': iso8601ToJson(updateTime),
      'versionArn': versionArn,
      'versionName': versionName,
      'versionSizeBytes': versionSizeBytes,
      if (versionOptions != null) 'versionOptions': versionOptions,
    };
  }
}

class GetReadSetActivationJobResponse {
  /// When the job was created.
  final DateTime creationTime;

  /// The job's ID.
  final String id;

  /// The job's sequence store ID.
  final String sequenceStoreId;

  /// The job's status.
  final ReadSetActivationJobStatus status;

  /// When the job completed.
  final DateTime? completionTime;

  /// The job's source files.
  final List<ActivateReadSetSourceItem>? sources;

  /// The job's status message.
  final String? statusMessage;

  GetReadSetActivationJobResponse({
    required this.creationTime,
    required this.id,
    required this.sequenceStoreId,
    required this.status,
    this.completionTime,
    this.sources,
    this.statusMessage,
  });

  factory GetReadSetActivationJobResponse.fromJson(Map<String, dynamic> json) {
    return GetReadSetActivationJobResponse(
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      id: json['id'] as String,
      sequenceStoreId: json['sequenceStoreId'] as String,
      status: (json['status'] as String).toReadSetActivationJobStatus(),
      completionTime: timeStampFromJson(json['completionTime']),
      sources: (json['sources'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ActivateReadSetSourceItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      statusMessage: json['statusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final id = this.id;
    final sequenceStoreId = this.sequenceStoreId;
    final status = this.status;
    final completionTime = this.completionTime;
    final sources = this.sources;
    final statusMessage = this.statusMessage;
    return {
      'creationTime': iso8601ToJson(creationTime),
      'id': id,
      'sequenceStoreId': sequenceStoreId,
      'status': status.toValue(),
      if (completionTime != null)
        'completionTime': iso8601ToJson(completionTime),
      if (sources != null) 'sources': sources,
      if (statusMessage != null) 'statusMessage': statusMessage,
    };
  }
}

class GetReadSetExportJobResponse {
  /// When the job was created.
  final DateTime creationTime;

  /// The job's destination in Amazon S3.
  final String destination;

  /// The job's ID.
  final String id;

  /// The job's sequence store ID.
  final String sequenceStoreId;

  /// The job's status.
  final ReadSetExportJobStatus status;

  /// When the job completed.
  final DateTime? completionTime;

  /// The job's read sets.
  final List<ExportReadSetDetail>? readSets;

  /// The job's status message.
  final String? statusMessage;

  GetReadSetExportJobResponse({
    required this.creationTime,
    required this.destination,
    required this.id,
    required this.sequenceStoreId,
    required this.status,
    this.completionTime,
    this.readSets,
    this.statusMessage,
  });

  factory GetReadSetExportJobResponse.fromJson(Map<String, dynamic> json) {
    return GetReadSetExportJobResponse(
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      destination: json['destination'] as String,
      id: json['id'] as String,
      sequenceStoreId: json['sequenceStoreId'] as String,
      status: (json['status'] as String).toReadSetExportJobStatus(),
      completionTime: timeStampFromJson(json['completionTime']),
      readSets: (json['readSets'] as List?)
          ?.whereNotNull()
          .map((e) => ExportReadSetDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      statusMessage: json['statusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final destination = this.destination;
    final id = this.id;
    final sequenceStoreId = this.sequenceStoreId;
    final status = this.status;
    final completionTime = this.completionTime;
    final readSets = this.readSets;
    final statusMessage = this.statusMessage;
    return {
      'creationTime': iso8601ToJson(creationTime),
      'destination': destination,
      'id': id,
      'sequenceStoreId': sequenceStoreId,
      'status': status.toValue(),
      if (completionTime != null)
        'completionTime': iso8601ToJson(completionTime),
      if (readSets != null) 'readSets': readSets,
      if (statusMessage != null) 'statusMessage': statusMessage,
    };
  }
}

class GetReadSetImportJobResponse {
  /// When the job was created.
  final DateTime creationTime;

  /// The job's ID.
  final String id;

  /// The job's service role ARN.
  final String roleArn;

  /// The job's sequence store ID.
  final String sequenceStoreId;

  /// The job's source files.
  final List<ImportReadSetSourceItem> sources;

  /// The job's status.
  final ReadSetImportJobStatus status;

  /// When the job completed.
  final DateTime? completionTime;

  /// The job's status message.
  final String? statusMessage;

  GetReadSetImportJobResponse({
    required this.creationTime,
    required this.id,
    required this.roleArn,
    required this.sequenceStoreId,
    required this.sources,
    required this.status,
    this.completionTime,
    this.statusMessage,
  });

  factory GetReadSetImportJobResponse.fromJson(Map<String, dynamic> json) {
    return GetReadSetImportJobResponse(
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      id: json['id'] as String,
      roleArn: json['roleArn'] as String,
      sequenceStoreId: json['sequenceStoreId'] as String,
      sources: (json['sources'] as List)
          .whereNotNull()
          .map((e) =>
              ImportReadSetSourceItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: (json['status'] as String).toReadSetImportJobStatus(),
      completionTime: timeStampFromJson(json['completionTime']),
      statusMessage: json['statusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final id = this.id;
    final roleArn = this.roleArn;
    final sequenceStoreId = this.sequenceStoreId;
    final sources = this.sources;
    final status = this.status;
    final completionTime = this.completionTime;
    final statusMessage = this.statusMessage;
    return {
      'creationTime': iso8601ToJson(creationTime),
      'id': id,
      'roleArn': roleArn,
      'sequenceStoreId': sequenceStoreId,
      'sources': sources,
      'status': status.toValue(),
      if (completionTime != null)
        'completionTime': iso8601ToJson(completionTime),
      if (statusMessage != null) 'statusMessage': statusMessage,
    };
  }
}

class GetReadSetMetadataResponse {
  /// The read set's ARN.
  final String arn;

  /// When the read set was created.
  final DateTime creationTime;

  /// The read set's file type.
  final FileType fileType;

  /// The read set's ID.
  final String id;

  /// The read set's sequence store ID.
  final String sequenceStoreId;

  /// The read set's status.
  final ReadSetStatus status;

  /// The creation type of the read set.
  final CreationType? creationType;

  /// The read set's description.
  final String? description;

  /// The entity tag (ETag) is a hash of the object meant to represent its
  /// semantic content.
  final ETag? etag;

  /// The read set's files.
  final ReadSetFiles? files;

  /// The read set's name.
  final String? name;

  /// The read set's genome reference ARN.
  final String? referenceArn;

  /// The read set's sample ID.
  final String? sampleId;

  /// The read set's sequence information.
  final SequenceInformation? sequenceInformation;

  /// The status message for a read set. It provides more detail as to why the
  /// read set has a status.
  final String? statusMessage;

  /// The read set's subject ID.
  final String? subjectId;

  GetReadSetMetadataResponse({
    required this.arn,
    required this.creationTime,
    required this.fileType,
    required this.id,
    required this.sequenceStoreId,
    required this.status,
    this.creationType,
    this.description,
    this.etag,
    this.files,
    this.name,
    this.referenceArn,
    this.sampleId,
    this.sequenceInformation,
    this.statusMessage,
    this.subjectId,
  });

  factory GetReadSetMetadataResponse.fromJson(Map<String, dynamic> json) {
    return GetReadSetMetadataResponse(
      arn: json['arn'] as String,
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      fileType: (json['fileType'] as String).toFileType(),
      id: json['id'] as String,
      sequenceStoreId: json['sequenceStoreId'] as String,
      status: (json['status'] as String).toReadSetStatus(),
      creationType: (json['creationType'] as String?)?.toCreationType(),
      description: json['description'] as String?,
      etag: json['etag'] != null
          ? ETag.fromJson(json['etag'] as Map<String, dynamic>)
          : null,
      files: json['files'] != null
          ? ReadSetFiles.fromJson(json['files'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      referenceArn: json['referenceArn'] as String?,
      sampleId: json['sampleId'] as String?,
      sequenceInformation: json['sequenceInformation'] != null
          ? SequenceInformation.fromJson(
              json['sequenceInformation'] as Map<String, dynamic>)
          : null,
      statusMessage: json['statusMessage'] as String?,
      subjectId: json['subjectId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final fileType = this.fileType;
    final id = this.id;
    final sequenceStoreId = this.sequenceStoreId;
    final status = this.status;
    final creationType = this.creationType;
    final description = this.description;
    final etag = this.etag;
    final files = this.files;
    final name = this.name;
    final referenceArn = this.referenceArn;
    final sampleId = this.sampleId;
    final sequenceInformation = this.sequenceInformation;
    final statusMessage = this.statusMessage;
    final subjectId = this.subjectId;
    return {
      'arn': arn,
      'creationTime': iso8601ToJson(creationTime),
      'fileType': fileType.toValue(),
      'id': id,
      'sequenceStoreId': sequenceStoreId,
      'status': status.toValue(),
      if (creationType != null) 'creationType': creationType.toValue(),
      if (description != null) 'description': description,
      if (etag != null) 'etag': etag,
      if (files != null) 'files': files,
      if (name != null) 'name': name,
      if (referenceArn != null) 'referenceArn': referenceArn,
      if (sampleId != null) 'sampleId': sampleId,
      if (sequenceInformation != null)
        'sequenceInformation': sequenceInformation,
      if (statusMessage != null) 'statusMessage': statusMessage,
      if (subjectId != null) 'subjectId': subjectId,
    };
  }
}

class GetReadSetResponse {
  /// The read set file payload.
  final Uint8List? payload;

  GetReadSetResponse({
    this.payload,
  });

  Map<String, dynamic> toJson() {
    final payload = this.payload;
    return {
      if (payload != null) 'payload': base64Encode(payload),
    };
  }
}

class GetReferenceImportJobResponse {
  /// When the job was created.
  final DateTime creationTime;

  /// The job's ID.
  final String id;

  /// The job's reference store ID.
  final String referenceStoreId;

  /// The job's service role ARN.
  final String roleArn;

  /// The job's source files.
  final List<ImportReferenceSourceItem> sources;

  /// The job's status.
  final ReferenceImportJobStatus status;

  /// When the job completed.
  final DateTime? completionTime;

  /// The job's status message.
  final String? statusMessage;

  GetReferenceImportJobResponse({
    required this.creationTime,
    required this.id,
    required this.referenceStoreId,
    required this.roleArn,
    required this.sources,
    required this.status,
    this.completionTime,
    this.statusMessage,
  });

  factory GetReferenceImportJobResponse.fromJson(Map<String, dynamic> json) {
    return GetReferenceImportJobResponse(
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      id: json['id'] as String,
      referenceStoreId: json['referenceStoreId'] as String,
      roleArn: json['roleArn'] as String,
      sources: (json['sources'] as List)
          .whereNotNull()
          .map((e) =>
              ImportReferenceSourceItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: (json['status'] as String).toReferenceImportJobStatus(),
      completionTime: timeStampFromJson(json['completionTime']),
      statusMessage: json['statusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final id = this.id;
    final referenceStoreId = this.referenceStoreId;
    final roleArn = this.roleArn;
    final sources = this.sources;
    final status = this.status;
    final completionTime = this.completionTime;
    final statusMessage = this.statusMessage;
    return {
      'creationTime': iso8601ToJson(creationTime),
      'id': id,
      'referenceStoreId': referenceStoreId,
      'roleArn': roleArn,
      'sources': sources,
      'status': status.toValue(),
      if (completionTime != null)
        'completionTime': iso8601ToJson(completionTime),
      if (statusMessage != null) 'statusMessage': statusMessage,
    };
  }
}

class GetReferenceMetadataResponse {
  /// The reference's ARN.
  final String arn;

  /// When the reference was created.
  final DateTime creationTime;

  /// The reference's ID.
  final String id;

  /// The reference's MD5 checksum.
  final String md5;

  /// The reference's reference store ID.
  final String referenceStoreId;

  /// When the reference was updated.
  final DateTime updateTime;

  /// The reference's description.
  final String? description;

  /// The reference's files.
  final ReferenceFiles? files;

  /// The reference's name.
  final String? name;

  /// The reference's status.
  final ReferenceStatus? status;

  GetReferenceMetadataResponse({
    required this.arn,
    required this.creationTime,
    required this.id,
    required this.md5,
    required this.referenceStoreId,
    required this.updateTime,
    this.description,
    this.files,
    this.name,
    this.status,
  });

  factory GetReferenceMetadataResponse.fromJson(Map<String, dynamic> json) {
    return GetReferenceMetadataResponse(
      arn: json['arn'] as String,
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      id: json['id'] as String,
      md5: json['md5'] as String,
      referenceStoreId: json['referenceStoreId'] as String,
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] as Object),
      description: json['description'] as String?,
      files: json['files'] != null
          ? ReferenceFiles.fromJson(json['files'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      status: (json['status'] as String?)?.toReferenceStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final id = this.id;
    final md5 = this.md5;
    final referenceStoreId = this.referenceStoreId;
    final updateTime = this.updateTime;
    final description = this.description;
    final files = this.files;
    final name = this.name;
    final status = this.status;
    return {
      'arn': arn,
      'creationTime': iso8601ToJson(creationTime),
      'id': id,
      'md5': md5,
      'referenceStoreId': referenceStoreId,
      'updateTime': iso8601ToJson(updateTime),
      if (description != null) 'description': description,
      if (files != null) 'files': files,
      if (name != null) 'name': name,
      if (status != null) 'status': status.toValue(),
    };
  }
}

class GetReferenceResponse {
  /// The reference file payload.
  final Uint8List? payload;

  GetReferenceResponse({
    this.payload,
  });

  Map<String, dynamic> toJson() {
    final payload = this.payload;
    return {
      if (payload != null) 'payload': base64Encode(payload),
    };
  }
}

class GetReferenceStoreResponse {
  /// The store's ARN.
  final String arn;

  /// When the store was created.
  final DateTime creationTime;

  /// The store's ID.
  final String id;

  /// The store's description.
  final String? description;

  /// The store's name.
  final String? name;

  /// The store's server-side encryption (SSE) settings.
  final SseConfig? sseConfig;

  GetReferenceStoreResponse({
    required this.arn,
    required this.creationTime,
    required this.id,
    this.description,
    this.name,
    this.sseConfig,
  });

  factory GetReferenceStoreResponse.fromJson(Map<String, dynamic> json) {
    return GetReferenceStoreResponse(
      arn: json['arn'] as String,
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      id: json['id'] as String,
      description: json['description'] as String?,
      name: json['name'] as String?,
      sseConfig: json['sseConfig'] != null
          ? SseConfig.fromJson(json['sseConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final id = this.id;
    final description = this.description;
    final name = this.name;
    final sseConfig = this.sseConfig;
    return {
      'arn': arn,
      'creationTime': iso8601ToJson(creationTime),
      'id': id,
      if (description != null) 'description': description,
      if (name != null) 'name': name,
      if (sseConfig != null) 'sseConfig': sseConfig,
    };
  }
}

class GetRunGroupResponse {
  /// The group's ARN.
  final String? arn;

  /// When the group was created.
  final DateTime? creationTime;

  /// The group's ID.
  final String? id;

  /// The group's maximum number of CPUs to use.
  final int? maxCpus;

  /// The group's maximum run time in minutes.
  final int? maxDuration;

  /// The maximum GPUs that can be used by a run group.
  final int? maxGpus;

  /// The maximum number of concurrent runs for the group.
  final int? maxRuns;

  /// The group's name.
  final String? name;

  /// The group's tags.
  final Map<String, String>? tags;

  GetRunGroupResponse({
    this.arn,
    this.creationTime,
    this.id,
    this.maxCpus,
    this.maxDuration,
    this.maxGpus,
    this.maxRuns,
    this.name,
    this.tags,
  });

  factory GetRunGroupResponse.fromJson(Map<String, dynamic> json) {
    return GetRunGroupResponse(
      arn: json['arn'] as String?,
      creationTime: timeStampFromJson(json['creationTime']),
      id: json['id'] as String?,
      maxCpus: json['maxCpus'] as int?,
      maxDuration: json['maxDuration'] as int?,
      maxGpus: json['maxGpus'] as int?,
      maxRuns: json['maxRuns'] as int?,
      name: json['name'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final id = this.id;
    final maxCpus = this.maxCpus;
    final maxDuration = this.maxDuration;
    final maxGpus = this.maxGpus;
    final maxRuns = this.maxRuns;
    final name = this.name;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (creationTime != null) 'creationTime': iso8601ToJson(creationTime),
      if (id != null) 'id': id,
      if (maxCpus != null) 'maxCpus': maxCpus,
      if (maxDuration != null) 'maxDuration': maxDuration,
      if (maxGpus != null) 'maxGpus': maxGpus,
      if (maxRuns != null) 'maxRuns': maxRuns,
      if (name != null) 'name': name,
      if (tags != null) 'tags': tags,
    };
  }
}

class GetRunResponse {
  /// The computational accelerator used to run the workflow.
  final Accelerators? accelerators;

  /// The run's ARN.
  final String? arn;

  /// When the run was created.
  final DateTime? creationTime;

  /// The run's definition.
  final String? definition;

  /// The run's digest.
  final String? digest;

  /// The reason a run has failed.
  final String? failureReason;

  /// The run's ID.
  final String? id;

  /// The run's log level.
  final RunLogLevel? logLevel;

  /// The location of the run log.
  final RunLogLocation? logLocation;

  /// The run's name.
  final String? name;

  /// The run's output URI.
  final String? outputUri;

  /// The run's parameters.
  final RunParameters? parameters;

  /// The run's priority.
  final int? priority;

  /// The run's resource digests.
  final Map<String, String>? resourceDigests;

  /// The run's retention mode.
  final RunRetentionMode? retentionMode;

  /// The run's service role ARN.
  final String? roleArn;

  /// The run's group ID.
  final String? runGroupId;

  /// The run's ID.
  final String? runId;

  /// The destination for workflow outputs.
  final String? runOutputUri;

  /// When the run started.
  final DateTime? startTime;

  /// Who started the run.
  final String? startedBy;

  /// The run's status.
  final RunStatus? status;

  /// The run's status message.
  final String? statusMessage;

  /// The run's stop time.
  final DateTime? stopTime;

  /// The run's storage capacity in gibibytes. For dynamic storage, after the run
  /// has completed, this value is the maximum amount of storage used during the
  /// run.
  final int? storageCapacity;

  /// The run's storage type.
  final StorageType? storageType;

  /// The run's tags.
  final Map<String, String>? tags;

  /// The universally unique identifier for a run.
  final String? uuid;

  /// The run's workflow ID.
  final String? workflowId;

  /// The ID of the workflow owner.
  final String? workflowOwnerId;

  /// The run's workflow type.
  final WorkflowType? workflowType;

  GetRunResponse({
    this.accelerators,
    this.arn,
    this.creationTime,
    this.definition,
    this.digest,
    this.failureReason,
    this.id,
    this.logLevel,
    this.logLocation,
    this.name,
    this.outputUri,
    this.parameters,
    this.priority,
    this.resourceDigests,
    this.retentionMode,
    this.roleArn,
    this.runGroupId,
    this.runId,
    this.runOutputUri,
    this.startTime,
    this.startedBy,
    this.status,
    this.statusMessage,
    this.stopTime,
    this.storageCapacity,
    this.storageType,
    this.tags,
    this.uuid,
    this.workflowId,
    this.workflowOwnerId,
    this.workflowType,
  });

  factory GetRunResponse.fromJson(Map<String, dynamic> json) {
    return GetRunResponse(
      accelerators: (json['accelerators'] as String?)?.toAccelerators(),
      arn: json['arn'] as String?,
      creationTime: timeStampFromJson(json['creationTime']),
      definition: json['definition'] as String?,
      digest: json['digest'] as String?,
      failureReason: json['failureReason'] as String?,
      id: json['id'] as String?,
      logLevel: (json['logLevel'] as String?)?.toRunLogLevel(),
      logLocation: json['logLocation'] != null
          ? RunLogLocation.fromJson(json['logLocation'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      outputUri: json['outputUri'] as String?,
      parameters: json['parameters'] != null
          ? RunParameters.fromJson(json['parameters'] as Map<String, dynamic>)
          : null,
      priority: json['priority'] as int?,
      resourceDigests: (json['resourceDigests'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      retentionMode: (json['retentionMode'] as String?)?.toRunRetentionMode(),
      roleArn: json['roleArn'] as String?,
      runGroupId: json['runGroupId'] as String?,
      runId: json['runId'] as String?,
      runOutputUri: json['runOutputUri'] as String?,
      startTime: timeStampFromJson(json['startTime']),
      startedBy: json['startedBy'] as String?,
      status: (json['status'] as String?)?.toRunStatus(),
      statusMessage: json['statusMessage'] as String?,
      stopTime: timeStampFromJson(json['stopTime']),
      storageCapacity: json['storageCapacity'] as int?,
      storageType: (json['storageType'] as String?)?.toStorageType(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      uuid: json['uuid'] as String?,
      workflowId: json['workflowId'] as String?,
      workflowOwnerId: json['workflowOwnerId'] as String?,
      workflowType: (json['workflowType'] as String?)?.toWorkflowType(),
    );
  }

  Map<String, dynamic> toJson() {
    final accelerators = this.accelerators;
    final arn = this.arn;
    final creationTime = this.creationTime;
    final definition = this.definition;
    final digest = this.digest;
    final failureReason = this.failureReason;
    final id = this.id;
    final logLevel = this.logLevel;
    final logLocation = this.logLocation;
    final name = this.name;
    final outputUri = this.outputUri;
    final parameters = this.parameters;
    final priority = this.priority;
    final resourceDigests = this.resourceDigests;
    final retentionMode = this.retentionMode;
    final roleArn = this.roleArn;
    final runGroupId = this.runGroupId;
    final runId = this.runId;
    final runOutputUri = this.runOutputUri;
    final startTime = this.startTime;
    final startedBy = this.startedBy;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final stopTime = this.stopTime;
    final storageCapacity = this.storageCapacity;
    final storageType = this.storageType;
    final tags = this.tags;
    final uuid = this.uuid;
    final workflowId = this.workflowId;
    final workflowOwnerId = this.workflowOwnerId;
    final workflowType = this.workflowType;
    return {
      if (accelerators != null) 'accelerators': accelerators.toValue(),
      if (arn != null) 'arn': arn,
      if (creationTime != null) 'creationTime': iso8601ToJson(creationTime),
      if (definition != null) 'definition': definition,
      if (digest != null) 'digest': digest,
      if (failureReason != null) 'failureReason': failureReason,
      if (id != null) 'id': id,
      if (logLevel != null) 'logLevel': logLevel.toValue(),
      if (logLocation != null) 'logLocation': logLocation,
      if (name != null) 'name': name,
      if (outputUri != null) 'outputUri': outputUri,
      if (parameters != null) 'parameters': parameters,
      if (priority != null) 'priority': priority,
      if (resourceDigests != null) 'resourceDigests': resourceDigests,
      if (retentionMode != null) 'retentionMode': retentionMode.toValue(),
      if (roleArn != null) 'roleArn': roleArn,
      if (runGroupId != null) 'runGroupId': runGroupId,
      if (runId != null) 'runId': runId,
      if (runOutputUri != null) 'runOutputUri': runOutputUri,
      if (startTime != null) 'startTime': iso8601ToJson(startTime),
      if (startedBy != null) 'startedBy': startedBy,
      if (status != null) 'status': status.toValue(),
      if (statusMessage != null) 'statusMessage': statusMessage,
      if (stopTime != null) 'stopTime': iso8601ToJson(stopTime),
      if (storageCapacity != null) 'storageCapacity': storageCapacity,
      if (storageType != null) 'storageType': storageType.toValue(),
      if (tags != null) 'tags': tags,
      if (uuid != null) 'uuid': uuid,
      if (workflowId != null) 'workflowId': workflowId,
      if (workflowOwnerId != null) 'workflowOwnerId': workflowOwnerId,
      if (workflowType != null) 'workflowType': workflowType.toValue(),
    };
  }
}

class GetRunTaskResponse {
  /// The task's CPU usage.
  final int? cpus;

  /// When the task was created.
  final DateTime? creationTime;

  /// The reason a task has failed.
  final String? failureReason;

  /// The number of Graphics Processing Units (GPU) specified in the task.
  final int? gpus;

  /// The instance type for a task.
  final String? instanceType;

  /// The task's log stream.
  final String? logStream;

  /// The task's memory use in gigabytes.
  final int? memory;

  /// The task's name.
  final String? name;

  /// The task's start time.
  final DateTime? startTime;

  /// The task's status.
  final TaskStatus? status;

  /// The task's status message.
  final String? statusMessage;

  /// The task's stop time.
  final DateTime? stopTime;

  /// The task's ID.
  final String? taskId;

  GetRunTaskResponse({
    this.cpus,
    this.creationTime,
    this.failureReason,
    this.gpus,
    this.instanceType,
    this.logStream,
    this.memory,
    this.name,
    this.startTime,
    this.status,
    this.statusMessage,
    this.stopTime,
    this.taskId,
  });

  factory GetRunTaskResponse.fromJson(Map<String, dynamic> json) {
    return GetRunTaskResponse(
      cpus: json['cpus'] as int?,
      creationTime: timeStampFromJson(json['creationTime']),
      failureReason: json['failureReason'] as String?,
      gpus: json['gpus'] as int?,
      instanceType: json['instanceType'] as String?,
      logStream: json['logStream'] as String?,
      memory: json['memory'] as int?,
      name: json['name'] as String?,
      startTime: timeStampFromJson(json['startTime']),
      status: (json['status'] as String?)?.toTaskStatus(),
      statusMessage: json['statusMessage'] as String?,
      stopTime: timeStampFromJson(json['stopTime']),
      taskId: json['taskId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cpus = this.cpus;
    final creationTime = this.creationTime;
    final failureReason = this.failureReason;
    final gpus = this.gpus;
    final instanceType = this.instanceType;
    final logStream = this.logStream;
    final memory = this.memory;
    final name = this.name;
    final startTime = this.startTime;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final stopTime = this.stopTime;
    final taskId = this.taskId;
    return {
      if (cpus != null) 'cpus': cpus,
      if (creationTime != null) 'creationTime': iso8601ToJson(creationTime),
      if (failureReason != null) 'failureReason': failureReason,
      if (gpus != null) 'gpus': gpus,
      if (instanceType != null) 'instanceType': instanceType,
      if (logStream != null) 'logStream': logStream,
      if (memory != null) 'memory': memory,
      if (name != null) 'name': name,
      if (startTime != null) 'startTime': iso8601ToJson(startTime),
      if (status != null) 'status': status.toValue(),
      if (statusMessage != null) 'statusMessage': statusMessage,
      if (stopTime != null) 'stopTime': iso8601ToJson(stopTime),
      if (taskId != null) 'taskId': taskId,
    };
  }
}

class GetSequenceStoreResponse {
  /// The store's ARN.
  final String arn;

  /// When the store was created.
  final DateTime creationTime;

  /// The store's ID.
  final String id;

  /// The store's description.
  final String? description;

  /// The algorithm family of the ETag.
  final ETagAlgorithmFamily? eTagAlgorithmFamily;

  /// An S3 location that is used to store files that have failed a direct upload.
  final String? fallbackLocation;

  /// The store's name.
  final String? name;

  /// The S3 metadata of a sequence store, including the ARN and S3 URI of the S3
  /// bucket.
  final SequenceStoreS3Access? s3Access;

  /// The store's server-side encryption (SSE) settings.
  final SseConfig? sseConfig;

  GetSequenceStoreResponse({
    required this.arn,
    required this.creationTime,
    required this.id,
    this.description,
    this.eTagAlgorithmFamily,
    this.fallbackLocation,
    this.name,
    this.s3Access,
    this.sseConfig,
  });

  factory GetSequenceStoreResponse.fromJson(Map<String, dynamic> json) {
    return GetSequenceStoreResponse(
      arn: json['arn'] as String,
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      id: json['id'] as String,
      description: json['description'] as String?,
      eTagAlgorithmFamily:
          (json['eTagAlgorithmFamily'] as String?)?.toETagAlgorithmFamily(),
      fallbackLocation: json['fallbackLocation'] as String?,
      name: json['name'] as String?,
      s3Access: json['s3Access'] != null
          ? SequenceStoreS3Access.fromJson(
              json['s3Access'] as Map<String, dynamic>)
          : null,
      sseConfig: json['sseConfig'] != null
          ? SseConfig.fromJson(json['sseConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final id = this.id;
    final description = this.description;
    final eTagAlgorithmFamily = this.eTagAlgorithmFamily;
    final fallbackLocation = this.fallbackLocation;
    final name = this.name;
    final s3Access = this.s3Access;
    final sseConfig = this.sseConfig;
    return {
      'arn': arn,
      'creationTime': iso8601ToJson(creationTime),
      'id': id,
      if (description != null) 'description': description,
      if (eTagAlgorithmFamily != null)
        'eTagAlgorithmFamily': eTagAlgorithmFamily.toValue(),
      if (fallbackLocation != null) 'fallbackLocation': fallbackLocation,
      if (name != null) 'name': name,
      if (s3Access != null) 's3Access': s3Access,
      if (sseConfig != null) 'sseConfig': sseConfig,
    };
  }
}

class GetShareResponse {
  /// A resource share details object. The object includes the status, the
  /// resourceArn, and ownerId.
  final ShareDetails? share;

  GetShareResponse({
    this.share,
  });

  factory GetShareResponse.fromJson(Map<String, dynamic> json) {
    return GetShareResponse(
      share: json['share'] != null
          ? ShareDetails.fromJson(json['share'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final share = this.share;
    return {
      if (share != null) 'share': share,
    };
  }
}

class GetVariantImportResponse {
  /// When the job was created.
  final DateTime creationTime;

  /// The job's destination variant store.
  final String destinationName;

  /// The job's ID.
  final String id;

  /// The job's items.
  final List<VariantImportItemDetail> items;

  /// The job's service role ARN.
  final String roleArn;

  /// The job's left normalization setting.
  final bool runLeftNormalization;

  /// The job's status.
  final JobStatus status;

  /// The job's status message.
  final String statusMessage;

  /// When the job was updated.
  final DateTime updateTime;

  /// The annotation schema generated by the parsed annotation data.
  final Map<String, String>? annotationFields;

  /// When the job completed.
  final DateTime? completionTime;

  GetVariantImportResponse({
    required this.creationTime,
    required this.destinationName,
    required this.id,
    required this.items,
    required this.roleArn,
    required this.runLeftNormalization,
    required this.status,
    required this.statusMessage,
    required this.updateTime,
    this.annotationFields,
    this.completionTime,
  });

  factory GetVariantImportResponse.fromJson(Map<String, dynamic> json) {
    return GetVariantImportResponse(
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      destinationName: json['destinationName'] as String,
      id: json['id'] as String,
      items: (json['items'] as List)
          .whereNotNull()
          .map((e) =>
              VariantImportItemDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      roleArn: json['roleArn'] as String,
      runLeftNormalization: json['runLeftNormalization'] as bool,
      status: (json['status'] as String).toJobStatus(),
      statusMessage: json['statusMessage'] as String,
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] as Object),
      annotationFields: (json['annotationFields'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      completionTime: timeStampFromJson(json['completionTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final destinationName = this.destinationName;
    final id = this.id;
    final items = this.items;
    final roleArn = this.roleArn;
    final runLeftNormalization = this.runLeftNormalization;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final updateTime = this.updateTime;
    final annotationFields = this.annotationFields;
    final completionTime = this.completionTime;
    return {
      'creationTime': iso8601ToJson(creationTime),
      'destinationName': destinationName,
      'id': id,
      'items': items,
      'roleArn': roleArn,
      'runLeftNormalization': runLeftNormalization,
      'status': status.toValue(),
      'statusMessage': statusMessage,
      'updateTime': iso8601ToJson(updateTime),
      if (annotationFields != null) 'annotationFields': annotationFields,
      if (completionTime != null)
        'completionTime': iso8601ToJson(completionTime),
    };
  }
}

class GetVariantStoreResponse {
  /// When the store was created.
  final DateTime creationTime;

  /// The store's description.
  final String description;

  /// The store's ID.
  final String id;

  /// The store's name.
  final String name;

  /// The store's genome reference.
  final ReferenceItem reference;

  /// The store's server-side encryption (SSE) settings.
  final SseConfig sseConfig;

  /// The store's status.
  final StoreStatus status;

  /// The store's status message.
  final String statusMessage;

  /// The store's ARN.
  final String storeArn;

  /// The store's size in bytes.
  final int storeSizeBytes;

  /// The store's tags.
  final Map<String, String> tags;

  /// When the store was updated.
  final DateTime updateTime;

  GetVariantStoreResponse({
    required this.creationTime,
    required this.description,
    required this.id,
    required this.name,
    required this.reference,
    required this.sseConfig,
    required this.status,
    required this.statusMessage,
    required this.storeArn,
    required this.storeSizeBytes,
    required this.tags,
    required this.updateTime,
  });

  factory GetVariantStoreResponse.fromJson(Map<String, dynamic> json) {
    return GetVariantStoreResponse(
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      description: json['description'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      reference:
          ReferenceItem.fromJson(json['reference'] as Map<String, dynamic>),
      sseConfig: SseConfig.fromJson(json['sseConfig'] as Map<String, dynamic>),
      status: (json['status'] as String).toStoreStatus(),
      statusMessage: json['statusMessage'] as String,
      storeArn: json['storeArn'] as String,
      storeSizeBytes: json['storeSizeBytes'] as int,
      tags: (json['tags'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(k, e as String)),
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] as Object),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final description = this.description;
    final id = this.id;
    final name = this.name;
    final reference = this.reference;
    final sseConfig = this.sseConfig;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final storeArn = this.storeArn;
    final storeSizeBytes = this.storeSizeBytes;
    final tags = this.tags;
    final updateTime = this.updateTime;
    return {
      'creationTime': iso8601ToJson(creationTime),
      'description': description,
      'id': id,
      'name': name,
      'reference': reference,
      'sseConfig': sseConfig,
      'status': status.toValue(),
      'statusMessage': statusMessage,
      'storeArn': storeArn,
      'storeSizeBytes': storeSizeBytes,
      'tags': tags,
      'updateTime': iso8601ToJson(updateTime),
    };
  }
}

class GetWorkflowResponse {
  /// The computational accelerator specified to run the workflow.
  final Accelerators? accelerators;

  /// The workflow's ARN.
  final String? arn;

  /// When the workflow was created.
  final DateTime? creationTime;

  /// The workflow's definition.
  final String? definition;

  /// The workflow's description.
  final String? description;

  /// The workflow's digest.
  final String? digest;

  /// The workflow's engine.
  final WorkflowEngine? engine;

  /// The workflow's ID.
  final String? id;

  /// The path of the main definition file for the workflow.
  final String? main;

  /// Gets metadata for workflow.
  final Map<String, String>? metadata;

  /// The workflow's name.
  final String? name;

  /// The workflow's parameter template.
  final Map<String, WorkflowParameter>? parameterTemplate;

  /// The workflow's status.
  final WorkflowStatus? status;

  /// The workflow's status message.
  final String? statusMessage;

  /// The workflow's storage capacity in gibibytes.
  final int? storageCapacity;

  /// The workflow's tags.
  final Map<String, String>? tags;

  /// The workflow's type.
  final WorkflowType? type;

  GetWorkflowResponse({
    this.accelerators,
    this.arn,
    this.creationTime,
    this.definition,
    this.description,
    this.digest,
    this.engine,
    this.id,
    this.main,
    this.metadata,
    this.name,
    this.parameterTemplate,
    this.status,
    this.statusMessage,
    this.storageCapacity,
    this.tags,
    this.type,
  });

  factory GetWorkflowResponse.fromJson(Map<String, dynamic> json) {
    return GetWorkflowResponse(
      accelerators: (json['accelerators'] as String?)?.toAccelerators(),
      arn: json['arn'] as String?,
      creationTime: timeStampFromJson(json['creationTime']),
      definition: json['definition'] as String?,
      description: json['description'] as String?,
      digest: json['digest'] as String?,
      engine: (json['engine'] as String?)?.toWorkflowEngine(),
      id: json['id'] as String?,
      main: json['main'] as String?,
      metadata: (json['metadata'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      name: json['name'] as String?,
      parameterTemplate: (json['parameterTemplate'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(
              k, WorkflowParameter.fromJson(e as Map<String, dynamic>))),
      status: (json['status'] as String?)?.toWorkflowStatus(),
      statusMessage: json['statusMessage'] as String?,
      storageCapacity: json['storageCapacity'] as int?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      type: (json['type'] as String?)?.toWorkflowType(),
    );
  }

  Map<String, dynamic> toJson() {
    final accelerators = this.accelerators;
    final arn = this.arn;
    final creationTime = this.creationTime;
    final definition = this.definition;
    final description = this.description;
    final digest = this.digest;
    final engine = this.engine;
    final id = this.id;
    final main = this.main;
    final metadata = this.metadata;
    final name = this.name;
    final parameterTemplate = this.parameterTemplate;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final storageCapacity = this.storageCapacity;
    final tags = this.tags;
    final type = this.type;
    return {
      if (accelerators != null) 'accelerators': accelerators.toValue(),
      if (arn != null) 'arn': arn,
      if (creationTime != null) 'creationTime': iso8601ToJson(creationTime),
      if (definition != null) 'definition': definition,
      if (description != null) 'description': description,
      if (digest != null) 'digest': digest,
      if (engine != null) 'engine': engine.toValue(),
      if (id != null) 'id': id,
      if (main != null) 'main': main,
      if (metadata != null) 'metadata': metadata,
      if (name != null) 'name': name,
      if (parameterTemplate != null) 'parameterTemplate': parameterTemplate,
      if (status != null) 'status': status.toValue(),
      if (statusMessage != null) 'statusMessage': statusMessage,
      if (storageCapacity != null) 'storageCapacity': storageCapacity,
      if (tags != null) 'tags': tags,
      if (type != null) 'type': type.toValue(),
    };
  }
}

/// A filter for import read set jobs.
class ImportReadSetFilter {
  /// The filter's start date.
  final DateTime? createdAfter;

  /// The filter's end date.
  final DateTime? createdBefore;

  /// A status to filter on.
  final ReadSetImportJobStatus? status;

  ImportReadSetFilter({
    this.createdAfter,
    this.createdBefore,
    this.status,
  });

  Map<String, dynamic> toJson() {
    final createdAfter = this.createdAfter;
    final createdBefore = this.createdBefore;
    final status = this.status;
    return {
      if (createdAfter != null) 'createdAfter': iso8601ToJson(createdAfter),
      if (createdBefore != null) 'createdBefore': iso8601ToJson(createdBefore),
      if (status != null) 'status': status.toValue(),
    };
  }
}

/// An import read set job.
class ImportReadSetJobItem {
  /// When the job was created.
  final DateTime creationTime;

  /// The job's ID.
  final String id;

  /// The job's service role ARN.
  final String roleArn;

  /// The job's sequence store ID.
  final String sequenceStoreId;

  /// The job's status.
  final ReadSetImportJobStatus status;

  /// When the job completed.
  final DateTime? completionTime;

  ImportReadSetJobItem({
    required this.creationTime,
    required this.id,
    required this.roleArn,
    required this.sequenceStoreId,
    required this.status,
    this.completionTime,
  });

  factory ImportReadSetJobItem.fromJson(Map<String, dynamic> json) {
    return ImportReadSetJobItem(
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      id: json['id'] as String,
      roleArn: json['roleArn'] as String,
      sequenceStoreId: json['sequenceStoreId'] as String,
      status: (json['status'] as String).toReadSetImportJobStatus(),
      completionTime: timeStampFromJson(json['completionTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final id = this.id;
    final roleArn = this.roleArn;
    final sequenceStoreId = this.sequenceStoreId;
    final status = this.status;
    final completionTime = this.completionTime;
    return {
      'creationTime': iso8601ToJson(creationTime),
      'id': id,
      'roleArn': roleArn,
      'sequenceStoreId': sequenceStoreId,
      'status': status.toValue(),
      if (completionTime != null)
        'completionTime': iso8601ToJson(completionTime),
    };
  }
}

/// A source for an import read set job.
class ImportReadSetSourceItem {
  /// The source's sample ID.
  final String sampleId;

  /// The source's file type.
  final FileType sourceFileType;

  /// The source files' location in Amazon S3.
  final SourceFiles sourceFiles;

  /// The source's status.
  final ReadSetImportJobItemStatus status;

  /// The source's subject ID.
  final String subjectId;

  /// The source's description.
  final String? description;

  /// Where the source originated.
  final String? generatedFrom;

  /// The source's name.
  final String? name;

  /// The source's genome reference ARN.
  final String? referenceArn;

  /// The source's status message.
  final String? statusMessage;

  /// The source's tags.
  final Map<String, String>? tags;

  ImportReadSetSourceItem({
    required this.sampleId,
    required this.sourceFileType,
    required this.sourceFiles,
    required this.status,
    required this.subjectId,
    this.description,
    this.generatedFrom,
    this.name,
    this.referenceArn,
    this.statusMessage,
    this.tags,
  });

  factory ImportReadSetSourceItem.fromJson(Map<String, dynamic> json) {
    return ImportReadSetSourceItem(
      sampleId: json['sampleId'] as String,
      sourceFileType: (json['sourceFileType'] as String).toFileType(),
      sourceFiles:
          SourceFiles.fromJson(json['sourceFiles'] as Map<String, dynamic>),
      status: (json['status'] as String).toReadSetImportJobItemStatus(),
      subjectId: json['subjectId'] as String,
      description: json['description'] as String?,
      generatedFrom: json['generatedFrom'] as String?,
      name: json['name'] as String?,
      referenceArn: json['referenceArn'] as String?,
      statusMessage: json['statusMessage'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final sampleId = this.sampleId;
    final sourceFileType = this.sourceFileType;
    final sourceFiles = this.sourceFiles;
    final status = this.status;
    final subjectId = this.subjectId;
    final description = this.description;
    final generatedFrom = this.generatedFrom;
    final name = this.name;
    final referenceArn = this.referenceArn;
    final statusMessage = this.statusMessage;
    final tags = this.tags;
    return {
      'sampleId': sampleId,
      'sourceFileType': sourceFileType.toValue(),
      'sourceFiles': sourceFiles,
      'status': status.toValue(),
      'subjectId': subjectId,
      if (description != null) 'description': description,
      if (generatedFrom != null) 'generatedFrom': generatedFrom,
      if (name != null) 'name': name,
      if (referenceArn != null) 'referenceArn': referenceArn,
      if (statusMessage != null) 'statusMessage': statusMessage,
      if (tags != null) 'tags': tags,
    };
  }
}

/// A filter for import references.
class ImportReferenceFilter {
  /// The filter's start date.
  final DateTime? createdAfter;

  /// The filter's end date.
  final DateTime? createdBefore;

  /// A status to filter on.
  final ReferenceImportJobStatus? status;

  ImportReferenceFilter({
    this.createdAfter,
    this.createdBefore,
    this.status,
  });

  Map<String, dynamic> toJson() {
    final createdAfter = this.createdAfter;
    final createdBefore = this.createdBefore;
    final status = this.status;
    return {
      if (createdAfter != null) 'createdAfter': iso8601ToJson(createdAfter),
      if (createdBefore != null) 'createdBefore': iso8601ToJson(createdBefore),
      if (status != null) 'status': status.toValue(),
    };
  }
}

/// An import reference job.
class ImportReferenceJobItem {
  /// When the job was created.
  final DateTime creationTime;

  /// The job's ID.
  final String id;

  /// The job's reference store ID.
  final String referenceStoreId;

  /// The job's service role ARN.
  final String roleArn;

  /// The job's status.
  final ReferenceImportJobStatus status;

  /// When the job completed.
  final DateTime? completionTime;

  ImportReferenceJobItem({
    required this.creationTime,
    required this.id,
    required this.referenceStoreId,
    required this.roleArn,
    required this.status,
    this.completionTime,
  });

  factory ImportReferenceJobItem.fromJson(Map<String, dynamic> json) {
    return ImportReferenceJobItem(
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      id: json['id'] as String,
      referenceStoreId: json['referenceStoreId'] as String,
      roleArn: json['roleArn'] as String,
      status: (json['status'] as String).toReferenceImportJobStatus(),
      completionTime: timeStampFromJson(json['completionTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final id = this.id;
    final referenceStoreId = this.referenceStoreId;
    final roleArn = this.roleArn;
    final status = this.status;
    final completionTime = this.completionTime;
    return {
      'creationTime': iso8601ToJson(creationTime),
      'id': id,
      'referenceStoreId': referenceStoreId,
      'roleArn': roleArn,
      'status': status.toValue(),
      if (completionTime != null)
        'completionTime': iso8601ToJson(completionTime),
    };
  }
}

/// An genome reference source.
class ImportReferenceSourceItem {
  /// The source's status.
  final ReferenceImportJobItemStatus status;

  /// The source's description.
  final String? description;

  /// The source's name.
  final String? name;

  /// The source file's location in Amazon S3.
  final String? sourceFile;

  /// The source's status message.
  final String? statusMessage;

  /// The source's tags.
  final Map<String, String>? tags;

  ImportReferenceSourceItem({
    required this.status,
    this.description,
    this.name,
    this.sourceFile,
    this.statusMessage,
    this.tags,
  });

  factory ImportReferenceSourceItem.fromJson(Map<String, dynamic> json) {
    return ImportReferenceSourceItem(
      status: (json['status'] as String).toReferenceImportJobItemStatus(),
      description: json['description'] as String?,
      name: json['name'] as String?,
      sourceFile: json['sourceFile'] as String?,
      statusMessage: json['statusMessage'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final description = this.description;
    final name = this.name;
    final sourceFile = this.sourceFile;
    final statusMessage = this.statusMessage;
    final tags = this.tags;
    return {
      'status': status.toValue(),
      if (description != null) 'description': description,
      if (name != null) 'name': name,
      if (sourceFile != null) 'sourceFile': sourceFile,
      if (statusMessage != null) 'statusMessage': statusMessage,
      if (tags != null) 'tags': tags,
    };
  }
}

enum JobStatus {
  submitted,
  inProgress,
  cancelled,
  completed,
  failed,
  completedWithFailures,
}

extension JobStatusValueExtension on JobStatus {
  String toValue() {
    switch (this) {
      case JobStatus.submitted:
        return 'SUBMITTED';
      case JobStatus.inProgress:
        return 'IN_PROGRESS';
      case JobStatus.cancelled:
        return 'CANCELLED';
      case JobStatus.completed:
        return 'COMPLETED';
      case JobStatus.failed:
        return 'FAILED';
      case JobStatus.completedWithFailures:
        return 'COMPLETED_WITH_FAILURES';
    }
  }
}

extension JobStatusFromString on String {
  JobStatus toJobStatus() {
    switch (this) {
      case 'SUBMITTED':
        return JobStatus.submitted;
      case 'IN_PROGRESS':
        return JobStatus.inProgress;
      case 'CANCELLED':
        return JobStatus.cancelled;
      case 'COMPLETED':
        return JobStatus.completed;
      case 'FAILED':
        return JobStatus.failed;
      case 'COMPLETED_WITH_FAILURES':
        return JobStatus.completedWithFailures;
    }
    throw Exception('$this is not known in enum JobStatus');
  }
}

/// A filter for annotation import jobs.
class ListAnnotationImportJobsFilter {
  /// A status to filter on.
  final JobStatus? status;

  /// A store name to filter on.
  final String? storeName;

  ListAnnotationImportJobsFilter({
    this.status,
    this.storeName,
  });

  Map<String, dynamic> toJson() {
    final status = this.status;
    final storeName = this.storeName;
    return {
      if (status != null) 'status': status.toValue(),
      if (storeName != null) 'storeName': storeName,
    };
  }
}

class ListAnnotationImportJobsResponse {
  /// A list of jobs.
  final List<AnnotationImportJobItem>? annotationImportJobs;

  /// Specifies the pagination token from a previous request to retrieve the next
  /// page of results.
  final String? nextToken;

  ListAnnotationImportJobsResponse({
    this.annotationImportJobs,
    this.nextToken,
  });

  factory ListAnnotationImportJobsResponse.fromJson(Map<String, dynamic> json) {
    return ListAnnotationImportJobsResponse(
      annotationImportJobs: (json['annotationImportJobs'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AnnotationImportJobItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final annotationImportJobs = this.annotationImportJobs;
    final nextToken = this.nextToken;
    return {
      if (annotationImportJobs != null)
        'annotationImportJobs': annotationImportJobs,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Use filters to focus the returned annotation store versions on a specific
/// parameter, such as the status of the annotation store.
class ListAnnotationStoreVersionsFilter {
  /// The status of an annotation store version.
  final VersionStatus? status;

  ListAnnotationStoreVersionsFilter({
    this.status,
  });

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      if (status != null) 'status': status.toValue(),
    };
  }
}

class ListAnnotationStoreVersionsResponse {
  /// Lists all versions of an annotation store.
  final List<AnnotationStoreVersionItem>? annotationStoreVersions;

  /// Specifies the pagination token from a previous request to retrieve the next
  /// page of results.
  final String? nextToken;

  ListAnnotationStoreVersionsResponse({
    this.annotationStoreVersions,
    this.nextToken,
  });

  factory ListAnnotationStoreVersionsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListAnnotationStoreVersionsResponse(
      annotationStoreVersions: (json['annotationStoreVersions'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AnnotationStoreVersionItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final annotationStoreVersions = this.annotationStoreVersions;
    final nextToken = this.nextToken;
    return {
      if (annotationStoreVersions != null)
        'annotationStoreVersions': annotationStoreVersions,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// A filter for annotation stores.
class ListAnnotationStoresFilter {
  /// A status to filter on.
  final StoreStatus? status;

  ListAnnotationStoresFilter({
    this.status,
  });

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      if (status != null) 'status': status.toValue(),
    };
  }
}

class ListAnnotationStoresResponse {
  /// A list of stores.
  final List<AnnotationStoreItem>? annotationStores;

  /// A pagination token that's included if more results are available.
  final String? nextToken;

  ListAnnotationStoresResponse({
    this.annotationStores,
    this.nextToken,
  });

  factory ListAnnotationStoresResponse.fromJson(Map<String, dynamic> json) {
    return ListAnnotationStoresResponse(
      annotationStores: (json['annotationStores'] as List?)
          ?.whereNotNull()
          .map((e) => AnnotationStoreItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final annotationStores = this.annotationStores;
    final nextToken = this.nextToken;
    return {
      if (annotationStores != null) 'annotationStores': annotationStores,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListMultipartReadSetUploadsResponse {
  /// Next token returned in the response of a previous
  /// ListMultipartReadSetUploads call. Used to get the next page of results.
  final String? nextToken;

  /// An array of multipart uploads.
  final List<MultipartReadSetUploadListItem>? uploads;

  ListMultipartReadSetUploadsResponse({
    this.nextToken,
    this.uploads,
  });

  factory ListMultipartReadSetUploadsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListMultipartReadSetUploadsResponse(
      nextToken: json['nextToken'] as String?,
      uploads: (json['uploads'] as List?)
          ?.whereNotNull()
          .map((e) => MultipartReadSetUploadListItem.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final uploads = this.uploads;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (uploads != null) 'uploads': uploads,
    };
  }
}

class ListReadSetActivationJobsResponse {
  /// A list of jobs.
  final List<ActivateReadSetJobItem>? activationJobs;

  /// A pagination token that's included if more results are available.
  final String? nextToken;

  ListReadSetActivationJobsResponse({
    this.activationJobs,
    this.nextToken,
  });

  factory ListReadSetActivationJobsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListReadSetActivationJobsResponse(
      activationJobs: (json['activationJobs'] as List?)
          ?.whereNotNull()
          .map(
              (e) => ActivateReadSetJobItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final activationJobs = this.activationJobs;
    final nextToken = this.nextToken;
    return {
      if (activationJobs != null) 'activationJobs': activationJobs,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListReadSetExportJobsResponse {
  /// A list of jobs.
  final List<ExportReadSetJobDetail>? exportJobs;

  /// A pagination token that's included if more results are available.
  final String? nextToken;

  ListReadSetExportJobsResponse({
    this.exportJobs,
    this.nextToken,
  });

  factory ListReadSetExportJobsResponse.fromJson(Map<String, dynamic> json) {
    return ListReadSetExportJobsResponse(
      exportJobs: (json['exportJobs'] as List?)
          ?.whereNotNull()
          .map(
              (e) => ExportReadSetJobDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final exportJobs = this.exportJobs;
    final nextToken = this.nextToken;
    return {
      if (exportJobs != null) 'exportJobs': exportJobs,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListReadSetImportJobsResponse {
  /// A list of jobs.
  final List<ImportReadSetJobItem>? importJobs;

  /// A pagination token that's included if more results are available.
  final String? nextToken;

  ListReadSetImportJobsResponse({
    this.importJobs,
    this.nextToken,
  });

  factory ListReadSetImportJobsResponse.fromJson(Map<String, dynamic> json) {
    return ListReadSetImportJobsResponse(
      importJobs: (json['importJobs'] as List?)
          ?.whereNotNull()
          .map((e) => ImportReadSetJobItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final importJobs = this.importJobs;
    final nextToken = this.nextToken;
    return {
      if (importJobs != null) 'importJobs': importJobs,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListReadSetUploadPartsResponse {
  /// Next token returned in the response of a previous ListReadSetUploadParts
  /// call. Used to get the next page of results.
  final String? nextToken;

  /// An array of upload parts.
  final List<ReadSetUploadPartListItem>? parts;

  ListReadSetUploadPartsResponse({
    this.nextToken,
    this.parts,
  });

  factory ListReadSetUploadPartsResponse.fromJson(Map<String, dynamic> json) {
    return ListReadSetUploadPartsResponse(
      nextToken: json['nextToken'] as String?,
      parts: (json['parts'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ReadSetUploadPartListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final parts = this.parts;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (parts != null) 'parts': parts,
    };
  }
}

class ListReadSetsResponse {
  /// A list of read sets.
  final List<ReadSetListItem> readSets;

  /// A pagination token that's included if more results are available.
  final String? nextToken;

  ListReadSetsResponse({
    required this.readSets,
    this.nextToken,
  });

  factory ListReadSetsResponse.fromJson(Map<String, dynamic> json) {
    return ListReadSetsResponse(
      readSets: (json['readSets'] as List)
          .whereNotNull()
          .map((e) => ReadSetListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final readSets = this.readSets;
    final nextToken = this.nextToken;
    return {
      'readSets': readSets,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListReferenceImportJobsResponse {
  /// A lis of jobs.
  final List<ImportReferenceJobItem>? importJobs;

  /// A pagination token that's included if more results are available.
  final String? nextToken;

  ListReferenceImportJobsResponse({
    this.importJobs,
    this.nextToken,
  });

  factory ListReferenceImportJobsResponse.fromJson(Map<String, dynamic> json) {
    return ListReferenceImportJobsResponse(
      importJobs: (json['importJobs'] as List?)
          ?.whereNotNull()
          .map(
              (e) => ImportReferenceJobItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final importJobs = this.importJobs;
    final nextToken = this.nextToken;
    return {
      if (importJobs != null) 'importJobs': importJobs,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListReferenceStoresResponse {
  /// A list of reference stores.
  final List<ReferenceStoreDetail> referenceStores;

  /// A pagination token that's included if more results are available.
  final String? nextToken;

  ListReferenceStoresResponse({
    required this.referenceStores,
    this.nextToken,
  });

  factory ListReferenceStoresResponse.fromJson(Map<String, dynamic> json) {
    return ListReferenceStoresResponse(
      referenceStores: (json['referenceStores'] as List)
          .whereNotNull()
          .map((e) => ReferenceStoreDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final referenceStores = this.referenceStores;
    final nextToken = this.nextToken;
    return {
      'referenceStores': referenceStores,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListReferencesResponse {
  /// A list of references.
  final List<ReferenceListItem> references;

  /// A pagination token that's included if more results are available.
  final String? nextToken;

  ListReferencesResponse({
    required this.references,
    this.nextToken,
  });

  factory ListReferencesResponse.fromJson(Map<String, dynamic> json) {
    return ListReferencesResponse(
      references: (json['references'] as List)
          .whereNotNull()
          .map((e) => ReferenceListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final references = this.references;
    final nextToken = this.nextToken;
    return {
      'references': references,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListRunGroupsResponse {
  /// A list of groups.
  final List<RunGroupListItem>? items;

  /// A pagination token that's included if more results are available.
  final String? nextToken;

  ListRunGroupsResponse({
    this.items,
    this.nextToken,
  });

  factory ListRunGroupsResponse.fromJson(Map<String, dynamic> json) {
    return ListRunGroupsResponse(
      items: (json['items'] as List?)
          ?.whereNotNull()
          .map((e) => RunGroupListItem.fromJson(e as Map<String, dynamic>))
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

class ListRunTasksResponse {
  /// A list of tasks.
  final List<TaskListItem>? items;

  /// A pagination token that's included if more results are available.
  final String? nextToken;

  ListRunTasksResponse({
    this.items,
    this.nextToken,
  });

  factory ListRunTasksResponse.fromJson(Map<String, dynamic> json) {
    return ListRunTasksResponse(
      items: (json['items'] as List?)
          ?.whereNotNull()
          .map((e) => TaskListItem.fromJson(e as Map<String, dynamic>))
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

class ListRunsResponse {
  /// A list of runs.
  final List<RunListItem>? items;

  /// A pagination token that's included if more results are available.
  final String? nextToken;

  ListRunsResponse({
    this.items,
    this.nextToken,
  });

  factory ListRunsResponse.fromJson(Map<String, dynamic> json) {
    return ListRunsResponse(
      items: (json['items'] as List?)
          ?.whereNotNull()
          .map((e) => RunListItem.fromJson(e as Map<String, dynamic>))
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

class ListSequenceStoresResponse {
  /// A list of sequence stores.
  final List<SequenceStoreDetail> sequenceStores;

  /// A pagination token that's included if more results are available.
  final String? nextToken;

  ListSequenceStoresResponse({
    required this.sequenceStores,
    this.nextToken,
  });

  factory ListSequenceStoresResponse.fromJson(Map<String, dynamic> json) {
    return ListSequenceStoresResponse(
      sequenceStores: (json['sequenceStores'] as List)
          .whereNotNull()
          .map((e) => SequenceStoreDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final sequenceStores = this.sequenceStores;
    final nextToken = this.nextToken;
    return {
      'sequenceStores': sequenceStores,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListSharesResponse {
  /// The shares available and their metadata details.
  final List<ShareDetails> shares;

  /// Next token returned in the response of a previous ListSharesResponse call.
  /// Used to get the next page of results.
  final String? nextToken;

  ListSharesResponse({
    required this.shares,
    this.nextToken,
  });

  factory ListSharesResponse.fromJson(Map<String, dynamic> json) {
    return ListSharesResponse(
      shares: (json['shares'] as List)
          .whereNotNull()
          .map((e) => ShareDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final shares = this.shares;
    final nextToken = this.nextToken;
    return {
      'shares': shares,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListTagsForResourceResponse {
  /// A list of tags.
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    required this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['tags'] as Map<String, dynamic>)
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

/// A filter for variant import jobs.
class ListVariantImportJobsFilter {
  /// A status to filter on.
  final JobStatus? status;

  /// A store name to filter on.
  final String? storeName;

  ListVariantImportJobsFilter({
    this.status,
    this.storeName,
  });

  Map<String, dynamic> toJson() {
    final status = this.status;
    final storeName = this.storeName;
    return {
      if (status != null) 'status': status.toValue(),
      if (storeName != null) 'storeName': storeName,
    };
  }
}

class ListVariantImportJobsResponse {
  /// A pagination token that's included if more results are available.
  final String? nextToken;

  /// A list of jobs.
  final List<VariantImportJobItem>? variantImportJobs;

  ListVariantImportJobsResponse({
    this.nextToken,
    this.variantImportJobs,
  });

  factory ListVariantImportJobsResponse.fromJson(Map<String, dynamic> json) {
    return ListVariantImportJobsResponse(
      nextToken: json['nextToken'] as String?,
      variantImportJobs: (json['variantImportJobs'] as List?)
          ?.whereNotNull()
          .map((e) => VariantImportJobItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final variantImportJobs = this.variantImportJobs;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (variantImportJobs != null) 'variantImportJobs': variantImportJobs,
    };
  }
}

/// A filter for variant stores.
class ListVariantStoresFilter {
  /// A status to filter on.
  final StoreStatus? status;

  ListVariantStoresFilter({
    this.status,
  });

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      if (status != null) 'status': status.toValue(),
    };
  }
}

class ListVariantStoresResponse {
  /// A pagination token that's included if more results are available.
  final String? nextToken;

  /// A list of variant stores.
  final List<VariantStoreItem>? variantStores;

  ListVariantStoresResponse({
    this.nextToken,
    this.variantStores,
  });

  factory ListVariantStoresResponse.fromJson(Map<String, dynamic> json) {
    return ListVariantStoresResponse(
      nextToken: json['nextToken'] as String?,
      variantStores: (json['variantStores'] as List?)
          ?.whereNotNull()
          .map((e) => VariantStoreItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final variantStores = this.variantStores;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (variantStores != null) 'variantStores': variantStores,
    };
  }
}

class ListWorkflowsResponse {
  /// A list of workflow items.
  final List<WorkflowListItem>? items;

  /// A pagination token that's included if more results are available.
  final String? nextToken;

  ListWorkflowsResponse({
    this.items,
    this.nextToken,
  });

  factory ListWorkflowsResponse.fromJson(Map<String, dynamic> json) {
    return ListWorkflowsResponse(
      items: (json['items'] as List?)
          ?.whereNotNull()
          .map((e) => WorkflowListItem.fromJson(e as Map<String, dynamic>))
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

/// Part of the response to ListMultipartReadSetUploads, excluding completed and
/// aborted multipart uploads.
class MultipartReadSetUploadListItem {
  /// The time stamp for when a direct upload was created.
  final DateTime creationTime;

  /// The source of an uploaded part.
  final String generatedFrom;

  /// The source's reference ARN.
  final String referenceArn;

  /// The read set source's sample ID.
  final String sampleId;

  /// The sequence store ID used for the multipart upload.
  final String sequenceStoreId;

  /// The type of file the read set originated from.
  final FileType sourceFileType;

  /// The read set source's subject ID.
  final String subjectId;

  /// The ID for the initiated multipart upload.
  final String uploadId;

  /// The description of a read set.
  final String? description;

  /// The name of a read set.
  final String? name;

  /// Any tags you wish to add to a read set.
  final Map<String, String>? tags;

  MultipartReadSetUploadListItem({
    required this.creationTime,
    required this.generatedFrom,
    required this.referenceArn,
    required this.sampleId,
    required this.sequenceStoreId,
    required this.sourceFileType,
    required this.subjectId,
    required this.uploadId,
    this.description,
    this.name,
    this.tags,
  });

  factory MultipartReadSetUploadListItem.fromJson(Map<String, dynamic> json) {
    return MultipartReadSetUploadListItem(
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      generatedFrom: json['generatedFrom'] as String,
      referenceArn: json['referenceArn'] as String,
      sampleId: json['sampleId'] as String,
      sequenceStoreId: json['sequenceStoreId'] as String,
      sourceFileType: (json['sourceFileType'] as String).toFileType(),
      subjectId: json['subjectId'] as String,
      uploadId: json['uploadId'] as String,
      description: json['description'] as String?,
      name: json['name'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final generatedFrom = this.generatedFrom;
    final referenceArn = this.referenceArn;
    final sampleId = this.sampleId;
    final sequenceStoreId = this.sequenceStoreId;
    final sourceFileType = this.sourceFileType;
    final subjectId = this.subjectId;
    final uploadId = this.uploadId;
    final description = this.description;
    final name = this.name;
    final tags = this.tags;
    return {
      'creationTime': iso8601ToJson(creationTime),
      'generatedFrom': generatedFrom,
      'referenceArn': referenceArn,
      'sampleId': sampleId,
      'sequenceStoreId': sequenceStoreId,
      'sourceFileType': sourceFileType.toValue(),
      'subjectId': subjectId,
      'uploadId': uploadId,
      if (description != null) 'description': description,
      if (name != null) 'name': name,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Read options for an annotation import job.
class ReadOptions {
  /// The file's comment character.
  final String? comment;

  /// The file's encoding.
  final String? encoding;

  /// A character for escaping quotes in the file.
  final String? escape;

  /// Whether quotes need to be escaped in the file.
  final bool? escapeQuotes;

  /// Whether the file has a header row.
  final bool? header;

  /// A line separator for the file.
  final String? lineSep;

  /// The file's quote character.
  final String? quote;

  /// Whether all values need to be quoted, or just those that contain quotes.
  final bool? quoteAll;

  /// The file's field separator.
  final String? sep;

  ReadOptions({
    this.comment,
    this.encoding,
    this.escape,
    this.escapeQuotes,
    this.header,
    this.lineSep,
    this.quote,
    this.quoteAll,
    this.sep,
  });

  factory ReadOptions.fromJson(Map<String, dynamic> json) {
    return ReadOptions(
      comment: json['comment'] as String?,
      encoding: json['encoding'] as String?,
      escape: json['escape'] as String?,
      escapeQuotes: json['escapeQuotes'] as bool?,
      header: json['header'] as bool?,
      lineSep: json['lineSep'] as String?,
      quote: json['quote'] as String?,
      quoteAll: json['quoteAll'] as bool?,
      sep: json['sep'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final comment = this.comment;
    final encoding = this.encoding;
    final escape = this.escape;
    final escapeQuotes = this.escapeQuotes;
    final header = this.header;
    final lineSep = this.lineSep;
    final quote = this.quote;
    final quoteAll = this.quoteAll;
    final sep = this.sep;
    return {
      if (comment != null) 'comment': comment,
      if (encoding != null) 'encoding': encoding,
      if (escape != null) 'escape': escape,
      if (escapeQuotes != null) 'escapeQuotes': escapeQuotes,
      if (header != null) 'header': header,
      if (lineSep != null) 'lineSep': lineSep,
      if (quote != null) 'quote': quote,
      if (quoteAll != null) 'quoteAll': quoteAll,
      if (sep != null) 'sep': sep,
    };
  }
}

enum ReadSetActivationJobItemStatus {
  notStarted,
  inProgress,
  finished,
  failed,
}

extension ReadSetActivationJobItemStatusValueExtension
    on ReadSetActivationJobItemStatus {
  String toValue() {
    switch (this) {
      case ReadSetActivationJobItemStatus.notStarted:
        return 'NOT_STARTED';
      case ReadSetActivationJobItemStatus.inProgress:
        return 'IN_PROGRESS';
      case ReadSetActivationJobItemStatus.finished:
        return 'FINISHED';
      case ReadSetActivationJobItemStatus.failed:
        return 'FAILED';
    }
  }
}

extension ReadSetActivationJobItemStatusFromString on String {
  ReadSetActivationJobItemStatus toReadSetActivationJobItemStatus() {
    switch (this) {
      case 'NOT_STARTED':
        return ReadSetActivationJobItemStatus.notStarted;
      case 'IN_PROGRESS':
        return ReadSetActivationJobItemStatus.inProgress;
      case 'FINISHED':
        return ReadSetActivationJobItemStatus.finished;
      case 'FAILED':
        return ReadSetActivationJobItemStatus.failed;
    }
    throw Exception(
        '$this is not known in enum ReadSetActivationJobItemStatus');
  }
}

enum ReadSetActivationJobStatus {
  submitted,
  inProgress,
  cancelling,
  cancelled,
  failed,
  completed,
  completedWithFailures,
}

extension ReadSetActivationJobStatusValueExtension
    on ReadSetActivationJobStatus {
  String toValue() {
    switch (this) {
      case ReadSetActivationJobStatus.submitted:
        return 'SUBMITTED';
      case ReadSetActivationJobStatus.inProgress:
        return 'IN_PROGRESS';
      case ReadSetActivationJobStatus.cancelling:
        return 'CANCELLING';
      case ReadSetActivationJobStatus.cancelled:
        return 'CANCELLED';
      case ReadSetActivationJobStatus.failed:
        return 'FAILED';
      case ReadSetActivationJobStatus.completed:
        return 'COMPLETED';
      case ReadSetActivationJobStatus.completedWithFailures:
        return 'COMPLETED_WITH_FAILURES';
    }
  }
}

extension ReadSetActivationJobStatusFromString on String {
  ReadSetActivationJobStatus toReadSetActivationJobStatus() {
    switch (this) {
      case 'SUBMITTED':
        return ReadSetActivationJobStatus.submitted;
      case 'IN_PROGRESS':
        return ReadSetActivationJobStatus.inProgress;
      case 'CANCELLING':
        return ReadSetActivationJobStatus.cancelling;
      case 'CANCELLED':
        return ReadSetActivationJobStatus.cancelled;
      case 'FAILED':
        return ReadSetActivationJobStatus.failed;
      case 'COMPLETED':
        return ReadSetActivationJobStatus.completed;
      case 'COMPLETED_WITH_FAILURES':
        return ReadSetActivationJobStatus.completedWithFailures;
    }
    throw Exception('$this is not known in enum ReadSetActivationJobStatus');
  }
}

/// An error from a batch read set operation.
class ReadSetBatchError {
  /// The error's code.
  final String code;

  /// The error's ID.
  final String id;

  /// The error's message.
  final String message;

  ReadSetBatchError({
    required this.code,
    required this.id,
    required this.message,
  });

  factory ReadSetBatchError.fromJson(Map<String, dynamic> json) {
    return ReadSetBatchError(
      code: json['code'] as String,
      id: json['id'] as String,
      message: json['message'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final id = this.id;
    final message = this.message;
    return {
      'code': code,
      'id': id,
      'message': message,
    };
  }
}

enum ReadSetExportJobItemStatus {
  notStarted,
  inProgress,
  finished,
  failed,
}

extension ReadSetExportJobItemStatusValueExtension
    on ReadSetExportJobItemStatus {
  String toValue() {
    switch (this) {
      case ReadSetExportJobItemStatus.notStarted:
        return 'NOT_STARTED';
      case ReadSetExportJobItemStatus.inProgress:
        return 'IN_PROGRESS';
      case ReadSetExportJobItemStatus.finished:
        return 'FINISHED';
      case ReadSetExportJobItemStatus.failed:
        return 'FAILED';
    }
  }
}

extension ReadSetExportJobItemStatusFromString on String {
  ReadSetExportJobItemStatus toReadSetExportJobItemStatus() {
    switch (this) {
      case 'NOT_STARTED':
        return ReadSetExportJobItemStatus.notStarted;
      case 'IN_PROGRESS':
        return ReadSetExportJobItemStatus.inProgress;
      case 'FINISHED':
        return ReadSetExportJobItemStatus.finished;
      case 'FAILED':
        return ReadSetExportJobItemStatus.failed;
    }
    throw Exception('$this is not known in enum ReadSetExportJobItemStatus');
  }
}

enum ReadSetExportJobStatus {
  submitted,
  inProgress,
  cancelling,
  cancelled,
  failed,
  completed,
  completedWithFailures,
}

extension ReadSetExportJobStatusValueExtension on ReadSetExportJobStatus {
  String toValue() {
    switch (this) {
      case ReadSetExportJobStatus.submitted:
        return 'SUBMITTED';
      case ReadSetExportJobStatus.inProgress:
        return 'IN_PROGRESS';
      case ReadSetExportJobStatus.cancelling:
        return 'CANCELLING';
      case ReadSetExportJobStatus.cancelled:
        return 'CANCELLED';
      case ReadSetExportJobStatus.failed:
        return 'FAILED';
      case ReadSetExportJobStatus.completed:
        return 'COMPLETED';
      case ReadSetExportJobStatus.completedWithFailures:
        return 'COMPLETED_WITH_FAILURES';
    }
  }
}

extension ReadSetExportJobStatusFromString on String {
  ReadSetExportJobStatus toReadSetExportJobStatus() {
    switch (this) {
      case 'SUBMITTED':
        return ReadSetExportJobStatus.submitted;
      case 'IN_PROGRESS':
        return ReadSetExportJobStatus.inProgress;
      case 'CANCELLING':
        return ReadSetExportJobStatus.cancelling;
      case 'CANCELLED':
        return ReadSetExportJobStatus.cancelled;
      case 'FAILED':
        return ReadSetExportJobStatus.failed;
      case 'COMPLETED':
        return ReadSetExportJobStatus.completed;
      case 'COMPLETED_WITH_FAILURES':
        return ReadSetExportJobStatus.completedWithFailures;
    }
    throw Exception('$this is not known in enum ReadSetExportJobStatus');
  }
}

enum ReadSetFile {
  source1,
  source2,
  $index,
}

extension ReadSetFileValueExtension on ReadSetFile {
  String toValue() {
    switch (this) {
      case ReadSetFile.source1:
        return 'SOURCE1';
      case ReadSetFile.source2:
        return 'SOURCE2';
      case ReadSetFile.$index:
        return 'INDEX';
    }
  }
}

extension ReadSetFileFromString on String {
  ReadSetFile toReadSetFile() {
    switch (this) {
      case 'SOURCE1':
        return ReadSetFile.source1;
      case 'SOURCE2':
        return ReadSetFile.source2;
      case 'INDEX':
        return ReadSetFile.$index;
    }
    throw Exception('$this is not known in enum ReadSetFile');
  }
}

/// Files in a read set.
class ReadSetFiles {
  /// The files' index.
  final FileInformation? index;

  /// The location of the first file in Amazon S3.
  final FileInformation? source1;

  /// The location of the second file in Amazon S3.
  final FileInformation? source2;

  ReadSetFiles({
    this.index,
    this.source1,
    this.source2,
  });

  factory ReadSetFiles.fromJson(Map<String, dynamic> json) {
    return ReadSetFiles(
      index: json['index'] != null
          ? FileInformation.fromJson(json['index'] as Map<String, dynamic>)
          : null,
      source1: json['source1'] != null
          ? FileInformation.fromJson(json['source1'] as Map<String, dynamic>)
          : null,
      source2: json['source2'] != null
          ? FileInformation.fromJson(json['source2'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final index = this.index;
    final source1 = this.source1;
    final source2 = this.source2;
    return {
      if (index != null) 'index': index,
      if (source1 != null) 'source1': source1,
      if (source2 != null) 'source2': source2,
    };
  }
}

/// A filter for read sets.
class ReadSetFilter {
  /// The filter's start date.
  final DateTime? createdAfter;

  /// The filter's end date.
  final DateTime? createdBefore;

  /// The creation type of the read set.
  final CreationType? creationType;

  /// Where the source originated.
  final String? generatedFrom;

  /// A name to filter on.
  final String? name;

  /// A genome reference ARN to filter on.
  final String? referenceArn;

  /// The read set source's sample ID.
  final String? sampleId;

  /// A status to filter on.
  final ReadSetStatus? status;

  /// The read set source's subject ID.
  final String? subjectId;

  ReadSetFilter({
    this.createdAfter,
    this.createdBefore,
    this.creationType,
    this.generatedFrom,
    this.name,
    this.referenceArn,
    this.sampleId,
    this.status,
    this.subjectId,
  });

  Map<String, dynamic> toJson() {
    final createdAfter = this.createdAfter;
    final createdBefore = this.createdBefore;
    final creationType = this.creationType;
    final generatedFrom = this.generatedFrom;
    final name = this.name;
    final referenceArn = this.referenceArn;
    final sampleId = this.sampleId;
    final status = this.status;
    final subjectId = this.subjectId;
    return {
      if (createdAfter != null) 'createdAfter': iso8601ToJson(createdAfter),
      if (createdBefore != null) 'createdBefore': iso8601ToJson(createdBefore),
      if (creationType != null) 'creationType': creationType.toValue(),
      if (generatedFrom != null) 'generatedFrom': generatedFrom,
      if (name != null) 'name': name,
      if (referenceArn != null) 'referenceArn': referenceArn,
      if (sampleId != null) 'sampleId': sampleId,
      if (status != null) 'status': status.toValue(),
      if (subjectId != null) 'subjectId': subjectId,
    };
  }
}

enum ReadSetImportJobItemStatus {
  notStarted,
  inProgress,
  finished,
  failed,
}

extension ReadSetImportJobItemStatusValueExtension
    on ReadSetImportJobItemStatus {
  String toValue() {
    switch (this) {
      case ReadSetImportJobItemStatus.notStarted:
        return 'NOT_STARTED';
      case ReadSetImportJobItemStatus.inProgress:
        return 'IN_PROGRESS';
      case ReadSetImportJobItemStatus.finished:
        return 'FINISHED';
      case ReadSetImportJobItemStatus.failed:
        return 'FAILED';
    }
  }
}

extension ReadSetImportJobItemStatusFromString on String {
  ReadSetImportJobItemStatus toReadSetImportJobItemStatus() {
    switch (this) {
      case 'NOT_STARTED':
        return ReadSetImportJobItemStatus.notStarted;
      case 'IN_PROGRESS':
        return ReadSetImportJobItemStatus.inProgress;
      case 'FINISHED':
        return ReadSetImportJobItemStatus.finished;
      case 'FAILED':
        return ReadSetImportJobItemStatus.failed;
    }
    throw Exception('$this is not known in enum ReadSetImportJobItemStatus');
  }
}

enum ReadSetImportJobStatus {
  submitted,
  inProgress,
  cancelling,
  cancelled,
  failed,
  completed,
  completedWithFailures,
}

extension ReadSetImportJobStatusValueExtension on ReadSetImportJobStatus {
  String toValue() {
    switch (this) {
      case ReadSetImportJobStatus.submitted:
        return 'SUBMITTED';
      case ReadSetImportJobStatus.inProgress:
        return 'IN_PROGRESS';
      case ReadSetImportJobStatus.cancelling:
        return 'CANCELLING';
      case ReadSetImportJobStatus.cancelled:
        return 'CANCELLED';
      case ReadSetImportJobStatus.failed:
        return 'FAILED';
      case ReadSetImportJobStatus.completed:
        return 'COMPLETED';
      case ReadSetImportJobStatus.completedWithFailures:
        return 'COMPLETED_WITH_FAILURES';
    }
  }
}

extension ReadSetImportJobStatusFromString on String {
  ReadSetImportJobStatus toReadSetImportJobStatus() {
    switch (this) {
      case 'SUBMITTED':
        return ReadSetImportJobStatus.submitted;
      case 'IN_PROGRESS':
        return ReadSetImportJobStatus.inProgress;
      case 'CANCELLING':
        return ReadSetImportJobStatus.cancelling;
      case 'CANCELLED':
        return ReadSetImportJobStatus.cancelled;
      case 'FAILED':
        return ReadSetImportJobStatus.failed;
      case 'COMPLETED':
        return ReadSetImportJobStatus.completed;
      case 'COMPLETED_WITH_FAILURES':
        return ReadSetImportJobStatus.completedWithFailures;
    }
    throw Exception('$this is not known in enum ReadSetImportJobStatus');
  }
}

/// A read set.
class ReadSetListItem {
  /// The read set's ARN.
  final String arn;

  /// When the read set was created.
  final DateTime creationTime;

  /// The read set's file type.
  final FileType fileType;

  /// The read set's ID.
  final String id;

  /// The read set's sequence store ID.
  final String sequenceStoreId;

  /// The read set's status.
  final ReadSetStatus status;

  /// The creation type of the read set.
  final CreationType? creationType;

  /// The read set's description.
  final String? description;

  /// The entity tag (ETag) is a hash of the object representing its semantic
  /// content.
  final ETag? etag;

  /// The read set's name.
  final String? name;

  /// The read set's genome reference ARN.
  final String? referenceArn;

  /// The read set's sample ID.
  final String? sampleId;
  final SequenceInformation? sequenceInformation;

  /// The status for a read set. It provides more detail as to why the read set
  /// has a status.
  final String? statusMessage;

  /// The read set's subject ID.
  final String? subjectId;

  ReadSetListItem({
    required this.arn,
    required this.creationTime,
    required this.fileType,
    required this.id,
    required this.sequenceStoreId,
    required this.status,
    this.creationType,
    this.description,
    this.etag,
    this.name,
    this.referenceArn,
    this.sampleId,
    this.sequenceInformation,
    this.statusMessage,
    this.subjectId,
  });

  factory ReadSetListItem.fromJson(Map<String, dynamic> json) {
    return ReadSetListItem(
      arn: json['arn'] as String,
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      fileType: (json['fileType'] as String).toFileType(),
      id: json['id'] as String,
      sequenceStoreId: json['sequenceStoreId'] as String,
      status: (json['status'] as String).toReadSetStatus(),
      creationType: (json['creationType'] as String?)?.toCreationType(),
      description: json['description'] as String?,
      etag: json['etag'] != null
          ? ETag.fromJson(json['etag'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      referenceArn: json['referenceArn'] as String?,
      sampleId: json['sampleId'] as String?,
      sequenceInformation: json['sequenceInformation'] != null
          ? SequenceInformation.fromJson(
              json['sequenceInformation'] as Map<String, dynamic>)
          : null,
      statusMessage: json['statusMessage'] as String?,
      subjectId: json['subjectId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final fileType = this.fileType;
    final id = this.id;
    final sequenceStoreId = this.sequenceStoreId;
    final status = this.status;
    final creationType = this.creationType;
    final description = this.description;
    final etag = this.etag;
    final name = this.name;
    final referenceArn = this.referenceArn;
    final sampleId = this.sampleId;
    final sequenceInformation = this.sequenceInformation;
    final statusMessage = this.statusMessage;
    final subjectId = this.subjectId;
    return {
      'arn': arn,
      'creationTime': iso8601ToJson(creationTime),
      'fileType': fileType.toValue(),
      'id': id,
      'sequenceStoreId': sequenceStoreId,
      'status': status.toValue(),
      if (creationType != null) 'creationType': creationType.toValue(),
      if (description != null) 'description': description,
      if (etag != null) 'etag': etag,
      if (name != null) 'name': name,
      if (referenceArn != null) 'referenceArn': referenceArn,
      if (sampleId != null) 'sampleId': sampleId,
      if (sequenceInformation != null)
        'sequenceInformation': sequenceInformation,
      if (statusMessage != null) 'statusMessage': statusMessage,
      if (subjectId != null) 'subjectId': subjectId,
    };
  }
}

enum ReadSetPartSource {
  source1,
  source2,
}

extension ReadSetPartSourceValueExtension on ReadSetPartSource {
  String toValue() {
    switch (this) {
      case ReadSetPartSource.source1:
        return 'SOURCE1';
      case ReadSetPartSource.source2:
        return 'SOURCE2';
    }
  }
}

extension ReadSetPartSourceFromString on String {
  ReadSetPartSource toReadSetPartSource() {
    switch (this) {
      case 'SOURCE1':
        return ReadSetPartSource.source1;
      case 'SOURCE2':
        return ReadSetPartSource.source2;
    }
    throw Exception('$this is not known in enum ReadSetPartSource');
  }
}

/// The S3 URI for each read set file.
class ReadSetS3Access {
  /// The S3 URI for each read set file.
  final String? s3Uri;

  ReadSetS3Access({
    this.s3Uri,
  });

  factory ReadSetS3Access.fromJson(Map<String, dynamic> json) {
    return ReadSetS3Access(
      s3Uri: json['s3Uri'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Uri = this.s3Uri;
    return {
      if (s3Uri != null) 's3Uri': s3Uri,
    };
  }
}

enum ReadSetStatus {
  archived,
  activating,
  active,
  deleting,
  deleted,
  processingUpload,
  uploadFailed,
}

extension ReadSetStatusValueExtension on ReadSetStatus {
  String toValue() {
    switch (this) {
      case ReadSetStatus.archived:
        return 'ARCHIVED';
      case ReadSetStatus.activating:
        return 'ACTIVATING';
      case ReadSetStatus.active:
        return 'ACTIVE';
      case ReadSetStatus.deleting:
        return 'DELETING';
      case ReadSetStatus.deleted:
        return 'DELETED';
      case ReadSetStatus.processingUpload:
        return 'PROCESSING_UPLOAD';
      case ReadSetStatus.uploadFailed:
        return 'UPLOAD_FAILED';
    }
  }
}

extension ReadSetStatusFromString on String {
  ReadSetStatus toReadSetStatus() {
    switch (this) {
      case 'ARCHIVED':
        return ReadSetStatus.archived;
      case 'ACTIVATING':
        return ReadSetStatus.activating;
      case 'ACTIVE':
        return ReadSetStatus.active;
      case 'DELETING':
        return ReadSetStatus.deleting;
      case 'DELETED':
        return ReadSetStatus.deleted;
      case 'PROCESSING_UPLOAD':
        return ReadSetStatus.processingUpload;
      case 'UPLOAD_FAILED':
        return ReadSetStatus.uploadFailed;
    }
    throw Exception('$this is not known in enum ReadSetStatus');
  }
}

/// Filter settings that select for read set upload parts of interest.
class ReadSetUploadPartListFilter {
  /// Filters for read set uploads after a specified time.
  final DateTime? createdAfter;

  /// Filters for read set part uploads before a specified time.
  final DateTime? createdBefore;

  ReadSetUploadPartListFilter({
    this.createdAfter,
    this.createdBefore,
  });

  Map<String, dynamic> toJson() {
    final createdAfter = this.createdAfter;
    final createdBefore = this.createdBefore;
    return {
      if (createdAfter != null) 'createdAfter': iso8601ToJson(createdAfter),
      if (createdBefore != null) 'createdBefore': iso8601ToJson(createdBefore),
    };
  }
}

/// The metadata of a single part of a file that was added to a multipart
/// upload. A list of these parts is returned in the response to the
/// ListReadSetUploadParts API.
class ReadSetUploadPartListItem {
  /// A unique identifier used to confirm that parts are being added to the
  /// correct upload.
  final String checksum;

  /// The number identifying the part in an upload.
  final int partNumber;

  /// The size of the the part in an upload.
  final int partSize;

  /// The origin of the part being direct uploaded.
  final ReadSetPartSource partSource;

  /// The time stamp for when a direct upload was created.
  final DateTime? creationTime;

  /// The time stamp for the most recent update to an uploaded part.
  final DateTime? lastUpdatedTime;

  ReadSetUploadPartListItem({
    required this.checksum,
    required this.partNumber,
    required this.partSize,
    required this.partSource,
    this.creationTime,
    this.lastUpdatedTime,
  });

  factory ReadSetUploadPartListItem.fromJson(Map<String, dynamic> json) {
    return ReadSetUploadPartListItem(
      checksum: json['checksum'] as String,
      partNumber: json['partNumber'] as int,
      partSize: json['partSize'] as int,
      partSource: (json['partSource'] as String).toReadSetPartSource(),
      creationTime: timeStampFromJson(json['creationTime']),
      lastUpdatedTime: timeStampFromJson(json['lastUpdatedTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final checksum = this.checksum;
    final partNumber = this.partNumber;
    final partSize = this.partSize;
    final partSource = this.partSource;
    final creationTime = this.creationTime;
    final lastUpdatedTime = this.lastUpdatedTime;
    return {
      'checksum': checksum,
      'partNumber': partNumber,
      'partSize': partSize,
      'partSource': partSource.toValue(),
      if (creationTime != null) 'creationTime': iso8601ToJson(creationTime),
      if (lastUpdatedTime != null)
        'lastUpdatedTime': iso8601ToJson(lastUpdatedTime),
    };
  }
}

enum ReferenceFile {
  source,
  $index,
}

extension ReferenceFileValueExtension on ReferenceFile {
  String toValue() {
    switch (this) {
      case ReferenceFile.source:
        return 'SOURCE';
      case ReferenceFile.$index:
        return 'INDEX';
    }
  }
}

extension ReferenceFileFromString on String {
  ReferenceFile toReferenceFile() {
    switch (this) {
      case 'SOURCE':
        return ReferenceFile.source;
      case 'INDEX':
        return ReferenceFile.$index;
    }
    throw Exception('$this is not known in enum ReferenceFile');
  }
}

/// A set of genome reference files.
class ReferenceFiles {
  /// The files' index.
  final FileInformation? index;

  /// The source file's location in Amazon S3.
  final FileInformation? source;

  ReferenceFiles({
    this.index,
    this.source,
  });

  factory ReferenceFiles.fromJson(Map<String, dynamic> json) {
    return ReferenceFiles(
      index: json['index'] != null
          ? FileInformation.fromJson(json['index'] as Map<String, dynamic>)
          : null,
      source: json['source'] != null
          ? FileInformation.fromJson(json['source'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final index = this.index;
    final source = this.source;
    return {
      if (index != null) 'index': index,
      if (source != null) 'source': source,
    };
  }
}

/// A filter for references.
class ReferenceFilter {
  /// The filter's start date.
  final DateTime? createdAfter;

  /// The filter's end date.
  final DateTime? createdBefore;

  /// An MD5 checksum to filter on.
  final String? md5;

  /// A name to filter on.
  final String? name;

  ReferenceFilter({
    this.createdAfter,
    this.createdBefore,
    this.md5,
    this.name,
  });

  Map<String, dynamic> toJson() {
    final createdAfter = this.createdAfter;
    final createdBefore = this.createdBefore;
    final md5 = this.md5;
    final name = this.name;
    return {
      if (createdAfter != null) 'createdAfter': iso8601ToJson(createdAfter),
      if (createdBefore != null) 'createdBefore': iso8601ToJson(createdBefore),
      if (md5 != null) 'md5': md5,
      if (name != null) 'name': name,
    };
  }
}

enum ReferenceImportJobItemStatus {
  notStarted,
  inProgress,
  finished,
  failed,
}

extension ReferenceImportJobItemStatusValueExtension
    on ReferenceImportJobItemStatus {
  String toValue() {
    switch (this) {
      case ReferenceImportJobItemStatus.notStarted:
        return 'NOT_STARTED';
      case ReferenceImportJobItemStatus.inProgress:
        return 'IN_PROGRESS';
      case ReferenceImportJobItemStatus.finished:
        return 'FINISHED';
      case ReferenceImportJobItemStatus.failed:
        return 'FAILED';
    }
  }
}

extension ReferenceImportJobItemStatusFromString on String {
  ReferenceImportJobItemStatus toReferenceImportJobItemStatus() {
    switch (this) {
      case 'NOT_STARTED':
        return ReferenceImportJobItemStatus.notStarted;
      case 'IN_PROGRESS':
        return ReferenceImportJobItemStatus.inProgress;
      case 'FINISHED':
        return ReferenceImportJobItemStatus.finished;
      case 'FAILED':
        return ReferenceImportJobItemStatus.failed;
    }
    throw Exception('$this is not known in enum ReferenceImportJobItemStatus');
  }
}

enum ReferenceImportJobStatus {
  submitted,
  inProgress,
  cancelling,
  cancelled,
  failed,
  completed,
  completedWithFailures,
}

extension ReferenceImportJobStatusValueExtension on ReferenceImportJobStatus {
  String toValue() {
    switch (this) {
      case ReferenceImportJobStatus.submitted:
        return 'SUBMITTED';
      case ReferenceImportJobStatus.inProgress:
        return 'IN_PROGRESS';
      case ReferenceImportJobStatus.cancelling:
        return 'CANCELLING';
      case ReferenceImportJobStatus.cancelled:
        return 'CANCELLED';
      case ReferenceImportJobStatus.failed:
        return 'FAILED';
      case ReferenceImportJobStatus.completed:
        return 'COMPLETED';
      case ReferenceImportJobStatus.completedWithFailures:
        return 'COMPLETED_WITH_FAILURES';
    }
  }
}

extension ReferenceImportJobStatusFromString on String {
  ReferenceImportJobStatus toReferenceImportJobStatus() {
    switch (this) {
      case 'SUBMITTED':
        return ReferenceImportJobStatus.submitted;
      case 'IN_PROGRESS':
        return ReferenceImportJobStatus.inProgress;
      case 'CANCELLING':
        return ReferenceImportJobStatus.cancelling;
      case 'CANCELLED':
        return ReferenceImportJobStatus.cancelled;
      case 'FAILED':
        return ReferenceImportJobStatus.failed;
      case 'COMPLETED':
        return ReferenceImportJobStatus.completed;
      case 'COMPLETED_WITH_FAILURES':
        return ReferenceImportJobStatus.completedWithFailures;
    }
    throw Exception('$this is not known in enum ReferenceImportJobStatus');
  }
}

/// A genome reference.
class ReferenceItem {
  /// The reference's ARN.
  final String? referenceArn;

  ReferenceItem({
    this.referenceArn,
  });

  factory ReferenceItem.fromJson(Map<String, dynamic> json) {
    return ReferenceItem(
      referenceArn: json['referenceArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final referenceArn = this.referenceArn;
    return {
      if (referenceArn != null) 'referenceArn': referenceArn,
    };
  }
}

/// A genome reference.
class ReferenceListItem {
  /// The reference's ARN.
  final String arn;

  /// When the reference was created.
  final DateTime creationTime;

  /// The reference's ID.
  final String id;

  /// The reference's MD5 checksum.
  final String md5;

  /// The reference's store ID.
  final String referenceStoreId;

  /// When the reference was updated.
  final DateTime updateTime;

  /// The reference's description.
  final String? description;

  /// The reference's name.
  final String? name;

  /// The reference's status.
  final ReferenceStatus? status;

  ReferenceListItem({
    required this.arn,
    required this.creationTime,
    required this.id,
    required this.md5,
    required this.referenceStoreId,
    required this.updateTime,
    this.description,
    this.name,
    this.status,
  });

  factory ReferenceListItem.fromJson(Map<String, dynamic> json) {
    return ReferenceListItem(
      arn: json['arn'] as String,
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      id: json['id'] as String,
      md5: json['md5'] as String,
      referenceStoreId: json['referenceStoreId'] as String,
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] as Object),
      description: json['description'] as String?,
      name: json['name'] as String?,
      status: (json['status'] as String?)?.toReferenceStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final id = this.id;
    final md5 = this.md5;
    final referenceStoreId = this.referenceStoreId;
    final updateTime = this.updateTime;
    final description = this.description;
    final name = this.name;
    final status = this.status;
    return {
      'arn': arn,
      'creationTime': iso8601ToJson(creationTime),
      'id': id,
      'md5': md5,
      'referenceStoreId': referenceStoreId,
      'updateTime': iso8601ToJson(updateTime),
      if (description != null) 'description': description,
      if (name != null) 'name': name,
      if (status != null) 'status': status.toValue(),
    };
  }
}

enum ReferenceStatus {
  active,
  deleting,
  deleted,
}

extension ReferenceStatusValueExtension on ReferenceStatus {
  String toValue() {
    switch (this) {
      case ReferenceStatus.active:
        return 'ACTIVE';
      case ReferenceStatus.deleting:
        return 'DELETING';
      case ReferenceStatus.deleted:
        return 'DELETED';
    }
  }
}

extension ReferenceStatusFromString on String {
  ReferenceStatus toReferenceStatus() {
    switch (this) {
      case 'ACTIVE':
        return ReferenceStatus.active;
      case 'DELETING':
        return ReferenceStatus.deleting;
      case 'DELETED':
        return ReferenceStatus.deleted;
    }
    throw Exception('$this is not known in enum ReferenceStatus');
  }
}

/// Details about a reference store.
class ReferenceStoreDetail {
  /// The store's ARN.
  final String arn;

  /// When the store was created.
  final DateTime creationTime;

  /// The store's ID.
  final String id;

  /// The store's description.
  final String? description;

  /// The store's name.
  final String? name;

  /// The store's server-side encryption (SSE) settings.
  final SseConfig? sseConfig;

  ReferenceStoreDetail({
    required this.arn,
    required this.creationTime,
    required this.id,
    this.description,
    this.name,
    this.sseConfig,
  });

  factory ReferenceStoreDetail.fromJson(Map<String, dynamic> json) {
    return ReferenceStoreDetail(
      arn: json['arn'] as String,
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      id: json['id'] as String,
      description: json['description'] as String?,
      name: json['name'] as String?,
      sseConfig: json['sseConfig'] != null
          ? SseConfig.fromJson(json['sseConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final id = this.id;
    final description = this.description;
    final name = this.name;
    final sseConfig = this.sseConfig;
    return {
      'arn': arn,
      'creationTime': iso8601ToJson(creationTime),
      'id': id,
      if (description != null) 'description': description,
      if (name != null) 'name': name,
      if (sseConfig != null) 'sseConfig': sseConfig,
    };
  }
}

/// A filter for reference stores.
class ReferenceStoreFilter {
  /// The filter's start date.
  final DateTime? createdAfter;

  /// The filter's end date.
  final DateTime? createdBefore;

  /// The name to filter on.
  final String? name;

  ReferenceStoreFilter({
    this.createdAfter,
    this.createdBefore,
    this.name,
  });

  Map<String, dynamic> toJson() {
    final createdAfter = this.createdAfter;
    final createdBefore = this.createdBefore;
    final name = this.name;
    return {
      if (createdAfter != null) 'createdAfter': iso8601ToJson(createdAfter),
      if (createdBefore != null) 'createdBefore': iso8601ToJson(createdBefore),
      if (name != null) 'name': name,
    };
  }
}

enum ResourceOwner {
  self,
  other,
}

extension ResourceOwnerValueExtension on ResourceOwner {
  String toValue() {
    switch (this) {
      case ResourceOwner.self:
        return 'SELF';
      case ResourceOwner.other:
        return 'OTHER';
    }
  }
}

extension ResourceOwnerFromString on String {
  ResourceOwner toResourceOwner() {
    switch (this) {
      case 'SELF':
        return ResourceOwner.self;
      case 'OTHER':
        return ResourceOwner.other;
    }
    throw Exception('$this is not known in enum ResourceOwner');
  }
}

enum RunExport {
  definition,
}

extension RunExportValueExtension on RunExport {
  String toValue() {
    switch (this) {
      case RunExport.definition:
        return 'DEFINITION';
    }
  }
}

extension RunExportFromString on String {
  RunExport toRunExport() {
    switch (this) {
      case 'DEFINITION':
        return RunExport.definition;
    }
    throw Exception('$this is not known in enum RunExport');
  }
}

/// A run group.
class RunGroupListItem {
  /// The group's ARN.
  final String? arn;

  /// When the group was created.
  final DateTime? creationTime;

  /// The group's ID.
  final String? id;

  /// The group's maximum CPU count setting.
  final int? maxCpus;

  /// The group's maximum duration setting in minutes.
  final int? maxDuration;

  /// The maximum GPUs that can be used by a run group.
  final int? maxGpus;

  /// The group's maximum concurrent run setting.
  final int? maxRuns;

  /// The group's name.
  final String? name;

  RunGroupListItem({
    this.arn,
    this.creationTime,
    this.id,
    this.maxCpus,
    this.maxDuration,
    this.maxGpus,
    this.maxRuns,
    this.name,
  });

  factory RunGroupListItem.fromJson(Map<String, dynamic> json) {
    return RunGroupListItem(
      arn: json['arn'] as String?,
      creationTime: timeStampFromJson(json['creationTime']),
      id: json['id'] as String?,
      maxCpus: json['maxCpus'] as int?,
      maxDuration: json['maxDuration'] as int?,
      maxGpus: json['maxGpus'] as int?,
      maxRuns: json['maxRuns'] as int?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final id = this.id;
    final maxCpus = this.maxCpus;
    final maxDuration = this.maxDuration;
    final maxGpus = this.maxGpus;
    final maxRuns = this.maxRuns;
    final name = this.name;
    return {
      if (arn != null) 'arn': arn,
      if (creationTime != null) 'creationTime': iso8601ToJson(creationTime),
      if (id != null) 'id': id,
      if (maxCpus != null) 'maxCpus': maxCpus,
      if (maxDuration != null) 'maxDuration': maxDuration,
      if (maxGpus != null) 'maxGpus': maxGpus,
      if (maxRuns != null) 'maxRuns': maxRuns,
      if (name != null) 'name': name,
    };
  }
}

/// A workflow run.
class RunListItem {
  /// The run's ARN.
  final String? arn;

  /// When the run was created.
  final DateTime? creationTime;

  /// The run's ID.
  final String? id;

  /// The run's name.
  final String? name;

  /// The run's priority.
  final int? priority;

  /// When the run started.
  final DateTime? startTime;

  /// The run's status.
  final RunStatus? status;

  /// When the run stopped.
  final DateTime? stopTime;

  /// The run's storage capacity in gibibytes. For dynamic storage, after the run
  /// has completed, this value is the maximum amount of storage used during the
  /// run.
  final int? storageCapacity;

  /// The run's storage type.
  final StorageType? storageType;

  /// The run's workflow ID.
  final String? workflowId;

  RunListItem({
    this.arn,
    this.creationTime,
    this.id,
    this.name,
    this.priority,
    this.startTime,
    this.status,
    this.stopTime,
    this.storageCapacity,
    this.storageType,
    this.workflowId,
  });

  factory RunListItem.fromJson(Map<String, dynamic> json) {
    return RunListItem(
      arn: json['arn'] as String?,
      creationTime: timeStampFromJson(json['creationTime']),
      id: json['id'] as String?,
      name: json['name'] as String?,
      priority: json['priority'] as int?,
      startTime: timeStampFromJson(json['startTime']),
      status: (json['status'] as String?)?.toRunStatus(),
      stopTime: timeStampFromJson(json['stopTime']),
      storageCapacity: json['storageCapacity'] as int?,
      storageType: (json['storageType'] as String?)?.toStorageType(),
      workflowId: json['workflowId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final id = this.id;
    final name = this.name;
    final priority = this.priority;
    final startTime = this.startTime;
    final status = this.status;
    final stopTime = this.stopTime;
    final storageCapacity = this.storageCapacity;
    final storageType = this.storageType;
    final workflowId = this.workflowId;
    return {
      if (arn != null) 'arn': arn,
      if (creationTime != null) 'creationTime': iso8601ToJson(creationTime),
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (priority != null) 'priority': priority,
      if (startTime != null) 'startTime': iso8601ToJson(startTime),
      if (status != null) 'status': status.toValue(),
      if (stopTime != null) 'stopTime': iso8601ToJson(stopTime),
      if (storageCapacity != null) 'storageCapacity': storageCapacity,
      if (storageType != null) 'storageType': storageType.toValue(),
      if (workflowId != null) 'workflowId': workflowId,
    };
  }
}

enum RunLogLevel {
  off,
  fatal,
  error,
  all,
}

extension RunLogLevelValueExtension on RunLogLevel {
  String toValue() {
    switch (this) {
      case RunLogLevel.off:
        return 'OFF';
      case RunLogLevel.fatal:
        return 'FATAL';
      case RunLogLevel.error:
        return 'ERROR';
      case RunLogLevel.all:
        return 'ALL';
    }
  }
}

extension RunLogLevelFromString on String {
  RunLogLevel toRunLogLevel() {
    switch (this) {
      case 'OFF':
        return RunLogLevel.off;
      case 'FATAL':
        return RunLogLevel.fatal;
      case 'ERROR':
        return RunLogLevel.error;
      case 'ALL':
        return RunLogLevel.all;
    }
    throw Exception('$this is not known in enum RunLogLevel');
  }
}

/// The URI for the run log.
class RunLogLocation {
  /// The log stream ARN for the engine log.
  final String? engineLogStream;

  /// The log stream ARN for the run log.
  final String? runLogStream;

  RunLogLocation({
    this.engineLogStream,
    this.runLogStream,
  });

  factory RunLogLocation.fromJson(Map<String, dynamic> json) {
    return RunLogLocation(
      engineLogStream: json['engineLogStream'] as String?,
      runLogStream: json['runLogStream'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final engineLogStream = this.engineLogStream;
    final runLogStream = this.runLogStream;
    return {
      if (engineLogStream != null) 'engineLogStream': engineLogStream,
      if (runLogStream != null) 'runLogStream': runLogStream,
    };
  }
}

class RunParameters {
  RunParameters();

  factory RunParameters.fromJson(Map<String, dynamic> _) {
    return RunParameters();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum RunRetentionMode {
  retain,
  remove,
}

extension RunRetentionModeValueExtension on RunRetentionMode {
  String toValue() {
    switch (this) {
      case RunRetentionMode.retain:
        return 'RETAIN';
      case RunRetentionMode.remove:
        return 'REMOVE';
    }
  }
}

extension RunRetentionModeFromString on String {
  RunRetentionMode toRunRetentionMode() {
    switch (this) {
      case 'RETAIN':
        return RunRetentionMode.retain;
      case 'REMOVE':
        return RunRetentionMode.remove;
    }
    throw Exception('$this is not known in enum RunRetentionMode');
  }
}

enum RunStatus {
  pending,
  starting,
  running,
  stopping,
  completed,
  deleted,
  cancelled,
  failed,
}

extension RunStatusValueExtension on RunStatus {
  String toValue() {
    switch (this) {
      case RunStatus.pending:
        return 'PENDING';
      case RunStatus.starting:
        return 'STARTING';
      case RunStatus.running:
        return 'RUNNING';
      case RunStatus.stopping:
        return 'STOPPING';
      case RunStatus.completed:
        return 'COMPLETED';
      case RunStatus.deleted:
        return 'DELETED';
      case RunStatus.cancelled:
        return 'CANCELLED';
      case RunStatus.failed:
        return 'FAILED';
    }
  }
}

extension RunStatusFromString on String {
  RunStatus toRunStatus() {
    switch (this) {
      case 'PENDING':
        return RunStatus.pending;
      case 'STARTING':
        return RunStatus.starting;
      case 'RUNNING':
        return RunStatus.running;
      case 'STOPPING':
        return RunStatus.stopping;
      case 'COMPLETED':
        return RunStatus.completed;
      case 'DELETED':
        return RunStatus.deleted;
      case 'CANCELLED':
        return RunStatus.cancelled;
      case 'FAILED':
        return RunStatus.failed;
    }
    throw Exception('$this is not known in enum RunStatus');
  }
}

enum SchemaValueType {
  long,
  int,
  string,
  float,
  double,
  boolean,
}

extension SchemaValueTypeValueExtension on SchemaValueType {
  String toValue() {
    switch (this) {
      case SchemaValueType.long:
        return 'LONG';
      case SchemaValueType.int:
        return 'INT';
      case SchemaValueType.string:
        return 'STRING';
      case SchemaValueType.float:
        return 'FLOAT';
      case SchemaValueType.double:
        return 'DOUBLE';
      case SchemaValueType.boolean:
        return 'BOOLEAN';
    }
  }
}

extension SchemaValueTypeFromString on String {
  SchemaValueType toSchemaValueType() {
    switch (this) {
      case 'LONG':
        return SchemaValueType.long;
      case 'INT':
        return SchemaValueType.int;
      case 'STRING':
        return SchemaValueType.string;
      case 'FLOAT':
        return SchemaValueType.float;
      case 'DOUBLE':
        return SchemaValueType.double;
      case 'BOOLEAN':
        return SchemaValueType.boolean;
    }
    throw Exception('$this is not known in enum SchemaValueType');
  }
}

/// Details about a sequence.
class SequenceInformation {
  /// The sequence's alignment setting.
  final String? alignment;

  /// Where the sequence originated.
  final String? generatedFrom;

  /// The sequence's total base count.
  final int? totalBaseCount;

  /// The sequence's total read count.
  final int? totalReadCount;

  SequenceInformation({
    this.alignment,
    this.generatedFrom,
    this.totalBaseCount,
    this.totalReadCount,
  });

  factory SequenceInformation.fromJson(Map<String, dynamic> json) {
    return SequenceInformation(
      alignment: json['alignment'] as String?,
      generatedFrom: json['generatedFrom'] as String?,
      totalBaseCount: json['totalBaseCount'] as int?,
      totalReadCount: json['totalReadCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final alignment = this.alignment;
    final generatedFrom = this.generatedFrom;
    final totalBaseCount = this.totalBaseCount;
    final totalReadCount = this.totalReadCount;
    return {
      if (alignment != null) 'alignment': alignment,
      if (generatedFrom != null) 'generatedFrom': generatedFrom,
      if (totalBaseCount != null) 'totalBaseCount': totalBaseCount,
      if (totalReadCount != null) 'totalReadCount': totalReadCount,
    };
  }
}

/// Details about a sequence store.
class SequenceStoreDetail {
  /// The store's ARN.
  final String arn;

  /// When the store was created.
  final DateTime creationTime;

  /// The store's ID.
  final String id;

  /// The store's description.
  final String? description;

  /// The algorithm family of the ETag.
  final ETagAlgorithmFamily? eTagAlgorithmFamily;

  /// An S3 location that is used to store files that have failed a direct upload.
  final String? fallbackLocation;

  /// The store's name.
  final String? name;

  /// The store's server-side encryption (SSE) settings.
  final SseConfig? sseConfig;

  SequenceStoreDetail({
    required this.arn,
    required this.creationTime,
    required this.id,
    this.description,
    this.eTagAlgorithmFamily,
    this.fallbackLocation,
    this.name,
    this.sseConfig,
  });

  factory SequenceStoreDetail.fromJson(Map<String, dynamic> json) {
    return SequenceStoreDetail(
      arn: json['arn'] as String,
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      id: json['id'] as String,
      description: json['description'] as String?,
      eTagAlgorithmFamily:
          (json['eTagAlgorithmFamily'] as String?)?.toETagAlgorithmFamily(),
      fallbackLocation: json['fallbackLocation'] as String?,
      name: json['name'] as String?,
      sseConfig: json['sseConfig'] != null
          ? SseConfig.fromJson(json['sseConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final id = this.id;
    final description = this.description;
    final eTagAlgorithmFamily = this.eTagAlgorithmFamily;
    final fallbackLocation = this.fallbackLocation;
    final name = this.name;
    final sseConfig = this.sseConfig;
    return {
      'arn': arn,
      'creationTime': iso8601ToJson(creationTime),
      'id': id,
      if (description != null) 'description': description,
      if (eTagAlgorithmFamily != null)
        'eTagAlgorithmFamily': eTagAlgorithmFamily.toValue(),
      if (fallbackLocation != null) 'fallbackLocation': fallbackLocation,
      if (name != null) 'name': name,
      if (sseConfig != null) 'sseConfig': sseConfig,
    };
  }
}

/// A filter for a sequence store.
class SequenceStoreFilter {
  /// The filter's start date.
  final DateTime? createdAfter;

  /// The filter's end date.
  final DateTime? createdBefore;

  /// A name to filter on.
  final String? name;

  SequenceStoreFilter({
    this.createdAfter,
    this.createdBefore,
    this.name,
  });

  Map<String, dynamic> toJson() {
    final createdAfter = this.createdAfter;
    final createdBefore = this.createdBefore;
    final name = this.name;
    return {
      if (createdAfter != null) 'createdAfter': iso8601ToJson(createdAfter),
      if (createdBefore != null) 'createdBefore': iso8601ToJson(createdBefore),
      if (name != null) 'name': name,
    };
  }
}

/// The S3 access metadata of the sequence store.
class SequenceStoreS3Access {
  /// This is ARN of the access point associated with the S3 bucket storing read
  /// sets.
  final String? s3AccessPointArn;

  /// The S3 URI of the sequence store.
  final String? s3Uri;

  SequenceStoreS3Access({
    this.s3AccessPointArn,
    this.s3Uri,
  });

  factory SequenceStoreS3Access.fromJson(Map<String, dynamic> json) {
    return SequenceStoreS3Access(
      s3AccessPointArn: json['s3AccessPointArn'] as String?,
      s3Uri: json['s3Uri'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final s3AccessPointArn = this.s3AccessPointArn;
    final s3Uri = this.s3Uri;
    return {
      if (s3AccessPointArn != null) 's3AccessPointArn': s3AccessPointArn,
      if (s3Uri != null) 's3Uri': s3Uri,
    };
  }
}

/// The details of a resource share.
class ShareDetails {
  /// The timestamp of when the resource share was created.
  final DateTime? creationTime;

  /// The account ID for the data owner. The owner creates the resource share.
  final String? ownerId;

  /// The principal subscriber is the account that is sharing the resource.
  final String? principalSubscriber;

  /// The Arn of the shared resource.
  final String? resourceArn;

  /// The ID of the shared resource.
  final String? resourceId;

  /// The ID of the resource share.
  final String? shareId;

  /// The name of the resource share.
  final String? shareName;

  /// The status of the share.
  final ShareStatus? status;

  /// The status message for a resource share. It provides additional details
  /// about the share status.
  final String? statusMessage;

  /// The timestamp of the resource share update.
  final DateTime? updateTime;

  ShareDetails({
    this.creationTime,
    this.ownerId,
    this.principalSubscriber,
    this.resourceArn,
    this.resourceId,
    this.shareId,
    this.shareName,
    this.status,
    this.statusMessage,
    this.updateTime,
  });

  factory ShareDetails.fromJson(Map<String, dynamic> json) {
    return ShareDetails(
      creationTime: timeStampFromJson(json['creationTime']),
      ownerId: json['ownerId'] as String?,
      principalSubscriber: json['principalSubscriber'] as String?,
      resourceArn: json['resourceArn'] as String?,
      resourceId: json['resourceId'] as String?,
      shareId: json['shareId'] as String?,
      shareName: json['shareName'] as String?,
      status: (json['status'] as String?)?.toShareStatus(),
      statusMessage: json['statusMessage'] as String?,
      updateTime: timeStampFromJson(json['updateTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final ownerId = this.ownerId;
    final principalSubscriber = this.principalSubscriber;
    final resourceArn = this.resourceArn;
    final resourceId = this.resourceId;
    final shareId = this.shareId;
    final shareName = this.shareName;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final updateTime = this.updateTime;
    return {
      if (creationTime != null) 'creationTime': iso8601ToJson(creationTime),
      if (ownerId != null) 'ownerId': ownerId,
      if (principalSubscriber != null)
        'principalSubscriber': principalSubscriber,
      if (resourceArn != null) 'resourceArn': resourceArn,
      if (resourceId != null) 'resourceId': resourceId,
      if (shareId != null) 'shareId': shareId,
      if (shareName != null) 'shareName': shareName,
      if (status != null) 'status': status.toValue(),
      if (statusMessage != null) 'statusMessage': statusMessage,
      if (updateTime != null) 'updateTime': iso8601ToJson(updateTime),
    };
  }
}

enum ShareResourceType {
  variantStore,
  annotationStore,
  workflow,
}

extension ShareResourceTypeValueExtension on ShareResourceType {
  String toValue() {
    switch (this) {
      case ShareResourceType.variantStore:
        return 'VARIANT_STORE';
      case ShareResourceType.annotationStore:
        return 'ANNOTATION_STORE';
      case ShareResourceType.workflow:
        return 'WORKFLOW';
    }
  }
}

extension ShareResourceTypeFromString on String {
  ShareResourceType toShareResourceType() {
    switch (this) {
      case 'VARIANT_STORE':
        return ShareResourceType.variantStore;
      case 'ANNOTATION_STORE':
        return ShareResourceType.annotationStore;
      case 'WORKFLOW':
        return ShareResourceType.workflow;
    }
    throw Exception('$this is not known in enum ShareResourceType');
  }
}

enum ShareStatus {
  pending,
  activating,
  active,
  deleting,
  deleted,
  failed,
}

extension ShareStatusValueExtension on ShareStatus {
  String toValue() {
    switch (this) {
      case ShareStatus.pending:
        return 'PENDING';
      case ShareStatus.activating:
        return 'ACTIVATING';
      case ShareStatus.active:
        return 'ACTIVE';
      case ShareStatus.deleting:
        return 'DELETING';
      case ShareStatus.deleted:
        return 'DELETED';
      case ShareStatus.failed:
        return 'FAILED';
    }
  }
}

extension ShareStatusFromString on String {
  ShareStatus toShareStatus() {
    switch (this) {
      case 'PENDING':
        return ShareStatus.pending;
      case 'ACTIVATING':
        return ShareStatus.activating;
      case 'ACTIVE':
        return ShareStatus.active;
      case 'DELETING':
        return ShareStatus.deleting;
      case 'DELETED':
        return ShareStatus.deleted;
      case 'FAILED':
        return ShareStatus.failed;
    }
    throw Exception('$this is not known in enum ShareStatus');
  }
}

/// Source files for a sequence.
class SourceFiles {
  /// The location of the first file in Amazon S3.
  final String source1;

  /// The location of the second file in Amazon S3.
  final String? source2;

  SourceFiles({
    required this.source1,
    this.source2,
  });

  factory SourceFiles.fromJson(Map<String, dynamic> json) {
    return SourceFiles(
      source1: json['source1'] as String,
      source2: json['source2'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final source1 = this.source1;
    final source2 = this.source2;
    return {
      'source1': source1,
      if (source2 != null) 'source2': source2,
    };
  }
}

/// Server-side encryption (SSE) settings for a store.
class SseConfig {
  /// The encryption type.
  final EncryptionType type;

  /// An encryption key ARN.
  final String? keyArn;

  SseConfig({
    required this.type,
    this.keyArn,
  });

  factory SseConfig.fromJson(Map<String, dynamic> json) {
    return SseConfig(
      type: (json['type'] as String).toEncryptionType(),
      keyArn: json['keyArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final keyArn = this.keyArn;
    return {
      'type': type.toValue(),
      if (keyArn != null) 'keyArn': keyArn,
    };
  }
}

class StartAnnotationImportResponse {
  /// The job's ID.
  final String jobId;

  StartAnnotationImportResponse({
    required this.jobId,
  });

  factory StartAnnotationImportResponse.fromJson(Map<String, dynamic> json) {
    return StartAnnotationImportResponse(
      jobId: json['jobId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    return {
      'jobId': jobId,
    };
  }
}

class StartReadSetActivationJobResponse {
  /// When the job was created.
  final DateTime creationTime;

  /// The job's ID.
  final String id;

  /// The read set's sequence store ID.
  final String sequenceStoreId;

  /// The job's status.
  final ReadSetActivationJobStatus status;

  StartReadSetActivationJobResponse({
    required this.creationTime,
    required this.id,
    required this.sequenceStoreId,
    required this.status,
  });

  factory StartReadSetActivationJobResponse.fromJson(
      Map<String, dynamic> json) {
    return StartReadSetActivationJobResponse(
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      id: json['id'] as String,
      sequenceStoreId: json['sequenceStoreId'] as String,
      status: (json['status'] as String).toReadSetActivationJobStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final id = this.id;
    final sequenceStoreId = this.sequenceStoreId;
    final status = this.status;
    return {
      'creationTime': iso8601ToJson(creationTime),
      'id': id,
      'sequenceStoreId': sequenceStoreId,
      'status': status.toValue(),
    };
  }
}

/// A source for a read set activation job.
class StartReadSetActivationJobSourceItem {
  /// The source's read set ID.
  final String readSetId;

  StartReadSetActivationJobSourceItem({
    required this.readSetId,
  });

  Map<String, dynamic> toJson() {
    final readSetId = this.readSetId;
    return {
      'readSetId': readSetId,
    };
  }
}

class StartReadSetExportJobResponse {
  /// When the job was created.
  final DateTime creationTime;

  /// The job's output location.
  final String destination;

  /// The job's ID.
  final String id;

  /// The read set's sequence store ID.
  final String sequenceStoreId;

  /// The job's status.
  final ReadSetExportJobStatus status;

  StartReadSetExportJobResponse({
    required this.creationTime,
    required this.destination,
    required this.id,
    required this.sequenceStoreId,
    required this.status,
  });

  factory StartReadSetExportJobResponse.fromJson(Map<String, dynamic> json) {
    return StartReadSetExportJobResponse(
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      destination: json['destination'] as String,
      id: json['id'] as String,
      sequenceStoreId: json['sequenceStoreId'] as String,
      status: (json['status'] as String).toReadSetExportJobStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final destination = this.destination;
    final id = this.id;
    final sequenceStoreId = this.sequenceStoreId;
    final status = this.status;
    return {
      'creationTime': iso8601ToJson(creationTime),
      'destination': destination,
      'id': id,
      'sequenceStoreId': sequenceStoreId,
      'status': status.toValue(),
    };
  }
}

class StartReadSetImportJobResponse {
  /// When the job was created.
  final DateTime creationTime;

  /// The job's ID.
  final String id;

  /// The job's service role ARN.
  final String roleArn;

  /// The read set's sequence store ID.
  final String sequenceStoreId;

  /// The job's status.
  final ReadSetImportJobStatus status;

  StartReadSetImportJobResponse({
    required this.creationTime,
    required this.id,
    required this.roleArn,
    required this.sequenceStoreId,
    required this.status,
  });

  factory StartReadSetImportJobResponse.fromJson(Map<String, dynamic> json) {
    return StartReadSetImportJobResponse(
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      id: json['id'] as String,
      roleArn: json['roleArn'] as String,
      sequenceStoreId: json['sequenceStoreId'] as String,
      status: (json['status'] as String).toReadSetImportJobStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final id = this.id;
    final roleArn = this.roleArn;
    final sequenceStoreId = this.sequenceStoreId;
    final status = this.status;
    return {
      'creationTime': iso8601ToJson(creationTime),
      'id': id,
      'roleArn': roleArn,
      'sequenceStoreId': sequenceStoreId,
      'status': status.toValue(),
    };
  }
}

/// A source for a read set import job.
class StartReadSetImportJobSourceItem {
  /// The source's sample ID.
  final String sampleId;

  /// The source's file type.
  final FileType sourceFileType;

  /// The source files' location in Amazon S3.
  final SourceFiles sourceFiles;

  /// The source's subject ID.
  final String subjectId;

  /// The source's description.
  final String? description;

  /// Where the source originated.
  final String? generatedFrom;

  /// The source's name.
  final String? name;

  /// The source's reference ARN.
  final String? referenceArn;

  /// The source's tags.
  final Map<String, String>? tags;

  StartReadSetImportJobSourceItem({
    required this.sampleId,
    required this.sourceFileType,
    required this.sourceFiles,
    required this.subjectId,
    this.description,
    this.generatedFrom,
    this.name,
    this.referenceArn,
    this.tags,
  });

  Map<String, dynamic> toJson() {
    final sampleId = this.sampleId;
    final sourceFileType = this.sourceFileType;
    final sourceFiles = this.sourceFiles;
    final subjectId = this.subjectId;
    final description = this.description;
    final generatedFrom = this.generatedFrom;
    final name = this.name;
    final referenceArn = this.referenceArn;
    final tags = this.tags;
    return {
      'sampleId': sampleId,
      'sourceFileType': sourceFileType.toValue(),
      'sourceFiles': sourceFiles,
      'subjectId': subjectId,
      if (description != null) 'description': description,
      if (generatedFrom != null) 'generatedFrom': generatedFrom,
      if (name != null) 'name': name,
      if (referenceArn != null) 'referenceArn': referenceArn,
      if (tags != null) 'tags': tags,
    };
  }
}

class StartReferenceImportJobResponse {
  /// When the job was created.
  final DateTime creationTime;

  /// The job's ID.
  final String id;

  /// The job's reference store ID.
  final String referenceStoreId;

  /// The job's service role ARN.
  final String roleArn;

  /// The job's status.
  final ReferenceImportJobStatus status;

  StartReferenceImportJobResponse({
    required this.creationTime,
    required this.id,
    required this.referenceStoreId,
    required this.roleArn,
    required this.status,
  });

  factory StartReferenceImportJobResponse.fromJson(Map<String, dynamic> json) {
    return StartReferenceImportJobResponse(
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      id: json['id'] as String,
      referenceStoreId: json['referenceStoreId'] as String,
      roleArn: json['roleArn'] as String,
      status: (json['status'] as String).toReferenceImportJobStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final id = this.id;
    final referenceStoreId = this.referenceStoreId;
    final roleArn = this.roleArn;
    final status = this.status;
    return {
      'creationTime': iso8601ToJson(creationTime),
      'id': id,
      'referenceStoreId': referenceStoreId,
      'roleArn': roleArn,
      'status': status.toValue(),
    };
  }
}

/// A source for a reference import job.
class StartReferenceImportJobSourceItem {
  /// The source's name.
  final String name;

  /// The source file's location in Amazon S3.
  final String sourceFile;

  /// The source's description.
  final String? description;

  /// The source's tags.
  final Map<String, String>? tags;

  StartReferenceImportJobSourceItem({
    required this.name,
    required this.sourceFile,
    this.description,
    this.tags,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final sourceFile = this.sourceFile;
    final description = this.description;
    final tags = this.tags;
    return {
      'name': name,
      'sourceFile': sourceFile,
      if (description != null) 'description': description,
      if (tags != null) 'tags': tags,
    };
  }
}

class StartRunResponse {
  /// The run's ARN.
  final String? arn;

  /// The run's ID.
  final String? id;

  /// The destination for workflow outputs.
  final String? runOutputUri;

  /// The run's status.
  final RunStatus? status;

  /// The run's tags.
  final Map<String, String>? tags;

  /// The universally unique identifier for a run.
  final String? uuid;

  StartRunResponse({
    this.arn,
    this.id,
    this.runOutputUri,
    this.status,
    this.tags,
    this.uuid,
  });

  factory StartRunResponse.fromJson(Map<String, dynamic> json) {
    return StartRunResponse(
      arn: json['arn'] as String?,
      id: json['id'] as String?,
      runOutputUri: json['runOutputUri'] as String?,
      status: (json['status'] as String?)?.toRunStatus(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      uuid: json['uuid'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final runOutputUri = this.runOutputUri;
    final status = this.status;
    final tags = this.tags;
    final uuid = this.uuid;
    return {
      if (arn != null) 'arn': arn,
      if (id != null) 'id': id,
      if (runOutputUri != null) 'runOutputUri': runOutputUri,
      if (status != null) 'status': status.toValue(),
      if (tags != null) 'tags': tags,
      if (uuid != null) 'uuid': uuid,
    };
  }
}

class StartVariantImportResponse {
  /// The job's ID.
  final String jobId;

  StartVariantImportResponse({
    required this.jobId,
  });

  factory StartVariantImportResponse.fromJson(Map<String, dynamic> json) {
    return StartVariantImportResponse(
      jobId: json['jobId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    return {
      'jobId': jobId,
    };
  }
}

enum StorageType {
  static,
  $dynamic,
}

extension StorageTypeValueExtension on StorageType {
  String toValue() {
    switch (this) {
      case StorageType.static:
        return 'STATIC';
      case StorageType.$dynamic:
        return 'DYNAMIC';
    }
  }
}

extension StorageTypeFromString on String {
  StorageType toStorageType() {
    switch (this) {
      case 'STATIC':
        return StorageType.static;
      case 'DYNAMIC':
        return StorageType.$dynamic;
    }
    throw Exception('$this is not known in enum StorageType');
  }
}

enum StoreFormat {
  gff,
  tsv,
  vcf,
}

extension StoreFormatValueExtension on StoreFormat {
  String toValue() {
    switch (this) {
      case StoreFormat.gff:
        return 'GFF';
      case StoreFormat.tsv:
        return 'TSV';
      case StoreFormat.vcf:
        return 'VCF';
    }
  }
}

extension StoreFormatFromString on String {
  StoreFormat toStoreFormat() {
    switch (this) {
      case 'GFF':
        return StoreFormat.gff;
      case 'TSV':
        return StoreFormat.tsv;
      case 'VCF':
        return StoreFormat.vcf;
    }
    throw Exception('$this is not known in enum StoreFormat');
  }
}

/// Settings for a store.
class StoreOptions {
  /// File settings for a TSV store.
  final TsvStoreOptions? tsvStoreOptions;

  StoreOptions({
    this.tsvStoreOptions,
  });

  factory StoreOptions.fromJson(Map<String, dynamic> json) {
    return StoreOptions(
      tsvStoreOptions: json['tsvStoreOptions'] != null
          ? TsvStoreOptions.fromJson(
              json['tsvStoreOptions'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final tsvStoreOptions = this.tsvStoreOptions;
    return {
      if (tsvStoreOptions != null) 'tsvStoreOptions': tsvStoreOptions,
    };
  }
}

enum StoreStatus {
  creating,
  updating,
  deleting,
  active,
  failed,
}

extension StoreStatusValueExtension on StoreStatus {
  String toValue() {
    switch (this) {
      case StoreStatus.creating:
        return 'CREATING';
      case StoreStatus.updating:
        return 'UPDATING';
      case StoreStatus.deleting:
        return 'DELETING';
      case StoreStatus.active:
        return 'ACTIVE';
      case StoreStatus.failed:
        return 'FAILED';
    }
  }
}

extension StoreStatusFromString on String {
  StoreStatus toStoreStatus() {
    switch (this) {
      case 'CREATING':
        return StoreStatus.creating;
      case 'UPDATING':
        return StoreStatus.updating;
      case 'DELETING':
        return StoreStatus.deleting;
      case 'ACTIVE':
        return StoreStatus.active;
      case 'FAILED':
        return StoreStatus.failed;
    }
    throw Exception('$this is not known in enum StoreStatus');
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

/// A workflow run task.
class TaskListItem {
  /// The task's CPU count.
  final int? cpus;

  /// When the task was created.
  final DateTime? creationTime;

  /// The number of Graphics Processing Units (GPU) specified for the task.
  final int? gpus;

  /// The instance type for a task.
  final String? instanceType;

  /// The task's memory use in gigabyes.
  final int? memory;

  /// The task's name.
  final String? name;

  /// When the task started.
  final DateTime? startTime;

  /// The task's status.
  final TaskStatus? status;

  /// When the task stopped.
  final DateTime? stopTime;

  /// The task's ID.
  final String? taskId;

  TaskListItem({
    this.cpus,
    this.creationTime,
    this.gpus,
    this.instanceType,
    this.memory,
    this.name,
    this.startTime,
    this.status,
    this.stopTime,
    this.taskId,
  });

  factory TaskListItem.fromJson(Map<String, dynamic> json) {
    return TaskListItem(
      cpus: json['cpus'] as int?,
      creationTime: timeStampFromJson(json['creationTime']),
      gpus: json['gpus'] as int?,
      instanceType: json['instanceType'] as String?,
      memory: json['memory'] as int?,
      name: json['name'] as String?,
      startTime: timeStampFromJson(json['startTime']),
      status: (json['status'] as String?)?.toTaskStatus(),
      stopTime: timeStampFromJson(json['stopTime']),
      taskId: json['taskId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cpus = this.cpus;
    final creationTime = this.creationTime;
    final gpus = this.gpus;
    final instanceType = this.instanceType;
    final memory = this.memory;
    final name = this.name;
    final startTime = this.startTime;
    final status = this.status;
    final stopTime = this.stopTime;
    final taskId = this.taskId;
    return {
      if (cpus != null) 'cpus': cpus,
      if (creationTime != null) 'creationTime': iso8601ToJson(creationTime),
      if (gpus != null) 'gpus': gpus,
      if (instanceType != null) 'instanceType': instanceType,
      if (memory != null) 'memory': memory,
      if (name != null) 'name': name,
      if (startTime != null) 'startTime': iso8601ToJson(startTime),
      if (status != null) 'status': status.toValue(),
      if (stopTime != null) 'stopTime': iso8601ToJson(stopTime),
      if (taskId != null) 'taskId': taskId,
    };
  }
}

enum TaskStatus {
  pending,
  starting,
  running,
  stopping,
  completed,
  cancelled,
  failed,
}

extension TaskStatusValueExtension on TaskStatus {
  String toValue() {
    switch (this) {
      case TaskStatus.pending:
        return 'PENDING';
      case TaskStatus.starting:
        return 'STARTING';
      case TaskStatus.running:
        return 'RUNNING';
      case TaskStatus.stopping:
        return 'STOPPING';
      case TaskStatus.completed:
        return 'COMPLETED';
      case TaskStatus.cancelled:
        return 'CANCELLED';
      case TaskStatus.failed:
        return 'FAILED';
    }
  }
}

extension TaskStatusFromString on String {
  TaskStatus toTaskStatus() {
    switch (this) {
      case 'PENDING':
        return TaskStatus.pending;
      case 'STARTING':
        return TaskStatus.starting;
      case 'RUNNING':
        return TaskStatus.running;
      case 'STOPPING':
        return TaskStatus.stopping;
      case 'COMPLETED':
        return TaskStatus.completed;
      case 'CANCELLED':
        return TaskStatus.cancelled;
      case 'FAILED':
        return TaskStatus.failed;
    }
    throw Exception('$this is not known in enum TaskStatus');
  }
}

/// Formatting options for a TSV file.
class TsvOptions {
  /// The file's read options.
  final ReadOptions? readOptions;

  TsvOptions({
    this.readOptions,
  });

  factory TsvOptions.fromJson(Map<String, dynamic> json) {
    return TsvOptions(
      readOptions: json['readOptions'] != null
          ? ReadOptions.fromJson(json['readOptions'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final readOptions = this.readOptions;
    return {
      if (readOptions != null) 'readOptions': readOptions,
    };
  }
}

/// File settings for a TSV store.
class TsvStoreOptions {
  /// The store's annotation type.
  final AnnotationType? annotationType;

  /// The store's header key to column name mapping.
  final Map<FormatToHeaderKey, String>? formatToHeader;

  /// The store's schema.
  final List<Map<String, SchemaValueType>>? schema;

  TsvStoreOptions({
    this.annotationType,
    this.formatToHeader,
    this.schema,
  });

  factory TsvStoreOptions.fromJson(Map<String, dynamic> json) {
    return TsvStoreOptions(
      annotationType: (json['annotationType'] as String?)?.toAnnotationType(),
      formatToHeader: (json['formatToHeader'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k.toFormatToHeaderKey(), e as String)),
      schema: (json['schema'] as List?)
          ?.whereNotNull()
          .map((e) => (e as Map<String, dynamic>)
              .map((k, e) => MapEntry(k, (e as String).toSchemaValueType())))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final annotationType = this.annotationType;
    final formatToHeader = this.formatToHeader;
    final schema = this.schema;
    return {
      if (annotationType != null) 'annotationType': annotationType.toValue(),
      if (formatToHeader != null)
        'formatToHeader':
            formatToHeader.map((k, e) => MapEntry(k.toValue(), e)),
      if (schema != null)
        'schema': schema
            .map((e) => e.map((k, e) => MapEntry(k, e.toValue())))
            .toList(),
    };
  }
}

/// The options for a TSV file.
class TsvVersionOptions {
  /// The store version's annotation type.
  final AnnotationType? annotationType;

  /// The annotation store version's header key to column name mapping.
  final Map<FormatToHeaderKey, String>? formatToHeader;

  /// The TSV schema for an annotation store version.
  final List<Map<String, SchemaValueType>>? schema;

  TsvVersionOptions({
    this.annotationType,
    this.formatToHeader,
    this.schema,
  });

  factory TsvVersionOptions.fromJson(Map<String, dynamic> json) {
    return TsvVersionOptions(
      annotationType: (json['annotationType'] as String?)?.toAnnotationType(),
      formatToHeader: (json['formatToHeader'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k.toFormatToHeaderKey(), e as String)),
      schema: (json['schema'] as List?)
          ?.whereNotNull()
          .map((e) => (e as Map<String, dynamic>)
              .map((k, e) => MapEntry(k, (e as String).toSchemaValueType())))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final annotationType = this.annotationType;
    final formatToHeader = this.formatToHeader;
    final schema = this.schema;
    return {
      if (annotationType != null) 'annotationType': annotationType.toValue(),
      if (formatToHeader != null)
        'formatToHeader':
            formatToHeader.map((k, e) => MapEntry(k.toValue(), e)),
      if (schema != null)
        'schema': schema
            .map((e) => e.map((k, e) => MapEntry(k, e.toValue())))
            .toList(),
    };
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

class UpdateAnnotationStoreResponse {
  /// When the store was created.
  final DateTime creationTime;

  /// The store's description.
  final String description;

  /// The store's ID.
  final String id;

  /// The store's name.
  final String name;

  /// The store's genome reference.
  final ReferenceItem reference;

  /// The store's status.
  final StoreStatus status;

  /// When the store was updated.
  final DateTime updateTime;

  /// The annotation file format of the store.
  final StoreFormat? storeFormat;

  /// Parsing options for the store.
  final StoreOptions? storeOptions;

  UpdateAnnotationStoreResponse({
    required this.creationTime,
    required this.description,
    required this.id,
    required this.name,
    required this.reference,
    required this.status,
    required this.updateTime,
    this.storeFormat,
    this.storeOptions,
  });

  factory UpdateAnnotationStoreResponse.fromJson(Map<String, dynamic> json) {
    return UpdateAnnotationStoreResponse(
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      description: json['description'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      reference:
          ReferenceItem.fromJson(json['reference'] as Map<String, dynamic>),
      status: (json['status'] as String).toStoreStatus(),
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] as Object),
      storeFormat: (json['storeFormat'] as String?)?.toStoreFormat(),
      storeOptions: json['storeOptions'] != null
          ? StoreOptions.fromJson(json['storeOptions'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final description = this.description;
    final id = this.id;
    final name = this.name;
    final reference = this.reference;
    final status = this.status;
    final updateTime = this.updateTime;
    final storeFormat = this.storeFormat;
    final storeOptions = this.storeOptions;
    return {
      'creationTime': iso8601ToJson(creationTime),
      'description': description,
      'id': id,
      'name': name,
      'reference': reference,
      'status': status.toValue(),
      'updateTime': iso8601ToJson(updateTime),
      if (storeFormat != null) 'storeFormat': storeFormat.toValue(),
      if (storeOptions != null) 'storeOptions': storeOptions,
    };
  }
}

class UpdateAnnotationStoreVersionResponse {
  /// The time stamp for when an annotation store version was created.
  final DateTime creationTime;

  /// The description of an annotation store version.
  final String description;

  /// The annotation store version ID.
  final String id;

  /// The name of an annotation store.
  final String name;

  /// The status of an annotation store version.
  final VersionStatus status;

  /// The annotation store ID.
  final String storeId;

  /// The time stamp for when an annotation store version was updated.
  final DateTime updateTime;

  /// The name of an annotation store version.
  final String versionName;

  UpdateAnnotationStoreVersionResponse({
    required this.creationTime,
    required this.description,
    required this.id,
    required this.name,
    required this.status,
    required this.storeId,
    required this.updateTime,
    required this.versionName,
  });

  factory UpdateAnnotationStoreVersionResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateAnnotationStoreVersionResponse(
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      description: json['description'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      status: (json['status'] as String).toVersionStatus(),
      storeId: json['storeId'] as String,
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] as Object),
      versionName: json['versionName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final description = this.description;
    final id = this.id;
    final name = this.name;
    final status = this.status;
    final storeId = this.storeId;
    final updateTime = this.updateTime;
    final versionName = this.versionName;
    return {
      'creationTime': iso8601ToJson(creationTime),
      'description': description,
      'id': id,
      'name': name,
      'status': status.toValue(),
      'storeId': storeId,
      'updateTime': iso8601ToJson(updateTime),
      'versionName': versionName,
    };
  }
}

class UpdateVariantStoreResponse {
  /// When the store was created.
  final DateTime creationTime;

  /// The store's description.
  final String description;

  /// The store's ID.
  final String id;

  /// The store's name.
  final String name;

  /// The store's genome reference.
  final ReferenceItem reference;

  /// The store's status.
  final StoreStatus status;

  /// When the store was updated.
  final DateTime updateTime;

  UpdateVariantStoreResponse({
    required this.creationTime,
    required this.description,
    required this.id,
    required this.name,
    required this.reference,
    required this.status,
    required this.updateTime,
  });

  factory UpdateVariantStoreResponse.fromJson(Map<String, dynamic> json) {
    return UpdateVariantStoreResponse(
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      description: json['description'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      reference:
          ReferenceItem.fromJson(json['reference'] as Map<String, dynamic>),
      status: (json['status'] as String).toStoreStatus(),
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] as Object),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final description = this.description;
    final id = this.id;
    final name = this.name;
    final reference = this.reference;
    final status = this.status;
    final updateTime = this.updateTime;
    return {
      'creationTime': iso8601ToJson(creationTime),
      'description': description,
      'id': id,
      'name': name,
      'reference': reference,
      'status': status.toValue(),
      'updateTime': iso8601ToJson(updateTime),
    };
  }
}

class UploadReadSetPartResponse {
  /// An identifier used to confirm that parts are being added to the intended
  /// upload.
  final String checksum;

  UploadReadSetPartResponse({
    required this.checksum,
  });

  factory UploadReadSetPartResponse.fromJson(Map<String, dynamic> json) {
    return UploadReadSetPartResponse(
      checksum: json['checksum'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final checksum = this.checksum;
    return {
      'checksum': checksum,
    };
  }
}

/// Details about an imported variant item.
class VariantImportItemDetail {
  /// The item's job status.
  final JobStatus jobStatus;

  /// The source file's location in Amazon S3.
  final String source;

  /// A message that provides additional context about a job
  final String? statusMessage;

  VariantImportItemDetail({
    required this.jobStatus,
    required this.source,
    this.statusMessage,
  });

  factory VariantImportItemDetail.fromJson(Map<String, dynamic> json) {
    return VariantImportItemDetail(
      jobStatus: (json['jobStatus'] as String).toJobStatus(),
      source: json['source'] as String,
      statusMessage: json['statusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobStatus = this.jobStatus;
    final source = this.source;
    final statusMessage = this.statusMessage;
    return {
      'jobStatus': jobStatus.toValue(),
      'source': source,
      if (statusMessage != null) 'statusMessage': statusMessage,
    };
  }
}

/// A imported variant item's source.
class VariantImportItemSource {
  /// The source file's location in Amazon S3.
  final String source;

  VariantImportItemSource({
    required this.source,
  });

  Map<String, dynamic> toJson() {
    final source = this.source;
    return {
      'source': source,
    };
  }
}

/// A variant import job.
class VariantImportJobItem {
  /// When the job was created.
  final DateTime creationTime;

  /// The job's destination variant store.
  final String destinationName;

  /// The job's ID.
  final String id;

  /// The job's service role ARN.
  final String roleArn;

  /// The job's status.
  final JobStatus status;

  /// When the job was updated.
  final DateTime updateTime;

  /// The annotation schema generated by the parsed annotation data.
  final Map<String, String>? annotationFields;

  /// When the job completed.
  final DateTime? completionTime;

  /// The job's left normalization setting.
  final bool? runLeftNormalization;

  VariantImportJobItem({
    required this.creationTime,
    required this.destinationName,
    required this.id,
    required this.roleArn,
    required this.status,
    required this.updateTime,
    this.annotationFields,
    this.completionTime,
    this.runLeftNormalization,
  });

  factory VariantImportJobItem.fromJson(Map<String, dynamic> json) {
    return VariantImportJobItem(
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      destinationName: json['destinationName'] as String,
      id: json['id'] as String,
      roleArn: json['roleArn'] as String,
      status: (json['status'] as String).toJobStatus(),
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] as Object),
      annotationFields: (json['annotationFields'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      completionTime: timeStampFromJson(json['completionTime']),
      runLeftNormalization: json['runLeftNormalization'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final destinationName = this.destinationName;
    final id = this.id;
    final roleArn = this.roleArn;
    final status = this.status;
    final updateTime = this.updateTime;
    final annotationFields = this.annotationFields;
    final completionTime = this.completionTime;
    final runLeftNormalization = this.runLeftNormalization;
    return {
      'creationTime': iso8601ToJson(creationTime),
      'destinationName': destinationName,
      'id': id,
      'roleArn': roleArn,
      'status': status.toValue(),
      'updateTime': iso8601ToJson(updateTime),
      if (annotationFields != null) 'annotationFields': annotationFields,
      if (completionTime != null)
        'completionTime': iso8601ToJson(completionTime),
      if (runLeftNormalization != null)
        'runLeftNormalization': runLeftNormalization,
    };
  }
}

/// A variant store.
class VariantStoreItem {
  /// When the store was created.
  final DateTime creationTime;

  /// The store's description.
  final String description;

  /// The store's ID.
  final String id;

  /// The store's name.
  final String name;

  /// The store's genome reference.
  final ReferenceItem reference;

  /// The store's server-side encryption (SSE) settings.
  final SseConfig sseConfig;

  /// The store's status.
  final StoreStatus status;

  /// The store's status message.
  final String statusMessage;

  /// The store's ARN.
  final String storeArn;

  /// The store's size in bytes.
  final int storeSizeBytes;

  /// When the store was updated.
  final DateTime updateTime;

  VariantStoreItem({
    required this.creationTime,
    required this.description,
    required this.id,
    required this.name,
    required this.reference,
    required this.sseConfig,
    required this.status,
    required this.statusMessage,
    required this.storeArn,
    required this.storeSizeBytes,
    required this.updateTime,
  });

  factory VariantStoreItem.fromJson(Map<String, dynamic> json) {
    return VariantStoreItem(
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      description: json['description'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      reference:
          ReferenceItem.fromJson(json['reference'] as Map<String, dynamic>),
      sseConfig: SseConfig.fromJson(json['sseConfig'] as Map<String, dynamic>),
      status: (json['status'] as String).toStoreStatus(),
      statusMessage: json['statusMessage'] as String,
      storeArn: json['storeArn'] as String,
      storeSizeBytes: json['storeSizeBytes'] as int,
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] as Object),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final description = this.description;
    final id = this.id;
    final name = this.name;
    final reference = this.reference;
    final sseConfig = this.sseConfig;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final storeArn = this.storeArn;
    final storeSizeBytes = this.storeSizeBytes;
    final updateTime = this.updateTime;
    return {
      'creationTime': iso8601ToJson(creationTime),
      'description': description,
      'id': id,
      'name': name,
      'reference': reference,
      'sseConfig': sseConfig,
      'status': status.toValue(),
      'statusMessage': statusMessage,
      'storeArn': storeArn,
      'storeSizeBytes': storeSizeBytes,
      'updateTime': iso8601ToJson(updateTime),
    };
  }
}

/// Formatting options for a VCF file.
class VcfOptions {
  /// The file's ignore filter field setting.
  final bool? ignoreFilterField;

  /// The file's ignore qual field setting.
  final bool? ignoreQualField;

  VcfOptions({
    this.ignoreFilterField,
    this.ignoreQualField,
  });

  factory VcfOptions.fromJson(Map<String, dynamic> json) {
    return VcfOptions(
      ignoreFilterField: json['ignoreFilterField'] as bool?,
      ignoreQualField: json['ignoreQualField'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final ignoreFilterField = this.ignoreFilterField;
    final ignoreQualField = this.ignoreQualField;
    return {
      if (ignoreFilterField != null) 'ignoreFilterField': ignoreFilterField,
      if (ignoreQualField != null) 'ignoreQualField': ignoreQualField,
    };
  }
}

/// The error preventing deletion of the annotation store version.
class VersionDeleteError {
  /// The message explaining the error in annotation store deletion.
  final String message;

  /// The name given to an annotation store version.
  final String versionName;

  VersionDeleteError({
    required this.message,
    required this.versionName,
  });

  factory VersionDeleteError.fromJson(Map<String, dynamic> json) {
    return VersionDeleteError(
      message: json['message'] as String,
      versionName: json['versionName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    final versionName = this.versionName;
    return {
      'message': message,
      'versionName': versionName,
    };
  }
}

/// The options for an annotation store version.
class VersionOptions {
  /// File settings for a version of a TSV store.
  final TsvVersionOptions? tsvVersionOptions;

  VersionOptions({
    this.tsvVersionOptions,
  });

  factory VersionOptions.fromJson(Map<String, dynamic> json) {
    return VersionOptions(
      tsvVersionOptions: json['tsvVersionOptions'] != null
          ? TsvVersionOptions.fromJson(
              json['tsvVersionOptions'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final tsvVersionOptions = this.tsvVersionOptions;
    return {
      if (tsvVersionOptions != null) 'tsvVersionOptions': tsvVersionOptions,
    };
  }
}

enum VersionStatus {
  creating,
  updating,
  deleting,
  active,
  failed,
}

extension VersionStatusValueExtension on VersionStatus {
  String toValue() {
    switch (this) {
      case VersionStatus.creating:
        return 'CREATING';
      case VersionStatus.updating:
        return 'UPDATING';
      case VersionStatus.deleting:
        return 'DELETING';
      case VersionStatus.active:
        return 'ACTIVE';
      case VersionStatus.failed:
        return 'FAILED';
    }
  }
}

extension VersionStatusFromString on String {
  VersionStatus toVersionStatus() {
    switch (this) {
      case 'CREATING':
        return VersionStatus.creating;
      case 'UPDATING':
        return VersionStatus.updating;
      case 'DELETING':
        return VersionStatus.deleting;
      case 'ACTIVE':
        return VersionStatus.active;
      case 'FAILED':
        return VersionStatus.failed;
    }
    throw Exception('$this is not known in enum VersionStatus');
  }
}

enum WorkflowEngine {
  wdl,
  nextflow,
  cwl,
}

extension WorkflowEngineValueExtension on WorkflowEngine {
  String toValue() {
    switch (this) {
      case WorkflowEngine.wdl:
        return 'WDL';
      case WorkflowEngine.nextflow:
        return 'NEXTFLOW';
      case WorkflowEngine.cwl:
        return 'CWL';
    }
  }
}

extension WorkflowEngineFromString on String {
  WorkflowEngine toWorkflowEngine() {
    switch (this) {
      case 'WDL':
        return WorkflowEngine.wdl;
      case 'NEXTFLOW':
        return WorkflowEngine.nextflow;
      case 'CWL':
        return WorkflowEngine.cwl;
    }
    throw Exception('$this is not known in enum WorkflowEngine');
  }
}

enum WorkflowExport {
  definition,
}

extension WorkflowExportValueExtension on WorkflowExport {
  String toValue() {
    switch (this) {
      case WorkflowExport.definition:
        return 'DEFINITION';
    }
  }
}

extension WorkflowExportFromString on String {
  WorkflowExport toWorkflowExport() {
    switch (this) {
      case 'DEFINITION':
        return WorkflowExport.definition;
    }
    throw Exception('$this is not known in enum WorkflowExport');
  }
}

/// A workflow.
class WorkflowListItem {
  /// The workflow's ARN.
  final String? arn;

  /// When the workflow was created.
  final DateTime? creationTime;

  /// The workflow's digest.
  final String? digest;

  /// The workflow's ID.
  final String? id;

  /// Any metadata available for workflow. The information listed may vary
  /// depending on the workflow, and there may also be no metadata to return.
  final Map<String, String>? metadata;

  /// The workflow's name.
  final String? name;

  /// The workflow's status.
  final WorkflowStatus? status;

  /// The workflow's type.
  final WorkflowType? type;

  WorkflowListItem({
    this.arn,
    this.creationTime,
    this.digest,
    this.id,
    this.metadata,
    this.name,
    this.status,
    this.type,
  });

  factory WorkflowListItem.fromJson(Map<String, dynamic> json) {
    return WorkflowListItem(
      arn: json['arn'] as String?,
      creationTime: timeStampFromJson(json['creationTime']),
      digest: json['digest'] as String?,
      id: json['id'] as String?,
      metadata: (json['metadata'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      name: json['name'] as String?,
      status: (json['status'] as String?)?.toWorkflowStatus(),
      type: (json['type'] as String?)?.toWorkflowType(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final digest = this.digest;
    final id = this.id;
    final metadata = this.metadata;
    final name = this.name;
    final status = this.status;
    final type = this.type;
    return {
      if (arn != null) 'arn': arn,
      if (creationTime != null) 'creationTime': iso8601ToJson(creationTime),
      if (digest != null) 'digest': digest,
      if (id != null) 'id': id,
      if (metadata != null) 'metadata': metadata,
      if (name != null) 'name': name,
      if (status != null) 'status': status.toValue(),
      if (type != null) 'type': type.toValue(),
    };
  }
}

/// A workflow parameter.
class WorkflowParameter {
  /// The parameter's description.
  final String? description;

  /// Whether the parameter is optional.
  final bool? optional;

  WorkflowParameter({
    this.description,
    this.optional,
  });

  factory WorkflowParameter.fromJson(Map<String, dynamic> json) {
    return WorkflowParameter(
      description: json['description'] as String?,
      optional: json['optional'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final optional = this.optional;
    return {
      if (description != null) 'description': description,
      if (optional != null) 'optional': optional,
    };
  }
}

enum WorkflowStatus {
  creating,
  active,
  updating,
  deleted,
  failed,
  inactive,
}

extension WorkflowStatusValueExtension on WorkflowStatus {
  String toValue() {
    switch (this) {
      case WorkflowStatus.creating:
        return 'CREATING';
      case WorkflowStatus.active:
        return 'ACTIVE';
      case WorkflowStatus.updating:
        return 'UPDATING';
      case WorkflowStatus.deleted:
        return 'DELETED';
      case WorkflowStatus.failed:
        return 'FAILED';
      case WorkflowStatus.inactive:
        return 'INACTIVE';
    }
  }
}

extension WorkflowStatusFromString on String {
  WorkflowStatus toWorkflowStatus() {
    switch (this) {
      case 'CREATING':
        return WorkflowStatus.creating;
      case 'ACTIVE':
        return WorkflowStatus.active;
      case 'UPDATING':
        return WorkflowStatus.updating;
      case 'DELETED':
        return WorkflowStatus.deleted;
      case 'FAILED':
        return WorkflowStatus.failed;
      case 'INACTIVE':
        return WorkflowStatus.inactive;
    }
    throw Exception('$this is not known in enum WorkflowStatus');
  }
}

enum WorkflowType {
  private,
  ready2run,
}

extension WorkflowTypeValueExtension on WorkflowType {
  String toValue() {
    switch (this) {
      case WorkflowType.private:
        return 'PRIVATE';
      case WorkflowType.ready2run:
        return 'READY2RUN';
    }
  }
}

extension WorkflowTypeFromString on String {
  WorkflowType toWorkflowType() {
    switch (this) {
      case 'PRIVATE':
        return WorkflowType.private;
      case 'READY2RUN':
        return WorkflowType.ready2run;
    }
    throw Exception('$this is not known in enum WorkflowType');
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

class NotSupportedOperationException extends _s.GenericAwsException {
  NotSupportedOperationException({String? type, String? message})
      : super(
            type: type,
            code: 'NotSupportedOperationException',
            message: message);
}

class RangeNotSatisfiableException extends _s.GenericAwsException {
  RangeNotSatisfiableException({String? type, String? message})
      : super(
            type: type, code: 'RangeNotSatisfiableException', message: message);
}

class RequestTimeoutException extends _s.GenericAwsException {
  RequestTimeoutException({String? type, String? message})
      : super(type: type, code: 'RequestTimeoutException', message: message);
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
  'NotSupportedOperationException': (type, message) =>
      NotSupportedOperationException(type: type, message: message),
  'RangeNotSatisfiableException': (type, message) =>
      RangeNotSatisfiableException(type: type, message: message),
  'RequestTimeoutException': (type, message) =>
      RequestTimeoutException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
