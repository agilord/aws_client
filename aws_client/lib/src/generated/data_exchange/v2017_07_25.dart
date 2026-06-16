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

/// AWS Data Exchange is a service that makes it easy for AWS customers to
/// exchange data in the cloud. You can use the AWS Data Exchange APIs to
/// create, update, manage, and access file-based data set in the AWS Cloud.
///
/// As a subscriber, you can view and access the data sets that you have an
/// entitlement to through a subscription. You can use the APIs to download or
/// copy your entitled data sets to Amazon Simple Storage Service (Amazon S3)
/// for use across a variety of AWS analytics and machine learning services.
///
/// As a provider, you can create and manage your data sets that you would like
/// to publish to a product. Being able to package and provide your data sets
/// into products requires a few steps to determine eligibility. For more
/// information, visit the <i>AWS Data Exchange User Guide</i>.
///
/// A data set is a collection of data that can be changed or updated over time.
/// Data sets can be updated using revisions, which represent a new version or
/// incremental change to a data set. A revision contains one or more assets. An
/// asset in AWS Data Exchange is a piece of data that can be stored as an
/// Amazon S3 object, Redshift datashare, API Gateway API, AWS Lake Formation
/// data permission, or Amazon S3 data access. The asset can be a structured
/// data file, an image file, or some other data file. Jobs are asynchronous
/// import or export operations used to create or copy assets.
class DataExchange {
  final _s.RestJsonProtocol _protocol;
  DataExchange({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'dataexchange',
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

  /// This operation accepts a data grant.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [dataGrantArn] :
  /// The Amazon Resource Name (ARN) of the data grant to accept.
  Future<AcceptDataGrantResponse> acceptDataGrant({
    required String dataGrantArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/v1/data-grants/${Uri.encodeComponent(dataGrantArn)}/accept',
      exceptionFnMap: _exceptionFns,
    );
    return AcceptDataGrantResponse.fromJson(response);
  }

  /// This operation cancels a job. Jobs can be cancelled only when they are in
  /// the WAITING state.
  ///
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [jobId] :
  /// The unique identifier for a job.
  Future<void> cancelJob({
    required String jobId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/jobs/${Uri.encodeComponent(jobId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This operation creates a data grant.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceLimitExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [grantDistributionScope] :
  /// The distribution scope of the data grant.
  ///
  /// Parameter [name] :
  /// The name of the data grant.
  ///
  /// Parameter [receiverPrincipal] :
  /// The Amazon Web Services account ID of the data grant receiver.
  ///
  /// Parameter [sourceDataSetId] :
  /// The ID of the data set used to create the data grant.
  ///
  /// Parameter [description] :
  /// The description of the data grant.
  ///
  /// Parameter [endsAt] :
  /// The timestamp of when access to the associated data set ends.
  ///
  /// Parameter [tags] :
  /// The tags to add to the data grant. A tag is a key-value pair.
  Future<CreateDataGrantResponse> createDataGrant({
    required GrantDistributionScope grantDistributionScope,
    required String name,
    required String receiverPrincipal,
    required String sourceDataSetId,
    String? description,
    DateTime? endsAt,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'GrantDistributionScope': grantDistributionScope.value,
      'Name': name,
      'ReceiverPrincipal': receiverPrincipal,
      'SourceDataSetId': sourceDataSetId,
      if (description != null) 'Description': description,
      if (endsAt != null) 'EndsAt': iso8601ToJson(endsAt),
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/data-grants',
      exceptionFnMap: _exceptionFns,
    );
    return CreateDataGrantResponse.fromJson(response);
  }

  /// This operation creates a data set.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceLimitExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [assetType] :
  /// The type of asset that is added to a data set.
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
    final $payload = <String, dynamic>{
      'AssetType': assetType.value,
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

  /// This operation creates an event action.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceLimitExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [action] :
  /// What occurs after a certain event.
  ///
  /// Parameter [event] :
  /// What occurs to start an action.
  ///
  /// Parameter [tags] :
  /// Key-value pairs that you can associate with the event action.
  Future<CreateEventActionResponse> createEventAction({
    required Action action,
    required Event event,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'Action': action,
      'Event': event,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/event-actions',
      exceptionFnMap: _exceptionFns,
    );
    return CreateEventActionResponse.fromJson(response);
  }

  /// This operation creates a job.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [details] :
  /// The details for the CreateJob request.
  ///
  /// Parameter [type] :
  /// The type of job to be created.
  ///
  /// Parameter [assetConfiguration] :
  /// The configuration for the asset, including tags to be applied to assets
  /// created by the job.
  Future<CreateJobResponse> createJob({
    required RequestDetails details,
    required Type type,
    AssetConfiguration? assetConfiguration,
  }) async {
    final $payload = <String, dynamic>{
      'Details': details,
      'Type': type.value,
      if (assetConfiguration != null) 'AssetConfiguration': assetConfiguration,
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
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v1/data-sets/${Uri.encodeComponent(dataSetId)}/revisions/${Uri.encodeComponent(revisionId)}/assets/${Uri.encodeComponent(assetId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This operation deletes a data grant.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [dataGrantId] :
  /// The ID of the data grant to delete.
  Future<void> deleteDataGrant({
    required String dataGrantId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/data-grants/${Uri.encodeComponent(dataGrantId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This operation deletes a data set.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [dataSetId] :
  /// The unique identifier for a data set.
  Future<void> deleteDataSet({
    required String dataSetId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/data-sets/${Uri.encodeComponent(dataSetId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This operation deletes the event action.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [eventActionId] :
  /// The unique identifier for the event action.
  Future<void> deleteEventAction({
    required String eventActionId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/event-actions/${Uri.encodeComponent(eventActionId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This operation deletes a revision.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/data-sets/${Uri.encodeComponent(dataSetId)}/revisions/${Uri.encodeComponent(revisionId)}/assets/${Uri.encodeComponent(assetId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetAssetResponse.fromJson(response);
  }

  /// This operation returns information about a data grant.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [dataGrantId] :
  /// The ID of the data grant.
  Future<GetDataGrantResponse> getDataGrant({
    required String dataGrantId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/data-grants/${Uri.encodeComponent(dataGrantId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetDataGrantResponse.fromJson(response);
  }

  /// This operation returns information about a data set.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [dataSetId] :
  /// The unique identifier for a data set.
  Future<GetDataSetResponse> getDataSet({
    required String dataSetId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/data-sets/${Uri.encodeComponent(dataSetId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetDataSetResponse.fromJson(response);
  }

  /// This operation retrieves information about an event action.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [eventActionId] :
  /// The unique identifier for the event action.
  Future<GetEventActionResponse> getEventAction({
    required String eventActionId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/event-actions/${Uri.encodeComponent(eventActionId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetEventActionResponse.fromJson(response);
  }

  /// This operation returns information about a job.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [jobId] :
  /// The unique identifier for a job.
  Future<GetJobResponse> getJob({
    required String jobId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/jobs/${Uri.encodeComponent(jobId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetJobResponse.fromJson(response);
  }

  /// This operation returns information about a received data grant.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [dataGrantArn] :
  /// The Amazon Resource Name (ARN) of the data grant.
  Future<GetReceivedDataGrantResponse> getReceivedDataGrant({
    required String dataGrantArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/received-data-grants/${Uri.encodeComponent(dataGrantArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetReceivedDataGrantResponse.fromJson(response);
  }

  /// This operation returns information about a revision.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/data-sets/${Uri.encodeComponent(dataSetId)}/revisions/${Uri.encodeComponent(revisionId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetRevisionResponse.fromJson(response);
  }

  /// This operation returns information about all data grants.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be included in the next page.
  ///
  /// Parameter [nextToken] :
  /// The pagination token used to retrieve the next page of results for this
  /// operation.
  Future<ListDataGrantsResponse> listDataGrants({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      200,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/data-grants',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDataGrantsResponse.fromJson(response);
  }

  /// This operation lists a data set's revisions sorted by CreatedAt in
  /// descending order.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      200,
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
  /// ENTITLED, there is no order.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
      200,
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

  /// This operation lists your event actions.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [eventSourceId] :
  /// The unique identifier for the event source.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results returned by a single call.
  ///
  /// Parameter [nextToken] :
  /// The token value retrieved from a previous call to access the next page of
  /// results.
  Future<ListEventActionsResponse> listEventActions({
    String? eventSourceId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      200,
    );
    final $query = <String, List<String>>{
      if (eventSourceId != null) 'eventSourceId': [eventSourceId],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/event-actions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListEventActionsResponse.fromJson(response);
  }

  /// This operation lists your jobs sorted by CreatedAt in descending order.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
      200,
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

  /// This operation returns information about all received data grants.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [acceptanceState] :
  /// The acceptance state of the data grants to list.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be included in the next page.
  ///
  /// Parameter [nextToken] :
  /// The pagination token used to retrieve the next page of results for this
  /// operation.
  Future<ListReceivedDataGrantsResponse> listReceivedDataGrants({
    List<AcceptanceStateFilterValue>? acceptanceState,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      200,
    );
    final $query = <String, List<String>>{
      if (acceptanceState != null)
        'acceptanceState': acceptanceState.map((e) => e.value).toList(),
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/received-data-grants',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListReceivedDataGrantsResponse.fromJson(response);
  }

  /// This operation lists a revision's assets sorted alphabetically in
  /// descending order.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      200,
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
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// This operation revokes subscribers' access to a revision.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [dataSetId] :
  /// The unique identifier for a data set.
  ///
  /// Parameter [revisionId] :
  /// The unique identifier for a revision.
  ///
  /// Parameter [revocationComment] :
  /// A required comment to inform subscribers of the reason their access to the
  /// revision was revoked.
  Future<RevokeRevisionResponse> revokeRevision({
    required String dataSetId,
    required String revisionId,
    required String revocationComment,
  }) async {
    final $payload = <String, dynamic>{
      'RevocationComment': revocationComment,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v1/data-sets/${Uri.encodeComponent(dataSetId)}/revisions/${Uri.encodeComponent(revisionId)}/revoke',
      exceptionFnMap: _exceptionFns,
    );
    return RevokeRevisionResponse.fromJson(response);
  }

  /// This operation invokes an API Gateway API asset. The request is proxied to
  /// the provider’s API Gateway API.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [assetId] :
  /// Asset ID value for the API request.
  ///
  /// Parameter [dataSetId] :
  /// Data set ID value for the API request.
  ///
  /// Parameter [revisionId] :
  /// Revision ID value for the API request.
  ///
  /// Parameter [body] :
  /// The request body.
  ///
  /// Parameter [method] :
  /// HTTP method value for the API request. Alternatively, you can use the
  /// appropriate verb in your request.
  ///
  /// Parameter [path] :
  /// URI path value for the API request. Alternatively, you can set the URI
  /// path directly by invoking /v1/{pathValue}.
  ///
  /// Parameter [queryStringParameters] :
  /// Attach query string parameters to the end of the URI (for example,
  /// /v1/examplePath?exampleParam=exampleValue).
  ///
  /// Parameter [requestHeaders] :
  /// Any header value prefixed with x-amzn-dataexchange-header- will have that
  /// stripped before sending the Asset API request. Use this when you want to
  /// override a header that AWS Data Exchange uses. Alternatively, you can use
  /// the header without a prefix to the HTTP request.
  Future<SendApiAssetResponse> sendApiAsset({
    required String assetId,
    required String dataSetId,
    required String revisionId,
    String? body,
    String? method,
    String? path,
    Map<String, String>? queryStringParameters,
    Map<String, String>? requestHeaders,
  }) async {
    final headers = <String, String>{
      'x-amzn-dataexchange-asset-id': assetId.toString(),
      'x-amzn-dataexchange-data-set-id': dataSetId.toString(),
      'x-amzn-dataexchange-revision-id': revisionId.toString(),
      if (method != null) 'x-amzn-dataexchange-http-method': method.toString(),
      if (path != null) 'x-amzn-dataexchange-path': path.toString(),
      if (requestHeaders != null)
        ...requestHeaders.map(
            (key, value) => MapEntry('x-amzn-dataexchange-header-$key', value)),
    };
    final response = await _protocol.sendRaw(
      payload: body,
      method: 'POST',
      requestUri: '/v1',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return SendApiAssetResponse(
      body: jsonEncode($json),
      responseHeaders: _s.extractHeaderMapValues(response.headers, ''),
    );
  }

  /// The type of event associated with the data set.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [dataSetId] :
  /// Affected data set of the notification.
  ///
  /// Parameter [type] :
  /// The type of the notification. Describing the kind of event the
  /// notification is alerting you to.
  ///
  /// Parameter [clientToken] :
  /// Idempotency key for the notification, this key allows us to deduplicate
  /// notifications that are sent in quick succession erroneously.
  ///
  /// Parameter [comment] :
  /// Free-form text field for providers to add information about their
  /// notifications.
  ///
  /// Parameter [details] :
  /// Extra details specific to this notification type.
  ///
  /// Parameter [scope] :
  /// Affected scope of this notification such as the underlying resources
  /// affected by the notification event.
  Future<void> sendDataSetNotification({
    required String dataSetId,
    required NotificationType type,
    String? clientToken,
    String? comment,
    NotificationDetails? details,
    ScopeDetails? scope,
  }) async {
    final $payload = <String, dynamic>{
      'Type': type.value,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (comment != null) 'Comment': comment,
      if (details != null) 'Details': details,
      if (scope != null) 'Scope': scope,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v1/data-sets/${Uri.encodeComponent(dataSetId)}/notification',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This operation starts a job.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [jobId] :
  /// The unique identifier for a job.
  Future<void> startJob({
    required String jobId,
  }) async {
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
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [assetId] :
  /// The unique identifier for an asset.
  ///
  /// Parameter [dataSetId] :
  /// The unique identifier for a data set.
  ///
  /// Parameter [name] :
  /// The name of the asset. When importing from Amazon S3, the Amazon S3 object
  /// key is used as the asset name. When exporting to Amazon S3, the asset name
  /// is used as default target Amazon S3 object key. When importing from Amazon
  /// API Gateway API, the API name is used as the asset name. When importing
  /// from Amazon Redshift, the datashare name is used as the asset name. When
  /// importing from AWS Lake Formation, the static values of "Database(s)
  /// included in the LF-tag policy" or "Table(s) included in LF-tag policy" are
  /// used as the name.
  ///
  /// Parameter [revisionId] :
  /// The unique identifier for a revision.
  Future<UpdateAssetResponse> updateAsset({
    required String assetId,
    required String dataSetId,
    required String name,
    required String revisionId,
  }) async {
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
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// This operation updates the event action.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [eventActionId] :
  /// The unique identifier for the event action.
  ///
  /// Parameter [action] :
  /// What occurs after a certain event.
  Future<UpdateEventActionResponse> updateEventAction({
    required String eventActionId,
    Action? action,
  }) async {
    final $payload = <String, dynamic>{
      if (action != null) 'Action': action,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/v1/event-actions/${Uri.encodeComponent(eventActionId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateEventActionResponse.fromJson(response);
  }

  /// This operation updates a revision.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

class AcceptDataGrantResponse {
  /// The acceptance state of the data grant.
  final DataGrantAcceptanceState acceptanceState;

  /// The Amazon Resource Name (ARN) of the accepted data grant.
  final String arn;

  /// The timestamp of when the data grant was created.
  final DateTime createdAt;

  /// The ID of the data set associated to the data grant.
  final String dataSetId;

  /// The distribution scope for the data grant.
  final GrantDistributionScope grantDistributionScope;

  /// The ID of the data grant.
  final String id;

  /// The name of the accepted data grant.
  final String name;

  /// The Amazon Web Services account ID of the data grant receiver.
  final String receiverPrincipal;

  /// The timestamp of when the data grant was last updated.
  final DateTime updatedAt;

  /// The timestamp of when the data grant was accepted.
  final DateTime? acceptedAt;

  /// The description of the accepted data grant.
  final String? description;

  /// The timestamp of when access to the associated data set ends.
  final DateTime? endsAt;

  /// The Amazon Web Services account ID of the data grant sender.
  final String? senderPrincipal;

  AcceptDataGrantResponse({
    required this.acceptanceState,
    required this.arn,
    required this.createdAt,
    required this.dataSetId,
    required this.grantDistributionScope,
    required this.id,
    required this.name,
    required this.receiverPrincipal,
    required this.updatedAt,
    this.acceptedAt,
    this.description,
    this.endsAt,
    this.senderPrincipal,
  });

  factory AcceptDataGrantResponse.fromJson(Map<String, dynamic> json) {
    return AcceptDataGrantResponse(
      acceptanceState: DataGrantAcceptanceState.fromString(
          (json['AcceptanceState'] as String?) ?? ''),
      arn: (json['Arn'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] ?? 0),
      dataSetId: (json['DataSetId'] as String?) ?? '',
      grantDistributionScope: GrantDistributionScope.fromString(
          (json['GrantDistributionScope'] as String?) ?? ''),
      id: (json['Id'] as String?) ?? '',
      name: (json['Name'] as String?) ?? '',
      receiverPrincipal: (json['ReceiverPrincipal'] as String?) ?? '',
      updatedAt: nonNullableTimeStampFromJson(json['UpdatedAt'] ?? 0),
      acceptedAt: timeStampFromJson(json['AcceptedAt']),
      description: json['Description'] as String?,
      endsAt: timeStampFromJson(json['EndsAt']),
      senderPrincipal: json['SenderPrincipal'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final acceptanceState = this.acceptanceState;
    final arn = this.arn;
    final createdAt = this.createdAt;
    final dataSetId = this.dataSetId;
    final grantDistributionScope = this.grantDistributionScope;
    final id = this.id;
    final name = this.name;
    final receiverPrincipal = this.receiverPrincipal;
    final updatedAt = this.updatedAt;
    final acceptedAt = this.acceptedAt;
    final description = this.description;
    final endsAt = this.endsAt;
    final senderPrincipal = this.senderPrincipal;
    return {
      'AcceptanceState': acceptanceState.value,
      'Arn': arn,
      'CreatedAt': iso8601ToJson(createdAt),
      'DataSetId': dataSetId,
      'GrantDistributionScope': grantDistributionScope.value,
      'Id': id,
      'Name': name,
      'ReceiverPrincipal': receiverPrincipal,
      'UpdatedAt': iso8601ToJson(updatedAt),
      if (acceptedAt != null) 'AcceptedAt': iso8601ToJson(acceptedAt),
      if (description != null) 'Description': description,
      if (endsAt != null) 'EndsAt': iso8601ToJson(endsAt),
      if (senderPrincipal != null) 'SenderPrincipal': senderPrincipal,
    };
  }
}

class CreateDataGrantResponse {
  /// The acceptance state of the data grant.
  final DataGrantAcceptanceState acceptanceState;

  /// The Amazon Resource Name (ARN) of the data grant.
  final String arn;

  /// The timestamp of when the data grant was created.
  final DateTime createdAt;

  /// The ID of the data set associated to the data grant.
  final String dataSetId;

  /// The distribution scope for the data grant.
  final GrantDistributionScope grantDistributionScope;

  /// The ID of the data grant.
  final String id;

  /// The name of the data grant.
  final String name;

  /// The Amazon Web Services account ID of the data grant receiver.
  final String receiverPrincipal;

  /// The Amazon Web Services account ID of the data grant sender.
  final String senderPrincipal;

  /// The ID of the data set used to create the data grant.
  final String sourceDataSetId;

  /// The timestamp of when the data grant was last updated.
  final DateTime updatedAt;

  /// The timestamp of when the data grant was accepted.
  final DateTime? acceptedAt;

  /// The description of the data grant.
  final String? description;

  /// The timestamp of when access to the associated data set ends.
  final DateTime? endsAt;

  /// The tags associated to the data grant. A tag is a key-value pair.
  final Map<String, String>? tags;

  CreateDataGrantResponse({
    required this.acceptanceState,
    required this.arn,
    required this.createdAt,
    required this.dataSetId,
    required this.grantDistributionScope,
    required this.id,
    required this.name,
    required this.receiverPrincipal,
    required this.senderPrincipal,
    required this.sourceDataSetId,
    required this.updatedAt,
    this.acceptedAt,
    this.description,
    this.endsAt,
    this.tags,
  });

  factory CreateDataGrantResponse.fromJson(Map<String, dynamic> json) {
    return CreateDataGrantResponse(
      acceptanceState: DataGrantAcceptanceState.fromString(
          (json['AcceptanceState'] as String?) ?? ''),
      arn: (json['Arn'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] ?? 0),
      dataSetId: (json['DataSetId'] as String?) ?? '',
      grantDistributionScope: GrantDistributionScope.fromString(
          (json['GrantDistributionScope'] as String?) ?? ''),
      id: (json['Id'] as String?) ?? '',
      name: (json['Name'] as String?) ?? '',
      receiverPrincipal: (json['ReceiverPrincipal'] as String?) ?? '',
      senderPrincipal: (json['SenderPrincipal'] as String?) ?? '',
      sourceDataSetId: (json['SourceDataSetId'] as String?) ?? '',
      updatedAt: nonNullableTimeStampFromJson(json['UpdatedAt'] ?? 0),
      acceptedAt: timeStampFromJson(json['AcceptedAt']),
      description: json['Description'] as String?,
      endsAt: timeStampFromJson(json['EndsAt']),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final acceptanceState = this.acceptanceState;
    final arn = this.arn;
    final createdAt = this.createdAt;
    final dataSetId = this.dataSetId;
    final grantDistributionScope = this.grantDistributionScope;
    final id = this.id;
    final name = this.name;
    final receiverPrincipal = this.receiverPrincipal;
    final senderPrincipal = this.senderPrincipal;
    final sourceDataSetId = this.sourceDataSetId;
    final updatedAt = this.updatedAt;
    final acceptedAt = this.acceptedAt;
    final description = this.description;
    final endsAt = this.endsAt;
    final tags = this.tags;
    return {
      'AcceptanceState': acceptanceState.value,
      'Arn': arn,
      'CreatedAt': iso8601ToJson(createdAt),
      'DataSetId': dataSetId,
      'GrantDistributionScope': grantDistributionScope.value,
      'Id': id,
      'Name': name,
      'ReceiverPrincipal': receiverPrincipal,
      'SenderPrincipal': senderPrincipal,
      'SourceDataSetId': sourceDataSetId,
      'UpdatedAt': iso8601ToJson(updatedAt),
      if (acceptedAt != null) 'AcceptedAt': iso8601ToJson(acceptedAt),
      if (description != null) 'Description': description,
      if (endsAt != null) 'EndsAt': iso8601ToJson(endsAt),
      if (tags != null) 'Tags': tags,
    };
  }
}

class CreateDataSetResponse {
  /// The ARN for the data set.
  final String? arn;

  /// The type of asset that is added to a data set.
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
      assetType: (json['AssetType'] as String?)?.let(AssetType.fromString),
      createdAt: timeStampFromJson(json['CreatedAt']),
      description: json['Description'] as String?,
      id: json['Id'] as String?,
      name: json['Name'] as String?,
      origin: (json['Origin'] as String?)?.let(Origin.fromString),
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
      if (assetType != null) 'AssetType': assetType.value,
      if (createdAt != null) 'CreatedAt': iso8601ToJson(createdAt),
      if (description != null) 'Description': description,
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (origin != null) 'Origin': origin.value,
      if (originDetails != null) 'OriginDetails': originDetails,
      if (sourceId != null) 'SourceId': sourceId,
      if (tags != null) 'Tags': tags,
      if (updatedAt != null) 'UpdatedAt': iso8601ToJson(updatedAt),
    };
  }
}

class CreateEventActionResponse {
  /// What occurs after a certain event.
  final Action? action;

  /// The ARN for the event action.
  final String? arn;

  /// The date and time that the event action was created, in ISO 8601 format.
  final DateTime? createdAt;

  /// What occurs to start an action.
  final Event? event;

  /// The unique identifier for the event action.
  final String? id;

  /// The tags for the event action.
  final Map<String, String>? tags;

  /// The date and time that the event action was last updated, in ISO 8601
  /// format.
  final DateTime? updatedAt;

  CreateEventActionResponse({
    this.action,
    this.arn,
    this.createdAt,
    this.event,
    this.id,
    this.tags,
    this.updatedAt,
  });

  factory CreateEventActionResponse.fromJson(Map<String, dynamic> json) {
    return CreateEventActionResponse(
      action: json['Action'] != null
          ? Action.fromJson(json['Action'] as Map<String, dynamic>)
          : null,
      arn: json['Arn'] as String?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      event: json['Event'] != null
          ? Event.fromJson(json['Event'] as Map<String, dynamic>)
          : null,
      id: json['Id'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final arn = this.arn;
    final createdAt = this.createdAt;
    final event = this.event;
    final id = this.id;
    final tags = this.tags;
    final updatedAt = this.updatedAt;
    return {
      if (action != null) 'Action': action,
      if (arn != null) 'Arn': arn,
      if (createdAt != null) 'CreatedAt': iso8601ToJson(createdAt),
      if (event != null) 'Event': event,
      if (id != null) 'Id': id,
      if (tags != null) 'Tags': tags,
      if (updatedAt != null) 'UpdatedAt': iso8601ToJson(updatedAt),
    };
  }
}

class CreateJobResponse {
  /// The ARN for the job.
  final String? arn;

  /// The configuration for the asset, including tags applied to assets created by
  /// the job.
  final AssetConfiguration? assetConfiguration;

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
    this.assetConfiguration,
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
      assetConfiguration: json['AssetConfiguration'] != null
          ? AssetConfiguration.fromJson(
              json['AssetConfiguration'] as Map<String, dynamic>)
          : null,
      createdAt: timeStampFromJson(json['CreatedAt']),
      details: json['Details'] != null
          ? ResponseDetails.fromJson(json['Details'] as Map<String, dynamic>)
          : null,
      errors: (json['Errors'] as List?)
          ?.nonNulls
          .map((e) => JobError.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['Id'] as String?,
      state: (json['State'] as String?)?.let(State.fromString),
      type: (json['Type'] as String?)?.let(Type.fromString),
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final assetConfiguration = this.assetConfiguration;
    final createdAt = this.createdAt;
    final details = this.details;
    final errors = this.errors;
    final id = this.id;
    final state = this.state;
    final type = this.type;
    final updatedAt = this.updatedAt;
    return {
      if (arn != null) 'Arn': arn,
      if (assetConfiguration != null) 'AssetConfiguration': assetConfiguration,
      if (createdAt != null) 'CreatedAt': iso8601ToJson(createdAt),
      if (details != null) 'Details': details,
      if (errors != null) 'Errors': errors,
      if (id != null) 'Id': id,
      if (state != null) 'State': state.value,
      if (type != null) 'Type': type.value,
      if (updatedAt != null) 'UpdatedAt': iso8601ToJson(updatedAt),
    };
  }
}

class CreateRevisionResponse {
  /// The ARN for the revision.
  final String? arn;

  /// An optional comment about the revision.
  final String? comment;

  /// The date and time that the revision was created, in ISO 8601 format.
  final DateTime? createdAt;

  /// The unique identifier for the data set associated with the data set
  /// revision.
  final String? dataSetId;

  /// To publish a revision to a data set in a product, the revision must first be
  /// finalized. Finalizing a revision tells AWS Data Exchange that your changes
  /// to the assets in the revision are complete. After it's in this read-only
  /// state, you can publish the revision to your products. Finalized revisions
  /// can be published through the AWS Data Exchange console or the AWS
  /// Marketplace Catalog API, using the StartChangeSet AWS Marketplace Catalog
  /// API action. When using the API, revisions are uniquely identified by their
  /// ARN.
  final bool? finalized;

  /// The unique identifier for the revision.
  final String? id;

  /// A required comment to inform subscribers of the reason their access to the
  /// revision was revoked.
  final String? revocationComment;

  /// A status indicating that subscribers' access to the revision was revoked.
  final bool? revoked;

  /// The date and time that the revision was revoked, in ISO 8601 format.
  final DateTime? revokedAt;

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
    this.revocationComment,
    this.revoked,
    this.revokedAt,
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
      revocationComment: json['RevocationComment'] as String?,
      revoked: json['Revoked'] as bool?,
      revokedAt: timeStampFromJson(json['RevokedAt']),
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
    final revocationComment = this.revocationComment;
    final revoked = this.revoked;
    final revokedAt = this.revokedAt;
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
      if (revocationComment != null) 'RevocationComment': revocationComment,
      if (revoked != null) 'Revoked': revoked,
      if (revokedAt != null) 'RevokedAt': iso8601ToJson(revokedAt),
      if (sourceId != null) 'SourceId': sourceId,
      if (tags != null) 'Tags': tags,
      if (updatedAt != null) 'UpdatedAt': iso8601ToJson(updatedAt),
    };
  }
}

class GetAssetResponse {
  /// The ARN for the asset.
  final String? arn;

  /// Details about the asset.
  final AssetDetails? assetDetails;

  /// The type of asset that is added to a data set.
  final AssetType? assetType;

  /// The date and time that the asset was created, in ISO 8601 format.
  final DateTime? createdAt;

  /// The unique identifier for the data set associated with this asset.
  final String? dataSetId;

  /// The unique identifier for the asset.
  final String? id;

  /// The name of the asset. When importing from Amazon S3, the Amazon S3 object
  /// key is used as the asset name. When exporting to Amazon S3, the asset name
  /// is used as default target Amazon S3 object key. When importing from Amazon
  /// API Gateway API, the API name is used as the asset name. When importing from
  /// Amazon Redshift, the datashare name is used as the asset name. When
  /// importing from AWS Lake Formation, the static values of "Database(s)
  /// included in the LF-tag policy" or "Table(s) included in the LF-tag policy"
  /// are used as the asset name.
  final String? name;

  /// The unique identifier for the revision associated with this asset.
  final String? revisionId;

  /// The asset ID of the owned asset corresponding to the entitled asset being
  /// viewed. This parameter is returned when an asset owner is viewing the
  /// entitled copy of its owned asset.
  final String? sourceId;

  /// The tags for the asset.
  final Map<String, String>? tags;

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
    this.tags,
    this.updatedAt,
  });

  factory GetAssetResponse.fromJson(Map<String, dynamic> json) {
    return GetAssetResponse(
      arn: json['Arn'] as String?,
      assetDetails: json['AssetDetails'] != null
          ? AssetDetails.fromJson(json['AssetDetails'] as Map<String, dynamic>)
          : null,
      assetType: (json['AssetType'] as String?)?.let(AssetType.fromString),
      createdAt: timeStampFromJson(json['CreatedAt']),
      dataSetId: json['DataSetId'] as String?,
      id: json['Id'] as String?,
      name: json['Name'] as String?,
      revisionId: json['RevisionId'] as String?,
      sourceId: json['SourceId'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
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
    final tags = this.tags;
    final updatedAt = this.updatedAt;
    return {
      if (arn != null) 'Arn': arn,
      if (assetDetails != null) 'AssetDetails': assetDetails,
      if (assetType != null) 'AssetType': assetType.value,
      if (createdAt != null) 'CreatedAt': iso8601ToJson(createdAt),
      if (dataSetId != null) 'DataSetId': dataSetId,
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (revisionId != null) 'RevisionId': revisionId,
      if (sourceId != null) 'SourceId': sourceId,
      if (tags != null) 'Tags': tags,
      if (updatedAt != null) 'UpdatedAt': iso8601ToJson(updatedAt),
    };
  }
}

class GetDataGrantResponse {
  /// The acceptance state of the data grant.
  final DataGrantAcceptanceState acceptanceState;

  /// The Amazon Resource Name (ARN) of the data grant.
  final String arn;

  /// The timestamp of when the data grant was created.
  final DateTime createdAt;

  /// The ID of the data set associated to the data grant.
  final String dataSetId;

  /// The distribution scope for the data grant.
  final GrantDistributionScope grantDistributionScope;

  /// The ID of the data grant.
  final String id;

  /// The name of the data grant.
  final String name;

  /// The Amazon Web Services account ID of the data grant receiver.
  final String receiverPrincipal;

  /// The Amazon Web Services account ID of the data grant sender.
  final String senderPrincipal;

  /// The ID of the data set used to create the data grant.
  final String sourceDataSetId;

  /// The timestamp of when the data grant was last updated.
  final DateTime updatedAt;

  /// The timestamp of when the data grant was accepted.
  final DateTime? acceptedAt;

  /// The description of the data grant.
  final String? description;

  /// The timestamp of when access to the associated data set ends.
  final DateTime? endsAt;

  /// The tags associated to the data grant. A tag is a key-value pair.
  final Map<String, String>? tags;

  GetDataGrantResponse({
    required this.acceptanceState,
    required this.arn,
    required this.createdAt,
    required this.dataSetId,
    required this.grantDistributionScope,
    required this.id,
    required this.name,
    required this.receiverPrincipal,
    required this.senderPrincipal,
    required this.sourceDataSetId,
    required this.updatedAt,
    this.acceptedAt,
    this.description,
    this.endsAt,
    this.tags,
  });

  factory GetDataGrantResponse.fromJson(Map<String, dynamic> json) {
    return GetDataGrantResponse(
      acceptanceState: DataGrantAcceptanceState.fromString(
          (json['AcceptanceState'] as String?) ?? ''),
      arn: (json['Arn'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] ?? 0),
      dataSetId: (json['DataSetId'] as String?) ?? '',
      grantDistributionScope: GrantDistributionScope.fromString(
          (json['GrantDistributionScope'] as String?) ?? ''),
      id: (json['Id'] as String?) ?? '',
      name: (json['Name'] as String?) ?? '',
      receiverPrincipal: (json['ReceiverPrincipal'] as String?) ?? '',
      senderPrincipal: (json['SenderPrincipal'] as String?) ?? '',
      sourceDataSetId: (json['SourceDataSetId'] as String?) ?? '',
      updatedAt: nonNullableTimeStampFromJson(json['UpdatedAt'] ?? 0),
      acceptedAt: timeStampFromJson(json['AcceptedAt']),
      description: json['Description'] as String?,
      endsAt: timeStampFromJson(json['EndsAt']),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final acceptanceState = this.acceptanceState;
    final arn = this.arn;
    final createdAt = this.createdAt;
    final dataSetId = this.dataSetId;
    final grantDistributionScope = this.grantDistributionScope;
    final id = this.id;
    final name = this.name;
    final receiverPrincipal = this.receiverPrincipal;
    final senderPrincipal = this.senderPrincipal;
    final sourceDataSetId = this.sourceDataSetId;
    final updatedAt = this.updatedAt;
    final acceptedAt = this.acceptedAt;
    final description = this.description;
    final endsAt = this.endsAt;
    final tags = this.tags;
    return {
      'AcceptanceState': acceptanceState.value,
      'Arn': arn,
      'CreatedAt': iso8601ToJson(createdAt),
      'DataSetId': dataSetId,
      'GrantDistributionScope': grantDistributionScope.value,
      'Id': id,
      'Name': name,
      'ReceiverPrincipal': receiverPrincipal,
      'SenderPrincipal': senderPrincipal,
      'SourceDataSetId': sourceDataSetId,
      'UpdatedAt': iso8601ToJson(updatedAt),
      if (acceptedAt != null) 'AcceptedAt': iso8601ToJson(acceptedAt),
      if (description != null) 'Description': description,
      if (endsAt != null) 'EndsAt': iso8601ToJson(endsAt),
      if (tags != null) 'Tags': tags,
    };
  }
}

class GetDataSetResponse {
  /// The ARN for the data set.
  final String? arn;

  /// The type of asset that is added to a data set.
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
      assetType: (json['AssetType'] as String?)?.let(AssetType.fromString),
      createdAt: timeStampFromJson(json['CreatedAt']),
      description: json['Description'] as String?,
      id: json['Id'] as String?,
      name: json['Name'] as String?,
      origin: (json['Origin'] as String?)?.let(Origin.fromString),
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
      if (assetType != null) 'AssetType': assetType.value,
      if (createdAt != null) 'CreatedAt': iso8601ToJson(createdAt),
      if (description != null) 'Description': description,
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (origin != null) 'Origin': origin.value,
      if (originDetails != null) 'OriginDetails': originDetails,
      if (sourceId != null) 'SourceId': sourceId,
      if (tags != null) 'Tags': tags,
      if (updatedAt != null) 'UpdatedAt': iso8601ToJson(updatedAt),
    };
  }
}

class GetEventActionResponse {
  /// What occurs after a certain event.
  final Action? action;

  /// The ARN for the event action.
  final String? arn;

  /// The date and time that the event action was created, in ISO 8601 format.
  final DateTime? createdAt;

  /// What occurs to start an action.
  final Event? event;

  /// The unique identifier for the event action.
  final String? id;

  /// The tags for the event action.
  final Map<String, String>? tags;

  /// The date and time that the event action was last updated, in ISO 8601
  /// format.
  final DateTime? updatedAt;

  GetEventActionResponse({
    this.action,
    this.arn,
    this.createdAt,
    this.event,
    this.id,
    this.tags,
    this.updatedAt,
  });

  factory GetEventActionResponse.fromJson(Map<String, dynamic> json) {
    return GetEventActionResponse(
      action: json['Action'] != null
          ? Action.fromJson(json['Action'] as Map<String, dynamic>)
          : null,
      arn: json['Arn'] as String?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      event: json['Event'] != null
          ? Event.fromJson(json['Event'] as Map<String, dynamic>)
          : null,
      id: json['Id'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final arn = this.arn;
    final createdAt = this.createdAt;
    final event = this.event;
    final id = this.id;
    final tags = this.tags;
    final updatedAt = this.updatedAt;
    return {
      if (action != null) 'Action': action,
      if (arn != null) 'Arn': arn,
      if (createdAt != null) 'CreatedAt': iso8601ToJson(createdAt),
      if (event != null) 'Event': event,
      if (id != null) 'Id': id,
      if (tags != null) 'Tags': tags,
      if (updatedAt != null) 'UpdatedAt': iso8601ToJson(updatedAt),
    };
  }
}

class GetJobResponse {
  /// The ARN for the job.
  final String? arn;

  /// The configuration for the asset, including tags applied to assets created by
  /// the job.
  final AssetConfiguration? assetConfiguration;

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
    this.assetConfiguration,
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
      assetConfiguration: json['AssetConfiguration'] != null
          ? AssetConfiguration.fromJson(
              json['AssetConfiguration'] as Map<String, dynamic>)
          : null,
      createdAt: timeStampFromJson(json['CreatedAt']),
      details: json['Details'] != null
          ? ResponseDetails.fromJson(json['Details'] as Map<String, dynamic>)
          : null,
      errors: (json['Errors'] as List?)
          ?.nonNulls
          .map((e) => JobError.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['Id'] as String?,
      state: (json['State'] as String?)?.let(State.fromString),
      type: (json['Type'] as String?)?.let(Type.fromString),
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final assetConfiguration = this.assetConfiguration;
    final createdAt = this.createdAt;
    final details = this.details;
    final errors = this.errors;
    final id = this.id;
    final state = this.state;
    final type = this.type;
    final updatedAt = this.updatedAt;
    return {
      if (arn != null) 'Arn': arn,
      if (assetConfiguration != null) 'AssetConfiguration': assetConfiguration,
      if (createdAt != null) 'CreatedAt': iso8601ToJson(createdAt),
      if (details != null) 'Details': details,
      if (errors != null) 'Errors': errors,
      if (id != null) 'Id': id,
      if (state != null) 'State': state.value,
      if (type != null) 'Type': type.value,
      if (updatedAt != null) 'UpdatedAt': iso8601ToJson(updatedAt),
    };
  }
}

class GetReceivedDataGrantResponse {
  /// The acceptance state of the data grant.
  final DataGrantAcceptanceState acceptanceState;

  /// The Amazon Resource Name (ARN) of the data grant.
  final String arn;

  /// The timestamp of when the data grant was created.
  final DateTime createdAt;

  /// The ID of the data set associated to the data grant.
  final String dataSetId;

  /// The distribution scope for the data grant.
  final GrantDistributionScope grantDistributionScope;

  /// The ID of the data grant.
  final String id;

  /// The name of the data grant.
  final String name;

  /// The Amazon Web Services account ID of the data grant receiver.
  final String receiverPrincipal;

  /// The timestamp of when the data grant was last updated.
  final DateTime updatedAt;

  /// The timestamp of when the data grant was accepted.
  final DateTime? acceptedAt;

  /// The description of the data grant.
  final String? description;

  /// The timestamp of when access to the associated data set ends.
  final DateTime? endsAt;

  /// The Amazon Web Services account ID of the data grant sender.
  final String? senderPrincipal;

  GetReceivedDataGrantResponse({
    required this.acceptanceState,
    required this.arn,
    required this.createdAt,
    required this.dataSetId,
    required this.grantDistributionScope,
    required this.id,
    required this.name,
    required this.receiverPrincipal,
    required this.updatedAt,
    this.acceptedAt,
    this.description,
    this.endsAt,
    this.senderPrincipal,
  });

  factory GetReceivedDataGrantResponse.fromJson(Map<String, dynamic> json) {
    return GetReceivedDataGrantResponse(
      acceptanceState: DataGrantAcceptanceState.fromString(
          (json['AcceptanceState'] as String?) ?? ''),
      arn: (json['Arn'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] ?? 0),
      dataSetId: (json['DataSetId'] as String?) ?? '',
      grantDistributionScope: GrantDistributionScope.fromString(
          (json['GrantDistributionScope'] as String?) ?? ''),
      id: (json['Id'] as String?) ?? '',
      name: (json['Name'] as String?) ?? '',
      receiverPrincipal: (json['ReceiverPrincipal'] as String?) ?? '',
      updatedAt: nonNullableTimeStampFromJson(json['UpdatedAt'] ?? 0),
      acceptedAt: timeStampFromJson(json['AcceptedAt']),
      description: json['Description'] as String?,
      endsAt: timeStampFromJson(json['EndsAt']),
      senderPrincipal: json['SenderPrincipal'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final acceptanceState = this.acceptanceState;
    final arn = this.arn;
    final createdAt = this.createdAt;
    final dataSetId = this.dataSetId;
    final grantDistributionScope = this.grantDistributionScope;
    final id = this.id;
    final name = this.name;
    final receiverPrincipal = this.receiverPrincipal;
    final updatedAt = this.updatedAt;
    final acceptedAt = this.acceptedAt;
    final description = this.description;
    final endsAt = this.endsAt;
    final senderPrincipal = this.senderPrincipal;
    return {
      'AcceptanceState': acceptanceState.value,
      'Arn': arn,
      'CreatedAt': iso8601ToJson(createdAt),
      'DataSetId': dataSetId,
      'GrantDistributionScope': grantDistributionScope.value,
      'Id': id,
      'Name': name,
      'ReceiverPrincipal': receiverPrincipal,
      'UpdatedAt': iso8601ToJson(updatedAt),
      if (acceptedAt != null) 'AcceptedAt': iso8601ToJson(acceptedAt),
      if (description != null) 'Description': description,
      if (endsAt != null) 'EndsAt': iso8601ToJson(endsAt),
      if (senderPrincipal != null) 'SenderPrincipal': senderPrincipal,
    };
  }
}

class GetRevisionResponse {
  /// The ARN for the revision.
  final String? arn;

  /// An optional comment about the revision.
  final String? comment;

  /// The date and time that the revision was created, in ISO 8601 format.
  final DateTime? createdAt;

  /// The unique identifier for the data set associated with the data set
  /// revision.
  final String? dataSetId;

  /// To publish a revision to a data set in a product, the revision must first be
  /// finalized. Finalizing a revision tells AWS Data Exchange that your changes
  /// to the assets in the revision are complete. After it's in this read-only
  /// state, you can publish the revision to your products. Finalized revisions
  /// can be published through the AWS Data Exchange console or the AWS
  /// Marketplace Catalog API, using the StartChangeSet AWS Marketplace Catalog
  /// API action. When using the API, revisions are uniquely identified by their
  /// ARN.
  final bool? finalized;

  /// The unique identifier for the revision.
  final String? id;

  /// A required comment to inform subscribers of the reason their access to the
  /// revision was revoked.
  final String? revocationComment;

  /// A status indicating that subscribers' access to the revision was revoked.
  final bool? revoked;

  /// The date and time that the revision was revoked, in ISO 8601 format.
  final DateTime? revokedAt;

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
    this.revocationComment,
    this.revoked,
    this.revokedAt,
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
      revocationComment: json['RevocationComment'] as String?,
      revoked: json['Revoked'] as bool?,
      revokedAt: timeStampFromJson(json['RevokedAt']),
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
    final revocationComment = this.revocationComment;
    final revoked = this.revoked;
    final revokedAt = this.revokedAt;
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
      if (revocationComment != null) 'RevocationComment': revocationComment,
      if (revoked != null) 'Revoked': revoked,
      if (revokedAt != null) 'RevokedAt': iso8601ToJson(revokedAt),
      if (sourceId != null) 'SourceId': sourceId,
      if (tags != null) 'Tags': tags,
      if (updatedAt != null) 'UpdatedAt': iso8601ToJson(updatedAt),
    };
  }
}

class ListDataGrantsResponse {
  /// An object that contains a list of data grant information.
  final List<DataGrantSummaryEntry>? dataGrantSummaries;

  /// The pagination token used to retrieve the next page of results for this
  /// operation.
  final String? nextToken;

  ListDataGrantsResponse({
    this.dataGrantSummaries,
    this.nextToken,
  });

  factory ListDataGrantsResponse.fromJson(Map<String, dynamic> json) {
    return ListDataGrantsResponse(
      dataGrantSummaries: (json['DataGrantSummaries'] as List?)
          ?.nonNulls
          .map((e) => DataGrantSummaryEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataGrantSummaries = this.dataGrantSummaries;
    final nextToken = this.nextToken;
    return {
      if (dataGrantSummaries != null) 'DataGrantSummaries': dataGrantSummaries,
      if (nextToken != null) 'NextToken': nextToken,
    };
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
          ?.nonNulls
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
          ?.nonNulls
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

class ListEventActionsResponse {
  /// The event action objects listed by the request.
  final List<EventActionEntry>? eventActions;

  /// The token value retrieved from a previous call to access the next page of
  /// results.
  final String? nextToken;

  ListEventActionsResponse({
    this.eventActions,
    this.nextToken,
  });

  factory ListEventActionsResponse.fromJson(Map<String, dynamic> json) {
    return ListEventActionsResponse(
      eventActions: (json['EventActions'] as List?)
          ?.nonNulls
          .map((e) => EventActionEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final eventActions = this.eventActions;
    final nextToken = this.nextToken;
    return {
      if (eventActions != null) 'EventActions': eventActions,
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
          ?.nonNulls
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

class ListReceivedDataGrantsResponse {
  /// An object that contains a list of received data grant information.
  final List<ReceivedDataGrantSummariesEntry>? dataGrantSummaries;

  /// The pagination token used to retrieve the next page of results for this
  /// operation.
  final String? nextToken;

  ListReceivedDataGrantsResponse({
    this.dataGrantSummaries,
    this.nextToken,
  });

  factory ListReceivedDataGrantsResponse.fromJson(Map<String, dynamic> json) {
    return ListReceivedDataGrantsResponse(
      dataGrantSummaries: (json['DataGrantSummaries'] as List?)
          ?.nonNulls
          .map((e) => ReceivedDataGrantSummariesEntry.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataGrantSummaries = this.dataGrantSummaries;
    final nextToken = this.nextToken;
    return {
      if (dataGrantSummaries != null) 'DataGrantSummaries': dataGrantSummaries,
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
          ?.nonNulls
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

class RevokeRevisionResponse {
  /// The ARN for the revision.
  final String? arn;

  /// An optional comment about the revision.
  final String? comment;

  /// The date and time that the revision was created, in ISO 8601 format.
  final DateTime? createdAt;

  /// The unique identifier for the data set associated with the data set
  /// revision.
  final String? dataSetId;

  /// To publish a revision to a data set in a product, the revision must first be
  /// finalized. Finalizing a revision tells AWS Data Exchange that changes to the
  /// assets in the revision are complete. After it's in this read-only state, you
  /// can publish the revision to your products. Finalized revisions can be
  /// published through the AWS Data Exchange console or the AWS Marketplace
  /// Catalog API, using the StartChangeSet AWS Marketplace Catalog API action.
  /// When using the API, revisions are uniquely identified by their ARN.
  final bool? finalized;

  /// The unique identifier for the revision.
  final String? id;

  /// A required comment to inform subscribers of the reason their access to the
  /// revision was revoked.
  final String? revocationComment;

  /// A status indicating that subscribers' access to the revision was revoked.
  final bool? revoked;

  /// The date and time that the revision was revoked, in ISO 8601 format.
  final DateTime? revokedAt;

  /// The revision ID of the owned revision corresponding to the entitled revision
  /// being viewed. This parameter is returned when a revision owner is viewing
  /// the entitled copy of its owned revision.
  final String? sourceId;

  /// The date and time that the revision was last updated, in ISO 8601 format.
  final DateTime? updatedAt;

  RevokeRevisionResponse({
    this.arn,
    this.comment,
    this.createdAt,
    this.dataSetId,
    this.finalized,
    this.id,
    this.revocationComment,
    this.revoked,
    this.revokedAt,
    this.sourceId,
    this.updatedAt,
  });

  factory RevokeRevisionResponse.fromJson(Map<String, dynamic> json) {
    return RevokeRevisionResponse(
      arn: json['Arn'] as String?,
      comment: json['Comment'] as String?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      dataSetId: json['DataSetId'] as String?,
      finalized: json['Finalized'] as bool?,
      id: json['Id'] as String?,
      revocationComment: json['RevocationComment'] as String?,
      revoked: json['Revoked'] as bool?,
      revokedAt: timeStampFromJson(json['RevokedAt']),
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
    final revocationComment = this.revocationComment;
    final revoked = this.revoked;
    final revokedAt = this.revokedAt;
    final sourceId = this.sourceId;
    final updatedAt = this.updatedAt;
    return {
      if (arn != null) 'Arn': arn,
      if (comment != null) 'Comment': comment,
      if (createdAt != null) 'CreatedAt': iso8601ToJson(createdAt),
      if (dataSetId != null) 'DataSetId': dataSetId,
      if (finalized != null) 'Finalized': finalized,
      if (id != null) 'Id': id,
      if (revocationComment != null) 'RevocationComment': revocationComment,
      if (revoked != null) 'Revoked': revoked,
      if (revokedAt != null) 'RevokedAt': iso8601ToJson(revokedAt),
      if (sourceId != null) 'SourceId': sourceId,
      if (updatedAt != null) 'UpdatedAt': iso8601ToJson(updatedAt),
    };
  }
}

class SendApiAssetResponse {
  /// The response body from the underlying API tracked by the API asset.
  final String? body;

  /// The response headers from the underlying API tracked by the API asset.
  final Map<String, String>? responseHeaders;

  SendApiAssetResponse({
    this.body,
    this.responseHeaders,
  });

  Map<String, dynamic> toJson() {
    final body = this.body;
    final responseHeaders = this.responseHeaders;
    return {
      if (body != null) 'Body': body,
    };
  }
}

class SendDataSetNotificationResponse {
  SendDataSetNotificationResponse();

  factory SendDataSetNotificationResponse.fromJson(Map<String, dynamic> _) {
    return SendDataSetNotificationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
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

class UpdateAssetResponse {
  /// The ARN for the asset.
  final String? arn;

  /// Details about the asset.
  final AssetDetails? assetDetails;

  /// The type of asset that is added to a data set.
  final AssetType? assetType;

  /// The date and time that the asset was created, in ISO 8601 format.
  final DateTime? createdAt;

  /// The unique identifier for the data set associated with this asset.
  final String? dataSetId;

  /// The unique identifier for the asset.
  final String? id;

  /// The name of the asset. When importing from Amazon S3, the Amazon S3 object
  /// key is used as the asset name. When exporting to Amazon S3, the asset name
  /// is used as default target Amazon S3 object key. When importing from Amazon
  /// API Gateway API, the API name is used as the asset name. When importing from
  /// Amazon Redshift, the datashare name is used as the asset name. When
  /// importing from AWS Lake Formation, the static values of "Database(s)
  /// included in the LF-tag policy"- or "Table(s) included in LF-tag policy" are
  /// used as the asset name.
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
      assetType: (json['AssetType'] as String?)?.let(AssetType.fromString),
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
      if (assetType != null) 'AssetType': assetType.value,
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

  /// The type of asset that is added to a data set.
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
      assetType: (json['AssetType'] as String?)?.let(AssetType.fromString),
      createdAt: timeStampFromJson(json['CreatedAt']),
      description: json['Description'] as String?,
      id: json['Id'] as String?,
      name: json['Name'] as String?,
      origin: (json['Origin'] as String?)?.let(Origin.fromString),
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
      if (assetType != null) 'AssetType': assetType.value,
      if (createdAt != null) 'CreatedAt': iso8601ToJson(createdAt),
      if (description != null) 'Description': description,
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (origin != null) 'Origin': origin.value,
      if (originDetails != null) 'OriginDetails': originDetails,
      if (sourceId != null) 'SourceId': sourceId,
      if (updatedAt != null) 'UpdatedAt': iso8601ToJson(updatedAt),
    };
  }
}

class UpdateEventActionResponse {
  /// What occurs after a certain event.
  final Action? action;

  /// The ARN for the event action.
  final String? arn;

  /// The date and time that the event action was created, in ISO 8601 format.
  final DateTime? createdAt;

  /// What occurs to start an action.
  final Event? event;

  /// The unique identifier for the event action.
  final String? id;

  /// The date and time that the event action was last updated, in ISO 8601
  /// format.
  final DateTime? updatedAt;

  UpdateEventActionResponse({
    this.action,
    this.arn,
    this.createdAt,
    this.event,
    this.id,
    this.updatedAt,
  });

  factory UpdateEventActionResponse.fromJson(Map<String, dynamic> json) {
    return UpdateEventActionResponse(
      action: json['Action'] != null
          ? Action.fromJson(json['Action'] as Map<String, dynamic>)
          : null,
      arn: json['Arn'] as String?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      event: json['Event'] != null
          ? Event.fromJson(json['Event'] as Map<String, dynamic>)
          : null,
      id: json['Id'] as String?,
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final arn = this.arn;
    final createdAt = this.createdAt;
    final event = this.event;
    final id = this.id;
    final updatedAt = this.updatedAt;
    return {
      if (action != null) 'Action': action,
      if (arn != null) 'Arn': arn,
      if (createdAt != null) 'CreatedAt': iso8601ToJson(createdAt),
      if (event != null) 'Event': event,
      if (id != null) 'Id': id,
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

  /// The unique identifier for the data set associated with the data set
  /// revision.
  final String? dataSetId;

  /// To publish a revision to a data set in a product, the revision must first be
  /// finalized. Finalizing a revision tells AWS Data Exchange that changes to the
  /// assets in the revision are complete. After it's in this read-only state, you
  /// can publish the revision to your products. Finalized revisions can be
  /// published through the AWS Data Exchange console or the AWS Marketplace
  /// Catalog API, using the StartChangeSet AWS Marketplace Catalog API action.
  /// When using the API, revisions are uniquely identified by their ARN.
  final bool? finalized;

  /// The unique identifier for the revision.
  final String? id;

  /// A required comment to inform subscribers of the reason their access to the
  /// revision was revoked.
  final String? revocationComment;

  /// A status indicating that subscribers' access to the revision was revoked.
  final bool? revoked;

  /// The date and time that the revision was revoked, in ISO 8601 format.
  final DateTime? revokedAt;

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
    this.revocationComment,
    this.revoked,
    this.revokedAt,
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
      revocationComment: json['RevocationComment'] as String?,
      revoked: json['Revoked'] as bool?,
      revokedAt: timeStampFromJson(json['RevokedAt']),
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
    final revocationComment = this.revocationComment;
    final revoked = this.revoked;
    final revokedAt = this.revokedAt;
    final sourceId = this.sourceId;
    final updatedAt = this.updatedAt;
    return {
      if (arn != null) 'Arn': arn,
      if (comment != null) 'Comment': comment,
      if (createdAt != null) 'CreatedAt': iso8601ToJson(createdAt),
      if (dataSetId != null) 'DataSetId': dataSetId,
      if (finalized != null) 'Finalized': finalized,
      if (id != null) 'Id': id,
      if (revocationComment != null) 'RevocationComment': revocationComment,
      if (revoked != null) 'Revoked': revoked,
      if (revokedAt != null) 'RevokedAt': iso8601ToJson(revokedAt),
      if (sourceId != null) 'SourceId': sourceId,
      if (updatedAt != null) 'UpdatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// What occurs after a certain event.
class Action {
  /// Details for the export revision to Amazon S3 action.
  final AutoExportRevisionToS3RequestDetails? exportRevisionToS3;

  Action({
    this.exportRevisionToS3,
  });

  factory Action.fromJson(Map<String, dynamic> json) {
    return Action(
      exportRevisionToS3: json['ExportRevisionToS3'] != null
          ? AutoExportRevisionToS3RequestDetails.fromJson(
              json['ExportRevisionToS3'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final exportRevisionToS3 = this.exportRevisionToS3;
    return {
      if (exportRevisionToS3 != null) 'ExportRevisionToS3': exportRevisionToS3,
    };
  }
}

/// What occurs to start an action.
class Event {
  /// What occurs to start the revision publish action.
  final RevisionPublished? revisionPublished;

  Event({
    this.revisionPublished,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      revisionPublished: json['RevisionPublished'] != null
          ? RevisionPublished.fromJson(
              json['RevisionPublished'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final revisionPublished = this.revisionPublished;
    return {
      if (revisionPublished != null) 'RevisionPublished': revisionPublished,
    };
  }
}

/// Information about the published revision.
class RevisionPublished {
  /// The data set ID of the published revision.
  final String dataSetId;

  RevisionPublished({
    required this.dataSetId,
  });

  factory RevisionPublished.fromJson(Map<String, dynamic> json) {
    return RevisionPublished(
      dataSetId: (json['DataSetId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final dataSetId = this.dataSetId;
    return {
      'DataSetId': dataSetId,
    };
  }
}

/// Details of the operation to be performed by the job.
class AutoExportRevisionToS3RequestDetails {
  /// A revision destination is the Amazon S3 bucket folder destination to where
  /// the export will be sent.
  final AutoExportRevisionDestinationEntry revisionDestination;

  /// Encryption configuration for the auto export job.
  final ExportServerSideEncryption? encryption;

  AutoExportRevisionToS3RequestDetails({
    required this.revisionDestination,
    this.encryption,
  });

  factory AutoExportRevisionToS3RequestDetails.fromJson(
      Map<String, dynamic> json) {
    return AutoExportRevisionToS3RequestDetails(
      revisionDestination: AutoExportRevisionDestinationEntry.fromJson(
          (json['RevisionDestination'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      encryption: json['Encryption'] != null
          ? ExportServerSideEncryption.fromJson(
              json['Encryption'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final revisionDestination = this.revisionDestination;
    final encryption = this.encryption;
    return {
      'RevisionDestination': revisionDestination,
      if (encryption != null) 'Encryption': encryption,
    };
  }
}

/// Encryption configuration of the export job. Includes the encryption type in
/// addition to the AWS KMS key. The KMS key is only necessary if you chose the
/// KMS encryption type.
class ExportServerSideEncryption {
  /// The type of server side encryption used for encrypting the objects in Amazon
  /// S3.
  final ServerSideEncryptionTypes type;

  /// The Amazon Resource Name (ARN) of the AWS KMS key you want to use to encrypt
  /// the Amazon S3 objects. This parameter is required if you choose aws:kms as
  /// an encryption type.
  final String? kmsKeyArn;

  ExportServerSideEncryption({
    required this.type,
    this.kmsKeyArn,
  });

  factory ExportServerSideEncryption.fromJson(Map<String, dynamic> json) {
    return ExportServerSideEncryption(
      type:
          ServerSideEncryptionTypes.fromString((json['Type'] as String?) ?? ''),
      kmsKeyArn: json['KmsKeyArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final kmsKeyArn = this.kmsKeyArn;
    return {
      'Type': type.value,
      if (kmsKeyArn != null) 'KmsKeyArn': kmsKeyArn,
    };
  }
}

/// A revision destination is the Amazon S3 bucket folder destination to where
/// the export will be sent.
class AutoExportRevisionDestinationEntry {
  /// The Amazon S3 bucket that is the destination for the event action.
  final String bucket;

  /// A string representing the pattern for generated names of the individual
  /// assets in the revision. For more information about key patterns, see <a
  /// href="https://docs.aws.amazon.com/data-exchange/latest/userguide/jobs.html#revision-export-keypatterns">Key
  /// patterns when exporting revisions</a>.
  final String? keyPattern;

  AutoExportRevisionDestinationEntry({
    required this.bucket,
    this.keyPattern,
  });

  factory AutoExportRevisionDestinationEntry.fromJson(
      Map<String, dynamic> json) {
    return AutoExportRevisionDestinationEntry(
      bucket: (json['Bucket'] as String?) ?? '',
      keyPattern: json['KeyPattern'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final keyPattern = this.keyPattern;
    return {
      'Bucket': bucket,
      if (keyPattern != null) 'KeyPattern': keyPattern,
    };
  }
}

class ServerSideEncryptionTypes {
  static const awsKms = ServerSideEncryptionTypes._('aws:kms');
  static const aes256 = ServerSideEncryptionTypes._('AES256');

  final String value;

  const ServerSideEncryptionTypes._(this.value);

  static const values = [awsKms, aes256];

  static ServerSideEncryptionTypes fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ServerSideEncryptionTypes._(value));

  @override
  bool operator ==(other) =>
      other is ServerSideEncryptionTypes && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class AssetType {
  static const s3Snapshot = AssetType._('S3_SNAPSHOT');
  static const redshiftDataShare = AssetType._('REDSHIFT_DATA_SHARE');
  static const apiGatewayApi = AssetType._('API_GATEWAY_API');
  static const s3DataAccess = AssetType._('S3_DATA_ACCESS');
  static const lakeFormationDataPermission =
      AssetType._('LAKE_FORMATION_DATA_PERMISSION');

  final String value;

  const AssetType._(this.value);

  static const values = [
    s3Snapshot,
    redshiftDataShare,
    apiGatewayApi,
    s3DataAccess,
    lakeFormationDataPermission
  ];

  static AssetType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => AssetType._(value));

  @override
  bool operator ==(other) => other is AssetType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class Origin {
  static const owned = Origin._('OWNED');
  static const entitled = Origin._('ENTITLED');

  final String value;

  const Origin._(this.value);

  static const values = [owned, entitled];

  static Origin fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Origin._(value));

  @override
  bool operator ==(other) => other is Origin && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Details about the origin of the data set.
class OriginDetails {
  /// The ID of the data grant.
  final String? dataGrantId;

  /// The product ID of the origin of the data set.
  final String? productId;

  OriginDetails({
    this.dataGrantId,
    this.productId,
  });

  factory OriginDetails.fromJson(Map<String, dynamic> json) {
    return OriginDetails(
      dataGrantId: json['DataGrantId'] as String?,
      productId: json['ProductId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataGrantId = this.dataGrantId;
    final productId = this.productId;
    return {
      if (dataGrantId != null) 'DataGrantId': dataGrantId,
      if (productId != null) 'ProductId': productId,
    };
  }
}

/// Details about the asset.
class AssetDetails {
  /// Information about the API Gateway API asset.
  final ApiGatewayApiAsset? apiGatewayApiAsset;

  /// The AWS Lake Formation data permission that is the asset.
  final LakeFormationDataPermissionAsset? lakeFormationDataPermissionAsset;

  /// The Amazon Redshift datashare that is the asset.
  final RedshiftDataShareAsset? redshiftDataShareAsset;

  /// The Amazon S3 data access that is the asset.
  final S3DataAccessAsset? s3DataAccessAsset;

  /// The Amazon S3 object that is the asset.
  final S3SnapshotAsset? s3SnapshotAsset;

  AssetDetails({
    this.apiGatewayApiAsset,
    this.lakeFormationDataPermissionAsset,
    this.redshiftDataShareAsset,
    this.s3DataAccessAsset,
    this.s3SnapshotAsset,
  });

  factory AssetDetails.fromJson(Map<String, dynamic> json) {
    return AssetDetails(
      apiGatewayApiAsset: json['ApiGatewayApiAsset'] != null
          ? ApiGatewayApiAsset.fromJson(
              json['ApiGatewayApiAsset'] as Map<String, dynamic>)
          : null,
      lakeFormationDataPermissionAsset:
          json['LakeFormationDataPermissionAsset'] != null
              ? LakeFormationDataPermissionAsset.fromJson(
                  json['LakeFormationDataPermissionAsset']
                      as Map<String, dynamic>)
              : null,
      redshiftDataShareAsset: json['RedshiftDataShareAsset'] != null
          ? RedshiftDataShareAsset.fromJson(
              json['RedshiftDataShareAsset'] as Map<String, dynamic>)
          : null,
      s3DataAccessAsset: json['S3DataAccessAsset'] != null
          ? S3DataAccessAsset.fromJson(
              json['S3DataAccessAsset'] as Map<String, dynamic>)
          : null,
      s3SnapshotAsset: json['S3SnapshotAsset'] != null
          ? S3SnapshotAsset.fromJson(
              json['S3SnapshotAsset'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final apiGatewayApiAsset = this.apiGatewayApiAsset;
    final lakeFormationDataPermissionAsset =
        this.lakeFormationDataPermissionAsset;
    final redshiftDataShareAsset = this.redshiftDataShareAsset;
    final s3DataAccessAsset = this.s3DataAccessAsset;
    final s3SnapshotAsset = this.s3SnapshotAsset;
    return {
      if (apiGatewayApiAsset != null) 'ApiGatewayApiAsset': apiGatewayApiAsset,
      if (lakeFormationDataPermissionAsset != null)
        'LakeFormationDataPermissionAsset': lakeFormationDataPermissionAsset,
      if (redshiftDataShareAsset != null)
        'RedshiftDataShareAsset': redshiftDataShareAsset,
      if (s3DataAccessAsset != null) 'S3DataAccessAsset': s3DataAccessAsset,
      if (s3SnapshotAsset != null) 'S3SnapshotAsset': s3SnapshotAsset,
    };
  }
}

/// The Amazon S3 object that is the asset.
class S3SnapshotAsset {
  /// The size of the Amazon S3 object that is the object.
  final double size;

  S3SnapshotAsset({
    required this.size,
  });

  factory S3SnapshotAsset.fromJson(Map<String, dynamic> json) {
    return S3SnapshotAsset(
      size: (json['Size'] as double?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final size = this.size;
    return {
      'Size': size,
    };
  }
}

/// The Amazon Redshift datashare asset.
class RedshiftDataShareAsset {
  /// The Amazon Resource Name (ARN) of the datashare asset.
  final String arn;

  RedshiftDataShareAsset({
    required this.arn,
  });

  factory RedshiftDataShareAsset.fromJson(Map<String, dynamic> json) {
    return RedshiftDataShareAsset(
      arn: (json['Arn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      'Arn': arn,
    };
  }
}

/// The API Gateway API that is the asset.
class ApiGatewayApiAsset {
  /// The API description of the API asset.
  final String? apiDescription;

  /// The API endpoint of the API asset.
  final String? apiEndpoint;

  /// The unique identifier of the API asset.
  final String? apiId;

  /// The API key of the API asset.
  final String? apiKey;

  /// The API name of the API asset.
  final String? apiName;

  /// The download URL of the API specification of the API asset.
  final String? apiSpecificationDownloadUrl;

  /// The date and time that the upload URL expires, in ISO 8601 format.
  final DateTime? apiSpecificationDownloadUrlExpiresAt;

  /// The protocol type of the API asset.
  final ProtocolType? protocolType;

  /// The stage of the API asset.
  final String? stage;

  ApiGatewayApiAsset({
    this.apiDescription,
    this.apiEndpoint,
    this.apiId,
    this.apiKey,
    this.apiName,
    this.apiSpecificationDownloadUrl,
    this.apiSpecificationDownloadUrlExpiresAt,
    this.protocolType,
    this.stage,
  });

  factory ApiGatewayApiAsset.fromJson(Map<String, dynamic> json) {
    return ApiGatewayApiAsset(
      apiDescription: json['ApiDescription'] as String?,
      apiEndpoint: json['ApiEndpoint'] as String?,
      apiId: json['ApiId'] as String?,
      apiKey: json['ApiKey'] as String?,
      apiName: json['ApiName'] as String?,
      apiSpecificationDownloadUrl:
          json['ApiSpecificationDownloadUrl'] as String?,
      apiSpecificationDownloadUrlExpiresAt:
          timeStampFromJson(json['ApiSpecificationDownloadUrlExpiresAt']),
      protocolType:
          (json['ProtocolType'] as String?)?.let(ProtocolType.fromString),
      stage: json['Stage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final apiDescription = this.apiDescription;
    final apiEndpoint = this.apiEndpoint;
    final apiId = this.apiId;
    final apiKey = this.apiKey;
    final apiName = this.apiName;
    final apiSpecificationDownloadUrl = this.apiSpecificationDownloadUrl;
    final apiSpecificationDownloadUrlExpiresAt =
        this.apiSpecificationDownloadUrlExpiresAt;
    final protocolType = this.protocolType;
    final stage = this.stage;
    return {
      if (apiDescription != null) 'ApiDescription': apiDescription,
      if (apiEndpoint != null) 'ApiEndpoint': apiEndpoint,
      if (apiId != null) 'ApiId': apiId,
      if (apiKey != null) 'ApiKey': apiKey,
      if (apiName != null) 'ApiName': apiName,
      if (apiSpecificationDownloadUrl != null)
        'ApiSpecificationDownloadUrl': apiSpecificationDownloadUrl,
      if (apiSpecificationDownloadUrlExpiresAt != null)
        'ApiSpecificationDownloadUrlExpiresAt':
            iso8601ToJson(apiSpecificationDownloadUrlExpiresAt),
      if (protocolType != null) 'ProtocolType': protocolType.value,
      if (stage != null) 'Stage': stage,
    };
  }
}

/// The Amazon S3 data access that is the asset.
class S3DataAccessAsset {
  /// The Amazon S3 bucket hosting data to be shared in the S3 data access.
  final String bucket;

  /// The Amazon S3 bucket used for hosting shared data in the Amazon S3 data
  /// access.
  final List<String>? keyPrefixes;

  /// S3 keys made available using this asset.
  final List<String>? keys;

  /// List of AWS KMS CMKs (Key Management System Customer Managed Keys) and ARNs
  /// used to encrypt S3 objects being shared in this S3 Data Access asset.
  /// Providers must include all AWS KMS keys used to encrypt these shared S3
  /// objects.
  final List<KmsKeyToGrant>? kmsKeysToGrant;

  /// The automatically-generated bucket-style alias for your Amazon S3 Access
  /// Point. Customers can access their entitled data using the S3 Access Point
  /// alias.
  final String? s3AccessPointAlias;

  /// The ARN for your Amazon S3 Access Point. Customers can also access their
  /// entitled data using the S3 Access Point ARN.
  final String? s3AccessPointArn;

  S3DataAccessAsset({
    required this.bucket,
    this.keyPrefixes,
    this.keys,
    this.kmsKeysToGrant,
    this.s3AccessPointAlias,
    this.s3AccessPointArn,
  });

  factory S3DataAccessAsset.fromJson(Map<String, dynamic> json) {
    return S3DataAccessAsset(
      bucket: (json['Bucket'] as String?) ?? '',
      keyPrefixes: (json['KeyPrefixes'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      keys: (json['Keys'] as List?)?.nonNulls.map((e) => e as String).toList(),
      kmsKeysToGrant: (json['KmsKeysToGrant'] as List?)
          ?.nonNulls
          .map((e) => KmsKeyToGrant.fromJson(e as Map<String, dynamic>))
          .toList(),
      s3AccessPointAlias: json['S3AccessPointAlias'] as String?,
      s3AccessPointArn: json['S3AccessPointArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final keyPrefixes = this.keyPrefixes;
    final keys = this.keys;
    final kmsKeysToGrant = this.kmsKeysToGrant;
    final s3AccessPointAlias = this.s3AccessPointAlias;
    final s3AccessPointArn = this.s3AccessPointArn;
    return {
      'Bucket': bucket,
      if (keyPrefixes != null) 'KeyPrefixes': keyPrefixes,
      if (keys != null) 'Keys': keys,
      if (kmsKeysToGrant != null) 'KmsKeysToGrant': kmsKeysToGrant,
      if (s3AccessPointAlias != null) 'S3AccessPointAlias': s3AccessPointAlias,
      if (s3AccessPointArn != null) 'S3AccessPointArn': s3AccessPointArn,
    };
  }
}

/// The AWS Lake Formation data permission asset.
class LakeFormationDataPermissionAsset {
  /// Details about the AWS Lake Formation data permission.
  final LakeFormationDataPermissionDetails lakeFormationDataPermissionDetails;

  /// The data permission type.
  final LakeFormationDataPermissionType lakeFormationDataPermissionType;

  /// The permissions granted to the subscribers on the resource.
  final List<LFPermission> permissions;

  /// The IAM role's ARN that allows AWS Data Exchange to assume the role and
  /// grant and revoke permissions to AWS Lake Formation data permissions.
  final String? roleArn;

  LakeFormationDataPermissionAsset({
    required this.lakeFormationDataPermissionDetails,
    required this.lakeFormationDataPermissionType,
    required this.permissions,
    this.roleArn,
  });

  factory LakeFormationDataPermissionAsset.fromJson(Map<String, dynamic> json) {
    return LakeFormationDataPermissionAsset(
      lakeFormationDataPermissionDetails:
          LakeFormationDataPermissionDetails.fromJson(
              (json['LakeFormationDataPermissionDetails']
                      as Map<String, dynamic>?) ??
                  const <String, dynamic>{}),
      lakeFormationDataPermissionType:
          LakeFormationDataPermissionType.fromString(
              (json['LakeFormationDataPermissionType'] as String?) ?? ''),
      permissions: ((json['Permissions'] as List?) ?? const [])
          .nonNulls
          .map((e) => LFPermission.fromString((e as String)))
          .toList(),
      roleArn: json['RoleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lakeFormationDataPermissionDetails =
        this.lakeFormationDataPermissionDetails;
    final lakeFormationDataPermissionType =
        this.lakeFormationDataPermissionType;
    final permissions = this.permissions;
    final roleArn = this.roleArn;
    return {
      'LakeFormationDataPermissionDetails': lakeFormationDataPermissionDetails,
      'LakeFormationDataPermissionType': lakeFormationDataPermissionType.value,
      'Permissions': permissions.map((e) => e.value).toList(),
      if (roleArn != null) 'RoleArn': roleArn,
    };
  }
}

/// Details about the AWS Lake Formation data permission.
class LakeFormationDataPermissionDetails {
  /// Details about the LF-tag policy.
  final LFTagPolicyDetails? lFTagPolicy;

  LakeFormationDataPermissionDetails({
    this.lFTagPolicy,
  });

  factory LakeFormationDataPermissionDetails.fromJson(
      Map<String, dynamic> json) {
    return LakeFormationDataPermissionDetails(
      lFTagPolicy: json['LFTagPolicy'] != null
          ? LFTagPolicyDetails.fromJson(
              json['LFTagPolicy'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final lFTagPolicy = this.lFTagPolicy;
    return {
      if (lFTagPolicy != null) 'LFTagPolicy': lFTagPolicy,
    };
  }
}

class LakeFormationDataPermissionType {
  static const lFTagPolicy = LakeFormationDataPermissionType._('LFTagPolicy');

  final String value;

  const LakeFormationDataPermissionType._(this.value);

  static const values = [lFTagPolicy];

  static LakeFormationDataPermissionType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => LakeFormationDataPermissionType._(value));

  @override
  bool operator ==(other) =>
      other is LakeFormationDataPermissionType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class LFPermission {
  static const describe = LFPermission._('DESCRIBE');
  static const select = LFPermission._('SELECT');

  final String value;

  const LFPermission._(this.value);

  static const values = [describe, select];

  static LFPermission fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => LFPermission._(value));

  @override
  bool operator ==(other) => other is LFPermission && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Details about the LF-tag policy.
class LFTagPolicyDetails {
  /// The identifier for the AWS Glue Data Catalog.
  final String catalogId;

  /// Details for the Lake Formation Resources included in the LF-tag policy.
  final LFResourceDetails resourceDetails;

  /// The resource type for which the LF-tag policy applies.
  final LFResourceType resourceType;

  LFTagPolicyDetails({
    required this.catalogId,
    required this.resourceDetails,
    required this.resourceType,
  });

  factory LFTagPolicyDetails.fromJson(Map<String, dynamic> json) {
    return LFTagPolicyDetails(
      catalogId: (json['CatalogId'] as String?) ?? '',
      resourceDetails: LFResourceDetails.fromJson(
          (json['ResourceDetails'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      resourceType:
          LFResourceType.fromString((json['ResourceType'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final catalogId = this.catalogId;
    final resourceDetails = this.resourceDetails;
    final resourceType = this.resourceType;
    return {
      'CatalogId': catalogId,
      'ResourceDetails': resourceDetails,
      'ResourceType': resourceType.value,
    };
  }
}

class LFResourceType {
  static const table = LFResourceType._('TABLE');
  static const database = LFResourceType._('DATABASE');

  final String value;

  const LFResourceType._(this.value);

  static const values = [table, database];

  static LFResourceType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => LFResourceType._(value));

  @override
  bool operator ==(other) => other is LFResourceType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Details about the AWS Lake Formation resource (Table or Database) included
/// in the AWS Lake Formation data permission.
class LFResourceDetails {
  /// Details about the database resource included in the AWS Lake Formation data
  /// permission.
  final DatabaseLFTagPolicy? database;

  /// Details about the table resource included in the AWS Lake Formation data
  /// permission.
  final TableLFTagPolicy? table;

  LFResourceDetails({
    this.database,
    this.table,
  });

  factory LFResourceDetails.fromJson(Map<String, dynamic> json) {
    return LFResourceDetails(
      database: json['Database'] != null
          ? DatabaseLFTagPolicy.fromJson(
              json['Database'] as Map<String, dynamic>)
          : null,
      table: json['Table'] != null
          ? TableLFTagPolicy.fromJson(json['Table'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final database = this.database;
    final table = this.table;
    return {
      if (database != null) 'Database': database,
      if (table != null) 'Table': table,
    };
  }
}

/// The LF-tag policy for database resources.
class DatabaseLFTagPolicy {
  /// A list of LF-tag conditions that apply to database resources.
  final List<LFTag> expression;

  DatabaseLFTagPolicy({
    required this.expression,
  });

  factory DatabaseLFTagPolicy.fromJson(Map<String, dynamic> json) {
    return DatabaseLFTagPolicy(
      expression: ((json['Expression'] as List?) ?? const [])
          .nonNulls
          .map((e) => LFTag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final expression = this.expression;
    return {
      'Expression': expression,
    };
  }
}

/// The LF-tag policy for a table resource.
class TableLFTagPolicy {
  /// A list of LF-tag conditions that apply to table resources.
  final List<LFTag> expression;

  TableLFTagPolicy({
    required this.expression,
  });

  factory TableLFTagPolicy.fromJson(Map<String, dynamic> json) {
    return TableLFTagPolicy(
      expression: ((json['Expression'] as List?) ?? const [])
          .nonNulls
          .map((e) => LFTag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final expression = this.expression;
    return {
      'Expression': expression,
    };
  }
}

/// A structure that allows an LF-admin to grant permissions on certain
/// conditions.
class LFTag {
  /// The key name for the LF-tag.
  final String tagKey;

  /// A list of LF-tag values.
  final List<String> tagValues;

  LFTag({
    required this.tagKey,
    required this.tagValues,
  });

  factory LFTag.fromJson(Map<String, dynamic> json) {
    return LFTag(
      tagKey: (json['TagKey'] as String?) ?? '',
      tagValues: ((json['TagValues'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final tagKey = this.tagKey;
    final tagValues = this.tagValues;
    return {
      'TagKey': tagKey,
      'TagValues': tagValues,
    };
  }
}

/// The Amazon Resource Name (ARN) of the AWS KMS key used to encrypt the shared
/// S3 objects.
class KmsKeyToGrant {
  /// The AWS KMS CMK (Key Management System Customer Managed Key) used to encrypt
  /// S3 objects in the shared S3 Bucket. AWS Data exchange will create a KMS
  /// grant for each subscriber to allow them to access and decrypt their entitled
  /// data that is encrypted using this KMS key specified.
  final String kmsKeyArn;

  KmsKeyToGrant({
    required this.kmsKeyArn,
  });

  factory KmsKeyToGrant.fromJson(Map<String, dynamic> json) {
    return KmsKeyToGrant(
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

class ProtocolType {
  static const rest = ProtocolType._('REST');

  final String value;

  const ProtocolType._(this.value);

  static const values = [rest];

  static ProtocolType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ProtocolType._(value));

  @override
  bool operator ==(other) => other is ProtocolType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Details about the scope of the notifications such as the affected resources.
class ScopeDetails {
  /// Underlying LF resources that will be affected by this notification.
  final List<LakeFormationTagPolicyDetails>? lakeFormationTagPolicies;

  /// Underlying Redshift resources that will be affected by this notification.
  final List<RedshiftDataShareDetails>? redshiftDataShares;

  /// Underlying S3 resources that will be affected by this notification.
  final List<S3DataAccessDetails>? s3DataAccesses;

  ScopeDetails({
    this.lakeFormationTagPolicies,
    this.redshiftDataShares,
    this.s3DataAccesses,
  });

  Map<String, dynamic> toJson() {
    final lakeFormationTagPolicies = this.lakeFormationTagPolicies;
    final redshiftDataShares = this.redshiftDataShares;
    final s3DataAccesses = this.s3DataAccesses;
    return {
      if (lakeFormationTagPolicies != null)
        'LakeFormationTagPolicies': lakeFormationTagPolicies,
      if (redshiftDataShares != null) 'RedshiftDataShares': redshiftDataShares,
      if (s3DataAccesses != null) 'S3DataAccesses': s3DataAccesses,
    };
  }
}

/// Extra details specific to this notification.
class NotificationDetails {
  /// Extra details specific to a data update type notification.
  final DataUpdateRequestDetails? dataUpdate;

  /// Extra details specific to a deprecation type notification.
  final DeprecationRequestDetails? deprecation;

  /// Extra details specific to a schema change type notification.
  final SchemaChangeRequestDetails? schemaChange;

  NotificationDetails({
    this.dataUpdate,
    this.deprecation,
    this.schemaChange,
  });

  Map<String, dynamic> toJson() {
    final dataUpdate = this.dataUpdate;
    final deprecation = this.deprecation;
    final schemaChange = this.schemaChange;
    return {
      if (dataUpdate != null) 'DataUpdate': dataUpdate,
      if (deprecation != null) 'Deprecation': deprecation,
      if (schemaChange != null) 'SchemaChange': schemaChange,
    };
  }
}

class NotificationType {
  static const dataDelay = NotificationType._('DATA_DELAY');
  static const dataUpdate = NotificationType._('DATA_UPDATE');
  static const deprecation = NotificationType._('DEPRECATION');
  static const schemaChange = NotificationType._('SCHEMA_CHANGE');

  final String value;

  const NotificationType._(this.value);

  static const values = [dataDelay, dataUpdate, deprecation, schemaChange];

  static NotificationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => NotificationType._(value));

  @override
  bool operator ==(other) => other is NotificationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Extra details specific to a data update type notification.
class DataUpdateRequestDetails {
  /// A datetime in the past when the data was updated. This typically means that
  /// the underlying resource supporting the data set was updated.
  final DateTime? dataUpdatedAt;

  DataUpdateRequestDetails({
    this.dataUpdatedAt,
  });

  Map<String, dynamic> toJson() {
    final dataUpdatedAt = this.dataUpdatedAt;
    return {
      if (dataUpdatedAt != null) 'DataUpdatedAt': iso8601ToJson(dataUpdatedAt),
    };
  }
}

/// Extra details specific to a deprecation type notification.
class DeprecationRequestDetails {
  /// A datetime in the future when the data set will be deprecated.
  final DateTime deprecationAt;

  DeprecationRequestDetails({
    required this.deprecationAt,
  });

  Map<String, dynamic> toJson() {
    final deprecationAt = this.deprecationAt;
    return {
      'DeprecationAt': iso8601ToJson(deprecationAt),
    };
  }
}

/// Extra details specific to this schema change type notification.
class SchemaChangeRequestDetails {
  /// A date in the future when the schema change is taking effect.
  final DateTime schemaChangeAt;

  /// List of schema changes happening in the scope of this notification. This can
  /// have up to 100 entries.
  final List<SchemaChangeDetails>? changes;

  SchemaChangeRequestDetails({
    required this.schemaChangeAt,
    this.changes,
  });

  Map<String, dynamic> toJson() {
    final schemaChangeAt = this.schemaChangeAt;
    final changes = this.changes;
    return {
      'SchemaChangeAt': iso8601ToJson(schemaChangeAt),
      if (changes != null) 'Changes': changes,
    };
  }
}

/// Object encompassing information about a schema change to a single,
/// particular field, a notification can have up to 100 of these.
class SchemaChangeDetails {
  /// Name of the changing field. This value can be up to 255 characters long.
  final String name;

  /// Is the field being added, removed, or modified?
  final SchemaChangeType type;

  /// Description of what's changing about this field. This value can be up to 512
  /// characters long.
  final String? description;

  SchemaChangeDetails({
    required this.name,
    required this.type,
    this.description,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final type = this.type;
    final description = this.description;
    return {
      'Name': name,
      'Type': type.value,
      if (description != null) 'Description': description,
    };
  }
}

class SchemaChangeType {
  static const add = SchemaChangeType._('ADD');
  static const remove = SchemaChangeType._('REMOVE');
  static const modify = SchemaChangeType._('MODIFY');

  final String value;

  const SchemaChangeType._(this.value);

  static const values = [add, remove, modify];

  static SchemaChangeType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SchemaChangeType._(value));

  @override
  bool operator ==(other) => other is SchemaChangeType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Extra details specific to the affected scope in this S3 Data Access data
/// set.
class S3DataAccessDetails {
  /// A list of the key prefixes affected by this notification. This can have up
  /// to 50 entries.
  final List<String>? keyPrefixes;

  /// A list of the keys affected by this notification. This can have up to 50
  /// entries.
  final List<String>? keys;

  S3DataAccessDetails({
    this.keyPrefixes,
    this.keys,
  });

  Map<String, dynamic> toJson() {
    final keyPrefixes = this.keyPrefixes;
    final keys = this.keys;
    return {
      if (keyPrefixes != null) 'KeyPrefixes': keyPrefixes,
      if (keys != null) 'Keys': keys,
    };
  }
}

/// Extra details specific to the affected scope in this Redshift data set.
class RedshiftDataShareDetails {
  /// The ARN of the underlying Redshift data share that is being affected by this
  /// notification.
  final String arn;

  /// The database name in the Redshift data share that is being affected by this
  /// notification.
  final String database;

  /// A function name in the Redshift database that is being affected by this
  /// notification.
  final String? function;

  /// A schema name in the Redshift database that is being affected by this
  /// notification.
  final String? schema;

  /// A table name in the Redshift database that is being affected by this
  /// notification.
  final String? table;

  /// A view name in the Redshift database that is being affected by this
  /// notification.
  final String? view;

  RedshiftDataShareDetails({
    required this.arn,
    required this.database,
    this.function,
    this.schema,
    this.table,
    this.view,
  });

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final database = this.database;
    final function = this.function;
    final schema = this.schema;
    final table = this.table;
    final view = this.view;
    return {
      'Arn': arn,
      'Database': database,
      if (function != null) 'Function': function,
      if (schema != null) 'Schema': schema,
      if (table != null) 'Table': table,
      if (view != null) 'View': view,
    };
  }
}

/// Extra details specific to the affected scope in this LF data set.
class LakeFormationTagPolicyDetails {
  /// The underlying Glue database that the notification is referring to.
  final String? database;

  /// The underlying Glue table that the notification is referring to.
  final String? table;

  LakeFormationTagPolicyDetails({
    this.database,
    this.table,
  });

  Map<String, dynamic> toJson() {
    final database = this.database;
    final table = this.table;
    return {
      if (database != null) 'Database': database,
      if (table != null) 'Table': table,
    };
  }
}

/// An asset in AWS Data Exchange is a piece of data (Amazon S3 object) or a
/// means of fulfilling data (Amazon Redshift datashare or Amazon API Gateway
/// API, AWS Lake Formation data permission, or Amazon S3 data access). The
/// asset can be a structured data file, an image file, or some other data file
/// that can be stored as an Amazon S3 object, an Amazon API Gateway API, or an
/// Amazon Redshift datashare, an AWS Lake Formation data permission, or an
/// Amazon S3 data access. When you create an import job for your files, API
/// Gateway APIs, Amazon Redshift datashares, AWS Lake Formation data
/// permission, or Amazon S3 data access, you create an asset in AWS Data
/// Exchange.
class AssetEntry {
  /// The ARN for the asset.
  final String arn;

  /// Details about the asset.
  final AssetDetails assetDetails;

  /// The type of asset that is added to a data set.
  final AssetType assetType;

  /// The date and time that the asset was created, in ISO 8601 format.
  final DateTime createdAt;

  /// The unique identifier for the data set associated with this asset.
  final String dataSetId;

  /// The unique identifier for the asset.
  final String id;

  /// The name of the asset. When importing from Amazon S3, the Amazon S3 object
  /// key is used as the asset name. When exporting to Amazon S3, the asset name
  /// is used as default target Amazon S3 object key. When importing from Amazon
  /// API Gateway API, the API name is used as the asset name. When importing from
  /// Amazon Redshift, the datashare name is used as the asset name. When
  /// importing from AWS Lake Formation, the static values of "Database(s)
  /// included in LF-tag policy" or "Table(s) included in LF-tag policy" are used
  /// as the asset name.
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
      arn: (json['Arn'] as String?) ?? '',
      assetDetails: AssetDetails.fromJson(
          (json['AssetDetails'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      assetType: AssetType.fromString((json['AssetType'] as String?) ?? ''),
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] ?? 0),
      dataSetId: (json['DataSetId'] as String?) ?? '',
      id: (json['Id'] as String?) ?? '',
      name: (json['Name'] as String?) ?? '',
      revisionId: (json['RevisionId'] as String?) ?? '',
      updatedAt: nonNullableTimeStampFromJson(json['UpdatedAt'] ?? 0),
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
      'AssetType': assetType.value,
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

/// Information about a received data grant.
class ReceivedDataGrantSummariesEntry {
  /// The acceptance state of the data grant.
  final DataGrantAcceptanceState acceptanceState;

  /// The Amazon Resource Name (ARN) of the data grant.
  final String arn;

  /// The timestamp of when the data grant was created.
  final DateTime createdAt;

  /// The ID of the data set associated to the data grant.
  final String dataSetId;

  /// The ID of the data grant.
  final String id;

  /// The name of the data grant.
  final String name;

  /// The Amazon Web Services account ID of the data grant receiver.
  final String receiverPrincipal;

  /// The Amazon Web Services account ID of the data grant sender.
  final String senderPrincipal;

  /// The timestamp of when the data grant was last updated.
  final DateTime updatedAt;

  /// The timestamp of when the data grant was accepted.
  final DateTime? acceptedAt;

  /// The timestamp of when access to the associated data set ends.
  final DateTime? endsAt;

  ReceivedDataGrantSummariesEntry({
    required this.acceptanceState,
    required this.arn,
    required this.createdAt,
    required this.dataSetId,
    required this.id,
    required this.name,
    required this.receiverPrincipal,
    required this.senderPrincipal,
    required this.updatedAt,
    this.acceptedAt,
    this.endsAt,
  });

  factory ReceivedDataGrantSummariesEntry.fromJson(Map<String, dynamic> json) {
    return ReceivedDataGrantSummariesEntry(
      acceptanceState: DataGrantAcceptanceState.fromString(
          (json['AcceptanceState'] as String?) ?? ''),
      arn: (json['Arn'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] ?? 0),
      dataSetId: (json['DataSetId'] as String?) ?? '',
      id: (json['Id'] as String?) ?? '',
      name: (json['Name'] as String?) ?? '',
      receiverPrincipal: (json['ReceiverPrincipal'] as String?) ?? '',
      senderPrincipal: (json['SenderPrincipal'] as String?) ?? '',
      updatedAt: nonNullableTimeStampFromJson(json['UpdatedAt'] ?? 0),
      acceptedAt: timeStampFromJson(json['AcceptedAt']),
      endsAt: timeStampFromJson(json['EndsAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final acceptanceState = this.acceptanceState;
    final arn = this.arn;
    final createdAt = this.createdAt;
    final dataSetId = this.dataSetId;
    final id = this.id;
    final name = this.name;
    final receiverPrincipal = this.receiverPrincipal;
    final senderPrincipal = this.senderPrincipal;
    final updatedAt = this.updatedAt;
    final acceptedAt = this.acceptedAt;
    final endsAt = this.endsAt;
    return {
      'AcceptanceState': acceptanceState.value,
      'Arn': arn,
      'CreatedAt': iso8601ToJson(createdAt),
      'DataSetId': dataSetId,
      'Id': id,
      'Name': name,
      'ReceiverPrincipal': receiverPrincipal,
      'SenderPrincipal': senderPrincipal,
      'UpdatedAt': iso8601ToJson(updatedAt),
      if (acceptedAt != null) 'AcceptedAt': iso8601ToJson(acceptedAt),
      if (endsAt != null) 'EndsAt': iso8601ToJson(endsAt),
    };
  }
}

class DataGrantAcceptanceState {
  static const pendingReceiverAcceptance =
      DataGrantAcceptanceState._('PENDING_RECEIVER_ACCEPTANCE');
  static const accepted = DataGrantAcceptanceState._('ACCEPTED');

  final String value;

  const DataGrantAcceptanceState._(this.value);

  static const values = [pendingReceiverAcceptance, accepted];

  static DataGrantAcceptanceState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DataGrantAcceptanceState._(value));

  @override
  bool operator ==(other) =>
      other is DataGrantAcceptanceState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class AcceptanceStateFilterValue {
  static const pendingReceiverAcceptance =
      AcceptanceStateFilterValue._('PENDING_RECEIVER_ACCEPTANCE');
  static const accepted = AcceptanceStateFilterValue._('ACCEPTED');

  final String value;

  const AcceptanceStateFilterValue._(this.value);

  static const values = [pendingReceiverAcceptance, accepted];

  static AcceptanceStateFilterValue fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AcceptanceStateFilterValue._(value));

  @override
  bool operator ==(other) =>
      other is AcceptanceStateFilterValue && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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

  /// The configuration for the asset, including tags applied to assets created by
  /// the job.
  final AssetConfiguration? assetConfiguration;

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
    this.assetConfiguration,
    this.errors,
  });

  factory JobEntry.fromJson(Map<String, dynamic> json) {
    return JobEntry(
      arn: (json['Arn'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] ?? 0),
      details: ResponseDetails.fromJson(
          (json['Details'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      id: (json['Id'] as String?) ?? '',
      state: State.fromString((json['State'] as String?) ?? ''),
      type: Type.fromString((json['Type'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['UpdatedAt'] ?? 0),
      assetConfiguration: json['AssetConfiguration'] != null
          ? AssetConfiguration.fromJson(
              json['AssetConfiguration'] as Map<String, dynamic>)
          : null,
      errors: (json['Errors'] as List?)
          ?.nonNulls
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
    final assetConfiguration = this.assetConfiguration;
    final errors = this.errors;
    return {
      'Arn': arn,
      'CreatedAt': iso8601ToJson(createdAt),
      'Details': details,
      'Id': id,
      'State': state.value,
      'Type': type.value,
      'UpdatedAt': iso8601ToJson(updatedAt),
      if (assetConfiguration != null) 'AssetConfiguration': assetConfiguration,
      if (errors != null) 'Errors': errors,
    };
  }
}

/// The configuration for the asset, which can include tags.
class AssetConfiguration {
  /// The tags to be applied to assets created by the job.
  final List<Tag>? tags;

  AssetConfiguration({
    this.tags,
  });

  factory AssetConfiguration.fromJson(Map<String, dynamic> json) {
    return AssetConfiguration(
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

/// Details for the response.
class ResponseDetails {
  /// Response details from the CreateS3DataAccessFromS3Bucket job.
  final CreateS3DataAccessFromS3BucketResponseDetails?
      createS3DataAccessFromS3Bucket;

  /// Details for the export to signed URL response.
  final ExportAssetToSignedUrlResponseDetails? exportAssetToSignedUrl;

  /// Details for the export to Amazon S3 response.
  final ExportAssetsToS3ResponseDetails? exportAssetsToS3;

  /// Details for the export revisions to Amazon S3 response.
  final ExportRevisionsToS3ResponseDetails? exportRevisionsToS3;

  /// The response details.
  final ImportAssetFromApiGatewayApiResponseDetails?
      importAssetFromApiGatewayApi;

  /// Details for the import from signed URL response.
  final ImportAssetFromSignedUrlResponseDetails? importAssetFromSignedUrl;

  /// Response details from the ImportAssetsFromLakeFormationTagPolicy job.
  final ImportAssetsFromLakeFormationTagPolicyResponseDetails?
      importAssetsFromLakeFormationTagPolicy;

  /// Details from an import from Amazon Redshift datashare response.
  final ImportAssetsFromRedshiftDataSharesResponseDetails?
      importAssetsFromRedshiftDataShares;

  /// Details for the import from Amazon S3 response.
  final ImportAssetsFromS3ResponseDetails? importAssetsFromS3;

  ResponseDetails({
    this.createS3DataAccessFromS3Bucket,
    this.exportAssetToSignedUrl,
    this.exportAssetsToS3,
    this.exportRevisionsToS3,
    this.importAssetFromApiGatewayApi,
    this.importAssetFromSignedUrl,
    this.importAssetsFromLakeFormationTagPolicy,
    this.importAssetsFromRedshiftDataShares,
    this.importAssetsFromS3,
  });

  factory ResponseDetails.fromJson(Map<String, dynamic> json) {
    return ResponseDetails(
      createS3DataAccessFromS3Bucket: json['CreateS3DataAccessFromS3Bucket'] !=
              null
          ? CreateS3DataAccessFromS3BucketResponseDetails.fromJson(
              json['CreateS3DataAccessFromS3Bucket'] as Map<String, dynamic>)
          : null,
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
      importAssetFromApiGatewayApi: json['ImportAssetFromApiGatewayApi'] != null
          ? ImportAssetFromApiGatewayApiResponseDetails.fromJson(
              json['ImportAssetFromApiGatewayApi'] as Map<String, dynamic>)
          : null,
      importAssetFromSignedUrl: json['ImportAssetFromSignedUrl'] != null
          ? ImportAssetFromSignedUrlResponseDetails.fromJson(
              json['ImportAssetFromSignedUrl'] as Map<String, dynamic>)
          : null,
      importAssetsFromLakeFormationTagPolicy:
          json['ImportAssetsFromLakeFormationTagPolicy'] != null
              ? ImportAssetsFromLakeFormationTagPolicyResponseDetails.fromJson(
                  json['ImportAssetsFromLakeFormationTagPolicy']
                      as Map<String, dynamic>)
              : null,
      importAssetsFromRedshiftDataShares:
          json['ImportAssetsFromRedshiftDataShares'] != null
              ? ImportAssetsFromRedshiftDataSharesResponseDetails.fromJson(
                  json['ImportAssetsFromRedshiftDataShares']
                      as Map<String, dynamic>)
              : null,
      importAssetsFromS3: json['ImportAssetsFromS3'] != null
          ? ImportAssetsFromS3ResponseDetails.fromJson(
              json['ImportAssetsFromS3'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final createS3DataAccessFromS3Bucket = this.createS3DataAccessFromS3Bucket;
    final exportAssetToSignedUrl = this.exportAssetToSignedUrl;
    final exportAssetsToS3 = this.exportAssetsToS3;
    final exportRevisionsToS3 = this.exportRevisionsToS3;
    final importAssetFromApiGatewayApi = this.importAssetFromApiGatewayApi;
    final importAssetFromSignedUrl = this.importAssetFromSignedUrl;
    final importAssetsFromLakeFormationTagPolicy =
        this.importAssetsFromLakeFormationTagPolicy;
    final importAssetsFromRedshiftDataShares =
        this.importAssetsFromRedshiftDataShares;
    final importAssetsFromS3 = this.importAssetsFromS3;
    return {
      if (createS3DataAccessFromS3Bucket != null)
        'CreateS3DataAccessFromS3Bucket': createS3DataAccessFromS3Bucket,
      if (exportAssetToSignedUrl != null)
        'ExportAssetToSignedUrl': exportAssetToSignedUrl,
      if (exportAssetsToS3 != null) 'ExportAssetsToS3': exportAssetsToS3,
      if (exportRevisionsToS3 != null)
        'ExportRevisionsToS3': exportRevisionsToS3,
      if (importAssetFromApiGatewayApi != null)
        'ImportAssetFromApiGatewayApi': importAssetFromApiGatewayApi,
      if (importAssetFromSignedUrl != null)
        'ImportAssetFromSignedUrl': importAssetFromSignedUrl,
      if (importAssetsFromLakeFormationTagPolicy != null)
        'ImportAssetsFromLakeFormationTagPolicy':
            importAssetsFromLakeFormationTagPolicy,
      if (importAssetsFromRedshiftDataShares != null)
        'ImportAssetsFromRedshiftDataShares':
            importAssetsFromRedshiftDataShares,
      if (importAssetsFromS3 != null) 'ImportAssetsFromS3': importAssetsFromS3,
    };
  }
}

class State {
  static const waiting = State._('WAITING');
  static const inProgress = State._('IN_PROGRESS');
  static const error = State._('ERROR');
  static const completed = State._('COMPLETED');
  static const cancelled = State._('CANCELLED');
  static const timedOut = State._('TIMED_OUT');

  final String value;

  const State._(this.value);

  static const values = [
    waiting,
    inProgress,
    error,
    completed,
    cancelled,
    timedOut
  ];

  static State fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => State._(value));

  @override
  bool operator ==(other) => other is State && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class Type {
  static const importAssetsFromS3 = Type._('IMPORT_ASSETS_FROM_S3');
  static const importAssetFromSignedUrl =
      Type._('IMPORT_ASSET_FROM_SIGNED_URL');
  static const exportAssetsToS3 = Type._('EXPORT_ASSETS_TO_S3');
  static const exportAssetToSignedUrl = Type._('EXPORT_ASSET_TO_SIGNED_URL');
  static const exportRevisionsToS3 = Type._('EXPORT_REVISIONS_TO_S3');
  static const importAssetsFromRedshiftDataShares =
      Type._('IMPORT_ASSETS_FROM_REDSHIFT_DATA_SHARES');
  static const importAssetFromApiGatewayApi =
      Type._('IMPORT_ASSET_FROM_API_GATEWAY_API');
  static const createS3DataAccessFromS3Bucket =
      Type._('CREATE_S3_DATA_ACCESS_FROM_S3_BUCKET');
  static const importAssetsFromLakeFormationTagPolicy =
      Type._('IMPORT_ASSETS_FROM_LAKE_FORMATION_TAG_POLICY');

  final String value;

  const Type._(this.value);

  static const values = [
    importAssetsFromS3,
    importAssetFromSignedUrl,
    exportAssetsToS3,
    exportAssetToSignedUrl,
    exportRevisionsToS3,
    importAssetsFromRedshiftDataShares,
    importAssetFromApiGatewayApi,
    createS3DataAccessFromS3Bucket,
    importAssetsFromLakeFormationTagPolicy
  ];

  static Type fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Type._(value));

  @override
  bool operator ==(other) => other is Type && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An error that occurred with the job request.
class JobError {
  /// The code for the job error.
  final Code code;

  /// The message related to the job error.
  final String message;

  /// The details about the job error.
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
      code: Code.fromString((json['Code'] as String?) ?? ''),
      message: (json['Message'] as String?) ?? '',
      details: json['Details'] != null
          ? Details.fromJson(json['Details'] as Map<String, dynamic>)
          : null,
      limitName:
          (json['LimitName'] as String?)?.let(JobErrorLimitName.fromString),
      limitValue: json['LimitValue'] as double?,
      resourceId: json['ResourceId'] as String?,
      resourceType: (json['ResourceType'] as String?)
          ?.let(JobErrorResourceTypes.fromString),
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
      'Code': code.value,
      'Message': message,
      if (details != null) 'Details': details,
      if (limitName != null) 'LimitName': limitName.value,
      if (limitValue != null) 'LimitValue': limitValue,
      if (resourceId != null) 'ResourceId': resourceId,
      if (resourceType != null) 'ResourceType': resourceType.value,
    };
  }
}

class Code {
  static const accessDeniedException = Code._('ACCESS_DENIED_EXCEPTION');
  static const internalServerException = Code._('INTERNAL_SERVER_EXCEPTION');
  static const malwareDetected = Code._('MALWARE_DETECTED');
  static const resourceNotFoundException =
      Code._('RESOURCE_NOT_FOUND_EXCEPTION');
  static const serviceQuotaExceededException =
      Code._('SERVICE_QUOTA_EXCEEDED_EXCEPTION');
  static const validationException = Code._('VALIDATION_EXCEPTION');
  static const malwareScanEncryptedFile = Code._('MALWARE_SCAN_ENCRYPTED_FILE');

  final String value;

  const Code._(this.value);

  static const values = [
    accessDeniedException,
    internalServerException,
    malwareDetected,
    resourceNotFoundException,
    serviceQuotaExceededException,
    validationException,
    malwareScanEncryptedFile
  ];

  static Code fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Code._(value));

  @override
  bool operator ==(other) => other is Code && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Information about the job error.
class Details {
  /// Information about the job error.
  final ImportAssetFromSignedUrlJobErrorDetails?
      importAssetFromSignedUrlJobErrorDetails;

  /// Details about the job error.
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
              ?.nonNulls
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

class JobErrorLimitName {
  static const assetsPerRevision = JobErrorLimitName._('Assets per revision');
  static const assetSizeInGb = JobErrorLimitName._('Asset size in GB');
  static const amazonRedshiftDatashareAssetsPerRevision =
      JobErrorLimitName._('Amazon Redshift datashare assets per revision');
  static const awsLakeFormationDataPermissionAssetsPerRevision =
      JobErrorLimitName._(
          'AWS Lake Formation data permission assets per revision');
  static const amazonS3DataAccessAssetsPerRevision =
      JobErrorLimitName._('Amazon S3 data access assets per revision');

  final String value;

  const JobErrorLimitName._(this.value);

  static const values = [
    assetsPerRevision,
    assetSizeInGb,
    amazonRedshiftDatashareAssetsPerRevision,
    awsLakeFormationDataPermissionAssetsPerRevision,
    amazonS3DataAccessAssetsPerRevision
  ];

  static JobErrorLimitName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => JobErrorLimitName._(value));

  @override
  bool operator ==(other) => other is JobErrorLimitName && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class JobErrorResourceTypes {
  static const revision = JobErrorResourceTypes._('REVISION');
  static const asset = JobErrorResourceTypes._('ASSET');
  static const dataSet = JobErrorResourceTypes._('DATA_SET');

  final String value;

  const JobErrorResourceTypes._(this.value);

  static const values = [revision, asset, dataSet];

  static JobErrorResourceTypes fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => JobErrorResourceTypes._(value));

  @override
  bool operator ==(other) =>
      other is JobErrorResourceTypes && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Details about the job error.
class ImportAssetFromSignedUrlJobErrorDetails {
  /// Details about the job error.
  final String assetName;

  ImportAssetFromSignedUrlJobErrorDetails({
    required this.assetName,
  });

  factory ImportAssetFromSignedUrlJobErrorDetails.fromJson(
      Map<String, dynamic> json) {
    return ImportAssetFromSignedUrlJobErrorDetails(
      assetName: (json['AssetName'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final assetName = this.assetName;
    return {
      'AssetName': assetName,
    };
  }
}

/// The source of the assets.
class AssetSourceEntry {
  /// The Amazon S3 bucket that's part of the source of the asset.
  final String bucket;

  /// The name of the object in Amazon S3 for the asset.
  final String key;

  AssetSourceEntry({
    required this.bucket,
    required this.key,
  });

  factory AssetSourceEntry.fromJson(Map<String, dynamic> json) {
    return AssetSourceEntry(
      bucket: (json['Bucket'] as String?) ?? '',
      key: (json['Key'] as String?) ?? '',
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
      assetId: (json['AssetId'] as String?) ?? '',
      dataSetId: (json['DataSetId'] as String?) ?? '',
      revisionId: (json['RevisionId'] as String?) ?? '',
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
      assetDestinations: ((json['AssetDestinations'] as List?) ?? const [])
          .nonNulls
          .map((e) => AssetDestinationEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      dataSetId: (json['DataSetId'] as String?) ?? '',
      revisionId: (json['RevisionId'] as String?) ?? '',
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

/// Details about the export revisions to Amazon S3 response.
class ExportRevisionsToS3ResponseDetails {
  /// The unique identifier for the data set associated with this export job.
  final String dataSetId;

  /// The destination in Amazon S3 where the revision is exported.
  final List<RevisionDestinationEntry> revisionDestinations;

  /// Encryption configuration of the export job.
  final ExportServerSideEncryption? encryption;

  /// The Amazon Resource Name (ARN) of the event action.
  final String? eventActionArn;

  ExportRevisionsToS3ResponseDetails({
    required this.dataSetId,
    required this.revisionDestinations,
    this.encryption,
    this.eventActionArn,
  });

  factory ExportRevisionsToS3ResponseDetails.fromJson(
      Map<String, dynamic> json) {
    return ExportRevisionsToS3ResponseDetails(
      dataSetId: (json['DataSetId'] as String?) ?? '',
      revisionDestinations:
          ((json['RevisionDestinations'] as List?) ?? const [])
              .nonNulls
              .map((e) =>
                  RevisionDestinationEntry.fromJson(e as Map<String, dynamic>))
              .toList(),
      encryption: json['Encryption'] != null
          ? ExportServerSideEncryption.fromJson(
              json['Encryption'] as Map<String, dynamic>)
          : null,
      eventActionArn: json['EventActionArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataSetId = this.dataSetId;
    final revisionDestinations = this.revisionDestinations;
    final encryption = this.encryption;
    final eventActionArn = this.eventActionArn;
    return {
      'DataSetId': dataSetId,
      'RevisionDestinations': revisionDestinations,
      if (encryption != null) 'Encryption': encryption,
      if (eventActionArn != null) 'EventActionArn': eventActionArn,
    };
  }
}

/// The details in the response for an import request, including the signed URL
/// and other information.
class ImportAssetFromSignedUrlResponseDetails {
  /// The name for the asset associated with this import job.
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
      assetName: (json['AssetName'] as String?) ?? '',
      dataSetId: (json['DataSetId'] as String?) ?? '',
      revisionId: (json['RevisionId'] as String?) ?? '',
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
      assetSources: ((json['AssetSources'] as List?) ?? const [])
          .nonNulls
          .map((e) => AssetSourceEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      dataSetId: (json['DataSetId'] as String?) ?? '',
      revisionId: (json['RevisionId'] as String?) ?? '',
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

/// Details from an import from Amazon Redshift datashare response.
class ImportAssetsFromRedshiftDataSharesResponseDetails {
  /// A list of Amazon Redshift datashare asset sources.
  final List<RedshiftDataShareAssetSourceEntry> assetSources;

  /// The unique identifier for the data set associated with this import job.
  final String dataSetId;

  /// The unique identifier for the revision associated with this import job.
  final String revisionId;

  ImportAssetsFromRedshiftDataSharesResponseDetails({
    required this.assetSources,
    required this.dataSetId,
    required this.revisionId,
  });

  factory ImportAssetsFromRedshiftDataSharesResponseDetails.fromJson(
      Map<String, dynamic> json) {
    return ImportAssetsFromRedshiftDataSharesResponseDetails(
      assetSources: ((json['AssetSources'] as List?) ?? const [])
          .nonNulls
          .map((e) => RedshiftDataShareAssetSourceEntry.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      dataSetId: (json['DataSetId'] as String?) ?? '',
      revisionId: (json['RevisionId'] as String?) ?? '',
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

/// The response details.
class ImportAssetFromApiGatewayApiResponseDetails {
  /// The API ID.
  final String apiId;

  /// The API name.
  final String apiName;

  /// The Base64-encoded Md5 hash for the API asset, used to ensure the integrity
  /// of the API at that location.
  final String apiSpecificationMd5Hash;

  /// The upload URL of the API specification.
  final String apiSpecificationUploadUrl;

  /// The date and time that the upload URL expires, in ISO 8601 format.
  final DateTime apiSpecificationUploadUrlExpiresAt;

  /// The data set ID.
  final String dataSetId;

  /// The protocol type.
  final ProtocolType protocolType;

  /// The revision ID.
  final String revisionId;

  /// The API stage.
  final String stage;

  /// The API description.
  final String? apiDescription;

  /// The API key.
  final String? apiKey;

  ImportAssetFromApiGatewayApiResponseDetails({
    required this.apiId,
    required this.apiName,
    required this.apiSpecificationMd5Hash,
    required this.apiSpecificationUploadUrl,
    required this.apiSpecificationUploadUrlExpiresAt,
    required this.dataSetId,
    required this.protocolType,
    required this.revisionId,
    required this.stage,
    this.apiDescription,
    this.apiKey,
  });

  factory ImportAssetFromApiGatewayApiResponseDetails.fromJson(
      Map<String, dynamic> json) {
    return ImportAssetFromApiGatewayApiResponseDetails(
      apiId: (json['ApiId'] as String?) ?? '',
      apiName: (json['ApiName'] as String?) ?? '',
      apiSpecificationMd5Hash:
          (json['ApiSpecificationMd5Hash'] as String?) ?? '',
      apiSpecificationUploadUrl:
          (json['ApiSpecificationUploadUrl'] as String?) ?? '',
      apiSpecificationUploadUrlExpiresAt: nonNullableTimeStampFromJson(
          json['ApiSpecificationUploadUrlExpiresAt'] ?? 0),
      dataSetId: (json['DataSetId'] as String?) ?? '',
      protocolType:
          ProtocolType.fromString((json['ProtocolType'] as String?) ?? ''),
      revisionId: (json['RevisionId'] as String?) ?? '',
      stage: (json['Stage'] as String?) ?? '',
      apiDescription: json['ApiDescription'] as String?,
      apiKey: json['ApiKey'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final apiId = this.apiId;
    final apiName = this.apiName;
    final apiSpecificationMd5Hash = this.apiSpecificationMd5Hash;
    final apiSpecificationUploadUrl = this.apiSpecificationUploadUrl;
    final apiSpecificationUploadUrlExpiresAt =
        this.apiSpecificationUploadUrlExpiresAt;
    final dataSetId = this.dataSetId;
    final protocolType = this.protocolType;
    final revisionId = this.revisionId;
    final stage = this.stage;
    final apiDescription = this.apiDescription;
    final apiKey = this.apiKey;
    return {
      'ApiId': apiId,
      'ApiName': apiName,
      'ApiSpecificationMd5Hash': apiSpecificationMd5Hash,
      'ApiSpecificationUploadUrl': apiSpecificationUploadUrl,
      'ApiSpecificationUploadUrlExpiresAt':
          iso8601ToJson(apiSpecificationUploadUrlExpiresAt),
      'DataSetId': dataSetId,
      'ProtocolType': protocolType.value,
      'RevisionId': revisionId,
      'Stage': stage,
      if (apiDescription != null) 'ApiDescription': apiDescription,
      if (apiKey != null) 'ApiKey': apiKey,
    };
  }
}

/// Details about the response of the operation to create an S3 data access from
/// an S3 bucket.
class CreateS3DataAccessFromS3BucketResponseDetails {
  /// Details about the asset source from an Amazon S3 bucket.
  final S3DataAccessAssetSourceEntry assetSource;

  /// The unique identifier for this data set.
  final String dataSetId;

  /// The unique identifier for the revision.
  final String revisionId;

  CreateS3DataAccessFromS3BucketResponseDetails({
    required this.assetSource,
    required this.dataSetId,
    required this.revisionId,
  });

  factory CreateS3DataAccessFromS3BucketResponseDetails.fromJson(
      Map<String, dynamic> json) {
    return CreateS3DataAccessFromS3BucketResponseDetails(
      assetSource: S3DataAccessAssetSourceEntry.fromJson(
          (json['AssetSource'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      dataSetId: (json['DataSetId'] as String?) ?? '',
      revisionId: (json['RevisionId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final assetSource = this.assetSource;
    final dataSetId = this.dataSetId;
    final revisionId = this.revisionId;
    return {
      'AssetSource': assetSource,
      'DataSetId': dataSetId,
      'RevisionId': revisionId,
    };
  }
}

/// Details from an import AWS Lake Formation tag policy job response.
class ImportAssetsFromLakeFormationTagPolicyResponseDetails {
  /// The identifier for the AWS Glue Data Catalog.
  final String catalogId;

  /// The unique identifier for the data set associated with this import job.
  final String dataSetId;

  /// The unique identifier for the revision associated with this import job.
  final String revisionId;

  /// The IAM role's ARN that allows AWS Data Exchange to assume the role and
  /// grant and revoke permissions to AWS Lake Formation data permissions.
  final String roleArn;

  /// A structure for the database object.
  final DatabaseLFTagPolicyAndPermissions? database;

  /// A structure for the table object.
  final TableLFTagPolicyAndPermissions? table;

  ImportAssetsFromLakeFormationTagPolicyResponseDetails({
    required this.catalogId,
    required this.dataSetId,
    required this.revisionId,
    required this.roleArn,
    this.database,
    this.table,
  });

  factory ImportAssetsFromLakeFormationTagPolicyResponseDetails.fromJson(
      Map<String, dynamic> json) {
    return ImportAssetsFromLakeFormationTagPolicyResponseDetails(
      catalogId: (json['CatalogId'] as String?) ?? '',
      dataSetId: (json['DataSetId'] as String?) ?? '',
      revisionId: (json['RevisionId'] as String?) ?? '',
      roleArn: (json['RoleArn'] as String?) ?? '',
      database: json['Database'] != null
          ? DatabaseLFTagPolicyAndPermissions.fromJson(
              json['Database'] as Map<String, dynamic>)
          : null,
      table: json['Table'] != null
          ? TableLFTagPolicyAndPermissions.fromJson(
              json['Table'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final catalogId = this.catalogId;
    final dataSetId = this.dataSetId;
    final revisionId = this.revisionId;
    final roleArn = this.roleArn;
    final database = this.database;
    final table = this.table;
    return {
      'CatalogId': catalogId,
      'DataSetId': dataSetId,
      'RevisionId': revisionId,
      'RoleArn': roleArn,
      if (database != null) 'Database': database,
      if (table != null) 'Table': table,
    };
  }
}

/// The LF-tag policy and permissions for database resources.
class DatabaseLFTagPolicyAndPermissions {
  /// A list of LF-tag conditions that apply to database resources.
  final List<LFTag> expression;

  /// The permissions granted to subscribers on database resources.
  final List<DatabaseLFTagPolicyPermission> permissions;

  DatabaseLFTagPolicyAndPermissions({
    required this.expression,
    required this.permissions,
  });

  factory DatabaseLFTagPolicyAndPermissions.fromJson(
      Map<String, dynamic> json) {
    return DatabaseLFTagPolicyAndPermissions(
      expression: ((json['Expression'] as List?) ?? const [])
          .nonNulls
          .map((e) => LFTag.fromJson(e as Map<String, dynamic>))
          .toList(),
      permissions: ((json['Permissions'] as List?) ?? const [])
          .nonNulls
          .map((e) => DatabaseLFTagPolicyPermission.fromString((e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final expression = this.expression;
    final permissions = this.permissions;
    return {
      'Expression': expression,
      'Permissions': permissions.map((e) => e.value).toList(),
    };
  }
}

/// The LF-tag policy and permissions that apply to table resources.
class TableLFTagPolicyAndPermissions {
  /// A list of LF-tag conditions that apply to table resources.
  final List<LFTag> expression;

  /// The permissions granted to subscribers on table resources.
  final List<TableTagPolicyLFPermission> permissions;

  TableLFTagPolicyAndPermissions({
    required this.expression,
    required this.permissions,
  });

  factory TableLFTagPolicyAndPermissions.fromJson(Map<String, dynamic> json) {
    return TableLFTagPolicyAndPermissions(
      expression: ((json['Expression'] as List?) ?? const [])
          .nonNulls
          .map((e) => LFTag.fromJson(e as Map<String, dynamic>))
          .toList(),
      permissions: ((json['Permissions'] as List?) ?? const [])
          .nonNulls
          .map((e) => TableTagPolicyLFPermission.fromString((e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final expression = this.expression;
    final permissions = this.permissions;
    return {
      'Expression': expression,
      'Permissions': permissions.map((e) => e.value).toList(),
    };
  }
}

class TableTagPolicyLFPermission {
  static const describe = TableTagPolicyLFPermission._('DESCRIBE');
  static const select = TableTagPolicyLFPermission._('SELECT');

  final String value;

  const TableTagPolicyLFPermission._(this.value);

  static const values = [describe, select];

  static TableTagPolicyLFPermission fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TableTagPolicyLFPermission._(value));

  @override
  bool operator ==(other) =>
      other is TableTagPolicyLFPermission && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class DatabaseLFTagPolicyPermission {
  static const describe = DatabaseLFTagPolicyPermission._('DESCRIBE');

  final String value;

  const DatabaseLFTagPolicyPermission._(this.value);

  static const values = [describe];

  static DatabaseLFTagPolicyPermission fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DatabaseLFTagPolicyPermission._(value));

  @override
  bool operator ==(other) =>
      other is DatabaseLFTagPolicyPermission && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Source details for an Amazon S3 data access asset.
class S3DataAccessAssetSourceEntry {
  /// The Amazon S3 bucket used for hosting shared data in the Amazon S3 data
  /// access.
  final String bucket;

  /// Organizes Amazon S3 asset key prefixes stored in an Amazon S3 bucket.
  final List<String>? keyPrefixes;

  /// The keys used to create the Amazon S3 data access.
  final List<String>? keys;

  /// List of AWS KMS CMKs (Key Management System Customer Managed Keys) and ARNs
  /// used to encrypt S3 objects being shared in this S3 Data Access asset.
  final List<KmsKeyToGrant>? kmsKeysToGrant;

  S3DataAccessAssetSourceEntry({
    required this.bucket,
    this.keyPrefixes,
    this.keys,
    this.kmsKeysToGrant,
  });

  factory S3DataAccessAssetSourceEntry.fromJson(Map<String, dynamic> json) {
    return S3DataAccessAssetSourceEntry(
      bucket: (json['Bucket'] as String?) ?? '',
      keyPrefixes: (json['KeyPrefixes'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      keys: (json['Keys'] as List?)?.nonNulls.map((e) => e as String).toList(),
      kmsKeysToGrant: (json['KmsKeysToGrant'] as List?)
          ?.nonNulls
          .map((e) => KmsKeyToGrant.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final keyPrefixes = this.keyPrefixes;
    final keys = this.keys;
    final kmsKeysToGrant = this.kmsKeysToGrant;
    return {
      'Bucket': bucket,
      if (keyPrefixes != null) 'KeyPrefixes': keyPrefixes,
      if (keys != null) 'Keys': keys,
      if (kmsKeysToGrant != null) 'KmsKeysToGrant': kmsKeysToGrant,
    };
  }
}

/// The source of the Amazon Redshift datashare asset.
class RedshiftDataShareAssetSourceEntry {
  /// The Amazon Resource Name (ARN) of the datashare asset.
  final String dataShareArn;

  RedshiftDataShareAssetSourceEntry({
    required this.dataShareArn,
  });

  factory RedshiftDataShareAssetSourceEntry.fromJson(
      Map<String, dynamic> json) {
    return RedshiftDataShareAssetSourceEntry(
      dataShareArn: (json['DataShareArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final dataShareArn = this.dataShareArn;
    return {
      'DataShareArn': dataShareArn,
    };
  }
}

/// The destination where the assets in the revision will be exported.
class RevisionDestinationEntry {
  /// The Amazon S3 bucket that is the destination for the assets in the revision.
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
      bucket: (json['Bucket'] as String?) ?? '',
      revisionId: (json['RevisionId'] as String?) ?? '',
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

/// The destination for the asset.
class AssetDestinationEntry {
  /// The unique identifier for the asset.
  final String assetId;

  /// The Amazon S3 bucket that is the destination for the asset.
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
      assetId: (json['AssetId'] as String?) ?? '',
      bucket: (json['Bucket'] as String?) ?? '',
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

/// A tag consisting of a key-value pair that can be applied to a resource.
class Tag {
  /// The key of the tag.
  final String key;

  /// The value of the tag.
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

/// An event action is an object that defines the relationship between a
/// specific event and an automated action that will be taken on behalf of the
/// customer.
class EventActionEntry {
  /// What occurs after a certain event.
  final Action action;

  /// The Amazon Resource Name (ARN) for the event action.
  final String arn;

  /// The date and time that the event action was created, in ISO 8601 format.
  final DateTime createdAt;

  /// What occurs to start an action.
  final Event event;

  /// The unique identifier for the event action.
  final String id;

  /// The date and time that the event action was last updated, in ISO 8601
  /// format.
  final DateTime updatedAt;

  EventActionEntry({
    required this.action,
    required this.arn,
    required this.createdAt,
    required this.event,
    required this.id,
    required this.updatedAt,
  });

  factory EventActionEntry.fromJson(Map<String, dynamic> json) {
    return EventActionEntry(
      action: Action.fromJson((json['Action'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
      arn: (json['Arn'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] ?? 0),
      event: Event.fromJson((json['Event'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
      id: (json['Id'] as String?) ?? '',
      updatedAt: nonNullableTimeStampFromJson(json['UpdatedAt'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final arn = this.arn;
    final createdAt = this.createdAt;
    final event = this.event;
    final id = this.id;
    final updatedAt = this.updatedAt;
    return {
      'Action': action,
      'Arn': arn,
      'CreatedAt': iso8601ToJson(createdAt),
      'Event': event,
      'Id': id,
      'UpdatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// A data set is an AWS resource with one or more revisions.
class DataSetEntry {
  /// The ARN for the data set.
  final String arn;

  /// The type of asset that is added to a data set.
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
      arn: (json['Arn'] as String?) ?? '',
      assetType: AssetType.fromString((json['AssetType'] as String?) ?? ''),
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] ?? 0),
      description: (json['Description'] as String?) ?? '',
      id: (json['Id'] as String?) ?? '',
      name: (json['Name'] as String?) ?? '',
      origin: Origin.fromString((json['Origin'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['UpdatedAt'] ?? 0),
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
      'AssetType': assetType.value,
      'CreatedAt': iso8601ToJson(createdAt),
      'Description': description,
      'Id': id,
      'Name': name,
      'Origin': origin.value,
      'UpdatedAt': iso8601ToJson(updatedAt),
      if (originDetails != null) 'OriginDetails': originDetails,
      if (sourceId != null) 'SourceId': sourceId,
    };
  }
}

/// A revision is a container for one or more assets.
class RevisionEntry {
  /// The ARN for the revision.
  final String arn;

  /// The date and time that the revision was created, in ISO 8601 format.
  final DateTime createdAt;

  /// The unique identifier for the data set associated with the data set
  /// revision.
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
  /// state, you can publish the revision to your products. Finalized revisions
  /// can be published through the AWS Data Exchange console or the AWS
  /// Marketplace Catalog API, using the StartChangeSet AWS Marketplace Catalog
  /// API action. When using the API, revisions are uniquely identified by their
  /// ARN.
  final bool? finalized;

  /// A required comment to inform subscribers of the reason their access to the
  /// revision was revoked.
  final String? revocationComment;

  /// A status indicating that subscribers' access to the revision was revoked.
  final bool? revoked;

  /// The date and time that the revision was revoked, in ISO 8601 format.
  final DateTime? revokedAt;

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
    this.revocationComment,
    this.revoked,
    this.revokedAt,
    this.sourceId,
  });

  factory RevisionEntry.fromJson(Map<String, dynamic> json) {
    return RevisionEntry(
      arn: (json['Arn'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] ?? 0),
      dataSetId: (json['DataSetId'] as String?) ?? '',
      id: (json['Id'] as String?) ?? '',
      updatedAt: nonNullableTimeStampFromJson(json['UpdatedAt'] ?? 0),
      comment: json['Comment'] as String?,
      finalized: json['Finalized'] as bool?,
      revocationComment: json['RevocationComment'] as String?,
      revoked: json['Revoked'] as bool?,
      revokedAt: timeStampFromJson(json['RevokedAt']),
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
    final revocationComment = this.revocationComment;
    final revoked = this.revoked;
    final revokedAt = this.revokedAt;
    final sourceId = this.sourceId;
    return {
      'Arn': arn,
      'CreatedAt': iso8601ToJson(createdAt),
      'DataSetId': dataSetId,
      'Id': id,
      'UpdatedAt': iso8601ToJson(updatedAt),
      if (comment != null) 'Comment': comment,
      if (finalized != null) 'Finalized': finalized,
      if (revocationComment != null) 'RevocationComment': revocationComment,
      if (revoked != null) 'Revoked': revoked,
      if (revokedAt != null) 'RevokedAt': iso8601ToJson(revokedAt),
      if (sourceId != null) 'SourceId': sourceId,
    };
  }
}

/// Information about a data grant.
class DataGrantSummaryEntry {
  /// The acceptance state of the data grant.
  final DataGrantAcceptanceState acceptanceState;

  /// The Amazon Resource Name (ARN) of the data grant.
  final String arn;

  /// The timestamp of when the data grant was created.
  final DateTime createdAt;

  /// The ID of the data set associated to the data grant.
  final String dataSetId;

  /// The ID of the data grant.
  final String id;

  /// The name of the data grant.
  final String name;

  /// The Amazon Web Services account ID of the data grant receiver.
  final String receiverPrincipal;

  /// The Amazon Web Services account ID of the data grant sender.
  final String senderPrincipal;

  /// The ID of the data set used to create the data grant.
  final String sourceDataSetId;

  /// The timestamp of when the data grant was last updated.
  final DateTime updatedAt;

  /// The timestamp of when the data grant was accepted.
  final DateTime? acceptedAt;

  /// The timestamp of when access to the associated data set ends.
  final DateTime? endsAt;

  DataGrantSummaryEntry({
    required this.acceptanceState,
    required this.arn,
    required this.createdAt,
    required this.dataSetId,
    required this.id,
    required this.name,
    required this.receiverPrincipal,
    required this.senderPrincipal,
    required this.sourceDataSetId,
    required this.updatedAt,
    this.acceptedAt,
    this.endsAt,
  });

  factory DataGrantSummaryEntry.fromJson(Map<String, dynamic> json) {
    return DataGrantSummaryEntry(
      acceptanceState: DataGrantAcceptanceState.fromString(
          (json['AcceptanceState'] as String?) ?? ''),
      arn: (json['Arn'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] ?? 0),
      dataSetId: (json['DataSetId'] as String?) ?? '',
      id: (json['Id'] as String?) ?? '',
      name: (json['Name'] as String?) ?? '',
      receiverPrincipal: (json['ReceiverPrincipal'] as String?) ?? '',
      senderPrincipal: (json['SenderPrincipal'] as String?) ?? '',
      sourceDataSetId: (json['SourceDataSetId'] as String?) ?? '',
      updatedAt: nonNullableTimeStampFromJson(json['UpdatedAt'] ?? 0),
      acceptedAt: timeStampFromJson(json['AcceptedAt']),
      endsAt: timeStampFromJson(json['EndsAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final acceptanceState = this.acceptanceState;
    final arn = this.arn;
    final createdAt = this.createdAt;
    final dataSetId = this.dataSetId;
    final id = this.id;
    final name = this.name;
    final receiverPrincipal = this.receiverPrincipal;
    final senderPrincipal = this.senderPrincipal;
    final sourceDataSetId = this.sourceDataSetId;
    final updatedAt = this.updatedAt;
    final acceptedAt = this.acceptedAt;
    final endsAt = this.endsAt;
    return {
      'AcceptanceState': acceptanceState.value,
      'Arn': arn,
      'CreatedAt': iso8601ToJson(createdAt),
      'DataSetId': dataSetId,
      'Id': id,
      'Name': name,
      'ReceiverPrincipal': receiverPrincipal,
      'SenderPrincipal': senderPrincipal,
      'SourceDataSetId': sourceDataSetId,
      'UpdatedAt': iso8601ToJson(updatedAt),
      if (acceptedAt != null) 'AcceptedAt': iso8601ToJson(acceptedAt),
      if (endsAt != null) 'EndsAt': iso8601ToJson(endsAt),
    };
  }
}

class GrantDistributionScope {
  static const awsOrganization = GrantDistributionScope._('AWS_ORGANIZATION');
  static const none = GrantDistributionScope._('NONE');

  final String value;

  const GrantDistributionScope._(this.value);

  static const values = [awsOrganization, none];

  static GrantDistributionScope fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => GrantDistributionScope._(value));

  @override
  bool operator ==(other) =>
      other is GrantDistributionScope && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The details for the request.
class RequestDetails {
  /// Details of the request to create S3 data access from the Amazon S3 bucket.
  final CreateS3DataAccessFromS3BucketRequestDetails?
      createS3DataAccessFromS3Bucket;

  /// Details about the export to signed URL request.
  final ExportAssetToSignedUrlRequestDetails? exportAssetToSignedUrl;

  /// Details about the export to Amazon S3 request.
  final ExportAssetsToS3RequestDetails? exportAssetsToS3;

  /// Details about the export to Amazon S3 request.
  final ExportRevisionsToS3RequestDetails? exportRevisionsToS3;

  /// Details about the import from signed URL request.
  final ImportAssetFromApiGatewayApiRequestDetails?
      importAssetFromApiGatewayApi;

  /// Details about the import from Amazon S3 request.
  final ImportAssetFromSignedUrlRequestDetails? importAssetFromSignedUrl;

  /// Request details for the ImportAssetsFromLakeFormationTagPolicy job.
  final ImportAssetsFromLakeFormationTagPolicyRequestDetails?
      importAssetsFromLakeFormationTagPolicy;

  /// Details from an import from Amazon Redshift datashare request.
  final ImportAssetsFromRedshiftDataSharesRequestDetails?
      importAssetsFromRedshiftDataShares;

  /// Details about the import asset from API Gateway API request.
  final ImportAssetsFromS3RequestDetails? importAssetsFromS3;

  RequestDetails({
    this.createS3DataAccessFromS3Bucket,
    this.exportAssetToSignedUrl,
    this.exportAssetsToS3,
    this.exportRevisionsToS3,
    this.importAssetFromApiGatewayApi,
    this.importAssetFromSignedUrl,
    this.importAssetsFromLakeFormationTagPolicy,
    this.importAssetsFromRedshiftDataShares,
    this.importAssetsFromS3,
  });

  Map<String, dynamic> toJson() {
    final createS3DataAccessFromS3Bucket = this.createS3DataAccessFromS3Bucket;
    final exportAssetToSignedUrl = this.exportAssetToSignedUrl;
    final exportAssetsToS3 = this.exportAssetsToS3;
    final exportRevisionsToS3 = this.exportRevisionsToS3;
    final importAssetFromApiGatewayApi = this.importAssetFromApiGatewayApi;
    final importAssetFromSignedUrl = this.importAssetFromSignedUrl;
    final importAssetsFromLakeFormationTagPolicy =
        this.importAssetsFromLakeFormationTagPolicy;
    final importAssetsFromRedshiftDataShares =
        this.importAssetsFromRedshiftDataShares;
    final importAssetsFromS3 = this.importAssetsFromS3;
    return {
      if (createS3DataAccessFromS3Bucket != null)
        'CreateS3DataAccessFromS3Bucket': createS3DataAccessFromS3Bucket,
      if (exportAssetToSignedUrl != null)
        'ExportAssetToSignedUrl': exportAssetToSignedUrl,
      if (exportAssetsToS3 != null) 'ExportAssetsToS3': exportAssetsToS3,
      if (exportRevisionsToS3 != null)
        'ExportRevisionsToS3': exportRevisionsToS3,
      if (importAssetFromApiGatewayApi != null)
        'ImportAssetFromApiGatewayApi': importAssetFromApiGatewayApi,
      if (importAssetFromSignedUrl != null)
        'ImportAssetFromSignedUrl': importAssetFromSignedUrl,
      if (importAssetsFromLakeFormationTagPolicy != null)
        'ImportAssetsFromLakeFormationTagPolicy':
            importAssetsFromLakeFormationTagPolicy,
      if (importAssetsFromRedshiftDataShares != null)
        'ImportAssetsFromRedshiftDataShares':
            importAssetsFromRedshiftDataShares,
      if (importAssetsFromS3 != null) 'ImportAssetsFromS3': importAssetsFromS3,
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

/// Details of the operation to be performed by the job.
class ImportAssetFromSignedUrlRequestDetails {
  /// The name of the asset. When importing from Amazon S3, the Amazon S3 object
  /// key is used as the asset name.
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

/// Details of the operation to be performed by the job.
class ImportAssetsFromS3RequestDetails {
  /// Is a list of Amazon S3 bucket and object key pairs.
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

/// Details from an import from Amazon Redshift datashare request.
class ImportAssetsFromRedshiftDataSharesRequestDetails {
  /// A list of Amazon Redshift datashare assets.
  final List<RedshiftDataShareAssetSourceEntry> assetSources;

  /// The unique identifier for the data set associated with this import job.
  final String dataSetId;

  /// The unique identifier for the revision associated with this import job.
  final String revisionId;

  ImportAssetsFromRedshiftDataSharesRequestDetails({
    required this.assetSources,
    required this.dataSetId,
    required this.revisionId,
  });

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

/// The request details.
class ImportAssetFromApiGatewayApiRequestDetails {
  /// The API Gateway API ID.
  final String apiId;

  /// The API name.
  final String apiName;

  /// The Base64-encoded MD5 hash of the OpenAPI 3.0 JSON API specification file.
  /// It is used to ensure the integrity of the file.
  final String apiSpecificationMd5Hash;

  /// The data set ID.
  final String dataSetId;

  /// The protocol type.
  final ProtocolType protocolType;

  /// The revision ID.
  final String revisionId;

  /// The API stage.
  final String stage;

  /// The API description. Markdown supported.
  final String? apiDescription;

  /// The API Gateway API key.
  final String? apiKey;

  ImportAssetFromApiGatewayApiRequestDetails({
    required this.apiId,
    required this.apiName,
    required this.apiSpecificationMd5Hash,
    required this.dataSetId,
    required this.protocolType,
    required this.revisionId,
    required this.stage,
    this.apiDescription,
    this.apiKey,
  });

  Map<String, dynamic> toJson() {
    final apiId = this.apiId;
    final apiName = this.apiName;
    final apiSpecificationMd5Hash = this.apiSpecificationMd5Hash;
    final dataSetId = this.dataSetId;
    final protocolType = this.protocolType;
    final revisionId = this.revisionId;
    final stage = this.stage;
    final apiDescription = this.apiDescription;
    final apiKey = this.apiKey;
    return {
      'ApiId': apiId,
      'ApiName': apiName,
      'ApiSpecificationMd5Hash': apiSpecificationMd5Hash,
      'DataSetId': dataSetId,
      'ProtocolType': protocolType.value,
      'RevisionId': revisionId,
      'Stage': stage,
      if (apiDescription != null) 'ApiDescription': apiDescription,
      if (apiKey != null) 'ApiKey': apiKey,
    };
  }
}

/// Details of the operation to create an Amazon S3 data access from an S3
/// bucket.
class CreateS3DataAccessFromS3BucketRequestDetails {
  /// Details about the S3 data access source asset.
  final S3DataAccessAssetSourceEntry assetSource;

  /// The unique identifier for the data set associated with the creation of this
  /// Amazon S3 data access.
  final String dataSetId;

  /// The unique identifier for a revision.
  final String revisionId;

  CreateS3DataAccessFromS3BucketRequestDetails({
    required this.assetSource,
    required this.dataSetId,
    required this.revisionId,
  });

  Map<String, dynamic> toJson() {
    final assetSource = this.assetSource;
    final dataSetId = this.dataSetId;
    final revisionId = this.revisionId;
    return {
      'AssetSource': assetSource,
      'DataSetId': dataSetId,
      'RevisionId': revisionId,
    };
  }
}

/// Details about the assets imported from an AWS Lake Formation tag policy
/// request.
class ImportAssetsFromLakeFormationTagPolicyRequestDetails {
  /// The identifier for the AWS Glue Data Catalog.
  final String catalogId;

  /// The unique identifier for the data set associated with this import job.
  final String dataSetId;

  /// The unique identifier for the revision associated with this import job.
  final String revisionId;

  /// The IAM role's ARN that allows AWS Data Exchange to assume the role and
  /// grant and revoke permissions of subscribers to AWS Lake Formation data
  /// permissions.
  final String roleArn;

  /// A structure for the database object.
  final DatabaseLFTagPolicyAndPermissions? database;

  /// A structure for the table object.
  final TableLFTagPolicyAndPermissions? table;

  ImportAssetsFromLakeFormationTagPolicyRequestDetails({
    required this.catalogId,
    required this.dataSetId,
    required this.revisionId,
    required this.roleArn,
    this.database,
    this.table,
  });

  Map<String, dynamic> toJson() {
    final catalogId = this.catalogId;
    final dataSetId = this.dataSetId;
    final revisionId = this.revisionId;
    final roleArn = this.roleArn;
    final database = this.database;
    final table = this.table;
    return {
      'CatalogId': catalogId,
      'DataSetId': dataSetId,
      'RevisionId': revisionId,
      'RoleArn': roleArn,
      if (database != null) 'Database': database,
      if (table != null) 'Table': table,
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
