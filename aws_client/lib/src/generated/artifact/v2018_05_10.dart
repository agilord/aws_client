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

/// This reference provides descriptions of the low-level AWS Artifact Service
/// API.
class Artifact {
  final _s.RestJsonProtocol _protocol;
  factory Artifact({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
    bool useFipsEndpoint = false,
    bool useDualStackEndpoint = false,
  }) {
    final service = _s.ServiceMetadata(
      endpointPrefix: 'artifact',
    );
    return Artifact._(
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
  Artifact._({
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

  /// List tags for a resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
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

  /// Add tags to a resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [tags] :
  /// Tags to add to the resource.
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

  /// Remove tags from a resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [tagKeys] :
  /// Tag keys to remove from the resource.
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

  /// Get the account settings for Artifact.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  Future<GetAccountSettingsResponse> getAccountSettings() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/account-settings/get',
      exceptionFnMap: _exceptionFns,
    );
    return GetAccountSettingsResponse.fromJson(response);
  }

  /// Put the account settings for Artifact.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [notificationSubscriptionStatus] :
  /// Desired notification subscription status.
  Future<PutAccountSettingsResponse> putAccountSettings({
    NotificationSubscriptionStatus? notificationSubscriptionStatus,
  }) async {
    final $payload = <String, dynamic>{
      if (notificationSubscriptionStatus != null)
        'notificationSubscriptionStatus': notificationSubscriptionStatus.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/v1/account-settings/put',
      exceptionFnMap: _exceptionFns,
    );
    return PutAccountSettingsResponse.fromJson(response);
  }

  /// Create a new compliance inquiry.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [inquiryContent] :
  /// Content for creating a compliance inquiry - either a single query or file
  /// content.
  ///
  /// Parameter [name] :
  /// Title of the inquiry.
  ///
  /// Parameter [clientToken] :
  /// Idempotency token for the request.
  ///
  /// Parameter [supportMode] :
  /// Support mode for inquiry processing. Only supported for file upload mode.
  /// Defaults to AI_ONLY if not specified.
  ///
  /// Parameter [tags] :
  /// Tags to associate with the compliance inquiry resource.
  Future<CreateComplianceInquiryResponse> createComplianceInquiry({
    required InquiryContent inquiryContent,
    required String name,
    String? clientToken,
    InquirySupportMode? supportMode,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'inquiryContent': inquiryContent,
      'name': name,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (supportMode != null) 'supportMode': supportMode.value,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/compliance-inquiry/create',
      exceptionFnMap: _exceptionFns,
    );
    return CreateComplianceInquiryResponse.fromJson(response);
  }

  /// Export a compliance inquiry report.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [complianceInquiryId] :
  /// Unique resource ID for the compliance inquiry.
  ///
  /// Parameter [includeCitations] :
  /// When true, include citations in the exported document.
  ///
  /// Parameter [queryIdentifiers] :
  /// List of query identifiers to include in the export.
  Future<ExportComplianceInquiryResponse> exportComplianceInquiry({
    required String complianceInquiryId,
    bool? includeCitations,
    List<int>? queryIdentifiers,
  }) async {
    final $payload = <String, dynamic>{
      'complianceInquiryId': complianceInquiryId,
      if (includeCitations != null) 'includeCitations': includeCitations,
      if (queryIdentifiers != null) 'queryIdentifiers': queryIdentifiers,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/compliance-inquiry/export',
      exceptionFnMap: _exceptionFns,
    );
    return ExportComplianceInquiryResponse.fromJson(response);
  }

  /// Get the metadata for a single compliance inquiry.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [complianceInquiryId] :
  /// Unique resource ID for the compliance inquiry.
  Future<GetComplianceInquiryMetadataResponse> getComplianceInquiryMetadata({
    required String complianceInquiryId,
  }) async {
    final $query = <String, List<String>>{
      'complianceInquiryId': [complianceInquiryId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/compliance-inquiry/getMetadata',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetComplianceInquiryMetadataResponse.fromJson(response);
  }

  /// List available compliance inquiries.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// Maximum number of resources to return in the paginated response.
  ///
  /// Parameter [nextToken] :
  /// Pagination token to request the next page of resources.
  Future<ListComplianceInquiriesResponse> listComplianceInquiries({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      300,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/compliance-inquiry/list',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListComplianceInquiriesResponse.fromJson(response);
  }

  /// List queries within a compliance inquiry.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [complianceInquiryId] :
  /// Unique resource ID for the compliance inquiry.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of resources to return in the paginated response.
  ///
  /// Parameter [nextToken] :
  /// Pagination token to request the next page of resources.
  Future<ListComplianceInquiryQueriesResponse> listComplianceInquiryQueries({
    required String complianceInquiryId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      300,
    );
    final $query = <String, List<String>>{
      'complianceInquiryId': [complianceInquiryId],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/compliance-inquiry/listQueries',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListComplianceInquiryQueriesResponse.fromJson(response);
  }

  /// Submits feedback on a compliance inquiry response.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [complianceInquiryId] :
  /// The unique identifier for the compliance inquiry.
  ///
  /// Parameter [rating] :
  /// The rating for the feedback. Valid values are THUMBS_UP and THUMBS_DOWN.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier to ensure that the operation completes
  /// no more than one time. If this token matches a previous request, the
  /// service ignores the request, but does not return an error.
  ///
  /// Parameter [comment] :
  /// An optional comment for the feedback.
  ///
  /// Parameter [queryIdentifier] :
  /// The sequential identifier of the query to provide feedback on.
  ///
  /// Parameter [reasonCodes] :
  /// The reason codes that describe why you rated the response. Valid values
  /// are OTHER, PARTIAL_RESPONSE, and IRRELEVANT_RESPONSE.
  ///
  /// Parameter [responseRevisionId] :
  /// The response revision ID. Use this value to prevent submitting feedback on
  /// a stale response.
  Future<PutComplianceInquiryFeedbackResponse> putComplianceInquiryFeedback({
    required String complianceInquiryId,
    required FeedbackRating rating,
    String? clientToken,
    String? comment,
    int? queryIdentifier,
    List<FeedbackReasonCode>? reasonCodes,
    int? responseRevisionId,
  }) async {
    final $payload = <String, dynamic>{
      'complianceInquiryId': complianceInquiryId,
      'rating': rating.value,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (comment != null) 'comment': comment,
      if (queryIdentifier != null) 'queryIdentifier': queryIdentifier,
      if (reasonCodes != null)
        'reasonCodes': reasonCodes.map((e) => e.value).toList(),
      if (responseRevisionId != null) 'responseRevisionId': responseRevisionId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/v1/compliance-inquiry/putFeedback',
      exceptionFnMap: _exceptionFns,
    );
    return PutComplianceInquiryFeedbackResponse.fromJson(response);
  }

  /// List active customer-agreements applicable to calling identity.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// Maximum number of resources to return in the paginated response.
  ///
  /// Parameter [nextToken] :
  /// Pagination token to request the next page of resources.
  Future<ListCustomerAgreementsResponse> listCustomerAgreements({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      300,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/customer-agreement/list',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListCustomerAgreementsResponse.fromJson(response);
  }

  /// Get the metadata for a single report.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [reportId] :
  /// Unique resource ID for the report resource.
  ///
  /// Parameter [reportVersion] :
  /// Version for the report resource.
  Future<GetReportMetadataResponse> getReportMetadata({
    required String reportId,
    int? reportVersion,
  }) async {
    _s.validateNumRange(
      'reportVersion',
      reportVersion,
      1,
      1152921504606846976,
    );
    final $query = <String, List<String>>{
      'reportId': [reportId],
      if (reportVersion != null) 'reportVersion': [reportVersion.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/report/getMetadata',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetReportMetadataResponse.fromJson(response);
  }

  /// List available reports.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// Maximum number of resources to return in the paginated response.
  ///
  /// Parameter [nextToken] :
  /// Pagination token to request the next page of resources.
  Future<ListReportsResponse> listReports({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      300,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/report/list',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListReportsResponse.fromJson(response);
  }

  /// Get the content for a single report.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [reportId] :
  /// Unique resource ID for the report resource.
  ///
  /// Parameter [termToken] :
  /// Unique download token provided by GetTermForReport API.
  ///
  /// Parameter [reportVersion] :
  /// Version for the report resource.
  Future<GetReportResponse> getReport({
    required String reportId,
    required String termToken,
    int? reportVersion,
  }) async {
    _s.validateNumRange(
      'reportVersion',
      reportVersion,
      1,
      1152921504606846976,
    );
    final $query = <String, List<String>>{
      'reportId': [reportId],
      'termToken': [termToken],
      if (reportVersion != null) 'reportVersion': [reportVersion.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/report/get',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetReportResponse.fromJson(response);
  }

  /// Get the Term content associated with a single report.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [reportId] :
  /// Unique resource ID for the report resource.
  ///
  /// Parameter [reportVersion] :
  /// Version for the report resource.
  Future<GetTermForReportResponse> getTermForReport({
    required String reportId,
    int? reportVersion,
  }) async {
    _s.validateNumRange(
      'reportVersion',
      reportVersion,
      1,
      1152921504606846976,
    );
    final $query = <String, List<String>>{
      'reportId': [reportId],
      if (reportVersion != null) 'reportVersion': [reportVersion.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/report/getTermForReport',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetTermForReportResponse.fromJson(response);
  }

  /// List available report versions for a given report.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [reportId] :
  /// Unique resource ID for the report resource.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of resources to return in the paginated response.
  ///
  /// Parameter [nextToken] :
  /// Pagination token to request the next page of resources.
  Future<ListReportVersionsResponse> listReportVersions({
    required String reportId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      300,
    );
    final $query = <String, List<String>>{
      'reportId': [reportId],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/report/listVersions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListReportVersionsResponse.fromJson(response);
  }
}

/// @nodoc
class ListTagsForResourceResponse {
  /// Tags associated with the resource.
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
class GetAccountSettingsResponse {
  final AccountSettings? accountSettings;

  GetAccountSettingsResponse({
    this.accountSettings,
  });

  factory GetAccountSettingsResponse.fromJson(Map<String, dynamic> json) {
    return GetAccountSettingsResponse(
      accountSettings: json['accountSettings'] != null
          ? AccountSettings.fromJson(
              json['accountSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accountSettings = this.accountSettings;
    return {
      if (accountSettings != null) 'accountSettings': accountSettings,
    };
  }
}

/// @nodoc
class PutAccountSettingsResponse {
  final AccountSettings? accountSettings;

  PutAccountSettingsResponse({
    this.accountSettings,
  });

  factory PutAccountSettingsResponse.fromJson(Map<String, dynamic> json) {
    return PutAccountSettingsResponse(
      accountSettings: json['accountSettings'] != null
          ? AccountSettings.fromJson(
              json['accountSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accountSettings = this.accountSettings;
    return {
      if (accountSettings != null) 'accountSettings': accountSettings,
    };
  }
}

/// @nodoc
class CreateComplianceInquiryResponse {
  /// Summary information about the created compliance inquiry.
  final InquirySummary? complianceInquirySummary;

  /// Tags associated with the compliance inquiry resource.
  final Map<String, String>? tags;

  CreateComplianceInquiryResponse({
    this.complianceInquirySummary,
    this.tags,
  });

  factory CreateComplianceInquiryResponse.fromJson(Map<String, dynamic> json) {
    return CreateComplianceInquiryResponse(
      complianceInquirySummary: json['complianceInquirySummary'] != null
          ? InquirySummary.fromJson(
              json['complianceInquirySummary'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final complianceInquirySummary = this.complianceInquirySummary;
    final tags = this.tags;
    return {
      if (complianceInquirySummary != null)
        'complianceInquirySummary': complianceInquirySummary,
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
class ExportComplianceInquiryResponse {
  /// Presigned S3 URL to access the exported compliance inquiry report.
  final String? documentPresignedUrl;

  /// Tags associated with the compliance inquiry resource.
  final Map<String, String>? tags;

  ExportComplianceInquiryResponse({
    this.documentPresignedUrl,
    this.tags,
  });

  factory ExportComplianceInquiryResponse.fromJson(Map<String, dynamic> json) {
    return ExportComplianceInquiryResponse(
      documentPresignedUrl: json['documentPresignedUrl'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final documentPresignedUrl = this.documentPresignedUrl;
    final tags = this.tags;
    return {
      if (documentPresignedUrl != null)
        'documentPresignedUrl': documentPresignedUrl,
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
class GetComplianceInquiryMetadataResponse {
  /// Detailed information about the compliance inquiry.
  final InquiryDetail? complianceInquiryDetail;

  /// Tags associated with the compliance inquiry resource.
  final Map<String, String>? tags;

  GetComplianceInquiryMetadataResponse({
    this.complianceInquiryDetail,
    this.tags,
  });

  factory GetComplianceInquiryMetadataResponse.fromJson(
      Map<String, dynamic> json) {
    return GetComplianceInquiryMetadataResponse(
      complianceInquiryDetail: json['complianceInquiryDetail'] != null
          ? InquiryDetail.fromJson(
              json['complianceInquiryDetail'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final complianceInquiryDetail = this.complianceInquiryDetail;
    final tags = this.tags;
    return {
      if (complianceInquiryDetail != null)
        'complianceInquiryDetail': complianceInquiryDetail,
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
class ListComplianceInquiriesResponse {
  /// List of compliance inquiry resources.
  final List<InquirySummary>? complianceInquiries;

  /// Pagination token to request the next page of resources.
  final String? nextToken;

  ListComplianceInquiriesResponse({
    this.complianceInquiries,
    this.nextToken,
  });

  factory ListComplianceInquiriesResponse.fromJson(Map<String, dynamic> json) {
    return ListComplianceInquiriesResponse(
      complianceInquiries: (json['complianceInquiries'] as List?)
          ?.nonNulls
          .map((e) => InquirySummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final complianceInquiries = this.complianceInquiries;
    final nextToken = this.nextToken;
    return {
      if (complianceInquiries != null)
        'complianceInquiries': complianceInquiries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListComplianceInquiryQueriesResponse {
  /// Pagination token to request the next page of resources.
  final String? nextToken;

  /// List of compliance query summaries.
  final List<QuerySummary>? queries;

  ListComplianceInquiryQueriesResponse({
    this.nextToken,
    this.queries,
  });

  factory ListComplianceInquiryQueriesResponse.fromJson(
      Map<String, dynamic> json) {
    return ListComplianceInquiryQueriesResponse(
      nextToken: json['nextToken'] as String?,
      queries: (json['queries'] as List?)
          ?.nonNulls
          .map((e) => QuerySummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final queries = this.queries;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (queries != null) 'queries': queries,
    };
  }
}

/// @nodoc
class PutComplianceInquiryFeedbackResponse {
  /// The timestamp when the feedback was submitted.
  final DateTime submittedAt;

  PutComplianceInquiryFeedbackResponse({
    required this.submittedAt,
  });

  factory PutComplianceInquiryFeedbackResponse.fromJson(
      Map<String, dynamic> json) {
    return PutComplianceInquiryFeedbackResponse(
      submittedAt: nonNullableTimeStampFromJson(json['submittedAt'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final submittedAt = this.submittedAt;
    return {
      'submittedAt': iso8601ToJson(submittedAt),
    };
  }
}

/// @nodoc
class ListCustomerAgreementsResponse {
  /// List of customer-agreement resources.
  final List<CustomerAgreementSummary> customerAgreements;

  /// Pagination token to request the next page of resources.
  final String? nextToken;

  ListCustomerAgreementsResponse({
    required this.customerAgreements,
    this.nextToken,
  });

  factory ListCustomerAgreementsResponse.fromJson(Map<String, dynamic> json) {
    return ListCustomerAgreementsResponse(
      customerAgreements: ((json['customerAgreements'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              CustomerAgreementSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final customerAgreements = this.customerAgreements;
    final nextToken = this.nextToken;
    return {
      'customerAgreements': customerAgreements,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class GetReportMetadataResponse {
  /// Report resource detail.
  final ReportDetail? reportDetails;

  GetReportMetadataResponse({
    this.reportDetails,
  });

  factory GetReportMetadataResponse.fromJson(Map<String, dynamic> json) {
    return GetReportMetadataResponse(
      reportDetails: json['reportDetails'] != null
          ? ReportDetail.fromJson(json['reportDetails'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final reportDetails = this.reportDetails;
    return {
      if (reportDetails != null) 'reportDetails': reportDetails,
    };
  }
}

/// @nodoc
class ListReportsResponse {
  /// Pagination token to request the next page of resources.
  final String? nextToken;

  /// List of report resources.
  final List<ReportSummary>? reports;

  ListReportsResponse({
    this.nextToken,
    this.reports,
  });

  factory ListReportsResponse.fromJson(Map<String, dynamic> json) {
    return ListReportsResponse(
      nextToken: json['nextToken'] as String?,
      reports: (json['reports'] as List?)
          ?.nonNulls
          .map((e) => ReportSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final reports = this.reports;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (reports != null) 'reports': reports,
    };
  }
}

/// @nodoc
class GetReportResponse {
  /// Presigned S3 url to access the report content.
  final String? documentPresignedUrl;

  GetReportResponse({
    this.documentPresignedUrl,
  });

  factory GetReportResponse.fromJson(Map<String, dynamic> json) {
    return GetReportResponse(
      documentPresignedUrl: json['documentPresignedUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final documentPresignedUrl = this.documentPresignedUrl;
    return {
      if (documentPresignedUrl != null)
        'documentPresignedUrl': documentPresignedUrl,
    };
  }
}

/// @nodoc
class GetTermForReportResponse {
  /// Presigned S3 url to access the term content.
  final String? documentPresignedUrl;

  /// Unique token representing this request event.
  final String? termToken;

  GetTermForReportResponse({
    this.documentPresignedUrl,
    this.termToken,
  });

  factory GetTermForReportResponse.fromJson(Map<String, dynamic> json) {
    return GetTermForReportResponse(
      documentPresignedUrl: json['documentPresignedUrl'] as String?,
      termToken: json['termToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final documentPresignedUrl = this.documentPresignedUrl;
    final termToken = this.termToken;
    return {
      if (documentPresignedUrl != null)
        'documentPresignedUrl': documentPresignedUrl,
      if (termToken != null) 'termToken': termToken,
    };
  }
}

/// @nodoc
class ListReportVersionsResponse {
  /// List of report resources.
  final List<ReportSummary> reports;

  /// Pagination token to request the next page of resources.
  final String? nextToken;

  ListReportVersionsResponse({
    required this.reports,
    this.nextToken,
  });

  factory ListReportVersionsResponse.fromJson(Map<String, dynamic> json) {
    return ListReportVersionsResponse(
      reports: ((json['reports'] as List?) ?? const [])
          .nonNulls
          .map((e) => ReportSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final reports = this.reports;
    final nextToken = this.nextToken;
    return {
      'reports': reports,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Summary for report resource.
///
/// @nodoc
class ReportSummary {
  /// Acceptance type for report.
  final AcceptanceType? acceptanceType;

  /// ARN for the report resource.
  final String? arn;

  /// Category for the report resource.
  final String? category;

  /// Associated company name for the report resource.
  final String? companyName;

  /// Description for the report resource.
  final String? description;

  /// Unique resource ID for the report resource.
  final String? id;

  /// Name for the report resource.
  final String? name;

  /// Timestamp indicating the report resource effective end.
  final DateTime? periodEnd;

  /// Timestamp indicating the report resource effective start.
  final DateTime? periodStart;

  /// Associated product name for the report resource.
  final String? productName;

  /// Series for the report resource.
  final String? series;

  /// Current state of the report resource.
  final PublishedState? state;

  /// The message associated with the current upload state.
  final String? statusMessage;

  /// The current state of the document upload.
  final UploadState? uploadState;

  /// Version for the report resource.
  final int? version;

  ReportSummary({
    this.acceptanceType,
    this.arn,
    this.category,
    this.companyName,
    this.description,
    this.id,
    this.name,
    this.periodEnd,
    this.periodStart,
    this.productName,
    this.series,
    this.state,
    this.statusMessage,
    this.uploadState,
    this.version,
  });

  factory ReportSummary.fromJson(Map<String, dynamic> json) {
    return ReportSummary(
      acceptanceType:
          (json['acceptanceType'] as String?)?.let(AcceptanceType.fromString),
      arn: json['arn'] as String?,
      category: json['category'] as String?,
      companyName: json['companyName'] as String?,
      description: json['description'] as String?,
      id: json['id'] as String?,
      name: json['name'] as String?,
      periodEnd: timeStampFromJson(json['periodEnd']),
      periodStart: timeStampFromJson(json['periodStart']),
      productName: json['productName'] as String?,
      series: json['series'] as String?,
      state: (json['state'] as String?)?.let(PublishedState.fromString),
      statusMessage: json['statusMessage'] as String?,
      uploadState:
          (json['uploadState'] as String?)?.let(UploadState.fromString),
      version: json['version'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final acceptanceType = this.acceptanceType;
    final arn = this.arn;
    final category = this.category;
    final companyName = this.companyName;
    final description = this.description;
    final id = this.id;
    final name = this.name;
    final periodEnd = this.periodEnd;
    final periodStart = this.periodStart;
    final productName = this.productName;
    final series = this.series;
    final state = this.state;
    final statusMessage = this.statusMessage;
    final uploadState = this.uploadState;
    final version = this.version;
    return {
      if (acceptanceType != null) 'acceptanceType': acceptanceType.value,
      if (arn != null) 'arn': arn,
      if (category != null) 'category': category,
      if (companyName != null) 'companyName': companyName,
      if (description != null) 'description': description,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (periodEnd != null) 'periodEnd': iso8601ToJson(periodEnd),
      if (periodStart != null) 'periodStart': iso8601ToJson(periodStart),
      if (productName != null) 'productName': productName,
      if (series != null) 'series': series,
      if (state != null) 'state': state.value,
      if (statusMessage != null) 'statusMessage': statusMessage,
      if (uploadState != null) 'uploadState': uploadState.value,
      if (version != null) 'version': version,
    };
  }
}

/// @nodoc
class PublishedState {
  static const published = PublishedState._('PUBLISHED');
  static const unpublished = PublishedState._('UNPUBLISHED');

  final String value;

  const PublishedState._(this.value);

  static const values = [published, unpublished];

  static PublishedState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PublishedState._(value));

  @override
  bool operator ==(other) => other is PublishedState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class UploadState {
  static const processing = UploadState._('PROCESSING');
  static const complete = UploadState._('COMPLETE');
  static const failed = UploadState._('FAILED');
  static const fault = UploadState._('FAULT');

  final String value;

  const UploadState._(this.value);

  static const values = [processing, complete, failed, fault];

  static UploadState fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => UploadState._(value));

  @override
  bool operator ==(other) => other is UploadState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class AcceptanceType {
  static const passthrough = AcceptanceType._('PASSTHROUGH');
  static const explicit = AcceptanceType._('EXPLICIT');

  final String value;

  const AcceptanceType._(this.value);

  static const values = [passthrough, explicit];

  static AcceptanceType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AcceptanceType._(value));

  @override
  bool operator ==(other) => other is AcceptanceType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Full detail for report resource metadata.
///
/// @nodoc
class ReportDetail {
  /// Acceptance type for report.
  final AcceptanceType? acceptanceType;

  /// ARN for the report resource.
  final String? arn;

  /// Category for the report resource.
  final String? category;

  /// Associated company name for the report resource.
  final String? companyName;

  /// Timestamp indicating when the report resource was created.
  final DateTime? createdAt;

  /// Timestamp indicating when the report resource was deleted.
  final DateTime? deletedAt;

  /// Description for the report resource.
  final String? description;

  /// Unique resource ID for the report resource.
  final String? id;

  /// Timestamp indicating when the report resource was last modified.
  final DateTime? lastModifiedAt;

  /// Name for the report resource.
  final String? name;

  /// Timestamp indicating the report resource effective end.
  final DateTime? periodEnd;

  /// Timestamp indicating the report resource effective start.
  final DateTime? periodStart;

  /// Associated product name for the report resource.
  final String? productName;

  /// Sequence number to enforce optimistic locking.
  final int? sequenceNumber;

  /// Series for the report resource.
  final String? series;

  /// Current state of the report resource
  final PublishedState? state;

  /// The message associated with the current upload state.
  final String? statusMessage;

  /// Unique resource ARN for term resource.
  final String? termArn;

  /// The current state of the document upload.
  final UploadState? uploadState;

  /// Version for the report resource.
  final int? version;

  ReportDetail({
    this.acceptanceType,
    this.arn,
    this.category,
    this.companyName,
    this.createdAt,
    this.deletedAt,
    this.description,
    this.id,
    this.lastModifiedAt,
    this.name,
    this.periodEnd,
    this.periodStart,
    this.productName,
    this.sequenceNumber,
    this.series,
    this.state,
    this.statusMessage,
    this.termArn,
    this.uploadState,
    this.version,
  });

  factory ReportDetail.fromJson(Map<String, dynamic> json) {
    return ReportDetail(
      acceptanceType:
          (json['acceptanceType'] as String?)?.let(AcceptanceType.fromString),
      arn: json['arn'] as String?,
      category: json['category'] as String?,
      companyName: json['companyName'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      deletedAt: timeStampFromJson(json['deletedAt']),
      description: json['description'] as String?,
      id: json['id'] as String?,
      lastModifiedAt: timeStampFromJson(json['lastModifiedAt']),
      name: json['name'] as String?,
      periodEnd: timeStampFromJson(json['periodEnd']),
      periodStart: timeStampFromJson(json['periodStart']),
      productName: json['productName'] as String?,
      sequenceNumber: json['sequenceNumber'] as int?,
      series: json['series'] as String?,
      state: (json['state'] as String?)?.let(PublishedState.fromString),
      statusMessage: json['statusMessage'] as String?,
      termArn: json['termArn'] as String?,
      uploadState:
          (json['uploadState'] as String?)?.let(UploadState.fromString),
      version: json['version'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final acceptanceType = this.acceptanceType;
    final arn = this.arn;
    final category = this.category;
    final companyName = this.companyName;
    final createdAt = this.createdAt;
    final deletedAt = this.deletedAt;
    final description = this.description;
    final id = this.id;
    final lastModifiedAt = this.lastModifiedAt;
    final name = this.name;
    final periodEnd = this.periodEnd;
    final periodStart = this.periodStart;
    final productName = this.productName;
    final sequenceNumber = this.sequenceNumber;
    final series = this.series;
    final state = this.state;
    final statusMessage = this.statusMessage;
    final termArn = this.termArn;
    final uploadState = this.uploadState;
    final version = this.version;
    return {
      if (acceptanceType != null) 'acceptanceType': acceptanceType.value,
      if (arn != null) 'arn': arn,
      if (category != null) 'category': category,
      if (companyName != null) 'companyName': companyName,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (deletedAt != null) 'deletedAt': iso8601ToJson(deletedAt),
      if (description != null) 'description': description,
      if (id != null) 'id': id,
      if (lastModifiedAt != null)
        'lastModifiedAt': iso8601ToJson(lastModifiedAt),
      if (name != null) 'name': name,
      if (periodEnd != null) 'periodEnd': iso8601ToJson(periodEnd),
      if (periodStart != null) 'periodStart': iso8601ToJson(periodStart),
      if (productName != null) 'productName': productName,
      if (sequenceNumber != null) 'sequenceNumber': sequenceNumber,
      if (series != null) 'series': series,
      if (state != null) 'state': state.value,
      if (statusMessage != null) 'statusMessage': statusMessage,
      if (termArn != null) 'termArn': termArn,
      if (uploadState != null) 'uploadState': uploadState.value,
      if (version != null) 'version': version,
    };
  }
}

/// Summary for customer-agreement resource.
///
/// @nodoc
class CustomerAgreementSummary {
  /// Terms required to accept the agreement resource.
  final List<String>? acceptanceTerms;

  /// ARN of the agreement resource the customer-agreement resource represents.
  final String? agreementArn;

  /// ARN of the customer-agreement resource.
  final String? arn;

  /// AWS account Id that owns the resource.
  final String? awsAccountId;

  /// Description of the resource.
  final String? description;

  /// Timestamp indicating when the agreement was terminated.
  final DateTime? effectiveEnd;

  /// Timestamp indicating when the agreement became effective.
  final DateTime? effectiveStart;

  /// Identifier of the customer-agreement resource.
  final String? id;

  /// Name of the customer-agreement resource.
  final String? name;

  /// ARN of the organization that owns the resource.
  final String? organizationArn;

  /// State of the resource.
  final CustomerAgreementState? state;

  /// Terms required to terminate the customer-agreement resource.
  final List<String>? terminateTerms;

  /// Type of the customer-agreement resource.
  final AgreementType? type;

  CustomerAgreementSummary({
    this.acceptanceTerms,
    this.agreementArn,
    this.arn,
    this.awsAccountId,
    this.description,
    this.effectiveEnd,
    this.effectiveStart,
    this.id,
    this.name,
    this.organizationArn,
    this.state,
    this.terminateTerms,
    this.type,
  });

  factory CustomerAgreementSummary.fromJson(Map<String, dynamic> json) {
    return CustomerAgreementSummary(
      acceptanceTerms: (json['acceptanceTerms'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      agreementArn: json['agreementArn'] as String?,
      arn: json['arn'] as String?,
      awsAccountId: json['awsAccountId'] as String?,
      description: json['description'] as String?,
      effectiveEnd: timeStampFromJson(json['effectiveEnd']),
      effectiveStart: timeStampFromJson(json['effectiveStart']),
      id: json['id'] as String?,
      name: json['name'] as String?,
      organizationArn: json['organizationArn'] as String?,
      state: (json['state'] as String?)?.let(CustomerAgreementState.fromString),
      terminateTerms: (json['terminateTerms'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      type: (json['type'] as String?)?.let(AgreementType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final acceptanceTerms = this.acceptanceTerms;
    final agreementArn = this.agreementArn;
    final arn = this.arn;
    final awsAccountId = this.awsAccountId;
    final description = this.description;
    final effectiveEnd = this.effectiveEnd;
    final effectiveStart = this.effectiveStart;
    final id = this.id;
    final name = this.name;
    final organizationArn = this.organizationArn;
    final state = this.state;
    final terminateTerms = this.terminateTerms;
    final type = this.type;
    return {
      if (acceptanceTerms != null) 'acceptanceTerms': acceptanceTerms,
      if (agreementArn != null) 'agreementArn': agreementArn,
      if (arn != null) 'arn': arn,
      if (awsAccountId != null) 'awsAccountId': awsAccountId,
      if (description != null) 'description': description,
      if (effectiveEnd != null) 'effectiveEnd': iso8601ToJson(effectiveEnd),
      if (effectiveStart != null)
        'effectiveStart': iso8601ToJson(effectiveStart),
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (organizationArn != null) 'organizationArn': organizationArn,
      if (state != null) 'state': state.value,
      if (terminateTerms != null) 'terminateTerms': terminateTerms,
      if (type != null) 'type': type.value,
    };
  }
}

/// @nodoc
class CustomerAgreementState {
  static const active = CustomerAgreementState._('ACTIVE');
  static const customerTerminated =
      CustomerAgreementState._('CUSTOMER_TERMINATED');
  static const awsTerminated = CustomerAgreementState._('AWS_TERMINATED');

  final String value;

  const CustomerAgreementState._(this.value);

  static const values = [active, customerTerminated, awsTerminated];

  static CustomerAgreementState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CustomerAgreementState._(value));

  @override
  bool operator ==(other) =>
      other is CustomerAgreementState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class AgreementType {
  static const custom = AgreementType._('CUSTOM');
  static const $default = AgreementType._('DEFAULT');
  static const modified = AgreementType._('MODIFIED');

  final String value;

  const AgreementType._(this.value);

  static const values = [custom, $default, modified];

  static AgreementType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AgreementType._(value));

  @override
  bool operator ==(other) => other is AgreementType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class FeedbackRating {
  static const thumbsUp = FeedbackRating._('THUMBS_UP');
  static const thumbsDown = FeedbackRating._('THUMBS_DOWN');

  final String value;

  const FeedbackRating._(this.value);

  static const values = [thumbsUp, thumbsDown];

  static FeedbackRating fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => FeedbackRating._(value));

  @override
  bool operator ==(other) => other is FeedbackRating && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class FeedbackReasonCode {
  static const other = FeedbackReasonCode._('OTHER');
  static const partialResponse = FeedbackReasonCode._('PARTIAL_RESPONSE');
  static const irrelevantResponse = FeedbackReasonCode._('IRRELEVANT_RESPONSE');

  final String value;

  const FeedbackReasonCode._(this.value);

  static const values = [other, partialResponse, irrelevantResponse];

  static FeedbackReasonCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => FeedbackReasonCode._(value));

  @override
  bool operator ==(other) =>
      other is FeedbackReasonCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Summary information about a single query within a compliance inquiry.
///
/// @nodoc
class QuerySummary {
  /// Timestamp when the query was created.
  final DateTime createdAt;

  /// The actual query text.
  final String query;

  /// Sequential identifier of the query within the inquiry.
  final int queryIdentifier;

  /// Current processing status of the query.
  final QueryStatus status;

  /// Descriptive status message.
  final QueryStatusMessage statusMessage;

  /// Supporting citations for the response.
  final List<Citation>? citations;

  /// Generated response to the query.
  final String? response;

  /// Type of review for the response.
  final ReviewType? reviewType;

  /// Ordered list of response version history entries, oldest first.
  final List<ResponseVersion>? updatedResponseVersions;

  QuerySummary({
    required this.createdAt,
    required this.query,
    required this.queryIdentifier,
    required this.status,
    required this.statusMessage,
    this.citations,
    this.response,
    this.reviewType,
    this.updatedResponseVersions,
  });

  factory QuerySummary.fromJson(Map<String, dynamic> json) {
    return QuerySummary(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      query: (json['query'] as String?) ?? '',
      queryIdentifier: (json['queryIdentifier'] as int?) ?? 0,
      status: QueryStatus.fromString((json['status'] as String?) ?? ''),
      statusMessage: QueryStatusMessage.fromString(
          (json['statusMessage'] as String?) ?? ''),
      citations: (json['citations'] as List?)
          ?.nonNulls
          .map((e) => Citation.fromJson(e as Map<String, dynamic>))
          .toList(),
      response: json['response'] as String?,
      reviewType: (json['reviewType'] as String?)?.let(ReviewType.fromString),
      updatedResponseVersions: (json['updatedResponseVersions'] as List?)
          ?.nonNulls
          .map((e) => ResponseVersion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final query = this.query;
    final queryIdentifier = this.queryIdentifier;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final citations = this.citations;
    final response = this.response;
    final reviewType = this.reviewType;
    final updatedResponseVersions = this.updatedResponseVersions;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'query': query,
      'queryIdentifier': queryIdentifier,
      'status': status.value,
      'statusMessage': statusMessage.value,
      if (citations != null) 'citations': citations,
      if (response != null) 'response': response,
      if (reviewType != null) 'reviewType': reviewType.value,
      if (updatedResponseVersions != null)
        'updatedResponseVersions': updatedResponseVersions,
    };
  }
}

/// @nodoc
class ReviewType {
  static const human = ReviewType._('HUMAN');
  static const ai = ReviewType._('AI');

  final String value;

  const ReviewType._(this.value);

  static const values = [human, ai];

  static ReviewType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ReviewType._(value));

  @override
  bool operator ==(other) => other is ReviewType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class QueryStatus {
  static const processing = QueryStatus._('PROCESSING');
  static const completed = QueryStatus._('COMPLETED');
  static const failed = QueryStatus._('FAILED');

  final String value;

  const QueryStatus._(this.value);

  static const values = [processing, completed, failed];

  static QueryStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => QueryStatus._(value));

  @override
  bool operator ==(other) => other is QueryStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class QueryStatusMessage {
  static const queryProcessingIsComplete =
      QueryStatusMessage._('Query processing is complete.');
  static const queryProcessingIsInProgress =
      QueryStatusMessage._('Query processing is in-progress.');
  static const anInternalErrorOccurredWhileProcessingTheQueryTryAgainAtALaterTime =
      QueryStatusMessage._(
          'An internal error occurred while processing the query. Try again at a later time.');
  static const queryIsPendingHumanReview =
      QueryStatusMessage._('Query is pending human review.');
  static const queryContainsRestrictedOrUnsupportedContent =
      QueryStatusMessage._('Query contains restricted or unsupported content.');

  final String value;

  const QueryStatusMessage._(this.value);

  static const values = [
    queryProcessingIsComplete,
    queryProcessingIsInProgress,
    anInternalErrorOccurredWhileProcessingTheQueryTryAgainAtALaterTime,
    queryIsPendingHumanReview,
    queryContainsRestrictedOrUnsupportedContent
  ];

  static QueryStatusMessage fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => QueryStatusMessage._(value));

  @override
  bool operator ==(other) =>
      other is QueryStatusMessage && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A versioned snapshot of a response edit.
///
/// @nodoc
class ResponseVersion {
  /// The response text for this version.
  final String responseText;

  /// ISO 8601 timestamp of when this edit was made.
  final DateTime timestamp;

  ResponseVersion({
    required this.responseText,
    required this.timestamp,
  });

  factory ResponseVersion.fromJson(Map<String, dynamic> json) {
    return ResponseVersion(
      responseText: (json['responseText'] as String?) ?? '',
      timestamp: nonNullableTimeStampFromJson(json['timestamp'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final responseText = this.responseText;
    final timestamp = this.timestamp;
    return {
      'responseText': responseText,
      'timestamp': iso8601ToJson(timestamp),
    };
  }
}

/// Citation information for AI-generated responses.
///
/// @nodoc
class Citation {
  /// Content text from the compliance source.
  final String? sourceContent;

  /// Label identifying the compliance source.
  final String? sourceLabel;

  /// Link to the compliance source.
  final String? sourceLink;

  Citation({
    this.sourceContent,
    this.sourceLabel,
    this.sourceLink,
  });

  factory Citation.fromJson(Map<String, dynamic> json) {
    return Citation(
      sourceContent: json['sourceContent'] as String?,
      sourceLabel: json['sourceLabel'] as String?,
      sourceLink: json['sourceLink'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final sourceContent = this.sourceContent;
    final sourceLabel = this.sourceLabel;
    final sourceLink = this.sourceLink;
    return {
      if (sourceContent != null) 'sourceContent': sourceContent,
      if (sourceLabel != null) 'sourceLabel': sourceLabel,
      if (sourceLink != null) 'sourceLink': sourceLink,
    };
  }
}

/// Summary information about a compliance inquiry.
///
/// @nodoc
class InquirySummary {
  /// ARN of the compliance inquiry resource.
  final String arn;

  /// Timestamp indicating when the resource was created.
  final DateTime createdAt;

  /// Unique resource ID for the compliance inquiry.
  final String id;

  /// Type of inquiry content (text or file).
  final InputSource inputSource;

  /// Title of the inquiry.
  final String name;

  /// Current processing status of the inquiry.
  final InquiryStatus status;

  /// Status message providing additional context.
  final InquiryStatusMessage statusMessage;

  InquirySummary({
    required this.arn,
    required this.createdAt,
    required this.id,
    required this.inputSource,
    required this.name,
    required this.status,
    required this.statusMessage,
  });

  factory InquirySummary.fromJson(Map<String, dynamic> json) {
    return InquirySummary(
      arn: (json['arn'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      id: (json['id'] as String?) ?? '',
      inputSource:
          InputSource.fromString((json['inputSource'] as String?) ?? ''),
      name: (json['name'] as String?) ?? '',
      status: InquiryStatus.fromString((json['status'] as String?) ?? ''),
      statusMessage: InquiryStatusMessage.fromString(
          (json['statusMessage'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final id = this.id;
    final inputSource = this.inputSource;
    final name = this.name;
    final status = this.status;
    final statusMessage = this.statusMessage;
    return {
      'arn': arn,
      'createdAt': iso8601ToJson(createdAt),
      'id': id,
      'inputSource': inputSource.value,
      'name': name,
      'status': status.value,
      'statusMessage': statusMessage.value,
    };
  }
}

/// @nodoc
class InquiryStatus {
  static const processing = InquiryStatus._('PROCESSING');
  static const humanReview = InquiryStatus._('HUMAN_REVIEW');
  static const completed = InquiryStatus._('COMPLETED');
  static const failed = InquiryStatus._('FAILED');

  final String value;

  const InquiryStatus._(this.value);

  static const values = [processing, humanReview, completed, failed];

  static InquiryStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => InquiryStatus._(value));

  @override
  bool operator ==(other) => other is InquiryStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class InquiryStatusMessage {
  static const complianceInquiryProcessingIsComplete =
      InquiryStatusMessage._('Compliance inquiry processing is complete.');
  static const malwareWasDetectedOnTheFileProvideANewFileAndTryAgain =
      InquiryStatusMessage._(
          'Malware was detected on the file. Provide a new file and try again.');
  static const complianceInquiryProcessingIsInProgress =
      InquiryStatusMessage._('Compliance inquiry processing is in-progress.');
  static const anInternalErrorOccurredWhileProcessingTheInquiryTryAgainAtALaterTime =
      InquiryStatusMessage._(
          'An internal error occurred while processing the inquiry. Try again at a later time.');
  static const humanReviewIsInProgress =
      InquiryStatusMessage._('Human review is in progress.');
  static const complianceInquiryProcessingIsCompleteOneOrMoreQueriesEncounteredErrorsDuringProcessing =
      InquiryStatusMessage._(
          'Compliance inquiry processing is complete. One or more queries encountered errors during processing.');

  final String value;

  const InquiryStatusMessage._(this.value);

  static const values = [
    complianceInquiryProcessingIsComplete,
    malwareWasDetectedOnTheFileProvideANewFileAndTryAgain,
    complianceInquiryProcessingIsInProgress,
    anInternalErrorOccurredWhileProcessingTheInquiryTryAgainAtALaterTime,
    humanReviewIsInProgress,
    complianceInquiryProcessingIsCompleteOneOrMoreQueriesEncounteredErrorsDuringProcessing
  ];

  static InquiryStatusMessage fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => InquiryStatusMessage._(value));

  @override
  bool operator ==(other) =>
      other is InquiryStatusMessage && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class InputSource {
  static const text = InputSource._('TEXT');
  static const file = InputSource._('FILE');

  final String value;

  const InputSource._(this.value);

  static const values = [text, file];

  static InputSource fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => InputSource._(value));

  @override
  bool operator ==(other) => other is InputSource && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Detailed information about a compliance inquiry.
///
/// @nodoc
class InquiryDetail {
  /// ARN of the compliance inquiry resource.
  final String arn;

  /// Timestamp indicating when the resource was created.
  final DateTime createdAt;

  /// Unique resource ID for the compliance inquiry.
  final String id;

  /// Type of inquiry content (text or file).
  final InputSource inputSource;

  /// Title of the inquiry.
  final String name;

  /// Current processing status of the inquiry.
  final InquiryStatus status;

  /// Status message providing additional context.
  final InquiryStatusMessage statusMessage;

  /// Support mode for this inquiry. AI_ONLY provides AI-generated responses.
  /// FULL_SUPPORT includes human expert review.
  final InquirySupportMode? supportMode;

  /// Timestamp indicating when the resource was last modified.
  final DateTime? updatedAt;

  InquiryDetail({
    required this.arn,
    required this.createdAt,
    required this.id,
    required this.inputSource,
    required this.name,
    required this.status,
    required this.statusMessage,
    this.supportMode,
    this.updatedAt,
  });

  factory InquiryDetail.fromJson(Map<String, dynamic> json) {
    return InquiryDetail(
      arn: (json['arn'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      id: (json['id'] as String?) ?? '',
      inputSource:
          InputSource.fromString((json['inputSource'] as String?) ?? ''),
      name: (json['name'] as String?) ?? '',
      status: InquiryStatus.fromString((json['status'] as String?) ?? ''),
      statusMessage: InquiryStatusMessage.fromString(
          (json['statusMessage'] as String?) ?? ''),
      supportMode:
          (json['supportMode'] as String?)?.let(InquirySupportMode.fromString),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final id = this.id;
    final inputSource = this.inputSource;
    final name = this.name;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final supportMode = this.supportMode;
    final updatedAt = this.updatedAt;
    return {
      'arn': arn,
      'createdAt': iso8601ToJson(createdAt),
      'id': id,
      'inputSource': inputSource.value,
      'name': name,
      'status': status.value,
      'statusMessage': statusMessage.value,
      if (supportMode != null) 'supportMode': supportMode.value,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// @nodoc
class InquirySupportMode {
  static const aiOnly = InquirySupportMode._('AI_ONLY');
  static const fullSupport = InquirySupportMode._('FULL_SUPPORT');

  final String value;

  const InquirySupportMode._(this.value);

  static const values = [aiOnly, fullSupport];

  static InquirySupportMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => InquirySupportMode._(value));

  @override
  bool operator ==(other) =>
      other is InquirySupportMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Content for creating a compliance inquiry - either a single query or file
/// content.
///
/// @nodoc
class InquiryContent {
  /// File content with multiple questions.
  final InquiryFileContent? fileContent;

  /// Single text query for AI-generated answer.
  final String? query;

  InquiryContent({
    this.fileContent,
    this.query,
  });

  Map<String, dynamic> toJson() {
    final fileContent = this.fileContent;
    final query = this.query;
    return {
      if (fileContent != null) 'fileContent': fileContent,
      if (query != null) 'query': query,
    };
  }
}

/// File content structure for compliance inquiry uploads.
///
/// @nodoc
class InquiryFileContent {
  /// Binary content of the uploaded file.
  final Uint8List content;

  /// List of file sections/sheets to process.
  final List<String>? fileSections;

  InquiryFileContent({
    required this.content,
    this.fileSections,
  });

  Map<String, dynamic> toJson() {
    final content = this.content;
    final fileSections = this.fileSections;
    return {
      'content': base64Encode(content),
      if (fileSections != null) 'fileSections': fileSections,
    };
  }
}

/// Account settings for the customer.
///
/// @nodoc
class AccountSettings {
  /// Notification subscription status of the customer.
  final NotificationSubscriptionStatus? notificationSubscriptionStatus;

  AccountSettings({
    this.notificationSubscriptionStatus,
  });

  factory AccountSettings.fromJson(Map<String, dynamic> json) {
    return AccountSettings(
      notificationSubscriptionStatus:
          (json['notificationSubscriptionStatus'] as String?)
              ?.let(NotificationSubscriptionStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final notificationSubscriptionStatus = this.notificationSubscriptionStatus;
    return {
      if (notificationSubscriptionStatus != null)
        'notificationSubscriptionStatus': notificationSubscriptionStatus.value,
    };
  }
}

/// @nodoc
class NotificationSubscriptionStatus {
  static const subscribed = NotificationSubscriptionStatus._('SUBSCRIBED');
  static const notSubscribed =
      NotificationSubscriptionStatus._('NOT_SUBSCRIBED');

  final String value;

  const NotificationSubscriptionStatus._(this.value);

  static const values = [subscribed, notSubscribed];

  static NotificationSubscriptionStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => NotificationSubscriptionStatus._(value));

  @override
  bool operator ==(other) =>
      other is NotificationSubscriptionStatus && other.value == value;

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
class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
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
