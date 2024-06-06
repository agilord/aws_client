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
            signingName: 'dataexchange',
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

  /// This operation cancels a job. Jobs can be cancelled only when they are in
  /// the WAITING state.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
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

  /// This operation creates a data set.
  ///
  /// May throw [ServiceLimitExceededException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
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

  /// This operation creates an event action.
  ///
  /// May throw [ServiceLimitExceededException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [action] :
  /// What occurs after a certain event.
  ///
  /// Parameter [event] :
  /// What occurs to start an action.
  Future<CreateEventActionResponse> createEventAction({
    required Action action,
    required Event event,
  }) async {
    final $payload = <String, dynamic>{
      'Action': action,
      'Event': event,
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
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
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
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
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

  /// This operation deletes a data set.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
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
    final $query = <String, List<String>>{
      if (queryStringParameters != null)
        for (var e in queryStringParameters.entries) e.key: [e.value],
    };
    final response = await _protocol.sendRaw(
      payload: body,
      method: 'POST',
      requestUri: '/v1',
      queryParams: $query,
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
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
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
      'Type': type.toValue(),
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
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
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
      protocolType: (json['ProtocolType'] as String?)?.toProtocolType(),
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
      if (protocolType != null) 'ProtocolType': protocolType.toValue(),
      if (stage != null) 'Stage': stage,
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

enum AssetType {
  s3Snapshot,
  redshiftDataShare,
  apiGatewayApi,
  s3DataAccess,
  lakeFormationDataPermission,
}

extension AssetTypeValueExtension on AssetType {
  String toValue() {
    switch (this) {
      case AssetType.s3Snapshot:
        return 'S3_SNAPSHOT';
      case AssetType.redshiftDataShare:
        return 'REDSHIFT_DATA_SHARE';
      case AssetType.apiGatewayApi:
        return 'API_GATEWAY_API';
      case AssetType.s3DataAccess:
        return 'S3_DATA_ACCESS';
      case AssetType.lakeFormationDataPermission:
        return 'LAKE_FORMATION_DATA_PERMISSION';
    }
  }
}

extension AssetTypeFromString on String {
  AssetType toAssetType() {
    switch (this) {
      case 'S3_SNAPSHOT':
        return AssetType.s3Snapshot;
      case 'REDSHIFT_DATA_SHARE':
        return AssetType.redshiftDataShare;
      case 'API_GATEWAY_API':
        return AssetType.apiGatewayApi;
      case 'S3_DATA_ACCESS':
        return AssetType.s3DataAccess;
      case 'LAKE_FORMATION_DATA_PERMISSION':
        return AssetType.lakeFormationDataPermission;
    }
    throw Exception('$this is not known in enum AssetType');
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
      bucket: json['Bucket'] as String,
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
          json['RevisionDestination'] as Map<String, dynamic>),
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

enum Code {
  accessDeniedException,
  internalServerException,
  malwareDetected,
  resourceNotFoundException,
  serviceQuotaExceededException,
  validationException,
  malwareScanEncryptedFile,
}

extension CodeValueExtension on Code {
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

extension CodeFromString on String {
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

  /// The date and time that the event action was last updated, in ISO 8601
  /// format.
  final DateTime? updatedAt;

  CreateEventActionResponse({
    this.action,
    this.arn,
    this.createdAt,
    this.event,
    this.id,
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
          json['AssetSource'] as Map<String, dynamic>),
      dataSetId: json['DataSetId'] as String,
      revisionId: json['RevisionId'] as String,
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

/// The LF-tag policy for database resources.
class DatabaseLFTagPolicy {
  /// A list of LF-tag conditions that apply to database resources.
  final List<LFTag> expression;

  DatabaseLFTagPolicy({
    required this.expression,
  });

  factory DatabaseLFTagPolicy.fromJson(Map<String, dynamic> json) {
    return DatabaseLFTagPolicy(
      expression: (json['Expression'] as List)
          .whereNotNull()
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
      expression: (json['Expression'] as List)
          .whereNotNull()
          .map((e) => LFTag.fromJson(e as Map<String, dynamic>))
          .toList(),
      permissions: (json['Permissions'] as List)
          .whereNotNull()
          .map((e) => (e as String).toDatabaseLFTagPolicyPermission())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final expression = this.expression;
    final permissions = this.permissions;
    return {
      'Expression': expression,
      'Permissions': permissions.map((e) => e.toValue()).toList(),
    };
  }
}

enum DatabaseLFTagPolicyPermission {
  describe,
}

extension DatabaseLFTagPolicyPermissionValueExtension
    on DatabaseLFTagPolicyPermission {
  String toValue() {
    switch (this) {
      case DatabaseLFTagPolicyPermission.describe:
        return 'DESCRIBE';
    }
  }
}

extension DatabaseLFTagPolicyPermissionFromString on String {
  DatabaseLFTagPolicyPermission toDatabaseLFTagPolicyPermission() {
    switch (this) {
      case 'DESCRIBE':
        return DatabaseLFTagPolicyPermission.describe;
    }
    throw Exception('$this is not known in enum DatabaseLFTagPolicyPermission');
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
      action: Action.fromJson(json['Action'] as Map<String, dynamic>),
      arn: json['Arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] as Object),
      event: Event.fromJson(json['Event'] as Map<String, dynamic>),
      id: json['Id'] as String,
      updatedAt: nonNullableTimeStampFromJson(json['UpdatedAt'] as Object),
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

  /// The date and time that the event action was last updated, in ISO 8601
  /// format.
  final DateTime? updatedAt;

  GetEventActionResponse({
    this.action,
    this.arn,
    this.createdAt,
    this.event,
    this.id,
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
      'ProtocolType': protocolType.toValue(),
      'RevisionId': revisionId,
      'Stage': stage,
      if (apiDescription != null) 'ApiDescription': apiDescription,
      if (apiKey != null) 'ApiKey': apiKey,
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
      apiId: json['ApiId'] as String,
      apiName: json['ApiName'] as String,
      apiSpecificationMd5Hash: json['ApiSpecificationMd5Hash'] as String,
      apiSpecificationUploadUrl: json['ApiSpecificationUploadUrl'] as String,
      apiSpecificationUploadUrlExpiresAt: nonNullableTimeStampFromJson(
          json['ApiSpecificationUploadUrlExpiresAt'] as Object),
      dataSetId: json['DataSetId'] as String,
      protocolType: (json['ProtocolType'] as String).toProtocolType(),
      revisionId: json['RevisionId'] as String,
      stage: json['Stage'] as String,
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
      'ProtocolType': protocolType.toValue(),
      'RevisionId': revisionId,
      'Stage': stage,
      if (apiDescription != null) 'ApiDescription': apiDescription,
      if (apiKey != null) 'ApiKey': apiKey,
    };
  }
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
      catalogId: json['CatalogId'] as String,
      dataSetId: json['DataSetId'] as String,
      revisionId: json['RevisionId'] as String,
      roleArn: json['RoleArn'] as String,
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
      assetSources: (json['AssetSources'] as List)
          .whereNotNull()
          .map((e) => RedshiftDataShareAssetSourceEntry.fromJson(
              e as Map<String, dynamic>))
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

enum JobErrorLimitName {
  assetsPerRevision,
  assetSizeInGb,
  amazonRedshiftDatashareAssetsPerRevision,
  awsLakeFormationDataPermissionAssetsPerRevision,
  amazonS3DataAccessAssetsPerRevision,
}

extension JobErrorLimitNameValueExtension on JobErrorLimitName {
  String toValue() {
    switch (this) {
      case JobErrorLimitName.assetsPerRevision:
        return 'Assets per revision';
      case JobErrorLimitName.assetSizeInGb:
        return 'Asset size in GB';
      case JobErrorLimitName.amazonRedshiftDatashareAssetsPerRevision:
        return 'Amazon Redshift datashare assets per revision';
      case JobErrorLimitName.awsLakeFormationDataPermissionAssetsPerRevision:
        return 'AWS Lake Formation data permission assets per revision';
      case JobErrorLimitName.amazonS3DataAccessAssetsPerRevision:
        return 'Amazon S3 data access assets per revision';
    }
  }
}

extension JobErrorLimitNameFromString on String {
  JobErrorLimitName toJobErrorLimitName() {
    switch (this) {
      case 'Assets per revision':
        return JobErrorLimitName.assetsPerRevision;
      case 'Asset size in GB':
        return JobErrorLimitName.assetSizeInGb;
      case 'Amazon Redshift datashare assets per revision':
        return JobErrorLimitName.amazonRedshiftDatashareAssetsPerRevision;
      case 'AWS Lake Formation data permission assets per revision':
        return JobErrorLimitName
            .awsLakeFormationDataPermissionAssetsPerRevision;
      case 'Amazon S3 data access assets per revision':
        return JobErrorLimitName.amazonS3DataAccessAssetsPerRevision;
    }
    throw Exception('$this is not known in enum JobErrorLimitName');
  }
}

enum JobErrorResourceTypes {
  revision,
  asset,
  dataSet,
}

extension JobErrorResourceTypesValueExtension on JobErrorResourceTypes {
  String toValue() {
    switch (this) {
      case JobErrorResourceTypes.revision:
        return 'REVISION';
      case JobErrorResourceTypes.asset:
        return 'ASSET';
      case JobErrorResourceTypes.dataSet:
        return 'DATA_SET';
    }
  }
}

extension JobErrorResourceTypesFromString on String {
  JobErrorResourceTypes toJobErrorResourceTypes() {
    switch (this) {
      case 'REVISION':
        return JobErrorResourceTypes.revision;
      case 'ASSET':
        return JobErrorResourceTypes.asset;
      case 'DATA_SET':
        return JobErrorResourceTypes.dataSet;
    }
    throw Exception('$this is not known in enum JobErrorResourceTypes');
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

enum LFPermission {
  describe,
  select,
}

extension LFPermissionValueExtension on LFPermission {
  String toValue() {
    switch (this) {
      case LFPermission.describe:
        return 'DESCRIBE';
      case LFPermission.select:
        return 'SELECT';
    }
  }
}

extension LFPermissionFromString on String {
  LFPermission toLFPermission() {
    switch (this) {
      case 'DESCRIBE':
        return LFPermission.describe;
      case 'SELECT':
        return LFPermission.select;
    }
    throw Exception('$this is not known in enum LFPermission');
  }
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

enum LFResourceType {
  table,
  database,
}

extension LFResourceTypeValueExtension on LFResourceType {
  String toValue() {
    switch (this) {
      case LFResourceType.table:
        return 'TABLE';
      case LFResourceType.database:
        return 'DATABASE';
    }
  }
}

extension LFResourceTypeFromString on String {
  LFResourceType toLFResourceType() {
    switch (this) {
      case 'TABLE':
        return LFResourceType.table;
      case 'DATABASE':
        return LFResourceType.database;
    }
    throw Exception('$this is not known in enum LFResourceType');
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
      tagKey: json['TagKey'] as String,
      tagValues: (json['TagValues'] as List)
          .whereNotNull()
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
      catalogId: json['CatalogId'] as String,
      resourceDetails: LFResourceDetails.fromJson(
          json['ResourceDetails'] as Map<String, dynamic>),
      resourceType: (json['ResourceType'] as String).toLFResourceType(),
    );
  }

  Map<String, dynamic> toJson() {
    final catalogId = this.catalogId;
    final resourceDetails = this.resourceDetails;
    final resourceType = this.resourceType;
    return {
      'CatalogId': catalogId,
      'ResourceDetails': resourceDetails,
      'ResourceType': resourceType.toValue(),
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
              json['LakeFormationDataPermissionDetails']
                  as Map<String, dynamic>),
      lakeFormationDataPermissionType:
          (json['LakeFormationDataPermissionType'] as String)
              .toLakeFormationDataPermissionType(),
      permissions: (json['Permissions'] as List)
          .whereNotNull()
          .map((e) => (e as String).toLFPermission())
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
      'LakeFormationDataPermissionType':
          lakeFormationDataPermissionType.toValue(),
      'Permissions': permissions.map((e) => e.toValue()).toList(),
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

enum LakeFormationDataPermissionType {
  lFTagPolicy,
}

extension LakeFormationDataPermissionTypeValueExtension
    on LakeFormationDataPermissionType {
  String toValue() {
    switch (this) {
      case LakeFormationDataPermissionType.lFTagPolicy:
        return 'LFTagPolicy';
    }
  }
}

extension LakeFormationDataPermissionTypeFromString on String {
  LakeFormationDataPermissionType toLakeFormationDataPermissionType() {
    switch (this) {
      case 'LFTagPolicy':
        return LakeFormationDataPermissionType.lFTagPolicy;
    }
    throw Exception(
        '$this is not known in enum LakeFormationDataPermissionType');
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
          ?.whereNotNull()
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

enum NotificationType {
  dataDelay,
  dataUpdate,
  deprecation,
  schemaChange,
}

extension NotificationTypeValueExtension on NotificationType {
  String toValue() {
    switch (this) {
      case NotificationType.dataDelay:
        return 'DATA_DELAY';
      case NotificationType.dataUpdate:
        return 'DATA_UPDATE';
      case NotificationType.deprecation:
        return 'DEPRECATION';
      case NotificationType.schemaChange:
        return 'SCHEMA_CHANGE';
    }
  }
}

extension NotificationTypeFromString on String {
  NotificationType toNotificationType() {
    switch (this) {
      case 'DATA_DELAY':
        return NotificationType.dataDelay;
      case 'DATA_UPDATE':
        return NotificationType.dataUpdate;
      case 'DEPRECATION':
        return NotificationType.deprecation;
      case 'SCHEMA_CHANGE':
        return NotificationType.schemaChange;
    }
    throw Exception('$this is not known in enum NotificationType');
  }
}

enum Origin {
  owned,
  entitled,
}

extension OriginValueExtension on Origin {
  String toValue() {
    switch (this) {
      case Origin.owned:
        return 'OWNED';
      case Origin.entitled:
        return 'ENTITLED';
    }
  }
}

extension OriginFromString on String {
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

/// Details about the origin of the data set.
class OriginDetails {
  /// The product ID of the origin of the data set.
  final String? productId;

  OriginDetails({
    this.productId,
  });

  factory OriginDetails.fromJson(Map<String, dynamic> json) {
    return OriginDetails(
      productId: json['ProductId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final productId = this.productId;
    return {
      if (productId != null) 'ProductId': productId,
    };
  }
}

enum ProtocolType {
  rest,
}

extension ProtocolTypeValueExtension on ProtocolType {
  String toValue() {
    switch (this) {
      case ProtocolType.rest:
        return 'REST';
    }
  }
}

extension ProtocolTypeFromString on String {
  ProtocolType toProtocolType() {
    switch (this) {
      case 'REST':
        return ProtocolType.rest;
    }
    throw Exception('$this is not known in enum ProtocolType');
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
      arn: json['Arn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      'Arn': arn,
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
      dataShareArn: json['DataShareArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final dataShareArn = this.dataShareArn;
    return {
      'DataShareArn': dataShareArn,
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
      arn: json['Arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] as Object),
      dataSetId: json['DataSetId'] as String,
      id: json['Id'] as String,
      updatedAt: nonNullableTimeStampFromJson(json['UpdatedAt'] as Object),
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

/// Information about the published revision.
class RevisionPublished {
  /// The data set ID of the published revision.
  final String dataSetId;

  RevisionPublished({
    required this.dataSetId,
  });

  factory RevisionPublished.fromJson(Map<String, dynamic> json) {
    return RevisionPublished(
      dataSetId: json['DataSetId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final dataSetId = this.dataSetId;
    return {
      'DataSetId': dataSetId,
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
      bucket: json['Bucket'] as String,
      keyPrefixes: (json['KeyPrefixes'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      keys: (json['Keys'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      kmsKeysToGrant: (json['KmsKeysToGrant'] as List?)
          ?.whereNotNull()
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
      bucket: json['Bucket'] as String,
      keyPrefixes: (json['KeyPrefixes'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      keys: (json['Keys'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      kmsKeysToGrant: (json['KmsKeysToGrant'] as List?)
          ?.whereNotNull()
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

/// The Amazon S3 object that is the asset.
class S3SnapshotAsset {
  /// The size of the Amazon S3 object that is the object.
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
      'Type': type.toValue(),
      if (description != null) 'Description': description,
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

enum SchemaChangeType {
  add,
  remove,
  modify,
}

extension SchemaChangeTypeValueExtension on SchemaChangeType {
  String toValue() {
    switch (this) {
      case SchemaChangeType.add:
        return 'ADD';
      case SchemaChangeType.remove:
        return 'REMOVE';
      case SchemaChangeType.modify:
        return 'MODIFY';
    }
  }
}

extension SchemaChangeTypeFromString on String {
  SchemaChangeType toSchemaChangeType() {
    switch (this) {
      case 'ADD':
        return SchemaChangeType.add;
      case 'REMOVE':
        return SchemaChangeType.remove;
      case 'MODIFY':
        return SchemaChangeType.modify;
    }
    throw Exception('$this is not known in enum SchemaChangeType');
  }
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

enum ServerSideEncryptionTypes {
  awsKms,
  aes256,
}

extension ServerSideEncryptionTypesValueExtension on ServerSideEncryptionTypes {
  String toValue() {
    switch (this) {
      case ServerSideEncryptionTypes.awsKms:
        return 'aws:kms';
      case ServerSideEncryptionTypes.aes256:
        return 'AES256';
    }
  }
}

extension ServerSideEncryptionTypesFromString on String {
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

extension StateValueExtension on State {
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

extension StateFromString on String {
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

/// The LF-tag policy for a table resource.
class TableLFTagPolicy {
  /// A list of LF-tag conditions that apply to table resources.
  final List<LFTag> expression;

  TableLFTagPolicy({
    required this.expression,
  });

  factory TableLFTagPolicy.fromJson(Map<String, dynamic> json) {
    return TableLFTagPolicy(
      expression: (json['Expression'] as List)
          .whereNotNull()
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
      expression: (json['Expression'] as List)
          .whereNotNull()
          .map((e) => LFTag.fromJson(e as Map<String, dynamic>))
          .toList(),
      permissions: (json['Permissions'] as List)
          .whereNotNull()
          .map((e) => (e as String).toTableTagPolicyLFPermission())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final expression = this.expression;
    final permissions = this.permissions;
    return {
      'Expression': expression,
      'Permissions': permissions.map((e) => e.toValue()).toList(),
    };
  }
}

enum TableTagPolicyLFPermission {
  describe,
  select,
}

extension TableTagPolicyLFPermissionValueExtension
    on TableTagPolicyLFPermission {
  String toValue() {
    switch (this) {
      case TableTagPolicyLFPermission.describe:
        return 'DESCRIBE';
      case TableTagPolicyLFPermission.select:
        return 'SELECT';
    }
  }
}

extension TableTagPolicyLFPermissionFromString on String {
  TableTagPolicyLFPermission toTableTagPolicyLFPermission() {
    switch (this) {
      case 'DESCRIBE':
        return TableTagPolicyLFPermission.describe;
      case 'SELECT':
        return TableTagPolicyLFPermission.select;
    }
    throw Exception('$this is not known in enum TableTagPolicyLFPermission');
  }
}

enum Type {
  importAssetsFromS3,
  importAssetFromSignedUrl,
  exportAssetsToS3,
  exportAssetToSignedUrl,
  exportRevisionsToS3,
  importAssetsFromRedshiftDataShares,
  importAssetFromApiGatewayApi,
  createS3DataAccessFromS3Bucket,
  importAssetsFromLakeFormationTagPolicy,
}

extension TypeValueExtension on Type {
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
      case Type.importAssetsFromRedshiftDataShares:
        return 'IMPORT_ASSETS_FROM_REDSHIFT_DATA_SHARES';
      case Type.importAssetFromApiGatewayApi:
        return 'IMPORT_ASSET_FROM_API_GATEWAY_API';
      case Type.createS3DataAccessFromS3Bucket:
        return 'CREATE_S3_DATA_ACCESS_FROM_S3_BUCKET';
      case Type.importAssetsFromLakeFormationTagPolicy:
        return 'IMPORT_ASSETS_FROM_LAKE_FORMATION_TAG_POLICY';
    }
  }
}

extension TypeFromString on String {
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
      case 'IMPORT_ASSETS_FROM_REDSHIFT_DATA_SHARES':
        return Type.importAssetsFromRedshiftDataShares;
      case 'IMPORT_ASSET_FROM_API_GATEWAY_API':
        return Type.importAssetFromApiGatewayApi;
      case 'CREATE_S3_DATA_ACCESS_FROM_S3_BUCKET':
        return Type.createS3DataAccessFromS3Bucket;
      case 'IMPORT_ASSETS_FROM_LAKE_FORMATION_TAG_POLICY':
        return Type.importAssetsFromLakeFormationTagPolicy;
    }
    throw Exception('$this is not known in enum Type');
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
