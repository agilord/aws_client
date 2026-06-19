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

/// Amazon Web Services HealthOmics is a service that helps users such as
/// bioinformaticians, researchers, and scientists to store, query, analyze, and
/// generate insights from genomics and other biological data. It simplifies and
/// accelerates the process of storing and analyzing genomic information for
/// Amazon Web Services.
///
/// For an introduction to the service, see <a
/// href="https://docs.aws.amazon.com/omics/latest/dev/what-is-healthomics.html">What
/// is Amazon Web Services HealthOmics?</a> in the <i>Amazon Web Services
/// HealthOmics User Guide</i>.
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

  /// Deletes an access policy for the specified store.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [NotSupportedOperationException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [s3AccessPointArn] :
  /// The S3 access point ARN that has the access policy.
  Future<void> deleteS3AccessPolicy({
    required String s3AccessPointArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/s3accesspolicy/${Uri.encodeComponent(s3AccessPointArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Retrieves details about an access policy on a given store.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [NotSupportedOperationException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [s3AccessPointArn] :
  /// The S3 access point ARN that has the access policy.
  Future<GetS3AccessPolicyResponse> getS3AccessPolicy({
    required String s3AccessPointArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/s3accesspolicy/${Uri.encodeComponent(s3AccessPointArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetS3AccessPolicyResponse.fromJson(response);
  }

  /// Adds an access policy to the specified store.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [NotSupportedOperationException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [s3AccessPointArn] :
  /// The S3 access point ARN where you want to put the access policy.
  ///
  /// Parameter [s3AccessPolicy] :
  /// The resource policy that controls S3 access to the store.
  Future<PutS3AccessPolicyResponse> putS3AccessPolicy({
    required String s3AccessPointArn,
    required Object s3AccessPolicy,
  }) async {
    final $payload = <String, dynamic>{
      's3AccessPolicy': jsonEncode(s3AccessPolicy),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/s3accesspolicy/${Uri.encodeComponent(s3AccessPointArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return PutS3AccessPolicyResponse.fromJson(response);
  }

  /// <important>
  /// Amazon Web Services HealthOmics variant stores and annotation stores are
  /// no longer open to new customers. Existing customers can continue to use
  /// the service as normal. For more information, see <a
  /// href="https://docs.aws.amazon.com/omics/latest/dev/variant-store-availability-change.html">
  /// Amazon Web Services HealthOmics variant store and annotation store
  /// availability change</a>.
  /// </important>
  /// Starts an annotation import job.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// <important>
  /// Amazon Web Services HealthOmics variant stores and annotation stores are
  /// no longer open to new customers. Existing customers can continue to use
  /// the service as normal. For more information, see <a
  /// href="https://docs.aws.amazon.com/omics/latest/dev/variant-store-availability-change.html">
  /// Amazon Web Services HealthOmics variant store and annotation store
  /// availability change</a>.
  /// </important>
  /// Gets information about an annotation import job.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// <important>
  /// Amazon Web Services HealthOmics variant stores and annotation stores are
  /// no longer open to new customers. Existing customers can continue to use
  /// the service as normal. For more information, see <a
  /// href="https://docs.aws.amazon.com/omics/latest/dev/variant-store-availability-change.html">
  /// Amazon Web Services HealthOmics variant store and annotation store
  /// availability change</a>.
  /// </important>
  /// Cancels an annotation import job.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// <important>
  /// Amazon Web Services HealthOmics variant stores and annotation stores are
  /// no longer open to new customers. Existing customers can continue to use
  /// the service as normal. For more information, see <a
  /// href="https://docs.aws.amazon.com/omics/latest/dev/variant-store-availability-change.html">
  /// Amazon Web Services HealthOmics variant store and annotation store
  /// availability change</a>.
  /// </important>
  /// Retrieves a list of annotation import jobs.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// <important>
  /// Amazon Web Services HealthOmics variant stores and annotation stores are
  /// no longer open to new customers. Existing customers can continue to use
  /// the service as normal. For more information, see <a
  /// href="https://docs.aws.amazon.com/omics/latest/dev/variant-store-availability-change.html">
  /// Amazon Web Services HealthOmics variant store and annotation store
  /// availability change</a>.
  /// </important>
  /// Creates an annotation store.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
      'storeFormat': storeFormat.value,
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

  /// <important>
  /// Amazon Web Services HealthOmics variant stores and annotation stores are
  /// no longer open to new customers. Existing customers can continue to use
  /// the service as normal. For more information, see <a
  /// href="https://docs.aws.amazon.com/omics/latest/dev/variant-store-availability-change.html">
  /// Amazon Web Services HealthOmics variant store and annotation store
  /// availability change</a>.
  /// </important>
  /// Gets information about an annotation store.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// <important>
  /// Amazon Web Services HealthOmics variant stores and annotation stores are
  /// no longer open to new customers. Existing customers can continue to use
  /// the service as normal. For more information, see <a
  /// href="https://docs.aws.amazon.com/omics/latest/dev/variant-store-availability-change.html">
  /// Amazon Web Services HealthOmics variant store and annotation store
  /// availability change</a>.
  /// </important>
  /// Updates an annotation store.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// <important>
  /// Amazon Web Services HealthOmics variant stores and annotation stores are
  /// no longer open to new customers. Existing customers can continue to use
  /// the service as normal. For more information, see <a
  /// href="https://docs.aws.amazon.com/omics/latest/dev/variant-store-availability-change.html">
  /// Amazon Web Services HealthOmics variant store and annotation store
  /// availability change</a>.
  /// </important>
  /// Deletes an annotation store.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// <important>
  /// Amazon Web Services HealthOmics variant stores and annotation stores are
  /// no longer open to new customers. Existing customers can continue to use
  /// the service as normal. For more information, see <a
  /// href="https://docs.aws.amazon.com/omics/latest/dev/variant-store-availability-change.html">
  /// Amazon Web Services HealthOmics variant store and annotation store
  /// availability change</a>.
  /// </important>
  /// Retrieves a list of annotation stores.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Creates a new version of an annotation store.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Retrieves the metadata for an annotation store version.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Updates the description of an annotation store version.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Lists the versions of an annotation store.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Deletes one or multiple versions of an annotation store.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Create a new configuration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// User-friendly name for the configuration.
  ///
  /// Parameter [runConfigurations] :
  /// Required run-specific configurations.
  ///
  /// Parameter [description] :
  /// Optional description for the configuration.
  ///
  /// Parameter [requestId] :
  /// Optional request idempotency token. If not specified, a universally unique
  /// identifier (UUID) will be automatically generated for the request.
  ///
  /// Parameter [tags] :
  /// Optional tags for the configuration.
  Future<CreateConfigurationResponse> createConfiguration({
    required String name,
    required RunConfigurations runConfigurations,
    String? description,
    String? requestId,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      'runConfigurations': runConfigurations,
      if (description != null) 'description': description,
      'requestId': requestId ?? _s.generateIdempotencyToken(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/configuration',
      exceptionFnMap: _exceptionFns,
    );
    return CreateConfigurationResponse.fromJson(response);
  }

  /// Retrieve configuration details for specified name.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// Configuration name to retrieve.
  Future<GetConfigurationResponse> getConfiguration({
    required String name,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/configuration/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetConfigurationResponse.fromJson(response);
  }

  /// Delete an existing configuration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// Configuration name to delete.
  Future<void> deleteConfiguration({
    required String name,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/configuration/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// List all configurations for the account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to return.
  ///
  /// Parameter [startingToken] :
  /// Pagination token for retrieving next page of results.
  Future<ListConfigurationsResponse> listConfigurations({
    int? maxResults,
    String? startingToken,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (startingToken != null) 'startingToken': [startingToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/configuration',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListConfigurationsResponse.fromJson(response);
  }

  /// Creates a reference store and returns metadata in JSON format. Reference
  /// stores are used to store reference genomes in FASTA format. A reference
  /// store is created when the first reference genome is imported. To import
  /// additional reference genomes from an Amazon S3 bucket, use the
  /// <code>StartReferenceImportJob</code> API operation.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/omics/latest/dev/create-reference-store.html">Creating
  /// a HealthOmics reference store</a> in the <i>Amazon Web Services
  /// HealthOmics User Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Gets information about a reference store.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Deletes a reference store and returns a response with no body if the
  /// operation is successful. You can only delete a reference store when it
  /// does not contain any reference genomes. To empty a reference store, use
  /// <code>DeleteReference</code>.
  ///
  /// For more information about your workflow status, see <a
  /// href="https://docs.aws.amazon.com/omics/latest/dev/deleting-reference-and-sequence-stores.html">Deleting
  /// HealthOmics reference and sequence stores</a> in the <i>Amazon Web
  /// Services HealthOmics User Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Retrieves a list of reference stores linked to your account and returns
  /// their metadata in JSON format.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/omics/latest/dev/create-reference-store.html">Creating
  /// a reference store</a> in the <i>Amazon Web Services HealthOmics User
  /// Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Monitors the status of a reference import job. This operation can be
  /// called after calling the <code>StartReferenceImportJob</code> operation.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Retrieves the metadata of one or more reference import jobs for a
  /// reference store.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Imports a reference genome from Amazon S3 into a specified reference
  /// store. You can have multiple reference genomes in a reference store. You
  /// can only import reference genomes one at a time into each reference store.
  /// Monitor the status of your reference import job by using the
  /// <code>GetReferenceImportJob</code> API operation.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Retrieves metadata for a reference genome. This operation returns the
  /// number of parts, part size, and MD5 of an entire file. This operation does
  /// not return tags. To retrieve the list of tags for a read set, use the
  /// <code>ListTagsForResource</code> API operation.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Deletes a reference genome and returns a response with no body if the
  /// operation is successful. The read set associated with the reference genome
  /// must first be deleted before deleting the reference genome. After the
  /// reference genome is deleted, you can delete the reference store using the
  /// <code>DeleteReferenceStore</code> API operation.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/omics/latest/dev/deleting-reference-and-sequence-stores.html">Deleting
  /// HealthOmics reference and sequence stores</a> in the <i>Amazon Web
  /// Services HealthOmics User Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Retrieves the metadata of one or more reference genomes in a reference
  /// store.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/omics/latest/dev/create-reference-store.html">Creating
  /// a reference store</a> in the <i>Amazon Web Services HealthOmics User
  /// Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Downloads parts of data from a reference genome and returns the reference
  /// file in the same format that it was uploaded.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/omics/latest/dev/create-reference-store.html">Creating
  /// a HealthOmics reference store</a> in the <i>Amazon Web Services
  /// HealthOmics User Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [RangeNotSatisfiableException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
    final headers = <String, String>{
      if (range != null) 'Range': range.toString(),
    };
    final $query = <String, List<String>>{
      'partNumber': [partNumber.toString()],
      if (file != null) 'file': [file.value],
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

  /// Starts a batch of workflow runs. You can group up to 100,000 runs into a
  /// single batch that share a common configuration defined in
  /// <code>defaultRunSetting</code>. Per-run overrides can be provided either
  /// inline via <code>inlineSettings</code> (up to 100 runs) or via a JSON file
  /// stored in Amazon S3 via <code>s3UriSettings</code> (up to 100,000 runs).
  ///
  /// <code>StartRunBatch</code> validates common fields synchronously and
  /// returns immediately with a batch ID and status <code>CREATING</code>. The
  /// batch transitions to <code>PENDING</code> once initial setup completes.
  /// Runs are then submitted gradually and asynchronously at a rate governed by
  /// your <code>StartRun</code> throughput quota.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [batchRunSettings] :
  /// The individual run configurations. Specify exactly one of
  /// <code>inlineSettings</code> or <code>s3UriSettings</code>. See
  /// <code>BatchRunSettings</code>.
  ///
  /// Parameter [defaultRunSetting] :
  /// Shared configuration applied to all runs in the batch. See
  /// <code>DefaultRunSetting</code>.
  ///
  /// Parameter [batchName] :
  /// An optional user-friendly name for the run batch.
  ///
  /// Parameter [requestId] :
  /// A client token used to deduplicate retry requests and prevent duplicate
  /// batches from being created.
  ///
  /// Parameter [tags] :
  /// AWS tags to associate with the batch resource. These tags are not
  /// inherited by individual runs. To tag individual runs, use
  /// <code>defaultRunSetting.runTags</code>.
  Future<StartRunBatchResponse> startRunBatch({
    required BatchRunSettings batchRunSettings,
    required DefaultRunSetting defaultRunSetting,
    String? batchName,
    String? requestId,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'batchRunSettings': batchRunSettings,
      'defaultRunSetting': defaultRunSetting,
      if (batchName != null) 'batchName': batchName,
      'requestId': requestId ?? _s.generateIdempotencyToken(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/runBatch',
      exceptionFnMap: _exceptionFns,
    );
    return StartRunBatchResponse.fromJson(response);
  }

  /// Retrieves details and current status for a specific run batch, including
  /// submission progress and run execution counts.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [batchId] :
  /// The identifier portion of the run batch ARN.
  Future<GetBatchResponse> getBatch({
    required String batchId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/runBatch/${Uri.encodeComponent(batchId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetBatchResponse.fromJson(response);
  }

  /// Deletes a run batch resource and its associated metadata. This operation
  /// does not delete the individual workflow runs. To delete the runs, call
  /// <code>DeleteRunBatch</code> before calling <code>DeleteBatch</code>.
  ///
  /// <code>DeleteBatch</code> requires the batch to be in a terminal state:
  /// <code>PROCESSED</code>, <code>FAILED</code>, <code>CANCELLED</code>, or
  /// <code>RUNS_DELETED</code>. After <code>DeleteBatch</code> completes, the
  /// batch metadata is no longer accessible. You cannot call
  /// <code>GetBatch</code>, <code>ListRunsInBatch</code>,
  /// <code>DeleteRunBatch</code>, or <code>CancelRunBatch</code> on a deleted
  /// batch.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [batchId] :
  /// The identifier portion of the run batch ARN.
  Future<void> deleteBatch({
    required String batchId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/runBatch/${Uri.encodeComponent(batchId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns a list of run batches in your account, with optional filtering by
  /// status, name, or run group. Results are paginated. Only one filter per
  /// call is supported.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxItems] :
  /// The maximum number of batches to return. If not specified, defaults to
  /// 100.
  ///
  /// Parameter [name] :
  /// Filter batches by name.
  ///
  /// Parameter [runGroupId] :
  /// Filter batches by run group ID.
  ///
  /// Parameter [startingToken] :
  /// A pagination token returned from a prior <code>ListBatch</code> call.
  ///
  /// Parameter [status] :
  /// Filter batches by status.
  Future<ListBatchResponse> listBatch({
    int? maxItems,
    String? name,
    String? runGroupId,
    String? startingToken,
    BatchStatus? status,
  }) async {
    final $query = <String, List<String>>{
      if (maxItems != null) 'maxItems': [maxItems.toString()],
      if (name != null) 'name': [name],
      if (runGroupId != null) 'runGroupId': [runGroupId],
      if (startingToken != null) 'startingToken': [startingToken],
      if (status != null) 'status': [status.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/runBatch',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListBatchResponse.fromJson(response);
  }

  /// Cancels all runs within a specified batch. This operation prevents
  /// not-yet-submitted runs from starting and submits <code>CancelRun</code>
  /// requests for runs that have already started.
  ///
  /// Cancel is only allowed on batches in <code>PENDING</code>,
  /// <code>SUBMITTING</code>, or <code>INPROGRESS</code> state. Cancel
  /// operations are non-atomic and may be partially successful. Use
  /// <code>GetBatch</code> to review
  /// <code>successfulCancelSubmissionCount</code> and
  /// <code>failedCancelSubmissionCount</code> in the
  /// <code>submissionSummary</code>. Only one cancel or delete operation per
  /// batch is allowed at a time.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [batchId] :
  /// The identifier portion of the run batch ARN.
  Future<void> cancelRunBatch({
    required String batchId,
  }) async {
    final $payload = <String, dynamic>{
      'batchId': batchId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/runBatch/cancel',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the individual workflow runs within a batch. This operation is
  /// separate from <code>DeleteBatch</code>, which removes the batch metadata.
  ///
  /// Delete is only allowed on batches in <code>PROCESSED</code> or
  /// <code>CANCELLED</code> state. Delete operations are non-atomic and may be
  /// partially successful. Use <code>GetBatch</code> to review
  /// <code>successfulDeleteSubmissionCount</code> and
  /// <code>failedDeleteSubmissionCount</code> in the
  /// <code>submissionSummary</code>. Only one cancel or delete operation per
  /// batch is allowed at a time.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [batchId] :
  /// The identifier portion of the run batch ARN.
  Future<void> deleteRunBatch({
    required String batchId,
  }) async {
    final $payload = <String, dynamic>{
      'batchId': batchId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/runBatch/delete',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns a paginated list of individual workflow runs within a specific
  /// batch. Use this operation to map each <code>runSettingId</code> to its
  /// HealthOmics-generated <code>runId</code>, and to check the submission
  /// status of each run. Only one filter per call is supported.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [batchId] :
  /// The identifier portion of the run batch ARN.
  ///
  /// Parameter [maxItems] :
  /// The maximum number of runs to return.
  ///
  /// Parameter [runId] :
  /// Filter runs by the HealthOmics-generated run ID.
  ///
  /// Parameter [runSettingId] :
  /// Filter runs by the customer-provided run setting ID.
  ///
  /// Parameter [startingToken] :
  /// A pagination token returned from a prior <code>ListRunsInBatch</code>
  /// call.
  ///
  /// Parameter [submissionStatus] :
  /// Filter runs by submission status.
  Future<ListRunsInBatchResponse> listRunsInBatch({
    required String batchId,
    int? maxItems,
    String? runId,
    String? runSettingId,
    String? startingToken,
    SubmissionStatus? submissionStatus,
  }) async {
    final $query = <String, List<String>>{
      if (maxItems != null) 'maxItems': [maxItems.toString()],
      if (runId != null) 'runId': [runId],
      if (runSettingId != null) 'runSettingId': [runSettingId],
      if (startingToken != null) 'startingToken': [startingToken],
      if (submissionStatus != null)
        'submissionStatus': [submissionStatus.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/runBatch/${Uri.encodeComponent(batchId)}/run',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListRunsInBatchResponse.fromJson(response);
  }

  /// Creates a run cache to store and reference task outputs from completed
  /// private runs. Specify an Amazon S3 location where Amazon Web Services
  /// HealthOmics saves the cached data. This data must be immediately
  /// accessible and not in an archived state. You can save intermediate task
  /// files to a run cache if they are declared as task outputs in the workflow
  /// definition file.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/omics/latest/dev/workflows-call-caching.html">Call
  /// caching</a> and <a
  /// href="https://docs.aws.amazon.com/omics/latest/dev/workflow-cache-create.html">Creating
  /// a run cache</a> in the <i>Amazon Web Services HealthOmics User Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [cacheS3Location] :
  /// Specify the S3 location for storing the cached task outputs. This data
  /// must be immediately accessible (not in an archived state).
  ///
  /// Parameter [cacheBehavior] :
  /// Default cache behavior for runs that use this cache. Supported values are:
  ///
  /// <code>CACHE_ON_FAILURE</code>: Caches task outputs from completed tasks
  /// for runs that fail. This setting is useful if you're debugging a workflow
  /// that fails after several tasks completed successfully. The subsequent run
  /// uses the cache outputs for previously-completed tasks if the task
  /// definition, inputs, and container in ECR are identical to the prior run.
  ///
  /// <code>CACHE_ALWAYS</code>: Caches task outputs from completed tasks for
  /// all runs. This setting is useful in development mode, but do not use it in
  /// a production setting.
  ///
  /// If you don't specify a value, the default behavior is CACHE_ON_FAILURE.
  /// When you start a run that uses this cache, you can override the default
  /// cache behavior.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/omics/latest/dev/how-run-cache.html#run-cache-behavior">Run
  /// cache behavior</a> in the <i>Amazon Web Services HealthOmics User
  /// Guide</i>.
  ///
  /// Parameter [cacheBucketOwnerId] :
  /// The Amazon Web Services account ID of the expected owner of the S3 bucket
  /// for the run cache. If not provided, your account ID is set as the owner of
  /// the bucket.
  ///
  /// Parameter [description] :
  /// Enter a description of the run cache.
  ///
  /// Parameter [name] :
  /// Enter a user-friendly name for the run cache.
  ///
  /// Parameter [requestId] :
  /// A unique request token, to ensure idempotency. If you don't specify a
  /// token, Amazon Web Services HealthOmics automatically generates a
  /// universally unique identifier (UUID) for the request.
  ///
  /// Parameter [tags] :
  /// Specify one or more tags to associate with this run cache.
  Future<CreateRunCacheResponse> createRunCache({
    required String cacheS3Location,
    CacheBehavior? cacheBehavior,
    String? cacheBucketOwnerId,
    String? description,
    String? name,
    String? requestId,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'cacheS3Location': cacheS3Location,
      if (cacheBehavior != null) 'cacheBehavior': cacheBehavior.value,
      if (cacheBucketOwnerId != null) 'cacheBucketOwnerId': cacheBucketOwnerId,
      if (description != null) 'description': description,
      if (name != null) 'name': name,
      'requestId': requestId ?? _s.generateIdempotencyToken(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/runCache',
      exceptionFnMap: _exceptionFns,
    );
    return CreateRunCacheResponse.fromJson(response);
  }

  /// Retrieves detailed information about the specified run cache using its ID.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/omics/latest/dev/workflows-call-caching.html">Call
  /// caching for Amazon Web Services HealthOmics runs</a> in the <i>Amazon Web
  /// Services HealthOmics User Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [id] :
  /// The identifier of the run cache to retrieve.
  Future<GetRunCacheResponse> getRunCache({
    required String id,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/runCache/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetRunCacheResponse.fromJson(response);
  }

  /// Updates a run cache using its ID and returns a response with no body if
  /// the operation is successful. You can update the run cache description,
  /// name, or the default run cache behavior with <code>CACHE_ON_FAILURE</code>
  /// or <code>CACHE_ALWAYS</code>. To confirm that your run cache settings have
  /// been properly updated, use the <code>GetRunCache</code> API operation.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/omics/latest/dev/how-run-cache.html">How
  /// call caching works</a> in the <i>Amazon Web Services HealthOmics User
  /// Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [id] :
  /// The identifier of the run cache you want to update.
  ///
  /// Parameter [cacheBehavior] :
  /// Update the default run cache behavior.
  ///
  /// Parameter [description] :
  /// Update the run cache description.
  ///
  /// Parameter [name] :
  /// Update the name of the run cache.
  Future<void> updateRunCache({
    required String id,
    CacheBehavior? cacheBehavior,
    String? description,
    String? name,
  }) async {
    final $payload = <String, dynamic>{
      if (cacheBehavior != null) 'cacheBehavior': cacheBehavior.value,
      if (description != null) 'description': description,
      if (name != null) 'name': name,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/runCache/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a run cache and returns a response with no body if the operation
  /// is successful. This action removes the cache metadata stored in the
  /// service account, but does not delete the data in Amazon S3. You can access
  /// the cache data in Amazon S3, for inspection or to troubleshoot issues. You
  /// can remove old cache data using standard S3 <code>Delete</code>
  /// operations.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/omics/latest/dev/workflow-cache-delete.html">Deleting
  /// a run cache</a> in the <i>Amazon Web Services HealthOmics User Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [id] :
  /// Run cache identifier for the cache you want to delete.
  Future<void> deleteRunCache({
    required String id,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/runCache/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Retrieves a list of your run caches and the metadata for each cache.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [startingToken] :
  /// Optional pagination token returned from a prior call to the
  /// <code>ListRunCaches</code> API operation.
  Future<ListRunCachesResponse> listRunCaches({
    int? maxResults,
    String? startingToken,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (startingToken != null) 'startingToken': [startingToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/runCache',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListRunCachesResponse.fromJson(response);
  }

  /// Creates a run group to limit the compute resources for the runs that are
  /// added to the group. Returns an ARN, ID, and tags for the run group.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxCpus] :
  /// The maximum number of CPUs that can run concurrently across all active
  /// runs in the run group.
  ///
  /// Parameter [maxDuration] :
  /// The maximum time for each run (in minutes). If a run exceeds the maximum
  /// run time, the run fails automatically.
  ///
  /// Parameter [maxGpus] :
  /// The maximum number of GPUs that can run concurrently across all active
  /// runs in the run group.
  ///
  /// Parameter [maxRuns] :
  /// The maximum number of runs that can be running at the same time.
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

  /// Gets information about a run group and returns its metadata.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Updates the settings of a run group and returns a response with no body if
  /// the operation is successful.
  ///
  /// You can update the following settings with <code>UpdateRunGroup</code>:
  ///
  /// <ul>
  /// <li>
  /// Maximum number of CPUs
  /// </li>
  /// <li>
  /// Run time (measured in minutes)
  /// </li>
  /// <li>
  /// Number of GPUs
  /// </li>
  /// <li>
  /// Number of concurrent runs
  /// </li>
  /// <li>
  /// Group name
  /// </li>
  /// </ul>
  /// To confirm that the settings have been successfully updated, use the
  /// <code>ListRunGroups</code> or <code>GetRunGroup</code> API operations to
  /// verify that the desired changes have been made.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Deletes a run group and returns a response with no body if the operation
  /// is successful.
  ///
  /// To verify that the run group is deleted:
  ///
  /// <ul>
  /// <li>
  /// Use <code>ListRunGroups</code> to confirm the workflow no longer appears
  /// in the list.
  /// </li>
  /// <li>
  /// Use <code>GetRunGroup</code> to verify the workflow cannot be found.
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Retrieves a list of all run groups and returns the metadata for each run
  /// group.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Starts a new run and returns details about the run, or duplicates an
  /// existing run. A run is a single invocation of a workflow. If you provide
  /// request IDs, Amazon Web Services HealthOmics identifies duplicate requests
  /// and starts the run only once. Monitor the progress of the run by calling
  /// the <code>GetRun</code> API operation.
  ///
  /// To start a new run, the following inputs are required:
  ///
  /// <ul>
  /// <li>
  /// A service role ARN (<code>roleArn</code>).
  /// </li>
  /// <li>
  /// The run's workflow ID (<code>workflowId</code>, not the <code>uuid</code>
  /// or <code>runId</code>).
  /// </li>
  /// <li>
  /// An Amazon S3 location (<code>outputUri</code>) where the run outputs will
  /// be saved.
  /// </li>
  /// <li>
  /// All required workflow parameters (<code>parameter</code>), which can
  /// include optional parameters from the parameter template. The run cannot
  /// include any parameters that are not defined in the parameter template. To
  /// see all possible parameters, use the <code>GetRun</code> API operation.
  /// </li>
  /// <li>
  /// For runs with a <code>STATIC</code> (default) storage type, specify the
  /// required storage capacity (in gibibytes). A storage capacity value is not
  /// required for runs that use <code>DYNAMIC</code> storage.
  /// </li>
  /// </ul>
  /// <code>StartRun</code> can also duplicate an existing run using the run's
  /// default values. You can modify these default values and/or add other
  /// optional inputs. To duplicate a run, the following inputs are required:
  ///
  /// <ul>
  /// <li>
  /// A service role ARN (<code>roleArn</code>).
  /// </li>
  /// <li>
  /// The ID of the run to duplicate (<code>runId</code>).
  /// </li>
  /// <li>
  /// An Amazon S3 location where the run outputs will be saved
  /// (<code>outputUri</code>).
  /// </li>
  /// </ul>
  /// To learn more about the optional parameters for <code>StartRun</code>, see
  /// <a
  /// href="https://docs.aws.amazon.com/omics/latest/dev/starting-a-run.html">Starting
  /// a run</a> in the <i>Amazon Web Services HealthOmics User Guide</i>.
  ///
  /// Use the <code>retentionMode</code> input to control how long the metadata
  /// for each run is stored in CloudWatch. There are two retention modes:
  ///
  /// <ul>
  /// <li>
  /// Specify <code>REMOVE</code> to automatically remove the oldest runs when
  /// you reach the maximum service retention limit for runs. It is recommended
  /// that you use the <code>REMOVE</code> mode to initiate major run requests
  /// so that your runs do not fail when you reach the limit.
  /// </li>
  /// <li>
  /// The <code>retentionMode</code> is set to the <code>RETAIN</code> mode by
  /// default, which allows you to manually remove runs after reaching the
  /// maximum service retention limit. Under this setting, you cannot create
  /// additional runs until you remove the excess runs.
  /// </li>
  /// </ul>
  /// To learn more about the retention modes, see <a
  /// href="https://docs.aws.amazon.com/omics/latest/dev/run-retention.html">Run
  /// retention mode</a> in the <i>Amazon Web Services HealthOmics User
  /// Guide</i>.
  ///
  /// You can use Amazon Q CLI to analyze run logs and make performance
  /// optimization recommendations. To get started, see the <a
  /// href="https://github.com/awslabs/mcp/tree/main/src/aws-healthomics-mcp-server">Amazon
  /// Web Services HealthOmics MCP server</a> on GitHub.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [outputUri] :
  /// An output S3 URI for the run. The S3 bucket must be in the same region as
  /// the workflow. The role ARN must have permission to write to this S3
  /// bucket.
  ///
  /// Parameter [roleArn] :
  /// A service role for the run. The <code>roleArn</code> requires access to
  /// Amazon Web Services HealthOmics, S3, Cloudwatch logs, and EC2. An example
  /// <code>roleArn</code> is
  /// <code>arn:aws:iam::123456789012:role/omics-service-role-serviceRole-W8O1XMPL7QZ</code>.
  /// In this example, the AWS account ID is <code>123456789012</code> and the
  /// role name is <code>omics-service-role-serviceRole-W8O1XMPL7QZ</code>.
  ///
  /// Parameter [cacheBehavior] :
  /// The cache behavior for the run. You specify this value if you want to
  /// override the default behavior for the cache. You had set the default value
  /// when you created the cache. For more information, see <a
  /// href="https://docs.aws.amazon.com/omics/latest/dev/how-run-cache.html#run-cache-behavior">Run
  /// cache behavior</a> in the <i>Amazon Web Services HealthOmics User
  /// Guide</i>.
  ///
  /// Parameter [cacheId] :
  /// Identifier of the cache associated with this run. If you don't specify a
  /// cache ID, no task outputs are cached for this run.
  ///
  /// Parameter [configurationName] :
  /// Optional configuration name to use for the workflow run.
  ///
  /// Parameter [engineSettings] :
  /// Engine-specific settings for the workflow run. Use this field to specify
  /// configuration options that are specific to the workflow engine (for
  /// example, Nextflow profiles).
  ///
  /// Parameter [logLevel] :
  /// A log level for the run.
  ///
  /// Parameter [name] :
  /// A name for the run. This is recommended to view and organize runs in the
  /// Amazon Web Services HealthOmics console and CloudWatch logs.
  ///
  /// Parameter [networkingMode] :
  /// Optional configuration for run networking behavior. If not specified, this
  /// will default to RESTRICTED.
  ///
  /// Parameter [parameters] :
  /// Parameters for the run. The run needs all required parameters and can
  /// include optional parameters. The run cannot include any parameters that
  /// are not defined in the parameter template. To retrieve parameters from the
  /// run, use the GetRun API operation.
  ///
  /// Parameter [priority] :
  /// Use the run priority (highest: 1) to establish the order of runs in a run
  /// group when you start a run. If multiple runs share the same priority, the
  /// run that was initiated first will have the higher priority. Runs that do
  /// not belong to a run group can be assigned a priority. The priorities of
  /// these runs are ranked among other runs that are not in a run group. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/omics/latest/dev/creating-run-groups.html#run-priority">Run
  /// priority</a> in the <i>Amazon Web Services HealthOmics User Guide</i>.
  ///
  /// Parameter [requestId] :
  /// An idempotency token used to dedupe retry requests so that duplicate runs
  /// are not created.
  ///
  /// Parameter [retentionMode] :
  /// The retention mode for the run. The default value is <code>RETAIN</code>.
  ///
  /// Amazon Web Services HealthOmics stores a fixed number of runs that are
  /// available to the console and API. In the default mode
  /// (<code>RETAIN</code>), you need to remove runs manually when the number of
  /// run exceeds the maximum. If you set the retention mode to
  /// <code>REMOVE</code>, Amazon Web Services HealthOmics automatically removes
  /// runs (that have mode set to <code>REMOVE</code>) when the number of run
  /// exceeds the maximum. All run logs are available in CloudWatch logs, if you
  /// need information about a run that is no longer available to the API.
  ///
  /// For more information about retention mode, see <a
  /// href="https://docs.aws.amazon.com/omics/latest/dev/starting-a-run.html">Specifying
  /// run retention mode</a> in the <i>Amazon Web Services HealthOmics User
  /// Guide</i>.
  ///
  /// Parameter [runGroupId] :
  /// The run's group ID. Use a run group to cap the compute resources (and
  /// number of concurrent runs) for the runs that you add to the run group.
  ///
  /// Parameter [runId] :
  /// The ID of a run to duplicate.
  ///
  /// Parameter [storageCapacity] :
  /// The <code>STATIC</code> storage capacity (in gibibytes, GiB) for this run.
  /// The default run storage capacity is 1200 GiB. If your requested storage
  /// capacity is unavailable, the system rounds up the value to the nearest
  /// 1200 GiB multiple. If the requested storage capacity is still unavailable,
  /// the system rounds up the value to the nearest 2400 GiB multiple. This
  /// field is not required if the storage type is <code>DYNAMIC</code> (the
  /// system ignores any value that you enter).
  ///
  /// Parameter [storageType] :
  /// The storage type for the run. If you set the storage type to
  /// <code>DYNAMIC</code>, Amazon Web Services HealthOmics dynamically scales
  /// the storage up or down, based on file system utilization. By default, the
  /// run uses <code>STATIC</code> storage type, which allocates a fixed amount
  /// of storage. For more information about <code>DYNAMIC</code> and
  /// <code>STATIC</code> storage, see <a
  /// href="https://docs.aws.amazon.com/omics/latest/dev/workflows-run-types.html">Run
  /// storage types</a> in the <i>Amazon Web Services HealthOmics User
  /// Guide</i>.
  ///
  /// Parameter [tags] :
  /// Tags for the run. You can add up to 50 tags per run. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/omics/latest/dev/add-a-tag.html">Adding
  /// a tag</a> in the <i>Amazon Web Services HealthOmics User Guide</i>.
  ///
  /// Parameter [workflowId] :
  /// The run's workflow ID. The <code>workflowId</code> is not the UUID.
  ///
  /// Parameter [workflowOwnerId] :
  /// The 12-digit account ID of the workflow owner that is used for running a
  /// shared workflow. The workflow owner ID can be retrieved using the
  /// <code>GetShare</code> API operation. If you are the workflow owner, you do
  /// not need to include this ID.
  ///
  /// Parameter [workflowType] :
  /// The run's workflow type. The <code>workflowType</code> must be specified
  /// if you are running a <code>READY2RUN</code> workflow. If you are running a
  /// <code>PRIVATE</code> workflow (default), you do not need to include the
  /// workflow type.
  ///
  /// Parameter [workflowVersionName] :
  /// The name of the workflow version. Use workflow versions to track and
  /// organize changes to the workflow. If your workflow has multiple versions,
  /// the run uses the default version unless you specify a version name. To
  /// learn more, see <a
  /// href="https://docs.aws.amazon.com/omics/latest/dev/workflow-versions.html">Workflow
  /// versioning</a> in the <i>Amazon Web Services HealthOmics User Guide</i>.
  Future<StartRunResponse> startRun({
    required String outputUri,
    required String roleArn,
    CacheBehavior? cacheBehavior,
    String? cacheId,
    String? configurationName,
    Object? engineSettings,
    RunLogLevel? logLevel,
    String? name,
    NetworkingMode? networkingMode,
    Object? parameters,
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
    String? workflowVersionName,
  }) async {
    final $payload = <String, dynamic>{
      'outputUri': outputUri,
      'roleArn': roleArn,
      if (cacheBehavior != null) 'cacheBehavior': cacheBehavior.value,
      if (cacheId != null) 'cacheId': cacheId,
      if (configurationName != null) 'configurationName': configurationName,
      if (engineSettings != null) 'engineSettings': engineSettings,
      if (logLevel != null) 'logLevel': logLevel.value,
      if (name != null) 'name': name,
      if (networkingMode != null) 'networkingMode': networkingMode.value,
      if (parameters != null) 'parameters': parameters,
      if (priority != null) 'priority': priority,
      'requestId': requestId ?? _s.generateIdempotencyToken(),
      if (retentionMode != null) 'retentionMode': retentionMode.value,
      if (runGroupId != null) 'runGroupId': runGroupId,
      if (runId != null) 'runId': runId,
      if (storageCapacity != null) 'storageCapacity': storageCapacity,
      if (storageType != null) 'storageType': storageType.value,
      if (tags != null) 'tags': tags,
      if (workflowId != null) 'workflowId': workflowId,
      if (workflowOwnerId != null) 'workflowOwnerId': workflowOwnerId,
      if (workflowType != null) 'workflowType': workflowType.value,
      if (workflowVersionName != null)
        'workflowVersionName': workflowVersionName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/run',
      exceptionFnMap: _exceptionFns,
    );
    return StartRunResponse.fromJson(response);
  }

  /// Gets detailed information about a specific run using its ID.
  ///
  /// Amazon Web Services HealthOmics stores a configurable number of runs, as
  /// determined by service limits, that are available to the console and API.
  /// If <code>GetRun</code> does not return the requested run, you can find all
  /// run logs in the CloudWatch logs. For more information about viewing the
  /// run logs, see <a
  /// href="https://docs.aws.amazon.com/omics/latest/dev/monitoring-cloudwatch-logs.html">CloudWatch
  /// logs</a> in the <i>Amazon Web Services HealthOmics User Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
      if (export != null) 'export': export.map((e) => e.value).toList(),
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

  /// Deletes a run and returns a response with no body if the operation is
  /// successful. You can only delete a run that has reached a
  /// <code>COMPLETED</code>, <code>FAILED</code>, or <code>CANCELLED</code>
  /// stage. A completed run has delivered an output, or was cancelled and
  /// resulted in no output. When you delete a run, only the metadata associated
  /// with the run is deleted. The run outputs remain in Amazon S3 and logs
  /// remain in CloudWatch.
  ///
  /// To verify that the workflow is deleted:
  ///
  /// <ul>
  /// <li>
  /// Use <code>ListRuns</code> to confirm the workflow no longer appears in the
  /// list.
  /// </li>
  /// <li>
  /// Use <code>GetRun</code> to verify the workflow cannot be found.
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Retrieves a list of runs and returns each run's metadata and status.
  ///
  /// Amazon Web Services HealthOmics stores a configurable number of runs, as
  /// determined by service limits, that are available to the console and API.
  /// If the <code>ListRuns</code> response doesn't include specific runs that
  /// you expected, you can find all run logs in the CloudWatch logs. For more
  /// information about viewing the run logs, see <a
  /// href="https://docs.aws.amazon.com/omics/latest/dev/monitoring-cloudwatch-logs.html">CloudWatch
  /// logs</a> in the <i>Amazon Web Services HealthOmics User Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [batchId] :
  /// Filter by batch ID.
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
    String? batchId,
    int? maxResults,
    String? name,
    String? runGroupId,
    String? startingToken,
    RunStatus? status,
  }) async {
    final $query = <String, List<String>>{
      if (batchId != null) 'batchId': [batchId],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (name != null) 'name': [name],
      if (runGroupId != null) 'runGroupId': [runGroupId],
      if (startingToken != null) 'startingToken': [startingToken],
      if (status != null) 'status': [status.value],
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

  /// Cancels a run using its ID and returns a response with no body if the
  /// operation is successful. To confirm that the run has been cancelled, use
  /// the <code>ListRuns</code> API operation to check that it is no longer
  /// listed.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Gets detailed information about a run task using its ID.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Returns a list of tasks and status information within their specified run.
  /// Use this operation to monitor runs and to identify which specific tasks
  /// have failed.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (startingToken != null) 'startingToken': [startingToken],
      if (status != null) 'status': [status.value],
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

  /// Creates a sequence store and returns its metadata. Sequence stores are
  /// used to store sequence data files called read sets that are saved in
  /// FASTQ, BAM, uBAM, or CRAM formats. For aligned formats (BAM and CRAM), a
  /// sequence store can only use one reference genome. For unaligned formats
  /// (FASTQ and uBAM), a reference genome is not required. You can create
  /// multiple sequence stores per region per account.
  ///
  /// The following are optional parameters you can specify for your sequence
  /// store:
  ///
  /// <ul>
  /// <li>
  /// Use <code>s3AccessConfig</code> to configure your sequence store with S3
  /// access logs (recommended).
  /// </li>
  /// <li>
  /// Use <code>sseConfig</code> to define your own KMS key for encryption.
  /// </li>
  /// <li>
  /// Use <code>eTagAlgorithmFamily</code> to define which algorithm to use for
  /// the HealthOmics eTag on objects.
  /// </li>
  /// <li>
  /// Use <code>fallbackLocation</code> to define a backup location for storing
  /// files that have failed a direct upload.
  /// </li>
  /// <li>
  /// Use <code>propagatedSetLevelTags</code> to configure tags that propagate
  /// to all objects in your store.
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/omics/latest/dev/create-sequence-store.html">Creating
  /// a HealthOmics sequence store</a> in the <i>Amazon Web Services HealthOmics
  /// User Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// A name for the store.
  ///
  /// Parameter [clientToken] :
  /// An idempotency token used to dedupe retry requests so that duplicate runs
  /// are not created.
  ///
  /// Parameter [description] :
  /// A description for the store.
  ///
  /// Parameter [eTagAlgorithmFamily] :
  /// The ETag algorithm family to use for ingested read sets. The default value
  /// is MD5up. For more information on ETags, see <a
  /// href="https://docs.aws.amazon.com/omics/latest/dev/etags-and-provenance.html">ETags
  /// and data provenance</a> in the <i>Amazon Web Services HealthOmics User
  /// Guide</i>.
  ///
  /// Parameter [fallbackLocation] :
  /// An S3 location that is used to store files that have failed a direct
  /// upload. You can add or change the <code>fallbackLocation</code> after
  /// creating a sequence store. This is not required if you are uploading files
  /// from a different S3 bucket.
  ///
  /// Parameter [propagatedSetLevelTags] :
  /// The tags keys to propagate to the S3 objects associated with read sets in
  /// the sequence store. These tags can be used as input to add metadata to
  /// your read sets.
  ///
  /// Parameter [s3AccessConfig] :
  /// S3 access configuration parameters. This specifies the parameters needed
  /// to access logs stored in S3 buckets. The S3 bucket must be in the same
  /// region and account as the sequence store.
  ///
  /// Parameter [sseConfig] :
  /// Server-side encryption (SSE) settings for the store.
  ///
  /// Parameter [tags] :
  /// Tags for the store. You can configure up to 50 tags.
  Future<CreateSequenceStoreResponse> createSequenceStore({
    required String name,
    String? clientToken,
    String? description,
    ETagAlgorithmFamily? eTagAlgorithmFamily,
    String? fallbackLocation,
    List<String>? propagatedSetLevelTags,
    S3AccessConfig? s3AccessConfig,
    SseConfig? sseConfig,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (eTagAlgorithmFamily != null)
        'eTagAlgorithmFamily': eTagAlgorithmFamily.value,
      if (fallbackLocation != null) 'fallbackLocation': fallbackLocation,
      if (propagatedSetLevelTags != null)
        'propagatedSetLevelTags': propagatedSetLevelTags,
      if (s3AccessConfig != null) 's3AccessConfig': s3AccessConfig,
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

  /// Retrieves metadata for a sequence store using its ID and returns it in
  /// JSON format.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Update one or more parameters for the sequence store.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [id] :
  /// The ID of the sequence store.
  ///
  /// Parameter [clientToken] :
  /// To ensure that requests don't run multiple times, specify a unique token
  /// for each request.
  ///
  /// Parameter [description] :
  /// A description for the sequence store.
  ///
  /// Parameter [fallbackLocation] :
  /// The S3 URI of a bucket and folder to store Read Sets that fail to upload.
  ///
  /// Parameter [name] :
  /// A name for the sequence store.
  ///
  /// Parameter [propagatedSetLevelTags] :
  /// The tags keys to propagate to the S3 objects associated with read sets in
  /// the sequence store.
  ///
  /// Parameter [s3AccessConfig] :
  /// S3 access configuration parameters.
  Future<UpdateSequenceStoreResponse> updateSequenceStore({
    required String id,
    String? clientToken,
    String? description,
    String? fallbackLocation,
    String? name,
    List<String>? propagatedSetLevelTags,
    S3AccessConfig? s3AccessConfig,
  }) async {
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (fallbackLocation != null) 'fallbackLocation': fallbackLocation,
      if (name != null) 'name': name,
      if (propagatedSetLevelTags != null)
        'propagatedSetLevelTags': propagatedSetLevelTags,
      if (s3AccessConfig != null) 's3AccessConfig': s3AccessConfig,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/sequencestore/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateSequenceStoreResponse.fromJson(response);
  }

  /// Deletes a sequence store and returns a response with no body if the
  /// operation is successful. You can only delete a sequence store when it does
  /// not contain any read sets.
  ///
  /// Use the <code>BatchDeleteReadSet</code> API operation to ensure that all
  /// read sets in the sequence store are deleted. When a sequence store is
  /// deleted, all tags associated with the store are also deleted.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/omics/latest/dev/deleting-reference-and-sequence-stores.html">Deleting
  /// HealthOmics reference and sequence stores</a> in the <i>Amazon Web
  /// Services HealthOmics User Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Retrieves a list of sequence stores and returns each sequence store's
  /// metadata.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/omics/latest/dev/create-sequence-store.html">Creating
  /// a HealthOmics sequence store</a> in the <i>Amazon Web Services HealthOmics
  /// User Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Stops a multipart read set upload into a sequence store and returns a
  /// response with no body if the operation is successful. To confirm that a
  /// multipart read set upload has been stopped, use the
  /// <code>ListMultipartReadSetUploads</code> API operation to view all active
  /// multipart read set uploads.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [NotSupportedOperationException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Completes a multipart read set upload into a sequence store after you have
  /// initiated the upload process with
  /// <code>CreateMultipartReadSetUpload</code> and uploaded all read set parts
  /// using <code>UploadReadSetPart</code>. You must specify the parts you
  /// uploaded using the parts parameter. If the operation is successful, it
  /// returns the read set ID(s) of the uploaded read set(s).
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/omics/latest/dev/synchronous-uploads.html">Direct
  /// upload to a sequence store</a> in the <i>Amazon Web Services HealthOmics
  /// User Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [NotSupportedOperationException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Initiates a multipart read set upload for uploading partitioned source
  /// files into a sequence store. You can directly import source files from an
  /// EC2 instance and other local compute, or from an S3 bucket. To separate
  /// these source files into parts, use the <code>split</code> operation. Each
  /// part cannot be larger than 100 MB. If the operation is successful, it
  /// provides an <code>uploadId</code> which is required by the
  /// <code>UploadReadSetPart</code> API operation to upload parts into a
  /// sequence store.
  ///
  /// To continue uploading a multipart read set into your sequence store, you
  /// must use the <code>UploadReadSetPart</code> API operation to upload each
  /// part individually following the steps below:
  ///
  /// <ul>
  /// <li>
  /// Specify the <code>uploadId</code> obtained from the previous call to
  /// <code>CreateMultipartReadSetUpload</code>.
  /// </li>
  /// <li>
  /// Upload parts for that <code>uploadId</code>.
  /// </li>
  /// </ul>
  /// When you have finished uploading parts, use the
  /// <code>CompleteMultipartReadSetUpload</code> API to complete the multipart
  /// read set upload and to retrieve the final read set IDs in the response.
  ///
  /// To learn more about creating parts and the <code>split</code> operation,
  /// see <a
  /// href="https://docs.aws.amazon.com/omics/latest/dev/synchronous-uploads.html">Direct
  /// upload to a sequence store</a> in the <i>Amazon Web Services HealthOmics
  /// User Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [NotSupportedOperationException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
      'sourceFileType': sourceFileType.value,
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

  /// Returns detailed information about the status of a read set activation job
  /// in JSON format.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Retrieves status information about a read set export job and returns the
  /// data in JSON format. Use this operation to actively monitor the progress
  /// of an export job.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Gets detailed and status information about a read set import job and
  /// returns the data in JSON format.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Lists in-progress multipart read set uploads for a sequence store and
  /// returns it in a JSON formatted output. Multipart read set uploads are
  /// initiated by the <code>CreateMultipartReadSetUploads</code> API operation.
  /// This operation returns a response with no body when the upload is
  /// complete.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [NotSupportedOperationException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Retrieves a list of read set activation jobs and returns the metadata in a
  /// JSON formatted output. To extract metadata from a read set activation job,
  /// use the <code>GetReadSetActivationJob</code> API operation.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Retrieves a list of read set export jobs in a JSON formatted response.
  /// This API operation is used to check the status of a read set export job
  /// initiated by the <code>StartReadSetExportJob</code> API operation.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Retrieves a list of read set import jobs and returns the data in JSON
  /// format.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Lists all parts in a multipart read set upload for a sequence store and
  /// returns the metadata in a JSON formatted output.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [NotSupportedOperationException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final $payload = <String, dynamic>{
      'partSource': partSource.value,
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

  /// Activates an archived read set and returns its metadata in a JSON
  /// formatted output. AWS HealthOmics automatically archives unused read sets
  /// after 30 days. To monitor the status of your read set activation job, use
  /// the <code>GetReadSetActivationJob</code> operation.
  ///
  /// To learn more, see <a
  /// href="https://docs.aws.amazon.com/omics/latest/dev/activating-read-sets.html">Activating
  /// read sets</a> in the <i>Amazon Web Services HealthOmics User Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Starts a read set export job. When the export job is finished, the read
  /// set is exported to an Amazon S3 bucket which can be retrieved using the
  /// <code>GetReadSetExportJob</code> API operation.
  ///
  /// To monitor the status of the export job, use the
  /// <code>ListReadSetExportJobs</code> API operation.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Imports a read set from the sequence store. Read set import jobs support a
  /// maximum of 100 read sets of different types. Monitor the progress of your
  /// read set import job by calling the <code>GetReadSetImportJob</code> API
  /// operation.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Uploads a specific part of a read set into a sequence store. When you a
  /// upload a read set part with a part number that already exists, the new
  /// part replaces the existing one. This operation returns a JSON formatted
  /// response containing a string identifier that is used to confirm that parts
  /// are being added to the intended upload.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/omics/latest/dev/synchronous-uploads.html">Direct
  /// upload to a sequence store</a> in the <i>Amazon Web Services HealthOmics
  /// User Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [NotSupportedOperationException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
    final $query = <String, List<String>>{
      'partNumber': [partNumber.toString()],
      'partSource': [partSource.value],
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

  /// Retrieves the metadata for a read set from a sequence store in JSON
  /// format. This operation does not return tags. To retrieve the list of tags
  /// for a read set, use the <code>ListTagsForResource</code> API operation.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Retrieves a list of read sets from a sequence store ID and returns the
  /// metadata in JSON format.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Retrieves detailed information from parts of a read set and returns the
  /// read set in the same format that it was uploaded. You must have read sets
  /// uploaded to your sequence store in order to run this operation.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [RangeNotSatisfiableException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
    final $query = <String, List<String>>{
      'partNumber': [partNumber.toString()],
      if (file != null) 'file': [file.value],
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

  /// Deletes one or more read sets. If the operation is successful, it returns
  /// a response with no body. If there is an error with deleting one of the
  /// read sets, the operation returns an error list. If the operation
  /// successfully deletes only a subset of files, it will return an error list
  /// for the remaining files that fail to be deleted. There is a limit of 100
  /// read sets that can be deleted in each <code>BatchDeleteReadSet</code> API
  /// call.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Creates a cross-account shared resource. The resource owner makes an offer
  /// to share the resource with the principal subscriber (an AWS user with a
  /// different account than the resource owner).
  ///
  /// The following resources support cross-account sharing:
  ///
  /// <ul>
  /// <li>
  /// HealthOmics variant stores
  /// </li>
  /// <li>
  /// HealthOmics annotation stores
  /// </li>
  /// <li>
  /// Private workflows
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Retrieves the metadata for the specified resource share.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Accept a resource share request.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Deletes a resource share. If you are the resource owner, the subscriber
  /// will no longer have access to the shared resource. If you are the
  /// subscriber, this operation deletes your access to the share.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Retrieves the resource shares associated with an account. Use the filter
  /// parameter to retrieve a specific subset of the shares.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
      'resourceOwner': resourceOwner.value,
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
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Tags a resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// <important>
  /// Amazon Web Services HealthOmics variant stores and annotation stores are
  /// no longer open to new customers. Existing customers can continue to use
  /// the service as normal. For more information, see <a
  /// href="https://docs.aws.amazon.com/omics/latest/dev/variant-store-availability-change.html">
  /// Amazon Web Services HealthOmics variant store and annotation store
  /// availability change</a>.
  /// </important>
  /// Starts a variant import job.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// <important>
  /// Amazon Web Services HealthOmics variant stores and annotation stores are
  /// no longer open to new customers. Existing customers can continue to use
  /// the service as normal. For more information, see <a
  /// href="https://docs.aws.amazon.com/omics/latest/dev/variant-store-availability-change.html">
  /// Amazon Web Services HealthOmics variant store and annotation store
  /// availability change</a>.
  /// </important>
  /// Gets information about a variant import job.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// <important>
  /// Amazon Web Services HealthOmics variant stores and annotation stores are
  /// no longer open to new customers. Existing customers can continue to use
  /// the service as normal. For more information, see <a
  /// href="https://docs.aws.amazon.com/omics/latest/dev/variant-store-availability-change.html">
  /// Amazon Web Services HealthOmics variant store and annotation store
  /// availability change</a>.
  /// </important>
  /// Cancels a variant import job.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// <important>
  /// Amazon Web Services HealthOmics variant stores and annotation stores are
  /// no longer open to new customers. Existing customers can continue to use
  /// the service as normal. For more information, see <a
  /// href="https://docs.aws.amazon.com/omics/latest/dev/variant-store-availability-change.html">
  /// Amazon Web Services HealthOmics variant store and annotation store
  /// availability change</a>.
  /// </important>
  /// Retrieves a list of variant import jobs.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// <important>
  /// Amazon Web Services HealthOmics variant stores and annotation stores are
  /// no longer open to new customers. Existing customers can continue to use
  /// the service as normal. For more information, see <a
  /// href="https://docs.aws.amazon.com/omics/latest/dev/variant-store-availability-change.html">
  /// Amazon Web Services HealthOmics variant store and annotation store
  /// availability change</a>.
  /// </important>
  /// Creates a variant store.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// <important>
  /// Amazon Web Services HealthOmics variant stores and annotation stores are
  /// no longer open to new customers. Existing customers can continue to use
  /// the service as normal. For more information, see <a
  /// href="https://docs.aws.amazon.com/omics/latest/dev/variant-store-availability-change.html">
  /// Amazon Web Services HealthOmics variant store and annotation store
  /// availability change</a>.
  /// </important>
  /// Gets information about a variant store.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// <important>
  /// Amazon Web Services HealthOmics variant stores and annotation stores are
  /// no longer open to new customers. Existing customers can continue to use
  /// the service as normal. For more information, see <a
  /// href="https://docs.aws.amazon.com/omics/latest/dev/variant-store-availability-change.html">
  /// Amazon Web Services HealthOmics variant store and annotation store
  /// availability change</a>.
  /// </important>
  /// Updates a variant store.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// <important>
  /// Amazon Web Services HealthOmics variant stores and annotation stores are
  /// no longer open to new customers. Existing customers can continue to use
  /// the service as normal. For more information, see <a
  /// href="https://docs.aws.amazon.com/omics/latest/dev/variant-store-availability-change.html">
  /// Amazon Web Services HealthOmics variant store and annotation store
  /// availability change</a>.
  /// </important>
  /// Deletes a variant store.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// <important>
  /// Amazon Web Services HealthOmics variant stores and annotation stores are
  /// no longer open to new customers. Existing customers can continue to use
  /// the service as normal. For more information, see <a
  /// href="https://docs.aws.amazon.com/omics/latest/dev/variant-store-availability-change.html">
  /// Amazon Web Services HealthOmics variant store and annotation store
  /// availability change</a>.
  /// </important>
  /// Retrieves a list of variant stores.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Creates a private workflow. Before you create a private workflow, you must
  /// create and configure these required resources:
  ///
  /// <ul>
  /// <li>
  /// <i>Workflow definition file:</i> A workflow definition file written in
  /// WDL, Nextflow, or CWL. The workflow definition specifies the inputs and
  /// outputs for runs that use the workflow. It also includes specifications
  /// for the runs and run tasks for your workflow, including compute and memory
  /// requirements. The workflow definition file must be in <code>.zip</code>
  /// format. For more information, see <a
  /// href="https://docs.aws.amazon.com/omics/latest/dev/workflow-definition-files.html">Workflow
  /// definition files</a> in Amazon Web Services HealthOmics.
  ///
  /// <ul>
  /// <li>
  /// You can use Amazon Q CLI to build and validate your workflow definition
  /// files in WDL, Nextflow, and CWL. For more information, see <a
  /// href="https://docs.aws.amazon.com/omics/latest/dev/getting-started.html#omics-q-prompts">Example
  /// prompts for Amazon Q CLI</a> and the <a
  /// href="https://github.com/aws-samples/aws-healthomics-tutorials/tree/main/generative-ai">Amazon
  /// Web Services HealthOmics Agentic generative AI tutorial</a> on GitHub.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <i>(Optional) Parameter template file:</i> A parameter template file
  /// written in JSON. Create the file to define the run parameters, or Amazon
  /// Web Services HealthOmics generates the parameter template for you. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/omics/latest/dev/parameter-templates.html">Parameter
  /// template files for HealthOmics workflows</a>.
  /// </li>
  /// <li>
  /// <i>ECR container images:</i> Create container images for the workflow in a
  /// private ECR repository, or synchronize images from a supported upstream
  /// registry with your Amazon ECR private repository.
  /// </li>
  /// <li>
  /// <i>(Optional) Sentieon licenses:</i> Request a Sentieon license to use the
  /// Sentieon software in private workflows.
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/omics/latest/dev/creating-private-workflows.html">Creating
  /// or updating a private workflow in Amazon Web Services HealthOmics</a> in
  /// the <i>Amazon Web Services HealthOmics User Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [accelerators] :
  /// The computational accelerator specified to run the workflow.
  ///
  /// Parameter [containerRegistryMap] :
  /// (Optional) Use a container registry map to specify mappings between the
  /// ECR private repository and one or more upstream registries. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/omics/latest/dev/workflows-ecr.html">Container
  /// images</a> in the <i>Amazon Web Services HealthOmics User Guide</i>.
  ///
  /// Parameter [containerRegistryMapUri] :
  /// (Optional) URI of the S3 location for the registry mapping file.
  ///
  /// Parameter [definitionRepository] :
  /// The repository information for the workflow definition. This allows you to
  /// source your workflow definition directly from a code repository.
  ///
  /// Parameter [definitionUri] :
  /// The S3 URI of a definition for the workflow. The S3 bucket must be in the
  /// same region as the workflow.
  ///
  /// Parameter [definitionZip] :
  /// A ZIP archive containing the main workflow definition file and
  /// dependencies that it imports for the workflow. You can use a file with a
  /// ://fileb prefix instead of the Base64 string. For more information, see <a
  /// href="https://docs.aws.amazon.com/omics/latest/dev/workflow-defn-requirements.html">Workflow
  /// definition requirements</a> in the <i>Amazon Web Services HealthOmics User
  /// Guide</i>.
  ///
  /// Parameter [description] :
  /// A description for the workflow.
  ///
  /// Parameter [engine] :
  /// The workflow engine for the workflow. By default, Amazon Web Services
  /// HealthOmics detects the engine automatically from your workflow
  /// definition. Provide a value if you have workflow definition files from
  /// more than one engine in your zip file, or to use WDL lenient.
  ///
  /// WDL lenient is designed to handle workflows migrated from Cromwell. It
  /// supports customer Cromwell directives and some non-conformant logic. For
  /// details, see <a
  /// href="https://docs.aws.amazon.com/omics/latest/dev/workflow-wdl-type-conversion.html">Implicit
  /// type conversion in WDL lenient</a> in the <i>Amazon Web Services
  /// HealthOmics User Guide</i>.
  ///
  /// Parameter [main] :
  /// The path of the main definition file for the workflow. This parameter is
  /// not required if the ZIP archive contains only one workflow definition
  /// file, or if the main definition file is named “main”. An example path is:
  /// <code>workflow-definition/main-file.wdl</code>.
  ///
  /// Parameter [name] :
  /// Name (optional but highly recommended) for the workflow to locate relevant
  /// information in the CloudWatch logs and Amazon Web Services HealthOmics
  /// console.
  ///
  /// Parameter [parameterTemplate] :
  /// A parameter template for the workflow. If this field is blank, Amazon Web
  /// Services HealthOmics will automatically parse the parameter template
  /// values from your workflow definition file. To override these service
  /// generated default values, provide a parameter template. To view an example
  /// of a parameter template, see <a
  /// href="https://docs.aws.amazon.com/omics/latest/dev/parameter-templates.html">Parameter
  /// template files</a> in the <i>Amazon Web Services HealthOmics User
  /// Guide</i>.
  ///
  /// Parameter [parameterTemplatePath] :
  /// The path to the workflow parameter template JSON file within the
  /// repository. This file defines the input parameters for runs that use this
  /// workflow. If not specified, the workflow will be created without a
  /// parameter template.
  ///
  /// Parameter [readmeMarkdown] :
  /// The markdown content for the workflow's README file. This provides
  /// documentation and usage information for users of the workflow.
  ///
  /// Parameter [readmePath] :
  /// The path to the workflow README markdown file within the repository. This
  /// file provides documentation and usage information for the workflow. If not
  /// specified, the <code>README.md</code> file from the root directory of the
  /// repository will be used.
  ///
  /// Parameter [readmeUri] :
  /// The S3 URI of the README file for the workflow. This file provides
  /// documentation and usage information for the workflow. Requirements
  /// include:
  ///
  /// <ul>
  /// <li>
  /// The S3 URI must begin with <code>s3://USER-OWNED-BUCKET/</code>
  /// </li>
  /// <li>
  /// The requester must have access to the S3 bucket and object.
  /// </li>
  /// <li>
  /// The max README content length is 500 KiB.
  /// </li>
  /// </ul>
  ///
  /// Parameter [requestId] :
  /// An idempotency token to ensure that duplicate workflows are not created
  /// when Amazon Web Services HealthOmics submits retry requests.
  ///
  /// Parameter [storageCapacity] :
  /// The default static storage capacity (in gibibytes) for runs that use this
  /// workflow or workflow version. The <code>storageCapacity</code> can be
  /// overwritten at run time. The storage capacity is not required for runs
  /// with a <code>DYNAMIC</code> storage type.
  ///
  /// Parameter [storageType] :
  /// The default storage type for runs that use this workflow. The
  /// <code>storageType</code> can be overridden at run time.
  /// <code>DYNAMIC</code> storage dynamically scales the storage up or down,
  /// based on file system utilization. <code>STATIC</code> storage allocates a
  /// fixed amount of storage. For more information about dynamic and static
  /// storage types, see <a
  /// href="https://docs.aws.amazon.com/omics/latest/dev/workflows-run-types.html">Run
  /// storage types</a> in the <i>Amazon Web Services HealthOmics User
  /// Guide</i>.
  ///
  /// Parameter [tags] :
  /// Tags for the workflow. You can define up to 50 tags for the workflow. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/omics/latest/dev/add-a-tag.html">Adding
  /// a tag</a> in the <i>Amazon Web Services HealthOmics User Guide</i>.
  ///
  /// Parameter [workflowBucketOwnerId] :
  /// The Amazon Web Services account ID of the expected owner of the S3 bucket
  /// that contains the workflow definition. If not specified, the service skips
  /// the validation.
  Future<CreateWorkflowResponse> createWorkflow({
    Accelerators? accelerators,
    ContainerRegistryMap? containerRegistryMap,
    String? containerRegistryMapUri,
    DefinitionRepository? definitionRepository,
    String? definitionUri,
    Uint8List? definitionZip,
    String? description,
    WorkflowEngine? engine,
    String? main,
    String? name,
    Map<String, WorkflowParameter>? parameterTemplate,
    String? parameterTemplatePath,
    String? readmeMarkdown,
    String? readmePath,
    String? readmeUri,
    String? requestId,
    int? storageCapacity,
    StorageType? storageType,
    Map<String, String>? tags,
    String? workflowBucketOwnerId,
  }) async {
    final $payload = <String, dynamic>{
      if (accelerators != null) 'accelerators': accelerators.value,
      if (containerRegistryMap != null)
        'containerRegistryMap': containerRegistryMap,
      if (containerRegistryMapUri != null)
        'containerRegistryMapUri': containerRegistryMapUri,
      if (definitionRepository != null)
        'definitionRepository': definitionRepository,
      if (definitionUri != null) 'definitionUri': definitionUri,
      if (definitionZip != null) 'definitionZip': base64Encode(definitionZip),
      if (description != null) 'description': description,
      if (engine != null) 'engine': engine.value,
      if (main != null) 'main': main,
      if (name != null) 'name': name,
      if (parameterTemplate != null) 'parameterTemplate': parameterTemplate,
      if (parameterTemplatePath != null)
        'parameterTemplatePath': parameterTemplatePath,
      if (readmeMarkdown != null) 'readmeMarkdown': readmeMarkdown,
      if (readmePath != null) 'readmePath': readmePath,
      if (readmeUri != null) 'readmeUri': readmeUri,
      'requestId': requestId ?? _s.generateIdempotencyToken(),
      if (storageCapacity != null) 'storageCapacity': storageCapacity,
      if (storageType != null) 'storageType': storageType.value,
      if (tags != null) 'tags': tags,
      if (workflowBucketOwnerId != null)
        'workflowBucketOwnerId': workflowBucketOwnerId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/workflow',
      exceptionFnMap: _exceptionFns,
    );
    return CreateWorkflowResponse.fromJson(response);
  }

  /// Gets all information about a workflow using its ID.
  ///
  /// If a workflow is shared with you, you cannot export the workflow.
  ///
  /// For more information about your workflow status, see <a
  /// href="https://docs.aws.amazon.com/omics/latest/dev/using-get-workflow.html">Verify
  /// the workflow status</a> in the <i>Amazon Web Services HealthOmics User
  /// Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
      if (export != null) 'export': export.map((e) => e.value).toList(),
      if (type != null) 'type': [type.value],
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

  /// Updates information about a workflow.
  ///
  /// You can update the following workflow information:
  ///
  /// <ul>
  /// <li>
  /// Name
  /// </li>
  /// <li>
  /// Description
  /// </li>
  /// <li>
  /// Default storage type
  /// </li>
  /// <li>
  /// Default storage capacity (with workflow ID)
  /// </li>
  /// </ul>
  /// This operation returns a response with no body if the operation is
  /// successful. You can check the workflow updates by calling the
  /// <code>GetWorkflow</code> API operation.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/omics/latest/dev/update-private-workflow.html">Update
  /// a private workflow</a> in the <i>Amazon Web Services HealthOmics User
  /// Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [id] :
  /// The workflow's ID.
  ///
  /// Parameter [description] :
  /// A description for the workflow.
  ///
  /// Parameter [name] :
  /// A name for the workflow.
  ///
  /// Parameter [readmeMarkdown] :
  /// The markdown content for the workflow's README file. This provides
  /// documentation and usage information for users of the workflow.
  ///
  /// Parameter [storageCapacity] :
  /// The default static storage capacity (in gibibytes) for runs that use this
  /// workflow or workflow version.
  ///
  /// Parameter [storageType] :
  /// The default storage type for runs that use this workflow. STATIC storage
  /// allocates a fixed amount of storage. DYNAMIC storage dynamically scales
  /// the storage up or down, based on file system utilization. For more
  /// information about static and dynamic storage, see <a
  /// href="https://docs.aws.amazon.com/omics/latest/dev/Using-workflows.html">Running
  /// workflows</a> in the <i>Amazon Web Services HealthOmics User Guide</i>.
  Future<void> updateWorkflow({
    required String id,
    String? description,
    String? name,
    String? readmeMarkdown,
    int? storageCapacity,
    StorageType? storageType,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'description': description,
      if (name != null) 'name': name,
      if (readmeMarkdown != null) 'readmeMarkdown': readmeMarkdown,
      if (storageCapacity != null) 'storageCapacity': storageCapacity,
      if (storageType != null) 'storageType': storageType.value,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/workflow/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a workflow by specifying its ID. This operation returns a response
  /// with no body if the deletion is successful.
  ///
  /// To verify that the workflow is deleted:
  ///
  /// <ul>
  /// <li>
  /// Use <code>ListWorkflows</code> to confirm the workflow no longer appears
  /// in the list.
  /// </li>
  /// <li>
  /// Use <code>GetWorkflow</code> to verify the workflow cannot be found.
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Retrieves a list of existing workflows. You can filter for specific
  /// workflows by their name and type. Using the type parameter, specify
  /// <code>PRIVATE</code> to retrieve a list of private workflows or specify
  /// <code>READY2RUN</code> for a list of all Ready2Run workflows. If you do
  /// not specify the type of workflow, this operation returns a list of
  /// existing workflows.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (name != null) 'name': [name],
      if (startingToken != null) 'startingToken': [startingToken],
      if (type != null) 'type': [type.value],
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

  /// Creates a new workflow version for the workflow that you specify with the
  /// <code>workflowId</code> parameter.
  ///
  /// When you create a new version of a workflow, you need to specify the
  /// configuration for the new version. It doesn't inherit any configuration
  /// values from the workflow.
  ///
  /// Provide a version name that is unique for this workflow. You cannot change
  /// the name after HealthOmics creates the version.
  /// <note>
  /// Don't include any personally identifiable information (PII) in the version
  /// name. Version names appear in the workflow version ARN.
  /// </note>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/omics/latest/dev/workflow-versions.html">Workflow
  /// versioning in Amazon Web Services HealthOmics</a> in the <i>Amazon Web
  /// Services HealthOmics User Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [versionName] :
  /// A name for the workflow version. Provide a version name that is unique for
  /// this workflow. You cannot change the name after HealthOmics creates the
  /// version.
  ///
  /// The version name must start with a letter or number and it can include
  /// upper-case and lower-case letters, numbers, hyphens, periods and
  /// underscores. The maximum length is 64 characters. You can use a simple
  /// naming scheme, such as version1, version2, version3. You can also match
  /// your workflow versions with your own internal versioning conventions, such
  /// as 2.7.0, 2.7.1, 2.7.2.
  ///
  /// Parameter [workflowId] :
  /// The ID of the workflow where you are creating the new version. The
  /// <code>workflowId</code> is not the UUID.
  ///
  /// Parameter [accelerators] :
  /// The computational accelerator for this workflow version.
  ///
  /// Parameter [containerRegistryMap] :
  /// (Optional) Use a container registry map to specify mappings between the
  /// ECR private repository and one or more upstream registries. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/omics/latest/dev/workflows-ecr.html">Container
  /// images</a> in the <i>Amazon Web Services HealthOmics User Guide</i>.
  ///
  /// Parameter [containerRegistryMapUri] :
  /// (Optional) URI of the S3 location for the registry mapping file.
  ///
  /// Parameter [definitionRepository] :
  /// The repository information for the workflow version definition. This
  /// allows you to source your workflow version definition directly from a code
  /// repository.
  ///
  /// Parameter [definitionUri] :
  /// The S3 URI of a definition for this workflow version. The S3 bucket must
  /// be in the same region as this workflow version.
  ///
  /// Parameter [definitionZip] :
  /// A ZIP archive containing the main workflow definition file and
  /// dependencies that it imports for this workflow version. You can use a file
  /// with a ://fileb prefix instead of the Base64 string. For more information,
  /// see Workflow definition requirements in the <i>Amazon Web Services
  /// HealthOmics User Guide</i>.
  ///
  /// Parameter [description] :
  /// A description for this workflow version.
  ///
  /// Parameter [engine] :
  /// The workflow engine for this workflow version. This is only required if
  /// you have workflow definition files from more than one engine in your zip
  /// file. Otherwise, the service can detect the engine automatically from your
  /// workflow definition.
  ///
  /// Parameter [main] :
  /// The path of the main definition file for this workflow version. This
  /// parameter is not required if the ZIP archive contains only one workflow
  /// definition file, or if the main definition file is named “main”. An
  /// example path is: <code>workflow-definition/main-file.wdl</code>.
  ///
  /// Parameter [parameterTemplate] :
  /// A parameter template for this workflow version. If this field is blank,
  /// Amazon Web Services HealthOmics will automatically parse the parameter
  /// template values from your workflow definition file. To override these
  /// service generated default values, provide a parameter template. To view an
  /// example of a parameter template, see <a
  /// href="https://docs.aws.amazon.com/omics/latest/dev/parameter-templates.html">Parameter
  /// template files</a> in the <i>Amazon Web Services HealthOmics User
  /// Guide</i>.
  ///
  /// Parameter [parameterTemplatePath] :
  /// The path to the workflow version parameter template JSON file within the
  /// repository. This file defines the input parameters for runs that use this
  /// workflow version. If not specified, the workflow version will be created
  /// without a parameter template.
  ///
  /// Parameter [readmeMarkdown] :
  /// The markdown content for the workflow version's README file. This provides
  /// documentation and usage information for users of this specific workflow
  /// version.
  ///
  /// Parameter [readmePath] :
  /// The path to the workflow version README markdown file within the
  /// repository. This file provides documentation and usage information for the
  /// workflow. If not specified, the <code>README.md</code> file from the root
  /// directory of the repository will be used.
  ///
  /// Parameter [readmeUri] :
  /// The S3 URI of the README file for the workflow version. This file provides
  /// documentation and usage information for the workflow version. Requirements
  /// include:
  ///
  /// <ul>
  /// <li>
  /// The S3 URI must begin with <code>s3://USER-OWNED-BUCKET/</code>
  /// </li>
  /// <li>
  /// The requester must have access to the S3 bucket and object.
  /// </li>
  /// <li>
  /// The max README content length is 500 KiB.
  /// </li>
  /// </ul>
  ///
  /// Parameter [requestId] :
  /// An idempotency token to ensure that duplicate workflows are not created
  /// when Amazon Web Services HealthOmics submits retry requests.
  ///
  /// Parameter [storageCapacity] :
  /// The default static storage capacity (in gibibytes) for runs that use this
  /// workflow version. The <code>storageCapacity</code> can be overwritten at
  /// run time. The storage capacity is not required for runs with a
  /// <code>DYNAMIC</code> storage type.
  ///
  /// Parameter [storageType] :
  /// The default storage type for runs that use this workflow version. The
  /// <code>storageType</code> can be overridden at run time.
  /// <code>DYNAMIC</code> storage dynamically scales the storage up or down,
  /// based on file system utilization. STATIC storage allocates a fixed amount
  /// of storage. For more information about dynamic and static storage types,
  /// see <a
  /// href="https://docs.aws.amazon.com/omics/latest/dev/workflows-run-types.html">Run
  /// storage types</a> in the <i>Amazon Web Services HealthOmics User
  /// Guide</i>.
  ///
  /// Parameter [tags] :
  /// Tags for this workflow version. You can define up to 50 tags for the
  /// workflow. For more information, see <a
  /// href="https://docs.aws.amazon.com/omics/latest/dev/add-a-tag.html">Adding
  /// a tag</a> in the <i>Amazon Web Services HealthOmics User Guide</i>.
  ///
  /// Parameter [workflowBucketOwnerId] :
  /// Amazon Web Services Id of the owner of the S3 bucket that contains the
  /// workflow definition. You need to specify this parameter if your account is
  /// not the bucket owner.
  Future<CreateWorkflowVersionResponse> createWorkflowVersion({
    required String versionName,
    required String workflowId,
    Accelerators? accelerators,
    ContainerRegistryMap? containerRegistryMap,
    String? containerRegistryMapUri,
    DefinitionRepository? definitionRepository,
    String? definitionUri,
    Uint8List? definitionZip,
    String? description,
    WorkflowEngine? engine,
    String? main,
    Map<String, WorkflowParameter>? parameterTemplate,
    String? parameterTemplatePath,
    String? readmeMarkdown,
    String? readmePath,
    String? readmeUri,
    String? requestId,
    int? storageCapacity,
    StorageType? storageType,
    Map<String, String>? tags,
    String? workflowBucketOwnerId,
  }) async {
    final $payload = <String, dynamic>{
      'versionName': versionName,
      if (accelerators != null) 'accelerators': accelerators.value,
      if (containerRegistryMap != null)
        'containerRegistryMap': containerRegistryMap,
      if (containerRegistryMapUri != null)
        'containerRegistryMapUri': containerRegistryMapUri,
      if (definitionRepository != null)
        'definitionRepository': definitionRepository,
      if (definitionUri != null) 'definitionUri': definitionUri,
      if (definitionZip != null) 'definitionZip': base64Encode(definitionZip),
      if (description != null) 'description': description,
      if (engine != null) 'engine': engine.value,
      if (main != null) 'main': main,
      if (parameterTemplate != null) 'parameterTemplate': parameterTemplate,
      if (parameterTemplatePath != null)
        'parameterTemplatePath': parameterTemplatePath,
      if (readmeMarkdown != null) 'readmeMarkdown': readmeMarkdown,
      if (readmePath != null) 'readmePath': readmePath,
      if (readmeUri != null) 'readmeUri': readmeUri,
      'requestId': requestId ?? _s.generateIdempotencyToken(),
      if (storageCapacity != null) 'storageCapacity': storageCapacity,
      if (storageType != null) 'storageType': storageType.value,
      if (tags != null) 'tags': tags,
      if (workflowBucketOwnerId != null)
        'workflowBucketOwnerId': workflowBucketOwnerId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/workflow/${Uri.encodeComponent(workflowId)}/version',
      exceptionFnMap: _exceptionFns,
    );
    return CreateWorkflowVersionResponse.fromJson(response);
  }

  /// Gets information about a workflow version. For more information, see <a
  /// href="https://docs.aws.amazon.com/omics/latest/dev/workflow-versions.html">Workflow
  /// versioning in Amazon Web Services HealthOmics</a> in the <i>Amazon Web
  /// Services HealthOmics User Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [versionName] :
  /// The workflow version name.
  ///
  /// Parameter [workflowId] :
  /// The workflow's ID. The <code>workflowId</code> is not the UUID.
  ///
  /// Parameter [export] :
  /// The export format for the workflow.
  ///
  /// Parameter [type] :
  /// The workflow's type.
  ///
  /// Parameter [workflowOwnerId] :
  /// The 12-digit account ID of the workflow owner. The workflow owner ID can
  /// be retrieved using the <code>GetShare</code> API operation. If you are the
  /// workflow owner, you do not need to include this ID.
  Future<GetWorkflowVersionResponse> getWorkflowVersion({
    required String versionName,
    required String workflowId,
    List<WorkflowExport>? export,
    WorkflowType? type,
    String? workflowOwnerId,
  }) async {
    final $query = <String, List<String>>{
      if (export != null) 'export': export.map((e) => e.value).toList(),
      if (type != null) 'type': [type.value],
      if (workflowOwnerId != null) 'workflowOwnerId': [workflowOwnerId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/workflow/${Uri.encodeComponent(workflowId)}/version/${Uri.encodeComponent(versionName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetWorkflowVersionResponse.fromJson(response);
  }

  /// Updates information about the workflow version. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/omics/latest/dev/workflow-versions.html">Workflow
  /// versioning in Amazon Web Services HealthOmics</a> in the <i>Amazon Web
  /// Services HealthOmics User Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [versionName] :
  /// The name of the workflow version.
  ///
  /// Parameter [workflowId] :
  /// The workflow's ID. The <code>workflowId</code> is not the UUID.
  ///
  /// Parameter [description] :
  /// Description of the workflow version.
  ///
  /// Parameter [readmeMarkdown] :
  /// The markdown content for the workflow version's README file. This provides
  /// documentation and usage information for users of this specific workflow
  /// version.
  ///
  /// Parameter [storageCapacity] :
  /// The default static storage capacity (in gibibytes) for runs that use this
  /// workflow version. The <code>storageCapacity</code> can be overwritten at
  /// run time. The storage capacity is not required for runs with a
  /// <code>DYNAMIC</code> storage type.
  ///
  /// Parameter [storageType] :
  /// The default storage type for runs that use this workflow version. The
  /// <code>storageType</code> can be overridden at run time.
  /// <code>DYNAMIC</code> storage dynamically scales the storage up or down,
  /// based on file system utilization. STATIC storage allocates a fixed amount
  /// of storage. For more information about dynamic and static storage types,
  /// see <a
  /// href="https://docs.aws.amazon.com/omics/latest/dev/workflows-run-types.html">Run
  /// storage types</a> in the <i>in the <i>Amazon Web Services HealthOmics User
  /// Guide</i> </i>.
  Future<void> updateWorkflowVersion({
    required String versionName,
    required String workflowId,
    String? description,
    String? readmeMarkdown,
    int? storageCapacity,
    StorageType? storageType,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'description': description,
      if (readmeMarkdown != null) 'readmeMarkdown': readmeMarkdown,
      if (storageCapacity != null) 'storageCapacity': storageCapacity,
      if (storageType != null) 'storageType': storageType.value,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/workflow/${Uri.encodeComponent(workflowId)}/version/${Uri.encodeComponent(versionName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a workflow version. Deleting a workflow version doesn't affect any
  /// ongoing runs that are using the workflow version.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/omics/latest/dev/workflow-versions.html">Workflow
  /// versioning in Amazon Web Services HealthOmics</a> in the <i>Amazon Web
  /// Services HealthOmics User Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [versionName] :
  /// The workflow version name.
  ///
  /// Parameter [workflowId] :
  /// The workflow's ID.
  Future<void> deleteWorkflowVersion({
    required String versionName,
    required String workflowId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/workflow/${Uri.encodeComponent(workflowId)}/version/${Uri.encodeComponent(versionName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists the workflow versions for the specified workflow. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/omics/latest/dev/workflow-versions.html">Workflow
  /// versioning in Amazon Web Services HealthOmics</a> in the <i>Amazon Web
  /// Services HealthOmics User Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [RequestTimeoutException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [workflowId] :
  /// The workflow's ID. The <code>workflowId</code> is not the UUID.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of workflows to return in one page of results.
  ///
  /// Parameter [startingToken] :
  /// Specify the pagination token from a previous request to retrieve the next
  /// page of results.
  ///
  /// Parameter [type] :
  /// The workflow type.
  ///
  /// Parameter [workflowOwnerId] :
  /// The 12-digit account ID of the workflow owner. The workflow owner ID can
  /// be retrieved using the <code>GetShare</code> API operation. If you are the
  /// workflow owner, you do not need to include this ID.
  Future<ListWorkflowVersionsResponse> listWorkflowVersions({
    required String workflowId,
    int? maxResults,
    String? startingToken,
    WorkflowType? type,
    String? workflowOwnerId,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (startingToken != null) 'startingToken': [startingToken],
      if (type != null) 'type': [type.value],
      if (workflowOwnerId != null) 'workflowOwnerId': [workflowOwnerId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/workflow/${Uri.encodeComponent(workflowId)}/version',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListWorkflowVersionsResponse.fromJson(response);
  }
}

/// @nodoc
class DeleteS3AccessPolicyResponse {
  DeleteS3AccessPolicyResponse();

  factory DeleteS3AccessPolicyResponse.fromJson(Map<String, dynamic> _) {
    return DeleteS3AccessPolicyResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class GetS3AccessPolicyResponse {
  /// The current resource policy that controls S3 access on the store.
  final Object s3AccessPolicy;

  /// The S3 access point ARN that has the access policy.
  final String? s3AccessPointArn;

  /// The Amazon Web Services-generated Sequence Store or Reference Store ID.
  final String? storeId;

  /// The type of store associated with the access point.
  final StoreType? storeType;

  /// The time when the policy was last updated.
  final DateTime? updateTime;

  GetS3AccessPolicyResponse({
    required this.s3AccessPolicy,
    this.s3AccessPointArn,
    this.storeId,
    this.storeType,
    this.updateTime,
  });

  factory GetS3AccessPolicyResponse.fromJson(Map<String, dynamic> json) {
    return GetS3AccessPolicyResponse(
      s3AccessPolicy: jsonDecode(json['s3AccessPolicy'] as String) as Object,
      s3AccessPointArn: json['s3AccessPointArn'] as String?,
      storeId: json['storeId'] as String?,
      storeType: (json['storeType'] as String?)?.let(StoreType.fromString),
      updateTime: timeStampFromJson(json['updateTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final s3AccessPolicy = this.s3AccessPolicy;
    final s3AccessPointArn = this.s3AccessPointArn;
    final storeId = this.storeId;
    final storeType = this.storeType;
    final updateTime = this.updateTime;
    return {
      's3AccessPolicy': jsonEncode(s3AccessPolicy),
      if (s3AccessPointArn != null) 's3AccessPointArn': s3AccessPointArn,
      if (storeId != null) 'storeId': storeId,
      if (storeType != null) 'storeType': storeType.value,
      if (updateTime != null) 'updateTime': iso8601ToJson(updateTime),
    };
  }
}

/// @nodoc
class PutS3AccessPolicyResponse {
  /// The S3 access point ARN that now has the access policy.
  final String? s3AccessPointArn;

  /// The Amazon Web Services-generated Sequence Store or Reference Store ID.
  final String? storeId;

  /// The type of store associated with the access point.
  final StoreType? storeType;

  PutS3AccessPolicyResponse({
    this.s3AccessPointArn,
    this.storeId,
    this.storeType,
  });

  factory PutS3AccessPolicyResponse.fromJson(Map<String, dynamic> json) {
    return PutS3AccessPolicyResponse(
      s3AccessPointArn: json['s3AccessPointArn'] as String?,
      storeId: json['storeId'] as String?,
      storeType: (json['storeType'] as String?)?.let(StoreType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final s3AccessPointArn = this.s3AccessPointArn;
    final storeId = this.storeId;
    final storeType = this.storeType;
    return {
      if (s3AccessPointArn != null) 's3AccessPointArn': s3AccessPointArn,
      if (storeId != null) 'storeId': storeId,
      if (storeType != null) 'storeType': storeType.value,
    };
  }
}

/// @nodoc
class StartAnnotationImportResponse {
  /// The job's ID.
  final String jobId;

  StartAnnotationImportResponse({
    required this.jobId,
  });

  factory StartAnnotationImportResponse.fromJson(Map<String, dynamic> json) {
    return StartAnnotationImportResponse(
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

/// @nodoc
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
      completionTime: nonNullableTimeStampFromJson(json['completionTime'] ?? 0),
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      destinationName: (json['destinationName'] as String?) ?? '',
      formatOptions: FormatOptions.fromJson(
          (json['formatOptions'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      id: (json['id'] as String?) ?? '',
      items: ((json['items'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              AnnotationImportItemDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      roleArn: (json['roleArn'] as String?) ?? '',
      runLeftNormalization: (json['runLeftNormalization'] as bool?) ?? false,
      status: JobStatus.fromString((json['status'] as String?) ?? ''),
      statusMessage: (json['statusMessage'] as String?) ?? '',
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
      versionName: (json['versionName'] as String?) ?? '',
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
      'status': status.value,
      'statusMessage': statusMessage,
      'updateTime': iso8601ToJson(updateTime),
      'versionName': versionName,
      if (annotationFields != null) 'annotationFields': annotationFields,
    };
  }
}

/// @nodoc
class CancelAnnotationImportResponse {
  CancelAnnotationImportResponse();

  factory CancelAnnotationImportResponse.fromJson(Map<String, dynamic> _) {
    return CancelAnnotationImportResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
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
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      status: StoreStatus.fromString((json['status'] as String?) ?? ''),
      versionName: (json['versionName'] as String?) ?? '',
      reference: json['reference'] != null
          ? ReferenceItem.fromJson(json['reference'] as Map<String, dynamic>)
          : null,
      storeFormat:
          (json['storeFormat'] as String?)?.let(StoreFormat.fromString),
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
      'status': status.value,
      'versionName': versionName,
      if (reference != null) 'reference': reference,
      if (storeFormat != null) 'storeFormat': storeFormat.value,
      if (storeOptions != null) 'storeOptions': storeOptions,
    };
  }
}

/// @nodoc
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
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      description: (json['description'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      numVersions: (json['numVersions'] as int?) ?? 0,
      reference: ReferenceItem.fromJson(
          (json['reference'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      sseConfig: SseConfig.fromJson(
          (json['sseConfig'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      status: StoreStatus.fromString((json['status'] as String?) ?? ''),
      statusMessage: (json['statusMessage'] as String?) ?? '',
      storeArn: (json['storeArn'] as String?) ?? '',
      storeSizeBytes: (json['storeSizeBytes'] as int?) ?? 0,
      tags:
          ((json['tags'] as Map<String, dynamic>?) ?? const <String, dynamic>{})
              .map((k, e) => MapEntry(k, e as String)),
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
      storeFormat:
          (json['storeFormat'] as String?)?.let(StoreFormat.fromString),
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
      'status': status.value,
      'statusMessage': statusMessage,
      'storeArn': storeArn,
      'storeSizeBytes': storeSizeBytes,
      'tags': tags,
      'updateTime': iso8601ToJson(updateTime),
      if (storeFormat != null) 'storeFormat': storeFormat.value,
      if (storeOptions != null) 'storeOptions': storeOptions,
    };
  }
}

/// @nodoc
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
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      description: (json['description'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      reference: ReferenceItem.fromJson(
          (json['reference'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      status: StoreStatus.fromString((json['status'] as String?) ?? ''),
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
      storeFormat:
          (json['storeFormat'] as String?)?.let(StoreFormat.fromString),
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
      'status': status.value,
      'updateTime': iso8601ToJson(updateTime),
      if (storeFormat != null) 'storeFormat': storeFormat.value,
      if (storeOptions != null) 'storeOptions': storeOptions,
    };
  }
}

/// @nodoc
class DeleteAnnotationStoreResponse {
  /// The store's status.
  final StoreStatus status;

  DeleteAnnotationStoreResponse({
    required this.status,
  });

  factory DeleteAnnotationStoreResponse.fromJson(Map<String, dynamic> json) {
    return DeleteAnnotationStoreResponse(
      status: StoreStatus.fromString((json['status'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      'status': status.value,
    };
  }
}

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
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
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      status: VersionStatus.fromString((json['status'] as String?) ?? ''),
      storeId: (json['storeId'] as String?) ?? '',
      versionName: (json['versionName'] as String?) ?? '',
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
      'status': status.value,
      'storeId': storeId,
      'versionName': versionName,
      if (versionOptions != null) 'versionOptions': versionOptions,
    };
  }
}

/// @nodoc
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
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      description: (json['description'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      status: VersionStatus.fromString((json['status'] as String?) ?? ''),
      statusMessage: (json['statusMessage'] as String?) ?? '',
      storeId: (json['storeId'] as String?) ?? '',
      tags:
          ((json['tags'] as Map<String, dynamic>?) ?? const <String, dynamic>{})
              .map((k, e) => MapEntry(k, e as String)),
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
      versionArn: (json['versionArn'] as String?) ?? '',
      versionName: (json['versionName'] as String?) ?? '',
      versionSizeBytes: (json['versionSizeBytes'] as int?) ?? 0,
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
      'status': status.value,
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

/// @nodoc
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
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      description: (json['description'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      status: VersionStatus.fromString((json['status'] as String?) ?? ''),
      storeId: (json['storeId'] as String?) ?? '',
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
      versionName: (json['versionName'] as String?) ?? '',
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
      'status': status.value,
      'storeId': storeId,
      'updateTime': iso8601ToJson(updateTime),
      'versionName': versionName,
    };
  }
}

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
class CreateConfigurationResponse {
  /// Unique resource identifier for the configuration.
  final String? arn;

  /// Configuration creation timestamp.
  final DateTime? creationTime;

  /// Description for the configuration.
  final String? description;

  /// User-friendly name for the configuration.
  final String? name;

  /// Run-specific configurations.
  final RunConfigurationsResponse? runConfigurations;

  /// Current configuration status.
  final ConfigurationStatus? status;

  /// Tags for the configuration.
  final Map<String, String>? tags;

  /// Unique identifier for the configuration.
  final String? uuid;

  CreateConfigurationResponse({
    this.arn,
    this.creationTime,
    this.description,
    this.name,
    this.runConfigurations,
    this.status,
    this.tags,
    this.uuid,
  });

  factory CreateConfigurationResponse.fromJson(Map<String, dynamic> json) {
    return CreateConfigurationResponse(
      arn: json['arn'] as String?,
      creationTime: timeStampFromJson(json['creationTime']),
      description: json['description'] as String?,
      name: json['name'] as String?,
      runConfigurations: json['runConfigurations'] != null
          ? RunConfigurationsResponse.fromJson(
              json['runConfigurations'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)?.let(ConfigurationStatus.fromString),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      uuid: json['uuid'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final description = this.description;
    final name = this.name;
    final runConfigurations = this.runConfigurations;
    final status = this.status;
    final tags = this.tags;
    final uuid = this.uuid;
    return {
      if (arn != null) 'arn': arn,
      if (creationTime != null) 'creationTime': iso8601ToJson(creationTime),
      if (description != null) 'description': description,
      if (name != null) 'name': name,
      if (runConfigurations != null) 'runConfigurations': runConfigurations,
      if (status != null) 'status': status.value,
      if (tags != null) 'tags': tags,
      if (uuid != null) 'uuid': uuid,
    };
  }
}

/// @nodoc
class GetConfigurationResponse {
  /// Unique resource identifier for the configuration.
  final String? arn;

  /// Configuration creation timestamp.
  final DateTime? creationTime;

  /// Description for the configuration.
  final String? description;

  /// User-friendly name for the configuration.
  final String? name;

  /// Run-specific configurations.
  final RunConfigurationsResponse? runConfigurations;

  /// Current configuration status.
  final ConfigurationStatus? status;

  /// Tags for the configuration.
  final Map<String, String>? tags;

  /// Unique identifier for the configuration.
  final String? uuid;

  GetConfigurationResponse({
    this.arn,
    this.creationTime,
    this.description,
    this.name,
    this.runConfigurations,
    this.status,
    this.tags,
    this.uuid,
  });

  factory GetConfigurationResponse.fromJson(Map<String, dynamic> json) {
    return GetConfigurationResponse(
      arn: json['arn'] as String?,
      creationTime: timeStampFromJson(json['creationTime']),
      description: json['description'] as String?,
      name: json['name'] as String?,
      runConfigurations: json['runConfigurations'] != null
          ? RunConfigurationsResponse.fromJson(
              json['runConfigurations'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)?.let(ConfigurationStatus.fromString),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      uuid: json['uuid'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final description = this.description;
    final name = this.name;
    final runConfigurations = this.runConfigurations;
    final status = this.status;
    final tags = this.tags;
    final uuid = this.uuid;
    return {
      if (arn != null) 'arn': arn,
      if (creationTime != null) 'creationTime': iso8601ToJson(creationTime),
      if (description != null) 'description': description,
      if (name != null) 'name': name,
      if (runConfigurations != null) 'runConfigurations': runConfigurations,
      if (status != null) 'status': status.value,
      if (tags != null) 'tags': tags,
      if (uuid != null) 'uuid': uuid,
    };
  }
}

/// @nodoc
class ListConfigurationsResponse {
  /// List of configuration items.
  final List<ConfigurationListItem>? items;

  /// Token for retrieving next page of results.
  final String? nextToken;

  ListConfigurationsResponse({
    this.items,
    this.nextToken,
  });

  factory ListConfigurationsResponse.fromJson(Map<String, dynamic> json) {
    return ListConfigurationsResponse(
      items: (json['items'] as List?)
          ?.nonNulls
          .map((e) => ConfigurationListItem.fromJson(e as Map<String, dynamic>))
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
      arn: (json['arn'] as String?) ?? '',
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      id: (json['id'] as String?) ?? '',
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

/// @nodoc
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
      arn: (json['arn'] as String?) ?? '',
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      id: (json['id'] as String?) ?? '',
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

/// @nodoc
class DeleteReferenceStoreResponse {
  DeleteReferenceStoreResponse();

  factory DeleteReferenceStoreResponse.fromJson(Map<String, dynamic> _) {
    return DeleteReferenceStoreResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
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
      referenceStores: ((json['referenceStores'] as List?) ?? const [])
          .nonNulls
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

/// @nodoc
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
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      id: (json['id'] as String?) ?? '',
      referenceStoreId: (json['referenceStoreId'] as String?) ?? '',
      roleArn: (json['roleArn'] as String?) ?? '',
      sources: ((json['sources'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              ImportReferenceSourceItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: ReferenceImportJobStatus.fromString(
          (json['status'] as String?) ?? ''),
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
      'status': status.value,
      if (completionTime != null)
        'completionTime': iso8601ToJson(completionTime),
      if (statusMessage != null) 'statusMessage': statusMessage,
    };
  }
}

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
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
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      id: (json['id'] as String?) ?? '',
      referenceStoreId: (json['referenceStoreId'] as String?) ?? '',
      roleArn: (json['roleArn'] as String?) ?? '',
      status: ReferenceImportJobStatus.fromString(
          (json['status'] as String?) ?? ''),
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
      'status': status.value,
    };
  }
}

/// @nodoc
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

  /// The reference's creation job ID.
  final String? creationJobId;

  /// The reference's creation type.
  final ReferenceCreationType? creationType;

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
    this.creationJobId,
    this.creationType,
    this.description,
    this.files,
    this.name,
    this.status,
  });

  factory GetReferenceMetadataResponse.fromJson(Map<String, dynamic> json) {
    return GetReferenceMetadataResponse(
      arn: (json['arn'] as String?) ?? '',
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      id: (json['id'] as String?) ?? '',
      md5: (json['md5'] as String?) ?? '',
      referenceStoreId: (json['referenceStoreId'] as String?) ?? '',
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
      creationJobId: json['creationJobId'] as String?,
      creationType: (json['creationType'] as String?)
          ?.let(ReferenceCreationType.fromString),
      description: json['description'] as String?,
      files: json['files'] != null
          ? ReferenceFiles.fromJson(json['files'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      status: (json['status'] as String?)?.let(ReferenceStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final id = this.id;
    final md5 = this.md5;
    final referenceStoreId = this.referenceStoreId;
    final updateTime = this.updateTime;
    final creationJobId = this.creationJobId;
    final creationType = this.creationType;
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
      if (creationJobId != null) 'creationJobId': creationJobId,
      if (creationType != null) 'creationType': creationType.value,
      if (description != null) 'description': description,
      if (files != null) 'files': files,
      if (name != null) 'name': name,
      if (status != null) 'status': status.value,
    };
  }
}

/// @nodoc
class DeleteReferenceResponse {
  DeleteReferenceResponse();

  factory DeleteReferenceResponse.fromJson(Map<String, dynamic> _) {
    return DeleteReferenceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
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
      references: ((json['references'] as List?) ?? const [])
          .nonNulls
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

/// @nodoc
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

/// @nodoc
class StartRunBatchResponse {
  /// The unique ARN of the run batch.
  final String? arn;

  /// The identifier portion of the run batch ARN.
  final String? id;

  /// The initial status of the run batch. Returns <code>CREATING</code> while the
  /// batch is being initialized.
  final BatchStatus? status;

  /// AWS tags associated with the run batch.
  final Map<String, String>? tags;

  /// The universally unique identifier (UUID) for the run batch.
  final String? uuid;

  StartRunBatchResponse({
    this.arn,
    this.id,
    this.status,
    this.tags,
    this.uuid,
  });

  factory StartRunBatchResponse.fromJson(Map<String, dynamic> json) {
    return StartRunBatchResponse(
      arn: json['arn'] as String?,
      id: json['id'] as String?,
      status: (json['status'] as String?)?.let(BatchStatus.fromString),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      uuid: json['uuid'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final status = this.status;
    final tags = this.tags;
    final uuid = this.uuid;
    return {
      if (arn != null) 'arn': arn,
      if (id != null) 'id': id,
      if (status != null) 'status': status.value,
      if (tags != null) 'tags': tags,
      if (uuid != null) 'uuid': uuid,
    };
  }
}

/// @nodoc
class GetBatchResponse {
  /// The unique ARN of the run batch.
  final String? arn;

  /// The timestamp when the batch was created.
  final DateTime? creationTime;

  /// The shared configuration applied to all runs in the batch. See
  /// <code>DefaultRunSetting</code>.
  final DefaultRunSetting? defaultRunSetting;

  /// The timestamp when the batch transitioned to a <code>FAILED</code> status.
  final DateTime? failedTime;

  /// A description of the batch failure. Present only when status is
  /// <code>FAILED</code>.
  final String? failureReason;

  /// The identifier portion of the run batch ARN.
  final String? id;

  /// The optional user-friendly name of the batch.
  final String? name;

  /// The timestamp when all run executions completed.
  final DateTime? processedTime;

  /// A summary of run execution states. Run execution counts are eventually
  /// consistent and may lag behind actual run states. Final counts are accurate
  /// once the batch reaches <code>PROCESSED</code> status. See
  /// <code>RunSummary</code>.
  final RunSummary? runSummary;

  /// The current status of the run batch. Possible values: <code>CREATING</code>
  /// (initial setup), <code>PENDING</code> (ready to submit runs),
  /// <code>SUBMITTING</code> (submitting runs), <code>INPROGRESS</code> (runs
  /// executing), <code>STOPPING</code> (cancellation in progress),
  /// <code>PROCESSED</code> (all runs completed), <code>CANCELLED</code> (batch
  /// cancelled), <code>FAILED</code> (batch failed), <code>RUNS_DELETING</code>
  /// (deleting runs), <code>RUNS_DELETED</code> (runs deleted).
  final BatchStatus? status;

  /// A summary of run submission outcomes. See <code>SubmissionSummary</code>.
  final SubmissionSummary? submissionSummary;

  /// The timestamp when all run submissions completed.
  final DateTime? submittedTime;

  /// AWS tags associated with the run batch.
  final Map<String, String>? tags;

  /// The total number of runs in the batch.
  final int? totalRuns;

  /// The universally unique identifier (UUID) for the run batch.
  final String? uuid;

  GetBatchResponse({
    this.arn,
    this.creationTime,
    this.defaultRunSetting,
    this.failedTime,
    this.failureReason,
    this.id,
    this.name,
    this.processedTime,
    this.runSummary,
    this.status,
    this.submissionSummary,
    this.submittedTime,
    this.tags,
    this.totalRuns,
    this.uuid,
  });

  factory GetBatchResponse.fromJson(Map<String, dynamic> json) {
    return GetBatchResponse(
      arn: json['arn'] as String?,
      creationTime: timeStampFromJson(json['creationTime']),
      defaultRunSetting: json['defaultRunSetting'] != null
          ? DefaultRunSetting.fromJson(
              json['defaultRunSetting'] as Map<String, dynamic>)
          : null,
      failedTime: timeStampFromJson(json['failedTime']),
      failureReason: json['failureReason'] as String?,
      id: json['id'] as String?,
      name: json['name'] as String?,
      processedTime: timeStampFromJson(json['processedTime']),
      runSummary: json['runSummary'] != null
          ? RunSummary.fromJson(json['runSummary'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)?.let(BatchStatus.fromString),
      submissionSummary: json['submissionSummary'] != null
          ? SubmissionSummary.fromJson(
              json['submissionSummary'] as Map<String, dynamic>)
          : null,
      submittedTime: timeStampFromJson(json['submittedTime']),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      totalRuns: json['totalRuns'] as int?,
      uuid: json['uuid'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final defaultRunSetting = this.defaultRunSetting;
    final failedTime = this.failedTime;
    final failureReason = this.failureReason;
    final id = this.id;
    final name = this.name;
    final processedTime = this.processedTime;
    final runSummary = this.runSummary;
    final status = this.status;
    final submissionSummary = this.submissionSummary;
    final submittedTime = this.submittedTime;
    final tags = this.tags;
    final totalRuns = this.totalRuns;
    final uuid = this.uuid;
    return {
      if (arn != null) 'arn': arn,
      if (creationTime != null) 'creationTime': iso8601ToJson(creationTime),
      if (defaultRunSetting != null) 'defaultRunSetting': defaultRunSetting,
      if (failedTime != null) 'failedTime': iso8601ToJson(failedTime),
      if (failureReason != null) 'failureReason': failureReason,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (processedTime != null) 'processedTime': iso8601ToJson(processedTime),
      if (runSummary != null) 'runSummary': runSummary,
      if (status != null) 'status': status.value,
      if (submissionSummary != null) 'submissionSummary': submissionSummary,
      if (submittedTime != null) 'submittedTime': iso8601ToJson(submittedTime),
      if (tags != null) 'tags': tags,
      if (totalRuns != null) 'totalRuns': totalRuns,
      if (uuid != null) 'uuid': uuid,
    };
  }
}

/// @nodoc
class ListBatchResponse {
  /// A list of batch summary objects. See <code>BatchListItem</code>.
  final List<BatchListItem>? items;

  /// A pagination token to retrieve the next page of results. Absent when no
  /// further results are available.
  final String? nextToken;

  ListBatchResponse({
    this.items,
    this.nextToken,
  });

  factory ListBatchResponse.fromJson(Map<String, dynamic> json) {
    return ListBatchResponse(
      items: (json['items'] as List?)
          ?.nonNulls
          .map((e) => BatchListItem.fromJson(e as Map<String, dynamic>))
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
class CancelRunBatchResponse {
  CancelRunBatchResponse();

  factory CancelRunBatchResponse.fromJson(Map<String, dynamic> _) {
    return CancelRunBatchResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class DeleteRunBatchResponse {
  DeleteRunBatchResponse();

  factory DeleteRunBatchResponse.fromJson(Map<String, dynamic> _) {
    return DeleteRunBatchResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class ListRunsInBatchResponse {
  /// A pagination token to retrieve the next page of results. Absent when the
  /// last run has been returned.
  final String? nextToken;

  /// A list of run entries in the batch. See <code>RunBatchListItem</code>.
  final List<RunBatchListItem>? runs;

  ListRunsInBatchResponse({
    this.nextToken,
    this.runs,
  });

  factory ListRunsInBatchResponse.fromJson(Map<String, dynamic> json) {
    return ListRunsInBatchResponse(
      nextToken: json['nextToken'] as String?,
      runs: (json['runs'] as List?)
          ?.nonNulls
          .map((e) => RunBatchListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final runs = this.runs;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (runs != null) 'runs': runs,
    };
  }
}

/// @nodoc
class CreateRunCacheResponse {
  /// Unique resource identifier for the run cache.
  final String? arn;

  /// Identifier for the run cache.
  final String? id;

  /// Run cache status.
  final RunCacheStatus? status;

  /// The tags associated with this run cache.
  final Map<String, String>? tags;

  CreateRunCacheResponse({
    this.arn,
    this.id,
    this.status,
    this.tags,
  });

  factory CreateRunCacheResponse.fromJson(Map<String, dynamic> json) {
    return CreateRunCacheResponse(
      arn: json['arn'] as String?,
      id: json['id'] as String?,
      status: (json['status'] as String?)?.let(RunCacheStatus.fromString),
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
      if (status != null) 'status': status.value,
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
class GetRunCacheResponse {
  /// Unique resource identifier for the run cache.
  final String? arn;

  /// The default cache behavior for runs using this cache.
  final CacheBehavior? cacheBehavior;

  /// The identifier of the bucket owner.
  final String? cacheBucketOwnerId;

  /// The S3 URI where the cache data is stored.
  final String? cacheS3Uri;

  /// Creation time of the run cache (an ISO 8601 formatted string).
  final DateTime? creationTime;

  /// The run cache description.
  final String? description;

  /// The run cache ID.
  final String? id;

  /// The run cache name.
  final String? name;

  /// The run cache status.
  final RunCacheStatus? status;

  /// The tags associated with the run cache.
  final Map<String, String>? tags;

  GetRunCacheResponse({
    this.arn,
    this.cacheBehavior,
    this.cacheBucketOwnerId,
    this.cacheS3Uri,
    this.creationTime,
    this.description,
    this.id,
    this.name,
    this.status,
    this.tags,
  });

  factory GetRunCacheResponse.fromJson(Map<String, dynamic> json) {
    return GetRunCacheResponse(
      arn: json['arn'] as String?,
      cacheBehavior:
          (json['cacheBehavior'] as String?)?.let(CacheBehavior.fromString),
      cacheBucketOwnerId: json['cacheBucketOwnerId'] as String?,
      cacheS3Uri: json['cacheS3Uri'] as String?,
      creationTime: timeStampFromJson(json['creationTime']),
      description: json['description'] as String?,
      id: json['id'] as String?,
      name: json['name'] as String?,
      status: (json['status'] as String?)?.let(RunCacheStatus.fromString),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final cacheBehavior = this.cacheBehavior;
    final cacheBucketOwnerId = this.cacheBucketOwnerId;
    final cacheS3Uri = this.cacheS3Uri;
    final creationTime = this.creationTime;
    final description = this.description;
    final id = this.id;
    final name = this.name;
    final status = this.status;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (cacheBehavior != null) 'cacheBehavior': cacheBehavior.value,
      if (cacheBucketOwnerId != null) 'cacheBucketOwnerId': cacheBucketOwnerId,
      if (cacheS3Uri != null) 'cacheS3Uri': cacheS3Uri,
      if (creationTime != null) 'creationTime': iso8601ToJson(creationTime),
      if (description != null) 'description': description,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (status != null) 'status': status.value,
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
class ListRunCachesResponse {
  /// Details about each run cache in the response.
  final List<RunCacheListItem>? items;

  /// Pagination token to retrieve additional run caches. If the response does not
  /// have a <code>nextToken</code>value, you have reached to the end of the list.
  final String? nextToken;

  ListRunCachesResponse({
    this.items,
    this.nextToken,
  });

  factory ListRunCachesResponse.fromJson(Map<String, dynamic> json) {
    return ListRunCachesResponse(
      items: (json['items'] as List?)
          ?.nonNulls
          .map((e) => RunCacheListItem.fromJson(e as Map<String, dynamic>))
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

/// @nodoc
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

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
class StartRunResponse {
  /// Unique resource identifier for the run.
  final String? arn;

  /// Configuration details for the workflow run.
  final ConfigurationDetails? configuration;

  /// The run's ID.
  final String? id;

  /// Networking mode for the workflow run.
  final String? networkingMode;

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
    this.configuration,
    this.id,
    this.networkingMode,
    this.runOutputUri,
    this.status,
    this.tags,
    this.uuid,
  });

  factory StartRunResponse.fromJson(Map<String, dynamic> json) {
    return StartRunResponse(
      arn: json['arn'] as String?,
      configuration: json['configuration'] != null
          ? ConfigurationDetails.fromJson(
              json['configuration'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
      networkingMode: json['networkingMode'] as String?,
      runOutputUri: json['runOutputUri'] as String?,
      status: (json['status'] as String?)?.let(RunStatus.fromString),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      uuid: json['uuid'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final configuration = this.configuration;
    final id = this.id;
    final networkingMode = this.networkingMode;
    final runOutputUri = this.runOutputUri;
    final status = this.status;
    final tags = this.tags;
    final uuid = this.uuid;
    return {
      if (arn != null) 'arn': arn,
      if (configuration != null) 'configuration': configuration,
      if (id != null) 'id': id,
      if (networkingMode != null) 'networkingMode': networkingMode,
      if (runOutputUri != null) 'runOutputUri': runOutputUri,
      if (status != null) 'status': status.value,
      if (tags != null) 'tags': tags,
      if (uuid != null) 'uuid': uuid,
    };
  }
}

/// @nodoc
class GetRunResponse {
  /// The computational accelerator used to run the workflow.
  final Accelerators? accelerators;

  /// The run's ARN.
  final String? arn;

  /// The run's batch ID.
  final String? batchId;

  /// The run cache behavior for the run.
  final CacheBehavior? cacheBehavior;

  /// The run cache associated with the run.
  final String? cacheId;

  /// Configuration details for the workflow run.
  final ConfigurationDetails? configuration;

  /// When the run was created.
  final DateTime? creationTime;

  /// The run's definition.
  final String? definition;

  /// The run's digest.
  final String? digest;

  /// The engine-specific settings for the workflow run.
  final Object? engineSettings;

  /// The actual Nextflow engine version that Amazon Web Services HealthOmics used
  /// for the run. The other workflow definition languages don't provide a value
  /// for this field.
  final String? engineVersion;

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

  /// Configuration for run networking behavior. If absent, this will default to
  /// RESTRICTED.
  final NetworkingMode? networkingMode;

  /// The run's output URI.
  final String? outputUri;

  /// The run's parameters.
  final Object? parameters;

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

  /// VPC configuration for the workflow run.
  final VpcConfigResponse? vpcConfig;

  /// The run's workflow ID.
  final String? workflowId;

  /// The ID of the workflow owner.
  final String? workflowOwnerId;

  /// The run's workflow type.
  final WorkflowType? workflowType;

  /// The universally unique identifier (UUID) value for the workflow.
  final String? workflowUuid;

  /// The workflow version name.
  final String? workflowVersionName;

  GetRunResponse({
    this.accelerators,
    this.arn,
    this.batchId,
    this.cacheBehavior,
    this.cacheId,
    this.configuration,
    this.creationTime,
    this.definition,
    this.digest,
    this.engineSettings,
    this.engineVersion,
    this.failureReason,
    this.id,
    this.logLevel,
    this.logLocation,
    this.name,
    this.networkingMode,
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
    this.vpcConfig,
    this.workflowId,
    this.workflowOwnerId,
    this.workflowType,
    this.workflowUuid,
    this.workflowVersionName,
  });

  factory GetRunResponse.fromJson(Map<String, dynamic> json) {
    return GetRunResponse(
      accelerators:
          (json['accelerators'] as String?)?.let(Accelerators.fromString),
      arn: json['arn'] as String?,
      batchId: json['batchId'] as String?,
      cacheBehavior:
          (json['cacheBehavior'] as String?)?.let(CacheBehavior.fromString),
      cacheId: json['cacheId'] as String?,
      configuration: json['configuration'] != null
          ? ConfigurationDetails.fromJson(
              json['configuration'] as Map<String, dynamic>)
          : null,
      creationTime: timeStampFromJson(json['creationTime']),
      definition: json['definition'] as String?,
      digest: json['digest'] as String?,
      engineSettings: json['engineSettings'],
      engineVersion: json['engineVersion'] as String?,
      failureReason: json['failureReason'] as String?,
      id: json['id'] as String?,
      logLevel: (json['logLevel'] as String?)?.let(RunLogLevel.fromString),
      logLocation: json['logLocation'] != null
          ? RunLogLocation.fromJson(json['logLocation'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      networkingMode:
          (json['networkingMode'] as String?)?.let(NetworkingMode.fromString),
      outputUri: json['outputUri'] as String?,
      parameters: json['parameters'],
      priority: json['priority'] as int?,
      resourceDigests: (json['resourceDigests'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      retentionMode:
          (json['retentionMode'] as String?)?.let(RunRetentionMode.fromString),
      roleArn: json['roleArn'] as String?,
      runGroupId: json['runGroupId'] as String?,
      runId: json['runId'] as String?,
      runOutputUri: json['runOutputUri'] as String?,
      startTime: timeStampFromJson(json['startTime']),
      startedBy: json['startedBy'] as String?,
      status: (json['status'] as String?)?.let(RunStatus.fromString),
      statusMessage: json['statusMessage'] as String?,
      stopTime: timeStampFromJson(json['stopTime']),
      storageCapacity: json['storageCapacity'] as int?,
      storageType:
          (json['storageType'] as String?)?.let(StorageType.fromString),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      uuid: json['uuid'] as String?,
      vpcConfig: json['vpcConfig'] != null
          ? VpcConfigResponse.fromJson(
              json['vpcConfig'] as Map<String, dynamic>)
          : null,
      workflowId: json['workflowId'] as String?,
      workflowOwnerId: json['workflowOwnerId'] as String?,
      workflowType:
          (json['workflowType'] as String?)?.let(WorkflowType.fromString),
      workflowUuid: json['workflowUuid'] as String?,
      workflowVersionName: json['workflowVersionName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accelerators = this.accelerators;
    final arn = this.arn;
    final batchId = this.batchId;
    final cacheBehavior = this.cacheBehavior;
    final cacheId = this.cacheId;
    final configuration = this.configuration;
    final creationTime = this.creationTime;
    final definition = this.definition;
    final digest = this.digest;
    final engineSettings = this.engineSettings;
    final engineVersion = this.engineVersion;
    final failureReason = this.failureReason;
    final id = this.id;
    final logLevel = this.logLevel;
    final logLocation = this.logLocation;
    final name = this.name;
    final networkingMode = this.networkingMode;
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
    final vpcConfig = this.vpcConfig;
    final workflowId = this.workflowId;
    final workflowOwnerId = this.workflowOwnerId;
    final workflowType = this.workflowType;
    final workflowUuid = this.workflowUuid;
    final workflowVersionName = this.workflowVersionName;
    return {
      if (accelerators != null) 'accelerators': accelerators.value,
      if (arn != null) 'arn': arn,
      if (batchId != null) 'batchId': batchId,
      if (cacheBehavior != null) 'cacheBehavior': cacheBehavior.value,
      if (cacheId != null) 'cacheId': cacheId,
      if (configuration != null) 'configuration': configuration,
      if (creationTime != null) 'creationTime': iso8601ToJson(creationTime),
      if (definition != null) 'definition': definition,
      if (digest != null) 'digest': digest,
      if (engineSettings != null) 'engineSettings': engineSettings,
      if (engineVersion != null) 'engineVersion': engineVersion,
      if (failureReason != null) 'failureReason': failureReason,
      if (id != null) 'id': id,
      if (logLevel != null) 'logLevel': logLevel.value,
      if (logLocation != null) 'logLocation': logLocation,
      if (name != null) 'name': name,
      if (networkingMode != null) 'networkingMode': networkingMode.value,
      if (outputUri != null) 'outputUri': outputUri,
      if (parameters != null) 'parameters': parameters,
      if (priority != null) 'priority': priority,
      if (resourceDigests != null) 'resourceDigests': resourceDigests,
      if (retentionMode != null) 'retentionMode': retentionMode.value,
      if (roleArn != null) 'roleArn': roleArn,
      if (runGroupId != null) 'runGroupId': runGroupId,
      if (runId != null) 'runId': runId,
      if (runOutputUri != null) 'runOutputUri': runOutputUri,
      if (startTime != null) 'startTime': iso8601ToJson(startTime),
      if (startedBy != null) 'startedBy': startedBy,
      if (status != null) 'status': status.value,
      if (statusMessage != null) 'statusMessage': statusMessage,
      if (stopTime != null) 'stopTime': iso8601ToJson(stopTime),
      if (storageCapacity != null) 'storageCapacity': storageCapacity,
      if (storageType != null) 'storageType': storageType.value,
      if (tags != null) 'tags': tags,
      if (uuid != null) 'uuid': uuid,
      if (vpcConfig != null) 'vpcConfig': vpcConfig,
      if (workflowId != null) 'workflowId': workflowId,
      if (workflowOwnerId != null) 'workflowOwnerId': workflowOwnerId,
      if (workflowType != null) 'workflowType': workflowType.value,
      if (workflowUuid != null) 'workflowUuid': workflowUuid,
      if (workflowVersionName != null)
        'workflowVersionName': workflowVersionName,
    };
  }
}

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
class GetRunTaskResponse {
  /// Set to true if Amazon Web Services HealthOmics found a matching entry in the
  /// run cache for this task.
  final bool? cacheHit;

  /// The S3 URI of the cache location.
  final String? cacheS3Uri;

  /// The task's CPU usage.
  final int? cpus;

  /// When the task was created.
  final DateTime? creationTime;

  /// The reason a task has failed.
  final String? failureReason;

  /// The number of Graphics Processing Units (GPU) specified in the task.
  final int? gpus;

  /// Details about the container image that this task uses.
  final ImageDetails? imageDetails;

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
    this.cacheHit,
    this.cacheS3Uri,
    this.cpus,
    this.creationTime,
    this.failureReason,
    this.gpus,
    this.imageDetails,
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
      cacheHit: json['cacheHit'] as bool?,
      cacheS3Uri: json['cacheS3Uri'] as String?,
      cpus: json['cpus'] as int?,
      creationTime: timeStampFromJson(json['creationTime']),
      failureReason: json['failureReason'] as String?,
      gpus: json['gpus'] as int?,
      imageDetails: json['imageDetails'] != null
          ? ImageDetails.fromJson(json['imageDetails'] as Map<String, dynamic>)
          : null,
      instanceType: json['instanceType'] as String?,
      logStream: json['logStream'] as String?,
      memory: json['memory'] as int?,
      name: json['name'] as String?,
      startTime: timeStampFromJson(json['startTime']),
      status: (json['status'] as String?)?.let(TaskStatus.fromString),
      statusMessage: json['statusMessage'] as String?,
      stopTime: timeStampFromJson(json['stopTime']),
      taskId: json['taskId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cacheHit = this.cacheHit;
    final cacheS3Uri = this.cacheS3Uri;
    final cpus = this.cpus;
    final creationTime = this.creationTime;
    final failureReason = this.failureReason;
    final gpus = this.gpus;
    final imageDetails = this.imageDetails;
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
      if (cacheHit != null) 'cacheHit': cacheHit,
      if (cacheS3Uri != null) 'cacheS3Uri': cacheS3Uri,
      if (cpus != null) 'cpus': cpus,
      if (creationTime != null) 'creationTime': iso8601ToJson(creationTime),
      if (failureReason != null) 'failureReason': failureReason,
      if (gpus != null) 'gpus': gpus,
      if (imageDetails != null) 'imageDetails': imageDetails,
      if (instanceType != null) 'instanceType': instanceType,
      if (logStream != null) 'logStream': logStream,
      if (memory != null) 'memory': memory,
      if (name != null) 'name': name,
      if (startTime != null) 'startTime': iso8601ToJson(startTime),
      if (status != null) 'status': status.value,
      if (statusMessage != null) 'statusMessage': statusMessage,
      if (stopTime != null) 'stopTime': iso8601ToJson(stopTime),
      if (taskId != null) 'taskId': taskId,
    };
  }
}

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
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

  /// The tags keys to propagate to the S3 objects associated with read sets in
  /// the sequence store.
  final List<String>? propagatedSetLevelTags;
  final SequenceStoreS3Access? s3Access;

  /// Server-side encryption (SSE) settings for the store. This contains the KMS
  /// key ARN that is used to encrypt read set objects.
  final SseConfig? sseConfig;

  /// The status of the sequence store.
  final SequenceStoreStatus? status;

  /// The status message of the sequence store.
  final String? statusMessage;

  CreateSequenceStoreResponse({
    required this.arn,
    required this.creationTime,
    required this.id,
    this.description,
    this.eTagAlgorithmFamily,
    this.fallbackLocation,
    this.name,
    this.propagatedSetLevelTags,
    this.s3Access,
    this.sseConfig,
    this.status,
    this.statusMessage,
  });

  factory CreateSequenceStoreResponse.fromJson(Map<String, dynamic> json) {
    return CreateSequenceStoreResponse(
      arn: (json['arn'] as String?) ?? '',
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      id: (json['id'] as String?) ?? '',
      description: json['description'] as String?,
      eTagAlgorithmFamily: (json['eTagAlgorithmFamily'] as String?)
          ?.let(ETagAlgorithmFamily.fromString),
      fallbackLocation: json['fallbackLocation'] as String?,
      name: json['name'] as String?,
      propagatedSetLevelTags: (json['propagatedSetLevelTags'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      s3Access: json['s3Access'] != null
          ? SequenceStoreS3Access.fromJson(
              json['s3Access'] as Map<String, dynamic>)
          : null,
      sseConfig: json['sseConfig'] != null
          ? SseConfig.fromJson(json['sseConfig'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)?.let(SequenceStoreStatus.fromString),
      statusMessage: json['statusMessage'] as String?,
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
    final propagatedSetLevelTags = this.propagatedSetLevelTags;
    final s3Access = this.s3Access;
    final sseConfig = this.sseConfig;
    final status = this.status;
    final statusMessage = this.statusMessage;
    return {
      'arn': arn,
      'creationTime': iso8601ToJson(creationTime),
      'id': id,
      if (description != null) 'description': description,
      if (eTagAlgorithmFamily != null)
        'eTagAlgorithmFamily': eTagAlgorithmFamily.value,
      if (fallbackLocation != null) 'fallbackLocation': fallbackLocation,
      if (name != null) 'name': name,
      if (propagatedSetLevelTags != null)
        'propagatedSetLevelTags': propagatedSetLevelTags,
      if (s3Access != null) 's3Access': s3Access,
      if (sseConfig != null) 'sseConfig': sseConfig,
      if (status != null) 'status': status.value,
      if (statusMessage != null) 'statusMessage': statusMessage,
    };
  }
}

/// @nodoc
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

  /// The tags keys to propagate to the S3 objects associated with read sets in
  /// the sequence store.
  final List<String>? propagatedSetLevelTags;

  /// The S3 metadata of a sequence store, including the ARN and S3 URI of the S3
  /// bucket.
  final SequenceStoreS3Access? s3Access;

  /// The store's server-side encryption (SSE) settings.
  final SseConfig? sseConfig;

  /// The status of the sequence store.
  final SequenceStoreStatus? status;

  /// The status message of the sequence store.
  final String? statusMessage;

  /// The last-updated time of the sequence store.
  final DateTime? updateTime;

  GetSequenceStoreResponse({
    required this.arn,
    required this.creationTime,
    required this.id,
    this.description,
    this.eTagAlgorithmFamily,
    this.fallbackLocation,
    this.name,
    this.propagatedSetLevelTags,
    this.s3Access,
    this.sseConfig,
    this.status,
    this.statusMessage,
    this.updateTime,
  });

  factory GetSequenceStoreResponse.fromJson(Map<String, dynamic> json) {
    return GetSequenceStoreResponse(
      arn: (json['arn'] as String?) ?? '',
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      id: (json['id'] as String?) ?? '',
      description: json['description'] as String?,
      eTagAlgorithmFamily: (json['eTagAlgorithmFamily'] as String?)
          ?.let(ETagAlgorithmFamily.fromString),
      fallbackLocation: json['fallbackLocation'] as String?,
      name: json['name'] as String?,
      propagatedSetLevelTags: (json['propagatedSetLevelTags'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      s3Access: json['s3Access'] != null
          ? SequenceStoreS3Access.fromJson(
              json['s3Access'] as Map<String, dynamic>)
          : null,
      sseConfig: json['sseConfig'] != null
          ? SseConfig.fromJson(json['sseConfig'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)?.let(SequenceStoreStatus.fromString),
      statusMessage: json['statusMessage'] as String?,
      updateTime: timeStampFromJson(json['updateTime']),
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
    final propagatedSetLevelTags = this.propagatedSetLevelTags;
    final s3Access = this.s3Access;
    final sseConfig = this.sseConfig;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final updateTime = this.updateTime;
    return {
      'arn': arn,
      'creationTime': iso8601ToJson(creationTime),
      'id': id,
      if (description != null) 'description': description,
      if (eTagAlgorithmFamily != null)
        'eTagAlgorithmFamily': eTagAlgorithmFamily.value,
      if (fallbackLocation != null) 'fallbackLocation': fallbackLocation,
      if (name != null) 'name': name,
      if (propagatedSetLevelTags != null)
        'propagatedSetLevelTags': propagatedSetLevelTags,
      if (s3Access != null) 's3Access': s3Access,
      if (sseConfig != null) 'sseConfig': sseConfig,
      if (status != null) 'status': status.value,
      if (statusMessage != null) 'statusMessage': statusMessage,
      if (updateTime != null) 'updateTime': iso8601ToJson(updateTime),
    };
  }
}

/// @nodoc
class UpdateSequenceStoreResponse {
  /// The ARN of the sequence store.
  final String arn;

  /// The time when the store was created.
  final DateTime creationTime;

  /// The ID of the sequence store.
  final String id;

  /// Description of the sequence store.
  final String? description;

  /// The ETag algorithm family to use on ingested read sets.
  final ETagAlgorithmFamily? eTagAlgorithmFamily;

  /// The S3 URI of a bucket and folder to store Read Sets that fail to upload.
  final String? fallbackLocation;

  /// The name of the sequence store.
  final String? name;

  /// The tags keys to propagate to the S3 objects associated with read sets in
  /// the sequence store.
  final List<String>? propagatedSetLevelTags;
  final SequenceStoreS3Access? s3Access;
  final SseConfig? sseConfig;

  /// The status of the sequence store.
  final SequenceStoreStatus? status;

  /// The status message of the sequence store.
  final String? statusMessage;

  /// The last-updated time of the Sequence Store.
  final DateTime? updateTime;

  UpdateSequenceStoreResponse({
    required this.arn,
    required this.creationTime,
    required this.id,
    this.description,
    this.eTagAlgorithmFamily,
    this.fallbackLocation,
    this.name,
    this.propagatedSetLevelTags,
    this.s3Access,
    this.sseConfig,
    this.status,
    this.statusMessage,
    this.updateTime,
  });

  factory UpdateSequenceStoreResponse.fromJson(Map<String, dynamic> json) {
    return UpdateSequenceStoreResponse(
      arn: (json['arn'] as String?) ?? '',
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      id: (json['id'] as String?) ?? '',
      description: json['description'] as String?,
      eTagAlgorithmFamily: (json['eTagAlgorithmFamily'] as String?)
          ?.let(ETagAlgorithmFamily.fromString),
      fallbackLocation: json['fallbackLocation'] as String?,
      name: json['name'] as String?,
      propagatedSetLevelTags: (json['propagatedSetLevelTags'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      s3Access: json['s3Access'] != null
          ? SequenceStoreS3Access.fromJson(
              json['s3Access'] as Map<String, dynamic>)
          : null,
      sseConfig: json['sseConfig'] != null
          ? SseConfig.fromJson(json['sseConfig'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)?.let(SequenceStoreStatus.fromString),
      statusMessage: json['statusMessage'] as String?,
      updateTime: timeStampFromJson(json['updateTime']),
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
    final propagatedSetLevelTags = this.propagatedSetLevelTags;
    final s3Access = this.s3Access;
    final sseConfig = this.sseConfig;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final updateTime = this.updateTime;
    return {
      'arn': arn,
      'creationTime': iso8601ToJson(creationTime),
      'id': id,
      if (description != null) 'description': description,
      if (eTagAlgorithmFamily != null)
        'eTagAlgorithmFamily': eTagAlgorithmFamily.value,
      if (fallbackLocation != null) 'fallbackLocation': fallbackLocation,
      if (name != null) 'name': name,
      if (propagatedSetLevelTags != null)
        'propagatedSetLevelTags': propagatedSetLevelTags,
      if (s3Access != null) 's3Access': s3Access,
      if (sseConfig != null) 'sseConfig': sseConfig,
      if (status != null) 'status': status.value,
      if (statusMessage != null) 'statusMessage': statusMessage,
      if (updateTime != null) 'updateTime': iso8601ToJson(updateTime),
    };
  }
}

/// @nodoc
class DeleteSequenceStoreResponse {
  DeleteSequenceStoreResponse();

  factory DeleteSequenceStoreResponse.fromJson(Map<String, dynamic> _) {
    return DeleteSequenceStoreResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
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
      sequenceStores: ((json['sequenceStores'] as List?) ?? const [])
          .nonNulls
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

/// @nodoc
class AbortMultipartReadSetUploadResponse {
  AbortMultipartReadSetUploadResponse();

  factory AbortMultipartReadSetUploadResponse.fromJson(Map<String, dynamic> _) {
    return AbortMultipartReadSetUploadResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class CompleteMultipartReadSetUploadResponse {
  /// The read set ID created for an uploaded read set.
  final String readSetId;

  CompleteMultipartReadSetUploadResponse({
    required this.readSetId,
  });

  factory CompleteMultipartReadSetUploadResponse.fromJson(
      Map<String, dynamic> json) {
    return CompleteMultipartReadSetUploadResponse(
      readSetId: (json['readSetId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final readSetId = this.readSetId;
    return {
      'readSetId': readSetId,
    };
  }
}

/// @nodoc
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
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      referenceArn: (json['referenceArn'] as String?) ?? '',
      sampleId: (json['sampleId'] as String?) ?? '',
      sequenceStoreId: (json['sequenceStoreId'] as String?) ?? '',
      sourceFileType:
          FileType.fromString((json['sourceFileType'] as String?) ?? ''),
      subjectId: (json['subjectId'] as String?) ?? '',
      uploadId: (json['uploadId'] as String?) ?? '',
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
      'sourceFileType': sourceFileType.value,
      'subjectId': subjectId,
      'uploadId': uploadId,
      if (description != null) 'description': description,
      if (generatedFrom != null) 'generatedFrom': generatedFrom,
      if (name != null) 'name': name,
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
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
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      id: (json['id'] as String?) ?? '',
      sequenceStoreId: (json['sequenceStoreId'] as String?) ?? '',
      status: ReadSetActivationJobStatus.fromString(
          (json['status'] as String?) ?? ''),
      completionTime: timeStampFromJson(json['completionTime']),
      sources: (json['sources'] as List?)
          ?.nonNulls
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
      'status': status.value,
      if (completionTime != null)
        'completionTime': iso8601ToJson(completionTime),
      if (sources != null) 'sources': sources,
      if (statusMessage != null) 'statusMessage': statusMessage,
    };
  }
}

/// @nodoc
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
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      destination: (json['destination'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      sequenceStoreId: (json['sequenceStoreId'] as String?) ?? '',
      status:
          ReadSetExportJobStatus.fromString((json['status'] as String?) ?? ''),
      completionTime: timeStampFromJson(json['completionTime']),
      readSets: (json['readSets'] as List?)
          ?.nonNulls
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
      'status': status.value,
      if (completionTime != null)
        'completionTime': iso8601ToJson(completionTime),
      if (readSets != null) 'readSets': readSets,
      if (statusMessage != null) 'statusMessage': statusMessage,
    };
  }
}

/// @nodoc
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
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      id: (json['id'] as String?) ?? '',
      roleArn: (json['roleArn'] as String?) ?? '',
      sequenceStoreId: (json['sequenceStoreId'] as String?) ?? '',
      sources: ((json['sources'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              ImportReadSetSourceItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      status:
          ReadSetImportJobStatus.fromString((json['status'] as String?) ?? ''),
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
      'status': status.value,
      if (completionTime != null)
        'completionTime': iso8601ToJson(completionTime),
      if (statusMessage != null) 'statusMessage': statusMessage,
    };
  }
}

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
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
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      id: (json['id'] as String?) ?? '',
      sequenceStoreId: (json['sequenceStoreId'] as String?) ?? '',
      status: ReadSetActivationJobStatus.fromString(
          (json['status'] as String?) ?? ''),
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
      'status': status.value,
    };
  }
}

/// @nodoc
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
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      destination: (json['destination'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      sequenceStoreId: (json['sequenceStoreId'] as String?) ?? '',
      status:
          ReadSetExportJobStatus.fromString((json['status'] as String?) ?? ''),
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
      'status': status.value,
    };
  }
}

/// @nodoc
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
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      id: (json['id'] as String?) ?? '',
      roleArn: (json['roleArn'] as String?) ?? '',
      sequenceStoreId: (json['sequenceStoreId'] as String?) ?? '',
      status:
          ReadSetImportJobStatus.fromString((json['status'] as String?) ?? ''),
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
      'status': status.value,
    };
  }
}

/// @nodoc
class UploadReadSetPartResponse {
  /// An identifier used to confirm that parts are being added to the intended
  /// upload.
  final String checksum;

  UploadReadSetPartResponse({
    required this.checksum,
  });

  factory UploadReadSetPartResponse.fromJson(Map<String, dynamic> json) {
    return UploadReadSetPartResponse(
      checksum: (json['checksum'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final checksum = this.checksum;
    return {
      'checksum': checksum,
    };
  }
}

/// @nodoc
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

  /// The read set's creation job ID.
  final String? creationJobId;

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
    this.creationJobId,
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
      arn: (json['arn'] as String?) ?? '',
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      fileType: FileType.fromString((json['fileType'] as String?) ?? ''),
      id: (json['id'] as String?) ?? '',
      sequenceStoreId: (json['sequenceStoreId'] as String?) ?? '',
      status: ReadSetStatus.fromString((json['status'] as String?) ?? ''),
      creationJobId: json['creationJobId'] as String?,
      creationType:
          (json['creationType'] as String?)?.let(CreationType.fromString),
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
    final creationJobId = this.creationJobId;
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
      'fileType': fileType.value,
      'id': id,
      'sequenceStoreId': sequenceStoreId,
      'status': status.value,
      if (creationJobId != null) 'creationJobId': creationJobId,
      if (creationType != null) 'creationType': creationType.value,
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

/// @nodoc
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
      readSets: ((json['readSets'] as List?) ?? const [])
          .nonNulls
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

/// @nodoc
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

/// @nodoc
class BatchDeleteReadSetResponse {
  /// Errors returned by individual delete operations.
  final List<ReadSetBatchError>? errors;

  BatchDeleteReadSetResponse({
    this.errors,
  });

  factory BatchDeleteReadSetResponse.fromJson(Map<String, dynamic> json) {
    return BatchDeleteReadSetResponse(
      errors: (json['errors'] as List?)
          ?.nonNulls
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

/// @nodoc
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
      status: (json['status'] as String?)?.let(ShareStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final shareId = this.shareId;
    final shareName = this.shareName;
    final status = this.status;
    return {
      if (shareId != null) 'shareId': shareId,
      if (shareName != null) 'shareName': shareName,
      if (status != null) 'status': status.value,
    };
  }
}

/// @nodoc
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

/// @nodoc
class AcceptShareResponse {
  /// The status of the resource share.
  final ShareStatus? status;

  AcceptShareResponse({
    this.status,
  });

  factory AcceptShareResponse.fromJson(Map<String, dynamic> json) {
    return AcceptShareResponse(
      status: (json['status'] as String?)?.let(ShareStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      if (status != null) 'status': status.value,
    };
  }
}

/// @nodoc
class DeleteShareResponse {
  /// The status of the share being deleted.
  final ShareStatus? status;

  DeleteShareResponse({
    this.status,
  });

  factory DeleteShareResponse.fromJson(Map<String, dynamic> json) {
    return DeleteShareResponse(
      status: (json['status'] as String?)?.let(ShareStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      if (status != null) 'status': status.value,
    };
  }
}

/// @nodoc
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
      shares: ((json['shares'] as List?) ?? const [])
          .nonNulls
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

/// @nodoc
class ListTagsForResourceResponse {
  /// A list of tags.
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

/// @nodoc
class StartVariantImportResponse {
  /// The job's ID.
  final String jobId;

  StartVariantImportResponse({
    required this.jobId,
  });

  factory StartVariantImportResponse.fromJson(Map<String, dynamic> json) {
    return StartVariantImportResponse(
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

/// @nodoc
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
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      destinationName: (json['destinationName'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      items: ((json['items'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              VariantImportItemDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      roleArn: (json['roleArn'] as String?) ?? '',
      runLeftNormalization: (json['runLeftNormalization'] as bool?) ?? false,
      status: JobStatus.fromString((json['status'] as String?) ?? ''),
      statusMessage: (json['statusMessage'] as String?) ?? '',
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
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
      'status': status.value,
      'statusMessage': statusMessage,
      'updateTime': iso8601ToJson(updateTime),
      if (annotationFields != null) 'annotationFields': annotationFields,
      if (completionTime != null)
        'completionTime': iso8601ToJson(completionTime),
    };
  }
}

/// @nodoc
class CancelVariantImportResponse {
  CancelVariantImportResponse();

  factory CancelVariantImportResponse.fromJson(Map<String, dynamic> _) {
    return CancelVariantImportResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
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
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      status: StoreStatus.fromString((json['status'] as String?) ?? ''),
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
      'status': status.value,
      if (reference != null) 'reference': reference,
    };
  }
}

/// @nodoc
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
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      description: (json['description'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      reference: ReferenceItem.fromJson(
          (json['reference'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      sseConfig: SseConfig.fromJson(
          (json['sseConfig'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      status: StoreStatus.fromString((json['status'] as String?) ?? ''),
      statusMessage: (json['statusMessage'] as String?) ?? '',
      storeArn: (json['storeArn'] as String?) ?? '',
      storeSizeBytes: (json['storeSizeBytes'] as int?) ?? 0,
      tags:
          ((json['tags'] as Map<String, dynamic>?) ?? const <String, dynamic>{})
              .map((k, e) => MapEntry(k, e as String)),
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
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
      'status': status.value,
      'statusMessage': statusMessage,
      'storeArn': storeArn,
      'storeSizeBytes': storeSizeBytes,
      'tags': tags,
      'updateTime': iso8601ToJson(updateTime),
    };
  }
}

/// @nodoc
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
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      description: (json['description'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      reference: ReferenceItem.fromJson(
          (json['reference'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      status: StoreStatus.fromString((json['status'] as String?) ?? ''),
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
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
      'status': status.value,
      'updateTime': iso8601ToJson(updateTime),
    };
  }
}

/// @nodoc
class DeleteVariantStoreResponse {
  /// The store's status.
  final StoreStatus status;

  DeleteVariantStoreResponse({
    required this.status,
  });

  factory DeleteVariantStoreResponse.fromJson(Map<String, dynamic> json) {
    return DeleteVariantStoreResponse(
      status: StoreStatus.fromString((json['status'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      'status': status.value,
    };
  }
}

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
class CreateWorkflowResponse {
  /// The workflow's ARN.
  final String? arn;

  /// The workflow's ID.
  final String? id;

  /// The workflow's status.
  final WorkflowStatus? status;

  /// The workflow's tags.
  final Map<String, String>? tags;

  /// The universally unique identifier (UUID) value for this workflow.
  final String? uuid;

  CreateWorkflowResponse({
    this.arn,
    this.id,
    this.status,
    this.tags,
    this.uuid,
  });

  factory CreateWorkflowResponse.fromJson(Map<String, dynamic> json) {
    return CreateWorkflowResponse(
      arn: json['arn'] as String?,
      id: json['id'] as String?,
      status: (json['status'] as String?)?.let(WorkflowStatus.fromString),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      uuid: json['uuid'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final status = this.status;
    final tags = this.tags;
    final uuid = this.uuid;
    return {
      if (arn != null) 'arn': arn,
      if (id != null) 'id': id,
      if (status != null) 'status': status.value,
      if (tags != null) 'tags': tags,
      if (uuid != null) 'uuid': uuid,
    };
  }
}

/// @nodoc
class GetWorkflowResponse {
  /// The computational accelerator specified to run the workflow.
  final Accelerators? accelerators;

  /// The workflow's ARN.
  final String? arn;

  /// The registry map that this workflow is using.
  final ContainerRegistryMap? containerRegistryMap;

  /// When the workflow was created.
  final DateTime? creationTime;

  /// The workflow's definition.
  final String? definition;

  /// Details about the source code repository that hosts the workflow definition
  /// files.
  final DefinitionRepositoryDetails? definitionRepositoryDetails;

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

  /// Gets metadata for the workflow.
  final Map<String, String>? metadata;

  /// The workflow's name.
  final String? name;

  /// The workflow's parameter template.
  final Map<String, WorkflowParameter>? parameterTemplate;

  /// A mapping of profile names to their parameter templates. Each profile
  /// defines its own set of parameters that you can use when starting a run with
  /// that profile.
  final Map<String, Map<String, WorkflowParameter>>? profileParameterTemplates;

  /// The list of Nextflow profiles that are available for this workflow. Profiles
  /// allow you to select predefined configuration settings at runtime.
  final List<String>? profiles;

  /// The README content for the workflow, providing documentation and usage
  /// information.
  final String? readme;

  /// The path to the workflow README markdown file within the repository. This
  /// file provides documentation and usage information for the workflow. If not
  /// specified, the <code>README.md</code> file from the root directory of the
  /// repository will be used.
  final String? readmePath;

  /// The workflow's status.
  final WorkflowStatus? status;

  /// The workflow's status message.
  final String? statusMessage;

  /// The default static storage capacity (in gibibytes) for runs that use this
  /// workflow or workflow version.
  final int? storageCapacity;

  /// The default storage type for runs using this workflow.
  final StorageType? storageType;

  /// The workflow's tags.
  final Map<String, String>? tags;

  /// The workflow's type.
  final WorkflowType? type;

  /// The universally unique identifier (UUID) value for this workflow.
  final String? uuid;

  GetWorkflowResponse({
    this.accelerators,
    this.arn,
    this.containerRegistryMap,
    this.creationTime,
    this.definition,
    this.definitionRepositoryDetails,
    this.description,
    this.digest,
    this.engine,
    this.id,
    this.main,
    this.metadata,
    this.name,
    this.parameterTemplate,
    this.profileParameterTemplates,
    this.profiles,
    this.readme,
    this.readmePath,
    this.status,
    this.statusMessage,
    this.storageCapacity,
    this.storageType,
    this.tags,
    this.type,
    this.uuid,
  });

  factory GetWorkflowResponse.fromJson(Map<String, dynamic> json) {
    return GetWorkflowResponse(
      accelerators:
          (json['accelerators'] as String?)?.let(Accelerators.fromString),
      arn: json['arn'] as String?,
      containerRegistryMap: json['containerRegistryMap'] != null
          ? ContainerRegistryMap.fromJson(
              json['containerRegistryMap'] as Map<String, dynamic>)
          : null,
      creationTime: timeStampFromJson(json['creationTime']),
      definition: json['definition'] as String?,
      definitionRepositoryDetails: json['definitionRepositoryDetails'] != null
          ? DefinitionRepositoryDetails.fromJson(
              json['definitionRepositoryDetails'] as Map<String, dynamic>)
          : null,
      description: json['description'] as String?,
      digest: json['digest'] as String?,
      engine: (json['engine'] as String?)?.let(WorkflowEngine.fromString),
      id: json['id'] as String?,
      main: json['main'] as String?,
      metadata: (json['metadata'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      name: json['name'] as String?,
      parameterTemplate: (json['parameterTemplate'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(
              k, WorkflowParameter.fromJson(e as Map<String, dynamic>))),
      profileParameterTemplates: (json['profileParameterTemplates']
              as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(
              k,
              (e as Map<String, dynamic>).map((k, e) => MapEntry(
                  k, WorkflowParameter.fromJson(e as Map<String, dynamic>))))),
      profiles: (json['profiles'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      readme: json['readme'] as String?,
      readmePath: json['readmePath'] as String?,
      status: (json['status'] as String?)?.let(WorkflowStatus.fromString),
      statusMessage: json['statusMessage'] as String?,
      storageCapacity: json['storageCapacity'] as int?,
      storageType:
          (json['storageType'] as String?)?.let(StorageType.fromString),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      type: (json['type'] as String?)?.let(WorkflowType.fromString),
      uuid: json['uuid'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accelerators = this.accelerators;
    final arn = this.arn;
    final containerRegistryMap = this.containerRegistryMap;
    final creationTime = this.creationTime;
    final definition = this.definition;
    final definitionRepositoryDetails = this.definitionRepositoryDetails;
    final description = this.description;
    final digest = this.digest;
    final engine = this.engine;
    final id = this.id;
    final main = this.main;
    final metadata = this.metadata;
    final name = this.name;
    final parameterTemplate = this.parameterTemplate;
    final profileParameterTemplates = this.profileParameterTemplates;
    final profiles = this.profiles;
    final readme = this.readme;
    final readmePath = this.readmePath;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final storageCapacity = this.storageCapacity;
    final storageType = this.storageType;
    final tags = this.tags;
    final type = this.type;
    final uuid = this.uuid;
    return {
      if (accelerators != null) 'accelerators': accelerators.value,
      if (arn != null) 'arn': arn,
      if (containerRegistryMap != null)
        'containerRegistryMap': containerRegistryMap,
      if (creationTime != null) 'creationTime': iso8601ToJson(creationTime),
      if (definition != null) 'definition': definition,
      if (definitionRepositoryDetails != null)
        'definitionRepositoryDetails': definitionRepositoryDetails,
      if (description != null) 'description': description,
      if (digest != null) 'digest': digest,
      if (engine != null) 'engine': engine.value,
      if (id != null) 'id': id,
      if (main != null) 'main': main,
      if (metadata != null) 'metadata': metadata,
      if (name != null) 'name': name,
      if (parameterTemplate != null) 'parameterTemplate': parameterTemplate,
      if (profileParameterTemplates != null)
        'profileParameterTemplates': profileParameterTemplates,
      if (profiles != null) 'profiles': profiles,
      if (readme != null) 'readme': readme,
      if (readmePath != null) 'readmePath': readmePath,
      if (status != null) 'status': status.value,
      if (statusMessage != null) 'statusMessage': statusMessage,
      if (storageCapacity != null) 'storageCapacity': storageCapacity,
      if (storageType != null) 'storageType': storageType.value,
      if (tags != null) 'tags': tags,
      if (type != null) 'type': type.value,
      if (uuid != null) 'uuid': uuid,
    };
  }
}

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
class CreateWorkflowVersionResponse {
  /// ARN of the workflow version.
  final String? arn;

  /// The workflow version status.
  final WorkflowStatus? status;

  /// The workflow version's tags.
  final Map<String, String>? tags;

  /// The universally unique identifier (UUID) value for this workflow version.
  final String? uuid;

  /// The workflow version name.
  final String? versionName;

  /// The workflow's ID.
  final String? workflowId;

  CreateWorkflowVersionResponse({
    this.arn,
    this.status,
    this.tags,
    this.uuid,
    this.versionName,
    this.workflowId,
  });

  factory CreateWorkflowVersionResponse.fromJson(Map<String, dynamic> json) {
    return CreateWorkflowVersionResponse(
      arn: json['arn'] as String?,
      status: (json['status'] as String?)?.let(WorkflowStatus.fromString),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      uuid: json['uuid'] as String?,
      versionName: json['versionName'] as String?,
      workflowId: json['workflowId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final status = this.status;
    final tags = this.tags;
    final uuid = this.uuid;
    final versionName = this.versionName;
    final workflowId = this.workflowId;
    return {
      if (arn != null) 'arn': arn,
      if (status != null) 'status': status.value,
      if (tags != null) 'tags': tags,
      if (uuid != null) 'uuid': uuid,
      if (versionName != null) 'versionName': versionName,
      if (workflowId != null) 'workflowId': workflowId,
    };
  }
}

/// @nodoc
class GetWorkflowVersionResponse {
  /// The accelerator for this workflow version.
  final Accelerators? accelerators;

  /// ARN of the workflow version.
  final String? arn;

  /// The registry map that this workflow version uses.
  final ContainerRegistryMap? containerRegistryMap;

  /// When the workflow version was created.
  final DateTime? creationTime;

  /// Definition of the workflow version.
  final String? definition;

  /// Details about the source code repository that hosts the workflow version
  /// definition files.
  final DefinitionRepositoryDetails? definitionRepositoryDetails;

  /// Description of the workflow version.
  final String? description;

  /// The workflow version's digest.
  final String? digest;

  /// The workflow engine for this workflow version.
  final WorkflowEngine? engine;

  /// The path of the main definition file for the workflow.
  final String? main;

  /// The metadata for the workflow version.
  final Map<String, String>? metadata;

  /// The parameter template for the workflow version.
  final Map<String, WorkflowParameter>? parameterTemplate;

  /// A mapping of profile names to their parameter templates. Each profile
  /// defines its own set of parameters that you can use when starting a run with
  /// that profile.
  final Map<String, Map<String, WorkflowParameter>>? profileParameterTemplates;

  /// The list of Nextflow profiles that are available for this workflow version.
  /// Profiles allow you to select predefined configuration settings at runtime.
  final List<String>? profiles;

  /// The README content for the workflow version, providing documentation and
  /// usage information specific to this version.
  final String? readme;

  /// The path to the workflow version README markdown file within the repository.
  /// This file provides documentation and usage information for the workflow. If
  /// not specified, the <code>README.md</code> file from the root directory of
  /// the repository will be used.
  final String? readmePath;

  /// The workflow version status
  final WorkflowStatus? status;

  /// The workflow version status message
  final String? statusMessage;

  /// The default run storage capacity for static storage.
  final int? storageCapacity;

  /// The default storage type for the run.
  final StorageType? storageType;

  /// The workflow version tags
  final Map<String, String>? tags;

  /// The workflow version type
  final WorkflowType? type;

  /// The universally unique identifier (UUID) value for this workflow version
  final String? uuid;

  /// The workflow version name.
  final String? versionName;

  /// Amazon Web Services Id of the owner of the bucket.
  final String? workflowBucketOwnerId;

  /// The workflow's ID.
  final String? workflowId;

  GetWorkflowVersionResponse({
    this.accelerators,
    this.arn,
    this.containerRegistryMap,
    this.creationTime,
    this.definition,
    this.definitionRepositoryDetails,
    this.description,
    this.digest,
    this.engine,
    this.main,
    this.metadata,
    this.parameterTemplate,
    this.profileParameterTemplates,
    this.profiles,
    this.readme,
    this.readmePath,
    this.status,
    this.statusMessage,
    this.storageCapacity,
    this.storageType,
    this.tags,
    this.type,
    this.uuid,
    this.versionName,
    this.workflowBucketOwnerId,
    this.workflowId,
  });

  factory GetWorkflowVersionResponse.fromJson(Map<String, dynamic> json) {
    return GetWorkflowVersionResponse(
      accelerators:
          (json['accelerators'] as String?)?.let(Accelerators.fromString),
      arn: json['arn'] as String?,
      containerRegistryMap: json['containerRegistryMap'] != null
          ? ContainerRegistryMap.fromJson(
              json['containerRegistryMap'] as Map<String, dynamic>)
          : null,
      creationTime: timeStampFromJson(json['creationTime']),
      definition: json['definition'] as String?,
      definitionRepositoryDetails: json['definitionRepositoryDetails'] != null
          ? DefinitionRepositoryDetails.fromJson(
              json['definitionRepositoryDetails'] as Map<String, dynamic>)
          : null,
      description: json['description'] as String?,
      digest: json['digest'] as String?,
      engine: (json['engine'] as String?)?.let(WorkflowEngine.fromString),
      main: json['main'] as String?,
      metadata: (json['metadata'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      parameterTemplate: (json['parameterTemplate'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(
              k, WorkflowParameter.fromJson(e as Map<String, dynamic>))),
      profileParameterTemplates: (json['profileParameterTemplates']
              as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(
              k,
              (e as Map<String, dynamic>).map((k, e) => MapEntry(
                  k, WorkflowParameter.fromJson(e as Map<String, dynamic>))))),
      profiles: (json['profiles'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      readme: json['readme'] as String?,
      readmePath: json['readmePath'] as String?,
      status: (json['status'] as String?)?.let(WorkflowStatus.fromString),
      statusMessage: json['statusMessage'] as String?,
      storageCapacity: json['storageCapacity'] as int?,
      storageType:
          (json['storageType'] as String?)?.let(StorageType.fromString),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      type: (json['type'] as String?)?.let(WorkflowType.fromString),
      uuid: json['uuid'] as String?,
      versionName: json['versionName'] as String?,
      workflowBucketOwnerId: json['workflowBucketOwnerId'] as String?,
      workflowId: json['workflowId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accelerators = this.accelerators;
    final arn = this.arn;
    final containerRegistryMap = this.containerRegistryMap;
    final creationTime = this.creationTime;
    final definition = this.definition;
    final definitionRepositoryDetails = this.definitionRepositoryDetails;
    final description = this.description;
    final digest = this.digest;
    final engine = this.engine;
    final main = this.main;
    final metadata = this.metadata;
    final parameterTemplate = this.parameterTemplate;
    final profileParameterTemplates = this.profileParameterTemplates;
    final profiles = this.profiles;
    final readme = this.readme;
    final readmePath = this.readmePath;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final storageCapacity = this.storageCapacity;
    final storageType = this.storageType;
    final tags = this.tags;
    final type = this.type;
    final uuid = this.uuid;
    final versionName = this.versionName;
    final workflowBucketOwnerId = this.workflowBucketOwnerId;
    final workflowId = this.workflowId;
    return {
      if (accelerators != null) 'accelerators': accelerators.value,
      if (arn != null) 'arn': arn,
      if (containerRegistryMap != null)
        'containerRegistryMap': containerRegistryMap,
      if (creationTime != null) 'creationTime': iso8601ToJson(creationTime),
      if (definition != null) 'definition': definition,
      if (definitionRepositoryDetails != null)
        'definitionRepositoryDetails': definitionRepositoryDetails,
      if (description != null) 'description': description,
      if (digest != null) 'digest': digest,
      if (engine != null) 'engine': engine.value,
      if (main != null) 'main': main,
      if (metadata != null) 'metadata': metadata,
      if (parameterTemplate != null) 'parameterTemplate': parameterTemplate,
      if (profileParameterTemplates != null)
        'profileParameterTemplates': profileParameterTemplates,
      if (profiles != null) 'profiles': profiles,
      if (readme != null) 'readme': readme,
      if (readmePath != null) 'readmePath': readmePath,
      if (status != null) 'status': status.value,
      if (statusMessage != null) 'statusMessage': statusMessage,
      if (storageCapacity != null) 'storageCapacity': storageCapacity,
      if (storageType != null) 'storageType': storageType.value,
      if (tags != null) 'tags': tags,
      if (type != null) 'type': type.value,
      if (uuid != null) 'uuid': uuid,
      if (versionName != null) 'versionName': versionName,
      if (workflowBucketOwnerId != null)
        'workflowBucketOwnerId': workflowBucketOwnerId,
      if (workflowId != null) 'workflowId': workflowId,
    };
  }
}

/// @nodoc
class ListWorkflowVersionsResponse {
  /// A list of workflow version items.
  final List<WorkflowVersionListItem>? items;

  /// A pagination token that's included if more results are available.
  final String? nextToken;

  ListWorkflowVersionsResponse({
    this.items,
    this.nextToken,
  });

  factory ListWorkflowVersionsResponse.fromJson(Map<String, dynamic> json) {
    return ListWorkflowVersionsResponse(
      items: (json['items'] as List?)
          ?.nonNulls
          .map((e) =>
              WorkflowVersionListItem.fromJson(e as Map<String, dynamic>))
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

/// A list of workflow version items.
///
/// @nodoc
class WorkflowVersionListItem {
  /// ARN of the workflow version.
  final String? arn;

  /// The creation time of the workflow version.
  final DateTime? creationTime;

  /// The description of the workflow version.
  final String? description;

  /// The digist of the workflow version.
  final String? digest;

  /// Metadata for the workflow version.
  final Map<String, String>? metadata;

  /// The status of the workflow version.
  final WorkflowStatus? status;

  /// The type of the workflow version.
  final WorkflowType? type;

  /// The name of the workflow version.
  final String? versionName;

  /// The workflow's ID.
  final String? workflowId;

  WorkflowVersionListItem({
    this.arn,
    this.creationTime,
    this.description,
    this.digest,
    this.metadata,
    this.status,
    this.type,
    this.versionName,
    this.workflowId,
  });

  factory WorkflowVersionListItem.fromJson(Map<String, dynamic> json) {
    return WorkflowVersionListItem(
      arn: json['arn'] as String?,
      creationTime: timeStampFromJson(json['creationTime']),
      description: json['description'] as String?,
      digest: json['digest'] as String?,
      metadata: (json['metadata'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      status: (json['status'] as String?)?.let(WorkflowStatus.fromString),
      type: (json['type'] as String?)?.let(WorkflowType.fromString),
      versionName: json['versionName'] as String?,
      workflowId: json['workflowId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final description = this.description;
    final digest = this.digest;
    final metadata = this.metadata;
    final status = this.status;
    final type = this.type;
    final versionName = this.versionName;
    final workflowId = this.workflowId;
    return {
      if (arn != null) 'arn': arn,
      if (creationTime != null) 'creationTime': iso8601ToJson(creationTime),
      if (description != null) 'description': description,
      if (digest != null) 'digest': digest,
      if (metadata != null) 'metadata': metadata,
      if (status != null) 'status': status.value,
      if (type != null) 'type': type.value,
      if (versionName != null) 'versionName': versionName,
      if (workflowId != null) 'workflowId': workflowId,
    };
  }
}

/// @nodoc
class WorkflowStatus {
  static const creating = WorkflowStatus._('CREATING');
  static const active = WorkflowStatus._('ACTIVE');
  static const updating = WorkflowStatus._('UPDATING');
  static const deleted = WorkflowStatus._('DELETED');
  static const failed = WorkflowStatus._('FAILED');
  static const inactive = WorkflowStatus._('INACTIVE');

  final String value;

  const WorkflowStatus._(this.value);

  static const values = [creating, active, updating, deleted, failed, inactive];

  static WorkflowStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => WorkflowStatus._(value));

  @override
  bool operator ==(other) => other is WorkflowStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class WorkflowType {
  static const private = WorkflowType._('PRIVATE');
  static const ready2run = WorkflowType._('READY2RUN');

  final String value;

  const WorkflowType._(this.value);

  static const values = [private, ready2run];

  static WorkflowType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => WorkflowType._(value));

  @override
  bool operator ==(other) => other is WorkflowType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class StorageType {
  static const static = StorageType._('STATIC');
  static const $dynamic = StorageType._('DYNAMIC');

  final String value;

  const StorageType._(this.value);

  static const values = [static, $dynamic];

  static StorageType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => StorageType._(value));

  @override
  bool operator ==(other) => other is StorageType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class Accelerators {
  static const gpu = Accelerators._('GPU');

  final String value;

  const Accelerators._(this.value);

  static const values = [gpu];

  static Accelerators fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => Accelerators._(value));

  @override
  bool operator ==(other) => other is Accelerators && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class WorkflowEngine {
  static const wdl = WorkflowEngine._('WDL');
  static const nextflow = WorkflowEngine._('NEXTFLOW');
  static const cwl = WorkflowEngine._('CWL');
  static const wdlLenient = WorkflowEngine._('WDL_LENIENT');

  final String value;

  const WorkflowEngine._(this.value);

  static const values = [wdl, nextflow, cwl, wdlLenient];

  static WorkflowEngine fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => WorkflowEngine._(value));

  @override
  bool operator ==(other) => other is WorkflowEngine && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Use a container registry map to specify mappings between the ECR private
/// repository and one or more upstream registries. For more information, see <a
/// href="https://docs.aws.amazon.com/omics/latest/dev/workflows-ecr.html">Container
/// images</a> in the <i>Amazon Web Services HealthOmics User Guide</i>.
///
/// @nodoc
class ContainerRegistryMap {
  /// Image mappings specify path mappings between the ECR private repository and
  /// their corresponding external repositories.
  final List<ImageMapping>? imageMappings;

  /// Mapping that provides the ECR repository path where upstream container
  /// images are pulled and synchronized.
  final List<RegistryMapping>? registryMappings;

  ContainerRegistryMap({
    this.imageMappings,
    this.registryMappings,
  });

  factory ContainerRegistryMap.fromJson(Map<String, dynamic> json) {
    return ContainerRegistryMap(
      imageMappings: (json['imageMappings'] as List?)
          ?.nonNulls
          .map((e) => ImageMapping.fromJson(e as Map<String, dynamic>))
          .toList(),
      registryMappings: (json['registryMappings'] as List?)
          ?.nonNulls
          .map((e) => RegistryMapping.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final imageMappings = this.imageMappings;
    final registryMappings = this.registryMappings;
    return {
      if (imageMappings != null) 'imageMappings': imageMappings,
      if (registryMappings != null) 'registryMappings': registryMappings,
    };
  }
}

/// Contains detailed information about the source code repository that hosts
/// the workflow definition files.
///
/// @nodoc
class DefinitionRepositoryDetails {
  /// The Amazon Resource Name (ARN) of the connection to the source code
  /// repository.
  final String? connectionArn;

  /// The full repository identifier, including the repository owner and name. For
  /// example, 'repository-owner/repository-name'.
  final String? fullRepositoryId;

  /// The endpoint URL of the source code repository provider.
  final String? providerEndpoint;

  /// The provider type of the source code repository, such as Bitbucket, GitHub,
  /// GitHubEnterpriseServer, GitLab, and GitLabSelfManaged.
  final String? providerType;

  /// The source reference for the repository, such as a branch name, tag, or
  /// commit ID.
  final SourceReference? sourceReference;

  DefinitionRepositoryDetails({
    this.connectionArn,
    this.fullRepositoryId,
    this.providerEndpoint,
    this.providerType,
    this.sourceReference,
  });

  factory DefinitionRepositoryDetails.fromJson(Map<String, dynamic> json) {
    return DefinitionRepositoryDetails(
      connectionArn: json['connectionArn'] as String?,
      fullRepositoryId: json['fullRepositoryId'] as String?,
      providerEndpoint: json['providerEndpoint'] as String?,
      providerType: json['providerType'] as String?,
      sourceReference: json['sourceReference'] != null
          ? SourceReference.fromJson(
              json['sourceReference'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final connectionArn = this.connectionArn;
    final fullRepositoryId = this.fullRepositoryId;
    final providerEndpoint = this.providerEndpoint;
    final providerType = this.providerType;
    final sourceReference = this.sourceReference;
    return {
      if (connectionArn != null) 'connectionArn': connectionArn,
      if (fullRepositoryId != null) 'fullRepositoryId': fullRepositoryId,
      if (providerEndpoint != null) 'providerEndpoint': providerEndpoint,
      if (providerType != null) 'providerType': providerType,
      if (sourceReference != null) 'sourceReference': sourceReference,
    };
  }
}

/// Contains information about the source reference in a code repository, such
/// as a branch, tag, or commit.
///
/// @nodoc
class SourceReference {
  /// The type of source reference, such as branch, tag, or commit.
  final SourceReferenceType type;

  /// The value of the source reference, such as the branch name, tag name, or
  /// commit ID.
  final String value;

  SourceReference({
    required this.type,
    required this.value,
  });

  factory SourceReference.fromJson(Map<String, dynamic> json) {
    return SourceReference(
      type: SourceReferenceType.fromString((json['type'] as String?) ?? ''),
      value: (json['value'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final value = this.value;
    return {
      'type': type.value,
      'value': value,
    };
  }
}

/// @nodoc
class SourceReferenceType {
  static const branch = SourceReferenceType._('BRANCH');
  static const tag = SourceReferenceType._('TAG');
  static const commit = SourceReferenceType._('COMMIT');

  final String value;

  const SourceReferenceType._(this.value);

  static const values = [branch, tag, commit];

  static SourceReferenceType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SourceReferenceType._(value));

  @override
  bool operator ==(other) =>
      other is SourceReferenceType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Specifies image mappings that workflow tasks can use. For example, you can
/// replace all the task references of a public image to use an equivalent image
/// in your private ECR repository. You can use image mappings with upstream
/// registries that don't support pull through cache. You need to manually
/// synchronize the upstream registry with your private repository.
///
/// @nodoc
class ImageMapping {
  /// Specifies the URI of the corresponding image in the private ECR registry.
  final String? destinationImage;

  /// Specifies the URI of the source image in the upstream registry.
  final String? sourceImage;

  ImageMapping({
    this.destinationImage,
    this.sourceImage,
  });

  factory ImageMapping.fromJson(Map<String, dynamic> json) {
    return ImageMapping(
      destinationImage: json['destinationImage'] as String?,
      sourceImage: json['sourceImage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final destinationImage = this.destinationImage;
    final sourceImage = this.sourceImage;
    return {
      if (destinationImage != null) 'destinationImage': destinationImage,
      if (sourceImage != null) 'sourceImage': sourceImage,
    };
  }
}

/// If you are using the ECR pull through cache feature, the registry mapping
/// maps between the ECR repository and the upstream registry where container
/// images are pulled and synchronized.
///
/// @nodoc
class RegistryMapping {
  /// Account ID of the account that owns the upstream container image.
  final String? ecrAccountId;

  /// The repository prefix to use in the ECR private repository.
  final String? ecrRepositoryPrefix;

  /// The URI of the upstream registry.
  final String? upstreamRegistryUrl;

  /// The repository prefix of the corresponding repository in the upstream
  /// registry.
  final String? upstreamRepositoryPrefix;

  RegistryMapping({
    this.ecrAccountId,
    this.ecrRepositoryPrefix,
    this.upstreamRegistryUrl,
    this.upstreamRepositoryPrefix,
  });

  factory RegistryMapping.fromJson(Map<String, dynamic> json) {
    return RegistryMapping(
      ecrAccountId: json['ecrAccountId'] as String?,
      ecrRepositoryPrefix: json['ecrRepositoryPrefix'] as String?,
      upstreamRegistryUrl: json['upstreamRegistryUrl'] as String?,
      upstreamRepositoryPrefix: json['upstreamRepositoryPrefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ecrAccountId = this.ecrAccountId;
    final ecrRepositoryPrefix = this.ecrRepositoryPrefix;
    final upstreamRegistryUrl = this.upstreamRegistryUrl;
    final upstreamRepositoryPrefix = this.upstreamRepositoryPrefix;
    return {
      if (ecrAccountId != null) 'ecrAccountId': ecrAccountId,
      if (ecrRepositoryPrefix != null)
        'ecrRepositoryPrefix': ecrRepositoryPrefix,
      if (upstreamRegistryUrl != null)
        'upstreamRegistryUrl': upstreamRegistryUrl,
      if (upstreamRepositoryPrefix != null)
        'upstreamRepositoryPrefix': upstreamRepositoryPrefix,
    };
  }
}

/// A workflow parameter.
///
/// @nodoc
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

/// @nodoc
class WorkflowExport {
  static const definition = WorkflowExport._('DEFINITION');
  static const readme = WorkflowExport._('README');

  final String value;

  const WorkflowExport._(this.value);

  static const values = [definition, readme];

  static WorkflowExport fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => WorkflowExport._(value));

  @override
  bool operator ==(other) => other is WorkflowExport && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains information about a source code repository that hosts the workflow
/// definition files.
///
/// @nodoc
class DefinitionRepository {
  /// The Amazon Resource Name (ARN) of the connection to the source code
  /// repository.
  final String connectionArn;

  /// The full repository identifier, including the repository owner and name. For
  /// example, 'repository-owner/repository-name'.
  final String fullRepositoryId;

  /// A list of file patterns to exclude when retrieving the workflow definition
  /// from the repository.
  final List<String>? excludeFilePatterns;

  /// The source reference for the repository, such as a branch name, tag, or
  /// commit ID.
  final SourceReference? sourceReference;

  DefinitionRepository({
    required this.connectionArn,
    required this.fullRepositoryId,
    this.excludeFilePatterns,
    this.sourceReference,
  });

  Map<String, dynamic> toJson() {
    final connectionArn = this.connectionArn;
    final fullRepositoryId = this.fullRepositoryId;
    final excludeFilePatterns = this.excludeFilePatterns;
    final sourceReference = this.sourceReference;
    return {
      'connectionArn': connectionArn,
      'fullRepositoryId': fullRepositoryId,
      if (excludeFilePatterns != null)
        'excludeFilePatterns': excludeFilePatterns,
      if (sourceReference != null) 'sourceReference': sourceReference,
    };
  }
}

/// A workflow.
///
/// @nodoc
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
      status: (json['status'] as String?)?.let(WorkflowStatus.fromString),
      type: (json['type'] as String?)?.let(WorkflowType.fromString),
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
      if (status != null) 'status': status.value,
      if (type != null) 'type': type.value,
    };
  }
}

/// A variant store.
///
/// @nodoc
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
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      description: (json['description'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      reference: ReferenceItem.fromJson(
          (json['reference'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      sseConfig: SseConfig.fromJson(
          (json['sseConfig'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      status: StoreStatus.fromString((json['status'] as String?) ?? ''),
      statusMessage: (json['statusMessage'] as String?) ?? '',
      storeArn: (json['storeArn'] as String?) ?? '',
      storeSizeBytes: (json['storeSizeBytes'] as int?) ?? 0,
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
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
      'status': status.value,
      'statusMessage': statusMessage,
      'storeArn': storeArn,
      'storeSizeBytes': storeSizeBytes,
      'updateTime': iso8601ToJson(updateTime),
    };
  }
}

/// A genome reference.
///
/// @nodoc
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

/// @nodoc
class StoreStatus {
  static const creating = StoreStatus._('CREATING');
  static const updating = StoreStatus._('UPDATING');
  static const deleting = StoreStatus._('DELETING');
  static const active = StoreStatus._('ACTIVE');
  static const failed = StoreStatus._('FAILED');

  final String value;

  const StoreStatus._(this.value);

  static const values = [creating, updating, deleting, active, failed];

  static StoreStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => StoreStatus._(value));

  @override
  bool operator ==(other) => other is StoreStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Server-side encryption (SSE) settings for a store.
///
/// @nodoc
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
      type: EncryptionType.fromString((json['type'] as String?) ?? ''),
      keyArn: json['keyArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final keyArn = this.keyArn;
    return {
      'type': type.value,
      if (keyArn != null) 'keyArn': keyArn,
    };
  }
}

/// @nodoc
class EncryptionType {
  static const kms = EncryptionType._('KMS');

  final String value;

  const EncryptionType._(this.value);

  static const values = [kms];

  static EncryptionType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EncryptionType._(value));

  @override
  bool operator ==(other) => other is EncryptionType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A filter for variant stores.
///
/// @nodoc
class ListVariantStoresFilter {
  /// A status to filter on.
  final StoreStatus? status;

  ListVariantStoresFilter({
    this.status,
  });

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      if (status != null) 'status': status.value,
    };
  }
}

/// A variant import job.
///
/// @nodoc
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
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      destinationName: (json['destinationName'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      roleArn: (json['roleArn'] as String?) ?? '',
      status: JobStatus.fromString((json['status'] as String?) ?? ''),
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
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
      'status': status.value,
      'updateTime': iso8601ToJson(updateTime),
      if (annotationFields != null) 'annotationFields': annotationFields,
      if (completionTime != null)
        'completionTime': iso8601ToJson(completionTime),
      if (runLeftNormalization != null)
        'runLeftNormalization': runLeftNormalization,
    };
  }
}

/// @nodoc
class JobStatus {
  static const submitted = JobStatus._('SUBMITTED');
  static const inProgress = JobStatus._('IN_PROGRESS');
  static const cancelled = JobStatus._('CANCELLED');
  static const completed = JobStatus._('COMPLETED');
  static const failed = JobStatus._('FAILED');
  static const completedWithFailures = JobStatus._('COMPLETED_WITH_FAILURES');

  final String value;

  const JobStatus._(this.value);

  static const values = [
    submitted,
    inProgress,
    cancelled,
    completed,
    failed,
    completedWithFailures
  ];

  static JobStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => JobStatus._(value));

  @override
  bool operator ==(other) => other is JobStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A filter for variant import jobs.
///
/// @nodoc
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
      if (status != null) 'status': status.value,
      if (storeName != null) 'storeName': storeName,
    };
  }
}

/// Details about an imported variant item.
///
/// @nodoc
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
      jobStatus: JobStatus.fromString((json['jobStatus'] as String?) ?? ''),
      source: (json['source'] as String?) ?? '',
      statusMessage: json['statusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobStatus = this.jobStatus;
    final source = this.source;
    final statusMessage = this.statusMessage;
    return {
      'jobStatus': jobStatus.value,
      'source': source,
      if (statusMessage != null) 'statusMessage': statusMessage,
    };
  }
}

/// A imported variant item's source.
///
/// @nodoc
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

/// The details of a resource share.
///
/// @nodoc
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
      status: (json['status'] as String?)?.let(ShareStatus.fromString),
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
      if (status != null) 'status': status.value,
      if (statusMessage != null) 'statusMessage': statusMessage,
      if (updateTime != null) 'updateTime': iso8601ToJson(updateTime),
    };
  }
}

/// @nodoc
class ShareStatus {
  static const pending = ShareStatus._('PENDING');
  static const activating = ShareStatus._('ACTIVATING');
  static const active = ShareStatus._('ACTIVE');
  static const deleting = ShareStatus._('DELETING');
  static const deleted = ShareStatus._('DELETED');
  static const failed = ShareStatus._('FAILED');

  final String value;

  const ShareStatus._(this.value);

  static const values = [
    pending,
    activating,
    active,
    deleting,
    deleted,
    failed
  ];

  static ShareStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ShareStatus._(value));

  @override
  bool operator ==(other) => other is ShareStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ResourceOwner {
  static const self = ResourceOwner._('SELF');
  static const other = ResourceOwner._('OTHER');

  final String value;

  const ResourceOwner._(this.value);

  static const values = [self, other];

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

/// Use filters to return a subset of resources. You can define filters for
/// specific parameters, such as the resource status.
///
/// @nodoc
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
      if (status != null) 'status': status.map((e) => e.value).toList(),
      if (type != null) 'type': type.map((e) => e.value).toList(),
    };
  }
}

/// @nodoc
class ShareResourceType {
  static const variantStore = ShareResourceType._('VARIANT_STORE');
  static const annotationStore = ShareResourceType._('ANNOTATION_STORE');
  static const workflow = ShareResourceType._('WORKFLOW');

  final String value;

  const ShareResourceType._(this.value);

  static const values = [variantStore, annotationStore, workflow];

  static ShareResourceType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ShareResourceType._(value));

  @override
  bool operator ==(other) => other is ShareResourceType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An error from a batch read set operation.
///
/// @nodoc
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
      code: (json['code'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      message: (json['message'] as String?) ?? '',
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

/// @nodoc
class ReadSetFile {
  static const source1 = ReadSetFile._('SOURCE1');
  static const source2 = ReadSetFile._('SOURCE2');
  static const $index = ReadSetFile._('INDEX');

  final String value;

  const ReadSetFile._(this.value);

  static const values = [source1, source2, $index];

  static ReadSetFile fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ReadSetFile._(value));

  @override
  bool operator ==(other) => other is ReadSetFile && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A read set.
///
/// @nodoc
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
      arn: (json['arn'] as String?) ?? '',
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      fileType: FileType.fromString((json['fileType'] as String?) ?? ''),
      id: (json['id'] as String?) ?? '',
      sequenceStoreId: (json['sequenceStoreId'] as String?) ?? '',
      status: ReadSetStatus.fromString((json['status'] as String?) ?? ''),
      creationType:
          (json['creationType'] as String?)?.let(CreationType.fromString),
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
      'fileType': fileType.value,
      'id': id,
      'sequenceStoreId': sequenceStoreId,
      'status': status.value,
      if (creationType != null) 'creationType': creationType.value,
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

/// @nodoc
class ReadSetStatus {
  static const archived = ReadSetStatus._('ARCHIVED');
  static const activating = ReadSetStatus._('ACTIVATING');
  static const active = ReadSetStatus._('ACTIVE');
  static const deleting = ReadSetStatus._('DELETING');
  static const deleted = ReadSetStatus._('DELETED');
  static const processingUpload = ReadSetStatus._('PROCESSING_UPLOAD');
  static const uploadFailed = ReadSetStatus._('UPLOAD_FAILED');

  final String value;

  const ReadSetStatus._(this.value);

  static const values = [
    archived,
    activating,
    active,
    deleting,
    deleted,
    processingUpload,
    uploadFailed
  ];

  static ReadSetStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ReadSetStatus._(value));

  @override
  bool operator ==(other) => other is ReadSetStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class FileType {
  static const fastq = FileType._('FASTQ');
  static const bam = FileType._('BAM');
  static const cram = FileType._('CRAM');
  static const ubam = FileType._('UBAM');

  final String value;

  const FileType._(this.value);

  static const values = [fastq, bam, cram, ubam];

  static FileType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => FileType._(value));

  @override
  bool operator ==(other) => other is FileType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Details about a sequence.
///
/// @nodoc
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

/// @nodoc
class CreationType {
  static const import = CreationType._('IMPORT');
  static const upload = CreationType._('UPLOAD');

  final String value;

  const CreationType._(this.value);

  static const values = [import, upload];

  static CreationType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => CreationType._(value));

  @override
  bool operator ==(other) => other is CreationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The entity tag (ETag) is a hash of the object representing its semantic
/// content.
///
/// @nodoc
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
      algorithm: (json['algorithm'] as String?)?.let(ETagAlgorithm.fromString),
      source1: json['source1'] as String?,
      source2: json['source2'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final algorithm = this.algorithm;
    final source1 = this.source1;
    final source2 = this.source2;
    return {
      if (algorithm != null) 'algorithm': algorithm.value,
      if (source1 != null) 'source1': source1,
      if (source2 != null) 'source2': source2,
    };
  }
}

/// @nodoc
class ETagAlgorithm {
  static const fastqMD5up = ETagAlgorithm._('FASTQ_MD5up');
  static const bamMD5up = ETagAlgorithm._('BAM_MD5up');
  static const cramMD5up = ETagAlgorithm._('CRAM_MD5up');
  static const fastqSHA256up = ETagAlgorithm._('FASTQ_SHA256up');
  static const bamSHA256up = ETagAlgorithm._('BAM_SHA256up');
  static const cramSHA256up = ETagAlgorithm._('CRAM_SHA256up');
  static const fastqSHA512up = ETagAlgorithm._('FASTQ_SHA512up');
  static const bamSHA512up = ETagAlgorithm._('BAM_SHA512up');
  static const cramSHA512up = ETagAlgorithm._('CRAM_SHA512up');

  final String value;

  const ETagAlgorithm._(this.value);

  static const values = [
    fastqMD5up,
    bamMD5up,
    cramMD5up,
    fastqSHA256up,
    bamSHA256up,
    cramSHA256up,
    fastqSHA512up,
    bamSHA512up,
    cramSHA512up
  ];

  static ETagAlgorithm fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ETagAlgorithm._(value));

  @override
  bool operator ==(other) => other is ETagAlgorithm && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A filter for read sets.
///
/// @nodoc
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
      if (creationType != null) 'creationType': creationType.value,
      if (generatedFrom != null) 'generatedFrom': generatedFrom,
      if (name != null) 'name': name,
      if (referenceArn != null) 'referenceArn': referenceArn,
      if (sampleId != null) 'sampleId': sampleId,
      if (status != null) 'status': status.value,
      if (subjectId != null) 'subjectId': subjectId,
    };
  }
}

/// Files in a read set.
///
/// @nodoc
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

/// Details about a file.
///
/// @nodoc
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

/// The S3 URI for each read set file.
///
/// @nodoc
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

/// @nodoc
class ReadSetPartSource {
  static const source1 = ReadSetPartSource._('SOURCE1');
  static const source2 = ReadSetPartSource._('SOURCE2');

  final String value;

  const ReadSetPartSource._(this.value);

  static const values = [source1, source2];

  static ReadSetPartSource fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ReadSetPartSource._(value));

  @override
  bool operator ==(other) => other is ReadSetPartSource && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ReadSetImportJobStatus {
  static const submitted = ReadSetImportJobStatus._('SUBMITTED');
  static const inProgress = ReadSetImportJobStatus._('IN_PROGRESS');
  static const cancelling = ReadSetImportJobStatus._('CANCELLING');
  static const cancelled = ReadSetImportJobStatus._('CANCELLED');
  static const failed = ReadSetImportJobStatus._('FAILED');
  static const completed = ReadSetImportJobStatus._('COMPLETED');
  static const completedWithFailures =
      ReadSetImportJobStatus._('COMPLETED_WITH_FAILURES');

  final String value;

  const ReadSetImportJobStatus._(this.value);

  static const values = [
    submitted,
    inProgress,
    cancelling,
    cancelled,
    failed,
    completed,
    completedWithFailures
  ];

  static ReadSetImportJobStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ReadSetImportJobStatus._(value));

  @override
  bool operator ==(other) =>
      other is ReadSetImportJobStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A source for a read set import job.
///
/// @nodoc
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
      'sourceFileType': sourceFileType.value,
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

/// Source files for a sequence.
///
/// @nodoc
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
      source1: (json['source1'] as String?) ?? '',
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

/// @nodoc
class ReadSetExportJobStatus {
  static const submitted = ReadSetExportJobStatus._('SUBMITTED');
  static const inProgress = ReadSetExportJobStatus._('IN_PROGRESS');
  static const cancelling = ReadSetExportJobStatus._('CANCELLING');
  static const cancelled = ReadSetExportJobStatus._('CANCELLED');
  static const failed = ReadSetExportJobStatus._('FAILED');
  static const completed = ReadSetExportJobStatus._('COMPLETED');
  static const completedWithFailures =
      ReadSetExportJobStatus._('COMPLETED_WITH_FAILURES');

  final String value;

  const ReadSetExportJobStatus._(this.value);

  static const values = [
    submitted,
    inProgress,
    cancelling,
    cancelled,
    failed,
    completed,
    completedWithFailures
  ];

  static ReadSetExportJobStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ReadSetExportJobStatus._(value));

  @override
  bool operator ==(other) =>
      other is ReadSetExportJobStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A read set.
///
/// @nodoc
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

/// @nodoc
class ReadSetActivationJobStatus {
  static const submitted = ReadSetActivationJobStatus._('SUBMITTED');
  static const inProgress = ReadSetActivationJobStatus._('IN_PROGRESS');
  static const cancelling = ReadSetActivationJobStatus._('CANCELLING');
  static const cancelled = ReadSetActivationJobStatus._('CANCELLED');
  static const failed = ReadSetActivationJobStatus._('FAILED');
  static const completed = ReadSetActivationJobStatus._('COMPLETED');
  static const completedWithFailures =
      ReadSetActivationJobStatus._('COMPLETED_WITH_FAILURES');

  final String value;

  const ReadSetActivationJobStatus._(this.value);

  static const values = [
    submitted,
    inProgress,
    cancelling,
    cancelled,
    failed,
    completed,
    completedWithFailures
  ];

  static ReadSetActivationJobStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ReadSetActivationJobStatus._(value));

  @override
  bool operator ==(other) =>
      other is ReadSetActivationJobStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A source for a read set activation job.
///
/// @nodoc
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

/// The metadata of a single part of a file that was added to a multipart
/// upload. A list of these parts is returned in the response to the
/// ListReadSetUploadParts API.
///
/// @nodoc
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
      checksum: (json['checksum'] as String?) ?? '',
      partNumber: (json['partNumber'] as int?) ?? 0,
      partSize: (json['partSize'] as int?) ?? 0,
      partSource:
          ReadSetPartSource.fromString((json['partSource'] as String?) ?? ''),
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
      'partSource': partSource.value,
      if (creationTime != null) 'creationTime': iso8601ToJson(creationTime),
      if (lastUpdatedTime != null)
        'lastUpdatedTime': iso8601ToJson(lastUpdatedTime),
    };
  }
}

/// Filter settings that select for read set upload parts of interest.
///
/// @nodoc
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

/// An import read set job.
///
/// @nodoc
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
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      id: (json['id'] as String?) ?? '',
      roleArn: (json['roleArn'] as String?) ?? '',
      sequenceStoreId: (json['sequenceStoreId'] as String?) ?? '',
      status:
          ReadSetImportJobStatus.fromString((json['status'] as String?) ?? ''),
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
      'status': status.value,
      if (completionTime != null)
        'completionTime': iso8601ToJson(completionTime),
    };
  }
}

/// A filter for import read set jobs.
///
/// @nodoc
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
      if (status != null) 'status': status.value,
    };
  }
}

/// Details about a read set export job.
///
/// @nodoc
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
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      destination: (json['destination'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      sequenceStoreId: (json['sequenceStoreId'] as String?) ?? '',
      status:
          ReadSetExportJobStatus.fromString((json['status'] as String?) ?? ''),
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
      'status': status.value,
      if (completionTime != null)
        'completionTime': iso8601ToJson(completionTime),
    };
  }
}

/// An read set export job filter.
///
/// @nodoc
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
      if (status != null) 'status': status.value,
    };
  }
}

/// A read set activation job.
///
/// @nodoc
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
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      id: (json['id'] as String?) ?? '',
      sequenceStoreId: (json['sequenceStoreId'] as String?) ?? '',
      status: ReadSetActivationJobStatus.fromString(
          (json['status'] as String?) ?? ''),
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
      'status': status.value,
      if (completionTime != null)
        'completionTime': iso8601ToJson(completionTime),
    };
  }
}

/// A read set activation job filter.
///
/// @nodoc
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
      if (status != null) 'status': status.value,
    };
  }
}

/// Part of the response to ListMultipartReadSetUploads, excluding completed and
/// aborted multipart uploads.
///
/// @nodoc
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
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      generatedFrom: (json['generatedFrom'] as String?) ?? '',
      referenceArn: (json['referenceArn'] as String?) ?? '',
      sampleId: (json['sampleId'] as String?) ?? '',
      sequenceStoreId: (json['sequenceStoreId'] as String?) ?? '',
      sourceFileType:
          FileType.fromString((json['sourceFileType'] as String?) ?? ''),
      subjectId: (json['subjectId'] as String?) ?? '',
      uploadId: (json['uploadId'] as String?) ?? '',
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
      'sourceFileType': sourceFileType.value,
      'subjectId': subjectId,
      'uploadId': uploadId,
      if (description != null) 'description': description,
      if (name != null) 'name': name,
      if (tags != null) 'tags': tags,
    };
  }
}

/// A source for an import read set job.
///
/// @nodoc
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

  /// The source's read set ID.
  final String? readSetId;

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
    this.readSetId,
    this.referenceArn,
    this.statusMessage,
    this.tags,
  });

  factory ImportReadSetSourceItem.fromJson(Map<String, dynamic> json) {
    return ImportReadSetSourceItem(
      sampleId: (json['sampleId'] as String?) ?? '',
      sourceFileType:
          FileType.fromString((json['sourceFileType'] as String?) ?? ''),
      sourceFiles: SourceFiles.fromJson(
          (json['sourceFiles'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      status: ReadSetImportJobItemStatus.fromString(
          (json['status'] as String?) ?? ''),
      subjectId: (json['subjectId'] as String?) ?? '',
      description: json['description'] as String?,
      generatedFrom: json['generatedFrom'] as String?,
      name: json['name'] as String?,
      readSetId: json['readSetId'] as String?,
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
    final readSetId = this.readSetId;
    final referenceArn = this.referenceArn;
    final statusMessage = this.statusMessage;
    final tags = this.tags;
    return {
      'sampleId': sampleId,
      'sourceFileType': sourceFileType.value,
      'sourceFiles': sourceFiles,
      'status': status.value,
      'subjectId': subjectId,
      if (description != null) 'description': description,
      if (generatedFrom != null) 'generatedFrom': generatedFrom,
      if (name != null) 'name': name,
      if (readSetId != null) 'readSetId': readSetId,
      if (referenceArn != null) 'referenceArn': referenceArn,
      if (statusMessage != null) 'statusMessage': statusMessage,
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
class ReadSetImportJobItemStatus {
  static const notStarted = ReadSetImportJobItemStatus._('NOT_STARTED');
  static const inProgress = ReadSetImportJobItemStatus._('IN_PROGRESS');
  static const finished = ReadSetImportJobItemStatus._('FINISHED');
  static const failed = ReadSetImportJobItemStatus._('FAILED');

  final String value;

  const ReadSetImportJobItemStatus._(this.value);

  static const values = [notStarted, inProgress, finished, failed];

  static ReadSetImportJobItemStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ReadSetImportJobItemStatus._(value));

  @override
  bool operator ==(other) =>
      other is ReadSetImportJobItemStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Details about a read set.
///
/// @nodoc
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
      id: (json['id'] as String?) ?? '',
      status: ReadSetExportJobItemStatus.fromString(
          (json['status'] as String?) ?? ''),
      statusMessage: json['statusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final status = this.status;
    final statusMessage = this.statusMessage;
    return {
      'id': id,
      'status': status.value,
      if (statusMessage != null) 'statusMessage': statusMessage,
    };
  }
}

/// @nodoc
class ReadSetExportJobItemStatus {
  static const notStarted = ReadSetExportJobItemStatus._('NOT_STARTED');
  static const inProgress = ReadSetExportJobItemStatus._('IN_PROGRESS');
  static const finished = ReadSetExportJobItemStatus._('FINISHED');
  static const failed = ReadSetExportJobItemStatus._('FAILED');

  final String value;

  const ReadSetExportJobItemStatus._(this.value);

  static const values = [notStarted, inProgress, finished, failed];

  static ReadSetExportJobItemStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ReadSetExportJobItemStatus._(value));

  @override
  bool operator ==(other) =>
      other is ReadSetExportJobItemStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A source for a read set activation job.
///
/// @nodoc
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
      readSetId: (json['readSetId'] as String?) ?? '',
      status: ReadSetActivationJobItemStatus.fromString(
          (json['status'] as String?) ?? ''),
      statusMessage: json['statusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final readSetId = this.readSetId;
    final status = this.status;
    final statusMessage = this.statusMessage;
    return {
      'readSetId': readSetId,
      'status': status.value,
      if (statusMessage != null) 'statusMessage': statusMessage,
    };
  }
}

/// @nodoc
class ReadSetActivationJobItemStatus {
  static const notStarted = ReadSetActivationJobItemStatus._('NOT_STARTED');
  static const inProgress = ReadSetActivationJobItemStatus._('IN_PROGRESS');
  static const finished = ReadSetActivationJobItemStatus._('FINISHED');
  static const failed = ReadSetActivationJobItemStatus._('FAILED');

  final String value;

  const ReadSetActivationJobItemStatus._(this.value);

  static const values = [notStarted, inProgress, finished, failed];

  static ReadSetActivationJobItemStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ReadSetActivationJobItemStatus._(value));

  @override
  bool operator ==(other) =>
      other is ReadSetActivationJobItemStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Part of the response to the CompleteReadSetUpload API, including metadata.
///
/// @nodoc
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
      'partSource': partSource.value,
    };
  }
}

/// Details about a sequence store.
///
/// @nodoc
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

  /// Status of the sequence store.
  final SequenceStoreStatus? status;

  /// The status message of the sequence store.
  final String? statusMessage;

  /// The last-updated time of the Sequence Store.
  final DateTime? updateTime;

  SequenceStoreDetail({
    required this.arn,
    required this.creationTime,
    required this.id,
    this.description,
    this.eTagAlgorithmFamily,
    this.fallbackLocation,
    this.name,
    this.sseConfig,
    this.status,
    this.statusMessage,
    this.updateTime,
  });

  factory SequenceStoreDetail.fromJson(Map<String, dynamic> json) {
    return SequenceStoreDetail(
      arn: (json['arn'] as String?) ?? '',
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      id: (json['id'] as String?) ?? '',
      description: json['description'] as String?,
      eTagAlgorithmFamily: (json['eTagAlgorithmFamily'] as String?)
          ?.let(ETagAlgorithmFamily.fromString),
      fallbackLocation: json['fallbackLocation'] as String?,
      name: json['name'] as String?,
      sseConfig: json['sseConfig'] != null
          ? SseConfig.fromJson(json['sseConfig'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)?.let(SequenceStoreStatus.fromString),
      statusMessage: json['statusMessage'] as String?,
      updateTime: timeStampFromJson(json['updateTime']),
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
    final status = this.status;
    final statusMessage = this.statusMessage;
    final updateTime = this.updateTime;
    return {
      'arn': arn,
      'creationTime': iso8601ToJson(creationTime),
      'id': id,
      if (description != null) 'description': description,
      if (eTagAlgorithmFamily != null)
        'eTagAlgorithmFamily': eTagAlgorithmFamily.value,
      if (fallbackLocation != null) 'fallbackLocation': fallbackLocation,
      if (name != null) 'name': name,
      if (sseConfig != null) 'sseConfig': sseConfig,
      if (status != null) 'status': status.value,
      if (statusMessage != null) 'statusMessage': statusMessage,
      if (updateTime != null) 'updateTime': iso8601ToJson(updateTime),
    };
  }
}

/// @nodoc
class ETagAlgorithmFamily {
  static const mD5up = ETagAlgorithmFamily._('MD5up');
  static const sHA256up = ETagAlgorithmFamily._('SHA256up');
  static const sHA512up = ETagAlgorithmFamily._('SHA512up');

  final String value;

  const ETagAlgorithmFamily._(this.value);

  static const values = [mD5up, sHA256up, sHA512up];

  static ETagAlgorithmFamily fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ETagAlgorithmFamily._(value));

  @override
  bool operator ==(other) =>
      other is ETagAlgorithmFamily && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class SequenceStoreStatus {
  static const creating = SequenceStoreStatus._('CREATING');
  static const active = SequenceStoreStatus._('ACTIVE');
  static const updating = SequenceStoreStatus._('UPDATING');
  static const deleting = SequenceStoreStatus._('DELETING');
  static const failed = SequenceStoreStatus._('FAILED');

  final String value;

  const SequenceStoreStatus._(this.value);

  static const values = [creating, active, updating, deleting, failed];

  static SequenceStoreStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SequenceStoreStatus._(value));

  @override
  bool operator ==(other) =>
      other is SequenceStoreStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A filter for a sequence store.
///
/// @nodoc
class SequenceStoreFilter {
  /// The filter's start date.
  final DateTime? createdAfter;

  /// The filter's end date.
  final DateTime? createdBefore;

  /// A name to filter on.
  final String? name;

  /// Filter results based on status.
  final SequenceStoreStatus? status;

  /// Filter results based on stores updated after the specified time.
  final DateTime? updatedAfter;

  /// Filter results based on stores updated before the specified time.
  final DateTime? updatedBefore;

  SequenceStoreFilter({
    this.createdAfter,
    this.createdBefore,
    this.name,
    this.status,
    this.updatedAfter,
    this.updatedBefore,
  });

  Map<String, dynamic> toJson() {
    final createdAfter = this.createdAfter;
    final createdBefore = this.createdBefore;
    final name = this.name;
    final status = this.status;
    final updatedAfter = this.updatedAfter;
    final updatedBefore = this.updatedBefore;
    return {
      if (createdAfter != null) 'createdAfter': iso8601ToJson(createdAfter),
      if (createdBefore != null) 'createdBefore': iso8601ToJson(createdBefore),
      if (name != null) 'name': name,
      if (status != null) 'status': status.value,
      if (updatedAfter != null) 'updatedAfter': iso8601ToJson(updatedAfter),
      if (updatedBefore != null) 'updatedBefore': iso8601ToJson(updatedBefore),
    };
  }
}

/// The S3 access metadata of the sequence store.
///
/// @nodoc
class SequenceStoreS3Access {
  /// Location of the access logs.
  final String? accessLogLocation;

  /// This is ARN of the access point associated with the S3 bucket storing read
  /// sets.
  final String? s3AccessPointArn;

  /// The S3 URI of the sequence store.
  final String? s3Uri;

  SequenceStoreS3Access({
    this.accessLogLocation,
    this.s3AccessPointArn,
    this.s3Uri,
  });

  factory SequenceStoreS3Access.fromJson(Map<String, dynamic> json) {
    return SequenceStoreS3Access(
      accessLogLocation: json['accessLogLocation'] as String?,
      s3AccessPointArn: json['s3AccessPointArn'] as String?,
      s3Uri: json['s3Uri'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accessLogLocation = this.accessLogLocation;
    final s3AccessPointArn = this.s3AccessPointArn;
    final s3Uri = this.s3Uri;
    return {
      if (accessLogLocation != null) 'accessLogLocation': accessLogLocation,
      if (s3AccessPointArn != null) 's3AccessPointArn': s3AccessPointArn,
      if (s3Uri != null) 's3Uri': s3Uri,
    };
  }
}

/// S3 access configuration parameters.
///
/// @nodoc
class S3AccessConfig {
  /// Location of the access logs.
  final String? accessLogLocation;

  S3AccessConfig({
    this.accessLogLocation,
  });

  Map<String, dynamic> toJson() {
    final accessLogLocation = this.accessLogLocation;
    return {
      if (accessLogLocation != null) 'accessLogLocation': accessLogLocation,
    };
  }
}

/// A workflow run task.
///
/// @nodoc
class TaskListItem {
  /// Set to true if Amazon Web Services HealthOmics found a matching entry in the
  /// run cache for this task.
  final bool? cacheHit;

  /// The S3 URI of the cache location.
  final String? cacheS3Uri;

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
    this.cacheHit,
    this.cacheS3Uri,
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
      cacheHit: json['cacheHit'] as bool?,
      cacheS3Uri: json['cacheS3Uri'] as String?,
      cpus: json['cpus'] as int?,
      creationTime: timeStampFromJson(json['creationTime']),
      gpus: json['gpus'] as int?,
      instanceType: json['instanceType'] as String?,
      memory: json['memory'] as int?,
      name: json['name'] as String?,
      startTime: timeStampFromJson(json['startTime']),
      status: (json['status'] as String?)?.let(TaskStatus.fromString),
      stopTime: timeStampFromJson(json['stopTime']),
      taskId: json['taskId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cacheHit = this.cacheHit;
    final cacheS3Uri = this.cacheS3Uri;
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
      if (cacheHit != null) 'cacheHit': cacheHit,
      if (cacheS3Uri != null) 'cacheS3Uri': cacheS3Uri,
      if (cpus != null) 'cpus': cpus,
      if (creationTime != null) 'creationTime': iso8601ToJson(creationTime),
      if (gpus != null) 'gpus': gpus,
      if (instanceType != null) 'instanceType': instanceType,
      if (memory != null) 'memory': memory,
      if (name != null) 'name': name,
      if (startTime != null) 'startTime': iso8601ToJson(startTime),
      if (status != null) 'status': status.value,
      if (stopTime != null) 'stopTime': iso8601ToJson(stopTime),
      if (taskId != null) 'taskId': taskId,
    };
  }
}

/// @nodoc
class TaskStatus {
  static const pending = TaskStatus._('PENDING');
  static const starting = TaskStatus._('STARTING');
  static const running = TaskStatus._('RUNNING');
  static const stopping = TaskStatus._('STOPPING');
  static const completed = TaskStatus._('COMPLETED');
  static const cancelled = TaskStatus._('CANCELLED');
  static const failed = TaskStatus._('FAILED');

  final String value;

  const TaskStatus._(this.value);

  static const values = [
    pending,
    starting,
    running,
    stopping,
    completed,
    cancelled,
    failed
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

/// Information about the container image used for a task.
///
/// @nodoc
class ImageDetails {
  /// The URI of the container image.
  final String? image;

  /// The container image digest. If the image URI was transformed, this will be
  /// the digest of the container image referenced by the transformed URI.
  final String? imageDigest;

  /// URI of the source registry. If the URI is from a third-party registry,
  /// Amazon Web Services HealthOmics transforms the URI to the corresponding ECR
  /// path, using the pull-through cache mapping rules.
  final String? sourceImage;

  ImageDetails({
    this.image,
    this.imageDigest,
    this.sourceImage,
  });

  factory ImageDetails.fromJson(Map<String, dynamic> json) {
    return ImageDetails(
      image: json['image'] as String?,
      imageDigest: json['imageDigest'] as String?,
      sourceImage: json['sourceImage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final image = this.image;
    final imageDigest = this.imageDigest;
    final sourceImage = this.sourceImage;
    return {
      if (image != null) 'image': image,
      if (imageDigest != null) 'imageDigest': imageDigest,
      if (sourceImage != null) 'sourceImage': sourceImage,
    };
  }
}

/// A workflow run.
///
/// @nodoc
class RunListItem {
  /// The run's ARN.
  final String? arn;

  /// The run's batch ID.
  final String? batchId;

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

  /// The name of the workflow version.
  final String? workflowVersionName;

  RunListItem({
    this.arn,
    this.batchId,
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
    this.workflowVersionName,
  });

  factory RunListItem.fromJson(Map<String, dynamic> json) {
    return RunListItem(
      arn: json['arn'] as String?,
      batchId: json['batchId'] as String?,
      creationTime: timeStampFromJson(json['creationTime']),
      id: json['id'] as String?,
      name: json['name'] as String?,
      priority: json['priority'] as int?,
      startTime: timeStampFromJson(json['startTime']),
      status: (json['status'] as String?)?.let(RunStatus.fromString),
      stopTime: timeStampFromJson(json['stopTime']),
      storageCapacity: json['storageCapacity'] as int?,
      storageType:
          (json['storageType'] as String?)?.let(StorageType.fromString),
      workflowId: json['workflowId'] as String?,
      workflowVersionName: json['workflowVersionName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final batchId = this.batchId;
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
    final workflowVersionName = this.workflowVersionName;
    return {
      if (arn != null) 'arn': arn,
      if (batchId != null) 'batchId': batchId,
      if (creationTime != null) 'creationTime': iso8601ToJson(creationTime),
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (priority != null) 'priority': priority,
      if (startTime != null) 'startTime': iso8601ToJson(startTime),
      if (status != null) 'status': status.value,
      if (stopTime != null) 'stopTime': iso8601ToJson(stopTime),
      if (storageCapacity != null) 'storageCapacity': storageCapacity,
      if (storageType != null) 'storageType': storageType.value,
      if (workflowId != null) 'workflowId': workflowId,
      if (workflowVersionName != null)
        'workflowVersionName': workflowVersionName,
    };
  }
}

/// @nodoc
class RunStatus {
  static const pending = RunStatus._('PENDING');
  static const starting = RunStatus._('STARTING');
  static const running = RunStatus._('RUNNING');
  static const stopping = RunStatus._('STOPPING');
  static const completed = RunStatus._('COMPLETED');
  static const deleted = RunStatus._('DELETED');
  static const cancelled = RunStatus._('CANCELLED');
  static const failed = RunStatus._('FAILED');

  final String value;

  const RunStatus._(this.value);

  static const values = [
    pending,
    starting,
    running,
    stopping,
    completed,
    deleted,
    cancelled,
    failed
  ];

  static RunStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => RunStatus._(value));

  @override
  bool operator ==(other) => other is RunStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class CacheBehavior {
  static const cacheOnFailure = CacheBehavior._('CACHE_ON_FAILURE');
  static const cacheAlways = CacheBehavior._('CACHE_ALWAYS');

  final String value;

  const CacheBehavior._(this.value);

  static const values = [cacheOnFailure, cacheAlways];

  static CacheBehavior fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CacheBehavior._(value));

  @override
  bool operator ==(other) => other is CacheBehavior && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class RunLogLevel {
  static const off = RunLogLevel._('OFF');
  static const fatal = RunLogLevel._('FATAL');
  static const error = RunLogLevel._('ERROR');
  static const all = RunLogLevel._('ALL');

  final String value;

  const RunLogLevel._(this.value);

  static const values = [off, fatal, error, all];

  static RunLogLevel fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => RunLogLevel._(value));

  @override
  bool operator ==(other) => other is RunLogLevel && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class RunRetentionMode {
  static const retain = RunRetentionMode._('RETAIN');
  static const remove = RunRetentionMode._('REMOVE');

  final String value;

  const RunRetentionMode._(this.value);

  static const values = [retain, remove];

  static RunRetentionMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RunRetentionMode._(value));

  @override
  bool operator ==(other) => other is RunRetentionMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The URI for the run log.
///
/// @nodoc
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

/// @nodoc
class NetworkingMode {
  static const restricted = NetworkingMode._('RESTRICTED');
  static const vpc = NetworkingMode._('VPC');

  final String value;

  const NetworkingMode._(this.value);

  static const values = [restricted, vpc];

  static NetworkingMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => NetworkingMode._(value));

  @override
  bool operator ==(other) => other is NetworkingMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Minimal details for a configuration resource.
///
/// @nodoc
class ConfigurationDetails {
  /// Unique resource identifier for the configuration.
  final String? arn;

  /// User-friendly name for the configuration.
  final String? name;

  /// Unique identifier for the configuration.
  final String? uuid;

  ConfigurationDetails({
    this.arn,
    this.name,
    this.uuid,
  });

  factory ConfigurationDetails.fromJson(Map<String, dynamic> json) {
    return ConfigurationDetails(
      arn: json['arn'] as String?,
      name: json['name'] as String?,
      uuid: json['uuid'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    final uuid = this.uuid;
    return {
      if (arn != null) 'arn': arn,
      if (name != null) 'name': name,
      if (uuid != null) 'uuid': uuid,
    };
  }
}

/// VPC configuration for workflow runs with computed VPC ID.
///
/// @nodoc
class VpcConfigResponse {
  /// List of security group IDs.
  final List<String>? securityGroupIds;

  /// List of subnet IDs.
  final List<String>? subnetIds;

  /// VPC ID computed from the provided subnet IDs.
  final String? vpcId;

  VpcConfigResponse({
    this.securityGroupIds,
    this.subnetIds,
    this.vpcId,
  });

  factory VpcConfigResponse.fromJson(Map<String, dynamic> json) {
    return VpcConfigResponse(
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
    final securityGroupIds = this.securityGroupIds;
    final subnetIds = this.subnetIds;
    final vpcId = this.vpcId;
    return {
      if (securityGroupIds != null) 'securityGroupIds': securityGroupIds,
      if (subnetIds != null) 'subnetIds': subnetIds,
      if (vpcId != null) 'vpcId': vpcId,
    };
  }
}

/// @nodoc
class RunExport {
  static const definition = RunExport._('DEFINITION');

  final String value;

  const RunExport._(this.value);

  static const values = [definition];

  static RunExport fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => RunExport._(value));

  @override
  bool operator ==(other) => other is RunExport && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A run group.
///
/// @nodoc
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

/// List entry for one run cache.
///
/// @nodoc
class RunCacheListItem {
  /// Unique resource identifier for the run cache.
  final String? arn;

  /// Default cache behavior for the run cache.
  final CacheBehavior? cacheBehavior;

  /// The S3 uri for the run cache data.
  final String? cacheS3Uri;

  /// The time that this run cache was created (an ISO 8601 formatted string).
  final DateTime? creationTime;

  /// The identifier for this run cache.
  final String? id;

  /// The name of the run cache.
  final String? name;

  /// The run cache status.
  final RunCacheStatus? status;

  RunCacheListItem({
    this.arn,
    this.cacheBehavior,
    this.cacheS3Uri,
    this.creationTime,
    this.id,
    this.name,
    this.status,
  });

  factory RunCacheListItem.fromJson(Map<String, dynamic> json) {
    return RunCacheListItem(
      arn: json['arn'] as String?,
      cacheBehavior:
          (json['cacheBehavior'] as String?)?.let(CacheBehavior.fromString),
      cacheS3Uri: json['cacheS3Uri'] as String?,
      creationTime: timeStampFromJson(json['creationTime']),
      id: json['id'] as String?,
      name: json['name'] as String?,
      status: (json['status'] as String?)?.let(RunCacheStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final cacheBehavior = this.cacheBehavior;
    final cacheS3Uri = this.cacheS3Uri;
    final creationTime = this.creationTime;
    final id = this.id;
    final name = this.name;
    final status = this.status;
    return {
      if (arn != null) 'arn': arn,
      if (cacheBehavior != null) 'cacheBehavior': cacheBehavior.value,
      if (cacheS3Uri != null) 'cacheS3Uri': cacheS3Uri,
      if (creationTime != null) 'creationTime': iso8601ToJson(creationTime),
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (status != null) 'status': status.value,
    };
  }
}

/// @nodoc
class RunCacheStatus {
  static const active = RunCacheStatus._('ACTIVE');
  static const deleted = RunCacheStatus._('DELETED');
  static const failed = RunCacheStatus._('FAILED');

  final String value;

  const RunCacheStatus._(this.value);

  static const values = [active, deleted, failed];

  static RunCacheStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RunCacheStatus._(value));

  @override
  bool operator ==(other) => other is RunCacheStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A single run entry returned by <code>ListRunsInBatch</code>.
///
/// @nodoc
class RunBatchListItem {
  /// The unique ARN of the workflow run.
  final String? runArn;

  /// The HealthOmics-generated identifier for the workflow run. Empty if
  /// submission failed.
  final String? runId;

  /// The universally unique identifier (UUID) for the run.
  final String? runInternalUuid;

  /// The customer-provided identifier for the run configuration. Use this to
  /// correlate results back to the input configuration provided in
  /// <code>inlineSettings</code> or <code>s3UriSettings</code>.
  final String? runSettingId;

  /// A detailed message describing the submission failure.
  final String? submissionFailureMessage;

  /// The error category for a failed submission. See the run-level failure table
  /// in the HealthOmics User Guide for details on each value.
  final String? submissionFailureReason;

  /// The submission outcome for this run.
  final SubmissionStatus? submissionStatus;

  RunBatchListItem({
    this.runArn,
    this.runId,
    this.runInternalUuid,
    this.runSettingId,
    this.submissionFailureMessage,
    this.submissionFailureReason,
    this.submissionStatus,
  });

  factory RunBatchListItem.fromJson(Map<String, dynamic> json) {
    return RunBatchListItem(
      runArn: json['runArn'] as String?,
      runId: json['runId'] as String?,
      runInternalUuid: json['runInternalUuid'] as String?,
      runSettingId: json['runSettingId'] as String?,
      submissionFailureMessage: json['submissionFailureMessage'] as String?,
      submissionFailureReason: json['submissionFailureReason'] as String?,
      submissionStatus: (json['submissionStatus'] as String?)
          ?.let(SubmissionStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final runArn = this.runArn;
    final runId = this.runId;
    final runInternalUuid = this.runInternalUuid;
    final runSettingId = this.runSettingId;
    final submissionFailureMessage = this.submissionFailureMessage;
    final submissionFailureReason = this.submissionFailureReason;
    final submissionStatus = this.submissionStatus;
    return {
      if (runArn != null) 'runArn': runArn,
      if (runId != null) 'runId': runId,
      if (runInternalUuid != null) 'runInternalUuid': runInternalUuid,
      if (runSettingId != null) 'runSettingId': runSettingId,
      if (submissionFailureMessage != null)
        'submissionFailureMessage': submissionFailureMessage,
      if (submissionFailureReason != null)
        'submissionFailureReason': submissionFailureReason,
      if (submissionStatus != null) 'submissionStatus': submissionStatus.value,
    };
  }
}

/// @nodoc
class SubmissionStatus {
  static const success = SubmissionStatus._('SUCCESS');
  static const failed = SubmissionStatus._('FAILED');
  static const cancelSuccess = SubmissionStatus._('CANCEL_SUCCESS');
  static const cancelFailed = SubmissionStatus._('CANCEL_FAILED');
  static const deleteSuccess = SubmissionStatus._('DELETE_SUCCESS');
  static const deleteFailed = SubmissionStatus._('DELETE_FAILED');

  final String value;

  const SubmissionStatus._(this.value);

  static const values = [
    success,
    failed,
    cancelSuccess,
    cancelFailed,
    deleteSuccess,
    deleteFailed
  ];

  static SubmissionStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SubmissionStatus._(value));

  @override
  bool operator ==(other) => other is SubmissionStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A summary of a batch returned by <code>ListBatch</code>.
///
/// @nodoc
class BatchListItem {
  /// The timestamp when the batch was created.
  final DateTime? createdAt;

  /// The batch identifier.
  final String? id;

  /// The batch name.
  final String? name;

  /// The current batch status.
  final BatchStatus? status;

  /// The total number of runs in the batch.
  final int? totalRuns;

  /// The identifier of the workflow used for the batch.
  final String? workflowId;

  BatchListItem({
    this.createdAt,
    this.id,
    this.name,
    this.status,
    this.totalRuns,
    this.workflowId,
  });

  factory BatchListItem.fromJson(Map<String, dynamic> json) {
    return BatchListItem(
      createdAt: timeStampFromJson(json['createdAt']),
      id: json['id'] as String?,
      name: json['name'] as String?,
      status: (json['status'] as String?)?.let(BatchStatus.fromString),
      totalRuns: json['totalRuns'] as int?,
      workflowId: json['workflowId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final id = this.id;
    final name = this.name;
    final status = this.status;
    final totalRuns = this.totalRuns;
    final workflowId = this.workflowId;
    return {
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (status != null) 'status': status.value,
      if (totalRuns != null) 'totalRuns': totalRuns,
      if (workflowId != null) 'workflowId': workflowId,
    };
  }
}

/// @nodoc
class BatchStatus {
  static const creating = BatchStatus._('CREATING');
  static const pending = BatchStatus._('PENDING');
  static const submitting = BatchStatus._('SUBMITTING');
  static const inprogress = BatchStatus._('INPROGRESS');
  static const stopping = BatchStatus._('STOPPING');
  static const cancelled = BatchStatus._('CANCELLED');
  static const failed = BatchStatus._('FAILED');
  static const processed = BatchStatus._('PROCESSED');
  static const runsDeleting = BatchStatus._('RUNS_DELETING');
  static const runsDeleted = BatchStatus._('RUNS_DELETED');

  final String value;

  const BatchStatus._(this.value);

  static const values = [
    creating,
    pending,
    submitting,
    inprogress,
    stopping,
    cancelled,
    failed,
    processed,
    runsDeleting,
    runsDeleted
  ];

  static BatchStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => BatchStatus._(value));

  @override
  bool operator ==(other) => other is BatchStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Shared configuration applied to all runs in a batch. Fields specified in a
/// per-run <code>InlineSetting</code> entry override the corresponding fields
/// in this object for that run. The <code>parameters</code> and
/// <code>runTags</code> fields are merged rather than replaced — run-specific
/// values take precedence when keys overlap.
///
/// @nodoc
class DefaultRunSetting {
  /// The IAM role ARN that grants HealthOmics permissions to access required AWS
  /// resources such as Amazon S3 and CloudWatch. The role must have the same
  /// permissions required for individual <code>StartRun</code> calls.
  final String roleArn;

  /// The identifier of the workflow to run.
  final String workflowId;

  /// The cache behavior for the runs. Requires <code>cacheId</code> to be set.
  final CacheBehavior? cacheBehavior;

  /// The identifier of the run cache to associate with the runs.
  final String? cacheId;

  /// Optional configuration name to use for the workflow run.
  final String? configurationName;

  /// The verbosity level for CloudWatch Logs emitted during each run.
  final RunLogLevel? logLevel;

  /// An optional user-friendly name applied to each workflow run. Can be
  /// overridden per run.
  final String? name;

  /// Optional configuration for run networking behavior. If not specified, this
  /// will default to RESTRICTED.
  final NetworkingMode? networkingMode;

  /// The expected AWS account ID of the owner of the output S3 bucket. Can be
  /// overridden per run.
  final String? outputBucketOwnerId;

  /// The destination S3 URI for workflow outputs. Must begin with
  /// <code>s3://</code>. The <code>roleArn</code> must grant write permissions to
  /// this bucket. Can be overridden per run.
  final String? outputUri;

  /// Workflow parameter names and values shared across all runs. Merged with
  /// per-run parameters; run-specific values take precedence when keys overlap.
  /// Can be overridden per run.
  final Object? parameters;

  /// An integer priority for the workflow runs. Higher values correspond to
  /// higher priority. A value of 0 corresponds to the lowest priority. Can be
  /// overridden per run.
  final int? priority;

  /// The retention behavior for runs after completion.
  final RunRetentionMode? retentionMode;

  /// The ID of the run group to contain all workflow runs in the batch.
  final String? runGroupId;

  /// AWS tags to associate with each workflow run. Merged with per-run
  /// <code>runTags</code>; run-specific values take precedence when keys overlap.
  final Map<String, String>? runTags;

  /// The filesystem size in gibibytes (GiB) provisioned for each workflow run and
  /// shared by all tasks in that run. Defaults to 1200 GiB if not specified.
  final int? storageCapacity;

  /// The storage type for the workflow runs.
  final StorageType? storageType;

  /// The AWS account ID of the workflow owner, used for cross-account workflow
  /// sharing.
  final String? workflowOwnerId;

  /// The type of the originating workflow. Batch runs are not supported with
  /// <code>READY2RUN</code> workflows.
  final WorkflowType? workflowType;

  /// The version name of the specified workflow.
  final String? workflowVersionName;

  DefaultRunSetting({
    required this.roleArn,
    required this.workflowId,
    this.cacheBehavior,
    this.cacheId,
    this.configurationName,
    this.logLevel,
    this.name,
    this.networkingMode,
    this.outputBucketOwnerId,
    this.outputUri,
    this.parameters,
    this.priority,
    this.retentionMode,
    this.runGroupId,
    this.runTags,
    this.storageCapacity,
    this.storageType,
    this.workflowOwnerId,
    this.workflowType,
    this.workflowVersionName,
  });

  factory DefaultRunSetting.fromJson(Map<String, dynamic> json) {
    return DefaultRunSetting(
      roleArn: (json['roleArn'] as String?) ?? '',
      workflowId: (json['workflowId'] as String?) ?? '',
      cacheBehavior:
          (json['cacheBehavior'] as String?)?.let(CacheBehavior.fromString),
      cacheId: json['cacheId'] as String?,
      configurationName: json['configurationName'] as String?,
      logLevel: (json['logLevel'] as String?)?.let(RunLogLevel.fromString),
      name: json['name'] as String?,
      networkingMode:
          (json['networkingMode'] as String?)?.let(NetworkingMode.fromString),
      outputBucketOwnerId: json['outputBucketOwnerId'] as String?,
      outputUri: json['outputUri'] as String?,
      parameters: json['parameters'],
      priority: json['priority'] as int?,
      retentionMode:
          (json['retentionMode'] as String?)?.let(RunRetentionMode.fromString),
      runGroupId: json['runGroupId'] as String?,
      runTags: (json['runTags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      storageCapacity: json['storageCapacity'] as int?,
      storageType:
          (json['storageType'] as String?)?.let(StorageType.fromString),
      workflowOwnerId: json['workflowOwnerId'] as String?,
      workflowType:
          (json['workflowType'] as String?)?.let(WorkflowType.fromString),
      workflowVersionName: json['workflowVersionName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final roleArn = this.roleArn;
    final workflowId = this.workflowId;
    final cacheBehavior = this.cacheBehavior;
    final cacheId = this.cacheId;
    final configurationName = this.configurationName;
    final logLevel = this.logLevel;
    final name = this.name;
    final networkingMode = this.networkingMode;
    final outputBucketOwnerId = this.outputBucketOwnerId;
    final outputUri = this.outputUri;
    final parameters = this.parameters;
    final priority = this.priority;
    final retentionMode = this.retentionMode;
    final runGroupId = this.runGroupId;
    final runTags = this.runTags;
    final storageCapacity = this.storageCapacity;
    final storageType = this.storageType;
    final workflowOwnerId = this.workflowOwnerId;
    final workflowType = this.workflowType;
    final workflowVersionName = this.workflowVersionName;
    return {
      'roleArn': roleArn,
      'workflowId': workflowId,
      if (cacheBehavior != null) 'cacheBehavior': cacheBehavior.value,
      if (cacheId != null) 'cacheId': cacheId,
      if (configurationName != null) 'configurationName': configurationName,
      if (logLevel != null) 'logLevel': logLevel.value,
      if (name != null) 'name': name,
      if (networkingMode != null) 'networkingMode': networkingMode.value,
      if (outputBucketOwnerId != null)
        'outputBucketOwnerId': outputBucketOwnerId,
      if (outputUri != null) 'outputUri': outputUri,
      if (parameters != null) 'parameters': parameters,
      if (priority != null) 'priority': priority,
      if (retentionMode != null) 'retentionMode': retentionMode.value,
      if (runGroupId != null) 'runGroupId': runGroupId,
      if (runTags != null) 'runTags': runTags,
      if (storageCapacity != null) 'storageCapacity': storageCapacity,
      if (storageType != null) 'storageType': storageType.value,
      if (workflowOwnerId != null) 'workflowOwnerId': workflowOwnerId,
      if (workflowType != null) 'workflowType': workflowType.value,
      if (workflowVersionName != null)
        'workflowVersionName': workflowVersionName,
    };
  }
}

/// A summary of the submissions in a batch.
///
/// @nodoc
class SubmissionSummary {
  /// The number of failed cancel submissions.
  final int? failedCancelSubmissionCount;

  /// The number of failed delete submissions.
  final int? failedDeleteSubmissionCount;

  /// The number of failed start submissions.
  final int? failedStartSubmissionCount;

  /// The number of pending start submissions.
  final int? pendingStartSubmissionCount;

  /// The number of successful cancel submissions.
  final int? successfulCancelSubmissionCount;

  /// The number of successful delete submissions.
  final int? successfulDeleteSubmissionCount;

  /// The number of successful start submissions.
  final int? successfulStartSubmissionCount;

  SubmissionSummary({
    this.failedCancelSubmissionCount,
    this.failedDeleteSubmissionCount,
    this.failedStartSubmissionCount,
    this.pendingStartSubmissionCount,
    this.successfulCancelSubmissionCount,
    this.successfulDeleteSubmissionCount,
    this.successfulStartSubmissionCount,
  });

  factory SubmissionSummary.fromJson(Map<String, dynamic> json) {
    return SubmissionSummary(
      failedCancelSubmissionCount: json['failedCancelSubmissionCount'] as int?,
      failedDeleteSubmissionCount: json['failedDeleteSubmissionCount'] as int?,
      failedStartSubmissionCount: json['failedStartSubmissionCount'] as int?,
      pendingStartSubmissionCount: json['pendingStartSubmissionCount'] as int?,
      successfulCancelSubmissionCount:
          json['successfulCancelSubmissionCount'] as int?,
      successfulDeleteSubmissionCount:
          json['successfulDeleteSubmissionCount'] as int?,
      successfulStartSubmissionCount:
          json['successfulStartSubmissionCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final failedCancelSubmissionCount = this.failedCancelSubmissionCount;
    final failedDeleteSubmissionCount = this.failedDeleteSubmissionCount;
    final failedStartSubmissionCount = this.failedStartSubmissionCount;
    final pendingStartSubmissionCount = this.pendingStartSubmissionCount;
    final successfulCancelSubmissionCount =
        this.successfulCancelSubmissionCount;
    final successfulDeleteSubmissionCount =
        this.successfulDeleteSubmissionCount;
    final successfulStartSubmissionCount = this.successfulStartSubmissionCount;
    return {
      if (failedCancelSubmissionCount != null)
        'failedCancelSubmissionCount': failedCancelSubmissionCount,
      if (failedDeleteSubmissionCount != null)
        'failedDeleteSubmissionCount': failedDeleteSubmissionCount,
      if (failedStartSubmissionCount != null)
        'failedStartSubmissionCount': failedStartSubmissionCount,
      if (pendingStartSubmissionCount != null)
        'pendingStartSubmissionCount': pendingStartSubmissionCount,
      if (successfulCancelSubmissionCount != null)
        'successfulCancelSubmissionCount': successfulCancelSubmissionCount,
      if (successfulDeleteSubmissionCount != null)
        'successfulDeleteSubmissionCount': successfulDeleteSubmissionCount,
      if (successfulStartSubmissionCount != null)
        'successfulStartSubmissionCount': successfulStartSubmissionCount,
    };
  }
}

/// A summary of the runs in a batch.
///
/// @nodoc
class RunSummary {
  /// The number of cancelled runs.
  final int? cancelledRunCount;

  /// The number of completed runs.
  final int? completedRunCount;

  /// The number of deleted runs.
  final int? deletedRunCount;

  /// The number of failed runs.
  final int? failedRunCount;

  /// The number of pending runs.
  final int? pendingRunCount;

  /// The number of running runs.
  final int? runningRunCount;

  /// The number of starting runs.
  final int? startingRunCount;

  /// The number of stopping runs.
  final int? stoppingRunCount;

  RunSummary({
    this.cancelledRunCount,
    this.completedRunCount,
    this.deletedRunCount,
    this.failedRunCount,
    this.pendingRunCount,
    this.runningRunCount,
    this.startingRunCount,
    this.stoppingRunCount,
  });

  factory RunSummary.fromJson(Map<String, dynamic> json) {
    return RunSummary(
      cancelledRunCount: json['cancelledRunCount'] as int?,
      completedRunCount: json['completedRunCount'] as int?,
      deletedRunCount: json['deletedRunCount'] as int?,
      failedRunCount: json['failedRunCount'] as int?,
      pendingRunCount: json['pendingRunCount'] as int?,
      runningRunCount: json['runningRunCount'] as int?,
      startingRunCount: json['startingRunCount'] as int?,
      stoppingRunCount: json['stoppingRunCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final cancelledRunCount = this.cancelledRunCount;
    final completedRunCount = this.completedRunCount;
    final deletedRunCount = this.deletedRunCount;
    final failedRunCount = this.failedRunCount;
    final pendingRunCount = this.pendingRunCount;
    final runningRunCount = this.runningRunCount;
    final startingRunCount = this.startingRunCount;
    final stoppingRunCount = this.stoppingRunCount;
    return {
      if (cancelledRunCount != null) 'cancelledRunCount': cancelledRunCount,
      if (completedRunCount != null) 'completedRunCount': completedRunCount,
      if (deletedRunCount != null) 'deletedRunCount': deletedRunCount,
      if (failedRunCount != null) 'failedRunCount': failedRunCount,
      if (pendingRunCount != null) 'pendingRunCount': pendingRunCount,
      if (runningRunCount != null) 'runningRunCount': runningRunCount,
      if (startingRunCount != null) 'startingRunCount': startingRunCount,
      if (stoppingRunCount != null) 'stoppingRunCount': stoppingRunCount,
    };
  }
}

/// A union type representing per-run configurations for the batch. Specify
/// exactly one of the following members.
///
/// @nodoc
class BatchRunSettings {
  /// A list of per-run configurations provided inline in the request. Each entry
  /// must include a unique <code>runSettingId</code>. Supports up to 100 entries.
  /// For batches with more than 100 runs, use <code>s3UriSettings</code>.
  final List<InlineSetting>? inlineSettings;

  /// An Amazon S3 URI pointing to a JSON file containing per-run configurations.
  /// The file must be a JSON array in the same format as
  /// <code>inlineSettings</code>. Supports up to 100,000 run configurations. The
  /// maximum file size is 6 GB.
  ///
  /// The IAM service role in <code>roleArn</code> must have read access to this
  /// S3 object. HealthOmics validates access to the file during the synchronous
  /// API call and records the file's ETag. If the file is modified after
  /// submission, the batch fails.
  final String? s3UriSettings;

  BatchRunSettings({
    this.inlineSettings,
    this.s3UriSettings,
  });

  Map<String, dynamic> toJson() {
    final inlineSettings = this.inlineSettings;
    final s3UriSettings = this.s3UriSettings;
    return {
      if (inlineSettings != null) 'inlineSettings': inlineSettings,
      if (s3UriSettings != null) 's3UriSettings': s3UriSettings,
    };
  }
}

/// A per-run configuration that overrides or merges with fields from
/// <code>DefaultRunSetting</code> for a specific run.
///
/// @nodoc
class InlineSetting {
  /// A customer-provided unique identifier for this run configuration within the
  /// batch. After submission, use <code>ListRunsInBatch</code> to map each
  /// <code>runSettingId</code> to the HealthOmics-generated <code>runId</code>.
  final String runSettingId;

  /// An optional user-friendly name for this run.
  final String? name;

  /// The expected AWS account ID of the owner of the output S3 bucket for this
  /// run.
  final String? outputBucketOwnerId;

  /// Override the destination S3 URI for this run's outputs.
  final String? outputUri;

  /// Per-run workflow parameters. Merged with
  /// <code>defaultRunSetting.parameters</code>; values in this object take
  /// precedence when keys overlap.
  final Object? parameters;

  /// Override the priority for this run.
  final int? priority;

  /// Per-run AWS tags. Merged with <code>defaultRunSetting.runTags</code>; values
  /// in this object take precedence when keys overlap.
  final Map<String, String>? runTags;

  InlineSetting({
    required this.runSettingId,
    this.name,
    this.outputBucketOwnerId,
    this.outputUri,
    this.parameters,
    this.priority,
    this.runTags,
  });

  Map<String, dynamic> toJson() {
    final runSettingId = this.runSettingId;
    final name = this.name;
    final outputBucketOwnerId = this.outputBucketOwnerId;
    final outputUri = this.outputUri;
    final parameters = this.parameters;
    final priority = this.priority;
    final runTags = this.runTags;
    return {
      'runSettingId': runSettingId,
      if (name != null) 'name': name,
      if (outputBucketOwnerId != null)
        'outputBucketOwnerId': outputBucketOwnerId,
      if (outputUri != null) 'outputUri': outputUri,
      if (parameters != null) 'parameters': parameters,
      if (priority != null) 'priority': priority,
      if (runTags != null) 'runTags': runTags,
    };
  }
}

/// @nodoc
class ReferenceFile {
  static const source = ReferenceFile._('SOURCE');
  static const $index = ReferenceFile._('INDEX');

  final String value;

  const ReferenceFile._(this.value);

  static const values = [source, $index];

  static ReferenceFile fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ReferenceFile._(value));

  @override
  bool operator ==(other) => other is ReferenceFile && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A genome reference.
///
/// @nodoc
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
      arn: (json['arn'] as String?) ?? '',
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      id: (json['id'] as String?) ?? '',
      md5: (json['md5'] as String?) ?? '',
      referenceStoreId: (json['referenceStoreId'] as String?) ?? '',
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
      description: json['description'] as String?,
      name: json['name'] as String?,
      status: (json['status'] as String?)?.let(ReferenceStatus.fromString),
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
      if (status != null) 'status': status.value,
    };
  }
}

/// @nodoc
class ReferenceStatus {
  static const active = ReferenceStatus._('ACTIVE');
  static const deleting = ReferenceStatus._('DELETING');
  static const deleted = ReferenceStatus._('DELETED');

  final String value;

  const ReferenceStatus._(this.value);

  static const values = [active, deleting, deleted];

  static ReferenceStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ReferenceStatus._(value));

  @override
  bool operator ==(other) => other is ReferenceStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A filter for references.
///
/// @nodoc
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

/// A set of genome reference files.
///
/// @nodoc
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

/// @nodoc
class ReferenceCreationType {
  static const import = ReferenceCreationType._('IMPORT');

  final String value;

  const ReferenceCreationType._(this.value);

  static const values = [import];

  static ReferenceCreationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ReferenceCreationType._(value));

  @override
  bool operator ==(other) =>
      other is ReferenceCreationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ReferenceImportJobStatus {
  static const submitted = ReferenceImportJobStatus._('SUBMITTED');
  static const inProgress = ReferenceImportJobStatus._('IN_PROGRESS');
  static const cancelling = ReferenceImportJobStatus._('CANCELLING');
  static const cancelled = ReferenceImportJobStatus._('CANCELLED');
  static const failed = ReferenceImportJobStatus._('FAILED');
  static const completed = ReferenceImportJobStatus._('COMPLETED');
  static const completedWithFailures =
      ReferenceImportJobStatus._('COMPLETED_WITH_FAILURES');

  final String value;

  const ReferenceImportJobStatus._(this.value);

  static const values = [
    submitted,
    inProgress,
    cancelling,
    cancelled,
    failed,
    completed,
    completedWithFailures
  ];

  static ReferenceImportJobStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ReferenceImportJobStatus._(value));

  @override
  bool operator ==(other) =>
      other is ReferenceImportJobStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A source for a reference import job.
///
/// @nodoc
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

/// An import reference job.
///
/// @nodoc
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
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      id: (json['id'] as String?) ?? '',
      referenceStoreId: (json['referenceStoreId'] as String?) ?? '',
      roleArn: (json['roleArn'] as String?) ?? '',
      status: ReferenceImportJobStatus.fromString(
          (json['status'] as String?) ?? ''),
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
      'status': status.value,
      if (completionTime != null)
        'completionTime': iso8601ToJson(completionTime),
    };
  }
}

/// A filter for import references.
///
/// @nodoc
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
      if (status != null) 'status': status.value,
    };
  }
}

/// An genome reference source.
///
/// @nodoc
class ImportReferenceSourceItem {
  /// The source's status.
  final ReferenceImportJobItemStatus status;

  /// The source's description.
  final String? description;

  /// The source's name.
  final String? name;

  /// The source's reference ID.
  final String? referenceId;

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
    this.referenceId,
    this.sourceFile,
    this.statusMessage,
    this.tags,
  });

  factory ImportReferenceSourceItem.fromJson(Map<String, dynamic> json) {
    return ImportReferenceSourceItem(
      status: ReferenceImportJobItemStatus.fromString(
          (json['status'] as String?) ?? ''),
      description: json['description'] as String?,
      name: json['name'] as String?,
      referenceId: json['referenceId'] as String?,
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
    final referenceId = this.referenceId;
    final sourceFile = this.sourceFile;
    final statusMessage = this.statusMessage;
    final tags = this.tags;
    return {
      'status': status.value,
      if (description != null) 'description': description,
      if (name != null) 'name': name,
      if (referenceId != null) 'referenceId': referenceId,
      if (sourceFile != null) 'sourceFile': sourceFile,
      if (statusMessage != null) 'statusMessage': statusMessage,
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
class ReferenceImportJobItemStatus {
  static const notStarted = ReferenceImportJobItemStatus._('NOT_STARTED');
  static const inProgress = ReferenceImportJobItemStatus._('IN_PROGRESS');
  static const finished = ReferenceImportJobItemStatus._('FINISHED');
  static const failed = ReferenceImportJobItemStatus._('FAILED');

  final String value;

  const ReferenceImportJobItemStatus._(this.value);

  static const values = [notStarted, inProgress, finished, failed];

  static ReferenceImportJobItemStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ReferenceImportJobItemStatus._(value));

  @override
  bool operator ==(other) =>
      other is ReferenceImportJobItemStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Details about a reference store.
///
/// @nodoc
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
      arn: (json['arn'] as String?) ?? '',
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      id: (json['id'] as String?) ?? '',
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
///
/// @nodoc
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

/// Configuration list item with summary information.
///
/// @nodoc
class ConfigurationListItem {
  /// Unique resource identifier for the configuration.
  final String? arn;

  /// Configuration creation timestamp.
  final DateTime? creationTime;

  /// Description for the configuration.
  final String? description;

  /// User-friendly name for the configuration.
  final String? name;

  /// Current configuration status.
  final ConfigurationStatus? status;

  ConfigurationListItem({
    this.arn,
    this.creationTime,
    this.description,
    this.name,
    this.status,
  });

  factory ConfigurationListItem.fromJson(Map<String, dynamic> json) {
    return ConfigurationListItem(
      arn: json['arn'] as String?,
      creationTime: timeStampFromJson(json['creationTime']),
      description: json['description'] as String?,
      name: json['name'] as String?,
      status: (json['status'] as String?)?.let(ConfigurationStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final description = this.description;
    final name = this.name;
    final status = this.status;
    return {
      if (arn != null) 'arn': arn,
      if (creationTime != null) 'creationTime': iso8601ToJson(creationTime),
      if (description != null) 'description': description,
      if (name != null) 'name': name,
      if (status != null) 'status': status.value,
    };
  }
}

/// @nodoc
class ConfigurationStatus {
  static const creating = ConfigurationStatus._('CREATING');
  static const active = ConfigurationStatus._('ACTIVE');
  static const updating = ConfigurationStatus._('UPDATING');
  static const deleting = ConfigurationStatus._('DELETING');
  static const deleted = ConfigurationStatus._('DELETED');
  static const failed = ConfigurationStatus._('FAILED');

  final String value;

  const ConfigurationStatus._(this.value);

  static const values = [creating, active, updating, deleting, deleted, failed];

  static ConfigurationStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ConfigurationStatus._(value));

  @override
  bool operator ==(other) =>
      other is ConfigurationStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Run-specific configuration settings with computed values.
///
/// @nodoc
class RunConfigurationsResponse {
  /// VPC configuration for workflow runs with computed VPC ID.
  final VpcConfigResponse? vpcConfig;

  RunConfigurationsResponse({
    this.vpcConfig,
  });

  factory RunConfigurationsResponse.fromJson(Map<String, dynamic> json) {
    return RunConfigurationsResponse(
      vpcConfig: json['vpcConfig'] != null
          ? VpcConfigResponse.fromJson(
              json['vpcConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final vpcConfig = this.vpcConfig;
    return {
      if (vpcConfig != null) 'vpcConfig': vpcConfig,
    };
  }
}

/// Run-specific configuration settings.
///
/// @nodoc
class RunConfigurations {
  /// VPC configuration for workflow runs.
  final VpcConfig? vpcConfig;

  RunConfigurations({
    this.vpcConfig,
  });

  Map<String, dynamic> toJson() {
    final vpcConfig = this.vpcConfig;
    return {
      if (vpcConfig != null) 'vpcConfig': vpcConfig,
    };
  }
}

/// VPC configuration for workflow runs.
///
/// @nodoc
class VpcConfig {
  /// List of security group IDs. Maximum of 5 security groups allowed.
  final List<String>? securityGroupIds;

  /// List of subnet IDs. Maximum of 16 subnets allowed.
  final List<String>? subnetIds;

  VpcConfig({
    this.securityGroupIds,
    this.subnetIds,
  });

  Map<String, dynamic> toJson() {
    final securityGroupIds = this.securityGroupIds;
    final subnetIds = this.subnetIds;
    return {
      if (securityGroupIds != null) 'securityGroupIds': securityGroupIds,
      if (subnetIds != null) 'subnetIds': subnetIds,
    };
  }
}

/// The error preventing deletion of the annotation store version.
///
/// @nodoc
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
      message: (json['message'] as String?) ?? '',
      versionName: (json['versionName'] as String?) ?? '',
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

/// Annotation store versions.
///
/// @nodoc
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
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      description: (json['description'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      status: VersionStatus.fromString((json['status'] as String?) ?? ''),
      statusMessage: (json['statusMessage'] as String?) ?? '',
      storeId: (json['storeId'] as String?) ?? '',
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
      versionArn: (json['versionArn'] as String?) ?? '',
      versionName: (json['versionName'] as String?) ?? '',
      versionSizeBytes: (json['versionSizeBytes'] as int?) ?? 0,
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
      'status': status.value,
      'statusMessage': statusMessage,
      'storeId': storeId,
      'updateTime': iso8601ToJson(updateTime),
      'versionArn': versionArn,
      'versionName': versionName,
      'versionSizeBytes': versionSizeBytes,
    };
  }
}

/// @nodoc
class VersionStatus {
  static const creating = VersionStatus._('CREATING');
  static const updating = VersionStatus._('UPDATING');
  static const deleting = VersionStatus._('DELETING');
  static const active = VersionStatus._('ACTIVE');
  static const failed = VersionStatus._('FAILED');

  final String value;

  const VersionStatus._(this.value);

  static const values = [creating, updating, deleting, active, failed];

  static VersionStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => VersionStatus._(value));

  @override
  bool operator ==(other) => other is VersionStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Use filters to focus the returned annotation store versions on a specific
/// parameter, such as the status of the annotation store.
///
/// @nodoc
class ListAnnotationStoreVersionsFilter {
  /// The status of an annotation store version.
  final VersionStatus? status;

  ListAnnotationStoreVersionsFilter({
    this.status,
  });

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      if (status != null) 'status': status.value,
    };
  }
}

/// The options for an annotation store version.
///
/// @nodoc
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

/// The options for a TSV file.
///
/// @nodoc
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
      annotationType:
          (json['annotationType'] as String?)?.let(AnnotationType.fromString),
      formatToHeader: (json['formatToHeader'] as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(FormatToHeaderKey.fromString(k), e as String)),
      schema: (json['schema'] as List?)
          ?.nonNulls
          .map((e) => (e as Map<String, dynamic>).map(
              (k, e) => MapEntry(k, SchemaValueType.fromString((e as String)))))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final annotationType = this.annotationType;
    final formatToHeader = this.formatToHeader;
    final schema = this.schema;
    return {
      if (annotationType != null) 'annotationType': annotationType.value,
      if (formatToHeader != null)
        'formatToHeader': formatToHeader.map((k, e) => MapEntry(k.value, e)),
      if (schema != null)
        'schema':
            schema.map((e) => e.map((k, e) => MapEntry(k, e.value))).toList(),
    };
  }
}

/// @nodoc
class AnnotationType {
  static const generic = AnnotationType._('GENERIC');
  static const chrPos = AnnotationType._('CHR_POS');
  static const chrPosRefAlt = AnnotationType._('CHR_POS_REF_ALT');
  static const chrStartEndOneBase = AnnotationType._('CHR_START_END_ONE_BASE');
  static const chrStartEndRefAltOneBase =
      AnnotationType._('CHR_START_END_REF_ALT_ONE_BASE');
  static const chrStartEndZeroBase =
      AnnotationType._('CHR_START_END_ZERO_BASE');
  static const chrStartEndRefAltZeroBase =
      AnnotationType._('CHR_START_END_REF_ALT_ZERO_BASE');

  final String value;

  const AnnotationType._(this.value);

  static const values = [
    generic,
    chrPos,
    chrPosRefAlt,
    chrStartEndOneBase,
    chrStartEndRefAltOneBase,
    chrStartEndZeroBase,
    chrStartEndRefAltZeroBase
  ];

  static AnnotationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AnnotationType._(value));

  @override
  bool operator ==(other) => other is AnnotationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class SchemaValueType {
  static const long = SchemaValueType._('LONG');
  static const $int = SchemaValueType._('INT');
  static const string = SchemaValueType._('STRING');
  static const float = SchemaValueType._('FLOAT');
  static const $double = SchemaValueType._('DOUBLE');
  static const boolean = SchemaValueType._('BOOLEAN');

  final String value;

  const SchemaValueType._(this.value);

  static const values = [long, $int, string, float, $double, boolean];

  static SchemaValueType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SchemaValueType._(value));

  @override
  bool operator ==(other) => other is SchemaValueType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class FormatToHeaderKey {
  static const chr = FormatToHeaderKey._('CHR');
  static const start = FormatToHeaderKey._('START');
  static const end = FormatToHeaderKey._('END');
  static const ref = FormatToHeaderKey._('REF');
  static const alt = FormatToHeaderKey._('ALT');
  static const pos = FormatToHeaderKey._('POS');

  final String value;

  const FormatToHeaderKey._(this.value);

  static const values = [chr, start, end, ref, alt, pos];

  static FormatToHeaderKey fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => FormatToHeaderKey._(value));

  @override
  bool operator ==(other) => other is FormatToHeaderKey && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An annotation store.
///
/// @nodoc
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
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      description: (json['description'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      reference: ReferenceItem.fromJson(
          (json['reference'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      sseConfig: SseConfig.fromJson(
          (json['sseConfig'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      status: StoreStatus.fromString((json['status'] as String?) ?? ''),
      statusMessage: (json['statusMessage'] as String?) ?? '',
      storeArn: (json['storeArn'] as String?) ?? '',
      storeFormat:
          StoreFormat.fromString((json['storeFormat'] as String?) ?? ''),
      storeSizeBytes: (json['storeSizeBytes'] as int?) ?? 0,
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
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
      'status': status.value,
      'statusMessage': statusMessage,
      'storeArn': storeArn,
      'storeFormat': storeFormat.value,
      'storeSizeBytes': storeSizeBytes,
      'updateTime': iso8601ToJson(updateTime),
    };
  }
}

/// @nodoc
class StoreFormat {
  static const gff = StoreFormat._('GFF');
  static const tsv = StoreFormat._('TSV');
  static const vcf = StoreFormat._('VCF');

  final String value;

  const StoreFormat._(this.value);

  static const values = [gff, tsv, vcf];

  static StoreFormat fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => StoreFormat._(value));

  @override
  bool operator ==(other) => other is StoreFormat && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A filter for annotation stores.
///
/// @nodoc
class ListAnnotationStoresFilter {
  /// A status to filter on.
  final StoreStatus? status;

  ListAnnotationStoresFilter({
    this.status,
  });

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      if (status != null) 'status': status.value,
    };
  }
}

/// Settings for a store.
///
/// @nodoc
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

/// File settings for a TSV store.
///
/// @nodoc
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
      annotationType:
          (json['annotationType'] as String?)?.let(AnnotationType.fromString),
      formatToHeader: (json['formatToHeader'] as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(FormatToHeaderKey.fromString(k), e as String)),
      schema: (json['schema'] as List?)
          ?.nonNulls
          .map((e) => (e as Map<String, dynamic>).map(
              (k, e) => MapEntry(k, SchemaValueType.fromString((e as String)))))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final annotationType = this.annotationType;
    final formatToHeader = this.formatToHeader;
    final schema = this.schema;
    return {
      if (annotationType != null) 'annotationType': annotationType.value,
      if (formatToHeader != null)
        'formatToHeader': formatToHeader.map((k, e) => MapEntry(k.value, e)),
      if (schema != null)
        'schema':
            schema.map((e) => e.map((k, e) => MapEntry(k, e.value))).toList(),
    };
  }
}

/// An annotation import job.
///
/// @nodoc
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
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      destinationName: (json['destinationName'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      roleArn: (json['roleArn'] as String?) ?? '',
      status: JobStatus.fromString((json['status'] as String?) ?? ''),
      updateTime: nonNullableTimeStampFromJson(json['updateTime'] ?? 0),
      versionName: (json['versionName'] as String?) ?? '',
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
      'status': status.value,
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

/// A filter for annotation import jobs.
///
/// @nodoc
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
      if (status != null) 'status': status.value,
      if (storeName != null) 'storeName': storeName,
    };
  }
}

/// Formatting options for a file.
///
/// @nodoc
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

/// Formatting options for a TSV file.
///
/// @nodoc
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

/// Formatting options for a VCF file.
///
/// @nodoc
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

/// Read options for an annotation import job.
///
/// @nodoc
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

/// Details about an imported annotation item.
///
/// @nodoc
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
      jobStatus: JobStatus.fromString((json['jobStatus'] as String?) ?? ''),
      source: (json['source'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final jobStatus = this.jobStatus;
    final source = this.source;
    return {
      'jobStatus': jobStatus.value,
      'source': source,
    };
  }
}

/// A source for an annotation import job.
///
/// @nodoc
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

/// @nodoc
class StoreType {
  static const sequenceStore = StoreType._('SEQUENCE_STORE');
  static const referenceStore = StoreType._('REFERENCE_STORE');

  final String value;

  const StoreType._(this.value);

  static const values = [sequenceStore, referenceStore];

  static StoreType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => StoreType._(value));

  @override
  bool operator ==(other) => other is StoreType && other.value == value;

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
class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

/// @nodoc
class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

/// @nodoc
class NotSupportedOperationException extends _s.GenericAwsException {
  NotSupportedOperationException({String? type, String? message})
      : super(
            type: type,
            code: 'NotSupportedOperationException',
            message: message);
}

/// @nodoc
class RangeNotSatisfiableException extends _s.GenericAwsException {
  RangeNotSatisfiableException({String? type, String? message})
      : super(
            type: type, code: 'RangeNotSatisfiableException', message: message);
}

/// @nodoc
class RequestTimeoutException extends _s.GenericAwsException {
  RequestTimeoutException({String? type, String? message})
      : super(type: type, code: 'RequestTimeoutException', message: message);
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
