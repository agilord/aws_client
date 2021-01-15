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

part '2016-10-20.g.dart';

/// The AWS Budgets API enables you to use AWS Budgets to plan your service
/// usage, service costs, and instance reservations. The API reference provides
/// descriptions, syntax, and usage examples for each of the actions and data
/// types for AWS Budgets.
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
/// Your current estimated charges from AWS, and how much your predicted usage
/// will accrue in charges by the end of the month
/// </li>
/// <li>
/// How much of your budget has been used
/// </li>
/// </ul>
/// AWS updates your budget status several times a day. Budgets track your
/// unblended costs, subscriptions, refunds, and RIs. You can create the
/// following types of budgets:
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
/// The AWS Budgets API provides the following endpoint:
///
/// <ul>
/// <li>
/// https://budgets.amazonaws.com
/// </li>
/// </ul>
/// For information about costs that are associated with the AWS Budgets API,
/// see <a href="https://aws.amazon.com/aws-cost-management/pricing/">AWS Cost
/// Management Pricing</a>.
class Budgets {
  final _s.JsonProtocol _protocol;
  Budgets({
    String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'budgets',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

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
  /// and subscribers in your <code>CreateBudget</code> call, AWS creates the
  /// notifications and subscribers for you.
  Future<void> createBudget({
    @_s.required String accountId,
    @_s.required Budget budget,
    List<NotificationWithSubscribers> notificationsWithSubscribers,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''\d{12}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(budget, 'budget');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSBudgetServiceGateway.CreateBudget'
    };
    final jsonResponse = await _protocol.send(
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
      },
    );

    return CreateBudgetResponse.fromJson(jsonResponse.body);
  }

  /// Creates a budget action.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InternalErrorException].
  /// May throw [CreationLimitExceededException].
  /// May throw [DuplicateRecordException].
  /// May throw [NotFoundException].
  /// May throw [AccessDeniedException].
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
  Future<CreateBudgetActionResponse> createBudgetAction({
    @_s.required String accountId,
    @_s.required ActionThreshold actionThreshold,
    @_s.required ActionType actionType,
    @_s.required ApprovalModel approvalModel,
    @_s.required String budgetName,
    @_s.required Definition definition,
    @_s.required String executionRoleArn,
    @_s.required NotificationType notificationType,
    @_s.required List<Subscriber> subscribers,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''\d{12}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(actionThreshold, 'actionThreshold');
    ArgumentError.checkNotNull(actionType, 'actionType');
    ArgumentError.checkNotNull(approvalModel, 'approvalModel');
    ArgumentError.checkNotNull(budgetName, 'budgetName');
    _s.validateStringLength(
      'budgetName',
      budgetName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'budgetName',
      budgetName,
      r'''[^:\\]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(definition, 'definition');
    ArgumentError.checkNotNull(executionRoleArn, 'executionRoleArn');
    _s.validateStringLength(
      'executionRoleArn',
      executionRoleArn,
      32,
      618,
      isRequired: true,
    );
    _s.validateStringPattern(
      'executionRoleArn',
      executionRoleArn,
      r'''^arn:(aws|aws-cn|aws-us-gov|us-iso-east-1|us-isob-east-1):iam::\d{12}:role(\u002F[\u0021-\u007F]+\u002F|\u002F)[\w+=,.@-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(notificationType, 'notificationType');
    ArgumentError.checkNotNull(subscribers, 'subscribers');
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
        'ActionType': actionType?.toValue() ?? '',
        'ApprovalModel': approvalModel?.toValue() ?? '',
        'BudgetName': budgetName,
        'Definition': definition,
        'ExecutionRoleArn': executionRoleArn,
        'NotificationType': notificationType?.toValue() ?? '',
        'Subscribers': subscribers,
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
  ///
  /// Parameter [accountId] :
  /// The <code>accountId</code> that is associated with the budget that you
  /// want to create a notification for.
  ///
  /// Parameter [budgetName] :
  /// The name of the budget that you want AWS to notify you about. Budget names
  /// must be unique within an account.
  ///
  /// Parameter [notification] :
  /// The notification that you want to create.
  ///
  /// Parameter [subscribers] :
  /// A list of subscribers that you want to associate with the notification.
  /// Each notification can have one SNS subscriber and up to 10 email
  /// subscribers.
  Future<void> createNotification({
    @_s.required String accountId,
    @_s.required String budgetName,
    @_s.required Notification notification,
    @_s.required List<Subscriber> subscribers,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''\d{12}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(budgetName, 'budgetName');
    _s.validateStringLength(
      'budgetName',
      budgetName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'budgetName',
      budgetName,
      r'''[^:\\]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(notification, 'notification');
    ArgumentError.checkNotNull(subscribers, 'subscribers');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSBudgetServiceGateway.CreateNotification'
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
        'Subscribers': subscribers,
      },
    );

    return CreateNotificationResponse.fromJson(jsonResponse.body);
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
    @_s.required String accountId,
    @_s.required String budgetName,
    @_s.required Notification notification,
    @_s.required Subscriber subscriber,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''\d{12}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(budgetName, 'budgetName');
    _s.validateStringLength(
      'budgetName',
      budgetName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'budgetName',
      budgetName,
      r'''[^:\\]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(notification, 'notification');
    ArgumentError.checkNotNull(subscriber, 'subscriber');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSBudgetServiceGateway.CreateSubscriber'
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
        'Subscriber': subscriber,
      },
    );

    return CreateSubscriberResponse.fromJson(jsonResponse.body);
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
  ///
  /// Parameter [accountId] :
  /// The <code>accountId</code> that is associated with the budget that you
  /// want to delete.
  ///
  /// Parameter [budgetName] :
  /// The name of the budget that you want to delete.
  Future<void> deleteBudget({
    @_s.required String accountId,
    @_s.required String budgetName,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''\d{12}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(budgetName, 'budgetName');
    _s.validateStringLength(
      'budgetName',
      budgetName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'budgetName',
      budgetName,
      r'''[^:\\]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSBudgetServiceGateway.DeleteBudget'
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

    return DeleteBudgetResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a budget action.
  ///
  /// May throw [InternalErrorException].
  /// May throw [InvalidParameterException].
  /// May throw [NotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceLockedException].
  ///
  /// Parameter [actionId] :
  /// A system-generated universally unique identifier (UUID) for the action.
  Future<DeleteBudgetActionResponse> deleteBudgetAction({
    @_s.required String accountId,
    @_s.required String actionId,
    @_s.required String budgetName,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''\d{12}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(actionId, 'actionId');
    _s.validateStringLength(
      'actionId',
      actionId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'actionId',
      actionId,
      r'''^[a-fA-F0-9]{8}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(budgetName, 'budgetName');
    _s.validateStringLength(
      'budgetName',
      budgetName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'budgetName',
      budgetName,
      r'''[^:\\]+''',
      isRequired: true,
    );
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
    @_s.required String accountId,
    @_s.required String budgetName,
    @_s.required Notification notification,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''\d{12}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(budgetName, 'budgetName');
    _s.validateStringLength(
      'budgetName',
      budgetName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'budgetName',
      budgetName,
      r'''[^:\\]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(notification, 'notification');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSBudgetServiceGateway.DeleteNotification'
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
      },
    );

    return DeleteNotificationResponse.fromJson(jsonResponse.body);
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
    @_s.required String accountId,
    @_s.required String budgetName,
    @_s.required Notification notification,
    @_s.required Subscriber subscriber,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''\d{12}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(budgetName, 'budgetName');
    _s.validateStringLength(
      'budgetName',
      budgetName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'budgetName',
      budgetName,
      r'''[^:\\]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(notification, 'notification');
    ArgumentError.checkNotNull(subscriber, 'subscriber');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSBudgetServiceGateway.DeleteSubscriber'
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
        'Subscriber': subscriber,
      },
    );

    return DeleteSubscriberResponse.fromJson(jsonResponse.body);
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
  ///
  /// Parameter [accountId] :
  /// The <code>accountId</code> that is associated with the budget that you
  /// want a description of.
  ///
  /// Parameter [budgetName] :
  /// The name of the budget that you want a description of.
  Future<DescribeBudgetResponse> describeBudget({
    @_s.required String accountId,
    @_s.required String budgetName,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''\d{12}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(budgetName, 'budgetName');
    _s.validateStringLength(
      'budgetName',
      budgetName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'budgetName',
      budgetName,
      r'''[^:\\]+''',
      isRequired: true,
    );
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
  ///
  /// Parameter [actionId] :
  /// A system-generated universally unique identifier (UUID) for the action.
  Future<DescribeBudgetActionResponse> describeBudgetAction({
    @_s.required String accountId,
    @_s.required String actionId,
    @_s.required String budgetName,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''\d{12}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(actionId, 'actionId');
    _s.validateStringLength(
      'actionId',
      actionId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'actionId',
      actionId,
      r'''^[a-fA-F0-9]{8}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(budgetName, 'budgetName');
    _s.validateStringLength(
      'budgetName',
      budgetName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'budgetName',
      budgetName,
      r'''[^:\\]+''',
      isRequired: true,
    );
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
  ///
  /// Parameter [actionId] :
  /// A system-generated universally unique identifier (UUID) for the action.
  Future<DescribeBudgetActionHistoriesResponse> describeBudgetActionHistories({
    @_s.required String accountId,
    @_s.required String actionId,
    @_s.required String budgetName,
    int maxResults,
    String nextToken,
    TimePeriod timePeriod,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''\d{12}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(actionId, 'actionId');
    _s.validateStringLength(
      'actionId',
      actionId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'actionId',
      actionId,
      r'''^[a-fA-F0-9]{8}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(budgetName, 'budgetName');
    _s.validateStringLength(
      'budgetName',
      budgetName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'budgetName',
      budgetName,
      r'''[^:\\]+''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      2147483647,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''.*''',
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
  Future<DescribeBudgetActionsForAccountResponse>
      describeBudgetActionsForAccount({
    @_s.required String accountId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''\d{12}''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      2147483647,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''.*''',
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
  Future<DescribeBudgetActionsForBudgetResponse>
      describeBudgetActionsForBudget({
    @_s.required String accountId,
    @_s.required String budgetName,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''\d{12}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(budgetName, 'budgetName');
    _s.validateStringLength(
      'budgetName',
      budgetName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'budgetName',
      budgetName,
      r'''[^:\\]+''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      2147483647,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''.*''',
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
  ///
  /// Parameter [timePeriod] :
  /// Retrieves how often the budget went into an <code>ALARM</code> state for
  /// the specified time period.
  Future<DescribeBudgetPerformanceHistoryResponse>
      describeBudgetPerformanceHistory({
    @_s.required String accountId,
    @_s.required String budgetName,
    int maxResults,
    String nextToken,
    TimePeriod timePeriod,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''\d{12}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(budgetName, 'budgetName');
    _s.validateStringLength(
      'budgetName',
      budgetName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'budgetName',
      budgetName,
      r'''[^:\\]+''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      2147483647,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''.*''',
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
  ///
  /// Parameter [accountId] :
  /// The <code>accountId</code> that is associated with the budgets that you
  /// want descriptions of.
  ///
  /// Parameter [maxResults] :
  /// An optional integer that represents how many entries a paginated response
  /// contains. The maximum is 100.
  ///
  /// Parameter [nextToken] :
  /// The pagination token that you include in your request to indicate the next
  /// set of results that you want to retrieve.
  Future<DescribeBudgetsResponse> describeBudgets({
    @_s.required String accountId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''\d{12}''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      2147483647,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''.*''',
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
  /// contains. The maximum is 100.
  ///
  /// Parameter [nextToken] :
  /// The pagination token that you include in your request to indicate the next
  /// set of results that you want to retrieve.
  Future<DescribeNotificationsForBudgetResponse>
      describeNotificationsForBudget({
    @_s.required String accountId,
    @_s.required String budgetName,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''\d{12}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(budgetName, 'budgetName');
    _s.validateStringLength(
      'budgetName',
      budgetName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'budgetName',
      budgetName,
      r'''[^:\\]+''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      2147483647,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''.*''',
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
  /// contains. The maximum is 100.
  ///
  /// Parameter [nextToken] :
  /// The pagination token that you include in your request to indicate the next
  /// set of results that you want to retrieve.
  Future<DescribeSubscribersForNotificationResponse>
      describeSubscribersForNotification({
    @_s.required String accountId,
    @_s.required String budgetName,
    @_s.required Notification notification,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''\d{12}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(budgetName, 'budgetName');
    _s.validateStringLength(
      'budgetName',
      budgetName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'budgetName',
      budgetName,
      r'''[^:\\]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(notification, 'notification');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      2147483647,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''.*''',
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
  ///
  /// Parameter [actionId] :
  /// A system-generated universally unique identifier (UUID) for the action.
  ///
  /// Parameter [executionType] :
  /// The type of execution.
  Future<ExecuteBudgetActionResponse> executeBudgetAction({
    @_s.required String accountId,
    @_s.required String actionId,
    @_s.required String budgetName,
    @_s.required ExecutionType executionType,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''\d{12}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(actionId, 'actionId');
    _s.validateStringLength(
      'actionId',
      actionId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'actionId',
      actionId,
      r'''^[a-fA-F0-9]{8}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(budgetName, 'budgetName');
    _s.validateStringLength(
      'budgetName',
      budgetName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'budgetName',
      budgetName,
      r'''[^:\\]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(executionType, 'executionType');
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
        'ExecutionType': executionType?.toValue() ?? '',
      },
    );

    return ExecuteBudgetActionResponse.fromJson(jsonResponse.body);
  }

  /// Updates a budget. You can change every part of a budget except for the
  /// <code>budgetName</code> and the <code>calculatedSpend</code>. When you
  /// modify a budget, the <code>calculatedSpend</code> drops to zero until AWS
  /// has new usage data to use for forecasting.
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
  ///
  /// Parameter [accountId] :
  /// The <code>accountId</code> that is associated with the budget that you
  /// want to update.
  ///
  /// Parameter [newBudget] :
  /// The budget that you want to update your budget to.
  Future<void> updateBudget({
    @_s.required String accountId,
    @_s.required Budget newBudget,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''\d{12}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(newBudget, 'newBudget');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSBudgetServiceGateway.UpdateBudget'
    };
    final jsonResponse = await _protocol.send(
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

    return UpdateBudgetResponse.fromJson(jsonResponse.body);
  }

  /// Updates a budget action.
  ///
  /// May throw [InternalErrorException].
  /// May throw [InvalidParameterException].
  /// May throw [NotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceLockedException].
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
    @_s.required String accountId,
    @_s.required String actionId,
    @_s.required String budgetName,
    ActionThreshold actionThreshold,
    ApprovalModel approvalModel,
    Definition definition,
    String executionRoleArn,
    NotificationType notificationType,
    List<Subscriber> subscribers,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''\d{12}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(actionId, 'actionId');
    _s.validateStringLength(
      'actionId',
      actionId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'actionId',
      actionId,
      r'''^[a-fA-F0-9]{8}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(budgetName, 'budgetName');
    _s.validateStringLength(
      'budgetName',
      budgetName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'budgetName',
      budgetName,
      r'''[^:\\]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'executionRoleArn',
      executionRoleArn,
      32,
      618,
    );
    _s.validateStringPattern(
      'executionRoleArn',
      executionRoleArn,
      r'''^arn:(aws|aws-cn|aws-us-gov|us-iso-east-1|us-isob-east-1):iam::\d{12}:role(\u002F[\u0021-\u007F]+\u002F|\u002F)[\w+=,.@-]+$''',
    );
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
    @_s.required String accountId,
    @_s.required String budgetName,
    @_s.required Notification newNotification,
    @_s.required Notification oldNotification,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''\d{12}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(budgetName, 'budgetName');
    _s.validateStringLength(
      'budgetName',
      budgetName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'budgetName',
      budgetName,
      r'''[^:\\]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(newNotification, 'newNotification');
    ArgumentError.checkNotNull(oldNotification, 'oldNotification');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSBudgetServiceGateway.UpdateNotification'
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
        'NewNotification': newNotification,
        'OldNotification': oldNotification,
      },
    );

    return UpdateNotificationResponse.fromJson(jsonResponse.body);
  }

  /// Updates a subscriber.
  ///
  /// May throw [InternalErrorException].
  /// May throw [InvalidParameterException].
  /// May throw [NotFoundException].
  /// May throw [DuplicateRecordException].
  /// May throw [AccessDeniedException].
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
    @_s.required String accountId,
    @_s.required String budgetName,
    @_s.required Subscriber newSubscriber,
    @_s.required Notification notification,
    @_s.required Subscriber oldSubscriber,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''\d{12}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(budgetName, 'budgetName');
    _s.validateStringLength(
      'budgetName',
      budgetName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'budgetName',
      budgetName,
      r'''[^:\\]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(newSubscriber, 'newSubscriber');
    ArgumentError.checkNotNull(notification, 'notification');
    ArgumentError.checkNotNull(oldSubscriber, 'oldSubscriber');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSBudgetServiceGateway.UpdateSubscriber'
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
        'NewSubscriber': newSubscriber,
        'Notification': notification,
        'OldSubscriber': oldSubscriber,
      },
    );

    return UpdateSubscriberResponse.fromJson(jsonResponse.body);
  }
}

/// A budget action resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Action {
  /// A system-generated universally unique identifier (UUID) for the action.
  @_s.JsonKey(name: 'ActionId')
  final String actionId;

  /// The trigger threshold of the action.
  @_s.JsonKey(name: 'ActionThreshold')
  final ActionThreshold actionThreshold;

  /// The type of action. This defines the type of tasks that can be carried out
  /// by this action. This field also determines the format for definition.
  @_s.JsonKey(name: 'ActionType')
  final ActionType actionType;

  /// This specifies if the action needs manual or automatic approval.
  @_s.JsonKey(name: 'ApprovalModel')
  final ApprovalModel approvalModel;
  @_s.JsonKey(name: 'BudgetName')
  final String budgetName;

  /// Where you specify all of the type-specific parameters.
  @_s.JsonKey(name: 'Definition')
  final Definition definition;

  /// The role passed for action execution and reversion. Roles and actions must
  /// be in the same account.
  @_s.JsonKey(name: 'ExecutionRoleArn')
  final String executionRoleArn;
  @_s.JsonKey(name: 'NotificationType')
  final NotificationType notificationType;

  /// The status of action.
  @_s.JsonKey(name: 'Status')
  final ActionStatus status;
  @_s.JsonKey(name: 'Subscribers')
  final List<Subscriber> subscribers;

  Action({
    @_s.required this.actionId,
    @_s.required this.actionThreshold,
    @_s.required this.actionType,
    @_s.required this.approvalModel,
    @_s.required this.budgetName,
    @_s.required this.definition,
    @_s.required this.executionRoleArn,
    @_s.required this.notificationType,
    @_s.required this.status,
    @_s.required this.subscribers,
  });
  factory Action.fromJson(Map<String, dynamic> json) => _$ActionFromJson(json);
}

/// The historical records for a budget action.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ActionHistory {
  /// The description of details of the event.
  @_s.JsonKey(name: 'ActionHistoryDetails')
  final ActionHistoryDetails actionHistoryDetails;

  /// This distinguishes between whether the events are triggered by the user or
  /// generated by the system.
  @_s.JsonKey(name: 'EventType')
  final EventType eventType;

  /// The status of action at the time of the event.
  @_s.JsonKey(name: 'Status')
  final ActionStatus status;
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'Timestamp')
  final DateTime timestamp;

  ActionHistory({
    @_s.required this.actionHistoryDetails,
    @_s.required this.eventType,
    @_s.required this.status,
    @_s.required this.timestamp,
  });
  factory ActionHistory.fromJson(Map<String, dynamic> json) =>
      _$ActionHistoryFromJson(json);
}

/// The description of details of the event.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ActionHistoryDetails {
  /// The budget action resource.
  @_s.JsonKey(name: 'Action')
  final Action action;
  @_s.JsonKey(name: 'Message')
  final String message;

  ActionHistoryDetails({
    @_s.required this.action,
    @_s.required this.message,
  });
  factory ActionHistoryDetails.fromJson(Map<String, dynamic> json) =>
      _$ActionHistoryDetailsFromJson(json);
}

enum ActionStatus {
  @_s.JsonValue('STANDBY')
  standby,
  @_s.JsonValue('PENDING')
  pending,
  @_s.JsonValue('EXECUTION_IN_PROGRESS')
  executionInProgress,
  @_s.JsonValue('EXECUTION_SUCCESS')
  executionSuccess,
  @_s.JsonValue('EXECUTION_FAILURE')
  executionFailure,
  @_s.JsonValue('REVERSE_IN_PROGRESS')
  reverseInProgress,
  @_s.JsonValue('REVERSE_SUCCESS')
  reverseSuccess,
  @_s.JsonValue('REVERSE_FAILURE')
  reverseFailure,
  @_s.JsonValue('RESET_IN_PROGRESS')
  resetInProgress,
  @_s.JsonValue('RESET_FAILURE')
  resetFailure,
}

enum ActionSubType {
  @_s.JsonValue('STOP_EC2_INSTANCES')
  stopEc2Instances,
  @_s.JsonValue('STOP_RDS_INSTANCES')
  stopRdsInstances,
}

/// The trigger threshold of the action.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ActionThreshold {
  @_s.JsonKey(name: 'ActionThresholdType')
  final ThresholdType actionThresholdType;
  @_s.JsonKey(name: 'ActionThresholdValue')
  final double actionThresholdValue;

  ActionThreshold({
    @_s.required this.actionThresholdType,
    @_s.required this.actionThresholdValue,
  });
  factory ActionThreshold.fromJson(Map<String, dynamic> json) =>
      _$ActionThresholdFromJson(json);

  Map<String, dynamic> toJson() => _$ActionThresholdToJson(this);
}

enum ActionType {
  @_s.JsonValue('APPLY_IAM_POLICY')
  applyIamPolicy,
  @_s.JsonValue('APPLY_SCP_POLICY')
  applyScpPolicy,
  @_s.JsonValue('RUN_SSM_DOCUMENTS')
  runSsmDocuments,
}

extension on ActionType {
  String toValue() {
    switch (this) {
      case ActionType.applyIamPolicy:
        return 'APPLY_IAM_POLICY';
      case ActionType.applyScpPolicy:
        return 'APPLY_SCP_POLICY';
      case ActionType.runSsmDocuments:
        return 'RUN_SSM_DOCUMENTS';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum ApprovalModel {
  @_s.JsonValue('AUTOMATIC')
  automatic,
  @_s.JsonValue('MANUAL')
  manual,
}

extension on ApprovalModel {
  String toValue() {
    switch (this) {
      case ApprovalModel.automatic:
        return 'AUTOMATIC';
      case ApprovalModel.manual:
        return 'MANUAL';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Represents the output of the <code>CreateBudget</code> operation. The
/// content consists of the detailed metadata and data file information, and the
/// current status of the <code>budget</code> object.
///
/// This is the ARN pattern for a budget:
///
/// <code>arn:aws:budgets::AccountId:budget/budgetName</code>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Budget {
  /// The name of a budget. The name must be unique within an account. The
  /// <code>:</code> and <code>\</code> characters aren't allowed in
  /// <code>BudgetName</code>.
  @_s.JsonKey(name: 'BudgetName')
  final String budgetName;

  /// Whether this budget tracks costs, usage, RI utilization, RI coverage,
  /// Savings Plans utilization, or Savings Plans coverage.
  @_s.JsonKey(name: 'BudgetType')
  final BudgetType budgetType;

  /// The length of time until a budget resets the actual and forecasted spend.
  @_s.JsonKey(name: 'TimeUnit')
  final TimeUnit timeUnit;

  /// The total amount of cost, usage, RI utilization, RI coverage, Savings Plans
  /// utilization, or Savings Plans coverage that you want to track with your
  /// budget.
  ///
  /// <code>BudgetLimit</code> is required for cost or usage budgets, but optional
  /// for RI or Savings Plans utilization or coverage budgets. RI and Savings
  /// Plans utilization or coverage budgets default to <code>100</code>, which is
  /// the only valid value for RI or Savings Plans utilization or coverage
  /// budgets. You can't use <code>BudgetLimit</code> with
  /// <code>PlannedBudgetLimits</code> for <code>CreateBudget</code> and
  /// <code>UpdateBudget</code> actions.
  @_s.JsonKey(name: 'BudgetLimit')
  final Spend budgetLimit;

  /// The actual and forecasted cost or usage that the budget tracks.
  @_s.JsonKey(name: 'CalculatedSpend')
  final CalculatedSpend calculatedSpend;

  /// The cost filters, such as service or tag, that are applied to a budget.
  ///
  /// AWS Budgets supports the following services as a filter for RI budgets:
  ///
  /// <ul>
  /// <li>
  /// Amazon Elastic Compute Cloud - Compute
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
  /// Amazon Elasticsearch Service
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'CostFilters')
  final Map<String, List<String>> costFilters;

  /// The types of costs that are included in this <code>COST</code> budget.
  ///
  /// <code>USAGE</code>, <code>RI_UTILIZATION</code>, <code>RI_COVERAGE</code>,
  /// <code>SAVINGS_PLANS_UTILIZATION</code>, and
  /// <code>SAVINGS_PLANS_COVERAGE</code> budgets do not have
  /// <code>CostTypes</code>.
  @_s.JsonKey(name: 'CostTypes')
  final CostTypes costTypes;

  /// The last time that you updated this budget.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdatedTime')
  final DateTime lastUpdatedTime;

  /// A map containing multiple <code>BudgetLimit</code>, including current or
  /// future limits.
  ///
  /// <code>PlannedBudgetLimits</code> is available for cost or usage budget and
  /// supports monthly and quarterly <code>TimeUnit</code>.
  ///
  /// For monthly budgets, provide 12 months of <code>PlannedBudgetLimits</code>
  /// values. This must start from the current month and include the next 11
  /// months. The <code>key</code> is the start of the month, <code>UTC</code> in
  /// epoch seconds.
  ///
  /// For quarterly budgets, provide 4 quarters of
  /// <code>PlannedBudgetLimits</code> value entries in standard calendar quarter
  /// increments. This must start from the current quarter and include the next 3
  /// quarters. The <code>key</code> is the start of the quarter, <code>UTC</code>
  /// in epoch seconds.
  ///
  /// If the planned budget expires before 12 months for monthly or 4 quarters for
  /// quarterly, provide the <code>PlannedBudgetLimits</code> values only for the
  /// remaining periods.
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
  /// with <code>PlannedBudgetLimits</code> will also contain
  /// <code>BudgetLimit</code> representing the current month or quarter limit
  /// present in <code>PlannedBudgetLimits</code>. This only applies to budgets
  /// created with <code>PlannedBudgetLimits</code>. Budgets created without
  /// <code>PlannedBudgetLimits</code> will only contain <code>BudgetLimit</code>,
  /// and no <code>PlannedBudgetLimits</code>.
  @_s.JsonKey(name: 'PlannedBudgetLimits')
  final Map<String, Spend> plannedBudgetLimits;

  /// The period of time that is covered by a budget. The period has a start date
  /// and an end date. The start date must come before the end date. The end date
  /// must come before <code>06/15/87 00:00 UTC</code>.
  ///
  /// If you create your budget and don't specify a start date, AWS defaults to
  /// the start of your chosen time period (DAILY, MONTHLY, QUARTERLY, or
  /// ANNUALLY). For example, if you created your budget on January 24, 2018,
  /// chose <code>DAILY</code>, and didn't set a start date, AWS set your start
  /// date to <code>01/24/18 00:00 UTC</code>. If you chose <code>MONTHLY</code>,
  /// AWS set your start date to <code>01/01/18 00:00 UTC</code>. If you didn't
  /// specify an end date, AWS set your end date to <code>06/15/87 00:00
  /// UTC</code>. The defaults are the same for the AWS Billing and Cost
  /// Management console and the API.
  ///
  /// You can change either date with the <code>UpdateBudget</code> operation.
  ///
  /// After the end date, AWS deletes the budget and all associated notifications
  /// and subscribers.
  @_s.JsonKey(name: 'TimePeriod')
  final TimePeriod timePeriod;

  Budget({
    @_s.required this.budgetName,
    @_s.required this.budgetType,
    @_s.required this.timeUnit,
    this.budgetLimit,
    this.calculatedSpend,
    this.costFilters,
    this.costTypes,
    this.lastUpdatedTime,
    this.plannedBudgetLimits,
    this.timePeriod,
  });
  factory Budget.fromJson(Map<String, dynamic> json) => _$BudgetFromJson(json);

  Map<String, dynamic> toJson() => _$BudgetToJson(this);
}

/// A history of the state of a budget at the end of the budget's specified time
/// period.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BudgetPerformanceHistory {
  @_s.JsonKey(name: 'BudgetName')
  final String budgetName;
  @_s.JsonKey(name: 'BudgetType')
  final BudgetType budgetType;

  /// A list of amounts of cost or usage that you created budgets for, compared to
  /// your actual costs or usage.
  @_s.JsonKey(name: 'BudgetedAndActualAmountsList')
  final List<BudgetedAndActualAmounts> budgetedAndActualAmountsList;

  /// The history of the cost filters for a budget during the specified time
  /// period.
  @_s.JsonKey(name: 'CostFilters')
  final Map<String, List<String>> costFilters;

  /// The history of the cost types for a budget during the specified time period.
  @_s.JsonKey(name: 'CostTypes')
  final CostTypes costTypes;
  @_s.JsonKey(name: 'TimeUnit')
  final TimeUnit timeUnit;

  BudgetPerformanceHistory({
    this.budgetName,
    this.budgetType,
    this.budgetedAndActualAmountsList,
    this.costFilters,
    this.costTypes,
    this.timeUnit,
  });
  factory BudgetPerformanceHistory.fromJson(Map<String, dynamic> json) =>
      _$BudgetPerformanceHistoryFromJson(json);
}

/// The type of a budget. It must be one of the following types:
///
/// <code>COST</code>, <code>USAGE</code>, <code>RI_UTILIZATION</code>,
/// <code>RI_COVERAGE</code>, <code>SAVINGS_PLANS_UTILIZATION</code>, or
/// <code>SAVINGS_PLANS_COVERAGE</code>.
enum BudgetType {
  @_s.JsonValue('USAGE')
  usage,
  @_s.JsonValue('COST')
  cost,
  @_s.JsonValue('RI_UTILIZATION')
  riUtilization,
  @_s.JsonValue('RI_COVERAGE')
  riCoverage,
  @_s.JsonValue('SAVINGS_PLANS_UTILIZATION')
  savingsPlansUtilization,
  @_s.JsonValue('SAVINGS_PLANS_COVERAGE')
  savingsPlansCoverage,
}

/// The amount of cost or usage that you created the budget for, compared to
/// your actual costs or usage.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BudgetedAndActualAmounts {
  /// Your actual costs or usage for a budget period.
  @_s.JsonKey(name: 'ActualAmount')
  final Spend actualAmount;

  /// The amount of cost or usage that you created the budget for.
  @_s.JsonKey(name: 'BudgetedAmount')
  final Spend budgetedAmount;

  /// The time period covered by this budget comparison.
  @_s.JsonKey(name: 'TimePeriod')
  final TimePeriod timePeriod;

  BudgetedAndActualAmounts({
    this.actualAmount,
    this.budgetedAmount,
    this.timePeriod,
  });
  factory BudgetedAndActualAmounts.fromJson(Map<String, dynamic> json) =>
      _$BudgetedAndActualAmountsFromJson(json);
}

/// The spend objects that are associated with this budget. The
/// <code>actualSpend</code> tracks how much you've used, cost, usage, RI units,
/// or Savings Plans units and the <code>forecastedSpend</code> tracks how much
/// you are predicted to spend based on your historical usage profile.
///
/// For example, if it is the 20th of the month and you have spent
/// <code>50</code> dollars on Amazon EC2, your <code>actualSpend</code> is
/// <code>50 USD</code>, and your <code>forecastedSpend</code> is <code>75
/// USD</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CalculatedSpend {
  /// The amount of cost, usage, RI units, or Savings Plans units that you have
  /// used.
  @_s.JsonKey(name: 'ActualSpend')
  final Spend actualSpend;

  /// The amount of cost, usage, RI units, or Savings Plans units that you are
  /// forecasted to use.
  @_s.JsonKey(name: 'ForecastedSpend')
  final Spend forecastedSpend;

  CalculatedSpend({
    @_s.required this.actualSpend,
    this.forecastedSpend,
  });
  factory CalculatedSpend.fromJson(Map<String, dynamic> json) =>
      _$CalculatedSpendFromJson(json);

  Map<String, dynamic> toJson() => _$CalculatedSpendToJson(this);
}

/// The comparison operator of a notification. Currently the service supports
/// the following operators:
///
/// <code>GREATER_THAN</code>, <code>LESS_THAN</code>, <code>EQUAL_TO</code>
enum ComparisonOperator {
  @_s.JsonValue('GREATER_THAN')
  greaterThan,
  @_s.JsonValue('LESS_THAN')
  lessThan,
  @_s.JsonValue('EQUAL_TO')
  equalTo,
}

/// The types of cost that are included in a <code>COST</code> budget, such as
/// tax and subscriptions.
///
/// <code>USAGE</code>, <code>RI_UTILIZATION</code>, <code>RI_COVERAGE</code>,
/// <code>SAVINGS_PLANS_UTILIZATION</code>, and
/// <code>SAVINGS_PLANS_COVERAGE</code> budgets do not have
/// <code>CostTypes</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CostTypes {
  /// Specifies whether a budget includes credits.
  ///
  /// The default value is <code>true</code>.
  @_s.JsonKey(name: 'IncludeCredit')
  final bool includeCredit;

  /// Specifies whether a budget includes discounts.
  ///
  /// The default value is <code>true</code>.
  @_s.JsonKey(name: 'IncludeDiscount')
  final bool includeDiscount;

  /// Specifies whether a budget includes non-RI subscription costs.
  ///
  /// The default value is <code>true</code>.
  @_s.JsonKey(name: 'IncludeOtherSubscription')
  final bool includeOtherSubscription;

  /// Specifies whether a budget includes recurring fees such as monthly RI fees.
  ///
  /// The default value is <code>true</code>.
  @_s.JsonKey(name: 'IncludeRecurring')
  final bool includeRecurring;

  /// Specifies whether a budget includes refunds.
  ///
  /// The default value is <code>true</code>.
  @_s.JsonKey(name: 'IncludeRefund')
  final bool includeRefund;

  /// Specifies whether a budget includes subscriptions.
  ///
  /// The default value is <code>true</code>.
  @_s.JsonKey(name: 'IncludeSubscription')
  final bool includeSubscription;

  /// Specifies whether a budget includes support subscription fees.
  ///
  /// The default value is <code>true</code>.
  @_s.JsonKey(name: 'IncludeSupport')
  final bool includeSupport;

  /// Specifies whether a budget includes taxes.
  ///
  /// The default value is <code>true</code>.
  @_s.JsonKey(name: 'IncludeTax')
  final bool includeTax;

  /// Specifies whether a budget includes upfront RI costs.
  ///
  /// The default value is <code>true</code>.
  @_s.JsonKey(name: 'IncludeUpfront')
  final bool includeUpfront;

  /// Specifies whether a budget uses the amortized rate.
  ///
  /// The default value is <code>false</code>.
  @_s.JsonKey(name: 'UseAmortized')
  final bool useAmortized;

  /// Specifies whether a budget uses a blended rate.
  ///
  /// The default value is <code>false</code>.
  @_s.JsonKey(name: 'UseBlended')
  final bool useBlended;

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
  factory CostTypes.fromJson(Map<String, dynamic> json) =>
      _$CostTypesFromJson(json);

  Map<String, dynamic> toJson() => _$CostTypesToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateBudgetActionResponse {
  @_s.JsonKey(name: 'AccountId')
  final String accountId;

  /// A system-generated universally unique identifier (UUID) for the action.
  @_s.JsonKey(name: 'ActionId')
  final String actionId;
  @_s.JsonKey(name: 'BudgetName')
  final String budgetName;

  CreateBudgetActionResponse({
    @_s.required this.accountId,
    @_s.required this.actionId,
    @_s.required this.budgetName,
  });
  factory CreateBudgetActionResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateBudgetActionResponseFromJson(json);
}

/// Response of CreateBudget
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateBudgetResponse {
  CreateBudgetResponse();
  factory CreateBudgetResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateBudgetResponseFromJson(json);
}

/// Response of CreateNotification
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateNotificationResponse {
  CreateNotificationResponse();
  factory CreateNotificationResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateNotificationResponseFromJson(json);
}

/// Response of CreateSubscriber
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateSubscriberResponse {
  CreateSubscriberResponse();
  factory CreateSubscriberResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateSubscriberResponseFromJson(json);
}

/// Specifies all of the type-specific parameters.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Definition {
  /// The AWS Identity and Access Management (IAM) action definition details.
  @_s.JsonKey(name: 'IamActionDefinition')
  final IamActionDefinition iamActionDefinition;

  /// The service control policies (SCPs) action definition details.
  @_s.JsonKey(name: 'ScpActionDefinition')
  final ScpActionDefinition scpActionDefinition;

  /// The AWS Systems Manager (SSM) action definition details.
  @_s.JsonKey(name: 'SsmActionDefinition')
  final SsmActionDefinition ssmActionDefinition;

  Definition({
    this.iamActionDefinition,
    this.scpActionDefinition,
    this.ssmActionDefinition,
  });
  factory Definition.fromJson(Map<String, dynamic> json) =>
      _$DefinitionFromJson(json);

  Map<String, dynamic> toJson() => _$DefinitionToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteBudgetActionResponse {
  @_s.JsonKey(name: 'AccountId')
  final String accountId;
  @_s.JsonKey(name: 'Action')
  final Action action;
  @_s.JsonKey(name: 'BudgetName')
  final String budgetName;

  DeleteBudgetActionResponse({
    @_s.required this.accountId,
    @_s.required this.action,
    @_s.required this.budgetName,
  });
  factory DeleteBudgetActionResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteBudgetActionResponseFromJson(json);
}

/// Response of DeleteBudget
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteBudgetResponse {
  DeleteBudgetResponse();
  factory DeleteBudgetResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteBudgetResponseFromJson(json);
}

/// Response of DeleteNotification
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteNotificationResponse {
  DeleteNotificationResponse();
  factory DeleteNotificationResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteNotificationResponseFromJson(json);
}

/// Response of DeleteSubscriber
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteSubscriberResponse {
  DeleteSubscriberResponse();
  factory DeleteSubscriberResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteSubscriberResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeBudgetActionHistoriesResponse {
  /// The historical record of the budget action resource.
  @_s.JsonKey(name: 'ActionHistories')
  final List<ActionHistory> actionHistories;
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  DescribeBudgetActionHistoriesResponse({
    @_s.required this.actionHistories,
    this.nextToken,
  });
  factory DescribeBudgetActionHistoriesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeBudgetActionHistoriesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeBudgetActionResponse {
  @_s.JsonKey(name: 'AccountId')
  final String accountId;

  /// A budget action resource.
  @_s.JsonKey(name: 'Action')
  final Action action;
  @_s.JsonKey(name: 'BudgetName')
  final String budgetName;

  DescribeBudgetActionResponse({
    @_s.required this.accountId,
    @_s.required this.action,
    @_s.required this.budgetName,
  });
  factory DescribeBudgetActionResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeBudgetActionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeBudgetActionsForAccountResponse {
  /// A list of the budget action resources information.
  @_s.JsonKey(name: 'Actions')
  final List<Action> actions;
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  DescribeBudgetActionsForAccountResponse({
    @_s.required this.actions,
    this.nextToken,
  });
  factory DescribeBudgetActionsForAccountResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeBudgetActionsForAccountResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeBudgetActionsForBudgetResponse {
  /// A list of the budget action resources information.
  @_s.JsonKey(name: 'Actions')
  final List<Action> actions;
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  DescribeBudgetActionsForBudgetResponse({
    @_s.required this.actions,
    this.nextToken,
  });
  factory DescribeBudgetActionsForBudgetResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeBudgetActionsForBudgetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeBudgetPerformanceHistoryResponse {
  /// The history of how often the budget has gone into an <code>ALARM</code>
  /// state.
  ///
  /// For <code>DAILY</code> budgets, the history saves the state of the budget
  /// for the last 60 days. For <code>MONTHLY</code> budgets, the history saves
  /// the state of the budget for the current month plus the last 12 months. For
  /// <code>QUARTERLY</code> budgets, the history saves the state of the budget
  /// for the last four quarters.
  @_s.JsonKey(name: 'BudgetPerformanceHistory')
  final BudgetPerformanceHistory budgetPerformanceHistory;
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  DescribeBudgetPerformanceHistoryResponse({
    this.budgetPerformanceHistory,
    this.nextToken,
  });
  factory DescribeBudgetPerformanceHistoryResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeBudgetPerformanceHistoryResponseFromJson(json);
}

/// Response of DescribeBudget
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeBudgetResponse {
  /// The description of the budget.
  @_s.JsonKey(name: 'Budget')
  final Budget budget;

  DescribeBudgetResponse({
    this.budget,
  });
  factory DescribeBudgetResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeBudgetResponseFromJson(json);
}

/// Response of DescribeBudgets
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeBudgetsResponse {
  /// A list of budgets.
  @_s.JsonKey(name: 'Budgets')
  final List<Budget> budgets;

  /// The pagination token in the service response that indicates the next set of
  /// results that you can retrieve.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  DescribeBudgetsResponse({
    this.budgets,
    this.nextToken,
  });
  factory DescribeBudgetsResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeBudgetsResponseFromJson(json);
}

/// Response of GetNotificationsForBudget
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeNotificationsForBudgetResponse {
  /// The pagination token in the service response that indicates the next set of
  /// results that you can retrieve.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A list of notifications that are associated with a budget.
  @_s.JsonKey(name: 'Notifications')
  final List<Notification> notifications;

  DescribeNotificationsForBudgetResponse({
    this.nextToken,
    this.notifications,
  });
  factory DescribeNotificationsForBudgetResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeNotificationsForBudgetResponseFromJson(json);
}

/// Response of DescribeSubscribersForNotification
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeSubscribersForNotificationResponse {
  /// The pagination token in the service response that indicates the next set of
  /// results that you can retrieve.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A list of subscribers that are associated with a notification.
  @_s.JsonKey(name: 'Subscribers')
  final List<Subscriber> subscribers;

  DescribeSubscribersForNotificationResponse({
    this.nextToken,
    this.subscribers,
  });
  factory DescribeSubscribersForNotificationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeSubscribersForNotificationResponseFromJson(json);
}

enum EventType {
  @_s.JsonValue('SYSTEM')
  system,
  @_s.JsonValue('CREATE_ACTION')
  createAction,
  @_s.JsonValue('DELETE_ACTION')
  deleteAction,
  @_s.JsonValue('UPDATE_ACTION')
  updateAction,
  @_s.JsonValue('EXECUTE_ACTION')
  executeAction,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ExecuteBudgetActionResponse {
  @_s.JsonKey(name: 'AccountId')
  final String accountId;

  /// A system-generated universally unique identifier (UUID) for the action.
  @_s.JsonKey(name: 'ActionId')
  final String actionId;
  @_s.JsonKey(name: 'BudgetName')
  final String budgetName;

  /// The type of execution.
  @_s.JsonKey(name: 'ExecutionType')
  final ExecutionType executionType;

  ExecuteBudgetActionResponse({
    @_s.required this.accountId,
    @_s.required this.actionId,
    @_s.required this.budgetName,
    @_s.required this.executionType,
  });
  factory ExecuteBudgetActionResponse.fromJson(Map<String, dynamic> json) =>
      _$ExecuteBudgetActionResponseFromJson(json);
}

enum ExecutionType {
  @_s.JsonValue('APPROVE_BUDGET_ACTION')
  approveBudgetAction,
  @_s.JsonValue('RETRY_BUDGET_ACTION')
  retryBudgetAction,
  @_s.JsonValue('REVERSE_BUDGET_ACTION')
  reverseBudgetAction,
  @_s.JsonValue('RESET_BUDGET_ACTION')
  resetBudgetAction,
}

extension on ExecutionType {
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
    throw Exception('Unknown enum value: $this');
  }
}

/// The AWS Identity and Access Management (IAM) action definition details.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class IamActionDefinition {
  /// The Amazon Resource Name (ARN) of the policy to be attached.
  @_s.JsonKey(name: 'PolicyArn')
  final String policyArn;

  /// A list of groups to be attached. There must be at least one group.
  @_s.JsonKey(name: 'Groups')
  final List<String> groups;

  /// A list of roles to be attached. There must be at least one role.
  @_s.JsonKey(name: 'Roles')
  final List<String> roles;

  /// A list of users to be attached. There must be at least one user.
  @_s.JsonKey(name: 'Users')
  final List<String> users;

  IamActionDefinition({
    @_s.required this.policyArn,
    this.groups,
    this.roles,
    this.users,
  });
  factory IamActionDefinition.fromJson(Map<String, dynamic> json) =>
      _$IamActionDefinitionFromJson(json);

  Map<String, dynamic> toJson() => _$IamActionDefinitionToJson(this);
}

/// A notification that is associated with a budget. A budget can have up to ten
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
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Notification {
  /// The comparison that is used for this notification.
  @_s.JsonKey(name: 'ComparisonOperator')
  final ComparisonOperator comparisonOperator;

  /// Whether the notification is for how much you have spent
  /// (<code>ACTUAL</code>) or for how much you're forecasted to spend
  /// (<code>FORECASTED</code>).
  @_s.JsonKey(name: 'NotificationType')
  final NotificationType notificationType;

  /// The threshold that is associated with a notification. Thresholds are always
  /// a percentage, and many customers find value being alerted between 50% - 200%
  /// of the budgeted amount. The maximum limit for your threshold is 1,000,000%
  /// above the budgeted amount.
  @_s.JsonKey(name: 'Threshold')
  final double threshold;

  /// Whether this notification is in alarm. If a budget notification is in the
  /// <code>ALARM</code> state, you have passed the set threshold for the budget.
  @_s.JsonKey(name: 'NotificationState')
  final NotificationState notificationState;

  /// The type of threshold for a notification. For <code>ABSOLUTE_VALUE</code>
  /// thresholds, AWS notifies you when you go over or are forecasted to go over
  /// your total cost threshold. For <code>PERCENTAGE</code> thresholds, AWS
  /// notifies you when you go over or are forecasted to go over a certain
  /// percentage of your forecasted spend. For example, if you have a budget for
  /// 200 dollars and you have a <code>PERCENTAGE</code> threshold of 80%, AWS
  /// notifies you when you go over 160 dollars.
  @_s.JsonKey(name: 'ThresholdType')
  final ThresholdType thresholdType;

  Notification({
    @_s.required this.comparisonOperator,
    @_s.required this.notificationType,
    @_s.required this.threshold,
    this.notificationState,
    this.thresholdType,
  });
  factory Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationToJson(this);
}

enum NotificationState {
  @_s.JsonValue('OK')
  ok,
  @_s.JsonValue('ALARM')
  alarm,
}

/// The type of a notification. It must be ACTUAL or FORECASTED.
enum NotificationType {
  @_s.JsonValue('ACTUAL')
  actual,
  @_s.JsonValue('FORECASTED')
  forecasted,
}

extension on NotificationType {
  String toValue() {
    switch (this) {
      case NotificationType.actual:
        return 'ACTUAL';
      case NotificationType.forecasted:
        return 'FORECASTED';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// A notification with subscribers. A notification can have one SNS subscriber
/// and up to 10 email subscribers, for a total of 11 subscribers.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class NotificationWithSubscribers {
  /// The notification that is associated with a budget.
  @_s.JsonKey(name: 'Notification')
  final Notification notification;

  /// A list of subscribers who are subscribed to this notification.
  @_s.JsonKey(name: 'Subscribers')
  final List<Subscriber> subscribers;

  NotificationWithSubscribers({
    @_s.required this.notification,
    @_s.required this.subscribers,
  });
  Map<String, dynamic> toJson() => _$NotificationWithSubscribersToJson(this);
}

/// The service control policies (SCP) action definition details.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ScpActionDefinition {
  /// The policy ID attached.
  @_s.JsonKey(name: 'PolicyId')
  final String policyId;

  /// A list of target IDs.
  @_s.JsonKey(name: 'TargetIds')
  final List<String> targetIds;

  ScpActionDefinition({
    @_s.required this.policyId,
    @_s.required this.targetIds,
  });
  factory ScpActionDefinition.fromJson(Map<String, dynamic> json) =>
      _$ScpActionDefinitionFromJson(json);

  Map<String, dynamic> toJson() => _$ScpActionDefinitionToJson(this);
}

/// The amount of cost or usage that is measured for a budget.
///
/// For example, a <code>Spend</code> for <code>3 GB</code> of S3 usage would
/// have the following parameters:
///
/// <ul>
/// <li>
/// An <code>Amount</code> of <code>3</code>
/// </li>
/// <li>
/// A <code>unit</code> of <code>GB</code>
/// </li>
/// </ul>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Spend {
  /// The cost or usage amount that is associated with a budget forecast, actual
  /// spend, or budget threshold.
  @_s.JsonKey(name: 'Amount')
  final String amount;

  /// The unit of measurement that is used for the budget forecast, actual spend,
  /// or budget threshold, such as dollars or GB.
  @_s.JsonKey(name: 'Unit')
  final String unit;

  Spend({
    @_s.required this.amount,
    @_s.required this.unit,
  });
  factory Spend.fromJson(Map<String, dynamic> json) => _$SpendFromJson(json);

  Map<String, dynamic> toJson() => _$SpendToJson(this);
}

/// The AWS Systems Manager (SSM) action definition details.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SsmActionDefinition {
  /// The action subType.
  @_s.JsonKey(name: 'ActionSubType')
  final ActionSubType actionSubType;

  /// The EC2 and RDS instance IDs.
  @_s.JsonKey(name: 'InstanceIds')
  final List<String> instanceIds;

  /// The Region to run the SSM document.
  @_s.JsonKey(name: 'Region')
  final String region;

  SsmActionDefinition({
    @_s.required this.actionSubType,
    @_s.required this.instanceIds,
    @_s.required this.region,
  });
  factory SsmActionDefinition.fromJson(Map<String, dynamic> json) =>
      _$SsmActionDefinitionFromJson(json);

  Map<String, dynamic> toJson() => _$SsmActionDefinitionToJson(this);
}

/// The subscriber to a budget notification. The subscriber consists of a
/// subscription type and either an Amazon SNS topic or an email address.
///
/// For example, an email subscriber would have the following parameters:
///
/// <ul>
/// <li>
/// A <code>subscriptionType</code> of <code>EMAIL</code>
/// </li>
/// <li>
/// An <code>address</code> of <code>example@example.com</code>
/// </li>
/// </ul>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Subscriber {
  /// The address that AWS sends budget notifications to, either an SNS topic or
  /// an email.
  ///
  /// When you create a subscriber, the value of <code>Address</code> can't
  /// contain line breaks.
  @_s.JsonKey(name: 'Address')
  final String address;

  /// The type of notification that AWS sends to a subscriber.
  @_s.JsonKey(name: 'SubscriptionType')
  final SubscriptionType subscriptionType;

  Subscriber({
    @_s.required this.address,
    @_s.required this.subscriptionType,
  });
  factory Subscriber.fromJson(Map<String, dynamic> json) =>
      _$SubscriberFromJson(json);

  Map<String, dynamic> toJson() => _$SubscriberToJson(this);
}

/// The subscription type of the subscriber. It can be SMS or EMAIL.
enum SubscriptionType {
  @_s.JsonValue('SNS')
  sns,
  @_s.JsonValue('EMAIL')
  email,
}

/// The type of threshold for a notification.
enum ThresholdType {
  @_s.JsonValue('PERCENTAGE')
  percentage,
  @_s.JsonValue('ABSOLUTE_VALUE')
  absoluteValue,
}

/// The period of time that is covered by a budget. The period has a start date
/// and an end date. The start date must come before the end date. There are no
/// restrictions on the end date.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TimePeriod {
  /// The end date for a budget. If you didn't specify an end date, AWS set your
  /// end date to <code>06/15/87 00:00 UTC</code>. The defaults are the same for
  /// the AWS Billing and Cost Management console and the API.
  ///
  /// After the end date, AWS deletes the budget and all associated notifications
  /// and subscribers. You can change your end date with the
  /// <code>UpdateBudget</code> operation.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'End')
  final DateTime end;

  /// The start date for a budget. If you created your budget and didn't specify a
  /// start date, AWS defaults to the start of your chosen time period (DAILY,
  /// MONTHLY, QUARTERLY, or ANNUALLY). For example, if you created your budget on
  /// January 24, 2018, chose <code>DAILY</code>, and didn't set a start date, AWS
  /// set your start date to <code>01/24/18 00:00 UTC</code>. If you chose
  /// <code>MONTHLY</code>, AWS set your start date to <code>01/01/18 00:00
  /// UTC</code>. The defaults are the same for the AWS Billing and Cost
  /// Management console and the API.
  ///
  /// You can change your start date with the <code>UpdateBudget</code> operation.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'Start')
  final DateTime start;

  TimePeriod({
    this.end,
    this.start,
  });
  factory TimePeriod.fromJson(Map<String, dynamic> json) =>
      _$TimePeriodFromJson(json);

  Map<String, dynamic> toJson() => _$TimePeriodToJson(this);
}

/// The time unit of the budget, such as MONTHLY or QUARTERLY.
enum TimeUnit {
  @_s.JsonValue('DAILY')
  daily,
  @_s.JsonValue('MONTHLY')
  monthly,
  @_s.JsonValue('QUARTERLY')
  quarterly,
  @_s.JsonValue('ANNUALLY')
  annually,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateBudgetActionResponse {
  @_s.JsonKey(name: 'AccountId')
  final String accountId;
  @_s.JsonKey(name: 'BudgetName')
  final String budgetName;

  /// The updated action resource information.
  @_s.JsonKey(name: 'NewAction')
  final Action newAction;

  /// The previous action resource information.
  @_s.JsonKey(name: 'OldAction')
  final Action oldAction;

  UpdateBudgetActionResponse({
    @_s.required this.accountId,
    @_s.required this.budgetName,
    @_s.required this.newAction,
    @_s.required this.oldAction,
  });
  factory UpdateBudgetActionResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateBudgetActionResponseFromJson(json);
}

/// Response of UpdateBudget
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateBudgetResponse {
  UpdateBudgetResponse();
  factory UpdateBudgetResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateBudgetResponseFromJson(json);
}

/// Response of UpdateNotification
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateNotificationResponse {
  UpdateNotificationResponse();
  factory UpdateNotificationResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateNotificationResponseFromJson(json);
}

/// Response of UpdateSubscriber
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateSubscriberResponse {
  UpdateSubscriberResponse();
  factory UpdateSubscriberResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateSubscriberResponseFromJson(json);
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String type, String message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class CreationLimitExceededException extends _s.GenericAwsException {
  CreationLimitExceededException({String type, String message})
      : super(
            type: type,
            code: 'CreationLimitExceededException',
            message: message);
}

class DuplicateRecordException extends _s.GenericAwsException {
  DuplicateRecordException({String type, String message})
      : super(type: type, code: 'DuplicateRecordException', message: message);
}

class ExpiredNextTokenException extends _s.GenericAwsException {
  ExpiredNextTokenException({String type, String message})
      : super(type: type, code: 'ExpiredNextTokenException', message: message);
}

class InternalErrorException extends _s.GenericAwsException {
  InternalErrorException({String type, String message})
      : super(type: type, code: 'InternalErrorException', message: message);
}

class InvalidNextTokenException extends _s.GenericAwsException {
  InvalidNextTokenException({String type, String message})
      : super(type: type, code: 'InvalidNextTokenException', message: message);
}

class InvalidParameterException extends _s.GenericAwsException {
  InvalidParameterException({String type, String message})
      : super(type: type, code: 'InvalidParameterException', message: message);
}

class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String type, String message})
      : super(type: type, code: 'NotFoundException', message: message);
}

class ResourceLockedException extends _s.GenericAwsException {
  ResourceLockedException({String type, String message})
      : super(type: type, code: 'ResourceLockedException', message: message);
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
};
