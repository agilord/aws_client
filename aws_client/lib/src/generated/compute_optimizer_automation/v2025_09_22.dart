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

/// Automation is a feature within Amazon Web Services Compute Optimizer that
/// enables you to apply optimization recommendations to your Amazon Web
/// Services resources, reducing costs and improving performance. You can apply
/// recommended actions directly or create automation rules that implement
/// recommendations on a recurring schedule when they match your specified
/// criteria. With automation rules, set criteria such as Amazon Web Services
/// Region and Resource Tags to target specific geographies and workloads.
/// Configure rules to run daily, weekly, or monthly, and Compute Optimizer
/// continuously evaluates new recommendations against your criteria. Track
/// automation events over time, examine detailed step history, estimate savings
/// achieved, and reverse actions directly from Compute Optimizer when needed.
class ComputeOptimizerAutomation {
  final _s.JsonProtocol _protocol;
  ComputeOptimizerAutomation({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'aco-automation',
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

  /// Associates one or more member accounts with your organization's management
  /// account, enabling centralized implementation of optimization actions
  /// across those accounts. Once associated, the management account (or a
  /// delegated administrator) can apply recommended actions to the member
  /// account. When you associate a member account, its organization rule mode
  /// is automatically set to "Any allowed," which permits the management
  /// account to create Automation rules that automatically apply actions to
  /// that account. If the member account has not previously enabled the
  /// Automation feature, the association process automatically enables it.
  /// <note>
  /// Only the management account or a delegated administrator can perform this
  /// action.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ForbiddenException].
  /// May throw [IdempotencyTokenInUseException].
  /// May throw [IdempotentParameterMismatchException].
  /// May throw [InternalServerException].
  /// May throw [InvalidParameterValueException].
  /// May throw [NotManagementAccountException].
  /// May throw [OptInRequiredException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [accountIds] :
  /// The IDs of the member accounts to associate. You can specify up to 50
  /// account IDs.
  ///
  /// Parameter [clientToken] :
  /// A unique identifier to ensure idempotency of the request. Valid for 24
  /// hours after creation.
  Future<AssociateAccountsResponse> associateAccounts({
    required List<String> accountIds,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'ComputeOptimizerAutomationService.AssociateAccounts'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'accountIds': accountIds,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      },
    );

    return AssociateAccountsResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new automation rule to apply recommended actions to resources
  /// based on specified criteria.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ForbiddenException].
  /// May throw [IdempotencyTokenInUseException].
  /// May throw [IdempotentParameterMismatchException].
  /// May throw [InternalServerException].
  /// May throw [InvalidParameterValueException].
  /// May throw [OptInRequiredException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [name] :
  /// The name of the automation rule.
  ///
  /// Parameter [recommendedActionTypes] :
  /// The types of recommended actions this rule will automate.
  ///
  /// Parameter [ruleType] :
  /// The type of rule.
  /// <note>
  /// Only the management account or a delegated administrator can set the
  /// ruleType to be OrganizationRule.
  /// </note>
  ///
  /// Parameter [schedule] :
  /// The schedule for when the rule should run.
  ///
  /// Parameter [status] :
  /// The status of the rule
  ///
  /// Parameter [clientToken] :
  /// A unique identifier to ensure idempotency of the request.
  ///
  /// Parameter [criteria] :
  /// A set of conditions that specify which recommended action qualify for
  /// implementation. When a rule is active and a recommended action matches
  /// these criteria, Compute Optimizer implements the action at the scheduled
  /// run time.
  ///
  /// Parameter [description] :
  /// A description of the automation rule.
  ///
  /// Parameter [organizationConfiguration] :
  /// Configuration for organization-level rules. Required for OrganizationRule
  /// type.
  ///
  /// Parameter [priority] :
  /// A string representation of a decimal number between 0 and 1 (having up to
  /// 30 digits after the decimal point) that determines the priority of the
  /// rule. When multiple rules match the same recommended action, Compute
  /// Optimizer assigns the action to the rule with the lowest priority value
  /// (highest priority), even if that rule is scheduled to run later than other
  /// matching rules.
  ///
  /// Parameter [tags] :
  /// The tags to associate with the rule.
  Future<CreateAutomationRuleResponse> createAutomationRule({
    required String name,
    required List<RecommendedActionType> recommendedActionTypes,
    required RuleType ruleType,
    required Schedule schedule,
    required RuleStatus status,
    String? clientToken,
    Criteria? criteria,
    String? description,
    OrganizationConfiguration? organizationConfiguration,
    String? priority,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'ComputeOptimizerAutomationService.CreateAutomationRule'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
        'recommendedActionTypes':
            recommendedActionTypes.map((e) => e.value).toList(),
        'ruleType': ruleType.value,
        'schedule': schedule,
        'status': status.value,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (criteria != null) 'criteria': criteria,
        if (description != null) 'description': description,
        if (organizationConfiguration != null)
          'organizationConfiguration': organizationConfiguration,
        if (priority != null) 'priority': priority,
        if (tags != null) 'tags': tags,
      },
    );

    return CreateAutomationRuleResponse.fromJson(jsonResponse.body);
  }

  /// Deletes an existing automation rule.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ForbiddenException].
  /// May throw [IdempotencyTokenInUseException].
  /// May throw [IdempotentParameterMismatchException].
  /// May throw [InternalServerException].
  /// May throw [InvalidParameterValueException].
  /// May throw [OptInRequiredException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [ruleArn] :
  /// The ARN of the rule to delete.
  ///
  /// Parameter [ruleRevision] :
  /// The revision number of the rule to delete.
  ///
  /// Parameter [clientToken] :
  /// A unique identifier to ensure idempotency of the request.
  Future<void> deleteAutomationRule({
    required String ruleArn,
    required int ruleRevision,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'ComputeOptimizerAutomationService.DeleteAutomationRule'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ruleArn': ruleArn,
        'ruleRevision': ruleRevision,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      },
    );
  }

  /// Disassociates member accounts from your organization's management account,
  /// removing centralized automation capabilities. Once disassociated,
  /// organization rules no longer apply to the member account, and the
  /// management account (or delegated administrator) cannot create Automation
  /// rules for that account.
  /// <note>
  /// Only the management account or a delegated administrator can perform this
  /// action.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ForbiddenException].
  /// May throw [IdempotencyTokenInUseException].
  /// May throw [IdempotentParameterMismatchException].
  /// May throw [InternalServerException].
  /// May throw [InvalidParameterValueException].
  /// May throw [NotManagementAccountException].
  /// May throw [OptInRequiredException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [accountIds] :
  /// The IDs of the member accounts to disassociate.
  ///
  /// Parameter [clientToken] :
  /// A unique identifier to ensure idempotency of the request.
  Future<DisassociateAccountsResponse> disassociateAccounts({
    required List<String> accountIds,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'ComputeOptimizerAutomationService.DisassociateAccounts'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'accountIds': accountIds,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      },
    );

    return DisassociateAccountsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves details about a specific automation event.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerException].
  /// May throw [InvalidParameterValueException].
  /// May throw [OptInRequiredException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [eventId] :
  /// The ID of the automation event to retrieve.
  Future<GetAutomationEventResponse> getAutomationEvent({
    required String eventId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'ComputeOptimizerAutomationService.GetAutomationEvent'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'eventId': eventId,
      },
    );

    return GetAutomationEventResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves details about a specific automation rule.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerException].
  /// May throw [InvalidParameterValueException].
  /// May throw [OptInRequiredException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [ruleArn] :
  /// The ARN of the rule to retrieve.
  Future<GetAutomationRuleResponse> getAutomationRule({
    required String ruleArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'ComputeOptimizerAutomationService.GetAutomationRule'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ruleArn': ruleArn,
      },
    );

    return GetAutomationRuleResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the current enrollment configuration for Compute Optimizer
  /// Automation.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerException].
  /// May throw [InvalidParameterValueException].
  /// May throw [OptInRequiredException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  Future<GetEnrollmentConfigurationResponse>
      getEnrollmentConfiguration() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'ComputeOptimizerAutomationService.GetEnrollmentConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return GetEnrollmentConfigurationResponse.fromJson(jsonResponse.body);
  }

  /// Lists the accounts in your organization that are enrolled in Compute
  /// Optimizer and whether they have enabled Automation.
  /// <note>
  /// Only the management account or a delegated administrator can perform this
  /// action.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerException].
  /// May throw [InvalidParameterValueException].
  /// May throw [NotManagementAccountException].
  /// May throw [OptInRequiredException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  Future<ListAccountsResponse> listAccounts({
    int? maxResults,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'ComputeOptimizerAutomationService.ListAccounts'
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

    return ListAccountsResponse.fromJson(jsonResponse.body);
  }

  /// Lists automation events based on specified filters. You can retrieve
  /// events that were created within the past year.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerException].
  /// May throw [InvalidParameterValueException].
  /// May throw [OptInRequiredException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [endTimeExclusive] :
  /// The end of the time range to query for events.
  ///
  /// Parameter [filters] :
  /// The filters to apply to the list of automation events.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  ///
  /// Parameter [startTimeInclusive] :
  /// The start of the time range to query for events.
  Future<ListAutomationEventsResponse> listAutomationEvents({
    DateTime? endTimeExclusive,
    List<AutomationEventFilter>? filters,
    int? maxResults,
    String? nextToken,
    DateTime? startTimeInclusive,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'ComputeOptimizerAutomationService.ListAutomationEvents'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (endTimeExclusive != null)
          'endTimeExclusive': unixTimestampToJson(endTimeExclusive),
        if (filters != null) 'filters': filters,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (startTimeInclusive != null)
          'startTimeInclusive': unixTimestampToJson(startTimeInclusive),
      },
    );

    return ListAutomationEventsResponse.fromJson(jsonResponse.body);
  }

  /// Lists the steps for a specific automation event. You can only list steps
  /// for events created within the past year.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerException].
  /// May throw [InvalidParameterValueException].
  /// May throw [OptInRequiredException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [eventId] :
  /// The ID of the automation event.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of automation event steps to return in a single
  /// response. Valid range is 1-1000.
  ///
  /// Parameter [nextToken] :
  /// A token used for pagination to retrieve the next set of results when the
  /// response is truncated.
  Future<ListAutomationEventStepsResponse> listAutomationEventSteps({
    required String eventId,
    int? maxResults,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'ComputeOptimizerAutomationService.ListAutomationEventSteps'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'eventId': eventId,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListAutomationEventStepsResponse.fromJson(jsonResponse.body);
  }

  /// Provides a summary of automation events based on specified filters. Only
  /// events created within the past year will be included in the summary.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerException].
  /// May throw [InvalidParameterValueException].
  /// May throw [OptInRequiredException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [endDateExclusive] :
  /// The end date for filtering automation event summaries, exclusive. Events
  /// created before this date will be included.
  ///
  /// Parameter [filters] :
  /// The filters to apply to the list of automation event summaries.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of automation event summaries to return in a single
  /// response. Valid range is 1-1000.
  ///
  /// Parameter [nextToken] :
  /// A token used for pagination to retrieve the next set of results when the
  /// response is truncated.
  ///
  /// Parameter [startDateInclusive] :
  /// The start date for filtering automation event summaries, inclusive. Events
  /// created on or after this date will be included.
  Future<ListAutomationEventSummariesResponse> listAutomationEventSummaries({
    String? endDateExclusive,
    List<AutomationEventFilter>? filters,
    int? maxResults,
    String? nextToken,
    String? startDateInclusive,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'ComputeOptimizerAutomationService.ListAutomationEventSummaries'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (endDateExclusive != null) 'endDateExclusive': endDateExclusive,
        if (filters != null) 'filters': filters,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (startDateInclusive != null)
          'startDateInclusive': startDateInclusive,
      },
    );

    return ListAutomationEventSummariesResponse.fromJson(jsonResponse.body);
  }

  /// Returns a preview of the recommended actions that match your Automation
  /// rule's configuration and criteria.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerException].
  /// May throw [InvalidParameterValueException].
  /// May throw [OptInRequiredException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [recommendedActionTypes] :
  /// The types of recommended actions to include in the preview.
  ///
  /// Parameter [ruleType] :
  /// The type of rule.
  /// <note>
  /// Only the management account or a delegated administrator can set the
  /// ruleType to be OrganizationRule.
  /// </note>
  ///
  /// Parameter [criteria] :
  /// A set of conditions that specify which recommended action qualify for
  /// implementation. When a rule is active and a recommended action matches
  /// these criteria, Compute Optimizer implements the action at the scheduled
  /// run time.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of automation rule preview results to return in a
  /// single response. Valid range is 1-1000.
  ///
  /// Parameter [nextToken] :
  /// A token used for pagination to retrieve the next set of results when the
  /// response is truncated.
  ///
  /// Parameter [organizationScope] :
  /// The organizational scope for the rule preview.
  Future<ListAutomationRulePreviewResponse> listAutomationRulePreview({
    required List<RecommendedActionType> recommendedActionTypes,
    required RuleType ruleType,
    Criteria? criteria,
    int? maxResults,
    String? nextToken,
    OrganizationScope? organizationScope,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'ComputeOptimizerAutomationService.ListAutomationRulePreview'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'recommendedActionTypes':
            recommendedActionTypes.map((e) => e.value).toList(),
        'ruleType': ruleType.value,
        if (criteria != null) 'criteria': criteria,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (organizationScope != null) 'organizationScope': organizationScope,
      },
    );

    return ListAutomationRulePreviewResponse.fromJson(jsonResponse.body);
  }

  /// Returns a summary of the recommended actions that match your rule preview
  /// configuration and criteria.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerException].
  /// May throw [InvalidParameterValueException].
  /// May throw [OptInRequiredException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [recommendedActionTypes] :
  /// The types of recommended actions to include in the preview.
  ///
  /// Parameter [ruleType] :
  /// The type of rule.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of automation rule preview summaries to return in a
  /// single response. Valid range is 1-1000.
  ///
  /// Parameter [nextToken] :
  /// A token used for pagination to retrieve the next set of results when the
  /// response is truncated.
  ///
  /// Parameter [organizationScope] :
  /// The organizational scope for the rule preview.
  Future<ListAutomationRulePreviewSummariesResponse>
      listAutomationRulePreviewSummaries({
    required List<RecommendedActionType> recommendedActionTypes,
    required RuleType ruleType,
    Criteria? criteria,
    int? maxResults,
    String? nextToken,
    OrganizationScope? organizationScope,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'ComputeOptimizerAutomationService.ListAutomationRulePreviewSummaries'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'recommendedActionTypes':
            recommendedActionTypes.map((e) => e.value).toList(),
        'ruleType': ruleType.value,
        if (criteria != null) 'criteria': criteria,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (organizationScope != null) 'organizationScope': organizationScope,
      },
    );

    return ListAutomationRulePreviewSummariesResponse.fromJson(
        jsonResponse.body);
  }

  /// Lists the automation rules that match specified filters.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerException].
  /// May throw [InvalidParameterValueException].
  /// May throw [OptInRequiredException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [filters] :
  /// The filters to apply to the list of automation rules.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of automation rules to return in a single response.
  /// Valid range is 1-1000.
  ///
  /// Parameter [nextToken] :
  /// A token used for pagination to retrieve the next set of results when the
  /// response is truncated.
  Future<ListAutomationRulesResponse> listAutomationRules({
    List<Filter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'ComputeOptimizerAutomationService.ListAutomationRules'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filters != null) 'filters': filters,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListAutomationRulesResponse.fromJson(jsonResponse.body);
  }

  /// Lists the recommended actions based that match specified filters.
  /// <note>
  /// Management accounts and delegated administrators can retrieve recommended
  /// actions that include associated member accounts. You can associate a
  /// member account using <code>AssociateAccounts</code>.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerException].
  /// May throw [InvalidParameterValueException].
  /// May throw [OptInRequiredException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [filters] :
  /// The filters to apply to the list of recommended actions.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of recommended actions to return in a single response.
  /// Valid range is 1-1000.
  ///
  /// Parameter [nextToken] :
  /// A token used for pagination to retrieve the next set of results when the
  /// response is truncated.
  Future<ListRecommendedActionsResponse> listRecommendedActions({
    List<RecommendedActionFilter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'ComputeOptimizerAutomationService.ListRecommendedActions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filters != null) 'filters': filters,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListRecommendedActionsResponse.fromJson(jsonResponse.body);
  }

  /// Provides a summary of recommended actions based on specified filters.
  /// <note>
  /// Management accounts and delegated administrators can retrieve recommended
  /// actions that include associated member accounts. You can associate a
  /// member account using <code>AssociateAccounts</code>.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerException].
  /// May throw [InvalidParameterValueException].
  /// May throw [OptInRequiredException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [filters] :
  /// A list of filters to apply when retrieving recommended action summaries.
  /// Filters can be based on resource type, action type, account ID, and other
  /// criteria.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of recommended action summaries to return in a single
  /// response. Valid range is 1-1000.
  ///
  /// Parameter [nextToken] :
  /// A token used for pagination to retrieve the next set of results when the
  /// response is truncated.
  Future<ListRecommendedActionSummariesResponse>
      listRecommendedActionSummaries({
    List<RecommendedActionFilter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'ComputeOptimizerAutomationService.ListRecommendedActionSummaries'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filters != null) 'filters': filters,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListRecommendedActionSummariesResponse.fromJson(jsonResponse.body);
  }

  /// Lists the tags for a specified resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerException].
  /// May throw [InvalidParameterValueException].
  /// May throw [OptInRequiredException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource to list tags for.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'ComputeOptimizerAutomationService.ListTagsForResource'
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

  /// Initiates a rollback for a completed automation event.
  /// <note>
  /// Management accounts and delegated administrators can only initiate a
  /// rollback for events belonging to associated member accounts. You can
  /// associate a member account using <code>AssociateAccounts</code>.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ForbiddenException].
  /// May throw [IdempotencyTokenInUseException].
  /// May throw [IdempotentParameterMismatchException].
  /// May throw [InternalServerException].
  /// May throw [InvalidParameterValueException].
  /// May throw [OptInRequiredException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [eventId] :
  /// The ID of the automation event to roll back.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. Must be 1-64 characters long and contain only
  /// alphanumeric characters, underscores, and hyphens.
  Future<RollbackAutomationEventResponse> rollbackAutomationEvent({
    required String eventId,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'ComputeOptimizerAutomationService.RollbackAutomationEvent'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'eventId': eventId,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      },
    );

    return RollbackAutomationEventResponse.fromJson(jsonResponse.body);
  }

  /// Initiates a one-time, on-demand automation for the specified recommended
  /// action.
  /// <note>
  /// Management accounts and delegated administrators can only initiate
  /// recommended actions for associated member accounts. You can associate a
  /// member account using <code>AssociateAccounts</code>.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ForbiddenException].
  /// May throw [IdempotencyTokenInUseException].
  /// May throw [IdempotentParameterMismatchException].
  /// May throw [InternalServerException].
  /// May throw [InvalidParameterValueException].
  /// May throw [OptInRequiredException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [recommendedActionId] :
  /// The ID of the recommended action to automate.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. Must be 1-64 characters long and contain only
  /// alphanumeric characters, underscores, and hyphens.
  Future<StartAutomationEventResponse> startAutomationEvent({
    required String recommendedActionId,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'ComputeOptimizerAutomationService.StartAutomationEvent'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'recommendedActionId': recommendedActionId,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      },
    );

    return StartAutomationEventResponse.fromJson(jsonResponse.body);
  }

  /// Adds tags to the specified resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ForbiddenException].
  /// May throw [IdempotencyTokenInUseException].
  /// May throw [IdempotentParameterMismatchException].
  /// May throw [InternalServerException].
  /// May throw [InvalidParameterValueException].
  /// May throw [OptInRequiredException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource to tag.
  ///
  /// Parameter [ruleRevision] :
  /// The revision number of the automation rule to tag. This ensures you're
  /// tagging the correct version of the rule.
  ///
  /// Parameter [tags] :
  /// The tags to add to the resource.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. Must be 1-64 characters long and contain only
  /// alphanumeric characters, underscores, and hyphens.
  Future<void> tagResource({
    required String resourceArn,
    required int ruleRevision,
    required List<Tag> tags,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'ComputeOptimizerAutomationService.TagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceArn': resourceArn,
        'ruleRevision': ruleRevision,
        'tags': tags,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      },
    );
  }

  /// Removes tags from the specified resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ForbiddenException].
  /// May throw [IdempotencyTokenInUseException].
  /// May throw [IdempotentParameterMismatchException].
  /// May throw [InternalServerException].
  /// May throw [InvalidParameterValueException].
  /// May throw [OptInRequiredException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource to untag.
  ///
  /// Parameter [ruleRevision] :
  /// The revision number of the automation rule to untag. This ensures you're
  /// untagging the correct version of the rule.
  ///
  /// Parameter [tagKeys] :
  /// The keys of the tags to remove from the resource.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. Must be 1-64 characters long and contain only
  /// alphanumeric characters, underscores, and hyphens.
  Future<void> untagResource({
    required String resourceArn,
    required int ruleRevision,
    required List<String> tagKeys,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'ComputeOptimizerAutomationService.UntagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceArn': resourceArn,
        'ruleRevision': ruleRevision,
        'tagKeys': tagKeys,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      },
    );
  }

  /// Updates an existing automation rule.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ForbiddenException].
  /// May throw [IdempotencyTokenInUseException].
  /// May throw [IdempotentParameterMismatchException].
  /// May throw [InternalServerException].
  /// May throw [InvalidParameterValueException].
  /// May throw [OptInRequiredException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [ruleArn] :
  /// The ARN of the rule to update.
  ///
  /// Parameter [ruleRevision] :
  /// The revision number of the rule to update.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. Must be 1-64 characters long and contain only
  /// alphanumeric characters, underscores, and hyphens.
  ///
  /// Parameter [description] :
  /// The updated description of the automation rule. Can be up to 1024
  /// characters long and contain alphanumeric characters, underscores, hyphens,
  /// spaces, and certain special characters.
  ///
  /// Parameter [name] :
  /// The updated name of the automation rule. Must be 1-128 characters long and
  /// contain only alphanumeric characters, underscores, and hyphens.
  ///
  /// Parameter [organizationConfiguration] :
  /// Updated configuration settings for organization-wide rules, including rule
  /// application order and target account IDs.
  ///
  /// Parameter [priority] :
  /// The updated priority level of the automation rule, used to determine
  /// execution order when multiple rules apply to the same resource.
  ///
  /// Parameter [recommendedActionTypes] :
  /// Updated list of recommended action types that this rule can execute, such
  /// as SnapshotAndDeleteUnattachedEbsVolume or UpgradeEbsVolumeType.
  ///
  /// Parameter [ruleType] :
  /// The updated type of automation rule. Can be either OrganizationRule for
  /// organization-wide rules or AccountRule for account-specific rules.
  ///
  /// Parameter [schedule] :
  /// The updated schedule configuration for when the automation rule should
  /// execute, including cron expression, timezone, and execution window.
  ///
  /// Parameter [status] :
  /// The updated status of the automation rule. Can be Active or Inactive.
  Future<UpdateAutomationRuleResponse> updateAutomationRule({
    required String ruleArn,
    required int ruleRevision,
    String? clientToken,
    Criteria? criteria,
    String? description,
    String? name,
    OrganizationConfiguration? organizationConfiguration,
    String? priority,
    List<RecommendedActionType>? recommendedActionTypes,
    RuleType? ruleType,
    Schedule? schedule,
    RuleStatus? status,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'ComputeOptimizerAutomationService.UpdateAutomationRule'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ruleArn': ruleArn,
        'ruleRevision': ruleRevision,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (criteria != null) 'criteria': criteria,
        if (description != null) 'description': description,
        if (name != null) 'name': name,
        if (organizationConfiguration != null)
          'organizationConfiguration': organizationConfiguration,
        if (priority != null) 'priority': priority,
        if (recommendedActionTypes != null)
          'recommendedActionTypes':
              recommendedActionTypes.map((e) => e.value).toList(),
        if (ruleType != null) 'ruleType': ruleType.value,
        if (schedule != null) 'schedule': schedule,
        if (status != null) 'status': status.value,
      },
    );

    return UpdateAutomationRuleResponse.fromJson(jsonResponse.body);
  }

  /// Updates your account’s Compute Optimizer Automation enrollment
  /// configuration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ForbiddenException].
  /// May throw [IdempotencyTokenInUseException].
  /// May throw [IdempotentParameterMismatchException].
  /// May throw [InternalServerException].
  /// May throw [InvalidParameterValueException].
  /// May throw [NotManagementAccountException].
  /// May throw [OptInRequiredException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [status] :
  /// The desired enrollment status.
  ///
  /// <ul>
  /// <li>
  /// Active - Enables the Automation feature for your account.
  /// </li>
  /// <li>
  /// Inactive - Disables the Automation feature for your account and stops all
  /// of your automation rules. If you opt in again later, all rules will be
  /// inactive, and you must enable the rules you want to run. You must wait at
  /// least 24 hours after opting out to opt in again.
  /// </li>
  /// </ul> <note>
  /// The <code>Pending</code> and <code>Failed</code> options cannot be used to
  /// update the enrollment status of an account. They are returned in the
  /// response of a request to update the enrollment status of an account.
  ///
  /// If you are a member account, your account must be disassociated from your
  /// organization’s management account before you can disable Automation.
  /// Contact your administrator to make this change.
  /// </note>
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. Must be 1-64 characters long and contain only
  /// alphanumeric characters, underscores, and hyphens.
  Future<UpdateEnrollmentConfigurationResponse> updateEnrollmentConfiguration({
    required EnrollmentStatus status,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'ComputeOptimizerAutomationService.UpdateEnrollmentConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'status': status.value,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      },
    );

    return UpdateEnrollmentConfigurationResponse.fromJson(jsonResponse.body);
  }
}

class AssociateAccountsResponse {
  /// The IDs of the member accounts that were successfully associated.
  final List<String>? accountIds;

  /// Any errors that occurred during the association process.
  final List<String>? errors;

  AssociateAccountsResponse({
    this.accountIds,
    this.errors,
  });

  factory AssociateAccountsResponse.fromJson(Map<String, dynamic> json) {
    return AssociateAccountsResponse(
      accountIds: (json['accountIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      errors:
          (json['errors'] as List?)?.nonNulls.map((e) => e as String).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final accountIds = this.accountIds;
    final errors = this.errors;
    return {
      if (accountIds != null) 'accountIds': accountIds,
      if (errors != null) 'errors': errors,
    };
  }
}

class CreateAutomationRuleResponse {
  /// The timestamp when the automation rule was created.
  final DateTime? createdTimestamp;
  final Criteria? criteria;

  /// A description of the automation rule. Can be up to 1024 characters long and
  /// contain alphanumeric characters, underscores, hyphens, spaces, and certain
  /// special characters.
  final String? description;

  /// The name of the automation rule. Must be 1-128 characters long and contain
  /// only alphanumeric characters, underscores, and hyphens.
  final String? name;

  /// Configuration settings for organization-wide rules, including rule
  /// application order and target account IDs.
  final OrganizationConfiguration? organizationConfiguration;

  /// The priority level of the automation rule, used to determine execution order
  /// when multiple rules apply to the same resource.
  final String? priority;

  /// List of recommended action types that this rule can execute, such as
  /// SnapshotAndDeleteUnattachedEbsVolume or UpgradeEbsVolumeType.
  final List<RecommendedActionType>? recommendedActionTypes;

  /// The Amazon Resource Name (ARN) of the created rule.
  final String? ruleArn;

  /// The unique identifier of the created rule.
  final String? ruleId;

  /// The revision number of the automation rule. This is incremented each time
  /// the rule is updated.
  final int? ruleRevision;

  /// The type of automation rule. Can be either OrganizationRule for
  /// organization-wide rules or AccountRule for account-specific rules.
  final RuleType? ruleType;

  /// The schedule configuration for when the automation rule should execute,
  /// including cron expression, timezone, and execution window.
  final Schedule? schedule;

  /// The current status of the automation rule. Can be Active or Inactive.
  final RuleStatus? status;

  /// A list of key-value pairs used to categorize and organize the automation
  /// rule. Maximum of 200 tags allowed.
  final List<Tag>? tags;

  CreateAutomationRuleResponse({
    this.createdTimestamp,
    this.criteria,
    this.description,
    this.name,
    this.organizationConfiguration,
    this.priority,
    this.recommendedActionTypes,
    this.ruleArn,
    this.ruleId,
    this.ruleRevision,
    this.ruleType,
    this.schedule,
    this.status,
    this.tags,
  });

  factory CreateAutomationRuleResponse.fromJson(Map<String, dynamic> json) {
    return CreateAutomationRuleResponse(
      createdTimestamp: timeStampFromJson(json['createdTimestamp']),
      criteria: json['criteria'] != null
          ? Criteria.fromJson(json['criteria'] as Map<String, dynamic>)
          : null,
      description: json['description'] as String?,
      name: json['name'] as String?,
      organizationConfiguration: json['organizationConfiguration'] != null
          ? OrganizationConfiguration.fromJson(
              json['organizationConfiguration'] as Map<String, dynamic>)
          : null,
      priority: json['priority'] as String?,
      recommendedActionTypes: (json['recommendedActionTypes'] as List?)
          ?.nonNulls
          .map((e) => RecommendedActionType.fromString((e as String)))
          .toList(),
      ruleArn: json['ruleArn'] as String?,
      ruleId: json['ruleId'] as String?,
      ruleRevision: json['ruleRevision'] as int?,
      ruleType: (json['ruleType'] as String?)?.let(RuleType.fromString),
      schedule: json['schedule'] != null
          ? Schedule.fromJson(json['schedule'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)?.let(RuleStatus.fromString),
      tags: (json['tags'] as List?)
          ?.nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final createdTimestamp = this.createdTimestamp;
    final criteria = this.criteria;
    final description = this.description;
    final name = this.name;
    final organizationConfiguration = this.organizationConfiguration;
    final priority = this.priority;
    final recommendedActionTypes = this.recommendedActionTypes;
    final ruleArn = this.ruleArn;
    final ruleId = this.ruleId;
    final ruleRevision = this.ruleRevision;
    final ruleType = this.ruleType;
    final schedule = this.schedule;
    final status = this.status;
    final tags = this.tags;
    return {
      if (createdTimestamp != null)
        'createdTimestamp': unixTimestampToJson(createdTimestamp),
      if (criteria != null) 'criteria': criteria,
      if (description != null) 'description': description,
      if (name != null) 'name': name,
      if (organizationConfiguration != null)
        'organizationConfiguration': organizationConfiguration,
      if (priority != null) 'priority': priority,
      if (recommendedActionTypes != null)
        'recommendedActionTypes':
            recommendedActionTypes.map((e) => e.value).toList(),
      if (ruleArn != null) 'ruleArn': ruleArn,
      if (ruleId != null) 'ruleId': ruleId,
      if (ruleRevision != null) 'ruleRevision': ruleRevision,
      if (ruleType != null) 'ruleType': ruleType.value,
      if (schedule != null) 'schedule': schedule,
      if (status != null) 'status': status.value,
      if (tags != null) 'tags': tags,
    };
  }
}

class DeleteAutomationRuleResponse {
  DeleteAutomationRuleResponse();

  factory DeleteAutomationRuleResponse.fromJson(Map<String, dynamic> _) {
    return DeleteAutomationRuleResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DisassociateAccountsResponse {
  /// The IDs of the member accounts that were successfully disassociated.
  final List<String>? accountIds;

  /// Any errors that occurred during the disassociation process.
  final List<String>? errors;

  DisassociateAccountsResponse({
    this.accountIds,
    this.errors,
  });

  factory DisassociateAccountsResponse.fromJson(Map<String, dynamic> json) {
    return DisassociateAccountsResponse(
      accountIds: (json['accountIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      errors:
          (json['errors'] as List?)?.nonNulls.map((e) => e as String).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final accountIds = this.accountIds;
    final errors = this.errors;
    return {
      if (accountIds != null) 'accountIds': accountIds,
      if (errors != null) 'errors': errors,
    };
  }
}

class GetAutomationEventResponse {
  /// The Amazon Web Services account ID associated with the automation event.
  final String? accountId;

  /// The timestamp when the automation event completed.
  final DateTime? completedTimestamp;

  /// The timestamp when the automation event was created.
  final DateTime? createdTimestamp;
  final EstimatedMonthlySavings? estimatedMonthlySavings;

  /// A description of the automation event.
  final String? eventDescription;

  /// The ID of the automation event to retrieve.
  final String? eventId;

  /// The current status of the automation event.
  final EventStatus? eventStatus;

  /// The reason for the current event status.
  final String? eventStatusReason;

  /// The type of automation event.
  final EventType? eventType;

  /// The ID of the recommended action associated with this automation event.
  final String? recommendedActionId;

  /// The Amazon Web Services Region where the automation event occurred.
  final String? region;

  /// The Amazon Resource Name (ARN) of the resource affected by the automation
  /// event.
  final String? resourceArn;

  /// The ID of the resource affected by the automation event.
  final String? resourceId;

  /// The type of resource affected by the automation event.
  final ResourceType? resourceType;

  /// The ID of the automation rule that triggered this event.
  final String? ruleId;

  GetAutomationEventResponse({
    this.accountId,
    this.completedTimestamp,
    this.createdTimestamp,
    this.estimatedMonthlySavings,
    this.eventDescription,
    this.eventId,
    this.eventStatus,
    this.eventStatusReason,
    this.eventType,
    this.recommendedActionId,
    this.region,
    this.resourceArn,
    this.resourceId,
    this.resourceType,
    this.ruleId,
  });

  factory GetAutomationEventResponse.fromJson(Map<String, dynamic> json) {
    return GetAutomationEventResponse(
      accountId: json['accountId'] as String?,
      completedTimestamp: timeStampFromJson(json['completedTimestamp']),
      createdTimestamp: timeStampFromJson(json['createdTimestamp']),
      estimatedMonthlySavings: json['estimatedMonthlySavings'] != null
          ? EstimatedMonthlySavings.fromJson(
              json['estimatedMonthlySavings'] as Map<String, dynamic>)
          : null,
      eventDescription: json['eventDescription'] as String?,
      eventId: json['eventId'] as String?,
      eventStatus:
          (json['eventStatus'] as String?)?.let(EventStatus.fromString),
      eventStatusReason: json['eventStatusReason'] as String?,
      eventType: (json['eventType'] as String?)?.let(EventType.fromString),
      recommendedActionId: json['recommendedActionId'] as String?,
      region: json['region'] as String?,
      resourceArn: json['resourceArn'] as String?,
      resourceId: json['resourceId'] as String?,
      resourceType:
          (json['resourceType'] as String?)?.let(ResourceType.fromString),
      ruleId: json['ruleId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final completedTimestamp = this.completedTimestamp;
    final createdTimestamp = this.createdTimestamp;
    final estimatedMonthlySavings = this.estimatedMonthlySavings;
    final eventDescription = this.eventDescription;
    final eventId = this.eventId;
    final eventStatus = this.eventStatus;
    final eventStatusReason = this.eventStatusReason;
    final eventType = this.eventType;
    final recommendedActionId = this.recommendedActionId;
    final region = this.region;
    final resourceArn = this.resourceArn;
    final resourceId = this.resourceId;
    final resourceType = this.resourceType;
    final ruleId = this.ruleId;
    return {
      if (accountId != null) 'accountId': accountId,
      if (completedTimestamp != null)
        'completedTimestamp': unixTimestampToJson(completedTimestamp),
      if (createdTimestamp != null)
        'createdTimestamp': unixTimestampToJson(createdTimestamp),
      if (estimatedMonthlySavings != null)
        'estimatedMonthlySavings': estimatedMonthlySavings,
      if (eventDescription != null) 'eventDescription': eventDescription,
      if (eventId != null) 'eventId': eventId,
      if (eventStatus != null) 'eventStatus': eventStatus.value,
      if (eventStatusReason != null) 'eventStatusReason': eventStatusReason,
      if (eventType != null) 'eventType': eventType.value,
      if (recommendedActionId != null)
        'recommendedActionId': recommendedActionId,
      if (region != null) 'region': region,
      if (resourceArn != null) 'resourceArn': resourceArn,
      if (resourceId != null) 'resourceId': resourceId,
      if (resourceType != null) 'resourceType': resourceType.value,
      if (ruleId != null) 'ruleId': ruleId,
    };
  }
}

class GetAutomationRuleResponse {
  /// The 12-digit Amazon Web Services account ID that owns this automation rule.
  final String? accountId;

  /// The timestamp when the automation rule was created.
  final DateTime? createdTimestamp;
  final Criteria? criteria;

  /// A description of the automation rule.
  final String? description;

  /// The timestamp when the automation rule was last updated.
  final DateTime? lastUpdatedTimestamp;

  /// The name of the automation rule.
  final String? name;
  final OrganizationConfiguration? organizationConfiguration;

  /// A string representation of a decimal number between 0 and 1 (having up to 30
  /// digits after the decimal point) that determines the priority of the rule.
  final String? priority;

  /// List of recommended action types that this rule can execute.
  final List<RecommendedActionType>? recommendedActionTypes;

  /// The Amazon Resource Name (ARN) of the automation rule.
  final String? ruleArn;

  /// The unique identifier of the automation rule.
  final String? ruleId;

  /// The revision number of the automation rule.
  final int? ruleRevision;

  /// The type of automation rule.
  final RuleType? ruleType;
  final Schedule? schedule;

  /// The current status of the automation rule (Active or Inactive).
  final RuleStatus? status;

  /// The tags associated with the automation rule.
  final List<Tag>? tags;

  GetAutomationRuleResponse({
    this.accountId,
    this.createdTimestamp,
    this.criteria,
    this.description,
    this.lastUpdatedTimestamp,
    this.name,
    this.organizationConfiguration,
    this.priority,
    this.recommendedActionTypes,
    this.ruleArn,
    this.ruleId,
    this.ruleRevision,
    this.ruleType,
    this.schedule,
    this.status,
    this.tags,
  });

  factory GetAutomationRuleResponse.fromJson(Map<String, dynamic> json) {
    return GetAutomationRuleResponse(
      accountId: json['accountId'] as String?,
      createdTimestamp: timeStampFromJson(json['createdTimestamp']),
      criteria: json['criteria'] != null
          ? Criteria.fromJson(json['criteria'] as Map<String, dynamic>)
          : null,
      description: json['description'] as String?,
      lastUpdatedTimestamp: timeStampFromJson(json['lastUpdatedTimestamp']),
      name: json['name'] as String?,
      organizationConfiguration: json['organizationConfiguration'] != null
          ? OrganizationConfiguration.fromJson(
              json['organizationConfiguration'] as Map<String, dynamic>)
          : null,
      priority: json['priority'] as String?,
      recommendedActionTypes: (json['recommendedActionTypes'] as List?)
          ?.nonNulls
          .map((e) => RecommendedActionType.fromString((e as String)))
          .toList(),
      ruleArn: json['ruleArn'] as String?,
      ruleId: json['ruleId'] as String?,
      ruleRevision: json['ruleRevision'] as int?,
      ruleType: (json['ruleType'] as String?)?.let(RuleType.fromString),
      schedule: json['schedule'] != null
          ? Schedule.fromJson(json['schedule'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)?.let(RuleStatus.fromString),
      tags: (json['tags'] as List?)
          ?.nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final createdTimestamp = this.createdTimestamp;
    final criteria = this.criteria;
    final description = this.description;
    final lastUpdatedTimestamp = this.lastUpdatedTimestamp;
    final name = this.name;
    final organizationConfiguration = this.organizationConfiguration;
    final priority = this.priority;
    final recommendedActionTypes = this.recommendedActionTypes;
    final ruleArn = this.ruleArn;
    final ruleId = this.ruleId;
    final ruleRevision = this.ruleRevision;
    final ruleType = this.ruleType;
    final schedule = this.schedule;
    final status = this.status;
    final tags = this.tags;
    return {
      if (accountId != null) 'accountId': accountId,
      if (createdTimestamp != null)
        'createdTimestamp': unixTimestampToJson(createdTimestamp),
      if (criteria != null) 'criteria': criteria,
      if (description != null) 'description': description,
      if (lastUpdatedTimestamp != null)
        'lastUpdatedTimestamp': unixTimestampToJson(lastUpdatedTimestamp),
      if (name != null) 'name': name,
      if (organizationConfiguration != null)
        'organizationConfiguration': organizationConfiguration,
      if (priority != null) 'priority': priority,
      if (recommendedActionTypes != null)
        'recommendedActionTypes':
            recommendedActionTypes.map((e) => e.value).toList(),
      if (ruleArn != null) 'ruleArn': ruleArn,
      if (ruleId != null) 'ruleId': ruleId,
      if (ruleRevision != null) 'ruleRevision': ruleRevision,
      if (ruleType != null) 'ruleType': ruleType.value,
      if (schedule != null) 'schedule': schedule,
      if (status != null) 'status': status.value,
      if (tags != null) 'tags': tags,
    };
  }
}

class GetEnrollmentConfigurationResponse {
  /// The current enrollment status.
  final EnrollmentStatus status;

  /// The timestamp of the last update to the enrollment configuration.
  final DateTime? lastUpdatedTimestamp;

  /// Specifies whether the management account can create Automation rules that
  /// implement optimization actions for this account.
  final OrganizationRuleMode? organizationRuleMode;

  /// The reason for the current enrollment status.
  final String? statusReason;

  GetEnrollmentConfigurationResponse({
    required this.status,
    this.lastUpdatedTimestamp,
    this.organizationRuleMode,
    this.statusReason,
  });

  factory GetEnrollmentConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetEnrollmentConfigurationResponse(
      status: EnrollmentStatus.fromString((json['status'] as String?) ?? ''),
      lastUpdatedTimestamp: timeStampFromJson(json['lastUpdatedTimestamp']),
      organizationRuleMode: (json['organizationRuleMode'] as String?)
          ?.let(OrganizationRuleMode.fromString),
      statusReason: json['statusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final lastUpdatedTimestamp = this.lastUpdatedTimestamp;
    final organizationRuleMode = this.organizationRuleMode;
    final statusReason = this.statusReason;
    return {
      'status': status.value,
      if (lastUpdatedTimestamp != null)
        'lastUpdatedTimestamp': unixTimestampToJson(lastUpdatedTimestamp),
      if (organizationRuleMode != null)
        'organizationRuleMode': organizationRuleMode.value,
      if (statusReason != null) 'statusReason': statusReason,
    };
  }
}

class ListAccountsResponse {
  /// The list of accounts in your organization enrolled in Compute Optimizer
  final List<AccountInfo> accounts;

  /// The token to use to retrieve the next page of results.
  final String? nextToken;

  ListAccountsResponse({
    required this.accounts,
    this.nextToken,
  });

  factory ListAccountsResponse.fromJson(Map<String, dynamic> json) {
    return ListAccountsResponse(
      accounts: ((json['accounts'] as List?) ?? const [])
          .nonNulls
          .map((e) => AccountInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accounts = this.accounts;
    final nextToken = this.nextToken;
    return {
      'accounts': accounts,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListAutomationEventsResponse {
  /// The list of automation events that match the specified criteria.
  final List<AutomationEvent>? automationEvents;

  /// The token to use to retrieve the next page of results.
  final String? nextToken;

  ListAutomationEventsResponse({
    this.automationEvents,
    this.nextToken,
  });

  factory ListAutomationEventsResponse.fromJson(Map<String, dynamic> json) {
    return ListAutomationEventsResponse(
      automationEvents: (json['automationEvents'] as List?)
          ?.nonNulls
          .map((e) => AutomationEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final automationEvents = this.automationEvents;
    final nextToken = this.nextToken;
    return {
      if (automationEvents != null) 'automationEvents': automationEvents,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListAutomationEventStepsResponse {
  /// The list of steps for the specified automation event.
  final List<AutomationEventStep>? automationEventSteps;

  /// A token used for pagination. If present, indicates there are more results
  /// available and can be used in subsequent requests.
  final String? nextToken;

  ListAutomationEventStepsResponse({
    this.automationEventSteps,
    this.nextToken,
  });

  factory ListAutomationEventStepsResponse.fromJson(Map<String, dynamic> json) {
    return ListAutomationEventStepsResponse(
      automationEventSteps: (json['automationEventSteps'] as List?)
          ?.nonNulls
          .map((e) => AutomationEventStep.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final automationEventSteps = this.automationEventSteps;
    final nextToken = this.nextToken;
    return {
      if (automationEventSteps != null)
        'automationEventSteps': automationEventSteps,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListAutomationEventSummariesResponse {
  /// The list of automation event summaries that match the specified criteria.
  final List<AutomationEventSummary>? automationEventSummaries;

  /// A token used for pagination. If present, indicates there are more results
  /// available and can be used in subsequent requests.
  final String? nextToken;

  ListAutomationEventSummariesResponse({
    this.automationEventSummaries,
    this.nextToken,
  });

  factory ListAutomationEventSummariesResponse.fromJson(
      Map<String, dynamic> json) {
    return ListAutomationEventSummariesResponse(
      automationEventSummaries: (json['automationEventSummaries'] as List?)
          ?.nonNulls
          .map(
              (e) => AutomationEventSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final automationEventSummaries = this.automationEventSummaries;
    final nextToken = this.nextToken;
    return {
      if (automationEventSummaries != null)
        'automationEventSummaries': automationEventSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListAutomationRulePreviewResponse {
  /// A token used for pagination. If present, indicates there are more results
  /// available and can be used in subsequent requests.
  final String? nextToken;

  /// The list of actions that would be taken based on the specified criteria.
  final List<PreviewResult>? previewResults;

  ListAutomationRulePreviewResponse({
    this.nextToken,
    this.previewResults,
  });

  factory ListAutomationRulePreviewResponse.fromJson(
      Map<String, dynamic> json) {
    return ListAutomationRulePreviewResponse(
      nextToken: json['nextToken'] as String?,
      previewResults: (json['previewResults'] as List?)
          ?.nonNulls
          .map((e) => PreviewResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final previewResults = this.previewResults;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (previewResults != null) 'previewResults': previewResults,
    };
  }
}

class ListAutomationRulePreviewSummariesResponse {
  /// A token used for pagination. If present, indicates there are more results
  /// available and can be used in subsequent requests.
  final String? nextToken;

  /// The list of automation rule preview summaries that match the specified
  /// criteria.
  final List<PreviewResultSummary>? previewResultSummaries;

  ListAutomationRulePreviewSummariesResponse({
    this.nextToken,
    this.previewResultSummaries,
  });

  factory ListAutomationRulePreviewSummariesResponse.fromJson(
      Map<String, dynamic> json) {
    return ListAutomationRulePreviewSummariesResponse(
      nextToken: json['nextToken'] as String?,
      previewResultSummaries: (json['previewResultSummaries'] as List?)
          ?.nonNulls
          .map((e) => PreviewResultSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final previewResultSummaries = this.previewResultSummaries;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (previewResultSummaries != null)
        'previewResultSummaries': previewResultSummaries,
    };
  }
}

class ListAutomationRulesResponse {
  /// The list of automation rules that match the specified criteria.
  final List<AutomationRule>? automationRules;

  /// A token used for pagination. If present, indicates there are more results
  /// available and can be used in subsequent requests.
  final String? nextToken;

  ListAutomationRulesResponse({
    this.automationRules,
    this.nextToken,
  });

  factory ListAutomationRulesResponse.fromJson(Map<String, dynamic> json) {
    return ListAutomationRulesResponse(
      automationRules: (json['automationRules'] as List?)
          ?.nonNulls
          .map((e) => AutomationRule.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final automationRules = this.automationRules;
    final nextToken = this.nextToken;
    return {
      if (automationRules != null) 'automationRules': automationRules,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListRecommendedActionsResponse {
  /// A token used for pagination. If present, indicates there are more results
  /// available and can be used in subsequent requests.
  final String? nextToken;

  /// The list of recommended actions that match the specified criteria.
  final List<RecommendedAction>? recommendedActions;

  ListRecommendedActionsResponse({
    this.nextToken,
    this.recommendedActions,
  });

  factory ListRecommendedActionsResponse.fromJson(Map<String, dynamic> json) {
    return ListRecommendedActionsResponse(
      nextToken: json['nextToken'] as String?,
      recommendedActions: (json['recommendedActions'] as List?)
          ?.nonNulls
          .map((e) => RecommendedAction.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final recommendedActions = this.recommendedActions;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (recommendedActions != null) 'recommendedActions': recommendedActions,
    };
  }
}

class ListRecommendedActionSummariesResponse {
  /// A token used for pagination. If present, indicates there are more results
  /// available and can be used in subsequent requests.
  final String? nextToken;

  /// The summary of recommended actions that match the specified criteria.
  final List<RecommendedActionSummary>? recommendedActionSummaries;

  ListRecommendedActionSummariesResponse({
    this.nextToken,
    this.recommendedActionSummaries,
  });

  factory ListRecommendedActionSummariesResponse.fromJson(
      Map<String, dynamic> json) {
    return ListRecommendedActionSummariesResponse(
      nextToken: json['nextToken'] as String?,
      recommendedActionSummaries: (json['recommendedActionSummaries'] as List?)
          ?.nonNulls
          .map((e) =>
              RecommendedActionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final recommendedActionSummaries = this.recommendedActionSummaries;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (recommendedActionSummaries != null)
        'recommendedActionSummaries': recommendedActionSummaries,
    };
  }
}

class ListTagsForResourceResponse {
  /// The list of tags associated with the specified resource.
  final List<Tag>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['tags'] as List?)
          ?.nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
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

class RollbackAutomationEventResponse {
  /// The ID of the automation event being rolled back.
  final String? eventId;

  /// The current status of the rollback operation.
  final EventStatus? eventStatus;

  RollbackAutomationEventResponse({
    this.eventId,
    this.eventStatus,
  });

  factory RollbackAutomationEventResponse.fromJson(Map<String, dynamic> json) {
    return RollbackAutomationEventResponse(
      eventId: json['eventId'] as String?,
      eventStatus:
          (json['eventStatus'] as String?)?.let(EventStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final eventId = this.eventId;
    final eventStatus = this.eventStatus;
    return {
      if (eventId != null) 'eventId': eventId,
      if (eventStatus != null) 'eventStatus': eventStatus.value,
    };
  }
}

class StartAutomationEventResponse {
  /// The ID of the automation event.
  final String? eventId;

  /// The current status of the automation event.
  final EventStatus? eventStatus;

  /// The ID of the recommended action being automated.
  final String? recommendedActionId;

  StartAutomationEventResponse({
    this.eventId,
    this.eventStatus,
    this.recommendedActionId,
  });

  factory StartAutomationEventResponse.fromJson(Map<String, dynamic> json) {
    return StartAutomationEventResponse(
      eventId: json['eventId'] as String?,
      eventStatus:
          (json['eventStatus'] as String?)?.let(EventStatus.fromString),
      recommendedActionId: json['recommendedActionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final eventId = this.eventId;
    final eventStatus = this.eventStatus;
    final recommendedActionId = this.recommendedActionId;
    return {
      if (eventId != null) 'eventId': eventId,
      if (eventStatus != null) 'eventStatus': eventStatus.value,
      if (recommendedActionId != null)
        'recommendedActionId': recommendedActionId,
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

class UpdateAutomationRuleResponse {
  /// The timestamp when the automation rule was originally created.
  final DateTime? createdTimestamp;
  final Criteria? criteria;

  /// The updated description of the automation rule.
  final String? description;

  /// The timestamp when the automation rule was last updated.
  final DateTime? lastUpdatedTimestamp;

  /// The updated name of the automation rule.
  final String? name;

  /// The updated organization configuration settings.
  final OrganizationConfiguration? organizationConfiguration;

  /// The updated priority level of the automation rule.
  final String? priority;

  /// The updated list of recommended action types.
  final List<RecommendedActionType>? recommendedActionTypes;

  /// The ARN of the updated rule.
  final String? ruleArn;

  /// The new revision number of the updated rule.
  final int? ruleRevision;

  /// The updated type of automation rule.
  final RuleType? ruleType;

  /// The updated schedule configuration.
  final Schedule? schedule;

  /// The updated status of the automation rule.
  final RuleStatus? status;

  UpdateAutomationRuleResponse({
    this.createdTimestamp,
    this.criteria,
    this.description,
    this.lastUpdatedTimestamp,
    this.name,
    this.organizationConfiguration,
    this.priority,
    this.recommendedActionTypes,
    this.ruleArn,
    this.ruleRevision,
    this.ruleType,
    this.schedule,
    this.status,
  });

  factory UpdateAutomationRuleResponse.fromJson(Map<String, dynamic> json) {
    return UpdateAutomationRuleResponse(
      createdTimestamp: timeStampFromJson(json['createdTimestamp']),
      criteria: json['criteria'] != null
          ? Criteria.fromJson(json['criteria'] as Map<String, dynamic>)
          : null,
      description: json['description'] as String?,
      lastUpdatedTimestamp: timeStampFromJson(json['lastUpdatedTimestamp']),
      name: json['name'] as String?,
      organizationConfiguration: json['organizationConfiguration'] != null
          ? OrganizationConfiguration.fromJson(
              json['organizationConfiguration'] as Map<String, dynamic>)
          : null,
      priority: json['priority'] as String?,
      recommendedActionTypes: (json['recommendedActionTypes'] as List?)
          ?.nonNulls
          .map((e) => RecommendedActionType.fromString((e as String)))
          .toList(),
      ruleArn: json['ruleArn'] as String?,
      ruleRevision: json['ruleRevision'] as int?,
      ruleType: (json['ruleType'] as String?)?.let(RuleType.fromString),
      schedule: json['schedule'] != null
          ? Schedule.fromJson(json['schedule'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)?.let(RuleStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final createdTimestamp = this.createdTimestamp;
    final criteria = this.criteria;
    final description = this.description;
    final lastUpdatedTimestamp = this.lastUpdatedTimestamp;
    final name = this.name;
    final organizationConfiguration = this.organizationConfiguration;
    final priority = this.priority;
    final recommendedActionTypes = this.recommendedActionTypes;
    final ruleArn = this.ruleArn;
    final ruleRevision = this.ruleRevision;
    final ruleType = this.ruleType;
    final schedule = this.schedule;
    final status = this.status;
    return {
      if (createdTimestamp != null)
        'createdTimestamp': unixTimestampToJson(createdTimestamp),
      if (criteria != null) 'criteria': criteria,
      if (description != null) 'description': description,
      if (lastUpdatedTimestamp != null)
        'lastUpdatedTimestamp': unixTimestampToJson(lastUpdatedTimestamp),
      if (name != null) 'name': name,
      if (organizationConfiguration != null)
        'organizationConfiguration': organizationConfiguration,
      if (priority != null) 'priority': priority,
      if (recommendedActionTypes != null)
        'recommendedActionTypes':
            recommendedActionTypes.map((e) => e.value).toList(),
      if (ruleArn != null) 'ruleArn': ruleArn,
      if (ruleRevision != null) 'ruleRevision': ruleRevision,
      if (ruleType != null) 'ruleType': ruleType.value,
      if (schedule != null) 'schedule': schedule,
      if (status != null) 'status': status.value,
    };
  }
}

class UpdateEnrollmentConfigurationResponse {
  /// The timestamp when the enrollment configuration was last updated.
  final DateTime lastUpdatedTimestamp;

  /// The updated enrollment status.
  final EnrollmentStatus status;

  /// The reason for the updated enrollment status.
  final String? statusReason;

  UpdateEnrollmentConfigurationResponse({
    required this.lastUpdatedTimestamp,
    required this.status,
    this.statusReason,
  });

  factory UpdateEnrollmentConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateEnrollmentConfigurationResponse(
      lastUpdatedTimestamp:
          nonNullableTimeStampFromJson(json['lastUpdatedTimestamp'] ?? 0),
      status: EnrollmentStatus.fromString((json['status'] as String?) ?? ''),
      statusReason: json['statusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lastUpdatedTimestamp = this.lastUpdatedTimestamp;
    final status = this.status;
    final statusReason = this.statusReason;
    return {
      'lastUpdatedTimestamp': unixTimestampToJson(lastUpdatedTimestamp),
      'status': status.value,
      if (statusReason != null) 'statusReason': statusReason,
    };
  }
}

class EnrollmentStatus {
  static const active = EnrollmentStatus._('Active');
  static const inactive = EnrollmentStatus._('Inactive');
  static const pending = EnrollmentStatus._('Pending');
  static const failed = EnrollmentStatus._('Failed');

  final String value;

  const EnrollmentStatus._(this.value);

  static const values = [active, inactive, pending, failed];

  static EnrollmentStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EnrollmentStatus._(value));

  @override
  bool operator ==(other) => other is EnrollmentStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class RuleType {
  static const organizationRule = RuleType._('OrganizationRule');
  static const accountRule = RuleType._('AccountRule');

  final String value;

  const RuleType._(this.value);

  static const values = [organizationRule, accountRule];

  static RuleType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => RuleType._(value));

  @override
  bool operator ==(other) => other is RuleType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Configuration settings for organization-wide automation rules.
class OrganizationConfiguration {
  /// List of specific Amazon Web Services account IDs where the organization rule
  /// should be applied.
  final List<String>? accountIds;

  /// Specifies when organization rules should be applied relative to account
  /// rules.
  final RuleApplyOrder? ruleApplyOrder;

  OrganizationConfiguration({
    this.accountIds,
    this.ruleApplyOrder,
  });

  factory OrganizationConfiguration.fromJson(Map<String, dynamic> json) {
    return OrganizationConfiguration(
      accountIds: (json['accountIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      ruleApplyOrder:
          (json['ruleApplyOrder'] as String?)?.let(RuleApplyOrder.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final accountIds = this.accountIds;
    final ruleApplyOrder = this.ruleApplyOrder;
    return {
      if (accountIds != null) 'accountIds': accountIds,
      if (ruleApplyOrder != null) 'ruleApplyOrder': ruleApplyOrder.value,
    };
  }
}

/// A set of conditions that specify which recommended action qualify for
/// implementation. When a rule is active and a recommended action matches these
/// criteria, Compute Optimizer implements the action at the scheduled run time.
/// You can specify up to 20 conditions per filter criteria and 20 values per
/// condition.
class Criteria {
  /// Filter criteria for EBS volume sizes in gibibytes (GiB).
  final List<IntegerCriteriaCondition>? ebsVolumeSizeInGib;

  /// Filter criteria for EBS volume types, such as gp2, gp3, io1, io2, st1, or
  /// sc1.
  final List<StringCriteriaCondition>? ebsVolumeType;

  /// Filter criteria for estimated monthly cost savings from the recommended
  /// action.
  final List<DoubleCriteriaCondition>? estimatedMonthlySavings;

  /// Filter criteria for the lookback period in days used to analyze resource
  /// utilization.
  final List<IntegerCriteriaCondition>? lookBackPeriodInDays;

  /// Filter criteria for Amazon Web Services regions where resources must be
  /// located.
  final List<StringCriteriaCondition>? region;

  /// Filter criteria for specific resource ARNs to include or exclude.
  final List<StringCriteriaCondition>? resourceArn;

  /// Filter criteria for resource tags, allowing filtering by tag key and value
  /// combinations.
  final List<ResourceTagsCriteriaCondition>? resourceTag;

  /// Filter criteria indicating whether the recommended action requires a
  /// resource restart.
  final List<StringCriteriaCondition>? restartNeeded;

  Criteria({
    this.ebsVolumeSizeInGib,
    this.ebsVolumeType,
    this.estimatedMonthlySavings,
    this.lookBackPeriodInDays,
    this.region,
    this.resourceArn,
    this.resourceTag,
    this.restartNeeded,
  });

  factory Criteria.fromJson(Map<String, dynamic> json) {
    return Criteria(
      ebsVolumeSizeInGib: (json['ebsVolumeSizeInGib'] as List?)
          ?.nonNulls
          .map((e) =>
              IntegerCriteriaCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
      ebsVolumeType: (json['ebsVolumeType'] as List?)
          ?.nonNulls
          .map((e) =>
              StringCriteriaCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
      estimatedMonthlySavings: (json['estimatedMonthlySavings'] as List?)
          ?.nonNulls
          .map((e) =>
              DoubleCriteriaCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
      lookBackPeriodInDays: (json['lookBackPeriodInDays'] as List?)
          ?.nonNulls
          .map((e) =>
              IntegerCriteriaCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
      region: (json['region'] as List?)
          ?.nonNulls
          .map((e) =>
              StringCriteriaCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
      resourceArn: (json['resourceArn'] as List?)
          ?.nonNulls
          .map((e) =>
              StringCriteriaCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
      resourceTag: (json['resourceTag'] as List?)
          ?.nonNulls
          .map((e) =>
              ResourceTagsCriteriaCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
      restartNeeded: (json['restartNeeded'] as List?)
          ?.nonNulls
          .map((e) =>
              StringCriteriaCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final ebsVolumeSizeInGib = this.ebsVolumeSizeInGib;
    final ebsVolumeType = this.ebsVolumeType;
    final estimatedMonthlySavings = this.estimatedMonthlySavings;
    final lookBackPeriodInDays = this.lookBackPeriodInDays;
    final region = this.region;
    final resourceArn = this.resourceArn;
    final resourceTag = this.resourceTag;
    final restartNeeded = this.restartNeeded;
    return {
      if (ebsVolumeSizeInGib != null) 'ebsVolumeSizeInGib': ebsVolumeSizeInGib,
      if (ebsVolumeType != null) 'ebsVolumeType': ebsVolumeType,
      if (estimatedMonthlySavings != null)
        'estimatedMonthlySavings': estimatedMonthlySavings,
      if (lookBackPeriodInDays != null)
        'lookBackPeriodInDays': lookBackPeriodInDays,
      if (region != null) 'region': region,
      if (resourceArn != null) 'resourceArn': resourceArn,
      if (resourceTag != null) 'resourceTag': resourceTag,
      if (restartNeeded != null) 'restartNeeded': restartNeeded,
    };
  }
}

/// Configuration for scheduling when automation rules should execute, including
/// timing and execution windows.
class Schedule {
  /// The time window in minutes during which the automation rule can start
  /// implementing recommended actions.
  final int? executionWindowInMinutes;

  /// The expression that defines when the schedule runs. <code>cron</code>
  /// expression is supported. A <code>cron</code> expression consists of six
  /// fields separated by white spaces: (<code>minutes</code> <code>hours</code>
  /// <code>day_of_month</code> <code>month</code> <code>day_of_week</code>
  /// <code>year</code>)
  /// <note>
  /// You can schedule rules to run at most once per day. Your cron expression
  /// must use specific values (not wildcards) for the minutes and hours fields.
  /// For example: (<code>30 12 * * *</code>) runs daily at 12:30 PM UTC.
  /// </note>
  final String? scheduleExpression;

  /// The timezone to use when interpreting the schedule expression.
  final String? scheduleExpressionTimezone;

  Schedule({
    this.executionWindowInMinutes,
    this.scheduleExpression,
    this.scheduleExpressionTimezone,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      executionWindowInMinutes: json['executionWindowInMinutes'] as int?,
      scheduleExpression: json['scheduleExpression'] as String?,
      scheduleExpressionTimezone: json['scheduleExpressionTimezone'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final executionWindowInMinutes = this.executionWindowInMinutes;
    final scheduleExpression = this.scheduleExpression;
    final scheduleExpressionTimezone = this.scheduleExpressionTimezone;
    return {
      if (executionWindowInMinutes != null)
        'executionWindowInMinutes': executionWindowInMinutes,
      if (scheduleExpression != null) 'scheduleExpression': scheduleExpression,
      if (scheduleExpressionTimezone != null)
        'scheduleExpressionTimezone': scheduleExpressionTimezone,
    };
  }
}

class RuleStatus {
  static const active = RuleStatus._('Active');
  static const inactive = RuleStatus._('Inactive');

  final String value;

  const RuleStatus._(this.value);

  static const values = [active, inactive];

  static RuleStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => RuleStatus._(value));

  @override
  bool operator ==(other) => other is RuleStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Criteria condition for filtering resources based on their tags, including
/// comparison operators and values.
class ResourceTagsCriteriaCondition {
  /// The comparison operator used to evaluate the tag criteria, such as equals,
  /// not equals, or contains.
  final ComparisonOperator? comparison;

  /// The tag key to use for comparison when filtering resources.
  final String? key;

  /// List of tag values to compare against when filtering resources.
  final List<String>? values;

  ResourceTagsCriteriaCondition({
    this.comparison,
    this.key,
    this.values,
  });

  factory ResourceTagsCriteriaCondition.fromJson(Map<String, dynamic> json) {
    return ResourceTagsCriteriaCondition(
      comparison:
          (json['comparison'] as String?)?.let(ComparisonOperator.fromString),
      key: json['key'] as String?,
      values:
          (json['values'] as List?)?.nonNulls.map((e) => e as String).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final comparison = this.comparison;
    final key = this.key;
    final values = this.values;
    return {
      if (comparison != null) 'comparison': comparison.value,
      if (key != null) 'key': key,
      if (values != null) 'values': values,
    };
  }
}

class ComparisonOperator {
  static const stringEquals = ComparisonOperator._('StringEquals');
  static const stringNotEquals = ComparisonOperator._('StringNotEquals');
  static const stringEqualsIgnoreCase =
      ComparisonOperator._('StringEqualsIgnoreCase');
  static const stringNotEqualsIgnoreCase =
      ComparisonOperator._('StringNotEqualsIgnoreCase');
  static const stringLike = ComparisonOperator._('StringLike');
  static const stringNotLike = ComparisonOperator._('StringNotLike');
  static const numericEquals = ComparisonOperator._('NumericEquals');
  static const numericNotEquals = ComparisonOperator._('NumericNotEquals');
  static const numericLessThan = ComparisonOperator._('NumericLessThan');
  static const numericLessThanEquals =
      ComparisonOperator._('NumericLessThanEquals');
  static const numericGreaterThan = ComparisonOperator._('NumericGreaterThan');
  static const numericGreaterThanEquals =
      ComparisonOperator._('NumericGreaterThanEquals');

  final String value;

  const ComparisonOperator._(this.value);

  static const values = [
    stringEquals,
    stringNotEquals,
    stringEqualsIgnoreCase,
    stringNotEqualsIgnoreCase,
    stringLike,
    stringNotLike,
    numericEquals,
    numericNotEquals,
    numericLessThan,
    numericLessThanEquals,
    numericGreaterThan,
    numericGreaterThanEquals
  ];

  static ComparisonOperator fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ComparisonOperator._(value));

  @override
  bool operator ==(other) =>
      other is ComparisonOperator && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Defines a condition for filtering based on double/floating-point numeric
/// values with comparison operators.
class DoubleCriteriaCondition {
  /// The comparison operator to use, such as equals, greater than, less than,
  /// etc.
  final ComparisonOperator? comparison;

  /// The list of double values to compare against using the specified comparison
  /// operator.
  final List<double>? values;

  DoubleCriteriaCondition({
    this.comparison,
    this.values,
  });

  factory DoubleCriteriaCondition.fromJson(Map<String, dynamic> json) {
    return DoubleCriteriaCondition(
      comparison:
          (json['comparison'] as String?)?.let(ComparisonOperator.fromString),
      values:
          (json['values'] as List?)?.nonNulls.map((e) => e as double).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final comparison = this.comparison;
    final values = this.values;
    return {
      if (comparison != null) 'comparison': comparison.value,
      if (values != null) 'values': values,
    };
  }
}

/// Defines a condition for filtering based on integer values with comparison
/// operators.
class IntegerCriteriaCondition {
  /// The comparison operator to use, such as equals, greater than, less than,
  /// etc.
  final ComparisonOperator? comparison;

  /// The list of integer values to compare against using the specified comparison
  /// operator.
  final List<int>? values;

  IntegerCriteriaCondition({
    this.comparison,
    this.values,
  });

  factory IntegerCriteriaCondition.fromJson(Map<String, dynamic> json) {
    return IntegerCriteriaCondition(
      comparison:
          (json['comparison'] as String?)?.let(ComparisonOperator.fromString),
      values: (json['values'] as List?)?.nonNulls.map((e) => e as int).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final comparison = this.comparison;
    final values = this.values;
    return {
      if (comparison != null) 'comparison': comparison.value,
      if (values != null) 'values': values,
    };
  }
}

/// Criteria condition for filtering based on string values, including
/// comparison operators and target values.
class StringCriteriaCondition {
  /// The comparison operator used to evaluate the string criteria, such as
  /// equals, not equals, or contains.
  final ComparisonOperator? comparison;

  /// List of string values to compare against when applying the criteria
  /// condition.
  final List<String>? values;

  StringCriteriaCondition({
    this.comparison,
    this.values,
  });

  factory StringCriteriaCondition.fromJson(Map<String, dynamic> json) {
    return StringCriteriaCondition(
      comparison:
          (json['comparison'] as String?)?.let(ComparisonOperator.fromString),
      values:
          (json['values'] as List?)?.nonNulls.map((e) => e as String).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final comparison = this.comparison;
    final values = this.values;
    return {
      if (comparison != null) 'comparison': comparison.value,
      if (values != null) 'values': values,
    };
  }
}

/// Recommended action type enumeration
class RecommendedActionType {
  static const snapshotAndDeleteUnattachedEbsVolume =
      RecommendedActionType._('SnapshotAndDeleteUnattachedEbsVolume');
  static const upgradeEbsVolumeType =
      RecommendedActionType._('UpgradeEbsVolumeType');

  final String value;

  const RecommendedActionType._(this.value);

  static const values = [
    snapshotAndDeleteUnattachedEbsVolume,
    upgradeEbsVolumeType
  ];

  static RecommendedActionType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RecommendedActionType._(value));

  @override
  bool operator ==(other) =>
      other is RecommendedActionType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class RuleApplyOrder {
  static const beforeAccountRules = RuleApplyOrder._('BeforeAccountRules');
  static const afterAccountRules = RuleApplyOrder._('AfterAccountRules');

  final String value;

  const RuleApplyOrder._(this.value);

  static const values = [beforeAccountRules, afterAccountRules];

  static RuleApplyOrder fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RuleApplyOrder._(value));

  @override
  bool operator ==(other) => other is RuleApplyOrder && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A key-value pair used to categorize and organize Amazon Web Services
/// resources and automation rules.
class Tag {
  /// The tag key, which can be up to 128 characters long.
  final String key;

  /// The tag value, which can be up to 256 characters long.
  final String value;

  Tag({
    required this.key,
    required this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
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

class EventStatus {
  static const ready = EventStatus._('Ready');
  static const inProgress = EventStatus._('InProgress');
  static const complete = EventStatus._('Complete');
  static const failed = EventStatus._('Failed');
  static const cancelled = EventStatus._('Cancelled');
  static const rollbackReady = EventStatus._('RollbackReady');
  static const rollbackInProgress = EventStatus._('RollbackInProgress');
  static const rollbackComplete = EventStatus._('RollbackComplete');
  static const rollbackFailed = EventStatus._('RollbackFailed');

  final String value;

  const EventStatus._(this.value);

  static const values = [
    ready,
    inProgress,
    complete,
    failed,
    cancelled,
    rollbackReady,
    rollbackInProgress,
    rollbackComplete,
    rollbackFailed
  ];

  static EventStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => EventStatus._(value));

  @override
  bool operator ==(other) => other is EventStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Summary information about recommended actions, grouped by specific criteria
/// with totals and counts.
class RecommendedActionSummary {
  /// The grouping key used to categorize the recommended actions in this summary.
  final String key;

  /// Aggregate totals for the recommended actions in this group, including count
  /// and estimated savings.
  final RecommendedActionTotal total;

  RecommendedActionSummary({
    required this.key,
    required this.total,
  });

  factory RecommendedActionSummary.fromJson(Map<String, dynamic> json) {
    return RecommendedActionSummary(
      key: (json['key'] as String?) ?? '',
      total: RecommendedActionTotal.fromJson(
          (json['total'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final total = this.total;
    return {
      'key': key,
      'total': total,
    };
  }
}

/// Aggregate totals for a group of recommended actions, including count and
/// estimated monthly savings.
class RecommendedActionTotal {
  final EstimatedMonthlySavings estimatedMonthlySavings;

  /// The total number of recommended actions in this group.
  final int recommendedActionCount;

  RecommendedActionTotal({
    required this.estimatedMonthlySavings,
    required this.recommendedActionCount,
  });

  factory RecommendedActionTotal.fromJson(Map<String, dynamic> json) {
    return RecommendedActionTotal(
      estimatedMonthlySavings: EstimatedMonthlySavings.fromJson(
          (json['estimatedMonthlySavings'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      recommendedActionCount: (json['recommendedActionCount'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final estimatedMonthlySavings = this.estimatedMonthlySavings;
    final recommendedActionCount = this.recommendedActionCount;
    return {
      'estimatedMonthlySavings': estimatedMonthlySavings,
      'recommendedActionCount': recommendedActionCount,
    };
  }
}

/// Contains information about estimated monthly cost savings.
class EstimatedMonthlySavings {
  /// The estimated monthly savings after applying any discounts.
  final double afterDiscountSavings;

  /// The estimated monthly savings before applying any discounts.
  final double beforeDiscountSavings;

  /// The currency of the estimated savings.
  final String currency;

  /// The mode used to calculate savings, either BeforeDiscount or AfterDiscount.
  final SavingsEstimationMode savingsEstimationMode;

  EstimatedMonthlySavings({
    required this.afterDiscountSavings,
    required this.beforeDiscountSavings,
    required this.currency,
    required this.savingsEstimationMode,
  });

  factory EstimatedMonthlySavings.fromJson(Map<String, dynamic> json) {
    return EstimatedMonthlySavings(
      afterDiscountSavings: (json['afterDiscountSavings'] as double?) ?? 0,
      beforeDiscountSavings: (json['beforeDiscountSavings'] as double?) ?? 0,
      currency: (json['currency'] as String?) ?? '',
      savingsEstimationMode: SavingsEstimationMode.fromString(
          (json['savingsEstimationMode'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final afterDiscountSavings = this.afterDiscountSavings;
    final beforeDiscountSavings = this.beforeDiscountSavings;
    final currency = this.currency;
    final savingsEstimationMode = this.savingsEstimationMode;
    return {
      'afterDiscountSavings': afterDiscountSavings,
      'beforeDiscountSavings': beforeDiscountSavings,
      'currency': currency,
      'savingsEstimationMode': savingsEstimationMode.value,
    };
  }
}

class SavingsEstimationMode {
  static const beforeDiscount = SavingsEstimationMode._('BeforeDiscount');
  static const afterDiscount = SavingsEstimationMode._('AfterDiscount');

  final String value;

  const SavingsEstimationMode._(this.value);

  static const values = [beforeDiscount, afterDiscount];

  static SavingsEstimationMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SavingsEstimationMode._(value));

  @override
  bool operator ==(other) =>
      other is SavingsEstimationMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A filter used to narrow down recommended action results based on specific
/// criteria.
class RecommendedActionFilter {
  /// The name of the filter field to apply.
  final RecommendedActionFilterName name;

  /// List of filter values to match against the specified filter name. Used to
  /// narrow down recommended actions based on specific criteria.
  final List<String> values;

  RecommendedActionFilter({
    required this.name,
    required this.values,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      'name': name.value,
      'values': values,
    };
  }
}

class RecommendedActionFilterName {
  static const resourceType = RecommendedActionFilterName._('ResourceType');
  static const recommendedActionType =
      RecommendedActionFilterName._('RecommendedActionType');
  static const resourceId = RecommendedActionFilterName._('ResourceId');
  static const lookBackPeriodInDays =
      RecommendedActionFilterName._('LookBackPeriodInDays');
  static const currentResourceDetailsEbsVolumeType =
      RecommendedActionFilterName._('CurrentResourceDetailsEbsVolumeType');
  static const resourceTagsKey =
      RecommendedActionFilterName._('ResourceTagsKey');
  static const resourceTagsValue =
      RecommendedActionFilterName._('ResourceTagsValue');
  static const accountId = RecommendedActionFilterName._('AccountId');
  static const restartNeeded = RecommendedActionFilterName._('RestartNeeded');

  final String value;

  const RecommendedActionFilterName._(this.value);

  static const values = [
    resourceType,
    recommendedActionType,
    resourceId,
    lookBackPeriodInDays,
    currentResourceDetailsEbsVolumeType,
    resourceTagsKey,
    resourceTagsValue,
    accountId,
    restartNeeded
  ];

  static RecommendedActionFilterName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RecommendedActionFilterName._(value));

  @override
  bool operator ==(other) =>
      other is RecommendedActionFilterName && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains information about a recommended action that can be applied to
/// optimize an Amazon Web Services resource.
class RecommendedAction {
  /// The Amazon Web Services account ID that owns the resource.
  final String? accountId;
  final ResourceDetails? currentResourceDetails;

  /// A summary of the resource's current configuration.
  final String? currentResourceSummary;
  final EstimatedMonthlySavings? estimatedMonthlySavings;

  /// The number of days of historical data used to generate the recommendation.
  final int? lookBackPeriodInDays;

  /// The unique identifier of the recommended action.
  final String? recommendedActionId;

  /// The type of action being recommended.
  final RecommendedActionType? recommendedActionType;
  final ResourceDetails? recommendedResourceDetails;

  /// A summary of the resource's recommended configuration.
  final String? recommendedResourceSummary;

  /// The Amazon Web Services Region where the resource is located.
  final String? region;

  /// The Amazon Resource Name (ARN) of the resource that the recommendation
  /// applies to.
  final String? resourceArn;

  /// The ID of the resource that the recommendation applies to.
  final String? resourceId;

  /// The tags associated with the resource.
  final List<Tag>? resourceTags;

  /// The type of resource being evaluated.
  final ResourceType? resourceType;

  /// Indicates whether implementing the recommended action requires a resource
  /// restart.
  final bool? restartNeeded;

  RecommendedAction({
    this.accountId,
    this.currentResourceDetails,
    this.currentResourceSummary,
    this.estimatedMonthlySavings,
    this.lookBackPeriodInDays,
    this.recommendedActionId,
    this.recommendedActionType,
    this.recommendedResourceDetails,
    this.recommendedResourceSummary,
    this.region,
    this.resourceArn,
    this.resourceId,
    this.resourceTags,
    this.resourceType,
    this.restartNeeded,
  });

  factory RecommendedAction.fromJson(Map<String, dynamic> json) {
    return RecommendedAction(
      accountId: json['accountId'] as String?,
      currentResourceDetails: json['currentResourceDetails'] != null
          ? ResourceDetails.fromJson(
              json['currentResourceDetails'] as Map<String, dynamic>)
          : null,
      currentResourceSummary: json['currentResourceSummary'] as String?,
      estimatedMonthlySavings: json['estimatedMonthlySavings'] != null
          ? EstimatedMonthlySavings.fromJson(
              json['estimatedMonthlySavings'] as Map<String, dynamic>)
          : null,
      lookBackPeriodInDays: json['lookBackPeriodInDays'] as int?,
      recommendedActionId: json['recommendedActionId'] as String?,
      recommendedActionType: (json['recommendedActionType'] as String?)
          ?.let(RecommendedActionType.fromString),
      recommendedResourceDetails: json['recommendedResourceDetails'] != null
          ? ResourceDetails.fromJson(
              json['recommendedResourceDetails'] as Map<String, dynamic>)
          : null,
      recommendedResourceSummary: json['recommendedResourceSummary'] as String?,
      region: json['region'] as String?,
      resourceArn: json['resourceArn'] as String?,
      resourceId: json['resourceId'] as String?,
      resourceTags: (json['resourceTags'] as List?)
          ?.nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      resourceType:
          (json['resourceType'] as String?)?.let(ResourceType.fromString),
      restartNeeded: json['restartNeeded'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final currentResourceDetails = this.currentResourceDetails;
    final currentResourceSummary = this.currentResourceSummary;
    final estimatedMonthlySavings = this.estimatedMonthlySavings;
    final lookBackPeriodInDays = this.lookBackPeriodInDays;
    final recommendedActionId = this.recommendedActionId;
    final recommendedActionType = this.recommendedActionType;
    final recommendedResourceDetails = this.recommendedResourceDetails;
    final recommendedResourceSummary = this.recommendedResourceSummary;
    final region = this.region;
    final resourceArn = this.resourceArn;
    final resourceId = this.resourceId;
    final resourceTags = this.resourceTags;
    final resourceType = this.resourceType;
    final restartNeeded = this.restartNeeded;
    return {
      if (accountId != null) 'accountId': accountId,
      if (currentResourceDetails != null)
        'currentResourceDetails': currentResourceDetails,
      if (currentResourceSummary != null)
        'currentResourceSummary': currentResourceSummary,
      if (estimatedMonthlySavings != null)
        'estimatedMonthlySavings': estimatedMonthlySavings,
      if (lookBackPeriodInDays != null)
        'lookBackPeriodInDays': lookBackPeriodInDays,
      if (recommendedActionId != null)
        'recommendedActionId': recommendedActionId,
      if (recommendedActionType != null)
        'recommendedActionType': recommendedActionType.value,
      if (recommendedResourceDetails != null)
        'recommendedResourceDetails': recommendedResourceDetails,
      if (recommendedResourceSummary != null)
        'recommendedResourceSummary': recommendedResourceSummary,
      if (region != null) 'region': region,
      if (resourceArn != null) 'resourceArn': resourceArn,
      if (resourceId != null) 'resourceId': resourceId,
      if (resourceTags != null) 'resourceTags': resourceTags,
      if (resourceType != null) 'resourceType': resourceType.value,
      if (restartNeeded != null) 'restartNeeded': restartNeeded,
    };
  }
}

class ResourceType {
  static const ebsVolume = ResourceType._('EbsVolume');

  final String value;

  const ResourceType._(this.value);

  static const values = [ebsVolume];

  static ResourceType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ResourceType._(value));

  @override
  bool operator ==(other) => other is ResourceType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Detailed configuration information for a specific Amazon Web Services
/// resource, with type-specific details.
class ResourceDetails {
  /// Detailed configuration information specific to EBS volumes, including volume
  /// type, size, IOPS, and throughput settings.
  final EbsVolume? ebsVolume;

  ResourceDetails({
    this.ebsVolume,
  });

  factory ResourceDetails.fromJson(Map<String, dynamic> json) {
    return ResourceDetails(
      ebsVolume: json['ebsVolume'] != null
          ? EbsVolume.fromJson(json['ebsVolume'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final ebsVolume = this.ebsVolume;
    return {
      if (ebsVolume != null) 'ebsVolume': ebsVolume,
    };
  }
}

/// Represents an Amazon EBS volume with its configuration and snapshot usage
/// information.
class EbsVolume {
  /// The configuration details of the EBS volume, including type, size, IOPS, and
  /// throughput.
  final EbsVolumeConfiguration? configuration;

  EbsVolume({
    this.configuration,
  });

  factory EbsVolume.fromJson(Map<String, dynamic> json) {
    return EbsVolume(
      configuration: json['configuration'] != null
          ? EbsVolumeConfiguration.fromJson(
              json['configuration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    return {
      if (configuration != null) 'configuration': configuration,
    };
  }
}

/// Configuration details for an Amazon EBS volume.
class EbsVolumeConfiguration {
  /// The number of I/O operations per second (IOPS) provisioned for the volume.
  final int? iops;

  /// The size of the EBS volume in gibibytes (GiB).
  final int? sizeInGib;

  /// The throughput in MiB/s provisioned for the volume (applicable to gp3, io1,
  /// and io2bx volumes).
  final int? throughput;

  /// The EBS volume type, such as gp2, gp3, io1, io2, st1, or sc1.
  final String? type;

  EbsVolumeConfiguration({
    this.iops,
    this.sizeInGib,
    this.throughput,
    this.type,
  });

  factory EbsVolumeConfiguration.fromJson(Map<String, dynamic> json) {
    return EbsVolumeConfiguration(
      iops: json['iops'] as int?,
      sizeInGib: json['sizeInGib'] as int?,
      throughput: json['throughput'] as int?,
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final iops = this.iops;
    final sizeInGib = this.sizeInGib;
    final throughput = this.throughput;
    final type = this.type;
    return {
      if (iops != null) 'iops': iops,
      if (sizeInGib != null) 'sizeInGib': sizeInGib,
      if (throughput != null) 'throughput': throughput,
      if (type != null) 'type': type,
    };
  }
}

/// Represents a complete automation rule configuration including criteria,
/// schedule, and execution settings.
class AutomationRule {
  /// The 12-digit Amazon Web Services account ID that owns this automation rule.
  final String? accountId;

  /// The timestamp when the automation rule was created.
  final DateTime? createdTimestamp;

  /// A description of the automation rule.
  final String? description;

  /// The timestamp when the automation rule was last updated.
  final DateTime? lastUpdatedTimestamp;

  /// The name of the automation rule.
  final String? name;

  /// Configuration settings for organization-wide rules.
  final OrganizationConfiguration? organizationConfiguration;

  /// A string representation of a decimal number between 0 and 1 (having up to 30
  /// digits after the decimal point) that determines the priority of the rule.
  /// When multiple rules match the same recommended action, Compute Optimizer
  /// assigns the action to the rule with the lowest priority value (highest
  /// priority), even if that rule is scheduled to run later than other matching
  /// rules.
  final String? priority;

  /// List of recommended action types that this rule can execute.
  final List<RecommendedActionType>? recommendedActionTypes;

  /// The Amazon Resource Name (ARN) of the automation rule.
  final String? ruleArn;

  /// The unique identifier of the automation rule.
  final String? ruleId;

  /// The revision number of the automation rule.
  final int? ruleRevision;

  /// The type of automation rule (OrganizationRule or AccountRule).
  final RuleType? ruleType;

  /// The schedule configuration for when the automation rule should execute.
  final Schedule? schedule;

  /// The current status of the automation rule (Active or Inactive).
  final RuleStatus? status;

  AutomationRule({
    this.accountId,
    this.createdTimestamp,
    this.description,
    this.lastUpdatedTimestamp,
    this.name,
    this.organizationConfiguration,
    this.priority,
    this.recommendedActionTypes,
    this.ruleArn,
    this.ruleId,
    this.ruleRevision,
    this.ruleType,
    this.schedule,
    this.status,
  });

  factory AutomationRule.fromJson(Map<String, dynamic> json) {
    return AutomationRule(
      accountId: json['accountId'] as String?,
      createdTimestamp: timeStampFromJson(json['createdTimestamp']),
      description: json['description'] as String?,
      lastUpdatedTimestamp: timeStampFromJson(json['lastUpdatedTimestamp']),
      name: json['name'] as String?,
      organizationConfiguration: json['organizationConfiguration'] != null
          ? OrganizationConfiguration.fromJson(
              json['organizationConfiguration'] as Map<String, dynamic>)
          : null,
      priority: json['priority'] as String?,
      recommendedActionTypes: (json['recommendedActionTypes'] as List?)
          ?.nonNulls
          .map((e) => RecommendedActionType.fromString((e as String)))
          .toList(),
      ruleArn: json['ruleArn'] as String?,
      ruleId: json['ruleId'] as String?,
      ruleRevision: json['ruleRevision'] as int?,
      ruleType: (json['ruleType'] as String?)?.let(RuleType.fromString),
      schedule: json['schedule'] != null
          ? Schedule.fromJson(json['schedule'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)?.let(RuleStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final createdTimestamp = this.createdTimestamp;
    final description = this.description;
    final lastUpdatedTimestamp = this.lastUpdatedTimestamp;
    final name = this.name;
    final organizationConfiguration = this.organizationConfiguration;
    final priority = this.priority;
    final recommendedActionTypes = this.recommendedActionTypes;
    final ruleArn = this.ruleArn;
    final ruleId = this.ruleId;
    final ruleRevision = this.ruleRevision;
    final ruleType = this.ruleType;
    final schedule = this.schedule;
    final status = this.status;
    return {
      if (accountId != null) 'accountId': accountId,
      if (createdTimestamp != null)
        'createdTimestamp': unixTimestampToJson(createdTimestamp),
      if (description != null) 'description': description,
      if (lastUpdatedTimestamp != null)
        'lastUpdatedTimestamp': unixTimestampToJson(lastUpdatedTimestamp),
      if (name != null) 'name': name,
      if (organizationConfiguration != null)
        'organizationConfiguration': organizationConfiguration,
      if (priority != null) 'priority': priority,
      if (recommendedActionTypes != null)
        'recommendedActionTypes':
            recommendedActionTypes.map((e) => e.value).toList(),
      if (ruleArn != null) 'ruleArn': ruleArn,
      if (ruleId != null) 'ruleId': ruleId,
      if (ruleRevision != null) 'ruleRevision': ruleRevision,
      if (ruleType != null) 'ruleType': ruleType.value,
      if (schedule != null) 'schedule': schedule,
      if (status != null) 'status': status.value,
    };
  }
}

/// A filter used to narrow down results based on specific criteria.
class Filter {
  /// The name of the filter field to apply.
  final AutomationRuleFilterName name;

  /// The list of values to filter by for the specified filter field.
  final List<String> values;

  Filter({
    required this.name,
    required this.values,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      'name': name.value,
      'values': values,
    };
  }
}

class AutomationRuleFilterName {
  static const name = AutomationRuleFilterName._('Name');
  static const recommendedActionType =
      AutomationRuleFilterName._('RecommendedActionType');
  static const status = AutomationRuleFilterName._('Status');
  static const ruleType = AutomationRuleFilterName._('RuleType');
  static const organizationConfigurationRuleApplyOrder =
      AutomationRuleFilterName._('OrganizationConfigurationRuleApplyOrder');
  static const accountId = AutomationRuleFilterName._('AccountId');

  final String value;

  const AutomationRuleFilterName._(this.value);

  static const values = [
    name,
    recommendedActionType,
    status,
    ruleType,
    organizationConfigurationRuleApplyOrder,
    accountId
  ];

  static AutomationRuleFilterName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AutomationRuleFilterName._(value));

  @override
  bool operator ==(other) =>
      other is AutomationRuleFilterName && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains a summary of preview results for an automation rule.
class PreviewResultSummary {
  /// The key identifier for this preview result summary.
  final String key;
  final RulePreviewTotal total;

  PreviewResultSummary({
    required this.key,
    required this.total,
  });

  factory PreviewResultSummary.fromJson(Map<String, dynamic> json) {
    return PreviewResultSummary(
      key: (json['key'] as String?) ?? '',
      total: RulePreviewTotal.fromJson(
          (json['total'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final total = this.total;
    return {
      'key': key,
      'total': total,
    };
  }
}

/// Aggregate totals for automation rule preview results, including count and
/// estimated savings.
class RulePreviewTotal {
  final EstimatedMonthlySavings estimatedMonthlySavings;

  /// The total number of recommended actions matching the rule preview
  /// configuration.
  final int recommendedActionCount;

  RulePreviewTotal({
    required this.estimatedMonthlySavings,
    required this.recommendedActionCount,
  });

  factory RulePreviewTotal.fromJson(Map<String, dynamic> json) {
    return RulePreviewTotal(
      estimatedMonthlySavings: EstimatedMonthlySavings.fromJson(
          (json['estimatedMonthlySavings'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      recommendedActionCount: (json['recommendedActionCount'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final estimatedMonthlySavings = this.estimatedMonthlySavings;
    final recommendedActionCount = this.recommendedActionCount;
    return {
      'estimatedMonthlySavings': estimatedMonthlySavings,
      'recommendedActionCount': recommendedActionCount,
    };
  }
}

/// Defines the scope for organization-level rules when previewing matching
/// actions.
class OrganizationScope {
  /// List of Amazon Web Services account IDs to include in the organization
  /// scope.
  final List<String>? accountIds;

  OrganizationScope({
    this.accountIds,
  });

  Map<String, dynamic> toJson() {
    final accountIds = this.accountIds;
    return {
      if (accountIds != null) 'accountIds': accountIds,
    };
  }
}

/// Contains the results of previewing an automation rule against available
/// recommendations.
class PreviewResult {
  /// The Amazon Web Services account ID associated with the resource.
  final String? accountId;
  final ResourceDetails? currentResourceDetails;

  /// A summary of the resource's current configuration.
  final String? currentResourceSummary;
  final EstimatedMonthlySavings? estimatedMonthlySavings;

  /// The number of days of historical data used to analyze the resource.
  final int? lookBackPeriodInDays;

  /// The ID of the recommended action being previewed.
  final String? recommendedActionId;

  /// The type of recommended action being previewed.
  final RecommendedActionType? recommendedActionType;
  final ResourceDetails? recommendedResourceDetails;

  /// A summary of the resource's recommended configuration.
  final String? recommendedResourceSummary;

  /// The Amazon Web Services Region where the resource is located.
  final String? region;

  /// The Amazon Resource Name (ARN) of the resource affected by the recommended
  /// action.
  final String? resourceArn;

  /// The ID of the resource affected by the recommended action.
  final String? resourceId;

  /// The tags associated with the resource.
  final List<Tag>? resourceTags;

  /// The type of resource being evaluated.
  final ResourceType? resourceType;

  /// Indicates whether implementing the recommended action requires a resource
  /// restart.
  final bool? restartNeeded;

  PreviewResult({
    this.accountId,
    this.currentResourceDetails,
    this.currentResourceSummary,
    this.estimatedMonthlySavings,
    this.lookBackPeriodInDays,
    this.recommendedActionId,
    this.recommendedActionType,
    this.recommendedResourceDetails,
    this.recommendedResourceSummary,
    this.region,
    this.resourceArn,
    this.resourceId,
    this.resourceTags,
    this.resourceType,
    this.restartNeeded,
  });

  factory PreviewResult.fromJson(Map<String, dynamic> json) {
    return PreviewResult(
      accountId: json['accountId'] as String?,
      currentResourceDetails: json['currentResourceDetails'] != null
          ? ResourceDetails.fromJson(
              json['currentResourceDetails'] as Map<String, dynamic>)
          : null,
      currentResourceSummary: json['currentResourceSummary'] as String?,
      estimatedMonthlySavings: json['estimatedMonthlySavings'] != null
          ? EstimatedMonthlySavings.fromJson(
              json['estimatedMonthlySavings'] as Map<String, dynamic>)
          : null,
      lookBackPeriodInDays: json['lookBackPeriodInDays'] as int?,
      recommendedActionId: json['recommendedActionId'] as String?,
      recommendedActionType: (json['recommendedActionType'] as String?)
          ?.let(RecommendedActionType.fromString),
      recommendedResourceDetails: json['recommendedResourceDetails'] != null
          ? ResourceDetails.fromJson(
              json['recommendedResourceDetails'] as Map<String, dynamic>)
          : null,
      recommendedResourceSummary: json['recommendedResourceSummary'] as String?,
      region: json['region'] as String?,
      resourceArn: json['resourceArn'] as String?,
      resourceId: json['resourceId'] as String?,
      resourceTags: (json['resourceTags'] as List?)
          ?.nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      resourceType:
          (json['resourceType'] as String?)?.let(ResourceType.fromString),
      restartNeeded: json['restartNeeded'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final currentResourceDetails = this.currentResourceDetails;
    final currentResourceSummary = this.currentResourceSummary;
    final estimatedMonthlySavings = this.estimatedMonthlySavings;
    final lookBackPeriodInDays = this.lookBackPeriodInDays;
    final recommendedActionId = this.recommendedActionId;
    final recommendedActionType = this.recommendedActionType;
    final recommendedResourceDetails = this.recommendedResourceDetails;
    final recommendedResourceSummary = this.recommendedResourceSummary;
    final region = this.region;
    final resourceArn = this.resourceArn;
    final resourceId = this.resourceId;
    final resourceTags = this.resourceTags;
    final resourceType = this.resourceType;
    final restartNeeded = this.restartNeeded;
    return {
      if (accountId != null) 'accountId': accountId,
      if (currentResourceDetails != null)
        'currentResourceDetails': currentResourceDetails,
      if (currentResourceSummary != null)
        'currentResourceSummary': currentResourceSummary,
      if (estimatedMonthlySavings != null)
        'estimatedMonthlySavings': estimatedMonthlySavings,
      if (lookBackPeriodInDays != null)
        'lookBackPeriodInDays': lookBackPeriodInDays,
      if (recommendedActionId != null)
        'recommendedActionId': recommendedActionId,
      if (recommendedActionType != null)
        'recommendedActionType': recommendedActionType.value,
      if (recommendedResourceDetails != null)
        'recommendedResourceDetails': recommendedResourceDetails,
      if (recommendedResourceSummary != null)
        'recommendedResourceSummary': recommendedResourceSummary,
      if (region != null) 'region': region,
      if (resourceArn != null) 'resourceArn': resourceArn,
      if (resourceId != null) 'resourceId': resourceId,
      if (resourceTags != null) 'resourceTags': resourceTags,
      if (resourceType != null) 'resourceType': resourceType.value,
      if (restartNeeded != null) 'restartNeeded': restartNeeded,
    };
  }
}

/// A summary of automation events grouped by specified dimensions.
class AutomationEventSummary {
  /// The dimensions used to group this summary, such as event status.
  final List<SummaryDimension>? dimensions;

  /// The key identifier for this summary grouping.
  final String? key;

  /// The time period covered by this summary, with inclusive start time and
  /// exclusive end time.
  final TimePeriod? timePeriod;

  /// The aggregated totals for this summary, including event count and estimated
  /// savings.
  final SummaryTotals? total;

  AutomationEventSummary({
    this.dimensions,
    this.key,
    this.timePeriod,
    this.total,
  });

  factory AutomationEventSummary.fromJson(Map<String, dynamic> json) {
    return AutomationEventSummary(
      dimensions: (json['dimensions'] as List?)
          ?.nonNulls
          .map((e) => SummaryDimension.fromJson(e as Map<String, dynamic>))
          .toList(),
      key: json['key'] as String?,
      timePeriod: json['timePeriod'] != null
          ? TimePeriod.fromJson(json['timePeriod'] as Map<String, dynamic>)
          : null,
      total: json['total'] != null
          ? SummaryTotals.fromJson(json['total'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final dimensions = this.dimensions;
    final key = this.key;
    final timePeriod = this.timePeriod;
    final total = this.total;
    return {
      if (dimensions != null) 'dimensions': dimensions,
      if (key != null) 'key': key,
      if (timePeriod != null) 'timePeriod': timePeriod,
      if (total != null) 'total': total,
    };
  }
}

/// Defines a time range with inclusive start time and exclusive end time for
/// filtering and analysis.
class TimePeriod {
  /// The end time of the period, exclusive. Events before this time are included.
  final DateTime? endTimeExclusive;

  /// The start time of the period, inclusive. Events at or after this time are
  /// included.
  final DateTime? startTimeInclusive;

  TimePeriod({
    this.endTimeExclusive,
    this.startTimeInclusive,
  });

  factory TimePeriod.fromJson(Map<String, dynamic> json) {
    return TimePeriod(
      endTimeExclusive: timeStampFromJson(json['endTimeExclusive']),
      startTimeInclusive: timeStampFromJson(json['startTimeInclusive']),
    );
  }

  Map<String, dynamic> toJson() {
    final endTimeExclusive = this.endTimeExclusive;
    final startTimeInclusive = this.startTimeInclusive;
    return {
      if (endTimeExclusive != null)
        'endTimeExclusive': unixTimestampToJson(endTimeExclusive),
      if (startTimeInclusive != null)
        'startTimeInclusive': unixTimestampToJson(startTimeInclusive),
    };
  }
}

/// Aggregate totals for automation events, including counts and estimated
/// savings.
class SummaryTotals {
  /// The total number of automation events in this summary group.
  final int? automationEventCount;
  final EstimatedMonthlySavings? estimatedMonthlySavings;

  SummaryTotals({
    this.automationEventCount,
    this.estimatedMonthlySavings,
  });

  factory SummaryTotals.fromJson(Map<String, dynamic> json) {
    return SummaryTotals(
      automationEventCount: json['automationEventCount'] as int?,
      estimatedMonthlySavings: json['estimatedMonthlySavings'] != null
          ? EstimatedMonthlySavings.fromJson(
              json['estimatedMonthlySavings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final automationEventCount = this.automationEventCount;
    final estimatedMonthlySavings = this.estimatedMonthlySavings;
    return {
      if (automationEventCount != null)
        'automationEventCount': automationEventCount,
      if (estimatedMonthlySavings != null)
        'estimatedMonthlySavings': estimatedMonthlySavings,
    };
  }
}

/// A key-value pair used to categorize and group summary data for analysis and
/// reporting.
class SummaryDimension {
  /// The dimension key used for categorizing summary data.
  final SummaryDimensionKey key;

  /// The specific value for this dimension key used in the summary grouping.
  final String value;

  SummaryDimension({
    required this.key,
    required this.value,
  });

  factory SummaryDimension.fromJson(Map<String, dynamic> json) {
    return SummaryDimension(
      key: SummaryDimensionKey.fromString((json['key'] as String?) ?? ''),
      value: (json['value'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'key': key.value,
      'value': value,
    };
  }
}

class SummaryDimensionKey {
  static const eventStatus = SummaryDimensionKey._('EventStatus');

  final String value;

  const SummaryDimensionKey._(this.value);

  static const values = [eventStatus];

  static SummaryDimensionKey fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SummaryDimensionKey._(value));

  @override
  bool operator ==(other) =>
      other is SummaryDimensionKey && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A filter to apply when listing automation events.
class AutomationEventFilter {
  /// The name of the filter to apply.
  final AutomationEventFilterName name;

  /// The values to use for the specified filter.
  final List<String> values;

  AutomationEventFilter({
    required this.name,
    required this.values,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      'name': name.value,
      'values': values,
    };
  }
}

class AutomationEventFilterName {
  static const accountId = AutomationEventFilterName._('AccountId');
  static const resourceType = AutomationEventFilterName._('ResourceType');
  static const eventType = AutomationEventFilterName._('EventType');
  static const eventStatus = AutomationEventFilterName._('EventStatus');

  final String value;

  const AutomationEventFilterName._(this.value);

  static const values = [accountId, resourceType, eventType, eventStatus];

  static AutomationEventFilterName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AutomationEventFilterName._(value));

  @override
  bool operator ==(other) =>
      other is AutomationEventFilterName && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains information about a step in an automation event.
class AutomationEventStep {
  /// The timestamp when this automation event step completed execution.
  final DateTime? completedTimestamp;
  final EstimatedMonthlySavings? estimatedMonthlySavings;

  /// The ID of the automation event this step belongs to.
  final String? eventId;

  /// The unique identifier of the resource being acted upon in this step.
  final String? resourceId;

  /// The timestamp when this automation event step started execution.
  final DateTime? startTimestamp;

  /// The unique identifier for this step.
  final String? stepId;

  /// The current status of the step.
  final StepStatus? stepStatus;

  /// The type of step.
  final StepType? stepType;

  AutomationEventStep({
    this.completedTimestamp,
    this.estimatedMonthlySavings,
    this.eventId,
    this.resourceId,
    this.startTimestamp,
    this.stepId,
    this.stepStatus,
    this.stepType,
  });

  factory AutomationEventStep.fromJson(Map<String, dynamic> json) {
    return AutomationEventStep(
      completedTimestamp: timeStampFromJson(json['completedTimestamp']),
      estimatedMonthlySavings: json['estimatedMonthlySavings'] != null
          ? EstimatedMonthlySavings.fromJson(
              json['estimatedMonthlySavings'] as Map<String, dynamic>)
          : null,
      eventId: json['eventId'] as String?,
      resourceId: json['resourceId'] as String?,
      startTimestamp: timeStampFromJson(json['startTimestamp']),
      stepId: json['stepId'] as String?,
      stepStatus: (json['stepStatus'] as String?)?.let(StepStatus.fromString),
      stepType: (json['stepType'] as String?)?.let(StepType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final completedTimestamp = this.completedTimestamp;
    final estimatedMonthlySavings = this.estimatedMonthlySavings;
    final eventId = this.eventId;
    final resourceId = this.resourceId;
    final startTimestamp = this.startTimestamp;
    final stepId = this.stepId;
    final stepStatus = this.stepStatus;
    final stepType = this.stepType;
    return {
      if (completedTimestamp != null)
        'completedTimestamp': unixTimestampToJson(completedTimestamp),
      if (estimatedMonthlySavings != null)
        'estimatedMonthlySavings': estimatedMonthlySavings,
      if (eventId != null) 'eventId': eventId,
      if (resourceId != null) 'resourceId': resourceId,
      if (startTimestamp != null)
        'startTimestamp': unixTimestampToJson(startTimestamp),
      if (stepId != null) 'stepId': stepId,
      if (stepStatus != null) 'stepStatus': stepStatus.value,
      if (stepType != null) 'stepType': stepType.value,
    };
  }
}

class StepType {
  static const createEbsSnapshot = StepType._('CreateEbsSnapshot');
  static const deleteEbsVolume = StepType._('DeleteEbsVolume');
  static const modifyEbsVolume = StepType._('ModifyEbsVolume');
  static const createEbsVolume = StepType._('CreateEbsVolume');

  final String value;

  const StepType._(this.value);

  static const values = [
    createEbsSnapshot,
    deleteEbsVolume,
    modifyEbsVolume,
    createEbsVolume
  ];

  static StepType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => StepType._(value));

  @override
  bool operator ==(other) => other is StepType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class StepStatus {
  static const ready = StepStatus._('Ready');
  static const inProgress = StepStatus._('InProgress');
  static const complete = StepStatus._('Complete');
  static const failed = StepStatus._('Failed');

  final String value;

  const StepStatus._(this.value);

  static const values = [ready, inProgress, complete, failed];

  static StepStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => StepStatus._(value));

  @override
  bool operator ==(other) => other is StepStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains information about an automation event.
class AutomationEvent {
  /// The Amazon Web Services account ID associated with the automation event.
  final String? accountId;

  /// The timestamp when the automation event completed.
  final DateTime? completedTimestamp;

  /// The timestamp when the automation event was created.
  final DateTime? createdTimestamp;

  /// The estimated monthly cost savings associated with this automation event.
  final EstimatedMonthlySavings? estimatedMonthlySavings;

  /// A description of the automation event.
  final String? eventDescription;

  /// The unique identifier for the automation event.
  final String? eventId;

  /// The current status of the automation event.
  final EventStatus? eventStatus;

  /// The reason for the current event status.
  final String? eventStatusReason;

  /// The type of automation event.
  final EventType? eventType;

  /// The ID of the recommended action associated with this automation event.
  final String? recommendedActionId;

  /// The Amazon Web Services Region where the automation event occurred.
  final String? region;

  /// The Amazon Resource Name (ARN) of the resource affected by the automation
  /// event.
  final String? resourceArn;

  /// The ID of the resource affected by the automation event.
  final String? resourceId;

  /// The type of resource affected by the automation event.
  final ResourceType? resourceType;

  /// The ID of the automation rule that triggered this event.
  final String? ruleId;

  AutomationEvent({
    this.accountId,
    this.completedTimestamp,
    this.createdTimestamp,
    this.estimatedMonthlySavings,
    this.eventDescription,
    this.eventId,
    this.eventStatus,
    this.eventStatusReason,
    this.eventType,
    this.recommendedActionId,
    this.region,
    this.resourceArn,
    this.resourceId,
    this.resourceType,
    this.ruleId,
  });

  factory AutomationEvent.fromJson(Map<String, dynamic> json) {
    return AutomationEvent(
      accountId: json['accountId'] as String?,
      completedTimestamp: timeStampFromJson(json['completedTimestamp']),
      createdTimestamp: timeStampFromJson(json['createdTimestamp']),
      estimatedMonthlySavings: json['estimatedMonthlySavings'] != null
          ? EstimatedMonthlySavings.fromJson(
              json['estimatedMonthlySavings'] as Map<String, dynamic>)
          : null,
      eventDescription: json['eventDescription'] as String?,
      eventId: json['eventId'] as String?,
      eventStatus:
          (json['eventStatus'] as String?)?.let(EventStatus.fromString),
      eventStatusReason: json['eventStatusReason'] as String?,
      eventType: (json['eventType'] as String?)?.let(EventType.fromString),
      recommendedActionId: json['recommendedActionId'] as String?,
      region: json['region'] as String?,
      resourceArn: json['resourceArn'] as String?,
      resourceId: json['resourceId'] as String?,
      resourceType:
          (json['resourceType'] as String?)?.let(ResourceType.fromString),
      ruleId: json['ruleId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final completedTimestamp = this.completedTimestamp;
    final createdTimestamp = this.createdTimestamp;
    final estimatedMonthlySavings = this.estimatedMonthlySavings;
    final eventDescription = this.eventDescription;
    final eventId = this.eventId;
    final eventStatus = this.eventStatus;
    final eventStatusReason = this.eventStatusReason;
    final eventType = this.eventType;
    final recommendedActionId = this.recommendedActionId;
    final region = this.region;
    final resourceArn = this.resourceArn;
    final resourceId = this.resourceId;
    final resourceType = this.resourceType;
    final ruleId = this.ruleId;
    return {
      if (accountId != null) 'accountId': accountId,
      if (completedTimestamp != null)
        'completedTimestamp': unixTimestampToJson(completedTimestamp),
      if (createdTimestamp != null)
        'createdTimestamp': unixTimestampToJson(createdTimestamp),
      if (estimatedMonthlySavings != null)
        'estimatedMonthlySavings': estimatedMonthlySavings,
      if (eventDescription != null) 'eventDescription': eventDescription,
      if (eventId != null) 'eventId': eventId,
      if (eventStatus != null) 'eventStatus': eventStatus.value,
      if (eventStatusReason != null) 'eventStatusReason': eventStatusReason,
      if (eventType != null) 'eventType': eventType.value,
      if (recommendedActionId != null)
        'recommendedActionId': recommendedActionId,
      if (region != null) 'region': region,
      if (resourceArn != null) 'resourceArn': resourceArn,
      if (resourceId != null) 'resourceId': resourceId,
      if (resourceType != null) 'resourceType': resourceType.value,
      if (ruleId != null) 'ruleId': ruleId,
    };
  }
}

/// Event type enumeration
class EventType {
  static const snapshotAndDeleteUnattachedEbsVolume =
      EventType._('SnapshotAndDeleteUnattachedEbsVolume');
  static const upgradeEbsVolumeType = EventType._('UpgradeEbsVolumeType');

  final String value;

  const EventType._(this.value);

  static const values = [
    snapshotAndDeleteUnattachedEbsVolume,
    upgradeEbsVolumeType
  ];

  static EventType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => EventType._(value));

  @override
  bool operator ==(other) => other is EventType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains information about an Amazon Web Services account's enrollment and
/// association status with Compute Optimizer Automation.
class AccountInfo {
  /// The ID of the Amazon Web Services account.
  final String accountId;

  /// The timestamp when the account's Automation enrollment status was last
  /// updated.
  final DateTime lastUpdatedTimestamp;

  /// Specifies whether the management account can create Automation rules that
  /// implement optimization actions for this account.
  final OrganizationRuleMode organizationRuleMode;

  /// The enrollment status of the account: Active, Inactive, Pending, or Failed.
  final EnrollmentStatus status;

  /// The reason for the current Automation enrollment status.
  final String? statusReason;

  AccountInfo({
    required this.accountId,
    required this.lastUpdatedTimestamp,
    required this.organizationRuleMode,
    required this.status,
    this.statusReason,
  });

  factory AccountInfo.fromJson(Map<String, dynamic> json) {
    return AccountInfo(
      accountId: (json['accountId'] as String?) ?? '',
      lastUpdatedTimestamp:
          nonNullableTimeStampFromJson(json['lastUpdatedTimestamp'] ?? 0),
      organizationRuleMode: OrganizationRuleMode.fromString(
          (json['organizationRuleMode'] as String?) ?? ''),
      status: EnrollmentStatus.fromString((json['status'] as String?) ?? ''),
      statusReason: json['statusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final lastUpdatedTimestamp = this.lastUpdatedTimestamp;
    final organizationRuleMode = this.organizationRuleMode;
    final status = this.status;
    final statusReason = this.statusReason;
    return {
      'accountId': accountId,
      'lastUpdatedTimestamp': unixTimestampToJson(lastUpdatedTimestamp),
      'organizationRuleMode': organizationRuleMode.value,
      'status': status.value,
      if (statusReason != null) 'statusReason': statusReason,
    };
  }
}

class OrganizationRuleMode {
  static const anyAllowed = OrganizationRuleMode._('AnyAllowed');
  static const noneAllowed = OrganizationRuleMode._('NoneAllowed');

  final String value;

  const OrganizationRuleMode._(this.value);

  static const values = [anyAllowed, noneAllowed];

  static OrganizationRuleMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => OrganizationRuleMode._(value));

  @override
  bool operator ==(other) =>
      other is OrganizationRuleMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class ForbiddenException extends _s.GenericAwsException {
  ForbiddenException({String? type, String? message})
      : super(type: type, code: 'ForbiddenException', message: message);
}

class IdempotencyTokenInUseException extends _s.GenericAwsException {
  IdempotencyTokenInUseException({String? type, String? message})
      : super(
            type: type,
            code: 'IdempotencyTokenInUseException',
            message: message);
}

class IdempotentParameterMismatchException extends _s.GenericAwsException {
  IdempotentParameterMismatchException({String? type, String? message})
      : super(
            type: type,
            code: 'IdempotentParameterMismatchException',
            message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class InvalidParameterValueException extends _s.GenericAwsException {
  InvalidParameterValueException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidParameterValueException',
            message: message);
}

class NotManagementAccountException extends _s.GenericAwsException {
  NotManagementAccountException({String? type, String? message})
      : super(
            type: type,
            code: 'NotManagementAccountException',
            message: message);
}

class OptInRequiredException extends _s.GenericAwsException {
  OptInRequiredException({String? type, String? message})
      : super(type: type, code: 'OptInRequiredException', message: message);
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

class ServiceUnavailableException extends _s.GenericAwsException {
  ServiceUnavailableException({String? type, String? message})
      : super(
            type: type, code: 'ServiceUnavailableException', message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'ForbiddenException': (type, message) =>
      ForbiddenException(type: type, message: message),
  'IdempotencyTokenInUseException': (type, message) =>
      IdempotencyTokenInUseException(type: type, message: message),
  'IdempotentParameterMismatchException': (type, message) =>
      IdempotentParameterMismatchException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'InvalidParameterValueException': (type, message) =>
      InvalidParameterValueException(type: type, message: message),
  'NotManagementAccountException': (type, message) =>
      NotManagementAccountException(type: type, message: message),
  'OptInRequiredException': (type, message) =>
      OptInRequiredException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ServiceUnavailableException': (type, message) =>
      ServiceUnavailableException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
};
