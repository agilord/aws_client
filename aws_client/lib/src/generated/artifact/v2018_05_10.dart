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
            signingName: 'artifact',
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
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  Future<GetAccountSettingsResponse> getAccountSettings() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/account-settings/get',
      exceptionFnMap: _exceptionFns,
    );
    return GetAccountSettingsResponse.fromJson(response);
  }

  /// Get the content for a single report.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
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

  /// Get the metadata for a single report.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
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

  /// Get the Term content associated with a single report.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
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

  /// List available reports.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
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

  /// Put the account settings for Artifact.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [notificationSubscriptionStatus] :
  /// Desired notification subscription status.
  Future<PutAccountSettingsResponse> putAccountSettings({
    NotificationSubscriptionStatus? notificationSubscriptionStatus,
  }) async {
    final $payload = <String, dynamic>{
      if (notificationSubscriptionStatus != null)
        'notificationSubscriptionStatus':
            notificationSubscriptionStatus.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/v1/account-settings/put',
      exceptionFnMap: _exceptionFns,
    );
    return PutAccountSettingsResponse.fromJson(response);
  }
}

enum AcceptanceType {
  passthrough,
  explicit,
}

extension AcceptanceTypeValueExtension on AcceptanceType {
  String toValue() {
    switch (this) {
      case AcceptanceType.passthrough:
        return 'PASSTHROUGH';
      case AcceptanceType.explicit:
        return 'EXPLICIT';
    }
  }
}

extension AcceptanceTypeFromString on String {
  AcceptanceType toAcceptanceType() {
    switch (this) {
      case 'PASSTHROUGH':
        return AcceptanceType.passthrough;
      case 'EXPLICIT':
        return AcceptanceType.explicit;
    }
    throw Exception('$this is not known in enum AcceptanceType');
  }
}

/// Account settings for the customer.
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
              ?.toNotificationSubscriptionStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final notificationSubscriptionStatus = this.notificationSubscriptionStatus;
    return {
      if (notificationSubscriptionStatus != null)
        'notificationSubscriptionStatus':
            notificationSubscriptionStatus.toValue(),
    };
  }
}

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
          ?.whereNotNull()
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

enum NotificationSubscriptionStatus {
  subscribed,
  notSubscribed,
}

extension NotificationSubscriptionStatusValueExtension
    on NotificationSubscriptionStatus {
  String toValue() {
    switch (this) {
      case NotificationSubscriptionStatus.subscribed:
        return 'SUBSCRIBED';
      case NotificationSubscriptionStatus.notSubscribed:
        return 'NOT_SUBSCRIBED';
    }
  }
}

extension NotificationSubscriptionStatusFromString on String {
  NotificationSubscriptionStatus toNotificationSubscriptionStatus() {
    switch (this) {
      case 'SUBSCRIBED':
        return NotificationSubscriptionStatus.subscribed;
      case 'NOT_SUBSCRIBED':
        return NotificationSubscriptionStatus.notSubscribed;
    }
    throw Exception(
        '$this is not known in enum NotificationSubscriptionStatus');
  }
}

enum PublishedState {
  published,
  unpublished,
}

extension PublishedStateValueExtension on PublishedState {
  String toValue() {
    switch (this) {
      case PublishedState.published:
        return 'PUBLISHED';
      case PublishedState.unpublished:
        return 'UNPUBLISHED';
    }
  }
}

extension PublishedStateFromString on String {
  PublishedState toPublishedState() {
    switch (this) {
      case 'PUBLISHED':
        return PublishedState.published;
      case 'UNPUBLISHED':
        return PublishedState.unpublished;
    }
    throw Exception('$this is not known in enum PublishedState');
  }
}

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

/// Full detail for report resource metadata.
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
      acceptanceType: (json['acceptanceType'] as String?)?.toAcceptanceType(),
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
      state: (json['state'] as String?)?.toPublishedState(),
      statusMessage: json['statusMessage'] as String?,
      termArn: json['termArn'] as String?,
      uploadState: (json['uploadState'] as String?)?.toUploadState(),
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
      if (acceptanceType != null) 'acceptanceType': acceptanceType.toValue(),
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
      if (state != null) 'state': state.toValue(),
      if (statusMessage != null) 'statusMessage': statusMessage,
      if (termArn != null) 'termArn': termArn,
      if (uploadState != null) 'uploadState': uploadState.toValue(),
      if (version != null) 'version': version,
    };
  }
}

/// Summary for report resource.
class ReportSummary {
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
      state: (json['state'] as String?)?.toPublishedState(),
      statusMessage: json['statusMessage'] as String?,
      uploadState: (json['uploadState'] as String?)?.toUploadState(),
      version: json['version'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
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
      if (state != null) 'state': state.toValue(),
      if (statusMessage != null) 'statusMessage': statusMessage,
      if (uploadState != null) 'uploadState': uploadState.toValue(),
      if (version != null) 'version': version,
    };
  }
}

enum UploadState {
  processing,
  complete,
  failed,
  fault,
}

extension UploadStateValueExtension on UploadState {
  String toValue() {
    switch (this) {
      case UploadState.processing:
        return 'PROCESSING';
      case UploadState.complete:
        return 'COMPLETE';
      case UploadState.failed:
        return 'FAILED';
      case UploadState.fault:
        return 'FAULT';
    }
  }
}

extension UploadStateFromString on String {
  UploadState toUploadState() {
    switch (this) {
      case 'PROCESSING':
        return UploadState.processing;
      case 'COMPLETE':
        return UploadState.complete;
      case 'FAILED':
        return UploadState.failed;
      case 'FAULT':
        return UploadState.fault;
    }
    throw Exception('$this is not known in enum UploadState');
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
