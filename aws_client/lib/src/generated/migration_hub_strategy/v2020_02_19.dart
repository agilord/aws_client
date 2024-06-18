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

/// This API reference provides descriptions, syntax, and other details about
/// each of the actions and data types for Migration Hub Strategy
/// Recommendations (Strategy Recommendations). The topic for each action shows
/// the API request parameters and the response. Alternatively, you can use one
/// of the AWS SDKs to access an API that is tailored to the programming
/// language or platform that you're using. For more information, see <a
/// href="http://aws.amazon.com/tools/#SDKs">AWS SDKs</a>.
class MigrationHubStrategyRecommendations {
  final _s.RestJsonProtocol _protocol;
  MigrationHubStrategyRecommendations({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'migrationhub-strategy',
            signingName: 'migrationhub-strategy',
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

  /// Retrieves details about an application component.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [applicationComponentId] :
  /// The ID of the application component. The ID is unique within an AWS
  /// account.
  Future<GetApplicationComponentDetailsResponse>
      getApplicationComponentDetails({
    required String applicationComponentId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/get-applicationcomponent-details/${Uri.encodeComponent(applicationComponentId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetApplicationComponentDetailsResponse.fromJson(response);
  }

  /// Retrieves a list of all the recommended strategies and tools for an
  /// application component running on a server.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [applicationComponentId] :
  /// The ID of the application component. The ID is unique within an AWS
  /// account.
  Future<GetApplicationComponentStrategiesResponse>
      getApplicationComponentStrategies({
    required String applicationComponentId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/get-applicationcomponent-strategies/${Uri.encodeComponent(applicationComponentId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetApplicationComponentStrategiesResponse.fromJson(response);
  }

  /// Retrieves the status of an on-going assessment.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The <code>assessmentid</code> returned by <a>StartAssessment</a>.
  Future<GetAssessmentResponse> getAssessment({
    required String id,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/get-assessment/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetAssessmentResponse.fromJson(response);
  }

  /// Retrieves the details about a specific import task.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The ID of the import file task. This ID is returned in the response of
  /// <a>StartImportFileTask</a>.
  Future<GetImportFileTaskResponse> getImportFileTask({
    required String id,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/get-import-file-task/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetImportFileTaskResponse.fromJson(response);
  }

  /// Retrieve the latest ID of a specific assessment task.
  ///
  /// May throw [DependencyException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  Future<GetLatestAssessmentIdResponse> getLatestAssessmentId() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/get-latest-assessment-id',
      exceptionFnMap: _exceptionFns,
    );
    return GetLatestAssessmentIdResponse.fromJson(response);
  }

  /// Retrieves your migration and modernization preferences.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  Future<GetPortfolioPreferencesResponse> getPortfolioPreferences() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/get-portfolio-preferences',
      exceptionFnMap: _exceptionFns,
    );
    return GetPortfolioPreferencesResponse.fromJson(response);
  }

  /// Retrieves overall summary including the number of servers to rehost and
  /// the overall number of anti-patterns.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  Future<GetPortfolioSummaryResponse> getPortfolioSummary() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/get-portfolio-summary',
      exceptionFnMap: _exceptionFns,
    );
    return GetPortfolioSummaryResponse.fromJson(response);
  }

  /// Retrieves detailed information about the specified recommendation report.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The recommendation report generation task <code>id</code> returned by
  /// <a>StartRecommendationReportGeneration</a>.
  Future<GetRecommendationReportDetailsResponse>
      getRecommendationReportDetails({
    required String id,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/get-recommendation-report-details/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetRecommendationReportDetailsResponse.fromJson(response);
  }

  /// Retrieves detailed information about a specified server.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [serverId] :
  /// The ID of the server.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to include in the response. The maximum value
  /// is 100.
  ///
  /// Parameter [nextToken] :
  /// The token from a previous call that you use to retrieve the next set of
  /// results. For example, if a previous call to this action returned 100
  /// items, but you set <code>maxResults</code> to 10. You'll receive a set of
  /// 10 results along with a token. You then use the returned token to retrieve
  /// the next set of 10.
  Future<GetServerDetailsResponse> getServerDetails({
    required String serverId,
    int? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/get-server-details/${Uri.encodeComponent(serverId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetServerDetailsResponse.fromJson(response);
  }

  /// Retrieves recommended strategies and tools for the specified server.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [serverId] :
  /// The ID of the server.
  Future<GetServerStrategiesResponse> getServerStrategies({
    required String serverId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/get-server-strategies/${Uri.encodeComponent(serverId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetServerStrategiesResponse.fromJson(response);
  }

  /// Retrieves a list of all the servers fetched from customer vCenter using
  /// Strategy Recommendation Collector.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to include in the response. The maximum value
  /// is 100.
  ///
  /// Parameter [nextToken] :
  /// The token from a previous call that you use to retrieve the next set of
  /// results. For example, if a previous call to this action returned 100
  /// items, but you set maxResults to 10. You'll receive a set of 10 results
  /// along with a token. You then use the returned token to retrieve the next
  /// set of 10.
  ///
  /// Parameter [sort] :
  /// Specifies whether to sort by ascending (ASC) or descending (DESC) order.
  Future<ListAnalyzableServersResponse> listAnalyzableServers({
    int? maxResults,
    String? nextToken,
    SortOrder? sort,
  }) async {
    final $payload = <String, dynamic>{
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (sort != null) 'sort': sort.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/list-analyzable-servers',
      exceptionFnMap: _exceptionFns,
    );
    return ListAnalyzableServersResponse.fromJson(response);
  }

  /// Retrieves a list of all the application components (processes).
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ServiceLinkedRoleLockClientException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [applicationComponentCriteria] :
  /// Criteria for filtering the list of application components.
  ///
  /// Parameter [filterValue] :
  /// Specify the value based on the application component criteria type. For
  /// example, if <code>applicationComponentCriteria</code> is set to
  /// <code>SERVER_ID</code> and <code>filterValue</code> is set to
  /// <code>server1</code>, then <a>ListApplicationComponents</a> returns all
  /// the application components running on server1.
  ///
  /// Parameter [groupIdFilter] :
  /// The group ID specified in to filter on.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to include in the response. The maximum value
  /// is 100.
  ///
  /// Parameter [nextToken] :
  /// The token from a previous call that you use to retrieve the next set of
  /// results. For example, if a previous call to this action returned 100
  /// items, but you set <code>maxResults</code> to 10. You'll receive a set of
  /// 10 results along with a token. You then use the returned token to retrieve
  /// the next set of 10.
  ///
  /// Parameter [sort] :
  /// Specifies whether to sort by ascending (<code>ASC</code>) or descending
  /// (<code>DESC</code>) order.
  Future<ListApplicationComponentsResponse> listApplicationComponents({
    ApplicationComponentCriteria? applicationComponentCriteria,
    String? filterValue,
    List<Group>? groupIdFilter,
    int? maxResults,
    String? nextToken,
    SortOrder? sort,
  }) async {
    final $payload = <String, dynamic>{
      if (applicationComponentCriteria != null)
        'applicationComponentCriteria': applicationComponentCriteria.value,
      if (filterValue != null) 'filterValue': filterValue,
      if (groupIdFilter != null) 'groupIdFilter': groupIdFilter,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (sort != null) 'sort': sort.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/list-applicationcomponents',
      exceptionFnMap: _exceptionFns,
    );
    return ListApplicationComponentsResponse.fromJson(response);
  }

  /// Retrieves a list of all the installed collectors.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to include in the response. The maximum value
  /// is 100.
  ///
  /// Parameter [nextToken] :
  /// The token from a previous call that you use to retrieve the next set of
  /// results. For example, if a previous call to this action returned 100
  /// items, but you set <code>maxResults</code> to 10. You'll receive a set of
  /// 10 results along with a token. You then use the returned token to retrieve
  /// the next set of 10.
  Future<ListCollectorsResponse> listCollectors({
    int? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/list-collectors',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListCollectorsResponse.fromJson(response);
  }

  /// Retrieves a list of all the imports performed.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [maxResults] :
  /// The total number of items to return. The maximum value is 100.
  ///
  /// Parameter [nextToken] :
  /// The token from a previous call that you use to retrieve the next set of
  /// results. For example, if a previous call to this action returned 100
  /// items, but you set <code>maxResults</code> to 10. You'll receive a set of
  /// 10 results along with a token. You then use the returned token to retrieve
  /// the next set of 10.
  Future<ListImportFileTaskResponse> listImportFileTask({
    int? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/list-import-file-task',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListImportFileTaskResponse.fromJson(response);
  }

  /// Returns a list of all the servers.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [filterValue] :
  /// Specifies the filter value, which is based on the type of server criteria.
  /// For example, if <code>serverCriteria</code> is <code>OS_NAME</code>, and
  /// the <code>filterValue</code> is equal to <code>WindowsServer</code>, then
  /// <code>ListServers</code> returns all of the servers matching the OS name
  /// <code>WindowsServer</code>.
  ///
  /// Parameter [groupIdFilter] :
  /// Specifies the group ID to filter on.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to include in the response. The maximum value
  /// is 100.
  ///
  /// Parameter [nextToken] :
  /// The token from a previous call that you use to retrieve the next set of
  /// results. For example, if a previous call to this action returned 100
  /// items, but you set <code>maxResults</code> to 10. You'll receive a set of
  /// 10 results along with a token. You then use the returned token to retrieve
  /// the next set of 10.
  ///
  /// Parameter [serverCriteria] :
  /// Criteria for filtering servers.
  ///
  /// Parameter [sort] :
  /// Specifies whether to sort by ascending (<code>ASC</code>) or descending
  /// (<code>DESC</code>) order.
  Future<ListServersResponse> listServers({
    String? filterValue,
    List<Group>? groupIdFilter,
    int? maxResults,
    String? nextToken,
    ServerCriteria? serverCriteria,
    SortOrder? sort,
  }) async {
    final $payload = <String, dynamic>{
      if (filterValue != null) 'filterValue': filterValue,
      if (groupIdFilter != null) 'groupIdFilter': groupIdFilter,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (serverCriteria != null) 'serverCriteria': serverCriteria.value,
      if (sort != null) 'sort': sort.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/list-servers',
      exceptionFnMap: _exceptionFns,
    );
    return ListServersResponse.fromJson(response);
  }

  /// Saves the specified migration and modernization preferences.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [applicationMode] :
  /// The classification for application component types.
  ///
  /// Parameter [applicationPreferences] :
  /// The transformation preferences for non-database applications.
  ///
  /// Parameter [databasePreferences] :
  /// The transformation preferences for database applications.
  ///
  /// Parameter [prioritizeBusinessGoals] :
  /// The rank of the business goals based on priority.
  Future<void> putPortfolioPreferences({
    ApplicationMode? applicationMode,
    ApplicationPreferences? applicationPreferences,
    DatabasePreferences? databasePreferences,
    PrioritizeBusinessGoals? prioritizeBusinessGoals,
  }) async {
    final $payload = <String, dynamic>{
      if (applicationMode != null) 'applicationMode': applicationMode.value,
      if (applicationPreferences != null)
        'applicationPreferences': applicationPreferences,
      if (databasePreferences != null)
        'databasePreferences': databasePreferences,
      if (prioritizeBusinessGoals != null)
        'prioritizeBusinessGoals': prioritizeBusinessGoals,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/put-portfolio-preferences',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Starts the assessment of an on-premises environment.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [assessmentDataSourceType] :
  /// The data source type of an assessment to be started.
  ///
  /// Parameter [assessmentTargets] :
  /// List of criteria for assessment.
  ///
  /// Parameter [s3bucketForAnalysisData] :
  /// The S3 bucket used by the collectors to send analysis data to the service.
  /// The bucket name must begin with <code>migrationhub-strategy-</code>.
  ///
  /// Parameter [s3bucketForReportData] :
  /// The S3 bucket where all the reports generated by the service are stored.
  /// The bucket name must begin with <code>migrationhub-strategy-</code>.
  Future<StartAssessmentResponse> startAssessment({
    AssessmentDataSourceType? assessmentDataSourceType,
    List<AssessmentTarget>? assessmentTargets,
    String? s3bucketForAnalysisData,
    String? s3bucketForReportData,
  }) async {
    final $payload = <String, dynamic>{
      if (assessmentDataSourceType != null)
        'assessmentDataSourceType': assessmentDataSourceType.value,
      if (assessmentTargets != null) 'assessmentTargets': assessmentTargets,
      if (s3bucketForAnalysisData != null)
        's3bucketForAnalysisData': s3bucketForAnalysisData,
      if (s3bucketForReportData != null)
        's3bucketForReportData': s3bucketForReportData,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/start-assessment',
      exceptionFnMap: _exceptionFns,
    );
    return StartAssessmentResponse.fromJson(response);
  }

  /// Starts a file import.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [s3Bucket] :
  /// The S3 bucket where the import file is located. The bucket name is
  /// required to begin with <code>migrationhub-strategy-</code>.
  ///
  /// Parameter [name] :
  /// A descriptive name for the request.
  ///
  /// Parameter [s3key] :
  /// The Amazon S3 key name of the import file.
  ///
  /// Parameter [dataSourceType] :
  /// Specifies the source that the servers are coming from. By default,
  /// Strategy Recommendations assumes that the servers specified in the import
  /// file are available in AWS Application Discovery Service.
  ///
  /// Parameter [groupId] :
  /// Groups the resources in the import file together with a unique name. This
  /// ID can be as filter in <code>ListApplicationComponents</code> and
  /// <code>ListServers</code>.
  ///
  /// Parameter [s3bucketForReportData] :
  /// The S3 bucket where Strategy Recommendations uploads import results. The
  /// bucket name is required to begin with migrationhub-strategy-.
  Future<StartImportFileTaskResponse> startImportFileTask({
    required String s3Bucket,
    required String name,
    required String s3key,
    DataSourceType? dataSourceType,
    List<Group>? groupId,
    String? s3bucketForReportData,
  }) async {
    final $payload = <String, dynamic>{
      'S3Bucket': s3Bucket,
      'name': name,
      's3key': s3key,
      if (dataSourceType != null) 'dataSourceType': dataSourceType.value,
      if (groupId != null) 'groupId': groupId,
      if (s3bucketForReportData != null)
        's3bucketForReportData': s3bucketForReportData,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/start-import-file-task',
      exceptionFnMap: _exceptionFns,
    );
    return StartImportFileTaskResponse.fromJson(response);
  }

  /// Starts generating a recommendation report.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [groupIdFilter] :
  /// Groups the resources in the recommendation report with a unique name.
  ///
  /// Parameter [outputFormat] :
  /// The output format for the recommendation report file. The default format
  /// is Microsoft Excel.
  Future<StartRecommendationReportGenerationResponse>
      startRecommendationReportGeneration({
    List<Group>? groupIdFilter,
    OutputFormat? outputFormat,
  }) async {
    final $payload = <String, dynamic>{
      if (groupIdFilter != null) 'groupIdFilter': groupIdFilter,
      if (outputFormat != null) 'outputFormat': outputFormat.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/start-recommendation-report-generation',
      exceptionFnMap: _exceptionFns,
    );
    return StartRecommendationReportGenerationResponse.fromJson(response);
  }

  /// Stops the assessment of an on-premises environment.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [assessmentId] :
  /// The <code>assessmentId</code> returned by <a>StartAssessment</a>.
  Future<void> stopAssessment({
    required String assessmentId,
  }) async {
    final $payload = <String, dynamic>{
      'assessmentId': assessmentId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/stop-assessment',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the configuration of an application component.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [applicationComponentId] :
  /// The ID of the application component. The ID is unique within an AWS
  /// account.
  ///
  /// Parameter [appType] :
  /// The type of known component.
  ///
  /// Parameter [configureOnly] :
  /// Update the configuration request of an application component. If it is set
  /// to true, the source code and/or database credentials are updated. If it is
  /// set to false, the source code and/or database credentials are updated and
  /// an analysis is initiated.
  ///
  /// Parameter [inclusionStatus] :
  /// Indicates whether the application component has been included for server
  /// recommendation or not.
  ///
  /// Parameter [secretsManagerKey] :
  /// Database credentials.
  ///
  /// Parameter [sourceCodeList] :
  /// The list of source code configurations to update for the application
  /// component.
  ///
  /// Parameter [strategyOption] :
  /// The preferred strategy options for the application component. Use values
  /// from the <a>GetApplicationComponentStrategies</a> response.
  Future<void> updateApplicationComponentConfig({
    required String applicationComponentId,
    AppType? appType,
    bool? configureOnly,
    InclusionStatus? inclusionStatus,
    String? secretsManagerKey,
    List<SourceCode>? sourceCodeList,
    StrategyOption? strategyOption,
  }) async {
    final $payload = <String, dynamic>{
      'applicationComponentId': applicationComponentId,
      if (appType != null) 'appType': appType.value,
      if (configureOnly != null) 'configureOnly': configureOnly,
      if (inclusionStatus != null) 'inclusionStatus': inclusionStatus.value,
      if (secretsManagerKey != null) 'secretsManagerKey': secretsManagerKey,
      if (sourceCodeList != null) 'sourceCodeList': sourceCodeList,
      if (strategyOption != null) 'strategyOption': strategyOption,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/update-applicationcomponent-config/',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the configuration of the specified server.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [serverId] :
  /// The ID of the server.
  ///
  /// Parameter [strategyOption] :
  /// The preferred strategy options for the application component. See the
  /// response from <a>GetServerStrategies</a>.
  Future<void> updateServerConfig({
    required String serverId,
    StrategyOption? strategyOption,
  }) async {
    final $payload = <String, dynamic>{
      'serverId': serverId,
      if (strategyOption != null) 'strategyOption': strategyOption,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/update-server-config/',
      exceptionFnMap: _exceptionFns,
    );
  }
}

/// A combination of existing analysis statuses.
class AnalysisStatusUnion {
  /// The status of the analysis.
  final RuntimeAnalysisStatus? runtimeAnalysisStatus;

  /// The status of the source code or database analysis.
  final SrcCodeOrDbAnalysisStatus? srcCodeOrDbAnalysisStatus;

  AnalysisStatusUnion({
    this.runtimeAnalysisStatus,
    this.srcCodeOrDbAnalysisStatus,
  });

  factory AnalysisStatusUnion.fromJson(Map<String, dynamic> json) {
    return AnalysisStatusUnion(
      runtimeAnalysisStatus: (json['runtimeAnalysisStatus'] as String?)
          ?.let(RuntimeAnalysisStatus.fromString),
      srcCodeOrDbAnalysisStatus: (json['srcCodeOrDbAnalysisStatus'] as String?)
          ?.let(SrcCodeOrDbAnalysisStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final runtimeAnalysisStatus = this.runtimeAnalysisStatus;
    final srcCodeOrDbAnalysisStatus = this.srcCodeOrDbAnalysisStatus;
    return {
      if (runtimeAnalysisStatus != null)
        'runtimeAnalysisStatus': runtimeAnalysisStatus.value,
      if (srcCodeOrDbAnalysisStatus != null)
        'srcCodeOrDbAnalysisStatus': srcCodeOrDbAnalysisStatus.value,
    };
  }
}

enum AnalysisType {
  sourceCodeAnalysis('SOURCE_CODE_ANALYSIS'),
  databaseAnalysis('DATABASE_ANALYSIS'),
  runtimeAnalysis('RUNTIME_ANALYSIS'),
  binaryAnalysis('BINARY_ANALYSIS'),
  ;

  final String value;

  const AnalysisType(this.value);

  static AnalysisType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum AnalysisType'));
}

/// Summary information about an analyzable server.
class AnalyzableServerSummary {
  /// The host name of the analyzable server.
  final String? hostname;

  /// The ip address of the analyzable server.
  final String? ipAddress;

  /// The data source of the analyzable server.
  final String? source;

  /// The virtual machine id of the analyzable server.
  final String? vmId;

  AnalyzableServerSummary({
    this.hostname,
    this.ipAddress,
    this.source,
    this.vmId,
  });

  factory AnalyzableServerSummary.fromJson(Map<String, dynamic> json) {
    return AnalyzableServerSummary(
      hostname: json['hostname'] as String?,
      ipAddress: json['ipAddress'] as String?,
      source: json['source'] as String?,
      vmId: json['vmId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final hostname = this.hostname;
    final ipAddress = this.ipAddress;
    final source = this.source;
    final vmId = this.vmId;
    return {
      if (hostname != null) 'hostname': hostname,
      if (ipAddress != null) 'ipAddress': ipAddress,
      if (source != null) 'source': source,
      if (vmId != null) 'vmId': vmId,
    };
  }
}

/// The combination of the existing analyzers.
class AnalyzerNameUnion {
  /// The binary analyzer names.
  final BinaryAnalyzerName? binaryAnalyzerName;

  /// The assessment analyzer names.
  final RunTimeAnalyzerName? runTimeAnalyzerName;

  /// The source code analyzer names.
  final SourceCodeAnalyzerName? sourceCodeAnalyzerName;

  AnalyzerNameUnion({
    this.binaryAnalyzerName,
    this.runTimeAnalyzerName,
    this.sourceCodeAnalyzerName,
  });

  factory AnalyzerNameUnion.fromJson(Map<String, dynamic> json) {
    return AnalyzerNameUnion(
      binaryAnalyzerName: (json['binaryAnalyzerName'] as String?)
          ?.let(BinaryAnalyzerName.fromString),
      runTimeAnalyzerName: (json['runTimeAnalyzerName'] as String?)
          ?.let(RunTimeAnalyzerName.fromString),
      sourceCodeAnalyzerName: (json['sourceCodeAnalyzerName'] as String?)
          ?.let(SourceCodeAnalyzerName.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final binaryAnalyzerName = this.binaryAnalyzerName;
    final runTimeAnalyzerName = this.runTimeAnalyzerName;
    final sourceCodeAnalyzerName = this.sourceCodeAnalyzerName;
    return {
      if (binaryAnalyzerName != null)
        'binaryAnalyzerName': binaryAnalyzerName.value,
      if (runTimeAnalyzerName != null)
        'runTimeAnalyzerName': runTimeAnalyzerName.value,
      if (sourceCodeAnalyzerName != null)
        'sourceCodeAnalyzerName': sourceCodeAnalyzerName.value,
    };
  }
}

/// The anti-pattern report result.
class AntipatternReportResult {
  /// The analyzer name.
  final AnalyzerNameUnion? analyzerName;
  final S3Object? antiPatternReportS3Object;

  /// The status of the anti-pattern report generation.
  final AntipatternReportStatus? antipatternReportStatus;

  /// The status message for the anti-pattern.
  final String? antipatternReportStatusMessage;

  AntipatternReportResult({
    this.analyzerName,
    this.antiPatternReportS3Object,
    this.antipatternReportStatus,
    this.antipatternReportStatusMessage,
  });

  factory AntipatternReportResult.fromJson(Map<String, dynamic> json) {
    return AntipatternReportResult(
      analyzerName: json['analyzerName'] != null
          ? AnalyzerNameUnion.fromJson(
              json['analyzerName'] as Map<String, dynamic>)
          : null,
      antiPatternReportS3Object: json['antiPatternReportS3Object'] != null
          ? S3Object.fromJson(
              json['antiPatternReportS3Object'] as Map<String, dynamic>)
          : null,
      antipatternReportStatus: (json['antipatternReportStatus'] as String?)
          ?.let(AntipatternReportStatus.fromString),
      antipatternReportStatusMessage:
          json['antipatternReportStatusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final analyzerName = this.analyzerName;
    final antiPatternReportS3Object = this.antiPatternReportS3Object;
    final antipatternReportStatus = this.antipatternReportStatus;
    final antipatternReportStatusMessage = this.antipatternReportStatusMessage;
    return {
      if (analyzerName != null) 'analyzerName': analyzerName,
      if (antiPatternReportS3Object != null)
        'antiPatternReportS3Object': antiPatternReportS3Object,
      if (antipatternReportStatus != null)
        'antipatternReportStatus': antipatternReportStatus.value,
      if (antipatternReportStatusMessage != null)
        'antipatternReportStatusMessage': antipatternReportStatusMessage,
    };
  }
}

enum AntipatternReportStatus {
  failed('FAILED'),
  inProgress('IN_PROGRESS'),
  success('SUCCESS'),
  ;

  final String value;

  const AntipatternReportStatus(this.value);

  static AntipatternReportStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum AntipatternReportStatus'));
}

/// Contains the summary of anti-patterns and their severity.
class AntipatternSeveritySummary {
  /// Contains the count of anti-patterns.
  final int? count;

  /// Contains the severity of anti-patterns.
  final Severity? severity;

  AntipatternSeveritySummary({
    this.count,
    this.severity,
  });

  factory AntipatternSeveritySummary.fromJson(Map<String, dynamic> json) {
    return AntipatternSeveritySummary(
      count: json['count'] as int?,
      severity: (json['severity'] as String?)?.let(Severity.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final count = this.count;
    final severity = this.severity;
    return {
      if (count != null) 'count': count,
      if (severity != null) 'severity': severity.value,
    };
  }
}

enum AppType {
  dotNetFramework('DotNetFramework'),
  java('Java'),
  sQLServer('SQLServer'),
  iis('IIS'),
  oracle('Oracle'),
  other('Other'),
  tomcat('Tomcat'),
  jBoss('JBoss'),
  spring('Spring'),
  mongoDb('Mongo DB'),
  db2('DB2'),
  mariaDb('Maria DB'),
  mySQL('MySQL'),
  sybase('Sybase'),
  postgreSQLServer('PostgreSQLServer'),
  cassandra('Cassandra'),
  ibmWebSphere('IBM WebSphere'),
  oracleWebLogic('Oracle WebLogic'),
  visualBasic('Visual Basic'),
  unknown('Unknown'),
  dotnetCore('DotnetCore'),
  dotnet('Dotnet'),
  ;

  final String value;

  const AppType(this.value);

  static AppType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception('$value is not known in enum AppType'));
}

/// Error in the analysis of the application unit.
class AppUnitError {
  /// The category of the error.
  final AppUnitErrorCategory? appUnitErrorCategory;

  AppUnitError({
    this.appUnitErrorCategory,
  });

  factory AppUnitError.fromJson(Map<String, dynamic> json) {
    return AppUnitError(
      appUnitErrorCategory: (json['appUnitErrorCategory'] as String?)
          ?.let(AppUnitErrorCategory.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final appUnitErrorCategory = this.appUnitErrorCategory;
    return {
      if (appUnitErrorCategory != null)
        'appUnitErrorCategory': appUnitErrorCategory.value,
    };
  }
}

enum AppUnitErrorCategory {
  credentialError('CREDENTIAL_ERROR'),
  connectivityError('CONNECTIVITY_ERROR'),
  permissionError('PERMISSION_ERROR'),
  unsupportedError('UNSUPPORTED_ERROR'),
  otherError('OTHER_ERROR'),
  ;

  final String value;

  const AppUnitErrorCategory(this.value);

  static AppUnitErrorCategory fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum AppUnitErrorCategory'));
}

enum ApplicationComponentCriteria {
  notDefined('NOT_DEFINED'),
  appName('APP_NAME'),
  serverId('SERVER_ID'),
  appType('APP_TYPE'),
  strategy('STRATEGY'),
  destination('DESTINATION'),
  analysisStatus('ANALYSIS_STATUS'),
  errorCategory('ERROR_CATEGORY'),
  ;

  final String value;

  const ApplicationComponentCriteria(this.value);

  static ApplicationComponentCriteria fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum ApplicationComponentCriteria'));
}

/// Contains detailed information about an application component.
class ApplicationComponentDetail {
  /// The status of analysis, if the application component has source code or an
  /// associated database.
  final SrcCodeOrDbAnalysisStatus? analysisStatus;

  /// The S3 bucket name and the Amazon S3 key name for the anti-pattern report.
  final S3Object? antipatternReportS3Object;

  /// The status of the anti-pattern report generation.
  final AntipatternReportStatus? antipatternReportStatus;

  /// The status message for the anti-pattern.
  final String? antipatternReportStatusMessage;

  /// The type of application component.
  final AppType? appType;

  /// The error in the analysis of the source code or database.
  final AppUnitError? appUnitError;

  /// The ID of the server that the application component is running on.
  final String? associatedServerId;

  /// Configuration details for the database associated with the application
  /// component.
  final DatabaseConfigDetail? databaseConfigDetail;

  /// The ID of the application component.
  final String? id;

  /// Indicates whether the application component has been included for server
  /// recommendation or not.
  final InclusionStatus? inclusionStatus;

  /// The timestamp of when the application component was assessed.
  final DateTime? lastAnalyzedTimestamp;

  /// A list of anti-pattern severity summaries.
  final List<AntipatternSeveritySummary>? listAntipatternSeveritySummary;

  /// Set to true if the application component is running on multiple servers.
  final bool? moreServerAssociationExists;

  /// The name of application component.
  final String? name;

  /// OS driver.
  final String? osDriver;

  /// OS version.
  final String? osVersion;

  /// The top recommendation set for the application component.
  final RecommendationSet? recommendationSet;

  /// The application component subtype.
  final ResourceSubType? resourceSubType;

  /// A list of the analysis results.
  final List<Result>? resultList;

  /// The status of the application unit.
  final RuntimeAnalysisStatus? runtimeStatus;

  /// The status message for the application unit.
  final String? runtimeStatusMessage;

  /// Details about the source code repository associated with the application
  /// component.
  final List<SourceCodeRepository>? sourceCodeRepositories;

  /// A detailed description of the analysis status and any failure message.
  final String? statusMessage;

  ApplicationComponentDetail({
    this.analysisStatus,
    this.antipatternReportS3Object,
    this.antipatternReportStatus,
    this.antipatternReportStatusMessage,
    this.appType,
    this.appUnitError,
    this.associatedServerId,
    this.databaseConfigDetail,
    this.id,
    this.inclusionStatus,
    this.lastAnalyzedTimestamp,
    this.listAntipatternSeveritySummary,
    this.moreServerAssociationExists,
    this.name,
    this.osDriver,
    this.osVersion,
    this.recommendationSet,
    this.resourceSubType,
    this.resultList,
    this.runtimeStatus,
    this.runtimeStatusMessage,
    this.sourceCodeRepositories,
    this.statusMessage,
  });

  factory ApplicationComponentDetail.fromJson(Map<String, dynamic> json) {
    return ApplicationComponentDetail(
      analysisStatus: (json['analysisStatus'] as String?)
          ?.let(SrcCodeOrDbAnalysisStatus.fromString),
      antipatternReportS3Object: json['antipatternReportS3Object'] != null
          ? S3Object.fromJson(
              json['antipatternReportS3Object'] as Map<String, dynamic>)
          : null,
      antipatternReportStatus: (json['antipatternReportStatus'] as String?)
          ?.let(AntipatternReportStatus.fromString),
      antipatternReportStatusMessage:
          json['antipatternReportStatusMessage'] as String?,
      appType: (json['appType'] as String?)?.let(AppType.fromString),
      appUnitError: json['appUnitError'] != null
          ? AppUnitError.fromJson(json['appUnitError'] as Map<String, dynamic>)
          : null,
      associatedServerId: json['associatedServerId'] as String?,
      databaseConfigDetail: json['databaseConfigDetail'] != null
          ? DatabaseConfigDetail.fromJson(
              json['databaseConfigDetail'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
      inclusionStatus:
          (json['inclusionStatus'] as String?)?.let(InclusionStatus.fromString),
      lastAnalyzedTimestamp: timeStampFromJson(json['lastAnalyzedTimestamp']),
      listAntipatternSeveritySummary: (json['listAntipatternSeveritySummary']
              as List?)
          ?.nonNulls
          .map((e) =>
              AntipatternSeveritySummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      moreServerAssociationExists: json['moreServerAssociationExists'] as bool?,
      name: json['name'] as String?,
      osDriver: json['osDriver'] as String?,
      osVersion: json['osVersion'] as String?,
      recommendationSet: json['recommendationSet'] != null
          ? RecommendationSet.fromJson(
              json['recommendationSet'] as Map<String, dynamic>)
          : null,
      resourceSubType:
          (json['resourceSubType'] as String?)?.let(ResourceSubType.fromString),
      resultList: (json['resultList'] as List?)
          ?.nonNulls
          .map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
      runtimeStatus: (json['runtimeStatus'] as String?)
          ?.let(RuntimeAnalysisStatus.fromString),
      runtimeStatusMessage: json['runtimeStatusMessage'] as String?,
      sourceCodeRepositories: (json['sourceCodeRepositories'] as List?)
          ?.nonNulls
          .map((e) => SourceCodeRepository.fromJson(e as Map<String, dynamic>))
          .toList(),
      statusMessage: json['statusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final analysisStatus = this.analysisStatus;
    final antipatternReportS3Object = this.antipatternReportS3Object;
    final antipatternReportStatus = this.antipatternReportStatus;
    final antipatternReportStatusMessage = this.antipatternReportStatusMessage;
    final appType = this.appType;
    final appUnitError = this.appUnitError;
    final associatedServerId = this.associatedServerId;
    final databaseConfigDetail = this.databaseConfigDetail;
    final id = this.id;
    final inclusionStatus = this.inclusionStatus;
    final lastAnalyzedTimestamp = this.lastAnalyzedTimestamp;
    final listAntipatternSeveritySummary = this.listAntipatternSeveritySummary;
    final moreServerAssociationExists = this.moreServerAssociationExists;
    final name = this.name;
    final osDriver = this.osDriver;
    final osVersion = this.osVersion;
    final recommendationSet = this.recommendationSet;
    final resourceSubType = this.resourceSubType;
    final resultList = this.resultList;
    final runtimeStatus = this.runtimeStatus;
    final runtimeStatusMessage = this.runtimeStatusMessage;
    final sourceCodeRepositories = this.sourceCodeRepositories;
    final statusMessage = this.statusMessage;
    return {
      if (analysisStatus != null) 'analysisStatus': analysisStatus.value,
      if (antipatternReportS3Object != null)
        'antipatternReportS3Object': antipatternReportS3Object,
      if (antipatternReportStatus != null)
        'antipatternReportStatus': antipatternReportStatus.value,
      if (antipatternReportStatusMessage != null)
        'antipatternReportStatusMessage': antipatternReportStatusMessage,
      if (appType != null) 'appType': appType.value,
      if (appUnitError != null) 'appUnitError': appUnitError,
      if (associatedServerId != null) 'associatedServerId': associatedServerId,
      if (databaseConfigDetail != null)
        'databaseConfigDetail': databaseConfigDetail,
      if (id != null) 'id': id,
      if (inclusionStatus != null) 'inclusionStatus': inclusionStatus.value,
      if (lastAnalyzedTimestamp != null)
        'lastAnalyzedTimestamp': unixTimestampToJson(lastAnalyzedTimestamp),
      if (listAntipatternSeveritySummary != null)
        'listAntipatternSeveritySummary': listAntipatternSeveritySummary,
      if (moreServerAssociationExists != null)
        'moreServerAssociationExists': moreServerAssociationExists,
      if (name != null) 'name': name,
      if (osDriver != null) 'osDriver': osDriver,
      if (osVersion != null) 'osVersion': osVersion,
      if (recommendationSet != null) 'recommendationSet': recommendationSet,
      if (resourceSubType != null) 'resourceSubType': resourceSubType.value,
      if (resultList != null) 'resultList': resultList,
      if (runtimeStatus != null) 'runtimeStatus': runtimeStatus.value,
      if (runtimeStatusMessage != null)
        'runtimeStatusMessage': runtimeStatusMessage,
      if (sourceCodeRepositories != null)
        'sourceCodeRepositories': sourceCodeRepositories,
      if (statusMessage != null) 'statusMessage': statusMessage,
    };
  }
}

/// Summary of the analysis status of the application component.
class ApplicationComponentStatusSummary {
  /// The number of application components successfully analyzed, partially
  /// successful or failed analysis.
  final int? count;

  /// The status of database analysis.
  final SrcCodeOrDbAnalysisStatus? srcCodeOrDbAnalysisStatus;

  ApplicationComponentStatusSummary({
    this.count,
    this.srcCodeOrDbAnalysisStatus,
  });

  factory ApplicationComponentStatusSummary.fromJson(
      Map<String, dynamic> json) {
    return ApplicationComponentStatusSummary(
      count: json['count'] as int?,
      srcCodeOrDbAnalysisStatus: (json['srcCodeOrDbAnalysisStatus'] as String?)
          ?.let(SrcCodeOrDbAnalysisStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final count = this.count;
    final srcCodeOrDbAnalysisStatus = this.srcCodeOrDbAnalysisStatus;
    return {
      if (count != null) 'count': count,
      if (srcCodeOrDbAnalysisStatus != null)
        'srcCodeOrDbAnalysisStatus': srcCodeOrDbAnalysisStatus.value,
    };
  }
}

/// Contains information about a strategy recommendation for an application
/// component.
class ApplicationComponentStrategy {
  /// Set to true if the recommendation is set as preferred.
  final bool? isPreferred;

  /// Strategy recommendation for the application component.
  final RecommendationSet? recommendation;

  /// The recommendation status of a strategy for an application component.
  final StrategyRecommendation? status;

  ApplicationComponentStrategy({
    this.isPreferred,
    this.recommendation,
    this.status,
  });

  factory ApplicationComponentStrategy.fromJson(Map<String, dynamic> json) {
    return ApplicationComponentStrategy(
      isPreferred: json['isPreferred'] as bool?,
      recommendation: json['recommendation'] != null
          ? RecommendationSet.fromJson(
              json['recommendation'] as Map<String, dynamic>)
          : null,
      status:
          (json['status'] as String?)?.let(StrategyRecommendation.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final isPreferred = this.isPreferred;
    final recommendation = this.recommendation;
    final status = this.status;
    return {
      if (isPreferred != null) 'isPreferred': isPreferred,
      if (recommendation != null) 'recommendation': recommendation,
      if (status != null) 'status': status.value,
    };
  }
}

/// Contains the summary of application components.
class ApplicationComponentSummary {
  /// Contains the name of application types.
  final AppType? appType;

  /// Contains the count of application type.
  final int? count;

  ApplicationComponentSummary({
    this.appType,
    this.count,
  });

  factory ApplicationComponentSummary.fromJson(Map<String, dynamic> json) {
    return ApplicationComponentSummary(
      appType: (json['appType'] as String?)?.let(AppType.fromString),
      count: json['count'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final appType = this.appType;
    final count = this.count;
    return {
      if (appType != null) 'appType': appType.value,
      if (count != null) 'count': count,
    };
  }
}

enum ApplicationMode {
  all('ALL'),
  known('KNOWN'),
  unknown('UNKNOWN'),
  ;

  final String value;

  const ApplicationMode(this.value);

  static ApplicationMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum ApplicationMode'));
}

/// Application preferences that you specify.
class ApplicationPreferences {
  /// Application preferences that you specify to prefer managed environment.
  final ManagementPreference? managementPreference;

  ApplicationPreferences({
    this.managementPreference,
  });

  factory ApplicationPreferences.fromJson(Map<String, dynamic> json) {
    return ApplicationPreferences(
      managementPreference: json['managementPreference'] != null
          ? ManagementPreference.fromJson(
              json['managementPreference'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final managementPreference = this.managementPreference;
    return {
      if (managementPreference != null)
        'managementPreference': managementPreference,
    };
  }
}

enum AssessmentDataSourceType {
  strategyRecommendationsApplicationDataCollector(
      'StrategyRecommendationsApplicationDataCollector'),
  manualImport('ManualImport'),
  applicationDiscoveryService('ApplicationDiscoveryService'),
  ;

  final String value;

  const AssessmentDataSourceType(this.value);

  static AssessmentDataSourceType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum AssessmentDataSourceType'));
}

enum AssessmentStatus {
  inProgress('IN_PROGRESS'),
  complete('COMPLETE'),
  failed('FAILED'),
  stopped('STOPPED'),
  ;

  final String value;

  const AssessmentStatus(this.value);

  static AssessmentStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum AssessmentStatus'));
}

/// Contains the summary of the assessment results.
class AssessmentSummary {
  /// The Amazon S3 object containing the anti-pattern report.
  final S3Object? antipatternReportS3Object;

  /// The status of the anti-pattern report.
  final AntipatternReportStatus? antipatternReportStatus;

  /// The status message of the anti-pattern report.
  final String? antipatternReportStatusMessage;

  /// The time the assessment was performed.
  final DateTime? lastAnalyzedTimestamp;

  /// List of AntipatternSeveritySummary.
  final List<AntipatternSeveritySummary>? listAntipatternSeveritySummary;

  /// List of status summaries of the analyzed application components.
  final List<ApplicationComponentStatusSummary>?
      listApplicationComponentStatusSummary;

  /// List of ApplicationComponentStrategySummary.
  final List<StrategySummary>? listApplicationComponentStrategySummary;

  /// List of ApplicationComponentSummary.
  final List<ApplicationComponentSummary>? listApplicationComponentSummary;

  /// List of status summaries of the analyzed servers.
  final List<ServerStatusSummary>? listServerStatusSummary;

  /// List of ServerStrategySummary.
  final List<StrategySummary>? listServerStrategySummary;

  /// List of ServerSummary.
  final List<ServerSummary>? listServerSummary;

  AssessmentSummary({
    this.antipatternReportS3Object,
    this.antipatternReportStatus,
    this.antipatternReportStatusMessage,
    this.lastAnalyzedTimestamp,
    this.listAntipatternSeveritySummary,
    this.listApplicationComponentStatusSummary,
    this.listApplicationComponentStrategySummary,
    this.listApplicationComponentSummary,
    this.listServerStatusSummary,
    this.listServerStrategySummary,
    this.listServerSummary,
  });

  factory AssessmentSummary.fromJson(Map<String, dynamic> json) {
    return AssessmentSummary(
      antipatternReportS3Object: json['antipatternReportS3Object'] != null
          ? S3Object.fromJson(
              json['antipatternReportS3Object'] as Map<String, dynamic>)
          : null,
      antipatternReportStatus: (json['antipatternReportStatus'] as String?)
          ?.let(AntipatternReportStatus.fromString),
      antipatternReportStatusMessage:
          json['antipatternReportStatusMessage'] as String?,
      lastAnalyzedTimestamp: timeStampFromJson(json['lastAnalyzedTimestamp']),
      listAntipatternSeveritySummary: (json['listAntipatternSeveritySummary']
              as List?)
          ?.nonNulls
          .map((e) =>
              AntipatternSeveritySummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      listApplicationComponentStatusSummary:
          (json['listApplicationComponentStatusSummary'] as List?)
              ?.nonNulls
              .map((e) => ApplicationComponentStatusSummary.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      listApplicationComponentStrategySummary:
          (json['listApplicationComponentStrategySummary'] as List?)
              ?.nonNulls
              .map((e) => StrategySummary.fromJson(e as Map<String, dynamic>))
              .toList(),
      listApplicationComponentSummary: (json['listApplicationComponentSummary']
              as List?)
          ?.nonNulls
          .map((e) =>
              ApplicationComponentSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      listServerStatusSummary: (json['listServerStatusSummary'] as List?)
          ?.nonNulls
          .map((e) => ServerStatusSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      listServerStrategySummary: (json['listServerStrategySummary'] as List?)
          ?.nonNulls
          .map((e) => StrategySummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      listServerSummary: (json['listServerSummary'] as List?)
          ?.nonNulls
          .map((e) => ServerSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final antipatternReportS3Object = this.antipatternReportS3Object;
    final antipatternReportStatus = this.antipatternReportStatus;
    final antipatternReportStatusMessage = this.antipatternReportStatusMessage;
    final lastAnalyzedTimestamp = this.lastAnalyzedTimestamp;
    final listAntipatternSeveritySummary = this.listAntipatternSeveritySummary;
    final listApplicationComponentStatusSummary =
        this.listApplicationComponentStatusSummary;
    final listApplicationComponentStrategySummary =
        this.listApplicationComponentStrategySummary;
    final listApplicationComponentSummary =
        this.listApplicationComponentSummary;
    final listServerStatusSummary = this.listServerStatusSummary;
    final listServerStrategySummary = this.listServerStrategySummary;
    final listServerSummary = this.listServerSummary;
    return {
      if (antipatternReportS3Object != null)
        'antipatternReportS3Object': antipatternReportS3Object,
      if (antipatternReportStatus != null)
        'antipatternReportStatus': antipatternReportStatus.value,
      if (antipatternReportStatusMessage != null)
        'antipatternReportStatusMessage': antipatternReportStatusMessage,
      if (lastAnalyzedTimestamp != null)
        'lastAnalyzedTimestamp': unixTimestampToJson(lastAnalyzedTimestamp),
      if (listAntipatternSeveritySummary != null)
        'listAntipatternSeveritySummary': listAntipatternSeveritySummary,
      if (listApplicationComponentStatusSummary != null)
        'listApplicationComponentStatusSummary':
            listApplicationComponentStatusSummary,
      if (listApplicationComponentStrategySummary != null)
        'listApplicationComponentStrategySummary':
            listApplicationComponentStrategySummary,
      if (listApplicationComponentSummary != null)
        'listApplicationComponentSummary': listApplicationComponentSummary,
      if (listServerStatusSummary != null)
        'listServerStatusSummary': listServerStatusSummary,
      if (listServerStrategySummary != null)
        'listServerStrategySummary': listServerStrategySummary,
      if (listServerSummary != null) 'listServerSummary': listServerSummary,
    };
  }
}

/// Defines the criteria of assessment.
class AssessmentTarget {
  /// Condition of an assessment.
  final Condition condition;

  /// Name of an assessment.
  final String name;

  /// Values of an assessment.
  final List<String> values;

  AssessmentTarget({
    required this.condition,
    required this.name,
    required this.values,
  });

  factory AssessmentTarget.fromJson(Map<String, dynamic> json) {
    return AssessmentTarget(
      condition: Condition.fromString((json['condition'] as String)),
      name: json['name'] as String,
      values:
          (json['values'] as List).nonNulls.map((e) => e as String).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final condition = this.condition;
    final name = this.name;
    final values = this.values;
    return {
      'condition': condition.value,
      'name': name,
      'values': values,
    };
  }
}

/// Object containing details about applications as defined in Application
/// Discovery Service.
class AssociatedApplication {
  /// ID of the application as defined in Application Discovery Service.
  final String? id;

  /// Name of the application as defined in Application Discovery Service.
  final String? name;

  AssociatedApplication({
    this.id,
    this.name,
  });

  factory AssociatedApplication.fromJson(Map<String, dynamic> json) {
    return AssociatedApplication(
      id: json['id'] as String?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final name = this.name;
    return {
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    };
  }
}

enum AuthType {
  ntlm('NTLM'),
  ssh('SSH'),
  cert('CERT'),
  ;

  final String value;

  const AuthType(this.value);

  static AuthType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum AuthType'));
}

/// Object containing the choice of application destination that you specify.
class AwsManagedResources {
  /// The choice of application destination that you specify.
  final List<AwsManagedTargetDestination> targetDestination;

  AwsManagedResources({
    required this.targetDestination,
  });

  factory AwsManagedResources.fromJson(Map<String, dynamic> json) {
    return AwsManagedResources(
      targetDestination: (json['targetDestination'] as List)
          .nonNulls
          .map((e) => AwsManagedTargetDestination.fromString((e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final targetDestination = this.targetDestination;
    return {
      'targetDestination': targetDestination.map((e) => e.value).toList(),
    };
  }
}

enum AwsManagedTargetDestination {
  noneSpecified('None specified'),
  awsElasticBeanStalk('AWS Elastic BeanStalk'),
  awsFargate('AWS Fargate'),
  ;

  final String value;

  const AwsManagedTargetDestination(this.value);

  static AwsManagedTargetDestination fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum AwsManagedTargetDestination'));
}

enum BinaryAnalyzerName {
  dllAnalyzer('DLL_ANALYZER'),
  bytecodeAnalyzer('BYTECODE_ANALYZER'),
  ;

  final String value;

  const BinaryAnalyzerName(this.value);

  static BinaryAnalyzerName fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum BinaryAnalyzerName'));
}

/// Business goals that you specify.
class BusinessGoals {
  /// Business goal to reduce license costs.
  final int? licenseCostReduction;

  /// Business goal to modernize infrastructure by moving to cloud native
  /// technologies.
  final int? modernizeInfrastructureWithCloudNativeTechnologies;

  /// Business goal to reduce the operational overhead on the team by moving into
  /// managed services.
  final int? reduceOperationalOverheadWithManagedServices;

  /// Business goal to achieve migration at a fast pace.
  final int? speedOfMigration;

  BusinessGoals({
    this.licenseCostReduction,
    this.modernizeInfrastructureWithCloudNativeTechnologies,
    this.reduceOperationalOverheadWithManagedServices,
    this.speedOfMigration,
  });

  factory BusinessGoals.fromJson(Map<String, dynamic> json) {
    return BusinessGoals(
      licenseCostReduction: json['licenseCostReduction'] as int?,
      modernizeInfrastructureWithCloudNativeTechnologies:
          json['modernizeInfrastructureWithCloudNativeTechnologies'] as int?,
      reduceOperationalOverheadWithManagedServices:
          json['reduceOperationalOverheadWithManagedServices'] as int?,
      speedOfMigration: json['speedOfMigration'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final licenseCostReduction = this.licenseCostReduction;
    final modernizeInfrastructureWithCloudNativeTechnologies =
        this.modernizeInfrastructureWithCloudNativeTechnologies;
    final reduceOperationalOverheadWithManagedServices =
        this.reduceOperationalOverheadWithManagedServices;
    final speedOfMigration = this.speedOfMigration;
    return {
      if (licenseCostReduction != null)
        'licenseCostReduction': licenseCostReduction,
      if (modernizeInfrastructureWithCloudNativeTechnologies != null)
        'modernizeInfrastructureWithCloudNativeTechnologies':
            modernizeInfrastructureWithCloudNativeTechnologies,
      if (reduceOperationalOverheadWithManagedServices != null)
        'reduceOperationalOverheadWithManagedServices':
            reduceOperationalOverheadWithManagedServices,
      if (speedOfMigration != null) 'speedOfMigration': speedOfMigration,
    };
  }
}

/// Process data collector that runs in the environment that you specify.
class Collector {
  /// Indicates the health of a collector.
  final CollectorHealth? collectorHealth;

  /// The ID of the collector.
  final String? collectorId;

  /// Current version of the collector that is running in the environment that you
  /// specify.
  final String? collectorVersion;

  /// Summary of the collector configuration.
  final ConfigurationSummary? configurationSummary;

  /// Hostname of the server that is hosting the collector.
  final String? hostName;

  /// IP address of the server that is hosting the collector.
  final String? ipAddress;

  /// Time when the collector last pinged the service.
  final String? lastActivityTimeStamp;

  /// Time when the collector registered with the service.
  final String? registeredTimeStamp;

  Collector({
    this.collectorHealth,
    this.collectorId,
    this.collectorVersion,
    this.configurationSummary,
    this.hostName,
    this.ipAddress,
    this.lastActivityTimeStamp,
    this.registeredTimeStamp,
  });

  factory Collector.fromJson(Map<String, dynamic> json) {
    return Collector(
      collectorHealth:
          (json['collectorHealth'] as String?)?.let(CollectorHealth.fromString),
      collectorId: json['collectorId'] as String?,
      collectorVersion: json['collectorVersion'] as String?,
      configurationSummary: json['configurationSummary'] != null
          ? ConfigurationSummary.fromJson(
              json['configurationSummary'] as Map<String, dynamic>)
          : null,
      hostName: json['hostName'] as String?,
      ipAddress: json['ipAddress'] as String?,
      lastActivityTimeStamp: json['lastActivityTimeStamp'] as String?,
      registeredTimeStamp: json['registeredTimeStamp'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final collectorHealth = this.collectorHealth;
    final collectorId = this.collectorId;
    final collectorVersion = this.collectorVersion;
    final configurationSummary = this.configurationSummary;
    final hostName = this.hostName;
    final ipAddress = this.ipAddress;
    final lastActivityTimeStamp = this.lastActivityTimeStamp;
    final registeredTimeStamp = this.registeredTimeStamp;
    return {
      if (collectorHealth != null) 'collectorHealth': collectorHealth.value,
      if (collectorId != null) 'collectorId': collectorId,
      if (collectorVersion != null) 'collectorVersion': collectorVersion,
      if (configurationSummary != null)
        'configurationSummary': configurationSummary,
      if (hostName != null) 'hostName': hostName,
      if (ipAddress != null) 'ipAddress': ipAddress,
      if (lastActivityTimeStamp != null)
        'lastActivityTimeStamp': lastActivityTimeStamp,
      if (registeredTimeStamp != null)
        'registeredTimeStamp': registeredTimeStamp,
    };
  }
}

enum CollectorHealth {
  collectorHealthy('COLLECTOR_HEALTHY'),
  collectorUnhealthy('COLLECTOR_UNHEALTHY'),
  ;

  final String value;

  const CollectorHealth(this.value);

  static CollectorHealth fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum CollectorHealth'));
}

enum Condition {
  equals('EQUALS'),
  notEquals('NOT_EQUALS'),
  contains('CONTAINS'),
  notContains('NOT_CONTAINS'),
  ;

  final String value;

  const Condition(this.value);

  static Condition fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum Condition'));
}

/// Summary of the collector configuration.
class ConfigurationSummary {
  /// IP address based configurations.
  final List<IPAddressBasedRemoteInfo>? ipAddressBasedRemoteInfoList;

  /// The list of pipeline info configurations.
  final List<PipelineInfo>? pipelineInfoList;

  /// Info about the remote server source code configuration.
  final RemoteSourceCodeAnalysisServerInfo? remoteSourceCodeAnalysisServerInfo;

  /// The list of vCenter configurations.
  final List<VcenterBasedRemoteInfo>? vcenterBasedRemoteInfoList;

  /// The list of the version control configurations.
  final List<VersionControlInfo>? versionControlInfoList;

  ConfigurationSummary({
    this.ipAddressBasedRemoteInfoList,
    this.pipelineInfoList,
    this.remoteSourceCodeAnalysisServerInfo,
    this.vcenterBasedRemoteInfoList,
    this.versionControlInfoList,
  });

  factory ConfigurationSummary.fromJson(Map<String, dynamic> json) {
    return ConfigurationSummary(
      ipAddressBasedRemoteInfoList:
          (json['ipAddressBasedRemoteInfoList'] as List?)
              ?.nonNulls
              .map((e) =>
                  IPAddressBasedRemoteInfo.fromJson(e as Map<String, dynamic>))
              .toList(),
      pipelineInfoList: (json['pipelineInfoList'] as List?)
          ?.nonNulls
          .map((e) => PipelineInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      remoteSourceCodeAnalysisServerInfo:
          json['remoteSourceCodeAnalysisServerInfo'] != null
              ? RemoteSourceCodeAnalysisServerInfo.fromJson(
                  json['remoteSourceCodeAnalysisServerInfo']
                      as Map<String, dynamic>)
              : null,
      vcenterBasedRemoteInfoList: (json['vcenterBasedRemoteInfoList'] as List?)
          ?.nonNulls
          .map(
              (e) => VcenterBasedRemoteInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      versionControlInfoList: (json['versionControlInfoList'] as List?)
          ?.nonNulls
          .map((e) => VersionControlInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final ipAddressBasedRemoteInfoList = this.ipAddressBasedRemoteInfoList;
    final pipelineInfoList = this.pipelineInfoList;
    final remoteSourceCodeAnalysisServerInfo =
        this.remoteSourceCodeAnalysisServerInfo;
    final vcenterBasedRemoteInfoList = this.vcenterBasedRemoteInfoList;
    final versionControlInfoList = this.versionControlInfoList;
    return {
      if (ipAddressBasedRemoteInfoList != null)
        'ipAddressBasedRemoteInfoList': ipAddressBasedRemoteInfoList,
      if (pipelineInfoList != null) 'pipelineInfoList': pipelineInfoList,
      if (remoteSourceCodeAnalysisServerInfo != null)
        'remoteSourceCodeAnalysisServerInfo':
            remoteSourceCodeAnalysisServerInfo,
      if (vcenterBasedRemoteInfoList != null)
        'vcenterBasedRemoteInfoList': vcenterBasedRemoteInfoList,
      if (versionControlInfoList != null)
        'versionControlInfoList': versionControlInfoList,
    };
  }
}

/// Detailed information about an assessment.
class DataCollectionDetails {
  /// The time the assessment completes.
  final DateTime? completionTime;

  /// The number of failed servers in the assessment.
  final int? failed;

  /// The number of servers with the assessment status <code>IN_PROGESS</code>.
  final int? inProgress;

  /// The total number of servers in the assessment.
  final int? servers;

  /// The start time of assessment.
  final DateTime? startTime;

  /// The status of the assessment.
  final AssessmentStatus? status;

  /// The status message of the assessment.
  final String? statusMessage;

  /// The number of successful servers in the assessment.
  final int? success;

  DataCollectionDetails({
    this.completionTime,
    this.failed,
    this.inProgress,
    this.servers,
    this.startTime,
    this.status,
    this.statusMessage,
    this.success,
  });

  factory DataCollectionDetails.fromJson(Map<String, dynamic> json) {
    return DataCollectionDetails(
      completionTime: timeStampFromJson(json['completionTime']),
      failed: json['failed'] as int?,
      inProgress: json['inProgress'] as int?,
      servers: json['servers'] as int?,
      startTime: timeStampFromJson(json['startTime']),
      status: (json['status'] as String?)?.let(AssessmentStatus.fromString),
      statusMessage: json['statusMessage'] as String?,
      success: json['success'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final completionTime = this.completionTime;
    final failed = this.failed;
    final inProgress = this.inProgress;
    final servers = this.servers;
    final startTime = this.startTime;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final success = this.success;
    return {
      if (completionTime != null)
        'completionTime': unixTimestampToJson(completionTime),
      if (failed != null) 'failed': failed,
      if (inProgress != null) 'inProgress': inProgress,
      if (servers != null) 'servers': servers,
      if (startTime != null) 'startTime': unixTimestampToJson(startTime),
      if (status != null) 'status': status.value,
      if (statusMessage != null) 'statusMessage': statusMessage,
      if (success != null) 'success': success,
    };
  }
}

enum DataSourceType {
  applicationDiscoveryService('ApplicationDiscoveryService'),
  mpa('MPA'),
  import('Import'),
  strategyRecommendationsApplicationDataCollector(
      'StrategyRecommendationsApplicationDataCollector'),
  ;

  final String value;

  const DataSourceType(this.value);

  static DataSourceType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum DataSourceType'));
}

/// Configuration information used for assessing databases.
class DatabaseConfigDetail {
  /// AWS Secrets Manager key that holds the credentials that you use to connect
  /// to a database.
  final String? secretName;

  DatabaseConfigDetail({
    this.secretName,
  });

  factory DatabaseConfigDetail.fromJson(Map<String, dynamic> json) {
    return DatabaseConfigDetail(
      secretName: json['secretName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final secretName = this.secretName;
    return {
      if (secretName != null) 'secretName': secretName,
    };
  }
}

enum DatabaseManagementPreference {
  awsManaged('AWS-managed'),
  selfManage('Self-manage'),
  noPreference('No preference'),
  ;

  final String value;

  const DatabaseManagementPreference(this.value);

  static DatabaseManagementPreference fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum DatabaseManagementPreference'));
}

/// Preferences for migrating a database to AWS.
class DatabaseMigrationPreference {
  /// Indicates whether you are interested in moving from one type of database to
  /// another. For example, from SQL Server to Amazon Aurora MySQL-Compatible
  /// Edition.
  final Heterogeneous? heterogeneous;

  /// Indicates whether you are interested in moving to the same type of database
  /// into AWS. For example, from SQL Server in your environment to SQL Server on
  /// AWS.
  final Homogeneous? homogeneous;

  /// Indicated that you do not prefer heterogeneous or homogeneous.
  final NoDatabaseMigrationPreference? noPreference;

  DatabaseMigrationPreference({
    this.heterogeneous,
    this.homogeneous,
    this.noPreference,
  });

  factory DatabaseMigrationPreference.fromJson(Map<String, dynamic> json) {
    return DatabaseMigrationPreference(
      heterogeneous: json['heterogeneous'] != null
          ? Heterogeneous.fromJson(
              json['heterogeneous'] as Map<String, dynamic>)
          : null,
      homogeneous: json['homogeneous'] != null
          ? Homogeneous.fromJson(json['homogeneous'] as Map<String, dynamic>)
          : null,
      noPreference: json['noPreference'] != null
          ? NoDatabaseMigrationPreference.fromJson(
              json['noPreference'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final heterogeneous = this.heterogeneous;
    final homogeneous = this.homogeneous;
    final noPreference = this.noPreference;
    return {
      if (heterogeneous != null) 'heterogeneous': heterogeneous,
      if (homogeneous != null) 'homogeneous': homogeneous,
      if (noPreference != null) 'noPreference': noPreference,
    };
  }
}

/// Preferences on managing your databases on AWS.
class DatabasePreferences {
  /// Specifies whether you're interested in self-managed databases or databases
  /// managed by AWS.
  final DatabaseManagementPreference? databaseManagementPreference;

  /// Specifies your preferred migration path.
  final DatabaseMigrationPreference? databaseMigrationPreference;

  DatabasePreferences({
    this.databaseManagementPreference,
    this.databaseMigrationPreference,
  });

  factory DatabasePreferences.fromJson(Map<String, dynamic> json) {
    return DatabasePreferences(
      databaseManagementPreference:
          (json['databaseManagementPreference'] as String?)
              ?.let(DatabaseManagementPreference.fromString),
      databaseMigrationPreference: json['databaseMigrationPreference'] != null
          ? DatabaseMigrationPreference.fromJson(
              json['databaseMigrationPreference'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final databaseManagementPreference = this.databaseManagementPreference;
    final databaseMigrationPreference = this.databaseMigrationPreference;
    return {
      if (databaseManagementPreference != null)
        'databaseManagementPreference': databaseManagementPreference.value,
      if (databaseMigrationPreference != null)
        'databaseMigrationPreference': databaseMigrationPreference,
    };
  }
}

class GetApplicationComponentDetailsResponse {
  /// Detailed information about an application component.
  final ApplicationComponentDetail? applicationComponentDetail;

  /// The associated application group as defined in AWS Application Discovery
  /// Service.
  final List<AssociatedApplication>? associatedApplications;

  /// A list of the IDs of the servers on which the application component is
  /// running.
  final List<String>? associatedServerIds;

  /// Set to true if the application component belongs to more than one
  /// application group.
  final bool? moreApplicationResource;

  GetApplicationComponentDetailsResponse({
    this.applicationComponentDetail,
    this.associatedApplications,
    this.associatedServerIds,
    this.moreApplicationResource,
  });

  factory GetApplicationComponentDetailsResponse.fromJson(
      Map<String, dynamic> json) {
    return GetApplicationComponentDetailsResponse(
      applicationComponentDetail: json['applicationComponentDetail'] != null
          ? ApplicationComponentDetail.fromJson(
              json['applicationComponentDetail'] as Map<String, dynamic>)
          : null,
      associatedApplications: (json['associatedApplications'] as List?)
          ?.nonNulls
          .map((e) => AssociatedApplication.fromJson(e as Map<String, dynamic>))
          .toList(),
      associatedServerIds: (json['associatedServerIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      moreApplicationResource: json['moreApplicationResource'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationComponentDetail = this.applicationComponentDetail;
    final associatedApplications = this.associatedApplications;
    final associatedServerIds = this.associatedServerIds;
    final moreApplicationResource = this.moreApplicationResource;
    return {
      if (applicationComponentDetail != null)
        'applicationComponentDetail': applicationComponentDetail,
      if (associatedApplications != null)
        'associatedApplications': associatedApplications,
      if (associatedServerIds != null)
        'associatedServerIds': associatedServerIds,
      if (moreApplicationResource != null)
        'moreApplicationResource': moreApplicationResource,
    };
  }
}

class GetApplicationComponentStrategiesResponse {
  /// A list of application component strategy recommendations.
  final List<ApplicationComponentStrategy>? applicationComponentStrategies;

  GetApplicationComponentStrategiesResponse({
    this.applicationComponentStrategies,
  });

  factory GetApplicationComponentStrategiesResponse.fromJson(
      Map<String, dynamic> json) {
    return GetApplicationComponentStrategiesResponse(
      applicationComponentStrategies: (json['applicationComponentStrategies']
              as List?)
          ?.nonNulls
          .map((e) =>
              ApplicationComponentStrategy.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationComponentStrategies = this.applicationComponentStrategies;
    return {
      if (applicationComponentStrategies != null)
        'applicationComponentStrategies': applicationComponentStrategies,
    };
  }
}

class GetAssessmentResponse {
  /// List of criteria for assessment.
  final List<AssessmentTarget>? assessmentTargets;

  /// Detailed information about the assessment.
  final DataCollectionDetails? dataCollectionDetails;

  /// The ID for the specific assessment task.
  final String? id;

  GetAssessmentResponse({
    this.assessmentTargets,
    this.dataCollectionDetails,
    this.id,
  });

  factory GetAssessmentResponse.fromJson(Map<String, dynamic> json) {
    return GetAssessmentResponse(
      assessmentTargets: (json['assessmentTargets'] as List?)
          ?.nonNulls
          .map((e) => AssessmentTarget.fromJson(e as Map<String, dynamic>))
          .toList(),
      dataCollectionDetails: json['dataCollectionDetails'] != null
          ? DataCollectionDetails.fromJson(
              json['dataCollectionDetails'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final assessmentTargets = this.assessmentTargets;
    final dataCollectionDetails = this.dataCollectionDetails;
    final id = this.id;
    return {
      if (assessmentTargets != null) 'assessmentTargets': assessmentTargets,
      if (dataCollectionDetails != null)
        'dataCollectionDetails': dataCollectionDetails,
      if (id != null) 'id': id,
    };
  }
}

class GetImportFileTaskResponse {
  /// The time that the import task completed.
  final DateTime? completionTime;

  /// The import file task <code>id</code> returned in the response of
  /// <a>StartImportFileTask</a>.
  final String? id;

  /// The name of the import task given in <a>StartImportFileTask</a>.
  final String? importName;

  /// The S3 bucket where import file is located.
  final String? inputS3Bucket;

  /// The Amazon S3 key name of the import file.
  final String? inputS3Key;

  /// The number of records that failed to be imported.
  final int? numberOfRecordsFailed;

  /// The number of records successfully imported.
  final int? numberOfRecordsSuccess;

  /// Start time of the import task.
  final DateTime? startTime;

  /// Status of import file task.
  final ImportFileTaskStatus? status;

  /// The S3 bucket name for status report of import task.
  final String? statusReportS3Bucket;

  /// The Amazon S3 key name for status report of import task. The report contains
  /// details about whether each record imported successfully or why it did not.
  final String? statusReportS3Key;

  GetImportFileTaskResponse({
    this.completionTime,
    this.id,
    this.importName,
    this.inputS3Bucket,
    this.inputS3Key,
    this.numberOfRecordsFailed,
    this.numberOfRecordsSuccess,
    this.startTime,
    this.status,
    this.statusReportS3Bucket,
    this.statusReportS3Key,
  });

  factory GetImportFileTaskResponse.fromJson(Map<String, dynamic> json) {
    return GetImportFileTaskResponse(
      completionTime: timeStampFromJson(json['completionTime']),
      id: json['id'] as String?,
      importName: json['importName'] as String?,
      inputS3Bucket: json['inputS3Bucket'] as String?,
      inputS3Key: json['inputS3Key'] as String?,
      numberOfRecordsFailed: json['numberOfRecordsFailed'] as int?,
      numberOfRecordsSuccess: json['numberOfRecordsSuccess'] as int?,
      startTime: timeStampFromJson(json['startTime']),
      status: (json['status'] as String?)?.let(ImportFileTaskStatus.fromString),
      statusReportS3Bucket: json['statusReportS3Bucket'] as String?,
      statusReportS3Key: json['statusReportS3Key'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final completionTime = this.completionTime;
    final id = this.id;
    final importName = this.importName;
    final inputS3Bucket = this.inputS3Bucket;
    final inputS3Key = this.inputS3Key;
    final numberOfRecordsFailed = this.numberOfRecordsFailed;
    final numberOfRecordsSuccess = this.numberOfRecordsSuccess;
    final startTime = this.startTime;
    final status = this.status;
    final statusReportS3Bucket = this.statusReportS3Bucket;
    final statusReportS3Key = this.statusReportS3Key;
    return {
      if (completionTime != null)
        'completionTime': unixTimestampToJson(completionTime),
      if (id != null) 'id': id,
      if (importName != null) 'importName': importName,
      if (inputS3Bucket != null) 'inputS3Bucket': inputS3Bucket,
      if (inputS3Key != null) 'inputS3Key': inputS3Key,
      if (numberOfRecordsFailed != null)
        'numberOfRecordsFailed': numberOfRecordsFailed,
      if (numberOfRecordsSuccess != null)
        'numberOfRecordsSuccess': numberOfRecordsSuccess,
      if (startTime != null) 'startTime': unixTimestampToJson(startTime),
      if (status != null) 'status': status.value,
      if (statusReportS3Bucket != null)
        'statusReportS3Bucket': statusReportS3Bucket,
      if (statusReportS3Key != null) 'statusReportS3Key': statusReportS3Key,
    };
  }
}

class GetLatestAssessmentIdResponse {
  /// The latest ID for the specific assessment task.
  final String? id;

  GetLatestAssessmentIdResponse({
    this.id,
  });

  factory GetLatestAssessmentIdResponse.fromJson(Map<String, dynamic> json) {
    return GetLatestAssessmentIdResponse(
      id: json['id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    return {
      if (id != null) 'id': id,
    };
  }
}

class GetPortfolioPreferencesResponse {
  /// The classification for application component types.
  final ApplicationMode? applicationMode;

  /// The transformation preferences for non-database applications.
  final ApplicationPreferences? applicationPreferences;

  /// The transformation preferences for database applications.
  final DatabasePreferences? databasePreferences;

  /// The rank of business goals based on priority.
  final PrioritizeBusinessGoals? prioritizeBusinessGoals;

  GetPortfolioPreferencesResponse({
    this.applicationMode,
    this.applicationPreferences,
    this.databasePreferences,
    this.prioritizeBusinessGoals,
  });

  factory GetPortfolioPreferencesResponse.fromJson(Map<String, dynamic> json) {
    return GetPortfolioPreferencesResponse(
      applicationMode:
          (json['applicationMode'] as String?)?.let(ApplicationMode.fromString),
      applicationPreferences: json['applicationPreferences'] != null
          ? ApplicationPreferences.fromJson(
              json['applicationPreferences'] as Map<String, dynamic>)
          : null,
      databasePreferences: json['databasePreferences'] != null
          ? DatabasePreferences.fromJson(
              json['databasePreferences'] as Map<String, dynamic>)
          : null,
      prioritizeBusinessGoals: json['prioritizeBusinessGoals'] != null
          ? PrioritizeBusinessGoals.fromJson(
              json['prioritizeBusinessGoals'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationMode = this.applicationMode;
    final applicationPreferences = this.applicationPreferences;
    final databasePreferences = this.databasePreferences;
    final prioritizeBusinessGoals = this.prioritizeBusinessGoals;
    return {
      if (applicationMode != null) 'applicationMode': applicationMode.value,
      if (applicationPreferences != null)
        'applicationPreferences': applicationPreferences,
      if (databasePreferences != null)
        'databasePreferences': databasePreferences,
      if (prioritizeBusinessGoals != null)
        'prioritizeBusinessGoals': prioritizeBusinessGoals,
    };
  }
}

class GetPortfolioSummaryResponse {
  /// An assessment summary for the portfolio including the number of servers to
  /// rehost and the overall number of anti-patterns.
  final AssessmentSummary? assessmentSummary;

  GetPortfolioSummaryResponse({
    this.assessmentSummary,
  });

  factory GetPortfolioSummaryResponse.fromJson(Map<String, dynamic> json) {
    return GetPortfolioSummaryResponse(
      assessmentSummary: json['assessmentSummary'] != null
          ? AssessmentSummary.fromJson(
              json['assessmentSummary'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final assessmentSummary = this.assessmentSummary;
    return {
      if (assessmentSummary != null) 'assessmentSummary': assessmentSummary,
    };
  }
}

class GetRecommendationReportDetailsResponse {
  /// The ID of the recommendation report generation task. See the response of
  /// <a>StartRecommendationReportGeneration</a>.
  final String? id;

  /// Detailed information about the recommendation report.
  final RecommendationReportDetails? recommendationReportDetails;

  GetRecommendationReportDetailsResponse({
    this.id,
    this.recommendationReportDetails,
  });

  factory GetRecommendationReportDetailsResponse.fromJson(
      Map<String, dynamic> json) {
    return GetRecommendationReportDetailsResponse(
      id: json['id'] as String?,
      recommendationReportDetails: json['recommendationReportDetails'] != null
          ? RecommendationReportDetails.fromJson(
              json['recommendationReportDetails'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final recommendationReportDetails = this.recommendationReportDetails;
    return {
      if (id != null) 'id': id,
      if (recommendationReportDetails != null)
        'recommendationReportDetails': recommendationReportDetails,
    };
  }
}

class GetServerDetailsResponse {
  /// The associated application group the server belongs to, as defined in AWS
  /// Application Discovery Service.
  final List<AssociatedApplication>? associatedApplications;

  /// The token you use to retrieve the next set of results, or null if there are
  /// no more results.
  final String? nextToken;

  /// Detailed information about the server.
  final ServerDetail? serverDetail;

  GetServerDetailsResponse({
    this.associatedApplications,
    this.nextToken,
    this.serverDetail,
  });

  factory GetServerDetailsResponse.fromJson(Map<String, dynamic> json) {
    return GetServerDetailsResponse(
      associatedApplications: (json['associatedApplications'] as List?)
          ?.nonNulls
          .map((e) => AssociatedApplication.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
      serverDetail: json['serverDetail'] != null
          ? ServerDetail.fromJson(json['serverDetail'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final associatedApplications = this.associatedApplications;
    final nextToken = this.nextToken;
    final serverDetail = this.serverDetail;
    return {
      if (associatedApplications != null)
        'associatedApplications': associatedApplications,
      if (nextToken != null) 'nextToken': nextToken,
      if (serverDetail != null) 'serverDetail': serverDetail,
    };
  }
}

class GetServerStrategiesResponse {
  /// A list of strategy recommendations for the server.
  final List<ServerStrategy>? serverStrategies;

  GetServerStrategiesResponse({
    this.serverStrategies,
  });

  factory GetServerStrategiesResponse.fromJson(Map<String, dynamic> json) {
    return GetServerStrategiesResponse(
      serverStrategies: (json['serverStrategies'] as List?)
          ?.nonNulls
          .map((e) => ServerStrategy.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final serverStrategies = this.serverStrategies;
    return {
      if (serverStrategies != null) 'serverStrategies': serverStrategies,
    };
  }
}

/// The object containing information about distinct imports or groups for
/// Strategy Recommendations.
class Group {
  /// The key of the specific import group.
  final GroupName? name;

  /// The value of the specific import group.
  final String? value;

  Group({
    this.name,
    this.value,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      if (name != null) 'name': name.value,
      if (value != null) 'value': value,
    };
  }
}

enum GroupName {
  externalId('ExternalId'),
  externalSourceType('ExternalSourceType'),
  ;

  final String value;

  const GroupName(this.value);

  static GroupName fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum GroupName'));
}

/// The object containing details about heterogeneous database preferences.
class Heterogeneous {
  /// The target database engine for heterogeneous database migration preference.
  final List<HeterogeneousTargetDatabaseEngine> targetDatabaseEngine;

  Heterogeneous({
    required this.targetDatabaseEngine,
  });

  factory Heterogeneous.fromJson(Map<String, dynamic> json) {
    return Heterogeneous(
      targetDatabaseEngine: (json['targetDatabaseEngine'] as List)
          .nonNulls
          .map((e) =>
              HeterogeneousTargetDatabaseEngine.fromString((e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final targetDatabaseEngine = this.targetDatabaseEngine;
    return {
      'targetDatabaseEngine': targetDatabaseEngine.map((e) => e.value).toList(),
    };
  }
}

enum HeterogeneousTargetDatabaseEngine {
  noneSpecified('None specified'),
  amazonAurora('Amazon Aurora'),
  awsPostgreSQL('AWS PostgreSQL'),
  mySQL('MySQL'),
  microsoftSqlServer('Microsoft SQL Server'),
  oracleDatabase('Oracle Database'),
  mariaDB('MariaDB'),
  sap('SAP'),
  db2Luw('Db2 LUW'),
  mongoDB('MongoDB'),
  ;

  final String value;

  const HeterogeneousTargetDatabaseEngine(this.value);

  static HeterogeneousTargetDatabaseEngine fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum HeterogeneousTargetDatabaseEngine'));
}

/// The object containing details about homogeneous database preferences.
class Homogeneous {
  /// The target database engine for homogeneous database migration preferences.
  final List<HomogeneousTargetDatabaseEngine>? targetDatabaseEngine;

  Homogeneous({
    this.targetDatabaseEngine,
  });

  factory Homogeneous.fromJson(Map<String, dynamic> json) {
    return Homogeneous(
      targetDatabaseEngine: (json['targetDatabaseEngine'] as List?)
          ?.nonNulls
          .map((e) => HomogeneousTargetDatabaseEngine.fromString((e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final targetDatabaseEngine = this.targetDatabaseEngine;
    return {
      if (targetDatabaseEngine != null)
        'targetDatabaseEngine':
            targetDatabaseEngine.map((e) => e.value).toList(),
    };
  }
}

enum HomogeneousTargetDatabaseEngine {
  noneSpecified('None specified'),
  ;

  final String value;

  const HomogeneousTargetDatabaseEngine(this.value);

  static HomogeneousTargetDatabaseEngine fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum HomogeneousTargetDatabaseEngine'));
}

/// IP address based configurations.
class IPAddressBasedRemoteInfo {
  /// The type of authorization.
  final AuthType? authType;

  /// The time stamp of the configuration.
  final String? ipAddressConfigurationTimeStamp;

  /// The type of the operating system.
  final OSType? osType;

  IPAddressBasedRemoteInfo({
    this.authType,
    this.ipAddressConfigurationTimeStamp,
    this.osType,
  });

  factory IPAddressBasedRemoteInfo.fromJson(Map<String, dynamic> json) {
    return IPAddressBasedRemoteInfo(
      authType: (json['authType'] as String?)?.let(AuthType.fromString),
      ipAddressConfigurationTimeStamp:
          json['ipAddressConfigurationTimeStamp'] as String?,
      osType: (json['osType'] as String?)?.let(OSType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final authType = this.authType;
    final ipAddressConfigurationTimeStamp =
        this.ipAddressConfigurationTimeStamp;
    final osType = this.osType;
    return {
      if (authType != null) 'authType': authType.value,
      if (ipAddressConfigurationTimeStamp != null)
        'ipAddressConfigurationTimeStamp': ipAddressConfigurationTimeStamp,
      if (osType != null) 'osType': osType.value,
    };
  }
}

/// Information about the import file tasks you request.
class ImportFileTaskInformation {
  /// The time that the import task completes.
  final DateTime? completionTime;

  /// The ID of the import file task.
  final String? id;

  /// The name of the import task given in <code>StartImportFileTask</code>.
  final String? importName;

  /// The S3 bucket where the import file is located.
  final String? inputS3Bucket;

  /// The Amazon S3 key name of the import file.
  final String? inputS3Key;

  /// The number of records that failed to be imported.
  final int? numberOfRecordsFailed;

  /// The number of records successfully imported.
  final int? numberOfRecordsSuccess;

  /// Start time of the import task.
  final DateTime? startTime;

  /// Status of import file task.
  final ImportFileTaskStatus? status;

  /// The S3 bucket name for status report of import task.
  final String? statusReportS3Bucket;

  /// The Amazon S3 key name for status report of import task. The report contains
  /// details about whether each record imported successfully or why it did not.
  final String? statusReportS3Key;

  ImportFileTaskInformation({
    this.completionTime,
    this.id,
    this.importName,
    this.inputS3Bucket,
    this.inputS3Key,
    this.numberOfRecordsFailed,
    this.numberOfRecordsSuccess,
    this.startTime,
    this.status,
    this.statusReportS3Bucket,
    this.statusReportS3Key,
  });

  factory ImportFileTaskInformation.fromJson(Map<String, dynamic> json) {
    return ImportFileTaskInformation(
      completionTime: timeStampFromJson(json['completionTime']),
      id: json['id'] as String?,
      importName: json['importName'] as String?,
      inputS3Bucket: json['inputS3Bucket'] as String?,
      inputS3Key: json['inputS3Key'] as String?,
      numberOfRecordsFailed: json['numberOfRecordsFailed'] as int?,
      numberOfRecordsSuccess: json['numberOfRecordsSuccess'] as int?,
      startTime: timeStampFromJson(json['startTime']),
      status: (json['status'] as String?)?.let(ImportFileTaskStatus.fromString),
      statusReportS3Bucket: json['statusReportS3Bucket'] as String?,
      statusReportS3Key: json['statusReportS3Key'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final completionTime = this.completionTime;
    final id = this.id;
    final importName = this.importName;
    final inputS3Bucket = this.inputS3Bucket;
    final inputS3Key = this.inputS3Key;
    final numberOfRecordsFailed = this.numberOfRecordsFailed;
    final numberOfRecordsSuccess = this.numberOfRecordsSuccess;
    final startTime = this.startTime;
    final status = this.status;
    final statusReportS3Bucket = this.statusReportS3Bucket;
    final statusReportS3Key = this.statusReportS3Key;
    return {
      if (completionTime != null)
        'completionTime': unixTimestampToJson(completionTime),
      if (id != null) 'id': id,
      if (importName != null) 'importName': importName,
      if (inputS3Bucket != null) 'inputS3Bucket': inputS3Bucket,
      if (inputS3Key != null) 'inputS3Key': inputS3Key,
      if (numberOfRecordsFailed != null)
        'numberOfRecordsFailed': numberOfRecordsFailed,
      if (numberOfRecordsSuccess != null)
        'numberOfRecordsSuccess': numberOfRecordsSuccess,
      if (startTime != null) 'startTime': unixTimestampToJson(startTime),
      if (status != null) 'status': status.value,
      if (statusReportS3Bucket != null)
        'statusReportS3Bucket': statusReportS3Bucket,
      if (statusReportS3Key != null) 'statusReportS3Key': statusReportS3Key,
    };
  }
}

enum ImportFileTaskStatus {
  importInProgress('ImportInProgress'),
  importFailed('ImportFailed'),
  importPartialSuccess('ImportPartialSuccess'),
  importSuccess('ImportSuccess'),
  deleteInProgress('DeleteInProgress'),
  deleteFailed('DeleteFailed'),
  deletePartialSuccess('DeletePartialSuccess'),
  deleteSuccess('DeleteSuccess'),
  ;

  final String value;

  const ImportFileTaskStatus(this.value);

  static ImportFileTaskStatus fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum ImportFileTaskStatus'));
}

enum InclusionStatus {
  excludeFromAssessment('excludeFromAssessment'),
  includeInAssessment('includeInAssessment'),
  ;

  final String value;

  const InclusionStatus(this.value);

  static InclusionStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum InclusionStatus'));
}

/// Represents output for ListAnalyzableServers operation.
class ListAnalyzableServersResponse {
  /// The list of analyzable servers with summary information about each server.
  final List<AnalyzableServerSummary>? analyzableServers;

  /// The token you use to retrieve the next set of results, or null if there are
  /// no more results.
  final String? nextToken;

  ListAnalyzableServersResponse({
    this.analyzableServers,
    this.nextToken,
  });

  factory ListAnalyzableServersResponse.fromJson(Map<String, dynamic> json) {
    return ListAnalyzableServersResponse(
      analyzableServers: (json['analyzableServers'] as List?)
          ?.nonNulls
          .map((e) =>
              AnalyzableServerSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final analyzableServers = this.analyzableServers;
    final nextToken = this.nextToken;
    return {
      if (analyzableServers != null) 'analyzableServers': analyzableServers,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListApplicationComponentsResponse {
  /// The list of application components with detailed information about each
  /// component.
  final List<ApplicationComponentDetail>? applicationComponentInfos;

  /// The token you use to retrieve the next set of results, or null if there are
  /// no more results.
  final String? nextToken;

  ListApplicationComponentsResponse({
    this.applicationComponentInfos,
    this.nextToken,
  });

  factory ListApplicationComponentsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListApplicationComponentsResponse(
      applicationComponentInfos: (json['applicationComponentInfos'] as List?)
          ?.nonNulls
          .map((e) =>
              ApplicationComponentDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationComponentInfos = this.applicationComponentInfos;
    final nextToken = this.nextToken;
    return {
      if (applicationComponentInfos != null)
        'applicationComponentInfos': applicationComponentInfos,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListCollectorsResponse {
  /// The list of all the installed collectors.
  final List<Collector>? collectors;

  /// The token you use to retrieve the next set of results, or null if there are
  /// no more results.
  final String? nextToken;

  ListCollectorsResponse({
    this.collectors,
    this.nextToken,
  });

  factory ListCollectorsResponse.fromJson(Map<String, dynamic> json) {
    return ListCollectorsResponse(
      collectors: (json['Collectors'] as List?)
          ?.nonNulls
          .map((e) => Collector.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final collectors = this.collectors;
    final nextToken = this.nextToken;
    return {
      if (collectors != null) 'Collectors': collectors,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListImportFileTaskResponse {
  /// The token you use to retrieve the next set of results, or null if there are
  /// no more results.
  final String? nextToken;

  /// Lists information about the files you import.
  final List<ImportFileTaskInformation>? taskInfos;

  ListImportFileTaskResponse({
    this.nextToken,
    this.taskInfos,
  });

  factory ListImportFileTaskResponse.fromJson(Map<String, dynamic> json) {
    return ListImportFileTaskResponse(
      nextToken: json['nextToken'] as String?,
      taskInfos: (json['taskInfos'] as List?)
          ?.nonNulls
          .map((e) =>
              ImportFileTaskInformation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final taskInfos = this.taskInfos;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (taskInfos != null) 'taskInfos': taskInfos,
    };
  }
}

class ListServersResponse {
  /// The token you use to retrieve the next set of results, or null if there are
  /// no more results.
  final String? nextToken;

  /// The list of servers with detailed information about each server.
  final List<ServerDetail>? serverInfos;

  ListServersResponse({
    this.nextToken,
    this.serverInfos,
  });

  factory ListServersResponse.fromJson(Map<String, dynamic> json) {
    return ListServersResponse(
      nextToken: json['nextToken'] as String?,
      serverInfos: (json['serverInfos'] as List?)
          ?.nonNulls
          .map((e) => ServerDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final serverInfos = this.serverInfos;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (serverInfos != null) 'serverInfos': serverInfos,
    };
  }
}

/// Preferences for migrating an application to AWS.
class ManagementPreference {
  /// Indicates interest in solutions that are managed by AWS.
  final AwsManagedResources? awsManagedResources;

  /// No specific preference.
  final NoManagementPreference? noPreference;

  /// Indicates interest in managing your own resources on AWS.
  final SelfManageResources? selfManageResources;

  ManagementPreference({
    this.awsManagedResources,
    this.noPreference,
    this.selfManageResources,
  });

  factory ManagementPreference.fromJson(Map<String, dynamic> json) {
    return ManagementPreference(
      awsManagedResources: json['awsManagedResources'] != null
          ? AwsManagedResources.fromJson(
              json['awsManagedResources'] as Map<String, dynamic>)
          : null,
      noPreference: json['noPreference'] != null
          ? NoManagementPreference.fromJson(
              json['noPreference'] as Map<String, dynamic>)
          : null,
      selfManageResources: json['selfManageResources'] != null
          ? SelfManageResources.fromJson(
              json['selfManageResources'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final awsManagedResources = this.awsManagedResources;
    final noPreference = this.noPreference;
    final selfManageResources = this.selfManageResources;
    return {
      if (awsManagedResources != null)
        'awsManagedResources': awsManagedResources,
      if (noPreference != null) 'noPreference': noPreference,
      if (selfManageResources != null)
        'selfManageResources': selfManageResources,
    };
  }
}

/// Information about the server's network for which the assessment was run.
class NetworkInfo {
  /// Information about the name of the interface of the server for which the
  /// assessment was run.
  final String interfaceName;

  /// Information about the IP address of the server for which the assessment was
  /// run.
  final String ipAddress;

  /// Information about the MAC address of the server for which the assessment was
  /// run.
  final String macAddress;

  /// Information about the subnet mask of the server for which the assessment was
  /// run.
  final String netMask;

  NetworkInfo({
    required this.interfaceName,
    required this.ipAddress,
    required this.macAddress,
    required this.netMask,
  });

  factory NetworkInfo.fromJson(Map<String, dynamic> json) {
    return NetworkInfo(
      interfaceName: json['interfaceName'] as String,
      ipAddress: json['ipAddress'] as String,
      macAddress: json['macAddress'] as String,
      netMask: json['netMask'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final interfaceName = this.interfaceName;
    final ipAddress = this.ipAddress;
    final macAddress = this.macAddress;
    final netMask = this.netMask;
    return {
      'interfaceName': interfaceName,
      'ipAddress': ipAddress,
      'macAddress': macAddress,
      'netMask': netMask,
    };
  }
}

/// The object containing details about database migration preferences, when you
/// have no particular preference.
class NoDatabaseMigrationPreference {
  /// The target database engine for database migration preference that you
  /// specify.
  final List<TargetDatabaseEngine> targetDatabaseEngine;

  NoDatabaseMigrationPreference({
    required this.targetDatabaseEngine,
  });

  factory NoDatabaseMigrationPreference.fromJson(Map<String, dynamic> json) {
    return NoDatabaseMigrationPreference(
      targetDatabaseEngine: (json['targetDatabaseEngine'] as List)
          .nonNulls
          .map((e) => TargetDatabaseEngine.fromString((e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final targetDatabaseEngine = this.targetDatabaseEngine;
    return {
      'targetDatabaseEngine': targetDatabaseEngine.map((e) => e.value).toList(),
    };
  }
}

/// Object containing the choice of application destination that you specify.
class NoManagementPreference {
  /// The choice of application destination that you specify.
  final List<NoPreferenceTargetDestination> targetDestination;

  NoManagementPreference({
    required this.targetDestination,
  });

  factory NoManagementPreference.fromJson(Map<String, dynamic> json) {
    return NoManagementPreference(
      targetDestination: (json['targetDestination'] as List)
          .nonNulls
          .map((e) => NoPreferenceTargetDestination.fromString((e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final targetDestination = this.targetDestination;
    return {
      'targetDestination': targetDestination.map((e) => e.value).toList(),
    };
  }
}

enum NoPreferenceTargetDestination {
  noneSpecified('None specified'),
  awsElasticBeanStalk('AWS Elastic BeanStalk'),
  awsFargate('AWS Fargate'),
  amazonElasticCloudComputeEc2('Amazon Elastic Cloud Compute (EC2)'),
  amazonElasticContainerServiceEcs('Amazon Elastic Container Service (ECS)'),
  amazonElasticKubernetesServiceEks('Amazon Elastic Kubernetes Service (EKS)'),
  ;

  final String value;

  const NoPreferenceTargetDestination(this.value);

  static NoPreferenceTargetDestination fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum NoPreferenceTargetDestination'));
}

/// Information about the operating system.
class OSInfo {
  /// Information about the type of operating system.
  final OSType? type;

  /// Information about the version of operating system.
  final String? version;

  OSInfo({
    this.type,
    this.version,
  });

  factory OSInfo.fromJson(Map<String, dynamic> json) {
    return OSInfo(
      type: (json['type'] as String?)?.let(OSType.fromString),
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final version = this.version;
    return {
      if (type != null) 'type': type.value,
      if (version != null) 'version': version,
    };
  }
}

enum OSType {
  linux('LINUX'),
  windows('WINDOWS'),
  ;

  final String value;

  const OSType(this.value);

  static OSType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception('$value is not known in enum OSType'));
}

enum OutputFormat {
  excel('Excel'),
  json('Json'),
  ;

  final String value;

  const OutputFormat(this.value);

  static OutputFormat fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum OutputFormat'));
}

/// Detailed information of the pipeline.
class PipelineInfo {
  /// The time when the pipeline info was configured.
  final String? pipelineConfigurationTimeStamp;

  /// The type of pipeline.
  final PipelineType? pipelineType;

  PipelineInfo({
    this.pipelineConfigurationTimeStamp,
    this.pipelineType,
  });

  factory PipelineInfo.fromJson(Map<String, dynamic> json) {
    return PipelineInfo(
      pipelineConfigurationTimeStamp:
          json['pipelineConfigurationTimeStamp'] as String?,
      pipelineType:
          (json['pipelineType'] as String?)?.let(PipelineType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final pipelineConfigurationTimeStamp = this.pipelineConfigurationTimeStamp;
    final pipelineType = this.pipelineType;
    return {
      if (pipelineConfigurationTimeStamp != null)
        'pipelineConfigurationTimeStamp': pipelineConfigurationTimeStamp,
      if (pipelineType != null) 'pipelineType': pipelineType.value,
    };
  }
}

enum PipelineType {
  azureDevops('AZURE_DEVOPS'),
  ;

  final String value;

  const PipelineType(this.value);

  static PipelineType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum PipelineType'));
}

/// Rank of business goals based on priority.
class PrioritizeBusinessGoals {
  /// Rank of business goals based on priority.
  final BusinessGoals? businessGoals;

  PrioritizeBusinessGoals({
    this.businessGoals,
  });

  factory PrioritizeBusinessGoals.fromJson(Map<String, dynamic> json) {
    return PrioritizeBusinessGoals(
      businessGoals: json['businessGoals'] != null
          ? BusinessGoals.fromJson(
              json['businessGoals'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final businessGoals = this.businessGoals;
    return {
      if (businessGoals != null) 'businessGoals': businessGoals,
    };
  }
}

class PutPortfolioPreferencesResponse {
  PutPortfolioPreferencesResponse();

  factory PutPortfolioPreferencesResponse.fromJson(Map<String, dynamic> _) {
    return PutPortfolioPreferencesResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Contains detailed information about a recommendation report.
class RecommendationReportDetails {
  /// The time that the recommendation report generation task completes.
  final DateTime? completionTime;

  /// The S3 bucket where the report file is located.
  final String? s3Bucket;

  /// The Amazon S3 key name of the report file.
  final List<String>? s3Keys;

  /// The time that the recommendation report generation task starts.
  final DateTime? startTime;

  /// The status of the recommendation report generation task.
  final RecommendationReportStatus? status;

  /// The status message for recommendation report generation.
  final String? statusMessage;

  RecommendationReportDetails({
    this.completionTime,
    this.s3Bucket,
    this.s3Keys,
    this.startTime,
    this.status,
    this.statusMessage,
  });

  factory RecommendationReportDetails.fromJson(Map<String, dynamic> json) {
    return RecommendationReportDetails(
      completionTime: timeStampFromJson(json['completionTime']),
      s3Bucket: json['s3Bucket'] as String?,
      s3Keys:
          (json['s3Keys'] as List?)?.nonNulls.map((e) => e as String).toList(),
      startTime: timeStampFromJson(json['startTime']),
      status: (json['status'] as String?)
          ?.let(RecommendationReportStatus.fromString),
      statusMessage: json['statusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final completionTime = this.completionTime;
    final s3Bucket = this.s3Bucket;
    final s3Keys = this.s3Keys;
    final startTime = this.startTime;
    final status = this.status;
    final statusMessage = this.statusMessage;
    return {
      if (completionTime != null)
        'completionTime': unixTimestampToJson(completionTime),
      if (s3Bucket != null) 's3Bucket': s3Bucket,
      if (s3Keys != null) 's3Keys': s3Keys,
      if (startTime != null) 'startTime': unixTimestampToJson(startTime),
      if (status != null) 'status': status.value,
      if (statusMessage != null) 'statusMessage': statusMessage,
    };
  }
}

enum RecommendationReportStatus {
  failed('FAILED'),
  inProgress('IN_PROGRESS'),
  success('SUCCESS'),
  ;

  final String value;

  const RecommendationReportStatus(this.value);

  static RecommendationReportStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum RecommendationReportStatus'));
}

/// Contains a recommendation set.
class RecommendationSet {
  /// The recommended strategy.
  final Strategy? strategy;

  /// The recommended target destination.
  final TargetDestination? targetDestination;

  /// The target destination for the recommendation set.
  final TransformationTool? transformationTool;

  RecommendationSet({
    this.strategy,
    this.targetDestination,
    this.transformationTool,
  });

  factory RecommendationSet.fromJson(Map<String, dynamic> json) {
    return RecommendationSet(
      strategy: (json['strategy'] as String?)?.let(Strategy.fromString),
      targetDestination: (json['targetDestination'] as String?)
          ?.let(TargetDestination.fromString),
      transformationTool: json['transformationTool'] != null
          ? TransformationTool.fromJson(
              json['transformationTool'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final strategy = this.strategy;
    final targetDestination = this.targetDestination;
    final transformationTool = this.transformationTool;
    return {
      if (strategy != null) 'strategy': strategy.value,
      if (targetDestination != null)
        'targetDestination': targetDestination.value,
      if (transformationTool != null) 'transformationTool': transformationTool,
    };
  }
}

/// Information about the server configured for source code analysis.
class RemoteSourceCodeAnalysisServerInfo {
  /// The time when the remote source code server was configured.
  final String? remoteSourceCodeAnalysisServerConfigurationTimestamp;

  RemoteSourceCodeAnalysisServerInfo({
    this.remoteSourceCodeAnalysisServerConfigurationTimestamp,
  });

  factory RemoteSourceCodeAnalysisServerInfo.fromJson(
      Map<String, dynamic> json) {
    return RemoteSourceCodeAnalysisServerInfo(
      remoteSourceCodeAnalysisServerConfigurationTimestamp:
          json['remoteSourceCodeAnalysisServerConfigurationTimestamp']
              as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final remoteSourceCodeAnalysisServerConfigurationTimestamp =
        this.remoteSourceCodeAnalysisServerConfigurationTimestamp;
    return {
      if (remoteSourceCodeAnalysisServerConfigurationTimestamp != null)
        'remoteSourceCodeAnalysisServerConfigurationTimestamp':
            remoteSourceCodeAnalysisServerConfigurationTimestamp,
    };
  }
}

enum ResourceSubType {
  database('Database'),
  process('Process'),
  databaseProcess('DatabaseProcess'),
  ;

  final String value;

  const ResourceSubType(this.value);

  static ResourceSubType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum ResourceSubType'));
}

/// The error in server analysis.
class Result {
  /// The error in server analysis.
  final AnalysisStatusUnion? analysisStatus;

  /// The error in server analysis.
  final AnalysisType? analysisType;

  /// The error in server analysis.
  final List<AntipatternReportResult>? antipatternReportResultList;

  /// The error in server analysis.
  final String? statusMessage;

  Result({
    this.analysisStatus,
    this.analysisType,
    this.antipatternReportResultList,
    this.statusMessage,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      analysisStatus: json['analysisStatus'] != null
          ? AnalysisStatusUnion.fromJson(
              json['analysisStatus'] as Map<String, dynamic>)
          : null,
      analysisType:
          (json['analysisType'] as String?)?.let(AnalysisType.fromString),
      antipatternReportResultList:
          (json['antipatternReportResultList'] as List?)
              ?.nonNulls
              .map((e) =>
                  AntipatternReportResult.fromJson(e as Map<String, dynamic>))
              .toList(),
      statusMessage: json['statusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final analysisStatus = this.analysisStatus;
    final analysisType = this.analysisType;
    final antipatternReportResultList = this.antipatternReportResultList;
    final statusMessage = this.statusMessage;
    return {
      if (analysisStatus != null) 'analysisStatus': analysisStatus,
      if (analysisType != null) 'analysisType': analysisType.value,
      if (antipatternReportResultList != null)
        'antipatternReportResultList': antipatternReportResultList,
      if (statusMessage != null) 'statusMessage': statusMessage,
    };
  }
}

enum RunTimeAnalyzerName {
  a2cAnalyzer('A2C_ANALYZER'),
  rehostAnalyzer('REHOST_ANALYZER'),
  empPaAnalyzer('EMP_PA_ANALYZER'),
  databaseAnalyzer('DATABASE_ANALYZER'),
  sctAnalyzer('SCT_ANALYZER'),
  ;

  final String value;

  const RunTimeAnalyzerName(this.value);

  static RunTimeAnalyzerName fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum RunTimeAnalyzerName'));
}

enum RunTimeAssessmentStatus {
  dataCollectionTaskToBeScheduled('dataCollectionTaskToBeScheduled'),
  dataCollectionTaskScheduled('dataCollectionTaskScheduled'),
  dataCollectionTaskStarted('dataCollectionTaskStarted'),
  dataCollectionTaskStopped('dataCollectionTaskStopped'),
  dataCollectionTaskSuccess('dataCollectionTaskSuccess'),
  dataCollectionTaskFailed('dataCollectionTaskFailed'),
  dataCollectionTaskPartialSuccess('dataCollectionTaskPartialSuccess'),
  ;

  final String value;

  const RunTimeAssessmentStatus(this.value);

  static RunTimeAssessmentStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum RunTimeAssessmentStatus'));
}

enum RuntimeAnalysisStatus {
  analysisToBeScheduled('ANALYSIS_TO_BE_SCHEDULED'),
  analysisStarted('ANALYSIS_STARTED'),
  analysisSuccess('ANALYSIS_SUCCESS'),
  analysisFailed('ANALYSIS_FAILED'),
  ;

  final String value;

  const RuntimeAnalysisStatus(this.value);

  static RuntimeAnalysisStatus fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum RuntimeAnalysisStatus'));
}

/// Contains the S3 bucket name and the Amazon S3 key name.
class S3Object {
  /// The S3 bucket name.
  final String? s3Bucket;

  /// The Amazon S3 key name.
  final String? s3key;

  S3Object({
    this.s3Bucket,
    this.s3key,
  });

  factory S3Object.fromJson(Map<String, dynamic> json) {
    return S3Object(
      s3Bucket: json['s3Bucket'] as String?,
      s3key: json['s3key'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Bucket = this.s3Bucket;
    final s3key = this.s3key;
    return {
      if (s3Bucket != null) 's3Bucket': s3Bucket,
      if (s3key != null) 's3key': s3key,
    };
  }
}

/// Self-managed resources.
class SelfManageResources {
  /// Self-managed resources target destination.
  final List<SelfManageTargetDestination> targetDestination;

  SelfManageResources({
    required this.targetDestination,
  });

  factory SelfManageResources.fromJson(Map<String, dynamic> json) {
    return SelfManageResources(
      targetDestination: (json['targetDestination'] as List)
          .nonNulls
          .map((e) => SelfManageTargetDestination.fromString((e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final targetDestination = this.targetDestination;
    return {
      'targetDestination': targetDestination.map((e) => e.value).toList(),
    };
  }
}

enum SelfManageTargetDestination {
  noneSpecified('None specified'),
  amazonElasticCloudComputeEc2('Amazon Elastic Cloud Compute (EC2)'),
  amazonElasticContainerServiceEcs('Amazon Elastic Container Service (ECS)'),
  amazonElasticKubernetesServiceEks('Amazon Elastic Kubernetes Service (EKS)'),
  ;

  final String value;

  const SelfManageTargetDestination(this.value);

  static SelfManageTargetDestination fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum SelfManageTargetDestination'));
}

enum ServerCriteria {
  notDefined('NOT_DEFINED'),
  osName('OS_NAME'),
  strategy('STRATEGY'),
  destination('DESTINATION'),
  serverId('SERVER_ID'),
  analysisStatus('ANALYSIS_STATUS'),
  errorCategory('ERROR_CATEGORY'),
  ;

  final String value;

  const ServerCriteria(this.value);

  static ServerCriteria fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum ServerCriteria'));
}

/// Detailed information about a server.
class ServerDetail {
  /// The S3 bucket name and Amazon S3 key name for anti-pattern report.
  final S3Object? antipatternReportS3Object;

  /// The status of the anti-pattern report generation.
  final AntipatternReportStatus? antipatternReportStatus;

  /// A message about the status of the anti-pattern report generation.
  final String? antipatternReportStatusMessage;

  /// A list of strategy summaries.
  final List<StrategySummary>? applicationComponentStrategySummary;

  /// The status of assessment for the server.
  final RunTimeAssessmentStatus? dataCollectionStatus;

  /// The server ID.
  final String? id;

  /// The timestamp of when the server was assessed.
  final DateTime? lastAnalyzedTimestamp;

  /// A list of anti-pattern severity summaries.
  final List<AntipatternSeveritySummary>? listAntipatternSeveritySummary;

  /// The name of the server.
  final String? name;

  /// A set of recommendations.
  final RecommendationSet? recommendationSet;

  /// The error in server analysis.
  final ServerError? serverError;

  /// The type of server.
  final String? serverType;

  /// A message about the status of data collection, which contains detailed
  /// descriptions of any error messages.
  final String? statusMessage;

  /// System information about the server.
  final SystemInfo? systemInfo;

  ServerDetail({
    this.antipatternReportS3Object,
    this.antipatternReportStatus,
    this.antipatternReportStatusMessage,
    this.applicationComponentStrategySummary,
    this.dataCollectionStatus,
    this.id,
    this.lastAnalyzedTimestamp,
    this.listAntipatternSeveritySummary,
    this.name,
    this.recommendationSet,
    this.serverError,
    this.serverType,
    this.statusMessage,
    this.systemInfo,
  });

  factory ServerDetail.fromJson(Map<String, dynamic> json) {
    return ServerDetail(
      antipatternReportS3Object: json['antipatternReportS3Object'] != null
          ? S3Object.fromJson(
              json['antipatternReportS3Object'] as Map<String, dynamic>)
          : null,
      antipatternReportStatus: (json['antipatternReportStatus'] as String?)
          ?.let(AntipatternReportStatus.fromString),
      antipatternReportStatusMessage:
          json['antipatternReportStatusMessage'] as String?,
      applicationComponentStrategySummary:
          (json['applicationComponentStrategySummary'] as List?)
              ?.nonNulls
              .map((e) => StrategySummary.fromJson(e as Map<String, dynamic>))
              .toList(),
      dataCollectionStatus: (json['dataCollectionStatus'] as String?)
          ?.let(RunTimeAssessmentStatus.fromString),
      id: json['id'] as String?,
      lastAnalyzedTimestamp: timeStampFromJson(json['lastAnalyzedTimestamp']),
      listAntipatternSeveritySummary: (json['listAntipatternSeveritySummary']
              as List?)
          ?.nonNulls
          .map((e) =>
              AntipatternSeveritySummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      recommendationSet: json['recommendationSet'] != null
          ? RecommendationSet.fromJson(
              json['recommendationSet'] as Map<String, dynamic>)
          : null,
      serverError: json['serverError'] != null
          ? ServerError.fromJson(json['serverError'] as Map<String, dynamic>)
          : null,
      serverType: json['serverType'] as String?,
      statusMessage: json['statusMessage'] as String?,
      systemInfo: json['systemInfo'] != null
          ? SystemInfo.fromJson(json['systemInfo'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final antipatternReportS3Object = this.antipatternReportS3Object;
    final antipatternReportStatus = this.antipatternReportStatus;
    final antipatternReportStatusMessage = this.antipatternReportStatusMessage;
    final applicationComponentStrategySummary =
        this.applicationComponentStrategySummary;
    final dataCollectionStatus = this.dataCollectionStatus;
    final id = this.id;
    final lastAnalyzedTimestamp = this.lastAnalyzedTimestamp;
    final listAntipatternSeveritySummary = this.listAntipatternSeveritySummary;
    final name = this.name;
    final recommendationSet = this.recommendationSet;
    final serverError = this.serverError;
    final serverType = this.serverType;
    final statusMessage = this.statusMessage;
    final systemInfo = this.systemInfo;
    return {
      if (antipatternReportS3Object != null)
        'antipatternReportS3Object': antipatternReportS3Object,
      if (antipatternReportStatus != null)
        'antipatternReportStatus': antipatternReportStatus.value,
      if (antipatternReportStatusMessage != null)
        'antipatternReportStatusMessage': antipatternReportStatusMessage,
      if (applicationComponentStrategySummary != null)
        'applicationComponentStrategySummary':
            applicationComponentStrategySummary,
      if (dataCollectionStatus != null)
        'dataCollectionStatus': dataCollectionStatus.value,
      if (id != null) 'id': id,
      if (lastAnalyzedTimestamp != null)
        'lastAnalyzedTimestamp': unixTimestampToJson(lastAnalyzedTimestamp),
      if (listAntipatternSeveritySummary != null)
        'listAntipatternSeveritySummary': listAntipatternSeveritySummary,
      if (name != null) 'name': name,
      if (recommendationSet != null) 'recommendationSet': recommendationSet,
      if (serverError != null) 'serverError': serverError,
      if (serverType != null) 'serverType': serverType,
      if (statusMessage != null) 'statusMessage': statusMessage,
      if (systemInfo != null) 'systemInfo': systemInfo,
    };
  }
}

/// The error in server analysis.
class ServerError {
  /// The error category of server analysis.
  final ServerErrorCategory? serverErrorCategory;

  ServerError({
    this.serverErrorCategory,
  });

  factory ServerError.fromJson(Map<String, dynamic> json) {
    return ServerError(
      serverErrorCategory: (json['serverErrorCategory'] as String?)
          ?.let(ServerErrorCategory.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final serverErrorCategory = this.serverErrorCategory;
    return {
      if (serverErrorCategory != null)
        'serverErrorCategory': serverErrorCategory.value,
    };
  }
}

enum ServerErrorCategory {
  connectivityError('CONNECTIVITY_ERROR'),
  credentialError('CREDENTIAL_ERROR'),
  permissionError('PERMISSION_ERROR'),
  architectureError('ARCHITECTURE_ERROR'),
  otherError('OTHER_ERROR'),
  ;

  final String value;

  const ServerErrorCategory(this.value);

  static ServerErrorCategory fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum ServerErrorCategory'));
}

enum ServerOsType {
  windowsServer('WindowsServer'),
  amazonLinux('AmazonLinux'),
  endOfSupportWindowsServer('EndOfSupportWindowsServer'),
  redhat('Redhat'),
  other('Other'),
  ;

  final String value;

  const ServerOsType(this.value);

  static ServerOsType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum ServerOsType'));
}

/// The status summary of the server analysis.
class ServerStatusSummary {
  /// The number of servers successfully analyzed, partially successful or failed
  /// analysis.
  final int? count;

  /// The status of the run time.
  final RunTimeAssessmentStatus? runTimeAssessmentStatus;

  ServerStatusSummary({
    this.count,
    this.runTimeAssessmentStatus,
  });

  factory ServerStatusSummary.fromJson(Map<String, dynamic> json) {
    return ServerStatusSummary(
      count: json['count'] as int?,
      runTimeAssessmentStatus: (json['runTimeAssessmentStatus'] as String?)
          ?.let(RunTimeAssessmentStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final count = this.count;
    final runTimeAssessmentStatus = this.runTimeAssessmentStatus;
    return {
      if (count != null) 'count': count,
      if (runTimeAssessmentStatus != null)
        'runTimeAssessmentStatus': runTimeAssessmentStatus.value,
    };
  }
}

/// Contains information about a strategy recommendation for a server.
class ServerStrategy {
  /// Set to true if the recommendation is set as preferred.
  final bool? isPreferred;

  /// The number of application components with this strategy recommendation
  /// running on the server.
  final int? numberOfApplicationComponents;

  /// Strategy recommendation for the server.
  final RecommendationSet? recommendation;

  /// The recommendation status of the strategy for the server.
  final StrategyRecommendation? status;

  ServerStrategy({
    this.isPreferred,
    this.numberOfApplicationComponents,
    this.recommendation,
    this.status,
  });

  factory ServerStrategy.fromJson(Map<String, dynamic> json) {
    return ServerStrategy(
      isPreferred: json['isPreferred'] as bool?,
      numberOfApplicationComponents:
          json['numberOfApplicationComponents'] as int?,
      recommendation: json['recommendation'] != null
          ? RecommendationSet.fromJson(
              json['recommendation'] as Map<String, dynamic>)
          : null,
      status:
          (json['status'] as String?)?.let(StrategyRecommendation.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final isPreferred = this.isPreferred;
    final numberOfApplicationComponents = this.numberOfApplicationComponents;
    final recommendation = this.recommendation;
    final status = this.status;
    return {
      if (isPreferred != null) 'isPreferred': isPreferred,
      if (numberOfApplicationComponents != null)
        'numberOfApplicationComponents': numberOfApplicationComponents,
      if (recommendation != null) 'recommendation': recommendation,
      if (status != null) 'status': status.value,
    };
  }
}

/// Object containing details about the servers imported by Application
/// Discovery Service
class ServerSummary {
  /// Type of operating system for the servers.
  final ServerOsType? serverOsType;

  /// Number of servers.
  final int? count;

  ServerSummary({
    this.serverOsType,
    this.count,
  });

  factory ServerSummary.fromJson(Map<String, dynamic> json) {
    return ServerSummary(
      serverOsType:
          (json['ServerOsType'] as String?)?.let(ServerOsType.fromString),
      count: json['count'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final serverOsType = this.serverOsType;
    final count = this.count;
    return {
      if (serverOsType != null) 'ServerOsType': serverOsType.value,
      if (count != null) 'count': count,
    };
  }
}

enum Severity {
  high('HIGH'),
  medium('MEDIUM'),
  low('LOW'),
  ;

  final String value;

  const Severity(this.value);

  static Severity fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum Severity'));
}

enum SortOrder {
  asc('ASC'),
  desc('DESC'),
  ;

  final String value;

  const SortOrder(this.value);

  static SortOrder fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum SortOrder'));
}

/// Object containing source code information that is linked to an application
/// component.
class SourceCode {
  /// The repository name for the source code.
  final String? location;

  /// The name of the project.
  final String? projectName;

  /// The branch of the source code.
  final String? sourceVersion;

  /// The type of repository to use for the source code.
  final VersionControl? versionControl;

  SourceCode({
    this.location,
    this.projectName,
    this.sourceVersion,
    this.versionControl,
  });

  Map<String, dynamic> toJson() {
    final location = this.location;
    final projectName = this.projectName;
    final sourceVersion = this.sourceVersion;
    final versionControl = this.versionControl;
    return {
      if (location != null) 'location': location,
      if (projectName != null) 'projectName': projectName,
      if (sourceVersion != null) 'sourceVersion': sourceVersion,
      if (versionControl != null) 'versionControl': versionControl.value,
    };
  }
}

enum SourceCodeAnalyzerName {
  csharpAnalyzer('CSHARP_ANALYZER'),
  javaAnalyzer('JAVA_ANALYZER'),
  bytecodeAnalyzer('BYTECODE_ANALYZER'),
  portingAssistant('PORTING_ASSISTANT'),
  ;

  final String value;

  const SourceCodeAnalyzerName(this.value);

  static SourceCodeAnalyzerName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum SourceCodeAnalyzerName'));
}

/// Object containing source code information that is linked to an application
/// component.
class SourceCodeRepository {
  /// The branch of the source code.
  final String? branch;

  /// The name of the project.
  final String? projectName;

  /// The repository name for the source code.
  final String? repository;

  /// The type of repository to use for the source code.
  final String? versionControlType;

  SourceCodeRepository({
    this.branch,
    this.projectName,
    this.repository,
    this.versionControlType,
  });

  factory SourceCodeRepository.fromJson(Map<String, dynamic> json) {
    return SourceCodeRepository(
      branch: json['branch'] as String?,
      projectName: json['projectName'] as String?,
      repository: json['repository'] as String?,
      versionControlType: json['versionControlType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final branch = this.branch;
    final projectName = this.projectName;
    final repository = this.repository;
    final versionControlType = this.versionControlType;
    return {
      if (branch != null) 'branch': branch,
      if (projectName != null) 'projectName': projectName,
      if (repository != null) 'repository': repository,
      if (versionControlType != null) 'versionControlType': versionControlType,
    };
  }
}

enum SrcCodeOrDbAnalysisStatus {
  analysisToBeScheduled('ANALYSIS_TO_BE_SCHEDULED'),
  analysisStarted('ANALYSIS_STARTED'),
  analysisSuccess('ANALYSIS_SUCCESS'),
  analysisFailed('ANALYSIS_FAILED'),
  analysisPartialSuccess('ANALYSIS_PARTIAL_SUCCESS'),
  unconfigured('UNCONFIGURED'),
  configured('CONFIGURED'),
  ;

  final String value;

  const SrcCodeOrDbAnalysisStatus(this.value);

  static SrcCodeOrDbAnalysisStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum SrcCodeOrDbAnalysisStatus'));
}

class StartAssessmentResponse {
  /// The ID of the assessment.
  final String? assessmentId;

  StartAssessmentResponse({
    this.assessmentId,
  });

  factory StartAssessmentResponse.fromJson(Map<String, dynamic> json) {
    return StartAssessmentResponse(
      assessmentId: json['assessmentId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final assessmentId = this.assessmentId;
    return {
      if (assessmentId != null) 'assessmentId': assessmentId,
    };
  }
}

class StartImportFileTaskResponse {
  /// The ID for a specific import task. The ID is unique within an AWS account.
  final String? id;

  StartImportFileTaskResponse({
    this.id,
  });

  factory StartImportFileTaskResponse.fromJson(Map<String, dynamic> json) {
    return StartImportFileTaskResponse(
      id: json['id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    return {
      if (id != null) 'id': id,
    };
  }
}

class StartRecommendationReportGenerationResponse {
  /// The ID of the recommendation report generation task.
  final String? id;

  StartRecommendationReportGenerationResponse({
    this.id,
  });

  factory StartRecommendationReportGenerationResponse.fromJson(
      Map<String, dynamic> json) {
    return StartRecommendationReportGenerationResponse(
      id: json['id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    return {
      if (id != null) 'id': id,
    };
  }
}

class StopAssessmentResponse {
  StopAssessmentResponse();

  factory StopAssessmentResponse.fromJson(Map<String, dynamic> _) {
    return StopAssessmentResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum Strategy {
  rehost('Rehost'),
  retirement('Retirement'),
  refactor('Refactor'),
  replatform('Replatform'),
  retain('Retain'),
  relocate('Relocate'),
  repurchase('Repurchase'),
  ;

  final String value;

  const Strategy(this.value);

  static Strategy fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum Strategy'));
}

/// Information about all the available strategy options for migrating and
/// modernizing an application component.
class StrategyOption {
  /// Indicates if a specific strategy is preferred for the application component.
  final bool? isPreferred;

  /// Type of transformation. For example, Rehost, Replatform, and so on.
  final Strategy? strategy;

  /// Destination information about where the application component can migrate
  /// to. For example, <code>EC2</code>, <code>ECS</code>, and so on.
  final TargetDestination? targetDestination;

  /// The name of the tool that can be used to transform an application component
  /// using this strategy.
  final TransformationToolName? toolName;

  StrategyOption({
    this.isPreferred,
    this.strategy,
    this.targetDestination,
    this.toolName,
  });

  Map<String, dynamic> toJson() {
    final isPreferred = this.isPreferred;
    final strategy = this.strategy;
    final targetDestination = this.targetDestination;
    final toolName = this.toolName;
    return {
      if (isPreferred != null) 'isPreferred': isPreferred,
      if (strategy != null) 'strategy': strategy.value,
      if (targetDestination != null)
        'targetDestination': targetDestination.value,
      if (toolName != null) 'toolName': toolName.value,
    };
  }
}

enum StrategyRecommendation {
  recommended('recommended'),
  viableOption('viableOption'),
  notRecommended('notRecommended'),
  potential('potential'),
  ;

  final String value;

  const StrategyRecommendation(this.value);

  static StrategyRecommendation fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum StrategyRecommendation'));
}

/// Object containing the summary of the strategy recommendations.
class StrategySummary {
  /// The count of recommendations per strategy.
  final int? count;

  /// The name of recommended strategy.
  final Strategy? strategy;

  StrategySummary({
    this.count,
    this.strategy,
  });

  factory StrategySummary.fromJson(Map<String, dynamic> json) {
    return StrategySummary(
      count: json['count'] as int?,
      strategy: (json['strategy'] as String?)?.let(Strategy.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final count = this.count;
    final strategy = this.strategy;
    return {
      if (count != null) 'count': count,
      if (strategy != null) 'strategy': strategy.value,
    };
  }
}

/// Information about the server that hosts application components.
class SystemInfo {
  /// CPU architecture type for the server.
  final String? cpuArchitecture;

  /// File system type for the server.
  final String? fileSystemType;

  /// Networking information related to a server.
  final List<NetworkInfo>? networkInfoList;

  /// Operating system corresponding to a server.
  final OSInfo? osInfo;

  SystemInfo({
    this.cpuArchitecture,
    this.fileSystemType,
    this.networkInfoList,
    this.osInfo,
  });

  factory SystemInfo.fromJson(Map<String, dynamic> json) {
    return SystemInfo(
      cpuArchitecture: json['cpuArchitecture'] as String?,
      fileSystemType: json['fileSystemType'] as String?,
      networkInfoList: (json['networkInfoList'] as List?)
          ?.nonNulls
          .map((e) => NetworkInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      osInfo: json['osInfo'] != null
          ? OSInfo.fromJson(json['osInfo'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final cpuArchitecture = this.cpuArchitecture;
    final fileSystemType = this.fileSystemType;
    final networkInfoList = this.networkInfoList;
    final osInfo = this.osInfo;
    return {
      if (cpuArchitecture != null) 'cpuArchitecture': cpuArchitecture,
      if (fileSystemType != null) 'fileSystemType': fileSystemType,
      if (networkInfoList != null) 'networkInfoList': networkInfoList,
      if (osInfo != null) 'osInfo': osInfo,
    };
  }
}

enum TargetDatabaseEngine {
  noneSpecified('None specified'),
  amazonAurora('Amazon Aurora'),
  awsPostgreSQL('AWS PostgreSQL'),
  mySQL('MySQL'),
  microsoftSqlServer('Microsoft SQL Server'),
  oracleDatabase('Oracle Database'),
  mariaDB('MariaDB'),
  sap('SAP'),
  db2Luw('Db2 LUW'),
  mongoDB('MongoDB'),
  ;

  final String value;

  const TargetDatabaseEngine(this.value);

  static TargetDatabaseEngine fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum TargetDatabaseEngine'));
}

enum TargetDestination {
  noneSpecified('None specified'),
  awsElasticBeanStalk('AWS Elastic BeanStalk'),
  awsFargate('AWS Fargate'),
  amazonElasticCloudComputeEc2('Amazon Elastic Cloud Compute (EC2)'),
  amazonElasticContainerServiceEcs('Amazon Elastic Container Service (ECS)'),
  amazonElasticKubernetesServiceEks('Amazon Elastic Kubernetes Service (EKS)'),
  auroraMySQL('Aurora MySQL'),
  auroraPostgreSQL('Aurora PostgreSQL'),
  amazonRelationalDatabaseServiceOnMySQL(
      'Amazon Relational Database Service on MySQL'),
  amazonRelationalDatabaseServiceOnPostgreSQL(
      'Amazon Relational Database Service on PostgreSQL'),
  amazonDocumentDB('Amazon DocumentDB'),
  amazonDynamoDB('Amazon DynamoDB'),
  amazonRelationalDatabaseService('Amazon Relational Database Service'),
  babelfishForAuroraPostgreSQL('Babelfish for Aurora PostgreSQL'),
  ;

  final String value;

  const TargetDestination(this.value);

  static TargetDestination fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum TargetDestination'));
}

/// Information of the transformation tool that can be used to migrate and
/// modernize the application.
class TransformationTool {
  /// Description of the tool.
  final String? description;

  /// Name of the tool.
  final TransformationToolName? name;

  /// URL for installing the tool.
  final String? tranformationToolInstallationLink;

  TransformationTool({
    this.description,
    this.name,
    this.tranformationToolInstallationLink,
  });

  factory TransformationTool.fromJson(Map<String, dynamic> json) {
    return TransformationTool(
      description: json['description'] as String?,
      name: (json['name'] as String?)?.let(TransformationToolName.fromString),
      tranformationToolInstallationLink:
          json['tranformationToolInstallationLink'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final name = this.name;
    final tranformationToolInstallationLink =
        this.tranformationToolInstallationLink;
    return {
      if (description != null) 'description': description,
      if (name != null) 'name': name.value,
      if (tranformationToolInstallationLink != null)
        'tranformationToolInstallationLink': tranformationToolInstallationLink,
    };
  }
}

enum TransformationToolName {
  app2Container('App2Container'),
  portingAssistantForNet('Porting Assistant For .NET'),
  endOfSupportMigration('End of Support Migration'),
  windowsWebApplicationMigrationAssistant(
      'Windows Web Application Migration Assistant'),
  applicationMigrationService('Application Migration Service'),
  strategyRecommendationSupport('Strategy Recommendation Support'),
  inPlaceOperatingSystemUpgrade('In Place Operating System Upgrade'),
  schemaConversionTool('Schema Conversion Tool'),
  databaseMigrationService('Database Migration Service'),
  nativeSqlServerBackupRestore('Native SQL Server Backup/Restore'),
  ;

  final String value;

  const TransformationToolName(this.value);

  static TransformationToolName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum TransformationToolName'));
}

class UpdateApplicationComponentConfigResponse {
  UpdateApplicationComponentConfigResponse();

  factory UpdateApplicationComponentConfigResponse.fromJson(
      Map<String, dynamic> _) {
    return UpdateApplicationComponentConfigResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateServerConfigResponse {
  UpdateServerConfigResponse();

  factory UpdateServerConfigResponse.fromJson(Map<String, dynamic> _) {
    return UpdateServerConfigResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Details about the server in vCenter.
class VcenterBasedRemoteInfo {
  /// The type of the operating system.
  final OSType? osType;

  /// The time when the remote server based on vCenter was last configured.
  final String? vcenterConfigurationTimeStamp;

  VcenterBasedRemoteInfo({
    this.osType,
    this.vcenterConfigurationTimeStamp,
  });

  factory VcenterBasedRemoteInfo.fromJson(Map<String, dynamic> json) {
    return VcenterBasedRemoteInfo(
      osType: (json['osType'] as String?)?.let(OSType.fromString),
      vcenterConfigurationTimeStamp:
          json['vcenterConfigurationTimeStamp'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final osType = this.osType;
    final vcenterConfigurationTimeStamp = this.vcenterConfigurationTimeStamp;
    return {
      if (osType != null) 'osType': osType.value,
      if (vcenterConfigurationTimeStamp != null)
        'vcenterConfigurationTimeStamp': vcenterConfigurationTimeStamp,
    };
  }
}

enum VersionControl {
  github('GITHUB'),
  githubEnterprise('GITHUB_ENTERPRISE'),
  azureDevopsGit('AZURE_DEVOPS_GIT'),
  ;

  final String value;

  const VersionControl(this.value);

  static VersionControl fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum VersionControl'));
}

/// Details about the version control configuration.
class VersionControlInfo {
  /// The time when the version control system was last configured.
  final String? versionControlConfigurationTimeStamp;

  /// The type of version control.
  final VersionControlType? versionControlType;

  VersionControlInfo({
    this.versionControlConfigurationTimeStamp,
    this.versionControlType,
  });

  factory VersionControlInfo.fromJson(Map<String, dynamic> json) {
    return VersionControlInfo(
      versionControlConfigurationTimeStamp:
          json['versionControlConfigurationTimeStamp'] as String?,
      versionControlType: (json['versionControlType'] as String?)
          ?.let(VersionControlType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final versionControlConfigurationTimeStamp =
        this.versionControlConfigurationTimeStamp;
    final versionControlType = this.versionControlType;
    return {
      if (versionControlConfigurationTimeStamp != null)
        'versionControlConfigurationTimeStamp':
            versionControlConfigurationTimeStamp,
      if (versionControlType != null)
        'versionControlType': versionControlType.value,
    };
  }
}

enum VersionControlType {
  github('GITHUB'),
  githubEnterprise('GITHUB_ENTERPRISE'),
  azureDevopsGit('AZURE_DEVOPS_GIT'),
  ;

  final String value;

  const VersionControlType(this.value);

  static VersionControlType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum VersionControlType'));
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class DependencyException extends _s.GenericAwsException {
  DependencyException({String? type, String? message})
      : super(type: type, code: 'DependencyException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceLinkedRoleLockClientException extends _s.GenericAwsException {
  ServiceLinkedRoleLockClientException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceLinkedRoleLockClientException',
            message: message);
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
  'DependencyException': (type, message) =>
      DependencyException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceLinkedRoleLockClientException': (type, message) =>
      ServiceLinkedRoleLockClientException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
