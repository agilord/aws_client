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

import 'v2018_11_25.endpoints.dart' as _endpoints;
export '../../shared/shared.dart' show AwsClientCredentials;

/// Amazon CloudWatch Application Insights is a service that helps you detect
/// common problems with your applications. It enables you to pinpoint the
/// source of issues in your applications (built with technologies such as
/// Microsoft IIS, .NET, and Microsoft SQL Server), by providing key insights
/// into detected problems.
class ApplicationInsights {
  final _s.JsonProtocol _protocol;
  factory ApplicationInsights({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
    bool useFipsEndpoint = false,
    bool useDualStackEndpoint = false,
  }) {
    final service = _s.ServiceMetadata(
      endpointPrefix: 'applicationinsights',
    );
    return ApplicationInsights._(
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
  ApplicationInsights._({
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

  /// Adds a workload to a component. Each component can have at most five
  /// workloads.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [componentName] :
  /// The name of the component.
  ///
  /// Parameter [resourceGroupName] :
  /// The name of the resource group.
  ///
  /// Parameter [workloadConfiguration] :
  /// The configuration settings of the workload. The value is the escaped JSON
  /// of the configuration.
  Future<AddWorkloadResponse> addWorkload({
    required String componentName,
    required String resourceGroupName,
    required WorkloadConfiguration workloadConfiguration,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'EC2WindowsBarleyService.AddWorkload'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ComponentName': componentName,
        'ResourceGroupName': resourceGroupName,
        'WorkloadConfiguration': workloadConfiguration,
      },
    );

    return AddWorkloadResponse.fromJson(jsonResponse.body);
  }

  /// Adds an application that is created from a resource group.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TagsAlreadyExistException].
  /// May throw [ValidationException].
  ///
  /// Parameter [attachMissingPermission] :
  /// If set to true, the managed policies for SSM and CW will be attached to
  /// the instance roles if they are missing.
  ///
  /// Parameter [autoConfigEnabled] :
  /// Indicates whether Application Insights automatically configures
  /// unmonitored resources in the resource group.
  ///
  /// Parameter [autoCreate] :
  /// Configures all of the resources in the resource group by applying the
  /// recommended configurations.
  ///
  /// Parameter [cWEMonitorEnabled] :
  /// Indicates whether Application Insights can listen to CloudWatch events for
  /// the application resources, such as <code>instance terminated</code>,
  /// <code>failed deployment</code>, and others.
  ///
  /// Parameter [groupingType] :
  /// Application Insights can create applications based on a resource group or
  /// on an account. To create an account-based application using all of the
  /// resources in the account, set this parameter to
  /// <code>ACCOUNT_BASED</code>.
  ///
  /// Parameter [opsCenterEnabled] :
  /// When set to <code>true</code>, creates opsItems for any problems detected
  /// on an application.
  ///
  /// Parameter [opsItemSNSTopicArn] :
  /// The SNS topic provided to Application Insights that is associated to the
  /// created opsItem. Allows you to receive notifications for updates to the
  /// opsItem.
  ///
  /// Parameter [resourceGroupName] :
  /// The name of the resource group.
  ///
  /// Parameter [sNSNotificationArn] :
  /// The SNS notification topic ARN.
  ///
  /// Parameter [tags] :
  /// List of tags to add to the application. tag key (<code>Key</code>) and an
  /// associated tag value (<code>Value</code>). The maximum length of a tag key
  /// is 128 characters. The maximum length of a tag value is 256 characters.
  Future<CreateApplicationResponse> createApplication({
    bool? attachMissingPermission,
    bool? autoConfigEnabled,
    bool? autoCreate,
    bool? cWEMonitorEnabled,
    GroupingType? groupingType,
    bool? opsCenterEnabled,
    String? opsItemSNSTopicArn,
    String? resourceGroupName,
    String? sNSNotificationArn,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'EC2WindowsBarleyService.CreateApplication'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (attachMissingPermission != null)
          'AttachMissingPermission': attachMissingPermission,
        if (autoConfigEnabled != null) 'AutoConfigEnabled': autoConfigEnabled,
        if (autoCreate != null) 'AutoCreate': autoCreate,
        if (cWEMonitorEnabled != null) 'CWEMonitorEnabled': cWEMonitorEnabled,
        if (groupingType != null) 'GroupingType': groupingType.value,
        if (opsCenterEnabled != null) 'OpsCenterEnabled': opsCenterEnabled,
        if (opsItemSNSTopicArn != null)
          'OpsItemSNSTopicArn': opsItemSNSTopicArn,
        if (resourceGroupName != null) 'ResourceGroupName': resourceGroupName,
        if (sNSNotificationArn != null)
          'SNSNotificationArn': sNSNotificationArn,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateApplicationResponse.fromJson(jsonResponse.body);
  }

  /// Creates a custom component by grouping similar standalone instances to
  /// monitor.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [componentName] :
  /// The name of the component.
  ///
  /// Parameter [resourceGroupName] :
  /// The name of the resource group.
  ///
  /// Parameter [resourceList] :
  /// The list of resource ARNs that belong to the component.
  Future<void> createComponent({
    required String componentName,
    required String resourceGroupName,
    required List<String> resourceList,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'EC2WindowsBarleyService.CreateComponent'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ComponentName': componentName,
        'ResourceGroupName': resourceGroupName,
        'ResourceList': resourceList,
      },
    );
  }

  /// Adds an log pattern to a <code>LogPatternSet</code>.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [pattern] :
  /// The log pattern. The pattern must be DFA compatible. Patterns that utilize
  /// forward lookahead or backreference constructions are not supported.
  ///
  /// Parameter [patternName] :
  /// The name of the log pattern.
  ///
  /// Parameter [patternSetName] :
  /// The name of the log pattern set.
  ///
  /// Parameter [rank] :
  /// Rank of the log pattern. Must be a value between <code>1</code> and
  /// <code>1,000,000</code>. The patterns are sorted by rank, so we recommend
  /// that you set your highest priority patterns with the lowest rank. A
  /// pattern of rank <code>1</code> will be the first to get matched to a log
  /// line. A pattern of rank <code>1,000,000</code> will be last to get
  /// matched. When you configure custom log patterns from the console, a
  /// <code>Low</code> severity pattern translates to a <code>750,000</code>
  /// rank. A <code>Medium</code> severity pattern translates to a
  /// <code>500,000</code> rank. And a <code>High</code> severity pattern
  /// translates to a <code>250,000</code> rank. Rank values less than
  /// <code>1</code> or greater than <code>1,000,000</code> are reserved for
  /// Amazon Web Services provided patterns.
  ///
  /// Parameter [resourceGroupName] :
  /// The name of the resource group.
  Future<CreateLogPatternResponse> createLogPattern({
    required String pattern,
    required String patternName,
    required String patternSetName,
    required int rank,
    required String resourceGroupName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'EC2WindowsBarleyService.CreateLogPattern'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Pattern': pattern,
        'PatternName': patternName,
        'PatternSetName': patternSetName,
        'Rank': rank,
        'ResourceGroupName': resourceGroupName,
      },
    );

    return CreateLogPatternResponse.fromJson(jsonResponse.body);
  }

  /// Removes the specified application from monitoring. Does not delete the
  /// application.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceGroupName] :
  /// The name of the resource group.
  Future<void> deleteApplication({
    required String resourceGroupName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'EC2WindowsBarleyService.DeleteApplication'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceGroupName': resourceGroupName,
      },
    );
  }

  /// Ungroups a custom component. When you ungroup custom components, all
  /// applicable monitors that are set up for the component are removed and the
  /// instances revert to their standalone status.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [componentName] :
  /// The name of the component.
  ///
  /// Parameter [resourceGroupName] :
  /// The name of the resource group.
  Future<void> deleteComponent({
    required String componentName,
    required String resourceGroupName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'EC2WindowsBarleyService.DeleteComponent'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ComponentName': componentName,
        'ResourceGroupName': resourceGroupName,
      },
    );
  }

  /// Removes the specified log pattern from a <code>LogPatternSet</code>.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [patternName] :
  /// The name of the log pattern.
  ///
  /// Parameter [patternSetName] :
  /// The name of the log pattern set.
  ///
  /// Parameter [resourceGroupName] :
  /// The name of the resource group.
  Future<void> deleteLogPattern({
    required String patternName,
    required String patternSetName,
    required String resourceGroupName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'EC2WindowsBarleyService.DeleteLogPattern'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'PatternName': patternName,
        'PatternSetName': patternSetName,
        'ResourceGroupName': resourceGroupName,
      },
    );
  }

  /// Describes the application.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceGroupName] :
  /// The name of the resource group.
  ///
  /// Parameter [accountId] :
  /// The Amazon Web Services account ID for the resource group owner.
  Future<DescribeApplicationResponse> describeApplication({
    required String resourceGroupName,
    String? accountId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'EC2WindowsBarleyService.DescribeApplication'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceGroupName': resourceGroupName,
        if (accountId != null) 'AccountId': accountId,
      },
    );

    return DescribeApplicationResponse.fromJson(jsonResponse.body);
  }

  /// Describes a component and lists the resources that are grouped together in
  /// a component.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [componentName] :
  /// The name of the component.
  ///
  /// Parameter [resourceGroupName] :
  /// The name of the resource group.
  ///
  /// Parameter [accountId] :
  /// The Amazon Web Services account ID for the resource group owner.
  Future<DescribeComponentResponse> describeComponent({
    required String componentName,
    required String resourceGroupName,
    String? accountId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'EC2WindowsBarleyService.DescribeComponent'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ComponentName': componentName,
        'ResourceGroupName': resourceGroupName,
        if (accountId != null) 'AccountId': accountId,
      },
    );

    return DescribeComponentResponse.fromJson(jsonResponse.body);
  }

  /// Describes the monitoring configuration of the component.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [componentName] :
  /// The name of the component.
  ///
  /// Parameter [resourceGroupName] :
  /// The name of the resource group.
  ///
  /// Parameter [accountId] :
  /// The Amazon Web Services account ID for the resource group owner.
  Future<DescribeComponentConfigurationResponse>
      describeComponentConfiguration({
    required String componentName,
    required String resourceGroupName,
    String? accountId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'EC2WindowsBarleyService.DescribeComponentConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ComponentName': componentName,
        'ResourceGroupName': resourceGroupName,
        if (accountId != null) 'AccountId': accountId,
      },
    );

    return DescribeComponentConfigurationResponse.fromJson(jsonResponse.body);
  }

  /// Describes the recommended monitoring configuration of the component.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [componentName] :
  /// The name of the component.
  ///
  /// Parameter [resourceGroupName] :
  /// The name of the resource group.
  ///
  /// Parameter [tier] :
  /// The tier of the application component.
  ///
  /// Parameter [recommendationType] :
  /// The recommended configuration type.
  ///
  /// Parameter [workloadName] :
  /// The name of the workload. The name of the workload is required when the
  /// tier of the application component is <code>SAP_ASE_SINGLE_NODE</code> or
  /// <code>SAP_ASE_HIGH_AVAILABILITY</code>.
  Future<DescribeComponentConfigurationRecommendationResponse>
      describeComponentConfigurationRecommendation({
    required String componentName,
    required String resourceGroupName,
    required Tier tier,
    RecommendationType? recommendationType,
    String? workloadName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'EC2WindowsBarleyService.DescribeComponentConfigurationRecommendation'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ComponentName': componentName,
        'ResourceGroupName': resourceGroupName,
        'Tier': tier.value,
        if (recommendationType != null)
          'RecommendationType': recommendationType.value,
        if (workloadName != null) 'WorkloadName': workloadName,
      },
    );

    return DescribeComponentConfigurationRecommendationResponse.fromJson(
        jsonResponse.body);
  }

  /// Describe a specific log pattern from a <code>LogPatternSet</code>.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [patternName] :
  /// The name of the log pattern.
  ///
  /// Parameter [patternSetName] :
  /// The name of the log pattern set.
  ///
  /// Parameter [resourceGroupName] :
  /// The name of the resource group.
  ///
  /// Parameter [accountId] :
  /// The Amazon Web Services account ID for the resource group owner.
  Future<DescribeLogPatternResponse> describeLogPattern({
    required String patternName,
    required String patternSetName,
    required String resourceGroupName,
    String? accountId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'EC2WindowsBarleyService.DescribeLogPattern'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'PatternName': patternName,
        'PatternSetName': patternSetName,
        'ResourceGroupName': resourceGroupName,
        if (accountId != null) 'AccountId': accountId,
      },
    );

    return DescribeLogPatternResponse.fromJson(jsonResponse.body);
  }

  /// Describes an anomaly or error with the application.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [observationId] :
  /// The ID of the observation.
  ///
  /// Parameter [accountId] :
  /// The Amazon Web Services account ID for the resource group owner.
  Future<DescribeObservationResponse> describeObservation({
    required String observationId,
    String? accountId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'EC2WindowsBarleyService.DescribeObservation'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ObservationId': observationId,
        if (accountId != null) 'AccountId': accountId,
      },
    );

    return DescribeObservationResponse.fromJson(jsonResponse.body);
  }

  /// Describes an application problem.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [problemId] :
  /// The ID of the problem.
  ///
  /// Parameter [accountId] :
  /// The Amazon Web Services account ID for the owner of the resource group
  /// affected by the problem.
  Future<DescribeProblemResponse> describeProblem({
    required String problemId,
    String? accountId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'EC2WindowsBarleyService.DescribeProblem'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ProblemId': problemId,
        if (accountId != null) 'AccountId': accountId,
      },
    );

    return DescribeProblemResponse.fromJson(jsonResponse.body);
  }

  /// Describes the anomalies or errors associated with the problem.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [problemId] :
  /// The ID of the problem.
  ///
  /// Parameter [accountId] :
  /// The Amazon Web Services account ID for the resource group owner.
  Future<DescribeProblemObservationsResponse> describeProblemObservations({
    required String problemId,
    String? accountId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'EC2WindowsBarleyService.DescribeProblemObservations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ProblemId': problemId,
        if (accountId != null) 'AccountId': accountId,
      },
    );

    return DescribeProblemObservationsResponse.fromJson(jsonResponse.body);
  }

  /// Describes a workload and its configuration.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [componentName] :
  /// The name of the component.
  ///
  /// Parameter [resourceGroupName] :
  /// The name of the resource group.
  ///
  /// Parameter [workloadId] :
  /// The ID of the workload.
  ///
  /// Parameter [accountId] :
  /// The Amazon Web Services account ID for the workload owner.
  Future<DescribeWorkloadResponse> describeWorkload({
    required String componentName,
    required String resourceGroupName,
    required String workloadId,
    String? accountId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'EC2WindowsBarleyService.DescribeWorkload'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ComponentName': componentName,
        'ResourceGroupName': resourceGroupName,
        'WorkloadId': workloadId,
        if (accountId != null) 'AccountId': accountId,
      },
    );

    return DescribeWorkloadResponse.fromJson(jsonResponse.body);
  }

  /// Lists the IDs of the applications that you are monitoring.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [accountId] :
  /// The Amazon Web Services account ID for the resource group owner.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call. To retrieve the
  /// remaining results, make another call with the returned
  /// <code>NextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// The token to request the next page of results.
  Future<ListApplicationsResponse> listApplications({
    String? accountId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      40,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'EC2WindowsBarleyService.ListApplications'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (accountId != null) 'AccountId': accountId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListApplicationsResponse.fromJson(jsonResponse.body);
  }

  /// Lists the auto-grouped, standalone, and custom components of the
  /// application.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceGroupName] :
  /// The name of the resource group.
  ///
  /// Parameter [accountId] :
  /// The Amazon Web Services account ID for the resource group owner.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call. To retrieve the
  /// remaining results, make another call with the returned
  /// <code>NextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// The token to request the next page of results.
  Future<ListComponentsResponse> listComponents({
    required String resourceGroupName,
    String? accountId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      40,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'EC2WindowsBarleyService.ListComponents'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceGroupName': resourceGroupName,
        if (accountId != null) 'AccountId': accountId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListComponentsResponse.fromJson(jsonResponse.body);
  }

  /// Lists the INFO, WARN, and ERROR events for periodic configuration updates
  /// performed by Application Insights. Examples of events represented are:
  ///
  /// <ul>
  /// <li>
  /// INFO: creating a new alarm or updating an alarm threshold.
  /// </li>
  /// <li>
  /// WARN: alarm not created due to insufficient data points used to predict
  /// thresholds.
  /// </li>
  /// <li>
  /// ERROR: alarm not created due to permission errors or exceeding quotas.
  /// </li>
  /// </ul>
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [accountId] :
  /// The Amazon Web Services account ID for the resource group owner.
  ///
  /// Parameter [endTime] :
  /// The end time of the event.
  ///
  /// Parameter [eventStatus] :
  /// The status of the configuration update event. Possible values include
  /// INFO, WARN, and ERROR.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results returned by
  /// <code>ListConfigurationHistory</code> in paginated output. When this
  /// parameter is used, <code>ListConfigurationHistory</code> returns only
  /// <code>MaxResults</code> in a single page along with a
  /// <code>NextToken</code> response element. The remaining results of the
  /// initial request can be seen by sending another
  /// <code>ListConfigurationHistory</code> request with the returned
  /// <code>NextToken</code> value. If this parameter is not used, then
  /// <code>ListConfigurationHistory</code> returns all results.
  ///
  /// Parameter [nextToken] :
  /// The <code>NextToken</code> value returned from a previous paginated
  /// <code>ListConfigurationHistory</code> request where
  /// <code>MaxResults</code> was used and the results exceeded the value of
  /// that parameter. Pagination continues from the end of the previous results
  /// that returned the <code>NextToken</code> value. This value is
  /// <code>null</code> when there are no more results to return.
  ///
  /// Parameter [resourceGroupName] :
  /// Resource group to which the application belongs.
  ///
  /// Parameter [startTime] :
  /// The start time of the event.
  Future<ListConfigurationHistoryResponse> listConfigurationHistory({
    String? accountId,
    DateTime? endTime,
    ConfigurationEventStatus? eventStatus,
    int? maxResults,
    String? nextToken,
    String? resourceGroupName,
    DateTime? startTime,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      40,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'EC2WindowsBarleyService.ListConfigurationHistory'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (accountId != null) 'AccountId': accountId,
        if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
        if (eventStatus != null) 'EventStatus': eventStatus.value,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (resourceGroupName != null) 'ResourceGroupName': resourceGroupName,
        if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      },
    );

    return ListConfigurationHistoryResponse.fromJson(jsonResponse.body);
  }

  /// Lists the log patterns in the specific log <code>LogPatternSet</code>.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceGroupName] :
  /// The name of the resource group.
  ///
  /// Parameter [accountId] :
  /// The Amazon Web Services account ID for the resource group owner.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call. To retrieve the
  /// remaining results, make another call with the returned
  /// <code>NextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// The token to request the next page of results.
  ///
  /// Parameter [patternSetName] :
  /// The name of the log pattern set.
  Future<ListLogPatternsResponse> listLogPatterns({
    required String resourceGroupName,
    String? accountId,
    int? maxResults,
    String? nextToken,
    String? patternSetName,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      40,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'EC2WindowsBarleyService.ListLogPatterns'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceGroupName': resourceGroupName,
        if (accountId != null) 'AccountId': accountId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (patternSetName != null) 'PatternSetName': patternSetName,
      },
    );

    return ListLogPatternsResponse.fromJson(jsonResponse.body);
  }

  /// Lists the log pattern sets in the specific application.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceGroupName] :
  /// The name of the resource group.
  ///
  /// Parameter [accountId] :
  /// The Amazon Web Services account ID for the resource group owner.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call. To retrieve the
  /// remaining results, make another call with the returned
  /// <code>NextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// The token to request the next page of results.
  Future<ListLogPatternSetsResponse> listLogPatternSets({
    required String resourceGroupName,
    String? accountId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      40,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'EC2WindowsBarleyService.ListLogPatternSets'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceGroupName': resourceGroupName,
        if (accountId != null) 'AccountId': accountId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListLogPatternSetsResponse.fromJson(jsonResponse.body);
  }

  /// Lists the problems with your application.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [accountId] :
  /// The Amazon Web Services account ID for the resource group owner.
  ///
  /// Parameter [componentName] :
  /// The name of the component.
  ///
  /// Parameter [endTime] :
  /// The time when the problem ended, in epoch seconds. If not specified,
  /// problems within the past seven days are returned.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call. To retrieve the
  /// remaining results, make another call with the returned
  /// <code>NextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// The token to request the next page of results.
  ///
  /// Parameter [resourceGroupName] :
  /// The name of the resource group.
  ///
  /// Parameter [startTime] :
  /// The time when the problem was detected, in epoch seconds. If you don't
  /// specify a time frame for the request, problems within the past seven days
  /// are returned.
  ///
  /// Parameter [visibility] :
  /// Specifies whether or not you can view the problem. If not specified,
  /// visible and ignored problems are returned.
  Future<ListProblemsResponse> listProblems({
    String? accountId,
    String? componentName,
    DateTime? endTime,
    int? maxResults,
    String? nextToken,
    String? resourceGroupName,
    DateTime? startTime,
    Visibility? visibility,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      40,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'EC2WindowsBarleyService.ListProblems'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (accountId != null) 'AccountId': accountId,
        if (componentName != null) 'ComponentName': componentName,
        if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (resourceGroupName != null) 'ResourceGroupName': resourceGroupName,
        if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
        if (visibility != null) 'Visibility': visibility.value,
      },
    );

    return ListProblemsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieve a list of the tags (keys and values) that are associated with a
  /// specified application. A <i>tag</i> is a label that you optionally define
  /// and associate with an application. Each tag consists of a required <i>tag
  /// key</i> and an optional associated <i>tag value</i>. A tag key is a
  /// general label that acts as a category for more specific tag values. A tag
  /// value acts as a descriptor within a tag key.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceARN] :
  /// The Amazon Resource Name (ARN) of the application that you want to
  /// retrieve tag information for.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceARN,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'EC2WindowsBarleyService.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceARN': resourceARN,
      },
    );

    return ListTagsForResourceResponse.fromJson(jsonResponse.body);
  }

  /// Lists the workloads that are configured on a given component.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [componentName] :
  /// The name of the component.
  ///
  /// Parameter [resourceGroupName] :
  /// The name of the resource group.
  ///
  /// Parameter [accountId] :
  /// The Amazon Web Services account ID of the owner of the workload.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call. To retrieve the
  /// remaining results, make another call with the returned
  /// <code>NextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// The token to request the next page of results.
  Future<ListWorkloadsResponse> listWorkloads({
    required String componentName,
    required String resourceGroupName,
    String? accountId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      40,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'EC2WindowsBarleyService.ListWorkloads'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ComponentName': componentName,
        'ResourceGroupName': resourceGroupName,
        if (accountId != null) 'AccountId': accountId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListWorkloadsResponse.fromJson(jsonResponse.body);
  }

  /// Remove workload from a component.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [componentName] :
  /// The name of the component.
  ///
  /// Parameter [resourceGroupName] :
  /// The name of the resource group.
  ///
  /// Parameter [workloadId] :
  /// The ID of the workload.
  Future<void> removeWorkload({
    required String componentName,
    required String resourceGroupName,
    required String workloadId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'EC2WindowsBarleyService.RemoveWorkload'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ComponentName': componentName,
        'ResourceGroupName': resourceGroupName,
        'WorkloadId': workloadId,
      },
    );
  }

  /// Add one or more tags (keys and values) to a specified application. A
  /// <i>tag</i> is a label that you optionally define and associate with an
  /// application. Tags can help you categorize and manage application in
  /// different ways, such as by purpose, owner, environment, or other criteria.
  ///
  /// Each tag consists of a required <i>tag key</i> and an associated <i>tag
  /// value</i>, both of which you define. A tag key is a general label that
  /// acts as a category for more specific tag values. A tag value acts as a
  /// descriptor within a tag key.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyTagsException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceARN] :
  /// The Amazon Resource Name (ARN) of the application that you want to add one
  /// or more tags to.
  ///
  /// Parameter [tags] :
  /// A list of tags that to add to the application. A tag consists of a
  /// required tag key (<code>Key</code>) and an associated tag value
  /// (<code>Value</code>). The maximum length of a tag key is 128 characters.
  /// The maximum length of a tag value is 256 characters.
  Future<void> tagResource({
    required String resourceARN,
    required List<Tag> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'EC2WindowsBarleyService.TagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceARN': resourceARN,
        'Tags': tags,
      },
    );
  }

  /// Remove one or more tags (keys and values) from a specified application.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceARN] :
  /// The Amazon Resource Name (ARN) of the application that you want to remove
  /// one or more tags from.
  ///
  /// Parameter [tagKeys] :
  /// The tags (tag keys) that you want to remove from the resource. When you
  /// specify a tag key, the action removes both that key and its associated tag
  /// value.
  ///
  /// To remove more than one tag from the application, append the
  /// <code>TagKeys</code> parameter and argument for each additional tag to
  /// remove, separated by an ampersand.
  Future<void> untagResource({
    required String resourceARN,
    required List<String> tagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'EC2WindowsBarleyService.UntagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceARN': resourceARN,
        'TagKeys': tagKeys,
      },
    );
  }

  /// Updates the application.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceGroupName] :
  /// The name of the resource group.
  ///
  /// Parameter [attachMissingPermission] :
  /// If set to true, the managed policies for SSM and CW will be attached to
  /// the instance roles if they are missing.
  ///
  /// Parameter [autoConfigEnabled] :
  /// Turns auto-configuration on or off.
  ///
  /// Parameter [cWEMonitorEnabled] :
  /// Indicates whether Application Insights can listen to CloudWatch events for
  /// the application resources, such as <code>instance terminated</code>,
  /// <code>failed deployment</code>, and others.
  ///
  /// Parameter [opsCenterEnabled] :
  /// When set to <code>true</code>, creates opsItems for any problems detected
  /// on an application.
  ///
  /// Parameter [opsItemSNSTopicArn] :
  /// The SNS topic provided to Application Insights that is associated to the
  /// created opsItem. Allows you to receive notifications for updates to the
  /// opsItem.
  ///
  /// Parameter [removeSNSTopic] :
  /// Disassociates the SNS topic from the opsItem created for detected
  /// problems.
  ///
  /// Parameter [sNSNotificationArn] :
  /// The SNS topic ARN. Allows you to receive SNS notifications for updates and
  /// issues with an application.
  Future<UpdateApplicationResponse> updateApplication({
    required String resourceGroupName,
    bool? attachMissingPermission,
    bool? autoConfigEnabled,
    bool? cWEMonitorEnabled,
    bool? opsCenterEnabled,
    String? opsItemSNSTopicArn,
    bool? removeSNSTopic,
    String? sNSNotificationArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'EC2WindowsBarleyService.UpdateApplication'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceGroupName': resourceGroupName,
        if (attachMissingPermission != null)
          'AttachMissingPermission': attachMissingPermission,
        if (autoConfigEnabled != null) 'AutoConfigEnabled': autoConfigEnabled,
        if (cWEMonitorEnabled != null) 'CWEMonitorEnabled': cWEMonitorEnabled,
        if (opsCenterEnabled != null) 'OpsCenterEnabled': opsCenterEnabled,
        if (opsItemSNSTopicArn != null)
          'OpsItemSNSTopicArn': opsItemSNSTopicArn,
        if (removeSNSTopic != null) 'RemoveSNSTopic': removeSNSTopic,
        if (sNSNotificationArn != null)
          'SNSNotificationArn': sNSNotificationArn,
      },
    );

    return UpdateApplicationResponse.fromJson(jsonResponse.body);
  }

  /// Updates the custom component name and/or the list of resources that make
  /// up the component.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [componentName] :
  /// The name of the component.
  ///
  /// Parameter [resourceGroupName] :
  /// The name of the resource group.
  ///
  /// Parameter [newComponentName] :
  /// The new name of the component.
  ///
  /// Parameter [resourceList] :
  /// The list of resource ARNs that belong to the component.
  Future<void> updateComponent({
    required String componentName,
    required String resourceGroupName,
    String? newComponentName,
    List<String>? resourceList,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'EC2WindowsBarleyService.UpdateComponent'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ComponentName': componentName,
        'ResourceGroupName': resourceGroupName,
        if (newComponentName != null) 'NewComponentName': newComponentName,
        if (resourceList != null) 'ResourceList': resourceList,
      },
    );
  }

  /// Updates the monitoring configurations for the component. The configuration
  /// input parameter is an escaped JSON of the configuration and should match
  /// the schema of what is returned by
  /// <code>DescribeComponentConfigurationRecommendation</code>.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [componentName] :
  /// The name of the component.
  ///
  /// Parameter [resourceGroupName] :
  /// The name of the resource group.
  ///
  /// Parameter [autoConfigEnabled] :
  /// Automatically configures the component by applying the recommended
  /// configurations.
  ///
  /// Parameter [componentConfiguration] :
  /// The configuration settings of the component. The value is the escaped JSON
  /// of the configuration. For more information about the JSON format, see <a
  /// href="https://docs.aws.amazon.com/sdk-for-javascript/v2/developer-guide/working-with-json.html">Working
  /// with JSON</a>. You can send a request to
  /// <code>DescribeComponentConfigurationRecommendation</code> to see the
  /// recommended configuration for a component. For the complete format of the
  /// component configuration file, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/component-config.html">Component
  /// Configuration</a>.
  ///
  /// Parameter [monitor] :
  /// Indicates whether the application component is monitored.
  ///
  /// Parameter [tier] :
  /// The tier of the application component.
  Future<void> updateComponentConfiguration({
    required String componentName,
    required String resourceGroupName,
    bool? autoConfigEnabled,
    String? componentConfiguration,
    bool? monitor,
    Tier? tier,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'EC2WindowsBarleyService.UpdateComponentConfiguration'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ComponentName': componentName,
        'ResourceGroupName': resourceGroupName,
        if (autoConfigEnabled != null) 'AutoConfigEnabled': autoConfigEnabled,
        if (componentConfiguration != null)
          'ComponentConfiguration': componentConfiguration,
        if (monitor != null) 'Monitor': monitor,
        if (tier != null) 'Tier': tier.value,
      },
    );
  }

  /// Adds a log pattern to a <code>LogPatternSet</code>.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [patternName] :
  /// The name of the log pattern.
  ///
  /// Parameter [patternSetName] :
  /// The name of the log pattern set.
  ///
  /// Parameter [resourceGroupName] :
  /// The name of the resource group.
  ///
  /// Parameter [pattern] :
  /// The log pattern. The pattern must be DFA compatible. Patterns that utilize
  /// forward lookahead or backreference constructions are not supported.
  ///
  /// Parameter [rank] :
  /// Rank of the log pattern. Must be a value between <code>1</code> and
  /// <code>1,000,000</code>. The patterns are sorted by rank, so we recommend
  /// that you set your highest priority patterns with the lowest rank. A
  /// pattern of rank <code>1</code> will be the first to get matched to a log
  /// line. A pattern of rank <code>1,000,000</code> will be last to get
  /// matched. When you configure custom log patterns from the console, a
  /// <code>Low</code> severity pattern translates to a <code>750,000</code>
  /// rank. A <code>Medium</code> severity pattern translates to a
  /// <code>500,000</code> rank. And a <code>High</code> severity pattern
  /// translates to a <code>250,000</code> rank. Rank values less than
  /// <code>1</code> or greater than <code>1,000,000</code> are reserved for
  /// Amazon Web Services provided patterns.
  Future<UpdateLogPatternResponse> updateLogPattern({
    required String patternName,
    required String patternSetName,
    required String resourceGroupName,
    String? pattern,
    int? rank,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'EC2WindowsBarleyService.UpdateLogPattern'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'PatternName': patternName,
        'PatternSetName': patternSetName,
        'ResourceGroupName': resourceGroupName,
        if (pattern != null) 'Pattern': pattern,
        if (rank != null) 'Rank': rank,
      },
    );

    return UpdateLogPatternResponse.fromJson(jsonResponse.body);
  }

  /// Updates the visibility of the problem or specifies the problem as
  /// <code>RESOLVED</code>.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [problemId] :
  /// The ID of the problem.
  ///
  /// Parameter [updateStatus] :
  /// The status of the problem. Arguments can be passed for only problems that
  /// show a status of <code>RECOVERING</code>.
  ///
  /// Parameter [visibility] :
  /// The visibility of a problem. When you pass a value of
  /// <code>IGNORED</code>, the problem is removed from the default view, and
  /// all notifications for the problem are suspended. When <code>VISIBLE</code>
  /// is passed, the <code>IGNORED</code> action is reversed.
  Future<void> updateProblem({
    required String problemId,
    UpdateStatus? updateStatus,
    Visibility? visibility,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'EC2WindowsBarleyService.UpdateProblem'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ProblemId': problemId,
        if (updateStatus != null) 'UpdateStatus': updateStatus.value,
        if (visibility != null) 'Visibility': visibility.value,
      },
    );
  }

  /// Adds a workload to a component. Each component can have at most five
  /// workloads.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [componentName] :
  /// The name of the component.
  ///
  /// Parameter [resourceGroupName] :
  /// The name of the resource group.
  ///
  /// Parameter [workloadConfiguration] :
  /// The configuration settings of the workload. The value is the escaped JSON
  /// of the configuration.
  ///
  /// Parameter [workloadId] :
  /// The ID of the workload.
  Future<UpdateWorkloadResponse> updateWorkload({
    required String componentName,
    required String resourceGroupName,
    required WorkloadConfiguration workloadConfiguration,
    String? workloadId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'EC2WindowsBarleyService.UpdateWorkload'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ComponentName': componentName,
        'ResourceGroupName': resourceGroupName,
        'WorkloadConfiguration': workloadConfiguration,
        if (workloadId != null) 'WorkloadId': workloadId,
      },
    );

    return UpdateWorkloadResponse.fromJson(jsonResponse.body);
  }
}

/// @nodoc
class AddWorkloadResponse {
  /// The configuration settings of the workload. The value is the escaped JSON of
  /// the configuration.
  final WorkloadConfiguration? workloadConfiguration;

  /// The ID of the workload.
  final String? workloadId;

  AddWorkloadResponse({
    this.workloadConfiguration,
    this.workloadId,
  });

  factory AddWorkloadResponse.fromJson(Map<String, dynamic> json) {
    return AddWorkloadResponse(
      workloadConfiguration: json['WorkloadConfiguration'] != null
          ? WorkloadConfiguration.fromJson(
              json['WorkloadConfiguration'] as Map<String, dynamic>)
          : null,
      workloadId: json['WorkloadId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final workloadConfiguration = this.workloadConfiguration;
    final workloadId = this.workloadId;
    return {
      if (workloadConfiguration != null)
        'WorkloadConfiguration': workloadConfiguration,
      if (workloadId != null) 'WorkloadId': workloadId,
    };
  }
}

/// @nodoc
class CreateApplicationResponse {
  /// Information about the application.
  final ApplicationInfo? applicationInfo;

  CreateApplicationResponse({
    this.applicationInfo,
  });

  factory CreateApplicationResponse.fromJson(Map<String, dynamic> json) {
    return CreateApplicationResponse(
      applicationInfo: json['ApplicationInfo'] != null
          ? ApplicationInfo.fromJson(
              json['ApplicationInfo'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationInfo = this.applicationInfo;
    return {
      if (applicationInfo != null) 'ApplicationInfo': applicationInfo,
    };
  }
}

/// @nodoc
class CreateComponentResponse {
  CreateComponentResponse();

  factory CreateComponentResponse.fromJson(Map<String, dynamic> _) {
    return CreateComponentResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class CreateLogPatternResponse {
  /// The successfully created log pattern.
  final LogPattern? logPattern;

  /// The name of the resource group.
  final String? resourceGroupName;

  CreateLogPatternResponse({
    this.logPattern,
    this.resourceGroupName,
  });

  factory CreateLogPatternResponse.fromJson(Map<String, dynamic> json) {
    return CreateLogPatternResponse(
      logPattern: json['LogPattern'] != null
          ? LogPattern.fromJson(json['LogPattern'] as Map<String, dynamic>)
          : null,
      resourceGroupName: json['ResourceGroupName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final logPattern = this.logPattern;
    final resourceGroupName = this.resourceGroupName;
    return {
      if (logPattern != null) 'LogPattern': logPattern,
      if (resourceGroupName != null) 'ResourceGroupName': resourceGroupName,
    };
  }
}

/// @nodoc
class DeleteApplicationResponse {
  DeleteApplicationResponse();

  factory DeleteApplicationResponse.fromJson(Map<String, dynamic> _) {
    return DeleteApplicationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class DeleteComponentResponse {
  DeleteComponentResponse();

  factory DeleteComponentResponse.fromJson(Map<String, dynamic> _) {
    return DeleteComponentResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class DeleteLogPatternResponse {
  DeleteLogPatternResponse();

  factory DeleteLogPatternResponse.fromJson(Map<String, dynamic> _) {
    return DeleteLogPatternResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class DescribeApplicationResponse {
  /// Information about the application.
  final ApplicationInfo? applicationInfo;

  DescribeApplicationResponse({
    this.applicationInfo,
  });

  factory DescribeApplicationResponse.fromJson(Map<String, dynamic> json) {
    return DescribeApplicationResponse(
      applicationInfo: json['ApplicationInfo'] != null
          ? ApplicationInfo.fromJson(
              json['ApplicationInfo'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationInfo = this.applicationInfo;
    return {
      if (applicationInfo != null) 'ApplicationInfo': applicationInfo,
    };
  }
}

/// @nodoc
class DescribeComponentResponse {
  final ApplicationComponent? applicationComponent;

  /// The list of resource ARNs that belong to the component.
  final List<String>? resourceList;

  DescribeComponentResponse({
    this.applicationComponent,
    this.resourceList,
  });

  factory DescribeComponentResponse.fromJson(Map<String, dynamic> json) {
    return DescribeComponentResponse(
      applicationComponent: json['ApplicationComponent'] != null
          ? ApplicationComponent.fromJson(
              json['ApplicationComponent'] as Map<String, dynamic>)
          : null,
      resourceList: (json['ResourceList'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationComponent = this.applicationComponent;
    final resourceList = this.resourceList;
    return {
      if (applicationComponent != null)
        'ApplicationComponent': applicationComponent,
      if (resourceList != null) 'ResourceList': resourceList,
    };
  }
}

/// @nodoc
class DescribeComponentConfigurationResponse {
  /// The configuration settings of the component. The value is the escaped JSON
  /// of the configuration.
  final String? componentConfiguration;

  /// Indicates whether the application component is monitored.
  final bool? monitor;

  /// The tier of the application component. Supported tiers include
  /// <code>DOT_NET_CORE</code>, <code>DOT_NET_WORKER</code>,
  /// <code>DOT_NET_WEB</code>, <code>SQL_SERVER</code>, and <code>DEFAULT</code>
  final Tier? tier;

  DescribeComponentConfigurationResponse({
    this.componentConfiguration,
    this.monitor,
    this.tier,
  });

  factory DescribeComponentConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeComponentConfigurationResponse(
      componentConfiguration: json['ComponentConfiguration'] as String?,
      monitor: json['Monitor'] as bool?,
      tier: (json['Tier'] as String?)?.let(Tier.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final componentConfiguration = this.componentConfiguration;
    final monitor = this.monitor;
    final tier = this.tier;
    return {
      if (componentConfiguration != null)
        'ComponentConfiguration': componentConfiguration,
      if (monitor != null) 'Monitor': monitor,
      if (tier != null) 'Tier': tier.value,
    };
  }
}

/// @nodoc
class DescribeComponentConfigurationRecommendationResponse {
  /// The recommended configuration settings of the component. The value is the
  /// escaped JSON of the configuration.
  final String? componentConfiguration;

  DescribeComponentConfigurationRecommendationResponse({
    this.componentConfiguration,
  });

  factory DescribeComponentConfigurationRecommendationResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeComponentConfigurationRecommendationResponse(
      componentConfiguration: json['ComponentConfiguration'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final componentConfiguration = this.componentConfiguration;
    return {
      if (componentConfiguration != null)
        'ComponentConfiguration': componentConfiguration,
    };
  }
}

/// @nodoc
class DescribeLogPatternResponse {
  /// The Amazon Web Services account ID for the resource group owner.
  final String? accountId;

  /// The successfully created log pattern.
  final LogPattern? logPattern;

  /// The name of the resource group.
  final String? resourceGroupName;

  DescribeLogPatternResponse({
    this.accountId,
    this.logPattern,
    this.resourceGroupName,
  });

  factory DescribeLogPatternResponse.fromJson(Map<String, dynamic> json) {
    return DescribeLogPatternResponse(
      accountId: json['AccountId'] as String?,
      logPattern: json['LogPattern'] != null
          ? LogPattern.fromJson(json['LogPattern'] as Map<String, dynamic>)
          : null,
      resourceGroupName: json['ResourceGroupName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final logPattern = this.logPattern;
    final resourceGroupName = this.resourceGroupName;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (logPattern != null) 'LogPattern': logPattern,
      if (resourceGroupName != null) 'ResourceGroupName': resourceGroupName,
    };
  }
}

/// @nodoc
class DescribeObservationResponse {
  /// Information about the observation.
  final Observation? observation;

  DescribeObservationResponse({
    this.observation,
  });

  factory DescribeObservationResponse.fromJson(Map<String, dynamic> json) {
    return DescribeObservationResponse(
      observation: json['Observation'] != null
          ? Observation.fromJson(json['Observation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final observation = this.observation;
    return {
      if (observation != null) 'Observation': observation,
    };
  }
}

/// @nodoc
class DescribeProblemResponse {
  /// Information about the problem.
  final Problem? problem;

  /// The SNS notification topic ARN of the problem.
  final String? sNSNotificationArn;

  DescribeProblemResponse({
    this.problem,
    this.sNSNotificationArn,
  });

  factory DescribeProblemResponse.fromJson(Map<String, dynamic> json) {
    return DescribeProblemResponse(
      problem: json['Problem'] != null
          ? Problem.fromJson(json['Problem'] as Map<String, dynamic>)
          : null,
      sNSNotificationArn: json['SNSNotificationArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final problem = this.problem;
    final sNSNotificationArn = this.sNSNotificationArn;
    return {
      if (problem != null) 'Problem': problem,
      if (sNSNotificationArn != null) 'SNSNotificationArn': sNSNotificationArn,
    };
  }
}

/// @nodoc
class DescribeProblemObservationsResponse {
  /// Observations related to the problem.
  final RelatedObservations? relatedObservations;

  DescribeProblemObservationsResponse({
    this.relatedObservations,
  });

  factory DescribeProblemObservationsResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeProblemObservationsResponse(
      relatedObservations: json['RelatedObservations'] != null
          ? RelatedObservations.fromJson(
              json['RelatedObservations'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final relatedObservations = this.relatedObservations;
    return {
      if (relatedObservations != null)
        'RelatedObservations': relatedObservations,
    };
  }
}

/// @nodoc
class DescribeWorkloadResponse {
  /// The configuration settings of the workload. The value is the escaped JSON of
  /// the configuration.
  final WorkloadConfiguration? workloadConfiguration;

  /// The ID of the workload.
  final String? workloadId;

  /// If logging is supported for the resource type, shows whether the component
  /// has configured logs to be monitored.
  final String? workloadRemarks;

  DescribeWorkloadResponse({
    this.workloadConfiguration,
    this.workloadId,
    this.workloadRemarks,
  });

  factory DescribeWorkloadResponse.fromJson(Map<String, dynamic> json) {
    return DescribeWorkloadResponse(
      workloadConfiguration: json['WorkloadConfiguration'] != null
          ? WorkloadConfiguration.fromJson(
              json['WorkloadConfiguration'] as Map<String, dynamic>)
          : null,
      workloadId: json['WorkloadId'] as String?,
      workloadRemarks: json['WorkloadRemarks'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final workloadConfiguration = this.workloadConfiguration;
    final workloadId = this.workloadId;
    final workloadRemarks = this.workloadRemarks;
    return {
      if (workloadConfiguration != null)
        'WorkloadConfiguration': workloadConfiguration,
      if (workloadId != null) 'WorkloadId': workloadId,
      if (workloadRemarks != null) 'WorkloadRemarks': workloadRemarks,
    };
  }
}

/// @nodoc
class ListApplicationsResponse {
  /// The list of applications.
  final List<ApplicationInfo>? applicationInfoList;

  /// The token used to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  final String? nextToken;

  ListApplicationsResponse({
    this.applicationInfoList,
    this.nextToken,
  });

  factory ListApplicationsResponse.fromJson(Map<String, dynamic> json) {
    return ListApplicationsResponse(
      applicationInfoList: (json['ApplicationInfoList'] as List?)
          ?.nonNulls
          .map((e) => ApplicationInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationInfoList = this.applicationInfoList;
    final nextToken = this.nextToken;
    return {
      if (applicationInfoList != null)
        'ApplicationInfoList': applicationInfoList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class ListComponentsResponse {
  /// The list of application components.
  final List<ApplicationComponent>? applicationComponentList;

  /// The token to request the next page of results.
  final String? nextToken;

  ListComponentsResponse({
    this.applicationComponentList,
    this.nextToken,
  });

  factory ListComponentsResponse.fromJson(Map<String, dynamic> json) {
    return ListComponentsResponse(
      applicationComponentList: (json['ApplicationComponentList'] as List?)
          ?.nonNulls
          .map((e) => ApplicationComponent.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationComponentList = this.applicationComponentList;
    final nextToken = this.nextToken;
    return {
      if (applicationComponentList != null)
        'ApplicationComponentList': applicationComponentList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class ListConfigurationHistoryResponse {
  /// The list of configuration events and their corresponding details.
  final List<ConfigurationEvent>? eventList;

  /// The <code>NextToken</code> value to include in a future
  /// <code>ListConfigurationHistory</code> request. When the results of a
  /// <code>ListConfigurationHistory</code> request exceed
  /// <code>MaxResults</code>, this value can be used to retrieve the next page of
  /// results. This value is <code>null</code> when there are no more results to
  /// return.
  final String? nextToken;

  ListConfigurationHistoryResponse({
    this.eventList,
    this.nextToken,
  });

  factory ListConfigurationHistoryResponse.fromJson(Map<String, dynamic> json) {
    return ListConfigurationHistoryResponse(
      eventList: (json['EventList'] as List?)
          ?.nonNulls
          .map((e) => ConfigurationEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final eventList = this.eventList;
    final nextToken = this.nextToken;
    return {
      if (eventList != null) 'EventList': eventList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class ListLogPatternsResponse {
  /// The Amazon Web Services account ID for the resource group owner.
  final String? accountId;

  /// The list of log patterns.
  final List<LogPattern>? logPatterns;

  /// The token used to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  final String? nextToken;

  /// The name of the resource group.
  final String? resourceGroupName;

  ListLogPatternsResponse({
    this.accountId,
    this.logPatterns,
    this.nextToken,
    this.resourceGroupName,
  });

  factory ListLogPatternsResponse.fromJson(Map<String, dynamic> json) {
    return ListLogPatternsResponse(
      accountId: json['AccountId'] as String?,
      logPatterns: (json['LogPatterns'] as List?)
          ?.nonNulls
          .map((e) => LogPattern.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
      resourceGroupName: json['ResourceGroupName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final logPatterns = this.logPatterns;
    final nextToken = this.nextToken;
    final resourceGroupName = this.resourceGroupName;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (logPatterns != null) 'LogPatterns': logPatterns,
      if (nextToken != null) 'NextToken': nextToken,
      if (resourceGroupName != null) 'ResourceGroupName': resourceGroupName,
    };
  }
}

/// @nodoc
class ListLogPatternSetsResponse {
  /// The Amazon Web Services account ID for the resource group owner.
  final String? accountId;

  /// The list of log pattern sets.
  final List<String>? logPatternSets;

  /// The token used to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  final String? nextToken;

  /// The name of the resource group.
  final String? resourceGroupName;

  ListLogPatternSetsResponse({
    this.accountId,
    this.logPatternSets,
    this.nextToken,
    this.resourceGroupName,
  });

  factory ListLogPatternSetsResponse.fromJson(Map<String, dynamic> json) {
    return ListLogPatternSetsResponse(
      accountId: json['AccountId'] as String?,
      logPatternSets: (json['LogPatternSets'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      nextToken: json['NextToken'] as String?,
      resourceGroupName: json['ResourceGroupName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final logPatternSets = this.logPatternSets;
    final nextToken = this.nextToken;
    final resourceGroupName = this.resourceGroupName;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (logPatternSets != null) 'LogPatternSets': logPatternSets,
      if (nextToken != null) 'NextToken': nextToken,
      if (resourceGroupName != null) 'ResourceGroupName': resourceGroupName,
    };
  }
}

/// @nodoc
class ListProblemsResponse {
  /// The Amazon Web Services account ID for the resource group owner.
  final String? accountId;

  /// The token used to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  final String? nextToken;

  /// The list of problems.
  final List<Problem>? problemList;

  /// The name of the resource group.
  final String? resourceGroupName;

  ListProblemsResponse({
    this.accountId,
    this.nextToken,
    this.problemList,
    this.resourceGroupName,
  });

  factory ListProblemsResponse.fromJson(Map<String, dynamic> json) {
    return ListProblemsResponse(
      accountId: json['AccountId'] as String?,
      nextToken: json['NextToken'] as String?,
      problemList: (json['ProblemList'] as List?)
          ?.nonNulls
          .map((e) => Problem.fromJson(e as Map<String, dynamic>))
          .toList(),
      resourceGroupName: json['ResourceGroupName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final nextToken = this.nextToken;
    final problemList = this.problemList;
    final resourceGroupName = this.resourceGroupName;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (nextToken != null) 'NextToken': nextToken,
      if (problemList != null) 'ProblemList': problemList,
      if (resourceGroupName != null) 'ResourceGroupName': resourceGroupName,
    };
  }
}

/// @nodoc
class ListTagsForResourceResponse {
  /// An array that lists all the tags that are associated with the application.
  /// Each tag consists of a required tag key (<code>Key</code>) and an associated
  /// tag value (<code>Value</code>).
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
class ListWorkloadsResponse {
  /// The token to request the next page of results.
  final String? nextToken;

  /// The list of workloads.
  final List<Workload>? workloadList;

  ListWorkloadsResponse({
    this.nextToken,
    this.workloadList,
  });

  factory ListWorkloadsResponse.fromJson(Map<String, dynamic> json) {
    return ListWorkloadsResponse(
      nextToken: json['NextToken'] as String?,
      workloadList: (json['WorkloadList'] as List?)
          ?.nonNulls
          .map((e) => Workload.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final workloadList = this.workloadList;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (workloadList != null) 'WorkloadList': workloadList,
    };
  }
}

/// @nodoc
class RemoveWorkloadResponse {
  RemoveWorkloadResponse();

  factory RemoveWorkloadResponse.fromJson(Map<String, dynamic> _) {
    return RemoveWorkloadResponse();
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
class UpdateApplicationResponse {
  /// Information about the application.
  final ApplicationInfo? applicationInfo;

  UpdateApplicationResponse({
    this.applicationInfo,
  });

  factory UpdateApplicationResponse.fromJson(Map<String, dynamic> json) {
    return UpdateApplicationResponse(
      applicationInfo: json['ApplicationInfo'] != null
          ? ApplicationInfo.fromJson(
              json['ApplicationInfo'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationInfo = this.applicationInfo;
    return {
      if (applicationInfo != null) 'ApplicationInfo': applicationInfo,
    };
  }
}

/// @nodoc
class UpdateComponentResponse {
  UpdateComponentResponse();

  factory UpdateComponentResponse.fromJson(Map<String, dynamic> _) {
    return UpdateComponentResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class UpdateComponentConfigurationResponse {
  UpdateComponentConfigurationResponse();

  factory UpdateComponentConfigurationResponse.fromJson(
      Map<String, dynamic> _) {
    return UpdateComponentConfigurationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class UpdateLogPatternResponse {
  /// The successfully created log pattern.
  final LogPattern? logPattern;

  /// The name of the resource group.
  final String? resourceGroupName;

  UpdateLogPatternResponse({
    this.logPattern,
    this.resourceGroupName,
  });

  factory UpdateLogPatternResponse.fromJson(Map<String, dynamic> json) {
    return UpdateLogPatternResponse(
      logPattern: json['LogPattern'] != null
          ? LogPattern.fromJson(json['LogPattern'] as Map<String, dynamic>)
          : null,
      resourceGroupName: json['ResourceGroupName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final logPattern = this.logPattern;
    final resourceGroupName = this.resourceGroupName;
    return {
      if (logPattern != null) 'LogPattern': logPattern,
      if (resourceGroupName != null) 'ResourceGroupName': resourceGroupName,
    };
  }
}

/// @nodoc
class UpdateProblemResponse {
  UpdateProblemResponse();

  factory UpdateProblemResponse.fromJson(Map<String, dynamic> _) {
    return UpdateProblemResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class UpdateWorkloadResponse {
  /// The configuration settings of the workload. The value is the escaped JSON of
  /// the configuration.
  final WorkloadConfiguration? workloadConfiguration;

  /// The ID of the workload.
  final String? workloadId;

  UpdateWorkloadResponse({
    this.workloadConfiguration,
    this.workloadId,
  });

  factory UpdateWorkloadResponse.fromJson(Map<String, dynamic> json) {
    return UpdateWorkloadResponse(
      workloadConfiguration: json['WorkloadConfiguration'] != null
          ? WorkloadConfiguration.fromJson(
              json['WorkloadConfiguration'] as Map<String, dynamic>)
          : null,
      workloadId: json['WorkloadId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final workloadConfiguration = this.workloadConfiguration;
    final workloadId = this.workloadId;
    return {
      if (workloadConfiguration != null)
        'WorkloadConfiguration': workloadConfiguration,
      if (workloadId != null) 'WorkloadId': workloadId,
    };
  }
}

/// The configuration of the workload.
///
/// @nodoc
class WorkloadConfiguration {
  /// The configuration settings of the workload.
  final String? configuration;

  /// The configuration of the workload tier.
  final Tier? tier;

  /// The name of the workload.
  final String? workloadName;

  WorkloadConfiguration({
    this.configuration,
    this.tier,
    this.workloadName,
  });

  factory WorkloadConfiguration.fromJson(Map<String, dynamic> json) {
    return WorkloadConfiguration(
      configuration: json['Configuration'] as String?,
      tier: (json['Tier'] as String?)?.let(Tier.fromString),
      workloadName: json['WorkloadName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    final tier = this.tier;
    final workloadName = this.workloadName;
    return {
      if (configuration != null) 'Configuration': configuration,
      if (tier != null) 'Tier': tier.value,
      if (workloadName != null) 'WorkloadName': workloadName,
    };
  }
}

/// @nodoc
class Tier {
  static const custom = Tier._('CUSTOM');
  static const $default = Tier._('DEFAULT');
  static const dotNetCore = Tier._('DOT_NET_CORE');
  static const dotNetWorker = Tier._('DOT_NET_WORKER');
  static const dotNetWebTier = Tier._('DOT_NET_WEB_TIER');
  static const dotNetWeb = Tier._('DOT_NET_WEB');
  static const sqlServer = Tier._('SQL_SERVER');
  static const sqlServerAlwaysonAvailabilityGroup =
      Tier._('SQL_SERVER_ALWAYSON_AVAILABILITY_GROUP');
  static const mysql = Tier._('MYSQL');
  static const postgresql = Tier._('POSTGRESQL');
  static const javaJmx = Tier._('JAVA_JMX');
  static const oracle = Tier._('ORACLE');
  static const sapHanaMultiNode = Tier._('SAP_HANA_MULTI_NODE');
  static const sapHanaSingleNode = Tier._('SAP_HANA_SINGLE_NODE');
  static const sapHanaHighAvailability = Tier._('SAP_HANA_HIGH_AVAILABILITY');
  static const sapAseSingleNode = Tier._('SAP_ASE_SINGLE_NODE');
  static const sapAseHighAvailability = Tier._('SAP_ASE_HIGH_AVAILABILITY');
  static const sqlServerFailoverClusterInstance =
      Tier._('SQL_SERVER_FAILOVER_CLUSTER_INSTANCE');
  static const sharepoint = Tier._('SHAREPOINT');
  static const activeDirectory = Tier._('ACTIVE_DIRECTORY');
  static const sapNetweaverStandard = Tier._('SAP_NETWEAVER_STANDARD');
  static const sapNetweaverDistributed = Tier._('SAP_NETWEAVER_DISTRIBUTED');
  static const sapNetweaverHighAvailability =
      Tier._('SAP_NETWEAVER_HIGH_AVAILABILITY');

  final String value;

  const Tier._(this.value);

  static const values = [
    custom,
    $default,
    dotNetCore,
    dotNetWorker,
    dotNetWebTier,
    dotNetWeb,
    sqlServer,
    sqlServerAlwaysonAvailabilityGroup,
    mysql,
    postgresql,
    javaJmx,
    oracle,
    sapHanaMultiNode,
    sapHanaSingleNode,
    sapHanaHighAvailability,
    sapAseSingleNode,
    sapAseHighAvailability,
    sqlServerFailoverClusterInstance,
    sharepoint,
    activeDirectory,
    sapNetweaverStandard,
    sapNetweaverDistributed,
    sapNetweaverHighAvailability
  ];

  static Tier fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Tier._(value));

  @override
  bool operator ==(other) => other is Tier && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class UpdateStatus {
  static const resolved = UpdateStatus._('RESOLVED');

  final String value;

  const UpdateStatus._(this.value);

  static const values = [resolved];

  static UpdateStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => UpdateStatus._(value));

  @override
  bool operator ==(other) => other is UpdateStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class Visibility {
  static const ignored = Visibility._('IGNORED');
  static const visible = Visibility._('VISIBLE');

  final String value;

  const Visibility._(this.value);

  static const values = [ignored, visible];

  static Visibility fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => Visibility._(value));

  @override
  bool operator ==(other) => other is Visibility && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An object that defines the log patterns that belongs to a
/// <code>LogPatternSet</code>.
///
/// @nodoc
class LogPattern {
  /// A regular expression that defines the log pattern. A log pattern can contain
  /// as many as 50 characters, and it cannot be empty. The pattern must be DFA
  /// compatible. Patterns that utilize forward lookahead or backreference
  /// constructions are not supported.
  final String? pattern;

  /// The name of the log pattern. A log pattern name can contain as many as 50
  /// characters, and it cannot be empty. The characters can be Unicode letters,
  /// digits, or one of the following symbols: period, dash, underscore.
  final String? patternName;

  /// The name of the log pattern. A log pattern name can contain as many as 30
  /// characters, and it cannot be empty. The characters can be Unicode letters,
  /// digits, or one of the following symbols: period, dash, underscore.
  final String? patternSetName;

  /// Rank of the log pattern. Must be a value between <code>1</code> and
  /// <code>1,000,000</code>. The patterns are sorted by rank, so we recommend
  /// that you set your highest priority patterns with the lowest rank. A pattern
  /// of rank <code>1</code> will be the first to get matched to a log line. A
  /// pattern of rank <code>1,000,000</code> will be last to get matched. When you
  /// configure custom log patterns from the console, a <code>Low</code> severity
  /// pattern translates to a <code>750,000</code> rank. A <code>Medium</code>
  /// severity pattern translates to a <code>500,000</code> rank. And a
  /// <code>High</code> severity pattern translates to a <code>250,000</code>
  /// rank. Rank values less than <code>1</code> or greater than
  /// <code>1,000,000</code> are reserved for Amazon Web Services provided
  /// patterns.
  final int? rank;

  LogPattern({
    this.pattern,
    this.patternName,
    this.patternSetName,
    this.rank,
  });

  factory LogPattern.fromJson(Map<String, dynamic> json) {
    return LogPattern(
      pattern: json['Pattern'] as String?,
      patternName: json['PatternName'] as String?,
      patternSetName: json['PatternSetName'] as String?,
      rank: json['Rank'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final pattern = this.pattern;
    final patternName = this.patternName;
    final patternSetName = this.patternSetName;
    final rank = this.rank;
    return {
      if (pattern != null) 'Pattern': pattern,
      if (patternName != null) 'PatternName': patternName,
      if (patternSetName != null) 'PatternSetName': patternSetName,
      if (rank != null) 'Rank': rank,
    };
  }
}

/// Describes the status of the application.
///
/// @nodoc
class ApplicationInfo {
  /// The Amazon Web Services account ID for the owner of the application.
  final String? accountId;

  /// If set to true, the managed policies for SSM and CW will be attached to the
  /// instance roles if they are missing.
  final bool? attachMissingPermission;

  /// Indicates whether auto-configuration is turned on for this application.
  final bool? autoConfigEnabled;

  /// Indicates whether Application Insights can listen to CloudWatch events for
  /// the application resources, such as <code>instance terminated</code>,
  /// <code>failed deployment</code>, and others.
  final bool? cWEMonitorEnabled;

  /// The method used by Application Insights to onboard your resources.
  final DiscoveryType? discoveryType;

  /// The lifecycle of the application.
  final String? lifeCycle;

  /// Indicates whether Application Insights will create opsItems for any problem
  /// detected by Application Insights for an application.
  final bool? opsCenterEnabled;

  /// The SNS topic provided to Application Insights that is associated to the
  /// created opsItems to receive SNS notifications for opsItem updates.
  final String? opsItemSNSTopicArn;

  /// The issues on the user side that block Application Insights from
  /// successfully monitoring an application. Example remarks include:
  ///
  /// <ul>
  /// <li>
  /// “Configuring application, detected 1 Errors, 3 Warnings”
  /// </li>
  /// <li>
  /// “Configuring application, detected 1 Unconfigured Components”
  /// </li>
  /// </ul>
  final String? remarks;

  /// The name of the resource group used for the application.
  final String? resourceGroupName;

  /// The SNS topic ARN that is associated with SNS notifications for updates or
  /// issues.
  final String? sNSNotificationArn;

  ApplicationInfo({
    this.accountId,
    this.attachMissingPermission,
    this.autoConfigEnabled,
    this.cWEMonitorEnabled,
    this.discoveryType,
    this.lifeCycle,
    this.opsCenterEnabled,
    this.opsItemSNSTopicArn,
    this.remarks,
    this.resourceGroupName,
    this.sNSNotificationArn,
  });

  factory ApplicationInfo.fromJson(Map<String, dynamic> json) {
    return ApplicationInfo(
      accountId: json['AccountId'] as String?,
      attachMissingPermission: json['AttachMissingPermission'] as bool?,
      autoConfigEnabled: json['AutoConfigEnabled'] as bool?,
      cWEMonitorEnabled: json['CWEMonitorEnabled'] as bool?,
      discoveryType:
          (json['DiscoveryType'] as String?)?.let(DiscoveryType.fromString),
      lifeCycle: json['LifeCycle'] as String?,
      opsCenterEnabled: json['OpsCenterEnabled'] as bool?,
      opsItemSNSTopicArn: json['OpsItemSNSTopicArn'] as String?,
      remarks: json['Remarks'] as String?,
      resourceGroupName: json['ResourceGroupName'] as String?,
      sNSNotificationArn: json['SNSNotificationArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final attachMissingPermission = this.attachMissingPermission;
    final autoConfigEnabled = this.autoConfigEnabled;
    final cWEMonitorEnabled = this.cWEMonitorEnabled;
    final discoveryType = this.discoveryType;
    final lifeCycle = this.lifeCycle;
    final opsCenterEnabled = this.opsCenterEnabled;
    final opsItemSNSTopicArn = this.opsItemSNSTopicArn;
    final remarks = this.remarks;
    final resourceGroupName = this.resourceGroupName;
    final sNSNotificationArn = this.sNSNotificationArn;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (attachMissingPermission != null)
        'AttachMissingPermission': attachMissingPermission,
      if (autoConfigEnabled != null) 'AutoConfigEnabled': autoConfigEnabled,
      if (cWEMonitorEnabled != null) 'CWEMonitorEnabled': cWEMonitorEnabled,
      if (discoveryType != null) 'DiscoveryType': discoveryType.value,
      if (lifeCycle != null) 'LifeCycle': lifeCycle,
      if (opsCenterEnabled != null) 'OpsCenterEnabled': opsCenterEnabled,
      if (opsItemSNSTopicArn != null) 'OpsItemSNSTopicArn': opsItemSNSTopicArn,
      if (remarks != null) 'Remarks': remarks,
      if (resourceGroupName != null) 'ResourceGroupName': resourceGroupName,
      if (sNSNotificationArn != null) 'SNSNotificationArn': sNSNotificationArn,
    };
  }
}

/// @nodoc
class DiscoveryType {
  static const resourceGroupBased = DiscoveryType._('RESOURCE_GROUP_BASED');
  static const accountBased = DiscoveryType._('ACCOUNT_BASED');

  final String value;

  const DiscoveryType._(this.value);

  static const values = [resourceGroupBased, accountBased];

  static DiscoveryType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DiscoveryType._(value));

  @override
  bool operator ==(other) => other is DiscoveryType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An object that defines the tags associated with an application. A <i>tag</i>
/// is a label that you optionally define and associate with an application.
/// Tags can help you categorize and manage resources in different ways, such as
/// by purpose, owner, environment, or other criteria.
///
/// Each tag consists of a required <i>tag key</i> and an associated <i>tag
/// value</i>, both of which you define. A tag key is a general label that acts
/// as a category for a more specific tag value. A tag value acts as a
/// descriptor within a tag key. A tag key can contain as many as 128
/// characters. A tag value can contain as many as 256 characters. The
/// characters can be Unicode letters, digits, white space, or one of the
/// following symbols: _ . : / = + -. The following additional restrictions
/// apply to tags:
///
/// <ul>
/// <li>
/// Tag keys and values are case sensitive.
/// </li>
/// <li>
/// For each associated resource, each tag key must be unique and it can have
/// only one value.
/// </li>
/// <li>
/// The <code>aws:</code> prefix is reserved for use by Amazon Web Services; you
/// can’t use it in any tag keys or values that you define. In addition, you
/// can't edit or remove tag keys or values that use this prefix.
/// </li>
/// </ul>
///
/// @nodoc
class Tag {
  /// One part of a key-value pair that defines a tag. The maximum length of a tag
  /// key is 128 characters. The minimum length is 1 character.
  final String key;

  /// The optional part of a key-value pair that defines a tag. The maximum length
  /// of a tag value is 256 characters. The minimum length is 0 characters. If you
  /// don't want an application to have a specific tag value, don't specify a
  /// value for this parameter.
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

/// Describes the workloads on a component.
///
/// @nodoc
class Workload {
  /// The name of the component.
  final String? componentName;

  /// Indicates whether all of the component configurations required to monitor a
  /// workload were provided.
  final bool? missingWorkloadConfig;

  /// The tier of the workload.
  final Tier? tier;

  /// The ID of the workload.
  final String? workloadId;

  /// The name of the workload.
  final String? workloadName;

  /// If logging is supported for the resource type, shows whether the component
  /// has configured logs to be monitored.
  final String? workloadRemarks;

  Workload({
    this.componentName,
    this.missingWorkloadConfig,
    this.tier,
    this.workloadId,
    this.workloadName,
    this.workloadRemarks,
  });

  factory Workload.fromJson(Map<String, dynamic> json) {
    return Workload(
      componentName: json['ComponentName'] as String?,
      missingWorkloadConfig: json['MissingWorkloadConfig'] as bool?,
      tier: (json['Tier'] as String?)?.let(Tier.fromString),
      workloadId: json['WorkloadId'] as String?,
      workloadName: json['WorkloadName'] as String?,
      workloadRemarks: json['WorkloadRemarks'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final componentName = this.componentName;
    final missingWorkloadConfig = this.missingWorkloadConfig;
    final tier = this.tier;
    final workloadId = this.workloadId;
    final workloadName = this.workloadName;
    final workloadRemarks = this.workloadRemarks;
    return {
      if (componentName != null) 'ComponentName': componentName,
      if (missingWorkloadConfig != null)
        'MissingWorkloadConfig': missingWorkloadConfig,
      if (tier != null) 'Tier': tier.value,
      if (workloadId != null) 'WorkloadId': workloadId,
      if (workloadName != null) 'WorkloadName': workloadName,
      if (workloadRemarks != null) 'WorkloadRemarks': workloadRemarks,
    };
  }
}

/// Describes a problem that is detected by correlating observations.
///
/// @nodoc
class Problem {
  /// The Amazon Web Services account ID for the owner of the resource group
  /// affected by the problem.
  final String? accountId;

  /// The resource affected by the problem.
  final String? affectedResource;

  /// The time when the problem ended, in epoch seconds.
  final DateTime? endTime;

  /// Feedback provided by the user about the problem.
  final Map<FeedbackKey, FeedbackValue>? feedback;

  /// The ID of the problem.
  final String? id;

  /// A detailed analysis of the problem using machine learning.
  final String? insights;

  /// The last time that the problem reoccurred after its last resolution.
  final DateTime? lastRecurrenceTime;

  /// The number of times that the same problem reoccurred after the first time it
  /// was resolved.
  final int? recurringCount;

  /// Specifies how the problem was resolved. If the value is
  /// <code>AUTOMATIC</code>, the system resolved the problem. If the value is
  /// <code>MANUAL</code>, the user resolved the problem. If the value is
  /// <code>UNRESOLVED</code>, then the problem is not resolved.
  final ResolutionMethod? resolutionMethod;

  /// The name of the resource group affected by the problem.
  final String? resourceGroupName;

  /// A measure of the level of impact of the problem.
  final SeverityLevel? severityLevel;

  /// The short name of the problem associated with the SNS notification.
  final String? shortName;

  /// The time when the problem started, in epoch seconds.
  final DateTime? startTime;

  /// The status of the problem.
  final Status? status;

  /// The name of the problem.
  final String? title;

  /// Specifies whether or not you can view the problem. Updates to ignored
  /// problems do not generate notifications.
  final Visibility? visibility;

  Problem({
    this.accountId,
    this.affectedResource,
    this.endTime,
    this.feedback,
    this.id,
    this.insights,
    this.lastRecurrenceTime,
    this.recurringCount,
    this.resolutionMethod,
    this.resourceGroupName,
    this.severityLevel,
    this.shortName,
    this.startTime,
    this.status,
    this.title,
    this.visibility,
  });

  factory Problem.fromJson(Map<String, dynamic> json) {
    return Problem(
      accountId: json['AccountId'] as String?,
      affectedResource: json['AffectedResource'] as String?,
      endTime: timeStampFromJson(json['EndTime']),
      feedback: (json['Feedback'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(FeedbackKey.fromString(k),
              FeedbackValue.fromString((e as String)))),
      id: json['Id'] as String?,
      insights: json['Insights'] as String?,
      lastRecurrenceTime: timeStampFromJson(json['LastRecurrenceTime']),
      recurringCount: json['RecurringCount'] as int?,
      resolutionMethod: (json['ResolutionMethod'] as String?)
          ?.let(ResolutionMethod.fromString),
      resourceGroupName: json['ResourceGroupName'] as String?,
      severityLevel:
          (json['SeverityLevel'] as String?)?.let(SeverityLevel.fromString),
      shortName: json['ShortName'] as String?,
      startTime: timeStampFromJson(json['StartTime']),
      status: (json['Status'] as String?)?.let(Status.fromString),
      title: json['Title'] as String?,
      visibility: (json['Visibility'] as String?)?.let(Visibility.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final affectedResource = this.affectedResource;
    final endTime = this.endTime;
    final feedback = this.feedback;
    final id = this.id;
    final insights = this.insights;
    final lastRecurrenceTime = this.lastRecurrenceTime;
    final recurringCount = this.recurringCount;
    final resolutionMethod = this.resolutionMethod;
    final resourceGroupName = this.resourceGroupName;
    final severityLevel = this.severityLevel;
    final shortName = this.shortName;
    final startTime = this.startTime;
    final status = this.status;
    final title = this.title;
    final visibility = this.visibility;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (affectedResource != null) 'AffectedResource': affectedResource,
      if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
      if (feedback != null)
        'Feedback': feedback.map((k, e) => MapEntry(k.value, e.value)),
      if (id != null) 'Id': id,
      if (insights != null) 'Insights': insights,
      if (lastRecurrenceTime != null)
        'LastRecurrenceTime': unixTimestampToJson(lastRecurrenceTime),
      if (recurringCount != null) 'RecurringCount': recurringCount,
      if (resolutionMethod != null) 'ResolutionMethod': resolutionMethod.value,
      if (resourceGroupName != null) 'ResourceGroupName': resourceGroupName,
      if (severityLevel != null) 'SeverityLevel': severityLevel.value,
      if (shortName != null) 'ShortName': shortName,
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      if (status != null) 'Status': status.value,
      if (title != null) 'Title': title,
      if (visibility != null) 'Visibility': visibility.value,
    };
  }
}

/// @nodoc
class Status {
  static const ignore = Status._('IGNORE');
  static const resolved = Status._('RESOLVED');
  static const pending = Status._('PENDING');
  static const recurring = Status._('RECURRING');
  static const recovering = Status._('RECOVERING');

  final String value;

  const Status._(this.value);

  static const values = [ignore, resolved, pending, recurring, recovering];

  static Status fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Status._(value));

  @override
  bool operator ==(other) => other is Status && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class SeverityLevel {
  static const informative = SeverityLevel._('Informative');
  static const low = SeverityLevel._('Low');
  static const medium = SeverityLevel._('Medium');
  static const high = SeverityLevel._('High');

  final String value;

  const SeverityLevel._(this.value);

  static const values = [informative, low, medium, high];

  static SeverityLevel fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SeverityLevel._(value));

  @override
  bool operator ==(other) => other is SeverityLevel && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ResolutionMethod {
  static const manual = ResolutionMethod._('MANUAL');
  static const automatic = ResolutionMethod._('AUTOMATIC');
  static const unresolved = ResolutionMethod._('UNRESOLVED');

  final String value;

  const ResolutionMethod._(this.value);

  static const values = [manual, automatic, unresolved];

  static ResolutionMethod fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ResolutionMethod._(value));

  @override
  bool operator ==(other) => other is ResolutionMethod && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class FeedbackKey {
  static const insightsFeedback = FeedbackKey._('INSIGHTS_FEEDBACK');

  final String value;

  const FeedbackKey._(this.value);

  static const values = [insightsFeedback];

  static FeedbackKey fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => FeedbackKey._(value));

  @override
  bool operator ==(other) => other is FeedbackKey && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class FeedbackValue {
  static const notSpecified = FeedbackValue._('NOT_SPECIFIED');
  static const useful = FeedbackValue._('USEFUL');
  static const notUseful = FeedbackValue._('NOT_USEFUL');

  final String value;

  const FeedbackValue._(this.value);

  static const values = [notSpecified, useful, notUseful];

  static FeedbackValue fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => FeedbackValue._(value));

  @override
  bool operator ==(other) => other is FeedbackValue && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The event information.
///
/// @nodoc
class ConfigurationEvent {
  /// The Amazon Web Services account ID for the owner of the application to which
  /// the configuration event belongs.
  final String? accountId;

  /// The details of the event in plain text.
  final String? eventDetail;

  /// The name of the resource Application Insights attempted to configure.
  final String? eventResourceName;

  /// The resource type that Application Insights attempted to configure, for
  /// example, CLOUDWATCH_ALARM.
  final ConfigurationEventResourceType? eventResourceType;

  /// The status of the configuration update event. Possible values include INFO,
  /// WARN, and ERROR.
  final ConfigurationEventStatus? eventStatus;

  /// The timestamp of the event.
  final DateTime? eventTime;

  /// The resource monitored by Application Insights.
  final String? monitoredResourceARN;

  /// The name of the resource group of the application to which the configuration
  /// event belongs.
  final String? resourceGroupName;

  ConfigurationEvent({
    this.accountId,
    this.eventDetail,
    this.eventResourceName,
    this.eventResourceType,
    this.eventStatus,
    this.eventTime,
    this.monitoredResourceARN,
    this.resourceGroupName,
  });

  factory ConfigurationEvent.fromJson(Map<String, dynamic> json) {
    return ConfigurationEvent(
      accountId: json['AccountId'] as String?,
      eventDetail: json['EventDetail'] as String?,
      eventResourceName: json['EventResourceName'] as String?,
      eventResourceType: (json['EventResourceType'] as String?)
          ?.let(ConfigurationEventResourceType.fromString),
      eventStatus: (json['EventStatus'] as String?)
          ?.let(ConfigurationEventStatus.fromString),
      eventTime: timeStampFromJson(json['EventTime']),
      monitoredResourceARN: json['MonitoredResourceARN'] as String?,
      resourceGroupName: json['ResourceGroupName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final eventDetail = this.eventDetail;
    final eventResourceName = this.eventResourceName;
    final eventResourceType = this.eventResourceType;
    final eventStatus = this.eventStatus;
    final eventTime = this.eventTime;
    final monitoredResourceARN = this.monitoredResourceARN;
    final resourceGroupName = this.resourceGroupName;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (eventDetail != null) 'EventDetail': eventDetail,
      if (eventResourceName != null) 'EventResourceName': eventResourceName,
      if (eventResourceType != null)
        'EventResourceType': eventResourceType.value,
      if (eventStatus != null) 'EventStatus': eventStatus.value,
      if (eventTime != null) 'EventTime': unixTimestampToJson(eventTime),
      if (monitoredResourceARN != null)
        'MonitoredResourceARN': monitoredResourceARN,
      if (resourceGroupName != null) 'ResourceGroupName': resourceGroupName,
    };
  }
}

/// @nodoc
class ConfigurationEventStatus {
  static const info = ConfigurationEventStatus._('INFO');
  static const warn = ConfigurationEventStatus._('WARN');
  static const error = ConfigurationEventStatus._('ERROR');

  final String value;

  const ConfigurationEventStatus._(this.value);

  static const values = [info, warn, error];

  static ConfigurationEventStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ConfigurationEventStatus._(value));

  @override
  bool operator ==(other) =>
      other is ConfigurationEventStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ConfigurationEventResourceType {
  static const cloudwatchAlarm =
      ConfigurationEventResourceType._('CLOUDWATCH_ALARM');
  static const cloudwatchLog =
      ConfigurationEventResourceType._('CLOUDWATCH_LOG');
  static const cloudformation =
      ConfigurationEventResourceType._('CLOUDFORMATION');
  static const ssmAssociation =
      ConfigurationEventResourceType._('SSM_ASSOCIATION');

  final String value;

  const ConfigurationEventResourceType._(this.value);

  static const values = [
    cloudwatchAlarm,
    cloudwatchLog,
    cloudformation,
    ssmAssociation
  ];

  static ConfigurationEventResourceType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ConfigurationEventResourceType._(value));

  @override
  bool operator ==(other) =>
      other is ConfigurationEventResourceType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Describes a standalone resource or similarly grouped resources that the
/// application is made up of.
///
/// @nodoc
class ApplicationComponent {
  /// The name of the component.
  final String? componentName;

  /// If logging is supported for the resource type, indicates whether the
  /// component has configured logs to be monitored.
  final String? componentRemarks;

  /// Workloads detected in the application component.
  final Map<Tier, Map<String, String>>? detectedWorkload;

  /// Indicates whether the application component is monitored.
  final bool? monitor;

  /// The operating system of the component.
  final OsType? osType;

  /// The resource type. Supported resource types include EC2 instances, Auto
  /// Scaling group, Classic ELB, Application ELB, and SQS Queue.
  final String? resourceType;

  /// The stack tier of the application component.
  final Tier? tier;

  ApplicationComponent({
    this.componentName,
    this.componentRemarks,
    this.detectedWorkload,
    this.monitor,
    this.osType,
    this.resourceType,
    this.tier,
  });

  factory ApplicationComponent.fromJson(Map<String, dynamic> json) {
    return ApplicationComponent(
      componentName: json['ComponentName'] as String?,
      componentRemarks: json['ComponentRemarks'] as String?,
      detectedWorkload: (json['DetectedWorkload'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(
              Tier.fromString(k),
              (e as Map<String, dynamic>)
                  .map((k, e) => MapEntry(k, e as String)))),
      monitor: json['Monitor'] as bool?,
      osType: (json['OsType'] as String?)?.let(OsType.fromString),
      resourceType: json['ResourceType'] as String?,
      tier: (json['Tier'] as String?)?.let(Tier.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final componentName = this.componentName;
    final componentRemarks = this.componentRemarks;
    final detectedWorkload = this.detectedWorkload;
    final monitor = this.monitor;
    final osType = this.osType;
    final resourceType = this.resourceType;
    final tier = this.tier;
    return {
      if (componentName != null) 'ComponentName': componentName,
      if (componentRemarks != null) 'ComponentRemarks': componentRemarks,
      if (detectedWorkload != null)
        'DetectedWorkload':
            detectedWorkload.map((k, e) => MapEntry(k.value, e)),
      if (monitor != null) 'Monitor': monitor,
      if (osType != null) 'OsType': osType.value,
      if (resourceType != null) 'ResourceType': resourceType,
      if (tier != null) 'Tier': tier.value,
    };
  }
}

/// @nodoc
class OsType {
  static const windows = OsType._('WINDOWS');
  static const linux = OsType._('LINUX');

  final String value;

  const OsType._(this.value);

  static const values = [windows, linux];

  static OsType fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => OsType._(value));

  @override
  bool operator ==(other) => other is OsType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Describes observations related to the problem.
///
/// @nodoc
class RelatedObservations {
  /// The list of observations related to the problem.
  final List<Observation>? observationList;

  RelatedObservations({
    this.observationList,
  });

  factory RelatedObservations.fromJson(Map<String, dynamic> json) {
    return RelatedObservations(
      observationList: (json['ObservationList'] as List?)
          ?.nonNulls
          .map((e) => Observation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final observationList = this.observationList;
    return {
      if (observationList != null) 'ObservationList': observationList,
    };
  }
}

/// Describes an anomaly or error with the application.
///
/// @nodoc
class Observation {
  /// The detail type of the CloudWatch Event-based observation, for example,
  /// <code>EC2 Instance State-change Notification</code>.
  final String? cloudWatchEventDetailType;

  /// The ID of the CloudWatch Event-based observation related to the detected
  /// problem.
  final String? cloudWatchEventId;

  /// The source of the CloudWatch Event.
  final CloudWatchEventSource? cloudWatchEventSource;

  /// The CodeDeploy application to which the deployment belongs.
  final String? codeDeployApplication;

  /// The deployment group to which the CodeDeploy deployment belongs.
  final String? codeDeployDeploymentGroup;

  /// The deployment ID of the CodeDeploy-based observation related to the
  /// detected problem.
  final String? codeDeployDeploymentId;

  /// The instance group to which the CodeDeploy instance belongs.
  final String? codeDeployInstanceGroupId;

  /// The status of the CodeDeploy deployment, for example <code>SUCCESS</code> or
  /// <code> FAILURE</code>.
  final String? codeDeployState;

  /// The cause of an EBS CloudWatch event.
  final String? ebsCause;

  /// The type of EBS CloudWatch event, such as <code>createVolume</code>,
  /// <code>deleteVolume</code> or <code>attachVolume</code>.
  final String? ebsEvent;

  /// The request ID of an EBS CloudWatch event.
  final String? ebsRequestId;

  /// The result of an EBS CloudWatch event, such as <code>failed</code> or
  /// <code>succeeded</code>.
  final String? ebsResult;

  /// The state of the instance, such as <code>STOPPING</code> or
  /// <code>TERMINATING</code>.
  final String? ec2State;

  /// The time when the observation ended, in epoch seconds.
  final DateTime? endTime;

  /// The Amazon Resource Name (ARN) of the Health Event-based observation.
  final String? healthEventArn;

  /// The description of the Health event provided by the service, such as Amazon
  /// EC2.
  final String? healthEventDescription;

  /// The category of the Health event, such as <code>issue</code>.
  final String? healthEventTypeCategory;

  /// The type of the Health event, for example,
  /// <code>AWS_EC2_POWER_CONNECTIVITY_ISSUE</code>.
  final String? healthEventTypeCode;

  /// The service to which the Health Event belongs, such as EC2.
  final String? healthService;

  /// The ID of the observation type.
  final String? id;

  /// The timestamp in the CloudWatch Logs that specifies when the matched line
  /// occurred.
  final DateTime? lineTime;

  /// The log filter of the observation.
  final LogFilter? logFilter;

  /// The log group name.
  final String? logGroup;

  /// The log text of the observation.
  final String? logText;

  /// The name of the observation metric.
  final String? metricName;

  /// The namespace of the observation metric.
  final String? metricNamespace;

  /// The category of an RDS event.
  final String? rdsEventCategories;

  /// The message of an RDS event.
  final String? rdsEventMessage;

  /// The name of the S3 CloudWatch Event-based observation.
  final String? s3EventName;

  /// The source resource ARN of the observation.
  final String? sourceARN;

  /// The source type of the observation.
  final String? sourceType;

  /// The time when the observation was first detected, in epoch seconds.
  final DateTime? startTime;

  /// The Amazon Resource Name (ARN) of the step function-based observation.
  final String? statesArn;

  /// The Amazon Resource Name (ARN) of the step function execution-based
  /// observation.
  final String? statesExecutionArn;

  /// The input to the step function-based observation.
  final String? statesInput;

  /// The status of the step function-related observation.
  final String? statesStatus;

  /// The unit of the source observation metric.
  final String? unit;

  /// The value of the source observation metric.
  final double? value;

  /// The X-Ray request error percentage for this node.
  final int? xRayErrorPercent;

  /// The X-Ray request fault percentage for this node.
  final int? xRayFaultPercent;

  /// The name of the X-Ray node.
  final String? xRayNodeName;

  /// The type of the X-Ray node.
  final String? xRayNodeType;

  /// The X-Ray node request average latency for this node.
  final int? xRayRequestAverageLatency;

  /// The X-Ray request count for this node.
  final int? xRayRequestCount;

  /// The X-Ray request throttle percentage for this node.
  final int? xRayThrottlePercent;

  Observation({
    this.cloudWatchEventDetailType,
    this.cloudWatchEventId,
    this.cloudWatchEventSource,
    this.codeDeployApplication,
    this.codeDeployDeploymentGroup,
    this.codeDeployDeploymentId,
    this.codeDeployInstanceGroupId,
    this.codeDeployState,
    this.ebsCause,
    this.ebsEvent,
    this.ebsRequestId,
    this.ebsResult,
    this.ec2State,
    this.endTime,
    this.healthEventArn,
    this.healthEventDescription,
    this.healthEventTypeCategory,
    this.healthEventTypeCode,
    this.healthService,
    this.id,
    this.lineTime,
    this.logFilter,
    this.logGroup,
    this.logText,
    this.metricName,
    this.metricNamespace,
    this.rdsEventCategories,
    this.rdsEventMessage,
    this.s3EventName,
    this.sourceARN,
    this.sourceType,
    this.startTime,
    this.statesArn,
    this.statesExecutionArn,
    this.statesInput,
    this.statesStatus,
    this.unit,
    this.value,
    this.xRayErrorPercent,
    this.xRayFaultPercent,
    this.xRayNodeName,
    this.xRayNodeType,
    this.xRayRequestAverageLatency,
    this.xRayRequestCount,
    this.xRayThrottlePercent,
  });

  factory Observation.fromJson(Map<String, dynamic> json) {
    return Observation(
      cloudWatchEventDetailType: json['CloudWatchEventDetailType'] as String?,
      cloudWatchEventId: json['CloudWatchEventId'] as String?,
      cloudWatchEventSource: (json['CloudWatchEventSource'] as String?)
          ?.let(CloudWatchEventSource.fromString),
      codeDeployApplication: json['CodeDeployApplication'] as String?,
      codeDeployDeploymentGroup: json['CodeDeployDeploymentGroup'] as String?,
      codeDeployDeploymentId: json['CodeDeployDeploymentId'] as String?,
      codeDeployInstanceGroupId: json['CodeDeployInstanceGroupId'] as String?,
      codeDeployState: json['CodeDeployState'] as String?,
      ebsCause: json['EbsCause'] as String?,
      ebsEvent: json['EbsEvent'] as String?,
      ebsRequestId: json['EbsRequestId'] as String?,
      ebsResult: json['EbsResult'] as String?,
      ec2State: json['Ec2State'] as String?,
      endTime: timeStampFromJson(json['EndTime']),
      healthEventArn: json['HealthEventArn'] as String?,
      healthEventDescription: json['HealthEventDescription'] as String?,
      healthEventTypeCategory: json['HealthEventTypeCategory'] as String?,
      healthEventTypeCode: json['HealthEventTypeCode'] as String?,
      healthService: json['HealthService'] as String?,
      id: json['Id'] as String?,
      lineTime: timeStampFromJson(json['LineTime']),
      logFilter: (json['LogFilter'] as String?)?.let(LogFilter.fromString),
      logGroup: json['LogGroup'] as String?,
      logText: json['LogText'] as String?,
      metricName: json['MetricName'] as String?,
      metricNamespace: json['MetricNamespace'] as String?,
      rdsEventCategories: json['RdsEventCategories'] as String?,
      rdsEventMessage: json['RdsEventMessage'] as String?,
      s3EventName: json['S3EventName'] as String?,
      sourceARN: json['SourceARN'] as String?,
      sourceType: json['SourceType'] as String?,
      startTime: timeStampFromJson(json['StartTime']),
      statesArn: json['StatesArn'] as String?,
      statesExecutionArn: json['StatesExecutionArn'] as String?,
      statesInput: json['StatesInput'] as String?,
      statesStatus: json['StatesStatus'] as String?,
      unit: json['Unit'] as String?,
      value: json['Value'] as double?,
      xRayErrorPercent: json['XRayErrorPercent'] as int?,
      xRayFaultPercent: json['XRayFaultPercent'] as int?,
      xRayNodeName: json['XRayNodeName'] as String?,
      xRayNodeType: json['XRayNodeType'] as String?,
      xRayRequestAverageLatency: json['XRayRequestAverageLatency'] as int?,
      xRayRequestCount: json['XRayRequestCount'] as int?,
      xRayThrottlePercent: json['XRayThrottlePercent'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final cloudWatchEventDetailType = this.cloudWatchEventDetailType;
    final cloudWatchEventId = this.cloudWatchEventId;
    final cloudWatchEventSource = this.cloudWatchEventSource;
    final codeDeployApplication = this.codeDeployApplication;
    final codeDeployDeploymentGroup = this.codeDeployDeploymentGroup;
    final codeDeployDeploymentId = this.codeDeployDeploymentId;
    final codeDeployInstanceGroupId = this.codeDeployInstanceGroupId;
    final codeDeployState = this.codeDeployState;
    final ebsCause = this.ebsCause;
    final ebsEvent = this.ebsEvent;
    final ebsRequestId = this.ebsRequestId;
    final ebsResult = this.ebsResult;
    final ec2State = this.ec2State;
    final endTime = this.endTime;
    final healthEventArn = this.healthEventArn;
    final healthEventDescription = this.healthEventDescription;
    final healthEventTypeCategory = this.healthEventTypeCategory;
    final healthEventTypeCode = this.healthEventTypeCode;
    final healthService = this.healthService;
    final id = this.id;
    final lineTime = this.lineTime;
    final logFilter = this.logFilter;
    final logGroup = this.logGroup;
    final logText = this.logText;
    final metricName = this.metricName;
    final metricNamespace = this.metricNamespace;
    final rdsEventCategories = this.rdsEventCategories;
    final rdsEventMessage = this.rdsEventMessage;
    final s3EventName = this.s3EventName;
    final sourceARN = this.sourceARN;
    final sourceType = this.sourceType;
    final startTime = this.startTime;
    final statesArn = this.statesArn;
    final statesExecutionArn = this.statesExecutionArn;
    final statesInput = this.statesInput;
    final statesStatus = this.statesStatus;
    final unit = this.unit;
    final value = this.value;
    final xRayErrorPercent = this.xRayErrorPercent;
    final xRayFaultPercent = this.xRayFaultPercent;
    final xRayNodeName = this.xRayNodeName;
    final xRayNodeType = this.xRayNodeType;
    final xRayRequestAverageLatency = this.xRayRequestAverageLatency;
    final xRayRequestCount = this.xRayRequestCount;
    final xRayThrottlePercent = this.xRayThrottlePercent;
    return {
      if (cloudWatchEventDetailType != null)
        'CloudWatchEventDetailType': cloudWatchEventDetailType,
      if (cloudWatchEventId != null) 'CloudWatchEventId': cloudWatchEventId,
      if (cloudWatchEventSource != null)
        'CloudWatchEventSource': cloudWatchEventSource.value,
      if (codeDeployApplication != null)
        'CodeDeployApplication': codeDeployApplication,
      if (codeDeployDeploymentGroup != null)
        'CodeDeployDeploymentGroup': codeDeployDeploymentGroup,
      if (codeDeployDeploymentId != null)
        'CodeDeployDeploymentId': codeDeployDeploymentId,
      if (codeDeployInstanceGroupId != null)
        'CodeDeployInstanceGroupId': codeDeployInstanceGroupId,
      if (codeDeployState != null) 'CodeDeployState': codeDeployState,
      if (ebsCause != null) 'EbsCause': ebsCause,
      if (ebsEvent != null) 'EbsEvent': ebsEvent,
      if (ebsRequestId != null) 'EbsRequestId': ebsRequestId,
      if (ebsResult != null) 'EbsResult': ebsResult,
      if (ec2State != null) 'Ec2State': ec2State,
      if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
      if (healthEventArn != null) 'HealthEventArn': healthEventArn,
      if (healthEventDescription != null)
        'HealthEventDescription': healthEventDescription,
      if (healthEventTypeCategory != null)
        'HealthEventTypeCategory': healthEventTypeCategory,
      if (healthEventTypeCode != null)
        'HealthEventTypeCode': healthEventTypeCode,
      if (healthService != null) 'HealthService': healthService,
      if (id != null) 'Id': id,
      if (lineTime != null) 'LineTime': unixTimestampToJson(lineTime),
      if (logFilter != null) 'LogFilter': logFilter.value,
      if (logGroup != null) 'LogGroup': logGroup,
      if (logText != null) 'LogText': logText,
      if (metricName != null) 'MetricName': metricName,
      if (metricNamespace != null) 'MetricNamespace': metricNamespace,
      if (rdsEventCategories != null) 'RdsEventCategories': rdsEventCategories,
      if (rdsEventMessage != null) 'RdsEventMessage': rdsEventMessage,
      if (s3EventName != null) 'S3EventName': s3EventName,
      if (sourceARN != null) 'SourceARN': sourceARN,
      if (sourceType != null) 'SourceType': sourceType,
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      if (statesArn != null) 'StatesArn': statesArn,
      if (statesExecutionArn != null) 'StatesExecutionArn': statesExecutionArn,
      if (statesInput != null) 'StatesInput': statesInput,
      if (statesStatus != null) 'StatesStatus': statesStatus,
      if (unit != null) 'Unit': unit,
      if (value != null) 'Value': value,
      if (xRayErrorPercent != null) 'XRayErrorPercent': xRayErrorPercent,
      if (xRayFaultPercent != null) 'XRayFaultPercent': xRayFaultPercent,
      if (xRayNodeName != null) 'XRayNodeName': xRayNodeName,
      if (xRayNodeType != null) 'XRayNodeType': xRayNodeType,
      if (xRayRequestAverageLatency != null)
        'XRayRequestAverageLatency': xRayRequestAverageLatency,
      if (xRayRequestCount != null) 'XRayRequestCount': xRayRequestCount,
      if (xRayThrottlePercent != null)
        'XRayThrottlePercent': xRayThrottlePercent,
    };
  }
}

/// @nodoc
class LogFilter {
  static const error = LogFilter._('ERROR');
  static const warn = LogFilter._('WARN');
  static const info = LogFilter._('INFO');

  final String value;

  const LogFilter._(this.value);

  static const values = [error, warn, info];

  static LogFilter fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => LogFilter._(value));

  @override
  bool operator ==(other) => other is LogFilter && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class CloudWatchEventSource {
  static const ec2 = CloudWatchEventSource._('EC2');
  static const codeDeploy = CloudWatchEventSource._('CODE_DEPLOY');
  static const health = CloudWatchEventSource._('HEALTH');
  static const rds = CloudWatchEventSource._('RDS');

  final String value;

  const CloudWatchEventSource._(this.value);

  static const values = [ec2, codeDeploy, health, rds];

  static CloudWatchEventSource fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CloudWatchEventSource._(value));

  @override
  bool operator ==(other) =>
      other is CloudWatchEventSource && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class RecommendationType {
  static const infraOnly = RecommendationType._('INFRA_ONLY');
  static const workloadOnly = RecommendationType._('WORKLOAD_ONLY');
  static const all = RecommendationType._('ALL');

  final String value;

  const RecommendationType._(this.value);

  static const values = [infraOnly, workloadOnly, all];

  static RecommendationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RecommendationType._(value));

  @override
  bool operator ==(other) =>
      other is RecommendationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class GroupingType {
  static const accountBased = GroupingType._('ACCOUNT_BASED');

  final String value;

  const GroupingType._(this.value);

  static const values = [accountBased];

  static GroupingType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => GroupingType._(value));

  @override
  bool operator ==(other) => other is GroupingType && other.value == value;

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
class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String? type, String? message})
      : super(type: type, code: 'BadRequestException', message: message);
}

/// @nodoc
class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

/// @nodoc
class ResourceInUseException extends _s.GenericAwsException {
  ResourceInUseException({String? type, String? message})
      : super(type: type, code: 'ResourceInUseException', message: message);
}

/// @nodoc
class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

/// @nodoc
class TagsAlreadyExistException extends _s.GenericAwsException {
  TagsAlreadyExistException({String? type, String? message})
      : super(type: type, code: 'TagsAlreadyExistException', message: message);
}

/// @nodoc
class TooManyTagsException extends _s.GenericAwsException {
  TooManyTagsException({String? type, String? message})
      : super(type: type, code: 'TooManyTagsException', message: message);
}

/// @nodoc
class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'BadRequestException': (type, message) =>
      BadRequestException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ResourceInUseException': (type, message) =>
      ResourceInUseException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'TagsAlreadyExistException': (type, message) =>
      TagsAlreadyExistException(type: type, message: message),
  'TooManyTagsException': (type, message) =>
      TooManyTagsException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
