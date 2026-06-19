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

/// Amazon Web Services Billing and Cost Management Dashboards is a service that
/// enables you to create, manage, and share dashboards that combine multiple
/// visualizations of your Amazon Web Services cost and usage data. You can
/// combine multiple data sources including Cost Explorer, Savings Plans, and
/// Reserved Instance metrics into unified dashboards, helping you analyze
/// spending patterns and share cost insights across your organization.
///
/// You can use the Amazon Web Services Billing and Cost Management Dashboards
/// API to programmatically create, manage, and share dashboards. This includes
/// creating custom dashboards, configuring widgets, managing dashboard
/// permissions, and sharing dashboards across accounts in your organization.
class BcmDashboards {
  final _s.JsonProtocol _protocol;
  BcmDashboards({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'bcm-dashboards',
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

  /// Creates a new dashboard that can contain multiple widgets displaying cost
  /// and usage data. You can add custom widgets or use predefined widgets,
  /// arranging them in your preferred layout.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the dashboard. The name must be unique within your account.
  ///
  /// Parameter [widgets] :
  /// An array of widget configurations that define the visualizations to be
  /// displayed in the dashboard. Each dashboard can contain up to 20 widgets.
  ///
  /// Parameter [description] :
  /// A description of the dashboard's purpose or contents.
  ///
  /// Parameter [resourceTags] :
  /// The tags to apply to the dashboard resource for organization and
  /// management.
  Future<CreateDashboardResponse> createDashboard({
    required String name,
    required List<Widget> widgets,
    String? description,
    List<ResourceTag>? resourceTags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSBCMDashboardsService.CreateDashboard'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
        'widgets': widgets,
        if (description != null) 'description': description,
        if (resourceTags != null) 'resourceTags': resourceTags,
      },
    );

    return CreateDashboardResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new scheduled report for a dashboard. A scheduled report
  /// automatically generates and delivers dashboard snapshots on a recurring
  /// schedule. Reports are delivered within 15 minutes of the scheduled
  /// delivery time.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [scheduledReport] :
  /// The configuration for the scheduled report, including the dashboard to
  /// report on, the schedule, and the execution role that the service will use
  /// to generate the dashboard snapshot.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [resourceTags] :
  /// The tags to apply to the scheduled report resource for organization and
  /// management.
  Future<CreateScheduledReportResponse> createScheduledReport({
    required ScheduledReportInput scheduledReport,
    String? clientToken,
    List<ResourceTag>? resourceTags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSBCMDashboardsService.CreateScheduledReport'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'scheduledReport': scheduledReport,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (resourceTags != null) 'resourceTags': resourceTags,
      },
    );

    return CreateScheduledReportResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a specified dashboard. This action cannot be undone.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// The ARN of the dashboard to be deleted.
  Future<DeleteDashboardResponse> deleteDashboard({
    required String arn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSBCMDashboardsService.DeleteDashboard'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
      },
    );

    return DeleteDashboardResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a specified scheduled report. This is an irreversible operation.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// The ARN of the scheduled report to delete.
  Future<DeleteScheduledReportResponse> deleteScheduledReport({
    required String arn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSBCMDashboardsService.DeleteScheduledReport'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
      },
    );

    return DeleteScheduledReportResponse.fromJson(jsonResponse.body);
  }

  /// Triggers an immediate execution of a scheduled report, outside of its
  /// regular schedule. The scheduled report must be in <code>ENABLED</code>
  /// state. Calling this operation on a <code>DISABLED</code> scheduled report
  /// returns a <code>ValidationException</code>.
  /// <note>
  /// If a <code>clientToken</code> is provided, the service uses it for
  /// idempotency. Requests with the same client token will not trigger a new
  /// execution within the same minute.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// The ARN of the scheduled report to execute.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [dryRun] :
  /// When set to <code>true</code>, validates the scheduled report
  /// configuration without triggering an actual execution.
  Future<ExecuteScheduledReportResponse> executeScheduledReport({
    required String arn,
    String? clientToken,
    bool? dryRun,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSBCMDashboardsService.ExecuteScheduledReport'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (dryRun != null) 'dryRun': dryRun,
      },
    );

    return ExecuteScheduledReportResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the configuration and metadata of a specified dashboard,
  /// including its widgets and layout settings.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// The ARN of the dashboard to retrieve. This is required to uniquely
  /// identify the dashboard.
  Future<GetDashboardResponse> getDashboard({
    required String arn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSBCMDashboardsService.GetDashboard'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
      },
    );

    return GetDashboardResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the resource-based policy attached to a dashboard, showing
  /// sharing configurations and permissions.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the dashboard whose resource-based policy you want to retrieve.
  Future<GetResourcePolicyResponse> getResourcePolicy({
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSBCMDashboardsService.GetResourcePolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceArn': resourceArn,
      },
    );

    return GetResourcePolicyResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the configuration and metadata of a specified scheduled report.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// The ARN of the scheduled report to retrieve.
  Future<GetScheduledReportResponse> getScheduledReport({
    required String arn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSBCMDashboardsService.GetScheduledReport'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
      },
    );

    return GetScheduledReportResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of all dashboards in your account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call. The default
  /// value is 20.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results. Use the value returned in the
  /// previous response.
  Future<ListDashboardsResponse> listDashboards({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSBCMDashboardsService.ListDashboards'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListDashboardsResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of scheduled reports in your account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call. Valid range is 1
  /// to 100. The default value is 50.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results. Use the value returned in the
  /// previous response.
  Future<ListScheduledReportsResponse> listScheduledReports({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSBCMDashboardsService.ListScheduledReports'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListScheduledReportsResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of all tags associated with a specified dashboard resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The unique identifier for the resource.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSBCMDashboardsService.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceArn': resourceArn,
      },
    );

    return ListTagsForResourceResponse.fromJson(jsonResponse.body);
  }

  /// Adds or updates tags for a specified dashboard resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The unique identifier for the resource.
  ///
  /// Parameter [resourceTags] :
  /// The tags to add to the dashboard resource.
  Future<void> tagResource({
    required String resourceArn,
    required List<ResourceTag> resourceTags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSBCMDashboardsService.TagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceArn': resourceArn,
        'resourceTags': resourceTags,
      },
    );
  }

  /// Removes specified tags from a dashboard resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The unique identifier for the resource.
  ///
  /// Parameter [resourceTagKeys] :
  /// The keys of the tags to remove from the dashboard resource.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> resourceTagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSBCMDashboardsService.UntagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceArn': resourceArn,
        'resourceTagKeys': resourceTagKeys,
      },
    );
  }

  /// Updates an existing dashboard's properties, including its name,
  /// description, and widget configurations.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// The ARN of the dashboard to update.
  ///
  /// Parameter [name] :
  /// The new name for the dashboard.
  ///
  /// Parameter [description] :
  /// The new description for the dashboard.
  ///
  /// Parameter [widgets] :
  /// The updated array of widget configurations for the dashboard. Replaces all
  /// existing widgets.
  Future<UpdateDashboardResponse> updateDashboard({
    required String arn,
    required String name,
    String? description,
    List<Widget>? widgets,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSBCMDashboardsService.UpdateDashboard'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
        'name': name,
        if (description != null) 'description': description,
        if (widgets != null) 'widgets': widgets,
      },
    );

    return UpdateDashboardResponse.fromJson(jsonResponse.body);
  }

  /// Updates an existing scheduled report's properties, including its name,
  /// description, schedule configuration, and widget settings. Only the
  /// parameters included in the request are updated; all other properties
  /// remain unchanged.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// The ARN of the scheduled report to update.
  ///
  /// Parameter [clearWidgetDateRangeOverride] :
  /// Set to true to clear existing widgetDateRangeOverride.
  ///
  /// Parameter [clearWidgetIds] :
  /// Set to true to clear existing widgetIds.
  ///
  /// Parameter [dashboardArn] :
  /// The ARN of the dashboard to associate with the scheduled report.
  ///
  /// Parameter [description] :
  /// The new description for the scheduled report.
  ///
  /// Parameter [name] :
  /// The new name for the scheduled report.
  ///
  /// Parameter [scheduleConfig] :
  /// The updated schedule configuration for the report.
  ///
  /// Parameter [scheduledReportExecutionRoleArn] :
  /// The ARN of the IAM role that the scheduled report uses to execute. Amazon
  /// Web Services Billing and Cost Management Dashboards will assume this IAM
  /// role while executing the scheduled report.
  ///
  /// Parameter [widgetDateRangeOverride] :
  /// The date range override to apply to widgets in the scheduled report.
  ///
  /// Parameter [widgetIds] :
  /// The list of widget identifiers to include in the scheduled report. If not
  /// specified, all widgets in the dashboard are included.
  Future<UpdateScheduledReportResponse> updateScheduledReport({
    required String arn,
    bool? clearWidgetDateRangeOverride,
    bool? clearWidgetIds,
    String? dashboardArn,
    String? description,
    String? name,
    ScheduleConfig? scheduleConfig,
    String? scheduledReportExecutionRoleArn,
    DateTimeRange? widgetDateRangeOverride,
    List<String>? widgetIds,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSBCMDashboardsService.UpdateScheduledReport'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
        if (clearWidgetDateRangeOverride != null)
          'clearWidgetDateRangeOverride': clearWidgetDateRangeOverride,
        if (clearWidgetIds != null) 'clearWidgetIds': clearWidgetIds,
        if (dashboardArn != null) 'dashboardArn': dashboardArn,
        if (description != null) 'description': description,
        if (name != null) 'name': name,
        if (scheduleConfig != null) 'scheduleConfig': scheduleConfig,
        if (scheduledReportExecutionRoleArn != null)
          'scheduledReportExecutionRoleArn': scheduledReportExecutionRoleArn,
        if (widgetDateRangeOverride != null)
          'widgetDateRangeOverride': widgetDateRangeOverride,
        if (widgetIds != null) 'widgetIds': widgetIds,
      },
    );

    return UpdateScheduledReportResponse.fromJson(jsonResponse.body);
  }
}

/// @nodoc
class CreateDashboardResponse {
  /// The ARN of the newly created dashboard.
  final String arn;

  CreateDashboardResponse({
    required this.arn,
  });

  factory CreateDashboardResponse.fromJson(Map<String, dynamic> json) {
    return CreateDashboardResponse(
      arn: (json['arn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      'arn': arn,
    };
  }
}

/// @nodoc
class CreateScheduledReportResponse {
  /// The ARN of the newly created scheduled report.
  final String arn;

  CreateScheduledReportResponse({
    required this.arn,
  });

  factory CreateScheduledReportResponse.fromJson(Map<String, dynamic> json) {
    return CreateScheduledReportResponse(
      arn: (json['arn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      'arn': arn,
    };
  }
}

/// @nodoc
class DeleteDashboardResponse {
  /// The ARN of the dashboard that was deleted.
  final String arn;

  DeleteDashboardResponse({
    required this.arn,
  });

  factory DeleteDashboardResponse.fromJson(Map<String, dynamic> json) {
    return DeleteDashboardResponse(
      arn: (json['arn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      'arn': arn,
    };
  }
}

/// @nodoc
class DeleteScheduledReportResponse {
  /// The ARN of the scheduled report that was deleted.
  final String arn;

  DeleteScheduledReportResponse({
    required this.arn,
  });

  factory DeleteScheduledReportResponse.fromJson(Map<String, dynamic> json) {
    return DeleteScheduledReportResponse(
      arn: (json['arn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      'arn': arn,
    };
  }
}

/// @nodoc
class ExecuteScheduledReportResponse {
  /// Indicates whether the execution was successfully triggered.
  final bool? executionTriggered;

  /// The health status of the scheduled report after the execution request.
  final HealthStatus? healthStatus;

  ExecuteScheduledReportResponse({
    this.executionTriggered,
    this.healthStatus,
  });

  factory ExecuteScheduledReportResponse.fromJson(Map<String, dynamic> json) {
    return ExecuteScheduledReportResponse(
      executionTriggered: json['executionTriggered'] as bool?,
      healthStatus: json['healthStatus'] != null
          ? HealthStatus.fromJson(json['healthStatus'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final executionTriggered = this.executionTriggered;
    final healthStatus = this.healthStatus;
    return {
      if (executionTriggered != null) 'executionTriggered': executionTriggered,
      if (healthStatus != null) 'healthStatus': healthStatus,
    };
  }
}

/// @nodoc
class GetDashboardResponse {
  /// The ARN of the retrieved dashboard.
  final String arn;

  /// The timestamp when the dashboard was created.
  final DateTime createdAt;

  /// The name of the retrieved dashboard.
  final String name;

  /// Indicates the dashboard type.
  final DashboardType type;

  /// The timestamp when the dashboard was last modified.
  final DateTime updatedAt;

  /// An array of widget configurations that make up the dashboard.
  final List<Widget> widgets;

  /// The description of the retrieved dashboard.
  final String? description;

  GetDashboardResponse({
    required this.arn,
    required this.createdAt,
    required this.name,
    required this.type,
    required this.updatedAt,
    required this.widgets,
    this.description,
  });

  factory GetDashboardResponse.fromJson(Map<String, dynamic> json) {
    return GetDashboardResponse(
      arn: (json['arn'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      name: (json['name'] as String?) ?? '',
      type: DashboardType.fromString((json['type'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      widgets: ((json['widgets'] as List?) ?? const [])
          .nonNulls
          .map((e) => Widget.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final name = this.name;
    final type = this.type;
    final updatedAt = this.updatedAt;
    final widgets = this.widgets;
    final description = this.description;
    return {
      'arn': arn,
      'createdAt': unixTimestampToJson(createdAt),
      'name': name,
      'type': type.value,
      'updatedAt': unixTimestampToJson(updatedAt),
      'widgets': widgets,
      if (description != null) 'description': description,
    };
  }
}

/// @nodoc
class GetResourcePolicyResponse {
  /// The JSON policy document that represents the dashboard's resource-based
  /// policy.
  final String policyDocument;

  /// The ARN of the dashboard for which the resource-based policy was retrieved.
  final String resourceArn;

  GetResourcePolicyResponse({
    required this.policyDocument,
    required this.resourceArn,
  });

  factory GetResourcePolicyResponse.fromJson(Map<String, dynamic> json) {
    return GetResourcePolicyResponse(
      policyDocument: (json['policyDocument'] as String?) ?? '',
      resourceArn: (json['resourceArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final policyDocument = this.policyDocument;
    final resourceArn = this.resourceArn;
    return {
      'policyDocument': policyDocument,
      'resourceArn': resourceArn,
    };
  }
}

/// @nodoc
class GetScheduledReportResponse {
  /// The scheduled report configuration and metadata.
  final ScheduledReport scheduledReport;

  GetScheduledReportResponse({
    required this.scheduledReport,
  });

  factory GetScheduledReportResponse.fromJson(Map<String, dynamic> json) {
    return GetScheduledReportResponse(
      scheduledReport: ScheduledReport.fromJson(
          (json['scheduledReport'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final scheduledReport = this.scheduledReport;
    return {
      'scheduledReport': scheduledReport,
    };
  }
}

/// @nodoc
class ListDashboardsResponse {
  /// An array of dashboard references, containing basic information about each
  /// dashboard.
  final List<DashboardReference> dashboards;

  /// The token to use to retrieve the next page of results. Not returned if there
  /// are no more results to retrieve.
  final String? nextToken;

  ListDashboardsResponse({
    required this.dashboards,
    this.nextToken,
  });

  factory ListDashboardsResponse.fromJson(Map<String, dynamic> json) {
    return ListDashboardsResponse(
      dashboards: ((json['dashboards'] as List?) ?? const [])
          .nonNulls
          .map((e) => DashboardReference.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dashboards = this.dashboards;
    final nextToken = this.nextToken;
    return {
      'dashboards': dashboards,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListScheduledReportsResponse {
  /// An array of scheduled report summaries, containing basic information about
  /// each scheduled report.
  final List<ScheduledReportSummary> scheduledReports;

  /// The token to use to retrieve the next page of results. Not returned if there
  /// are no more results to retrieve.
  final String? nextToken;

  ListScheduledReportsResponse({
    required this.scheduledReports,
    this.nextToken,
  });

  factory ListScheduledReportsResponse.fromJson(Map<String, dynamic> json) {
    return ListScheduledReportsResponse(
      scheduledReports: ((json['scheduledReports'] as List?) ?? const [])
          .nonNulls
          .map(
              (e) => ScheduledReportSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final scheduledReports = this.scheduledReports;
    final nextToken = this.nextToken;
    return {
      'scheduledReports': scheduledReports,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListTagsForResourceResponse {
  /// The list of tags associated with the specified dashboard resource.
  final List<ResourceTag>? resourceTags;

  ListTagsForResourceResponse({
    this.resourceTags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      resourceTags: (json['resourceTags'] as List?)
          ?.nonNulls
          .map((e) => ResourceTag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final resourceTags = this.resourceTags;
    return {
      if (resourceTags != null) 'resourceTags': resourceTags,
    };
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
class UpdateDashboardResponse {
  /// The ARN of the updated dashboard.
  final String arn;

  UpdateDashboardResponse({
    required this.arn,
  });

  factory UpdateDashboardResponse.fromJson(Map<String, dynamic> json) {
    return UpdateDashboardResponse(
      arn: (json['arn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      'arn': arn,
    };
  }
}

/// @nodoc
class UpdateScheduledReportResponse {
  /// The ARN of the updated scheduled report.
  final String arn;

  UpdateScheduledReportResponse({
    required this.arn,
  });

  factory UpdateScheduledReportResponse.fromJson(Map<String, dynamic> json) {
    return UpdateScheduledReportResponse(
      arn: (json['arn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      'arn': arn,
    };
  }
}

/// Defines the schedule for a scheduled report, including the cron expression,
/// time zone, active period, and the schedule state.
///
/// @nodoc
class ScheduleConfig {
  /// The schedule expression that specifies when to trigger the scheduled report
  /// run. This value must be a cron expression consisting of six fields separated
  /// by white spaces: <code>cron(minutes hours day_of_month month day_of_week
  /// year)</code>.
  final String? scheduleExpression;

  /// The time zone for the schedule expression, for example, <code>UTC</code>.
  final String? scheduleExpressionTimeZone;

  /// The time period during which the schedule is active.
  final SchedulePeriod? schedulePeriod;

  /// The state of the schedule. <code>ENABLED</code> means the scheduled report
  /// runs according to its schedule expression. <code>DISABLED</code> means the
  /// scheduled report is paused and will not run until re-enabled.
  final ScheduleState? state;

  ScheduleConfig({
    this.scheduleExpression,
    this.scheduleExpressionTimeZone,
    this.schedulePeriod,
    this.state,
  });

  factory ScheduleConfig.fromJson(Map<String, dynamic> json) {
    return ScheduleConfig(
      scheduleExpression: json['scheduleExpression'] as String?,
      scheduleExpressionTimeZone: json['scheduleExpressionTimeZone'] as String?,
      schedulePeriod: json['schedulePeriod'] != null
          ? SchedulePeriod.fromJson(
              json['schedulePeriod'] as Map<String, dynamic>)
          : null,
      state: (json['state'] as String?)?.let(ScheduleState.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final scheduleExpression = this.scheduleExpression;
    final scheduleExpressionTimeZone = this.scheduleExpressionTimeZone;
    final schedulePeriod = this.schedulePeriod;
    final state = this.state;
    return {
      if (scheduleExpression != null) 'scheduleExpression': scheduleExpression,
      if (scheduleExpressionTimeZone != null)
        'scheduleExpressionTimeZone': scheduleExpressionTimeZone,
      if (schedulePeriod != null) 'schedulePeriod': schedulePeriod,
      if (state != null) 'state': state.value,
    };
  }
}

/// Defines a time period with explicit start and end times for data queries.
///
/// @nodoc
class DateTimeRange {
  /// The end time of the date range for querying data.
  final DateTimeValue endTime;

  /// The start time of the date range for querying data.
  final DateTimeValue startTime;

  DateTimeRange({
    required this.endTime,
    required this.startTime,
  });

  factory DateTimeRange.fromJson(Map<String, dynamic> json) {
    return DateTimeRange(
      endTime: DateTimeValue.fromJson(
          (json['endTime'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      startTime: DateTimeValue.fromJson(
          (json['startTime'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final endTime = this.endTime;
    final startTime = this.startTime;
    return {
      'endTime': endTime,
      'startTime': startTime,
    };
  }
}

/// Represents a point in time that can be specified as either an absolute date
/// (for example, "2025-07-01") or a relative time period using ISO 8601
/// duration format (for example, "-P3M" for three months ago).
///
/// @nodoc
class DateTimeValue {
  /// The type of date/time value: <code>ABSOLUTE</code> for specific dates or
  /// <code>RELATIVE</code> for dynamic time periods.
  final DateTimeType type;

  /// The actual date/time value.
  final String value;

  DateTimeValue({
    required this.type,
    required this.value,
  });

  factory DateTimeValue.fromJson(Map<String, dynamic> json) {
    return DateTimeValue(
      type: DateTimeType.fromString((json['type'] as String?) ?? ''),
      value: (json['value'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final value = this.value;
    return {
      'type': type.value,
      'value': value,
    };
  }
}

/// @nodoc
class DateTimeType {
  static const absolute = DateTimeType._('ABSOLUTE');
  static const relative = DateTimeType._('RELATIVE');

  final String value;

  const DateTimeType._(this.value);

  static const values = [absolute, relative];

  static DateTimeType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => DateTimeType._(value));

  @override
  bool operator ==(other) => other is DateTimeType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Defines the active time period for execution of the scheduled report.
///
/// @nodoc
class SchedulePeriod {
  /// The end time of the schedule period. If not specified, defaults to 3 years
  /// from the time of the create or update request. The maximum allowed value is
  /// 3 years from the current time. Setting an end time beyond this limit returns
  /// a <code>ValidationException</code>.
  final DateTime? endTime;

  /// The start time of the schedule period. If not specified, defaults to the
  /// time of the create or update request. The start time cannot be more than 5
  /// minutes before the time of the request.
  final DateTime? startTime;

  SchedulePeriod({
    this.endTime,
    this.startTime,
  });

  factory SchedulePeriod.fromJson(Map<String, dynamic> json) {
    return SchedulePeriod(
      endTime: timeStampFromJson(json['endTime']),
      startTime: timeStampFromJson(json['startTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final endTime = this.endTime;
    final startTime = this.startTime;
    return {
      if (endTime != null) 'endTime': unixTimestampToJson(endTime),
      if (startTime != null) 'startTime': unixTimestampToJson(startTime),
    };
  }
}

/// @nodoc
class ScheduleState {
  static const enabled = ScheduleState._('ENABLED');
  static const disabled = ScheduleState._('DISABLED');

  final String value;

  const ScheduleState._(this.value);

  static const values = [enabled, disabled];

  static ScheduleState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ScheduleState._(value));

  @override
  bool operator ==(other) => other is ScheduleState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A configurable visualization component within a dashboard that displays
/// specific cost and usage metrics. Each widget can show data as charts or
/// tables and includes settings for data querying, filtering, and visual
/// presentation.
///
/// @nodoc
class Widget {
  /// An array of configurations that define the data queries and display settings
  /// for the widget.
  final List<WidgetConfig> configs;

  /// The title of the widget.
  final String title;

  /// A description of the widget's purpose or the data it displays.
  final String? description;

  /// The height of the widget in row spans. The dashboard layout consists of a
  /// grid system.
  final int? height;

  /// Specifies the starting column position of the widget in the dashboard's grid
  /// layout. Used to control widget placement.
  final int? horizontalOffset;

  /// The unique identifier for the widget.
  final String? id;

  /// The width of the widget in column spans. The dashboard layout consists of a
  /// grid system.
  final int? width;

  Widget({
    required this.configs,
    required this.title,
    this.description,
    this.height,
    this.horizontalOffset,
    this.id,
    this.width,
  });

  factory Widget.fromJson(Map<String, dynamic> json) {
    return Widget(
      configs: ((json['configs'] as List?) ?? const [])
          .nonNulls
          .map((e) => WidgetConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
      title: (json['title'] as String?) ?? '',
      description: json['description'] as String?,
      height: json['height'] as int?,
      horizontalOffset: json['horizontalOffset'] as int?,
      id: json['id'] as String?,
      width: json['width'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final configs = this.configs;
    final title = this.title;
    final description = this.description;
    final height = this.height;
    final horizontalOffset = this.horizontalOffset;
    final id = this.id;
    final width = this.width;
    return {
      'configs': configs,
      'title': title,
      if (description != null) 'description': description,
      if (height != null) 'height': height,
      if (horizontalOffset != null) 'horizontalOffset': horizontalOffset,
      if (id != null) 'id': id,
      if (width != null) 'width': width,
    };
  }
}

/// Defines the complete configuration for a widget, including data retrieval
/// settings and visualization preferences.
///
/// @nodoc
class WidgetConfig {
  /// The configuration that determines how the retrieved data should be
  /// visualized in the widget.
  final DisplayConfig displayConfig;

  /// The parameters that define what data the widget should retrieve and how it
  /// should be filtered or grouped.
  final QueryParameters queryParameters;

  WidgetConfig({
    required this.displayConfig,
    required this.queryParameters,
  });

  factory WidgetConfig.fromJson(Map<String, dynamic> json) {
    return WidgetConfig(
      displayConfig: DisplayConfig.fromJson(
          (json['displayConfig'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      queryParameters: QueryParameters.fromJson(
          (json['queryParameters'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final displayConfig = this.displayConfig;
    final queryParameters = this.queryParameters;
    return {
      'displayConfig': displayConfig,
      'queryParameters': queryParameters,
    };
  }
}

/// Defines the data retrieval parameters for a widget.
///
/// @nodoc
class QueryParameters {
  /// The parameters for querying cost and usage data, including metrics, time
  /// range, granularity, grouping dimensions, and filters.
  final CostAndUsageQuery? costAndUsage;

  /// The parameters for querying Reserved Instance coverage data, showing how
  /// much of your eligible instance usage is covered by Reserved Instances.
  final ReservationCoverageQuery? reservationCoverage;

  /// The parameters for querying Reserved Instance utilization data, showing how
  /// effectively your Reserved Instances are being used.
  final ReservationUtilizationQuery? reservationUtilization;

  /// The parameters for querying Savings Plans coverage data, showing how much of
  /// your eligible compute usage is covered by Savings Plans.
  final SavingsPlansCoverageQuery? savingsPlansCoverage;

  /// The parameters for querying Savings Plans utilization data, showing how
  /// effectively your Savings Plans are being used.
  final SavingsPlansUtilizationQuery? savingsPlansUtilization;

  QueryParameters({
    this.costAndUsage,
    this.reservationCoverage,
    this.reservationUtilization,
    this.savingsPlansCoverage,
    this.savingsPlansUtilization,
  });

  factory QueryParameters.fromJson(Map<String, dynamic> json) {
    return QueryParameters(
      costAndUsage: json['costAndUsage'] != null
          ? CostAndUsageQuery.fromJson(
              json['costAndUsage'] as Map<String, dynamic>)
          : null,
      reservationCoverage: json['reservationCoverage'] != null
          ? ReservationCoverageQuery.fromJson(
              json['reservationCoverage'] as Map<String, dynamic>)
          : null,
      reservationUtilization: json['reservationUtilization'] != null
          ? ReservationUtilizationQuery.fromJson(
              json['reservationUtilization'] as Map<String, dynamic>)
          : null,
      savingsPlansCoverage: json['savingsPlansCoverage'] != null
          ? SavingsPlansCoverageQuery.fromJson(
              json['savingsPlansCoverage'] as Map<String, dynamic>)
          : null,
      savingsPlansUtilization: json['savingsPlansUtilization'] != null
          ? SavingsPlansUtilizationQuery.fromJson(
              json['savingsPlansUtilization'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final costAndUsage = this.costAndUsage;
    final reservationCoverage = this.reservationCoverage;
    final reservationUtilization = this.reservationUtilization;
    final savingsPlansCoverage = this.savingsPlansCoverage;
    final savingsPlansUtilization = this.savingsPlansUtilization;
    return {
      if (costAndUsage != null) 'costAndUsage': costAndUsage,
      if (reservationCoverage != null)
        'reservationCoverage': reservationCoverage,
      if (reservationUtilization != null)
        'reservationUtilization': reservationUtilization,
      if (savingsPlansCoverage != null)
        'savingsPlansCoverage': savingsPlansCoverage,
      if (savingsPlansUtilization != null)
        'savingsPlansUtilization': savingsPlansUtilization,
    };
  }
}

/// Defines how the widget's data should be visualized, including chart type,
/// color schemes, axis configurations, and other display preferences.
///
/// @nodoc
class DisplayConfig {
  /// The configuration for graphical display of the widget data, including chart
  /// type and visual options.
  final Map<String, GraphDisplayConfig>? graph;

  /// The configuration for tabular display of the widget data.
  final TableDisplayConfigStruct? table;

  DisplayConfig({
    this.graph,
    this.table,
  });

  factory DisplayConfig.fromJson(Map<String, dynamic> json) {
    return DisplayConfig(
      graph: (json['graph'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, GraphDisplayConfig.fromJson(e as Map<String, dynamic>))),
      table: json['table'] != null
          ? TableDisplayConfigStruct.fromJson(
              json['table'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final graph = this.graph;
    final table = this.table;
    return {
      if (graph != null) 'graph': graph,
      if (table != null) 'table': table,
    };
  }
}

/// Configuration structure for customizing the tabular display of widget data.
///
/// @nodoc
class TableDisplayConfigStruct {
  TableDisplayConfigStruct();

  factory TableDisplayConfigStruct.fromJson(Map<String, dynamic> _) {
    return TableDisplayConfigStruct();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Defines the visual representation settings for widget data, including the
/// visualization type, styling options, and display preferences for different
/// metric types.
///
/// @nodoc
class GraphDisplayConfig {
  /// The type of visualization to use for the data.
  final VisualType visualType;

  GraphDisplayConfig({
    required this.visualType,
  });

  factory GraphDisplayConfig.fromJson(Map<String, dynamic> json) {
    return GraphDisplayConfig(
      visualType: VisualType.fromString((json['visualType'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final visualType = this.visualType;
    return {
      'visualType': visualType.value,
    };
  }
}

/// @nodoc
class VisualType {
  static const line = VisualType._('LINE');
  static const bar = VisualType._('BAR');
  static const stack = VisualType._('STACK');

  final String value;

  const VisualType._(this.value);

  static const values = [line, bar, stack];

  static VisualType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => VisualType._(value));

  @override
  bool operator ==(other) => other is VisualType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Defines the parameters for retrieving Amazon Web Services cost and usage
/// data. Includes specifications for metrics, time periods, granularity,
/// grouping dimensions, and filtering conditions.
///
/// @nodoc
class CostAndUsageQuery {
  /// The granularity of the retrieved data: <code>HOURLY</code>,
  /// <code>DAILY</code>, or <code>MONTHLY</code>.
  final Granularity granularity;

  /// The specific cost and usage metrics to retrieve.
  /// <note>
  /// Valid values for CostAndUsageQuery metrics are <code>AmortizedCost</code>,
  /// <code>BlendedCost</code>, <code>NetAmortizedCost</code>,
  /// <code>NetUnblendedCost</code>, <code>NormalizedUsageAmount</code>,
  /// <code>UnblendedCost</code>, and <code>UsageQuantity</code>.
  /// </note>
  final List<MetricName> metrics;

  /// The time period for which to retrieve data. Can be specified as absolute
  /// dates or relative time periods.
  final DateTimeRange timeRange;

  /// The filter expression to be applied to the cost and usage data.
  final Expression? filter;

  /// Specifies how to group the retrieved data, such as by <code>SERVICE</code>,
  /// <code>ACCOUNT</code>, or <code>TAG</code>.
  final List<GroupDefinition>? groupBy;

  CostAndUsageQuery({
    required this.granularity,
    required this.metrics,
    required this.timeRange,
    this.filter,
    this.groupBy,
  });

  factory CostAndUsageQuery.fromJson(Map<String, dynamic> json) {
    return CostAndUsageQuery(
      granularity:
          Granularity.fromString((json['granularity'] as String?) ?? ''),
      metrics: ((json['metrics'] as List?) ?? const [])
          .nonNulls
          .map((e) => MetricName.fromString((e as String)))
          .toList(),
      timeRange: DateTimeRange.fromJson(
          (json['timeRange'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      filter: json['filter'] != null
          ? Expression.fromJson(json['filter'] as Map<String, dynamic>)
          : null,
      groupBy: (json['groupBy'] as List?)
          ?.nonNulls
          .map((e) => GroupDefinition.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final granularity = this.granularity;
    final metrics = this.metrics;
    final timeRange = this.timeRange;
    final filter = this.filter;
    final groupBy = this.groupBy;
    return {
      'granularity': granularity.value,
      'metrics': metrics.map((e) => e.value).toList(),
      'timeRange': timeRange,
      if (filter != null) 'filter': filter,
      if (groupBy != null) 'groupBy': groupBy,
    };
  }
}

/// Defines the parameters for querying Savings Plans coverage data, including
/// metrics, grouping options, and time granularity.
///
/// @nodoc
class SavingsPlansCoverageQuery {
  final DateTimeRange timeRange;
  final Expression? filter;

  /// The time granularity of the retrieved data: <code>HOURLY</code>,
  /// <code>DAILY</code>, or <code>MONTHLY</code>.
  final Granularity? granularity;

  /// Specifies how to group the Savings Plans coverage data, such as by service
  /// or instance family.
  final List<GroupDefinition>? groupBy;

  /// The coverage metrics to include in the results.
  /// <note>
  /// Valid value for SavingsPlansCoverageQuery metrics is
  /// <code>SpendCoveredBySavingsPlans</code>.
  /// </note>
  final List<MetricName>? metrics;

  SavingsPlansCoverageQuery({
    required this.timeRange,
    this.filter,
    this.granularity,
    this.groupBy,
    this.metrics,
  });

  factory SavingsPlansCoverageQuery.fromJson(Map<String, dynamic> json) {
    return SavingsPlansCoverageQuery(
      timeRange: DateTimeRange.fromJson(
          (json['timeRange'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      filter: json['filter'] != null
          ? Expression.fromJson(json['filter'] as Map<String, dynamic>)
          : null,
      granularity:
          (json['granularity'] as String?)?.let(Granularity.fromString),
      groupBy: (json['groupBy'] as List?)
          ?.nonNulls
          .map((e) => GroupDefinition.fromJson(e as Map<String, dynamic>))
          .toList(),
      metrics: (json['metrics'] as List?)
          ?.nonNulls
          .map((e) => MetricName.fromString((e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final timeRange = this.timeRange;
    final filter = this.filter;
    final granularity = this.granularity;
    final groupBy = this.groupBy;
    final metrics = this.metrics;
    return {
      'timeRange': timeRange,
      if (filter != null) 'filter': filter,
      if (granularity != null) 'granularity': granularity.value,
      if (groupBy != null) 'groupBy': groupBy,
      if (metrics != null) 'metrics': metrics.map((e) => e.value).toList(),
    };
  }
}

/// Defines the parameters for querying Savings Plans utilization data,
/// including time granularity and sorting preferences.
///
/// @nodoc
class SavingsPlansUtilizationQuery {
  final DateTimeRange timeRange;
  final Expression? filter;

  /// The time granularity of the retrieved data: <code>HOURLY</code>,
  /// <code>DAILY</code>, or <code>MONTHLY</code>.
  final Granularity? granularity;

  SavingsPlansUtilizationQuery({
    required this.timeRange,
    this.filter,
    this.granularity,
  });

  factory SavingsPlansUtilizationQuery.fromJson(Map<String, dynamic> json) {
    return SavingsPlansUtilizationQuery(
      timeRange: DateTimeRange.fromJson(
          (json['timeRange'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      filter: json['filter'] != null
          ? Expression.fromJson(json['filter'] as Map<String, dynamic>)
          : null,
      granularity:
          (json['granularity'] as String?)?.let(Granularity.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final timeRange = this.timeRange;
    final filter = this.filter;
    final granularity = this.granularity;
    return {
      'timeRange': timeRange,
      if (filter != null) 'filter': filter,
      if (granularity != null) 'granularity': granularity.value,
    };
  }
}

/// Defines the parameters for querying Reserved Instance coverage data,
/// including grouping options, metrics, and sorting preferences.
///
/// @nodoc
class ReservationCoverageQuery {
  final DateTimeRange timeRange;
  final Expression? filter;

  /// The time granularity of the retrieved data: <code>HOURLY</code>,
  /// <code>DAILY</code>, or <code>MONTHLY</code>.
  final Granularity? granularity;

  /// Specifies how to group the Reserved Instance coverage data, such as by
  /// service, Region, or instance type.
  final List<GroupDefinition>? groupBy;

  /// The coverage metrics to include in the results.
  /// <note>
  /// Valid values for ReservationCoverageQuery metrics are <code>Hour</code>,
  /// <code>Unit</code>, and <code>Cost</code>.
  /// </note>
  final List<MetricName>? metrics;

  ReservationCoverageQuery({
    required this.timeRange,
    this.filter,
    this.granularity,
    this.groupBy,
    this.metrics,
  });

  factory ReservationCoverageQuery.fromJson(Map<String, dynamic> json) {
    return ReservationCoverageQuery(
      timeRange: DateTimeRange.fromJson(
          (json['timeRange'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      filter: json['filter'] != null
          ? Expression.fromJson(json['filter'] as Map<String, dynamic>)
          : null,
      granularity:
          (json['granularity'] as String?)?.let(Granularity.fromString),
      groupBy: (json['groupBy'] as List?)
          ?.nonNulls
          .map((e) => GroupDefinition.fromJson(e as Map<String, dynamic>))
          .toList(),
      metrics: (json['metrics'] as List?)
          ?.nonNulls
          .map((e) => MetricName.fromString((e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final timeRange = this.timeRange;
    final filter = this.filter;
    final granularity = this.granularity;
    final groupBy = this.groupBy;
    final metrics = this.metrics;
    return {
      'timeRange': timeRange,
      if (filter != null) 'filter': filter,
      if (granularity != null) 'granularity': granularity.value,
      if (groupBy != null) 'groupBy': groupBy,
      if (metrics != null) 'metrics': metrics.map((e) => e.value).toList(),
    };
  }
}

/// Defines the parameters for querying Reserved Instance utilization data,
/// including grouping options and time granularity.
///
/// @nodoc
class ReservationUtilizationQuery {
  final DateTimeRange timeRange;
  final Expression? filter;

  /// The time granularity of the retrieved data: <code>HOURLY</code>,
  /// <code>DAILY</code>, or <code>MONTHLY</code>.
  final Granularity? granularity;

  /// Specifies how to group the Reserved Instance utilization data, such as by
  /// service, Region, or instance type.
  final List<GroupDefinition>? groupBy;

  ReservationUtilizationQuery({
    required this.timeRange,
    this.filter,
    this.granularity,
    this.groupBy,
  });

  factory ReservationUtilizationQuery.fromJson(Map<String, dynamic> json) {
    return ReservationUtilizationQuery(
      timeRange: DateTimeRange.fromJson(
          (json['timeRange'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      filter: json['filter'] != null
          ? Expression.fromJson(json['filter'] as Map<String, dynamic>)
          : null,
      granularity:
          (json['granularity'] as String?)?.let(Granularity.fromString),
      groupBy: (json['groupBy'] as List?)
          ?.nonNulls
          .map((e) => GroupDefinition.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final timeRange = this.timeRange;
    final filter = this.filter;
    final granularity = this.granularity;
    final groupBy = this.groupBy;
    return {
      'timeRange': timeRange,
      if (filter != null) 'filter': filter,
      if (granularity != null) 'granularity': granularity.value,
      if (groupBy != null) 'groupBy': groupBy,
    };
  }
}

/// @nodoc
class Granularity {
  static const hourly = Granularity._('HOURLY');
  static const daily = Granularity._('DAILY');
  static const monthly = Granularity._('MONTHLY');

  final String value;

  const Granularity._(this.value);

  static const values = [hourly, daily, monthly];

  static Granularity fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => Granularity._(value));

  @override
  bool operator ==(other) => other is Granularity && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Defines complex filtering conditions using logical operators
/// (<code>AND</code>, <code>OR</code>, <code>NOT</code>) and various filter
/// types.
///
/// @nodoc
class Expression {
  /// A list of expressions to combine with AND logic.
  final List<Expression>? and;

  /// The cost category values to include in the filter expression.
  final CostCategoryValues? costCategories;

  /// The dimension values to include in the filter expression.
  final DimensionValues? dimensions;

  /// An expression to negate with NOT logic.
  final Expression? not;

  /// A list of expressions to combine with OR logic.
  final List<Expression>? or;

  /// The tag values to include in the filter expression.
  final TagValues? tags;

  Expression({
    this.and,
    this.costCategories,
    this.dimensions,
    this.not,
    this.or,
    this.tags,
  });

  factory Expression.fromJson(Map<String, dynamic> json) {
    return Expression(
      and: (json['and'] as List?)
          ?.nonNulls
          .map((e) => Expression.fromJson(e as Map<String, dynamic>))
          .toList(),
      costCategories: json['costCategories'] != null
          ? CostCategoryValues.fromJson(
              json['costCategories'] as Map<String, dynamic>)
          : null,
      dimensions: json['dimensions'] != null
          ? DimensionValues.fromJson(json['dimensions'] as Map<String, dynamic>)
          : null,
      not: json['not'] != null
          ? Expression.fromJson(json['not'] as Map<String, dynamic>)
          : null,
      or: (json['or'] as List?)
          ?.nonNulls
          .map((e) => Expression.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: json['tags'] != null
          ? TagValues.fromJson(json['tags'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final and = this.and;
    final costCategories = this.costCategories;
    final dimensions = this.dimensions;
    final not = this.not;
    final or = this.or;
    final tags = this.tags;
    return {
      if (and != null) 'and': and,
      if (costCategories != null) 'costCategories': costCategories,
      if (dimensions != null) 'dimensions': dimensions,
      if (not != null) 'not': not,
      if (or != null) 'or': or,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Specifies the values and match options for dimension-based filtering in cost
/// and usage queries.
///
/// @nodoc
class DimensionValues {
  /// The key of the dimension to filter on (for example, <code>SERVICE</code>,
  /// <code>USAGE_TYPE</code>, or <code>OPERATION</code>).
  final Dimension key;

  /// The values to match for the specified dimension key.
  final List<String> values;

  /// The match options for dimension values, such as <code>EQUALS</code>,
  /// <code>CONTAINS</code>, <code>STARTS_WITH</code>, or <code>ENDS_WITH</code>.
  final List<MatchOption>? matchOptions;

  DimensionValues({
    required this.key,
    required this.values,
    this.matchOptions,
  });

  factory DimensionValues.fromJson(Map<String, dynamic> json) {
    return DimensionValues(
      key: Dimension.fromString((json['key'] as String?) ?? ''),
      values: ((json['values'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      matchOptions: (json['matchOptions'] as List?)
          ?.nonNulls
          .map((e) => MatchOption.fromString((e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final values = this.values;
    final matchOptions = this.matchOptions;
    return {
      'key': key.value,
      'values': values,
      if (matchOptions != null)
        'matchOptions': matchOptions.map((e) => e.value).toList(),
    };
  }
}

/// Specifies tag-based filtering options for cost and usage queries.
///
/// @nodoc
class TagValues {
  /// The key of the tag to filter on.
  final String? key;

  /// The match options for tag values, such as <code>EQUALS</code>,
  /// <code>CONTAINS</code>, <code>STARTS_WITH</code>, or <code>ENDS_WITH</code>.
  final List<MatchOption>? matchOptions;

  /// The values to match for the specified tag key.
  final List<String>? values;

  TagValues({
    this.key,
    this.matchOptions,
    this.values,
  });

  factory TagValues.fromJson(Map<String, dynamic> json) {
    return TagValues(
      key: json['key'] as String?,
      matchOptions: (json['matchOptions'] as List?)
          ?.nonNulls
          .map((e) => MatchOption.fromString((e as String)))
          .toList(),
      values:
          (json['values'] as List?)?.nonNulls.map((e) => e as String).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final matchOptions = this.matchOptions;
    final values = this.values;
    return {
      if (key != null) 'key': key,
      if (matchOptions != null)
        'matchOptions': matchOptions.map((e) => e.value).toList(),
      if (values != null) 'values': values,
    };
  }
}

/// Specifies the values and match options for cost category-based filtering in
/// cost and usage queries.
///
/// @nodoc
class CostCategoryValues {
  /// The key of the cost category to filter on.
  final String? key;

  /// The match options for cost category values, such as <code>EQUALS</code>,
  /// <code>CONTAINS</code>, <code>STARTS_WITH</code>, or <code>ENDS_WITH</code>.
  final List<MatchOption>? matchOptions;

  /// The values to match for the specified cost category key.
  final List<String>? values;

  CostCategoryValues({
    this.key,
    this.matchOptions,
    this.values,
  });

  factory CostCategoryValues.fromJson(Map<String, dynamic> json) {
    return CostCategoryValues(
      key: json['key'] as String?,
      matchOptions: (json['matchOptions'] as List?)
          ?.nonNulls
          .map((e) => MatchOption.fromString((e as String)))
          .toList(),
      values:
          (json['values'] as List?)?.nonNulls.map((e) => e as String).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final matchOptions = this.matchOptions;
    final values = this.values;
    return {
      if (key != null) 'key': key,
      if (matchOptions != null)
        'matchOptions': matchOptions.map((e) => e.value).toList(),
      if (values != null) 'values': values,
    };
  }
}

/// @nodoc
class MatchOption {
  static const equals = MatchOption._('EQUALS');
  static const absent = MatchOption._('ABSENT');
  static const startsWith = MatchOption._('STARTS_WITH');
  static const endsWith = MatchOption._('ENDS_WITH');
  static const contains = MatchOption._('CONTAINS');
  static const greaterThanOrEqual = MatchOption._('GREATER_THAN_OR_EQUAL');
  static const caseSensitive = MatchOption._('CASE_SENSITIVE');
  static const caseInsensitive = MatchOption._('CASE_INSENSITIVE');

  final String value;

  const MatchOption._(this.value);

  static const values = [
    equals,
    absent,
    startsWith,
    endsWith,
    contains,
    greaterThanOrEqual,
    caseSensitive,
    caseInsensitive
  ];

  static MatchOption fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => MatchOption._(value));

  @override
  bool operator ==(other) => other is MatchOption && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class Dimension {
  static const az = Dimension._('AZ');
  static const instanceType = Dimension._('INSTANCE_TYPE');
  static const linkedAccount = Dimension._('LINKED_ACCOUNT');
  static const operation = Dimension._('OPERATION');
  static const purchaseType = Dimension._('PURCHASE_TYPE');
  static const region = Dimension._('REGION');
  static const service = Dimension._('SERVICE');
  static const usageType = Dimension._('USAGE_TYPE');
  static const usageTypeGroup = Dimension._('USAGE_TYPE_GROUP');
  static const recordType = Dimension._('RECORD_TYPE');
  static const resourceId = Dimension._('RESOURCE_ID');
  static const subscriptionId = Dimension._('SUBSCRIPTION_ID');
  static const tagKey = Dimension._('TAG_KEY');
  static const operatingSystem = Dimension._('OPERATING_SYSTEM');
  static const tenancy = Dimension._('TENANCY');
  static const billingEntity = Dimension._('BILLING_ENTITY');
  static const reservationId = Dimension._('RESERVATION_ID');
  static const costCategoryName = Dimension._('COST_CATEGORY_NAME');
  static const databaseEngine = Dimension._('DATABASE_ENGINE');
  static const legalEntityName = Dimension._('LEGAL_ENTITY_NAME');
  static const savingsPlansType = Dimension._('SAVINGS_PLANS_TYPE');
  static const instanceTypeFamily = Dimension._('INSTANCE_TYPE_FAMILY');
  static const cacheEngine = Dimension._('CACHE_ENGINE');
  static const deploymentOption = Dimension._('DEPLOYMENT_OPTION');
  static const scope = Dimension._('SCOPE');
  static const platform = Dimension._('PLATFORM');

  final String value;

  const Dimension._(this.value);

  static const values = [
    az,
    instanceType,
    linkedAccount,
    operation,
    purchaseType,
    region,
    service,
    usageType,
    usageTypeGroup,
    recordType,
    resourceId,
    subscriptionId,
    tagKey,
    operatingSystem,
    tenancy,
    billingEntity,
    reservationId,
    costCategoryName,
    databaseEngine,
    legalEntityName,
    savingsPlansType,
    instanceTypeFamily,
    cacheEngine,
    deploymentOption,
    scope,
    platform
  ];

  static Dimension fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => Dimension._(value));

  @override
  bool operator ==(other) => other is Dimension && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Specifies how to group cost and usage data.
///
/// @nodoc
class GroupDefinition {
  /// The key to use for grouping cost and usage data.
  final String key;

  /// The type of grouping to apply.
  final GroupDefinitionType? type;

  GroupDefinition({
    required this.key,
    this.type,
  });

  factory GroupDefinition.fromJson(Map<String, dynamic> json) {
    return GroupDefinition(
      key: (json['key'] as String?) ?? '',
      type: (json['type'] as String?)?.let(GroupDefinitionType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final type = this.type;
    return {
      'key': key,
      if (type != null) 'type': type.value,
    };
  }
}

/// @nodoc
class GroupDefinitionType {
  static const dimension = GroupDefinitionType._('DIMENSION');
  static const tag = GroupDefinitionType._('TAG');
  static const costCategory = GroupDefinitionType._('COST_CATEGORY');

  final String value;

  const GroupDefinitionType._(this.value);

  static const values = [dimension, tag, costCategory];

  static GroupDefinitionType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => GroupDefinitionType._(value));

  @override
  bool operator ==(other) =>
      other is GroupDefinitionType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class MetricName {
  static const amortizedCost = MetricName._('AmortizedCost');
  static const blendedCost = MetricName._('BlendedCost');
  static const netAmortizedCost = MetricName._('NetAmortizedCost');
  static const netUnblendedCost = MetricName._('NetUnblendedCost');
  static const normalizedUsageAmount = MetricName._('NormalizedUsageAmount');
  static const unblendedCost = MetricName._('UnblendedCost');
  static const usageQuantity = MetricName._('UsageQuantity');
  static const spendCoveredBySavingsPlans =
      MetricName._('SpendCoveredBySavingsPlans');
  static const hour = MetricName._('Hour');
  static const unit = MetricName._('Unit');
  static const cost = MetricName._('Cost');

  final String value;

  const MetricName._(this.value);

  static const values = [
    amortizedCost,
    blendedCost,
    netAmortizedCost,
    netUnblendedCost,
    normalizedUsageAmount,
    unblendedCost,
    usageQuantity,
    spendCoveredBySavingsPlans,
    hour,
    unit,
    cost
  ];

  static MetricName fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => MetricName._(value));

  @override
  bool operator ==(other) => other is MetricName && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A key-value pair that can be attached to a dashboard for organization and
/// management purposes.
///
/// @nodoc
class ResourceTag {
  /// The key of the tag to be attached to the dashboard resource.
  final String key;

  /// The value of the tag to be attached to the dashboard resource.
  final String value;

  ResourceTag({
    required this.key,
    required this.value,
  });

  factory ResourceTag.fromJson(Map<String, dynamic> json) {
    return ResourceTag(
      key: (json['key'] as String?) ?? '',
      value: (json['value'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'key': key,
      'value': value,
    };
  }
}

/// Contains summary information for a scheduled report.
///
/// @nodoc
class ScheduledReportSummary {
  /// The ARN of the scheduled report.
  final String arn;

  /// The ARN of the dashboard associated with the scheduled report.
  final String dashboardArn;

  /// The health status of the scheduled report as of its last refresh time.
  final HealthStatus healthStatus;

  /// The name of the scheduled report.
  final String name;

  /// The schedule expression that defines when the report runs.
  final String scheduleExpression;

  /// The state of the schedule: <code>ENABLED</code> or <code>DISABLED</code>.
  final ScheduleState state;

  /// The time zone for the schedule expression, for example, <code>UTC</code>.
  final String? scheduleExpressionTimeZone;

  /// The list of widget identifiers included in the scheduled report.
  final List<String>? widgetIds;

  ScheduledReportSummary({
    required this.arn,
    required this.dashboardArn,
    required this.healthStatus,
    required this.name,
    required this.scheduleExpression,
    required this.state,
    this.scheduleExpressionTimeZone,
    this.widgetIds,
  });

  factory ScheduledReportSummary.fromJson(Map<String, dynamic> json) {
    return ScheduledReportSummary(
      arn: (json['arn'] as String?) ?? '',
      dashboardArn: (json['dashboardArn'] as String?) ?? '',
      healthStatus: HealthStatus.fromJson(
          (json['healthStatus'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      name: (json['name'] as String?) ?? '',
      scheduleExpression: (json['scheduleExpression'] as String?) ?? '',
      state: ScheduleState.fromString((json['state'] as String?) ?? ''),
      scheduleExpressionTimeZone: json['scheduleExpressionTimeZone'] as String?,
      widgetIds: (json['widgetIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final dashboardArn = this.dashboardArn;
    final healthStatus = this.healthStatus;
    final name = this.name;
    final scheduleExpression = this.scheduleExpression;
    final state = this.state;
    final scheduleExpressionTimeZone = this.scheduleExpressionTimeZone;
    final widgetIds = this.widgetIds;
    return {
      'arn': arn,
      'dashboardArn': dashboardArn,
      'healthStatus': healthStatus,
      'name': name,
      'scheduleExpression': scheduleExpression,
      'state': state.value,
      if (scheduleExpressionTimeZone != null)
        'scheduleExpressionTimeZone': scheduleExpressionTimeZone,
      if (widgetIds != null) 'widgetIds': widgetIds,
    };
  }
}

/// Contains the health status information for a scheduled report, including the
/// status code and any reasons for an unhealthy state.
///
/// @nodoc
class HealthStatus {
  /// The health status code. <code>HEALTHY</code> indicates the scheduled report
  /// is configured properly and has all required permissions to execute.
  /// <code>UNHEALTHY</code> indicates the scheduled report is unable to deliver
  /// the notification to the default Amazon EventBridge EventBus in your account
  /// and your action is needed. The reason for the unhealthy state is captured in
  /// the health status reasons.
  final HealthStatusCode statusCode;

  /// The timestamp when the health status was last refreshed.
  final DateTime? lastRefreshedAt;

  /// The list of reasons for the current health status. Only present when the
  /// status is <code>UNHEALTHY</code>.
  final List<StatusReason>? statusReasons;

  HealthStatus({
    required this.statusCode,
    this.lastRefreshedAt,
    this.statusReasons,
  });

  factory HealthStatus.fromJson(Map<String, dynamic> json) {
    return HealthStatus(
      statusCode:
          HealthStatusCode.fromString((json['statusCode'] as String?) ?? ''),
      lastRefreshedAt: timeStampFromJson(json['lastRefreshedAt']),
      statusReasons: (json['statusReasons'] as List?)
          ?.nonNulls
          .map((e) => StatusReason.fromString((e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final statusCode = this.statusCode;
    final lastRefreshedAt = this.lastRefreshedAt;
    final statusReasons = this.statusReasons;
    return {
      'statusCode': statusCode.value,
      if (lastRefreshedAt != null)
        'lastRefreshedAt': unixTimestampToJson(lastRefreshedAt),
      if (statusReasons != null)
        'statusReasons': statusReasons.map((e) => e.value).toList(),
    };
  }
}

/// @nodoc
class HealthStatusCode {
  static const healthy = HealthStatusCode._('HEALTHY');
  static const unhealthy = HealthStatusCode._('UNHEALTHY');

  final String value;

  const HealthStatusCode._(this.value);

  static const values = [healthy, unhealthy];

  static HealthStatusCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => HealthStatusCode._(value));

  @override
  bool operator ==(other) => other is HealthStatusCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class StatusReason {
  static const dataSourceAccessDenied =
      StatusReason._('DATA_SOURCE_ACCESS_DENIED');
  static const executionRoleAssumeFailed =
      StatusReason._('EXECUTION_ROLE_ASSUME_FAILED');
  static const executionRoleInsufficientPermissions =
      StatusReason._('EXECUTION_ROLE_INSUFFICIENT_PERMISSIONS');
  static const dashboardNotFound = StatusReason._('DASHBOARD_NOT_FOUND');
  static const dashboardAccessDenied =
      StatusReason._('DASHBOARD_ACCESS_DENIED');
  static const internalFailure = StatusReason._('INTERNAL_FAILURE');
  static const widgetIdNotFound = StatusReason._('WIDGET_ID_NOT_FOUND');

  final String value;

  const StatusReason._(this.value);

  static const values = [
    dataSourceAccessDenied,
    executionRoleAssumeFailed,
    executionRoleInsufficientPermissions,
    dashboardNotFound,
    dashboardAccessDenied,
    internalFailure,
    widgetIdNotFound
  ];

  static StatusReason fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => StatusReason._(value));

  @override
  bool operator ==(other) => other is StatusReason && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains basic information about a dashboard, including its ARN, name, type,
/// and timestamps.
///
/// @nodoc
class DashboardReference {
  /// The ARN of the referenced dashboard.
  final String arn;

  /// The timestamp when the dashboard was created.
  final DateTime createdAt;

  /// The name of the referenced dashboard.
  final String name;

  /// The dashboard type.
  final DashboardType type;

  /// The timestamp when the dashboard was last modified.
  final DateTime updatedAt;

  /// The description of the referenced dashboard.
  final String? description;

  DashboardReference({
    required this.arn,
    required this.createdAt,
    required this.name,
    required this.type,
    required this.updatedAt,
    this.description,
  });

  factory DashboardReference.fromJson(Map<String, dynamic> json) {
    return DashboardReference(
      arn: (json['arn'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      name: (json['name'] as String?) ?? '',
      type: DashboardType.fromString((json['type'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final name = this.name;
    final type = this.type;
    final updatedAt = this.updatedAt;
    final description = this.description;
    return {
      'arn': arn,
      'createdAt': unixTimestampToJson(createdAt),
      'name': name,
      'type': type.value,
      'updatedAt': unixTimestampToJson(updatedAt),
      if (description != null) 'description': description,
    };
  }
}

/// @nodoc
class DashboardType {
  static const custom = DashboardType._('CUSTOM');

  final String value;

  const DashboardType._(this.value);

  static const values = [custom];

  static DashboardType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DashboardType._(value));

  @override
  bool operator ==(other) => other is DashboardType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains the full configuration and metadata of a scheduled report.
///
/// @nodoc
class ScheduledReport {
  /// The ARN of the dashboard associated with the scheduled report.
  final String dashboardArn;

  /// The name of the scheduled report.
  final String name;

  /// The schedule configuration that defines when and how often the report is
  /// generated.
  final ScheduleConfig scheduleConfig;

  /// The ARN of the IAM role that the scheduled report uses to execute. Amazon
  /// Web Services Billing and Cost Management Dashboards will assume this IAM
  /// role while executing the scheduled report.
  final String scheduledReportExecutionRoleArn;

  /// The ARN of the scheduled report.
  final String? arn;

  /// The timestamp when the scheduled report was created.
  final DateTime? createdAt;

  /// A description of the scheduled report's purpose or contents.
  final String? description;

  /// The health status of the scheduled report at last refresh time.
  final HealthStatus? healthStatus;

  /// The timestamp of the most recent execution of the scheduled report.
  final DateTime? lastExecutionAt;

  /// The timestamp when the scheduled report was last modified.
  final DateTime? updatedAt;

  /// The date range override applied to widgets in the scheduled report.
  final DateTimeRange? widgetDateRangeOverride;

  /// The list of widget identifiers included in the scheduled report.
  final List<String>? widgetIds;

  ScheduledReport({
    required this.dashboardArn,
    required this.name,
    required this.scheduleConfig,
    required this.scheduledReportExecutionRoleArn,
    this.arn,
    this.createdAt,
    this.description,
    this.healthStatus,
    this.lastExecutionAt,
    this.updatedAt,
    this.widgetDateRangeOverride,
    this.widgetIds,
  });

  factory ScheduledReport.fromJson(Map<String, dynamic> json) {
    return ScheduledReport(
      dashboardArn: (json['dashboardArn'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      scheduleConfig: ScheduleConfig.fromJson(
          (json['scheduleConfig'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      scheduledReportExecutionRoleArn:
          (json['scheduledReportExecutionRoleArn'] as String?) ?? '',
      arn: json['arn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      description: json['description'] as String?,
      healthStatus: json['healthStatus'] != null
          ? HealthStatus.fromJson(json['healthStatus'] as Map<String, dynamic>)
          : null,
      lastExecutionAt: timeStampFromJson(json['lastExecutionAt']),
      updatedAt: timeStampFromJson(json['updatedAt']),
      widgetDateRangeOverride: json['widgetDateRangeOverride'] != null
          ? DateTimeRange.fromJson(
              json['widgetDateRangeOverride'] as Map<String, dynamic>)
          : null,
      widgetIds: (json['widgetIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final dashboardArn = this.dashboardArn;
    final name = this.name;
    final scheduleConfig = this.scheduleConfig;
    final scheduledReportExecutionRoleArn =
        this.scheduledReportExecutionRoleArn;
    final arn = this.arn;
    final createdAt = this.createdAt;
    final description = this.description;
    final healthStatus = this.healthStatus;
    final lastExecutionAt = this.lastExecutionAt;
    final updatedAt = this.updatedAt;
    final widgetDateRangeOverride = this.widgetDateRangeOverride;
    final widgetIds = this.widgetIds;
    return {
      'dashboardArn': dashboardArn,
      'name': name,
      'scheduleConfig': scheduleConfig,
      'scheduledReportExecutionRoleArn': scheduledReportExecutionRoleArn,
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (description != null) 'description': description,
      if (healthStatus != null) 'healthStatus': healthStatus,
      if (lastExecutionAt != null)
        'lastExecutionAt': unixTimestampToJson(lastExecutionAt),
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
      if (widgetDateRangeOverride != null)
        'widgetDateRangeOverride': widgetDateRangeOverride,
      if (widgetIds != null) 'widgetIds': widgetIds,
    };
  }
}

/// Defines the configuration for creating a new scheduled report, including the
/// dashboard, schedule, execution role, and optional widget settings.
///
/// @nodoc
class ScheduledReportInput {
  /// The ARN of the dashboard to generate the scheduled report from.
  final String dashboardArn;

  /// The name of the scheduled report.
  final String name;

  /// The schedule configuration that defines when and how often the report is
  /// generated. If the schedule state is not specified, it defaults to
  /// <code>ENABLED</code>.
  final ScheduleConfig scheduleConfig;

  /// The ARN of the IAM role that the scheduled report uses to execute. Amazon
  /// Web Services Billing and Cost Management Dashboards will assume this IAM
  /// role while executing the scheduled report.
  final String scheduledReportExecutionRoleArn;

  /// A description of the scheduled report's purpose or contents.
  final String? description;

  /// The date range override to apply to widgets in the scheduled report.
  final DateTimeRange? widgetDateRangeOverride;

  /// The list of widget identifiers to include in the scheduled report. If not
  /// specified, all widgets in the dashboard are included.
  final List<String>? widgetIds;

  ScheduledReportInput({
    required this.dashboardArn,
    required this.name,
    required this.scheduleConfig,
    required this.scheduledReportExecutionRoleArn,
    this.description,
    this.widgetDateRangeOverride,
    this.widgetIds,
  });

  Map<String, dynamic> toJson() {
    final dashboardArn = this.dashboardArn;
    final name = this.name;
    final scheduleConfig = this.scheduleConfig;
    final scheduledReportExecutionRoleArn =
        this.scheduledReportExecutionRoleArn;
    final description = this.description;
    final widgetDateRangeOverride = this.widgetDateRangeOverride;
    final widgetIds = this.widgetIds;
    return {
      'dashboardArn': dashboardArn,
      'name': name,
      'scheduleConfig': scheduleConfig,
      'scheduledReportExecutionRoleArn': scheduledReportExecutionRoleArn,
      if (description != null) 'description': description,
      if (widgetDateRangeOverride != null)
        'widgetDateRangeOverride': widgetDateRangeOverride,
      if (widgetIds != null) 'widgetIds': widgetIds,
    };
  }
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
class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
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
