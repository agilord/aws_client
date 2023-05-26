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

/// This reference provides descriptions of the AWS Application Cost Profiler
/// API.
///
/// The AWS Application Cost Profiler API provides programmatic access to view,
/// create, update, and delete application cost report definitions, as well as
/// to import your usage data into the Application Cost Profiler service.
///
/// For more information about using this service, see the <a
/// href="https://docs.aws.amazon.com/application-cost-profiler/latest/userguide/introduction.html">AWS
/// Application Cost Profiler User Guide</a>.
class ApplicationCostProfiler {
  final _s.RestJsonProtocol _protocol;
  ApplicationCostProfiler({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'application-cost-profiler',
            signingName: 'application-cost-profiler',
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

  /// Deletes the specified report definition in AWS Application Cost Profiler.
  /// This stops the report from being generated.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [reportId] :
  /// Required. ID of the report to delete.
  Future<DeleteReportDefinitionResult> deleteReportDefinition({
    required String reportId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/reportDefinition/${Uri.encodeComponent(reportId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteReportDefinitionResult.fromJson(response);
  }

  /// Retrieves the definition of a report already configured in AWS Application
  /// Cost Profiler.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [reportId] :
  /// ID of the report to retrieve.
  Future<GetReportDefinitionResult> getReportDefinition({
    required String reportId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/reportDefinition/${Uri.encodeComponent(reportId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetReportDefinitionResult.fromJson(response);
  }

  /// Ingests application usage data from Amazon Simple Storage Service (Amazon
  /// S3).
  ///
  /// The data must already exist in the S3 location. As part of the action, AWS
  /// Application Cost Profiler copies the object from your S3 bucket to an S3
  /// bucket owned by Amazon for processing asynchronously.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [sourceS3Location] :
  /// Amazon S3 location to import application usage data from.
  Future<ImportApplicationUsageResult> importApplicationUsage({
    required SourceS3Location sourceS3Location,
  }) async {
    final $payload = <String, dynamic>{
      'sourceS3Location': sourceS3Location,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/importApplicationUsage',
      exceptionFnMap: _exceptionFns,
    );
    return ImportApplicationUsageResult.fromJson(response);
  }

  /// Retrieves a list of all reports and their configurations for your AWS
  /// account.
  ///
  /// The maximum number of reports is one.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// The token value from a previous call to access the next page of results.
  Future<ListReportDefinitionsResult> listReportDefinitions({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/reportDefinition',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListReportDefinitionsResult.fromJson(response);
  }

  /// Creates the report definition for a report in Application Cost Profiler.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [destinationS3Location] :
  /// Required. Amazon Simple Storage Service (Amazon S3) location where
  /// Application Cost Profiler uploads the report.
  ///
  /// Parameter [format] :
  /// Required. The format to use for the generated report.
  ///
  /// Parameter [reportDescription] :
  /// Required. Description of the report.
  ///
  /// Parameter [reportFrequency] :
  /// Required. The cadence to generate the report.
  ///
  /// Parameter [reportId] :
  /// Required. ID of the report. You can choose any valid string matching the
  /// pattern for the ID.
  Future<PutReportDefinitionResult> putReportDefinition({
    required S3Location destinationS3Location,
    required Format format,
    required String reportDescription,
    required ReportFrequency reportFrequency,
    required String reportId,
  }) async {
    final $payload = <String, dynamic>{
      'destinationS3Location': destinationS3Location,
      'format': format.toValue(),
      'reportDescription': reportDescription,
      'reportFrequency': reportFrequency.toValue(),
      'reportId': reportId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/reportDefinition',
      exceptionFnMap: _exceptionFns,
    );
    return PutReportDefinitionResult.fromJson(response);
  }

  /// Updates existing report in AWS Application Cost Profiler.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [destinationS3Location] :
  /// Required. Amazon Simple Storage Service (Amazon S3) location where
  /// Application Cost Profiler uploads the report.
  ///
  /// Parameter [format] :
  /// Required. The format to use for the generated report.
  ///
  /// Parameter [reportDescription] :
  /// Required. Description of the report.
  ///
  /// Parameter [reportFrequency] :
  /// Required. The cadence to generate the report.
  ///
  /// Parameter [reportId] :
  /// Required. ID of the report to update.
  Future<UpdateReportDefinitionResult> updateReportDefinition({
    required S3Location destinationS3Location,
    required Format format,
    required String reportDescription,
    required ReportFrequency reportFrequency,
    required String reportId,
  }) async {
    final $payload = <String, dynamic>{
      'destinationS3Location': destinationS3Location,
      'format': format.toValue(),
      'reportDescription': reportDescription,
      'reportFrequency': reportFrequency.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/reportDefinition/${Uri.encodeComponent(reportId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateReportDefinitionResult.fromJson(response);
  }
}

class DeleteReportDefinitionResult {
  /// ID of the report that was deleted.
  final String? reportId;

  DeleteReportDefinitionResult({
    this.reportId,
  });

  factory DeleteReportDefinitionResult.fromJson(Map<String, dynamic> json) {
    return DeleteReportDefinitionResult(
      reportId: json['reportId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final reportId = this.reportId;
    return {
      if (reportId != null) 'reportId': reportId,
    };
  }
}

enum Format {
  csv,
  parquet,
}

extension FormatValueExtension on Format {
  String toValue() {
    switch (this) {
      case Format.csv:
        return 'CSV';
      case Format.parquet:
        return 'PARQUET';
    }
  }
}

extension FormatFromString on String {
  Format toFormat() {
    switch (this) {
      case 'CSV':
        return Format.csv;
      case 'PARQUET':
        return Format.parquet;
    }
    throw Exception('$this is not known in enum Format');
  }
}

class GetReportDefinitionResult {
  /// Timestamp (milliseconds) when this report definition was created.
  final DateTime createdAt;

  /// Amazon Simple Storage Service (Amazon S3) location where the report is
  /// uploaded.
  final S3Location destinationS3Location;

  /// Format of the generated report.
  final Format format;

  /// Timestamp (milliseconds) when this report definition was last updated.
  final DateTime lastUpdated;

  /// Description of the report.
  final String reportDescription;

  /// Cadence used to generate the report.
  final ReportFrequency reportFrequency;

  /// ID of the report retrieved.
  final String reportId;

  GetReportDefinitionResult({
    required this.createdAt,
    required this.destinationS3Location,
    required this.format,
    required this.lastUpdated,
    required this.reportDescription,
    required this.reportFrequency,
    required this.reportId,
  });

  factory GetReportDefinitionResult.fromJson(Map<String, dynamic> json) {
    return GetReportDefinitionResult(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      destinationS3Location: S3Location.fromJson(
          json['destinationS3Location'] as Map<String, dynamic>),
      format: (json['format'] as String).toFormat(),
      lastUpdated: nonNullableTimeStampFromJson(json['lastUpdated'] as Object),
      reportDescription: json['reportDescription'] as String,
      reportFrequency: (json['reportFrequency'] as String).toReportFrequency(),
      reportId: json['reportId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final destinationS3Location = this.destinationS3Location;
    final format = this.format;
    final lastUpdated = this.lastUpdated;
    final reportDescription = this.reportDescription;
    final reportFrequency = this.reportFrequency;
    final reportId = this.reportId;
    return {
      'createdAt': unixTimestampToJson(createdAt),
      'destinationS3Location': destinationS3Location,
      'format': format.toValue(),
      'lastUpdated': unixTimestampToJson(lastUpdated),
      'reportDescription': reportDescription,
      'reportFrequency': reportFrequency.toValue(),
      'reportId': reportId,
    };
  }
}

class ImportApplicationUsageResult {
  /// ID of the import request.
  final String importId;

  ImportApplicationUsageResult({
    required this.importId,
  });

  factory ImportApplicationUsageResult.fromJson(Map<String, dynamic> json) {
    return ImportApplicationUsageResult(
      importId: json['importId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final importId = this.importId;
    return {
      'importId': importId,
    };
  }
}

class ListReportDefinitionsResult {
  /// The value of the next token, if it exists. Null if there are no more
  /// results.
  final String? nextToken;

  /// The retrieved reports.
  final List<ReportDefinition>? reportDefinitions;

  ListReportDefinitionsResult({
    this.nextToken,
    this.reportDefinitions,
  });

  factory ListReportDefinitionsResult.fromJson(Map<String, dynamic> json) {
    return ListReportDefinitionsResult(
      nextToken: json['nextToken'] as String?,
      reportDefinitions: (json['reportDefinitions'] as List?)
          ?.whereNotNull()
          .map((e) => ReportDefinition.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final reportDefinitions = this.reportDefinitions;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (reportDefinitions != null) 'reportDefinitions': reportDefinitions,
    };
  }
}

class PutReportDefinitionResult {
  /// ID of the report.
  final String? reportId;

  PutReportDefinitionResult({
    this.reportId,
  });

  factory PutReportDefinitionResult.fromJson(Map<String, dynamic> json) {
    return PutReportDefinitionResult(
      reportId: json['reportId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final reportId = this.reportId;
    return {
      if (reportId != null) 'reportId': reportId,
    };
  }
}

/// The configuration of a report in AWS Application Cost Profiler.
class ReportDefinition {
  /// Timestamp (milliseconds) when this report definition was created.
  final DateTime? createdAt;

  /// The location in Amazon Simple Storage Service (Amazon S3) the reports should
  /// be saved to.
  final S3Location? destinationS3Location;

  /// The format used for the generated reports.
  final Format? format;

  /// Timestamp (milliseconds) when this report definition was last updated.
  final DateTime? lastUpdatedAt;

  /// Description of the report
  final String? reportDescription;

  /// The cadence at which the report is generated.
  final ReportFrequency? reportFrequency;

  /// The ID of the report.
  final String? reportId;

  ReportDefinition({
    this.createdAt,
    this.destinationS3Location,
    this.format,
    this.lastUpdatedAt,
    this.reportDescription,
    this.reportFrequency,
    this.reportId,
  });

  factory ReportDefinition.fromJson(Map<String, dynamic> json) {
    return ReportDefinition(
      createdAt: timeStampFromJson(json['createdAt']),
      destinationS3Location: json['destinationS3Location'] != null
          ? S3Location.fromJson(
              json['destinationS3Location'] as Map<String, dynamic>)
          : null,
      format: (json['format'] as String?)?.toFormat(),
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      reportDescription: json['reportDescription'] as String?,
      reportFrequency:
          (json['reportFrequency'] as String?)?.toReportFrequency(),
      reportId: json['reportId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final destinationS3Location = this.destinationS3Location;
    final format = this.format;
    final lastUpdatedAt = this.lastUpdatedAt;
    final reportDescription = this.reportDescription;
    final reportFrequency = this.reportFrequency;
    final reportId = this.reportId;
    return {
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (destinationS3Location != null)
        'destinationS3Location': destinationS3Location,
      if (format != null) 'format': format.toValue(),
      if (lastUpdatedAt != null)
        'lastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (reportDescription != null) 'reportDescription': reportDescription,
      if (reportFrequency != null) 'reportFrequency': reportFrequency.toValue(),
      if (reportId != null) 'reportId': reportId,
    };
  }
}

enum ReportFrequency {
  monthly,
  daily,
  all,
}

extension ReportFrequencyValueExtension on ReportFrequency {
  String toValue() {
    switch (this) {
      case ReportFrequency.monthly:
        return 'MONTHLY';
      case ReportFrequency.daily:
        return 'DAILY';
      case ReportFrequency.all:
        return 'ALL';
    }
  }
}

extension ReportFrequencyFromString on String {
  ReportFrequency toReportFrequency() {
    switch (this) {
      case 'MONTHLY':
        return ReportFrequency.monthly;
      case 'DAILY':
        return ReportFrequency.daily;
      case 'ALL':
        return ReportFrequency.all;
    }
    throw Exception('$this is not known in enum ReportFrequency');
  }
}

enum S3BucketRegion {
  apEast_1,
  meSouth_1,
  euSouth_1,
  afSouth_1,
}

extension S3BucketRegionValueExtension on S3BucketRegion {
  String toValue() {
    switch (this) {
      case S3BucketRegion.apEast_1:
        return 'ap-east-1';
      case S3BucketRegion.meSouth_1:
        return 'me-south-1';
      case S3BucketRegion.euSouth_1:
        return 'eu-south-1';
      case S3BucketRegion.afSouth_1:
        return 'af-south-1';
    }
  }
}

extension S3BucketRegionFromString on String {
  S3BucketRegion toS3BucketRegion() {
    switch (this) {
      case 'ap-east-1':
        return S3BucketRegion.apEast_1;
      case 'me-south-1':
        return S3BucketRegion.meSouth_1;
      case 'eu-south-1':
        return S3BucketRegion.euSouth_1;
      case 'af-south-1':
        return S3BucketRegion.afSouth_1;
    }
    throw Exception('$this is not known in enum S3BucketRegion');
  }
}

/// Represents the Amazon Simple Storage Service (Amazon S3) location where AWS
/// Application Cost Profiler reports are generated and then written to.
class S3Location {
  /// Name of the S3 bucket.
  final String bucket;

  /// Prefix for the location to write to.
  final String prefix;

  S3Location({
    required this.bucket,
    required this.prefix,
  });

  factory S3Location.fromJson(Map<String, dynamic> json) {
    return S3Location(
      bucket: json['bucket'] as String,
      prefix: json['prefix'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final prefix = this.prefix;
    return {
      'bucket': bucket,
      'prefix': prefix,
    };
  }
}

/// Represents the Amazon Simple Storage Service (Amazon S3) location where
/// usage data is read from.
class SourceS3Location {
  /// Name of the bucket.
  final String bucket;

  /// Key of the object.
  final String key;

  /// Region of the bucket. Only required for Regions that are disabled by
  /// default. For more infomration about Regions that are disabled by default,
  /// see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/rande-manage.html#rande-manage-enable">
  /// Enabling a Region</a> in the <i>AWS General Reference guide</i>.
  final S3BucketRegion? region;

  SourceS3Location({
    required this.bucket,
    required this.key,
    this.region,
  });

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final key = this.key;
    final region = this.region;
    return {
      'bucket': bucket,
      'key': key,
      if (region != null) 'region': region.toValue(),
    };
  }
}

class UpdateReportDefinitionResult {
  /// ID of the report.
  final String? reportId;

  UpdateReportDefinitionResult({
    this.reportId,
  });

  factory UpdateReportDefinitionResult.fromJson(Map<String, dynamic> json) {
    return UpdateReportDefinitionResult(
      reportId: json['reportId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final reportId = this.reportId;
    return {
      if (reportId != null) 'reportId': reportId,
    };
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
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
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
