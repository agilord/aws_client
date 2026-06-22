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

import 'v2017_01_06.endpoints.dart' as _endpoints;
export '../../shared/shared.dart' show AwsClientCredentials;

/// You can use the Amazon Web Services Cost and Usage Report API to
/// programmatically create, query, and delete Amazon Web Services Cost and
/// Usage Report definitions.
///
/// Amazon Web Services Cost and Usage Report track the monthly Amazon Web
/// Services costs and usage associated with your Amazon Web Services account.
/// The report contains line items for each unique combination of Amazon Web
/// Services product, usage type, and operation that your Amazon Web Services
/// account uses. You can configure the Amazon Web Services Cost and Usage
/// Report to show only the data that you want, using the Amazon Web Services
/// Cost and Usage Report API.
///
/// Service Endpoint
///
/// The Amazon Web Services Cost and Usage Report API provides the following
/// endpoint:
///
/// <ul>
/// <li>
/// cur.us-east-1.amazonaws.com
/// </li>
/// </ul>
class CostAndUsageReport {
  final _s.JsonProtocol _protocol;
  factory CostAndUsageReport({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
    bool useFipsEndpoint = false,
    bool useDualStackEndpoint = false,
  }) {
    final service = _s.ServiceMetadata(
      endpointPrefix: 'cur',
    );
    return CostAndUsageReport._(
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
  CostAndUsageReport._({
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

  /// Deletes the specified report. Any tags associated with the report are also
  /// deleted.
  ///
  /// May throw [InternalErrorException].
  /// May throw [ValidationException].
  ///
  /// Parameter [reportName] :
  /// The name of the report that you want to delete. The name must be unique,
  /// is case sensitive, and can't include spaces.
  Future<DeleteReportDefinitionResponse> deleteReportDefinition({
    required String reportName,
  }) async {
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
        'ReportName': reportName,
      },
    );

    return DeleteReportDefinitionResponse.fromJson(jsonResponse.body);
  }

  /// Lists the Amazon Web Services Cost and Usage Report available to this
  /// account.
  ///
  /// May throw [InternalErrorException].
  Future<DescribeReportDefinitionsResponse> describeReportDefinitions({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      5,
      5,
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

  /// Lists the tags associated with the specified report definition.
  ///
  /// May throw [InternalErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [reportName] :
  /// The report name of the report definition that tags are to be returned for.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String reportName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSOrigamiServiceGatewayService.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ReportName': reportName,
      },
    );

    return ListTagsForResourceResponse.fromJson(jsonResponse.body);
  }

  /// Allows you to programmatically update your report preferences.
  ///
  /// May throw [InternalErrorException].
  /// May throw [ValidationException].
  Future<void> modifyReportDefinition({
    required ReportDefinition reportDefinition,
    required String reportName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSOrigamiServiceGatewayService.ModifyReportDefinition'
    };
    await _protocol.send(
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
  }

  /// Creates a new report using the description that you provide.
  ///
  /// May throw [DuplicateReportNameException].
  /// May throw [InternalErrorException].
  /// May throw [ReportLimitReachedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [reportDefinition] :
  /// Represents the output of the PutReportDefinition operation. The content
  /// consists of the detailed metadata and data file information.
  ///
  /// Parameter [tags] :
  /// The tags to be assigned to the report definition resource.
  Future<void> putReportDefinition({
    required ReportDefinition reportDefinition,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSOrigamiServiceGatewayService.PutReportDefinition'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ReportDefinition': reportDefinition,
        if (tags != null) 'Tags': tags,
      },
    );
  }

  /// Associates a set of tags with a report definition.
  ///
  /// May throw [InternalErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [reportName] :
  /// The report name of the report definition that tags are to be associated
  /// with.
  ///
  /// Parameter [tags] :
  /// The tags to be assigned to the report definition resource.
  Future<void> tagResource({
    required String reportName,
    required List<Tag> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSOrigamiServiceGatewayService.TagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ReportName': reportName,
        'Tags': tags,
      },
    );
  }

  /// Disassociates a set of tags from a report definition.
  ///
  /// May throw [InternalErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [reportName] :
  /// The report name of the report definition that tags are to be disassociated
  /// from.
  ///
  /// Parameter [tagKeys] :
  /// The tags to be disassociated from the report definition resource.
  Future<void> untagResource({
    required String reportName,
    required List<String> tagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSOrigamiServiceGatewayService.UntagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ReportName': reportName,
        'TagKeys': tagKeys,
      },
    );
  }
}

/// If the action is successful, the service sends back an HTTP 200 response.
///
/// @nodoc
class DeleteReportDefinitionResponse {
  final String? responseMessage;

  DeleteReportDefinitionResponse({
    this.responseMessage,
  });

  factory DeleteReportDefinitionResponse.fromJson(Map<String, dynamic> json) {
    return DeleteReportDefinitionResponse(
      responseMessage: json['ResponseMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final responseMessage = this.responseMessage;
    return {
      if (responseMessage != null) 'ResponseMessage': responseMessage,
    };
  }
}

/// If the action is successful, the service sends back an HTTP 200 response.
///
/// @nodoc
class DescribeReportDefinitionsResponse {
  final String? nextToken;

  /// An Amazon Web Services Cost and Usage Report list owned by the account.
  final List<ReportDefinition>? reportDefinitions;

  DescribeReportDefinitionsResponse({
    this.nextToken,
    this.reportDefinitions,
  });

  factory DescribeReportDefinitionsResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeReportDefinitionsResponse(
      nextToken: json['NextToken'] as String?,
      reportDefinitions: (json['ReportDefinitions'] as List?)
          ?.nonNulls
          .map((e) => ReportDefinition.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final reportDefinitions = this.reportDefinitions;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (reportDefinitions != null) 'ReportDefinitions': reportDefinitions,
    };
  }
}

/// @nodoc
class ListTagsForResourceResponse {
  /// The tags assigned to the report definition resource.
  final List<Tag>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['Tags'] as List?)
          ?.nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
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
class ModifyReportDefinitionResponse {
  ModifyReportDefinitionResponse();

  factory ModifyReportDefinitionResponse.fromJson(Map<String, dynamic> _) {
    return ModifyReportDefinitionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// If the action is successful, the service sends back an HTTP 200 response
/// with an empty HTTP body.
///
/// @nodoc
class PutReportDefinitionResponse {
  PutReportDefinitionResponse();

  factory PutReportDefinitionResponse.fromJson(Map<String, dynamic> _) {
    return PutReportDefinitionResponse();
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

/// Describes a tag. A tag is a key-value pair. You can add up to 50 tags to a
/// report definition.
///
/// @nodoc
class Tag {
  /// The key of the tag. Tag keys are case sensitive. Each report definition can
  /// only have up to one tag with the same key. If you try to add an existing tag
  /// with the same key, the existing tag value will be updated to the new value.
  final String key;

  /// The value of the tag. Tag values are case-sensitive. This can be an empty
  /// string.
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

/// The definition of Amazon Web Services Cost and Usage Report. You can specify
/// the report name, time unit, report format, compression format, S3 bucket,
/// additional artifacts, and schema elements in the definition.
///
/// @nodoc
class ReportDefinition {
  /// A list of strings that indicate additional content that Amazon Web Services
  /// includes in the report, such as individual resource IDs.
  final List<SchemaElement> additionalSchemaElements;
  final CompressionFormat compression;
  final ReportFormat format;
  final String reportName;
  final String s3Bucket;
  final String s3Prefix;
  final AWSRegion s3Region;
  final TimeUnit timeUnit;

  /// A list of manifests that you want Amazon Web Services to create for this
  /// report.
  final List<AdditionalArtifact>? additionalArtifacts;

  /// The Amazon resource name of the billing view. The
  /// <code>BillingViewArn</code> is needed to create Amazon Web Services Cost and
  /// Usage Report for each billing group maintained in the Amazon Web Services
  /// Billing Conductor service. The <code>BillingViewArn</code> for a billing
  /// group can be constructed as:
  /// <code>arn:aws:billing::payer-account-id:billingview/billing-group-primary-account-id</code>
  final String? billingViewArn;

  /// Whether you want Amazon Web Services to update your reports after they have
  /// been finalized if Amazon Web Services detects charges related to previous
  /// months. These charges can include refunds, credits, or support fees.
  final bool? refreshClosedReports;

  /// The status of the report.
  final ReportStatus? reportStatus;

  /// Whether you want Amazon Web Services to overwrite the previous version of
  /// each report or to deliver the report in addition to the previous versions.
  final ReportVersioning? reportVersioning;

  ReportDefinition({
    required this.additionalSchemaElements,
    required this.compression,
    required this.format,
    required this.reportName,
    required this.s3Bucket,
    required this.s3Prefix,
    required this.s3Region,
    required this.timeUnit,
    this.additionalArtifacts,
    this.billingViewArn,
    this.refreshClosedReports,
    this.reportStatus,
    this.reportVersioning,
  });

  factory ReportDefinition.fromJson(Map<String, dynamic> json) {
    return ReportDefinition(
      additionalSchemaElements:
          ((json['AdditionalSchemaElements'] as List?) ?? const [])
              .nonNulls
              .map((e) => SchemaElement.fromString((e as String)))
              .toList(),
      compression:
          CompressionFormat.fromString((json['Compression'] as String?) ?? ''),
      format: ReportFormat.fromString((json['Format'] as String?) ?? ''),
      reportName: (json['ReportName'] as String?) ?? '',
      s3Bucket: (json['S3Bucket'] as String?) ?? '',
      s3Prefix: (json['S3Prefix'] as String?) ?? '',
      s3Region: AWSRegion.fromString((json['S3Region'] as String?) ?? ''),
      timeUnit: TimeUnit.fromString((json['TimeUnit'] as String?) ?? ''),
      additionalArtifacts: (json['AdditionalArtifacts'] as List?)
          ?.nonNulls
          .map((e) => AdditionalArtifact.fromString((e as String)))
          .toList(),
      billingViewArn: json['BillingViewArn'] as String?,
      refreshClosedReports: json['RefreshClosedReports'] as bool?,
      reportStatus: json['ReportStatus'] != null
          ? ReportStatus.fromJson(json['ReportStatus'] as Map<String, dynamic>)
          : null,
      reportVersioning: (json['ReportVersioning'] as String?)
          ?.let(ReportVersioning.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final additionalSchemaElements = this.additionalSchemaElements;
    final compression = this.compression;
    final format = this.format;
    final reportName = this.reportName;
    final s3Bucket = this.s3Bucket;
    final s3Prefix = this.s3Prefix;
    final s3Region = this.s3Region;
    final timeUnit = this.timeUnit;
    final additionalArtifacts = this.additionalArtifacts;
    final billingViewArn = this.billingViewArn;
    final refreshClosedReports = this.refreshClosedReports;
    final reportStatus = this.reportStatus;
    final reportVersioning = this.reportVersioning;
    return {
      'AdditionalSchemaElements':
          additionalSchemaElements.map((e) => e.value).toList(),
      'Compression': compression.value,
      'Format': format.value,
      'ReportName': reportName,
      'S3Bucket': s3Bucket,
      'S3Prefix': s3Prefix,
      'S3Region': s3Region.value,
      'TimeUnit': timeUnit.value,
      if (additionalArtifacts != null)
        'AdditionalArtifacts': additionalArtifacts.map((e) => e.value).toList(),
      if (billingViewArn != null) 'BillingViewArn': billingViewArn,
      if (refreshClosedReports != null)
        'RefreshClosedReports': refreshClosedReports,
      if (reportStatus != null) 'ReportStatus': reportStatus,
      if (reportVersioning != null) 'ReportVersioning': reportVersioning.value,
    };
  }
}

/// The length of time covered by the report.
///
/// @nodoc
class TimeUnit {
  static const hourly = TimeUnit._('HOURLY');
  static const daily = TimeUnit._('DAILY');
  static const monthly = TimeUnit._('MONTHLY');

  final String value;

  const TimeUnit._(this.value);

  static const values = [hourly, daily, monthly];

  static TimeUnit fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => TimeUnit._(value));

  @override
  bool operator ==(other) => other is TimeUnit && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The format that Amazon Web Services saves the report in.
///
/// @nodoc
class ReportFormat {
  static const textORcsv = ReportFormat._('textORcsv');
  static const parquet = ReportFormat._('Parquet');

  final String value;

  const ReportFormat._(this.value);

  static const values = [textORcsv, parquet];

  static ReportFormat fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ReportFormat._(value));

  @override
  bool operator ==(other) => other is ReportFormat && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The compression format that Amazon Web Services uses for the report.
///
/// @nodoc
class CompressionFormat {
  static const zip = CompressionFormat._('ZIP');
  static const gzip = CompressionFormat._('GZIP');
  static const parquet = CompressionFormat._('Parquet');

  final String value;

  const CompressionFormat._(this.value);

  static const values = [zip, gzip, parquet];

  static CompressionFormat fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CompressionFormat._(value));

  @override
  bool operator ==(other) => other is CompressionFormat && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The region of the S3 bucket that Amazon Web Services delivers the report
/// into.
///
/// @nodoc
class AWSRegion {
  static const afSouth_1 = AWSRegion._('af-south-1');
  static const apEast_1 = AWSRegion._('ap-east-1');
  static const apSouth_1 = AWSRegion._('ap-south-1');
  static const apSouth_2 = AWSRegion._('ap-south-2');
  static const apSoutheast_1 = AWSRegion._('ap-southeast-1');
  static const apSoutheast_2 = AWSRegion._('ap-southeast-2');
  static const apSoutheast_3 = AWSRegion._('ap-southeast-3');
  static const apNortheast_1 = AWSRegion._('ap-northeast-1');
  static const apNortheast_2 = AWSRegion._('ap-northeast-2');
  static const apNortheast_3 = AWSRegion._('ap-northeast-3');
  static const caCentral_1 = AWSRegion._('ca-central-1');
  static const euCentral_1 = AWSRegion._('eu-central-1');
  static const euCentral_2 = AWSRegion._('eu-central-2');
  static const euWest_1 = AWSRegion._('eu-west-1');
  static const euWest_2 = AWSRegion._('eu-west-2');
  static const euWest_3 = AWSRegion._('eu-west-3');
  static const euNorth_1 = AWSRegion._('eu-north-1');
  static const euSouth_1 = AWSRegion._('eu-south-1');
  static const euSouth_2 = AWSRegion._('eu-south-2');
  static const meCentral_1 = AWSRegion._('me-central-1');
  static const meSouth_1 = AWSRegion._('me-south-1');
  static const saEast_1 = AWSRegion._('sa-east-1');
  static const usEast_1 = AWSRegion._('us-east-1');
  static const usEast_2 = AWSRegion._('us-east-2');
  static const usWest_1 = AWSRegion._('us-west-1');
  static const usWest_2 = AWSRegion._('us-west-2');
  static const cnNorth_1 = AWSRegion._('cn-north-1');
  static const cnNorthwest_1 = AWSRegion._('cn-northwest-1');

  final String value;

  const AWSRegion._(this.value);

  static const values = [
    afSouth_1,
    apEast_1,
    apSouth_1,
    apSouth_2,
    apSoutheast_1,
    apSoutheast_2,
    apSoutheast_3,
    apNortheast_1,
    apNortheast_2,
    apNortheast_3,
    caCentral_1,
    euCentral_1,
    euCentral_2,
    euWest_1,
    euWest_2,
    euWest_3,
    euNorth_1,
    euSouth_1,
    euSouth_2,
    meCentral_1,
    meSouth_1,
    saEast_1,
    usEast_1,
    usEast_2,
    usWest_1,
    usWest_2,
    cnNorth_1,
    cnNorthwest_1
  ];

  static AWSRegion fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => AWSRegion._(value));

  @override
  bool operator ==(other) => other is AWSRegion && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ReportVersioning {
  static const createNewReport = ReportVersioning._('CREATE_NEW_REPORT');
  static const overwriteReport = ReportVersioning._('OVERWRITE_REPORT');

  final String value;

  const ReportVersioning._(this.value);

  static const values = [createNewReport, overwriteReport];

  static ReportVersioning fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ReportVersioning._(value));

  @override
  bool operator ==(other) => other is ReportVersioning && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A two element dictionary with a <code>lastDelivery</code> and
/// <code>lastStatus</code> key whose values describe the date and status of the
/// last delivered report for a particular report definition.
///
/// @nodoc
class ReportStatus {
  /// A timestamp that gives the date of a report delivery.
  final String? lastDelivery;

  /// An enum that gives the status of a report delivery.
  final LastStatus? lastStatus;

  ReportStatus({
    this.lastDelivery,
    this.lastStatus,
  });

  factory ReportStatus.fromJson(Map<String, dynamic> json) {
    return ReportStatus(
      lastDelivery: json['lastDelivery'] as String?,
      lastStatus: (json['lastStatus'] as String?)?.let(LastStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final lastDelivery = this.lastDelivery;
    final lastStatus = this.lastStatus;
    return {
      if (lastDelivery != null) 'lastDelivery': lastDelivery,
      if (lastStatus != null) 'lastStatus': lastStatus.value,
    };
  }
}

/// @nodoc
class LastStatus {
  static const success = LastStatus._('SUCCESS');
  static const errorPermissions = LastStatus._('ERROR_PERMISSIONS');
  static const errorNoBucket = LastStatus._('ERROR_NO_BUCKET');

  final String value;

  const LastStatus._(this.value);

  static const values = [success, errorPermissions, errorNoBucket];

  static LastStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => LastStatus._(value));

  @override
  bool operator ==(other) => other is LastStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The types of manifest that you want Amazon Web Services to create for this
/// report.
///
/// @nodoc
class AdditionalArtifact {
  static const redshift = AdditionalArtifact._('REDSHIFT');
  static const quicksight = AdditionalArtifact._('QUICKSIGHT');
  static const athena = AdditionalArtifact._('ATHENA');

  final String value;

  const AdditionalArtifact._(this.value);

  static const values = [redshift, quicksight, athena];

  static AdditionalArtifact fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AdditionalArtifact._(value));

  @override
  bool operator ==(other) =>
      other is AdditionalArtifact && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Whether or not Amazon Web Services includes resource IDs in the report.
///
/// @nodoc
class SchemaElement {
  static const resources = SchemaElement._('RESOURCES');
  static const splitCostAllocationData =
      SchemaElement._('SPLIT_COST_ALLOCATION_DATA');
  static const manualDiscountCompatibility =
      SchemaElement._('MANUAL_DISCOUNT_COMPATIBILITY');

  final String value;

  const SchemaElement._(this.value);

  static const values = [
    resources,
    splitCostAllocationData,
    manualDiscountCompatibility
  ];

  static SchemaElement fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SchemaElement._(value));

  @override
  bool operator ==(other) => other is SchemaElement && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class DuplicateReportNameException extends _s.GenericAwsException {
  DuplicateReportNameException({String? type, String? message})
      : super(
            type: type, code: 'DuplicateReportNameException', message: message);
}

/// @nodoc
class InternalErrorException extends _s.GenericAwsException {
  InternalErrorException({String? type, String? message})
      : super(type: type, code: 'InternalErrorException', message: message);
}

/// @nodoc
class ReportLimitReachedException extends _s.GenericAwsException {
  ReportLimitReachedException({String? type, String? message})
      : super(
            type: type, code: 'ReportLimitReachedException', message: message);
}

/// @nodoc
class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

/// @nodoc
class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'DuplicateReportNameException': (type, message) =>
      DuplicateReportNameException(type: type, message: message),
  'InternalErrorException': (type, message) =>
      InternalErrorException(type: type, message: message),
  'ReportLimitReachedException': (type, message) =>
      ReportLimitReachedException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
