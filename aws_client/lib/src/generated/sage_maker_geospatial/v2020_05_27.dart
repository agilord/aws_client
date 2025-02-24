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

/// Provides APIs for creating and managing SageMaker geospatial resources.
class SageMakerGeospatialCapabilities {
  final _s.RestJsonProtocol _protocol;
  SageMakerGeospatialCapabilities({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'sagemaker-geospatial',
            signingName: 'sagemaker-geospatial',
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

  /// Use this operation to delete an Earth Observation job.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the Earth Observation job being deleted.
  Future<void> deleteEarthObservationJob({
    required String arn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/earth-observation-jobs/${Uri.encodeComponent(arn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Use this operation to delete a Vector Enrichment job.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the Vector Enrichment job being deleted.
  Future<void> deleteVectorEnrichmentJob({
    required String arn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/vector-enrichment-jobs/${Uri.encodeComponent(arn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Use this operation to export results of an Earth Observation job and
  /// optionally source images used as input to the EOJ to an Amazon S3
  /// location.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  ///
  /// Parameter [arn] :
  /// The input Amazon Resource Name (ARN) of the Earth Observation job being
  /// exported.
  ///
  /// Parameter [executionRoleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role that you specified for the
  /// job.
  ///
  /// Parameter [outputConfig] :
  /// An object containing information about the output file.
  ///
  /// Parameter [clientToken] :
  /// A unique token that guarantees that the call to this API is idempotent.
  ///
  /// Parameter [exportSourceImages] :
  /// The source images provided to the Earth Observation job being exported.
  Future<ExportEarthObservationJobOutput> exportEarthObservationJob({
    required String arn,
    required String executionRoleArn,
    required OutputConfigInput outputConfig,
    String? clientToken,
    bool? exportSourceImages,
  }) async {
    final $payload = <String, dynamic>{
      'Arn': arn,
      'ExecutionRoleArn': executionRoleArn,
      'OutputConfig': outputConfig,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (exportSourceImages != null) 'ExportSourceImages': exportSourceImages,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/export-earth-observation-job',
      exceptionFnMap: _exceptionFns,
    );
    return ExportEarthObservationJobOutput.fromJson(response);
  }

  /// Use this operation to copy results of a Vector Enrichment job to an Amazon
  /// S3 location.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the Vector Enrichment job.
  ///
  /// Parameter [executionRoleArn] :
  /// The Amazon Resource Name (ARN) of the IAM rolewith permission to upload to
  /// the location in OutputConfig.
  ///
  /// Parameter [outputConfig] :
  /// Output location information for exporting Vector Enrichment Job results.
  ///
  /// Parameter [clientToken] :
  /// A unique token that guarantees that the call to this API is idempotent.
  Future<ExportVectorEnrichmentJobOutput> exportVectorEnrichmentJob({
    required String arn,
    required String executionRoleArn,
    required ExportVectorEnrichmentJobOutputConfig outputConfig,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'Arn': arn,
      'ExecutionRoleArn': executionRoleArn,
      'OutputConfig': outputConfig,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/export-vector-enrichment-jobs',
      exceptionFnMap: _exceptionFns,
    );
    return ExportVectorEnrichmentJobOutput.fromJson(response);
  }

  /// Get the details for a previously initiated Earth Observation job.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the Earth Observation job.
  Future<GetEarthObservationJobOutput> getEarthObservationJob({
    required String arn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/earth-observation-jobs/${Uri.encodeComponent(arn)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetEarthObservationJobOutput.fromJson(response);
  }

  /// Use this operation to get details of a specific raster data collection.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the raster data collection.
  Future<GetRasterDataCollectionOutput> getRasterDataCollection({
    required String arn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/raster-data-collection/${Uri.encodeComponent(arn)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetRasterDataCollectionOutput.fromJson(response);
  }

  /// Gets a web mercator tile for the given Earth Observation job.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the tile operation.
  ///
  /// Parameter [imageAssets] :
  /// The particular assets or bands to tile.
  ///
  /// Parameter [target] :
  /// Determines what part of the Earth Observation job to tile. 'INPUT' or
  /// 'OUTPUT' are the valid options.
  ///
  /// Parameter [x] :
  /// The x coordinate of the tile input.
  ///
  /// Parameter [y] :
  /// The y coordinate of the tile input.
  ///
  /// Parameter [z] :
  /// The z coordinate of the tile input.
  ///
  /// Parameter [executionRoleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role that you specify.
  ///
  /// Parameter [imageMask] :
  /// Determines whether or not to return a valid data mask.
  ///
  /// Parameter [outputDataType] :
  /// The output data type of the tile operation.
  ///
  /// Parameter [outputFormat] :
  /// The data format of the output tile. The formats include .npy, .png and
  /// .jpg.
  ///
  /// Parameter [propertyFilters] :
  /// Property filters for the imagery to tile.
  ///
  /// Parameter [timeRangeFilter] :
  /// Time range filter applied to imagery to find the images to tile.
  Future<GetTileOutput> getTile({
    required String arn,
    required List<String> imageAssets,
    required TargetOptions target,
    required int x,
    required int y,
    required int z,
    String? executionRoleArn,
    bool? imageMask,
    OutputType? outputDataType,
    String? outputFormat,
    String? propertyFilters,
    String? timeRangeFilter,
  }) async {
    final $query = <String, List<String>>{
      'Arn': [arn],
      'ImageAssets': imageAssets,
      'Target': [target.value],
      if (executionRoleArn != null) 'ExecutionRoleArn': [executionRoleArn],
      if (imageMask != null) 'ImageMask': [imageMask.toString()],
      if (outputDataType != null) 'OutputDataType': [outputDataType.value],
      if (outputFormat != null) 'OutputFormat': [outputFormat],
      if (propertyFilters != null) 'PropertyFilters': [propertyFilters],
      if (timeRangeFilter != null) 'TimeRangeFilter': [timeRangeFilter],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/tile/${Uri.encodeComponent(z.toString())}/${Uri.encodeComponent(x.toString())}/${Uri.encodeComponent(y.toString())}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetTileOutput(
      binaryFile: await response.stream.toBytes(),
    );
  }

  /// Retrieves details of a Vector Enrichment Job for a given job Amazon
  /// Resource Name (ARN).
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the Vector Enrichment job.
  Future<GetVectorEnrichmentJobOutput> getVectorEnrichmentJob({
    required String arn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/vector-enrichment-jobs/${Uri.encodeComponent(arn)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetVectorEnrichmentJobOutput.fromJson(response);
  }

  /// Use this operation to get a list of the Earth Observation jobs associated
  /// with the calling Amazon Web Services account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [maxResults] :
  /// The total number of items to return.
  ///
  /// Parameter [nextToken] :
  /// If the previous response was truncated, you receive this token. Use it in
  /// your next request to receive the next set of results.
  ///
  /// Parameter [sortBy] :
  /// The parameter by which to sort the results.
  ///
  /// Parameter [sortOrder] :
  /// An optional value that specifies whether you want the results sorted in
  /// <code>Ascending</code> or <code>Descending</code> order.
  ///
  /// Parameter [statusEquals] :
  /// A filter that retrieves only jobs with a specific status.
  Future<ListEarthObservationJobOutput> listEarthObservationJobs({
    int? maxResults,
    String? nextToken,
    String? sortBy,
    SortOrder? sortOrder,
    EarthObservationJobStatus? statusEquals,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      20,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
      if (sortBy != null) 'SortBy': sortBy,
      if (sortOrder != null) 'SortOrder': sortOrder.value,
      if (statusEquals != null) 'StatusEquals': statusEquals.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/list-earth-observation-jobs',
      exceptionFnMap: _exceptionFns,
    );
    return ListEarthObservationJobOutput.fromJson(response);
  }

  /// Use this operation to get raster data collections.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [maxResults] :
  /// The total number of items to return.
  ///
  /// Parameter [nextToken] :
  /// If the previous response was truncated, you receive this token. Use it in
  /// your next request to receive the next set of results.
  Future<ListRasterDataCollectionsOutput> listRasterDataCollections({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      20,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/raster-data-collections',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListRasterDataCollectionsOutput.fromJson(response);
  }

  /// Lists the tags attached to the resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource you want to tag.
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

  /// Retrieves a list of vector enrichment jobs.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return.
  ///
  /// Parameter [nextToken] :
  /// If the previous response was truncated, you receive this token. Use it in
  /// your next request to receive the next set of results.
  ///
  /// Parameter [sortBy] :
  /// The parameter by which to sort the results.
  ///
  /// Parameter [sortOrder] :
  /// An optional value that specifies whether you want the results sorted in
  /// <code>Ascending</code> or <code>Descending</code> order.
  ///
  /// Parameter [statusEquals] :
  /// A filter that retrieves only jobs with a specific status.
  Future<ListVectorEnrichmentJobOutput> listVectorEnrichmentJobs({
    int? maxResults,
    String? nextToken,
    String? sortBy,
    SortOrder? sortOrder,
    String? statusEquals,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      20,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
      if (sortBy != null) 'SortBy': sortBy,
      if (sortOrder != null) 'SortOrder': sortOrder.value,
      if (statusEquals != null) 'StatusEquals': statusEquals,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/list-vector-enrichment-jobs',
      exceptionFnMap: _exceptionFns,
    );
    return ListVectorEnrichmentJobOutput.fromJson(response);
  }

  /// Allows you run image query on a specific raster data collection to get a
  /// list of the satellite imagery matching the selected filters.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the raster data collection.
  ///
  /// Parameter [rasterDataCollectionQuery] :
  /// RasterDataCollectionQuery consisting of <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_geospatial_AreaOfInterest.html">AreaOfInterest(AOI)</a>,
  /// <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_geospatial_PropertyFilter.html">PropertyFilters</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_geospatial_TimeRangeFilterInput.html">TimeRangeFilterInput</a>
  /// used in <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_geospatial_SearchRasterDataCollection.html">SearchRasterDataCollection</a>.
  ///
  /// Parameter [nextToken] :
  /// If the previous response was truncated, you receive this token. Use it in
  /// your next request to receive the next set of results.
  Future<SearchRasterDataCollectionOutput> searchRasterDataCollection({
    required String arn,
    required RasterDataCollectionQueryWithBandFilterInput
        rasterDataCollectionQuery,
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      'Arn': arn,
      'RasterDataCollectionQuery': rasterDataCollectionQuery,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/search-raster-data-collection',
      exceptionFnMap: _exceptionFns,
    );
    return SearchRasterDataCollectionOutput.fromJson(response);
  }

  /// Use this operation to create an Earth observation job.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  ///
  /// Parameter [executionRoleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role that you specified for the
  /// job.
  ///
  /// Parameter [inputConfig] :
  /// Input configuration information for the Earth Observation job.
  ///
  /// Parameter [jobConfig] :
  /// An object containing information about the job configuration.
  ///
  /// Parameter [name] :
  /// The name of the Earth Observation job.
  ///
  /// Parameter [clientToken] :
  /// A unique token that guarantees that the call to this API is idempotent.
  ///
  /// Parameter [kmsKeyId] :
  /// The Key Management Service key ID for server-side encryption.
  ///
  /// Parameter [tags] :
  /// Each tag consists of a key and a value.
  Future<StartEarthObservationJobOutput> startEarthObservationJob({
    required String executionRoleArn,
    required InputConfigInput inputConfig,
    required JobConfigInput jobConfig,
    required String name,
    String? clientToken,
    String? kmsKeyId,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'ExecutionRoleArn': executionRoleArn,
      'InputConfig': inputConfig,
      'JobConfig': jobConfig,
      'Name': name,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/earth-observation-jobs',
      exceptionFnMap: _exceptionFns,
    );
    return StartEarthObservationJobOutput.fromJson(response);
  }

  /// Creates a Vector Enrichment job for the supplied job type. Currently,
  /// there are two supported job types: reverse geocoding and map matching.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  ///
  /// Parameter [executionRoleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role that you specified for the
  /// job.
  ///
  /// Parameter [inputConfig] :
  /// Input configuration information for the Vector Enrichment job.
  ///
  /// Parameter [jobConfig] :
  /// An object containing information about the job configuration.
  ///
  /// Parameter [name] :
  /// The name of the Vector Enrichment job.
  ///
  /// Parameter [clientToken] :
  /// A unique token that guarantees that the call to this API is idempotent.
  ///
  /// Parameter [kmsKeyId] :
  /// The Key Management Service key ID for server-side encryption.
  ///
  /// Parameter [tags] :
  /// Each tag consists of a key and a value.
  Future<StartVectorEnrichmentJobOutput> startVectorEnrichmentJob({
    required String executionRoleArn,
    required VectorEnrichmentJobInputConfig inputConfig,
    required VectorEnrichmentJobConfig jobConfig,
    required String name,
    String? clientToken,
    String? kmsKeyId,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'ExecutionRoleArn': executionRoleArn,
      'InputConfig': inputConfig,
      'JobConfig': jobConfig,
      'Name': name,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/vector-enrichment-jobs',
      exceptionFnMap: _exceptionFns,
    );
    return StartVectorEnrichmentJobOutput.fromJson(response);
  }

  /// Use this operation to stop an existing earth observation job.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the Earth Observation job being stopped.
  Future<void> stopEarthObservationJob({
    required String arn,
  }) async {
    final $payload = <String, dynamic>{
      'Arn': arn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/earth-observation-jobs/stop',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Stops the Vector Enrichment job for a given job ARN.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the Vector Enrichment job.
  Future<void> stopVectorEnrichmentJob({
    required String arn,
  }) async {
    final $payload = <String, dynamic>{
      'Arn': arn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/vector-enrichment-jobs/stop',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// The resource you want to tag.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource you want to tag.
  ///
  /// Parameter [tags] :
  /// Each tag consists of a key and a value.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    final $payload = <String, dynamic>{
      'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// The resource you want to untag.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource you want to untag.
  ///
  /// Parameter [tagKeys] :
  /// Keys of the tags you want to remove.
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
}

enum AlgorithmNameCloudRemoval {
  interpolation('INTERPOLATION'),
  ;

  final String value;

  const AlgorithmNameCloudRemoval(this.value);

  static AlgorithmNameCloudRemoval fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum AlgorithmNameCloudRemoval'));
}

enum AlgorithmNameGeoMosaic {
  near('NEAR'),
  bilinear('BILINEAR'),
  cubic('CUBIC'),
  cubicspline('CUBICSPLINE'),
  lanczos('LANCZOS'),
  average('AVERAGE'),
  rms('RMS'),
  mode('MODE'),
  max('MAX'),
  min('MIN'),
  med('MED'),
  q1('Q1'),
  q3('Q3'),
  sum('SUM'),
  ;

  final String value;

  const AlgorithmNameGeoMosaic(this.value);

  static AlgorithmNameGeoMosaic fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum AlgorithmNameGeoMosaic'));
}

enum AlgorithmNameResampling {
  near('NEAR'),
  bilinear('BILINEAR'),
  cubic('CUBIC'),
  cubicspline('CUBICSPLINE'),
  lanczos('LANCZOS'),
  average('AVERAGE'),
  rms('RMS'),
  mode('MODE'),
  max('MAX'),
  min('MIN'),
  med('MED'),
  q1('Q1'),
  q3('Q3'),
  sum('SUM'),
  ;

  final String value;

  const AlgorithmNameResampling(this.value);

  static AlgorithmNameResampling fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum AlgorithmNameResampling'));
}

/// The geographic extent of the Earth Observation job.
class AreaOfInterest {
  /// A GeoJSON object representing the geographic extent in the coordinate space.
  final AreaOfInterestGeometry? areaOfInterestGeometry;

  AreaOfInterest({
    this.areaOfInterestGeometry,
  });

  factory AreaOfInterest.fromJson(Map<String, dynamic> json) {
    return AreaOfInterest(
      areaOfInterestGeometry: json['AreaOfInterestGeometry'] != null
          ? AreaOfInterestGeometry.fromJson(
              json['AreaOfInterestGeometry'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final areaOfInterestGeometry = this.areaOfInterestGeometry;
    return {
      if (areaOfInterestGeometry != null)
        'AreaOfInterestGeometry': areaOfInterestGeometry,
    };
  }
}

/// A GeoJSON object representing the geographic extent in the coordinate space.
class AreaOfInterestGeometry {
  /// The structure representing the MultiPolygon Geometry.
  final MultiPolygonGeometryInput? multiPolygonGeometry;

  /// The structure representing Polygon Geometry.
  final PolygonGeometryInput? polygonGeometry;

  AreaOfInterestGeometry({
    this.multiPolygonGeometry,
    this.polygonGeometry,
  });

  factory AreaOfInterestGeometry.fromJson(Map<String, dynamic> json) {
    return AreaOfInterestGeometry(
      multiPolygonGeometry: json['MultiPolygonGeometry'] != null
          ? MultiPolygonGeometryInput.fromJson(
              json['MultiPolygonGeometry'] as Map<String, dynamic>)
          : null,
      polygonGeometry: json['PolygonGeometry'] != null
          ? PolygonGeometryInput.fromJson(
              json['PolygonGeometry'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final multiPolygonGeometry = this.multiPolygonGeometry;
    final polygonGeometry = this.polygonGeometry;
    return {
      if (multiPolygonGeometry != null)
        'MultiPolygonGeometry': multiPolygonGeometry,
      if (polygonGeometry != null) 'PolygonGeometry': polygonGeometry,
    };
  }
}

/// The structure containing the asset properties.
class AssetValue {
  /// Link to the asset object.
  final String? href;

  AssetValue({
    this.href,
  });

  factory AssetValue.fromJson(Map<String, dynamic> json) {
    return AssetValue(
      href: json['Href'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final href = this.href;
    return {
      if (href != null) 'Href': href,
    };
  }
}

/// Input structure for the BandMath operation type. Defines Predefined and
/// CustomIndices to be computed using BandMath.
class BandMathConfigInput {
  /// CustomIndices that are computed.
  final CustomIndicesInput? customIndices;

  /// One or many of the supported predefined indices to compute. Allowed values:
  /// <code>NDVI</code>, <code>EVI2</code>, <code>MSAVI</code>, <code>NDWI</code>,
  /// <code>NDMI</code>, <code>NDSI</code>, and <code>WDRVI</code>.
  final List<String>? predefinedIndices;

  BandMathConfigInput({
    this.customIndices,
    this.predefinedIndices,
  });

  factory BandMathConfigInput.fromJson(Map<String, dynamic> json) {
    return BandMathConfigInput(
      customIndices: json['CustomIndices'] != null
          ? CustomIndicesInput.fromJson(
              json['CustomIndices'] as Map<String, dynamic>)
          : null,
      predefinedIndices: (json['PredefinedIndices'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final customIndices = this.customIndices;
    final predefinedIndices = this.predefinedIndices;
    return {
      if (customIndices != null) 'CustomIndices': customIndices,
      if (predefinedIndices != null) 'PredefinedIndices': predefinedIndices,
    };
  }
}

/// Input structure for CloudMasking operation type.
class CloudMaskingConfigInput {
  CloudMaskingConfigInput();

  factory CloudMaskingConfigInput.fromJson(Map<String, dynamic> _) {
    return CloudMaskingConfigInput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Input structure for Cloud Removal Operation type
class CloudRemovalConfigInput {
  /// The name of the algorithm used for cloud removal.
  final AlgorithmNameCloudRemoval? algorithmName;

  /// The interpolation value you provide for cloud removal.
  final String? interpolationValue;

  /// TargetBands to be returned in the output of CloudRemoval operation.
  final List<String>? targetBands;

  CloudRemovalConfigInput({
    this.algorithmName,
    this.interpolationValue,
    this.targetBands,
  });

  factory CloudRemovalConfigInput.fromJson(Map<String, dynamic> json) {
    return CloudRemovalConfigInput(
      algorithmName: (json['AlgorithmName'] as String?)
          ?.let(AlgorithmNameCloudRemoval.fromString),
      interpolationValue: json['InterpolationValue'] as String?,
      targetBands: (json['TargetBands'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final algorithmName = this.algorithmName;
    final interpolationValue = this.interpolationValue;
    final targetBands = this.targetBands;
    return {
      if (algorithmName != null) 'AlgorithmName': algorithmName.value,
      if (interpolationValue != null) 'InterpolationValue': interpolationValue,
      if (targetBands != null) 'TargetBands': targetBands,
    };
  }
}

enum ComparisonOperator {
  equals('EQUALS'),
  notEquals('NOT_EQUALS'),
  startsWith('STARTS_WITH'),
  ;

  final String value;

  const ComparisonOperator(this.value);

  static ComparisonOperator fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum ComparisonOperator'));
}

/// Input object defining the custom BandMath indices to compute.
class CustomIndicesInput {
  /// A list of BandMath indices to compute.
  final List<Operation>? operations;

  CustomIndicesInput({
    this.operations,
  });

  factory CustomIndicesInput.fromJson(Map<String, dynamic> json) {
    return CustomIndicesInput(
      operations: (json['Operations'] as List?)
          ?.nonNulls
          .map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final operations = this.operations;
    return {
      if (operations != null) 'Operations': operations,
    };
  }
}

enum DataCollectionType {
  public('PUBLIC'),
  premium('PREMIUM'),
  user('USER'),
  ;

  final String value;

  const DataCollectionType(this.value);

  static DataCollectionType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum DataCollectionType'));
}

class DeleteEarthObservationJobOutput {
  DeleteEarthObservationJobOutput();

  factory DeleteEarthObservationJobOutput.fromJson(Map<String, dynamic> _) {
    return DeleteEarthObservationJobOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteVectorEnrichmentJobOutput {
  DeleteVectorEnrichmentJobOutput();

  factory DeleteVectorEnrichmentJobOutput.fromJson(Map<String, dynamic> _) {
    return DeleteVectorEnrichmentJobOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The structure representing the errors in an EarthObservationJob.
class EarthObservationJobErrorDetails {
  /// A detailed message describing the error in an Earth Observation job.
  final String? message;

  /// The type of error in an Earth Observation job.
  final EarthObservationJobErrorType? type;

  EarthObservationJobErrorDetails({
    this.message,
    this.type,
  });

  factory EarthObservationJobErrorDetails.fromJson(Map<String, dynamic> json) {
    return EarthObservationJobErrorDetails(
      message: json['Message'] as String?,
      type: (json['Type'] as String?)
          ?.let(EarthObservationJobErrorType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    final type = this.type;
    return {
      if (message != null) 'Message': message,
      if (type != null) 'Type': type.value,
    };
  }
}

enum EarthObservationJobErrorType {
  clientError('CLIENT_ERROR'),
  serverError('SERVER_ERROR'),
  ;

  final String value;

  const EarthObservationJobErrorType(this.value);

  static EarthObservationJobErrorType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum EarthObservationJobErrorType'));
}

enum EarthObservationJobExportStatus {
  inProgress('IN_PROGRESS'),
  succeeded('SUCCEEDED'),
  failed('FAILED'),
  ;

  final String value;

  const EarthObservationJobExportStatus(this.value);

  static EarthObservationJobExportStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum EarthObservationJobExportStatus'));
}

enum EarthObservationJobStatus {
  initializing('INITIALIZING'),
  inProgress('IN_PROGRESS'),
  stopping('STOPPING'),
  completed('COMPLETED'),
  stopped('STOPPED'),
  failed('FAILED'),
  deleting('DELETING'),
  deleted('DELETED'),
  ;

  final String value;

  const EarthObservationJobStatus(this.value);

  static EarthObservationJobStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum EarthObservationJobStatus'));
}

/// The structure representing the EoCloudCover filter.
class EoCloudCoverInput {
  /// Lower bound for EoCloudCover.
  final double lowerBound;

  /// Upper bound for EoCloudCover.
  final double upperBound;

  EoCloudCoverInput({
    required this.lowerBound,
    required this.upperBound,
  });

  factory EoCloudCoverInput.fromJson(Map<String, dynamic> json) {
    return EoCloudCoverInput(
      lowerBound: json['LowerBound'] as double,
      upperBound: json['UpperBound'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    final lowerBound = this.lowerBound;
    final upperBound = this.upperBound;
    return {
      'LowerBound': lowerBound,
      'UpperBound': upperBound,
    };
  }
}

class ExportEarthObservationJobOutput {
  /// The output Amazon Resource Name (ARN) of the Earth Observation job being
  /// exported.
  final String arn;

  /// The creation time.
  final DateTime creationTime;

  /// The Amazon Resource Name (ARN) of the IAM role that you specified for the
  /// job.
  final String executionRoleArn;

  /// The status of the results of the Earth Observation job being exported.
  final EarthObservationJobExportStatus exportStatus;

  /// An object containing information about the output file.
  final OutputConfigInput outputConfig;

  /// The source images provided to the Earth Observation job being exported.
  final bool? exportSourceImages;

  ExportEarthObservationJobOutput({
    required this.arn,
    required this.creationTime,
    required this.executionRoleArn,
    required this.exportStatus,
    required this.outputConfig,
    this.exportSourceImages,
  });

  factory ExportEarthObservationJobOutput.fromJson(Map<String, dynamic> json) {
    return ExportEarthObservationJobOutput(
      arn: json['Arn'] as String,
      creationTime:
          nonNullableTimeStampFromJson(json['CreationTime'] as Object),
      executionRoleArn: json['ExecutionRoleArn'] as String,
      exportStatus: EarthObservationJobExportStatus.fromString(
          (json['ExportStatus'] as String)),
      outputConfig: OutputConfigInput.fromJson(
          json['OutputConfig'] as Map<String, dynamic>),
      exportSourceImages: json['ExportSourceImages'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final executionRoleArn = this.executionRoleArn;
    final exportStatus = this.exportStatus;
    final outputConfig = this.outputConfig;
    final exportSourceImages = this.exportSourceImages;
    return {
      'Arn': arn,
      'CreationTime': iso8601ToJson(creationTime),
      'ExecutionRoleArn': executionRoleArn,
      'ExportStatus': exportStatus.value,
      'OutputConfig': outputConfig,
      if (exportSourceImages != null) 'ExportSourceImages': exportSourceImages,
    };
  }
}

/// The structure for returning the export error details in a
/// GetEarthObservationJob.
class ExportErrorDetails {
  /// The structure for returning the export error details while exporting results
  /// of an Earth Observation job.
  final ExportErrorDetailsOutput? exportResults;

  /// The structure for returning the export error details while exporting the
  /// source images of an Earth Observation job.
  final ExportErrorDetailsOutput? exportSourceImages;

  ExportErrorDetails({
    this.exportResults,
    this.exportSourceImages,
  });

  factory ExportErrorDetails.fromJson(Map<String, dynamic> json) {
    return ExportErrorDetails(
      exportResults: json['ExportResults'] != null
          ? ExportErrorDetailsOutput.fromJson(
              json['ExportResults'] as Map<String, dynamic>)
          : null,
      exportSourceImages: json['ExportSourceImages'] != null
          ? ExportErrorDetailsOutput.fromJson(
              json['ExportSourceImages'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final exportResults = this.exportResults;
    final exportSourceImages = this.exportSourceImages;
    return {
      if (exportResults != null) 'ExportResults': exportResults,
      if (exportSourceImages != null) 'ExportSourceImages': exportSourceImages,
    };
  }
}

/// The structure representing the errors in an export EarthObservationJob
/// operation.
class ExportErrorDetailsOutput {
  /// A detailed message describing the error in an export EarthObservationJob
  /// operation.
  final String? message;

  /// The type of error in an export EarthObservationJob operation.
  final ExportErrorType? type;

  ExportErrorDetailsOutput({
    this.message,
    this.type,
  });

  factory ExportErrorDetailsOutput.fromJson(Map<String, dynamic> json) {
    return ExportErrorDetailsOutput(
      message: json['Message'] as String?,
      type: (json['Type'] as String?)?.let(ExportErrorType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    final type = this.type;
    return {
      if (message != null) 'Message': message,
      if (type != null) 'Type': type.value,
    };
  }
}

enum ExportErrorType {
  clientError('CLIENT_ERROR'),
  serverError('SERVER_ERROR'),
  ;

  final String value;

  const ExportErrorType(this.value);

  static ExportErrorType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum ExportErrorType'));
}

/// The structure containing the Amazon S3 path to export the Earth Observation
/// job output.
class ExportS3DataInput {
  /// The URL to the Amazon S3 data input.
  final String s3Uri;

  /// The Key Management Service key ID for server-side encryption.
  final String? kmsKeyId;

  ExportS3DataInput({
    required this.s3Uri,
    this.kmsKeyId,
  });

  factory ExportS3DataInput.fromJson(Map<String, dynamic> json) {
    return ExportS3DataInput(
      s3Uri: json['S3Uri'] as String,
      kmsKeyId: json['KmsKeyId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Uri = this.s3Uri;
    final kmsKeyId = this.kmsKeyId;
    return {
      'S3Uri': s3Uri,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
    };
  }
}

class ExportVectorEnrichmentJobOutput {
  /// The Amazon Resource Name (ARN) of the Vector Enrichment job being exported.
  final String arn;

  /// The creation time.
  final DateTime creationTime;

  /// The Amazon Resource Name (ARN) of the IAM role with permission to upload to
  /// the location in OutputConfig.
  final String executionRoleArn;

  /// The status of the results the Vector Enrichment job being exported.
  final VectorEnrichmentJobExportStatus exportStatus;

  /// Output location information for exporting Vector Enrichment Job results.
  final ExportVectorEnrichmentJobOutputConfig outputConfig;

  ExportVectorEnrichmentJobOutput({
    required this.arn,
    required this.creationTime,
    required this.executionRoleArn,
    required this.exportStatus,
    required this.outputConfig,
  });

  factory ExportVectorEnrichmentJobOutput.fromJson(Map<String, dynamic> json) {
    return ExportVectorEnrichmentJobOutput(
      arn: json['Arn'] as String,
      creationTime:
          nonNullableTimeStampFromJson(json['CreationTime'] as Object),
      executionRoleArn: json['ExecutionRoleArn'] as String,
      exportStatus: VectorEnrichmentJobExportStatus.fromString(
          (json['ExportStatus'] as String)),
      outputConfig: ExportVectorEnrichmentJobOutputConfig.fromJson(
          json['OutputConfig'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final executionRoleArn = this.executionRoleArn;
    final exportStatus = this.exportStatus;
    final outputConfig = this.outputConfig;
    return {
      'Arn': arn,
      'CreationTime': iso8601ToJson(creationTime),
      'ExecutionRoleArn': executionRoleArn,
      'ExportStatus': exportStatus.value,
      'OutputConfig': outputConfig,
    };
  }
}

/// An object containing information about the output file.
class ExportVectorEnrichmentJobOutputConfig {
  /// The input structure for Amazon S3 data; representing the Amazon S3 location
  /// of the input data objects.
  final VectorEnrichmentJobS3Data s3Data;

  ExportVectorEnrichmentJobOutputConfig({
    required this.s3Data,
  });

  factory ExportVectorEnrichmentJobOutputConfig.fromJson(
      Map<String, dynamic> json) {
    return ExportVectorEnrichmentJobOutputConfig(
      s3Data: VectorEnrichmentJobS3Data.fromJson(
          json['S3Data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final s3Data = this.s3Data;
    return {
      'S3Data': s3Data,
    };
  }
}

/// The structure representing the filters supported by a RasterDataCollection.
class Filter {
  /// The name of the filter.
  final String name;

  /// The type of the filter being used.
  final String type;

  /// The maximum value of the filter.
  final double? maximum;

  /// The minimum value of the filter.
  final double? minimum;

  Filter({
    required this.name,
    required this.type,
    this.maximum,
    this.minimum,
  });

  factory Filter.fromJson(Map<String, dynamic> json) {
    return Filter(
      name: json['Name'] as String,
      type: json['Type'] as String,
      maximum: json['Maximum'] as double?,
      minimum: json['Minimum'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final type = this.type;
    final maximum = this.maximum;
    final minimum = this.minimum;
    return {
      'Name': name,
      'Type': type,
      if (maximum != null) 'Maximum': maximum,
      if (minimum != null) 'Minimum': minimum,
    };
  }
}

/// Input configuration information for the geomosaic.
class GeoMosaicConfigInput {
  /// The name of the algorithm being used for geomosaic.
  final AlgorithmNameGeoMosaic? algorithmName;

  /// The target bands for geomosaic.
  final List<String>? targetBands;

  GeoMosaicConfigInput({
    this.algorithmName,
    this.targetBands,
  });

  factory GeoMosaicConfigInput.fromJson(Map<String, dynamic> json) {
    return GeoMosaicConfigInput(
      algorithmName: (json['AlgorithmName'] as String?)
          ?.let(AlgorithmNameGeoMosaic.fromString),
      targetBands: (json['TargetBands'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final algorithmName = this.algorithmName;
    final targetBands = this.targetBands;
    return {
      if (algorithmName != null) 'AlgorithmName': algorithmName.value,
      if (targetBands != null) 'TargetBands': targetBands,
    };
  }
}

/// The structure representing a Geometry in terms of Type and Coordinates as
/// per GeoJson spec.
class Geometry {
  /// The coordinates of the GeoJson Geometry.
  final List<List<List<double>>> coordinates;

  /// GeoJson Geometry types like Polygon and MultiPolygon.
  final String type;

  Geometry({
    required this.coordinates,
    required this.type,
  });

  factory Geometry.fromJson(Map<String, dynamic> json) {
    return Geometry(
      coordinates: (json['Coordinates'] as List)
          .nonNulls
          .map((e) => (e as List)
              .nonNulls
              .map((e) => (e as List).nonNulls.map((e) => e as double).toList())
              .toList())
          .toList(),
      type: json['Type'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final coordinates = this.coordinates;
    final type = this.type;
    return {
      'Coordinates': coordinates,
      'Type': type,
    };
  }
}

class GetEarthObservationJobOutput {
  /// The Amazon Resource Name (ARN) of the Earth Observation job.
  final String arn;

  /// The creation time of the initiated Earth Observation job.
  final DateTime creationTime;

  /// The duration of Earth Observation job, in seconds.
  final int durationInSeconds;

  /// Input data for the Earth Observation job.
  final InputConfigOutput inputConfig;

  /// An object containing information about the job configuration.
  final JobConfigInput jobConfig;

  /// The name of the Earth Observation job.
  final String name;

  /// The status of a previously initiated Earth Observation job.
  final EarthObservationJobStatus status;

  /// Details about the errors generated during the Earth Observation job.
  final EarthObservationJobErrorDetails? errorDetails;

  /// The Amazon Resource Name (ARN) of the IAM role that you specified for the
  /// job.
  final String? executionRoleArn;

  /// Details about the errors generated during ExportEarthObservationJob.
  final ExportErrorDetails? exportErrorDetails;

  /// The status of the Earth Observation job.
  final EarthObservationJobExportStatus? exportStatus;

  /// The Key Management Service key ID for server-side encryption.
  final String? kmsKeyId;

  /// Bands available in the output of an operation.
  final List<OutputBand>? outputBands;

  /// Each tag consists of a key and a value.
  final Map<String, String>? tags;

  GetEarthObservationJobOutput({
    required this.arn,
    required this.creationTime,
    required this.durationInSeconds,
    required this.inputConfig,
    required this.jobConfig,
    required this.name,
    required this.status,
    this.errorDetails,
    this.executionRoleArn,
    this.exportErrorDetails,
    this.exportStatus,
    this.kmsKeyId,
    this.outputBands,
    this.tags,
  });

  factory GetEarthObservationJobOutput.fromJson(Map<String, dynamic> json) {
    return GetEarthObservationJobOutput(
      arn: json['Arn'] as String,
      creationTime:
          nonNullableTimeStampFromJson(json['CreationTime'] as Object),
      durationInSeconds: json['DurationInSeconds'] as int,
      inputConfig: InputConfigOutput.fromJson(
          json['InputConfig'] as Map<String, dynamic>),
      jobConfig:
          JobConfigInput.fromJson(json['JobConfig'] as Map<String, dynamic>),
      name: json['Name'] as String,
      status: EarthObservationJobStatus.fromString((json['Status'] as String)),
      errorDetails: json['ErrorDetails'] != null
          ? EarthObservationJobErrorDetails.fromJson(
              json['ErrorDetails'] as Map<String, dynamic>)
          : null,
      executionRoleArn: json['ExecutionRoleArn'] as String?,
      exportErrorDetails: json['ExportErrorDetails'] != null
          ? ExportErrorDetails.fromJson(
              json['ExportErrorDetails'] as Map<String, dynamic>)
          : null,
      exportStatus: (json['ExportStatus'] as String?)
          ?.let(EarthObservationJobExportStatus.fromString),
      kmsKeyId: json['KmsKeyId'] as String?,
      outputBands: (json['OutputBands'] as List?)
          ?.nonNulls
          .map((e) => OutputBand.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final durationInSeconds = this.durationInSeconds;
    final inputConfig = this.inputConfig;
    final jobConfig = this.jobConfig;
    final name = this.name;
    final status = this.status;
    final errorDetails = this.errorDetails;
    final executionRoleArn = this.executionRoleArn;
    final exportErrorDetails = this.exportErrorDetails;
    final exportStatus = this.exportStatus;
    final kmsKeyId = this.kmsKeyId;
    final outputBands = this.outputBands;
    final tags = this.tags;
    return {
      'Arn': arn,
      'CreationTime': iso8601ToJson(creationTime),
      'DurationInSeconds': durationInSeconds,
      'InputConfig': inputConfig,
      'JobConfig': jobConfig,
      'Name': name,
      'Status': status.value,
      if (errorDetails != null) 'ErrorDetails': errorDetails,
      if (executionRoleArn != null) 'ExecutionRoleArn': executionRoleArn,
      if (exportErrorDetails != null) 'ExportErrorDetails': exportErrorDetails,
      if (exportStatus != null) 'ExportStatus': exportStatus.value,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (outputBands != null) 'OutputBands': outputBands,
      if (tags != null) 'Tags': tags,
    };
  }
}

class GetRasterDataCollectionOutput {
  /// The Amazon Resource Name (ARN) of the raster data collection.
  final String arn;

  /// A description of the raster data collection.
  final String description;

  /// The URL of the description page.
  final String descriptionPageUrl;

  /// The list of image source bands in the raster data collection.
  final List<String> imageSourceBands;

  /// The name of the raster data collection.
  final String name;

  /// The filters supported by the raster data collection.
  final List<Filter> supportedFilters;

  /// The raster data collection type.
  final DataCollectionType type;

  /// Each tag consists of a key and a value.
  final Map<String, String>? tags;

  GetRasterDataCollectionOutput({
    required this.arn,
    required this.description,
    required this.descriptionPageUrl,
    required this.imageSourceBands,
    required this.name,
    required this.supportedFilters,
    required this.type,
    this.tags,
  });

  factory GetRasterDataCollectionOutput.fromJson(Map<String, dynamic> json) {
    return GetRasterDataCollectionOutput(
      arn: json['Arn'] as String,
      description: json['Description'] as String,
      descriptionPageUrl: json['DescriptionPageUrl'] as String,
      imageSourceBands: (json['ImageSourceBands'] as List)
          .nonNulls
          .map((e) => e as String)
          .toList(),
      name: json['Name'] as String,
      supportedFilters: (json['SupportedFilters'] as List)
          .nonNulls
          .map((e) => Filter.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: DataCollectionType.fromString((json['Type'] as String)),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final description = this.description;
    final descriptionPageUrl = this.descriptionPageUrl;
    final imageSourceBands = this.imageSourceBands;
    final name = this.name;
    final supportedFilters = this.supportedFilters;
    final type = this.type;
    final tags = this.tags;
    return {
      'Arn': arn,
      'Description': description,
      'DescriptionPageUrl': descriptionPageUrl,
      'ImageSourceBands': imageSourceBands,
      'Name': name,
      'SupportedFilters': supportedFilters,
      'Type': type.value,
      if (tags != null) 'Tags': tags,
    };
  }
}

class GetTileOutput {
  /// The output binary file.
  final Uint8List? binaryFile;

  GetTileOutput({
    this.binaryFile,
  });

  Map<String, dynamic> toJson() {
    final binaryFile = this.binaryFile;
    return {
      if (binaryFile != null) 'BinaryFile': base64Encode(binaryFile),
    };
  }
}

class GetVectorEnrichmentJobOutput {
  /// The Amazon Resource Name (ARN) of the Vector Enrichment job.
  final String arn;

  /// The creation time.
  final DateTime creationTime;

  /// The duration of the Vector Enrichment job, in seconds.
  final int durationInSeconds;

  /// The Amazon Resource Name (ARN) of the IAM role that you specified for the
  /// job.
  final String executionRoleArn;

  /// Input configuration information for the Vector Enrichment job.
  final VectorEnrichmentJobInputConfig inputConfig;

  /// An object containing information about the job configuration.
  final VectorEnrichmentJobConfig jobConfig;

  /// The name of the Vector Enrichment job.
  final String name;

  /// The status of the initiated Vector Enrichment job.
  final VectorEnrichmentJobStatus status;

  /// The type of the Vector Enrichment job being initiated.
  final VectorEnrichmentJobType type;

  /// Details about the errors generated during the Vector Enrichment job.
  final VectorEnrichmentJobErrorDetails? errorDetails;

  /// Details about the errors generated during the ExportVectorEnrichmentJob.
  final VectorEnrichmentJobExportErrorDetails? exportErrorDetails;

  /// The export status of the Vector Enrichment job being initiated.
  final VectorEnrichmentJobExportStatus? exportStatus;

  /// The Key Management Service key ID for server-side encryption.
  final String? kmsKeyId;

  /// Each tag consists of a key and a value.
  final Map<String, String>? tags;

  GetVectorEnrichmentJobOutput({
    required this.arn,
    required this.creationTime,
    required this.durationInSeconds,
    required this.executionRoleArn,
    required this.inputConfig,
    required this.jobConfig,
    required this.name,
    required this.status,
    required this.type,
    this.errorDetails,
    this.exportErrorDetails,
    this.exportStatus,
    this.kmsKeyId,
    this.tags,
  });

  factory GetVectorEnrichmentJobOutput.fromJson(Map<String, dynamic> json) {
    return GetVectorEnrichmentJobOutput(
      arn: json['Arn'] as String,
      creationTime:
          nonNullableTimeStampFromJson(json['CreationTime'] as Object),
      durationInSeconds: json['DurationInSeconds'] as int,
      executionRoleArn: json['ExecutionRoleArn'] as String,
      inputConfig: VectorEnrichmentJobInputConfig.fromJson(
          json['InputConfig'] as Map<String, dynamic>),
      jobConfig: VectorEnrichmentJobConfig.fromJson(
          json['JobConfig'] as Map<String, dynamic>),
      name: json['Name'] as String,
      status: VectorEnrichmentJobStatus.fromString((json['Status'] as String)),
      type: VectorEnrichmentJobType.fromString((json['Type'] as String)),
      errorDetails: json['ErrorDetails'] != null
          ? VectorEnrichmentJobErrorDetails.fromJson(
              json['ErrorDetails'] as Map<String, dynamic>)
          : null,
      exportErrorDetails: json['ExportErrorDetails'] != null
          ? VectorEnrichmentJobExportErrorDetails.fromJson(
              json['ExportErrorDetails'] as Map<String, dynamic>)
          : null,
      exportStatus: (json['ExportStatus'] as String?)
          ?.let(VectorEnrichmentJobExportStatus.fromString),
      kmsKeyId: json['KmsKeyId'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final durationInSeconds = this.durationInSeconds;
    final executionRoleArn = this.executionRoleArn;
    final inputConfig = this.inputConfig;
    final jobConfig = this.jobConfig;
    final name = this.name;
    final status = this.status;
    final type = this.type;
    final errorDetails = this.errorDetails;
    final exportErrorDetails = this.exportErrorDetails;
    final exportStatus = this.exportStatus;
    final kmsKeyId = this.kmsKeyId;
    final tags = this.tags;
    return {
      'Arn': arn,
      'CreationTime': iso8601ToJson(creationTime),
      'DurationInSeconds': durationInSeconds,
      'ExecutionRoleArn': executionRoleArn,
      'InputConfig': inputConfig,
      'JobConfig': jobConfig,
      'Name': name,
      'Status': status.value,
      'Type': type.value,
      if (errorDetails != null) 'ErrorDetails': errorDetails,
      if (exportErrorDetails != null) 'ExportErrorDetails': exportErrorDetails,
      if (exportStatus != null) 'ExportStatus': exportStatus.value,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (tags != null) 'Tags': tags,
    };
  }
}

enum GroupBy {
  all('ALL'),
  yearly('YEARLY'),
  ;

  final String value;

  const GroupBy(this.value);

  static GroupBy fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception('$value is not known in enum GroupBy'));
}

/// Input configuration information.
class InputConfigInput {
  /// The Amazon Resource Name (ARN) of the previous Earth Observation job.
  final String? previousEarthObservationJobArn;

  /// The structure representing the RasterDataCollection Query consisting of the
  /// Area of Interest, RasterDataCollectionArn,TimeRange and Property Filters.
  final RasterDataCollectionQueryInput? rasterDataCollectionQuery;

  InputConfigInput({
    this.previousEarthObservationJobArn,
    this.rasterDataCollectionQuery,
  });

  Map<String, dynamic> toJson() {
    final previousEarthObservationJobArn = this.previousEarthObservationJobArn;
    final rasterDataCollectionQuery = this.rasterDataCollectionQuery;
    return {
      if (previousEarthObservationJobArn != null)
        'PreviousEarthObservationJobArn': previousEarthObservationJobArn,
      if (rasterDataCollectionQuery != null)
        'RasterDataCollectionQuery': rasterDataCollectionQuery,
    };
  }
}

/// The InputConfig for an EarthObservationJob response.
class InputConfigOutput {
  /// The Amazon Resource Name (ARN) of the previous Earth Observation job.
  final String? previousEarthObservationJobArn;

  /// The structure representing the RasterDataCollection Query consisting of the
  /// Area of Interest, RasterDataCollectionArn, RasterDataCollectionName,
  /// TimeRange, and Property Filters.
  final RasterDataCollectionQueryOutput? rasterDataCollectionQuery;

  InputConfigOutput({
    this.previousEarthObservationJobArn,
    this.rasterDataCollectionQuery,
  });

  factory InputConfigOutput.fromJson(Map<String, dynamic> json) {
    return InputConfigOutput(
      previousEarthObservationJobArn:
          json['PreviousEarthObservationJobArn'] as String?,
      rasterDataCollectionQuery: json['RasterDataCollectionQuery'] != null
          ? RasterDataCollectionQueryOutput.fromJson(
              json['RasterDataCollectionQuery'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final previousEarthObservationJobArn = this.previousEarthObservationJobArn;
    final rasterDataCollectionQuery = this.rasterDataCollectionQuery;
    return {
      if (previousEarthObservationJobArn != null)
        'PreviousEarthObservationJobArn': previousEarthObservationJobArn,
      if (rasterDataCollectionQuery != null)
        'RasterDataCollectionQuery': rasterDataCollectionQuery,
    };
  }
}

/// The structure representing the items in the response for
/// SearchRasterDataCollection.
class ItemSource {
  /// The searchable date and time of the item, in UTC.
  final DateTime dateTime;

  /// The item Geometry in GeoJson format.
  final Geometry geometry;

  /// A unique Id for the source item.
  final String id;

  /// This is a dictionary of Asset Objects data associated with the Item that can
  /// be downloaded or streamed, each with a unique key.
  final Map<String, AssetValue>? assets;

  /// This field contains additional properties of the item.
  final Properties? properties;

  ItemSource({
    required this.dateTime,
    required this.geometry,
    required this.id,
    this.assets,
    this.properties,
  });

  factory ItemSource.fromJson(Map<String, dynamic> json) {
    return ItemSource(
      dateTime: nonNullableTimeStampFromJson(json['DateTime'] as Object),
      geometry: Geometry.fromJson(json['Geometry'] as Map<String, dynamic>),
      id: json['Id'] as String,
      assets: (json['Assets'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, AssetValue.fromJson(e as Map<String, dynamic>))),
      properties: json['Properties'] != null
          ? Properties.fromJson(json['Properties'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final dateTime = this.dateTime;
    final geometry = this.geometry;
    final id = this.id;
    final assets = this.assets;
    final properties = this.properties;
    return {
      'DateTime': unixTimestampToJson(dateTime),
      'Geometry': geometry,
      'Id': id,
      if (assets != null) 'Assets': assets,
      if (properties != null) 'Properties': properties,
    };
  }
}

/// The input structure for the JobConfig in an EarthObservationJob.
class JobConfigInput {
  /// An object containing information about the job configuration for BandMath.
  final BandMathConfigInput? bandMathConfig;

  /// An object containing information about the job configuration for cloud
  /// masking.
  final CloudMaskingConfigInput? cloudMaskingConfig;

  /// An object containing information about the job configuration for cloud
  /// removal.
  final CloudRemovalConfigInput? cloudRemovalConfig;

  /// An object containing information about the job configuration for geomosaic.
  final GeoMosaicConfigInput? geoMosaicConfig;

  /// An object containing information about the job configuration for land cover
  /// segmentation.
  final LandCoverSegmentationConfigInput? landCoverSegmentationConfig;

  /// An object containing information about the job configuration for resampling.
  final ResamplingConfigInput? resamplingConfig;

  /// An object containing information about the job configuration for a Stacking
  /// Earth Observation job.
  final StackConfigInput? stackConfig;

  /// An object containing information about the job configuration for temporal
  /// statistics.
  final TemporalStatisticsConfigInput? temporalStatisticsConfig;

  /// An object containing information about the job configuration for zonal
  /// statistics.
  final ZonalStatisticsConfigInput? zonalStatisticsConfig;

  JobConfigInput({
    this.bandMathConfig,
    this.cloudMaskingConfig,
    this.cloudRemovalConfig,
    this.geoMosaicConfig,
    this.landCoverSegmentationConfig,
    this.resamplingConfig,
    this.stackConfig,
    this.temporalStatisticsConfig,
    this.zonalStatisticsConfig,
  });

  factory JobConfigInput.fromJson(Map<String, dynamic> json) {
    return JobConfigInput(
      bandMathConfig: json['BandMathConfig'] != null
          ? BandMathConfigInput.fromJson(
              json['BandMathConfig'] as Map<String, dynamic>)
          : null,
      cloudMaskingConfig: json['CloudMaskingConfig'] != null
          ? CloudMaskingConfigInput.fromJson(
              json['CloudMaskingConfig'] as Map<String, dynamic>)
          : null,
      cloudRemovalConfig: json['CloudRemovalConfig'] != null
          ? CloudRemovalConfigInput.fromJson(
              json['CloudRemovalConfig'] as Map<String, dynamic>)
          : null,
      geoMosaicConfig: json['GeoMosaicConfig'] != null
          ? GeoMosaicConfigInput.fromJson(
              json['GeoMosaicConfig'] as Map<String, dynamic>)
          : null,
      landCoverSegmentationConfig: json['LandCoverSegmentationConfig'] != null
          ? LandCoverSegmentationConfigInput.fromJson(
              json['LandCoverSegmentationConfig'] as Map<String, dynamic>)
          : null,
      resamplingConfig: json['ResamplingConfig'] != null
          ? ResamplingConfigInput.fromJson(
              json['ResamplingConfig'] as Map<String, dynamic>)
          : null,
      stackConfig: json['StackConfig'] != null
          ? StackConfigInput.fromJson(
              json['StackConfig'] as Map<String, dynamic>)
          : null,
      temporalStatisticsConfig: json['TemporalStatisticsConfig'] != null
          ? TemporalStatisticsConfigInput.fromJson(
              json['TemporalStatisticsConfig'] as Map<String, dynamic>)
          : null,
      zonalStatisticsConfig: json['ZonalStatisticsConfig'] != null
          ? ZonalStatisticsConfigInput.fromJson(
              json['ZonalStatisticsConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final bandMathConfig = this.bandMathConfig;
    final cloudMaskingConfig = this.cloudMaskingConfig;
    final cloudRemovalConfig = this.cloudRemovalConfig;
    final geoMosaicConfig = this.geoMosaicConfig;
    final landCoverSegmentationConfig = this.landCoverSegmentationConfig;
    final resamplingConfig = this.resamplingConfig;
    final stackConfig = this.stackConfig;
    final temporalStatisticsConfig = this.temporalStatisticsConfig;
    final zonalStatisticsConfig = this.zonalStatisticsConfig;
    return {
      if (bandMathConfig != null) 'BandMathConfig': bandMathConfig,
      if (cloudMaskingConfig != null) 'CloudMaskingConfig': cloudMaskingConfig,
      if (cloudRemovalConfig != null) 'CloudRemovalConfig': cloudRemovalConfig,
      if (geoMosaicConfig != null) 'GeoMosaicConfig': geoMosaicConfig,
      if (landCoverSegmentationConfig != null)
        'LandCoverSegmentationConfig': landCoverSegmentationConfig,
      if (resamplingConfig != null) 'ResamplingConfig': resamplingConfig,
      if (stackConfig != null) 'StackConfig': stackConfig,
      if (temporalStatisticsConfig != null)
        'TemporalStatisticsConfig': temporalStatisticsConfig,
      if (zonalStatisticsConfig != null)
        'ZonalStatisticsConfig': zonalStatisticsConfig,
    };
  }
}

/// The input structure for Land Cover Operation type.
class LandCoverSegmentationConfigInput {
  LandCoverSegmentationConfigInput();

  factory LandCoverSegmentationConfigInput.fromJson(Map<String, dynamic> _) {
    return LandCoverSegmentationConfigInput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The structure representing Land Cloud Cover property for Landsat data
/// collection.
class LandsatCloudCoverLandInput {
  /// The minimum value for Land Cloud Cover property filter. This will filter
  /// items having Land Cloud Cover greater than or equal to this value.
  final double lowerBound;

  /// The maximum value for Land Cloud Cover property filter. This will filter
  /// items having Land Cloud Cover less than or equal to this value.
  final double upperBound;

  LandsatCloudCoverLandInput({
    required this.lowerBound,
    required this.upperBound,
  });

  factory LandsatCloudCoverLandInput.fromJson(Map<String, dynamic> json) {
    return LandsatCloudCoverLandInput(
      lowerBound: json['LowerBound'] as double,
      upperBound: json['UpperBound'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    final lowerBound = this.lowerBound;
    final upperBound = this.upperBound;
    return {
      'LowerBound': lowerBound,
      'UpperBound': upperBound,
    };
  }
}

class ListEarthObservationJobOutput {
  /// Contains summary information about the Earth Observation jobs.
  final List<ListEarthObservationJobOutputConfig> earthObservationJobSummaries;

  /// If the previous response was truncated, you receive this token. Use it in
  /// your next request to receive the next set of results.
  final String? nextToken;

  ListEarthObservationJobOutput({
    required this.earthObservationJobSummaries,
    this.nextToken,
  });

  factory ListEarthObservationJobOutput.fromJson(Map<String, dynamic> json) {
    return ListEarthObservationJobOutput(
      earthObservationJobSummaries:
          (json['EarthObservationJobSummaries'] as List)
              .nonNulls
              .map((e) => ListEarthObservationJobOutputConfig.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final earthObservationJobSummaries = this.earthObservationJobSummaries;
    final nextToken = this.nextToken;
    return {
      'EarthObservationJobSummaries': earthObservationJobSummaries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// An object containing information about the output file.
class ListEarthObservationJobOutputConfig {
  /// The Amazon Resource Name (ARN) of the list of the Earth Observation jobs.
  final String arn;

  /// The creation time.
  final DateTime creationTime;

  /// The duration of the session, in seconds.
  final int durationInSeconds;

  /// The names of the Earth Observation jobs in the list.
  final String name;

  /// The operation type for an Earth Observation job.
  final String operationType;

  /// The status of the list of the Earth Observation jobs.
  final EarthObservationJobStatus status;

  /// Each tag consists of a key and a value.
  final Map<String, String>? tags;

  ListEarthObservationJobOutputConfig({
    required this.arn,
    required this.creationTime,
    required this.durationInSeconds,
    required this.name,
    required this.operationType,
    required this.status,
    this.tags,
  });

  factory ListEarthObservationJobOutputConfig.fromJson(
      Map<String, dynamic> json) {
    return ListEarthObservationJobOutputConfig(
      arn: json['Arn'] as String,
      creationTime:
          nonNullableTimeStampFromJson(json['CreationTime'] as Object),
      durationInSeconds: json['DurationInSeconds'] as int,
      name: json['Name'] as String,
      operationType: json['OperationType'] as String,
      status: EarthObservationJobStatus.fromString((json['Status'] as String)),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final durationInSeconds = this.durationInSeconds;
    final name = this.name;
    final operationType = this.operationType;
    final status = this.status;
    final tags = this.tags;
    return {
      'Arn': arn,
      'CreationTime': iso8601ToJson(creationTime),
      'DurationInSeconds': durationInSeconds,
      'Name': name,
      'OperationType': operationType,
      'Status': status.value,
      if (tags != null) 'Tags': tags,
    };
  }
}

class ListRasterDataCollectionsOutput {
  /// Contains summary information about the raster data collection.
  final List<RasterDataCollectionMetadata> rasterDataCollectionSummaries;

  /// If the previous response was truncated, you receive this token. Use it in
  /// your next request to receive the next set of results.
  final String? nextToken;

  ListRasterDataCollectionsOutput({
    required this.rasterDataCollectionSummaries,
    this.nextToken,
  });

  factory ListRasterDataCollectionsOutput.fromJson(Map<String, dynamic> json) {
    return ListRasterDataCollectionsOutput(
      rasterDataCollectionSummaries: (json['RasterDataCollectionSummaries']
              as List)
          .nonNulls
          .map((e) =>
              RasterDataCollectionMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final rasterDataCollectionSummaries = this.rasterDataCollectionSummaries;
    final nextToken = this.nextToken;
    return {
      'RasterDataCollectionSummaries': rasterDataCollectionSummaries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListTagsForResourceResponse {
  /// Each tag consists of a key and a value.
  final Map<String, String>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'Tags': tags,
    };
  }
}

class ListVectorEnrichmentJobOutput {
  /// Contains summary information about the Vector Enrichment jobs.
  final List<ListVectorEnrichmentJobOutputConfig> vectorEnrichmentJobSummaries;

  /// If the previous response was truncated, you receive this token. Use it in
  /// your next request to receive the next set of results.
  final String? nextToken;

  ListVectorEnrichmentJobOutput({
    required this.vectorEnrichmentJobSummaries,
    this.nextToken,
  });

  factory ListVectorEnrichmentJobOutput.fromJson(Map<String, dynamic> json) {
    return ListVectorEnrichmentJobOutput(
      vectorEnrichmentJobSummaries:
          (json['VectorEnrichmentJobSummaries'] as List)
              .nonNulls
              .map((e) => ListVectorEnrichmentJobOutputConfig.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final vectorEnrichmentJobSummaries = this.vectorEnrichmentJobSummaries;
    final nextToken = this.nextToken;
    return {
      'VectorEnrichmentJobSummaries': vectorEnrichmentJobSummaries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// An object containing information about the output file.
class ListVectorEnrichmentJobOutputConfig {
  /// The Amazon Resource Name (ARN) of the list of the Vector Enrichment jobs.
  final String arn;

  /// The creation time.
  final DateTime creationTime;

  /// The duration of the session, in seconds.
  final int durationInSeconds;

  /// The names of the Vector Enrichment jobs in the list.
  final String name;

  /// The status of the Vector Enrichment jobs list.
  final VectorEnrichmentJobStatus status;

  /// The type of the list of Vector Enrichment jobs.
  final VectorEnrichmentJobType type;

  /// Each tag consists of a key and a value.
  final Map<String, String>? tags;

  ListVectorEnrichmentJobOutputConfig({
    required this.arn,
    required this.creationTime,
    required this.durationInSeconds,
    required this.name,
    required this.status,
    required this.type,
    this.tags,
  });

  factory ListVectorEnrichmentJobOutputConfig.fromJson(
      Map<String, dynamic> json) {
    return ListVectorEnrichmentJobOutputConfig(
      arn: json['Arn'] as String,
      creationTime:
          nonNullableTimeStampFromJson(json['CreationTime'] as Object),
      durationInSeconds: json['DurationInSeconds'] as int,
      name: json['Name'] as String,
      status: VectorEnrichmentJobStatus.fromString((json['Status'] as String)),
      type: VectorEnrichmentJobType.fromString((json['Type'] as String)),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final durationInSeconds = this.durationInSeconds;
    final name = this.name;
    final status = this.status;
    final type = this.type;
    final tags = this.tags;
    return {
      'Arn': arn,
      'CreationTime': iso8601ToJson(creationTime),
      'DurationInSeconds': durationInSeconds,
      'Name': name,
      'Status': status.value,
      'Type': type.value,
      if (tags != null) 'Tags': tags,
    };
  }
}

enum LogicalOperator {
  and('AND'),
  ;

  final String value;

  const LogicalOperator(this.value);

  static LogicalOperator fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum LogicalOperator'));
}

/// The input structure for Map Matching operation type.
class MapMatchingConfig {
  /// The field name for the data that describes the identifier representing a
  /// collection of GPS points belonging to an individual trace.
  final String idAttributeName;

  /// The name of the timestamp attribute.
  final String timestampAttributeName;

  /// The name of the X-attribute
  final String xAttributeName;

  /// The name of the Y-attribute
  final String yAttributeName;

  MapMatchingConfig({
    required this.idAttributeName,
    required this.timestampAttributeName,
    required this.xAttributeName,
    required this.yAttributeName,
  });

  factory MapMatchingConfig.fromJson(Map<String, dynamic> json) {
    return MapMatchingConfig(
      idAttributeName: json['IdAttributeName'] as String,
      timestampAttributeName: json['TimestampAttributeName'] as String,
      xAttributeName: json['XAttributeName'] as String,
      yAttributeName: json['YAttributeName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final idAttributeName = this.idAttributeName;
    final timestampAttributeName = this.timestampAttributeName;
    final xAttributeName = this.xAttributeName;
    final yAttributeName = this.yAttributeName;
    return {
      'IdAttributeName': idAttributeName,
      'TimestampAttributeName': timestampAttributeName,
      'XAttributeName': xAttributeName,
      'YAttributeName': yAttributeName,
    };
  }
}

/// The structure representing Polygon Geometry based on the <a
/// href="https://www.rfc-editor.org/rfc/rfc7946#section-3.1.6">GeoJson
/// spec</a>.
class MultiPolygonGeometryInput {
  /// The coordinates of the multipolygon geometry.
  final List<List<List<List<double>>>> coordinates;

  MultiPolygonGeometryInput({
    required this.coordinates,
  });

  factory MultiPolygonGeometryInput.fromJson(Map<String, dynamic> json) {
    return MultiPolygonGeometryInput(
      coordinates: (json['Coordinates'] as List)
          .nonNulls
          .map((e) => (e as List)
              .nonNulls
              .map((e) => (e as List)
                  .nonNulls
                  .map((e) =>
                      (e as List).nonNulls.map((e) => e as double).toList())
                  .toList())
              .toList())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final coordinates = this.coordinates;
    return {
      'Coordinates': coordinates,
    };
  }
}

/// Represents an arithmetic operation to compute spectral index.
class Operation {
  /// Textual representation of the math operation; Equation used to compute the
  /// spectral index.
  final String equation;

  /// The name of the operation.
  final String name;

  /// The type of the operation.
  final OutputType? outputType;

  Operation({
    required this.equation,
    required this.name,
    this.outputType,
  });

  factory Operation.fromJson(Map<String, dynamic> json) {
    return Operation(
      equation: json['Equation'] as String,
      name: json['Name'] as String,
      outputType: (json['OutputType'] as String?)?.let(OutputType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final equation = this.equation;
    final name = this.name;
    final outputType = this.outputType;
    return {
      'Equation': equation,
      'Name': name,
      if (outputType != null) 'OutputType': outputType.value,
    };
  }
}

/// A single EarthObservationJob output band.
class OutputBand {
  /// The name of the band.
  final String bandName;

  /// The datatype of the output band.
  final OutputType outputDataType;

  OutputBand({
    required this.bandName,
    required this.outputDataType,
  });

  factory OutputBand.fromJson(Map<String, dynamic> json) {
    return OutputBand(
      bandName: json['BandName'] as String,
      outputDataType: OutputType.fromString((json['OutputDataType'] as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final bandName = this.bandName;
    final outputDataType = this.outputDataType;
    return {
      'BandName': bandName,
      'OutputDataType': outputDataType.value,
    };
  }
}

/// The response structure for an OutputConfig returned by an
/// ExportEarthObservationJob.
class OutputConfigInput {
  /// Path to Amazon S3 storage location for the output configuration file.
  final ExportS3DataInput s3Data;

  OutputConfigInput({
    required this.s3Data,
  });

  factory OutputConfigInput.fromJson(Map<String, dynamic> json) {
    return OutputConfigInput(
      s3Data:
          ExportS3DataInput.fromJson(json['S3Data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final s3Data = this.s3Data;
    return {
      'S3Data': s3Data,
    };
  }
}

/// OutputResolution Configuration indicating the target resolution for the
/// output of Resampling operation.
class OutputResolutionResamplingInput {
  /// User Defined Resolution for the output of Resampling operation defined by
  /// value and unit.
  final UserDefined userDefined;

  OutputResolutionResamplingInput({
    required this.userDefined,
  });

  factory OutputResolutionResamplingInput.fromJson(Map<String, dynamic> json) {
    return OutputResolutionResamplingInput(
      userDefined:
          UserDefined.fromJson(json['UserDefined'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final userDefined = this.userDefined;
    return {
      'UserDefined': userDefined,
    };
  }
}

/// The input structure representing Output Resolution for Stacking Operation.
class OutputResolutionStackInput {
  /// A string value representing Predefined Output Resolution for a stacking
  /// operation. Allowed values are <code>HIGHEST</code>, <code>LOWEST</code>, and
  /// <code>AVERAGE</code>.
  final PredefinedResolution? predefined;

  /// The structure representing User Output Resolution for a Stacking operation
  /// defined as a value and unit.
  final UserDefined? userDefined;

  OutputResolutionStackInput({
    this.predefined,
    this.userDefined,
  });

  factory OutputResolutionStackInput.fromJson(Map<String, dynamic> json) {
    return OutputResolutionStackInput(
      predefined:
          (json['Predefined'] as String?)?.let(PredefinedResolution.fromString),
      userDefined: json['UserDefined'] != null
          ? UserDefined.fromJson(json['UserDefined'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final predefined = this.predefined;
    final userDefined = this.userDefined;
    return {
      if (predefined != null) 'Predefined': predefined.value,
      if (userDefined != null) 'UserDefined': userDefined,
    };
  }
}

enum OutputType {
  int32('INT32'),
  float32('FLOAT32'),
  int16('INT16'),
  float64('FLOAT64'),
  uint16('UINT16'),
  ;

  final String value;

  const OutputType(this.value);

  static OutputType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum OutputType'));
}

/// The input structure for specifying Platform. Platform refers to the unique
/// name of the specific platform the instrument is attached to. For satellites
/// it is the name of the satellite, eg. landsat-8 (Landsat-8), sentinel-2a.
class PlatformInput {
  /// The value of the platform.
  final String value;

  /// The ComparisonOperator to use with PlatformInput.
  final ComparisonOperator? comparisonOperator;

  PlatformInput({
    required this.value,
    this.comparisonOperator,
  });

  factory PlatformInput.fromJson(Map<String, dynamic> json) {
    return PlatformInput(
      value: json['Value'] as String,
      comparisonOperator: (json['ComparisonOperator'] as String?)
          ?.let(ComparisonOperator.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final value = this.value;
    final comparisonOperator = this.comparisonOperator;
    return {
      'Value': value,
      if (comparisonOperator != null)
        'ComparisonOperator': comparisonOperator.value,
    };
  }
}

/// The structure representing Polygon Geometry based on the <a
/// href="https://www.rfc-editor.org/rfc/rfc7946#section-3.1.6">GeoJson
/// spec</a>.
class PolygonGeometryInput {
  /// Coordinates representing a Polygon based on the <a
  /// href="https://www.rfc-editor.org/rfc/rfc7946#section-3.1.6">GeoJson
  /// spec</a>.
  final List<List<List<double>>> coordinates;

  PolygonGeometryInput({
    required this.coordinates,
  });

  factory PolygonGeometryInput.fromJson(Map<String, dynamic> json) {
    return PolygonGeometryInput(
      coordinates: (json['Coordinates'] as List)
          .nonNulls
          .map((e) => (e as List)
              .nonNulls
              .map((e) => (e as List).nonNulls.map((e) => e as double).toList())
              .toList())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final coordinates = this.coordinates;
    return {
      'Coordinates': coordinates,
    };
  }
}

enum PredefinedResolution {
  highest('HIGHEST'),
  lowest('LOWEST'),
  average('AVERAGE'),
  ;

  final String value;

  const PredefinedResolution(this.value);

  static PredefinedResolution fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum PredefinedResolution'));
}

/// Properties associated with the Item.
class Properties {
  /// Estimate of cloud cover.
  final double? eoCloudCover;

  /// Land cloud cover for Landsat Data Collection.
  final double? landsatCloudCoverLand;

  /// Platform property. Platform refers to the unique name of the specific
  /// platform the instrument is attached to. For satellites it is the name of the
  /// satellite, eg. landsat-8 (Landsat-8), sentinel-2a.
  final String? platform;

  /// The angle from the sensor between nadir (straight down) and the scene
  /// center. Measured in degrees (0-90).
  final double? viewOffNadir;

  /// The sun azimuth angle. From the scene center point on the ground, this is
  /// the angle between truth north and the sun. Measured clockwise in degrees
  /// (0-360).
  final double? viewSunAzimuth;

  /// The sun elevation angle. The angle from the tangent of the scene center
  /// point to the sun. Measured from the horizon in degrees (-90-90). Negative
  /// values indicate the sun is below the horizon, e.g. sun elevation of -10°
  /// means the data was captured during <a
  /// href="https://www.timeanddate.com/astronomy/different-types-twilight.html">nautical
  /// twilight</a>.
  final double? viewSunElevation;

  Properties({
    this.eoCloudCover,
    this.landsatCloudCoverLand,
    this.platform,
    this.viewOffNadir,
    this.viewSunAzimuth,
    this.viewSunElevation,
  });

  factory Properties.fromJson(Map<String, dynamic> json) {
    return Properties(
      eoCloudCover: json['EoCloudCover'] as double?,
      landsatCloudCoverLand: json['LandsatCloudCoverLand'] as double?,
      platform: json['Platform'] as String?,
      viewOffNadir: json['ViewOffNadir'] as double?,
      viewSunAzimuth: json['ViewSunAzimuth'] as double?,
      viewSunElevation: json['ViewSunElevation'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final eoCloudCover = this.eoCloudCover;
    final landsatCloudCoverLand = this.landsatCloudCoverLand;
    final platform = this.platform;
    final viewOffNadir = this.viewOffNadir;
    final viewSunAzimuth = this.viewSunAzimuth;
    final viewSunElevation = this.viewSunElevation;
    return {
      if (eoCloudCover != null) 'EoCloudCover': eoCloudCover,
      if (landsatCloudCoverLand != null)
        'LandsatCloudCoverLand': landsatCloudCoverLand,
      if (platform != null) 'Platform': platform,
      if (viewOffNadir != null) 'ViewOffNadir': viewOffNadir,
      if (viewSunAzimuth != null) 'ViewSunAzimuth': viewSunAzimuth,
      if (viewSunElevation != null) 'ViewSunElevation': viewSunElevation,
    };
  }
}

/// Represents a single searchable property to search on.
class Property {
  /// The structure representing EoCloudCover property filter containing a lower
  /// bound and upper bound.
  final EoCloudCoverInput? eoCloudCover;

  /// The structure representing Land Cloud Cover property filter for Landsat
  /// collection containing a lower bound and upper bound.
  final LandsatCloudCoverLandInput? landsatCloudCoverLand;

  /// The structure representing Platform property filter consisting of value and
  /// comparison operator.
  final PlatformInput? platform;

  /// The structure representing ViewOffNadir property filter containing a lower
  /// bound and upper bound.
  final ViewOffNadirInput? viewOffNadir;

  /// The structure representing ViewSunAzimuth property filter containing a lower
  /// bound and upper bound.
  final ViewSunAzimuthInput? viewSunAzimuth;

  /// The structure representing ViewSunElevation property filter containing a
  /// lower bound and upper bound.
  final ViewSunElevationInput? viewSunElevation;

  Property({
    this.eoCloudCover,
    this.landsatCloudCoverLand,
    this.platform,
    this.viewOffNadir,
    this.viewSunAzimuth,
    this.viewSunElevation,
  });

  factory Property.fromJson(Map<String, dynamic> json) {
    return Property(
      eoCloudCover: json['EoCloudCover'] != null
          ? EoCloudCoverInput.fromJson(
              json['EoCloudCover'] as Map<String, dynamic>)
          : null,
      landsatCloudCoverLand: json['LandsatCloudCoverLand'] != null
          ? LandsatCloudCoverLandInput.fromJson(
              json['LandsatCloudCoverLand'] as Map<String, dynamic>)
          : null,
      platform: json['Platform'] != null
          ? PlatformInput.fromJson(json['Platform'] as Map<String, dynamic>)
          : null,
      viewOffNadir: json['ViewOffNadir'] != null
          ? ViewOffNadirInput.fromJson(
              json['ViewOffNadir'] as Map<String, dynamic>)
          : null,
      viewSunAzimuth: json['ViewSunAzimuth'] != null
          ? ViewSunAzimuthInput.fromJson(
              json['ViewSunAzimuth'] as Map<String, dynamic>)
          : null,
      viewSunElevation: json['ViewSunElevation'] != null
          ? ViewSunElevationInput.fromJson(
              json['ViewSunElevation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final eoCloudCover = this.eoCloudCover;
    final landsatCloudCoverLand = this.landsatCloudCoverLand;
    final platform = this.platform;
    final viewOffNadir = this.viewOffNadir;
    final viewSunAzimuth = this.viewSunAzimuth;
    final viewSunElevation = this.viewSunElevation;
    return {
      if (eoCloudCover != null) 'EoCloudCover': eoCloudCover,
      if (landsatCloudCoverLand != null)
        'LandsatCloudCoverLand': landsatCloudCoverLand,
      if (platform != null) 'Platform': platform,
      if (viewOffNadir != null) 'ViewOffNadir': viewOffNadir,
      if (viewSunAzimuth != null) 'ViewSunAzimuth': viewSunAzimuth,
      if (viewSunElevation != null) 'ViewSunElevation': viewSunElevation,
    };
  }
}

/// The structure representing a single PropertyFilter.
class PropertyFilter {
  /// Represents a single property to match with when searching a raster data
  /// collection.
  final Property property;

  PropertyFilter({
    required this.property,
  });

  factory PropertyFilter.fromJson(Map<String, dynamic> json) {
    return PropertyFilter(
      property: Property.fromJson(json['Property'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final property = this.property;
    return {
      'Property': property,
    };
  }
}

/// A list of PropertyFilter objects.
class PropertyFilters {
  /// The Logical Operator used to combine the Property Filters.
  final LogicalOperator? logicalOperator;

  /// A list of Property Filters.
  final List<PropertyFilter>? properties;

  PropertyFilters({
    this.logicalOperator,
    this.properties,
  });

  factory PropertyFilters.fromJson(Map<String, dynamic> json) {
    return PropertyFilters(
      logicalOperator:
          (json['LogicalOperator'] as String?)?.let(LogicalOperator.fromString),
      properties: (json['Properties'] as List?)
          ?.nonNulls
          .map((e) => PropertyFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final logicalOperator = this.logicalOperator;
    final properties = this.properties;
    return {
      if (logicalOperator != null) 'LogicalOperator': logicalOperator.value,
      if (properties != null) 'Properties': properties,
    };
  }
}

/// Response object containing details for a specific RasterDataCollection.
class RasterDataCollectionMetadata {
  /// The Amazon Resource Name (ARN) of the raster data collection.
  final String arn;

  /// A description of the raster data collection.
  final String description;

  /// The name of the raster data collection.
  final String name;

  /// The list of filters supported by the raster data collection.
  final List<Filter> supportedFilters;

  /// The type of raster data collection.
  final DataCollectionType type;

  /// The description URL of the raster data collection.
  final String? descriptionPageUrl;

  /// Each tag consists of a key and a value.
  final Map<String, String>? tags;

  RasterDataCollectionMetadata({
    required this.arn,
    required this.description,
    required this.name,
    required this.supportedFilters,
    required this.type,
    this.descriptionPageUrl,
    this.tags,
  });

  factory RasterDataCollectionMetadata.fromJson(Map<String, dynamic> json) {
    return RasterDataCollectionMetadata(
      arn: json['Arn'] as String,
      description: json['Description'] as String,
      name: json['Name'] as String,
      supportedFilters: (json['SupportedFilters'] as List)
          .nonNulls
          .map((e) => Filter.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: DataCollectionType.fromString((json['Type'] as String)),
      descriptionPageUrl: json['DescriptionPageUrl'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final description = this.description;
    final name = this.name;
    final supportedFilters = this.supportedFilters;
    final type = this.type;
    final descriptionPageUrl = this.descriptionPageUrl;
    final tags = this.tags;
    return {
      'Arn': arn,
      'Description': description,
      'Name': name,
      'SupportedFilters': supportedFilters,
      'Type': type.value,
      if (descriptionPageUrl != null) 'DescriptionPageUrl': descriptionPageUrl,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// The input structure for Raster Data Collection Query containing the Area of
/// Interest, TimeRange Filters, and Property Filters.
class RasterDataCollectionQueryInput {
  /// The Amazon Resource Name (ARN) of the raster data collection.
  final String rasterDataCollectionArn;

  /// The TimeRange Filter used in the RasterDataCollection Query.
  final TimeRangeFilterInput timeRangeFilter;

  /// The area of interest being queried for the raster data collection.
  final AreaOfInterest? areaOfInterest;

  /// The list of Property filters used in the Raster Data Collection Query.
  final PropertyFilters? propertyFilters;

  RasterDataCollectionQueryInput({
    required this.rasterDataCollectionArn,
    required this.timeRangeFilter,
    this.areaOfInterest,
    this.propertyFilters,
  });

  Map<String, dynamic> toJson() {
    final rasterDataCollectionArn = this.rasterDataCollectionArn;
    final timeRangeFilter = this.timeRangeFilter;
    final areaOfInterest = this.areaOfInterest;
    final propertyFilters = this.propertyFilters;
    return {
      'RasterDataCollectionArn': rasterDataCollectionArn,
      'TimeRangeFilter': timeRangeFilter,
      if (areaOfInterest != null) 'AreaOfInterest': areaOfInterest,
      if (propertyFilters != null) 'PropertyFilters': propertyFilters,
    };
  }
}

/// The output structure contains the Raster Data Collection Query input along
/// with some additional metadata.
class RasterDataCollectionQueryOutput {
  /// The ARN of the Raster Data Collection against which the search is done.
  final String rasterDataCollectionArn;

  /// The name of the raster data collection.
  final String rasterDataCollectionName;

  /// The TimeRange filter used in the search.
  final TimeRangeFilterOutput timeRangeFilter;

  /// The Area of Interest used in the search.
  final AreaOfInterest? areaOfInterest;

  /// Property filters used in the search.
  final PropertyFilters? propertyFilters;

  RasterDataCollectionQueryOutput({
    required this.rasterDataCollectionArn,
    required this.rasterDataCollectionName,
    required this.timeRangeFilter,
    this.areaOfInterest,
    this.propertyFilters,
  });

  factory RasterDataCollectionQueryOutput.fromJson(Map<String, dynamic> json) {
    return RasterDataCollectionQueryOutput(
      rasterDataCollectionArn: json['RasterDataCollectionArn'] as String,
      rasterDataCollectionName: json['RasterDataCollectionName'] as String,
      timeRangeFilter: TimeRangeFilterOutput.fromJson(
          json['TimeRangeFilter'] as Map<String, dynamic>),
      areaOfInterest: json['AreaOfInterest'] != null
          ? AreaOfInterest.fromJson(
              json['AreaOfInterest'] as Map<String, dynamic>)
          : null,
      propertyFilters: json['PropertyFilters'] != null
          ? PropertyFilters.fromJson(
              json['PropertyFilters'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final rasterDataCollectionArn = this.rasterDataCollectionArn;
    final rasterDataCollectionName = this.rasterDataCollectionName;
    final timeRangeFilter = this.timeRangeFilter;
    final areaOfInterest = this.areaOfInterest;
    final propertyFilters = this.propertyFilters;
    return {
      'RasterDataCollectionArn': rasterDataCollectionArn,
      'RasterDataCollectionName': rasterDataCollectionName,
      'TimeRangeFilter': timeRangeFilter,
      if (areaOfInterest != null) 'AreaOfInterest': areaOfInterest,
      if (propertyFilters != null) 'PropertyFilters': propertyFilters,
    };
  }
}

/// This is a RasterDataCollectionQueryInput containing AreaOfInterest, Time
/// Range filter and Property filters.
class RasterDataCollectionQueryWithBandFilterInput {
  /// The TimeRange Filter used in the search query.
  final TimeRangeFilterInput timeRangeFilter;

  /// The Area of interest to be used in the search query.
  final AreaOfInterest? areaOfInterest;

  /// The list of Bands to be displayed in the result for each item.
  final List<String>? bandFilter;

  /// The Property Filters used in the search query.
  final PropertyFilters? propertyFilters;

  RasterDataCollectionQueryWithBandFilterInput({
    required this.timeRangeFilter,
    this.areaOfInterest,
    this.bandFilter,
    this.propertyFilters,
  });

  Map<String, dynamic> toJson() {
    final timeRangeFilter = this.timeRangeFilter;
    final areaOfInterest = this.areaOfInterest;
    final bandFilter = this.bandFilter;
    final propertyFilters = this.propertyFilters;
    return {
      'TimeRangeFilter': timeRangeFilter,
      if (areaOfInterest != null) 'AreaOfInterest': areaOfInterest,
      if (bandFilter != null) 'BandFilter': bandFilter,
      if (propertyFilters != null) 'PropertyFilters': propertyFilters,
    };
  }
}

/// The structure representing input for resampling operation.
class ResamplingConfigInput {
  /// The structure representing output resolution (in target georeferenced units)
  /// of the result of resampling operation.
  final OutputResolutionResamplingInput outputResolution;

  /// The name of the algorithm used for resampling.
  final AlgorithmNameResampling? algorithmName;

  /// Bands used in the operation. If no target bands are specified, it uses all
  /// bands available in the input.
  final List<String>? targetBands;

  ResamplingConfigInput({
    required this.outputResolution,
    this.algorithmName,
    this.targetBands,
  });

  factory ResamplingConfigInput.fromJson(Map<String, dynamic> json) {
    return ResamplingConfigInput(
      outputResolution: OutputResolutionResamplingInput.fromJson(
          json['OutputResolution'] as Map<String, dynamic>),
      algorithmName: (json['AlgorithmName'] as String?)
          ?.let(AlgorithmNameResampling.fromString),
      targetBands: (json['TargetBands'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final outputResolution = this.outputResolution;
    final algorithmName = this.algorithmName;
    final targetBands = this.targetBands;
    return {
      'OutputResolution': outputResolution,
      if (algorithmName != null) 'AlgorithmName': algorithmName.value,
      if (targetBands != null) 'TargetBands': targetBands,
    };
  }
}

/// The input structure for Reverse Geocoding operation type.
class ReverseGeocodingConfig {
  /// The field name for the data that describes x-axis coordinate, eg. longitude
  /// of a point.
  final String xAttributeName;

  /// The field name for the data that describes y-axis coordinate, eg. latitude
  /// of a point.
  final String yAttributeName;

  ReverseGeocodingConfig({
    required this.xAttributeName,
    required this.yAttributeName,
  });

  factory ReverseGeocodingConfig.fromJson(Map<String, dynamic> json) {
    return ReverseGeocodingConfig(
      xAttributeName: json['XAttributeName'] as String,
      yAttributeName: json['YAttributeName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final xAttributeName = this.xAttributeName;
    final yAttributeName = this.yAttributeName;
    return {
      'XAttributeName': xAttributeName,
      'YAttributeName': yAttributeName,
    };
  }
}

class SearchRasterDataCollectionOutput {
  /// Approximate number of results in the response.
  final int approximateResultCount;

  /// List of items matching the Raster DataCollectionQuery.
  final List<ItemSource>? items;

  /// If the previous response was truncated, you receive this token. Use it in
  /// your next request to receive the next set of results.
  final String? nextToken;

  SearchRasterDataCollectionOutput({
    required this.approximateResultCount,
    this.items,
    this.nextToken,
  });

  factory SearchRasterDataCollectionOutput.fromJson(Map<String, dynamic> json) {
    return SearchRasterDataCollectionOutput(
      approximateResultCount: json['ApproximateResultCount'] as int,
      items: (json['Items'] as List?)
          ?.nonNulls
          .map((e) => ItemSource.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final approximateResultCount = this.approximateResultCount;
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      'ApproximateResultCount': approximateResultCount,
      if (items != null) 'Items': items,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

enum SortOrder {
  ascending('ASCENDING'),
  descending('DESCENDING'),
  ;

  final String value;

  const SortOrder(this.value);

  static SortOrder fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum SortOrder'));
}

/// The input structure for Stacking Operation.
class StackConfigInput {
  /// The structure representing output resolution (in target georeferenced units)
  /// of the result of stacking operation.
  final OutputResolutionStackInput? outputResolution;

  /// A list of bands to be stacked in the specified order. When the parameter is
  /// not provided, all the available bands in the data collection are stacked in
  /// the alphabetical order of their asset names.
  final List<String>? targetBands;

  StackConfigInput({
    this.outputResolution,
    this.targetBands,
  });

  factory StackConfigInput.fromJson(Map<String, dynamic> json) {
    return StackConfigInput(
      outputResolution: json['OutputResolution'] != null
          ? OutputResolutionStackInput.fromJson(
              json['OutputResolution'] as Map<String, dynamic>)
          : null,
      targetBands: (json['TargetBands'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final outputResolution = this.outputResolution;
    final targetBands = this.targetBands;
    return {
      if (outputResolution != null) 'OutputResolution': outputResolution,
      if (targetBands != null) 'TargetBands': targetBands,
    };
  }
}

class StartEarthObservationJobOutput {
  /// The Amazon Resource Name (ARN) of the Earth Observation job.
  final String arn;

  /// The creation time.
  final DateTime creationTime;

  /// The duration of the session, in seconds.
  final int durationInSeconds;

  /// The Amazon Resource Name (ARN) of the IAM role that you specified for the
  /// job.
  final String executionRoleArn;

  /// An object containing information about the job configuration.
  final JobConfigInput jobConfig;

  /// The name of the Earth Observation job.
  final String name;

  /// The status of the Earth Observation job.
  final EarthObservationJobStatus status;

  /// Input configuration information for the Earth Observation job.
  final InputConfigOutput? inputConfig;

  /// The Key Management Service key ID for server-side encryption.
  final String? kmsKeyId;

  /// Each tag consists of a key and a value.
  final Map<String, String>? tags;

  StartEarthObservationJobOutput({
    required this.arn,
    required this.creationTime,
    required this.durationInSeconds,
    required this.executionRoleArn,
    required this.jobConfig,
    required this.name,
    required this.status,
    this.inputConfig,
    this.kmsKeyId,
    this.tags,
  });

  factory StartEarthObservationJobOutput.fromJson(Map<String, dynamic> json) {
    return StartEarthObservationJobOutput(
      arn: json['Arn'] as String,
      creationTime:
          nonNullableTimeStampFromJson(json['CreationTime'] as Object),
      durationInSeconds: json['DurationInSeconds'] as int,
      executionRoleArn: json['ExecutionRoleArn'] as String,
      jobConfig:
          JobConfigInput.fromJson(json['JobConfig'] as Map<String, dynamic>),
      name: json['Name'] as String,
      status: EarthObservationJobStatus.fromString((json['Status'] as String)),
      inputConfig: json['InputConfig'] != null
          ? InputConfigOutput.fromJson(
              json['InputConfig'] as Map<String, dynamic>)
          : null,
      kmsKeyId: json['KmsKeyId'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final durationInSeconds = this.durationInSeconds;
    final executionRoleArn = this.executionRoleArn;
    final jobConfig = this.jobConfig;
    final name = this.name;
    final status = this.status;
    final inputConfig = this.inputConfig;
    final kmsKeyId = this.kmsKeyId;
    final tags = this.tags;
    return {
      'Arn': arn,
      'CreationTime': iso8601ToJson(creationTime),
      'DurationInSeconds': durationInSeconds,
      'ExecutionRoleArn': executionRoleArn,
      'JobConfig': jobConfig,
      'Name': name,
      'Status': status.value,
      if (inputConfig != null) 'InputConfig': inputConfig,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (tags != null) 'Tags': tags,
    };
  }
}

class StartVectorEnrichmentJobOutput {
  /// The Amazon Resource Name (ARN) of the Vector Enrichment job.
  final String arn;

  /// The creation time.
  final DateTime creationTime;

  /// The duration of the Vector Enrichment job, in seconds.
  final int durationInSeconds;

  /// The Amazon Resource Name (ARN) of the IAM role that you specified for the
  /// job.
  final String executionRoleArn;

  /// Input configuration information for starting the Vector Enrichment job.
  final VectorEnrichmentJobInputConfig inputConfig;

  /// An object containing information about the job configuration.
  final VectorEnrichmentJobConfig jobConfig;

  /// The name of the Vector Enrichment job.
  final String name;

  /// The status of the Vector Enrichment job being started.
  final VectorEnrichmentJobStatus status;

  /// The type of the Vector Enrichment job.
  final VectorEnrichmentJobType type;

  /// The Key Management Service key ID for server-side encryption.
  final String? kmsKeyId;

  /// Each tag consists of a key and a value.
  final Map<String, String>? tags;

  StartVectorEnrichmentJobOutput({
    required this.arn,
    required this.creationTime,
    required this.durationInSeconds,
    required this.executionRoleArn,
    required this.inputConfig,
    required this.jobConfig,
    required this.name,
    required this.status,
    required this.type,
    this.kmsKeyId,
    this.tags,
  });

  factory StartVectorEnrichmentJobOutput.fromJson(Map<String, dynamic> json) {
    return StartVectorEnrichmentJobOutput(
      arn: json['Arn'] as String,
      creationTime:
          nonNullableTimeStampFromJson(json['CreationTime'] as Object),
      durationInSeconds: json['DurationInSeconds'] as int,
      executionRoleArn: json['ExecutionRoleArn'] as String,
      inputConfig: VectorEnrichmentJobInputConfig.fromJson(
          json['InputConfig'] as Map<String, dynamic>),
      jobConfig: VectorEnrichmentJobConfig.fromJson(
          json['JobConfig'] as Map<String, dynamic>),
      name: json['Name'] as String,
      status: VectorEnrichmentJobStatus.fromString((json['Status'] as String)),
      type: VectorEnrichmentJobType.fromString((json['Type'] as String)),
      kmsKeyId: json['KmsKeyId'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final durationInSeconds = this.durationInSeconds;
    final executionRoleArn = this.executionRoleArn;
    final inputConfig = this.inputConfig;
    final jobConfig = this.jobConfig;
    final name = this.name;
    final status = this.status;
    final type = this.type;
    final kmsKeyId = this.kmsKeyId;
    final tags = this.tags;
    return {
      'Arn': arn,
      'CreationTime': iso8601ToJson(creationTime),
      'DurationInSeconds': durationInSeconds,
      'ExecutionRoleArn': executionRoleArn,
      'InputConfig': inputConfig,
      'JobConfig': jobConfig,
      'Name': name,
      'Status': status.value,
      'Type': type.value,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (tags != null) 'Tags': tags,
    };
  }
}

class StopEarthObservationJobOutput {
  StopEarthObservationJobOutput();

  factory StopEarthObservationJobOutput.fromJson(Map<String, dynamic> _) {
    return StopEarthObservationJobOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class StopVectorEnrichmentJobOutput {
  StopVectorEnrichmentJobOutput();

  factory StopVectorEnrichmentJobOutput.fromJson(Map<String, dynamic> _) {
    return StopVectorEnrichmentJobOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
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

enum TargetOptions {
  input('INPUT'),
  output('OUTPUT'),
  ;

  final String value;

  const TargetOptions(this.value);

  static TargetOptions fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum TargetOptions'));
}

enum TemporalStatistics {
  mean('MEAN'),
  median('MEDIAN'),
  standardDeviation('STANDARD_DEVIATION'),
  ;

  final String value;

  const TemporalStatistics(this.value);

  static TemporalStatistics fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum TemporalStatistics'));
}

/// The structure representing the configuration for Temporal Statistics
/// operation.
class TemporalStatisticsConfigInput {
  /// The list of the statistics method options.
  final List<TemporalStatistics> statistics;

  /// The input for the temporal statistics grouping by time frequency option.
  final GroupBy? groupBy;

  /// The list of target band names for the temporal statistic to calculate.
  final List<String>? targetBands;

  TemporalStatisticsConfigInput({
    required this.statistics,
    this.groupBy,
    this.targetBands,
  });

  factory TemporalStatisticsConfigInput.fromJson(Map<String, dynamic> json) {
    return TemporalStatisticsConfigInput(
      statistics: (json['Statistics'] as List)
          .nonNulls
          .map((e) => TemporalStatistics.fromString((e as String)))
          .toList(),
      groupBy: (json['GroupBy'] as String?)?.let(GroupBy.fromString),
      targetBands: (json['TargetBands'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final statistics = this.statistics;
    final groupBy = this.groupBy;
    final targetBands = this.targetBands;
    return {
      'Statistics': statistics.map((e) => e.value).toList(),
      if (groupBy != null) 'GroupBy': groupBy.value,
      if (targetBands != null) 'TargetBands': targetBands,
    };
  }
}

/// The input for the time-range filter.
class TimeRangeFilterInput {
  /// The end time for the time-range filter.
  final DateTime endTime;

  /// The start time for the time-range filter.
  final DateTime startTime;

  TimeRangeFilterInput({
    required this.endTime,
    required this.startTime,
  });

  Map<String, dynamic> toJson() {
    final endTime = this.endTime;
    final startTime = this.startTime;
    return {
      'EndTime': unixTimestampToJson(endTime),
      'StartTime': unixTimestampToJson(startTime),
    };
  }
}

/// The output structure of the time range filter.
class TimeRangeFilterOutput {
  /// The ending time for the time range filter.
  final DateTime endTime;

  /// The starting time for the time range filter.
  final DateTime startTime;

  TimeRangeFilterOutput({
    required this.endTime,
    required this.startTime,
  });

  factory TimeRangeFilterOutput.fromJson(Map<String, dynamic> json) {
    return TimeRangeFilterOutput(
      endTime: nonNullableTimeStampFromJson(json['EndTime'] as Object),
      startTime: nonNullableTimeStampFromJson(json['StartTime'] as Object),
    );
  }

  Map<String, dynamic> toJson() {
    final endTime = this.endTime;
    final startTime = this.startTime;
    return {
      'EndTime': iso8601ToJson(endTime),
      'StartTime': iso8601ToJson(startTime),
    };
  }
}

enum Unit {
  meters('METERS'),
  ;

  final String value;

  const Unit(this.value);

  static Unit fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception('$value is not known in enum Unit'));
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

/// The output resolution (in target georeferenced units) of the result of the
/// operation
class UserDefined {
  /// The units for output resolution of the result.
  final Unit unit;

  /// The value for output resolution of the result.
  final double value;

  UserDefined({
    required this.unit,
    required this.value,
  });

  factory UserDefined.fromJson(Map<String, dynamic> json) {
    return UserDefined(
      unit: Unit.fromString((json['Unit'] as String)),
      value: json['Value'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    final unit = this.unit;
    final value = this.value;
    return {
      'Unit': unit.value,
      'Value': value,
    };
  }
}

/// It contains configs such as ReverseGeocodingConfig and MapMatchingConfig.
class VectorEnrichmentJobConfig {
  /// The input structure for Map Matching operation type.
  final MapMatchingConfig? mapMatchingConfig;

  /// The input structure for Reverse Geocoding operation type.
  final ReverseGeocodingConfig? reverseGeocodingConfig;

  VectorEnrichmentJobConfig({
    this.mapMatchingConfig,
    this.reverseGeocodingConfig,
  });

  factory VectorEnrichmentJobConfig.fromJson(Map<String, dynamic> json) {
    return VectorEnrichmentJobConfig(
      mapMatchingConfig: json['MapMatchingConfig'] != null
          ? MapMatchingConfig.fromJson(
              json['MapMatchingConfig'] as Map<String, dynamic>)
          : null,
      reverseGeocodingConfig: json['ReverseGeocodingConfig'] != null
          ? ReverseGeocodingConfig.fromJson(
              json['ReverseGeocodingConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final mapMatchingConfig = this.mapMatchingConfig;
    final reverseGeocodingConfig = this.reverseGeocodingConfig;
    return {
      if (mapMatchingConfig != null) 'MapMatchingConfig': mapMatchingConfig,
      if (reverseGeocodingConfig != null)
        'ReverseGeocodingConfig': reverseGeocodingConfig,
    };
  }
}

/// The input structure for the data source that represents the storage type of
/// the input data objects.
class VectorEnrichmentJobDataSourceConfigInput {
  /// The input structure for the Amazon S3 data that represents the Amazon S3
  /// location of the input data objects.
  final VectorEnrichmentJobS3Data? s3Data;

  VectorEnrichmentJobDataSourceConfigInput({
    this.s3Data,
  });

  factory VectorEnrichmentJobDataSourceConfigInput.fromJson(
      Map<String, dynamic> json) {
    return VectorEnrichmentJobDataSourceConfigInput(
      s3Data: json['S3Data'] != null
          ? VectorEnrichmentJobS3Data.fromJson(
              json['S3Data'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Data = this.s3Data;
    return {
      if (s3Data != null) 'S3Data': s3Data,
    };
  }
}

enum VectorEnrichmentJobDocumentType {
  csv('CSV'),
  ;

  final String value;

  const VectorEnrichmentJobDocumentType(this.value);

  static VectorEnrichmentJobDocumentType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum VectorEnrichmentJobDocumentType'));
}

/// VectorEnrichmentJob error details in response from GetVectorEnrichmentJob.
class VectorEnrichmentJobErrorDetails {
  /// A message that you define and then is processed and rendered by the Vector
  /// Enrichment job when the error occurs.
  final String? errorMessage;

  /// The type of error generated during the Vector Enrichment job.
  final VectorEnrichmentJobErrorType? errorType;

  VectorEnrichmentJobErrorDetails({
    this.errorMessage,
    this.errorType,
  });

  factory VectorEnrichmentJobErrorDetails.fromJson(Map<String, dynamic> json) {
    return VectorEnrichmentJobErrorDetails(
      errorMessage: json['ErrorMessage'] as String?,
      errorType: (json['ErrorType'] as String?)
          ?.let(VectorEnrichmentJobErrorType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final errorMessage = this.errorMessage;
    final errorType = this.errorType;
    return {
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (errorType != null) 'ErrorType': errorType.value,
    };
  }
}

enum VectorEnrichmentJobErrorType {
  clientError('CLIENT_ERROR'),
  serverError('SERVER_ERROR'),
  ;

  final String value;

  const VectorEnrichmentJobErrorType(this.value);

  static VectorEnrichmentJobErrorType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum VectorEnrichmentJobErrorType'));
}

/// VectorEnrichmentJob export error details in response from
/// GetVectorEnrichmentJob.
class VectorEnrichmentJobExportErrorDetails {
  /// The message providing details about the errors generated during the Vector
  /// Enrichment job.
  final String? message;

  /// The output error details for an Export operation on a Vector Enrichment job.
  final VectorEnrichmentJobExportErrorType? type;

  VectorEnrichmentJobExportErrorDetails({
    this.message,
    this.type,
  });

  factory VectorEnrichmentJobExportErrorDetails.fromJson(
      Map<String, dynamic> json) {
    return VectorEnrichmentJobExportErrorDetails(
      message: json['Message'] as String?,
      type: (json['Type'] as String?)
          ?.let(VectorEnrichmentJobExportErrorType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    final type = this.type;
    return {
      if (message != null) 'Message': message,
      if (type != null) 'Type': type.value,
    };
  }
}

enum VectorEnrichmentJobExportErrorType {
  clientError('CLIENT_ERROR'),
  serverError('SERVER_ERROR'),
  ;

  final String value;

  const VectorEnrichmentJobExportErrorType(this.value);

  static VectorEnrichmentJobExportErrorType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum VectorEnrichmentJobExportErrorType'));
}

enum VectorEnrichmentJobExportStatus {
  inProgress('IN_PROGRESS'),
  succeeded('SUCCEEDED'),
  failed('FAILED'),
  ;

  final String value;

  const VectorEnrichmentJobExportStatus(this.value);

  static VectorEnrichmentJobExportStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum VectorEnrichmentJobExportStatus'));
}

/// The input structure for the InputConfig in a VectorEnrichmentJob.
class VectorEnrichmentJobInputConfig {
  /// The input structure for the data source that represents the storage type of
  /// the input data objects.
  final VectorEnrichmentJobDataSourceConfigInput dataSourceConfig;

  /// The input structure that defines the data source file type.
  final VectorEnrichmentJobDocumentType documentType;

  VectorEnrichmentJobInputConfig({
    required this.dataSourceConfig,
    required this.documentType,
  });

  factory VectorEnrichmentJobInputConfig.fromJson(Map<String, dynamic> json) {
    return VectorEnrichmentJobInputConfig(
      dataSourceConfig: VectorEnrichmentJobDataSourceConfigInput.fromJson(
          json['DataSourceConfig'] as Map<String, dynamic>),
      documentType: VectorEnrichmentJobDocumentType.fromString(
          (json['DocumentType'] as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final dataSourceConfig = this.dataSourceConfig;
    final documentType = this.documentType;
    return {
      'DataSourceConfig': dataSourceConfig,
      'DocumentType': documentType.value,
    };
  }
}

/// The Amazon S3 data for the Vector Enrichment job.
class VectorEnrichmentJobS3Data {
  /// The URL to the Amazon S3 data for the Vector Enrichment job.
  final String s3Uri;

  /// The Key Management Service key ID for server-side encryption.
  final String? kmsKeyId;

  VectorEnrichmentJobS3Data({
    required this.s3Uri,
    this.kmsKeyId,
  });

  factory VectorEnrichmentJobS3Data.fromJson(Map<String, dynamic> json) {
    return VectorEnrichmentJobS3Data(
      s3Uri: json['S3Uri'] as String,
      kmsKeyId: json['KmsKeyId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Uri = this.s3Uri;
    final kmsKeyId = this.kmsKeyId;
    return {
      'S3Uri': s3Uri,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
    };
  }
}

enum VectorEnrichmentJobStatus {
  initializing('INITIALIZING'),
  inProgress('IN_PROGRESS'),
  stopping('STOPPING'),
  stopped('STOPPED'),
  completed('COMPLETED'),
  failed('FAILED'),
  deleting('DELETING'),
  deleted('DELETED'),
  ;

  final String value;

  const VectorEnrichmentJobStatus(this.value);

  static VectorEnrichmentJobStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum VectorEnrichmentJobStatus'));
}

enum VectorEnrichmentJobType {
  reverseGeocoding('REVERSE_GEOCODING'),
  mapMatching('MAP_MATCHING'),
  ;

  final String value;

  const VectorEnrichmentJobType(this.value);

  static VectorEnrichmentJobType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum VectorEnrichmentJobType'));
}

/// The input structure for specifying ViewOffNadir property filter.
/// ViewOffNadir refers to the angle from the sensor between nadir (straight
/// down) and the scene center. Measured in degrees (0-90).
class ViewOffNadirInput {
  /// The minimum value for ViewOffNadir property filter. This filters items
  /// having ViewOffNadir greater than or equal to this value.
  final double lowerBound;

  /// The maximum value for ViewOffNadir property filter. This filters items
  /// having ViewOffNadir lesser than or equal to this value.
  final double upperBound;

  ViewOffNadirInput({
    required this.lowerBound,
    required this.upperBound,
  });

  factory ViewOffNadirInput.fromJson(Map<String, dynamic> json) {
    return ViewOffNadirInput(
      lowerBound: json['LowerBound'] as double,
      upperBound: json['UpperBound'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    final lowerBound = this.lowerBound;
    final upperBound = this.upperBound;
    return {
      'LowerBound': lowerBound,
      'UpperBound': upperBound,
    };
  }
}

/// The input structure for specifying ViewSunAzimuth property filter.
/// ViewSunAzimuth refers to the Sun azimuth angle. From the scene center point
/// on the ground, this is the angle between truth north and the sun. Measured
/// clockwise in degrees (0-360).
class ViewSunAzimuthInput {
  /// The minimum value for ViewSunAzimuth property filter. This filters items
  /// having ViewSunAzimuth greater than or equal to this value.
  final double lowerBound;

  /// The maximum value for ViewSunAzimuth property filter. This filters items
  /// having ViewSunAzimuth lesser than or equal to this value.
  final double upperBound;

  ViewSunAzimuthInput({
    required this.lowerBound,
    required this.upperBound,
  });

  factory ViewSunAzimuthInput.fromJson(Map<String, dynamic> json) {
    return ViewSunAzimuthInput(
      lowerBound: json['LowerBound'] as double,
      upperBound: json['UpperBound'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    final lowerBound = this.lowerBound;
    final upperBound = this.upperBound;
    return {
      'LowerBound': lowerBound,
      'UpperBound': upperBound,
    };
  }
}

/// The input structure for specifying ViewSunElevation angle property filter.
class ViewSunElevationInput {
  /// The lower bound to view the sun elevation.
  final double lowerBound;

  /// The upper bound to view the sun elevation.
  final double upperBound;

  ViewSunElevationInput({
    required this.lowerBound,
    required this.upperBound,
  });

  factory ViewSunElevationInput.fromJson(Map<String, dynamic> json) {
    return ViewSunElevationInput(
      lowerBound: json['LowerBound'] as double,
      upperBound: json['UpperBound'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    final lowerBound = this.lowerBound;
    final upperBound = this.upperBound;
    return {
      'LowerBound': lowerBound,
      'UpperBound': upperBound,
    };
  }
}

enum ZonalStatistics {
  mean('MEAN'),
  median('MEDIAN'),
  standardDeviation('STANDARD_DEVIATION'),
  max('MAX'),
  min('MIN'),
  sum('SUM'),
  ;

  final String value;

  const ZonalStatistics(this.value);

  static ZonalStatistics fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum ZonalStatistics'));
}

/// The structure representing input configuration of ZonalStatistics operation.
class ZonalStatisticsConfigInput {
  /// List of zonal statistics to compute.
  final List<ZonalStatistics> statistics;

  /// The Amazon S3 path pointing to the GeoJSON containing the polygonal zones.
  final String zoneS3Path;

  /// Bands used in the operation. If no target bands are specified, it uses all
  /// bands available input.
  final List<String>? targetBands;

  /// The Amazon Resource Name (ARN) or an ID of a Amazon Web Services Key
  /// Management Service (Amazon Web Services KMS) key that Amazon SageMaker uses
  /// to decrypt your output artifacts with Amazon S3 server-side encryption. The
  /// SageMaker execution role must have <code>kms:GenerateDataKey</code>
  /// permission.
  ///
  /// The <code>KmsKeyId</code> can be any of the following formats:
  ///
  /// <ul>
  /// <li>
  /// // KMS Key ID
  ///
  /// <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// <li>
  /// // Amazon Resource Name (ARN) of a KMS Key
  ///
  /// <code>"arn:aws:kms:&lt;region&gt;:&lt;account&gt;:key/&lt;key-id-12ab-34cd-56ef-1234567890ab&gt;"</code>
  /// </li>
  /// </ul>
  /// For more information about key identifiers, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-id">Key
  /// identifiers (KeyID)</a> in the Amazon Web Services Key Management Service
  /// (Amazon Web Services KMS) documentation.
  final String? zoneS3PathKmsKeyId;

  ZonalStatisticsConfigInput({
    required this.statistics,
    required this.zoneS3Path,
    this.targetBands,
    this.zoneS3PathKmsKeyId,
  });

  factory ZonalStatisticsConfigInput.fromJson(Map<String, dynamic> json) {
    return ZonalStatisticsConfigInput(
      statistics: (json['Statistics'] as List)
          .nonNulls
          .map((e) => ZonalStatistics.fromString((e as String)))
          .toList(),
      zoneS3Path: json['ZoneS3Path'] as String,
      targetBands: (json['TargetBands'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      zoneS3PathKmsKeyId: json['ZoneS3PathKmsKeyId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final statistics = this.statistics;
    final zoneS3Path = this.zoneS3Path;
    final targetBands = this.targetBands;
    final zoneS3PathKmsKeyId = this.zoneS3PathKmsKeyId;
    return {
      'Statistics': statistics.map((e) => e.value).toList(),
      'ZoneS3Path': zoneS3Path,
      if (targetBands != null) 'TargetBands': targetBands,
      if (zoneS3PathKmsKeyId != null) 'ZoneS3PathKmsKeyId': zoneS3PathKmsKeyId,
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
