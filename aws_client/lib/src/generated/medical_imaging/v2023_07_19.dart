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

/// This is the <i>AWS HealthImaging API Reference</i>. AWS HealthImaging is a
/// HIPAA eligible service that empowers healthcare providers, life science
/// organizations, and their software partners to store, analyze, and share
/// medical images in the cloud at petabyte scale. For an introduction to the
/// service, see the <a
/// href="https://docs.aws.amazon.com/healthimaging/latest/devguide/what-is.html">
/// <i>AWS HealthImaging Developer Guide</i> </a>.
/// <note>
/// We recommend using one of the AWS Software Development Kits (SDKs) for your
/// programming language, as they take care of request authentication,
/// serialization, and connection management. For more information, see <a
/// href="http://aws.amazon.com/developer/tools">Tools to build on AWS</a>.
/// </note>
/// The following sections list AWS HealthImaging API actions categorized
/// according to functionality. Links are provided to actions within this
/// Reference, along with links back to corresponding sections in the <i>AWS
/// HealthImaging Developer Guide</i> where you can view tested code examples.
/// <p class="title"> <b>Data store actions</b>
///
/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/healthimaging/latest/APIReference/API_CreateDatastore.html">CreateDatastore</a>
/// – See <a
/// href="https://docs.aws.amazon.com/healthimaging/latest/devguide/create-data-store.html">Creating
/// a data store</a>.
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/healthimaging/latest/APIReference/API_GetDatastore.html">GetDatastore</a>
/// – See <a
/// href="https://docs.aws.amazon.com/healthimaging/latest/devguide/get-data-store.html">Getting
/// data store properties</a>.
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/healthimaging/latest/APIReference/API_ListDatastores.html">ListDatastores</a>
/// – See <a
/// href="https://docs.aws.amazon.com/healthimaging/latest/devguide/list-data-stores.html">Listing
/// data stores</a>.
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/healthimaging/latest/APIReference/API_DeleteDatastore.html">DeleteDatastore</a>
/// – See <a
/// href="https://docs.aws.amazon.com/healthimaging/latest/devguide/delete-data-store.html">Deleting
/// a data store</a>.
/// </li>
/// </ul> <p class="title"> <b>Import job actions</b>
///
/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/healthimaging/latest/APIReference/API_StartDICOMImportJob.html">StartDICOMImportJob</a>
/// – See <a
/// href="https://docs.aws.amazon.com/healthimaging/latest/devguide/start-dicom-import-job.html">Starting
/// an import job</a>.
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/healthimaging/latest/APIReference/API_GetDICOMImportJob.html">GetDICOMImportJob</a>
/// – See <a
/// href="https://docs.aws.amazon.com/healthimaging/latest/devguide/get-dicom-import-job.html">Getting
/// import job properties</a>.
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/healthimaging/latest/APIReference/API_ListDICOMImportJobs.html">ListDICOMImportJobs</a>
/// – See <a
/// href="https://docs.aws.amazon.com/healthimaging/latest/devguide/list-dicom-import-jobs.html">Listing
/// import jobs</a>.
/// </li>
/// </ul> <p class="title"> <b>Image set access actions</b>
///
/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/healthimaging/latest/APIReference/API_SearchImageSets.html">SearchImageSets</a>
/// – See <a
/// href="https://docs.aws.amazon.com/healthimaging/latest/devguide/search-image-sets.html">Searching
/// image sets</a>.
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/healthimaging/latest/APIReference/API_GetImageSet.html">GetImageSet</a>
/// – See <a
/// href="https://docs.aws.amazon.com/healthimaging/latest/devguide/get-image-set-properties.html">Getting
/// image set properties</a>.
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/healthimaging/latest/APIReference/API_GetImageSetMetadata.html">GetImageSetMetadata</a>
/// – See <a
/// href="https://docs.aws.amazon.com/healthimaging/latest/devguide/get-image-set-metadata.html">Getting
/// image set metadata</a>.
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/healthimaging/latest/APIReference/API_GetImageFrame.html">GetImageFrame</a>
/// – See <a
/// href="https://docs.aws.amazon.com/healthimaging/latest/devguide/get-image-frame.html">Getting
/// image set pixel data</a>.
/// </li>
/// </ul> <p class="title"> <b>Image set modification actions</b>
///
/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/healthimaging/latest/APIReference/API_ListImageSetVersions.html">ListImageSetVersions</a>
/// – See <a
/// href="https://docs.aws.amazon.com/healthimaging/latest/devguide/list-image-set-versions.html">Listing
/// image set versions</a>.
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/healthimaging/latest/APIReference/API_UpdateImageSetMetadata.html">UpdateImageSetMetadata</a>
/// – See <a
/// href="https://docs.aws.amazon.com/healthimaging/latest/devguide/update-image-set-metadata.html">Updating
/// image set metadata</a>.
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/healthimaging/latest/APIReference/API_CopyImageSet.html">CopyImageSet</a>
/// – See <a
/// href="https://docs.aws.amazon.com/healthimaging/latest/devguide/copy-image-set.html">Copying
/// an image set</a>.
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/healthimaging/latest/APIReference/API_DeleteImageSet.html">DeleteImageSet</a>
/// – See <a
/// href="https://docs.aws.amazon.com/healthimaging/latest/devguide/delete-image-set.html">Deleting
/// an image set</a>.
/// </li>
/// </ul> <p class="title"> <b>Tagging actions</b>
///
/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/healthimaging/latest/APIReference/API_TagResource.html">TagResource</a>
/// – See <a
/// href="https://docs.aws.amazon.com/healthimaging/latest/devguide/tag-resource.html">Tagging
/// a resource</a>.
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/healthimaging/latest/APIReference/API_ListTagsForResource.html">ListTagsForResource</a>
/// – See <a
/// href="https://docs.aws.amazon.com/healthimaging/latest/devguide/list-tag-resource.html">Listing
/// tags for a resource</a>.
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/healthimaging/latest/APIReference/API_UntagResource.html">UntagResource</a>
/// – See <a
/// href="https://docs.aws.amazon.com/healthimaging/latest/devguide/untag-resource.html">Untagging
/// a resource</a>.
/// </li>
/// </ul>
class HealthImaging {
  final _s.RestJsonProtocol _protocol;
  HealthImaging({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'medical-imaging',
            signingName: 'medical-imaging',
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

  /// Copy an image set.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [copyImageSetInformation] :
  /// Copy image set information.
  ///
  /// Parameter [datastoreId] :
  /// The data store identifier.
  ///
  /// Parameter [sourceImageSetId] :
  /// The source image set identifier.
  Future<CopyImageSetResponse> copyImageSet({
    required CopyImageSetInformation copyImageSetInformation,
    required String datastoreId,
    required String sourceImageSetId,
  }) async {
    final response = await _protocol.send(
      payload: copyImageSetInformation,
      method: 'POST',
      requestUri:
          '/datastore/${Uri.encodeComponent(datastoreId)}/imageSet/${Uri.encodeComponent(sourceImageSetId)}/copyImageSet',
      exceptionFnMap: _exceptionFns,
    );
    return CopyImageSetResponse.fromJson(response);
  }

  /// Create a data store.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
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
  /// Parameter [tags] :
  /// The tags provided when creating a data store.
  Future<CreateDatastoreResponse> createDatastore({
    String? clientToken,
    String? datastoreName,
    String? kmsKeyArn,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (datastoreName != null) 'datastoreName': datastoreName,
      if (kmsKeyArn != null) 'kmsKeyArn': kmsKeyArn,
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

  /// Delete a data store.
  /// <note>
  /// Before a data store can be deleted, you must first delete all image sets
  /// within it.
  /// </note>
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
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

  /// Delete an image set.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
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
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
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

  /// Get data store properties.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
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

  /// Get an image frame (pixel data) for an image set.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
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
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
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
      exceptionFnMap: _exceptionFns,
    );
    return GetImageSetResponse.fromJson(response);
  }

  /// Get metadata attributes for an image set.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
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
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
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
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (jobStatus != null) 'jobStatus': [jobStatus.toValue()],
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

  /// List data stores.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
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
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (datastoreStatus != null)
        'datastoreStatus': [datastoreStatus.toValue()],
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

  /// List image set versions.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
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
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
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
      exceptionFnMap: _exceptionFns,
    );
    return ListImageSetVersionsResponse.fromJson(response);
  }

  /// Lists all tags associated with a medical imaging resource.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
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
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
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
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
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
      exceptionFnMap: _exceptionFns,
    );
    return SearchImageSetsResponse.fromJson(response);
  }

  /// Start importing bulk data into an <code>ACTIVE</code> data store. The
  /// import job imports DICOM P10 files found in the S3 prefix specified by the
  /// <code>inputS3Uri</code> parameter. The import job stores processing
  /// results in the file specified by the <code>outputS3Uri</code> parameter.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
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
    String? inputOwnerAccountId,
    String? jobName,
  }) async {
    final $payload = <String, dynamic>{
      'dataAccessRoleArn': dataAccessRoleArn,
      'inputS3Uri': inputS3Uri,
      'outputS3Uri': outputS3Uri,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
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
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
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
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
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
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
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
  Future<UpdateImageSetMetadataResponse> updateImageSetMetadata({
    required String datastoreId,
    required String imageSetId,
    required String latestVersionId,
    required MetadataUpdates updateImageSetMetadataUpdates,
  }) async {
    final $query = <String, List<String>>{
      'latestVersion': [latestVersionId],
    };
    final response = await _protocol.send(
      payload: updateImageSetMetadataUpdates,
      method: 'POST',
      requestUri:
          '/datastore/${Uri.encodeComponent(datastoreId)}/imageSet/${Uri.encodeComponent(imageSetId)}/updateImageSetMetadata',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return UpdateImageSetMetadataResponse.fromJson(response);
  }
}

/// Copy the destination image set.
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

/// Copy the image set properties of the destination image set.
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
      imageSetId: json['imageSetId'] as String,
      latestVersionId: json['latestVersionId'] as String,
      createdAt: timeStampFromJson(json['createdAt']),
      imageSetArn: json['imageSetArn'] as String?,
      imageSetState: (json['imageSetState'] as String?)?.toImageSetState(),
      imageSetWorkflowStatus: (json['imageSetWorkflowStatus'] as String?)
          ?.toImageSetWorkflowStatus(),
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
      if (imageSetState != null) 'imageSetState': imageSetState.toValue(),
      if (imageSetWorkflowStatus != null)
        'imageSetWorkflowStatus': imageSetWorkflowStatus.toValue(),
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// Copy image set information.
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
      datastoreId: json['datastoreId'] as String,
      destinationImageSetProperties: CopyDestinationImageSetProperties.fromJson(
          json['destinationImageSetProperties'] as Map<String, dynamic>),
      sourceImageSetProperties: CopySourceImageSetProperties.fromJson(
          json['sourceImageSetProperties'] as Map<String, dynamic>),
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

/// Copy source image set information.
class CopySourceImageSetInformation {
  /// The latest version identifier for the source image set.
  final String latestVersionId;

  CopySourceImageSetInformation({
    required this.latestVersionId,
  });

  Map<String, dynamic> toJson() {
    final latestVersionId = this.latestVersionId;
    return {
      'latestVersionId': latestVersionId,
    };
  }
}

/// Copy source image set properties.
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
      imageSetId: json['imageSetId'] as String,
      latestVersionId: json['latestVersionId'] as String,
      createdAt: timeStampFromJson(json['createdAt']),
      imageSetArn: json['imageSetArn'] as String?,
      imageSetState: (json['imageSetState'] as String?)?.toImageSetState(),
      imageSetWorkflowStatus: (json['imageSetWorkflowStatus'] as String?)
          ?.toImageSetWorkflowStatus(),
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
      if (imageSetState != null) 'imageSetState': imageSetState.toValue(),
      if (imageSetWorkflowStatus != null)
        'imageSetWorkflowStatus': imageSetWorkflowStatus.toValue(),
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

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
      datastoreId: json['datastoreId'] as String,
      datastoreStatus: (json['datastoreStatus'] as String).toDatastoreStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final datastoreId = this.datastoreId;
    final datastoreStatus = this.datastoreStatus;
    return {
      'datastoreId': datastoreId,
      'datastoreStatus': datastoreStatus.toValue(),
    };
  }
}

/// Properties of the import job.
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
    this.message,
    this.submittedAt,
  });

  factory DICOMImportJobProperties.fromJson(Map<String, dynamic> json) {
    return DICOMImportJobProperties(
      dataAccessRoleArn: json['dataAccessRoleArn'] as String,
      datastoreId: json['datastoreId'] as String,
      inputS3Uri: json['inputS3Uri'] as String,
      jobId: json['jobId'] as String,
      jobName: json['jobName'] as String,
      jobStatus: (json['jobStatus'] as String).toJobStatus(),
      outputS3Uri: json['outputS3Uri'] as String,
      endedAt: timeStampFromJson(json['endedAt']),
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
    final message = this.message;
    final submittedAt = this.submittedAt;
    return {
      'dataAccessRoleArn': dataAccessRoleArn,
      'datastoreId': datastoreId,
      'inputS3Uri': inputS3Uri,
      'jobId': jobId,
      'jobName': jobName,
      'jobStatus': jobStatus.toValue(),
      'outputS3Uri': outputS3Uri,
      if (endedAt != null) 'endedAt': unixTimestampToJson(endedAt),
      if (message != null) 'message': message,
      if (submittedAt != null) 'submittedAt': unixTimestampToJson(submittedAt),
    };
  }
}

/// Summary of import job.
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
      datastoreId: json['datastoreId'] as String,
      jobId: json['jobId'] as String,
      jobName: json['jobName'] as String,
      jobStatus: (json['jobStatus'] as String).toJobStatus(),
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
      'jobStatus': jobStatus.toValue(),
      if (dataAccessRoleArn != null) 'dataAccessRoleArn': dataAccessRoleArn,
      if (endedAt != null) 'endedAt': unixTimestampToJson(endedAt),
      if (message != null) 'message': message,
      if (submittedAt != null) 'submittedAt': unixTimestampToJson(submittedAt),
    };
  }
}

/// The aggregated structure to store DICOM study date and study time for search
/// capabilities.
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

/// The DICOM attributes returned as a part of a response. Each image set has
/// these properties as part of a search result.
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

/// The object containing <code>removableAttributes</code> and
/// <code>updatableAttributes</code>.
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

/// The properties associated with the data store.
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

  /// The timestamp when the data store was last updated.
  final DateTime? updatedAt;

  DatastoreProperties({
    required this.datastoreId,
    required this.datastoreName,
    required this.datastoreStatus,
    this.createdAt,
    this.datastoreArn,
    this.kmsKeyArn,
    this.updatedAt,
  });

  factory DatastoreProperties.fromJson(Map<String, dynamic> json) {
    return DatastoreProperties(
      datastoreId: json['datastoreId'] as String,
      datastoreName: json['datastoreName'] as String,
      datastoreStatus: (json['datastoreStatus'] as String).toDatastoreStatus(),
      createdAt: timeStampFromJson(json['createdAt']),
      datastoreArn: json['datastoreArn'] as String?,
      kmsKeyArn: json['kmsKeyArn'] as String?,
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
    final updatedAt = this.updatedAt;
    return {
      'datastoreId': datastoreId,
      'datastoreName': datastoreName,
      'datastoreStatus': datastoreStatus.toValue(),
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (datastoreArn != null) 'datastoreArn': datastoreArn,
      if (kmsKeyArn != null) 'kmsKeyArn': kmsKeyArn,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

enum DatastoreStatus {
  creating,
  createFailed,
  active,
  deleting,
  deleted,
}

extension DatastoreStatusValueExtension on DatastoreStatus {
  String toValue() {
    switch (this) {
      case DatastoreStatus.creating:
        return 'CREATING';
      case DatastoreStatus.createFailed:
        return 'CREATE_FAILED';
      case DatastoreStatus.active:
        return 'ACTIVE';
      case DatastoreStatus.deleting:
        return 'DELETING';
      case DatastoreStatus.deleted:
        return 'DELETED';
    }
  }
}

extension DatastoreStatusFromString on String {
  DatastoreStatus toDatastoreStatus() {
    switch (this) {
      case 'CREATING':
        return DatastoreStatus.creating;
      case 'CREATE_FAILED':
        return DatastoreStatus.createFailed;
      case 'ACTIVE':
        return DatastoreStatus.active;
      case 'DELETING':
        return DatastoreStatus.deleting;
      case 'DELETED':
        return DatastoreStatus.deleted;
    }
    throw Exception('$this is not known in enum DatastoreStatus');
  }
}

/// List of summaries of data stores.
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
      datastoreId: json['datastoreId'] as String,
      datastoreName: json['datastoreName'] as String,
      datastoreStatus: (json['datastoreStatus'] as String).toDatastoreStatus(),
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
      'datastoreStatus': datastoreStatus.toValue(),
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (datastoreArn != null) 'datastoreArn': datastoreArn,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

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
      datastoreId: json['datastoreId'] as String,
      datastoreStatus: (json['datastoreStatus'] as String).toDatastoreStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final datastoreId = this.datastoreId;
    final datastoreStatus = this.datastoreStatus;
    return {
      'datastoreId': datastoreId,
      'datastoreStatus': datastoreStatus.toValue(),
    };
  }
}

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
      datastoreId: json['datastoreId'] as String,
      imageSetId: json['imageSetId'] as String,
      imageSetState: (json['imageSetState'] as String).toImageSetState(),
      imageSetWorkflowStatus:
          (json['imageSetWorkflowStatus'] as String).toImageSetWorkflowStatus(),
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
      'imageSetState': imageSetState.toValue(),
      'imageSetWorkflowStatus': imageSetWorkflowStatus.toValue(),
    };
  }
}

class GetDICOMImportJobResponse {
  /// The properties of the import job.
  final DICOMImportJobProperties jobProperties;

  GetDICOMImportJobResponse({
    required this.jobProperties,
  });

  factory GetDICOMImportJobResponse.fromJson(Map<String, dynamic> json) {
    return GetDICOMImportJobResponse(
      jobProperties: DICOMImportJobProperties.fromJson(
          json['jobProperties'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final jobProperties = this.jobProperties;
    return {
      'jobProperties': jobProperties,
    };
  }
}

class GetDatastoreResponse {
  /// The data store properties.
  final DatastoreProperties datastoreProperties;

  GetDatastoreResponse({
    required this.datastoreProperties,
  });

  factory GetDatastoreResponse.fromJson(Map<String, dynamic> json) {
    return GetDatastoreResponse(
      datastoreProperties: DatastoreProperties.fromJson(
          json['datastoreProperties'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final datastoreProperties = this.datastoreProperties;
    return {
      'datastoreProperties': datastoreProperties,
    };
  }
}

class GetImageFrameResponse {
  /// The blob containing the aggregated image frame information.
  final Uint8List imageFrameBlob;

  /// The format in which the image frame information is returned to the customer.
  /// Default is <code>application/octet-stream</code>.
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

  /// The error message thrown if an image set action fails.
  final String? message;

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
    this.message,
    this.updatedAt,
  });

  factory GetImageSetResponse.fromJson(Map<String, dynamic> json) {
    return GetImageSetResponse(
      datastoreId: json['datastoreId'] as String,
      imageSetId: json['imageSetId'] as String,
      imageSetState: (json['imageSetState'] as String).toImageSetState(),
      versionId: json['versionId'] as String,
      createdAt: timeStampFromJson(json['createdAt']),
      deletedAt: timeStampFromJson(json['deletedAt']),
      imageSetArn: json['imageSetArn'] as String?,
      imageSetWorkflowStatus: (json['imageSetWorkflowStatus'] as String?)
          ?.toImageSetWorkflowStatus(),
      message: json['message'] as String?,
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
    final message = this.message;
    final updatedAt = this.updatedAt;
    return {
      'datastoreId': datastoreId,
      'imageSetId': imageSetId,
      'imageSetState': imageSetState.toValue(),
      'versionId': versionId,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (deletedAt != null) 'deletedAt': unixTimestampToJson(deletedAt),
      if (imageSetArn != null) 'imageSetArn': imageSetArn,
      if (imageSetWorkflowStatus != null)
        'imageSetWorkflowStatus': imageSetWorkflowStatus.toValue(),
      if (message != null) 'message': message,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// Information about the image frame (pixel data) identifier.
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

/// The image set properties.
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

  /// The error message thrown if an image set action fails.
  final String? message;

  /// The timestamp when the image set properties were updated.
  final DateTime? updatedAt;

  ImageSetProperties({
    required this.imageSetId,
    required this.imageSetState,
    required this.versionId,
    this.imageSetWorkflowStatus,
    this.createdAt,
    this.deletedAt,
    this.message,
    this.updatedAt,
  });

  factory ImageSetProperties.fromJson(Map<String, dynamic> json) {
    return ImageSetProperties(
      imageSetId: json['imageSetId'] as String,
      imageSetState: (json['imageSetState'] as String).toImageSetState(),
      versionId: json['versionId'] as String,
      imageSetWorkflowStatus: (json['ImageSetWorkflowStatus'] as String?)
          ?.toImageSetWorkflowStatus(),
      createdAt: timeStampFromJson(json['createdAt']),
      deletedAt: timeStampFromJson(json['deletedAt']),
      message: json['message'] as String?,
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
    final message = this.message;
    final updatedAt = this.updatedAt;
    return {
      'imageSetId': imageSetId,
      'imageSetState': imageSetState.toValue(),
      'versionId': versionId,
      if (imageSetWorkflowStatus != null)
        'ImageSetWorkflowStatus': imageSetWorkflowStatus.toValue(),
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (deletedAt != null) 'deletedAt': unixTimestampToJson(deletedAt),
      if (message != null) 'message': message,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

enum ImageSetState {
  active,
  locked,
  deleted,
}

extension ImageSetStateValueExtension on ImageSetState {
  String toValue() {
    switch (this) {
      case ImageSetState.active:
        return 'ACTIVE';
      case ImageSetState.locked:
        return 'LOCKED';
      case ImageSetState.deleted:
        return 'DELETED';
    }
  }
}

extension ImageSetStateFromString on String {
  ImageSetState toImageSetState() {
    switch (this) {
      case 'ACTIVE':
        return ImageSetState.active;
      case 'LOCKED':
        return ImageSetState.locked;
      case 'DELETED':
        return ImageSetState.deleted;
    }
    throw Exception('$this is not known in enum ImageSetState');
  }
}

enum ImageSetWorkflowStatus {
  created,
  copied,
  copying,
  copyingWithReadOnlyAccess,
  copyFailed,
  updating,
  updated,
  updateFailed,
  deleting,
  deleted,
}

extension ImageSetWorkflowStatusValueExtension on ImageSetWorkflowStatus {
  String toValue() {
    switch (this) {
      case ImageSetWorkflowStatus.created:
        return 'CREATED';
      case ImageSetWorkflowStatus.copied:
        return 'COPIED';
      case ImageSetWorkflowStatus.copying:
        return 'COPYING';
      case ImageSetWorkflowStatus.copyingWithReadOnlyAccess:
        return 'COPYING_WITH_READ_ONLY_ACCESS';
      case ImageSetWorkflowStatus.copyFailed:
        return 'COPY_FAILED';
      case ImageSetWorkflowStatus.updating:
        return 'UPDATING';
      case ImageSetWorkflowStatus.updated:
        return 'UPDATED';
      case ImageSetWorkflowStatus.updateFailed:
        return 'UPDATE_FAILED';
      case ImageSetWorkflowStatus.deleting:
        return 'DELETING';
      case ImageSetWorkflowStatus.deleted:
        return 'DELETED';
    }
  }
}

extension ImageSetWorkflowStatusFromString on String {
  ImageSetWorkflowStatus toImageSetWorkflowStatus() {
    switch (this) {
      case 'CREATED':
        return ImageSetWorkflowStatus.created;
      case 'COPIED':
        return ImageSetWorkflowStatus.copied;
      case 'COPYING':
        return ImageSetWorkflowStatus.copying;
      case 'COPYING_WITH_READ_ONLY_ACCESS':
        return ImageSetWorkflowStatus.copyingWithReadOnlyAccess;
      case 'COPY_FAILED':
        return ImageSetWorkflowStatus.copyFailed;
      case 'UPDATING':
        return ImageSetWorkflowStatus.updating;
      case 'UPDATED':
        return ImageSetWorkflowStatus.updated;
      case 'UPDATE_FAILED':
        return ImageSetWorkflowStatus.updateFailed;
      case 'DELETING':
        return ImageSetWorkflowStatus.deleting;
      case 'DELETED':
        return ImageSetWorkflowStatus.deleted;
    }
    throw Exception('$this is not known in enum ImageSetWorkflowStatus');
  }
}

/// Summary of the image set metadata.
class ImageSetsMetadataSummary {
  /// The image set identifier.
  final String imageSetId;

  /// The DICOM tags associated with the image set.
  final DICOMTags? dICOMTags;

  /// The time an image set is created. Sample creation date is provided in
  /// <code>1985-04-12T23:20:50.52Z</code> format.
  final DateTime? createdAt;

  /// The time an image set was last updated.
  final DateTime? updatedAt;

  /// The image set version.
  final int? version;

  ImageSetsMetadataSummary({
    required this.imageSetId,
    this.dICOMTags,
    this.createdAt,
    this.updatedAt,
    this.version,
  });

  factory ImageSetsMetadataSummary.fromJson(Map<String, dynamic> json) {
    return ImageSetsMetadataSummary(
      imageSetId: json['imageSetId'] as String,
      dICOMTags: json['DICOMTags'] != null
          ? DICOMTags.fromJson(json['DICOMTags'] as Map<String, dynamic>)
          : null,
      createdAt: timeStampFromJson(json['createdAt']),
      updatedAt: timeStampFromJson(json['updatedAt']),
      version: json['version'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final imageSetId = this.imageSetId;
    final dICOMTags = this.dICOMTags;
    final createdAt = this.createdAt;
    final updatedAt = this.updatedAt;
    final version = this.version;
    return {
      'imageSetId': imageSetId,
      if (dICOMTags != null) 'DICOMTags': dICOMTags,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
      if (version != null) 'version': version,
    };
  }
}

enum JobStatus {
  submitted,
  inProgress,
  completed,
  failed,
}

extension JobStatusValueExtension on JobStatus {
  String toValue() {
    switch (this) {
      case JobStatus.submitted:
        return 'SUBMITTED';
      case JobStatus.inProgress:
        return 'IN_PROGRESS';
      case JobStatus.completed:
        return 'COMPLETED';
      case JobStatus.failed:
        return 'FAILED';
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
      case 'COMPLETED':
        return JobStatus.completed;
      case 'FAILED':
        return JobStatus.failed;
    }
    throw Exception('$this is not known in enum JobStatus');
  }
}

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
      jobSummaries: (json['jobSummaries'] as List)
          .whereNotNull()
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
          ?.whereNotNull()
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
      imageSetPropertiesList: (json['imageSetPropertiesList'] as List)
          .whereNotNull()
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

class ListTagsForResourceResponse {
  /// A list of all tags associated with a medical imaging resource.
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

/// Contains DICOMUpdates.
class MetadataUpdates {
  /// The object containing <code>removableAttributes</code> and
  /// <code>updatableAttributes</code>.
  final DICOMUpdates? dICOMUpdates;

  MetadataUpdates({
    this.dICOMUpdates,
  });

  Map<String, dynamic> toJson() {
    final dICOMUpdates = this.dICOMUpdates;
    return {
      if (dICOMUpdates != null) 'DICOMUpdates': dICOMUpdates,
    };
  }
}

enum Operator {
  equal,
  between,
}

extension OperatorValueExtension on Operator {
  String toValue() {
    switch (this) {
      case Operator.equal:
        return 'EQUAL';
      case Operator.between:
        return 'BETWEEN';
    }
  }
}

extension OperatorFromString on String {
  Operator toOperator() {
    switch (this) {
      case 'EQUAL':
        return Operator.equal;
      case 'BETWEEN':
        return Operator.between;
    }
    throw Exception('$this is not known in enum Operator');
  }
}

/// The search input attribute value.
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
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// The search criteria.
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
      'operator': operator.toValue(),
      'values': values,
    };
  }
}

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
      imageSetsMetadataSummaries: (json['imageSetsMetadataSummaries'] as List)
          .whereNotNull()
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

/// Sort search results.
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
      sortField: (json['sortField'] as String).toSortField(),
      sortOrder: (json['sortOrder'] as String).toSortOrder(),
    );
  }

  Map<String, dynamic> toJson() {
    final sortField = this.sortField;
    final sortOrder = this.sortOrder;
    return {
      'sortField': sortField.toValue(),
      'sortOrder': sortOrder.toValue(),
    };
  }
}

enum SortField {
  updatedAt,
  createdAt,
  dICOMStudyDateAndTime,
}

extension SortFieldValueExtension on SortField {
  String toValue() {
    switch (this) {
      case SortField.updatedAt:
        return 'updatedAt';
      case SortField.createdAt:
        return 'createdAt';
      case SortField.dICOMStudyDateAndTime:
        return 'DICOMStudyDateAndTime';
    }
  }
}

extension SortFieldFromString on String {
  SortField toSortField() {
    switch (this) {
      case 'updatedAt':
        return SortField.updatedAt;
      case 'createdAt':
        return SortField.createdAt;
      case 'DICOMStudyDateAndTime':
        return SortField.dICOMStudyDateAndTime;
    }
    throw Exception('$this is not known in enum SortField');
  }
}

enum SortOrder {
  asc,
  desc,
}

extension SortOrderValueExtension on SortOrder {
  String toValue() {
    switch (this) {
      case SortOrder.asc:
        return 'ASC';
      case SortOrder.desc:
        return 'DESC';
    }
  }
}

extension SortOrderFromString on String {
  SortOrder toSortOrder() {
    switch (this) {
      case 'ASC':
        return SortOrder.asc;
      case 'DESC':
        return SortOrder.desc;
    }
    throw Exception('$this is not known in enum SortOrder');
  }
}

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
      datastoreId: json['datastoreId'] as String,
      jobId: json['jobId'] as String,
      jobStatus: (json['jobStatus'] as String).toJobStatus(),
      submittedAt: nonNullableTimeStampFromJson(json['submittedAt'] as Object),
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
      'jobStatus': jobStatus.toValue(),
      'submittedAt': unixTimestampToJson(submittedAt),
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
      datastoreId: json['datastoreId'] as String,
      imageSetId: json['imageSetId'] as String,
      imageSetState: (json['imageSetState'] as String).toImageSetState(),
      latestVersionId: json['latestVersionId'] as String,
      createdAt: timeStampFromJson(json['createdAt']),
      imageSetWorkflowStatus: (json['imageSetWorkflowStatus'] as String?)
          ?.toImageSetWorkflowStatus(),
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
      'imageSetState': imageSetState.toValue(),
      'latestVersionId': latestVersionId,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (imageSetWorkflowStatus != null)
        'imageSetWorkflowStatus': imageSetWorkflowStatus.toValue(),
      if (message != null) 'message': message,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
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
