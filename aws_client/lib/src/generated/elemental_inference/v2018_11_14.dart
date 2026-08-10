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

import 'v2018_11_14.endpoints.dart' as _endpoints;
export '../../shared/shared.dart' show AwsClientCredentials;

/// This is the AWS Elemental Inference REST API Reference. It provides
/// information on the URL, request contents, and response contents of each AWS
/// Elemental Inference REST operation.
///
/// We assume that you have the IAM permissions that you need to use AWS
/// Elemental Inference via the REST API. We also assume that you are familiar
/// with the features and operations of AWS Elemental Inference as described in
/// <i>AWS Elemental Inference User Guide</i>.
class ElementalInference {
  final _s.RestJsonProtocol _protocol;
  factory ElementalInference({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
    bool useFipsEndpoint = false,
    bool useDualStackEndpoint = false,
  }) {
    final service = _s.ServiceMetadata(
      endpointPrefix: 'elemental-inference',
    );
    return ElementalInference._(
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
      ),
    );
  }
  ElementalInference._({
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

  /// List all tags that are on an Elemental Inference resource in the current
  /// region.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource whose tags you want to query.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Searches for the fixtures (sports events, such as a specific basketball
  /// game) that are available for a sport in a date window. Each fixture in the
  /// response includes a fixtureId that you specify in the clipping output of a
  /// feed, so that Elemental Inference maps the event data for that fixture
  /// onto the clipping metadata. This operation is paginated: if there are more
  /// fixtures than fit in one page, the response includes a nextToken that you
  /// pass in a subsequent request.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [GatewayTimedOutException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestException].
  /// May throw [ValidationException].
  ///
  /// Parameter [sport] :
  /// The sport to search for fixtures. Valid values: basketball (search for
  /// basketball fixtures), american-football (search for american-football
  /// fixtures).
  ///
  /// Parameter [startDate] :
  /// The first day of the search window, in UTC. The search includes fixtures
  /// that are scheduled on this day.
  ///
  /// Specify the date in ISO 8601 format, as <code>YYYY-MM-DD</code>. For
  /// example, 2026-03-14.
  ///
  /// Parameter [endDate] :
  /// The last day of the search window, in UTC. The search includes fixtures
  /// that are scheduled on this day. Specify the date in ISO 8601 format, as
  /// <code>YYYY-MM-DD</code>.
  ///
  /// If you omit this parameter, Elemental Inference searches only the day that
  /// you specified in startDate. The window from startDate through endDate must
  /// not exceed seven days.
  ///
  /// Parameter [filters] :
  /// An array of filters that narrow the results. Each filter applies to one
  /// dimension of a fixture, such as the competitor. You can specify up to 10
  /// filters.
  ///
  /// A fixture must satisfy every filter in the array in order to appear in the
  /// results. Within one filter, a fixture must match at least one of the
  /// values.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of fixtures to return for each API request.
  ///
  /// The service might return fewer fixtures than the maxResults value. When
  /// more fixtures match the search, the response also includes a nextToken
  /// value that you can use to fetch the next batch of results.
  ///
  /// Parameter [nextToken] :
  /// The token that identifies the batch of results that you want to see.
  ///
  /// For example, you submit a SearchFixtures request with maxResults set at 5.
  /// The service returns the first batch of results (up to 5) and a nextToken
  /// value. To see the next batch of results, you submit the SearchFixtures
  /// request a second time, with the same search criteria, and specify the
  /// nextToken value.
  Future<SearchFixturesResponse> searchFixtures({
    required DataSourceSport sport,
    required String startDate,
    String? endDate,
    List<SearchFilter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      'sport': sport.value,
      'startDate': startDate,
      if (endDate != null) 'endDate': endDate,
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/fixtures',
      exceptionFnMap: _exceptionFns,
    );
    return SearchFixturesResponse.fromJson(response);
  }

  /// Associates the specified tags to the resource identified by the specified
  /// resourceArn in the current region. If existing tags on a resource are not
  /// specified in the request parameters, they are not changed. When a resource
  /// is deleted, the tags associated with that resource are also deleted.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource where you want to add tags.
  ///
  /// Parameter [tags] :
  /// A list of tags to add to the resource.
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
      requestUri: '/v1/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes specified tags from the specified resource in the current region.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource where you want to delete one or more tags.
  ///
  /// Parameter [tagKeys] :
  /// The keys of the tags to delete.
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
      requestUri: '/v1/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates a custom dictionary for improving transcription accuracy. A
  /// dictionary contains custom words and phrases that the ASR engine might not
  /// recognize, such as brand names, technical terms, or proper nouns. You can
  /// reference a dictionary when configuring a smart subtitles output.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [TooManyRequestException].
  /// May throw [ValidationException].
  ///
  /// Parameter [language] :
  /// The language of the dictionary entries. Specify the language using an ISO
  /// 639-2/T three-letter code. Supported values: eng, fra, ita, deu, spa, por.
  ///
  /// Parameter [name] :
  /// A user-friendly name for this dictionary.
  ///
  /// Parameter [entries] :
  /// The dictionary entries payload. Contains the custom words and phrases for
  /// the dictionary. Maximum size is 40,960 characters.
  ///
  /// Parameter [tags] :
  /// Optional tags to associate with the dictionary.
  Future<CreateDictionaryResponse> createDictionary({
    required DictionaryLanguage language,
    required String name,
    String? entries,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'language': language.value,
      'name': name,
      if (entries != null) 'entries': entries,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/dictionary',
      exceptionFnMap: _exceptionFns,
    );
    return CreateDictionaryResponse.fromJson(response);
  }

  /// Retrieves information about the specified dictionary.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestException].
  /// May throw [ValidationException].
  ///
  /// Parameter [id] :
  /// The ID of the dictionary to retrieve.
  Future<GetDictionaryResponse> getDictionary({
    required String id,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/dictionary/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetDictionaryResponse.fromJson(response);
  }

  /// Updates the specified dictionary.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestException].
  /// May throw [ValidationException].
  ///
  /// Parameter [id] :
  /// The ID of the dictionary to update.
  ///
  /// Parameter [entries] :
  /// New dictionary entries. If not specified, the entries are not changed.
  ///
  /// Parameter [language] :
  /// A new language for the dictionary. If not specified, the language is not
  /// changed.
  ///
  /// Parameter [name] :
  /// A new name for the dictionary. If not specified, the name is not changed.
  Future<UpdateDictionaryResponse> updateDictionary({
    required String id,
    String? entries,
    DictionaryLanguage? language,
    String? name,
  }) async {
    final $payload = <String, dynamic>{
      if (entries != null) 'entries': entries,
      if (language != null) 'language': language.value,
      if (name != null) 'name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/v1/dictionary/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateDictionaryResponse.fromJson(response);
  }

  /// Deletes the specified dictionary. You cannot delete a dictionary that is
  /// referenced by a feed. You must first remove the dictionary reference from
  /// the feed's subtitling configuration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestException].
  /// May throw [ValidationException].
  ///
  /// Parameter [id] :
  /// The ID of the dictionary to delete.
  Future<DeleteDictionaryResponse> deleteDictionary({
    required String id,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/dictionary/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteDictionaryResponse.fromJson(response);
  }

  /// Lists the dictionaries in your account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [TooManyRequestException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per API request. Valid range: 1 to
  /// 100.
  ///
  /// Parameter [nextToken] :
  /// The token that identifies the next batch of results to return.
  Future<ListDictionariesResponse> listDictionaries({
    int? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/dictionaries',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDictionariesResponse.fromJson(response);
  }

  /// Exports the entries from the specified dictionary.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestException].
  /// May throw [ValidationException].
  ///
  /// Parameter [id] :
  /// The ID of the dictionary whose entries you want to export.
  Future<ExportDictionaryEntriesResponse> exportDictionaryEntries({
    required String id,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/dictionary/${Uri.encodeComponent(id)}/entries/export',
      exceptionFnMap: _exceptionFns,
    );
    return ExportDictionaryEntriesResponse.fromJson(response);
  }

  /// Creates a feed. The feed is the target for the live media stream that is
  /// being sent by the calling application. An example of a calling application
  /// is AWS Elemental MediaLive.
  ///
  /// The key contents of the feed is an array of outputs. Each output
  /// represents an Elemental Inference feature. After you create the feed, you
  /// must associate a resource with the feed. At that point, you will have a
  /// useable feed: resource - feed - output or outputs.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [TooManyRequestException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// A user-friendly name for this feed.
  ///
  /// Parameter [outputs] :
  /// An array of outputs for this feed. Each output represents a specific
  /// Elemental Inference feature. For example, there is one output type for the
  /// smart crop feature. You must specify at least one output, but you can
  /// later add outputs using AssociateFeed, or add, modify, and delete outputs
  /// using UpdateFeed.
  ///
  /// Parameter [accessRoleArn] :
  /// The ARN of an IAM role that Elemental Inference assumes to access
  /// resources in your account on your behalf. For example, the smart crop
  /// feature uses this role to read graphics-compositing templates from your
  /// Amazon S3 bucket. You specify one access role for each feed.
  ///
  /// Parameter [tags] :
  /// Optional tags. You can also add tags later, using TagResource.
  Future<CreateFeedResponse> createFeed({
    required String name,
    required List<CreateOutput> outputs,
    String? accessRoleArn,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      'outputs': outputs,
      if (accessRoleArn != null) 'accessRoleArn': accessRoleArn,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/feed',
      exceptionFnMap: _exceptionFns,
    );
    return CreateFeedResponse.fromJson(response);
  }

  /// Retrieves information about the specified feed.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestException].
  ///
  /// Parameter [id] :
  /// The ID of the feed to query.
  Future<GetFeedResponse> getFeed({
    required String id,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/feed/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetFeedResponse.fromJson(response);
  }

  /// Updates the name and/or outputs in a feed.
  ///
  /// UpdateFeed is a PUT operation, which means that the payload that you
  /// specify completely overwrites the existing payload.
  ///
  /// This means that if you want to touch the array of outputs, you must pass
  /// in the full new list. So you must omit outputs you want to delete, and
  /// include outputs you want to add or modify.
  ///
  /// If you want to patch the array of outputs to make selective additions, use
  /// AssociateFeed.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [TooManyRequestException].
  /// May throw [ValidationException].
  ///
  /// Parameter [id] :
  /// The ID of the feed to update.
  ///
  /// Parameter [name] :
  /// Required. You can specify the existing name (to leave it unchanged) or a
  /// new name.
  ///
  /// Parameter [outputs] :
  /// Required. You can specify the existing array of outputs (to leave outputs
  /// unchanged) or you can specify a new array.
  ///
  /// Parameter [accessRoleArn] :
  /// The ARN of an IAM role that Elemental Inference assumes to access
  /// resources in your account on your behalf. You can specify the existing
  /// role (to leave it unchanged) or a new role. You specify one access role
  /// for each feed.
  Future<UpdateFeedResponse> updateFeed({
    required String id,
    required String name,
    required List<UpdateOutput> outputs,
    String? accessRoleArn,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      'outputs': outputs,
      if (accessRoleArn != null) 'accessRoleArn': accessRoleArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/v1/feed/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateFeedResponse.fromJson(response);
  }

  /// Deletes the specified feed. You can delete the feed at any time. Elemental
  /// Inference doesn't block you from deleting a feed when the calling
  /// application is calling PutMedia or GetMetadata on that feed, although both
  /// these calls will start to fail. For more information about managing
  /// inactive feeds, see the Elemental Inference User Guide.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestException].
  /// May throw [ValidationException].
  ///
  /// Parameter [id] :
  /// The ID of the feed.
  Future<DeleteFeedResponse> deleteFeed({
    required String id,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/feed/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteFeedResponse.fromJson(response);
  }

  /// Displays a list of feeds that belong to this AWS account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per API request.
  ///
  /// For example, you submit a list request with MaxResults set at 5. Although
  /// 20 items match your request, the service returns no more than the first 5
  /// items. (The service also returns a NextToken value that you can use to
  /// fetch the next batch of results.)
  ///
  /// The service might return fewer results than the MaxResults value. If
  /// MaxResults is not included in the request, the service defaults to
  /// pagination with a maximum of 10 results per page.
  ///
  /// Valid Range: Minimum value of 1. Maximum value of 1000.
  ///
  /// Parameter [nextToken] :
  /// The token that identifies the batch of results that you want to see.
  ///
  /// For example, you submit a ListFeeds request with MaxResults set at 5. The
  /// service returns the first batch of results (up to 5) and a NextToken
  /// value. To see the next batch of results, you can submit the ListFeeds
  /// request a second time and specify the NextToken value.
  Future<ListFeedsResponse> listFeeds({
    int? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/feeds',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListFeedsResponse.fromJson(response);
  }

  /// Associates a resource with the feed. The resource provides the input that
  /// Elemental Inference needs in order to perform an Elemental Inference
  /// feature, such as cropping video. You always provide the resource by
  /// associating it with a feed. You can associate only one resource with each
  /// feed. With an association, a specific source media is claiming ownership
  /// of the feed.
  ///
  /// AssociateFeed is a PATCH operation, which means that you can include only
  /// parameters that you want to change. Parameters that you don't include will
  /// not be affected by the operation.
  ///
  /// Specifically:
  ///
  /// <ul>
  /// <li>
  /// You can add more outputs to the existing outputs. New outputs will be
  /// appended.
  /// </li>
  /// <li>
  /// You can't modify an existing output (for example to change its name).
  /// Instead, use UpdateFeed.
  /// </li>
  /// <li>
  /// You can't delete an existing output. Instead, use UpdateFeed.
  /// </li>
  /// </ul>
  /// Also note that you can't change the feed name with AssociateFeed. Instead,
  /// use UpdateFeed.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [TooManyRequestException].
  /// May throw [ValidationException].
  ///
  /// Parameter [id] :
  /// The ID of the feed.
  ///
  /// Parameter [outputs] :
  /// An array of one or more outputs that you want to add to this feed now, to
  /// supplement any outputs that you specified when you created or updated the
  /// feed.
  ///
  /// Parameter [associatedResourceName] :
  /// An identifier for the resource. This name must not resemble an ARN.
  ///
  /// The resource is the source media that the feed will process. The name you
  /// assign should help you to later identify the source media that belongs to
  /// the feed. In this way, you will know which source media to push to the
  /// feed (using PutMedia).
  ///
  /// Parameter [dryRun] :
  /// Set to true if you want to do a dry run of the associate action.
  ///
  /// Elemental Inference will validate that the real request would succeed
  /// without actually making any changes. A dry run catches errors such as
  /// missing IAM permissions, quota limits exceeded, conflicting outputs, and
  /// so on. If the dry run fails, the action returns a 4xx error code. After
  /// you've fixed the errors, resubmit the request.
  Future<AssociateFeedResponse> associateFeed({
    required String id,
    required List<CreateOutput> outputs,
    String? associatedResourceName,
    bool? dryRun,
  }) async {
    final $payload = <String, dynamic>{
      'outputs': outputs,
      'associatedResourceName':
          associatedResourceName ?? _s.generateIdempotencyToken(),
      if (dryRun != null) 'dryRun': dryRun,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/feed/${Uri.encodeComponent(id)}/associate',
      exceptionFnMap: _exceptionFns,
    );
    return AssociateFeedResponse.fromJson(response);
  }

  /// Releases the resource (the source media) that is associated with this
  /// feed. The outputs in the feed become DISABLED.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestException].
  /// May throw [ValidationException].
  ///
  /// Parameter [id] :
  /// The ID of the feed where you want to release the resource.
  ///
  /// Parameter [associatedResourceName] :
  /// The name of the resource currently associated with the feed.
  ///
  /// Parameter [dryRun] :
  /// Set to true if you want to do a dry run of the disassociate action.
  ///
  /// Elemental Inference will validate that the real request would succeed
  /// without actually making any changes. A dry run catches errors such as
  /// missing IAM permissions. If the dry run fails, the action returns a 4xx
  /// error code.
  Future<DisassociateFeedResponse> disassociateFeed({
    required String id,
    String? associatedResourceName,
    bool? dryRun,
  }) async {
    final $payload = <String, dynamic>{
      'associatedResourceName':
          associatedResourceName ?? _s.generateIdempotencyToken(),
      if (dryRun != null) 'dryRun': dryRun,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/feed/${Uri.encodeComponent(id)}/disassociate',
      exceptionFnMap: _exceptionFns,
    );
    return DisassociateFeedResponse.fromJson(response);
  }
}

/// @nodoc
class ListTagsForResourceResponse {
  /// A list of the tags that belong to this resource.
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

/// @nodoc
class SearchFixturesResponse {
  /// An array of FixtureSummary objects, one for each fixture that matches the
  /// search. The array is empty if no fixtures match.
  final List<FixtureSummary> fixtures;

  /// The token that identifies the next batch of results. To see the next batch,
  /// submit the SearchFixtures request again, with the same search criteria, and
  /// specify this value in nextToken.
  ///
  /// This parameter is absent when there are no more results to return.
  final String? nextToken;

  SearchFixturesResponse({
    required this.fixtures,
    this.nextToken,
  });

  factory SearchFixturesResponse.fromJson(Map<String, dynamic> json) {
    return SearchFixturesResponse(
      fixtures: ((json['fixtures'] as List?) ?? const [])
          .nonNulls
          .map((e) => FixtureSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fixtures = this.fixtures;
    final nextToken = this.nextToken;
    return {
      'fixtures': fixtures,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class CreateDictionaryResponse {
  /// The ARN of the dictionary.
  final String arn;

  /// A unique ID that Elemental Inference assigns to the dictionary.
  final String id;

  /// The language of the dictionary.
  final DictionaryLanguage language;

  /// The name that you specified in the request.
  final String name;

  /// The current status of the dictionary. After creation succeeds, the status
  /// will be AVAILABLE.
  final DictionaryStatus status;

  /// A list of feed IDs that reference this dictionary.
  final List<String>? references;

  /// Any tags that you included when you created the dictionary.
  final Map<String, String>? tags;

  CreateDictionaryResponse({
    required this.arn,
    required this.id,
    required this.language,
    required this.name,
    required this.status,
    this.references,
    this.tags,
  });

  factory CreateDictionaryResponse.fromJson(Map<String, dynamic> json) {
    return CreateDictionaryResponse(
      arn: (json['arn'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      language:
          DictionaryLanguage.fromString((json['language'] as String?) ?? ''),
      name: (json['name'] as String?) ?? '',
      status: DictionaryStatus.fromString((json['status'] as String?) ?? ''),
      references: (json['references'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final language = this.language;
    final name = this.name;
    final status = this.status;
    final references = this.references;
    final tags = this.tags;
    return {
      'arn': arn,
      'id': id,
      'language': language.value,
      'name': name,
      'status': status.value,
      if (references != null) 'references': references,
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
class GetDictionaryResponse {
  /// The ARN of the dictionary.
  final String arn;

  /// The ID of the dictionary.
  final String id;

  /// The language of the dictionary.
  final DictionaryLanguage language;

  /// The name of the dictionary.
  final String name;

  /// The current status of the dictionary.
  final DictionaryStatus status;

  /// A list of feed IDs that reference this dictionary.
  final List<String>? references;

  /// The tags associated with the dictionary.
  final Map<String, String>? tags;

  GetDictionaryResponse({
    required this.arn,
    required this.id,
    required this.language,
    required this.name,
    required this.status,
    this.references,
    this.tags,
  });

  factory GetDictionaryResponse.fromJson(Map<String, dynamic> json) {
    return GetDictionaryResponse(
      arn: (json['arn'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      language:
          DictionaryLanguage.fromString((json['language'] as String?) ?? ''),
      name: (json['name'] as String?) ?? '',
      status: DictionaryStatus.fromString((json['status'] as String?) ?? ''),
      references: (json['references'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final language = this.language;
    final name = this.name;
    final status = this.status;
    final references = this.references;
    final tags = this.tags;
    return {
      'arn': arn,
      'id': id,
      'language': language.value,
      'name': name,
      'status': status.value,
      if (references != null) 'references': references,
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
class UpdateDictionaryResponse {
  /// The ARN of the dictionary.
  final String arn;

  /// The ID of the dictionary.
  final String id;

  /// The updated or original language of the dictionary.
  final DictionaryLanguage language;

  /// The updated or original name of the dictionary.
  final String name;

  /// The current status of the dictionary.
  final DictionaryStatus status;

  /// A list of feed IDs that reference this dictionary.
  final List<String>? references;

  /// Any tags associated with the dictionary.
  final Map<String, String>? tags;

  UpdateDictionaryResponse({
    required this.arn,
    required this.id,
    required this.language,
    required this.name,
    required this.status,
    this.references,
    this.tags,
  });

  factory UpdateDictionaryResponse.fromJson(Map<String, dynamic> json) {
    return UpdateDictionaryResponse(
      arn: (json['arn'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      language:
          DictionaryLanguage.fromString((json['language'] as String?) ?? ''),
      name: (json['name'] as String?) ?? '',
      status: DictionaryStatus.fromString((json['status'] as String?) ?? ''),
      references: (json['references'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final language = this.language;
    final name = this.name;
    final status = this.status;
    final references = this.references;
    final tags = this.tags;
    return {
      'arn': arn,
      'id': id,
      'language': language.value,
      'name': name,
      'status': status.value,
      if (references != null) 'references': references,
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
class DeleteDictionaryResponse {
  /// The ARN of the deleted dictionary.
  final String arn;

  /// The ID of the deleted dictionary.
  final String id;

  /// The status of the dictionary after deletion.
  final DictionaryStatus status;

  DeleteDictionaryResponse({
    required this.arn,
    required this.id,
    required this.status,
  });

  factory DeleteDictionaryResponse.fromJson(Map<String, dynamic> json) {
    return DeleteDictionaryResponse(
      arn: (json['arn'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      status: DictionaryStatus.fromString((json['status'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final status = this.status;
    return {
      'arn': arn,
      'id': id,
      'status': status.value,
    };
  }
}

/// @nodoc
class ListDictionariesResponse {
  /// A list of DictionarySummary objects.
  final List<DictionarySummary> dictionaries;

  /// The token to use to retrieve the next batch of results.
  final String? nextToken;

  ListDictionariesResponse({
    required this.dictionaries,
    this.nextToken,
  });

  factory ListDictionariesResponse.fromJson(Map<String, dynamic> json) {
    return ListDictionariesResponse(
      dictionaries: ((json['dictionaries'] as List?) ?? const [])
          .nonNulls
          .map((e) => DictionarySummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dictionaries = this.dictionaries;
    final nextToken = this.nextToken;
    return {
      'dictionaries': dictionaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ExportDictionaryEntriesResponse {
  /// The dictionary entries payload.
  final String? entries;

  ExportDictionaryEntriesResponse({
    this.entries,
  });

  factory ExportDictionaryEntriesResponse.fromJson(Map<String, dynamic> json) {
    return ExportDictionaryEntriesResponse(
      entries: json['entries'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final entries = this.entries;
    return {
      if (entries != null) 'entries': entries,
    };
  }
}

/// @nodoc
class CreateFeedResponse {
  /// A unique ARN that Elemental Inference assigns to the feed.
  final String arn;

  /// An array of endpoints for the feed. Typically, there is only one endpoint.
  /// The feed receives source media at this endpoint (when the calling
  /// application calls PutMedia) and returns the resulting metadata to this
  /// endpoint (when the calling application calls GetMetadata).
  final List<String> dataEndpoints;

  /// A unique ID that Elemental Inference assigns to the feed.
  final String id;

  /// The name that you specified in the request.
  final String name;

  /// Repeats the outputs that you specified in the request.
  final List<GetOutput> outputs;

  /// The current status of the feed. After creation of the feed has succeeded,
  /// the status will be AVAILABLE.
  final FeedStatus status;

  /// The association for this feed. When you create the feed, this property is
  /// empty. You must associate a resource with the feed using AssociateFeed or
  /// UpdateFeed.
  final FeedAssociation? association;

  /// Any tags that you included when you created the feed.
  final Map<String, String>? tags;

  CreateFeedResponse({
    required this.arn,
    required this.dataEndpoints,
    required this.id,
    required this.name,
    required this.outputs,
    required this.status,
    this.association,
    this.tags,
  });

  factory CreateFeedResponse.fromJson(Map<String, dynamic> json) {
    return CreateFeedResponse(
      arn: (json['arn'] as String?) ?? '',
      dataEndpoints: ((json['dataEndpoints'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      outputs: ((json['outputs'] as List?) ?? const [])
          .nonNulls
          .map((e) => GetOutput.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: FeedStatus.fromString((json['status'] as String?) ?? ''),
      association: json['association'] != null
          ? FeedAssociation.fromJson(
              json['association'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final dataEndpoints = this.dataEndpoints;
    final id = this.id;
    final name = this.name;
    final outputs = this.outputs;
    final status = this.status;
    final association = this.association;
    final tags = this.tags;
    return {
      'arn': arn,
      'dataEndpoints': dataEndpoints,
      'id': id,
      'name': name,
      'outputs': outputs,
      'status': status.value,
      if (association != null) 'association': association,
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
class GetFeedResponse {
  /// The ARN of the feed.
  final String arn;

  /// The dataEndpoints of the feed.
  final List<String> dataEndpoints;

  /// The ID of the feed.
  final String id;

  /// The name of the feed.
  final String name;

  /// An array of the outputs in the feed.
  final List<GetOutput> outputs;

  /// The status of the feed.
  final FeedStatus status;

  /// Information about the resource that is associated with the feed. It's
  /// possible that there is no associated resource. This is not an error.
  final FeedAssociation? association;

  /// A list of the tags, if any, for the feed.
  final Map<String, String>? tags;

  GetFeedResponse({
    required this.arn,
    required this.dataEndpoints,
    required this.id,
    required this.name,
    required this.outputs,
    required this.status,
    this.association,
    this.tags,
  });

  factory GetFeedResponse.fromJson(Map<String, dynamic> json) {
    return GetFeedResponse(
      arn: (json['arn'] as String?) ?? '',
      dataEndpoints: ((json['dataEndpoints'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      outputs: ((json['outputs'] as List?) ?? const [])
          .nonNulls
          .map((e) => GetOutput.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: FeedStatus.fromString((json['status'] as String?) ?? ''),
      association: json['association'] != null
          ? FeedAssociation.fromJson(
              json['association'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final dataEndpoints = this.dataEndpoints;
    final id = this.id;
    final name = this.name;
    final outputs = this.outputs;
    final status = this.status;
    final association = this.association;
    final tags = this.tags;
    return {
      'arn': arn,
      'dataEndpoints': dataEndpoints,
      'id': id,
      'name': name,
      'outputs': outputs,
      'status': status.value,
      if (association != null) 'association': association,
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
class UpdateFeedResponse {
  /// The ARN of the feed.
  final String arn;

  /// The data endpoints of the feed.
  final List<String> dataEndpoints;

  /// The ID of the feed.
  final String id;

  /// The updated or original name of the feed.
  final String name;

  /// The array of outputs in the feed. You might have left this array unchanged,
  /// or you might have changed it.
  final List<GetOutput> outputs;

  /// The status of the feed.
  final FeedStatus status;

  /// Information about the resource that is associated with the feed, if any.
  final FeedAssociation? association;

  /// The tags associated with the feed.
  final Map<String, String>? tags;

  UpdateFeedResponse({
    required this.arn,
    required this.dataEndpoints,
    required this.id,
    required this.name,
    required this.outputs,
    required this.status,
    this.association,
    this.tags,
  });

  factory UpdateFeedResponse.fromJson(Map<String, dynamic> json) {
    return UpdateFeedResponse(
      arn: (json['arn'] as String?) ?? '',
      dataEndpoints: ((json['dataEndpoints'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      outputs: ((json['outputs'] as List?) ?? const [])
          .nonNulls
          .map((e) => GetOutput.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: FeedStatus.fromString((json['status'] as String?) ?? ''),
      association: json['association'] != null
          ? FeedAssociation.fromJson(
              json['association'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final dataEndpoints = this.dataEndpoints;
    final id = this.id;
    final name = this.name;
    final outputs = this.outputs;
    final status = this.status;
    final association = this.association;
    final tags = this.tags;
    return {
      'arn': arn,
      'dataEndpoints': dataEndpoints,
      'id': id,
      'name': name,
      'outputs': outputs,
      'status': status.value,
      if (association != null) 'association': association,
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
class DeleteFeedResponse {
  /// The ARN of the deleted feed.
  final String arn;

  /// The ID of the deleted feed.
  final String id;

  /// The current status of the feed. When deletion of the feed has succeeded, the
  /// status will be DELETED.
  final FeedStatus status;

  DeleteFeedResponse({
    required this.arn,
    required this.id,
    required this.status,
  });

  factory DeleteFeedResponse.fromJson(Map<String, dynamic> json) {
    return DeleteFeedResponse(
      arn: (json['arn'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      status: FeedStatus.fromString((json['status'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final status = this.status;
    return {
      'arn': arn,
      'id': id,
      'status': status.value,
    };
  }
}

/// @nodoc
class ListFeedsResponse {
  /// A list of FeedSummary objects.
  final List<FeedSummary> feeds;

  /// The token that identifies the batch of results that you want to see. For
  /// example, you submit a list request with MaxResults set at 5. The service
  /// returns the first batch of results (up to 5) and a NextToken value. To see
  /// the next batch of results, you can submit the list request a second time and
  /// specify the NextToken value.
  final String? nextToken;

  ListFeedsResponse({
    required this.feeds,
    this.nextToken,
  });

  factory ListFeedsResponse.fromJson(Map<String, dynamic> json) {
    return ListFeedsResponse(
      feeds: ((json['feeds'] as List?) ?? const [])
          .nonNulls
          .map((e) => FeedSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final feeds = this.feeds;
    final nextToken = this.nextToken;
    return {
      'feeds': feeds,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class AssociateFeedResponse {
  /// The ARN of the feed.
  final String arn;

  /// The ID of the feed.
  final String id;

  AssociateFeedResponse({
    required this.arn,
    required this.id,
  });

  factory AssociateFeedResponse.fromJson(Map<String, dynamic> json) {
    return AssociateFeedResponse(
      arn: (json['arn'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    return {
      'arn': arn,
      'id': id,
    };
  }
}

/// @nodoc
class DisassociateFeedResponse {
  /// The ARN of the feed.
  final String arn;

  /// The ID of the feed.
  final String id;

  DisassociateFeedResponse({
    required this.arn,
    required this.id,
  });

  factory DisassociateFeedResponse.fromJson(Map<String, dynamic> json) {
    return DisassociateFeedResponse(
      arn: (json['arn'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    return {
      'arn': arn,
      'id': id,
    };
  }
}

/// Contains configuration information about one output in a feed. It is used in
/// the AssociateFeed and the CreateFeed actions.
///
/// @nodoc
class CreateOutput {
  /// A name for the output.
  final String name;

  /// A typed property for an output in a feed. It identifies the action for
  /// Elemental Inference to perform. It also provides a repository for the
  /// results of that action. For example, CroppingConfig output will contain the
  /// metadata for the crop feature.
  final OutputConfig outputConfig;

  /// The status to assign to the output.
  final OutputStatus status;

  /// A description for the output.
  final String? description;

  CreateOutput({
    required this.name,
    required this.outputConfig,
    required this.status,
    this.description,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final outputConfig = this.outputConfig;
    final status = this.status;
    final description = this.description;
    return {
      'name': name,
      'outputConfig': outputConfig,
      'status': status.value,
      if (description != null) 'description': description,
    };
  }
}

/// Contains one typed output. It is used in the CreateOutput, GetOutput, and
/// Update Output structures.
///
/// @nodoc
class OutputConfig {
  /// The output config type that applies to the clipping feature.
  final ClippingConfig? clipping;

  /// The output config type that applies to the cropping feature.
  final CroppingConfig? cropping;

  /// The output config type that applies to the smart subtitling feature.
  final SubtitlingConfig? subtitling;

  OutputConfig({
    this.clipping,
    this.cropping,
    this.subtitling,
  });

  factory OutputConfig.fromJson(Map<String, dynamic> json) {
    return OutputConfig(
      clipping: json['clipping'] != null
          ? ClippingConfig.fromJson(json['clipping'] as Map<String, dynamic>)
          : null,
      cropping: json['cropping'] != null
          ? CroppingConfig.fromJson(json['cropping'] as Map<String, dynamic>)
          : null,
      subtitling: json['subtitling'] != null
          ? SubtitlingConfig.fromJson(
              json['subtitling'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final clipping = this.clipping;
    final cropping = this.cropping;
    final subtitling = this.subtitling;
    return {
      if (clipping != null) 'clipping': clipping,
      if (cropping != null) 'cropping': cropping,
      if (subtitling != null) 'subtitling': subtitling,
    };
  }
}

/// @nodoc
class OutputStatus {
  static const enabled = OutputStatus._('ENABLED');
  static const disabled = OutputStatus._('DISABLED');

  final String value;

  const OutputStatus._(this.value);

  static const values = [enabled, disabled];

  static OutputStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => OutputStatus._(value));

  @override
  bool operator ==(other) => other is OutputStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A type of OutputConfig, used when the output in a feed is for the crop
/// feature.
///
/// @nodoc
class CroppingConfig {
  /// An array of template groups for the crop output. Each template group
  /// provides the graphics-compositing templates that Elemental Inference applies
  /// to the cropped video. You can specify from 1 to 4 template groups.
  final List<TemplateGroup>? templateGroups;

  CroppingConfig({
    this.templateGroups,
  });

  factory CroppingConfig.fromJson(Map<String, dynamic> json) {
    return CroppingConfig(
      templateGroups: (json['templateGroups'] as List?)
          ?.nonNulls
          .map((e) => TemplateGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final templateGroups = this.templateGroups;
    return {
      if (templateGroups != null) 'templateGroups': templateGroups,
    };
  }
}

/// A type of OutputConfig, used when the output in a feed is for the clip
/// feature.
///
/// @nodoc
class ClippingConfig {
  /// A string that you want Elemental Inference to always include in the event
  /// clipping metadata for this output. The string might identify the sports
  /// event in the source media, for example.
  final String? callbackMetadata;

  /// The data source to map onto this clipping output. This parameter is
  /// optional. When you include this parameter, Elemental Inference reads the
  /// event data for the fixture that you specify, and includes that data in the
  /// event clipping metadata for this output.
  ///
  /// If you omit this parameter, Elemental Inference doesn't map a data source
  /// onto this output.
  final DataSourceConfiguration? dataSourceConfiguration;

  ClippingConfig({
    this.callbackMetadata,
    this.dataSourceConfiguration,
  });

  factory ClippingConfig.fromJson(Map<String, dynamic> json) {
    return ClippingConfig(
      callbackMetadata: json['callbackMetadata'] as String?,
      dataSourceConfiguration: json['dataSourceConfiguration'] != null
          ? DataSourceConfiguration.fromJson(
              json['dataSourceConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final callbackMetadata = this.callbackMetadata;
    final dataSourceConfiguration = this.dataSourceConfiguration;
    return {
      if (callbackMetadata != null) 'callbackMetadata': callbackMetadata,
      if (dataSourceConfiguration != null)
        'dataSourceConfiguration': dataSourceConfiguration,
    };
  }
}

/// A type of OutputConfig, used when the output in a feed is for the smart
/// subtitling feature. smart subtitling uses automatic speech recognition (ASR)
/// to generate live TTML subtitles from the audio in your source media.
///
/// @nodoc
class SubtitlingConfig {
  /// The language of the audio in the source media. Elemental Inference uses this
  /// setting to optimize transcription accuracy. Specify the language using an
  /// ISO 639-2/T three-letter code, optionally with a region subtag. Supported
  /// values: eng, eng-au, eng-gb, eng-us, fra, ita, deu, spa, por.
  final TranscriptionLanguage language;

  /// The aspect ratio of the output video, specified as width and height integer
  /// values. Elemental Inference uses the aspect ratio to determine subtitle
  /// layout and line lengths.
  final AspectRatio? aspectRatio;

  /// The ID of a custom dictionary to improve transcription accuracy for
  /// domain-specific terminology. Use the CreateDictionary operation to create a
  /// dictionary.
  final String? dictionary;

  /// Controls how profanity is handled in the generated subtitles. Valid values:
  /// DISABLED (no filtering, default), CENSOR (replace profanity with asterisks),
  /// DROP (remove profanity from the transcript).
  final ProfanityFilterMode? profanityFilter;

  SubtitlingConfig({
    required this.language,
    this.aspectRatio,
    this.dictionary,
    this.profanityFilter,
  });

  factory SubtitlingConfig.fromJson(Map<String, dynamic> json) {
    return SubtitlingConfig(
      language:
          TranscriptionLanguage.fromString((json['language'] as String?) ?? ''),
      aspectRatio: json['aspectRatio'] != null
          ? AspectRatio.fromJson(json['aspectRatio'] as Map<String, dynamic>)
          : null,
      dictionary: json['dictionary'] as String?,
      profanityFilter: (json['profanityFilter'] as String?)
          ?.let(ProfanityFilterMode.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final language = this.language;
    final aspectRatio = this.aspectRatio;
    final dictionary = this.dictionary;
    final profanityFilter = this.profanityFilter;
    return {
      'language': language.value,
      if (aspectRatio != null) 'aspectRatio': aspectRatio,
      if (dictionary != null) 'dictionary': dictionary,
      if (profanityFilter != null) 'profanityFilter': profanityFilter.value,
    };
  }
}

/// @nodoc
class TranscriptionLanguage {
  static const eng = TranscriptionLanguage._('eng');
  static const engAu = TranscriptionLanguage._('eng-au');
  static const engGb = TranscriptionLanguage._('eng-gb');
  static const engUs = TranscriptionLanguage._('eng-us');
  static const fra = TranscriptionLanguage._('fra');
  static const ita = TranscriptionLanguage._('ita');
  static const deu = TranscriptionLanguage._('deu');
  static const spa = TranscriptionLanguage._('spa');
  static const por = TranscriptionLanguage._('por');

  final String value;

  const TranscriptionLanguage._(this.value);

  static const values = [eng, engAu, engGb, engUs, fra, ita, deu, spa, por];

  static TranscriptionLanguage fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TranscriptionLanguage._(value));

  @override
  bool operator ==(other) =>
      other is TranscriptionLanguage && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The width and height of the output video. Used in SubtitlingConfig to
/// determine subtitle layout.
///
/// @nodoc
class AspectRatio {
  /// The height component of the aspect ratio (for example, 9 in a 16:9 ratio).
  final int height;

  /// The width component of the aspect ratio (for example, 16 in a 16:9 ratio).
  final int width;

  AspectRatio({
    required this.height,
    required this.width,
  });

  factory AspectRatio.fromJson(Map<String, dynamic> json) {
    return AspectRatio(
      height: (json['height'] as int?) ?? 0,
      width: (json['width'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final height = this.height;
    final width = this.width;
    return {
      'height': height,
      'width': width,
    };
  }
}

/// @nodoc
class ProfanityFilterMode {
  static const disabled = ProfanityFilterMode._('DISABLED');
  static const censor = ProfanityFilterMode._('CENSOR');
  static const drop = ProfanityFilterMode._('DROP');

  final String value;

  const ProfanityFilterMode._(this.value);

  static const values = [disabled, censor, drop];

  static ProfanityFilterMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ProfanityFilterMode._(value));

  @override
  bool operator ==(other) =>
      other is ProfanityFilterMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains the data source configuration for a clipping output. It identifies
/// the fixture whose event data Elemental Inference maps onto the clipping
/// metadata. It is used in the dataSourceConfiguration property of a
/// ClippingConfig.
///
/// @nodoc
class DataSourceConfiguration {
  /// The ID of the fixture whose event data you want Elemental Inference to map
  /// onto this clipping output. The fixture should be the sports event in the
  /// source media that the feed is processing.
  ///
  /// To obtain this ID, use the SearchFixtures operation to find the fixture,
  /// then use the fixtureId from the matching FixtureSummary.
  final String fixtureId;

  DataSourceConfiguration({
    required this.fixtureId,
  });

  factory DataSourceConfiguration.fromJson(Map<String, dynamic> json) {
    return DataSourceConfiguration(
      fixtureId: (json['fixtureId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final fixtureId = this.fixtureId;
    return {
      'fixtureId': fixtureId,
    };
  }
}

/// A named set of graphics-compositing templates used by the crop feature,
/// specified in the templateGroups array of a CroppingConfig.
///
/// @nodoc
class TemplateGroup {
  /// A name for the template group.
  final String name;

  /// An array of Amazon S3 URIs that point to the graphics-compositing templates
  /// for this group. You can specify 1 or 2 URIs. Each URI must be in the form
  /// <code>s3://bucket-name/key</code>. Elemental Inference reads these templates
  /// using the IAM role that you specify in accessRoleArn.
  final List<String> templateUris;

  TemplateGroup({
    required this.name,
    required this.templateUris,
  });

  factory TemplateGroup.fromJson(Map<String, dynamic> json) {
    return TemplateGroup(
      name: (json['name'] as String?) ?? '',
      templateUris: ((json['templateUris'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final templateUris = this.templateUris;
    return {
      'name': name,
      'templateUris': templateUris,
    };
  }
}

/// Contains configuration information about a feed. It is used in the ListFeeds
/// response.
///
/// @nodoc
class FeedSummary {
  /// The ARN of the feed.
  final String arn;

  /// The ID of the feed.
  final String id;

  /// The name of the feed
  final String name;

  /// The status of the feed.
  final FeedStatus status;

  /// The resource, if any, associated with the feed.
  final FeedAssociation? association;

  FeedSummary({
    required this.arn,
    required this.id,
    required this.name,
    required this.status,
    this.association,
  });

  factory FeedSummary.fromJson(Map<String, dynamic> json) {
    return FeedSummary(
      arn: (json['arn'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      status: FeedStatus.fromString((json['status'] as String?) ?? ''),
      association: json['association'] != null
          ? FeedAssociation.fromJson(
              json['association'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final name = this.name;
    final status = this.status;
    final association = this.association;
    return {
      'arn': arn,
      'id': id,
      'name': name,
      'status': status.value,
      if (association != null) 'association': association,
    };
  }
}

/// Contains information about the resource that is associated with a feed. It
/// is used in the FeedSummary that is used in the response of a ListFeeds
/// action.
///
/// @nodoc
class FeedAssociation {
  /// The name of the associated resource.
  final String associatedResourceName;

  FeedAssociation({
    required this.associatedResourceName,
  });

  factory FeedAssociation.fromJson(Map<String, dynamic> json) {
    return FeedAssociation(
      associatedResourceName: (json['associatedResourceName'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final associatedResourceName = this.associatedResourceName;
    return {
      'associatedResourceName': associatedResourceName,
    };
  }
}

/// @nodoc
class FeedStatus {
  static const creating = FeedStatus._('CREATING');
  static const available = FeedStatus._('AVAILABLE');
  static const active = FeedStatus._('ACTIVE');
  static const updating = FeedStatus._('UPDATING');
  static const deleting = FeedStatus._('DELETING');
  static const deleted = FeedStatus._('DELETED');
  static const archived = FeedStatus._('ARCHIVED');

  final String value;

  const FeedStatus._(this.value);

  static const values = [
    creating,
    available,
    active,
    updating,
    deleting,
    deleted,
    archived
  ];

  static FeedStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => FeedStatus._(value));

  @override
  bool operator ==(other) => other is FeedStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains configuration information about one output in a feed. It is used in
/// the GetFeed response.
///
/// @nodoc
class GetOutput {
  /// The name of the output.
  final String name;

  /// A typed property for an output in a feed. It identifies the action for
  /// Elemental Inference to perform. It also provides a repository for the
  /// results of that action. For example, CroppingConfig output will contain the
  /// metadata for the crop feature.
  final OutputConfig outputConfig;

  /// The status of the output.
  final OutputStatus status;

  /// The description of the output.
  final String? description;

  /// True means that the output was originally created in the feed using
  /// AssociateFeed. False means it was created using CreateFeed or UpdateFeed.
  ///
  /// You will need this value if you use UpdateFeed to modify the list of outputs
  /// in the feed.
  final bool? fromAssociation;

  GetOutput({
    required this.name,
    required this.outputConfig,
    required this.status,
    this.description,
    this.fromAssociation,
  });

  factory GetOutput.fromJson(Map<String, dynamic> json) {
    return GetOutput(
      name: (json['name'] as String?) ?? '',
      outputConfig: OutputConfig.fromJson(
          (json['outputConfig'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      status: OutputStatus.fromString((json['status'] as String?) ?? ''),
      description: json['description'] as String?,
      fromAssociation: json['fromAssociation'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final outputConfig = this.outputConfig;
    final status = this.status;
    final description = this.description;
    final fromAssociation = this.fromAssociation;
    return {
      'name': name,
      'outputConfig': outputConfig,
      'status': status.value,
      if (description != null) 'description': description,
      if (fromAssociation != null) 'fromAssociation': fromAssociation,
    };
  }
}

/// Contains configuration information about one output in a feed. It is used in
/// the UpdateFeed action.
///
/// @nodoc
class UpdateOutput {
  /// The name of the output.
  final String name;

  /// A typed property for an output in a feed. It identifies the action for
  /// Elemental Inference to perform. It also provides a repository for the
  /// results of that action. For example, CroppingConfig output will contain the
  /// metadata for the crop feature.
  final OutputConfig outputConfig;

  /// The status of the output.
  final OutputStatus status;

  /// A description of the output.
  final String? description;

  /// Elemental Inference originally sets this parameter to True if this output
  /// was created by AssociateFeed or to False if this output was created by
  /// CreateFeed or UpdateFeed.
  ///
  /// You must not change this value. Therefore, use GetFeed to determine the
  /// current value. Then in the UpdateFeed request, if the current value is True,
  /// include this parameter with a value of True. If it's False, omit the
  /// parameter.
  final bool? fromAssociation;

  UpdateOutput({
    required this.name,
    required this.outputConfig,
    required this.status,
    this.description,
    this.fromAssociation,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final outputConfig = this.outputConfig;
    final status = this.status;
    final description = this.description;
    final fromAssociation = this.fromAssociation;
    return {
      'name': name,
      'outputConfig': outputConfig,
      'status': status.value,
      if (description != null) 'description': description,
      if (fromAssociation != null) 'fromAssociation': fromAssociation,
    };
  }
}

/// Contains summary information about a dictionary. Used in the
/// ListDictionaries response.
///
/// @nodoc
class DictionarySummary {
  /// The ARN of the dictionary.
  final String arn;

  /// The ID of the dictionary.
  final String id;

  /// The language of the dictionary.
  final DictionaryLanguage language;

  /// The name of the dictionary.
  final String name;

  /// The status of the dictionary.
  final DictionaryStatus status;

  DictionarySummary({
    required this.arn,
    required this.id,
    required this.language,
    required this.name,
    required this.status,
  });

  factory DictionarySummary.fromJson(Map<String, dynamic> json) {
    return DictionarySummary(
      arn: (json['arn'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      language:
          DictionaryLanguage.fromString((json['language'] as String?) ?? ''),
      name: (json['name'] as String?) ?? '',
      status: DictionaryStatus.fromString((json['status'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final language = this.language;
    final name = this.name;
    final status = this.status;
    return {
      'arn': arn,
      'id': id,
      'language': language.value,
      'name': name,
      'status': status.value,
    };
  }
}

/// @nodoc
class DictionaryLanguage {
  static const eng = DictionaryLanguage._('eng');
  static const fra = DictionaryLanguage._('fra');
  static const ita = DictionaryLanguage._('ita');
  static const deu = DictionaryLanguage._('deu');
  static const spa = DictionaryLanguage._('spa');
  static const por = DictionaryLanguage._('por');

  final String value;

  const DictionaryLanguage._(this.value);

  static const values = [eng, fra, ita, deu, spa, por];

  static DictionaryLanguage fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DictionaryLanguage._(value));

  @override
  bool operator ==(other) =>
      other is DictionaryLanguage && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class DictionaryStatus {
  static const creating = DictionaryStatus._('CREATING');
  static const available = DictionaryStatus._('AVAILABLE');
  static const referenced = DictionaryStatus._('REFERENCED');
  static const deleting = DictionaryStatus._('DELETING');
  static const deleted = DictionaryStatus._('DELETED');

  final String value;

  const DictionaryStatus._(this.value);

  static const values = [creating, available, referenced, deleting, deleted];

  static DictionaryStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DictionaryStatus._(value));

  @override
  bool operator ==(other) => other is DictionaryStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains information about one fixture. It is used in the SearchFixtures
/// response.
///
/// Elemental Inference relays the information in this structure from the data
/// source, so that you can identify the fixture that matches your source media.
///
/// @nodoc
class FixtureSummary {
  /// An array of the competitors (the teams or individuals) in the fixture.
  final List<Competitor> competitors;

  /// The ID of the fixture. Specify this ID in the clipping output of a feed, to
  /// identify the fixture whose event data you want Elemental Inference to map
  /// onto the clipping metadata.
  final String fixtureId;

  /// The name of the fixture, as provided by the data source. For example, the
  /// names of the two competing teams.
  final String name;

  /// The status of the fixture in its lifecycle, as provided by the data source.
  /// For example, Scheduled or Completed.
  final String status;

  /// The group that the fixture belongs to, such as the competition, league, or
  /// tournament. The data source doesn't provide this information for every
  /// fixture.
  final String? fixtureGroup;

  /// The scheduled start time of the fixture, as provided by the data source. The
  /// actual start time might differ.
  final DateTime? scheduledStart;

  FixtureSummary({
    required this.competitors,
    required this.fixtureId,
    required this.name,
    required this.status,
    this.fixtureGroup,
    this.scheduledStart,
  });

  factory FixtureSummary.fromJson(Map<String, dynamic> json) {
    return FixtureSummary(
      competitors: ((json['competitors'] as List?) ?? const [])
          .nonNulls
          .map((e) => Competitor.fromJson(e as Map<String, dynamic>))
          .toList(),
      fixtureId: (json['fixtureId'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      status: (json['status'] as String?) ?? '',
      fixtureGroup: json['fixtureGroup'] as String?,
      scheduledStart: timeStampFromJson(json['scheduledStart']),
    );
  }

  Map<String, dynamic> toJson() {
    final competitors = this.competitors;
    final fixtureId = this.fixtureId;
    final name = this.name;
    final status = this.status;
    final fixtureGroup = this.fixtureGroup;
    final scheduledStart = this.scheduledStart;
    return {
      'competitors': competitors,
      'fixtureId': fixtureId,
      'name': name,
      'status': status,
      if (fixtureGroup != null) 'fixtureGroup': fixtureGroup,
      if (scheduledStart != null)
        'scheduledStart': iso8601ToJson(scheduledStart),
    };
  }
}

/// Contains information about one competitor in a fixture. It is used in the
/// FixtureSummary that is in the SearchFixtures response.
///
/// @nodoc
class Competitor {
  /// Specifies whether this competitor is the home side in the fixture. If true,
  /// this competitor is the home side. If false, this competitor is the away
  /// side.
  final bool? isHome;

  /// The name of the competitor, as provided by the data source.
  final String? name;

  Competitor({
    this.isHome,
    this.name,
  });

  factory Competitor.fromJson(Map<String, dynamic> json) {
    return Competitor(
      isHome: json['isHome'] as bool?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final isHome = this.isHome;
    final name = this.name;
    return {
      if (isHome != null) 'isHome': isHome,
      if (name != null) 'name': name,
    };
  }
}

/// @nodoc
class DataSourceSport {
  static const basketball = DataSourceSport._('basketball');
  static const americanFootball = DataSourceSport._('american-football');

  final String value;

  const DataSourceSport._(this.value);

  static const values = [basketball, americanFootball];

  static DataSourceSport fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DataSourceSport._(value));

  @override
  bool operator ==(other) => other is DataSourceSport && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A filter for a fixture search. It is used in the filters array of a
/// SearchFixtures request.
///
/// @nodoc
class SearchFilter {
  /// The dimension of the fixture to filter on. Valid values: COMPETITOR.
  final FilterName name;

  /// An array of values to match in the dimension that you specified in name. You
  /// can specify up to 10 values. A fixture appears in the results if it matches
  /// at least one of these values.
  final List<String> values;

  SearchFilter({
    required this.name,
    required this.values,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      'name': name.value,
      'values': values,
    };
  }
}

/// @nodoc
class FilterName {
  static const competitor = FilterName._('COMPETITOR');

  final String value;

  const FilterName._(this.value);

  static const values = [competitor];

  static FilterName fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => FilterName._(value));

  @override
  bool operator ==(other) => other is FilterName && other.value == value;

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
class GatewayTimedOutException extends _s.GenericAwsException {
  GatewayTimedOutException({String? type, String? message})
      : super(type: type, code: 'GatewayTimedOutException', message: message);
}

/// @nodoc
class InternalServerErrorException extends _s.GenericAwsException {
  InternalServerErrorException({String? type, String? message})
      : super(
            type: type, code: 'InternalServerErrorException', message: message);
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
class ServiceUnavailableException extends _s.GenericAwsException {
  ServiceUnavailableException({String? type, String? message})
      : super(
            type: type, code: 'ServiceUnavailableException', message: message);
}

/// @nodoc
class TooManyRequestException extends _s.GenericAwsException {
  TooManyRequestException({String? type, String? message})
      : super(type: type, code: 'TooManyRequestException', message: message);
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
  'GatewayTimedOutException': (type, message) =>
      GatewayTimedOutException(type: type, message: message),
  'InternalServerErrorException': (type, message) =>
      InternalServerErrorException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ServiceUnavailableException': (type, message) =>
      ServiceUnavailableException(type: type, message: message),
  'TooManyRequestException': (type, message) =>
      TooManyRequestException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
