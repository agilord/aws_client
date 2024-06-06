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

/// Use the Amazon Web Services Budgets API to plan your service usage, service
/// costs, and instance reservations. This API reference provides descriptions,
/// syntax, and usage examples for each of the actions and data types for the
/// Amazon Web Services Budgets feature.
///
/// Budgets provide you with a way to see the following information:
///
/// <ul>
/// <li>
/// How close your plan is to your budgeted amount or to the free tier limits
/// </li>
/// <li>
/// Your usage-to-date, including how much you've used of your Reserved
/// Instances (RIs)
/// </li>
/// <li>
/// Your current estimated charges from Amazon Web Services, and how much your
/// predicted usage will accrue in charges by the end of the month
/// </li>
/// <li>
/// How much of your budget has been used
/// </li>
/// </ul>
/// Amazon Web Services updates your budget status several times a day. Budgets
/// track your unblended costs, subscriptions, refunds, and RIs. You can create
/// the following types of budgets:
///
/// <ul>
/// <li>
/// <b>Cost budgets</b> - Plan how much you want to spend on a service.
/// </li>
/// <li>
/// <b>Usage budgets</b> - Plan how much you want to use one or more services.
/// </li>
/// <li>
/// <b>RI utilization budgets</b> - Define a utilization threshold, and receive
/// alerts when your RI usage falls below that threshold. This lets you see if
/// your RIs are unused or under-utilized.
/// </li>
/// <li>
/// <b>RI coverage budgets</b> - Define a coverage threshold, and receive alerts
/// when the number of your instance hours that are covered by RIs fall below
/// that threshold. This lets you see how much of your instance usage is covered
/// by a reservation.
/// </li>
/// </ul>
/// Service Endpoint
///
/// The Amazon Web Services Budgets API provides the following endpoint:
///
/// <ul>
/// <li>
/// https://budgets.amazonaws.com
/// </li>
/// </ul>
/// For information about costs that are associated with the Amazon Web Services
/// Budgets API, see <a
/// href="https://aws.amazon.com/aws-cost-management/pricing/">Amazon Web
/// Services Cost Management Pricing</a>.
class Budgets {
  final _s.JsonProtocol _protocol;
  Budgets({
    String? region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'budgets',
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

  /// Creates a budget and, if included, notifications and subscribers.
  /// <important>
  /// Only one of <code>BudgetLimit</code> or <code>PlannedBudgetLimits</code>
  /// can be present in the syntax at one time. Use the syntax that matches your
  /// case. The Request Syntax section shows the <code>BudgetLimit</code>
  /// syntax. For <code>PlannedBudgetLimits</code>, see the <a
  /// href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_budgets_CreateBudget.html#API_CreateBudget_Examples">Examples</a>
  /// section.
  /// </important>
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InternalErrorException].
  /// May throw [CreationLimitExceededException].
  /// May throw [DuplicateRecordException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [accountId] :
  /// The <code>accountId</code> that is associated with the budget.
  ///
  /// Parameter [budget] :
  /// The budget object that you want to create.
  ///
  /// Parameter [notificationsWithSubscribers] :
  /// A notification that you want to associate with a budget. A budget can have
  /// up to five notifications, and each notification can have one SNS
  /// subscriber and up to 10 email subscribers. If you include notifications
  /// and subscribers in your <code>CreateBudget</code> call, Amazon Web
  /// Services creates the notifications and subscribers for you.
  ///
  /// Parameter [resourceTags] :
  /// An optional list of tags to associate with the specified budget. Each tag
  /// consists of a key and a value, and each key must be unique for the
  /// resource.
  Future<void> createBudget({
    required String accountId,
    required Budget budget,
    List<NotificationWithSubscribers>? notificationsWithSubscribers,
    List<ResourceTag>? resourceTags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSBudgetServiceGateway.CreateBudget'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AccountId': accountId,
        'Budget': budget,
        if (notificationsWithSubscribers != null)
          'NotificationsWithSubscribers': notificationsWithSubscribers,
        if (resourceTags != null) 'ResourceTags': resourceTags,
      },
    );
  }

  /// Creates a budget action.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InternalErrorException].
  /// May throw [CreationLimitExceededException].
  /// May throw [DuplicateRecordException].
  /// May throw [NotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [actionType] :
  /// The type of action. This defines the type of tasks that can be carried out
  /// by this action. This field also determines the format for definition.
  ///
  /// Parameter [approvalModel] :
  /// This specifies if the action needs manual or automatic approval.
  ///
  /// Parameter [executionRoleArn] :
  /// The role passed for action execution and reversion. Roles and actions must
  /// be in the same account.
  ///
  /// Parameter [resourceTags] :
  /// An optional list of tags to associate with the specified budget action.
  /// Each tag consists of a key and a value, and each key must be unique for
  /// the resource.
  Future<CreateBudgetActionResponse> createBudgetAction({
    required String accountId,
    required ActionThreshold actionThreshold,
    required ActionType actionType,
    required ApprovalModel approvalModel,
    required String budgetName,
    required Definition definition,
    required String executionRoleArn,
    required NotificationType notificationType,
    required List<Subscriber> subscribers,
    List<ResourceTag>? resourceTags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSBudgetServiceGateway.CreateBudgetAction'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AccountId': accountId,
        'ActionThreshold': actionThreshold,
        'ActionType': actionType.toValue(),
        'ApprovalModel': approvalModel.toValue(),
        'BudgetName': budgetName,
        'Definition': definition,
        'ExecutionRoleArn': executionRoleArn,
        'NotificationType': notificationType.toValue(),
        'Subscribers': subscribers,
        if (resourceTags != null) 'ResourceTags': resourceTags,
      },
    );

    return CreateBudgetActionResponse.fromJson(jsonResponse.body);
  }

  /// Creates a notification. You must create the budget before you create the
  /// associated notification.
  ///
  /// May throw [InternalErrorException].
  /// May throw [InvalidParameterException].
  /// May throw [NotFoundException].
  /// May throw [CreationLimitExceededException].
  /// May throw [DuplicateRecordException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [accountId] :
  /// The <code>accountId</code> that is associated with the budget that you
  /// want to create a notification for.
  ///
  /// Parameter [budgetName] :
  /// The name of the budget that you want Amazon Web Services to notify you
  /// about. Budget names must be unique within an account.
  ///
  /// Parameter [notification] :
  /// The notification that you want to create.
  ///
  /// Parameter [subscribers] :
  /// A list of subscribers that you want to associate with the notification.
  /// Each notification can have one SNS subscriber and up to 10 email
  /// subscribers.
  Future<void> createNotification({
    required String accountId,
    required String budgetName,
    required Notification notification,
    required List<Subscriber> subscribers,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSBudgetServiceGateway.CreateNotification'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AccountId': accountId,
        'BudgetName': budgetName,
        'Notification': notification,
        'Subscribers': subscribers,
      },
    );
  }

  /// Creates a subscriber. You must create the associated budget and
  /// notification before you create the subscriber.
  ///
  /// May throw [InternalErrorException].
  /// May throw [InvalidParameterException].
  /// May throw [CreationLimitExceededException].
  /// May throw [DuplicateRecordException].
  /// May throw [NotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [accountId] :
  /// The <code>accountId</code> that is associated with the budget that you
  /// want to create a subscriber for.
  ///
  /// Parameter [budgetName] :
  /// The name of the budget that you want to subscribe to. Budget names must be
  /// unique within an account.
  ///
  /// Parameter [notification] :
  /// The notification that you want to create a subscriber for.
  ///
  /// Parameter [subscriber] :
  /// The subscriber that you want to associate with a budget notification.
  Future<void> createSubscriber({
    required String accountId,
    required String budgetName,
    required Notification notification,
    required Subscriber subscriber,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSBudgetServiceGateway.CreateSubscriber'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AccountId': accountId,
        'BudgetName': budgetName,
        'Notification': notification,
        'Subscriber': subscriber,
      },
    );
  }

  /// Deletes a budget. You can delete your budget at any time.
  /// <important>
  /// Deleting a budget also deletes the notifications and subscribers that are
  /// associated with that budget.
  /// </important>
  ///
  /// May throw [InternalErrorException].
  /// May throw [InvalidParameterException].
  /// May throw [NotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [accountId] :
  /// The <code>accountId</code> that is associated with the budget that you
  /// want to delete.
  ///
  /// Parameter [budgetName] :
  /// The name of the budget that you want to delete.
  Future<void> deleteBudget({
    required String accountId,
    required String budgetName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSBudgetServiceGateway.DeleteBudget'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AccountId': accountId,
        'BudgetName': budgetName,
      },
    );
  }

  /// Deletes a budget action.
  ///
  /// May throw [InternalErrorException].
  /// May throw [InvalidParameterException].
  /// May throw [NotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceLockedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [actionId] :
  /// A system-generated universally unique identifier (UUID) for the action.
  Future<DeleteBudgetActionResponse> deleteBudgetAction({
    required String accountId,
    required String actionId,
    required String budgetName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSBudgetServiceGateway.DeleteBudgetAction'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AccountId': accountId,
        'ActionId': actionId,
        'BudgetName': budgetName,
      },
    );

    return DeleteBudgetActionResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a notification.
  /// <important>
  /// Deleting a notification also deletes the subscribers that are associated
  /// with the notification.
  /// </important>
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InternalErrorException].
  /// May throw [NotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [accountId] :
  /// The <code>accountId</code> that is associated with the budget whose
  /// notification you want to delete.
  ///
  /// Parameter [budgetName] :
  /// The name of the budget whose notification you want to delete.
  ///
  /// Parameter [notification] :
  /// The notification that you want to delete.
  Future<void> deleteNotification({
    required String accountId,
    required String budgetName,
    required Notification notification,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSBudgetServiceGateway.DeleteNotification'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AccountId': accountId,
        'BudgetName': budgetName,
        'Notification': notification,
      },
    );
  }

  /// Deletes a subscriber.
  /// <important>
  /// Deleting the last subscriber to a notification also deletes the
  /// notification.
  /// </important>
  ///
  /// May throw [InternalErrorException].
  /// May throw [InvalidParameterException].
  /// May throw [NotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [accountId] :
  /// The <code>accountId</code> that is associated with the budget whose
  /// subscriber you want to delete.
  ///
  /// Parameter [budgetName] :
  /// The name of the budget whose subscriber you want to delete.
  ///
  /// Parameter [notification] :
  /// The notification whose subscriber you want to delete.
  ///
  /// Parameter [subscriber] :
  /// The subscriber that you want to delete.
  Future<void> deleteSubscriber({
    required String accountId,
    required String budgetName,
    required Notification notification,
    required Subscriber subscriber,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSBudgetServiceGateway.DeleteSubscriber'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AccountId': accountId,
        'BudgetName': budgetName,
        'Notification': notification,
        'Subscriber': subscriber,
      },
    );
  }

  /// Describes a budget.
  /// <important>
  /// The Request Syntax section shows the <code>BudgetLimit</code> syntax. For
  /// <code>PlannedBudgetLimits</code>, see the <a
  /// href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_budgets_DescribeBudget.html#API_DescribeBudget_Examples">Examples</a>
  /// section.
  /// </important>
  ///
  /// May throw [InternalErrorException].
  /// May throw [InvalidParameterException].
  /// May throw [NotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [accountId] :
  /// The <code>accountId</code> that is associated with the budget that you
  /// want a description of.
  ///
  /// Parameter [budgetName] :
  /// The name of the budget that you want a description of.
  Future<DescribeBudgetResponse> describeBudget({
    required String accountId,
    required String budgetName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSBudgetServiceGateway.DescribeBudget'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AccountId': accountId,
        'BudgetName': budgetName,
      },
    );

    return DescribeBudgetResponse.fromJson(jsonResponse.body);
  }

  /// Describes a budget action detail.
  ///
  /// May throw [InternalErrorException].
  /// May throw [InvalidParameterException].
  /// May throw [NotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [actionId] :
  /// A system-generated universally unique identifier (UUID) for the action.
  Future<DescribeBudgetActionResponse> describeBudgetAction({
    required String accountId,
    required String actionId,
    required String budgetName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSBudgetServiceGateway.DescribeBudgetAction'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AccountId': accountId,
        'ActionId': actionId,
        'BudgetName': budgetName,
      },
    );

    return DescribeBudgetActionResponse.fromJson(jsonResponse.body);
  }

  /// Describes a budget action history detail.
  ///
  /// May throw [InternalErrorException].
  /// May throw [InvalidParameterException].
  /// May throw [NotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InvalidNextTokenException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [actionId] :
  /// A system-generated universally unique identifier (UUID) for the action.
  Future<DescribeBudgetActionHistoriesResponse> describeBudgetActionHistories({
    required String accountId,
    required String actionId,
    required String budgetName,
    int? maxResults,
    String? nextToken,
    TimePeriod? timePeriod,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSBudgetServiceGateway.DescribeBudgetActionHistories'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AccountId': accountId,
        'ActionId': actionId,
        'BudgetName': budgetName,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (timePeriod != null) 'TimePeriod': timePeriod,
      },
    );

    return DescribeBudgetActionHistoriesResponse.fromJson(jsonResponse.body);
  }

  /// Describes all of the budget actions for an account.
  ///
  /// May throw [InternalErrorException].
  /// May throw [InvalidParameterException].
  /// May throw [AccessDeniedException].
  /// May throw [InvalidNextTokenException].
  /// May throw [ThrottlingException].
  Future<DescribeBudgetActionsForAccountResponse>
      describeBudgetActionsForAccount({
    required String accountId,
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
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSBudgetServiceGateway.DescribeBudgetActionsForAccount'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AccountId': accountId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeBudgetActionsForAccountResponse.fromJson(jsonResponse.body);
  }

  /// Describes all of the budget actions for a budget.
  ///
  /// May throw [InternalErrorException].
  /// May throw [InvalidParameterException].
  /// May throw [NotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InvalidNextTokenException].
  /// May throw [ThrottlingException].
  Future<DescribeBudgetActionsForBudgetResponse>
      describeBudgetActionsForBudget({
    required String accountId,
    required String budgetName,
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
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSBudgetServiceGateway.DescribeBudgetActionsForBudget'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AccountId': accountId,
        'BudgetName': budgetName,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeBudgetActionsForBudgetResponse.fromJson(jsonResponse.body);
  }

  /// Lists the budget names and notifications that are associated with an
  /// account.
  ///
  /// May throw [InternalErrorException].
  /// May throw [InvalidParameterException].
  /// May throw [NotFoundException].
  /// May throw [InvalidNextTokenException].
  /// May throw [ExpiredNextTokenException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [maxResults] :
  /// An integer that represents how many budgets a paginated response contains.
  /// The default is 50.
  Future<DescribeBudgetNotificationsForAccountResponse>
      describeBudgetNotificationsForAccount({
    required String accountId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSBudgetServiceGateway.DescribeBudgetNotificationsForAccount'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AccountId': accountId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeBudgetNotificationsForAccountResponse.fromJson(
        jsonResponse.body);
  }

  /// Describes the history for <code>DAILY</code>, <code>MONTHLY</code>, and
  /// <code>QUARTERLY</code> budgets. Budget history isn't available for
  /// <code>ANNUAL</code> budgets.
  ///
  /// May throw [InternalErrorException].
  /// May throw [InvalidParameterException].
  /// May throw [NotFoundException].
  /// May throw [InvalidNextTokenException].
  /// May throw [ExpiredNextTokenException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [timePeriod] :
  /// Retrieves how often the budget went into an <code>ALARM</code> state for
  /// the specified time period.
  Future<DescribeBudgetPerformanceHistoryResponse>
      describeBudgetPerformanceHistory({
    required String accountId,
    required String budgetName,
    int? maxResults,
    String? nextToken,
    TimePeriod? timePeriod,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSBudgetServiceGateway.DescribeBudgetPerformanceHistory'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AccountId': accountId,
        'BudgetName': budgetName,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (timePeriod != null) 'TimePeriod': timePeriod,
      },
    );

    return DescribeBudgetPerformanceHistoryResponse.fromJson(jsonResponse.body);
  }

  /// Lists the budgets that are associated with an account.
  /// <important>
  /// The Request Syntax section shows the <code>BudgetLimit</code> syntax. For
  /// <code>PlannedBudgetLimits</code>, see the <a
  /// href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_budgets_DescribeBudgets.html#API_DescribeBudgets_Examples">Examples</a>
  /// section.
  /// </important>
  ///
  /// May throw [InternalErrorException].
  /// May throw [InvalidParameterException].
  /// May throw [NotFoundException].
  /// May throw [InvalidNextTokenException].
  /// May throw [ExpiredNextTokenException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [accountId] :
  /// The <code>accountId</code> that is associated with the budgets that you
  /// want to describe.
  ///
  /// Parameter [maxResults] :
  /// An integer that represents how many budgets a paginated response contains.
  /// The default is 100.
  ///
  /// Parameter [nextToken] :
  /// The pagination token that you include in your request to indicate the next
  /// set of results that you want to retrieve.
  Future<DescribeBudgetsResponse> describeBudgets({
    required String accountId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSBudgetServiceGateway.DescribeBudgets'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AccountId': accountId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeBudgetsResponse.fromJson(jsonResponse.body);
  }

  /// Lists the notifications that are associated with a budget.
  ///
  /// May throw [InternalErrorException].
  /// May throw [InvalidParameterException].
  /// May throw [NotFoundException].
  /// May throw [InvalidNextTokenException].
  /// May throw [ExpiredNextTokenException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [accountId] :
  /// The <code>accountId</code> that is associated with the budget whose
  /// notifications you want descriptions of.
  ///
  /// Parameter [budgetName] :
  /// The name of the budget whose notifications you want descriptions of.
  ///
  /// Parameter [maxResults] :
  /// An optional integer that represents how many entries a paginated response
  /// contains.
  ///
  /// Parameter [nextToken] :
  /// The pagination token that you include in your request to indicate the next
  /// set of results that you want to retrieve.
  Future<DescribeNotificationsForBudgetResponse>
      describeNotificationsForBudget({
    required String accountId,
    required String budgetName,
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
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSBudgetServiceGateway.DescribeNotificationsForBudget'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AccountId': accountId,
        'BudgetName': budgetName,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeNotificationsForBudgetResponse.fromJson(jsonResponse.body);
  }

  /// Lists the subscribers that are associated with a notification.
  ///
  /// May throw [InternalErrorException].
  /// May throw [NotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidNextTokenException].
  /// May throw [ExpiredNextTokenException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [accountId] :
  /// The <code>accountId</code> that is associated with the budget whose
  /// subscribers you want descriptions of.
  ///
  /// Parameter [budgetName] :
  /// The name of the budget whose subscribers you want descriptions of.
  ///
  /// Parameter [notification] :
  /// The notification whose subscribers you want to list.
  ///
  /// Parameter [maxResults] :
  /// An optional integer that represents how many entries a paginated response
  /// contains.
  ///
  /// Parameter [nextToken] :
  /// The pagination token that you include in your request to indicate the next
  /// set of results that you want to retrieve.
  Future<DescribeSubscribersForNotificationResponse>
      describeSubscribersForNotification({
    required String accountId,
    required String budgetName,
    required Notification notification,
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
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSBudgetServiceGateway.DescribeSubscribersForNotification'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AccountId': accountId,
        'BudgetName': budgetName,
        'Notification': notification,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeSubscribersForNotificationResponse.fromJson(
        jsonResponse.body);
  }

  /// Executes a budget action.
  ///
  /// May throw [InternalErrorException].
  /// May throw [InvalidParameterException].
  /// May throw [NotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceLockedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [actionId] :
  /// A system-generated universally unique identifier (UUID) for the action.
  ///
  /// Parameter [executionType] :
  /// The type of execution.
  Future<ExecuteBudgetActionResponse> executeBudgetAction({
    required String accountId,
    required String actionId,
    required String budgetName,
    required ExecutionType executionType,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSBudgetServiceGateway.ExecuteBudgetAction'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AccountId': accountId,
        'ActionId': actionId,
        'BudgetName': budgetName,
        'ExecutionType': executionType.toValue(),
      },
    );

    return ExecuteBudgetActionResponse.fromJson(jsonResponse.body);
  }

  /// Lists tags associated with a budget or budget action resource.
  ///
  /// May throw [ThrottlingException].
  /// May throw [NotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalErrorException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [resourceARN] :
  /// The unique identifier for the resource.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceARN,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSBudgetServiceGateway.ListTagsForResource'
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

  /// Creates tags for a budget or budget action resource.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [NotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalErrorException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [resourceARN] :
  /// The unique identifier for the resource.
  ///
  /// Parameter [resourceTags] :
  /// The tags associated with the resource.
  Future<void> tagResource({
    required String resourceARN,
    required List<ResourceTag> resourceTags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSBudgetServiceGateway.TagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceARN': resourceARN,
        'ResourceTags': resourceTags,
      },
    );
  }

  /// Deletes tags associated with a budget or budget action resource.
  ///
  /// May throw [ThrottlingException].
  /// May throw [NotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalErrorException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [resourceARN] :
  /// The unique identifier for the resource.
  ///
  /// Parameter [resourceTagKeys] :
  /// The key that's associated with the tag.
  Future<void> untagResource({
    required String resourceARN,
    required List<String> resourceTagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSBudgetServiceGateway.UntagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceARN': resourceARN,
        'ResourceTagKeys': resourceTagKeys,
      },
    );
  }

  /// Updates a budget. You can change every part of a budget except for the
  /// <code>budgetName</code> and the <code>calculatedSpend</code>. When you
  /// modify a budget, the <code>calculatedSpend</code> drops to zero until
  /// Amazon Web Services has new usage data to use for forecasting.
  /// <important>
  /// Only one of <code>BudgetLimit</code> or <code>PlannedBudgetLimits</code>
  /// can be present in the syntax at one time. Use the syntax that matches your
  /// case. The Request Syntax section shows the <code>BudgetLimit</code>
  /// syntax. For <code>PlannedBudgetLimits</code>, see the <a
  /// href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_budgets_UpdateBudget.html#API_UpdateBudget_Examples">Examples</a>
  /// section.
  /// </important>
  ///
  /// May throw [InternalErrorException].
  /// May throw [InvalidParameterException].
  /// May throw [NotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [accountId] :
  /// The <code>accountId</code> that is associated with the budget that you
  /// want to update.
  ///
  /// Parameter [newBudget] :
  /// The budget that you want to update your budget to.
  Future<void> updateBudget({
    required String accountId,
    required Budget newBudget,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSBudgetServiceGateway.UpdateBudget'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AccountId': accountId,
        'NewBudget': newBudget,
      },
    );
  }

  /// Updates a budget action.
  ///
  /// May throw [InternalErrorException].
  /// May throw [InvalidParameterException].
  /// May throw [NotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceLockedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [actionId] :
  /// A system-generated universally unique identifier (UUID) for the action.
  ///
  /// Parameter [approvalModel] :
  /// This specifies if the action needs manual or automatic approval.
  ///
  /// Parameter [executionRoleArn] :
  /// The role passed for action execution and reversion. Roles and actions must
  /// be in the same account.
  Future<UpdateBudgetActionResponse> updateBudgetAction({
    required String accountId,
    required String actionId,
    required String budgetName,
    ActionThreshold? actionThreshold,
    ApprovalModel? approvalModel,
    Definition? definition,
    String? executionRoleArn,
    NotificationType? notificationType,
    List<Subscriber>? subscribers,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSBudgetServiceGateway.UpdateBudgetAction'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AccountId': accountId,
        'ActionId': actionId,
        'BudgetName': budgetName,
        if (actionThreshold != null) 'ActionThreshold': actionThreshold,
        if (approvalModel != null) 'ApprovalModel': approvalModel.toValue(),
        if (definition != null) 'Definition': definition,
        if (executionRoleArn != null) 'ExecutionRoleArn': executionRoleArn,
        if (notificationType != null)
          'NotificationType': notificationType.toValue(),
        if (subscribers != null) 'Subscribers': subscribers,
      },
    );

    return UpdateBudgetActionResponse.fromJson(jsonResponse.body);
  }

  /// Updates a notification.
  ///
  /// May throw [InternalErrorException].
  /// May throw [InvalidParameterException].
  /// May throw [NotFoundException].
  /// May throw [DuplicateRecordException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [accountId] :
  /// The <code>accountId</code> that is associated with the budget whose
  /// notification you want to update.
  ///
  /// Parameter [budgetName] :
  /// The name of the budget whose notification you want to update.
  ///
  /// Parameter [newNotification] :
  /// The updated notification to be associated with a budget.
  ///
  /// Parameter [oldNotification] :
  /// The previous notification that is associated with a budget.
  Future<void> updateNotification({
    required String accountId,
    required String budgetName,
    required Notification newNotification,
    required Notification oldNotification,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSBudgetServiceGateway.UpdateNotification'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AccountId': accountId,
        'BudgetName': budgetName,
        'NewNotification': newNotification,
        'OldNotification': oldNotification,
      },
    );
  }

  /// Updates a subscriber.
  ///
  /// May throw [InternalErrorException].
  /// May throw [InvalidParameterException].
  /// May throw [NotFoundException].
  /// May throw [DuplicateRecordException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [accountId] :
  /// The <code>accountId</code> that is associated with the budget whose
  /// subscriber you want to update.
  ///
  /// Parameter [budgetName] :
  /// The name of the budget whose subscriber you want to update.
  ///
  /// Parameter [newSubscriber] :
  /// The updated subscriber that is associated with a budget notification.
  ///
  /// Parameter [notification] :
  /// The notification whose subscriber you want to update.
  ///
  /// Parameter [oldSubscriber] :
  /// The previous subscriber that is associated with a budget notification.
  Future<void> updateSubscriber({
    required String accountId,
    required String budgetName,
    required Subscriber newSubscriber,
    required Notification notification,
    required Subscriber oldSubscriber,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSBudgetServiceGateway.UpdateSubscriber'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AccountId': accountId,
        'BudgetName': budgetName,
        'NewSubscriber': newSubscriber,
        'Notification': notification,
        'OldSubscriber': oldSubscriber,
      },
    );
  }
}

/// A budget action resource.
class Action {
  /// A system-generated universally unique identifier (UUID) for the action.
  final String actionId;

  /// The trigger threshold of the action.
  final ActionThreshold actionThreshold;

  /// The type of action. This defines the type of tasks that can be carried out
  /// by this action. This field also determines the format for definition.
  final ActionType actionType;

  /// This specifies if the action needs manual or automatic approval.
  final ApprovalModel approvalModel;
  final String budgetName;

  /// Where you specify all of the type-specific parameters.
  final Definition definition;

  /// The role passed for action execution and reversion. Roles and actions must
  /// be in the same account.
  final String executionRoleArn;
  final NotificationType notificationType;

  /// The status of the action.
  final ActionStatus status;
  final List<Subscriber> subscribers;

  Action({
    required this.actionId,
    required this.actionThreshold,
    required this.actionType,
    required this.approvalModel,
    required this.budgetName,
    required this.definition,
    required this.executionRoleArn,
    required this.notificationType,
    required this.status,
    required this.subscribers,
  });

  factory Action.fromJson(Map<String, dynamic> json) {
    return Action(
      actionId: json['ActionId'] as String,
      actionThreshold: ActionThreshold.fromJson(
          json['ActionThreshold'] as Map<String, dynamic>),
      actionType: (json['ActionType'] as String).toActionType(),
      approvalModel: (json['ApprovalModel'] as String).toApprovalModel(),
      budgetName: json['BudgetName'] as String,
      definition:
          Definition.fromJson(json['Definition'] as Map<String, dynamic>),
      executionRoleArn: json['ExecutionRoleArn'] as String,
      notificationType:
          (json['NotificationType'] as String).toNotificationType(),
      status: (json['Status'] as String).toActionStatus(),
      subscribers: (json['Subscribers'] as List)
          .whereNotNull()
          .map((e) => Subscriber.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final actionId = this.actionId;
    final actionThreshold = this.actionThreshold;
    final actionType = this.actionType;
    final approvalModel = this.approvalModel;
    final budgetName = this.budgetName;
    final definition = this.definition;
    final executionRoleArn = this.executionRoleArn;
    final notificationType = this.notificationType;
    final status = this.status;
    final subscribers = this.subscribers;
    return {
      'ActionId': actionId,
      'ActionThreshold': actionThreshold,
      'ActionType': actionType.toValue(),
      'ApprovalModel': approvalModel.toValue(),
      'BudgetName': budgetName,
      'Definition': definition,
      'ExecutionRoleArn': executionRoleArn,
      'NotificationType': notificationType.toValue(),
      'Status': status.toValue(),
      'Subscribers': subscribers,
    };
  }
}

/// The historical records for a budget action.
class ActionHistory {
  /// The description of the details for the event.
  final ActionHistoryDetails actionHistoryDetails;

  /// This distinguishes between whether the events are triggered by the user or
  /// are generated by the system.
  final EventType eventType;

  /// The status of action at the time of the event.
  final ActionStatus status;
  final DateTime timestamp;

  ActionHistory({
    required this.actionHistoryDetails,
    required this.eventType,
    required this.status,
    required this.timestamp,
  });

  factory ActionHistory.fromJson(Map<String, dynamic> json) {
    return ActionHistory(
      actionHistoryDetails: ActionHistoryDetails.fromJson(
          json['ActionHistoryDetails'] as Map<String, dynamic>),
      eventType: (json['EventType'] as String).toEventType(),
      status: (json['Status'] as String).toActionStatus(),
      timestamp: nonNullableTimeStampFromJson(json['Timestamp'] as Object),
    );
  }

  Map<String, dynamic> toJson() {
    final actionHistoryDetails = this.actionHistoryDetails;
    final eventType = this.eventType;
    final status = this.status;
    final timestamp = this.timestamp;
    return {
      'ActionHistoryDetails': actionHistoryDetails,
      'EventType': eventType.toValue(),
      'Status': status.toValue(),
      'Timestamp': unixTimestampToJson(timestamp),
    };
  }
}

/// The description of the details for the event.
class ActionHistoryDetails {
  /// The budget action resource.
  final Action action;
  final String message;

  ActionHistoryDetails({
    required this.action,
    required this.message,
  });

  factory ActionHistoryDetails.fromJson(Map<String, dynamic> json) {
    return ActionHistoryDetails(
      action: Action.fromJson(json['Action'] as Map<String, dynamic>),
      message: json['Message'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final message = this.message;
    return {
      'Action': action,
      'Message': message,
    };
  }
}

enum ActionStatus {
  standby,
  pending,
  executionInProgress,
  executionSuccess,
  executionFailure,
  reverseInProgress,
  reverseSuccess,
  reverseFailure,
  resetInProgress,
  resetFailure,
}

extension ActionStatusValueExtension on ActionStatus {
  String toValue() {
    switch (this) {
      case ActionStatus.standby:
        return 'STANDBY';
      case ActionStatus.pending:
        return 'PENDING';
      case ActionStatus.executionInProgress:
        return 'EXECUTION_IN_PROGRESS';
      case ActionStatus.executionSuccess:
        return 'EXECUTION_SUCCESS';
      case ActionStatus.executionFailure:
        return 'EXECUTION_FAILURE';
      case ActionStatus.reverseInProgress:
        return 'REVERSE_IN_PROGRESS';
      case ActionStatus.reverseSuccess:
        return 'REVERSE_SUCCESS';
      case ActionStatus.reverseFailure:
        return 'REVERSE_FAILURE';
      case ActionStatus.resetInProgress:
        return 'RESET_IN_PROGRESS';
      case ActionStatus.resetFailure:
        return 'RESET_FAILURE';
    }
  }
}

extension ActionStatusFromString on String {
  ActionStatus toActionStatus() {
    switch (this) {
      case 'STANDBY':
        return ActionStatus.standby;
      case 'PENDING':
        return ActionStatus.pending;
      case 'EXECUTION_IN_PROGRESS':
        return ActionStatus.executionInProgress;
      case 'EXECUTION_SUCCESS':
        return ActionStatus.executionSuccess;
      case 'EXECUTION_FAILURE':
        return ActionStatus.executionFailure;
      case 'REVERSE_IN_PROGRESS':
        return ActionStatus.reverseInProgress;
      case 'REVERSE_SUCCESS':
        return ActionStatus.reverseSuccess;
      case 'REVERSE_FAILURE':
        return ActionStatus.reverseFailure;
      case 'RESET_IN_PROGRESS':
        return ActionStatus.resetInProgress;
      case 'RESET_FAILURE':
        return ActionStatus.resetFailure;
    }
    throw Exception('$this is not known in enum ActionStatus');
  }
}

enum ActionSubType {
  stopEc2Instances,
  stopRdsInstances,
}

extension ActionSubTypeValueExtension on ActionSubType {
  String toValue() {
    switch (this) {
      case ActionSubType.stopEc2Instances:
        return 'STOP_EC2_INSTANCES';
      case ActionSubType.stopRdsInstances:
        return 'STOP_RDS_INSTANCES';
    }
  }
}

extension ActionSubTypeFromString on String {
  ActionSubType toActionSubType() {
    switch (this) {
      case 'STOP_EC2_INSTANCES':
        return ActionSubType.stopEc2Instances;
      case 'STOP_RDS_INSTANCES':
        return ActionSubType.stopRdsInstances;
    }
    throw Exception('$this is not known in enum ActionSubType');
  }
}

/// The trigger threshold of the action.
class ActionThreshold {
  final ThresholdType actionThresholdType;
  final double actionThresholdValue;

  ActionThreshold({
    required this.actionThresholdType,
    required this.actionThresholdValue,
  });

  factory ActionThreshold.fromJson(Map<String, dynamic> json) {
    return ActionThreshold(
      actionThresholdType:
          (json['ActionThresholdType'] as String).toThresholdType(),
      actionThresholdValue: json['ActionThresholdValue'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    final actionThresholdType = this.actionThresholdType;
    final actionThresholdValue = this.actionThresholdValue;
    return {
      'ActionThresholdType': actionThresholdType.toValue(),
      'ActionThresholdValue': actionThresholdValue,
    };
  }
}

enum ActionType {
  applyIamPolicy,
  applyScpPolicy,
  runSsmDocuments,
}

extension ActionTypeValueExtension on ActionType {
  String toValue() {
    switch (this) {
      case ActionType.applyIamPolicy:
        return 'APPLY_IAM_POLICY';
      case ActionType.applyScpPolicy:
        return 'APPLY_SCP_POLICY';
      case ActionType.runSsmDocuments:
        return 'RUN_SSM_DOCUMENTS';
    }
  }
}

extension ActionTypeFromString on String {
  ActionType toActionType() {
    switch (this) {
      case 'APPLY_IAM_POLICY':
        return ActionType.applyIamPolicy;
      case 'APPLY_SCP_POLICY':
        return ActionType.applyScpPolicy;
      case 'RUN_SSM_DOCUMENTS':
        return ActionType.runSsmDocuments;
    }
    throw Exception('$this is not known in enum ActionType');
  }
}

enum ApprovalModel {
  automatic,
  manual,
}

extension ApprovalModelValueExtension on ApprovalModel {
  String toValue() {
    switch (this) {
      case ApprovalModel.automatic:
        return 'AUTOMATIC';
      case ApprovalModel.manual:
        return 'MANUAL';
    }
  }
}

extension ApprovalModelFromString on String {
  ApprovalModel toApprovalModel() {
    switch (this) {
      case 'AUTOMATIC':
        return ApprovalModel.automatic;
      case 'MANUAL':
        return ApprovalModel.manual;
    }
    throw Exception('$this is not known in enum ApprovalModel');
  }
}

/// The parameters that determine the budget amount for an auto-adjusting
/// budget.
class AutoAdjustData {
  /// The string that defines whether your budget auto-adjusts based on historical
  /// or forecasted data.
  final AutoAdjustType autoAdjustType;

  /// The parameters that define or describe the historical data that your
  /// auto-adjusting budget is based on.
  final HistoricalOptions? historicalOptions;

  /// The last time that your budget was auto-adjusted.
  final DateTime? lastAutoAdjustTime;

  AutoAdjustData({
    required this.autoAdjustType,
    this.historicalOptions,
    this.lastAutoAdjustTime,
  });

  factory AutoAdjustData.fromJson(Map<String, dynamic> json) {
    return AutoAdjustData(
      autoAdjustType: (json['AutoAdjustType'] as String).toAutoAdjustType(),
      historicalOptions: json['HistoricalOptions'] != null
          ? HistoricalOptions.fromJson(
              json['HistoricalOptions'] as Map<String, dynamic>)
          : null,
      lastAutoAdjustTime: timeStampFromJson(json['LastAutoAdjustTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final autoAdjustType = this.autoAdjustType;
    final historicalOptions = this.historicalOptions;
    final lastAutoAdjustTime = this.lastAutoAdjustTime;
    return {
      'AutoAdjustType': autoAdjustType.toValue(),
      if (historicalOptions != null) 'HistoricalOptions': historicalOptions,
      if (lastAutoAdjustTime != null)
        'LastAutoAdjustTime': unixTimestampToJson(lastAutoAdjustTime),
    };
  }
}

enum AutoAdjustType {
  historical,
  forecast,
}

extension AutoAdjustTypeValueExtension on AutoAdjustType {
  String toValue() {
    switch (this) {
      case AutoAdjustType.historical:
        return 'HISTORICAL';
      case AutoAdjustType.forecast:
        return 'FORECAST';
    }
  }
}

extension AutoAdjustTypeFromString on String {
  AutoAdjustType toAutoAdjustType() {
    switch (this) {
      case 'HISTORICAL':
        return AutoAdjustType.historical;
      case 'FORECAST':
        return AutoAdjustType.forecast;
    }
    throw Exception('$this is not known in enum AutoAdjustType');
  }
}

/// Represents the output of the <code>CreateBudget</code> operation. The
/// content consists of the detailed metadata and data file information, and the
/// current status of the <code>budget</code> object.
///
/// This is the Amazon Resource Name (ARN) pattern for a budget:
///
/// <code>arn:aws:budgets::AccountId:budget/budgetName</code>
class Budget {
  /// The name of a budget. The name must be unique within an account. The
  /// <code>:</code> and <code>\</code> characters, and the "/action/" substring,
  /// aren't allowed in <code>BudgetName</code>.
  final String budgetName;

  /// Specifies whether this budget tracks costs, usage, RI utilization, RI
  /// coverage, Savings Plans utilization, or Savings Plans coverage.
  final BudgetType budgetType;

  /// The length of time until a budget resets the actual and forecasted spend.
  final TimeUnit timeUnit;

  /// The parameters that determine the budget amount for an auto-adjusting
  /// budget.
  final AutoAdjustData? autoAdjustData;

  /// The total amount of cost, usage, RI utilization, RI coverage, Savings Plans
  /// utilization, or Savings Plans coverage that you want to track with your
  /// budget.
  ///
  /// <code>BudgetLimit</code> is required for cost or usage budgets, but optional
  /// for RI or Savings Plans utilization or coverage budgets. RI and Savings
  /// Plans utilization or coverage budgets default to <code>100</code>. This is
  /// the only valid value for RI or Savings Plans utilization or coverage
  /// budgets. You can't use <code>BudgetLimit</code> with
  /// <code>PlannedBudgetLimits</code> for <code>CreateBudget</code> and
  /// <code>UpdateBudget</code> actions.
  final Spend? budgetLimit;

  /// The actual and forecasted cost or usage that the budget tracks.
  final CalculatedSpend? calculatedSpend;

  /// The cost filters, such as <code>Region</code>, <code>Service</code>,
  /// <code>LinkedAccount</code>, <code>Tag</code>, or <code>CostCategory</code>,
  /// that are applied to a budget.
  ///
  /// Amazon Web Services Budgets supports the following services as a
  /// <code>Service</code> filter for RI budgets:
  ///
  /// <ul>
  /// <li>
  /// Amazon EC2
  /// </li>
  /// <li>
  /// Amazon Redshift
  /// </li>
  /// <li>
  /// Amazon Relational Database Service
  /// </li>
  /// <li>
  /// Amazon ElastiCache
  /// </li>
  /// <li>
  /// Amazon OpenSearch Service
  /// </li>
  /// </ul>
  final Map<String, List<String>>? costFilters;

  /// The types of costs that are included in this <code>COST</code> budget.
  ///
  /// <code>USAGE</code>, <code>RI_UTILIZATION</code>, <code>RI_COVERAGE</code>,
  /// <code>SAVINGS_PLANS_UTILIZATION</code>, and
  /// <code>SAVINGS_PLANS_COVERAGE</code> budgets do not have
  /// <code>CostTypes</code>.
  final CostTypes? costTypes;

  /// The last time that you updated this budget.
  final DateTime? lastUpdatedTime;

  /// A map containing multiple <code>BudgetLimit</code>, including current or
  /// future limits.
  ///
  /// <code>PlannedBudgetLimits</code> is available for cost or usage budget and
  /// supports both monthly and quarterly <code>TimeUnit</code>.
  ///
  /// For monthly budgets, provide 12 months of <code>PlannedBudgetLimits</code>
  /// values. This must start from the current month and include the next 11
  /// months. The <code>key</code> is the start of the month, <code>UTC</code> in
  /// epoch seconds.
  ///
  /// For quarterly budgets, provide four quarters of
  /// <code>PlannedBudgetLimits</code> value entries in standard calendar quarter
  /// increments. This must start from the current quarter and include the next
  /// three quarters. The <code>key</code> is the start of the quarter,
  /// <code>UTC</code> in epoch seconds.
  ///
  /// If the planned budget expires before 12 months for monthly or four quarters
  /// for quarterly, provide the <code>PlannedBudgetLimits</code> values only for
  /// the remaining periods.
  ///
  /// If the budget begins at a date in the future, provide
  /// <code>PlannedBudgetLimits</code> values from the start date of the budget.
  ///
  /// After all of the <code>BudgetLimit</code> values in
  /// <code>PlannedBudgetLimits</code> are used, the budget continues to use the
  /// last limit as the <code>BudgetLimit</code>. At that point, the planned
  /// budget provides the same experience as a fixed budget.
  ///
  /// <code>DescribeBudget</code> and <code>DescribeBudgets</code> response along
  /// with <code>PlannedBudgetLimits</code> also contain <code>BudgetLimit</code>
  /// representing the current month or quarter limit present in
  /// <code>PlannedBudgetLimits</code>. This only applies to budgets that are
  /// created with <code>PlannedBudgetLimits</code>. Budgets that are created
  /// without <code>PlannedBudgetLimits</code> only contain
  /// <code>BudgetLimit</code>. They don't contain
  /// <code>PlannedBudgetLimits</code>.
  final Map<String, Spend>? plannedBudgetLimits;

  /// The period of time that's covered by a budget. You setthe start date and end
  /// date. The start date must come before the end date. The end date must come
  /// before <code>06/15/87 00:00 UTC</code>.
  ///
  /// If you create your budget and don't specify a start date, Amazon Web
  /// Services defaults to the start of your chosen time period (DAILY, MONTHLY,
  /// QUARTERLY, or ANNUALLY). For example, if you created your budget on January
  /// 24, 2018, chose <code>DAILY</code>, and didn't set a start date, Amazon Web
  /// Services set your start date to <code>01/24/18 00:00 UTC</code>. If you
  /// chose <code>MONTHLY</code>, Amazon Web Services set your start date to
  /// <code>01/01/18 00:00 UTC</code>. If you didn't specify an end date, Amazon
  /// Web Services set your end date to <code>06/15/87 00:00 UTC</code>. The
  /// defaults are the same for the Billing and Cost Management console and the
  /// API.
  ///
  /// You can change either date with the <code>UpdateBudget</code> operation.
  ///
  /// After the end date, Amazon Web Services deletes the budget and all the
  /// associated notifications and subscribers.
  final TimePeriod? timePeriod;

  Budget({
    required this.budgetName,
    required this.budgetType,
    required this.timeUnit,
    this.autoAdjustData,
    this.budgetLimit,
    this.calculatedSpend,
    this.costFilters,
    this.costTypes,
    this.lastUpdatedTime,
    this.plannedBudgetLimits,
    this.timePeriod,
  });

  factory Budget.fromJson(Map<String, dynamic> json) {
    return Budget(
      budgetName: json['BudgetName'] as String,
      budgetType: (json['BudgetType'] as String).toBudgetType(),
      timeUnit: (json['TimeUnit'] as String).toTimeUnit(),
      autoAdjustData: json['AutoAdjustData'] != null
          ? AutoAdjustData.fromJson(
              json['AutoAdjustData'] as Map<String, dynamic>)
          : null,
      budgetLimit: json['BudgetLimit'] != null
          ? Spend.fromJson(json['BudgetLimit'] as Map<String, dynamic>)
          : null,
      calculatedSpend: json['CalculatedSpend'] != null
          ? CalculatedSpend.fromJson(
              json['CalculatedSpend'] as Map<String, dynamic>)
          : null,
      costFilters: (json['CostFilters'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(
              k, (e as List).whereNotNull().map((e) => e as String).toList())),
      costTypes: json['CostTypes'] != null
          ? CostTypes.fromJson(json['CostTypes'] as Map<String, dynamic>)
          : null,
      lastUpdatedTime: timeStampFromJson(json['LastUpdatedTime']),
      plannedBudgetLimits:
          (json['PlannedBudgetLimits'] as Map<String, dynamic>?)?.map(
              (k, e) => MapEntry(k, Spend.fromJson(e as Map<String, dynamic>))),
      timePeriod: json['TimePeriod'] != null
          ? TimePeriod.fromJson(json['TimePeriod'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final budgetName = this.budgetName;
    final budgetType = this.budgetType;
    final timeUnit = this.timeUnit;
    final autoAdjustData = this.autoAdjustData;
    final budgetLimit = this.budgetLimit;
    final calculatedSpend = this.calculatedSpend;
    final costFilters = this.costFilters;
    final costTypes = this.costTypes;
    final lastUpdatedTime = this.lastUpdatedTime;
    final plannedBudgetLimits = this.plannedBudgetLimits;
    final timePeriod = this.timePeriod;
    return {
      'BudgetName': budgetName,
      'BudgetType': budgetType.toValue(),
      'TimeUnit': timeUnit.toValue(),
      if (autoAdjustData != null) 'AutoAdjustData': autoAdjustData,
      if (budgetLimit != null) 'BudgetLimit': budgetLimit,
      if (calculatedSpend != null) 'CalculatedSpend': calculatedSpend,
      if (costFilters != null) 'CostFilters': costFilters,
      if (costTypes != null) 'CostTypes': costTypes,
      if (lastUpdatedTime != null)
        'LastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (plannedBudgetLimits != null)
        'PlannedBudgetLimits': plannedBudgetLimits,
      if (timePeriod != null) 'TimePeriod': timePeriod,
    };
  }
}

/// The budget name and associated notifications for an account.
class BudgetNotificationsForAccount {
  final String? budgetName;
  final List<Notification>? notifications;

  BudgetNotificationsForAccount({
    this.budgetName,
    this.notifications,
  });

  factory BudgetNotificationsForAccount.fromJson(Map<String, dynamic> json) {
    return BudgetNotificationsForAccount(
      budgetName: json['BudgetName'] as String?,
      notifications: (json['Notifications'] as List?)
          ?.whereNotNull()
          .map((e) => Notification.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final budgetName = this.budgetName;
    final notifications = this.notifications;
    return {
      if (budgetName != null) 'BudgetName': budgetName,
      if (notifications != null) 'Notifications': notifications,
    };
  }
}

/// A history of the state of a budget at the end of the budget's specified time
/// period.
class BudgetPerformanceHistory {
  final String? budgetName;
  final BudgetType? budgetType;

  /// A list of amounts of cost or usage that you created budgets for, which are
  /// compared to your actual costs or usage.
  final List<BudgetedAndActualAmounts>? budgetedAndActualAmountsList;

  /// The history of the cost filters for a budget during the specified time
  /// period.
  final Map<String, List<String>>? costFilters;

  /// The history of the cost types for a budget during the specified time period.
  final CostTypes? costTypes;
  final TimeUnit? timeUnit;

  BudgetPerformanceHistory({
    this.budgetName,
    this.budgetType,
    this.budgetedAndActualAmountsList,
    this.costFilters,
    this.costTypes,
    this.timeUnit,
  });

  factory BudgetPerformanceHistory.fromJson(Map<String, dynamic> json) {
    return BudgetPerformanceHistory(
      budgetName: json['BudgetName'] as String?,
      budgetType: (json['BudgetType'] as String?)?.toBudgetType(),
      budgetedAndActualAmountsList:
          (json['BudgetedAndActualAmountsList'] as List?)
              ?.whereNotNull()
              .map((e) =>
                  BudgetedAndActualAmounts.fromJson(e as Map<String, dynamic>))
              .toList(),
      costFilters: (json['CostFilters'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(
              k, (e as List).whereNotNull().map((e) => e as String).toList())),
      costTypes: json['CostTypes'] != null
          ? CostTypes.fromJson(json['CostTypes'] as Map<String, dynamic>)
          : null,
      timeUnit: (json['TimeUnit'] as String?)?.toTimeUnit(),
    );
  }

  Map<String, dynamic> toJson() {
    final budgetName = this.budgetName;
    final budgetType = this.budgetType;
    final budgetedAndActualAmountsList = this.budgetedAndActualAmountsList;
    final costFilters = this.costFilters;
    final costTypes = this.costTypes;
    final timeUnit = this.timeUnit;
    return {
      if (budgetName != null) 'BudgetName': budgetName,
      if (budgetType != null) 'BudgetType': budgetType.toValue(),
      if (budgetedAndActualAmountsList != null)
        'BudgetedAndActualAmountsList': budgetedAndActualAmountsList,
      if (costFilters != null) 'CostFilters': costFilters,
      if (costTypes != null) 'CostTypes': costTypes,
      if (timeUnit != null) 'TimeUnit': timeUnit.toValue(),
    };
  }
}

/// The type of a budget. It must be one of the following types:
///
/// <code>COST</code>, <code>USAGE</code>, <code>RI_UTILIZATION</code>,
/// <code>RI_COVERAGE</code>, <code>SAVINGS_PLANS_UTILIZATION</code>, or
/// <code>SAVINGS_PLANS_COVERAGE</code>.
enum BudgetType {
  usage,
  cost,
  riUtilization,
  riCoverage,
  savingsPlansUtilization,
  savingsPlansCoverage,
}

extension BudgetTypeValueExtension on BudgetType {
  String toValue() {
    switch (this) {
      case BudgetType.usage:
        return 'USAGE';
      case BudgetType.cost:
        return 'COST';
      case BudgetType.riUtilization:
        return 'RI_UTILIZATION';
      case BudgetType.riCoverage:
        return 'RI_COVERAGE';
      case BudgetType.savingsPlansUtilization:
        return 'SAVINGS_PLANS_UTILIZATION';
      case BudgetType.savingsPlansCoverage:
        return 'SAVINGS_PLANS_COVERAGE';
    }
  }
}

extension BudgetTypeFromString on String {
  BudgetType toBudgetType() {
    switch (this) {
      case 'USAGE':
        return BudgetType.usage;
      case 'COST':
        return BudgetType.cost;
      case 'RI_UTILIZATION':
        return BudgetType.riUtilization;
      case 'RI_COVERAGE':
        return BudgetType.riCoverage;
      case 'SAVINGS_PLANS_UTILIZATION':
        return BudgetType.savingsPlansUtilization;
      case 'SAVINGS_PLANS_COVERAGE':
        return BudgetType.savingsPlansCoverage;
    }
    throw Exception('$this is not known in enum BudgetType');
  }
}

/// The amount of cost or usage that you created the budget for, compared to
/// your actual costs or usage.
class BudgetedAndActualAmounts {
  /// Your actual costs or usage for a budget period.
  final Spend? actualAmount;

  /// The amount of cost or usage that you created the budget for.
  final Spend? budgetedAmount;

  /// The time period that's covered by this budget comparison.
  final TimePeriod? timePeriod;

  BudgetedAndActualAmounts({
    this.actualAmount,
    this.budgetedAmount,
    this.timePeriod,
  });

  factory BudgetedAndActualAmounts.fromJson(Map<String, dynamic> json) {
    return BudgetedAndActualAmounts(
      actualAmount: json['ActualAmount'] != null
          ? Spend.fromJson(json['ActualAmount'] as Map<String, dynamic>)
          : null,
      budgetedAmount: json['BudgetedAmount'] != null
          ? Spend.fromJson(json['BudgetedAmount'] as Map<String, dynamic>)
          : null,
      timePeriod: json['TimePeriod'] != null
          ? TimePeriod.fromJson(json['TimePeriod'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final actualAmount = this.actualAmount;
    final budgetedAmount = this.budgetedAmount;
    final timePeriod = this.timePeriod;
    return {
      if (actualAmount != null) 'ActualAmount': actualAmount,
      if (budgetedAmount != null) 'BudgetedAmount': budgetedAmount,
      if (timePeriod != null) 'TimePeriod': timePeriod,
    };
  }
}

/// The spend objects that are associated with this budget. The
/// <code>actualSpend</code> tracks how much you've used, cost, usage, RI units,
/// or Savings Plans units and the <code>forecastedSpend</code> tracks how much
/// that you're predicted to spend based on your historical usage profile.
///
/// For example, if it's the 20th of the month and you have spent
/// <code>50</code> dollars on Amazon EC2, your <code>actualSpend</code> is
/// <code>50 USD</code>, and your <code>forecastedSpend</code> is <code>75
/// USD</code>.
class CalculatedSpend {
  /// The amount of cost, usage, RI units, or Savings Plans units that you used.
  final Spend actualSpend;

  /// The amount of cost, usage, RI units, or Savings Plans units that you're
  /// forecasted to use.
  final Spend? forecastedSpend;

  CalculatedSpend({
    required this.actualSpend,
    this.forecastedSpend,
  });

  factory CalculatedSpend.fromJson(Map<String, dynamic> json) {
    return CalculatedSpend(
      actualSpend: Spend.fromJson(json['ActualSpend'] as Map<String, dynamic>),
      forecastedSpend: json['ForecastedSpend'] != null
          ? Spend.fromJson(json['ForecastedSpend'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final actualSpend = this.actualSpend;
    final forecastedSpend = this.forecastedSpend;
    return {
      'ActualSpend': actualSpend,
      if (forecastedSpend != null) 'ForecastedSpend': forecastedSpend,
    };
  }
}

/// The comparison operator of a notification. Currently, the service supports
/// the following operators:
///
/// <code>GREATER_THAN</code>, <code>LESS_THAN</code>, <code>EQUAL_TO</code>
enum ComparisonOperator {
  greaterThan,
  lessThan,
  equalTo,
}

extension ComparisonOperatorValueExtension on ComparisonOperator {
  String toValue() {
    switch (this) {
      case ComparisonOperator.greaterThan:
        return 'GREATER_THAN';
      case ComparisonOperator.lessThan:
        return 'LESS_THAN';
      case ComparisonOperator.equalTo:
        return 'EQUAL_TO';
    }
  }
}

extension ComparisonOperatorFromString on String {
  ComparisonOperator toComparisonOperator() {
    switch (this) {
      case 'GREATER_THAN':
        return ComparisonOperator.greaterThan;
      case 'LESS_THAN':
        return ComparisonOperator.lessThan;
      case 'EQUAL_TO':
        return ComparisonOperator.equalTo;
    }
    throw Exception('$this is not known in enum ComparisonOperator');
  }
}

/// The types of cost that are included in a <code>COST</code> budget, such as
/// tax and subscriptions.
///
/// <code>USAGE</code>, <code>RI_UTILIZATION</code>, <code>RI_COVERAGE</code>,
/// <code>SAVINGS_PLANS_UTILIZATION</code>, and
/// <code>SAVINGS_PLANS_COVERAGE</code> budgets don't have
/// <code>CostTypes</code>.
class CostTypes {
  /// Specifies whether a budget includes credits.
  ///
  /// The default value is <code>true</code>.
  final bool? includeCredit;

  /// Specifies whether a budget includes discounts.
  ///
  /// The default value is <code>true</code>.
  final bool? includeDiscount;

  /// Specifies whether a budget includes non-RI subscription costs.
  ///
  /// The default value is <code>true</code>.
  final bool? includeOtherSubscription;

  /// Specifies whether a budget includes recurring fees such as monthly RI fees.
  ///
  /// The default value is <code>true</code>.
  final bool? includeRecurring;

  /// Specifies whether a budget includes refunds.
  ///
  /// The default value is <code>true</code>.
  final bool? includeRefund;

  /// Specifies whether a budget includes subscriptions.
  ///
  /// The default value is <code>true</code>.
  final bool? includeSubscription;

  /// Specifies whether a budget includes support subscription fees.
  ///
  /// The default value is <code>true</code>.
  final bool? includeSupport;

  /// Specifies whether a budget includes taxes.
  ///
  /// The default value is <code>true</code>.
  final bool? includeTax;

  /// Specifies whether a budget includes upfront RI costs.
  ///
  /// The default value is <code>true</code>.
  final bool? includeUpfront;

  /// Specifies whether a budget uses the amortized rate.
  ///
  /// The default value is <code>false</code>.
  final bool? useAmortized;

  /// Specifies whether a budget uses a blended rate.
  ///
  /// The default value is <code>false</code>.
  final bool? useBlended;

  CostTypes({
    this.includeCredit,
    this.includeDiscount,
    this.includeOtherSubscription,
    this.includeRecurring,
    this.includeRefund,
    this.includeSubscription,
    this.includeSupport,
    this.includeTax,
    this.includeUpfront,
    this.useAmortized,
    this.useBlended,
  });

  factory CostTypes.fromJson(Map<String, dynamic> json) {
    return CostTypes(
      includeCredit: json['IncludeCredit'] as bool?,
      includeDiscount: json['IncludeDiscount'] as bool?,
      includeOtherSubscription: json['IncludeOtherSubscription'] as bool?,
      includeRecurring: json['IncludeRecurring'] as bool?,
      includeRefund: json['IncludeRefund'] as bool?,
      includeSubscription: json['IncludeSubscription'] as bool?,
      includeSupport: json['IncludeSupport'] as bool?,
      includeTax: json['IncludeTax'] as bool?,
      includeUpfront: json['IncludeUpfront'] as bool?,
      useAmortized: json['UseAmortized'] as bool?,
      useBlended: json['UseBlended'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final includeCredit = this.includeCredit;
    final includeDiscount = this.includeDiscount;
    final includeOtherSubscription = this.includeOtherSubscription;
    final includeRecurring = this.includeRecurring;
    final includeRefund = this.includeRefund;
    final includeSubscription = this.includeSubscription;
    final includeSupport = this.includeSupport;
    final includeTax = this.includeTax;
    final includeUpfront = this.includeUpfront;
    final useAmortized = this.useAmortized;
    final useBlended = this.useBlended;
    return {
      if (includeCredit != null) 'IncludeCredit': includeCredit,
      if (includeDiscount != null) 'IncludeDiscount': includeDiscount,
      if (includeOtherSubscription != null)
        'IncludeOtherSubscription': includeOtherSubscription,
      if (includeRecurring != null) 'IncludeRecurring': includeRecurring,
      if (includeRefund != null) 'IncludeRefund': includeRefund,
      if (includeSubscription != null)
        'IncludeSubscription': includeSubscription,
      if (includeSupport != null) 'IncludeSupport': includeSupport,
      if (includeTax != null) 'IncludeTax': includeTax,
      if (includeUpfront != null) 'IncludeUpfront': includeUpfront,
      if (useAmortized != null) 'UseAmortized': useAmortized,
      if (useBlended != null) 'UseBlended': useBlended,
    };
  }
}

class CreateBudgetActionResponse {
  final String accountId;

  /// A system-generated universally unique identifier (UUID) for the action.
  final String actionId;
  final String budgetName;

  CreateBudgetActionResponse({
    required this.accountId,
    required this.actionId,
    required this.budgetName,
  });

  factory CreateBudgetActionResponse.fromJson(Map<String, dynamic> json) {
    return CreateBudgetActionResponse(
      accountId: json['AccountId'] as String,
      actionId: json['ActionId'] as String,
      budgetName: json['BudgetName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final actionId = this.actionId;
    final budgetName = this.budgetName;
    return {
      'AccountId': accountId,
      'ActionId': actionId,
      'BudgetName': budgetName,
    };
  }
}

/// Response of CreateBudget
class CreateBudgetResponse {
  CreateBudgetResponse();

  factory CreateBudgetResponse.fromJson(Map<String, dynamic> _) {
    return CreateBudgetResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Response of CreateNotification
class CreateNotificationResponse {
  CreateNotificationResponse();

  factory CreateNotificationResponse.fromJson(Map<String, dynamic> _) {
    return CreateNotificationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Response of CreateSubscriber
class CreateSubscriberResponse {
  CreateSubscriberResponse();

  factory CreateSubscriberResponse.fromJson(Map<String, dynamic> _) {
    return CreateSubscriberResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Specifies all of the type-specific parameters.
class Definition {
  /// The Identity and Access Management (IAM) action definition details.
  final IamActionDefinition? iamActionDefinition;

  /// The service control policies (SCPs) action definition details.
  final ScpActionDefinition? scpActionDefinition;

  /// The Amazon Web Services Systems Manager (SSM) action definition details.
  final SsmActionDefinition? ssmActionDefinition;

  Definition({
    this.iamActionDefinition,
    this.scpActionDefinition,
    this.ssmActionDefinition,
  });

  factory Definition.fromJson(Map<String, dynamic> json) {
    return Definition(
      iamActionDefinition: json['IamActionDefinition'] != null
          ? IamActionDefinition.fromJson(
              json['IamActionDefinition'] as Map<String, dynamic>)
          : null,
      scpActionDefinition: json['ScpActionDefinition'] != null
          ? ScpActionDefinition.fromJson(
              json['ScpActionDefinition'] as Map<String, dynamic>)
          : null,
      ssmActionDefinition: json['SsmActionDefinition'] != null
          ? SsmActionDefinition.fromJson(
              json['SsmActionDefinition'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final iamActionDefinition = this.iamActionDefinition;
    final scpActionDefinition = this.scpActionDefinition;
    final ssmActionDefinition = this.ssmActionDefinition;
    return {
      if (iamActionDefinition != null)
        'IamActionDefinition': iamActionDefinition,
      if (scpActionDefinition != null)
        'ScpActionDefinition': scpActionDefinition,
      if (ssmActionDefinition != null)
        'SsmActionDefinition': ssmActionDefinition,
    };
  }
}

class DeleteBudgetActionResponse {
  final String accountId;
  final Action action;
  final String budgetName;

  DeleteBudgetActionResponse({
    required this.accountId,
    required this.action,
    required this.budgetName,
  });

  factory DeleteBudgetActionResponse.fromJson(Map<String, dynamic> json) {
    return DeleteBudgetActionResponse(
      accountId: json['AccountId'] as String,
      action: Action.fromJson(json['Action'] as Map<String, dynamic>),
      budgetName: json['BudgetName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final action = this.action;
    final budgetName = this.budgetName;
    return {
      'AccountId': accountId,
      'Action': action,
      'BudgetName': budgetName,
    };
  }
}

/// Response of DeleteBudget
class DeleteBudgetResponse {
  DeleteBudgetResponse();

  factory DeleteBudgetResponse.fromJson(Map<String, dynamic> _) {
    return DeleteBudgetResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Response of DeleteNotification
class DeleteNotificationResponse {
  DeleteNotificationResponse();

  factory DeleteNotificationResponse.fromJson(Map<String, dynamic> _) {
    return DeleteNotificationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Response of DeleteSubscriber
class DeleteSubscriberResponse {
  DeleteSubscriberResponse();

  factory DeleteSubscriberResponse.fromJson(Map<String, dynamic> _) {
    return DeleteSubscriberResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DescribeBudgetActionHistoriesResponse {
  /// The historical record of the budget action resource.
  final List<ActionHistory> actionHistories;
  final String? nextToken;

  DescribeBudgetActionHistoriesResponse({
    required this.actionHistories,
    this.nextToken,
  });

  factory DescribeBudgetActionHistoriesResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeBudgetActionHistoriesResponse(
      actionHistories: (json['ActionHistories'] as List)
          .whereNotNull()
          .map((e) => ActionHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final actionHistories = this.actionHistories;
    final nextToken = this.nextToken;
    return {
      'ActionHistories': actionHistories,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class DescribeBudgetActionResponse {
  final String accountId;

  /// A budget action resource.
  final Action action;
  final String budgetName;

  DescribeBudgetActionResponse({
    required this.accountId,
    required this.action,
    required this.budgetName,
  });

  factory DescribeBudgetActionResponse.fromJson(Map<String, dynamic> json) {
    return DescribeBudgetActionResponse(
      accountId: json['AccountId'] as String,
      action: Action.fromJson(json['Action'] as Map<String, dynamic>),
      budgetName: json['BudgetName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final action = this.action;
    final budgetName = this.budgetName;
    return {
      'AccountId': accountId,
      'Action': action,
      'BudgetName': budgetName,
    };
  }
}

class DescribeBudgetActionsForAccountResponse {
  /// A list of the budget action resources information.
  final List<Action> actions;
  final String? nextToken;

  DescribeBudgetActionsForAccountResponse({
    required this.actions,
    this.nextToken,
  });

  factory DescribeBudgetActionsForAccountResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeBudgetActionsForAccountResponse(
      actions: (json['Actions'] as List)
          .whereNotNull()
          .map((e) => Action.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final actions = this.actions;
    final nextToken = this.nextToken;
    return {
      'Actions': actions,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class DescribeBudgetActionsForBudgetResponse {
  /// A list of the budget action resources information.
  final List<Action> actions;
  final String? nextToken;

  DescribeBudgetActionsForBudgetResponse({
    required this.actions,
    this.nextToken,
  });

  factory DescribeBudgetActionsForBudgetResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeBudgetActionsForBudgetResponse(
      actions: (json['Actions'] as List)
          .whereNotNull()
          .map((e) => Action.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final actions = this.actions;
    final nextToken = this.nextToken;
    return {
      'Actions': actions,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class DescribeBudgetNotificationsForAccountResponse {
  /// A list of budget names and associated notifications for an account.
  final List<BudgetNotificationsForAccount>? budgetNotificationsForAccount;
  final String? nextToken;

  DescribeBudgetNotificationsForAccountResponse({
    this.budgetNotificationsForAccount,
    this.nextToken,
  });

  factory DescribeBudgetNotificationsForAccountResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeBudgetNotificationsForAccountResponse(
      budgetNotificationsForAccount: (json['BudgetNotificationsForAccount']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              BudgetNotificationsForAccount.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final budgetNotificationsForAccount = this.budgetNotificationsForAccount;
    final nextToken = this.nextToken;
    return {
      if (budgetNotificationsForAccount != null)
        'BudgetNotificationsForAccount': budgetNotificationsForAccount,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class DescribeBudgetPerformanceHistoryResponse {
  /// The history of how often the budget has gone into an <code>ALARM</code>
  /// state.
  ///
  /// For <code>DAILY</code> budgets, the history saves the state of the budget
  /// for the last 60 days. For <code>MONTHLY</code> budgets, the history saves
  /// the state of the budget for the current month plus the last 12 months. For
  /// <code>QUARTERLY</code> budgets, the history saves the state of the budget
  /// for the last four quarters.
  final BudgetPerformanceHistory? budgetPerformanceHistory;
  final String? nextToken;

  DescribeBudgetPerformanceHistoryResponse({
    this.budgetPerformanceHistory,
    this.nextToken,
  });

  factory DescribeBudgetPerformanceHistoryResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeBudgetPerformanceHistoryResponse(
      budgetPerformanceHistory: json['BudgetPerformanceHistory'] != null
          ? BudgetPerformanceHistory.fromJson(
              json['BudgetPerformanceHistory'] as Map<String, dynamic>)
          : null,
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final budgetPerformanceHistory = this.budgetPerformanceHistory;
    final nextToken = this.nextToken;
    return {
      if (budgetPerformanceHistory != null)
        'BudgetPerformanceHistory': budgetPerformanceHistory,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Response of DescribeBudget
class DescribeBudgetResponse {
  /// The description of the budget.
  final Budget? budget;

  DescribeBudgetResponse({
    this.budget,
  });

  factory DescribeBudgetResponse.fromJson(Map<String, dynamic> json) {
    return DescribeBudgetResponse(
      budget: json['Budget'] != null
          ? Budget.fromJson(json['Budget'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final budget = this.budget;
    return {
      if (budget != null) 'Budget': budget,
    };
  }
}

/// Response of DescribeBudgets
class DescribeBudgetsResponse {
  /// A list of budgets.
  final List<Budget>? budgets;

  /// The pagination token in the service response that indicates the next set of
  /// results that you can retrieve.
  final String? nextToken;

  DescribeBudgetsResponse({
    this.budgets,
    this.nextToken,
  });

  factory DescribeBudgetsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeBudgetsResponse(
      budgets: (json['Budgets'] as List?)
          ?.whereNotNull()
          .map((e) => Budget.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final budgets = this.budgets;
    final nextToken = this.nextToken;
    return {
      if (budgets != null) 'Budgets': budgets,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Response of GetNotificationsForBudget
class DescribeNotificationsForBudgetResponse {
  /// The pagination token in the service response that indicates the next set of
  /// results that you can retrieve.
  final String? nextToken;

  /// A list of notifications that are associated with a budget.
  final List<Notification>? notifications;

  DescribeNotificationsForBudgetResponse({
    this.nextToken,
    this.notifications,
  });

  factory DescribeNotificationsForBudgetResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeNotificationsForBudgetResponse(
      nextToken: json['NextToken'] as String?,
      notifications: (json['Notifications'] as List?)
          ?.whereNotNull()
          .map((e) => Notification.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final notifications = this.notifications;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (notifications != null) 'Notifications': notifications,
    };
  }
}

/// Response of DescribeSubscribersForNotification
class DescribeSubscribersForNotificationResponse {
  /// The pagination token in the service response that indicates the next set of
  /// results that you can retrieve.
  final String? nextToken;

  /// A list of subscribers that are associated with a notification.
  final List<Subscriber>? subscribers;

  DescribeSubscribersForNotificationResponse({
    this.nextToken,
    this.subscribers,
  });

  factory DescribeSubscribersForNotificationResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeSubscribersForNotificationResponse(
      nextToken: json['NextToken'] as String?,
      subscribers: (json['Subscribers'] as List?)
          ?.whereNotNull()
          .map((e) => Subscriber.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final subscribers = this.subscribers;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (subscribers != null) 'Subscribers': subscribers,
    };
  }
}

enum EventType {
  system,
  createAction,
  deleteAction,
  updateAction,
  executeAction,
}

extension EventTypeValueExtension on EventType {
  String toValue() {
    switch (this) {
      case EventType.system:
        return 'SYSTEM';
      case EventType.createAction:
        return 'CREATE_ACTION';
      case EventType.deleteAction:
        return 'DELETE_ACTION';
      case EventType.updateAction:
        return 'UPDATE_ACTION';
      case EventType.executeAction:
        return 'EXECUTE_ACTION';
    }
  }
}

extension EventTypeFromString on String {
  EventType toEventType() {
    switch (this) {
      case 'SYSTEM':
        return EventType.system;
      case 'CREATE_ACTION':
        return EventType.createAction;
      case 'DELETE_ACTION':
        return EventType.deleteAction;
      case 'UPDATE_ACTION':
        return EventType.updateAction;
      case 'EXECUTE_ACTION':
        return EventType.executeAction;
    }
    throw Exception('$this is not known in enum EventType');
  }
}

class ExecuteBudgetActionResponse {
  final String accountId;

  /// A system-generated universally unique identifier (UUID) for the action.
  final String actionId;
  final String budgetName;

  /// The type of execution.
  final ExecutionType executionType;

  ExecuteBudgetActionResponse({
    required this.accountId,
    required this.actionId,
    required this.budgetName,
    required this.executionType,
  });

  factory ExecuteBudgetActionResponse.fromJson(Map<String, dynamic> json) {
    return ExecuteBudgetActionResponse(
      accountId: json['AccountId'] as String,
      actionId: json['ActionId'] as String,
      budgetName: json['BudgetName'] as String,
      executionType: (json['ExecutionType'] as String).toExecutionType(),
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final actionId = this.actionId;
    final budgetName = this.budgetName;
    final executionType = this.executionType;
    return {
      'AccountId': accountId,
      'ActionId': actionId,
      'BudgetName': budgetName,
      'ExecutionType': executionType.toValue(),
    };
  }
}

enum ExecutionType {
  approveBudgetAction,
  retryBudgetAction,
  reverseBudgetAction,
  resetBudgetAction,
}

extension ExecutionTypeValueExtension on ExecutionType {
  String toValue() {
    switch (this) {
      case ExecutionType.approveBudgetAction:
        return 'APPROVE_BUDGET_ACTION';
      case ExecutionType.retryBudgetAction:
        return 'RETRY_BUDGET_ACTION';
      case ExecutionType.reverseBudgetAction:
        return 'REVERSE_BUDGET_ACTION';
      case ExecutionType.resetBudgetAction:
        return 'RESET_BUDGET_ACTION';
    }
  }
}

extension ExecutionTypeFromString on String {
  ExecutionType toExecutionType() {
    switch (this) {
      case 'APPROVE_BUDGET_ACTION':
        return ExecutionType.approveBudgetAction;
      case 'RETRY_BUDGET_ACTION':
        return ExecutionType.retryBudgetAction;
      case 'REVERSE_BUDGET_ACTION':
        return ExecutionType.reverseBudgetAction;
      case 'RESET_BUDGET_ACTION':
        return ExecutionType.resetBudgetAction;
    }
    throw Exception('$this is not known in enum ExecutionType');
  }
}

/// The parameters that define or describe the historical data that your
/// auto-adjusting budget is based on.
class HistoricalOptions {
  /// The number of budget periods included in the moving-average calculation that
  /// determines your auto-adjusted budget amount. The maximum value depends on
  /// the <code>TimeUnit</code> granularity of the budget:
  ///
  /// <ul>
  /// <li>
  /// For the <code>DAILY</code> granularity, the maximum value is
  /// <code>60</code>.
  /// </li>
  /// <li>
  /// For the <code>MONTHLY</code> granularity, the maximum value is
  /// <code>12</code>.
  /// </li>
  /// <li>
  /// For the <code>QUARTERLY</code> granularity, the maximum value is
  /// <code>4</code>.
  /// </li>
  /// <li>
  /// For the <code>ANNUALLY</code> granularity, the maximum value is
  /// <code>1</code>.
  /// </li>
  /// </ul>
  final int budgetAdjustmentPeriod;

  /// The integer that describes how many budget periods in your
  /// <code>BudgetAdjustmentPeriod</code> are included in the calculation of your
  /// current <code>BudgetLimit</code>. If the first budget period in your
  /// <code>BudgetAdjustmentPeriod</code> has no cost data, then that budget
  /// period isn’t included in the average that determines your budget limit.
  ///
  /// For example, if you set <code>BudgetAdjustmentPeriod</code> as
  /// <code>4</code> quarters, but your account had no cost data in the first
  /// quarter, then only the last three quarters are included in the calculation.
  /// In this scenario, <code>LookBackAvailablePeriods</code> returns
  /// <code>3</code>.
  ///
  /// You can’t set your own <code>LookBackAvailablePeriods</code>. The value is
  /// automatically calculated from the <code>BudgetAdjustmentPeriod</code> and
  /// your historical cost data.
  final int? lookBackAvailablePeriods;

  HistoricalOptions({
    required this.budgetAdjustmentPeriod,
    this.lookBackAvailablePeriods,
  });

  factory HistoricalOptions.fromJson(Map<String, dynamic> json) {
    return HistoricalOptions(
      budgetAdjustmentPeriod: json['BudgetAdjustmentPeriod'] as int,
      lookBackAvailablePeriods: json['LookBackAvailablePeriods'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final budgetAdjustmentPeriod = this.budgetAdjustmentPeriod;
    final lookBackAvailablePeriods = this.lookBackAvailablePeriods;
    return {
      'BudgetAdjustmentPeriod': budgetAdjustmentPeriod,
      if (lookBackAvailablePeriods != null)
        'LookBackAvailablePeriods': lookBackAvailablePeriods,
    };
  }
}

/// The Identity and Access Management (IAM) action definition details.
class IamActionDefinition {
  /// The Amazon Resource Name (ARN) of the policy to be attached.
  final String policyArn;

  /// A list of groups to be attached. There must be at least one group.
  final List<String>? groups;

  /// A list of roles to be attached. There must be at least one role.
  final List<String>? roles;

  /// A list of users to be attached. There must be at least one user.
  final List<String>? users;

  IamActionDefinition({
    required this.policyArn,
    this.groups,
    this.roles,
    this.users,
  });

  factory IamActionDefinition.fromJson(Map<String, dynamic> json) {
    return IamActionDefinition(
      policyArn: json['PolicyArn'] as String,
      groups: (json['Groups'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      roles: (json['Roles'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      users: (json['Users'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final policyArn = this.policyArn;
    final groups = this.groups;
    final roles = this.roles;
    final users = this.users;
    return {
      'PolicyArn': policyArn,
      if (groups != null) 'Groups': groups,
      if (roles != null) 'Roles': roles,
      if (users != null) 'Users': users,
    };
  }
}

class ListTagsForResourceResponse {
  /// The tags associated with the resource.
  final List<ResourceTag>? resourceTags;

  ListTagsForResourceResponse({
    this.resourceTags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      resourceTags: (json['ResourceTags'] as List?)
          ?.whereNotNull()
          .map((e) => ResourceTag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final resourceTags = this.resourceTags;
    return {
      if (resourceTags != null) 'ResourceTags': resourceTags,
    };
  }
}

/// A notification that's associated with a budget. A budget can have up to ten
/// notifications.
///
/// Each notification must have at least one subscriber. A notification can have
/// one SNS subscriber and up to 10 email subscribers, for a total of 11
/// subscribers.
///
/// For example, if you have a budget for 200 dollars and you want to be
/// notified when you go over 160 dollars, create a notification with the
/// following parameters:
///
/// <ul>
/// <li>
/// A notificationType of <code>ACTUAL</code>
/// </li>
/// <li>
/// A <code>thresholdType</code> of <code>PERCENTAGE</code>
/// </li>
/// <li>
/// A <code>comparisonOperator</code> of <code>GREATER_THAN</code>
/// </li>
/// <li>
/// A notification <code>threshold</code> of <code>80</code>
/// </li>
/// </ul>
class Notification {
  /// The comparison that's used for this notification.
  final ComparisonOperator comparisonOperator;

  /// Specifies whether the notification is for how much you have spent
  /// (<code>ACTUAL</code>) or for how much that you're forecasted to spend
  /// (<code>FORECASTED</code>).
  final NotificationType notificationType;

  /// The threshold that's associated with a notification. Thresholds are always a
  /// percentage, and many customers find value being alerted between 50% - 200%
  /// of the budgeted amount. The maximum limit for your threshold is 1,000,000%
  /// above the budgeted amount.
  final double threshold;

  /// Specifies whether this notification is in alarm. If a budget notification is
  /// in the <code>ALARM</code> state, you passed the set threshold for the
  /// budget.
  final NotificationState? notificationState;

  /// The type of threshold for a notification. For <code>ABSOLUTE_VALUE</code>
  /// thresholds, Amazon Web Services notifies you when you go over or are
  /// forecasted to go over your total cost threshold. For <code>PERCENTAGE</code>
  /// thresholds, Amazon Web Services notifies you when you go over or are
  /// forecasted to go over a certain percentage of your forecasted spend. For
  /// example, if you have a budget for 200 dollars and you have a
  /// <code>PERCENTAGE</code> threshold of 80%, Amazon Web Services notifies you
  /// when you go over 160 dollars.
  final ThresholdType? thresholdType;

  Notification({
    required this.comparisonOperator,
    required this.notificationType,
    required this.threshold,
    this.notificationState,
    this.thresholdType,
  });

  factory Notification.fromJson(Map<String, dynamic> json) {
    return Notification(
      comparisonOperator:
          (json['ComparisonOperator'] as String).toComparisonOperator(),
      notificationType:
          (json['NotificationType'] as String).toNotificationType(),
      threshold: json['Threshold'] as double,
      notificationState:
          (json['NotificationState'] as String?)?.toNotificationState(),
      thresholdType: (json['ThresholdType'] as String?)?.toThresholdType(),
    );
  }

  Map<String, dynamic> toJson() {
    final comparisonOperator = this.comparisonOperator;
    final notificationType = this.notificationType;
    final threshold = this.threshold;
    final notificationState = this.notificationState;
    final thresholdType = this.thresholdType;
    return {
      'ComparisonOperator': comparisonOperator.toValue(),
      'NotificationType': notificationType.toValue(),
      'Threshold': threshold,
      if (notificationState != null)
        'NotificationState': notificationState.toValue(),
      if (thresholdType != null) 'ThresholdType': thresholdType.toValue(),
    };
  }
}

enum NotificationState {
  ok,
  alarm,
}

extension NotificationStateValueExtension on NotificationState {
  String toValue() {
    switch (this) {
      case NotificationState.ok:
        return 'OK';
      case NotificationState.alarm:
        return 'ALARM';
    }
  }
}

extension NotificationStateFromString on String {
  NotificationState toNotificationState() {
    switch (this) {
      case 'OK':
        return NotificationState.ok;
      case 'ALARM':
        return NotificationState.alarm;
    }
    throw Exception('$this is not known in enum NotificationState');
  }
}

/// The type of a notification. It must be ACTUAL or FORECASTED.
enum NotificationType {
  actual,
  forecasted,
}

extension NotificationTypeValueExtension on NotificationType {
  String toValue() {
    switch (this) {
      case NotificationType.actual:
        return 'ACTUAL';
      case NotificationType.forecasted:
        return 'FORECASTED';
    }
  }
}

extension NotificationTypeFromString on String {
  NotificationType toNotificationType() {
    switch (this) {
      case 'ACTUAL':
        return NotificationType.actual;
      case 'FORECASTED':
        return NotificationType.forecasted;
    }
    throw Exception('$this is not known in enum NotificationType');
  }
}

/// A notification with subscribers. A notification can have one SNS subscriber
/// and up to 10 email subscribers, for a total of 11 subscribers.
class NotificationWithSubscribers {
  /// The notification that's associated with a budget.
  final Notification notification;

  /// A list of subscribers who are subscribed to this notification.
  final List<Subscriber> subscribers;

  NotificationWithSubscribers({
    required this.notification,
    required this.subscribers,
  });

  Map<String, dynamic> toJson() {
    final notification = this.notification;
    final subscribers = this.subscribers;
    return {
      'Notification': notification,
      'Subscribers': subscribers,
    };
  }
}

/// The tag structure that contains a tag key and value.
class ResourceTag {
  /// The key that's associated with the tag.
  final String key;

  /// The value that's associated with the tag.
  final String value;

  ResourceTag({
    required this.key,
    required this.value,
  });

  factory ResourceTag.fromJson(Map<String, dynamic> json) {
    return ResourceTag(
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

/// The service control policies (SCP) action definition details.
class ScpActionDefinition {
  /// The policy ID attached.
  final String policyId;

  /// A list of target IDs.
  final List<String> targetIds;

  ScpActionDefinition({
    required this.policyId,
    required this.targetIds,
  });

  factory ScpActionDefinition.fromJson(Map<String, dynamic> json) {
    return ScpActionDefinition(
      policyId: json['PolicyId'] as String,
      targetIds: (json['TargetIds'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final policyId = this.policyId;
    final targetIds = this.targetIds;
    return {
      'PolicyId': policyId,
      'TargetIds': targetIds,
    };
  }
}

/// The amount of cost or usage that's measured for a budget.
///
/// <i>Cost example:</i> A <code>Spend</code> for <code>3 USD</code> of costs
/// has the following parameters:
///
/// <ul>
/// <li>
/// An <code>Amount</code> of <code>3</code>
/// </li>
/// <li>
/// A <code>Unit</code> of <code>USD</code>
/// </li>
/// </ul>
/// <i>Usage example:</i> A <code>Spend</code> for <code>3 GB</code> of S3 usage
/// has the following parameters:
///
/// <ul>
/// <li>
/// An <code>Amount</code> of <code>3</code>
/// </li>
/// <li>
/// A <code>Unit</code> of <code>GB</code>
/// </li>
/// </ul>
class Spend {
  /// The cost or usage amount that's associated with a budget forecast, actual
  /// spend, or budget threshold.
  final String amount;

  /// The unit of measurement that's used for the budget forecast, actual spend,
  /// or budget threshold.
  final String unit;

  Spend({
    required this.amount,
    required this.unit,
  });

  factory Spend.fromJson(Map<String, dynamic> json) {
    return Spend(
      amount: json['Amount'] as String,
      unit: json['Unit'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final amount = this.amount;
    final unit = this.unit;
    return {
      'Amount': amount,
      'Unit': unit,
    };
  }
}

/// The Amazon Web Services Systems Manager (SSM) action definition details.
class SsmActionDefinition {
  /// The action subType.
  final ActionSubType actionSubType;

  /// The EC2 and RDS instance IDs.
  final List<String> instanceIds;

  /// The Region to run the SSM document.
  final String region;

  SsmActionDefinition({
    required this.actionSubType,
    required this.instanceIds,
    required this.region,
  });

  factory SsmActionDefinition.fromJson(Map<String, dynamic> json) {
    return SsmActionDefinition(
      actionSubType: (json['ActionSubType'] as String).toActionSubType(),
      instanceIds: (json['InstanceIds'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      region: json['Region'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final actionSubType = this.actionSubType;
    final instanceIds = this.instanceIds;
    final region = this.region;
    return {
      'ActionSubType': actionSubType.toValue(),
      'InstanceIds': instanceIds,
      'Region': region,
    };
  }
}

/// The subscriber to a budget notification. The subscriber consists of a
/// subscription type and either an Amazon SNS topic or an email address.
///
/// For example, an email subscriber has the following parameters:
///
/// <ul>
/// <li>
/// A <code>subscriptionType</code> of <code>EMAIL</code>
/// </li>
/// <li>
/// An <code>address</code> of <code>example@example.com</code>
/// </li>
/// </ul>
class Subscriber {
  /// The address that Amazon Web Services sends budget notifications to, either
  /// an SNS topic or an email.
  ///
  /// When you create a subscriber, the value of <code>Address</code> can't
  /// contain line breaks.
  final String address;

  /// The type of notification that Amazon Web Services sends to a subscriber.
  final SubscriptionType subscriptionType;

  Subscriber({
    required this.address,
    required this.subscriptionType,
  });

  factory Subscriber.fromJson(Map<String, dynamic> json) {
    return Subscriber(
      address: json['Address'] as String,
      subscriptionType:
          (json['SubscriptionType'] as String).toSubscriptionType(),
    );
  }

  Map<String, dynamic> toJson() {
    final address = this.address;
    final subscriptionType = this.subscriptionType;
    return {
      'Address': address,
      'SubscriptionType': subscriptionType.toValue(),
    };
  }
}

/// The subscription type of the subscriber. It can be SMS or EMAIL.
enum SubscriptionType {
  sns,
  email,
}

extension SubscriptionTypeValueExtension on SubscriptionType {
  String toValue() {
    switch (this) {
      case SubscriptionType.sns:
        return 'SNS';
      case SubscriptionType.email:
        return 'EMAIL';
    }
  }
}

extension SubscriptionTypeFromString on String {
  SubscriptionType toSubscriptionType() {
    switch (this) {
      case 'SNS':
        return SubscriptionType.sns;
      case 'EMAIL':
        return SubscriptionType.email;
    }
    throw Exception('$this is not known in enum SubscriptionType');
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

/// The type of threshold for a notification.
enum ThresholdType {
  percentage,
  absoluteValue,
}

extension ThresholdTypeValueExtension on ThresholdType {
  String toValue() {
    switch (this) {
      case ThresholdType.percentage:
        return 'PERCENTAGE';
      case ThresholdType.absoluteValue:
        return 'ABSOLUTE_VALUE';
    }
  }
}

extension ThresholdTypeFromString on String {
  ThresholdType toThresholdType() {
    switch (this) {
      case 'PERCENTAGE':
        return ThresholdType.percentage;
      case 'ABSOLUTE_VALUE':
        return ThresholdType.absoluteValue;
    }
    throw Exception('$this is not known in enum ThresholdType');
  }
}

/// The period of time that's covered by a budget. The period has a start date
/// and an end date. The start date must come before the end date. There are no
/// restrictions on the end date.
class TimePeriod {
  /// The end date for a budget. If you didn't specify an end date, Amazon Web
  /// Services set your end date to <code>06/15/87 00:00 UTC</code>. The defaults
  /// are the same for the Billing and Cost Management console and the API.
  ///
  /// After the end date, Amazon Web Services deletes the budget and all the
  /// associated notifications and subscribers. You can change your end date with
  /// the <code>UpdateBudget</code> operation.
  final DateTime? end;

  /// The start date for a budget. If you created your budget and didn't specify a
  /// start date, Amazon Web Services defaults to the start of your chosen time
  /// period (DAILY, MONTHLY, QUARTERLY, or ANNUALLY). For example, if you created
  /// your budget on January 24, 2018, chose <code>DAILY</code>, and didn't set a
  /// start date, Amazon Web Services set your start date to <code>01/24/18 00:00
  /// UTC</code>. If you chose <code>MONTHLY</code>, Amazon Web Services set your
  /// start date to <code>01/01/18 00:00 UTC</code>. The defaults are the same for
  /// the Billing and Cost Management console and the API.
  ///
  /// You can change your start date with the <code>UpdateBudget</code> operation.
  final DateTime? start;

  TimePeriod({
    this.end,
    this.start,
  });

  factory TimePeriod.fromJson(Map<String, dynamic> json) {
    return TimePeriod(
      end: timeStampFromJson(json['End']),
      start: timeStampFromJson(json['Start']),
    );
  }

  Map<String, dynamic> toJson() {
    final end = this.end;
    final start = this.start;
    return {
      if (end != null) 'End': unixTimestampToJson(end),
      if (start != null) 'Start': unixTimestampToJson(start),
    };
  }
}

/// The time unit of the budget, such as MONTHLY or QUARTERLY.
enum TimeUnit {
  daily,
  monthly,
  quarterly,
  annually,
}

extension TimeUnitValueExtension on TimeUnit {
  String toValue() {
    switch (this) {
      case TimeUnit.daily:
        return 'DAILY';
      case TimeUnit.monthly:
        return 'MONTHLY';
      case TimeUnit.quarterly:
        return 'QUARTERLY';
      case TimeUnit.annually:
        return 'ANNUALLY';
    }
  }
}

extension TimeUnitFromString on String {
  TimeUnit toTimeUnit() {
    switch (this) {
      case 'DAILY':
        return TimeUnit.daily;
      case 'MONTHLY':
        return TimeUnit.monthly;
      case 'QUARTERLY':
        return TimeUnit.quarterly;
      case 'ANNUALLY':
        return TimeUnit.annually;
    }
    throw Exception('$this is not known in enum TimeUnit');
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

class UpdateBudgetActionResponse {
  final String accountId;
  final String budgetName;

  /// The updated action resource information.
  final Action newAction;

  /// The previous action resource information.
  final Action oldAction;

  UpdateBudgetActionResponse({
    required this.accountId,
    required this.budgetName,
    required this.newAction,
    required this.oldAction,
  });

  factory UpdateBudgetActionResponse.fromJson(Map<String, dynamic> json) {
    return UpdateBudgetActionResponse(
      accountId: json['AccountId'] as String,
      budgetName: json['BudgetName'] as String,
      newAction: Action.fromJson(json['NewAction'] as Map<String, dynamic>),
      oldAction: Action.fromJson(json['OldAction'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final budgetName = this.budgetName;
    final newAction = this.newAction;
    final oldAction = this.oldAction;
    return {
      'AccountId': accountId,
      'BudgetName': budgetName,
      'NewAction': newAction,
      'OldAction': oldAction,
    };
  }
}

/// Response of UpdateBudget
class UpdateBudgetResponse {
  UpdateBudgetResponse();

  factory UpdateBudgetResponse.fromJson(Map<String, dynamic> _) {
    return UpdateBudgetResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Response of UpdateNotification
class UpdateNotificationResponse {
  UpdateNotificationResponse();

  factory UpdateNotificationResponse.fromJson(Map<String, dynamic> _) {
    return UpdateNotificationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Response of UpdateSubscriber
class UpdateSubscriberResponse {
  UpdateSubscriberResponse();

  factory UpdateSubscriberResponse.fromJson(Map<String, dynamic> _) {
    return UpdateSubscriberResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class CreationLimitExceededException extends _s.GenericAwsException {
  CreationLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'CreationLimitExceededException',
            message: message);
}

class DuplicateRecordException extends _s.GenericAwsException {
  DuplicateRecordException({String? type, String? message})
      : super(type: type, code: 'DuplicateRecordException', message: message);
}

class ExpiredNextTokenException extends _s.GenericAwsException {
  ExpiredNextTokenException({String? type, String? message})
      : super(type: type, code: 'ExpiredNextTokenException', message: message);
}

class InternalErrorException extends _s.GenericAwsException {
  InternalErrorException({String? type, String? message})
      : super(type: type, code: 'InternalErrorException', message: message);
}

class InvalidNextTokenException extends _s.GenericAwsException {
  InvalidNextTokenException({String? type, String? message})
      : super(type: type, code: 'InvalidNextTokenException', message: message);
}

class InvalidParameterException extends _s.GenericAwsException {
  InvalidParameterException({String? type, String? message})
      : super(type: type, code: 'InvalidParameterException', message: message);
}

class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String? type, String? message})
      : super(type: type, code: 'NotFoundException', message: message);
}

class ResourceLockedException extends _s.GenericAwsException {
  ResourceLockedException({String? type, String? message})
      : super(type: type, code: 'ResourceLockedException', message: message);
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

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'CreationLimitExceededException': (type, message) =>
      CreationLimitExceededException(type: type, message: message),
  'DuplicateRecordException': (type, message) =>
      DuplicateRecordException(type: type, message: message),
  'ExpiredNextTokenException': (type, message) =>
      ExpiredNextTokenException(type: type, message: message),
  'InternalErrorException': (type, message) =>
      InternalErrorException(type: type, message: message),
  'InvalidNextTokenException': (type, message) =>
      InvalidNextTokenException(type: type, message: message),
  'InvalidParameterException': (type, message) =>
      InvalidParameterException(type: type, message: message),
  'NotFoundException': (type, message) =>
      NotFoundException(type: type, message: message),
  'ResourceLockedException': (type, message) =>
      ResourceLockedException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
};
