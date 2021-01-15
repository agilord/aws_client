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
        Uint8ListConverter,
        Uint8ListListConverter,
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        timeStampFromJson,
        RfcDateTimeConverter,
        IsoDateTimeConverter,
        UnixDateTimeConverter,
        StringJsonConverter,
        Base64JsonConverter;

export '../../shared/shared.dart' show AwsClientCredentials;

part '2017-01-06.g.dart';

/// The AWS Cost and Usage Report API enables you to programmatically create,
/// query, and delete AWS Cost and Usage report definitions.
///
/// AWS Cost and Usage reports track the monthly AWS costs and usage associated
/// with your AWS account. The report contains line items for each unique
/// combination of AWS product, usage type, and operation that your AWS account
/// uses. You can configure the AWS Cost and Usage report to show only the data
/// that you want, using the AWS Cost and Usage API.
///
/// Service Endpoint
///
/// The AWS Cost and Usage Report API provides the following endpoint:
///
/// <ul>
/// <li>
/// cur.us-east-1.amazonaws.com
/// </li>
/// </ul>
class CostAndUsageReport {
  final _s.JsonProtocol _protocol;
  CostAndUsageReport({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'cur',
            signingName: 'cur',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Deletes the specified report.
  ///
  /// May throw [InternalErrorException].
  /// May throw [ValidationException].
  ///
  /// Parameter [reportName] :
  /// The name of the report that you want to delete. The name must be unique,
  /// is case sensitive, and can't include spaces.
  Future<DeleteReportDefinitionResponse> deleteReportDefinition({
    String reportName,
  }) async {
    _s.validateStringLength(
      'reportName',
      reportName,
      0,
      256,
    );
    _s.validateStringPattern(
      'reportName',
      reportName,
      r'''[0-9A-Za-z!\-_.*\'()]+''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSOrigamiServiceGatewayService.DeleteReportDefinition'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (reportName != null) 'ReportName': reportName,
      },
    );

    return DeleteReportDefinitionResponse.fromJson(jsonResponse.body);
  }

  /// Lists the AWS Cost and Usage reports available to this account.
  ///
  /// May throw [InternalErrorException].
  Future<DescribeReportDefinitionsResponse> describeReportDefinitions({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      5,
      5,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      256,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[A-Za-z0-9_\.\-=]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSOrigamiServiceGatewayService.DescribeReportDefinitions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeReportDefinitionsResponse.fromJson(jsonResponse.body);
  }

  /// Allows you to programatically update your report preferences.
  ///
  /// May throw [InternalErrorException].
  /// May throw [ValidationException].
  Future<void> modifyReportDefinition({
    @_s.required ReportDefinition reportDefinition,
    @_s.required String reportName,
  }) async {
    ArgumentError.checkNotNull(reportDefinition, 'reportDefinition');
    ArgumentError.checkNotNull(reportName, 'reportName');
    _s.validateStringLength(
      'reportName',
      reportName,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'reportName',
      reportName,
      r'''[0-9A-Za-z!\-_.*\'()]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSOrigamiServiceGatewayService.ModifyReportDefinition'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ReportDefinition': reportDefinition,
        'ReportName': reportName,
      },
    );

    return ModifyReportDefinitionResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new report using the description that you provide.
  ///
  /// May throw [DuplicateReportNameException].
  /// May throw [ReportLimitReachedException].
  /// May throw [InternalErrorException].
  /// May throw [ValidationException].
  ///
  /// Parameter [reportDefinition] :
  /// Represents the output of the PutReportDefinition operation. The content
  /// consists of the detailed metadata and data file information.
  Future<void> putReportDefinition({
    @_s.required ReportDefinition reportDefinition,
  }) async {
    ArgumentError.checkNotNull(reportDefinition, 'reportDefinition');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSOrigamiServiceGatewayService.PutReportDefinition'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ReportDefinition': reportDefinition,
      },
    );

    return PutReportDefinitionResponse.fromJson(jsonResponse.body);
  }
}

/// The region of the S3 bucket that AWS delivers the report into.
enum AWSRegion {
  @_s.JsonValue('af-south-1')
  afSouth_1,
  @_s.JsonValue('ap-east-1')
  apEast_1,
  @_s.JsonValue('ap-south-1')
  apSouth_1,
  @_s.JsonValue('ap-southeast-1')
  apSoutheast_1,
  @_s.JsonValue('ap-southeast-2')
  apSoutheast_2,
  @_s.JsonValue('ap-northeast-1')
  apNortheast_1,
  @_s.JsonValue('ap-northeast-2')
  apNortheast_2,
  @_s.JsonValue('ap-northeast-3')
  apNortheast_3,
  @_s.JsonValue('ca-central-1')
  caCentral_1,
  @_s.JsonValue('eu-central-1')
  euCentral_1,
  @_s.JsonValue('eu-west-1')
  euWest_1,
  @_s.JsonValue('eu-west-2')
  euWest_2,
  @_s.JsonValue('eu-west-3')
  euWest_3,
  @_s.JsonValue('eu-north-1')
  euNorth_1,
  @_s.JsonValue('eu-south-1')
  euSouth_1,
  @_s.JsonValue('me-south-1')
  meSouth_1,
  @_s.JsonValue('sa-east-1')
  saEast_1,
  @_s.JsonValue('us-east-1')
  usEast_1,
  @_s.JsonValue('us-east-2')
  usEast_2,
  @_s.JsonValue('us-west-1')
  usWest_1,
  @_s.JsonValue('us-west-2')
  usWest_2,
  @_s.JsonValue('cn-north-1')
  cnNorth_1,
  @_s.JsonValue('cn-northwest-1')
  cnNorthwest_1,
}

/// The types of manifest that you want AWS to create for this report.
enum AdditionalArtifact {
  @_s.JsonValue('REDSHIFT')
  redshift,
  @_s.JsonValue('QUICKSIGHT')
  quicksight,
  @_s.JsonValue('ATHENA')
  athena,
}

/// The compression format that AWS uses for the report.
enum CompressionFormat {
  @_s.JsonValue('ZIP')
  zip,
  @_s.JsonValue('GZIP')
  gzip,
  @_s.JsonValue('Parquet')
  parquet,
}

/// If the action is successful, the service sends back an HTTP 200 response.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteReportDefinitionResponse {
  @_s.JsonKey(name: 'ResponseMessage')
  final String responseMessage;

  DeleteReportDefinitionResponse({
    this.responseMessage,
  });
  factory DeleteReportDefinitionResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteReportDefinitionResponseFromJson(json);
}

/// If the action is successful, the service sends back an HTTP 200 response.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeReportDefinitionsResponse {
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A list of AWS Cost and Usage reports owned by the account.
  @_s.JsonKey(name: 'ReportDefinitions')
  final List<ReportDefinition> reportDefinitions;

  DescribeReportDefinitionsResponse({
    this.nextToken,
    this.reportDefinitions,
  });
  factory DescribeReportDefinitionsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeReportDefinitionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ModifyReportDefinitionResponse {
  ModifyReportDefinitionResponse();
  factory ModifyReportDefinitionResponse.fromJson(Map<String, dynamic> json) =>
      _$ModifyReportDefinitionResponseFromJson(json);
}

/// If the action is successful, the service sends back an HTTP 200 response
/// with an empty HTTP body.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutReportDefinitionResponse {
  PutReportDefinitionResponse();
  factory PutReportDefinitionResponse.fromJson(Map<String, dynamic> json) =>
      _$PutReportDefinitionResponseFromJson(json);
}

/// The definition of AWS Cost and Usage Report. You can specify the report
/// name, time unit, report format, compression format, S3 bucket, additional
/// artifacts, and schema elements in the definition.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ReportDefinition {
  /// A list of strings that indicate additional content that Amazon Web Services
  /// includes in the report, such as individual resource IDs.
  @_s.JsonKey(name: 'AdditionalSchemaElements')
  final List<SchemaElement> additionalSchemaElements;
  @_s.JsonKey(name: 'Compression')
  final CompressionFormat compression;
  @_s.JsonKey(name: 'Format')
  final ReportFormat format;
  @_s.JsonKey(name: 'ReportName')
  final String reportName;
  @_s.JsonKey(name: 'S3Bucket')
  final String s3Bucket;
  @_s.JsonKey(name: 'S3Prefix')
  final String s3Prefix;
  @_s.JsonKey(name: 'S3Region')
  final AWSRegion s3Region;
  @_s.JsonKey(name: 'TimeUnit')
  final TimeUnit timeUnit;

  /// A list of manifests that you want Amazon Web Services to create for this
  /// report.
  @_s.JsonKey(name: 'AdditionalArtifacts')
  final List<AdditionalArtifact> additionalArtifacts;

  /// Whether you want Amazon Web Services to update your reports after they have
  /// been finalized if Amazon Web Services detects charges related to previous
  /// months. These charges can include refunds, credits, or support fees.
  @_s.JsonKey(name: 'RefreshClosedReports')
  final bool refreshClosedReports;

  /// Whether you want Amazon Web Services to overwrite the previous version of
  /// each report or to deliver the report in addition to the previous versions.
  @_s.JsonKey(name: 'ReportVersioning')
  final ReportVersioning reportVersioning;

  ReportDefinition({
    @_s.required this.additionalSchemaElements,
    @_s.required this.compression,
    @_s.required this.format,
    @_s.required this.reportName,
    @_s.required this.s3Bucket,
    @_s.required this.s3Prefix,
    @_s.required this.s3Region,
    @_s.required this.timeUnit,
    this.additionalArtifacts,
    this.refreshClosedReports,
    this.reportVersioning,
  });
  factory ReportDefinition.fromJson(Map<String, dynamic> json) =>
      _$ReportDefinitionFromJson(json);

  Map<String, dynamic> toJson() => _$ReportDefinitionToJson(this);
}

/// The format that AWS saves the report in.
enum ReportFormat {
  @_s.JsonValue('textORcsv')
  textORcsv,
  @_s.JsonValue('Parquet')
  parquet,
}

enum ReportVersioning {
  @_s.JsonValue('CREATE_NEW_REPORT')
  createNewReport,
  @_s.JsonValue('OVERWRITE_REPORT')
  overwriteReport,
}

/// Whether or not AWS includes resource IDs in the report.
enum SchemaElement {
  @_s.JsonValue('RESOURCES')
  resources,
}

/// The length of time covered by the report.
enum TimeUnit {
  @_s.JsonValue('HOURLY')
  hourly,
  @_s.JsonValue('DAILY')
  daily,
  @_s.JsonValue('MONTHLY')
  monthly,
}

class DuplicateReportNameException extends _s.GenericAwsException {
  DuplicateReportNameException({String type, String message})
      : super(
            type: type, code: 'DuplicateReportNameException', message: message);
}

class InternalErrorException extends _s.GenericAwsException {
  InternalErrorException({String type, String message})
      : super(type: type, code: 'InternalErrorException', message: message);
}

class ReportLimitReachedException extends _s.GenericAwsException {
  ReportLimitReachedException({String type, String message})
      : super(
            type: type, code: 'ReportLimitReachedException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String type, String message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'DuplicateReportNameException': (type, message) =>
      DuplicateReportNameException(type: type, message: message),
  'InternalErrorException': (type, message) =>
      InternalErrorException(type: type, message: message),
  'ReportLimitReachedException': (type, message) =>
      ReportLimitReachedException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
