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

import 'v2018_05_10.endpoints.dart' as _endpoints;
export '../../shared/shared.dart' show AwsClientCredentials;

/// Backup Search is the recovery point and item level search for Backup.
class BackupSearch {
  final _s.RestJsonProtocol _protocol;
  factory BackupSearch({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
    bool useFipsEndpoint = false,
    bool useDualStackEndpoint = false,
  }) {
    final service = _s.ServiceMetadata(
      endpointPrefix: 'backup-search',
    );
    return BackupSearch._(
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
  BackupSearch._({
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

  /// This operation returns a list of all backups (recovery points) in a
  /// paginated format that were included in the search job.
  ///
  /// If a search does not display an expected backup in the results, you can
  /// call this operation to display each backup included in the search. Any
  /// backups that were not included because they have a <code>FAILED</code>
  /// status from a permissions issue will be displayed, along with a status
  /// message.
  ///
  /// Only recovery points with a backup index that has a status of
  /// <code>ACTIVE</code> will be included in search results. If the index has
  /// any other status, its status will be displayed along with a status
  /// message.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [searchJobIdentifier] :
  /// The unique string that specifies the search job.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of resource list items to be returned.
  ///
  /// Parameter [nextToken] :
  /// The next item following a partial list of returned backups included in a
  /// search job.
  ///
  /// For example, if a request is made to return <code>MaxResults</code> number
  /// of backups, <code>NextToken</code> allows you to return more items in your
  /// list starting at the location pointed to by the next token.
  Future<ListSearchJobBackupsOutput> listSearchJobBackups({
    required String searchJobIdentifier,
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
      requestUri:
          '/search-jobs/${Uri.encodeComponent(searchJobIdentifier)}/backups',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSearchJobBackupsOutput.fromJson(response);
  }

  /// This operation returns a list of a specified search job.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [searchJobIdentifier] :
  /// The unique string that specifies the search job.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of resource list items to be returned.
  ///
  /// Parameter [nextToken] :
  /// The next item following a partial list of returned search job results.
  ///
  /// For example, if a request is made to return <code>MaxResults</code> number
  /// of search job results, <code>NextToken</code> allows you to return more
  /// items in your list starting at the location pointed to by the next token.
  Future<ListSearchJobResultsOutput> listSearchJobResults({
    required String searchJobIdentifier,
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
      requestUri:
          '/search-jobs/${Uri.encodeComponent(searchJobIdentifier)}/search-results',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSearchJobResultsOutput.fromJson(response);
  }

  /// This operation returns the tags for a resource type.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) that uniquely identifies the resource.&gt;
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

  /// This operation puts tags on the resource you indicate.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) that uniquely identifies the resource.
  ///
  /// This is the resource that will have the indicated tags.
  ///
  /// Parameter [tags] :
  /// Required tags to include. A tag is a key-value pair you can use to manage,
  /// filter, and search for your resources. Allowed characters include UTF-8
  /// letters, numbers, spaces, and the following characters: + - = . _ : /.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    final $payload = <String, dynamic>{
      'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This operation removes tags from the specified resource.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) that uniquely identifies the resource where
  /// you want to remove tags.
  ///
  /// Parameter [tagKeys] :
  /// This required parameter contains the tag keys you want to remove from the
  /// source.
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

  /// This operation creates a search job which returns recovery points filtered
  /// by SearchScope and items filtered by ItemFilters.
  ///
  /// You can optionally include ClientToken, EncryptionKeyArn, Name, and/or
  /// Tags.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [searchScope] :
  /// This object can contain BackupResourceTypes, BackupResourceArns,
  /// BackupResourceCreationTime, BackupResourceTags, and SourceResourceArns to
  /// filter the recovery points returned by the search job.
  ///
  /// Parameter [clientToken] :
  /// Include this parameter to allow multiple identical calls for idempotency.
  ///
  /// A client token is valid for 8 hours after the first request that uses it
  /// is completed. After this time, any request with the same token is treated
  /// as a new request.
  ///
  /// Parameter [encryptionKeyArn] :
  /// The encryption key for the specified search job.
  ///
  /// Parameter [itemFilters] :
  /// Item Filters represent all input item properties specified when the search
  /// was created.
  ///
  /// Contains either EBSItemFilters or S3ItemFilters
  ///
  /// Parameter [name] :
  /// Include alphanumeric characters to create a name for this search job.
  ///
  /// Parameter [tags] :
  /// List of tags returned by the operation.
  Future<StartSearchJobOutput> startSearchJob({
    required SearchScope searchScope,
    String? clientToken,
    String? encryptionKeyArn,
    ItemFilters? itemFilters,
    String? name,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'SearchScope': searchScope,
      if (clientToken != null) 'ClientToken': clientToken,
      if (encryptionKeyArn != null) 'EncryptionKeyArn': encryptionKeyArn,
      if (itemFilters != null) 'ItemFilters': itemFilters,
      if (name != null) 'Name': name,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/search-jobs',
      exceptionFnMap: _exceptionFns,
    );
    return StartSearchJobOutput.fromJson(response);
  }

  /// This operation retrieves metadata of a search job, including its progress.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [searchJobIdentifier] :
  /// Required unique string that specifies the search job.
  Future<GetSearchJobOutput> getSearchJob({
    required String searchJobIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/search-jobs/${Uri.encodeComponent(searchJobIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetSearchJobOutput.fromJson(response);
  }

  /// This operations ends a search job.
  ///
  /// Only a search job with a status of <code>RUNNING</code> can be stopped.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [searchJobIdentifier] :
  /// The unique string that specifies the search job.
  Future<void> stopSearchJob({
    required String searchJobIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri:
          '/search-jobs/${Uri.encodeComponent(searchJobIdentifier)}/actions/cancel',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This operation returns a list of search jobs belonging to an account.
  ///
  /// Parameter [byStatus] :
  /// Include this parameter to filter list by search job status.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of resource list items to be returned.
  ///
  /// Parameter [nextToken] :
  /// The next item following a partial list of returned search jobs.
  ///
  /// For example, if a request is made to return <code>MaxResults</code> number
  /// of backups, <code>NextToken</code> allows you to return more items in your
  /// list starting at the location pointed to by the next token.
  Future<ListSearchJobsOutput> listSearchJobs({
    SearchJobState? byStatus,
    int? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (byStatus != null) 'Status': [byStatus.value],
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/search-jobs',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSearchJobsOutput.fromJson(response);
  }

  /// This operations starts a job to export the results of search job to a
  /// designated S3 bucket.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [exportSpecification] :
  /// This specification contains a required string of the destination bucket;
  /// optionally, you can include the destination prefix.
  ///
  /// Parameter [searchJobIdentifier] :
  /// The unique string that specifies the search job.
  ///
  /// Parameter [clientToken] :
  /// Include this parameter to allow multiple identical calls for idempotency.
  ///
  /// A client token is valid for 8 hours after the first request that uses it
  /// is completed. After this time, any request with the same token is treated
  /// as a new request.
  ///
  /// Parameter [roleArn] :
  /// This parameter specifies the role ARN used to start the search results
  /// export jobs.
  ///
  /// Parameter [tags] :
  /// Optional tags to include. A tag is a key-value pair you can use to manage,
  /// filter, and search for your resources. Allowed characters include UTF-8
  /// letters, numbers, spaces, and the following characters: + - = . _ : /.
  Future<StartSearchResultExportJobOutput> startSearchResultExportJob({
    required ExportSpecification exportSpecification,
    required String searchJobIdentifier,
    String? clientToken,
    String? roleArn,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'ExportSpecification': exportSpecification,
      'SearchJobIdentifier': searchJobIdentifier,
      if (clientToken != null) 'ClientToken': clientToken,
      if (roleArn != null) 'RoleArn': roleArn,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/export-search-jobs',
      exceptionFnMap: _exceptionFns,
    );
    return StartSearchResultExportJobOutput.fromJson(response);
  }

  /// This operation retrieves the metadata of an export job.
  ///
  /// An export job is an operation that transmits the results of a search job
  /// to a specified S3 bucket in a .csv file.
  ///
  /// An export job allows you to retain results of a search beyond the search
  /// job's scheduled retention of 7 days.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [exportJobIdentifier] :
  /// This is the unique string that identifies a specific export job.
  ///
  /// Required for this operation.
  Future<GetSearchResultExportJobOutput> getSearchResultExportJob({
    required String exportJobIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/export-search-jobs/${Uri.encodeComponent(exportJobIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetSearchResultExportJobOutput.fromJson(response);
  }

  /// This operation exports search results of a search job to a specified
  /// destination S3 bucket.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of resource list items to be returned.
  ///
  /// Parameter [nextToken] :
  /// The next item following a partial list of returned backups included in a
  /// search job.
  ///
  /// For example, if a request is made to return <code>MaxResults</code> number
  /// of backups, <code>NextToken</code> allows you to return more items in your
  /// list starting at the location pointed to by the next token.
  ///
  /// Parameter [searchJobIdentifier] :
  /// The unique string that specifies the search job.
  ///
  /// Parameter [status] :
  /// The search jobs to be included in the export job can be filtered by
  /// including this parameter.
  Future<ListSearchResultExportJobsOutput> listSearchResultExportJobs({
    int? maxResults,
    String? nextToken,
    String? searchJobIdentifier,
    ExportJobStatus? status,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
      if (searchJobIdentifier != null)
        'SearchJobIdentifier': [searchJobIdentifier],
      if (status != null) 'Status': [status.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/export-search-jobs',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSearchResultExportJobsOutput.fromJson(response);
  }
}

/// @nodoc
class ListSearchJobBackupsOutput {
  /// The recovery points returned the results of a search job
  final List<SearchJobBackupsResult> results;

  /// The next item following a partial list of returned backups included in a
  /// search job.
  ///
  /// For example, if a request is made to return <code>MaxResults</code> number
  /// of backups, <code>NextToken</code> allows you to return more items in your
  /// list starting at the location pointed to by the next token.
  final String? nextToken;

  ListSearchJobBackupsOutput({
    required this.results,
    this.nextToken,
  });

  factory ListSearchJobBackupsOutput.fromJson(Map<String, dynamic> json) {
    return ListSearchJobBackupsOutput(
      results: ((json['Results'] as List?) ?? const [])
          .nonNulls
          .map(
              (e) => SearchJobBackupsResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final results = this.results;
    final nextToken = this.nextToken;
    return {
      'Results': results,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class ListSearchJobResultsOutput {
  /// The results consist of either EBSResultItem or S3ResultItem.
  final List<ResultItem> results;

  /// The next item following a partial list of search job results.
  ///
  /// For example, if a request is made to return <code>MaxResults</code> number
  /// of backups, <code>NextToken</code> allows you to return more items in your
  /// list starting at the location pointed to by the next token.
  final String? nextToken;

  ListSearchJobResultsOutput({
    required this.results,
    this.nextToken,
  });

  factory ListSearchJobResultsOutput.fromJson(Map<String, dynamic> json) {
    return ListSearchJobResultsOutput(
      results: ((json['Results'] as List?) ?? const [])
          .nonNulls
          .map((e) => ResultItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final results = this.results;
    final nextToken = this.nextToken;
    return {
      'Results': results,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class ListTagsForResourceResponse {
  /// List of tags returned by the operation.
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
class StartSearchJobOutput {
  /// The date and time that a job was created, in Unix format and Coordinated
  /// Universal Time (UTC). The value of <code>CompletionTime</code> is accurate
  /// to milliseconds. For example, the value 1516925490.087 represents Friday,
  /// January 26, 2018 12:11:30.087 AM.
  final DateTime? creationTime;

  /// The unique string that identifies the Amazon Resource Name (ARN) of the
  /// specified search job.
  final String? searchJobArn;

  /// The unique string that specifies the search job.
  final String? searchJobIdentifier;

  StartSearchJobOutput({
    this.creationTime,
    this.searchJobArn,
    this.searchJobIdentifier,
  });

  factory StartSearchJobOutput.fromJson(Map<String, dynamic> json) {
    return StartSearchJobOutput(
      creationTime: timeStampFromJson(json['CreationTime']),
      searchJobArn: json['SearchJobArn'] as String?,
      searchJobIdentifier: json['SearchJobIdentifier'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final searchJobArn = this.searchJobArn;
    final searchJobIdentifier = this.searchJobIdentifier;
    return {
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (searchJobArn != null) 'SearchJobArn': searchJobArn,
      if (searchJobIdentifier != null)
        'SearchJobIdentifier': searchJobIdentifier,
    };
  }
}

/// @nodoc
class GetSearchJobOutput {
  /// The date and time that a search job was created, in Unix format and
  /// Coordinated Universal Time (UTC). The value of <code>CompletionTime</code>
  /// is accurate to milliseconds. For example, the value 1516925490.087
  /// represents Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime creationTime;

  /// Item Filters represent all input item properties specified when the search
  /// was created.
  final ItemFilters itemFilters;

  /// The unique string that identifies the Amazon Resource Name (ARN) of the
  /// specified search job.
  final String searchJobArn;

  /// The unique string that identifies the specified search job.
  final String searchJobIdentifier;

  /// The search scope is all backup properties input into a search.
  final SearchScope searchScope;

  /// The current status of the specified search job.
  ///
  /// A search job may have one of the following statuses: <code>RUNNING</code>;
  /// <code>COMPLETED</code>; <code>STOPPED</code>; <code>FAILED</code>;
  /// <code>TIMED_OUT</code>; or <code>EXPIRED</code> .
  final SearchJobState status;

  /// The date and time that a search job completed, in Unix format and
  /// Coordinated Universal Time (UTC). The value of <code>CompletionTime</code>
  /// is accurate to milliseconds. For example, the value 1516925490.087
  /// represents Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime? completionTime;

  /// Returns numbers representing BackupsScannedCount, ItemsScanned, and
  /// ItemsMatched.
  final CurrentSearchProgress? currentSearchProgress;

  /// The encryption key for the specified search job.
  ///
  /// Example:
  /// <code>arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>.
  final String? encryptionKeyArn;

  /// Returned name of the specified search job.
  final String? name;

  /// Returned summary of the specified search job scope, including:
  ///
  /// <ul>
  /// <li>
  /// TotalBackupsToScanCount, the number of recovery points returned by the
  /// search.
  /// </li>
  /// <li>
  /// TotalItemsToScanCount, the number of items returned by the search.
  /// </li>
  /// </ul>
  final SearchScopeSummary? searchScopeSummary;

  /// A status message will be returned for either a earch job with a status of
  /// <code>ERRORED</code> or a status of <code>COMPLETED</code> jobs with issues.
  ///
  /// For example, a message may say that a search contained recovery points
  /// unable to be scanned because of a permissions issue.
  final String? statusMessage;

  GetSearchJobOutput({
    required this.creationTime,
    required this.itemFilters,
    required this.searchJobArn,
    required this.searchJobIdentifier,
    required this.searchScope,
    required this.status,
    this.completionTime,
    this.currentSearchProgress,
    this.encryptionKeyArn,
    this.name,
    this.searchScopeSummary,
    this.statusMessage,
  });

  factory GetSearchJobOutput.fromJson(Map<String, dynamic> json) {
    return GetSearchJobOutput(
      creationTime: nonNullableTimeStampFromJson(json['CreationTime'] ?? 0),
      itemFilters: ItemFilters.fromJson(
          (json['ItemFilters'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      searchJobArn: (json['SearchJobArn'] as String?) ?? '',
      searchJobIdentifier: (json['SearchJobIdentifier'] as String?) ?? '',
      searchScope: SearchScope.fromJson(
          (json['SearchScope'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      status: SearchJobState.fromString((json['Status'] as String?) ?? ''),
      completionTime: timeStampFromJson(json['CompletionTime']),
      currentSearchProgress: json['CurrentSearchProgress'] != null
          ? CurrentSearchProgress.fromJson(
              json['CurrentSearchProgress'] as Map<String, dynamic>)
          : null,
      encryptionKeyArn: json['EncryptionKeyArn'] as String?,
      name: json['Name'] as String?,
      searchScopeSummary: json['SearchScopeSummary'] != null
          ? SearchScopeSummary.fromJson(
              json['SearchScopeSummary'] as Map<String, dynamic>)
          : null,
      statusMessage: json['StatusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final itemFilters = this.itemFilters;
    final searchJobArn = this.searchJobArn;
    final searchJobIdentifier = this.searchJobIdentifier;
    final searchScope = this.searchScope;
    final status = this.status;
    final completionTime = this.completionTime;
    final currentSearchProgress = this.currentSearchProgress;
    final encryptionKeyArn = this.encryptionKeyArn;
    final name = this.name;
    final searchScopeSummary = this.searchScopeSummary;
    final statusMessage = this.statusMessage;
    return {
      'CreationTime': unixTimestampToJson(creationTime),
      'ItemFilters': itemFilters,
      'SearchJobArn': searchJobArn,
      'SearchJobIdentifier': searchJobIdentifier,
      'SearchScope': searchScope,
      'Status': status.value,
      if (completionTime != null)
        'CompletionTime': unixTimestampToJson(completionTime),
      if (currentSearchProgress != null)
        'CurrentSearchProgress': currentSearchProgress,
      if (encryptionKeyArn != null) 'EncryptionKeyArn': encryptionKeyArn,
      if (name != null) 'Name': name,
      if (searchScopeSummary != null) 'SearchScopeSummary': searchScopeSummary,
      if (statusMessage != null) 'StatusMessage': statusMessage,
    };
  }
}

/// @nodoc
class StopSearchJobOutput {
  StopSearchJobOutput();

  factory StopSearchJobOutput.fromJson(Map<String, dynamic> _) {
    return StopSearchJobOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class ListSearchJobsOutput {
  /// The search jobs among the list, with details of the returned search jobs.
  final List<SearchJobSummary> searchJobs;

  /// The next item following a partial list of returned backups included in a
  /// search job.
  ///
  /// For example, if a request is made to return <code>MaxResults</code> number
  /// of backups, <code>NextToken</code> allows you to return more items in your
  /// list starting at the location pointed to by the next token.
  final String? nextToken;

  ListSearchJobsOutput({
    required this.searchJobs,
    this.nextToken,
  });

  factory ListSearchJobsOutput.fromJson(Map<String, dynamic> json) {
    return ListSearchJobsOutput(
      searchJobs: ((json['SearchJobs'] as List?) ?? const [])
          .nonNulls
          .map((e) => SearchJobSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final searchJobs = this.searchJobs;
    final nextToken = this.nextToken;
    return {
      'SearchJobs': searchJobs,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class StartSearchResultExportJobOutput {
  /// This is the unique identifier that specifies the new export job.
  final String exportJobIdentifier;

  /// This is the unique ARN (Amazon Resource Name) that belongs to the new export
  /// job.
  final String? exportJobArn;

  StartSearchResultExportJobOutput({
    required this.exportJobIdentifier,
    this.exportJobArn,
  });

  factory StartSearchResultExportJobOutput.fromJson(Map<String, dynamic> json) {
    return StartSearchResultExportJobOutput(
      exportJobIdentifier: (json['ExportJobIdentifier'] as String?) ?? '',
      exportJobArn: json['ExportJobArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final exportJobIdentifier = this.exportJobIdentifier;
    final exportJobArn = this.exportJobArn;
    return {
      'ExportJobIdentifier': exportJobIdentifier,
      if (exportJobArn != null) 'ExportJobArn': exportJobArn,
    };
  }
}

/// @nodoc
class GetSearchResultExportJobOutput {
  /// This is the unique string that identifies the specified export job.
  final String exportJobIdentifier;

  /// The date and time that an export job completed, in Unix format and
  /// Coordinated Universal Time (UTC). The value of <code>CreationTime</code> is
  /// accurate to milliseconds. For example, the value 1516925490.087 represents
  /// Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime? completionTime;

  /// The date and time that an export job was created, in Unix format and
  /// Coordinated Universal Time (UTC). The value of <code>CreationTime</code> is
  /// accurate to milliseconds. For example, the value 1516925490.087 represents
  /// Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime? creationTime;

  /// The unique Amazon Resource Name (ARN) that uniquely identifies the export
  /// job.
  final String? exportJobArn;

  /// The export specification consists of the destination S3 bucket to which the
  /// search results were exported, along with the destination prefix.
  final ExportSpecification? exportSpecification;

  /// The unique string that identifies the Amazon Resource Name (ARN) of the
  /// specified search job.
  final String? searchJobArn;

  /// This is the current status of the export job.
  final ExportJobStatus? status;

  /// A status message is a string that is returned for search job with a status
  /// of <code>FAILED</code>, along with steps to remedy and retry the operation.
  final String? statusMessage;

  GetSearchResultExportJobOutput({
    required this.exportJobIdentifier,
    this.completionTime,
    this.creationTime,
    this.exportJobArn,
    this.exportSpecification,
    this.searchJobArn,
    this.status,
    this.statusMessage,
  });

  factory GetSearchResultExportJobOutput.fromJson(Map<String, dynamic> json) {
    return GetSearchResultExportJobOutput(
      exportJobIdentifier: (json['ExportJobIdentifier'] as String?) ?? '',
      completionTime: timeStampFromJson(json['CompletionTime']),
      creationTime: timeStampFromJson(json['CreationTime']),
      exportJobArn: json['ExportJobArn'] as String?,
      exportSpecification: json['ExportSpecification'] != null
          ? ExportSpecification.fromJson(
              json['ExportSpecification'] as Map<String, dynamic>)
          : null,
      searchJobArn: json['SearchJobArn'] as String?,
      status: (json['Status'] as String?)?.let(ExportJobStatus.fromString),
      statusMessage: json['StatusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final exportJobIdentifier = this.exportJobIdentifier;
    final completionTime = this.completionTime;
    final creationTime = this.creationTime;
    final exportJobArn = this.exportJobArn;
    final exportSpecification = this.exportSpecification;
    final searchJobArn = this.searchJobArn;
    final status = this.status;
    final statusMessage = this.statusMessage;
    return {
      'ExportJobIdentifier': exportJobIdentifier,
      if (completionTime != null)
        'CompletionTime': unixTimestampToJson(completionTime),
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (exportJobArn != null) 'ExportJobArn': exportJobArn,
      if (exportSpecification != null)
        'ExportSpecification': exportSpecification,
      if (searchJobArn != null) 'SearchJobArn': searchJobArn,
      if (status != null) 'Status': status.value,
      if (statusMessage != null) 'StatusMessage': statusMessage,
    };
  }
}

/// @nodoc
class ListSearchResultExportJobsOutput {
  /// The operation returns the included export jobs.
  final List<ExportJobSummary> exportJobs;

  /// The next item following a partial list of returned backups included in a
  /// search job.
  ///
  /// For example, if a request is made to return <code>MaxResults</code> number
  /// of backups, <code>NextToken</code> allows you to return more items in your
  /// list starting at the location pointed to by the next token.
  final String? nextToken;

  ListSearchResultExportJobsOutput({
    required this.exportJobs,
    this.nextToken,
  });

  factory ListSearchResultExportJobsOutput.fromJson(Map<String, dynamic> json) {
    return ListSearchResultExportJobsOutput(
      exportJobs: ((json['ExportJobs'] as List?) ?? const [])
          .nonNulls
          .map((e) => ExportJobSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final exportJobs = this.exportJobs;
    final nextToken = this.nextToken;
    return {
      'ExportJobs': exportJobs,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// This is the summary of an export job.
///
/// @nodoc
class ExportJobSummary {
  /// This is the unique string that identifies a specific export job.
  final String exportJobIdentifier;

  /// This is a timestamp of the time the export job compeleted.
  final DateTime? completionTime;

  /// This is a timestamp of the time the export job was created.
  final DateTime? creationTime;

  /// This is the unique ARN (Amazon Resource Name) that belongs to the new export
  /// job.
  final String? exportJobArn;

  /// The unique string that identifies the Amazon Resource Name (ARN) of the
  /// specified search job.
  final String? searchJobArn;

  /// The status of the export job is one of the following:
  ///
  /// <code>CREATED</code>; <code>RUNNING</code>; <code>FAILED</code>; or
  /// <code>COMPLETED</code>.
  final ExportJobStatus? status;

  /// A status message is a string that is returned for an export job.
  ///
  /// A status message is included for any status other than
  /// <code>COMPLETED</code> without issues.
  final String? statusMessage;

  ExportJobSummary({
    required this.exportJobIdentifier,
    this.completionTime,
    this.creationTime,
    this.exportJobArn,
    this.searchJobArn,
    this.status,
    this.statusMessage,
  });

  factory ExportJobSummary.fromJson(Map<String, dynamic> json) {
    return ExportJobSummary(
      exportJobIdentifier: (json['ExportJobIdentifier'] as String?) ?? '',
      completionTime: timeStampFromJson(json['CompletionTime']),
      creationTime: timeStampFromJson(json['CreationTime']),
      exportJobArn: json['ExportJobArn'] as String?,
      searchJobArn: json['SearchJobArn'] as String?,
      status: (json['Status'] as String?)?.let(ExportJobStatus.fromString),
      statusMessage: json['StatusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final exportJobIdentifier = this.exportJobIdentifier;
    final completionTime = this.completionTime;
    final creationTime = this.creationTime;
    final exportJobArn = this.exportJobArn;
    final searchJobArn = this.searchJobArn;
    final status = this.status;
    final statusMessage = this.statusMessage;
    return {
      'ExportJobIdentifier': exportJobIdentifier,
      if (completionTime != null)
        'CompletionTime': unixTimestampToJson(completionTime),
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (exportJobArn != null) 'ExportJobArn': exportJobArn,
      if (searchJobArn != null) 'SearchJobArn': searchJobArn,
      if (status != null) 'Status': status.value,
      if (statusMessage != null) 'StatusMessage': statusMessage,
    };
  }
}

/// @nodoc
class ExportJobStatus {
  static const running = ExportJobStatus._('RUNNING');
  static const failed = ExportJobStatus._('FAILED');
  static const completed = ExportJobStatus._('COMPLETED');

  final String value;

  const ExportJobStatus._(this.value);

  static const values = [running, failed, completed];

  static ExportJobStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ExportJobStatus._(value));

  @override
  bool operator ==(other) => other is ExportJobStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// This contains the export specification object.
///
/// @nodoc
class ExportSpecification {
  /// This specifies the destination Amazon S3 bucket for the export job. And, if
  /// included, it also specifies the destination prefix.
  final S3ExportSpecification? s3ExportSpecification;

  ExportSpecification({
    this.s3ExportSpecification,
  });

  factory ExportSpecification.fromJson(Map<String, dynamic> json) {
    return ExportSpecification(
      s3ExportSpecification: json['s3ExportSpecification'] != null
          ? S3ExportSpecification.fromJson(
              json['s3ExportSpecification'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final s3ExportSpecification = this.s3ExportSpecification;
    return {
      if (s3ExportSpecification != null)
        's3ExportSpecification': s3ExportSpecification,
    };
  }
}

/// This specification contains a required string of the destination bucket;
/// optionally, you can include the destination prefix.
///
/// @nodoc
class S3ExportSpecification {
  /// This specifies the destination Amazon S3 bucket for the export job.
  final String destinationBucket;

  /// This specifies the prefix for the destination Amazon S3 bucket for the
  /// export job.
  final String? destinationPrefix;

  S3ExportSpecification({
    required this.destinationBucket,
    this.destinationPrefix,
  });

  factory S3ExportSpecification.fromJson(Map<String, dynamic> json) {
    return S3ExportSpecification(
      destinationBucket: (json['DestinationBucket'] as String?) ?? '',
      destinationPrefix: json['DestinationPrefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final destinationBucket = this.destinationBucket;
    final destinationPrefix = this.destinationPrefix;
    return {
      'DestinationBucket': destinationBucket,
      if (destinationPrefix != null) 'DestinationPrefix': destinationPrefix,
    };
  }
}

/// This is information pertaining to a search job.
///
/// @nodoc
class SearchJobSummary {
  /// This is the completion time of the search job.
  final DateTime? completionTime;

  /// This is the creation time of the search job.
  final DateTime? creationTime;

  /// This is the name of the search job.
  final String? name;

  /// The unique string that identifies the Amazon Resource Name (ARN) of the
  /// specified search job.
  final String? searchJobArn;

  /// The unique string that specifies the search job.
  final String? searchJobIdentifier;

  /// Returned summary of the specified search job scope, including:
  ///
  /// <ul>
  /// <li>
  /// TotalBackupsToScanCount, the number of recovery points returned by the
  /// search.
  /// </li>
  /// <li>
  /// TotalItemsToScanCount, the number of items returned by the search.
  /// </li>
  /// </ul>
  final SearchScopeSummary? searchScopeSummary;

  /// This is the status of the search job.
  final SearchJobState? status;

  /// A status message will be returned for either a earch job with a status of
  /// <code>ERRORED</code> or a status of <code>COMPLETED</code> jobs with issues.
  ///
  /// For example, a message may say that a search contained recovery points
  /// unable to be scanned because of a permissions issue.
  final String? statusMessage;

  SearchJobSummary({
    this.completionTime,
    this.creationTime,
    this.name,
    this.searchJobArn,
    this.searchJobIdentifier,
    this.searchScopeSummary,
    this.status,
    this.statusMessage,
  });

  factory SearchJobSummary.fromJson(Map<String, dynamic> json) {
    return SearchJobSummary(
      completionTime: timeStampFromJson(json['CompletionTime']),
      creationTime: timeStampFromJson(json['CreationTime']),
      name: json['Name'] as String?,
      searchJobArn: json['SearchJobArn'] as String?,
      searchJobIdentifier: json['SearchJobIdentifier'] as String?,
      searchScopeSummary: json['SearchScopeSummary'] != null
          ? SearchScopeSummary.fromJson(
              json['SearchScopeSummary'] as Map<String, dynamic>)
          : null,
      status: (json['Status'] as String?)?.let(SearchJobState.fromString),
      statusMessage: json['StatusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final completionTime = this.completionTime;
    final creationTime = this.creationTime;
    final name = this.name;
    final searchJobArn = this.searchJobArn;
    final searchJobIdentifier = this.searchJobIdentifier;
    final searchScopeSummary = this.searchScopeSummary;
    final status = this.status;
    final statusMessage = this.statusMessage;
    return {
      if (completionTime != null)
        'CompletionTime': unixTimestampToJson(completionTime),
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (name != null) 'Name': name,
      if (searchJobArn != null) 'SearchJobArn': searchJobArn,
      if (searchJobIdentifier != null)
        'SearchJobIdentifier': searchJobIdentifier,
      if (searchScopeSummary != null) 'SearchScopeSummary': searchScopeSummary,
      if (status != null) 'Status': status.value,
      if (statusMessage != null) 'StatusMessage': statusMessage,
    };
  }
}

/// @nodoc
class SearchJobState {
  static const running = SearchJobState._('RUNNING');
  static const completed = SearchJobState._('COMPLETED');
  static const stopping = SearchJobState._('STOPPING');
  static const stopped = SearchJobState._('STOPPED');
  static const failed = SearchJobState._('FAILED');

  final String value;

  const SearchJobState._(this.value);

  static const values = [running, completed, stopping, stopped, failed];

  static SearchJobState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SearchJobState._(value));

  @override
  bool operator ==(other) => other is SearchJobState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The summary of the specified search job scope, including:
///
/// <ul>
/// <li>
/// TotalBackupsToScanCount, the number of recovery points returned by the
/// search.
/// </li>
/// <li>
/// TotalItemsToScanCount, the number of items returned by the search.
/// </li>
/// </ul>
///
/// @nodoc
class SearchScopeSummary {
  /// This is the count of the total number of items that will be scanned in a
  /// search.
  final int? totalItemsToScanCount;

  /// This is the count of the total number of backups that will be scanned in a
  /// search.
  final int? totalRecoveryPointsToScanCount;

  SearchScopeSummary({
    this.totalItemsToScanCount,
    this.totalRecoveryPointsToScanCount,
  });

  factory SearchScopeSummary.fromJson(Map<String, dynamic> json) {
    return SearchScopeSummary(
      totalItemsToScanCount: json['TotalItemsToScanCount'] as int?,
      totalRecoveryPointsToScanCount:
          json['TotalRecoveryPointsToScanCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final totalItemsToScanCount = this.totalItemsToScanCount;
    final totalRecoveryPointsToScanCount = this.totalRecoveryPointsToScanCount;
    return {
      if (totalItemsToScanCount != null)
        'TotalItemsToScanCount': totalItemsToScanCount,
      if (totalRecoveryPointsToScanCount != null)
        'TotalRecoveryPointsToScanCount': totalRecoveryPointsToScanCount,
    };
  }
}

/// This contains information results retrieved from a search job that may not
/// have completed.
///
/// @nodoc
class CurrentSearchProgress {
  /// This number is the sum of all items that match the item filters in a search
  /// job in progress.
  final int? itemsMatchedCount;

  /// This number is the sum of all items that have been scanned so far during a
  /// search job.
  final int? itemsScannedCount;

  /// This number is the sum of all backups that have been scanned so far during a
  /// search job.
  final int? recoveryPointsScannedCount;

  CurrentSearchProgress({
    this.itemsMatchedCount,
    this.itemsScannedCount,
    this.recoveryPointsScannedCount,
  });

  factory CurrentSearchProgress.fromJson(Map<String, dynamic> json) {
    return CurrentSearchProgress(
      itemsMatchedCount: json['ItemsMatchedCount'] as int?,
      itemsScannedCount: json['ItemsScannedCount'] as int?,
      recoveryPointsScannedCount: json['RecoveryPointsScannedCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final itemsMatchedCount = this.itemsMatchedCount;
    final itemsScannedCount = this.itemsScannedCount;
    final recoveryPointsScannedCount = this.recoveryPointsScannedCount;
    return {
      if (itemsMatchedCount != null) 'ItemsMatchedCount': itemsMatchedCount,
      if (itemsScannedCount != null) 'ItemsScannedCount': itemsScannedCount,
      if (recoveryPointsScannedCount != null)
        'RecoveryPointsScannedCount': recoveryPointsScannedCount,
    };
  }
}

/// The search scope is all backup properties input into a search.
///
/// @nodoc
class SearchScope {
  /// The resource types included in a search.
  ///
  /// Eligible resource types include S3 and EBS.
  final List<ResourceType> backupResourceTypes;

  /// The Amazon Resource Name (ARN) that uniquely identifies the backup
  /// resources.
  final List<String>? backupResourceArns;

  /// This is the time a backup resource was created.
  final BackupCreationTimeFilter? backupResourceCreationTime;

  /// These are one or more tags on the backup (recovery point).
  final Map<String, String>? backupResourceTags;

  /// The Amazon Resource Name (ARN) that uniquely identifies the source
  /// resources.
  final List<String>? sourceResourceArns;

  SearchScope({
    required this.backupResourceTypes,
    this.backupResourceArns,
    this.backupResourceCreationTime,
    this.backupResourceTags,
    this.sourceResourceArns,
  });

  factory SearchScope.fromJson(Map<String, dynamic> json) {
    return SearchScope(
      backupResourceTypes: ((json['BackupResourceTypes'] as List?) ?? const [])
          .nonNulls
          .map((e) => ResourceType.fromString((e as String)))
          .toList(),
      backupResourceArns: (json['BackupResourceArns'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      backupResourceCreationTime: json['BackupResourceCreationTime'] != null
          ? BackupCreationTimeFilter.fromJson(
              json['BackupResourceCreationTime'] as Map<String, dynamic>)
          : null,
      backupResourceTags: (json['BackupResourceTags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      sourceResourceArns: (json['SourceResourceArns'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final backupResourceTypes = this.backupResourceTypes;
    final backupResourceArns = this.backupResourceArns;
    final backupResourceCreationTime = this.backupResourceCreationTime;
    final backupResourceTags = this.backupResourceTags;
    final sourceResourceArns = this.sourceResourceArns;
    return {
      'BackupResourceTypes': backupResourceTypes.map((e) => e.value).toList(),
      if (backupResourceArns != null) 'BackupResourceArns': backupResourceArns,
      if (backupResourceCreationTime != null)
        'BackupResourceCreationTime': backupResourceCreationTime,
      if (backupResourceTags != null) 'BackupResourceTags': backupResourceTags,
      if (sourceResourceArns != null) 'SourceResourceArns': sourceResourceArns,
    };
  }
}

/// Item Filters represent all input item properties specified when the search
/// was created.
///
/// Contains either EBSItemFilters or S3ItemFilters
///
/// @nodoc
class ItemFilters {
  /// This array can contain CreationTimes, FilePaths, LastModificationTimes, or
  /// Sizes objects.
  final List<EBSItemFilter>? eBSItemFilters;

  /// This array can contain CreationTimes, ETags, ObjectKeys, Sizes, or
  /// VersionIds objects.
  final List<S3ItemFilter>? s3ItemFilters;

  ItemFilters({
    this.eBSItemFilters,
    this.s3ItemFilters,
  });

  factory ItemFilters.fromJson(Map<String, dynamic> json) {
    return ItemFilters(
      eBSItemFilters: (json['EBSItemFilters'] as List?)
          ?.nonNulls
          .map((e) => EBSItemFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      s3ItemFilters: (json['S3ItemFilters'] as List?)
          ?.nonNulls
          .map((e) => S3ItemFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final eBSItemFilters = this.eBSItemFilters;
    final s3ItemFilters = this.s3ItemFilters;
    return {
      if (eBSItemFilters != null) 'EBSItemFilters': eBSItemFilters,
      if (s3ItemFilters != null) 'S3ItemFilters': s3ItemFilters,
    };
  }
}

/// This contains arrays of objects, which may include CreationTimes time
/// condition objects, FilePaths string objects, LastModificationTimes time
/// condition objects,
///
/// @nodoc
class EBSItemFilter {
  /// You can include 1 to 10 values.
  ///
  /// If one is included, the results will return only items that match.
  ///
  /// If more than one is included, the results will return all items that match
  /// any of the included values.
  final List<TimeCondition>? creationTimes;

  /// You can include 1 to 10 values.
  ///
  /// If one file path is included, the results will return only items that match
  /// the file path.
  ///
  /// If more than one file path is included, the results will return all items
  /// that match any of the file paths.
  final List<StringCondition>? filePaths;

  /// You can include 1 to 10 values.
  ///
  /// If one is included, the results will return only items that match.
  ///
  /// If more than one is included, the results will return all items that match
  /// any of the included values.
  final List<TimeCondition>? lastModificationTimes;

  /// You can include 1 to 10 values.
  ///
  /// If one is included, the results will return only items that match.
  ///
  /// If more than one is included, the results will return all items that match
  /// any of the included values.
  final List<LongCondition>? sizes;

  EBSItemFilter({
    this.creationTimes,
    this.filePaths,
    this.lastModificationTimes,
    this.sizes,
  });

  factory EBSItemFilter.fromJson(Map<String, dynamic> json) {
    return EBSItemFilter(
      creationTimes: (json['CreationTimes'] as List?)
          ?.nonNulls
          .map((e) => TimeCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
      filePaths: (json['FilePaths'] as List?)
          ?.nonNulls
          .map((e) => StringCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastModificationTimes: (json['LastModificationTimes'] as List?)
          ?.nonNulls
          .map((e) => TimeCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
      sizes: (json['Sizes'] as List?)
          ?.nonNulls
          .map((e) => LongCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTimes = this.creationTimes;
    final filePaths = this.filePaths;
    final lastModificationTimes = this.lastModificationTimes;
    final sizes = this.sizes;
    return {
      if (creationTimes != null) 'CreationTimes': creationTimes,
      if (filePaths != null) 'FilePaths': filePaths,
      if (lastModificationTimes != null)
        'LastModificationTimes': lastModificationTimes,
      if (sizes != null) 'Sizes': sizes,
    };
  }
}

/// A time condition denotes a creation time, last modification time, or other
/// time.
///
/// @nodoc
class TimeCondition {
  /// This is the timestamp value of the time condition.
  final DateTime value;

  /// A string that defines what values will be returned.
  ///
  /// If this is included, avoid combinations of operators that will return all
  /// possible values. For example, including both <code>EQUALS_TO</code> and
  /// <code>NOT_EQUALS_TO</code> with a value of <code>4</code> will return all
  /// values.
  final TimeConditionOperator? operator;

  TimeCondition({
    required this.value,
    this.operator,
  });

  factory TimeCondition.fromJson(Map<String, dynamic> json) {
    return TimeCondition(
      value: nonNullableTimeStampFromJson(json['Value'] ?? 0),
      operator:
          (json['Operator'] as String?)?.let(TimeConditionOperator.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final value = this.value;
    final operator = this.operator;
    return {
      'Value': unixTimestampToJson(value),
      if (operator != null) 'Operator': operator.value,
    };
  }
}

/// @nodoc
class TimeConditionOperator {
  static const equalsTo = TimeConditionOperator._('EQUALS_TO');
  static const notEqualsTo = TimeConditionOperator._('NOT_EQUALS_TO');
  static const lessThanEqualTo = TimeConditionOperator._('LESS_THAN_EQUAL_TO');
  static const greaterThanEqualTo =
      TimeConditionOperator._('GREATER_THAN_EQUAL_TO');

  final String value;

  const TimeConditionOperator._(this.value);

  static const values = [
    equalsTo,
    notEqualsTo,
    lessThanEqualTo,
    greaterThanEqualTo
  ];

  static TimeConditionOperator fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TimeConditionOperator._(value));

  @override
  bool operator ==(other) =>
      other is TimeConditionOperator && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The long condition contains a <code>Value</code> and can optionally contain
/// an <code>Operator</code>.
///
/// @nodoc
class LongCondition {
  /// The value of an item included in one of the search item filters.
  final int value;

  /// A string that defines what values will be returned.
  ///
  /// If this is included, avoid combinations of operators that will return all
  /// possible values. For example, including both <code>EQUALS_TO</code> and
  /// <code>NOT_EQUALS_TO</code> with a value of <code>4</code> will return all
  /// values.
  final LongConditionOperator? operator;

  LongCondition({
    required this.value,
    this.operator,
  });

  factory LongCondition.fromJson(Map<String, dynamic> json) {
    return LongCondition(
      value: (json['Value'] as int?) ?? 0,
      operator:
          (json['Operator'] as String?)?.let(LongConditionOperator.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final value = this.value;
    final operator = this.operator;
    return {
      'Value': value,
      if (operator != null) 'Operator': operator.value,
    };
  }
}

/// @nodoc
class LongConditionOperator {
  static const equalsTo = LongConditionOperator._('EQUALS_TO');
  static const notEqualsTo = LongConditionOperator._('NOT_EQUALS_TO');
  static const lessThanEqualTo = LongConditionOperator._('LESS_THAN_EQUAL_TO');
  static const greaterThanEqualTo =
      LongConditionOperator._('GREATER_THAN_EQUAL_TO');

  final String value;

  const LongConditionOperator._(this.value);

  static const values = [
    equalsTo,
    notEqualsTo,
    lessThanEqualTo,
    greaterThanEqualTo
  ];

  static LongConditionOperator fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => LongConditionOperator._(value));

  @override
  bool operator ==(other) =>
      other is LongConditionOperator && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// This contains the value of the string and can contain one or more operators.
///
/// @nodoc
class StringCondition {
  /// The value of the string.
  final String value;

  /// A string that defines what values will be returned.
  ///
  /// If this is included, avoid combinations of operators that will return all
  /// possible values. For example, including both <code>EQUALS_TO</code> and
  /// <code>NOT_EQUALS_TO</code> with a value of <code>4</code> will return all
  /// values.
  final StringConditionOperator? operator;

  StringCondition({
    required this.value,
    this.operator,
  });

  factory StringCondition.fromJson(Map<String, dynamic> json) {
    return StringCondition(
      value: (json['Value'] as String?) ?? '',
      operator: (json['Operator'] as String?)
          ?.let(StringConditionOperator.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final value = this.value;
    final operator = this.operator;
    return {
      'Value': value,
      if (operator != null) 'Operator': operator.value,
    };
  }
}

/// @nodoc
class StringConditionOperator {
  static const equalsTo = StringConditionOperator._('EQUALS_TO');
  static const notEqualsTo = StringConditionOperator._('NOT_EQUALS_TO');
  static const contains = StringConditionOperator._('CONTAINS');
  static const doesNotContain = StringConditionOperator._('DOES_NOT_CONTAIN');
  static const beginsWith = StringConditionOperator._('BEGINS_WITH');
  static const endsWith = StringConditionOperator._('ENDS_WITH');
  static const doesNotBeginWith =
      StringConditionOperator._('DOES_NOT_BEGIN_WITH');
  static const doesNotEndWith = StringConditionOperator._('DOES_NOT_END_WITH');

  final String value;

  const StringConditionOperator._(this.value);

  static const values = [
    equalsTo,
    notEqualsTo,
    contains,
    doesNotContain,
    beginsWith,
    endsWith,
    doesNotBeginWith,
    doesNotEndWith
  ];

  static StringConditionOperator fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => StringConditionOperator._(value));

  @override
  bool operator ==(other) =>
      other is StringConditionOperator && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// This contains arrays of objects, which may include ObjectKeys, Sizes,
/// CreationTimes, VersionIds, and/or Etags.
///
/// @nodoc
class S3ItemFilter {
  /// You can include 1 to 10 values.
  ///
  /// If one value is included, the results will return only items that match the
  /// value.
  ///
  /// If more than one value is included, the results will return all items that
  /// match any of the values.
  final List<TimeCondition>? creationTimes;

  /// You can include 1 to 10 values.
  ///
  /// If one value is included, the results will return only items that match the
  /// value.
  ///
  /// If more than one value is included, the results will return all items that
  /// match any of the values.
  final List<StringCondition>? eTags;

  /// You can include 1 to 10 values.
  ///
  /// If one value is included, the results will return only items that match the
  /// value.
  ///
  /// If more than one value is included, the results will return all items that
  /// match any of the values.
  final List<StringCondition>? objectKeys;

  /// You can include 1 to 10 values.
  ///
  /// If one value is included, the results will return only items that match the
  /// value.
  ///
  /// If more than one value is included, the results will return all items that
  /// match any of the values.
  final List<LongCondition>? sizes;

  /// You can include 1 to 10 values.
  ///
  /// If one value is included, the results will return only items that match the
  /// value.
  ///
  /// If more than one value is included, the results will return all items that
  /// match any of the values.
  final List<StringCondition>? versionIds;

  S3ItemFilter({
    this.creationTimes,
    this.eTags,
    this.objectKeys,
    this.sizes,
    this.versionIds,
  });

  factory S3ItemFilter.fromJson(Map<String, dynamic> json) {
    return S3ItemFilter(
      creationTimes: (json['CreationTimes'] as List?)
          ?.nonNulls
          .map((e) => TimeCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
      eTags: (json['ETags'] as List?)
          ?.nonNulls
          .map((e) => StringCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
      objectKeys: (json['ObjectKeys'] as List?)
          ?.nonNulls
          .map((e) => StringCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
      sizes: (json['Sizes'] as List?)
          ?.nonNulls
          .map((e) => LongCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
      versionIds: (json['VersionIds'] as List?)
          ?.nonNulls
          .map((e) => StringCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTimes = this.creationTimes;
    final eTags = this.eTags;
    final objectKeys = this.objectKeys;
    final sizes = this.sizes;
    final versionIds = this.versionIds;
    return {
      if (creationTimes != null) 'CreationTimes': creationTimes,
      if (eTags != null) 'ETags': eTags,
      if (objectKeys != null) 'ObjectKeys': objectKeys,
      if (sizes != null) 'Sizes': sizes,
      if (versionIds != null) 'VersionIds': versionIds,
    };
  }
}

/// This filters by recovery points within the CreatedAfter and CreatedBefore
/// timestamps.
///
/// @nodoc
class BackupCreationTimeFilter {
  /// This timestamp includes recovery points only created after the specified
  /// time.
  final DateTime? createdAfter;

  /// This timestamp includes recovery points only created before the specified
  /// time.
  final DateTime? createdBefore;

  BackupCreationTimeFilter({
    this.createdAfter,
    this.createdBefore,
  });

  factory BackupCreationTimeFilter.fromJson(Map<String, dynamic> json) {
    return BackupCreationTimeFilter(
      createdAfter: timeStampFromJson(json['CreatedAfter']),
      createdBefore: timeStampFromJson(json['CreatedBefore']),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAfter = this.createdAfter;
    final createdBefore = this.createdBefore;
    return {
      if (createdAfter != null)
        'CreatedAfter': unixTimestampToJson(createdAfter),
      if (createdBefore != null)
        'CreatedBefore': unixTimestampToJson(createdBefore),
    };
  }
}

/// @nodoc
class ResourceType {
  static const s3 = ResourceType._('S3');
  static const ebs = ResourceType._('EBS');

  final String value;

  const ResourceType._(this.value);

  static const values = [s3, ebs];

  static ResourceType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ResourceType._(value));

  @override
  bool operator ==(other) => other is ResourceType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// This is an object representing the item returned in the results of a search
/// for a specific resource type.
///
/// @nodoc
class ResultItem {
  /// These are items returned in the search results of an Amazon EBS search.
  final EBSResultItem? eBSResultItem;

  /// These are items returned in the search results of an Amazon S3 search.
  final S3ResultItem? s3ResultItem;

  ResultItem({
    this.eBSResultItem,
    this.s3ResultItem,
  });

  factory ResultItem.fromJson(Map<String, dynamic> json) {
    return ResultItem(
      eBSResultItem: json['EBSResultItem'] != null
          ? EBSResultItem.fromJson(
              json['EBSResultItem'] as Map<String, dynamic>)
          : null,
      s3ResultItem: json['S3ResultItem'] != null
          ? S3ResultItem.fromJson(json['S3ResultItem'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final eBSResultItem = this.eBSResultItem;
    final s3ResultItem = this.s3ResultItem;
    return {
      if (eBSResultItem != null) 'EBSResultItem': eBSResultItem,
      if (s3ResultItem != null) 'S3ResultItem': s3ResultItem,
    };
  }
}

/// These are the items returned in the results of a search of Amazon S3 backup
/// metadata.
///
/// @nodoc
class S3ResultItem {
  /// These are items in the returned results that match recovery point Amazon
  /// Resource Names (ARN) input during a search of Amazon S3 backup metadata.
  final String? backupResourceArn;

  /// The name of the backup vault.
  final String? backupVaultName;

  /// These are one or more items in the returned results that match values for
  /// item creation time input during a search of Amazon S3 backup metadata.
  final DateTime? creationTime;

  /// These are one or more items in the returned results that match values for
  /// ETags input during a search of Amazon S3 backup metadata.
  final String? eTag;

  /// This is one or more items returned in the results of a search of Amazon S3
  /// backup metadata that match the values input for object key.
  final String? objectKey;

  /// These are items in the returned results that match values for object size(s)
  /// input during a search of Amazon S3 backup metadata.
  final int? objectSize;

  /// These are items in the returned results that match source Amazon Resource
  /// Names (ARN) input during a search of Amazon S3 backup metadata.
  final String? sourceResourceArn;

  /// These are one or more items in the returned results that match values for
  /// version IDs input during a search of Amazon S3 backup metadata.
  final String? versionId;

  S3ResultItem({
    this.backupResourceArn,
    this.backupVaultName,
    this.creationTime,
    this.eTag,
    this.objectKey,
    this.objectSize,
    this.sourceResourceArn,
    this.versionId,
  });

  factory S3ResultItem.fromJson(Map<String, dynamic> json) {
    return S3ResultItem(
      backupResourceArn: json['BackupResourceArn'] as String?,
      backupVaultName: json['BackupVaultName'] as String?,
      creationTime: timeStampFromJson(json['CreationTime']),
      eTag: json['ETag'] as String?,
      objectKey: json['ObjectKey'] as String?,
      objectSize: json['ObjectSize'] as int?,
      sourceResourceArn: json['SourceResourceArn'] as String?,
      versionId: json['VersionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final backupResourceArn = this.backupResourceArn;
    final backupVaultName = this.backupVaultName;
    final creationTime = this.creationTime;
    final eTag = this.eTag;
    final objectKey = this.objectKey;
    final objectSize = this.objectSize;
    final sourceResourceArn = this.sourceResourceArn;
    final versionId = this.versionId;
    return {
      if (backupResourceArn != null) 'BackupResourceArn': backupResourceArn,
      if (backupVaultName != null) 'BackupVaultName': backupVaultName,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (eTag != null) 'ETag': eTag,
      if (objectKey != null) 'ObjectKey': objectKey,
      if (objectSize != null) 'ObjectSize': objectSize,
      if (sourceResourceArn != null) 'SourceResourceArn': sourceResourceArn,
      if (versionId != null) 'VersionId': versionId,
    };
  }
}

/// These are the items returned in the results of a search of Amazon EBS backup
/// metadata.
///
/// @nodoc
class EBSResultItem {
  /// These are one or more items in the results that match values for the Amazon
  /// Resource Name (ARN) of recovery points returned in a search of Amazon EBS
  /// backup metadata.
  final String? backupResourceArn;

  /// The name of the backup vault.
  final String? backupVaultName;

  /// These are one or more items in the results that match values for creation
  /// times returned in a search of Amazon EBS backup metadata.
  final DateTime? creationTime;

  /// These are one or more items in the results that match values for file paths
  /// returned in a search of Amazon EBS backup metadata.
  final String? filePath;

  /// These are one or more items in the results that match values for file sizes
  /// returned in a search of Amazon EBS backup metadata.
  final int? fileSize;

  /// These are one or more items in the results that match values for file
  /// systems returned in a search of Amazon EBS backup metadata.
  final String? fileSystemIdentifier;

  /// These are one or more items in the results that match values for Last
  /// Modified Time returned in a search of Amazon EBS backup metadata.
  final DateTime? lastModifiedTime;

  /// These are one or more items in the results that match values for the Amazon
  /// Resource Name (ARN) of source resources returned in a search of Amazon EBS
  /// backup metadata.
  final String? sourceResourceArn;

  EBSResultItem({
    this.backupResourceArn,
    this.backupVaultName,
    this.creationTime,
    this.filePath,
    this.fileSize,
    this.fileSystemIdentifier,
    this.lastModifiedTime,
    this.sourceResourceArn,
  });

  factory EBSResultItem.fromJson(Map<String, dynamic> json) {
    return EBSResultItem(
      backupResourceArn: json['BackupResourceArn'] as String?,
      backupVaultName: json['BackupVaultName'] as String?,
      creationTime: timeStampFromJson(json['CreationTime']),
      filePath: json['FilePath'] as String?,
      fileSize: json['FileSize'] as int?,
      fileSystemIdentifier: json['FileSystemIdentifier'] as String?,
      lastModifiedTime: timeStampFromJson(json['LastModifiedTime']),
      sourceResourceArn: json['SourceResourceArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final backupResourceArn = this.backupResourceArn;
    final backupVaultName = this.backupVaultName;
    final creationTime = this.creationTime;
    final filePath = this.filePath;
    final fileSize = this.fileSize;
    final fileSystemIdentifier = this.fileSystemIdentifier;
    final lastModifiedTime = this.lastModifiedTime;
    final sourceResourceArn = this.sourceResourceArn;
    return {
      if (backupResourceArn != null) 'BackupResourceArn': backupResourceArn,
      if (backupVaultName != null) 'BackupVaultName': backupVaultName,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (filePath != null) 'FilePath': filePath,
      if (fileSize != null) 'FileSize': fileSize,
      if (fileSystemIdentifier != null)
        'FileSystemIdentifier': fileSystemIdentifier,
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
      if (sourceResourceArn != null) 'SourceResourceArn': sourceResourceArn,
    };
  }
}

/// This contains the information about recovery points returned in results of a
/// search job.
///
/// @nodoc
class SearchJobBackupsResult {
  /// This is the creation time of the backup (recovery point).
  final DateTime? backupCreationTime;

  /// The Amazon Resource Name (ARN) that uniquely identifies the backup
  /// resources.
  final String? backupResourceArn;

  /// This is the creation time of the backup index.
  final DateTime? indexCreationTime;

  /// This is the resource type of the search.
  final ResourceType? resourceType;

  /// The Amazon Resource Name (ARN) that uniquely identifies the source
  /// resources.
  final String? sourceResourceArn;

  /// This is the status of the search job backup result.
  final SearchJobState? status;

  /// This is the status message included with the results.
  final String? statusMessage;

  SearchJobBackupsResult({
    this.backupCreationTime,
    this.backupResourceArn,
    this.indexCreationTime,
    this.resourceType,
    this.sourceResourceArn,
    this.status,
    this.statusMessage,
  });

  factory SearchJobBackupsResult.fromJson(Map<String, dynamic> json) {
    return SearchJobBackupsResult(
      backupCreationTime: timeStampFromJson(json['BackupCreationTime']),
      backupResourceArn: json['BackupResourceArn'] as String?,
      indexCreationTime: timeStampFromJson(json['IndexCreationTime']),
      resourceType:
          (json['ResourceType'] as String?)?.let(ResourceType.fromString),
      sourceResourceArn: json['SourceResourceArn'] as String?,
      status: (json['Status'] as String?)?.let(SearchJobState.fromString),
      statusMessage: json['StatusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final backupCreationTime = this.backupCreationTime;
    final backupResourceArn = this.backupResourceArn;
    final indexCreationTime = this.indexCreationTime;
    final resourceType = this.resourceType;
    final sourceResourceArn = this.sourceResourceArn;
    final status = this.status;
    final statusMessage = this.statusMessage;
    return {
      if (backupCreationTime != null)
        'BackupCreationTime': unixTimestampToJson(backupCreationTime),
      if (backupResourceArn != null) 'BackupResourceArn': backupResourceArn,
      if (indexCreationTime != null)
        'IndexCreationTime': unixTimestampToJson(indexCreationTime),
      if (resourceType != null) 'ResourceType': resourceType.value,
      if (sourceResourceArn != null) 'SourceResourceArn': sourceResourceArn,
      if (status != null) 'Status': status.value,
      if (statusMessage != null) 'StatusMessage': statusMessage,
    };
  }
}

/// @nodoc
class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
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

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
};
