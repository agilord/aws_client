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

/// AWS Mainframe Modernization Application Testing provides tools and resources
/// for automated functional equivalence testing for your migration projects.
class MainframeModernizationApplicationTesting {
  final _s.RestJsonProtocol _protocol;
  MainframeModernizationApplicationTesting({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'apptest',
            signingName: 'apptest',
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

  /// Creates a test case.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [name] :
  /// The name of the test case.
  ///
  /// Parameter [steps] :
  /// The steps in the test case.
  ///
  /// Parameter [clientToken] :
  /// The client token of the test case.
  ///
  /// Parameter [description] :
  /// The description of the test case.
  ///
  /// Parameter [tags] :
  /// The specified tags of the test case.
  Future<CreateTestCaseResponse> createTestCase({
    required String name,
    required List<Step> steps,
    String? clientToken,
    String? description,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      'steps': steps,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/testcase',
      exceptionFnMap: _exceptionFns,
    );
    return CreateTestCaseResponse.fromJson(response);
  }

  /// Creates a test configuration.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [name] :
  /// The name of the test configuration.
  ///
  /// Parameter [resources] :
  /// The defined resources of the test configuration.
  ///
  /// Parameter [clientToken] :
  /// The client token of the test configuration.
  ///
  /// Parameter [description] :
  /// The description of the test configuration.
  ///
  /// Parameter [properties] :
  /// The properties of the test configuration.
  ///
  /// Parameter [serviceSettings] :
  /// The service settings of the test configuration.
  ///
  /// Parameter [tags] :
  /// The tags of the test configuration.
  Future<CreateTestConfigurationResponse> createTestConfiguration({
    required String name,
    required List<Resource> resources,
    String? clientToken,
    String? description,
    Map<String, String>? properties,
    ServiceSettings? serviceSettings,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      'resources': resources,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (properties != null) 'properties': properties,
      if (serviceSettings != null) 'serviceSettings': serviceSettings,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/testconfiguration',
      exceptionFnMap: _exceptionFns,
    );
    return CreateTestConfigurationResponse.fromJson(response);
  }

  /// Creates a test suite.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [name] :
  /// The name of the test suite.
  ///
  /// Parameter [testCases] :
  /// The test cases in the test suite.
  ///
  /// Parameter [afterSteps] :
  /// The after steps of the test suite.
  ///
  /// Parameter [beforeSteps] :
  /// The before steps of the test suite.
  ///
  /// Parameter [clientToken] :
  /// The client token of the test suite.
  ///
  /// Parameter [description] :
  /// The description of the test suite.
  ///
  /// Parameter [tags] :
  /// The tags of the test suite.
  Future<CreateTestSuiteResponse> createTestSuite({
    required String name,
    required TestCases testCases,
    List<Step>? afterSteps,
    List<Step>? beforeSteps,
    String? clientToken,
    String? description,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      'testCases': testCases,
      if (afterSteps != null) 'afterSteps': afterSteps,
      if (beforeSteps != null) 'beforeSteps': beforeSteps,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/testsuite',
      exceptionFnMap: _exceptionFns,
    );
    return CreateTestSuiteResponse.fromJson(response);
  }

  /// Deletes a test case.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [testCaseId] :
  /// The test case ID of the test case.
  Future<void> deleteTestCase({
    required String testCaseId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/testcases/${Uri.encodeComponent(testCaseId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a test configuration.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [testConfigurationId] :
  /// The test ID of the test configuration.
  Future<void> deleteTestConfiguration({
    required String testConfigurationId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/testconfigurations/${Uri.encodeComponent(testConfigurationId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a test run.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [testRunId] :
  /// The run ID of the test run.
  Future<void> deleteTestRun({
    required String testRunId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/testruns/${Uri.encodeComponent(testRunId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a test suite.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [testSuiteId] :
  /// The test ID of the test suite.
  Future<void> deleteTestSuite({
    required String testSuiteId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/testsuites/${Uri.encodeComponent(testSuiteId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Gets a test case.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [testCaseId] :
  /// The request test ID of the test case.
  ///
  /// Parameter [testCaseVersion] :
  /// The test case version of the test case.
  Future<GetTestCaseResponse> getTestCase({
    required String testCaseId,
    int? testCaseVersion,
  }) async {
    final $query = <String, List<String>>{
      if (testCaseVersion != null)
        'testCaseVersion': [testCaseVersion.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/testcases/${Uri.encodeComponent(testCaseId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetTestCaseResponse.fromJson(response);
  }

  /// Gets a test configuration.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [testConfigurationId] :
  /// The request test configuration ID.
  ///
  /// Parameter [testConfigurationVersion] :
  /// The test configuration version.
  Future<GetTestConfigurationResponse> getTestConfiguration({
    required String testConfigurationId,
    int? testConfigurationVersion,
  }) async {
    final $query = <String, List<String>>{
      if (testConfigurationVersion != null)
        'testConfigurationVersion': [testConfigurationVersion.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/testconfigurations/${Uri.encodeComponent(testConfigurationId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetTestConfigurationResponse.fromJson(response);
  }

  /// Gets a test run step.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [stepName] :
  /// The step name of the test run step.
  ///
  /// Parameter [testRunId] :
  /// The test run ID of the test run step.
  ///
  /// Parameter [testCaseId] :
  /// The test case ID of a test run step.
  ///
  /// Parameter [testSuiteId] :
  /// The test suite ID of a test run step.
  Future<GetTestRunStepResponse> getTestRunStep({
    required String stepName,
    required String testRunId,
    String? testCaseId,
    String? testSuiteId,
  }) async {
    final $query = <String, List<String>>{
      if (testCaseId != null) 'testCaseId': [testCaseId],
      if (testSuiteId != null) 'testSuiteId': [testSuiteId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/testruns/${Uri.encodeComponent(testRunId)}/steps/${Uri.encodeComponent(stepName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetTestRunStepResponse.fromJson(response);
  }

  /// Gets a test suite.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [testSuiteId] :
  /// The ID of the test suite.
  ///
  /// Parameter [testSuiteVersion] :
  /// The version of the test suite.
  Future<GetTestSuiteResponse> getTestSuite({
    required String testSuiteId,
    int? testSuiteVersion,
  }) async {
    final $query = <String, List<String>>{
      if (testSuiteVersion != null)
        'testSuiteVersion': [testSuiteVersion.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/testsuites/${Uri.encodeComponent(testSuiteId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetTestSuiteResponse.fromJson(response);
  }

  /// Lists tags for a resource.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
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

  /// Lists test cases.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [maxResults] :
  /// The maximum results of the test case.
  ///
  /// Parameter [nextToken] :
  /// The next token of the test cases.
  ///
  /// Parameter [testCaseIds] :
  /// The IDs of the test cases.
  Future<ListTestCasesResponse> listTestCases({
    int? maxResults,
    String? nextToken,
    List<String>? testCaseIds,
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
      if (testCaseIds != null) 'testCaseIds': testCaseIds,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/testcases',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListTestCasesResponse.fromJson(response);
  }

  /// Lists test configurations.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [maxResults] :
  /// The maximum results of the test configuration.
  ///
  /// Parameter [nextToken] :
  /// The next token for the test configurations.
  ///
  /// Parameter [testConfigurationIds] :
  /// The configuration IDs of the test configurations.
  Future<ListTestConfigurationsResponse> listTestConfigurations({
    int? maxResults,
    String? nextToken,
    List<String>? testConfigurationIds,
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
      if (testConfigurationIds != null)
        'testConfigurationIds': testConfigurationIds,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/testconfigurations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListTestConfigurationsResponse.fromJson(response);
  }

  /// Lists test run steps.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [testRunId] :
  /// The test run ID of the test run steps.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of test run steps to return in one page of results.
  ///
  /// Parameter [nextToken] :
  /// The token from a previous step to retrieve the next page of results.
  ///
  /// Parameter [testCaseId] :
  /// The test case ID of the test run steps.
  ///
  /// Parameter [testSuiteId] :
  /// The test suite ID of the test run steps.
  Future<ListTestRunStepsResponse> listTestRunSteps({
    required String testRunId,
    int? maxResults,
    String? nextToken,
    String? testCaseId,
    String? testSuiteId,
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
      if (testCaseId != null) 'testCaseId': [testCaseId],
      if (testSuiteId != null) 'testSuiteId': [testSuiteId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/testruns/${Uri.encodeComponent(testRunId)}/steps',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListTestRunStepsResponse.fromJson(response);
  }

  /// Lists test run test cases.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [testRunId] :
  /// The test run ID of the test cases.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of test run test cases to return in one page of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// The token from a previous request to retrieve the next page of results.
  Future<ListTestRunTestCasesResponse> listTestRunTestCases({
    required String testRunId,
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
      requestUri: '/testruns/${Uri.encodeComponent(testRunId)}/testcases',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListTestRunTestCasesResponse.fromJson(response);
  }

  /// Lists test runs.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of test runs to return in one page of results.
  ///
  /// Parameter [nextToken] :
  /// The token from the previous request to retrieve the next page of test run
  /// results.
  ///
  /// Parameter [testRunIds] :
  /// The test run IDs of the test runs.
  ///
  /// Parameter [testSuiteId] :
  /// The test suite ID of the test runs.
  Future<ListTestRunsResponse> listTestRuns({
    int? maxResults,
    String? nextToken,
    List<String>? testRunIds,
    String? testSuiteId,
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
      if (testRunIds != null) 'testrunIds': testRunIds,
      if (testSuiteId != null) 'testSuiteId': [testSuiteId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/testruns',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListTestRunsResponse.fromJson(response);
  }

  /// Lists test suites.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of test suites to return in one page of results.
  ///
  /// Parameter [nextToken] :
  /// The token from a previous request to retrieve the next page of results.
  ///
  /// Parameter [testSuiteIds] :
  /// The suite ID of the test suites.
  Future<ListTestSuitesResponse> listTestSuites({
    int? maxResults,
    String? nextToken,
    List<String>? testSuiteIds,
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
      if (testSuiteIds != null) 'testSuiteIds': testSuiteIds,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/testsuites',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListTestSuitesResponse.fromJson(response);
  }

  /// Starts a test run.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [testSuiteId] :
  /// The test suite ID of the test run.
  ///
  /// Parameter [clientToken] :
  /// The client token of the test run.
  ///
  /// Parameter [tags] :
  /// The tags of the test run.
  ///
  /// Parameter [testConfigurationId] :
  /// The configuration ID of the test run.
  Future<StartTestRunResponse> startTestRun({
    required String testSuiteId,
    String? clientToken,
    Map<String, String>? tags,
    String? testConfigurationId,
  }) async {
    final $payload = <String, dynamic>{
      'testSuiteId': testSuiteId,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'tags': tags,
      if (testConfigurationId != null)
        'testConfigurationId': testConfigurationId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/testrun',
      exceptionFnMap: _exceptionFns,
    );
    return StartTestRunResponse.fromJson(response);
  }

  /// Specifies tags of a resource.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the tag resource.
  ///
  /// Parameter [tags] :
  /// The tags of the resource.
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

  /// Untags a resource.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [tagKeys] :
  /// The tag keys of the resource.
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

  /// Updates a test case.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [testCaseId] :
  /// The test case ID of the test case.
  ///
  /// Parameter [description] :
  /// The description of the test case.
  ///
  /// Parameter [steps] :
  /// The steps of the test case.
  Future<UpdateTestCaseResponse> updateTestCase({
    required String testCaseId,
    String? description,
    List<Step>? steps,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'description': description,
      if (steps != null) 'steps': steps,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/testcases/${Uri.encodeComponent(testCaseId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateTestCaseResponse.fromJson(response);
  }

  /// Updates a test configuration.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [testConfigurationId] :
  /// The test configuration ID of the test configuration.
  ///
  /// Parameter [description] :
  /// The description of the test configuration.
  ///
  /// Parameter [properties] :
  /// The properties of the test configuration.
  ///
  /// Parameter [resources] :
  /// The resources of the test configuration.
  ///
  /// Parameter [serviceSettings] :
  /// The service settings of the test configuration.
  Future<UpdateTestConfigurationResponse> updateTestConfiguration({
    required String testConfigurationId,
    String? description,
    Map<String, String>? properties,
    List<Resource>? resources,
    ServiceSettings? serviceSettings,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'description': description,
      if (properties != null) 'properties': properties,
      if (resources != null) 'resources': resources,
      if (serviceSettings != null) 'serviceSettings': serviceSettings,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/testconfigurations/${Uri.encodeComponent(testConfigurationId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateTestConfigurationResponse.fromJson(response);
  }

  /// Updates a test suite.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [testSuiteId] :
  /// The test suite ID of the test suite.
  ///
  /// Parameter [afterSteps] :
  /// The after steps of the test suite.
  ///
  /// Parameter [beforeSteps] :
  /// The before steps for the test suite.
  ///
  /// Parameter [description] :
  /// The description of the test suite.
  ///
  /// Parameter [testCases] :
  /// The test cases in the test suite.
  Future<UpdateTestSuiteResponse> updateTestSuite({
    required String testSuiteId,
    List<Step>? afterSteps,
    List<Step>? beforeSteps,
    String? description,
    TestCases? testCases,
  }) async {
    final $payload = <String, dynamic>{
      if (afterSteps != null) 'afterSteps': afterSteps,
      if (beforeSteps != null) 'beforeSteps': beforeSteps,
      if (description != null) 'description': description,
      if (testCases != null) 'testCases': testCases,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/testsuites/${Uri.encodeComponent(testSuiteId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateTestSuiteResponse.fromJson(response);
  }
}

/// Defines a batch.
class Batch {
  /// The job name of the batch.
  final String batchJobName;

  /// The batch job parameters of the batch.
  final Map<String, String>? batchJobParameters;

  /// The export data set names of the batch.
  final List<String>? exportDataSetNames;

  Batch({
    required this.batchJobName,
    this.batchJobParameters,
    this.exportDataSetNames,
  });

  factory Batch.fromJson(Map<String, dynamic> json) {
    return Batch(
      batchJobName: json['batchJobName'] as String,
      batchJobParameters: (json['batchJobParameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      exportDataSetNames: (json['exportDataSetNames'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final batchJobName = this.batchJobName;
    final batchJobParameters = this.batchJobParameters;
    final exportDataSetNames = this.exportDataSetNames;
    return {
      'batchJobName': batchJobName,
      if (batchJobParameters != null) 'batchJobParameters': batchJobParameters,
      if (exportDataSetNames != null) 'exportDataSetNames': exportDataSetNames,
    };
  }
}

/// Defines a batch step input.
class BatchStepInput {
  /// The batch job name of the batch step input.
  final String batchJobName;

  /// The resource of the batch step input.
  final MainframeResourceSummary resource;

  /// The batch job parameters of the batch step input.
  final Map<String, String>? batchJobParameters;

  /// The export data set names of the batch step input.
  final List<String>? exportDataSetNames;

  /// The properties of the batch step input.
  final MainframeActionProperties? properties;

  BatchStepInput({
    required this.batchJobName,
    required this.resource,
    this.batchJobParameters,
    this.exportDataSetNames,
    this.properties,
  });

  factory BatchStepInput.fromJson(Map<String, dynamic> json) {
    return BatchStepInput(
      batchJobName: json['batchJobName'] as String,
      resource: MainframeResourceSummary.fromJson(
          json['resource'] as Map<String, dynamic>),
      batchJobParameters: (json['batchJobParameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      exportDataSetNames: (json['exportDataSetNames'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      properties: json['properties'] != null
          ? MainframeActionProperties.fromJson(
              json['properties'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final batchJobName = this.batchJobName;
    final resource = this.resource;
    final batchJobParameters = this.batchJobParameters;
    final exportDataSetNames = this.exportDataSetNames;
    final properties = this.properties;
    return {
      'batchJobName': batchJobName,
      'resource': resource,
      if (batchJobParameters != null) 'batchJobParameters': batchJobParameters,
      if (exportDataSetNames != null) 'exportDataSetNames': exportDataSetNames,
      if (properties != null) 'properties': properties,
    };
  }
}

/// Defines a batch step output.
class BatchStepOutput {
  /// The data set details of the batch step output.
  final List<DataSet>? dataSetDetails;

  /// The data set export location of the batch step output.
  final String? dataSetExportLocation;

  /// The Database Migration Service (DMS) output location of the batch step
  /// output.
  final String? dmsOutputLocation;

  BatchStepOutput({
    this.dataSetDetails,
    this.dataSetExportLocation,
    this.dmsOutputLocation,
  });

  factory BatchStepOutput.fromJson(Map<String, dynamic> json) {
    return BatchStepOutput(
      dataSetDetails: (json['dataSetDetails'] as List?)
          ?.nonNulls
          .map((e) => DataSet.fromJson(e as Map<String, dynamic>))
          .toList(),
      dataSetExportLocation: json['dataSetExportLocation'] as String?,
      dmsOutputLocation: json['dmsOutputLocation'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataSetDetails = this.dataSetDetails;
    final dataSetExportLocation = this.dataSetExportLocation;
    final dmsOutputLocation = this.dmsOutputLocation;
    return {
      if (dataSetDetails != null) 'dataSetDetails': dataSetDetails,
      if (dataSetExportLocation != null)
        'dataSetExportLocation': dataSetExportLocation,
      if (dmsOutputLocation != null) 'dmsOutputLocation': dmsOutputLocation,
    };
  }
}

/// Summarizes a batch job.
class BatchSummary {
  /// The step input of the batch summary.
  final BatchStepInput stepInput;

  /// The step output of the batch summary.
  final BatchStepOutput? stepOutput;

  BatchSummary({
    required this.stepInput,
    this.stepOutput,
  });

  factory BatchSummary.fromJson(Map<String, dynamic> json) {
    return BatchSummary(
      stepInput:
          BatchStepInput.fromJson(json['stepInput'] as Map<String, dynamic>),
      stepOutput: json['stepOutput'] != null
          ? BatchStepOutput.fromJson(json['stepOutput'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final stepInput = this.stepInput;
    final stepOutput = this.stepOutput;
    return {
      'stepInput': stepInput,
      if (stepOutput != null) 'stepOutput': stepOutput,
    };
  }
}

enum CaptureTool {
  precisely('Precisely'),
  awsDms('AWS DMS'),
  ;

  final String value;

  const CaptureTool(this.value);

  static CaptureTool fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum CaptureTool'));
}

/// Specifies the CloudFormation template and its parameters.
class CloudFormation {
  /// The template location of the CloudFormation template.
  final String templateLocation;

  /// The CloudFormation properties in the CloudFormation template.
  final Map<String, String>? parameters;

  CloudFormation({
    required this.templateLocation,
    this.parameters,
  });

  factory CloudFormation.fromJson(Map<String, dynamic> json) {
    return CloudFormation(
      templateLocation: json['templateLocation'] as String,
      parameters: (json['parameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final templateLocation = this.templateLocation;
    final parameters = this.parameters;
    return {
      'templateLocation': templateLocation,
      if (parameters != null) 'parameters': parameters,
    };
  }
}

/// Specifies the CloudFormation action.
class CloudFormationAction {
  /// The resource of the CloudFormation action.
  final String resource;

  /// The action type of the CloudFormation action.
  final CloudFormationActionType? actionType;

  CloudFormationAction({
    required this.resource,
    this.actionType,
  });

  factory CloudFormationAction.fromJson(Map<String, dynamic> json) {
    return CloudFormationAction(
      resource: json['resource'] as String,
      actionType: (json['actionType'] as String?)
          ?.let(CloudFormationActionType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final resource = this.resource;
    final actionType = this.actionType;
    return {
      'resource': resource,
      if (actionType != null) 'actionType': actionType.value,
    };
  }
}

enum CloudFormationActionType {
  create('Create'),
  delete('Delete'),
  ;

  final String value;

  const CloudFormationActionType(this.value);

  static CloudFormationActionType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum CloudFormationActionType'));
}

/// Specifies the CloudFormation step summary.
class CloudFormationStepSummary {
  /// Creates the CloudFormation summary of the step.
  final CreateCloudFormationSummary? createCloudformation;

  /// Deletes the CloudFormation summary of the CloudFormation step summary.
  final DeleteCloudFormationSummary? deleteCloudformation;

  CloudFormationStepSummary({
    this.createCloudformation,
    this.deleteCloudformation,
  });

  factory CloudFormationStepSummary.fromJson(Map<String, dynamic> json) {
    return CloudFormationStepSummary(
      createCloudformation: json['createCloudformation'] != null
          ? CreateCloudFormationSummary.fromJson(
              json['createCloudformation'] as Map<String, dynamic>)
          : null,
      deleteCloudformation: json['deleteCloudformation'] != null
          ? DeleteCloudFormationSummary.fromJson(
              json['deleteCloudformation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final createCloudformation = this.createCloudformation;
    final deleteCloudformation = this.deleteCloudformation;
    return {
      if (createCloudformation != null)
        'createCloudformation': createCloudformation,
      if (deleteCloudformation != null)
        'deleteCloudformation': deleteCloudformation,
    };
  }
}

/// Compares the action.
class CompareAction {
  /// The input of the compare action.
  final Input input;

  /// The output of the compare action.
  final Output? output;

  CompareAction({
    required this.input,
    this.output,
  });

  factory CompareAction.fromJson(Map<String, dynamic> json) {
    return CompareAction(
      input: Input.fromJson(json['input'] as Map<String, dynamic>),
      output: json['output'] != null
          ? Output.fromJson(json['output'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final input = this.input;
    final output = this.output;
    return {
      'input': input,
      if (output != null) 'output': output,
    };
  }
}

/// Specifies the compare action summary.
class CompareActionSummary {
  /// The type of the compare action summary.
  final File type;

  CompareActionSummary({
    required this.type,
  });

  factory CompareActionSummary.fromJson(Map<String, dynamic> json) {
    return CompareActionSummary(
      type: File.fromJson(json['type'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    return {
      'type': type,
    };
  }
}

/// Specifies the compare data sets step input.
class CompareDataSetsStepInput {
  /// The source data sets of the compare data sets step input location.
  final List<DataSet> sourceDataSets;

  /// The source location of the compare data sets step input location.
  final String sourceLocation;

  /// The target data sets of the compare data sets step input location.
  final List<DataSet> targetDataSets;

  /// The target location of the compare data sets step input location.
  final String targetLocation;

  CompareDataSetsStepInput({
    required this.sourceDataSets,
    required this.sourceLocation,
    required this.targetDataSets,
    required this.targetLocation,
  });

  factory CompareDataSetsStepInput.fromJson(Map<String, dynamic> json) {
    return CompareDataSetsStepInput(
      sourceDataSets: (json['sourceDataSets'] as List)
          .nonNulls
          .map((e) => DataSet.fromJson(e as Map<String, dynamic>))
          .toList(),
      sourceLocation: json['sourceLocation'] as String,
      targetDataSets: (json['targetDataSets'] as List)
          .nonNulls
          .map((e) => DataSet.fromJson(e as Map<String, dynamic>))
          .toList(),
      targetLocation: json['targetLocation'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final sourceDataSets = this.sourceDataSets;
    final sourceLocation = this.sourceLocation;
    final targetDataSets = this.targetDataSets;
    final targetLocation = this.targetLocation;
    return {
      'sourceDataSets': sourceDataSets,
      'sourceLocation': sourceLocation,
      'targetDataSets': targetDataSets,
      'targetLocation': targetLocation,
    };
  }
}

/// Specifies the compare data sets step output.
class CompareDataSetsStepOutput {
  /// The comparison output location of the compare data sets step output.
  final String comparisonOutputLocation;

  /// The comparison status of the compare data sets step output.
  final ComparisonStatusEnum comparisonStatus;

  CompareDataSetsStepOutput({
    required this.comparisonOutputLocation,
    required this.comparisonStatus,
  });

  factory CompareDataSetsStepOutput.fromJson(Map<String, dynamic> json) {
    return CompareDataSetsStepOutput(
      comparisonOutputLocation: json['comparisonOutputLocation'] as String,
      comparisonStatus:
          ComparisonStatusEnum.fromString((json['comparisonStatus'] as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final comparisonOutputLocation = this.comparisonOutputLocation;
    final comparisonStatus = this.comparisonStatus;
    return {
      'comparisonOutputLocation': comparisonOutputLocation,
      'comparisonStatus': comparisonStatus.value,
    };
  }
}

/// Compares data sets summary.
class CompareDataSetsSummary {
  /// The step input of the compare data sets summary.
  final CompareDataSetsStepInput stepInput;

  /// The step output of the compare data sets summary.
  final CompareDataSetsStepOutput? stepOutput;

  CompareDataSetsSummary({
    required this.stepInput,
    this.stepOutput,
  });

  factory CompareDataSetsSummary.fromJson(Map<String, dynamic> json) {
    return CompareDataSetsSummary(
      stepInput: CompareDataSetsStepInput.fromJson(
          json['stepInput'] as Map<String, dynamic>),
      stepOutput: json['stepOutput'] != null
          ? CompareDataSetsStepOutput.fromJson(
              json['stepOutput'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final stepInput = this.stepInput;
    final stepOutput = this.stepOutput;
    return {
      'stepInput': stepInput,
      if (stepOutput != null) 'stepOutput': stepOutput,
    };
  }
}

/// Compares the database Change Data Capture (CDC) step input.
class CompareDatabaseCDCStepInput {
  /// The source location of the compare database CDC step input.
  final String sourceLocation;

  /// The source metadata of the compare database CDC step input.
  final SourceDatabaseMetadata sourceMetadata;

  /// The target location of the compare database CDC step input.
  final String targetLocation;

  /// The target metadata location of the compare database CDC step input.
  final TargetDatabaseMetadata targetMetadata;

  /// The output location of the compare database CDC step input.
  final String? outputLocation;

  CompareDatabaseCDCStepInput({
    required this.sourceLocation,
    required this.sourceMetadata,
    required this.targetLocation,
    required this.targetMetadata,
    this.outputLocation,
  });

  factory CompareDatabaseCDCStepInput.fromJson(Map<String, dynamic> json) {
    return CompareDatabaseCDCStepInput(
      sourceLocation: json['sourceLocation'] as String,
      sourceMetadata: SourceDatabaseMetadata.fromJson(
          json['sourceMetadata'] as Map<String, dynamic>),
      targetLocation: json['targetLocation'] as String,
      targetMetadata: TargetDatabaseMetadata.fromJson(
          json['targetMetadata'] as Map<String, dynamic>),
      outputLocation: json['outputLocation'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final sourceLocation = this.sourceLocation;
    final sourceMetadata = this.sourceMetadata;
    final targetLocation = this.targetLocation;
    final targetMetadata = this.targetMetadata;
    final outputLocation = this.outputLocation;
    return {
      'sourceLocation': sourceLocation,
      'sourceMetadata': sourceMetadata,
      'targetLocation': targetLocation,
      'targetMetadata': targetMetadata,
      if (outputLocation != null) 'outputLocation': outputLocation,
    };
  }
}

/// Compares the database CDC step output.
class CompareDatabaseCDCStepOutput {
  /// The comparison output of the compare database CDC step output.
  final String comparisonOutputLocation;

  /// The comparison status of the compare database CDC step output.
  final ComparisonStatusEnum comparisonStatus;

  CompareDatabaseCDCStepOutput({
    required this.comparisonOutputLocation,
    required this.comparisonStatus,
  });

  factory CompareDatabaseCDCStepOutput.fromJson(Map<String, dynamic> json) {
    return CompareDatabaseCDCStepOutput(
      comparisonOutputLocation: json['comparisonOutputLocation'] as String,
      comparisonStatus:
          ComparisonStatusEnum.fromString((json['comparisonStatus'] as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final comparisonOutputLocation = this.comparisonOutputLocation;
    final comparisonStatus = this.comparisonStatus;
    return {
      'comparisonOutputLocation': comparisonOutputLocation,
      'comparisonStatus': comparisonStatus.value,
    };
  }
}

/// Compares the database CDC summary.
class CompareDatabaseCDCSummary {
  /// The step input of the compare database CDC summary.
  final CompareDatabaseCDCStepInput stepInput;

  /// The step output of the compare database CDC summary.
  final CompareDatabaseCDCStepOutput? stepOutput;

  CompareDatabaseCDCSummary({
    required this.stepInput,
    this.stepOutput,
  });

  factory CompareDatabaseCDCSummary.fromJson(Map<String, dynamic> json) {
    return CompareDatabaseCDCSummary(
      stepInput: CompareDatabaseCDCStepInput.fromJson(
          json['stepInput'] as Map<String, dynamic>),
      stepOutput: json['stepOutput'] != null
          ? CompareDatabaseCDCStepOutput.fromJson(
              json['stepOutput'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final stepInput = this.stepInput;
    final stepOutput = this.stepOutput;
    return {
      'stepInput': stepInput,
      if (stepOutput != null) 'stepOutput': stepOutput,
    };
  }
}

/// Compares the file type.
class CompareFileType {
  /// The database CDC of the compare file type.
  final CompareDatabaseCDCSummary? databaseCDC;

  /// The data sets in the compare file type.
  final CompareDataSetsSummary? datasets;

  CompareFileType({
    this.databaseCDC,
    this.datasets,
  });

  factory CompareFileType.fromJson(Map<String, dynamic> json) {
    return CompareFileType(
      databaseCDC: json['databaseCDC'] != null
          ? CompareDatabaseCDCSummary.fromJson(
              json['databaseCDC'] as Map<String, dynamic>)
          : null,
      datasets: json['datasets'] != null
          ? CompareDataSetsSummary.fromJson(
              json['datasets'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final databaseCDC = this.databaseCDC;
    final datasets = this.datasets;
    return {
      if (databaseCDC != null) 'databaseCDC': databaseCDC,
      if (datasets != null) 'datasets': datasets,
    };
  }
}

enum ComparisonStatusEnum {
  different('Different'),
  equivalent('Equivalent'),
  equal('Equal'),
  ;

  final String value;

  const ComparisonStatusEnum(this.value);

  static ComparisonStatusEnum fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum ComparisonStatusEnum'));
}

/// Creates the CloudFormation step input.
class CreateCloudFormationStepInput {
  /// The template location of the CloudFormation step input.
  final String templateLocation;

  /// The CloudFormation properties of the CloudFormation step input.
  final Map<String, String>? parameters;

  CreateCloudFormationStepInput({
    required this.templateLocation,
    this.parameters,
  });

  factory CreateCloudFormationStepInput.fromJson(Map<String, dynamic> json) {
    return CreateCloudFormationStepInput(
      templateLocation: json['templateLocation'] as String,
      parameters: (json['parameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final templateLocation = this.templateLocation;
    final parameters = this.parameters;
    return {
      'templateLocation': templateLocation,
      if (parameters != null) 'parameters': parameters,
    };
  }
}

/// Creates a CloudFormation step output.
class CreateCloudFormationStepOutput {
  /// The stack ID of the CloudFormation step output.
  final String stackId;

  /// The exports of the CloudFormation step output.
  final Map<String, String>? exports;

  CreateCloudFormationStepOutput({
    required this.stackId,
    this.exports,
  });

  factory CreateCloudFormationStepOutput.fromJson(Map<String, dynamic> json) {
    return CreateCloudFormationStepOutput(
      stackId: json['stackId'] as String,
      exports: (json['exports'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final stackId = this.stackId;
    final exports = this.exports;
    return {
      'stackId': stackId,
      if (exports != null) 'exports': exports,
    };
  }
}

/// Creates a CloudFormation summary.
class CreateCloudFormationSummary {
  /// The step input of the CloudFormation summary.
  final CreateCloudFormationStepInput stepInput;

  /// The step output of the CloudFormation summary.
  final CreateCloudFormationStepOutput? stepOutput;

  CreateCloudFormationSummary({
    required this.stepInput,
    this.stepOutput,
  });

  factory CreateCloudFormationSummary.fromJson(Map<String, dynamic> json) {
    return CreateCloudFormationSummary(
      stepInput: CreateCloudFormationStepInput.fromJson(
          json['stepInput'] as Map<String, dynamic>),
      stepOutput: json['stepOutput'] != null
          ? CreateCloudFormationStepOutput.fromJson(
              json['stepOutput'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final stepInput = this.stepInput;
    final stepOutput = this.stepOutput;
    return {
      'stepInput': stepInput,
      if (stepOutput != null) 'stepOutput': stepOutput,
    };
  }
}

class CreateTestCaseResponse {
  /// The test case ID of the test case.
  final String testCaseId;

  /// The test case version of the test case.
  final int testCaseVersion;

  CreateTestCaseResponse({
    required this.testCaseId,
    required this.testCaseVersion,
  });

  factory CreateTestCaseResponse.fromJson(Map<String, dynamic> json) {
    return CreateTestCaseResponse(
      testCaseId: json['testCaseId'] as String,
      testCaseVersion: json['testCaseVersion'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final testCaseId = this.testCaseId;
    final testCaseVersion = this.testCaseVersion;
    return {
      'testCaseId': testCaseId,
      'testCaseVersion': testCaseVersion,
    };
  }
}

class CreateTestConfigurationResponse {
  /// The test configuration ID.
  final String testConfigurationId;

  /// The test configuration version.
  final int testConfigurationVersion;

  CreateTestConfigurationResponse({
    required this.testConfigurationId,
    required this.testConfigurationVersion,
  });

  factory CreateTestConfigurationResponse.fromJson(Map<String, dynamic> json) {
    return CreateTestConfigurationResponse(
      testConfigurationId: json['testConfigurationId'] as String,
      testConfigurationVersion: json['testConfigurationVersion'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final testConfigurationId = this.testConfigurationId;
    final testConfigurationVersion = this.testConfigurationVersion;
    return {
      'testConfigurationId': testConfigurationId,
      'testConfigurationVersion': testConfigurationVersion,
    };
  }
}

class CreateTestSuiteResponse {
  /// The suite ID of the test suite.
  final String testSuiteId;

  /// The suite version of the test suite.
  final int testSuiteVersion;

  CreateTestSuiteResponse({
    required this.testSuiteId,
    required this.testSuiteVersion,
  });

  factory CreateTestSuiteResponse.fromJson(Map<String, dynamic> json) {
    return CreateTestSuiteResponse(
      testSuiteId: json['testSuiteId'] as String,
      testSuiteVersion: json['testSuiteVersion'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final testSuiteId = this.testSuiteId;
    final testSuiteVersion = this.testSuiteVersion;
    return {
      'testSuiteId': testSuiteId,
      'testSuiteVersion': testSuiteVersion,
    };
  }
}

/// Defines a data set.
class DataSet {
  /// The CCSID of the data set.
  final String ccsid;

  /// The format of the data set.
  final Format format;

  /// The length of the data set.
  final int length;

  /// The name of the data set.
  final String name;

  /// The type of the data set.
  final DataSetType type;

  DataSet({
    required this.ccsid,
    required this.format,
    required this.length,
    required this.name,
    required this.type,
  });

  factory DataSet.fromJson(Map<String, dynamic> json) {
    return DataSet(
      ccsid: json['ccsid'] as String,
      format: Format.fromString((json['format'] as String)),
      length: json['length'] as int,
      name: json['name'] as String,
      type: DataSetType.fromString((json['type'] as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final ccsid = this.ccsid;
    final format = this.format;
    final length = this.length;
    final name = this.name;
    final type = this.type;
    return {
      'ccsid': ccsid,
      'format': format.value,
      'length': length,
      'name': name,
      'type': type.value,
    };
  }
}

enum DataSetType {
  ps('PS'),
  ;

  final String value;

  const DataSetType(this.value);

  static DataSetType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum DataSetType'));
}

/// Defines the Change Data Capture (CDC) of the database.
class DatabaseCDC {
  /// The source metadata of the database CDC.
  final SourceDatabaseMetadata sourceMetadata;

  /// The target metadata of the database CDC.
  final TargetDatabaseMetadata targetMetadata;

  DatabaseCDC({
    required this.sourceMetadata,
    required this.targetMetadata,
  });

  factory DatabaseCDC.fromJson(Map<String, dynamic> json) {
    return DatabaseCDC(
      sourceMetadata: SourceDatabaseMetadata.fromJson(
          json['sourceMetadata'] as Map<String, dynamic>),
      targetMetadata: TargetDatabaseMetadata.fromJson(
          json['targetMetadata'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final sourceMetadata = this.sourceMetadata;
    final targetMetadata = this.targetMetadata;
    return {
      'sourceMetadata': sourceMetadata,
      'targetMetadata': targetMetadata,
    };
  }
}

/// Deletes the CloudFormation step input.
class DeleteCloudFormationStepInput {
  /// The stack ID of the deleted CloudFormation step input.
  final String stackId;

  DeleteCloudFormationStepInput({
    required this.stackId,
  });

  factory DeleteCloudFormationStepInput.fromJson(Map<String, dynamic> json) {
    return DeleteCloudFormationStepInput(
      stackId: json['stackId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final stackId = this.stackId;
    return {
      'stackId': stackId,
    };
  }
}

/// Deletes the CloudFormation summary step output.
class DeleteCloudFormationStepOutput {
  DeleteCloudFormationStepOutput();

  factory DeleteCloudFormationStepOutput.fromJson(Map<String, dynamic> _) {
    return DeleteCloudFormationStepOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Deletes the CloudFormation summary.
class DeleteCloudFormationSummary {
  /// The step input of the deleted CloudFormation summary.
  final DeleteCloudFormationStepInput stepInput;

  /// The step output of the deleted CloudFormation summary.
  final DeleteCloudFormationStepOutput? stepOutput;

  DeleteCloudFormationSummary({
    required this.stepInput,
    this.stepOutput,
  });

  factory DeleteCloudFormationSummary.fromJson(Map<String, dynamic> json) {
    return DeleteCloudFormationSummary(
      stepInput: DeleteCloudFormationStepInput.fromJson(
          json['stepInput'] as Map<String, dynamic>),
      stepOutput: json['stepOutput'] != null
          ? DeleteCloudFormationStepOutput.fromJson(
              json['stepOutput'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final stepInput = this.stepInput;
    final stepOutput = this.stepOutput;
    return {
      'stepInput': stepInput,
      if (stepOutput != null) 'stepOutput': stepOutput,
    };
  }
}

class DeleteTestCaseResponse {
  DeleteTestCaseResponse();

  factory DeleteTestCaseResponse.fromJson(Map<String, dynamic> _) {
    return DeleteTestCaseResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteTestConfigurationResponse {
  DeleteTestConfigurationResponse();

  factory DeleteTestConfigurationResponse.fromJson(Map<String, dynamic> _) {
    return DeleteTestConfigurationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteTestRunResponse {
  DeleteTestRunResponse();

  factory DeleteTestRunResponse.fromJson(Map<String, dynamic> _) {
    return DeleteTestRunResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteTestSuiteResponse {
  DeleteTestSuiteResponse();

  factory DeleteTestSuiteResponse.fromJson(Map<String, dynamic> _) {
    return DeleteTestSuiteResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Defines a file.
class File {
  /// The file type of the file.
  final CompareFileType? fileType;

  File({
    this.fileType,
  });

  factory File.fromJson(Map<String, dynamic> json) {
    return File(
      fileType: json['fileType'] != null
          ? CompareFileType.fromJson(json['fileType'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final fileType = this.fileType;
    return {
      if (fileType != null) 'fileType': fileType,
    };
  }
}

/// Specifies a file metadata.
class FileMetadata {
  /// The data sets of the file metadata.
  final List<DataSet>? dataSets;

  /// The database CDC of the file metadata.
  final DatabaseCDC? databaseCDC;

  FileMetadata({
    this.dataSets,
    this.databaseCDC,
  });

  factory FileMetadata.fromJson(Map<String, dynamic> json) {
    return FileMetadata(
      dataSets: (json['dataSets'] as List?)
          ?.nonNulls
          .map((e) => DataSet.fromJson(e as Map<String, dynamic>))
          .toList(),
      databaseCDC: json['databaseCDC'] != null
          ? DatabaseCDC.fromJson(json['databaseCDC'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final dataSets = this.dataSets;
    final databaseCDC = this.databaseCDC;
    return {
      if (dataSets != null) 'dataSets': dataSets,
      if (databaseCDC != null) 'databaseCDC': databaseCDC,
    };
  }
}

enum Format {
  fixed('FIXED'),
  variable('VARIABLE'),
  lineSequential('LINE_SEQUENTIAL'),
  ;

  final String value;

  const Format(this.value);

  static Format fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception('$value is not known in enum Format'));
}

class GetTestCaseResponse {
  /// The creation time of the test case.
  final DateTime creationTime;

  /// The last update time of the test case.
  final DateTime lastUpdateTime;

  /// The latest version of the test case.
  final TestCaseLatestVersion latestVersion;

  /// The name of the test case.
  final String name;

  /// The status of the test case.
  final TestCaseLifecycle status;

  /// The steps of the test case.
  final List<Step> steps;

  /// The Amazon Resource Name (ARN) of the test case.
  final String testCaseArn;

  /// The response test ID of the test case.
  final String testCaseId;

  /// The case version of the test case.
  final int testCaseVersion;

  /// The description of the test case.
  final String? description;

  /// The status reason of the test case.
  final String? statusReason;

  /// The tags of the test case.
  final Map<String, String>? tags;

  GetTestCaseResponse({
    required this.creationTime,
    required this.lastUpdateTime,
    required this.latestVersion,
    required this.name,
    required this.status,
    required this.steps,
    required this.testCaseArn,
    required this.testCaseId,
    required this.testCaseVersion,
    this.description,
    this.statusReason,
    this.tags,
  });

  factory GetTestCaseResponse.fromJson(Map<String, dynamic> json) {
    return GetTestCaseResponse(
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      lastUpdateTime:
          nonNullableTimeStampFromJson(json['lastUpdateTime'] as Object),
      latestVersion: TestCaseLatestVersion.fromJson(
          json['latestVersion'] as Map<String, dynamic>),
      name: json['name'] as String,
      status: TestCaseLifecycle.fromString((json['status'] as String)),
      steps: (json['steps'] as List)
          .nonNulls
          .map((e) => Step.fromJson(e as Map<String, dynamic>))
          .toList(),
      testCaseArn: json['testCaseArn'] as String,
      testCaseId: json['testCaseId'] as String,
      testCaseVersion: json['testCaseVersion'] as int,
      description: json['description'] as String?,
      statusReason: json['statusReason'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final lastUpdateTime = this.lastUpdateTime;
    final latestVersion = this.latestVersion;
    final name = this.name;
    final status = this.status;
    final steps = this.steps;
    final testCaseArn = this.testCaseArn;
    final testCaseId = this.testCaseId;
    final testCaseVersion = this.testCaseVersion;
    final description = this.description;
    final statusReason = this.statusReason;
    final tags = this.tags;
    return {
      'creationTime': unixTimestampToJson(creationTime),
      'lastUpdateTime': unixTimestampToJson(lastUpdateTime),
      'latestVersion': latestVersion,
      'name': name,
      'status': status.value,
      'steps': steps,
      'testCaseArn': testCaseArn,
      'testCaseId': testCaseId,
      'testCaseVersion': testCaseVersion,
      if (description != null) 'description': description,
      if (statusReason != null) 'statusReason': statusReason,
      if (tags != null) 'tags': tags,
    };
  }
}

class GetTestConfigurationResponse {
  /// The creation time of the test configuration.
  final DateTime creationTime;

  /// The last update time of the test configuration.
  final DateTime lastUpdateTime;

  /// The latest version of the test configuration.
  final TestConfigurationLatestVersion latestVersion;

  /// The test configuration name
  final String name;

  /// The properties of the test configuration.
  final Map<String, String> properties;

  /// The resources of the test configuration.
  final List<Resource> resources;

  /// The status of the test configuration.
  final TestConfigurationLifecycle status;

  /// The test configuration Amazon Resource Name (ARN).
  final String testConfigurationArn;

  /// The response test configuration ID.
  final String testConfigurationId;

  /// The test configuration version.
  final int testConfigurationVersion;

  /// The description of the test configuration.
  final String? description;

  /// The service settings of the test configuration.
  final ServiceSettings? serviceSettings;

  /// The status reason of the test configuration.
  final String? statusReason;

  /// The tags of the test configuration.
  final Map<String, String>? tags;

  GetTestConfigurationResponse({
    required this.creationTime,
    required this.lastUpdateTime,
    required this.latestVersion,
    required this.name,
    required this.properties,
    required this.resources,
    required this.status,
    required this.testConfigurationArn,
    required this.testConfigurationId,
    required this.testConfigurationVersion,
    this.description,
    this.serviceSettings,
    this.statusReason,
    this.tags,
  });

  factory GetTestConfigurationResponse.fromJson(Map<String, dynamic> json) {
    return GetTestConfigurationResponse(
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      lastUpdateTime:
          nonNullableTimeStampFromJson(json['lastUpdateTime'] as Object),
      latestVersion: TestConfigurationLatestVersion.fromJson(
          json['latestVersion'] as Map<String, dynamic>),
      name: json['name'] as String,
      properties: (json['properties'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(k, e as String)),
      resources: (json['resources'] as List)
          .nonNulls
          .map((e) => Resource.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: TestConfigurationLifecycle.fromString((json['status'] as String)),
      testConfigurationArn: json['testConfigurationArn'] as String,
      testConfigurationId: json['testConfigurationId'] as String,
      testConfigurationVersion: json['testConfigurationVersion'] as int,
      description: json['description'] as String?,
      serviceSettings: json['serviceSettings'] != null
          ? ServiceSettings.fromJson(
              json['serviceSettings'] as Map<String, dynamic>)
          : null,
      statusReason: json['statusReason'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final lastUpdateTime = this.lastUpdateTime;
    final latestVersion = this.latestVersion;
    final name = this.name;
    final properties = this.properties;
    final resources = this.resources;
    final status = this.status;
    final testConfigurationArn = this.testConfigurationArn;
    final testConfigurationId = this.testConfigurationId;
    final testConfigurationVersion = this.testConfigurationVersion;
    final description = this.description;
    final serviceSettings = this.serviceSettings;
    final statusReason = this.statusReason;
    final tags = this.tags;
    return {
      'creationTime': unixTimestampToJson(creationTime),
      'lastUpdateTime': unixTimestampToJson(lastUpdateTime),
      'latestVersion': latestVersion,
      'name': name,
      'properties': properties,
      'resources': resources,
      'status': status.value,
      'testConfigurationArn': testConfigurationArn,
      'testConfigurationId': testConfigurationId,
      'testConfigurationVersion': testConfigurationVersion,
      if (description != null) 'description': description,
      if (serviceSettings != null) 'serviceSettings': serviceSettings,
      if (statusReason != null) 'statusReason': statusReason,
      if (tags != null) 'tags': tags,
    };
  }
}

class GetTestRunStepResponse {
  /// The run start time of the test run step.
  final DateTime runStartTime;

  /// The status of the test run step.
  final StepRunStatus status;

  /// The step name of the test run step.
  final String stepName;

  /// The test run ID of the test run step.
  final String testRunId;

  /// The after steps of the test run step.
  final bool? afterStep;

  /// The before steps of the test run step.
  final bool? beforeStep;

  /// The run end time of the test run step.
  final DateTime? runEndTime;

  /// The status reason of the test run step.
  final String? statusReason;

  /// The step run summary of the test run step.
  final StepRunSummary? stepRunSummary;

  /// The test case ID of the test run step.
  final String? testCaseId;

  /// The test case version of the test run step.
  final int? testCaseVersion;

  /// The test suite ID of the test run step.
  final String? testSuiteId;

  /// The test suite version of the test run step.
  final int? testSuiteVersion;

  GetTestRunStepResponse({
    required this.runStartTime,
    required this.status,
    required this.stepName,
    required this.testRunId,
    this.afterStep,
    this.beforeStep,
    this.runEndTime,
    this.statusReason,
    this.stepRunSummary,
    this.testCaseId,
    this.testCaseVersion,
    this.testSuiteId,
    this.testSuiteVersion,
  });

  factory GetTestRunStepResponse.fromJson(Map<String, dynamic> json) {
    return GetTestRunStepResponse(
      runStartTime:
          nonNullableTimeStampFromJson(json['runStartTime'] as Object),
      status: StepRunStatus.fromString((json['status'] as String)),
      stepName: json['stepName'] as String,
      testRunId: json['testRunId'] as String,
      afterStep: json['afterStep'] as bool?,
      beforeStep: json['beforeStep'] as bool?,
      runEndTime: timeStampFromJson(json['runEndTime']),
      statusReason: json['statusReason'] as String?,
      stepRunSummary: json['stepRunSummary'] != null
          ? StepRunSummary.fromJson(
              json['stepRunSummary'] as Map<String, dynamic>)
          : null,
      testCaseId: json['testCaseId'] as String?,
      testCaseVersion: json['testCaseVersion'] as int?,
      testSuiteId: json['testSuiteId'] as String?,
      testSuiteVersion: json['testSuiteVersion'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final runStartTime = this.runStartTime;
    final status = this.status;
    final stepName = this.stepName;
    final testRunId = this.testRunId;
    final afterStep = this.afterStep;
    final beforeStep = this.beforeStep;
    final runEndTime = this.runEndTime;
    final statusReason = this.statusReason;
    final stepRunSummary = this.stepRunSummary;
    final testCaseId = this.testCaseId;
    final testCaseVersion = this.testCaseVersion;
    final testSuiteId = this.testSuiteId;
    final testSuiteVersion = this.testSuiteVersion;
    return {
      'runStartTime': unixTimestampToJson(runStartTime),
      'status': status.value,
      'stepName': stepName,
      'testRunId': testRunId,
      if (afterStep != null) 'afterStep': afterStep,
      if (beforeStep != null) 'beforeStep': beforeStep,
      if (runEndTime != null) 'runEndTime': unixTimestampToJson(runEndTime),
      if (statusReason != null) 'statusReason': statusReason,
      if (stepRunSummary != null) 'stepRunSummary': stepRunSummary,
      if (testCaseId != null) 'testCaseId': testCaseId,
      if (testCaseVersion != null) 'testCaseVersion': testCaseVersion,
      if (testSuiteId != null) 'testSuiteId': testSuiteId,
      if (testSuiteVersion != null) 'testSuiteVersion': testSuiteVersion,
    };
  }
}

class GetTestSuiteResponse {
  /// The after steps of the test suite.
  final List<Step> afterSteps;

  /// The before steps of the test suite.
  final List<Step> beforeSteps;

  /// The creation time of the test suite.
  final DateTime creationTime;

  /// The last update time of the test suite.
  final DateTime lastUpdateTime;

  /// The latest version of the test suite.
  final TestSuiteLatestVersion latestVersion;

  /// The name of the test suite.
  final String name;

  /// The test cases of the test suite.
  final TestCases testCases;

  /// The test suite Amazon Resource Name (ARN).
  final String testSuiteArn;

  /// The response ID of the test suite.
  final String testSuiteId;

  /// The version of the test suite.
  final int testSuiteVersion;

  /// The description of the test suite.
  final String? description;

  /// The status of the test suite.
  final TestSuiteLifecycle? status;

  /// The status reason of the test suite.
  final String? statusReason;

  /// The tags of the test suite.
  final Map<String, String>? tags;

  GetTestSuiteResponse({
    required this.afterSteps,
    required this.beforeSteps,
    required this.creationTime,
    required this.lastUpdateTime,
    required this.latestVersion,
    required this.name,
    required this.testCases,
    required this.testSuiteArn,
    required this.testSuiteId,
    required this.testSuiteVersion,
    this.description,
    this.status,
    this.statusReason,
    this.tags,
  });

  factory GetTestSuiteResponse.fromJson(Map<String, dynamic> json) {
    return GetTestSuiteResponse(
      afterSteps: (json['afterSteps'] as List)
          .nonNulls
          .map((e) => Step.fromJson(e as Map<String, dynamic>))
          .toList(),
      beforeSteps: (json['beforeSteps'] as List)
          .nonNulls
          .map((e) => Step.fromJson(e as Map<String, dynamic>))
          .toList(),
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      lastUpdateTime:
          nonNullableTimeStampFromJson(json['lastUpdateTime'] as Object),
      latestVersion: TestSuiteLatestVersion.fromJson(
          json['latestVersion'] as Map<String, dynamic>),
      name: json['name'] as String,
      testCases: TestCases.fromJson(json['testCases'] as Map<String, dynamic>),
      testSuiteArn: json['testSuiteArn'] as String,
      testSuiteId: json['testSuiteId'] as String,
      testSuiteVersion: json['testSuiteVersion'] as int,
      description: json['description'] as String?,
      status: (json['status'] as String?)?.let(TestSuiteLifecycle.fromString),
      statusReason: json['statusReason'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final afterSteps = this.afterSteps;
    final beforeSteps = this.beforeSteps;
    final creationTime = this.creationTime;
    final lastUpdateTime = this.lastUpdateTime;
    final latestVersion = this.latestVersion;
    final name = this.name;
    final testCases = this.testCases;
    final testSuiteArn = this.testSuiteArn;
    final testSuiteId = this.testSuiteId;
    final testSuiteVersion = this.testSuiteVersion;
    final description = this.description;
    final status = this.status;
    final statusReason = this.statusReason;
    final tags = this.tags;
    return {
      'afterSteps': afterSteps,
      'beforeSteps': beforeSteps,
      'creationTime': unixTimestampToJson(creationTime),
      'lastUpdateTime': unixTimestampToJson(lastUpdateTime),
      'latestVersion': latestVersion,
      'name': name,
      'testCases': testCases,
      'testSuiteArn': testSuiteArn,
      'testSuiteId': testSuiteId,
      'testSuiteVersion': testSuiteVersion,
      if (description != null) 'description': description,
      if (status != null) 'status': status.value,
      if (statusReason != null) 'statusReason': statusReason,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Specifies the input.
class Input {
  /// The file in the input.
  final InputFile? file;

  Input({
    this.file,
  });

  factory Input.fromJson(Map<String, dynamic> json) {
    return Input(
      file: json['file'] != null
          ? InputFile.fromJson(json['file'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final file = this.file;
    return {
      if (file != null) 'file': file,
    };
  }
}

/// Specifies the input file.
class InputFile {
  /// The file metadata of the input file.
  final FileMetadata fileMetadata;

  /// The source location of the input file.
  final String sourceLocation;

  /// The target location of the input file.
  final String targetLocation;

  InputFile({
    required this.fileMetadata,
    required this.sourceLocation,
    required this.targetLocation,
  });

  factory InputFile.fromJson(Map<String, dynamic> json) {
    return InputFile(
      fileMetadata:
          FileMetadata.fromJson(json['fileMetadata'] as Map<String, dynamic>),
      sourceLocation: json['sourceLocation'] as String,
      targetLocation: json['targetLocation'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final fileMetadata = this.fileMetadata;
    final sourceLocation = this.sourceLocation;
    final targetLocation = this.targetLocation;
    return {
      'fileMetadata': fileMetadata,
      'sourceLocation': sourceLocation,
      'targetLocation': targetLocation,
    };
  }
}

class ListTagsForResourceResponse {
  /// The tags of the resource.
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    required this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['tags'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      'tags': tags,
    };
  }
}

class ListTestCasesResponse {
  /// The test cases in an application.
  final List<TestCaseSummary> testCases;

  /// The next token in test cases.
  final String? nextToken;

  ListTestCasesResponse({
    required this.testCases,
    this.nextToken,
  });

  factory ListTestCasesResponse.fromJson(Map<String, dynamic> json) {
    return ListTestCasesResponse(
      testCases: (json['testCases'] as List)
          .nonNulls
          .map((e) => TestCaseSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final testCases = this.testCases;
    final nextToken = this.nextToken;
    return {
      'testCases': testCases,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListTestConfigurationsResponse {
  /// The test configurations.
  final List<TestConfigurationSummary> testConfigurations;

  /// The next token in the test configurations.
  final String? nextToken;

  ListTestConfigurationsResponse({
    required this.testConfigurations,
    this.nextToken,
  });

  factory ListTestConfigurationsResponse.fromJson(Map<String, dynamic> json) {
    return ListTestConfigurationsResponse(
      testConfigurations: (json['testConfigurations'] as List)
          .nonNulls
          .map((e) =>
              TestConfigurationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final testConfigurations = this.testConfigurations;
    final nextToken = this.nextToken;
    return {
      'testConfigurations': testConfigurations,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListTestRunStepsResponse {
  /// The test run steps of the response query.
  final List<TestRunStepSummary> testRunSteps;

  /// The token from a previous request to retrieve the next page of results.
  final String? nextToken;

  ListTestRunStepsResponse({
    required this.testRunSteps,
    this.nextToken,
  });

  factory ListTestRunStepsResponse.fromJson(Map<String, dynamic> json) {
    return ListTestRunStepsResponse(
      testRunSteps: (json['testRunSteps'] as List)
          .nonNulls
          .map((e) => TestRunStepSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final testRunSteps = this.testRunSteps;
    final nextToken = this.nextToken;
    return {
      'testRunSteps': testRunSteps,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListTestRunTestCasesResponse {
  /// The test run of the test cases.
  final List<TestCaseRunSummary> testRunTestCases;

  /// The token from a previous request to retrieve the next page of results.
  final String? nextToken;

  ListTestRunTestCasesResponse({
    required this.testRunTestCases,
    this.nextToken,
  });

  factory ListTestRunTestCasesResponse.fromJson(Map<String, dynamic> json) {
    return ListTestRunTestCasesResponse(
      testRunTestCases: (json['testRunTestCases'] as List)
          .nonNulls
          .map((e) => TestCaseRunSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final testRunTestCases = this.testRunTestCases;
    final nextToken = this.nextToken;
    return {
      'testRunTestCases': testRunTestCases,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListTestRunsResponse {
  /// The test runs of the response query.
  final List<TestRunSummary> testRuns;

  /// The token from the previous request to retrieve the next page of results.
  final String? nextToken;

  ListTestRunsResponse({
    required this.testRuns,
    this.nextToken,
  });

  factory ListTestRunsResponse.fromJson(Map<String, dynamic> json) {
    return ListTestRunsResponse(
      testRuns: (json['testRuns'] as List)
          .nonNulls
          .map((e) => TestRunSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final testRuns = this.testRuns;
    final nextToken = this.nextToken;
    return {
      'testRuns': testRuns,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListTestSuitesResponse {
  /// The test suites returned with the response query.
  final List<TestSuiteSummary> testSuites;

  /// The token from a previous request to retrieve the next page of test suites
  /// results.
  final String? nextToken;

  ListTestSuitesResponse({
    required this.testSuites,
    this.nextToken,
  });

  factory ListTestSuitesResponse.fromJson(Map<String, dynamic> json) {
    return ListTestSuitesResponse(
      testSuites: (json['testSuites'] as List)
          .nonNulls
          .map((e) => TestSuiteSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final testSuites = this.testSuites;
    final nextToken = this.nextToken;
    return {
      'testSuites': testSuites,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Specifies the AWS Mainframe Modernization managed action properties.
class M2ManagedActionProperties {
  /// Force stops the AWS Mainframe Modernization managed action properties.
  final bool? forceStop;

  /// The import data set location of the AWS Mainframe Modernization managed
  /// action properties.
  final String? importDataSetLocation;

  M2ManagedActionProperties({
    this.forceStop,
    this.importDataSetLocation,
  });

  factory M2ManagedActionProperties.fromJson(Map<String, dynamic> json) {
    return M2ManagedActionProperties(
      forceStop: json['forceStop'] as bool?,
      importDataSetLocation: json['importDataSetLocation'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final forceStop = this.forceStop;
    final importDataSetLocation = this.importDataSetLocation;
    return {
      if (forceStop != null) 'forceStop': forceStop,
      if (importDataSetLocation != null)
        'importDataSetLocation': importDataSetLocation,
    };
  }
}

enum M2ManagedActionType {
  configure('Configure'),
  deconfigure('Deconfigure'),
  ;

  final String value;

  const M2ManagedActionType(this.value);

  static M2ManagedActionType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum M2ManagedActionType'));
}

/// Specifies the AWS Mainframe Modernization managed application.
class M2ManagedApplication {
  /// The application ID of the AWS Mainframe Modernization managed application.
  final String applicationId;

  /// The runtime of the AWS Mainframe Modernization managed application.
  final M2ManagedRuntime runtime;

  /// The listener port of the AWS Mainframe Modernization managed application.
  final String? listenerPort;

  /// The VPC endpoint service name of the AWS Mainframe Modernization managed
  /// application.
  final String? vpcEndpointServiceName;

  M2ManagedApplication({
    required this.applicationId,
    required this.runtime,
    this.listenerPort,
    this.vpcEndpointServiceName,
  });

  factory M2ManagedApplication.fromJson(Map<String, dynamic> json) {
    return M2ManagedApplication(
      applicationId: json['applicationId'] as String,
      runtime: M2ManagedRuntime.fromString((json['runtime'] as String)),
      listenerPort: json['listenerPort'] as String?,
      vpcEndpointServiceName: json['vpcEndpointServiceName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final runtime = this.runtime;
    final listenerPort = this.listenerPort;
    final vpcEndpointServiceName = this.vpcEndpointServiceName;
    return {
      'applicationId': applicationId,
      'runtime': runtime.value,
      if (listenerPort != null) 'listenerPort': listenerPort,
      if (vpcEndpointServiceName != null)
        'vpcEndpointServiceName': vpcEndpointServiceName,
    };
  }
}

/// Specifies the AWS Mainframe Modernization managed application action.
class M2ManagedApplicationAction {
  /// The action type of the AWS Mainframe Modernization managed application
  /// action.
  final M2ManagedActionType actionType;

  /// The resource of the AWS Mainframe Modernization managed application action.
  final String resource;

  /// The properties of the AWS Mainframe Modernization managed application
  /// action.
  final M2ManagedActionProperties? properties;

  M2ManagedApplicationAction({
    required this.actionType,
    required this.resource,
    this.properties,
  });

  factory M2ManagedApplicationAction.fromJson(Map<String, dynamic> json) {
    return M2ManagedApplicationAction(
      actionType:
          M2ManagedActionType.fromString((json['actionType'] as String)),
      resource: json['resource'] as String,
      properties: json['properties'] != null
          ? M2ManagedActionProperties.fromJson(
              json['properties'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final actionType = this.actionType;
    final resource = this.resource;
    final properties = this.properties;
    return {
      'actionType': actionType.value,
      'resource': resource,
      if (properties != null) 'properties': properties,
    };
  }
}

/// Specifies the AWS Mainframe Modernization managed application step input.
class M2ManagedApplicationStepInput {
  /// The action type of the AWS Mainframe Modernization managed application step
  /// input.
  final M2ManagedActionType actionType;

  /// The application ID of the AWS Mainframe Modernization managed application
  /// step input.
  final String applicationId;

  /// The runtime of the AWS Mainframe Modernization managed application step
  /// input.
  final String runtime;

  /// The listener port of the AWS Mainframe Modernization managed application
  /// step input.
  final int? listenerPort;

  /// The properties of the AWS Mainframe Modernization managed application step
  /// input.
  final M2ManagedActionProperties? properties;

  /// The VPC endpoint service name of the AWS Mainframe Modernization managed
  /// application step input.
  final String? vpcEndpointServiceName;

  M2ManagedApplicationStepInput({
    required this.actionType,
    required this.applicationId,
    required this.runtime,
    this.listenerPort,
    this.properties,
    this.vpcEndpointServiceName,
  });

  factory M2ManagedApplicationStepInput.fromJson(Map<String, dynamic> json) {
    return M2ManagedApplicationStepInput(
      actionType:
          M2ManagedActionType.fromString((json['actionType'] as String)),
      applicationId: json['applicationId'] as String,
      runtime: json['runtime'] as String,
      listenerPort: json['listenerPort'] as int?,
      properties: json['properties'] != null
          ? M2ManagedActionProperties.fromJson(
              json['properties'] as Map<String, dynamic>)
          : null,
      vpcEndpointServiceName: json['vpcEndpointServiceName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final actionType = this.actionType;
    final applicationId = this.applicationId;
    final runtime = this.runtime;
    final listenerPort = this.listenerPort;
    final properties = this.properties;
    final vpcEndpointServiceName = this.vpcEndpointServiceName;
    return {
      'actionType': actionType.value,
      'applicationId': applicationId,
      'runtime': runtime,
      if (listenerPort != null) 'listenerPort': listenerPort,
      if (properties != null) 'properties': properties,
      if (vpcEndpointServiceName != null)
        'vpcEndpointServiceName': vpcEndpointServiceName,
    };
  }
}

/// Specifies the AWS Mainframe Modernization managed application step output.
class M2ManagedApplicationStepOutput {
  /// The import data set summary of the AWS Mainframe Modernization managed
  /// application step output.
  final Map<String, String>? importDataSetSummary;

  M2ManagedApplicationStepOutput({
    this.importDataSetSummary,
  });

  factory M2ManagedApplicationStepOutput.fromJson(Map<String, dynamic> json) {
    return M2ManagedApplicationStepOutput(
      importDataSetSummary:
          (json['importDataSetSummary'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final importDataSetSummary = this.importDataSetSummary;
    return {
      if (importDataSetSummary != null)
        'importDataSetSummary': importDataSetSummary,
    };
  }
}

/// Specifies the AWS Mainframe Modernization managed application step summary.
class M2ManagedApplicationStepSummary {
  /// The step input of the AWS Mainframe Modernization managed application step
  /// summary.
  final M2ManagedApplicationStepInput stepInput;

  /// The step output of the AWS Mainframe Modernization managed application step
  /// summary.
  final M2ManagedApplicationStepOutput? stepOutput;

  M2ManagedApplicationStepSummary({
    required this.stepInput,
    this.stepOutput,
  });

  factory M2ManagedApplicationStepSummary.fromJson(Map<String, dynamic> json) {
    return M2ManagedApplicationStepSummary(
      stepInput: M2ManagedApplicationStepInput.fromJson(
          json['stepInput'] as Map<String, dynamic>),
      stepOutput: json['stepOutput'] != null
          ? M2ManagedApplicationStepOutput.fromJson(
              json['stepOutput'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final stepInput = this.stepInput;
    final stepOutput = this.stepOutput;
    return {
      'stepInput': stepInput,
      if (stepOutput != null) 'stepOutput': stepOutput,
    };
  }
}

/// Specifies the AWS Mainframe Modernization managed application summary.
class M2ManagedApplicationSummary {
  /// The application ID of the AWS Mainframe Modernization managed application
  /// summary.
  final String applicationId;

  /// The runtime of the AWS Mainframe Modernization managed application summary.
  final M2ManagedRuntime runtime;

  /// The listener port of the AWS Mainframe Modernization managed application
  /// summary.
  final int? listenerPort;

  M2ManagedApplicationSummary({
    required this.applicationId,
    required this.runtime,
    this.listenerPort,
  });

  factory M2ManagedApplicationSummary.fromJson(Map<String, dynamic> json) {
    return M2ManagedApplicationSummary(
      applicationId: json['applicationId'] as String,
      runtime: M2ManagedRuntime.fromString((json['runtime'] as String)),
      listenerPort: json['listenerPort'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final runtime = this.runtime;
    final listenerPort = this.listenerPort;
    return {
      'applicationId': applicationId,
      'runtime': runtime.value,
      if (listenerPort != null) 'listenerPort': listenerPort,
    };
  }
}

enum M2ManagedRuntime {
  microFocus('MicroFocus'),
  ;

  final String value;

  const M2ManagedRuntime(this.value);

  static M2ManagedRuntime fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum M2ManagedRuntime'));
}

enum M2NonManagedActionType {
  configure('Configure'),
  deconfigure('Deconfigure'),
  ;

  final String value;

  const M2NonManagedActionType(this.value);

  static M2NonManagedActionType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum M2NonManagedActionType'));
}

/// Specifies the AWS Mainframe Modernization non-managed application.
class M2NonManagedApplication {
  /// The listener port of the AWS Mainframe Modernization non-managed
  /// application.
  final String listenerPort;

  /// The runtime of the AWS Mainframe Modernization non-managed application.
  final M2NonManagedRuntime runtime;

  /// The VPC endpoint service name of the AWS Mainframe Modernization non-managed
  /// application.
  final String vpcEndpointServiceName;

  /// The web application name of the AWS Mainframe Modernization non-managed
  /// application.
  final String? webAppName;

  M2NonManagedApplication({
    required this.listenerPort,
    required this.runtime,
    required this.vpcEndpointServiceName,
    this.webAppName,
  });

  factory M2NonManagedApplication.fromJson(Map<String, dynamic> json) {
    return M2NonManagedApplication(
      listenerPort: json['listenerPort'] as String,
      runtime: M2NonManagedRuntime.fromString((json['runtime'] as String)),
      vpcEndpointServiceName: json['vpcEndpointServiceName'] as String,
      webAppName: json['webAppName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final listenerPort = this.listenerPort;
    final runtime = this.runtime;
    final vpcEndpointServiceName = this.vpcEndpointServiceName;
    final webAppName = this.webAppName;
    return {
      'listenerPort': listenerPort,
      'runtime': runtime.value,
      'vpcEndpointServiceName': vpcEndpointServiceName,
      if (webAppName != null) 'webAppName': webAppName,
    };
  }
}

/// Specifies the AWS Mainframe Modernization non-managed application action.
class M2NonManagedApplicationAction {
  /// The action type of the AWS Mainframe Modernization non-managed application
  /// action.
  final M2NonManagedActionType actionType;

  /// The resource of the AWS Mainframe Modernization non-managed application
  /// action.
  final String resource;

  M2NonManagedApplicationAction({
    required this.actionType,
    required this.resource,
  });

  factory M2NonManagedApplicationAction.fromJson(Map<String, dynamic> json) {
    return M2NonManagedApplicationAction(
      actionType:
          M2NonManagedActionType.fromString((json['actionType'] as String)),
      resource: json['resource'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final actionType = this.actionType;
    final resource = this.resource;
    return {
      'actionType': actionType.value,
      'resource': resource,
    };
  }
}

/// Specifies the AWS Mainframe Modernization non-managed application step
/// input.
class M2NonManagedApplicationStepInput {
  /// The action type of the AWS Mainframe Modernization non-managed application
  /// step input.
  final M2NonManagedActionType actionType;

  /// The listener port of the AWS Mainframe Modernization non-managed application
  /// step input.
  final int listenerPort;

  /// The runtime of the AWS Mainframe Modernization non-managed application step
  /// input.
  final M2NonManagedRuntime runtime;

  /// The VPC endpoint service name of the AWS Mainframe Modernization non-managed
  /// application step input.
  final String vpcEndpointServiceName;

  /// The web app name of the AWS Mainframe Modernization non-managed application
  /// step input.
  final String? webAppName;

  M2NonManagedApplicationStepInput({
    required this.actionType,
    required this.listenerPort,
    required this.runtime,
    required this.vpcEndpointServiceName,
    this.webAppName,
  });

  factory M2NonManagedApplicationStepInput.fromJson(Map<String, dynamic> json) {
    return M2NonManagedApplicationStepInput(
      actionType:
          M2NonManagedActionType.fromString((json['actionType'] as String)),
      listenerPort: json['listenerPort'] as int,
      runtime: M2NonManagedRuntime.fromString((json['runtime'] as String)),
      vpcEndpointServiceName: json['vpcEndpointServiceName'] as String,
      webAppName: json['webAppName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final actionType = this.actionType;
    final listenerPort = this.listenerPort;
    final runtime = this.runtime;
    final vpcEndpointServiceName = this.vpcEndpointServiceName;
    final webAppName = this.webAppName;
    return {
      'actionType': actionType.value,
      'listenerPort': listenerPort,
      'runtime': runtime.value,
      'vpcEndpointServiceName': vpcEndpointServiceName,
      if (webAppName != null) 'webAppName': webAppName,
    };
  }
}

/// Specifies the AWS Mainframe Modernization non-managed application step
/// output.
class M2NonManagedApplicationStepOutput {
  M2NonManagedApplicationStepOutput();

  factory M2NonManagedApplicationStepOutput.fromJson(Map<String, dynamic> _) {
    return M2NonManagedApplicationStepOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Specifies the AWS Mainframe Modernization non-managed application step
/// summary.
class M2NonManagedApplicationStepSummary {
  /// The step input of the AWS Mainframe Modernization non-managed application
  /// step summary.
  final M2NonManagedApplicationStepInput stepInput;

  /// The step output of the AWS Mainframe Modernization non-managed application
  /// step summary.
  final M2NonManagedApplicationStepOutput? stepOutput;

  M2NonManagedApplicationStepSummary({
    required this.stepInput,
    this.stepOutput,
  });

  factory M2NonManagedApplicationStepSummary.fromJson(
      Map<String, dynamic> json) {
    return M2NonManagedApplicationStepSummary(
      stepInput: M2NonManagedApplicationStepInput.fromJson(
          json['stepInput'] as Map<String, dynamic>),
      stepOutput: json['stepOutput'] != null
          ? M2NonManagedApplicationStepOutput.fromJson(
              json['stepOutput'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final stepInput = this.stepInput;
    final stepOutput = this.stepOutput;
    return {
      'stepInput': stepInput,
      if (stepOutput != null) 'stepOutput': stepOutput,
    };
  }
}

/// Specifies the AWS Mainframe Modernization non-managed application summary.
class M2NonManagedApplicationSummary {
  /// The listener port of the AWS Mainframe Modernization non-managed application
  /// summary.
  final int listenerPort;

  /// The runtime of the AWS Mainframe Modernization non-managed application
  /// summary.
  final M2NonManagedRuntime runtime;

  /// The VPC endpoint service name of the AWS Mainframe Modernization non-managed
  /// application summary.
  final String vpcEndpointServiceName;

  /// The web application name of the AWS Mainframe Modernization non-managed
  /// application summary.
  final String? webAppName;

  M2NonManagedApplicationSummary({
    required this.listenerPort,
    required this.runtime,
    required this.vpcEndpointServiceName,
    this.webAppName,
  });

  factory M2NonManagedApplicationSummary.fromJson(Map<String, dynamic> json) {
    return M2NonManagedApplicationSummary(
      listenerPort: json['listenerPort'] as int,
      runtime: M2NonManagedRuntime.fromString((json['runtime'] as String)),
      vpcEndpointServiceName: json['vpcEndpointServiceName'] as String,
      webAppName: json['webAppName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final listenerPort = this.listenerPort;
    final runtime = this.runtime;
    final vpcEndpointServiceName = this.vpcEndpointServiceName;
    final webAppName = this.webAppName;
    return {
      'listenerPort': listenerPort,
      'runtime': runtime.value,
      'vpcEndpointServiceName': vpcEndpointServiceName,
      if (webAppName != null) 'webAppName': webAppName,
    };
  }
}

enum M2NonManagedRuntime {
  bluAge('BluAge'),
  ;

  final String value;

  const M2NonManagedRuntime(this.value);

  static M2NonManagedRuntime fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum M2NonManagedRuntime'));
}

/// Specifies the mainframe action.
class MainframeAction {
  /// The action type of the mainframe action.
  final MainframeActionType actionType;

  /// The resource of the mainframe action.
  final String resource;

  /// The properties of the mainframe action.
  final MainframeActionProperties? properties;

  MainframeAction({
    required this.actionType,
    required this.resource,
    this.properties,
  });

  factory MainframeAction.fromJson(Map<String, dynamic> json) {
    return MainframeAction(
      actionType: MainframeActionType.fromJson(
          json['actionType'] as Map<String, dynamic>),
      resource: json['resource'] as String,
      properties: json['properties'] != null
          ? MainframeActionProperties.fromJson(
              json['properties'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final actionType = this.actionType;
    final resource = this.resource;
    final properties = this.properties;
    return {
      'actionType': actionType,
      'resource': resource,
      if (properties != null) 'properties': properties,
    };
  }
}

/// Specifies the mainframe action properties.
class MainframeActionProperties {
  /// The DMS task ARN of the mainframe action properties.
  final String? dmsTaskArn;

  MainframeActionProperties({
    this.dmsTaskArn,
  });

  factory MainframeActionProperties.fromJson(Map<String, dynamic> json) {
    return MainframeActionProperties(
      dmsTaskArn: json['dmsTaskArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dmsTaskArn = this.dmsTaskArn;
    return {
      if (dmsTaskArn != null) 'dmsTaskArn': dmsTaskArn,
    };
  }
}

/// Specifies the mainframe action summary.
class MainframeActionSummary {
  /// The batch of the mainframe action summary.
  final BatchSummary? batch;

  /// The tn3270 port of the mainframe action summary.
  final TN3270Summary? tn3270;

  MainframeActionSummary({
    this.batch,
    this.tn3270,
  });

  factory MainframeActionSummary.fromJson(Map<String, dynamic> json) {
    return MainframeActionSummary(
      batch: json['batch'] != null
          ? BatchSummary.fromJson(json['batch'] as Map<String, dynamic>)
          : null,
      tn3270: json['tn3270'] != null
          ? TN3270Summary.fromJson(json['tn3270'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final batch = this.batch;
    final tn3270 = this.tn3270;
    return {
      if (batch != null) 'batch': batch,
      if (tn3270 != null) 'tn3270': tn3270,
    };
  }
}

/// Specifies the mainframe action type.
class MainframeActionType {
  /// The batch of the mainframe action type.
  final Batch? batch;

  /// The tn3270 port of the mainframe action type.
  final TN3270? tn3270;

  MainframeActionType({
    this.batch,
    this.tn3270,
  });

  factory MainframeActionType.fromJson(Map<String, dynamic> json) {
    return MainframeActionType(
      batch: json['batch'] != null
          ? Batch.fromJson(json['batch'] as Map<String, dynamic>)
          : null,
      tn3270: json['tn3270'] != null
          ? TN3270.fromJson(json['tn3270'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final batch = this.batch;
    final tn3270 = this.tn3270;
    return {
      if (batch != null) 'batch': batch,
      if (tn3270 != null) 'tn3270': tn3270,
    };
  }
}

/// Specifies the mainframe resource summary.
class MainframeResourceSummary {
  /// The AWS Mainframe Modernization managed application in the mainframe
  /// resource summary.
  final M2ManagedApplicationSummary? m2ManagedApplication;

  /// The AWS Mainframe Modernization non-managed application in the mainframe
  /// resource summary.
  final M2NonManagedApplicationSummary? m2NonManagedApplication;

  MainframeResourceSummary({
    this.m2ManagedApplication,
    this.m2NonManagedApplication,
  });

  factory MainframeResourceSummary.fromJson(Map<String, dynamic> json) {
    return MainframeResourceSummary(
      m2ManagedApplication: json['m2ManagedApplication'] != null
          ? M2ManagedApplicationSummary.fromJson(
              json['m2ManagedApplication'] as Map<String, dynamic>)
          : null,
      m2NonManagedApplication: json['m2NonManagedApplication'] != null
          ? M2NonManagedApplicationSummary.fromJson(
              json['m2NonManagedApplication'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final m2ManagedApplication = this.m2ManagedApplication;
    final m2NonManagedApplication = this.m2NonManagedApplication;
    return {
      if (m2ManagedApplication != null)
        'm2ManagedApplication': m2ManagedApplication,
      if (m2NonManagedApplication != null)
        'm2NonManagedApplication': m2NonManagedApplication,
    };
  }
}

/// Specifies an output.
class Output {
  /// The file of the output.
  final OutputFile? file;

  Output({
    this.file,
  });

  factory Output.fromJson(Map<String, dynamic> json) {
    return Output(
      file: json['file'] != null
          ? OutputFile.fromJson(json['file'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final file = this.file;
    return {
      if (file != null) 'file': file,
    };
  }
}

/// Specifies an output file.
class OutputFile {
  /// The file location of the output file.
  final String? fileLocation;

  OutputFile({
    this.fileLocation,
  });

  factory OutputFile.fromJson(Map<String, dynamic> json) {
    return OutputFile(
      fileLocation: json['fileLocation'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fileLocation = this.fileLocation;
    return {
      if (fileLocation != null) 'fileLocation': fileLocation,
    };
  }
}

/// Specifies a resource.
class Resource {
  /// The name of the resource.
  final String name;

  /// The type of the resource.
  final ResourceType type;

  Resource({
    required this.name,
    required this.type,
  });

  factory Resource.fromJson(Map<String, dynamic> json) {
    return Resource(
      name: json['name'] as String,
      type: ResourceType.fromJson(json['type'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final type = this.type;
    return {
      'name': name,
      'type': type,
    };
  }
}

/// Specifies a resource action.
class ResourceAction {
  /// The CloudFormation action of the resource action.
  final CloudFormationAction? cloudFormationAction;

  /// The AWS Mainframe Modernization managed application action of the resource
  /// action.
  final M2ManagedApplicationAction? m2ManagedApplicationAction;

  /// The AWS Mainframe Modernization non-managed application action of the
  /// resource action.
  final M2NonManagedApplicationAction? m2NonManagedApplicationAction;

  ResourceAction({
    this.cloudFormationAction,
    this.m2ManagedApplicationAction,
    this.m2NonManagedApplicationAction,
  });

  factory ResourceAction.fromJson(Map<String, dynamic> json) {
    return ResourceAction(
      cloudFormationAction: json['cloudFormationAction'] != null
          ? CloudFormationAction.fromJson(
              json['cloudFormationAction'] as Map<String, dynamic>)
          : null,
      m2ManagedApplicationAction: json['m2ManagedApplicationAction'] != null
          ? M2ManagedApplicationAction.fromJson(
              json['m2ManagedApplicationAction'] as Map<String, dynamic>)
          : null,
      m2NonManagedApplicationAction:
          json['m2NonManagedApplicationAction'] != null
              ? M2NonManagedApplicationAction.fromJson(
                  json['m2NonManagedApplicationAction'] as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final cloudFormationAction = this.cloudFormationAction;
    final m2ManagedApplicationAction = this.m2ManagedApplicationAction;
    final m2NonManagedApplicationAction = this.m2NonManagedApplicationAction;
    return {
      if (cloudFormationAction != null)
        'cloudFormationAction': cloudFormationAction,
      if (m2ManagedApplicationAction != null)
        'm2ManagedApplicationAction': m2ManagedApplicationAction,
      if (m2NonManagedApplicationAction != null)
        'm2NonManagedApplicationAction': m2NonManagedApplicationAction,
    };
  }
}

/// Specifies the resource action summary.
class ResourceActionSummary {
  /// The CloudFormation template of the resource action summary.
  final CloudFormationStepSummary? cloudFormation;

  /// The AWS Mainframe Modernization managed application of the resource action
  /// summary.
  final M2ManagedApplicationStepSummary? m2ManagedApplication;

  /// The AWS Mainframe Modernization non-managed application of the resource
  /// action summary.
  final M2NonManagedApplicationStepSummary? m2NonManagedApplication;

  ResourceActionSummary({
    this.cloudFormation,
    this.m2ManagedApplication,
    this.m2NonManagedApplication,
  });

  factory ResourceActionSummary.fromJson(Map<String, dynamic> json) {
    return ResourceActionSummary(
      cloudFormation: json['cloudFormation'] != null
          ? CloudFormationStepSummary.fromJson(
              json['cloudFormation'] as Map<String, dynamic>)
          : null,
      m2ManagedApplication: json['m2ManagedApplication'] != null
          ? M2ManagedApplicationStepSummary.fromJson(
              json['m2ManagedApplication'] as Map<String, dynamic>)
          : null,
      m2NonManagedApplication: json['m2NonManagedApplication'] != null
          ? M2NonManagedApplicationStepSummary.fromJson(
              json['m2NonManagedApplication'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final cloudFormation = this.cloudFormation;
    final m2ManagedApplication = this.m2ManagedApplication;
    final m2NonManagedApplication = this.m2NonManagedApplication;
    return {
      if (cloudFormation != null) 'cloudFormation': cloudFormation,
      if (m2ManagedApplication != null)
        'm2ManagedApplication': m2ManagedApplication,
      if (m2NonManagedApplication != null)
        'm2NonManagedApplication': m2NonManagedApplication,
    };
  }
}

/// Specifies the resource type.
class ResourceType {
  /// The CloudFormation template of the resource type.
  final CloudFormation? cloudFormation;

  /// The AWS Mainframe Modernization managed application of the resource type.
  final M2ManagedApplication? m2ManagedApplication;

  /// The AWS Mainframe Modernization non-managed application of the resource
  /// type.
  final M2NonManagedApplication? m2NonManagedApplication;

  ResourceType({
    this.cloudFormation,
    this.m2ManagedApplication,
    this.m2NonManagedApplication,
  });

  factory ResourceType.fromJson(Map<String, dynamic> json) {
    return ResourceType(
      cloudFormation: json['cloudFormation'] != null
          ? CloudFormation.fromJson(
              json['cloudFormation'] as Map<String, dynamic>)
          : null,
      m2ManagedApplication: json['m2ManagedApplication'] != null
          ? M2ManagedApplication.fromJson(
              json['m2ManagedApplication'] as Map<String, dynamic>)
          : null,
      m2NonManagedApplication: json['m2NonManagedApplication'] != null
          ? M2NonManagedApplication.fromJson(
              json['m2NonManagedApplication'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final cloudFormation = this.cloudFormation;
    final m2ManagedApplication = this.m2ManagedApplication;
    final m2NonManagedApplication = this.m2NonManagedApplication;
    return {
      if (cloudFormation != null) 'cloudFormation': cloudFormation,
      if (m2ManagedApplication != null)
        'm2ManagedApplication': m2ManagedApplication,
      if (m2NonManagedApplication != null)
        'm2NonManagedApplication': m2NonManagedApplication,
    };
  }
}

/// Specifies the script.
class Script {
  /// The script location of the scripts.
  final String scriptLocation;

  /// The type of the scripts.
  final ScriptType type;

  Script({
    required this.scriptLocation,
    required this.type,
  });

  factory Script.fromJson(Map<String, dynamic> json) {
    return Script(
      scriptLocation: json['scriptLocation'] as String,
      type: ScriptType.fromString((json['type'] as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final scriptLocation = this.scriptLocation;
    final type = this.type;
    return {
      'scriptLocation': scriptLocation,
      'type': type.value,
    };
  }
}

/// Specifies the scripts summary.
class ScriptSummary {
  /// The script location of the script summary.
  final String scriptLocation;

  /// The type of the script summary.
  final ScriptType type;

  ScriptSummary({
    required this.scriptLocation,
    required this.type,
  });

  factory ScriptSummary.fromJson(Map<String, dynamic> json) {
    return ScriptSummary(
      scriptLocation: json['scriptLocation'] as String,
      type: ScriptType.fromString((json['type'] as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final scriptLocation = this.scriptLocation;
    final type = this.type;
    return {
      'scriptLocation': scriptLocation,
      'type': type.value,
    };
  }
}

enum ScriptType {
  selenium('Selenium'),
  ;

  final String value;

  const ScriptType(this.value);

  static ScriptType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum ScriptType'));
}

/// Specifies the service settings.
class ServiceSettings {
  /// The KMS key ID of the service settings.
  final String? kmsKeyId;

  ServiceSettings({
    this.kmsKeyId,
  });

  factory ServiceSettings.fromJson(Map<String, dynamic> json) {
    return ServiceSettings(
      kmsKeyId: json['kmsKeyId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final kmsKeyId = this.kmsKeyId;
    return {
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
    };
  }
}

enum SourceDatabase {
  zOsDb2('z/OS-DB2'),
  ;

  final String value;

  const SourceDatabase(this.value);

  static SourceDatabase fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum SourceDatabase'));
}

/// Specifies the source database metadata.
class SourceDatabaseMetadata {
  /// The capture tool of the source database metadata.
  final CaptureTool captureTool;

  /// The type of the source database metadata.
  final SourceDatabase type;

  SourceDatabaseMetadata({
    required this.captureTool,
    required this.type,
  });

  factory SourceDatabaseMetadata.fromJson(Map<String, dynamic> json) {
    return SourceDatabaseMetadata(
      captureTool: CaptureTool.fromString((json['captureTool'] as String)),
      type: SourceDatabase.fromString((json['type'] as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final captureTool = this.captureTool;
    final type = this.type;
    return {
      'captureTool': captureTool.value,
      'type': type.value,
    };
  }
}

class StartTestRunResponse {
  /// The test run ID of the test run.
  final String testRunId;

  /// The test run status of the test run.
  final TestRunStatus testRunStatus;

  StartTestRunResponse({
    required this.testRunId,
    required this.testRunStatus,
  });

  factory StartTestRunResponse.fromJson(Map<String, dynamic> json) {
    return StartTestRunResponse(
      testRunId: json['testRunId'] as String,
      testRunStatus:
          TestRunStatus.fromString((json['testRunStatus'] as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final testRunId = this.testRunId;
    final testRunStatus = this.testRunStatus;
    return {
      'testRunId': testRunId,
      'testRunStatus': testRunStatus.value,
    };
  }
}

/// Defines a step.
class Step {
  /// The action of the step.
  final StepAction action;

  /// The name of the step.
  final String name;

  /// The description of the step.
  final String? description;

  Step({
    required this.action,
    required this.name,
    this.description,
  });

  factory Step.fromJson(Map<String, dynamic> json) {
    return Step(
      action: StepAction.fromJson(json['action'] as Map<String, dynamic>),
      name: json['name'] as String,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final name = this.name;
    final description = this.description;
    return {
      'action': action,
      'name': name,
      if (description != null) 'description': description,
    };
  }
}

/// Specifies a step action.
class StepAction {
  /// The compare action of the step action.
  final CompareAction? compareAction;

  /// The mainframe action of the step action.
  final MainframeAction? mainframeAction;

  /// The resource action of the step action.
  final ResourceAction? resourceAction;

  StepAction({
    this.compareAction,
    this.mainframeAction,
    this.resourceAction,
  });

  factory StepAction.fromJson(Map<String, dynamic> json) {
    return StepAction(
      compareAction: json['compareAction'] != null
          ? CompareAction.fromJson(
              json['compareAction'] as Map<String, dynamic>)
          : null,
      mainframeAction: json['mainframeAction'] != null
          ? MainframeAction.fromJson(
              json['mainframeAction'] as Map<String, dynamic>)
          : null,
      resourceAction: json['resourceAction'] != null
          ? ResourceAction.fromJson(
              json['resourceAction'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final compareAction = this.compareAction;
    final mainframeAction = this.mainframeAction;
    final resourceAction = this.resourceAction;
    return {
      if (compareAction != null) 'compareAction': compareAction,
      if (mainframeAction != null) 'mainframeAction': mainframeAction,
      if (resourceAction != null) 'resourceAction': resourceAction,
    };
  }
}

enum StepRunStatus {
  success('Success'),
  failed('Failed'),
  running('Running'),
  ;

  final String value;

  const StepRunStatus(this.value);

  static StepRunStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum StepRunStatus'));
}

/// Defines the step run summary.
class StepRunSummary {
  /// The compare action of the step run summary.
  final CompareActionSummary? compareAction;

  /// The mainframe action of the step run summary.
  final MainframeActionSummary? mainframeAction;

  /// The resource action of the step run summary.
  final ResourceActionSummary? resourceAction;

  StepRunSummary({
    this.compareAction,
    this.mainframeAction,
    this.resourceAction,
  });

  factory StepRunSummary.fromJson(Map<String, dynamic> json) {
    return StepRunSummary(
      compareAction: json['compareAction'] != null
          ? CompareActionSummary.fromJson(
              json['compareAction'] as Map<String, dynamic>)
          : null,
      mainframeAction: json['mainframeAction'] != null
          ? MainframeActionSummary.fromJson(
              json['mainframeAction'] as Map<String, dynamic>)
          : null,
      resourceAction: json['resourceAction'] != null
          ? ResourceActionSummary.fromJson(
              json['resourceAction'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final compareAction = this.compareAction;
    final mainframeAction = this.mainframeAction;
    final resourceAction = this.resourceAction;
    return {
      if (compareAction != null) 'compareAction': compareAction,
      if (mainframeAction != null) 'mainframeAction': mainframeAction,
      if (resourceAction != null) 'resourceAction': resourceAction,
    };
  }
}

/// Specifies the TN3270 protocol.
class TN3270 {
  /// The script of the TN3270 protocol.
  final Script script;

  /// The data set names of the TN3270 protocol.
  final List<String>? exportDataSetNames;

  TN3270({
    required this.script,
    this.exportDataSetNames,
  });

  factory TN3270.fromJson(Map<String, dynamic> json) {
    return TN3270(
      script: Script.fromJson(json['script'] as Map<String, dynamic>),
      exportDataSetNames: (json['exportDataSetNames'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final script = this.script;
    final exportDataSetNames = this.exportDataSetNames;
    return {
      'script': script,
      if (exportDataSetNames != null) 'exportDataSetNames': exportDataSetNames,
    };
  }
}

/// Specifies a TN3270 step input.
class TN3270StepInput {
  /// The resource of the TN3270 step input.
  final MainframeResourceSummary resource;

  /// The script of the TN3270 step input.
  final ScriptSummary script;

  /// The export data set names of the TN3270 step input.
  final List<String>? exportDataSetNames;

  /// The properties of the TN3270 step input.
  final MainframeActionProperties? properties;

  TN3270StepInput({
    required this.resource,
    required this.script,
    this.exportDataSetNames,
    this.properties,
  });

  factory TN3270StepInput.fromJson(Map<String, dynamic> json) {
    return TN3270StepInput(
      resource: MainframeResourceSummary.fromJson(
          json['resource'] as Map<String, dynamic>),
      script: ScriptSummary.fromJson(json['script'] as Map<String, dynamic>),
      exportDataSetNames: (json['exportDataSetNames'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      properties: json['properties'] != null
          ? MainframeActionProperties.fromJson(
              json['properties'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final resource = this.resource;
    final script = this.script;
    final exportDataSetNames = this.exportDataSetNames;
    final properties = this.properties;
    return {
      'resource': resource,
      'script': script,
      if (exportDataSetNames != null) 'exportDataSetNames': exportDataSetNames,
      if (properties != null) 'properties': properties,
    };
  }
}

/// Specifies a TN3270 step output.
class TN3270StepOutput {
  /// The script output location of the TN3270 step output.
  final String scriptOutputLocation;

  /// The data set details of the TN3270 step output.
  final List<DataSet>? dataSetDetails;

  /// The data set export location of the TN3270 step output.
  final String? dataSetExportLocation;

  /// The output location of the TN3270 step output.
  final String? dmsOutputLocation;

  TN3270StepOutput({
    required this.scriptOutputLocation,
    this.dataSetDetails,
    this.dataSetExportLocation,
    this.dmsOutputLocation,
  });

  factory TN3270StepOutput.fromJson(Map<String, dynamic> json) {
    return TN3270StepOutput(
      scriptOutputLocation: json['scriptOutputLocation'] as String,
      dataSetDetails: (json['dataSetDetails'] as List?)
          ?.nonNulls
          .map((e) => DataSet.fromJson(e as Map<String, dynamic>))
          .toList(),
      dataSetExportLocation: json['dataSetExportLocation'] as String?,
      dmsOutputLocation: json['dmsOutputLocation'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final scriptOutputLocation = this.scriptOutputLocation;
    final dataSetDetails = this.dataSetDetails;
    final dataSetExportLocation = this.dataSetExportLocation;
    final dmsOutputLocation = this.dmsOutputLocation;
    return {
      'scriptOutputLocation': scriptOutputLocation,
      if (dataSetDetails != null) 'dataSetDetails': dataSetDetails,
      if (dataSetExportLocation != null)
        'dataSetExportLocation': dataSetExportLocation,
      if (dmsOutputLocation != null) 'dmsOutputLocation': dmsOutputLocation,
    };
  }
}

/// Specifies a TN3270 summary.
class TN3270Summary {
  /// The step input of the TN3270 summary.
  final TN3270StepInput stepInput;

  /// The step output of the TN3270 summary.
  final TN3270StepOutput? stepOutput;

  TN3270Summary({
    required this.stepInput,
    this.stepOutput,
  });

  factory TN3270Summary.fromJson(Map<String, dynamic> json) {
    return TN3270Summary(
      stepInput:
          TN3270StepInput.fromJson(json['stepInput'] as Map<String, dynamic>),
      stepOutput: json['stepOutput'] != null
          ? TN3270StepOutput.fromJson(
              json['stepOutput'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final stepInput = this.stepInput;
    final stepOutput = this.stepOutput;
    return {
      'stepInput': stepInput,
      if (stepOutput != null) 'stepOutput': stepOutput,
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

enum TargetDatabase {
  postgreSQL('PostgreSQL'),
  ;

  final String value;

  const TargetDatabase(this.value);

  static TargetDatabase fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum TargetDatabase'));
}

/// Specifies a target database metadata.
class TargetDatabaseMetadata {
  /// The capture tool of the target database metadata.
  final CaptureTool captureTool;

  /// The type of the target database metadata.
  final TargetDatabase type;

  TargetDatabaseMetadata({
    required this.captureTool,
    required this.type,
  });

  factory TargetDatabaseMetadata.fromJson(Map<String, dynamic> json) {
    return TargetDatabaseMetadata(
      captureTool: CaptureTool.fromString((json['captureTool'] as String)),
      type: TargetDatabase.fromString((json['type'] as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final captureTool = this.captureTool;
    final type = this.type;
    return {
      'captureTool': captureTool.value,
      'type': type.value,
    };
  }
}

/// Specifies the latest version of a test case.
class TestCaseLatestVersion {
  /// The status of the test case latest version.
  final TestCaseLifecycle status;

  /// The version of the test case latest version.
  final int version;

  /// The status reason of the test case latest version.
  final String? statusReason;

  TestCaseLatestVersion({
    required this.status,
    required this.version,
    this.statusReason,
  });

  factory TestCaseLatestVersion.fromJson(Map<String, dynamic> json) {
    return TestCaseLatestVersion(
      status: TestCaseLifecycle.fromString((json['status'] as String)),
      version: json['version'] as int,
      statusReason: json['statusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final version = this.version;
    final statusReason = this.statusReason;
    return {
      'status': status.value,
      'version': version,
      if (statusReason != null) 'statusReason': statusReason,
    };
  }
}

enum TestCaseLifecycle {
  active('Active'),
  deleting('Deleting'),
  ;

  final String value;

  const TestCaseLifecycle(this.value);

  static TestCaseLifecycle fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum TestCaseLifecycle'));
}

enum TestCaseRunStatus {
  success('Success'),
  running('Running'),
  failed('Failed'),
  ;

  final String value;

  const TestCaseRunStatus(this.value);

  static TestCaseRunStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum TestCaseRunStatus'));
}

/// Specifies the test case run summary.
class TestCaseRunSummary {
  /// The run start time of the test case run summary.
  final DateTime runStartTime;

  /// The status of the test case run summary.
  final TestCaseRunStatus status;

  /// The test case id of the test case run summary.
  final String testCaseId;

  /// The test case version of the test case run summary.
  final int testCaseVersion;

  /// The test run id of the test case run summary.
  final String testRunId;

  /// The run end time of the test case run summary.
  final DateTime? runEndTime;

  /// The status reason of the test case run summary.
  final String? statusReason;

  TestCaseRunSummary({
    required this.runStartTime,
    required this.status,
    required this.testCaseId,
    required this.testCaseVersion,
    required this.testRunId,
    this.runEndTime,
    this.statusReason,
  });

  factory TestCaseRunSummary.fromJson(Map<String, dynamic> json) {
    return TestCaseRunSummary(
      runStartTime:
          nonNullableTimeStampFromJson(json['runStartTime'] as Object),
      status: TestCaseRunStatus.fromString((json['status'] as String)),
      testCaseId: json['testCaseId'] as String,
      testCaseVersion: json['testCaseVersion'] as int,
      testRunId: json['testRunId'] as String,
      runEndTime: timeStampFromJson(json['runEndTime']),
      statusReason: json['statusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final runStartTime = this.runStartTime;
    final status = this.status;
    final testCaseId = this.testCaseId;
    final testCaseVersion = this.testCaseVersion;
    final testRunId = this.testRunId;
    final runEndTime = this.runEndTime;
    final statusReason = this.statusReason;
    return {
      'runStartTime': unixTimestampToJson(runStartTime),
      'status': status.value,
      'testCaseId': testCaseId,
      'testCaseVersion': testCaseVersion,
      'testRunId': testRunId,
      if (runEndTime != null) 'runEndTime': unixTimestampToJson(runEndTime),
      if (statusReason != null) 'statusReason': statusReason,
    };
  }
}

/// Specifies a test case summary.
class TestCaseSummary {
  /// The creation time of the test case summary.
  final DateTime creationTime;

  /// The last update time of the test case summary.
  final DateTime lastUpdateTime;

  /// The latest version of the test case summary.
  final int latestVersion;

  /// The name of the test case summary.
  final String name;

  /// The status of the test case summary.
  final TestCaseLifecycle status;

  /// The test case Amazon Resource Name (ARN) of the test case summary.
  final String testCaseArn;

  /// The test case ID of the test case summary.
  final String testCaseId;

  /// The status reason of the test case summary.
  final String? statusReason;

  TestCaseSummary({
    required this.creationTime,
    required this.lastUpdateTime,
    required this.latestVersion,
    required this.name,
    required this.status,
    required this.testCaseArn,
    required this.testCaseId,
    this.statusReason,
  });

  factory TestCaseSummary.fromJson(Map<String, dynamic> json) {
    return TestCaseSummary(
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      lastUpdateTime:
          nonNullableTimeStampFromJson(json['lastUpdateTime'] as Object),
      latestVersion: json['latestVersion'] as int,
      name: json['name'] as String,
      status: TestCaseLifecycle.fromString((json['status'] as String)),
      testCaseArn: json['testCaseArn'] as String,
      testCaseId: json['testCaseId'] as String,
      statusReason: json['statusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final lastUpdateTime = this.lastUpdateTime;
    final latestVersion = this.latestVersion;
    final name = this.name;
    final status = this.status;
    final testCaseArn = this.testCaseArn;
    final testCaseId = this.testCaseId;
    final statusReason = this.statusReason;
    return {
      'creationTime': unixTimestampToJson(creationTime),
      'lastUpdateTime': unixTimestampToJson(lastUpdateTime),
      'latestVersion': latestVersion,
      'name': name,
      'status': status.value,
      'testCaseArn': testCaseArn,
      'testCaseId': testCaseId,
      if (statusReason != null) 'statusReason': statusReason,
    };
  }
}

/// Specifies test cases.
class TestCases {
  /// The sequential of the test case.
  final List<String>? sequential;

  TestCases({
    this.sequential,
  });

  factory TestCases.fromJson(Map<String, dynamic> json) {
    return TestCases(
      sequential: (json['sequential'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final sequential = this.sequential;
    return {
      if (sequential != null) 'sequential': sequential,
    };
  }
}

/// Specifies the latest version of the test configuration.
class TestConfigurationLatestVersion {
  /// The status of the test configuration latest version.
  final TestConfigurationLifecycle status;

  /// The version of the test configuration latest version.
  final int version;

  /// The status reason of the test configuration latest version.
  final String? statusReason;

  TestConfigurationLatestVersion({
    required this.status,
    required this.version,
    this.statusReason,
  });

  factory TestConfigurationLatestVersion.fromJson(Map<String, dynamic> json) {
    return TestConfigurationLatestVersion(
      status: TestConfigurationLifecycle.fromString((json['status'] as String)),
      version: json['version'] as int,
      statusReason: json['statusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final version = this.version;
    final statusReason = this.statusReason;
    return {
      'status': status.value,
      'version': version,
      if (statusReason != null) 'statusReason': statusReason,
    };
  }
}

enum TestConfigurationLifecycle {
  active('Active'),
  deleting('Deleting'),
  ;

  final String value;

  const TestConfigurationLifecycle(this.value);

  static TestConfigurationLifecycle fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum TestConfigurationLifecycle'));
}

/// Specifies a test configuration summary.
class TestConfigurationSummary {
  /// The creation time of the test configuration summary.
  final DateTime creationTime;

  /// The last update time of the test configuration summary.
  final DateTime lastUpdateTime;

  /// The latest version of the test configuration summary.
  final int latestVersion;

  /// The name of the test configuration summary.
  final String name;

  /// The status of the test configuration summary.
  final TestConfigurationLifecycle status;

  /// The test configuration ARN of the test configuration summary.
  final String testConfigurationArn;

  /// The test configuration ID of the test configuration summary.
  final String testConfigurationId;

  /// The status reason of the test configuration summary.
  final String? statusReason;

  TestConfigurationSummary({
    required this.creationTime,
    required this.lastUpdateTime,
    required this.latestVersion,
    required this.name,
    required this.status,
    required this.testConfigurationArn,
    required this.testConfigurationId,
    this.statusReason,
  });

  factory TestConfigurationSummary.fromJson(Map<String, dynamic> json) {
    return TestConfigurationSummary(
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      lastUpdateTime:
          nonNullableTimeStampFromJson(json['lastUpdateTime'] as Object),
      latestVersion: json['latestVersion'] as int,
      name: json['name'] as String,
      status: TestConfigurationLifecycle.fromString((json['status'] as String)),
      testConfigurationArn: json['testConfigurationArn'] as String,
      testConfigurationId: json['testConfigurationId'] as String,
      statusReason: json['statusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final lastUpdateTime = this.lastUpdateTime;
    final latestVersion = this.latestVersion;
    final name = this.name;
    final status = this.status;
    final testConfigurationArn = this.testConfigurationArn;
    final testConfigurationId = this.testConfigurationId;
    final statusReason = this.statusReason;
    return {
      'creationTime': unixTimestampToJson(creationTime),
      'lastUpdateTime': unixTimestampToJson(lastUpdateTime),
      'latestVersion': latestVersion,
      'name': name,
      'status': status.value,
      'testConfigurationArn': testConfigurationArn,
      'testConfigurationId': testConfigurationId,
      if (statusReason != null) 'statusReason': statusReason,
    };
  }
}

enum TestRunStatus {
  success('Success'),
  running('Running'),
  failed('Failed'),
  deleting('Deleting'),
  ;

  final String value;

  const TestRunStatus(this.value);

  static TestRunStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum TestRunStatus'));
}

/// Specifies a test run step summary.
class TestRunStepSummary {
  /// The run start time of the test run step summary.
  final DateTime runStartTime;

  /// The status of the test run step summary.
  final StepRunStatus status;

  /// The step name of the test run step summary.
  final String stepName;

  /// The test run ID of the test run step summary.
  final String testRunId;

  /// The after step of the test run step summary.
  final bool? afterStep;

  /// The before step of the test run step summary.
  final bool? beforeStep;

  /// The run end time of the test run step summary.
  final DateTime? runEndTime;

  /// The status reason of the test run step summary.
  final String? statusReason;

  /// The test case ID of the test run step summary.
  final String? testCaseId;

  /// The test case version of the test run step summary.
  final int? testCaseVersion;

  /// The test suite ID of the test run step summary.
  final String? testSuiteId;

  /// The test suite version of the test run step summary.
  final int? testSuiteVersion;

  TestRunStepSummary({
    required this.runStartTime,
    required this.status,
    required this.stepName,
    required this.testRunId,
    this.afterStep,
    this.beforeStep,
    this.runEndTime,
    this.statusReason,
    this.testCaseId,
    this.testCaseVersion,
    this.testSuiteId,
    this.testSuiteVersion,
  });

  factory TestRunStepSummary.fromJson(Map<String, dynamic> json) {
    return TestRunStepSummary(
      runStartTime:
          nonNullableTimeStampFromJson(json['runStartTime'] as Object),
      status: StepRunStatus.fromString((json['status'] as String)),
      stepName: json['stepName'] as String,
      testRunId: json['testRunId'] as String,
      afterStep: json['afterStep'] as bool?,
      beforeStep: json['beforeStep'] as bool?,
      runEndTime: timeStampFromJson(json['runEndTime']),
      statusReason: json['statusReason'] as String?,
      testCaseId: json['testCaseId'] as String?,
      testCaseVersion: json['testCaseVersion'] as int?,
      testSuiteId: json['testSuiteId'] as String?,
      testSuiteVersion: json['testSuiteVersion'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final runStartTime = this.runStartTime;
    final status = this.status;
    final stepName = this.stepName;
    final testRunId = this.testRunId;
    final afterStep = this.afterStep;
    final beforeStep = this.beforeStep;
    final runEndTime = this.runEndTime;
    final statusReason = this.statusReason;
    final testCaseId = this.testCaseId;
    final testCaseVersion = this.testCaseVersion;
    final testSuiteId = this.testSuiteId;
    final testSuiteVersion = this.testSuiteVersion;
    return {
      'runStartTime': unixTimestampToJson(runStartTime),
      'status': status.value,
      'stepName': stepName,
      'testRunId': testRunId,
      if (afterStep != null) 'afterStep': afterStep,
      if (beforeStep != null) 'beforeStep': beforeStep,
      if (runEndTime != null) 'runEndTime': unixTimestampToJson(runEndTime),
      if (statusReason != null) 'statusReason': statusReason,
      if (testCaseId != null) 'testCaseId': testCaseId,
      if (testCaseVersion != null) 'testCaseVersion': testCaseVersion,
      if (testSuiteId != null) 'testSuiteId': testSuiteId,
      if (testSuiteVersion != null) 'testSuiteVersion': testSuiteVersion,
    };
  }
}

/// Specifies a test run summary.
class TestRunSummary {
  /// The run start time of the test run summary.
  final DateTime runStartTime;

  /// The status of the test run summary.
  final TestRunStatus status;

  /// The test run ARN of the test run summary.
  final String testRunArn;

  /// The test run ID of the test run summary.
  final String testRunId;

  /// The test suite ID of the test run summary.
  final String testSuiteId;

  /// The test suite version of the test run summary.
  final int testSuiteVersion;

  /// The run end time of the test run summary.
  final DateTime? runEndTime;

  /// The status reason of the test run summary.
  final String? statusReason;

  /// The test configuration ID of the test run summary.
  final String? testConfigurationId;

  /// The test configuration version of the test run summary.
  final int? testConfigurationVersion;

  TestRunSummary({
    required this.runStartTime,
    required this.status,
    required this.testRunArn,
    required this.testRunId,
    required this.testSuiteId,
    required this.testSuiteVersion,
    this.runEndTime,
    this.statusReason,
    this.testConfigurationId,
    this.testConfigurationVersion,
  });

  factory TestRunSummary.fromJson(Map<String, dynamic> json) {
    return TestRunSummary(
      runStartTime:
          nonNullableTimeStampFromJson(json['runStartTime'] as Object),
      status: TestRunStatus.fromString((json['status'] as String)),
      testRunArn: json['testRunArn'] as String,
      testRunId: json['testRunId'] as String,
      testSuiteId: json['testSuiteId'] as String,
      testSuiteVersion: json['testSuiteVersion'] as int,
      runEndTime: timeStampFromJson(json['runEndTime']),
      statusReason: json['statusReason'] as String?,
      testConfigurationId: json['testConfigurationId'] as String?,
      testConfigurationVersion: json['testConfigurationVersion'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final runStartTime = this.runStartTime;
    final status = this.status;
    final testRunArn = this.testRunArn;
    final testRunId = this.testRunId;
    final testSuiteId = this.testSuiteId;
    final testSuiteVersion = this.testSuiteVersion;
    final runEndTime = this.runEndTime;
    final statusReason = this.statusReason;
    final testConfigurationId = this.testConfigurationId;
    final testConfigurationVersion = this.testConfigurationVersion;
    return {
      'runStartTime': unixTimestampToJson(runStartTime),
      'status': status.value,
      'testRunArn': testRunArn,
      'testRunId': testRunId,
      'testSuiteId': testSuiteId,
      'testSuiteVersion': testSuiteVersion,
      if (runEndTime != null) 'runEndTime': unixTimestampToJson(runEndTime),
      if (statusReason != null) 'statusReason': statusReason,
      if (testConfigurationId != null)
        'testConfigurationId': testConfigurationId,
      if (testConfigurationVersion != null)
        'testConfigurationVersion': testConfigurationVersion,
    };
  }
}

/// Specifies the latest version of a test suite.
class TestSuiteLatestVersion {
  /// The status of the test suite latest version.
  final TestSuiteLifecycle status;

  /// The version of the test suite latest version.
  final int version;

  /// The status reason of the test suite latest version.
  final String? statusReason;

  TestSuiteLatestVersion({
    required this.status,
    required this.version,
    this.statusReason,
  });

  factory TestSuiteLatestVersion.fromJson(Map<String, dynamic> json) {
    return TestSuiteLatestVersion(
      status: TestSuiteLifecycle.fromString((json['status'] as String)),
      version: json['version'] as int,
      statusReason: json['statusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final version = this.version;
    final statusReason = this.statusReason;
    return {
      'status': status.value,
      'version': version,
      if (statusReason != null) 'statusReason': statusReason,
    };
  }
}

enum TestSuiteLifecycle {
  creating('Creating'),
  updating('Updating'),
  active('Active'),
  failed('Failed'),
  deleting('Deleting'),
  ;

  final String value;

  const TestSuiteLifecycle(this.value);

  static TestSuiteLifecycle fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum TestSuiteLifecycle'));
}

/// Specifies the test suite summary.
class TestSuiteSummary {
  /// The creation time of the test suite summary.
  final DateTime creationTime;

  /// The last update time of the test suite summary.
  final DateTime lastUpdateTime;

  /// The latest version of the test suite summary.
  final int latestVersion;

  /// The name of the test suite summary.
  final String name;

  /// The status of the test suite summary.
  final TestSuiteLifecycle status;

  /// The test suite Amazon Resource Name (ARN) of the test suite summary.
  final String testSuiteArn;

  /// The test suite ID of the test suite summary.
  final String testSuiteId;

  /// The status reason of the test suite summary.
  final String? statusReason;

  TestSuiteSummary({
    required this.creationTime,
    required this.lastUpdateTime,
    required this.latestVersion,
    required this.name,
    required this.status,
    required this.testSuiteArn,
    required this.testSuiteId,
    this.statusReason,
  });

  factory TestSuiteSummary.fromJson(Map<String, dynamic> json) {
    return TestSuiteSummary(
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      lastUpdateTime:
          nonNullableTimeStampFromJson(json['lastUpdateTime'] as Object),
      latestVersion: json['latestVersion'] as int,
      name: json['name'] as String,
      status: TestSuiteLifecycle.fromString((json['status'] as String)),
      testSuiteArn: json['testSuiteArn'] as String,
      testSuiteId: json['testSuiteId'] as String,
      statusReason: json['statusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final lastUpdateTime = this.lastUpdateTime;
    final latestVersion = this.latestVersion;
    final name = this.name;
    final status = this.status;
    final testSuiteArn = this.testSuiteArn;
    final testSuiteId = this.testSuiteId;
    final statusReason = this.statusReason;
    return {
      'creationTime': unixTimestampToJson(creationTime),
      'lastUpdateTime': unixTimestampToJson(lastUpdateTime),
      'latestVersion': latestVersion,
      'name': name,
      'status': status.value,
      'testSuiteArn': testSuiteArn,
      'testSuiteId': testSuiteId,
      if (statusReason != null) 'statusReason': statusReason,
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

class UpdateTestCaseResponse {
  /// The test case ID of the test case.
  final String testCaseId;

  /// The test case version of the test case.
  final int testCaseVersion;

  UpdateTestCaseResponse({
    required this.testCaseId,
    required this.testCaseVersion,
  });

  factory UpdateTestCaseResponse.fromJson(Map<String, dynamic> json) {
    return UpdateTestCaseResponse(
      testCaseId: json['testCaseId'] as String,
      testCaseVersion: json['testCaseVersion'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final testCaseId = this.testCaseId;
    final testCaseVersion = this.testCaseVersion;
    return {
      'testCaseId': testCaseId,
      'testCaseVersion': testCaseVersion,
    };
  }
}

class UpdateTestConfigurationResponse {
  /// The configuration ID of the test configuration.
  final String testConfigurationId;

  /// The configuration version of the test configuration.
  final int testConfigurationVersion;

  UpdateTestConfigurationResponse({
    required this.testConfigurationId,
    required this.testConfigurationVersion,
  });

  factory UpdateTestConfigurationResponse.fromJson(Map<String, dynamic> json) {
    return UpdateTestConfigurationResponse(
      testConfigurationId: json['testConfigurationId'] as String,
      testConfigurationVersion: json['testConfigurationVersion'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final testConfigurationId = this.testConfigurationId;
    final testConfigurationVersion = this.testConfigurationVersion;
    return {
      'testConfigurationId': testConfigurationId,
      'testConfigurationVersion': testConfigurationVersion,
    };
  }
}

class UpdateTestSuiteResponse {
  /// The test suite ID of the test suite.
  final String testSuiteId;

  /// The test suite version of the test suite.
  final int? testSuiteVersion;

  UpdateTestSuiteResponse({
    required this.testSuiteId,
    this.testSuiteVersion,
  });

  factory UpdateTestSuiteResponse.fromJson(Map<String, dynamic> json) {
    return UpdateTestSuiteResponse(
      testSuiteId: json['testSuiteId'] as String,
      testSuiteVersion: json['testSuiteVersion'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final testSuiteId = this.testSuiteId;
    final testSuiteVersion = this.testSuiteVersion;
    return {
      'testSuiteId': testSuiteId,
      if (testSuiteVersion != null) 'testSuiteVersion': testSuiteVersion,
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
