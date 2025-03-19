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
class CloudWatchApplicationSignals {
  final _s.RestJsonProtocol _protocol;
  CloudWatchApplicationSignals({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'application-signals',
            signingName: 'application-signals',
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
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
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
  ///
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
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  ///
  /// Parameter [name] :
  /// A name for this SLO.
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
    String? description,
    Goal? goal,
    RequestBasedServiceLevelIndicatorConfig? requestBasedSliConfig,
    ServiceLevelIndicatorConfig? sliConfig,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'Name': name,
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

  /// Deletes the specified service level objective.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
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

  /// Returns information about a service discovered by Application Signals.
  ///
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
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

  /// Returns information about one SLO created in the account.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
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

  /// Returns a list of service dependencies of the service that you specify. A
  /// dependency is an infrastructure component that an operation of this
  /// service connects with. Dependencies can include Amazon Web Services
  /// services, Amazon Web Services resources, and third-party services.
  ///
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
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
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
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

  /// Returns a list of SLOs created in this account.
  ///
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
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
  /// Parameter [nextToken] :
  /// Include this value, if it was returned by the previous operation, to get
  /// the next set of service level objectives.
  ///
  /// Parameter [operationName] :
  /// The name of the operation that this SLO is associated with.
  Future<ListServiceLevelObjectivesOutput> listServiceLevelObjectives({
    Map<String, String>? keyAttributes,
    int? maxResults,
    String? nextToken,
    String? operationName,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
      if (operationName != null) 'OperationName': [operationName],
    };
    final $payload = <String, dynamic>{
      if (keyAttributes != null) 'KeyAttributes': keyAttributes,
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

  /// Returns a list of the <i>operations</i> of this service that have been
  /// discovered by Application Signals. Only the operations that were invoked
  /// during the specified time range are returned.
  ///
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
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
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
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
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/services',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListServicesOutput.fromJson(response);
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
  /// After completing this step, you still need to instrument your Java and
  /// Python applications to send data to Application Signals. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Application-Signals-Enable.html">
  /// Enabling Application Signals</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
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
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
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

  /// Updates an existing service level objective (SLO). If you omit parameters,
  /// the previous values of those parameters are retained.
  ///
  /// You cannot change from a period-based SLO to a request-based SLO, or
  /// change from a request-based SLO to a period-based SLO.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [id] :
  /// The Amazon Resource Name (ARN) or name of the service level objective that
  /// you want to update.
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
    String? description,
    Goal? goal,
    RequestBasedServiceLevelIndicatorConfig? requestBasedSliConfig,
    ServiceLevelIndicatorConfig? sliConfig,
  }) async {
    final $payload = <String, dynamic>{
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
}

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
      errors: (json['Errors'] as List)
          .nonNulls
          .map((e) => ServiceLevelObjectiveBudgetReportError.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      reports: (json['Reports'] as List)
          .nonNulls
          .map((e) => ServiceLevelObjectiveBudgetReport.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      timestamp: nonNullableTimeStampFromJson(json['Timestamp'] as Object),
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

/// If the interval for this service level objective is a calendar interval,
/// this structure contains the interval specifications.
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
      duration: json['Duration'] as int,
      durationUnit: DurationUnit.fromString((json['DurationUnit'] as String)),
      startTime: nonNullableTimeStampFromJson(json['StartTime'] as Object),
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

class CreateServiceLevelObjectiveOutput {
  /// A structure that contains information about the SLO that you just created.
  final ServiceLevelObjective slo;

  CreateServiceLevelObjectiveOutput({
    required this.slo,
  });

  factory CreateServiceLevelObjectiveOutput.fromJson(
      Map<String, dynamic> json) {
    return CreateServiceLevelObjectiveOutput(
      slo: ServiceLevelObjective.fromJson(json['Slo'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final slo = this.slo;
    return {
      'Slo': slo,
    };
  }
}

class DeleteServiceLevelObjectiveOutput {
  DeleteServiceLevelObjectiveOutput();

  factory DeleteServiceLevelObjectiveOutput.fromJson(Map<String, dynamic> _) {
    return DeleteServiceLevelObjectiveOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A dimension is a name/value pair that is part of the identity of a metric.
/// Because dimensions are part of the unique identifier for a metric, whenever
/// you add a unique name/value pair to one of your metrics, you are creating a
/// new variation of that metric. For example, many Amazon EC2 metrics publish
/// <code>InstanceId</code> as a dimension name, and the actual instance ID as
/// the value for that dimension.
///
/// You can assign up to 30 dimensions to a metric.
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
      name: json['Name'] as String,
      value: json['Value'] as String,
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

enum DurationUnit {
  minute('MINUTE'),
  hour('HOUR'),
  day('DAY'),
  month('MONTH'),
  ;

  final String value;

  const DurationUnit(this.value);

  static DurationUnit fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum DurationUnit'));
}

enum EvaluationType {
  periodBased('PeriodBased'),
  requestBased('RequestBased'),
  ;

  final String value;

  const EvaluationType(this.value);

  static EvaluationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum EvaluationType'));
}

class GetServiceLevelObjectiveOutput {
  /// A structure containing the information about the SLO.
  final ServiceLevelObjective slo;

  GetServiceLevelObjectiveOutput({
    required this.slo,
  });

  factory GetServiceLevelObjectiveOutput.fromJson(Map<String, dynamic> json) {
    return GetServiceLevelObjectiveOutput(
      slo: ServiceLevelObjective.fromJson(json['Slo'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final slo = this.slo;
    return {
      'Slo': slo,
    };
  }
}

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
      endTime: nonNullableTimeStampFromJson(json['EndTime'] as Object),
      service: Service.fromJson(json['Service'] as Map<String, dynamic>),
      startTime: nonNullableTimeStampFromJson(json['StartTime'] as Object),
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

/// This structure contains the attributes that determine the goal of an SLO.
/// This includes the time period for evaluation and the attainment threshold.
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
      attainmentGoal: json['AttainmentGoal'] as double?,
      interval: json['Interval'] != null
          ? Interval.fromJson(json['Interval'] as Map<String, dynamic>)
          : null,
      warningThreshold: json['WarningThreshold'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final attainmentGoal = this.attainmentGoal;
    final interval = this.interval;
    final warningThreshold = this.warningThreshold;
    return {
      if (attainmentGoal != null) 'AttainmentGoal': attainmentGoal,
      if (interval != null) 'Interval': interval,
      if (warningThreshold != null) 'WarningThreshold': warningThreshold,
    };
  }
}

/// The time period used to evaluate the SLO. It can be either a calendar
/// interval or rolling interval.
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
      endTime: nonNullableTimeStampFromJson(json['EndTime'] as Object),
      serviceDependencies: (json['ServiceDependencies'] as List)
          .nonNulls
          .map((e) => ServiceDependency.fromJson(e as Map<String, dynamic>))
          .toList(),
      startTime: nonNullableTimeStampFromJson(json['StartTime'] as Object),
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
      endTime: nonNullableTimeStampFromJson(json['EndTime'] as Object),
      serviceDependents: (json['ServiceDependents'] as List)
          .nonNulls
          .map((e) => ServiceDependent.fromJson(e as Map<String, dynamic>))
          .toList(),
      startTime: nonNullableTimeStampFromJson(json['StartTime'] as Object),
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
      endTime: nonNullableTimeStampFromJson(json['EndTime'] as Object),
      serviceOperations: (json['ServiceOperations'] as List)
          .nonNulls
          .map((e) => ServiceOperation.fromJson(e as Map<String, dynamic>))
          .toList(),
      startTime: nonNullableTimeStampFromJson(json['StartTime'] as Object),
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
      endTime: nonNullableTimeStampFromJson(json['EndTime'] as Object),
      serviceSummaries: (json['ServiceSummaries'] as List)
          .nonNulls
          .map((e) => ServiceSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      startTime: nonNullableTimeStampFromJson(json['StartTime'] as Object),
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

/// This structure defines the metric used for a service level indicator,
/// including the metric name, namespace, and dimensions
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
      id: json['Id'] as String,
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

/// This structure contains information about one CloudWatch metric associated
/// with this entity discovered by Application Signals.
class MetricReference {
  /// The name of the metric.
  final String metricName;

  /// Used to display the appropriate statistics in the CloudWatch console.
  final String metricType;

  /// The namespace of the metric. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch_concepts.html#Namespace">CloudWatchNamespaces</a>.
  final String namespace;

  /// An array of one or more dimensions that further define the metric. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch_concepts.html#Dimension">CloudWatchDimensions</a>.
  final List<Dimension>? dimensions;

  MetricReference({
    required this.metricName,
    required this.metricType,
    required this.namespace,
    this.dimensions,
  });

  factory MetricReference.fromJson(Map<String, dynamic> json) {
    return MetricReference(
      metricName: json['MetricName'] as String,
      metricType: json['MetricType'] as String,
      namespace: json['Namespace'] as String,
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
    final dimensions = this.dimensions;
    return {
      'MetricName': metricName,
      'MetricType': metricType,
      'Namespace': namespace,
      if (dimensions != null) 'Dimensions': dimensions,
    };
  }
}

/// This structure defines the metric to be used as the service level indicator,
/// along with the statistics, period, and unit.
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
      metric: Metric.fromJson(json['Metric'] as Map<String, dynamic>),
      period: json['Period'] as int,
      stat: json['Stat'] as String,
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

/// This structure defines the metric that is used as the "good request" or "bad
/// request" value for a request-based SLO. This value observed for the metric
/// defined in <code>TotalRequestCountMetric</code> is divided by the number
/// found for <code>MonitoredRequestCountMetric</code> to determine the
/// percentage of successful requests that this SLO tracks.
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

/// This structure contains information about the performance metric that a
/// request-based SLO monitors.
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
          json['RequestBasedSliMetric'] as Map<String, dynamic>),
      comparisonOperator: (json['ComparisonOperator'] as String?)
          ?.let(ServiceLevelIndicatorComparisonOperator.fromString),
      metricThreshold: json['MetricThreshold'] as double?,
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
      if (metricThreshold != null) 'MetricThreshold': metricThreshold,
    };
  }
}

/// This structure specifies the information about the service and the
/// performance metric that a request-based SLO is to monitor.
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
      if (metricThreshold != null) 'MetricThreshold': metricThreshold,
    };
  }
}

/// This structure contains the information about the metric that is used for a
/// request-based SLO.
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
    this.keyAttributes,
    this.metricType,
    this.operationName,
  });

  factory RequestBasedServiceLevelIndicatorMetric.fromJson(
      Map<String, dynamic> json) {
    return RequestBasedServiceLevelIndicatorMetric(
      monitoredRequestCountMetric:
          MonitoredRequestCountMetricDataQueries.fromJson(
              json['MonitoredRequestCountMetric'] as Map<String, dynamic>),
      totalRequestCountMetric: (json['TotalRequestCountMetric'] as List)
          .nonNulls
          .map((e) => MetricDataQuery.fromJson(e as Map<String, dynamic>))
          .toList(),
      keyAttributes: (json['KeyAttributes'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      metricType: (json['MetricType'] as String?)
          ?.let(ServiceLevelIndicatorMetricType.fromString),
      operationName: json['OperationName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final monitoredRequestCountMetric = this.monitoredRequestCountMetric;
    final totalRequestCountMetric = this.totalRequestCountMetric;
    final keyAttributes = this.keyAttributes;
    final metricType = this.metricType;
    final operationName = this.operationName;
    return {
      'MonitoredRequestCountMetric': monitoredRequestCountMetric,
      'TotalRequestCountMetric': totalRequestCountMetric,
      if (keyAttributes != null) 'KeyAttributes': keyAttributes,
      if (metricType != null) 'MetricType': metricType.value,
      if (operationName != null) 'OperationName': operationName,
    };
  }
}

/// Use this structure to specify the information for the metric that a
/// period-based SLO will monitor.
class RequestBasedServiceLevelIndicatorMetricConfig {
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
    this.keyAttributes,
    this.metricType,
    this.monitoredRequestCountMetric,
    this.operationName,
    this.totalRequestCountMetric,
  });

  Map<String, dynamic> toJson() {
    final keyAttributes = this.keyAttributes;
    final metricType = this.metricType;
    final monitoredRequestCountMetric = this.monitoredRequestCountMetric;
    final operationName = this.operationName;
    final totalRequestCountMetric = this.totalRequestCountMetric;
    return {
      if (keyAttributes != null) 'KeyAttributes': keyAttributes,
      if (metricType != null) 'MetricType': metricType.value,
      if (monitoredRequestCountMetric != null)
        'MonitoredRequestCountMetric': monitoredRequestCountMetric,
      if (operationName != null) 'OperationName': operationName,
      if (totalRequestCountMetric != null)
        'TotalRequestCountMetric': totalRequestCountMetric,
    };
  }
}

/// If the interval for this SLO is a rolling interval, this structure contains
/// the interval specifications.
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
      duration: json['Duration'] as int,
      durationUnit: DurationUnit.fromString((json['DurationUnit'] as String)),
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

/// This structure contains information about one of your services that was
/// discovered by Application Signals.
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

  Service({
    required this.keyAttributes,
    required this.metricReferences,
    this.attributeMaps,
    this.logGroupReferences,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      keyAttributes: (json['KeyAttributes'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(k, e as String)),
      metricReferences: (json['MetricReferences'] as List)
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
    );
  }

  Map<String, dynamic> toJson() {
    final keyAttributes = this.keyAttributes;
    final metricReferences = this.metricReferences;
    final attributeMaps = this.attributeMaps;
    final logGroupReferences = this.logGroupReferences;
    return {
      'KeyAttributes': keyAttributes,
      'MetricReferences': metricReferences,
      if (attributeMaps != null) 'AttributeMaps': attributeMaps,
      if (logGroupReferences != null) 'LogGroupReferences': logGroupReferences,
    };
  }
}

/// This structure contains information about one dependency of this service.
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
          (json['DependencyKeyAttributes'] as Map<String, dynamic>)
              .map((k, e) => MapEntry(k, e as String)),
      dependencyOperationName: json['DependencyOperationName'] as String,
      metricReferences: (json['MetricReferences'] as List)
          .nonNulls
          .map((e) => MetricReference.fromJson(e as Map<String, dynamic>))
          .toList(),
      operationName: json['OperationName'] as String,
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

/// This structure contains information about a service dependent that was
/// discovered by Application Signals. A dependent is an entity that invoked the
/// specified service during the provided time range. Dependents include other
/// services, CloudWatch Synthetics canaries, and clients that are instrumented
/// with CloudWatch RUM app monitors.
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
          (json['DependentKeyAttributes'] as Map<String, dynamic>)
              .map((k, e) => MapEntry(k, e as String)),
      metricReferences: (json['MetricReferences'] as List)
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

/// This structure contains information about the performance metric that a
/// period-based SLO monitors.
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
          (json['ComparisonOperator'] as String)),
      metricThreshold: json['MetricThreshold'] as double,
      sliMetric: ServiceLevelIndicatorMetric.fromJson(
          json['SliMetric'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final comparisonOperator = this.comparisonOperator;
    final metricThreshold = this.metricThreshold;
    final sliMetric = this.sliMetric;
    return {
      'ComparisonOperator': comparisonOperator.value,
      'MetricThreshold': metricThreshold,
      'SliMetric': sliMetric,
    };
  }
}

enum ServiceLevelIndicatorComparisonOperator {
  greaterThanOrEqualTo('GreaterThanOrEqualTo'),
  greaterThan('GreaterThan'),
  lessThan('LessThan'),
  lessThanOrEqualTo('LessThanOrEqualTo'),
  ;

  final String value;

  const ServiceLevelIndicatorComparisonOperator(this.value);

  static ServiceLevelIndicatorComparisonOperator fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum ServiceLevelIndicatorComparisonOperator'));
}

/// This structure specifies the information about the service and the
/// performance metric that a period-based SLO is to monitor.
class ServiceLevelIndicatorConfig {
  /// The arithmetic operation to use when comparing the specified metric to the
  /// threshold.
  final ServiceLevelIndicatorComparisonOperator comparisonOperator;

  /// This parameter is used only when a request-based SLO tracks the
  /// <code>Latency</code> metric. Specify the threshold value that the observed
  /// <code>Latency</code> metric values are to be compared to.
  final double metricThreshold;

  /// Use this structure to specify the metric to be used for the SLO.
  final ServiceLevelIndicatorMetricConfig sliMetricConfig;

  ServiceLevelIndicatorConfig({
    required this.comparisonOperator,
    required this.metricThreshold,
    required this.sliMetricConfig,
  });

  Map<String, dynamic> toJson() {
    final comparisonOperator = this.comparisonOperator;
    final metricThreshold = this.metricThreshold;
    final sliMetricConfig = this.sliMetricConfig;
    return {
      'ComparisonOperator': comparisonOperator.value,
      'MetricThreshold': metricThreshold,
      'SliMetricConfig': sliMetricConfig,
    };
  }
}

/// This structure contains the information about the metric that is used for a
/// period-based SLO.
class ServiceLevelIndicatorMetric {
  /// If this SLO monitors a CloudWatch metric or the result of a CloudWatch
  /// metric math expression, this structure includes the information about that
  /// metric or expression.
  final List<MetricDataQuery> metricDataQueries;

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

  /// If the SLO monitors either the <code>LATENCY</code> or
  /// <code>AVAILABILITY</code> metric that Application Signals collects, this
  /// field displays which of those metrics is used.
  final ServiceLevelIndicatorMetricType? metricType;

  /// If the SLO monitors a specific operation of the service, this field displays
  /// that operation name.
  final String? operationName;

  ServiceLevelIndicatorMetric({
    required this.metricDataQueries,
    this.keyAttributes,
    this.metricType,
    this.operationName,
  });

  factory ServiceLevelIndicatorMetric.fromJson(Map<String, dynamic> json) {
    return ServiceLevelIndicatorMetric(
      metricDataQueries: (json['MetricDataQueries'] as List)
          .nonNulls
          .map((e) => MetricDataQuery.fromJson(e as Map<String, dynamic>))
          .toList(),
      keyAttributes: (json['KeyAttributes'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      metricType: (json['MetricType'] as String?)
          ?.let(ServiceLevelIndicatorMetricType.fromString),
      operationName: json['OperationName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final metricDataQueries = this.metricDataQueries;
    final keyAttributes = this.keyAttributes;
    final metricType = this.metricType;
    final operationName = this.operationName;
    return {
      'MetricDataQueries': metricDataQueries,
      if (keyAttributes != null) 'KeyAttributes': keyAttributes,
      if (metricType != null) 'MetricType': metricType.value,
      if (operationName != null) 'OperationName': operationName,
    };
  }
}

/// Use this structure to specify the information for the metric that a
/// period-based SLO will monitor.
class ServiceLevelIndicatorMetricConfig {
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
    this.keyAttributes,
    this.metricDataQueries,
    this.metricType,
    this.operationName,
    this.periodSeconds,
    this.statistic,
  });

  Map<String, dynamic> toJson() {
    final keyAttributes = this.keyAttributes;
    final metricDataQueries = this.metricDataQueries;
    final metricType = this.metricType;
    final operationName = this.operationName;
    final periodSeconds = this.periodSeconds;
    final statistic = this.statistic;
    return {
      if (keyAttributes != null) 'KeyAttributes': keyAttributes,
      if (metricDataQueries != null) 'MetricDataQueries': metricDataQueries,
      if (metricType != null) 'MetricType': metricType.value,
      if (operationName != null) 'OperationName': operationName,
      if (periodSeconds != null) 'PeriodSeconds': periodSeconds,
      if (statistic != null) 'Statistic': statistic,
    };
  }
}

enum ServiceLevelIndicatorMetricType {
  latency('LATENCY'),
  availability('AVAILABILITY'),
  ;

  final String value;

  const ServiceLevelIndicatorMetricType(this.value);

  static ServiceLevelIndicatorMetricType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum ServiceLevelIndicatorMetricType'));
}

/// A structure containing information about one service level objective (SLO)
/// that has been created in Application Signals. Creating SLOs can help you
/// ensure your services are performing to the level that you expect. SLOs help
/// you set and track a specific target level for the reliability and
/// availability of your applications and services. Each SLO uses a service
/// level indicator (SLI), which is a key performance metric, to calculate how
/// much underperformance can be tolerated before the goal that you set for the
/// SLO is not achieved.
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

  /// The description that you created for this SLO.
  final String? description;

  /// Displays whether this is a period-based SLO or a request-based SLO.
  final EvaluationType? evaluationType;

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
    this.description,
    this.evaluationType,
    this.requestBasedSli,
    this.sli,
  });

  factory ServiceLevelObjective.fromJson(Map<String, dynamic> json) {
    return ServiceLevelObjective(
      arn: json['Arn'] as String,
      createdTime: nonNullableTimeStampFromJson(json['CreatedTime'] as Object),
      goal: Goal.fromJson(json['Goal'] as Map<String, dynamic>),
      lastUpdatedTime:
          nonNullableTimeStampFromJson(json['LastUpdatedTime'] as Object),
      name: json['Name'] as String,
      description: json['Description'] as String?,
      evaluationType:
          (json['EvaluationType'] as String?)?.let(EvaluationType.fromString),
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
    final description = this.description;
    final evaluationType = this.evaluationType;
    final requestBasedSli = this.requestBasedSli;
    final sli = this.sli;
    return {
      'Arn': arn,
      'CreatedTime': unixTimestampToJson(createdTime),
      'Goal': goal,
      'LastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      'Name': name,
      if (description != null) 'Description': description,
      if (evaluationType != null) 'EvaluationType': evaluationType.value,
      if (requestBasedSli != null) 'RequestBasedSli': requestBasedSli,
      if (sli != null) 'Sli': sli,
    };
  }
}

/// A structure containing an SLO budget report that you have requested.
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
      arn: json['Arn'] as String,
      budgetStatus: ServiceLevelObjectiveBudgetStatus.fromString(
          (json['BudgetStatus'] as String)),
      name: json['Name'] as String,
      attainment: json['Attainment'] as double?,
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
      if (attainment != null) 'Attainment': attainment,
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

/// A structure containing information about one error that occurred during a <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_BatchGetServiceLevelObjectiveBudgetReport.html">BatchGetServiceLevelObjectiveBudgetReport</a>
/// operation.
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
      arn: json['Arn'] as String,
      errorCode: json['ErrorCode'] as String,
      errorMessage: json['ErrorMessage'] as String,
      name: json['Name'] as String,
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

enum ServiceLevelObjectiveBudgetStatus {
  ok('OK'),
  warning('WARNING'),
  breached('BREACHED'),
  insufficientData('INSUFFICIENT_DATA'),
  ;

  final String value;

  const ServiceLevelObjectiveBudgetStatus(this.value);

  static ServiceLevelObjectiveBudgetStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum ServiceLevelObjectiveBudgetStatus'));
}

/// A structure that contains information about one service level objective
/// (SLO) created in Application Signals.
class ServiceLevelObjectiveSummary {
  /// The ARN of this service level objective.
  final String arn;

  /// The name of the service level objective.
  final String name;

  /// The date and time that this service level objective was created. It is
  /// expressed as the number of milliseconds since Jan 1, 1970 00:00:00 UTC.
  final DateTime? createdTime;

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

  /// If this service level objective is specific to a single operation, this
  /// field displays the name of that operation.
  final String? operationName;

  ServiceLevelObjectiveSummary({
    required this.arn,
    required this.name,
    this.createdTime,
    this.keyAttributes,
    this.operationName,
  });

  factory ServiceLevelObjectiveSummary.fromJson(Map<String, dynamic> json) {
    return ServiceLevelObjectiveSummary(
      arn: json['Arn'] as String,
      name: json['Name'] as String,
      createdTime: timeStampFromJson(json['CreatedTime']),
      keyAttributes: (json['KeyAttributes'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      operationName: json['OperationName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    final createdTime = this.createdTime;
    final keyAttributes = this.keyAttributes;
    final operationName = this.operationName;
    return {
      'Arn': arn,
      'Name': name,
      if (createdTime != null) 'CreatedTime': unixTimestampToJson(createdTime),
      if (keyAttributes != null) 'KeyAttributes': keyAttributes,
      if (operationName != null) 'OperationName': operationName,
    };
  }
}

/// This structure contains information about an operation discovered by
/// Application Signals. An operation is a specific function performed by a
/// service that was discovered by Application Signals, and is often an API that
/// is called by an upstream dependent.
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
      metricReferences: (json['MetricReferences'] as List)
          .nonNulls
          .map((e) => MetricReference.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['Name'] as String,
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

/// This structure contains information about one of your services that was
/// discovered by Application Signals
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

  ServiceSummary({
    required this.keyAttributes,
    required this.metricReferences,
    this.attributeMaps,
  });

  factory ServiceSummary.fromJson(Map<String, dynamic> json) {
    return ServiceSummary(
      keyAttributes: (json['KeyAttributes'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(k, e as String)),
      metricReferences: (json['MetricReferences'] as List)
          .nonNulls
          .map((e) => MetricReference.fromJson(e as Map<String, dynamic>))
          .toList(),
      attributeMaps: (json['AttributeMaps'] as List?)
          ?.nonNulls
          .map((e) => (e as Map<String, dynamic>)
              .map((k, e) => MapEntry(k, e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final keyAttributes = this.keyAttributes;
    final metricReferences = this.metricReferences;
    final attributeMaps = this.attributeMaps;
    return {
      'KeyAttributes': keyAttributes,
      'MetricReferences': metricReferences,
      if (attributeMaps != null) 'AttributeMaps': attributeMaps,
    };
  }
}

enum StandardUnit {
  microseconds('Microseconds'),
  milliseconds('Milliseconds'),
  seconds('Seconds'),
  bytes('Bytes'),
  kilobytes('Kilobytes'),
  megabytes('Megabytes'),
  gigabytes('Gigabytes'),
  terabytes('Terabytes'),
  bits('Bits'),
  kilobits('Kilobits'),
  megabits('Megabits'),
  gigabits('Gigabits'),
  terabits('Terabits'),
  percent('Percent'),
  count('Count'),
  bytesSecond('Bytes/Second'),
  kilobytesSecond('Kilobytes/Second'),
  megabytesSecond('Megabytes/Second'),
  gigabytesSecond('Gigabytes/Second'),
  terabytesSecond('Terabytes/Second'),
  bitsSecond('Bits/Second'),
  kilobitsSecond('Kilobits/Second'),
  megabitsSecond('Megabits/Second'),
  gigabitsSecond('Gigabits/Second'),
  terabitsSecond('Terabits/Second'),
  countSecond('Count/Second'),
  none('None'),
  ;

  final String value;

  const StandardUnit(this.value);

  static StandardUnit fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum StandardUnit'));
}

class StartDiscoveryOutput {
  StartDiscoveryOutput();

  factory StartDiscoveryOutput.fromJson(Map<String, dynamic> _) {
    return StartDiscoveryOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A key-value pair associated with a resource. Tags can help you organize and
/// categorize your resources.
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

class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateServiceLevelObjectiveOutput {
  /// A structure that contains information about the SLO that you just updated.
  final ServiceLevelObjective slo;

  UpdateServiceLevelObjectiveOutput({
    required this.slo,
  });

  factory UpdateServiceLevelObjectiveOutput.fromJson(
      Map<String, dynamic> json) {
    return UpdateServiceLevelObjectiveOutput(
      slo: ServiceLevelObjective.fromJson(json['Slo'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final slo = this.slo;
    return {
      'Slo': slo,
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
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
