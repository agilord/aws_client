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
      if (sort != null) 'sort': sort.toValue(),
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
        'applicationComponentCriteria': applicationComponentCriteria.toValue(),
      if (filterValue != null) 'filterValue': filterValue,
      if (groupIdFilter != null) 'groupIdFilter': groupIdFilter,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (sort != null) 'sort': sort.toValue(),
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
      if (serverCriteria != null) 'serverCriteria': serverCriteria.toValue(),
      if (sort != null) 'sort': sort.toValue(),
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
      if (applicationMode != null) 'applicationMode': applicationMode.toValue(),
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
        'assessmentDataSourceType': assessmentDataSourceType.toValue(),
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
      if (dataSourceType != null) 'dataSourceType': dataSourceType.toValue(),
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
      if (outputFormat != null) 'outputFormat': outputFormat.toValue(),
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
      if (appType != null) 'appType': appType.toValue(),
      if (configureOnly != null) 'configureOnly': configureOnly,
      if (inclusionStatus != null) 'inclusionStatus': inclusionStatus.toValue(),
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
      runtimeAnalysisStatus:
          (json['runtimeAnalysisStatus'] as String?)?.toRuntimeAnalysisStatus(),
      srcCodeOrDbAnalysisStatus: (json['srcCodeOrDbAnalysisStatus'] as String?)
          ?.toSrcCodeOrDbAnalysisStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final runtimeAnalysisStatus = this.runtimeAnalysisStatus;
    final srcCodeOrDbAnalysisStatus = this.srcCodeOrDbAnalysisStatus;
    return {
      if (runtimeAnalysisStatus != null)
        'runtimeAnalysisStatus': runtimeAnalysisStatus.toValue(),
      if (srcCodeOrDbAnalysisStatus != null)
        'srcCodeOrDbAnalysisStatus': srcCodeOrDbAnalysisStatus.toValue(),
    };
  }
}

enum AnalysisType {
  sourceCodeAnalysis,
  databaseAnalysis,
  runtimeAnalysis,
  binaryAnalysis,
}

extension AnalysisTypeValueExtension on AnalysisType {
  String toValue() {
    switch (this) {
      case AnalysisType.sourceCodeAnalysis:
        return 'SOURCE_CODE_ANALYSIS';
      case AnalysisType.databaseAnalysis:
        return 'DATABASE_ANALYSIS';
      case AnalysisType.runtimeAnalysis:
        return 'RUNTIME_ANALYSIS';
      case AnalysisType.binaryAnalysis:
        return 'BINARY_ANALYSIS';
    }
  }
}

extension AnalysisTypeFromString on String {
  AnalysisType toAnalysisType() {
    switch (this) {
      case 'SOURCE_CODE_ANALYSIS':
        return AnalysisType.sourceCodeAnalysis;
      case 'DATABASE_ANALYSIS':
        return AnalysisType.databaseAnalysis;
      case 'RUNTIME_ANALYSIS':
        return AnalysisType.runtimeAnalysis;
      case 'BINARY_ANALYSIS':
        return AnalysisType.binaryAnalysis;
    }
    throw Exception('$this is not known in enum AnalysisType');
  }
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
      binaryAnalyzerName:
          (json['binaryAnalyzerName'] as String?)?.toBinaryAnalyzerName(),
      runTimeAnalyzerName:
          (json['runTimeAnalyzerName'] as String?)?.toRunTimeAnalyzerName(),
      sourceCodeAnalyzerName: (json['sourceCodeAnalyzerName'] as String?)
          ?.toSourceCodeAnalyzerName(),
    );
  }

  Map<String, dynamic> toJson() {
    final binaryAnalyzerName = this.binaryAnalyzerName;
    final runTimeAnalyzerName = this.runTimeAnalyzerName;
    final sourceCodeAnalyzerName = this.sourceCodeAnalyzerName;
    return {
      if (binaryAnalyzerName != null)
        'binaryAnalyzerName': binaryAnalyzerName.toValue(),
      if (runTimeAnalyzerName != null)
        'runTimeAnalyzerName': runTimeAnalyzerName.toValue(),
      if (sourceCodeAnalyzerName != null)
        'sourceCodeAnalyzerName': sourceCodeAnalyzerName.toValue(),
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
          ?.toAntipatternReportStatus(),
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
        'antipatternReportStatus': antipatternReportStatus.toValue(),
      if (antipatternReportStatusMessage != null)
        'antipatternReportStatusMessage': antipatternReportStatusMessage,
    };
  }
}

enum AntipatternReportStatus {
  failed,
  inProgress,
  success,
}

extension AntipatternReportStatusValueExtension on AntipatternReportStatus {
  String toValue() {
    switch (this) {
      case AntipatternReportStatus.failed:
        return 'FAILED';
      case AntipatternReportStatus.inProgress:
        return 'IN_PROGRESS';
      case AntipatternReportStatus.success:
        return 'SUCCESS';
    }
  }
}

extension AntipatternReportStatusFromString on String {
  AntipatternReportStatus toAntipatternReportStatus() {
    switch (this) {
      case 'FAILED':
        return AntipatternReportStatus.failed;
      case 'IN_PROGRESS':
        return AntipatternReportStatus.inProgress;
      case 'SUCCESS':
        return AntipatternReportStatus.success;
    }
    throw Exception('$this is not known in enum AntipatternReportStatus');
  }
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
      severity: (json['severity'] as String?)?.toSeverity(),
    );
  }

  Map<String, dynamic> toJson() {
    final count = this.count;
    final severity = this.severity;
    return {
      if (count != null) 'count': count,
      if (severity != null) 'severity': severity.toValue(),
    };
  }
}

enum AppType {
  dotNetFramework,
  java,
  sQLServer,
  iis,
  oracle,
  other,
  tomcat,
  jBoss,
  spring,
  mongoDb,
  db2,
  mariaDb,
  mySQL,
  sybase,
  postgreSQLServer,
  cassandra,
  ibmWebSphere,
  oracleWebLogic,
  visualBasic,
  unknown,
  dotnetCore,
  dotnet,
}

extension AppTypeValueExtension on AppType {
  String toValue() {
    switch (this) {
      case AppType.dotNetFramework:
        return 'DotNetFramework';
      case AppType.java:
        return 'Java';
      case AppType.sQLServer:
        return 'SQLServer';
      case AppType.iis:
        return 'IIS';
      case AppType.oracle:
        return 'Oracle';
      case AppType.other:
        return 'Other';
      case AppType.tomcat:
        return 'Tomcat';
      case AppType.jBoss:
        return 'JBoss';
      case AppType.spring:
        return 'Spring';
      case AppType.mongoDb:
        return 'Mongo DB';
      case AppType.db2:
        return 'DB2';
      case AppType.mariaDb:
        return 'Maria DB';
      case AppType.mySQL:
        return 'MySQL';
      case AppType.sybase:
        return 'Sybase';
      case AppType.postgreSQLServer:
        return 'PostgreSQLServer';
      case AppType.cassandra:
        return 'Cassandra';
      case AppType.ibmWebSphere:
        return 'IBM WebSphere';
      case AppType.oracleWebLogic:
        return 'Oracle WebLogic';
      case AppType.visualBasic:
        return 'Visual Basic';
      case AppType.unknown:
        return 'Unknown';
      case AppType.dotnetCore:
        return 'DotnetCore';
      case AppType.dotnet:
        return 'Dotnet';
    }
  }
}

extension AppTypeFromString on String {
  AppType toAppType() {
    switch (this) {
      case 'DotNetFramework':
        return AppType.dotNetFramework;
      case 'Java':
        return AppType.java;
      case 'SQLServer':
        return AppType.sQLServer;
      case 'IIS':
        return AppType.iis;
      case 'Oracle':
        return AppType.oracle;
      case 'Other':
        return AppType.other;
      case 'Tomcat':
        return AppType.tomcat;
      case 'JBoss':
        return AppType.jBoss;
      case 'Spring':
        return AppType.spring;
      case 'Mongo DB':
        return AppType.mongoDb;
      case 'DB2':
        return AppType.db2;
      case 'Maria DB':
        return AppType.mariaDb;
      case 'MySQL':
        return AppType.mySQL;
      case 'Sybase':
        return AppType.sybase;
      case 'PostgreSQLServer':
        return AppType.postgreSQLServer;
      case 'Cassandra':
        return AppType.cassandra;
      case 'IBM WebSphere':
        return AppType.ibmWebSphere;
      case 'Oracle WebLogic':
        return AppType.oracleWebLogic;
      case 'Visual Basic':
        return AppType.visualBasic;
      case 'Unknown':
        return AppType.unknown;
      case 'DotnetCore':
        return AppType.dotnetCore;
      case 'Dotnet':
        return AppType.dotnet;
    }
    throw Exception('$this is not known in enum AppType');
  }
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
      appUnitErrorCategory:
          (json['appUnitErrorCategory'] as String?)?.toAppUnitErrorCategory(),
    );
  }

  Map<String, dynamic> toJson() {
    final appUnitErrorCategory = this.appUnitErrorCategory;
    return {
      if (appUnitErrorCategory != null)
        'appUnitErrorCategory': appUnitErrorCategory.toValue(),
    };
  }
}

enum AppUnitErrorCategory {
  credentialError,
  connectivityError,
  permissionError,
  unsupportedError,
  otherError,
}

extension AppUnitErrorCategoryValueExtension on AppUnitErrorCategory {
  String toValue() {
    switch (this) {
      case AppUnitErrorCategory.credentialError:
        return 'CREDENTIAL_ERROR';
      case AppUnitErrorCategory.connectivityError:
        return 'CONNECTIVITY_ERROR';
      case AppUnitErrorCategory.permissionError:
        return 'PERMISSION_ERROR';
      case AppUnitErrorCategory.unsupportedError:
        return 'UNSUPPORTED_ERROR';
      case AppUnitErrorCategory.otherError:
        return 'OTHER_ERROR';
    }
  }
}

extension AppUnitErrorCategoryFromString on String {
  AppUnitErrorCategory toAppUnitErrorCategory() {
    switch (this) {
      case 'CREDENTIAL_ERROR':
        return AppUnitErrorCategory.credentialError;
      case 'CONNECTIVITY_ERROR':
        return AppUnitErrorCategory.connectivityError;
      case 'PERMISSION_ERROR':
        return AppUnitErrorCategory.permissionError;
      case 'UNSUPPORTED_ERROR':
        return AppUnitErrorCategory.unsupportedError;
      case 'OTHER_ERROR':
        return AppUnitErrorCategory.otherError;
    }
    throw Exception('$this is not known in enum AppUnitErrorCategory');
  }
}

enum ApplicationComponentCriteria {
  notDefined,
  appName,
  serverId,
  appType,
  strategy,
  destination,
  analysisStatus,
  errorCategory,
}

extension ApplicationComponentCriteriaValueExtension
    on ApplicationComponentCriteria {
  String toValue() {
    switch (this) {
      case ApplicationComponentCriteria.notDefined:
        return 'NOT_DEFINED';
      case ApplicationComponentCriteria.appName:
        return 'APP_NAME';
      case ApplicationComponentCriteria.serverId:
        return 'SERVER_ID';
      case ApplicationComponentCriteria.appType:
        return 'APP_TYPE';
      case ApplicationComponentCriteria.strategy:
        return 'STRATEGY';
      case ApplicationComponentCriteria.destination:
        return 'DESTINATION';
      case ApplicationComponentCriteria.analysisStatus:
        return 'ANALYSIS_STATUS';
      case ApplicationComponentCriteria.errorCategory:
        return 'ERROR_CATEGORY';
    }
  }
}

extension ApplicationComponentCriteriaFromString on String {
  ApplicationComponentCriteria toApplicationComponentCriteria() {
    switch (this) {
      case 'NOT_DEFINED':
        return ApplicationComponentCriteria.notDefined;
      case 'APP_NAME':
        return ApplicationComponentCriteria.appName;
      case 'SERVER_ID':
        return ApplicationComponentCriteria.serverId;
      case 'APP_TYPE':
        return ApplicationComponentCriteria.appType;
      case 'STRATEGY':
        return ApplicationComponentCriteria.strategy;
      case 'DESTINATION':
        return ApplicationComponentCriteria.destination;
      case 'ANALYSIS_STATUS':
        return ApplicationComponentCriteria.analysisStatus;
      case 'ERROR_CATEGORY':
        return ApplicationComponentCriteria.errorCategory;
    }
    throw Exception('$this is not known in enum ApplicationComponentCriteria');
  }
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
      analysisStatus:
          (json['analysisStatus'] as String?)?.toSrcCodeOrDbAnalysisStatus(),
      antipatternReportS3Object: json['antipatternReportS3Object'] != null
          ? S3Object.fromJson(
              json['antipatternReportS3Object'] as Map<String, dynamic>)
          : null,
      antipatternReportStatus: (json['antipatternReportStatus'] as String?)
          ?.toAntipatternReportStatus(),
      antipatternReportStatusMessage:
          json['antipatternReportStatusMessage'] as String?,
      appType: (json['appType'] as String?)?.toAppType(),
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
          (json['inclusionStatus'] as String?)?.toInclusionStatus(),
      lastAnalyzedTimestamp: timeStampFromJson(json['lastAnalyzedTimestamp']),
      listAntipatternSeveritySummary: (json['listAntipatternSeveritySummary']
              as List?)
          ?.whereNotNull()
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
          (json['resourceSubType'] as String?)?.toResourceSubType(),
      resultList: (json['resultList'] as List?)
          ?.whereNotNull()
          .map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
      runtimeStatus:
          (json['runtimeStatus'] as String?)?.toRuntimeAnalysisStatus(),
      runtimeStatusMessage: json['runtimeStatusMessage'] as String?,
      sourceCodeRepositories: (json['sourceCodeRepositories'] as List?)
          ?.whereNotNull()
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
      if (analysisStatus != null) 'analysisStatus': analysisStatus.toValue(),
      if (antipatternReportS3Object != null)
        'antipatternReportS3Object': antipatternReportS3Object,
      if (antipatternReportStatus != null)
        'antipatternReportStatus': antipatternReportStatus.toValue(),
      if (antipatternReportStatusMessage != null)
        'antipatternReportStatusMessage': antipatternReportStatusMessage,
      if (appType != null) 'appType': appType.toValue(),
      if (appUnitError != null) 'appUnitError': appUnitError,
      if (associatedServerId != null) 'associatedServerId': associatedServerId,
      if (databaseConfigDetail != null)
        'databaseConfigDetail': databaseConfigDetail,
      if (id != null) 'id': id,
      if (inclusionStatus != null) 'inclusionStatus': inclusionStatus.toValue(),
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
      if (resourceSubType != null) 'resourceSubType': resourceSubType.toValue(),
      if (resultList != null) 'resultList': resultList,
      if (runtimeStatus != null) 'runtimeStatus': runtimeStatus.toValue(),
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
          ?.toSrcCodeOrDbAnalysisStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final count = this.count;
    final srcCodeOrDbAnalysisStatus = this.srcCodeOrDbAnalysisStatus;
    return {
      if (count != null) 'count': count,
      if (srcCodeOrDbAnalysisStatus != null)
        'srcCodeOrDbAnalysisStatus': srcCodeOrDbAnalysisStatus.toValue(),
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
      status: (json['status'] as String?)?.toStrategyRecommendation(),
    );
  }

  Map<String, dynamic> toJson() {
    final isPreferred = this.isPreferred;
    final recommendation = this.recommendation;
    final status = this.status;
    return {
      if (isPreferred != null) 'isPreferred': isPreferred,
      if (recommendation != null) 'recommendation': recommendation,
      if (status != null) 'status': status.toValue(),
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
      appType: (json['appType'] as String?)?.toAppType(),
      count: json['count'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final appType = this.appType;
    final count = this.count;
    return {
      if (appType != null) 'appType': appType.toValue(),
      if (count != null) 'count': count,
    };
  }
}

enum ApplicationMode {
  all,
  known,
  unknown,
}

extension ApplicationModeValueExtension on ApplicationMode {
  String toValue() {
    switch (this) {
      case ApplicationMode.all:
        return 'ALL';
      case ApplicationMode.known:
        return 'KNOWN';
      case ApplicationMode.unknown:
        return 'UNKNOWN';
    }
  }
}

extension ApplicationModeFromString on String {
  ApplicationMode toApplicationMode() {
    switch (this) {
      case 'ALL':
        return ApplicationMode.all;
      case 'KNOWN':
        return ApplicationMode.known;
      case 'UNKNOWN':
        return ApplicationMode.unknown;
    }
    throw Exception('$this is not known in enum ApplicationMode');
  }
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
  strategyRecommendationsApplicationDataCollector,
  manualImport,
  applicationDiscoveryService,
}

extension AssessmentDataSourceTypeValueExtension on AssessmentDataSourceType {
  String toValue() {
    switch (this) {
      case AssessmentDataSourceType
            .strategyRecommendationsApplicationDataCollector:
        return 'StrategyRecommendationsApplicationDataCollector';
      case AssessmentDataSourceType.manualImport:
        return 'ManualImport';
      case AssessmentDataSourceType.applicationDiscoveryService:
        return 'ApplicationDiscoveryService';
    }
  }
}

extension AssessmentDataSourceTypeFromString on String {
  AssessmentDataSourceType toAssessmentDataSourceType() {
    switch (this) {
      case 'StrategyRecommendationsApplicationDataCollector':
        return AssessmentDataSourceType
            .strategyRecommendationsApplicationDataCollector;
      case 'ManualImport':
        return AssessmentDataSourceType.manualImport;
      case 'ApplicationDiscoveryService':
        return AssessmentDataSourceType.applicationDiscoveryService;
    }
    throw Exception('$this is not known in enum AssessmentDataSourceType');
  }
}

enum AssessmentStatus {
  inProgress,
  complete,
  failed,
  stopped,
}

extension AssessmentStatusValueExtension on AssessmentStatus {
  String toValue() {
    switch (this) {
      case AssessmentStatus.inProgress:
        return 'IN_PROGRESS';
      case AssessmentStatus.complete:
        return 'COMPLETE';
      case AssessmentStatus.failed:
        return 'FAILED';
      case AssessmentStatus.stopped:
        return 'STOPPED';
    }
  }
}

extension AssessmentStatusFromString on String {
  AssessmentStatus toAssessmentStatus() {
    switch (this) {
      case 'IN_PROGRESS':
        return AssessmentStatus.inProgress;
      case 'COMPLETE':
        return AssessmentStatus.complete;
      case 'FAILED':
        return AssessmentStatus.failed;
      case 'STOPPED':
        return AssessmentStatus.stopped;
    }
    throw Exception('$this is not known in enum AssessmentStatus');
  }
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
          ?.toAntipatternReportStatus(),
      antipatternReportStatusMessage:
          json['antipatternReportStatusMessage'] as String?,
      lastAnalyzedTimestamp: timeStampFromJson(json['lastAnalyzedTimestamp']),
      listAntipatternSeveritySummary: (json['listAntipatternSeveritySummary']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              AntipatternSeveritySummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      listApplicationComponentStatusSummary:
          (json['listApplicationComponentStatusSummary'] as List?)
              ?.whereNotNull()
              .map((e) => ApplicationComponentStatusSummary.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      listApplicationComponentStrategySummary:
          (json['listApplicationComponentStrategySummary'] as List?)
              ?.whereNotNull()
              .map((e) => StrategySummary.fromJson(e as Map<String, dynamic>))
              .toList(),
      listApplicationComponentSummary: (json['listApplicationComponentSummary']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              ApplicationComponentSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      listServerStatusSummary: (json['listServerStatusSummary'] as List?)
          ?.whereNotNull()
          .map((e) => ServerStatusSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      listServerStrategySummary: (json['listServerStrategySummary'] as List?)
          ?.whereNotNull()
          .map((e) => StrategySummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      listServerSummary: (json['listServerSummary'] as List?)
          ?.whereNotNull()
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
        'antipatternReportStatus': antipatternReportStatus.toValue(),
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
      condition: (json['condition'] as String).toCondition(),
      name: json['name'] as String,
      values: (json['values'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final condition = this.condition;
    final name = this.name;
    final values = this.values;
    return {
      'condition': condition.toValue(),
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
  ntlm,
  ssh,
  cert,
}

extension AuthTypeValueExtension on AuthType {
  String toValue() {
    switch (this) {
      case AuthType.ntlm:
        return 'NTLM';
      case AuthType.ssh:
        return 'SSH';
      case AuthType.cert:
        return 'CERT';
    }
  }
}

extension AuthTypeFromString on String {
  AuthType toAuthType() {
    switch (this) {
      case 'NTLM':
        return AuthType.ntlm;
      case 'SSH':
        return AuthType.ssh;
      case 'CERT':
        return AuthType.cert;
    }
    throw Exception('$this is not known in enum AuthType');
  }
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
          .whereNotNull()
          .map((e) => (e as String).toAwsManagedTargetDestination())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final targetDestination = this.targetDestination;
    return {
      'targetDestination': targetDestination.map((e) => e.toValue()).toList(),
    };
  }
}

enum AwsManagedTargetDestination {
  noneSpecified,
  awsElasticBeanStalk,
  awsFargate,
}

extension AwsManagedTargetDestinationValueExtension
    on AwsManagedTargetDestination {
  String toValue() {
    switch (this) {
      case AwsManagedTargetDestination.noneSpecified:
        return 'None specified';
      case AwsManagedTargetDestination.awsElasticBeanStalk:
        return 'AWS Elastic BeanStalk';
      case AwsManagedTargetDestination.awsFargate:
        return 'AWS Fargate';
    }
  }
}

extension AwsManagedTargetDestinationFromString on String {
  AwsManagedTargetDestination toAwsManagedTargetDestination() {
    switch (this) {
      case 'None specified':
        return AwsManagedTargetDestination.noneSpecified;
      case 'AWS Elastic BeanStalk':
        return AwsManagedTargetDestination.awsElasticBeanStalk;
      case 'AWS Fargate':
        return AwsManagedTargetDestination.awsFargate;
    }
    throw Exception('$this is not known in enum AwsManagedTargetDestination');
  }
}

enum BinaryAnalyzerName {
  dllAnalyzer,
  bytecodeAnalyzer,
}

extension BinaryAnalyzerNameValueExtension on BinaryAnalyzerName {
  String toValue() {
    switch (this) {
      case BinaryAnalyzerName.dllAnalyzer:
        return 'DLL_ANALYZER';
      case BinaryAnalyzerName.bytecodeAnalyzer:
        return 'BYTECODE_ANALYZER';
    }
  }
}

extension BinaryAnalyzerNameFromString on String {
  BinaryAnalyzerName toBinaryAnalyzerName() {
    switch (this) {
      case 'DLL_ANALYZER':
        return BinaryAnalyzerName.dllAnalyzer;
      case 'BYTECODE_ANALYZER':
        return BinaryAnalyzerName.bytecodeAnalyzer;
    }
    throw Exception('$this is not known in enum BinaryAnalyzerName');
  }
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
          (json['collectorHealth'] as String?)?.toCollectorHealth(),
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
      if (collectorHealth != null) 'collectorHealth': collectorHealth.toValue(),
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
  collectorHealthy,
  collectorUnhealthy,
}

extension CollectorHealthValueExtension on CollectorHealth {
  String toValue() {
    switch (this) {
      case CollectorHealth.collectorHealthy:
        return 'COLLECTOR_HEALTHY';
      case CollectorHealth.collectorUnhealthy:
        return 'COLLECTOR_UNHEALTHY';
    }
  }
}

extension CollectorHealthFromString on String {
  CollectorHealth toCollectorHealth() {
    switch (this) {
      case 'COLLECTOR_HEALTHY':
        return CollectorHealth.collectorHealthy;
      case 'COLLECTOR_UNHEALTHY':
        return CollectorHealth.collectorUnhealthy;
    }
    throw Exception('$this is not known in enum CollectorHealth');
  }
}

enum Condition {
  equals,
  notEquals,
  contains,
  notContains,
}

extension ConditionValueExtension on Condition {
  String toValue() {
    switch (this) {
      case Condition.equals:
        return 'EQUALS';
      case Condition.notEquals:
        return 'NOT_EQUALS';
      case Condition.contains:
        return 'CONTAINS';
      case Condition.notContains:
        return 'NOT_CONTAINS';
    }
  }
}

extension ConditionFromString on String {
  Condition toCondition() {
    switch (this) {
      case 'EQUALS':
        return Condition.equals;
      case 'NOT_EQUALS':
        return Condition.notEquals;
      case 'CONTAINS':
        return Condition.contains;
      case 'NOT_CONTAINS':
        return Condition.notContains;
    }
    throw Exception('$this is not known in enum Condition');
  }
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
              ?.whereNotNull()
              .map((e) =>
                  IPAddressBasedRemoteInfo.fromJson(e as Map<String, dynamic>))
              .toList(),
      pipelineInfoList: (json['pipelineInfoList'] as List?)
          ?.whereNotNull()
          .map((e) => PipelineInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      remoteSourceCodeAnalysisServerInfo:
          json['remoteSourceCodeAnalysisServerInfo'] != null
              ? RemoteSourceCodeAnalysisServerInfo.fromJson(
                  json['remoteSourceCodeAnalysisServerInfo']
                      as Map<String, dynamic>)
              : null,
      vcenterBasedRemoteInfoList: (json['vcenterBasedRemoteInfoList'] as List?)
          ?.whereNotNull()
          .map(
              (e) => VcenterBasedRemoteInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      versionControlInfoList: (json['versionControlInfoList'] as List?)
          ?.whereNotNull()
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
      status: (json['status'] as String?)?.toAssessmentStatus(),
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
      if (status != null) 'status': status.toValue(),
      if (statusMessage != null) 'statusMessage': statusMessage,
      if (success != null) 'success': success,
    };
  }
}

enum DataSourceType {
  applicationDiscoveryService,
  mpa,
  import,
  strategyRecommendationsApplicationDataCollector,
}

extension DataSourceTypeValueExtension on DataSourceType {
  String toValue() {
    switch (this) {
      case DataSourceType.applicationDiscoveryService:
        return 'ApplicationDiscoveryService';
      case DataSourceType.mpa:
        return 'MPA';
      case DataSourceType.import:
        return 'Import';
      case DataSourceType.strategyRecommendationsApplicationDataCollector:
        return 'StrategyRecommendationsApplicationDataCollector';
    }
  }
}

extension DataSourceTypeFromString on String {
  DataSourceType toDataSourceType() {
    switch (this) {
      case 'ApplicationDiscoveryService':
        return DataSourceType.applicationDiscoveryService;
      case 'MPA':
        return DataSourceType.mpa;
      case 'Import':
        return DataSourceType.import;
      case 'StrategyRecommendationsApplicationDataCollector':
        return DataSourceType.strategyRecommendationsApplicationDataCollector;
    }
    throw Exception('$this is not known in enum DataSourceType');
  }
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
  awsManaged,
  selfManage,
  noPreference,
}

extension DatabaseManagementPreferenceValueExtension
    on DatabaseManagementPreference {
  String toValue() {
    switch (this) {
      case DatabaseManagementPreference.awsManaged:
        return 'AWS-managed';
      case DatabaseManagementPreference.selfManage:
        return 'Self-manage';
      case DatabaseManagementPreference.noPreference:
        return 'No preference';
    }
  }
}

extension DatabaseManagementPreferenceFromString on String {
  DatabaseManagementPreference toDatabaseManagementPreference() {
    switch (this) {
      case 'AWS-managed':
        return DatabaseManagementPreference.awsManaged;
      case 'Self-manage':
        return DatabaseManagementPreference.selfManage;
      case 'No preference':
        return DatabaseManagementPreference.noPreference;
    }
    throw Exception('$this is not known in enum DatabaseManagementPreference');
  }
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
              ?.toDatabaseManagementPreference(),
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
        'databaseManagementPreference': databaseManagementPreference.toValue(),
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
          ?.whereNotNull()
          .map((e) => AssociatedApplication.fromJson(e as Map<String, dynamic>))
          .toList(),
      associatedServerIds: (json['associatedServerIds'] as List?)
          ?.whereNotNull()
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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
      status: (json['status'] as String?)?.toImportFileTaskStatus(),
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
      if (status != null) 'status': status.toValue(),
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
          (json['applicationMode'] as String?)?.toApplicationMode(),
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
      if (applicationMode != null) 'applicationMode': applicationMode.toValue(),
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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
      if (name != null) 'name': name.toValue(),
      if (value != null) 'value': value,
    };
  }
}

enum GroupName {
  externalId,
  externalSourceType,
}

extension GroupNameValueExtension on GroupName {
  String toValue() {
    switch (this) {
      case GroupName.externalId:
        return 'ExternalId';
      case GroupName.externalSourceType:
        return 'ExternalSourceType';
    }
  }
}

extension GroupNameFromString on String {
  GroupName toGroupName() {
    switch (this) {
      case 'ExternalId':
        return GroupName.externalId;
      case 'ExternalSourceType':
        return GroupName.externalSourceType;
    }
    throw Exception('$this is not known in enum GroupName');
  }
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
          .whereNotNull()
          .map((e) => (e as String).toHeterogeneousTargetDatabaseEngine())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final targetDatabaseEngine = this.targetDatabaseEngine;
    return {
      'targetDatabaseEngine':
          targetDatabaseEngine.map((e) => e.toValue()).toList(),
    };
  }
}

enum HeterogeneousTargetDatabaseEngine {
  noneSpecified,
  amazonAurora,
  awsPostgreSQL,
  mySQL,
  microsoftSqlServer,
  oracleDatabase,
  mariaDB,
  sap,
  db2Luw,
  mongoDB,
}

extension HeterogeneousTargetDatabaseEngineValueExtension
    on HeterogeneousTargetDatabaseEngine {
  String toValue() {
    switch (this) {
      case HeterogeneousTargetDatabaseEngine.noneSpecified:
        return 'None specified';
      case HeterogeneousTargetDatabaseEngine.amazonAurora:
        return 'Amazon Aurora';
      case HeterogeneousTargetDatabaseEngine.awsPostgreSQL:
        return 'AWS PostgreSQL';
      case HeterogeneousTargetDatabaseEngine.mySQL:
        return 'MySQL';
      case HeterogeneousTargetDatabaseEngine.microsoftSqlServer:
        return 'Microsoft SQL Server';
      case HeterogeneousTargetDatabaseEngine.oracleDatabase:
        return 'Oracle Database';
      case HeterogeneousTargetDatabaseEngine.mariaDB:
        return 'MariaDB';
      case HeterogeneousTargetDatabaseEngine.sap:
        return 'SAP';
      case HeterogeneousTargetDatabaseEngine.db2Luw:
        return 'Db2 LUW';
      case HeterogeneousTargetDatabaseEngine.mongoDB:
        return 'MongoDB';
    }
  }
}

extension HeterogeneousTargetDatabaseEngineFromString on String {
  HeterogeneousTargetDatabaseEngine toHeterogeneousTargetDatabaseEngine() {
    switch (this) {
      case 'None specified':
        return HeterogeneousTargetDatabaseEngine.noneSpecified;
      case 'Amazon Aurora':
        return HeterogeneousTargetDatabaseEngine.amazonAurora;
      case 'AWS PostgreSQL':
        return HeterogeneousTargetDatabaseEngine.awsPostgreSQL;
      case 'MySQL':
        return HeterogeneousTargetDatabaseEngine.mySQL;
      case 'Microsoft SQL Server':
        return HeterogeneousTargetDatabaseEngine.microsoftSqlServer;
      case 'Oracle Database':
        return HeterogeneousTargetDatabaseEngine.oracleDatabase;
      case 'MariaDB':
        return HeterogeneousTargetDatabaseEngine.mariaDB;
      case 'SAP':
        return HeterogeneousTargetDatabaseEngine.sap;
      case 'Db2 LUW':
        return HeterogeneousTargetDatabaseEngine.db2Luw;
      case 'MongoDB':
        return HeterogeneousTargetDatabaseEngine.mongoDB;
    }
    throw Exception(
        '$this is not known in enum HeterogeneousTargetDatabaseEngine');
  }
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
          ?.whereNotNull()
          .map((e) => (e as String).toHomogeneousTargetDatabaseEngine())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final targetDatabaseEngine = this.targetDatabaseEngine;
    return {
      if (targetDatabaseEngine != null)
        'targetDatabaseEngine':
            targetDatabaseEngine.map((e) => e.toValue()).toList(),
    };
  }
}

enum HomogeneousTargetDatabaseEngine {
  noneSpecified,
}

extension HomogeneousTargetDatabaseEngineValueExtension
    on HomogeneousTargetDatabaseEngine {
  String toValue() {
    switch (this) {
      case HomogeneousTargetDatabaseEngine.noneSpecified:
        return 'None specified';
    }
  }
}

extension HomogeneousTargetDatabaseEngineFromString on String {
  HomogeneousTargetDatabaseEngine toHomogeneousTargetDatabaseEngine() {
    switch (this) {
      case 'None specified':
        return HomogeneousTargetDatabaseEngine.noneSpecified;
    }
    throw Exception(
        '$this is not known in enum HomogeneousTargetDatabaseEngine');
  }
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
      authType: (json['authType'] as String?)?.toAuthType(),
      ipAddressConfigurationTimeStamp:
          json['ipAddressConfigurationTimeStamp'] as String?,
      osType: (json['osType'] as String?)?.toOSType(),
    );
  }

  Map<String, dynamic> toJson() {
    final authType = this.authType;
    final ipAddressConfigurationTimeStamp =
        this.ipAddressConfigurationTimeStamp;
    final osType = this.osType;
    return {
      if (authType != null) 'authType': authType.toValue(),
      if (ipAddressConfigurationTimeStamp != null)
        'ipAddressConfigurationTimeStamp': ipAddressConfigurationTimeStamp,
      if (osType != null) 'osType': osType.toValue(),
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
      status: (json['status'] as String?)?.toImportFileTaskStatus(),
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
      if (status != null) 'status': status.toValue(),
      if (statusReportS3Bucket != null)
        'statusReportS3Bucket': statusReportS3Bucket,
      if (statusReportS3Key != null) 'statusReportS3Key': statusReportS3Key,
    };
  }
}

enum ImportFileTaskStatus {
  importInProgress,
  importFailed,
  importPartialSuccess,
  importSuccess,
  deleteInProgress,
  deleteFailed,
  deletePartialSuccess,
  deleteSuccess,
}

extension ImportFileTaskStatusValueExtension on ImportFileTaskStatus {
  String toValue() {
    switch (this) {
      case ImportFileTaskStatus.importInProgress:
        return 'ImportInProgress';
      case ImportFileTaskStatus.importFailed:
        return 'ImportFailed';
      case ImportFileTaskStatus.importPartialSuccess:
        return 'ImportPartialSuccess';
      case ImportFileTaskStatus.importSuccess:
        return 'ImportSuccess';
      case ImportFileTaskStatus.deleteInProgress:
        return 'DeleteInProgress';
      case ImportFileTaskStatus.deleteFailed:
        return 'DeleteFailed';
      case ImportFileTaskStatus.deletePartialSuccess:
        return 'DeletePartialSuccess';
      case ImportFileTaskStatus.deleteSuccess:
        return 'DeleteSuccess';
    }
  }
}

extension ImportFileTaskStatusFromString on String {
  ImportFileTaskStatus toImportFileTaskStatus() {
    switch (this) {
      case 'ImportInProgress':
        return ImportFileTaskStatus.importInProgress;
      case 'ImportFailed':
        return ImportFileTaskStatus.importFailed;
      case 'ImportPartialSuccess':
        return ImportFileTaskStatus.importPartialSuccess;
      case 'ImportSuccess':
        return ImportFileTaskStatus.importSuccess;
      case 'DeleteInProgress':
        return ImportFileTaskStatus.deleteInProgress;
      case 'DeleteFailed':
        return ImportFileTaskStatus.deleteFailed;
      case 'DeletePartialSuccess':
        return ImportFileTaskStatus.deletePartialSuccess;
      case 'DeleteSuccess':
        return ImportFileTaskStatus.deleteSuccess;
    }
    throw Exception('$this is not known in enum ImportFileTaskStatus');
  }
}

enum InclusionStatus {
  excludeFromAssessment,
  includeInAssessment,
}

extension InclusionStatusValueExtension on InclusionStatus {
  String toValue() {
    switch (this) {
      case InclusionStatus.excludeFromAssessment:
        return 'excludeFromAssessment';
      case InclusionStatus.includeInAssessment:
        return 'includeInAssessment';
    }
  }
}

extension InclusionStatusFromString on String {
  InclusionStatus toInclusionStatus() {
    switch (this) {
      case 'excludeFromAssessment':
        return InclusionStatus.excludeFromAssessment;
      case 'includeInAssessment':
        return InclusionStatus.includeInAssessment;
    }
    throw Exception('$this is not known in enum InclusionStatus');
  }
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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
          .whereNotNull()
          .map((e) => (e as String).toTargetDatabaseEngine())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final targetDatabaseEngine = this.targetDatabaseEngine;
    return {
      'targetDatabaseEngine':
          targetDatabaseEngine.map((e) => e.toValue()).toList(),
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
          .whereNotNull()
          .map((e) => (e as String).toNoPreferenceTargetDestination())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final targetDestination = this.targetDestination;
    return {
      'targetDestination': targetDestination.map((e) => e.toValue()).toList(),
    };
  }
}

enum NoPreferenceTargetDestination {
  noneSpecified,
  awsElasticBeanStalk,
  awsFargate,
  amazonElasticCloudComputeEc2,
  amazonElasticContainerServiceEcs,
  amazonElasticKubernetesServiceEks,
}

extension NoPreferenceTargetDestinationValueExtension
    on NoPreferenceTargetDestination {
  String toValue() {
    switch (this) {
      case NoPreferenceTargetDestination.noneSpecified:
        return 'None specified';
      case NoPreferenceTargetDestination.awsElasticBeanStalk:
        return 'AWS Elastic BeanStalk';
      case NoPreferenceTargetDestination.awsFargate:
        return 'AWS Fargate';
      case NoPreferenceTargetDestination.amazonElasticCloudComputeEc2:
        return 'Amazon Elastic Cloud Compute (EC2)';
      case NoPreferenceTargetDestination.amazonElasticContainerServiceEcs:
        return 'Amazon Elastic Container Service (ECS)';
      case NoPreferenceTargetDestination.amazonElasticKubernetesServiceEks:
        return 'Amazon Elastic Kubernetes Service (EKS)';
    }
  }
}

extension NoPreferenceTargetDestinationFromString on String {
  NoPreferenceTargetDestination toNoPreferenceTargetDestination() {
    switch (this) {
      case 'None specified':
        return NoPreferenceTargetDestination.noneSpecified;
      case 'AWS Elastic BeanStalk':
        return NoPreferenceTargetDestination.awsElasticBeanStalk;
      case 'AWS Fargate':
        return NoPreferenceTargetDestination.awsFargate;
      case 'Amazon Elastic Cloud Compute (EC2)':
        return NoPreferenceTargetDestination.amazonElasticCloudComputeEc2;
      case 'Amazon Elastic Container Service (ECS)':
        return NoPreferenceTargetDestination.amazonElasticContainerServiceEcs;
      case 'Amazon Elastic Kubernetes Service (EKS)':
        return NoPreferenceTargetDestination.amazonElasticKubernetesServiceEks;
    }
    throw Exception('$this is not known in enum NoPreferenceTargetDestination');
  }
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
      type: (json['type'] as String?)?.toOSType(),
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final version = this.version;
    return {
      if (type != null) 'type': type.toValue(),
      if (version != null) 'version': version,
    };
  }
}

enum OSType {
  linux,
  windows,
}

extension OSTypeValueExtension on OSType {
  String toValue() {
    switch (this) {
      case OSType.linux:
        return 'LINUX';
      case OSType.windows:
        return 'WINDOWS';
    }
  }
}

extension OSTypeFromString on String {
  OSType toOSType() {
    switch (this) {
      case 'LINUX':
        return OSType.linux;
      case 'WINDOWS':
        return OSType.windows;
    }
    throw Exception('$this is not known in enum OSType');
  }
}

enum OutputFormat {
  excel,
  json,
}

extension OutputFormatValueExtension on OutputFormat {
  String toValue() {
    switch (this) {
      case OutputFormat.excel:
        return 'Excel';
      case OutputFormat.json:
        return 'Json';
    }
  }
}

extension OutputFormatFromString on String {
  OutputFormat toOutputFormat() {
    switch (this) {
      case 'Excel':
        return OutputFormat.excel;
      case 'Json':
        return OutputFormat.json;
    }
    throw Exception('$this is not known in enum OutputFormat');
  }
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
      pipelineType: (json['pipelineType'] as String?)?.toPipelineType(),
    );
  }

  Map<String, dynamic> toJson() {
    final pipelineConfigurationTimeStamp = this.pipelineConfigurationTimeStamp;
    final pipelineType = this.pipelineType;
    return {
      if (pipelineConfigurationTimeStamp != null)
        'pipelineConfigurationTimeStamp': pipelineConfigurationTimeStamp,
      if (pipelineType != null) 'pipelineType': pipelineType.toValue(),
    };
  }
}

enum PipelineType {
  azureDevops,
}

extension PipelineTypeValueExtension on PipelineType {
  String toValue() {
    switch (this) {
      case PipelineType.azureDevops:
        return 'AZURE_DEVOPS';
    }
  }
}

extension PipelineTypeFromString on String {
  PipelineType toPipelineType() {
    switch (this) {
      case 'AZURE_DEVOPS':
        return PipelineType.azureDevops;
    }
    throw Exception('$this is not known in enum PipelineType');
  }
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
      s3Keys: (json['s3Keys'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      startTime: timeStampFromJson(json['startTime']),
      status: (json['status'] as String?)?.toRecommendationReportStatus(),
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
      if (status != null) 'status': status.toValue(),
      if (statusMessage != null) 'statusMessage': statusMessage,
    };
  }
}

enum RecommendationReportStatus {
  failed,
  inProgress,
  success,
}

extension RecommendationReportStatusValueExtension
    on RecommendationReportStatus {
  String toValue() {
    switch (this) {
      case RecommendationReportStatus.failed:
        return 'FAILED';
      case RecommendationReportStatus.inProgress:
        return 'IN_PROGRESS';
      case RecommendationReportStatus.success:
        return 'SUCCESS';
    }
  }
}

extension RecommendationReportStatusFromString on String {
  RecommendationReportStatus toRecommendationReportStatus() {
    switch (this) {
      case 'FAILED':
        return RecommendationReportStatus.failed;
      case 'IN_PROGRESS':
        return RecommendationReportStatus.inProgress;
      case 'SUCCESS':
        return RecommendationReportStatus.success;
    }
    throw Exception('$this is not known in enum RecommendationReportStatus');
  }
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
      strategy: (json['strategy'] as String?)?.toStrategy(),
      targetDestination:
          (json['targetDestination'] as String?)?.toTargetDestination(),
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
      if (strategy != null) 'strategy': strategy.toValue(),
      if (targetDestination != null)
        'targetDestination': targetDestination.toValue(),
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
  database,
  process,
  databaseProcess,
}

extension ResourceSubTypeValueExtension on ResourceSubType {
  String toValue() {
    switch (this) {
      case ResourceSubType.database:
        return 'Database';
      case ResourceSubType.process:
        return 'Process';
      case ResourceSubType.databaseProcess:
        return 'DatabaseProcess';
    }
  }
}

extension ResourceSubTypeFromString on String {
  ResourceSubType toResourceSubType() {
    switch (this) {
      case 'Database':
        return ResourceSubType.database;
      case 'Process':
        return ResourceSubType.process;
      case 'DatabaseProcess':
        return ResourceSubType.databaseProcess;
    }
    throw Exception('$this is not known in enum ResourceSubType');
  }
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
      analysisType: (json['analysisType'] as String?)?.toAnalysisType(),
      antipatternReportResultList:
          (json['antipatternReportResultList'] as List?)
              ?.whereNotNull()
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
      if (analysisType != null) 'analysisType': analysisType.toValue(),
      if (antipatternReportResultList != null)
        'antipatternReportResultList': antipatternReportResultList,
      if (statusMessage != null) 'statusMessage': statusMessage,
    };
  }
}

enum RunTimeAnalyzerName {
  a2cAnalyzer,
  rehostAnalyzer,
  empPaAnalyzer,
  databaseAnalyzer,
  sctAnalyzer,
}

extension RunTimeAnalyzerNameValueExtension on RunTimeAnalyzerName {
  String toValue() {
    switch (this) {
      case RunTimeAnalyzerName.a2cAnalyzer:
        return 'A2C_ANALYZER';
      case RunTimeAnalyzerName.rehostAnalyzer:
        return 'REHOST_ANALYZER';
      case RunTimeAnalyzerName.empPaAnalyzer:
        return 'EMP_PA_ANALYZER';
      case RunTimeAnalyzerName.databaseAnalyzer:
        return 'DATABASE_ANALYZER';
      case RunTimeAnalyzerName.sctAnalyzer:
        return 'SCT_ANALYZER';
    }
  }
}

extension RunTimeAnalyzerNameFromString on String {
  RunTimeAnalyzerName toRunTimeAnalyzerName() {
    switch (this) {
      case 'A2C_ANALYZER':
        return RunTimeAnalyzerName.a2cAnalyzer;
      case 'REHOST_ANALYZER':
        return RunTimeAnalyzerName.rehostAnalyzer;
      case 'EMP_PA_ANALYZER':
        return RunTimeAnalyzerName.empPaAnalyzer;
      case 'DATABASE_ANALYZER':
        return RunTimeAnalyzerName.databaseAnalyzer;
      case 'SCT_ANALYZER':
        return RunTimeAnalyzerName.sctAnalyzer;
    }
    throw Exception('$this is not known in enum RunTimeAnalyzerName');
  }
}

enum RunTimeAssessmentStatus {
  dataCollectionTaskToBeScheduled,
  dataCollectionTaskScheduled,
  dataCollectionTaskStarted,
  dataCollectionTaskStopped,
  dataCollectionTaskSuccess,
  dataCollectionTaskFailed,
  dataCollectionTaskPartialSuccess,
}

extension RunTimeAssessmentStatusValueExtension on RunTimeAssessmentStatus {
  String toValue() {
    switch (this) {
      case RunTimeAssessmentStatus.dataCollectionTaskToBeScheduled:
        return 'dataCollectionTaskToBeScheduled';
      case RunTimeAssessmentStatus.dataCollectionTaskScheduled:
        return 'dataCollectionTaskScheduled';
      case RunTimeAssessmentStatus.dataCollectionTaskStarted:
        return 'dataCollectionTaskStarted';
      case RunTimeAssessmentStatus.dataCollectionTaskStopped:
        return 'dataCollectionTaskStopped';
      case RunTimeAssessmentStatus.dataCollectionTaskSuccess:
        return 'dataCollectionTaskSuccess';
      case RunTimeAssessmentStatus.dataCollectionTaskFailed:
        return 'dataCollectionTaskFailed';
      case RunTimeAssessmentStatus.dataCollectionTaskPartialSuccess:
        return 'dataCollectionTaskPartialSuccess';
    }
  }
}

extension RunTimeAssessmentStatusFromString on String {
  RunTimeAssessmentStatus toRunTimeAssessmentStatus() {
    switch (this) {
      case 'dataCollectionTaskToBeScheduled':
        return RunTimeAssessmentStatus.dataCollectionTaskToBeScheduled;
      case 'dataCollectionTaskScheduled':
        return RunTimeAssessmentStatus.dataCollectionTaskScheduled;
      case 'dataCollectionTaskStarted':
        return RunTimeAssessmentStatus.dataCollectionTaskStarted;
      case 'dataCollectionTaskStopped':
        return RunTimeAssessmentStatus.dataCollectionTaskStopped;
      case 'dataCollectionTaskSuccess':
        return RunTimeAssessmentStatus.dataCollectionTaskSuccess;
      case 'dataCollectionTaskFailed':
        return RunTimeAssessmentStatus.dataCollectionTaskFailed;
      case 'dataCollectionTaskPartialSuccess':
        return RunTimeAssessmentStatus.dataCollectionTaskPartialSuccess;
    }
    throw Exception('$this is not known in enum RunTimeAssessmentStatus');
  }
}

enum RuntimeAnalysisStatus {
  analysisToBeScheduled,
  analysisStarted,
  analysisSuccess,
  analysisFailed,
}

extension RuntimeAnalysisStatusValueExtension on RuntimeAnalysisStatus {
  String toValue() {
    switch (this) {
      case RuntimeAnalysisStatus.analysisToBeScheduled:
        return 'ANALYSIS_TO_BE_SCHEDULED';
      case RuntimeAnalysisStatus.analysisStarted:
        return 'ANALYSIS_STARTED';
      case RuntimeAnalysisStatus.analysisSuccess:
        return 'ANALYSIS_SUCCESS';
      case RuntimeAnalysisStatus.analysisFailed:
        return 'ANALYSIS_FAILED';
    }
  }
}

extension RuntimeAnalysisStatusFromString on String {
  RuntimeAnalysisStatus toRuntimeAnalysisStatus() {
    switch (this) {
      case 'ANALYSIS_TO_BE_SCHEDULED':
        return RuntimeAnalysisStatus.analysisToBeScheduled;
      case 'ANALYSIS_STARTED':
        return RuntimeAnalysisStatus.analysisStarted;
      case 'ANALYSIS_SUCCESS':
        return RuntimeAnalysisStatus.analysisSuccess;
      case 'ANALYSIS_FAILED':
        return RuntimeAnalysisStatus.analysisFailed;
    }
    throw Exception('$this is not known in enum RuntimeAnalysisStatus');
  }
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
          .whereNotNull()
          .map((e) => (e as String).toSelfManageTargetDestination())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final targetDestination = this.targetDestination;
    return {
      'targetDestination': targetDestination.map((e) => e.toValue()).toList(),
    };
  }
}

enum SelfManageTargetDestination {
  noneSpecified,
  amazonElasticCloudComputeEc2,
  amazonElasticContainerServiceEcs,
  amazonElasticKubernetesServiceEks,
}

extension SelfManageTargetDestinationValueExtension
    on SelfManageTargetDestination {
  String toValue() {
    switch (this) {
      case SelfManageTargetDestination.noneSpecified:
        return 'None specified';
      case SelfManageTargetDestination.amazonElasticCloudComputeEc2:
        return 'Amazon Elastic Cloud Compute (EC2)';
      case SelfManageTargetDestination.amazonElasticContainerServiceEcs:
        return 'Amazon Elastic Container Service (ECS)';
      case SelfManageTargetDestination.amazonElasticKubernetesServiceEks:
        return 'Amazon Elastic Kubernetes Service (EKS)';
    }
  }
}

extension SelfManageTargetDestinationFromString on String {
  SelfManageTargetDestination toSelfManageTargetDestination() {
    switch (this) {
      case 'None specified':
        return SelfManageTargetDestination.noneSpecified;
      case 'Amazon Elastic Cloud Compute (EC2)':
        return SelfManageTargetDestination.amazonElasticCloudComputeEc2;
      case 'Amazon Elastic Container Service (ECS)':
        return SelfManageTargetDestination.amazonElasticContainerServiceEcs;
      case 'Amazon Elastic Kubernetes Service (EKS)':
        return SelfManageTargetDestination.amazonElasticKubernetesServiceEks;
    }
    throw Exception('$this is not known in enum SelfManageTargetDestination');
  }
}

enum ServerCriteria {
  notDefined,
  osName,
  strategy,
  destination,
  serverId,
  analysisStatus,
  errorCategory,
}

extension ServerCriteriaValueExtension on ServerCriteria {
  String toValue() {
    switch (this) {
      case ServerCriteria.notDefined:
        return 'NOT_DEFINED';
      case ServerCriteria.osName:
        return 'OS_NAME';
      case ServerCriteria.strategy:
        return 'STRATEGY';
      case ServerCriteria.destination:
        return 'DESTINATION';
      case ServerCriteria.serverId:
        return 'SERVER_ID';
      case ServerCriteria.analysisStatus:
        return 'ANALYSIS_STATUS';
      case ServerCriteria.errorCategory:
        return 'ERROR_CATEGORY';
    }
  }
}

extension ServerCriteriaFromString on String {
  ServerCriteria toServerCriteria() {
    switch (this) {
      case 'NOT_DEFINED':
        return ServerCriteria.notDefined;
      case 'OS_NAME':
        return ServerCriteria.osName;
      case 'STRATEGY':
        return ServerCriteria.strategy;
      case 'DESTINATION':
        return ServerCriteria.destination;
      case 'SERVER_ID':
        return ServerCriteria.serverId;
      case 'ANALYSIS_STATUS':
        return ServerCriteria.analysisStatus;
      case 'ERROR_CATEGORY':
        return ServerCriteria.errorCategory;
    }
    throw Exception('$this is not known in enum ServerCriteria');
  }
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
          ?.toAntipatternReportStatus(),
      antipatternReportStatusMessage:
          json['antipatternReportStatusMessage'] as String?,
      applicationComponentStrategySummary:
          (json['applicationComponentStrategySummary'] as List?)
              ?.whereNotNull()
              .map((e) => StrategySummary.fromJson(e as Map<String, dynamic>))
              .toList(),
      dataCollectionStatus: (json['dataCollectionStatus'] as String?)
          ?.toRunTimeAssessmentStatus(),
      id: json['id'] as String?,
      lastAnalyzedTimestamp: timeStampFromJson(json['lastAnalyzedTimestamp']),
      listAntipatternSeveritySummary: (json['listAntipatternSeveritySummary']
              as List?)
          ?.whereNotNull()
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
        'antipatternReportStatus': antipatternReportStatus.toValue(),
      if (antipatternReportStatusMessage != null)
        'antipatternReportStatusMessage': antipatternReportStatusMessage,
      if (applicationComponentStrategySummary != null)
        'applicationComponentStrategySummary':
            applicationComponentStrategySummary,
      if (dataCollectionStatus != null)
        'dataCollectionStatus': dataCollectionStatus.toValue(),
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
      serverErrorCategory:
          (json['serverErrorCategory'] as String?)?.toServerErrorCategory(),
    );
  }

  Map<String, dynamic> toJson() {
    final serverErrorCategory = this.serverErrorCategory;
    return {
      if (serverErrorCategory != null)
        'serverErrorCategory': serverErrorCategory.toValue(),
    };
  }
}

enum ServerErrorCategory {
  connectivityError,
  credentialError,
  permissionError,
  architectureError,
  otherError,
}

extension ServerErrorCategoryValueExtension on ServerErrorCategory {
  String toValue() {
    switch (this) {
      case ServerErrorCategory.connectivityError:
        return 'CONNECTIVITY_ERROR';
      case ServerErrorCategory.credentialError:
        return 'CREDENTIAL_ERROR';
      case ServerErrorCategory.permissionError:
        return 'PERMISSION_ERROR';
      case ServerErrorCategory.architectureError:
        return 'ARCHITECTURE_ERROR';
      case ServerErrorCategory.otherError:
        return 'OTHER_ERROR';
    }
  }
}

extension ServerErrorCategoryFromString on String {
  ServerErrorCategory toServerErrorCategory() {
    switch (this) {
      case 'CONNECTIVITY_ERROR':
        return ServerErrorCategory.connectivityError;
      case 'CREDENTIAL_ERROR':
        return ServerErrorCategory.credentialError;
      case 'PERMISSION_ERROR':
        return ServerErrorCategory.permissionError;
      case 'ARCHITECTURE_ERROR':
        return ServerErrorCategory.architectureError;
      case 'OTHER_ERROR':
        return ServerErrorCategory.otherError;
    }
    throw Exception('$this is not known in enum ServerErrorCategory');
  }
}

enum ServerOsType {
  windowsServer,
  amazonLinux,
  endOfSupportWindowsServer,
  redhat,
  other,
}

extension ServerOsTypeValueExtension on ServerOsType {
  String toValue() {
    switch (this) {
      case ServerOsType.windowsServer:
        return 'WindowsServer';
      case ServerOsType.amazonLinux:
        return 'AmazonLinux';
      case ServerOsType.endOfSupportWindowsServer:
        return 'EndOfSupportWindowsServer';
      case ServerOsType.redhat:
        return 'Redhat';
      case ServerOsType.other:
        return 'Other';
    }
  }
}

extension ServerOsTypeFromString on String {
  ServerOsType toServerOsType() {
    switch (this) {
      case 'WindowsServer':
        return ServerOsType.windowsServer;
      case 'AmazonLinux':
        return ServerOsType.amazonLinux;
      case 'EndOfSupportWindowsServer':
        return ServerOsType.endOfSupportWindowsServer;
      case 'Redhat':
        return ServerOsType.redhat;
      case 'Other':
        return ServerOsType.other;
    }
    throw Exception('$this is not known in enum ServerOsType');
  }
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
          ?.toRunTimeAssessmentStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final count = this.count;
    final runTimeAssessmentStatus = this.runTimeAssessmentStatus;
    return {
      if (count != null) 'count': count,
      if (runTimeAssessmentStatus != null)
        'runTimeAssessmentStatus': runTimeAssessmentStatus.toValue(),
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
      status: (json['status'] as String?)?.toStrategyRecommendation(),
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
      if (status != null) 'status': status.toValue(),
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
      serverOsType: (json['ServerOsType'] as String?)?.toServerOsType(),
      count: json['count'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final serverOsType = this.serverOsType;
    final count = this.count;
    return {
      if (serverOsType != null) 'ServerOsType': serverOsType.toValue(),
      if (count != null) 'count': count,
    };
  }
}

enum Severity {
  high,
  medium,
  low,
}

extension SeverityValueExtension on Severity {
  String toValue() {
    switch (this) {
      case Severity.high:
        return 'HIGH';
      case Severity.medium:
        return 'MEDIUM';
      case Severity.low:
        return 'LOW';
    }
  }
}

extension SeverityFromString on String {
  Severity toSeverity() {
    switch (this) {
      case 'HIGH':
        return Severity.high;
      case 'MEDIUM':
        return Severity.medium;
      case 'LOW':
        return Severity.low;
    }
    throw Exception('$this is not known in enum Severity');
  }
}

enum SortOrder {
  asc,
  desc,
}

extension SortOrderValueExtension on SortOrder {
  String toValue() {
    switch (this) {
      case SortOrder.asc:
        return 'ASC';
      case SortOrder.desc:
        return 'DESC';
    }
  }
}

extension SortOrderFromString on String {
  SortOrder toSortOrder() {
    switch (this) {
      case 'ASC':
        return SortOrder.asc;
      case 'DESC':
        return SortOrder.desc;
    }
    throw Exception('$this is not known in enum SortOrder');
  }
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
      if (versionControl != null) 'versionControl': versionControl.toValue(),
    };
  }
}

enum SourceCodeAnalyzerName {
  csharpAnalyzer,
  javaAnalyzer,
  bytecodeAnalyzer,
  portingAssistant,
}

extension SourceCodeAnalyzerNameValueExtension on SourceCodeAnalyzerName {
  String toValue() {
    switch (this) {
      case SourceCodeAnalyzerName.csharpAnalyzer:
        return 'CSHARP_ANALYZER';
      case SourceCodeAnalyzerName.javaAnalyzer:
        return 'JAVA_ANALYZER';
      case SourceCodeAnalyzerName.bytecodeAnalyzer:
        return 'BYTECODE_ANALYZER';
      case SourceCodeAnalyzerName.portingAssistant:
        return 'PORTING_ASSISTANT';
    }
  }
}

extension SourceCodeAnalyzerNameFromString on String {
  SourceCodeAnalyzerName toSourceCodeAnalyzerName() {
    switch (this) {
      case 'CSHARP_ANALYZER':
        return SourceCodeAnalyzerName.csharpAnalyzer;
      case 'JAVA_ANALYZER':
        return SourceCodeAnalyzerName.javaAnalyzer;
      case 'BYTECODE_ANALYZER':
        return SourceCodeAnalyzerName.bytecodeAnalyzer;
      case 'PORTING_ASSISTANT':
        return SourceCodeAnalyzerName.portingAssistant;
    }
    throw Exception('$this is not known in enum SourceCodeAnalyzerName');
  }
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
  analysisToBeScheduled,
  analysisStarted,
  analysisSuccess,
  analysisFailed,
  analysisPartialSuccess,
  unconfigured,
  configured,
}

extension SrcCodeOrDbAnalysisStatusValueExtension on SrcCodeOrDbAnalysisStatus {
  String toValue() {
    switch (this) {
      case SrcCodeOrDbAnalysisStatus.analysisToBeScheduled:
        return 'ANALYSIS_TO_BE_SCHEDULED';
      case SrcCodeOrDbAnalysisStatus.analysisStarted:
        return 'ANALYSIS_STARTED';
      case SrcCodeOrDbAnalysisStatus.analysisSuccess:
        return 'ANALYSIS_SUCCESS';
      case SrcCodeOrDbAnalysisStatus.analysisFailed:
        return 'ANALYSIS_FAILED';
      case SrcCodeOrDbAnalysisStatus.analysisPartialSuccess:
        return 'ANALYSIS_PARTIAL_SUCCESS';
      case SrcCodeOrDbAnalysisStatus.unconfigured:
        return 'UNCONFIGURED';
      case SrcCodeOrDbAnalysisStatus.configured:
        return 'CONFIGURED';
    }
  }
}

extension SrcCodeOrDbAnalysisStatusFromString on String {
  SrcCodeOrDbAnalysisStatus toSrcCodeOrDbAnalysisStatus() {
    switch (this) {
      case 'ANALYSIS_TO_BE_SCHEDULED':
        return SrcCodeOrDbAnalysisStatus.analysisToBeScheduled;
      case 'ANALYSIS_STARTED':
        return SrcCodeOrDbAnalysisStatus.analysisStarted;
      case 'ANALYSIS_SUCCESS':
        return SrcCodeOrDbAnalysisStatus.analysisSuccess;
      case 'ANALYSIS_FAILED':
        return SrcCodeOrDbAnalysisStatus.analysisFailed;
      case 'ANALYSIS_PARTIAL_SUCCESS':
        return SrcCodeOrDbAnalysisStatus.analysisPartialSuccess;
      case 'UNCONFIGURED':
        return SrcCodeOrDbAnalysisStatus.unconfigured;
      case 'CONFIGURED':
        return SrcCodeOrDbAnalysisStatus.configured;
    }
    throw Exception('$this is not known in enum SrcCodeOrDbAnalysisStatus');
  }
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
  rehost,
  retirement,
  refactor,
  replatform,
  retain,
  relocate,
  repurchase,
}

extension StrategyValueExtension on Strategy {
  String toValue() {
    switch (this) {
      case Strategy.rehost:
        return 'Rehost';
      case Strategy.retirement:
        return 'Retirement';
      case Strategy.refactor:
        return 'Refactor';
      case Strategy.replatform:
        return 'Replatform';
      case Strategy.retain:
        return 'Retain';
      case Strategy.relocate:
        return 'Relocate';
      case Strategy.repurchase:
        return 'Repurchase';
    }
  }
}

extension StrategyFromString on String {
  Strategy toStrategy() {
    switch (this) {
      case 'Rehost':
        return Strategy.rehost;
      case 'Retirement':
        return Strategy.retirement;
      case 'Refactor':
        return Strategy.refactor;
      case 'Replatform':
        return Strategy.replatform;
      case 'Retain':
        return Strategy.retain;
      case 'Relocate':
        return Strategy.relocate;
      case 'Repurchase':
        return Strategy.repurchase;
    }
    throw Exception('$this is not known in enum Strategy');
  }
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
      if (strategy != null) 'strategy': strategy.toValue(),
      if (targetDestination != null)
        'targetDestination': targetDestination.toValue(),
      if (toolName != null) 'toolName': toolName.toValue(),
    };
  }
}

enum StrategyRecommendation {
  recommended,
  viableOption,
  notRecommended,
  potential,
}

extension StrategyRecommendationValueExtension on StrategyRecommendation {
  String toValue() {
    switch (this) {
      case StrategyRecommendation.recommended:
        return 'recommended';
      case StrategyRecommendation.viableOption:
        return 'viableOption';
      case StrategyRecommendation.notRecommended:
        return 'notRecommended';
      case StrategyRecommendation.potential:
        return 'potential';
    }
  }
}

extension StrategyRecommendationFromString on String {
  StrategyRecommendation toStrategyRecommendation() {
    switch (this) {
      case 'recommended':
        return StrategyRecommendation.recommended;
      case 'viableOption':
        return StrategyRecommendation.viableOption;
      case 'notRecommended':
        return StrategyRecommendation.notRecommended;
      case 'potential':
        return StrategyRecommendation.potential;
    }
    throw Exception('$this is not known in enum StrategyRecommendation');
  }
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
      strategy: (json['strategy'] as String?)?.toStrategy(),
    );
  }

  Map<String, dynamic> toJson() {
    final count = this.count;
    final strategy = this.strategy;
    return {
      if (count != null) 'count': count,
      if (strategy != null) 'strategy': strategy.toValue(),
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
          ?.whereNotNull()
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
  noneSpecified,
  amazonAurora,
  awsPostgreSQL,
  mySQL,
  microsoftSqlServer,
  oracleDatabase,
  mariaDB,
  sap,
  db2Luw,
  mongoDB,
}

extension TargetDatabaseEngineValueExtension on TargetDatabaseEngine {
  String toValue() {
    switch (this) {
      case TargetDatabaseEngine.noneSpecified:
        return 'None specified';
      case TargetDatabaseEngine.amazonAurora:
        return 'Amazon Aurora';
      case TargetDatabaseEngine.awsPostgreSQL:
        return 'AWS PostgreSQL';
      case TargetDatabaseEngine.mySQL:
        return 'MySQL';
      case TargetDatabaseEngine.microsoftSqlServer:
        return 'Microsoft SQL Server';
      case TargetDatabaseEngine.oracleDatabase:
        return 'Oracle Database';
      case TargetDatabaseEngine.mariaDB:
        return 'MariaDB';
      case TargetDatabaseEngine.sap:
        return 'SAP';
      case TargetDatabaseEngine.db2Luw:
        return 'Db2 LUW';
      case TargetDatabaseEngine.mongoDB:
        return 'MongoDB';
    }
  }
}

extension TargetDatabaseEngineFromString on String {
  TargetDatabaseEngine toTargetDatabaseEngine() {
    switch (this) {
      case 'None specified':
        return TargetDatabaseEngine.noneSpecified;
      case 'Amazon Aurora':
        return TargetDatabaseEngine.amazonAurora;
      case 'AWS PostgreSQL':
        return TargetDatabaseEngine.awsPostgreSQL;
      case 'MySQL':
        return TargetDatabaseEngine.mySQL;
      case 'Microsoft SQL Server':
        return TargetDatabaseEngine.microsoftSqlServer;
      case 'Oracle Database':
        return TargetDatabaseEngine.oracleDatabase;
      case 'MariaDB':
        return TargetDatabaseEngine.mariaDB;
      case 'SAP':
        return TargetDatabaseEngine.sap;
      case 'Db2 LUW':
        return TargetDatabaseEngine.db2Luw;
      case 'MongoDB':
        return TargetDatabaseEngine.mongoDB;
    }
    throw Exception('$this is not known in enum TargetDatabaseEngine');
  }
}

enum TargetDestination {
  noneSpecified,
  awsElasticBeanStalk,
  awsFargate,
  amazonElasticCloudComputeEc2,
  amazonElasticContainerServiceEcs,
  amazonElasticKubernetesServiceEks,
  auroraMySQL,
  auroraPostgreSQL,
  amazonRelationalDatabaseServiceOnMySQL,
  amazonRelationalDatabaseServiceOnPostgreSQL,
  amazonDocumentDB,
  amazonDynamoDB,
  amazonRelationalDatabaseService,
  babelfishForAuroraPostgreSQL,
}

extension TargetDestinationValueExtension on TargetDestination {
  String toValue() {
    switch (this) {
      case TargetDestination.noneSpecified:
        return 'None specified';
      case TargetDestination.awsElasticBeanStalk:
        return 'AWS Elastic BeanStalk';
      case TargetDestination.awsFargate:
        return 'AWS Fargate';
      case TargetDestination.amazonElasticCloudComputeEc2:
        return 'Amazon Elastic Cloud Compute (EC2)';
      case TargetDestination.amazonElasticContainerServiceEcs:
        return 'Amazon Elastic Container Service (ECS)';
      case TargetDestination.amazonElasticKubernetesServiceEks:
        return 'Amazon Elastic Kubernetes Service (EKS)';
      case TargetDestination.auroraMySQL:
        return 'Aurora MySQL';
      case TargetDestination.auroraPostgreSQL:
        return 'Aurora PostgreSQL';
      case TargetDestination.amazonRelationalDatabaseServiceOnMySQL:
        return 'Amazon Relational Database Service on MySQL';
      case TargetDestination.amazonRelationalDatabaseServiceOnPostgreSQL:
        return 'Amazon Relational Database Service on PostgreSQL';
      case TargetDestination.amazonDocumentDB:
        return 'Amazon DocumentDB';
      case TargetDestination.amazonDynamoDB:
        return 'Amazon DynamoDB';
      case TargetDestination.amazonRelationalDatabaseService:
        return 'Amazon Relational Database Service';
      case TargetDestination.babelfishForAuroraPostgreSQL:
        return 'Babelfish for Aurora PostgreSQL';
    }
  }
}

extension TargetDestinationFromString on String {
  TargetDestination toTargetDestination() {
    switch (this) {
      case 'None specified':
        return TargetDestination.noneSpecified;
      case 'AWS Elastic BeanStalk':
        return TargetDestination.awsElasticBeanStalk;
      case 'AWS Fargate':
        return TargetDestination.awsFargate;
      case 'Amazon Elastic Cloud Compute (EC2)':
        return TargetDestination.amazonElasticCloudComputeEc2;
      case 'Amazon Elastic Container Service (ECS)':
        return TargetDestination.amazonElasticContainerServiceEcs;
      case 'Amazon Elastic Kubernetes Service (EKS)':
        return TargetDestination.amazonElasticKubernetesServiceEks;
      case 'Aurora MySQL':
        return TargetDestination.auroraMySQL;
      case 'Aurora PostgreSQL':
        return TargetDestination.auroraPostgreSQL;
      case 'Amazon Relational Database Service on MySQL':
        return TargetDestination.amazonRelationalDatabaseServiceOnMySQL;
      case 'Amazon Relational Database Service on PostgreSQL':
        return TargetDestination.amazonRelationalDatabaseServiceOnPostgreSQL;
      case 'Amazon DocumentDB':
        return TargetDestination.amazonDocumentDB;
      case 'Amazon DynamoDB':
        return TargetDestination.amazonDynamoDB;
      case 'Amazon Relational Database Service':
        return TargetDestination.amazonRelationalDatabaseService;
      case 'Babelfish for Aurora PostgreSQL':
        return TargetDestination.babelfishForAuroraPostgreSQL;
    }
    throw Exception('$this is not known in enum TargetDestination');
  }
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
      name: (json['name'] as String?)?.toTransformationToolName(),
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
      if (name != null) 'name': name.toValue(),
      if (tranformationToolInstallationLink != null)
        'tranformationToolInstallationLink': tranformationToolInstallationLink,
    };
  }
}

enum TransformationToolName {
  app2Container,
  portingAssistantForNet,
  endOfSupportMigration,
  windowsWebApplicationMigrationAssistant,
  applicationMigrationService,
  strategyRecommendationSupport,
  inPlaceOperatingSystemUpgrade,
  schemaConversionTool,
  databaseMigrationService,
  nativeSqlServerBackupRestore,
}

extension TransformationToolNameValueExtension on TransformationToolName {
  String toValue() {
    switch (this) {
      case TransformationToolName.app2Container:
        return 'App2Container';
      case TransformationToolName.portingAssistantForNet:
        return 'Porting Assistant For .NET';
      case TransformationToolName.endOfSupportMigration:
        return 'End of Support Migration';
      case TransformationToolName.windowsWebApplicationMigrationAssistant:
        return 'Windows Web Application Migration Assistant';
      case TransformationToolName.applicationMigrationService:
        return 'Application Migration Service';
      case TransformationToolName.strategyRecommendationSupport:
        return 'Strategy Recommendation Support';
      case TransformationToolName.inPlaceOperatingSystemUpgrade:
        return 'In Place Operating System Upgrade';
      case TransformationToolName.schemaConversionTool:
        return 'Schema Conversion Tool';
      case TransformationToolName.databaseMigrationService:
        return 'Database Migration Service';
      case TransformationToolName.nativeSqlServerBackupRestore:
        return 'Native SQL Server Backup/Restore';
    }
  }
}

extension TransformationToolNameFromString on String {
  TransformationToolName toTransformationToolName() {
    switch (this) {
      case 'App2Container':
        return TransformationToolName.app2Container;
      case 'Porting Assistant For .NET':
        return TransformationToolName.portingAssistantForNet;
      case 'End of Support Migration':
        return TransformationToolName.endOfSupportMigration;
      case 'Windows Web Application Migration Assistant':
        return TransformationToolName.windowsWebApplicationMigrationAssistant;
      case 'Application Migration Service':
        return TransformationToolName.applicationMigrationService;
      case 'Strategy Recommendation Support':
        return TransformationToolName.strategyRecommendationSupport;
      case 'In Place Operating System Upgrade':
        return TransformationToolName.inPlaceOperatingSystemUpgrade;
      case 'Schema Conversion Tool':
        return TransformationToolName.schemaConversionTool;
      case 'Database Migration Service':
        return TransformationToolName.databaseMigrationService;
      case 'Native SQL Server Backup/Restore':
        return TransformationToolName.nativeSqlServerBackupRestore;
    }
    throw Exception('$this is not known in enum TransformationToolName');
  }
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
      osType: (json['osType'] as String?)?.toOSType(),
      vcenterConfigurationTimeStamp:
          json['vcenterConfigurationTimeStamp'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final osType = this.osType;
    final vcenterConfigurationTimeStamp = this.vcenterConfigurationTimeStamp;
    return {
      if (osType != null) 'osType': osType.toValue(),
      if (vcenterConfigurationTimeStamp != null)
        'vcenterConfigurationTimeStamp': vcenterConfigurationTimeStamp,
    };
  }
}

enum VersionControl {
  github,
  githubEnterprise,
  azureDevopsGit,
}

extension VersionControlValueExtension on VersionControl {
  String toValue() {
    switch (this) {
      case VersionControl.github:
        return 'GITHUB';
      case VersionControl.githubEnterprise:
        return 'GITHUB_ENTERPRISE';
      case VersionControl.azureDevopsGit:
        return 'AZURE_DEVOPS_GIT';
    }
  }
}

extension VersionControlFromString on String {
  VersionControl toVersionControl() {
    switch (this) {
      case 'GITHUB':
        return VersionControl.github;
      case 'GITHUB_ENTERPRISE':
        return VersionControl.githubEnterprise;
      case 'AZURE_DEVOPS_GIT':
        return VersionControl.azureDevopsGit;
    }
    throw Exception('$this is not known in enum VersionControl');
  }
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
      versionControlType:
          (json['versionControlType'] as String?)?.toVersionControlType(),
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
        'versionControlType': versionControlType.toValue(),
    };
  }
}

enum VersionControlType {
  github,
  githubEnterprise,
  azureDevopsGit,
}

extension VersionControlTypeValueExtension on VersionControlType {
  String toValue() {
    switch (this) {
      case VersionControlType.github:
        return 'GITHUB';
      case VersionControlType.githubEnterprise:
        return 'GITHUB_ENTERPRISE';
      case VersionControlType.azureDevopsGit:
        return 'AZURE_DEVOPS_GIT';
    }
  }
}

extension VersionControlTypeFromString on String {
  VersionControlType toVersionControlType() {
    switch (this) {
      case 'GITHUB':
        return VersionControlType.github;
      case 'GITHUB_ENTERPRISE':
        return VersionControlType.githubEnterprise;
      case 'AZURE_DEVOPS_GIT':
        return VersionControlType.azureDevopsGit;
    }
    throw Exception('$this is not known in enum VersionControlType');
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
