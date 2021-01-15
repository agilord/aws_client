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

part '2018-11-25.g.dart';

/// Amazon CloudWatch Application Insights is a service that helps you detect
/// common problems with your applications. It enables you to pinpoint the
/// source of issues in your applications (built with technologies such as
/// Microsoft IIS, .NET, and Microsoft SQL Server), by providing key insights
/// into detected problems.
class ApplicationInsights {
  final _s.JsonProtocol _protocol;
  ApplicationInsights({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'applicationinsights',
            signingName: 'applicationinsights',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Adds an application that is created from a resource group.
  ///
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [TagsAlreadyExistException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [resourceGroupName] :
  /// The name of the resource group.
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
  /// Parameter [tags] :
  /// List of tags to add to the application. tag key (<code>Key</code>) and an
  /// associated tag value (<code>Value</code>). The maximum length of a tag key
  /// is 128 characters. The maximum length of a tag value is 256 characters.
  Future<CreateApplicationResponse> createApplication({
    @_s.required String resourceGroupName,
    bool cWEMonitorEnabled,
    bool opsCenterEnabled,
    String opsItemSNSTopicArn,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(resourceGroupName, 'resourceGroupName');
    _s.validateStringLength(
      'resourceGroupName',
      resourceGroupName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceGroupName',
      resourceGroupName,
      r'''[a-zA-Z0-9\.\-_]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'opsItemSNSTopicArn',
      opsItemSNSTopicArn,
      20,
      300,
    );
    _s.validateStringPattern(
      'opsItemSNSTopicArn',
      opsItemSNSTopicArn,
      r'''^arn:aws(-\w+)*:[\w\d-]+:([\w\d-]*)?:[\w\d_-]*([:/].+)*$''',
    );
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
        'ResourceGroupName': resourceGroupName,
        if (cWEMonitorEnabled != null) 'CWEMonitorEnabled': cWEMonitorEnabled,
        if (opsCenterEnabled != null) 'OpsCenterEnabled': opsCenterEnabled,
        if (opsItemSNSTopicArn != null)
          'OpsItemSNSTopicArn': opsItemSNSTopicArn,
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
    @_s.required String componentName,
    @_s.required String resourceGroupName,
    @_s.required List<String> resourceList,
  }) async {
    ArgumentError.checkNotNull(componentName, 'componentName');
    _s.validateStringLength(
      'componentName',
      componentName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'componentName',
      componentName,
      r'''^[\d\w\-_\.+]*$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourceGroupName, 'resourceGroupName');
    _s.validateStringLength(
      'resourceGroupName',
      resourceGroupName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceGroupName',
      resourceGroupName,
      r'''[a-zA-Z0-9\.\-_]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourceList, 'resourceList');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'EC2WindowsBarleyService.CreateComponent'
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
        'ResourceList': resourceList,
      },
    );

    return CreateComponentResponse.fromJson(jsonResponse.body);
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
    @_s.required String pattern,
    @_s.required String patternName,
    @_s.required String patternSetName,
    @_s.required int rank,
    @_s.required String resourceGroupName,
  }) async {
    ArgumentError.checkNotNull(pattern, 'pattern');
    _s.validateStringLength(
      'pattern',
      pattern,
      1,
      50,
      isRequired: true,
    );
    _s.validateStringPattern(
      'pattern',
      pattern,
      r'''[\S\s]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(patternName, 'patternName');
    _s.validateStringLength(
      'patternName',
      patternName,
      1,
      50,
      isRequired: true,
    );
    _s.validateStringPattern(
      'patternName',
      patternName,
      r'''[a-zA-Z0-9\.\-_]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(patternSetName, 'patternSetName');
    _s.validateStringLength(
      'patternSetName',
      patternSetName,
      1,
      30,
      isRequired: true,
    );
    _s.validateStringPattern(
      'patternSetName',
      patternSetName,
      r'''[a-zA-Z0-9\.\-_]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(rank, 'rank');
    ArgumentError.checkNotNull(resourceGroupName, 'resourceGroupName');
    _s.validateStringLength(
      'resourceGroupName',
      resourceGroupName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceGroupName',
      resourceGroupName,
      r'''[a-zA-Z0-9\.\-_]*''',
      isRequired: true,
    );
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
    @_s.required String resourceGroupName,
  }) async {
    ArgumentError.checkNotNull(resourceGroupName, 'resourceGroupName');
    _s.validateStringLength(
      'resourceGroupName',
      resourceGroupName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceGroupName',
      resourceGroupName,
      r'''[a-zA-Z0-9\.\-_]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'EC2WindowsBarleyService.DeleteApplication'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceGroupName': resourceGroupName,
      },
    );

    return DeleteApplicationResponse.fromJson(jsonResponse.body);
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
    @_s.required String componentName,
    @_s.required String resourceGroupName,
  }) async {
    ArgumentError.checkNotNull(componentName, 'componentName');
    _s.validateStringLength(
      'componentName',
      componentName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'componentName',
      componentName,
      r'''^[\d\w\-_\.+]*$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourceGroupName, 'resourceGroupName');
    _s.validateStringLength(
      'resourceGroupName',
      resourceGroupName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceGroupName',
      resourceGroupName,
      r'''[a-zA-Z0-9\.\-_]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'EC2WindowsBarleyService.DeleteComponent'
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
      },
    );

    return DeleteComponentResponse.fromJson(jsonResponse.body);
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
    @_s.required String patternName,
    @_s.required String patternSetName,
    @_s.required String resourceGroupName,
  }) async {
    ArgumentError.checkNotNull(patternName, 'patternName');
    _s.validateStringLength(
      'patternName',
      patternName,
      1,
      50,
      isRequired: true,
    );
    _s.validateStringPattern(
      'patternName',
      patternName,
      r'''[a-zA-Z0-9\.\-_]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(patternSetName, 'patternSetName');
    _s.validateStringLength(
      'patternSetName',
      patternSetName,
      1,
      30,
      isRequired: true,
    );
    _s.validateStringPattern(
      'patternSetName',
      patternSetName,
      r'''[a-zA-Z0-9\.\-_]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourceGroupName, 'resourceGroupName');
    _s.validateStringLength(
      'resourceGroupName',
      resourceGroupName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceGroupName',
      resourceGroupName,
      r'''[a-zA-Z0-9\.\-_]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'EC2WindowsBarleyService.DeleteLogPattern'
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
      },
    );

    return DeleteLogPatternResponse.fromJson(jsonResponse.body);
  }

  /// Describes the application.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceGroupName] :
  /// The name of the resource group.
  Future<DescribeApplicationResponse> describeApplication({
    @_s.required String resourceGroupName,
  }) async {
    ArgumentError.checkNotNull(resourceGroupName, 'resourceGroupName');
    _s.validateStringLength(
      'resourceGroupName',
      resourceGroupName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceGroupName',
      resourceGroupName,
      r'''[a-zA-Z0-9\.\-_]*''',
      isRequired: true,
    );
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
  Future<DescribeComponentResponse> describeComponent({
    @_s.required String componentName,
    @_s.required String resourceGroupName,
  }) async {
    ArgumentError.checkNotNull(componentName, 'componentName');
    _s.validateStringLength(
      'componentName',
      componentName,
      1,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'componentName',
      componentName,
      r'''(?:^[\d\w\-_\.+]*$)|(?:^arn:aws(-\w+)*:[\w\d-]+:([\w\d-]*)?:[\w\d_-]*([:/].+)*$)''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourceGroupName, 'resourceGroupName');
    _s.validateStringLength(
      'resourceGroupName',
      resourceGroupName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceGroupName',
      resourceGroupName,
      r'''[a-zA-Z0-9\.\-_]*''',
      isRequired: true,
    );
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
  Future<DescribeComponentConfigurationResponse>
      describeComponentConfiguration({
    @_s.required String componentName,
    @_s.required String resourceGroupName,
  }) async {
    ArgumentError.checkNotNull(componentName, 'componentName');
    _s.validateStringLength(
      'componentName',
      componentName,
      1,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'componentName',
      componentName,
      r'''(?:^[\d\w\-_\.+]*$)|(?:^arn:aws(-\w+)*:[\w\d-]+:([\w\d-]*)?:[\w\d_-]*([:/].+)*$)''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourceGroupName, 'resourceGroupName');
    _s.validateStringLength(
      'resourceGroupName',
      resourceGroupName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceGroupName',
      resourceGroupName,
      r'''[a-zA-Z0-9\.\-_]*''',
      isRequired: true,
    );
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
  /// The tier of the application component. Supported tiers include
  /// <code>DOT_NET_CORE</code>, <code>DOT_NET_WORKER</code>,
  /// <code>DOT_NET_WEB</code>, <code>SQL_SERVER</code>, and
  /// <code>DEFAULT</code>.
  Future<DescribeComponentConfigurationRecommendationResponse>
      describeComponentConfigurationRecommendation({
    @_s.required String componentName,
    @_s.required String resourceGroupName,
    @_s.required Tier tier,
  }) async {
    ArgumentError.checkNotNull(componentName, 'componentName');
    _s.validateStringLength(
      'componentName',
      componentName,
      1,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'componentName',
      componentName,
      r'''(?:^[\d\w\-_\.+]*$)|(?:^arn:aws(-\w+)*:[\w\d-]+:([\w\d-]*)?:[\w\d_-]*([:/].+)*$)''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourceGroupName, 'resourceGroupName');
    _s.validateStringLength(
      'resourceGroupName',
      resourceGroupName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceGroupName',
      resourceGroupName,
      r'''[a-zA-Z0-9\.\-_]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tier, 'tier');
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
        'Tier': tier?.toValue() ?? '',
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
  Future<DescribeLogPatternResponse> describeLogPattern({
    @_s.required String patternName,
    @_s.required String patternSetName,
    @_s.required String resourceGroupName,
  }) async {
    ArgumentError.checkNotNull(patternName, 'patternName');
    _s.validateStringLength(
      'patternName',
      patternName,
      1,
      50,
      isRequired: true,
    );
    _s.validateStringPattern(
      'patternName',
      patternName,
      r'''[a-zA-Z0-9\.\-_]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(patternSetName, 'patternSetName');
    _s.validateStringLength(
      'patternSetName',
      patternSetName,
      1,
      30,
      isRequired: true,
    );
    _s.validateStringPattern(
      'patternSetName',
      patternSetName,
      r'''[a-zA-Z0-9\.\-_]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourceGroupName, 'resourceGroupName');
    _s.validateStringLength(
      'resourceGroupName',
      resourceGroupName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceGroupName',
      resourceGroupName,
      r'''[a-zA-Z0-9\.\-_]*''',
      isRequired: true,
    );
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
  Future<DescribeObservationResponse> describeObservation({
    @_s.required String observationId,
  }) async {
    ArgumentError.checkNotNull(observationId, 'observationId');
    _s.validateStringLength(
      'observationId',
      observationId,
      38,
      38,
      isRequired: true,
    );
    _s.validateStringPattern(
      'observationId',
      observationId,
      r'''o-[0-9a-fA-F]{8}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{12}''',
      isRequired: true,
    );
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
  Future<DescribeProblemResponse> describeProblem({
    @_s.required String problemId,
  }) async {
    ArgumentError.checkNotNull(problemId, 'problemId');
    _s.validateStringLength(
      'problemId',
      problemId,
      38,
      38,
      isRequired: true,
    );
    _s.validateStringPattern(
      'problemId',
      problemId,
      r'''p-[0-9a-fA-F]{8}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{12}''',
      isRequired: true,
    );
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
  Future<DescribeProblemObservationsResponse> describeProblemObservations({
    @_s.required String problemId,
  }) async {
    ArgumentError.checkNotNull(problemId, 'problemId');
    _s.validateStringLength(
      'problemId',
      problemId,
      38,
      38,
      isRequired: true,
    );
    _s.validateStringPattern(
      'problemId',
      problemId,
      r'''p-[0-9a-fA-F]{8}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{12}''',
      isRequired: true,
    );
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
      },
    );

    return DescribeProblemObservationsResponse.fromJson(jsonResponse.body);
  }

  /// Lists the IDs of the applications that you are monitoring.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call. To retrieve the
  /// remaining results, make another call with the returned
  /// <code>NextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// The token to request the next page of results.
  Future<ListApplicationsResponse> listApplications({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      40,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''.+''',
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
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call. To retrieve the
  /// remaining results, make another call with the returned
  /// <code>NextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// The token to request the next page of results.
  Future<ListComponentsResponse> listComponents({
    @_s.required String resourceGroupName,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(resourceGroupName, 'resourceGroupName');
    _s.validateStringLength(
      'resourceGroupName',
      resourceGroupName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceGroupName',
      resourceGroupName,
      r'''[a-zA-Z0-9\.\-_]*''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      40,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''.+''',
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
    DateTime endTime,
    ConfigurationEventStatus eventStatus,
    int maxResults,
    String nextToken,
    String resourceGroupName,
    DateTime startTime,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      40,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''.+''',
    );
    _s.validateStringLength(
      'resourceGroupName',
      resourceGroupName,
      1,
      256,
    );
    _s.validateStringPattern(
      'resourceGroupName',
      resourceGroupName,
      r'''[a-zA-Z0-9\.\-_]*''',
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
        if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
        if (eventStatus != null) 'EventStatus': eventStatus.toValue(),
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
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call. To retrieve the
  /// remaining results, make another call with the returned
  /// <code>NextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// The token to request the next page of results.
  Future<ListLogPatternSetsResponse> listLogPatternSets({
    @_s.required String resourceGroupName,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(resourceGroupName, 'resourceGroupName');
    _s.validateStringLength(
      'resourceGroupName',
      resourceGroupName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceGroupName',
      resourceGroupName,
      r'''[a-zA-Z0-9\.\-_]*''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      40,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''.+''',
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
    @_s.required String resourceGroupName,
    int maxResults,
    String nextToken,
    String patternSetName,
  }) async {
    ArgumentError.checkNotNull(resourceGroupName, 'resourceGroupName');
    _s.validateStringLength(
      'resourceGroupName',
      resourceGroupName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceGroupName',
      resourceGroupName,
      r'''[a-zA-Z0-9\.\-_]*''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      40,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''.+''',
    );
    _s.validateStringLength(
      'patternSetName',
      patternSetName,
      1,
      30,
    );
    _s.validateStringPattern(
      'patternSetName',
      patternSetName,
      r'''[a-zA-Z0-9\.\-_]*''',
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
  Future<ListProblemsResponse> listProblems({
    DateTime endTime,
    int maxResults,
    String nextToken,
    String resourceGroupName,
    DateTime startTime,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      40,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''.+''',
    );
    _s.validateStringLength(
      'resourceGroupName',
      resourceGroupName,
      1,
      256,
    );
    _s.validateStringPattern(
      'resourceGroupName',
      resourceGroupName,
      r'''[a-zA-Z0-9\.\-_]*''',
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
        if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (resourceGroupName != null) 'ResourceGroupName': resourceGroupName,
        if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
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
    @_s.required String resourceARN,
  }) async {
    ArgumentError.checkNotNull(resourceARN, 'resourceARN');
    _s.validateStringLength(
      'resourceARN',
      resourceARN,
      1,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceARN',
      resourceARN,
      r'''^arn:aws(-\w+)*:[\w\d-]+:([\w\d-]*)?:[\w\d_-]*([:/].+)*$''',
      isRequired: true,
    );
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
    @_s.required String resourceARN,
    @_s.required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(resourceARN, 'resourceARN');
    _s.validateStringLength(
      'resourceARN',
      resourceARN,
      1,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceARN',
      resourceARN,
      r'''^arn:aws(-\w+)*:[\w\d-]+:([\w\d-]*)?:[\w\d_-]*([:/].+)*$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'EC2WindowsBarleyService.TagResource'
    };
    final jsonResponse = await _protocol.send(
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

    return TagResourceResponse.fromJson(jsonResponse.body);
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
    @_s.required String resourceARN,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceARN, 'resourceARN');
    _s.validateStringLength(
      'resourceARN',
      resourceARN,
      1,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceARN',
      resourceARN,
      r'''^arn:aws(-\w+)*:[\w\d-]+:([\w\d-]*)?:[\w\d_-]*([:/].+)*$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'EC2WindowsBarleyService.UntagResource'
    };
    final jsonResponse = await _protocol.send(
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

    return UntagResourceResponse.fromJson(jsonResponse.body);
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
    @_s.required String resourceGroupName,
    bool cWEMonitorEnabled,
    bool opsCenterEnabled,
    String opsItemSNSTopicArn,
    bool removeSNSTopic,
  }) async {
    ArgumentError.checkNotNull(resourceGroupName, 'resourceGroupName');
    _s.validateStringLength(
      'resourceGroupName',
      resourceGroupName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceGroupName',
      resourceGroupName,
      r'''[a-zA-Z0-9\.\-_]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'opsItemSNSTopicArn',
      opsItemSNSTopicArn,
      20,
      300,
    );
    _s.validateStringPattern(
      'opsItemSNSTopicArn',
      opsItemSNSTopicArn,
      r'''^arn:aws(-\w+)*:[\w\d-]+:([\w\d-]*)?:[\w\d_-]*([:/].+)*$''',
    );
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
    @_s.required String componentName,
    @_s.required String resourceGroupName,
    String newComponentName,
    List<String> resourceList,
  }) async {
    ArgumentError.checkNotNull(componentName, 'componentName');
    _s.validateStringLength(
      'componentName',
      componentName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'componentName',
      componentName,
      r'''^[\d\w\-_\.+]*$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourceGroupName, 'resourceGroupName');
    _s.validateStringLength(
      'resourceGroupName',
      resourceGroupName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceGroupName',
      resourceGroupName,
      r'''[a-zA-Z0-9\.\-_]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'newComponentName',
      newComponentName,
      1,
      128,
    );
    _s.validateStringPattern(
      'newComponentName',
      newComponentName,
      r'''^[\d\w\-_\.+]*$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'EC2WindowsBarleyService.UpdateComponent'
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
        if (newComponentName != null) 'NewComponentName': newComponentName,
        if (resourceList != null) 'ResourceList': resourceList,
      },
    );

    return UpdateComponentResponse.fromJson(jsonResponse.body);
  }

  /// Updates the monitoring configurations for the component. The configuration
  /// input parameter is an escaped JSON of the configuration and should match
  /// the schema of what is returned by
  /// <code>DescribeComponentConfigurationRecommendation</code>.
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
  /// The tier of the application component. Supported tiers include
  /// <code>DOT_NET_WORKER</code>, <code>DOT_NET_WEB</code>,
  /// <code>DOT_NET_CORE</code>, <code>SQL_SERVER</code>, and
  /// <code>DEFAULT</code>.
  Future<void> updateComponentConfiguration({
    @_s.required String componentName,
    @_s.required String resourceGroupName,
    String componentConfiguration,
    bool monitor,
    Tier tier,
  }) async {
    ArgumentError.checkNotNull(componentName, 'componentName');
    _s.validateStringLength(
      'componentName',
      componentName,
      1,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'componentName',
      componentName,
      r'''(?:^[\d\w\-_\.+]*$)|(?:^arn:aws(-\w+)*:[\w\d-]+:([\w\d-]*)?:[\w\d_-]*([:/].+)*$)''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourceGroupName, 'resourceGroupName');
    _s.validateStringLength(
      'resourceGroupName',
      resourceGroupName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceGroupName',
      resourceGroupName,
      r'''[a-zA-Z0-9\.\-_]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'componentConfiguration',
      componentConfiguration,
      1,
      10000,
    );
    _s.validateStringPattern(
      'componentConfiguration',
      componentConfiguration,
      r'''[\S\s]+''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'EC2WindowsBarleyService.UpdateComponentConfiguration'
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
        if (componentConfiguration != null)
          'ComponentConfiguration': componentConfiguration,
        if (monitor != null) 'Monitor': monitor,
        if (tier != null) 'Tier': tier.toValue(),
      },
    );

    return UpdateComponentConfigurationResponse.fromJson(jsonResponse.body);
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
    @_s.required String patternName,
    @_s.required String patternSetName,
    @_s.required String resourceGroupName,
    String pattern,
    int rank,
  }) async {
    ArgumentError.checkNotNull(patternName, 'patternName');
    _s.validateStringLength(
      'patternName',
      patternName,
      1,
      50,
      isRequired: true,
    );
    _s.validateStringPattern(
      'patternName',
      patternName,
      r'''[a-zA-Z0-9\.\-_]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(patternSetName, 'patternSetName');
    _s.validateStringLength(
      'patternSetName',
      patternSetName,
      1,
      30,
      isRequired: true,
    );
    _s.validateStringPattern(
      'patternSetName',
      patternSetName,
      r'''[a-zA-Z0-9\.\-_]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourceGroupName, 'resourceGroupName');
    _s.validateStringLength(
      'resourceGroupName',
      resourceGroupName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceGroupName',
      resourceGroupName,
      r'''[a-zA-Z0-9\.\-_]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'pattern',
      pattern,
      1,
      50,
    );
    _s.validateStringPattern(
      'pattern',
      pattern,
      r'''[\S\s]+''',
    );
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
}

/// Describes a standalone resource or similarly grouped resources that the
/// application is made up of.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ApplicationComponent {
  /// The name of the component.
  @_s.JsonKey(name: 'ComponentName')
  final String componentName;

  /// If logging is supported for the resource type, indicates whether the
  /// component has configured logs to be monitored.
  @_s.JsonKey(name: 'ComponentRemarks')
  final String componentRemarks;

  /// Workloads detected in the application component.
  @_s.JsonKey(name: 'DetectedWorkload')
  final Map<Tier, Map<String, String>> detectedWorkload;

  /// Indicates whether the application component is monitored.
  @_s.JsonKey(name: 'Monitor')
  final bool monitor;

  /// The operating system of the component.
  @_s.JsonKey(name: 'OsType')
  final OsType osType;

  /// The resource type. Supported resource types include EC2 instances, Auto
  /// Scaling group, Classic ELB, Application ELB, and SQS Queue.
  @_s.JsonKey(name: 'ResourceType')
  final String resourceType;

  /// The stack tier of the application component.
  @_s.JsonKey(name: 'Tier')
  final Tier tier;

  ApplicationComponent({
    this.componentName,
    this.componentRemarks,
    this.detectedWorkload,
    this.monitor,
    this.osType,
    this.resourceType,
    this.tier,
  });
  factory ApplicationComponent.fromJson(Map<String, dynamic> json) =>
      _$ApplicationComponentFromJson(json);
}

/// Describes the status of the application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ApplicationInfo {
  /// Indicates whether Application Insights can listen to CloudWatch events for
  /// the application resources, such as <code>instance terminated</code>,
  /// <code>failed deployment</code>, and others.
  @_s.JsonKey(name: 'CWEMonitorEnabled')
  final bool cWEMonitorEnabled;

  /// The lifecycle of the application.
  @_s.JsonKey(name: 'LifeCycle')
  final String lifeCycle;

  /// Indicates whether Application Insights will create opsItems for any problem
  /// detected by Application Insights for an application.
  @_s.JsonKey(name: 'OpsCenterEnabled')
  final bool opsCenterEnabled;

  /// The SNS topic provided to Application Insights that is associated to the
  /// created opsItems to receive SNS notifications for opsItem updates.
  @_s.JsonKey(name: 'OpsItemSNSTopicArn')
  final String opsItemSNSTopicArn;

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
  @_s.JsonKey(name: 'Remarks')
  final String remarks;

  /// The name of the resource group used for the application.
  @_s.JsonKey(name: 'ResourceGroupName')
  final String resourceGroupName;

  ApplicationInfo({
    this.cWEMonitorEnabled,
    this.lifeCycle,
    this.opsCenterEnabled,
    this.opsItemSNSTopicArn,
    this.remarks,
    this.resourceGroupName,
  });
  factory ApplicationInfo.fromJson(Map<String, dynamic> json) =>
      _$ApplicationInfoFromJson(json);
}

enum CloudWatchEventSource {
  @_s.JsonValue('EC2')
  ec2,
  @_s.JsonValue('CODE_DEPLOY')
  codeDeploy,
  @_s.JsonValue('HEALTH')
  health,
  @_s.JsonValue('RDS')
  rds,
}

/// The event information.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ConfigurationEvent {
  /// The details of the event in plain text.
  @_s.JsonKey(name: 'EventDetail')
  final String eventDetail;

  /// The name of the resource Application Insights attempted to configure.
  @_s.JsonKey(name: 'EventResourceName')
  final String eventResourceName;

  /// The resource type that Application Insights attempted to configure, for
  /// example, CLOUDWATCH_ALARM.
  @_s.JsonKey(name: 'EventResourceType')
  final ConfigurationEventResourceType eventResourceType;

  /// The status of the configuration update event. Possible values include INFO,
  /// WARN, and ERROR.
  @_s.JsonKey(name: 'EventStatus')
  final ConfigurationEventStatus eventStatus;

  /// The timestamp of the event.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'EventTime')
  final DateTime eventTime;

  /// The resource monitored by Application Insights.
  @_s.JsonKey(name: 'MonitoredResourceARN')
  final String monitoredResourceARN;

  ConfigurationEvent({
    this.eventDetail,
    this.eventResourceName,
    this.eventResourceType,
    this.eventStatus,
    this.eventTime,
    this.monitoredResourceARN,
  });
  factory ConfigurationEvent.fromJson(Map<String, dynamic> json) =>
      _$ConfigurationEventFromJson(json);
}

enum ConfigurationEventResourceType {
  @_s.JsonValue('CLOUDWATCH_ALARM')
  cloudwatchAlarm,
  @_s.JsonValue('CLOUDWATCH_LOG')
  cloudwatchLog,
  @_s.JsonValue('CLOUDFORMATION')
  cloudformation,
  @_s.JsonValue('SSM_ASSOCIATION')
  ssmAssociation,
}

enum ConfigurationEventStatus {
  @_s.JsonValue('INFO')
  info,
  @_s.JsonValue('WARN')
  warn,
  @_s.JsonValue('ERROR')
  error,
}

extension on ConfigurationEventStatus {
  String toValue() {
    switch (this) {
      case ConfigurationEventStatus.info:
        return 'INFO';
      case ConfigurationEventStatus.warn:
        return 'WARN';
      case ConfigurationEventStatus.error:
        return 'ERROR';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateApplicationResponse {
  /// Information about the application.
  @_s.JsonKey(name: 'ApplicationInfo')
  final ApplicationInfo applicationInfo;

  CreateApplicationResponse({
    this.applicationInfo,
  });
  factory CreateApplicationResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateApplicationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateComponentResponse {
  CreateComponentResponse();
  factory CreateComponentResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateComponentResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateLogPatternResponse {
  /// The successfully created log pattern.
  @_s.JsonKey(name: 'LogPattern')
  final LogPattern logPattern;

  /// The name of the resource group.
  @_s.JsonKey(name: 'ResourceGroupName')
  final String resourceGroupName;

  CreateLogPatternResponse({
    this.logPattern,
    this.resourceGroupName,
  });
  factory CreateLogPatternResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateLogPatternResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteApplicationResponse {
  DeleteApplicationResponse();
  factory DeleteApplicationResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteApplicationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteComponentResponse {
  DeleteComponentResponse();
  factory DeleteComponentResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteComponentResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteLogPatternResponse {
  DeleteLogPatternResponse();
  factory DeleteLogPatternResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteLogPatternResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeApplicationResponse {
  /// Information about the application.
  @_s.JsonKey(name: 'ApplicationInfo')
  final ApplicationInfo applicationInfo;

  DescribeApplicationResponse({
    this.applicationInfo,
  });
  factory DescribeApplicationResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeApplicationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeComponentConfigurationRecommendationResponse {
  /// The recommended configuration settings of the component. The value is the
  /// escaped JSON of the configuration.
  @_s.JsonKey(name: 'ComponentConfiguration')
  final String componentConfiguration;

  DescribeComponentConfigurationRecommendationResponse({
    this.componentConfiguration,
  });
  factory DescribeComponentConfigurationRecommendationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeComponentConfigurationRecommendationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeComponentConfigurationResponse {
  /// The configuration settings of the component. The value is the escaped JSON
  /// of the configuration.
  @_s.JsonKey(name: 'ComponentConfiguration')
  final String componentConfiguration;

  /// Indicates whether the application component is monitored.
  @_s.JsonKey(name: 'Monitor')
  final bool monitor;

  /// The tier of the application component. Supported tiers include
  /// <code>DOT_NET_CORE</code>, <code>DOT_NET_WORKER</code>,
  /// <code>DOT_NET_WEB</code>, <code>SQL_SERVER</code>, and <code>DEFAULT</code>
  @_s.JsonKey(name: 'Tier')
  final Tier tier;

  DescribeComponentConfigurationResponse({
    this.componentConfiguration,
    this.monitor,
    this.tier,
  });
  factory DescribeComponentConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeComponentConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeComponentResponse {
  @_s.JsonKey(name: 'ApplicationComponent')
  final ApplicationComponent applicationComponent;

  /// The list of resource ARNs that belong to the component.
  @_s.JsonKey(name: 'ResourceList')
  final List<String> resourceList;

  DescribeComponentResponse({
    this.applicationComponent,
    this.resourceList,
  });
  factory DescribeComponentResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeComponentResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeLogPatternResponse {
  /// The successfully created log pattern.
  @_s.JsonKey(name: 'LogPattern')
  final LogPattern logPattern;

  /// The name of the resource group.
  @_s.JsonKey(name: 'ResourceGroupName')
  final String resourceGroupName;

  DescribeLogPatternResponse({
    this.logPattern,
    this.resourceGroupName,
  });
  factory DescribeLogPatternResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeLogPatternResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeObservationResponse {
  /// Information about the observation.
  @_s.JsonKey(name: 'Observation')
  final Observation observation;

  DescribeObservationResponse({
    this.observation,
  });
  factory DescribeObservationResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeObservationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeProblemObservationsResponse {
  /// Observations related to the problem.
  @_s.JsonKey(name: 'RelatedObservations')
  final RelatedObservations relatedObservations;

  DescribeProblemObservationsResponse({
    this.relatedObservations,
  });
  factory DescribeProblemObservationsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeProblemObservationsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeProblemResponse {
  /// Information about the problem.
  @_s.JsonKey(name: 'Problem')
  final Problem problem;

  DescribeProblemResponse({
    this.problem,
  });
  factory DescribeProblemResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeProblemResponseFromJson(json);
}

enum FeedbackKey {
  @_s.JsonValue('INSIGHTS_FEEDBACK')
  insightsFeedback,
}

enum FeedbackValue {
  @_s.JsonValue('NOT_SPECIFIED')
  notSpecified,
  @_s.JsonValue('USEFUL')
  useful,
  @_s.JsonValue('NOT_USEFUL')
  notUseful,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListApplicationsResponse {
  /// The list of applications.
  @_s.JsonKey(name: 'ApplicationInfoList')
  final List<ApplicationInfo> applicationInfoList;

  /// The token used to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListApplicationsResponse({
    this.applicationInfoList,
    this.nextToken,
  });
  factory ListApplicationsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListApplicationsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListComponentsResponse {
  /// The list of application components.
  @_s.JsonKey(name: 'ApplicationComponentList')
  final List<ApplicationComponent> applicationComponentList;

  /// The token to request the next page of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListComponentsResponse({
    this.applicationComponentList,
    this.nextToken,
  });
  factory ListComponentsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListComponentsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListConfigurationHistoryResponse {
  /// The list of configuration events and their corresponding details.
  @_s.JsonKey(name: 'EventList')
  final List<ConfigurationEvent> eventList;

  /// The <code>NextToken</code> value to include in a future
  /// <code>ListConfigurationHistory</code> request. When the results of a
  /// <code>ListConfigurationHistory</code> request exceed
  /// <code>MaxResults</code>, this value can be used to retrieve the next page of
  /// results. This value is <code>null</code> when there are no more results to
  /// return.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListConfigurationHistoryResponse({
    this.eventList,
    this.nextToken,
  });
  factory ListConfigurationHistoryResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListConfigurationHistoryResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListLogPatternSetsResponse {
  /// The list of log pattern sets.
  @_s.JsonKey(name: 'LogPatternSets')
  final List<String> logPatternSets;

  /// The token used to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The name of the resource group.
  @_s.JsonKey(name: 'ResourceGroupName')
  final String resourceGroupName;

  ListLogPatternSetsResponse({
    this.logPatternSets,
    this.nextToken,
    this.resourceGroupName,
  });
  factory ListLogPatternSetsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListLogPatternSetsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListLogPatternsResponse {
  /// The list of log patterns.
  @_s.JsonKey(name: 'LogPatterns')
  final List<LogPattern> logPatterns;

  /// The token used to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The name of the resource group.
  @_s.JsonKey(name: 'ResourceGroupName')
  final String resourceGroupName;

  ListLogPatternsResponse({
    this.logPatterns,
    this.nextToken,
    this.resourceGroupName,
  });
  factory ListLogPatternsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListLogPatternsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListProblemsResponse {
  /// The token used to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The list of problems.
  @_s.JsonKey(name: 'ProblemList')
  final List<Problem> problemList;

  ListProblemsResponse({
    this.nextToken,
    this.problemList,
  });
  factory ListProblemsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListProblemsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// An array that lists all the tags that are associated with the application.
  /// Each tag consists of a required tag key (<code>Key</code>) and an associated
  /// tag value (<code>Value</code>).
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

enum LogFilter {
  @_s.JsonValue('ERROR')
  error,
  @_s.JsonValue('WARN')
  warn,
  @_s.JsonValue('INFO')
  info,
}

/// An object that defines the log patterns that belongs to a
/// <code>LogPatternSet</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LogPattern {
  /// A regular expression that defines the log pattern. A log pattern can contain
  /// as many as 50 characters, and it cannot be empty. The pattern must be DFA
  /// compatible. Patterns that utilize forward lookahead or backreference
  /// constructions are not supported.
  @_s.JsonKey(name: 'Pattern')
  final String pattern;

  /// The name of the log pattern. A log pattern name can contain as many as 50
  /// characters, and it cannot be empty. The characters can be Unicode letters,
  /// digits, or one of the following symbols: period, dash, underscore.
  @_s.JsonKey(name: 'PatternName')
  final String patternName;

  /// The name of the log pattern. A log pattern name can contain as many as 30
  /// characters, and it cannot be empty. The characters can be Unicode letters,
  /// digits, or one of the following symbols: period, dash, underscore.
  @_s.JsonKey(name: 'PatternSetName')
  final String patternSetName;

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
  @_s.JsonKey(name: 'Rank')
  final int rank;

  LogPattern({
    this.pattern,
    this.patternName,
    this.patternSetName,
    this.rank,
  });
  factory LogPattern.fromJson(Map<String, dynamic> json) =>
      _$LogPatternFromJson(json);
}

/// Describes an anomaly or error with the application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Observation {
  /// The detail type of the CloudWatch Event-based observation, for example,
  /// <code>EC2 Instance State-change Notification</code>.
  @_s.JsonKey(name: 'CloudWatchEventDetailType')
  final String cloudWatchEventDetailType;

  /// The ID of the CloudWatch Event-based observation related to the detected
  /// problem.
  @_s.JsonKey(name: 'CloudWatchEventId')
  final String cloudWatchEventId;

  /// The source of the CloudWatch Event.
  @_s.JsonKey(name: 'CloudWatchEventSource')
  final CloudWatchEventSource cloudWatchEventSource;

  /// The CodeDeploy application to which the deployment belongs.
  @_s.JsonKey(name: 'CodeDeployApplication')
  final String codeDeployApplication;

  /// The deployment group to which the CodeDeploy deployment belongs.
  @_s.JsonKey(name: 'CodeDeployDeploymentGroup')
  final String codeDeployDeploymentGroup;

  /// The deployment ID of the CodeDeploy-based observation related to the
  /// detected problem.
  @_s.JsonKey(name: 'CodeDeployDeploymentId')
  final String codeDeployDeploymentId;

  /// The instance group to which the CodeDeploy instance belongs.
  @_s.JsonKey(name: 'CodeDeployInstanceGroupId')
  final String codeDeployInstanceGroupId;

  /// The status of the CodeDeploy deployment, for example <code>SUCCESS</code> or
  /// <code> FAILURE</code>.
  @_s.JsonKey(name: 'CodeDeployState')
  final String codeDeployState;

  /// The cause of an EBS CloudWatch event.
  @_s.JsonKey(name: 'EbsCause')
  final String ebsCause;

  /// The type of EBS CloudWatch event, such as <code>createVolume</code>,
  /// <code>deleteVolume</code> or <code>attachVolume</code>.
  @_s.JsonKey(name: 'EbsEvent')
  final String ebsEvent;

  /// The request ID of an EBS CloudWatch event.
  @_s.JsonKey(name: 'EbsRequestId')
  final String ebsRequestId;

  /// The result of an EBS CloudWatch event, such as <code>failed</code> or
  /// <code>succeeded</code>.
  @_s.JsonKey(name: 'EbsResult')
  final String ebsResult;

  /// The state of the instance, such as <code>STOPPING</code> or
  /// <code>TERMINATING</code>.
  @_s.JsonKey(name: 'Ec2State')
  final String ec2State;

  /// The time when the observation ended, in epoch seconds.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'EndTime')
  final DateTime endTime;

  /// The Amazon Resource Name (ARN) of the AWS Health Event-based observation.
  @_s.JsonKey(name: 'HealthEventArn')
  final String healthEventArn;

  /// The description of the AWS Health event provided by the service, such as
  /// Amazon EC2.
  @_s.JsonKey(name: 'HealthEventDescription')
  final String healthEventDescription;

  /// The category of the AWS Health event, such as <code>issue</code>.
  @_s.JsonKey(name: 'HealthEventTypeCategory')
  final String healthEventTypeCategory;

  /// The type of the AWS Health event, for example,
  /// <code>AWS_EC2_POWER_CONNECTIVITY_ISSUE</code>.
  @_s.JsonKey(name: 'HealthEventTypeCode')
  final String healthEventTypeCode;

  /// The service to which the AWS Health Event belongs, such as EC2.
  @_s.JsonKey(name: 'HealthService')
  final String healthService;

  /// The ID of the observation type.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The timestamp in the CloudWatch Logs that specifies when the matched line
  /// occurred.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LineTime')
  final DateTime lineTime;

  /// The log filter of the observation.
  @_s.JsonKey(name: 'LogFilter')
  final LogFilter logFilter;

  /// The log group name.
  @_s.JsonKey(name: 'LogGroup')
  final String logGroup;

  /// The log text of the observation.
  @_s.JsonKey(name: 'LogText')
  final String logText;

  /// The name of the observation metric.
  @_s.JsonKey(name: 'MetricName')
  final String metricName;

  /// The namespace of the observation metric.
  @_s.JsonKey(name: 'MetricNamespace')
  final String metricNamespace;

  /// The category of an RDS event.
  @_s.JsonKey(name: 'RdsEventCategories')
  final String rdsEventCategories;

  /// The message of an RDS event.
  @_s.JsonKey(name: 'RdsEventMessage')
  final String rdsEventMessage;

  /// The name of the S3 CloudWatch Event-based observation.
  @_s.JsonKey(name: 'S3EventName')
  final String s3EventName;

  /// The source resource ARN of the observation.
  @_s.JsonKey(name: 'SourceARN')
  final String sourceARN;

  /// The source type of the observation.
  @_s.JsonKey(name: 'SourceType')
  final String sourceType;

  /// The time when the observation was first detected, in epoch seconds.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'StartTime')
  final DateTime startTime;

  /// The Amazon Resource Name (ARN) of the step function-based observation.
  @_s.JsonKey(name: 'StatesArn')
  final String statesArn;

  /// The Amazon Resource Name (ARN) of the step function execution-based
  /// observation.
  @_s.JsonKey(name: 'StatesExecutionArn')
  final String statesExecutionArn;

  /// The input to the step function-based observation.
  @_s.JsonKey(name: 'StatesInput')
  final String statesInput;

  /// The status of the step function-related observation.
  @_s.JsonKey(name: 'StatesStatus')
  final String statesStatus;

  /// The unit of the source observation metric.
  @_s.JsonKey(name: 'Unit')
  final String unit;

  /// The value of the source observation metric.
  @_s.JsonKey(name: 'Value')
  final double value;

  /// The X-Ray request error percentage for this node.
  @_s.JsonKey(name: 'XRayErrorPercent')
  final int xRayErrorPercent;

  /// The X-Ray request fault percentage for this node.
  @_s.JsonKey(name: 'XRayFaultPercent')
  final int xRayFaultPercent;

  /// The name of the X-Ray node.
  @_s.JsonKey(name: 'XRayNodeName')
  final String xRayNodeName;

  /// The type of the X-Ray node.
  @_s.JsonKey(name: 'XRayNodeType')
  final String xRayNodeType;

  /// The X-Ray node request average latency for this node.
  @_s.JsonKey(name: 'XRayRequestAverageLatency')
  final int xRayRequestAverageLatency;

  /// The X-Ray request count for this node.
  @_s.JsonKey(name: 'XRayRequestCount')
  final int xRayRequestCount;

  /// The X-Ray request throttle percentage for this node.
  @_s.JsonKey(name: 'XRayThrottlePercent')
  final int xRayThrottlePercent;

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
  factory Observation.fromJson(Map<String, dynamic> json) =>
      _$ObservationFromJson(json);
}

enum OsType {
  @_s.JsonValue('WINDOWS')
  windows,
  @_s.JsonValue('LINUX')
  linux,
}

/// Describes a problem that is detected by correlating observations.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Problem {
  /// The resource affected by the problem.
  @_s.JsonKey(name: 'AffectedResource')
  final String affectedResource;

  /// The time when the problem ended, in epoch seconds.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'EndTime')
  final DateTime endTime;

  /// Feedback provided by the user about the problem.
  @_s.JsonKey(name: 'Feedback')
  final Map<FeedbackKey, FeedbackValue> feedback;

  /// The ID of the problem.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// A detailed analysis of the problem using machine learning.
  @_s.JsonKey(name: 'Insights')
  final String insights;

  /// The name of the resource group affected by the problem.
  @_s.JsonKey(name: 'ResourceGroupName')
  final String resourceGroupName;

  /// A measure of the level of impact of the problem.
  @_s.JsonKey(name: 'SeverityLevel')
  final SeverityLevel severityLevel;

  /// The time when the problem started, in epoch seconds.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'StartTime')
  final DateTime startTime;

  /// The status of the problem.
  @_s.JsonKey(name: 'Status')
  final Status status;

  /// The name of the problem.
  @_s.JsonKey(name: 'Title')
  final String title;

  Problem({
    this.affectedResource,
    this.endTime,
    this.feedback,
    this.id,
    this.insights,
    this.resourceGroupName,
    this.severityLevel,
    this.startTime,
    this.status,
    this.title,
  });
  factory Problem.fromJson(Map<String, dynamic> json) =>
      _$ProblemFromJson(json);
}

/// Describes observations related to the problem.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RelatedObservations {
  /// The list of observations related to the problem.
  @_s.JsonKey(name: 'ObservationList')
  final List<Observation> observationList;

  RelatedObservations({
    this.observationList,
  });
  factory RelatedObservations.fromJson(Map<String, dynamic> json) =>
      _$RelatedObservationsFromJson(json);
}

enum SeverityLevel {
  @_s.JsonValue('Low')
  low,
  @_s.JsonValue('Medium')
  medium,
  @_s.JsonValue('High')
  high,
}

enum Status {
  @_s.JsonValue('IGNORE')
  ignore,
  @_s.JsonValue('RESOLVED')
  resolved,
  @_s.JsonValue('PENDING')
  pending,
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
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Tag {
  /// One part of a key-value pair that defines a tag. The maximum length of a tag
  /// key is 128 characters. The minimum length is 1 character.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The optional part of a key-value pair that defines a tag. The maximum length
  /// of a tag value is 256 characters. The minimum length is 0 characters. If you
  /// don't want an application to have a specific tag value, don't specify a
  /// value for this parameter.
  @_s.JsonKey(name: 'Value')
  final String value;

  Tag({
    @_s.required this.key,
    @_s.required this.value,
  });
  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);
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

enum Tier {
  @_s.JsonValue('CUSTOM')
  custom,
  @_s.JsonValue('DEFAULT')
  $default,
  @_s.JsonValue('DOT_NET_CORE')
  dotNetCore,
  @_s.JsonValue('DOT_NET_WORKER')
  dotNetWorker,
  @_s.JsonValue('DOT_NET_WEB_TIER')
  dotNetWebTier,
  @_s.JsonValue('DOT_NET_WEB')
  dotNetWeb,
  @_s.JsonValue('SQL_SERVER')
  sqlServer,
  @_s.JsonValue('SQL_SERVER_ALWAYSON_AVAILABILITY_GROUP')
  sqlServerAlwaysonAvailabilityGroup,
  @_s.JsonValue('MYSQL')
  mysql,
  @_s.JsonValue('POSTGRESQL')
  postgresql,
  @_s.JsonValue('JAVA_JMX')
  javaJmx,
  @_s.JsonValue('ORACLE')
  oracle,
}

extension on Tier {
  String toValue() {
    switch (this) {
      case Tier.custom:
        return 'CUSTOM';
      case Tier.$default:
        return 'DEFAULT';
      case Tier.dotNetCore:
        return 'DOT_NET_CORE';
      case Tier.dotNetWorker:
        return 'DOT_NET_WORKER';
      case Tier.dotNetWebTier:
        return 'DOT_NET_WEB_TIER';
      case Tier.dotNetWeb:
        return 'DOT_NET_WEB';
      case Tier.sqlServer:
        return 'SQL_SERVER';
      case Tier.sqlServerAlwaysonAvailabilityGroup:
        return 'SQL_SERVER_ALWAYSON_AVAILABILITY_GROUP';
      case Tier.mysql:
        return 'MYSQL';
      case Tier.postgresql:
        return 'POSTGRESQL';
      case Tier.javaJmx:
        return 'JAVA_JMX';
      case Tier.oracle:
        return 'ORACLE';
    }
    throw Exception('Unknown enum value: $this');
  }
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
class UpdateApplicationResponse {
  /// Information about the application.
  @_s.JsonKey(name: 'ApplicationInfo')
  final ApplicationInfo applicationInfo;

  UpdateApplicationResponse({
    this.applicationInfo,
  });
  factory UpdateApplicationResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateApplicationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateComponentConfigurationResponse {
  UpdateComponentConfigurationResponse();
  factory UpdateComponentConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateComponentConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateComponentResponse {
  UpdateComponentResponse();
  factory UpdateComponentResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateComponentResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateLogPatternResponse {
  /// The successfully created log pattern.
  @_s.JsonKey(name: 'LogPattern')
  final LogPattern logPattern;

  /// The name of the resource group.
  @_s.JsonKey(name: 'ResourceGroupName')
  final String resourceGroupName;

  UpdateLogPatternResponse({
    this.logPattern,
    this.resourceGroupName,
  });
  factory UpdateLogPatternResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateLogPatternResponseFromJson(json);
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String type, String message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String type, String message})
      : super(type: type, code: 'BadRequestException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String type, String message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class ResourceInUseException extends _s.GenericAwsException {
  ResourceInUseException({String type, String message})
      : super(type: type, code: 'ResourceInUseException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class TagsAlreadyExistException extends _s.GenericAwsException {
  TagsAlreadyExistException({String type, String message})
      : super(type: type, code: 'TagsAlreadyExistException', message: message);
}

class TooManyTagsException extends _s.GenericAwsException {
  TooManyTagsException({String type, String message})
      : super(type: type, code: 'TooManyTagsException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String type, String message})
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
