// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name
// ignore_for_file: camel_case_types

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

/// AWS IoT Core Device Advisor is a cloud-based, fully managed test capability
/// for validating IoT devices during device software development. Device
/// Advisor provides pre-built tests that you can use to validate IoT devices
/// for reliable and secure connectivity with AWS IoT Core before deploying
/// devices to production. By using Device Advisor, you can confirm that your
/// devices can connect to AWS IoT Core, follow security best practices and, if
/// applicable, receive software updates from IoT Device Management. You can
/// also download signed qualification reports to submit to the AWS Partner
/// Network to get your device qualified for the AWS Partner Device Catalog
/// without the need to send your device in and wait for it to be tested.
class IoTDeviceAdvisor {
  final _s.RestJsonProtocol _protocol;
  IoTDeviceAdvisor({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'api.iotdeviceadvisor',
            signingName: 'iotdeviceadvisor',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Creates a Device Advisor test suite.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [suiteDefinitionConfiguration] :
  /// Creates a Device Advisor test suite with suite definition configuration.
  ///
  /// Parameter [tags] :
  /// The tags to be attached to the suite definition.
  Future<CreateSuiteDefinitionResponse> createSuiteDefinition({
    SuiteDefinitionConfiguration? suiteDefinitionConfiguration,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      if (suiteDefinitionConfiguration != null)
        'suiteDefinitionConfiguration': suiteDefinitionConfiguration,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/suiteDefinitions',
      exceptionFnMap: _exceptionFns,
    );
    return CreateSuiteDefinitionResponse.fromJson(response);
  }

  /// Deletes a Device Advisor test suite.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [suiteDefinitionId] :
  /// Suite definition Id of the test suite to be deleted.
  Future<void> deleteSuiteDefinition({
    required String suiteDefinitionId,
  }) async {
    ArgumentError.checkNotNull(suiteDefinitionId, 'suiteDefinitionId');
    _s.validateStringLength(
      'suiteDefinitionId',
      suiteDefinitionId,
      12,
      36,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/suiteDefinitions/${Uri.encodeComponent(suiteDefinitionId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Gets information about a Device Advisor test suite.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [suiteDefinitionId] :
  /// Suite definition Id of the test suite to get.
  ///
  /// Parameter [suiteDefinitionVersion] :
  /// Suite definition version of the test suite to get.
  Future<GetSuiteDefinitionResponse> getSuiteDefinition({
    required String suiteDefinitionId,
    String? suiteDefinitionVersion,
  }) async {
    ArgumentError.checkNotNull(suiteDefinitionId, 'suiteDefinitionId');
    _s.validateStringLength(
      'suiteDefinitionId',
      suiteDefinitionId,
      12,
      36,
      isRequired: true,
    );
    _s.validateStringLength(
      'suiteDefinitionVersion',
      suiteDefinitionVersion,
      2,
      255,
    );
    final $query = <String, List<String>>{
      if (suiteDefinitionVersion != null)
        'suiteDefinitionVersion': [suiteDefinitionVersion],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/suiteDefinitions/${Uri.encodeComponent(suiteDefinitionId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetSuiteDefinitionResponse.fromJson(response);
  }

  /// Gets information about a Device Advisor test suite run.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [suiteDefinitionId] :
  /// Suite definition Id for the test suite run.
  ///
  /// Parameter [suiteRunId] :
  /// Suite run Id for the test suite run.
  Future<GetSuiteRunResponse> getSuiteRun({
    required String suiteDefinitionId,
    required String suiteRunId,
  }) async {
    ArgumentError.checkNotNull(suiteDefinitionId, 'suiteDefinitionId');
    _s.validateStringLength(
      'suiteDefinitionId',
      suiteDefinitionId,
      12,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(suiteRunId, 'suiteRunId');
    _s.validateStringLength(
      'suiteRunId',
      suiteRunId,
      12,
      36,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/suiteDefinitions/${Uri.encodeComponent(suiteDefinitionId)}/suiteRuns/${Uri.encodeComponent(suiteRunId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetSuiteRunResponse.fromJson(response);
  }

  /// Gets a report download link for a successful Device Advisor qualifying
  /// test suite run.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [suiteDefinitionId] :
  /// Suite definition Id of the test suite.
  ///
  /// Parameter [suiteRunId] :
  /// Suite run Id of the test suite run.
  Future<GetSuiteRunReportResponse> getSuiteRunReport({
    required String suiteDefinitionId,
    required String suiteRunId,
  }) async {
    ArgumentError.checkNotNull(suiteDefinitionId, 'suiteDefinitionId');
    _s.validateStringLength(
      'suiteDefinitionId',
      suiteDefinitionId,
      12,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(suiteRunId, 'suiteRunId');
    _s.validateStringLength(
      'suiteRunId',
      suiteRunId,
      12,
      36,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/suiteDefinitions/${Uri.encodeComponent(suiteDefinitionId)}/suiteRuns/${Uri.encodeComponent(suiteRunId)}/report',
      exceptionFnMap: _exceptionFns,
    );
    return GetSuiteRunReportResponse.fromJson(response);
  }

  /// Lists the Device Advisor test suites you have created.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at once.
  ///
  /// Parameter [nextToken] :
  /// A token used to get the next set of results.
  Future<ListSuiteDefinitionsResponse> listSuiteDefinitions({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      2000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/suiteDefinitions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSuiteDefinitionsResponse.fromJson(response);
  }

  /// Lists the runs of the specified Device Advisor test suite. You can list
  /// all runs of the test suite, or the runs of a specific version of the test
  /// suite.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at once.
  ///
  /// Parameter [nextToken] :
  /// A token to retrieve the next set of results.
  ///
  /// Parameter [suiteDefinitionId] :
  /// Lists the test suite runs of the specified test suite based on suite
  /// definition Id.
  ///
  /// Parameter [suiteDefinitionVersion] :
  /// Must be passed along with suiteDefinitionId. Lists the test suite runs of
  /// the specified test suite based on suite definition version.
  Future<ListSuiteRunsResponse> listSuiteRuns({
    int? maxResults,
    String? nextToken,
    String? suiteDefinitionId,
    String? suiteDefinitionVersion,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      2000,
    );
    _s.validateStringLength(
      'suiteDefinitionId',
      suiteDefinitionId,
      12,
      36,
    );
    _s.validateStringLength(
      'suiteDefinitionVersion',
      suiteDefinitionVersion,
      2,
      255,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (suiteDefinitionId != null) 'suiteDefinitionId': [suiteDefinitionId],
      if (suiteDefinitionVersion != null)
        'suiteDefinitionVersion': [suiteDefinitionVersion],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/suiteRuns',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSuiteRunsResponse.fromJson(response);
  }

  /// Lists the tags attached to an IoT Device Advisor resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the IoT Device Advisor resource.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      20,
      2048,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Starts a Device Advisor test suite run.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  ///
  /// Parameter [suiteDefinitionId] :
  /// Suite definition Id of the test suite.
  ///
  /// Parameter [suiteDefinitionVersion] :
  /// Suite definition version of the test suite.
  ///
  /// Parameter [suiteRunConfiguration] :
  /// Suite run configuration.
  ///
  /// Parameter [tags] :
  /// The tags to be attached to the suite run.
  Future<StartSuiteRunResponse> startSuiteRun({
    required String suiteDefinitionId,
    String? suiteDefinitionVersion,
    SuiteRunConfiguration? suiteRunConfiguration,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(suiteDefinitionId, 'suiteDefinitionId');
    _s.validateStringLength(
      'suiteDefinitionId',
      suiteDefinitionId,
      12,
      36,
      isRequired: true,
    );
    _s.validateStringLength(
      'suiteDefinitionVersion',
      suiteDefinitionVersion,
      2,
      255,
    );
    final $payload = <String, dynamic>{
      if (suiteDefinitionVersion != null)
        'suiteDefinitionVersion': suiteDefinitionVersion,
      if (suiteRunConfiguration != null)
        'suiteRunConfiguration': suiteRunConfiguration,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/suiteDefinitions/${Uri.encodeComponent(suiteDefinitionId)}/suiteRuns',
      exceptionFnMap: _exceptionFns,
    );
    return StartSuiteRunResponse.fromJson(response);
  }

  /// Stops a Device Advisor test suite run that is currently running.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [suiteDefinitionId] :
  /// Suite definition Id of the test suite run to be stopped.
  ///
  /// Parameter [suiteRunId] :
  /// Suite run Id of the test suite run to be stopped.
  Future<void> stopSuiteRun({
    required String suiteDefinitionId,
    required String suiteRunId,
  }) async {
    ArgumentError.checkNotNull(suiteDefinitionId, 'suiteDefinitionId');
    _s.validateStringLength(
      'suiteDefinitionId',
      suiteDefinitionId,
      12,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(suiteRunId, 'suiteRunId');
    _s.validateStringLength(
      'suiteRunId',
      suiteRunId,
      12,
      36,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/suiteDefinitions/${Uri.encodeComponent(suiteDefinitionId)}/suiteRuns/${Uri.encodeComponent(suiteRunId)}/stop',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Adds to and modifies existing tags of an IoT Device Advisor resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The resource ARN of an IoT Device Advisor resource.
  ///
  /// Parameter [tags] :
  /// The tags to be attached to the IoT Device Advisor resource.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      20,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
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

  /// Removes tags from an IoT Device Advisor resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The resource ARN of an IoT Device Advisor resource.
  ///
  /// Parameter [tagKeys] :
  /// List of tag keys to remove from the IoT Device Advisor resource.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      20,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
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

  /// Updates a Device Advisor test suite.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [suiteDefinitionId] :
  /// Suite definition Id of the test suite to be updated.
  ///
  /// Parameter [suiteDefinitionConfiguration] :
  /// Updates a Device Advisor test suite with suite definition configuration.
  Future<UpdateSuiteDefinitionResponse> updateSuiteDefinition({
    required String suiteDefinitionId,
    SuiteDefinitionConfiguration? suiteDefinitionConfiguration,
  }) async {
    ArgumentError.checkNotNull(suiteDefinitionId, 'suiteDefinitionId');
    _s.validateStringLength(
      'suiteDefinitionId',
      suiteDefinitionId,
      12,
      36,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      if (suiteDefinitionConfiguration != null)
        'suiteDefinitionConfiguration': suiteDefinitionConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/suiteDefinitions/${Uri.encodeComponent(suiteDefinitionId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateSuiteDefinitionResponse.fromJson(response);
  }
}

class CreateSuiteDefinitionResponse {
  /// Creates a Device Advisor test suite with TimeStamp of when it was created.
  final DateTime? createdAt;

  /// Creates a Device Advisor test suite with Amazon Resource name.
  final String? suiteDefinitionArn;

  /// Creates a Device Advisor test suite with suite UUID.
  final String? suiteDefinitionId;

  /// Creates a Device Advisor test suite with suite definition name.
  final String? suiteDefinitionName;

  CreateSuiteDefinitionResponse({
    this.createdAt,
    this.suiteDefinitionArn,
    this.suiteDefinitionId,
    this.suiteDefinitionName,
  });

  factory CreateSuiteDefinitionResponse.fromJson(Map<String, dynamic> json) {
    return CreateSuiteDefinitionResponse(
      createdAt: timeStampFromJson(json['createdAt']),
      suiteDefinitionArn: json['suiteDefinitionArn'] as String?,
      suiteDefinitionId: json['suiteDefinitionId'] as String?,
      suiteDefinitionName: json['suiteDefinitionName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final suiteDefinitionArn = this.suiteDefinitionArn;
    final suiteDefinitionId = this.suiteDefinitionId;
    final suiteDefinitionName = this.suiteDefinitionName;
    return {
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (suiteDefinitionArn != null) 'suiteDefinitionArn': suiteDefinitionArn,
      if (suiteDefinitionId != null) 'suiteDefinitionId': suiteDefinitionId,
      if (suiteDefinitionName != null)
        'suiteDefinitionName': suiteDefinitionName,
    };
  }
}

class DeleteSuiteDefinitionResponse {
  DeleteSuiteDefinitionResponse();

  factory DeleteSuiteDefinitionResponse.fromJson(Map<String, dynamic> _) {
    return DeleteSuiteDefinitionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Lists all the devices under test
class DeviceUnderTest {
  /// Lists devices certificate arn
  final String? certificateArn;

  /// Lists devices thing arn
  final String? thingArn;

  DeviceUnderTest({
    this.certificateArn,
    this.thingArn,
  });

  factory DeviceUnderTest.fromJson(Map<String, dynamic> json) {
    return DeviceUnderTest(
      certificateArn: json['certificateArn'] as String?,
      thingArn: json['thingArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final certificateArn = this.certificateArn;
    final thingArn = this.thingArn;
    return {
      if (certificateArn != null) 'certificateArn': certificateArn,
      if (thingArn != null) 'thingArn': thingArn,
    };
  }
}

class GetSuiteDefinitionResponse {
  /// Date (in Unix epoch time) when the suite definition was created.
  final DateTime? createdAt;

  /// Date (in Unix epoch time) when the suite definition was last modified.
  final DateTime? lastModifiedAt;

  /// Latest suite definition version of the suite definition.
  final String? latestVersion;

  /// The ARN of the suite definition.
  final String? suiteDefinitionArn;

  /// Suite configuration of the suite definition.
  final SuiteDefinitionConfiguration? suiteDefinitionConfiguration;

  /// Suite definition Id of the suite definition.
  final String? suiteDefinitionId;

  /// Suite definition version of the suite definition.
  final String? suiteDefinitionVersion;

  /// Tags attached to the suite definition.
  final Map<String, String>? tags;

  GetSuiteDefinitionResponse({
    this.createdAt,
    this.lastModifiedAt,
    this.latestVersion,
    this.suiteDefinitionArn,
    this.suiteDefinitionConfiguration,
    this.suiteDefinitionId,
    this.suiteDefinitionVersion,
    this.tags,
  });

  factory GetSuiteDefinitionResponse.fromJson(Map<String, dynamic> json) {
    return GetSuiteDefinitionResponse(
      createdAt: timeStampFromJson(json['createdAt']),
      lastModifiedAt: timeStampFromJson(json['lastModifiedAt']),
      latestVersion: json['latestVersion'] as String?,
      suiteDefinitionArn: json['suiteDefinitionArn'] as String?,
      suiteDefinitionConfiguration: json['suiteDefinitionConfiguration'] != null
          ? SuiteDefinitionConfiguration.fromJson(
              json['suiteDefinitionConfiguration'] as Map<String, dynamic>)
          : null,
      suiteDefinitionId: json['suiteDefinitionId'] as String?,
      suiteDefinitionVersion: json['suiteDefinitionVersion'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final lastModifiedAt = this.lastModifiedAt;
    final latestVersion = this.latestVersion;
    final suiteDefinitionArn = this.suiteDefinitionArn;
    final suiteDefinitionConfiguration = this.suiteDefinitionConfiguration;
    final suiteDefinitionId = this.suiteDefinitionId;
    final suiteDefinitionVersion = this.suiteDefinitionVersion;
    final tags = this.tags;
    return {
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (lastModifiedAt != null)
        'lastModifiedAt': unixTimestampToJson(lastModifiedAt),
      if (latestVersion != null) 'latestVersion': latestVersion,
      if (suiteDefinitionArn != null) 'suiteDefinitionArn': suiteDefinitionArn,
      if (suiteDefinitionConfiguration != null)
        'suiteDefinitionConfiguration': suiteDefinitionConfiguration,
      if (suiteDefinitionId != null) 'suiteDefinitionId': suiteDefinitionId,
      if (suiteDefinitionVersion != null)
        'suiteDefinitionVersion': suiteDefinitionVersion,
      if (tags != null) 'tags': tags,
    };
  }
}

class GetSuiteRunReportResponse {
  /// Download URL of the qualification report.
  final String? qualificationReportDownloadUrl;

  GetSuiteRunReportResponse({
    this.qualificationReportDownloadUrl,
  });

  factory GetSuiteRunReportResponse.fromJson(Map<String, dynamic> json) {
    return GetSuiteRunReportResponse(
      qualificationReportDownloadUrl:
          json['qualificationReportDownloadUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final qualificationReportDownloadUrl = this.qualificationReportDownloadUrl;
    return {
      if (qualificationReportDownloadUrl != null)
        'qualificationReportDownloadUrl': qualificationReportDownloadUrl,
    };
  }
}

class GetSuiteRunResponse {
  /// Date (in Unix epoch time) when the test suite run ended.
  final DateTime? endTime;

  /// Error reason for any test suite run failure.
  final String? errorReason;

  /// Date (in Unix epoch time) when the test suite run was started.
  final DateTime? startTime;

  /// Status for the test suite run.
  final SuiteRunStatus? status;

  /// Suite definition Id for the test suite run.
  final String? suiteDefinitionId;

  /// Suite definition version for the test suite run.
  final String? suiteDefinitionVersion;

  /// The ARN of the suite run.
  final String? suiteRunArn;

  /// Suite run configuration for the test suite run.
  final SuiteRunConfiguration? suiteRunConfiguration;

  /// Suite run Id for the test suite run.
  final String? suiteRunId;

  /// The tags attached to the suite run.
  final Map<String, String>? tags;

  /// Test results for the test suite run.
  final TestResult? testResult;

  GetSuiteRunResponse({
    this.endTime,
    this.errorReason,
    this.startTime,
    this.status,
    this.suiteDefinitionId,
    this.suiteDefinitionVersion,
    this.suiteRunArn,
    this.suiteRunConfiguration,
    this.suiteRunId,
    this.tags,
    this.testResult,
  });

  factory GetSuiteRunResponse.fromJson(Map<String, dynamic> json) {
    return GetSuiteRunResponse(
      endTime: timeStampFromJson(json['endTime']),
      errorReason: json['errorReason'] as String?,
      startTime: timeStampFromJson(json['startTime']),
      status: (json['status'] as String?)?.toSuiteRunStatus(),
      suiteDefinitionId: json['suiteDefinitionId'] as String?,
      suiteDefinitionVersion: json['suiteDefinitionVersion'] as String?,
      suiteRunArn: json['suiteRunArn'] as String?,
      suiteRunConfiguration: json['suiteRunConfiguration'] != null
          ? SuiteRunConfiguration.fromJson(
              json['suiteRunConfiguration'] as Map<String, dynamic>)
          : null,
      suiteRunId: json['suiteRunId'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      testResult: json['testResult'] != null
          ? TestResult.fromJson(json['testResult'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final endTime = this.endTime;
    final errorReason = this.errorReason;
    final startTime = this.startTime;
    final status = this.status;
    final suiteDefinitionId = this.suiteDefinitionId;
    final suiteDefinitionVersion = this.suiteDefinitionVersion;
    final suiteRunArn = this.suiteRunArn;
    final suiteRunConfiguration = this.suiteRunConfiguration;
    final suiteRunId = this.suiteRunId;
    final tags = this.tags;
    final testResult = this.testResult;
    return {
      if (endTime != null) 'endTime': unixTimestampToJson(endTime),
      if (errorReason != null) 'errorReason': errorReason,
      if (startTime != null) 'startTime': unixTimestampToJson(startTime),
      if (status != null) 'status': status.toValue(),
      if (suiteDefinitionId != null) 'suiteDefinitionId': suiteDefinitionId,
      if (suiteDefinitionVersion != null)
        'suiteDefinitionVersion': suiteDefinitionVersion,
      if (suiteRunArn != null) 'suiteRunArn': suiteRunArn,
      if (suiteRunConfiguration != null)
        'suiteRunConfiguration': suiteRunConfiguration,
      if (suiteRunId != null) 'suiteRunId': suiteRunId,
      if (tags != null) 'tags': tags,
      if (testResult != null) 'testResult': testResult,
    };
  }
}

/// Show Group Result.
class GroupResult {
  /// Group result Id.
  final String? groupId;

  /// Group Result Name.
  final String? groupName;

  /// Tests under Group Result.
  final List<TestCaseRun>? tests;

  GroupResult({
    this.groupId,
    this.groupName,
    this.tests,
  });

  factory GroupResult.fromJson(Map<String, dynamic> json) {
    return GroupResult(
      groupId: json['groupId'] as String?,
      groupName: json['groupName'] as String?,
      tests: (json['tests'] as List?)
          ?.whereNotNull()
          .map((e) => TestCaseRun.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final groupId = this.groupId;
    final groupName = this.groupName;
    final tests = this.tests;
    return {
      if (groupId != null) 'groupId': groupId,
      if (groupName != null) 'groupName': groupName,
      if (tests != null) 'tests': tests,
    };
  }
}

class ListSuiteDefinitionsResponse {
  /// A token used to get the next set of results.
  final String? nextToken;

  /// An array of objects that provide summaries of information about the suite
  /// definitions in the list.
  final List<SuiteDefinitionInformation>? suiteDefinitionInformationList;

  ListSuiteDefinitionsResponse({
    this.nextToken,
    this.suiteDefinitionInformationList,
  });

  factory ListSuiteDefinitionsResponse.fromJson(Map<String, dynamic> json) {
    return ListSuiteDefinitionsResponse(
      nextToken: json['nextToken'] as String?,
      suiteDefinitionInformationList: (json['suiteDefinitionInformationList']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              SuiteDefinitionInformation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final suiteDefinitionInformationList = this.suiteDefinitionInformationList;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (suiteDefinitionInformationList != null)
        'suiteDefinitionInformationList': suiteDefinitionInformationList,
    };
  }
}

class ListSuiteRunsResponse {
  /// A token to retrieve the next set of results.
  final String? nextToken;

  /// An array of objects that provide summaries of information about the suite
  /// runs in the list.
  final List<SuiteRunInformation>? suiteRunsList;

  ListSuiteRunsResponse({
    this.nextToken,
    this.suiteRunsList,
  });

  factory ListSuiteRunsResponse.fromJson(Map<String, dynamic> json) {
    return ListSuiteRunsResponse(
      nextToken: json['nextToken'] as String?,
      suiteRunsList: (json['suiteRunsList'] as List?)
          ?.whereNotNull()
          .map((e) => SuiteRunInformation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final suiteRunsList = this.suiteRunsList;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (suiteRunsList != null) 'suiteRunsList': suiteRunsList,
    };
  }
}

class ListTagsForResourceResponse {
  /// The tags attached to the IoT Device Advisor resource.
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

class StartSuiteRunResponse {
  /// Date (in Unix epoch time) when the suite run was created.
  final DateTime? createdAt;

  /// Amazon resource name of the started suite run.
  final String? suiteRunArn;

  /// Suite Run Id of the started suite run.
  final String? suiteRunId;

  StartSuiteRunResponse({
    this.createdAt,
    this.suiteRunArn,
    this.suiteRunId,
  });

  factory StartSuiteRunResponse.fromJson(Map<String, dynamic> json) {
    return StartSuiteRunResponse(
      createdAt: timeStampFromJson(json['createdAt']),
      suiteRunArn: json['suiteRunArn'] as String?,
      suiteRunId: json['suiteRunId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final suiteRunArn = this.suiteRunArn;
    final suiteRunId = this.suiteRunId;
    return {
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (suiteRunArn != null) 'suiteRunArn': suiteRunArn,
      if (suiteRunId != null) 'suiteRunId': suiteRunId,
    };
  }
}

enum Status {
  pass,
  fail,
  canceled,
  pending,
  running,
  stopping,
  stopped,
  passWithWarnings,
  error,
}

extension on Status {
  String toValue() {
    switch (this) {
      case Status.pass:
        return 'PASS';
      case Status.fail:
        return 'FAIL';
      case Status.canceled:
        return 'CANCELED';
      case Status.pending:
        return 'PENDING';
      case Status.running:
        return 'RUNNING';
      case Status.stopping:
        return 'STOPPING';
      case Status.stopped:
        return 'STOPPED';
      case Status.passWithWarnings:
        return 'PASS_WITH_WARNINGS';
      case Status.error:
        return 'ERROR';
    }
  }
}

extension on String {
  Status toStatus() {
    switch (this) {
      case 'PASS':
        return Status.pass;
      case 'FAIL':
        return Status.fail;
      case 'CANCELED':
        return Status.canceled;
      case 'PENDING':
        return Status.pending;
      case 'RUNNING':
        return Status.running;
      case 'STOPPING':
        return Status.stopping;
      case 'STOPPED':
        return Status.stopped;
      case 'PASS_WITH_WARNINGS':
        return Status.passWithWarnings;
      case 'ERROR':
        return Status.error;
    }
    throw Exception('$this is not known in enum Status');
  }
}

class StopSuiteRunResponse {
  StopSuiteRunResponse();

  factory StopSuiteRunResponse.fromJson(Map<String, dynamic> _) {
    return StopSuiteRunResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Gets Suite Definition Configuration.
class SuiteDefinitionConfiguration {
  /// Gets device permission arn.
  final String? devicePermissionRoleArn;

  /// Gets the devices configured.
  final List<DeviceUnderTest>? devices;

  /// Gets the tests intended for qualification in a suite.
  final bool? intendedForQualification;

  /// Gets test suite root group.
  final String? rootGroup;

  /// Gets Suite Definition Configuration name.
  final String? suiteDefinitionName;

  SuiteDefinitionConfiguration({
    this.devicePermissionRoleArn,
    this.devices,
    this.intendedForQualification,
    this.rootGroup,
    this.suiteDefinitionName,
  });

  factory SuiteDefinitionConfiguration.fromJson(Map<String, dynamic> json) {
    return SuiteDefinitionConfiguration(
      devicePermissionRoleArn: json['devicePermissionRoleArn'] as String?,
      devices: (json['devices'] as List?)
          ?.whereNotNull()
          .map((e) => DeviceUnderTest.fromJson(e as Map<String, dynamic>))
          .toList(),
      intendedForQualification: json['intendedForQualification'] as bool?,
      rootGroup: json['rootGroup'] as String?,
      suiteDefinitionName: json['suiteDefinitionName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final devicePermissionRoleArn = this.devicePermissionRoleArn;
    final devices = this.devices;
    final intendedForQualification = this.intendedForQualification;
    final rootGroup = this.rootGroup;
    final suiteDefinitionName = this.suiteDefinitionName;
    return {
      if (devicePermissionRoleArn != null)
        'devicePermissionRoleArn': devicePermissionRoleArn,
      if (devices != null) 'devices': devices,
      if (intendedForQualification != null)
        'intendedForQualification': intendedForQualification,
      if (rootGroup != null) 'rootGroup': rootGroup,
      if (suiteDefinitionName != null)
        'suiteDefinitionName': suiteDefinitionName,
    };
  }
}

/// Information about the suite definition.
class SuiteDefinitionInformation {
  /// Date (in Unix epoch time) when the test suite was created.
  final DateTime? createdAt;

  /// Specifies the devices under test for the test suite.
  final List<DeviceUnderTest>? defaultDevices;

  /// Specifies if the test suite is intended for qualification.
  final bool? intendedForQualification;

  /// Suite definition Id of the test suite.
  final String? suiteDefinitionId;

  /// Suite name of the test suite.
  final String? suiteDefinitionName;

  SuiteDefinitionInformation({
    this.createdAt,
    this.defaultDevices,
    this.intendedForQualification,
    this.suiteDefinitionId,
    this.suiteDefinitionName,
  });

  factory SuiteDefinitionInformation.fromJson(Map<String, dynamic> json) {
    return SuiteDefinitionInformation(
      createdAt: timeStampFromJson(json['createdAt']),
      defaultDevices: (json['defaultDevices'] as List?)
          ?.whereNotNull()
          .map((e) => DeviceUnderTest.fromJson(e as Map<String, dynamic>))
          .toList(),
      intendedForQualification: json['intendedForQualification'] as bool?,
      suiteDefinitionId: json['suiteDefinitionId'] as String?,
      suiteDefinitionName: json['suiteDefinitionName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final defaultDevices = this.defaultDevices;
    final intendedForQualification = this.intendedForQualification;
    final suiteDefinitionId = this.suiteDefinitionId;
    final suiteDefinitionName = this.suiteDefinitionName;
    return {
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (defaultDevices != null) 'defaultDevices': defaultDevices,
      if (intendedForQualification != null)
        'intendedForQualification': intendedForQualification,
      if (suiteDefinitionId != null) 'suiteDefinitionId': suiteDefinitionId,
      if (suiteDefinitionName != null)
        'suiteDefinitionName': suiteDefinitionName,
    };
  }
}

/// Gets suite run configuration.
class SuiteRunConfiguration {
  /// Gets the primary device for suite run.
  final DeviceUnderTest? primaryDevice;

  /// Gets test case list.
  final List<String>? selectedTestList;

  SuiteRunConfiguration({
    this.primaryDevice,
    this.selectedTestList,
  });

  factory SuiteRunConfiguration.fromJson(Map<String, dynamic> json) {
    return SuiteRunConfiguration(
      primaryDevice: json['primaryDevice'] != null
          ? DeviceUnderTest.fromJson(
              json['primaryDevice'] as Map<String, dynamic>)
          : null,
      selectedTestList: (json['selectedTestList'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final primaryDevice = this.primaryDevice;
    final selectedTestList = this.selectedTestList;
    return {
      if (primaryDevice != null) 'primaryDevice': primaryDevice,
      if (selectedTestList != null) 'selectedTestList': selectedTestList,
    };
  }
}

/// Information about the suite run.
class SuiteRunInformation {
  /// Date (in Unix epoch time) when the suite run was created.
  final DateTime? createdAt;

  /// Date (in Unix epoch time) when the suite run ended.
  final DateTime? endAt;

  /// Number of test cases that failed in the suite run.
  final int? failed;

  /// Number of test cases that passed in the suite run.
  final int? passed;

  /// Date (in Unix epoch time) when the suite run was started.
  final DateTime? startedAt;

  /// Status of the suite run.
  final SuiteRunStatus? status;

  /// Suite definition Id of the suite run.
  final String? suiteDefinitionId;

  /// Suite definition name of the suite run.
  final String? suiteDefinitionName;

  /// Suite definition version of the suite run.
  final String? suiteDefinitionVersion;

  /// Suite run Id of the suite run.
  final String? suiteRunId;

  SuiteRunInformation({
    this.createdAt,
    this.endAt,
    this.failed,
    this.passed,
    this.startedAt,
    this.status,
    this.suiteDefinitionId,
    this.suiteDefinitionName,
    this.suiteDefinitionVersion,
    this.suiteRunId,
  });

  factory SuiteRunInformation.fromJson(Map<String, dynamic> json) {
    return SuiteRunInformation(
      createdAt: timeStampFromJson(json['createdAt']),
      endAt: timeStampFromJson(json['endAt']),
      failed: json['failed'] as int?,
      passed: json['passed'] as int?,
      startedAt: timeStampFromJson(json['startedAt']),
      status: (json['status'] as String?)?.toSuiteRunStatus(),
      suiteDefinitionId: json['suiteDefinitionId'] as String?,
      suiteDefinitionName: json['suiteDefinitionName'] as String?,
      suiteDefinitionVersion: json['suiteDefinitionVersion'] as String?,
      suiteRunId: json['suiteRunId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final endAt = this.endAt;
    final failed = this.failed;
    final passed = this.passed;
    final startedAt = this.startedAt;
    final status = this.status;
    final suiteDefinitionId = this.suiteDefinitionId;
    final suiteDefinitionName = this.suiteDefinitionName;
    final suiteDefinitionVersion = this.suiteDefinitionVersion;
    final suiteRunId = this.suiteRunId;
    return {
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (endAt != null) 'endAt': unixTimestampToJson(endAt),
      if (failed != null) 'failed': failed,
      if (passed != null) 'passed': passed,
      if (startedAt != null) 'startedAt': unixTimestampToJson(startedAt),
      if (status != null) 'status': status.toValue(),
      if (suiteDefinitionId != null) 'suiteDefinitionId': suiteDefinitionId,
      if (suiteDefinitionName != null)
        'suiteDefinitionName': suiteDefinitionName,
      if (suiteDefinitionVersion != null)
        'suiteDefinitionVersion': suiteDefinitionVersion,
      if (suiteRunId != null) 'suiteRunId': suiteRunId,
    };
  }
}

enum SuiteRunStatus {
  pass,
  fail,
  canceled,
  pending,
  running,
  stopping,
  stopped,
  passWithWarnings,
  error,
}

extension on SuiteRunStatus {
  String toValue() {
    switch (this) {
      case SuiteRunStatus.pass:
        return 'PASS';
      case SuiteRunStatus.fail:
        return 'FAIL';
      case SuiteRunStatus.canceled:
        return 'CANCELED';
      case SuiteRunStatus.pending:
        return 'PENDING';
      case SuiteRunStatus.running:
        return 'RUNNING';
      case SuiteRunStatus.stopping:
        return 'STOPPING';
      case SuiteRunStatus.stopped:
        return 'STOPPED';
      case SuiteRunStatus.passWithWarnings:
        return 'PASS_WITH_WARNINGS';
      case SuiteRunStatus.error:
        return 'ERROR';
    }
  }
}

extension on String {
  SuiteRunStatus toSuiteRunStatus() {
    switch (this) {
      case 'PASS':
        return SuiteRunStatus.pass;
      case 'FAIL':
        return SuiteRunStatus.fail;
      case 'CANCELED':
        return SuiteRunStatus.canceled;
      case 'PENDING':
        return SuiteRunStatus.pending;
      case 'RUNNING':
        return SuiteRunStatus.running;
      case 'STOPPING':
        return SuiteRunStatus.stopping;
      case 'STOPPED':
        return SuiteRunStatus.stopped;
      case 'PASS_WITH_WARNINGS':
        return SuiteRunStatus.passWithWarnings;
      case 'ERROR':
        return SuiteRunStatus.error;
    }
    throw Exception('$this is not known in enum SuiteRunStatus');
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

/// Provides test case run.
class TestCaseRun {
  /// Provides test case run end time.
  final DateTime? endTime;

  /// Provides test case run failure result.
  final String? failure;

  /// Provides test case run log Url.
  final String? logUrl;

  /// Provides test case run start time.
  final DateTime? startTime;

  /// Provides test case run status.
  final Status? status;

  /// Provides test case run definition Id.
  final String? testCaseDefinitionId;

  /// Provides test case run definition Name.
  final String? testCaseDefinitionName;

  /// Provides test case run Id.
  final String? testCaseRunId;

  /// Provides test case run warnings.
  final String? warnings;

  TestCaseRun({
    this.endTime,
    this.failure,
    this.logUrl,
    this.startTime,
    this.status,
    this.testCaseDefinitionId,
    this.testCaseDefinitionName,
    this.testCaseRunId,
    this.warnings,
  });

  factory TestCaseRun.fromJson(Map<String, dynamic> json) {
    return TestCaseRun(
      endTime: timeStampFromJson(json['endTime']),
      failure: json['failure'] as String?,
      logUrl: json['logUrl'] as String?,
      startTime: timeStampFromJson(json['startTime']),
      status: (json['status'] as String?)?.toStatus(),
      testCaseDefinitionId: json['testCaseDefinitionId'] as String?,
      testCaseDefinitionName: json['testCaseDefinitionName'] as String?,
      testCaseRunId: json['testCaseRunId'] as String?,
      warnings: json['warnings'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final endTime = this.endTime;
    final failure = this.failure;
    final logUrl = this.logUrl;
    final startTime = this.startTime;
    final status = this.status;
    final testCaseDefinitionId = this.testCaseDefinitionId;
    final testCaseDefinitionName = this.testCaseDefinitionName;
    final testCaseRunId = this.testCaseRunId;
    final warnings = this.warnings;
    return {
      if (endTime != null) 'endTime': unixTimestampToJson(endTime),
      if (failure != null) 'failure': failure,
      if (logUrl != null) 'logUrl': logUrl,
      if (startTime != null) 'startTime': unixTimestampToJson(startTime),
      if (status != null) 'status': status.toValue(),
      if (testCaseDefinitionId != null)
        'testCaseDefinitionId': testCaseDefinitionId,
      if (testCaseDefinitionName != null)
        'testCaseDefinitionName': testCaseDefinitionName,
      if (testCaseRunId != null) 'testCaseRunId': testCaseRunId,
      if (warnings != null) 'warnings': warnings,
    };
  }
}

/// Show each group result.
class TestResult {
  /// Show each group of test results.
  final List<GroupResult>? groups;

  TestResult({
    this.groups,
  });

  factory TestResult.fromJson(Map<String, dynamic> json) {
    return TestResult(
      groups: (json['groups'] as List?)
          ?.whereNotNull()
          .map((e) => GroupResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final groups = this.groups;
    return {
      if (groups != null) 'groups': groups,
    };
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

class UpdateSuiteDefinitionResponse {
  /// Timestamp of when the test suite was created.
  final DateTime? createdAt;

  /// Timestamp of when the test suite was updated.
  final DateTime? lastUpdatedAt;

  /// Amazon Resource name of the updated test suite.
  final String? suiteDefinitionArn;

  /// Suite definition Id of the updated test suite.
  final String? suiteDefinitionId;

  /// Suite definition name of the updated test suite.
  final String? suiteDefinitionName;

  /// Suite definition version of the updated test suite.
  final String? suiteDefinitionVersion;

  UpdateSuiteDefinitionResponse({
    this.createdAt,
    this.lastUpdatedAt,
    this.suiteDefinitionArn,
    this.suiteDefinitionId,
    this.suiteDefinitionName,
    this.suiteDefinitionVersion,
  });

  factory UpdateSuiteDefinitionResponse.fromJson(Map<String, dynamic> json) {
    return UpdateSuiteDefinitionResponse(
      createdAt: timeStampFromJson(json['createdAt']),
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      suiteDefinitionArn: json['suiteDefinitionArn'] as String?,
      suiteDefinitionId: json['suiteDefinitionId'] as String?,
      suiteDefinitionName: json['suiteDefinitionName'] as String?,
      suiteDefinitionVersion: json['suiteDefinitionVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final lastUpdatedAt = this.lastUpdatedAt;
    final suiteDefinitionArn = this.suiteDefinitionArn;
    final suiteDefinitionId = this.suiteDefinitionId;
    final suiteDefinitionName = this.suiteDefinitionName;
    final suiteDefinitionVersion = this.suiteDefinitionVersion;
    return {
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (lastUpdatedAt != null)
        'lastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (suiteDefinitionArn != null) 'suiteDefinitionArn': suiteDefinitionArn,
      if (suiteDefinitionId != null) 'suiteDefinitionId': suiteDefinitionId,
      if (suiteDefinitionName != null)
        'suiteDefinitionName': suiteDefinitionName,
      if (suiteDefinitionVersion != null)
        'suiteDefinitionVersion': suiteDefinitionVersion,
    };
  }
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

class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
