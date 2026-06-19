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

/// This reference provides descriptions of the low-level AWS Artifact Service
/// API.
class Artifact {
  final _s.RestJsonProtocol _protocol;
  Artifact({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'artifact',
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
