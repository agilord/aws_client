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

part '2020-09-18.g.dart';

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
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
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
    SuiteDefinitionConfiguration suiteDefinitionConfiguration,
    Map<String, String> tags,
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
  /// Deletes a Device Advisor test suite with defined suite Id.
  Future<void> deleteSuiteDefinition({
    @_s.required String suiteDefinitionId,
  }) async {
    ArgumentError.checkNotNull(suiteDefinitionId, 'suiteDefinitionId');
    _s.validateStringLength(
      'suiteDefinitionId',
      suiteDefinitionId,
      36,
      36,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/suiteDefinitions/${Uri.encodeComponent(suiteDefinitionId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteSuiteDefinitionResponse.fromJson(response);
  }

  /// Gets information about a Device Advisor test suite.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [suiteDefinitionId] :
  /// Requests suite definition Id with GetSuiteDefinition API call.
  ///
  /// Parameter [suiteDefinitionVersion] :
  /// Requests the suite definition version of a test suite.
  Future<GetSuiteDefinitionResponse> getSuiteDefinition({
    @_s.required String suiteDefinitionId,
    String suiteDefinitionVersion,
  }) async {
    ArgumentError.checkNotNull(suiteDefinitionId, 'suiteDefinitionId');
    _s.validateStringLength(
      'suiteDefinitionId',
      suiteDefinitionId,
      36,
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
  /// Requests the information about Device Advisor test suite run based on
  /// suite definition Id.
  ///
  /// Parameter [suiteRunId] :
  /// Requests the information about Device Advisor test suite run based on
  /// suite run Id.
  Future<GetSuiteRunResponse> getSuiteRun({
    @_s.required String suiteDefinitionId,
    @_s.required String suiteRunId,
  }) async {
    ArgumentError.checkNotNull(suiteDefinitionId, 'suiteDefinitionId');
    _s.validateStringLength(
      'suiteDefinitionId',
      suiteDefinitionId,
      36,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(suiteRunId, 'suiteRunId');
    _s.validateStringLength(
      'suiteRunId',
      suiteRunId,
      36,
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
  /// Device Advisor suite definition Id.
  ///
  /// Parameter [suiteRunId] :
  /// Device Advisor suite run Id.
  Future<GetSuiteRunReportResponse> getSuiteRunReport({
    @_s.required String suiteDefinitionId,
    @_s.required String suiteRunId,
  }) async {
    ArgumentError.checkNotNull(suiteDefinitionId, 'suiteDefinitionId');
    _s.validateStringLength(
      'suiteDefinitionId',
      suiteDefinitionId,
      36,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(suiteRunId, 'suiteRunId');
    _s.validateStringLength(
      'suiteRunId',
      suiteRunId,
      36,
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
  /// Request the list of all the Device Advisor test suites.
  ///
  /// Parameter [nextToken] :
  /// Requests the Device Advisor test suites next token.
  Future<ListSuiteDefinitionsResponse> listSuiteDefinitions({
    int maxResults,
    String nextToken,
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
  /// MaxResults for list suite run API request.
  ///
  /// Parameter [nextToken] :
  /// Next pagination token for list suite run request.
  ///
  /// Parameter [suiteDefinitionId] :
  /// Lists the runs of the specified Device Advisor test suite based on suite
  /// definition Id.
  ///
  /// Parameter [suiteDefinitionVersion] :
  /// Lists the runs of the specified Device Advisor test suite based on suite
  /// definition version.
  Future<ListSuiteRunsResponse> listSuiteRuns({
    int maxResults,
    String nextToken,
    String suiteDefinitionId,
    String suiteDefinitionVersion,
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
      36,
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
    @_s.required String resourceArn,
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

  /// Lists all the test cases in the test suite.
  ///
  /// May throw [InternalServerException].
  ///
  /// Parameter [intendedForQualification] :
  /// Lists all the qualification test cases in the test suite.
  ///
  /// Parameter [maxResults] :
  /// Requests the test cases max results.
  ///
  /// Parameter [nextToken] :
  /// Requests the test cases next token.
  Future<ListTestCasesResponse> listTestCases({
    bool intendedForQualification,
    int maxResults,
    String nextToken,
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
      if (intendedForQualification != null)
        'intendedForQualification': [intendedForQualification.toString()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/testCases',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListTestCasesResponse.fromJson(response);
  }

  /// Starts a Device Advisor test suite run.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  ///
  /// Parameter [suiteDefinitionId] :
  /// Request to start suite run based on suite definition Id.
  ///
  /// Parameter [suiteDefinitionVersion] :
  /// Request to start suite run based on suite definition version.
  ///
  /// Parameter [suiteRunConfiguration] :
  /// Request to start suite run based on suite configuration.
  ///
  /// Parameter [tags] :
  /// The tags to be attached to the suite run.
  Future<StartSuiteRunResponse> startSuiteRun({
    @_s.required String suiteDefinitionId,
    String suiteDefinitionVersion,
    SuiteRunConfiguration suiteRunConfiguration,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(suiteDefinitionId, 'suiteDefinitionId');
    _s.validateStringLength(
      'suiteDefinitionId',
      suiteDefinitionId,
      36,
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
    @_s.required String resourceArn,
    @_s.required Map<String, String> tags,
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
    return TagResourceResponse.fromJson(response);
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
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
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
      if (tagKeys != null) 'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return UntagResourceResponse.fromJson(response);
  }

  /// Updates a Device Advisor test suite.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [suiteDefinitionId] :
  /// Updates a Device Advisor test suite with suite definition id.
  ///
  /// Parameter [suiteDefinitionConfiguration] :
  /// Updates a Device Advisor test suite with suite definition configuration.
  Future<UpdateSuiteDefinitionResponse> updateSuiteDefinition({
    @_s.required String suiteDefinitionId,
    SuiteDefinitionConfiguration suiteDefinitionConfiguration,
  }) async {
    ArgumentError.checkNotNull(suiteDefinitionId, 'suiteDefinitionId');
    _s.validateStringLength(
      'suiteDefinitionId',
      suiteDefinitionId,
      36,
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

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateSuiteDefinitionResponse {
  /// Creates a Device Advisor test suite with TimeStamp of when it was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// Creates a Device Advisor test suite with Amazon Resource name.
  @_s.JsonKey(name: 'suiteDefinitionArn')
  final String suiteDefinitionArn;

  /// Creates a Device Advisor test suite with suite UUID.
  @_s.JsonKey(name: 'suiteDefinitionId')
  final String suiteDefinitionId;

  /// Creates a Device Advisor test suite with suite definition name.
  @_s.JsonKey(name: 'suiteDefinitionName')
  final String suiteDefinitionName;

  CreateSuiteDefinitionResponse({
    this.createdAt,
    this.suiteDefinitionArn,
    this.suiteDefinitionId,
    this.suiteDefinitionName,
  });
  factory CreateSuiteDefinitionResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateSuiteDefinitionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteSuiteDefinitionResponse {
  DeleteSuiteDefinitionResponse();
  factory DeleteSuiteDefinitionResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteSuiteDefinitionResponseFromJson(json);
}

/// Lists all the devices under test
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DeviceUnderTest {
  /// Lists devices certificate arn
  @_s.JsonKey(name: 'certificateArn')
  final String certificateArn;

  /// Lists devices thing arn
  @_s.JsonKey(name: 'thingArn')
  final String thingArn;

  DeviceUnderTest({
    this.certificateArn,
    this.thingArn,
  });
  factory DeviceUnderTest.fromJson(Map<String, dynamic> json) =>
      _$DeviceUnderTestFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceUnderTestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetSuiteDefinitionResponse {
  /// Gets the timestamp of the time suite was created with GetSuiteDefinition API
  /// call.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// Gets the timestamp of the time suite was modified with GetSuiteDefinition
  /// API call.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastModifiedAt')
  final DateTime lastModifiedAt;

  /// Gets latest suite definition version with GetSuiteDefinition API call.
  @_s.JsonKey(name: 'latestVersion')
  final String latestVersion;

  /// The ARN of the suite definition.
  @_s.JsonKey(name: 'suiteDefinitionArn')
  final String suiteDefinitionArn;

  /// Gets the suite configuration with GetSuiteDefinition API call.
  @_s.JsonKey(name: 'suiteDefinitionConfiguration')
  final SuiteDefinitionConfiguration suiteDefinitionConfiguration;

  /// Gets suite definition Id with GetSuiteDefinition API call.
  @_s.JsonKey(name: 'suiteDefinitionId')
  final String suiteDefinitionId;

  /// Gets suite definition version with GetSuiteDefinition API call.
  @_s.JsonKey(name: 'suiteDefinitionVersion')
  final String suiteDefinitionVersion;

  /// Tags attached to the suite definition.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

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
  factory GetSuiteDefinitionResponse.fromJson(Map<String, dynamic> json) =>
      _$GetSuiteDefinitionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetSuiteRunReportResponse {
  /// Gets the download URL of the qualification report.
  @_s.JsonKey(name: 'qualificationReportDownloadUrl')
  final String qualificationReportDownloadUrl;

  GetSuiteRunReportResponse({
    this.qualificationReportDownloadUrl,
  });
  factory GetSuiteRunReportResponse.fromJson(Map<String, dynamic> json) =>
      _$GetSuiteRunReportResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetSuiteRunResponse {
  /// Gets the information about Device Advisor test suite run based on end time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'endTime')
  final DateTime endTime;

  /// Gets the information about Device Advisor test suite run based on error.
  @_s.JsonKey(name: 'errorReason')
  final String errorReason;

  /// Gets the information about Device Advisor test suite run based on start
  /// time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'startTime')
  final DateTime startTime;

  /// Gets the information about Device Advisor test suite run based on its
  /// status.
  @_s.JsonKey(name: 'status')
  final SuiteRunStatus status;

  /// Gets the information about Device Advisor test suite run based on suite
  /// definition Id.
  @_s.JsonKey(name: 'suiteDefinitionId')
  final String suiteDefinitionId;

  /// Gets the information about Device Advisor test suite run based on suite
  /// definition version.
  @_s.JsonKey(name: 'suiteDefinitionVersion')
  final String suiteDefinitionVersion;

  /// The ARN of the suite run.
  @_s.JsonKey(name: 'suiteRunArn')
  final String suiteRunArn;

  /// Gets the information about Device Advisor test suite run based on suite
  /// configuration.
  @_s.JsonKey(name: 'suiteRunConfiguration')
  final SuiteRunConfiguration suiteRunConfiguration;

  /// Gets the information about Device Advisor test suite run based on suite run
  /// Id.
  @_s.JsonKey(name: 'suiteRunId')
  final String suiteRunId;

  /// The tags attached to the suite run.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  /// Gets the information about Device Advisor test suite run based on test case
  /// runs.
  @_s.JsonKey(name: 'testResult')
  final TestResult testResult;

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
  factory GetSuiteRunResponse.fromJson(Map<String, dynamic> json) =>
      _$GetSuiteRunResponseFromJson(json);
}

/// Show Group Result.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GroupResult {
  /// Show Group Result Id.
  @_s.JsonKey(name: 'groupId')
  final String groupId;

  /// Show Group Result Name.
  @_s.JsonKey(name: 'groupName')
  final String groupName;

  /// Show Group Result.
  @_s.JsonKey(name: 'tests')
  final List<TestCaseRun> tests;

  GroupResult({
    this.groupId,
    this.groupName,
    this.tests,
  });
  factory GroupResult.fromJson(Map<String, dynamic> json) =>
      _$GroupResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListSuiteDefinitionsResponse {
  /// Creates a Device Advisor test suite.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// Lists test suite information using List suite definition.
  @_s.JsonKey(name: 'suiteDefinitionInformationList')
  final List<SuiteDefinitionInformation> suiteDefinitionInformationList;

  ListSuiteDefinitionsResponse({
    this.nextToken,
    this.suiteDefinitionInformationList,
  });
  factory ListSuiteDefinitionsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListSuiteDefinitionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListSuiteRunsResponse {
  /// Next pagination token for list suite run response.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// Lists the runs of the specified Device Advisor test suite.
  @_s.JsonKey(name: 'suiteRunsList')
  final List<SuiteRunInformation> suiteRunsList;

  ListSuiteRunsResponse({
    this.nextToken,
    this.suiteRunsList,
  });
  factory ListSuiteRunsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListSuiteRunsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// The tags attached to the IoT Device Advisor resource.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTestCasesResponse {
  /// Gets the category of test case.
  @_s.JsonKey(name: 'categories')
  final List<TestCaseCategory> categories;

  /// Gets the configuration of test group.
  @_s.JsonKey(name: 'groupConfiguration')
  final Map<String, String> groupConfiguration;

  /// Test cases next token response.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// Gets the configuration of root test group.
  @_s.JsonKey(name: 'rootGroupConfiguration')
  final Map<String, String> rootGroupConfiguration;

  ListTestCasesResponse({
    this.categories,
    this.groupConfiguration,
    this.nextToken,
    this.rootGroupConfiguration,
  });
  factory ListTestCasesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTestCasesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartSuiteRunResponse {
  /// Starts a Device Advisor test suite run based on suite create time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// Starts a Device Advisor test suite run based on suite run arn.
  @_s.JsonKey(name: 'suiteRunArn')
  final String suiteRunArn;

  /// Starts a Device Advisor test suite run based on suite Run Id.
  @_s.JsonKey(name: 'suiteRunId')
  final String suiteRunId;

  StartSuiteRunResponse({
    this.createdAt,
    this.suiteRunArn,
    this.suiteRunId,
  });
  factory StartSuiteRunResponse.fromJson(Map<String, dynamic> json) =>
      _$StartSuiteRunResponseFromJson(json);
}

enum Status {
  @_s.JsonValue('PASS')
  pass,
  @_s.JsonValue('FAIL')
  fail,
  @_s.JsonValue('CANCELED')
  canceled,
  @_s.JsonValue('PENDING')
  pending,
  @_s.JsonValue('RUNNING')
  running,
  @_s.JsonValue('PASS_WITH_WARNINGS')
  passWithWarnings,
  @_s.JsonValue('ERROR')
  error,
}

/// Gets Suite Definition Configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SuiteDefinitionConfiguration {
  /// Gets device permission arn.
  @_s.JsonKey(name: 'devicePermissionRoleArn')
  final String devicePermissionRoleArn;

  /// Gets the devices configured.
  @_s.JsonKey(name: 'devices')
  final List<DeviceUnderTest> devices;

  /// Gets the tests intended for qualification in a suite.
  @_s.JsonKey(name: 'intendedForQualification')
  final bool intendedForQualification;

  /// Gets test suite root group.
  @_s.JsonKey(name: 'rootGroup')
  final String rootGroup;

  /// Gets Suite Definition Configuration name.
  @_s.JsonKey(name: 'suiteDefinitionName')
  final String suiteDefinitionName;

  SuiteDefinitionConfiguration({
    this.devicePermissionRoleArn,
    this.devices,
    this.intendedForQualification,
    this.rootGroup,
    this.suiteDefinitionName,
  });
  factory SuiteDefinitionConfiguration.fromJson(Map<String, dynamic> json) =>
      _$SuiteDefinitionConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$SuiteDefinitionConfigurationToJson(this);
}

/// Get suite definition information.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SuiteDefinitionInformation {
  /// Gets the information of when the test suite was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// Specifies the devices under test.
  @_s.JsonKey(name: 'defaultDevices')
  final List<DeviceUnderTest> defaultDevices;

  /// Gets the test suites which will be used for qualification.
  @_s.JsonKey(name: 'intendedForQualification')
  final bool intendedForQualification;

  /// Get suite definition Id.
  @_s.JsonKey(name: 'suiteDefinitionId')
  final String suiteDefinitionId;

  /// Get test suite name.
  @_s.JsonKey(name: 'suiteDefinitionName')
  final String suiteDefinitionName;

  SuiteDefinitionInformation({
    this.createdAt,
    this.defaultDevices,
    this.intendedForQualification,
    this.suiteDefinitionId,
    this.suiteDefinitionName,
  });
  factory SuiteDefinitionInformation.fromJson(Map<String, dynamic> json) =>
      _$SuiteDefinitionInformationFromJson(json);
}

/// Gets suite run configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SuiteRunConfiguration {
  /// Gets the primary device for suite run.
  @_s.JsonKey(name: 'primaryDevice')
  final DeviceUnderTest primaryDevice;

  /// Gets the secondary device for suite run.
  @_s.JsonKey(name: 'secondaryDevice')
  final DeviceUnderTest secondaryDevice;

  /// Gets test case list.
  @_s.JsonKey(name: 'selectedTestList')
  final List<String> selectedTestList;

  SuiteRunConfiguration({
    this.primaryDevice,
    this.secondaryDevice,
    this.selectedTestList,
  });
  factory SuiteRunConfiguration.fromJson(Map<String, dynamic> json) =>
      _$SuiteRunConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$SuiteRunConfigurationToJson(this);
}

/// Get suite run information.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SuiteRunInformation {
  /// Get suite run information based on time suite was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// Get suite run information based on end time of the run.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'endAt')
  final DateTime endAt;

  /// Get suite run information based on result of the test suite run.
  @_s.JsonKey(name: 'failed')
  final int failed;

  /// Get suite run information based on result of the test suite run.
  @_s.JsonKey(name: 'passed')
  final int passed;

  /// Get suite run information based on start time of the run.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'startedAt')
  final DateTime startedAt;

  /// Get suite run information based on test run status.
  @_s.JsonKey(name: 'status')
  final SuiteRunStatus status;

  /// Get suite run information based on suite definition Id.
  @_s.JsonKey(name: 'suiteDefinitionId')
  final String suiteDefinitionId;

  /// Get suite run information based on suite definition name.
  @_s.JsonKey(name: 'suiteDefinitionName')
  final String suiteDefinitionName;

  /// Get suite run information based on suite definition version.
  @_s.JsonKey(name: 'suiteDefinitionVersion')
  final String suiteDefinitionVersion;

  /// Get suite run information based on suite run Id.
  @_s.JsonKey(name: 'suiteRunId')
  final String suiteRunId;

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
  factory SuiteRunInformation.fromJson(Map<String, dynamic> json) =>
      _$SuiteRunInformationFromJson(json);
}

enum SuiteRunStatus {
  @_s.JsonValue('PASS')
  pass,
  @_s.JsonValue('FAIL')
  fail,
  @_s.JsonValue('CANCELED')
  canceled,
  @_s.JsonValue('PENDING')
  pending,
  @_s.JsonValue('RUNNING')
  running,
  @_s.JsonValue('PASS_WITH_WARNINGS')
  passWithWarnings,
  @_s.JsonValue('ERROR')
  error,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TagResourceResponse {
  TagResourceResponse();
  factory TagResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$TagResourceResponseFromJson(json);
}

/// Shows tests in a test group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TestCase {
  /// Shows test case configuration.
  @_s.JsonKey(name: 'configuration')
  final Map<String, String> configuration;

  /// Shows test case name.
  @_s.JsonKey(name: 'name')
  final String name;

  /// Specifies a test.
  @_s.JsonKey(name: 'test')
  final TestCaseDefinition test;

  TestCase({
    this.configuration,
    this.name,
    this.test,
  });
  factory TestCase.fromJson(Map<String, dynamic> json) =>
      _$TestCaseFromJson(json);
}

/// Gets the test case category.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TestCaseCategory {
  /// Lists all the tests name in the specified category.
  @_s.JsonKey(name: 'name')
  final String name;

  /// Lists all the tests in the specified category.
  @_s.JsonKey(name: 'tests')
  final List<TestCase> tests;

  TestCaseCategory({
    this.name,
    this.tests,
  });
  factory TestCaseCategory.fromJson(Map<String, dynamic> json) =>
      _$TestCaseCategoryFromJson(json);
}

/// Provides test case definition.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TestCaseDefinition {
  /// Provides test case definition Id.
  @_s.JsonKey(name: 'id')
  final String id;

  /// Provides test case definition version.
  @_s.JsonKey(name: 'testCaseVersion')
  final String testCaseVersion;

  TestCaseDefinition({
    this.id,
    this.testCaseVersion,
  });
  factory TestCaseDefinition.fromJson(Map<String, dynamic> json) =>
      _$TestCaseDefinitionFromJson(json);
}

/// Provides test case run.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TestCaseRun {
  /// Provides test case run end time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'endTime')
  final DateTime endTime;

  /// Provides test case run failure result.
  @_s.JsonKey(name: 'failure')
  final String failure;

  /// Provides test case run log Url.
  @_s.JsonKey(name: 'logUrl')
  final String logUrl;

  /// Provides test case run start time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'startTime')
  final DateTime startTime;

  /// Provides test case run status.
  @_s.JsonKey(name: 'status')
  final Status status;

  /// Provides test case run definition Id.
  @_s.JsonKey(name: 'testCaseDefinitionId')
  final String testCaseDefinitionId;

  /// Provides test case run definition Name.
  @_s.JsonKey(name: 'testCaseDefinitionName')
  final String testCaseDefinitionName;

  /// Provides test case run Id.
  @_s.JsonKey(name: 'testCaseRunId')
  final String testCaseRunId;

  /// Provides test case run warnings.
  @_s.JsonKey(name: 'warnings')
  final String warnings;

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
  factory TestCaseRun.fromJson(Map<String, dynamic> json) =>
      _$TestCaseRunFromJson(json);
}

/// Show each group result.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TestResult {
  /// Show each group of test results.
  @_s.JsonKey(name: 'groups')
  final List<GroupResult> groups;

  TestResult({
    this.groups,
  });
  factory TestResult.fromJson(Map<String, dynamic> json) =>
      _$TestResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UntagResourceResponse {
  UntagResourceResponse();
  factory UntagResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$UntagResourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateSuiteDefinitionResponse {
  /// Updates a Device Advisor test suite with TimeStamp of when it was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// Updates a Device Advisor test suite with TimeStamp of when it was updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedAt')
  final DateTime lastUpdatedAt;

  /// Updates a Device Advisor test suite with Amazon Resource name.
  @_s.JsonKey(name: 'suiteDefinitionArn')
  final String suiteDefinitionArn;

  /// Updates a Device Advisor test suite with suite UUID.
  @_s.JsonKey(name: 'suiteDefinitionId')
  final String suiteDefinitionId;

  /// Updates a Device Advisor test suite with suite definition name.
  @_s.JsonKey(name: 'suiteDefinitionName')
  final String suiteDefinitionName;

  /// Updates a Device Advisor test suite with suite definition version.
  @_s.JsonKey(name: 'suiteDefinitionVersion')
  final String suiteDefinitionVersion;

  UpdateSuiteDefinitionResponse({
    this.createdAt,
    this.lastUpdatedAt,
    this.suiteDefinitionArn,
    this.suiteDefinitionId,
    this.suiteDefinitionName,
    this.suiteDefinitionVersion,
  });
  factory UpdateSuiteDefinitionResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateSuiteDefinitionResponseFromJson(json);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String type, String message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String type, String message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String type, String message})
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
