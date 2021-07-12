// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name
// ignore_for_file: camel_case_types

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
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
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
    required String jobId,
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
    required AssetType assetType,
    required String description,
    required String name,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(assetType, 'assetType');
    ArgumentError.checkNotNull(description, 'description');
    ArgumentError.checkNotNull(name, 'name');
    final $payload = <String, dynamic>{
      'AssetType': assetType.toValue(),
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
    required RequestDetails details,
    required Type type,
  }) async {
    ArgumentError.checkNotNull(details, 'details');
    ArgumentError.checkNotNull(type, 'type');
    final $payload = <String, dynamic>{
      'Details': details,
      'Type': type.toValue(),
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
    required String dataSetId,
    String? comment,
    Map<String, String>? tags,
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
    required String assetId,
    required String dataSetId,
    required String revisionId,
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
    required String dataSetId,
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
    required String dataSetId,
    required String revisionId,
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
    required String assetId,
    required String dataSetId,
    required String revisionId,
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
    required String dataSetId,
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
    required String jobId,
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
    required String dataSetId,
    required String revisionId,
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
    required String dataSetId,
    int? maxResults,
    String? nextToken,
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
    int? maxResults,
    String? nextToken,
    String? origin,
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
    String? dataSetId,
    int? maxResults,
    String? nextToken,
    String? revisionId,
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
    required String dataSetId,
    required String revisionId,
    int? maxResults,
    String? nextToken,
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
    required String resourceArn,
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
    required String jobId,
  }) async {
    ArgumentError.checkNotNull(jobId, 'jobId');
    final response = await _protocol.send(
      payload: null,
      method: 'PATCH',
      requestUri: '/v1/jobs/${Uri.encodeComponent(jobId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This operation tags a resource.
  ///
  /// Parameter [resourceArn] :
  /// An Amazon Resource Name (ARN) that uniquely identifies an AWS resource.
  ///
  /// Parameter [tags] :
  /// A label that consists of a customer-defined key and an optional value.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
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
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final $query = <String, List<String>>{
      'tagKeys': tagKeys,
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
    required String assetId,
    required String dataSetId,
    required String name,
    required String revisionId,
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
    required String dataSetId,
    String? description,
    String? name,
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
    required String dataSetId,
    required String revisionId,
    String? comment,
    bool? finalized,
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
class AssetDestinationEntry {
  /// The unique identifier for the asset.
  final String assetId;

  /// The S3 bucket that is the destination for the asset.
  final String bucket;

  /// The name of the object in Amazon S3 for the asset.
  final String? key;

  AssetDestinationEntry({
    required this.assetId,
    required this.bucket,
    this.key,
  });

  factory AssetDestinationEntry.fromJson(Map<String, dynamic> json) {
    return AssetDestinationEntry(
      assetId: json['AssetId'] as String,
      bucket: json['Bucket'] as String,
      key: json['Key'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final assetId = this.assetId;
    final bucket = this.bucket;
    final key = this.key;
    return {
      'AssetId': assetId,
      'Bucket': bucket,
      if (key != null) 'Key': key,
    };
  }
}

class AssetDetails {
  final S3SnapshotAsset? s3SnapshotAsset;

  AssetDetails({
    this.s3SnapshotAsset,
  });

  factory AssetDetails.fromJson(Map<String, dynamic> json) {
    return AssetDetails(
      s3SnapshotAsset: json['S3SnapshotAsset'] != null
          ? S3SnapshotAsset.fromJson(
              json['S3SnapshotAsset'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final s3SnapshotAsset = this.s3SnapshotAsset;
    return {
      if (s3SnapshotAsset != null) 'S3SnapshotAsset': s3SnapshotAsset,
    };
  }
}

/// An asset in AWS Data Exchange is a piece of data that can be stored as an S3
/// object. The asset can be a structured data file, an image file, or some
/// other data file. When you create an import job for your files, you create an
/// asset in AWS Data Exchange for each of those files.
class AssetEntry {
  /// The ARN for the asset.
  final String arn;

  /// Information about the asset, including its size.
  final AssetDetails assetDetails;

  /// The type of file your data is stored in. Currently, the supported asset type
  /// is S3_SNAPSHOT.
  final AssetType assetType;

  /// The date and time that the asset was created, in ISO 8601 format.
  final DateTime createdAt;

  /// The unique identifier for the data set associated with this asset.
  final String dataSetId;

  /// The unique identifier for the asset.
  final String id;

  /// The name of the asset. When importing from Amazon S3, the S3 object key is
  /// used as the asset name. When exporting to Amazon S3, the asset name is used
  /// as default target S3 object key.
  final String name;

  /// The unique identifier for the revision associated with this asset.
  final String revisionId;

  /// The date and time that the asset was last updated, in ISO 8601 format.
  final DateTime updatedAt;

  /// The asset ID of the owned asset corresponding to the entitled asset being
  /// viewed. This parameter is returned when an asset owner is viewing the
  /// entitled copy of its owned asset.
  final String? sourceId;

  AssetEntry({
    required this.arn,
    required this.assetDetails,
    required this.assetType,
    required this.createdAt,
    required this.dataSetId,
    required this.id,
    required this.name,
    required this.revisionId,
    required this.updatedAt,
    this.sourceId,
  });

  factory AssetEntry.fromJson(Map<String, dynamic> json) {
    return AssetEntry(
      arn: json['Arn'] as String,
      assetDetails:
          AssetDetails.fromJson(json['AssetDetails'] as Map<String, dynamic>),
      assetType: (json['AssetType'] as String).toAssetType(),
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] as Object),
      dataSetId: json['DataSetId'] as String,
      id: json['Id'] as String,
      name: json['Name'] as String,
      revisionId: json['RevisionId'] as String,
      updatedAt: nonNullableTimeStampFromJson(json['UpdatedAt'] as Object),
      sourceId: json['SourceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final assetDetails = this.assetDetails;
    final assetType = this.assetType;
    final createdAt = this.createdAt;
    final dataSetId = this.dataSetId;
    final id = this.id;
    final name = this.name;
    final revisionId = this.revisionId;
    final updatedAt = this.updatedAt;
    final sourceId = this.sourceId;
    return {
      'Arn': arn,
      'AssetDetails': assetDetails,
      'AssetType': assetType.toValue(),
      'CreatedAt': iso8601ToJson(createdAt),
      'DataSetId': dataSetId,
      'Id': id,
      'Name': name,
      'RevisionId': revisionId,
      'UpdatedAt': iso8601ToJson(updatedAt),
      if (sourceId != null) 'SourceId': sourceId,
    };
  }
}

/// The source of the assets.
class AssetSourceEntry {
  /// The S3 bucket that's part of the source of the asset.
  final String bucket;

  /// The name of the object in Amazon S3 for the asset.
  final String key;

  AssetSourceEntry({
    required this.bucket,
    required this.key,
  });

  factory AssetSourceEntry.fromJson(Map<String, dynamic> json) {
    return AssetSourceEntry(
      bucket: json['Bucket'] as String,
      key: json['Key'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final key = this.key;
    return {
      'Bucket': bucket,
      'Key': key,
    };
  }
}

/// The type of file your data is stored in. Currently, the supported asset type
/// is S3_SNAPSHOT.
enum AssetType {
  s3Snapshot,
}

extension on AssetType {
  String toValue() {
    switch (this) {
      case AssetType.s3Snapshot:
        return 'S3_SNAPSHOT';
    }
  }
}

extension on String {
  AssetType toAssetType() {
    switch (this) {
      case 'S3_SNAPSHOT':
        return AssetType.s3Snapshot;
    }
    throw Exception('$this is not known in enum AssetType');
  }
}

enum Code {
  accessDeniedException,
  internalServerException,
  malwareDetected,
  resourceNotFoundException,
  serviceQuotaExceededException,
  validationException,
  malwareScanEncryptedFile,
}

extension on Code {
  String toValue() {
    switch (this) {
      case Code.accessDeniedException:
        return 'ACCESS_DENIED_EXCEPTION';
      case Code.internalServerException:
        return 'INTERNAL_SERVER_EXCEPTION';
      case Code.malwareDetected:
        return 'MALWARE_DETECTED';
      case Code.resourceNotFoundException:
        return 'RESOURCE_NOT_FOUND_EXCEPTION';
      case Code.serviceQuotaExceededException:
        return 'SERVICE_QUOTA_EXCEEDED_EXCEPTION';
      case Code.validationException:
        return 'VALIDATION_EXCEPTION';
      case Code.malwareScanEncryptedFile:
        return 'MALWARE_SCAN_ENCRYPTED_FILE';
    }
  }
}

extension on String {
  Code toCode() {
    switch (this) {
      case 'ACCESS_DENIED_EXCEPTION':
        return Code.accessDeniedException;
      case 'INTERNAL_SERVER_EXCEPTION':
        return Code.internalServerException;
      case 'MALWARE_DETECTED':
        return Code.malwareDetected;
      case 'RESOURCE_NOT_FOUND_EXCEPTION':
        return Code.resourceNotFoundException;
      case 'SERVICE_QUOTA_EXCEEDED_EXCEPTION':
        return Code.serviceQuotaExceededException;
      case 'VALIDATION_EXCEPTION':
        return Code.validationException;
      case 'MALWARE_SCAN_ENCRYPTED_FILE':
        return Code.malwareScanEncryptedFile;
    }
    throw Exception('$this is not known in enum Code');
  }
}

class CreateDataSetResponse {
  /// The ARN for the data set.
  final String? arn;

  /// The type of file your data is stored in. Currently, the supported asset type
  /// is S3_SNAPSHOT.
  final AssetType? assetType;

  /// The date and time that the data set was created, in ISO 8601 format.
  final DateTime? createdAt;

  /// The description for the data set.
  final String? description;

  /// The unique identifier for the data set.
  final String? id;

  /// The name of the data set.
  final String? name;

  /// A property that defines the data set as OWNED by the account (for providers)
  /// or ENTITLED to the account (for subscribers).
  final Origin? origin;

  /// If the origin of this data set is ENTITLED, includes the details for the
  /// product on AWS Marketplace.
  final OriginDetails? originDetails;

  /// The data set ID of the owned data set corresponding to the entitled data set
  /// being viewed. This parameter is returned when a data set owner is viewing
  /// the entitled copy of its owned data set.
  final String? sourceId;

  /// The tags for the data set.
  final Map<String, String>? tags;

  /// The date and time that the data set was last updated, in ISO 8601 format.
  final DateTime? updatedAt;

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

  factory CreateDataSetResponse.fromJson(Map<String, dynamic> json) {
    return CreateDataSetResponse(
      arn: json['Arn'] as String?,
      assetType: (json['AssetType'] as String?)?.toAssetType(),
      createdAt: timeStampFromJson(json['CreatedAt']),
      description: json['Description'] as String?,
      id: json['Id'] as String?,
      name: json['Name'] as String?,
      origin: (json['Origin'] as String?)?.toOrigin(),
      originDetails: json['OriginDetails'] != null
          ? OriginDetails.fromJson(
              json['OriginDetails'] as Map<String, dynamic>)
          : null,
      sourceId: json['SourceId'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final assetType = this.assetType;
    final createdAt = this.createdAt;
    final description = this.description;
    final id = this.id;
    final name = this.name;
    final origin = this.origin;
    final originDetails = this.originDetails;
    final sourceId = this.sourceId;
    final tags = this.tags;
    final updatedAt = this.updatedAt;
    return {
      if (arn != null) 'Arn': arn,
      if (assetType != null) 'AssetType': assetType.toValue(),
      if (createdAt != null) 'CreatedAt': iso8601ToJson(createdAt),
      if (description != null) 'Description': description,
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (origin != null) 'Origin': origin.toValue(),
      if (originDetails != null) 'OriginDetails': originDetails,
      if (sourceId != null) 'SourceId': sourceId,
      if (tags != null) 'Tags': tags,
      if (updatedAt != null) 'UpdatedAt': iso8601ToJson(updatedAt),
    };
  }
}

class CreateJobResponse {
  /// The ARN for the job.
  final String? arn;

  /// The date and time that the job was created, in ISO 8601 format.
  final DateTime? createdAt;

  /// Details about the job.
  final ResponseDetails? details;

  /// The errors associated with jobs.
  final List<JobError>? errors;

  /// The unique identifier for the job.
  final String? id;

  /// The state of the job.
  final State? state;

  /// The job type.
  final Type? type;

  /// The date and time that the job was last updated, in ISO 8601 format.
  final DateTime? updatedAt;

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

  factory CreateJobResponse.fromJson(Map<String, dynamic> json) {
    return CreateJobResponse(
      arn: json['Arn'] as String?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      details: json['Details'] != null
          ? ResponseDetails.fromJson(json['Details'] as Map<String, dynamic>)
          : null,
      errors: (json['Errors'] as List?)
          ?.whereNotNull()
          .map((e) => JobError.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['Id'] as String?,
      state: (json['State'] as String?)?.toState(),
      type: (json['Type'] as String?)?.toType(),
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final details = this.details;
    final errors = this.errors;
    final id = this.id;
    final state = this.state;
    final type = this.type;
    final updatedAt = this.updatedAt;
    return {
      if (arn != null) 'Arn': arn,
      if (createdAt != null) 'CreatedAt': iso8601ToJson(createdAt),
      if (details != null) 'Details': details,
      if (errors != null) 'Errors': errors,
      if (id != null) 'Id': id,
      if (state != null) 'State': state.toValue(),
      if (type != null) 'Type': type.toValue(),
      if (updatedAt != null) 'UpdatedAt': iso8601ToJson(updatedAt),
    };
  }
}

class CreateRevisionResponse {
  /// The ARN for the revision
  final String? arn;

  /// An optional comment about the revision.
  final String? comment;

  /// The date and time that the revision was created, in ISO 8601 format.
  final DateTime? createdAt;

  /// The unique identifier for the data set associated with this revision.
  final String? dataSetId;

  /// To publish a revision to a data set in a product, the revision must first be
  /// finalized. Finalizing a revision tells AWS Data Exchange that your changes
  /// to the assets in the revision are complete. After it's in this read-only
  /// state, you can publish the revision to your products.
  ///
  /// Finalized revisions can be published through the AWS Data Exchange console
  /// or the AWS Marketplace Catalog API, using the StartChangeSet AWS Marketplace
  /// Catalog API action. When using the API, revisions are uniquely identified by
  /// their ARN.
  final bool? finalized;

  /// The unique identifier for the revision.
  final String? id;

  /// The revision ID of the owned revision corresponding to the entitled revision
  /// being viewed. This parameter is returned when a revision owner is viewing
  /// the entitled copy of its owned revision.
  final String? sourceId;

  /// The tags for the revision.
  final Map<String, String>? tags;

  /// The date and time that the revision was last updated, in ISO 8601 format.
  final DateTime? updatedAt;

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

  factory CreateRevisionResponse.fromJson(Map<String, dynamic> json) {
    return CreateRevisionResponse(
      arn: json['Arn'] as String?,
      comment: json['Comment'] as String?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      dataSetId: json['DataSetId'] as String?,
      finalized: json['Finalized'] as bool?,
      id: json['Id'] as String?,
      sourceId: json['SourceId'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final comment = this.comment;
    final createdAt = this.createdAt;
    final dataSetId = this.dataSetId;
    final finalized = this.finalized;
    final id = this.id;
    final sourceId = this.sourceId;
    final tags = this.tags;
    final updatedAt = this.updatedAt;
    return {
      if (arn != null) 'Arn': arn,
      if (comment != null) 'Comment': comment,
      if (createdAt != null) 'CreatedAt': iso8601ToJson(createdAt),
      if (dataSetId != null) 'DataSetId': dataSetId,
      if (finalized != null) 'Finalized': finalized,
      if (id != null) 'Id': id,
      if (sourceId != null) 'SourceId': sourceId,
      if (tags != null) 'Tags': tags,
      if (updatedAt != null) 'UpdatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// A data set is an AWS resource with one or more revisions.
class DataSetEntry {
  /// The ARN for the data set.
  final String arn;

  /// The type of file your data is stored in. Currently, the supported asset type
  /// is S3_SNAPSHOT.
  final AssetType assetType;

  /// The date and time that the data set was created, in ISO 8601 format.
  final DateTime createdAt;

  /// The description for the data set.
  final String description;

  /// The unique identifier for the data set.
  final String id;

  /// The name of the data set.
  final String name;

  /// A property that defines the data set as OWNED by the account (for providers)
  /// or ENTITLED to the account (for subscribers).
  final Origin origin;

  /// The date and time that the data set was last updated, in ISO 8601 format.
  final DateTime updatedAt;

  /// If the origin of this data set is ENTITLED, includes the details for the
  /// product on AWS Marketplace.
  final OriginDetails? originDetails;

  /// The data set ID of the owned data set corresponding to the entitled data set
  /// being viewed. This parameter is returned when a data set owner is viewing
  /// the entitled copy of its owned data set.
  final String? sourceId;

  DataSetEntry({
    required this.arn,
    required this.assetType,
    required this.createdAt,
    required this.description,
    required this.id,
    required this.name,
    required this.origin,
    required this.updatedAt,
    this.originDetails,
    this.sourceId,
  });

  factory DataSetEntry.fromJson(Map<String, dynamic> json) {
    return DataSetEntry(
      arn: json['Arn'] as String,
      assetType: (json['AssetType'] as String).toAssetType(),
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] as Object),
      description: json['Description'] as String,
      id: json['Id'] as String,
      name: json['Name'] as String,
      origin: (json['Origin'] as String).toOrigin(),
      updatedAt: nonNullableTimeStampFromJson(json['UpdatedAt'] as Object),
      originDetails: json['OriginDetails'] != null
          ? OriginDetails.fromJson(
              json['OriginDetails'] as Map<String, dynamic>)
          : null,
      sourceId: json['SourceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final assetType = this.assetType;
    final createdAt = this.createdAt;
    final description = this.description;
    final id = this.id;
    final name = this.name;
    final origin = this.origin;
    final updatedAt = this.updatedAt;
    final originDetails = this.originDetails;
    final sourceId = this.sourceId;
    return {
      'Arn': arn,
      'AssetType': assetType.toValue(),
      'CreatedAt': iso8601ToJson(createdAt),
      'Description': description,
      'Id': id,
      'Name': name,
      'Origin': origin.toValue(),
      'UpdatedAt': iso8601ToJson(updatedAt),
      if (originDetails != null) 'OriginDetails': originDetails,
      if (sourceId != null) 'SourceId': sourceId,
    };
  }
}

class Details {
  final ImportAssetFromSignedUrlJobErrorDetails?
      importAssetFromSignedUrlJobErrorDetails;
  final List<AssetSourceEntry>? importAssetsFromS3JobErrorDetails;

  Details({
    this.importAssetFromSignedUrlJobErrorDetails,
    this.importAssetsFromS3JobErrorDetails,
  });

  factory Details.fromJson(Map<String, dynamic> json) {
    return Details(
      importAssetFromSignedUrlJobErrorDetails:
          json['ImportAssetFromSignedUrlJobErrorDetails'] != null
              ? ImportAssetFromSignedUrlJobErrorDetails.fromJson(
                  json['ImportAssetFromSignedUrlJobErrorDetails']
                      as Map<String, dynamic>)
              : null,
      importAssetsFromS3JobErrorDetails:
          (json['ImportAssetsFromS3JobErrorDetails'] as List?)
              ?.whereNotNull()
              .map((e) => AssetSourceEntry.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final importAssetFromSignedUrlJobErrorDetails =
        this.importAssetFromSignedUrlJobErrorDetails;
    final importAssetsFromS3JobErrorDetails =
        this.importAssetsFromS3JobErrorDetails;
    return {
      if (importAssetFromSignedUrlJobErrorDetails != null)
        'ImportAssetFromSignedUrlJobErrorDetails':
            importAssetFromSignedUrlJobErrorDetails,
      if (importAssetsFromS3JobErrorDetails != null)
        'ImportAssetsFromS3JobErrorDetails': importAssetsFromS3JobErrorDetails,
    };
  }
}

/// Details of the operation to be performed by the job.
class ExportAssetToSignedUrlRequestDetails {
  /// The unique identifier for the asset that is exported to a signed URL.
  final String assetId;

  /// The unique identifier for the data set associated with this export job.
  final String dataSetId;

  /// The unique identifier for the revision associated with this export request.
  final String revisionId;

  ExportAssetToSignedUrlRequestDetails({
    required this.assetId,
    required this.dataSetId,
    required this.revisionId,
  });

  factory ExportAssetToSignedUrlRequestDetails.fromJson(
      Map<String, dynamic> json) {
    return ExportAssetToSignedUrlRequestDetails(
      assetId: json['AssetId'] as String,
      dataSetId: json['DataSetId'] as String,
      revisionId: json['RevisionId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final assetId = this.assetId;
    final dataSetId = this.dataSetId;
    final revisionId = this.revisionId;
    return {
      'AssetId': assetId,
      'DataSetId': dataSetId,
      'RevisionId': revisionId,
    };
  }
}

/// The details of the export to signed URL response.
class ExportAssetToSignedUrlResponseDetails {
  /// The unique identifier for the asset associated with this export job.
  final String assetId;

  /// The unique identifier for the data set associated with this export job.
  final String dataSetId;

  /// The unique identifier for the revision associated with this export response.
  final String revisionId;

  /// The signed URL for the export request.
  final String? signedUrl;

  /// The date and time that the signed URL expires, in ISO 8601 format.
  final DateTime? signedUrlExpiresAt;

  ExportAssetToSignedUrlResponseDetails({
    required this.assetId,
    required this.dataSetId,
    required this.revisionId,
    this.signedUrl,
    this.signedUrlExpiresAt,
  });

  factory ExportAssetToSignedUrlResponseDetails.fromJson(
      Map<String, dynamic> json) {
    return ExportAssetToSignedUrlResponseDetails(
      assetId: json['AssetId'] as String,
      dataSetId: json['DataSetId'] as String,
      revisionId: json['RevisionId'] as String,
      signedUrl: json['SignedUrl'] as String?,
      signedUrlExpiresAt: timeStampFromJson(json['SignedUrlExpiresAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final assetId = this.assetId;
    final dataSetId = this.dataSetId;
    final revisionId = this.revisionId;
    final signedUrl = this.signedUrl;
    final signedUrlExpiresAt = this.signedUrlExpiresAt;
    return {
      'AssetId': assetId,
      'DataSetId': dataSetId,
      'RevisionId': revisionId,
      if (signedUrl != null) 'SignedUrl': signedUrl,
      if (signedUrlExpiresAt != null)
        'SignedUrlExpiresAt': iso8601ToJson(signedUrlExpiresAt),
    };
  }
}

/// Details of the operation to be performed by the job.
class ExportAssetsToS3RequestDetails {
  /// The destination for the asset.
  final List<AssetDestinationEntry> assetDestinations;

  /// The unique identifier for the data set associated with this export job.
  final String dataSetId;

  /// The unique identifier for the revision associated with this export request.
  final String revisionId;

  /// Encryption configuration for the export job.
  final ExportServerSideEncryption? encryption;

  ExportAssetsToS3RequestDetails({
    required this.assetDestinations,
    required this.dataSetId,
    required this.revisionId,
    this.encryption,
  });

  factory ExportAssetsToS3RequestDetails.fromJson(Map<String, dynamic> json) {
    return ExportAssetsToS3RequestDetails(
      assetDestinations: (json['AssetDestinations'] as List)
          .whereNotNull()
          .map((e) => AssetDestinationEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      dataSetId: json['DataSetId'] as String,
      revisionId: json['RevisionId'] as String,
      encryption: json['Encryption'] != null
          ? ExportServerSideEncryption.fromJson(
              json['Encryption'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final assetDestinations = this.assetDestinations;
    final dataSetId = this.dataSetId;
    final revisionId = this.revisionId;
    final encryption = this.encryption;
    return {
      'AssetDestinations': assetDestinations,
      'DataSetId': dataSetId,
      'RevisionId': revisionId,
      if (encryption != null) 'Encryption': encryption,
    };
  }
}

/// Details about the export to Amazon S3 response.
class ExportAssetsToS3ResponseDetails {
  /// The destination in Amazon S3 where the asset is exported.
  final List<AssetDestinationEntry> assetDestinations;

  /// The unique identifier for the data set associated with this export job.
  final String dataSetId;

  /// The unique identifier for the revision associated with this export response.
  final String revisionId;

  /// Encryption configuration of the export job.
  final ExportServerSideEncryption? encryption;

  ExportAssetsToS3ResponseDetails({
    required this.assetDestinations,
    required this.dataSetId,
    required this.revisionId,
    this.encryption,
  });

  factory ExportAssetsToS3ResponseDetails.fromJson(Map<String, dynamic> json) {
    return ExportAssetsToS3ResponseDetails(
      assetDestinations: (json['AssetDestinations'] as List)
          .whereNotNull()
          .map((e) => AssetDestinationEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      dataSetId: json['DataSetId'] as String,
      revisionId: json['RevisionId'] as String,
      encryption: json['Encryption'] != null
          ? ExportServerSideEncryption.fromJson(
              json['Encryption'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final assetDestinations = this.assetDestinations;
    final dataSetId = this.dataSetId;
    final revisionId = this.revisionId;
    final encryption = this.encryption;
    return {
      'AssetDestinations': assetDestinations,
      'DataSetId': dataSetId,
      'RevisionId': revisionId,
      if (encryption != null) 'Encryption': encryption,
    };
  }
}

/// Details of the operation to be performed by the job.
class ExportRevisionsToS3RequestDetails {
  /// The unique identifier for the data set associated with this export job.
  final String dataSetId;

  /// The destination for the revision.
  final List<RevisionDestinationEntry> revisionDestinations;

  /// Encryption configuration for the export job.
  final ExportServerSideEncryption? encryption;

  ExportRevisionsToS3RequestDetails({
    required this.dataSetId,
    required this.revisionDestinations,
    this.encryption,
  });

  factory ExportRevisionsToS3RequestDetails.fromJson(
      Map<String, dynamic> json) {
    return ExportRevisionsToS3RequestDetails(
      dataSetId: json['DataSetId'] as String,
      revisionDestinations: (json['RevisionDestinations'] as List)
          .whereNotNull()
          .map((e) =>
              RevisionDestinationEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      encryption: json['Encryption'] != null
          ? ExportServerSideEncryption.fromJson(
              json['Encryption'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final dataSetId = this.dataSetId;
    final revisionDestinations = this.revisionDestinations;
    final encryption = this.encryption;
    return {
      'DataSetId': dataSetId,
      'RevisionDestinations': revisionDestinations,
      if (encryption != null) 'Encryption': encryption,
    };
  }
}

/// Details about the export revisions to Amazon S3 response.
class ExportRevisionsToS3ResponseDetails {
  /// The unique identifier for the data set associated with this export job.
  final String dataSetId;

  /// The destination in Amazon S3 where the revision is exported.
  final List<RevisionDestinationEntry> revisionDestinations;

  /// Encryption configuration of the export job.
  final ExportServerSideEncryption? encryption;

  ExportRevisionsToS3ResponseDetails({
    required this.dataSetId,
    required this.revisionDestinations,
    this.encryption,
  });

  factory ExportRevisionsToS3ResponseDetails.fromJson(
      Map<String, dynamic> json) {
    return ExportRevisionsToS3ResponseDetails(
      dataSetId: json['DataSetId'] as String,
      revisionDestinations: (json['RevisionDestinations'] as List)
          .whereNotNull()
          .map((e) =>
              RevisionDestinationEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      encryption: json['Encryption'] != null
          ? ExportServerSideEncryption.fromJson(
              json['Encryption'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final dataSetId = this.dataSetId;
    final revisionDestinations = this.revisionDestinations;
    final encryption = this.encryption;
    return {
      'DataSetId': dataSetId,
      'RevisionDestinations': revisionDestinations,
      if (encryption != null) 'Encryption': encryption,
    };
  }
}

/// Encryption configuration of the export job. Includes the encryption type as
/// well as the AWS KMS key. The KMS key is only necessary if you chose the KMS
/// encryption type.
class ExportServerSideEncryption {
  /// The type of server side encryption used for encrypting the objects in Amazon
  /// S3.
  final ServerSideEncryptionTypes type;

  /// The Amazon Resource Name (ARN) of the the AWS KMS key you want to use to
  /// encrypt the Amazon S3 objects. This parameter is required if you choose
  /// aws:kms as an encryption type.
  final String? kmsKeyArn;

  ExportServerSideEncryption({
    required this.type,
    this.kmsKeyArn,
  });

  factory ExportServerSideEncryption.fromJson(Map<String, dynamic> json) {
    return ExportServerSideEncryption(
      type: (json['Type'] as String).toServerSideEncryptionTypes(),
      kmsKeyArn: json['KmsKeyArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final kmsKeyArn = this.kmsKeyArn;
    return {
      'Type': type.toValue(),
      if (kmsKeyArn != null) 'KmsKeyArn': kmsKeyArn,
    };
  }
}

class GetAssetResponse {
  /// The ARN for the asset.
  final String? arn;

  /// Information about the asset, including its size.
  final AssetDetails? assetDetails;

  /// The type of file your data is stored in. Currently, the supported asset type
  /// is S3_SNAPSHOT.
  final AssetType? assetType;

  /// The date and time that the asset was created, in ISO 8601 format.
  final DateTime? createdAt;

  /// The unique identifier for the data set associated with this asset.
  final String? dataSetId;

  /// The unique identifier for the asset.
  final String? id;

  /// The name of the asset When importing from Amazon S3, the S3 object key is
  /// used as the asset name. When exporting to Amazon S3, the asset name is used
  /// as default target S3 object key.
  final String? name;

  /// The unique identifier for the revision associated with this asset.
  final String? revisionId;

  /// The asset ID of the owned asset corresponding to the entitled asset being
  /// viewed. This parameter is returned when an asset owner is viewing the
  /// entitled copy of its owned asset.
  final String? sourceId;

  /// The date and time that the asset was last updated, in ISO 8601 format.
  final DateTime? updatedAt;

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

  factory GetAssetResponse.fromJson(Map<String, dynamic> json) {
    return GetAssetResponse(
      arn: json['Arn'] as String?,
      assetDetails: json['AssetDetails'] != null
          ? AssetDetails.fromJson(json['AssetDetails'] as Map<String, dynamic>)
          : null,
      assetType: (json['AssetType'] as String?)?.toAssetType(),
      createdAt: timeStampFromJson(json['CreatedAt']),
      dataSetId: json['DataSetId'] as String?,
      id: json['Id'] as String?,
      name: json['Name'] as String?,
      revisionId: json['RevisionId'] as String?,
      sourceId: json['SourceId'] as String?,
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final assetDetails = this.assetDetails;
    final assetType = this.assetType;
    final createdAt = this.createdAt;
    final dataSetId = this.dataSetId;
    final id = this.id;
    final name = this.name;
    final revisionId = this.revisionId;
    final sourceId = this.sourceId;
    final updatedAt = this.updatedAt;
    return {
      if (arn != null) 'Arn': arn,
      if (assetDetails != null) 'AssetDetails': assetDetails,
      if (assetType != null) 'AssetType': assetType.toValue(),
      if (createdAt != null) 'CreatedAt': iso8601ToJson(createdAt),
      if (dataSetId != null) 'DataSetId': dataSetId,
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (revisionId != null) 'RevisionId': revisionId,
      if (sourceId != null) 'SourceId': sourceId,
      if (updatedAt != null) 'UpdatedAt': iso8601ToJson(updatedAt),
    };
  }
}

class GetDataSetResponse {
  /// The ARN for the data set.
  final String? arn;

  /// The type of file your data is stored in. Currently, the supported asset type
  /// is S3_SNAPSHOT.
  final AssetType? assetType;

  /// The date and time that the data set was created, in ISO 8601 format.
  final DateTime? createdAt;

  /// The description for the data set.
  final String? description;

  /// The unique identifier for the data set.
  final String? id;

  /// The name of the data set.
  final String? name;

  /// A property that defines the data set as OWNED by the account (for providers)
  /// or ENTITLED to the account (for subscribers).
  final Origin? origin;

  /// If the origin of this data set is ENTITLED, includes the details for the
  /// product on AWS Marketplace.
  final OriginDetails? originDetails;

  /// The data set ID of the owned data set corresponding to the entitled data set
  /// being viewed. This parameter is returned when a data set owner is viewing
  /// the entitled copy of its owned data set.
  final String? sourceId;

  /// The tags for the data set.
  final Map<String, String>? tags;

  /// The date and time that the data set was last updated, in ISO 8601 format.
  final DateTime? updatedAt;

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

  factory GetDataSetResponse.fromJson(Map<String, dynamic> json) {
    return GetDataSetResponse(
      arn: json['Arn'] as String?,
      assetType: (json['AssetType'] as String?)?.toAssetType(),
      createdAt: timeStampFromJson(json['CreatedAt']),
      description: json['Description'] as String?,
      id: json['Id'] as String?,
      name: json['Name'] as String?,
      origin: (json['Origin'] as String?)?.toOrigin(),
      originDetails: json['OriginDetails'] != null
          ? OriginDetails.fromJson(
              json['OriginDetails'] as Map<String, dynamic>)
          : null,
      sourceId: json['SourceId'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final assetType = this.assetType;
    final createdAt = this.createdAt;
    final description = this.description;
    final id = this.id;
    final name = this.name;
    final origin = this.origin;
    final originDetails = this.originDetails;
    final sourceId = this.sourceId;
    final tags = this.tags;
    final updatedAt = this.updatedAt;
    return {
      if (arn != null) 'Arn': arn,
      if (assetType != null) 'AssetType': assetType.toValue(),
      if (createdAt != null) 'CreatedAt': iso8601ToJson(createdAt),
      if (description != null) 'Description': description,
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (origin != null) 'Origin': origin.toValue(),
      if (originDetails != null) 'OriginDetails': originDetails,
      if (sourceId != null) 'SourceId': sourceId,
      if (tags != null) 'Tags': tags,
      if (updatedAt != null) 'UpdatedAt': iso8601ToJson(updatedAt),
    };
  }
}

class GetJobResponse {
  /// The ARN for the job.
  final String? arn;

  /// The date and time that the job was created, in ISO 8601 format.
  final DateTime? createdAt;

  /// Details about the job.
  final ResponseDetails? details;

  /// The errors associated with jobs.
  final List<JobError>? errors;

  /// The unique identifier for the job.
  final String? id;

  /// The state of the job.
  final State? state;

  /// The job type.
  final Type? type;

  /// The date and time that the job was last updated, in ISO 8601 format.
  final DateTime? updatedAt;

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

  factory GetJobResponse.fromJson(Map<String, dynamic> json) {
    return GetJobResponse(
      arn: json['Arn'] as String?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      details: json['Details'] != null
          ? ResponseDetails.fromJson(json['Details'] as Map<String, dynamic>)
          : null,
      errors: (json['Errors'] as List?)
          ?.whereNotNull()
          .map((e) => JobError.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['Id'] as String?,
      state: (json['State'] as String?)?.toState(),
      type: (json['Type'] as String?)?.toType(),
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final details = this.details;
    final errors = this.errors;
    final id = this.id;
    final state = this.state;
    final type = this.type;
    final updatedAt = this.updatedAt;
    return {
      if (arn != null) 'Arn': arn,
      if (createdAt != null) 'CreatedAt': iso8601ToJson(createdAt),
      if (details != null) 'Details': details,
      if (errors != null) 'Errors': errors,
      if (id != null) 'Id': id,
      if (state != null) 'State': state.toValue(),
      if (type != null) 'Type': type.toValue(),
      if (updatedAt != null) 'UpdatedAt': iso8601ToJson(updatedAt),
    };
  }
}

class GetRevisionResponse {
  /// The ARN for the revision
  final String? arn;

  /// An optional comment about the revision.
  final String? comment;

  /// The date and time that the revision was created, in ISO 8601 format.
  final DateTime? createdAt;

  /// The unique identifier for the data set associated with this revision.
  final String? dataSetId;

  /// To publish a revision to a data set in a product, the revision must first be
  /// finalized. Finalizing a revision tells AWS Data Exchange that your changes
  /// to the assets in the revision are complete. After it's in this read-only
  /// state, you can publish the revision to your products.
  ///
  /// Finalized revisions can be published through the AWS Data Exchange console
  /// or the AWS Marketplace Catalog API, using the StartChangeSet AWS Marketplace
  /// Catalog API action. When using the API, revisions are uniquely identified by
  /// their ARN.
  final bool? finalized;

  /// The unique identifier for the revision.
  final String? id;

  /// The revision ID of the owned revision corresponding to the entitled revision
  /// being viewed. This parameter is returned when a revision owner is viewing
  /// the entitled copy of its owned revision.
  final String? sourceId;

  /// The tags for the revision.
  final Map<String, String>? tags;

  /// The date and time that the revision was last updated, in ISO 8601 format.
  final DateTime? updatedAt;

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

  factory GetRevisionResponse.fromJson(Map<String, dynamic> json) {
    return GetRevisionResponse(
      arn: json['Arn'] as String?,
      comment: json['Comment'] as String?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      dataSetId: json['DataSetId'] as String?,
      finalized: json['Finalized'] as bool?,
      id: json['Id'] as String?,
      sourceId: json['SourceId'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final comment = this.comment;
    final createdAt = this.createdAt;
    final dataSetId = this.dataSetId;
    final finalized = this.finalized;
    final id = this.id;
    final sourceId = this.sourceId;
    final tags = this.tags;
    final updatedAt = this.updatedAt;
    return {
      if (arn != null) 'Arn': arn,
      if (comment != null) 'Comment': comment,
      if (createdAt != null) 'CreatedAt': iso8601ToJson(createdAt),
      if (dataSetId != null) 'DataSetId': dataSetId,
      if (finalized != null) 'Finalized': finalized,
      if (id != null) 'Id': id,
      if (sourceId != null) 'SourceId': sourceId,
      if (tags != null) 'Tags': tags,
      if (updatedAt != null) 'UpdatedAt': iso8601ToJson(updatedAt),
    };
  }
}

class ImportAssetFromSignedUrlJobErrorDetails {
  final String assetName;

  ImportAssetFromSignedUrlJobErrorDetails({
    required this.assetName,
  });

  factory ImportAssetFromSignedUrlJobErrorDetails.fromJson(
      Map<String, dynamic> json) {
    return ImportAssetFromSignedUrlJobErrorDetails(
      assetName: json['AssetName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final assetName = this.assetName;
    return {
      'AssetName': assetName,
    };
  }
}

/// Details of the operation to be performed by the job.
class ImportAssetFromSignedUrlRequestDetails {
  /// The name of the asset. When importing from Amazon S3, the S3 object key is
  /// used as the asset name.
  final String assetName;

  /// The unique identifier for the data set associated with this import job.
  final String dataSetId;

  /// The Base64-encoded Md5 hash for the asset, used to ensure the integrity of
  /// the file at that location.
  final String md5Hash;

  /// The unique identifier for the revision associated with this import request.
  final String revisionId;

  ImportAssetFromSignedUrlRequestDetails({
    required this.assetName,
    required this.dataSetId,
    required this.md5Hash,
    required this.revisionId,
  });

  factory ImportAssetFromSignedUrlRequestDetails.fromJson(
      Map<String, dynamic> json) {
    return ImportAssetFromSignedUrlRequestDetails(
      assetName: json['AssetName'] as String,
      dataSetId: json['DataSetId'] as String,
      md5Hash: json['Md5Hash'] as String,
      revisionId: json['RevisionId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final assetName = this.assetName;
    final dataSetId = this.dataSetId;
    final md5Hash = this.md5Hash;
    final revisionId = this.revisionId;
    return {
      'AssetName': assetName,
      'DataSetId': dataSetId,
      'Md5Hash': md5Hash,
      'RevisionId': revisionId,
    };
  }
}

/// The details in the response for an import request, including the signed URL
/// and other information.
class ImportAssetFromSignedUrlResponseDetails {
  /// The name for the asset associated with this import response.
  final String assetName;

  /// The unique identifier for the data set associated with this import job.
  final String dataSetId;

  /// The unique identifier for the revision associated with this import response.
  final String revisionId;

  /// The Base64-encoded Md5 hash for the asset, used to ensure the integrity of
  /// the file at that location.
  final String? md5Hash;

  /// The signed URL.
  final String? signedUrl;

  /// The time and date at which the signed URL expires, in ISO 8601 format.
  final DateTime? signedUrlExpiresAt;

  ImportAssetFromSignedUrlResponseDetails({
    required this.assetName,
    required this.dataSetId,
    required this.revisionId,
    this.md5Hash,
    this.signedUrl,
    this.signedUrlExpiresAt,
  });

  factory ImportAssetFromSignedUrlResponseDetails.fromJson(
      Map<String, dynamic> json) {
    return ImportAssetFromSignedUrlResponseDetails(
      assetName: json['AssetName'] as String,
      dataSetId: json['DataSetId'] as String,
      revisionId: json['RevisionId'] as String,
      md5Hash: json['Md5Hash'] as String?,
      signedUrl: json['SignedUrl'] as String?,
      signedUrlExpiresAt: timeStampFromJson(json['SignedUrlExpiresAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final assetName = this.assetName;
    final dataSetId = this.dataSetId;
    final revisionId = this.revisionId;
    final md5Hash = this.md5Hash;
    final signedUrl = this.signedUrl;
    final signedUrlExpiresAt = this.signedUrlExpiresAt;
    return {
      'AssetName': assetName,
      'DataSetId': dataSetId,
      'RevisionId': revisionId,
      if (md5Hash != null) 'Md5Hash': md5Hash,
      if (signedUrl != null) 'SignedUrl': signedUrl,
      if (signedUrlExpiresAt != null)
        'SignedUrlExpiresAt': iso8601ToJson(signedUrlExpiresAt),
    };
  }
}

/// Details of the operation to be performed by the job.
class ImportAssetsFromS3RequestDetails {
  /// Is a list of S3 bucket and object key pairs.
  final List<AssetSourceEntry> assetSources;

  /// The unique identifier for the data set associated with this import job.
  final String dataSetId;

  /// The unique identifier for the revision associated with this import request.
  final String revisionId;

  ImportAssetsFromS3RequestDetails({
    required this.assetSources,
    required this.dataSetId,
    required this.revisionId,
  });

  factory ImportAssetsFromS3RequestDetails.fromJson(Map<String, dynamic> json) {
    return ImportAssetsFromS3RequestDetails(
      assetSources: (json['AssetSources'] as List)
          .whereNotNull()
          .map((e) => AssetSourceEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      dataSetId: json['DataSetId'] as String,
      revisionId: json['RevisionId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final assetSources = this.assetSources;
    final dataSetId = this.dataSetId;
    final revisionId = this.revisionId;
    return {
      'AssetSources': assetSources,
      'DataSetId': dataSetId,
      'RevisionId': revisionId,
    };
  }
}

/// Details from an import from Amazon S3 response.
class ImportAssetsFromS3ResponseDetails {
  /// Is a list of Amazon S3 bucket and object key pairs.
  final List<AssetSourceEntry> assetSources;

  /// The unique identifier for the data set associated with this import job.
  final String dataSetId;

  /// The unique identifier for the revision associated with this import response.
  final String revisionId;

  ImportAssetsFromS3ResponseDetails({
    required this.assetSources,
    required this.dataSetId,
    required this.revisionId,
  });

  factory ImportAssetsFromS3ResponseDetails.fromJson(
      Map<String, dynamic> json) {
    return ImportAssetsFromS3ResponseDetails(
      assetSources: (json['AssetSources'] as List)
          .whereNotNull()
          .map((e) => AssetSourceEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      dataSetId: json['DataSetId'] as String,
      revisionId: json['RevisionId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final assetSources = this.assetSources;
    final dataSetId = this.dataSetId;
    final revisionId = this.revisionId;
    return {
      'AssetSources': assetSources,
      'DataSetId': dataSetId,
      'RevisionId': revisionId,
    };
  }
}

/// AWS Data Exchange Jobs are asynchronous import or export operations used to
/// create or copy assets. A data set owner can both import and export as they
/// see fit. Someone with an entitlement to a data set can only export. Jobs are
/// deleted 90 days after they are created.
class JobEntry {
  /// The ARN for the job.
  final String arn;

  /// The date and time that the job was created, in ISO 8601 format.
  final DateTime createdAt;

  /// Details of the operation to be performed by the job, such as export
  /// destination details or import source details.
  final ResponseDetails details;

  /// The unique identifier for the job.
  final String id;

  /// The state of the job.
  final State state;

  /// The job type.
  final Type type;

  /// The date and time that the job was last updated, in ISO 8601 format.
  final DateTime updatedAt;

  /// Errors for jobs.
  final List<JobError>? errors;

  JobEntry({
    required this.arn,
    required this.createdAt,
    required this.details,
    required this.id,
    required this.state,
    required this.type,
    required this.updatedAt,
    this.errors,
  });

  factory JobEntry.fromJson(Map<String, dynamic> json) {
    return JobEntry(
      arn: json['Arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] as Object),
      details:
          ResponseDetails.fromJson(json['Details'] as Map<String, dynamic>),
      id: json['Id'] as String,
      state: (json['State'] as String).toState(),
      type: (json['Type'] as String).toType(),
      updatedAt: nonNullableTimeStampFromJson(json['UpdatedAt'] as Object),
      errors: (json['Errors'] as List?)
          ?.whereNotNull()
          .map((e) => JobError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final details = this.details;
    final id = this.id;
    final state = this.state;
    final type = this.type;
    final updatedAt = this.updatedAt;
    final errors = this.errors;
    return {
      'Arn': arn,
      'CreatedAt': iso8601ToJson(createdAt),
      'Details': details,
      'Id': id,
      'State': state.toValue(),
      'Type': type.toValue(),
      'UpdatedAt': iso8601ToJson(updatedAt),
      if (errors != null) 'Errors': errors,
    };
  }
}

/// An error that occurred with the job request.
class JobError {
  /// The code for the job error.
  final Code code;

  /// The message related to the job error.
  final String message;
  final Details? details;

  /// The name of the limit that was reached.
  final JobErrorLimitName? limitName;

  /// The value of the exceeded limit.
  final double? limitValue;

  /// The unique identifier for the resource related to the error.
  final String? resourceId;

  /// The type of resource related to the error.
  final JobErrorResourceTypes? resourceType;

  JobError({
    required this.code,
    required this.message,
    this.details,
    this.limitName,
    this.limitValue,
    this.resourceId,
    this.resourceType,
  });

  factory JobError.fromJson(Map<String, dynamic> json) {
    return JobError(
      code: (json['Code'] as String).toCode(),
      message: json['Message'] as String,
      details: json['Details'] != null
          ? Details.fromJson(json['Details'] as Map<String, dynamic>)
          : null,
      limitName: (json['LimitName'] as String?)?.toJobErrorLimitName(),
      limitValue: json['LimitValue'] as double?,
      resourceId: json['ResourceId'] as String?,
      resourceType:
          (json['ResourceType'] as String?)?.toJobErrorResourceTypes(),
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    final details = this.details;
    final limitName = this.limitName;
    final limitValue = this.limitValue;
    final resourceId = this.resourceId;
    final resourceType = this.resourceType;
    return {
      'Code': code.toValue(),
      'Message': message,
      if (details != null) 'Details': details,
      if (limitName != null) 'LimitName': limitName.toValue(),
      if (limitValue != null) 'LimitValue': limitValue,
      if (resourceId != null) 'ResourceId': resourceId,
      if (resourceType != null) 'ResourceType': resourceType.toValue(),
    };
  }
}

/// The name of the limit that was reached.
enum JobErrorLimitName {
  assetsPerRevision,
  assetSizeInGb,
}

extension on JobErrorLimitName {
  String toValue() {
    switch (this) {
      case JobErrorLimitName.assetsPerRevision:
        return 'Assets per revision';
      case JobErrorLimitName.assetSizeInGb:
        return 'Asset size in GB';
    }
  }
}

extension on String {
  JobErrorLimitName toJobErrorLimitName() {
    switch (this) {
      case 'Assets per revision':
        return JobErrorLimitName.assetsPerRevision;
      case 'Asset size in GB':
        return JobErrorLimitName.assetSizeInGb;
    }
    throw Exception('$this is not known in enum JobErrorLimitName');
  }
}

/// The types of resource which the job error can apply to.
enum JobErrorResourceTypes {
  revision,
  asset,
}

extension on JobErrorResourceTypes {
  String toValue() {
    switch (this) {
      case JobErrorResourceTypes.revision:
        return 'REVISION';
      case JobErrorResourceTypes.asset:
        return 'ASSET';
    }
  }
}

extension on String {
  JobErrorResourceTypes toJobErrorResourceTypes() {
    switch (this) {
      case 'REVISION':
        return JobErrorResourceTypes.revision;
      case 'ASSET':
        return JobErrorResourceTypes.asset;
    }
    throw Exception('$this is not known in enum JobErrorResourceTypes');
  }
}

class ListDataSetRevisionsResponse {
  /// The token value retrieved from a previous call to access the next page of
  /// results.
  final String? nextToken;

  /// The asset objects listed by the request.
  final List<RevisionEntry>? revisions;

  ListDataSetRevisionsResponse({
    this.nextToken,
    this.revisions,
  });

  factory ListDataSetRevisionsResponse.fromJson(Map<String, dynamic> json) {
    return ListDataSetRevisionsResponse(
      nextToken: json['NextToken'] as String?,
      revisions: (json['Revisions'] as List?)
          ?.whereNotNull()
          .map((e) => RevisionEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final revisions = this.revisions;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (revisions != null) 'Revisions': revisions,
    };
  }
}

class ListDataSetsResponse {
  /// The data set objects listed by the request.
  final List<DataSetEntry>? dataSets;

  /// The token value retrieved from a previous call to access the next page of
  /// results.
  final String? nextToken;

  ListDataSetsResponse({
    this.dataSets,
    this.nextToken,
  });

  factory ListDataSetsResponse.fromJson(Map<String, dynamic> json) {
    return ListDataSetsResponse(
      dataSets: (json['DataSets'] as List?)
          ?.whereNotNull()
          .map((e) => DataSetEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataSets = this.dataSets;
    final nextToken = this.nextToken;
    return {
      if (dataSets != null) 'DataSets': dataSets,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListJobsResponse {
  /// The jobs listed by the request.
  final List<JobEntry>? jobs;

  /// The token value retrieved from a previous call to access the next page of
  /// results.
  final String? nextToken;

  ListJobsResponse({
    this.jobs,
    this.nextToken,
  });

  factory ListJobsResponse.fromJson(Map<String, dynamic> json) {
    return ListJobsResponse(
      jobs: (json['Jobs'] as List?)
          ?.whereNotNull()
          .map((e) => JobEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobs = this.jobs;
    final nextToken = this.nextToken;
    return {
      if (jobs != null) 'Jobs': jobs,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListRevisionAssetsResponse {
  /// The asset objects listed by the request.
  final List<AssetEntry>? assets;

  /// The token value retrieved from a previous call to access the next page of
  /// results.
  final String? nextToken;

  ListRevisionAssetsResponse({
    this.assets,
    this.nextToken,
  });

  factory ListRevisionAssetsResponse.fromJson(Map<String, dynamic> json) {
    return ListRevisionAssetsResponse(
      assets: (json['Assets'] as List?)
          ?.whereNotNull()
          .map((e) => AssetEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final assets = this.assets;
    final nextToken = this.nextToken;
    return {
      if (assets != null) 'Assets': assets,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListTagsForResourceResponse {
  /// A label that consists of a customer-defined key and an optional value.
  final Map<String, String>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
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

/// A property that defines the data set as OWNED by the account (for providers)
/// or ENTITLED to the account (for subscribers). When an owned data set is
/// published in a product, AWS Data Exchange creates a copy of the data set.
/// Subscribers can access that copy of the data set as an entitled data set.
enum Origin {
  owned,
  entitled,
}

extension on Origin {
  String toValue() {
    switch (this) {
      case Origin.owned:
        return 'OWNED';
      case Origin.entitled:
        return 'ENTITLED';
    }
  }
}

extension on String {
  Origin toOrigin() {
    switch (this) {
      case 'OWNED':
        return Origin.owned;
      case 'ENTITLED':
        return Origin.entitled;
    }
    throw Exception('$this is not known in enum Origin');
  }
}

class OriginDetails {
  final String productId;

  OriginDetails({
    required this.productId,
  });

  factory OriginDetails.fromJson(Map<String, dynamic> json) {
    return OriginDetails(
      productId: json['ProductId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final productId = this.productId;
    return {
      'ProductId': productId,
    };
  }
}

/// The details for the request.
class RequestDetails {
  /// Details about the export to signed URL request.
  final ExportAssetToSignedUrlRequestDetails? exportAssetToSignedUrl;

  /// Details about the export to Amazon S3 request.
  final ExportAssetsToS3RequestDetails? exportAssetsToS3;

  /// Details about the export to Amazon S3 request.
  final ExportRevisionsToS3RequestDetails? exportRevisionsToS3;

  /// Details about the import from signed URL request.
  final ImportAssetFromSignedUrlRequestDetails? importAssetFromSignedUrl;

  /// Details about the import from Amazon S3 request.
  final ImportAssetsFromS3RequestDetails? importAssetsFromS3;

  RequestDetails({
    this.exportAssetToSignedUrl,
    this.exportAssetsToS3,
    this.exportRevisionsToS3,
    this.importAssetFromSignedUrl,
    this.importAssetsFromS3,
  });

  factory RequestDetails.fromJson(Map<String, dynamic> json) {
    return RequestDetails(
      exportAssetToSignedUrl: json['ExportAssetToSignedUrl'] != null
          ? ExportAssetToSignedUrlRequestDetails.fromJson(
              json['ExportAssetToSignedUrl'] as Map<String, dynamic>)
          : null,
      exportAssetsToS3: json['ExportAssetsToS3'] != null
          ? ExportAssetsToS3RequestDetails.fromJson(
              json['ExportAssetsToS3'] as Map<String, dynamic>)
          : null,
      exportRevisionsToS3: json['ExportRevisionsToS3'] != null
          ? ExportRevisionsToS3RequestDetails.fromJson(
              json['ExportRevisionsToS3'] as Map<String, dynamic>)
          : null,
      importAssetFromSignedUrl: json['ImportAssetFromSignedUrl'] != null
          ? ImportAssetFromSignedUrlRequestDetails.fromJson(
              json['ImportAssetFromSignedUrl'] as Map<String, dynamic>)
          : null,
      importAssetsFromS3: json['ImportAssetsFromS3'] != null
          ? ImportAssetsFromS3RequestDetails.fromJson(
              json['ImportAssetsFromS3'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final exportAssetToSignedUrl = this.exportAssetToSignedUrl;
    final exportAssetsToS3 = this.exportAssetsToS3;
    final exportRevisionsToS3 = this.exportRevisionsToS3;
    final importAssetFromSignedUrl = this.importAssetFromSignedUrl;
    final importAssetsFromS3 = this.importAssetsFromS3;
    return {
      if (exportAssetToSignedUrl != null)
        'ExportAssetToSignedUrl': exportAssetToSignedUrl,
      if (exportAssetsToS3 != null) 'ExportAssetsToS3': exportAssetsToS3,
      if (exportRevisionsToS3 != null)
        'ExportRevisionsToS3': exportRevisionsToS3,
      if (importAssetFromSignedUrl != null)
        'ImportAssetFromSignedUrl': importAssetFromSignedUrl,
      if (importAssetsFromS3 != null) 'ImportAssetsFromS3': importAssetsFromS3,
    };
  }
}

/// Details for the response.
class ResponseDetails {
  /// Details for the export to signed URL response.
  final ExportAssetToSignedUrlResponseDetails? exportAssetToSignedUrl;

  /// Details for the export to Amazon S3 response.
  final ExportAssetsToS3ResponseDetails? exportAssetsToS3;

  /// Details for the export revisions to Amazon S3 response.
  final ExportRevisionsToS3ResponseDetails? exportRevisionsToS3;

  /// Details for the import from signed URL response.
  final ImportAssetFromSignedUrlResponseDetails? importAssetFromSignedUrl;

  /// Details for the import from Amazon S3 response.
  final ImportAssetsFromS3ResponseDetails? importAssetsFromS3;

  ResponseDetails({
    this.exportAssetToSignedUrl,
    this.exportAssetsToS3,
    this.exportRevisionsToS3,
    this.importAssetFromSignedUrl,
    this.importAssetsFromS3,
  });

  factory ResponseDetails.fromJson(Map<String, dynamic> json) {
    return ResponseDetails(
      exportAssetToSignedUrl: json['ExportAssetToSignedUrl'] != null
          ? ExportAssetToSignedUrlResponseDetails.fromJson(
              json['ExportAssetToSignedUrl'] as Map<String, dynamic>)
          : null,
      exportAssetsToS3: json['ExportAssetsToS3'] != null
          ? ExportAssetsToS3ResponseDetails.fromJson(
              json['ExportAssetsToS3'] as Map<String, dynamic>)
          : null,
      exportRevisionsToS3: json['ExportRevisionsToS3'] != null
          ? ExportRevisionsToS3ResponseDetails.fromJson(
              json['ExportRevisionsToS3'] as Map<String, dynamic>)
          : null,
      importAssetFromSignedUrl: json['ImportAssetFromSignedUrl'] != null
          ? ImportAssetFromSignedUrlResponseDetails.fromJson(
              json['ImportAssetFromSignedUrl'] as Map<String, dynamic>)
          : null,
      importAssetsFromS3: json['ImportAssetsFromS3'] != null
          ? ImportAssetsFromS3ResponseDetails.fromJson(
              json['ImportAssetsFromS3'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final exportAssetToSignedUrl = this.exportAssetToSignedUrl;
    final exportAssetsToS3 = this.exportAssetsToS3;
    final exportRevisionsToS3 = this.exportRevisionsToS3;
    final importAssetFromSignedUrl = this.importAssetFromSignedUrl;
    final importAssetsFromS3 = this.importAssetsFromS3;
    return {
      if (exportAssetToSignedUrl != null)
        'ExportAssetToSignedUrl': exportAssetToSignedUrl,
      if (exportAssetsToS3 != null) 'ExportAssetsToS3': exportAssetsToS3,
      if (exportRevisionsToS3 != null)
        'ExportRevisionsToS3': exportRevisionsToS3,
      if (importAssetFromSignedUrl != null)
        'ImportAssetFromSignedUrl': importAssetFromSignedUrl,
      if (importAssetsFromS3 != null) 'ImportAssetsFromS3': importAssetsFromS3,
    };
  }
}

/// The destination where the assets in the revision will be exported.
class RevisionDestinationEntry {
  /// The S3 bucket that is the destination for the assets in the revision.
  final String bucket;

  /// The unique identifier for the revision.
  final String revisionId;

  /// A string representing the pattern for generated names of the individual
  /// assets in the revision. For more information about key patterns, see <a
  /// href="https://docs.aws.amazon.com/data-exchange/latest/userguide/jobs.html#revision-export-keypatterns">Key
  /// patterns when exporting revisions</a>.
  final String? keyPattern;

  RevisionDestinationEntry({
    required this.bucket,
    required this.revisionId,
    this.keyPattern,
  });

  factory RevisionDestinationEntry.fromJson(Map<String, dynamic> json) {
    return RevisionDestinationEntry(
      bucket: json['Bucket'] as String,
      revisionId: json['RevisionId'] as String,
      keyPattern: json['KeyPattern'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final revisionId = this.revisionId;
    final keyPattern = this.keyPattern;
    return {
      'Bucket': bucket,
      'RevisionId': revisionId,
      if (keyPattern != null) 'KeyPattern': keyPattern,
    };
  }
}

/// A revision is a container for one or more assets.
class RevisionEntry {
  /// The ARN for the revision.
  final String arn;

  /// The date and time that the revision was created, in ISO 8601 format.
  final DateTime createdAt;

  /// The unique identifier for the data set associated with this revision.
  final String dataSetId;

  /// The unique identifier for the revision.
  final String id;

  /// The date and time that the revision was last updated, in ISO 8601 format.
  final DateTime updatedAt;

  /// An optional comment about the revision.
  final String? comment;

  /// To publish a revision to a data set in a product, the revision must first be
  /// finalized. Finalizing a revision tells AWS Data Exchange that your changes
  /// to the assets in the revision are complete. After it's in this read-only
  /// state, you can publish the revision to your products.
  ///
  /// Finalized revisions can be published through the AWS Data Exchange console
  /// or the AWS Marketplace Catalog API, using the StartChangeSet AWS Marketplace
  /// Catalog API action. When using the API, revisions are uniquely identified by
  /// their ARN.
  final bool? finalized;

  /// The revision ID of the owned revision corresponding to the entitled revision
  /// being viewed. This parameter is returned when a revision owner is viewing
  /// the entitled copy of its owned revision.
  final String? sourceId;

  RevisionEntry({
    required this.arn,
    required this.createdAt,
    required this.dataSetId,
    required this.id,
    required this.updatedAt,
    this.comment,
    this.finalized,
    this.sourceId,
  });

  factory RevisionEntry.fromJson(Map<String, dynamic> json) {
    return RevisionEntry(
      arn: json['Arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] as Object),
      dataSetId: json['DataSetId'] as String,
      id: json['Id'] as String,
      updatedAt: nonNullableTimeStampFromJson(json['UpdatedAt'] as Object),
      comment: json['Comment'] as String?,
      finalized: json['Finalized'] as bool?,
      sourceId: json['SourceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final dataSetId = this.dataSetId;
    final id = this.id;
    final updatedAt = this.updatedAt;
    final comment = this.comment;
    final finalized = this.finalized;
    final sourceId = this.sourceId;
    return {
      'Arn': arn,
      'CreatedAt': iso8601ToJson(createdAt),
      'DataSetId': dataSetId,
      'Id': id,
      'UpdatedAt': iso8601ToJson(updatedAt),
      if (comment != null) 'Comment': comment,
      if (finalized != null) 'Finalized': finalized,
      if (sourceId != null) 'SourceId': sourceId,
    };
  }
}

/// The S3 object that is the asset.
class S3SnapshotAsset {
  /// The size of the S3 object that is the object.
  final double size;

  S3SnapshotAsset({
    required this.size,
  });

  factory S3SnapshotAsset.fromJson(Map<String, dynamic> json) {
    return S3SnapshotAsset(
      size: json['Size'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    final size = this.size;
    return {
      'Size': size,
    };
  }
}

/// The types of encryption supported in export jobs to Amazon S3.
enum ServerSideEncryptionTypes {
  awsKms,
  aes256,
}

extension on ServerSideEncryptionTypes {
  String toValue() {
    switch (this) {
      case ServerSideEncryptionTypes.awsKms:
        return 'aws:kms';
      case ServerSideEncryptionTypes.aes256:
        return 'AES256';
    }
  }
}

extension on String {
  ServerSideEncryptionTypes toServerSideEncryptionTypes() {
    switch (this) {
      case 'aws:kms':
        return ServerSideEncryptionTypes.awsKms;
      case 'AES256':
        return ServerSideEncryptionTypes.aes256;
    }
    throw Exception('$this is not known in enum ServerSideEncryptionTypes');
  }
}

class StartJobResponse {
  StartJobResponse();

  factory StartJobResponse.fromJson(Map<String, dynamic> _) {
    return StartJobResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum State {
  waiting,
  inProgress,
  error,
  completed,
  cancelled,
  timedOut,
}

extension on State {
  String toValue() {
    switch (this) {
      case State.waiting:
        return 'WAITING';
      case State.inProgress:
        return 'IN_PROGRESS';
      case State.error:
        return 'ERROR';
      case State.completed:
        return 'COMPLETED';
      case State.cancelled:
        return 'CANCELLED';
      case State.timedOut:
        return 'TIMED_OUT';
    }
  }
}

extension on String {
  State toState() {
    switch (this) {
      case 'WAITING':
        return State.waiting;
      case 'IN_PROGRESS':
        return State.inProgress;
      case 'ERROR':
        return State.error;
      case 'COMPLETED':
        return State.completed;
      case 'CANCELLED':
        return State.cancelled;
      case 'TIMED_OUT':
        return State.timedOut;
    }
    throw Exception('$this is not known in enum State');
  }
}

enum Type {
  importAssetsFromS3,
  importAssetFromSignedUrl,
  exportAssetsToS3,
  exportAssetToSignedUrl,
  exportRevisionsToS3,
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
      case Type.exportRevisionsToS3:
        return 'EXPORT_REVISIONS_TO_S3';
    }
  }
}

extension on String {
  Type toType() {
    switch (this) {
      case 'IMPORT_ASSETS_FROM_S3':
        return Type.importAssetsFromS3;
      case 'IMPORT_ASSET_FROM_SIGNED_URL':
        return Type.importAssetFromSignedUrl;
      case 'EXPORT_ASSETS_TO_S3':
        return Type.exportAssetsToS3;
      case 'EXPORT_ASSET_TO_SIGNED_URL':
        return Type.exportAssetToSignedUrl;
      case 'EXPORT_REVISIONS_TO_S3':
        return Type.exportRevisionsToS3;
    }
    throw Exception('$this is not known in enum Type');
  }
}

class UpdateAssetResponse {
  /// The ARN for the asset.
  final String? arn;

  /// Information about the asset, including its size.
  final AssetDetails? assetDetails;

  /// The type of file your data is stored in. Currently, the supported asset type
  /// is S3_SNAPSHOT.
  final AssetType? assetType;

  /// The date and time that the asset was created, in ISO 8601 format.
  final DateTime? createdAt;

  /// The unique identifier for the data set associated with this asset.
  final String? dataSetId;

  /// The unique identifier for the asset.
  final String? id;

  /// The name of the asset When importing from Amazon S3, the S3 object key is
  /// used as the asset name. When exporting to Amazon S3, the asset name is used
  /// as default target S3 object key.
  final String? name;

  /// The unique identifier for the revision associated with this asset.
  final String? revisionId;

  /// The asset ID of the owned asset corresponding to the entitled asset being
  /// viewed. This parameter is returned when an asset owner is viewing the
  /// entitled copy of its owned asset.
  final String? sourceId;

  /// The date and time that the asset was last updated, in ISO 8601 format.
  final DateTime? updatedAt;

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

  factory UpdateAssetResponse.fromJson(Map<String, dynamic> json) {
    return UpdateAssetResponse(
      arn: json['Arn'] as String?,
      assetDetails: json['AssetDetails'] != null
          ? AssetDetails.fromJson(json['AssetDetails'] as Map<String, dynamic>)
          : null,
      assetType: (json['AssetType'] as String?)?.toAssetType(),
      createdAt: timeStampFromJson(json['CreatedAt']),
      dataSetId: json['DataSetId'] as String?,
      id: json['Id'] as String?,
      name: json['Name'] as String?,
      revisionId: json['RevisionId'] as String?,
      sourceId: json['SourceId'] as String?,
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final assetDetails = this.assetDetails;
    final assetType = this.assetType;
    final createdAt = this.createdAt;
    final dataSetId = this.dataSetId;
    final id = this.id;
    final name = this.name;
    final revisionId = this.revisionId;
    final sourceId = this.sourceId;
    final updatedAt = this.updatedAt;
    return {
      if (arn != null) 'Arn': arn,
      if (assetDetails != null) 'AssetDetails': assetDetails,
      if (assetType != null) 'AssetType': assetType.toValue(),
      if (createdAt != null) 'CreatedAt': iso8601ToJson(createdAt),
      if (dataSetId != null) 'DataSetId': dataSetId,
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (revisionId != null) 'RevisionId': revisionId,
      if (sourceId != null) 'SourceId': sourceId,
      if (updatedAt != null) 'UpdatedAt': iso8601ToJson(updatedAt),
    };
  }
}

class UpdateDataSetResponse {
  /// The ARN for the data set.
  final String? arn;

  /// The type of file your data is stored in. Currently, the supported asset type
  /// is S3_SNAPSHOT.
  final AssetType? assetType;

  /// The date and time that the data set was created, in ISO 8601 format.
  final DateTime? createdAt;

  /// The description for the data set.
  final String? description;

  /// The unique identifier for the data set.
  final String? id;

  /// The name of the data set.
  final String? name;

  /// A property that defines the data set as OWNED by the account (for providers)
  /// or ENTITLED to the account (for subscribers).
  final Origin? origin;

  /// If the origin of this data set is ENTITLED, includes the details for the
  /// product on AWS Marketplace.
  final OriginDetails? originDetails;

  /// The data set ID of the owned data set corresponding to the entitled data set
  /// being viewed. This parameter is returned when a data set owner is viewing
  /// the entitled copy of its owned data set.
  final String? sourceId;

  /// The date and time that the data set was last updated, in ISO 8601 format.
  final DateTime? updatedAt;

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

  factory UpdateDataSetResponse.fromJson(Map<String, dynamic> json) {
    return UpdateDataSetResponse(
      arn: json['Arn'] as String?,
      assetType: (json['AssetType'] as String?)?.toAssetType(),
      createdAt: timeStampFromJson(json['CreatedAt']),
      description: json['Description'] as String?,
      id: json['Id'] as String?,
      name: json['Name'] as String?,
      origin: (json['Origin'] as String?)?.toOrigin(),
      originDetails: json['OriginDetails'] != null
          ? OriginDetails.fromJson(
              json['OriginDetails'] as Map<String, dynamic>)
          : null,
      sourceId: json['SourceId'] as String?,
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final assetType = this.assetType;
    final createdAt = this.createdAt;
    final description = this.description;
    final id = this.id;
    final name = this.name;
    final origin = this.origin;
    final originDetails = this.originDetails;
    final sourceId = this.sourceId;
    final updatedAt = this.updatedAt;
    return {
      if (arn != null) 'Arn': arn,
      if (assetType != null) 'AssetType': assetType.toValue(),
      if (createdAt != null) 'CreatedAt': iso8601ToJson(createdAt),
      if (description != null) 'Description': description,
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (origin != null) 'Origin': origin.toValue(),
      if (originDetails != null) 'OriginDetails': originDetails,
      if (sourceId != null) 'SourceId': sourceId,
      if (updatedAt != null) 'UpdatedAt': iso8601ToJson(updatedAt),
    };
  }
}

class UpdateRevisionResponse {
  /// The ARN for the revision.
  final String? arn;

  /// An optional comment about the revision.
  final String? comment;

  /// The date and time that the revision was created, in ISO 8601 format.
  final DateTime? createdAt;

  /// The unique identifier for the data set associated with this revision.
  final String? dataSetId;

  /// To publish a revision to a data set in a product, the revision must first be
  /// finalized. Finalizing a revision tells AWS Data Exchange that changes to the
  /// assets in the revision are complete. After it's in this read-only state, you
  /// can publish the revision to your products.
  ///
  /// Finalized revisions can be published through the AWS Data Exchange console
  /// or the AWS Marketplace Catalog API, using the StartChangeSet AWS Marketplace
  /// Catalog API action. When using the API, revisions are uniquely identified by
  /// their ARN.
  final bool? finalized;

  /// The unique identifier for the revision.
  final String? id;

  /// The revision ID of the owned revision corresponding to the entitled revision
  /// being viewed. This parameter is returned when a revision owner is viewing
  /// the entitled copy of its owned revision.
  final String? sourceId;

  /// The date and time that the revision was last updated, in ISO 8601 format.
  final DateTime? updatedAt;

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

  factory UpdateRevisionResponse.fromJson(Map<String, dynamic> json) {
    return UpdateRevisionResponse(
      arn: json['Arn'] as String?,
      comment: json['Comment'] as String?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      dataSetId: json['DataSetId'] as String?,
      finalized: json['Finalized'] as bool?,
      id: json['Id'] as String?,
      sourceId: json['SourceId'] as String?,
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final comment = this.comment;
    final createdAt = this.createdAt;
    final dataSetId = this.dataSetId;
    final finalized = this.finalized;
    final id = this.id;
    final sourceId = this.sourceId;
    final updatedAt = this.updatedAt;
    return {
      if (arn != null) 'Arn': arn,
      if (comment != null) 'Comment': comment,
      if (createdAt != null) 'CreatedAt': iso8601ToJson(createdAt),
      if (dataSetId != null) 'DataSetId': dataSetId,
      if (finalized != null) 'Finalized': finalized,
      if (id != null) 'Id': id,
      if (sourceId != null) 'SourceId': sourceId,
      if (updatedAt != null) 'UpdatedAt': iso8601ToJson(updatedAt),
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

class ServiceLimitExceededException extends _s.GenericAwsException {
  ServiceLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceLimitExceededException',
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
  'ServiceLimitExceededException': (type, message) =>
      ServiceLimitExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
