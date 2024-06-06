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

/// <note>
/// Amazon CodeGuru Security is in preview release and is subject to change.
/// </note>
/// This section provides documentation for the Amazon CodeGuru Security API
/// operations. CodeGuru Security is a service that uses program analysis and
/// machine learning to detect security policy violations and vulnerabilities,
/// and recommends ways to address these security risks.
///
/// By proactively detecting and providing recommendations for addressing
/// security risks, CodeGuru Security improves the overall security of your
/// application code. For more information about CodeGuru Security, see the <a
/// href="https://docs.aws.amazon.com/codeguru/latest/security-ug/what-is-codeguru-security.html">Amazon
/// CodeGuru Security User Guide</a>.
class CodeGuruSecurity {
  final _s.RestJsonProtocol _protocol;
  CodeGuruSecurity({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'codeguru-security',
            signingName: 'codeguru-security',
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

  /// Returns a list of requested findings from standard scans.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [findingIdentifiers] :
  /// A list of finding identifiers. Each identifier consists of a
  /// <code>scanName</code> and a <code>findingId</code>. You retrieve the
  /// <code>findingId</code> when you call <code>GetFindings</code>.
  Future<BatchGetFindingsResponse> batchGetFindings({
    required List<FindingIdentifier> findingIdentifiers,
  }) async {
    final $payload = <String, dynamic>{
      'findingIdentifiers': findingIdentifiers,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/batchGetFindings',
      exceptionFnMap: _exceptionFns,
    );
    return BatchGetFindingsResponse.fromJson(response);
  }

  /// Use to create a scan using code uploaded to an Amazon S3 bucket.
  ///
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [resourceId] :
  /// The identifier for the resource object to be scanned.
  ///
  /// Parameter [scanName] :
  /// The unique name that CodeGuru Security uses to track revisions across
  /// multiple scans of the same resource. Only allowed for a
  /// <code>STANDARD</code> scan type.
  ///
  /// Parameter [analysisType] :
  /// The type of analysis you want CodeGuru Security to perform in the scan,
  /// either <code>Security</code> or <code>All</code>. The
  /// <code>Security</code> type only generates findings related to security.
  /// The <code>All</code> type generates both security findings and quality
  /// findings. Defaults to <code>Security</code> type if missing.
  ///
  /// Parameter [clientToken] :
  /// The idempotency token for the request. Amazon CodeGuru Security uses this
  /// value to prevent the accidental creation of duplicate scans if there are
  /// failures and retries.
  ///
  /// Parameter [scanType] :
  /// The type of scan, either <code>Standard</code> or <code>Express</code>.
  /// Defaults to <code>Standard</code> type if missing.
  ///
  /// <code>Express</code> scans run on limited resources and use a limited set
  /// of detectors to analyze your code in near-real time. <code>Standard</code>
  /// scans have standard resource limits and use the full set of detectors to
  /// analyze your code.
  ///
  /// Parameter [tags] :
  /// An array of key-value pairs used to tag a scan. A tag is a custom
  /// attribute label with two parts:
  ///
  /// <ul>
  /// <li>
  /// A tag key. For example, <code>CostCenter</code>, <code>Environment</code>,
  /// or <code>Secret</code>. Tag keys are case sensitive.
  /// </li>
  /// <li>
  /// An optional tag value field. For example, <code>111122223333</code>,
  /// <code>Production</code>, or a team name. Omitting the tag value is the
  /// same as using an empty string. Tag values are case sensitive.
  /// </li>
  /// </ul>
  Future<CreateScanResponse> createScan({
    required ResourceId resourceId,
    required String scanName,
    AnalysisType? analysisType,
    String? clientToken,
    ScanType? scanType,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'resourceId': resourceId,
      'scanName': scanName,
      if (analysisType != null) 'analysisType': analysisType.toValue(),
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (scanType != null) 'scanType': scanType.toValue(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/scans',
      exceptionFnMap: _exceptionFns,
    );
    return CreateScanResponse.fromJson(response);
  }

  /// Generates a pre-signed URL, request headers used to upload a code
  /// resource, and code artifact identifier for the uploaded resource.
  ///
  /// You can upload your code resource to the URL with the request headers
  /// using any HTTP client.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [scanName] :
  /// The name of the scan that will use the uploaded resource. CodeGuru
  /// Security uses the unique scan name to track revisions across multiple
  /// scans of the same resource. Use this <code>scanName</code> when you call
  /// <code>CreateScan</code> on the code resource you upload to this URL.
  Future<CreateUploadUrlResponse> createUploadUrl({
    required String scanName,
  }) async {
    final $payload = <String, dynamic>{
      'scanName': scanName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/uploadUrl',
      exceptionFnMap: _exceptionFns,
    );
    return CreateUploadUrlResponse.fromJson(response);
  }

  /// Use to get the encryption configuration for an account.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  Future<GetAccountConfigurationResponse> getAccountConfiguration() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/accountConfiguration/get',
      exceptionFnMap: _exceptionFns,
    );
    return GetAccountConfigurationResponse.fromJson(response);
  }

  /// Returns a list of all findings generated by a particular scan.
  ///
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [scanName] :
  /// The name of the scan you want to retrieve findings from.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response. Use this
  /// parameter when paginating results. If additional results exist beyond the
  /// number you specify, the <code>nextToken</code> element is returned in the
  /// response. Use <code>nextToken</code> in a subsequent request to retrieve
  /// additional results. If not specified, returns 1000 results.
  ///
  /// Parameter [nextToken] :
  /// A token to use for paginating results that are returned in the response.
  /// Set the value of this parameter to null for the first request. For
  /// subsequent calls, use the <code>nextToken</code> value returned from the
  /// previous request to continue listing results after the first page.
  ///
  /// Parameter [status] :
  /// The status of the findings you want to get. Pass either <code>Open</code>,
  /// <code>Closed</code>, or <code>All</code>.
  Future<GetFindingsResponse> getFindings({
    required String scanName,
    int? maxResults,
    String? nextToken,
    Status? status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (status != null) 'status': [status.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/findings/${Uri.encodeComponent(scanName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetFindingsResponse.fromJson(response);
  }

  /// Returns a summary of metrics for an account from a specified date,
  /// including number of open findings, the categories with most findings, the
  /// scans with most open findings, and scans with most open critical findings.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [date] :
  /// The date you want to retrieve summary metrics from, rounded to the nearest
  /// day. The date must be within the past two years.
  Future<GetMetricsSummaryResponse> getMetricsSummary({
    required DateTime date,
  }) async {
    final $query = <String, List<String>>{
      'date': [_s.iso8601ToJson(date).toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/metrics/summary',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetMetricsSummaryResponse.fromJson(response);
  }

  /// Returns details about a scan, including whether or not a scan has
  /// completed.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [scanName] :
  /// The name of the scan you want to view details about.
  ///
  /// Parameter [runId] :
  /// UUID that identifies the individual scan run you want to view details
  /// about. You retrieve this when you call the <code>CreateScan</code>
  /// operation. Defaults to the latest scan run if missing.
  Future<GetScanResponse> getScan({
    required String scanName,
    String? runId,
  }) async {
    final $query = <String, List<String>>{
      if (runId != null) 'runId': [runId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/scans/${Uri.encodeComponent(scanName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetScanResponse.fromJson(response);
  }

  /// Returns metrics about all findings in an account within a specified time
  /// range.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [endDate] :
  /// The end date of the interval which you want to retrieve metrics from.
  /// Round to the nearest day.
  ///
  /// Parameter [startDate] :
  /// The start date of the interval which you want to retrieve metrics from.
  /// Rounds to the nearest day.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response. Use this
  /// parameter when paginating results. If additional results exist beyond the
  /// number you specify, the <code>nextToken</code> element is returned in the
  /// response. Use <code>nextToken</code> in a subsequent request to retrieve
  /// additional results. If not specified, returns 1000 results.
  ///
  /// Parameter [nextToken] :
  /// A token to use for paginating results that are returned in the response.
  /// Set the value of this parameter to null for the first request. For
  /// subsequent calls, use the <code>nextToken</code> value returned from the
  /// previous request to continue listing results after the first page.
  Future<ListFindingsMetricsResponse> listFindingsMetrics({
    required DateTime endDate,
    required DateTime startDate,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      'endDate': [_s.iso8601ToJson(endDate).toString()],
      'startDate': [_s.iso8601ToJson(startDate).toString()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/metrics/findings',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListFindingsMetricsResponse.fromJson(response);
  }

  /// Returns a list of all scans in an account. Does not return
  /// <code>EXPRESS</code> scans.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response. Use this
  /// parameter when paginating results. If additional results exist beyond the
  /// number you specify, the <code>nextToken</code> element is returned in the
  /// response. Use <code>nextToken</code> in a subsequent request to retrieve
  /// additional results. If not specified, returns 100 results.
  ///
  /// Parameter [nextToken] :
  /// A token to use for paginating results that are returned in the response.
  /// Set the value of this parameter to null for the first request. For
  /// subsequent calls, use the <code>nextToken</code> value returned from the
  /// previous request to continue listing results after the first page.
  Future<ListScansResponse> listScans({
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
      requestUri: '/scans',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListScansResponse.fromJson(response);
  }

  /// Returns a list of all tags associated with a scan.
  ///
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the <code>ScanName</code> object. You can retrieve this ARN by
  /// calling <code>CreateScan</code>, <code>ListScans</code>, or
  /// <code>GetScan</code>.
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

  /// Use to add one or more tags to an existing scan.
  ///
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the <code>ScanName</code> object. You can retrieve this ARN by
  /// calling <code>CreateScan</code>, <code>ListScans</code>, or
  /// <code>GetScan</code>.
  ///
  /// Parameter [tags] :
  /// An array of key-value pairs used to tag an existing scan. A tag is a
  /// custom attribute label with two parts:
  ///
  /// <ul>
  /// <li>
  /// A tag key. For example, <code>CostCenter</code>, <code>Environment</code>,
  /// or <code>Secret</code>. Tag keys are case sensitive.
  /// </li>
  /// <li>
  /// An optional tag value field. For example, <code>111122223333</code>,
  /// <code>Production</code>, or a team name. Omitting the tag value is the
  /// same as using an empty string. Tag values are case sensitive.
  /// </li>
  /// </ul>
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

  /// Use to remove one or more tags from an existing scan.
  ///
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the <code>ScanName</code> object. You can retrieve this ARN by
  /// calling <code>CreateScan</code>, <code>ListScans</code>, or
  /// <code>GetScan</code>.
  ///
  /// Parameter [tagKeys] :
  /// A list of keys for each tag you want to remove from a scan.
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

  /// Use to update the encryption configuration for an account.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [encryptionConfig] :
  /// The customer-managed KMS key ARN you want to use for encryption. If not
  /// specified, CodeGuru Security will use an AWS-managed key for encryption.
  /// If you previously specified a customer-managed KMS key and want CodeGuru
  /// Security to use an AWS-managed key for encryption instead, pass nothing.
  Future<UpdateAccountConfigurationResponse> updateAccountConfiguration({
    required EncryptionConfig encryptionConfig,
  }) async {
    final $payload = <String, dynamic>{
      'encryptionConfig': encryptionConfig,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/updateAccountConfiguration',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateAccountConfigurationResponse.fromJson(response);
  }
}

/// A summary of findings metrics for an account on a specified date.
class AccountFindingsMetric {
  /// The number of closed findings of each severity on the specified date.
  final FindingMetricsValuePerSeverity? closedFindings;

  /// The date from which the findings metrics were retrieved.
  final DateTime? date;

  /// The average time in days it takes to close findings of each severity as of a
  /// specified date.
  final FindingMetricsValuePerSeverity? meanTimeToClose;

  /// The number of new findings of each severity on the specified date.
  final FindingMetricsValuePerSeverity? newFindings;

  /// The number of open findings of each severity as of the specified date.
  final FindingMetricsValuePerSeverity? openFindings;

  AccountFindingsMetric({
    this.closedFindings,
    this.date,
    this.meanTimeToClose,
    this.newFindings,
    this.openFindings,
  });

  factory AccountFindingsMetric.fromJson(Map<String, dynamic> json) {
    return AccountFindingsMetric(
      closedFindings: json['closedFindings'] != null
          ? FindingMetricsValuePerSeverity.fromJson(
              json['closedFindings'] as Map<String, dynamic>)
          : null,
      date: timeStampFromJson(json['date']),
      meanTimeToClose: json['meanTimeToClose'] != null
          ? FindingMetricsValuePerSeverity.fromJson(
              json['meanTimeToClose'] as Map<String, dynamic>)
          : null,
      newFindings: json['newFindings'] != null
          ? FindingMetricsValuePerSeverity.fromJson(
              json['newFindings'] as Map<String, dynamic>)
          : null,
      openFindings: json['openFindings'] != null
          ? FindingMetricsValuePerSeverity.fromJson(
              json['openFindings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final closedFindings = this.closedFindings;
    final date = this.date;
    final meanTimeToClose = this.meanTimeToClose;
    final newFindings = this.newFindings;
    final openFindings = this.openFindings;
    return {
      if (closedFindings != null) 'closedFindings': closedFindings,
      if (date != null) 'date': unixTimestampToJson(date),
      if (meanTimeToClose != null) 'meanTimeToClose': meanTimeToClose,
      if (newFindings != null) 'newFindings': newFindings,
      if (openFindings != null) 'openFindings': openFindings,
    };
  }
}

enum AnalysisType {
  security,
  all,
}

extension AnalysisTypeValueExtension on AnalysisType {
  String toValue() {
    switch (this) {
      case AnalysisType.security:
        return 'Security';
      case AnalysisType.all:
        return 'All';
    }
  }
}

extension AnalysisTypeFromString on String {
  AnalysisType toAnalysisType() {
    switch (this) {
      case 'Security':
        return AnalysisType.security;
      case 'All':
        return AnalysisType.all;
    }
    throw Exception('$this is not known in enum AnalysisType');
  }
}

/// Contains information about the error that caused a finding to fail to be
/// retrieved.
class BatchGetFindingsError {
  /// A code associated with the type of error.
  final ErrorCode errorCode;

  /// The finding ID of the finding that was not fetched.
  final String findingId;

  /// Describes the error.
  final String message;

  /// The name of the scan that generated the finding.
  final String scanName;

  BatchGetFindingsError({
    required this.errorCode,
    required this.findingId,
    required this.message,
    required this.scanName,
  });

  factory BatchGetFindingsError.fromJson(Map<String, dynamic> json) {
    return BatchGetFindingsError(
      errorCode: (json['errorCode'] as String).toErrorCode(),
      findingId: json['findingId'] as String,
      message: json['message'] as String,
      scanName: json['scanName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final findingId = this.findingId;
    final message = this.message;
    final scanName = this.scanName;
    return {
      'errorCode': errorCode.toValue(),
      'findingId': findingId,
      'message': message,
      'scanName': scanName,
    };
  }
}

class BatchGetFindingsResponse {
  /// A list of errors for individual findings which were not fetched. Each
  /// BatchGetFindingsError contains the <code>scanName</code>,
  /// <code>findingId</code>, <code>errorCode</code> and error
  /// <code>message</code>.
  final List<BatchGetFindingsError> failedFindings;

  /// A list of all findings which were successfully fetched.
  final List<Finding> findings;

  BatchGetFindingsResponse({
    required this.failedFindings,
    required this.findings,
  });

  factory BatchGetFindingsResponse.fromJson(Map<String, dynamic> json) {
    return BatchGetFindingsResponse(
      failedFindings: (json['failedFindings'] as List)
          .whereNotNull()
          .map((e) => BatchGetFindingsError.fromJson(e as Map<String, dynamic>))
          .toList(),
      findings: (json['findings'] as List)
          .whereNotNull()
          .map((e) => Finding.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failedFindings = this.failedFindings;
    final findings = this.findings;
    return {
      'failedFindings': failedFindings,
      'findings': findings,
    };
  }
}

/// Information about a finding category with open findings.
class CategoryWithFindingNum {
  /// The name of the finding category. A finding category is determined by the
  /// detector that detected the finding.
  final String? categoryName;

  /// The number of open findings in the category.
  final int? findingNumber;

  CategoryWithFindingNum({
    this.categoryName,
    this.findingNumber,
  });

  factory CategoryWithFindingNum.fromJson(Map<String, dynamic> json) {
    return CategoryWithFindingNum(
      categoryName: json['categoryName'] as String?,
      findingNumber: json['findingNumber'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final categoryName = this.categoryName;
    final findingNumber = this.findingNumber;
    return {
      if (categoryName != null) 'categoryName': categoryName,
      if (findingNumber != null) 'findingNumber': findingNumber,
    };
  }
}

/// The line of code where a finding was detected.
class CodeLine {
  /// The code that contains a vulnerability.
  final String? content;

  /// The code line number.
  final int? number;

  CodeLine({
    this.content,
    this.number,
  });

  factory CodeLine.fromJson(Map<String, dynamic> json) {
    return CodeLine(
      content: json['content'] as String?,
      number: json['number'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final content = this.content;
    final number = this.number;
    return {
      if (content != null) 'content': content,
      if (number != null) 'number': number,
    };
  }
}

class CreateScanResponse {
  /// The identifier for the resource object that contains resources that were
  /// scanned.
  final ResourceId resourceId;

  /// UUID that identifies the individual scan run.
  final String runId;

  /// The name of the scan.
  final String scanName;

  /// The current state of the scan. Returns either <code>InProgress</code>,
  /// <code>Successful</code>, or <code>Failed</code>.
  final ScanState scanState;

  /// The ARN for the scan name.
  final String? scanNameArn;

  CreateScanResponse({
    required this.resourceId,
    required this.runId,
    required this.scanName,
    required this.scanState,
    this.scanNameArn,
  });

  factory CreateScanResponse.fromJson(Map<String, dynamic> json) {
    return CreateScanResponse(
      resourceId:
          ResourceId.fromJson(json['resourceId'] as Map<String, dynamic>),
      runId: json['runId'] as String,
      scanName: json['scanName'] as String,
      scanState: (json['scanState'] as String).toScanState(),
      scanNameArn: json['scanNameArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceId = this.resourceId;
    final runId = this.runId;
    final scanName = this.scanName;
    final scanState = this.scanState;
    final scanNameArn = this.scanNameArn;
    return {
      'resourceId': resourceId,
      'runId': runId,
      'scanName': scanName,
      'scanState': scanState.toValue(),
      if (scanNameArn != null) 'scanNameArn': scanNameArn,
    };
  }
}

class CreateUploadUrlResponse {
  /// The identifier for the uploaded code resource. Pass this to
  /// <code>CreateScan</code> to use the uploaded resources.
  final String codeArtifactId;

  /// A set of key-value pairs that contain the required headers when uploading
  /// your resource.
  final Map<String, String> requestHeaders;

  /// A pre-signed S3 URL. You can upload the code file you want to scan with the
  /// required <code>requestHeaders</code> using any HTTP client.
  final String s3Url;

  CreateUploadUrlResponse({
    required this.codeArtifactId,
    required this.requestHeaders,
    required this.s3Url,
  });

  factory CreateUploadUrlResponse.fromJson(Map<String, dynamic> json) {
    return CreateUploadUrlResponse(
      codeArtifactId: json['codeArtifactId'] as String,
      requestHeaders: (json['requestHeaders'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(k, e as String)),
      s3Url: json['s3Url'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final codeArtifactId = this.codeArtifactId;
    final requestHeaders = this.requestHeaders;
    final s3Url = this.s3Url;
    return {
      'codeArtifactId': codeArtifactId,
      'requestHeaders': requestHeaders,
      's3Url': s3Url,
    };
  }
}

/// Information about the encryption configuration for an account. Required to
/// call <code>UpdateAccountConfiguration</code>.
class EncryptionConfig {
  /// The KMS key ARN that is used for encryption. If an AWS-managed key is used
  /// for encryption, returns empty.
  final String? kmsKeyArn;

  EncryptionConfig({
    this.kmsKeyArn,
  });

  factory EncryptionConfig.fromJson(Map<String, dynamic> json) {
    return EncryptionConfig(
      kmsKeyArn: json['kmsKeyArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final kmsKeyArn = this.kmsKeyArn;
    return {
      if (kmsKeyArn != null) 'kmsKeyArn': kmsKeyArn,
    };
  }
}

enum ErrorCode {
  duplicateIdentifier,
  itemDoesNotExist,
  internalError,
  invalidFindingId,
  invalidScanName,
}

extension ErrorCodeValueExtension on ErrorCode {
  String toValue() {
    switch (this) {
      case ErrorCode.duplicateIdentifier:
        return 'DUPLICATE_IDENTIFIER';
      case ErrorCode.itemDoesNotExist:
        return 'ITEM_DOES_NOT_EXIST';
      case ErrorCode.internalError:
        return 'INTERNAL_ERROR';
      case ErrorCode.invalidFindingId:
        return 'INVALID_FINDING_ID';
      case ErrorCode.invalidScanName:
        return 'INVALID_SCAN_NAME';
    }
  }
}

extension ErrorCodeFromString on String {
  ErrorCode toErrorCode() {
    switch (this) {
      case 'DUPLICATE_IDENTIFIER':
        return ErrorCode.duplicateIdentifier;
      case 'ITEM_DOES_NOT_EXIST':
        return ErrorCode.itemDoesNotExist;
      case 'INTERNAL_ERROR':
        return ErrorCode.internalError;
      case 'INVALID_FINDING_ID':
        return ErrorCode.invalidFindingId;
      case 'INVALID_SCAN_NAME':
        return ErrorCode.invalidScanName;
    }
    throw Exception('$this is not known in enum ErrorCode');
  }
}

/// Information about the location of security vulnerabilities that Amazon
/// CodeGuru Security detected in your code.
class FilePath {
  /// A list of <code>CodeLine</code> objects that describe where the security
  /// vulnerability appears in your code.
  final List<CodeLine>? codeSnippet;

  /// The last line number of the code snippet where the security vulnerability
  /// appears in your code.
  final int? endLine;

  /// The name of the file.
  final String? name;

  /// The path to the resource with the security vulnerability.
  final String? path;

  /// The first line number of the code snippet where the security vulnerability
  /// appears in your code.
  final int? startLine;

  FilePath({
    this.codeSnippet,
    this.endLine,
    this.name,
    this.path,
    this.startLine,
  });

  factory FilePath.fromJson(Map<String, dynamic> json) {
    return FilePath(
      codeSnippet: (json['codeSnippet'] as List?)
          ?.whereNotNull()
          .map((e) => CodeLine.fromJson(e as Map<String, dynamic>))
          .toList(),
      endLine: json['endLine'] as int?,
      name: json['name'] as String?,
      path: json['path'] as String?,
      startLine: json['startLine'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final codeSnippet = this.codeSnippet;
    final endLine = this.endLine;
    final name = this.name;
    final path = this.path;
    final startLine = this.startLine;
    return {
      if (codeSnippet != null) 'codeSnippet': codeSnippet,
      if (endLine != null) 'endLine': endLine,
      if (name != null) 'name': name,
      if (path != null) 'path': path,
      if (startLine != null) 'startLine': startLine,
    };
  }
}

/// Information about a finding that was detected in your code.
class Finding {
  /// The time when the finding was created.
  final DateTime? createdAt;

  /// A description of the finding.
  final String? description;

  /// The identifier for the detector that detected the finding in your code. A
  /// detector is a defined rule based on industry standards and AWS best
  /// practices.
  final String? detectorId;

  /// The name of the detector that identified the security vulnerability in your
  /// code.
  final String? detectorName;

  /// One or more tags or categorizations that are associated with a detector.
  /// These tags are defined by type, programming language, or other
  /// classification such as maintainability or consistency.
  final List<String>? detectorTags;

  /// The identifier for the component that generated a finding such as
  /// AmazonCodeGuruSecurity.
  final String? generatorId;

  /// The identifier for a finding.
  final String? id;

  /// An object that contains the details about how to remediate a finding.
  final Remediation? remediation;

  /// The resource where Amazon CodeGuru Security detected a finding.
  final Resource? resource;

  /// The identifier for the rule that generated the finding.
  final String? ruleId;

  /// The severity of the finding. Severity can be critical, high, medium, low, or
  /// informational. For information on severity levels, see <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/security-ug/findings-overview.html#severity-distribution">Finding
  /// severity</a> in the <i>Amazon CodeGuru Security User Guide</i>.
  final Severity? severity;

  /// The status of the finding. A finding status can be open or closed.
  final Status? status;

  /// The title of the finding.
  final String? title;

  /// The type of finding.
  final String? type;

  /// The time when the finding was last updated. Findings are updated when you
  /// remediate them or when the finding code location changes.
  final DateTime? updatedAt;

  /// An object that describes the detected security vulnerability.
  final Vulnerability? vulnerability;

  Finding({
    this.createdAt,
    this.description,
    this.detectorId,
    this.detectorName,
    this.detectorTags,
    this.generatorId,
    this.id,
    this.remediation,
    this.resource,
    this.ruleId,
    this.severity,
    this.status,
    this.title,
    this.type,
    this.updatedAt,
    this.vulnerability,
  });

  factory Finding.fromJson(Map<String, dynamic> json) {
    return Finding(
      createdAt: timeStampFromJson(json['createdAt']),
      description: json['description'] as String?,
      detectorId: json['detectorId'] as String?,
      detectorName: json['detectorName'] as String?,
      detectorTags: (json['detectorTags'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      generatorId: json['generatorId'] as String?,
      id: json['id'] as String?,
      remediation: json['remediation'] != null
          ? Remediation.fromJson(json['remediation'] as Map<String, dynamic>)
          : null,
      resource: json['resource'] != null
          ? Resource.fromJson(json['resource'] as Map<String, dynamic>)
          : null,
      ruleId: json['ruleId'] as String?,
      severity: (json['severity'] as String?)?.toSeverity(),
      status: (json['status'] as String?)?.toStatus(),
      title: json['title'] as String?,
      type: json['type'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
      vulnerability: json['vulnerability'] != null
          ? Vulnerability.fromJson(
              json['vulnerability'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final description = this.description;
    final detectorId = this.detectorId;
    final detectorName = this.detectorName;
    final detectorTags = this.detectorTags;
    final generatorId = this.generatorId;
    final id = this.id;
    final remediation = this.remediation;
    final resource = this.resource;
    final ruleId = this.ruleId;
    final severity = this.severity;
    final status = this.status;
    final title = this.title;
    final type = this.type;
    final updatedAt = this.updatedAt;
    final vulnerability = this.vulnerability;
    return {
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (description != null) 'description': description,
      if (detectorId != null) 'detectorId': detectorId,
      if (detectorName != null) 'detectorName': detectorName,
      if (detectorTags != null) 'detectorTags': detectorTags,
      if (generatorId != null) 'generatorId': generatorId,
      if (id != null) 'id': id,
      if (remediation != null) 'remediation': remediation,
      if (resource != null) 'resource': resource,
      if (ruleId != null) 'ruleId': ruleId,
      if (severity != null) 'severity': severity.toValue(),
      if (status != null) 'status': status.toValue(),
      if (title != null) 'title': title,
      if (type != null) 'type': type,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
      if (vulnerability != null) 'vulnerability': vulnerability,
    };
  }
}

/// An object that contains information about a finding and the scan that
/// generated it.
class FindingIdentifier {
  /// The identifier for a finding.
  final String findingId;

  /// The name of the scan that generated the finding.
  final String scanName;

  FindingIdentifier({
    required this.findingId,
    required this.scanName,
  });

  Map<String, dynamic> toJson() {
    final findingId = this.findingId;
    final scanName = this.scanName;
    return {
      'findingId': findingId,
      'scanName': scanName,
    };
  }
}

/// A numeric value corresponding to the severity of a finding, such as the
/// number of open findings or the average time it takes to close findings of a
/// given severity.
class FindingMetricsValuePerSeverity {
  /// A numeric value corresponding to a critical finding.
  final double? critical;

  /// A numeric value corresponding to a high severity finding.
  final double? high;

  /// A numeric value corresponding to an informational finding.
  final double? info;

  /// A numeric value corresponding to a low severity finding.
  final double? low;

  /// A numeric value corresponding to a medium severity finding.
  final double? medium;

  FindingMetricsValuePerSeverity({
    this.critical,
    this.high,
    this.info,
    this.low,
    this.medium,
  });

  factory FindingMetricsValuePerSeverity.fromJson(Map<String, dynamic> json) {
    return FindingMetricsValuePerSeverity(
      critical: json['critical'] as double?,
      high: json['high'] as double?,
      info: json['info'] as double?,
      low: json['low'] as double?,
      medium: json['medium'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final critical = this.critical;
    final high = this.high;
    final info = this.info;
    final low = this.low;
    final medium = this.medium;
    return {
      if (critical != null) 'critical': critical,
      if (high != null) 'high': high,
      if (info != null) 'info': info,
      if (low != null) 'low': low,
      if (medium != null) 'medium': medium,
    };
  }
}

class GetAccountConfigurationResponse {
  /// An <code>EncryptionConfig</code> object that contains the KMS key ARN that
  /// is used for encryption. By default, CodeGuru Security uses an AWS-managed
  /// key for encryption. To specify your own key, call
  /// <code>UpdateAccountConfiguration</code>. If you do not specify a
  /// customer-managed key, returns empty.
  final EncryptionConfig encryptionConfig;

  GetAccountConfigurationResponse({
    required this.encryptionConfig,
  });

  factory GetAccountConfigurationResponse.fromJson(Map<String, dynamic> json) {
    return GetAccountConfigurationResponse(
      encryptionConfig: EncryptionConfig.fromJson(
          json['encryptionConfig'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final encryptionConfig = this.encryptionConfig;
    return {
      'encryptionConfig': encryptionConfig,
    };
  }
}

class GetFindingsResponse {
  /// A list of findings generated by the specified scan.
  final List<Finding>? findings;

  /// A pagination token. You can use this in future calls to
  /// <code>GetFindings</code> to continue listing results after the current page.
  final String? nextToken;

  GetFindingsResponse({
    this.findings,
    this.nextToken,
  });

  factory GetFindingsResponse.fromJson(Map<String, dynamic> json) {
    return GetFindingsResponse(
      findings: (json['findings'] as List?)
          ?.whereNotNull()
          .map((e) => Finding.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final findings = this.findings;
    final nextToken = this.nextToken;
    return {
      if (findings != null) 'findings': findings,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class GetMetricsSummaryResponse {
  /// The summary metrics from the specified date.
  final MetricsSummary? metricsSummary;

  GetMetricsSummaryResponse({
    this.metricsSummary,
  });

  factory GetMetricsSummaryResponse.fromJson(Map<String, dynamic> json) {
    return GetMetricsSummaryResponse(
      metricsSummary: json['metricsSummary'] != null
          ? MetricsSummary.fromJson(
              json['metricsSummary'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final metricsSummary = this.metricsSummary;
    return {
      if (metricsSummary != null) 'metricsSummary': metricsSummary,
    };
  }
}

class GetScanResponse {
  /// The type of analysis CodeGuru Security performed in the scan, either
  /// <code>Security</code> or <code>All</code>. The <code>Security</code> type
  /// only generates findings related to security. The <code>All</code> type
  /// generates both security findings and quality findings.
  final AnalysisType analysisType;

  /// The time the scan was created.
  final DateTime createdAt;

  /// UUID that identifies the individual scan run.
  final String runId;

  /// The name of the scan.
  final String scanName;

  /// The current state of the scan. Returns either <code>InProgress</code>,
  /// <code>Successful</code>, or <code>Failed</code>.
  final ScanState scanState;

  /// Details about the error that causes a scan to fail to be retrieved.
  final String? errorMessage;

  /// The number of times a scan has been re-run on a revised resource.
  final int? numberOfRevisions;

  /// The ARN for the scan name.
  final String? scanNameArn;

  /// The time when the scan was last updated. Only available for
  /// <code>STANDARD</code> scan types.
  final DateTime? updatedAt;

  GetScanResponse({
    required this.analysisType,
    required this.createdAt,
    required this.runId,
    required this.scanName,
    required this.scanState,
    this.errorMessage,
    this.numberOfRevisions,
    this.scanNameArn,
    this.updatedAt,
  });

  factory GetScanResponse.fromJson(Map<String, dynamic> json) {
    return GetScanResponse(
      analysisType: (json['analysisType'] as String).toAnalysisType(),
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      runId: json['runId'] as String,
      scanName: json['scanName'] as String,
      scanState: (json['scanState'] as String).toScanState(),
      errorMessage: json['errorMessage'] as String?,
      numberOfRevisions: json['numberOfRevisions'] as int?,
      scanNameArn: json['scanNameArn'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final analysisType = this.analysisType;
    final createdAt = this.createdAt;
    final runId = this.runId;
    final scanName = this.scanName;
    final scanState = this.scanState;
    final errorMessage = this.errorMessage;
    final numberOfRevisions = this.numberOfRevisions;
    final scanNameArn = this.scanNameArn;
    final updatedAt = this.updatedAt;
    return {
      'analysisType': analysisType.toValue(),
      'createdAt': unixTimestampToJson(createdAt),
      'runId': runId,
      'scanName': scanName,
      'scanState': scanState.toValue(),
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (numberOfRevisions != null) 'numberOfRevisions': numberOfRevisions,
      if (scanNameArn != null) 'scanNameArn': scanNameArn,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

class ListFindingsMetricsResponse {
  /// A list of <code>AccountFindingsMetric</code> objects retrieved from the
  /// specified time interval.
  final List<AccountFindingsMetric>? findingsMetrics;

  /// A pagination token. You can use this in future calls to
  /// <code>ListFindingMetrics</code> to continue listing results after the
  /// current page.
  final String? nextToken;

  ListFindingsMetricsResponse({
    this.findingsMetrics,
    this.nextToken,
  });

  factory ListFindingsMetricsResponse.fromJson(Map<String, dynamic> json) {
    return ListFindingsMetricsResponse(
      findingsMetrics: (json['findingsMetrics'] as List?)
          ?.whereNotNull()
          .map((e) => AccountFindingsMetric.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final findingsMetrics = this.findingsMetrics;
    final nextToken = this.nextToken;
    return {
      if (findingsMetrics != null) 'findingsMetrics': findingsMetrics,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListScansResponse {
  /// A pagination token. You can use this in future calls to
  /// <code>ListScans</code> to continue listing results after the current page.
  final String? nextToken;

  /// A list of <code>ScanSummary</code> objects with information about all scans
  /// in an account.
  final List<ScanSummary>? summaries;

  ListScansResponse({
    this.nextToken,
    this.summaries,
  });

  factory ListScansResponse.fromJson(Map<String, dynamic> json) {
    return ListScansResponse(
      nextToken: json['nextToken'] as String?,
      summaries: (json['summaries'] as List?)
          ?.whereNotNull()
          .map((e) => ScanSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final summaries = this.summaries;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (summaries != null) 'summaries': summaries,
    };
  }
}

class ListTagsForResourceResponse {
  /// An array of key-value pairs used to tag an existing scan. A tag is a custom
  /// attribute label with two parts:
  ///
  /// <ul>
  /// <li>
  /// A tag key. For example, <code>CostCenter</code>, <code>Environment</code>,
  /// or <code>Secret</code>. Tag keys are case sensitive.
  /// </li>
  /// <li>
  /// An optional tag value field. For example, <code>111122223333</code>,
  /// <code>Production</code>, or a team name. Omitting the tag value is the same
  /// as using an empty string. Tag values are case sensitive.
  /// </li>
  /// </ul>
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

/// A summary of metrics for an account as of a specified date.
class MetricsSummary {
  /// A list of <code>CategoryWithFindingNum</code> objects for the top 5 finding
  /// categories with the most findings.
  final List<CategoryWithFindingNum>? categoriesWithMostFindings;

  /// The date from which the metrics summary information was retrieved.
  final DateTime? date;

  /// The number of open findings of each severity.
  final FindingMetricsValuePerSeverity? openFindings;

  /// A list of <code>ScanNameWithFindingNum</code> objects for the top 3 scans
  /// with the most number of open critical findings.
  final List<ScanNameWithFindingNum>? scansWithMostOpenCriticalFindings;

  /// A list of <code>ScanNameWithFindingNum</code> objects for the top 3 scans
  /// with the most number of open findings.
  final List<ScanNameWithFindingNum>? scansWithMostOpenFindings;

  MetricsSummary({
    this.categoriesWithMostFindings,
    this.date,
    this.openFindings,
    this.scansWithMostOpenCriticalFindings,
    this.scansWithMostOpenFindings,
  });

  factory MetricsSummary.fromJson(Map<String, dynamic> json) {
    return MetricsSummary(
      categoriesWithMostFindings: (json['categoriesWithMostFindings'] as List?)
          ?.whereNotNull()
          .map(
              (e) => CategoryWithFindingNum.fromJson(e as Map<String, dynamic>))
          .toList(),
      date: timeStampFromJson(json['date']),
      openFindings: json['openFindings'] != null
          ? FindingMetricsValuePerSeverity.fromJson(
              json['openFindings'] as Map<String, dynamic>)
          : null,
      scansWithMostOpenCriticalFindings:
          (json['scansWithMostOpenCriticalFindings'] as List?)
              ?.whereNotNull()
              .map((e) =>
                  ScanNameWithFindingNum.fromJson(e as Map<String, dynamic>))
              .toList(),
      scansWithMostOpenFindings: (json['scansWithMostOpenFindings'] as List?)
          ?.whereNotNull()
          .map(
              (e) => ScanNameWithFindingNum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final categoriesWithMostFindings = this.categoriesWithMostFindings;
    final date = this.date;
    final openFindings = this.openFindings;
    final scansWithMostOpenCriticalFindings =
        this.scansWithMostOpenCriticalFindings;
    final scansWithMostOpenFindings = this.scansWithMostOpenFindings;
    return {
      if (categoriesWithMostFindings != null)
        'categoriesWithMostFindings': categoriesWithMostFindings,
      if (date != null) 'date': unixTimestampToJson(date),
      if (openFindings != null) 'openFindings': openFindings,
      if (scansWithMostOpenCriticalFindings != null)
        'scansWithMostOpenCriticalFindings': scansWithMostOpenCriticalFindings,
      if (scansWithMostOpenFindings != null)
        'scansWithMostOpenFindings': scansWithMostOpenFindings,
    };
  }
}

/// Information about the recommended course of action to remediate a finding.
class Recommendation {
  /// The recommended course of action to remediate the finding.
  final String? text;

  /// The URL address to the recommendation for remediating the finding.
  final String? url;

  Recommendation({
    this.text,
    this.url,
  });

  factory Recommendation.fromJson(Map<String, dynamic> json) {
    return Recommendation(
      text: json['text'] as String?,
      url: json['url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final text = this.text;
    final url = this.url;
    return {
      if (text != null) 'text': text,
      if (url != null) 'url': url,
    };
  }
}

/// Information about how to remediate a finding.
class Remediation {
  /// An object that contains information about the recommended course of action
  /// to remediate a finding.
  final Recommendation? recommendation;

  /// A list of <code>SuggestedFix</code> objects. Each object contains
  /// information about a suggested code fix to remediate the finding.
  final List<SuggestedFix>? suggestedFixes;

  Remediation({
    this.recommendation,
    this.suggestedFixes,
  });

  factory Remediation.fromJson(Map<String, dynamic> json) {
    return Remediation(
      recommendation: json['recommendation'] != null
          ? Recommendation.fromJson(
              json['recommendation'] as Map<String, dynamic>)
          : null,
      suggestedFixes: (json['suggestedFixes'] as List?)
          ?.whereNotNull()
          .map((e) => SuggestedFix.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final recommendation = this.recommendation;
    final suggestedFixes = this.suggestedFixes;
    return {
      if (recommendation != null) 'recommendation': recommendation,
      if (suggestedFixes != null) 'suggestedFixes': suggestedFixes,
    };
  }
}

/// Information about a resource that contains a finding.
class Resource {
  /// The <code>scanName</code> of the scan that was run on the resource.
  final String? id;

  /// The identifier for a section of the resource.
  final String? subResourceId;

  Resource({
    this.id,
    this.subResourceId,
  });

  factory Resource.fromJson(Map<String, dynamic> json) {
    return Resource(
      id: json['id'] as String?,
      subResourceId: json['subResourceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final subResourceId = this.subResourceId;
    return {
      if (id != null) 'id': id,
      if (subResourceId != null) 'subResourceId': subResourceId,
    };
  }
}

/// The identifier for a resource object that contains resources to scan.
/// Specifying a codeArtifactId is required to create a scan.
class ResourceId {
  /// The identifier for the code file uploaded to the resource object. Returned
  /// by <code>CreateUploadUrl</code> when you upload resources to be scanned.
  final String? codeArtifactId;

  ResourceId({
    this.codeArtifactId,
  });

  factory ResourceId.fromJson(Map<String, dynamic> json) {
    return ResourceId(
      codeArtifactId: json['codeArtifactId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final codeArtifactId = this.codeArtifactId;
    return {
      if (codeArtifactId != null) 'codeArtifactId': codeArtifactId,
    };
  }
}

/// Information about the number of findings generated by a scan.
class ScanNameWithFindingNum {
  /// The number of findings generated by a scan.
  final int? findingNumber;

  /// The name of the scan.
  final String? scanName;

  ScanNameWithFindingNum({
    this.findingNumber,
    this.scanName,
  });

  factory ScanNameWithFindingNum.fromJson(Map<String, dynamic> json) {
    return ScanNameWithFindingNum(
      findingNumber: json['findingNumber'] as int?,
      scanName: json['scanName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final findingNumber = this.findingNumber;
    final scanName = this.scanName;
    return {
      if (findingNumber != null) 'findingNumber': findingNumber,
      if (scanName != null) 'scanName': scanName,
    };
  }
}

enum ScanState {
  inProgress,
  successful,
  failed,
}

extension ScanStateValueExtension on ScanState {
  String toValue() {
    switch (this) {
      case ScanState.inProgress:
        return 'InProgress';
      case ScanState.successful:
        return 'Successful';
      case ScanState.failed:
        return 'Failed';
    }
  }
}

extension ScanStateFromString on String {
  ScanState toScanState() {
    switch (this) {
      case 'InProgress':
        return ScanState.inProgress;
      case 'Successful':
        return ScanState.successful;
      case 'Failed':
        return ScanState.failed;
    }
    throw Exception('$this is not known in enum ScanState');
  }
}

/// Information about a scan.
class ScanSummary {
  /// The time when the scan was created.
  final DateTime createdAt;

  /// The identifier for the scan run.
  final String runId;

  /// The name of the scan.
  final String scanName;

  /// The state of the scan. A scan can be <code>In Progress</code>,
  /// <code>Complete</code>, or <code>Failed</code>.
  final ScanState scanState;

  /// The ARN for the scan name.
  final String? scanNameArn;

  /// The time the scan was last updated. A scan is updated when it is re-run.
  final DateTime? updatedAt;

  ScanSummary({
    required this.createdAt,
    required this.runId,
    required this.scanName,
    required this.scanState,
    this.scanNameArn,
    this.updatedAt,
  });

  factory ScanSummary.fromJson(Map<String, dynamic> json) {
    return ScanSummary(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      runId: json['runId'] as String,
      scanName: json['scanName'] as String,
      scanState: (json['scanState'] as String).toScanState(),
      scanNameArn: json['scanNameArn'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final runId = this.runId;
    final scanName = this.scanName;
    final scanState = this.scanState;
    final scanNameArn = this.scanNameArn;
    final updatedAt = this.updatedAt;
    return {
      'createdAt': unixTimestampToJson(createdAt),
      'runId': runId,
      'scanName': scanName,
      'scanState': scanState.toValue(),
      if (scanNameArn != null) 'scanNameArn': scanNameArn,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

enum ScanType {
  standard,
  express,
}

extension ScanTypeValueExtension on ScanType {
  String toValue() {
    switch (this) {
      case ScanType.standard:
        return 'Standard';
      case ScanType.express:
        return 'Express';
    }
  }
}

extension ScanTypeFromString on String {
  ScanType toScanType() {
    switch (this) {
      case 'Standard':
        return ScanType.standard;
      case 'Express':
        return ScanType.express;
    }
    throw Exception('$this is not known in enum ScanType');
  }
}

enum Severity {
  critical,
  high,
  medium,
  low,
  info,
}

extension SeverityValueExtension on Severity {
  String toValue() {
    switch (this) {
      case Severity.critical:
        return 'Critical';
      case Severity.high:
        return 'High';
      case Severity.medium:
        return 'Medium';
      case Severity.low:
        return 'Low';
      case Severity.info:
        return 'Info';
    }
  }
}

extension SeverityFromString on String {
  Severity toSeverity() {
    switch (this) {
      case 'Critical':
        return Severity.critical;
      case 'High':
        return Severity.high;
      case 'Medium':
        return Severity.medium;
      case 'Low':
        return Severity.low;
      case 'Info':
        return Severity.info;
    }
    throw Exception('$this is not known in enum Severity');
  }
}

enum Status {
  closed,
  open,
  all,
}

extension StatusValueExtension on Status {
  String toValue() {
    switch (this) {
      case Status.closed:
        return 'Closed';
      case Status.open:
        return 'Open';
      case Status.all:
        return 'All';
    }
  }
}

extension StatusFromString on String {
  Status toStatus() {
    switch (this) {
      case 'Closed':
        return Status.closed;
      case 'Open':
        return Status.open;
      case 'All':
        return Status.all;
    }
    throw Exception('$this is not known in enum Status');
  }
}

/// Information about the suggested code fix to remediate a finding.
class SuggestedFix {
  /// The suggested code fix. If applicable, includes code patch to replace your
  /// source code.
  final String? code;

  /// A description of the suggested code fix and why it is being suggested.
  final String? description;

  SuggestedFix({
    this.code,
    this.description,
  });

  factory SuggestedFix.fromJson(Map<String, dynamic> json) {
    return SuggestedFix(
      code: json['code'] as String?,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final description = this.description;
    return {
      if (code != null) 'code': code,
      if (description != null) 'description': description,
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

class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateAccountConfigurationResponse {
  /// An <code>EncryptionConfig</code> object that contains the KMS key ARN that
  /// is used for encryption. If you did not specify a customer-managed KMS key in
  /// the request, returns empty.
  final EncryptionConfig encryptionConfig;

  UpdateAccountConfigurationResponse({
    required this.encryptionConfig,
  });

  factory UpdateAccountConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateAccountConfigurationResponse(
      encryptionConfig: EncryptionConfig.fromJson(
          json['encryptionConfig'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final encryptionConfig = this.encryptionConfig;
    return {
      'encryptionConfig': encryptionConfig,
    };
  }
}

/// Information about a security vulnerability that Amazon CodeGuru Security
/// detected.
class Vulnerability {
  /// An object that describes the location of the detected security vulnerability
  /// in your code.
  final FilePath? filePath;

  /// The identifier for the vulnerability.
  final String? id;

  /// The number of times the vulnerability appears in your code.
  final int? itemCount;

  /// One or more URL addresses that contain details about a vulnerability.
  final List<String>? referenceUrls;

  /// One or more vulnerabilities that are related to the vulnerability being
  /// described.
  final List<String>? relatedVulnerabilities;

  Vulnerability({
    this.filePath,
    this.id,
    this.itemCount,
    this.referenceUrls,
    this.relatedVulnerabilities,
  });

  factory Vulnerability.fromJson(Map<String, dynamic> json) {
    return Vulnerability(
      filePath: json['filePath'] != null
          ? FilePath.fromJson(json['filePath'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
      itemCount: json['itemCount'] as int?,
      referenceUrls: (json['referenceUrls'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      relatedVulnerabilities: (json['relatedVulnerabilities'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final filePath = this.filePath;
    final id = this.id;
    final itemCount = this.itemCount;
    final referenceUrls = this.referenceUrls;
    final relatedVulnerabilities = this.relatedVulnerabilities;
    return {
      if (filePath != null) 'filePath': filePath,
      if (id != null) 'id': id,
      if (itemCount != null) 'itemCount': itemCount,
      if (referenceUrls != null) 'referenceUrls': referenceUrls,
      if (relatedVulnerabilities != null)
        'relatedVulnerabilities': relatedVulnerabilities,
    };
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
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
