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

/// Amazon SimpleDB is a web service providing the core database functions of
/// data indexing and querying in the cloud. By offloading the time and effort
/// associated with building and operating a web-scale database, SimpleDB
/// provides developers the freedom to focus on application development. A
/// traditional, clustered relational database requires a sizable upfront
/// capital outlay, is complex to design, and often requires extensive and
/// repetitive database administration. Amazon SimpleDB is dramatically simpler,
/// requiring no schema, automatically indexing your data and providing a simple
/// API for storage and access. This approach eliminates the administrative
/// burden of data modeling, index maintenance, and performance tuning.
/// Developers gain access to this functionality within Amazon's proven
/// computing environment, are able to scale instantly, and pay only for what
/// they use.
class SimpleDBV2 {
  final _s.RestJsonProtocol _protocol;
  SimpleDBV2({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'sdb',
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

  /// Returns information for an existing domain export.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [NoSuchExportException].
  ///
  /// Parameter [exportArn] :
  /// Unique ARN identifier of the export.
  Future<GetExportResponse> getExport({
    required String exportArn,
  }) async {
    final $payload = <String, dynamic>{
      'exportArn': exportArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/GetExport',
      exceptionFnMap: _exceptionFns,
    );
    return GetExportResponse.fromJson(response);
  }

  /// Lists all exports that were created. The results are paginated and can be
  /// filtered by domain name.
  ///
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidParameterValueException].
  /// May throw [NoSuchDomainException].
  ///
  /// Parameter [domainName] :
  /// The name of the domain to filter exports. If not provided, exports for all
  /// the domains will be listed.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of exports to return in a single response.
  ///
  /// Parameter [nextToken] :
  /// A pagination token used to retrieve the next page of results. This token
  /// is obtained from the nextToken field in the previous ListExportsResponse.
  /// Leave empty for the first request.
  Future<ListExportsResponse> listExports({
    String? domainName,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final $payload = <String, dynamic>{
      if (domainName != null) 'domainName': domainName,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/ListExports',
      exceptionFnMap: _exceptionFns,
    );
    return ListExportsResponse.fromJson(response);
  }

  /// Initiates the export of a SimpleDB domain to an S3 bucket.
  ///
  /// May throw [ConflictException].
  /// May throw [InvalidParameterCombinationException].
  /// May throw [InvalidParameterValueException].
  /// May throw [NoSuchDomainException].
  /// May throw [NumberExportsLimitExceeded].
  ///
  /// Parameter [domainName] :
  /// The name of the domain to export.
  ///
  /// Parameter [s3Bucket] :
  /// The name of the S3 bucket where the domain data will be exported.
  ///
  /// Parameter [clientToken] :
  /// Providing a ClientToken makes the call to StartDomainExport API
  /// idempotent, meaning that multiple identical calls have the same effect as
  /// one single call. A client token is valid for 8 hours after the first
  /// request that uses it is completed. After 8 hours, any request with the
  /// same client token is treated as a new request. Do not resubmit the same
  /// request with the same client token for more than 8 hours, or the result
  /// might not be idempotent. If you submit a request with the same client
  /// token but a change in other parameters within the 8-hour idempotency
  /// window, a ConflictException will be returned.
  ///
  /// Parameter [s3BucketOwner] :
  /// The ID of the AWS account that owns the bucket the export will be stored
  /// in.
  ///
  /// Parameter [s3KeyPrefix] :
  /// The prefix string to be used to generate the S3 object keys for export
  /// artifacts.
  ///
  /// Parameter [s3SseAlgorithm] :
  /// The server-side encryption algorithm to use for the exported data in S3.
  /// Valid values are: AES256 (SSE-S3) and KMS (SSE-KMS). If not specified,
  /// bucket's default encryption will apply.
  ///
  /// Parameter [s3SseKmsKeyId] :
  /// The KMS key ID to use for server-side encryption with AWS KMS-managed keys
  /// (SSE-KMS). This parameter is only expected with KMS as the S3 SSE
  /// algorithm.
  Future<StartDomainExportResponse> startDomainExport({
    required String domainName,
    required String s3Bucket,
    String? clientToken,
    String? s3BucketOwner,
    String? s3KeyPrefix,
    S3SseAlgorithm? s3SseAlgorithm,
    String? s3SseKmsKeyId,
  }) async {
    final $payload = <String, dynamic>{
      'domainName': domainName,
      's3Bucket': s3Bucket,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (s3BucketOwner != null) 's3BucketOwner': s3BucketOwner,
      if (s3KeyPrefix != null) 's3KeyPrefix': s3KeyPrefix,
      if (s3SseAlgorithm != null) 's3SseAlgorithm': s3SseAlgorithm.value,
      if (s3SseKmsKeyId != null) 's3SseKmsKeyId': s3SseKmsKeyId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/StartDomainExport',
      exceptionFnMap: _exceptionFns,
    );
    return StartDomainExportResponse.fromJson(response);
  }
}

class GetExportResponse {
  /// The client token provided for this export.
  final String clientToken;

  /// The name of the domain that was exported.
  final String domainName;

  /// Unique ARN identifier of the export.
  final String exportArn;

  /// The current state of the export. Current possible values include : PENDING -
  /// export request received, IN_PROGRESS - export is being processed, SUCCEEDED
  /// - export completed successfully, and FAILED - export encountered an error.
  final ExportStatus exportStatus;

  /// Timestamp when the export request was received by the service.
  final DateTime requestedAt;

  /// The name of the S3 bucket for this export.
  final String s3Bucket;

  /// The timestamp indicating the cutoff point for data inclusion in the export.
  /// All data inserted or modified before this time will be present in the
  /// exported data. Data insertions or modifications after this timestamp may or
  /// may not be present in the export.
  final DateTime? exportDataCutoffTime;

  /// The name of the manifest summary file for the export.
  final String? exportManifest;

  /// Failure code for the result of the failed export.
  final String? failureCode;

  /// Export failure reason description.
  final String? failureMessage;

  /// Total number of exported items.
  final int? itemsCount;

  /// The S3 bucket owner account ID for this export.
  final String? s3BucketOwner;

  /// The S3 key prefix provided in the corresponding StartDomainExport request.
  final String? s3KeyPrefix;

  /// The S3 SSE encryption algorithm for this export.
  final S3SseAlgorithm? s3SseAlgorithm;

  /// The KMS key ID for this export.
  final String? s3SseKmsKeyId;

  GetExportResponse({
    required this.clientToken,
    required this.domainName,
    required this.exportArn,
    required this.exportStatus,
    required this.requestedAt,
    required this.s3Bucket,
    this.exportDataCutoffTime,
    this.exportManifest,
    this.failureCode,
    this.failureMessage,
    this.itemsCount,
    this.s3BucketOwner,
    this.s3KeyPrefix,
    this.s3SseAlgorithm,
    this.s3SseKmsKeyId,
  });

  factory GetExportResponse.fromJson(Map<String, dynamic> json) {
    return GetExportResponse(
      clientToken: (json['clientToken'] as String?) ?? '',
      domainName: (json['domainName'] as String?) ?? '',
      exportArn: (json['exportArn'] as String?) ?? '',
      exportStatus:
          ExportStatus.fromString((json['exportStatus'] as String?) ?? ''),
      requestedAt: nonNullableTimeStampFromJson(json['requestedAt'] ?? 0),
      s3Bucket: (json['s3Bucket'] as String?) ?? '',
      exportDataCutoffTime: timeStampFromJson(json['exportDataCutoffTime']),
      exportManifest: json['exportManifest'] as String?,
      failureCode: json['failureCode'] as String?,
      failureMessage: json['failureMessage'] as String?,
      itemsCount: json['itemsCount'] as int?,
      s3BucketOwner: json['s3BucketOwner'] as String?,
      s3KeyPrefix: json['s3KeyPrefix'] as String?,
      s3SseAlgorithm:
          (json['s3SseAlgorithm'] as String?)?.let(S3SseAlgorithm.fromString),
      s3SseKmsKeyId: json['s3SseKmsKeyId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clientToken = this.clientToken;
    final domainName = this.domainName;
    final exportArn = this.exportArn;
    final exportStatus = this.exportStatus;
    final requestedAt = this.requestedAt;
    final s3Bucket = this.s3Bucket;
    final exportDataCutoffTime = this.exportDataCutoffTime;
    final exportManifest = this.exportManifest;
    final failureCode = this.failureCode;
    final failureMessage = this.failureMessage;
    final itemsCount = this.itemsCount;
    final s3BucketOwner = this.s3BucketOwner;
    final s3KeyPrefix = this.s3KeyPrefix;
    final s3SseAlgorithm = this.s3SseAlgorithm;
    final s3SseKmsKeyId = this.s3SseKmsKeyId;
    return {
      'clientToken': clientToken,
      'domainName': domainName,
      'exportArn': exportArn,
      'exportStatus': exportStatus.value,
      'requestedAt': unixTimestampToJson(requestedAt),
      's3Bucket': s3Bucket,
      if (exportDataCutoffTime != null)
        'exportDataCutoffTime': unixTimestampToJson(exportDataCutoffTime),
      if (exportManifest != null) 'exportManifest': exportManifest,
      if (failureCode != null) 'failureCode': failureCode,
      if (failureMessage != null) 'failureMessage': failureMessage,
      if (itemsCount != null) 'itemsCount': itemsCount,
      if (s3BucketOwner != null) 's3BucketOwner': s3BucketOwner,
      if (s3KeyPrefix != null) 's3KeyPrefix': s3KeyPrefix,
      if (s3SseAlgorithm != null) 's3SseAlgorithm': s3SseAlgorithm.value,
      if (s3SseKmsKeyId != null) 's3SseKmsKeyId': s3SseKmsKeyId,
    };
  }
}

class ListExportsResponse {
  /// List of export summaries containing export ARN, status, request timestamp,
  /// and associated domain name.
  final List<ExportSummary> exportSummaries;

  /// A pagination token indicating that more results are available. To retrieve
  /// the next page of results, provide this token in a subsequent ListExports
  /// request. If null or empty, there are no more results to retrieve.
  final String? nextToken;

  ListExportsResponse({
    required this.exportSummaries,
    this.nextToken,
  });

  factory ListExportsResponse.fromJson(Map<String, dynamic> json) {
    return ListExportsResponse(
      exportSummaries: ((json['exportSummaries'] as List?) ?? const [])
          .nonNulls
          .map((e) => ExportSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final exportSummaries = this.exportSummaries;
    final nextToken = this.nextToken;
    return {
      'exportSummaries': exportSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class StartDomainExportResponse {
  /// The client token that was provided in the request.
  final String clientToken;

  /// Unique ARN identifier of the export.
  final String exportArn;

  /// Timestamp when the export request was received by the service.
  final DateTime requestedAt;

  StartDomainExportResponse({
    required this.clientToken,
    required this.exportArn,
    required this.requestedAt,
  });

  factory StartDomainExportResponse.fromJson(Map<String, dynamic> json) {
    return StartDomainExportResponse(
      clientToken: (json['clientToken'] as String?) ?? '',
      exportArn: (json['exportArn'] as String?) ?? '',
      requestedAt: nonNullableTimeStampFromJson(json['requestedAt'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final clientToken = this.clientToken;
    final exportArn = this.exportArn;
    final requestedAt = this.requestedAt;
    return {
      'clientToken': clientToken,
      'exportArn': exportArn,
      'requestedAt': unixTimestampToJson(requestedAt),
    };
  }
}

class S3SseAlgorithm {
  static const aes256 = S3SseAlgorithm._('AES256');
  static const kms = S3SseAlgorithm._('KMS');

  final String value;

  const S3SseAlgorithm._(this.value);

  static const values = [aes256, kms];

  static S3SseAlgorithm fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => S3SseAlgorithm._(value));

  @override
  bool operator ==(other) => other is S3SseAlgorithm && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Summary information about an export, including its unique identifier,
/// current status, creation time, and the domain being exported.
class ExportSummary {
  /// The name of the domain for which the export was created.
  final String domainName;

  /// Unique ARN identifier of the export.
  final String exportArn;

  /// The current state of the export. Current possible values include : PENDING -
  /// export request received, IN_PROGRESS - export is being processed, SUCCEEDED
  /// - export completed successfully, and FAILED - export encountered an error.
  final ExportStatus exportStatus;

  /// Timestamp when the export request was received by the service
  final DateTime requestedAt;

  ExportSummary({
    required this.domainName,
    required this.exportArn,
    required this.exportStatus,
    required this.requestedAt,
  });

  factory ExportSummary.fromJson(Map<String, dynamic> json) {
    return ExportSummary(
      domainName: (json['domainName'] as String?) ?? '',
      exportArn: (json['exportArn'] as String?) ?? '',
      exportStatus:
          ExportStatus.fromString((json['exportStatus'] as String?) ?? ''),
      requestedAt: nonNullableTimeStampFromJson(json['requestedAt'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final domainName = this.domainName;
    final exportArn = this.exportArn;
    final exportStatus = this.exportStatus;
    final requestedAt = this.requestedAt;
    return {
      'domainName': domainName,
      'exportArn': exportArn,
      'exportStatus': exportStatus.value,
      'requestedAt': unixTimestampToJson(requestedAt),
    };
  }
}

/// The current state of the export. Current possible values include : PENDING -
/// export request received, IN_PROGRESS - export is being processed, SUCCEEDED
/// - export completed successfully, and FAILED - export encountered an error.
class ExportStatus {
  static const pending = ExportStatus._('PENDING');
  static const inProgress = ExportStatus._('IN_PROGRESS');
  static const succeeded = ExportStatus._('SUCCEEDED');
  static const failed = ExportStatus._('FAILED');

  final String value;

  const ExportStatus._(this.value);

  static const values = [pending, inProgress, succeeded, failed];

  static ExportStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ExportStatus._(value));

  @override
  bool operator ==(other) => other is ExportStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InvalidNextTokenException extends _s.GenericAwsException {
  InvalidNextTokenException({String? type, String? message})
      : super(type: type, code: 'InvalidNextTokenException', message: message);
}

class InvalidParameterCombinationException extends _s.GenericAwsException {
  InvalidParameterCombinationException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidParameterCombinationException',
            message: message);
}

class InvalidParameterValueException extends _s.GenericAwsException {
  InvalidParameterValueException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidParameterValueException',
            message: message);
}

class NoSuchDomainException extends _s.GenericAwsException {
  NoSuchDomainException({String? type, String? message})
      : super(type: type, code: 'NoSuchDomainException', message: message);
}

class NoSuchExportException extends _s.GenericAwsException {
  NoSuchExportException({String? type, String? message})
      : super(type: type, code: 'NoSuchExportException', message: message);
}

class NumberExportsLimitExceeded extends _s.GenericAwsException {
  NumberExportsLimitExceeded({String? type, String? message})
      : super(type: type, code: 'NumberExportsLimitExceeded', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'InvalidNextTokenException': (type, message) =>
      InvalidNextTokenException(type: type, message: message),
  'InvalidParameterCombinationException': (type, message) =>
      InvalidParameterCombinationException(type: type, message: message),
  'InvalidParameterValueException': (type, message) =>
      InvalidParameterValueException(type: type, message: message),
  'NoSuchDomainException': (type, message) =>
      NoSuchDomainException(type: type, message: message),
  'NoSuchExportException': (type, message) =>
      NoSuchExportException(type: type, message: message),
  'NumberExportsLimitExceeded': (type, message) =>
      NumberExportsLimitExceeded(type: type, message: message),
};
