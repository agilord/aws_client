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

/// The Amazon Simple Workflow Service (Amazon SWF) makes it easy to build
/// applications that use Amazon's cloud to coordinate work across distributed
/// components. In Amazon SWF, a <i>task</i> represents a logical unit of work
/// that is performed by a component of your workflow. Coordinating tasks in a
/// workflow involves managing intertask dependencies, scheduling, and
/// concurrency in accordance with the logical flow of the application.
class Swf {
  final _s.JsonProtocol _protocol;
  Swf({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'swf',
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

  /// Returns the number of closed workflow executions within the given domain
  /// that meet the specified filtering criteria.
  /// <note>
  /// This operation is eventually consistent. The results are best effort and
  /// may not exactly reflect recent updates and changes.
  /// </note>
  /// <b>Access Control</b>
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// <ul>
  /// <li>
  /// Use a <code>Resource</code> element with the domain name to limit the
  /// action to only specified domains.
  /// </li>
  /// <li>
  /// Use an <code>Action</code> element to allow or deny permission to call
  /// this action.
  /// </li>
  /// <li>
  /// Constrain the following parameters by using a <code>Condition</code>
  /// element with the appropriate keys.
  ///
  /// <ul>
  /// <li>
  /// <code>tagFilter.tag</code>: String constraint. The key is
  /// <code>swf:tagFilter.tag</code>.
  /// </li>
  /// <li>
  /// <code>typeFilter.name</code>: String constraint. The key is
  /// <code>swf:typeFilter.name</code>.
  /// </li>
  /// <li>
  /// <code>typeFilter.version</code>: String constraint. The key is
  /// <code>swf:typeFilter.version</code>.
  /// </li>
  /// </ul> </li>
  /// </ul>
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's <code>cause</code> parameter is
  /// set to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  ///
  /// May throw [UnknownResourceFault].
  /// May throw [OperationNotPermittedFault].
  ///
  /// Parameter [domain] :
  /// The name of the domain containing the workflow executions to count.
  ///
  /// Parameter [closeStatusFilter] :
  /// If specified, only workflow executions that match this close status are
  /// counted. This filter has an affect only if <code>executionStatus</code> is
  /// specified as <code>CLOSED</code>.
  /// <note>
  /// <code>closeStatusFilter</code>, <code>executionFilter</code>,
  /// <code>typeFilter</code> and <code>tagFilter</code> are mutually exclusive.
  /// You can specify at most one of these in a request.
  /// </note>
  ///
  /// Parameter [closeTimeFilter] :
  /// If specified, only workflow executions that meet the close time criteria
  /// of the filter are counted.
  /// <note>
  /// <code>startTimeFilter</code> and <code>closeTimeFilter</code> are mutually
  /// exclusive. You must specify one of these in a request but not both.
  /// </note>
  ///
  /// Parameter [executionFilter] :
  /// If specified, only workflow executions matching the
  /// <code>WorkflowId</code> in the filter are counted.
  /// <note>
  /// <code>closeStatusFilter</code>, <code>executionFilter</code>,
  /// <code>typeFilter</code> and <code>tagFilter</code> are mutually exclusive.
  /// You can specify at most one of these in a request.
  /// </note>
  ///
  /// Parameter [startTimeFilter] :
  /// If specified, only workflow executions that meet the start time criteria
  /// of the filter are counted.
  /// <note>
  /// <code>startTimeFilter</code> and <code>closeTimeFilter</code> are mutually
  /// exclusive. You must specify one of these in a request but not both.
  /// </note>
  ///
  /// Parameter [tagFilter] :
  /// If specified, only executions that have a tag that matches the filter are
  /// counted.
  /// <note>
  /// <code>closeStatusFilter</code>, <code>executionFilter</code>,
  /// <code>typeFilter</code> and <code>tagFilter</code> are mutually exclusive.
  /// You can specify at most one of these in a request.
  /// </note>
  ///
  /// Parameter [typeFilter] :
  /// If specified, indicates the type of the workflow executions to be counted.
  /// <note>
  /// <code>closeStatusFilter</code>, <code>executionFilter</code>,
  /// <code>typeFilter</code> and <code>tagFilter</code> are mutually exclusive.
  /// You can specify at most one of these in a request.
  /// </note>
  Future<WorkflowExecutionCount> countClosedWorkflowExecutions({
    required String domain,
    CloseStatusFilter? closeStatusFilter,
    ExecutionTimeFilter? closeTimeFilter,
    WorkflowExecutionFilter? executionFilter,
    ExecutionTimeFilter? startTimeFilter,
    TagFilter? tagFilter,
    WorkflowTypeFilter? typeFilter,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.CountClosedWorkflowExecutions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'domain': domain,
        if (closeStatusFilter != null) 'closeStatusFilter': closeStatusFilter,
        if (closeTimeFilter != null) 'closeTimeFilter': closeTimeFilter,
        if (executionFilter != null) 'executionFilter': executionFilter,
        if (startTimeFilter != null) 'startTimeFilter': startTimeFilter,
        if (tagFilter != null) 'tagFilter': tagFilter,
        if (typeFilter != null) 'typeFilter': typeFilter,
      },
    );

    return WorkflowExecutionCount.fromJson(jsonResponse.body);
  }

  /// Returns the number of open workflow executions within the given domain
  /// that meet the specified filtering criteria.
  /// <note>
  /// This operation is eventually consistent. The results are best effort and
  /// may not exactly reflect recent updates and changes.
  /// </note>
  /// <b>Access Control</b>
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// <ul>
  /// <li>
  /// Use a <code>Resource</code> element with the domain name to limit the
  /// action to only specified domains.
  /// </li>
  /// <li>
  /// Use an <code>Action</code> element to allow or deny permission to call
  /// this action.
  /// </li>
  /// <li>
  /// Constrain the following parameters by using a <code>Condition</code>
  /// element with the appropriate keys.
  ///
  /// <ul>
  /// <li>
  /// <code>tagFilter.tag</code>: String constraint. The key is
  /// <code>swf:tagFilter.tag</code>.
  /// </li>
  /// <li>
  /// <code>typeFilter.name</code>: String constraint. The key is
  /// <code>swf:typeFilter.name</code>.
  /// </li>
  /// <li>
  /// <code>typeFilter.version</code>: String constraint. The key is
  /// <code>swf:typeFilter.version</code>.
  /// </li>
  /// </ul> </li>
  /// </ul>
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's <code>cause</code> parameter is
  /// set to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  ///
  /// May throw [UnknownResourceFault].
  /// May throw [OperationNotPermittedFault].
  ///
  /// Parameter [domain] :
  /// The name of the domain containing the workflow executions to count.
  ///
  /// Parameter [startTimeFilter] :
  /// Specifies the start time criteria that workflow executions must meet in
  /// order to be counted.
  ///
  /// Parameter [executionFilter] :
  /// If specified, only workflow executions matching the
  /// <code>WorkflowId</code> in the filter are counted.
  /// <note>
  /// <code>executionFilter</code>, <code>typeFilter</code> and
  /// <code>tagFilter</code> are mutually exclusive. You can specify at most one
  /// of these in a request.
  /// </note>
  ///
  /// Parameter [tagFilter] :
  /// If specified, only executions that have a tag that matches the filter are
  /// counted.
  /// <note>
  /// <code>executionFilter</code>, <code>typeFilter</code> and
  /// <code>tagFilter</code> are mutually exclusive. You can specify at most one
  /// of these in a request.
  /// </note>
  ///
  /// Parameter [typeFilter] :
  /// Specifies the type of the workflow executions to be counted.
  /// <note>
  /// <code>executionFilter</code>, <code>typeFilter</code> and
  /// <code>tagFilter</code> are mutually exclusive. You can specify at most one
  /// of these in a request.
  /// </note>
  Future<WorkflowExecutionCount> countOpenWorkflowExecutions({
    required String domain,
    required ExecutionTimeFilter startTimeFilter,
    WorkflowExecutionFilter? executionFilter,
    TagFilter? tagFilter,
    WorkflowTypeFilter? typeFilter,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.CountOpenWorkflowExecutions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'domain': domain,
        'startTimeFilter': startTimeFilter,
        if (executionFilter != null) 'executionFilter': executionFilter,
        if (tagFilter != null) 'tagFilter': tagFilter,
        if (typeFilter != null) 'typeFilter': typeFilter,
      },
    );

    return WorkflowExecutionCount.fromJson(jsonResponse.body);
  }

  /// Returns the estimated number of activity tasks in the specified task list.
  /// The count returned is an approximation and isn't guaranteed to be exact.
  /// If you specify a task list that no activity task was ever scheduled in
  /// then <code>0</code> is returned.
  ///
  /// <b>Access Control</b>
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// <ul>
  /// <li>
  /// Use a <code>Resource</code> element with the domain name to limit the
  /// action to only specified domains.
  /// </li>
  /// <li>
  /// Use an <code>Action</code> element to allow or deny permission to call
  /// this action.
  /// </li>
  /// <li>
  /// Constrain the <code>taskList.name</code> parameter by using a
  /// <code>Condition</code> element with the <code>swf:taskList.name</code> key
  /// to allow the action to access only certain task lists.
  /// </li>
  /// </ul>
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's <code>cause</code> parameter is
  /// set to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  ///
  /// May throw [UnknownResourceFault].
  /// May throw [OperationNotPermittedFault].
  ///
  /// Parameter [domain] :
  /// The name of the domain that contains the task list.
  ///
  /// Parameter [taskList] :
  /// The name of the task list.
  Future<PendingTaskCount> countPendingActivityTasks({
    required String domain,
    required TaskList taskList,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.CountPendingActivityTasks'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'domain': domain,
        'taskList': taskList,
      },
    );

    return PendingTaskCount.fromJson(jsonResponse.body);
  }

  /// Returns the estimated number of decision tasks in the specified task list.
  /// The count returned is an approximation and isn't guaranteed to be exact.
  /// If you specify a task list that no decision task was ever scheduled in
  /// then <code>0</code> is returned.
  ///
  /// <b>Access Control</b>
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// <ul>
  /// <li>
  /// Use a <code>Resource</code> element with the domain name to limit the
  /// action to only specified domains.
  /// </li>
  /// <li>
  /// Use an <code>Action</code> element to allow or deny permission to call
  /// this action.
  /// </li>
  /// <li>
  /// Constrain the <code>taskList.name</code> parameter by using a
  /// <code>Condition</code> element with the <code>swf:taskList.name</code> key
  /// to allow the action to access only certain task lists.
  /// </li>
  /// </ul>
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's <code>cause</code> parameter is
  /// set to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  ///
  /// May throw [UnknownResourceFault].
  /// May throw [OperationNotPermittedFault].
  ///
  /// Parameter [domain] :
  /// The name of the domain that contains the task list.
  ///
  /// Parameter [taskList] :
  /// The name of the task list.
  Future<PendingTaskCount> countPendingDecisionTasks({
    required String domain,
    required TaskList taskList,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.CountPendingDecisionTasks'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'domain': domain,
        'taskList': taskList,
      },
    );

    return PendingTaskCount.fromJson(jsonResponse.body);
  }

  /// Deletes the specified <i>activity type</i>.
  ///
  /// Note: Prior to deletion, activity types must first be <b>deprecated</b>.
  ///
  /// After an activity type has been deleted, you cannot schedule new
  /// activities of that type. Activities that started before the type was
  /// deleted will continue to run.
  ///
  /// <b>Access Control</b>
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// <ul>
  /// <li>
  /// Use a <code>Resource</code> element with the domain name to limit the
  /// action to only specified domains.
  /// </li>
  /// <li>
  /// Use an <code>Action</code> element to allow or deny permission to call
  /// this action.
  /// </li>
  /// <li>
  /// Constrain the following parameters by using a <code>Condition</code>
  /// element with the appropriate keys.
  ///
  /// <ul>
  /// <li>
  /// <code>activityType.name</code>: String constraint. The key is
  /// <code>swf:activityType.name</code>.
  /// </li>
  /// <li>
  /// <code>activityType.version</code>: String constraint. The key is
  /// <code>swf:activityType.version</code>.
  /// </li>
  /// </ul> </li>
  /// </ul>
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's <code>cause</code> parameter is
  /// set to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  ///
  /// May throw [UnknownResourceFault].
  /// May throw [TypeNotDeprecatedFault].
  /// May throw [OperationNotPermittedFault].
  ///
  /// Parameter [activityType] :
  /// The activity type to delete.
  ///
  /// Parameter [domain] :
  /// The name of the domain in which the activity type is registered.
  Future<void> deleteActivityType({
    required ActivityType activityType,
    required String domain,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.DeleteActivityType'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'activityType': activityType,
        'domain': domain,
      },
    );
  }

  /// Deletes the specified <i>workflow type</i>.
  ///
  /// Note: Prior to deletion, workflow types must first be <b>deprecated</b>.
  ///
  /// After a workflow type has been deleted, you cannot create new executions
  /// of that type. Executions that started before the type was deleted will
  /// continue to run.
  ///
  /// <b>Access Control</b>
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// <ul>
  /// <li>
  /// Use a <code>Resource</code> element with the domain name to limit the
  /// action to only specified domains.
  /// </li>
  /// <li>
  /// Use an <code>Action</code> element to allow or deny permission to call
  /// this action.
  /// </li>
  /// <li>
  /// Constrain the following parameters by using a <code>Condition</code>
  /// element with the appropriate keys.
  ///
  /// <ul>
  /// <li>
  /// <code>workflowType.name</code>: String constraint. The key is
  /// <code>swf:workflowType.name</code>.
  /// </li>
  /// <li>
  /// <code>workflowType.version</code>: String constraint. The key is
  /// <code>swf:workflowType.version</code>.
  /// </li>
  /// </ul> </li>
  /// </ul>
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's <code>cause</code> parameter is
  /// set to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  ///
  /// May throw [UnknownResourceFault].
  /// May throw [TypeNotDeprecatedFault].
  /// May throw [OperationNotPermittedFault].
  ///
  /// Parameter [domain] :
  /// The name of the domain in which the workflow type is registered.
  ///
  /// Parameter [workflowType] :
  /// The workflow type to delete.
  Future<void> deleteWorkflowType({
    required String domain,
    required WorkflowType workflowType,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.DeleteWorkflowType'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'domain': domain,
        'workflowType': workflowType,
      },
    );
  }

  /// Deprecates the specified <i>activity type</i>. After an activity type has
  /// been deprecated, you cannot create new tasks of that activity type. Tasks
  /// of this type that were scheduled before the type was deprecated continue
  /// to run.
  ///
  /// <b>Access Control</b>
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// <ul>
  /// <li>
  /// Use a <code>Resource</code> element with the domain name to limit the
  /// action to only specified domains.
  /// </li>
  /// <li>
  /// Use an <code>Action</code> element to allow or deny permission to call
  /// this action.
  /// </li>
  /// <li>
  /// Constrain the following parameters by using a <code>Condition</code>
  /// element with the appropriate keys.
  ///
  /// <ul>
  /// <li>
  /// <code>activityType.name</code>: String constraint. The key is
  /// <code>swf:activityType.name</code>.
  /// </li>
  /// <li>
  /// <code>activityType.version</code>: String constraint. The key is
  /// <code>swf:activityType.version</code>.
  /// </li>
  /// </ul> </li>
  /// </ul>
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's <code>cause</code> parameter is
  /// set to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  ///
  /// May throw [UnknownResourceFault].
  /// May throw [TypeDeprecatedFault].
  /// May throw [OperationNotPermittedFault].
  ///
  /// Parameter [activityType] :
  /// The activity type to deprecate.
  ///
  /// Parameter [domain] :
  /// The name of the domain in which the activity type is registered.
  Future<void> deprecateActivityType({
    required ActivityType activityType,
    required String domain,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.DeprecateActivityType'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'activityType': activityType,
        'domain': domain,
      },
    );
  }

  /// Deprecates the specified domain. After a domain has been deprecated it
  /// cannot be used to create new workflow executions or register new types.
  /// However, you can still use visibility actions on this domain. Deprecating
  /// a domain also deprecates all activity and workflow types registered in the
  /// domain. Executions that were started before the domain was deprecated
  /// continues to run.
  /// <note>
  /// This operation is eventually consistent. The results are best effort and
  /// may not exactly reflect recent updates and changes.
  /// </note>
  /// <b>Access Control</b>
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// <ul>
  /// <li>
  /// Use a <code>Resource</code> element with the domain name to limit the
  /// action to only specified domains.
  /// </li>
  /// <li>
  /// Use an <code>Action</code> element to allow or deny permission to call
  /// this action.
  /// </li>
  /// <li>
  /// You cannot use an IAM policy to constrain this action's parameters.
  /// </li>
  /// </ul>
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's <code>cause</code> parameter is
  /// set to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  ///
  /// May throw [UnknownResourceFault].
  /// May throw [DomainDeprecatedFault].
  /// May throw [OperationNotPermittedFault].
  ///
  /// Parameter [name] :
  /// The name of the domain to deprecate.
  Future<void> deprecateDomain({
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.DeprecateDomain'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
      },
    );
  }

  /// Deprecates the specified <i>workflow type</i>. After a workflow type has
  /// been deprecated, you cannot create new executions of that type. Executions
  /// that were started before the type was deprecated continues to run. A
  /// deprecated workflow type may still be used when calling visibility
  /// actions.
  /// <note>
  /// This operation is eventually consistent. The results are best effort and
  /// may not exactly reflect recent updates and changes.
  /// </note>
  /// <b>Access Control</b>
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// <ul>
  /// <li>
  /// Use a <code>Resource</code> element with the domain name to limit the
  /// action to only specified domains.
  /// </li>
  /// <li>
  /// Use an <code>Action</code> element to allow or deny permission to call
  /// this action.
  /// </li>
  /// <li>
  /// Constrain the following parameters by using a <code>Condition</code>
  /// element with the appropriate keys.
  ///
  /// <ul>
  /// <li>
  /// <code>workflowType.name</code>: String constraint. The key is
  /// <code>swf:workflowType.name</code>.
  /// </li>
  /// <li>
  /// <code>workflowType.version</code>: String constraint. The key is
  /// <code>swf:workflowType.version</code>.
  /// </li>
  /// </ul> </li>
  /// </ul>
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's <code>cause</code> parameter is
  /// set to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  ///
  /// May throw [UnknownResourceFault].
  /// May throw [TypeDeprecatedFault].
  /// May throw [OperationNotPermittedFault].
  ///
  /// Parameter [domain] :
  /// The name of the domain in which the workflow type is registered.
  ///
  /// Parameter [workflowType] :
  /// The workflow type to deprecate.
  Future<void> deprecateWorkflowType({
    required String domain,
    required WorkflowType workflowType,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.DeprecateWorkflowType'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'domain': domain,
        'workflowType': workflowType,
      },
    );
  }

  /// Returns information about the specified activity type. This includes
  /// configuration settings provided when the type was registered and other
  /// general information about the type.
  ///
  /// <b>Access Control</b>
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// <ul>
  /// <li>
  /// Use a <code>Resource</code> element with the domain name to limit the
  /// action to only specified domains.
  /// </li>
  /// <li>
  /// Use an <code>Action</code> element to allow or deny permission to call
  /// this action.
  /// </li>
  /// <li>
  /// Constrain the following parameters by using a <code>Condition</code>
  /// element with the appropriate keys.
  ///
  /// <ul>
  /// <li>
  /// <code>activityType.name</code>: String constraint. The key is
  /// <code>swf:activityType.name</code>.
  /// </li>
  /// <li>
  /// <code>activityType.version</code>: String constraint. The key is
  /// <code>swf:activityType.version</code>.
  /// </li>
  /// </ul> </li>
  /// </ul>
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's <code>cause</code> parameter is
  /// set to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  ///
  /// May throw [UnknownResourceFault].
  /// May throw [OperationNotPermittedFault].
  ///
  /// Parameter [activityType] :
  /// The activity type to get information about. Activity types are identified
  /// by the <code>name</code> and <code>version</code> that were supplied when
  /// the activity was registered.
  ///
  /// Parameter [domain] :
  /// The name of the domain in which the activity type is registered.
  Future<ActivityTypeDetail> describeActivityType({
    required ActivityType activityType,
    required String domain,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.DescribeActivityType'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'activityType': activityType,
        'domain': domain,
      },
    );

    return ActivityTypeDetail.fromJson(jsonResponse.body);
  }

  /// Returns information about the specified domain, including description and
  /// status.
  ///
  /// <b>Access Control</b>
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// <ul>
  /// <li>
  /// Use a <code>Resource</code> element with the domain name to limit the
  /// action to only specified domains.
  /// </li>
  /// <li>
  /// Use an <code>Action</code> element to allow or deny permission to call
  /// this action.
  /// </li>
  /// <li>
  /// You cannot use an IAM policy to constrain this action's parameters.
  /// </li>
  /// </ul>
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's <code>cause</code> parameter is
  /// set to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  ///
  /// May throw [UnknownResourceFault].
  /// May throw [OperationNotPermittedFault].
  ///
  /// Parameter [name] :
  /// The name of the domain to describe.
  Future<DomainDetail> describeDomain({
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.DescribeDomain'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
      },
    );

    return DomainDetail.fromJson(jsonResponse.body);
  }

  /// Returns information about the specified workflow execution including its
  /// type and some statistics.
  /// <note>
  /// This operation is eventually consistent. The results are best effort and
  /// may not exactly reflect recent updates and changes.
  /// </note>
  /// <b>Access Control</b>
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// <ul>
  /// <li>
  /// Use a <code>Resource</code> element with the domain name to limit the
  /// action to only specified domains.
  /// </li>
  /// <li>
  /// Use an <code>Action</code> element to allow or deny permission to call
  /// this action.
  /// </li>
  /// <li>
  /// You cannot use an IAM policy to constrain this action's parameters.
  /// </li>
  /// </ul>
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's <code>cause</code> parameter is
  /// set to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  ///
  /// May throw [UnknownResourceFault].
  /// May throw [OperationNotPermittedFault].
  ///
  /// Parameter [domain] :
  /// The name of the domain containing the workflow execution.
  ///
  /// Parameter [execution] :
  /// The workflow execution to describe.
  Future<WorkflowExecutionDetail> describeWorkflowExecution({
    required String domain,
    required WorkflowExecution execution,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.DescribeWorkflowExecution'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'domain': domain,
        'execution': execution,
      },
    );

    return WorkflowExecutionDetail.fromJson(jsonResponse.body);
  }

  /// Returns information about the specified <i>workflow type</i>. This
  /// includes configuration settings specified when the type was registered and
  /// other information such as creation date, current status, etc.
  ///
  /// <b>Access Control</b>
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// <ul>
  /// <li>
  /// Use a <code>Resource</code> element with the domain name to limit the
  /// action to only specified domains.
  /// </li>
  /// <li>
  /// Use an <code>Action</code> element to allow or deny permission to call
  /// this action.
  /// </li>
  /// <li>
  /// Constrain the following parameters by using a <code>Condition</code>
  /// element with the appropriate keys.
  ///
  /// <ul>
  /// <li>
  /// <code>workflowType.name</code>: String constraint. The key is
  /// <code>swf:workflowType.name</code>.
  /// </li>
  /// <li>
  /// <code>workflowType.version</code>: String constraint. The key is
  /// <code>swf:workflowType.version</code>.
  /// </li>
  /// </ul> </li>
  /// </ul>
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's <code>cause</code> parameter is
  /// set to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  ///
  /// May throw [UnknownResourceFault].
  /// May throw [OperationNotPermittedFault].
  ///
  /// Parameter [domain] :
  /// The name of the domain in which this workflow type is registered.
  ///
  /// Parameter [workflowType] :
  /// The workflow type to describe.
  Future<WorkflowTypeDetail> describeWorkflowType({
    required String domain,
    required WorkflowType workflowType,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.DescribeWorkflowType'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'domain': domain,
        'workflowType': workflowType,
      },
    );

    return WorkflowTypeDetail.fromJson(jsonResponse.body);
  }

  /// Returns the history of the specified workflow execution. The results may
  /// be split into multiple pages. To retrieve subsequent pages, make the call
  /// again using the <code>nextPageToken</code> returned by the initial call.
  /// <note>
  /// This operation is eventually consistent. The results are best effort and
  /// may not exactly reflect recent updates and changes.
  /// </note>
  /// <b>Access Control</b>
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// <ul>
  /// <li>
  /// Use a <code>Resource</code> element with the domain name to limit the
  /// action to only specified domains.
  /// </li>
  /// <li>
  /// Use an <code>Action</code> element to allow or deny permission to call
  /// this action.
  /// </li>
  /// <li>
  /// You cannot use an IAM policy to constrain this action's parameters.
  /// </li>
  /// </ul>
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's <code>cause</code> parameter is
  /// set to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  ///
  /// May throw [UnknownResourceFault].
  /// May throw [OperationNotPermittedFault].
  ///
  /// Parameter [domain] :
  /// The name of the domain containing the workflow execution.
  ///
  /// Parameter [execution] :
  /// Specifies the workflow execution for which to return the history.
  ///
  /// Parameter [maximumPageSize] :
  /// The maximum number of results that are returned per call. Use
  /// <code>nextPageToken</code> to obtain further pages of results.
  ///
  /// Parameter [nextPageToken] :
  /// If <code>NextPageToken</code> is returned there are more results
  /// available. The value of <code>NextPageToken</code> is a unique pagination
  /// token for each page. Make the call again using the returned token to
  /// retrieve the next page. Keep all other arguments unchanged. Each
  /// pagination token expires after 24 hours. Using an expired pagination token
  /// will return a <code>400</code> error: "<code>Specified token has exceeded
  /// its maximum lifetime</code>".
  ///
  /// The configured <code>maximumPageSize</code> determines how many results
  /// can be returned in a single call.
  ///
  /// Parameter [reverseOrder] :
  /// When set to <code>true</code>, returns the events in reverse order. By
  /// default the results are returned in ascending order of the
  /// <code>eventTimeStamp</code> of the events.
  Future<History> getWorkflowExecutionHistory({
    required String domain,
    required WorkflowExecution execution,
    int? maximumPageSize,
    String? nextPageToken,
    bool? reverseOrder,
  }) async {
    _s.validateNumRange(
      'maximumPageSize',
      maximumPageSize,
      0,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.GetWorkflowExecutionHistory'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'domain': domain,
        'execution': execution,
        if (maximumPageSize != null) 'maximumPageSize': maximumPageSize,
        if (nextPageToken != null) 'nextPageToken': nextPageToken,
        if (reverseOrder != null) 'reverseOrder': reverseOrder,
      },
    );

    return History.fromJson(jsonResponse.body);
  }

  /// Returns information about all activities registered in the specified
  /// domain that match the specified name and registration status. The result
  /// includes information like creation date, current status of the activity,
  /// etc. The results may be split into multiple pages. To retrieve subsequent
  /// pages, make the call again using the <code>nextPageToken</code> returned
  /// by the initial call.
  ///
  /// <b>Access Control</b>
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// <ul>
  /// <li>
  /// Use a <code>Resource</code> element with the domain name to limit the
  /// action to only specified domains.
  /// </li>
  /// <li>
  /// Use an <code>Action</code> element to allow or deny permission to call
  /// this action.
  /// </li>
  /// <li>
  /// You cannot use an IAM policy to constrain this action's parameters.
  /// </li>
  /// </ul>
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's <code>cause</code> parameter is
  /// set to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  ///
  /// May throw [OperationNotPermittedFault].
  /// May throw [UnknownResourceFault].
  ///
  /// Parameter [domain] :
  /// The name of the domain in which the activity types have been registered.
  ///
  /// Parameter [registrationStatus] :
  /// Specifies the registration status of the activity types to list.
  ///
  /// Parameter [maximumPageSize] :
  /// The maximum number of results that are returned per call. Use
  /// <code>nextPageToken</code> to obtain further pages of results.
  ///
  /// Parameter [name] :
  /// If specified, only lists the activity types that have this name.
  ///
  /// Parameter [nextPageToken] :
  /// If <code>NextPageToken</code> is returned there are more results
  /// available. The value of <code>NextPageToken</code> is a unique pagination
  /// token for each page. Make the call again using the returned token to
  /// retrieve the next page. Keep all other arguments unchanged. Each
  /// pagination token expires after 24 hours. Using an expired pagination token
  /// will return a <code>400</code> error: "<code>Specified token has exceeded
  /// its maximum lifetime</code>".
  ///
  /// The configured <code>maximumPageSize</code> determines how many results
  /// can be returned in a single call.
  ///
  /// Parameter [reverseOrder] :
  /// When set to <code>true</code>, returns the results in reverse order. By
  /// default, the results are returned in ascending alphabetical order by
  /// <code>name</code> of the activity types.
  Future<ActivityTypeInfos> listActivityTypes({
    required String domain,
    required RegistrationStatus registrationStatus,
    int? maximumPageSize,
    String? name,
    String? nextPageToken,
    bool? reverseOrder,
  }) async {
    _s.validateNumRange(
      'maximumPageSize',
      maximumPageSize,
      0,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.ListActivityTypes'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'domain': domain,
        'registrationStatus': registrationStatus.toValue(),
        if (maximumPageSize != null) 'maximumPageSize': maximumPageSize,
        if (name != null) 'name': name,
        if (nextPageToken != null) 'nextPageToken': nextPageToken,
        if (reverseOrder != null) 'reverseOrder': reverseOrder,
      },
    );

    return ActivityTypeInfos.fromJson(jsonResponse.body);
  }

  /// Returns a list of closed workflow executions in the specified domain that
  /// meet the filtering criteria. The results may be split into multiple pages.
  /// To retrieve subsequent pages, make the call again using the nextPageToken
  /// returned by the initial call.
  /// <note>
  /// This operation is eventually consistent. The results are best effort and
  /// may not exactly reflect recent updates and changes.
  /// </note>
  /// <b>Access Control</b>
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// <ul>
  /// <li>
  /// Use a <code>Resource</code> element with the domain name to limit the
  /// action to only specified domains.
  /// </li>
  /// <li>
  /// Use an <code>Action</code> element to allow or deny permission to call
  /// this action.
  /// </li>
  /// <li>
  /// Constrain the following parameters by using a <code>Condition</code>
  /// element with the appropriate keys.
  ///
  /// <ul>
  /// <li>
  /// <code>tagFilter.tag</code>: String constraint. The key is
  /// <code>swf:tagFilter.tag</code>.
  /// </li>
  /// <li>
  /// <code>typeFilter.name</code>: String constraint. The key is
  /// <code>swf:typeFilter.name</code>.
  /// </li>
  /// <li>
  /// <code>typeFilter.version</code>: String constraint. The key is
  /// <code>swf:typeFilter.version</code>.
  /// </li>
  /// </ul> </li>
  /// </ul>
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's <code>cause</code> parameter is
  /// set to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  ///
  /// May throw [UnknownResourceFault].
  /// May throw [OperationNotPermittedFault].
  ///
  /// Parameter [domain] :
  /// The name of the domain that contains the workflow executions to list.
  ///
  /// Parameter [closeStatusFilter] :
  /// If specified, only workflow executions that match this <i>close status</i>
  /// are listed. For example, if TERMINATED is specified, then only TERMINATED
  /// workflow executions are listed.
  /// <note>
  /// <code>closeStatusFilter</code>, <code>executionFilter</code>,
  /// <code>typeFilter</code> and <code>tagFilter</code> are mutually exclusive.
  /// You can specify at most one of these in a request.
  /// </note>
  ///
  /// Parameter [closeTimeFilter] :
  /// If specified, the workflow executions are included in the returned results
  /// based on whether their close times are within the range specified by this
  /// filter. Also, if this parameter is specified, the returned results are
  /// ordered by their close times.
  /// <note>
  /// <code>startTimeFilter</code> and <code>closeTimeFilter</code> are mutually
  /// exclusive. You must specify one of these in a request but not both.
  /// </note>
  ///
  /// Parameter [executionFilter] :
  /// If specified, only workflow executions matching the workflow ID specified
  /// in the filter are returned.
  /// <note>
  /// <code>closeStatusFilter</code>, <code>executionFilter</code>,
  /// <code>typeFilter</code> and <code>tagFilter</code> are mutually exclusive.
  /// You can specify at most one of these in a request.
  /// </note>
  ///
  /// Parameter [maximumPageSize] :
  /// The maximum number of results that are returned per call. Use
  /// <code>nextPageToken</code> to obtain further pages of results.
  ///
  /// Parameter [nextPageToken] :
  /// If <code>NextPageToken</code> is returned there are more results
  /// available. The value of <code>NextPageToken</code> is a unique pagination
  /// token for each page. Make the call again using the returned token to
  /// retrieve the next page. Keep all other arguments unchanged. Each
  /// pagination token expires after 24 hours. Using an expired pagination token
  /// will return a <code>400</code> error: "<code>Specified token has exceeded
  /// its maximum lifetime</code>".
  ///
  /// The configured <code>maximumPageSize</code> determines how many results
  /// can be returned in a single call.
  ///
  /// Parameter [reverseOrder] :
  /// When set to <code>true</code>, returns the results in reverse order. By
  /// default the results are returned in descending order of the start or the
  /// close time of the executions.
  ///
  /// Parameter [startTimeFilter] :
  /// If specified, the workflow executions are included in the returned results
  /// based on whether their start times are within the range specified by this
  /// filter. Also, if this parameter is specified, the returned results are
  /// ordered by their start times.
  /// <note>
  /// <code>startTimeFilter</code> and <code>closeTimeFilter</code> are mutually
  /// exclusive. You must specify one of these in a request but not both.
  /// </note>
  ///
  /// Parameter [tagFilter] :
  /// If specified, only executions that have the matching tag are listed.
  /// <note>
  /// <code>closeStatusFilter</code>, <code>executionFilter</code>,
  /// <code>typeFilter</code> and <code>tagFilter</code> are mutually exclusive.
  /// You can specify at most one of these in a request.
  /// </note>
  ///
  /// Parameter [typeFilter] :
  /// If specified, only executions of the type specified in the filter are
  /// returned.
  /// <note>
  /// <code>closeStatusFilter</code>, <code>executionFilter</code>,
  /// <code>typeFilter</code> and <code>tagFilter</code> are mutually exclusive.
  /// You can specify at most one of these in a request.
  /// </note>
  Future<WorkflowExecutionInfos> listClosedWorkflowExecutions({
    required String domain,
    CloseStatusFilter? closeStatusFilter,
    ExecutionTimeFilter? closeTimeFilter,
    WorkflowExecutionFilter? executionFilter,
    int? maximumPageSize,
    String? nextPageToken,
    bool? reverseOrder,
    ExecutionTimeFilter? startTimeFilter,
    TagFilter? tagFilter,
    WorkflowTypeFilter? typeFilter,
  }) async {
    _s.validateNumRange(
      'maximumPageSize',
      maximumPageSize,
      0,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.ListClosedWorkflowExecutions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'domain': domain,
        if (closeStatusFilter != null) 'closeStatusFilter': closeStatusFilter,
        if (closeTimeFilter != null) 'closeTimeFilter': closeTimeFilter,
        if (executionFilter != null) 'executionFilter': executionFilter,
        if (maximumPageSize != null) 'maximumPageSize': maximumPageSize,
        if (nextPageToken != null) 'nextPageToken': nextPageToken,
        if (reverseOrder != null) 'reverseOrder': reverseOrder,
        if (startTimeFilter != null) 'startTimeFilter': startTimeFilter,
        if (tagFilter != null) 'tagFilter': tagFilter,
        if (typeFilter != null) 'typeFilter': typeFilter,
      },
    );

    return WorkflowExecutionInfos.fromJson(jsonResponse.body);
  }

  /// Returns the list of domains registered in the account. The results may be
  /// split into multiple pages. To retrieve subsequent pages, make the call
  /// again using the nextPageToken returned by the initial call.
  /// <note>
  /// This operation is eventually consistent. The results are best effort and
  /// may not exactly reflect recent updates and changes.
  /// </note>
  /// <b>Access Control</b>
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// <ul>
  /// <li>
  /// Use a <code>Resource</code> element with the domain name to limit the
  /// action to only specified domains. The element must be set to
  /// <code>arn:aws:swf::AccountID:domain/*</code>, where <i>AccountID</i> is
  /// the account ID, with no dashes.
  /// </li>
  /// <li>
  /// Use an <code>Action</code> element to allow or deny permission to call
  /// this action.
  /// </li>
  /// <li>
  /// You cannot use an IAM policy to constrain this action's parameters.
  /// </li>
  /// </ul>
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's <code>cause</code> parameter is
  /// set to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  ///
  /// May throw [OperationNotPermittedFault].
  ///
  /// Parameter [registrationStatus] :
  /// Specifies the registration status of the domains to list.
  ///
  /// Parameter [maximumPageSize] :
  /// The maximum number of results that are returned per call. Use
  /// <code>nextPageToken</code> to obtain further pages of results.
  ///
  /// Parameter [nextPageToken] :
  /// If <code>NextPageToken</code> is returned there are more results
  /// available. The value of <code>NextPageToken</code> is a unique pagination
  /// token for each page. Make the call again using the returned token to
  /// retrieve the next page. Keep all other arguments unchanged. Each
  /// pagination token expires after 24 hours. Using an expired pagination token
  /// will return a <code>400</code> error: "<code>Specified token has exceeded
  /// its maximum lifetime</code>".
  ///
  /// The configured <code>maximumPageSize</code> determines how many results
  /// can be returned in a single call.
  ///
  /// Parameter [reverseOrder] :
  /// When set to <code>true</code>, returns the results in reverse order. By
  /// default, the results are returned in ascending alphabetical order by
  /// <code>name</code> of the domains.
  Future<DomainInfos> listDomains({
    required RegistrationStatus registrationStatus,
    int? maximumPageSize,
    String? nextPageToken,
    bool? reverseOrder,
  }) async {
    _s.validateNumRange(
      'maximumPageSize',
      maximumPageSize,
      0,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.ListDomains'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'registrationStatus': registrationStatus.toValue(),
        if (maximumPageSize != null) 'maximumPageSize': maximumPageSize,
        if (nextPageToken != null) 'nextPageToken': nextPageToken,
        if (reverseOrder != null) 'reverseOrder': reverseOrder,
      },
    );

    return DomainInfos.fromJson(jsonResponse.body);
  }

  /// Returns a list of open workflow executions in the specified domain that
  /// meet the filtering criteria. The results may be split into multiple pages.
  /// To retrieve subsequent pages, make the call again using the nextPageToken
  /// returned by the initial call.
  /// <note>
  /// This operation is eventually consistent. The results are best effort and
  /// may not exactly reflect recent updates and changes.
  /// </note>
  /// <b>Access Control</b>
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// <ul>
  /// <li>
  /// Use a <code>Resource</code> element with the domain name to limit the
  /// action to only specified domains.
  /// </li>
  /// <li>
  /// Use an <code>Action</code> element to allow or deny permission to call
  /// this action.
  /// </li>
  /// <li>
  /// Constrain the following parameters by using a <code>Condition</code>
  /// element with the appropriate keys.
  ///
  /// <ul>
  /// <li>
  /// <code>tagFilter.tag</code>: String constraint. The key is
  /// <code>swf:tagFilter.tag</code>.
  /// </li>
  /// <li>
  /// <code>typeFilter.name</code>: String constraint. The key is
  /// <code>swf:typeFilter.name</code>.
  /// </li>
  /// <li>
  /// <code>typeFilter.version</code>: String constraint. The key is
  /// <code>swf:typeFilter.version</code>.
  /// </li>
  /// </ul> </li>
  /// </ul>
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's <code>cause</code> parameter is
  /// set to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  ///
  /// May throw [UnknownResourceFault].
  /// May throw [OperationNotPermittedFault].
  ///
  /// Parameter [domain] :
  /// The name of the domain that contains the workflow executions to list.
  ///
  /// Parameter [startTimeFilter] :
  /// Workflow executions are included in the returned results based on whether
  /// their start times are within the range specified by this filter.
  ///
  /// Parameter [executionFilter] :
  /// If specified, only workflow executions matching the workflow ID specified
  /// in the filter are returned.
  /// <note>
  /// <code>executionFilter</code>, <code>typeFilter</code> and
  /// <code>tagFilter</code> are mutually exclusive. You can specify at most one
  /// of these in a request.
  /// </note>
  ///
  /// Parameter [maximumPageSize] :
  /// The maximum number of results that are returned per call. Use
  /// <code>nextPageToken</code> to obtain further pages of results.
  ///
  /// Parameter [nextPageToken] :
  /// If <code>NextPageToken</code> is returned there are more results
  /// available. The value of <code>NextPageToken</code> is a unique pagination
  /// token for each page. Make the call again using the returned token to
  /// retrieve the next page. Keep all other arguments unchanged. Each
  /// pagination token expires after 24 hours. Using an expired pagination token
  /// will return a <code>400</code> error: "<code>Specified token has exceeded
  /// its maximum lifetime</code>".
  ///
  /// The configured <code>maximumPageSize</code> determines how many results
  /// can be returned in a single call.
  ///
  /// Parameter [reverseOrder] :
  /// When set to <code>true</code>, returns the results in reverse order. By
  /// default the results are returned in descending order of the start time of
  /// the executions.
  ///
  /// Parameter [tagFilter] :
  /// If specified, only executions that have the matching tag are listed.
  /// <note>
  /// <code>executionFilter</code>, <code>typeFilter</code> and
  /// <code>tagFilter</code> are mutually exclusive. You can specify at most one
  /// of these in a request.
  /// </note>
  ///
  /// Parameter [typeFilter] :
  /// If specified, only executions of the type specified in the filter are
  /// returned.
  /// <note>
  /// <code>executionFilter</code>, <code>typeFilter</code> and
  /// <code>tagFilter</code> are mutually exclusive. You can specify at most one
  /// of these in a request.
  /// </note>
  Future<WorkflowExecutionInfos> listOpenWorkflowExecutions({
    required String domain,
    required ExecutionTimeFilter startTimeFilter,
    WorkflowExecutionFilter? executionFilter,
    int? maximumPageSize,
    String? nextPageToken,
    bool? reverseOrder,
    TagFilter? tagFilter,
    WorkflowTypeFilter? typeFilter,
  }) async {
    _s.validateNumRange(
      'maximumPageSize',
      maximumPageSize,
      0,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.ListOpenWorkflowExecutions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'domain': domain,
        'startTimeFilter': startTimeFilter,
        if (executionFilter != null) 'executionFilter': executionFilter,
        if (maximumPageSize != null) 'maximumPageSize': maximumPageSize,
        if (nextPageToken != null) 'nextPageToken': nextPageToken,
        if (reverseOrder != null) 'reverseOrder': reverseOrder,
        if (tagFilter != null) 'tagFilter': tagFilter,
        if (typeFilter != null) 'typeFilter': typeFilter,
      },
    );

    return WorkflowExecutionInfos.fromJson(jsonResponse.body);
  }

  /// List tags for a given domain.
  ///
  /// May throw [UnknownResourceFault].
  /// May throw [LimitExceededFault].
  /// May throw [OperationNotPermittedFault].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) for the Amazon SWF domain.
  Future<ListTagsForResourceOutput> listTagsForResource({
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.ListTagsForResource'
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

    return ListTagsForResourceOutput.fromJson(jsonResponse.body);
  }

  /// Returns information about workflow types in the specified domain. The
  /// results may be split into multiple pages that can be retrieved by making
  /// the call repeatedly.
  ///
  /// <b>Access Control</b>
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// <ul>
  /// <li>
  /// Use a <code>Resource</code> element with the domain name to limit the
  /// action to only specified domains.
  /// </li>
  /// <li>
  /// Use an <code>Action</code> element to allow or deny permission to call
  /// this action.
  /// </li>
  /// <li>
  /// You cannot use an IAM policy to constrain this action's parameters.
  /// </li>
  /// </ul>
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's <code>cause</code> parameter is
  /// set to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  ///
  /// May throw [OperationNotPermittedFault].
  /// May throw [UnknownResourceFault].
  ///
  /// Parameter [domain] :
  /// The name of the domain in which the workflow types have been registered.
  ///
  /// Parameter [registrationStatus] :
  /// Specifies the registration status of the workflow types to list.
  ///
  /// Parameter [maximumPageSize] :
  /// The maximum number of results that are returned per call. Use
  /// <code>nextPageToken</code> to obtain further pages of results.
  ///
  /// Parameter [name] :
  /// If specified, lists the workflow type with this name.
  ///
  /// Parameter [nextPageToken] :
  /// If <code>NextPageToken</code> is returned there are more results
  /// available. The value of <code>NextPageToken</code> is a unique pagination
  /// token for each page. Make the call again using the returned token to
  /// retrieve the next page. Keep all other arguments unchanged. Each
  /// pagination token expires after 24 hours. Using an expired pagination token
  /// will return a <code>400</code> error: "<code>Specified token has exceeded
  /// its maximum lifetime</code>".
  ///
  /// The configured <code>maximumPageSize</code> determines how many results
  /// can be returned in a single call.
  ///
  /// Parameter [reverseOrder] :
  /// When set to <code>true</code>, returns the results in reverse order. By
  /// default the results are returned in ascending alphabetical order of the
  /// <code>name</code> of the workflow types.
  Future<WorkflowTypeInfos> listWorkflowTypes({
    required String domain,
    required RegistrationStatus registrationStatus,
    int? maximumPageSize,
    String? name,
    String? nextPageToken,
    bool? reverseOrder,
  }) async {
    _s.validateNumRange(
      'maximumPageSize',
      maximumPageSize,
      0,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.ListWorkflowTypes'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'domain': domain,
        'registrationStatus': registrationStatus.toValue(),
        if (maximumPageSize != null) 'maximumPageSize': maximumPageSize,
        if (name != null) 'name': name,
        if (nextPageToken != null) 'nextPageToken': nextPageToken,
        if (reverseOrder != null) 'reverseOrder': reverseOrder,
      },
    );

    return WorkflowTypeInfos.fromJson(jsonResponse.body);
  }

  /// Used by workers to get an <a>ActivityTask</a> from the specified activity
  /// <code>taskList</code>. This initiates a long poll, where the service holds
  /// the HTTP connection open and responds as soon as a task becomes available.
  /// The maximum time the service holds on to the request before responding is
  /// 60 seconds. If no task is available within 60 seconds, the poll returns an
  /// empty result. An empty result, in this context, means that an ActivityTask
  /// is returned, but that the value of taskToken is an empty string. If a task
  /// is returned, the worker should use its type to identify and process it
  /// correctly.
  /// <important>
  /// Workers should set their client side socket timeout to at least 70 seconds
  /// (10 seconds higher than the maximum time service may hold the poll
  /// request).
  /// </important>
  /// <b>Access Control</b>
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// <ul>
  /// <li>
  /// Use a <code>Resource</code> element with the domain name to limit the
  /// action to only specified domains.
  /// </li>
  /// <li>
  /// Use an <code>Action</code> element to allow or deny permission to call
  /// this action.
  /// </li>
  /// <li>
  /// Constrain the <code>taskList.name</code> parameter by using a
  /// <code>Condition</code> element with the <code>swf:taskList.name</code> key
  /// to allow the action to access only certain task lists.
  /// </li>
  /// </ul>
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's <code>cause</code> parameter is
  /// set to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  ///
  /// May throw [UnknownResourceFault].
  /// May throw [OperationNotPermittedFault].
  /// May throw [LimitExceededFault].
  ///
  /// Parameter [domain] :
  /// The name of the domain that contains the task lists being polled.
  ///
  /// Parameter [taskList] :
  /// Specifies the task list to poll for activity tasks.
  ///
  /// The specified string must not start or end with whitespace. It must not
  /// contain a <code>:</code> (colon), <code>/</code> (slash), <code>|</code>
  /// (vertical bar), or any control characters (<code>\u0000-\u001f</code> |
  /// <code>\u007f-\u009f</code>). Also, it must <i>not</i> be the literal
  /// string <code>arn</code>.
  ///
  /// Parameter [identity] :
  /// Identity of the worker making the request, recorded in the
  /// <code>ActivityTaskStarted</code> event in the workflow history. This
  /// enables diagnostic tracing when problems arise. The form of this identity
  /// is user defined.
  Future<ActivityTask> pollForActivityTask({
    required String domain,
    required TaskList taskList,
    String? identity,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.PollForActivityTask'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'domain': domain,
        'taskList': taskList,
        if (identity != null) 'identity': identity,
      },
    );

    return ActivityTask.fromJson(jsonResponse.body);
  }

  /// Used by deciders to get a <a>DecisionTask</a> from the specified decision
  /// <code>taskList</code>. A decision task may be returned for any open
  /// workflow execution that is using the specified task list. The task
  /// includes a paginated view of the history of the workflow execution. The
  /// decider should use the workflow type and the history to determine how to
  /// properly handle the task.
  ///
  /// This action initiates a long poll, where the service holds the HTTP
  /// connection open and responds as soon a task becomes available. If no
  /// decision task is available in the specified task list before the timeout
  /// of 60 seconds expires, an empty result is returned. An empty result, in
  /// this context, means that a DecisionTask is returned, but that the value of
  /// taskToken is an empty string.
  /// <important>
  /// Deciders should set their client side socket timeout to at least 70
  /// seconds (10 seconds higher than the timeout).
  /// </important> <important>
  /// Because the number of workflow history events for a single workflow
  /// execution might be very large, the result returned might be split up
  /// across a number of pages. To retrieve subsequent pages, make additional
  /// calls to <code>PollForDecisionTask</code> using the
  /// <code>nextPageToken</code> returned by the initial call. Note that you do
  /// <i>not</i> call <code>GetWorkflowExecutionHistory</code> with this
  /// <code>nextPageToken</code>. Instead, call <code>PollForDecisionTask</code>
  /// again.
  /// </important>
  /// <b>Access Control</b>
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// <ul>
  /// <li>
  /// Use a <code>Resource</code> element with the domain name to limit the
  /// action to only specified domains.
  /// </li>
  /// <li>
  /// Use an <code>Action</code> element to allow or deny permission to call
  /// this action.
  /// </li>
  /// <li>
  /// Constrain the <code>taskList.name</code> parameter by using a
  /// <code>Condition</code> element with the <code>swf:taskList.name</code> key
  /// to allow the action to access only certain task lists.
  /// </li>
  /// </ul>
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's <code>cause</code> parameter is
  /// set to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  ///
  /// May throw [UnknownResourceFault].
  /// May throw [OperationNotPermittedFault].
  /// May throw [LimitExceededFault].
  ///
  /// Parameter [domain] :
  /// The name of the domain containing the task lists to poll.
  ///
  /// Parameter [taskList] :
  /// Specifies the task list to poll for decision tasks.
  ///
  /// The specified string must not contain a <code>:</code> (colon),
  /// <code>/</code> (slash), <code>|</code> (vertical bar), or any control
  /// characters (<code>\u0000-\u001f</code> | <code>\u007f-\u009f</code>).
  /// Also, it must <i>not</i> be the literal string <code>arn</code>.
  ///
  /// Parameter [identity] :
  /// Identity of the decider making the request, which is recorded in the
  /// DecisionTaskStarted event in the workflow history. This enables diagnostic
  /// tracing when problems arise. The form of this identity is user defined.
  ///
  /// Parameter [maximumPageSize] :
  /// The maximum number of results that are returned per call. Use
  /// <code>nextPageToken</code> to obtain further pages of results.
  ///
  /// This is an upper limit only; the actual number of results returned per
  /// call may be fewer than the specified maximum.
  ///
  /// Parameter [nextPageToken] :
  /// If <code>NextPageToken</code> is returned there are more results
  /// available. The value of <code>NextPageToken</code> is a unique pagination
  /// token for each page. Make the call again using the returned token to
  /// retrieve the next page. Keep all other arguments unchanged. Each
  /// pagination token expires after 24 hours. Using an expired pagination token
  /// will return a <code>400</code> error: "<code>Specified token has exceeded
  /// its maximum lifetime</code>".
  ///
  /// The configured <code>maximumPageSize</code> determines how many results
  /// can be returned in a single call.
  /// <note>
  /// The <code>nextPageToken</code> returned by this action cannot be used with
  /// <a>GetWorkflowExecutionHistory</a> to get the next page. You must call
  /// <a>PollForDecisionTask</a> again (with the <code>nextPageToken</code>) to
  /// retrieve the next page of history records. Calling
  /// <a>PollForDecisionTask</a> with a <code>nextPageToken</code> doesn't
  /// return a new decision task.
  /// </note>
  ///
  /// Parameter [reverseOrder] :
  /// When set to <code>true</code>, returns the events in reverse order. By
  /// default the results are returned in ascending order of the
  /// <code>eventTimestamp</code> of the events.
  ///
  /// Parameter [startAtPreviousStartedEvent] :
  /// When set to <code>true</code>, returns the events with
  /// <code>eventTimestamp</code> greater than or equal to
  /// <code>eventTimestamp</code> of the most recent
  /// <code>DecisionTaskStarted</code> event. By default, this parameter is set
  /// to <code>false</code>.
  Future<DecisionTask> pollForDecisionTask({
    required String domain,
    required TaskList taskList,
    String? identity,
    int? maximumPageSize,
    String? nextPageToken,
    bool? reverseOrder,
    bool? startAtPreviousStartedEvent,
  }) async {
    _s.validateNumRange(
      'maximumPageSize',
      maximumPageSize,
      0,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.PollForDecisionTask'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'domain': domain,
        'taskList': taskList,
        if (identity != null) 'identity': identity,
        if (maximumPageSize != null) 'maximumPageSize': maximumPageSize,
        if (nextPageToken != null) 'nextPageToken': nextPageToken,
        if (reverseOrder != null) 'reverseOrder': reverseOrder,
        if (startAtPreviousStartedEvent != null)
          'startAtPreviousStartedEvent': startAtPreviousStartedEvent,
      },
    );

    return DecisionTask.fromJson(jsonResponse.body);
  }

  /// Used by activity workers to report to the service that the
  /// <a>ActivityTask</a> represented by the specified <code>taskToken</code> is
  /// still making progress. The worker can also specify details of the
  /// progress, for example percent complete, using the <code>details</code>
  /// parameter. This action can also be used by the worker as a mechanism to
  /// check if cancellation is being requested for the activity task. If a
  /// cancellation is being attempted for the specified task, then the boolean
  /// <code>cancelRequested</code> flag returned by the service is set to
  /// <code>true</code>.
  ///
  /// This action resets the <code>taskHeartbeatTimeout</code> clock. The
  /// <code>taskHeartbeatTimeout</code> is specified in
  /// <a>RegisterActivityType</a>.
  ///
  /// This action doesn't in itself create an event in the workflow execution
  /// history. However, if the task times out, the workflow execution history
  /// contains a <code>ActivityTaskTimedOut</code> event that contains the
  /// information from the last heartbeat generated by the activity worker.
  /// <note>
  /// The <code>taskStartToCloseTimeout</code> of an activity type is the
  /// maximum duration of an activity task, regardless of the number of
  /// <a>RecordActivityTaskHeartbeat</a> requests received. The
  /// <code>taskStartToCloseTimeout</code> is also specified in
  /// <a>RegisterActivityType</a>.
  /// </note> <note>
  /// This operation is only useful for long-lived activities to report
  /// liveliness of the task and to determine if a cancellation is being
  /// attempted.
  /// </note> <important>
  /// If the <code>cancelRequested</code> flag returns <code>true</code>, a
  /// cancellation is being attempted. If the worker can cancel the activity, it
  /// should respond with <a>RespondActivityTaskCanceled</a>. Otherwise, it
  /// should ignore the cancellation request.
  /// </important>
  /// <b>Access Control</b>
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// <ul>
  /// <li>
  /// Use a <code>Resource</code> element with the domain name to limit the
  /// action to only specified domains.
  /// </li>
  /// <li>
  /// Use an <code>Action</code> element to allow or deny permission to call
  /// this action.
  /// </li>
  /// <li>
  /// You cannot use an IAM policy to constrain this action's parameters.
  /// </li>
  /// </ul>
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's <code>cause</code> parameter is
  /// set to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  ///
  /// May throw [UnknownResourceFault].
  /// May throw [OperationNotPermittedFault].
  ///
  /// Parameter [taskToken] :
  /// The <code>taskToken</code> of the <a>ActivityTask</a>.
  /// <important>
  /// <code>taskToken</code> is generated by the service and should be treated
  /// as an opaque value. If the task is passed to another process, its
  /// <code>taskToken</code> must also be passed. This enables it to provide its
  /// progress and respond with results.
  /// </important>
  ///
  /// Parameter [details] :
  /// If specified, contains details about the progress of the task.
  Future<ActivityTaskStatus> recordActivityTaskHeartbeat({
    required String taskToken,
    String? details,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.RecordActivityTaskHeartbeat'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'taskToken': taskToken,
        if (details != null) 'details': details,
      },
    );

    return ActivityTaskStatus.fromJson(jsonResponse.body);
  }

  /// Registers a new <i>activity type</i> along with its configuration settings
  /// in the specified domain.
  /// <important>
  /// A <code>TypeAlreadyExists</code> fault is returned if the type already
  /// exists in the domain. You cannot change any configuration settings of the
  /// type after its registration, and it must be registered as a new version.
  /// </important>
  /// <b>Access Control</b>
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// <ul>
  /// <li>
  /// Use a <code>Resource</code> element with the domain name to limit the
  /// action to only specified domains.
  /// </li>
  /// <li>
  /// Use an <code>Action</code> element to allow or deny permission to call
  /// this action.
  /// </li>
  /// <li>
  /// Constrain the following parameters by using a <code>Condition</code>
  /// element with the appropriate keys.
  ///
  /// <ul>
  /// <li>
  /// <code>defaultTaskList.name</code>: String constraint. The key is
  /// <code>swf:defaultTaskList.name</code>.
  /// </li>
  /// <li>
  /// <code>name</code>: String constraint. The key is <code>swf:name</code>.
  /// </li>
  /// <li>
  /// <code>version</code>: String constraint. The key is
  /// <code>swf:version</code>.
  /// </li>
  /// </ul> </li>
  /// </ul>
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's <code>cause</code> parameter is
  /// set to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  ///
  /// May throw [TypeAlreadyExistsFault].
  /// May throw [LimitExceededFault].
  /// May throw [UnknownResourceFault].
  /// May throw [OperationNotPermittedFault].
  ///
  /// Parameter [domain] :
  /// The name of the domain in which this activity is to be registered.
  ///
  /// Parameter [name] :
  /// The name of the activity type within the domain.
  ///
  /// The specified string must not contain a <code>:</code> (colon),
  /// <code>/</code> (slash), <code>|</code> (vertical bar), or any control
  /// characters (<code>\u0000-\u001f</code> | <code>\u007f-\u009f</code>).
  /// Also, it must <i>not</i> be the literal string <code>arn</code>.
  ///
  /// Parameter [version] :
  /// The version of the activity type.
  /// <note>
  /// The activity type consists of the name and version, the combination of
  /// which must be unique within the domain.
  /// </note>
  /// The specified string must not contain a <code>:</code> (colon),
  /// <code>/</code> (slash), <code>|</code> (vertical bar), or any control
  /// characters (<code>\u0000-\u001f</code> | <code>\u007f-\u009f</code>).
  /// Also, it must <i>not</i> be the literal string <code>arn</code>.
  ///
  /// Parameter [defaultTaskHeartbeatTimeout] :
  /// If set, specifies the default maximum time before which a worker
  /// processing a task of this type must report progress by calling
  /// <a>RecordActivityTaskHeartbeat</a>. If the timeout is exceeded, the
  /// activity task is automatically timed out. This default can be overridden
  /// when scheduling an activity task using the
  /// <code>ScheduleActivityTask</code> <a>Decision</a>. If the activity worker
  /// subsequently attempts to record a heartbeat or returns a result, the
  /// activity worker receives an <code>UnknownResource</code> fault. In this
  /// case, Amazon SWF no longer considers the activity task to be valid; the
  /// activity worker should clean up the activity task.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// <code>0</code>. You can use <code>NONE</code> to specify unlimited
  /// duration.
  ///
  /// Parameter [defaultTaskList] :
  /// If set, specifies the default task list to use for scheduling tasks of
  /// this activity type. This default task list is used if a task list isn't
  /// provided when a task is scheduled through the
  /// <code>ScheduleActivityTask</code> <a>Decision</a>.
  ///
  /// Parameter [defaultTaskPriority] :
  /// The default task priority to assign to the activity type. If not assigned,
  /// then <code>0</code> is used. Valid values are integers that range from
  /// Java's <code>Integer.MIN_VALUE</code> (-2147483648) to
  /// <code>Integer.MAX_VALUE</code> (2147483647). Higher numbers indicate
  /// higher priority.
  ///
  /// For more information about setting task priority, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/programming-priority.html">Setting
  /// Task Priority</a> in the <i>in the <i>Amazon SWF Developer Guide</i>.</i>.
  ///
  /// Parameter [defaultTaskScheduleToCloseTimeout] :
  /// If set, specifies the default maximum duration for a task of this activity
  /// type. This default can be overridden when scheduling an activity task
  /// using the <code>ScheduleActivityTask</code> <a>Decision</a>.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// <code>0</code>. You can use <code>NONE</code> to specify unlimited
  /// duration.
  ///
  /// Parameter [defaultTaskScheduleToStartTimeout] :
  /// If set, specifies the default maximum duration that a task of this
  /// activity type can wait before being assigned to a worker. This default can
  /// be overridden when scheduling an activity task using the
  /// <code>ScheduleActivityTask</code> <a>Decision</a>.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// <code>0</code>. You can use <code>NONE</code> to specify unlimited
  /// duration.
  ///
  /// Parameter [defaultTaskStartToCloseTimeout] :
  /// If set, specifies the default maximum duration that a worker can take to
  /// process tasks of this activity type. This default can be overridden when
  /// scheduling an activity task using the <code>ScheduleActivityTask</code>
  /// <a>Decision</a>.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// <code>0</code>. You can use <code>NONE</code> to specify unlimited
  /// duration.
  ///
  /// Parameter [description] :
  /// A textual description of the activity type.
  Future<void> registerActivityType({
    required String domain,
    required String name,
    required String version,
    String? defaultTaskHeartbeatTimeout,
    TaskList? defaultTaskList,
    String? defaultTaskPriority,
    String? defaultTaskScheduleToCloseTimeout,
    String? defaultTaskScheduleToStartTimeout,
    String? defaultTaskStartToCloseTimeout,
    String? description,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.RegisterActivityType'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'domain': domain,
        'name': name,
        'version': version,
        if (defaultTaskHeartbeatTimeout != null)
          'defaultTaskHeartbeatTimeout': defaultTaskHeartbeatTimeout,
        if (defaultTaskList != null) 'defaultTaskList': defaultTaskList,
        if (defaultTaskPriority != null)
          'defaultTaskPriority': defaultTaskPriority,
        if (defaultTaskScheduleToCloseTimeout != null)
          'defaultTaskScheduleToCloseTimeout':
              defaultTaskScheduleToCloseTimeout,
        if (defaultTaskScheduleToStartTimeout != null)
          'defaultTaskScheduleToStartTimeout':
              defaultTaskScheduleToStartTimeout,
        if (defaultTaskStartToCloseTimeout != null)
          'defaultTaskStartToCloseTimeout': defaultTaskStartToCloseTimeout,
        if (description != null) 'description': description,
      },
    );
  }

  /// Registers a new domain.
  ///
  /// <b>Access Control</b>
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// <ul>
  /// <li>
  /// You cannot use an IAM policy to control domain access for this action. The
  /// name of the domain being registered is available as the resource of this
  /// action.
  /// </li>
  /// <li>
  /// Use an <code>Action</code> element to allow or deny permission to call
  /// this action.
  /// </li>
  /// <li>
  /// You cannot use an IAM policy to constrain this action's parameters.
  /// </li>
  /// </ul>
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's <code>cause</code> parameter is
  /// set to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  ///
  /// May throw [DomainAlreadyExistsFault].
  /// May throw [LimitExceededFault].
  /// May throw [OperationNotPermittedFault].
  /// May throw [TooManyTagsFault].
  ///
  /// Parameter [name] :
  /// Name of the domain to register. The name must be unique in the region that
  /// the domain is registered in.
  ///
  /// The specified string must not start or end with whitespace. It must not
  /// contain a <code>:</code> (colon), <code>/</code> (slash), <code>|</code>
  /// (vertical bar), or any control characters (<code>\u0000-\u001f</code> |
  /// <code>\u007f-\u009f</code>). Also, it must <i>not</i> be the literal
  /// string <code>arn</code>.
  ///
  /// Parameter [workflowExecutionRetentionPeriodInDays] :
  /// The duration (in days) that records and histories of workflow executions
  /// on the domain should be kept by the service. After the retention period,
  /// the workflow execution isn't available in the results of visibility calls.
  ///
  /// If you pass the value <code>NONE</code> or <code>0</code> (zero), then the
  /// workflow execution history isn't retained. As soon as the workflow
  /// execution completes, the execution record and its history are deleted.
  ///
  /// The maximum workflow execution retention period is 90 days. For more
  /// information about Amazon SWF service limits, see: <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dg-limits.html">Amazon
  /// SWF Service Limits</a> in the <i>Amazon SWF Developer Guide</i>.
  ///
  /// Parameter [description] :
  /// A text description of the domain.
  ///
  /// Parameter [tags] :
  /// Tags to be added when registering a domain.
  ///
  /// Tags may only contain unicode letters, digits, whitespace, or these
  /// symbols: <code>_ . : / = + - @</code>.
  Future<void> registerDomain({
    required String name,
    required String workflowExecutionRetentionPeriodInDays,
    String? description,
    List<ResourceTag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.RegisterDomain'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
        'workflowExecutionRetentionPeriodInDays':
            workflowExecutionRetentionPeriodInDays,
        if (description != null) 'description': description,
        if (tags != null) 'tags': tags,
      },
    );
  }

  /// Registers a new <i>workflow type</i> and its configuration settings in the
  /// specified domain.
  ///
  /// The retention period for the workflow history is set by the
  /// <a>RegisterDomain</a> action.
  /// <important>
  /// If the type already exists, then a <code>TypeAlreadyExists</code> fault is
  /// returned. You cannot change the configuration settings of a workflow type
  /// once it is registered and it must be registered as a new version.
  /// </important>
  /// <b>Access Control</b>
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// <ul>
  /// <li>
  /// Use a <code>Resource</code> element with the domain name to limit the
  /// action to only specified domains.
  /// </li>
  /// <li>
  /// Use an <code>Action</code> element to allow or deny permission to call
  /// this action.
  /// </li>
  /// <li>
  /// Constrain the following parameters by using a <code>Condition</code>
  /// element with the appropriate keys.
  ///
  /// <ul>
  /// <li>
  /// <code>defaultTaskList.name</code>: String constraint. The key is
  /// <code>swf:defaultTaskList.name</code>.
  /// </li>
  /// <li>
  /// <code>name</code>: String constraint. The key is <code>swf:name</code>.
  /// </li>
  /// <li>
  /// <code>version</code>: String constraint. The key is
  /// <code>swf:version</code>.
  /// </li>
  /// </ul> </li>
  /// </ul>
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's <code>cause</code> parameter is
  /// set to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  ///
  /// May throw [TypeAlreadyExistsFault].
  /// May throw [LimitExceededFault].
  /// May throw [UnknownResourceFault].
  /// May throw [OperationNotPermittedFault].
  ///
  /// Parameter [domain] :
  /// The name of the domain in which to register the workflow type.
  ///
  /// Parameter [name] :
  /// The name of the workflow type.
  ///
  /// The specified string must not contain a <code>:</code> (colon),
  /// <code>/</code> (slash), <code>|</code> (vertical bar), or any control
  /// characters (<code>\u0000-\u001f</code> | <code>\u007f-\u009f</code>).
  /// Also, it must <i>not</i> be the literal string <code>arn</code>.
  ///
  /// Parameter [version] :
  /// The version of the workflow type.
  /// <note>
  /// The workflow type consists of the name and version, the combination of
  /// which must be unique within the domain. To get a list of all currently
  /// registered workflow types, use the <a>ListWorkflowTypes</a> action.
  /// </note>
  /// The specified string must not contain a <code>:</code> (colon),
  /// <code>/</code> (slash), <code>|</code> (vertical bar), or any control
  /// characters (<code>\u0000-\u001f</code> | <code>\u007f-\u009f</code>).
  /// Also, it must <i>not</i> be the literal string <code>arn</code>.
  ///
  /// Parameter [defaultChildPolicy] :
  /// If set, specifies the default policy to use for the child workflow
  /// executions when a workflow execution of this type is terminated, by
  /// calling the <a>TerminateWorkflowExecution</a> action explicitly or due to
  /// an expired timeout. This default can be overridden when starting a
  /// workflow execution using the <a>StartWorkflowExecution</a> action or the
  /// <code>StartChildWorkflowExecution</code> <a>Decision</a>.
  ///
  /// The supported child policies are:
  ///
  /// <ul>
  /// <li>
  /// <code>TERMINATE</code> – The child executions are terminated.
  /// </li>
  /// <li>
  /// <code>REQUEST_CANCEL</code> – A request to cancel is attempted for each
  /// child execution by recording a
  /// <code>WorkflowExecutionCancelRequested</code> event in its history. It is
  /// up to the decider to take appropriate actions when it receives an
  /// execution history with this event.
  /// </li>
  /// <li>
  /// <code>ABANDON</code> – No action is taken. The child executions continue
  /// to run.
  /// </li>
  /// </ul>
  ///
  /// Parameter [defaultExecutionStartToCloseTimeout] :
  /// If set, specifies the default maximum duration for executions of this
  /// workflow type. You can override this default when starting an execution
  /// through the <a>StartWorkflowExecution</a> Action or
  /// <code>StartChildWorkflowExecution</code> <a>Decision</a>.
  ///
  /// The duration is specified in seconds; an integer greater than or equal to
  /// 0. Unlike some of the other timeout parameters in Amazon SWF, you cannot
  /// specify a value of "NONE" for
  /// <code>defaultExecutionStartToCloseTimeout</code>; there is a one-year max
  /// limit on the time that a workflow execution can run. Exceeding this limit
  /// always causes the workflow execution to time out.
  ///
  /// Parameter [defaultLambdaRole] :
  /// The default IAM role attached to this workflow type.
  /// <note>
  /// Executions of this workflow type need IAM roles to invoke Lambda
  /// functions. If you don't specify an IAM role when you start this workflow
  /// type, the default Lambda role is attached to the execution. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/lambda-task.html">https://docs.aws.amazon.com/amazonswf/latest/developerguide/lambda-task.html</a>
  /// in the <i>Amazon SWF Developer Guide</i>.
  /// </note>
  ///
  /// Parameter [defaultTaskList] :
  /// If set, specifies the default task list to use for scheduling decision
  /// tasks for executions of this workflow type. This default is used only if a
  /// task list isn't provided when starting the execution through the
  /// <a>StartWorkflowExecution</a> Action or
  /// <code>StartChildWorkflowExecution</code> <a>Decision</a>.
  ///
  /// Parameter [defaultTaskPriority] :
  /// The default task priority to assign to the workflow type. If not assigned,
  /// then <code>0</code> is used. Valid values are integers that range from
  /// Java's <code>Integer.MIN_VALUE</code> (-2147483648) to
  /// <code>Integer.MAX_VALUE</code> (2147483647). Higher numbers indicate
  /// higher priority.
  ///
  /// For more information about setting task priority, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/programming-priority.html">Setting
  /// Task Priority</a> in the <i>Amazon SWF Developer Guide</i>.
  ///
  /// Parameter [defaultTaskStartToCloseTimeout] :
  /// If set, specifies the default maximum duration of decision tasks for this
  /// workflow type. This default can be overridden when starting a workflow
  /// execution using the <a>StartWorkflowExecution</a> action or the
  /// <code>StartChildWorkflowExecution</code> <a>Decision</a>.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// <code>0</code>. You can use <code>NONE</code> to specify unlimited
  /// duration.
  ///
  /// Parameter [description] :
  /// Textual description of the workflow type.
  Future<void> registerWorkflowType({
    required String domain,
    required String name,
    required String version,
    ChildPolicy? defaultChildPolicy,
    String? defaultExecutionStartToCloseTimeout,
    String? defaultLambdaRole,
    TaskList? defaultTaskList,
    String? defaultTaskPriority,
    String? defaultTaskStartToCloseTimeout,
    String? description,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.RegisterWorkflowType'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'domain': domain,
        'name': name,
        'version': version,
        if (defaultChildPolicy != null)
          'defaultChildPolicy': defaultChildPolicy.toValue(),
        if (defaultExecutionStartToCloseTimeout != null)
          'defaultExecutionStartToCloseTimeout':
              defaultExecutionStartToCloseTimeout,
        if (defaultLambdaRole != null) 'defaultLambdaRole': defaultLambdaRole,
        if (defaultTaskList != null) 'defaultTaskList': defaultTaskList,
        if (defaultTaskPriority != null)
          'defaultTaskPriority': defaultTaskPriority,
        if (defaultTaskStartToCloseTimeout != null)
          'defaultTaskStartToCloseTimeout': defaultTaskStartToCloseTimeout,
        if (description != null) 'description': description,
      },
    );
  }

  /// Records a <code>WorkflowExecutionCancelRequested</code> event in the
  /// currently running workflow execution identified by the given domain,
  /// workflowId, and runId. This logically requests the cancellation of the
  /// workflow execution as a whole. It is up to the decider to take appropriate
  /// actions when it receives an execution history with this event.
  /// <note>
  /// If the runId isn't specified, the
  /// <code>WorkflowExecutionCancelRequested</code> event is recorded in the
  /// history of the current open workflow execution with the specified
  /// workflowId in the domain.
  /// </note> <note>
  /// Because this action allows the workflow to properly clean up and
  /// gracefully close, it should be used instead of
  /// <a>TerminateWorkflowExecution</a> when possible.
  /// </note>
  /// <b>Access Control</b>
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// <ul>
  /// <li>
  /// Use a <code>Resource</code> element with the domain name to limit the
  /// action to only specified domains.
  /// </li>
  /// <li>
  /// Use an <code>Action</code> element to allow or deny permission to call
  /// this action.
  /// </li>
  /// <li>
  /// You cannot use an IAM policy to constrain this action's parameters.
  /// </li>
  /// </ul>
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's <code>cause</code> parameter is
  /// set to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  ///
  /// May throw [UnknownResourceFault].
  /// May throw [OperationNotPermittedFault].
  ///
  /// Parameter [domain] :
  /// The name of the domain containing the workflow execution to cancel.
  ///
  /// Parameter [workflowId] :
  /// The workflowId of the workflow execution to cancel.
  ///
  /// Parameter [runId] :
  /// The runId of the workflow execution to cancel.
  Future<void> requestCancelWorkflowExecution({
    required String domain,
    required String workflowId,
    String? runId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.RequestCancelWorkflowExecution'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'domain': domain,
        'workflowId': workflowId,
        if (runId != null) 'runId': runId,
      },
    );
  }

  /// Used by workers to tell the service that the <a>ActivityTask</a>
  /// identified by the <code>taskToken</code> was successfully canceled.
  /// Additional <code>details</code> can be provided using the
  /// <code>details</code> argument.
  ///
  /// These <code>details</code> (if provided) appear in the
  /// <code>ActivityTaskCanceled</code> event added to the workflow history.
  /// <important>
  /// Only use this operation if the <code>canceled</code> flag of a
  /// <a>RecordActivityTaskHeartbeat</a> request returns <code>true</code> and
  /// if the activity can be safely undone or abandoned.
  /// </important>
  /// A task is considered open from the time that it is scheduled until it is
  /// closed. Therefore a task is reported as open while a worker is processing
  /// it. A task is closed after it has been specified in a call to
  /// <a>RespondActivityTaskCompleted</a>, RespondActivityTaskCanceled,
  /// <a>RespondActivityTaskFailed</a>, or the task has <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dg-basic.html#swf-dev-timeout-types">timed
  /// out</a>.
  ///
  /// <b>Access Control</b>
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// <ul>
  /// <li>
  /// Use a <code>Resource</code> element with the domain name to limit the
  /// action to only specified domains.
  /// </li>
  /// <li>
  /// Use an <code>Action</code> element to allow or deny permission to call
  /// this action.
  /// </li>
  /// <li>
  /// You cannot use an IAM policy to constrain this action's parameters.
  /// </li>
  /// </ul>
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's <code>cause</code> parameter is
  /// set to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  ///
  /// May throw [UnknownResourceFault].
  /// May throw [OperationNotPermittedFault].
  ///
  /// Parameter [taskToken] :
  /// The <code>taskToken</code> of the <a>ActivityTask</a>.
  /// <important>
  /// <code>taskToken</code> is generated by the service and should be treated
  /// as an opaque value. If the task is passed to another process, its
  /// <code>taskToken</code> must also be passed. This enables it to provide its
  /// progress and respond with results.
  /// </important>
  ///
  /// Parameter [details] :
  /// Information about the cancellation.
  Future<void> respondActivityTaskCanceled({
    required String taskToken,
    String? details,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.RespondActivityTaskCanceled'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'taskToken': taskToken,
        if (details != null) 'details': details,
      },
    );
  }

  /// Used by workers to tell the service that the <a>ActivityTask</a>
  /// identified by the <code>taskToken</code> completed successfully with a
  /// <code>result</code> (if provided). The <code>result</code> appears in the
  /// <code>ActivityTaskCompleted</code> event in the workflow history.
  /// <important>
  /// If the requested task doesn't complete successfully, use
  /// <a>RespondActivityTaskFailed</a> instead. If the worker finds that the
  /// task is canceled through the <code>canceled</code> flag returned by
  /// <a>RecordActivityTaskHeartbeat</a>, it should cancel the task, clean up
  /// and then call <a>RespondActivityTaskCanceled</a>.
  /// </important>
  /// A task is considered open from the time that it is scheduled until it is
  /// closed. Therefore a task is reported as open while a worker is processing
  /// it. A task is closed after it has been specified in a call to
  /// RespondActivityTaskCompleted, <a>RespondActivityTaskCanceled</a>,
  /// <a>RespondActivityTaskFailed</a>, or the task has <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dg-basic.html#swf-dev-timeout-types">timed
  /// out</a>.
  ///
  /// <b>Access Control</b>
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// <ul>
  /// <li>
  /// Use a <code>Resource</code> element with the domain name to limit the
  /// action to only specified domains.
  /// </li>
  /// <li>
  /// Use an <code>Action</code> element to allow or deny permission to call
  /// this action.
  /// </li>
  /// <li>
  /// You cannot use an IAM policy to constrain this action's parameters.
  /// </li>
  /// </ul>
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's <code>cause</code> parameter is
  /// set to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  ///
  /// May throw [UnknownResourceFault].
  /// May throw [OperationNotPermittedFault].
  ///
  /// Parameter [taskToken] :
  /// The <code>taskToken</code> of the <a>ActivityTask</a>.
  /// <important>
  /// <code>taskToken</code> is generated by the service and should be treated
  /// as an opaque value. If the task is passed to another process, its
  /// <code>taskToken</code> must also be passed. This enables it to provide its
  /// progress and respond with results.
  /// </important>
  ///
  /// Parameter [result] :
  /// The result of the activity task. It is a free form string that is
  /// implementation specific.
  Future<void> respondActivityTaskCompleted({
    required String taskToken,
    String? result,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.RespondActivityTaskCompleted'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'taskToken': taskToken,
        if (result != null) 'result': result,
      },
    );
  }

  /// Used by workers to tell the service that the <a>ActivityTask</a>
  /// identified by the <code>taskToken</code> has failed with
  /// <code>reason</code> (if specified). The <code>reason</code> and
  /// <code>details</code> appear in the <code>ActivityTaskFailed</code> event
  /// added to the workflow history.
  ///
  /// A task is considered open from the time that it is scheduled until it is
  /// closed. Therefore a task is reported as open while a worker is processing
  /// it. A task is closed after it has been specified in a call to
  /// <a>RespondActivityTaskCompleted</a>, <a>RespondActivityTaskCanceled</a>,
  /// RespondActivityTaskFailed, or the task has <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dg-basic.html#swf-dev-timeout-types">timed
  /// out</a>.
  ///
  /// <b>Access Control</b>
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// <ul>
  /// <li>
  /// Use a <code>Resource</code> element with the domain name to limit the
  /// action to only specified domains.
  /// </li>
  /// <li>
  /// Use an <code>Action</code> element to allow or deny permission to call
  /// this action.
  /// </li>
  /// <li>
  /// You cannot use an IAM policy to constrain this action's parameters.
  /// </li>
  /// </ul>
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's <code>cause</code> parameter is
  /// set to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  ///
  /// May throw [UnknownResourceFault].
  /// May throw [OperationNotPermittedFault].
  ///
  /// Parameter [taskToken] :
  /// The <code>taskToken</code> of the <a>ActivityTask</a>.
  /// <important>
  /// <code>taskToken</code> is generated by the service and should be treated
  /// as an opaque value. If the task is passed to another process, its
  /// <code>taskToken</code> must also be passed. This enables it to provide its
  /// progress and respond with results.
  /// </important>
  ///
  /// Parameter [details] :
  /// Detailed information about the failure.
  ///
  /// Parameter [reason] :
  /// Description of the error that may assist in diagnostics.
  Future<void> respondActivityTaskFailed({
    required String taskToken,
    String? details,
    String? reason,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.RespondActivityTaskFailed'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'taskToken': taskToken,
        if (details != null) 'details': details,
        if (reason != null) 'reason': reason,
      },
    );
  }

  /// Used by deciders to tell the service that the <a>DecisionTask</a>
  /// identified by the <code>taskToken</code> has successfully completed. The
  /// <code>decisions</code> argument specifies the list of decisions made while
  /// processing the task.
  ///
  /// A <code>DecisionTaskCompleted</code> event is added to the workflow
  /// history. The <code>executionContext</code> specified is attached to the
  /// event in the workflow execution history.
  ///
  /// <b>Access Control</b>
  ///
  /// If an IAM policy grants permission to use
  /// <code>RespondDecisionTaskCompleted</code>, it can express permissions for
  /// the list of decisions in the <code>decisions</code> parameter. Each of the
  /// decisions has one or more parameters, much like a regular API call. To
  /// allow for policies to be as readable as possible, you can express
  /// permissions on decisions as if they were actual API calls, including
  /// applying conditions to some parameters. For more information, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  ///
  /// May throw [UnknownResourceFault].
  /// May throw [OperationNotPermittedFault].
  ///
  /// Parameter [taskToken] :
  /// The <code>taskToken</code> from the <a>DecisionTask</a>.
  /// <important>
  /// <code>taskToken</code> is generated by the service and should be treated
  /// as an opaque value. If the task is passed to another process, its
  /// <code>taskToken</code> must also be passed. This enables it to provide its
  /// progress and respond with results.
  /// </important>
  ///
  /// Parameter [decisions] :
  /// The list of decisions (possibly empty) made by the decider while
  /// processing this decision task. See the docs for the <a>Decision</a>
  /// structure for details.
  ///
  /// Parameter [executionContext] :
  /// User defined context to add to workflow execution.
  ///
  /// Parameter [taskList] :
  /// The task list to use for the future decision tasks of this workflow
  /// execution. This list overrides the original task list you specified while
  /// starting the workflow execution.
  ///
  /// Parameter [taskListScheduleToStartTimeout] :
  /// Specifies a timeout (in seconds) for the task list override. When this
  /// parameter is missing, the task list override is permanent. This parameter
  /// makes it possible to temporarily override the task list. If a decision
  /// task scheduled on the override task list is not started within the
  /// timeout, the decision task will time out. Amazon SWF will revert the
  /// override and schedule a new decision task to the original task list.
  ///
  /// If a decision task scheduled on the override task list is started within
  /// the timeout, but not completed within the start-to-close timeout, Amazon
  /// SWF will also revert the override and schedule a new decision task to the
  /// original task list.
  Future<void> respondDecisionTaskCompleted({
    required String taskToken,
    List<Decision>? decisions,
    String? executionContext,
    TaskList? taskList,
    String? taskListScheduleToStartTimeout,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.RespondDecisionTaskCompleted'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'taskToken': taskToken,
        if (decisions != null) 'decisions': decisions,
        if (executionContext != null) 'executionContext': executionContext,
        if (taskList != null) 'taskList': taskList,
        if (taskListScheduleToStartTimeout != null)
          'taskListScheduleToStartTimeout': taskListScheduleToStartTimeout,
      },
    );
  }

  /// Records a <code>WorkflowExecutionSignaled</code> event in the workflow
  /// execution history and creates a decision task for the workflow execution
  /// identified by the given domain, workflowId and runId. The event is
  /// recorded with the specified user defined signalName and input (if
  /// provided).
  /// <note>
  /// If a runId isn't specified, then the
  /// <code>WorkflowExecutionSignaled</code> event is recorded in the history of
  /// the current open workflow with the matching workflowId in the domain.
  /// </note> <note>
  /// If the specified workflow execution isn't open, this method fails with
  /// <code>UnknownResource</code>.
  /// </note>
  /// <b>Access Control</b>
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// <ul>
  /// <li>
  /// Use a <code>Resource</code> element with the domain name to limit the
  /// action to only specified domains.
  /// </li>
  /// <li>
  /// Use an <code>Action</code> element to allow or deny permission to call
  /// this action.
  /// </li>
  /// <li>
  /// You cannot use an IAM policy to constrain this action's parameters.
  /// </li>
  /// </ul>
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's <code>cause</code> parameter is
  /// set to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  ///
  /// May throw [UnknownResourceFault].
  /// May throw [OperationNotPermittedFault].
  ///
  /// Parameter [domain] :
  /// The name of the domain containing the workflow execution to signal.
  ///
  /// Parameter [signalName] :
  /// The name of the signal. This name must be meaningful to the target
  /// workflow.
  ///
  /// Parameter [workflowId] :
  /// The workflowId of the workflow execution to signal.
  ///
  /// Parameter [input] :
  /// Data to attach to the <code>WorkflowExecutionSignaled</code> event in the
  /// target workflow execution's history.
  ///
  /// Parameter [runId] :
  /// The runId of the workflow execution to signal.
  Future<void> signalWorkflowExecution({
    required String domain,
    required String signalName,
    required String workflowId,
    String? input,
    String? runId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.SignalWorkflowExecution'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'domain': domain,
        'signalName': signalName,
        'workflowId': workflowId,
        if (input != null) 'input': input,
        if (runId != null) 'runId': runId,
      },
    );
  }

  /// Starts an execution of the workflow type in the specified domain using the
  /// provided <code>workflowId</code> and input data.
  ///
  /// This action returns the newly started workflow execution.
  ///
  /// <b>Access Control</b>
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// <ul>
  /// <li>
  /// Use a <code>Resource</code> element with the domain name to limit the
  /// action to only specified domains.
  /// </li>
  /// <li>
  /// Use an <code>Action</code> element to allow or deny permission to call
  /// this action.
  /// </li>
  /// <li>
  /// Constrain the following parameters by using a <code>Condition</code>
  /// element with the appropriate keys.
  ///
  /// <ul>
  /// <li>
  /// <code>tagList.member.0</code>: The key is
  /// <code>swf:tagList.member.0</code>.
  /// </li>
  /// <li>
  /// <code>tagList.member.1</code>: The key is
  /// <code>swf:tagList.member.1</code>.
  /// </li>
  /// <li>
  /// <code>tagList.member.2</code>: The key is
  /// <code>swf:tagList.member.2</code>.
  /// </li>
  /// <li>
  /// <code>tagList.member.3</code>: The key is
  /// <code>swf:tagList.member.3</code>.
  /// </li>
  /// <li>
  /// <code>tagList.member.4</code>: The key is
  /// <code>swf:tagList.member.4</code>.
  /// </li>
  /// <li>
  /// <code>taskList</code>: String constraint. The key is
  /// <code>swf:taskList.name</code>.
  /// </li>
  /// <li>
  /// <code>workflowType.name</code>: String constraint. The key is
  /// <code>swf:workflowType.name</code>.
  /// </li>
  /// <li>
  /// <code>workflowType.version</code>: String constraint. The key is
  /// <code>swf:workflowType.version</code>.
  /// </li>
  /// </ul> </li>
  /// </ul>
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's <code>cause</code> parameter is
  /// set to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  ///
  /// May throw [UnknownResourceFault].
  /// May throw [TypeDeprecatedFault].
  /// May throw [WorkflowExecutionAlreadyStartedFault].
  /// May throw [LimitExceededFault].
  /// May throw [OperationNotPermittedFault].
  /// May throw [DefaultUndefinedFault].
  ///
  /// Parameter [domain] :
  /// The name of the domain in which the workflow execution is created.
  ///
  /// The specified string must not contain a <code>:</code> (colon),
  /// <code>/</code> (slash), <code>|</code> (vertical bar), or any control
  /// characters (<code>\u0000-\u001f</code> | <code>\u007f-\u009f</code>).
  /// Also, it must <i>not</i> be the literal string <code>arn</code>.
  ///
  /// Parameter [workflowId] :
  /// The user defined identifier associated with the workflow execution. You
  /// can use this to associate a custom identifier with the workflow execution.
  /// You may specify the same identifier if a workflow execution is logically a
  /// <i>restart</i> of a previous execution. You cannot have two open workflow
  /// executions with the same <code>workflowId</code> at the same time within
  /// the same domain.
  ///
  /// The specified string must not contain a <code>:</code> (colon),
  /// <code>/</code> (slash), <code>|</code> (vertical bar), or any control
  /// characters (<code>\u0000-\u001f</code> | <code>\u007f-\u009f</code>).
  /// Also, it must <i>not</i> be the literal string <code>arn</code>.
  ///
  /// Parameter [workflowType] :
  /// The type of the workflow to start.
  ///
  /// Parameter [childPolicy] :
  /// If set, specifies the policy to use for the child workflow executions of
  /// this workflow execution if it is terminated, by calling the
  /// <a>TerminateWorkflowExecution</a> action explicitly or due to an expired
  /// timeout. This policy overrides the default child policy specified when
  /// registering the workflow type using <a>RegisterWorkflowType</a>.
  ///
  /// The supported child policies are:
  ///
  /// <ul>
  /// <li>
  /// <code>TERMINATE</code> – The child executions are terminated.
  /// </li>
  /// <li>
  /// <code>REQUEST_CANCEL</code> – A request to cancel is attempted for each
  /// child execution by recording a
  /// <code>WorkflowExecutionCancelRequested</code> event in its history. It is
  /// up to the decider to take appropriate actions when it receives an
  /// execution history with this event.
  /// </li>
  /// <li>
  /// <code>ABANDON</code> – No action is taken. The child executions continue
  /// to run.
  /// </li>
  /// </ul> <note>
  /// A child policy for this workflow execution must be specified either as a
  /// default for the workflow type or through this parameter. If neither this
  /// parameter is set nor a default child policy was specified at registration
  /// time then a fault is returned.
  /// </note>
  ///
  /// Parameter [executionStartToCloseTimeout] :
  /// The total duration for this workflow execution. This overrides the
  /// defaultExecutionStartToCloseTimeout specified when registering the
  /// workflow type.
  ///
  /// The duration is specified in seconds; an integer greater than or equal to
  /// <code>0</code>. Exceeding this limit causes the workflow execution to time
  /// out. Unlike some of the other timeout parameters in Amazon SWF, you cannot
  /// specify a value of "NONE" for this timeout; there is a one-year max limit
  /// on the time that a workflow execution can run.
  /// <note>
  /// An execution start-to-close timeout must be specified either through this
  /// parameter or as a default when the workflow type is registered. If neither
  /// this parameter nor a default execution start-to-close timeout is
  /// specified, a fault is returned.
  /// </note>
  ///
  /// Parameter [input] :
  /// The input for the workflow execution. This is a free form string which
  /// should be meaningful to the workflow you are starting. This
  /// <code>input</code> is made available to the new workflow execution in the
  /// <code>WorkflowExecutionStarted</code> history event.
  ///
  /// Parameter [lambdaRole] :
  /// The IAM role to attach to this workflow execution.
  /// <note>
  /// Executions of this workflow type need IAM roles to invoke Lambda
  /// functions. If you don't attach an IAM role, any attempt to schedule a
  /// Lambda task fails. This results in a
  /// <code>ScheduleLambdaFunctionFailed</code> history event. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/lambda-task.html">https://docs.aws.amazon.com/amazonswf/latest/developerguide/lambda-task.html</a>
  /// in the <i>Amazon SWF Developer Guide</i>.
  /// </note>
  ///
  /// Parameter [tagList] :
  /// The list of tags to associate with the workflow execution. You can specify
  /// a maximum of 5 tags. You can list workflow executions with a specific tag
  /// by calling <a>ListOpenWorkflowExecutions</a> or
  /// <a>ListClosedWorkflowExecutions</a> and specifying a <a>TagFilter</a>.
  ///
  /// Parameter [taskList] :
  /// The task list to use for the decision tasks generated for this workflow
  /// execution. This overrides the <code>defaultTaskList</code> specified when
  /// registering the workflow type.
  /// <note>
  /// A task list for this workflow execution must be specified either as a
  /// default for the workflow type or through this parameter. If neither this
  /// parameter is set nor a default task list was specified at registration
  /// time then a fault is returned.
  /// </note>
  /// The specified string must not contain a <code>:</code> (colon),
  /// <code>/</code> (slash), <code>|</code> (vertical bar), or any control
  /// characters (<code>\u0000-\u001f</code> | <code>\u007f-\u009f</code>).
  /// Also, it must <i>not</i> be the literal string <code>arn</code>.
  ///
  /// Parameter [taskPriority] :
  /// The task priority to use for this workflow execution. This overrides any
  /// default priority that was assigned when the workflow type was registered.
  /// If not set, then the default task priority for the workflow type is used.
  /// Valid values are integers that range from Java's
  /// <code>Integer.MIN_VALUE</code> (-2147483648) to
  /// <code>Integer.MAX_VALUE</code> (2147483647). Higher numbers indicate
  /// higher priority.
  ///
  /// For more information about setting task priority, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/programming-priority.html">Setting
  /// Task Priority</a> in the <i>Amazon SWF Developer Guide</i>.
  ///
  /// Parameter [taskStartToCloseTimeout] :
  /// Specifies the maximum duration of decision tasks for this workflow
  /// execution. This parameter overrides the
  /// <code>defaultTaskStartToCloseTimout</code> specified when registering the
  /// workflow type using <a>RegisterWorkflowType</a>.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// <code>0</code>. You can use <code>NONE</code> to specify unlimited
  /// duration.
  /// <note>
  /// A task start-to-close timeout for this workflow execution must be
  /// specified either as a default for the workflow type or through this
  /// parameter. If neither this parameter is set nor a default task
  /// start-to-close timeout was specified at registration time then a fault is
  /// returned.
  /// </note>
  Future<Run> startWorkflowExecution({
    required String domain,
    required String workflowId,
    required WorkflowType workflowType,
    ChildPolicy? childPolicy,
    String? executionStartToCloseTimeout,
    String? input,
    String? lambdaRole,
    List<String>? tagList,
    TaskList? taskList,
    String? taskPriority,
    String? taskStartToCloseTimeout,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.StartWorkflowExecution'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'domain': domain,
        'workflowId': workflowId,
        'workflowType': workflowType,
        if (childPolicy != null) 'childPolicy': childPolicy.toValue(),
        if (executionStartToCloseTimeout != null)
          'executionStartToCloseTimeout': executionStartToCloseTimeout,
        if (input != null) 'input': input,
        if (lambdaRole != null) 'lambdaRole': lambdaRole,
        if (tagList != null) 'tagList': tagList,
        if (taskList != null) 'taskList': taskList,
        if (taskPriority != null) 'taskPriority': taskPriority,
        if (taskStartToCloseTimeout != null)
          'taskStartToCloseTimeout': taskStartToCloseTimeout,
      },
    );

    return Run.fromJson(jsonResponse.body);
  }

  /// Add a tag to a Amazon SWF domain.
  /// <note>
  /// Amazon SWF supports a maximum of 50 tags per resource.
  /// </note>
  ///
  /// May throw [UnknownResourceFault].
  /// May throw [TooManyTagsFault].
  /// May throw [LimitExceededFault].
  /// May throw [OperationNotPermittedFault].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) for the Amazon SWF domain.
  ///
  /// Parameter [tags] :
  /// The list of tags to add to a domain.
  ///
  /// Tags may only contain unicode letters, digits, whitespace, or these
  /// symbols: <code>_ . : / = + - @</code>.
  Future<void> tagResource({
    required String resourceArn,
    required List<ResourceTag> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.TagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceArn': resourceArn,
        'tags': tags,
      },
    );
  }

  /// Records a <code>WorkflowExecutionTerminated</code> event and forces
  /// closure of the workflow execution identified by the given domain, runId,
  /// and workflowId. The child policy, registered with the workflow type or
  /// specified when starting this execution, is applied to any open child
  /// workflow executions of this workflow execution.
  /// <important>
  /// If the identified workflow execution was in progress, it is terminated
  /// immediately.
  /// </important> <note>
  /// If a runId isn't specified, then the
  /// <code>WorkflowExecutionTerminated</code> event is recorded in the history
  /// of the current open workflow with the matching workflowId in the domain.
  /// </note> <note>
  /// You should consider using <a>RequestCancelWorkflowExecution</a> action
  /// instead because it allows the workflow to gracefully close while
  /// <a>TerminateWorkflowExecution</a> doesn't.
  /// </note>
  /// <b>Access Control</b>
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// <ul>
  /// <li>
  /// Use a <code>Resource</code> element with the domain name to limit the
  /// action to only specified domains.
  /// </li>
  /// <li>
  /// Use an <code>Action</code> element to allow or deny permission to call
  /// this action.
  /// </li>
  /// <li>
  /// You cannot use an IAM policy to constrain this action's parameters.
  /// </li>
  /// </ul>
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's <code>cause</code> parameter is
  /// set to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  ///
  /// May throw [UnknownResourceFault].
  /// May throw [OperationNotPermittedFault].
  ///
  /// Parameter [domain] :
  /// The domain of the workflow execution to terminate.
  ///
  /// Parameter [workflowId] :
  /// The workflowId of the workflow execution to terminate.
  ///
  /// Parameter [childPolicy] :
  /// If set, specifies the policy to use for the child workflow executions of
  /// the workflow execution being terminated. This policy overrides the child
  /// policy specified for the workflow execution at registration time or when
  /// starting the execution.
  ///
  /// The supported child policies are:
  ///
  /// <ul>
  /// <li>
  /// <code>TERMINATE</code> – The child executions are terminated.
  /// </li>
  /// <li>
  /// <code>REQUEST_CANCEL</code> – A request to cancel is attempted for each
  /// child execution by recording a
  /// <code>WorkflowExecutionCancelRequested</code> event in its history. It is
  /// up to the decider to take appropriate actions when it receives an
  /// execution history with this event.
  /// </li>
  /// <li>
  /// <code>ABANDON</code> – No action is taken. The child executions continue
  /// to run.
  /// </li>
  /// </ul> <note>
  /// A child policy for this workflow execution must be specified either as a
  /// default for the workflow type or through this parameter. If neither this
  /// parameter is set nor a default child policy was specified at registration
  /// time then a fault is returned.
  /// </note>
  ///
  /// Parameter [details] :
  /// Details for terminating the workflow execution.
  ///
  /// Parameter [reason] :
  /// A descriptive reason for terminating the workflow execution.
  ///
  /// Parameter [runId] :
  /// The runId of the workflow execution to terminate.
  Future<void> terminateWorkflowExecution({
    required String domain,
    required String workflowId,
    ChildPolicy? childPolicy,
    String? details,
    String? reason,
    String? runId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.TerminateWorkflowExecution'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'domain': domain,
        'workflowId': workflowId,
        if (childPolicy != null) 'childPolicy': childPolicy.toValue(),
        if (details != null) 'details': details,
        if (reason != null) 'reason': reason,
        if (runId != null) 'runId': runId,
      },
    );
  }

  /// Undeprecates a previously deprecated <i>activity type</i>. After an
  /// activity type has been undeprecated, you can create new tasks of that
  /// activity type.
  /// <note>
  /// This operation is eventually consistent. The results are best effort and
  /// may not exactly reflect recent updates and changes.
  /// </note>
  /// <b>Access Control</b>
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// <ul>
  /// <li>
  /// Use a <code>Resource</code> element with the domain name to limit the
  /// action to only specified domains.
  /// </li>
  /// <li>
  /// Use an <code>Action</code> element to allow or deny permission to call
  /// this action.
  /// </li>
  /// <li>
  /// Constrain the following parameters by using a <code>Condition</code>
  /// element with the appropriate keys.
  ///
  /// <ul>
  /// <li>
  /// <code>activityType.name</code>: String constraint. The key is
  /// <code>swf:activityType.name</code>.
  /// </li>
  /// <li>
  /// <code>activityType.version</code>: String constraint. The key is
  /// <code>swf:activityType.version</code>.
  /// </li>
  /// </ul> </li>
  /// </ul>
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's <code>cause</code> parameter is
  /// set to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  ///
  /// May throw [UnknownResourceFault].
  /// May throw [TypeAlreadyExistsFault].
  /// May throw [OperationNotPermittedFault].
  ///
  /// Parameter [activityType] :
  /// The activity type to undeprecate.
  ///
  /// Parameter [domain] :
  /// The name of the domain of the deprecated activity type.
  Future<void> undeprecateActivityType({
    required ActivityType activityType,
    required String domain,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.UndeprecateActivityType'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'activityType': activityType,
        'domain': domain,
      },
    );
  }

  /// Undeprecates a previously deprecated domain. After a domain has been
  /// undeprecated it can be used to create new workflow executions or register
  /// new types.
  /// <note>
  /// This operation is eventually consistent. The results are best effort and
  /// may not exactly reflect recent updates and changes.
  /// </note>
  /// <b>Access Control</b>
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// <ul>
  /// <li>
  /// Use a <code>Resource</code> element with the domain name to limit the
  /// action to only specified domains.
  /// </li>
  /// <li>
  /// Use an <code>Action</code> element to allow or deny permission to call
  /// this action.
  /// </li>
  /// <li>
  /// You cannot use an IAM policy to constrain this action's parameters.
  /// </li>
  /// </ul>
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's <code>cause</code> parameter is
  /// set to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  ///
  /// May throw [UnknownResourceFault].
  /// May throw [DomainAlreadyExistsFault].
  /// May throw [OperationNotPermittedFault].
  ///
  /// Parameter [name] :
  /// The name of the domain of the deprecated workflow type.
  Future<void> undeprecateDomain({
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.UndeprecateDomain'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
      },
    );
  }

  /// Undeprecates a previously deprecated <i>workflow type</i>. After a
  /// workflow type has been undeprecated, you can create new executions of that
  /// type.
  /// <note>
  /// This operation is eventually consistent. The results are best effort and
  /// may not exactly reflect recent updates and changes.
  /// </note>
  /// <b>Access Control</b>
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// <ul>
  /// <li>
  /// Use a <code>Resource</code> element with the domain name to limit the
  /// action to only specified domains.
  /// </li>
  /// <li>
  /// Use an <code>Action</code> element to allow or deny permission to call
  /// this action.
  /// </li>
  /// <li>
  /// Constrain the following parameters by using a <code>Condition</code>
  /// element with the appropriate keys.
  ///
  /// <ul>
  /// <li>
  /// <code>workflowType.name</code>: String constraint. The key is
  /// <code>swf:workflowType.name</code>.
  /// </li>
  /// <li>
  /// <code>workflowType.version</code>: String constraint. The key is
  /// <code>swf:workflowType.version</code>.
  /// </li>
  /// </ul> </li>
  /// </ul>
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's <code>cause</code> parameter is
  /// set to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  ///
  /// May throw [UnknownResourceFault].
  /// May throw [TypeAlreadyExistsFault].
  /// May throw [OperationNotPermittedFault].
  ///
  /// Parameter [domain] :
  /// The name of the domain of the deprecated workflow type.
  ///
  /// Parameter [workflowType] :
  /// The name of the domain of the deprecated workflow type.
  Future<void> undeprecateWorkflowType({
    required String domain,
    required WorkflowType workflowType,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.UndeprecateWorkflowType'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'domain': domain,
        'workflowType': workflowType,
      },
    );
  }

  /// Remove a tag from a Amazon SWF domain.
  ///
  /// May throw [UnknownResourceFault].
  /// May throw [LimitExceededFault].
  /// May throw [OperationNotPermittedFault].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) for the Amazon SWF domain.
  ///
  /// Parameter [tagKeys] :
  /// The list of tags to remove from the Amazon SWF domain.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'SimpleWorkflowService.UntagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceArn': resourceArn,
        'tagKeys': tagKeys,
      },
    );
  }
}

/// Unit of work sent to an activity worker.
class ActivityTask {
  /// The unique ID of the task.
  final String activityId;

  /// The type of this activity task.
  final ActivityType activityType;

  /// The ID of the <code>ActivityTaskStarted</code> event recorded in the
  /// history.
  final int startedEventId;

  /// The opaque string used as a handle on the task. This token is used by
  /// workers to communicate progress and response information back to the system
  /// about the task.
  final String taskToken;

  /// The workflow execution that started this activity task.
  final WorkflowExecution workflowExecution;

  /// The inputs provided when the activity task was scheduled. The form of the
  /// input is user defined and should be meaningful to the activity
  /// implementation.
  final String? input;

  ActivityTask({
    required this.activityId,
    required this.activityType,
    required this.startedEventId,
    required this.taskToken,
    required this.workflowExecution,
    this.input,
  });

  factory ActivityTask.fromJson(Map<String, dynamic> json) {
    return ActivityTask(
      activityId: json['activityId'] as String,
      activityType:
          ActivityType.fromJson(json['activityType'] as Map<String, dynamic>),
      startedEventId: json['startedEventId'] as int,
      taskToken: json['taskToken'] as String,
      workflowExecution: WorkflowExecution.fromJson(
          json['workflowExecution'] as Map<String, dynamic>),
      input: json['input'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final activityId = this.activityId;
    final activityType = this.activityType;
    final startedEventId = this.startedEventId;
    final taskToken = this.taskToken;
    final workflowExecution = this.workflowExecution;
    final input = this.input;
    return {
      'activityId': activityId,
      'activityType': activityType,
      'startedEventId': startedEventId,
      'taskToken': taskToken,
      'workflowExecution': workflowExecution,
      if (input != null) 'input': input,
    };
  }
}

/// Provides the details of the <code>ActivityTaskCancelRequested</code> event.
class ActivityTaskCancelRequestedEventAttributes {
  /// The unique ID of the task.
  final String activityId;

  /// The ID of the <code>DecisionTaskCompleted</code> event corresponding to the
  /// decision task that resulted in the <code>RequestCancelActivityTask</code>
  /// decision for this cancellation request. This information can be useful for
  /// diagnosing problems by tracing back the chain of events leading up to this
  /// event.
  final int decisionTaskCompletedEventId;

  ActivityTaskCancelRequestedEventAttributes({
    required this.activityId,
    required this.decisionTaskCompletedEventId,
  });

  factory ActivityTaskCancelRequestedEventAttributes.fromJson(
      Map<String, dynamic> json) {
    return ActivityTaskCancelRequestedEventAttributes(
      activityId: json['activityId'] as String,
      decisionTaskCompletedEventId: json['decisionTaskCompletedEventId'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final activityId = this.activityId;
    final decisionTaskCompletedEventId = this.decisionTaskCompletedEventId;
    return {
      'activityId': activityId,
      'decisionTaskCompletedEventId': decisionTaskCompletedEventId,
    };
  }
}

/// Provides the details of the <code>ActivityTaskCanceled</code> event.
class ActivityTaskCanceledEventAttributes {
  /// The ID of the <code>ActivityTaskScheduled</code> event that was recorded
  /// when this activity task was scheduled. This information can be useful for
  /// diagnosing problems by tracing back the chain of events leading up to this
  /// event.
  final int scheduledEventId;

  /// The ID of the <code>ActivityTaskStarted</code> event recorded when this
  /// activity task was started. This information can be useful for diagnosing
  /// problems by tracing back the chain of events leading up to this event.
  final int startedEventId;

  /// Details of the cancellation.
  final String? details;

  /// If set, contains the ID of the last <code>ActivityTaskCancelRequested</code>
  /// event recorded for this activity task. This information can be useful for
  /// diagnosing problems by tracing back the chain of events leading up to this
  /// event.
  final int? latestCancelRequestedEventId;

  ActivityTaskCanceledEventAttributes({
    required this.scheduledEventId,
    required this.startedEventId,
    this.details,
    this.latestCancelRequestedEventId,
  });

  factory ActivityTaskCanceledEventAttributes.fromJson(
      Map<String, dynamic> json) {
    return ActivityTaskCanceledEventAttributes(
      scheduledEventId: json['scheduledEventId'] as int,
      startedEventId: json['startedEventId'] as int,
      details: json['details'] as String?,
      latestCancelRequestedEventId:
          json['latestCancelRequestedEventId'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final scheduledEventId = this.scheduledEventId;
    final startedEventId = this.startedEventId;
    final details = this.details;
    final latestCancelRequestedEventId = this.latestCancelRequestedEventId;
    return {
      'scheduledEventId': scheduledEventId,
      'startedEventId': startedEventId,
      if (details != null) 'details': details,
      if (latestCancelRequestedEventId != null)
        'latestCancelRequestedEventId': latestCancelRequestedEventId,
    };
  }
}

/// Provides the details of the <code>ActivityTaskCompleted</code> event.
class ActivityTaskCompletedEventAttributes {
  /// The ID of the <code>ActivityTaskScheduled</code> event that was recorded
  /// when this activity task was scheduled. This information can be useful for
  /// diagnosing problems by tracing back the chain of events leading up to this
  /// event.
  final int scheduledEventId;

  /// The ID of the <code>ActivityTaskStarted</code> event recorded when this
  /// activity task was started. This information can be useful for diagnosing
  /// problems by tracing back the chain of events leading up to this event.
  final int startedEventId;

  /// The results of the activity task.
  final String? result;

  ActivityTaskCompletedEventAttributes({
    required this.scheduledEventId,
    required this.startedEventId,
    this.result,
  });

  factory ActivityTaskCompletedEventAttributes.fromJson(
      Map<String, dynamic> json) {
    return ActivityTaskCompletedEventAttributes(
      scheduledEventId: json['scheduledEventId'] as int,
      startedEventId: json['startedEventId'] as int,
      result: json['result'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final scheduledEventId = this.scheduledEventId;
    final startedEventId = this.startedEventId;
    final result = this.result;
    return {
      'scheduledEventId': scheduledEventId,
      'startedEventId': startedEventId,
      if (result != null) 'result': result,
    };
  }
}

/// Provides the details of the <code>ActivityTaskFailed</code> event.
class ActivityTaskFailedEventAttributes {
  /// The ID of the <code>ActivityTaskScheduled</code> event that was recorded
  /// when this activity task was scheduled. This information can be useful for
  /// diagnosing problems by tracing back the chain of events leading up to this
  /// event.
  final int scheduledEventId;

  /// The ID of the <code>ActivityTaskStarted</code> event recorded when this
  /// activity task was started. This information can be useful for diagnosing
  /// problems by tracing back the chain of events leading up to this event.
  final int startedEventId;

  /// The details of the failure.
  final String? details;

  /// The reason provided for the failure.
  final String? reason;

  ActivityTaskFailedEventAttributes({
    required this.scheduledEventId,
    required this.startedEventId,
    this.details,
    this.reason,
  });

  factory ActivityTaskFailedEventAttributes.fromJson(
      Map<String, dynamic> json) {
    return ActivityTaskFailedEventAttributes(
      scheduledEventId: json['scheduledEventId'] as int,
      startedEventId: json['startedEventId'] as int,
      details: json['details'] as String?,
      reason: json['reason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final scheduledEventId = this.scheduledEventId;
    final startedEventId = this.startedEventId;
    final details = this.details;
    final reason = this.reason;
    return {
      'scheduledEventId': scheduledEventId,
      'startedEventId': startedEventId,
      if (details != null) 'details': details,
      if (reason != null) 'reason': reason,
    };
  }
}

/// Provides the details of the <code>ActivityTaskScheduled</code> event.
class ActivityTaskScheduledEventAttributes {
  /// The unique ID of the activity task.
  final String activityId;

  /// The type of the activity task.
  final ActivityType activityType;

  /// The ID of the <code>DecisionTaskCompleted</code> event corresponding to the
  /// decision that resulted in the scheduling of this activity task. This
  /// information can be useful for diagnosing problems by tracing back the chain
  /// of events leading up to this event.
  final int decisionTaskCompletedEventId;

  /// The task list in which the activity task has been scheduled.
  final TaskList taskList;

  /// Data attached to the event that can be used by the decider in subsequent
  /// workflow tasks. This data isn't sent to the activity.
  final String? control;

  /// The maximum time before which the worker processing this task must report
  /// progress by calling <a>RecordActivityTaskHeartbeat</a>. If the timeout is
  /// exceeded, the activity task is automatically timed out. If the worker
  /// subsequently attempts to record a heartbeat or return a result, it is
  /// ignored.
  final String? heartbeatTimeout;

  /// The input provided to the activity task.
  final String? input;

  /// The maximum amount of time for this activity task.
  final String? scheduleToCloseTimeout;

  /// The maximum amount of time the activity task can wait to be assigned to a
  /// worker.
  final String? scheduleToStartTimeout;

  /// The maximum amount of time a worker may take to process the activity task.
  final String? startToCloseTimeout;

  /// The priority to assign to the scheduled activity task. If set, this
  /// overrides any default priority value that was assigned when the activity
  /// type was registered.
  ///
  /// Valid values are integers that range from Java's
  /// <code>Integer.MIN_VALUE</code> (-2147483648) to
  /// <code>Integer.MAX_VALUE</code> (2147483647). Higher numbers indicate higher
  /// priority.
  ///
  /// For more information about setting task priority, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/programming-priority.html">Setting
  /// Task Priority</a> in the <i>Amazon SWF Developer Guide</i>.
  final String? taskPriority;

  ActivityTaskScheduledEventAttributes({
    required this.activityId,
    required this.activityType,
    required this.decisionTaskCompletedEventId,
    required this.taskList,
    this.control,
    this.heartbeatTimeout,
    this.input,
    this.scheduleToCloseTimeout,
    this.scheduleToStartTimeout,
    this.startToCloseTimeout,
    this.taskPriority,
  });

  factory ActivityTaskScheduledEventAttributes.fromJson(
      Map<String, dynamic> json) {
    return ActivityTaskScheduledEventAttributes(
      activityId: json['activityId'] as String,
      activityType:
          ActivityType.fromJson(json['activityType'] as Map<String, dynamic>),
      decisionTaskCompletedEventId: json['decisionTaskCompletedEventId'] as int,
      taskList: TaskList.fromJson(json['taskList'] as Map<String, dynamic>),
      control: json['control'] as String?,
      heartbeatTimeout: json['heartbeatTimeout'] as String?,
      input: json['input'] as String?,
      scheduleToCloseTimeout: json['scheduleToCloseTimeout'] as String?,
      scheduleToStartTimeout: json['scheduleToStartTimeout'] as String?,
      startToCloseTimeout: json['startToCloseTimeout'] as String?,
      taskPriority: json['taskPriority'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final activityId = this.activityId;
    final activityType = this.activityType;
    final decisionTaskCompletedEventId = this.decisionTaskCompletedEventId;
    final taskList = this.taskList;
    final control = this.control;
    final heartbeatTimeout = this.heartbeatTimeout;
    final input = this.input;
    final scheduleToCloseTimeout = this.scheduleToCloseTimeout;
    final scheduleToStartTimeout = this.scheduleToStartTimeout;
    final startToCloseTimeout = this.startToCloseTimeout;
    final taskPriority = this.taskPriority;
    return {
      'activityId': activityId,
      'activityType': activityType,
      'decisionTaskCompletedEventId': decisionTaskCompletedEventId,
      'taskList': taskList,
      if (control != null) 'control': control,
      if (heartbeatTimeout != null) 'heartbeatTimeout': heartbeatTimeout,
      if (input != null) 'input': input,
      if (scheduleToCloseTimeout != null)
        'scheduleToCloseTimeout': scheduleToCloseTimeout,
      if (scheduleToStartTimeout != null)
        'scheduleToStartTimeout': scheduleToStartTimeout,
      if (startToCloseTimeout != null)
        'startToCloseTimeout': startToCloseTimeout,
      if (taskPriority != null) 'taskPriority': taskPriority,
    };
  }
}

/// Provides the details of the <code>ActivityTaskStarted</code> event.
class ActivityTaskStartedEventAttributes {
  /// The ID of the <code>ActivityTaskScheduled</code> event that was recorded
  /// when this activity task was scheduled. This information can be useful for
  /// diagnosing problems by tracing back the chain of events leading up to this
  /// event.
  final int scheduledEventId;

  /// Identity of the worker that was assigned this task. This aids diagnostics
  /// when problems arise. The form of this identity is user defined.
  final String? identity;

  ActivityTaskStartedEventAttributes({
    required this.scheduledEventId,
    this.identity,
  });

  factory ActivityTaskStartedEventAttributes.fromJson(
      Map<String, dynamic> json) {
    return ActivityTaskStartedEventAttributes(
      scheduledEventId: json['scheduledEventId'] as int,
      identity: json['identity'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final scheduledEventId = this.scheduledEventId;
    final identity = this.identity;
    return {
      'scheduledEventId': scheduledEventId,
      if (identity != null) 'identity': identity,
    };
  }
}

/// Status information about an activity task.
class ActivityTaskStatus {
  /// Set to <code>true</code> if cancellation of the task is requested.
  final bool cancelRequested;

  ActivityTaskStatus({
    required this.cancelRequested,
  });

  factory ActivityTaskStatus.fromJson(Map<String, dynamic> json) {
    return ActivityTaskStatus(
      cancelRequested: json['cancelRequested'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    final cancelRequested = this.cancelRequested;
    return {
      'cancelRequested': cancelRequested,
    };
  }
}

/// Provides the details of the <code>ActivityTaskTimedOut</code> event.
class ActivityTaskTimedOutEventAttributes {
  /// The ID of the <code>ActivityTaskScheduled</code> event that was recorded
  /// when this activity task was scheduled. This information can be useful for
  /// diagnosing problems by tracing back the chain of events leading up to this
  /// event.
  final int scheduledEventId;

  /// The ID of the <code>ActivityTaskStarted</code> event recorded when this
  /// activity task was started. This information can be useful for diagnosing
  /// problems by tracing back the chain of events leading up to this event.
  final int startedEventId;

  /// The type of the timeout that caused this event.
  final ActivityTaskTimeoutType timeoutType;

  /// Contains the content of the <code>details</code> parameter for the last call
  /// made by the activity to <code>RecordActivityTaskHeartbeat</code>.
  final String? details;

  ActivityTaskTimedOutEventAttributes({
    required this.scheduledEventId,
    required this.startedEventId,
    required this.timeoutType,
    this.details,
  });

  factory ActivityTaskTimedOutEventAttributes.fromJson(
      Map<String, dynamic> json) {
    return ActivityTaskTimedOutEventAttributes(
      scheduledEventId: json['scheduledEventId'] as int,
      startedEventId: json['startedEventId'] as int,
      timeoutType: (json['timeoutType'] as String).toActivityTaskTimeoutType(),
      details: json['details'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final scheduledEventId = this.scheduledEventId;
    final startedEventId = this.startedEventId;
    final timeoutType = this.timeoutType;
    final details = this.details;
    return {
      'scheduledEventId': scheduledEventId,
      'startedEventId': startedEventId,
      'timeoutType': timeoutType.toValue(),
      if (details != null) 'details': details,
    };
  }
}

enum ActivityTaskTimeoutType {
  startToClose,
  scheduleToStart,
  scheduleToClose,
  heartbeat,
}

extension ActivityTaskTimeoutTypeValueExtension on ActivityTaskTimeoutType {
  String toValue() {
    switch (this) {
      case ActivityTaskTimeoutType.startToClose:
        return 'START_TO_CLOSE';
      case ActivityTaskTimeoutType.scheduleToStart:
        return 'SCHEDULE_TO_START';
      case ActivityTaskTimeoutType.scheduleToClose:
        return 'SCHEDULE_TO_CLOSE';
      case ActivityTaskTimeoutType.heartbeat:
        return 'HEARTBEAT';
    }
  }
}

extension ActivityTaskTimeoutTypeFromString on String {
  ActivityTaskTimeoutType toActivityTaskTimeoutType() {
    switch (this) {
      case 'START_TO_CLOSE':
        return ActivityTaskTimeoutType.startToClose;
      case 'SCHEDULE_TO_START':
        return ActivityTaskTimeoutType.scheduleToStart;
      case 'SCHEDULE_TO_CLOSE':
        return ActivityTaskTimeoutType.scheduleToClose;
      case 'HEARTBEAT':
        return ActivityTaskTimeoutType.heartbeat;
    }
    throw Exception('$this is not known in enum ActivityTaskTimeoutType');
  }
}

/// Represents an activity type.
class ActivityType {
  /// The name of this activity.
  /// <note>
  /// The combination of activity type name and version must be unique within a
  /// domain.
  /// </note>
  final String name;

  /// The version of this activity.
  /// <note>
  /// The combination of activity type name and version must be unique with in a
  /// domain.
  /// </note>
  final String version;

  ActivityType({
    required this.name,
    required this.version,
  });

  factory ActivityType.fromJson(Map<String, dynamic> json) {
    return ActivityType(
      name: json['name'] as String,
      version: json['version'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final version = this.version;
    return {
      'name': name,
      'version': version,
    };
  }
}

/// Configuration settings registered with the activity type.
class ActivityTypeConfiguration {
  /// The default maximum time, in seconds, before which a worker processing a
  /// task must report progress by calling <a>RecordActivityTaskHeartbeat</a>.
  ///
  /// You can specify this value only when <i>registering</i> an activity type.
  /// The registered default value can be overridden when you schedule a task
  /// through the <code>ScheduleActivityTask</code> <a>Decision</a>. If the
  /// activity worker subsequently attempts to record a heartbeat or returns a
  /// result, the activity worker receives an <code>UnknownResource</code> fault.
  /// In this case, Amazon SWF no longer considers the activity task to be valid;
  /// the activity worker should clean up the activity task.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// <code>0</code>. You can use <code>NONE</code> to specify unlimited duration.
  final String? defaultTaskHeartbeatTimeout;

  /// The default task list specified for this activity type at registration. This
  /// default is used if a task list isn't provided when a task is scheduled
  /// through the <code>ScheduleActivityTask</code> <a>Decision</a>. You can
  /// override the default registered task list when scheduling a task through the
  /// <code>ScheduleActivityTask</code> <a>Decision</a>.
  final TaskList? defaultTaskList;

  /// The default task priority for tasks of this activity type, specified at
  /// registration. If not set, then <code>0</code> is used as the default
  /// priority. This default can be overridden when scheduling an activity task.
  ///
  /// Valid values are integers that range from Java's
  /// <code>Integer.MIN_VALUE</code> (-2147483648) to
  /// <code>Integer.MAX_VALUE</code> (2147483647). Higher numbers indicate higher
  /// priority.
  ///
  /// For more information about setting task priority, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/programming-priority.html">Setting
  /// Task Priority</a> in the <i>Amazon SWF Developer Guide</i>.
  final String? defaultTaskPriority;

  /// The default maximum duration, specified when registering the activity type,
  /// for tasks of this activity type. You can override this default when
  /// scheduling a task through the <code>ScheduleActivityTask</code>
  /// <a>Decision</a>.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// <code>0</code>. You can use <code>NONE</code> to specify unlimited duration.
  final String? defaultTaskScheduleToCloseTimeout;

  /// The default maximum duration, specified when registering the activity type,
  /// that a task of an activity type can wait before being assigned to a worker.
  /// You can override this default when scheduling a task through the
  /// <code>ScheduleActivityTask</code> <a>Decision</a>.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// <code>0</code>. You can use <code>NONE</code> to specify unlimited duration.
  final String? defaultTaskScheduleToStartTimeout;

  /// The default maximum duration for tasks of an activity type specified when
  /// registering the activity type. You can override this default when scheduling
  /// a task through the <code>ScheduleActivityTask</code> <a>Decision</a>.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// <code>0</code>. You can use <code>NONE</code> to specify unlimited duration.
  final String? defaultTaskStartToCloseTimeout;

  ActivityTypeConfiguration({
    this.defaultTaskHeartbeatTimeout,
    this.defaultTaskList,
    this.defaultTaskPriority,
    this.defaultTaskScheduleToCloseTimeout,
    this.defaultTaskScheduleToStartTimeout,
    this.defaultTaskStartToCloseTimeout,
  });

  factory ActivityTypeConfiguration.fromJson(Map<String, dynamic> json) {
    return ActivityTypeConfiguration(
      defaultTaskHeartbeatTimeout:
          json['defaultTaskHeartbeatTimeout'] as String?,
      defaultTaskList: json['defaultTaskList'] != null
          ? TaskList.fromJson(json['defaultTaskList'] as Map<String, dynamic>)
          : null,
      defaultTaskPriority: json['defaultTaskPriority'] as String?,
      defaultTaskScheduleToCloseTimeout:
          json['defaultTaskScheduleToCloseTimeout'] as String?,
      defaultTaskScheduleToStartTimeout:
          json['defaultTaskScheduleToStartTimeout'] as String?,
      defaultTaskStartToCloseTimeout:
          json['defaultTaskStartToCloseTimeout'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final defaultTaskHeartbeatTimeout = this.defaultTaskHeartbeatTimeout;
    final defaultTaskList = this.defaultTaskList;
    final defaultTaskPriority = this.defaultTaskPriority;
    final defaultTaskScheduleToCloseTimeout =
        this.defaultTaskScheduleToCloseTimeout;
    final defaultTaskScheduleToStartTimeout =
        this.defaultTaskScheduleToStartTimeout;
    final defaultTaskStartToCloseTimeout = this.defaultTaskStartToCloseTimeout;
    return {
      if (defaultTaskHeartbeatTimeout != null)
        'defaultTaskHeartbeatTimeout': defaultTaskHeartbeatTimeout,
      if (defaultTaskList != null) 'defaultTaskList': defaultTaskList,
      if (defaultTaskPriority != null)
        'defaultTaskPriority': defaultTaskPriority,
      if (defaultTaskScheduleToCloseTimeout != null)
        'defaultTaskScheduleToCloseTimeout': defaultTaskScheduleToCloseTimeout,
      if (defaultTaskScheduleToStartTimeout != null)
        'defaultTaskScheduleToStartTimeout': defaultTaskScheduleToStartTimeout,
      if (defaultTaskStartToCloseTimeout != null)
        'defaultTaskStartToCloseTimeout': defaultTaskStartToCloseTimeout,
    };
  }
}

/// Detailed information about an activity type.
class ActivityTypeDetail {
  /// The configuration settings registered with the activity type.
  final ActivityTypeConfiguration configuration;

  /// General information about the activity type.
  ///
  /// The status of activity type (returned in the ActivityTypeInfo structure) can
  /// be one of the following.
  ///
  /// <ul>
  /// <li>
  /// <code>REGISTERED</code> – The type is registered and available. Workers
  /// supporting this type should be running.
  /// </li>
  /// <li>
  /// <code>DEPRECATED</code> – The type was deprecated using
  /// <a>DeprecateActivityType</a>, but is still in use. You should keep workers
  /// supporting this type running. You cannot create new tasks of this type.
  /// </li>
  /// </ul>
  final ActivityTypeInfo typeInfo;

  ActivityTypeDetail({
    required this.configuration,
    required this.typeInfo,
  });

  factory ActivityTypeDetail.fromJson(Map<String, dynamic> json) {
    return ActivityTypeDetail(
      configuration: ActivityTypeConfiguration.fromJson(
          json['configuration'] as Map<String, dynamic>),
      typeInfo:
          ActivityTypeInfo.fromJson(json['typeInfo'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    final typeInfo = this.typeInfo;
    return {
      'configuration': configuration,
      'typeInfo': typeInfo,
    };
  }
}

/// Detailed information about an activity type.
class ActivityTypeInfo {
  /// The <a>ActivityType</a> type structure representing the activity type.
  final ActivityType activityType;

  /// The date and time this activity type was created through
  /// <a>RegisterActivityType</a>.
  final DateTime creationDate;

  /// The current status of the activity type.
  final RegistrationStatus status;

  /// If DEPRECATED, the date and time <a>DeprecateActivityType</a> was called.
  final DateTime? deprecationDate;

  /// The description of the activity type provided in
  /// <a>RegisterActivityType</a>.
  final String? description;

  ActivityTypeInfo({
    required this.activityType,
    required this.creationDate,
    required this.status,
    this.deprecationDate,
    this.description,
  });

  factory ActivityTypeInfo.fromJson(Map<String, dynamic> json) {
    return ActivityTypeInfo(
      activityType:
          ActivityType.fromJson(json['activityType'] as Map<String, dynamic>),
      creationDate:
          nonNullableTimeStampFromJson(json['creationDate'] as Object),
      status: (json['status'] as String).toRegistrationStatus(),
      deprecationDate: timeStampFromJson(json['deprecationDate']),
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final activityType = this.activityType;
    final creationDate = this.creationDate;
    final status = this.status;
    final deprecationDate = this.deprecationDate;
    final description = this.description;
    return {
      'activityType': activityType,
      'creationDate': unixTimestampToJson(creationDate),
      'status': status.toValue(),
      if (deprecationDate != null)
        'deprecationDate': unixTimestampToJson(deprecationDate),
      if (description != null) 'description': description,
    };
  }
}

/// Contains a paginated list of activity type information structures.
class ActivityTypeInfos {
  /// List of activity type information.
  final List<ActivityTypeInfo> typeInfos;

  /// If a <code>NextPageToken</code> was returned by a previous call, there are
  /// more results available. To retrieve the next page of results, make the call
  /// again using the returned token in <code>nextPageToken</code>. Keep all other
  /// arguments unchanged.
  ///
  /// The configured <code>maximumPageSize</code> determines how many results can
  /// be returned in a single call.
  final String? nextPageToken;

  ActivityTypeInfos({
    required this.typeInfos,
    this.nextPageToken,
  });

  factory ActivityTypeInfos.fromJson(Map<String, dynamic> json) {
    return ActivityTypeInfos(
      typeInfos: (json['typeInfos'] as List)
          .whereNotNull()
          .map((e) => ActivityTypeInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPageToken: json['nextPageToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final typeInfos = this.typeInfos;
    final nextPageToken = this.nextPageToken;
    return {
      'typeInfos': typeInfos,
      if (nextPageToken != null) 'nextPageToken': nextPageToken,
    };
  }
}

/// Provides the details of the <code>CancelTimer</code> decision.
///
/// <b>Access Control</b>
///
/// You can use IAM policies to control this decision's access to Amazon SWF
/// resources as follows:
///
/// <ul>
/// <li>
/// Use a <code>Resource</code> element with the domain name to limit the action
/// to only specified domains.
/// </li>
/// <li>
/// Use an <code>Action</code> element to allow or deny permission to call this
/// action.
/// </li>
/// <li>
/// You cannot use an IAM policy to constrain this action's parameters.
/// </li>
/// </ul>
/// If the caller doesn't have sufficient permissions to invoke the action, or
/// the parameter values fall outside the specified constraints, the action
/// fails. The associated event attribute's <code>cause</code> parameter is set
/// to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
/// policies, see <a
/// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
/// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
/// Developer Guide</i>.
class CancelTimerDecisionAttributes {
  /// The unique ID of the timer to cancel.
  final String timerId;

  CancelTimerDecisionAttributes({
    required this.timerId,
  });

  Map<String, dynamic> toJson() {
    final timerId = this.timerId;
    return {
      'timerId': timerId,
    };
  }
}

enum CancelTimerFailedCause {
  timerIdUnknown,
  operationNotPermitted,
}

extension CancelTimerFailedCauseValueExtension on CancelTimerFailedCause {
  String toValue() {
    switch (this) {
      case CancelTimerFailedCause.timerIdUnknown:
        return 'TIMER_ID_UNKNOWN';
      case CancelTimerFailedCause.operationNotPermitted:
        return 'OPERATION_NOT_PERMITTED';
    }
  }
}

extension CancelTimerFailedCauseFromString on String {
  CancelTimerFailedCause toCancelTimerFailedCause() {
    switch (this) {
      case 'TIMER_ID_UNKNOWN':
        return CancelTimerFailedCause.timerIdUnknown;
      case 'OPERATION_NOT_PERMITTED':
        return CancelTimerFailedCause.operationNotPermitted;
    }
    throw Exception('$this is not known in enum CancelTimerFailedCause');
  }
}

/// Provides the details of the <code>CancelTimerFailed</code> event.
class CancelTimerFailedEventAttributes {
  /// The cause of the failure. This information is generated by the system and
  /// can be useful for diagnostic purposes.
  /// <note>
  /// If <code>cause</code> is set to <code>OPERATION_NOT_PERMITTED</code>, the
  /// decision failed because it lacked sufficient permissions. For details and
  /// example IAM policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  /// </note>
  final CancelTimerFailedCause cause;

  /// The ID of the <code>DecisionTaskCompleted</code> event corresponding to the
  /// decision task that resulted in the <code>CancelTimer</code> decision to
  /// cancel this timer. This information can be useful for diagnosing problems by
  /// tracing back the chain of events leading up to this event.
  final int decisionTaskCompletedEventId;

  /// The timerId provided in the <code>CancelTimer</code> decision that failed.
  final String timerId;

  CancelTimerFailedEventAttributes({
    required this.cause,
    required this.decisionTaskCompletedEventId,
    required this.timerId,
  });

  factory CancelTimerFailedEventAttributes.fromJson(Map<String, dynamic> json) {
    return CancelTimerFailedEventAttributes(
      cause: (json['cause'] as String).toCancelTimerFailedCause(),
      decisionTaskCompletedEventId: json['decisionTaskCompletedEventId'] as int,
      timerId: json['timerId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final cause = this.cause;
    final decisionTaskCompletedEventId = this.decisionTaskCompletedEventId;
    final timerId = this.timerId;
    return {
      'cause': cause.toValue(),
      'decisionTaskCompletedEventId': decisionTaskCompletedEventId,
      'timerId': timerId,
    };
  }
}

/// Provides the details of the <code>CancelWorkflowExecution</code> decision.
///
/// <b>Access Control</b>
///
/// You can use IAM policies to control this decision's access to Amazon SWF
/// resources as follows:
///
/// <ul>
/// <li>
/// Use a <code>Resource</code> element with the domain name to limit the action
/// to only specified domains.
/// </li>
/// <li>
/// Use an <code>Action</code> element to allow or deny permission to call this
/// action.
/// </li>
/// <li>
/// You cannot use an IAM policy to constrain this action's parameters.
/// </li>
/// </ul>
/// If the caller doesn't have sufficient permissions to invoke the action, or
/// the parameter values fall outside the specified constraints, the action
/// fails. The associated event attribute's <code>cause</code> parameter is set
/// to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
/// policies, see <a
/// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
/// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
/// Developer Guide</i>.
class CancelWorkflowExecutionDecisionAttributes {
  /// Details of the cancellation.
  final String? details;

  CancelWorkflowExecutionDecisionAttributes({
    this.details,
  });

  Map<String, dynamic> toJson() {
    final details = this.details;
    return {
      if (details != null) 'details': details,
    };
  }
}

enum CancelWorkflowExecutionFailedCause {
  unhandledDecision,
  operationNotPermitted,
}

extension CancelWorkflowExecutionFailedCauseValueExtension
    on CancelWorkflowExecutionFailedCause {
  String toValue() {
    switch (this) {
      case CancelWorkflowExecutionFailedCause.unhandledDecision:
        return 'UNHANDLED_DECISION';
      case CancelWorkflowExecutionFailedCause.operationNotPermitted:
        return 'OPERATION_NOT_PERMITTED';
    }
  }
}

extension CancelWorkflowExecutionFailedCauseFromString on String {
  CancelWorkflowExecutionFailedCause toCancelWorkflowExecutionFailedCause() {
    switch (this) {
      case 'UNHANDLED_DECISION':
        return CancelWorkflowExecutionFailedCause.unhandledDecision;
      case 'OPERATION_NOT_PERMITTED':
        return CancelWorkflowExecutionFailedCause.operationNotPermitted;
    }
    throw Exception(
        '$this is not known in enum CancelWorkflowExecutionFailedCause');
  }
}

/// Provides the details of the <code>CancelWorkflowExecutionFailed</code>
/// event.
class CancelWorkflowExecutionFailedEventAttributes {
  /// The cause of the failure. This information is generated by the system and
  /// can be useful for diagnostic purposes.
  /// <note>
  /// If <code>cause</code> is set to <code>OPERATION_NOT_PERMITTED</code>, the
  /// decision failed because it lacked sufficient permissions. For details and
  /// example IAM policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  /// </note>
  final CancelWorkflowExecutionFailedCause cause;

  /// The ID of the <code>DecisionTaskCompleted</code> event corresponding to the
  /// decision task that resulted in the <code>CancelWorkflowExecution</code>
  /// decision for this cancellation request. This information can be useful for
  /// diagnosing problems by tracing back the chain of events leading up to this
  /// event.
  final int decisionTaskCompletedEventId;

  CancelWorkflowExecutionFailedEventAttributes({
    required this.cause,
    required this.decisionTaskCompletedEventId,
  });

  factory CancelWorkflowExecutionFailedEventAttributes.fromJson(
      Map<String, dynamic> json) {
    return CancelWorkflowExecutionFailedEventAttributes(
      cause: (json['cause'] as String).toCancelWorkflowExecutionFailedCause(),
      decisionTaskCompletedEventId: json['decisionTaskCompletedEventId'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final cause = this.cause;
    final decisionTaskCompletedEventId = this.decisionTaskCompletedEventId;
    return {
      'cause': cause.toValue(),
      'decisionTaskCompletedEventId': decisionTaskCompletedEventId,
    };
  }
}

enum ChildPolicy {
  terminate,
  requestCancel,
  abandon,
}

extension ChildPolicyValueExtension on ChildPolicy {
  String toValue() {
    switch (this) {
      case ChildPolicy.terminate:
        return 'TERMINATE';
      case ChildPolicy.requestCancel:
        return 'REQUEST_CANCEL';
      case ChildPolicy.abandon:
        return 'ABANDON';
    }
  }
}

extension ChildPolicyFromString on String {
  ChildPolicy toChildPolicy() {
    switch (this) {
      case 'TERMINATE':
        return ChildPolicy.terminate;
      case 'REQUEST_CANCEL':
        return ChildPolicy.requestCancel;
      case 'ABANDON':
        return ChildPolicy.abandon;
    }
    throw Exception('$this is not known in enum ChildPolicy');
  }
}

/// Provide details of the <code>ChildWorkflowExecutionCanceled</code> event.
class ChildWorkflowExecutionCanceledEventAttributes {
  /// The ID of the <code>StartChildWorkflowExecutionInitiated</code> event
  /// corresponding to the <code>StartChildWorkflowExecution</code>
  /// <a>Decision</a> to start this child workflow execution. This information can
  /// be useful for diagnosing problems by tracing back the chain of events
  /// leading up to this event.
  final int initiatedEventId;

  /// The ID of the <code>ChildWorkflowExecutionStarted</code> event recorded when
  /// this child workflow execution was started. This information can be useful
  /// for diagnosing problems by tracing back the chain of events leading up to
  /// this event.
  final int startedEventId;

  /// The child workflow execution that was canceled.
  final WorkflowExecution workflowExecution;

  /// The type of the child workflow execution.
  final WorkflowType workflowType;

  /// Details of the cancellation (if provided).
  final String? details;

  ChildWorkflowExecutionCanceledEventAttributes({
    required this.initiatedEventId,
    required this.startedEventId,
    required this.workflowExecution,
    required this.workflowType,
    this.details,
  });

  factory ChildWorkflowExecutionCanceledEventAttributes.fromJson(
      Map<String, dynamic> json) {
    return ChildWorkflowExecutionCanceledEventAttributes(
      initiatedEventId: json['initiatedEventId'] as int,
      startedEventId: json['startedEventId'] as int,
      workflowExecution: WorkflowExecution.fromJson(
          json['workflowExecution'] as Map<String, dynamic>),
      workflowType:
          WorkflowType.fromJson(json['workflowType'] as Map<String, dynamic>),
      details: json['details'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final initiatedEventId = this.initiatedEventId;
    final startedEventId = this.startedEventId;
    final workflowExecution = this.workflowExecution;
    final workflowType = this.workflowType;
    final details = this.details;
    return {
      'initiatedEventId': initiatedEventId,
      'startedEventId': startedEventId,
      'workflowExecution': workflowExecution,
      'workflowType': workflowType,
      if (details != null) 'details': details,
    };
  }
}

/// Provides the details of the <code>ChildWorkflowExecutionCompleted</code>
/// event.
class ChildWorkflowExecutionCompletedEventAttributes {
  /// The ID of the <code>StartChildWorkflowExecutionInitiated</code> event
  /// corresponding to the <code>StartChildWorkflowExecution</code>
  /// <a>Decision</a> to start this child workflow execution. This information can
  /// be useful for diagnosing problems by tracing back the chain of events
  /// leading up to this event.
  final int initiatedEventId;

  /// The ID of the <code>ChildWorkflowExecutionStarted</code> event recorded when
  /// this child workflow execution was started. This information can be useful
  /// for diagnosing problems by tracing back the chain of events leading up to
  /// this event.
  final int startedEventId;

  /// The child workflow execution that was completed.
  final WorkflowExecution workflowExecution;

  /// The type of the child workflow execution.
  final WorkflowType workflowType;

  /// The result of the child workflow execution.
  final String? result;

  ChildWorkflowExecutionCompletedEventAttributes({
    required this.initiatedEventId,
    required this.startedEventId,
    required this.workflowExecution,
    required this.workflowType,
    this.result,
  });

  factory ChildWorkflowExecutionCompletedEventAttributes.fromJson(
      Map<String, dynamic> json) {
    return ChildWorkflowExecutionCompletedEventAttributes(
      initiatedEventId: json['initiatedEventId'] as int,
      startedEventId: json['startedEventId'] as int,
      workflowExecution: WorkflowExecution.fromJson(
          json['workflowExecution'] as Map<String, dynamic>),
      workflowType:
          WorkflowType.fromJson(json['workflowType'] as Map<String, dynamic>),
      result: json['result'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final initiatedEventId = this.initiatedEventId;
    final startedEventId = this.startedEventId;
    final workflowExecution = this.workflowExecution;
    final workflowType = this.workflowType;
    final result = this.result;
    return {
      'initiatedEventId': initiatedEventId,
      'startedEventId': startedEventId,
      'workflowExecution': workflowExecution,
      'workflowType': workflowType,
      if (result != null) 'result': result,
    };
  }
}

/// Provides the details of the <code>ChildWorkflowExecutionFailed</code> event.
class ChildWorkflowExecutionFailedEventAttributes {
  /// The ID of the <code>StartChildWorkflowExecutionInitiated</code> event
  /// corresponding to the <code>StartChildWorkflowExecution</code>
  /// <a>Decision</a> to start this child workflow execution. This information can
  /// be useful for diagnosing problems by tracing back the chain of events
  /// leading up to this event.
  final int initiatedEventId;

  /// The ID of the <code>ChildWorkflowExecutionStarted</code> event recorded when
  /// this child workflow execution was started. This information can be useful
  /// for diagnosing problems by tracing back the chain of events leading up to
  /// this event.
  final int startedEventId;

  /// The child workflow execution that failed.
  final WorkflowExecution workflowExecution;

  /// The type of the child workflow execution.
  final WorkflowType workflowType;

  /// The details of the failure (if provided).
  final String? details;

  /// The reason for the failure (if provided).
  final String? reason;

  ChildWorkflowExecutionFailedEventAttributes({
    required this.initiatedEventId,
    required this.startedEventId,
    required this.workflowExecution,
    required this.workflowType,
    this.details,
    this.reason,
  });

  factory ChildWorkflowExecutionFailedEventAttributes.fromJson(
      Map<String, dynamic> json) {
    return ChildWorkflowExecutionFailedEventAttributes(
      initiatedEventId: json['initiatedEventId'] as int,
      startedEventId: json['startedEventId'] as int,
      workflowExecution: WorkflowExecution.fromJson(
          json['workflowExecution'] as Map<String, dynamic>),
      workflowType:
          WorkflowType.fromJson(json['workflowType'] as Map<String, dynamic>),
      details: json['details'] as String?,
      reason: json['reason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final initiatedEventId = this.initiatedEventId;
    final startedEventId = this.startedEventId;
    final workflowExecution = this.workflowExecution;
    final workflowType = this.workflowType;
    final details = this.details;
    final reason = this.reason;
    return {
      'initiatedEventId': initiatedEventId,
      'startedEventId': startedEventId,
      'workflowExecution': workflowExecution,
      'workflowType': workflowType,
      if (details != null) 'details': details,
      if (reason != null) 'reason': reason,
    };
  }
}

/// Provides the details of the <code>ChildWorkflowExecutionStarted</code>
/// event.
class ChildWorkflowExecutionStartedEventAttributes {
  /// The ID of the <code>StartChildWorkflowExecutionInitiated</code> event
  /// corresponding to the <code>StartChildWorkflowExecution</code>
  /// <a>Decision</a> to start this child workflow execution. This information can
  /// be useful for diagnosing problems by tracing back the chain of events
  /// leading up to this event.
  final int initiatedEventId;

  /// The child workflow execution that was started.
  final WorkflowExecution workflowExecution;

  /// The type of the child workflow execution.
  final WorkflowType workflowType;

  ChildWorkflowExecutionStartedEventAttributes({
    required this.initiatedEventId,
    required this.workflowExecution,
    required this.workflowType,
  });

  factory ChildWorkflowExecutionStartedEventAttributes.fromJson(
      Map<String, dynamic> json) {
    return ChildWorkflowExecutionStartedEventAttributes(
      initiatedEventId: json['initiatedEventId'] as int,
      workflowExecution: WorkflowExecution.fromJson(
          json['workflowExecution'] as Map<String, dynamic>),
      workflowType:
          WorkflowType.fromJson(json['workflowType'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final initiatedEventId = this.initiatedEventId;
    final workflowExecution = this.workflowExecution;
    final workflowType = this.workflowType;
    return {
      'initiatedEventId': initiatedEventId,
      'workflowExecution': workflowExecution,
      'workflowType': workflowType,
    };
  }
}

/// Provides the details of the <code>ChildWorkflowExecutionTerminated</code>
/// event.
class ChildWorkflowExecutionTerminatedEventAttributes {
  /// The ID of the <code>StartChildWorkflowExecutionInitiated</code> event
  /// corresponding to the <code>StartChildWorkflowExecution</code>
  /// <a>Decision</a> to start this child workflow execution. This information can
  /// be useful for diagnosing problems by tracing back the chain of events
  /// leading up to this event.
  final int initiatedEventId;

  /// The ID of the <code>ChildWorkflowExecutionStarted</code> event recorded when
  /// this child workflow execution was started. This information can be useful
  /// for diagnosing problems by tracing back the chain of events leading up to
  /// this event.
  final int startedEventId;

  /// The child workflow execution that was terminated.
  final WorkflowExecution workflowExecution;

  /// The type of the child workflow execution.
  final WorkflowType workflowType;

  ChildWorkflowExecutionTerminatedEventAttributes({
    required this.initiatedEventId,
    required this.startedEventId,
    required this.workflowExecution,
    required this.workflowType,
  });

  factory ChildWorkflowExecutionTerminatedEventAttributes.fromJson(
      Map<String, dynamic> json) {
    return ChildWorkflowExecutionTerminatedEventAttributes(
      initiatedEventId: json['initiatedEventId'] as int,
      startedEventId: json['startedEventId'] as int,
      workflowExecution: WorkflowExecution.fromJson(
          json['workflowExecution'] as Map<String, dynamic>),
      workflowType:
          WorkflowType.fromJson(json['workflowType'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final initiatedEventId = this.initiatedEventId;
    final startedEventId = this.startedEventId;
    final workflowExecution = this.workflowExecution;
    final workflowType = this.workflowType;
    return {
      'initiatedEventId': initiatedEventId,
      'startedEventId': startedEventId,
      'workflowExecution': workflowExecution,
      'workflowType': workflowType,
    };
  }
}

/// Provides the details of the <code>ChildWorkflowExecutionTimedOut</code>
/// event.
class ChildWorkflowExecutionTimedOutEventAttributes {
  /// The ID of the <code>StartChildWorkflowExecutionInitiated</code> event
  /// corresponding to the <code>StartChildWorkflowExecution</code>
  /// <a>Decision</a> to start this child workflow execution. This information can
  /// be useful for diagnosing problems by tracing back the chain of events
  /// leading up to this event.
  final int initiatedEventId;

  /// The ID of the <code>ChildWorkflowExecutionStarted</code> event recorded when
  /// this child workflow execution was started. This information can be useful
  /// for diagnosing problems by tracing back the chain of events leading up to
  /// this event.
  final int startedEventId;

  /// The type of the timeout that caused the child workflow execution to time
  /// out.
  final WorkflowExecutionTimeoutType timeoutType;

  /// The child workflow execution that timed out.
  final WorkflowExecution workflowExecution;

  /// The type of the child workflow execution.
  final WorkflowType workflowType;

  ChildWorkflowExecutionTimedOutEventAttributes({
    required this.initiatedEventId,
    required this.startedEventId,
    required this.timeoutType,
    required this.workflowExecution,
    required this.workflowType,
  });

  factory ChildWorkflowExecutionTimedOutEventAttributes.fromJson(
      Map<String, dynamic> json) {
    return ChildWorkflowExecutionTimedOutEventAttributes(
      initiatedEventId: json['initiatedEventId'] as int,
      startedEventId: json['startedEventId'] as int,
      timeoutType:
          (json['timeoutType'] as String).toWorkflowExecutionTimeoutType(),
      workflowExecution: WorkflowExecution.fromJson(
          json['workflowExecution'] as Map<String, dynamic>),
      workflowType:
          WorkflowType.fromJson(json['workflowType'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final initiatedEventId = this.initiatedEventId;
    final startedEventId = this.startedEventId;
    final timeoutType = this.timeoutType;
    final workflowExecution = this.workflowExecution;
    final workflowType = this.workflowType;
    return {
      'initiatedEventId': initiatedEventId,
      'startedEventId': startedEventId,
      'timeoutType': timeoutType.toValue(),
      'workflowExecution': workflowExecution,
      'workflowType': workflowType,
    };
  }
}

enum CloseStatus {
  completed,
  failed,
  canceled,
  terminated,
  continuedAsNew,
  timedOut,
}

extension CloseStatusValueExtension on CloseStatus {
  String toValue() {
    switch (this) {
      case CloseStatus.completed:
        return 'COMPLETED';
      case CloseStatus.failed:
        return 'FAILED';
      case CloseStatus.canceled:
        return 'CANCELED';
      case CloseStatus.terminated:
        return 'TERMINATED';
      case CloseStatus.continuedAsNew:
        return 'CONTINUED_AS_NEW';
      case CloseStatus.timedOut:
        return 'TIMED_OUT';
    }
  }
}

extension CloseStatusFromString on String {
  CloseStatus toCloseStatus() {
    switch (this) {
      case 'COMPLETED':
        return CloseStatus.completed;
      case 'FAILED':
        return CloseStatus.failed;
      case 'CANCELED':
        return CloseStatus.canceled;
      case 'TERMINATED':
        return CloseStatus.terminated;
      case 'CONTINUED_AS_NEW':
        return CloseStatus.continuedAsNew;
      case 'TIMED_OUT':
        return CloseStatus.timedOut;
    }
    throw Exception('$this is not known in enum CloseStatus');
  }
}

/// Used to filter the closed workflow executions in visibility APIs by their
/// close status.
class CloseStatusFilter {
  /// The close status that must match the close status of an execution for it to
  /// meet the criteria of this filter.
  final CloseStatus status;

  CloseStatusFilter({
    required this.status,
  });

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      'status': status.toValue(),
    };
  }
}

/// Provides the details of the <code>CompleteWorkflowExecution</code> decision.
///
/// <b>Access Control</b>
///
/// You can use IAM policies to control this decision's access to Amazon SWF
/// resources as follows:
///
/// <ul>
/// <li>
/// Use a <code>Resource</code> element with the domain name to limit the action
/// to only specified domains.
/// </li>
/// <li>
/// Use an <code>Action</code> element to allow or deny permission to call this
/// action.
/// </li>
/// <li>
/// You cannot use an IAM policy to constrain this action's parameters.
/// </li>
/// </ul>
/// If the caller doesn't have sufficient permissions to invoke the action, or
/// the parameter values fall outside the specified constraints, the action
/// fails. The associated event attribute's <code>cause</code> parameter is set
/// to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
/// policies, see <a
/// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
/// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
/// Developer Guide</i>.
class CompleteWorkflowExecutionDecisionAttributes {
  /// The result of the workflow execution. The form of the result is
  /// implementation defined.
  final String? result;

  CompleteWorkflowExecutionDecisionAttributes({
    this.result,
  });

  Map<String, dynamic> toJson() {
    final result = this.result;
    return {
      if (result != null) 'result': result,
    };
  }
}

enum CompleteWorkflowExecutionFailedCause {
  unhandledDecision,
  operationNotPermitted,
}

extension CompleteWorkflowExecutionFailedCauseValueExtension
    on CompleteWorkflowExecutionFailedCause {
  String toValue() {
    switch (this) {
      case CompleteWorkflowExecutionFailedCause.unhandledDecision:
        return 'UNHANDLED_DECISION';
      case CompleteWorkflowExecutionFailedCause.operationNotPermitted:
        return 'OPERATION_NOT_PERMITTED';
    }
  }
}

extension CompleteWorkflowExecutionFailedCauseFromString on String {
  CompleteWorkflowExecutionFailedCause
      toCompleteWorkflowExecutionFailedCause() {
    switch (this) {
      case 'UNHANDLED_DECISION':
        return CompleteWorkflowExecutionFailedCause.unhandledDecision;
      case 'OPERATION_NOT_PERMITTED':
        return CompleteWorkflowExecutionFailedCause.operationNotPermitted;
    }
    throw Exception(
        '$this is not known in enum CompleteWorkflowExecutionFailedCause');
  }
}

/// Provides the details of the <code>CompleteWorkflowExecutionFailed</code>
/// event.
class CompleteWorkflowExecutionFailedEventAttributes {
  /// The cause of the failure. This information is generated by the system and
  /// can be useful for diagnostic purposes.
  /// <note>
  /// If <code>cause</code> is set to <code>OPERATION_NOT_PERMITTED</code>, the
  /// decision failed because it lacked sufficient permissions. For details and
  /// example IAM policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  /// </note>
  final CompleteWorkflowExecutionFailedCause cause;

  /// The ID of the <code>DecisionTaskCompleted</code> event corresponding to the
  /// decision task that resulted in the <code>CompleteWorkflowExecution</code>
  /// decision to complete this execution. This information can be useful for
  /// diagnosing problems by tracing back the chain of events leading up to this
  /// event.
  final int decisionTaskCompletedEventId;

  CompleteWorkflowExecutionFailedEventAttributes({
    required this.cause,
    required this.decisionTaskCompletedEventId,
  });

  factory CompleteWorkflowExecutionFailedEventAttributes.fromJson(
      Map<String, dynamic> json) {
    return CompleteWorkflowExecutionFailedEventAttributes(
      cause: (json['cause'] as String).toCompleteWorkflowExecutionFailedCause(),
      decisionTaskCompletedEventId: json['decisionTaskCompletedEventId'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final cause = this.cause;
    final decisionTaskCompletedEventId = this.decisionTaskCompletedEventId;
    return {
      'cause': cause.toValue(),
      'decisionTaskCompletedEventId': decisionTaskCompletedEventId,
    };
  }
}

/// Provides the details of the <code>ContinueAsNewWorkflowExecution</code>
/// decision.
///
/// <b>Access Control</b>
///
/// You can use IAM policies to control this decision's access to Amazon SWF
/// resources as follows:
///
/// <ul>
/// <li>
/// Use a <code>Resource</code> element with the domain name to limit the action
/// to only specified domains.
/// </li>
/// <li>
/// Use an <code>Action</code> element to allow or deny permission to call this
/// action.
/// </li>
/// <li>
/// Constrain the following parameters by using a <code>Condition</code> element
/// with the appropriate keys.
///
/// <ul>
/// <li>
/// <code>tag</code> – A tag used to identify the workflow execution
/// </li>
/// <li>
/// <code>taskList</code> – String constraint. The key is
/// <code>swf:taskList.name</code>.
/// </li>
/// <li>
/// <code>workflowType.version</code> – String constraint. The key is
/// <code>swf:workflowType.version</code>.
/// </li>
/// </ul> </li>
/// </ul>
/// If the caller doesn't have sufficient permissions to invoke the action, or
/// the parameter values fall outside the specified constraints, the action
/// fails. The associated event attribute's <code>cause</code> parameter is set
/// to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
/// policies, see <a
/// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
/// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
/// Developer Guide</i>.
class ContinueAsNewWorkflowExecutionDecisionAttributes {
  /// If set, specifies the policy to use for the child workflow executions of the
  /// new execution if it is terminated by calling the
  /// <a>TerminateWorkflowExecution</a> action explicitly or due to an expired
  /// timeout. This policy overrides the default child policy specified when
  /// registering the workflow type using <a>RegisterWorkflowType</a>.
  ///
  /// The supported child policies are:
  ///
  /// <ul>
  /// <li>
  /// <code>TERMINATE</code> – The child executions are terminated.
  /// </li>
  /// <li>
  /// <code>REQUEST_CANCEL</code> – A request to cancel is attempted for each
  /// child execution by recording a <code>WorkflowExecutionCancelRequested</code>
  /// event in its history. It is up to the decider to take appropriate actions
  /// when it receives an execution history with this event.
  /// </li>
  /// <li>
  /// <code>ABANDON</code> – No action is taken. The child executions continue to
  /// run.
  /// </li>
  /// </ul> <note>
  /// A child policy for this workflow execution must be specified either as a
  /// default for the workflow type or through this parameter. If neither this
  /// parameter is set nor a default child policy was specified at registration
  /// time then a fault is returned.
  /// </note>
  final ChildPolicy? childPolicy;

  /// If set, specifies the total duration for this workflow execution. This
  /// overrides the <code>defaultExecutionStartToCloseTimeout</code> specified
  /// when registering the workflow type.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// <code>0</code>. You can use <code>NONE</code> to specify unlimited duration.
  /// <note>
  /// An execution start-to-close timeout for this workflow execution must be
  /// specified either as a default for the workflow type or through this field.
  /// If neither this field is set nor a default execution start-to-close timeout
  /// was specified at registration time then a fault is returned.
  /// </note>
  final String? executionStartToCloseTimeout;

  /// The input provided to the new workflow execution.
  final String? input;

  /// The IAM role to attach to the new (continued) execution.
  final String? lambdaRole;

  /// The list of tags to associate with the new workflow execution. A maximum of
  /// 5 tags can be specified. You can list workflow executions with a specific
  /// tag by calling <a>ListOpenWorkflowExecutions</a> or
  /// <a>ListClosedWorkflowExecutions</a> and specifying a <a>TagFilter</a>.
  final List<String>? tagList;

  /// The task list to use for the decisions of the new (continued) workflow
  /// execution.
  final TaskList? taskList;

  /// The task priority that, if set, specifies the priority for the decision
  /// tasks for this workflow execution. This overrides the defaultTaskPriority
  /// specified when registering the workflow type. Valid values are integers that
  /// range from Java's <code>Integer.MIN_VALUE</code> (-2147483648) to
  /// <code>Integer.MAX_VALUE</code> (2147483647). Higher numbers indicate higher
  /// priority.
  ///
  /// For more information about setting task priority, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/programming-priority.html">Setting
  /// Task Priority</a> in the <i>Amazon SWF Developer Guide</i>.
  final String? taskPriority;

  /// Specifies the maximum duration of decision tasks for the new workflow
  /// execution. This parameter overrides the
  /// <code>defaultTaskStartToCloseTimout</code> specified when registering the
  /// workflow type using <a>RegisterWorkflowType</a>.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// <code>0</code>. You can use <code>NONE</code> to specify unlimited duration.
  /// <note>
  /// A task start-to-close timeout for the new workflow execution must be
  /// specified either as a default for the workflow type or through this
  /// parameter. If neither this parameter is set nor a default task
  /// start-to-close timeout was specified at registration time then a fault is
  /// returned.
  /// </note>
  final String? taskStartToCloseTimeout;

  /// The version of the workflow to start.
  final String? workflowTypeVersion;

  ContinueAsNewWorkflowExecutionDecisionAttributes({
    this.childPolicy,
    this.executionStartToCloseTimeout,
    this.input,
    this.lambdaRole,
    this.tagList,
    this.taskList,
    this.taskPriority,
    this.taskStartToCloseTimeout,
    this.workflowTypeVersion,
  });

  Map<String, dynamic> toJson() {
    final childPolicy = this.childPolicy;
    final executionStartToCloseTimeout = this.executionStartToCloseTimeout;
    final input = this.input;
    final lambdaRole = this.lambdaRole;
    final tagList = this.tagList;
    final taskList = this.taskList;
    final taskPriority = this.taskPriority;
    final taskStartToCloseTimeout = this.taskStartToCloseTimeout;
    final workflowTypeVersion = this.workflowTypeVersion;
    return {
      if (childPolicy != null) 'childPolicy': childPolicy.toValue(),
      if (executionStartToCloseTimeout != null)
        'executionStartToCloseTimeout': executionStartToCloseTimeout,
      if (input != null) 'input': input,
      if (lambdaRole != null) 'lambdaRole': lambdaRole,
      if (tagList != null) 'tagList': tagList,
      if (taskList != null) 'taskList': taskList,
      if (taskPriority != null) 'taskPriority': taskPriority,
      if (taskStartToCloseTimeout != null)
        'taskStartToCloseTimeout': taskStartToCloseTimeout,
      if (workflowTypeVersion != null)
        'workflowTypeVersion': workflowTypeVersion,
    };
  }
}

enum ContinueAsNewWorkflowExecutionFailedCause {
  unhandledDecision,
  workflowTypeDeprecated,
  workflowTypeDoesNotExist,
  defaultExecutionStartToCloseTimeoutUndefined,
  defaultTaskStartToCloseTimeoutUndefined,
  defaultTaskListUndefined,
  defaultChildPolicyUndefined,
  continueAsNewWorkflowExecutionRateExceeded,
  operationNotPermitted,
}

extension ContinueAsNewWorkflowExecutionFailedCauseValueExtension
    on ContinueAsNewWorkflowExecutionFailedCause {
  String toValue() {
    switch (this) {
      case ContinueAsNewWorkflowExecutionFailedCause.unhandledDecision:
        return 'UNHANDLED_DECISION';
      case ContinueAsNewWorkflowExecutionFailedCause.workflowTypeDeprecated:
        return 'WORKFLOW_TYPE_DEPRECATED';
      case ContinueAsNewWorkflowExecutionFailedCause.workflowTypeDoesNotExist:
        return 'WORKFLOW_TYPE_DOES_NOT_EXIST';
      case ContinueAsNewWorkflowExecutionFailedCause
            .defaultExecutionStartToCloseTimeoutUndefined:
        return 'DEFAULT_EXECUTION_START_TO_CLOSE_TIMEOUT_UNDEFINED';
      case ContinueAsNewWorkflowExecutionFailedCause
            .defaultTaskStartToCloseTimeoutUndefined:
        return 'DEFAULT_TASK_START_TO_CLOSE_TIMEOUT_UNDEFINED';
      case ContinueAsNewWorkflowExecutionFailedCause.defaultTaskListUndefined:
        return 'DEFAULT_TASK_LIST_UNDEFINED';
      case ContinueAsNewWorkflowExecutionFailedCause
            .defaultChildPolicyUndefined:
        return 'DEFAULT_CHILD_POLICY_UNDEFINED';
      case ContinueAsNewWorkflowExecutionFailedCause
            .continueAsNewWorkflowExecutionRateExceeded:
        return 'CONTINUE_AS_NEW_WORKFLOW_EXECUTION_RATE_EXCEEDED';
      case ContinueAsNewWorkflowExecutionFailedCause.operationNotPermitted:
        return 'OPERATION_NOT_PERMITTED';
    }
  }
}

extension ContinueAsNewWorkflowExecutionFailedCauseFromString on String {
  ContinueAsNewWorkflowExecutionFailedCause
      toContinueAsNewWorkflowExecutionFailedCause() {
    switch (this) {
      case 'UNHANDLED_DECISION':
        return ContinueAsNewWorkflowExecutionFailedCause.unhandledDecision;
      case 'WORKFLOW_TYPE_DEPRECATED':
        return ContinueAsNewWorkflowExecutionFailedCause.workflowTypeDeprecated;
      case 'WORKFLOW_TYPE_DOES_NOT_EXIST':
        return ContinueAsNewWorkflowExecutionFailedCause
            .workflowTypeDoesNotExist;
      case 'DEFAULT_EXECUTION_START_TO_CLOSE_TIMEOUT_UNDEFINED':
        return ContinueAsNewWorkflowExecutionFailedCause
            .defaultExecutionStartToCloseTimeoutUndefined;
      case 'DEFAULT_TASK_START_TO_CLOSE_TIMEOUT_UNDEFINED':
        return ContinueAsNewWorkflowExecutionFailedCause
            .defaultTaskStartToCloseTimeoutUndefined;
      case 'DEFAULT_TASK_LIST_UNDEFINED':
        return ContinueAsNewWorkflowExecutionFailedCause
            .defaultTaskListUndefined;
      case 'DEFAULT_CHILD_POLICY_UNDEFINED':
        return ContinueAsNewWorkflowExecutionFailedCause
            .defaultChildPolicyUndefined;
      case 'CONTINUE_AS_NEW_WORKFLOW_EXECUTION_RATE_EXCEEDED':
        return ContinueAsNewWorkflowExecutionFailedCause
            .continueAsNewWorkflowExecutionRateExceeded;
      case 'OPERATION_NOT_PERMITTED':
        return ContinueAsNewWorkflowExecutionFailedCause.operationNotPermitted;
    }
    throw Exception(
        '$this is not known in enum ContinueAsNewWorkflowExecutionFailedCause');
  }
}

/// Provides the details of the
/// <code>ContinueAsNewWorkflowExecutionFailed</code> event.
class ContinueAsNewWorkflowExecutionFailedEventAttributes {
  /// The cause of the failure. This information is generated by the system and
  /// can be useful for diagnostic purposes.
  /// <note>
  /// If <code>cause</code> is set to <code>OPERATION_NOT_PERMITTED</code>, the
  /// decision failed because it lacked sufficient permissions. For details and
  /// example IAM policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  /// </note>
  final ContinueAsNewWorkflowExecutionFailedCause cause;

  /// The ID of the <code>DecisionTaskCompleted</code> event corresponding to the
  /// decision task that resulted in the
  /// <code>ContinueAsNewWorkflowExecution</code> decision that started this
  /// execution. This information can be useful for diagnosing problems by tracing
  /// back the chain of events leading up to this event.
  final int decisionTaskCompletedEventId;

  ContinueAsNewWorkflowExecutionFailedEventAttributes({
    required this.cause,
    required this.decisionTaskCompletedEventId,
  });

  factory ContinueAsNewWorkflowExecutionFailedEventAttributes.fromJson(
      Map<String, dynamic> json) {
    return ContinueAsNewWorkflowExecutionFailedEventAttributes(
      cause: (json['cause'] as String)
          .toContinueAsNewWorkflowExecutionFailedCause(),
      decisionTaskCompletedEventId: json['decisionTaskCompletedEventId'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final cause = this.cause;
    final decisionTaskCompletedEventId = this.decisionTaskCompletedEventId;
    return {
      'cause': cause.toValue(),
      'decisionTaskCompletedEventId': decisionTaskCompletedEventId,
    };
  }
}

/// Specifies a decision made by the decider. A decision can be one of these
/// types:
///
/// <ul>
/// <li>
/// <code>CancelTimer</code> – Cancels a previously started timer and records a
/// <code>TimerCanceled</code> event in the history.
/// </li>
/// <li>
/// <code>CancelWorkflowExecution</code> – Closes the workflow execution and
/// records a <code>WorkflowExecutionCanceled</code> event in the history.
/// </li>
/// <li>
/// <code>CompleteWorkflowExecution</code> – Closes the workflow execution and
/// records a <code>WorkflowExecutionCompleted</code> event in the history .
/// </li>
/// <li>
/// <code>ContinueAsNewWorkflowExecution</code> – Closes the workflow execution
/// and starts a new workflow execution of the same type using the same workflow
/// ID and a unique run Id. A <code>WorkflowExecutionContinuedAsNew</code> event
/// is recorded in the history.
/// </li>
/// <li>
/// <code>FailWorkflowExecution</code> – Closes the workflow execution and
/// records a <code>WorkflowExecutionFailed</code> event in the history.
/// </li>
/// <li>
/// <code>RecordMarker</code> – Records a <code>MarkerRecorded</code> event in
/// the history. Markers can be used for adding custom information in the
/// history for instance to let deciders know that they don't need to look at
/// the history beyond the marker event.
/// </li>
/// <li>
/// <code>RequestCancelActivityTask</code> – Attempts to cancel a previously
/// scheduled activity task. If the activity task was scheduled but has not been
/// assigned to a worker, then it is canceled. If the activity task was already
/// assigned to a worker, then the worker is informed that cancellation has been
/// requested in the response to <a>RecordActivityTaskHeartbeat</a>.
/// </li>
/// <li>
/// <code>RequestCancelExternalWorkflowExecution</code> – Requests that a
/// request be made to cancel the specified external workflow execution and
/// records a <code>RequestCancelExternalWorkflowExecutionInitiated</code> event
/// in the history.
/// </li>
/// <li>
/// <code>ScheduleActivityTask</code> – Schedules an activity task.
/// </li>
/// <li>
/// <code>SignalExternalWorkflowExecution</code> – Requests a signal to be
/// delivered to the specified external workflow execution and records a
/// <code>SignalExternalWorkflowExecutionInitiated</code> event in the history.
/// </li>
/// <li>
/// <code>StartChildWorkflowExecution</code> – Requests that a child workflow
/// execution be started and records a
/// <code>StartChildWorkflowExecutionInitiated</code> event in the history. The
/// child workflow execution is a separate workflow execution with its own
/// history.
/// </li>
/// <li>
/// <code>StartTimer</code> – Starts a timer for this workflow execution and
/// records a <code>TimerStarted</code> event in the history. This timer fires
/// after the specified delay and record a <code>TimerFired</code> event.
/// </li>
/// </ul>
/// <b>Access Control</b>
///
/// If you grant permission to use <code>RespondDecisionTaskCompleted</code>,
/// you can use IAM policies to express permissions for the list of decisions
/// returned by this action as if they were members of the API. Treating
/// decisions as a pseudo API maintains a uniform conceptual model and helps
/// keep policies readable. For details and example IAM policies, see <a
/// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
/// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
/// Developer Guide</i>.
///
/// <b>Decision Failure</b>
///
/// Decisions can fail for several reasons
///
/// <ul>
/// <li>
/// The ordering of decisions should follow a logical flow. Some decisions might
/// not make sense in the current context of the workflow execution and
/// therefore fails.
/// </li>
/// <li>
/// A limit on your account was reached.
/// </li>
/// <li>
/// The decision lacks sufficient permissions.
/// </li>
/// </ul>
/// One of the following events might be added to the history to indicate an
/// error. The event attribute's <code>cause</code> parameter indicates the
/// cause. If <code>cause</code> is set to <code>OPERATION_NOT_PERMITTED</code>,
/// the decision failed because it lacked sufficient permissions. For details
/// and example IAM policies, see <a
/// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
/// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
/// Developer Guide</i>.
///
/// <ul>
/// <li>
/// <code>ScheduleActivityTaskFailed</code> – A
/// <code>ScheduleActivityTask</code> decision failed. This could happen if the
/// activity type specified in the decision isn't registered, is in a deprecated
/// state, or the decision isn't properly configured.
/// </li>
/// <li>
/// <code>RequestCancelActivityTaskFailed</code> – A
/// <code>RequestCancelActivityTask</code> decision failed. This could happen if
/// there is no open activity task with the specified activityId.
/// </li>
/// <li>
/// <code>StartTimerFailed</code> – A <code>StartTimer</code> decision failed.
/// This could happen if there is another open timer with the same timerId.
/// </li>
/// <li>
/// <code>CancelTimerFailed</code> – A <code>CancelTimer</code> decision failed.
/// This could happen if there is no open timer with the specified timerId.
/// </li>
/// <li>
/// <code>StartChildWorkflowExecutionFailed</code> – A
/// <code>StartChildWorkflowExecution</code> decision failed. This could happen
/// if the workflow type specified isn't registered, is deprecated, or the
/// decision isn't properly configured.
/// </li>
/// <li>
/// <code>SignalExternalWorkflowExecutionFailed</code> – A
/// <code>SignalExternalWorkflowExecution</code> decision failed. This could
/// happen if the <code>workflowID</code> specified in the decision was
/// incorrect.
/// </li>
/// <li>
/// <code>RequestCancelExternalWorkflowExecutionFailed</code> – A
/// <code>RequestCancelExternalWorkflowExecution</code> decision failed. This
/// could happen if the <code>workflowID</code> specified in the decision was
/// incorrect.
/// </li>
/// <li>
/// <code>CancelWorkflowExecutionFailed</code> – A
/// <code>CancelWorkflowExecution</code> decision failed. This could happen if
/// there is an unhandled decision task pending in the workflow execution.
/// </li>
/// <li>
/// <code>CompleteWorkflowExecutionFailed</code> – A
/// <code>CompleteWorkflowExecution</code> decision failed. This could happen if
/// there is an unhandled decision task pending in the workflow execution.
/// </li>
/// <li>
/// <code>ContinueAsNewWorkflowExecutionFailed</code> – A
/// <code>ContinueAsNewWorkflowExecution</code> decision failed. This could
/// happen if there is an unhandled decision task pending in the workflow
/// execution or the ContinueAsNewWorkflowExecution decision was not configured
/// correctly.
/// </li>
/// <li>
/// <code>FailWorkflowExecutionFailed</code> – A
/// <code>FailWorkflowExecution</code> decision failed. This could happen if
/// there is an unhandled decision task pending in the workflow execution.
/// </li>
/// </ul>
/// The preceding error events might occur due to an error in the decider logic,
/// which might put the workflow execution in an unstable state The cause field
/// in the event structure for the error event indicates the cause of the error.
/// <note>
/// A workflow execution may be closed by the decider by returning one of the
/// following decisions when completing a decision task:
/// <code>CompleteWorkflowExecution</code>, <code>FailWorkflowExecution</code>,
/// <code>CancelWorkflowExecution</code> and
/// <code>ContinueAsNewWorkflowExecution</code>. An
/// <code>UnhandledDecision</code> fault is returned if a workflow closing
/// decision is specified and a signal or activity event had been added to the
/// history while the decision task was being performed by the decider. Unlike
/// the above situations which are logic issues, this fault is always possible
/// because of race conditions in a distributed system. The right action here is
/// to call <a>RespondDecisionTaskCompleted</a> without any decisions. This
/// would result in another decision task with these new events included in the
/// history. The decider should handle the new events and may decide to close
/// the workflow execution.
/// </note>
/// <b>How to Code a Decision</b>
///
/// You code a decision by first setting the decision type field to one of the
/// above decision values, and then set the corresponding attributes field shown
/// below:
///
/// <ul>
/// <li>
/// <code> <a>ScheduleActivityTaskDecisionAttributes</a> </code>
/// </li>
/// <li>
/// <code> <a>RequestCancelActivityTaskDecisionAttributes</a> </code>
/// </li>
/// <li>
/// <code> <a>CompleteWorkflowExecutionDecisionAttributes</a> </code>
/// </li>
/// <li>
/// <code> <a>FailWorkflowExecutionDecisionAttributes</a> </code>
/// </li>
/// <li>
/// <code> <a>CancelWorkflowExecutionDecisionAttributes</a> </code>
/// </li>
/// <li>
/// <code> <a>ContinueAsNewWorkflowExecutionDecisionAttributes</a> </code>
/// </li>
/// <li>
/// <code> <a>RecordMarkerDecisionAttributes</a> </code>
/// </li>
/// <li>
/// <code> <a>StartTimerDecisionAttributes</a> </code>
/// </li>
/// <li>
/// <code> <a>CancelTimerDecisionAttributes</a> </code>
/// </li>
/// <li>
/// <code> <a>SignalExternalWorkflowExecutionDecisionAttributes</a> </code>
/// </li>
/// <li>
/// <code> <a>RequestCancelExternalWorkflowExecutionDecisionAttributes</a>
/// </code>
/// </li>
/// <li>
/// <code> <a>StartChildWorkflowExecutionDecisionAttributes</a> </code>
/// </li>
/// </ul>
class Decision {
  /// Specifies the type of the decision.
  final DecisionType decisionType;

  /// Provides the details of the <code>CancelTimer</code> decision. It isn't set
  /// for other decision types.
  final CancelTimerDecisionAttributes? cancelTimerDecisionAttributes;

  /// Provides the details of the <code>CancelWorkflowExecution</code> decision.
  /// It isn't set for other decision types.
  final CancelWorkflowExecutionDecisionAttributes?
      cancelWorkflowExecutionDecisionAttributes;

  /// Provides the details of the <code>CompleteWorkflowExecution</code> decision.
  /// It isn't set for other decision types.
  final CompleteWorkflowExecutionDecisionAttributes?
      completeWorkflowExecutionDecisionAttributes;

  /// Provides the details of the <code>ContinueAsNewWorkflowExecution</code>
  /// decision. It isn't set for other decision types.
  final ContinueAsNewWorkflowExecutionDecisionAttributes?
      continueAsNewWorkflowExecutionDecisionAttributes;

  /// Provides the details of the <code>FailWorkflowExecution</code> decision. It
  /// isn't set for other decision types.
  final FailWorkflowExecutionDecisionAttributes?
      failWorkflowExecutionDecisionAttributes;

  /// Provides the details of the <code>RecordMarker</code> decision. It isn't set
  /// for other decision types.
  final RecordMarkerDecisionAttributes? recordMarkerDecisionAttributes;

  /// Provides the details of the <code>RequestCancelActivityTask</code> decision.
  /// It isn't set for other decision types.
  final RequestCancelActivityTaskDecisionAttributes?
      requestCancelActivityTaskDecisionAttributes;

  /// Provides the details of the
  /// <code>RequestCancelExternalWorkflowExecution</code> decision. It isn't set
  /// for other decision types.
  final RequestCancelExternalWorkflowExecutionDecisionAttributes?
      requestCancelExternalWorkflowExecutionDecisionAttributes;

  /// Provides the details of the <code>ScheduleActivityTask</code> decision. It
  /// isn't set for other decision types.
  final ScheduleActivityTaskDecisionAttributes?
      scheduleActivityTaskDecisionAttributes;

  /// Provides the details of the <code>ScheduleLambdaFunction</code> decision. It
  /// isn't set for other decision types.
  final ScheduleLambdaFunctionDecisionAttributes?
      scheduleLambdaFunctionDecisionAttributes;

  /// Provides the details of the <code>SignalExternalWorkflowExecution</code>
  /// decision. It isn't set for other decision types.
  final SignalExternalWorkflowExecutionDecisionAttributes?
      signalExternalWorkflowExecutionDecisionAttributes;

  /// Provides the details of the <code>StartChildWorkflowExecution</code>
  /// decision. It isn't set for other decision types.
  final StartChildWorkflowExecutionDecisionAttributes?
      startChildWorkflowExecutionDecisionAttributes;

  /// Provides the details of the <code>StartTimer</code> decision. It isn't set
  /// for other decision types.
  final StartTimerDecisionAttributes? startTimerDecisionAttributes;

  Decision({
    required this.decisionType,
    this.cancelTimerDecisionAttributes,
    this.cancelWorkflowExecutionDecisionAttributes,
    this.completeWorkflowExecutionDecisionAttributes,
    this.continueAsNewWorkflowExecutionDecisionAttributes,
    this.failWorkflowExecutionDecisionAttributes,
    this.recordMarkerDecisionAttributes,
    this.requestCancelActivityTaskDecisionAttributes,
    this.requestCancelExternalWorkflowExecutionDecisionAttributes,
    this.scheduleActivityTaskDecisionAttributes,
    this.scheduleLambdaFunctionDecisionAttributes,
    this.signalExternalWorkflowExecutionDecisionAttributes,
    this.startChildWorkflowExecutionDecisionAttributes,
    this.startTimerDecisionAttributes,
  });

  Map<String, dynamic> toJson() {
    final decisionType = this.decisionType;
    final cancelTimerDecisionAttributes = this.cancelTimerDecisionAttributes;
    final cancelWorkflowExecutionDecisionAttributes =
        this.cancelWorkflowExecutionDecisionAttributes;
    final completeWorkflowExecutionDecisionAttributes =
        this.completeWorkflowExecutionDecisionAttributes;
    final continueAsNewWorkflowExecutionDecisionAttributes =
        this.continueAsNewWorkflowExecutionDecisionAttributes;
    final failWorkflowExecutionDecisionAttributes =
        this.failWorkflowExecutionDecisionAttributes;
    final recordMarkerDecisionAttributes = this.recordMarkerDecisionAttributes;
    final requestCancelActivityTaskDecisionAttributes =
        this.requestCancelActivityTaskDecisionAttributes;
    final requestCancelExternalWorkflowExecutionDecisionAttributes =
        this.requestCancelExternalWorkflowExecutionDecisionAttributes;
    final scheduleActivityTaskDecisionAttributes =
        this.scheduleActivityTaskDecisionAttributes;
    final scheduleLambdaFunctionDecisionAttributes =
        this.scheduleLambdaFunctionDecisionAttributes;
    final signalExternalWorkflowExecutionDecisionAttributes =
        this.signalExternalWorkflowExecutionDecisionAttributes;
    final startChildWorkflowExecutionDecisionAttributes =
        this.startChildWorkflowExecutionDecisionAttributes;
    final startTimerDecisionAttributes = this.startTimerDecisionAttributes;
    return {
      'decisionType': decisionType.toValue(),
      if (cancelTimerDecisionAttributes != null)
        'cancelTimerDecisionAttributes': cancelTimerDecisionAttributes,
      if (cancelWorkflowExecutionDecisionAttributes != null)
        'cancelWorkflowExecutionDecisionAttributes':
            cancelWorkflowExecutionDecisionAttributes,
      if (completeWorkflowExecutionDecisionAttributes != null)
        'completeWorkflowExecutionDecisionAttributes':
            completeWorkflowExecutionDecisionAttributes,
      if (continueAsNewWorkflowExecutionDecisionAttributes != null)
        'continueAsNewWorkflowExecutionDecisionAttributes':
            continueAsNewWorkflowExecutionDecisionAttributes,
      if (failWorkflowExecutionDecisionAttributes != null)
        'failWorkflowExecutionDecisionAttributes':
            failWorkflowExecutionDecisionAttributes,
      if (recordMarkerDecisionAttributes != null)
        'recordMarkerDecisionAttributes': recordMarkerDecisionAttributes,
      if (requestCancelActivityTaskDecisionAttributes != null)
        'requestCancelActivityTaskDecisionAttributes':
            requestCancelActivityTaskDecisionAttributes,
      if (requestCancelExternalWorkflowExecutionDecisionAttributes != null)
        'requestCancelExternalWorkflowExecutionDecisionAttributes':
            requestCancelExternalWorkflowExecutionDecisionAttributes,
      if (scheduleActivityTaskDecisionAttributes != null)
        'scheduleActivityTaskDecisionAttributes':
            scheduleActivityTaskDecisionAttributes,
      if (scheduleLambdaFunctionDecisionAttributes != null)
        'scheduleLambdaFunctionDecisionAttributes':
            scheduleLambdaFunctionDecisionAttributes,
      if (signalExternalWorkflowExecutionDecisionAttributes != null)
        'signalExternalWorkflowExecutionDecisionAttributes':
            signalExternalWorkflowExecutionDecisionAttributes,
      if (startChildWorkflowExecutionDecisionAttributes != null)
        'startChildWorkflowExecutionDecisionAttributes':
            startChildWorkflowExecutionDecisionAttributes,
      if (startTimerDecisionAttributes != null)
        'startTimerDecisionAttributes': startTimerDecisionAttributes,
    };
  }
}

/// A structure that represents a decision task. Decision tasks are sent to
/// deciders in order for them to make decisions.
class DecisionTask {
  /// A paginated list of history events of the workflow execution. The decider
  /// uses this during the processing of the decision task.
  final List<HistoryEvent> events;

  /// The ID of the <code>DecisionTaskStarted</code> event recorded in the
  /// history.
  final int startedEventId;

  /// The opaque string used as a handle on the task. This token is used by
  /// workers to communicate progress and response information back to the system
  /// about the task.
  final String taskToken;

  /// The workflow execution for which this decision task was created.
  final WorkflowExecution workflowExecution;

  /// The type of the workflow execution for which this decision task was created.
  final WorkflowType workflowType;

  /// If a <code>NextPageToken</code> was returned by a previous call, there are
  /// more results available. To retrieve the next page of results, make the call
  /// again using the returned token in <code>nextPageToken</code>. Keep all other
  /// arguments unchanged.
  ///
  /// The configured <code>maximumPageSize</code> determines how many results can
  /// be returned in a single call.
  final String? nextPageToken;

  /// The ID of the DecisionTaskStarted event of the previous decision task of
  /// this workflow execution that was processed by the decider. This can be used
  /// to determine the events in the history new since the last decision task
  /// received by the decider.
  final int? previousStartedEventId;

  DecisionTask({
    required this.events,
    required this.startedEventId,
    required this.taskToken,
    required this.workflowExecution,
    required this.workflowType,
    this.nextPageToken,
    this.previousStartedEventId,
  });

  factory DecisionTask.fromJson(Map<String, dynamic> json) {
    return DecisionTask(
      events: (json['events'] as List)
          .whereNotNull()
          .map((e) => HistoryEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
      startedEventId: json['startedEventId'] as int,
      taskToken: json['taskToken'] as String,
      workflowExecution: WorkflowExecution.fromJson(
          json['workflowExecution'] as Map<String, dynamic>),
      workflowType:
          WorkflowType.fromJson(json['workflowType'] as Map<String, dynamic>),
      nextPageToken: json['nextPageToken'] as String?,
      previousStartedEventId: json['previousStartedEventId'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final events = this.events;
    final startedEventId = this.startedEventId;
    final taskToken = this.taskToken;
    final workflowExecution = this.workflowExecution;
    final workflowType = this.workflowType;
    final nextPageToken = this.nextPageToken;
    final previousStartedEventId = this.previousStartedEventId;
    return {
      'events': events,
      'startedEventId': startedEventId,
      'taskToken': taskToken,
      'workflowExecution': workflowExecution,
      'workflowType': workflowType,
      if (nextPageToken != null) 'nextPageToken': nextPageToken,
      if (previousStartedEventId != null)
        'previousStartedEventId': previousStartedEventId,
    };
  }
}

/// Provides the details of the <code>DecisionTaskCompleted</code> event.
class DecisionTaskCompletedEventAttributes {
  /// The ID of the <code>DecisionTaskScheduled</code> event that was recorded
  /// when this decision task was scheduled. This information can be useful for
  /// diagnosing problems by tracing back the chain of events leading up to this
  /// event.
  final int scheduledEventId;

  /// The ID of the <code>DecisionTaskStarted</code> event recorded when this
  /// decision task was started. This information can be useful for diagnosing
  /// problems by tracing back the chain of events leading up to this event.
  final int startedEventId;

  /// User defined context for the workflow execution.
  final String? executionContext;
  final TaskList? taskList;

  /// The maximum amount of time the decision task can wait to be assigned to a
  /// worker.
  final String? taskListScheduleToStartTimeout;

  DecisionTaskCompletedEventAttributes({
    required this.scheduledEventId,
    required this.startedEventId,
    this.executionContext,
    this.taskList,
    this.taskListScheduleToStartTimeout,
  });

  factory DecisionTaskCompletedEventAttributes.fromJson(
      Map<String, dynamic> json) {
    return DecisionTaskCompletedEventAttributes(
      scheduledEventId: json['scheduledEventId'] as int,
      startedEventId: json['startedEventId'] as int,
      executionContext: json['executionContext'] as String?,
      taskList: json['taskList'] != null
          ? TaskList.fromJson(json['taskList'] as Map<String, dynamic>)
          : null,
      taskListScheduleToStartTimeout:
          json['taskListScheduleToStartTimeout'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final scheduledEventId = this.scheduledEventId;
    final startedEventId = this.startedEventId;
    final executionContext = this.executionContext;
    final taskList = this.taskList;
    final taskListScheduleToStartTimeout = this.taskListScheduleToStartTimeout;
    return {
      'scheduledEventId': scheduledEventId,
      'startedEventId': startedEventId,
      if (executionContext != null) 'executionContext': executionContext,
      if (taskList != null) 'taskList': taskList,
      if (taskListScheduleToStartTimeout != null)
        'taskListScheduleToStartTimeout': taskListScheduleToStartTimeout,
    };
  }
}

/// Provides details about the <code>DecisionTaskScheduled</code> event.
class DecisionTaskScheduledEventAttributes {
  /// The name of the task list in which the decision task was scheduled.
  final TaskList taskList;

  /// The maximum amount of time the decision task can wait to be assigned to a
  /// worker.
  final String? scheduleToStartTimeout;

  /// The maximum duration for this decision task. The task is considered timed
  /// out if it doesn't completed within this duration.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// <code>0</code>. You can use <code>NONE</code> to specify unlimited duration.
  final String? startToCloseTimeout;

  /// A task priority that, if set, specifies the priority for this decision task.
  /// Valid values are integers that range from Java's
  /// <code>Integer.MIN_VALUE</code> (-2147483648) to
  /// <code>Integer.MAX_VALUE</code> (2147483647). Higher numbers indicate higher
  /// priority.
  ///
  /// For more information about setting task priority, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/programming-priority.html">Setting
  /// Task Priority</a> in the <i>Amazon SWF Developer Guide</i>.
  final String? taskPriority;

  DecisionTaskScheduledEventAttributes({
    required this.taskList,
    this.scheduleToStartTimeout,
    this.startToCloseTimeout,
    this.taskPriority,
  });

  factory DecisionTaskScheduledEventAttributes.fromJson(
      Map<String, dynamic> json) {
    return DecisionTaskScheduledEventAttributes(
      taskList: TaskList.fromJson(json['taskList'] as Map<String, dynamic>),
      scheduleToStartTimeout: json['scheduleToStartTimeout'] as String?,
      startToCloseTimeout: json['startToCloseTimeout'] as String?,
      taskPriority: json['taskPriority'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final taskList = this.taskList;
    final scheduleToStartTimeout = this.scheduleToStartTimeout;
    final startToCloseTimeout = this.startToCloseTimeout;
    final taskPriority = this.taskPriority;
    return {
      'taskList': taskList,
      if (scheduleToStartTimeout != null)
        'scheduleToStartTimeout': scheduleToStartTimeout,
      if (startToCloseTimeout != null)
        'startToCloseTimeout': startToCloseTimeout,
      if (taskPriority != null) 'taskPriority': taskPriority,
    };
  }
}

/// Provides the details of the <code>DecisionTaskStarted</code> event.
class DecisionTaskStartedEventAttributes {
  /// The ID of the <code>DecisionTaskScheduled</code> event that was recorded
  /// when this decision task was scheduled. This information can be useful for
  /// diagnosing problems by tracing back the chain of events leading up to this
  /// event.
  final int scheduledEventId;

  /// Identity of the decider making the request. This enables diagnostic tracing
  /// when problems arise. The form of this identity is user defined.
  final String? identity;

  DecisionTaskStartedEventAttributes({
    required this.scheduledEventId,
    this.identity,
  });

  factory DecisionTaskStartedEventAttributes.fromJson(
      Map<String, dynamic> json) {
    return DecisionTaskStartedEventAttributes(
      scheduledEventId: json['scheduledEventId'] as int,
      identity: json['identity'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final scheduledEventId = this.scheduledEventId;
    final identity = this.identity;
    return {
      'scheduledEventId': scheduledEventId,
      if (identity != null) 'identity': identity,
    };
  }
}

/// Provides the details of the <code>DecisionTaskTimedOut</code> event.
class DecisionTaskTimedOutEventAttributes {
  /// The ID of the <code>DecisionTaskScheduled</code> event that was recorded
  /// when this decision task was scheduled. This information can be useful for
  /// diagnosing problems by tracing back the chain of events leading up to this
  /// event.
  final int scheduledEventId;

  /// The ID of the <code>DecisionTaskStarted</code> event recorded when this
  /// decision task was started. This information can be useful for diagnosing
  /// problems by tracing back the chain of events leading up to this event.
  final int startedEventId;

  /// The type of timeout that expired before the decision task could be
  /// completed.
  final DecisionTaskTimeoutType timeoutType;

  DecisionTaskTimedOutEventAttributes({
    required this.scheduledEventId,
    required this.startedEventId,
    required this.timeoutType,
  });

  factory DecisionTaskTimedOutEventAttributes.fromJson(
      Map<String, dynamic> json) {
    return DecisionTaskTimedOutEventAttributes(
      scheduledEventId: json['scheduledEventId'] as int,
      startedEventId: json['startedEventId'] as int,
      timeoutType: (json['timeoutType'] as String).toDecisionTaskTimeoutType(),
    );
  }

  Map<String, dynamic> toJson() {
    final scheduledEventId = this.scheduledEventId;
    final startedEventId = this.startedEventId;
    final timeoutType = this.timeoutType;
    return {
      'scheduledEventId': scheduledEventId,
      'startedEventId': startedEventId,
      'timeoutType': timeoutType.toValue(),
    };
  }
}

enum DecisionTaskTimeoutType {
  startToClose,
  scheduleToStart,
}

extension DecisionTaskTimeoutTypeValueExtension on DecisionTaskTimeoutType {
  String toValue() {
    switch (this) {
      case DecisionTaskTimeoutType.startToClose:
        return 'START_TO_CLOSE';
      case DecisionTaskTimeoutType.scheduleToStart:
        return 'SCHEDULE_TO_START';
    }
  }
}

extension DecisionTaskTimeoutTypeFromString on String {
  DecisionTaskTimeoutType toDecisionTaskTimeoutType() {
    switch (this) {
      case 'START_TO_CLOSE':
        return DecisionTaskTimeoutType.startToClose;
      case 'SCHEDULE_TO_START':
        return DecisionTaskTimeoutType.scheduleToStart;
    }
    throw Exception('$this is not known in enum DecisionTaskTimeoutType');
  }
}

enum DecisionType {
  scheduleActivityTask,
  requestCancelActivityTask,
  completeWorkflowExecution,
  failWorkflowExecution,
  cancelWorkflowExecution,
  continueAsNewWorkflowExecution,
  recordMarker,
  startTimer,
  cancelTimer,
  signalExternalWorkflowExecution,
  requestCancelExternalWorkflowExecution,
  startChildWorkflowExecution,
  scheduleLambdaFunction,
}

extension DecisionTypeValueExtension on DecisionType {
  String toValue() {
    switch (this) {
      case DecisionType.scheduleActivityTask:
        return 'ScheduleActivityTask';
      case DecisionType.requestCancelActivityTask:
        return 'RequestCancelActivityTask';
      case DecisionType.completeWorkflowExecution:
        return 'CompleteWorkflowExecution';
      case DecisionType.failWorkflowExecution:
        return 'FailWorkflowExecution';
      case DecisionType.cancelWorkflowExecution:
        return 'CancelWorkflowExecution';
      case DecisionType.continueAsNewWorkflowExecution:
        return 'ContinueAsNewWorkflowExecution';
      case DecisionType.recordMarker:
        return 'RecordMarker';
      case DecisionType.startTimer:
        return 'StartTimer';
      case DecisionType.cancelTimer:
        return 'CancelTimer';
      case DecisionType.signalExternalWorkflowExecution:
        return 'SignalExternalWorkflowExecution';
      case DecisionType.requestCancelExternalWorkflowExecution:
        return 'RequestCancelExternalWorkflowExecution';
      case DecisionType.startChildWorkflowExecution:
        return 'StartChildWorkflowExecution';
      case DecisionType.scheduleLambdaFunction:
        return 'ScheduleLambdaFunction';
    }
  }
}

extension DecisionTypeFromString on String {
  DecisionType toDecisionType() {
    switch (this) {
      case 'ScheduleActivityTask':
        return DecisionType.scheduleActivityTask;
      case 'RequestCancelActivityTask':
        return DecisionType.requestCancelActivityTask;
      case 'CompleteWorkflowExecution':
        return DecisionType.completeWorkflowExecution;
      case 'FailWorkflowExecution':
        return DecisionType.failWorkflowExecution;
      case 'CancelWorkflowExecution':
        return DecisionType.cancelWorkflowExecution;
      case 'ContinueAsNewWorkflowExecution':
        return DecisionType.continueAsNewWorkflowExecution;
      case 'RecordMarker':
        return DecisionType.recordMarker;
      case 'StartTimer':
        return DecisionType.startTimer;
      case 'CancelTimer':
        return DecisionType.cancelTimer;
      case 'SignalExternalWorkflowExecution':
        return DecisionType.signalExternalWorkflowExecution;
      case 'RequestCancelExternalWorkflowExecution':
        return DecisionType.requestCancelExternalWorkflowExecution;
      case 'StartChildWorkflowExecution':
        return DecisionType.startChildWorkflowExecution;
      case 'ScheduleLambdaFunction':
        return DecisionType.scheduleLambdaFunction;
    }
    throw Exception('$this is not known in enum DecisionType');
  }
}

/// Contains the configuration settings of a domain.
class DomainConfiguration {
  /// The retention period for workflow executions in this domain.
  final String workflowExecutionRetentionPeriodInDays;

  DomainConfiguration({
    required this.workflowExecutionRetentionPeriodInDays,
  });

  factory DomainConfiguration.fromJson(Map<String, dynamic> json) {
    return DomainConfiguration(
      workflowExecutionRetentionPeriodInDays:
          json['workflowExecutionRetentionPeriodInDays'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final workflowExecutionRetentionPeriodInDays =
        this.workflowExecutionRetentionPeriodInDays;
    return {
      'workflowExecutionRetentionPeriodInDays':
          workflowExecutionRetentionPeriodInDays,
    };
  }
}

/// Contains details of a domain.
class DomainDetail {
  /// The domain configuration. Currently, this includes only the domain's
  /// retention period.
  final DomainConfiguration configuration;

  /// The basic information about a domain, such as its name, status, and
  /// description.
  final DomainInfo domainInfo;

  DomainDetail({
    required this.configuration,
    required this.domainInfo,
  });

  factory DomainDetail.fromJson(Map<String, dynamic> json) {
    return DomainDetail(
      configuration: DomainConfiguration.fromJson(
          json['configuration'] as Map<String, dynamic>),
      domainInfo:
          DomainInfo.fromJson(json['domainInfo'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    final domainInfo = this.domainInfo;
    return {
      'configuration': configuration,
      'domainInfo': domainInfo,
    };
  }
}

/// Contains general information about a domain.
class DomainInfo {
  /// The name of the domain. This name is unique within the account.
  final String name;

  /// The status of the domain:
  ///
  /// <ul>
  /// <li>
  /// <code>REGISTERED</code> – The domain is properly registered and available.
  /// You can use this domain for registering types and creating new workflow
  /// executions.
  /// </li>
  /// <li>
  /// <code>DEPRECATED</code> – The domain was deprecated using
  /// <a>DeprecateDomain</a>, but is still in use. You should not create new
  /// workflow executions in this domain.
  /// </li>
  /// </ul>
  final RegistrationStatus status;

  /// The ARN of the domain.
  final String? arn;

  /// The description of the domain provided through <a>RegisterDomain</a>.
  final String? description;

  DomainInfo({
    required this.name,
    required this.status,
    this.arn,
    this.description,
  });

  factory DomainInfo.fromJson(Map<String, dynamic> json) {
    return DomainInfo(
      name: json['name'] as String,
      status: (json['status'] as String).toRegistrationStatus(),
      arn: json['arn'] as String?,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final status = this.status;
    final arn = this.arn;
    final description = this.description;
    return {
      'name': name,
      'status': status.toValue(),
      if (arn != null) 'arn': arn,
      if (description != null) 'description': description,
    };
  }
}

/// Contains a paginated collection of DomainInfo structures.
class DomainInfos {
  /// A list of DomainInfo structures.
  final List<DomainInfo> domainInfos;

  /// If a <code>NextPageToken</code> was returned by a previous call, there are
  /// more results available. To retrieve the next page of results, make the call
  /// again using the returned token in <code>nextPageToken</code>. Keep all other
  /// arguments unchanged.
  ///
  /// The configured <code>maximumPageSize</code> determines how many results can
  /// be returned in a single call.
  final String? nextPageToken;

  DomainInfos({
    required this.domainInfos,
    this.nextPageToken,
  });

  factory DomainInfos.fromJson(Map<String, dynamic> json) {
    return DomainInfos(
      domainInfos: (json['domainInfos'] as List)
          .whereNotNull()
          .map((e) => DomainInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPageToken: json['nextPageToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final domainInfos = this.domainInfos;
    final nextPageToken = this.nextPageToken;
    return {
      'domainInfos': domainInfos,
      if (nextPageToken != null) 'nextPageToken': nextPageToken,
    };
  }
}

enum EventType {
  workflowExecutionStarted,
  workflowExecutionCancelRequested,
  workflowExecutionCompleted,
  completeWorkflowExecutionFailed,
  workflowExecutionFailed,
  failWorkflowExecutionFailed,
  workflowExecutionTimedOut,
  workflowExecutionCanceled,
  cancelWorkflowExecutionFailed,
  workflowExecutionContinuedAsNew,
  continueAsNewWorkflowExecutionFailed,
  workflowExecutionTerminated,
  decisionTaskScheduled,
  decisionTaskStarted,
  decisionTaskCompleted,
  decisionTaskTimedOut,
  activityTaskScheduled,
  scheduleActivityTaskFailed,
  activityTaskStarted,
  activityTaskCompleted,
  activityTaskFailed,
  activityTaskTimedOut,
  activityTaskCanceled,
  activityTaskCancelRequested,
  requestCancelActivityTaskFailed,
  workflowExecutionSignaled,
  markerRecorded,
  recordMarkerFailed,
  timerStarted,
  startTimerFailed,
  timerFired,
  timerCanceled,
  cancelTimerFailed,
  startChildWorkflowExecutionInitiated,
  startChildWorkflowExecutionFailed,
  childWorkflowExecutionStarted,
  childWorkflowExecutionCompleted,
  childWorkflowExecutionFailed,
  childWorkflowExecutionTimedOut,
  childWorkflowExecutionCanceled,
  childWorkflowExecutionTerminated,
  signalExternalWorkflowExecutionInitiated,
  signalExternalWorkflowExecutionFailed,
  externalWorkflowExecutionSignaled,
  requestCancelExternalWorkflowExecutionInitiated,
  requestCancelExternalWorkflowExecutionFailed,
  externalWorkflowExecutionCancelRequested,
  lambdaFunctionScheduled,
  lambdaFunctionStarted,
  lambdaFunctionCompleted,
  lambdaFunctionFailed,
  lambdaFunctionTimedOut,
  scheduleLambdaFunctionFailed,
  startLambdaFunctionFailed,
}

extension EventTypeValueExtension on EventType {
  String toValue() {
    switch (this) {
      case EventType.workflowExecutionStarted:
        return 'WorkflowExecutionStarted';
      case EventType.workflowExecutionCancelRequested:
        return 'WorkflowExecutionCancelRequested';
      case EventType.workflowExecutionCompleted:
        return 'WorkflowExecutionCompleted';
      case EventType.completeWorkflowExecutionFailed:
        return 'CompleteWorkflowExecutionFailed';
      case EventType.workflowExecutionFailed:
        return 'WorkflowExecutionFailed';
      case EventType.failWorkflowExecutionFailed:
        return 'FailWorkflowExecutionFailed';
      case EventType.workflowExecutionTimedOut:
        return 'WorkflowExecutionTimedOut';
      case EventType.workflowExecutionCanceled:
        return 'WorkflowExecutionCanceled';
      case EventType.cancelWorkflowExecutionFailed:
        return 'CancelWorkflowExecutionFailed';
      case EventType.workflowExecutionContinuedAsNew:
        return 'WorkflowExecutionContinuedAsNew';
      case EventType.continueAsNewWorkflowExecutionFailed:
        return 'ContinueAsNewWorkflowExecutionFailed';
      case EventType.workflowExecutionTerminated:
        return 'WorkflowExecutionTerminated';
      case EventType.decisionTaskScheduled:
        return 'DecisionTaskScheduled';
      case EventType.decisionTaskStarted:
        return 'DecisionTaskStarted';
      case EventType.decisionTaskCompleted:
        return 'DecisionTaskCompleted';
      case EventType.decisionTaskTimedOut:
        return 'DecisionTaskTimedOut';
      case EventType.activityTaskScheduled:
        return 'ActivityTaskScheduled';
      case EventType.scheduleActivityTaskFailed:
        return 'ScheduleActivityTaskFailed';
      case EventType.activityTaskStarted:
        return 'ActivityTaskStarted';
      case EventType.activityTaskCompleted:
        return 'ActivityTaskCompleted';
      case EventType.activityTaskFailed:
        return 'ActivityTaskFailed';
      case EventType.activityTaskTimedOut:
        return 'ActivityTaskTimedOut';
      case EventType.activityTaskCanceled:
        return 'ActivityTaskCanceled';
      case EventType.activityTaskCancelRequested:
        return 'ActivityTaskCancelRequested';
      case EventType.requestCancelActivityTaskFailed:
        return 'RequestCancelActivityTaskFailed';
      case EventType.workflowExecutionSignaled:
        return 'WorkflowExecutionSignaled';
      case EventType.markerRecorded:
        return 'MarkerRecorded';
      case EventType.recordMarkerFailed:
        return 'RecordMarkerFailed';
      case EventType.timerStarted:
        return 'TimerStarted';
      case EventType.startTimerFailed:
        return 'StartTimerFailed';
      case EventType.timerFired:
        return 'TimerFired';
      case EventType.timerCanceled:
        return 'TimerCanceled';
      case EventType.cancelTimerFailed:
        return 'CancelTimerFailed';
      case EventType.startChildWorkflowExecutionInitiated:
        return 'StartChildWorkflowExecutionInitiated';
      case EventType.startChildWorkflowExecutionFailed:
        return 'StartChildWorkflowExecutionFailed';
      case EventType.childWorkflowExecutionStarted:
        return 'ChildWorkflowExecutionStarted';
      case EventType.childWorkflowExecutionCompleted:
        return 'ChildWorkflowExecutionCompleted';
      case EventType.childWorkflowExecutionFailed:
        return 'ChildWorkflowExecutionFailed';
      case EventType.childWorkflowExecutionTimedOut:
        return 'ChildWorkflowExecutionTimedOut';
      case EventType.childWorkflowExecutionCanceled:
        return 'ChildWorkflowExecutionCanceled';
      case EventType.childWorkflowExecutionTerminated:
        return 'ChildWorkflowExecutionTerminated';
      case EventType.signalExternalWorkflowExecutionInitiated:
        return 'SignalExternalWorkflowExecutionInitiated';
      case EventType.signalExternalWorkflowExecutionFailed:
        return 'SignalExternalWorkflowExecutionFailed';
      case EventType.externalWorkflowExecutionSignaled:
        return 'ExternalWorkflowExecutionSignaled';
      case EventType.requestCancelExternalWorkflowExecutionInitiated:
        return 'RequestCancelExternalWorkflowExecutionInitiated';
      case EventType.requestCancelExternalWorkflowExecutionFailed:
        return 'RequestCancelExternalWorkflowExecutionFailed';
      case EventType.externalWorkflowExecutionCancelRequested:
        return 'ExternalWorkflowExecutionCancelRequested';
      case EventType.lambdaFunctionScheduled:
        return 'LambdaFunctionScheduled';
      case EventType.lambdaFunctionStarted:
        return 'LambdaFunctionStarted';
      case EventType.lambdaFunctionCompleted:
        return 'LambdaFunctionCompleted';
      case EventType.lambdaFunctionFailed:
        return 'LambdaFunctionFailed';
      case EventType.lambdaFunctionTimedOut:
        return 'LambdaFunctionTimedOut';
      case EventType.scheduleLambdaFunctionFailed:
        return 'ScheduleLambdaFunctionFailed';
      case EventType.startLambdaFunctionFailed:
        return 'StartLambdaFunctionFailed';
    }
  }
}

extension EventTypeFromString on String {
  EventType toEventType() {
    switch (this) {
      case 'WorkflowExecutionStarted':
        return EventType.workflowExecutionStarted;
      case 'WorkflowExecutionCancelRequested':
        return EventType.workflowExecutionCancelRequested;
      case 'WorkflowExecutionCompleted':
        return EventType.workflowExecutionCompleted;
      case 'CompleteWorkflowExecutionFailed':
        return EventType.completeWorkflowExecutionFailed;
      case 'WorkflowExecutionFailed':
        return EventType.workflowExecutionFailed;
      case 'FailWorkflowExecutionFailed':
        return EventType.failWorkflowExecutionFailed;
      case 'WorkflowExecutionTimedOut':
        return EventType.workflowExecutionTimedOut;
      case 'WorkflowExecutionCanceled':
        return EventType.workflowExecutionCanceled;
      case 'CancelWorkflowExecutionFailed':
        return EventType.cancelWorkflowExecutionFailed;
      case 'WorkflowExecutionContinuedAsNew':
        return EventType.workflowExecutionContinuedAsNew;
      case 'ContinueAsNewWorkflowExecutionFailed':
        return EventType.continueAsNewWorkflowExecutionFailed;
      case 'WorkflowExecutionTerminated':
        return EventType.workflowExecutionTerminated;
      case 'DecisionTaskScheduled':
        return EventType.decisionTaskScheduled;
      case 'DecisionTaskStarted':
        return EventType.decisionTaskStarted;
      case 'DecisionTaskCompleted':
        return EventType.decisionTaskCompleted;
      case 'DecisionTaskTimedOut':
        return EventType.decisionTaskTimedOut;
      case 'ActivityTaskScheduled':
        return EventType.activityTaskScheduled;
      case 'ScheduleActivityTaskFailed':
        return EventType.scheduleActivityTaskFailed;
      case 'ActivityTaskStarted':
        return EventType.activityTaskStarted;
      case 'ActivityTaskCompleted':
        return EventType.activityTaskCompleted;
      case 'ActivityTaskFailed':
        return EventType.activityTaskFailed;
      case 'ActivityTaskTimedOut':
        return EventType.activityTaskTimedOut;
      case 'ActivityTaskCanceled':
        return EventType.activityTaskCanceled;
      case 'ActivityTaskCancelRequested':
        return EventType.activityTaskCancelRequested;
      case 'RequestCancelActivityTaskFailed':
        return EventType.requestCancelActivityTaskFailed;
      case 'WorkflowExecutionSignaled':
        return EventType.workflowExecutionSignaled;
      case 'MarkerRecorded':
        return EventType.markerRecorded;
      case 'RecordMarkerFailed':
        return EventType.recordMarkerFailed;
      case 'TimerStarted':
        return EventType.timerStarted;
      case 'StartTimerFailed':
        return EventType.startTimerFailed;
      case 'TimerFired':
        return EventType.timerFired;
      case 'TimerCanceled':
        return EventType.timerCanceled;
      case 'CancelTimerFailed':
        return EventType.cancelTimerFailed;
      case 'StartChildWorkflowExecutionInitiated':
        return EventType.startChildWorkflowExecutionInitiated;
      case 'StartChildWorkflowExecutionFailed':
        return EventType.startChildWorkflowExecutionFailed;
      case 'ChildWorkflowExecutionStarted':
        return EventType.childWorkflowExecutionStarted;
      case 'ChildWorkflowExecutionCompleted':
        return EventType.childWorkflowExecutionCompleted;
      case 'ChildWorkflowExecutionFailed':
        return EventType.childWorkflowExecutionFailed;
      case 'ChildWorkflowExecutionTimedOut':
        return EventType.childWorkflowExecutionTimedOut;
      case 'ChildWorkflowExecutionCanceled':
        return EventType.childWorkflowExecutionCanceled;
      case 'ChildWorkflowExecutionTerminated':
        return EventType.childWorkflowExecutionTerminated;
      case 'SignalExternalWorkflowExecutionInitiated':
        return EventType.signalExternalWorkflowExecutionInitiated;
      case 'SignalExternalWorkflowExecutionFailed':
        return EventType.signalExternalWorkflowExecutionFailed;
      case 'ExternalWorkflowExecutionSignaled':
        return EventType.externalWorkflowExecutionSignaled;
      case 'RequestCancelExternalWorkflowExecutionInitiated':
        return EventType.requestCancelExternalWorkflowExecutionInitiated;
      case 'RequestCancelExternalWorkflowExecutionFailed':
        return EventType.requestCancelExternalWorkflowExecutionFailed;
      case 'ExternalWorkflowExecutionCancelRequested':
        return EventType.externalWorkflowExecutionCancelRequested;
      case 'LambdaFunctionScheduled':
        return EventType.lambdaFunctionScheduled;
      case 'LambdaFunctionStarted':
        return EventType.lambdaFunctionStarted;
      case 'LambdaFunctionCompleted':
        return EventType.lambdaFunctionCompleted;
      case 'LambdaFunctionFailed':
        return EventType.lambdaFunctionFailed;
      case 'LambdaFunctionTimedOut':
        return EventType.lambdaFunctionTimedOut;
      case 'ScheduleLambdaFunctionFailed':
        return EventType.scheduleLambdaFunctionFailed;
      case 'StartLambdaFunctionFailed':
        return EventType.startLambdaFunctionFailed;
    }
    throw Exception('$this is not known in enum EventType');
  }
}

enum ExecutionStatus {
  open,
  closed,
}

extension ExecutionStatusValueExtension on ExecutionStatus {
  String toValue() {
    switch (this) {
      case ExecutionStatus.open:
        return 'OPEN';
      case ExecutionStatus.closed:
        return 'CLOSED';
    }
  }
}

extension ExecutionStatusFromString on String {
  ExecutionStatus toExecutionStatus() {
    switch (this) {
      case 'OPEN':
        return ExecutionStatus.open;
      case 'CLOSED':
        return ExecutionStatus.closed;
    }
    throw Exception('$this is not known in enum ExecutionStatus');
  }
}

/// Used to filter the workflow executions in visibility APIs by various
/// time-based rules. Each parameter, if specified, defines a rule that must be
/// satisfied by each returned query result. The parameter values are in the <a
/// href="https://en.wikipedia.org/wiki/Unix_time">Unix Time format</a>. For
/// example: <code>"oldestDate": 1325376070.</code>
class ExecutionTimeFilter {
  /// Specifies the oldest start or close date and time to return.
  final DateTime oldestDate;

  /// Specifies the latest start or close date and time to return.
  final DateTime? latestDate;

  ExecutionTimeFilter({
    required this.oldestDate,
    this.latestDate,
  });

  Map<String, dynamic> toJson() {
    final oldestDate = this.oldestDate;
    final latestDate = this.latestDate;
    return {
      'oldestDate': unixTimestampToJson(oldestDate),
      if (latestDate != null) 'latestDate': unixTimestampToJson(latestDate),
    };
  }
}

/// Provides the details of the
/// <code>ExternalWorkflowExecutionCancelRequested</code> event.
class ExternalWorkflowExecutionCancelRequestedEventAttributes {
  /// The ID of the <code>RequestCancelExternalWorkflowExecutionInitiated</code>
  /// event corresponding to the
  /// <code>RequestCancelExternalWorkflowExecution</code> decision to cancel this
  /// external workflow execution. This information can be useful for diagnosing
  /// problems by tracing back the chain of events leading up to this event.
  final int initiatedEventId;

  /// The external workflow execution to which the cancellation request was
  /// delivered.
  final WorkflowExecution workflowExecution;

  ExternalWorkflowExecutionCancelRequestedEventAttributes({
    required this.initiatedEventId,
    required this.workflowExecution,
  });

  factory ExternalWorkflowExecutionCancelRequestedEventAttributes.fromJson(
      Map<String, dynamic> json) {
    return ExternalWorkflowExecutionCancelRequestedEventAttributes(
      initiatedEventId: json['initiatedEventId'] as int,
      workflowExecution: WorkflowExecution.fromJson(
          json['workflowExecution'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final initiatedEventId = this.initiatedEventId;
    final workflowExecution = this.workflowExecution;
    return {
      'initiatedEventId': initiatedEventId,
      'workflowExecution': workflowExecution,
    };
  }
}

/// Provides the details of the <code>ExternalWorkflowExecutionSignaled</code>
/// event.
class ExternalWorkflowExecutionSignaledEventAttributes {
  /// The ID of the <code>SignalExternalWorkflowExecutionInitiated</code> event
  /// corresponding to the <code>SignalExternalWorkflowExecution</code> decision
  /// to request this signal. This information can be useful for diagnosing
  /// problems by tracing back the chain of events leading up to this event.
  final int initiatedEventId;

  /// The external workflow execution that the signal was delivered to.
  final WorkflowExecution workflowExecution;

  ExternalWorkflowExecutionSignaledEventAttributes({
    required this.initiatedEventId,
    required this.workflowExecution,
  });

  factory ExternalWorkflowExecutionSignaledEventAttributes.fromJson(
      Map<String, dynamic> json) {
    return ExternalWorkflowExecutionSignaledEventAttributes(
      initiatedEventId: json['initiatedEventId'] as int,
      workflowExecution: WorkflowExecution.fromJson(
          json['workflowExecution'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final initiatedEventId = this.initiatedEventId;
    final workflowExecution = this.workflowExecution;
    return {
      'initiatedEventId': initiatedEventId,
      'workflowExecution': workflowExecution,
    };
  }
}

/// Provides the details of the <code>FailWorkflowExecution</code> decision.
///
/// <b>Access Control</b>
///
/// You can use IAM policies to control this decision's access to Amazon SWF
/// resources as follows:
///
/// <ul>
/// <li>
/// Use a <code>Resource</code> element with the domain name to limit the action
/// to only specified domains.
/// </li>
/// <li>
/// Use an <code>Action</code> element to allow or deny permission to call this
/// action.
/// </li>
/// <li>
/// You cannot use an IAM policy to constrain this action's parameters.
/// </li>
/// </ul>
/// If the caller doesn't have sufficient permissions to invoke the action, or
/// the parameter values fall outside the specified constraints, the action
/// fails. The associated event attribute's <code>cause</code> parameter is set
/// to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
/// policies, see <a
/// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
/// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
/// Developer Guide</i>.
class FailWorkflowExecutionDecisionAttributes {
  /// Details of the failure.
  final String? details;

  /// A descriptive reason for the failure that may help in diagnostics.
  final String? reason;

  FailWorkflowExecutionDecisionAttributes({
    this.details,
    this.reason,
  });

  Map<String, dynamic> toJson() {
    final details = this.details;
    final reason = this.reason;
    return {
      if (details != null) 'details': details,
      if (reason != null) 'reason': reason,
    };
  }
}

enum FailWorkflowExecutionFailedCause {
  unhandledDecision,
  operationNotPermitted,
}

extension FailWorkflowExecutionFailedCauseValueExtension
    on FailWorkflowExecutionFailedCause {
  String toValue() {
    switch (this) {
      case FailWorkflowExecutionFailedCause.unhandledDecision:
        return 'UNHANDLED_DECISION';
      case FailWorkflowExecutionFailedCause.operationNotPermitted:
        return 'OPERATION_NOT_PERMITTED';
    }
  }
}

extension FailWorkflowExecutionFailedCauseFromString on String {
  FailWorkflowExecutionFailedCause toFailWorkflowExecutionFailedCause() {
    switch (this) {
      case 'UNHANDLED_DECISION':
        return FailWorkflowExecutionFailedCause.unhandledDecision;
      case 'OPERATION_NOT_PERMITTED':
        return FailWorkflowExecutionFailedCause.operationNotPermitted;
    }
    throw Exception(
        '$this is not known in enum FailWorkflowExecutionFailedCause');
  }
}

/// Provides the details of the <code>FailWorkflowExecutionFailed</code> event.
class FailWorkflowExecutionFailedEventAttributes {
  /// The cause of the failure. This information is generated by the system and
  /// can be useful for diagnostic purposes.
  /// <note>
  /// If <code>cause</code> is set to <code>OPERATION_NOT_PERMITTED</code>, the
  /// decision failed because it lacked sufficient permissions. For details and
  /// example IAM policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  /// </note>
  final FailWorkflowExecutionFailedCause cause;

  /// The ID of the <code>DecisionTaskCompleted</code> event corresponding to the
  /// decision task that resulted in the <code>FailWorkflowExecution</code>
  /// decision to fail this execution. This information can be useful for
  /// diagnosing problems by tracing back the chain of events leading up to this
  /// event.
  final int decisionTaskCompletedEventId;

  FailWorkflowExecutionFailedEventAttributes({
    required this.cause,
    required this.decisionTaskCompletedEventId,
  });

  factory FailWorkflowExecutionFailedEventAttributes.fromJson(
      Map<String, dynamic> json) {
    return FailWorkflowExecutionFailedEventAttributes(
      cause: (json['cause'] as String).toFailWorkflowExecutionFailedCause(),
      decisionTaskCompletedEventId: json['decisionTaskCompletedEventId'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final cause = this.cause;
    final decisionTaskCompletedEventId = this.decisionTaskCompletedEventId;
    return {
      'cause': cause.toValue(),
      'decisionTaskCompletedEventId': decisionTaskCompletedEventId,
    };
  }
}

/// Paginated representation of a workflow history for a workflow execution.
/// This is the up to date, complete and authoritative record of the events
/// related to all tasks and events in the life of the workflow execution.
class History {
  /// The list of history events.
  final List<HistoryEvent> events;

  /// If a <code>NextPageToken</code> was returned by a previous call, there are
  /// more results available. To retrieve the next page of results, make the call
  /// again using the returned token in <code>nextPageToken</code>. Keep all other
  /// arguments unchanged.
  ///
  /// The configured <code>maximumPageSize</code> determines how many results can
  /// be returned in a single call.
  final String? nextPageToken;

  History({
    required this.events,
    this.nextPageToken,
  });

  factory History.fromJson(Map<String, dynamic> json) {
    return History(
      events: (json['events'] as List)
          .whereNotNull()
          .map((e) => HistoryEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPageToken: json['nextPageToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final events = this.events;
    final nextPageToken = this.nextPageToken;
    return {
      'events': events,
      if (nextPageToken != null) 'nextPageToken': nextPageToken,
    };
  }
}

/// Event within a workflow execution. A history event can be one of these
/// types:
///
/// <ul>
/// <li>
/// <code>ActivityTaskCancelRequested</code> – A
/// <code>RequestCancelActivityTask</code> decision was received by the system.
/// </li>
/// <li>
/// <code>ActivityTaskCanceled</code> – The activity task was successfully
/// canceled.
/// </li>
/// <li>
/// <code>ActivityTaskCompleted</code> – An activity worker successfully
/// completed an activity task by calling <a>RespondActivityTaskCompleted</a>.
/// </li>
/// <li>
/// <code>ActivityTaskFailed</code> – An activity worker failed an activity task
/// by calling <a>RespondActivityTaskFailed</a>.
/// </li>
/// <li>
/// <code>ActivityTaskScheduled</code> – An activity task was scheduled for
/// execution.
/// </li>
/// <li>
/// <code>ActivityTaskStarted</code> – The scheduled activity task was
/// dispatched to a worker.
/// </li>
/// <li>
/// <code>ActivityTaskTimedOut</code> – The activity task timed out.
/// </li>
/// <li>
/// <code>CancelTimerFailed</code> – Failed to process CancelTimer decision.
/// This happens when the decision isn't configured properly, for example no
/// timer exists with the specified timer Id.
/// </li>
/// <li>
/// <code>CancelWorkflowExecutionFailed</code> – A request to cancel a workflow
/// execution failed.
/// </li>
/// <li>
/// <code>ChildWorkflowExecutionCanceled</code> – A child workflow execution,
/// started by this workflow execution, was canceled and closed.
/// </li>
/// <li>
/// <code>ChildWorkflowExecutionCompleted</code> – A child workflow execution,
/// started by this workflow execution, completed successfully and was closed.
/// </li>
/// <li>
/// <code>ChildWorkflowExecutionFailed</code> – A child workflow execution,
/// started by this workflow execution, failed to complete successfully and was
/// closed.
/// </li>
/// <li>
/// <code>ChildWorkflowExecutionStarted</code> – A child workflow execution was
/// successfully started.
/// </li>
/// <li>
/// <code>ChildWorkflowExecutionTerminated</code> – A child workflow execution,
/// started by this workflow execution, was terminated.
/// </li>
/// <li>
/// <code>ChildWorkflowExecutionTimedOut</code> – A child workflow execution,
/// started by this workflow execution, timed out and was closed.
/// </li>
/// <li>
/// <code>CompleteWorkflowExecutionFailed</code> – The workflow execution failed
/// to complete.
/// </li>
/// <li>
/// <code>ContinueAsNewWorkflowExecutionFailed</code> – The workflow execution
/// failed to complete after being continued as a new workflow execution.
/// </li>
/// <li>
/// <code>DecisionTaskCompleted</code> – The decider successfully completed a
/// decision task by calling <a>RespondDecisionTaskCompleted</a>.
/// </li>
/// <li>
/// <code>DecisionTaskScheduled</code> – A decision task was scheduled for the
/// workflow execution.
/// </li>
/// <li>
/// <code>DecisionTaskStarted</code> – The decision task was dispatched to a
/// decider.
/// </li>
/// <li>
/// <code>DecisionTaskTimedOut</code> – The decision task timed out.
/// </li>
/// <li>
/// <code>ExternalWorkflowExecutionCancelRequested</code> – Request to cancel an
/// external workflow execution was successfully delivered to the target
/// execution.
/// </li>
/// <li>
/// <code>ExternalWorkflowExecutionSignaled</code> – A signal, requested by this
/// workflow execution, was successfully delivered to the target external
/// workflow execution.
/// </li>
/// <li>
/// <code>FailWorkflowExecutionFailed</code> – A request to mark a workflow
/// execution as failed, itself failed.
/// </li>
/// <li>
/// <code>MarkerRecorded</code> – A marker was recorded in the workflow history
/// as the result of a <code>RecordMarker</code> decision.
/// </li>
/// <li>
/// <code>RecordMarkerFailed</code> – A <code>RecordMarker</code> decision was
/// returned as failed.
/// </li>
/// <li>
/// <code>RequestCancelActivityTaskFailed</code> – Failed to process
/// RequestCancelActivityTask decision. This happens when the decision isn't
/// configured properly.
/// </li>
/// <li>
/// <code>RequestCancelExternalWorkflowExecutionFailed</code> – Request to
/// cancel an external workflow execution failed.
/// </li>
/// <li>
/// <code>RequestCancelExternalWorkflowExecutionInitiated</code> – A request was
/// made to request the cancellation of an external workflow execution.
/// </li>
/// <li>
/// <code>ScheduleActivityTaskFailed</code> – Failed to process
/// ScheduleActivityTask decision. This happens when the decision isn't
/// configured properly, for example the activity type specified isn't
/// registered.
/// </li>
/// <li>
/// <code>SignalExternalWorkflowExecutionFailed</code> – The request to signal
/// an external workflow execution failed.
/// </li>
/// <li>
/// <code>SignalExternalWorkflowExecutionInitiated</code> – A request to signal
/// an external workflow was made.
/// </li>
/// <li>
/// <code>StartActivityTaskFailed</code> – A scheduled activity task failed to
/// start.
/// </li>
/// <li>
/// <code>StartChildWorkflowExecutionFailed</code> – Failed to process
/// StartChildWorkflowExecution decision. This happens when the decision isn't
/// configured properly, for example the workflow type specified isn't
/// registered.
/// </li>
/// <li>
/// <code>StartChildWorkflowExecutionInitiated</code> – A request was made to
/// start a child workflow execution.
/// </li>
/// <li>
/// <code>StartTimerFailed</code> – Failed to process StartTimer decision. This
/// happens when the decision isn't configured properly, for example a timer
/// already exists with the specified timer Id.
/// </li>
/// <li>
/// <code>TimerCanceled</code> – A timer, previously started for this workflow
/// execution, was successfully canceled.
/// </li>
/// <li>
/// <code>TimerFired</code> – A timer, previously started for this workflow
/// execution, fired.
/// </li>
/// <li>
/// <code>TimerStarted</code> – A timer was started for the workflow execution
/// due to a <code>StartTimer</code> decision.
/// </li>
/// <li>
/// <code>WorkflowExecutionCancelRequested</code> – A request to cancel this
/// workflow execution was made.
/// </li>
/// <li>
/// <code>WorkflowExecutionCanceled</code> – The workflow execution was
/// successfully canceled and closed.
/// </li>
/// <li>
/// <code>WorkflowExecutionCompleted</code> – The workflow execution was closed
/// due to successful completion.
/// </li>
/// <li>
/// <code>WorkflowExecutionContinuedAsNew</code> – The workflow execution was
/// closed and a new execution of the same type was created with the same
/// workflowId.
/// </li>
/// <li>
/// <code>WorkflowExecutionFailed</code> – The workflow execution closed due to
/// a failure.
/// </li>
/// <li>
/// <code>WorkflowExecutionSignaled</code> – An external signal was received for
/// the workflow execution.
/// </li>
/// <li>
/// <code>WorkflowExecutionStarted</code> – The workflow execution was started.
/// </li>
/// <li>
/// <code>WorkflowExecutionTerminated</code> – The workflow execution was
/// terminated.
/// </li>
/// <li>
/// <code>WorkflowExecutionTimedOut</code> – The workflow execution was closed
/// because a time out was exceeded.
/// </li>
/// </ul>
class HistoryEvent {
  /// The system generated ID of the event. This ID uniquely identifies the event
  /// with in the workflow execution history.
  final int eventId;

  /// The date and time when the event occurred.
  final DateTime eventTimestamp;

  /// The type of the history event.
  final EventType eventType;

  /// If the event is of type <code>ActivityTaskcancelRequested</code> then this
  /// member is set and provides detailed information about the event. It isn't
  /// set for other event types.
  final ActivityTaskCancelRequestedEventAttributes?
      activityTaskCancelRequestedEventAttributes;

  /// If the event is of type <code>ActivityTaskCanceled</code> then this member
  /// is set and provides detailed information about the event. It isn't set for
  /// other event types.
  final ActivityTaskCanceledEventAttributes?
      activityTaskCanceledEventAttributes;

  /// If the event is of type <code>ActivityTaskCompleted</code> then this member
  /// is set and provides detailed information about the event. It isn't set for
  /// other event types.
  final ActivityTaskCompletedEventAttributes?
      activityTaskCompletedEventAttributes;

  /// If the event is of type <code>ActivityTaskFailed</code> then this member is
  /// set and provides detailed information about the event. It isn't set for
  /// other event types.
  final ActivityTaskFailedEventAttributes? activityTaskFailedEventAttributes;

  /// If the event is of type <code>ActivityTaskScheduled</code> then this member
  /// is set and provides detailed information about the event. It isn't set for
  /// other event types.
  final ActivityTaskScheduledEventAttributes?
      activityTaskScheduledEventAttributes;

  /// If the event is of type <code>ActivityTaskStarted</code> then this member is
  /// set and provides detailed information about the event. It isn't set for
  /// other event types.
  final ActivityTaskStartedEventAttributes? activityTaskStartedEventAttributes;

  /// If the event is of type <code>ActivityTaskTimedOut</code> then this member
  /// is set and provides detailed information about the event. It isn't set for
  /// other event types.
  final ActivityTaskTimedOutEventAttributes?
      activityTaskTimedOutEventAttributes;

  /// If the event is of type <code>CancelTimerFailed</code> then this member is
  /// set and provides detailed information about the event. It isn't set for
  /// other event types.
  final CancelTimerFailedEventAttributes? cancelTimerFailedEventAttributes;

  /// If the event is of type <code>CancelWorkflowExecutionFailed</code> then this
  /// member is set and provides detailed information about the event. It isn't
  /// set for other event types.
  final CancelWorkflowExecutionFailedEventAttributes?
      cancelWorkflowExecutionFailedEventAttributes;

  /// If the event is of type <code>ChildWorkflowExecutionCanceled</code> then
  /// this member is set and provides detailed information about the event. It
  /// isn't set for other event types.
  final ChildWorkflowExecutionCanceledEventAttributes?
      childWorkflowExecutionCanceledEventAttributes;

  /// If the event is of type <code>ChildWorkflowExecutionCompleted</code> then
  /// this member is set and provides detailed information about the event. It
  /// isn't set for other event types.
  final ChildWorkflowExecutionCompletedEventAttributes?
      childWorkflowExecutionCompletedEventAttributes;

  /// If the event is of type <code>ChildWorkflowExecutionFailed</code> then this
  /// member is set and provides detailed information about the event. It isn't
  /// set for other event types.
  final ChildWorkflowExecutionFailedEventAttributes?
      childWorkflowExecutionFailedEventAttributes;

  /// If the event is of type <code>ChildWorkflowExecutionStarted</code> then this
  /// member is set and provides detailed information about the event. It isn't
  /// set for other event types.
  final ChildWorkflowExecutionStartedEventAttributes?
      childWorkflowExecutionStartedEventAttributes;

  /// If the event is of type <code>ChildWorkflowExecutionTerminated</code> then
  /// this member is set and provides detailed information about the event. It
  /// isn't set for other event types.
  final ChildWorkflowExecutionTerminatedEventAttributes?
      childWorkflowExecutionTerminatedEventAttributes;

  /// If the event is of type <code>ChildWorkflowExecutionTimedOut</code> then
  /// this member is set and provides detailed information about the event. It
  /// isn't set for other event types.
  final ChildWorkflowExecutionTimedOutEventAttributes?
      childWorkflowExecutionTimedOutEventAttributes;

  /// If the event is of type <code>CompleteWorkflowExecutionFailed</code> then
  /// this member is set and provides detailed information about the event. It
  /// isn't set for other event types.
  final CompleteWorkflowExecutionFailedEventAttributes?
      completeWorkflowExecutionFailedEventAttributes;

  /// If the event is of type <code>ContinueAsNewWorkflowExecutionFailed</code>
  /// then this member is set and provides detailed information about the event.
  /// It isn't set for other event types.
  final ContinueAsNewWorkflowExecutionFailedEventAttributes?
      continueAsNewWorkflowExecutionFailedEventAttributes;

  /// If the event is of type <code>DecisionTaskCompleted</code> then this member
  /// is set and provides detailed information about the event. It isn't set for
  /// other event types.
  final DecisionTaskCompletedEventAttributes?
      decisionTaskCompletedEventAttributes;

  /// If the event is of type <code>DecisionTaskScheduled</code> then this member
  /// is set and provides detailed information about the event. It isn't set for
  /// other event types.
  final DecisionTaskScheduledEventAttributes?
      decisionTaskScheduledEventAttributes;

  /// If the event is of type <code>DecisionTaskStarted</code> then this member is
  /// set and provides detailed information about the event. It isn't set for
  /// other event types.
  final DecisionTaskStartedEventAttributes? decisionTaskStartedEventAttributes;

  /// If the event is of type <code>DecisionTaskTimedOut</code> then this member
  /// is set and provides detailed information about the event. It isn't set for
  /// other event types.
  final DecisionTaskTimedOutEventAttributes?
      decisionTaskTimedOutEventAttributes;

  /// If the event is of type
  /// <code>ExternalWorkflowExecutionCancelRequested</code> then this member is
  /// set and provides detailed information about the event. It isn't set for
  /// other event types.
  final ExternalWorkflowExecutionCancelRequestedEventAttributes?
      externalWorkflowExecutionCancelRequestedEventAttributes;

  /// If the event is of type <code>ExternalWorkflowExecutionSignaled</code> then
  /// this member is set and provides detailed information about the event. It
  /// isn't set for other event types.
  final ExternalWorkflowExecutionSignaledEventAttributes?
      externalWorkflowExecutionSignaledEventAttributes;

  /// If the event is of type <code>FailWorkflowExecutionFailed</code> then this
  /// member is set and provides detailed information about the event. It isn't
  /// set for other event types.
  final FailWorkflowExecutionFailedEventAttributes?
      failWorkflowExecutionFailedEventAttributes;

  /// Provides the details of the <code>LambdaFunctionCompleted</code> event. It
  /// isn't set for other event types.
  final LambdaFunctionCompletedEventAttributes?
      lambdaFunctionCompletedEventAttributes;

  /// Provides the details of the <code>LambdaFunctionFailed</code> event. It
  /// isn't set for other event types.
  final LambdaFunctionFailedEventAttributes?
      lambdaFunctionFailedEventAttributes;

  /// Provides the details of the <code>LambdaFunctionScheduled</code> event. It
  /// isn't set for other event types.
  final LambdaFunctionScheduledEventAttributes?
      lambdaFunctionScheduledEventAttributes;

  /// Provides the details of the <code>LambdaFunctionStarted</code> event. It
  /// isn't set for other event types.
  final LambdaFunctionStartedEventAttributes?
      lambdaFunctionStartedEventAttributes;

  /// Provides the details of the <code>LambdaFunctionTimedOut</code> event. It
  /// isn't set for other event types.
  final LambdaFunctionTimedOutEventAttributes?
      lambdaFunctionTimedOutEventAttributes;

  /// If the event is of type <code>MarkerRecorded</code> then this member is set
  /// and provides detailed information about the event. It isn't set for other
  /// event types.
  final MarkerRecordedEventAttributes? markerRecordedEventAttributes;

  /// If the event is of type <code>DecisionTaskFailed</code> then this member is
  /// set and provides detailed information about the event. It isn't set for
  /// other event types.
  final RecordMarkerFailedEventAttributes? recordMarkerFailedEventAttributes;

  /// If the event is of type <code>RequestCancelActivityTaskFailed</code> then
  /// this member is set and provides detailed information about the event. It
  /// isn't set for other event types.
  final RequestCancelActivityTaskFailedEventAttributes?
      requestCancelActivityTaskFailedEventAttributes;

  /// If the event is of type
  /// <code>RequestCancelExternalWorkflowExecutionFailed</code> then this member
  /// is set and provides detailed information about the event. It isn't set for
  /// other event types.
  final RequestCancelExternalWorkflowExecutionFailedEventAttributes?
      requestCancelExternalWorkflowExecutionFailedEventAttributes;

  /// If the event is of type
  /// <code>RequestCancelExternalWorkflowExecutionInitiated</code> then this
  /// member is set and provides detailed information about the event. It isn't
  /// set for other event types.
  final RequestCancelExternalWorkflowExecutionInitiatedEventAttributes?
      requestCancelExternalWorkflowExecutionInitiatedEventAttributes;

  /// If the event is of type <code>ScheduleActivityTaskFailed</code> then this
  /// member is set and provides detailed information about the event. It isn't
  /// set for other event types.
  final ScheduleActivityTaskFailedEventAttributes?
      scheduleActivityTaskFailedEventAttributes;

  /// Provides the details of the <code>ScheduleLambdaFunctionFailed</code> event.
  /// It isn't set for other event types.
  final ScheduleLambdaFunctionFailedEventAttributes?
      scheduleLambdaFunctionFailedEventAttributes;

  /// If the event is of type <code>SignalExternalWorkflowExecutionFailed</code>
  /// then this member is set and provides detailed information about the event.
  /// It isn't set for other event types.
  final SignalExternalWorkflowExecutionFailedEventAttributes?
      signalExternalWorkflowExecutionFailedEventAttributes;

  /// If the event is of type
  /// <code>SignalExternalWorkflowExecutionInitiated</code> then this member is
  /// set and provides detailed information about the event. It isn't set for
  /// other event types.
  final SignalExternalWorkflowExecutionInitiatedEventAttributes?
      signalExternalWorkflowExecutionInitiatedEventAttributes;

  /// If the event is of type <code>StartChildWorkflowExecutionFailed</code> then
  /// this member is set and provides detailed information about the event. It
  /// isn't set for other event types.
  final StartChildWorkflowExecutionFailedEventAttributes?
      startChildWorkflowExecutionFailedEventAttributes;

  /// If the event is of type <code>StartChildWorkflowExecutionInitiated</code>
  /// then this member is set and provides detailed information about the event.
  /// It isn't set for other event types.
  final StartChildWorkflowExecutionInitiatedEventAttributes?
      startChildWorkflowExecutionInitiatedEventAttributes;

  /// Provides the details of the <code>StartLambdaFunctionFailed</code> event. It
  /// isn't set for other event types.
  final StartLambdaFunctionFailedEventAttributes?
      startLambdaFunctionFailedEventAttributes;

  /// If the event is of type <code>StartTimerFailed</code> then this member is
  /// set and provides detailed information about the event. It isn't set for
  /// other event types.
  final StartTimerFailedEventAttributes? startTimerFailedEventAttributes;

  /// If the event is of type <code>TimerCanceled</code> then this member is set
  /// and provides detailed information about the event. It isn't set for other
  /// event types.
  final TimerCanceledEventAttributes? timerCanceledEventAttributes;

  /// If the event is of type <code>TimerFired</code> then this member is set and
  /// provides detailed information about the event. It isn't set for other event
  /// types.
  final TimerFiredEventAttributes? timerFiredEventAttributes;

  /// If the event is of type <code>TimerStarted</code> then this member is set
  /// and provides detailed information about the event. It isn't set for other
  /// event types.
  final TimerStartedEventAttributes? timerStartedEventAttributes;

  /// If the event is of type <code>WorkflowExecutionCancelRequested</code> then
  /// this member is set and provides detailed information about the event. It
  /// isn't set for other event types.
  final WorkflowExecutionCancelRequestedEventAttributes?
      workflowExecutionCancelRequestedEventAttributes;

  /// If the event is of type <code>WorkflowExecutionCanceled</code> then this
  /// member is set and provides detailed information about the event. It isn't
  /// set for other event types.
  final WorkflowExecutionCanceledEventAttributes?
      workflowExecutionCanceledEventAttributes;

  /// If the event is of type <code>WorkflowExecutionCompleted</code> then this
  /// member is set and provides detailed information about the event. It isn't
  /// set for other event types.
  final WorkflowExecutionCompletedEventAttributes?
      workflowExecutionCompletedEventAttributes;

  /// If the event is of type <code>WorkflowExecutionContinuedAsNew</code> then
  /// this member is set and provides detailed information about the event. It
  /// isn't set for other event types.
  final WorkflowExecutionContinuedAsNewEventAttributes?
      workflowExecutionContinuedAsNewEventAttributes;

  /// If the event is of type <code>WorkflowExecutionFailed</code> then this
  /// member is set and provides detailed information about the event. It isn't
  /// set for other event types.
  final WorkflowExecutionFailedEventAttributes?
      workflowExecutionFailedEventAttributes;

  /// If the event is of type <code>WorkflowExecutionSignaled</code> then this
  /// member is set and provides detailed information about the event. It isn't
  /// set for other event types.
  final WorkflowExecutionSignaledEventAttributes?
      workflowExecutionSignaledEventAttributes;

  /// If the event is of type <code>WorkflowExecutionStarted</code> then this
  /// member is set and provides detailed information about the event. It isn't
  /// set for other event types.
  final WorkflowExecutionStartedEventAttributes?
      workflowExecutionStartedEventAttributes;

  /// If the event is of type <code>WorkflowExecutionTerminated</code> then this
  /// member is set and provides detailed information about the event. It isn't
  /// set for other event types.
  final WorkflowExecutionTerminatedEventAttributes?
      workflowExecutionTerminatedEventAttributes;

  /// If the event is of type <code>WorkflowExecutionTimedOut</code> then this
  /// member is set and provides detailed information about the event. It isn't
  /// set for other event types.
  final WorkflowExecutionTimedOutEventAttributes?
      workflowExecutionTimedOutEventAttributes;

  HistoryEvent({
    required this.eventId,
    required this.eventTimestamp,
    required this.eventType,
    this.activityTaskCancelRequestedEventAttributes,
    this.activityTaskCanceledEventAttributes,
    this.activityTaskCompletedEventAttributes,
    this.activityTaskFailedEventAttributes,
    this.activityTaskScheduledEventAttributes,
    this.activityTaskStartedEventAttributes,
    this.activityTaskTimedOutEventAttributes,
    this.cancelTimerFailedEventAttributes,
    this.cancelWorkflowExecutionFailedEventAttributes,
    this.childWorkflowExecutionCanceledEventAttributes,
    this.childWorkflowExecutionCompletedEventAttributes,
    this.childWorkflowExecutionFailedEventAttributes,
    this.childWorkflowExecutionStartedEventAttributes,
    this.childWorkflowExecutionTerminatedEventAttributes,
    this.childWorkflowExecutionTimedOutEventAttributes,
    this.completeWorkflowExecutionFailedEventAttributes,
    this.continueAsNewWorkflowExecutionFailedEventAttributes,
    this.decisionTaskCompletedEventAttributes,
    this.decisionTaskScheduledEventAttributes,
    this.decisionTaskStartedEventAttributes,
    this.decisionTaskTimedOutEventAttributes,
    this.externalWorkflowExecutionCancelRequestedEventAttributes,
    this.externalWorkflowExecutionSignaledEventAttributes,
    this.failWorkflowExecutionFailedEventAttributes,
    this.lambdaFunctionCompletedEventAttributes,
    this.lambdaFunctionFailedEventAttributes,
    this.lambdaFunctionScheduledEventAttributes,
    this.lambdaFunctionStartedEventAttributes,
    this.lambdaFunctionTimedOutEventAttributes,
    this.markerRecordedEventAttributes,
    this.recordMarkerFailedEventAttributes,
    this.requestCancelActivityTaskFailedEventAttributes,
    this.requestCancelExternalWorkflowExecutionFailedEventAttributes,
    this.requestCancelExternalWorkflowExecutionInitiatedEventAttributes,
    this.scheduleActivityTaskFailedEventAttributes,
    this.scheduleLambdaFunctionFailedEventAttributes,
    this.signalExternalWorkflowExecutionFailedEventAttributes,
    this.signalExternalWorkflowExecutionInitiatedEventAttributes,
    this.startChildWorkflowExecutionFailedEventAttributes,
    this.startChildWorkflowExecutionInitiatedEventAttributes,
    this.startLambdaFunctionFailedEventAttributes,
    this.startTimerFailedEventAttributes,
    this.timerCanceledEventAttributes,
    this.timerFiredEventAttributes,
    this.timerStartedEventAttributes,
    this.workflowExecutionCancelRequestedEventAttributes,
    this.workflowExecutionCanceledEventAttributes,
    this.workflowExecutionCompletedEventAttributes,
    this.workflowExecutionContinuedAsNewEventAttributes,
    this.workflowExecutionFailedEventAttributes,
    this.workflowExecutionSignaledEventAttributes,
    this.workflowExecutionStartedEventAttributes,
    this.workflowExecutionTerminatedEventAttributes,
    this.workflowExecutionTimedOutEventAttributes,
  });

  factory HistoryEvent.fromJson(Map<String, dynamic> json) {
    return HistoryEvent(
      eventId: json['eventId'] as int,
      eventTimestamp:
          nonNullableTimeStampFromJson(json['eventTimestamp'] as Object),
      eventType: (json['eventType'] as String).toEventType(),
      activityTaskCancelRequestedEventAttributes:
          json['activityTaskCancelRequestedEventAttributes'] != null
              ? ActivityTaskCancelRequestedEventAttributes.fromJson(
                  json['activityTaskCancelRequestedEventAttributes']
                      as Map<String, dynamic>)
              : null,
      activityTaskCanceledEventAttributes:
          json['activityTaskCanceledEventAttributes'] != null
              ? ActivityTaskCanceledEventAttributes.fromJson(
                  json['activityTaskCanceledEventAttributes']
                      as Map<String, dynamic>)
              : null,
      activityTaskCompletedEventAttributes:
          json['activityTaskCompletedEventAttributes'] != null
              ? ActivityTaskCompletedEventAttributes.fromJson(
                  json['activityTaskCompletedEventAttributes']
                      as Map<String, dynamic>)
              : null,
      activityTaskFailedEventAttributes:
          json['activityTaskFailedEventAttributes'] != null
              ? ActivityTaskFailedEventAttributes.fromJson(
                  json['activityTaskFailedEventAttributes']
                      as Map<String, dynamic>)
              : null,
      activityTaskScheduledEventAttributes:
          json['activityTaskScheduledEventAttributes'] != null
              ? ActivityTaskScheduledEventAttributes.fromJson(
                  json['activityTaskScheduledEventAttributes']
                      as Map<String, dynamic>)
              : null,
      activityTaskStartedEventAttributes:
          json['activityTaskStartedEventAttributes'] != null
              ? ActivityTaskStartedEventAttributes.fromJson(
                  json['activityTaskStartedEventAttributes']
                      as Map<String, dynamic>)
              : null,
      activityTaskTimedOutEventAttributes:
          json['activityTaskTimedOutEventAttributes'] != null
              ? ActivityTaskTimedOutEventAttributes.fromJson(
                  json['activityTaskTimedOutEventAttributes']
                      as Map<String, dynamic>)
              : null,
      cancelTimerFailedEventAttributes:
          json['cancelTimerFailedEventAttributes'] != null
              ? CancelTimerFailedEventAttributes.fromJson(
                  json['cancelTimerFailedEventAttributes']
                      as Map<String, dynamic>)
              : null,
      cancelWorkflowExecutionFailedEventAttributes:
          json['cancelWorkflowExecutionFailedEventAttributes'] != null
              ? CancelWorkflowExecutionFailedEventAttributes.fromJson(
                  json['cancelWorkflowExecutionFailedEventAttributes']
                      as Map<String, dynamic>)
              : null,
      childWorkflowExecutionCanceledEventAttributes:
          json['childWorkflowExecutionCanceledEventAttributes'] != null
              ? ChildWorkflowExecutionCanceledEventAttributes.fromJson(
                  json['childWorkflowExecutionCanceledEventAttributes']
                      as Map<String, dynamic>)
              : null,
      childWorkflowExecutionCompletedEventAttributes:
          json['childWorkflowExecutionCompletedEventAttributes'] != null
              ? ChildWorkflowExecutionCompletedEventAttributes.fromJson(
                  json['childWorkflowExecutionCompletedEventAttributes']
                      as Map<String, dynamic>)
              : null,
      childWorkflowExecutionFailedEventAttributes:
          json['childWorkflowExecutionFailedEventAttributes'] != null
              ? ChildWorkflowExecutionFailedEventAttributes.fromJson(
                  json['childWorkflowExecutionFailedEventAttributes']
                      as Map<String, dynamic>)
              : null,
      childWorkflowExecutionStartedEventAttributes:
          json['childWorkflowExecutionStartedEventAttributes'] != null
              ? ChildWorkflowExecutionStartedEventAttributes.fromJson(
                  json['childWorkflowExecutionStartedEventAttributes']
                      as Map<String, dynamic>)
              : null,
      childWorkflowExecutionTerminatedEventAttributes:
          json['childWorkflowExecutionTerminatedEventAttributes'] != null
              ? ChildWorkflowExecutionTerminatedEventAttributes.fromJson(
                  json['childWorkflowExecutionTerminatedEventAttributes']
                      as Map<String, dynamic>)
              : null,
      childWorkflowExecutionTimedOutEventAttributes:
          json['childWorkflowExecutionTimedOutEventAttributes'] != null
              ? ChildWorkflowExecutionTimedOutEventAttributes.fromJson(
                  json['childWorkflowExecutionTimedOutEventAttributes']
                      as Map<String, dynamic>)
              : null,
      completeWorkflowExecutionFailedEventAttributes:
          json['completeWorkflowExecutionFailedEventAttributes'] != null
              ? CompleteWorkflowExecutionFailedEventAttributes.fromJson(
                  json['completeWorkflowExecutionFailedEventAttributes']
                      as Map<String, dynamic>)
              : null,
      continueAsNewWorkflowExecutionFailedEventAttributes:
          json['continueAsNewWorkflowExecutionFailedEventAttributes'] != null
              ? ContinueAsNewWorkflowExecutionFailedEventAttributes.fromJson(
                  json['continueAsNewWorkflowExecutionFailedEventAttributes']
                      as Map<String, dynamic>)
              : null,
      decisionTaskCompletedEventAttributes:
          json['decisionTaskCompletedEventAttributes'] != null
              ? DecisionTaskCompletedEventAttributes.fromJson(
                  json['decisionTaskCompletedEventAttributes']
                      as Map<String, dynamic>)
              : null,
      decisionTaskScheduledEventAttributes:
          json['decisionTaskScheduledEventAttributes'] != null
              ? DecisionTaskScheduledEventAttributes.fromJson(
                  json['decisionTaskScheduledEventAttributes']
                      as Map<String, dynamic>)
              : null,
      decisionTaskStartedEventAttributes:
          json['decisionTaskStartedEventAttributes'] != null
              ? DecisionTaskStartedEventAttributes.fromJson(
                  json['decisionTaskStartedEventAttributes']
                      as Map<String, dynamic>)
              : null,
      decisionTaskTimedOutEventAttributes:
          json['decisionTaskTimedOutEventAttributes'] != null
              ? DecisionTaskTimedOutEventAttributes.fromJson(
                  json['decisionTaskTimedOutEventAttributes']
                      as Map<String, dynamic>)
              : null,
      externalWorkflowExecutionCancelRequestedEventAttributes: json[
                  'externalWorkflowExecutionCancelRequestedEventAttributes'] !=
              null
          ? ExternalWorkflowExecutionCancelRequestedEventAttributes.fromJson(
              json['externalWorkflowExecutionCancelRequestedEventAttributes']
                  as Map<String, dynamic>)
          : null,
      externalWorkflowExecutionSignaledEventAttributes:
          json['externalWorkflowExecutionSignaledEventAttributes'] != null
              ? ExternalWorkflowExecutionSignaledEventAttributes.fromJson(
                  json['externalWorkflowExecutionSignaledEventAttributes']
                      as Map<String, dynamic>)
              : null,
      failWorkflowExecutionFailedEventAttributes:
          json['failWorkflowExecutionFailedEventAttributes'] != null
              ? FailWorkflowExecutionFailedEventAttributes.fromJson(
                  json['failWorkflowExecutionFailedEventAttributes']
                      as Map<String, dynamic>)
              : null,
      lambdaFunctionCompletedEventAttributes:
          json['lambdaFunctionCompletedEventAttributes'] != null
              ? LambdaFunctionCompletedEventAttributes.fromJson(
                  json['lambdaFunctionCompletedEventAttributes']
                      as Map<String, dynamic>)
              : null,
      lambdaFunctionFailedEventAttributes:
          json['lambdaFunctionFailedEventAttributes'] != null
              ? LambdaFunctionFailedEventAttributes.fromJson(
                  json['lambdaFunctionFailedEventAttributes']
                      as Map<String, dynamic>)
              : null,
      lambdaFunctionScheduledEventAttributes:
          json['lambdaFunctionScheduledEventAttributes'] != null
              ? LambdaFunctionScheduledEventAttributes.fromJson(
                  json['lambdaFunctionScheduledEventAttributes']
                      as Map<String, dynamic>)
              : null,
      lambdaFunctionStartedEventAttributes:
          json['lambdaFunctionStartedEventAttributes'] != null
              ? LambdaFunctionStartedEventAttributes.fromJson(
                  json['lambdaFunctionStartedEventAttributes']
                      as Map<String, dynamic>)
              : null,
      lambdaFunctionTimedOutEventAttributes:
          json['lambdaFunctionTimedOutEventAttributes'] != null
              ? LambdaFunctionTimedOutEventAttributes.fromJson(
                  json['lambdaFunctionTimedOutEventAttributes']
                      as Map<String, dynamic>)
              : null,
      markerRecordedEventAttributes:
          json['markerRecordedEventAttributes'] != null
              ? MarkerRecordedEventAttributes.fromJson(
                  json['markerRecordedEventAttributes'] as Map<String, dynamic>)
              : null,
      recordMarkerFailedEventAttributes:
          json['recordMarkerFailedEventAttributes'] != null
              ? RecordMarkerFailedEventAttributes.fromJson(
                  json['recordMarkerFailedEventAttributes']
                      as Map<String, dynamic>)
              : null,
      requestCancelActivityTaskFailedEventAttributes:
          json['requestCancelActivityTaskFailedEventAttributes'] != null
              ? RequestCancelActivityTaskFailedEventAttributes.fromJson(
                  json['requestCancelActivityTaskFailedEventAttributes']
                      as Map<String, dynamic>)
              : null,
      requestCancelExternalWorkflowExecutionFailedEventAttributes: json[
                  'requestCancelExternalWorkflowExecutionFailedEventAttributes'] !=
              null
          ? RequestCancelExternalWorkflowExecutionFailedEventAttributes.fromJson(
              json['requestCancelExternalWorkflowExecutionFailedEventAttributes']
                  as Map<String, dynamic>)
          : null,
      requestCancelExternalWorkflowExecutionInitiatedEventAttributes: json[
                  'requestCancelExternalWorkflowExecutionInitiatedEventAttributes'] !=
              null
          ? RequestCancelExternalWorkflowExecutionInitiatedEventAttributes
              .fromJson(json[
                      'requestCancelExternalWorkflowExecutionInitiatedEventAttributes']
                  as Map<String, dynamic>)
          : null,
      scheduleActivityTaskFailedEventAttributes:
          json['scheduleActivityTaskFailedEventAttributes'] != null
              ? ScheduleActivityTaskFailedEventAttributes.fromJson(
                  json['scheduleActivityTaskFailedEventAttributes']
                      as Map<String, dynamic>)
              : null,
      scheduleLambdaFunctionFailedEventAttributes:
          json['scheduleLambdaFunctionFailedEventAttributes'] != null
              ? ScheduleLambdaFunctionFailedEventAttributes.fromJson(
                  json['scheduleLambdaFunctionFailedEventAttributes']
                      as Map<String, dynamic>)
              : null,
      signalExternalWorkflowExecutionFailedEventAttributes:
          json['signalExternalWorkflowExecutionFailedEventAttributes'] != null
              ? SignalExternalWorkflowExecutionFailedEventAttributes.fromJson(
                  json['signalExternalWorkflowExecutionFailedEventAttributes']
                      as Map<String, dynamic>)
              : null,
      signalExternalWorkflowExecutionInitiatedEventAttributes: json[
                  'signalExternalWorkflowExecutionInitiatedEventAttributes'] !=
              null
          ? SignalExternalWorkflowExecutionInitiatedEventAttributes.fromJson(
              json['signalExternalWorkflowExecutionInitiatedEventAttributes']
                  as Map<String, dynamic>)
          : null,
      startChildWorkflowExecutionFailedEventAttributes:
          json['startChildWorkflowExecutionFailedEventAttributes'] != null
              ? StartChildWorkflowExecutionFailedEventAttributes.fromJson(
                  json['startChildWorkflowExecutionFailedEventAttributes']
                      as Map<String, dynamic>)
              : null,
      startChildWorkflowExecutionInitiatedEventAttributes:
          json['startChildWorkflowExecutionInitiatedEventAttributes'] != null
              ? StartChildWorkflowExecutionInitiatedEventAttributes.fromJson(
                  json['startChildWorkflowExecutionInitiatedEventAttributes']
                      as Map<String, dynamic>)
              : null,
      startLambdaFunctionFailedEventAttributes:
          json['startLambdaFunctionFailedEventAttributes'] != null
              ? StartLambdaFunctionFailedEventAttributes.fromJson(
                  json['startLambdaFunctionFailedEventAttributes']
                      as Map<String, dynamic>)
              : null,
      startTimerFailedEventAttributes:
          json['startTimerFailedEventAttributes'] != null
              ? StartTimerFailedEventAttributes.fromJson(
                  json['startTimerFailedEventAttributes']
                      as Map<String, dynamic>)
              : null,
      timerCanceledEventAttributes: json['timerCanceledEventAttributes'] != null
          ? TimerCanceledEventAttributes.fromJson(
              json['timerCanceledEventAttributes'] as Map<String, dynamic>)
          : null,
      timerFiredEventAttributes: json['timerFiredEventAttributes'] != null
          ? TimerFiredEventAttributes.fromJson(
              json['timerFiredEventAttributes'] as Map<String, dynamic>)
          : null,
      timerStartedEventAttributes: json['timerStartedEventAttributes'] != null
          ? TimerStartedEventAttributes.fromJson(
              json['timerStartedEventAttributes'] as Map<String, dynamic>)
          : null,
      workflowExecutionCancelRequestedEventAttributes:
          json['workflowExecutionCancelRequestedEventAttributes'] != null
              ? WorkflowExecutionCancelRequestedEventAttributes.fromJson(
                  json['workflowExecutionCancelRequestedEventAttributes']
                      as Map<String, dynamic>)
              : null,
      workflowExecutionCanceledEventAttributes:
          json['workflowExecutionCanceledEventAttributes'] != null
              ? WorkflowExecutionCanceledEventAttributes.fromJson(
                  json['workflowExecutionCanceledEventAttributes']
                      as Map<String, dynamic>)
              : null,
      workflowExecutionCompletedEventAttributes:
          json['workflowExecutionCompletedEventAttributes'] != null
              ? WorkflowExecutionCompletedEventAttributes.fromJson(
                  json['workflowExecutionCompletedEventAttributes']
                      as Map<String, dynamic>)
              : null,
      workflowExecutionContinuedAsNewEventAttributes:
          json['workflowExecutionContinuedAsNewEventAttributes'] != null
              ? WorkflowExecutionContinuedAsNewEventAttributes.fromJson(
                  json['workflowExecutionContinuedAsNewEventAttributes']
                      as Map<String, dynamic>)
              : null,
      workflowExecutionFailedEventAttributes:
          json['workflowExecutionFailedEventAttributes'] != null
              ? WorkflowExecutionFailedEventAttributes.fromJson(
                  json['workflowExecutionFailedEventAttributes']
                      as Map<String, dynamic>)
              : null,
      workflowExecutionSignaledEventAttributes:
          json['workflowExecutionSignaledEventAttributes'] != null
              ? WorkflowExecutionSignaledEventAttributes.fromJson(
                  json['workflowExecutionSignaledEventAttributes']
                      as Map<String, dynamic>)
              : null,
      workflowExecutionStartedEventAttributes:
          json['workflowExecutionStartedEventAttributes'] != null
              ? WorkflowExecutionStartedEventAttributes.fromJson(
                  json['workflowExecutionStartedEventAttributes']
                      as Map<String, dynamic>)
              : null,
      workflowExecutionTerminatedEventAttributes:
          json['workflowExecutionTerminatedEventAttributes'] != null
              ? WorkflowExecutionTerminatedEventAttributes.fromJson(
                  json['workflowExecutionTerminatedEventAttributes']
                      as Map<String, dynamic>)
              : null,
      workflowExecutionTimedOutEventAttributes:
          json['workflowExecutionTimedOutEventAttributes'] != null
              ? WorkflowExecutionTimedOutEventAttributes.fromJson(
                  json['workflowExecutionTimedOutEventAttributes']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final eventId = this.eventId;
    final eventTimestamp = this.eventTimestamp;
    final eventType = this.eventType;
    final activityTaskCancelRequestedEventAttributes =
        this.activityTaskCancelRequestedEventAttributes;
    final activityTaskCanceledEventAttributes =
        this.activityTaskCanceledEventAttributes;
    final activityTaskCompletedEventAttributes =
        this.activityTaskCompletedEventAttributes;
    final activityTaskFailedEventAttributes =
        this.activityTaskFailedEventAttributes;
    final activityTaskScheduledEventAttributes =
        this.activityTaskScheduledEventAttributes;
    final activityTaskStartedEventAttributes =
        this.activityTaskStartedEventAttributes;
    final activityTaskTimedOutEventAttributes =
        this.activityTaskTimedOutEventAttributes;
    final cancelTimerFailedEventAttributes =
        this.cancelTimerFailedEventAttributes;
    final cancelWorkflowExecutionFailedEventAttributes =
        this.cancelWorkflowExecutionFailedEventAttributes;
    final childWorkflowExecutionCanceledEventAttributes =
        this.childWorkflowExecutionCanceledEventAttributes;
    final childWorkflowExecutionCompletedEventAttributes =
        this.childWorkflowExecutionCompletedEventAttributes;
    final childWorkflowExecutionFailedEventAttributes =
        this.childWorkflowExecutionFailedEventAttributes;
    final childWorkflowExecutionStartedEventAttributes =
        this.childWorkflowExecutionStartedEventAttributes;
    final childWorkflowExecutionTerminatedEventAttributes =
        this.childWorkflowExecutionTerminatedEventAttributes;
    final childWorkflowExecutionTimedOutEventAttributes =
        this.childWorkflowExecutionTimedOutEventAttributes;
    final completeWorkflowExecutionFailedEventAttributes =
        this.completeWorkflowExecutionFailedEventAttributes;
    final continueAsNewWorkflowExecutionFailedEventAttributes =
        this.continueAsNewWorkflowExecutionFailedEventAttributes;
    final decisionTaskCompletedEventAttributes =
        this.decisionTaskCompletedEventAttributes;
    final decisionTaskScheduledEventAttributes =
        this.decisionTaskScheduledEventAttributes;
    final decisionTaskStartedEventAttributes =
        this.decisionTaskStartedEventAttributes;
    final decisionTaskTimedOutEventAttributes =
        this.decisionTaskTimedOutEventAttributes;
    final externalWorkflowExecutionCancelRequestedEventAttributes =
        this.externalWorkflowExecutionCancelRequestedEventAttributes;
    final externalWorkflowExecutionSignaledEventAttributes =
        this.externalWorkflowExecutionSignaledEventAttributes;
    final failWorkflowExecutionFailedEventAttributes =
        this.failWorkflowExecutionFailedEventAttributes;
    final lambdaFunctionCompletedEventAttributes =
        this.lambdaFunctionCompletedEventAttributes;
    final lambdaFunctionFailedEventAttributes =
        this.lambdaFunctionFailedEventAttributes;
    final lambdaFunctionScheduledEventAttributes =
        this.lambdaFunctionScheduledEventAttributes;
    final lambdaFunctionStartedEventAttributes =
        this.lambdaFunctionStartedEventAttributes;
    final lambdaFunctionTimedOutEventAttributes =
        this.lambdaFunctionTimedOutEventAttributes;
    final markerRecordedEventAttributes = this.markerRecordedEventAttributes;
    final recordMarkerFailedEventAttributes =
        this.recordMarkerFailedEventAttributes;
    final requestCancelActivityTaskFailedEventAttributes =
        this.requestCancelActivityTaskFailedEventAttributes;
    final requestCancelExternalWorkflowExecutionFailedEventAttributes =
        this.requestCancelExternalWorkflowExecutionFailedEventAttributes;
    final requestCancelExternalWorkflowExecutionInitiatedEventAttributes =
        this.requestCancelExternalWorkflowExecutionInitiatedEventAttributes;
    final scheduleActivityTaskFailedEventAttributes =
        this.scheduleActivityTaskFailedEventAttributes;
    final scheduleLambdaFunctionFailedEventAttributes =
        this.scheduleLambdaFunctionFailedEventAttributes;
    final signalExternalWorkflowExecutionFailedEventAttributes =
        this.signalExternalWorkflowExecutionFailedEventAttributes;
    final signalExternalWorkflowExecutionInitiatedEventAttributes =
        this.signalExternalWorkflowExecutionInitiatedEventAttributes;
    final startChildWorkflowExecutionFailedEventAttributes =
        this.startChildWorkflowExecutionFailedEventAttributes;
    final startChildWorkflowExecutionInitiatedEventAttributes =
        this.startChildWorkflowExecutionInitiatedEventAttributes;
    final startLambdaFunctionFailedEventAttributes =
        this.startLambdaFunctionFailedEventAttributes;
    final startTimerFailedEventAttributes =
        this.startTimerFailedEventAttributes;
    final timerCanceledEventAttributes = this.timerCanceledEventAttributes;
    final timerFiredEventAttributes = this.timerFiredEventAttributes;
    final timerStartedEventAttributes = this.timerStartedEventAttributes;
    final workflowExecutionCancelRequestedEventAttributes =
        this.workflowExecutionCancelRequestedEventAttributes;
    final workflowExecutionCanceledEventAttributes =
        this.workflowExecutionCanceledEventAttributes;
    final workflowExecutionCompletedEventAttributes =
        this.workflowExecutionCompletedEventAttributes;
    final workflowExecutionContinuedAsNewEventAttributes =
        this.workflowExecutionContinuedAsNewEventAttributes;
    final workflowExecutionFailedEventAttributes =
        this.workflowExecutionFailedEventAttributes;
    final workflowExecutionSignaledEventAttributes =
        this.workflowExecutionSignaledEventAttributes;
    final workflowExecutionStartedEventAttributes =
        this.workflowExecutionStartedEventAttributes;
    final workflowExecutionTerminatedEventAttributes =
        this.workflowExecutionTerminatedEventAttributes;
    final workflowExecutionTimedOutEventAttributes =
        this.workflowExecutionTimedOutEventAttributes;
    return {
      'eventId': eventId,
      'eventTimestamp': unixTimestampToJson(eventTimestamp),
      'eventType': eventType.toValue(),
      if (activityTaskCancelRequestedEventAttributes != null)
        'activityTaskCancelRequestedEventAttributes':
            activityTaskCancelRequestedEventAttributes,
      if (activityTaskCanceledEventAttributes != null)
        'activityTaskCanceledEventAttributes':
            activityTaskCanceledEventAttributes,
      if (activityTaskCompletedEventAttributes != null)
        'activityTaskCompletedEventAttributes':
            activityTaskCompletedEventAttributes,
      if (activityTaskFailedEventAttributes != null)
        'activityTaskFailedEventAttributes': activityTaskFailedEventAttributes,
      if (activityTaskScheduledEventAttributes != null)
        'activityTaskScheduledEventAttributes':
            activityTaskScheduledEventAttributes,
      if (activityTaskStartedEventAttributes != null)
        'activityTaskStartedEventAttributes':
            activityTaskStartedEventAttributes,
      if (activityTaskTimedOutEventAttributes != null)
        'activityTaskTimedOutEventAttributes':
            activityTaskTimedOutEventAttributes,
      if (cancelTimerFailedEventAttributes != null)
        'cancelTimerFailedEventAttributes': cancelTimerFailedEventAttributes,
      if (cancelWorkflowExecutionFailedEventAttributes != null)
        'cancelWorkflowExecutionFailedEventAttributes':
            cancelWorkflowExecutionFailedEventAttributes,
      if (childWorkflowExecutionCanceledEventAttributes != null)
        'childWorkflowExecutionCanceledEventAttributes':
            childWorkflowExecutionCanceledEventAttributes,
      if (childWorkflowExecutionCompletedEventAttributes != null)
        'childWorkflowExecutionCompletedEventAttributes':
            childWorkflowExecutionCompletedEventAttributes,
      if (childWorkflowExecutionFailedEventAttributes != null)
        'childWorkflowExecutionFailedEventAttributes':
            childWorkflowExecutionFailedEventAttributes,
      if (childWorkflowExecutionStartedEventAttributes != null)
        'childWorkflowExecutionStartedEventAttributes':
            childWorkflowExecutionStartedEventAttributes,
      if (childWorkflowExecutionTerminatedEventAttributes != null)
        'childWorkflowExecutionTerminatedEventAttributes':
            childWorkflowExecutionTerminatedEventAttributes,
      if (childWorkflowExecutionTimedOutEventAttributes != null)
        'childWorkflowExecutionTimedOutEventAttributes':
            childWorkflowExecutionTimedOutEventAttributes,
      if (completeWorkflowExecutionFailedEventAttributes != null)
        'completeWorkflowExecutionFailedEventAttributes':
            completeWorkflowExecutionFailedEventAttributes,
      if (continueAsNewWorkflowExecutionFailedEventAttributes != null)
        'continueAsNewWorkflowExecutionFailedEventAttributes':
            continueAsNewWorkflowExecutionFailedEventAttributes,
      if (decisionTaskCompletedEventAttributes != null)
        'decisionTaskCompletedEventAttributes':
            decisionTaskCompletedEventAttributes,
      if (decisionTaskScheduledEventAttributes != null)
        'decisionTaskScheduledEventAttributes':
            decisionTaskScheduledEventAttributes,
      if (decisionTaskStartedEventAttributes != null)
        'decisionTaskStartedEventAttributes':
            decisionTaskStartedEventAttributes,
      if (decisionTaskTimedOutEventAttributes != null)
        'decisionTaskTimedOutEventAttributes':
            decisionTaskTimedOutEventAttributes,
      if (externalWorkflowExecutionCancelRequestedEventAttributes != null)
        'externalWorkflowExecutionCancelRequestedEventAttributes':
            externalWorkflowExecutionCancelRequestedEventAttributes,
      if (externalWorkflowExecutionSignaledEventAttributes != null)
        'externalWorkflowExecutionSignaledEventAttributes':
            externalWorkflowExecutionSignaledEventAttributes,
      if (failWorkflowExecutionFailedEventAttributes != null)
        'failWorkflowExecutionFailedEventAttributes':
            failWorkflowExecutionFailedEventAttributes,
      if (lambdaFunctionCompletedEventAttributes != null)
        'lambdaFunctionCompletedEventAttributes':
            lambdaFunctionCompletedEventAttributes,
      if (lambdaFunctionFailedEventAttributes != null)
        'lambdaFunctionFailedEventAttributes':
            lambdaFunctionFailedEventAttributes,
      if (lambdaFunctionScheduledEventAttributes != null)
        'lambdaFunctionScheduledEventAttributes':
            lambdaFunctionScheduledEventAttributes,
      if (lambdaFunctionStartedEventAttributes != null)
        'lambdaFunctionStartedEventAttributes':
            lambdaFunctionStartedEventAttributes,
      if (lambdaFunctionTimedOutEventAttributes != null)
        'lambdaFunctionTimedOutEventAttributes':
            lambdaFunctionTimedOutEventAttributes,
      if (markerRecordedEventAttributes != null)
        'markerRecordedEventAttributes': markerRecordedEventAttributes,
      if (recordMarkerFailedEventAttributes != null)
        'recordMarkerFailedEventAttributes': recordMarkerFailedEventAttributes,
      if (requestCancelActivityTaskFailedEventAttributes != null)
        'requestCancelActivityTaskFailedEventAttributes':
            requestCancelActivityTaskFailedEventAttributes,
      if (requestCancelExternalWorkflowExecutionFailedEventAttributes != null)
        'requestCancelExternalWorkflowExecutionFailedEventAttributes':
            requestCancelExternalWorkflowExecutionFailedEventAttributes,
      if (requestCancelExternalWorkflowExecutionInitiatedEventAttributes !=
          null)
        'requestCancelExternalWorkflowExecutionInitiatedEventAttributes':
            requestCancelExternalWorkflowExecutionInitiatedEventAttributes,
      if (scheduleActivityTaskFailedEventAttributes != null)
        'scheduleActivityTaskFailedEventAttributes':
            scheduleActivityTaskFailedEventAttributes,
      if (scheduleLambdaFunctionFailedEventAttributes != null)
        'scheduleLambdaFunctionFailedEventAttributes':
            scheduleLambdaFunctionFailedEventAttributes,
      if (signalExternalWorkflowExecutionFailedEventAttributes != null)
        'signalExternalWorkflowExecutionFailedEventAttributes':
            signalExternalWorkflowExecutionFailedEventAttributes,
      if (signalExternalWorkflowExecutionInitiatedEventAttributes != null)
        'signalExternalWorkflowExecutionInitiatedEventAttributes':
            signalExternalWorkflowExecutionInitiatedEventAttributes,
      if (startChildWorkflowExecutionFailedEventAttributes != null)
        'startChildWorkflowExecutionFailedEventAttributes':
            startChildWorkflowExecutionFailedEventAttributes,
      if (startChildWorkflowExecutionInitiatedEventAttributes != null)
        'startChildWorkflowExecutionInitiatedEventAttributes':
            startChildWorkflowExecutionInitiatedEventAttributes,
      if (startLambdaFunctionFailedEventAttributes != null)
        'startLambdaFunctionFailedEventAttributes':
            startLambdaFunctionFailedEventAttributes,
      if (startTimerFailedEventAttributes != null)
        'startTimerFailedEventAttributes': startTimerFailedEventAttributes,
      if (timerCanceledEventAttributes != null)
        'timerCanceledEventAttributes': timerCanceledEventAttributes,
      if (timerFiredEventAttributes != null)
        'timerFiredEventAttributes': timerFiredEventAttributes,
      if (timerStartedEventAttributes != null)
        'timerStartedEventAttributes': timerStartedEventAttributes,
      if (workflowExecutionCancelRequestedEventAttributes != null)
        'workflowExecutionCancelRequestedEventAttributes':
            workflowExecutionCancelRequestedEventAttributes,
      if (workflowExecutionCanceledEventAttributes != null)
        'workflowExecutionCanceledEventAttributes':
            workflowExecutionCanceledEventAttributes,
      if (workflowExecutionCompletedEventAttributes != null)
        'workflowExecutionCompletedEventAttributes':
            workflowExecutionCompletedEventAttributes,
      if (workflowExecutionContinuedAsNewEventAttributes != null)
        'workflowExecutionContinuedAsNewEventAttributes':
            workflowExecutionContinuedAsNewEventAttributes,
      if (workflowExecutionFailedEventAttributes != null)
        'workflowExecutionFailedEventAttributes':
            workflowExecutionFailedEventAttributes,
      if (workflowExecutionSignaledEventAttributes != null)
        'workflowExecutionSignaledEventAttributes':
            workflowExecutionSignaledEventAttributes,
      if (workflowExecutionStartedEventAttributes != null)
        'workflowExecutionStartedEventAttributes':
            workflowExecutionStartedEventAttributes,
      if (workflowExecutionTerminatedEventAttributes != null)
        'workflowExecutionTerminatedEventAttributes':
            workflowExecutionTerminatedEventAttributes,
      if (workflowExecutionTimedOutEventAttributes != null)
        'workflowExecutionTimedOutEventAttributes':
            workflowExecutionTimedOutEventAttributes,
    };
  }
}

/// Provides the details of the <code>LambdaFunctionCompleted</code> event. It
/// isn't set for other event types.
class LambdaFunctionCompletedEventAttributes {
  /// The ID of the <code>LambdaFunctionScheduled</code> event that was recorded
  /// when this Lambda task was scheduled. To help diagnose issues, use this
  /// information to trace back the chain of events leading up to this event.
  final int scheduledEventId;

  /// The ID of the <code>LambdaFunctionStarted</code> event recorded when this
  /// activity task started. To help diagnose issues, use this information to
  /// trace back the chain of events leading up to this event.
  final int startedEventId;

  /// The results of the Lambda task.
  final String? result;

  LambdaFunctionCompletedEventAttributes({
    required this.scheduledEventId,
    required this.startedEventId,
    this.result,
  });

  factory LambdaFunctionCompletedEventAttributes.fromJson(
      Map<String, dynamic> json) {
    return LambdaFunctionCompletedEventAttributes(
      scheduledEventId: json['scheduledEventId'] as int,
      startedEventId: json['startedEventId'] as int,
      result: json['result'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final scheduledEventId = this.scheduledEventId;
    final startedEventId = this.startedEventId;
    final result = this.result;
    return {
      'scheduledEventId': scheduledEventId,
      'startedEventId': startedEventId,
      if (result != null) 'result': result,
    };
  }
}

/// Provides the details of the <code>LambdaFunctionFailed</code> event. It
/// isn't set for other event types.
class LambdaFunctionFailedEventAttributes {
  /// The ID of the <code>LambdaFunctionScheduled</code> event that was recorded
  /// when this activity task was scheduled. To help diagnose issues, use this
  /// information to trace back the chain of events leading up to this event.
  final int scheduledEventId;

  /// The ID of the <code>LambdaFunctionStarted</code> event recorded when this
  /// activity task started. To help diagnose issues, use this information to
  /// trace back the chain of events leading up to this event.
  final int startedEventId;

  /// The details of the failure.
  final String? details;

  /// The reason provided for the failure.
  final String? reason;

  LambdaFunctionFailedEventAttributes({
    required this.scheduledEventId,
    required this.startedEventId,
    this.details,
    this.reason,
  });

  factory LambdaFunctionFailedEventAttributes.fromJson(
      Map<String, dynamic> json) {
    return LambdaFunctionFailedEventAttributes(
      scheduledEventId: json['scheduledEventId'] as int,
      startedEventId: json['startedEventId'] as int,
      details: json['details'] as String?,
      reason: json['reason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final scheduledEventId = this.scheduledEventId;
    final startedEventId = this.startedEventId;
    final details = this.details;
    final reason = this.reason;
    return {
      'scheduledEventId': scheduledEventId,
      'startedEventId': startedEventId,
      if (details != null) 'details': details,
      if (reason != null) 'reason': reason,
    };
  }
}

/// Provides the details of the <code>LambdaFunctionScheduled</code> event. It
/// isn't set for other event types.
class LambdaFunctionScheduledEventAttributes {
  /// The ID of the <code>LambdaFunctionCompleted</code> event corresponding to
  /// the decision that resulted in scheduling this activity task. To help
  /// diagnose issues, use this information to trace back the chain of events
  /// leading up to this event.
  final int decisionTaskCompletedEventId;

  /// The unique ID of the Lambda task.
  final String id;

  /// The name of the Lambda function.
  final String name;

  /// Data attached to the event that the decider can use in subsequent workflow
  /// tasks. This data isn't sent to the Lambda task.
  final String? control;

  /// The input provided to the Lambda task.
  final String? input;

  /// The maximum amount of time a worker can take to process the Lambda task.
  final String? startToCloseTimeout;

  LambdaFunctionScheduledEventAttributes({
    required this.decisionTaskCompletedEventId,
    required this.id,
    required this.name,
    this.control,
    this.input,
    this.startToCloseTimeout,
  });

  factory LambdaFunctionScheduledEventAttributes.fromJson(
      Map<String, dynamic> json) {
    return LambdaFunctionScheduledEventAttributes(
      decisionTaskCompletedEventId: json['decisionTaskCompletedEventId'] as int,
      id: json['id'] as String,
      name: json['name'] as String,
      control: json['control'] as String?,
      input: json['input'] as String?,
      startToCloseTimeout: json['startToCloseTimeout'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final decisionTaskCompletedEventId = this.decisionTaskCompletedEventId;
    final id = this.id;
    final name = this.name;
    final control = this.control;
    final input = this.input;
    final startToCloseTimeout = this.startToCloseTimeout;
    return {
      'decisionTaskCompletedEventId': decisionTaskCompletedEventId,
      'id': id,
      'name': name,
      if (control != null) 'control': control,
      if (input != null) 'input': input,
      if (startToCloseTimeout != null)
        'startToCloseTimeout': startToCloseTimeout,
    };
  }
}

/// Provides the details of the <code>LambdaFunctionStarted</code> event. It
/// isn't set for other event types.
class LambdaFunctionStartedEventAttributes {
  /// The ID of the <code>LambdaFunctionScheduled</code> event that was recorded
  /// when this activity task was scheduled. To help diagnose issues, use this
  /// information to trace back the chain of events leading up to this event.
  final int scheduledEventId;

  LambdaFunctionStartedEventAttributes({
    required this.scheduledEventId,
  });

  factory LambdaFunctionStartedEventAttributes.fromJson(
      Map<String, dynamic> json) {
    return LambdaFunctionStartedEventAttributes(
      scheduledEventId: json['scheduledEventId'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final scheduledEventId = this.scheduledEventId;
    return {
      'scheduledEventId': scheduledEventId,
    };
  }
}

/// Provides details of the <code>LambdaFunctionTimedOut</code> event.
class LambdaFunctionTimedOutEventAttributes {
  /// The ID of the <code>LambdaFunctionScheduled</code> event that was recorded
  /// when this activity task was scheduled. To help diagnose issues, use this
  /// information to trace back the chain of events leading up to this event.
  final int scheduledEventId;

  /// The ID of the <code>ActivityTaskStarted</code> event that was recorded when
  /// this activity task started. To help diagnose issues, use this information to
  /// trace back the chain of events leading up to this event.
  final int startedEventId;

  /// The type of the timeout that caused this event.
  final LambdaFunctionTimeoutType? timeoutType;

  LambdaFunctionTimedOutEventAttributes({
    required this.scheduledEventId,
    required this.startedEventId,
    this.timeoutType,
  });

  factory LambdaFunctionTimedOutEventAttributes.fromJson(
      Map<String, dynamic> json) {
    return LambdaFunctionTimedOutEventAttributes(
      scheduledEventId: json['scheduledEventId'] as int,
      startedEventId: json['startedEventId'] as int,
      timeoutType:
          (json['timeoutType'] as String?)?.toLambdaFunctionTimeoutType(),
    );
  }

  Map<String, dynamic> toJson() {
    final scheduledEventId = this.scheduledEventId;
    final startedEventId = this.startedEventId;
    final timeoutType = this.timeoutType;
    return {
      'scheduledEventId': scheduledEventId,
      'startedEventId': startedEventId,
      if (timeoutType != null) 'timeoutType': timeoutType.toValue(),
    };
  }
}

enum LambdaFunctionTimeoutType {
  startToClose,
}

extension LambdaFunctionTimeoutTypeValueExtension on LambdaFunctionTimeoutType {
  String toValue() {
    switch (this) {
      case LambdaFunctionTimeoutType.startToClose:
        return 'START_TO_CLOSE';
    }
  }
}

extension LambdaFunctionTimeoutTypeFromString on String {
  LambdaFunctionTimeoutType toLambdaFunctionTimeoutType() {
    switch (this) {
      case 'START_TO_CLOSE':
        return LambdaFunctionTimeoutType.startToClose;
    }
    throw Exception('$this is not known in enum LambdaFunctionTimeoutType');
  }
}

class ListTagsForResourceOutput {
  /// An array of tags associated with the domain.
  final List<ResourceTag>? tags;

  ListTagsForResourceOutput({
    this.tags,
  });

  factory ListTagsForResourceOutput.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceOutput(
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => ResourceTag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'tags': tags,
    };
  }
}

/// Provides the details of the <code>MarkerRecorded</code> event.
class MarkerRecordedEventAttributes {
  /// The ID of the <code>DecisionTaskCompleted</code> event corresponding to the
  /// decision task that resulted in the <code>RecordMarker</code> decision that
  /// requested this marker. This information can be useful for diagnosing
  /// problems by tracing back the chain of events leading up to this event.
  final int decisionTaskCompletedEventId;

  /// The name of the marker.
  final String markerName;

  /// The details of the marker.
  final String? details;

  MarkerRecordedEventAttributes({
    required this.decisionTaskCompletedEventId,
    required this.markerName,
    this.details,
  });

  factory MarkerRecordedEventAttributes.fromJson(Map<String, dynamic> json) {
    return MarkerRecordedEventAttributes(
      decisionTaskCompletedEventId: json['decisionTaskCompletedEventId'] as int,
      markerName: json['markerName'] as String,
      details: json['details'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final decisionTaskCompletedEventId = this.decisionTaskCompletedEventId;
    final markerName = this.markerName;
    final details = this.details;
    return {
      'decisionTaskCompletedEventId': decisionTaskCompletedEventId,
      'markerName': markerName,
      if (details != null) 'details': details,
    };
  }
}

/// Contains the count of tasks in a task list.
class PendingTaskCount {
  /// The number of tasks in the task list.
  final int count;

  /// If set to true, indicates that the actual count was more than the maximum
  /// supported by this API and the count returned is the truncated value.
  final bool? truncated;

  PendingTaskCount({
    required this.count,
    this.truncated,
  });

  factory PendingTaskCount.fromJson(Map<String, dynamic> json) {
    return PendingTaskCount(
      count: json['count'] as int,
      truncated: json['truncated'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final count = this.count;
    final truncated = this.truncated;
    return {
      'count': count,
      if (truncated != null) 'truncated': truncated,
    };
  }
}

/// Provides the details of the <code>RecordMarker</code> decision.
///
/// <b>Access Control</b>
///
/// You can use IAM policies to control this decision's access to Amazon SWF
/// resources as follows:
///
/// <ul>
/// <li>
/// Use a <code>Resource</code> element with the domain name to limit the action
/// to only specified domains.
/// </li>
/// <li>
/// Use an <code>Action</code> element to allow or deny permission to call this
/// action.
/// </li>
/// <li>
/// You cannot use an IAM policy to constrain this action's parameters.
/// </li>
/// </ul>
/// If the caller doesn't have sufficient permissions to invoke the action, or
/// the parameter values fall outside the specified constraints, the action
/// fails. The associated event attribute's <code>cause</code> parameter is set
/// to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
/// policies, see <a
/// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
/// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
/// Developer Guide</i>.
class RecordMarkerDecisionAttributes {
  /// The name of the marker.
  final String markerName;

  /// The details of the marker.
  final String? details;

  RecordMarkerDecisionAttributes({
    required this.markerName,
    this.details,
  });

  Map<String, dynamic> toJson() {
    final markerName = this.markerName;
    final details = this.details;
    return {
      'markerName': markerName,
      if (details != null) 'details': details,
    };
  }
}

enum RecordMarkerFailedCause {
  operationNotPermitted,
}

extension RecordMarkerFailedCauseValueExtension on RecordMarkerFailedCause {
  String toValue() {
    switch (this) {
      case RecordMarkerFailedCause.operationNotPermitted:
        return 'OPERATION_NOT_PERMITTED';
    }
  }
}

extension RecordMarkerFailedCauseFromString on String {
  RecordMarkerFailedCause toRecordMarkerFailedCause() {
    switch (this) {
      case 'OPERATION_NOT_PERMITTED':
        return RecordMarkerFailedCause.operationNotPermitted;
    }
    throw Exception('$this is not known in enum RecordMarkerFailedCause');
  }
}

/// Provides the details of the <code>RecordMarkerFailed</code> event.
class RecordMarkerFailedEventAttributes {
  /// The cause of the failure. This information is generated by the system and
  /// can be useful for diagnostic purposes.
  /// <note>
  /// If <code>cause</code> is set to <code>OPERATION_NOT_PERMITTED</code>, the
  /// decision failed because it lacked sufficient permissions. For details and
  /// example IAM policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  /// </note>
  final RecordMarkerFailedCause cause;

  /// The ID of the <code>DecisionTaskCompleted</code> event corresponding to the
  /// decision task that resulted in the <code>RecordMarkerFailed</code> decision
  /// for this cancellation request. This information can be useful for diagnosing
  /// problems by tracing back the chain of events leading up to this event.
  final int decisionTaskCompletedEventId;

  /// The marker's name.
  final String markerName;

  RecordMarkerFailedEventAttributes({
    required this.cause,
    required this.decisionTaskCompletedEventId,
    required this.markerName,
  });

  factory RecordMarkerFailedEventAttributes.fromJson(
      Map<String, dynamic> json) {
    return RecordMarkerFailedEventAttributes(
      cause: (json['cause'] as String).toRecordMarkerFailedCause(),
      decisionTaskCompletedEventId: json['decisionTaskCompletedEventId'] as int,
      markerName: json['markerName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final cause = this.cause;
    final decisionTaskCompletedEventId = this.decisionTaskCompletedEventId;
    final markerName = this.markerName;
    return {
      'cause': cause.toValue(),
      'decisionTaskCompletedEventId': decisionTaskCompletedEventId,
      'markerName': markerName,
    };
  }
}

enum RegistrationStatus {
  registered,
  deprecated,
}

extension RegistrationStatusValueExtension on RegistrationStatus {
  String toValue() {
    switch (this) {
      case RegistrationStatus.registered:
        return 'REGISTERED';
      case RegistrationStatus.deprecated:
        return 'DEPRECATED';
    }
  }
}

extension RegistrationStatusFromString on String {
  RegistrationStatus toRegistrationStatus() {
    switch (this) {
      case 'REGISTERED':
        return RegistrationStatus.registered;
      case 'DEPRECATED':
        return RegistrationStatus.deprecated;
    }
    throw Exception('$this is not known in enum RegistrationStatus');
  }
}

/// Provides the details of the <code>RequestCancelActivityTask</code> decision.
///
/// <b>Access Control</b>
///
/// You can use IAM policies to control this decision's access to Amazon SWF
/// resources as follows:
///
/// <ul>
/// <li>
/// Use a <code>Resource</code> element with the domain name to limit the action
/// to only specified domains.
/// </li>
/// <li>
/// Use an <code>Action</code> element to allow or deny permission to call this
/// action.
/// </li>
/// <li>
/// You cannot use an IAM policy to constrain this action's parameters.
/// </li>
/// </ul>
/// If the caller doesn't have sufficient permissions to invoke the action, or
/// the parameter values fall outside the specified constraints, the action
/// fails. The associated event attribute's <code>cause</code> parameter is set
/// to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
/// policies, see <a
/// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
/// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
/// Developer Guide</i>.
class RequestCancelActivityTaskDecisionAttributes {
  /// The <code>activityId</code> of the activity task to be canceled.
  final String activityId;

  RequestCancelActivityTaskDecisionAttributes({
    required this.activityId,
  });

  Map<String, dynamic> toJson() {
    final activityId = this.activityId;
    return {
      'activityId': activityId,
    };
  }
}

enum RequestCancelActivityTaskFailedCause {
  activityIdUnknown,
  operationNotPermitted,
}

extension RequestCancelActivityTaskFailedCauseValueExtension
    on RequestCancelActivityTaskFailedCause {
  String toValue() {
    switch (this) {
      case RequestCancelActivityTaskFailedCause.activityIdUnknown:
        return 'ACTIVITY_ID_UNKNOWN';
      case RequestCancelActivityTaskFailedCause.operationNotPermitted:
        return 'OPERATION_NOT_PERMITTED';
    }
  }
}

extension RequestCancelActivityTaskFailedCauseFromString on String {
  RequestCancelActivityTaskFailedCause
      toRequestCancelActivityTaskFailedCause() {
    switch (this) {
      case 'ACTIVITY_ID_UNKNOWN':
        return RequestCancelActivityTaskFailedCause.activityIdUnknown;
      case 'OPERATION_NOT_PERMITTED':
        return RequestCancelActivityTaskFailedCause.operationNotPermitted;
    }
    throw Exception(
        '$this is not known in enum RequestCancelActivityTaskFailedCause');
  }
}

/// Provides the details of the <code>RequestCancelActivityTaskFailed</code>
/// event.
class RequestCancelActivityTaskFailedEventAttributes {
  /// The activityId provided in the <code>RequestCancelActivityTask</code>
  /// decision that failed.
  final String activityId;

  /// The cause of the failure. This information is generated by the system and
  /// can be useful for diagnostic purposes.
  /// <note>
  /// If <code>cause</code> is set to <code>OPERATION_NOT_PERMITTED</code>, the
  /// decision failed because it lacked sufficient permissions. For details and
  /// example IAM policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  /// </note>
  final RequestCancelActivityTaskFailedCause cause;

  /// The ID of the <code>DecisionTaskCompleted</code> event corresponding to the
  /// decision task that resulted in the <code>RequestCancelActivityTask</code>
  /// decision for this cancellation request. This information can be useful for
  /// diagnosing problems by tracing back the chain of events leading up to this
  /// event.
  final int decisionTaskCompletedEventId;

  RequestCancelActivityTaskFailedEventAttributes({
    required this.activityId,
    required this.cause,
    required this.decisionTaskCompletedEventId,
  });

  factory RequestCancelActivityTaskFailedEventAttributes.fromJson(
      Map<String, dynamic> json) {
    return RequestCancelActivityTaskFailedEventAttributes(
      activityId: json['activityId'] as String,
      cause: (json['cause'] as String).toRequestCancelActivityTaskFailedCause(),
      decisionTaskCompletedEventId: json['decisionTaskCompletedEventId'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final activityId = this.activityId;
    final cause = this.cause;
    final decisionTaskCompletedEventId = this.decisionTaskCompletedEventId;
    return {
      'activityId': activityId,
      'cause': cause.toValue(),
      'decisionTaskCompletedEventId': decisionTaskCompletedEventId,
    };
  }
}

/// Provides the details of the
/// <code>RequestCancelExternalWorkflowExecution</code> decision.
///
/// <b>Access Control</b>
///
/// You can use IAM policies to control this decision's access to Amazon SWF
/// resources as follows:
///
/// <ul>
/// <li>
/// Use a <code>Resource</code> element with the domain name to limit the action
/// to only specified domains.
/// </li>
/// <li>
/// Use an <code>Action</code> element to allow or deny permission to call this
/// action.
/// </li>
/// <li>
/// You cannot use an IAM policy to constrain this action's parameters.
/// </li>
/// </ul>
/// If the caller doesn't have sufficient permissions to invoke the action, or
/// the parameter values fall outside the specified constraints, the action
/// fails. The associated event attribute's <code>cause</code> parameter is set
/// to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
/// policies, see <a
/// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
/// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
/// Developer Guide</i>.
class RequestCancelExternalWorkflowExecutionDecisionAttributes {
  /// The <code>workflowId</code> of the external workflow execution to cancel.
  final String workflowId;

  /// The data attached to the event that can be used by the decider in subsequent
  /// workflow tasks.
  final String? control;

  /// The <code>runId</code> of the external workflow execution to cancel.
  final String? runId;

  RequestCancelExternalWorkflowExecutionDecisionAttributes({
    required this.workflowId,
    this.control,
    this.runId,
  });

  Map<String, dynamic> toJson() {
    final workflowId = this.workflowId;
    final control = this.control;
    final runId = this.runId;
    return {
      'workflowId': workflowId,
      if (control != null) 'control': control,
      if (runId != null) 'runId': runId,
    };
  }
}

enum RequestCancelExternalWorkflowExecutionFailedCause {
  unknownExternalWorkflowExecution,
  requestCancelExternalWorkflowExecutionRateExceeded,
  operationNotPermitted,
}

extension RequestCancelExternalWorkflowExecutionFailedCauseValueExtension
    on RequestCancelExternalWorkflowExecutionFailedCause {
  String toValue() {
    switch (this) {
      case RequestCancelExternalWorkflowExecutionFailedCause
            .unknownExternalWorkflowExecution:
        return 'UNKNOWN_EXTERNAL_WORKFLOW_EXECUTION';
      case RequestCancelExternalWorkflowExecutionFailedCause
            .requestCancelExternalWorkflowExecutionRateExceeded:
        return 'REQUEST_CANCEL_EXTERNAL_WORKFLOW_EXECUTION_RATE_EXCEEDED';
      case RequestCancelExternalWorkflowExecutionFailedCause
            .operationNotPermitted:
        return 'OPERATION_NOT_PERMITTED';
    }
  }
}

extension RequestCancelExternalWorkflowExecutionFailedCauseFromString
    on String {
  RequestCancelExternalWorkflowExecutionFailedCause
      toRequestCancelExternalWorkflowExecutionFailedCause() {
    switch (this) {
      case 'UNKNOWN_EXTERNAL_WORKFLOW_EXECUTION':
        return RequestCancelExternalWorkflowExecutionFailedCause
            .unknownExternalWorkflowExecution;
      case 'REQUEST_CANCEL_EXTERNAL_WORKFLOW_EXECUTION_RATE_EXCEEDED':
        return RequestCancelExternalWorkflowExecutionFailedCause
            .requestCancelExternalWorkflowExecutionRateExceeded;
      case 'OPERATION_NOT_PERMITTED':
        return RequestCancelExternalWorkflowExecutionFailedCause
            .operationNotPermitted;
    }
    throw Exception(
        '$this is not known in enum RequestCancelExternalWorkflowExecutionFailedCause');
  }
}

/// Provides the details of the
/// <code>RequestCancelExternalWorkflowExecutionFailed</code> event.
class RequestCancelExternalWorkflowExecutionFailedEventAttributes {
  /// The cause of the failure. This information is generated by the system and
  /// can be useful for diagnostic purposes.
  /// <note>
  /// If <code>cause</code> is set to <code>OPERATION_NOT_PERMITTED</code>, the
  /// decision failed because it lacked sufficient permissions. For details and
  /// example IAM policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  /// </note>
  final RequestCancelExternalWorkflowExecutionFailedCause cause;

  /// The ID of the <code>DecisionTaskCompleted</code> event corresponding to the
  /// decision task that resulted in the
  /// <code>RequestCancelExternalWorkflowExecution</code> decision for this
  /// cancellation request. This information can be useful for diagnosing problems
  /// by tracing back the chain of events leading up to this event.
  final int decisionTaskCompletedEventId;

  /// The ID of the <code>RequestCancelExternalWorkflowExecutionInitiated</code>
  /// event corresponding to the
  /// <code>RequestCancelExternalWorkflowExecution</code> decision to cancel this
  /// external workflow execution. This information can be useful for diagnosing
  /// problems by tracing back the chain of events leading up to this event.
  final int initiatedEventId;

  /// The <code>workflowId</code> of the external workflow to which the cancel
  /// request was to be delivered.
  final String workflowId;

  /// The data attached to the event that the decider can use in subsequent
  /// workflow tasks. This data isn't sent to the workflow execution.
  final String? control;

  /// The <code>runId</code> of the external workflow execution.
  final String? runId;

  RequestCancelExternalWorkflowExecutionFailedEventAttributes({
    required this.cause,
    required this.decisionTaskCompletedEventId,
    required this.initiatedEventId,
    required this.workflowId,
    this.control,
    this.runId,
  });

  factory RequestCancelExternalWorkflowExecutionFailedEventAttributes.fromJson(
      Map<String, dynamic> json) {
    return RequestCancelExternalWorkflowExecutionFailedEventAttributes(
      cause: (json['cause'] as String)
          .toRequestCancelExternalWorkflowExecutionFailedCause(),
      decisionTaskCompletedEventId: json['decisionTaskCompletedEventId'] as int,
      initiatedEventId: json['initiatedEventId'] as int,
      workflowId: json['workflowId'] as String,
      control: json['control'] as String?,
      runId: json['runId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cause = this.cause;
    final decisionTaskCompletedEventId = this.decisionTaskCompletedEventId;
    final initiatedEventId = this.initiatedEventId;
    final workflowId = this.workflowId;
    final control = this.control;
    final runId = this.runId;
    return {
      'cause': cause.toValue(),
      'decisionTaskCompletedEventId': decisionTaskCompletedEventId,
      'initiatedEventId': initiatedEventId,
      'workflowId': workflowId,
      if (control != null) 'control': control,
      if (runId != null) 'runId': runId,
    };
  }
}

/// Provides the details of the
/// <code>RequestCancelExternalWorkflowExecutionInitiated</code> event.
class RequestCancelExternalWorkflowExecutionInitiatedEventAttributes {
  /// The ID of the <code>DecisionTaskCompleted</code> event corresponding to the
  /// decision task that resulted in the
  /// <code>RequestCancelExternalWorkflowExecution</code> decision for this
  /// cancellation request. This information can be useful for diagnosing problems
  /// by tracing back the chain of events leading up to this event.
  final int decisionTaskCompletedEventId;

  /// The <code>workflowId</code> of the external workflow execution to be
  /// canceled.
  final String workflowId;

  /// Data attached to the event that can be used by the decider in subsequent
  /// workflow tasks.
  final String? control;

  /// The <code>runId</code> of the external workflow execution to be canceled.
  final String? runId;

  RequestCancelExternalWorkflowExecutionInitiatedEventAttributes({
    required this.decisionTaskCompletedEventId,
    required this.workflowId,
    this.control,
    this.runId,
  });

  factory RequestCancelExternalWorkflowExecutionInitiatedEventAttributes.fromJson(
      Map<String, dynamic> json) {
    return RequestCancelExternalWorkflowExecutionInitiatedEventAttributes(
      decisionTaskCompletedEventId: json['decisionTaskCompletedEventId'] as int,
      workflowId: json['workflowId'] as String,
      control: json['control'] as String?,
      runId: json['runId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final decisionTaskCompletedEventId = this.decisionTaskCompletedEventId;
    final workflowId = this.workflowId;
    final control = this.control;
    final runId = this.runId;
    return {
      'decisionTaskCompletedEventId': decisionTaskCompletedEventId,
      'workflowId': workflowId,
      if (control != null) 'control': control,
      if (runId != null) 'runId': runId,
    };
  }
}

/// Tags are key-value pairs that can be associated with Amazon SWF state
/// machines and activities.
///
/// Tags may only contain unicode letters, digits, whitespace, or these symbols:
/// <code>_ . : / = + - @</code>.
class ResourceTag {
  /// The key of a tag.
  final String key;

  /// The value of a tag.
  final String? value;

  ResourceTag({
    required this.key,
    this.value,
  });

  factory ResourceTag.fromJson(Map<String, dynamic> json) {
    return ResourceTag(
      key: json['key'] as String,
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'key': key,
      if (value != null) 'value': value,
    };
  }
}

/// Specifies the <code>runId</code> of a workflow execution.
class Run {
  /// The <code>runId</code> of a workflow execution. This ID is generated by the
  /// service and can be used to uniquely identify the workflow execution within a
  /// domain.
  final String? runId;

  Run({
    this.runId,
  });

  factory Run.fromJson(Map<String, dynamic> json) {
    return Run(
      runId: json['runId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final runId = this.runId;
    return {
      if (runId != null) 'runId': runId,
    };
  }
}

/// Provides the details of the <code>ScheduleActivityTask</code> decision.
///
/// <b>Access Control</b>
///
/// You can use IAM policies to control this decision's access to Amazon SWF
/// resources as follows:
///
/// <ul>
/// <li>
/// Use a <code>Resource</code> element with the domain name to limit the action
/// to only specified domains.
/// </li>
/// <li>
/// Use an <code>Action</code> element to allow or deny permission to call this
/// action.
/// </li>
/// <li>
/// Constrain the following parameters by using a <code>Condition</code> element
/// with the appropriate keys.
///
/// <ul>
/// <li>
/// <code>activityType.name</code> – String constraint. The key is
/// <code>swf:activityType.name</code>.
/// </li>
/// <li>
/// <code>activityType.version</code> – String constraint. The key is
/// <code>swf:activityType.version</code>.
/// </li>
/// <li>
/// <code>taskList</code> – String constraint. The key is
/// <code>swf:taskList.name</code>.
/// </li>
/// </ul> </li>
/// </ul>
/// If the caller doesn't have sufficient permissions to invoke the action, or
/// the parameter values fall outside the specified constraints, the action
/// fails. The associated event attribute's <code>cause</code> parameter is set
/// to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
/// policies, see <a
/// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
/// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
/// Developer Guide</i>.
class ScheduleActivityTaskDecisionAttributes {
  /// The <code>activityId</code> of the activity task.
  ///
  /// The specified string must not contain a <code>:</code> (colon),
  /// <code>/</code> (slash), <code>|</code> (vertical bar), or any control
  /// characters (<code>\u0000-\u001f</code> | <code>\u007f-\u009f</code>). Also,
  /// it must <i>not</i> be the literal string <code>arn</code>.
  final String activityId;

  /// The type of the activity task to schedule.
  final ActivityType activityType;

  /// Data attached to the event that can be used by the decider in subsequent
  /// workflow tasks. This data isn't sent to the activity.
  final String? control;

  /// If set, specifies the maximum time before which a worker processing a task
  /// of this type must report progress by calling
  /// <a>RecordActivityTaskHeartbeat</a>. If the timeout is exceeded, the activity
  /// task is automatically timed out. If the worker subsequently attempts to
  /// record a heartbeat or returns a result, it is ignored. This overrides the
  /// default heartbeat timeout specified when registering the activity type using
  /// <a>RegisterActivityType</a>.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// <code>0</code>. You can use <code>NONE</code> to specify unlimited duration.
  final String? heartbeatTimeout;

  /// The input provided to the activity task.
  final String? input;

  /// The maximum duration for this activity task.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// <code>0</code>. You can use <code>NONE</code> to specify unlimited duration.
  /// <note>
  /// A schedule-to-close timeout for this activity task must be specified either
  /// as a default for the activity type or through this field. If neither this
  /// field is set nor a default schedule-to-close timeout was specified at
  /// registration time then a fault is returned.
  /// </note>
  final String? scheduleToCloseTimeout;

  /// If set, specifies the maximum duration the activity task can wait to be
  /// assigned to a worker. This overrides the default schedule-to-start timeout
  /// specified when registering the activity type using
  /// <a>RegisterActivityType</a>.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// <code>0</code>. You can use <code>NONE</code> to specify unlimited duration.
  /// <note>
  /// A schedule-to-start timeout for this activity task must be specified either
  /// as a default for the activity type or through this field. If neither this
  /// field is set nor a default schedule-to-start timeout was specified at
  /// registration time then a fault is returned.
  /// </note>
  final String? scheduleToStartTimeout;

  /// If set, specifies the maximum duration a worker may take to process this
  /// activity task. This overrides the default start-to-close timeout specified
  /// when registering the activity type using <a>RegisterActivityType</a>.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// <code>0</code>. You can use <code>NONE</code> to specify unlimited duration.
  /// <note>
  /// A start-to-close timeout for this activity task must be specified either as
  /// a default for the activity type or through this field. If neither this field
  /// is set nor a default start-to-close timeout was specified at registration
  /// time then a fault is returned.
  /// </note>
  final String? startToCloseTimeout;

  /// If set, specifies the name of the task list in which to schedule the
  /// activity task. If not specified, the <code>defaultTaskList</code> registered
  /// with the activity type is used.
  /// <note>
  /// A task list for this activity task must be specified either as a default for
  /// the activity type or through this field. If neither this field is set nor a
  /// default task list was specified at registration time then a fault is
  /// returned.
  /// </note>
  /// The specified string must not contain a <code>:</code> (colon),
  /// <code>/</code> (slash), <code>|</code> (vertical bar), or any control
  /// characters (<code>\u0000-\u001f</code> | <code>\u007f-\u009f</code>). Also,
  /// it must <i>not</i> be the literal string <code>arn</code>.
  final TaskList? taskList;

  /// If set, specifies the priority with which the activity task is to be
  /// assigned to a worker. This overrides the defaultTaskPriority specified when
  /// registering the activity type using <a>RegisterActivityType</a>. Valid
  /// values are integers that range from Java's <code>Integer.MIN_VALUE</code>
  /// (-2147483648) to <code>Integer.MAX_VALUE</code> (2147483647). Higher numbers
  /// indicate higher priority.
  ///
  /// For more information about setting task priority, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/programming-priority.html">Setting
  /// Task Priority</a> in the <i>Amazon SWF Developer Guide</i>.
  final String? taskPriority;

  ScheduleActivityTaskDecisionAttributes({
    required this.activityId,
    required this.activityType,
    this.control,
    this.heartbeatTimeout,
    this.input,
    this.scheduleToCloseTimeout,
    this.scheduleToStartTimeout,
    this.startToCloseTimeout,
    this.taskList,
    this.taskPriority,
  });

  Map<String, dynamic> toJson() {
    final activityId = this.activityId;
    final activityType = this.activityType;
    final control = this.control;
    final heartbeatTimeout = this.heartbeatTimeout;
    final input = this.input;
    final scheduleToCloseTimeout = this.scheduleToCloseTimeout;
    final scheduleToStartTimeout = this.scheduleToStartTimeout;
    final startToCloseTimeout = this.startToCloseTimeout;
    final taskList = this.taskList;
    final taskPriority = this.taskPriority;
    return {
      'activityId': activityId,
      'activityType': activityType,
      if (control != null) 'control': control,
      if (heartbeatTimeout != null) 'heartbeatTimeout': heartbeatTimeout,
      if (input != null) 'input': input,
      if (scheduleToCloseTimeout != null)
        'scheduleToCloseTimeout': scheduleToCloseTimeout,
      if (scheduleToStartTimeout != null)
        'scheduleToStartTimeout': scheduleToStartTimeout,
      if (startToCloseTimeout != null)
        'startToCloseTimeout': startToCloseTimeout,
      if (taskList != null) 'taskList': taskList,
      if (taskPriority != null) 'taskPriority': taskPriority,
    };
  }
}

enum ScheduleActivityTaskFailedCause {
  activityTypeDeprecated,
  activityTypeDoesNotExist,
  activityIdAlreadyInUse,
  openActivitiesLimitExceeded,
  activityCreationRateExceeded,
  defaultScheduleToCloseTimeoutUndefined,
  defaultTaskListUndefined,
  defaultScheduleToStartTimeoutUndefined,
  defaultStartToCloseTimeoutUndefined,
  defaultHeartbeatTimeoutUndefined,
  operationNotPermitted,
}

extension ScheduleActivityTaskFailedCauseValueExtension
    on ScheduleActivityTaskFailedCause {
  String toValue() {
    switch (this) {
      case ScheduleActivityTaskFailedCause.activityTypeDeprecated:
        return 'ACTIVITY_TYPE_DEPRECATED';
      case ScheduleActivityTaskFailedCause.activityTypeDoesNotExist:
        return 'ACTIVITY_TYPE_DOES_NOT_EXIST';
      case ScheduleActivityTaskFailedCause.activityIdAlreadyInUse:
        return 'ACTIVITY_ID_ALREADY_IN_USE';
      case ScheduleActivityTaskFailedCause.openActivitiesLimitExceeded:
        return 'OPEN_ACTIVITIES_LIMIT_EXCEEDED';
      case ScheduleActivityTaskFailedCause.activityCreationRateExceeded:
        return 'ACTIVITY_CREATION_RATE_EXCEEDED';
      case ScheduleActivityTaskFailedCause
            .defaultScheduleToCloseTimeoutUndefined:
        return 'DEFAULT_SCHEDULE_TO_CLOSE_TIMEOUT_UNDEFINED';
      case ScheduleActivityTaskFailedCause.defaultTaskListUndefined:
        return 'DEFAULT_TASK_LIST_UNDEFINED';
      case ScheduleActivityTaskFailedCause
            .defaultScheduleToStartTimeoutUndefined:
        return 'DEFAULT_SCHEDULE_TO_START_TIMEOUT_UNDEFINED';
      case ScheduleActivityTaskFailedCause.defaultStartToCloseTimeoutUndefined:
        return 'DEFAULT_START_TO_CLOSE_TIMEOUT_UNDEFINED';
      case ScheduleActivityTaskFailedCause.defaultHeartbeatTimeoutUndefined:
        return 'DEFAULT_HEARTBEAT_TIMEOUT_UNDEFINED';
      case ScheduleActivityTaskFailedCause.operationNotPermitted:
        return 'OPERATION_NOT_PERMITTED';
    }
  }
}

extension ScheduleActivityTaskFailedCauseFromString on String {
  ScheduleActivityTaskFailedCause toScheduleActivityTaskFailedCause() {
    switch (this) {
      case 'ACTIVITY_TYPE_DEPRECATED':
        return ScheduleActivityTaskFailedCause.activityTypeDeprecated;
      case 'ACTIVITY_TYPE_DOES_NOT_EXIST':
        return ScheduleActivityTaskFailedCause.activityTypeDoesNotExist;
      case 'ACTIVITY_ID_ALREADY_IN_USE':
        return ScheduleActivityTaskFailedCause.activityIdAlreadyInUse;
      case 'OPEN_ACTIVITIES_LIMIT_EXCEEDED':
        return ScheduleActivityTaskFailedCause.openActivitiesLimitExceeded;
      case 'ACTIVITY_CREATION_RATE_EXCEEDED':
        return ScheduleActivityTaskFailedCause.activityCreationRateExceeded;
      case 'DEFAULT_SCHEDULE_TO_CLOSE_TIMEOUT_UNDEFINED':
        return ScheduleActivityTaskFailedCause
            .defaultScheduleToCloseTimeoutUndefined;
      case 'DEFAULT_TASK_LIST_UNDEFINED':
        return ScheduleActivityTaskFailedCause.defaultTaskListUndefined;
      case 'DEFAULT_SCHEDULE_TO_START_TIMEOUT_UNDEFINED':
        return ScheduleActivityTaskFailedCause
            .defaultScheduleToStartTimeoutUndefined;
      case 'DEFAULT_START_TO_CLOSE_TIMEOUT_UNDEFINED':
        return ScheduleActivityTaskFailedCause
            .defaultStartToCloseTimeoutUndefined;
      case 'DEFAULT_HEARTBEAT_TIMEOUT_UNDEFINED':
        return ScheduleActivityTaskFailedCause.defaultHeartbeatTimeoutUndefined;
      case 'OPERATION_NOT_PERMITTED':
        return ScheduleActivityTaskFailedCause.operationNotPermitted;
    }
    throw Exception(
        '$this is not known in enum ScheduleActivityTaskFailedCause');
  }
}

/// Provides the details of the <code>ScheduleActivityTaskFailed</code> event.
class ScheduleActivityTaskFailedEventAttributes {
  /// The activityId provided in the <code>ScheduleActivityTask</code> decision
  /// that failed.
  final String activityId;

  /// The activity type provided in the <code>ScheduleActivityTask</code> decision
  /// that failed.
  final ActivityType activityType;

  /// The cause of the failure. This information is generated by the system and
  /// can be useful for diagnostic purposes.
  /// <note>
  /// If <code>cause</code> is set to <code>OPERATION_NOT_PERMITTED</code>, the
  /// decision failed because it lacked sufficient permissions. For details and
  /// example IAM policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  /// </note>
  final ScheduleActivityTaskFailedCause cause;

  /// The ID of the <code>DecisionTaskCompleted</code> event corresponding to the
  /// decision that resulted in the scheduling of this activity task. This
  /// information can be useful for diagnosing problems by tracing back the chain
  /// of events leading up to this event.
  final int decisionTaskCompletedEventId;

  ScheduleActivityTaskFailedEventAttributes({
    required this.activityId,
    required this.activityType,
    required this.cause,
    required this.decisionTaskCompletedEventId,
  });

  factory ScheduleActivityTaskFailedEventAttributes.fromJson(
      Map<String, dynamic> json) {
    return ScheduleActivityTaskFailedEventAttributes(
      activityId: json['activityId'] as String,
      activityType:
          ActivityType.fromJson(json['activityType'] as Map<String, dynamic>),
      cause: (json['cause'] as String).toScheduleActivityTaskFailedCause(),
      decisionTaskCompletedEventId: json['decisionTaskCompletedEventId'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final activityId = this.activityId;
    final activityType = this.activityType;
    final cause = this.cause;
    final decisionTaskCompletedEventId = this.decisionTaskCompletedEventId;
    return {
      'activityId': activityId,
      'activityType': activityType,
      'cause': cause.toValue(),
      'decisionTaskCompletedEventId': decisionTaskCompletedEventId,
    };
  }
}

/// Decision attributes specified in
/// <code>scheduleLambdaFunctionDecisionAttributes</code> within the list of
/// decisions <code>decisions</code> passed to
/// <a>RespondDecisionTaskCompleted</a>.
class ScheduleLambdaFunctionDecisionAttributes {
  /// A string that identifies the Lambda function execution in the event history.
  final String id;

  /// The name, or ARN, of the Lambda function to schedule.
  final String name;

  /// The data attached to the event that the decider can use in subsequent
  /// workflow tasks. This data isn't sent to the Lambda task.
  final String? control;

  /// The optional input data to be supplied to the Lambda function.
  final String? input;

  /// The timeout value, in seconds, after which the Lambda function is considered
  /// to be failed once it has started. This can be any integer from 1-900
  /// (1s-15m).
  ///
  /// If no value is supplied, then a default value of 900s is assumed.
  final String? startToCloseTimeout;

  ScheduleLambdaFunctionDecisionAttributes({
    required this.id,
    required this.name,
    this.control,
    this.input,
    this.startToCloseTimeout,
  });

  Map<String, dynamic> toJson() {
    final id = this.id;
    final name = this.name;
    final control = this.control;
    final input = this.input;
    final startToCloseTimeout = this.startToCloseTimeout;
    return {
      'id': id,
      'name': name,
      if (control != null) 'control': control,
      if (input != null) 'input': input,
      if (startToCloseTimeout != null)
        'startToCloseTimeout': startToCloseTimeout,
    };
  }
}

enum ScheduleLambdaFunctionFailedCause {
  idAlreadyInUse,
  openLambdaFunctionsLimitExceeded,
  lambdaFunctionCreationRateExceeded,
  lambdaServiceNotAvailableInRegion,
}

extension ScheduleLambdaFunctionFailedCauseValueExtension
    on ScheduleLambdaFunctionFailedCause {
  String toValue() {
    switch (this) {
      case ScheduleLambdaFunctionFailedCause.idAlreadyInUse:
        return 'ID_ALREADY_IN_USE';
      case ScheduleLambdaFunctionFailedCause.openLambdaFunctionsLimitExceeded:
        return 'OPEN_LAMBDA_FUNCTIONS_LIMIT_EXCEEDED';
      case ScheduleLambdaFunctionFailedCause.lambdaFunctionCreationRateExceeded:
        return 'LAMBDA_FUNCTION_CREATION_RATE_EXCEEDED';
      case ScheduleLambdaFunctionFailedCause.lambdaServiceNotAvailableInRegion:
        return 'LAMBDA_SERVICE_NOT_AVAILABLE_IN_REGION';
    }
  }
}

extension ScheduleLambdaFunctionFailedCauseFromString on String {
  ScheduleLambdaFunctionFailedCause toScheduleLambdaFunctionFailedCause() {
    switch (this) {
      case 'ID_ALREADY_IN_USE':
        return ScheduleLambdaFunctionFailedCause.idAlreadyInUse;
      case 'OPEN_LAMBDA_FUNCTIONS_LIMIT_EXCEEDED':
        return ScheduleLambdaFunctionFailedCause
            .openLambdaFunctionsLimitExceeded;
      case 'LAMBDA_FUNCTION_CREATION_RATE_EXCEEDED':
        return ScheduleLambdaFunctionFailedCause
            .lambdaFunctionCreationRateExceeded;
      case 'LAMBDA_SERVICE_NOT_AVAILABLE_IN_REGION':
        return ScheduleLambdaFunctionFailedCause
            .lambdaServiceNotAvailableInRegion;
    }
    throw Exception(
        '$this is not known in enum ScheduleLambdaFunctionFailedCause');
  }
}

/// Provides the details of the <code>ScheduleLambdaFunctionFailed</code> event.
/// It isn't set for other event types.
class ScheduleLambdaFunctionFailedEventAttributes {
  /// The cause of the failure. To help diagnose issues, use this information to
  /// trace back the chain of events leading up to this event.
  /// <note>
  /// If <code>cause</code> is set to <code>OPERATION_NOT_PERMITTED</code>, the
  /// decision failed because it lacked sufficient permissions. For details and
  /// example IAM policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  /// </note>
  final ScheduleLambdaFunctionFailedCause cause;

  /// The ID of the <code>LambdaFunctionCompleted</code> event corresponding to
  /// the decision that resulted in scheduling this Lambda task. To help diagnose
  /// issues, use this information to trace back the chain of events leading up to
  /// this event.
  final int decisionTaskCompletedEventId;

  /// The ID provided in the <code>ScheduleLambdaFunction</code> decision that
  /// failed.
  final String id;

  /// The name of the Lambda function.
  final String name;

  ScheduleLambdaFunctionFailedEventAttributes({
    required this.cause,
    required this.decisionTaskCompletedEventId,
    required this.id,
    required this.name,
  });

  factory ScheduleLambdaFunctionFailedEventAttributes.fromJson(
      Map<String, dynamic> json) {
    return ScheduleLambdaFunctionFailedEventAttributes(
      cause: (json['cause'] as String).toScheduleLambdaFunctionFailedCause(),
      decisionTaskCompletedEventId: json['decisionTaskCompletedEventId'] as int,
      id: json['id'] as String,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final cause = this.cause;
    final decisionTaskCompletedEventId = this.decisionTaskCompletedEventId;
    final id = this.id;
    final name = this.name;
    return {
      'cause': cause.toValue(),
      'decisionTaskCompletedEventId': decisionTaskCompletedEventId,
      'id': id,
      'name': name,
    };
  }
}

/// Provides the details of the <code>SignalExternalWorkflowExecution</code>
/// decision.
///
/// <b>Access Control</b>
///
/// You can use IAM policies to control this decision's access to Amazon SWF
/// resources as follows:
///
/// <ul>
/// <li>
/// Use a <code>Resource</code> element with the domain name to limit the action
/// to only specified domains.
/// </li>
/// <li>
/// Use an <code>Action</code> element to allow or deny permission to call this
/// action.
/// </li>
/// <li>
/// You cannot use an IAM policy to constrain this action's parameters.
/// </li>
/// </ul>
/// If the caller doesn't have sufficient permissions to invoke the action, or
/// the parameter values fall outside the specified constraints, the action
/// fails. The associated event attribute's <code>cause</code> parameter is set
/// to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
/// policies, see <a
/// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
/// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
/// Developer Guide</i>.
class SignalExternalWorkflowExecutionDecisionAttributes {
  /// The name of the signal.The target workflow execution uses the signal name
  /// and input to process the signal.
  final String signalName;

  /// The <code>workflowId</code> of the workflow execution to be signaled.
  final String workflowId;

  /// The data attached to the event that can be used by the decider in subsequent
  /// decision tasks.
  final String? control;

  /// The input data to be provided with the signal. The target workflow execution
  /// uses the signal name and input data to process the signal.
  final String? input;

  /// The <code>runId</code> of the workflow execution to be signaled.
  final String? runId;

  SignalExternalWorkflowExecutionDecisionAttributes({
    required this.signalName,
    required this.workflowId,
    this.control,
    this.input,
    this.runId,
  });

  Map<String, dynamic> toJson() {
    final signalName = this.signalName;
    final workflowId = this.workflowId;
    final control = this.control;
    final input = this.input;
    final runId = this.runId;
    return {
      'signalName': signalName,
      'workflowId': workflowId,
      if (control != null) 'control': control,
      if (input != null) 'input': input,
      if (runId != null) 'runId': runId,
    };
  }
}

enum SignalExternalWorkflowExecutionFailedCause {
  unknownExternalWorkflowExecution,
  signalExternalWorkflowExecutionRateExceeded,
  operationNotPermitted,
}

extension SignalExternalWorkflowExecutionFailedCauseValueExtension
    on SignalExternalWorkflowExecutionFailedCause {
  String toValue() {
    switch (this) {
      case SignalExternalWorkflowExecutionFailedCause
            .unknownExternalWorkflowExecution:
        return 'UNKNOWN_EXTERNAL_WORKFLOW_EXECUTION';
      case SignalExternalWorkflowExecutionFailedCause
            .signalExternalWorkflowExecutionRateExceeded:
        return 'SIGNAL_EXTERNAL_WORKFLOW_EXECUTION_RATE_EXCEEDED';
      case SignalExternalWorkflowExecutionFailedCause.operationNotPermitted:
        return 'OPERATION_NOT_PERMITTED';
    }
  }
}

extension SignalExternalWorkflowExecutionFailedCauseFromString on String {
  SignalExternalWorkflowExecutionFailedCause
      toSignalExternalWorkflowExecutionFailedCause() {
    switch (this) {
      case 'UNKNOWN_EXTERNAL_WORKFLOW_EXECUTION':
        return SignalExternalWorkflowExecutionFailedCause
            .unknownExternalWorkflowExecution;
      case 'SIGNAL_EXTERNAL_WORKFLOW_EXECUTION_RATE_EXCEEDED':
        return SignalExternalWorkflowExecutionFailedCause
            .signalExternalWorkflowExecutionRateExceeded;
      case 'OPERATION_NOT_PERMITTED':
        return SignalExternalWorkflowExecutionFailedCause.operationNotPermitted;
    }
    throw Exception(
        '$this is not known in enum SignalExternalWorkflowExecutionFailedCause');
  }
}

/// Provides the details of the
/// <code>SignalExternalWorkflowExecutionFailed</code> event.
class SignalExternalWorkflowExecutionFailedEventAttributes {
  /// The cause of the failure. This information is generated by the system and
  /// can be useful for diagnostic purposes.
  /// <note>
  /// If <code>cause</code> is set to <code>OPERATION_NOT_PERMITTED</code>, the
  /// decision failed because it lacked sufficient permissions. For details and
  /// example IAM policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  /// </note>
  final SignalExternalWorkflowExecutionFailedCause cause;

  /// The ID of the <code>DecisionTaskCompleted</code> event corresponding to the
  /// decision task that resulted in the
  /// <code>SignalExternalWorkflowExecution</code> decision for this signal. This
  /// information can be useful for diagnosing problems by tracing back the chain
  /// of events leading up to this event.
  final int decisionTaskCompletedEventId;

  /// The ID of the <code>SignalExternalWorkflowExecutionInitiated</code> event
  /// corresponding to the <code>SignalExternalWorkflowExecution</code> decision
  /// to request this signal. This information can be useful for diagnosing
  /// problems by tracing back the chain of events leading up to this event.
  final int initiatedEventId;

  /// The <code>workflowId</code> of the external workflow execution that the
  /// signal was being delivered to.
  final String workflowId;

  /// The data attached to the event that the decider can use in subsequent
  /// workflow tasks. This data isn't sent to the workflow execution.
  final String? control;

  /// The <code>runId</code> of the external workflow execution that the signal
  /// was being delivered to.
  final String? runId;

  SignalExternalWorkflowExecutionFailedEventAttributes({
    required this.cause,
    required this.decisionTaskCompletedEventId,
    required this.initiatedEventId,
    required this.workflowId,
    this.control,
    this.runId,
  });

  factory SignalExternalWorkflowExecutionFailedEventAttributes.fromJson(
      Map<String, dynamic> json) {
    return SignalExternalWorkflowExecutionFailedEventAttributes(
      cause: (json['cause'] as String)
          .toSignalExternalWorkflowExecutionFailedCause(),
      decisionTaskCompletedEventId: json['decisionTaskCompletedEventId'] as int,
      initiatedEventId: json['initiatedEventId'] as int,
      workflowId: json['workflowId'] as String,
      control: json['control'] as String?,
      runId: json['runId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cause = this.cause;
    final decisionTaskCompletedEventId = this.decisionTaskCompletedEventId;
    final initiatedEventId = this.initiatedEventId;
    final workflowId = this.workflowId;
    final control = this.control;
    final runId = this.runId;
    return {
      'cause': cause.toValue(),
      'decisionTaskCompletedEventId': decisionTaskCompletedEventId,
      'initiatedEventId': initiatedEventId,
      'workflowId': workflowId,
      if (control != null) 'control': control,
      if (runId != null) 'runId': runId,
    };
  }
}

/// Provides the details of the
/// <code>SignalExternalWorkflowExecutionInitiated</code> event.
class SignalExternalWorkflowExecutionInitiatedEventAttributes {
  /// The ID of the <code>DecisionTaskCompleted</code> event corresponding to the
  /// decision task that resulted in the
  /// <code>SignalExternalWorkflowExecution</code> decision for this signal. This
  /// information can be useful for diagnosing problems by tracing back the chain
  /// of events leading up to this event.
  final int decisionTaskCompletedEventId;

  /// The name of the signal.
  final String signalName;

  /// The <code>workflowId</code> of the external workflow execution.
  final String workflowId;

  /// Data attached to the event that can be used by the decider in subsequent
  /// decision tasks.
  final String? control;

  /// The input provided to the signal.
  final String? input;

  /// The <code>runId</code> of the external workflow execution to send the signal
  /// to.
  final String? runId;

  SignalExternalWorkflowExecutionInitiatedEventAttributes({
    required this.decisionTaskCompletedEventId,
    required this.signalName,
    required this.workflowId,
    this.control,
    this.input,
    this.runId,
  });

  factory SignalExternalWorkflowExecutionInitiatedEventAttributes.fromJson(
      Map<String, dynamic> json) {
    return SignalExternalWorkflowExecutionInitiatedEventAttributes(
      decisionTaskCompletedEventId: json['decisionTaskCompletedEventId'] as int,
      signalName: json['signalName'] as String,
      workflowId: json['workflowId'] as String,
      control: json['control'] as String?,
      input: json['input'] as String?,
      runId: json['runId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final decisionTaskCompletedEventId = this.decisionTaskCompletedEventId;
    final signalName = this.signalName;
    final workflowId = this.workflowId;
    final control = this.control;
    final input = this.input;
    final runId = this.runId;
    return {
      'decisionTaskCompletedEventId': decisionTaskCompletedEventId,
      'signalName': signalName,
      'workflowId': workflowId,
      if (control != null) 'control': control,
      if (input != null) 'input': input,
      if (runId != null) 'runId': runId,
    };
  }
}

/// Provides the details of the <code>StartChildWorkflowExecution</code>
/// decision.
///
/// <b>Access Control</b>
///
/// You can use IAM policies to control this decision's access to Amazon SWF
/// resources as follows:
///
/// <ul>
/// <li>
/// Use a <code>Resource</code> element with the domain name to limit the action
/// to only specified domains.
/// </li>
/// <li>
/// Use an <code>Action</code> element to allow or deny permission to call this
/// action.
/// </li>
/// <li>
/// Constrain the following parameters by using a <code>Condition</code> element
/// with the appropriate keys.
///
/// <ul>
/// <li>
/// <code>tagList.member.N</code> – The key is "swf:tagList.N" where N is the
/// tag number from 0 to 4, inclusive.
/// </li>
/// <li>
/// <code>taskList</code> – String constraint. The key is
/// <code>swf:taskList.name</code>.
/// </li>
/// <li>
/// <code>workflowType.name</code> – String constraint. The key is
/// <code>swf:workflowType.name</code>.
/// </li>
/// <li>
/// <code>workflowType.version</code> – String constraint. The key is
/// <code>swf:workflowType.version</code>.
/// </li>
/// </ul> </li>
/// </ul>
/// If the caller doesn't have sufficient permissions to invoke the action, or
/// the parameter values fall outside the specified constraints, the action
/// fails. The associated event attribute's <code>cause</code> parameter is set
/// to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
/// policies, see <a
/// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
/// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
/// Developer Guide</i>.
class StartChildWorkflowExecutionDecisionAttributes {
  /// The <code>workflowId</code> of the workflow execution.
  ///
  /// The specified string must not contain a <code>:</code> (colon),
  /// <code>/</code> (slash), <code>|</code> (vertical bar), or any control
  /// characters (<code>\u0000-\u001f</code> | <code>\u007f-\u009f</code>). Also,
  /// it must <i>not</i> be the literal string <code>arn</code>.
  final String workflowId;

  /// The type of the workflow execution to be started.
  final WorkflowType workflowType;

  /// If set, specifies the policy to use for the child workflow executions if the
  /// workflow execution being started is terminated by calling the
  /// <a>TerminateWorkflowExecution</a> action explicitly or due to an expired
  /// timeout. This policy overrides the default child policy specified when
  /// registering the workflow type using <a>RegisterWorkflowType</a>.
  ///
  /// The supported child policies are:
  ///
  /// <ul>
  /// <li>
  /// <code>TERMINATE</code> – The child executions are terminated.
  /// </li>
  /// <li>
  /// <code>REQUEST_CANCEL</code> – A request to cancel is attempted for each
  /// child execution by recording a <code>WorkflowExecutionCancelRequested</code>
  /// event in its history. It is up to the decider to take appropriate actions
  /// when it receives an execution history with this event.
  /// </li>
  /// <li>
  /// <code>ABANDON</code> – No action is taken. The child executions continue to
  /// run.
  /// </li>
  /// </ul> <note>
  /// A child policy for this workflow execution must be specified either as a
  /// default for the workflow type or through this parameter. If neither this
  /// parameter is set nor a default child policy was specified at registration
  /// time then a fault is returned.
  /// </note>
  final ChildPolicy? childPolicy;

  /// The data attached to the event that can be used by the decider in subsequent
  /// workflow tasks. This data isn't sent to the child workflow execution.
  final String? control;

  /// The total duration for this workflow execution. This overrides the
  /// defaultExecutionStartToCloseTimeout specified when registering the workflow
  /// type.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// <code>0</code>. You can use <code>NONE</code> to specify unlimited duration.
  /// <note>
  /// An execution start-to-close timeout for this workflow execution must be
  /// specified either as a default for the workflow type or through this
  /// parameter. If neither this parameter is set nor a default execution
  /// start-to-close timeout was specified at registration time then a fault is
  /// returned.
  /// </note>
  final String? executionStartToCloseTimeout;

  /// The input to be provided to the workflow execution.
  final String? input;

  /// The IAM role attached to the child workflow execution.
  final String? lambdaRole;

  /// The list of tags to associate with the child workflow execution. A maximum
  /// of 5 tags can be specified. You can list workflow executions with a specific
  /// tag by calling <a>ListOpenWorkflowExecutions</a> or
  /// <a>ListClosedWorkflowExecutions</a> and specifying a <a>TagFilter</a>.
  final List<String>? tagList;

  /// The name of the task list to be used for decision tasks of the child
  /// workflow execution.
  /// <note>
  /// A task list for this workflow execution must be specified either as a
  /// default for the workflow type or through this parameter. If neither this
  /// parameter is set nor a default task list was specified at registration time
  /// then a fault is returned.
  /// </note>
  /// The specified string must not start or end with whitespace. It must not
  /// contain a <code>:</code> (colon), <code>/</code> (slash), <code>|</code>
  /// (vertical bar), or any control characters (<code>\u0000-\u001f</code> |
  /// <code>\u007f-\u009f</code>). Also, it must <i>not</i> be the literal string
  /// <code>arn</code>.
  final TaskList? taskList;

  /// A task priority that, if set, specifies the priority for a decision task of
  /// this workflow execution. This overrides the defaultTaskPriority specified
  /// when registering the workflow type. Valid values are integers that range
  /// from Java's <code>Integer.MIN_VALUE</code> (-2147483648) to
  /// <code>Integer.MAX_VALUE</code> (2147483647). Higher numbers indicate higher
  /// priority.
  ///
  /// For more information about setting task priority, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/programming-priority.html">Setting
  /// Task Priority</a> in the <i>Amazon SWF Developer Guide</i>.
  final String? taskPriority;

  /// Specifies the maximum duration of decision tasks for this workflow
  /// execution. This parameter overrides the
  /// <code>defaultTaskStartToCloseTimout</code> specified when registering the
  /// workflow type using <a>RegisterWorkflowType</a>.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// <code>0</code>. You can use <code>NONE</code> to specify unlimited duration.
  /// <note>
  /// A task start-to-close timeout for this workflow execution must be specified
  /// either as a default for the workflow type or through this parameter. If
  /// neither this parameter is set nor a default task start-to-close timeout was
  /// specified at registration time then a fault is returned.
  /// </note>
  final String? taskStartToCloseTimeout;

  StartChildWorkflowExecutionDecisionAttributes({
    required this.workflowId,
    required this.workflowType,
    this.childPolicy,
    this.control,
    this.executionStartToCloseTimeout,
    this.input,
    this.lambdaRole,
    this.tagList,
    this.taskList,
    this.taskPriority,
    this.taskStartToCloseTimeout,
  });

  Map<String, dynamic> toJson() {
    final workflowId = this.workflowId;
    final workflowType = this.workflowType;
    final childPolicy = this.childPolicy;
    final control = this.control;
    final executionStartToCloseTimeout = this.executionStartToCloseTimeout;
    final input = this.input;
    final lambdaRole = this.lambdaRole;
    final tagList = this.tagList;
    final taskList = this.taskList;
    final taskPriority = this.taskPriority;
    final taskStartToCloseTimeout = this.taskStartToCloseTimeout;
    return {
      'workflowId': workflowId,
      'workflowType': workflowType,
      if (childPolicy != null) 'childPolicy': childPolicy.toValue(),
      if (control != null) 'control': control,
      if (executionStartToCloseTimeout != null)
        'executionStartToCloseTimeout': executionStartToCloseTimeout,
      if (input != null) 'input': input,
      if (lambdaRole != null) 'lambdaRole': lambdaRole,
      if (tagList != null) 'tagList': tagList,
      if (taskList != null) 'taskList': taskList,
      if (taskPriority != null) 'taskPriority': taskPriority,
      if (taskStartToCloseTimeout != null)
        'taskStartToCloseTimeout': taskStartToCloseTimeout,
    };
  }
}

enum StartChildWorkflowExecutionFailedCause {
  workflowTypeDoesNotExist,
  workflowTypeDeprecated,
  openChildrenLimitExceeded,
  openWorkflowsLimitExceeded,
  childCreationRateExceeded,
  workflowAlreadyRunning,
  defaultExecutionStartToCloseTimeoutUndefined,
  defaultTaskListUndefined,
  defaultTaskStartToCloseTimeoutUndefined,
  defaultChildPolicyUndefined,
  operationNotPermitted,
}

extension StartChildWorkflowExecutionFailedCauseValueExtension
    on StartChildWorkflowExecutionFailedCause {
  String toValue() {
    switch (this) {
      case StartChildWorkflowExecutionFailedCause.workflowTypeDoesNotExist:
        return 'WORKFLOW_TYPE_DOES_NOT_EXIST';
      case StartChildWorkflowExecutionFailedCause.workflowTypeDeprecated:
        return 'WORKFLOW_TYPE_DEPRECATED';
      case StartChildWorkflowExecutionFailedCause.openChildrenLimitExceeded:
        return 'OPEN_CHILDREN_LIMIT_EXCEEDED';
      case StartChildWorkflowExecutionFailedCause.openWorkflowsLimitExceeded:
        return 'OPEN_WORKFLOWS_LIMIT_EXCEEDED';
      case StartChildWorkflowExecutionFailedCause.childCreationRateExceeded:
        return 'CHILD_CREATION_RATE_EXCEEDED';
      case StartChildWorkflowExecutionFailedCause.workflowAlreadyRunning:
        return 'WORKFLOW_ALREADY_RUNNING';
      case StartChildWorkflowExecutionFailedCause
            .defaultExecutionStartToCloseTimeoutUndefined:
        return 'DEFAULT_EXECUTION_START_TO_CLOSE_TIMEOUT_UNDEFINED';
      case StartChildWorkflowExecutionFailedCause.defaultTaskListUndefined:
        return 'DEFAULT_TASK_LIST_UNDEFINED';
      case StartChildWorkflowExecutionFailedCause
            .defaultTaskStartToCloseTimeoutUndefined:
        return 'DEFAULT_TASK_START_TO_CLOSE_TIMEOUT_UNDEFINED';
      case StartChildWorkflowExecutionFailedCause.defaultChildPolicyUndefined:
        return 'DEFAULT_CHILD_POLICY_UNDEFINED';
      case StartChildWorkflowExecutionFailedCause.operationNotPermitted:
        return 'OPERATION_NOT_PERMITTED';
    }
  }
}

extension StartChildWorkflowExecutionFailedCauseFromString on String {
  StartChildWorkflowExecutionFailedCause
      toStartChildWorkflowExecutionFailedCause() {
    switch (this) {
      case 'WORKFLOW_TYPE_DOES_NOT_EXIST':
        return StartChildWorkflowExecutionFailedCause.workflowTypeDoesNotExist;
      case 'WORKFLOW_TYPE_DEPRECATED':
        return StartChildWorkflowExecutionFailedCause.workflowTypeDeprecated;
      case 'OPEN_CHILDREN_LIMIT_EXCEEDED':
        return StartChildWorkflowExecutionFailedCause.openChildrenLimitExceeded;
      case 'OPEN_WORKFLOWS_LIMIT_EXCEEDED':
        return StartChildWorkflowExecutionFailedCause
            .openWorkflowsLimitExceeded;
      case 'CHILD_CREATION_RATE_EXCEEDED':
        return StartChildWorkflowExecutionFailedCause.childCreationRateExceeded;
      case 'WORKFLOW_ALREADY_RUNNING':
        return StartChildWorkflowExecutionFailedCause.workflowAlreadyRunning;
      case 'DEFAULT_EXECUTION_START_TO_CLOSE_TIMEOUT_UNDEFINED':
        return StartChildWorkflowExecutionFailedCause
            .defaultExecutionStartToCloseTimeoutUndefined;
      case 'DEFAULT_TASK_LIST_UNDEFINED':
        return StartChildWorkflowExecutionFailedCause.defaultTaskListUndefined;
      case 'DEFAULT_TASK_START_TO_CLOSE_TIMEOUT_UNDEFINED':
        return StartChildWorkflowExecutionFailedCause
            .defaultTaskStartToCloseTimeoutUndefined;
      case 'DEFAULT_CHILD_POLICY_UNDEFINED':
        return StartChildWorkflowExecutionFailedCause
            .defaultChildPolicyUndefined;
      case 'OPERATION_NOT_PERMITTED':
        return StartChildWorkflowExecutionFailedCause.operationNotPermitted;
    }
    throw Exception(
        '$this is not known in enum StartChildWorkflowExecutionFailedCause');
  }
}

/// Provides the details of the <code>StartChildWorkflowExecutionFailed</code>
/// event.
class StartChildWorkflowExecutionFailedEventAttributes {
  /// The cause of the failure. This information is generated by the system and
  /// can be useful for diagnostic purposes.
  /// <note>
  /// When <code>cause</code> is set to <code>OPERATION_NOT_PERMITTED</code>, the
  /// decision fails because it lacks sufficient permissions. For details and
  /// example IAM policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">
  /// Using IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  /// </note>
  final StartChildWorkflowExecutionFailedCause cause;

  /// The ID of the <code>DecisionTaskCompleted</code> event corresponding to the
  /// decision task that resulted in the <code>StartChildWorkflowExecution</code>
  /// <a>Decision</a> to request this child workflow execution. This information
  /// can be useful for diagnosing problems by tracing back the chain of events.
  final int decisionTaskCompletedEventId;

  /// When the <code>cause</code> is <code>WORKFLOW_ALREADY_RUNNING</code>,
  /// <code>initiatedEventId</code> is the ID of the
  /// <code>StartChildWorkflowExecutionInitiated</code> event that corresponds to
  /// the <code>StartChildWorkflowExecution</code> <a>Decision</a> to start the
  /// workflow execution. You can use this information to diagnose problems by
  /// tracing back the chain of events leading up to this event.
  ///
  /// When the <code>cause</code> isn't <code>WORKFLOW_ALREADY_RUNNING</code>,
  /// <code>initiatedEventId</code> is set to <code>0</code> because the
  /// <code>StartChildWorkflowExecutionInitiated</code> event doesn't exist.
  final int initiatedEventId;

  /// The <code>workflowId</code> of the child workflow execution.
  final String workflowId;

  /// The workflow type provided in the <code>StartChildWorkflowExecution</code>
  /// <a>Decision</a> that failed.
  final WorkflowType workflowType;

  /// The data attached to the event that the decider can use in subsequent
  /// workflow tasks. This data isn't sent to the child workflow execution.
  final String? control;

  StartChildWorkflowExecutionFailedEventAttributes({
    required this.cause,
    required this.decisionTaskCompletedEventId,
    required this.initiatedEventId,
    required this.workflowId,
    required this.workflowType,
    this.control,
  });

  factory StartChildWorkflowExecutionFailedEventAttributes.fromJson(
      Map<String, dynamic> json) {
    return StartChildWorkflowExecutionFailedEventAttributes(
      cause:
          (json['cause'] as String).toStartChildWorkflowExecutionFailedCause(),
      decisionTaskCompletedEventId: json['decisionTaskCompletedEventId'] as int,
      initiatedEventId: json['initiatedEventId'] as int,
      workflowId: json['workflowId'] as String,
      workflowType:
          WorkflowType.fromJson(json['workflowType'] as Map<String, dynamic>),
      control: json['control'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cause = this.cause;
    final decisionTaskCompletedEventId = this.decisionTaskCompletedEventId;
    final initiatedEventId = this.initiatedEventId;
    final workflowId = this.workflowId;
    final workflowType = this.workflowType;
    final control = this.control;
    return {
      'cause': cause.toValue(),
      'decisionTaskCompletedEventId': decisionTaskCompletedEventId,
      'initiatedEventId': initiatedEventId,
      'workflowId': workflowId,
      'workflowType': workflowType,
      if (control != null) 'control': control,
    };
  }
}

/// Provides the details of the
/// <code>StartChildWorkflowExecutionInitiated</code> event.
class StartChildWorkflowExecutionInitiatedEventAttributes {
  /// The policy to use for the child workflow executions if this execution gets
  /// terminated by explicitly calling the <a>TerminateWorkflowExecution</a>
  /// action or due to an expired timeout.
  ///
  /// The supported child policies are:
  ///
  /// <ul>
  /// <li>
  /// <code>TERMINATE</code> – The child executions are terminated.
  /// </li>
  /// <li>
  /// <code>REQUEST_CANCEL</code> – A request to cancel is attempted for each
  /// child execution by recording a <code>WorkflowExecutionCancelRequested</code>
  /// event in its history. It is up to the decider to take appropriate actions
  /// when it receives an execution history with this event.
  /// </li>
  /// <li>
  /// <code>ABANDON</code> – No action is taken. The child executions continue to
  /// run.
  /// </li>
  /// </ul>
  final ChildPolicy childPolicy;

  /// The ID of the <code>DecisionTaskCompleted</code> event corresponding to the
  /// decision task that resulted in the <code>StartChildWorkflowExecution</code>
  /// <a>Decision</a> to request this child workflow execution. This information
  /// can be useful for diagnosing problems by tracing back the cause of events.
  final int decisionTaskCompletedEventId;

  /// The name of the task list used for the decision tasks of the child workflow
  /// execution.
  final TaskList taskList;

  /// The <code>workflowId</code> of the child workflow execution.
  final String workflowId;

  /// The type of the child workflow execution.
  final WorkflowType workflowType;

  /// Data attached to the event that can be used by the decider in subsequent
  /// decision tasks. This data isn't sent to the activity.
  final String? control;

  /// The maximum duration for the child workflow execution. If the workflow
  /// execution isn't closed within this duration, it is timed out and
  /// force-terminated.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// <code>0</code>. You can use <code>NONE</code> to specify unlimited duration.
  final String? executionStartToCloseTimeout;

  /// The inputs provided to the child workflow execution.
  final String? input;

  /// The IAM role to attach to the child workflow execution.
  final String? lambdaRole;

  /// The list of tags to associated with the child workflow execution.
  final List<String>? tagList;

  /// The priority assigned for the decision tasks for this workflow execution.
  /// Valid values are integers that range from Java's
  /// <code>Integer.MIN_VALUE</code> (-2147483648) to
  /// <code>Integer.MAX_VALUE</code> (2147483647). Higher numbers indicate higher
  /// priority.
  ///
  /// For more information about setting task priority, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/programming-priority.html">Setting
  /// Task Priority</a> in the <i>Amazon SWF Developer Guide</i>.
  final String? taskPriority;

  /// The maximum duration allowed for the decision tasks for this workflow
  /// execution.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// <code>0</code>. You can use <code>NONE</code> to specify unlimited duration.
  final String? taskStartToCloseTimeout;

  StartChildWorkflowExecutionInitiatedEventAttributes({
    required this.childPolicy,
    required this.decisionTaskCompletedEventId,
    required this.taskList,
    required this.workflowId,
    required this.workflowType,
    this.control,
    this.executionStartToCloseTimeout,
    this.input,
    this.lambdaRole,
    this.tagList,
    this.taskPriority,
    this.taskStartToCloseTimeout,
  });

  factory StartChildWorkflowExecutionInitiatedEventAttributes.fromJson(
      Map<String, dynamic> json) {
    return StartChildWorkflowExecutionInitiatedEventAttributes(
      childPolicy: (json['childPolicy'] as String).toChildPolicy(),
      decisionTaskCompletedEventId: json['decisionTaskCompletedEventId'] as int,
      taskList: TaskList.fromJson(json['taskList'] as Map<String, dynamic>),
      workflowId: json['workflowId'] as String,
      workflowType:
          WorkflowType.fromJson(json['workflowType'] as Map<String, dynamic>),
      control: json['control'] as String?,
      executionStartToCloseTimeout:
          json['executionStartToCloseTimeout'] as String?,
      input: json['input'] as String?,
      lambdaRole: json['lambdaRole'] as String?,
      tagList: (json['tagList'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      taskPriority: json['taskPriority'] as String?,
      taskStartToCloseTimeout: json['taskStartToCloseTimeout'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final childPolicy = this.childPolicy;
    final decisionTaskCompletedEventId = this.decisionTaskCompletedEventId;
    final taskList = this.taskList;
    final workflowId = this.workflowId;
    final workflowType = this.workflowType;
    final control = this.control;
    final executionStartToCloseTimeout = this.executionStartToCloseTimeout;
    final input = this.input;
    final lambdaRole = this.lambdaRole;
    final tagList = this.tagList;
    final taskPriority = this.taskPriority;
    final taskStartToCloseTimeout = this.taskStartToCloseTimeout;
    return {
      'childPolicy': childPolicy.toValue(),
      'decisionTaskCompletedEventId': decisionTaskCompletedEventId,
      'taskList': taskList,
      'workflowId': workflowId,
      'workflowType': workflowType,
      if (control != null) 'control': control,
      if (executionStartToCloseTimeout != null)
        'executionStartToCloseTimeout': executionStartToCloseTimeout,
      if (input != null) 'input': input,
      if (lambdaRole != null) 'lambdaRole': lambdaRole,
      if (tagList != null) 'tagList': tagList,
      if (taskPriority != null) 'taskPriority': taskPriority,
      if (taskStartToCloseTimeout != null)
        'taskStartToCloseTimeout': taskStartToCloseTimeout,
    };
  }
}

enum StartLambdaFunctionFailedCause {
  assumeRoleFailed,
}

extension StartLambdaFunctionFailedCauseValueExtension
    on StartLambdaFunctionFailedCause {
  String toValue() {
    switch (this) {
      case StartLambdaFunctionFailedCause.assumeRoleFailed:
        return 'ASSUME_ROLE_FAILED';
    }
  }
}

extension StartLambdaFunctionFailedCauseFromString on String {
  StartLambdaFunctionFailedCause toStartLambdaFunctionFailedCause() {
    switch (this) {
      case 'ASSUME_ROLE_FAILED':
        return StartLambdaFunctionFailedCause.assumeRoleFailed;
    }
    throw Exception(
        '$this is not known in enum StartLambdaFunctionFailedCause');
  }
}

/// Provides the details of the <code>StartLambdaFunctionFailed</code> event. It
/// isn't set for other event types.
class StartLambdaFunctionFailedEventAttributes {
  /// The cause of the failure. To help diagnose issues, use this information to
  /// trace back the chain of events leading up to this event.
  /// <note>
  /// If <code>cause</code> is set to <code>OPERATION_NOT_PERMITTED</code>, the
  /// decision failed because the IAM role attached to the execution lacked
  /// sufficient permissions. For details and example IAM policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/lambda-task.html">Lambda
  /// Tasks</a> in the <i>Amazon SWF Developer Guide</i>.
  /// </note>
  final StartLambdaFunctionFailedCause? cause;

  /// A description that can help diagnose the cause of the fault.
  final String? message;

  /// The ID of the <code>ActivityTaskScheduled</code> event that was recorded
  /// when this activity task was scheduled. To help diagnose issues, use this
  /// information to trace back the chain of events leading up to this event.
  final int? scheduledEventId;

  StartLambdaFunctionFailedEventAttributes({
    this.cause,
    this.message,
    this.scheduledEventId,
  });

  factory StartLambdaFunctionFailedEventAttributes.fromJson(
      Map<String, dynamic> json) {
    return StartLambdaFunctionFailedEventAttributes(
      cause: (json['cause'] as String?)?.toStartLambdaFunctionFailedCause(),
      message: json['message'] as String?,
      scheduledEventId: json['scheduledEventId'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final cause = this.cause;
    final message = this.message;
    final scheduledEventId = this.scheduledEventId;
    return {
      if (cause != null) 'cause': cause.toValue(),
      if (message != null) 'message': message,
      if (scheduledEventId != null) 'scheduledEventId': scheduledEventId,
    };
  }
}

/// Provides the details of the <code>StartTimer</code> decision.
///
/// <b>Access Control</b>
///
/// You can use IAM policies to control this decision's access to Amazon SWF
/// resources as follows:
///
/// <ul>
/// <li>
/// Use a <code>Resource</code> element with the domain name to limit the action
/// to only specified domains.
/// </li>
/// <li>
/// Use an <code>Action</code> element to allow or deny permission to call this
/// action.
/// </li>
/// <li>
/// You cannot use an IAM policy to constrain this action's parameters.
/// </li>
/// </ul>
/// If the caller doesn't have sufficient permissions to invoke the action, or
/// the parameter values fall outside the specified constraints, the action
/// fails. The associated event attribute's <code>cause</code> parameter is set
/// to <code>OPERATION_NOT_PERMITTED</code>. For details and example IAM
/// policies, see <a
/// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
/// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
/// Developer Guide</i>.
class StartTimerDecisionAttributes {
  /// The duration to wait before firing the timer.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// <code>0</code>.
  final String startToFireTimeout;

  /// The unique ID of the timer.
  ///
  /// The specified string must not contain a <code>:</code> (colon),
  /// <code>/</code> (slash), <code>|</code> (vertical bar), or any control
  /// characters (<code>\u0000-\u001f</code> | <code>\u007f-\u009f</code>). Also,
  /// it must <i>not</i> be the literal string <code>arn</code>.
  final String timerId;

  /// The data attached to the event that can be used by the decider in subsequent
  /// workflow tasks.
  final String? control;

  StartTimerDecisionAttributes({
    required this.startToFireTimeout,
    required this.timerId,
    this.control,
  });

  Map<String, dynamic> toJson() {
    final startToFireTimeout = this.startToFireTimeout;
    final timerId = this.timerId;
    final control = this.control;
    return {
      'startToFireTimeout': startToFireTimeout,
      'timerId': timerId,
      if (control != null) 'control': control,
    };
  }
}

enum StartTimerFailedCause {
  timerIdAlreadyInUse,
  openTimersLimitExceeded,
  timerCreationRateExceeded,
  operationNotPermitted,
}

extension StartTimerFailedCauseValueExtension on StartTimerFailedCause {
  String toValue() {
    switch (this) {
      case StartTimerFailedCause.timerIdAlreadyInUse:
        return 'TIMER_ID_ALREADY_IN_USE';
      case StartTimerFailedCause.openTimersLimitExceeded:
        return 'OPEN_TIMERS_LIMIT_EXCEEDED';
      case StartTimerFailedCause.timerCreationRateExceeded:
        return 'TIMER_CREATION_RATE_EXCEEDED';
      case StartTimerFailedCause.operationNotPermitted:
        return 'OPERATION_NOT_PERMITTED';
    }
  }
}

extension StartTimerFailedCauseFromString on String {
  StartTimerFailedCause toStartTimerFailedCause() {
    switch (this) {
      case 'TIMER_ID_ALREADY_IN_USE':
        return StartTimerFailedCause.timerIdAlreadyInUse;
      case 'OPEN_TIMERS_LIMIT_EXCEEDED':
        return StartTimerFailedCause.openTimersLimitExceeded;
      case 'TIMER_CREATION_RATE_EXCEEDED':
        return StartTimerFailedCause.timerCreationRateExceeded;
      case 'OPERATION_NOT_PERMITTED':
        return StartTimerFailedCause.operationNotPermitted;
    }
    throw Exception('$this is not known in enum StartTimerFailedCause');
  }
}

/// Provides the details of the <code>StartTimerFailed</code> event.
class StartTimerFailedEventAttributes {
  /// The cause of the failure. This information is generated by the system and
  /// can be useful for diagnostic purposes.
  /// <note>
  /// If <code>cause</code> is set to <code>OPERATION_NOT_PERMITTED</code>, the
  /// decision failed because it lacked sufficient permissions. For details and
  /// example IAM policies, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html">Using
  /// IAM to Manage Access to Amazon SWF Workflows</a> in the <i>Amazon SWF
  /// Developer Guide</i>.
  /// </note>
  final StartTimerFailedCause cause;

  /// The ID of the <code>DecisionTaskCompleted</code> event corresponding to the
  /// decision task that resulted in the <code>StartTimer</code> decision for this
  /// activity task. This information can be useful for diagnosing problems by
  /// tracing back the chain of events leading up to this event.
  final int decisionTaskCompletedEventId;

  /// The timerId provided in the <code>StartTimer</code> decision that failed.
  final String timerId;

  StartTimerFailedEventAttributes({
    required this.cause,
    required this.decisionTaskCompletedEventId,
    required this.timerId,
  });

  factory StartTimerFailedEventAttributes.fromJson(Map<String, dynamic> json) {
    return StartTimerFailedEventAttributes(
      cause: (json['cause'] as String).toStartTimerFailedCause(),
      decisionTaskCompletedEventId: json['decisionTaskCompletedEventId'] as int,
      timerId: json['timerId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final cause = this.cause;
    final decisionTaskCompletedEventId = this.decisionTaskCompletedEventId;
    final timerId = this.timerId;
    return {
      'cause': cause.toValue(),
      'decisionTaskCompletedEventId': decisionTaskCompletedEventId,
      'timerId': timerId,
    };
  }
}

/// Used to filter the workflow executions in visibility APIs based on a tag.
class TagFilter {
  /// Specifies the tag that must be associated with the execution for it to meet
  /// the filter criteria.
  ///
  /// Tags may only contain unicode letters, digits, whitespace, or these symbols:
  /// <code>_ . : / = + - @</code>.
  final String tag;

  TagFilter({
    required this.tag,
  });

  Map<String, dynamic> toJson() {
    final tag = this.tag;
    return {
      'tag': tag,
    };
  }
}

/// Represents a task list.
class TaskList {
  /// The name of the task list.
  final String name;

  TaskList({
    required this.name,
  });

  factory TaskList.fromJson(Map<String, dynamic> json) {
    return TaskList(
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      'name': name,
    };
  }
}

/// Provides the details of the <code>TimerCanceled</code> event.
class TimerCanceledEventAttributes {
  /// The ID of the <code>DecisionTaskCompleted</code> event corresponding to the
  /// decision task that resulted in the <code>CancelTimer</code> decision to
  /// cancel this timer. This information can be useful for diagnosing problems by
  /// tracing back the chain of events leading up to this event.
  final int decisionTaskCompletedEventId;

  /// The ID of the <code>TimerStarted</code> event that was recorded when this
  /// timer was started. This information can be useful for diagnosing problems by
  /// tracing back the chain of events leading up to this event.
  final int startedEventId;

  /// The unique ID of the timer that was canceled.
  final String timerId;

  TimerCanceledEventAttributes({
    required this.decisionTaskCompletedEventId,
    required this.startedEventId,
    required this.timerId,
  });

  factory TimerCanceledEventAttributes.fromJson(Map<String, dynamic> json) {
    return TimerCanceledEventAttributes(
      decisionTaskCompletedEventId: json['decisionTaskCompletedEventId'] as int,
      startedEventId: json['startedEventId'] as int,
      timerId: json['timerId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final decisionTaskCompletedEventId = this.decisionTaskCompletedEventId;
    final startedEventId = this.startedEventId;
    final timerId = this.timerId;
    return {
      'decisionTaskCompletedEventId': decisionTaskCompletedEventId,
      'startedEventId': startedEventId,
      'timerId': timerId,
    };
  }
}

/// Provides the details of the <code>TimerFired</code> event.
class TimerFiredEventAttributes {
  /// The ID of the <code>TimerStarted</code> event that was recorded when this
  /// timer was started. This information can be useful for diagnosing problems by
  /// tracing back the chain of events leading up to this event.
  final int startedEventId;

  /// The unique ID of the timer that fired.
  final String timerId;

  TimerFiredEventAttributes({
    required this.startedEventId,
    required this.timerId,
  });

  factory TimerFiredEventAttributes.fromJson(Map<String, dynamic> json) {
    return TimerFiredEventAttributes(
      startedEventId: json['startedEventId'] as int,
      timerId: json['timerId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final startedEventId = this.startedEventId;
    final timerId = this.timerId;
    return {
      'startedEventId': startedEventId,
      'timerId': timerId,
    };
  }
}

/// Provides the details of the <code>TimerStarted</code> event.
class TimerStartedEventAttributes {
  /// The ID of the <code>DecisionTaskCompleted</code> event corresponding to the
  /// decision task that resulted in the <code>StartTimer</code> decision for this
  /// activity task. This information can be useful for diagnosing problems by
  /// tracing back the chain of events leading up to this event.
  final int decisionTaskCompletedEventId;

  /// The duration of time after which the timer fires.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// <code>0</code>.
  final String startToFireTimeout;

  /// The unique ID of the timer that was started.
  final String timerId;

  /// Data attached to the event that can be used by the decider in subsequent
  /// workflow tasks.
  final String? control;

  TimerStartedEventAttributes({
    required this.decisionTaskCompletedEventId,
    required this.startToFireTimeout,
    required this.timerId,
    this.control,
  });

  factory TimerStartedEventAttributes.fromJson(Map<String, dynamic> json) {
    return TimerStartedEventAttributes(
      decisionTaskCompletedEventId: json['decisionTaskCompletedEventId'] as int,
      startToFireTimeout: json['startToFireTimeout'] as String,
      timerId: json['timerId'] as String,
      control: json['control'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final decisionTaskCompletedEventId = this.decisionTaskCompletedEventId;
    final startToFireTimeout = this.startToFireTimeout;
    final timerId = this.timerId;
    final control = this.control;
    return {
      'decisionTaskCompletedEventId': decisionTaskCompletedEventId,
      'startToFireTimeout': startToFireTimeout,
      'timerId': timerId,
      if (control != null) 'control': control,
    };
  }
}

/// Represents a workflow execution.
class WorkflowExecution {
  /// A system-generated unique identifier for the workflow execution.
  final String runId;

  /// The user defined identifier associated with the workflow execution.
  final String workflowId;

  WorkflowExecution({
    required this.runId,
    required this.workflowId,
  });

  factory WorkflowExecution.fromJson(Map<String, dynamic> json) {
    return WorkflowExecution(
      runId: json['runId'] as String,
      workflowId: json['workflowId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final runId = this.runId;
    final workflowId = this.workflowId;
    return {
      'runId': runId,
      'workflowId': workflowId,
    };
  }
}

enum WorkflowExecutionCancelRequestedCause {
  childPolicyApplied,
}

extension WorkflowExecutionCancelRequestedCauseValueExtension
    on WorkflowExecutionCancelRequestedCause {
  String toValue() {
    switch (this) {
      case WorkflowExecutionCancelRequestedCause.childPolicyApplied:
        return 'CHILD_POLICY_APPLIED';
    }
  }
}

extension WorkflowExecutionCancelRequestedCauseFromString on String {
  WorkflowExecutionCancelRequestedCause
      toWorkflowExecutionCancelRequestedCause() {
    switch (this) {
      case 'CHILD_POLICY_APPLIED':
        return WorkflowExecutionCancelRequestedCause.childPolicyApplied;
    }
    throw Exception(
        '$this is not known in enum WorkflowExecutionCancelRequestedCause');
  }
}

/// Provides the details of the <code>WorkflowExecutionCancelRequested</code>
/// event.
class WorkflowExecutionCancelRequestedEventAttributes {
  /// If set, indicates that the request to cancel the workflow execution was
  /// automatically generated, and specifies the cause. This happens if the parent
  /// workflow execution times out or is terminated, and the child policy is set
  /// to cancel child executions.
  final WorkflowExecutionCancelRequestedCause? cause;

  /// The ID of the <code>RequestCancelExternalWorkflowExecutionInitiated</code>
  /// event corresponding to the
  /// <code>RequestCancelExternalWorkflowExecution</code> decision to cancel this
  /// workflow execution.The source event with this ID can be found in the history
  /// of the source workflow execution. This information can be useful for
  /// diagnosing problems by tracing back the chain of events leading up to this
  /// event.
  final int? externalInitiatedEventId;

  /// The external workflow execution for which the cancellation was requested.
  final WorkflowExecution? externalWorkflowExecution;

  WorkflowExecutionCancelRequestedEventAttributes({
    this.cause,
    this.externalInitiatedEventId,
    this.externalWorkflowExecution,
  });

  factory WorkflowExecutionCancelRequestedEventAttributes.fromJson(
      Map<String, dynamic> json) {
    return WorkflowExecutionCancelRequestedEventAttributes(
      cause:
          (json['cause'] as String?)?.toWorkflowExecutionCancelRequestedCause(),
      externalInitiatedEventId: json['externalInitiatedEventId'] as int?,
      externalWorkflowExecution: json['externalWorkflowExecution'] != null
          ? WorkflowExecution.fromJson(
              json['externalWorkflowExecution'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final cause = this.cause;
    final externalInitiatedEventId = this.externalInitiatedEventId;
    final externalWorkflowExecution = this.externalWorkflowExecution;
    return {
      if (cause != null) 'cause': cause.toValue(),
      if (externalInitiatedEventId != null)
        'externalInitiatedEventId': externalInitiatedEventId,
      if (externalWorkflowExecution != null)
        'externalWorkflowExecution': externalWorkflowExecution,
    };
  }
}

/// Provides the details of the <code>WorkflowExecutionCanceled</code> event.
class WorkflowExecutionCanceledEventAttributes {
  /// The ID of the <code>DecisionTaskCompleted</code> event corresponding to the
  /// decision task that resulted in the <code>CancelWorkflowExecution</code>
  /// decision for this cancellation request. This information can be useful for
  /// diagnosing problems by tracing back the chain of events leading up to this
  /// event.
  final int decisionTaskCompletedEventId;

  /// The details of the cancellation.
  final String? details;

  WorkflowExecutionCanceledEventAttributes({
    required this.decisionTaskCompletedEventId,
    this.details,
  });

  factory WorkflowExecutionCanceledEventAttributes.fromJson(
      Map<String, dynamic> json) {
    return WorkflowExecutionCanceledEventAttributes(
      decisionTaskCompletedEventId: json['decisionTaskCompletedEventId'] as int,
      details: json['details'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final decisionTaskCompletedEventId = this.decisionTaskCompletedEventId;
    final details = this.details;
    return {
      'decisionTaskCompletedEventId': decisionTaskCompletedEventId,
      if (details != null) 'details': details,
    };
  }
}

/// Provides the details of the <code>WorkflowExecutionCompleted</code> event.
class WorkflowExecutionCompletedEventAttributes {
  /// The ID of the <code>DecisionTaskCompleted</code> event corresponding to the
  /// decision task that resulted in the <code>CompleteWorkflowExecution</code>
  /// decision to complete this execution. This information can be useful for
  /// diagnosing problems by tracing back the chain of events leading up to this
  /// event.
  final int decisionTaskCompletedEventId;

  /// The result produced by the workflow execution upon successful completion.
  final String? result;

  WorkflowExecutionCompletedEventAttributes({
    required this.decisionTaskCompletedEventId,
    this.result,
  });

  factory WorkflowExecutionCompletedEventAttributes.fromJson(
      Map<String, dynamic> json) {
    return WorkflowExecutionCompletedEventAttributes(
      decisionTaskCompletedEventId: json['decisionTaskCompletedEventId'] as int,
      result: json['result'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final decisionTaskCompletedEventId = this.decisionTaskCompletedEventId;
    final result = this.result;
    return {
      'decisionTaskCompletedEventId': decisionTaskCompletedEventId,
      if (result != null) 'result': result,
    };
  }
}

/// The configuration settings for a workflow execution including timeout
/// values, tasklist etc. These configuration settings are determined from the
/// defaults specified when registering the workflow type and those specified
/// when starting the workflow execution.
class WorkflowExecutionConfiguration {
  /// The policy to use for the child workflow executions if this workflow
  /// execution is terminated, by calling the <a>TerminateWorkflowExecution</a>
  /// action explicitly or due to an expired timeout.
  ///
  /// The supported child policies are:
  ///
  /// <ul>
  /// <li>
  /// <code>TERMINATE</code> – The child executions are terminated.
  /// </li>
  /// <li>
  /// <code>REQUEST_CANCEL</code> – A request to cancel is attempted for each
  /// child execution by recording a <code>WorkflowExecutionCancelRequested</code>
  /// event in its history. It is up to the decider to take appropriate actions
  /// when it receives an execution history with this event.
  /// </li>
  /// <li>
  /// <code>ABANDON</code> – No action is taken. The child executions continue to
  /// run.
  /// </li>
  /// </ul>
  final ChildPolicy childPolicy;

  /// The total duration for this workflow execution.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// <code>0</code>. You can use <code>NONE</code> to specify unlimited duration.
  final String executionStartToCloseTimeout;

  /// The task list used for the decision tasks generated for this workflow
  /// execution.
  final TaskList taskList;

  /// The maximum duration allowed for decision tasks for this workflow execution.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// <code>0</code>. You can use <code>NONE</code> to specify unlimited duration.
  final String taskStartToCloseTimeout;

  /// The IAM role attached to the child workflow execution.
  final String? lambdaRole;

  /// The priority assigned to decision tasks for this workflow execution. Valid
  /// values are integers that range from Java's <code>Integer.MIN_VALUE</code>
  /// (-2147483648) to <code>Integer.MAX_VALUE</code> (2147483647). Higher numbers
  /// indicate higher priority.
  ///
  /// For more information about setting task priority, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/programming-priority.html">Setting
  /// Task Priority</a> in the <i>Amazon SWF Developer Guide</i>.
  final String? taskPriority;

  WorkflowExecutionConfiguration({
    required this.childPolicy,
    required this.executionStartToCloseTimeout,
    required this.taskList,
    required this.taskStartToCloseTimeout,
    this.lambdaRole,
    this.taskPriority,
  });

  factory WorkflowExecutionConfiguration.fromJson(Map<String, dynamic> json) {
    return WorkflowExecutionConfiguration(
      childPolicy: (json['childPolicy'] as String).toChildPolicy(),
      executionStartToCloseTimeout:
          json['executionStartToCloseTimeout'] as String,
      taskList: TaskList.fromJson(json['taskList'] as Map<String, dynamic>),
      taskStartToCloseTimeout: json['taskStartToCloseTimeout'] as String,
      lambdaRole: json['lambdaRole'] as String?,
      taskPriority: json['taskPriority'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final childPolicy = this.childPolicy;
    final executionStartToCloseTimeout = this.executionStartToCloseTimeout;
    final taskList = this.taskList;
    final taskStartToCloseTimeout = this.taskStartToCloseTimeout;
    final lambdaRole = this.lambdaRole;
    final taskPriority = this.taskPriority;
    return {
      'childPolicy': childPolicy.toValue(),
      'executionStartToCloseTimeout': executionStartToCloseTimeout,
      'taskList': taskList,
      'taskStartToCloseTimeout': taskStartToCloseTimeout,
      if (lambdaRole != null) 'lambdaRole': lambdaRole,
      if (taskPriority != null) 'taskPriority': taskPriority,
    };
  }
}

/// Provides the details of the <code>WorkflowExecutionContinuedAsNew</code>
/// event.
class WorkflowExecutionContinuedAsNewEventAttributes {
  /// The policy to use for the child workflow executions of the new execution if
  /// it is terminated by calling the <a>TerminateWorkflowExecution</a> action
  /// explicitly or due to an expired timeout.
  ///
  /// The supported child policies are:
  ///
  /// <ul>
  /// <li>
  /// <code>TERMINATE</code> – The child executions are terminated.
  /// </li>
  /// <li>
  /// <code>REQUEST_CANCEL</code> – A request to cancel is attempted for each
  /// child execution by recording a <code>WorkflowExecutionCancelRequested</code>
  /// event in its history. It is up to the decider to take appropriate actions
  /// when it receives an execution history with this event.
  /// </li>
  /// <li>
  /// <code>ABANDON</code> – No action is taken. The child executions continue to
  /// run.
  /// </li>
  /// </ul>
  final ChildPolicy childPolicy;

  /// The ID of the <code>DecisionTaskCompleted</code> event corresponding to the
  /// decision task that resulted in the
  /// <code>ContinueAsNewWorkflowExecution</code> decision that started this
  /// execution. This information can be useful for diagnosing problems by tracing
  /// back the chain of events leading up to this event.
  final int decisionTaskCompletedEventId;

  /// The <code>runId</code> of the new workflow execution.
  final String newExecutionRunId;

  /// The task list to use for the decisions of the new (continued) workflow
  /// execution.
  final TaskList taskList;

  /// The workflow type of this execution.
  final WorkflowType workflowType;

  /// The total duration allowed for the new workflow execution.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// <code>0</code>. You can use <code>NONE</code> to specify unlimited duration.
  final String? executionStartToCloseTimeout;

  /// The input provided to the new workflow execution.
  final String? input;

  /// The IAM role to attach to the new (continued) workflow execution.
  final String? lambdaRole;

  /// The list of tags associated with the new workflow execution.
  final List<String>? tagList;

  /// The priority of the task to use for the decisions of the new (continued)
  /// workflow execution.
  final String? taskPriority;

  /// The maximum duration of decision tasks for the new workflow execution.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// <code>0</code>. You can use <code>NONE</code> to specify unlimited duration.
  final String? taskStartToCloseTimeout;

  WorkflowExecutionContinuedAsNewEventAttributes({
    required this.childPolicy,
    required this.decisionTaskCompletedEventId,
    required this.newExecutionRunId,
    required this.taskList,
    required this.workflowType,
    this.executionStartToCloseTimeout,
    this.input,
    this.lambdaRole,
    this.tagList,
    this.taskPriority,
    this.taskStartToCloseTimeout,
  });

  factory WorkflowExecutionContinuedAsNewEventAttributes.fromJson(
      Map<String, dynamic> json) {
    return WorkflowExecutionContinuedAsNewEventAttributes(
      childPolicy: (json['childPolicy'] as String).toChildPolicy(),
      decisionTaskCompletedEventId: json['decisionTaskCompletedEventId'] as int,
      newExecutionRunId: json['newExecutionRunId'] as String,
      taskList: TaskList.fromJson(json['taskList'] as Map<String, dynamic>),
      workflowType:
          WorkflowType.fromJson(json['workflowType'] as Map<String, dynamic>),
      executionStartToCloseTimeout:
          json['executionStartToCloseTimeout'] as String?,
      input: json['input'] as String?,
      lambdaRole: json['lambdaRole'] as String?,
      tagList: (json['tagList'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      taskPriority: json['taskPriority'] as String?,
      taskStartToCloseTimeout: json['taskStartToCloseTimeout'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final childPolicy = this.childPolicy;
    final decisionTaskCompletedEventId = this.decisionTaskCompletedEventId;
    final newExecutionRunId = this.newExecutionRunId;
    final taskList = this.taskList;
    final workflowType = this.workflowType;
    final executionStartToCloseTimeout = this.executionStartToCloseTimeout;
    final input = this.input;
    final lambdaRole = this.lambdaRole;
    final tagList = this.tagList;
    final taskPriority = this.taskPriority;
    final taskStartToCloseTimeout = this.taskStartToCloseTimeout;
    return {
      'childPolicy': childPolicy.toValue(),
      'decisionTaskCompletedEventId': decisionTaskCompletedEventId,
      'newExecutionRunId': newExecutionRunId,
      'taskList': taskList,
      'workflowType': workflowType,
      if (executionStartToCloseTimeout != null)
        'executionStartToCloseTimeout': executionStartToCloseTimeout,
      if (input != null) 'input': input,
      if (lambdaRole != null) 'lambdaRole': lambdaRole,
      if (tagList != null) 'tagList': tagList,
      if (taskPriority != null) 'taskPriority': taskPriority,
      if (taskStartToCloseTimeout != null)
        'taskStartToCloseTimeout': taskStartToCloseTimeout,
    };
  }
}

/// Contains the count of workflow executions returned from
/// <a>CountOpenWorkflowExecutions</a> or <a>CountClosedWorkflowExecutions</a>
class WorkflowExecutionCount {
  /// The number of workflow executions.
  final int count;

  /// If set to true, indicates that the actual count was more than the maximum
  /// supported by this API and the count returned is the truncated value.
  final bool? truncated;

  WorkflowExecutionCount({
    required this.count,
    this.truncated,
  });

  factory WorkflowExecutionCount.fromJson(Map<String, dynamic> json) {
    return WorkflowExecutionCount(
      count: json['count'] as int,
      truncated: json['truncated'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final count = this.count;
    final truncated = this.truncated;
    return {
      'count': count,
      if (truncated != null) 'truncated': truncated,
    };
  }
}

/// Contains details about a workflow execution.
class WorkflowExecutionDetail {
  /// The configuration settings for this workflow execution including timeout
  /// values, tasklist etc.
  final WorkflowExecutionConfiguration executionConfiguration;

  /// Information about the workflow execution.
  final WorkflowExecutionInfo executionInfo;

  /// The number of tasks for this workflow execution. This includes open and
  /// closed tasks of all types.
  final WorkflowExecutionOpenCounts openCounts;

  /// The time when the last activity task was scheduled for this workflow
  /// execution. You can use this information to determine if the workflow has not
  /// made progress for an unusually long period of time and might require a
  /// corrective action.
  final DateTime? latestActivityTaskTimestamp;

  /// The latest executionContext provided by the decider for this workflow
  /// execution. A decider can provide an executionContext (a free-form string)
  /// when closing a decision task using <a>RespondDecisionTaskCompleted</a>.
  final String? latestExecutionContext;

  WorkflowExecutionDetail({
    required this.executionConfiguration,
    required this.executionInfo,
    required this.openCounts,
    this.latestActivityTaskTimestamp,
    this.latestExecutionContext,
  });

  factory WorkflowExecutionDetail.fromJson(Map<String, dynamic> json) {
    return WorkflowExecutionDetail(
      executionConfiguration: WorkflowExecutionConfiguration.fromJson(
          json['executionConfiguration'] as Map<String, dynamic>),
      executionInfo: WorkflowExecutionInfo.fromJson(
          json['executionInfo'] as Map<String, dynamic>),
      openCounts: WorkflowExecutionOpenCounts.fromJson(
          json['openCounts'] as Map<String, dynamic>),
      latestActivityTaskTimestamp:
          timeStampFromJson(json['latestActivityTaskTimestamp']),
      latestExecutionContext: json['latestExecutionContext'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final executionConfiguration = this.executionConfiguration;
    final executionInfo = this.executionInfo;
    final openCounts = this.openCounts;
    final latestActivityTaskTimestamp = this.latestActivityTaskTimestamp;
    final latestExecutionContext = this.latestExecutionContext;
    return {
      'executionConfiguration': executionConfiguration,
      'executionInfo': executionInfo,
      'openCounts': openCounts,
      if (latestActivityTaskTimestamp != null)
        'latestActivityTaskTimestamp':
            unixTimestampToJson(latestActivityTaskTimestamp),
      if (latestExecutionContext != null)
        'latestExecutionContext': latestExecutionContext,
    };
  }
}

/// Provides the details of the <code>WorkflowExecutionFailed</code> event.
class WorkflowExecutionFailedEventAttributes {
  /// The ID of the <code>DecisionTaskCompleted</code> event corresponding to the
  /// decision task that resulted in the <code>FailWorkflowExecution</code>
  /// decision to fail this execution. This information can be useful for
  /// diagnosing problems by tracing back the chain of events leading up to this
  /// event.
  final int decisionTaskCompletedEventId;

  /// The details of the failure.
  final String? details;

  /// The descriptive reason provided for the failure.
  final String? reason;

  WorkflowExecutionFailedEventAttributes({
    required this.decisionTaskCompletedEventId,
    this.details,
    this.reason,
  });

  factory WorkflowExecutionFailedEventAttributes.fromJson(
      Map<String, dynamic> json) {
    return WorkflowExecutionFailedEventAttributes(
      decisionTaskCompletedEventId: json['decisionTaskCompletedEventId'] as int,
      details: json['details'] as String?,
      reason: json['reason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final decisionTaskCompletedEventId = this.decisionTaskCompletedEventId;
    final details = this.details;
    final reason = this.reason;
    return {
      'decisionTaskCompletedEventId': decisionTaskCompletedEventId,
      if (details != null) 'details': details,
      if (reason != null) 'reason': reason,
    };
  }
}

/// Used to filter the workflow executions in visibility APIs by their
/// <code>workflowId</code>.
class WorkflowExecutionFilter {
  /// The workflowId to pass of match the criteria of this filter.
  final String workflowId;

  WorkflowExecutionFilter({
    required this.workflowId,
  });

  Map<String, dynamic> toJson() {
    final workflowId = this.workflowId;
    return {
      'workflowId': workflowId,
    };
  }
}

/// Contains information about a workflow execution.
class WorkflowExecutionInfo {
  /// The workflow execution this information is about.
  final WorkflowExecution execution;

  /// The current status of the execution.
  final ExecutionStatus executionStatus;

  /// The time when the execution was started.
  final DateTime startTimestamp;

  /// The type of the workflow execution.
  final WorkflowType workflowType;

  /// Set to true if a cancellation is requested for this workflow execution.
  final bool? cancelRequested;

  /// If the execution status is closed then this specifies how the execution was
  /// closed:
  ///
  /// <ul>
  /// <li>
  /// <code>COMPLETED</code> – the execution was successfully completed.
  /// </li>
  /// <li>
  /// <code>CANCELED</code> – the execution was canceled.Cancellation allows the
  /// implementation to gracefully clean up before the execution is closed.
  /// </li>
  /// <li>
  /// <code>TERMINATED</code> – the execution was force terminated.
  /// </li>
  /// <li>
  /// <code>FAILED</code> – the execution failed to complete.
  /// </li>
  /// <li>
  /// <code>TIMED_OUT</code> – the execution did not complete in the alloted time
  /// and was automatically timed out.
  /// </li>
  /// <li>
  /// <code>CONTINUED_AS_NEW</code> – the execution is logically continued. This
  /// means the current execution was completed and a new execution was started to
  /// carry on the workflow.
  /// </li>
  /// </ul>
  final CloseStatus? closeStatus;

  /// The time when the workflow execution was closed. Set only if the execution
  /// status is CLOSED.
  final DateTime? closeTimestamp;

  /// If this workflow execution is a child of another execution then contains the
  /// workflow execution that started this execution.
  final WorkflowExecution? parent;

  /// The list of tags associated with the workflow execution. Tags can be used to
  /// identify and list workflow executions of interest through the visibility
  /// APIs. A workflow execution can have a maximum of 5 tags.
  final List<String>? tagList;

  WorkflowExecutionInfo({
    required this.execution,
    required this.executionStatus,
    required this.startTimestamp,
    required this.workflowType,
    this.cancelRequested,
    this.closeStatus,
    this.closeTimestamp,
    this.parent,
    this.tagList,
  });

  factory WorkflowExecutionInfo.fromJson(Map<String, dynamic> json) {
    return WorkflowExecutionInfo(
      execution:
          WorkflowExecution.fromJson(json['execution'] as Map<String, dynamic>),
      executionStatus: (json['executionStatus'] as String).toExecutionStatus(),
      startTimestamp:
          nonNullableTimeStampFromJson(json['startTimestamp'] as Object),
      workflowType:
          WorkflowType.fromJson(json['workflowType'] as Map<String, dynamic>),
      cancelRequested: json['cancelRequested'] as bool?,
      closeStatus: (json['closeStatus'] as String?)?.toCloseStatus(),
      closeTimestamp: timeStampFromJson(json['closeTimestamp']),
      parent: json['parent'] != null
          ? WorkflowExecution.fromJson(json['parent'] as Map<String, dynamic>)
          : null,
      tagList: (json['tagList'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final execution = this.execution;
    final executionStatus = this.executionStatus;
    final startTimestamp = this.startTimestamp;
    final workflowType = this.workflowType;
    final cancelRequested = this.cancelRequested;
    final closeStatus = this.closeStatus;
    final closeTimestamp = this.closeTimestamp;
    final parent = this.parent;
    final tagList = this.tagList;
    return {
      'execution': execution,
      'executionStatus': executionStatus.toValue(),
      'startTimestamp': unixTimestampToJson(startTimestamp),
      'workflowType': workflowType,
      if (cancelRequested != null) 'cancelRequested': cancelRequested,
      if (closeStatus != null) 'closeStatus': closeStatus.toValue(),
      if (closeTimestamp != null)
        'closeTimestamp': unixTimestampToJson(closeTimestamp),
      if (parent != null) 'parent': parent,
      if (tagList != null) 'tagList': tagList,
    };
  }
}

/// Contains a paginated list of information about workflow executions.
class WorkflowExecutionInfos {
  /// The list of workflow information structures.
  final List<WorkflowExecutionInfo> executionInfos;

  /// If a <code>NextPageToken</code> was returned by a previous call, there are
  /// more results available. To retrieve the next page of results, make the call
  /// again using the returned token in <code>nextPageToken</code>. Keep all other
  /// arguments unchanged.
  ///
  /// The configured <code>maximumPageSize</code> determines how many results can
  /// be returned in a single call.
  final String? nextPageToken;

  WorkflowExecutionInfos({
    required this.executionInfos,
    this.nextPageToken,
  });

  factory WorkflowExecutionInfos.fromJson(Map<String, dynamic> json) {
    return WorkflowExecutionInfos(
      executionInfos: (json['executionInfos'] as List)
          .whereNotNull()
          .map((e) => WorkflowExecutionInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPageToken: json['nextPageToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final executionInfos = this.executionInfos;
    final nextPageToken = this.nextPageToken;
    return {
      'executionInfos': executionInfos,
      if (nextPageToken != null) 'nextPageToken': nextPageToken,
    };
  }
}

/// Contains the counts of open tasks, child workflow executions and timers for
/// a workflow execution.
class WorkflowExecutionOpenCounts {
  /// The count of activity tasks whose status is <code>OPEN</code>.
  final int openActivityTasks;

  /// The count of child workflow executions whose status is <code>OPEN</code>.
  final int openChildWorkflowExecutions;

  /// The count of decision tasks whose status is OPEN. A workflow execution can
  /// have at most one open decision task.
  final int openDecisionTasks;

  /// The count of timers started by this workflow execution that have not fired
  /// yet.
  final int openTimers;

  /// The count of Lambda tasks whose status is <code>OPEN</code>.
  final int? openLambdaFunctions;

  WorkflowExecutionOpenCounts({
    required this.openActivityTasks,
    required this.openChildWorkflowExecutions,
    required this.openDecisionTasks,
    required this.openTimers,
    this.openLambdaFunctions,
  });

  factory WorkflowExecutionOpenCounts.fromJson(Map<String, dynamic> json) {
    return WorkflowExecutionOpenCounts(
      openActivityTasks: json['openActivityTasks'] as int,
      openChildWorkflowExecutions: json['openChildWorkflowExecutions'] as int,
      openDecisionTasks: json['openDecisionTasks'] as int,
      openTimers: json['openTimers'] as int,
      openLambdaFunctions: json['openLambdaFunctions'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final openActivityTasks = this.openActivityTasks;
    final openChildWorkflowExecutions = this.openChildWorkflowExecutions;
    final openDecisionTasks = this.openDecisionTasks;
    final openTimers = this.openTimers;
    final openLambdaFunctions = this.openLambdaFunctions;
    return {
      'openActivityTasks': openActivityTasks,
      'openChildWorkflowExecutions': openChildWorkflowExecutions,
      'openDecisionTasks': openDecisionTasks,
      'openTimers': openTimers,
      if (openLambdaFunctions != null)
        'openLambdaFunctions': openLambdaFunctions,
    };
  }
}

/// Provides the details of the <code>WorkflowExecutionSignaled</code> event.
class WorkflowExecutionSignaledEventAttributes {
  /// The name of the signal received. The decider can use the signal name and
  /// inputs to determine how to the process the signal.
  final String signalName;

  /// The ID of the <code>SignalExternalWorkflowExecutionInitiated</code> event
  /// corresponding to the <code>SignalExternalWorkflow</code> decision to signal
  /// this workflow execution.The source event with this ID can be found in the
  /// history of the source workflow execution. This information can be useful for
  /// diagnosing problems by tracing back the chain of events leading up to this
  /// event. This field is set only if the signal was initiated by another
  /// workflow execution.
  final int? externalInitiatedEventId;

  /// The workflow execution that sent the signal. This is set only of the signal
  /// was sent by another workflow execution.
  final WorkflowExecution? externalWorkflowExecution;

  /// The inputs provided with the signal. The decider can use the signal name and
  /// inputs to determine how to process the signal.
  final String? input;

  WorkflowExecutionSignaledEventAttributes({
    required this.signalName,
    this.externalInitiatedEventId,
    this.externalWorkflowExecution,
    this.input,
  });

  factory WorkflowExecutionSignaledEventAttributes.fromJson(
      Map<String, dynamic> json) {
    return WorkflowExecutionSignaledEventAttributes(
      signalName: json['signalName'] as String,
      externalInitiatedEventId: json['externalInitiatedEventId'] as int?,
      externalWorkflowExecution: json['externalWorkflowExecution'] != null
          ? WorkflowExecution.fromJson(
              json['externalWorkflowExecution'] as Map<String, dynamic>)
          : null,
      input: json['input'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final signalName = this.signalName;
    final externalInitiatedEventId = this.externalInitiatedEventId;
    final externalWorkflowExecution = this.externalWorkflowExecution;
    final input = this.input;
    return {
      'signalName': signalName,
      if (externalInitiatedEventId != null)
        'externalInitiatedEventId': externalInitiatedEventId,
      if (externalWorkflowExecution != null)
        'externalWorkflowExecution': externalWorkflowExecution,
      if (input != null) 'input': input,
    };
  }
}

/// Provides details of <code>WorkflowExecutionStarted</code> event.
class WorkflowExecutionStartedEventAttributes {
  /// The policy to use for the child workflow executions if this workflow
  /// execution is terminated, by calling the <a>TerminateWorkflowExecution</a>
  /// action explicitly or due to an expired timeout.
  ///
  /// The supported child policies are:
  ///
  /// <ul>
  /// <li>
  /// <code>TERMINATE</code> – The child executions are terminated.
  /// </li>
  /// <li>
  /// <code>REQUEST_CANCEL</code> – A request to cancel is attempted for each
  /// child execution by recording a <code>WorkflowExecutionCancelRequested</code>
  /// event in its history. It is up to the decider to take appropriate actions
  /// when it receives an execution history with this event.
  /// </li>
  /// <li>
  /// <code>ABANDON</code> – No action is taken. The child executions continue to
  /// run.
  /// </li>
  /// </ul>
  final ChildPolicy childPolicy;

  /// The name of the task list for scheduling the decision tasks for this
  /// workflow execution.
  final TaskList taskList;

  /// The workflow type of this execution.
  final WorkflowType workflowType;

  /// If this workflow execution was started due to a
  /// <code>ContinueAsNewWorkflowExecution</code> decision, then it contains the
  /// <code>runId</code> of the previous workflow execution that was closed and
  /// continued as this execution.
  final String? continuedExecutionRunId;

  /// The maximum duration for this workflow execution.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// <code>0</code>. You can use <code>NONE</code> to specify unlimited duration.
  final String? executionStartToCloseTimeout;

  /// The input provided to the workflow execution.
  final String? input;

  /// The IAM role attached to the workflow execution.
  final String? lambdaRole;

  /// The ID of the <code>StartChildWorkflowExecutionInitiated</code> event
  /// corresponding to the <code>StartChildWorkflowExecution</code>
  /// <a>Decision</a> to start this workflow execution. The source event with this
  /// ID can be found in the history of the source workflow execution. This
  /// information can be useful for diagnosing problems by tracing back the chain
  /// of events leading up to this event.
  final int? parentInitiatedEventId;

  /// The source workflow execution that started this workflow execution. The
  /// member isn't set if the workflow execution was not started by a workflow.
  final WorkflowExecution? parentWorkflowExecution;

  /// The list of tags associated with this workflow execution. An execution can
  /// have up to 5 tags.
  final List<String>? tagList;

  /// The priority of the decision tasks in the workflow execution.
  final String? taskPriority;

  /// The maximum duration of decision tasks for this workflow type.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// <code>0</code>. You can use <code>NONE</code> to specify unlimited duration.
  final String? taskStartToCloseTimeout;

  WorkflowExecutionStartedEventAttributes({
    required this.childPolicy,
    required this.taskList,
    required this.workflowType,
    this.continuedExecutionRunId,
    this.executionStartToCloseTimeout,
    this.input,
    this.lambdaRole,
    this.parentInitiatedEventId,
    this.parentWorkflowExecution,
    this.tagList,
    this.taskPriority,
    this.taskStartToCloseTimeout,
  });

  factory WorkflowExecutionStartedEventAttributes.fromJson(
      Map<String, dynamic> json) {
    return WorkflowExecutionStartedEventAttributes(
      childPolicy: (json['childPolicy'] as String).toChildPolicy(),
      taskList: TaskList.fromJson(json['taskList'] as Map<String, dynamic>),
      workflowType:
          WorkflowType.fromJson(json['workflowType'] as Map<String, dynamic>),
      continuedExecutionRunId: json['continuedExecutionRunId'] as String?,
      executionStartToCloseTimeout:
          json['executionStartToCloseTimeout'] as String?,
      input: json['input'] as String?,
      lambdaRole: json['lambdaRole'] as String?,
      parentInitiatedEventId: json['parentInitiatedEventId'] as int?,
      parentWorkflowExecution: json['parentWorkflowExecution'] != null
          ? WorkflowExecution.fromJson(
              json['parentWorkflowExecution'] as Map<String, dynamic>)
          : null,
      tagList: (json['tagList'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      taskPriority: json['taskPriority'] as String?,
      taskStartToCloseTimeout: json['taskStartToCloseTimeout'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final childPolicy = this.childPolicy;
    final taskList = this.taskList;
    final workflowType = this.workflowType;
    final continuedExecutionRunId = this.continuedExecutionRunId;
    final executionStartToCloseTimeout = this.executionStartToCloseTimeout;
    final input = this.input;
    final lambdaRole = this.lambdaRole;
    final parentInitiatedEventId = this.parentInitiatedEventId;
    final parentWorkflowExecution = this.parentWorkflowExecution;
    final tagList = this.tagList;
    final taskPriority = this.taskPriority;
    final taskStartToCloseTimeout = this.taskStartToCloseTimeout;
    return {
      'childPolicy': childPolicy.toValue(),
      'taskList': taskList,
      'workflowType': workflowType,
      if (continuedExecutionRunId != null)
        'continuedExecutionRunId': continuedExecutionRunId,
      if (executionStartToCloseTimeout != null)
        'executionStartToCloseTimeout': executionStartToCloseTimeout,
      if (input != null) 'input': input,
      if (lambdaRole != null) 'lambdaRole': lambdaRole,
      if (parentInitiatedEventId != null)
        'parentInitiatedEventId': parentInitiatedEventId,
      if (parentWorkflowExecution != null)
        'parentWorkflowExecution': parentWorkflowExecution,
      if (tagList != null) 'tagList': tagList,
      if (taskPriority != null) 'taskPriority': taskPriority,
      if (taskStartToCloseTimeout != null)
        'taskStartToCloseTimeout': taskStartToCloseTimeout,
    };
  }
}

enum WorkflowExecutionTerminatedCause {
  childPolicyApplied,
  eventLimitExceeded,
  operatorInitiated,
}

extension WorkflowExecutionTerminatedCauseValueExtension
    on WorkflowExecutionTerminatedCause {
  String toValue() {
    switch (this) {
      case WorkflowExecutionTerminatedCause.childPolicyApplied:
        return 'CHILD_POLICY_APPLIED';
      case WorkflowExecutionTerminatedCause.eventLimitExceeded:
        return 'EVENT_LIMIT_EXCEEDED';
      case WorkflowExecutionTerminatedCause.operatorInitiated:
        return 'OPERATOR_INITIATED';
    }
  }
}

extension WorkflowExecutionTerminatedCauseFromString on String {
  WorkflowExecutionTerminatedCause toWorkflowExecutionTerminatedCause() {
    switch (this) {
      case 'CHILD_POLICY_APPLIED':
        return WorkflowExecutionTerminatedCause.childPolicyApplied;
      case 'EVENT_LIMIT_EXCEEDED':
        return WorkflowExecutionTerminatedCause.eventLimitExceeded;
      case 'OPERATOR_INITIATED':
        return WorkflowExecutionTerminatedCause.operatorInitiated;
    }
    throw Exception(
        '$this is not known in enum WorkflowExecutionTerminatedCause');
  }
}

/// Provides the details of the <code>WorkflowExecutionTerminated</code> event.
class WorkflowExecutionTerminatedEventAttributes {
  /// The policy used for the child workflow executions of this workflow
  /// execution.
  ///
  /// The supported child policies are:
  ///
  /// <ul>
  /// <li>
  /// <code>TERMINATE</code> – The child executions are terminated.
  /// </li>
  /// <li>
  /// <code>REQUEST_CANCEL</code> – A request to cancel is attempted for each
  /// child execution by recording a <code>WorkflowExecutionCancelRequested</code>
  /// event in its history. It is up to the decider to take appropriate actions
  /// when it receives an execution history with this event.
  /// </li>
  /// <li>
  /// <code>ABANDON</code> – No action is taken. The child executions continue to
  /// run.
  /// </li>
  /// </ul>
  final ChildPolicy childPolicy;

  /// If set, indicates that the workflow execution was automatically terminated,
  /// and specifies the cause. This happens if the parent workflow execution times
  /// out or is terminated and the child policy is set to terminate child
  /// executions.
  final WorkflowExecutionTerminatedCause? cause;

  /// The details provided for the termination.
  final String? details;

  /// The reason provided for the termination.
  final String? reason;

  WorkflowExecutionTerminatedEventAttributes({
    required this.childPolicy,
    this.cause,
    this.details,
    this.reason,
  });

  factory WorkflowExecutionTerminatedEventAttributes.fromJson(
      Map<String, dynamic> json) {
    return WorkflowExecutionTerminatedEventAttributes(
      childPolicy: (json['childPolicy'] as String).toChildPolicy(),
      cause: (json['cause'] as String?)?.toWorkflowExecutionTerminatedCause(),
      details: json['details'] as String?,
      reason: json['reason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final childPolicy = this.childPolicy;
    final cause = this.cause;
    final details = this.details;
    final reason = this.reason;
    return {
      'childPolicy': childPolicy.toValue(),
      if (cause != null) 'cause': cause.toValue(),
      if (details != null) 'details': details,
      if (reason != null) 'reason': reason,
    };
  }
}

/// Provides the details of the <code>WorkflowExecutionTimedOut</code> event.
class WorkflowExecutionTimedOutEventAttributes {
  /// The policy used for the child workflow executions of this workflow
  /// execution.
  ///
  /// The supported child policies are:
  ///
  /// <ul>
  /// <li>
  /// <code>TERMINATE</code> – The child executions are terminated.
  /// </li>
  /// <li>
  /// <code>REQUEST_CANCEL</code> – A request to cancel is attempted for each
  /// child execution by recording a <code>WorkflowExecutionCancelRequested</code>
  /// event in its history. It is up to the decider to take appropriate actions
  /// when it receives an execution history with this event.
  /// </li>
  /// <li>
  /// <code>ABANDON</code> – No action is taken. The child executions continue to
  /// run.
  /// </li>
  /// </ul>
  final ChildPolicy childPolicy;

  /// The type of timeout that caused this event.
  final WorkflowExecutionTimeoutType timeoutType;

  WorkflowExecutionTimedOutEventAttributes({
    required this.childPolicy,
    required this.timeoutType,
  });

  factory WorkflowExecutionTimedOutEventAttributes.fromJson(
      Map<String, dynamic> json) {
    return WorkflowExecutionTimedOutEventAttributes(
      childPolicy: (json['childPolicy'] as String).toChildPolicy(),
      timeoutType:
          (json['timeoutType'] as String).toWorkflowExecutionTimeoutType(),
    );
  }

  Map<String, dynamic> toJson() {
    final childPolicy = this.childPolicy;
    final timeoutType = this.timeoutType;
    return {
      'childPolicy': childPolicy.toValue(),
      'timeoutType': timeoutType.toValue(),
    };
  }
}

enum WorkflowExecutionTimeoutType {
  startToClose,
}

extension WorkflowExecutionTimeoutTypeValueExtension
    on WorkflowExecutionTimeoutType {
  String toValue() {
    switch (this) {
      case WorkflowExecutionTimeoutType.startToClose:
        return 'START_TO_CLOSE';
    }
  }
}

extension WorkflowExecutionTimeoutTypeFromString on String {
  WorkflowExecutionTimeoutType toWorkflowExecutionTimeoutType() {
    switch (this) {
      case 'START_TO_CLOSE':
        return WorkflowExecutionTimeoutType.startToClose;
    }
    throw Exception('$this is not known in enum WorkflowExecutionTimeoutType');
  }
}

/// Represents a workflow type.
class WorkflowType {
  /// The name of the workflow type.
  /// <note>
  /// The combination of workflow type name and version must be unique with in a
  /// domain.
  /// </note>
  final String name;

  /// The version of the workflow type.
  /// <note>
  /// The combination of workflow type name and version must be unique with in a
  /// domain.
  /// </note>
  final String version;

  WorkflowType({
    required this.name,
    required this.version,
  });

  factory WorkflowType.fromJson(Map<String, dynamic> json) {
    return WorkflowType(
      name: json['name'] as String,
      version: json['version'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final version = this.version;
    return {
      'name': name,
      'version': version,
    };
  }
}

/// The configuration settings of a workflow type.
class WorkflowTypeConfiguration {
  /// The default policy to use for the child workflow executions when a workflow
  /// execution of this type is terminated, by calling the
  /// <a>TerminateWorkflowExecution</a> action explicitly or due to an expired
  /// timeout. This default can be overridden when starting a workflow execution
  /// using the <a>StartWorkflowExecution</a> action or the
  /// <code>StartChildWorkflowExecution</code> <a>Decision</a>.
  ///
  /// The supported child policies are:
  ///
  /// <ul>
  /// <li>
  /// <code>TERMINATE</code> – The child executions are terminated.
  /// </li>
  /// <li>
  /// <code>REQUEST_CANCEL</code> – A request to cancel is attempted for each
  /// child execution by recording a <code>WorkflowExecutionCancelRequested</code>
  /// event in its history. It is up to the decider to take appropriate actions
  /// when it receives an execution history with this event.
  /// </li>
  /// <li>
  /// <code>ABANDON</code> – No action is taken. The child executions continue to
  /// run.
  /// </li>
  /// </ul>
  final ChildPolicy? defaultChildPolicy;

  /// The default maximum duration, specified when registering the workflow type,
  /// for executions of this workflow type. This default can be overridden when
  /// starting a workflow execution using the <a>StartWorkflowExecution</a> action
  /// or the <code>StartChildWorkflowExecution</code> <a>Decision</a>.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// <code>0</code>. You can use <code>NONE</code> to specify unlimited duration.
  final String? defaultExecutionStartToCloseTimeout;

  /// The default IAM role attached to this workflow type.
  /// <note>
  /// Executions of this workflow type need IAM roles to invoke Lambda functions.
  /// If you don't specify an IAM role when starting this workflow type, the
  /// default Lambda role is attached to the execution. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/lambda-task.html">https://docs.aws.amazon.com/amazonswf/latest/developerguide/lambda-task.html</a>
  /// in the <i>Amazon SWF Developer Guide</i>.
  /// </note>
  final String? defaultLambdaRole;

  /// The default task list, specified when registering the workflow type, for
  /// decisions tasks scheduled for workflow executions of this type. This default
  /// can be overridden when starting a workflow execution using the
  /// <a>StartWorkflowExecution</a> action or the
  /// <code>StartChildWorkflowExecution</code> <a>Decision</a>.
  final TaskList? defaultTaskList;

  /// The default task priority, specified when registering the workflow type, for
  /// all decision tasks of this workflow type. This default can be overridden
  /// when starting a workflow execution using the <a>StartWorkflowExecution</a>
  /// action or the <code>StartChildWorkflowExecution</code> decision.
  ///
  /// Valid values are integers that range from Java's
  /// <code>Integer.MIN_VALUE</code> (-2147483648) to
  /// <code>Integer.MAX_VALUE</code> (2147483647). Higher numbers indicate higher
  /// priority.
  ///
  /// For more information about setting task priority, see <a
  /// href="https://docs.aws.amazon.com/amazonswf/latest/developerguide/programming-priority.html">Setting
  /// Task Priority</a> in the <i>Amazon SWF Developer Guide</i>.
  final String? defaultTaskPriority;

  /// The default maximum duration, specified when registering the workflow type,
  /// that a decision task for executions of this workflow type might take before
  /// returning completion or failure. If the task doesn'tdo close in the
  /// specified time then the task is automatically timed out and rescheduled. If
  /// the decider eventually reports a completion or failure, it is ignored. This
  /// default can be overridden when starting a workflow execution using the
  /// <a>StartWorkflowExecution</a> action or the
  /// <code>StartChildWorkflowExecution</code> <a>Decision</a>.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// <code>0</code>. You can use <code>NONE</code> to specify unlimited duration.
  final String? defaultTaskStartToCloseTimeout;

  WorkflowTypeConfiguration({
    this.defaultChildPolicy,
    this.defaultExecutionStartToCloseTimeout,
    this.defaultLambdaRole,
    this.defaultTaskList,
    this.defaultTaskPriority,
    this.defaultTaskStartToCloseTimeout,
  });

  factory WorkflowTypeConfiguration.fromJson(Map<String, dynamic> json) {
    return WorkflowTypeConfiguration(
      defaultChildPolicy:
          (json['defaultChildPolicy'] as String?)?.toChildPolicy(),
      defaultExecutionStartToCloseTimeout:
          json['defaultExecutionStartToCloseTimeout'] as String?,
      defaultLambdaRole: json['defaultLambdaRole'] as String?,
      defaultTaskList: json['defaultTaskList'] != null
          ? TaskList.fromJson(json['defaultTaskList'] as Map<String, dynamic>)
          : null,
      defaultTaskPriority: json['defaultTaskPriority'] as String?,
      defaultTaskStartToCloseTimeout:
          json['defaultTaskStartToCloseTimeout'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final defaultChildPolicy = this.defaultChildPolicy;
    final defaultExecutionStartToCloseTimeout =
        this.defaultExecutionStartToCloseTimeout;
    final defaultLambdaRole = this.defaultLambdaRole;
    final defaultTaskList = this.defaultTaskList;
    final defaultTaskPriority = this.defaultTaskPriority;
    final defaultTaskStartToCloseTimeout = this.defaultTaskStartToCloseTimeout;
    return {
      if (defaultChildPolicy != null)
        'defaultChildPolicy': defaultChildPolicy.toValue(),
      if (defaultExecutionStartToCloseTimeout != null)
        'defaultExecutionStartToCloseTimeout':
            defaultExecutionStartToCloseTimeout,
      if (defaultLambdaRole != null) 'defaultLambdaRole': defaultLambdaRole,
      if (defaultTaskList != null) 'defaultTaskList': defaultTaskList,
      if (defaultTaskPriority != null)
        'defaultTaskPriority': defaultTaskPriority,
      if (defaultTaskStartToCloseTimeout != null)
        'defaultTaskStartToCloseTimeout': defaultTaskStartToCloseTimeout,
    };
  }
}

/// Contains details about a workflow type.
class WorkflowTypeDetail {
  /// Configuration settings of the workflow type registered through
  /// <a>RegisterWorkflowType</a>
  final WorkflowTypeConfiguration configuration;

  /// General information about the workflow type.
  ///
  /// The status of the workflow type (returned in the WorkflowTypeInfo structure)
  /// can be one of the following.
  ///
  /// <ul>
  /// <li>
  /// <code>REGISTERED</code> – The type is registered and available. Workers
  /// supporting this type should be running.
  /// </li>
  /// <li>
  /// <code>DEPRECATED</code> – The type was deprecated using
  /// <a>DeprecateWorkflowType</a>, but is still in use. You should keep workers
  /// supporting this type running. You cannot create new workflow executions of
  /// this type.
  /// </li>
  /// </ul>
  final WorkflowTypeInfo typeInfo;

  WorkflowTypeDetail({
    required this.configuration,
    required this.typeInfo,
  });

  factory WorkflowTypeDetail.fromJson(Map<String, dynamic> json) {
    return WorkflowTypeDetail(
      configuration: WorkflowTypeConfiguration.fromJson(
          json['configuration'] as Map<String, dynamic>),
      typeInfo:
          WorkflowTypeInfo.fromJson(json['typeInfo'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    final typeInfo = this.typeInfo;
    return {
      'configuration': configuration,
      'typeInfo': typeInfo,
    };
  }
}

/// Used to filter workflow execution query results by type. Each parameter, if
/// specified, defines a rule that must be satisfied by each returned result.
class WorkflowTypeFilter {
  /// Name of the workflow type.
  final String name;

  /// Version of the workflow type.
  final String? version;

  WorkflowTypeFilter({
    required this.name,
    this.version,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final version = this.version;
    return {
      'name': name,
      if (version != null) 'version': version,
    };
  }
}

/// Contains information about a workflow type.
class WorkflowTypeInfo {
  /// The date when this type was registered.
  final DateTime creationDate;

  /// The current status of the workflow type.
  final RegistrationStatus status;

  /// The workflow type this information is about.
  final WorkflowType workflowType;

  /// If the type is in deprecated state, then it is set to the date when the type
  /// was deprecated.
  final DateTime? deprecationDate;

  /// The description of the type registered through <a>RegisterWorkflowType</a>.
  final String? description;

  WorkflowTypeInfo({
    required this.creationDate,
    required this.status,
    required this.workflowType,
    this.deprecationDate,
    this.description,
  });

  factory WorkflowTypeInfo.fromJson(Map<String, dynamic> json) {
    return WorkflowTypeInfo(
      creationDate:
          nonNullableTimeStampFromJson(json['creationDate'] as Object),
      status: (json['status'] as String).toRegistrationStatus(),
      workflowType:
          WorkflowType.fromJson(json['workflowType'] as Map<String, dynamic>),
      deprecationDate: timeStampFromJson(json['deprecationDate']),
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationDate = this.creationDate;
    final status = this.status;
    final workflowType = this.workflowType;
    final deprecationDate = this.deprecationDate;
    final description = this.description;
    return {
      'creationDate': unixTimestampToJson(creationDate),
      'status': status.toValue(),
      'workflowType': workflowType,
      if (deprecationDate != null)
        'deprecationDate': unixTimestampToJson(deprecationDate),
      if (description != null) 'description': description,
    };
  }
}

/// Contains a paginated list of information structures about workflow types.
class WorkflowTypeInfos {
  /// The list of workflow type information.
  final List<WorkflowTypeInfo> typeInfos;

  /// If a <code>NextPageToken</code> was returned by a previous call, there are
  /// more results available. To retrieve the next page of results, make the call
  /// again using the returned token in <code>nextPageToken</code>. Keep all other
  /// arguments unchanged.
  ///
  /// The configured <code>maximumPageSize</code> determines how many results can
  /// be returned in a single call.
  final String? nextPageToken;

  WorkflowTypeInfos({
    required this.typeInfos,
    this.nextPageToken,
  });

  factory WorkflowTypeInfos.fromJson(Map<String, dynamic> json) {
    return WorkflowTypeInfos(
      typeInfos: (json['typeInfos'] as List)
          .whereNotNull()
          .map((e) => WorkflowTypeInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPageToken: json['nextPageToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final typeInfos = this.typeInfos;
    final nextPageToken = this.nextPageToken;
    return {
      'typeInfos': typeInfos,
      if (nextPageToken != null) 'nextPageToken': nextPageToken,
    };
  }
}

class DefaultUndefinedFault extends _s.GenericAwsException {
  DefaultUndefinedFault({String? type, String? message})
      : super(type: type, code: 'DefaultUndefinedFault', message: message);
}

class DomainAlreadyExistsFault extends _s.GenericAwsException {
  DomainAlreadyExistsFault({String? type, String? message})
      : super(type: type, code: 'DomainAlreadyExistsFault', message: message);
}

class DomainDeprecatedFault extends _s.GenericAwsException {
  DomainDeprecatedFault({String? type, String? message})
      : super(type: type, code: 'DomainDeprecatedFault', message: message);
}

class LimitExceededFault extends _s.GenericAwsException {
  LimitExceededFault({String? type, String? message})
      : super(type: type, code: 'LimitExceededFault', message: message);
}

class OperationNotPermittedFault extends _s.GenericAwsException {
  OperationNotPermittedFault({String? type, String? message})
      : super(type: type, code: 'OperationNotPermittedFault', message: message);
}

class TooManyTagsFault extends _s.GenericAwsException {
  TooManyTagsFault({String? type, String? message})
      : super(type: type, code: 'TooManyTagsFault', message: message);
}

class TypeAlreadyExistsFault extends _s.GenericAwsException {
  TypeAlreadyExistsFault({String? type, String? message})
      : super(type: type, code: 'TypeAlreadyExistsFault', message: message);
}

class TypeDeprecatedFault extends _s.GenericAwsException {
  TypeDeprecatedFault({String? type, String? message})
      : super(type: type, code: 'TypeDeprecatedFault', message: message);
}

class TypeNotDeprecatedFault extends _s.GenericAwsException {
  TypeNotDeprecatedFault({String? type, String? message})
      : super(type: type, code: 'TypeNotDeprecatedFault', message: message);
}

class UnknownResourceFault extends _s.GenericAwsException {
  UnknownResourceFault({String? type, String? message})
      : super(type: type, code: 'UnknownResourceFault', message: message);
}

class WorkflowExecutionAlreadyStartedFault extends _s.GenericAwsException {
  WorkflowExecutionAlreadyStartedFault({String? type, String? message})
      : super(
            type: type,
            code: 'WorkflowExecutionAlreadyStartedFault',
            message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'DefaultUndefinedFault': (type, message) =>
      DefaultUndefinedFault(type: type, message: message),
  'DomainAlreadyExistsFault': (type, message) =>
      DomainAlreadyExistsFault(type: type, message: message),
  'DomainDeprecatedFault': (type, message) =>
      DomainDeprecatedFault(type: type, message: message),
  'LimitExceededFault': (type, message) =>
      LimitExceededFault(type: type, message: message),
  'OperationNotPermittedFault': (type, message) =>
      OperationNotPermittedFault(type: type, message: message),
  'TooManyTagsFault': (type, message) =>
      TooManyTagsFault(type: type, message: message),
  'TypeAlreadyExistsFault': (type, message) =>
      TypeAlreadyExistsFault(type: type, message: message),
  'TypeDeprecatedFault': (type, message) =>
      TypeDeprecatedFault(type: type, message: message),
  'TypeNotDeprecatedFault': (type, message) =>
      TypeNotDeprecatedFault(type: type, message: message),
  'UnknownResourceFault': (type, message) =>
      UnknownResourceFault(type: type, message: message),
  'WorkflowExecutionAlreadyStartedFault': (type, message) =>
      WorkflowExecutionAlreadyStartedFault(type: type, message: message),
};
