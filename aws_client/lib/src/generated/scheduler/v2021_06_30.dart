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

/// Amazon EventBridge Scheduler is a serverless scheduler that allows you to
/// create, run, and manage tasks from one central, managed service. EventBridge
/// Scheduler delivers your tasks reliably, with built-in mechanisms that adjust
/// your schedules based on the availability of downstream targets. The
/// following reference lists the available API actions, and data types for
/// EventBridge Scheduler.
class EventBridgeScheduler {
  final _s.RestJsonProtocol _protocol;
  EventBridgeScheduler({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'scheduler',
            signingName: 'scheduler',
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

  /// Creates the specified schedule.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [flexibleTimeWindow] :
  /// Allows you to configure a time window during which EventBridge Scheduler
  /// invokes the schedule.
  ///
  /// Parameter [name] :
  /// The name of the schedule that you are creating.
  ///
  /// Parameter [scheduleExpression] :
  /// The expression that defines when the schedule runs. The following formats
  /// are supported.
  ///
  /// <ul>
  /// <li>
  /// <code>at</code> expression - <code>at(yyyy-mm-ddThh:mm:ss)</code>
  /// </li>
  /// <li>
  /// <code>rate</code> expression - <code>rate(value unit)</code>
  /// </li>
  /// <li>
  /// <code>cron</code> expression - <code>cron(fields)</code>
  /// </li>
  /// </ul>
  /// You can use <code>at</code> expressions to create one-time schedules that
  /// invoke a target once, at the time and in the time zone, that you specify.
  /// You can use <code>rate</code> and <code>cron</code> expressions to create
  /// recurring schedules. Rate-based schedules are useful when you want to
  /// invoke a target at regular intervals, such as every 15 minutes or every
  /// five days. Cron-based schedules are useful when you want to invoke a
  /// target periodically at a specific time, such as at 8:00 am (UTC+0) every
  /// 1st day of the month.
  ///
  /// A <code>cron</code> expression consists of six fields separated by white
  /// spaces: <code>(minutes hours day_of_month month day_of_week year)</code>.
  ///
  /// A <code>rate</code> expression consists of a <i>value</i> as a positive
  /// integer, and a <i>unit</i> with the following options: <code>minute</code>
  /// | <code>minutes</code> | <code>hour</code> | <code>hours</code> |
  /// <code>day</code> | <code>days</code>
  ///
  /// For more information and examples, see <a
  /// href="https://docs.aws.amazon.com/scheduler/latest/UserGuide/schedule-types.html">Schedule
  /// types on EventBridge Scheduler</a> in the <i>EventBridge Scheduler User
  /// Guide</i>.
  ///
  /// Parameter [target] :
  /// The schedule's target.
  ///
  /// Parameter [actionAfterCompletion] :
  /// Specifies the action that EventBridge Scheduler applies to the schedule
  /// after the schedule completes invoking the target.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier you provide to ensure the idempotency of
  /// the request. If you do not specify a client token, EventBridge Scheduler
  /// uses a randomly generated token for the request to ensure idempotency.
  ///
  /// Parameter [description] :
  /// The description you specify for the schedule.
  ///
  /// Parameter [endDate] :
  /// The date, in UTC, before which the schedule can invoke its target.
  /// Depending on the schedule's recurrence expression, invocations might stop
  /// on, or before, the <code>EndDate</code> you specify. EventBridge Scheduler
  /// ignores <code>EndDate</code> for one-time schedules.
  ///
  /// Parameter [groupName] :
  /// The name of the schedule group to associate with this schedule. If you
  /// omit this, the default schedule group is used.
  ///
  /// Parameter [kmsKeyArn] :
  /// The Amazon Resource Name (ARN) for the customer managed KMS key that
  /// EventBridge Scheduler will use to encrypt and decrypt your data.
  ///
  /// Parameter [scheduleExpressionTimezone] :
  /// The timezone in which the scheduling expression is evaluated.
  ///
  /// Parameter [startDate] :
  /// The date, in UTC, after which the schedule can begin invoking its target.
  /// Depending on the schedule's recurrence expression, invocations might occur
  /// on, or after, the <code>StartDate</code> you specify. EventBridge
  /// Scheduler ignores <code>StartDate</code> for one-time schedules.
  ///
  /// Parameter [state] :
  /// Specifies whether the schedule is enabled or disabled.
  Future<CreateScheduleOutput> createSchedule({
    required FlexibleTimeWindow flexibleTimeWindow,
    required String name,
    required String scheduleExpression,
    required Target target,
    ActionAfterCompletion? actionAfterCompletion,
    String? clientToken,
    String? description,
    DateTime? endDate,
    String? groupName,
    String? kmsKeyArn,
    String? scheduleExpressionTimezone,
    DateTime? startDate,
    ScheduleState? state,
  }) async {
    final $payload = <String, dynamic>{
      'FlexibleTimeWindow': flexibleTimeWindow,
      'ScheduleExpression': scheduleExpression,
      'Target': target,
      if (actionAfterCompletion != null)
        'ActionAfterCompletion': actionAfterCompletion.toValue(),
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'Description': description,
      if (endDate != null) 'EndDate': unixTimestampToJson(endDate),
      if (groupName != null) 'GroupName': groupName,
      if (kmsKeyArn != null) 'KmsKeyArn': kmsKeyArn,
      if (scheduleExpressionTimezone != null)
        'ScheduleExpressionTimezone': scheduleExpressionTimezone,
      if (startDate != null) 'StartDate': unixTimestampToJson(startDate),
      if (state != null) 'State': state.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/schedules/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateScheduleOutput.fromJson(response);
  }

  /// Creates the specified schedule group.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [name] :
  /// The name of the schedule group that you are creating.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier you provide to ensure the idempotency of
  /// the request. If you do not specify a client token, EventBridge Scheduler
  /// uses a randomly generated token for the request to ensure idempotency.
  ///
  /// Parameter [tags] :
  /// The list of tags to associate with the schedule group.
  Future<CreateScheduleGroupOutput> createScheduleGroup({
    required String name,
    String? clientToken,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/schedule-groups/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateScheduleGroupOutput.fromJson(response);
  }

  /// Deletes the specified schedule.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [name] :
  /// The name of the schedule to delete.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier you provide to ensure the idempotency of
  /// the request. If you do not specify a client token, EventBridge Scheduler
  /// uses a randomly generated token for the request to ensure idempotency.
  ///
  /// Parameter [groupName] :
  /// The name of the schedule group associated with this schedule. If you omit
  /// this, the default schedule group is used.
  Future<void> deleteSchedule({
    required String name,
    String? clientToken,
    String? groupName,
  }) async {
    final $query = <String, List<String>>{
      if (clientToken != null) 'clientToken': [clientToken],
      if (groupName != null) 'groupName': [groupName],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/schedules/${Uri.encodeComponent(name)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the specified schedule group. Deleting a schedule group results in
  /// EventBridge Scheduler deleting all schedules associated with the group.
  /// When you delete a group, it remains in a <code>DELETING</code> state until
  /// all of its associated schedules are deleted. Schedules associated with the
  /// group that are set to run while the schedule group is in the process of
  /// being deleted might continue to invoke their targets until the schedule
  /// group and its associated schedules are deleted.
  /// <note>
  /// This operation is eventually consistent.
  /// </note>
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [name] :
  /// The name of the schedule group to delete.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier you provide to ensure the idempotency of
  /// the request. If you do not specify a client token, EventBridge Scheduler
  /// uses a randomly generated token for the request to ensure idempotency.
  Future<void> deleteScheduleGroup({
    required String name,
    String? clientToken,
  }) async {
    final $query = <String, List<String>>{
      if (clientToken != null) 'clientToken': [clientToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/schedule-groups/${Uri.encodeComponent(name)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Retrieves the specified schedule.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [name] :
  /// The name of the schedule to retrieve.
  ///
  /// Parameter [groupName] :
  /// The name of the schedule group associated with this schedule. If you omit
  /// this, EventBridge Scheduler assumes that the schedule is associated with
  /// the default group.
  Future<GetScheduleOutput> getSchedule({
    required String name,
    String? groupName,
  }) async {
    final $query = <String, List<String>>{
      if (groupName != null) 'groupName': [groupName],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/schedules/${Uri.encodeComponent(name)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetScheduleOutput.fromJson(response);
  }

  /// Retrieves the specified schedule group.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [name] :
  /// The name of the schedule group to retrieve.
  Future<GetScheduleGroupOutput> getScheduleGroup({
    required String name,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/schedule-groups/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetScheduleGroupOutput.fromJson(response);
  }

  /// Returns a paginated list of your schedule groups.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [maxResults] :
  /// If specified, limits the number of results returned by this operation. The
  /// operation also returns a <code>NextToken</code> which you can use in a
  /// subsequent operation to retrieve the next set of results.
  ///
  /// Parameter [namePrefix] :
  /// The name prefix that you can use to return a filtered list of your
  /// schedule groups.
  ///
  /// Parameter [nextToken] :
  /// The token returned by a previous call to retrieve the next set of results.
  Future<ListScheduleGroupsOutput> listScheduleGroups({
    int? maxResults,
    String? namePrefix,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (namePrefix != null) 'NamePrefix': [namePrefix],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/schedule-groups',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListScheduleGroupsOutput.fromJson(response);
  }

  /// Returns a paginated list of your EventBridge Scheduler schedules.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [groupName] :
  /// If specified, only lists the schedules whose associated schedule group
  /// matches the given filter.
  ///
  /// Parameter [maxResults] :
  /// If specified, limits the number of results returned by this operation. The
  /// operation also returns a <code>NextToken</code> which you can use in a
  /// subsequent operation to retrieve the next set of results.
  ///
  /// Parameter [namePrefix] :
  /// Schedule name prefix to return the filtered list of resources.
  ///
  /// Parameter [nextToken] :
  /// The token returned by a previous call to retrieve the next set of results.
  ///
  /// Parameter [state] :
  /// If specified, only lists the schedules whose current state matches the
  /// given filter.
  Future<ListSchedulesOutput> listSchedules({
    String? groupName,
    int? maxResults,
    String? namePrefix,
    String? nextToken,
    ScheduleState? state,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (groupName != null) 'ScheduleGroup': [groupName],
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (namePrefix != null) 'NamePrefix': [namePrefix],
      if (nextToken != null) 'NextToken': [nextToken],
      if (state != null) 'State': [state.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/schedules',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSchedulesOutput.fromJson(response);
  }

  /// Lists the tags associated with the Scheduler resource.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the EventBridge Scheduler resource for which you want to view
  /// tags.
  Future<ListTagsForResourceOutput> listTagsForResource({
    required String resourceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceOutput.fromJson(response);
  }

  /// Assigns one or more tags (key-value pairs) to the specified EventBridge
  /// Scheduler resource. You can only assign tags to schedule groups.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the schedule group that you are adding
  /// tags to.
  ///
  /// Parameter [tags] :
  /// The list of tags to associate with the schedule group.
  Future<void> tagResource({
    required String resourceArn,
    required List<Tag> tags,
  }) async {
    final $payload = <String, dynamic>{
      'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes one or more tags from the specified EventBridge Scheduler schedule
  /// group.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the schedule group from which you are
  /// removing tags.
  ///
  /// Parameter [tagKeys] :
  /// The list of tag keys to remove from the resource.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final $query = <String, List<String>>{
      'TagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the specified schedule. When you call <code>UpdateSchedule</code>,
  /// EventBridge Scheduler uses all values, including empty values, specified
  /// in the request and overrides the existing schedule. This is by design.
  /// This means that if you do not set an optional field in your request, that
  /// field will be set to its system-default value after the update.
  ///
  /// Before calling this operation, we recommend that you call the
  /// <code>GetSchedule</code> API operation and make a note of all optional
  /// parameters for your <code>UpdateSchedule</code> call.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [flexibleTimeWindow] :
  /// Allows you to configure a time window during which EventBridge Scheduler
  /// invokes the schedule.
  ///
  /// Parameter [name] :
  /// The name of the schedule that you are updating.
  ///
  /// Parameter [scheduleExpression] :
  /// The expression that defines when the schedule runs. The following formats
  /// are supported.
  ///
  /// <ul>
  /// <li>
  /// <code>at</code> expression - <code>at(yyyy-mm-ddThh:mm:ss)</code>
  /// </li>
  /// <li>
  /// <code>rate</code> expression - <code>rate(value unit)</code>
  /// </li>
  /// <li>
  /// <code>cron</code> expression - <code>cron(fields)</code>
  /// </li>
  /// </ul>
  /// You can use <code>at</code> expressions to create one-time schedules that
  /// invoke a target once, at the time and in the time zone, that you specify.
  /// You can use <code>rate</code> and <code>cron</code> expressions to create
  /// recurring schedules. Rate-based schedules are useful when you want to
  /// invoke a target at regular intervals, such as every 15 minutes or every
  /// five days. Cron-based schedules are useful when you want to invoke a
  /// target periodically at a specific time, such as at 8:00 am (UTC+0) every
  /// 1st day of the month.
  ///
  /// A <code>cron</code> expression consists of six fields separated by white
  /// spaces: <code>(minutes hours day_of_month month day_of_week year)</code>.
  ///
  /// A <code>rate</code> expression consists of a <i>value</i> as a positive
  /// integer, and a <i>unit</i> with the following options: <code>minute</code>
  /// | <code>minutes</code> | <code>hour</code> | <code>hours</code> |
  /// <code>day</code> | <code>days</code>
  ///
  /// For more information and examples, see <a
  /// href="https://docs.aws.amazon.com/scheduler/latest/UserGuide/schedule-types.html">Schedule
  /// types on EventBridge Scheduler</a> in the <i>EventBridge Scheduler User
  /// Guide</i>.
  ///
  /// Parameter [target] :
  /// The schedule target. You can use this operation to change the target that
  /// your schedule invokes.
  ///
  /// Parameter [actionAfterCompletion] :
  /// Specifies the action that EventBridge Scheduler applies to the schedule
  /// after the schedule completes invoking the target.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier you provide to ensure the idempotency of
  /// the request. If you do not specify a client token, EventBridge Scheduler
  /// uses a randomly generated token for the request to ensure idempotency.
  ///
  /// Parameter [description] :
  /// The description you specify for the schedule.
  ///
  /// Parameter [endDate] :
  /// The date, in UTC, before which the schedule can invoke its target.
  /// Depending on the schedule's recurrence expression, invocations might stop
  /// on, or before, the <code>EndDate</code> you specify. EventBridge Scheduler
  /// ignores <code>EndDate</code> for one-time schedules.
  ///
  /// Parameter [groupName] :
  /// The name of the schedule group with which the schedule is associated. You
  /// must provide this value in order for EventBridge Scheduler to find the
  /// schedule you want to update. If you omit this value, EventBridge Scheduler
  /// assumes the group is associated to the default group.
  ///
  /// Parameter [kmsKeyArn] :
  /// The ARN for the customer managed KMS key that that you want EventBridge
  /// Scheduler to use to encrypt and decrypt your data.
  ///
  /// Parameter [scheduleExpressionTimezone] :
  /// The timezone in which the scheduling expression is evaluated.
  ///
  /// Parameter [startDate] :
  /// The date, in UTC, after which the schedule can begin invoking its target.
  /// Depending on the schedule's recurrence expression, invocations might occur
  /// on, or after, the <code>StartDate</code> you specify. EventBridge
  /// Scheduler ignores <code>StartDate</code> for one-time schedules.
  ///
  /// Parameter [state] :
  /// Specifies whether the schedule is enabled or disabled.
  Future<UpdateScheduleOutput> updateSchedule({
    required FlexibleTimeWindow flexibleTimeWindow,
    required String name,
    required String scheduleExpression,
    required Target target,
    ActionAfterCompletion? actionAfterCompletion,
    String? clientToken,
    String? description,
    DateTime? endDate,
    String? groupName,
    String? kmsKeyArn,
    String? scheduleExpressionTimezone,
    DateTime? startDate,
    ScheduleState? state,
  }) async {
    final $payload = <String, dynamic>{
      'FlexibleTimeWindow': flexibleTimeWindow,
      'ScheduleExpression': scheduleExpression,
      'Target': target,
      if (actionAfterCompletion != null)
        'ActionAfterCompletion': actionAfterCompletion.toValue(),
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'Description': description,
      if (endDate != null) 'EndDate': unixTimestampToJson(endDate),
      if (groupName != null) 'GroupName': groupName,
      if (kmsKeyArn != null) 'KmsKeyArn': kmsKeyArn,
      if (scheduleExpressionTimezone != null)
        'ScheduleExpressionTimezone': scheduleExpressionTimezone,
      if (startDate != null) 'StartDate': unixTimestampToJson(startDate),
      if (state != null) 'State': state.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/schedules/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateScheduleOutput.fromJson(response);
  }
}

enum ActionAfterCompletion {
  none,
  delete,
}

extension ActionAfterCompletionValueExtension on ActionAfterCompletion {
  String toValue() {
    switch (this) {
      case ActionAfterCompletion.none:
        return 'NONE';
      case ActionAfterCompletion.delete:
        return 'DELETE';
    }
  }
}

extension ActionAfterCompletionFromString on String {
  ActionAfterCompletion toActionAfterCompletion() {
    switch (this) {
      case 'NONE':
        return ActionAfterCompletion.none;
      case 'DELETE':
        return ActionAfterCompletion.delete;
    }
    throw Exception('$this is not known in enum ActionAfterCompletion');
  }
}

enum AssignPublicIp {
  enabled,
  disabled,
}

extension AssignPublicIpValueExtension on AssignPublicIp {
  String toValue() {
    switch (this) {
      case AssignPublicIp.enabled:
        return 'ENABLED';
      case AssignPublicIp.disabled:
        return 'DISABLED';
    }
  }
}

extension AssignPublicIpFromString on String {
  AssignPublicIp toAssignPublicIp() {
    switch (this) {
      case 'ENABLED':
        return AssignPublicIp.enabled;
      case 'DISABLED':
        return AssignPublicIp.disabled;
    }
    throw Exception('$this is not known in enum AssignPublicIp');
  }
}

/// This structure specifies the VPC subnets and security groups for the task,
/// and whether a public IP address is to be used. This structure is relevant
/// only for ECS tasks that use the awsvpc network mode.
class AwsVpcConfiguration {
  /// Specifies the subnets associated with the task. These subnets must all be in
  /// the same VPC. You can specify as many as 16 subnets.
  final List<String> subnets;

  /// Specifies whether the task's elastic network interface receives a public IP
  /// address. You can specify <code>ENABLED</code> only when
  /// <code>LaunchType</code> in <code>EcsParameters</code> is set to
  /// <code>FARGATE</code>.
  final AssignPublicIp? assignPublicIp;

  /// Specifies the security groups associated with the task. These security
  /// groups must all be in the same VPC. You can specify as many as five security
  /// groups. If you do not specify a security group, the default security group
  /// for the VPC is used.
  final List<String>? securityGroups;

  AwsVpcConfiguration({
    required this.subnets,
    this.assignPublicIp,
    this.securityGroups,
  });

  factory AwsVpcConfiguration.fromJson(Map<String, dynamic> json) {
    return AwsVpcConfiguration(
      subnets: (json['Subnets'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      assignPublicIp: (json['AssignPublicIp'] as String?)?.toAssignPublicIp(),
      securityGroups: (json['SecurityGroups'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final subnets = this.subnets;
    final assignPublicIp = this.assignPublicIp;
    final securityGroups = this.securityGroups;
    return {
      'Subnets': subnets,
      if (assignPublicIp != null) 'AssignPublicIp': assignPublicIp.toValue(),
      if (securityGroups != null) 'SecurityGroups': securityGroups,
    };
  }
}

/// The details of a capacity provider strategy.
class CapacityProviderStrategyItem {
  /// The short name of the capacity provider.
  final String capacityProvider;

  /// The base value designates how many tasks, at a minimum, to run on the
  /// specified capacity provider. Only one capacity provider in a capacity
  /// provider strategy can have a base defined. If no value is specified, the
  /// default value of <code>0</code> is used.
  final int? base;

  /// The weight value designates the relative percentage of the total number of
  /// tasks launched that should use the specified capacity provider. The weight
  /// value is taken into consideration after the base value, if defined, is
  /// satisfied.
  final int? weight;

  CapacityProviderStrategyItem({
    required this.capacityProvider,
    this.base,
    this.weight,
  });

  factory CapacityProviderStrategyItem.fromJson(Map<String, dynamic> json) {
    return CapacityProviderStrategyItem(
      capacityProvider: json['capacityProvider'] as String,
      base: json['base'] as int?,
      weight: json['weight'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final capacityProvider = this.capacityProvider;
    final base = this.base;
    final weight = this.weight;
    return {
      'capacityProvider': capacityProvider,
      if (base != null) 'base': base,
      if (weight != null) 'weight': weight,
    };
  }
}

class CreateScheduleGroupOutput {
  /// The Amazon Resource Name (ARN) of the schedule group.
  final String scheduleGroupArn;

  CreateScheduleGroupOutput({
    required this.scheduleGroupArn,
  });

  factory CreateScheduleGroupOutput.fromJson(Map<String, dynamic> json) {
    return CreateScheduleGroupOutput(
      scheduleGroupArn: json['ScheduleGroupArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final scheduleGroupArn = this.scheduleGroupArn;
    return {
      'ScheduleGroupArn': scheduleGroupArn,
    };
  }
}

class CreateScheduleOutput {
  /// The Amazon Resource Name (ARN) of the schedule.
  final String scheduleArn;

  CreateScheduleOutput({
    required this.scheduleArn,
  });

  factory CreateScheduleOutput.fromJson(Map<String, dynamic> json) {
    return CreateScheduleOutput(
      scheduleArn: json['ScheduleArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final scheduleArn = this.scheduleArn;
    return {
      'ScheduleArn': scheduleArn,
    };
  }
}

/// An object that contains information about an Amazon SQS queue that
/// EventBridge Scheduler uses as a dead-letter queue for your schedule. If
/// specified, EventBridge Scheduler delivers failed events that could not be
/// successfully delivered to a target to the queue.
class DeadLetterConfig {
  /// The Amazon Resource Name (ARN) of the SQS queue specified as the destination
  /// for the dead-letter queue.
  final String? arn;

  DeadLetterConfig({
    this.arn,
  });

  factory DeadLetterConfig.fromJson(Map<String, dynamic> json) {
    return DeadLetterConfig(
      arn: json['Arn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      if (arn != null) 'Arn': arn,
    };
  }
}

class DeleteScheduleGroupOutput {
  DeleteScheduleGroupOutput();

  factory DeleteScheduleGroupOutput.fromJson(Map<String, dynamic> _) {
    return DeleteScheduleGroupOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteScheduleOutput {
  DeleteScheduleOutput();

  factory DeleteScheduleOutput.fromJson(Map<String, dynamic> _) {
    return DeleteScheduleOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The templated target type for the Amazon ECS <a
/// href="https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_RunTask.html">
/// <code>RunTask</code> </a> API operation.
class EcsParameters {
  /// The Amazon Resource Name (ARN) of the task definition to use if the event
  /// target is an Amazon ECS task.
  final String taskDefinitionArn;

  /// The capacity provider strategy to use for the task.
  final List<CapacityProviderStrategyItem>? capacityProviderStrategy;

  /// Specifies whether to enable Amazon ECS managed tags for the task. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-using-tags.html">Tagging
  /// Your Amazon ECS Resources</a> in the <i>Amazon ECS Developer Guide</i>.
  final bool? enableECSManagedTags;

  /// Whether or not to enable the execute command functionality for the
  /// containers in this task. If true, this enables execute command functionality
  /// on all containers in the task.
  final bool? enableExecuteCommand;

  /// Specifies an ECS task group for the task. The maximum length is 255
  /// characters.
  final String? group;

  /// Specifies the launch type on which your task is running. The launch type
  /// that you specify here must match one of the launch type (compatibilities) of
  /// the target task. The <code>FARGATE</code> value is supported only in the
  /// Regions where Fargate with Amazon ECS is supported. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/AWS_Fargate.html">AWS
  /// Fargate on Amazon ECS</a> in the <i>Amazon ECS Developer Guide</i>.
  final LaunchType? launchType;

  /// This structure specifies the network configuration for an ECS task.
  final NetworkConfiguration? networkConfiguration;

  /// An array of placement constraint objects to use for the task. You can
  /// specify up to 10 constraints per task (including constraints in the task
  /// definition and those specified at runtime).
  final List<PlacementConstraint>? placementConstraints;

  /// The task placement strategy for a task or service.
  final List<PlacementStrategy>? placementStrategy;

  /// Specifies the platform version for the task. Specify only the numeric
  /// portion of the platform version, such as <code>1.1.0</code>.
  final String? platformVersion;

  /// Specifies whether to propagate the tags from the task definition to the
  /// task. If no value is specified, the tags are not propagated. Tags can only
  /// be propagated to the task during task creation. To add tags to a task after
  /// task creation, use Amazon ECS's <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_TagResource.html">
  /// <code>TagResource</code> </a> API action.
  final PropagateTags? propagateTags;

  /// The reference ID to use for the task.
  final String? referenceId;

  /// The metadata that you apply to the task to help you categorize and organize
  /// them. Each tag consists of a key and an optional value, both of which you
  /// define. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_RunTask.html">
  /// <code>RunTask</code> </a> in the <i>Amazon ECS API Reference</i>.
  final List<Map<String, String>>? tags;

  /// The number of tasks to create based on <code>TaskDefinition</code>. The
  /// default is <code>1</code>.
  final int? taskCount;

  EcsParameters({
    required this.taskDefinitionArn,
    this.capacityProviderStrategy,
    this.enableECSManagedTags,
    this.enableExecuteCommand,
    this.group,
    this.launchType,
    this.networkConfiguration,
    this.placementConstraints,
    this.placementStrategy,
    this.platformVersion,
    this.propagateTags,
    this.referenceId,
    this.tags,
    this.taskCount,
  });

  factory EcsParameters.fromJson(Map<String, dynamic> json) {
    return EcsParameters(
      taskDefinitionArn: json['TaskDefinitionArn'] as String,
      capacityProviderStrategy: (json['CapacityProviderStrategy'] as List?)
          ?.whereNotNull()
          .map((e) =>
              CapacityProviderStrategyItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      enableECSManagedTags: json['EnableECSManagedTags'] as bool?,
      enableExecuteCommand: json['EnableExecuteCommand'] as bool?,
      group: json['Group'] as String?,
      launchType: (json['LaunchType'] as String?)?.toLaunchType(),
      networkConfiguration: json['NetworkConfiguration'] != null
          ? NetworkConfiguration.fromJson(
              json['NetworkConfiguration'] as Map<String, dynamic>)
          : null,
      placementConstraints: (json['PlacementConstraints'] as List?)
          ?.whereNotNull()
          .map((e) => PlacementConstraint.fromJson(e as Map<String, dynamic>))
          .toList(),
      placementStrategy: (json['PlacementStrategy'] as List?)
          ?.whereNotNull()
          .map((e) => PlacementStrategy.fromJson(e as Map<String, dynamic>))
          .toList(),
      platformVersion: json['PlatformVersion'] as String?,
      propagateTags: (json['PropagateTags'] as String?)?.toPropagateTags(),
      referenceId: json['ReferenceId'] as String?,
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => (e as Map<String, dynamic>)
              .map((k, e) => MapEntry(k, e as String)))
          .toList(),
      taskCount: json['TaskCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final taskDefinitionArn = this.taskDefinitionArn;
    final capacityProviderStrategy = this.capacityProviderStrategy;
    final enableECSManagedTags = this.enableECSManagedTags;
    final enableExecuteCommand = this.enableExecuteCommand;
    final group = this.group;
    final launchType = this.launchType;
    final networkConfiguration = this.networkConfiguration;
    final placementConstraints = this.placementConstraints;
    final placementStrategy = this.placementStrategy;
    final platformVersion = this.platformVersion;
    final propagateTags = this.propagateTags;
    final referenceId = this.referenceId;
    final tags = this.tags;
    final taskCount = this.taskCount;
    return {
      'TaskDefinitionArn': taskDefinitionArn,
      if (capacityProviderStrategy != null)
        'CapacityProviderStrategy': capacityProviderStrategy,
      if (enableECSManagedTags != null)
        'EnableECSManagedTags': enableECSManagedTags,
      if (enableExecuteCommand != null)
        'EnableExecuteCommand': enableExecuteCommand,
      if (group != null) 'Group': group,
      if (launchType != null) 'LaunchType': launchType.toValue(),
      if (networkConfiguration != null)
        'NetworkConfiguration': networkConfiguration,
      if (placementConstraints != null)
        'PlacementConstraints': placementConstraints,
      if (placementStrategy != null) 'PlacementStrategy': placementStrategy,
      if (platformVersion != null) 'PlatformVersion': platformVersion,
      if (propagateTags != null) 'PropagateTags': propagateTags.toValue(),
      if (referenceId != null) 'ReferenceId': referenceId,
      if (tags != null) 'Tags': tags,
      if (taskCount != null) 'TaskCount': taskCount,
    };
  }
}

/// The templated target type for the EventBridge <a
/// href="https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_PutEvents.html">
/// <code>PutEvents</code> </a> API operation.
class EventBridgeParameters {
  /// A free-form string, with a maximum of 128 characters, used to decide what
  /// fields to expect in the event detail.
  final String detailType;

  /// The source of the event.
  final String source;

  EventBridgeParameters({
    required this.detailType,
    required this.source,
  });

  factory EventBridgeParameters.fromJson(Map<String, dynamic> json) {
    return EventBridgeParameters(
      detailType: json['DetailType'] as String,
      source: json['Source'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final detailType = this.detailType;
    final source = this.source;
    return {
      'DetailType': detailType,
      'Source': source,
    };
  }
}

/// Allows you to configure a time window during which EventBridge Scheduler
/// invokes the schedule.
class FlexibleTimeWindow {
  /// Determines whether the schedule is invoked within a flexible time window.
  final FlexibleTimeWindowMode mode;

  /// The maximum time window during which a schedule can be invoked.
  final int? maximumWindowInMinutes;

  FlexibleTimeWindow({
    required this.mode,
    this.maximumWindowInMinutes,
  });

  factory FlexibleTimeWindow.fromJson(Map<String, dynamic> json) {
    return FlexibleTimeWindow(
      mode: (json['Mode'] as String).toFlexibleTimeWindowMode(),
      maximumWindowInMinutes: json['MaximumWindowInMinutes'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final mode = this.mode;
    final maximumWindowInMinutes = this.maximumWindowInMinutes;
    return {
      'Mode': mode.toValue(),
      if (maximumWindowInMinutes != null)
        'MaximumWindowInMinutes': maximumWindowInMinutes,
    };
  }
}

enum FlexibleTimeWindowMode {
  off,
  flexible,
}

extension FlexibleTimeWindowModeValueExtension on FlexibleTimeWindowMode {
  String toValue() {
    switch (this) {
      case FlexibleTimeWindowMode.off:
        return 'OFF';
      case FlexibleTimeWindowMode.flexible:
        return 'FLEXIBLE';
    }
  }
}

extension FlexibleTimeWindowModeFromString on String {
  FlexibleTimeWindowMode toFlexibleTimeWindowMode() {
    switch (this) {
      case 'OFF':
        return FlexibleTimeWindowMode.off;
      case 'FLEXIBLE':
        return FlexibleTimeWindowMode.flexible;
    }
    throw Exception('$this is not known in enum FlexibleTimeWindowMode');
  }
}

class GetScheduleGroupOutput {
  /// The Amazon Resource Name (ARN) of the schedule group.
  final String? arn;

  /// The time at which the schedule group was created.
  final DateTime? creationDate;

  /// The time at which the schedule group was last modified.
  final DateTime? lastModificationDate;

  /// The name of the schedule group.
  final String? name;

  /// Specifies the state of the schedule group.
  final ScheduleGroupState? state;

  GetScheduleGroupOutput({
    this.arn,
    this.creationDate,
    this.lastModificationDate,
    this.name,
    this.state,
  });

  factory GetScheduleGroupOutput.fromJson(Map<String, dynamic> json) {
    return GetScheduleGroupOutput(
      arn: json['Arn'] as String?,
      creationDate: timeStampFromJson(json['CreationDate']),
      lastModificationDate: timeStampFromJson(json['LastModificationDate']),
      name: json['Name'] as String?,
      state: (json['State'] as String?)?.toScheduleGroupState(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationDate = this.creationDate;
    final lastModificationDate = this.lastModificationDate;
    final name = this.name;
    final state = this.state;
    return {
      if (arn != null) 'Arn': arn,
      if (creationDate != null)
        'CreationDate': unixTimestampToJson(creationDate),
      if (lastModificationDate != null)
        'LastModificationDate': unixTimestampToJson(lastModificationDate),
      if (name != null) 'Name': name,
      if (state != null) 'State': state.toValue(),
    };
  }
}

class GetScheduleOutput {
  /// Indicates the action that EventBridge Scheduler applies to the schedule
  /// after the schedule completes invoking the target.
  final ActionAfterCompletion? actionAfterCompletion;

  /// The Amazon Resource Name (ARN) of the schedule.
  final String? arn;

  /// The time at which the schedule was created.
  final DateTime? creationDate;

  /// The description of the schedule.
  final String? description;

  /// The date, in UTC, before which the schedule can invoke its target. Depending
  /// on the schedule's recurrence expression, invocations might stop on, or
  /// before, the <code>EndDate</code> you specify. EventBridge Scheduler ignores
  /// <code>EndDate</code> for one-time schedules.
  final DateTime? endDate;

  /// Allows you to configure a time window during which EventBridge Scheduler
  /// invokes the schedule.
  final FlexibleTimeWindow? flexibleTimeWindow;

  /// The name of the schedule group associated with this schedule.
  final String? groupName;

  /// The ARN for a customer managed KMS Key that is be used to encrypt and
  /// decrypt your data.
  final String? kmsKeyArn;

  /// The time at which the schedule was last modified.
  final DateTime? lastModificationDate;

  /// The name of the schedule.
  final String? name;

  /// The expression that defines when the schedule runs. The following formats
  /// are supported.
  ///
  /// <ul>
  /// <li>
  /// <code>at</code> expression - <code>at(yyyy-mm-ddThh:mm:ss)</code>
  /// </li>
  /// <li>
  /// <code>rate</code> expression - <code>rate(value unit)</code>
  /// </li>
  /// <li>
  /// <code>cron</code> expression - <code>cron(fields)</code>
  /// </li>
  /// </ul>
  /// You can use <code>at</code> expressions to create one-time schedules that
  /// invoke a target once, at the time and in the time zone, that you specify.
  /// You can use <code>rate</code> and <code>cron</code> expressions to create
  /// recurring schedules. Rate-based schedules are useful when you want to invoke
  /// a target at regular intervals, such as every 15 minutes or every five days.
  /// Cron-based schedules are useful when you want to invoke a target
  /// periodically at a specific time, such as at 8:00 am (UTC+0) every 1st day of
  /// the month.
  ///
  /// A <code>cron</code> expression consists of six fields separated by white
  /// spaces: <code>(minutes hours day_of_month month day_of_week year)</code>.
  ///
  /// A <code>rate</code> expression consists of a <i>value</i> as a positive
  /// integer, and a <i>unit</i> with the following options: <code>minute</code> |
  /// <code>minutes</code> | <code>hour</code> | <code>hours</code> |
  /// <code>day</code> | <code>days</code>
  ///
  /// For more information and examples, see <a
  /// href="https://docs.aws.amazon.com/scheduler/latest/UserGuide/schedule-types.html">Schedule
  /// types on EventBridge Scheduler</a> in the <i>EventBridge Scheduler User
  /// Guide</i>.
  final String? scheduleExpression;

  /// The timezone in which the scheduling expression is evaluated.
  final String? scheduleExpressionTimezone;

  /// The date, in UTC, after which the schedule can begin invoking its target.
  /// Depending on the schedule's recurrence expression, invocations might occur
  /// on, or after, the <code>StartDate</code> you specify. EventBridge Scheduler
  /// ignores <code>StartDate</code> for one-time schedules.
  final DateTime? startDate;

  /// Specifies whether the schedule is enabled or disabled.
  final ScheduleState? state;

  /// The schedule target.
  final Target? target;

  GetScheduleOutput({
    this.actionAfterCompletion,
    this.arn,
    this.creationDate,
    this.description,
    this.endDate,
    this.flexibleTimeWindow,
    this.groupName,
    this.kmsKeyArn,
    this.lastModificationDate,
    this.name,
    this.scheduleExpression,
    this.scheduleExpressionTimezone,
    this.startDate,
    this.state,
    this.target,
  });

  factory GetScheduleOutput.fromJson(Map<String, dynamic> json) {
    return GetScheduleOutput(
      actionAfterCompletion:
          (json['ActionAfterCompletion'] as String?)?.toActionAfterCompletion(),
      arn: json['Arn'] as String?,
      creationDate: timeStampFromJson(json['CreationDate']),
      description: json['Description'] as String?,
      endDate: timeStampFromJson(json['EndDate']),
      flexibleTimeWindow: json['FlexibleTimeWindow'] != null
          ? FlexibleTimeWindow.fromJson(
              json['FlexibleTimeWindow'] as Map<String, dynamic>)
          : null,
      groupName: json['GroupName'] as String?,
      kmsKeyArn: json['KmsKeyArn'] as String?,
      lastModificationDate: timeStampFromJson(json['LastModificationDate']),
      name: json['Name'] as String?,
      scheduleExpression: json['ScheduleExpression'] as String?,
      scheduleExpressionTimezone: json['ScheduleExpressionTimezone'] as String?,
      startDate: timeStampFromJson(json['StartDate']),
      state: (json['State'] as String?)?.toScheduleState(),
      target: json['Target'] != null
          ? Target.fromJson(json['Target'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final actionAfterCompletion = this.actionAfterCompletion;
    final arn = this.arn;
    final creationDate = this.creationDate;
    final description = this.description;
    final endDate = this.endDate;
    final flexibleTimeWindow = this.flexibleTimeWindow;
    final groupName = this.groupName;
    final kmsKeyArn = this.kmsKeyArn;
    final lastModificationDate = this.lastModificationDate;
    final name = this.name;
    final scheduleExpression = this.scheduleExpression;
    final scheduleExpressionTimezone = this.scheduleExpressionTimezone;
    final startDate = this.startDate;
    final state = this.state;
    final target = this.target;
    return {
      if (actionAfterCompletion != null)
        'ActionAfterCompletion': actionAfterCompletion.toValue(),
      if (arn != null) 'Arn': arn,
      if (creationDate != null)
        'CreationDate': unixTimestampToJson(creationDate),
      if (description != null) 'Description': description,
      if (endDate != null) 'EndDate': unixTimestampToJson(endDate),
      if (flexibleTimeWindow != null) 'FlexibleTimeWindow': flexibleTimeWindow,
      if (groupName != null) 'GroupName': groupName,
      if (kmsKeyArn != null) 'KmsKeyArn': kmsKeyArn,
      if (lastModificationDate != null)
        'LastModificationDate': unixTimestampToJson(lastModificationDate),
      if (name != null) 'Name': name,
      if (scheduleExpression != null) 'ScheduleExpression': scheduleExpression,
      if (scheduleExpressionTimezone != null)
        'ScheduleExpressionTimezone': scheduleExpressionTimezone,
      if (startDate != null) 'StartDate': unixTimestampToJson(startDate),
      if (state != null) 'State': state.toValue(),
      if (target != null) 'Target': target,
    };
  }
}

/// The templated target type for the Amazon Kinesis <a
/// href="kinesis/latest/APIReference/API_PutRecord.html">
/// <code>PutRecord</code> </a> API operation.
class KinesisParameters {
  /// Specifies the shard to which EventBridge Scheduler sends the event. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/streams/latest/dev/key-concepts.html">Amazon
  /// Kinesis Data Streams terminology and concepts</a> in the <i>Amazon Kinesis
  /// Streams Developer Guide</i>.
  final String partitionKey;

  KinesisParameters({
    required this.partitionKey,
  });

  factory KinesisParameters.fromJson(Map<String, dynamic> json) {
    return KinesisParameters(
      partitionKey: json['PartitionKey'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final partitionKey = this.partitionKey;
    return {
      'PartitionKey': partitionKey,
    };
  }
}

enum LaunchType {
  ec2,
  fargate,
  external,
}

extension LaunchTypeValueExtension on LaunchType {
  String toValue() {
    switch (this) {
      case LaunchType.ec2:
        return 'EC2';
      case LaunchType.fargate:
        return 'FARGATE';
      case LaunchType.external:
        return 'EXTERNAL';
    }
  }
}

extension LaunchTypeFromString on String {
  LaunchType toLaunchType() {
    switch (this) {
      case 'EC2':
        return LaunchType.ec2;
      case 'FARGATE':
        return LaunchType.fargate;
      case 'EXTERNAL':
        return LaunchType.external;
    }
    throw Exception('$this is not known in enum LaunchType');
  }
}

class ListScheduleGroupsOutput {
  /// The schedule groups that match the specified criteria.
  final List<ScheduleGroupSummary> scheduleGroups;

  /// Indicates whether there are additional results to retrieve. If the value is
  /// null, there are no more results.
  final String? nextToken;

  ListScheduleGroupsOutput({
    required this.scheduleGroups,
    this.nextToken,
  });

  factory ListScheduleGroupsOutput.fromJson(Map<String, dynamic> json) {
    return ListScheduleGroupsOutput(
      scheduleGroups: (json['ScheduleGroups'] as List)
          .whereNotNull()
          .map((e) => ScheduleGroupSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final scheduleGroups = this.scheduleGroups;
    final nextToken = this.nextToken;
    return {
      'ScheduleGroups': scheduleGroups,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListSchedulesOutput {
  /// The schedules that match the specified criteria.
  final List<ScheduleSummary> schedules;

  /// Indicates whether there are additional results to retrieve. If the value is
  /// null, there are no more results.
  final String? nextToken;

  ListSchedulesOutput({
    required this.schedules,
    this.nextToken,
  });

  factory ListSchedulesOutput.fromJson(Map<String, dynamic> json) {
    return ListSchedulesOutput(
      schedules: (json['Schedules'] as List)
          .whereNotNull()
          .map((e) => ScheduleSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final schedules = this.schedules;
    final nextToken = this.nextToken;
    return {
      'Schedules': schedules,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListTagsForResourceOutput {
  /// The list of tags associated with the specified resource.
  final List<Tag>? tags;

  ListTagsForResourceOutput({
    this.tags,
  });

  factory ListTagsForResourceOutput.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceOutput(
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
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

/// Specifies the network configuration for an ECS task.
class NetworkConfiguration {
  /// Specifies the Amazon VPC subnets and security groups for the task, and
  /// whether a public IP address is to be used. This structure is relevant only
  /// for ECS tasks that use the awsvpc network mode.
  final AwsVpcConfiguration? awsvpcConfiguration;

  NetworkConfiguration({
    this.awsvpcConfiguration,
  });

  factory NetworkConfiguration.fromJson(Map<String, dynamic> json) {
    return NetworkConfiguration(
      awsvpcConfiguration: json['awsvpcConfiguration'] != null
          ? AwsVpcConfiguration.fromJson(
              json['awsvpcConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final awsvpcConfiguration = this.awsvpcConfiguration;
    return {
      if (awsvpcConfiguration != null)
        'awsvpcConfiguration': awsvpcConfiguration,
    };
  }
}

/// An object representing a constraint on task placement.
class PlacementConstraint {
  /// A cluster query language expression to apply to the constraint. You cannot
  /// specify an expression if the constraint type is
  /// <code>distinctInstance</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/latest/developerguide/cluster-query-language.html">Cluster
  /// query language</a> in the <i>Amazon ECS Developer Guide</i>.
  final String? expression;

  /// The type of constraint. Use <code>distinctInstance</code> to ensure that
  /// each task in a particular group is running on a different container
  /// instance. Use <code>memberOf</code> to restrict the selection to a group of
  /// valid candidates.
  final PlacementConstraintType? type;

  PlacementConstraint({
    this.expression,
    this.type,
  });

  factory PlacementConstraint.fromJson(Map<String, dynamic> json) {
    return PlacementConstraint(
      expression: json['expression'] as String?,
      type: (json['type'] as String?)?.toPlacementConstraintType(),
    );
  }

  Map<String, dynamic> toJson() {
    final expression = this.expression;
    final type = this.type;
    return {
      if (expression != null) 'expression': expression,
      if (type != null) 'type': type.toValue(),
    };
  }
}

enum PlacementConstraintType {
  distinctInstance,
  memberOf,
}

extension PlacementConstraintTypeValueExtension on PlacementConstraintType {
  String toValue() {
    switch (this) {
      case PlacementConstraintType.distinctInstance:
        return 'distinctInstance';
      case PlacementConstraintType.memberOf:
        return 'memberOf';
    }
  }
}

extension PlacementConstraintTypeFromString on String {
  PlacementConstraintType toPlacementConstraintType() {
    switch (this) {
      case 'distinctInstance':
        return PlacementConstraintType.distinctInstance;
      case 'memberOf':
        return PlacementConstraintType.memberOf;
    }
    throw Exception('$this is not known in enum PlacementConstraintType');
  }
}

/// The task placement strategy for a task or service.
class PlacementStrategy {
  /// The field to apply the placement strategy against. For the spread placement
  /// strategy, valid values are <code>instanceId</code> (or
  /// <code>instanceId</code>, which has the same effect), or any platform or
  /// custom attribute that is applied to a container instance, such as
  /// <code>attribute:ecs.availability-zone</code>. For the binpack placement
  /// strategy, valid values are <code>cpu</code> and <code>memory</code>. For the
  /// random placement strategy, this field is not used.
  final String? field;

  /// The type of placement strategy. The random placement strategy randomly
  /// places tasks on available candidates. The spread placement strategy spreads
  /// placement across available candidates evenly based on the field parameter.
  /// The binpack strategy places tasks on available candidates that have the
  /// least available amount of the resource that is specified with the field
  /// parameter. For example, if you binpack on memory, a task is placed on the
  /// instance with the least amount of remaining memory (but still enough to run
  /// the task).
  final PlacementStrategyType? type;

  PlacementStrategy({
    this.field,
    this.type,
  });

  factory PlacementStrategy.fromJson(Map<String, dynamic> json) {
    return PlacementStrategy(
      field: json['field'] as String?,
      type: (json['type'] as String?)?.toPlacementStrategyType(),
    );
  }

  Map<String, dynamic> toJson() {
    final field = this.field;
    final type = this.type;
    return {
      if (field != null) 'field': field,
      if (type != null) 'type': type.toValue(),
    };
  }
}

enum PlacementStrategyType {
  random,
  spread,
  binpack,
}

extension PlacementStrategyTypeValueExtension on PlacementStrategyType {
  String toValue() {
    switch (this) {
      case PlacementStrategyType.random:
        return 'random';
      case PlacementStrategyType.spread:
        return 'spread';
      case PlacementStrategyType.binpack:
        return 'binpack';
    }
  }
}

extension PlacementStrategyTypeFromString on String {
  PlacementStrategyType toPlacementStrategyType() {
    switch (this) {
      case 'random':
        return PlacementStrategyType.random;
      case 'spread':
        return PlacementStrategyType.spread;
      case 'binpack':
        return PlacementStrategyType.binpack;
    }
    throw Exception('$this is not known in enum PlacementStrategyType');
  }
}

enum PropagateTags {
  taskDefinition,
}

extension PropagateTagsValueExtension on PropagateTags {
  String toValue() {
    switch (this) {
      case PropagateTags.taskDefinition:
        return 'TASK_DEFINITION';
    }
  }
}

extension PropagateTagsFromString on String {
  PropagateTags toPropagateTags() {
    switch (this) {
      case 'TASK_DEFINITION':
        return PropagateTags.taskDefinition;
    }
    throw Exception('$this is not known in enum PropagateTags');
  }
}

/// A <code>RetryPolicy</code> object that includes information about the retry
/// policy settings, including the maximum age of an event, and the maximum
/// number of times EventBridge Scheduler will try to deliver the event to a
/// target.
class RetryPolicy {
  /// The maximum amount of time, in seconds, to continue to make retry attempts.
  final int? maximumEventAgeInSeconds;

  /// The maximum number of retry attempts to make before the request fails. Retry
  /// attempts with exponential backoff continue until either the maximum number
  /// of attempts is made or until the duration of the
  /// <code>MaximumEventAgeInSeconds</code> is reached.
  final int? maximumRetryAttempts;

  RetryPolicy({
    this.maximumEventAgeInSeconds,
    this.maximumRetryAttempts,
  });

  factory RetryPolicy.fromJson(Map<String, dynamic> json) {
    return RetryPolicy(
      maximumEventAgeInSeconds: json['MaximumEventAgeInSeconds'] as int?,
      maximumRetryAttempts: json['MaximumRetryAttempts'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final maximumEventAgeInSeconds = this.maximumEventAgeInSeconds;
    final maximumRetryAttempts = this.maximumRetryAttempts;
    return {
      if (maximumEventAgeInSeconds != null)
        'MaximumEventAgeInSeconds': maximumEventAgeInSeconds,
      if (maximumRetryAttempts != null)
        'MaximumRetryAttempts': maximumRetryAttempts,
    };
  }
}

/// The name and value pair of a parameter to use to start execution of a
/// SageMaker Model Building Pipeline.
class SageMakerPipelineParameter {
  /// Name of parameter to start execution of a SageMaker Model Building Pipeline.
  final String name;

  /// Value of parameter to start execution of a SageMaker Model Building
  /// Pipeline.
  final String value;

  SageMakerPipelineParameter({
    required this.name,
    required this.value,
  });

  factory SageMakerPipelineParameter.fromJson(Map<String, dynamic> json) {
    return SageMakerPipelineParameter(
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

/// The templated target type for the Amazon SageMaker <a
/// href="https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_StartPipelineExecution.html">
/// <code>StartPipelineExecution</code> </a> API operation.
class SageMakerPipelineParameters {
  /// List of parameter names and values to use when executing the SageMaker Model
  /// Building Pipeline.
  final List<SageMakerPipelineParameter>? pipelineParameterList;

  SageMakerPipelineParameters({
    this.pipelineParameterList,
  });

  factory SageMakerPipelineParameters.fromJson(Map<String, dynamic> json) {
    return SageMakerPipelineParameters(
      pipelineParameterList: (json['PipelineParameterList'] as List?)
          ?.whereNotNull()
          .map((e) =>
              SageMakerPipelineParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final pipelineParameterList = this.pipelineParameterList;
    return {
      if (pipelineParameterList != null)
        'PipelineParameterList': pipelineParameterList,
    };
  }
}

enum ScheduleGroupState {
  active,
  deleting,
}

extension ScheduleGroupStateValueExtension on ScheduleGroupState {
  String toValue() {
    switch (this) {
      case ScheduleGroupState.active:
        return 'ACTIVE';
      case ScheduleGroupState.deleting:
        return 'DELETING';
    }
  }
}

extension ScheduleGroupStateFromString on String {
  ScheduleGroupState toScheduleGroupState() {
    switch (this) {
      case 'ACTIVE':
        return ScheduleGroupState.active;
      case 'DELETING':
        return ScheduleGroupState.deleting;
    }
    throw Exception('$this is not known in enum ScheduleGroupState');
  }
}

/// The details of a schedule group.
class ScheduleGroupSummary {
  /// The Amazon Resource Name (ARN) of the schedule group.
  final String? arn;

  /// The time at which the schedule group was created.
  final DateTime? creationDate;

  /// The time at which the schedule group was last modified.
  final DateTime? lastModificationDate;

  /// The name of the schedule group.
  final String? name;

  /// Specifies the state of the schedule group.
  final ScheduleGroupState? state;

  ScheduleGroupSummary({
    this.arn,
    this.creationDate,
    this.lastModificationDate,
    this.name,
    this.state,
  });

  factory ScheduleGroupSummary.fromJson(Map<String, dynamic> json) {
    return ScheduleGroupSummary(
      arn: json['Arn'] as String?,
      creationDate: timeStampFromJson(json['CreationDate']),
      lastModificationDate: timeStampFromJson(json['LastModificationDate']),
      name: json['Name'] as String?,
      state: (json['State'] as String?)?.toScheduleGroupState(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationDate = this.creationDate;
    final lastModificationDate = this.lastModificationDate;
    final name = this.name;
    final state = this.state;
    return {
      if (arn != null) 'Arn': arn,
      if (creationDate != null)
        'CreationDate': unixTimestampToJson(creationDate),
      if (lastModificationDate != null)
        'LastModificationDate': unixTimestampToJson(lastModificationDate),
      if (name != null) 'Name': name,
      if (state != null) 'State': state.toValue(),
    };
  }
}

enum ScheduleState {
  enabled,
  disabled,
}

extension ScheduleStateValueExtension on ScheduleState {
  String toValue() {
    switch (this) {
      case ScheduleState.enabled:
        return 'ENABLED';
      case ScheduleState.disabled:
        return 'DISABLED';
    }
  }
}

extension ScheduleStateFromString on String {
  ScheduleState toScheduleState() {
    switch (this) {
      case 'ENABLED':
        return ScheduleState.enabled;
      case 'DISABLED':
        return ScheduleState.disabled;
    }
    throw Exception('$this is not known in enum ScheduleState');
  }
}

/// The details of a schedule.
class ScheduleSummary {
  /// The Amazon Resource Name (ARN) of the schedule.
  final String? arn;

  /// The time at which the schedule was created.
  final DateTime? creationDate;

  /// The name of the schedule group associated with this schedule.
  final String? groupName;

  /// The time at which the schedule was last modified.
  final DateTime? lastModificationDate;

  /// The name of the schedule.
  final String? name;

  /// Specifies whether the schedule is enabled or disabled.
  final ScheduleState? state;

  /// The schedule's target details.
  final TargetSummary? target;

  ScheduleSummary({
    this.arn,
    this.creationDate,
    this.groupName,
    this.lastModificationDate,
    this.name,
    this.state,
    this.target,
  });

  factory ScheduleSummary.fromJson(Map<String, dynamic> json) {
    return ScheduleSummary(
      arn: json['Arn'] as String?,
      creationDate: timeStampFromJson(json['CreationDate']),
      groupName: json['GroupName'] as String?,
      lastModificationDate: timeStampFromJson(json['LastModificationDate']),
      name: json['Name'] as String?,
      state: (json['State'] as String?)?.toScheduleState(),
      target: json['Target'] != null
          ? TargetSummary.fromJson(json['Target'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationDate = this.creationDate;
    final groupName = this.groupName;
    final lastModificationDate = this.lastModificationDate;
    final name = this.name;
    final state = this.state;
    final target = this.target;
    return {
      if (arn != null) 'Arn': arn,
      if (creationDate != null)
        'CreationDate': unixTimestampToJson(creationDate),
      if (groupName != null) 'GroupName': groupName,
      if (lastModificationDate != null)
        'LastModificationDate': unixTimestampToJson(lastModificationDate),
      if (name != null) 'Name': name,
      if (state != null) 'State': state.toValue(),
      if (target != null) 'Target': target,
    };
  }
}

/// The templated target type for the Amazon SQS <a
/// href="https://docs.aws.amazon.com/AWSSimpleQueueService/latest/APIReference/API_SendMessage.html">
/// <code>SendMessage</code> </a> API operation. Contains the message group ID
/// to use when the target is a FIFO queue. If you specify an Amazon SQS FIFO
/// queue as a target, the queue must have content-based deduplication enabled.
/// For more information, see <a
/// href="https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/using-messagededuplicationid-property.html">Using
/// the Amazon SQS message deduplication ID</a> in the <i>Amazon SQS Developer
/// Guide</i>.
class SqsParameters {
  /// The FIFO message group ID to use as the target.
  final String? messageGroupId;

  SqsParameters({
    this.messageGroupId,
  });

  factory SqsParameters.fromJson(Map<String, dynamic> json) {
    return SqsParameters(
      messageGroupId: json['MessageGroupId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final messageGroupId = this.messageGroupId;
    return {
      if (messageGroupId != null) 'MessageGroupId': messageGroupId,
    };
  }
}

/// Tag to associate with a schedule group.
class Tag {
  /// The key for the tag.
  final String key;

  /// The value for the tag.
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

class TagResourceOutput {
  TagResourceOutput();

  factory TagResourceOutput.fromJson(Map<String, dynamic> _) {
    return TagResourceOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The schedule's target. EventBridge Scheduler supports templated target that
/// invoke common API operations, as well as universal targets that you can
/// customize to invoke over 6,000 API operations across more than 270 services.
/// You can only specify one templated or universal target for a schedule.
class Target {
  /// The Amazon Resource Name (ARN) of the target.
  final String arn;

  /// The Amazon Resource Name (ARN) of the IAM role that EventBridge Scheduler
  /// will use for this target when the schedule is invoked.
  final String roleArn;

  /// An object that contains information about an Amazon SQS queue that
  /// EventBridge Scheduler uses as a dead-letter queue for your schedule. If
  /// specified, EventBridge Scheduler delivers failed events that could not be
  /// successfully delivered to a target to the queue.
  final DeadLetterConfig? deadLetterConfig;

  /// The templated target type for the Amazon ECS <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_RunTask.html">
  /// <code>RunTask</code> </a> API operation.
  final EcsParameters? ecsParameters;

  /// The templated target type for the EventBridge <a
  /// href="https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_PutEvents.html">
  /// <code>PutEvents</code> </a> API operation.
  final EventBridgeParameters? eventBridgeParameters;

  /// The text, or well-formed JSON, passed to the target. If you are configuring
  /// a templated Lambda, AWS Step Functions, or Amazon EventBridge target, the
  /// input must be a well-formed JSON. For all other target types, a JSON is not
  /// required. If you do not specify anything for this field, EventBridge
  /// Scheduler delivers a default notification to the target.
  final String? input;

  /// The templated target type for the Amazon Kinesis <a
  /// href="kinesis/latest/APIReference/API_PutRecord.html">
  /// <code>PutRecord</code> </a> API operation.
  final KinesisParameters? kinesisParameters;

  /// A <code>RetryPolicy</code> object that includes information about the retry
  /// policy settings, including the maximum age of an event, and the maximum
  /// number of times EventBridge Scheduler will try to deliver the event to a
  /// target.
  final RetryPolicy? retryPolicy;

  /// The templated target type for the Amazon SageMaker <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_StartPipelineExecution.html">
  /// <code>StartPipelineExecution</code> </a> API operation.
  final SageMakerPipelineParameters? sageMakerPipelineParameters;

  /// The templated target type for the Amazon SQS <a
  /// href="https://docs.aws.amazon.com/AWSSimpleQueueService/latest/APIReference/API_SendMessage.html">
  /// <code>SendMessage</code> </a> API operation. Contains the message group ID
  /// to use when the target is a FIFO queue. If you specify an Amazon SQS FIFO
  /// queue as a target, the queue must have content-based deduplication enabled.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/using-messagededuplicationid-property.html">Using
  /// the Amazon SQS message deduplication ID</a> in the <i>Amazon SQS Developer
  /// Guide</i>.
  final SqsParameters? sqsParameters;

  Target({
    required this.arn,
    required this.roleArn,
    this.deadLetterConfig,
    this.ecsParameters,
    this.eventBridgeParameters,
    this.input,
    this.kinesisParameters,
    this.retryPolicy,
    this.sageMakerPipelineParameters,
    this.sqsParameters,
  });

  factory Target.fromJson(Map<String, dynamic> json) {
    return Target(
      arn: json['Arn'] as String,
      roleArn: json['RoleArn'] as String,
      deadLetterConfig: json['DeadLetterConfig'] != null
          ? DeadLetterConfig.fromJson(
              json['DeadLetterConfig'] as Map<String, dynamic>)
          : null,
      ecsParameters: json['EcsParameters'] != null
          ? EcsParameters.fromJson(
              json['EcsParameters'] as Map<String, dynamic>)
          : null,
      eventBridgeParameters: json['EventBridgeParameters'] != null
          ? EventBridgeParameters.fromJson(
              json['EventBridgeParameters'] as Map<String, dynamic>)
          : null,
      input: json['Input'] as String?,
      kinesisParameters: json['KinesisParameters'] != null
          ? KinesisParameters.fromJson(
              json['KinesisParameters'] as Map<String, dynamic>)
          : null,
      retryPolicy: json['RetryPolicy'] != null
          ? RetryPolicy.fromJson(json['RetryPolicy'] as Map<String, dynamic>)
          : null,
      sageMakerPipelineParameters: json['SageMakerPipelineParameters'] != null
          ? SageMakerPipelineParameters.fromJson(
              json['SageMakerPipelineParameters'] as Map<String, dynamic>)
          : null,
      sqsParameters: json['SqsParameters'] != null
          ? SqsParameters.fromJson(
              json['SqsParameters'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final roleArn = this.roleArn;
    final deadLetterConfig = this.deadLetterConfig;
    final ecsParameters = this.ecsParameters;
    final eventBridgeParameters = this.eventBridgeParameters;
    final input = this.input;
    final kinesisParameters = this.kinesisParameters;
    final retryPolicy = this.retryPolicy;
    final sageMakerPipelineParameters = this.sageMakerPipelineParameters;
    final sqsParameters = this.sqsParameters;
    return {
      'Arn': arn,
      'RoleArn': roleArn,
      if (deadLetterConfig != null) 'DeadLetterConfig': deadLetterConfig,
      if (ecsParameters != null) 'EcsParameters': ecsParameters,
      if (eventBridgeParameters != null)
        'EventBridgeParameters': eventBridgeParameters,
      if (input != null) 'Input': input,
      if (kinesisParameters != null) 'KinesisParameters': kinesisParameters,
      if (retryPolicy != null) 'RetryPolicy': retryPolicy,
      if (sageMakerPipelineParameters != null)
        'SageMakerPipelineParameters': sageMakerPipelineParameters,
      if (sqsParameters != null) 'SqsParameters': sqsParameters,
    };
  }
}

/// The details of a target.
class TargetSummary {
  /// The Amazon Resource Name (ARN) of the target.
  final String arn;

  TargetSummary({
    required this.arn,
  });

  factory TargetSummary.fromJson(Map<String, dynamic> json) {
    return TargetSummary(
      arn: json['Arn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      'Arn': arn,
    };
  }
}

class UntagResourceOutput {
  UntagResourceOutput();

  factory UntagResourceOutput.fromJson(Map<String, dynamic> _) {
    return UntagResourceOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateScheduleOutput {
  /// The Amazon Resource Name (ARN) of the schedule that you updated.
  final String scheduleArn;

  UpdateScheduleOutput({
    required this.scheduleArn,
  });

  factory UpdateScheduleOutput.fromJson(Map<String, dynamic> json) {
    return UpdateScheduleOutput(
      scheduleArn: json['ScheduleArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final scheduleArn = this.scheduleArn;
    return {
      'ScheduleArn': scheduleArn,
    };
  }
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
