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

import 'v2023_10_17.endpoints.dart' as _endpoints;
export '../../shared/shared.dart' show AwsClientCredentials;

/// The Amazon SES Mail Manager API contains operations and data types that
/// comprise the Mail Manager feature of <a
/// href="http://aws.amazon.com/ses">Amazon Simple Email Service (SES)</a>.
class MailManager {
  final _s.JsonProtocol _protocol;
  factory MailManager({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
    bool useFipsEndpoint = false,
    bool useDualStackEndpoint = false,
  }) {
    final service = _s.ServiceMetadata(
      endpointPrefix: 'mail-manager',
      signingName: 'ses',
    );
    return MailManager._(
      protocol: _s.JsonProtocol(
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
  MailManager._({
    required _s.JsonProtocol protocol,
  }) : _protocol = protocol;

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

  /// Creates an import job for an address list.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [addressListId] :
  /// The unique identifier of the address list for importing addresses to.
  ///
  /// Parameter [importDataFormat] :
  /// The format of the input for an import job.
  ///
  /// Parameter [name] :
  /// A user-friendly name for the import job.
  ///
  /// Parameter [clientToken] :
  /// A unique token that Amazon SES uses to recognize subsequent retries of the
  /// same request.
  Future<CreateAddressListImportJobResponse> createAddressListImportJob({
    required String addressListId,
    required ImportDataFormat importDataFormat,
    required String name,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.CreateAddressListImportJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AddressListId': addressListId,
        'ImportDataFormat': importDataFormat,
        'Name': name,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      },
    );

    return CreateAddressListImportJobResponse.fromJson(jsonResponse.body);
  }

  /// Removes a member from an address list.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [address] :
  /// The address to be removed from the address list.
  ///
  /// Parameter [addressListId] :
  /// The unique identifier of the address list to remove the address from.
  Future<void> deregisterMemberFromAddressList({
    required String address,
    required String addressListId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.DeregisterMemberFromAddressList'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Address': address,
        'AddressListId': addressListId,
      },
    );
  }

  /// Fetch attributes of an import job.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [jobId] :
  /// The identifier of the import job that needs to be retrieved.
  Future<GetAddressListImportJobResponse> getAddressListImportJob({
    required String jobId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.GetAddressListImportJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'JobId': jobId,
      },
    );

    return GetAddressListImportJobResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the details and current status of a specific email archive
  /// export job.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [exportId] :
  /// The identifier of the export job to get details for.
  Future<GetArchiveExportResponse> getArchiveExport({
    required String exportId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.GetArchiveExport'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ExportId': exportId,
      },
    );

    return GetArchiveExportResponse.fromJson(jsonResponse.body);
  }

  /// Returns a pre-signed URL that provides temporary download access to the
  /// specific email message stored in the archive.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [archivedMessageId] :
  /// The unique identifier of the archived email message.
  Future<GetArchiveMessageResponse> getArchiveMessage({
    required String archivedMessageId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.GetArchiveMessage'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ArchivedMessageId': archivedMessageId,
      },
    );

    return GetArchiveMessageResponse.fromJson(jsonResponse.body);
  }

  /// Returns the textual content of a specific email message stored in the
  /// archive. Attachments are not included.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [archivedMessageId] :
  /// The unique identifier of the archived email message.
  Future<GetArchiveMessageContentResponse> getArchiveMessageContent({
    required String archivedMessageId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.GetArchiveMessageContent'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ArchivedMessageId': archivedMessageId,
      },
    );

    return GetArchiveMessageContentResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the details and current status of a specific email archive
  /// search job.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [searchId] :
  /// The identifier of the search job to get details for.
  Future<GetArchiveSearchResponse> getArchiveSearch({
    required String searchId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.GetArchiveSearch'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SearchId': searchId,
      },
    );

    return GetArchiveSearchResponse.fromJson(jsonResponse.body);
  }

  /// Returns the results of a completed email archive search job.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [searchId] :
  /// The identifier of the completed search job.
  Future<GetArchiveSearchResultsResponse> getArchiveSearchResults({
    required String searchId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.GetArchiveSearchResults'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SearchId': searchId,
      },
    );

    return GetArchiveSearchResultsResponse.fromJson(jsonResponse.body);
  }

  /// Fetch attributes of a member in an address list.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [address] :
  /// The address to be retrieved from the address list.
  ///
  /// Parameter [addressListId] :
  /// The unique identifier of the address list to retrieve the address from.
  Future<GetMemberOfAddressListResponse> getMemberOfAddressList({
    required String address,
    required String addressListId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.GetMemberOfAddressList'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Address': address,
        'AddressListId': addressListId,
      },
    );

    return GetMemberOfAddressListResponse.fromJson(jsonResponse.body);
  }

  /// Lists jobs for an address list.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [addressListId] :
  /// The unique identifier of the address list for listing import jobs.
  ///
  /// Parameter [nextToken] :
  /// If you received a pagination token from a previous call to this API, you
  /// can provide it here to continue paginating through the next page of
  /// results.
  ///
  /// Parameter [pageSize] :
  /// The maximum number of import jobs that are returned per call. You can use
  /// NextToken to retrieve the next page of jobs.
  Future<ListAddressListImportJobsResponse> listAddressListImportJobs({
    required String addressListId,
    String? nextToken,
    int? pageSize,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.ListAddressListImportJobs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AddressListId': addressListId,
        if (nextToken != null) 'NextToken': nextToken,
        if (pageSize != null) 'PageSize': pageSize,
      },
    );

    return ListAddressListImportJobsResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of email archive export jobs.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [archiveId] :
  /// The identifier of the archive.
  ///
  /// Parameter [nextToken] :
  /// If NextToken is returned, there are more results available. The value of
  /// NextToken is a unique pagination token for each page. Make the call again
  /// using the returned token to retrieve the next page.
  ///
  /// Parameter [pageSize] :
  /// The maximum number of archive export jobs that are returned per call. You
  /// can use NextToken to obtain further pages of archives.
  Future<ListArchiveExportsResponse> listArchiveExports({
    required String archiveId,
    String? nextToken,
    int? pageSize,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.ListArchiveExports'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ArchiveId': archiveId,
        if (nextToken != null) 'NextToken': nextToken,
        if (pageSize != null) 'PageSize': pageSize,
      },
    );

    return ListArchiveExportsResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of email archive search jobs.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [archiveId] :
  /// The identifier of the archive.
  ///
  /// Parameter [nextToken] :
  /// If NextToken is returned, there are more results available. The value of
  /// NextToken is a unique pagination token for each page. Make the call again
  /// using the returned token to retrieve the next page.
  ///
  /// Parameter [pageSize] :
  /// The maximum number of archive search jobs that are returned per call. You
  /// can use NextToken to obtain further pages of archives.
  Future<ListArchiveSearchesResponse> listArchiveSearches({
    required String archiveId,
    String? nextToken,
    int? pageSize,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.ListArchiveSearches'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ArchiveId': archiveId,
        if (nextToken != null) 'NextToken': nextToken,
        if (pageSize != null) 'PageSize': pageSize,
      },
    );

    return ListArchiveSearchesResponse.fromJson(jsonResponse.body);
  }

  /// Lists members of an address list.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [addressListId] :
  /// The unique identifier of the address list to list the addresses from.
  ///
  /// Parameter [filter] :
  /// Filter to be used to limit the results.
  ///
  /// Parameter [nextToken] :
  /// If you received a pagination token from a previous call to this API, you
  /// can provide it here to continue paginating through the next page of
  /// results.
  ///
  /// Parameter [pageSize] :
  /// The maximum number of address list members that are returned per call. You
  /// can use NextToken to retrieve the next page of members.
  Future<ListMembersOfAddressListResponse> listMembersOfAddressList({
    required String addressListId,
    AddressFilter? filter,
    String? nextToken,
    int? pageSize,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.ListMembersOfAddressList'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AddressListId': addressListId,
        if (filter != null) 'Filter': filter,
        if (nextToken != null) 'NextToken': nextToken,
        if (pageSize != null) 'PageSize': pageSize,
      },
    );

    return ListMembersOfAddressListResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the list of tags (keys and values) assigned to the resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource to retrieve tags from.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
      },
    );

    return ListTagsForResourceResponse.fromJson(jsonResponse.body);
  }

  /// Adds a member to an address list.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [address] :
  /// The address to be added to the address list.
  ///
  /// Parameter [addressListId] :
  /// The unique identifier of the address list where the address should be
  /// added.
  Future<void> registerMemberToAddressList({
    required String address,
    required String addressListId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.RegisterMemberToAddressList'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Address': address,
        'AddressListId': addressListId,
      },
    );
  }

  /// Starts an import job for an address list.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [jobId] :
  /// The identifier of the import job that needs to be started.
  Future<void> startAddressListImportJob({
    required String jobId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.StartAddressListImportJob'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'JobId': jobId,
      },
    );
  }

  /// Initiates an export of emails from the specified archive.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [archiveId] :
  /// The identifier of the archive to export emails from.
  ///
  /// Parameter [exportDestinationConfiguration] :
  /// Details on where to deliver the exported email data.
  ///
  /// Parameter [fromTimestamp] :
  /// The start of the timestamp range to include emails from.
  ///
  /// Parameter [toTimestamp] :
  /// The end of the timestamp range to include emails from.
  ///
  /// Parameter [filters] :
  /// Criteria to filter which emails are included in the export.
  ///
  /// Parameter [includeMetadata] :
  /// Whether to include message metadata as JSON files in the export.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of email items to include in the export.
  Future<StartArchiveExportResponse> startArchiveExport({
    required String archiveId,
    required ExportDestinationConfiguration exportDestinationConfiguration,
    required DateTime fromTimestamp,
    required DateTime toTimestamp,
    ArchiveFilters? filters,
    bool? includeMetadata,
    int? maxResults,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.StartArchiveExport'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ArchiveId': archiveId,
        'ExportDestinationConfiguration': exportDestinationConfiguration,
        'FromTimestamp': unixTimestampToJson(fromTimestamp),
        'ToTimestamp': unixTimestampToJson(toTimestamp),
        if (filters != null) 'Filters': filters,
        if (includeMetadata != null) 'IncludeMetadata': includeMetadata,
        if (maxResults != null) 'MaxResults': maxResults,
      },
    );

    return StartArchiveExportResponse.fromJson(jsonResponse.body);
  }

  /// Initiates a search across emails in the specified archive.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [archiveId] :
  /// The identifier of the archive to search emails in.
  ///
  /// Parameter [fromTimestamp] :
  /// The start timestamp of the range to search emails from.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of search results to return.
  ///
  /// Parameter [toTimestamp] :
  /// The end timestamp of the range to search emails from.
  ///
  /// Parameter [filters] :
  /// Criteria to filter which emails are included in the search results.
  Future<StartArchiveSearchResponse> startArchiveSearch({
    required String archiveId,
    required DateTime fromTimestamp,
    required int maxResults,
    required DateTime toTimestamp,
    ArchiveFilters? filters,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      1000,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.StartArchiveSearch'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ArchiveId': archiveId,
        'FromTimestamp': unixTimestampToJson(fromTimestamp),
        'MaxResults': maxResults,
        'ToTimestamp': unixTimestampToJson(toTimestamp),
        if (filters != null) 'Filters': filters,
      },
    );

    return StartArchiveSearchResponse.fromJson(jsonResponse.body);
  }

  /// Stops an ongoing import job for an address list.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [jobId] :
  /// The identifier of the import job that needs to be stopped.
  Future<void> stopAddressListImportJob({
    required String jobId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.StopAddressListImportJob'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'JobId': jobId,
      },
    );
  }

  /// Stops an in-progress export of emails from an archive.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [exportId] :
  /// The identifier of the export job to stop.
  Future<void> stopArchiveExport({
    required String exportId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.StopArchiveExport'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ExportId': exportId,
      },
    );
  }

  /// Stops an in-progress archive search job.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [searchId] :
  /// The identifier of the search job to stop.
  Future<void> stopArchiveSearch({
    required String searchId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.StopArchiveSearch'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SearchId': searchId,
      },
    );
  }

  /// Adds one or more tags (keys and values) to a specified resource.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource that you want to tag.
  ///
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for the resource. For
  /// example, { "tags": {"key1":"value1", "key2":"value2"} }.
  Future<void> tagResource({
    required String resourceArn,
    required List<Tag> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.TagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        'Tags': tags,
      },
    );
  }

  /// Remove one or more tags (keys and values) from a specified resource.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource that you want to untag.
  ///
  /// Parameter [tagKeys] :
  /// The keys of the key-value pairs for the tag or tags you want to remove
  /// from the specified resource.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.UntagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        'TagKeys': tagKeys,
      },
    );
  }

  /// Creates an Add On instance for the subscription indicated in the request.
  /// The resulting Amazon Resource Name (ARN) can be used in a conditional
  /// statement for a rule set or traffic policy.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [addonSubscriptionId] :
  /// The unique ID of a previously created subscription that an Add On instance
  /// is created for. You can only have one instance per subscription.
  ///
  /// Parameter [clientToken] :
  /// A unique token that Amazon SES uses to recognize subsequent retries of the
  /// same request.
  ///
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for the resource. For
  /// example, { "tags": {"key1":"value1", "key2":"value2"} }.
  Future<CreateAddonInstanceResponse> createAddonInstance({
    required String addonSubscriptionId,
    String? clientToken,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.CreateAddonInstance'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AddonSubscriptionId': addonSubscriptionId,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateAddonInstanceResponse.fromJson(jsonResponse.body);
  }

  /// Gets detailed information about an Add On instance.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [addonInstanceId] :
  /// The Add On instance ID to retrieve information for.
  Future<GetAddonInstanceResponse> getAddonInstance({
    required String addonInstanceId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.GetAddonInstance'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AddonInstanceId': addonInstanceId,
      },
    );

    return GetAddonInstanceResponse.fromJson(jsonResponse.body);
  }

  /// Deletes an Add On instance.
  ///
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  ///
  /// Parameter [addonInstanceId] :
  /// The Add On instance ID to delete.
  Future<void> deleteAddonInstance({
    required String addonInstanceId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.DeleteAddonInstance'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AddonInstanceId': addonInstanceId,
      },
    );
  }

  /// Lists all Add On instances in your account.
  ///
  /// May throw [ValidationException].
  ///
  /// Parameter [nextToken] :
  /// If you received a pagination token from a previous call to this API, you
  /// can provide it here to continue paginating through the next page of
  /// results.
  ///
  /// Parameter [pageSize] :
  /// The maximum number of ingress endpoint resources that are returned per
  /// call. You can use NextToken to obtain further ingress endpoints.
  Future<ListAddonInstancesResponse> listAddonInstances({
    String? nextToken,
    int? pageSize,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.ListAddonInstances'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (nextToken != null) 'NextToken': nextToken,
        if (pageSize != null) 'PageSize': pageSize,
      },
    );

    return ListAddonInstancesResponse.fromJson(jsonResponse.body);
  }

  /// Creates a subscription for an Add On representing the acceptance of its
  /// terms of use and additional pricing. The subscription can then be used to
  /// create an instance for use in rule sets or traffic policies.
  ///
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [addonName] :
  /// The name of the Add On to subscribe to. You can only have one subscription
  /// for each Add On name.
  ///
  /// Parameter [clientToken] :
  /// A unique token that Amazon SES uses to recognize subsequent retries of the
  /// same request.
  ///
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for the resource. For
  /// example, { "tags": {"key1":"value1", "key2":"value2"} }.
  Future<CreateAddonSubscriptionResponse> createAddonSubscription({
    required String addonName,
    String? clientToken,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.CreateAddonSubscription'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AddonName': addonName,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateAddonSubscriptionResponse.fromJson(jsonResponse.body);
  }

  /// Gets detailed information about an Add On subscription.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [addonSubscriptionId] :
  /// The Add On subscription ID to retrieve information for.
  Future<GetAddonSubscriptionResponse> getAddonSubscription({
    required String addonSubscriptionId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.GetAddonSubscription'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AddonSubscriptionId': addonSubscriptionId,
      },
    );

    return GetAddonSubscriptionResponse.fromJson(jsonResponse.body);
  }

  /// Deletes an Add On subscription.
  ///
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  ///
  /// Parameter [addonSubscriptionId] :
  /// The Add On subscription ID to delete.
  Future<void> deleteAddonSubscription({
    required String addonSubscriptionId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.DeleteAddonSubscription'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AddonSubscriptionId': addonSubscriptionId,
      },
    );
  }

  /// Lists all Add On subscriptions in your account.
  ///
  /// May throw [ValidationException].
  ///
  /// Parameter [nextToken] :
  /// If you received a pagination token from a previous call to this API, you
  /// can provide it here to continue paginating through the next page of
  /// results.
  ///
  /// Parameter [pageSize] :
  /// The maximum number of ingress endpoint resources that are returned per
  /// call. You can use NextToken to obtain further ingress endpoints.
  Future<ListAddonSubscriptionsResponse> listAddonSubscriptions({
    String? nextToken,
    int? pageSize,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.ListAddonSubscriptions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (nextToken != null) 'NextToken': nextToken,
        if (pageSize != null) 'PageSize': pageSize,
      },
    );

    return ListAddonSubscriptionsResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new address list.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [addressListName] :
  /// A user-friendly name for the address list.
  ///
  /// Parameter [clientToken] :
  /// A unique token that Amazon SES uses to recognize subsequent retries of the
  /// same request.
  ///
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for the resource. For
  /// example, { "tags": {"key1":"value1", "key2":"value2"} }.
  Future<CreateAddressListResponse> createAddressList({
    required String addressListName,
    String? clientToken,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.CreateAddressList'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AddressListName': addressListName,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateAddressListResponse.fromJson(jsonResponse.body);
  }

  /// Fetch attributes of an address list.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [addressListId] :
  /// The identifier of an existing address list resource to be retrieved.
  Future<GetAddressListResponse> getAddressList({
    required String addressListId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.GetAddressList'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AddressListId': addressListId,
      },
    );

    return GetAddressListResponse.fromJson(jsonResponse.body);
  }

  /// Deletes an address list.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [addressListId] :
  /// The identifier of an existing address list resource to delete.
  Future<void> deleteAddressList({
    required String addressListId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.DeleteAddressList'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AddressListId': addressListId,
      },
    );
  }

  /// Lists address lists for this account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [nextToken] :
  /// If you received a pagination token from a previous call to this API, you
  /// can provide it here to continue paginating through the next page of
  /// results.
  ///
  /// Parameter [pageSize] :
  /// The maximum number of address list resources that are returned per call.
  /// You can use NextToken to retrieve the next page of address lists.
  Future<ListAddressListsResponse> listAddressLists({
    String? nextToken,
    int? pageSize,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.ListAddressLists'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (nextToken != null) 'NextToken': nextToken,
        if (pageSize != null) 'PageSize': pageSize,
      },
    );

    return ListAddressListsResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new email archive resource for storing and retaining emails.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [archiveName] :
  /// A unique name for the new archive.
  ///
  /// Parameter [clientToken] :
  /// A unique token Amazon SES uses to recognize retries of this request.
  ///
  /// Parameter [kmsKeyArn] :
  /// The Amazon Resource Name (ARN) of the KMS key for encrypting emails in the
  /// archive.
  ///
  /// Parameter [retention] :
  /// The period for retaining emails in the archive before automatic deletion.
  ///
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for the resource. For
  /// example, { "tags": {"key1":"value1", "key2":"value2"} }.
  Future<CreateArchiveResponse> createArchive({
    required String archiveName,
    String? clientToken,
    String? kmsKeyArn,
    ArchiveRetention? retention,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.CreateArchive'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ArchiveName': archiveName,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (kmsKeyArn != null) 'KmsKeyArn': kmsKeyArn,
        if (retention != null) 'Retention': retention,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateArchiveResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the full details and current state of a specified email archive.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [archiveId] :
  /// The identifier of the archive to retrieve.
  Future<GetArchiveResponse> getArchive({
    required String archiveId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.GetArchive'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ArchiveId': archiveId,
      },
    );

    return GetArchiveResponse.fromJson(jsonResponse.body);
  }

  /// Updates the attributes of an existing email archive.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [archiveId] :
  /// The identifier of the archive to update.
  ///
  /// Parameter [archiveName] :
  /// A new, unique name for the archive.
  ///
  /// Parameter [retention] :
  /// A new retention period for emails in the archive.
  Future<void> updateArchive({
    required String archiveId,
    String? archiveName,
    ArchiveRetention? retention,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.UpdateArchive'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ArchiveId': archiveId,
        if (archiveName != null) 'ArchiveName': archiveName,
        if (retention != null) 'Retention': retention,
      },
    );
  }

  /// Initiates deletion of an email archive. This changes the archive state to
  /// pending deletion. In this state, no new emails can be added, and existing
  /// archived emails become inaccessible (search, export, download). The
  /// archive and all of its contents will be permanently deleted 30 days after
  /// entering the pending deletion state, regardless of the configured
  /// retention period.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [archiveId] :
  /// The identifier of the archive to delete.
  Future<void> deleteArchive({
    required String archiveId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.DeleteArchive'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ArchiveId': archiveId,
      },
    );
  }

  /// Returns a list of all email archives in your account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [nextToken] :
  /// If NextToken is returned, there are more results available. The value of
  /// NextToken is a unique pagination token for each page. Make the call again
  /// using the returned token to retrieve the next page.
  ///
  /// Parameter [pageSize] :
  /// The maximum number of archives that are returned per call. You can use
  /// NextToken to obtain further pages of archives.
  Future<ListArchivesResponse> listArchives({
    String? nextToken,
    int? pageSize,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.ListArchives'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (nextToken != null) 'NextToken': nextToken,
        if (pageSize != null) 'PageSize': pageSize,
      },
    );

    return ListArchivesResponse.fromJson(jsonResponse.body);
  }

  /// Provision a new ingress endpoint resource.
  ///
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [ingressPointName] :
  /// A user friendly name for an ingress endpoint resource.
  ///
  /// Parameter [ruleSetId] :
  /// The identifier of an existing rule set that you attach to an ingress
  /// endpoint resource.
  ///
  /// Parameter [trafficPolicyId] :
  /// The identifier of an existing traffic policy that you attach to an ingress
  /// endpoint resource.
  ///
  /// Parameter [type] :
  /// The type of the ingress endpoint to create.
  ///
  /// Parameter [clientToken] :
  /// A unique token that Amazon SES uses to recognize subsequent retries of the
  /// same request.
  ///
  /// Parameter [ingressPointConfiguration] :
  /// If you choose an Authenticated ingress endpoint, you must configure either
  /// an SMTP password or a secret ARN.
  ///
  /// Parameter [networkConfiguration] :
  /// Specifies the network configuration for the ingress point. This allows you
  /// to create an IPv4-only, Dual-Stack, or PrivateLink type of ingress point.
  /// If not specified, the default network type is IPv4-only.
  ///
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for the resource. For
  /// example, { "tags": {"key1":"value1", "key2":"value2"} }.
  ///
  /// Parameter [tlsPolicy] :
  /// The Transport Layer Security (TLS) policy for the ingress point. The FIPS
  /// value is only valid in US and Canada regions.
  Future<CreateIngressPointResponse> createIngressPoint({
    required String ingressPointName,
    required String ruleSetId,
    required String trafficPolicyId,
    required IngressPointType type,
    String? clientToken,
    IngressPointConfiguration? ingressPointConfiguration,
    NetworkConfiguration? networkConfiguration,
    List<Tag>? tags,
    TlsPolicy? tlsPolicy,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.CreateIngressPoint'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'IngressPointName': ingressPointName,
        'RuleSetId': ruleSetId,
        'TrafficPolicyId': trafficPolicyId,
        'Type': type.value,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (ingressPointConfiguration != null)
          'IngressPointConfiguration': ingressPointConfiguration,
        if (networkConfiguration != null)
          'NetworkConfiguration': networkConfiguration,
        if (tags != null) 'Tags': tags,
        if (tlsPolicy != null) 'TlsPolicy': tlsPolicy.value,
      },
    );

    return CreateIngressPointResponse.fromJson(jsonResponse.body);
  }

  /// Fetch ingress endpoint resource attributes.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [ingressPointId] :
  /// The identifier of an ingress endpoint.
  ///
  /// Parameter [includeTrustStoreContents] :
  /// Whether to include the trust store contents in the response. Use INCLUDE
  /// to retrieve trust store certificate and CRL contents.
  Future<GetIngressPointResponse> getIngressPoint({
    required String ingressPointId,
    TrustStoreResponseOption? includeTrustStoreContents,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.GetIngressPoint'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'IngressPointId': ingressPointId,
        if (includeTrustStoreContents != null)
          'IncludeTrustStoreContents': includeTrustStoreContents.value,
      },
    );

    return GetIngressPointResponse.fromJson(jsonResponse.body);
  }

  /// Update attributes of a provisioned ingress endpoint resource.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [ingressPointId] :
  /// The identifier for the ingress endpoint you want to update.
  ///
  /// Parameter [ingressPointConfiguration] :
  /// If you choose an Authenticated ingress endpoint, you must configure either
  /// an SMTP password or a secret ARN.
  ///
  /// Parameter [ingressPointName] :
  /// A user friendly name for the ingress endpoint resource.
  ///
  /// Parameter [ruleSetId] :
  /// The identifier of an existing rule set that you attach to an ingress
  /// endpoint resource.
  ///
  /// Parameter [statusToUpdate] :
  /// The update status of an ingress endpoint.
  ///
  /// Parameter [tlsPolicy] :
  /// The Transport Layer Security (TLS) policy for the ingress point. Valid
  /// values are REQUIRED, OPTIONAL. Only ingress endpoints using REQUIRED or
  /// OPTIONAL as TlsPolicy can be updated.
  ///
  /// Parameter [trafficPolicyId] :
  /// The identifier of an existing traffic policy that you attach to an ingress
  /// endpoint resource.
  Future<void> updateIngressPoint({
    required String ingressPointId,
    IngressPointConfiguration? ingressPointConfiguration,
    String? ingressPointName,
    String? ruleSetId,
    IngressPointStatusToUpdate? statusToUpdate,
    TlsPolicy? tlsPolicy,
    String? trafficPolicyId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.UpdateIngressPoint'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'IngressPointId': ingressPointId,
        if (ingressPointConfiguration != null)
          'IngressPointConfiguration': ingressPointConfiguration,
        if (ingressPointName != null) 'IngressPointName': ingressPointName,
        if (ruleSetId != null) 'RuleSetId': ruleSetId,
        if (statusToUpdate != null) 'StatusToUpdate': statusToUpdate.value,
        if (tlsPolicy != null) 'TlsPolicy': tlsPolicy.value,
        if (trafficPolicyId != null) 'TrafficPolicyId': trafficPolicyId,
      },
    );
  }

  /// Delete an ingress endpoint resource.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [ingressPointId] :
  /// The identifier of the ingress endpoint resource that you want to delete.
  Future<void> deleteIngressPoint({
    required String ingressPointId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.DeleteIngressPoint'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'IngressPointId': ingressPointId,
      },
    );
  }

  /// List all ingress endpoint resources.
  ///
  /// May throw [ValidationException].
  ///
  /// Parameter [nextToken] :
  /// If you received a pagination token from a previous call to this API, you
  /// can provide it here to continue paginating through the next page of
  /// results.
  ///
  /// Parameter [pageSize] :
  /// The maximum number of ingress endpoint resources that are returned per
  /// call. You can use NextToken to obtain further ingress endpoints.
  Future<ListIngressPointsResponse> listIngressPoints({
    String? nextToken,
    int? pageSize,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.ListIngressPoints'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (nextToken != null) 'NextToken': nextToken,
        if (pageSize != null) 'PageSize': pageSize,
      },
    );

    return ListIngressPointsResponse.fromJson(jsonResponse.body);
  }

  /// Creates a relay resource which can be used in rules to relay incoming
  /// emails to defined relay destinations.
  ///
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [authentication] :
  /// Authentication for the relay destination server—specify the secretARN
  /// where the SMTP credentials are stored.
  ///
  /// Parameter [relayName] :
  /// The unique name of the relay resource.
  ///
  /// Parameter [serverName] :
  /// The destination relay server address.
  ///
  /// Parameter [serverPort] :
  /// The destination relay server port.
  ///
  /// Parameter [clientToken] :
  /// A unique token that Amazon SES uses to recognize subsequent retries of the
  /// same request.
  ///
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for the resource. For
  /// example, { "tags": {"key1":"value1", "key2":"value2"} }.
  Future<CreateRelayResponse> createRelay({
    required RelayAuthentication authentication,
    required String relayName,
    required String serverName,
    required int serverPort,
    String? clientToken,
    List<Tag>? tags,
  }) async {
    _s.validateNumRange(
      'serverPort',
      serverPort,
      1,
      65535,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.CreateRelay'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Authentication': authentication,
        'RelayName': relayName,
        'ServerName': serverName,
        'ServerPort': serverPort,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateRelayResponse.fromJson(jsonResponse.body);
  }

  /// Fetch the relay resource and it's attributes.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [relayId] :
  /// A unique relay identifier.
  Future<GetRelayResponse> getRelay({
    required String relayId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.GetRelay'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RelayId': relayId,
      },
    );

    return GetRelayResponse.fromJson(jsonResponse.body);
  }

  /// Updates the attributes of an existing relay resource.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [relayId] :
  /// The unique relay identifier.
  ///
  /// Parameter [authentication] :
  /// Authentication for the relay destination server—specify the secretARN
  /// where the SMTP credentials are stored.
  ///
  /// Parameter [relayName] :
  /// The name of the relay resource.
  ///
  /// Parameter [serverName] :
  /// The destination relay server address.
  ///
  /// Parameter [serverPort] :
  /// The destination relay server port.
  Future<void> updateRelay({
    required String relayId,
    RelayAuthentication? authentication,
    String? relayName,
    String? serverName,
    int? serverPort,
  }) async {
    _s.validateNumRange(
      'serverPort',
      serverPort,
      1,
      65535,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.UpdateRelay'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RelayId': relayId,
        if (authentication != null) 'Authentication': authentication,
        if (relayName != null) 'RelayName': relayName,
        if (serverName != null) 'ServerName': serverName,
        if (serverPort != null) 'ServerPort': serverPort,
      },
    );
  }

  /// Deletes an existing relay resource.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [relayId] :
  /// The unique relay identifier.
  Future<void> deleteRelay({
    required String relayId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.DeleteRelay'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RelayId': relayId,
      },
    );
  }

  /// Lists all the existing relay resources.
  ///
  /// May throw [ValidationException].
  ///
  /// Parameter [nextToken] :
  /// If you received a pagination token from a previous call to this API, you
  /// can provide it here to continue paginating through the next page of
  /// results.
  ///
  /// Parameter [pageSize] :
  /// The number of relays to be returned in one request.
  Future<ListRelaysResponse> listRelays({
    String? nextToken,
    int? pageSize,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.ListRelays'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (nextToken != null) 'NextToken': nextToken,
        if (pageSize != null) 'PageSize': pageSize,
      },
    );

    return ListRelaysResponse.fromJson(jsonResponse.body);
  }

  /// Provision a new rule set.
  ///
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [ruleSetName] :
  /// A user-friendly name for the rule set.
  ///
  /// Parameter [rules] :
  /// Conditional rules that are evaluated for determining actions on email.
  ///
  /// Parameter [clientToken] :
  /// A unique token that Amazon SES uses to recognize subsequent retries of the
  /// same request.
  ///
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for the resource. For
  /// example, { "tags": {"key1":"value1", "key2":"value2"} }.
  Future<CreateRuleSetResponse> createRuleSet({
    required String ruleSetName,
    required List<Rule> rules,
    String? clientToken,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.CreateRuleSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RuleSetName': ruleSetName,
        'Rules': rules,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateRuleSetResponse.fromJson(jsonResponse.body);
  }

  /// Fetch attributes of a rule set.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [ruleSetId] :
  /// The identifier of an existing rule set to be retrieved.
  Future<GetRuleSetResponse> getRuleSet({
    required String ruleSetId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.GetRuleSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RuleSetId': ruleSetId,
      },
    );

    return GetRuleSetResponse.fromJson(jsonResponse.body);
  }

  /// Update attributes of an already provisioned rule set.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [ruleSetId] :
  /// The identifier of a rule set you want to update.
  ///
  /// Parameter [ruleSetName] :
  /// A user-friendly name for the rule set resource.
  ///
  /// Parameter [rules] :
  /// A new set of rules to replace the current rules of the rule set—these
  /// rules will override all the rules of the rule set.
  Future<void> updateRuleSet({
    required String ruleSetId,
    String? ruleSetName,
    List<Rule>? rules,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.UpdateRuleSet'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RuleSetId': ruleSetId,
        if (ruleSetName != null) 'RuleSetName': ruleSetName,
        if (rules != null) 'Rules': rules,
      },
    );
  }

  /// Delete a rule set.
  ///
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  ///
  /// Parameter [ruleSetId] :
  /// The identifier of an existing rule set resource to delete.
  Future<void> deleteRuleSet({
    required String ruleSetId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.DeleteRuleSet'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RuleSetId': ruleSetId,
      },
    );
  }

  /// List rule sets for this account.
  ///
  /// May throw [ValidationException].
  ///
  /// Parameter [nextToken] :
  /// If you received a pagination token from a previous call to this API, you
  /// can provide it here to continue paginating through the next page of
  /// results.
  ///
  /// Parameter [pageSize] :
  /// The maximum number of rule set resources that are returned per call. You
  /// can use NextToken to obtain further rule sets.
  Future<ListRuleSetsResponse> listRuleSets({
    String? nextToken,
    int? pageSize,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.ListRuleSets'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (nextToken != null) 'NextToken': nextToken,
        if (pageSize != null) 'PageSize': pageSize,
      },
    );

    return ListRuleSetsResponse.fromJson(jsonResponse.body);
  }

  /// Provision a new traffic policy resource.
  ///
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [defaultAction] :
  /// Default action instructs the traﬃc policy to either Allow or Deny (block)
  /// messages that fall outside of (or not addressed by) the conditions of your
  /// policy statements
  ///
  /// Parameter [policyStatements] :
  /// Conditional statements for filtering email traffic.
  ///
  /// Parameter [trafficPolicyName] :
  /// A user-friendly name for the traffic policy resource.
  ///
  /// Parameter [clientToken] :
  /// A unique token that Amazon SES uses to recognize subsequent retries of the
  /// same request.
  ///
  /// Parameter [maxMessageSizeBytes] :
  /// The maximum message size in bytes of email which is allowed in by this
  /// traffic policy—anything larger will be blocked.
  ///
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for the resource. For
  /// example, { "tags": {"key1":"value1", "key2":"value2"} }.
  Future<CreateTrafficPolicyResponse> createTrafficPolicy({
    required AcceptAction defaultAction,
    required List<PolicyStatement> policyStatements,
    required String trafficPolicyName,
    String? clientToken,
    int? maxMessageSizeBytes,
    List<Tag>? tags,
  }) async {
    _s.validateNumRange(
      'maxMessageSizeBytes',
      maxMessageSizeBytes,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.CreateTrafficPolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DefaultAction': defaultAction.value,
        'PolicyStatements': policyStatements,
        'TrafficPolicyName': trafficPolicyName,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (maxMessageSizeBytes != null)
          'MaxMessageSizeBytes': maxMessageSizeBytes,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateTrafficPolicyResponse.fromJson(jsonResponse.body);
  }

  /// Fetch attributes of a traffic policy resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [trafficPolicyId] :
  /// The identifier of the traffic policy resource.
  Future<GetTrafficPolicyResponse> getTrafficPolicy({
    required String trafficPolicyId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.GetTrafficPolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TrafficPolicyId': trafficPolicyId,
      },
    );

    return GetTrafficPolicyResponse.fromJson(jsonResponse.body);
  }

  /// Update attributes of an already provisioned traffic policy resource.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [trafficPolicyId] :
  /// The identifier of the traffic policy that you want to update.
  ///
  /// Parameter [defaultAction] :
  /// Default action instructs the traﬃc policy to either Allow or Deny (block)
  /// messages that fall outside of (or not addressed by) the conditions of your
  /// policy statements
  ///
  /// Parameter [maxMessageSizeBytes] :
  /// The maximum message size in bytes of email which is allowed in by this
  /// traffic policy—anything larger will be blocked.
  ///
  /// Parameter [policyStatements] :
  /// The list of conditions to be updated for filtering email traffic.
  ///
  /// Parameter [trafficPolicyName] :
  /// A user-friendly name for the traffic policy resource.
  Future<void> updateTrafficPolicy({
    required String trafficPolicyId,
    AcceptAction? defaultAction,
    int? maxMessageSizeBytes,
    List<PolicyStatement>? policyStatements,
    String? trafficPolicyName,
  }) async {
    _s.validateNumRange(
      'maxMessageSizeBytes',
      maxMessageSizeBytes,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.UpdateTrafficPolicy'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TrafficPolicyId': trafficPolicyId,
        if (defaultAction != null) 'DefaultAction': defaultAction.value,
        if (maxMessageSizeBytes != null)
          'MaxMessageSizeBytes': maxMessageSizeBytes,
        if (policyStatements != null) 'PolicyStatements': policyStatements,
        if (trafficPolicyName != null) 'TrafficPolicyName': trafficPolicyName,
      },
    );
  }

  /// Delete a traffic policy resource.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [trafficPolicyId] :
  /// The identifier of the traffic policy that you want to delete.
  Future<void> deleteTrafficPolicy({
    required String trafficPolicyId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.DeleteTrafficPolicy'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TrafficPolicyId': trafficPolicyId,
      },
    );
  }

  /// List traffic policy resources.
  ///
  /// May throw [ValidationException].
  ///
  /// Parameter [nextToken] :
  /// If you received a pagination token from a previous call to this API, you
  /// can provide it here to continue paginating through the next page of
  /// results.
  ///
  /// Parameter [pageSize] :
  /// The maximum number of traffic policy resources that are returned per call.
  /// You can use NextToken to obtain further traffic policies.
  Future<ListTrafficPoliciesResponse> listTrafficPolicies({
    String? nextToken,
    int? pageSize,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.ListTrafficPolicies'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (nextToken != null) 'NextToken': nextToken,
        if (pageSize != null) 'PageSize': pageSize,
      },
    );

    return ListTrafficPoliciesResponse.fromJson(jsonResponse.body);
  }
}

/// @nodoc
class CreateAddressListImportJobResponse {
  /// The identifier of the created import job.
  final String jobId;

  /// The pre-signed URL target for uploading the input file.
  final String preSignedUrl;

  CreateAddressListImportJobResponse({
    required this.jobId,
    required this.preSignedUrl,
  });

  factory CreateAddressListImportJobResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateAddressListImportJobResponse(
      jobId: (json['JobId'] as String?) ?? '',
      preSignedUrl: (json['PreSignedUrl'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    final preSignedUrl = this.preSignedUrl;
    return {
      'JobId': jobId,
      'PreSignedUrl': preSignedUrl,
    };
  }
}

/// @nodoc
class DeregisterMemberFromAddressListResponse {
  DeregisterMemberFromAddressListResponse();

  factory DeregisterMemberFromAddressListResponse.fromJson(
      Map<String, dynamic> _) {
    return DeregisterMemberFromAddressListResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class GetAddressListImportJobResponse {
  /// The unique identifier of the address list the import job was created for.
  final String addressListId;

  /// The timestamp of when the import job was created.
  final DateTime createdTimestamp;

  /// The format of the input for an import job.
  final ImportDataFormat importDataFormat;

  /// The identifier of the import job.
  final String jobId;

  /// A user-friendly name for the import job.
  final String name;

  /// The pre-signed URL target for uploading the input file.
  final String preSignedUrl;

  /// The status of the import job.
  final ImportJobStatus status;

  /// The timestamp of when the import job was completed.
  final DateTime? completedTimestamp;

  /// The reason for failure of an import job.
  final String? error;

  /// The number of input addresses that failed to be imported into the address
  /// list.
  final int? failedItemsCount;

  /// The number of input addresses successfully imported into the address list.
  final int? importedItemsCount;

  /// The timestamp of when the import job was started.
  final DateTime? startTimestamp;

  GetAddressListImportJobResponse({
    required this.addressListId,
    required this.createdTimestamp,
    required this.importDataFormat,
    required this.jobId,
    required this.name,
    required this.preSignedUrl,
    required this.status,
    this.completedTimestamp,
    this.error,
    this.failedItemsCount,
    this.importedItemsCount,
    this.startTimestamp,
  });

  factory GetAddressListImportJobResponse.fromJson(Map<String, dynamic> json) {
    return GetAddressListImportJobResponse(
      addressListId: (json['AddressListId'] as String?) ?? '',
      createdTimestamp:
          nonNullableTimeStampFromJson(json['CreatedTimestamp'] ?? 0),
      importDataFormat: ImportDataFormat.fromJson(
          (json['ImportDataFormat'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      jobId: (json['JobId'] as String?) ?? '',
      name: (json['Name'] as String?) ?? '',
      preSignedUrl: (json['PreSignedUrl'] as String?) ?? '',
      status: ImportJobStatus.fromString((json['Status'] as String?) ?? ''),
      completedTimestamp: timeStampFromJson(json['CompletedTimestamp']),
      error: json['Error'] as String?,
      failedItemsCount: json['FailedItemsCount'] as int?,
      importedItemsCount: json['ImportedItemsCount'] as int?,
      startTimestamp: timeStampFromJson(json['StartTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final addressListId = this.addressListId;
    final createdTimestamp = this.createdTimestamp;
    final importDataFormat = this.importDataFormat;
    final jobId = this.jobId;
    final name = this.name;
    final preSignedUrl = this.preSignedUrl;
    final status = this.status;
    final completedTimestamp = this.completedTimestamp;
    final error = this.error;
    final failedItemsCount = this.failedItemsCount;
    final importedItemsCount = this.importedItemsCount;
    final startTimestamp = this.startTimestamp;
    return {
      'AddressListId': addressListId,
      'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      'ImportDataFormat': importDataFormat,
      'JobId': jobId,
      'Name': name,
      'PreSignedUrl': preSignedUrl,
      'Status': status.value,
      if (completedTimestamp != null)
        'CompletedTimestamp': unixTimestampToJson(completedTimestamp),
      if (error != null) 'Error': error,
      if (failedItemsCount != null) 'FailedItemsCount': failedItemsCount,
      if (importedItemsCount != null) 'ImportedItemsCount': importedItemsCount,
      if (startTimestamp != null)
        'StartTimestamp': unixTimestampToJson(startTimestamp),
    };
  }
}

/// The response containing details of the specified archive export job.
///
/// @nodoc
class GetArchiveExportResponse {
  /// The identifier of the archive the email export was performed from.
  final String? archiveId;

  /// Where the exported emails are being delivered.
  final ExportDestinationConfiguration? exportDestinationConfiguration;

  /// The criteria used to filter emails included in the export.
  final ArchiveFilters? filters;

  /// The start of the timestamp range the exported emails cover.
  final DateTime? fromTimestamp;

  /// The maximum number of email items included in the export.
  final int? maxResults;

  /// The current status of the export job.
  final ExportStatus? status;

  /// The end of the date range the exported emails cover.
  final DateTime? toTimestamp;

  GetArchiveExportResponse({
    this.archiveId,
    this.exportDestinationConfiguration,
    this.filters,
    this.fromTimestamp,
    this.maxResults,
    this.status,
    this.toTimestamp,
  });

  factory GetArchiveExportResponse.fromJson(Map<String, dynamic> json) {
    return GetArchiveExportResponse(
      archiveId: json['ArchiveId'] as String?,
      exportDestinationConfiguration: json['ExportDestinationConfiguration'] !=
              null
          ? ExportDestinationConfiguration.fromJson(
              json['ExportDestinationConfiguration'] as Map<String, dynamic>)
          : null,
      filters: json['Filters'] != null
          ? ArchiveFilters.fromJson(json['Filters'] as Map<String, dynamic>)
          : null,
      fromTimestamp: timeStampFromJson(json['FromTimestamp']),
      maxResults: json['MaxResults'] as int?,
      status: json['Status'] != null
          ? ExportStatus.fromJson(json['Status'] as Map<String, dynamic>)
          : null,
      toTimestamp: timeStampFromJson(json['ToTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final archiveId = this.archiveId;
    final exportDestinationConfiguration = this.exportDestinationConfiguration;
    final filters = this.filters;
    final fromTimestamp = this.fromTimestamp;
    final maxResults = this.maxResults;
    final status = this.status;
    final toTimestamp = this.toTimestamp;
    return {
      if (archiveId != null) 'ArchiveId': archiveId,
      if (exportDestinationConfiguration != null)
        'ExportDestinationConfiguration': exportDestinationConfiguration,
      if (filters != null) 'Filters': filters,
      if (fromTimestamp != null)
        'FromTimestamp': unixTimestampToJson(fromTimestamp),
      if (maxResults != null) 'MaxResults': maxResults,
      if (status != null) 'Status': status,
      if (toTimestamp != null) 'ToTimestamp': unixTimestampToJson(toTimestamp),
    };
  }
}

/// The response containing details about the requested archived email message.
///
/// @nodoc
class GetArchiveMessageResponse {
  /// The SMTP envelope information of the email.
  final Envelope? envelope;

  /// A pre-signed URL to temporarily download the full message content.
  final String? messageDownloadLink;

  /// The metadata about the email.
  final Metadata? metadata;

  GetArchiveMessageResponse({
    this.envelope,
    this.messageDownloadLink,
    this.metadata,
  });

  factory GetArchiveMessageResponse.fromJson(Map<String, dynamic> json) {
    return GetArchiveMessageResponse(
      envelope: json['Envelope'] != null
          ? Envelope.fromJson(json['Envelope'] as Map<String, dynamic>)
          : null,
      messageDownloadLink: json['MessageDownloadLink'] as String?,
      metadata: json['Metadata'] != null
          ? Metadata.fromJson(json['Metadata'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final envelope = this.envelope;
    final messageDownloadLink = this.messageDownloadLink;
    final metadata = this.metadata;
    return {
      if (envelope != null) 'Envelope': envelope,
      if (messageDownloadLink != null)
        'MessageDownloadLink': messageDownloadLink,
      if (metadata != null) 'Metadata': metadata,
    };
  }
}

/// The response containing the textual content of the requested archived email
/// message.
///
/// @nodoc
class GetArchiveMessageContentResponse {
  /// The textual body content of the email message.
  final MessageBody? body;

  GetArchiveMessageContentResponse({
    this.body,
  });

  factory GetArchiveMessageContentResponse.fromJson(Map<String, dynamic> json) {
    return GetArchiveMessageContentResponse(
      body: json['Body'] != null
          ? MessageBody.fromJson(json['Body'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final body = this.body;
    return {
      if (body != null) 'Body': body,
    };
  }
}

/// The response containing details of the specified archive search job.
///
/// @nodoc
class GetArchiveSearchResponse {
  /// The identifier of the archive the email search was performed in.
  final String? archiveId;

  /// The criteria used to filter emails included in the search.
  final ArchiveFilters? filters;

  /// The start timestamp of the range the searched emails cover.
  final DateTime? fromTimestamp;

  /// The maximum number of search results to return.
  final int? maxResults;

  /// The current status of the search job.
  final SearchStatus? status;

  /// The end timestamp of the range the searched emails cover.
  final DateTime? toTimestamp;

  GetArchiveSearchResponse({
    this.archiveId,
    this.filters,
    this.fromTimestamp,
    this.maxResults,
    this.status,
    this.toTimestamp,
  });

  factory GetArchiveSearchResponse.fromJson(Map<String, dynamic> json) {
    return GetArchiveSearchResponse(
      archiveId: json['ArchiveId'] as String?,
      filters: json['Filters'] != null
          ? ArchiveFilters.fromJson(json['Filters'] as Map<String, dynamic>)
          : null,
      fromTimestamp: timeStampFromJson(json['FromTimestamp']),
      maxResults: json['MaxResults'] as int?,
      status: json['Status'] != null
          ? SearchStatus.fromJson(json['Status'] as Map<String, dynamic>)
          : null,
      toTimestamp: timeStampFromJson(json['ToTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final archiveId = this.archiveId;
    final filters = this.filters;
    final fromTimestamp = this.fromTimestamp;
    final maxResults = this.maxResults;
    final status = this.status;
    final toTimestamp = this.toTimestamp;
    return {
      if (archiveId != null) 'ArchiveId': archiveId,
      if (filters != null) 'Filters': filters,
      if (fromTimestamp != null)
        'FromTimestamp': unixTimestampToJson(fromTimestamp),
      if (maxResults != null) 'MaxResults': maxResults,
      if (status != null) 'Status': status,
      if (toTimestamp != null) 'ToTimestamp': unixTimestampToJson(toTimestamp),
    };
  }
}

/// The response containing search results from a completed archive search.
///
/// @nodoc
class GetArchiveSearchResultsResponse {
  /// The list of email result objects matching the search criteria.
  final List<Row>? rows;

  GetArchiveSearchResultsResponse({
    this.rows,
  });

  factory GetArchiveSearchResultsResponse.fromJson(Map<String, dynamic> json) {
    return GetArchiveSearchResultsResponse(
      rows: (json['Rows'] as List?)
          ?.nonNulls
          .map((e) => Row.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final rows = this.rows;
    return {
      if (rows != null) 'Rows': rows,
    };
  }
}

/// @nodoc
class GetMemberOfAddressListResponse {
  /// The address retrieved from the address list.
  final String address;

  /// The timestamp of when the address was created.
  final DateTime createdTimestamp;

  GetMemberOfAddressListResponse({
    required this.address,
    required this.createdTimestamp,
  });

  factory GetMemberOfAddressListResponse.fromJson(Map<String, dynamic> json) {
    return GetMemberOfAddressListResponse(
      address: (json['Address'] as String?) ?? '',
      createdTimestamp:
          nonNullableTimeStampFromJson(json['CreatedTimestamp'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final address = this.address;
    final createdTimestamp = this.createdTimestamp;
    return {
      'Address': address,
      'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
    };
  }
}

/// @nodoc
class ListAddressListImportJobsResponse {
  /// The list of import jobs.
  final List<ImportJob> importJobs;

  /// If NextToken is returned, there are more results available. The value of
  /// NextToken is a unique pagination token for each page. Make the call again
  /// using the returned token to retrieve the next page.
  final String? nextToken;

  ListAddressListImportJobsResponse({
    required this.importJobs,
    this.nextToken,
  });

  factory ListAddressListImportJobsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListAddressListImportJobsResponse(
      importJobs: ((json['ImportJobs'] as List?) ?? const [])
          .nonNulls
          .map((e) => ImportJob.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final importJobs = this.importJobs;
    final nextToken = this.nextToken;
    return {
      'ImportJobs': importJobs,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// The response containing a list of archive export jobs and their statuses.
///
/// @nodoc
class ListArchiveExportsResponse {
  /// The list of export job identifiers and statuses.
  final List<ExportSummary>? exports;

  /// If present, use to retrieve the next page of results.
  final String? nextToken;

  ListArchiveExportsResponse({
    this.exports,
    this.nextToken,
  });

  factory ListArchiveExportsResponse.fromJson(Map<String, dynamic> json) {
    return ListArchiveExportsResponse(
      exports: (json['Exports'] as List?)
          ?.nonNulls
          .map((e) => ExportSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final exports = this.exports;
    final nextToken = this.nextToken;
    return {
      if (exports != null) 'Exports': exports,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// The response containing a list of archive search jobs and their statuses.
///
/// @nodoc
class ListArchiveSearchesResponse {
  /// If present, use to retrieve the next page of results.
  final String? nextToken;

  /// The list of search job identifiers and statuses.
  final List<SearchSummary>? searches;

  ListArchiveSearchesResponse({
    this.nextToken,
    this.searches,
  });

  factory ListArchiveSearchesResponse.fromJson(Map<String, dynamic> json) {
    return ListArchiveSearchesResponse(
      nextToken: json['NextToken'] as String?,
      searches: (json['Searches'] as List?)
          ?.nonNulls
          .map((e) => SearchSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final searches = this.searches;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (searches != null) 'Searches': searches,
    };
  }
}

/// @nodoc
class ListMembersOfAddressListResponse {
  /// The list of addresses.
  final List<SavedAddress> addresses;

  /// If NextToken is returned, there are more results available. The value of
  /// NextToken is a unique pagination token for each page. Make the call again
  /// using the returned token to retrieve the next page.
  final String? nextToken;

  ListMembersOfAddressListResponse({
    required this.addresses,
    this.nextToken,
  });

  factory ListMembersOfAddressListResponse.fromJson(Map<String, dynamic> json) {
    return ListMembersOfAddressListResponse(
      addresses: ((json['Addresses'] as List?) ?? const [])
          .nonNulls
          .map((e) => SavedAddress.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final addresses = this.addresses;
    final nextToken = this.nextToken;
    return {
      'Addresses': addresses,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class ListTagsForResourceResponse {
  /// The tags used to organize, track, or control access for the resource. For
  /// example, { "tags": {"key1":"value1", "key2":"value2"} }.
  final List<Tag> tags;

  ListTagsForResourceResponse({
    required this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: ((json['Tags'] as List?) ?? const [])
          .nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      'Tags': tags,
    };
  }
}

/// @nodoc
class RegisterMemberToAddressListResponse {
  RegisterMemberToAddressListResponse();

  factory RegisterMemberToAddressListResponse.fromJson(Map<String, dynamic> _) {
    return RegisterMemberToAddressListResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class StartAddressListImportJobResponse {
  StartAddressListImportJobResponse();

  factory StartAddressListImportJobResponse.fromJson(Map<String, dynamic> _) {
    return StartAddressListImportJobResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The response from initiating an archive export.
///
/// @nodoc
class StartArchiveExportResponse {
  /// The unique identifier for the initiated export job.
  final String? exportId;

  StartArchiveExportResponse({
    this.exportId,
  });

  factory StartArchiveExportResponse.fromJson(Map<String, dynamic> json) {
    return StartArchiveExportResponse(
      exportId: json['ExportId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final exportId = this.exportId;
    return {
      if (exportId != null) 'ExportId': exportId,
    };
  }
}

/// The response from initiating an archive search.
///
/// @nodoc
class StartArchiveSearchResponse {
  /// The unique identifier for the initiated search job.
  final String? searchId;

  StartArchiveSearchResponse({
    this.searchId,
  });

  factory StartArchiveSearchResponse.fromJson(Map<String, dynamic> json) {
    return StartArchiveSearchResponse(
      searchId: json['SearchId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final searchId = this.searchId;
    return {
      if (searchId != null) 'SearchId': searchId,
    };
  }
}

/// @nodoc
class StopAddressListImportJobResponse {
  StopAddressListImportJobResponse();

  factory StopAddressListImportJobResponse.fromJson(Map<String, dynamic> _) {
    return StopAddressListImportJobResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The response indicating if the request to stop the export job succeeded.
///
/// On success, returns an HTTP 200 status code. On failure, returns an error
/// message.
///
/// @nodoc
class StopArchiveExportResponse {
  StopArchiveExportResponse();

  factory StopArchiveExportResponse.fromJson(Map<String, dynamic> _) {
    return StopArchiveExportResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The response indicating if the request to stop the search job succeeded.
///
/// On success, returns an HTTP 200 status code. On failure, returns an error
/// message.
///
/// @nodoc
class StopArchiveSearchResponse {
  StopArchiveSearchResponse();

  factory StopArchiveSearchResponse.fromJson(Map<String, dynamic> _) {
    return StopArchiveSearchResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
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
class CreateAddonInstanceResponse {
  /// The unique ID of the Add On instance created by this API.
  final String addonInstanceId;

  CreateAddonInstanceResponse({
    required this.addonInstanceId,
  });

  factory CreateAddonInstanceResponse.fromJson(Map<String, dynamic> json) {
    return CreateAddonInstanceResponse(
      addonInstanceId: (json['AddonInstanceId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final addonInstanceId = this.addonInstanceId;
    return {
      'AddonInstanceId': addonInstanceId,
    };
  }
}

/// @nodoc
class GetAddonInstanceResponse {
  /// The Amazon Resource Name (ARN) of the Add On instance.
  final String? addonInstanceArn;

  /// The name of the Add On provider associated to the subscription of the
  /// instance.
  final String? addonName;

  /// The subscription ID associated to the instance.
  final String? addonSubscriptionId;

  /// The timestamp of when the Add On instance was created.
  final DateTime? createdTimestamp;

  GetAddonInstanceResponse({
    this.addonInstanceArn,
    this.addonName,
    this.addonSubscriptionId,
    this.createdTimestamp,
  });

  factory GetAddonInstanceResponse.fromJson(Map<String, dynamic> json) {
    return GetAddonInstanceResponse(
      addonInstanceArn: json['AddonInstanceArn'] as String?,
      addonName: json['AddonName'] as String?,
      addonSubscriptionId: json['AddonSubscriptionId'] as String?,
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final addonInstanceArn = this.addonInstanceArn;
    final addonName = this.addonName;
    final addonSubscriptionId = this.addonSubscriptionId;
    final createdTimestamp = this.createdTimestamp;
    return {
      if (addonInstanceArn != null) 'AddonInstanceArn': addonInstanceArn,
      if (addonName != null) 'AddonName': addonName,
      if (addonSubscriptionId != null)
        'AddonSubscriptionId': addonSubscriptionId,
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
    };
  }
}

/// @nodoc
class DeleteAddonInstanceResponse {
  DeleteAddonInstanceResponse();

  factory DeleteAddonInstanceResponse.fromJson(Map<String, dynamic> _) {
    return DeleteAddonInstanceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class ListAddonInstancesResponse {
  /// The list of ingress endpoints.
  final List<AddonInstance>? addonInstances;

  /// If NextToken is returned, there are more results available. The value of
  /// NextToken is a unique pagination token for each page. Make the call again
  /// using the returned token to retrieve the next page.
  final String? nextToken;

  ListAddonInstancesResponse({
    this.addonInstances,
    this.nextToken,
  });

  factory ListAddonInstancesResponse.fromJson(Map<String, dynamic> json) {
    return ListAddonInstancesResponse(
      addonInstances: (json['AddonInstances'] as List?)
          ?.nonNulls
          .map((e) => AddonInstance.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final addonInstances = this.addonInstances;
    final nextToken = this.nextToken;
    return {
      if (addonInstances != null) 'AddonInstances': addonInstances,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class CreateAddonSubscriptionResponse {
  /// The unique ID of the Add On subscription created by this API.
  final String addonSubscriptionId;

  CreateAddonSubscriptionResponse({
    required this.addonSubscriptionId,
  });

  factory CreateAddonSubscriptionResponse.fromJson(Map<String, dynamic> json) {
    return CreateAddonSubscriptionResponse(
      addonSubscriptionId: (json['AddonSubscriptionId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final addonSubscriptionId = this.addonSubscriptionId;
    return {
      'AddonSubscriptionId': addonSubscriptionId,
    };
  }
}

/// @nodoc
class GetAddonSubscriptionResponse {
  /// The name of the Add On for the subscription.
  final String? addonName;

  /// Amazon Resource Name (ARN) for the subscription.
  final String? addonSubscriptionArn;

  /// The timestamp of when the Add On subscription was created.
  final DateTime? createdTimestamp;

  GetAddonSubscriptionResponse({
    this.addonName,
    this.addonSubscriptionArn,
    this.createdTimestamp,
  });

  factory GetAddonSubscriptionResponse.fromJson(Map<String, dynamic> json) {
    return GetAddonSubscriptionResponse(
      addonName: json['AddonName'] as String?,
      addonSubscriptionArn: json['AddonSubscriptionArn'] as String?,
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final addonName = this.addonName;
    final addonSubscriptionArn = this.addonSubscriptionArn;
    final createdTimestamp = this.createdTimestamp;
    return {
      if (addonName != null) 'AddonName': addonName,
      if (addonSubscriptionArn != null)
        'AddonSubscriptionArn': addonSubscriptionArn,
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
    };
  }
}

/// @nodoc
class DeleteAddonSubscriptionResponse {
  DeleteAddonSubscriptionResponse();

  factory DeleteAddonSubscriptionResponse.fromJson(Map<String, dynamic> _) {
    return DeleteAddonSubscriptionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class ListAddonSubscriptionsResponse {
  /// The list of ingress endpoints.
  final List<AddonSubscription>? addonSubscriptions;

  /// If NextToken is returned, there are more results available. The value of
  /// NextToken is a unique pagination token for each page. Make the call again
  /// using the returned token to retrieve the next page.
  final String? nextToken;

  ListAddonSubscriptionsResponse({
    this.addonSubscriptions,
    this.nextToken,
  });

  factory ListAddonSubscriptionsResponse.fromJson(Map<String, dynamic> json) {
    return ListAddonSubscriptionsResponse(
      addonSubscriptions: (json['AddonSubscriptions'] as List?)
          ?.nonNulls
          .map((e) => AddonSubscription.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final addonSubscriptions = this.addonSubscriptions;
    final nextToken = this.nextToken;
    return {
      if (addonSubscriptions != null) 'AddonSubscriptions': addonSubscriptions,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class CreateAddressListResponse {
  /// The identifier of the created address list.
  final String addressListId;

  CreateAddressListResponse({
    required this.addressListId,
  });

  factory CreateAddressListResponse.fromJson(Map<String, dynamic> json) {
    return CreateAddressListResponse(
      addressListId: (json['AddressListId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final addressListId = this.addressListId;
    return {
      'AddressListId': addressListId,
    };
  }
}

/// @nodoc
class GetAddressListResponse {
  /// The Amazon Resource Name (ARN) of the address list resource.
  final String addressListArn;

  /// The identifier of the address list resource.
  final String addressListId;

  /// A user-friendly name for the address list resource.
  final String addressListName;

  /// The date of when then address list was created.
  final DateTime createdTimestamp;

  /// The date of when the address list was last updated.
  final DateTime lastUpdatedTimestamp;

  GetAddressListResponse({
    required this.addressListArn,
    required this.addressListId,
    required this.addressListName,
    required this.createdTimestamp,
    required this.lastUpdatedTimestamp,
  });

  factory GetAddressListResponse.fromJson(Map<String, dynamic> json) {
    return GetAddressListResponse(
      addressListArn: (json['AddressListArn'] as String?) ?? '',
      addressListId: (json['AddressListId'] as String?) ?? '',
      addressListName: (json['AddressListName'] as String?) ?? '',
      createdTimestamp:
          nonNullableTimeStampFromJson(json['CreatedTimestamp'] ?? 0),
      lastUpdatedTimestamp:
          nonNullableTimeStampFromJson(json['LastUpdatedTimestamp'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final addressListArn = this.addressListArn;
    final addressListId = this.addressListId;
    final addressListName = this.addressListName;
    final createdTimestamp = this.createdTimestamp;
    final lastUpdatedTimestamp = this.lastUpdatedTimestamp;
    return {
      'AddressListArn': addressListArn,
      'AddressListId': addressListId,
      'AddressListName': addressListName,
      'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      'LastUpdatedTimestamp': unixTimestampToJson(lastUpdatedTimestamp),
    };
  }
}

/// @nodoc
class DeleteAddressListResponse {
  DeleteAddressListResponse();

  factory DeleteAddressListResponse.fromJson(Map<String, dynamic> _) {
    return DeleteAddressListResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class ListAddressListsResponse {
  /// The list of address lists.
  final List<AddressList> addressLists;

  /// If NextToken is returned, there are more results available. The value of
  /// NextToken is a unique pagination token for each page. Make the call again
  /// using the returned token to retrieve the next page.
  final String? nextToken;

  ListAddressListsResponse({
    required this.addressLists,
    this.nextToken,
  });

  factory ListAddressListsResponse.fromJson(Map<String, dynamic> json) {
    return ListAddressListsResponse(
      addressLists: ((json['AddressLists'] as List?) ?? const [])
          .nonNulls
          .map((e) => AddressList.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final addressLists = this.addressLists;
    final nextToken = this.nextToken;
    return {
      'AddressLists': addressLists,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// The response from creating a new email archive.
///
/// @nodoc
class CreateArchiveResponse {
  /// The unique identifier for the newly created archive.
  final String archiveId;

  CreateArchiveResponse({
    required this.archiveId,
  });

  factory CreateArchiveResponse.fromJson(Map<String, dynamic> json) {
    return CreateArchiveResponse(
      archiveId: (json['ArchiveId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final archiveId = this.archiveId;
    return {
      'ArchiveId': archiveId,
    };
  }
}

/// The response containing details of the requested archive.
///
/// @nodoc
class GetArchiveResponse {
  /// The Amazon Resource Name (ARN) of the archive.
  final String archiveArn;

  /// The unique identifier of the archive.
  final String archiveId;

  /// The unique name assigned to the archive.
  final String archiveName;

  /// The current state of the archive:
  ///
  /// <ul>
  /// <li>
  /// <code>ACTIVE</code> – The archive is ready and available for use.
  /// </li>
  /// <li>
  /// <code>PENDING_DELETION</code> – The archive has been marked for deletion and
  /// will be permanently deleted in 30 days. No further modifications can be made
  /// in this state.
  /// </li>
  /// </ul>
  final ArchiveState archiveState;

  /// The retention period for emails in this archive.
  final ArchiveRetention retention;

  /// The timestamp of when the archive was created.
  final DateTime? createdTimestamp;

  /// The Amazon Resource Name (ARN) of the KMS key used to encrypt the archive.
  final String? kmsKeyArn;

  /// The timestamp of when the archive was modified.
  final DateTime? lastUpdatedTimestamp;

  GetArchiveResponse({
    required this.archiveArn,
    required this.archiveId,
    required this.archiveName,
    required this.archiveState,
    required this.retention,
    this.createdTimestamp,
    this.kmsKeyArn,
    this.lastUpdatedTimestamp,
  });

  factory GetArchiveResponse.fromJson(Map<String, dynamic> json) {
    return GetArchiveResponse(
      archiveArn: (json['ArchiveArn'] as String?) ?? '',
      archiveId: (json['ArchiveId'] as String?) ?? '',
      archiveName: (json['ArchiveName'] as String?) ?? '',
      archiveState:
          ArchiveState.fromString((json['ArchiveState'] as String?) ?? ''),
      retention: ArchiveRetention.fromJson(
          (json['Retention'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      kmsKeyArn: json['KmsKeyArn'] as String?,
      lastUpdatedTimestamp: timeStampFromJson(json['LastUpdatedTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final archiveArn = this.archiveArn;
    final archiveId = this.archiveId;
    final archiveName = this.archiveName;
    final archiveState = this.archiveState;
    final retention = this.retention;
    final createdTimestamp = this.createdTimestamp;
    final kmsKeyArn = this.kmsKeyArn;
    final lastUpdatedTimestamp = this.lastUpdatedTimestamp;
    return {
      'ArchiveArn': archiveArn,
      'ArchiveId': archiveId,
      'ArchiveName': archiveName,
      'ArchiveState': archiveState.value,
      'Retention': retention,
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      if (kmsKeyArn != null) 'KmsKeyArn': kmsKeyArn,
      if (lastUpdatedTimestamp != null)
        'LastUpdatedTimestamp': unixTimestampToJson(lastUpdatedTimestamp),
    };
  }
}

/// The response indicating if the archive update succeeded or failed.
///
/// On success, returns an HTTP 200 status code. On failure, returns an error
/// message.
///
/// @nodoc
class UpdateArchiveResponse {
  UpdateArchiveResponse();

  factory UpdateArchiveResponse.fromJson(Map<String, dynamic> _) {
    return UpdateArchiveResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The response indicating if the archive deletion was successfully initiated.
///
/// On success, returns an HTTP 200 status code. On failure, returns an error
/// message.
///
/// @nodoc
class DeleteArchiveResponse {
  DeleteArchiveResponse();

  factory DeleteArchiveResponse.fromJson(Map<String, dynamic> _) {
    return DeleteArchiveResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The response containing a list of your email archives.
///
/// @nodoc
class ListArchivesResponse {
  /// The list of archive details.
  final List<Archive> archives;

  /// If present, use to retrieve the next page of results.
  final String? nextToken;

  ListArchivesResponse({
    required this.archives,
    this.nextToken,
  });

  factory ListArchivesResponse.fromJson(Map<String, dynamic> json) {
    return ListArchivesResponse(
      archives: ((json['Archives'] as List?) ?? const [])
          .nonNulls
          .map((e) => Archive.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final archives = this.archives;
    final nextToken = this.nextToken;
    return {
      'Archives': archives,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class CreateIngressPointResponse {
  /// The unique identifier for a previously created ingress endpoint.
  final String ingressPointId;

  CreateIngressPointResponse({
    required this.ingressPointId,
  });

  factory CreateIngressPointResponse.fromJson(Map<String, dynamic> json) {
    return CreateIngressPointResponse(
      ingressPointId: (json['IngressPointId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final ingressPointId = this.ingressPointId;
    return {
      'IngressPointId': ingressPointId,
    };
  }
}

/// @nodoc
class GetIngressPointResponse {
  /// The identifier of an ingress endpoint resource.
  final String ingressPointId;

  /// A user friendly name for the ingress endpoint.
  final String ingressPointName;

  /// The DNS A Record that identifies your ingress endpoint. Configure your DNS
  /// Mail Exchange (MX) record with this value to route emails to Mail Manager.
  final String? aRecord;

  /// The timestamp of when the ingress endpoint was created.
  final DateTime? createdTimestamp;

  /// The Amazon Resource Name (ARN) of the ingress endpoint resource.
  final String? ingressPointArn;

  /// The authentication configuration of the ingress endpoint resource.
  final IngressPointAuthConfiguration? ingressPointAuthConfiguration;

  /// The timestamp of when the ingress endpoint was last updated.
  final DateTime? lastUpdatedTimestamp;

  /// The network configuration for the ingress point.
  final NetworkConfiguration? networkConfiguration;

  /// The identifier of a rule set resource associated with the ingress endpoint.
  final String? ruleSetId;

  /// The status of the ingress endpoint resource.
  final IngressPointStatus? status;

  /// The selected Transport Layer Security (TLS) policy of the ingress point.
  final TlsPolicy? tlsPolicy;

  /// The identifier of the traffic policy resource associated with the ingress
  /// endpoint.
  final String? trafficPolicyId;

  /// The type of ingress endpoint.
  final IngressPointType? type;

  GetIngressPointResponse({
    required this.ingressPointId,
    required this.ingressPointName,
    this.aRecord,
    this.createdTimestamp,
    this.ingressPointArn,
    this.ingressPointAuthConfiguration,
    this.lastUpdatedTimestamp,
    this.networkConfiguration,
    this.ruleSetId,
    this.status,
    this.tlsPolicy,
    this.trafficPolicyId,
    this.type,
  });

  factory GetIngressPointResponse.fromJson(Map<String, dynamic> json) {
    return GetIngressPointResponse(
      ingressPointId: (json['IngressPointId'] as String?) ?? '',
      ingressPointName: (json['IngressPointName'] as String?) ?? '',
      aRecord: json['ARecord'] as String?,
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      ingressPointArn: json['IngressPointArn'] as String?,
      ingressPointAuthConfiguration:
          json['IngressPointAuthConfiguration'] != null
              ? IngressPointAuthConfiguration.fromJson(
                  json['IngressPointAuthConfiguration'] as Map<String, dynamic>)
              : null,
      lastUpdatedTimestamp: timeStampFromJson(json['LastUpdatedTimestamp']),
      networkConfiguration: json['NetworkConfiguration'] != null
          ? NetworkConfiguration.fromJson(
              json['NetworkConfiguration'] as Map<String, dynamic>)
          : null,
      ruleSetId: json['RuleSetId'] as String?,
      status: (json['Status'] as String?)?.let(IngressPointStatus.fromString),
      tlsPolicy: (json['TlsPolicy'] as String?)?.let(TlsPolicy.fromString),
      trafficPolicyId: json['TrafficPolicyId'] as String?,
      type: (json['Type'] as String?)?.let(IngressPointType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final ingressPointId = this.ingressPointId;
    final ingressPointName = this.ingressPointName;
    final aRecord = this.aRecord;
    final createdTimestamp = this.createdTimestamp;
    final ingressPointArn = this.ingressPointArn;
    final ingressPointAuthConfiguration = this.ingressPointAuthConfiguration;
    final lastUpdatedTimestamp = this.lastUpdatedTimestamp;
    final networkConfiguration = this.networkConfiguration;
    final ruleSetId = this.ruleSetId;
    final status = this.status;
    final tlsPolicy = this.tlsPolicy;
    final trafficPolicyId = this.trafficPolicyId;
    final type = this.type;
    return {
      'IngressPointId': ingressPointId,
      'IngressPointName': ingressPointName,
      if (aRecord != null) 'ARecord': aRecord,
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      if (ingressPointArn != null) 'IngressPointArn': ingressPointArn,
      if (ingressPointAuthConfiguration != null)
        'IngressPointAuthConfiguration': ingressPointAuthConfiguration,
      if (lastUpdatedTimestamp != null)
        'LastUpdatedTimestamp': unixTimestampToJson(lastUpdatedTimestamp),
      if (networkConfiguration != null)
        'NetworkConfiguration': networkConfiguration,
      if (ruleSetId != null) 'RuleSetId': ruleSetId,
      if (status != null) 'Status': status.value,
      if (tlsPolicy != null) 'TlsPolicy': tlsPolicy.value,
      if (trafficPolicyId != null) 'TrafficPolicyId': trafficPolicyId,
      if (type != null) 'Type': type.value,
    };
  }
}

/// @nodoc
class UpdateIngressPointResponse {
  UpdateIngressPointResponse();

  factory UpdateIngressPointResponse.fromJson(Map<String, dynamic> _) {
    return UpdateIngressPointResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class DeleteIngressPointResponse {
  DeleteIngressPointResponse();

  factory DeleteIngressPointResponse.fromJson(Map<String, dynamic> _) {
    return DeleteIngressPointResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class ListIngressPointsResponse {
  /// The list of ingress endpoints.
  final List<IngressPoint>? ingressPoints;

  /// If NextToken is returned, there are more results available. The value of
  /// NextToken is a unique pagination token for each page. Make the call again
  /// using the returned token to retrieve the next page.
  final String? nextToken;

  ListIngressPointsResponse({
    this.ingressPoints,
    this.nextToken,
  });

  factory ListIngressPointsResponse.fromJson(Map<String, dynamic> json) {
    return ListIngressPointsResponse(
      ingressPoints: (json['IngressPoints'] as List?)
          ?.nonNulls
          .map((e) => IngressPoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ingressPoints = this.ingressPoints;
    final nextToken = this.nextToken;
    return {
      if (ingressPoints != null) 'IngressPoints': ingressPoints,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class CreateRelayResponse {
  /// A unique identifier of the created relay resource.
  final String relayId;

  CreateRelayResponse({
    required this.relayId,
  });

  factory CreateRelayResponse.fromJson(Map<String, dynamic> json) {
    return CreateRelayResponse(
      relayId: (json['RelayId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final relayId = this.relayId;
    return {
      'RelayId': relayId,
    };
  }
}

/// @nodoc
class GetRelayResponse {
  /// The unique relay identifier.
  final String relayId;

  /// The authentication attribute—contains the secret ARN where the customer
  /// relay server credentials are stored.
  final RelayAuthentication? authentication;

  /// The timestamp of when the relay was created.
  final DateTime? createdTimestamp;

  /// The timestamp of when relay was last updated.
  final DateTime? lastModifiedTimestamp;

  /// The Amazon Resource Name (ARN) of the relay.
  final String? relayArn;

  /// The unique name of the relay.
  final String? relayName;

  /// The destination relay server address.
  final String? serverName;

  /// The destination relay server port.
  final int? serverPort;

  GetRelayResponse({
    required this.relayId,
    this.authentication,
    this.createdTimestamp,
    this.lastModifiedTimestamp,
    this.relayArn,
    this.relayName,
    this.serverName,
    this.serverPort,
  });

  factory GetRelayResponse.fromJson(Map<String, dynamic> json) {
    return GetRelayResponse(
      relayId: (json['RelayId'] as String?) ?? '',
      authentication: json['Authentication'] != null
          ? RelayAuthentication.fromJson(
              json['Authentication'] as Map<String, dynamic>)
          : null,
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      lastModifiedTimestamp: timeStampFromJson(json['LastModifiedTimestamp']),
      relayArn: json['RelayArn'] as String?,
      relayName: json['RelayName'] as String?,
      serverName: json['ServerName'] as String?,
      serverPort: json['ServerPort'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final relayId = this.relayId;
    final authentication = this.authentication;
    final createdTimestamp = this.createdTimestamp;
    final lastModifiedTimestamp = this.lastModifiedTimestamp;
    final relayArn = this.relayArn;
    final relayName = this.relayName;
    final serverName = this.serverName;
    final serverPort = this.serverPort;
    return {
      'RelayId': relayId,
      if (authentication != null) 'Authentication': authentication,
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      if (lastModifiedTimestamp != null)
        'LastModifiedTimestamp': unixTimestampToJson(lastModifiedTimestamp),
      if (relayArn != null) 'RelayArn': relayArn,
      if (relayName != null) 'RelayName': relayName,
      if (serverName != null) 'ServerName': serverName,
      if (serverPort != null) 'ServerPort': serverPort,
    };
  }
}

/// @nodoc
class UpdateRelayResponse {
  UpdateRelayResponse();

  factory UpdateRelayResponse.fromJson(Map<String, dynamic> _) {
    return UpdateRelayResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class DeleteRelayResponse {
  DeleteRelayResponse();

  factory DeleteRelayResponse.fromJson(Map<String, dynamic> _) {
    return DeleteRelayResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class ListRelaysResponse {
  /// The list of returned relays.
  final List<Relay> relays;

  /// If NextToken is returned, there are more results available. The value of
  /// NextToken is a unique pagination token for each page. Make the call again
  /// using the returned token to retrieve the next page.
  final String? nextToken;

  ListRelaysResponse({
    required this.relays,
    this.nextToken,
  });

  factory ListRelaysResponse.fromJson(Map<String, dynamic> json) {
    return ListRelaysResponse(
      relays: ((json['Relays'] as List?) ?? const [])
          .nonNulls
          .map((e) => Relay.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final relays = this.relays;
    final nextToken = this.nextToken;
    return {
      'Relays': relays,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class CreateRuleSetResponse {
  /// The identifier of the created rule set.
  final String ruleSetId;

  CreateRuleSetResponse({
    required this.ruleSetId,
  });

  factory CreateRuleSetResponse.fromJson(Map<String, dynamic> json) {
    return CreateRuleSetResponse(
      ruleSetId: (json['RuleSetId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final ruleSetId = this.ruleSetId;
    return {
      'RuleSetId': ruleSetId,
    };
  }
}

/// @nodoc
class GetRuleSetResponse {
  /// The date of when then rule set was created.
  final DateTime createdDate;

  /// The date of when the rule set was last modified.
  final DateTime lastModificationDate;

  /// The Amazon Resource Name (ARN) of the rule set resource.
  final String ruleSetArn;

  /// The identifier of the rule set resource.
  final String ruleSetId;

  /// A user-friendly name for the rule set resource.
  final String ruleSetName;

  /// The rules contained in the rule set.
  final List<Rule> rules;

  GetRuleSetResponse({
    required this.createdDate,
    required this.lastModificationDate,
    required this.ruleSetArn,
    required this.ruleSetId,
    required this.ruleSetName,
    required this.rules,
  });

  factory GetRuleSetResponse.fromJson(Map<String, dynamic> json) {
    return GetRuleSetResponse(
      createdDate: nonNullableTimeStampFromJson(json['CreatedDate'] ?? 0),
      lastModificationDate:
          nonNullableTimeStampFromJson(json['LastModificationDate'] ?? 0),
      ruleSetArn: (json['RuleSetArn'] as String?) ?? '',
      ruleSetId: (json['RuleSetId'] as String?) ?? '',
      ruleSetName: (json['RuleSetName'] as String?) ?? '',
      rules: ((json['Rules'] as List?) ?? const [])
          .nonNulls
          .map((e) => Rule.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final createdDate = this.createdDate;
    final lastModificationDate = this.lastModificationDate;
    final ruleSetArn = this.ruleSetArn;
    final ruleSetId = this.ruleSetId;
    final ruleSetName = this.ruleSetName;
    final rules = this.rules;
    return {
      'CreatedDate': unixTimestampToJson(createdDate),
      'LastModificationDate': unixTimestampToJson(lastModificationDate),
      'RuleSetArn': ruleSetArn,
      'RuleSetId': ruleSetId,
      'RuleSetName': ruleSetName,
      'Rules': rules,
    };
  }
}

/// @nodoc
class UpdateRuleSetResponse {
  UpdateRuleSetResponse();

  factory UpdateRuleSetResponse.fromJson(Map<String, dynamic> _) {
    return UpdateRuleSetResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class DeleteRuleSetResponse {
  DeleteRuleSetResponse();

  factory DeleteRuleSetResponse.fromJson(Map<String, dynamic> _) {
    return DeleteRuleSetResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class ListRuleSetsResponse {
  /// The list of rule sets.
  final List<RuleSet> ruleSets;

  /// If NextToken is returned, there are more results available. The value of
  /// NextToken is a unique pagination token for each page. Make the call again
  /// using the returned token to retrieve the next page.
  final String? nextToken;

  ListRuleSetsResponse({
    required this.ruleSets,
    this.nextToken,
  });

  factory ListRuleSetsResponse.fromJson(Map<String, dynamic> json) {
    return ListRuleSetsResponse(
      ruleSets: ((json['RuleSets'] as List?) ?? const [])
          .nonNulls
          .map((e) => RuleSet.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ruleSets = this.ruleSets;
    final nextToken = this.nextToken;
    return {
      'RuleSets': ruleSets,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class CreateTrafficPolicyResponse {
  /// The identifier of the traffic policy resource.
  final String trafficPolicyId;

  CreateTrafficPolicyResponse({
    required this.trafficPolicyId,
  });

  factory CreateTrafficPolicyResponse.fromJson(Map<String, dynamic> json) {
    return CreateTrafficPolicyResponse(
      trafficPolicyId: (json['TrafficPolicyId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final trafficPolicyId = this.trafficPolicyId;
    return {
      'TrafficPolicyId': trafficPolicyId,
    };
  }
}

/// @nodoc
class GetTrafficPolicyResponse {
  /// The identifier of the traffic policy resource.
  final String trafficPolicyId;

  /// A user-friendly name for the traffic policy resource.
  final String trafficPolicyName;

  /// The timestamp of when the traffic policy was created.
  final DateTime? createdTimestamp;

  /// The default action of the traffic policy.
  final AcceptAction? defaultAction;

  /// The timestamp of when the traffic policy was last updated.
  final DateTime? lastUpdatedTimestamp;

  /// The maximum message size in bytes of email which is allowed in by this
  /// traffic policy—anything larger will be blocked.
  final int? maxMessageSizeBytes;

  /// The list of conditions which are in the traffic policy resource.
  final List<PolicyStatement>? policyStatements;

  /// The Amazon Resource Name (ARN) of the traffic policy resource.
  final String? trafficPolicyArn;

  GetTrafficPolicyResponse({
    required this.trafficPolicyId,
    required this.trafficPolicyName,
    this.createdTimestamp,
    this.defaultAction,
    this.lastUpdatedTimestamp,
    this.maxMessageSizeBytes,
    this.policyStatements,
    this.trafficPolicyArn,
  });

  factory GetTrafficPolicyResponse.fromJson(Map<String, dynamic> json) {
    return GetTrafficPolicyResponse(
      trafficPolicyId: (json['TrafficPolicyId'] as String?) ?? '',
      trafficPolicyName: (json['TrafficPolicyName'] as String?) ?? '',
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      defaultAction:
          (json['DefaultAction'] as String?)?.let(AcceptAction.fromString),
      lastUpdatedTimestamp: timeStampFromJson(json['LastUpdatedTimestamp']),
      maxMessageSizeBytes: json['MaxMessageSizeBytes'] as int?,
      policyStatements: (json['PolicyStatements'] as List?)
          ?.nonNulls
          .map((e) => PolicyStatement.fromJson(e as Map<String, dynamic>))
          .toList(),
      trafficPolicyArn: json['TrafficPolicyArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final trafficPolicyId = this.trafficPolicyId;
    final trafficPolicyName = this.trafficPolicyName;
    final createdTimestamp = this.createdTimestamp;
    final defaultAction = this.defaultAction;
    final lastUpdatedTimestamp = this.lastUpdatedTimestamp;
    final maxMessageSizeBytes = this.maxMessageSizeBytes;
    final policyStatements = this.policyStatements;
    final trafficPolicyArn = this.trafficPolicyArn;
    return {
      'TrafficPolicyId': trafficPolicyId,
      'TrafficPolicyName': trafficPolicyName,
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      if (defaultAction != null) 'DefaultAction': defaultAction.value,
      if (lastUpdatedTimestamp != null)
        'LastUpdatedTimestamp': unixTimestampToJson(lastUpdatedTimestamp),
      if (maxMessageSizeBytes != null)
        'MaxMessageSizeBytes': maxMessageSizeBytes,
      if (policyStatements != null) 'PolicyStatements': policyStatements,
      if (trafficPolicyArn != null) 'TrafficPolicyArn': trafficPolicyArn,
    };
  }
}

/// @nodoc
class UpdateTrafficPolicyResponse {
  UpdateTrafficPolicyResponse();

  factory UpdateTrafficPolicyResponse.fromJson(Map<String, dynamic> _) {
    return UpdateTrafficPolicyResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class DeleteTrafficPolicyResponse {
  DeleteTrafficPolicyResponse();

  factory DeleteTrafficPolicyResponse.fromJson(Map<String, dynamic> _) {
    return DeleteTrafficPolicyResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class ListTrafficPoliciesResponse {
  /// If NextToken is returned, there are more results available. The value of
  /// NextToken is a unique pagination token for each page. Make the call again
  /// using the returned token to retrieve the next page.
  final String? nextToken;

  /// The list of traffic policies.
  final List<TrafficPolicy>? trafficPolicies;

  ListTrafficPoliciesResponse({
    this.nextToken,
    this.trafficPolicies,
  });

  factory ListTrafficPoliciesResponse.fromJson(Map<String, dynamic> json) {
    return ListTrafficPoliciesResponse(
      nextToken: json['NextToken'] as String?,
      trafficPolicies: (json['TrafficPolicies'] as List?)
          ?.nonNulls
          .map((e) => TrafficPolicy.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final trafficPolicies = this.trafficPolicies;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (trafficPolicies != null) 'TrafficPolicies': trafficPolicies,
    };
  }
}

/// The structure of a traffic policy resource which is a container for policy
/// statements.
///
/// @nodoc
class TrafficPolicy {
  /// Default action instructs the traﬃc policy to either Allow or Deny (block)
  /// messages that fall outside of (or not addressed by) the conditions of your
  /// policy statements
  final AcceptAction defaultAction;

  /// The identifier of the traffic policy resource.
  final String trafficPolicyId;

  /// A user-friendly name of the traffic policy resource.
  final String trafficPolicyName;

  TrafficPolicy({
    required this.defaultAction,
    required this.trafficPolicyId,
    required this.trafficPolicyName,
  });

  factory TrafficPolicy.fromJson(Map<String, dynamic> json) {
    return TrafficPolicy(
      defaultAction:
          AcceptAction.fromString((json['DefaultAction'] as String?) ?? ''),
      trafficPolicyId: (json['TrafficPolicyId'] as String?) ?? '',
      trafficPolicyName: (json['TrafficPolicyName'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final defaultAction = this.defaultAction;
    final trafficPolicyId = this.trafficPolicyId;
    final trafficPolicyName = this.trafficPolicyName;
    return {
      'DefaultAction': defaultAction.value,
      'TrafficPolicyId': trafficPolicyId,
      'TrafficPolicyName': trafficPolicyName,
    };
  }
}

/// @nodoc
class AcceptAction {
  static const allow = AcceptAction._('ALLOW');
  static const deny = AcceptAction._('DENY');

  final String value;

  const AcceptAction._(this.value);

  static const values = [allow, deny];

  static AcceptAction fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => AcceptAction._(value));

  @override
  bool operator ==(other) => other is AcceptAction && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The structure containing traffic policy conditions and actions.
///
/// @nodoc
class PolicyStatement {
  /// The action that informs a traffic policy resource to either allow or block
  /// the email if it matches a condition in the policy statement.
  final AcceptAction action;

  /// The list of conditions to apply to incoming messages for filtering email
  /// traffic.
  final List<PolicyCondition> conditions;

  PolicyStatement({
    required this.action,
    required this.conditions,
  });

  factory PolicyStatement.fromJson(Map<String, dynamic> json) {
    return PolicyStatement(
      action: AcceptAction.fromString((json['Action'] as String?) ?? ''),
      conditions: ((json['Conditions'] as List?) ?? const [])
          .nonNulls
          .map((e) => PolicyCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final conditions = this.conditions;
    return {
      'Action': action.value,
      'Conditions': conditions,
    };
  }
}

/// The email traffic filtering conditions which are contained in a traffic
/// policy resource.
///
/// @nodoc
class PolicyCondition {
  /// This represents a boolean type condition matching on the incoming mail. It
  /// performs the boolean operation configured in 'Operator' and evaluates the
  /// 'Protocol' object against the 'Value'.
  final IngressBooleanExpression? booleanExpression;

  /// This represents an IP based condition matching on the incoming mail. It
  /// performs the operation configured in 'Operator' and evaluates the 'Protocol'
  /// object against the 'Value'.
  final IngressIpv4Expression? ipExpression;

  /// This represents an IPv6 based condition matching on the incoming mail. It
  /// performs the operation configured in 'Operator' and evaluates the 'Protocol'
  /// object against the 'Value'.
  final IngressIpv6Expression? ipv6Expression;

  /// This represents a string based condition matching on the incoming mail. It
  /// performs the string operation configured in 'Operator' and evaluates the
  /// 'Protocol' object against the 'Value'.
  final IngressStringExpression? stringExpression;

  /// This represents a TLS based condition matching on the incoming mail. It
  /// performs the operation configured in 'Operator' and evaluates the 'Protocol'
  /// object against the 'Value'.
  final IngressTlsProtocolExpression? tlsExpression;

  PolicyCondition({
    this.booleanExpression,
    this.ipExpression,
    this.ipv6Expression,
    this.stringExpression,
    this.tlsExpression,
  });

  factory PolicyCondition.fromJson(Map<String, dynamic> json) {
    return PolicyCondition(
      booleanExpression: json['BooleanExpression'] != null
          ? IngressBooleanExpression.fromJson(
              json['BooleanExpression'] as Map<String, dynamic>)
          : null,
      ipExpression: json['IpExpression'] != null
          ? IngressIpv4Expression.fromJson(
              json['IpExpression'] as Map<String, dynamic>)
          : null,
      ipv6Expression: json['Ipv6Expression'] != null
          ? IngressIpv6Expression.fromJson(
              json['Ipv6Expression'] as Map<String, dynamic>)
          : null,
      stringExpression: json['StringExpression'] != null
          ? IngressStringExpression.fromJson(
              json['StringExpression'] as Map<String, dynamic>)
          : null,
      tlsExpression: json['TlsExpression'] != null
          ? IngressTlsProtocolExpression.fromJson(
              json['TlsExpression'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final booleanExpression = this.booleanExpression;
    final ipExpression = this.ipExpression;
    final ipv6Expression = this.ipv6Expression;
    final stringExpression = this.stringExpression;
    final tlsExpression = this.tlsExpression;
    return {
      if (booleanExpression != null) 'BooleanExpression': booleanExpression,
      if (ipExpression != null) 'IpExpression': ipExpression,
      if (ipv6Expression != null) 'Ipv6Expression': ipv6Expression,
      if (stringExpression != null) 'StringExpression': stringExpression,
      if (tlsExpression != null) 'TlsExpression': tlsExpression,
    };
  }
}

/// The structure for a string based condition matching on the incoming mail.
///
/// @nodoc
class IngressStringExpression {
  /// The left hand side argument of a string condition expression.
  final IngressStringToEvaluate evaluate;

  /// The matching operator for a string condition expression.
  final IngressStringOperator operator;

  /// The right hand side argument of a string condition expression.
  final List<String> values;

  IngressStringExpression({
    required this.evaluate,
    required this.operator,
    required this.values,
  });

  factory IngressStringExpression.fromJson(Map<String, dynamic> json) {
    return IngressStringExpression(
      evaluate: IngressStringToEvaluate.fromJson(
          (json['Evaluate'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      operator:
          IngressStringOperator.fromString((json['Operator'] as String?) ?? ''),
      values: ((json['Values'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final evaluate = this.evaluate;
    final operator = this.operator;
    final values = this.values;
    return {
      'Evaluate': evaluate,
      'Operator': operator.value,
      'Values': values,
    };
  }
}

/// The union type representing the allowed types for the left hand side of an
/// IP condition.
///
/// @nodoc
class IngressIpv4Expression {
  /// The left hand side argument of an IP condition expression.
  final IngressIpToEvaluate evaluate;

  /// The matching operator for an IP condition expression.
  final IngressIpOperator operator;

  /// The right hand side argument of an IP condition expression.
  final List<String> values;

  IngressIpv4Expression({
    required this.evaluate,
    required this.operator,
    required this.values,
  });

  factory IngressIpv4Expression.fromJson(Map<String, dynamic> json) {
    return IngressIpv4Expression(
      evaluate: IngressIpToEvaluate.fromJson(
          (json['Evaluate'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      operator:
          IngressIpOperator.fromString((json['Operator'] as String?) ?? ''),
      values: ((json['Values'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final evaluate = this.evaluate;
    final operator = this.operator;
    final values = this.values;
    return {
      'Evaluate': evaluate,
      'Operator': operator.value,
      'Values': values,
    };
  }
}

/// The union type representing the allowed types for the left hand side of an
/// IPv6 condition.
///
/// @nodoc
class IngressIpv6Expression {
  /// The left hand side argument of an IPv6 condition expression.
  final IngressIpv6ToEvaluate evaluate;

  /// The matching operator for an IPv6 condition expression.
  final IngressIpOperator operator;

  /// The right hand side argument of an IPv6 condition expression.
  final List<String> values;

  IngressIpv6Expression({
    required this.evaluate,
    required this.operator,
    required this.values,
  });

  factory IngressIpv6Expression.fromJson(Map<String, dynamic> json) {
    return IngressIpv6Expression(
      evaluate: IngressIpv6ToEvaluate.fromJson(
          (json['Evaluate'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      operator:
          IngressIpOperator.fromString((json['Operator'] as String?) ?? ''),
      values: ((json['Values'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final evaluate = this.evaluate;
    final operator = this.operator;
    final values = this.values;
    return {
      'Evaluate': evaluate,
      'Operator': operator.value,
      'Values': values,
    };
  }
}

/// The structure for a TLS related condition matching on the incoming mail.
///
/// @nodoc
class IngressTlsProtocolExpression {
  /// The left hand side argument of a TLS condition expression.
  final IngressTlsProtocolToEvaluate evaluate;

  /// The matching operator for a TLS condition expression.
  final IngressTlsProtocolOperator operator;

  /// The right hand side argument of a TLS condition expression.
  final IngressTlsProtocolAttribute value;

  IngressTlsProtocolExpression({
    required this.evaluate,
    required this.operator,
    required this.value,
  });

  factory IngressTlsProtocolExpression.fromJson(Map<String, dynamic> json) {
    return IngressTlsProtocolExpression(
      evaluate: IngressTlsProtocolToEvaluate.fromJson(
          (json['Evaluate'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      operator: IngressTlsProtocolOperator.fromString(
          (json['Operator'] as String?) ?? ''),
      value: IngressTlsProtocolAttribute.fromString(
          (json['Value'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final evaluate = this.evaluate;
    final operator = this.operator;
    final value = this.value;
    return {
      'Evaluate': evaluate,
      'Operator': operator.value,
      'Value': value.value,
    };
  }
}

/// The structure for a boolean condition matching on the incoming mail.
///
/// @nodoc
class IngressBooleanExpression {
  /// The operand on which to perform a boolean condition operation.
  final IngressBooleanToEvaluate evaluate;

  /// The matching operator for a boolean condition expression.
  final IngressBooleanOperator operator;

  IngressBooleanExpression({
    required this.evaluate,
    required this.operator,
  });

  factory IngressBooleanExpression.fromJson(Map<String, dynamic> json) {
    return IngressBooleanExpression(
      evaluate: IngressBooleanToEvaluate.fromJson(
          (json['Evaluate'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      operator: IngressBooleanOperator.fromString(
          (json['Operator'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final evaluate = this.evaluate;
    final operator = this.operator;
    return {
      'Evaluate': evaluate,
      'Operator': operator.value,
    };
  }
}

/// The union type representing the allowed types of operands for a boolean
/// condition.
///
/// @nodoc
class IngressBooleanToEvaluate {
  /// The structure type for a boolean condition stating the Add On ARN and its
  /// returned value.
  final IngressAnalysis? analysis;

  /// The structure type for a boolean condition that provides the address lists
  /// to evaluate incoming traffic on.
  final IngressIsInAddressList? isInAddressList;

  IngressBooleanToEvaluate({
    this.analysis,
    this.isInAddressList,
  });

  factory IngressBooleanToEvaluate.fromJson(Map<String, dynamic> json) {
    return IngressBooleanToEvaluate(
      analysis: json['Analysis'] != null
          ? IngressAnalysis.fromJson(json['Analysis'] as Map<String, dynamic>)
          : null,
      isInAddressList: json['IsInAddressList'] != null
          ? IngressIsInAddressList.fromJson(
              json['IsInAddressList'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final analysis = this.analysis;
    final isInAddressList = this.isInAddressList;
    return {
      if (analysis != null) 'Analysis': analysis,
      if (isInAddressList != null) 'IsInAddressList': isInAddressList,
    };
  }
}

/// @nodoc
class IngressBooleanOperator {
  static const isTrue = IngressBooleanOperator._('IS_TRUE');
  static const isFalse = IngressBooleanOperator._('IS_FALSE');

  final String value;

  const IngressBooleanOperator._(this.value);

  static const values = [isTrue, isFalse];

  static IngressBooleanOperator fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => IngressBooleanOperator._(value));

  @override
  bool operator ==(other) =>
      other is IngressBooleanOperator && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The Add On ARN and its returned value that is evaluated in a policy
/// statement's conditional expression to either deny or block the incoming
/// email.
///
/// @nodoc
class IngressAnalysis {
  /// The Amazon Resource Name (ARN) of an Add On.
  final String analyzer;

  /// The returned value from an Add On.
  final String resultField;

  IngressAnalysis({
    required this.analyzer,
    required this.resultField,
  });

  factory IngressAnalysis.fromJson(Map<String, dynamic> json) {
    return IngressAnalysis(
      analyzer: (json['Analyzer'] as String?) ?? '',
      resultField: (json['ResultField'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final analyzer = this.analyzer;
    final resultField = this.resultField;
    return {
      'Analyzer': analyzer,
      'ResultField': resultField,
    };
  }
}

/// The address lists and the address list attribute value that is evaluated in
/// a policy statement's conditional expression to either deny or block the
/// incoming email.
///
/// @nodoc
class IngressIsInAddressList {
  /// The address lists that will be used for evaluation.
  final List<String> addressLists;

  /// The email attribute that needs to be evaluated against the address list.
  final IngressAddressListEmailAttribute attribute;

  IngressIsInAddressList({
    required this.addressLists,
    required this.attribute,
  });

  factory IngressIsInAddressList.fromJson(Map<String, dynamic> json) {
    return IngressIsInAddressList(
      addressLists: ((json['AddressLists'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      attribute: IngressAddressListEmailAttribute.fromString(
          (json['Attribute'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final addressLists = this.addressLists;
    final attribute = this.attribute;
    return {
      'AddressLists': addressLists,
      'Attribute': attribute.value,
    };
  }
}

/// @nodoc
class IngressAddressListEmailAttribute {
  static const recipient = IngressAddressListEmailAttribute._('RECIPIENT');

  final String value;

  const IngressAddressListEmailAttribute._(this.value);

  static const values = [recipient];

  static IngressAddressListEmailAttribute fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => IngressAddressListEmailAttribute._(value));

  @override
  bool operator ==(other) =>
      other is IngressAddressListEmailAttribute && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The union type representing the allowed types for the left hand side of a
/// TLS condition.
///
/// @nodoc
class IngressTlsProtocolToEvaluate {
  /// The enum type representing the allowed attribute types for the TLS
  /// condition.
  final IngressTlsAttribute? attribute;

  IngressTlsProtocolToEvaluate({
    this.attribute,
  });

  factory IngressTlsProtocolToEvaluate.fromJson(Map<String, dynamic> json) {
    return IngressTlsProtocolToEvaluate(
      attribute:
          (json['Attribute'] as String?)?.let(IngressTlsAttribute.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final attribute = this.attribute;
    return {
      if (attribute != null) 'Attribute': attribute.value,
    };
  }
}

/// @nodoc
class IngressTlsProtocolOperator {
  static const minimumTlsVersion =
      IngressTlsProtocolOperator._('MINIMUM_TLS_VERSION');
  static const $is = IngressTlsProtocolOperator._('IS');

  final String value;

  const IngressTlsProtocolOperator._(this.value);

  static const values = [minimumTlsVersion, $is];

  static IngressTlsProtocolOperator fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => IngressTlsProtocolOperator._(value));

  @override
  bool operator ==(other) =>
      other is IngressTlsProtocolOperator && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class IngressTlsProtocolAttribute {
  static const tls1_2 = IngressTlsProtocolAttribute._('TLS1_2');
  static const tls1_3 = IngressTlsProtocolAttribute._('TLS1_3');

  final String value;

  const IngressTlsProtocolAttribute._(this.value);

  static const values = [tls1_2, tls1_3];

  static IngressTlsProtocolAttribute fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => IngressTlsProtocolAttribute._(value));

  @override
  bool operator ==(other) =>
      other is IngressTlsProtocolAttribute && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class IngressTlsAttribute {
  static const tlsProtocol = IngressTlsAttribute._('TLS_PROTOCOL');

  final String value;

  const IngressTlsAttribute._(this.value);

  static const values = [tlsProtocol];

  static IngressTlsAttribute fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => IngressTlsAttribute._(value));

  @override
  bool operator ==(other) =>
      other is IngressTlsAttribute && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The structure for an IPv6 based condition matching on the incoming mail.
///
/// @nodoc
class IngressIpv6ToEvaluate {
  /// An enum type representing the allowed attribute types for an IPv6 condition.
  final IngressIpv6Attribute? attribute;

  IngressIpv6ToEvaluate({
    this.attribute,
  });

  factory IngressIpv6ToEvaluate.fromJson(Map<String, dynamic> json) {
    return IngressIpv6ToEvaluate(
      attribute:
          (json['Attribute'] as String?)?.let(IngressIpv6Attribute.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final attribute = this.attribute;
    return {
      if (attribute != null) 'Attribute': attribute.value,
    };
  }
}

/// @nodoc
class IngressIpOperator {
  static const cidrMatches = IngressIpOperator._('CIDR_MATCHES');
  static const notCidrMatches = IngressIpOperator._('NOT_CIDR_MATCHES');

  final String value;

  const IngressIpOperator._(this.value);

  static const values = [cidrMatches, notCidrMatches];

  static IngressIpOperator fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => IngressIpOperator._(value));

  @override
  bool operator ==(other) => other is IngressIpOperator && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class IngressIpv6Attribute {
  static const senderIpv6 = IngressIpv6Attribute._('SENDER_IPV6');

  final String value;

  const IngressIpv6Attribute._(this.value);

  static const values = [senderIpv6];

  static IngressIpv6Attribute fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => IngressIpv6Attribute._(value));

  @override
  bool operator ==(other) =>
      other is IngressIpv6Attribute && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The structure for an IP based condition matching on the incoming mail.
///
/// @nodoc
class IngressIpToEvaluate {
  /// An enum type representing the allowed attribute types for an IP condition.
  final IngressIpv4Attribute? attribute;

  IngressIpToEvaluate({
    this.attribute,
  });

  factory IngressIpToEvaluate.fromJson(Map<String, dynamic> json) {
    return IngressIpToEvaluate(
      attribute:
          (json['Attribute'] as String?)?.let(IngressIpv4Attribute.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final attribute = this.attribute;
    return {
      if (attribute != null) 'Attribute': attribute.value,
    };
  }
}

/// @nodoc
class IngressIpv4Attribute {
  static const senderIp = IngressIpv4Attribute._('SENDER_IP');

  final String value;

  const IngressIpv4Attribute._(this.value);

  static const values = [senderIp];

  static IngressIpv4Attribute fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => IngressIpv4Attribute._(value));

  @override
  bool operator ==(other) =>
      other is IngressIpv4Attribute && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The union type representing the allowed types for the left hand side of a
/// string condition.
///
/// @nodoc
class IngressStringToEvaluate {
  /// The structure type for a string condition stating the Add On ARN and its
  /// returned value.
  final IngressAnalysis? analysis;

  /// The enum type representing the allowed attribute types for a string
  /// condition.
  final IngressStringEmailAttribute? attribute;

  IngressStringToEvaluate({
    this.analysis,
    this.attribute,
  });

  factory IngressStringToEvaluate.fromJson(Map<String, dynamic> json) {
    return IngressStringToEvaluate(
      analysis: json['Analysis'] != null
          ? IngressAnalysis.fromJson(json['Analysis'] as Map<String, dynamic>)
          : null,
      attribute: (json['Attribute'] as String?)
          ?.let(IngressStringEmailAttribute.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final analysis = this.analysis;
    final attribute = this.attribute;
    return {
      if (analysis != null) 'Analysis': analysis,
      if (attribute != null) 'Attribute': attribute.value,
    };
  }
}

/// @nodoc
class IngressStringOperator {
  static const equals = IngressStringOperator._('EQUALS');
  static const notEquals = IngressStringOperator._('NOT_EQUALS');
  static const startsWith = IngressStringOperator._('STARTS_WITH');
  static const endsWith = IngressStringOperator._('ENDS_WITH');
  static const contains = IngressStringOperator._('CONTAINS');

  final String value;

  const IngressStringOperator._(this.value);

  static const values = [equals, notEquals, startsWith, endsWith, contains];

  static IngressStringOperator fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => IngressStringOperator._(value));

  @override
  bool operator ==(other) =>
      other is IngressStringOperator && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class IngressStringEmailAttribute {
  static const recipient = IngressStringEmailAttribute._('RECIPIENT');

  final String value;

  const IngressStringEmailAttribute._(this.value);

  static const values = [recipient];

  static IngressStringEmailAttribute fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => IngressStringEmailAttribute._(value));

  @override
  bool operator ==(other) =>
      other is IngressStringEmailAttribute && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A key-value pair (the value is optional), that you can define and assign to
/// Amazon Web Services resources.
///
/// @nodoc
class Tag {
  /// The key of the key-value tag.
  final String key;

  /// The value of the key-value tag.
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

/// A rule set contains a list of rules that are evaluated in order. Each rule
/// is evaluated sequentially for each email.
///
/// @nodoc
class RuleSet {
  /// The last modification date of the rule set.
  final DateTime? lastModificationDate;

  /// The identifier of the rule set.
  final String? ruleSetId;

  /// A user-friendly name for the rule set.
  final String? ruleSetName;

  RuleSet({
    this.lastModificationDate,
    this.ruleSetId,
    this.ruleSetName,
  });

  factory RuleSet.fromJson(Map<String, dynamic> json) {
    return RuleSet(
      lastModificationDate: timeStampFromJson(json['LastModificationDate']),
      ruleSetId: json['RuleSetId'] as String?,
      ruleSetName: json['RuleSetName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lastModificationDate = this.lastModificationDate;
    final ruleSetId = this.ruleSetId;
    final ruleSetName = this.ruleSetName;
    return {
      if (lastModificationDate != null)
        'LastModificationDate': unixTimestampToJson(lastModificationDate),
      if (ruleSetId != null) 'RuleSetId': ruleSetId,
      if (ruleSetName != null) 'RuleSetName': ruleSetName,
    };
  }
}

/// A rule contains conditions, "unless conditions" and actions. For each
/// envelope recipient of an email, if all conditions match and none of the
/// "unless conditions" match, then all of the actions are executed
/// sequentially. If no conditions are provided, the rule always applies and the
/// actions are implicitly executed. If only "unless conditions" are provided,
/// the rule applies if the email does not match the evaluation of the "unless
/// conditions".
///
/// @nodoc
class Rule {
  /// The list of actions to execute when the conditions match the incoming email,
  /// and none of the "unless conditions" match.
  final List<RuleAction> actions;

  /// The conditions of this rule. All conditions must match the email for the
  /// actions to be executed. An empty list of conditions means that all emails
  /// match, but are still subject to any "unless conditions"
  final List<RuleCondition>? conditions;

  /// The user-friendly name of the rule.
  final String? name;

  /// The "unless conditions" of this rule. None of the conditions can match the
  /// email for the actions to be executed. If any of these conditions do match
  /// the email, then the actions are not executed.
  final List<RuleCondition>? unless;

  Rule({
    required this.actions,
    this.conditions,
    this.name,
    this.unless,
  });

  factory Rule.fromJson(Map<String, dynamic> json) {
    return Rule(
      actions: ((json['Actions'] as List?) ?? const [])
          .nonNulls
          .map((e) => RuleAction.fromJson(e as Map<String, dynamic>))
          .toList(),
      conditions: (json['Conditions'] as List?)
          ?.nonNulls
          .map((e) => RuleCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['Name'] as String?,
      unless: (json['Unless'] as List?)
          ?.nonNulls
          .map((e) => RuleCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final actions = this.actions;
    final conditions = this.conditions;
    final name = this.name;
    final unless = this.unless;
    return {
      'Actions': actions,
      if (conditions != null) 'Conditions': conditions,
      if (name != null) 'Name': name,
      if (unless != null) 'Unless': unless,
    };
  }
}

/// The action for a rule to take. Only one of the contained actions can be set.
///
/// @nodoc
class RuleAction {
  /// This action adds a header. This can be used to add arbitrary email headers.
  final AddHeaderAction? addHeader;

  /// This action archives the email. This can be used to deliver an email to an
  /// archive.
  final ArchiveAction? archive;

  /// This action sends a bounce response for the email.
  final BounceAction? bounce;

  /// This action delivers an email to a WorkMail mailbox.
  final DeliverToMailboxAction? deliverToMailbox;

  /// This action delivers an email to an Amazon Q Business application for
  /// ingestion into its knowledge base.
  final DeliverToQBusinessAction? deliverToQBusiness;

  /// This action terminates the evaluation of rules in the rule set.
  final DropAction? drop;

  /// This action invokes an Amazon Web Services Lambda function to process the
  /// email.
  final InvokeLambdaAction? invokeLambda;

  /// This action publishes the email content to an Amazon SNS topic.
  final SnsAction? publishToSns;

  /// This action relays the email to another SMTP server.
  final RelayAction? relay;

  /// The action replaces certain or all recipients with a different set of
  /// recipients.
  final ReplaceRecipientAction? replaceRecipient;

  /// This action sends the email to the internet.
  final SendAction? send;

  /// This action writes the MIME content of the email to an S3 bucket.
  final S3Action? writeToS3;

  RuleAction({
    this.addHeader,
    this.archive,
    this.bounce,
    this.deliverToMailbox,
    this.deliverToQBusiness,
    this.drop,
    this.invokeLambda,
    this.publishToSns,
    this.relay,
    this.replaceRecipient,
    this.send,
    this.writeToS3,
  });

  factory RuleAction.fromJson(Map<String, dynamic> json) {
    return RuleAction(
      addHeader: json['AddHeader'] != null
          ? AddHeaderAction.fromJson(json['AddHeader'] as Map<String, dynamic>)
          : null,
      archive: json['Archive'] != null
          ? ArchiveAction.fromJson(json['Archive'] as Map<String, dynamic>)
          : null,
      bounce: json['Bounce'] != null
          ? BounceAction.fromJson(json['Bounce'] as Map<String, dynamic>)
          : null,
      deliverToMailbox: json['DeliverToMailbox'] != null
          ? DeliverToMailboxAction.fromJson(
              json['DeliverToMailbox'] as Map<String, dynamic>)
          : null,
      deliverToQBusiness: json['DeliverToQBusiness'] != null
          ? DeliverToQBusinessAction.fromJson(
              json['DeliverToQBusiness'] as Map<String, dynamic>)
          : null,
      drop: json['Drop'] != null
          ? DropAction.fromJson(json['Drop'] as Map<String, dynamic>)
          : null,
      invokeLambda: json['InvokeLambda'] != null
          ? InvokeLambdaAction.fromJson(
              json['InvokeLambda'] as Map<String, dynamic>)
          : null,
      publishToSns: json['PublishToSns'] != null
          ? SnsAction.fromJson(json['PublishToSns'] as Map<String, dynamic>)
          : null,
      relay: json['Relay'] != null
          ? RelayAction.fromJson(json['Relay'] as Map<String, dynamic>)
          : null,
      replaceRecipient: json['ReplaceRecipient'] != null
          ? ReplaceRecipientAction.fromJson(
              json['ReplaceRecipient'] as Map<String, dynamic>)
          : null,
      send: json['Send'] != null
          ? SendAction.fromJson(json['Send'] as Map<String, dynamic>)
          : null,
      writeToS3: json['WriteToS3'] != null
          ? S3Action.fromJson(json['WriteToS3'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final addHeader = this.addHeader;
    final archive = this.archive;
    final bounce = this.bounce;
    final deliverToMailbox = this.deliverToMailbox;
    final deliverToQBusiness = this.deliverToQBusiness;
    final drop = this.drop;
    final invokeLambda = this.invokeLambda;
    final publishToSns = this.publishToSns;
    final relay = this.relay;
    final replaceRecipient = this.replaceRecipient;
    final send = this.send;
    final writeToS3 = this.writeToS3;
    return {
      if (addHeader != null) 'AddHeader': addHeader,
      if (archive != null) 'Archive': archive,
      if (bounce != null) 'Bounce': bounce,
      if (deliverToMailbox != null) 'DeliverToMailbox': deliverToMailbox,
      if (deliverToQBusiness != null) 'DeliverToQBusiness': deliverToQBusiness,
      if (drop != null) 'Drop': drop,
      if (invokeLambda != null) 'InvokeLambda': invokeLambda,
      if (publishToSns != null) 'PublishToSns': publishToSns,
      if (relay != null) 'Relay': relay,
      if (replaceRecipient != null) 'ReplaceRecipient': replaceRecipient,
      if (send != null) 'Send': send,
      if (writeToS3 != null) 'WriteToS3': writeToS3,
    };
  }
}

/// This action causes processing to stop and the email to be dropped. If the
/// action applies only to certain recipients, only those recipients are
/// dropped, and processing continues for other recipients.
///
/// @nodoc
class DropAction {
  DropAction();

  factory DropAction.fromJson(Map<String, dynamic> _) {
    return DropAction();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The action relays the email via SMTP to another specific SMTP server.
///
/// @nodoc
class RelayAction {
  /// The identifier of the relay resource to be used when relaying an email.
  final String relay;

  /// A policy that states what to do in the case of failure. The action will fail
  /// if there are configuration errors. For example, the specified relay has been
  /// deleted.
  final ActionFailurePolicy? actionFailurePolicy;

  /// This action specifies whether to preserve or replace original mail from
  /// address while relaying received emails to a destination server.
  final MailFrom? mailFrom;

  RelayAction({
    required this.relay,
    this.actionFailurePolicy,
    this.mailFrom,
  });

  factory RelayAction.fromJson(Map<String, dynamic> json) {
    return RelayAction(
      relay: (json['Relay'] as String?) ?? '',
      actionFailurePolicy: (json['ActionFailurePolicy'] as String?)
          ?.let(ActionFailurePolicy.fromString),
      mailFrom: (json['MailFrom'] as String?)?.let(MailFrom.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final relay = this.relay;
    final actionFailurePolicy = this.actionFailurePolicy;
    final mailFrom = this.mailFrom;
    return {
      'Relay': relay,
      if (actionFailurePolicy != null)
        'ActionFailurePolicy': actionFailurePolicy.value,
      if (mailFrom != null) 'MailFrom': mailFrom.value,
    };
  }
}

/// The action to archive the email by delivering the email to an Amazon SES
/// archive.
///
/// @nodoc
class ArchiveAction {
  /// The identifier of the archive to send the email to.
  final String targetArchive;

  /// A policy that states what to do in the case of failure. The action will fail
  /// if there are configuration errors. For example, the specified archive has
  /// been deleted.
  final ActionFailurePolicy? actionFailurePolicy;

  ArchiveAction({
    required this.targetArchive,
    this.actionFailurePolicy,
  });

  factory ArchiveAction.fromJson(Map<String, dynamic> json) {
    return ArchiveAction(
      targetArchive: (json['TargetArchive'] as String?) ?? '',
      actionFailurePolicy: (json['ActionFailurePolicy'] as String?)
          ?.let(ActionFailurePolicy.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final targetArchive = this.targetArchive;
    final actionFailurePolicy = this.actionFailurePolicy;
    return {
      'TargetArchive': targetArchive,
      if (actionFailurePolicy != null)
        'ActionFailurePolicy': actionFailurePolicy.value,
    };
  }
}

/// Writes the MIME content of the email to an S3 bucket.
///
/// @nodoc
class S3Action {
  /// The Amazon Resource Name (ARN) of the IAM Role to use while writing to S3.
  /// This role must have access to the s3:PutObject, kms:Encrypt, and
  /// kms:GenerateDataKey APIs for the given bucket.
  final String roleArn;

  /// The bucket name of the S3 bucket to write to.
  final String s3Bucket;

  /// A policy that states what to do in the case of failure. The action will fail
  /// if there are configuration errors. For example, the specified the bucket has
  /// been deleted.
  final ActionFailurePolicy? actionFailurePolicy;

  /// The S3 prefix to use for the write to the s3 bucket.
  final String? s3Prefix;

  /// The KMS Key ID to use to encrypt the message in S3.
  final String? s3SseKmsKeyId;

  S3Action({
    required this.roleArn,
    required this.s3Bucket,
    this.actionFailurePolicy,
    this.s3Prefix,
    this.s3SseKmsKeyId,
  });

  factory S3Action.fromJson(Map<String, dynamic> json) {
    return S3Action(
      roleArn: (json['RoleArn'] as String?) ?? '',
      s3Bucket: (json['S3Bucket'] as String?) ?? '',
      actionFailurePolicy: (json['ActionFailurePolicy'] as String?)
          ?.let(ActionFailurePolicy.fromString),
      s3Prefix: json['S3Prefix'] as String?,
      s3SseKmsKeyId: json['S3SseKmsKeyId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final roleArn = this.roleArn;
    final s3Bucket = this.s3Bucket;
    final actionFailurePolicy = this.actionFailurePolicy;
    final s3Prefix = this.s3Prefix;
    final s3SseKmsKeyId = this.s3SseKmsKeyId;
    return {
      'RoleArn': roleArn,
      'S3Bucket': s3Bucket,
      if (actionFailurePolicy != null)
        'ActionFailurePolicy': actionFailurePolicy.value,
      if (s3Prefix != null) 'S3Prefix': s3Prefix,
      if (s3SseKmsKeyId != null) 'S3SseKmsKeyId': s3SseKmsKeyId,
    };
  }
}

/// Sends the email to the internet using the ses:SendRawEmail API.
///
/// @nodoc
class SendAction {
  /// The Amazon Resource Name (ARN) of the role to use for this action. This role
  /// must have access to the ses:SendRawEmail API.
  final String roleArn;

  /// A policy that states what to do in the case of failure. The action will fail
  /// if there are configuration errors. For example, the caller does not have the
  /// permissions to call the sendRawEmail API.
  final ActionFailurePolicy? actionFailurePolicy;

  SendAction({
    required this.roleArn,
    this.actionFailurePolicy,
  });

  factory SendAction.fromJson(Map<String, dynamic> json) {
    return SendAction(
      roleArn: (json['RoleArn'] as String?) ?? '',
      actionFailurePolicy: (json['ActionFailurePolicy'] as String?)
          ?.let(ActionFailurePolicy.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final roleArn = this.roleArn;
    final actionFailurePolicy = this.actionFailurePolicy;
    return {
      'RoleArn': roleArn,
      if (actionFailurePolicy != null)
        'ActionFailurePolicy': actionFailurePolicy.value,
    };
  }
}

/// The action to add a header to a message. When executed, this action will add
/// the given header to the message.
///
/// @nodoc
class AddHeaderAction {
  /// The name of the header to add to an email. The header must be prefixed with
  /// "X-". Headers are added regardless of whether the header name pre-existed in
  /// the email.
  final String headerName;

  /// The value of the header to add to the email.
  final String headerValue;

  AddHeaderAction({
    required this.headerName,
    required this.headerValue,
  });

  factory AddHeaderAction.fromJson(Map<String, dynamic> json) {
    return AddHeaderAction(
      headerName: (json['HeaderName'] as String?) ?? '',
      headerValue: (json['HeaderValue'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final headerName = this.headerName;
    final headerValue = this.headerValue;
    return {
      'HeaderName': headerName,
      'HeaderValue': headerValue,
    };
  }
}

/// This action replaces the email envelope recipients with the given list of
/// recipients. If the condition of this action applies only to a subset of
/// recipients, only those recipients are replaced with the recipients specified
/// in the action. The message contents and headers are unaffected by this
/// action, only the envelope recipients are updated.
///
/// @nodoc
class ReplaceRecipientAction {
  /// This action specifies the replacement recipient email addresses to insert.
  final List<String>? replaceWith;

  ReplaceRecipientAction({
    this.replaceWith,
  });

  factory ReplaceRecipientAction.fromJson(Map<String, dynamic> json) {
    return ReplaceRecipientAction(
      replaceWith: (json['ReplaceWith'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final replaceWith = this.replaceWith;
    return {
      if (replaceWith != null) 'ReplaceWith': replaceWith,
    };
  }
}

/// This action to delivers an email to a mailbox.
///
/// @nodoc
class DeliverToMailboxAction {
  /// The Amazon Resource Name (ARN) of a WorkMail organization to deliver the
  /// email to.
  final String mailboxArn;

  /// The Amazon Resource Name (ARN) of an IAM role to use to execute this action.
  /// The role must have access to the workmail:DeliverToMailbox API.
  final String roleArn;

  /// A policy that states what to do in the case of failure. The action will fail
  /// if there are configuration errors. For example, the mailbox ARN is no longer
  /// valid.
  final ActionFailurePolicy? actionFailurePolicy;

  DeliverToMailboxAction({
    required this.mailboxArn,
    required this.roleArn,
    this.actionFailurePolicy,
  });

  factory DeliverToMailboxAction.fromJson(Map<String, dynamic> json) {
    return DeliverToMailboxAction(
      mailboxArn: (json['MailboxArn'] as String?) ?? '',
      roleArn: (json['RoleArn'] as String?) ?? '',
      actionFailurePolicy: (json['ActionFailurePolicy'] as String?)
          ?.let(ActionFailurePolicy.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final mailboxArn = this.mailboxArn;
    final roleArn = this.roleArn;
    final actionFailurePolicy = this.actionFailurePolicy;
    return {
      'MailboxArn': mailboxArn,
      'RoleArn': roleArn,
      if (actionFailurePolicy != null)
        'ActionFailurePolicy': actionFailurePolicy.value,
    };
  }
}

/// The action to deliver incoming emails to an Amazon Q Business application
/// for indexing.
///
/// @nodoc
class DeliverToQBusinessAction {
  /// The unique identifier of the Amazon Q Business application instance where
  /// the email content will be delivered.
  final String applicationId;

  /// The identifier of the knowledge base index within the Amazon Q Business
  /// application where the email content will be stored and indexed.
  final String indexId;

  /// The Amazon Resource Name (ARN) of the IAM Role to use while delivering to
  /// Amazon Q Business. This role must have access to the
  /// <code>qbusiness:BatchPutDocument</code> API for the given application and
  /// index.
  final String roleArn;

  /// A policy that states what to do in the case of failure. The action will fail
  /// if there are configuration errors. For example, the specified application
  /// has been deleted or the role lacks necessary permissions to call the
  /// <code>qbusiness:BatchPutDocument</code> API.
  final ActionFailurePolicy? actionFailurePolicy;

  DeliverToQBusinessAction({
    required this.applicationId,
    required this.indexId,
    required this.roleArn,
    this.actionFailurePolicy,
  });

  factory DeliverToQBusinessAction.fromJson(Map<String, dynamic> json) {
    return DeliverToQBusinessAction(
      applicationId: (json['ApplicationId'] as String?) ?? '',
      indexId: (json['IndexId'] as String?) ?? '',
      roleArn: (json['RoleArn'] as String?) ?? '',
      actionFailurePolicy: (json['ActionFailurePolicy'] as String?)
          ?.let(ActionFailurePolicy.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final indexId = this.indexId;
    final roleArn = this.roleArn;
    final actionFailurePolicy = this.actionFailurePolicy;
    return {
      'ApplicationId': applicationId,
      'IndexId': indexId,
      'RoleArn': roleArn,
      if (actionFailurePolicy != null)
        'ActionFailurePolicy': actionFailurePolicy.value,
    };
  }
}

/// The action to publish the email content to an Amazon SNS topic. When
/// executed, this action will send the email as a notification to the specified
/// SNS topic.
///
/// @nodoc
class SnsAction {
  /// The Amazon Resource Name (ARN) of the IAM Role to use while writing to
  /// Amazon SNS. This role must have access to the <code>sns:Publish</code> API
  /// for the given topic.
  final String roleArn;

  /// The Amazon Resource Name (ARN) of the Amazon SNS Topic to which notification
  /// for the email received will be published.
  final String topicArn;

  /// A policy that states what to do in the case of failure. The action will fail
  /// if there are configuration errors. For example, specified SNS topic has been
  /// deleted or the role lacks necessary permissions to call the
  /// <code>sns:Publish</code> API.
  final ActionFailurePolicy? actionFailurePolicy;

  /// The encoding to use for the email within the Amazon SNS notification. The
  /// default value is <code>UTF-8</code>. Use <code>BASE64</code> if you need to
  /// preserve all special characters, especially when the original message uses a
  /// different encoding format.
  final SnsNotificationEncoding? encoding;

  /// The expected payload type within the Amazon SNS notification.
  /// <code>CONTENT</code> attempts to publish the full email content with 20KB of
  /// headers content. <code>HEADERS</code> extracts up to 100KB of header content
  /// to include in the notification, email content will not be included to the
  /// notification. The default value is <code>CONTENT</code>.
  final SnsNotificationPayloadType? payloadType;

  SnsAction({
    required this.roleArn,
    required this.topicArn,
    this.actionFailurePolicy,
    this.encoding,
    this.payloadType,
  });

  factory SnsAction.fromJson(Map<String, dynamic> json) {
    return SnsAction(
      roleArn: (json['RoleArn'] as String?) ?? '',
      topicArn: (json['TopicArn'] as String?) ?? '',
      actionFailurePolicy: (json['ActionFailurePolicy'] as String?)
          ?.let(ActionFailurePolicy.fromString),
      encoding: (json['Encoding'] as String?)
          ?.let(SnsNotificationEncoding.fromString),
      payloadType: (json['PayloadType'] as String?)
          ?.let(SnsNotificationPayloadType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final roleArn = this.roleArn;
    final topicArn = this.topicArn;
    final actionFailurePolicy = this.actionFailurePolicy;
    final encoding = this.encoding;
    final payloadType = this.payloadType;
    return {
      'RoleArn': roleArn,
      'TopicArn': topicArn,
      if (actionFailurePolicy != null)
        'ActionFailurePolicy': actionFailurePolicy.value,
      if (encoding != null) 'Encoding': encoding.value,
      if (payloadType != null) 'PayloadType': payloadType.value,
    };
  }
}

/// The action to send a bounce response for the email. When executed, this
/// action generates a non-delivery report (bounce) back to the sender.
///
/// @nodoc
class BounceAction {
  /// The diagnostic message included in the Diagnostic-Code header of the bounce.
  final String diagnosticMessage;

  /// The Amazon Resource Name (ARN) of the IAM role to use to send the bounce
  /// message.
  final String roleArn;

  /// The sender email address of the bounce message.
  final String sender;

  /// The SMTP reply code for the bounce, as defined by RFC 5321.
  final String smtpReplyCode;

  /// The enhanced status code for the bounce, in the format of x.y.z (e.g.
  /// 5.1.1).
  final String statusCode;

  /// A policy that states what to do in the case of failure. The action will fail
  /// if there are configuration errors. For example, the caller does not have the
  /// permissions to call the SendBounce API.
  final ActionFailurePolicy? actionFailurePolicy;

  /// The human-readable text to include in the bounce message.
  final String? message;

  BounceAction({
    required this.diagnosticMessage,
    required this.roleArn,
    required this.sender,
    required this.smtpReplyCode,
    required this.statusCode,
    this.actionFailurePolicy,
    this.message,
  });

  factory BounceAction.fromJson(Map<String, dynamic> json) {
    return BounceAction(
      diagnosticMessage: (json['DiagnosticMessage'] as String?) ?? '',
      roleArn: (json['RoleArn'] as String?) ?? '',
      sender: (json['Sender'] as String?) ?? '',
      smtpReplyCode: (json['SmtpReplyCode'] as String?) ?? '',
      statusCode: (json['StatusCode'] as String?) ?? '',
      actionFailurePolicy: (json['ActionFailurePolicy'] as String?)
          ?.let(ActionFailurePolicy.fromString),
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final diagnosticMessage = this.diagnosticMessage;
    final roleArn = this.roleArn;
    final sender = this.sender;
    final smtpReplyCode = this.smtpReplyCode;
    final statusCode = this.statusCode;
    final actionFailurePolicy = this.actionFailurePolicy;
    final message = this.message;
    return {
      'DiagnosticMessage': diagnosticMessage,
      'RoleArn': roleArn,
      'Sender': sender,
      'SmtpReplyCode': smtpReplyCode,
      'StatusCode': statusCode,
      if (actionFailurePolicy != null)
        'ActionFailurePolicy': actionFailurePolicy.value,
      if (message != null) 'Message': message,
    };
  }
}

/// The action to invoke an Amazon Web Services Lambda function for processing
/// the email.
///
/// @nodoc
class InvokeLambdaAction {
  /// The Amazon Resource Name (ARN) of the Lambda function to invoke.
  final String functionArn;

  /// The invocation type of the Lambda function. Use EVENT for asynchronous
  /// invocation or REQUEST_RESPONSE for synchronous invocation.
  final LambdaInvocationType invocationType;

  /// The Amazon Resource Name (ARN) of the IAM role to use to invoke the Lambda
  /// function.
  final String roleArn;

  /// A policy that states what to do in the case of failure. The action will fail
  /// if there are configuration errors. For example, the Amazon Web Services
  /// Lambda function no longer exists.
  final ActionFailurePolicy? actionFailurePolicy;

  /// The maximum time in minutes that the email processing can be retried if the
  /// Lambda invocation fails. The maximum value is 2160 minutes (36 hours).
  final int? retryTimeMinutes;

  InvokeLambdaAction({
    required this.functionArn,
    required this.invocationType,
    required this.roleArn,
    this.actionFailurePolicy,
    this.retryTimeMinutes,
  });

  factory InvokeLambdaAction.fromJson(Map<String, dynamic> json) {
    return InvokeLambdaAction(
      functionArn: (json['FunctionArn'] as String?) ?? '',
      invocationType: LambdaInvocationType.fromString(
          (json['InvocationType'] as String?) ?? ''),
      roleArn: (json['RoleArn'] as String?) ?? '',
      actionFailurePolicy: (json['ActionFailurePolicy'] as String?)
          ?.let(ActionFailurePolicy.fromString),
      retryTimeMinutes: json['RetryTimeMinutes'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final functionArn = this.functionArn;
    final invocationType = this.invocationType;
    final roleArn = this.roleArn;
    final actionFailurePolicy = this.actionFailurePolicy;
    final retryTimeMinutes = this.retryTimeMinutes;
    return {
      'FunctionArn': functionArn,
      'InvocationType': invocationType.value,
      'RoleArn': roleArn,
      if (actionFailurePolicy != null)
        'ActionFailurePolicy': actionFailurePolicy.value,
      if (retryTimeMinutes != null) 'RetryTimeMinutes': retryTimeMinutes,
    };
  }
}

/// @nodoc
class ActionFailurePolicy {
  static const $continue = ActionFailurePolicy._('CONTINUE');
  static const drop = ActionFailurePolicy._('DROP');

  final String value;

  const ActionFailurePolicy._(this.value);

  static const values = [$continue, drop];

  static ActionFailurePolicy fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ActionFailurePolicy._(value));

  @override
  bool operator ==(other) =>
      other is ActionFailurePolicy && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class LambdaInvocationType {
  static const event = LambdaInvocationType._('EVENT');
  static const requestResponse = LambdaInvocationType._('REQUEST_RESPONSE');

  final String value;

  const LambdaInvocationType._(this.value);

  static const values = [event, requestResponse];

  static LambdaInvocationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => LambdaInvocationType._(value));

  @override
  bool operator ==(other) =>
      other is LambdaInvocationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class SnsNotificationEncoding {
  static const utf_8 = SnsNotificationEncoding._('UTF-8');
  static const base64 = SnsNotificationEncoding._('BASE64');

  final String value;

  const SnsNotificationEncoding._(this.value);

  static const values = [utf_8, base64];

  static SnsNotificationEncoding fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SnsNotificationEncoding._(value));

  @override
  bool operator ==(other) =>
      other is SnsNotificationEncoding && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class SnsNotificationPayloadType {
  static const headers = SnsNotificationPayloadType._('HEADERS');
  static const content = SnsNotificationPayloadType._('CONTENT');

  final String value;

  const SnsNotificationPayloadType._(this.value);

  static const values = [headers, content];

  static SnsNotificationPayloadType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SnsNotificationPayloadType._(value));

  @override
  bool operator ==(other) =>
      other is SnsNotificationPayloadType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class MailFrom {
  static const replace = MailFrom._('REPLACE');
  static const preserve = MailFrom._('PRESERVE');

  final String value;

  const MailFrom._(this.value);

  static const values = [replace, preserve];

  static MailFrom fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => MailFrom._(value));

  @override
  bool operator ==(other) => other is MailFrom && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The conditional expression used to evaluate an email for determining if a
/// rule action should be taken.
///
/// @nodoc
class RuleCondition {
  /// The condition applies to a boolean expression passed in this field.
  final RuleBooleanExpression? booleanExpression;

  /// The condition applies to a DMARC policy expression passed in this field.
  final RuleDmarcExpression? dmarcExpression;

  /// The condition applies to an IP address expression passed in this field.
  final RuleIpExpression? ipExpression;

  /// The condition applies to a number expression passed in this field.
  final RuleNumberExpression? numberExpression;

  /// The condition applies to a string expression passed in this field.
  final RuleStringExpression? stringExpression;

  /// The condition applies to a verdict expression passed in this field.
  final RuleVerdictExpression? verdictExpression;

  RuleCondition({
    this.booleanExpression,
    this.dmarcExpression,
    this.ipExpression,
    this.numberExpression,
    this.stringExpression,
    this.verdictExpression,
  });

  factory RuleCondition.fromJson(Map<String, dynamic> json) {
    return RuleCondition(
      booleanExpression: json['BooleanExpression'] != null
          ? RuleBooleanExpression.fromJson(
              json['BooleanExpression'] as Map<String, dynamic>)
          : null,
      dmarcExpression: json['DmarcExpression'] != null
          ? RuleDmarcExpression.fromJson(
              json['DmarcExpression'] as Map<String, dynamic>)
          : null,
      ipExpression: json['IpExpression'] != null
          ? RuleIpExpression.fromJson(
              json['IpExpression'] as Map<String, dynamic>)
          : null,
      numberExpression: json['NumberExpression'] != null
          ? RuleNumberExpression.fromJson(
              json['NumberExpression'] as Map<String, dynamic>)
          : null,
      stringExpression: json['StringExpression'] != null
          ? RuleStringExpression.fromJson(
              json['StringExpression'] as Map<String, dynamic>)
          : null,
      verdictExpression: json['VerdictExpression'] != null
          ? RuleVerdictExpression.fromJson(
              json['VerdictExpression'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final booleanExpression = this.booleanExpression;
    final dmarcExpression = this.dmarcExpression;
    final ipExpression = this.ipExpression;
    final numberExpression = this.numberExpression;
    final stringExpression = this.stringExpression;
    final verdictExpression = this.verdictExpression;
    return {
      if (booleanExpression != null) 'BooleanExpression': booleanExpression,
      if (dmarcExpression != null) 'DmarcExpression': dmarcExpression,
      if (ipExpression != null) 'IpExpression': ipExpression,
      if (numberExpression != null) 'NumberExpression': numberExpression,
      if (stringExpression != null) 'StringExpression': stringExpression,
      if (verdictExpression != null) 'VerdictExpression': verdictExpression,
    };
  }
}

/// A boolean expression to be used in a rule condition.
///
/// @nodoc
class RuleBooleanExpression {
  /// The operand on which to perform a boolean condition operation.
  final RuleBooleanToEvaluate evaluate;

  /// The matching operator for a boolean condition expression.
  final RuleBooleanOperator operator;

  RuleBooleanExpression({
    required this.evaluate,
    required this.operator,
  });

  factory RuleBooleanExpression.fromJson(Map<String, dynamic> json) {
    return RuleBooleanExpression(
      evaluate: RuleBooleanToEvaluate.fromJson(
          (json['Evaluate'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      operator:
          RuleBooleanOperator.fromString((json['Operator'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final evaluate = this.evaluate;
    final operator = this.operator;
    return {
      'Evaluate': evaluate,
      'Operator': operator.value,
    };
  }
}

/// A string expression is evaluated against strings or substrings of the email.
///
/// @nodoc
class RuleStringExpression {
  /// The string to evaluate in a string condition expression.
  final RuleStringToEvaluate evaluate;

  /// The matching operator for a string condition expression.
  final RuleStringOperator operator;

  /// The string(s) to be evaluated in a string condition expression. For all
  /// operators, except for NOT_EQUALS, if multiple values are given, the values
  /// are processed as an OR. That is, if any of the values match the email's
  /// string using the given operator, the condition is deemed to match. However,
  /// for NOT_EQUALS, the condition is only deemed to match if none of the given
  /// strings match the email's string.
  final List<String> values;

  RuleStringExpression({
    required this.evaluate,
    required this.operator,
    required this.values,
  });

  factory RuleStringExpression.fromJson(Map<String, dynamic> json) {
    return RuleStringExpression(
      evaluate: RuleStringToEvaluate.fromJson(
          (json['Evaluate'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      operator:
          RuleStringOperator.fromString((json['Operator'] as String?) ?? ''),
      values: ((json['Values'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final evaluate = this.evaluate;
    final operator = this.operator;
    final values = this.values;
    return {
      'Evaluate': evaluate,
      'Operator': operator.value,
      'Values': values,
    };
  }
}

/// A number expression to match numeric conditions with integers from the
/// incoming email.
///
/// @nodoc
class RuleNumberExpression {
  /// The number to evaluate in a numeric condition expression.
  final RuleNumberToEvaluate evaluate;

  /// The operator for a numeric condition expression.
  final RuleNumberOperator operator;

  /// The value to evaluate in a numeric condition expression.
  final double value;

  RuleNumberExpression({
    required this.evaluate,
    required this.operator,
    required this.value,
  });

  factory RuleNumberExpression.fromJson(Map<String, dynamic> json) {
    return RuleNumberExpression(
      evaluate: RuleNumberToEvaluate.fromJson(
          (json['Evaluate'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      operator:
          RuleNumberOperator.fromString((json['Operator'] as String?) ?? ''),
      value: (json['Value'] as double?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final evaluate = this.evaluate;
    final operator = this.operator;
    final value = this.value;
    return {
      'Evaluate': evaluate,
      'Operator': operator.value,
      'Value': value,
    };
  }
}

/// An IP address expression matching certain IP addresses within a given range
/// of IP addresses.
///
/// @nodoc
class RuleIpExpression {
  /// The IP address to evaluate in this condition.
  final RuleIpToEvaluate evaluate;

  /// The operator to evaluate the IP address.
  final RuleIpOperator operator;

  /// The IP CIDR blocks in format "x.y.z.w/n" (eg 10.0.0.0/8) to match with the
  /// email's IP address. For the operator CIDR_MATCHES, if multiple values are
  /// given, they are evaluated as an OR. That is, if the IP address is contained
  /// within any of the given CIDR ranges, the condition is deemed to match. For
  /// NOT_CIDR_MATCHES, if multiple CIDR ranges are given, the condition is deemed
  /// to match if the IP address is not contained in any of the given CIDR ranges.
  final List<String> values;

  RuleIpExpression({
    required this.evaluate,
    required this.operator,
    required this.values,
  });

  factory RuleIpExpression.fromJson(Map<String, dynamic> json) {
    return RuleIpExpression(
      evaluate: RuleIpToEvaluate.fromJson(
          (json['Evaluate'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      operator: RuleIpOperator.fromString((json['Operator'] as String?) ?? ''),
      values: ((json['Values'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final evaluate = this.evaluate;
    final operator = this.operator;
    final values = this.values;
    return {
      'Evaluate': evaluate,
      'Operator': operator.value,
      'Values': values,
    };
  }
}

/// A verdict expression is evaluated against verdicts of the email.
///
/// @nodoc
class RuleVerdictExpression {
  /// The verdict to evaluate in a verdict condition expression.
  final RuleVerdictToEvaluate evaluate;

  /// The matching operator for a verdict condition expression.
  final RuleVerdictOperator operator;

  /// The values to match with the email's verdict using the given operator. For
  /// the EQUALS operator, if multiple values are given, the condition is deemed
  /// to match if any of the given verdicts match that of the email. For the
  /// NOT_EQUALS operator, if multiple values are given, the condition is deemed
  /// to match of none of the given verdicts match the verdict of the email.
  final List<RuleVerdict> values;

  RuleVerdictExpression({
    required this.evaluate,
    required this.operator,
    required this.values,
  });

  factory RuleVerdictExpression.fromJson(Map<String, dynamic> json) {
    return RuleVerdictExpression(
      evaluate: RuleVerdictToEvaluate.fromJson(
          (json['Evaluate'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      operator:
          RuleVerdictOperator.fromString((json['Operator'] as String?) ?? ''),
      values: ((json['Values'] as List?) ?? const [])
          .nonNulls
          .map((e) => RuleVerdict.fromString((e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final evaluate = this.evaluate;
    final operator = this.operator;
    final values = this.values;
    return {
      'Evaluate': evaluate,
      'Operator': operator.value,
      'Values': values.map((e) => e.value).toList(),
    };
  }
}

/// A DMARC policy expression. The condition matches if the given DMARC policy
/// matches that of the incoming email.
///
/// @nodoc
class RuleDmarcExpression {
  /// The operator to apply to the DMARC policy of the incoming email.
  final RuleDmarcOperator operator;

  /// The values to use for the given DMARC policy operator. For the operator
  /// EQUALS, if multiple values are given, they are evaluated as an OR. That is,
  /// if any of the given values match, the condition is deemed to match. For the
  /// operator NOT_EQUALS, if multiple values are given, they are evaluated as an
  /// AND. That is, only if the email's DMARC policy is not equal to any of the
  /// given values, then the condition is deemed to match.
  final List<RuleDmarcPolicy> values;

  RuleDmarcExpression({
    required this.operator,
    required this.values,
  });

  factory RuleDmarcExpression.fromJson(Map<String, dynamic> json) {
    return RuleDmarcExpression(
      operator:
          RuleDmarcOperator.fromString((json['Operator'] as String?) ?? ''),
      values: ((json['Values'] as List?) ?? const [])
          .nonNulls
          .map((e) => RuleDmarcPolicy.fromString((e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final operator = this.operator;
    final values = this.values;
    return {
      'Operator': operator.value,
      'Values': values.map((e) => e.value).toList(),
    };
  }
}

/// @nodoc
class RuleDmarcOperator {
  static const equals = RuleDmarcOperator._('EQUALS');
  static const notEquals = RuleDmarcOperator._('NOT_EQUALS');

  final String value;

  const RuleDmarcOperator._(this.value);

  static const values = [equals, notEquals];

  static RuleDmarcOperator fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RuleDmarcOperator._(value));

  @override
  bool operator ==(other) => other is RuleDmarcOperator && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class RuleDmarcPolicy {
  static const none = RuleDmarcPolicy._('NONE');
  static const quarantine = RuleDmarcPolicy._('QUARANTINE');
  static const reject = RuleDmarcPolicy._('REJECT');

  final String value;

  const RuleDmarcPolicy._(this.value);

  static const values = [none, quarantine, reject];

  static RuleDmarcPolicy fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RuleDmarcPolicy._(value));

  @override
  bool operator ==(other) => other is RuleDmarcPolicy && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The verdict to evaluate in a verdict condition expression.
///
/// @nodoc
class RuleVerdictToEvaluate {
  /// The Add On ARN and its returned value to evaluate in a verdict condition
  /// expression.
  final Analysis? analysis;

  /// The email verdict attribute to evaluate in a string verdict expression.
  final RuleVerdictAttribute? attribute;

  RuleVerdictToEvaluate({
    this.analysis,
    this.attribute,
  });

  factory RuleVerdictToEvaluate.fromJson(Map<String, dynamic> json) {
    return RuleVerdictToEvaluate(
      analysis: json['Analysis'] != null
          ? Analysis.fromJson(json['Analysis'] as Map<String, dynamic>)
          : null,
      attribute:
          (json['Attribute'] as String?)?.let(RuleVerdictAttribute.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final analysis = this.analysis;
    final attribute = this.attribute;
    return {
      if (analysis != null) 'Analysis': analysis,
      if (attribute != null) 'Attribute': attribute.value,
    };
  }
}

/// @nodoc
class RuleVerdictOperator {
  static const equals = RuleVerdictOperator._('EQUALS');
  static const notEquals = RuleVerdictOperator._('NOT_EQUALS');

  final String value;

  const RuleVerdictOperator._(this.value);

  static const values = [equals, notEquals];

  static RuleVerdictOperator fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RuleVerdictOperator._(value));

  @override
  bool operator ==(other) =>
      other is RuleVerdictOperator && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class RuleVerdict {
  static const pass = RuleVerdict._('PASS');
  static const fail = RuleVerdict._('FAIL');
  static const gray = RuleVerdict._('GRAY');
  static const processingFailed = RuleVerdict._('PROCESSING_FAILED');

  final String value;

  const RuleVerdict._(this.value);

  static const values = [pass, fail, gray, processingFailed];

  static RuleVerdict fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => RuleVerdict._(value));

  @override
  bool operator ==(other) => other is RuleVerdict && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class RuleVerdictAttribute {
  static const spf = RuleVerdictAttribute._('SPF');
  static const dkim = RuleVerdictAttribute._('DKIM');

  final String value;

  const RuleVerdictAttribute._(this.value);

  static const values = [spf, dkim];

  static RuleVerdictAttribute fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RuleVerdictAttribute._(value));

  @override
  bool operator ==(other) =>
      other is RuleVerdictAttribute && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The result of an analysis can be used in conditions to trigger actions.
/// Analyses can inspect the email content and report a certain aspect of the
/// email.
///
/// @nodoc
class Analysis {
  /// The Amazon Resource Name (ARN) of an Add On.
  final String analyzer;

  /// The returned value from an Add On.
  final String resultField;

  Analysis({
    required this.analyzer,
    required this.resultField,
  });

  factory Analysis.fromJson(Map<String, dynamic> json) {
    return Analysis(
      analyzer: (json['Analyzer'] as String?) ?? '',
      resultField: (json['ResultField'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final analyzer = this.analyzer;
    final resultField = this.resultField;
    return {
      'Analyzer': analyzer,
      'ResultField': resultField,
    };
  }
}

/// The IP address to evaluate for this condition.
///
/// @nodoc
class RuleIpToEvaluate {
  /// The attribute of the email to evaluate.
  final RuleIpEmailAttribute? attribute;

  RuleIpToEvaluate({
    this.attribute,
  });

  factory RuleIpToEvaluate.fromJson(Map<String, dynamic> json) {
    return RuleIpToEvaluate(
      attribute:
          (json['Attribute'] as String?)?.let(RuleIpEmailAttribute.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final attribute = this.attribute;
    return {
      if (attribute != null) 'Attribute': attribute.value,
    };
  }
}

/// @nodoc
class RuleIpOperator {
  static const cidrMatches = RuleIpOperator._('CIDR_MATCHES');
  static const notCidrMatches = RuleIpOperator._('NOT_CIDR_MATCHES');

  final String value;

  const RuleIpOperator._(this.value);

  static const values = [cidrMatches, notCidrMatches];

  static RuleIpOperator fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RuleIpOperator._(value));

  @override
  bool operator ==(other) => other is RuleIpOperator && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class RuleIpEmailAttribute {
  static const sourceIp = RuleIpEmailAttribute._('SOURCE_IP');

  final String value;

  const RuleIpEmailAttribute._(this.value);

  static const values = [sourceIp];

  static RuleIpEmailAttribute fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RuleIpEmailAttribute._(value));

  @override
  bool operator ==(other) =>
      other is RuleIpEmailAttribute && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The number to evaluate in a numeric condition expression.
///
/// @nodoc
class RuleNumberToEvaluate {
  /// An email attribute that is used as the number to evaluate.
  final RuleNumberEmailAttribute? attribute;

  RuleNumberToEvaluate({
    this.attribute,
  });

  factory RuleNumberToEvaluate.fromJson(Map<String, dynamic> json) {
    return RuleNumberToEvaluate(
      attribute: (json['Attribute'] as String?)
          ?.let(RuleNumberEmailAttribute.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final attribute = this.attribute;
    return {
      if (attribute != null) 'Attribute': attribute.value,
    };
  }
}

/// @nodoc
class RuleNumberOperator {
  static const equals = RuleNumberOperator._('EQUALS');
  static const notEquals = RuleNumberOperator._('NOT_EQUALS');
  static const lessThan = RuleNumberOperator._('LESS_THAN');
  static const greaterThan = RuleNumberOperator._('GREATER_THAN');
  static const lessThanOrEqual = RuleNumberOperator._('LESS_THAN_OR_EQUAL');
  static const greaterThanOrEqual =
      RuleNumberOperator._('GREATER_THAN_OR_EQUAL');

  final String value;

  const RuleNumberOperator._(this.value);

  static const values = [
    equals,
    notEquals,
    lessThan,
    greaterThan,
    lessThanOrEqual,
    greaterThanOrEqual
  ];

  static RuleNumberOperator fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RuleNumberOperator._(value));

  @override
  bool operator ==(other) =>
      other is RuleNumberOperator && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class RuleNumberEmailAttribute {
  static const messageSize = RuleNumberEmailAttribute._('MESSAGE_SIZE');

  final String value;

  const RuleNumberEmailAttribute._(this.value);

  static const values = [messageSize];

  static RuleNumberEmailAttribute fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RuleNumberEmailAttribute._(value));

  @override
  bool operator ==(other) =>
      other is RuleNumberEmailAttribute && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The string to evaluate in a string condition expression.
///
/// @nodoc
class RuleStringToEvaluate {
  /// The Add On ARN and its returned value to evaluate in a string condition
  /// expression.
  final Analysis? analysis;

  /// The email attribute to evaluate in a string condition expression.
  final RuleStringEmailAttribute? attribute;

  /// The client certificate attribute to evaluate in a string condition
  /// expression.
  final RuleClientCertificateAttribute? clientCertificateAttribute;

  /// The email MIME X-Header attribute to evaluate in a string condition
  /// expression.
  final String? mimeHeaderAttribute;

  RuleStringToEvaluate({
    this.analysis,
    this.attribute,
    this.clientCertificateAttribute,
    this.mimeHeaderAttribute,
  });

  factory RuleStringToEvaluate.fromJson(Map<String, dynamic> json) {
    return RuleStringToEvaluate(
      analysis: json['Analysis'] != null
          ? Analysis.fromJson(json['Analysis'] as Map<String, dynamic>)
          : null,
      attribute: (json['Attribute'] as String?)
          ?.let(RuleStringEmailAttribute.fromString),
      clientCertificateAttribute:
          (json['ClientCertificateAttribute'] as String?)
              ?.let(RuleClientCertificateAttribute.fromString),
      mimeHeaderAttribute: json['MimeHeaderAttribute'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final analysis = this.analysis;
    final attribute = this.attribute;
    final clientCertificateAttribute = this.clientCertificateAttribute;
    final mimeHeaderAttribute = this.mimeHeaderAttribute;
    return {
      if (analysis != null) 'Analysis': analysis,
      if (attribute != null) 'Attribute': attribute.value,
      if (clientCertificateAttribute != null)
        'ClientCertificateAttribute': clientCertificateAttribute.value,
      if (mimeHeaderAttribute != null)
        'MimeHeaderAttribute': mimeHeaderAttribute,
    };
  }
}

/// @nodoc
class RuleStringOperator {
  static const equals = RuleStringOperator._('EQUALS');
  static const notEquals = RuleStringOperator._('NOT_EQUALS');
  static const startsWith = RuleStringOperator._('STARTS_WITH');
  static const endsWith = RuleStringOperator._('ENDS_WITH');
  static const contains = RuleStringOperator._('CONTAINS');

  final String value;

  const RuleStringOperator._(this.value);

  static const values = [equals, notEquals, startsWith, endsWith, contains];

  static RuleStringOperator fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RuleStringOperator._(value));

  @override
  bool operator ==(other) =>
      other is RuleStringOperator && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class RuleStringEmailAttribute {
  static const mailFrom = RuleStringEmailAttribute._('MAIL_FROM');
  static const helo = RuleStringEmailAttribute._('HELO');
  static const recipient = RuleStringEmailAttribute._('RECIPIENT');
  static const sender = RuleStringEmailAttribute._('SENDER');
  static const from = RuleStringEmailAttribute._('FROM');
  static const subject = RuleStringEmailAttribute._('SUBJECT');
  static const to = RuleStringEmailAttribute._('TO');
  static const cc = RuleStringEmailAttribute._('CC');

  final String value;

  const RuleStringEmailAttribute._(this.value);

  static const values = [
    mailFrom,
    helo,
    recipient,
    sender,
    from,
    subject,
    to,
    cc
  ];

  static RuleStringEmailAttribute fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RuleStringEmailAttribute._(value));

  @override
  bool operator ==(other) =>
      other is RuleStringEmailAttribute && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The client certificate attribute to evaluate in a rule condition. These
/// attributes are extracted from the client certificate presented during mutual
/// TLS authentication.
///
/// @nodoc
class RuleClientCertificateAttribute {
  static const cn = RuleClientCertificateAttribute._('CN');
  static const sanRfc822Name =
      RuleClientCertificateAttribute._('SAN_RFC822_NAME');
  static const sanDnsName = RuleClientCertificateAttribute._('SAN_DNS_NAME');
  static const sanDirectoryName =
      RuleClientCertificateAttribute._('SAN_DIRECTORY_NAME');
  static const sanUniformResourceIdentifier =
      RuleClientCertificateAttribute._('SAN_UNIFORM_RESOURCE_IDENTIFIER');
  static const sanIpAddress =
      RuleClientCertificateAttribute._('SAN_IP_ADDRESS');
  static const sanRegisteredId =
      RuleClientCertificateAttribute._('SAN_REGISTERED_ID');
  static const serialNumber = RuleClientCertificateAttribute._('SERIAL_NUMBER');

  final String value;

  const RuleClientCertificateAttribute._(this.value);

  static const values = [
    cn,
    sanRfc822Name,
    sanDnsName,
    sanDirectoryName,
    sanUniformResourceIdentifier,
    sanIpAddress,
    sanRegisteredId,
    serialNumber
  ];

  static RuleClientCertificateAttribute fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RuleClientCertificateAttribute._(value));

  @override
  bool operator ==(other) =>
      other is RuleClientCertificateAttribute && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The union type representing the allowed types of operands for a boolean
/// condition.
///
/// @nodoc
class RuleBooleanToEvaluate {
  /// The Add On ARN and its returned value to evaluate in a boolean condition
  /// expression.
  final Analysis? analysis;

  /// The boolean type representing the allowed attribute types for an email.
  final RuleBooleanEmailAttribute? attribute;

  /// The structure representing the address lists and address list attribute that
  /// will be used in evaluation of boolean expression.
  final RuleIsInAddressList? isInAddressList;

  RuleBooleanToEvaluate({
    this.analysis,
    this.attribute,
    this.isInAddressList,
  });

  factory RuleBooleanToEvaluate.fromJson(Map<String, dynamic> json) {
    return RuleBooleanToEvaluate(
      analysis: json['Analysis'] != null
          ? Analysis.fromJson(json['Analysis'] as Map<String, dynamic>)
          : null,
      attribute: (json['Attribute'] as String?)
          ?.let(RuleBooleanEmailAttribute.fromString),
      isInAddressList: json['IsInAddressList'] != null
          ? RuleIsInAddressList.fromJson(
              json['IsInAddressList'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final analysis = this.analysis;
    final attribute = this.attribute;
    final isInAddressList = this.isInAddressList;
    return {
      if (analysis != null) 'Analysis': analysis,
      if (attribute != null) 'Attribute': attribute.value,
      if (isInAddressList != null) 'IsInAddressList': isInAddressList,
    };
  }
}

/// @nodoc
class RuleBooleanOperator {
  static const isTrue = RuleBooleanOperator._('IS_TRUE');
  static const isFalse = RuleBooleanOperator._('IS_FALSE');

  final String value;

  const RuleBooleanOperator._(this.value);

  static const values = [isTrue, isFalse];

  static RuleBooleanOperator fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RuleBooleanOperator._(value));

  @override
  bool operator ==(other) =>
      other is RuleBooleanOperator && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class RuleBooleanEmailAttribute {
  static const readReceiptRequested =
      RuleBooleanEmailAttribute._('READ_RECEIPT_REQUESTED');
  static const tls = RuleBooleanEmailAttribute._('TLS');
  static const tlsWrapped = RuleBooleanEmailAttribute._('TLS_WRAPPED');

  final String value;

  const RuleBooleanEmailAttribute._(this.value);

  static const values = [readReceiptRequested, tls, tlsWrapped];

  static RuleBooleanEmailAttribute fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RuleBooleanEmailAttribute._(value));

  @override
  bool operator ==(other) =>
      other is RuleBooleanEmailAttribute && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The structure type for a boolean condition that provides the address lists
/// and address list attribute to evaluate.
///
/// @nodoc
class RuleIsInAddressList {
  /// The address lists that will be used for evaluation.
  final List<String> addressLists;

  /// The email attribute that needs to be evaluated against the address list.
  final RuleAddressListEmailAttribute attribute;

  RuleIsInAddressList({
    required this.addressLists,
    required this.attribute,
  });

  factory RuleIsInAddressList.fromJson(Map<String, dynamic> json) {
    return RuleIsInAddressList(
      addressLists: ((json['AddressLists'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      attribute: RuleAddressListEmailAttribute.fromString(
          (json['Attribute'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final addressLists = this.addressLists;
    final attribute = this.attribute;
    return {
      'AddressLists': addressLists,
      'Attribute': attribute.value,
    };
  }
}

/// @nodoc
class RuleAddressListEmailAttribute {
  static const recipient = RuleAddressListEmailAttribute._('RECIPIENT');
  static const mailFrom = RuleAddressListEmailAttribute._('MAIL_FROM');
  static const sender = RuleAddressListEmailAttribute._('SENDER');
  static const from = RuleAddressListEmailAttribute._('FROM');
  static const to = RuleAddressListEmailAttribute._('TO');
  static const cc = RuleAddressListEmailAttribute._('CC');

  final String value;

  const RuleAddressListEmailAttribute._(this.value);

  static const values = [recipient, mailFrom, sender, from, to, cc];

  static RuleAddressListEmailAttribute fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RuleAddressListEmailAttribute._(value));

  @override
  bool operator ==(other) =>
      other is RuleAddressListEmailAttribute && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The relay resource that can be used as a rule to relay receiving emails to
/// the destination relay server.
///
/// @nodoc
class Relay {
  /// The timestamp of when the relay was last modified.
  final DateTime? lastModifiedTimestamp;

  /// The unique relay identifier.
  final String? relayId;

  /// The unique relay name.
  final String? relayName;

  Relay({
    this.lastModifiedTimestamp,
    this.relayId,
    this.relayName,
  });

  factory Relay.fromJson(Map<String, dynamic> json) {
    return Relay(
      lastModifiedTimestamp: timeStampFromJson(json['LastModifiedTimestamp']),
      relayId: json['RelayId'] as String?,
      relayName: json['RelayName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lastModifiedTimestamp = this.lastModifiedTimestamp;
    final relayId = this.relayId;
    final relayName = this.relayName;
    return {
      if (lastModifiedTimestamp != null)
        'LastModifiedTimestamp': unixTimestampToJson(lastModifiedTimestamp),
      if (relayId != null) 'RelayId': relayId,
      if (relayName != null) 'RelayName': relayName,
    };
  }
}

/// Authentication for the relay destination server—specify the secretARN where
/// the SMTP credentials are stored, or specify an empty NoAuthentication
/// structure if the relay destination server does not require SMTP credential
/// authentication.
///
/// @nodoc
class RelayAuthentication {
  /// Keep an empty structure if the relay destination server does not require
  /// SMTP credential authentication.
  final NoAuthentication? noAuthentication;

  /// The ARN of the secret created in secrets manager where the relay server's
  /// SMTP credentials are stored.
  final String? secretArn;

  RelayAuthentication({
    this.noAuthentication,
    this.secretArn,
  });

  factory RelayAuthentication.fromJson(Map<String, dynamic> json) {
    return RelayAuthentication(
      noAuthentication: json['NoAuthentication'] != null
          ? NoAuthentication.fromJson(
              json['NoAuthentication'] as Map<String, dynamic>)
          : null,
      secretArn: json['SecretArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final noAuthentication = this.noAuthentication;
    final secretArn = this.secretArn;
    return {
      if (noAuthentication != null) 'NoAuthentication': noAuthentication,
      if (secretArn != null) 'SecretArn': secretArn,
    };
  }
}

/// Explicitly indicate that the relay destination server does not require SMTP
/// credential authentication.
///
/// @nodoc
class NoAuthentication {
  NoAuthentication();

  factory NoAuthentication.fromJson(Map<String, dynamic> _) {
    return NoAuthentication();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The structure of an ingress endpoint resource.
///
/// @nodoc
class IngressPoint {
  /// The identifier of the ingress endpoint resource.
  final String ingressPointId;

  /// A user friendly name for the ingress endpoint resource.
  final String ingressPointName;

  /// The status of the ingress endpoint resource.
  final IngressPointStatus status;

  /// The type of ingress endpoint resource.
  final IngressPointType type;

  /// The DNS A Record that identifies your ingress endpoint. Configure your DNS
  /// Mail Exchange (MX) record with this value to route emails to Mail Manager.
  final String? aRecord;

  IngressPoint({
    required this.ingressPointId,
    required this.ingressPointName,
    required this.status,
    required this.type,
    this.aRecord,
  });

  factory IngressPoint.fromJson(Map<String, dynamic> json) {
    return IngressPoint(
      ingressPointId: (json['IngressPointId'] as String?) ?? '',
      ingressPointName: (json['IngressPointName'] as String?) ?? '',
      status: IngressPointStatus.fromString((json['Status'] as String?) ?? ''),
      type: IngressPointType.fromString((json['Type'] as String?) ?? ''),
      aRecord: json['ARecord'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ingressPointId = this.ingressPointId;
    final ingressPointName = this.ingressPointName;
    final status = this.status;
    final type = this.type;
    final aRecord = this.aRecord;
    return {
      'IngressPointId': ingressPointId,
      'IngressPointName': ingressPointName,
      'Status': status.value,
      'Type': type.value,
      if (aRecord != null) 'ARecord': aRecord,
    };
  }
}

/// @nodoc
class IngressPointStatus {
  static const provisioning = IngressPointStatus._('PROVISIONING');
  static const deprovisioning = IngressPointStatus._('DEPROVISIONING');
  static const updating = IngressPointStatus._('UPDATING');
  static const active = IngressPointStatus._('ACTIVE');
  static const closed = IngressPointStatus._('CLOSED');
  static const failed = IngressPointStatus._('FAILED');
  static const associatedVpcEndpointDoesNotExist =
      IngressPointStatus._('ASSOCIATED_VPC_ENDPOINT_DOES_NOT_EXIST');

  final String value;

  const IngressPointStatus._(this.value);

  static const values = [
    provisioning,
    deprovisioning,
    updating,
    active,
    closed,
    failed,
    associatedVpcEndpointDoesNotExist
  ];

  static IngressPointStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => IngressPointStatus._(value));

  @override
  bool operator ==(other) =>
      other is IngressPointStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class IngressPointType {
  static const open = IngressPointType._('OPEN');
  static const auth = IngressPointType._('AUTH');
  static const mtls = IngressPointType._('MTLS');

  final String value;

  const IngressPointType._(this.value);

  static const values = [open, auth, mtls];

  static IngressPointType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => IngressPointType._(value));

  @override
  bool operator ==(other) => other is IngressPointType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class IngressPointStatusToUpdate {
  static const active = IngressPointStatusToUpdate._('ACTIVE');
  static const closed = IngressPointStatusToUpdate._('CLOSED');

  final String value;

  const IngressPointStatusToUpdate._(this.value);

  static const values = [active, closed];

  static IngressPointStatusToUpdate fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => IngressPointStatusToUpdate._(value));

  @override
  bool operator ==(other) =>
      other is IngressPointStatusToUpdate && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The configuration of the ingress endpoint resource.
///
/// @nodoc
class IngressPointConfiguration {
  /// The SecretsManager::Secret ARN of the ingress endpoint resource.
  final String? secretArn;

  /// The password of the ingress endpoint resource.
  final String? smtpPassword;

  /// The mutual TLS authentication configuration of the ingress endpoint
  /// resource.
  final TlsAuthConfiguration? tlsAuthConfiguration;

  IngressPointConfiguration({
    this.secretArn,
    this.smtpPassword,
    this.tlsAuthConfiguration,
  });

  Map<String, dynamic> toJson() {
    final secretArn = this.secretArn;
    final smtpPassword = this.smtpPassword;
    final tlsAuthConfiguration = this.tlsAuthConfiguration;
    return {
      if (secretArn != null) 'SecretArn': secretArn,
      if (smtpPassword != null) 'SmtpPassword': smtpPassword,
      if (tlsAuthConfiguration != null)
        'TlsAuthConfiguration': tlsAuthConfiguration,
    };
  }
}

/// @nodoc
class TlsPolicy {
  static const required = TlsPolicy._('REQUIRED');
  static const optional = TlsPolicy._('OPTIONAL');
  static const fips = TlsPolicy._('FIPS');

  final String value;

  const TlsPolicy._(this.value);

  static const values = [required, optional, fips];

  static TlsPolicy fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => TlsPolicy._(value));

  @override
  bool operator ==(other) => other is TlsPolicy && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The mutual TLS authentication configuration for an ingress endpoint.
///
/// @nodoc
class TlsAuthConfiguration {
  /// The trust store configuration for mutual TLS authentication.
  final TrustStore? trustStore;

  TlsAuthConfiguration({
    this.trustStore,
  });

  factory TlsAuthConfiguration.fromJson(Map<String, dynamic> json) {
    return TlsAuthConfiguration(
      trustStore: json['TrustStore'] != null
          ? TrustStore.fromJson(json['TrustStore'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final trustStore = this.trustStore;
    return {
      if (trustStore != null) 'TrustStore': trustStore,
    };
  }
}

/// The trust store used for mutual TLS authentication. It contains the
/// certificate authority (CA) certificates and optional certificate revocation
/// list (CRL).
///
/// @nodoc
class TrustStore {
  /// The PEM-encoded certificate authority (CA) certificates bundle for the trust
  /// store.
  final String cAContent;

  /// The PEM-encoded certificate revocation lists (CRLs) for the trust store.
  /// There can be one CRL per certificate authority (CA) in the trust store.
  final String? crlContent;

  /// The Amazon Resource Name (ARN) of the KMS key used to encrypt the trust
  /// store contents.
  final String? kmsKeyArn;

  TrustStore({
    required this.cAContent,
    this.crlContent,
    this.kmsKeyArn,
  });

  factory TrustStore.fromJson(Map<String, dynamic> json) {
    return TrustStore(
      cAContent: (json['CAContent'] as String?) ?? '',
      crlContent: json['CrlContent'] as String?,
      kmsKeyArn: json['KmsKeyArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cAContent = this.cAContent;
    final crlContent = this.crlContent;
    final kmsKeyArn = this.kmsKeyArn;
    return {
      'CAContent': cAContent,
      if (crlContent != null) 'CrlContent': crlContent,
      if (kmsKeyArn != null) 'KmsKeyArn': kmsKeyArn,
    };
  }
}

/// The authentication configuration for the ingress endpoint resource.
///
/// @nodoc
class IngressPointAuthConfiguration {
  /// The ingress endpoint password configuration for the ingress endpoint
  /// resource.
  final IngressPointPasswordConfiguration? ingressPointPasswordConfiguration;

  /// The ingress endpoint SecretsManager::Secret ARN configuration for the
  /// ingress endpoint resource.
  final String? secretArn;

  /// The mutual TLS authentication configuration for the ingress endpoint
  /// resource.
  final TlsAuthConfiguration? tlsAuthConfiguration;

  IngressPointAuthConfiguration({
    this.ingressPointPasswordConfiguration,
    this.secretArn,
    this.tlsAuthConfiguration,
  });

  factory IngressPointAuthConfiguration.fromJson(Map<String, dynamic> json) {
    return IngressPointAuthConfiguration(
      ingressPointPasswordConfiguration:
          json['IngressPointPasswordConfiguration'] != null
              ? IngressPointPasswordConfiguration.fromJson(
                  json['IngressPointPasswordConfiguration']
                      as Map<String, dynamic>)
              : null,
      secretArn: json['SecretArn'] as String?,
      tlsAuthConfiguration: json['TlsAuthConfiguration'] != null
          ? TlsAuthConfiguration.fromJson(
              json['TlsAuthConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final ingressPointPasswordConfiguration =
        this.ingressPointPasswordConfiguration;
    final secretArn = this.secretArn;
    final tlsAuthConfiguration = this.tlsAuthConfiguration;
    return {
      if (ingressPointPasswordConfiguration != null)
        'IngressPointPasswordConfiguration': ingressPointPasswordConfiguration,
      if (secretArn != null) 'SecretArn': secretArn,
      if (tlsAuthConfiguration != null)
        'TlsAuthConfiguration': tlsAuthConfiguration,
    };
  }
}

/// The network type (IPv4-only, Dual-Stack, PrivateLink) of the ingress
/// endpoint resource.
///
/// @nodoc
class NetworkConfiguration {
  /// Specifies the network configuration for the private ingress point.
  final PrivateNetworkConfiguration? privateNetworkConfiguration;

  /// Specifies the network configuration for the public ingress point.
  final PublicNetworkConfiguration? publicNetworkConfiguration;

  NetworkConfiguration({
    this.privateNetworkConfiguration,
    this.publicNetworkConfiguration,
  });

  factory NetworkConfiguration.fromJson(Map<String, dynamic> json) {
    return NetworkConfiguration(
      privateNetworkConfiguration: json['PrivateNetworkConfiguration'] != null
          ? PrivateNetworkConfiguration.fromJson(
              json['PrivateNetworkConfiguration'] as Map<String, dynamic>)
          : null,
      publicNetworkConfiguration: json['PublicNetworkConfiguration'] != null
          ? PublicNetworkConfiguration.fromJson(
              json['PublicNetworkConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final privateNetworkConfiguration = this.privateNetworkConfiguration;
    final publicNetworkConfiguration = this.publicNetworkConfiguration;
    return {
      if (privateNetworkConfiguration != null)
        'PrivateNetworkConfiguration': privateNetworkConfiguration,
      if (publicNetworkConfiguration != null)
        'PublicNetworkConfiguration': publicNetworkConfiguration,
    };
  }
}

/// Specifies the network configuration for the public ingress point.
///
/// @nodoc
class PublicNetworkConfiguration {
  /// The IP address type for the public ingress point. Valid values are IPV4 and
  /// DUAL_STACK.
  final IpType ipType;

  PublicNetworkConfiguration({
    required this.ipType,
  });

  factory PublicNetworkConfiguration.fromJson(Map<String, dynamic> json) {
    return PublicNetworkConfiguration(
      ipType: IpType.fromString((json['IpType'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final ipType = this.ipType;
    return {
      'IpType': ipType.value,
    };
  }
}

/// Specifies the network configuration for the private ingress point.
///
/// @nodoc
class PrivateNetworkConfiguration {
  /// The identifier of the VPC endpoint to associate with this private ingress
  /// point.
  final String vpcEndpointId;

  PrivateNetworkConfiguration({
    required this.vpcEndpointId,
  });

  factory PrivateNetworkConfiguration.fromJson(Map<String, dynamic> json) {
    return PrivateNetworkConfiguration(
      vpcEndpointId: (json['VpcEndpointId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final vpcEndpointId = this.vpcEndpointId;
    return {
      'VpcEndpointId': vpcEndpointId,
    };
  }
}

/// @nodoc
class IpType {
  static const ipv4 = IpType._('IPV4');
  static const dualStack = IpType._('DUAL_STACK');

  final String value;

  const IpType._(this.value);

  static const values = [ipv4, dualStack];

  static IpType fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => IpType._(value));

  @override
  bool operator ==(other) => other is IpType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The password configuration of the ingress endpoint resource.
///
/// @nodoc
class IngressPointPasswordConfiguration {
  /// The previous password expiry timestamp of the ingress endpoint resource.
  final DateTime? previousSmtpPasswordExpiryTimestamp;

  /// The previous password version of the ingress endpoint resource.
  final String? previousSmtpPasswordVersion;

  /// The current password expiry timestamp of the ingress endpoint resource.
  final String? smtpPasswordVersion;

  IngressPointPasswordConfiguration({
    this.previousSmtpPasswordExpiryTimestamp,
    this.previousSmtpPasswordVersion,
    this.smtpPasswordVersion,
  });

  factory IngressPointPasswordConfiguration.fromJson(
      Map<String, dynamic> json) {
    return IngressPointPasswordConfiguration(
      previousSmtpPasswordExpiryTimestamp:
          timeStampFromJson(json['PreviousSmtpPasswordExpiryTimestamp']),
      previousSmtpPasswordVersion:
          json['PreviousSmtpPasswordVersion'] as String?,
      smtpPasswordVersion: json['SmtpPasswordVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final previousSmtpPasswordExpiryTimestamp =
        this.previousSmtpPasswordExpiryTimestamp;
    final previousSmtpPasswordVersion = this.previousSmtpPasswordVersion;
    final smtpPasswordVersion = this.smtpPasswordVersion;
    return {
      if (previousSmtpPasswordExpiryTimestamp != null)
        'PreviousSmtpPasswordExpiryTimestamp':
            unixTimestampToJson(previousSmtpPasswordExpiryTimestamp),
      if (previousSmtpPasswordVersion != null)
        'PreviousSmtpPasswordVersion': previousSmtpPasswordVersion,
      if (smtpPasswordVersion != null)
        'SmtpPasswordVersion': smtpPasswordVersion,
    };
  }
}

/// Specifies whether to include trust store contents in the GetIngressPoint
/// response.
///
/// @nodoc
class TrustStoreResponseOption {
  static const exclude = TrustStoreResponseOption._('EXCLUDE');
  static const include = TrustStoreResponseOption._('INCLUDE');

  final String value;

  const TrustStoreResponseOption._(this.value);

  static const values = [exclude, include];

  static TrustStoreResponseOption fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TrustStoreResponseOption._(value));

  @override
  bool operator ==(other) =>
      other is TrustStoreResponseOption && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An archive resource for storing and retaining emails.
///
/// @nodoc
class Archive {
  /// The unique identifier of the archive.
  final String archiveId;

  /// The unique name assigned to the archive.
  final String? archiveName;

  /// The current state of the archive:
  ///
  /// <ul>
  /// <li>
  /// <code>ACTIVE</code> – The archive is ready and available for use.
  /// </li>
  /// <li>
  /// <code>PENDING_DELETION</code> – The archive has been marked for deletion and
  /// will be permanently deleted in 30 days. No further modifications can be made
  /// in this state.
  /// </li>
  /// </ul>
  final ArchiveState? archiveState;

  /// The timestamp of when the archive was last updated.
  final DateTime? lastUpdatedTimestamp;

  Archive({
    required this.archiveId,
    this.archiveName,
    this.archiveState,
    this.lastUpdatedTimestamp,
  });

  factory Archive.fromJson(Map<String, dynamic> json) {
    return Archive(
      archiveId: (json['ArchiveId'] as String?) ?? '',
      archiveName: json['ArchiveName'] as String?,
      archiveState:
          (json['ArchiveState'] as String?)?.let(ArchiveState.fromString),
      lastUpdatedTimestamp: timeStampFromJson(json['LastUpdatedTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final archiveId = this.archiveId;
    final archiveName = this.archiveName;
    final archiveState = this.archiveState;
    final lastUpdatedTimestamp = this.lastUpdatedTimestamp;
    return {
      'ArchiveId': archiveId,
      if (archiveName != null) 'ArchiveName': archiveName,
      if (archiveState != null) 'ArchiveState': archiveState.value,
      if (lastUpdatedTimestamp != null)
        'LastUpdatedTimestamp': unixTimestampToJson(lastUpdatedTimestamp),
    };
  }
}

/// @nodoc
class ArchiveState {
  static const active = ArchiveState._('ACTIVE');
  static const pendingDeletion = ArchiveState._('PENDING_DELETION');

  final String value;

  const ArchiveState._(this.value);

  static const values = [active, pendingDeletion];

  static ArchiveState fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ArchiveState._(value));

  @override
  bool operator ==(other) => other is ArchiveState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The retention policy for an email archive that specifies how long emails are
/// kept before being automatically deleted.
///
/// @nodoc
class ArchiveRetention {
  /// The enum value sets the period for retaining emails in an archive.
  final RetentionPeriod? retentionPeriod;

  ArchiveRetention({
    this.retentionPeriod,
  });

  factory ArchiveRetention.fromJson(Map<String, dynamic> json) {
    return ArchiveRetention(
      retentionPeriod:
          (json['RetentionPeriod'] as String?)?.let(RetentionPeriod.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final retentionPeriod = this.retentionPeriod;
    return {
      if (retentionPeriod != null) 'RetentionPeriod': retentionPeriod.value,
    };
  }
}

/// @nodoc
class RetentionPeriod {
  static const threeMonths = RetentionPeriod._('THREE_MONTHS');
  static const sixMonths = RetentionPeriod._('SIX_MONTHS');
  static const nineMonths = RetentionPeriod._('NINE_MONTHS');
  static const oneYear = RetentionPeriod._('ONE_YEAR');
  static const eighteenMonths = RetentionPeriod._('EIGHTEEN_MONTHS');
  static const twoYears = RetentionPeriod._('TWO_YEARS');
  static const thirtyMonths = RetentionPeriod._('THIRTY_MONTHS');
  static const threeYears = RetentionPeriod._('THREE_YEARS');
  static const fourYears = RetentionPeriod._('FOUR_YEARS');
  static const fiveYears = RetentionPeriod._('FIVE_YEARS');
  static const sixYears = RetentionPeriod._('SIX_YEARS');
  static const sevenYears = RetentionPeriod._('SEVEN_YEARS');
  static const eightYears = RetentionPeriod._('EIGHT_YEARS');
  static const nineYears = RetentionPeriod._('NINE_YEARS');
  static const tenYears = RetentionPeriod._('TEN_YEARS');
  static const permanent = RetentionPeriod._('PERMANENT');

  final String value;

  const RetentionPeriod._(this.value);

  static const values = [
    threeMonths,
    sixMonths,
    nineMonths,
    oneYear,
    eighteenMonths,
    twoYears,
    thirtyMonths,
    threeYears,
    fourYears,
    fiveYears,
    sixYears,
    sevenYears,
    eightYears,
    nineYears,
    tenYears,
    permanent
  ];

  static RetentionPeriod fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RetentionPeriod._(value));

  @override
  bool operator ==(other) => other is RetentionPeriod && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An address list contains a list of emails and domains that are used in
/// MailManager Ingress endpoints and Rules for email management.
///
/// @nodoc
class AddressList {
  /// The Amazon Resource Name (ARN) of the address list.
  final String addressListArn;

  /// The identifier of the address list.
  final String addressListId;

  /// The user-friendly name of the address list.
  final String addressListName;

  /// The timestamp of when the address list was created.
  final DateTime createdTimestamp;

  /// The timestamp of when the address list was last updated.
  final DateTime lastUpdatedTimestamp;

  AddressList({
    required this.addressListArn,
    required this.addressListId,
    required this.addressListName,
    required this.createdTimestamp,
    required this.lastUpdatedTimestamp,
  });

  factory AddressList.fromJson(Map<String, dynamic> json) {
    return AddressList(
      addressListArn: (json['AddressListArn'] as String?) ?? '',
      addressListId: (json['AddressListId'] as String?) ?? '',
      addressListName: (json['AddressListName'] as String?) ?? '',
      createdTimestamp:
          nonNullableTimeStampFromJson(json['CreatedTimestamp'] ?? 0),
      lastUpdatedTimestamp:
          nonNullableTimeStampFromJson(json['LastUpdatedTimestamp'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final addressListArn = this.addressListArn;
    final addressListId = this.addressListId;
    final addressListName = this.addressListName;
    final createdTimestamp = this.createdTimestamp;
    final lastUpdatedTimestamp = this.lastUpdatedTimestamp;
    return {
      'AddressListArn': addressListArn,
      'AddressListId': addressListId,
      'AddressListName': addressListName,
      'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      'LastUpdatedTimestamp': unixTimestampToJson(lastUpdatedTimestamp),
    };
  }
}

/// A subscription for an Add On representing the acceptance of its terms of use
/// and additional pricing.
///
/// @nodoc
class AddonSubscription {
  /// The name of the Add On.
  final String? addonName;

  /// The Amazon Resource Name (ARN) of the Add On subscription.
  final String? addonSubscriptionArn;

  /// The unique ID of the Add On subscription.
  final String? addonSubscriptionId;

  /// The timestamp of when the Add On subscription was created.
  final DateTime? createdTimestamp;

  AddonSubscription({
    this.addonName,
    this.addonSubscriptionArn,
    this.addonSubscriptionId,
    this.createdTimestamp,
  });

  factory AddonSubscription.fromJson(Map<String, dynamic> json) {
    return AddonSubscription(
      addonName: json['AddonName'] as String?,
      addonSubscriptionArn: json['AddonSubscriptionArn'] as String?,
      addonSubscriptionId: json['AddonSubscriptionId'] as String?,
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final addonName = this.addonName;
    final addonSubscriptionArn = this.addonSubscriptionArn;
    final addonSubscriptionId = this.addonSubscriptionId;
    final createdTimestamp = this.createdTimestamp;
    return {
      if (addonName != null) 'AddonName': addonName,
      if (addonSubscriptionArn != null)
        'AddonSubscriptionArn': addonSubscriptionArn,
      if (addonSubscriptionId != null)
        'AddonSubscriptionId': addonSubscriptionId,
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
    };
  }
}

/// An Add On instance represents a specific configuration of an Add On.
///
/// @nodoc
class AddonInstance {
  /// The Amazon Resource Name (ARN) of the Add On instance.
  final String? addonInstanceArn;

  /// The unique ID of the Add On instance.
  final String? addonInstanceId;

  /// The name of the Add On for the instance.
  final String? addonName;

  /// The subscription ID for the instance.
  final String? addonSubscriptionId;

  /// The timestamp of when the Add On instance was created.
  final DateTime? createdTimestamp;

  AddonInstance({
    this.addonInstanceArn,
    this.addonInstanceId,
    this.addonName,
    this.addonSubscriptionId,
    this.createdTimestamp,
  });

  factory AddonInstance.fromJson(Map<String, dynamic> json) {
    return AddonInstance(
      addonInstanceArn: json['AddonInstanceArn'] as String?,
      addonInstanceId: json['AddonInstanceId'] as String?,
      addonName: json['AddonName'] as String?,
      addonSubscriptionId: json['AddonSubscriptionId'] as String?,
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final addonInstanceArn = this.addonInstanceArn;
    final addonInstanceId = this.addonInstanceId;
    final addonName = this.addonName;
    final addonSubscriptionId = this.addonSubscriptionId;
    final createdTimestamp = this.createdTimestamp;
    return {
      if (addonInstanceArn != null) 'AddonInstanceArn': addonInstanceArn,
      if (addonInstanceId != null) 'AddonInstanceId': addonInstanceId,
      if (addonName != null) 'AddonName': addonName,
      if (addonSubscriptionId != null)
        'AddonSubscriptionId': addonSubscriptionId,
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
    };
  }
}

/// A set of filter conditions to include and/or exclude emails.
///
/// @nodoc
class ArchiveFilters {
  /// The filter conditions for emails to include.
  final List<ArchiveFilterCondition>? include;

  /// The filter conditions for emails to exclude.
  final List<ArchiveFilterCondition>? unless;

  ArchiveFilters({
    this.include,
    this.unless,
  });

  factory ArchiveFilters.fromJson(Map<String, dynamic> json) {
    return ArchiveFilters(
      include: (json['Include'] as List?)
          ?.nonNulls
          .map(
              (e) => ArchiveFilterCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
      unless: (json['Unless'] as List?)
          ?.nonNulls
          .map(
              (e) => ArchiveFilterCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final include = this.include;
    final unless = this.unless;
    return {
      if (include != null) 'Include': include,
      if (unless != null) 'Unless': unless,
    };
  }
}

/// A filter condition used to include or exclude emails when exporting from or
/// searching an archive.
///
/// @nodoc
class ArchiveFilterCondition {
  /// A boolean expression to evaluate against email attributes.
  final ArchiveBooleanExpression? booleanExpression;

  /// A string expression to evaluate against email attributes.
  final ArchiveStringExpression? stringExpression;

  ArchiveFilterCondition({
    this.booleanExpression,
    this.stringExpression,
  });

  factory ArchiveFilterCondition.fromJson(Map<String, dynamic> json) {
    return ArchiveFilterCondition(
      booleanExpression: json['BooleanExpression'] != null
          ? ArchiveBooleanExpression.fromJson(
              json['BooleanExpression'] as Map<String, dynamic>)
          : null,
      stringExpression: json['StringExpression'] != null
          ? ArchiveStringExpression.fromJson(
              json['StringExpression'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final booleanExpression = this.booleanExpression;
    final stringExpression = this.stringExpression;
    return {
      if (booleanExpression != null) 'BooleanExpression': booleanExpression,
      if (stringExpression != null) 'StringExpression': stringExpression,
    };
  }
}

/// A string expression to evaluate an email attribute value against one or more
/// string values.
///
/// @nodoc
class ArchiveStringExpression {
  /// The attribute of the email to evaluate.
  final ArchiveStringToEvaluate evaluate;

  /// The operator to use when evaluating the string values.
  final ArchiveStringOperator operator;

  /// The list of string values to evaluate the email attribute against.
  final List<String> values;

  ArchiveStringExpression({
    required this.evaluate,
    required this.operator,
    required this.values,
  });

  factory ArchiveStringExpression.fromJson(Map<String, dynamic> json) {
    return ArchiveStringExpression(
      evaluate: ArchiveStringToEvaluate.fromJson(
          (json['Evaluate'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      operator:
          ArchiveStringOperator.fromString((json['Operator'] as String?) ?? ''),
      values: ((json['Values'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final evaluate = this.evaluate;
    final operator = this.operator;
    final values = this.values;
    return {
      'Evaluate': evaluate,
      'Operator': operator.value,
      'Values': values,
    };
  }
}

/// A boolean expression to evaluate email attribute values.
///
/// @nodoc
class ArchiveBooleanExpression {
  /// The email attribute value to evaluate.
  final ArchiveBooleanToEvaluate evaluate;

  /// The boolean operator to use for evaluation.
  final ArchiveBooleanOperator operator;

  ArchiveBooleanExpression({
    required this.evaluate,
    required this.operator,
  });

  factory ArchiveBooleanExpression.fromJson(Map<String, dynamic> json) {
    return ArchiveBooleanExpression(
      evaluate: ArchiveBooleanToEvaluate.fromJson(
          (json['Evaluate'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      operator: ArchiveBooleanOperator.fromString(
          (json['Operator'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final evaluate = this.evaluate;
    final operator = this.operator;
    return {
      'Evaluate': evaluate,
      'Operator': operator.value,
    };
  }
}

/// The attribute to evaluate in a boolean expression.
///
/// @nodoc
class ArchiveBooleanToEvaluate {
  /// The name of the email attribute to evaluate.
  final ArchiveBooleanEmailAttribute? attribute;

  ArchiveBooleanToEvaluate({
    this.attribute,
  });

  factory ArchiveBooleanToEvaluate.fromJson(Map<String, dynamic> json) {
    return ArchiveBooleanToEvaluate(
      attribute: (json['Attribute'] as String?)
          ?.let(ArchiveBooleanEmailAttribute.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final attribute = this.attribute;
    return {
      if (attribute != null) 'Attribute': attribute.value,
    };
  }
}

/// @nodoc
class ArchiveBooleanOperator {
  static const isTrue = ArchiveBooleanOperator._('IS_TRUE');
  static const isFalse = ArchiveBooleanOperator._('IS_FALSE');

  final String value;

  const ArchiveBooleanOperator._(this.value);

  static const values = [isTrue, isFalse];

  static ArchiveBooleanOperator fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ArchiveBooleanOperator._(value));

  @override
  bool operator ==(other) =>
      other is ArchiveBooleanOperator && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ArchiveBooleanEmailAttribute {
  static const hasAttachments =
      ArchiveBooleanEmailAttribute._('HAS_ATTACHMENTS');

  final String value;

  const ArchiveBooleanEmailAttribute._(this.value);

  static const values = [hasAttachments];

  static ArchiveBooleanEmailAttribute fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ArchiveBooleanEmailAttribute._(value));

  @override
  bool operator ==(other) =>
      other is ArchiveBooleanEmailAttribute && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Specifies the email attribute to evaluate in a string expression.
///
/// @nodoc
class ArchiveStringToEvaluate {
  /// The name of the email attribute to evaluate.
  final ArchiveStringEmailAttribute? attribute;

  ArchiveStringToEvaluate({
    this.attribute,
  });

  factory ArchiveStringToEvaluate.fromJson(Map<String, dynamic> json) {
    return ArchiveStringToEvaluate(
      attribute: (json['Attribute'] as String?)
          ?.let(ArchiveStringEmailAttribute.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final attribute = this.attribute;
    return {
      if (attribute != null) 'Attribute': attribute.value,
    };
  }
}

/// @nodoc
class ArchiveStringOperator {
  static const contains = ArchiveStringOperator._('CONTAINS');

  final String value;

  const ArchiveStringOperator._(this.value);

  static const values = [contains];

  static ArchiveStringOperator fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ArchiveStringOperator._(value));

  @override
  bool operator ==(other) =>
      other is ArchiveStringOperator && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ArchiveStringEmailAttribute {
  static const to = ArchiveStringEmailAttribute._('TO');
  static const from = ArchiveStringEmailAttribute._('FROM');
  static const cc = ArchiveStringEmailAttribute._('CC');
  static const subject = ArchiveStringEmailAttribute._('SUBJECT');
  static const envelopeTo = ArchiveStringEmailAttribute._('ENVELOPE_TO');
  static const envelopeFrom = ArchiveStringEmailAttribute._('ENVELOPE_FROM');

  final String value;

  const ArchiveStringEmailAttribute._(this.value);

  static const values = [to, from, cc, subject, envelopeTo, envelopeFrom];

  static ArchiveStringEmailAttribute fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ArchiveStringEmailAttribute._(value));

  @override
  bool operator ==(other) =>
      other is ArchiveStringEmailAttribute && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The destination configuration for delivering exported email data.
///
/// @nodoc
class ExportDestinationConfiguration {
  /// Configuration for delivering to an Amazon S3 bucket.
  final S3ExportDestinationConfiguration? s3;

  ExportDestinationConfiguration({
    this.s3,
  });

  factory ExportDestinationConfiguration.fromJson(Map<String, dynamic> json) {
    return ExportDestinationConfiguration(
      s3: json['S3'] != null
          ? S3ExportDestinationConfiguration.fromJson(
              json['S3'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final s3 = this.s3;
    return {
      if (s3 != null) 'S3': s3,
    };
  }
}

/// The configuration for exporting email data to an Amazon S3 bucket.
///
/// @nodoc
class S3ExportDestinationConfiguration {
  /// The S3 location to deliver the exported email data.
  final String? s3Location;

  S3ExportDestinationConfiguration({
    this.s3Location,
  });

  factory S3ExportDestinationConfiguration.fromJson(Map<String, dynamic> json) {
    return S3ExportDestinationConfiguration(
      s3Location: json['S3Location'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Location = this.s3Location;
    return {
      if (s3Location != null) 'S3Location': s3Location,
    };
  }
}

/// An address that is a member of an address list.
///
/// @nodoc
class SavedAddress {
  /// The email or domain that constitutes the address.
  final String address;

  /// The timestamp of when the address was added to the address list.
  final DateTime createdTimestamp;

  SavedAddress({
    required this.address,
    required this.createdTimestamp,
  });

  factory SavedAddress.fromJson(Map<String, dynamic> json) {
    return SavedAddress(
      address: (json['Address'] as String?) ?? '',
      createdTimestamp:
          nonNullableTimeStampFromJson(json['CreatedTimestamp'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final address = this.address;
    final createdTimestamp = this.createdTimestamp;
    return {
      'Address': address,
      'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
    };
  }
}

/// Filtering options for ListMembersOfAddressList operation.
///
/// @nodoc
class AddressFilter {
  /// Filter to limit the results to addresses having the provided prefix.
  final String? addressPrefix;

  AddressFilter({
    this.addressPrefix,
  });

  Map<String, dynamic> toJson() {
    final addressPrefix = this.addressPrefix;
    return {
      if (addressPrefix != null) 'AddressPrefix': addressPrefix,
    };
  }
}

/// Summary details of an archive search job.
///
/// @nodoc
class SearchSummary {
  /// The unique identifier of the search job.
  final String? searchId;

  /// The current status of the search job.
  final SearchStatus? status;

  SearchSummary({
    this.searchId,
    this.status,
  });

  factory SearchSummary.fromJson(Map<String, dynamic> json) {
    return SearchSummary(
      searchId: json['SearchId'] as String?,
      status: json['Status'] != null
          ? SearchStatus.fromJson(json['Status'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final searchId = this.searchId;
    final status = this.status;
    return {
      if (searchId != null) 'SearchId': searchId,
      if (status != null) 'Status': status,
    };
  }
}

/// The current status of an archive search job.
///
/// @nodoc
class SearchStatus {
  /// The timestamp of when the search completed (if finished).
  final DateTime? completionTimestamp;

  /// An error message if the search failed.
  final String? errorMessage;

  /// The current state of the search job.
  final SearchState? state;

  /// The timestamp of when the search was submitted.
  final DateTime? submissionTimestamp;

  SearchStatus({
    this.completionTimestamp,
    this.errorMessage,
    this.state,
    this.submissionTimestamp,
  });

  factory SearchStatus.fromJson(Map<String, dynamic> json) {
    return SearchStatus(
      completionTimestamp: timeStampFromJson(json['CompletionTimestamp']),
      errorMessage: json['ErrorMessage'] as String?,
      state: (json['State'] as String?)?.let(SearchState.fromString),
      submissionTimestamp: timeStampFromJson(json['SubmissionTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final completionTimestamp = this.completionTimestamp;
    final errorMessage = this.errorMessage;
    final state = this.state;
    final submissionTimestamp = this.submissionTimestamp;
    return {
      if (completionTimestamp != null)
        'CompletionTimestamp': unixTimestampToJson(completionTimestamp),
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (state != null) 'State': state.value,
      if (submissionTimestamp != null)
        'SubmissionTimestamp': unixTimestampToJson(submissionTimestamp),
    };
  }
}

/// @nodoc
class SearchState {
  static const queued = SearchState._('QUEUED');
  static const running = SearchState._('RUNNING');
  static const completed = SearchState._('COMPLETED');
  static const failed = SearchState._('FAILED');
  static const cancelled = SearchState._('CANCELLED');

  final String value;

  const SearchState._(this.value);

  static const values = [queued, running, completed, failed, cancelled];

  static SearchState fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => SearchState._(value));

  @override
  bool operator ==(other) => other is SearchState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Summary statuses of an archive export job.
///
/// @nodoc
class ExportSummary {
  /// The unique identifier of the export job.
  final String? exportId;

  /// The current status of the export job.
  final ExportStatus? status;

  ExportSummary({
    this.exportId,
    this.status,
  });

  factory ExportSummary.fromJson(Map<String, dynamic> json) {
    return ExportSummary(
      exportId: json['ExportId'] as String?,
      status: json['Status'] != null
          ? ExportStatus.fromJson(json['Status'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final exportId = this.exportId;
    final status = this.status;
    return {
      if (exportId != null) 'ExportId': exportId,
      if (status != null) 'Status': status,
    };
  }
}

/// The current status of an archive export job.
///
/// @nodoc
class ExportStatus {
  /// The timestamp of when the export job completed (if finished).
  final DateTime? completionTimestamp;

  /// An error message if the export job failed.
  final String? errorMessage;

  /// The current state of the export job.
  final ExportState? state;

  /// The timestamp of when the export job was submitted.
  final DateTime? submissionTimestamp;

  ExportStatus({
    this.completionTimestamp,
    this.errorMessage,
    this.state,
    this.submissionTimestamp,
  });

  factory ExportStatus.fromJson(Map<String, dynamic> json) {
    return ExportStatus(
      completionTimestamp: timeStampFromJson(json['CompletionTimestamp']),
      errorMessage: json['ErrorMessage'] as String?,
      state: (json['State'] as String?)?.let(ExportState.fromString),
      submissionTimestamp: timeStampFromJson(json['SubmissionTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final completionTimestamp = this.completionTimestamp;
    final errorMessage = this.errorMessage;
    final state = this.state;
    final submissionTimestamp = this.submissionTimestamp;
    return {
      if (completionTimestamp != null)
        'CompletionTimestamp': unixTimestampToJson(completionTimestamp),
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (state != null) 'State': state.value,
      if (submissionTimestamp != null)
        'SubmissionTimestamp': unixTimestampToJson(submissionTimestamp),
    };
  }
}

/// @nodoc
class ExportState {
  static const queued = ExportState._('QUEUED');
  static const preprocessing = ExportState._('PREPROCESSING');
  static const processing = ExportState._('PROCESSING');
  static const completed = ExportState._('COMPLETED');
  static const failed = ExportState._('FAILED');
  static const cancelled = ExportState._('CANCELLED');

  final String value;

  const ExportState._(this.value);

  static const values = [
    queued,
    preprocessing,
    processing,
    completed,
    failed,
    cancelled
  ];

  static ExportState fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ExportState._(value));

  @override
  bool operator ==(other) => other is ExportState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Details about an import job.
///
/// @nodoc
class ImportJob {
  /// The unique identifier of the address list the import job was created for.
  final String addressListId;

  /// The timestamp of when the import job was created.
  final DateTime createdTimestamp;

  /// The format of the input for the import job.
  final ImportDataFormat importDataFormat;

  /// The identifier of the import job.
  final String jobId;

  /// A user-friendly name for the import job.
  final String name;

  /// The pre-signed URL target for uploading the input file.
  final String preSignedUrl;

  /// The status of the import job.
  final ImportJobStatus status;

  /// The timestamp of when the import job was completed.
  final DateTime? completedTimestamp;

  /// The reason for failure of an import job.
  final String? error;

  /// The number of addresses in the input that failed to get imported into
  /// address list.
  final int? failedItemsCount;

  /// The number of addresses in the input that were successfully imported into
  /// the address list.
  final int? importedItemsCount;

  /// The timestamp of when the import job was started.
  final DateTime? startTimestamp;

  ImportJob({
    required this.addressListId,
    required this.createdTimestamp,
    required this.importDataFormat,
    required this.jobId,
    required this.name,
    required this.preSignedUrl,
    required this.status,
    this.completedTimestamp,
    this.error,
    this.failedItemsCount,
    this.importedItemsCount,
    this.startTimestamp,
  });

  factory ImportJob.fromJson(Map<String, dynamic> json) {
    return ImportJob(
      addressListId: (json['AddressListId'] as String?) ?? '',
      createdTimestamp:
          nonNullableTimeStampFromJson(json['CreatedTimestamp'] ?? 0),
      importDataFormat: ImportDataFormat.fromJson(
          (json['ImportDataFormat'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      jobId: (json['JobId'] as String?) ?? '',
      name: (json['Name'] as String?) ?? '',
      preSignedUrl: (json['PreSignedUrl'] as String?) ?? '',
      status: ImportJobStatus.fromString((json['Status'] as String?) ?? ''),
      completedTimestamp: timeStampFromJson(json['CompletedTimestamp']),
      error: json['Error'] as String?,
      failedItemsCount: json['FailedItemsCount'] as int?,
      importedItemsCount: json['ImportedItemsCount'] as int?,
      startTimestamp: timeStampFromJson(json['StartTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final addressListId = this.addressListId;
    final createdTimestamp = this.createdTimestamp;
    final importDataFormat = this.importDataFormat;
    final jobId = this.jobId;
    final name = this.name;
    final preSignedUrl = this.preSignedUrl;
    final status = this.status;
    final completedTimestamp = this.completedTimestamp;
    final error = this.error;
    final failedItemsCount = this.failedItemsCount;
    final importedItemsCount = this.importedItemsCount;
    final startTimestamp = this.startTimestamp;
    return {
      'AddressListId': addressListId,
      'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      'ImportDataFormat': importDataFormat,
      'JobId': jobId,
      'Name': name,
      'PreSignedUrl': preSignedUrl,
      'Status': status.value,
      if (completedTimestamp != null)
        'CompletedTimestamp': unixTimestampToJson(completedTimestamp),
      if (error != null) 'Error': error,
      if (failedItemsCount != null) 'FailedItemsCount': failedItemsCount,
      if (importedItemsCount != null) 'ImportedItemsCount': importedItemsCount,
      if (startTimestamp != null)
        'StartTimestamp': unixTimestampToJson(startTimestamp),
    };
  }
}

/// @nodoc
class ImportJobStatus {
  static const created = ImportJobStatus._('CREATED');
  static const processing = ImportJobStatus._('PROCESSING');
  static const completed = ImportJobStatus._('COMPLETED');
  static const failed = ImportJobStatus._('FAILED');
  static const stopped = ImportJobStatus._('STOPPED');

  final String value;

  const ImportJobStatus._(this.value);

  static const values = [created, processing, completed, failed, stopped];

  static ImportJobStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ImportJobStatus._(value));

  @override
  bool operator ==(other) => other is ImportJobStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The import data format contains the specifications of the input file that
/// would be passed to the address list import job.
///
/// @nodoc
class ImportDataFormat {
  /// The type of file that would be passed as an input for the address list
  /// import job.
  final ImportDataType importDataType;

  ImportDataFormat({
    required this.importDataType,
  });

  factory ImportDataFormat.fromJson(Map<String, dynamic> json) {
    return ImportDataFormat(
      importDataType:
          ImportDataType.fromString((json['ImportDataType'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final importDataType = this.importDataType;
    return {
      'ImportDataType': importDataType.value,
    };
  }
}

/// @nodoc
class ImportDataType {
  static const csv = ImportDataType._('CSV');
  static const json = ImportDataType._('JSON');

  final String value;

  const ImportDataType._(this.value);

  static const values = [csv, json];

  static ImportDataType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ImportDataType._(value));

  @override
  bool operator ==(other) => other is ImportDataType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A result row containing metadata for an archived email message.
///
/// @nodoc
class Row {
  /// The unique identifier of the archived message.
  final String? archivedMessageId;

  /// The email addresses in the CC header.
  final String? cc;

  /// The date the email was sent.
  final String? date;

  /// The SMTP envelope information of the email.
  final Envelope? envelope;

  /// The email address of the sender.
  final String? from;

  /// A flag indicating if the email has attachments.
  final bool? hasAttachments;

  /// The email message ID this is a reply to.
  final String? inReplyTo;

  /// The ID of the ingress endpoint through which the email was received.
  final String? ingressPointId;

  /// The unique message ID of the email.
  final String? messageId;

  /// The received headers from the email delivery path.
  final List<String>? receivedHeaders;

  /// The timestamp of when the email was received.
  final DateTime? receivedTimestamp;

  /// The name of the host from which the email was received.
  final String? senderHostname;

  /// <ul>
  /// <li>
  /// Mail archived with Mail Manager: The IP address of the client that connects
  /// to the ingress endpoint.
  /// </li>
  /// <li>
  /// Mail sent through a configuration set with the archiving option enabled: The
  /// IP address of the client that makes the SendEmail API call.
  /// </li>
  /// </ul>
  final String? senderIpAddress;

  /// Specifies the archived email source, identified by either a Rule Set's ARN
  /// with an Archive action, or a Configuration Set's Archive ARN.
  final String? sourceArn;

  /// The subject header value of the email.
  final String? subject;

  /// The email addresses in the To header.
  final String? to;

  /// The user agent that sent the email.
  final String? xMailer;

  /// The original user agent that sent the email.
  final String? xOriginalMailer;

  /// The priority level of the email.
  final String? xPriority;

  Row({
    this.archivedMessageId,
    this.cc,
    this.date,
    this.envelope,
    this.from,
    this.hasAttachments,
    this.inReplyTo,
    this.ingressPointId,
    this.messageId,
    this.receivedHeaders,
    this.receivedTimestamp,
    this.senderHostname,
    this.senderIpAddress,
    this.sourceArn,
    this.subject,
    this.to,
    this.xMailer,
    this.xOriginalMailer,
    this.xPriority,
  });

  factory Row.fromJson(Map<String, dynamic> json) {
    return Row(
      archivedMessageId: json['ArchivedMessageId'] as String?,
      cc: json['Cc'] as String?,
      date: json['Date'] as String?,
      envelope: json['Envelope'] != null
          ? Envelope.fromJson(json['Envelope'] as Map<String, dynamic>)
          : null,
      from: json['From'] as String?,
      hasAttachments: json['HasAttachments'] as bool?,
      inReplyTo: json['InReplyTo'] as String?,
      ingressPointId: json['IngressPointId'] as String?,
      messageId: json['MessageId'] as String?,
      receivedHeaders: (json['ReceivedHeaders'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      receivedTimestamp: timeStampFromJson(json['ReceivedTimestamp']),
      senderHostname: json['SenderHostname'] as String?,
      senderIpAddress: json['SenderIpAddress'] as String?,
      sourceArn: json['SourceArn'] as String?,
      subject: json['Subject'] as String?,
      to: json['To'] as String?,
      xMailer: json['XMailer'] as String?,
      xOriginalMailer: json['XOriginalMailer'] as String?,
      xPriority: json['XPriority'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final archivedMessageId = this.archivedMessageId;
    final cc = this.cc;
    final date = this.date;
    final envelope = this.envelope;
    final from = this.from;
    final hasAttachments = this.hasAttachments;
    final inReplyTo = this.inReplyTo;
    final ingressPointId = this.ingressPointId;
    final messageId = this.messageId;
    final receivedHeaders = this.receivedHeaders;
    final receivedTimestamp = this.receivedTimestamp;
    final senderHostname = this.senderHostname;
    final senderIpAddress = this.senderIpAddress;
    final sourceArn = this.sourceArn;
    final subject = this.subject;
    final to = this.to;
    final xMailer = this.xMailer;
    final xOriginalMailer = this.xOriginalMailer;
    final xPriority = this.xPriority;
    return {
      if (archivedMessageId != null) 'ArchivedMessageId': archivedMessageId,
      if (cc != null) 'Cc': cc,
      if (date != null) 'Date': date,
      if (envelope != null) 'Envelope': envelope,
      if (from != null) 'From': from,
      if (hasAttachments != null) 'HasAttachments': hasAttachments,
      if (inReplyTo != null) 'InReplyTo': inReplyTo,
      if (ingressPointId != null) 'IngressPointId': ingressPointId,
      if (messageId != null) 'MessageId': messageId,
      if (receivedHeaders != null) 'ReceivedHeaders': receivedHeaders,
      if (receivedTimestamp != null)
        'ReceivedTimestamp': unixTimestampToJson(receivedTimestamp),
      if (senderHostname != null) 'SenderHostname': senderHostname,
      if (senderIpAddress != null) 'SenderIpAddress': senderIpAddress,
      if (sourceArn != null) 'SourceArn': sourceArn,
      if (subject != null) 'Subject': subject,
      if (to != null) 'To': to,
      if (xMailer != null) 'XMailer': xMailer,
      if (xOriginalMailer != null) 'XOriginalMailer': xOriginalMailer,
      if (xPriority != null) 'XPriority': xPriority,
    };
  }
}

/// The SMTP envelope information of the email.
///
/// @nodoc
class Envelope {
  /// The RCPT FROM given by the host from which the email was received.
  final String? from;

  /// The HELO used by the host from which the email was received.
  final String? helo;

  /// All SMTP TO entries given by the host from which the email was received.
  final List<String>? to;

  Envelope({
    this.from,
    this.helo,
    this.to,
  });

  factory Envelope.fromJson(Map<String, dynamic> json) {
    return Envelope(
      from: json['From'] as String?,
      helo: json['Helo'] as String?,
      to: (json['To'] as List?)?.nonNulls.map((e) => e as String).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final from = this.from;
    final helo = this.helo;
    final to = this.to;
    return {
      if (from != null) 'From': from,
      if (helo != null) 'Helo': helo,
      if (to != null) 'To': to,
    };
  }
}

/// The textual body content of an email message.
///
/// @nodoc
class MessageBody {
  /// The HTML body content of the message.
  final String? html;

  /// A flag indicating if the email was malformed.
  final bool? messageMalformed;

  /// The plain text body content of the message.
  final String? text;

  MessageBody({
    this.html,
    this.messageMalformed,
    this.text,
  });

  factory MessageBody.fromJson(Map<String, dynamic> json) {
    return MessageBody(
      html: json['Html'] as String?,
      messageMalformed: json['MessageMalformed'] as bool?,
      text: json['Text'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final html = this.html;
    final messageMalformed = this.messageMalformed;
    final text = this.text;
    return {
      if (html != null) 'Html': html,
      if (messageMalformed != null) 'MessageMalformed': messageMalformed,
      if (text != null) 'Text': text,
    };
  }
}

/// The metadata about the email.
///
/// @nodoc
class Metadata {
  /// The name of the configuration set used when sent through a configuration set
  /// with archiving enabled.
  final String? configurationSet;

  /// The ID of the ingress endpoint through which the email was received.
  final String? ingressPointId;

  /// The ID of the rule set that processed the email.
  final String? ruleSetId;

  /// The name of the host from which the email was received.
  final String? senderHostname;

  /// The IP address of the host from which the email was received.
  final String? senderIpAddress;

  /// The name of the API call used when sent through a configuration set with
  /// archiving enabled.
  final String? sendingMethod;

  /// The name of the dedicated IP pool used when sent through a configuration set
  /// with archiving enabled.
  final String? sendingPool;

  /// Specifies the archived email source, identified by either a Rule Set's ARN
  /// with an Archive action, or a Configuration Set's Archive ARN.
  final String? sourceArn;

  /// The identity name used to authorize the sending action when sent through a
  /// configuration set with archiving enabled.
  final String? sourceIdentity;

  /// The timestamp of when the email was received.
  final DateTime? timestamp;

  /// The TLS cipher suite used to communicate with the host from which the email
  /// was received.
  final String? tlsCipherSuite;

  /// The TLS protocol used to communicate with the host from which the email was
  /// received.
  final String? tlsProtocol;

  /// The ID of the traffic policy that was in effect when the email was received.
  final String? trafficPolicyId;

  Metadata({
    this.configurationSet,
    this.ingressPointId,
    this.ruleSetId,
    this.senderHostname,
    this.senderIpAddress,
    this.sendingMethod,
    this.sendingPool,
    this.sourceArn,
    this.sourceIdentity,
    this.timestamp,
    this.tlsCipherSuite,
    this.tlsProtocol,
    this.trafficPolicyId,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) {
    return Metadata(
      configurationSet: json['ConfigurationSet'] as String?,
      ingressPointId: json['IngressPointId'] as String?,
      ruleSetId: json['RuleSetId'] as String?,
      senderHostname: json['SenderHostname'] as String?,
      senderIpAddress: json['SenderIpAddress'] as String?,
      sendingMethod: json['SendingMethod'] as String?,
      sendingPool: json['SendingPool'] as String?,
      sourceArn: json['SourceArn'] as String?,
      sourceIdentity: json['SourceIdentity'] as String?,
      timestamp: timeStampFromJson(json['Timestamp']),
      tlsCipherSuite: json['TlsCipherSuite'] as String?,
      tlsProtocol: json['TlsProtocol'] as String?,
      trafficPolicyId: json['TrafficPolicyId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final configurationSet = this.configurationSet;
    final ingressPointId = this.ingressPointId;
    final ruleSetId = this.ruleSetId;
    final senderHostname = this.senderHostname;
    final senderIpAddress = this.senderIpAddress;
    final sendingMethod = this.sendingMethod;
    final sendingPool = this.sendingPool;
    final sourceArn = this.sourceArn;
    final sourceIdentity = this.sourceIdentity;
    final timestamp = this.timestamp;
    final tlsCipherSuite = this.tlsCipherSuite;
    final tlsProtocol = this.tlsProtocol;
    final trafficPolicyId = this.trafficPolicyId;
    return {
      if (configurationSet != null) 'ConfigurationSet': configurationSet,
      if (ingressPointId != null) 'IngressPointId': ingressPointId,
      if (ruleSetId != null) 'RuleSetId': ruleSetId,
      if (senderHostname != null) 'SenderHostname': senderHostname,
      if (senderIpAddress != null) 'SenderIpAddress': senderIpAddress,
      if (sendingMethod != null) 'SendingMethod': sendingMethod,
      if (sendingPool != null) 'SendingPool': sendingPool,
      if (sourceArn != null) 'SourceArn': sourceArn,
      if (sourceIdentity != null) 'SourceIdentity': sourceIdentity,
      if (timestamp != null) 'Timestamp': unixTimestampToJson(timestamp),
      if (tlsCipherSuite != null) 'TlsCipherSuite': tlsCipherSuite,
      if (tlsProtocol != null) 'TlsProtocol': tlsProtocol,
      if (trafficPolicyId != null) 'TrafficPolicyId': trafficPolicyId,
    };
  }
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
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
