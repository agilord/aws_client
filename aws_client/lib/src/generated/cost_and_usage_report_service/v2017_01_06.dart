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
  CostAndUsageReport({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'cur',
            signingName: 'cur',
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
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalErrorException].
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
  /// May throw [ReportLimitReachedException].
  /// May throw [InternalErrorException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalErrorException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalErrorException].
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

/// The region of the S3 bucket that Amazon Web Services delivers the report
/// into.
enum AWSRegion {
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
  cnNorthwest_1,
}

extension AWSRegionValueExtension on AWSRegion {
  String toValue() {
    switch (this) {
      case AWSRegion.afSouth_1:
        return 'af-south-1';
      case AWSRegion.apEast_1:
        return 'ap-east-1';
      case AWSRegion.apSouth_1:
        return 'ap-south-1';
      case AWSRegion.apSouth_2:
        return 'ap-south-2';
      case AWSRegion.apSoutheast_1:
        return 'ap-southeast-1';
      case AWSRegion.apSoutheast_2:
        return 'ap-southeast-2';
      case AWSRegion.apSoutheast_3:
        return 'ap-southeast-3';
      case AWSRegion.apNortheast_1:
        return 'ap-northeast-1';
      case AWSRegion.apNortheast_2:
        return 'ap-northeast-2';
      case AWSRegion.apNortheast_3:
        return 'ap-northeast-3';
      case AWSRegion.caCentral_1:
        return 'ca-central-1';
      case AWSRegion.euCentral_1:
        return 'eu-central-1';
      case AWSRegion.euCentral_2:
        return 'eu-central-2';
      case AWSRegion.euWest_1:
        return 'eu-west-1';
      case AWSRegion.euWest_2:
        return 'eu-west-2';
      case AWSRegion.euWest_3:
        return 'eu-west-3';
      case AWSRegion.euNorth_1:
        return 'eu-north-1';
      case AWSRegion.euSouth_1:
        return 'eu-south-1';
      case AWSRegion.euSouth_2:
        return 'eu-south-2';
      case AWSRegion.meCentral_1:
        return 'me-central-1';
      case AWSRegion.meSouth_1:
        return 'me-south-1';
      case AWSRegion.saEast_1:
        return 'sa-east-1';
      case AWSRegion.usEast_1:
        return 'us-east-1';
      case AWSRegion.usEast_2:
        return 'us-east-2';
      case AWSRegion.usWest_1:
        return 'us-west-1';
      case AWSRegion.usWest_2:
        return 'us-west-2';
      case AWSRegion.cnNorth_1:
        return 'cn-north-1';
      case AWSRegion.cnNorthwest_1:
        return 'cn-northwest-1';
    }
  }
}

extension AWSRegionFromString on String {
  AWSRegion toAWSRegion() {
    switch (this) {
      case 'af-south-1':
        return AWSRegion.afSouth_1;
      case 'ap-east-1':
        return AWSRegion.apEast_1;
      case 'ap-south-1':
        return AWSRegion.apSouth_1;
      case 'ap-south-2':
        return AWSRegion.apSouth_2;
      case 'ap-southeast-1':
        return AWSRegion.apSoutheast_1;
      case 'ap-southeast-2':
        return AWSRegion.apSoutheast_2;
      case 'ap-southeast-3':
        return AWSRegion.apSoutheast_3;
      case 'ap-northeast-1':
        return AWSRegion.apNortheast_1;
      case 'ap-northeast-2':
        return AWSRegion.apNortheast_2;
      case 'ap-northeast-3':
        return AWSRegion.apNortheast_3;
      case 'ca-central-1':
        return AWSRegion.caCentral_1;
      case 'eu-central-1':
        return AWSRegion.euCentral_1;
      case 'eu-central-2':
        return AWSRegion.euCentral_2;
      case 'eu-west-1':
        return AWSRegion.euWest_1;
      case 'eu-west-2':
        return AWSRegion.euWest_2;
      case 'eu-west-3':
        return AWSRegion.euWest_3;
      case 'eu-north-1':
        return AWSRegion.euNorth_1;
      case 'eu-south-1':
        return AWSRegion.euSouth_1;
      case 'eu-south-2':
        return AWSRegion.euSouth_2;
      case 'me-central-1':
        return AWSRegion.meCentral_1;
      case 'me-south-1':
        return AWSRegion.meSouth_1;
      case 'sa-east-1':
        return AWSRegion.saEast_1;
      case 'us-east-1':
        return AWSRegion.usEast_1;
      case 'us-east-2':
        return AWSRegion.usEast_2;
      case 'us-west-1':
        return AWSRegion.usWest_1;
      case 'us-west-2':
        return AWSRegion.usWest_2;
      case 'cn-north-1':
        return AWSRegion.cnNorth_1;
      case 'cn-northwest-1':
        return AWSRegion.cnNorthwest_1;
    }
    throw Exception('$this is not known in enum AWSRegion');
  }
}

/// The types of manifest that you want Amazon Web Services to create for this
/// report.
enum AdditionalArtifact {
  redshift,
  quicksight,
  athena,
}

extension AdditionalArtifactValueExtension on AdditionalArtifact {
  String toValue() {
    switch (this) {
      case AdditionalArtifact.redshift:
        return 'REDSHIFT';
      case AdditionalArtifact.quicksight:
        return 'QUICKSIGHT';
      case AdditionalArtifact.athena:
        return 'ATHENA';
    }
  }
}

extension AdditionalArtifactFromString on String {
  AdditionalArtifact toAdditionalArtifact() {
    switch (this) {
      case 'REDSHIFT':
        return AdditionalArtifact.redshift;
      case 'QUICKSIGHT':
        return AdditionalArtifact.quicksight;
      case 'ATHENA':
        return AdditionalArtifact.athena;
    }
    throw Exception('$this is not known in enum AdditionalArtifact');
  }
}

/// The compression format that Amazon Web Services uses for the report.
enum CompressionFormat {
  zip,
  gzip,
  parquet,
}

extension CompressionFormatValueExtension on CompressionFormat {
  String toValue() {
    switch (this) {
      case CompressionFormat.zip:
        return 'ZIP';
      case CompressionFormat.gzip:
        return 'GZIP';
      case CompressionFormat.parquet:
        return 'Parquet';
    }
  }
}

extension CompressionFormatFromString on String {
  CompressionFormat toCompressionFormat() {
    switch (this) {
      case 'ZIP':
        return CompressionFormat.zip;
      case 'GZIP':
        return CompressionFormat.gzip;
      case 'Parquet':
        return CompressionFormat.parquet;
    }
    throw Exception('$this is not known in enum CompressionFormat');
  }
}

/// If the action is successful, the service sends back an HTTP 200 response.
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
          ?.whereNotNull()
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

enum LastStatus {
  success,
  errorPermissions,
  errorNoBucket,
}

extension LastStatusValueExtension on LastStatus {
  String toValue() {
    switch (this) {
      case LastStatus.success:
        return 'SUCCESS';
      case LastStatus.errorPermissions:
        return 'ERROR_PERMISSIONS';
      case LastStatus.errorNoBucket:
        return 'ERROR_NO_BUCKET';
    }
  }
}

extension LastStatusFromString on String {
  LastStatus toLastStatus() {
    switch (this) {
      case 'SUCCESS':
        return LastStatus.success;
      case 'ERROR_PERMISSIONS':
        return LastStatus.errorPermissions;
      case 'ERROR_NO_BUCKET':
        return LastStatus.errorNoBucket;
    }
    throw Exception('$this is not known in enum LastStatus');
  }
}

class ListTagsForResourceResponse {
  /// The tags assigned to the report definition resource.
  final List<Tag>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
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
class PutReportDefinitionResponse {
  PutReportDefinitionResponse();

  factory PutReportDefinitionResponse.fromJson(Map<String, dynamic> _) {
    return PutReportDefinitionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The definition of Amazon Web Services Cost and Usage Report. You can specify
/// the report name, time unit, report format, compression format, S3 bucket,
/// additional artifacts, and schema elements in the definition.
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
      additionalSchemaElements: (json['AdditionalSchemaElements'] as List)
          .whereNotNull()
          .map((e) => (e as String).toSchemaElement())
          .toList(),
      compression: (json['Compression'] as String).toCompressionFormat(),
      format: (json['Format'] as String).toReportFormat(),
      reportName: json['ReportName'] as String,
      s3Bucket: json['S3Bucket'] as String,
      s3Prefix: json['S3Prefix'] as String,
      s3Region: (json['S3Region'] as String).toAWSRegion(),
      timeUnit: (json['TimeUnit'] as String).toTimeUnit(),
      additionalArtifacts: (json['AdditionalArtifacts'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toAdditionalArtifact())
          .toList(),
      billingViewArn: json['BillingViewArn'] as String?,
      refreshClosedReports: json['RefreshClosedReports'] as bool?,
      reportStatus: json['ReportStatus'] != null
          ? ReportStatus.fromJson(json['ReportStatus'] as Map<String, dynamic>)
          : null,
      reportVersioning:
          (json['ReportVersioning'] as String?)?.toReportVersioning(),
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
          additionalSchemaElements.map((e) => e.toValue()).toList(),
      'Compression': compression.toValue(),
      'Format': format.toValue(),
      'ReportName': reportName,
      'S3Bucket': s3Bucket,
      'S3Prefix': s3Prefix,
      'S3Region': s3Region.toValue(),
      'TimeUnit': timeUnit.toValue(),
      if (additionalArtifacts != null)
        'AdditionalArtifacts':
            additionalArtifacts.map((e) => e.toValue()).toList(),
      if (billingViewArn != null) 'BillingViewArn': billingViewArn,
      if (refreshClosedReports != null)
        'RefreshClosedReports': refreshClosedReports,
      if (reportStatus != null) 'ReportStatus': reportStatus,
      if (reportVersioning != null)
        'ReportVersioning': reportVersioning.toValue(),
    };
  }
}

/// The format that Amazon Web Services saves the report in.
enum ReportFormat {
  textORcsv,
  parquet,
}

extension ReportFormatValueExtension on ReportFormat {
  String toValue() {
    switch (this) {
      case ReportFormat.textORcsv:
        return 'textORcsv';
      case ReportFormat.parquet:
        return 'Parquet';
    }
  }
}

extension ReportFormatFromString on String {
  ReportFormat toReportFormat() {
    switch (this) {
      case 'textORcsv':
        return ReportFormat.textORcsv;
      case 'Parquet':
        return ReportFormat.parquet;
    }
    throw Exception('$this is not known in enum ReportFormat');
  }
}

/// A two element dictionary with a <code>lastDelivery</code> and
/// <code>lastStatus</code> key whose values describe the date and status of the
/// last delivered report for a particular report definition.
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
      lastStatus: (json['lastStatus'] as String?)?.toLastStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final lastDelivery = this.lastDelivery;
    final lastStatus = this.lastStatus;
    return {
      if (lastDelivery != null) 'lastDelivery': lastDelivery,
      if (lastStatus != null) 'lastStatus': lastStatus.toValue(),
    };
  }
}

enum ReportVersioning {
  createNewReport,
  overwriteReport,
}

extension ReportVersioningValueExtension on ReportVersioning {
  String toValue() {
    switch (this) {
      case ReportVersioning.createNewReport:
        return 'CREATE_NEW_REPORT';
      case ReportVersioning.overwriteReport:
        return 'OVERWRITE_REPORT';
    }
  }
}

extension ReportVersioningFromString on String {
  ReportVersioning toReportVersioning() {
    switch (this) {
      case 'CREATE_NEW_REPORT':
        return ReportVersioning.createNewReport;
      case 'OVERWRITE_REPORT':
        return ReportVersioning.overwriteReport;
    }
    throw Exception('$this is not known in enum ReportVersioning');
  }
}

/// Whether or not Amazon Web Services includes resource IDs in the report.
enum SchemaElement {
  resources,
  splitCostAllocationData,
  manualDiscountCompatibility,
}

extension SchemaElementValueExtension on SchemaElement {
  String toValue() {
    switch (this) {
      case SchemaElement.resources:
        return 'RESOURCES';
      case SchemaElement.splitCostAllocationData:
        return 'SPLIT_COST_ALLOCATION_DATA';
      case SchemaElement.manualDiscountCompatibility:
        return 'MANUAL_DISCOUNT_COMPATIBILITY';
    }
  }
}

extension SchemaElementFromString on String {
  SchemaElement toSchemaElement() {
    switch (this) {
      case 'RESOURCES':
        return SchemaElement.resources;
      case 'SPLIT_COST_ALLOCATION_DATA':
        return SchemaElement.splitCostAllocationData;
      case 'MANUAL_DISCOUNT_COMPATIBILITY':
        return SchemaElement.manualDiscountCompatibility;
    }
    throw Exception('$this is not known in enum SchemaElement');
  }
}

/// Describes a tag. A tag is a key-value pair. You can add up to 50 tags to a
/// report definition.
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
      key: json['Key'] as String,
      value: json['Value'] as String,
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

class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The length of time covered by the report.
enum TimeUnit {
  hourly,
  daily,
  monthly,
}

extension TimeUnitValueExtension on TimeUnit {
  String toValue() {
    switch (this) {
      case TimeUnit.hourly:
        return 'HOURLY';
      case TimeUnit.daily:
        return 'DAILY';
      case TimeUnit.monthly:
        return 'MONTHLY';
    }
  }
}

extension TimeUnitFromString on String {
  TimeUnit toTimeUnit() {
    switch (this) {
      case 'HOURLY':
        return TimeUnit.hourly;
      case 'DAILY':
        return TimeUnit.daily;
      case 'MONTHLY':
        return TimeUnit.monthly;
    }
    throw Exception('$this is not known in enum TimeUnit');
  }
}

class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DuplicateReportNameException extends _s.GenericAwsException {
  DuplicateReportNameException({String? type, String? message})
      : super(
            type: type, code: 'DuplicateReportNameException', message: message);
}

class InternalErrorException extends _s.GenericAwsException {
  InternalErrorException({String? type, String? message})
      : super(type: type, code: 'InternalErrorException', message: message);
}

class ReportLimitReachedException extends _s.GenericAwsException {
  ReportLimitReachedException({String? type, String? message})
      : super(
            type: type, code: 'ReportLimitReachedException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

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
