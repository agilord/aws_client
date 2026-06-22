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

import 'v2023_07_19.endpoints.dart' as _endpoints;
export '../../shared/shared.dart' show AwsClientCredentials;

/// This is the <i>AWS HealthImaging API Reference</i>. For an introduction to
/// the service, see <a
/// href="https://docs.aws.amazon.com/healthimaging/latest/devguide/what-is.html">What
/// is AWS HealthImaging?</a> in the <i>AWS HealthImaging Developer Guide</i>.
class MedicalImaging {
  final _s.RestJsonProtocol _protocol;
  factory MedicalImaging({
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
      endpointPrefix: 'medical-imaging',
    );
    return MedicalImaging._(
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
  MedicalImaging._({
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

  /// Copy an image set.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [copyImageSetInformation] :
  /// Copy image set information.
  ///
  /// Parameter [datastoreId] :
  /// The data store identifier.
  ///
  /// Parameter [sourceImageSetId] :
  /// The source image set identifier.
  ///
  /// Parameter [force] :
  /// Providing this parameter will force completion of the
  /// <code>CopyImageSet</code> operation, even if there are inconsistent
  /// Patient, Study, and/or Series level metadata elements between the
  /// <code>sourceImageSet</code> and <code>destinationImageSet</code>.
  ///
  /// Parameter [promoteToPrimary] :
  /// Providing this parameter will configure the <code>CopyImageSet</code>
  /// operation to promote the given image set to the primary DICOM hierarchy.
  /// If successful, a new primary image set ID will be returned as the
  /// destination image set.
  Future<CopyImageSetResponse> copyImageSet({
    required CopyImageSetInformation copyImageSetInformation,
    required String datastoreId,
    required String sourceImageSetId,
    bool? force,
    bool? promoteToPrimary,
  }) async {
    final $query = <String, List<String>>{
      if (force != null) 'force': [force.toString()],
      if (promoteToPrimary != null)
        'promoteToPrimary': [promoteToPrimary.toString()],
    };
    final response = await _protocol.send(
      payload: copyImageSetInformation,
      method: 'POST',
      requestUri:
          '/datastore/${Uri.encodeComponent(datastoreId)}/imageSet/${Uri.encodeComponent(sourceImageSetId)}/copyImageSet',
      queryParams: $query,
      hostPrefix: 'runtime-',
      exceptionFnMap: _exceptionFns,
    );
    return CopyImageSetResponse.fromJson(response);
  }

  /// Delete an image set.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [datastoreId] :
  /// The data store identifier.
  ///
  /// Parameter [imageSetId] :
  /// The image set identifier.
  Future<DeleteImageSetResponse> deleteImageSet({
    required String datastoreId,
    required String imageSetId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/datastore/${Uri.encodeComponent(datastoreId)}/imageSet/${Uri.encodeComponent(imageSetId)}/deleteImageSet',
      hostPrefix: 'runtime-',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteImageSetResponse.fromJson(response);
  }

  /// Get the import job properties to learn more about the job or job progress.
  /// <note>
  /// The <code>jobStatus</code> refers to the execution of the import job.
  /// Therefore, an import job can return a <code>jobStatus</code> as
  /// <code>COMPLETED</code> even if validation issues are discovered during the
  /// import process. If a <code>jobStatus</code> returns as
  /// <code>COMPLETED</code>, we still recommend you review the output manifests
  /// written to S3, as they provide details on the success or failure of
  /// individual P10 object imports.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [datastoreId] :
  /// The data store identifier.
  ///
  /// Parameter [jobId] :
  /// The import job identifier.
  Future<GetDICOMImportJobResponse> getDICOMImportJob({
    required String datastoreId,
    required String jobId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/getDICOMImportJob/datastore/${Uri.encodeComponent(datastoreId)}/job/${Uri.encodeComponent(jobId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetDICOMImportJobResponse.fromJson(response);
  }

  /// Get an image frame (pixel data) for an image set.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [NotAcceptableException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [datastoreId] :
  /// The data store identifier.
  ///
  /// Parameter [imageFrameInformation] :
  /// Information about the image frame (pixel data) identifier.
  ///
  /// Parameter [imageSetId] :
  /// The image set identifier.
  Future<GetImageFrameResponse> getImageFrame({
    required String datastoreId,
    required ImageFrameInformation imageFrameInformation,
    required String imageSetId,
  }) async {
    final response = await _protocol.sendRaw(
      payload: imageFrameInformation,
      method: 'POST',
      requestUri:
          '/datastore/${Uri.encodeComponent(datastoreId)}/imageSet/${Uri.encodeComponent(imageSetId)}/getImageFrame',
      hostPrefix: 'runtime-',
      exceptionFnMap: _exceptionFns,
    );
    return GetImageFrameResponse(
      imageFrameBlob: await response.stream.toBytes(),
      contentType:
          _s.extractHeaderStringValue(response.headers, 'Content-Type'),
    );
  }

  /// Get image set properties.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [datastoreId] :
  /// The data store identifier.
  ///
  /// Parameter [imageSetId] :
  /// The image set identifier.
  ///
  /// Parameter [versionId] :
  /// The image set version identifier.
  Future<GetImageSetResponse> getImageSet({
    required String datastoreId,
    required String imageSetId,
    String? versionId,
  }) async {
    final $query = <String, List<String>>{
      if (versionId != null) 'version': [versionId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/datastore/${Uri.encodeComponent(datastoreId)}/imageSet/${Uri.encodeComponent(imageSetId)}/getImageSet',
      queryParams: $query,
      hostPrefix: 'runtime-',
      exceptionFnMap: _exceptionFns,
    );
    return GetImageSetResponse.fromJson(response);
  }

  /// Get metadata attributes for an image set.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [datastoreId] :
  /// The data store identifier.
  ///
  /// Parameter [imageSetId] :
  /// The image set identifier.
  ///
  /// Parameter [versionId] :
  /// The image set version identifier.
  Future<GetImageSetMetadataResponse> getImageSetMetadata({
    required String datastoreId,
    required String imageSetId,
    String? versionId,
  }) async {
    final $query = <String, List<String>>{
      if (versionId != null) 'version': [versionId],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'POST',
      requestUri:
          '/datastore/${Uri.encodeComponent(datastoreId)}/imageSet/${Uri.encodeComponent(imageSetId)}/getImageSetMetadata',
      queryParams: $query,
      hostPrefix: 'runtime-',
      exceptionFnMap: _exceptionFns,
    );
    return GetImageSetMetadataResponse(
      imageSetMetadataBlob: await response.stream.toBytes(),
      contentEncoding:
          _s.extractHeaderStringValue(response.headers, 'Content-Encoding'),
      contentType:
          _s.extractHeaderStringValue(response.headers, 'Content-Type'),
    );
  }

  /// List import jobs created for a specific data store.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [datastoreId] :
  /// The data store identifier.
  ///
  /// Parameter [jobStatus] :
  /// The filters for listing import jobs based on status.
  ///
  /// Parameter [maxResults] :
  /// The max results count. The upper bound is determined by load testing.
  ///
  /// Parameter [nextToken] :
  /// The pagination token used to request the list of import jobs on the next
  /// page.
  Future<ListDICOMImportJobsResponse> listDICOMImportJobs({
    required String datastoreId,
    JobStatus? jobStatus,
    int? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (jobStatus != null) 'jobStatus': [jobStatus.value],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/listDICOMImportJobs/datastore/${Uri.encodeComponent(datastoreId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDICOMImportJobsResponse.fromJson(response);
  }

  /// List image set versions.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [datastoreId] :
  /// The data store identifier.
  ///
  /// Parameter [imageSetId] :
  /// The image set identifier.
  ///
  /// Parameter [maxResults] :
  /// The max results count.
  ///
  /// Parameter [nextToken] :
  /// The pagination token used to request the list of image set versions on the
  /// next page.
  Future<ListImageSetVersionsResponse> listImageSetVersions({
    required String datastoreId,
    required String imageSetId,
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
          '/datastore/${Uri.encodeComponent(datastoreId)}/imageSet/${Uri.encodeComponent(imageSetId)}/listImageSetVersions',
      queryParams: $query,
      hostPrefix: 'runtime-',
      exceptionFnMap: _exceptionFns,
    );
    return ListImageSetVersionsResponse.fromJson(response);
  }

  /// Lists all tags associated with a medical imaging resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the medical imaging resource to list
  /// tags for.
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

  /// Search image sets based on defined input attributes.
  /// <note>
  /// <code>SearchImageSets</code> accepts a single search query parameter and
  /// returns a paginated response of all image sets that have the matching
  /// criteria. All date range queries must be input as <code>(lowerBound,
  /// upperBound)</code>.
  ///
  /// By default, <code>SearchImageSets</code> uses the <code>updatedAt</code>
  /// field for sorting in descending order from newest to oldest.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [datastoreId] :
  /// The identifier of the data store where the image sets reside.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results that can be returned in a search.
  ///
  /// Parameter [nextToken] :
  /// The token used for pagination of results returned in the response. Use the
  /// token returned from the previous request to continue results where the
  /// previous request ended.
  ///
  /// Parameter [searchCriteria] :
  /// The search criteria that filters by applying a maximum of 1 item to
  /// <code>SearchByAttribute</code>.
  Future<SearchImageSetsResponse> searchImageSets({
    required String datastoreId,
    int? maxResults,
    String? nextToken,
    SearchCriteria? searchCriteria,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: searchCriteria,
      method: 'POST',
      requestUri:
          '/datastore/${Uri.encodeComponent(datastoreId)}/searchImageSets',
      queryParams: $query,
      hostPrefix: 'runtime-',
      exceptionFnMap: _exceptionFns,
    );
    return SearchImageSetsResponse.fromJson(response);
  }

  /// Start importing bulk data into an <code>ACTIVE</code> data store. The
  /// import job imports DICOM P10 files or enhances existing DICOM files with
  /// JSON metadata. The <code>importConfiguration</code> parameter specifies
  /// the import type. The data is found in the S3 prefix specified by the
  /// <code>inputS3Uri</code> parameter. The import job stores processing
  /// results in the file specified by the <code>outputS3Uri</code> parameter.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [dataAccessRoleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role that grants permission to
  /// access medical imaging resources.
  ///
  /// Parameter [datastoreId] :
  /// The data store identifier.
  ///
  /// Parameter [inputS3Uri] :
  /// The input prefix path for the S3 bucket that contains the DICOM files to
  /// be imported.
  ///
  /// Parameter [outputS3Uri] :
  /// The output prefix of the S3 bucket to upload the results of the DICOM
  /// import job.
  ///
  /// Parameter [clientToken] :
  /// A unique identifier for API idempotency.
  ///
  /// Parameter [importConfiguration] :
  /// The import configuration for the import job.
  ///
  /// Parameter [inputOwnerAccountId] :
  /// The account ID of the source S3 bucket owner.
  ///
  /// Parameter [jobName] :
  /// The import job name.
  Future<StartDICOMImportJobResponse> startDICOMImportJob({
    required String dataAccessRoleArn,
    required String datastoreId,
    required String inputS3Uri,
    required String outputS3Uri,
    String? clientToken,
    ImportConfiguration? importConfiguration,
    String? inputOwnerAccountId,
    String? jobName,
  }) async {
    final $payload = <String, dynamic>{
      'dataAccessRoleArn': dataAccessRoleArn,
      'inputS3Uri': inputS3Uri,
      'outputS3Uri': outputS3Uri,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (importConfiguration != null)
        'importConfiguration': importConfiguration,
      if (inputOwnerAccountId != null)
        'inputOwnerAccountId': inputOwnerAccountId,
      if (jobName != null) 'jobName': jobName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/startDICOMImportJob/datastore/${Uri.encodeComponent(datastoreId)}',
      exceptionFnMap: _exceptionFns,
    );
    return StartDICOMImportJobResponse.fromJson(response);
  }

  /// Adds a user-specifed key and value tag to a medical imaging resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the medical imaging resource that tags
  /// are being added to.
  ///
  /// Parameter [tags] :
  /// The user-specified key and value tag pairs added to a medical imaging
  /// resource.
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

  /// Removes tags from a medical imaging resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the medical imaging resource that tags
  /// are being removed from.
  ///
  /// Parameter [tagKeys] :
  /// The keys for the tags to be removed from the medical imaging resource.
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

  /// Update image set metadata attributes.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [datastoreId] :
  /// The data store identifier.
  ///
  /// Parameter [imageSetId] :
  /// The image set identifier.
  ///
  /// Parameter [latestVersionId] :
  /// The latest image set version identifier.
  ///
  /// Parameter [updateImageSetMetadataUpdates] :
  /// Update image set metadata updates.
  ///
  /// Parameter [force] :
  /// Setting this flag will force the <code>UpdateImageSetMetadata</code>
  /// operation for the following attributes:
  ///
  /// <ul>
  /// <li>
  /// <code>Tag.StudyInstanceUID</code>, <code>Tag.SeriesInstanceUID</code>,
  /// <code>Tag.SOPInstanceUID</code>, and <code>Tag.StudyID</code>
  /// </li>
  /// <li>
  /// Adding, removing, or updating private tags for an individual SOP Instance
  /// </li>
  /// </ul>
  ///
  /// Parameter [includeStudyImageSets] :
  /// Flag to apply the metadata updates to all image sets in the same Study as
  /// the requested image set ID.
  Future<UpdateImageSetMetadataResponse> updateImageSetMetadata({
    required String datastoreId,
    required String imageSetId,
    required String latestVersionId,
    required MetadataUpdates updateImageSetMetadataUpdates,
    bool? force,
    bool? includeStudyImageSets,
  }) async {
    final $query = <String, List<String>>{
      'latestVersion': [latestVersionId],
      if (force != null) 'force': [force.toString()],
      if (includeStudyImageSets != null)
        'includeStudyImageSets': [includeStudyImageSets.toString()],
    };
    final response = await _protocol.send(
      payload: updateImageSetMetadataUpdates,
      method: 'POST',
      requestUri:
          '/datastore/${Uri.encodeComponent(datastoreId)}/imageSet/${Uri.encodeComponent(imageSetId)}/updateImageSetMetadata',
      queryParams: $query,
      hostPrefix: 'runtime-',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateImageSetMetadataResponse.fromJson(response);
  }

  /// Create a data store.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [clientToken] :
  /// A unique identifier for API idempotency.
  ///
  /// Parameter [datastoreName] :
  /// The data store name.
  ///
  /// Parameter [kmsKeyArn] :
  /// The Amazon Resource Name (ARN) assigned to the Key Management Service
  /// (KMS) key for accessing encrypted data.
  ///
  /// Parameter [lambdaAuthorizerArn] :
  /// The ARN of the authorizer's Lambda function.
  ///
  /// Parameter [losslessStorageFormat] :
  /// The lossless storage format for the datastore.
  ///
  /// Parameter [tags] :
  /// The tags provided when creating a data store.
  Future<CreateDatastoreResponse> createDatastore({
    String? clientToken,
    String? datastoreName,
    String? kmsKeyArn,
    String? lambdaAuthorizerArn,
    LosslessStorageFormat? losslessStorageFormat,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (datastoreName != null) 'datastoreName': datastoreName,
      if (kmsKeyArn != null) 'kmsKeyArn': kmsKeyArn,
      if (lambdaAuthorizerArn != null)
        'lambdaAuthorizerArn': lambdaAuthorizerArn,
      if (losslessStorageFormat != null)
        'losslessStorageFormat': losslessStorageFormat.value,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/datastore',
      exceptionFnMap: _exceptionFns,
    );
    return CreateDatastoreResponse.fromJson(response);
  }

  /// Get data store properties.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [datastoreId] :
  /// The data store identifier.
  Future<GetDatastoreResponse> getDatastore({
    required String datastoreId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/datastore/${Uri.encodeComponent(datastoreId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetDatastoreResponse.fromJson(response);
  }

  /// Delete a data store.
  /// <note>
  /// Before a data store can be deleted, you must first delete all image sets
  /// within it.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [datastoreId] :
  /// The data store identifier.
  Future<DeleteDatastoreResponse> deleteDatastore({
    required String datastoreId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/datastore/${Uri.encodeComponent(datastoreId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteDatastoreResponse.fromJson(response);
  }

  /// List data stores.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [datastoreStatus] :
  /// The data store status.
  ///
  /// Parameter [maxResults] :
  /// Valid Range: Minimum value of 1. Maximum value of 50.
  ///
  /// Parameter [nextToken] :
  /// The pagination token used to request the list of data stores on the next
  /// page.
  Future<ListDatastoresResponse> listDatastores({
    DatastoreStatus? datastoreStatus,
    int? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (datastoreStatus != null) 'datastoreStatus': [datastoreStatus.value],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/datastore',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDatastoresResponse.fromJson(response);
  }
}

/// @nodoc
class CopyImageSetResponse {
  /// The data store identifier.
  final String datastoreId;

  /// The properties of the destination image set.
  final CopyDestinationImageSetProperties destinationImageSetProperties;

  /// The properties of the source image set.
  final CopySourceImageSetProperties sourceImageSetProperties;

  CopyImageSetResponse({
    required this.datastoreId,
    required this.destinationImageSetProperties,
    required this.sourceImageSetProperties,
  });

  factory CopyImageSetResponse.fromJson(Map<String, dynamic> json) {
    return CopyImageSetResponse(
      datastoreId: (json['datastoreId'] as String?) ?? '',
      destinationImageSetProperties: CopyDestinationImageSetProperties.fromJson(
          (json['destinationImageSetProperties'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      sourceImageSetProperties: CopySourceImageSetProperties.fromJson(
          (json['sourceImageSetProperties'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final datastoreId = this.datastoreId;
    final destinationImageSetProperties = this.destinationImageSetProperties;
    final sourceImageSetProperties = this.sourceImageSetProperties;
    return {
      'datastoreId': datastoreId,
      'destinationImageSetProperties': destinationImageSetProperties,
      'sourceImageSetProperties': sourceImageSetProperties,
    };
  }
}

/// @nodoc
class DeleteImageSetResponse {
  /// The data store identifier.
  final String datastoreId;

  /// The image set identifier.
  final String imageSetId;

  /// The image set state.
  final ImageSetState imageSetState;

  /// The image set workflow status.
  final ImageSetWorkflowStatus imageSetWorkflowStatus;

  DeleteImageSetResponse({
    required this.datastoreId,
    required this.imageSetId,
    required this.imageSetState,
    required this.imageSetWorkflowStatus,
  });

  factory DeleteImageSetResponse.fromJson(Map<String, dynamic> json) {
    return DeleteImageSetResponse(
      datastoreId: (json['datastoreId'] as String?) ?? '',
      imageSetId: (json['imageSetId'] as String?) ?? '',
      imageSetState:
          ImageSetState.fromString((json['imageSetState'] as String?) ?? ''),
      imageSetWorkflowStatus: ImageSetWorkflowStatus.fromString(
          (json['imageSetWorkflowStatus'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final datastoreId = this.datastoreId;
    final imageSetId = this.imageSetId;
    final imageSetState = this.imageSetState;
    final imageSetWorkflowStatus = this.imageSetWorkflowStatus;
    return {
      'datastoreId': datastoreId,
      'imageSetId': imageSetId,
      'imageSetState': imageSetState.value,
      'imageSetWorkflowStatus': imageSetWorkflowStatus.value,
    };
  }
}

/// @nodoc
class GetDICOMImportJobResponse {
  /// The properties of the import job.
  final DICOMImportJobProperties jobProperties;

  GetDICOMImportJobResponse({
    required this.jobProperties,
  });

  factory GetDICOMImportJobResponse.fromJson(Map<String, dynamic> json) {
    return GetDICOMImportJobResponse(
      jobProperties: DICOMImportJobProperties.fromJson(
          (json['jobProperties'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final jobProperties = this.jobProperties;
    return {
      'jobProperties': jobProperties,
    };
  }
}

/// @nodoc
class GetImageFrameResponse {
  /// The blob containing the aggregated image frame information.
  final Uint8List imageFrameBlob;

  /// The format in which the image frame information is returned to the customer.
  /// Default is <code>application/octet-stream</code>.
  /// <note>
  /// <ul>
  /// <li>
  /// If the stored transfer syntax is <code>1.2.840.10008.1.2.1</code>, the
  /// returned <code>contentType</code> is <code>application/octet-stream</code>.
  /// </li>
  /// </ul>
  /// <ul>
  /// <li>
  /// If the stored transfer syntax is <code>1.2.840.10008.1.2.4.50</code>, the
  /// returned <code>contentType</code> is <code>image/jpeg</code>.
  /// </li>
  /// </ul>
  /// <ul>
  /// <li>
  /// If the stored transfer syntax is <code>1.2.840.10008.1.2.4.91</code>, the
  /// returned <code>contentType</code> is <code>image/j2c</code>.
  /// </li>
  /// </ul>
  /// <ul>
  /// <li>
  /// If the stored transfer syntax is MPEG2,
  /// <code>1.2.840.10008.1.2.4.100</code>,
  /// <code>1.2.840.10008.1.2.4.100.1</code>,
  /// <code>1.2.840.10008.1.2.4.101</code>, or
  /// <code>1.2.840.10008.1.2.4.101.1</code>, the returned
  /// <code>contentType</code> is <code>video/mpeg</code>.
  /// </li>
  /// </ul>
  /// <ul>
  /// <li>
  /// If the stored transfer syntax is MPEG-4 AVC/H.264, UID
  /// <code>1.2.840.10008.1.2.4.102</code>,
  /// <code>1.2.840.10008.1.2.4.102.1</code>,
  /// <code>1.2.840.10008.1.2.4.103</code>,
  /// <code>1.2.840.10008.1.2.4.103.1</code>,
  /// <code>1.2.840.10008.1.2.4.104</code>,
  /// <code>1.2.840.10008.1.2.4.104.1</code>,
  /// <code>1.2.840.10008.1.2.4.105</code>,
  /// <code>1.2.840.10008.1.2.4.105.1</code>,
  /// <code>1.2.840.10008.1.2.4.106</code>, or
  /// <code>1.2.840.10008.1.2.4.106.1</code>, the returned
  /// <code>contentType</code> is <code>video/mp4</code>.
  /// </li>
  /// </ul>
  /// <ul>
  /// <li>
  /// If the stored transfer syntax is HEVC/H.265, UID
  /// <code>1.2.840.10008.1.2.4.107</code> or
  /// <code>1.2.840.10008.1.2.4.108</code>, the returned <code>contentType</code>
  /// is <code>video/H256</code>.
  /// </li>
  /// </ul>
  /// <ul>
  /// <li>
  /// If the stored transfer syntax is <code>1.2.840.10008.1.2.4.202</code> or if
  /// the stored transfer syntax is <i>missing</i>, the returned
  /// <code>contentType</code> is <code>image/jph</code>.
  /// </li>
  /// </ul>
  /// <ul>
  /// <li>
  /// If the stored transfer syntax is <code>1.2.840.10008.1.2.4.203</code>, the
  /// returned contentType is <code>image/jphc</code>.
  /// </li>
  /// <li>
  /// If the stored transfer syntax is <code>1.2.840.10008.1.2.4.112</code> the
  /// returned <code>contentType</code> is <code>image/jxl</code>.
  /// </li>
  /// </ul> </note>
  final String? contentType;

  GetImageFrameResponse({
    required this.imageFrameBlob,
    this.contentType,
  });

  Map<String, dynamic> toJson() {
    final imageFrameBlob = this.imageFrameBlob;
    final contentType = this.contentType;
    return {
      'imageFrameBlob': base64Encode(imageFrameBlob),
    };
  }
}

/// @nodoc
class GetImageSetResponse {
  /// The data store identifier.
  final String datastoreId;

  /// The image set identifier.
  final String imageSetId;

  /// The image set state.
  final ImageSetState imageSetState;

  /// The image set version identifier.
  final String versionId;

  /// The timestamp when image set properties were created.
  final DateTime? createdAt;

  /// The timestamp when the image set properties were deleted.
  final DateTime? deletedAt;

  /// The Amazon Resource Name (ARN) assigned to the image set.
  final String? imageSetArn;

  /// The image set workflow status.
  final ImageSetWorkflowStatus? imageSetWorkflowStatus;

  /// The flag to determine whether the image set is primary or not.
  final bool? isPrimary;

  /// When the image set was last accessed.
  final DateTime? lastAccessedAt;

  /// The error message thrown if an image set action fails.
  final String? message;

  /// This object contains the details of any overrides used while creating a
  /// specific image set version. If an image set was copied or updated using the
  /// <code>force</code> flag, this object will contain the <code>forced</code>
  /// flag.
  final Overrides? overrides;

  /// The storage tier of the image set.
  final StorageTier? storageTier;

  /// The timestamp when image set properties were updated.
  final DateTime? updatedAt;

  GetImageSetResponse({
    required this.datastoreId,
    required this.imageSetId,
    required this.imageSetState,
    required this.versionId,
    this.createdAt,
    this.deletedAt,
    this.imageSetArn,
    this.imageSetWorkflowStatus,
    this.isPrimary,
    this.lastAccessedAt,
    this.message,
    this.overrides,
    this.storageTier,
    this.updatedAt,
  });

  factory GetImageSetResponse.fromJson(Map<String, dynamic> json) {
    return GetImageSetResponse(
      datastoreId: (json['datastoreId'] as String?) ?? '',
      imageSetId: (json['imageSetId'] as String?) ?? '',
      imageSetState:
          ImageSetState.fromString((json['imageSetState'] as String?) ?? ''),
      versionId: (json['versionId'] as String?) ?? '',
      createdAt: timeStampFromJson(json['createdAt']),
      deletedAt: timeStampFromJson(json['deletedAt']),
      imageSetArn: json['imageSetArn'] as String?,
      imageSetWorkflowStatus: (json['imageSetWorkflowStatus'] as String?)
          ?.let(ImageSetWorkflowStatus.fromString),
      isPrimary: json['isPrimary'] as bool?,
      lastAccessedAt: timeStampFromJson(json['lastAccessedAt']),
      message: json['message'] as String?,
      overrides: json['overrides'] != null
          ? Overrides.fromJson(json['overrides'] as Map<String, dynamic>)
          : null,
      storageTier:
          (json['storageTier'] as String?)?.let(StorageTier.fromString),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final datastoreId = this.datastoreId;
    final imageSetId = this.imageSetId;
    final imageSetState = this.imageSetState;
    final versionId = this.versionId;
    final createdAt = this.createdAt;
    final deletedAt = this.deletedAt;
    final imageSetArn = this.imageSetArn;
    final imageSetWorkflowStatus = this.imageSetWorkflowStatus;
    final isPrimary = this.isPrimary;
    final lastAccessedAt = this.lastAccessedAt;
    final message = this.message;
    final overrides = this.overrides;
    final storageTier = this.storageTier;
    final updatedAt = this.updatedAt;
    return {
      'datastoreId': datastoreId,
      'imageSetId': imageSetId,
      'imageSetState': imageSetState.value,
      'versionId': versionId,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (deletedAt != null) 'deletedAt': unixTimestampToJson(deletedAt),
      if (imageSetArn != null) 'imageSetArn': imageSetArn,
      if (imageSetWorkflowStatus != null)
        'imageSetWorkflowStatus': imageSetWorkflowStatus.value,
      if (isPrimary != null) 'isPrimary': isPrimary,
      if (lastAccessedAt != null)
        'lastAccessedAt': unixTimestampToJson(lastAccessedAt),
      if (message != null) 'message': message,
      if (overrides != null) 'overrides': overrides,
      if (storageTier != null) 'storageTier': storageTier.value,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// @nodoc
class GetImageSetMetadataResponse {
  /// The blob containing the aggregated metadata information for the image set.
  final Uint8List imageSetMetadataBlob;

  /// The compression format in which image set metadata attributes are returned.
  final String? contentEncoding;

  /// The format in which the study metadata is returned to the customer. Default
  /// is <code>text/plain</code>.
  final String? contentType;

  GetImageSetMetadataResponse({
    required this.imageSetMetadataBlob,
    this.contentEncoding,
    this.contentType,
  });

  Map<String, dynamic> toJson() {
    final imageSetMetadataBlob = this.imageSetMetadataBlob;
    final contentEncoding = this.contentEncoding;
    final contentType = this.contentType;
    return {
      'imageSetMetadataBlob': base64Encode(imageSetMetadataBlob),
    };
  }
}

/// @nodoc
class ListDICOMImportJobsResponse {
  /// A list of job summaries.
  final List<DICOMImportJobSummary> jobSummaries;

  /// The pagination token used to retrieve the list of import jobs on the next
  /// page.
  final String? nextToken;

  ListDICOMImportJobsResponse({
    required this.jobSummaries,
    this.nextToken,
  });

  factory ListDICOMImportJobsResponse.fromJson(Map<String, dynamic> json) {
    return ListDICOMImportJobsResponse(
      jobSummaries: ((json['jobSummaries'] as List?) ?? const [])
          .nonNulls
          .map((e) => DICOMImportJobSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobSummaries = this.jobSummaries;
    final nextToken = this.nextToken;
    return {
      'jobSummaries': jobSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListImageSetVersionsResponse {
  /// Lists all properties associated with an image set.
  final List<ImageSetProperties> imageSetPropertiesList;

  /// The pagination token used to retrieve the list of image set versions on the
  /// next page.
  final String? nextToken;

  ListImageSetVersionsResponse({
    required this.imageSetPropertiesList,
    this.nextToken,
  });

  factory ListImageSetVersionsResponse.fromJson(Map<String, dynamic> json) {
    return ListImageSetVersionsResponse(
      imageSetPropertiesList: ((json['imageSetPropertiesList'] as List?) ??
              const [])
          .nonNulls
          .map((e) => ImageSetProperties.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final imageSetPropertiesList = this.imageSetPropertiesList;
    final nextToken = this.nextToken;
    return {
      'imageSetPropertiesList': imageSetPropertiesList,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListTagsForResourceResponse {
  /// A list of all tags associated with a medical imaging resource.
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
class SearchImageSetsResponse {
  /// The model containing the image set results.
  final List<ImageSetsMetadataSummary> imageSetsMetadataSummaries;

  /// The token for pagination results.
  final String? nextToken;

  /// The sort order for image set search results.
  final Sort? sort;

  SearchImageSetsResponse({
    required this.imageSetsMetadataSummaries,
    this.nextToken,
    this.sort,
  });

  factory SearchImageSetsResponse.fromJson(Map<String, dynamic> json) {
    return SearchImageSetsResponse(
      imageSetsMetadataSummaries:
          ((json['imageSetsMetadataSummaries'] as List?) ?? const [])
              .nonNulls
              .map((e) =>
                  ImageSetsMetadataSummary.fromJson(e as Map<String, dynamic>))
              .toList(),
      nextToken: json['nextToken'] as String?,
      sort: json['sort'] != null
          ? Sort.fromJson(json['sort'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final imageSetsMetadataSummaries = this.imageSetsMetadataSummaries;
    final nextToken = this.nextToken;
    final sort = this.sort;
    return {
      'imageSetsMetadataSummaries': imageSetsMetadataSummaries,
      if (nextToken != null) 'nextToken': nextToken,
      if (sort != null) 'sort': sort,
    };
  }
}

/// @nodoc
class StartDICOMImportJobResponse {
  /// The data store identifier.
  final String datastoreId;

  /// The import job identifier.
  final String jobId;

  /// The import job status.
  final JobStatus jobStatus;

  /// The timestamp when the import job was submitted.
  final DateTime submittedAt;

  StartDICOMImportJobResponse({
    required this.datastoreId,
    required this.jobId,
    required this.jobStatus,
    required this.submittedAt,
  });

  factory StartDICOMImportJobResponse.fromJson(Map<String, dynamic> json) {
    return StartDICOMImportJobResponse(
      datastoreId: (json['datastoreId'] as String?) ?? '',
      jobId: (json['jobId'] as String?) ?? '',
      jobStatus: JobStatus.fromString((json['jobStatus'] as String?) ?? ''),
      submittedAt: nonNullableTimeStampFromJson(json['submittedAt'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final datastoreId = this.datastoreId;
    final jobId = this.jobId;
    final jobStatus = this.jobStatus;
    final submittedAt = this.submittedAt;
    return {
      'datastoreId': datastoreId,
      'jobId': jobId,
      'jobStatus': jobStatus.value,
      'submittedAt': unixTimestampToJson(submittedAt),
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
class UpdateImageSetMetadataResponse {
  /// The data store identifier.
  final String datastoreId;

  /// The image set identifier.
  final String imageSetId;

  /// The image set state.
  final ImageSetState imageSetState;

  /// The latest image set version identifier.
  final String latestVersionId;

  /// The timestamp when image set metadata was created.
  final DateTime? createdAt;

  /// The image set workflow status.
  final ImageSetWorkflowStatus? imageSetWorkflowStatus;

  /// The error message thrown if an update image set metadata action fails.
  final String? message;

  /// The timestamp when image set metadata was updated.
  final DateTime? updatedAt;

  UpdateImageSetMetadataResponse({
    required this.datastoreId,
    required this.imageSetId,
    required this.imageSetState,
    required this.latestVersionId,
    this.createdAt,
    this.imageSetWorkflowStatus,
    this.message,
    this.updatedAt,
  });

  factory UpdateImageSetMetadataResponse.fromJson(Map<String, dynamic> json) {
    return UpdateImageSetMetadataResponse(
      datastoreId: (json['datastoreId'] as String?) ?? '',
      imageSetId: (json['imageSetId'] as String?) ?? '',
      imageSetState:
          ImageSetState.fromString((json['imageSetState'] as String?) ?? ''),
      latestVersionId: (json['latestVersionId'] as String?) ?? '',
      createdAt: timeStampFromJson(json['createdAt']),
      imageSetWorkflowStatus: (json['imageSetWorkflowStatus'] as String?)
          ?.let(ImageSetWorkflowStatus.fromString),
      message: json['message'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final datastoreId = this.datastoreId;
    final imageSetId = this.imageSetId;
    final imageSetState = this.imageSetState;
    final latestVersionId = this.latestVersionId;
    final createdAt = this.createdAt;
    final imageSetWorkflowStatus = this.imageSetWorkflowStatus;
    final message = this.message;
    final updatedAt = this.updatedAt;
    return {
      'datastoreId': datastoreId,
      'imageSetId': imageSetId,
      'imageSetState': imageSetState.value,
      'latestVersionId': latestVersionId,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (imageSetWorkflowStatus != null)
        'imageSetWorkflowStatus': imageSetWorkflowStatus.value,
      if (message != null) 'message': message,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// @nodoc
class CreateDatastoreResponse {
  /// The data store identifier.
  final String datastoreId;

  /// The data store status.
  final DatastoreStatus datastoreStatus;

  CreateDatastoreResponse({
    required this.datastoreId,
    required this.datastoreStatus,
  });

  factory CreateDatastoreResponse.fromJson(Map<String, dynamic> json) {
    return CreateDatastoreResponse(
      datastoreId: (json['datastoreId'] as String?) ?? '',
      datastoreStatus: DatastoreStatus.fromString(
          (json['datastoreStatus'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final datastoreId = this.datastoreId;
    final datastoreStatus = this.datastoreStatus;
    return {
      'datastoreId': datastoreId,
      'datastoreStatus': datastoreStatus.value,
    };
  }
}

/// @nodoc
class GetDatastoreResponse {
  /// The data store properties.
  final DatastoreProperties datastoreProperties;

  GetDatastoreResponse({
    required this.datastoreProperties,
  });

  factory GetDatastoreResponse.fromJson(Map<String, dynamic> json) {
    return GetDatastoreResponse(
      datastoreProperties: DatastoreProperties.fromJson(
          (json['datastoreProperties'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final datastoreProperties = this.datastoreProperties;
    return {
      'datastoreProperties': datastoreProperties,
    };
  }
}

/// @nodoc
class DeleteDatastoreResponse {
  /// The data store identifier.
  final String datastoreId;

  /// The data store status.
  final DatastoreStatus datastoreStatus;

  DeleteDatastoreResponse({
    required this.datastoreId,
    required this.datastoreStatus,
  });

  factory DeleteDatastoreResponse.fromJson(Map<String, dynamic> json) {
    return DeleteDatastoreResponse(
      datastoreId: (json['datastoreId'] as String?) ?? '',
      datastoreStatus: DatastoreStatus.fromString(
          (json['datastoreStatus'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final datastoreId = this.datastoreId;
    final datastoreStatus = this.datastoreStatus;
    return {
      'datastoreId': datastoreId,
      'datastoreStatus': datastoreStatus.value,
    };
  }
}

/// @nodoc
class ListDatastoresResponse {
  /// The list of summaries of data stores.
  final List<DatastoreSummary>? datastoreSummaries;

  /// The pagination token used to retrieve the list of data stores on the next
  /// page.
  final String? nextToken;

  ListDatastoresResponse({
    this.datastoreSummaries,
    this.nextToken,
  });

  factory ListDatastoresResponse.fromJson(Map<String, dynamic> json) {
    return ListDatastoresResponse(
      datastoreSummaries: (json['datastoreSummaries'] as List?)
          ?.nonNulls
          .map((e) => DatastoreSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final datastoreSummaries = this.datastoreSummaries;
    final nextToken = this.nextToken;
    return {
      if (datastoreSummaries != null) 'datastoreSummaries': datastoreSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// List of summaries of data stores.
///
/// @nodoc
class DatastoreSummary {
  /// The data store identifier.
  final String datastoreId;

  /// The data store name.
  final String datastoreName;

  /// The data store status.
  final DatastoreStatus datastoreStatus;

  /// The timestamp when the data store was created.
  final DateTime? createdAt;

  /// The Amazon Resource Name (ARN) for the data store.
  final String? datastoreArn;

  /// The timestamp when the data store was last updated.
  final DateTime? updatedAt;

  DatastoreSummary({
    required this.datastoreId,
    required this.datastoreName,
    required this.datastoreStatus,
    this.createdAt,
    this.datastoreArn,
    this.updatedAt,
  });

  factory DatastoreSummary.fromJson(Map<String, dynamic> json) {
    return DatastoreSummary(
      datastoreId: (json['datastoreId'] as String?) ?? '',
      datastoreName: (json['datastoreName'] as String?) ?? '',
      datastoreStatus: DatastoreStatus.fromString(
          (json['datastoreStatus'] as String?) ?? ''),
      createdAt: timeStampFromJson(json['createdAt']),
      datastoreArn: json['datastoreArn'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final datastoreId = this.datastoreId;
    final datastoreName = this.datastoreName;
    final datastoreStatus = this.datastoreStatus;
    final createdAt = this.createdAt;
    final datastoreArn = this.datastoreArn;
    final updatedAt = this.updatedAt;
    return {
      'datastoreId': datastoreId,
      'datastoreName': datastoreName,
      'datastoreStatus': datastoreStatus.value,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (datastoreArn != null) 'datastoreArn': datastoreArn,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// @nodoc
class DatastoreStatus {
  static const creating = DatastoreStatus._('CREATING');
  static const createFailed = DatastoreStatus._('CREATE_FAILED');
  static const active = DatastoreStatus._('ACTIVE');
  static const deleting = DatastoreStatus._('DELETING');
  static const deleted = DatastoreStatus._('DELETED');

  final String value;

  const DatastoreStatus._(this.value);

  static const values = [creating, createFailed, active, deleting, deleted];

  static DatastoreStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DatastoreStatus._(value));

  @override
  bool operator ==(other) => other is DatastoreStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The properties associated with the data store.
///
/// @nodoc
class DatastoreProperties {
  /// The data store identifier.
  final String datastoreId;

  /// The data store name.
  final String datastoreName;

  /// The data store status.
  final DatastoreStatus datastoreStatus;

  /// The timestamp when the data store was created.
  final DateTime? createdAt;

  /// The Amazon Resource Name (ARN) for the data store.
  final String? datastoreArn;

  /// The Amazon Resource Name (ARN) assigned to the Key Management Service (KMS)
  /// key for accessing encrypted data.
  final String? kmsKeyArn;

  /// The ARN of the authorizer's Lambda function.
  final String? lambdaAuthorizerArn;

  /// The datastore's lossless storage format.
  final LosslessStorageFormat? losslessStorageFormat;

  /// The timestamp when the data store was last updated.
  final DateTime? updatedAt;

  DatastoreProperties({
    required this.datastoreId,
    required this.datastoreName,
    required this.datastoreStatus,
    this.createdAt,
    this.datastoreArn,
    this.kmsKeyArn,
    this.lambdaAuthorizerArn,
    this.losslessStorageFormat,
    this.updatedAt,
  });

  factory DatastoreProperties.fromJson(Map<String, dynamic> json) {
    return DatastoreProperties(
      datastoreId: (json['datastoreId'] as String?) ?? '',
      datastoreName: (json['datastoreName'] as String?) ?? '',
      datastoreStatus: DatastoreStatus.fromString(
          (json['datastoreStatus'] as String?) ?? ''),
      createdAt: timeStampFromJson(json['createdAt']),
      datastoreArn: json['datastoreArn'] as String?,
      kmsKeyArn: json['kmsKeyArn'] as String?,
      lambdaAuthorizerArn: json['lambdaAuthorizerArn'] as String?,
      losslessStorageFormat: (json['losslessStorageFormat'] as String?)
          ?.let(LosslessStorageFormat.fromString),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final datastoreId = this.datastoreId;
    final datastoreName = this.datastoreName;
    final datastoreStatus = this.datastoreStatus;
    final createdAt = this.createdAt;
    final datastoreArn = this.datastoreArn;
    final kmsKeyArn = this.kmsKeyArn;
    final lambdaAuthorizerArn = this.lambdaAuthorizerArn;
    final losslessStorageFormat = this.losslessStorageFormat;
    final updatedAt = this.updatedAt;
    return {
      'datastoreId': datastoreId,
      'datastoreName': datastoreName,
      'datastoreStatus': datastoreStatus.value,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (datastoreArn != null) 'datastoreArn': datastoreArn,
      if (kmsKeyArn != null) 'kmsKeyArn': kmsKeyArn,
      if (lambdaAuthorizerArn != null)
        'lambdaAuthorizerArn': lambdaAuthorizerArn,
      if (losslessStorageFormat != null)
        'losslessStorageFormat': losslessStorageFormat.value,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// @nodoc
class LosslessStorageFormat {
  static const htj2k = LosslessStorageFormat._('HTJ2K');
  static const jpeg_2000Lossless =
      LosslessStorageFormat._('JPEG_2000_LOSSLESS');

  final String value;

  const LosslessStorageFormat._(this.value);

  static const values = [htj2k, jpeg_2000Lossless];

  static LosslessStorageFormat fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => LosslessStorageFormat._(value));

  @override
  bool operator ==(other) =>
      other is LosslessStorageFormat && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ImageSetState {
  static const active = ImageSetState._('ACTIVE');
  static const locked = ImageSetState._('LOCKED');
  static const deleted = ImageSetState._('DELETED');

  final String value;

  const ImageSetState._(this.value);

  static const values = [active, locked, deleted];

  static ImageSetState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ImageSetState._(value));

  @override
  bool operator ==(other) => other is ImageSetState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ImageSetWorkflowStatus {
  static const created = ImageSetWorkflowStatus._('CREATED');
  static const copied = ImageSetWorkflowStatus._('COPIED');
  static const copying = ImageSetWorkflowStatus._('COPYING');
  static const copyingWithReadOnlyAccess =
      ImageSetWorkflowStatus._('COPYING_WITH_READ_ONLY_ACCESS');
  static const copyFailed = ImageSetWorkflowStatus._('COPY_FAILED');
  static const updating = ImageSetWorkflowStatus._('UPDATING');
  static const updatingForStudyConsistency =
      ImageSetWorkflowStatus._('UPDATING_FOR_STUDY_CONSISTENCY');
  static const updated = ImageSetWorkflowStatus._('UPDATED');
  static const updateFailed = ImageSetWorkflowStatus._('UPDATE_FAILED');
  static const deleting = ImageSetWorkflowStatus._('DELETING');
  static const deleted = ImageSetWorkflowStatus._('DELETED');
  static const importing = ImageSetWorkflowStatus._('IMPORTING');
  static const imported = ImageSetWorkflowStatus._('IMPORTED');
  static const importFailed = ImageSetWorkflowStatus._('IMPORT_FAILED');

  final String value;

  const ImageSetWorkflowStatus._(this.value);

  static const values = [
    created,
    copied,
    copying,
    copyingWithReadOnlyAccess,
    copyFailed,
    updating,
    updatingForStudyConsistency,
    updated,
    updateFailed,
    deleting,
    deleted,
    importing,
    imported,
    importFailed
  ];

  static ImageSetWorkflowStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ImageSetWorkflowStatus._(value));

  @override
  bool operator ==(other) =>
      other is ImageSetWorkflowStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains DICOMUpdates.
///
/// @nodoc
class MetadataUpdates {
  /// The object containing <code>removableAttributes</code> and
  /// <code>updatableAttributes</code>.
  final DICOMUpdates? dICOMUpdates;

  /// Specifies the previous image set version ID to revert the current image set
  /// back to.
  /// <note>
  /// You must provide either <code>revertToVersionId</code> or
  /// <code>DICOMUpdates</code> in your request. A
  /// <code>ValidationException</code> error is thrown if both parameters are
  /// provided at the same time.
  /// </note>
  final String? revertToVersionId;

  MetadataUpdates({
    this.dICOMUpdates,
    this.revertToVersionId,
  });

  Map<String, dynamic> toJson() {
    final dICOMUpdates = this.dICOMUpdates;
    final revertToVersionId = this.revertToVersionId;
    return {
      if (dICOMUpdates != null) 'DICOMUpdates': dICOMUpdates,
      if (revertToVersionId != null) 'revertToVersionId': revertToVersionId,
    };
  }
}

/// The object containing <code>removableAttributes</code> and
/// <code>updatableAttributes</code>.
///
/// @nodoc
class DICOMUpdates {
  /// The DICOM tags to be removed from <code>ImageSetMetadata</code>.
  final Uint8List? removableAttributes;

  /// The DICOM tags that need to be updated in <code>ImageSetMetadata</code>.
  final Uint8List? updatableAttributes;

  DICOMUpdates({
    this.removableAttributes,
    this.updatableAttributes,
  });

  Map<String, dynamic> toJson() {
    final removableAttributes = this.removableAttributes;
    final updatableAttributes = this.updatableAttributes;
    return {
      if (removableAttributes != null)
        'removableAttributes': base64Encode(removableAttributes),
      if (updatableAttributes != null)
        'updatableAttributes': base64Encode(updatableAttributes),
    };
  }
}

/// @nodoc
class JobStatus {
  static const submitted = JobStatus._('SUBMITTED');
  static const inProgress = JobStatus._('IN_PROGRESS');
  static const completed = JobStatus._('COMPLETED');
  static const failed = JobStatus._('FAILED');

  final String value;

  const JobStatus._(this.value);

  static const values = [submitted, inProgress, completed, failed];

  static JobStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => JobStatus._(value));

  @override
  bool operator ==(other) => other is JobStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The configuration options for different types of import operations.
///
/// @nodoc
class ImportConfiguration {
  final DicomJsonMetadataImportConfiguration?
      dicomJsonMetadataImportConfiguration;

  ImportConfiguration({
    this.dicomJsonMetadataImportConfiguration,
  });

  factory ImportConfiguration.fromJson(Map<String, dynamic> json) {
    return ImportConfiguration(
      dicomJsonMetadataImportConfiguration:
          json['dicomJsonMetadataImportConfiguration'] != null
              ? DicomJsonMetadataImportConfiguration.fromJson(
                  json['dicomJsonMetadataImportConfiguration']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final dicomJsonMetadataImportConfiguration =
        this.dicomJsonMetadataImportConfiguration;
    return {
      if (dicomJsonMetadataImportConfiguration != null)
        'dicomJsonMetadataImportConfiguration':
            dicomJsonMetadataImportConfiguration,
    };
  }
}

/// The configuration parameters that are specific to DICOM JSON metadata import
/// operations.
///
/// @nodoc
class DicomJsonMetadataImportConfiguration {
  /// Maps DCM files to their metadata.
  final List<DicomMetadataMapping> dicomMetadataMappings;

  DicomJsonMetadataImportConfiguration({
    required this.dicomMetadataMappings,
  });

  factory DicomJsonMetadataImportConfiguration.fromJson(
      Map<String, dynamic> json) {
    return DicomJsonMetadataImportConfiguration(
      dicomMetadataMappings: ((json['dicomMetadataMappings'] as List?) ??
              const [])
          .nonNulls
          .map((e) => DicomMetadataMapping.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final dicomMetadataMappings = this.dicomMetadataMappings;
    return {
      'dicomMetadataMappings': dicomMetadataMappings,
    };
  }
}

/// Maps DCM files to their metadata.
///
/// @nodoc
class DicomMetadataMapping {
  /// The path to the JSON metadata file relative to inputS3Uri.
  final String metadataFilePath;

  /// The Study Instance UID that identifies the study.
  final String studyInstanceUID;

  /// The Series Instance UID that identifies the series. This parameter is
  /// optional because the mapping might be at the study level.
  final String? seriesInstanceUID;

  DicomMetadataMapping({
    required this.metadataFilePath,
    required this.studyInstanceUID,
    this.seriesInstanceUID,
  });

  factory DicomMetadataMapping.fromJson(Map<String, dynamic> json) {
    return DicomMetadataMapping(
      metadataFilePath: (json['metadataFilePath'] as String?) ?? '',
      studyInstanceUID: (json['studyInstanceUID'] as String?) ?? '',
      seriesInstanceUID: json['seriesInstanceUID'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final metadataFilePath = this.metadataFilePath;
    final studyInstanceUID = this.studyInstanceUID;
    final seriesInstanceUID = this.seriesInstanceUID;
    return {
      'metadataFilePath': metadataFilePath,
      'studyInstanceUID': studyInstanceUID,
      if (seriesInstanceUID != null) 'seriesInstanceUID': seriesInstanceUID,
    };
  }
}

/// Sort search results.
///
/// @nodoc
class Sort {
  /// The sort field for search criteria.
  final SortField sortField;

  /// The sort order for search criteria.
  final SortOrder sortOrder;

  Sort({
    required this.sortField,
    required this.sortOrder,
  });

  factory Sort.fromJson(Map<String, dynamic> json) {
    return Sort(
      sortField: SortField.fromString((json['sortField'] as String?) ?? ''),
      sortOrder: SortOrder.fromString((json['sortOrder'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final sortField = this.sortField;
    final sortOrder = this.sortOrder;
    return {
      'sortField': sortField.value,
      'sortOrder': sortOrder.value,
    };
  }
}

/// @nodoc
class SortOrder {
  static const asc = SortOrder._('ASC');
  static const desc = SortOrder._('DESC');

  final String value;

  const SortOrder._(this.value);

  static const values = [asc, desc];

  static SortOrder fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => SortOrder._(value));

  @override
  bool operator ==(other) => other is SortOrder && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class SortField {
  static const updatedAt = SortField._('updatedAt');
  static const createdAt = SortField._('createdAt');
  static const dICOMStudyDateAndTime = SortField._('DICOMStudyDateAndTime');

  final String value;

  const SortField._(this.value);

  static const values = [updatedAt, createdAt, dICOMStudyDateAndTime];

  static SortField fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => SortField._(value));

  @override
  bool operator ==(other) => other is SortField && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Summary of the image set metadata.
///
/// @nodoc
class ImageSetsMetadataSummary {
  /// The image set identifier.
  final String imageSetId;

  /// The DICOM tags associated with the image set.
  final DICOMTags? dICOMTags;

  /// The time an image set is created. Sample creation date is provided in
  /// <code>1985-04-12T23:20:50.52Z</code> format.
  final DateTime? createdAt;

  /// The flag to determine whether the image set is primary or not.
  final bool? isPrimary;

  /// When the image set was last accessed.
  final DateTime? lastAccessedAt;

  /// The image set's storage tier.
  final StorageTier? storageTier;

  /// The time an image set was last updated.
  final DateTime? updatedAt;

  /// The image set version.
  final int? version;

  ImageSetsMetadataSummary({
    required this.imageSetId,
    this.dICOMTags,
    this.createdAt,
    this.isPrimary,
    this.lastAccessedAt,
    this.storageTier,
    this.updatedAt,
    this.version,
  });

  factory ImageSetsMetadataSummary.fromJson(Map<String, dynamic> json) {
    return ImageSetsMetadataSummary(
      imageSetId: (json['imageSetId'] as String?) ?? '',
      dICOMTags: json['DICOMTags'] != null
          ? DICOMTags.fromJson(json['DICOMTags'] as Map<String, dynamic>)
          : null,
      createdAt: timeStampFromJson(json['createdAt']),
      isPrimary: json['isPrimary'] as bool?,
      lastAccessedAt: timeStampFromJson(json['lastAccessedAt']),
      storageTier:
          (json['storageTier'] as String?)?.let(StorageTier.fromString),
      updatedAt: timeStampFromJson(json['updatedAt']),
      version: json['version'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final imageSetId = this.imageSetId;
    final dICOMTags = this.dICOMTags;
    final createdAt = this.createdAt;
    final isPrimary = this.isPrimary;
    final lastAccessedAt = this.lastAccessedAt;
    final storageTier = this.storageTier;
    final updatedAt = this.updatedAt;
    final version = this.version;
    return {
      'imageSetId': imageSetId,
      if (dICOMTags != null) 'DICOMTags': dICOMTags,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (isPrimary != null) 'isPrimary': isPrimary,
      if (lastAccessedAt != null)
        'lastAccessedAt': unixTimestampToJson(lastAccessedAt),
      if (storageTier != null) 'storageTier': storageTier.value,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
      if (version != null) 'version': version,
    };
  }
}

/// Storage tier for image sets
///
/// @nodoc
class StorageTier {
  static const frequentAccess = StorageTier._('FREQUENT_ACCESS');
  static const archiveInstantAccess = StorageTier._('ARCHIVE_INSTANT_ACCESS');

  final String value;

  const StorageTier._(this.value);

  static const values = [frequentAccess, archiveInstantAccess];

  static StorageTier fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => StorageTier._(value));

  @override
  bool operator ==(other) => other is StorageTier && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The DICOM attributes returned as a part of a response. Each image set has
/// these properties as part of a search result.
///
/// @nodoc
class DICOMTags {
  /// The accession number for the DICOM study.
  final String? dICOMAccessionNumber;

  /// The total number of instances in the DICOM study.
  final int? dICOMNumberOfStudyRelatedInstances;

  /// The total number of series in the DICOM study.
  final int? dICOMNumberOfStudyRelatedSeries;

  /// The patient birth date.
  final String? dICOMPatientBirthDate;

  /// The unique identifier for a patient in a DICOM Study.
  final String? dICOMPatientId;

  /// The patient name.
  final String? dICOMPatientName;

  /// The patient sex.
  final String? dICOMPatientSex;

  /// The DICOM provided identifier for the series Body Part Examined.
  final String? dICOMSeriesBodyPart;

  /// The DICOM provided identifier for the Series Instance UID.
  final String? dICOMSeriesInstanceUID;

  /// The DICOM provided identifier for the series Modality.
  final String? dICOMSeriesModality;

  /// The DICOM provided identifier for the Series Number.
  final int? dICOMSeriesNumber;

  /// The study date.
  final String? dICOMStudyDate;

  /// The DICOM provided Study Description.
  final String? dICOMStudyDescription;

  /// The DICOM provided identifier for the Study ID.
  final String? dICOMStudyId;

  /// The DICOM provided identifier for the Study Instance UID.
  final String? dICOMStudyInstanceUID;

  /// The study time.
  final String? dICOMStudyTime;

  DICOMTags({
    this.dICOMAccessionNumber,
    this.dICOMNumberOfStudyRelatedInstances,
    this.dICOMNumberOfStudyRelatedSeries,
    this.dICOMPatientBirthDate,
    this.dICOMPatientId,
    this.dICOMPatientName,
    this.dICOMPatientSex,
    this.dICOMSeriesBodyPart,
    this.dICOMSeriesInstanceUID,
    this.dICOMSeriesModality,
    this.dICOMSeriesNumber,
    this.dICOMStudyDate,
    this.dICOMStudyDescription,
    this.dICOMStudyId,
    this.dICOMStudyInstanceUID,
    this.dICOMStudyTime,
  });

  factory DICOMTags.fromJson(Map<String, dynamic> json) {
    return DICOMTags(
      dICOMAccessionNumber: json['DICOMAccessionNumber'] as String?,
      dICOMNumberOfStudyRelatedInstances:
          json['DICOMNumberOfStudyRelatedInstances'] as int?,
      dICOMNumberOfStudyRelatedSeries:
          json['DICOMNumberOfStudyRelatedSeries'] as int?,
      dICOMPatientBirthDate: json['DICOMPatientBirthDate'] as String?,
      dICOMPatientId: json['DICOMPatientId'] as String?,
      dICOMPatientName: json['DICOMPatientName'] as String?,
      dICOMPatientSex: json['DICOMPatientSex'] as String?,
      dICOMSeriesBodyPart: json['DICOMSeriesBodyPart'] as String?,
      dICOMSeriesInstanceUID: json['DICOMSeriesInstanceUID'] as String?,
      dICOMSeriesModality: json['DICOMSeriesModality'] as String?,
      dICOMSeriesNumber: json['DICOMSeriesNumber'] as int?,
      dICOMStudyDate: json['DICOMStudyDate'] as String?,
      dICOMStudyDescription: json['DICOMStudyDescription'] as String?,
      dICOMStudyId: json['DICOMStudyId'] as String?,
      dICOMStudyInstanceUID: json['DICOMStudyInstanceUID'] as String?,
      dICOMStudyTime: json['DICOMStudyTime'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dICOMAccessionNumber = this.dICOMAccessionNumber;
    final dICOMNumberOfStudyRelatedInstances =
        this.dICOMNumberOfStudyRelatedInstances;
    final dICOMNumberOfStudyRelatedSeries =
        this.dICOMNumberOfStudyRelatedSeries;
    final dICOMPatientBirthDate = this.dICOMPatientBirthDate;
    final dICOMPatientId = this.dICOMPatientId;
    final dICOMPatientName = this.dICOMPatientName;
    final dICOMPatientSex = this.dICOMPatientSex;
    final dICOMSeriesBodyPart = this.dICOMSeriesBodyPart;
    final dICOMSeriesInstanceUID = this.dICOMSeriesInstanceUID;
    final dICOMSeriesModality = this.dICOMSeriesModality;
    final dICOMSeriesNumber = this.dICOMSeriesNumber;
    final dICOMStudyDate = this.dICOMStudyDate;
    final dICOMStudyDescription = this.dICOMStudyDescription;
    final dICOMStudyId = this.dICOMStudyId;
    final dICOMStudyInstanceUID = this.dICOMStudyInstanceUID;
    final dICOMStudyTime = this.dICOMStudyTime;
    return {
      if (dICOMAccessionNumber != null)
        'DICOMAccessionNumber': dICOMAccessionNumber,
      if (dICOMNumberOfStudyRelatedInstances != null)
        'DICOMNumberOfStudyRelatedInstances':
            dICOMNumberOfStudyRelatedInstances,
      if (dICOMNumberOfStudyRelatedSeries != null)
        'DICOMNumberOfStudyRelatedSeries': dICOMNumberOfStudyRelatedSeries,
      if (dICOMPatientBirthDate != null)
        'DICOMPatientBirthDate': dICOMPatientBirthDate,
      if (dICOMPatientId != null) 'DICOMPatientId': dICOMPatientId,
      if (dICOMPatientName != null) 'DICOMPatientName': dICOMPatientName,
      if (dICOMPatientSex != null) 'DICOMPatientSex': dICOMPatientSex,
      if (dICOMSeriesBodyPart != null)
        'DICOMSeriesBodyPart': dICOMSeriesBodyPart,
      if (dICOMSeriesInstanceUID != null)
        'DICOMSeriesInstanceUID': dICOMSeriesInstanceUID,
      if (dICOMSeriesModality != null)
        'DICOMSeriesModality': dICOMSeriesModality,
      if (dICOMSeriesNumber != null) 'DICOMSeriesNumber': dICOMSeriesNumber,
      if (dICOMStudyDate != null) 'DICOMStudyDate': dICOMStudyDate,
      if (dICOMStudyDescription != null)
        'DICOMStudyDescription': dICOMStudyDescription,
      if (dICOMStudyId != null) 'DICOMStudyId': dICOMStudyId,
      if (dICOMStudyInstanceUID != null)
        'DICOMStudyInstanceUID': dICOMStudyInstanceUID,
      if (dICOMStudyTime != null) 'DICOMStudyTime': dICOMStudyTime,
    };
  }
}

/// The search criteria.
///
/// @nodoc
class SearchCriteria {
  /// The filters for the search criteria.
  final List<SearchFilter>? filters;

  /// The sort input for search criteria.
  final Sort? sort;

  SearchCriteria({
    this.filters,
    this.sort,
  });

  Map<String, dynamic> toJson() {
    final filters = this.filters;
    final sort = this.sort;
    return {
      if (filters != null) 'filters': filters,
      if (sort != null) 'sort': sort,
    };
  }
}

/// The search filter.
///
/// @nodoc
class SearchFilter {
  /// The search filter operator for <code>imageSetDateTime</code>.
  final Operator operator;

  /// The search filter values.
  final List<SearchByAttributeValue> values;

  SearchFilter({
    required this.operator,
    required this.values,
  });

  Map<String, dynamic> toJson() {
    final operator = this.operator;
    final values = this.values;
    return {
      'operator': operator.value,
      'values': values,
    };
  }
}

/// @nodoc
class Operator {
  static const equal = Operator._('EQUAL');
  static const between = Operator._('BETWEEN');

  final String value;

  const Operator._(this.value);

  static const values = [equal, between];

  static Operator fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => Operator._(value));

  @override
  bool operator ==(other) => other is Operator && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The search input attribute value.
///
/// @nodoc
class SearchByAttributeValue {
  /// The DICOM accession number for search.
  final String? dICOMAccessionNumber;

  /// The patient ID input for search.
  final String? dICOMPatientId;

  /// The Series Instance UID input for search.
  final String? dICOMSeriesInstanceUID;

  /// The aggregated structure containing DICOM study date and study time for
  /// search.
  final DICOMStudyDateAndTime? dICOMStudyDateAndTime;

  /// The DICOM study ID for search.
  final String? dICOMStudyId;

  /// The DICOM study instance UID for search.
  final String? dICOMStudyInstanceUID;

  /// The created at time of the image set provided for search.
  final DateTime? createdAt;

  /// The primary image set flag provided for search.
  final bool? isPrimary;

  /// The timestamp input for search.
  final DateTime? updatedAt;

  SearchByAttributeValue({
    this.dICOMAccessionNumber,
    this.dICOMPatientId,
    this.dICOMSeriesInstanceUID,
    this.dICOMStudyDateAndTime,
    this.dICOMStudyId,
    this.dICOMStudyInstanceUID,
    this.createdAt,
    this.isPrimary,
    this.updatedAt,
  });

  Map<String, dynamic> toJson() {
    final dICOMAccessionNumber = this.dICOMAccessionNumber;
    final dICOMPatientId = this.dICOMPatientId;
    final dICOMSeriesInstanceUID = this.dICOMSeriesInstanceUID;
    final dICOMStudyDateAndTime = this.dICOMStudyDateAndTime;
    final dICOMStudyId = this.dICOMStudyId;
    final dICOMStudyInstanceUID = this.dICOMStudyInstanceUID;
    final createdAt = this.createdAt;
    final isPrimary = this.isPrimary;
    final updatedAt = this.updatedAt;
    return {
      if (dICOMAccessionNumber != null)
        'DICOMAccessionNumber': dICOMAccessionNumber,
      if (dICOMPatientId != null) 'DICOMPatientId': dICOMPatientId,
      if (dICOMSeriesInstanceUID != null)
        'DICOMSeriesInstanceUID': dICOMSeriesInstanceUID,
      if (dICOMStudyDateAndTime != null)
        'DICOMStudyDateAndTime': dICOMStudyDateAndTime,
      if (dICOMStudyId != null) 'DICOMStudyId': dICOMStudyId,
      if (dICOMStudyInstanceUID != null)
        'DICOMStudyInstanceUID': dICOMStudyInstanceUID,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (isPrimary != null) 'isPrimary': isPrimary,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// The aggregated structure to store DICOM study date and study time for search
/// capabilities.
///
/// @nodoc
class DICOMStudyDateAndTime {
  /// The DICOM study date provided in <code>yyMMdd</code> format.
  final String dICOMStudyDate;

  /// The DICOM study time provided in <code>HHmmss.FFFFFF</code> format.
  final String? dICOMStudyTime;

  DICOMStudyDateAndTime({
    required this.dICOMStudyDate,
    this.dICOMStudyTime,
  });

  Map<String, dynamic> toJson() {
    final dICOMStudyDate = this.dICOMStudyDate;
    final dICOMStudyTime = this.dICOMStudyTime;
    return {
      'DICOMStudyDate': dICOMStudyDate,
      if (dICOMStudyTime != null) 'DICOMStudyTime': dICOMStudyTime,
    };
  }
}

/// The image set properties.
///
/// @nodoc
class ImageSetProperties {
  /// The image set identifier.
  final String imageSetId;

  /// The image set state.
  final ImageSetState imageSetState;

  /// The image set version identifier.
  final String versionId;

  /// The image set workflow status.
  final ImageSetWorkflowStatus? imageSetWorkflowStatus;

  /// The timestamp when the image set properties were created.
  final DateTime? createdAt;

  /// The timestamp when the image set properties were deleted.
  final DateTime? deletedAt;

  /// The flag to determine whether the image set is primary or not.
  final bool? isPrimary;

  /// The error message thrown if an image set action fails.
  final String? message;

  /// Contains details on overrides used when creating the returned version of an
  /// image set. For example, if <code>forced</code> exists, the
  /// <code>forced</code> flag was used when creating the image set.
  final Overrides? overrides;

  /// The timestamp when the image set properties were updated.
  final DateTime? updatedAt;

  ImageSetProperties({
    required this.imageSetId,
    required this.imageSetState,
    required this.versionId,
    this.imageSetWorkflowStatus,
    this.createdAt,
    this.deletedAt,
    this.isPrimary,
    this.message,
    this.overrides,
    this.updatedAt,
  });

  factory ImageSetProperties.fromJson(Map<String, dynamic> json) {
    return ImageSetProperties(
      imageSetId: (json['imageSetId'] as String?) ?? '',
      imageSetState:
          ImageSetState.fromString((json['imageSetState'] as String?) ?? ''),
      versionId: (json['versionId'] as String?) ?? '',
      imageSetWorkflowStatus: (json['ImageSetWorkflowStatus'] as String?)
          ?.let(ImageSetWorkflowStatus.fromString),
      createdAt: timeStampFromJson(json['createdAt']),
      deletedAt: timeStampFromJson(json['deletedAt']),
      isPrimary: json['isPrimary'] as bool?,
      message: json['message'] as String?,
      overrides: json['overrides'] != null
          ? Overrides.fromJson(json['overrides'] as Map<String, dynamic>)
          : null,
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final imageSetId = this.imageSetId;
    final imageSetState = this.imageSetState;
    final versionId = this.versionId;
    final imageSetWorkflowStatus = this.imageSetWorkflowStatus;
    final createdAt = this.createdAt;
    final deletedAt = this.deletedAt;
    final isPrimary = this.isPrimary;
    final message = this.message;
    final overrides = this.overrides;
    final updatedAt = this.updatedAt;
    return {
      'imageSetId': imageSetId,
      'imageSetState': imageSetState.value,
      'versionId': versionId,
      if (imageSetWorkflowStatus != null)
        'ImageSetWorkflowStatus': imageSetWorkflowStatus.value,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (deletedAt != null) 'deletedAt': unixTimestampToJson(deletedAt),
      if (isPrimary != null) 'isPrimary': isPrimary,
      if (message != null) 'message': message,
      if (overrides != null) 'overrides': overrides,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// Specifies the overrides used in image set modification calls to
/// <code>CopyImageSet</code> and <code>UpdateImageSetMetadata</code>.
///
/// @nodoc
class Overrides {
  /// Providing this parameter will force completion of the
  /// <code>CopyImageSet</code> and <code>UpdateImageSetMetadata</code> actions,
  /// even if metadata is inconsistent at the Patient, Study, and/or Series
  /// levels.
  final bool? forced;

  Overrides({
    this.forced,
  });

  factory Overrides.fromJson(Map<String, dynamic> json) {
    return Overrides(
      forced: json['forced'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final forced = this.forced;
    return {
      if (forced != null) 'forced': forced,
    };
  }
}

/// Summary of import job.
///
/// @nodoc
class DICOMImportJobSummary {
  /// The data store identifier.
  final String datastoreId;

  /// The import job identifier.
  final String jobId;

  /// The import job name.
  final String jobName;

  /// The filters for listing import jobs based on status.
  final JobStatus jobStatus;

  /// The Amazon Resource Name (ARN) that grants permissions to access medical
  /// imaging resources.
  final String? dataAccessRoleArn;

  /// The timestamp when an import job ended.
  final DateTime? endedAt;

  /// The error message thrown if an import job fails.
  final String? message;

  /// The timestamp when an import job was submitted.
  final DateTime? submittedAt;

  DICOMImportJobSummary({
    required this.datastoreId,
    required this.jobId,
    required this.jobName,
    required this.jobStatus,
    this.dataAccessRoleArn,
    this.endedAt,
    this.message,
    this.submittedAt,
  });

  factory DICOMImportJobSummary.fromJson(Map<String, dynamic> json) {
    return DICOMImportJobSummary(
      datastoreId: (json['datastoreId'] as String?) ?? '',
      jobId: (json['jobId'] as String?) ?? '',
      jobName: (json['jobName'] as String?) ?? '',
      jobStatus: JobStatus.fromString((json['jobStatus'] as String?) ?? ''),
      dataAccessRoleArn: json['dataAccessRoleArn'] as String?,
      endedAt: timeStampFromJson(json['endedAt']),
      message: json['message'] as String?,
      submittedAt: timeStampFromJson(json['submittedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final datastoreId = this.datastoreId;
    final jobId = this.jobId;
    final jobName = this.jobName;
    final jobStatus = this.jobStatus;
    final dataAccessRoleArn = this.dataAccessRoleArn;
    final endedAt = this.endedAt;
    final message = this.message;
    final submittedAt = this.submittedAt;
    return {
      'datastoreId': datastoreId,
      'jobId': jobId,
      'jobName': jobName,
      'jobStatus': jobStatus.value,
      if (dataAccessRoleArn != null) 'dataAccessRoleArn': dataAccessRoleArn,
      if (endedAt != null) 'endedAt': unixTimestampToJson(endedAt),
      if (message != null) 'message': message,
      if (submittedAt != null) 'submittedAt': unixTimestampToJson(submittedAt),
    };
  }
}

/// Information about the image frame (pixel data) identifier.
///
/// @nodoc
class ImageFrameInformation {
  /// The image frame (pixel data) identifier.
  final String imageFrameId;

  ImageFrameInformation({
    required this.imageFrameId,
  });

  Map<String, dynamic> toJson() {
    final imageFrameId = this.imageFrameId;
    return {
      'imageFrameId': imageFrameId,
    };
  }
}

/// Properties of the import job.
///
/// @nodoc
class DICOMImportJobProperties {
  /// The Amazon Resource Name (ARN) that grants permissions to access medical
  /// imaging resources.
  final String dataAccessRoleArn;

  /// The data store identifier.
  final String datastoreId;

  /// The input prefix path for the S3 bucket that contains the DICOM P10 files to
  /// be imported.
  final String inputS3Uri;

  /// The import job identifier.
  final String jobId;

  /// The import job name.
  final String jobName;

  /// The filters for listing import jobs based on status.
  final JobStatus jobStatus;

  /// The output prefix of the S3 bucket to upload the results of the DICOM import
  /// job.
  final String outputS3Uri;

  /// The timestamp for when the import job was ended.
  final DateTime? endedAt;

  /// The object containing <code>DicomJsonMetadataImportConfiguration</code>.
  final ImportConfiguration? importConfiguration;

  /// The error message thrown if an import job fails.
  final String? message;

  /// The timestamp for when the import job was submitted.
  final DateTime? submittedAt;

  DICOMImportJobProperties({
    required this.dataAccessRoleArn,
    required this.datastoreId,
    required this.inputS3Uri,
    required this.jobId,
    required this.jobName,
    required this.jobStatus,
    required this.outputS3Uri,
    this.endedAt,
    this.importConfiguration,
    this.message,
    this.submittedAt,
  });

  factory DICOMImportJobProperties.fromJson(Map<String, dynamic> json) {
    return DICOMImportJobProperties(
      dataAccessRoleArn: (json['dataAccessRoleArn'] as String?) ?? '',
      datastoreId: (json['datastoreId'] as String?) ?? '',
      inputS3Uri: (json['inputS3Uri'] as String?) ?? '',
      jobId: (json['jobId'] as String?) ?? '',
      jobName: (json['jobName'] as String?) ?? '',
      jobStatus: JobStatus.fromString((json['jobStatus'] as String?) ?? ''),
      outputS3Uri: (json['outputS3Uri'] as String?) ?? '',
      endedAt: timeStampFromJson(json['endedAt']),
      importConfiguration: json['importConfiguration'] != null
          ? ImportConfiguration.fromJson(
              json['importConfiguration'] as Map<String, dynamic>)
          : null,
      message: json['message'] as String?,
      submittedAt: timeStampFromJson(json['submittedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final dataAccessRoleArn = this.dataAccessRoleArn;
    final datastoreId = this.datastoreId;
    final inputS3Uri = this.inputS3Uri;
    final jobId = this.jobId;
    final jobName = this.jobName;
    final jobStatus = this.jobStatus;
    final outputS3Uri = this.outputS3Uri;
    final endedAt = this.endedAt;
    final importConfiguration = this.importConfiguration;
    final message = this.message;
    final submittedAt = this.submittedAt;
    return {
      'dataAccessRoleArn': dataAccessRoleArn,
      'datastoreId': datastoreId,
      'inputS3Uri': inputS3Uri,
      'jobId': jobId,
      'jobName': jobName,
      'jobStatus': jobStatus.value,
      'outputS3Uri': outputS3Uri,
      if (endedAt != null) 'endedAt': unixTimestampToJson(endedAt),
      if (importConfiguration != null)
        'importConfiguration': importConfiguration,
      if (message != null) 'message': message,
      if (submittedAt != null) 'submittedAt': unixTimestampToJson(submittedAt),
    };
  }
}

/// Copy source image set properties.
///
/// @nodoc
class CopySourceImageSetProperties {
  /// The image set identifier for the copied source image set.
  final String imageSetId;

  /// The latest version identifier for the copied source image set.
  final String latestVersionId;

  /// The timestamp when the source image set properties were created.
  final DateTime? createdAt;

  /// The Amazon Resource Name (ARN) assigned to the source image set.
  final String? imageSetArn;

  /// The image set state of the copied source image set.
  final ImageSetState? imageSetState;

  /// The workflow status of the copied source image set.
  final ImageSetWorkflowStatus? imageSetWorkflowStatus;

  /// The timestamp when the source image set properties were updated.
  final DateTime? updatedAt;

  CopySourceImageSetProperties({
    required this.imageSetId,
    required this.latestVersionId,
    this.createdAt,
    this.imageSetArn,
    this.imageSetState,
    this.imageSetWorkflowStatus,
    this.updatedAt,
  });

  factory CopySourceImageSetProperties.fromJson(Map<String, dynamic> json) {
    return CopySourceImageSetProperties(
      imageSetId: (json['imageSetId'] as String?) ?? '',
      latestVersionId: (json['latestVersionId'] as String?) ?? '',
      createdAt: timeStampFromJson(json['createdAt']),
      imageSetArn: json['imageSetArn'] as String?,
      imageSetState:
          (json['imageSetState'] as String?)?.let(ImageSetState.fromString),
      imageSetWorkflowStatus: (json['imageSetWorkflowStatus'] as String?)
          ?.let(ImageSetWorkflowStatus.fromString),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final imageSetId = this.imageSetId;
    final latestVersionId = this.latestVersionId;
    final createdAt = this.createdAt;
    final imageSetArn = this.imageSetArn;
    final imageSetState = this.imageSetState;
    final imageSetWorkflowStatus = this.imageSetWorkflowStatus;
    final updatedAt = this.updatedAt;
    return {
      'imageSetId': imageSetId,
      'latestVersionId': latestVersionId,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (imageSetArn != null) 'imageSetArn': imageSetArn,
      if (imageSetState != null) 'imageSetState': imageSetState.value,
      if (imageSetWorkflowStatus != null)
        'imageSetWorkflowStatus': imageSetWorkflowStatus.value,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// Copy the image set properties of the destination image set.
///
/// @nodoc
class CopyDestinationImageSetProperties {
  /// The image set identifier of the copied image set properties.
  final String imageSetId;

  /// The latest version identifier for the destination image set properties.
  final String latestVersionId;

  /// The timestamp when the destination image set properties were created.
  final DateTime? createdAt;

  /// The Amazon Resource Name (ARN) assigned to the destination image set.
  final String? imageSetArn;

  /// The image set state of the destination image set properties.
  final ImageSetState? imageSetState;

  /// The image set workflow status of the destination image set properties.
  final ImageSetWorkflowStatus? imageSetWorkflowStatus;

  /// The timestamp when the destination image set properties were last updated.
  final DateTime? updatedAt;

  CopyDestinationImageSetProperties({
    required this.imageSetId,
    required this.latestVersionId,
    this.createdAt,
    this.imageSetArn,
    this.imageSetState,
    this.imageSetWorkflowStatus,
    this.updatedAt,
  });

  factory CopyDestinationImageSetProperties.fromJson(
      Map<String, dynamic> json) {
    return CopyDestinationImageSetProperties(
      imageSetId: (json['imageSetId'] as String?) ?? '',
      latestVersionId: (json['latestVersionId'] as String?) ?? '',
      createdAt: timeStampFromJson(json['createdAt']),
      imageSetArn: json['imageSetArn'] as String?,
      imageSetState:
          (json['imageSetState'] as String?)?.let(ImageSetState.fromString),
      imageSetWorkflowStatus: (json['imageSetWorkflowStatus'] as String?)
          ?.let(ImageSetWorkflowStatus.fromString),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final imageSetId = this.imageSetId;
    final latestVersionId = this.latestVersionId;
    final createdAt = this.createdAt;
    final imageSetArn = this.imageSetArn;
    final imageSetState = this.imageSetState;
    final imageSetWorkflowStatus = this.imageSetWorkflowStatus;
    final updatedAt = this.updatedAt;
    return {
      'imageSetId': imageSetId,
      'latestVersionId': latestVersionId,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (imageSetArn != null) 'imageSetArn': imageSetArn,
      if (imageSetState != null) 'imageSetState': imageSetState.value,
      if (imageSetWorkflowStatus != null)
        'imageSetWorkflowStatus': imageSetWorkflowStatus.value,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// Copy image set information.
///
/// @nodoc
class CopyImageSetInformation {
  /// The source image set.
  final CopySourceImageSetInformation sourceImageSet;

  /// The destination image set.
  final CopyDestinationImageSet? destinationImageSet;

  CopyImageSetInformation({
    required this.sourceImageSet,
    this.destinationImageSet,
  });

  Map<String, dynamic> toJson() {
    final sourceImageSet = this.sourceImageSet;
    final destinationImageSet = this.destinationImageSet;
    return {
      'sourceImageSet': sourceImageSet,
      if (destinationImageSet != null)
        'destinationImageSet': destinationImageSet,
    };
  }
}

/// Copy source image set information.
///
/// @nodoc
class CopySourceImageSetInformation {
  /// The latest version identifier for the source image set.
  final String latestVersionId;

  /// Contains <code>MetadataCopies</code> structure and wraps information related
  /// to specific copy use cases. For example, when copying subsets.
  final MetadataCopies? dICOMCopies;

  CopySourceImageSetInformation({
    required this.latestVersionId,
    this.dICOMCopies,
  });

  Map<String, dynamic> toJson() {
    final latestVersionId = this.latestVersionId;
    final dICOMCopies = this.dICOMCopies;
    return {
      'latestVersionId': latestVersionId,
      if (dICOMCopies != null) 'DICOMCopies': dICOMCopies,
    };
  }
}

/// Copy the destination image set.
///
/// @nodoc
class CopyDestinationImageSet {
  /// The image set identifier for the destination image set.
  final String imageSetId;

  /// The latest version identifier for the destination image set.
  final String latestVersionId;

  CopyDestinationImageSet({
    required this.imageSetId,
    required this.latestVersionId,
  });

  Map<String, dynamic> toJson() {
    final imageSetId = this.imageSetId;
    final latestVersionId = this.latestVersionId;
    return {
      'imageSetId': imageSetId,
      'latestVersionId': latestVersionId,
    };
  }
}

/// Contains copiable <code>Attributes</code> structure and wraps information
/// related to specific copy use cases. For example, when copying subsets.
///
/// @nodoc
class MetadataCopies {
  /// The JSON string used to specify a subset of SOP Instances to copy from
  /// source to destination image set.
  final String copiableAttributes;

  MetadataCopies({
    required this.copiableAttributes,
  });

  Map<String, dynamic> toJson() {
    final copiableAttributes = this.copiableAttributes;
    return {
      'copiableAttributes': copiableAttributes,
    };
  }
}

/// @nodoc
class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

/// @nodoc
class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String? type, String? message})
      : super(type: type, code: 'BadRequestException', message: message);
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
class NotAcceptableException extends _s.GenericAwsException {
  NotAcceptableException({String? type, String? message})
      : super(type: type, code: 'NotAcceptableException', message: message);
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
  'BadRequestException': (type, message) =>
      BadRequestException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'NotAcceptableException': (type, message) =>
      NotAcceptableException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
