// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_aws_api/shared.dart' as _s;
import 'package:shared_aws_api/shared.dart'
    show
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        nonNullableTimeStampFromJson,
        timeStampFromJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

/// Amazon CloudWatch Application Insights is a service that helps you detect
/// common problems with your applications. It enables you to pinpoint the
/// source of issues in your applications (built with technologies such as
/// Microsoft IIS, .NET, and Microsoft SQL Server), by providing key insights
/// into detected problems.
class ApplicationInsights {
  final _s.JsonProtocol _protocol;
  ApplicationInsights({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'applicationinsights',
            signingName: 'applicationinsights',
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

  /// Adds a workload to a component. Each component can have at most five
  /// workloads.
  ///
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
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
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [TagsAlreadyExistException].
  /// May throw [AccessDeniedException].
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
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateApplicationResponse.fromJson(jsonResponse.body);
  }

  /// Creates a custom component by grouping similar standalone instances to
  /// monitor.
  ///
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
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
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
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
  /// AWS-provided patterns.
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
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceGroupName] :
  /// The name of the resource group.
  ///
  /// Parameter [accountId] :
  /// The AWS account ID for the resource group owner.
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
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [componentName] :
  /// The name of the component.
  ///
  /// Parameter [resourceGroupName] :
  /// The name of the resource group.
  ///
  /// Parameter [accountId] :
  /// The AWS account ID for the resource group owner.
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
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [componentName] :
  /// The name of the component.
  ///
  /// Parameter [resourceGroupName] :
  /// The name of the resource group.
  ///
  /// Parameter [accountId] :
  /// The AWS account ID for the resource group owner.
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
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
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
  /// The name of the workload.
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
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
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
  /// The AWS account ID for the resource group owner.
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
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [observationId] :
  /// The ID of the observation.
  ///
  /// Parameter [accountId] :
  /// The AWS account ID for the resource group owner.
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
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [problemId] :
  /// The ID of the problem.
  ///
  /// Parameter [accountId] :
  /// The AWS account ID for the owner of the resource group affected by the
  /// problem.
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
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [problemId] :
  /// The ID of the problem.
  ///
  /// Parameter [accountId] :
  /// The AWS account ID for the resource group owner.
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
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
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
  /// The AWS account ID for the workload owner.
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
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [accountId] :
  /// The AWS account ID for the resource group owner.
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
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceGroupName] :
  /// The name of the resource group.
  ///
  /// Parameter [accountId] :
  /// The AWS account ID for the resource group owner.
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
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [accountId] :
  /// The AWS account ID for the resource group owner.
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

  /// Lists the log pattern sets in the specific application.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceGroupName] :
  /// The name of the resource group.
  ///
  /// Parameter [accountId] :
  /// The AWS account ID for the resource group owner.
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

  /// Lists the log patterns in the specific log <code>LogPatternSet</code>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceGroupName] :
  /// The name of the resource group.
  ///
  /// Parameter [accountId] :
  /// The AWS account ID for the resource group owner.
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

  /// Lists the problems with your application.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [accountId] :
  /// The AWS account ID for the resource group owner.
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
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [componentName] :
  /// The name of the component.
  ///
  /// Parameter [resourceGroupName] :
  /// The name of the resource group.
  ///
  /// Parameter [accountId] :
  /// The AWS account ID of the owner of the workload.
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
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
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
  Future<UpdateApplicationResponse> updateApplication({
    required String resourceGroupName,
    bool? attachMissingPermission,
    bool? autoConfigEnabled,
    bool? cWEMonitorEnabled,
    bool? opsCenterEnabled,
    String? opsItemSNSTopicArn,
    bool? removeSNSTopic,
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
      },
    );

    return UpdateApplicationResponse.fromJson(jsonResponse.body);
  }

  /// Updates the custom component name and/or the list of resources that make
  /// up the component.
  ///
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceInUseException].
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
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
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
  /// AWS-provided patterns.
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
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
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
}

/// Describes a standalone resource or similarly grouped resources that the
/// application is made up of.
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
}

/// Describes the status of the application.
class ApplicationInfo {
  /// The AWS account ID for the owner of the application.
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
    );
  }
}

enum CloudWatchEventSource {
  ec2('EC2'),
  codeDeploy('CODE_DEPLOY'),
  health('HEALTH'),
  rds('RDS'),
  ;

  final String value;

  const CloudWatchEventSource(this.value);

  static CloudWatchEventSource fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum CloudWatchEventSource'));
}

/// The event information.
class ConfigurationEvent {
  /// The AWS account ID for the owner of the application to which the
  /// configuration event belongs.
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
}

enum ConfigurationEventResourceType {
  cloudwatchAlarm('CLOUDWATCH_ALARM'),
  cloudwatchLog('CLOUDWATCH_LOG'),
  cloudformation('CLOUDFORMATION'),
  ssmAssociation('SSM_ASSOCIATION'),
  ;

  final String value;

  const ConfigurationEventResourceType(this.value);

  static ConfigurationEventResourceType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum ConfigurationEventResourceType'));
}

enum ConfigurationEventStatus {
  info('INFO'),
  warn('WARN'),
  error('ERROR'),
  ;

  final String value;

  const ConfigurationEventStatus(this.value);

  static ConfigurationEventStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum ConfigurationEventStatus'));
}

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
}

class CreateComponentResponse {
  CreateComponentResponse();

  factory CreateComponentResponse.fromJson(Map<String, dynamic> _) {
    return CreateComponentResponse();
  }
}

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
}

class DeleteApplicationResponse {
  DeleteApplicationResponse();

  factory DeleteApplicationResponse.fromJson(Map<String, dynamic> _) {
    return DeleteApplicationResponse();
  }
}

class DeleteComponentResponse {
  DeleteComponentResponse();

  factory DeleteComponentResponse.fromJson(Map<String, dynamic> _) {
    return DeleteComponentResponse();
  }
}

class DeleteLogPatternResponse {
  DeleteLogPatternResponse();

  factory DeleteLogPatternResponse.fromJson(Map<String, dynamic> _) {
    return DeleteLogPatternResponse();
  }
}

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
}

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
}

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
}

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
}

class DescribeLogPatternResponse {
  /// The AWS account ID for the resource group owner.
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
}

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
}

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
}

class DescribeProblemResponse {
  /// Information about the problem.
  final Problem? problem;

  DescribeProblemResponse({
    this.problem,
  });

  factory DescribeProblemResponse.fromJson(Map<String, dynamic> json) {
    return DescribeProblemResponse(
      problem: json['Problem'] != null
          ? Problem.fromJson(json['Problem'] as Map<String, dynamic>)
          : null,
    );
  }
}

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
}

enum DiscoveryType {
  resourceGroupBased('RESOURCE_GROUP_BASED'),
  accountBased('ACCOUNT_BASED'),
  ;

  final String value;

  const DiscoveryType(this.value);

  static DiscoveryType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum DiscoveryType'));
}

enum FeedbackKey {
  insightsFeedback('INSIGHTS_FEEDBACK'),
  ;

  final String value;

  const FeedbackKey(this.value);

  static FeedbackKey fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum FeedbackKey'));
}

enum FeedbackValue {
  notSpecified('NOT_SPECIFIED'),
  useful('USEFUL'),
  notUseful('NOT_USEFUL'),
  ;

  final String value;

  const FeedbackValue(this.value);

  static FeedbackValue fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum FeedbackValue'));
}

enum GroupingType {
  accountBased('ACCOUNT_BASED'),
  ;

  final String value;

  const GroupingType(this.value);

  static GroupingType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum GroupingType'));
}

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
}

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
}

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
}

class ListLogPatternSetsResponse {
  /// The AWS account ID for the resource group owner.
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
}

class ListLogPatternsResponse {
  /// The AWS account ID for the resource group owner.
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
}

class ListProblemsResponse {
  /// The AWS account ID for the resource group owner.
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
}

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
}

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
}

enum LogFilter {
  error('ERROR'),
  warn('WARN'),
  info('INFO'),
  ;

  final String value;

  const LogFilter(this.value);

  static LogFilter fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum LogFilter'));
}

/// An object that defines the log patterns that belongs to a
/// <code>LogPatternSet</code>.
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
  /// <code>1,000,000</code> are reserved for AWS-provided patterns.
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
}

/// Describes an anomaly or error with the application.
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

  /// The Amazon Resource Name (ARN) of the AWS Health Event-based observation.
  final String? healthEventArn;

  /// The description of the AWS Health event provided by the service, such as
  /// Amazon EC2.
  final String? healthEventDescription;

  /// The category of the AWS Health event, such as <code>issue</code>.
  final String? healthEventTypeCategory;

  /// The type of the AWS Health event, for example,
  /// <code>AWS_EC2_POWER_CONNECTIVITY_ISSUE</code>.
  final String? healthEventTypeCode;

  /// The service to which the AWS Health Event belongs, such as EC2.
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
}

enum OsType {
  windows('WINDOWS'),
  linux('LINUX'),
  ;

  final String value;

  const OsType(this.value);

  static OsType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception('$value is not known in enum OsType'));
}

/// Describes a problem that is detected by correlating observations.
class Problem {
  /// The AWS account ID for the owner of the resource group affected by the
  /// problem.
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
      startTime: timeStampFromJson(json['StartTime']),
      status: (json['Status'] as String?)?.let(Status.fromString),
      title: json['Title'] as String?,
      visibility: (json['Visibility'] as String?)?.let(Visibility.fromString),
    );
  }
}

enum RecommendationType {
  infraOnly('INFRA_ONLY'),
  workloadOnly('WORKLOAD_ONLY'),
  all('ALL'),
  ;

  final String value;

  const RecommendationType(this.value);

  static RecommendationType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum RecommendationType'));
}

/// Describes observations related to the problem.
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
}

class RemoveWorkloadResponse {
  RemoveWorkloadResponse();

  factory RemoveWorkloadResponse.fromJson(Map<String, dynamic> _) {
    return RemoveWorkloadResponse();
  }
}

enum ResolutionMethod {
  manual('MANUAL'),
  automatic('AUTOMATIC'),
  unresolved('UNRESOLVED'),
  ;

  final String value;

  const ResolutionMethod(this.value);

  static ResolutionMethod fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum ResolutionMethod'));
}

enum SeverityLevel {
  informative('Informative'),
  low('Low'),
  medium('Medium'),
  high('High'),
  ;

  final String value;

  const SeverityLevel(this.value);

  static SeverityLevel fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum SeverityLevel'));
}

enum Status {
  ignore('IGNORE'),
  resolved('RESOLVED'),
  pending('PENDING'),
  recurring('RECURRING'),
  recovering('RECOVERING'),
  ;

  final String value;

  const Status(this.value);

  static Status fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception('$value is not known in enum Status'));
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
/// The <code>aws:</code> prefix is reserved for use by AWS; you can’t use it in
/// any tag keys or values that you define. In addition, you can't edit or
/// remove tag keys or values that use this prefix.
/// </li>
/// </ul>
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
}

enum Tier {
  custom('CUSTOM'),
  $default('DEFAULT'),
  dotNetCore('DOT_NET_CORE'),
  dotNetWorker('DOT_NET_WORKER'),
  dotNetWebTier('DOT_NET_WEB_TIER'),
  dotNetWeb('DOT_NET_WEB'),
  sqlServer('SQL_SERVER'),
  sqlServerAlwaysonAvailabilityGroup('SQL_SERVER_ALWAYSON_AVAILABILITY_GROUP'),
  mysql('MYSQL'),
  postgresql('POSTGRESQL'),
  javaJmx('JAVA_JMX'),
  oracle('ORACLE'),
  sapHanaMultiNode('SAP_HANA_MULTI_NODE'),
  sapHanaSingleNode('SAP_HANA_SINGLE_NODE'),
  sapHanaHighAvailability('SAP_HANA_HIGH_AVAILABILITY'),
  sqlServerFailoverClusterInstance('SQL_SERVER_FAILOVER_CLUSTER_INSTANCE'),
  sharepoint('SHAREPOINT'),
  activeDirectory('ACTIVE_DIRECTORY'),
  sapNetweaverStandard('SAP_NETWEAVER_STANDARD'),
  sapNetweaverDistributed('SAP_NETWEAVER_DISTRIBUTED'),
  sapNetweaverHighAvailability('SAP_NETWEAVER_HIGH_AVAILABILITY'),
  ;

  final String value;

  const Tier(this.value);

  static Tier fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception('$value is not known in enum Tier'));
}

class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }
}

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
}

class UpdateComponentConfigurationResponse {
  UpdateComponentConfigurationResponse();

  factory UpdateComponentConfigurationResponse.fromJson(
      Map<String, dynamic> _) {
    return UpdateComponentConfigurationResponse();
  }
}

class UpdateComponentResponse {
  UpdateComponentResponse();

  factory UpdateComponentResponse.fromJson(Map<String, dynamic> _) {
    return UpdateComponentResponse();
  }
}

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
}

class UpdateProblemResponse {
  UpdateProblemResponse();

  factory UpdateProblemResponse.fromJson(Map<String, dynamic> _) {
    return UpdateProblemResponse();
  }
}

enum UpdateStatus {
  resolved('RESOLVED'),
  ;

  final String value;

  const UpdateStatus(this.value);

  static UpdateStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum UpdateStatus'));
}

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
}

enum Visibility {
  ignored('IGNORED'),
  visible('VISIBLE'),
  ;

  final String value;

  const Visibility(this.value);

  static Visibility fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum Visibility'));
}

/// Describes the workloads on a component.
class Workload {
  /// The name of the component.
  final String? componentName;

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
    this.tier,
    this.workloadId,
    this.workloadName,
    this.workloadRemarks,
  });

  factory Workload.fromJson(Map<String, dynamic> json) {
    return Workload(
      componentName: json['ComponentName'] as String?,
      tier: (json['Tier'] as String?)?.let(Tier.fromString),
      workloadId: json['WorkloadId'] as String?,
      workloadName: json['WorkloadName'] as String?,
      workloadRemarks: json['WorkloadRemarks'] as String?,
    );
  }
}

/// The configuration of the workload.
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

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String? type, String? message})
      : super(type: type, code: 'BadRequestException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class ResourceInUseException extends _s.GenericAwsException {
  ResourceInUseException({String? type, String? message})
      : super(type: type, code: 'ResourceInUseException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class TagsAlreadyExistException extends _s.GenericAwsException {
  TagsAlreadyExistException({String? type, String? message})
      : super(type: type, code: 'TagsAlreadyExistException', message: message);
}

class TooManyTagsException extends _s.GenericAwsException {
  TooManyTagsException({String? type, String? message})
      : super(type: type, code: 'TooManyTagsException', message: message);
}

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
