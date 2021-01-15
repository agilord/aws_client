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
        Uint8ListConverter,
        Uint8ListListConverter,
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        timeStampFromJson,
        RfcDateTimeConverter,
        IsoDateTimeConverter,
        UnixDateTimeConverter,
        StringJsonConverter,
        Base64JsonConverter;

export '../../shared/shared.dart' show AwsClientCredentials;

part '2017-07-25.g.dart';

/// AWS Data Exchange is a service that makes it easy for AWS customers to
/// exchange data in the cloud. You can use the AWS Data Exchange APIs to
/// create, update, manage, and access file-based data set in the AWS Cloud.
///
/// As a subscriber, you can view and access the data sets that you have an
/// entitlement to through a subscription. You can use the APIS to download or
/// copy your entitled data sets to Amazon S3 for use across a variety of AWS
/// analytics and machine learning services.
///
/// As a provider, you can create and manage your data sets that you would like
/// to publish to a product. Being able to package and provide your data sets
/// into products requires a few steps to determine eligibility. For more
/// information, visit the AWS Data Exchange User Guide.
///
/// A data set is a collection of data that can be changed or updated over time.
/// Data sets can be updated using revisions, which represent a new version or
/// incremental change to a data set.  A revision contains one or more assets.
/// An asset in AWS Data Exchange is a piece of data that can be stored as an
/// Amazon S3 object. The asset can be a structured data file, an image file, or
/// some other data file. Jobs are asynchronous import or export operations used
/// to create or copy assets.
class DataExchange {
  final _s.RestJsonProtocol _protocol;
  DataExchange({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'dataexchange',
            signingName: 'dataexchange',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// This operation cancels a job. Jobs can be cancelled only when they are in
  /// the WAITING state.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  ///
  /// Parameter [jobId] :
  /// The unique identifier for a job.
  Future<void> cancelJob({
    @_s.required String jobId,
  }) async {
    ArgumentError.checkNotNull(jobId, 'jobId');
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/jobs/${Uri.encodeComponent(jobId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This operation creates a data set.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ServiceLimitExceededException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [assetType] :
  /// The type of file your data is stored in. Currently, the supported asset
  /// type is S3_SNAPSHOT.
  ///
  /// Parameter [description] :
  /// A description for the data set. This value can be up to 16,348 characters
  /// long.
  ///
  /// Parameter [name] :
  /// The name of the data set.
  ///
  /// Parameter [tags] :
  /// A data set tag is an optional label that you can assign to a data set when
  /// you create it. Each tag consists of a key and an optional value, both of
  /// which you define. When you use tagging, you can also use tag-based access
  /// control in IAM policies to control access to these data sets and
  /// revisions.
  Future<CreateDataSetResponse> createDataSet({
    @_s.required AssetType assetType,
    @_s.required String description,
    @_s.required String name,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(assetType, 'assetType');
    ArgumentError.checkNotNull(description, 'description');
    ArgumentError.checkNotNull(name, 'name');
    final $payload = <String, dynamic>{
      'AssetType': assetType?.toValue() ?? '',
      'Description': description,
      'Name': name,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/data-sets',
      exceptionFnMap: _exceptionFns,
    );
    return CreateDataSetResponse.fromJson(response);
  }

  /// This operation creates a job.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [details] :
  /// The details for the CreateJob request.
  ///
  /// Parameter [type] :
  /// The type of job to be created.
  Future<CreateJobResponse> createJob({
    @_s.required RequestDetails details,
    @_s.required Type type,
  }) async {
    ArgumentError.checkNotNull(details, 'details');
    ArgumentError.checkNotNull(type, 'type');
    final $payload = <String, dynamic>{
      'Details': details,
      'Type': type?.toValue() ?? '',
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/jobs',
      exceptionFnMap: _exceptionFns,
    );
    return CreateJobResponse.fromJson(response);
  }

  /// This operation creates a revision for a data set.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [dataSetId] :
  /// The unique identifier for a data set.
  ///
  /// Parameter [comment] :
  /// An optional comment about the revision.
  ///
  /// Parameter [tags] :
  /// A revision tag is an optional label that you can assign to a revision when
  /// you create it. Each tag consists of a key and an optional value, both of
  /// which you define. When you use tagging, you can also use tag-based access
  /// control in IAM policies to control access to these data sets and
  /// revisions.
  Future<CreateRevisionResponse> createRevision({
    @_s.required String dataSetId,
    String comment,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(dataSetId, 'dataSetId');
    _s.validateStringLength(
      'comment',
      comment,
      0,
      16384,
    );
    final $payload = <String, dynamic>{
      if (comment != null) 'Comment': comment,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/data-sets/${Uri.encodeComponent(dataSetId)}/revisions',
      exceptionFnMap: _exceptionFns,
    );
    return CreateRevisionResponse.fromJson(response);
  }

  /// This operation deletes an asset.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  ///
  /// Parameter [assetId] :
  /// The unique identifier for an asset.
  ///
  /// Parameter [dataSetId] :
  /// The unique identifier for a data set.
  ///
  /// Parameter [revisionId] :
  /// The unique identifier for a revision.
  Future<void> deleteAsset({
    @_s.required String assetId,
    @_s.required String dataSetId,
    @_s.required String revisionId,
  }) async {
    ArgumentError.checkNotNull(assetId, 'assetId');
    ArgumentError.checkNotNull(dataSetId, 'dataSetId');
    ArgumentError.checkNotNull(revisionId, 'revisionId');
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v1/data-sets/${Uri.encodeComponent(dataSetId)}/revisions/${Uri.encodeComponent(revisionId)}/assets/${Uri.encodeComponent(assetId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This operation deletes a data set.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  ///
  /// Parameter [dataSetId] :
  /// The unique identifier for a data set.
  Future<void> deleteDataSet({
    @_s.required String dataSetId,
  }) async {
    ArgumentError.checkNotNull(dataSetId, 'dataSetId');
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/data-sets/${Uri.encodeComponent(dataSetId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This operation deletes a revision.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  ///
  /// Parameter [dataSetId] :
  /// The unique identifier for a data set.
  ///
  /// Parameter [revisionId] :
  /// The unique identifier for a revision.
  Future<void> deleteRevision({
    @_s.required String dataSetId,
    @_s.required String revisionId,
  }) async {
    ArgumentError.checkNotNull(dataSetId, 'dataSetId');
    ArgumentError.checkNotNull(revisionId, 'revisionId');
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v1/data-sets/${Uri.encodeComponent(dataSetId)}/revisions/${Uri.encodeComponent(revisionId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This operation returns information about an asset.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [assetId] :
  /// The unique identifier for an asset.
  ///
  /// Parameter [dataSetId] :
  /// The unique identifier for a data set.
  ///
  /// Parameter [revisionId] :
  /// The unique identifier for a revision.
  Future<GetAssetResponse> getAsset({
    @_s.required String assetId,
    @_s.required String dataSetId,
    @_s.required String revisionId,
  }) async {
    ArgumentError.checkNotNull(assetId, 'assetId');
    ArgumentError.checkNotNull(dataSetId, 'dataSetId');
    ArgumentError.checkNotNull(revisionId, 'revisionId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/data-sets/${Uri.encodeComponent(dataSetId)}/revisions/${Uri.encodeComponent(revisionId)}/assets/${Uri.encodeComponent(assetId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetAssetResponse.fromJson(response);
  }

  /// This operation returns information about a data set.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [dataSetId] :
  /// The unique identifier for a data set.
  Future<GetDataSetResponse> getDataSet({
    @_s.required String dataSetId,
  }) async {
    ArgumentError.checkNotNull(dataSetId, 'dataSetId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/data-sets/${Uri.encodeComponent(dataSetId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetDataSetResponse.fromJson(response);
  }

  /// This operation returns information about a job.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [jobId] :
  /// The unique identifier for a job.
  Future<GetJobResponse> getJob({
    @_s.required String jobId,
  }) async {
    ArgumentError.checkNotNull(jobId, 'jobId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/jobs/${Uri.encodeComponent(jobId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetJobResponse.fromJson(response);
  }

  /// This operation returns information about a revision.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [dataSetId] :
  /// The unique identifier for a data set.
  ///
  /// Parameter [revisionId] :
  /// The unique identifier for a revision.
  Future<GetRevisionResponse> getRevision({
    @_s.required String dataSetId,
    @_s.required String revisionId,
  }) async {
    ArgumentError.checkNotNull(dataSetId, 'dataSetId');
    ArgumentError.checkNotNull(revisionId, 'revisionId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/data-sets/${Uri.encodeComponent(dataSetId)}/revisions/${Uri.encodeComponent(revisionId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetRevisionResponse.fromJson(response);
  }

  /// This operation lists a data set's revisions sorted by CreatedAt in
  /// descending order.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [dataSetId] :
  /// The unique identifier for a data set.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results returned by a single call.
  ///
  /// Parameter [nextToken] :
  /// The token value retrieved from a previous call to access the next page of
  /// results.
  Future<ListDataSetRevisionsResponse> listDataSetRevisions({
    @_s.required String dataSetId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(dataSetId, 'dataSetId');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/data-sets/${Uri.encodeComponent(dataSetId)}/revisions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDataSetRevisionsResponse.fromJson(response);
  }

  /// This operation lists your data sets. When listing by origin OWNED, results
  /// are sorted by CreatedAt in descending order. When listing by origin
  /// ENTITLED, there is no order and the maxResults parameter is ignored.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results returned by a single call.
  ///
  /// Parameter [nextToken] :
  /// The token value retrieved from a previous call to access the next page of
  /// results.
  ///
  /// Parameter [origin] :
  /// A property that defines the data set as OWNED by the account (for
  /// providers) or ENTITLED to the account (for subscribers).
  Future<ListDataSetsResponse> listDataSets({
    int maxResults,
    String nextToken,
    String origin,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (origin != null) 'origin': [origin],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/data-sets',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDataSetsResponse.fromJson(response);
  }

  /// This operation lists your jobs sorted by CreatedAt in descending order.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [dataSetId] :
  /// The unique identifier for a data set.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results returned by a single call.
  ///
  /// Parameter [nextToken] :
  /// The token value retrieved from a previous call to access the next page of
  /// results.
  ///
  /// Parameter [revisionId] :
  /// The unique identifier for a revision.
  Future<ListJobsResponse> listJobs({
    String dataSetId,
    int maxResults,
    String nextToken,
    String revisionId,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    final $query = <String, List<String>>{
      if (dataSetId != null) 'dataSetId': [dataSetId],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (revisionId != null) 'revisionId': [revisionId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/jobs',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListJobsResponse.fromJson(response);
  }

  /// This operation lists a revision's assets sorted alphabetically in
  /// descending order.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [dataSetId] :
  /// The unique identifier for a data set.
  ///
  /// Parameter [revisionId] :
  /// The unique identifier for a revision.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results returned by a single call.
  ///
  /// Parameter [nextToken] :
  /// The token value retrieved from a previous call to access the next page of
  /// results.
  Future<ListRevisionAssetsResponse> listRevisionAssets({
    @_s.required String dataSetId,
    @_s.required String revisionId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(dataSetId, 'dataSetId');
    ArgumentError.checkNotNull(revisionId, 'revisionId');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/data-sets/${Uri.encodeComponent(dataSetId)}/revisions/${Uri.encodeComponent(revisionId)}/assets',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListRevisionAssetsResponse.fromJson(response);
  }

  /// This operation lists the tags on the resource.
  ///
  /// Parameter [resourceArn] :
  /// An Amazon Resource Name (ARN) that uniquely identifies an AWS resource.
  Future<ListTagsForResourceResponse> listTagsForResource({
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// This operation starts a job.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  ///
  /// Parameter [jobId] :
  /// The unique identifier for a job.
  Future<void> startJob({
    @_s.required String jobId,
  }) async {
    ArgumentError.checkNotNull(jobId, 'jobId');
    final response = await _protocol.send(
      payload: null,
      method: 'PATCH',
      requestUri: '/v1/jobs/${Uri.encodeComponent(jobId)}',
      exceptionFnMap: _exceptionFns,
    );
    return StartJobResponse.fromJson(response);
  }

  /// This operation tags a resource.
  ///
  /// Parameter [resourceArn] :
  /// An Amazon Resource Name (ARN) that uniquely identifies an AWS resource.
  ///
  /// Parameter [tags] :
  /// A label that consists of a customer-defined key and an optional value.
  Future<void> tagResource({
    @_s.required String resourceArn,
    @_s.required Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tags, 'tags');
    final $payload = <String, dynamic>{
      'tags': tags,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This operation removes one or more tags from a resource.
  ///
  /// Parameter [resourceArn] :
  /// An Amazon Resource Name (ARN) that uniquely identifies an AWS resource.
  ///
  /// Parameter [tagKeys] :
  /// The key tags.
  Future<void> untagResource({
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final $query = <String, List<String>>{
      if (tagKeys != null) 'tagKeys': tagKeys,
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This operation updates an asset.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  ///
  /// Parameter [assetId] :
  /// The unique identifier for an asset.
  ///
  /// Parameter [dataSetId] :
  /// The unique identifier for a data set.
  ///
  /// Parameter [name] :
  /// The name of the asset. When importing from Amazon S3, the S3 object key is
  /// used as the asset name. When exporting to Amazon S3, the asset name is
  /// used as default target S3 object key.
  ///
  /// Parameter [revisionId] :
  /// The unique identifier for a revision.
  Future<UpdateAssetResponse> updateAsset({
    @_s.required String assetId,
    @_s.required String dataSetId,
    @_s.required String name,
    @_s.required String revisionId,
  }) async {
    ArgumentError.checkNotNull(assetId, 'assetId');
    ArgumentError.checkNotNull(dataSetId, 'dataSetId');
    ArgumentError.checkNotNull(name, 'name');
    ArgumentError.checkNotNull(revisionId, 'revisionId');
    final $payload = <String, dynamic>{
      'Name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/v1/data-sets/${Uri.encodeComponent(dataSetId)}/revisions/${Uri.encodeComponent(revisionId)}/assets/${Uri.encodeComponent(assetId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateAssetResponse.fromJson(response);
  }

  /// This operation updates a data set.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [dataSetId] :
  /// The unique identifier for a data set.
  ///
  /// Parameter [description] :
  /// The description for the data set.
  ///
  /// Parameter [name] :
  /// The name of the data set.
  Future<UpdateDataSetResponse> updateDataSet({
    @_s.required String dataSetId,
    String description,
    String name,
  }) async {
    ArgumentError.checkNotNull(dataSetId, 'dataSetId');
    final $payload = <String, dynamic>{
      if (description != null) 'Description': description,
      if (name != null) 'Name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/v1/data-sets/${Uri.encodeComponent(dataSetId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateDataSetResponse.fromJson(response);
  }

  /// This operation updates a revision.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  ///
  /// Parameter [dataSetId] :
  /// The unique identifier for a data set.
  ///
  /// Parameter [revisionId] :
  /// The unique identifier for a revision.
  ///
  /// Parameter [comment] :
  /// An optional comment about the revision.
  ///
  /// Parameter [finalized] :
  /// Finalizing a revision tells AWS Data Exchange that your changes to the
  /// assets in the revision are complete. After it's in this read-only state,
  /// you can publish the revision to your products.
  Future<UpdateRevisionResponse> updateRevision({
    @_s.required String dataSetId,
    @_s.required String revisionId,
    String comment,
    bool finalized,
  }) async {
    ArgumentError.checkNotNull(dataSetId, 'dataSetId');
    ArgumentError.checkNotNull(revisionId, 'revisionId');
    _s.validateStringLength(
      'comment',
      comment,
      0,
      16384,
    );
    final $payload = <String, dynamic>{
      if (comment != null) 'Comment': comment,
      if (finalized != null) 'Finalized': finalized,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/v1/data-sets/${Uri.encodeComponent(dataSetId)}/revisions/${Uri.encodeComponent(revisionId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateRevisionResponse.fromJson(response);
  }
}

/// The destination for the asset.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AssetDestinationEntry {
  /// The unique identifier for the asset.
  @_s.JsonKey(name: 'AssetId')
  final String assetId;

  /// The S3 bucket that is the destination for the asset.
  @_s.JsonKey(name: 'Bucket')
  final String bucket;

  /// The name of the object in Amazon S3 for the asset.
  @_s.JsonKey(name: 'Key')
  final String key;

  AssetDestinationEntry({
    @_s.required this.assetId,
    @_s.required this.bucket,
    this.key,
  });
  factory AssetDestinationEntry.fromJson(Map<String, dynamic> json) =>
      _$AssetDestinationEntryFromJson(json);

  Map<String, dynamic> toJson() => _$AssetDestinationEntryToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssetDetails {
  @_s.JsonKey(name: 'S3SnapshotAsset')
  final S3SnapshotAsset s3SnapshotAsset;

  AssetDetails({
    this.s3SnapshotAsset,
  });
  factory AssetDetails.fromJson(Map<String, dynamic> json) =>
      _$AssetDetailsFromJson(json);
}

/// An asset in AWS Data Exchange is a piece of data that can be stored as an S3
/// object. The asset can be a structured data file, an image file, or some
/// other data file. When you create an import job for your files, you create an
/// asset in AWS Data Exchange for each of those files.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssetEntry {
  /// The ARN for the asset.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// Information about the asset, including its size.
  @_s.JsonKey(name: 'AssetDetails')
  final AssetDetails assetDetails;

  /// The type of file your data is stored in. Currently, the supported asset type
  /// is S3_SNAPSHOT.
  @_s.JsonKey(name: 'AssetType')
  final AssetType assetType;

  /// The date and time that the asset was created, in ISO 8601 format.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'CreatedAt')
  final DateTime createdAt;

  /// The unique identifier for the data set associated with this asset.
  @_s.JsonKey(name: 'DataSetId')
  final String dataSetId;

  /// The unique identifier for the asset.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The name of the asset. When importing from Amazon S3, the S3 object key is
  /// used as the asset name. When exporting to Amazon S3, the asset name is used
  /// as default target S3 object key.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The unique identifier for the revision associated with this asset.
  @_s.JsonKey(name: 'RevisionId')
  final String revisionId;

  /// The date and time that the asset was last updated, in ISO 8601 format.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'UpdatedAt')
  final DateTime updatedAt;

  /// The asset ID of the owned asset corresponding to the entitled asset being
  /// viewed. This parameter is returned when an asset owner is viewing the
  /// entitled copy of its owned asset.
  @_s.JsonKey(name: 'SourceId')
  final String sourceId;

  AssetEntry({
    @_s.required this.arn,
    @_s.required this.assetDetails,
    @_s.required this.assetType,
    @_s.required this.createdAt,
    @_s.required this.dataSetId,
    @_s.required this.id,
    @_s.required this.name,
    @_s.required this.revisionId,
    @_s.required this.updatedAt,
    this.sourceId,
  });
  factory AssetEntry.fromJson(Map<String, dynamic> json) =>
      _$AssetEntryFromJson(json);
}

/// The source of the assets.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AssetSourceEntry {
  /// The S3 bucket that's part of the source of the asset.
  @_s.JsonKey(name: 'Bucket')
  final String bucket;

  /// The name of the object in Amazon S3 for the asset.
  @_s.JsonKey(name: 'Key')
  final String key;

  AssetSourceEntry({
    @_s.required this.bucket,
    @_s.required this.key,
  });
  factory AssetSourceEntry.fromJson(Map<String, dynamic> json) =>
      _$AssetSourceEntryFromJson(json);

  Map<String, dynamic> toJson() => _$AssetSourceEntryToJson(this);
}

/// The type of file your data is stored in. Currently, the supported asset type
/// is S3_SNAPSHOT.
enum AssetType {
  @_s.JsonValue('S3_SNAPSHOT')
  s3Snapshot,
}

extension on AssetType {
  String toValue() {
    switch (this) {
      case AssetType.s3Snapshot:
        return 'S3_SNAPSHOT';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum Code {
  @_s.JsonValue('ACCESS_DENIED_EXCEPTION')
  accessDeniedException,
  @_s.JsonValue('INTERNAL_SERVER_EXCEPTION')
  internalServerException,
  @_s.JsonValue('MALWARE_DETECTED')
  malwareDetected,
  @_s.JsonValue('RESOURCE_NOT_FOUND_EXCEPTION')
  resourceNotFoundException,
  @_s.JsonValue('SERVICE_QUOTA_EXCEEDED_EXCEPTION')
  serviceQuotaExceededException,
  @_s.JsonValue('VALIDATION_EXCEPTION')
  validationException,
  @_s.JsonValue('MALWARE_SCAN_ENCRYPTED_FILE')
  malwareScanEncryptedFile,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateDataSetResponse {
  /// The ARN for the data set.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The type of file your data is stored in. Currently, the supported asset type
  /// is S3_SNAPSHOT.
  @_s.JsonKey(name: 'AssetType')
  final AssetType assetType;

  /// The date and time that the data set was created, in ISO 8601 format.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'CreatedAt')
  final DateTime createdAt;

  /// The description for the data set.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The unique identifier for the data set.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The name of the data set.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// A property that defines the data set as OWNED by the account (for providers)
  /// or ENTITLED to the account (for subscribers).
  @_s.JsonKey(name: 'Origin')
  final Origin origin;

  /// If the origin of this data set is ENTITLED, includes the details for the
  /// product on AWS Marketplace.
  @_s.JsonKey(name: 'OriginDetails')
  final OriginDetails originDetails;

  /// The data set ID of the owned data set corresponding to the entitled data set
  /// being viewed. This parameter is returned when a data set owner is viewing
  /// the entitled copy of its owned data set.
  @_s.JsonKey(name: 'SourceId')
  final String sourceId;

  /// The tags for the data set.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  /// The date and time that the data set was last updated, in ISO 8601 format.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'UpdatedAt')
  final DateTime updatedAt;

  CreateDataSetResponse({
    this.arn,
    this.assetType,
    this.createdAt,
    this.description,
    this.id,
    this.name,
    this.origin,
    this.originDetails,
    this.sourceId,
    this.tags,
    this.updatedAt,
  });
  factory CreateDataSetResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateDataSetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateJobResponse {
  /// The ARN for the job.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The date and time that the job was created, in ISO 8601 format.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'CreatedAt')
  final DateTime createdAt;

  /// Details about the job.
  @_s.JsonKey(name: 'Details')
  final ResponseDetails details;

  /// The errors associated with jobs.
  @_s.JsonKey(name: 'Errors')
  final List<JobError> errors;

  /// The unique identifier for the job.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The state of the job.
  @_s.JsonKey(name: 'State')
  final State state;

  /// The job type.
  @_s.JsonKey(name: 'Type')
  final Type type;

  /// The date and time that the job was last updated, in ISO 8601 format.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'UpdatedAt')
  final DateTime updatedAt;

  CreateJobResponse({
    this.arn,
    this.createdAt,
    this.details,
    this.errors,
    this.id,
    this.state,
    this.type,
    this.updatedAt,
  });
  factory CreateJobResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateRevisionResponse {
  /// The ARN for the revision
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// An optional comment about the revision.
  @_s.JsonKey(name: 'Comment')
  final String comment;

  /// The date and time that the revision was created, in ISO 8601 format.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'CreatedAt')
  final DateTime createdAt;

  /// The unique identifier for the data set associated with this revision.
  @_s.JsonKey(name: 'DataSetId')
  final String dataSetId;

  /// To publish a revision to a data set in a product, the revision must first be
  /// finalized. Finalizing a revision tells AWS Data Exchange that your changes
  /// to the assets in the revision are complete. After it's in this read-only
  /// state, you can publish the revision to your products.
  ///
  /// Finalized revisions can be published through the AWS Data Exchange console
  /// or the AWS Marketplace Catalog API, using the StartChangeSet AWS Marketplace
  /// Catalog API action. When using the API, revisions are uniquely identified by
  /// their ARN.
  @_s.JsonKey(name: 'Finalized')
  final bool finalized;

  /// The unique identifier for the revision.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The revision ID of the owned revision corresponding to the entitled revision
  /// being viewed. This parameter is returned when a revision owner is viewing
  /// the entitled copy of its owned revision.
  @_s.JsonKey(name: 'SourceId')
  final String sourceId;

  /// The tags for the revision.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  /// The date and time that the revision was last updated, in ISO 8601 format.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'UpdatedAt')
  final DateTime updatedAt;

  CreateRevisionResponse({
    this.arn,
    this.comment,
    this.createdAt,
    this.dataSetId,
    this.finalized,
    this.id,
    this.sourceId,
    this.tags,
    this.updatedAt,
  });
  factory CreateRevisionResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateRevisionResponseFromJson(json);
}

/// A data set is an AWS resource with one or more revisions.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DataSetEntry {
  /// The ARN for the data set.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The type of file your data is stored in. Currently, the supported asset type
  /// is S3_SNAPSHOT.
  @_s.JsonKey(name: 'AssetType')
  final AssetType assetType;

  /// The date and time that the data set was created, in ISO 8601 format.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'CreatedAt')
  final DateTime createdAt;

  /// The description for the data set.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The unique identifier for the data set.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The name of the data set.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// A property that defines the data set as OWNED by the account (for providers)
  /// or ENTITLED to the account (for subscribers).
  @_s.JsonKey(name: 'Origin')
  final Origin origin;

  /// The date and time that the data set was last updated, in ISO 8601 format.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'UpdatedAt')
  final DateTime updatedAt;

  /// If the origin of this data set is ENTITLED, includes the details for the
  /// product on AWS Marketplace.
  @_s.JsonKey(name: 'OriginDetails')
  final OriginDetails originDetails;

  /// The data set ID of the owned data set corresponding to the entitled data set
  /// being viewed. This parameter is returned when a data set owner is viewing
  /// the entitled copy of its owned data set.
  @_s.JsonKey(name: 'SourceId')
  final String sourceId;

  DataSetEntry({
    @_s.required this.arn,
    @_s.required this.assetType,
    @_s.required this.createdAt,
    @_s.required this.description,
    @_s.required this.id,
    @_s.required this.name,
    @_s.required this.origin,
    @_s.required this.updatedAt,
    this.originDetails,
    this.sourceId,
  });
  factory DataSetEntry.fromJson(Map<String, dynamic> json) =>
      _$DataSetEntryFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Details {
  @_s.JsonKey(name: 'ImportAssetFromSignedUrlJobErrorDetails')
  final ImportAssetFromSignedUrlJobErrorDetails
      importAssetFromSignedUrlJobErrorDetails;
  @_s.JsonKey(name: 'ImportAssetsFromS3JobErrorDetails')
  final List<AssetSourceEntry> importAssetsFromS3JobErrorDetails;

  Details({
    this.importAssetFromSignedUrlJobErrorDetails,
    this.importAssetsFromS3JobErrorDetails,
  });
  factory Details.fromJson(Map<String, dynamic> json) =>
      _$DetailsFromJson(json);
}

/// Details of the operation to be performed by the job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ExportAssetToSignedUrlRequestDetails {
  /// The unique identifier for the asset that is exported to a signed URL.
  @_s.JsonKey(name: 'AssetId')
  final String assetId;

  /// The unique identifier for the data set associated with this export job.
  @_s.JsonKey(name: 'DataSetId')
  final String dataSetId;

  /// The unique identifier for the revision associated with this export request.
  @_s.JsonKey(name: 'RevisionId')
  final String revisionId;

  ExportAssetToSignedUrlRequestDetails({
    @_s.required this.assetId,
    @_s.required this.dataSetId,
    @_s.required this.revisionId,
  });
  Map<String, dynamic> toJson() =>
      _$ExportAssetToSignedUrlRequestDetailsToJson(this);
}

/// The details of the export to signed URL response.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ExportAssetToSignedUrlResponseDetails {
  /// The unique identifier for the asset associated with this export job.
  @_s.JsonKey(name: 'AssetId')
  final String assetId;

  /// The unique identifier for the data set associated with this export job.
  @_s.JsonKey(name: 'DataSetId')
  final String dataSetId;

  /// The unique identifier for the revision associated with this export response.
  @_s.JsonKey(name: 'RevisionId')
  final String revisionId;

  /// The signed URL for the export request.
  @_s.JsonKey(name: 'SignedUrl')
  final String signedUrl;

  /// The date and time that the signed URL expires, in ISO 8601 format.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'SignedUrlExpiresAt')
  final DateTime signedUrlExpiresAt;

  ExportAssetToSignedUrlResponseDetails({
    @_s.required this.assetId,
    @_s.required this.dataSetId,
    @_s.required this.revisionId,
    this.signedUrl,
    this.signedUrlExpiresAt,
  });
  factory ExportAssetToSignedUrlResponseDetails.fromJson(
          Map<String, dynamic> json) =>
      _$ExportAssetToSignedUrlResponseDetailsFromJson(json);
}

/// Details of the operation to be performed by the job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ExportAssetsToS3RequestDetails {
  /// The destination for the asset.
  @_s.JsonKey(name: 'AssetDestinations')
  final List<AssetDestinationEntry> assetDestinations;

  /// The unique identifier for the data set associated with this export job.
  @_s.JsonKey(name: 'DataSetId')
  final String dataSetId;

  /// The unique identifier for the revision associated with this export request.
  @_s.JsonKey(name: 'RevisionId')
  final String revisionId;

  /// Encryption configuration for the export job.
  @_s.JsonKey(name: 'Encryption')
  final ExportServerSideEncryption encryption;

  ExportAssetsToS3RequestDetails({
    @_s.required this.assetDestinations,
    @_s.required this.dataSetId,
    @_s.required this.revisionId,
    this.encryption,
  });
  Map<String, dynamic> toJson() => _$ExportAssetsToS3RequestDetailsToJson(this);
}

/// Details about the export to Amazon S3 response.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ExportAssetsToS3ResponseDetails {
  /// The destination in Amazon S3 where the asset is exported.
  @_s.JsonKey(name: 'AssetDestinations')
  final List<AssetDestinationEntry> assetDestinations;

  /// The unique identifier for the data set associated with this export job.
  @_s.JsonKey(name: 'DataSetId')
  final String dataSetId;

  /// The unique identifier for the revision associated with this export response.
  @_s.JsonKey(name: 'RevisionId')
  final String revisionId;

  /// Encryption configuration of the export job.
  @_s.JsonKey(name: 'Encryption')
  final ExportServerSideEncryption encryption;

  ExportAssetsToS3ResponseDetails({
    @_s.required this.assetDestinations,
    @_s.required this.dataSetId,
    @_s.required this.revisionId,
    this.encryption,
  });
  factory ExportAssetsToS3ResponseDetails.fromJson(Map<String, dynamic> json) =>
      _$ExportAssetsToS3ResponseDetailsFromJson(json);
}

/// Encryption configuration of the export job. Includes the encryption type as
/// well as the AWS KMS key. The KMS key is only necessary if you chose the KMS
/// encryption type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ExportServerSideEncryption {
  /// The type of server side encryption used for encrypting the objects in Amazon
  /// S3.
  @_s.JsonKey(name: 'Type')
  final ServerSideEncryptionTypes type;

  /// The Amazon Resource Name (ARN) of the the AWS KMS key you want to use to
  /// encrypt the Amazon S3 objects. This parameter is required if you choose
  /// aws:kms as an encryption type.
  @_s.JsonKey(name: 'KmsKeyArn')
  final String kmsKeyArn;

  ExportServerSideEncryption({
    @_s.required this.type,
    this.kmsKeyArn,
  });
  factory ExportServerSideEncryption.fromJson(Map<String, dynamic> json) =>
      _$ExportServerSideEncryptionFromJson(json);

  Map<String, dynamic> toJson() => _$ExportServerSideEncryptionToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetAssetResponse {
  /// The ARN for the asset.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// Information about the asset, including its size.
  @_s.JsonKey(name: 'AssetDetails')
  final AssetDetails assetDetails;

  /// The type of file your data is stored in. Currently, the supported asset type
  /// is S3_SNAPSHOT.
  @_s.JsonKey(name: 'AssetType')
  final AssetType assetType;

  /// The date and time that the asset was created, in ISO 8601 format.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'CreatedAt')
  final DateTime createdAt;

  /// The unique identifier for the data set associated with this asset.
  @_s.JsonKey(name: 'DataSetId')
  final String dataSetId;

  /// The unique identifier for the asset.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The name of the asset When importing from Amazon S3, the S3 object key is
  /// used as the asset name. When exporting to Amazon S3, the asset name is used
  /// as default target S3 object key.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The unique identifier for the revision associated with this asset.
  @_s.JsonKey(name: 'RevisionId')
  final String revisionId;

  /// The asset ID of the owned asset corresponding to the entitled asset being
  /// viewed. This parameter is returned when an asset owner is viewing the
  /// entitled copy of its owned asset.
  @_s.JsonKey(name: 'SourceId')
  final String sourceId;

  /// The date and time that the asset was last updated, in ISO 8601 format.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'UpdatedAt')
  final DateTime updatedAt;

  GetAssetResponse({
    this.arn,
    this.assetDetails,
    this.assetType,
    this.createdAt,
    this.dataSetId,
    this.id,
    this.name,
    this.revisionId,
    this.sourceId,
    this.updatedAt,
  });
  factory GetAssetResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAssetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDataSetResponse {
  /// The ARN for the data set.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The type of file your data is stored in. Currently, the supported asset type
  /// is S3_SNAPSHOT.
  @_s.JsonKey(name: 'AssetType')
  final AssetType assetType;

  /// The date and time that the data set was created, in ISO 8601 format.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'CreatedAt')
  final DateTime createdAt;

  /// The description for the data set.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The unique identifier for the data set.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The name of the data set.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// A property that defines the data set as OWNED by the account (for providers)
  /// or ENTITLED to the account (for subscribers).
  @_s.JsonKey(name: 'Origin')
  final Origin origin;

  /// If the origin of this data set is ENTITLED, includes the details for the
  /// product on AWS Marketplace.
  @_s.JsonKey(name: 'OriginDetails')
  final OriginDetails originDetails;

  /// The data set ID of the owned data set corresponding to the entitled data set
  /// being viewed. This parameter is returned when a data set owner is viewing
  /// the entitled copy of its owned data set.
  @_s.JsonKey(name: 'SourceId')
  final String sourceId;

  /// The tags for the data set.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  /// The date and time that the data set was last updated, in ISO 8601 format.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'UpdatedAt')
  final DateTime updatedAt;

  GetDataSetResponse({
    this.arn,
    this.assetType,
    this.createdAt,
    this.description,
    this.id,
    this.name,
    this.origin,
    this.originDetails,
    this.sourceId,
    this.tags,
    this.updatedAt,
  });
  factory GetDataSetResponse.fromJson(Map<String, dynamic> json) =>
      _$GetDataSetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetJobResponse {
  /// The ARN for the job.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The date and time that the job was created, in ISO 8601 format.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'CreatedAt')
  final DateTime createdAt;

  /// Details about the job.
  @_s.JsonKey(name: 'Details')
  final ResponseDetails details;

  /// The errors associated with jobs.
  @_s.JsonKey(name: 'Errors')
  final List<JobError> errors;

  /// The unique identifier for the job.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The state of the job.
  @_s.JsonKey(name: 'State')
  final State state;

  /// The job type.
  @_s.JsonKey(name: 'Type')
  final Type type;

  /// The date and time that the job was last updated, in ISO 8601 format.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'UpdatedAt')
  final DateTime updatedAt;

  GetJobResponse({
    this.arn,
    this.createdAt,
    this.details,
    this.errors,
    this.id,
    this.state,
    this.type,
    this.updatedAt,
  });
  factory GetJobResponse.fromJson(Map<String, dynamic> json) =>
      _$GetJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetRevisionResponse {
  /// The ARN for the revision
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// An optional comment about the revision.
  @_s.JsonKey(name: 'Comment')
  final String comment;

  /// The date and time that the revision was created, in ISO 8601 format.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'CreatedAt')
  final DateTime createdAt;

  /// The unique identifier for the data set associated with this revision.
  @_s.JsonKey(name: 'DataSetId')
  final String dataSetId;

  /// To publish a revision to a data set in a product, the revision must first be
  /// finalized. Finalizing a revision tells AWS Data Exchange that your changes
  /// to the assets in the revision are complete. After it's in this read-only
  /// state, you can publish the revision to your products.
  ///
  /// Finalized revisions can be published through the AWS Data Exchange console
  /// or the AWS Marketplace Catalog API, using the StartChangeSet AWS Marketplace
  /// Catalog API action. When using the API, revisions are uniquely identified by
  /// their ARN.
  @_s.JsonKey(name: 'Finalized')
  final bool finalized;

  /// The unique identifier for the revision.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The revision ID of the owned revision corresponding to the entitled revision
  /// being viewed. This parameter is returned when a revision owner is viewing
  /// the entitled copy of its owned revision.
  @_s.JsonKey(name: 'SourceId')
  final String sourceId;

  /// The tags for the revision.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  /// The date and time that the revision was last updated, in ISO 8601 format.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'UpdatedAt')
  final DateTime updatedAt;

  GetRevisionResponse({
    this.arn,
    this.comment,
    this.createdAt,
    this.dataSetId,
    this.finalized,
    this.id,
    this.sourceId,
    this.tags,
    this.updatedAt,
  });
  factory GetRevisionResponse.fromJson(Map<String, dynamic> json) =>
      _$GetRevisionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ImportAssetFromSignedUrlJobErrorDetails {
  @_s.JsonKey(name: 'AssetName')
  final String assetName;

  ImportAssetFromSignedUrlJobErrorDetails({
    @_s.required this.assetName,
  });
  factory ImportAssetFromSignedUrlJobErrorDetails.fromJson(
          Map<String, dynamic> json) =>
      _$ImportAssetFromSignedUrlJobErrorDetailsFromJson(json);
}

/// Details of the operation to be performed by the job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ImportAssetFromSignedUrlRequestDetails {
  /// The name of the asset. When importing from Amazon S3, the S3 object key is
  /// used as the asset name.
  @_s.JsonKey(name: 'AssetName')
  final String assetName;

  /// The unique identifier for the data set associated with this import job.
  @_s.JsonKey(name: 'DataSetId')
  final String dataSetId;

  /// The Base64-encoded Md5 hash for the asset, used to ensure the integrity of
  /// the file at that location.
  @_s.JsonKey(name: 'Md5Hash')
  final String md5Hash;

  /// The unique identifier for the revision associated with this import request.
  @_s.JsonKey(name: 'RevisionId')
  final String revisionId;

  ImportAssetFromSignedUrlRequestDetails({
    @_s.required this.assetName,
    @_s.required this.dataSetId,
    @_s.required this.md5Hash,
    @_s.required this.revisionId,
  });
  Map<String, dynamic> toJson() =>
      _$ImportAssetFromSignedUrlRequestDetailsToJson(this);
}

/// The details in the response for an import request, including the signed URL
/// and other information.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ImportAssetFromSignedUrlResponseDetails {
  /// The name for the asset associated with this import response.
  @_s.JsonKey(name: 'AssetName')
  final String assetName;

  /// The unique identifier for the data set associated with this import job.
  @_s.JsonKey(name: 'DataSetId')
  final String dataSetId;

  /// The unique identifier for the revision associated with this import response.
  @_s.JsonKey(name: 'RevisionId')
  final String revisionId;

  /// The Base64-encoded Md5 hash for the asset, used to ensure the integrity of
  /// the file at that location.
  @_s.JsonKey(name: 'Md5Hash')
  final String md5Hash;

  /// The signed URL.
  @_s.JsonKey(name: 'SignedUrl')
  final String signedUrl;

  /// The time and date at which the signed URL expires, in ISO 8601 format.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'SignedUrlExpiresAt')
  final DateTime signedUrlExpiresAt;

  ImportAssetFromSignedUrlResponseDetails({
    @_s.required this.assetName,
    @_s.required this.dataSetId,
    @_s.required this.revisionId,
    this.md5Hash,
    this.signedUrl,
    this.signedUrlExpiresAt,
  });
  factory ImportAssetFromSignedUrlResponseDetails.fromJson(
          Map<String, dynamic> json) =>
      _$ImportAssetFromSignedUrlResponseDetailsFromJson(json);
}

/// Details of the operation to be performed by the job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ImportAssetsFromS3RequestDetails {
  /// Is a list of S3 bucket and object key pairs.
  @_s.JsonKey(name: 'AssetSources')
  final List<AssetSourceEntry> assetSources;

  /// The unique identifier for the data set associated with this import job.
  @_s.JsonKey(name: 'DataSetId')
  final String dataSetId;

  /// The unique identifier for the revision associated with this import request.
  @_s.JsonKey(name: 'RevisionId')
  final String revisionId;

  ImportAssetsFromS3RequestDetails({
    @_s.required this.assetSources,
    @_s.required this.dataSetId,
    @_s.required this.revisionId,
  });
  Map<String, dynamic> toJson() =>
      _$ImportAssetsFromS3RequestDetailsToJson(this);
}

/// Details from an import from Amazon S3 response.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ImportAssetsFromS3ResponseDetails {
  /// Is a list of Amazon S3 bucket and object key pairs.
  @_s.JsonKey(name: 'AssetSources')
  final List<AssetSourceEntry> assetSources;

  /// The unique identifier for the data set associated with this import job.
  @_s.JsonKey(name: 'DataSetId')
  final String dataSetId;

  /// The unique identifier for the revision associated with this import response.
  @_s.JsonKey(name: 'RevisionId')
  final String revisionId;

  ImportAssetsFromS3ResponseDetails({
    @_s.required this.assetSources,
    @_s.required this.dataSetId,
    @_s.required this.revisionId,
  });
  factory ImportAssetsFromS3ResponseDetails.fromJson(
          Map<String, dynamic> json) =>
      _$ImportAssetsFromS3ResponseDetailsFromJson(json);
}

/// AWS Data Exchange Jobs are asynchronous import or export operations used to
/// create or copy assets. A data set owner can both import and export as they
/// see fit. Someone with an entitlement to a data set can only export. Jobs are
/// deleted 90 days after they are created.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class JobEntry {
  /// The ARN for the job.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The date and time that the job was created, in ISO 8601 format.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'CreatedAt')
  final DateTime createdAt;

  /// Details of the operation to be performed by the job, such as export
  /// destination details or import source details.
  @_s.JsonKey(name: 'Details')
  final ResponseDetails details;

  /// The unique identifier for the job.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The state of the job.
  @_s.JsonKey(name: 'State')
  final State state;

  /// The job type.
  @_s.JsonKey(name: 'Type')
  final Type type;

  /// The date and time that the job was last updated, in ISO 8601 format.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'UpdatedAt')
  final DateTime updatedAt;

  /// Errors for jobs.
  @_s.JsonKey(name: 'Errors')
  final List<JobError> errors;

  JobEntry({
    @_s.required this.arn,
    @_s.required this.createdAt,
    @_s.required this.details,
    @_s.required this.id,
    @_s.required this.state,
    @_s.required this.type,
    @_s.required this.updatedAt,
    this.errors,
  });
  factory JobEntry.fromJson(Map<String, dynamic> json) =>
      _$JobEntryFromJson(json);
}

/// An error that occurred with the job request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class JobError {
  /// The code for the job error.
  @_s.JsonKey(name: 'Code')
  final Code code;

  /// The message related to the job error.
  @_s.JsonKey(name: 'Message')
  final String message;
  @_s.JsonKey(name: 'Details')
  final Details details;

  /// The name of the limit that was reached.
  @_s.JsonKey(name: 'LimitName')
  final JobErrorLimitName limitName;

  /// The value of the exceeded limit.
  @_s.JsonKey(name: 'LimitValue')
  final double limitValue;

  /// The unique identifier for the resource related to the error.
  @_s.JsonKey(name: 'ResourceId')
  final String resourceId;

  /// The type of resource related to the error.
  @_s.JsonKey(name: 'ResourceType')
  final JobErrorResourceTypes resourceType;

  JobError({
    @_s.required this.code,
    @_s.required this.message,
    this.details,
    this.limitName,
    this.limitValue,
    this.resourceId,
    this.resourceType,
  });
  factory JobError.fromJson(Map<String, dynamic> json) =>
      _$JobErrorFromJson(json);
}

/// The name of the limit that was reached.
enum JobErrorLimitName {
  @_s.JsonValue('Assets per revision')
  assetsPerRevision,
  @_s.JsonValue('Asset size in GB')
  assetSizeInGb,
}

/// The types of resource which the job error can apply to.
enum JobErrorResourceTypes {
  @_s.JsonValue('REVISION')
  revision,
  @_s.JsonValue('ASSET')
  asset,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListDataSetRevisionsResponse {
  /// The token value retrieved from a previous call to access the next page of
  /// results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The asset objects listed by the request.
  @_s.JsonKey(name: 'Revisions')
  final List<RevisionEntry> revisions;

  ListDataSetRevisionsResponse({
    this.nextToken,
    this.revisions,
  });
  factory ListDataSetRevisionsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListDataSetRevisionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListDataSetsResponse {
  /// The data set objects listed by the request.
  @_s.JsonKey(name: 'DataSets')
  final List<DataSetEntry> dataSets;

  /// The token value retrieved from a previous call to access the next page of
  /// results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListDataSetsResponse({
    this.dataSets,
    this.nextToken,
  });
  factory ListDataSetsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListDataSetsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListJobsResponse {
  /// The jobs listed by the request.
  @_s.JsonKey(name: 'Jobs')
  final List<JobEntry> jobs;

  /// The token value retrieved from a previous call to access the next page of
  /// results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListJobsResponse({
    this.jobs,
    this.nextToken,
  });
  factory ListJobsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListJobsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListRevisionAssetsResponse {
  /// The asset objects listed by the request.
  @_s.JsonKey(name: 'Assets')
  final List<AssetEntry> assets;

  /// The token value retrieved from a previous call to access the next page of
  /// results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListRevisionAssetsResponse({
    this.assets,
    this.nextToken,
  });
  factory ListRevisionAssetsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListRevisionAssetsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// A label that consists of a customer-defined key and an optional value.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

/// A property that defines the data set as OWNED by the account (for providers)
/// or ENTITLED to the account (for subscribers). When an owned data set is
/// published in a product, AWS Data Exchange creates a copy of the data set.
/// Subscribers can access that copy of the data set as an entitled data set.
enum Origin {
  @_s.JsonValue('OWNED')
  owned,
  @_s.JsonValue('ENTITLED')
  entitled,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class OriginDetails {
  @_s.JsonKey(name: 'ProductId')
  final String productId;

  OriginDetails({
    @_s.required this.productId,
  });
  factory OriginDetails.fromJson(Map<String, dynamic> json) =>
      _$OriginDetailsFromJson(json);
}

/// The details for the request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class RequestDetails {
  /// Details about the export to signed URL request.
  @_s.JsonKey(name: 'ExportAssetToSignedUrl')
  final ExportAssetToSignedUrlRequestDetails exportAssetToSignedUrl;

  /// Details about the export to Amazon S3 request.
  @_s.JsonKey(name: 'ExportAssetsToS3')
  final ExportAssetsToS3RequestDetails exportAssetsToS3;

  /// Details about the import from signed URL request.
  @_s.JsonKey(name: 'ImportAssetFromSignedUrl')
  final ImportAssetFromSignedUrlRequestDetails importAssetFromSignedUrl;

  /// Details about the import from Amazon S3 request.
  @_s.JsonKey(name: 'ImportAssetsFromS3')
  final ImportAssetsFromS3RequestDetails importAssetsFromS3;

  RequestDetails({
    this.exportAssetToSignedUrl,
    this.exportAssetsToS3,
    this.importAssetFromSignedUrl,
    this.importAssetsFromS3,
  });
  Map<String, dynamic> toJson() => _$RequestDetailsToJson(this);
}

/// Details for the response.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResponseDetails {
  /// Details for the export to signed URL response.
  @_s.JsonKey(name: 'ExportAssetToSignedUrl')
  final ExportAssetToSignedUrlResponseDetails exportAssetToSignedUrl;

  /// Details for the export to Amazon S3 response.
  @_s.JsonKey(name: 'ExportAssetsToS3')
  final ExportAssetsToS3ResponseDetails exportAssetsToS3;

  /// Details for the import from signed URL response.
  @_s.JsonKey(name: 'ImportAssetFromSignedUrl')
  final ImportAssetFromSignedUrlResponseDetails importAssetFromSignedUrl;

  /// Details for the import from Amazon S3 response.
  @_s.JsonKey(name: 'ImportAssetsFromS3')
  final ImportAssetsFromS3ResponseDetails importAssetsFromS3;

  ResponseDetails({
    this.exportAssetToSignedUrl,
    this.exportAssetsToS3,
    this.importAssetFromSignedUrl,
    this.importAssetsFromS3,
  });
  factory ResponseDetails.fromJson(Map<String, dynamic> json) =>
      _$ResponseDetailsFromJson(json);
}

/// A revision is a container for one or more assets.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RevisionEntry {
  /// The ARN for the revision.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The date and time that the revision was created, in ISO 8601 format.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'CreatedAt')
  final DateTime createdAt;

  /// The unique identifier for the data set associated with this revision.
  @_s.JsonKey(name: 'DataSetId')
  final String dataSetId;

  /// The unique identifier for the revision.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The date and time that the revision was last updated, in ISO 8601 format.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'UpdatedAt')
  final DateTime updatedAt;

  /// An optional comment about the revision.
  @_s.JsonKey(name: 'Comment')
  final String comment;

  /// To publish a revision to a data set in a product, the revision must first be
  /// finalized. Finalizing a revision tells AWS Data Exchange that your changes
  /// to the assets in the revision are complete. After it's in this read-only
  /// state, you can publish the revision to your products.
  ///
  /// Finalized revisions can be published through the AWS Data Exchange console
  /// or the AWS Marketplace Catalog API, using the StartChangeSet AWS Marketplace
  /// Catalog API action. When using the API, revisions are uniquely identified by
  /// their ARN.
  @_s.JsonKey(name: 'Finalized')
  final bool finalized;

  /// The revision ID of the owned revision corresponding to the entitled revision
  /// being viewed. This parameter is returned when a revision owner is viewing
  /// the entitled copy of its owned revision.
  @_s.JsonKey(name: 'SourceId')
  final String sourceId;

  RevisionEntry({
    @_s.required this.arn,
    @_s.required this.createdAt,
    @_s.required this.dataSetId,
    @_s.required this.id,
    @_s.required this.updatedAt,
    this.comment,
    this.finalized,
    this.sourceId,
  });
  factory RevisionEntry.fromJson(Map<String, dynamic> json) =>
      _$RevisionEntryFromJson(json);
}

/// The S3 object that is the asset.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class S3SnapshotAsset {
  /// The size of the S3 object that is the object.
  @_s.JsonKey(name: 'Size')
  final double size;

  S3SnapshotAsset({
    @_s.required this.size,
  });
  factory S3SnapshotAsset.fromJson(Map<String, dynamic> json) =>
      _$S3SnapshotAssetFromJson(json);
}

/// The types of encryption supported in export jobs to Amazon S3.
enum ServerSideEncryptionTypes {
  @_s.JsonValue('aws:kms')
  awsKms,
  @_s.JsonValue('AES256')
  aes256,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartJobResponse {
  StartJobResponse();
  factory StartJobResponse.fromJson(Map<String, dynamic> json) =>
      _$StartJobResponseFromJson(json);
}

enum State {
  @_s.JsonValue('WAITING')
  waiting,
  @_s.JsonValue('IN_PROGRESS')
  inProgress,
  @_s.JsonValue('ERROR')
  error,
  @_s.JsonValue('COMPLETED')
  completed,
  @_s.JsonValue('CANCELLED')
  cancelled,
  @_s.JsonValue('TIMED_OUT')
  timedOut,
}

enum Type {
  @_s.JsonValue('IMPORT_ASSETS_FROM_S3')
  importAssetsFromS3,
  @_s.JsonValue('IMPORT_ASSET_FROM_SIGNED_URL')
  importAssetFromSignedUrl,
  @_s.JsonValue('EXPORT_ASSETS_TO_S3')
  exportAssetsToS3,
  @_s.JsonValue('EXPORT_ASSET_TO_SIGNED_URL')
  exportAssetToSignedUrl,
}

extension on Type {
  String toValue() {
    switch (this) {
      case Type.importAssetsFromS3:
        return 'IMPORT_ASSETS_FROM_S3';
      case Type.importAssetFromSignedUrl:
        return 'IMPORT_ASSET_FROM_SIGNED_URL';
      case Type.exportAssetsToS3:
        return 'EXPORT_ASSETS_TO_S3';
      case Type.exportAssetToSignedUrl:
        return 'EXPORT_ASSET_TO_SIGNED_URL';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateAssetResponse {
  /// The ARN for the asset.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// Information about the asset, including its size.
  @_s.JsonKey(name: 'AssetDetails')
  final AssetDetails assetDetails;

  /// The type of file your data is stored in. Currently, the supported asset type
  /// is S3_SNAPSHOT.
  @_s.JsonKey(name: 'AssetType')
  final AssetType assetType;

  /// The date and time that the asset was created, in ISO 8601 format.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'CreatedAt')
  final DateTime createdAt;

  /// The unique identifier for the data set associated with this asset.
  @_s.JsonKey(name: 'DataSetId')
  final String dataSetId;

  /// The unique identifier for the asset.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The name of the asset When importing from Amazon S3, the S3 object key is
  /// used as the asset name. When exporting to Amazon S3, the asset name is used
  /// as default target S3 object key.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The unique identifier for the revision associated with this asset.
  @_s.JsonKey(name: 'RevisionId')
  final String revisionId;

  /// The asset ID of the owned asset corresponding to the entitled asset being
  /// viewed. This parameter is returned when an asset owner is viewing the
  /// entitled copy of its owned asset.
  @_s.JsonKey(name: 'SourceId')
  final String sourceId;

  /// The date and time that the asset was last updated, in ISO 8601 format.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'UpdatedAt')
  final DateTime updatedAt;

  UpdateAssetResponse({
    this.arn,
    this.assetDetails,
    this.assetType,
    this.createdAt,
    this.dataSetId,
    this.id,
    this.name,
    this.revisionId,
    this.sourceId,
    this.updatedAt,
  });
  factory UpdateAssetResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateAssetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateDataSetResponse {
  /// The ARN for the data set.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The type of file your data is stored in. Currently, the supported asset type
  /// is S3_SNAPSHOT.
  @_s.JsonKey(name: 'AssetType')
  final AssetType assetType;

  /// The date and time that the data set was created, in ISO 8601 format.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'CreatedAt')
  final DateTime createdAt;

  /// The description for the data set.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The unique identifier for the data set.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The name of the data set.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// A property that defines the data set as OWNED by the account (for providers)
  /// or ENTITLED to the account (for subscribers).
  @_s.JsonKey(name: 'Origin')
  final Origin origin;

  /// If the origin of this data set is ENTITLED, includes the details for the
  /// product on AWS Marketplace.
  @_s.JsonKey(name: 'OriginDetails')
  final OriginDetails originDetails;

  /// The data set ID of the owned data set corresponding to the entitled data set
  /// being viewed. This parameter is returned when a data set owner is viewing
  /// the entitled copy of its owned data set.
  @_s.JsonKey(name: 'SourceId')
  final String sourceId;

  /// The date and time that the data set was last updated, in ISO 8601 format.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'UpdatedAt')
  final DateTime updatedAt;

  UpdateDataSetResponse({
    this.arn,
    this.assetType,
    this.createdAt,
    this.description,
    this.id,
    this.name,
    this.origin,
    this.originDetails,
    this.sourceId,
    this.updatedAt,
  });
  factory UpdateDataSetResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateDataSetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateRevisionResponse {
  /// The ARN for the revision.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// An optional comment about the revision.
  @_s.JsonKey(name: 'Comment')
  final String comment;

  /// The date and time that the revision was created, in ISO 8601 format.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'CreatedAt')
  final DateTime createdAt;

  /// The unique identifier for the data set associated with this revision.
  @_s.JsonKey(name: 'DataSetId')
  final String dataSetId;

  /// To publish a revision to a data set in a product, the revision must first be
  /// finalized. Finalizing a revision tells AWS Data Exchange that changes to the
  /// assets in the revision are complete. After it's in this read-only state, you
  /// can publish the revision to your products.
  ///
  /// Finalized revisions can be published through the AWS Data Exchange console
  /// or the AWS Marketplace Catalog API, using the StartChangeSet AWS Marketplace
  /// Catalog API action. When using the API, revisions are uniquely identified by
  /// their ARN.
  @_s.JsonKey(name: 'Finalized')
  final bool finalized;

  /// The unique identifier for the revision.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The revision ID of the owned revision corresponding to the entitled revision
  /// being viewed. This parameter is returned when a revision owner is viewing
  /// the entitled copy of its owned revision.
  @_s.JsonKey(name: 'SourceId')
  final String sourceId;

  /// The date and time that the revision was last updated, in ISO 8601 format.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'UpdatedAt')
  final DateTime updatedAt;

  UpdateRevisionResponse({
    this.arn,
    this.comment,
    this.createdAt,
    this.dataSetId,
    this.finalized,
    this.id,
    this.sourceId,
    this.updatedAt,
  });
  factory UpdateRevisionResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateRevisionResponseFromJson(json);
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String type, String message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String type, String message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String type, String message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceLimitExceededException extends _s.GenericAwsException {
  ServiceLimitExceededException({String type, String message})
      : super(
            type: type,
            code: 'ServiceLimitExceededException',
            message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String type, String message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String type, String message})
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
  'ServiceLimitExceededException': (type, message) =>
      ServiceLimitExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
