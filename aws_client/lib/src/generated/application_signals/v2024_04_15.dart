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

import 'v2024_04_15.endpoints.dart' as _endpoints;
export '../../shared/shared.dart' show AwsClientCredentials;

/// Use CloudWatch Application Signals for comprehensive observability of your
/// cloud-based applications. It enables real-time service health dashboards and
/// helps you track long-term performance trends against your business goals.
/// The application-centric view provides you with unified visibility across
/// your applications, services, and dependencies, so you can proactively
/// monitor and efficiently triage any issues that may arise, ensuring optimal
/// customer experience.
///
/// Application Signals provides the following benefits:
///
/// <ul>
/// <li>
/// Automatically collect metrics and traces from your applications, and display
/// key metrics such as call volume, availability, latency, faults, and errors.
/// </li>
/// <li>
/// Create and monitor service level objectives (SLOs).
/// </li>
/// <li>
/// See a map of your application topology that Application Signals
/// automatically discovers, that gives you a visual representation of your
/// applications, dependencies, and their connectivity.
/// </li>
/// </ul>
/// Application Signals works with CloudWatch RUM, CloudWatch Synthetics
/// canaries, and Amazon Web Services Service Catalog AppRegistry, to display
/// your client pages, Synthetics canaries, and application names within
/// dashboards and maps.
class ApplicationSignals {
  final _s.RestJsonProtocol _protocol;
  factory ApplicationSignals({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
    bool useFipsEndpoint = false,
    bool useDualStackEndpoint = false,
  }) {
    final service = _s.ServiceMetadata(
      endpointPrefix: 'application-signals',
    );
    return ApplicationSignals._(
      protocol: _s.RestJsonProtocol(
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
  ApplicationSignals._({
    required _s.RestJsonProtocol protocol,
  }) : _protocol = protocol;

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

  /// Use this operation to retrieve one or more <i>service level objective
  /// (SLO) budget reports</i>.
  ///
  /// An <i>error budget</i> is the amount of time or requests in an unhealthy
  /// state that your service can accumulate during an interval before your
  /// overall SLO budget health is breached and the SLO is considered to be
  /// unmet. For example, an SLO with a threshold of 99.95% and a monthly
  /// interval translates to an error budget of 21.9 minutes of downtime in a
  /// 30-day month.
  ///
  /// Budget reports include a health indicator, the attainment value, and
  /// remaining budget.
  ///
  /// For more information about SLO error budgets, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-ServiceLevelObjectives.html#CloudWatch-ServiceLevelObjectives-concepts">
  /// SLO concepts</a>.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [sloIds] :
  /// An array containing the IDs of the service level objectives that you want
  /// to include in the report.
  ///
  /// Parameter [timestamp] :
  /// The date and time that you want the report to be for. It is expressed as
  /// the number of milliseconds since Jan 1, 1970 00:00:00 UTC.
  Future<BatchGetServiceLevelObjectiveBudgetReportOutput>
      batchGetServiceLevelObjectiveBudgetReport({
    required List<String> sloIds,
    required DateTime timestamp,
  }) async {
    final $payload = <String, dynamic>{
      'SloIds': sloIds,
      'Timestamp': unixTimestampToJson(timestamp),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/budget-report',
      exceptionFnMap: _exceptionFns,
    );
    return BatchGetServiceLevelObjectiveBudgetReportOutput.fromJson(response);
  }

  /// Add or remove time window exclusions for one or more Service Level
  /// Objectives (SLOs).
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [sloIds] :
  /// The list of SLO IDs to add or remove exclusion windows from.
  ///
  /// Parameter [addExclusionWindows] :
  /// A list of exclusion windows to add to the specified SLOs. You can add up
  /// to 10 exclusion windows per SLO.
  ///
  /// Parameter [removeExclusionWindows] :
  /// A list of exclusion windows to remove from the specified SLOs. The window
  /// configuration must match an existing exclusion window.
  Future<BatchUpdateExclusionWindowsOutput> batchUpdateExclusionWindows({
    required List<String> sloIds,
    List<ExclusionWindow>? addExclusionWindows,
    List<ExclusionWindow>? removeExclusionWindows,
  }) async {
    final $payload = <String, dynamic>{
      'SloIds': sloIds,
      if (addExclusionWindows != null)
        'AddExclusionWindows': addExclusionWindows,
      if (removeExclusionWindows != null)
        'RemoveExclusionWindows': removeExclusionWindows,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/exclusion-windows',
      exceptionFnMap: _exceptionFns,
    );
    return BatchUpdateExclusionWindowsOutput.fromJson(response);
  }

  /// Deletes the grouping configuration for this account. This removes all
  /// custom grouping attribute definitions that were previously configured.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  Future<void> deleteGroupingConfiguration() async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/grouping-configuration',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns information about a service discovered by Application Signals.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [endTime] :
  /// The end of the time period to retrieve information about. When used in a
  /// raw HTTP Query API, it is formatted as be epoch time in seconds. For
  /// example: <code>1698778057</code>
  ///
  /// Your requested start time will be rounded to the nearest hour.
  ///
  /// Parameter [keyAttributes] :
  /// Use this field to specify which service you want to retrieve information
  /// for. You must specify at least the <code>Type</code>, <code>Name</code>,
  /// and <code>Environment</code> attributes.
  ///
  /// This is a string-to-string map. It can include the following fields.
  ///
  /// <ul>
  /// <li>
  /// <code>Type</code> designates the type of object this is.
  /// </li>
  /// <li>
  /// <code>ResourceType</code> specifies the type of the resource. This field
  /// is used only when the value of the <code>Type</code> field is
  /// <code>Resource</code> or <code>AWS::Resource</code>.
  /// </li>
  /// <li>
  /// <code>Name</code> specifies the name of the object. This is used only if
  /// the value of the <code>Type</code> field is <code>Service</code>,
  /// <code>RemoteService</code>, or <code>AWS::Service</code>.
  /// </li>
  /// <li>
  /// <code>Identifier</code> identifies the resource objects of this resource.
  /// This is used only if the value of the <code>Type</code> field is
  /// <code>Resource</code> or <code>AWS::Resource</code>.
  /// </li>
  /// <li>
  /// <code>Environment</code> specifies the location where this object is
  /// hosted, or what it belongs to.
  /// </li>
  /// </ul>
  ///
  /// Parameter [startTime] :
  /// The start of the time period to retrieve information about. When used in a
  /// raw HTTP Query API, it is formatted as be epoch time in seconds. For
  /// example: <code>1698778057</code>
  ///
  /// Your requested start time will be rounded to the nearest hour.
  Future<GetServiceOutput> getService({
    required DateTime endTime,
    required Map<String, String> keyAttributes,
    required DateTime startTime,
  }) async {
    final $query = <String, List<String>>{
      'EndTime': [_s.iso8601ToJson(endTime).toString()],
      'StartTime': [_s.iso8601ToJson(startTime).toString()],
    };
    final $payload = <String, dynamic>{
      'KeyAttributes': keyAttributes,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/service',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetServiceOutput.fromJson(response);
  }

  /// Returns a list of audit findings that provide automated analysis of
  /// service behavior and root cause analysis. These findings help identify the
  /// most significant observations about your services, including performance
  /// issues, anomalies, and potential problems. The findings are generated
  /// using heuristic algorithms based on established troubleshooting patterns.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [auditTargets] :
  /// A list of audit targets to filter the findings by. You can specify
  /// services, SLOs, or service operations to limit the audit findings to
  /// specific entities.
  ///
  /// Parameter [endTime] :
  /// The end of the time period to retrieve audit findings for. When used in a
  /// raw HTTP Query API, it is formatted as epoch time in seconds. For example,
  /// <code>1698778057</code>
  ///
  /// Parameter [startTime] :
  /// The start of the time period to retrieve audit findings for. When used in
  /// a raw HTTP Query API, it is formatted as epoch time in seconds. For
  /// example, <code>1698778057</code>
  ///
  /// Parameter [auditors] :
  /// A list of auditor names to filter the findings by. Only findings generated
  /// by the specified auditors will be returned.
  ///
  /// The following auditors are available for configuration:
  ///
  /// <ul>
  /// <li>
  /// <code>slo</code> - SloAuditor: Identifies SLO violations and detects
  /// breached thresholds during the Assessment phase.
  /// </li>
  /// <li>
  /// <code>operation_metric</code> - OperationMetricAuditor: Detects anomalies
  /// in service operation metrics from Application Signals RED metrics during
  /// the Assessment phase
  /// <note>
  /// Anomaly detection is not supported for sparse metrics (those missing more
  /// than 80% of datapoints within the given time period).
  /// </note> </li>
  /// <li>
  /// <code>service_quota</code> - ServiceQuotaAuditor: Monitors resource
  /// utilization against service quotas during the Assessment phase
  /// </li>
  /// <li>
  /// <code>trace</code> - TraceAuditor: Performs deep-dive analysis of
  /// distributed traces, correlating traces with breached SLOs or abnormal RED
  /// metrics during the Analysis phase
  /// </li>
  /// <li>
  /// <code>dependency_metric</code> - CriticalPathAuditor: Analyzes service
  /// dependency impacts and maps dependency relationships from Application
  /// Signals RED metrics during the Analysis phase
  /// </li>
  /// <li>
  /// <code>top_contributor</code> - TopContributorAuditor: Identifies
  /// infrastructure-level contributors to issues by analyzing EMF logs of
  /// Application Signals RED metrics during the Analysis phase
  /// </li>
  /// <li>
  /// <code>log</code> - LogAuditor: Extracts insights from application logs,
  /// categorizing error types and ranking severity by frequency during the
  /// Analysis phase
  /// </li>
  /// <li>
  /// <code>change_indicator</code> - ChangeIndicatorAuditor: Detects change
  /// events (deployments, configuration changes) that occurred within 10
  /// minutes before and during a detected anomaly, and surfaces them as
  /// findings with deployment timestamps in the Analysis phase. When changes
  /// are detected, the <code>top_contributor</code> auditor skips its analysis
  /// to avoid redundancy.
  /// </li>
  /// </ul> <note>
  /// <code>InitAuditor</code> and <code>Summarizer</code> auditors are not
  /// configurable as they are automatically triggered during the audit process.
  /// </note>
  ///
  /// Parameter [detailLevel] :
  /// The level of details of the audit findings. Supported values:
  /// <code>BRIEF</code>, <code>DETAILED</code>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of audit findings to return in one operation. If you
  /// omit this parameter, the default of 10 is used.
  ///
  /// Parameter [nextToken] :
  /// Include this value, if it was returned by the previous operation, to get
  /// the next set of audit findings.
  Future<ListAuditFindingsOutput> listAuditFindings({
    required List<AuditTarget> auditTargets,
    required DateTime endTime,
    required DateTime startTime,
    List<String>? auditors,
    DetailLevel? detailLevel,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      10,
    );
    final $query = <String, List<String>>{
      'EndTime': [_s.iso8601ToJson(endTime).toString()],
      'StartTime': [_s.iso8601ToJson(startTime).toString()],
    };
    final $payload = <String, dynamic>{
      'AuditTargets': auditTargets,
      if (auditors != null) 'Auditors': auditors,
      if (detailLevel != null) 'DetailLevel': detailLevel.value,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/auditFindings',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAuditFindingsOutput.fromJson(response);
  }

  /// Returns a list of change events for a specific entity, such as
  /// deployments, configuration changes, or other state-changing activities.
  /// This operation helps track the history of changes that may have affected
  /// service performance.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [endTime] :
  /// The end of the time period to retrieve change events for. When used in a
  /// raw HTTP Query API, it is formatted as epoch time in seconds. For example:
  /// <code>1698778057</code>
  ///
  /// Parameter [entity] :
  /// The entity for which to retrieve change events. This specifies the
  /// service, resource, or other entity whose event history you want to
  /// examine.
  ///
  /// This is a string-to-string map. It can include the following fields.
  ///
  /// <ul>
  /// <li>
  /// <code>Type</code> designates the type of object this is.
  /// </li>
  /// <li>
  /// <code>ResourceType</code> specifies the type of the resource. This field
  /// is used only when the value of the <code>Type</code> field is
  /// <code>Resource</code> or <code>AWS::Resource</code>.
  /// </li>
  /// <li>
  /// <code>Name</code> specifies the name of the object. This is used only if
  /// the value of the <code>Type</code> field is <code>Service</code>,
  /// <code>RemoteService</code>, or <code>AWS::Service</code>.
  /// </li>
  /// <li>
  /// <code>Identifier</code> identifies the resource objects of this resource.
  /// This is used only if the value of the <code>Type</code> field is
  /// <code>Resource</code> or <code>AWS::Resource</code>.
  /// </li>
  /// <li>
  /// <code>Environment</code> specifies the location where this object is
  /// hosted, or what it belongs to.
  /// </li>
  /// <li>
  /// <code>AwsAccountId</code> specifies the account where this object is in.
  /// </li>
  /// </ul>
  /// Below is an example of a service.
  ///
  /// <code>{ "Type": "Service", "Name": "visits-service", "Environment":
  /// "petclinic-test" }</code>
  ///
  /// Below is an example of a resource.
  ///
  /// <code>{ "Type": "AWS::Resource", "ResourceType": "AWS::DynamoDB::Table",
  /// "Identifier": "Customers" }</code>
  ///
  /// Parameter [startTime] :
  /// The start of the time period to retrieve change events for. When used in a
  /// raw HTTP Query API, it is formatted as epoch time in seconds. For example:
  /// <code>1698778057</code>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of change events to return in one operation. If you
  /// omit this parameter, the default of 50 is used.
  ///
  /// Parameter [nextToken] :
  /// Include this value, if it was returned by the previous operation, to get
  /// the next set of change events.
  Future<ListEntityEventsOutput> listEntityEvents({
    required DateTime endTime,
    required Map<String, String> entity,
    required DateTime startTime,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final $payload = <String, dynamic>{
      'EndTime': unixTimestampToJson(endTime),
      'Entity': entity,
      'StartTime': unixTimestampToJson(startTime),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/events',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListEntityEventsOutput.fromJson(response);
  }

  /// Returns the current grouping configuration for this account, including all
  /// custom grouping attribute definitions that have been configured. These
  /// definitions determine how services are logically grouped based on
  /// telemetry attributes, Amazon Web Services tags, or predefined mappings.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [awsAccountId] :
  /// The Amazon Web Services account ID to retrieve grouping attribute
  /// definitions for. Use this when accessing grouping configurations from a
  /// different account in cross-account monitoring scenarios.
  ///
  /// Parameter [includeLinkedAccounts] :
  /// If you are using this operation in a monitoring account, specify
  /// <code>true</code> to include grouping attributes from source accounts in
  /// the returned data.
  ///
  /// Parameter [nextToken] :
  /// Include this value, if it was returned by the previous operation, to get
  /// the next set of grouping attribute definitions.
  Future<ListGroupingAttributeDefinitionsOutput>
      listGroupingAttributeDefinitions({
    String? awsAccountId,
    bool? includeLinkedAccounts,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (awsAccountId != null) 'AwsAccountId': [awsAccountId],
      if (includeLinkedAccounts != null)
        'IncludeLinkedAccounts': [includeLinkedAccounts.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/grouping-attribute-definitions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListGroupingAttributeDefinitionsOutput.fromJson(response);
  }

  /// Returns a list of service dependencies of the service that you specify. A
  /// dependency is an infrastructure component that an operation of this
  /// service connects with. Dependencies can include Amazon Web Services
  /// services, Amazon Web Services resources, and third-party services.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [endTime] :
  /// The end of the time period to retrieve information about. When used in a
  /// raw HTTP Query API, it is formatted as be epoch time in seconds. For
  /// example: <code>1698778057</code>
  ///
  /// Your requested end time will be rounded to the nearest hour.
  ///
  /// Parameter [keyAttributes] :
  /// Use this field to specify which service you want to retrieve information
  /// for. You must specify at least the <code>Type</code>, <code>Name</code>,
  /// and <code>Environment</code> attributes.
  ///
  /// This is a string-to-string map. It can include the following fields.
  ///
  /// <ul>
  /// <li>
  /// <code>Type</code> designates the type of object this is.
  /// </li>
  /// <li>
  /// <code>ResourceType</code> specifies the type of the resource. This field
  /// is used only when the value of the <code>Type</code> field is
  /// <code>Resource</code> or <code>AWS::Resource</code>.
  /// </li>
  /// <li>
  /// <code>Name</code> specifies the name of the object. This is used only if
  /// the value of the <code>Type</code> field is <code>Service</code>,
  /// <code>RemoteService</code>, or <code>AWS::Service</code>.
  /// </li>
  /// <li>
  /// <code>Identifier</code> identifies the resource objects of this resource.
  /// This is used only if the value of the <code>Type</code> field is
  /// <code>Resource</code> or <code>AWS::Resource</code>.
  /// </li>
  /// <li>
  /// <code>Environment</code> specifies the location where this object is
  /// hosted, or what it belongs to.
  /// </li>
  /// </ul>
  ///
  /// Parameter [startTime] :
  /// The start of the time period to retrieve information about. When used in a
  /// raw HTTP Query API, it is formatted as be epoch time in seconds. For
  /// example: <code>1698778057</code>
  ///
  /// Your requested start time will be rounded to the nearest hour.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in one operation. If you omit this
  /// parameter, the default of 50 is used.
  ///
  /// Parameter [nextToken] :
  /// Include this value, if it was returned by the previous operation, to get
  /// the next set of service dependencies.
  Future<ListServiceDependenciesOutput> listServiceDependencies({
    required DateTime endTime,
    required Map<String, String> keyAttributes,
    required DateTime startTime,
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
      'EndTime': [_s.iso8601ToJson(endTime).toString()],
      'StartTime': [_s.iso8601ToJson(startTime).toString()],
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final $payload = <String, dynamic>{
      'KeyAttributes': keyAttributes,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/service-dependencies',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListServiceDependenciesOutput.fromJson(response);
  }

  /// Returns the list of dependents that invoked the specified service during
  /// the provided time range. Dependents include other services, CloudWatch
  /// Synthetics canaries, and clients that are instrumented with CloudWatch RUM
  /// app monitors.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [endTime] :
  /// The end of the time period to retrieve information about. When used in a
  /// raw HTTP Query API, it is formatted as be epoch time in seconds. For
  /// example: <code>1698778057</code>
  ///
  /// Your requested start time will be rounded to the nearest hour.
  ///
  /// Parameter [keyAttributes] :
  /// Use this field to specify which service you want to retrieve information
  /// for. You must specify at least the <code>Type</code>, <code>Name</code>,
  /// and <code>Environment</code> attributes.
  ///
  /// This is a string-to-string map. It can include the following fields.
  ///
  /// <ul>
  /// <li>
  /// <code>Type</code> designates the type of object this is.
  /// </li>
  /// <li>
  /// <code>ResourceType</code> specifies the type of the resource. This field
  /// is used only when the value of the <code>Type</code> field is
  /// <code>Resource</code> or <code>AWS::Resource</code>.
  /// </li>
  /// <li>
  /// <code>Name</code> specifies the name of the object. This is used only if
  /// the value of the <code>Type</code> field is <code>Service</code>,
  /// <code>RemoteService</code>, or <code>AWS::Service</code>.
  /// </li>
  /// <li>
  /// <code>Identifier</code> identifies the resource objects of this resource.
  /// This is used only if the value of the <code>Type</code> field is
  /// <code>Resource</code> or <code>AWS::Resource</code>.
  /// </li>
  /// <li>
  /// <code>Environment</code> specifies the location where this object is
  /// hosted, or what it belongs to.
  /// </li>
  /// </ul>
  ///
  /// Parameter [startTime] :
  /// The start of the time period to retrieve information about. When used in a
  /// raw HTTP Query API, it is formatted as be epoch time in seconds. For
  /// example: <code>1698778057</code>
  ///
  /// Your requested start time will be rounded to the nearest hour.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in one operation. If you omit this
  /// parameter, the default of 50 is used.
  ///
  /// Parameter [nextToken] :
  /// Include this value, if it was returned by the previous operation, to get
  /// the next set of service dependents.
  Future<ListServiceDependentsOutput> listServiceDependents({
    required DateTime endTime,
    required Map<String, String> keyAttributes,
    required DateTime startTime,
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
      'EndTime': [_s.iso8601ToJson(endTime).toString()],
      'StartTime': [_s.iso8601ToJson(startTime).toString()],
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final $payload = <String, dynamic>{
      'KeyAttributes': keyAttributes,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/service-dependents',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListServiceDependentsOutput.fromJson(response);
  }

  /// Retrieves all exclusion windows configured for a specific SLO.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [id] :
  /// The ID of the SLO to list exclusion windows for.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in one operation. If you omit this
  /// parameter, the default of 50 is used.
  ///
  /// Parameter [nextToken] :
  /// Include this value, if it was returned by the previous operation, to get
  /// the next set of service level objectives.
  Future<ListServiceLevelObjectiveExclusionWindowsOutput>
      listServiceLevelObjectiveExclusionWindows({
    required String id,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      10,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/slo/${Uri.encodeComponent(id)}/exclusion-windows',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListServiceLevelObjectiveExclusionWindowsOutput.fromJson(response);
  }

  /// Returns a list of the <i>operations</i> of this service that have been
  /// discovered by Application Signals. Only the operations that were invoked
  /// during the specified time range are returned.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [endTime] :
  /// The end of the time period to retrieve information about. When used in a
  /// raw HTTP Query API, it is formatted as be epoch time in seconds. For
  /// example: <code>1698778057</code>
  ///
  /// Your requested end time will be rounded to the nearest hour.
  ///
  /// Parameter [keyAttributes] :
  /// Use this field to specify which service you want to retrieve information
  /// for. You must specify at least the <code>Type</code>, <code>Name</code>,
  /// and <code>Environment</code> attributes.
  ///
  /// This is a string-to-string map. It can include the following fields.
  ///
  /// <ul>
  /// <li>
  /// <code>Type</code> designates the type of object this is.
  /// </li>
  /// <li>
  /// <code>ResourceType</code> specifies the type of the resource. This field
  /// is used only when the value of the <code>Type</code> field is
  /// <code>Resource</code> or <code>AWS::Resource</code>.
  /// </li>
  /// <li>
  /// <code>Name</code> specifies the name of the object. This is used only if
  /// the value of the <code>Type</code> field is <code>Service</code>,
  /// <code>RemoteService</code>, or <code>AWS::Service</code>.
  /// </li>
  /// <li>
  /// <code>Identifier</code> identifies the resource objects of this resource.
  /// This is used only if the value of the <code>Type</code> field is
  /// <code>Resource</code> or <code>AWS::Resource</code>.
  /// </li>
  /// <li>
  /// <code>Environment</code> specifies the location where this object is
  /// hosted, or what it belongs to.
  /// </li>
  /// </ul>
  ///
  /// Parameter [startTime] :
  /// The start of the time period to retrieve information about. When used in a
  /// raw HTTP Query API, it is formatted as be epoch time in seconds. For
  /// example: <code>1698778057</code>
  ///
  /// Your requested start time will be rounded to the nearest hour.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in one operation. If you omit this
  /// parameter, the default of 50 is used.
  ///
  /// Parameter [nextToken] :
  /// Include this value, if it was returned by the previous operation, to get
  /// the next set of service operations.
  Future<ListServiceOperationsOutput> listServiceOperations({
    required DateTime endTime,
    required Map<String, String> keyAttributes,
    required DateTime startTime,
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
      'EndTime': [_s.iso8601ToJson(endTime).toString()],
      'StartTime': [_s.iso8601ToJson(startTime).toString()],
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final $payload = <String, dynamic>{
      'KeyAttributes': keyAttributes,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/service-operations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListServiceOperationsOutput.fromJson(response);
  }

  /// Returns a list of services that have been discovered by Application
  /// Signals. A service represents a minimum logical and transactional unit
  /// that completes a business function. Services are discovered through
  /// Application Signals instrumentation.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [endTime] :
  /// The end of the time period to retrieve information about. When used in a
  /// raw HTTP Query API, it is formatted as be epoch time in seconds. For
  /// example: <code>1698778057</code>
  ///
  /// Your requested start time will be rounded to the nearest hour.
  ///
  /// Parameter [startTime] :
  /// The start of the time period to retrieve information about. When used in a
  /// raw HTTP Query API, it is formatted as be epoch time in seconds. For
  /// example: <code>1698778057</code>
  ///
  /// Your requested start time will be rounded to the nearest hour.
  ///
  /// Parameter [awsAccountId] :
  /// Amazon Web Services Account ID.
  ///
  /// Parameter [includeLinkedAccounts] :
  /// If you are using this operation in a monitoring account, specify
  /// <code>true</code> to include services from source accounts in the returned
  /// data.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in one operation. If you omit this
  /// parameter, the default of 50 is used.
  ///
  /// Parameter [nextToken] :
  /// Include this value, if it was returned by the previous operation, to get
  /// the next set of services.
  Future<ListServicesOutput> listServices({
    required DateTime endTime,
    required DateTime startTime,
    String? awsAccountId,
    bool? includeLinkedAccounts,
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
      'EndTime': [_s.iso8601ToJson(endTime).toString()],
      'StartTime': [_s.iso8601ToJson(startTime).toString()],
      if (awsAccountId != null) 'AwsAccountId': [awsAccountId],
      if (includeLinkedAccounts != null)
        'IncludeLinkedAccounts': [includeLinkedAccounts.toString()],
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/services',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListServicesOutput.fromJson(response);
  }

  /// Returns information about the last deployment and other change states of
  /// services. This API provides visibility into recent changes that may have
  /// affected service performance, helping with troubleshooting and change
  /// correlation.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [endTime] :
  /// The end of the time period to retrieve service state information for. When
  /// used in a raw HTTP Query API, it is formatted as epoch time in seconds.
  /// For example, <code>1698778057</code>.
  ///
  /// Parameter [startTime] :
  /// The start of the time period to retrieve service state information for.
  /// When used in a raw HTTP Query API, it is formatted as epoch time in
  /// seconds. For example, <code>1698778057</code>.
  ///
  /// Parameter [attributeFilters] :
  /// A list of attribute filters to narrow down the services. You can filter by
  /// platform, environment, or other service attributes.
  ///
  /// Parameter [awsAccountId] :
  /// The Amazon Web Services account ID to filter service states by. Use this
  /// to limit results to services from a specific account.
  ///
  /// Parameter [includeLinkedAccounts] :
  /// If you are using this operation in a monitoring account, specify
  /// <code>true</code> to include service states from source accounts in the
  /// returned data.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of service states to return in one operation. If you
  /// omit this parameter, the default of 20 is used.
  ///
  /// Parameter [nextToken] :
  /// Include this value, if it was returned by the previous operation, to get
  /// the next set of service states.
  Future<ListServiceStatesOutput> listServiceStates({
    required DateTime endTime,
    required DateTime startTime,
    List<AttributeFilter>? attributeFilters,
    String? awsAccountId,
    bool? includeLinkedAccounts,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      250,
    );
    final $payload = <String, dynamic>{
      'EndTime': unixTimestampToJson(endTime),
      'StartTime': unixTimestampToJson(startTime),
      if (attributeFilters != null) 'AttributeFilters': attributeFilters,
      if (awsAccountId != null) 'AwsAccountId': awsAccountId,
      if (includeLinkedAccounts != null)
        'IncludeLinkedAccounts': includeLinkedAccounts,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/service/states',
      exceptionFnMap: _exceptionFns,
    );
    return ListServiceStatesOutput.fromJson(response);
  }

  /// Displays the tags associated with a CloudWatch resource. Tags can be
  /// assigned to service level objectives.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the CloudWatch resource that you want to
  /// view tags for.
  ///
  /// The ARN format of an Application Signals SLO is
  /// <code>arn:aws:cloudwatch:<i>Region</i>:<i>account-id</i>:slo:<i>slo-name</i>
  /// </code>
  ///
  /// For more information about ARN format, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/list_amazoncloudwatch.html#amazoncloudwatch-resources-for-iam-policies">
  /// Resource Types Defined by Amazon CloudWatch</a> in the <i>Amazon Web
  /// Services General Reference</i>.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    final $query = <String, List<String>>{
      'ResourceArn': [resourceArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Creates or updates the grouping configuration for this account. This
  /// operation allows you to define custom grouping attributes that determine
  /// how services are logically grouped based on telemetry attributes, Amazon
  /// Web Services tags, or predefined mappings. These grouping attributes can
  /// then be used to organize and filter services in the Application Signals
  /// console and APIs.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [groupingAttributeDefinitions] :
  /// An array of grouping attribute definitions that specify how services
  /// should be grouped. Each definition includes a friendly name, source keys
  /// to derive the grouping value from, and an optional default value.
  Future<PutGroupingConfigurationOutput> putGroupingConfiguration({
    required List<GroupingAttributeDefinition> groupingAttributeDefinitions,
  }) async {
    final $payload = <String, dynamic>{
      'GroupingAttributeDefinitions': groupingAttributeDefinitions,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/grouping-configuration',
      exceptionFnMap: _exceptionFns,
    );
    return PutGroupingConfigurationOutput.fromJson(response);
  }

  /// Enables this Amazon Web Services account to be able to use CloudWatch
  /// Application Signals by creating the
  /// <i>AWSServiceRoleForCloudWatchApplicationSignals</i> service-linked role.
  /// This service- linked role has the following permissions:
  ///
  /// <ul>
  /// <li>
  /// <code>xray:GetServiceGraph</code>
  /// </li>
  /// <li>
  /// <code>logs:StartQuery</code>
  /// </li>
  /// <li>
  /// <code>logs:GetQueryResults</code>
  /// </li>
  /// <li>
  /// <code>cloudwatch:GetMetricData</code>
  /// </li>
  /// <li>
  /// <code>cloudwatch:ListMetrics</code>
  /// </li>
  /// <li>
  /// <code>tag:GetResources</code>
  /// </li>
  /// <li>
  /// <code>autoscaling:DescribeAutoScalingGroups</code>
  /// </li>
  /// </ul>
  /// A service-linked CloudTrail event channel is created to process CloudTrail
  /// events and return change event information. This includes last deployment
  /// time, userName, eventName, and other event metadata.
  ///
  /// After completing this step, you still need to instrument your Java and
  /// Python applications to send data to Application Signals. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Application-Signals-Enable.html">
  /// Enabling Application Signals</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  Future<void> startDiscovery() async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/start-discovery',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Assigns one or more tags (key-value pairs) to the specified CloudWatch
  /// resource, such as a service level objective.
  ///
  /// Tags can help you organize and categorize your resources. You can also use
  /// them to scope user permissions by granting a user permission to access or
  /// change only resources with certain tag values.
  ///
  /// Tags don't have any semantic meaning to Amazon Web Services and are
  /// interpreted strictly as strings of characters.
  ///
  /// You can use the <code>TagResource</code> action with an alarm that already
  /// has tags. If you specify a new tag key for the alarm, this tag is appended
  /// to the list of tags associated with the alarm. If you specify a tag key
  /// that is already associated with the alarm, the new tag value that you
  /// specify replaces the previous value for that tag.
  ///
  /// You can associate as many as 50 tags with a CloudWatch resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the CloudWatch resource that you want to
  /// set tags for.
  ///
  /// The ARN format of an Application Signals SLO is
  /// <code>arn:aws:cloudwatch:<i>Region</i>:<i>account-id</i>:slo:<i>slo-name</i>
  /// </code>
  ///
  /// For more information about ARN format, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/list_amazoncloudwatch.html#amazoncloudwatch-resources-for-iam-policies">
  /// Resource Types Defined by Amazon CloudWatch</a> in the <i>Amazon Web
  /// Services General Reference</i>.
  ///
  /// Parameter [tags] :
  /// The list of key-value pairs to associate with the alarm.
  Future<void> tagResource({
    required String resourceArn,
    required List<Tag> tags,
  }) async {
    final $payload = <String, dynamic>{
      'ResourceArn': resourceArn,
      'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tag-resource',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes one or more tags from the specified resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the CloudWatch resource that you want to
  /// delete tags from.
  ///
  /// The ARN format of an Application Signals SLO is
  /// <code>arn:aws:cloudwatch:<i>Region</i>:<i>account-id</i>:slo:<i>slo-name</i>
  /// </code>
  ///
  /// For more information about ARN format, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/list_amazoncloudwatch.html#amazoncloudwatch-resources-for-iam-policies">
  /// Resource Types Defined by Amazon CloudWatch</a> in the <i>Amazon Web
  /// Services General Reference</i>.
  ///
  /// Parameter [tagKeys] :
  /// The list of tag keys to remove from the resource.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final $payload = <String, dynamic>{
      'ResourceArn': resourceArn,
      'TagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/untag-resource',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates a service level objective (SLO), which can help you ensure that
  /// your critical business operations are meeting customer expectations. Use
  /// SLOs to set and track specific target levels for the reliability and
  /// availability of your applications and services. SLOs use service level
  /// indicators (SLIs) to calculate whether the application is performing at
  /// the level that you want.
  ///
  /// Create an SLO to set a target for a service or operation’s availability or
  /// latency. CloudWatch measures this target frequently you can find whether
  /// it has been breached.
  ///
  /// The target performance quality that is defined for an SLO is the
  /// <i>attainment goal</i>.
  ///
  /// You can set SLO targets for your applications that are discovered by
  /// Application Signals, using critical metrics such as latency and
  /// availability. You can also set SLOs against any CloudWatch metric or math
  /// expression that produces a time series.
  /// <note>
  /// You can't create an SLO for a service operation that was discovered by
  /// Application Signals until after that operation has reported standard
  /// metrics to Application Signals.
  /// </note>
  /// When you create an SLO, you specify whether it is a <i>period-based
  /// SLO</i> or a <i>request-based SLO</i>. Each type of SLO has a different
  /// way of evaluating your application's performance against its attainment
  /// goal.
  ///
  /// <ul>
  /// <li>
  /// A <i>period-based SLO</i> uses defined <i>periods</i> of time within a
  /// specified total time interval. For each period of time, Application
  /// Signals determines whether the application met its goal. The attainment
  /// rate is calculated as the <code>number of good periods/number of total
  /// periods</code>.
  ///
  /// For example, for a period-based SLO, meeting an attainment goal of 99.9%
  /// means that within your interval, your application must meet its
  /// performance goal during at least 99.9% of the time periods.
  /// </li>
  /// <li>
  /// A <i>request-based SLO</i> doesn't use pre-defined periods of time.
  /// Instead, the SLO measures <code>number of good requests/number of total
  /// requests</code> during the interval. At any time, you can find the ratio
  /// of good requests to total requests for the interval up to the time stamp
  /// that you specify, and measure that ratio against the goal set in your SLO.
  /// </li>
  /// </ul>
  /// After you have created an SLO, you can retrieve error budget reports for
  /// it. An <i>error budget</i> is the amount of time or amount of requests
  /// that your application can be non-compliant with the SLO's goal, and still
  /// have your application meet the goal.
  ///
  /// <ul>
  /// <li>
  /// For a period-based SLO, the error budget starts at a number defined by the
  /// highest number of periods that can fail to meet the threshold, while still
  /// meeting the overall goal. The <i>remaining error budget</i> decreases with
  /// every failed period that is recorded. The error budget within one interval
  /// can never increase.
  ///
  /// For example, an SLO with a threshold that 99.95% of requests must be
  /// completed under 2000ms every month translates to an error budget of 21.9
  /// minutes of downtime per month.
  /// </li>
  /// <li>
  /// For a request-based SLO, the remaining error budget is dynamic and can
  /// increase or decrease, depending on the ratio of good requests to total
  /// requests.
  /// </li>
  /// </ul>
  /// For more information about SLOs, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-ServiceLevelObjectives.html">
  /// Service level objectives (SLOs)</a>.
  ///
  /// When you perform a <code>CreateServiceLevelObjective</code> operation,
  /// Application Signals creates the
  /// <i>AWSServiceRoleForCloudWatchApplicationSignals</i> service-linked role,
  /// if it doesn't already exist in your account. This service- linked role has
  /// the following permissions:
  ///
  /// <ul>
  /// <li>
  /// <code>xray:GetServiceGraph</code>
  /// </li>
  /// <li>
  /// <code>logs:StartQuery</code>
  /// </li>
  /// <li>
  /// <code>logs:GetQueryResults</code>
  /// </li>
  /// <li>
  /// <code>cloudwatch:GetMetricData</code>
  /// </li>
  /// <li>
  /// <code>cloudwatch:ListMetrics</code>
  /// </li>
  /// <li>
  /// <code>tag:GetResources</code>
  /// </li>
  /// <li>
  /// <code>autoscaling:DescribeAutoScalingGroups</code>
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// A name for this SLO.
  ///
  /// Parameter [autoInvestigationEnabled] :
  /// Indicates whether DevOps Agent will automatically investigate this SLO
  /// when it is breached
  ///
  /// Parameter [burnRateConfigurations] :
  /// Use this array to create <i>burn rates</i> for this SLO. Each burn rate is
  /// a metric that indicates how fast the service is consuming the error
  /// budget, relative to the attainment goal of the SLO.
  ///
  /// Parameter [createRecommendedSlo] :
  /// Set this to <code>true</code> to create a recommended SLO out of the box.
  /// When set to <code>true</code>, you don't need to specify the
  /// <code>MetricThreshold</code> or <code>ComparisonOperator</code> in the
  /// <code>SliConfig</code> or <code>RequestBasedSliConfig</code>. The default
  /// value is <code>false</code>.
  ///
  /// This is supported for SLOs on a service, service operation, or a
  /// dependency.
  ///
  /// Parameter [description] :
  /// An optional description for this SLO.
  ///
  /// Parameter [goal] :
  /// This structure contains the attributes that determine the goal of the SLO.
  ///
  /// Parameter [requestBasedSliConfig] :
  /// If this SLO is a request-based SLO, this structure defines the information
  /// about what performance metric this SLO will monitor.
  ///
  /// You can't specify both <code>RequestBasedSliConfig</code> and
  /// <code>SliConfig</code> in the same operation.
  ///
  /// Parameter [sliConfig] :
  /// If this SLO is a period-based SLO, this structure defines the information
  /// about what performance metric this SLO will monitor.
  ///
  /// You can't specify both <code>RequestBasedSliConfig</code> and
  /// <code>SliConfig</code> in the same operation.
  ///
  /// Parameter [tags] :
  /// A list of key-value pairs to associate with the SLO. You can associate as
  /// many as 50 tags with an SLO. To be able to associate tags with the SLO
  /// when you create the SLO, you must have the
  /// <code>cloudwatch:TagResource</code> permission.
  ///
  /// Tags can help you organize and categorize your resources. You can also use
  /// them to scope user permissions by granting a user permission to access or
  /// change only resources with certain tag values.
  Future<CreateServiceLevelObjectiveOutput> createServiceLevelObjective({
    required String name,
    bool? autoInvestigationEnabled,
    List<BurnRateConfiguration>? burnRateConfigurations,
    bool? createRecommendedSlo,
    String? description,
    Goal? goal,
    RequestBasedServiceLevelIndicatorConfig? requestBasedSliConfig,
    ServiceLevelIndicatorConfig? sliConfig,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'Name': name,
      if (autoInvestigationEnabled != null)
        'AutoInvestigationEnabled': autoInvestigationEnabled,
      if (burnRateConfigurations != null)
        'BurnRateConfigurations': burnRateConfigurations,
      if (createRecommendedSlo != null)
        'CreateRecommendedSlo': createRecommendedSlo,
      if (description != null) 'Description': description,
      if (goal != null) 'Goal': goal,
      if (requestBasedSliConfig != null)
        'RequestBasedSliConfig': requestBasedSliConfig,
      if (sliConfig != null) 'SliConfig': sliConfig,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/slo',
      exceptionFnMap: _exceptionFns,
    );
    return CreateServiceLevelObjectiveOutput.fromJson(response);
  }

  /// Returns information about one SLO created in the account.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [id] :
  /// The ARN or name of the SLO that you want to retrieve information about.
  /// You can find the ARNs of SLOs by using the <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_ListServiceLevelObjectives.html">ListServiceLevelObjectives</a>
  /// operation.
  Future<GetServiceLevelObjectiveOutput> getServiceLevelObjective({
    required String id,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/slo/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetServiceLevelObjectiveOutput.fromJson(response);
  }

  /// Updates an existing service level objective (SLO). If you omit parameters,
  /// the previous values of those parameters are retained.
  ///
  /// You cannot change from a period-based SLO to a request-based SLO, or
  /// change from a request-based SLO to a period-based SLO.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [id] :
  /// The Amazon Resource Name (ARN) or name of the service level objective that
  /// you want to update.
  ///
  /// Parameter [autoInvestigationEnabled] :
  /// Indicates whether DevOps Agent will automatically investigate this SLO
  /// when it is breached
  ///
  /// Parameter [burnRateConfigurations] :
  /// Use this array to create <i>burn rates</i> for this SLO. Each burn rate is
  /// a metric that indicates how fast the service is consuming the error
  /// budget, relative to the attainment goal of the SLO.
  ///
  /// Parameter [description] :
  /// An optional description for the SLO.
  ///
  /// Parameter [goal] :
  /// A structure that contains the attributes that determine the goal of the
  /// SLO. This includes the time period for evaluation and the attainment
  /// threshold.
  ///
  /// Parameter [requestBasedSliConfig] :
  /// If this SLO is a request-based SLO, this structure defines the information
  /// about what performance metric this SLO will monitor.
  ///
  /// You can't specify both <code>SliConfig</code> and
  /// <code>RequestBasedSliConfig</code> in the same operation.
  ///
  /// Parameter [sliConfig] :
  /// If this SLO is a period-based SLO, this structure defines the information
  /// about what performance metric this SLO will monitor.
  Future<UpdateServiceLevelObjectiveOutput> updateServiceLevelObjective({
    required String id,
    bool? autoInvestigationEnabled,
    List<BurnRateConfiguration>? burnRateConfigurations,
    String? description,
    Goal? goal,
    RequestBasedServiceLevelIndicatorConfig? requestBasedSliConfig,
    ServiceLevelIndicatorConfig? sliConfig,
  }) async {
    final $payload = <String, dynamic>{
      if (autoInvestigationEnabled != null)
        'AutoInvestigationEnabled': autoInvestigationEnabled,
      if (burnRateConfigurations != null)
        'BurnRateConfigurations': burnRateConfigurations,
      if (description != null) 'Description': description,
      if (goal != null) 'Goal': goal,
      if (requestBasedSliConfig != null)
        'RequestBasedSliConfig': requestBasedSliConfig,
      if (sliConfig != null) 'SliConfig': sliConfig,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/slo/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateServiceLevelObjectiveOutput.fromJson(response);
  }

  /// Deletes the specified service level objective.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [id] :
  /// The ARN or name of the service level objective to delete.
  Future<void> deleteServiceLevelObjective({
    required String id,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/slo/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns a list of SLOs created in this account.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [dependencyConfig] :
  /// Identifies the dependency using the <code>DependencyKeyAttributes</code>
  /// and <code>DependencyOperationName</code>.
  ///
  /// Parameter [includeLinkedAccounts] :
  /// If you are using this operation in a monitoring account, specify
  /// <code>true</code> to include SLO from source accounts in the returned
  /// data.
  ///
  /// When you are monitoring an account, you can use Amazon Web Services
  /// account ID in <code>KeyAttribute</code> filter for service source account
  /// and <code>SloOwnerawsaccountID</code> for SLO source account with
  /// <code>IncludeLinkedAccounts</code> to filter the returned data to only a
  /// single source account.
  ///
  /// Parameter [keyAttributes] :
  /// You can use this optional field to specify which services you want to
  /// retrieve SLO information for.
  ///
  /// This is a string-to-string map. It can include the following fields.
  ///
  /// <ul>
  /// <li>
  /// <code>Type</code> designates the type of object this is.
  /// </li>
  /// <li>
  /// <code>ResourceType</code> specifies the type of the resource. This field
  /// is used only when the value of the <code>Type</code> field is
  /// <code>Resource</code> or <code>AWS::Resource</code>.
  /// </li>
  /// <li>
  /// <code>Name</code> specifies the name of the object. This is used only if
  /// the value of the <code>Type</code> field is <code>Service</code>,
  /// <code>RemoteService</code>, or <code>AWS::Service</code>.
  /// </li>
  /// <li>
  /// <code>Identifier</code> identifies the resource objects of this resource.
  /// This is used only if the value of the <code>Type</code> field is
  /// <code>Resource</code> or <code>AWS::Resource</code>.
  /// </li>
  /// <li>
  /// <code>Environment</code> specifies the location where this object is
  /// hosted, or what it belongs to.
  /// </li>
  /// </ul>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in one operation. If you omit this
  /// parameter, the default of 50 is used.
  ///
  /// Parameter [metricSource] :
  /// Identifies the metric source to filter SLOs by.
  ///
  /// Parameter [metricSourceTypes] :
  /// Use this optional field to only include SLOs with the specified metric
  /// source types in the output. Supported types are:
  ///
  /// <ul>
  /// <li>
  /// Service operation
  /// </li>
  /// <li>
  /// Service dependency
  /// </li>
  /// <li>
  /// Service
  /// </li>
  /// <li>
  /// CloudWatch metric
  /// </li>
  /// <li>
  /// AppMonitor
  /// </li>
  /// <li>
  /// Canary
  /// </li>
  /// </ul>
  ///
  /// Parameter [nextToken] :
  /// Include this value, if it was returned by the previous operation, to get
  /// the next set of service level objectives.
  ///
  /// Parameter [operationName] :
  /// The name of the operation that this SLO is associated with.
  ///
  /// Parameter [sloOwnerAwsAccountId] :
  /// SLO's Amazon Web Services account ID.
  Future<ListServiceLevelObjectivesOutput> listServiceLevelObjectives({
    DependencyConfig? dependencyConfig,
    bool? includeLinkedAccounts,
    Map<String, String>? keyAttributes,
    int? maxResults,
    MetricSource? metricSource,
    List<MetricSourceType>? metricSourceTypes,
    String? nextToken,
    String? operationName,
    String? sloOwnerAwsAccountId,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (includeLinkedAccounts != null)
        'IncludeLinkedAccounts': [includeLinkedAccounts.toString()],
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
      if (operationName != null) 'OperationName': [operationName],
      if (sloOwnerAwsAccountId != null)
        'SloOwnerAwsAccountId': [sloOwnerAwsAccountId],
    };
    final $payload = <String, dynamic>{
      if (dependencyConfig != null) 'DependencyConfig': dependencyConfig,
      if (keyAttributes != null) 'KeyAttributes': keyAttributes,
      if (metricSource != null) 'MetricSource': metricSource,
      if (metricSourceTypes != null)
        'MetricSourceTypes': metricSourceTypes.map((e) => e.value).toList(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/slos',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListServiceLevelObjectivesOutput.fromJson(response);
  }
}

/// @nodoc
class BatchGetServiceLevelObjectiveBudgetReportOutput {
  /// An array of structures, where each structure includes an error indicating
  /// that one of the requests in the array was not valid.
  final List<ServiceLevelObjectiveBudgetReportError> errors;

  /// An array of structures, where each structure is one budget report.
  final List<ServiceLevelObjectiveBudgetReport> reports;

  /// The date and time that the report is for. It is expressed as the number of
  /// milliseconds since Jan 1, 1970 00:00:00 UTC.
  final DateTime timestamp;

  BatchGetServiceLevelObjectiveBudgetReportOutput({
    required this.errors,
    required this.reports,
    required this.timestamp,
  });

  factory BatchGetServiceLevelObjectiveBudgetReportOutput.fromJson(
      Map<String, dynamic> json) {
    return BatchGetServiceLevelObjectiveBudgetReportOutput(
      errors: ((json['Errors'] as List?) ?? const [])
          .nonNulls
          .map((e) => ServiceLevelObjectiveBudgetReportError.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      reports: ((json['Reports'] as List?) ?? const [])
          .nonNulls
          .map((e) => ServiceLevelObjectiveBudgetReport.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      timestamp: nonNullableTimeStampFromJson(json['Timestamp'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    final reports = this.reports;
    final timestamp = this.timestamp;
    return {
      'Errors': errors,
      'Reports': reports,
      'Timestamp': unixTimestampToJson(timestamp),
    };
  }
}

/// @nodoc
class BatchUpdateExclusionWindowsOutput {
  /// A list of errors that occurred while processing the request.
  final List<BatchUpdateExclusionWindowsError> errors;

  /// The list of SLO IDs that were successfully processed.
  final List<String> sloIds;

  BatchUpdateExclusionWindowsOutput({
    required this.errors,
    required this.sloIds,
  });

  factory BatchUpdateExclusionWindowsOutput.fromJson(
      Map<String, dynamic> json) {
    return BatchUpdateExclusionWindowsOutput(
      errors: ((json['Errors'] as List?) ?? const [])
          .nonNulls
          .map((e) => BatchUpdateExclusionWindowsError.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      sloIds: ((json['SloIds'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    final sloIds = this.sloIds;
    return {
      'Errors': errors,
      'SloIds': sloIds,
    };
  }
}

/// @nodoc
class DeleteGroupingConfigurationOutput {
  DeleteGroupingConfigurationOutput();

  factory DeleteGroupingConfigurationOutput.fromJson(Map<String, dynamic> _) {
    return DeleteGroupingConfigurationOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class GetServiceOutput {
  /// The end time of the data included in the response. In a raw HTTP Query API,
  /// it is formatted as be epoch time in seconds. For example:
  /// <code>1698778057</code>.
  ///
  /// This displays the time that Application Signals used for the request. It
  /// might not match your request exactly, because it was rounded to the nearest
  /// hour.
  final DateTime endTime;

  /// A structure containing information about the service.
  final Service service;

  /// The start time of the data included in the response. In a raw HTTP Query
  /// API, it is formatted as be epoch time in seconds. For example:
  /// <code>1698778057</code>.
  ///
  /// This displays the time that Application Signals used for the request. It
  /// might not match your request exactly, because it was rounded to the nearest
  /// hour.
  final DateTime startTime;

  /// An array of string-to-string maps that each contain information about one
  /// log group associated with this service. Each string-to-string map includes
  /// the following fields:
  ///
  /// <ul>
  /// <li>
  /// <code>"Type": "AWS::Resource"</code>
  /// </li>
  /// <li>
  /// <code>"ResourceType": "AWS::Logs::LogGroup"</code>
  /// </li>
  /// <li>
  /// <code>"Identifier": "<i>name-of-log-group</i>"</code>
  /// </li>
  /// </ul>
  final List<Map<String, String>>? logGroupReferences;

  GetServiceOutput({
    required this.endTime,
    required this.service,
    required this.startTime,
    this.logGroupReferences,
  });

  factory GetServiceOutput.fromJson(Map<String, dynamic> json) {
    return GetServiceOutput(
      endTime: nonNullableTimeStampFromJson(json['EndTime'] ?? 0),
      service: Service.fromJson((json['Service'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
      startTime: nonNullableTimeStampFromJson(json['StartTime'] ?? 0),
      logGroupReferences: (json['LogGroupReferences'] as List?)
          ?.nonNulls
          .map((e) => (e as Map<String, dynamic>)
              .map((k, e) => MapEntry(k, e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final endTime = this.endTime;
    final service = this.service;
    final startTime = this.startTime;
    final logGroupReferences = this.logGroupReferences;
    return {
      'EndTime': unixTimestampToJson(endTime),
      'Service': service,
      'StartTime': unixTimestampToJson(startTime),
      if (logGroupReferences != null) 'LogGroupReferences': logGroupReferences,
    };
  }
}

/// @nodoc
class ListAuditFindingsOutput {
  /// An array of structures, where each structure contains information about one
  /// audit finding, including the auditor results, severity, and associated
  /// metric and dependency graphs.
  final List<AuditFinding> auditFindings;

  /// The end of the time period that the returned audit findings apply to. When
  /// used in a raw HTTP Query API, it is formatted as epoch time in seconds. For
  /// example, <code>1698778057</code>
  final DateTime? endTime;

  /// Include this value in your next use of this API to get the next set of audit
  /// findings.
  final String? nextToken;

  /// The start of the time period that the returned audit findings apply to. When
  /// used in a raw HTTP Query API, it is formatted as epoch time in seconds. For
  /// example, <code>1698778057</code>
  final DateTime? startTime;

  ListAuditFindingsOutput({
    required this.auditFindings,
    this.endTime,
    this.nextToken,
    this.startTime,
  });

  factory ListAuditFindingsOutput.fromJson(Map<String, dynamic> json) {
    return ListAuditFindingsOutput(
      auditFindings: ((json['AuditFindings'] as List?) ?? const [])
          .nonNulls
          .map((e) => AuditFinding.fromJson(e as Map<String, dynamic>))
          .toList(),
      endTime: timeStampFromJson(json['EndTime']),
      nextToken: json['NextToken'] as String?,
      startTime: timeStampFromJson(json['StartTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final auditFindings = this.auditFindings;
    final endTime = this.endTime;
    final nextToken = this.nextToken;
    final startTime = this.startTime;
    return {
      'AuditFindings': auditFindings,
      if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
      if (nextToken != null) 'NextToken': nextToken,
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
    };
  }
}

/// @nodoc
class ListEntityEventsOutput {
  /// An array of structures, where each structure contains information about one
  /// change event that occurred for the specified entity during the requested
  /// time period.
  final List<ChangeEvent> changeEvents;

  /// The end of the time period that the returned change events apply to. When
  /// used in a raw HTTP Query API, it is formatted as epoch time in seconds. For
  /// example: <code>1698778057</code>
  final DateTime endTime;

  /// The start of the time period that the returned change events apply to. When
  /// used in a raw HTTP Query API, it is formatted as epoch time in seconds. For
  /// example: <code>1698778057</code>
  final DateTime startTime;

  /// Include this value in your next use of this API to get the next set of
  /// change events.
  final String? nextToken;

  ListEntityEventsOutput({
    required this.changeEvents,
    required this.endTime,
    required this.startTime,
    this.nextToken,
  });

  factory ListEntityEventsOutput.fromJson(Map<String, dynamic> json) {
    return ListEntityEventsOutput(
      changeEvents: ((json['ChangeEvents'] as List?) ?? const [])
          .nonNulls
          .map((e) => ChangeEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
      endTime: nonNullableTimeStampFromJson(json['EndTime'] ?? 0),
      startTime: nonNullableTimeStampFromJson(json['StartTime'] ?? 0),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final changeEvents = this.changeEvents;
    final endTime = this.endTime;
    final startTime = this.startTime;
    final nextToken = this.nextToken;
    return {
      'ChangeEvents': changeEvents,
      'EndTime': unixTimestampToJson(endTime),
      'StartTime': unixTimestampToJson(startTime),
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class ListGroupingAttributeDefinitionsOutput {
  /// An array of structures, where each structure contains information about one
  /// grouping attribute definition, including the grouping name, source keys, and
  /// default values.
  final List<GroupingAttributeDefinition> groupingAttributeDefinitions;

  /// Include this value in your next use of this API to get the next set of
  /// grouping attribute definitions.
  final String? nextToken;

  /// The timestamp when the grouping configuration was last updated. When used in
  /// a raw HTTP Query API, it is formatted as epoch time in seconds.
  final DateTime? updatedAt;

  ListGroupingAttributeDefinitionsOutput({
    required this.groupingAttributeDefinitions,
    this.nextToken,
    this.updatedAt,
  });

  factory ListGroupingAttributeDefinitionsOutput.fromJson(
      Map<String, dynamic> json) {
    return ListGroupingAttributeDefinitionsOutput(
      groupingAttributeDefinitions: ((json['GroupingAttributeDefinitions']
                  as List?) ??
              const [])
          .nonNulls
          .map((e) =>
              GroupingAttributeDefinition.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final groupingAttributeDefinitions = this.groupingAttributeDefinitions;
    final nextToken = this.nextToken;
    final updatedAt = this.updatedAt;
    return {
      'GroupingAttributeDefinitions': groupingAttributeDefinitions,
      if (nextToken != null) 'NextToken': nextToken,
      if (updatedAt != null) 'UpdatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// @nodoc
class ListServiceDependenciesOutput {
  /// The end of the time period that the returned information applies to. When
  /// used in a raw HTTP Query API, it is formatted as be epoch time in seconds.
  /// For example: <code>1698778057</code>
  ///
  /// This displays the time that Application Signals used for the request. It
  /// might not match your request exactly, because it was rounded to the nearest
  /// hour.
  final DateTime endTime;

  /// An array, where each object in the array contains information about one of
  /// the dependencies of this service.
  final List<ServiceDependency> serviceDependencies;

  /// The start of the time period that the returned information applies to. When
  /// used in a raw HTTP Query API, it is formatted as be epoch time in seconds.
  /// For example: <code>1698778057</code>
  ///
  /// This displays the time that Application Signals used for the request. It
  /// might not match your request exactly, because it was rounded to the nearest
  /// hour.
  final DateTime startTime;

  /// Include this value in your next use of this API to get next set of service
  /// dependencies.
  final String? nextToken;

  ListServiceDependenciesOutput({
    required this.endTime,
    required this.serviceDependencies,
    required this.startTime,
    this.nextToken,
  });

  factory ListServiceDependenciesOutput.fromJson(Map<String, dynamic> json) {
    return ListServiceDependenciesOutput(
      endTime: nonNullableTimeStampFromJson(json['EndTime'] ?? 0),
      serviceDependencies: ((json['ServiceDependencies'] as List?) ?? const [])
          .nonNulls
          .map((e) => ServiceDependency.fromJson(e as Map<String, dynamic>))
          .toList(),
      startTime: nonNullableTimeStampFromJson(json['StartTime'] ?? 0),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final endTime = this.endTime;
    final serviceDependencies = this.serviceDependencies;
    final startTime = this.startTime;
    final nextToken = this.nextToken;
    return {
      'EndTime': unixTimestampToJson(endTime),
      'ServiceDependencies': serviceDependencies,
      'StartTime': unixTimestampToJson(startTime),
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class ListServiceDependentsOutput {
  /// The end of the time period that the returned information applies to. When
  /// used in a raw HTTP Query API, it is formatted as be epoch time in seconds.
  /// For example: <code>1698778057</code>
  ///
  /// This displays the time that Application Signals used for the request. It
  /// might not match your request exactly, because it was rounded to the nearest
  /// hour.
  final DateTime endTime;

  /// An array, where each object in the array contains information about one of
  /// the dependents of this service.
  final List<ServiceDependent> serviceDependents;

  /// The start of the time period that the returned information applies to. When
  /// used in a raw HTTP Query API, it is formatted as be epoch time in seconds.
  /// For example: <code>1698778057</code>
  ///
  /// This displays the time that Application Signals used for the request. It
  /// might not match your request exactly, because it was rounded to the nearest
  /// hour.
  final DateTime startTime;

  /// Include this value in your next use of this API to get next set of service
  /// dependents.
  final String? nextToken;

  ListServiceDependentsOutput({
    required this.endTime,
    required this.serviceDependents,
    required this.startTime,
    this.nextToken,
  });

  factory ListServiceDependentsOutput.fromJson(Map<String, dynamic> json) {
    return ListServiceDependentsOutput(
      endTime: nonNullableTimeStampFromJson(json['EndTime'] ?? 0),
      serviceDependents: ((json['ServiceDependents'] as List?) ?? const [])
          .nonNulls
          .map((e) => ServiceDependent.fromJson(e as Map<String, dynamic>))
          .toList(),
      startTime: nonNullableTimeStampFromJson(json['StartTime'] ?? 0),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final endTime = this.endTime;
    final serviceDependents = this.serviceDependents;
    final startTime = this.startTime;
    final nextToken = this.nextToken;
    return {
      'EndTime': unixTimestampToJson(endTime),
      'ServiceDependents': serviceDependents,
      'StartTime': unixTimestampToJson(startTime),
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class ListServiceLevelObjectiveExclusionWindowsOutput {
  /// A list of exclusion windows configured for the SLO.
  final List<ExclusionWindow> exclusionWindows;

  /// Include this value, if it was returned by the previous operation, to get the
  /// next set of service level objectives.
  final String? nextToken;

  ListServiceLevelObjectiveExclusionWindowsOutput({
    required this.exclusionWindows,
    this.nextToken,
  });

  factory ListServiceLevelObjectiveExclusionWindowsOutput.fromJson(
      Map<String, dynamic> json) {
    return ListServiceLevelObjectiveExclusionWindowsOutput(
      exclusionWindows: ((json['ExclusionWindows'] as List?) ?? const [])
          .nonNulls
          .map((e) => ExclusionWindow.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final exclusionWindows = this.exclusionWindows;
    final nextToken = this.nextToken;
    return {
      'ExclusionWindows': exclusionWindows,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class ListServiceOperationsOutput {
  /// The end of the time period that the returned information applies to. When
  /// used in a raw HTTP Query API, it is formatted as be epoch time in seconds.
  /// For example: <code>1698778057</code>
  ///
  /// This displays the time that Application Signals used for the request. It
  /// might not match your request exactly, because it was rounded to the nearest
  /// hour.
  final DateTime endTime;

  /// An array of structures that each contain information about one operation of
  /// this service.
  final List<ServiceOperation> serviceOperations;

  /// The start of the time period that the returned information applies to. When
  /// used in a raw HTTP Query API, it is formatted as be epoch time in seconds.
  /// For example: <code>1698778057</code>
  ///
  /// This displays the time that Application Signals used for the request. It
  /// might not match your request exactly, because it was rounded to the nearest
  /// hour.
  final DateTime startTime;

  /// Include this value in your next use of this API to get next set of service
  /// operations.
  final String? nextToken;

  ListServiceOperationsOutput({
    required this.endTime,
    required this.serviceOperations,
    required this.startTime,
    this.nextToken,
  });

  factory ListServiceOperationsOutput.fromJson(Map<String, dynamic> json) {
    return ListServiceOperationsOutput(
      endTime: nonNullableTimeStampFromJson(json['EndTime'] ?? 0),
      serviceOperations: ((json['ServiceOperations'] as List?) ?? const [])
          .nonNulls
          .map((e) => ServiceOperation.fromJson(e as Map<String, dynamic>))
          .toList(),
      startTime: nonNullableTimeStampFromJson(json['StartTime'] ?? 0),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final endTime = this.endTime;
    final serviceOperations = this.serviceOperations;
    final startTime = this.startTime;
    final nextToken = this.nextToken;
    return {
      'EndTime': unixTimestampToJson(endTime),
      'ServiceOperations': serviceOperations,
      'StartTime': unixTimestampToJson(startTime),
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class ListServicesOutput {
  /// The end of the time period that the returned information applies to. When
  /// used in a raw HTTP Query API, it is formatted as be epoch time in seconds.
  /// For example: <code>1698778057</code>
  ///
  /// This displays the time that Application Signals used for the request. It
  /// might not match your request exactly, because it was rounded to the nearest
  /// hour.
  final DateTime endTime;

  /// An array of structures, where each structure contains some information about
  /// a service. To get complete information about a service, use <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_GetService.html">GetService</a>.
  final List<ServiceSummary> serviceSummaries;

  /// The start of the time period that the returned information applies to. When
  /// used in a raw HTTP Query API, it is formatted as be epoch time in seconds.
  /// For example: <code>1698778057</code>
  ///
  /// This displays the time that Application Signals used for the request. It
  /// might not match your request exactly, because it was rounded to the nearest
  /// hour.
  final DateTime startTime;

  /// Include this value in your next use of this API to get next set of services.
  final String? nextToken;

  ListServicesOutput({
    required this.endTime,
    required this.serviceSummaries,
    required this.startTime,
    this.nextToken,
  });

  factory ListServicesOutput.fromJson(Map<String, dynamic> json) {
    return ListServicesOutput(
      endTime: nonNullableTimeStampFromJson(json['EndTime'] ?? 0),
      serviceSummaries: ((json['ServiceSummaries'] as List?) ?? const [])
          .nonNulls
          .map((e) => ServiceSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      startTime: nonNullableTimeStampFromJson(json['StartTime'] ?? 0),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final endTime = this.endTime;
    final serviceSummaries = this.serviceSummaries;
    final startTime = this.startTime;
    final nextToken = this.nextToken;
    return {
      'EndTime': unixTimestampToJson(endTime),
      'ServiceSummaries': serviceSummaries,
      'StartTime': unixTimestampToJson(startTime),
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class ListServiceStatesOutput {
  /// The end of the time period that the returned information applies to. When
  /// used in a raw HTTP Query API, it is formatted as epoch time in seconds. For
  /// example, <code>1698778057</code>.
  final DateTime endTime;

  /// An array of structures, where each structure contains information about the
  /// state of one service, including its latest change events such as
  /// deployments.
  final List<ServiceState> serviceStates;

  /// The start of the time period that the returned information applies to. When
  /// used in a raw HTTP Query API, it is formatted as epoch time in seconds. For
  /// example, <code>1698778057</code>.
  final DateTime startTime;

  /// Include this value in your next use of this API to get the next set of
  /// service states.
  final String? nextToken;

  ListServiceStatesOutput({
    required this.endTime,
    required this.serviceStates,
    required this.startTime,
    this.nextToken,
  });

  factory ListServiceStatesOutput.fromJson(Map<String, dynamic> json) {
    return ListServiceStatesOutput(
      endTime: nonNullableTimeStampFromJson(json['EndTime'] ?? 0),
      serviceStates: ((json['ServiceStates'] as List?) ?? const [])
          .nonNulls
          .map((e) => ServiceState.fromJson(e as Map<String, dynamic>))
          .toList(),
      startTime: nonNullableTimeStampFromJson(json['StartTime'] ?? 0),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final endTime = this.endTime;
    final serviceStates = this.serviceStates;
    final startTime = this.startTime;
    final nextToken = this.nextToken;
    return {
      'EndTime': unixTimestampToJson(endTime),
      'ServiceStates': serviceStates,
      'StartTime': unixTimestampToJson(startTime),
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class ListTagsForResourceResponse {
  /// The list of tag keys and values associated with the resource you specified.
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
class PutGroupingConfigurationOutput {
  /// A structure containing the updated grouping configuration, including all
  /// grouping attribute definitions and the timestamp when it was last updated.
  final GroupingConfiguration groupingConfiguration;

  PutGroupingConfigurationOutput({
    required this.groupingConfiguration,
  });

  factory PutGroupingConfigurationOutput.fromJson(Map<String, dynamic> json) {
    return PutGroupingConfigurationOutput(
      groupingConfiguration: GroupingConfiguration.fromJson(
          (json['GroupingConfiguration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final groupingConfiguration = this.groupingConfiguration;
    return {
      'GroupingConfiguration': groupingConfiguration,
    };
  }
}

/// @nodoc
class StartDiscoveryOutput {
  StartDiscoveryOutput();

  factory StartDiscoveryOutput.fromJson(Map<String, dynamic> _) {
    return StartDiscoveryOutput();
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

/// @nodoc
class CreateServiceLevelObjectiveOutput {
  /// A structure that contains information about the SLO that you just created.
  final ServiceLevelObjective slo;

  CreateServiceLevelObjectiveOutput({
    required this.slo,
  });

  factory CreateServiceLevelObjectiveOutput.fromJson(
      Map<String, dynamic> json) {
    return CreateServiceLevelObjectiveOutput(
      slo: ServiceLevelObjective.fromJson(
          (json['Slo'] as Map<String, dynamic>?) ?? const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final slo = this.slo;
    return {
      'Slo': slo,
    };
  }
}

/// @nodoc
class GetServiceLevelObjectiveOutput {
  /// A structure containing the information about the SLO.
  final ServiceLevelObjective slo;

  GetServiceLevelObjectiveOutput({
    required this.slo,
  });

  factory GetServiceLevelObjectiveOutput.fromJson(Map<String, dynamic> json) {
    return GetServiceLevelObjectiveOutput(
      slo: ServiceLevelObjective.fromJson(
          (json['Slo'] as Map<String, dynamic>?) ?? const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final slo = this.slo;
    return {
      'Slo': slo,
    };
  }
}

/// @nodoc
class UpdateServiceLevelObjectiveOutput {
  /// A structure that contains information about the SLO that you just updated.
  final ServiceLevelObjective slo;

  UpdateServiceLevelObjectiveOutput({
    required this.slo,
  });

  factory UpdateServiceLevelObjectiveOutput.fromJson(
      Map<String, dynamic> json) {
    return UpdateServiceLevelObjectiveOutput(
      slo: ServiceLevelObjective.fromJson(
          (json['Slo'] as Map<String, dynamic>?) ?? const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final slo = this.slo;
    return {
      'Slo': slo,
    };
  }
}

/// @nodoc
class DeleteServiceLevelObjectiveOutput {
  DeleteServiceLevelObjectiveOutput();

  factory DeleteServiceLevelObjectiveOutput.fromJson(Map<String, dynamic> _) {
    return DeleteServiceLevelObjectiveOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class ListServiceLevelObjectivesOutput {
  /// Include this value in your next use of this API to get next set of service
  /// level objectives.
  final String? nextToken;

  /// An array of structures, where each structure contains information about one
  /// SLO.
  final List<ServiceLevelObjectiveSummary>? sloSummaries;

  ListServiceLevelObjectivesOutput({
    this.nextToken,
    this.sloSummaries,
  });

  factory ListServiceLevelObjectivesOutput.fromJson(Map<String, dynamic> json) {
    return ListServiceLevelObjectivesOutput(
      nextToken: json['NextToken'] as String?,
      sloSummaries: (json['SloSummaries'] as List?)
          ?.nonNulls
          .map((e) =>
              ServiceLevelObjectiveSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final sloSummaries = this.sloSummaries;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (sloSummaries != null) 'SloSummaries': sloSummaries,
    };
  }
}

/// A structure that contains information about one service level objective
/// (SLO) created in Application Signals.
///
/// @nodoc
class ServiceLevelObjectiveSummary {
  /// The ARN of this service level objective.
  final String arn;

  /// The name of the service level objective.
  final String name;

  /// The composite SLI configuration for service-level SLOs that monitor multiple
  /// operations of a service.
  final CompositeSliConfig? compositeSliConfig;

  /// The date and time that this service level objective was created. It is
  /// expressed as the number of milliseconds since Jan 1, 1970 00:00:00 UTC.
  final DateTime? createdTime;

  /// Identifies the dependency using the <code>DependencyKeyAttributes</code> and
  /// <code>DependencyOperationName</code>.
  final DependencyConfig? dependencyConfig;

  /// Displays whether this is a period-based SLO or a request-based SLO.
  final EvaluationType? evaluationType;

  /// This is a string-to-string map. It can include the following fields.
  ///
  /// <ul>
  /// <li>
  /// <code>Type</code> designates the type of object this service level objective
  /// is for.
  /// </li>
  /// <li>
  /// <code>ResourceType</code> specifies the type of the resource. This field is
  /// used only when the value of the <code>Type</code> field is
  /// <code>Resource</code> or <code>AWS::Resource</code>.
  /// </li>
  /// <li>
  /// <code>Name</code> specifies the name of the object. This is used only if the
  /// value of the <code>Type</code> field is <code>Service</code>,
  /// <code>RemoteService</code>, or <code>AWS::Service</code>.
  /// </li>
  /// <li>
  /// <code>Identifier</code> identifies the resource objects of this resource.
  /// This is used only if the value of the <code>Type</code> field is
  /// <code>Resource</code> or <code>AWS::Resource</code>.
  /// </li>
  /// <li>
  /// <code>Environment</code> specifies the location where this object is hosted,
  /// or what it belongs to.
  /// </li>
  /// </ul>
  final Map<String, String>? keyAttributes;

  /// Identifies the metric source for SLOs on resources other than Application
  /// Signals services.
  final MetricSource? metricSource;

  /// Displays the SLI metric source type for this SLO. Supported types are:
  ///
  /// <ul>
  /// <li>
  /// Service operation
  /// </li>
  /// <li>
  /// Service dependency
  /// </li>
  /// <li>
  /// Service
  /// </li>
  /// <li>
  /// CloudWatch metric
  /// </li>
  /// <li>
  /// AppMonitor
  /// </li>
  /// <li>
  /// Canary
  /// </li>
  /// </ul>
  final MetricSourceType? metricSourceType;

  /// If this service level objective is specific to a single operation, this
  /// field displays the name of that operation.
  final String? operationName;

  ServiceLevelObjectiveSummary({
    required this.arn,
    required this.name,
    this.compositeSliConfig,
    this.createdTime,
    this.dependencyConfig,
    this.evaluationType,
    this.keyAttributes,
    this.metricSource,
    this.metricSourceType,
    this.operationName,
  });

  factory ServiceLevelObjectiveSummary.fromJson(Map<String, dynamic> json) {
    return ServiceLevelObjectiveSummary(
      arn: (json['Arn'] as String?) ?? '',
      name: (json['Name'] as String?) ?? '',
      compositeSliConfig: json['CompositeSliConfig'] != null
          ? CompositeSliConfig.fromJson(
              json['CompositeSliConfig'] as Map<String, dynamic>)
          : null,
      createdTime: timeStampFromJson(json['CreatedTime']),
      dependencyConfig: json['DependencyConfig'] != null
          ? DependencyConfig.fromJson(
              json['DependencyConfig'] as Map<String, dynamic>)
          : null,
      evaluationType:
          (json['EvaluationType'] as String?)?.let(EvaluationType.fromString),
      keyAttributes: (json['KeyAttributes'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      metricSource: json['MetricSource'] != null
          ? MetricSource.fromJson(json['MetricSource'] as Map<String, dynamic>)
          : null,
      metricSourceType: (json['MetricSourceType'] as String?)
          ?.let(MetricSourceType.fromString),
      operationName: json['OperationName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    final compositeSliConfig = this.compositeSliConfig;
    final createdTime = this.createdTime;
    final dependencyConfig = this.dependencyConfig;
    final evaluationType = this.evaluationType;
    final keyAttributes = this.keyAttributes;
    final metricSource = this.metricSource;
    final metricSourceType = this.metricSourceType;
    final operationName = this.operationName;
    return {
      'Arn': arn,
      'Name': name,
      if (compositeSliConfig != null) 'CompositeSliConfig': compositeSliConfig,
      if (createdTime != null) 'CreatedTime': unixTimestampToJson(createdTime),
      if (dependencyConfig != null) 'DependencyConfig': dependencyConfig,
      if (evaluationType != null) 'EvaluationType': evaluationType.value,
      if (keyAttributes != null) 'KeyAttributes': keyAttributes,
      if (metricSource != null) 'MetricSource': metricSource,
      if (metricSourceType != null) 'MetricSourceType': metricSourceType.value,
      if (operationName != null) 'OperationName': operationName,
    };
  }
}

/// Identifies the dependency using the <code>DependencyKeyAttributes</code> and
/// <code>DependencyOperationName</code>.
///
/// When creating a service dependency SLO, you must specify the
/// <code>KeyAttributes</code> of the service, and the
/// <code>DependencyConfig</code> for the dependency. You can specify the
/// <code>OperationName</code> of the service, from which it calls the
/// dependency. Alternatively, you can exclude <code>OperationName</code> and
/// the SLO will monitor all of the service's operations that call the
/// dependency.
///
/// @nodoc
class DependencyConfig {
  /// This is a string-to-string map. It can include the following fields.
  ///
  /// <ul>
  /// <li>
  /// <code>Type</code> designates the type of object this is.
  /// </li>
  /// <li>
  /// <code>ResourceType</code> specifies the type of the resource. This field is
  /// used only when the value of the <code>Type</code> field is
  /// <code>Resource</code> or <code>AWS::Resource</code>.
  /// </li>
  /// <li>
  /// <code>Name</code> specifies the name of the object. This is used only if the
  /// value of the <code>Type</code> field is <code>Service</code>,
  /// <code>RemoteService</code>, or <code>AWS::Service</code>.
  /// </li>
  /// <li>
  /// <code>Identifier</code> identifies the resource objects of this resource.
  /// This is used only if the value of the <code>Type</code> field is
  /// <code>Resource</code> or <code>AWS::Resource</code>.
  /// </li>
  /// <li>
  /// <code>Environment</code> specifies the location where this object is hosted,
  /// or what it belongs to.
  /// </li>
  /// </ul>
  final Map<String, String> dependencyKeyAttributes;

  /// The name of the called operation in the dependency.
  final String dependencyOperationName;

  DependencyConfig({
    required this.dependencyKeyAttributes,
    required this.dependencyOperationName,
  });

  factory DependencyConfig.fromJson(Map<String, dynamic> json) {
    return DependencyConfig(
      dependencyKeyAttributes:
          ((json['DependencyKeyAttributes'] as Map<String, dynamic>?) ??
                  const <String, dynamic>{})
              .map((k, e) => MapEntry(k, e as String)),
      dependencyOperationName:
          (json['DependencyOperationName'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final dependencyKeyAttributes = this.dependencyKeyAttributes;
    final dependencyOperationName = this.dependencyOperationName;
    return {
      'DependencyKeyAttributes': dependencyKeyAttributes,
      'DependencyOperationName': dependencyOperationName,
    };
  }
}

/// @nodoc
class EvaluationType {
  static const periodBased = EvaluationType._('PeriodBased');
  static const requestBased = EvaluationType._('RequestBased');

  final String value;

  const EvaluationType._(this.value);

  static const values = [periodBased, requestBased];

  static EvaluationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EvaluationType._(value));

  @override
  bool operator ==(other) => other is EvaluationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class MetricSourceType {
  static const serviceOperation = MetricSourceType._('ServiceOperation');
  static const cloudWatchMetric = MetricSourceType._('CloudWatchMetric');
  static const serviceDependency = MetricSourceType._('ServiceDependency');
  static const appMonitor = MetricSourceType._('AppMonitor');
  static const canary = MetricSourceType._('Canary');
  static const service = MetricSourceType._('Service');

  final String value;

  const MetricSourceType._(this.value);

  static const values = [
    serviceOperation,
    cloudWatchMetric,
    serviceDependency,
    appMonitor,
    canary,
    service
  ];

  static MetricSourceType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MetricSourceType._(value));

  @override
  bool operator ==(other) => other is MetricSourceType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Identifies the metric source for SLOs on resources other than Application
/// Signals services.
///
/// @nodoc
class MetricSource {
  /// Key attributes that identify the metric source.
  final Map<String, String> metricSourceKeyAttributes;

  /// Additional attributes for the metric source.
  final Map<String, String>? metricSourceAttributes;

  MetricSource({
    required this.metricSourceKeyAttributes,
    this.metricSourceAttributes,
  });

  factory MetricSource.fromJson(Map<String, dynamic> json) {
    return MetricSource(
      metricSourceKeyAttributes:
          ((json['MetricSourceKeyAttributes'] as Map<String, dynamic>?) ??
                  const <String, dynamic>{})
              .map((k, e) => MapEntry(k, e as String)),
      metricSourceAttributes:
          (json['MetricSourceAttributes'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final metricSourceKeyAttributes = this.metricSourceKeyAttributes;
    final metricSourceAttributes = this.metricSourceAttributes;
    return {
      'MetricSourceKeyAttributes': metricSourceKeyAttributes,
      if (metricSourceAttributes != null)
        'MetricSourceAttributes': metricSourceAttributes,
    };
  }
}

/// This structure contains the configuration for a composite service level
/// indicator (SLI) that aggregates metrics across multiple operations of a
/// service for service-level SLOs.
///
/// @nodoc
class CompositeSliConfig {
  /// Specifies how operations are selected for this service-level SLO. Operations
  /// can be selected explicitly by listing them, by specifying a prefix to match
  /// operation names, or by providing a regular expression pattern.
  final SelectionConfig selectionConfig;

  /// The list of operations included in this composite SLI. You must specify
  /// between 2 and 20 components. Each component is a
  /// <code>CompositeSliComponent</code> that identifies a single operation by its
  /// <code>OperationName</code>.
  final List<CompositeSliComponent>? components;

  CompositeSliConfig({
    required this.selectionConfig,
    this.components,
  });

  factory CompositeSliConfig.fromJson(Map<String, dynamic> json) {
    return CompositeSliConfig(
      selectionConfig: SelectionConfig.fromJson(
          (json['SelectionConfig'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      components: (json['Components'] as List?)
          ?.nonNulls
          .map((e) => CompositeSliComponent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final selectionConfig = this.selectionConfig;
    final components = this.components;
    return {
      'SelectionConfig': selectionConfig,
      if (components != null) 'Components': components,
    };
  }
}

/// Defines how operations are selected for a service-level SLO.
///
/// @nodoc
class SelectionConfig {
  final SelectionType type;

  /// A prefix string or regular expression that specifies which operations to
  /// include in a service-level SLO. When <code>SelectionType</code> is
  /// <code>PREFIX</code>, this value is a prefix string that matches the
  /// beginning of operation names. When <code>SelectionType</code> is
  /// <code>REGEX</code>, this value is a regular expression that matches
  /// operation names.
  final String? pattern;

  SelectionConfig({
    required this.type,
    this.pattern,
  });

  factory SelectionConfig.fromJson(Map<String, dynamic> json) {
    return SelectionConfig(
      type: SelectionType.fromString((json['Type'] as String?) ?? ''),
      pattern: json['Pattern'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final pattern = this.pattern;
    return {
      'Type': type.value,
      if (pattern != null) 'Pattern': pattern,
    };
  }
}

/// Identifies a single operation to include in a composite SLI for a
/// service-level SLO. Used as an element of the <code>Components</code> list in
/// <code>CompositeSliConfig</code>.
///
/// @nodoc
class CompositeSliComponent {
  /// The name of the operation to include in the composite SLI.
  final String? operationName;

  CompositeSliComponent({
    this.operationName,
  });

  factory CompositeSliComponent.fromJson(Map<String, dynamic> json) {
    return CompositeSliComponent(
      operationName: json['OperationName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final operationName = this.operationName;
    return {
      if (operationName != null) 'OperationName': operationName,
    };
  }
}

/// The strategy for selecting operations to include in a service-level SLO.
///
/// <ul>
/// <li>
/// <code>EXPLICIT</code> — You provide a specific list of operations in the
/// <code>Components</code> field of <code>CompositeSliConfig</code>.
/// </li>
/// <li>
/// <code>PREFIX</code> — You provide a prefix string in the
/// <code>Pattern</code> field of <code>SelectionConfig</code>, and all
/// operations whose names start with the prefix are included.
/// </li>
/// <li>
/// <code>REGEX</code> — You provide a regular expression in the
/// <code>Pattern</code> field of <code>SelectionConfig</code>, and all
/// operations whose names match the pattern are included.
/// </li>
/// </ul>
///
/// @nodoc
class SelectionType {
  static const explicit = SelectionType._('EXPLICIT');
  static const prefix = SelectionType._('PREFIX');
  static const regex = SelectionType._('REGEX');

  final String value;

  const SelectionType._(this.value);

  static const values = [explicit, prefix, regex];

  static SelectionType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SelectionType._(value));

  @override
  bool operator ==(other) => other is SelectionType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A structure containing information about one service level objective (SLO)
/// that has been created in Application Signals. Creating SLOs can help you
/// ensure your services are performing to the level that you expect. SLOs help
/// you set and track a specific target level for the reliability and
/// availability of your applications and services. Each SLO uses a service
/// level indicator (SLI), which is a key performance metric, to calculate how
/// much underperformance can be tolerated before the goal that you set for the
/// SLO is not achieved.
///
/// @nodoc
class ServiceLevelObjective {
  /// The ARN of this SLO.
  final String arn;

  /// The date and time that this SLO was created. When used in a raw HTTP Query
  /// API, it is formatted as <code>yyyy-MM-dd'T'HH:mm:ss</code>. For example,
  /// <code>2019-07-01T23:59:59</code>.
  final DateTime createdTime;
  final Goal goal;

  /// The time that this SLO was most recently updated. When used in a raw HTTP
  /// Query API, it is formatted as <code>yyyy-MM-dd'T'HH:mm:ss</code>. For
  /// example, <code>2019-07-01T23:59:59</code>.
  final DateTime lastUpdatedTime;

  /// The name of this SLO.
  final String name;

  /// Indicates whether DevOps Agent will automatically investigate this SLO when
  /// it is breached
  final bool? autoInvestigationEnabled;

  /// Each object in this array defines the length of the look-back window used to
  /// calculate one burn rate metric for this SLO. The burn rate measures how fast
  /// the service is consuming the error budget, relative to the attainment goal
  /// of the SLO.
  final List<BurnRateConfiguration>? burnRateConfigurations;

  /// The description that you created for this SLO.
  final String? description;

  /// Displays whether this is a period-based SLO or a request-based SLO.
  final EvaluationType? evaluationType;

  /// Displays the SLI metric source type for this SLO. Supported types are:
  ///
  /// <ul>
  /// <li>
  /// Service operation
  /// </li>
  /// <li>
  /// Service dependency
  /// </li>
  /// <li>
  /// Service
  /// </li>
  /// <li>
  /// CloudWatch metric
  /// </li>
  /// <li>
  /// AppMonitor
  /// </li>
  /// <li>
  /// Canary
  /// </li>
  /// </ul>
  final MetricSourceType? metricSourceType;

  /// A structure containing information about the performance metric that this
  /// SLO monitors, if this is a request-based SLO.
  final RequestBasedServiceLevelIndicator? requestBasedSli;

  /// A structure containing information about the performance metric that this
  /// SLO monitors, if this is a period-based SLO.
  final ServiceLevelIndicator? sli;

  ServiceLevelObjective({
    required this.arn,
    required this.createdTime,
    required this.goal,
    required this.lastUpdatedTime,
    required this.name,
    this.autoInvestigationEnabled,
    this.burnRateConfigurations,
    this.description,
    this.evaluationType,
    this.metricSourceType,
    this.requestBasedSli,
    this.sli,
  });

  factory ServiceLevelObjective.fromJson(Map<String, dynamic> json) {
    return ServiceLevelObjective(
      arn: (json['Arn'] as String?) ?? '',
      createdTime: nonNullableTimeStampFromJson(json['CreatedTime'] ?? 0),
      goal: Goal.fromJson(
          (json['Goal'] as Map<String, dynamic>?) ?? const <String, dynamic>{}),
      lastUpdatedTime:
          nonNullableTimeStampFromJson(json['LastUpdatedTime'] ?? 0),
      name: (json['Name'] as String?) ?? '',
      autoInvestigationEnabled: json['AutoInvestigationEnabled'] as bool?,
      burnRateConfigurations: (json['BurnRateConfigurations'] as List?)
          ?.nonNulls
          .map((e) => BurnRateConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['Description'] as String?,
      evaluationType:
          (json['EvaluationType'] as String?)?.let(EvaluationType.fromString),
      metricSourceType: (json['MetricSourceType'] as String?)
          ?.let(MetricSourceType.fromString),
      requestBasedSli: json['RequestBasedSli'] != null
          ? RequestBasedServiceLevelIndicator.fromJson(
              json['RequestBasedSli'] as Map<String, dynamic>)
          : null,
      sli: json['Sli'] != null
          ? ServiceLevelIndicator.fromJson(json['Sli'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdTime = this.createdTime;
    final goal = this.goal;
    final lastUpdatedTime = this.lastUpdatedTime;
    final name = this.name;
    final autoInvestigationEnabled = this.autoInvestigationEnabled;
    final burnRateConfigurations = this.burnRateConfigurations;
    final description = this.description;
    final evaluationType = this.evaluationType;
    final metricSourceType = this.metricSourceType;
    final requestBasedSli = this.requestBasedSli;
    final sli = this.sli;
    return {
      'Arn': arn,
      'CreatedTime': unixTimestampToJson(createdTime),
      'Goal': goal,
      'LastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      'Name': name,
      if (autoInvestigationEnabled != null)
        'AutoInvestigationEnabled': autoInvestigationEnabled,
      if (burnRateConfigurations != null)
        'BurnRateConfigurations': burnRateConfigurations,
      if (description != null) 'Description': description,
      if (evaluationType != null) 'EvaluationType': evaluationType.value,
      if (metricSourceType != null) 'MetricSourceType': metricSourceType.value,
      if (requestBasedSli != null) 'RequestBasedSli': requestBasedSli,
      if (sli != null) 'Sli': sli,
    };
  }
}

/// This structure contains information about the performance metric that a
/// period-based SLO monitors.
///
/// @nodoc
class ServiceLevelIndicator {
  /// The arithmetic operation used when comparing the specified metric to the
  /// threshold.
  final ServiceLevelIndicatorComparisonOperator comparisonOperator;

  /// The value that the SLI metric is compared to.
  final double metricThreshold;

  /// A structure that contains information about the metric that the SLO
  /// monitors.
  final ServiceLevelIndicatorMetric sliMetric;

  ServiceLevelIndicator({
    required this.comparisonOperator,
    required this.metricThreshold,
    required this.sliMetric,
  });

  factory ServiceLevelIndicator.fromJson(Map<String, dynamic> json) {
    return ServiceLevelIndicator(
      comparisonOperator: ServiceLevelIndicatorComparisonOperator.fromString(
          (json['ComparisonOperator'] as String?) ?? ''),
      metricThreshold: _s.parseJsonDouble(json['MetricThreshold']) ?? 0,
      sliMetric: ServiceLevelIndicatorMetric.fromJson(
          (json['SliMetric'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final comparisonOperator = this.comparisonOperator;
    final metricThreshold = this.metricThreshold;
    final sliMetric = this.sliMetric;
    return {
      'ComparisonOperator': comparisonOperator.value,
      'MetricThreshold': _s.encodeJsonDouble(metricThreshold),
      'SliMetric': sliMetric,
    };
  }
}

/// This structure contains information about the performance metric that a
/// request-based SLO monitors.
///
/// @nodoc
class RequestBasedServiceLevelIndicator {
  /// A structure that contains information about the metric that the SLO
  /// monitors.
  final RequestBasedServiceLevelIndicatorMetric requestBasedSliMetric;

  /// The arithmetic operation used when comparing the specified metric to the
  /// threshold.
  final ServiceLevelIndicatorComparisonOperator? comparisonOperator;

  /// This value is the threshold that the observed metric values of the SLI
  /// metric are compared to.
  final double? metricThreshold;

  RequestBasedServiceLevelIndicator({
    required this.requestBasedSliMetric,
    this.comparisonOperator,
    this.metricThreshold,
  });

  factory RequestBasedServiceLevelIndicator.fromJson(
      Map<String, dynamic> json) {
    return RequestBasedServiceLevelIndicator(
      requestBasedSliMetric: RequestBasedServiceLevelIndicatorMetric.fromJson(
          (json['RequestBasedSliMetric'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      comparisonOperator: (json['ComparisonOperator'] as String?)
          ?.let(ServiceLevelIndicatorComparisonOperator.fromString),
      metricThreshold: _s.parseJsonDouble(json['MetricThreshold']),
    );
  }

  Map<String, dynamic> toJson() {
    final requestBasedSliMetric = this.requestBasedSliMetric;
    final comparisonOperator = this.comparisonOperator;
    final metricThreshold = this.metricThreshold;
    return {
      'RequestBasedSliMetric': requestBasedSliMetric,
      if (comparisonOperator != null)
        'ComparisonOperator': comparisonOperator.value,
      if (metricThreshold != null)
        'MetricThreshold': _s.encodeJsonDouble(metricThreshold),
    };
  }
}

/// This structure contains the attributes that determine the goal of an SLO.
/// This includes the time period for evaluation and the attainment threshold.
///
/// @nodoc
class Goal {
  /// The threshold that determines if the goal is being met.
  ///
  /// If this is a period-based SLO, the attainment goal is the percentage of good
  /// periods that meet the threshold requirements to the total periods within the
  /// interval. For example, an attainment goal of 99.9% means that within your
  /// interval, you are targeting 99.9% of the periods to be in healthy state.
  ///
  /// If this is a request-based SLO, the attainment goal is the percentage of
  /// requests that must be successful to meet the attainment goal.
  ///
  /// If you omit this parameter, 99 is used to represent 99% as the attainment
  /// goal.
  final double? attainmentGoal;

  /// The time period used to evaluate the SLO. It can be either a calendar
  /// interval or rolling interval.
  ///
  /// If you omit this parameter, a rolling interval of 7 days is used.
  final Interval? interval;

  /// The percentage of remaining budget over total budget that you want to get
  /// warnings for. If you omit this parameter, the default of 50.0 is used.
  final double? warningThreshold;

  Goal({
    this.attainmentGoal,
    this.interval,
    this.warningThreshold,
  });

  factory Goal.fromJson(Map<String, dynamic> json) {
    return Goal(
      attainmentGoal: _s.parseJsonDouble(json['AttainmentGoal']),
      interval: json['Interval'] != null
          ? Interval.fromJson(json['Interval'] as Map<String, dynamic>)
          : null,
      warningThreshold: _s.parseJsonDouble(json['WarningThreshold']),
    );
  }

  Map<String, dynamic> toJson() {
    final attainmentGoal = this.attainmentGoal;
    final interval = this.interval;
    final warningThreshold = this.warningThreshold;
    return {
      if (attainmentGoal != null)
        'AttainmentGoal': _s.encodeJsonDouble(attainmentGoal),
      if (interval != null) 'Interval': interval,
      if (warningThreshold != null)
        'WarningThreshold': _s.encodeJsonDouble(warningThreshold),
    };
  }
}

/// This object defines the length of the look-back window used to calculate one
/// burn rate metric for this SLO. The burn rate measures how fast the service
/// is consuming the error budget, relative to the attainment goal of the SLO. A
/// burn rate of exactly 1 indicates that the SLO goal will be met exactly.
///
/// For example, if you specify 60 as the number of minutes in the look-back
/// window, the burn rate is calculated as the following:
///
/// <i>burn rate = error rate over the look-back window / (100% - attainment
/// goal percentage)</i>
///
/// For more information about burn rates, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-ServiceLevelObjectives.html#CloudWatch-ServiceLevelObjectives-burn">Calculate
/// burn rates</a>.
///
/// @nodoc
class BurnRateConfiguration {
  /// The number of minutes to use as the look-back window.
  final int lookBackWindowMinutes;

  BurnRateConfiguration({
    required this.lookBackWindowMinutes,
  });

  factory BurnRateConfiguration.fromJson(Map<String, dynamic> json) {
    return BurnRateConfiguration(
      lookBackWindowMinutes: (json['LookBackWindowMinutes'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final lookBackWindowMinutes = this.lookBackWindowMinutes;
    return {
      'LookBackWindowMinutes': lookBackWindowMinutes,
    };
  }
}

/// The time period used to evaluate the SLO. It can be either a calendar
/// interval or rolling interval.
///
/// @nodoc
class Interval {
  /// If the interval is a calendar interval, this structure contains the interval
  /// specifications.
  final CalendarInterval? calendarInterval;

  /// If the interval is a rolling interval, this structure contains the interval
  /// specifications.
  final RollingInterval? rollingInterval;

  Interval({
    this.calendarInterval,
    this.rollingInterval,
  });

  factory Interval.fromJson(Map<String, dynamic> json) {
    return Interval(
      calendarInterval: json['CalendarInterval'] != null
          ? CalendarInterval.fromJson(
              json['CalendarInterval'] as Map<String, dynamic>)
          : null,
      rollingInterval: json['RollingInterval'] != null
          ? RollingInterval.fromJson(
              json['RollingInterval'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final calendarInterval = this.calendarInterval;
    final rollingInterval = this.rollingInterval;
    return {
      if (calendarInterval != null) 'CalendarInterval': calendarInterval,
      if (rollingInterval != null) 'RollingInterval': rollingInterval,
    };
  }
}

/// If the interval for this SLO is a rolling interval, this structure contains
/// the interval specifications.
///
/// @nodoc
class RollingInterval {
  /// Specifies the duration of each rolling interval. For example, if
  /// <code>Duration</code> is <code>7</code> and <code>DurationUnit</code> is
  /// <code>DAY</code>, each rolling interval is seven days.
  final int duration;

  /// Specifies the rolling interval unit.
  final DurationUnit durationUnit;

  RollingInterval({
    required this.duration,
    required this.durationUnit,
  });

  factory RollingInterval.fromJson(Map<String, dynamic> json) {
    return RollingInterval(
      duration: (json['Duration'] as int?) ?? 0,
      durationUnit:
          DurationUnit.fromString((json['DurationUnit'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final duration = this.duration;
    final durationUnit = this.durationUnit;
    return {
      'Duration': duration,
      'DurationUnit': durationUnit.value,
    };
  }
}

/// If the interval for this service level objective is a calendar interval,
/// this structure contains the interval specifications.
///
/// @nodoc
class CalendarInterval {
  /// Specifies the duration of each calendar interval. For example, if
  /// <code>Duration</code> is <code>1</code> and <code>DurationUnit</code> is
  /// <code>MONTH</code>, each interval is one month, aligned with the calendar.
  final int duration;

  /// Specifies the calendar interval unit.
  final DurationUnit durationUnit;

  /// The date and time when you want the first interval to start. Be sure to
  /// choose a time that configures the intervals the way that you want. For
  /// example, if you want weekly intervals starting on Mondays at 6 a.m., be sure
  /// to specify a start time that is a Monday at 6 a.m.
  ///
  /// When used in a raw HTTP Query API, it is formatted as be epoch time in
  /// seconds. For example: <code>1698778057</code>
  ///
  /// As soon as one calendar interval ends, another automatically begins.
  final DateTime startTime;

  CalendarInterval({
    required this.duration,
    required this.durationUnit,
    required this.startTime,
  });

  factory CalendarInterval.fromJson(Map<String, dynamic> json) {
    return CalendarInterval(
      duration: (json['Duration'] as int?) ?? 0,
      durationUnit:
          DurationUnit.fromString((json['DurationUnit'] as String?) ?? ''),
      startTime: nonNullableTimeStampFromJson(json['StartTime'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final duration = this.duration;
    final durationUnit = this.durationUnit;
    final startTime = this.startTime;
    return {
      'Duration': duration,
      'DurationUnit': durationUnit.value,
      'StartTime': unixTimestampToJson(startTime),
    };
  }
}

/// @nodoc
class DurationUnit {
  static const minute = DurationUnit._('MINUTE');
  static const hour = DurationUnit._('HOUR');
  static const day = DurationUnit._('DAY');
  static const month = DurationUnit._('MONTH');

  final String value;

  const DurationUnit._(this.value);

  static const values = [minute, hour, day, month];

  static DurationUnit fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => DurationUnit._(value));

  @override
  bool operator ==(other) => other is DurationUnit && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// This structure contains the information about the metric that is used for a
/// request-based SLO.
///
/// @nodoc
class RequestBasedServiceLevelIndicatorMetric {
  /// This structure defines the metric that is used as the "good request" or "bad
  /// request" value for a request-based SLO. This value observed for the metric
  /// defined in <code>TotalRequestCountMetric</code> is divided by the number
  /// found for <code>MonitoredRequestCountMetric</code> to determine the
  /// percentage of successful requests that this SLO tracks.
  final MonitoredRequestCountMetricDataQueries monitoredRequestCountMetric;

  /// This structure defines the metric that is used as the "total requests"
  /// number for a request-based SLO. The number observed for this metric is
  /// divided by the number of "good requests" or "bad requests" that is observed
  /// for the metric defined in <code>MonitoredRequestCountMetric</code>.
  final List<MetricDataQuery> totalRequestCountMetric;

  /// The composite SLI configuration for service-level SLOs that monitor multiple
  /// operations of a service.
  final CompositeSliConfig? compositeSliConfig;

  /// Identifies the dependency using the <code>DependencyKeyAttributes</code> and
  /// <code>DependencyOperationName</code>.
  final DependencyConfig? dependencyConfig;

  /// This is a string-to-string map that contains information about the type of
  /// object that this SLO is related to. It can include the following fields.
  ///
  /// <ul>
  /// <li>
  /// <code>Type</code> designates the type of object that this SLO is related to.
  /// </li>
  /// <li>
  /// <code>ResourceType</code> specifies the type of the resource. This field is
  /// used only when the value of the <code>Type</code> field is
  /// <code>Resource</code> or <code>AWS::Resource</code>.
  /// </li>
  /// <li>
  /// <code>Name</code> specifies the name of the object. This is used only if the
  /// value of the <code>Type</code> field is <code>Service</code>,
  /// <code>RemoteService</code>, or <code>AWS::Service</code>.
  /// </li>
  /// <li>
  /// <code>Identifier</code> identifies the resource objects of this resource.
  /// This is used only if the value of the <code>Type</code> field is
  /// <code>Resource</code> or <code>AWS::Resource</code>.
  /// </li>
  /// <li>
  /// <code>Environment</code> specifies the location where this object is hosted,
  /// or what it belongs to.
  /// </li>
  /// </ul>
  final Map<String, String>? keyAttributes;

  /// Identifies the metric source for SLOs on resources other than Application
  /// Signals services.
  final MetricSource? metricSource;

  /// If the SLO monitors either the <code>LATENCY</code> or
  /// <code>AVAILABILITY</code> metric that Application Signals collects, this
  /// field displays which of those metrics is used.
  final ServiceLevelIndicatorMetricType? metricType;

  /// If the SLO monitors a specific operation of the service, this field displays
  /// that operation name.
  final String? operationName;

  RequestBasedServiceLevelIndicatorMetric({
    required this.monitoredRequestCountMetric,
    required this.totalRequestCountMetric,
    this.compositeSliConfig,
    this.dependencyConfig,
    this.keyAttributes,
    this.metricSource,
    this.metricType,
    this.operationName,
  });

  factory RequestBasedServiceLevelIndicatorMetric.fromJson(
      Map<String, dynamic> json) {
    return RequestBasedServiceLevelIndicatorMetric(
      monitoredRequestCountMetric:
          MonitoredRequestCountMetricDataQueries.fromJson(
              (json['MonitoredRequestCountMetric'] as Map<String, dynamic>?) ??
                  const <String, dynamic>{}),
      totalRequestCountMetric:
          ((json['TotalRequestCountMetric'] as List?) ?? const [])
              .nonNulls
              .map((e) => MetricDataQuery.fromJson(e as Map<String, dynamic>))
              .toList(),
      compositeSliConfig: json['CompositeSliConfig'] != null
          ? CompositeSliConfig.fromJson(
              json['CompositeSliConfig'] as Map<String, dynamic>)
          : null,
      dependencyConfig: json['DependencyConfig'] != null
          ? DependencyConfig.fromJson(
              json['DependencyConfig'] as Map<String, dynamic>)
          : null,
      keyAttributes: (json['KeyAttributes'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      metricSource: json['MetricSource'] != null
          ? MetricSource.fromJson(json['MetricSource'] as Map<String, dynamic>)
          : null,
      metricType: (json['MetricType'] as String?)
          ?.let(ServiceLevelIndicatorMetricType.fromString),
      operationName: json['OperationName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final monitoredRequestCountMetric = this.monitoredRequestCountMetric;
    final totalRequestCountMetric = this.totalRequestCountMetric;
    final compositeSliConfig = this.compositeSliConfig;
    final dependencyConfig = this.dependencyConfig;
    final keyAttributes = this.keyAttributes;
    final metricSource = this.metricSource;
    final metricType = this.metricType;
    final operationName = this.operationName;
    return {
      'MonitoredRequestCountMetric': monitoredRequestCountMetric,
      'TotalRequestCountMetric': totalRequestCountMetric,
      if (compositeSliConfig != null) 'CompositeSliConfig': compositeSliConfig,
      if (dependencyConfig != null) 'DependencyConfig': dependencyConfig,
      if (keyAttributes != null) 'KeyAttributes': keyAttributes,
      if (metricSource != null) 'MetricSource': metricSource,
      if (metricType != null) 'MetricType': metricType.value,
      if (operationName != null) 'OperationName': operationName,
    };
  }
}

/// @nodoc
class ServiceLevelIndicatorComparisonOperator {
  static const greaterThanOrEqualTo =
      ServiceLevelIndicatorComparisonOperator._('GreaterThanOrEqualTo');
  static const greaterThan =
      ServiceLevelIndicatorComparisonOperator._('GreaterThan');
  static const lessThan = ServiceLevelIndicatorComparisonOperator._('LessThan');
  static const lessThanOrEqualTo =
      ServiceLevelIndicatorComparisonOperator._('LessThanOrEqualTo');

  final String value;

  const ServiceLevelIndicatorComparisonOperator._(this.value);

  static const values = [
    greaterThanOrEqualTo,
    greaterThan,
    lessThan,
    lessThanOrEqualTo
  ];

  static ServiceLevelIndicatorComparisonOperator fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ServiceLevelIndicatorComparisonOperator._(value));

  @override
  bool operator ==(other) =>
      other is ServiceLevelIndicatorComparisonOperator && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ServiceLevelIndicatorMetricType {
  static const latency = ServiceLevelIndicatorMetricType._('LATENCY');
  static const availability = ServiceLevelIndicatorMetricType._('AVAILABILITY');

  final String value;

  const ServiceLevelIndicatorMetricType._(this.value);

  static const values = [latency, availability];

  static ServiceLevelIndicatorMetricType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ServiceLevelIndicatorMetricType._(value));

  @override
  bool operator ==(other) =>
      other is ServiceLevelIndicatorMetricType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// This structure defines the metric that is used as the "good request" or "bad
/// request" value for a request-based SLO. This value observed for the metric
/// defined in <code>TotalRequestCountMetric</code> is divided by the number
/// found for <code>MonitoredRequestCountMetric</code> to determine the
/// percentage of successful requests that this SLO tracks.
///
/// @nodoc
class MonitoredRequestCountMetricDataQueries {
  /// If you want to count "bad requests" to determine the percentage of
  /// successful requests for this request-based SLO, specify the metric to use as
  /// "bad requests" in this structure.
  final List<MetricDataQuery>? badCountMetric;

  /// If you want to count "good requests" to determine the percentage of
  /// successful requests for this request-based SLO, specify the metric to use as
  /// "good requests" in this structure.
  final List<MetricDataQuery>? goodCountMetric;

  MonitoredRequestCountMetricDataQueries({
    this.badCountMetric,
    this.goodCountMetric,
  });

  factory MonitoredRequestCountMetricDataQueries.fromJson(
      Map<String, dynamic> json) {
    return MonitoredRequestCountMetricDataQueries(
      badCountMetric: (json['BadCountMetric'] as List?)
          ?.nonNulls
          .map((e) => MetricDataQuery.fromJson(e as Map<String, dynamic>))
          .toList(),
      goodCountMetric: (json['GoodCountMetric'] as List?)
          ?.nonNulls
          .map((e) => MetricDataQuery.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final badCountMetric = this.badCountMetric;
    final goodCountMetric = this.goodCountMetric;
    return {
      if (badCountMetric != null) 'BadCountMetric': badCountMetric,
      if (goodCountMetric != null) 'GoodCountMetric': goodCountMetric,
    };
  }
}

/// Use this structure to define a metric or metric math expression that you
/// want to use as for a service level objective.
///
/// Each <code>MetricDataQuery</code> in the <code>MetricDataQueries</code>
/// array specifies either a metric to retrieve, or a metric math expression to
/// be performed on retrieved metrics. A single <code>MetricDataQueries</code>
/// array can include as many as 20 <code>MetricDataQuery</code> structures in
/// the array. The 20 structures can include as many as 10 structures that
/// contain a <code>MetricStat</code> parameter to retrieve a metric, and as
/// many as 10 structures that contain the <code>Expression</code> parameter to
/// perform a math expression. Of those <code>Expression</code> structures,
/// exactly one must have true as the value for <code>ReturnData</code>. The
/// result of this expression used for the SLO.
///
/// For more information about metric math expressions, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/using-metric-math.html">CloudWatchUse
/// metric math</a>.
///
/// Within each <code>MetricDataQuery</code> object, you must specify either
/// <code>Expression</code> or <code>MetricStat</code> but not both.
///
/// @nodoc
class MetricDataQuery {
  /// A short name used to tie this object to the results in the response. This
  /// <code>Id</code> must be unique within a <code>MetricDataQueries</code>
  /// array. If you are performing math expressions on this set of data, this name
  /// represents that data and can serve as a variable in the metric math
  /// expression. The valid characters are letters, numbers, and underscore. The
  /// first character must be a lowercase letter.
  final String id;

  /// The ID of the account where this metric is located. If you are performing
  /// this operation in a monitoring account, use this to specify which source
  /// account to retrieve this metric from.
  final String? accountId;

  /// This field can contain a metric math expression to be performed on the other
  /// metrics that you are retrieving within this <code>MetricDataQueries</code>
  /// structure.
  ///
  /// A math expression can use the <code>Id</code> of the other metrics or
  /// queries to refer to those metrics, and can also use the <code>Id</code> of
  /// other expressions to use the result of those expressions. For more
  /// information about metric math expressions, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/using-metric-math.html#metric-math-syntax">Metric
  /// Math Syntax and Functions</a> in the <i>Amazon CloudWatch User Guide</i>.
  ///
  /// Within each <code>MetricDataQuery</code> object, you must specify either
  /// <code>Expression</code> or <code>MetricStat</code> but not both.
  final String? expression;

  /// A human-readable label for this metric or expression. This is especially
  /// useful if this is an expression, so that you know what the value represents.
  /// If the metric or expression is shown in a CloudWatch dashboard widget, the
  /// label is shown. If <code>Label</code> is omitted, CloudWatch generates a
  /// default.
  ///
  /// You can put dynamic expressions into a label, so that it is more
  /// descriptive. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/graph-dynamic-labels.html">Using
  /// Dynamic Labels</a>.
  final String? label;

  /// A metric to be used directly for the SLO, or to be used in the math
  /// expression that will be used for the SLO.
  ///
  /// Within one <code>MetricDataQuery</code> object, you must specify either
  /// <code>Expression</code> or <code>MetricStat</code> but not both.
  final MetricStat? metricStat;

  /// The granularity, in seconds, of the returned data points for this metric.
  /// For metrics with regular resolution, a period can be as short as one minute
  /// (60 seconds) and must be a multiple of 60. For high-resolution metrics that
  /// are collected at intervals of less than one minute, the period can be 1, 5,
  /// 10, 30, 60, or any multiple of 60. High-resolution metrics are those metrics
  /// stored by a <code>PutMetricData</code> call that includes a
  /// <code>StorageResolution</code> of 1 second.
  ///
  /// If the <code>StartTime</code> parameter specifies a time stamp that is
  /// greater than 3 hours ago, you must specify the period as follows or no data
  /// points in that time range is returned:
  ///
  /// <ul>
  /// <li>
  /// Start time between 3 hours and 15 days ago - Use a multiple of 60 seconds (1
  /// minute).
  /// </li>
  /// <li>
  /// Start time between 15 and 63 days ago - Use a multiple of 300 seconds (5
  /// minutes).
  /// </li>
  /// <li>
  /// Start time greater than 63 days ago - Use a multiple of 3600 seconds (1
  /// hour).
  /// </li>
  /// </ul>
  final int? period;

  /// Use this only if you are using a metric math expression for the SLO. Specify
  /// <code>true</code> for <code>ReturnData</code> for only the one expression
  /// result to use as the alarm. For all other metrics and expressions in the
  /// same <code>CreateServiceLevelObjective</code> operation, specify
  /// <code>ReturnData</code> as <code>false</code>.
  final bool? returnData;

  MetricDataQuery({
    required this.id,
    this.accountId,
    this.expression,
    this.label,
    this.metricStat,
    this.period,
    this.returnData,
  });

  factory MetricDataQuery.fromJson(Map<String, dynamic> json) {
    return MetricDataQuery(
      id: (json['Id'] as String?) ?? '',
      accountId: json['AccountId'] as String?,
      expression: json['Expression'] as String?,
      label: json['Label'] as String?,
      metricStat: json['MetricStat'] != null
          ? MetricStat.fromJson(json['MetricStat'] as Map<String, dynamic>)
          : null,
      period: json['Period'] as int?,
      returnData: json['ReturnData'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final accountId = this.accountId;
    final expression = this.expression;
    final label = this.label;
    final metricStat = this.metricStat;
    final period = this.period;
    final returnData = this.returnData;
    return {
      'Id': id,
      if (accountId != null) 'AccountId': accountId,
      if (expression != null) 'Expression': expression,
      if (label != null) 'Label': label,
      if (metricStat != null) 'MetricStat': metricStat,
      if (period != null) 'Period': period,
      if (returnData != null) 'ReturnData': returnData,
    };
  }
}

/// This structure defines the metric to be used as the service level indicator,
/// along with the statistics, period, and unit.
///
/// @nodoc
class MetricStat {
  /// The metric to use as the service level indicator, including the metric name,
  /// namespace, and dimensions.
  final Metric metric;

  /// The granularity, in seconds, to be used for the metric. For metrics with
  /// regular resolution, a period can be as short as one minute (60 seconds) and
  /// must be a multiple of 60. For high-resolution metrics that are collected at
  /// intervals of less than one minute, the period can be 1, 5, 10, 30, 60, or
  /// any multiple of 60. High-resolution metrics are those metrics stored by a
  /// <code>PutMetricData</code> call that includes a
  /// <code>StorageResolution</code> of 1 second.
  final int period;

  /// The statistic to use for comparison to the threshold. It can be any
  /// CloudWatch statistic or extended statistic. For more information about
  /// statistics, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Statistics-definitions.html">CloudWatch
  /// statistics definitions</a>.
  final String stat;

  /// If you omit <code>Unit</code> then all data that was collected with any unit
  /// is returned, along with the corresponding units that were specified when the
  /// data was reported to CloudWatch. If you specify a unit, the operation
  /// returns only data that was collected with that unit specified. If you
  /// specify a unit that does not match the data collected, the results of the
  /// operation are null. CloudWatch does not perform unit conversions.
  final StandardUnit? unit;

  MetricStat({
    required this.metric,
    required this.period,
    required this.stat,
    this.unit,
  });

  factory MetricStat.fromJson(Map<String, dynamic> json) {
    return MetricStat(
      metric: Metric.fromJson((json['Metric'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
      period: (json['Period'] as int?) ?? 0,
      stat: (json['Stat'] as String?) ?? '',
      unit: (json['Unit'] as String?)?.let(StandardUnit.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final metric = this.metric;
    final period = this.period;
    final stat = this.stat;
    final unit = this.unit;
    return {
      'Metric': metric,
      'Period': period,
      'Stat': stat,
      if (unit != null) 'Unit': unit.value,
    };
  }
}

/// This structure defines the metric used for a service level indicator,
/// including the metric name, namespace, and dimensions
///
/// @nodoc
class Metric {
  /// An array of one or more dimensions to use to define the metric that you want
  /// to use. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch_concepts.html#Dimension">Dimensions</a>.
  final List<Dimension>? dimensions;

  /// The name of the metric to use.
  final String? metricName;

  /// The namespace of the metric. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch_concepts.html#Namespace">Namespaces</a>.
  final String? namespace;

  Metric({
    this.dimensions,
    this.metricName,
    this.namespace,
  });

  factory Metric.fromJson(Map<String, dynamic> json) {
    return Metric(
      dimensions: (json['Dimensions'] as List?)
          ?.nonNulls
          .map((e) => Dimension.fromJson(e as Map<String, dynamic>))
          .toList(),
      metricName: json['MetricName'] as String?,
      namespace: json['Namespace'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dimensions = this.dimensions;
    final metricName = this.metricName;
    final namespace = this.namespace;
    return {
      if (dimensions != null) 'Dimensions': dimensions,
      if (metricName != null) 'MetricName': metricName,
      if (namespace != null) 'Namespace': namespace,
    };
  }
}

/// @nodoc
class StandardUnit {
  static const microseconds = StandardUnit._('Microseconds');
  static const milliseconds = StandardUnit._('Milliseconds');
  static const seconds = StandardUnit._('Seconds');
  static const bytes = StandardUnit._('Bytes');
  static const kilobytes = StandardUnit._('Kilobytes');
  static const megabytes = StandardUnit._('Megabytes');
  static const gigabytes = StandardUnit._('Gigabytes');
  static const terabytes = StandardUnit._('Terabytes');
  static const bits = StandardUnit._('Bits');
  static const kilobits = StandardUnit._('Kilobits');
  static const megabits = StandardUnit._('Megabits');
  static const gigabits = StandardUnit._('Gigabits');
  static const terabits = StandardUnit._('Terabits');
  static const percent = StandardUnit._('Percent');
  static const count = StandardUnit._('Count');
  static const bytesSecond = StandardUnit._('Bytes/Second');
  static const kilobytesSecond = StandardUnit._('Kilobytes/Second');
  static const megabytesSecond = StandardUnit._('Megabytes/Second');
  static const gigabytesSecond = StandardUnit._('Gigabytes/Second');
  static const terabytesSecond = StandardUnit._('Terabytes/Second');
  static const bitsSecond = StandardUnit._('Bits/Second');
  static const kilobitsSecond = StandardUnit._('Kilobits/Second');
  static const megabitsSecond = StandardUnit._('Megabits/Second');
  static const gigabitsSecond = StandardUnit._('Gigabits/Second');
  static const terabitsSecond = StandardUnit._('Terabits/Second');
  static const countSecond = StandardUnit._('Count/Second');
  static const none = StandardUnit._('None');

  final String value;

  const StandardUnit._(this.value);

  static const values = [
    microseconds,
    milliseconds,
    seconds,
    bytes,
    kilobytes,
    megabytes,
    gigabytes,
    terabytes,
    bits,
    kilobits,
    megabits,
    gigabits,
    terabits,
    percent,
    count,
    bytesSecond,
    kilobytesSecond,
    megabytesSecond,
    gigabytesSecond,
    terabytesSecond,
    bitsSecond,
    kilobitsSecond,
    megabitsSecond,
    gigabitsSecond,
    terabitsSecond,
    countSecond,
    none
  ];

  static StandardUnit fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => StandardUnit._(value));

  @override
  bool operator ==(other) => other is StandardUnit && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A dimension is a name/value pair that is part of the identity of a metric.
/// Because dimensions are part of the unique identifier for a metric, whenever
/// you add a unique name/value pair to one of your metrics, you are creating a
/// new variation of that metric. For example, many Amazon EC2 metrics publish
/// <code>InstanceId</code> as a dimension name, and the actual instance ID as
/// the value for that dimension.
///
/// You can assign up to 30 dimensions to a metric.
///
/// @nodoc
class Dimension {
  /// The name of the dimension. Dimension names must contain only ASCII
  /// characters, must include at least one non-whitespace character, and cannot
  /// start with a colon (<code>:</code>). ASCII control characters are not
  /// supported as part of dimension names.
  final String name;

  /// The value of the dimension. Dimension values must contain only ASCII
  /// characters and must include at least one non-whitespace character. ASCII
  /// control characters are not supported as part of dimension values.
  final String value;

  Dimension({
    required this.name,
    required this.value,
  });

  factory Dimension.fromJson(Map<String, dynamic> json) {
    return Dimension(
      name: (json['Name'] as String?) ?? '',
      value: (json['Value'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      'Name': name,
      'Value': value,
    };
  }
}

/// This structure contains the information about the metric that is used for a
/// period-based SLO.
///
/// @nodoc
class ServiceLevelIndicatorMetric {
  /// If this SLO monitors a CloudWatch metric or the result of a CloudWatch
  /// metric math expression, this structure includes the information about that
  /// metric or expression.
  final List<MetricDataQuery> metricDataQueries;

  /// The composite SLI configuration for service-level SLOs that monitor multiple
  /// operations of a service.
  final CompositeSliConfig? compositeSliConfig;

  /// Identifies the dependency using the <code>DependencyKeyAttributes</code> and
  /// <code>DependencyOperationName</code>.
  final DependencyConfig? dependencyConfig;

  /// This is a string-to-string map that contains information about the type of
  /// object that this SLO is related to. It can include the following fields.
  ///
  /// <ul>
  /// <li>
  /// <code>Type</code> designates the type of object that this SLO is related to.
  /// </li>
  /// <li>
  /// <code>ResourceType</code> specifies the type of the resource. This field is
  /// used only when the value of the <code>Type</code> field is
  /// <code>Resource</code> or <code>AWS::Resource</code>.
  /// </li>
  /// <li>
  /// <code>Name</code> specifies the name of the object. This is used only if the
  /// value of the <code>Type</code> field is <code>Service</code>,
  /// <code>RemoteService</code>, or <code>AWS::Service</code>.
  /// </li>
  /// <li>
  /// <code>Identifier</code> identifies the resource objects of this resource.
  /// This is used only if the value of the <code>Type</code> field is
  /// <code>Resource</code> or <code>AWS::Resource</code>.
  /// </li>
  /// <li>
  /// <code>Environment</code> specifies the location where this object is hosted,
  /// or what it belongs to.
  /// </li>
  /// </ul>
  final Map<String, String>? keyAttributes;

  /// Identifies the metric source for SLOs on resources other than Application
  /// Signals services.
  final MetricSource? metricSource;

  /// If the SLO monitors either the <code>LATENCY</code> or
  /// <code>AVAILABILITY</code> metric that Application Signals collects, this
  /// field displays which of those metrics is used.
  final ServiceLevelIndicatorMetricType? metricType;

  /// If the SLO monitors a specific operation of the service, this field displays
  /// that operation name.
  final String? operationName;

  ServiceLevelIndicatorMetric({
    required this.metricDataQueries,
    this.compositeSliConfig,
    this.dependencyConfig,
    this.keyAttributes,
    this.metricSource,
    this.metricType,
    this.operationName,
  });

  factory ServiceLevelIndicatorMetric.fromJson(Map<String, dynamic> json) {
    return ServiceLevelIndicatorMetric(
      metricDataQueries: ((json['MetricDataQueries'] as List?) ?? const [])
          .nonNulls
          .map((e) => MetricDataQuery.fromJson(e as Map<String, dynamic>))
          .toList(),
      compositeSliConfig: json['CompositeSliConfig'] != null
          ? CompositeSliConfig.fromJson(
              json['CompositeSliConfig'] as Map<String, dynamic>)
          : null,
      dependencyConfig: json['DependencyConfig'] != null
          ? DependencyConfig.fromJson(
              json['DependencyConfig'] as Map<String, dynamic>)
          : null,
      keyAttributes: (json['KeyAttributes'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      metricSource: json['MetricSource'] != null
          ? MetricSource.fromJson(json['MetricSource'] as Map<String, dynamic>)
          : null,
      metricType: (json['MetricType'] as String?)
          ?.let(ServiceLevelIndicatorMetricType.fromString),
      operationName: json['OperationName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final metricDataQueries = this.metricDataQueries;
    final compositeSliConfig = this.compositeSliConfig;
    final dependencyConfig = this.dependencyConfig;
    final keyAttributes = this.keyAttributes;
    final metricSource = this.metricSource;
    final metricType = this.metricType;
    final operationName = this.operationName;
    return {
      'MetricDataQueries': metricDataQueries,
      if (compositeSliConfig != null) 'CompositeSliConfig': compositeSliConfig,
      if (dependencyConfig != null) 'DependencyConfig': dependencyConfig,
      if (keyAttributes != null) 'KeyAttributes': keyAttributes,
      if (metricSource != null) 'MetricSource': metricSource,
      if (metricType != null) 'MetricType': metricType.value,
      if (operationName != null) 'OperationName': operationName,
    };
  }
}

/// This structure specifies the information about the service and the
/// performance metric that a period-based SLO is to monitor.
///
/// @nodoc
class ServiceLevelIndicatorConfig {
  /// Use this structure to specify the metric to be used for the SLO.
  final ServiceLevelIndicatorMetricConfig sliMetricConfig;

  /// The arithmetic operation to use when comparing the specified metric to the
  /// threshold.
  ///
  /// This is not required if <code>CreateRecommendedSlo</code> is set to
  /// <code>true</code>.
  final ServiceLevelIndicatorComparisonOperator? comparisonOperator;

  /// This parameter is used only when a request-based SLO tracks the
  /// <code>Latency</code> metric. Specify the threshold value that the observed
  /// <code>Latency</code> metric values are to be compared to.
  ///
  /// This is not required if <code>CreateRecommendedSlo</code> is set to
  /// <code>true</code>.
  final double? metricThreshold;

  ServiceLevelIndicatorConfig({
    required this.sliMetricConfig,
    this.comparisonOperator,
    this.metricThreshold,
  });

  Map<String, dynamic> toJson() {
    final sliMetricConfig = this.sliMetricConfig;
    final comparisonOperator = this.comparisonOperator;
    final metricThreshold = this.metricThreshold;
    return {
      'SliMetricConfig': sliMetricConfig,
      if (comparisonOperator != null)
        'ComparisonOperator': comparisonOperator.value,
      if (metricThreshold != null)
        'MetricThreshold': _s.encodeJsonDouble(metricThreshold),
    };
  }
}

/// This structure specifies the information about the service and the
/// performance metric that a request-based SLO is to monitor.
///
/// @nodoc
class RequestBasedServiceLevelIndicatorConfig {
  /// Use this structure to specify the metric to be used for the SLO.
  final RequestBasedServiceLevelIndicatorMetricConfig
      requestBasedSliMetricConfig;

  /// The arithmetic operation to use when comparing the specified metric to the
  /// threshold. This parameter is required if this SLO is tracking the
  /// <code>Latency</code> metric.
  final ServiceLevelIndicatorComparisonOperator? comparisonOperator;

  /// The value that the SLI metric is compared to. This parameter is required if
  /// this SLO is tracking the <code>Latency</code> metric.
  final double? metricThreshold;

  RequestBasedServiceLevelIndicatorConfig({
    required this.requestBasedSliMetricConfig,
    this.comparisonOperator,
    this.metricThreshold,
  });

  Map<String, dynamic> toJson() {
    final requestBasedSliMetricConfig = this.requestBasedSliMetricConfig;
    final comparisonOperator = this.comparisonOperator;
    final metricThreshold = this.metricThreshold;
    return {
      'RequestBasedSliMetricConfig': requestBasedSliMetricConfig,
      if (comparisonOperator != null)
        'ComparisonOperator': comparisonOperator.value,
      if (metricThreshold != null)
        'MetricThreshold': _s.encodeJsonDouble(metricThreshold),
    };
  }
}

/// Use this structure to specify the information for the metric that a
/// period-based SLO will monitor.
///
/// @nodoc
class RequestBasedServiceLevelIndicatorMetricConfig {
  /// The composite SLI configuration for service-level SLOs that monitor multiple
  /// operations of a service.
  final CompositeSliConfig? compositeSliConfig;

  /// Identifies the dependency using the <code>DependencyKeyAttributes</code> and
  /// <code>DependencyOperationName</code>.
  final DependencyConfig? dependencyConfig;

  /// If this SLO is related to a metric collected by Application Signals, you
  /// must use this field to specify which service the SLO metric is related to.
  /// To do so, you must specify at least the <code>Type</code>,
  /// <code>Name</code>, and <code>Environment</code> attributes.
  ///
  /// This is a string-to-string map. It can include the following fields.
  ///
  /// <ul>
  /// <li>
  /// <code>Type</code> designates the type of object this is.
  /// </li>
  /// <li>
  /// <code>ResourceType</code> specifies the type of the resource. This field is
  /// used only when the value of the <code>Type</code> field is
  /// <code>Resource</code> or <code>AWS::Resource</code>.
  /// </li>
  /// <li>
  /// <code>Name</code> specifies the name of the object. This is used only if the
  /// value of the <code>Type</code> field is <code>Service</code>,
  /// <code>RemoteService</code>, or <code>AWS::Service</code>.
  /// </li>
  /// <li>
  /// <code>Identifier</code> identifies the resource objects of this resource.
  /// This is used only if the value of the <code>Type</code> field is
  /// <code>Resource</code> or <code>AWS::Resource</code>.
  /// </li>
  /// <li>
  /// <code>Environment</code> specifies the location where this object is hosted,
  /// or what it belongs to.
  /// </li>
  /// </ul>
  final Map<String, String>? keyAttributes;

  /// The name of the metric for SLOs on resources other than Application Signals
  /// services.
  final String? metricName;

  /// Identifies the metric source for SLOs on resources other than Application
  /// Signals services.
  final MetricSource? metricSource;

  /// If the SLO is to monitor either the <code>LATENCY</code> or
  /// <code>AVAILABILITY</code> metric that Application Signals collects, use this
  /// field to specify which of those metrics is used.
  final ServiceLevelIndicatorMetricType? metricType;

  /// Use this structure to define the metric that you want to use as the "good
  /// request" or "bad request" value for a request-based SLO. This value observed
  /// for the metric defined in <code>TotalRequestCountMetric</code> will be
  /// divided by the number found for <code>MonitoredRequestCountMetric</code> to
  /// determine the percentage of successful requests that this SLO tracks.
  final MonitoredRequestCountMetricDataQueries? monitoredRequestCountMetric;

  /// If the SLO is to monitor a specific operation of the service, use this field
  /// to specify the name of that operation.
  final String? operationName;

  /// Use this structure to define the metric that you want to use as the "total
  /// requests" number for a request-based SLO. This result will be divided by the
  /// "good request" or "bad request" value defined in
  /// <code>MonitoredRequestCountMetric</code>.
  final List<MetricDataQuery>? totalRequestCountMetric;

  RequestBasedServiceLevelIndicatorMetricConfig({
    this.compositeSliConfig,
    this.dependencyConfig,
    this.keyAttributes,
    this.metricName,
    this.metricSource,
    this.metricType,
    this.monitoredRequestCountMetric,
    this.operationName,
    this.totalRequestCountMetric,
  });

  Map<String, dynamic> toJson() {
    final compositeSliConfig = this.compositeSliConfig;
    final dependencyConfig = this.dependencyConfig;
    final keyAttributes = this.keyAttributes;
    final metricName = this.metricName;
    final metricSource = this.metricSource;
    final metricType = this.metricType;
    final monitoredRequestCountMetric = this.monitoredRequestCountMetric;
    final operationName = this.operationName;
    final totalRequestCountMetric = this.totalRequestCountMetric;
    return {
      if (compositeSliConfig != null) 'CompositeSliConfig': compositeSliConfig,
      if (dependencyConfig != null) 'DependencyConfig': dependencyConfig,
      if (keyAttributes != null) 'KeyAttributes': keyAttributes,
      if (metricName != null) 'MetricName': metricName,
      if (metricSource != null) 'MetricSource': metricSource,
      if (metricType != null) 'MetricType': metricType.value,
      if (monitoredRequestCountMetric != null)
        'MonitoredRequestCountMetric': monitoredRequestCountMetric,
      if (operationName != null) 'OperationName': operationName,
      if (totalRequestCountMetric != null)
        'TotalRequestCountMetric': totalRequestCountMetric,
    };
  }
}

/// Use this structure to specify the information for the metric that a
/// period-based SLO will monitor.
///
/// @nodoc
class ServiceLevelIndicatorMetricConfig {
  /// The composite SLI configuration for service-level SLOs that monitor multiple
  /// operations of a service.
  final CompositeSliConfig? compositeSliConfig;

  /// Identifies the dependency using the <code>DependencyKeyAttributes</code> and
  /// <code>DependencyOperationName</code>.
  final DependencyConfig? dependencyConfig;

  /// If this SLO is related to a metric collected by Application Signals, you
  /// must use this field to specify which service the SLO metric is related to.
  /// To do so, you must specify at least the <code>Type</code>,
  /// <code>Name</code>, and <code>Environment</code> attributes.
  ///
  /// This is a string-to-string map. It can include the following fields.
  ///
  /// <ul>
  /// <li>
  /// <code>Type</code> designates the type of object this is.
  /// </li>
  /// <li>
  /// <code>ResourceType</code> specifies the type of the resource. This field is
  /// used only when the value of the <code>Type</code> field is
  /// <code>Resource</code> or <code>AWS::Resource</code>.
  /// </li>
  /// <li>
  /// <code>Name</code> specifies the name of the object. This is used only if the
  /// value of the <code>Type</code> field is <code>Service</code>,
  /// <code>RemoteService</code>, or <code>AWS::Service</code>.
  /// </li>
  /// <li>
  /// <code>Identifier</code> identifies the resource objects of this resource.
  /// This is used only if the value of the <code>Type</code> field is
  /// <code>Resource</code> or <code>AWS::Resource</code>.
  /// </li>
  /// <li>
  /// <code>Environment</code> specifies the location where this object is hosted,
  /// or what it belongs to.
  /// </li>
  /// </ul>
  final Map<String, String>? keyAttributes;

  /// If this SLO monitors a CloudWatch metric or the result of a CloudWatch
  /// metric math expression, use this structure to specify that metric or
  /// expression.
  final List<MetricDataQuery>? metricDataQueries;

  /// The name of the CloudWatch metric to use for the SLO, when using a custom
  /// metric rather than Application Signals standard metrics.
  final String? metricName;

  /// Identifies the metric source for SLOs on resources other than Application
  /// Signals services.
  final MetricSource? metricSource;

  /// If the SLO is to monitor either the <code>LATENCY</code> or
  /// <code>AVAILABILITY</code> metric that Application Signals collects, use this
  /// field to specify which of those metrics is used.
  final ServiceLevelIndicatorMetricType? metricType;

  /// If the SLO is to monitor a specific operation of the service, use this field
  /// to specify the name of that operation.
  final String? operationName;

  /// The number of seconds to use as the period for SLO evaluation. Your
  /// application's performance is compared to the SLI during each period. For
  /// each period, the application is determined to have either achieved or not
  /// achieved the necessary performance.
  final int? periodSeconds;

  /// The statistic to use for comparison to the threshold. It can be any
  /// CloudWatch statistic or extended statistic. For more information about
  /// statistics, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Statistics-definitions.html">CloudWatch
  /// statistics definitions</a>.
  final String? statistic;

  ServiceLevelIndicatorMetricConfig({
    this.compositeSliConfig,
    this.dependencyConfig,
    this.keyAttributes,
    this.metricDataQueries,
    this.metricName,
    this.metricSource,
    this.metricType,
    this.operationName,
    this.periodSeconds,
    this.statistic,
  });

  Map<String, dynamic> toJson() {
    final compositeSliConfig = this.compositeSliConfig;
    final dependencyConfig = this.dependencyConfig;
    final keyAttributes = this.keyAttributes;
    final metricDataQueries = this.metricDataQueries;
    final metricName = this.metricName;
    final metricSource = this.metricSource;
    final metricType = this.metricType;
    final operationName = this.operationName;
    final periodSeconds = this.periodSeconds;
    final statistic = this.statistic;
    return {
      if (compositeSliConfig != null) 'CompositeSliConfig': compositeSliConfig,
      if (dependencyConfig != null) 'DependencyConfig': dependencyConfig,
      if (keyAttributes != null) 'KeyAttributes': keyAttributes,
      if (metricDataQueries != null) 'MetricDataQueries': metricDataQueries,
      if (metricName != null) 'MetricName': metricName,
      if (metricSource != null) 'MetricSource': metricSource,
      if (metricType != null) 'MetricType': metricType.value,
      if (operationName != null) 'OperationName': operationName,
      if (periodSeconds != null) 'PeriodSeconds': periodSeconds,
      if (statistic != null) 'Statistic': statistic,
    };
  }
}

/// A key-value pair associated with a resource. Tags can help you organize and
/// categorize your resources.
///
/// @nodoc
class Tag {
  /// A string that you can use to assign a value. The combination of tag keys and
  /// values can help you organize and categorize your resources.
  final String key;

  /// The value for the specified tag key.
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

/// A structure that contains the complete grouping configuration for an
/// account, including all defined grouping attributes and metadata about when
/// it was last updated.
///
/// @nodoc
class GroupingConfiguration {
  /// An array of grouping attribute definitions that specify how services should
  /// be grouped based on various attributes and source keys.
  final List<GroupingAttributeDefinition> groupingAttributeDefinitions;

  /// The timestamp when this grouping configuration was last updated. When used
  /// in a raw HTTP Query API, it is formatted as epoch time in seconds.
  final DateTime updatedAt;

  GroupingConfiguration({
    required this.groupingAttributeDefinitions,
    required this.updatedAt,
  });

  factory GroupingConfiguration.fromJson(Map<String, dynamic> json) {
    return GroupingConfiguration(
      groupingAttributeDefinitions: ((json['GroupingAttributeDefinitions']
                  as List?) ??
              const [])
          .nonNulls
          .map((e) =>
              GroupingAttributeDefinition.fromJson(e as Map<String, dynamic>))
          .toList(),
      updatedAt: nonNullableTimeStampFromJson(json['UpdatedAt'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final groupingAttributeDefinitions = this.groupingAttributeDefinitions;
    final updatedAt = this.updatedAt;
    return {
      'GroupingAttributeDefinitions': groupingAttributeDefinitions,
      'UpdatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// A structure that defines how services should be grouped based on specific
/// attributes. This includes the friendly name for the grouping, the source
/// keys to derive values from, and an optional default value.
///
/// @nodoc
class GroupingAttributeDefinition {
  /// The friendly name for this grouping attribute, such as
  /// <code>BusinessUnit</code> or <code>Environment</code>. This name is used to
  /// identify the grouping in the console and APIs.
  final String groupingName;

  /// The default value to use for this grouping attribute when no value can be
  /// derived from the source keys. This ensures all services have a grouping
  /// value even if the source data is missing.
  final String? defaultGroupingValue;

  /// An array of source keys used to derive the grouping attribute value from
  /// telemetry data, Amazon Web Services tags, or other sources. For example,
  /// \["business_unit", "team"\] would look for values in those fields.
  final List<String>? groupingSourceKeys;

  GroupingAttributeDefinition({
    required this.groupingName,
    this.defaultGroupingValue,
    this.groupingSourceKeys,
  });

  factory GroupingAttributeDefinition.fromJson(Map<String, dynamic> json) {
    return GroupingAttributeDefinition(
      groupingName: (json['GroupingName'] as String?) ?? '',
      defaultGroupingValue: json['DefaultGroupingValue'] as String?,
      groupingSourceKeys: (json['GroupingSourceKeys'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final groupingName = this.groupingName;
    final defaultGroupingValue = this.defaultGroupingValue;
    final groupingSourceKeys = this.groupingSourceKeys;
    return {
      'GroupingName': groupingName,
      if (defaultGroupingValue != null)
        'DefaultGroupingValue': defaultGroupingValue,
      if (groupingSourceKeys != null) 'GroupingSourceKeys': groupingSourceKeys,
    };
  }
}

/// A structure that contains information about the current state of a service,
/// including its latest change events such as deployments and other
/// state-changing activities.
///
/// @nodoc
class ServiceState {
  /// An array containing the most recent change events for this service, such as
  /// deployments, with information about when they occurred and who initiated
  /// them.
  final List<ChangeEvent> latestChangeEvents;

  /// The key attributes that identify this service, including Type, Name, and
  /// Environment information.
  final Map<String, String> service;

  /// The attribute filters that were applied when retrieving this service state
  /// information.
  final List<AttributeFilter>? attributeFilters;

  ServiceState({
    required this.latestChangeEvents,
    required this.service,
    this.attributeFilters,
  });

  factory ServiceState.fromJson(Map<String, dynamic> json) {
    return ServiceState(
      latestChangeEvents: ((json['LatestChangeEvents'] as List?) ?? const [])
          .nonNulls
          .map((e) => ChangeEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
      service: ((json['Service'] as Map<String, dynamic>?) ??
              const <String, dynamic>{})
          .map((k, e) => MapEntry(k, e as String)),
      attributeFilters: (json['AttributeFilters'] as List?)
          ?.nonNulls
          .map((e) => AttributeFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final latestChangeEvents = this.latestChangeEvents;
    final service = this.service;
    final attributeFilters = this.attributeFilters;
    return {
      'LatestChangeEvents': latestChangeEvents,
      'Service': service,
      if (attributeFilters != null) 'AttributeFilters': attributeFilters,
    };
  }
}

/// A structure that contains information about a change event that occurred for
/// a service, such as a deployment or configuration change.
///
/// @nodoc
class ChangeEvent {
  /// The Amazon Web Services account ID where this change event occurred.
  final String accountId;

  /// The type of change event that occurred, such as <code>DEPLOYMENT</code>.
  final ChangeEventType changeEventType;

  /// The entity (service or resource) that was affected by this change event,
  /// including its key attributes.
  ///
  /// This is a string-to-string map. It can include the following fields.
  ///
  /// <ul>
  /// <li>
  /// <code>Type</code> designates the type of object this is.
  /// </li>
  /// <li>
  /// <code>ResourceType</code> specifies the type of the resource. This field is
  /// used only when the value of the <code>Type</code> field is
  /// <code>Resource</code> or <code>AWS::Resource</code>.
  /// </li>
  /// <li>
  /// <code>Name</code> specifies the name of the object. This is used only if the
  /// value of the <code>Type</code> field is <code>Service</code>,
  /// <code>RemoteService</code>, or <code>AWS::Service</code>.
  /// </li>
  /// <li>
  /// <code>Identifier</code> identifies the resource objects of this resource.
  /// This is used only if the value of the <code>Type</code> field is
  /// <code>Resource</code> or <code>AWS::Resource</code>.
  /// </li>
  /// <li>
  /// <code>Environment</code> specifies the location where this object is hosted,
  /// or what it belongs to.
  /// </li>
  /// <li>
  /// <code>AwsAccountId</code> specifies the account where this object is in.
  /// </li>
  /// </ul>
  /// Below is an example of a service.
  ///
  /// <code>{ "Type": "Service", "Name": "visits-service", "Environment":
  /// "petclinic-test" }</code>
  ///
  /// Below is an example of a resource.
  ///
  /// <code>{ "Type": "AWS::Resource", "ResourceType": "AWS::DynamoDB::Table",
  /// "Identifier": "Customers" }</code>
  final Map<String, String> entity;

  /// A unique identifier for this change event. For CloudTrail-based events, this
  /// is the CloudTrail event id. For other events, this will be
  /// <code>Unknown</code>.
  final String eventId;

  /// The Amazon Web Services region where this change event occurred.
  final String region;

  /// The timestamp when this change event occurred. When used in a raw HTTP Query
  /// API, it is formatted as epoch time in seconds.
  final DateTime timestamp;

  /// The name or description of this change event.
  final String? eventName;

  /// The name of the user who initiated this change event, if available.
  final String? userName;

  ChangeEvent({
    required this.accountId,
    required this.changeEventType,
    required this.entity,
    required this.eventId,
    required this.region,
    required this.timestamp,
    this.eventName,
    this.userName,
  });

  factory ChangeEvent.fromJson(Map<String, dynamic> json) {
    return ChangeEvent(
      accountId: (json['AccountId'] as String?) ?? '',
      changeEventType: ChangeEventType.fromString(
          (json['ChangeEventType'] as String?) ?? ''),
      entity: ((json['Entity'] as Map<String, dynamic>?) ??
              const <String, dynamic>{})
          .map((k, e) => MapEntry(k, e as String)),
      eventId: (json['EventId'] as String?) ?? '',
      region: (json['Region'] as String?) ?? '',
      timestamp: nonNullableTimeStampFromJson(json['Timestamp'] ?? 0),
      eventName: json['EventName'] as String?,
      userName: json['UserName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final changeEventType = this.changeEventType;
    final entity = this.entity;
    final eventId = this.eventId;
    final region = this.region;
    final timestamp = this.timestamp;
    final eventName = this.eventName;
    final userName = this.userName;
    return {
      'AccountId': accountId,
      'ChangeEventType': changeEventType.value,
      'Entity': entity,
      'EventId': eventId,
      'Region': region,
      'Timestamp': unixTimestampToJson(timestamp),
      if (eventName != null) 'EventName': eventName,
      if (userName != null) 'UserName': userName,
    };
  }
}

/// @nodoc
class ChangeEventType {
  static const deployment = ChangeEventType._('DEPLOYMENT');
  static const configuration = ChangeEventType._('CONFIGURATION');

  final String value;

  const ChangeEventType._(this.value);

  static const values = [deployment, configuration];

  static ChangeEventType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ChangeEventType._(value));

  @override
  bool operator ==(other) => other is ChangeEventType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A structure that defines a filter for narrowing down results based on
/// specific attribute values. This can be used to filter services by platform,
/// environment, or other service characteristics.
///
/// @nodoc
class AttributeFilter {
  /// The name of the attribute to filter by, such as <code>Platform</code>,
  /// <code>Environment</code>, or <code>BusinessUnit</code>.
  final String attributeFilterName;

  /// An array of values to match for the specified attribute. Services that have
  /// any of these values for the attribute will be included in the results.
  final List<String> attributeFilterValues;

  AttributeFilter({
    required this.attributeFilterName,
    required this.attributeFilterValues,
  });

  factory AttributeFilter.fromJson(Map<String, dynamic> json) {
    return AttributeFilter(
      attributeFilterName: (json['AttributeFilterName'] as String?) ?? '',
      attributeFilterValues:
          ((json['AttributeFilterValues'] as List?) ?? const [])
              .nonNulls
              .map((e) => e as String)
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final attributeFilterName = this.attributeFilterName;
    final attributeFilterValues = this.attributeFilterValues;
    return {
      'AttributeFilterName': attributeFilterName,
      'AttributeFilterValues': attributeFilterValues,
    };
  }
}

/// This structure contains information about one of your services that was
/// discovered by Application Signals
///
/// @nodoc
class ServiceSummary {
  /// This is a string-to-string map that help identify the objects discovered by
  /// Application Signals. It can include the following fields.
  ///
  /// <ul>
  /// <li>
  /// <code>Type</code> designates the type of object this is.
  /// </li>
  /// <li>
  /// <code>ResourceType</code> specifies the type of the resource. This field is
  /// used only when the value of the <code>Type</code> field is
  /// <code>Resource</code> or <code>AWS::Resource</code>.
  /// </li>
  /// <li>
  /// <code>Name</code> specifies the name of the object. This is used only if the
  /// value of the <code>Type</code> field is <code>Service</code>,
  /// <code>RemoteService</code>, or <code>AWS::Service</code>.
  /// </li>
  /// <li>
  /// <code>Identifier</code> identifies the resource objects of this resource.
  /// This is used only if the value of the <code>Type</code> field is
  /// <code>Resource</code> or <code>AWS::Resource</code>.
  /// </li>
  /// <li>
  /// <code>Environment</code> specifies the location where this object is hosted,
  /// or what it belongs to.
  /// </li>
  /// </ul>
  final Map<String, String> keyAttributes;

  /// An array of structures that each contain information about one metric
  /// associated with this service.
  final List<MetricReference> metricReferences;

  /// This structure contains one or more string-to-string maps that help identify
  /// this service. It can include <i>platform attributes</i>, <i>application
  /// attributes</i>, and <i>telemetry attributes</i>.
  ///
  /// Platform attributes contain information the service's platform.
  ///
  /// <ul>
  /// <li>
  /// <code>PlatformType</code> defines the hosted-in platform.
  /// </li>
  /// <li>
  /// <code>EKS.Cluster</code> is the name of the Amazon EKS cluster.
  /// </li>
  /// <li>
  /// <code>K8s.Cluster</code> is the name of the self-hosted Kubernetes cluster.
  /// </li>
  /// <li>
  /// <code>K8s.Namespace</code> is the name of the Kubernetes namespace in either
  /// Amazon EKS or Kubernetes clusters.
  /// </li>
  /// <li>
  /// <code>K8s.Workload</code> is the name of the Kubernetes workload in either
  /// Amazon EKS or Kubernetes clusters.
  /// </li>
  /// <li>
  /// <code>K8s.Node</code> is the name of the Kubernetes node in either Amazon
  /// EKS or Kubernetes clusters.
  /// </li>
  /// <li>
  /// <code>K8s.Pod</code> is the name of the Kubernetes pod in either Amazon EKS
  /// or Kubernetes clusters.
  /// </li>
  /// <li>
  /// <code>EC2.AutoScalingGroup</code> is the name of the Amazon EC2 Auto Scaling
  /// group.
  /// </li>
  /// <li>
  /// <code>EC2.InstanceId</code> is the ID of the Amazon EC2 instance.
  /// </li>
  /// <li>
  /// <code>Host</code> is the name of the host, for all platform types.
  /// </li>
  /// </ul>
  /// Application attributes contain information about the application.
  ///
  /// <ul>
  /// <li>
  /// <code>AWS.Application</code> is the application's name in Amazon Web
  /// Services Service Catalog AppRegistry.
  /// </li>
  /// <li>
  /// <code>AWS.Application.ARN</code> is the application's ARN in Amazon Web
  /// Services Service Catalog AppRegistry.
  /// </li>
  /// </ul>
  /// Telemetry attributes contain telemetry information.
  ///
  /// <ul>
  /// <li>
  /// <code>Telemetry.SDK</code> is the fingerprint of the OpenTelemetry SDK
  /// version for instrumented services.
  /// </li>
  /// <li>
  /// <code>Telemetry.Agent</code> is the fingerprint of the agent used to collect
  /// and send telemetry data.
  /// </li>
  /// <li>
  /// <code>Telemetry.Source</code> Specifies the point of application where the
  /// telemetry was collected or specifies what was used for the source of
  /// telemetry data.
  /// </li>
  /// </ul>
  final List<Map<String, String>>? attributeMaps;

  /// An array of service groups that this service belongs to, based on the
  /// configured grouping attributes.
  final List<ServiceGroup>? serviceGroups;

  ServiceSummary({
    required this.keyAttributes,
    required this.metricReferences,
    this.attributeMaps,
    this.serviceGroups,
  });

  factory ServiceSummary.fromJson(Map<String, dynamic> json) {
    return ServiceSummary(
      keyAttributes: ((json['KeyAttributes'] as Map<String, dynamic>?) ??
              const <String, dynamic>{})
          .map((k, e) => MapEntry(k, e as String)),
      metricReferences: ((json['MetricReferences'] as List?) ?? const [])
          .nonNulls
          .map((e) => MetricReference.fromJson(e as Map<String, dynamic>))
          .toList(),
      attributeMaps: (json['AttributeMaps'] as List?)
          ?.nonNulls
          .map((e) => (e as Map<String, dynamic>)
              .map((k, e) => MapEntry(k, e as String)))
          .toList(),
      serviceGroups: (json['ServiceGroups'] as List?)
          ?.nonNulls
          .map((e) => ServiceGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final keyAttributes = this.keyAttributes;
    final metricReferences = this.metricReferences;
    final attributeMaps = this.attributeMaps;
    final serviceGroups = this.serviceGroups;
    return {
      'KeyAttributes': keyAttributes,
      'MetricReferences': metricReferences,
      if (attributeMaps != null) 'AttributeMaps': attributeMaps,
      if (serviceGroups != null) 'ServiceGroups': serviceGroups,
    };
  }
}

/// A structure that represents a logical grouping of services based on shared
/// attributes such as business unit, environment, or entry point.
///
/// @nodoc
class ServiceGroup {
  /// A unique identifier for this grouping attribute value, used for filtering
  /// and API operations.
  final String groupIdentifier;

  /// The name of the grouping attribute, such as <code>BusinessUnit</code> or
  /// <code>Environment</code>.
  final String groupName;

  /// The source of the grouping attribute, such as <code>TAG</code>,
  /// <code>OTEL</code>, or <code>DEFAULT</code>.
  final String groupSource;

  /// The value of the grouping attribute for this service, such as
  /// <code>Payments</code> or <code>Production</code>.
  final String groupValue;

  ServiceGroup({
    required this.groupIdentifier,
    required this.groupName,
    required this.groupSource,
    required this.groupValue,
  });

  factory ServiceGroup.fromJson(Map<String, dynamic> json) {
    return ServiceGroup(
      groupIdentifier: (json['GroupIdentifier'] as String?) ?? '',
      groupName: (json['GroupName'] as String?) ?? '',
      groupSource: (json['GroupSource'] as String?) ?? '',
      groupValue: (json['GroupValue'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final groupIdentifier = this.groupIdentifier;
    final groupName = this.groupName;
    final groupSource = this.groupSource;
    final groupValue = this.groupValue;
    return {
      'GroupIdentifier': groupIdentifier,
      'GroupName': groupName,
      'GroupSource': groupSource,
      'GroupValue': groupValue,
    };
  }
}

/// This structure contains information about one CloudWatch metric associated
/// with this entity discovered by Application Signals.
///
/// @nodoc
class MetricReference {
  /// The name of the metric.
  final String metricName;

  /// Used to display the appropriate statistics in the CloudWatch console.
  final String metricType;

  /// The namespace of the metric. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch_concepts.html#Namespace">CloudWatchNamespaces</a>.
  final String namespace;

  /// Amazon Web Services account ID.
  final String? accountId;

  /// An array of one or more dimensions that further define the metric. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch_concepts.html#Dimension">CloudWatchDimensions</a>.
  final List<Dimension>? dimensions;

  MetricReference({
    required this.metricName,
    required this.metricType,
    required this.namespace,
    this.accountId,
    this.dimensions,
  });

  factory MetricReference.fromJson(Map<String, dynamic> json) {
    return MetricReference(
      metricName: (json['MetricName'] as String?) ?? '',
      metricType: (json['MetricType'] as String?) ?? '',
      namespace: (json['Namespace'] as String?) ?? '',
      accountId: json['AccountId'] as String?,
      dimensions: (json['Dimensions'] as List?)
          ?.nonNulls
          .map((e) => Dimension.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final metricName = this.metricName;
    final metricType = this.metricType;
    final namespace = this.namespace;
    final accountId = this.accountId;
    final dimensions = this.dimensions;
    return {
      'MetricName': metricName,
      'MetricType': metricType,
      'Namespace': namespace,
      if (accountId != null) 'AccountId': accountId,
      if (dimensions != null) 'Dimensions': dimensions,
    };
  }
}

/// This structure contains information about an operation discovered by
/// Application Signals. An operation is a specific function performed by a
/// service that was discovered by Application Signals, and is often an API that
/// is called by an upstream dependent.
///
/// @nodoc
class ServiceOperation {
  /// An array of structures that each contain information about one metric
  /// associated with this service operation that was discovered by Application
  /// Signals.
  final List<MetricReference> metricReferences;

  /// The name of the operation, discovered by Application Signals.
  final String name;

  ServiceOperation({
    required this.metricReferences,
    required this.name,
  });

  factory ServiceOperation.fromJson(Map<String, dynamic> json) {
    return ServiceOperation(
      metricReferences: ((json['MetricReferences'] as List?) ?? const [])
          .nonNulls
          .map((e) => MetricReference.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: (json['Name'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final metricReferences = this.metricReferences;
    final name = this.name;
    return {
      'MetricReferences': metricReferences,
      'Name': name,
    };
  }
}

/// The core SLO time window exclusion object that includes Window, StartTime,
/// RecurrenceRule, and Reason.
///
/// @nodoc
class ExclusionWindow {
  /// The SLO time window exclusion .
  final Window window;

  /// A description explaining why this time period should be excluded from SLO
  /// calculations.
  final String? reason;

  /// The recurrence rule for the SLO time window exclusion. Supports both cron
  /// and rate expressions.
  final RecurrenceRule? recurrenceRule;

  /// The start of the SLO time window exclusion. Defaults to current time if not
  /// specified.
  final DateTime? startTime;

  ExclusionWindow({
    required this.window,
    this.reason,
    this.recurrenceRule,
    this.startTime,
  });

  factory ExclusionWindow.fromJson(Map<String, dynamic> json) {
    return ExclusionWindow(
      window: Window.fromJson((json['Window'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
      reason: json['Reason'] as String?,
      recurrenceRule: json['RecurrenceRule'] != null
          ? RecurrenceRule.fromJson(
              json['RecurrenceRule'] as Map<String, dynamic>)
          : null,
      startTime: timeStampFromJson(json['StartTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final window = this.window;
    final reason = this.reason;
    final recurrenceRule = this.recurrenceRule;
    final startTime = this.startTime;
    return {
      'Window': window,
      if (reason != null) 'Reason': reason,
      if (recurrenceRule != null) 'RecurrenceRule': recurrenceRule,
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
    };
  }
}

/// The object that defines the time length of an exclusion window.
///
/// @nodoc
class Window {
  /// The number of time units for the exclusion window length.
  final int duration;

  /// The unit of time for the exclusion window duration. Valid values: MINUTE,
  /// HOUR, DAY, MONTH.
  final DurationUnit durationUnit;

  Window({
    required this.duration,
    required this.durationUnit,
  });

  factory Window.fromJson(Map<String, dynamic> json) {
    return Window(
      duration: (json['Duration'] as int?) ?? 0,
      durationUnit:
          DurationUnit.fromString((json['DurationUnit'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final duration = this.duration;
    final durationUnit = this.durationUnit;
    return {
      'Duration': duration,
      'DurationUnit': durationUnit.value,
    };
  }
}

/// The recurrence rule for the SLO time window exclusion .
///
/// @nodoc
class RecurrenceRule {
  /// A cron or rate expression that specifies the schedule for the exclusion
  /// window.
  final String expression;

  RecurrenceRule({
    required this.expression,
  });

  factory RecurrenceRule.fromJson(Map<String, dynamic> json) {
    return RecurrenceRule(
      expression: (json['Expression'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final expression = this.expression;
    return {
      'Expression': expression,
    };
  }
}

/// This structure contains information about a service dependent that was
/// discovered by Application Signals. A dependent is an entity that invoked the
/// specified service during the provided time range. Dependents include other
/// services, CloudWatch Synthetics canaries, and clients that are instrumented
/// with CloudWatch RUM app monitors.
///
/// @nodoc
class ServiceDependent {
  /// This is a string-to-string map. It can include the following fields.
  ///
  /// <ul>
  /// <li>
  /// <code>Type</code> designates the type of object this is.
  /// </li>
  /// <li>
  /// <code>ResourceType</code> specifies the type of the resource. This field is
  /// used only when the value of the <code>Type</code> field is
  /// <code>Resource</code> or <code>AWS::Resource</code>.
  /// </li>
  /// <li>
  /// <code>Name</code> specifies the name of the object. This is used only if the
  /// value of the <code>Type</code> field is <code>Service</code>,
  /// <code>RemoteService</code>, or <code>AWS::Service</code>.
  /// </li>
  /// <li>
  /// <code>Identifier</code> identifies the resource objects of this resource.
  /// This is used only if the value of the <code>Type</code> field is
  /// <code>Resource</code> or <code>AWS::Resource</code>.
  /// </li>
  /// <li>
  /// <code>Environment</code> specifies the location where this object is hosted,
  /// or what it belongs to.
  /// </li>
  /// </ul>
  final Map<String, String> dependentKeyAttributes;

  /// An array of structures that each contain information about one metric
  /// associated with this service dependent that was discovered by Application
  /// Signals.
  final List<MetricReference> metricReferences;

  /// If the dependent invoker was a service that invoked it from an operation,
  /// the name of that dependent operation is displayed here.
  final String? dependentOperationName;

  /// If the invoked entity is an operation on an entity, the name of that
  /// dependent operation is displayed here.
  final String? operationName;

  ServiceDependent({
    required this.dependentKeyAttributes,
    required this.metricReferences,
    this.dependentOperationName,
    this.operationName,
  });

  factory ServiceDependent.fromJson(Map<String, dynamic> json) {
    return ServiceDependent(
      dependentKeyAttributes:
          ((json['DependentKeyAttributes'] as Map<String, dynamic>?) ??
                  const <String, dynamic>{})
              .map((k, e) => MapEntry(k, e as String)),
      metricReferences: ((json['MetricReferences'] as List?) ?? const [])
          .nonNulls
          .map((e) => MetricReference.fromJson(e as Map<String, dynamic>))
          .toList(),
      dependentOperationName: json['DependentOperationName'] as String?,
      operationName: json['OperationName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dependentKeyAttributes = this.dependentKeyAttributes;
    final metricReferences = this.metricReferences;
    final dependentOperationName = this.dependentOperationName;
    final operationName = this.operationName;
    return {
      'DependentKeyAttributes': dependentKeyAttributes,
      'MetricReferences': metricReferences,
      if (dependentOperationName != null)
        'DependentOperationName': dependentOperationName,
      if (operationName != null) 'OperationName': operationName,
    };
  }
}

/// This structure contains information about one dependency of this service.
///
/// @nodoc
class ServiceDependency {
  /// This is a string-to-string map. It can include the following fields.
  ///
  /// <ul>
  /// <li>
  /// <code>Type</code> designates the type of object this is.
  /// </li>
  /// <li>
  /// <code>ResourceType</code> specifies the type of the resource. This field is
  /// used only when the value of the <code>Type</code> field is
  /// <code>Resource</code> or <code>AWS::Resource</code>.
  /// </li>
  /// <li>
  /// <code>Name</code> specifies the name of the object. This is used only if the
  /// value of the <code>Type</code> field is <code>Service</code>,
  /// <code>RemoteService</code>, or <code>AWS::Service</code>.
  /// </li>
  /// <li>
  /// <code>Identifier</code> identifies the resource objects of this resource.
  /// This is used only if the value of the <code>Type</code> field is
  /// <code>Resource</code> or <code>AWS::Resource</code>.
  /// </li>
  /// <li>
  /// <code>Environment</code> specifies the location where this object is hosted,
  /// or what it belongs to.
  /// </li>
  /// </ul>
  final Map<String, String> dependencyKeyAttributes;

  /// The name of the called operation in the dependency.
  final String dependencyOperationName;

  /// An array of structures that each contain information about one metric
  /// associated with this service dependency that was discovered by Application
  /// Signals.
  final List<MetricReference> metricReferences;

  /// The name of the operation in this service that calls the dependency.
  final String operationName;

  ServiceDependency({
    required this.dependencyKeyAttributes,
    required this.dependencyOperationName,
    required this.metricReferences,
    required this.operationName,
  });

  factory ServiceDependency.fromJson(Map<String, dynamic> json) {
    return ServiceDependency(
      dependencyKeyAttributes:
          ((json['DependencyKeyAttributes'] as Map<String, dynamic>?) ??
                  const <String, dynamic>{})
              .map((k, e) => MapEntry(k, e as String)),
      dependencyOperationName:
          (json['DependencyOperationName'] as String?) ?? '',
      metricReferences: ((json['MetricReferences'] as List?) ?? const [])
          .nonNulls
          .map((e) => MetricReference.fromJson(e as Map<String, dynamic>))
          .toList(),
      operationName: (json['OperationName'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final dependencyKeyAttributes = this.dependencyKeyAttributes;
    final dependencyOperationName = this.dependencyOperationName;
    final metricReferences = this.metricReferences;
    final operationName = this.operationName;
    return {
      'DependencyKeyAttributes': dependencyKeyAttributes,
      'DependencyOperationName': dependencyOperationName,
      'MetricReferences': metricReferences,
      'OperationName': operationName,
    };
  }
}

/// A structure that contains information about an audit finding, which
/// represents an automated analysis result about service behavior, performance
/// issues, or potential problems identified through heuristic algorithms.
///
/// @nodoc
class AuditFinding {
  /// The key attributes that identify the service or entity this audit finding
  /// relates to. This is a string-to-string map that includes fields like Type,
  /// Name, and Environment.
  final Map<String, String> keyAttributes;

  /// An array of auditor results that contain the specific findings,
  /// descriptions, and severity levels identified by different auditing
  /// algorithms.
  final List<AuditorResult>? auditorResults;

  /// A structure containing nodes and edges that represent the dependency
  /// relationships relevant to this audit finding, helping to understand the
  /// context and potential impact.
  final DependencyGraph? dependencyGraph;

  /// A structure containing metric data queries and time range information that
  /// provides context for the audit finding through relevant performance metrics.
  final MetricGraph? metricGraph;

  /// The name of the operation associated with this audit finding, if the finding
  /// is specific to a particular service operation.
  final String? operation;

  /// The type of audit finding.
  final String? type;

  AuditFinding({
    required this.keyAttributes,
    this.auditorResults,
    this.dependencyGraph,
    this.metricGraph,
    this.operation,
    this.type,
  });

  factory AuditFinding.fromJson(Map<String, dynamic> json) {
    return AuditFinding(
      keyAttributes: ((json['KeyAttributes'] as Map<String, dynamic>?) ??
              const <String, dynamic>{})
          .map((k, e) => MapEntry(k, e as String)),
      auditorResults: (json['AuditorResults'] as List?)
          ?.nonNulls
          .map((e) => AuditorResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      dependencyGraph: json['DependencyGraph'] != null
          ? DependencyGraph.fromJson(
              json['DependencyGraph'] as Map<String, dynamic>)
          : null,
      metricGraph: json['MetricGraph'] != null
          ? MetricGraph.fromJson(json['MetricGraph'] as Map<String, dynamic>)
          : null,
      operation: json['Operation'] as String?,
      type: json['Type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final keyAttributes = this.keyAttributes;
    final auditorResults = this.auditorResults;
    final dependencyGraph = this.dependencyGraph;
    final metricGraph = this.metricGraph;
    final operation = this.operation;
    final type = this.type;
    return {
      'KeyAttributes': keyAttributes,
      if (auditorResults != null) 'AuditorResults': auditorResults,
      if (dependencyGraph != null) 'DependencyGraph': dependencyGraph,
      if (metricGraph != null) 'MetricGraph': metricGraph,
      if (operation != null) 'Operation': operation,
      if (type != null) 'Type': type,
    };
  }
}

/// A structure that contains metric data queries and time range information
/// that provides context for audit findings through relevant performance
/// metrics.
///
/// @nodoc
class MetricGraph {
  /// The end time for the metric data included in this graph. When used in a raw
  /// HTTP Query API, it is formatted as epoch time in seconds.
  final DateTime? endTime;

  /// An array of metric data queries that define the metrics to be retrieved and
  /// analyzed as part of the audit finding context.
  final List<MetricDataQuery>? metricDataQueries;

  /// The start time for the metric data included in this graph. When used in a
  /// raw HTTP Query API, it is formatted as epoch time in seconds.
  final DateTime? startTime;

  MetricGraph({
    this.endTime,
    this.metricDataQueries,
    this.startTime,
  });

  factory MetricGraph.fromJson(Map<String, dynamic> json) {
    return MetricGraph(
      endTime: timeStampFromJson(json['EndTime']),
      metricDataQueries: (json['MetricDataQueries'] as List?)
          ?.nonNulls
          .map((e) => MetricDataQuery.fromJson(e as Map<String, dynamic>))
          .toList(),
      startTime: timeStampFromJson(json['StartTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final endTime = this.endTime;
    final metricDataQueries = this.metricDataQueries;
    final startTime = this.startTime;
    return {
      if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
      if (metricDataQueries != null) 'MetricDataQueries': metricDataQueries,
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
    };
  }
}

/// A structure that represents the dependency relationships relevant to an
/// audit finding, containing nodes and edges that show how services and
/// resources are connected.
///
/// @nodoc
class DependencyGraph {
  /// An array of edges representing the connections and relationships between the
  /// nodes in the dependency graph.
  final List<Edge>? edges;

  /// An array of nodes representing the services, resources, or other entities in
  /// the dependency graph.
  final List<Node>? nodes;

  DependencyGraph({
    this.edges,
    this.nodes,
  });

  factory DependencyGraph.fromJson(Map<String, dynamic> json) {
    return DependencyGraph(
      edges: (json['Edges'] as List?)
          ?.nonNulls
          .map((e) => Edge.fromJson(e as Map<String, dynamic>))
          .toList(),
      nodes: (json['Nodes'] as List?)
          ?.nonNulls
          .map((e) => Node.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final edges = this.edges;
    final nodes = this.nodes;
    return {
      if (edges != null) 'Edges': edges,
      if (nodes != null) 'Nodes': nodes,
    };
  }
}

/// A structure that represents a connection between two nodes in a dependency
/// graph, showing the relationship and characteristics of the connection.
///
/// @nodoc
class Edge {
  /// The type of connection between the nodes, indicating the nature of the
  /// relationship.
  final ConnectionType? connectionType;

  /// The identifier of the destination node in this edge connection.
  final String? destinationNodeId;

  /// The duration or latency associated with this connection, if applicable.
  final double? duration;

  /// The identifier of the source node in this edge connection.
  final String? sourceNodeId;

  Edge({
    this.connectionType,
    this.destinationNodeId,
    this.duration,
    this.sourceNodeId,
  });

  factory Edge.fromJson(Map<String, dynamic> json) {
    return Edge(
      connectionType:
          (json['ConnectionType'] as String?)?.let(ConnectionType.fromString),
      destinationNodeId: json['DestinationNodeId'] as String?,
      duration: _s.parseJsonDouble(json['Duration']),
      sourceNodeId: json['SourceNodeId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final connectionType = this.connectionType;
    final destinationNodeId = this.destinationNodeId;
    final duration = this.duration;
    final sourceNodeId = this.sourceNodeId;
    return {
      if (connectionType != null) 'ConnectionType': connectionType.value,
      if (destinationNodeId != null) 'DestinationNodeId': destinationNodeId,
      if (duration != null) 'Duration': _s.encodeJsonDouble(duration),
      if (sourceNodeId != null) 'SourceNodeId': sourceNodeId,
    };
  }
}

/// @nodoc
class ConnectionType {
  static const indirect = ConnectionType._('INDIRECT');
  static const direct = ConnectionType._('DIRECT');

  final String value;

  const ConnectionType._(this.value);

  static const values = [indirect, direct];

  static ConnectionType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ConnectionType._(value));

  @override
  bool operator ==(other) => other is ConnectionType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A structure that represents a node in a dependency graph, containing
/// information about a service, resource, or other entity and its
/// characteristics.
///
/// @nodoc
class Node {
  /// The key attributes that identify this node, including Type, Name, and
  /// Environment information.
  final Map<String, String> keyAttributes;

  /// The name of the entity represented by this node.
  final String name;

  /// A unique identifier for this node within the dependency graph.
  final String nodeId;

  /// The duration or processing time associated with this node, if applicable.
  final double? duration;

  /// The operation associated with this node, if applicable.
  final String? operation;

  /// The status of the entity represented by this node.
  final String? status;

  /// The type of entity represented by this node, such as <code>Service</code> or
  /// <code>Resource</code>.
  final String? type;

  Node({
    required this.keyAttributes,
    required this.name,
    required this.nodeId,
    this.duration,
    this.operation,
    this.status,
    this.type,
  });

  factory Node.fromJson(Map<String, dynamic> json) {
    return Node(
      keyAttributes: ((json['KeyAttributes'] as Map<String, dynamic>?) ??
              const <String, dynamic>{})
          .map((k, e) => MapEntry(k, e as String)),
      name: (json['Name'] as String?) ?? '',
      nodeId: (json['NodeId'] as String?) ?? '',
      duration: _s.parseJsonDouble(json['Duration']),
      operation: json['Operation'] as String?,
      status: json['Status'] as String?,
      type: json['Type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final keyAttributes = this.keyAttributes;
    final name = this.name;
    final nodeId = this.nodeId;
    final duration = this.duration;
    final operation = this.operation;
    final status = this.status;
    final type = this.type;
    return {
      'KeyAttributes': keyAttributes,
      'Name': name,
      'NodeId': nodeId,
      if (duration != null) 'Duration': _s.encodeJsonDouble(duration),
      if (operation != null) 'Operation': operation,
      if (status != null) 'Status': status,
      if (type != null) 'Type': type,
    };
  }
}

/// A structure that contains the result of an automated audit analysis,
/// including the auditor name, description of findings, additional data, and
/// severity level.
///
/// @nodoc
class AuditorResult {
  /// The name of the auditor algorithm that generated this result.
  final String? auditor;

  /// This is a string-to-string map. It contains additional data about the result
  /// of an automated audit analysis.
  final Map<String, String>? data;

  /// A detailed description of the audit finding, explaining what was observed
  /// and potential implications.
  final String? description;

  /// The severity level of this audit finding, indicating the importance and
  /// potential impact of the issue.
  final Severity? severity;

  AuditorResult({
    this.auditor,
    this.data,
    this.description,
    this.severity,
  });

  factory AuditorResult.fromJson(Map<String, dynamic> json) {
    return AuditorResult(
      auditor: json['Auditor'] as String?,
      data: (json['Data'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      description: json['Description'] as String?,
      severity: (json['Severity'] as String?)?.let(Severity.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final auditor = this.auditor;
    final data = this.data;
    final description = this.description;
    final severity = this.severity;
    return {
      if (auditor != null) 'Auditor': auditor,
      if (data != null) 'Data': data,
      if (description != null) 'Description': description,
      if (severity != null) 'Severity': severity.value,
    };
  }
}

/// @nodoc
class Severity {
  static const critical = Severity._('CRITICAL');
  static const high = Severity._('HIGH');
  static const medium = Severity._('MEDIUM');
  static const low = Severity._('LOW');
  static const none = Severity._('NONE');

  final String value;

  const Severity._(this.value);

  static const values = [critical, high, medium, low, none];

  static Severity fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => Severity._(value));

  @override
  bool operator ==(other) => other is Severity && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class DetailLevel {
  static const brief = DetailLevel._('BRIEF');
  static const detailed = DetailLevel._('DETAILED');

  final String value;

  const DetailLevel._(this.value);

  static const values = [brief, detailed];

  static DetailLevel fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => DetailLevel._(value));

  @override
  bool operator ==(other) => other is DetailLevel && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A structure that specifies the target entity for audit analysis, such as a
/// <code>service</code>, <code>SLO</code>, <code>service_operation</code>, or
/// <code>canary</code>.
///
/// @nodoc
class AuditTarget {
  /// The specific data identifying the audit target entity.
  final AuditTargetEntity data;

  /// The type of entity being audited, such as <code>service</code>,
  /// <code>SLO</code>, <code>service_operation</code>, or <code>canary</code>.
  final String type;

  AuditTarget({
    required this.data,
    required this.type,
  });

  Map<String, dynamic> toJson() {
    final data = this.data;
    final type = this.type;
    return {
      'Data': data,
      'Type': type,
    };
  }
}

/// A union structure that contains the specific entity information for
/// different types of audit targets.
///
/// @nodoc
class AuditTargetEntity {
  /// Canary entity information when the audit target is a CloudWatch Synthetics
  /// canary.
  final CanaryEntity? canary;

  /// Service entity information when the audit target is a service.
  final ServiceEntity? service;

  /// Service operation entity information when the audit target is a specific
  /// service operation.
  final ServiceOperationEntity? serviceOperation;

  /// SLO entity information when the audit target is a service level objective.
  final ServiceLevelObjectiveEntity? slo;

  AuditTargetEntity({
    this.canary,
    this.service,
    this.serviceOperation,
    this.slo,
  });

  Map<String, dynamic> toJson() {
    final canary = this.canary;
    final service = this.service;
    final serviceOperation = this.serviceOperation;
    final slo = this.slo;
    return {
      if (canary != null) 'Canary': canary,
      if (service != null) 'Service': service,
      if (serviceOperation != null) 'ServiceOperation': serviceOperation,
      if (slo != null) 'Slo': slo,
    };
  }
}

/// A structure that contains identifying information for a service entity.
///
/// @nodoc
class ServiceEntity {
  /// The Amazon Web Services account ID where the service is located. Provide
  /// this value only for cross-account access.
  final String? awsAccountId;

  /// The environment where the service is deployed.
  final String? environment;

  /// The name of the service.
  final String? name;

  /// The type of the service entity.
  final String? type;

  ServiceEntity({
    this.awsAccountId,
    this.environment,
    this.name,
    this.type,
  });

  Map<String, dynamic> toJson() {
    final awsAccountId = this.awsAccountId;
    final environment = this.environment;
    final name = this.name;
    final type = this.type;
    return {
      if (awsAccountId != null) 'AwsAccountId': awsAccountId,
      if (environment != null) 'Environment': environment,
      if (name != null) 'Name': name,
      if (type != null) 'Type': type,
    };
  }
}

/// A structure that contains identifying information for a service level
/// objective entity.
///
/// @nodoc
class ServiceLevelObjectiveEntity {
  /// The ARN of the service level objective. The SLO must be provided with ARN
  /// for cross-account access.
  final String? sloArn;

  /// The name of the service level objective.
  final String? sloName;

  ServiceLevelObjectiveEntity({
    this.sloArn,
    this.sloName,
  });

  Map<String, dynamic> toJson() {
    final sloArn = this.sloArn;
    final sloName = this.sloName;
    return {
      if (sloArn != null) 'SloArn': sloArn,
      if (sloName != null) 'SloName': sloName,
    };
  }
}

/// A structure that contains identifying information for a service operation
/// entity.
///
/// @nodoc
class ServiceOperationEntity {
  /// The type of metric associated with this service operation.
  final String? metricType;

  /// The name of the operation.
  final String? operation;

  /// The service entity that contains this operation.
  final ServiceEntity? service;

  ServiceOperationEntity({
    this.metricType,
    this.operation,
    this.service,
  });

  Map<String, dynamic> toJson() {
    final metricType = this.metricType;
    final operation = this.operation;
    final service = this.service;
    return {
      if (metricType != null) 'MetricType': metricType,
      if (operation != null) 'Operation': operation,
      if (service != null) 'Service': service,
    };
  }
}

/// A structure that contains identifying information for a CloudWatch
/// Synthetics canary entity used in audit targeting.
///
/// @nodoc
class CanaryEntity {
  /// The name of the CloudWatch Synthetics canary.
  final String canaryName;

  CanaryEntity({
    required this.canaryName,
  });

  Map<String, dynamic> toJson() {
    final canaryName = this.canaryName;
    return {
      'CanaryName': canaryName,
    };
  }
}

/// This structure contains information about one of your services that was
/// discovered by Application Signals.
///
/// @nodoc
class Service {
  /// This is a string-to-string map. It can include the following fields.
  ///
  /// <ul>
  /// <li>
  /// <code>Type</code> designates the type of object this is.
  /// </li>
  /// <li>
  /// <code>ResourceType</code> specifies the type of the resource. This field is
  /// used only when the value of the <code>Type</code> field is
  /// <code>Resource</code> or <code>AWS::Resource</code>.
  /// </li>
  /// <li>
  /// <code>Name</code> specifies the name of the object. This is used only if the
  /// value of the <code>Type</code> field is <code>Service</code>,
  /// <code>RemoteService</code>, or <code>AWS::Service</code>.
  /// </li>
  /// <li>
  /// <code>Identifier</code> identifies the resource objects of this resource.
  /// This is used only if the value of the <code>Type</code> field is
  /// <code>Resource</code> or <code>AWS::Resource</code>.
  /// </li>
  /// <li>
  /// <code>Environment</code> specifies the location where this object is hosted,
  /// or what it belongs to.
  /// </li>
  /// </ul>
  final Map<String, String> keyAttributes;

  /// An array of structures that each contain information about one metric
  /// associated with this service.
  final List<MetricReference> metricReferences;

  /// This structure contains one or more string-to-string maps that help identify
  /// this service. It can include <i>platform attributes</i>, <i>application
  /// attributes</i>, and <i>telemetry attributes</i>.
  ///
  /// Platform attributes contain information the service's platform.
  ///
  /// <ul>
  /// <li>
  /// <code>PlatformType</code> defines the hosted-in platform.
  /// </li>
  /// <li>
  /// <code>EKS.Cluster</code> is the name of the Amazon EKS cluster.
  /// </li>
  /// <li>
  /// <code>K8s.Cluster</code> is the name of the self-hosted Kubernetes cluster.
  /// </li>
  /// <li>
  /// <code>K8s.Namespace</code> is the name of the Kubernetes namespace in either
  /// Amazon EKS or Kubernetes clusters.
  /// </li>
  /// <li>
  /// <code>K8s.Workload</code> is the name of the Kubernetes workload in either
  /// Amazon EKS or Kubernetes clusters.
  /// </li>
  /// <li>
  /// <code>K8s.Node</code> is the name of the Kubernetes node in either Amazon
  /// EKS or Kubernetes clusters.
  /// </li>
  /// <li>
  /// <code>K8s.Pod</code> is the name of the Kubernetes pod in either Amazon EKS
  /// or Kubernetes clusters.
  /// </li>
  /// <li>
  /// <code>EC2.AutoScalingGroup</code> is the name of the Amazon EC2 Auto Scaling
  /// group.
  /// </li>
  /// <li>
  /// <code>EC2.InstanceId</code> is the ID of the Amazon EC2 instance.
  /// </li>
  /// <li>
  /// <code>Host</code> is the name of the host, for all platform types.
  /// </li>
  /// </ul>
  /// Application attributes contain information about the application.
  ///
  /// <ul>
  /// <li>
  /// <code>AWS.Application</code> is the application's name in Amazon Web
  /// Services Service Catalog AppRegistry.
  /// </li>
  /// <li>
  /// <code>AWS.Application.ARN</code> is the application's ARN in Amazon Web
  /// Services Service Catalog AppRegistry.
  /// </li>
  /// </ul>
  /// Telemetry attributes contain telemetry information.
  ///
  /// <ul>
  /// <li>
  /// <code>Telemetry.SDK</code> is the fingerprint of the OpenTelemetry SDK
  /// version for instrumented services.
  /// </li>
  /// <li>
  /// <code>Telemetry.Agent</code> is the fingerprint of the agent used to collect
  /// and send telemetry data.
  /// </li>
  /// <li>
  /// <code>Telemetry.Source</code> Specifies the point of application where the
  /// telemetry was collected or specifies what was used for the source of
  /// telemetry data.
  /// </li>
  /// </ul>
  final List<Map<String, String>>? attributeMaps;

  /// An array of string-to-string maps that each contain information about one
  /// log group associated with this service. Each string-to-string map includes
  /// the following fields:
  ///
  /// <ul>
  /// <li>
  /// <code>"Type": "AWS::Resource"</code>
  /// </li>
  /// <li>
  /// <code>"ResourceType": "AWS::Logs::LogGroup"</code>
  /// </li>
  /// <li>
  /// <code>"Identifier": "<i>name-of-log-group</i>"</code>
  /// </li>
  /// </ul>
  final List<Map<String, String>>? logGroupReferences;

  /// An array of service groups that this service belongs to, based on the
  /// configured grouping attributes.
  final List<ServiceGroup>? serviceGroups;

  Service({
    required this.keyAttributes,
    required this.metricReferences,
    this.attributeMaps,
    this.logGroupReferences,
    this.serviceGroups,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      keyAttributes: ((json['KeyAttributes'] as Map<String, dynamic>?) ??
              const <String, dynamic>{})
          .map((k, e) => MapEntry(k, e as String)),
      metricReferences: ((json['MetricReferences'] as List?) ?? const [])
          .nonNulls
          .map((e) => MetricReference.fromJson(e as Map<String, dynamic>))
          .toList(),
      attributeMaps: (json['AttributeMaps'] as List?)
          ?.nonNulls
          .map((e) => (e as Map<String, dynamic>)
              .map((k, e) => MapEntry(k, e as String)))
          .toList(),
      logGroupReferences: (json['LogGroupReferences'] as List?)
          ?.nonNulls
          .map((e) => (e as Map<String, dynamic>)
              .map((k, e) => MapEntry(k, e as String)))
          .toList(),
      serviceGroups: (json['ServiceGroups'] as List?)
          ?.nonNulls
          .map((e) => ServiceGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final keyAttributes = this.keyAttributes;
    final metricReferences = this.metricReferences;
    final attributeMaps = this.attributeMaps;
    final logGroupReferences = this.logGroupReferences;
    final serviceGroups = this.serviceGroups;
    return {
      'KeyAttributes': keyAttributes,
      'MetricReferences': metricReferences,
      if (attributeMaps != null) 'AttributeMaps': attributeMaps,
      if (logGroupReferences != null) 'LogGroupReferences': logGroupReferences,
      if (serviceGroups != null) 'ServiceGroups': serviceGroups,
    };
  }
}

/// An array of structures, where each structure includes an error indicating
/// that one of the requests in the array was not valid.
///
/// @nodoc
class BatchUpdateExclusionWindowsError {
  /// The error code.
  final String errorCode;

  /// The error message.
  final String errorMessage;

  /// The SLO ID in the error.
  final String sloId;

  BatchUpdateExclusionWindowsError({
    required this.errorCode,
    required this.errorMessage,
    required this.sloId,
  });

  factory BatchUpdateExclusionWindowsError.fromJson(Map<String, dynamic> json) {
    return BatchUpdateExclusionWindowsError(
      errorCode: (json['ErrorCode'] as String?) ?? '',
      errorMessage: (json['ErrorMessage'] as String?) ?? '',
      sloId: (json['SloId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final sloId = this.sloId;
    return {
      'ErrorCode': errorCode,
      'ErrorMessage': errorMessage,
      'SloId': sloId,
    };
  }
}

/// A structure containing information about one error that occurred during a <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_BatchGetServiceLevelObjectiveBudgetReport.html">BatchGetServiceLevelObjectiveBudgetReport</a>
/// operation.
///
/// @nodoc
class ServiceLevelObjectiveBudgetReportError {
  /// The ARN of the SLO that this error is related to.
  final String arn;

  /// The error code for this error.
  final String errorCode;

  /// The message for this error.
  final String errorMessage;

  /// The name of the SLO that this error is related to.
  final String name;

  ServiceLevelObjectiveBudgetReportError({
    required this.arn,
    required this.errorCode,
    required this.errorMessage,
    required this.name,
  });

  factory ServiceLevelObjectiveBudgetReportError.fromJson(
      Map<String, dynamic> json) {
    return ServiceLevelObjectiveBudgetReportError(
      arn: (json['Arn'] as String?) ?? '',
      errorCode: (json['ErrorCode'] as String?) ?? '',
      errorMessage: (json['ErrorMessage'] as String?) ?? '',
      name: (json['Name'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final name = this.name;
    return {
      'Arn': arn,
      'ErrorCode': errorCode,
      'ErrorMessage': errorMessage,
      'Name': name,
    };
  }
}

/// A structure containing an SLO budget report that you have requested.
///
/// @nodoc
class ServiceLevelObjectiveBudgetReport {
  /// The ARN of the SLO that this report is for.
  final String arn;

  /// The status of this SLO, as it relates to the error budget for the entire
  /// time interval.
  ///
  /// <ul>
  /// <li>
  /// <code>OK</code> means that the SLO had remaining budget above the warning
  /// threshold, as of the time that you specified in <code>TimeStamp</code>.
  /// </li>
  /// <li>
  /// <code>WARNING</code> means that the SLO's remaining budget was below the
  /// warning threshold, as of the time that you specified in
  /// <code>TimeStamp</code>.
  /// </li>
  /// <li>
  /// <code>BREACHED</code> means that the SLO's budget was exhausted, as of the
  /// time that you specified in <code>TimeStamp</code>.
  /// </li>
  /// <li>
  /// <code>INSUFFICIENT_DATA</code> means that the specified start and end times
  /// were before the SLO was created, or that attainment data is missing.
  /// </li>
  /// </ul>
  final ServiceLevelObjectiveBudgetStatus budgetStatus;

  /// The name of the SLO that this report is for.
  final String name;

  /// A number between 0 and 100 that represents the success percentage of your
  /// application compared to the goal set by the SLO.
  ///
  /// If this is a period-based SLO, the number is the percentage of time periods
  /// that the service has attained the SLO's attainment goal, as of the time of
  /// the request.
  ///
  /// If this is a request-based SLO, the number is the number of successful
  /// requests divided by the number of total requests, multiplied by 100, during
  /// the time range that you specified in your request.
  final double? attainment;

  /// This field is displayed only for request-based SLOs. It displays the number
  /// of failed requests that can be tolerated before any more successful requests
  /// occur, and still have the application meet its SLO goal.
  ///
  /// This number can go up and down between different reports, based on both how
  /// many successful requests and how many failed requests occur in that time.
  final int? budgetRequestsRemaining;

  /// The budget amount remaining before the SLO status becomes
  /// <code>BREACHING</code>, at the time specified in the <code>Timestemp</code>
  /// parameter of the request. If this value is negative, then the SLO is already
  /// in <code>BREACHING</code> status.
  ///
  /// This field is included only if the SLO is a period-based SLO.
  final int? budgetSecondsRemaining;

  /// Displays whether this budget report is for a period-based SLO or a
  /// request-based SLO.
  final EvaluationType? evaluationType;
  final Goal? goal;
  final RequestBasedServiceLevelIndicator? requestBasedSli;

  /// A structure that contains information about the performance metric that this
  /// SLO monitors.
  final ServiceLevelIndicator? sli;

  /// This field is displayed only for request-based SLOs. It displays the total
  /// number of failed requests that can be tolerated during the time range
  /// between the start of the interval and the time stamp supplied in the budget
  /// report request. It is based on the total number of requests that occurred,
  /// and the percentage specified in the attainment goal. If the number of failed
  /// requests matches this number or is higher, then this SLO is currently
  /// breaching.
  ///
  /// This number can go up and down between reports with different time stamps,
  /// based on both how many total requests occur.
  final int? totalBudgetRequests;

  /// The total number of seconds in the error budget for the interval. This field
  /// is included only if the SLO is a period-based SLO.
  final int? totalBudgetSeconds;

  ServiceLevelObjectiveBudgetReport({
    required this.arn,
    required this.budgetStatus,
    required this.name,
    this.attainment,
    this.budgetRequestsRemaining,
    this.budgetSecondsRemaining,
    this.evaluationType,
    this.goal,
    this.requestBasedSli,
    this.sli,
    this.totalBudgetRequests,
    this.totalBudgetSeconds,
  });

  factory ServiceLevelObjectiveBudgetReport.fromJson(
      Map<String, dynamic> json) {
    return ServiceLevelObjectiveBudgetReport(
      arn: (json['Arn'] as String?) ?? '',
      budgetStatus: ServiceLevelObjectiveBudgetStatus.fromString(
          (json['BudgetStatus'] as String?) ?? ''),
      name: (json['Name'] as String?) ?? '',
      attainment: _s.parseJsonDouble(json['Attainment']),
      budgetRequestsRemaining: json['BudgetRequestsRemaining'] as int?,
      budgetSecondsRemaining: json['BudgetSecondsRemaining'] as int?,
      evaluationType:
          (json['EvaluationType'] as String?)?.let(EvaluationType.fromString),
      goal: json['Goal'] != null
          ? Goal.fromJson(json['Goal'] as Map<String, dynamic>)
          : null,
      requestBasedSli: json['RequestBasedSli'] != null
          ? RequestBasedServiceLevelIndicator.fromJson(
              json['RequestBasedSli'] as Map<String, dynamic>)
          : null,
      sli: json['Sli'] != null
          ? ServiceLevelIndicator.fromJson(json['Sli'] as Map<String, dynamic>)
          : null,
      totalBudgetRequests: json['TotalBudgetRequests'] as int?,
      totalBudgetSeconds: json['TotalBudgetSeconds'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final budgetStatus = this.budgetStatus;
    final name = this.name;
    final attainment = this.attainment;
    final budgetRequestsRemaining = this.budgetRequestsRemaining;
    final budgetSecondsRemaining = this.budgetSecondsRemaining;
    final evaluationType = this.evaluationType;
    final goal = this.goal;
    final requestBasedSli = this.requestBasedSli;
    final sli = this.sli;
    final totalBudgetRequests = this.totalBudgetRequests;
    final totalBudgetSeconds = this.totalBudgetSeconds;
    return {
      'Arn': arn,
      'BudgetStatus': budgetStatus.value,
      'Name': name,
      if (attainment != null) 'Attainment': _s.encodeJsonDouble(attainment),
      if (budgetRequestsRemaining != null)
        'BudgetRequestsRemaining': budgetRequestsRemaining,
      if (budgetSecondsRemaining != null)
        'BudgetSecondsRemaining': budgetSecondsRemaining,
      if (evaluationType != null) 'EvaluationType': evaluationType.value,
      if (goal != null) 'Goal': goal,
      if (requestBasedSli != null) 'RequestBasedSli': requestBasedSli,
      if (sli != null) 'Sli': sli,
      if (totalBudgetRequests != null)
        'TotalBudgetRequests': totalBudgetRequests,
      if (totalBudgetSeconds != null) 'TotalBudgetSeconds': totalBudgetSeconds,
    };
  }
}

/// @nodoc
class ServiceLevelObjectiveBudgetStatus {
  static const ok = ServiceLevelObjectiveBudgetStatus._('OK');
  static const warning = ServiceLevelObjectiveBudgetStatus._('WARNING');
  static const breached = ServiceLevelObjectiveBudgetStatus._('BREACHED');
  static const insufficientData =
      ServiceLevelObjectiveBudgetStatus._('INSUFFICIENT_DATA');

  final String value;

  const ServiceLevelObjectiveBudgetStatus._(this.value);

  static const values = [ok, warning, breached, insufficientData];

  static ServiceLevelObjectiveBudgetStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ServiceLevelObjectiveBudgetStatus._(value));

  @override
  bool operator ==(other) =>
      other is ServiceLevelObjectiveBudgetStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

/// @nodoc
class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

/// @nodoc
class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

/// @nodoc
class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

/// @nodoc
class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

/// @nodoc
class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
