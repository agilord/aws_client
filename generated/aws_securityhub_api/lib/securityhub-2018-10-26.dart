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
        Uint8ListConverter,
        Uint8ListListConverter,
        rfc822FromJson,
        rfc822ToJson,
        iso8601FromJson,
        iso8601ToJson,
        unixTimestampFromJson,
        unixTimestampToJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

part 'securityhub-2018-10-26.g.dart';

/// Security Hub provides you with a comprehensive view of the security state of
/// your AWS environment and resources. It also provides you with the readiness
/// status of your environment based on controls from supported security
/// standards. Security Hub collects security data from AWS accounts, services,
/// and integrated third-party products and helps you analyze security trends in
/// your environment to identify the highest priority security issues. For more
/// information about Security Hub, see the <i> <a
/// href="https://docs.aws.amazon.com/securityhub/latest/userguide/what-is-securityhub.html">AWS
/// Security Hub User Guide</a> </i>.
///
/// When you use operations in the Security Hub API, the requests are executed
/// only in the AWS Region that is currently active or in the specific AWS
/// Region that you specify in your request. Any configuration or settings
/// change that results from the operation is applied only to that Region. To
/// make the same change in other Regions, execute the same command for each
/// Region to apply the change to.
///
/// For example, if your Region is set to <code>us-west-2</code>, when you use
/// <code> <a>CreateMembers</a> </code> to add a member account to Security Hub,
/// the association of the member account with the master account is created
/// only in the <code>us-west-2</code> Region. Security Hub must be enabled for
/// the member account in the same Region that the invitation was sent from.
///
/// The following throttling limits apply to using Security Hub API operations.
///
/// <ul>
/// <li>
/// <code> <a>GetFindings</a> </code> - <code>RateLimit</code> of 3 requests per
/// second. <code>BurstLimit</code> of 6 requests per second.
/// </li>
/// <li>
/// <code> <a>UpdateFindings</a> </code> - <code>RateLimit</code> of 1 request
/// per second. <code>BurstLimit</code> of 5 requests per second.
/// </li>
/// <li>
/// All other operations - <code>RateLimit</code> of 10 requests per second.
/// <code>BurstLimit</code> of 30 requests per second.
/// </li>
/// </ul>
class SecurityHub {
  final _s.RestJsonProtocol _protocol;
  SecurityHub({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: 'securityhub',
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Accepts the invitation to be a member account and be monitored by the
  /// Security Hub master account that the invitation was sent from.
  ///
  /// When the member account accepts the invitation, permission is granted to
  /// the master account to view findings generated in the member account.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidInputException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidAccessException].
  ///
  /// Parameter [invitationId] :
  /// The ID of the invitation sent from the Security Hub master account.
  ///
  /// Parameter [masterId] :
  /// The account ID of the Security Hub master account that sent the
  /// invitation.
  Future<void> acceptInvitation({
    @_s.required String invitationId,
    @_s.required String masterId,
  }) async {
    ArgumentError.checkNotNull(invitationId, 'invitationId');
    _s.validateStringPattern(
      'invitationId',
      invitationId,
      r'''.*\S.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(masterId, 'masterId');
    _s.validateStringPattern(
      'masterId',
      masterId,
      r'''.*\S.*''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'InvitationId': invitationId,
      'MasterId': masterId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/master',
      exceptionFnMap: _exceptionFns,
    );
    return AcceptInvitationResponse.fromJson(response);
  }

  /// Disables the standards specified by the provided
  /// <code>StandardsSubscriptionArns</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards.html">Security
  /// Standards</a> section of the <i>AWS Security Hub User Guide</i>.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidInputException].
  /// May throw [InvalidAccessException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [standardsSubscriptionArns] :
  /// The ARNs of the standards subscriptions to disable.
  Future<BatchDisableStandardsResponse> batchDisableStandards({
    @_s.required List<String> standardsSubscriptionArns,
  }) async {
    ArgumentError.checkNotNull(
        standardsSubscriptionArns, 'standardsSubscriptionArns');
    final $payload = <String, dynamic>{
      'StandardsSubscriptionArns': standardsSubscriptionArns,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/standards/deregister',
      exceptionFnMap: _exceptionFns,
    );
    return BatchDisableStandardsResponse.fromJson(response);
  }

  /// Enables the standards specified by the provided <code>StandardsArn</code>.
  /// To obtain the ARN for a standard, use the <code> <a>DescribeStandards</a>
  /// </code> operation.
  ///
  /// For more information, see the <a
  /// href="https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards.html">Security
  /// Standards</a> section of the <i>AWS Security Hub User Guide</i>.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidInputException].
  /// May throw [InvalidAccessException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [standardsSubscriptionRequests] :
  /// The list of standards checks to enable.
  Future<BatchEnableStandardsResponse> batchEnableStandards({
    @_s.required
        List<StandardsSubscriptionRequest> standardsSubscriptionRequests,
  }) async {
    ArgumentError.checkNotNull(
        standardsSubscriptionRequests, 'standardsSubscriptionRequests');
    final $payload = <String, dynamic>{
      'StandardsSubscriptionRequests': standardsSubscriptionRequests,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/standards/register',
      exceptionFnMap: _exceptionFns,
    );
    return BatchEnableStandardsResponse.fromJson(response);
  }

  /// Imports security findings generated from an integrated third-party product
  /// into Security Hub. This action is requested by the integrated product to
  /// import its findings into Security Hub.
  ///
  /// The maximum allowed size for a finding is 240 Kb. An error is returned for
  /// any finding larger than 240 Kb.
  ///
  /// After a finding is created, <code>BatchImportFindings</code> cannot be
  /// used to update the following finding fields and objects, which Security
  /// Hub customers use to manage their investigation workflow.
  ///
  /// <ul>
  /// <li>
  /// <code>Confidence</code>
  /// </li>
  /// <li>
  /// <code>Criticality</code>
  /// </li>
  /// <li>
  /// <code>Note</code>
  /// </li>
  /// <li>
  /// <code>RelatedFindings</code>
  /// </li>
  /// <li>
  /// <code>Severity</code>
  /// </li>
  /// <li>
  /// <code>Types</code>
  /// </li>
  /// <li>
  /// <code>UserDefinedFields</code>
  /// </li>
  /// <li>
  /// <code>VerificationState</code>
  /// </li>
  /// <li>
  /// <code>Workflow</code>
  /// </li>
  /// </ul>
  ///
  /// May throw [InternalException].
  /// May throw [InvalidInputException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidAccessException].
  ///
  /// Parameter [findings] :
  /// A list of findings to import. To successfully import a finding, it must
  /// follow the <a
  /// href="https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-findings-format.html">AWS
  /// Security Finding Format</a>. Maximum of 100 findings per request.
  Future<BatchImportFindingsResponse> batchImportFindings({
    @_s.required List<AwsSecurityFinding> findings,
  }) async {
    ArgumentError.checkNotNull(findings, 'findings');
    final $payload = <String, dynamic>{
      'Findings': findings,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/findings/import',
      exceptionFnMap: _exceptionFns,
    );
    return BatchImportFindingsResponse.fromJson(response);
  }

  /// Used by Security Hub customers to update information about their
  /// investigation into a finding. Requested by master accounts or member
  /// accounts. Master accounts can update findings for their account and their
  /// member accounts. Member accounts can update findings for their account.
  ///
  /// Updates from <code>BatchUpdateFindings</code> do not affect the value of
  /// <code>UpdatedAt</code> for a finding.
  ///
  /// Master accounts can use <code>BatchUpdateFindings</code> to update the
  /// following finding fields and objects.
  ///
  /// <ul>
  /// <li>
  /// <code>Confidence</code>
  /// </li>
  /// <li>
  /// <code>Criticality</code>
  /// </li>
  /// <li>
  /// <code>Note</code>
  /// </li>
  /// <li>
  /// <code>RelatedFindings</code>
  /// </li>
  /// <li>
  /// <code>Severity</code>
  /// </li>
  /// <li>
  /// <code>Types</code>
  /// </li>
  /// <li>
  /// <code>UserDefinedFields</code>
  /// </li>
  /// <li>
  /// <code>VerificationState</code>
  /// </li>
  /// <li>
  /// <code>Workflow</code>
  /// </li>
  /// </ul>
  /// Member accounts can only use <code>BatchUpdateFindings</code> to update
  /// the Note object.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidInputException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidAccessException].
  ///
  /// Parameter [findingIdentifiers] :
  /// The list of findings to update. <code>BatchUpdateFindings</code> can be
  /// used to update up to 100 findings at a time.
  ///
  /// For each finding, the list provides the finding identifier and the ARN of
  /// the finding provider.
  ///
  /// Parameter [confidence] :
  /// The updated value for the finding confidence. Confidence is defined as the
  /// likelihood that a finding accurately identifies the behavior or issue that
  /// it was intended to identify.
  ///
  /// Confidence is scored on a 0-100 basis using a ratio scale, where 0 means
  /// zero percent confidence and 100 means 100 percent confidence.
  ///
  /// Parameter [criticality] :
  /// The updated value for the level of importance assigned to the resources
  /// associated with the findings.
  ///
  /// A score of 0 means that the underlying resources have no criticality, and
  /// a score of 100 is reserved for the most critical resources.
  ///
  /// Parameter [relatedFindings] :
  /// A list of findings that are related to the updated findings.
  ///
  /// Parameter [severity] :
  /// Used to update the finding severity.
  ///
  /// Parameter [types] :
  /// One or more finding types in the format of namespace/category/classifier
  /// that classify a finding.
  ///
  /// Valid namespace values are as follows.
  ///
  /// <ul>
  /// <li>
  /// Software and Configuration Checks
  /// </li>
  /// <li>
  /// TTPs
  /// </li>
  /// <li>
  /// Effects
  /// </li>
  /// <li>
  /// Unusual Behaviors
  /// </li>
  /// <li>
  /// Sensitive Data Identifications
  /// </li>
  /// </ul>
  ///
  /// Parameter [userDefinedFields] :
  /// A list of name/value string pairs associated with the finding. These are
  /// custom, user-defined fields added to a finding.
  ///
  /// Parameter [verificationState] :
  /// Indicates the veracity of a finding.
  ///
  /// The available values for <code>VerificationState</code> are as follows.
  ///
  /// <ul>
  /// <li>
  /// <code>UNKNOWN</code> – The default disposition of a security finding
  /// </li>
  /// <li>
  /// <code>TRUE_POSITIVE</code> – The security finding is confirmed
  /// </li>
  /// <li>
  /// <code>FALSE_POSITIVE</code> – The security finding was determined to be a
  /// false alarm
  /// </li>
  /// <li>
  /// <code>BENIGN_POSITIVE</code> – A special case of
  /// <code>TRUE_POSITIVE</code> where the finding doesn't pose any threat, is
  /// expected, or both
  /// </li>
  /// </ul>
  ///
  /// Parameter [workflow] :
  /// Used to update the workflow status of a finding.
  ///
  /// The workflow status indicates the progress of the investigation into the
  /// finding.
  Future<BatchUpdateFindingsResponse> batchUpdateFindings({
    @_s.required List<AwsSecurityFindingIdentifier> findingIdentifiers,
    int confidence,
    int criticality,
    NoteUpdate note,
    List<RelatedFinding> relatedFindings,
    SeverityUpdate severity,
    List<String> types,
    Map<String, String> userDefinedFields,
    VerificationState verificationState,
    WorkflowUpdate workflow,
  }) async {
    ArgumentError.checkNotNull(findingIdentifiers, 'findingIdentifiers');
    _s.validateNumRange(
      'confidence',
      confidence,
      0,
      100,
    );
    _s.validateNumRange(
      'criticality',
      criticality,
      0,
      100,
    );
    final $payload = <String, dynamic>{
      'FindingIdentifiers': findingIdentifiers,
      'Confidence': confidence,
      'Criticality': criticality,
      'Note': note,
      'RelatedFindings': relatedFindings,
      'Severity': severity,
      'Types': types,
      'UserDefinedFields': userDefinedFields,
      'VerificationState': verificationState?.toValue(),
      'Workflow': workflow,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/findings/batchupdate',
      exceptionFnMap: _exceptionFns,
    );
    return BatchUpdateFindingsResponse.fromJson(response);
  }

  /// Creates a custom action target in Security Hub.
  ///
  /// You can use custom actions on findings and insights in Security Hub to
  /// trigger target actions in Amazon CloudWatch Events.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidInputException].
  /// May throw [InvalidAccessException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceConflictException].
  ///
  /// Parameter [description] :
  /// The description for the custom action target.
  ///
  /// Parameter [id] :
  /// The ID for the custom action target.
  ///
  /// Parameter [name] :
  /// The name of the custom action target.
  Future<CreateActionTargetResponse> createActionTarget({
    @_s.required String description,
    @_s.required String id,
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(description, 'description');
    _s.validateStringPattern(
      'description',
      description,
      r'''.*\S.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringPattern(
      'id',
      id,
      r'''.*\S.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringPattern(
      'name',
      name,
      r'''.*\S.*''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'Description': description,
      'Id': id,
      'Name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/actionTargets',
      exceptionFnMap: _exceptionFns,
    );
    return CreateActionTargetResponse.fromJson(response);
  }

  /// Creates a custom insight in Security Hub. An insight is a consolidation of
  /// findings that relate to a security issue that requires attention or
  /// remediation.
  ///
  /// To group the related findings in the insight, use the
  /// <code>GroupByAttribute</code>.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidInputException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidAccessException].
  /// May throw [ResourceConflictException].
  ///
  /// Parameter [filters] :
  /// One or more attributes used to filter the findings included in the
  /// insight. The insight only includes findings that match the criteria
  /// defined in the filters.
  ///
  /// Parameter [groupByAttribute] :
  /// The attribute used to group the findings for the insight. The grouping
  /// attribute identifies the type of item that the insight applies to. For
  /// example, if an insight is grouped by resource identifier, then the insight
  /// produces a list of resource identifiers.
  ///
  /// Parameter [name] :
  /// The name of the custom insight to create.
  Future<CreateInsightResponse> createInsight({
    @_s.required AwsSecurityFindingFilters filters,
    @_s.required String groupByAttribute,
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(filters, 'filters');
    ArgumentError.checkNotNull(groupByAttribute, 'groupByAttribute');
    _s.validateStringPattern(
      'groupByAttribute',
      groupByAttribute,
      r'''.*\S.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringPattern(
      'name',
      name,
      r'''.*\S.*''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'Filters': filters,
      'GroupByAttribute': groupByAttribute,
      'Name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/insights',
      exceptionFnMap: _exceptionFns,
    );
    return CreateInsightResponse.fromJson(response);
  }

  /// Creates a member association in Security Hub between the specified
  /// accounts and the account used to make the request, which is the master
  /// account. To successfully create a member, you must use this action from an
  /// account that already has Security Hub enabled. To enable Security Hub, you
  /// can use the <code> <a>EnableSecurityHub</a> </code> operation.
  ///
  /// After you use <code>CreateMembers</code> to create member account
  /// associations in Security Hub, you must use the <code> <a>InviteMembers</a>
  /// </code> operation to invite the accounts to enable Security Hub and become
  /// member accounts in Security Hub.
  ///
  /// If the account owner accepts the invitation, the account becomes a member
  /// account in Security Hub, and a permission policy is added that permits the
  /// master account to view the findings generated in the member account. When
  /// Security Hub is enabled in the invited account, findings start to be sent
  /// to both the member and master accounts.
  ///
  /// To remove the association between the master and member accounts, use the
  /// <code> <a>DisassociateFromMasterAccount</a> </code> or <code>
  /// <a>DisassociateMembers</a> </code> operation.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidInputException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidAccessException].
  /// May throw [ResourceConflictException].
  ///
  /// Parameter [accountDetails] :
  /// The list of accounts to associate with the Security Hub master account.
  /// For each account, the list includes the account ID and the email address.
  Future<CreateMembersResponse> createMembers({
    List<AccountDetails> accountDetails,
  }) async {
    final $payload = <String, dynamic>{
      'AccountDetails': accountDetails,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/members',
      exceptionFnMap: _exceptionFns,
    );
    return CreateMembersResponse.fromJson(response);
  }

  /// Declines invitations to become a member account.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidInputException].
  /// May throw [InvalidAccessException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [accountIds] :
  /// The list of account IDs for the accounts from which to decline the
  /// invitations to Security Hub.
  Future<DeclineInvitationsResponse> declineInvitations({
    @_s.required List<String> accountIds,
  }) async {
    ArgumentError.checkNotNull(accountIds, 'accountIds');
    final $payload = <String, dynamic>{
      'AccountIds': accountIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/invitations/decline',
      exceptionFnMap: _exceptionFns,
    );
    return DeclineInvitationsResponse.fromJson(response);
  }

  /// Deletes a custom action target from Security Hub.
  ///
  /// Deleting a custom action target does not affect any findings or insights
  /// that were already sent to Amazon CloudWatch Events using the custom
  /// action.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidInputException].
  /// May throw [InvalidAccessException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [actionTargetArn] :
  /// The ARN of the custom action target to delete.
  Future<DeleteActionTargetResponse> deleteActionTarget({
    @_s.required String actionTargetArn,
  }) async {
    ArgumentError.checkNotNull(actionTargetArn, 'actionTargetArn');
    _s.validateStringPattern(
      'actionTargetArn',
      actionTargetArn,
      r'''.*\S.*''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{};
    final response = await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri:
          '/actionTargets/${Uri.encodeComponent(actionTargetArn.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteActionTargetResponse.fromJson(response);
  }

  /// Deletes the insight specified by the <code>InsightArn</code>.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidInputException].
  /// May throw [InvalidAccessException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [insightArn] :
  /// The ARN of the insight to delete.
  Future<DeleteInsightResponse> deleteInsight({
    @_s.required String insightArn,
  }) async {
    ArgumentError.checkNotNull(insightArn, 'insightArn');
    _s.validateStringPattern(
      'insightArn',
      insightArn,
      r'''.*\S.*''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{};
    final response = await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri: '/insights/${Uri.encodeComponent(insightArn.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteInsightResponse.fromJson(response);
  }

  /// Deletes invitations received by the AWS account to become a member
  /// account.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidInputException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidAccessException].
  ///
  /// Parameter [accountIds] :
  /// The list of the account IDs that sent the invitations to delete.
  Future<DeleteInvitationsResponse> deleteInvitations({
    @_s.required List<String> accountIds,
  }) async {
    ArgumentError.checkNotNull(accountIds, 'accountIds');
    final $payload = <String, dynamic>{
      'AccountIds': accountIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/invitations/delete',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteInvitationsResponse.fromJson(response);
  }

  /// Deletes the specified member accounts from Security Hub.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidInputException].
  /// May throw [InvalidAccessException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [accountIds] :
  /// The list of account IDs for the member accounts to delete.
  Future<DeleteMembersResponse> deleteMembers({
    List<String> accountIds,
  }) async {
    final $payload = <String, dynamic>{
      'AccountIds': accountIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/members/delete',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteMembersResponse.fromJson(response);
  }

  /// Returns a list of the custom action targets in Security Hub in your
  /// account.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidInputException].
  /// May throw [InvalidAccessException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [actionTargetArns] :
  /// A list of custom action target ARNs for the custom action targets to
  /// retrieve.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// The token that is required for pagination. On your first call to the
  /// <code>DescribeActionTargets</code> operation, set the value of this
  /// parameter to <code>NULL</code>.
  ///
  /// For subsequent calls to the operation, to continue listing data, set the
  /// value of this parameter to the value returned from the previous response.
  Future<DescribeActionTargetsResponse> describeActionTargets({
    List<String> actionTargetArns,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      'ActionTargetArns': actionTargetArns,
      'MaxResults': maxResults,
      'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/actionTargets/get',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeActionTargetsResponse.fromJson(response);
  }

  /// Returns details about the Hub resource in your account, including the
  /// <code>HubArn</code> and the time when you enabled Security Hub.
  ///
  /// May throw [InternalException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidAccessException].
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [hubArn] :
  /// The ARN of the Hub resource to retrieve.
  Future<DescribeHubResponse> describeHub({
    String hubArn,
  }) async {
    _s.validateStringPattern(
      'hubArn',
      hubArn,
      r'''.*\S.*''',
    );
    var _query = '';
    _query = '?${[
      if (hubArn != null) _s.toQueryParam('HubArn', hubArn),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/accounts$_query',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeHubResponse.fromJson(response);
  }

  /// Returns information about the available products that you can subscribe to
  /// and integrate with Security Hub in order to consolidate findings.
  ///
  /// May throw [InternalException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidAccessException].
  /// May throw [InvalidInputException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// The token that is required for pagination. On your first call to the
  /// <code>DescribeProducts</code> operation, set the value of this parameter
  /// to <code>NULL</code>.
  ///
  /// For subsequent calls to the operation, to continue listing data, set the
  /// value of this parameter to the value returned from the previous response.
  Future<DescribeProductsResponse> describeProducts({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    var _query = '';
    _query = '?${[
      if (maxResults != null) _s.toQueryParam('MaxResults', maxResults),
      if (nextToken != null) _s.toQueryParam('NextToken', nextToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/products$_query',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeProductsResponse.fromJson(response);
  }

  /// Returns a list of the available standards in Security Hub.
  ///
  /// For each standard, the results include the standard ARN, the name, and a
  /// description.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidInputException].
  /// May throw [InvalidAccessException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of standards to return.
  ///
  /// Parameter [nextToken] :
  /// The token that is required for pagination. On your first call to the
  /// <code>DescribeStandards</code> operation, set the value of this parameter
  /// to <code>NULL</code>.
  ///
  /// For subsequent calls to the operation, to continue listing data, set the
  /// value of this parameter to the value returned from the previous response.
  Future<DescribeStandardsResponse> describeStandards({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    var _query = '';
    _query = '?${[
      if (maxResults != null) _s.toQueryParam('MaxResults', maxResults),
      if (nextToken != null) _s.toQueryParam('NextToken', nextToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/standards$_query',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeStandardsResponse.fromJson(response);
  }

  /// Returns a list of security standards controls.
  ///
  /// For each control, the results include information about whether it is
  /// currently enabled, the severity, and a link to remediation information.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidInputException].
  /// May throw [InvalidAccessException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [standardsSubscriptionArn] :
  /// The ARN of a resource that represents your subscription to a supported
  /// standard.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of security standard controls to return.
  ///
  /// Parameter [nextToken] :
  /// The token that is required for pagination. On your first call to the
  /// <code>DescribeStandardsControls</code> operation, set the value of this
  /// parameter to <code>NULL</code>.
  ///
  /// For subsequent calls to the operation, to continue listing data, set the
  /// value of this parameter to the value returned from the previous response.
  Future<DescribeStandardsControlsResponse> describeStandardsControls({
    @_s.required String standardsSubscriptionArn,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(
        standardsSubscriptionArn, 'standardsSubscriptionArn');
    _s.validateStringPattern(
      'standardsSubscriptionArn',
      standardsSubscriptionArn,
      r'''.*\S.*''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    var _query = '';
    _query = '?${[
      if (maxResults != null) _s.toQueryParam('MaxResults', maxResults),
      if (nextToken != null) _s.toQueryParam('NextToken', nextToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/standards/controls/${Uri.encodeComponent(standardsSubscriptionArn.toString())}$_query',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeStandardsControlsResponse.fromJson(response);
  }

  /// Disables the integration of the specified product with Security Hub. After
  /// the integration is disabled, findings from that product are no longer sent
  /// to Security Hub.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidAccessException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [productSubscriptionArn] :
  /// The ARN of the integrated product to disable the integration for.
  Future<void> disableImportFindingsForProduct({
    @_s.required String productSubscriptionArn,
  }) async {
    ArgumentError.checkNotNull(
        productSubscriptionArn, 'productSubscriptionArn');
    _s.validateStringPattern(
      'productSubscriptionArn',
      productSubscriptionArn,
      r'''.*\S.*''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{};
    final response = await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri:
          '/productSubscriptions/${Uri.encodeComponent(productSubscriptionArn.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return DisableImportFindingsForProductResponse.fromJson(response);
  }

  /// Disables Security Hub in your account only in the current Region. To
  /// disable Security Hub in all Regions, you must submit one request per
  /// Region where you have enabled Security Hub.
  ///
  /// When you disable Security Hub for a master account, it doesn't disable
  /// Security Hub for any associated member accounts.
  ///
  /// When you disable Security Hub, your existing findings and insights and any
  /// Security Hub configuration settings are deleted after 90 days and cannot
  /// be recovered. Any standards that were enabled are disabled, and your
  /// master and member account associations are removed.
  ///
  /// If you want to save your existing findings, you must export them before
  /// you disable Security Hub.
  ///
  /// May throw [InternalException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidAccessException].
  /// May throw [ResourceNotFoundException].
  Future<void> disableSecurityHub() async {
    final $payload = <String, dynamic>{};
    final response = await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri: '/accounts',
      exceptionFnMap: _exceptionFns,
    );
    return DisableSecurityHubResponse.fromJson(response);
  }

  /// Disassociates the current Security Hub member account from the associated
  /// master account.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidInputException].
  /// May throw [InvalidAccessException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  Future<void> disassociateFromMasterAccount() async {
    final $payload = <String, dynamic>{};
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/master/disassociate',
      exceptionFnMap: _exceptionFns,
    );
    return DisassociateFromMasterAccountResponse.fromJson(response);
  }

  /// Disassociates the specified member accounts from the associated master
  /// account.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidInputException].
  /// May throw [InvalidAccessException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [accountIds] :
  /// The account IDs of the member accounts to disassociate from the master
  /// account.
  Future<void> disassociateMembers({
    List<String> accountIds,
  }) async {
    final $payload = <String, dynamic>{
      'AccountIds': accountIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/members/disassociate',
      exceptionFnMap: _exceptionFns,
    );
    return DisassociateMembersResponse.fromJson(response);
  }

  /// Enables the integration of a partner product with Security Hub. Integrated
  /// products send findings to Security Hub.
  ///
  /// When you enable a product integration, a permission policy that grants
  /// permission for the product to send findings to Security Hub is applied.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidInputException].
  /// May throw [InvalidAccessException].
  /// May throw [ResourceConflictException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [productArn] :
  /// The ARN of the product to enable the integration for.
  Future<EnableImportFindingsForProductResponse>
      enableImportFindingsForProduct({
    @_s.required String productArn,
  }) async {
    ArgumentError.checkNotNull(productArn, 'productArn');
    _s.validateStringPattern(
      'productArn',
      productArn,
      r'''.*\S.*''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'ProductArn': productArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/productSubscriptions',
      exceptionFnMap: _exceptionFns,
    );
    return EnableImportFindingsForProductResponse.fromJson(response);
  }

  /// Enables Security Hub for your account in the current Region or the Region
  /// you specify in the request.
  ///
  /// When you enable Security Hub, you grant to Security Hub the permissions
  /// necessary to gather findings from other services that are integrated with
  /// Security Hub.
  ///
  /// When you use the <code>EnableSecurityHub</code> operation to enable
  /// Security Hub, you also automatically enable the CIS AWS Foundations
  /// standard. You do not enable the Payment Card Industry Data Security
  /// Standard (PCI DSS) standard. To not enable the CIS AWS Foundations
  /// standard, set <code>EnableDefaultStandards</code> to <code>false</code>.
  ///
  /// After you enable Security Hub, to enable a standard, use the <code>
  /// <a>BatchEnableStandards</a> </code> operation. To disable a standard, use
  /// the <code> <a>BatchDisableStandards</a> </code> operation.
  ///
  /// To learn more, see <a
  /// href="https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-settingup.html">Setting
  /// Up AWS Security Hub</a> in the <i>AWS Security Hub User Guide</i>.
  ///
  /// May throw [InternalException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidAccessException].
  /// May throw [ResourceConflictException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [enableDefaultStandards] :
  /// Whether to enable the security standards that Security Hub has designated
  /// as automatically enabled. If you do not provide a value for
  /// <code>EnableDefaultStandards</code>, it is set to <code>true</code>. To
  /// not enable the automatically enabled standards, set
  /// <code>EnableDefaultStandards</code> to <code>false</code>.
  ///
  /// Parameter [tags] :
  /// The tags to add to the Hub resource when you enable Security Hub.
  Future<void> enableSecurityHub({
    bool enableDefaultStandards,
    Map<String, String> tags,
  }) async {
    final $payload = <String, dynamic>{
      'EnableDefaultStandards': enableDefaultStandards,
      'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/accounts',
      exceptionFnMap: _exceptionFns,
    );
    return EnableSecurityHubResponse.fromJson(response);
  }

  /// Returns a list of the standards that are currently enabled.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidInputException].
  /// May throw [InvalidAccessException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response.
  ///
  /// Parameter [nextToken] :
  /// The token that is required for pagination. On your first call to the
  /// <code>GetEnabledStandards</code> operation, set the value of this
  /// parameter to <code>NULL</code>.
  ///
  /// For subsequent calls to the operation, to continue listing data, set the
  /// value of this parameter to the value returned from the previous response.
  ///
  /// Parameter [standardsSubscriptionArns] :
  /// The list of the standards subscription ARNs for the standards to retrieve.
  Future<GetEnabledStandardsResponse> getEnabledStandards({
    int maxResults,
    String nextToken,
    List<String> standardsSubscriptionArns,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      'MaxResults': maxResults,
      'NextToken': nextToken,
      'StandardsSubscriptionArns': standardsSubscriptionArns,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/standards/get',
      exceptionFnMap: _exceptionFns,
    );
    return GetEnabledStandardsResponse.fromJson(response);
  }

  /// Returns a list of findings that match the specified criteria.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidInputException].
  /// May throw [InvalidAccessException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [filters] :
  /// The finding attributes used to define a condition to filter the returned
  /// findings.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of findings to return.
  ///
  /// Parameter [nextToken] :
  /// The token that is required for pagination. On your first call to the
  /// <code>GetFindings</code> operation, set the value of this parameter to
  /// <code>NULL</code>.
  ///
  /// For subsequent calls to the operation, to continue listing data, set the
  /// value of this parameter to the value returned from the previous response.
  ///
  /// Parameter [sortCriteria] :
  /// The finding attributes used to sort the list of returned findings.
  Future<GetFindingsResponse> getFindings({
    AwsSecurityFindingFilters filters,
    int maxResults,
    String nextToken,
    List<SortCriterion> sortCriteria,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      'Filters': filters,
      'MaxResults': maxResults,
      'NextToken': nextToken,
      'SortCriteria': sortCriteria,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/findings',
      exceptionFnMap: _exceptionFns,
    );
    return GetFindingsResponse.fromJson(response);
  }

  /// Lists the results of the Security Hub insight specified by the insight
  /// ARN.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidInputException].
  /// May throw [InvalidAccessException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [insightArn] :
  /// The ARN of the insight for which to return results.
  Future<GetInsightResultsResponse> getInsightResults({
    @_s.required String insightArn,
  }) async {
    ArgumentError.checkNotNull(insightArn, 'insightArn');
    _s.validateStringPattern(
      'insightArn',
      insightArn,
      r'''.*\S.*''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/insights/results/${Uri.encodeComponent(insightArn.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return GetInsightResultsResponse.fromJson(response);
  }

  /// Lists and describes insights for the specified insight ARNs.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidInputException].
  /// May throw [InvalidAccessException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [insightArns] :
  /// The ARNs of the insights to describe. If you do not provide any insight
  /// ARNs, then <code>GetInsights</code> returns all of your custom insights.
  /// It does not return any managed insights.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return in the response.
  ///
  /// Parameter [nextToken] :
  /// The token that is required for pagination. On your first call to the
  /// <code>GetInsights</code> operation, set the value of this parameter to
  /// <code>NULL</code>.
  ///
  /// For subsequent calls to the operation, to continue listing data, set the
  /// value of this parameter to the value returned from the previous response.
  Future<GetInsightsResponse> getInsights({
    List<String> insightArns,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      'InsightArns': insightArns,
      'MaxResults': maxResults,
      'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/insights/get',
      exceptionFnMap: _exceptionFns,
    );
    return GetInsightsResponse.fromJson(response);
  }

  /// Returns the count of all Security Hub membership invitations that were
  /// sent to the current member account, not including the currently accepted
  /// invitation.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidInputException].
  /// May throw [InvalidAccessException].
  /// May throw [LimitExceededException].
  Future<GetInvitationsCountResponse> getInvitationsCount() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/invitations/count',
      exceptionFnMap: _exceptionFns,
    );
    return GetInvitationsCountResponse.fromJson(response);
  }

  /// Provides the details for the Security Hub master account for the current
  /// member account.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidInputException].
  /// May throw [InvalidAccessException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  Future<GetMasterAccountResponse> getMasterAccount() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/master',
      exceptionFnMap: _exceptionFns,
    );
    return GetMasterAccountResponse.fromJson(response);
  }

  /// Returns the details for the Security Hub member accounts for the specified
  /// account IDs.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidInputException].
  /// May throw [InvalidAccessException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [accountIds] :
  /// The list of account IDs for the Security Hub member accounts to return the
  /// details for.
  Future<GetMembersResponse> getMembers({
    @_s.required List<String> accountIds,
  }) async {
    ArgumentError.checkNotNull(accountIds, 'accountIds');
    final $payload = <String, dynamic>{
      'AccountIds': accountIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/members/get',
      exceptionFnMap: _exceptionFns,
    );
    return GetMembersResponse.fromJson(response);
  }

  /// Invites other AWS accounts to become member accounts for the Security Hub
  /// master account that the invitation is sent from.
  ///
  /// Before you can use this action to invite a member, you must first use the
  /// <code> <a>CreateMembers</a> </code> action to create the member account in
  /// Security Hub.
  ///
  /// When the account owner accepts the invitation to become a member account
  /// and enables Security Hub, the master account can view the findings
  /// generated from the member account.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidInputException].
  /// May throw [InvalidAccessException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [accountIds] :
  /// The list of account IDs of the AWS accounts to invite to Security Hub as
  /// members.
  Future<InviteMembersResponse> inviteMembers({
    List<String> accountIds,
  }) async {
    final $payload = <String, dynamic>{
      'AccountIds': accountIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/members/invite',
      exceptionFnMap: _exceptionFns,
    );
    return InviteMembersResponse.fromJson(response);
  }

  /// Lists all findings-generating solutions (products) that you are subscribed
  /// to receive findings from in Security Hub.
  ///
  /// May throw [InternalException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidAccessException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return in the response.
  ///
  /// Parameter [nextToken] :
  /// The token that is required for pagination. On your first call to the
  /// <code>ListEnabledProductsForImport</code> operation, set the value of this
  /// parameter to <code>NULL</code>.
  ///
  /// For subsequent calls to the operation, to continue listing data, set the
  /// value of this parameter to the value returned from the previous response.
  Future<ListEnabledProductsForImportResponse> listEnabledProductsForImport({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    var _query = '';
    _query = '?${[
      if (maxResults != null) _s.toQueryParam('MaxResults', maxResults),
      if (nextToken != null) _s.toQueryParam('NextToken', nextToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/productSubscriptions$_query',
      exceptionFnMap: _exceptionFns,
    );
    return ListEnabledProductsForImportResponse.fromJson(response);
  }

  /// Lists all Security Hub membership invitations that were sent to the
  /// current AWS account.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidInputException].
  /// May throw [InvalidAccessException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return in the response.
  ///
  /// Parameter [nextToken] :
  /// The token that is required for pagination. On your first call to the
  /// <code>ListInvitations</code> operation, set the value of this parameter to
  /// <code>NULL</code>.
  ///
  /// For subsequent calls to the operation, to continue listing data, set the
  /// value of this parameter to the value returned from the previous response.
  Future<ListInvitationsResponse> listInvitations({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    var _query = '';
    _query = '?${[
      if (maxResults != null) _s.toQueryParam('MaxResults', maxResults),
      if (nextToken != null) _s.toQueryParam('NextToken', nextToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/invitations$_query',
      exceptionFnMap: _exceptionFns,
    );
    return ListInvitationsResponse.fromJson(response);
  }

  /// Lists details about all member accounts for the current Security Hub
  /// master account.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidInputException].
  /// May throw [InvalidAccessException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return in the response.
  ///
  /// Parameter [nextToken] :
  /// The token that is required for pagination. On your first call to the
  /// <code>ListMembers</code> operation, set the value of this parameter to
  /// <code>NULL</code>.
  ///
  /// For subsequent calls to the operation, to continue listing data, set the
  /// value of this parameter to the value returned from the previous response.
  ///
  /// Parameter [onlyAssociated] :
  /// Specifies which member accounts to include in the response based on their
  /// relationship status with the master account. The default value is
  /// <code>TRUE</code>.
  ///
  /// If <code>OnlyAssociated</code> is set to <code>TRUE</code>, the response
  /// includes member accounts whose relationship status with the master is set
  /// to <code>ENABLED</code> or <code>DISABLED</code>.
  ///
  /// If <code>OnlyAssociated</code> is set to <code>FALSE</code>, the response
  /// includes all existing member accounts.
  Future<ListMembersResponse> listMembers({
    int maxResults,
    String nextToken,
    bool onlyAssociated,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    var _query = '';
    _query = '?${[
      if (maxResults != null) _s.toQueryParam('MaxResults', maxResults),
      if (nextToken != null) _s.toQueryParam('NextToken', nextToken),
      if (onlyAssociated != null)
        _s.toQueryParam('OnlyAssociated', onlyAssociated),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/members$_query',
      exceptionFnMap: _exceptionFns,
    );
    return ListMembersResponse.fromJson(response);
  }

  /// Returns a list of tags associated with a resource.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource to retrieve tags for.
  Future<ListTagsForResourceResponse> listTagsForResource({
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''^arn:aws:securityhub:.*''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Adds one or more tags to a resource.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource to apply the tags to.
  ///
  /// Parameter [tags] :
  /// The tags to add to the resource.
  Future<void> tagResource({
    @_s.required String resourceArn,
    @_s.required Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''^arn:aws:securityhub:.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final $payload = <String, dynamic>{
      'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return TagResourceResponse.fromJson(response);
  }

  /// Removes one or more tags from a resource.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource to remove the tags from.
  ///
  /// Parameter [tagKeys] :
  /// The tag keys associated with the tags to remove from the resource.
  Future<void> untagResource({
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''^arn:aws:securityhub:.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    var _query = '';
    _query = '?${[
      if (tagKeys != null) _s.toQueryParam('tagKeys', tagKeys),
    ].where((e) => e != null).join('&')}';
    final $payload = <String, dynamic>{};
    final response = await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn.toString())}$_query',
      exceptionFnMap: _exceptionFns,
    );
    return UntagResourceResponse.fromJson(response);
  }

  /// Updates the name and description of a custom action target in Security
  /// Hub.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidAccessException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [actionTargetArn] :
  /// The ARN of the custom action target to update.
  ///
  /// Parameter [description] :
  /// The updated description for the custom action target.
  ///
  /// Parameter [name] :
  /// The updated name of the custom action target.
  Future<void> updateActionTarget({
    @_s.required String actionTargetArn,
    String description,
    String name,
  }) async {
    ArgumentError.checkNotNull(actionTargetArn, 'actionTargetArn');
    _s.validateStringPattern(
      'actionTargetArn',
      actionTargetArn,
      r'''.*\S.*''',
      isRequired: true,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''.*\S.*''',
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''.*\S.*''',
    );
    final $payload = <String, dynamic>{
      'Description': description,
      'Name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/actionTargets/${Uri.encodeComponent(actionTargetArn.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateActionTargetResponse.fromJson(response);
  }

  /// <code>UpdateFindings</code> is deprecated. Instead of
  /// <code>UpdateFindings</code>, use <code>BatchUpdateFindings</code>.
  ///
  /// Updates the <code>Note</code> and <code>RecordState</code> of the Security
  /// Hub-aggregated findings that the filter attributes specify. Any member
  /// account that can view the finding also sees the update to the finding.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidInputException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidAccessException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [filters] :
  /// A collection of attributes that specify which findings you want to update.
  ///
  /// Parameter [note] :
  /// The updated note for the finding.
  ///
  /// Parameter [recordState] :
  /// The updated record state for the finding.
  Future<void> updateFindings({
    @_s.required AwsSecurityFindingFilters filters,
    NoteUpdate note,
    RecordState recordState,
  }) async {
    ArgumentError.checkNotNull(filters, 'filters');
    final $payload = <String, dynamic>{
      'Filters': filters,
      'Note': note,
      'RecordState': recordState?.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/findings',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateFindingsResponse.fromJson(response);
  }

  /// Updates the Security Hub insight identified by the specified insight ARN.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidInputException].
  /// May throw [InvalidAccessException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [insightArn] :
  /// The ARN of the insight that you want to update.
  ///
  /// Parameter [filters] :
  /// The updated filters that define this insight.
  ///
  /// Parameter [groupByAttribute] :
  /// The updated <code>GroupBy</code> attribute that defines this insight.
  ///
  /// Parameter [name] :
  /// The updated name for the insight.
  Future<void> updateInsight({
    @_s.required String insightArn,
    AwsSecurityFindingFilters filters,
    String groupByAttribute,
    String name,
  }) async {
    ArgumentError.checkNotNull(insightArn, 'insightArn');
    _s.validateStringPattern(
      'insightArn',
      insightArn,
      r'''.*\S.*''',
      isRequired: true,
    );
    _s.validateStringPattern(
      'groupByAttribute',
      groupByAttribute,
      r'''.*\S.*''',
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''.*\S.*''',
    );
    final $payload = <String, dynamic>{
      'Filters': filters,
      'GroupByAttribute': groupByAttribute,
      'Name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/insights/${Uri.encodeComponent(insightArn.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateInsightResponse.fromJson(response);
  }

  /// Used to control whether an individual security standard control is enabled
  /// or disabled.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidInputException].
  /// May throw [InvalidAccessException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [standardsControlArn] :
  /// The ARN of the security standard control to enable or disable.
  ///
  /// Parameter [controlStatus] :
  /// The updated status of the security standard control.
  ///
  /// Parameter [disabledReason] :
  /// A description of the reason why you are disabling a security standard
  /// control.
  Future<void> updateStandardsControl({
    @_s.required String standardsControlArn,
    ControlStatus controlStatus,
    String disabledReason,
  }) async {
    ArgumentError.checkNotNull(standardsControlArn, 'standardsControlArn');
    _s.validateStringPattern(
      'standardsControlArn',
      standardsControlArn,
      r'''.*\S.*''',
      isRequired: true,
    );
    _s.validateStringPattern(
      'disabledReason',
      disabledReason,
      r'''.*\S.*''',
    );
    final $payload = <String, dynamic>{
      'ControlStatus': controlStatus?.toValue(),
      'DisabledReason': disabledReason,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/standards/control/${Uri.encodeComponent(standardsControlArn.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateStandardsControlResponse.fromJson(response);
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AcceptInvitationResponse {
  AcceptInvitationResponse();
  factory AcceptInvitationResponse.fromJson(Map<String, dynamic> json) =>
      _$AcceptInvitationResponseFromJson(json);
}

/// The details of an AWS account.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class AccountDetails {
  /// The ID of an AWS account.
  @_s.JsonKey(name: 'AccountId')
  final String accountId;

  /// The email of an AWS account.
  @_s.JsonKey(name: 'Email')
  final String email;

  AccountDetails({
    this.accountId,
    this.email,
  });
  Map<String, dynamic> toJson() => _$AccountDetailsToJson(this);
}

/// An <code>ActionTarget</code> object.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ActionTarget {
  /// The ARN for the target action.
  @_s.JsonKey(name: 'ActionTargetArn')
  final String actionTargetArn;

  /// The description of the target action.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The name of the action target.
  @_s.JsonKey(name: 'Name')
  final String name;

  ActionTarget({
    @_s.required this.actionTargetArn,
    @_s.required this.description,
    @_s.required this.name,
  });
  factory ActionTarget.fromJson(Map<String, dynamic> json) =>
      _$ActionTargetFromJson(json);
}

/// Information about an Availability Zone.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AvailabilityZone {
  /// The ID of the subnet. You can specify one subnet per Availability Zone.
  @_s.JsonKey(name: 'SubnetId')
  final String subnetId;

  /// The name of the Availability Zone.
  @_s.JsonKey(name: 'ZoneName')
  final String zoneName;

  AvailabilityZone({
    this.subnetId,
    this.zoneName,
  });
  factory AvailabilityZone.fromJson(Map<String, dynamic> json) =>
      _$AvailabilityZoneFromJson(json);

  Map<String, dynamic> toJson() => _$AvailabilityZoneToJson(this);
}

/// A distribution configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsCloudFrontDistributionDetails {
  /// The domain name corresponding to the distribution.
  @_s.JsonKey(name: 'DomainName')
  final String domainName;

  /// The entity tag is a hash of the object.
  @_s.JsonKey(name: 'ETag')
  final String eTag;

  /// The date and time that the distribution was last modified.
  @_s.JsonKey(name: 'LastModifiedTime')
  final String lastModifiedTime;

  /// A complex type that controls whether access logs are written for the
  /// distribution.
  @_s.JsonKey(name: 'Logging')
  final AwsCloudFrontDistributionLogging logging;

  /// A complex type that contains information about origins for this
  /// distribution.
  @_s.JsonKey(name: 'Origins')
  final AwsCloudFrontDistributionOrigins origins;

  /// Indicates the current status of the distribution.
  @_s.JsonKey(name: 'Status')
  final String status;

  /// A unique identifier that specifies the AWS WAF web ACL, if any, to associate
  /// with this distribution.
  @_s.JsonKey(name: 'WebAclId')
  final String webAclId;

  AwsCloudFrontDistributionDetails({
    this.domainName,
    this.eTag,
    this.lastModifiedTime,
    this.logging,
    this.origins,
    this.status,
    this.webAclId,
  });
  factory AwsCloudFrontDistributionDetails.fromJson(
          Map<String, dynamic> json) =>
      _$AwsCloudFrontDistributionDetailsFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AwsCloudFrontDistributionDetailsToJson(this);
}

/// A complex type that controls whether access logs are written for the
/// distribution.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsCloudFrontDistributionLogging {
  /// The Amazon S3 bucket to store the access logs in.
  @_s.JsonKey(name: 'Bucket')
  final String bucket;

  /// With this field, you can enable or disable the selected distribution.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  /// Specifies whether you want CloudFront to include cookies in access logs.
  @_s.JsonKey(name: 'IncludeCookies')
  final bool includeCookies;

  /// An optional string that you want CloudFront to use as a prefix to the access
  /// log filenames for this distribution.
  @_s.JsonKey(name: 'Prefix')
  final String prefix;

  AwsCloudFrontDistributionLogging({
    this.bucket,
    this.enabled,
    this.includeCookies,
    this.prefix,
  });
  factory AwsCloudFrontDistributionLogging.fromJson(
          Map<String, dynamic> json) =>
      _$AwsCloudFrontDistributionLoggingFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AwsCloudFrontDistributionLoggingToJson(this);
}

/// A complex type that describes the Amazon S3 bucket, HTTP server (for
/// example, a web server), Amazon MediaStore, or other server from which
/// CloudFront gets your files.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsCloudFrontDistributionOriginItem {
  /// Amazon S3 origins: The DNS name of the Amazon S3 bucket from which you want
  /// CloudFront to get objects for this origin.
  @_s.JsonKey(name: 'DomainName')
  final String domainName;

  /// A unique identifier for the origin or origin group.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// An optional element that causes CloudFront to request your content from a
  /// directory in your Amazon S3 bucket or your custom origin.
  @_s.JsonKey(name: 'OriginPath')
  final String originPath;

  AwsCloudFrontDistributionOriginItem({
    this.domainName,
    this.id,
    this.originPath,
  });
  factory AwsCloudFrontDistributionOriginItem.fromJson(
          Map<String, dynamic> json) =>
      _$AwsCloudFrontDistributionOriginItemFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AwsCloudFrontDistributionOriginItemToJson(this);
}

/// A complex type that contains information about origins and origin groups for
/// this distribution.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsCloudFrontDistributionOrigins {
  /// A complex type that contains origins or origin groups for this distribution.
  @_s.JsonKey(name: 'Items')
  final List<AwsCloudFrontDistributionOriginItem> items;

  AwsCloudFrontDistributionOrigins({
    this.items,
  });
  factory AwsCloudFrontDistributionOrigins.fromJson(
          Map<String, dynamic> json) =>
      _$AwsCloudFrontDistributionOriginsFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AwsCloudFrontDistributionOriginsToJson(this);
}

/// Information about an AWS CodeBuild project.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsCodeBuildProjectDetails {
  /// The AWS Key Management Service (AWS KMS) customer master key (CMK) used to
  /// encrypt the build output artifacts.
  ///
  /// You can specify either the Amazon Resource Name (ARN) of the CMK or, if
  /// available, the CMK alias (using the format alias/alias-name).
  @_s.JsonKey(name: 'EncryptionKey')
  final String encryptionKey;

  /// Information about the build environment for this build project.
  @_s.JsonKey(name: 'Environment')
  final AwsCodeBuildProjectEnvironment environment;

  /// The name of the build project.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The ARN of the IAM role that enables AWS CodeBuild to interact with
  /// dependent AWS services on behalf of the AWS account.
  @_s.JsonKey(name: 'ServiceRole')
  final String serviceRole;

  /// Information about the build input source code for this build project.
  @_s.JsonKey(name: 'Source')
  final AwsCodeBuildProjectSource source;

  /// Information about the VPC configuration that AWS CodeBuild accesses.
  @_s.JsonKey(name: 'VpcConfig')
  final AwsCodeBuildProjectVpcConfig vpcConfig;

  AwsCodeBuildProjectDetails({
    this.encryptionKey,
    this.environment,
    this.name,
    this.serviceRole,
    this.source,
    this.vpcConfig,
  });
  factory AwsCodeBuildProjectDetails.fromJson(Map<String, dynamic> json) =>
      _$AwsCodeBuildProjectDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$AwsCodeBuildProjectDetailsToJson(this);
}

/// Information about the build environment for this build project.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsCodeBuildProjectEnvironment {
  /// The certificate to use with this build project.
  @_s.JsonKey(name: 'Certificate')
  final String certificate;

  /// The type of credentials AWS CodeBuild uses to pull images in your build.
  ///
  /// Valid values:
  ///
  /// <ul>
  /// <li>
  /// <code>CODEBUILD</code> specifies that AWS CodeBuild uses its own
  /// credentials. This requires that you modify your ECR repository policy to
  /// trust the AWS CodeBuild service principal.
  /// </li>
  /// <li>
  /// <code>SERVICE_ROLE</code> specifies that AWS CodeBuild uses your build
  /// project's service role.
  /// </li>
  /// </ul>
  /// When you use a cross-account or private registry image, you must use
  /// <code>SERVICE_ROLE</code> credentials. When you use an AWS CodeBuild curated
  /// image, you must use <code>CODEBUILD</code> credentials.
  @_s.JsonKey(name: 'ImagePullCredentialsType')
  final String imagePullCredentialsType;

  /// The credentials for access to a private registry.
  @_s.JsonKey(name: 'RegistryCredential')
  final AwsCodeBuildProjectEnvironmentRegistryCredential registryCredential;

  /// The type of build environment to use for related builds.
  ///
  /// The environment type <code>ARM_CONTAINER</code> is available only in regions
  /// US East (N. Virginia), US East (Ohio), US West (Oregon), Europe (Ireland),
  /// Asia Pacific (Mumbai), Asia Pacific (Tokyo), Asia Pacific (Sydney), and
  /// Europe (Frankfurt).
  ///
  /// The environment type <code>LINUX_CONTAINER</code> with compute type
  /// build.general1.2xlarge is available only in regions US East (N. Virginia),
  /// US East (N. Virginia), US West (Oregon), Canada (Central), Europe (Ireland),
  /// Europe (London), Europe (Frankfurt), Asia Pacific (Tokyo), Asia Pacific
  /// (Seoul), Asia Pacific (Singapore), Asia Pacific (Sydney), China (Beijing),
  /// and China (Ningxia).
  ///
  /// The environment type <code>LINUX_GPU_CONTAINER</code> is available only in
  /// regions US East (N. Virginia), US East (N. Virginia), US West (Oregon),
  /// Canada (Central), Europe (Ireland), Europe (London), Europe (Frankfurt),
  /// Asia Pacific (Tokyo), Asia Pacific (Seoul), Asia Pacific (Singapore), Asia
  /// Pacific (Sydney) , China (Beijing), and China (Ningxia).
  ///
  /// Valid values: <code>WINDOWS_CONTAINER</code> | <code>LINUX_CONTAINER</code>
  /// | <code>LINUX_GPU_CONTAINER</code> | <code>ARM_CONTAINER</code>
  @_s.JsonKey(name: 'Type')
  final String type;

  AwsCodeBuildProjectEnvironment({
    this.certificate,
    this.imagePullCredentialsType,
    this.registryCredential,
    this.type,
  });
  factory AwsCodeBuildProjectEnvironment.fromJson(Map<String, dynamic> json) =>
      _$AwsCodeBuildProjectEnvironmentFromJson(json);

  Map<String, dynamic> toJson() => _$AwsCodeBuildProjectEnvironmentToJson(this);
}

/// The credentials for access to a private registry.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsCodeBuildProjectEnvironmentRegistryCredential {
  /// The Amazon Resource Name (ARN) or name of credentials created using AWS
  /// Secrets Manager.
  /// <note>
  /// The credential can use the name of the credentials only if they exist in
  /// your current AWS Region.
  /// </note>
  @_s.JsonKey(name: 'Credential')
  final String credential;

  /// The service that created the credentials to access a private Docker
  /// registry.
  ///
  /// The valid value,<code> SECRETS_MANAGER</code>, is for AWS Secrets Manager.
  @_s.JsonKey(name: 'CredentialProvider')
  final String credentialProvider;

  AwsCodeBuildProjectEnvironmentRegistryCredential({
    this.credential,
    this.credentialProvider,
  });
  factory AwsCodeBuildProjectEnvironmentRegistryCredential.fromJson(
          Map<String, dynamic> json) =>
      _$AwsCodeBuildProjectEnvironmentRegistryCredentialFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AwsCodeBuildProjectEnvironmentRegistryCredentialToJson(this);
}

/// Information about the build input source code for this build project.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsCodeBuildProjectSource {
  /// Information about the Git clone depth for the build project.
  @_s.JsonKey(name: 'GitCloneDepth')
  final int gitCloneDepth;

  /// Whether to ignore SSL warnings while connecting to the project source code.
  @_s.JsonKey(name: 'InsecureSsl')
  final bool insecureSsl;

  /// Information about the location of the source code to be built.
  ///
  /// Valid values include:
  ///
  /// <ul>
  /// <li>
  /// For source code settings that are specified in the source action of a
  /// pipeline in AWS CodePipeline, location should not be specified. If it is
  /// specified, AWS CodePipeline ignores it. This is because AWS CodePipeline
  /// uses the settings in a pipeline's source action instead of this value.
  /// </li>
  /// <li>
  /// For source code in an AWS CodeCommit repository, the HTTPS clone URL to the
  /// repository that contains the source code and the buildspec file (for
  /// example,
  /// <code>https://git-codecommit.region-ID.amazonaws.com/v1/repos/repo-name</code>
  /// ).
  /// </li>
  /// <li>
  /// For source code in an S3 input bucket, one of the following.
  ///
  /// <ul>
  /// <li>
  /// The path to the ZIP file that contains the source code (for example,
  /// <code>bucket-name/path/to/object-name.zip</code>).
  /// </li>
  /// <li>
  /// The path to the folder that contains the source code (for example,
  /// <code>bucket-name/path/to/source-code/folder/</code>).
  /// </li>
  /// </ul> </li>
  /// <li>
  /// For source code in a GitHub repository, the HTTPS clone URL to the
  /// repository that contains the source and the buildspec file.
  /// </li>
  /// <li>
  /// For source code in a Bitbucket repository, the HTTPS clone URL to the
  /// repository that contains the source and the buildspec file.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Location')
  final String location;

  /// The type of repository that contains the source code to be built. Valid
  /// values are:
  ///
  /// <ul>
  /// <li>
  /// <code>BITBUCKET</code> - The source code is in a Bitbucket repository.
  /// </li>
  /// <li>
  /// <code>CODECOMMIT</code> - The source code is in an AWS CodeCommit
  /// repository.
  /// </li>
  /// <li>
  /// <code>CODEPIPELINE</code> - The source code settings are specified in the
  /// source action of a pipeline in AWS CodePipeline.
  /// </li>
  /// <li>
  /// <code>GITHUB</code> - The source code is in a GitHub repository.
  /// </li>
  /// <li>
  /// <code>GITHUB_ENTERPRISE</code> - The source code is in a GitHub Enterprise
  /// repository.
  /// </li>
  /// <li>
  /// <code>NO_SOURCE</code> - The project does not have input source code.
  /// </li>
  /// <li>
  /// <code>S3</code> - The source code is in an S3 input bucket.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Type')
  final String type;

  AwsCodeBuildProjectSource({
    this.gitCloneDepth,
    this.insecureSsl,
    this.location,
    this.type,
  });
  factory AwsCodeBuildProjectSource.fromJson(Map<String, dynamic> json) =>
      _$AwsCodeBuildProjectSourceFromJson(json);

  Map<String, dynamic> toJson() => _$AwsCodeBuildProjectSourceToJson(this);
}

/// Information about the VPC configuration that AWS CodeBuild accesses.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsCodeBuildProjectVpcConfig {
  /// A list of one or more security group IDs in your Amazon VPC.
  @_s.JsonKey(name: 'SecurityGroupIds')
  final List<String> securityGroupIds;

  /// A list of one or more subnet IDs in your Amazon VPC.
  @_s.JsonKey(name: 'Subnets')
  final List<String> subnets;

  /// The ID of the VPC.
  @_s.JsonKey(name: 'VpcId')
  final String vpcId;

  AwsCodeBuildProjectVpcConfig({
    this.securityGroupIds,
    this.subnets,
    this.vpcId,
  });
  factory AwsCodeBuildProjectVpcConfig.fromJson(Map<String, dynamic> json) =>
      _$AwsCodeBuildProjectVpcConfigFromJson(json);

  Map<String, dynamic> toJson() => _$AwsCodeBuildProjectVpcConfigToJson(this);
}

/// The details of an Amazon EC2 instance.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsEc2InstanceDetails {
  /// The IAM profile ARN of the instance.
  @_s.JsonKey(name: 'IamInstanceProfileArn')
  final String iamInstanceProfileArn;

  /// The Amazon Machine Image (AMI) ID of the instance.
  @_s.JsonKey(name: 'ImageId')
  final String imageId;

  /// The IPv4 addresses associated with the instance.
  @_s.JsonKey(name: 'IpV4Addresses')
  final List<String> ipV4Addresses;

  /// The IPv6 addresses associated with the instance.
  @_s.JsonKey(name: 'IpV6Addresses')
  final List<String> ipV6Addresses;

  /// The key name associated with the instance.
  @_s.JsonKey(name: 'KeyName')
  final String keyName;

  /// The date/time the instance was launched.
  @_s.JsonKey(name: 'LaunchedAt')
  final String launchedAt;

  /// The identifier of the subnet that the instance was launched in.
  @_s.JsonKey(name: 'SubnetId')
  final String subnetId;

  /// The instance type of the instance.
  @_s.JsonKey(name: 'Type')
  final String type;

  /// The identifier of the VPC that the instance was launched in.
  @_s.JsonKey(name: 'VpcId')
  final String vpcId;

  AwsEc2InstanceDetails({
    this.iamInstanceProfileArn,
    this.imageId,
    this.ipV4Addresses,
    this.ipV6Addresses,
    this.keyName,
    this.launchedAt,
    this.subnetId,
    this.type,
    this.vpcId,
  });
  factory AwsEc2InstanceDetails.fromJson(Map<String, dynamic> json) =>
      _$AwsEc2InstanceDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$AwsEc2InstanceDetailsToJson(this);
}

/// Information about the network interface attachment.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsEc2NetworkInterfaceAttachment {
  /// The timestamp indicating when the attachment initiated.
  @_s.JsonKey(name: 'AttachTime')
  final String attachTime;

  /// The identifier of the network interface attachment
  @_s.JsonKey(name: 'AttachmentId')
  final String attachmentId;

  /// Indicates whether the network interface is deleted when the instance is
  /// terminated.
  @_s.JsonKey(name: 'DeleteOnTermination')
  final bool deleteOnTermination;

  /// The device index of the network interface attachment on the instance.
  @_s.JsonKey(name: 'DeviceIndex')
  final int deviceIndex;

  /// The ID of the instance.
  @_s.JsonKey(name: 'InstanceId')
  final String instanceId;

  /// The AWS account ID of the owner of the instance.
  @_s.JsonKey(name: 'InstanceOwnerId')
  final String instanceOwnerId;

  /// The attachment state.
  ///
  /// Valid values: <code>attaching</code> | <code>attached</code> |
  /// <code>detaching</code> | <code>detached</code>
  @_s.JsonKey(name: 'Status')
  final String status;

  AwsEc2NetworkInterfaceAttachment({
    this.attachTime,
    this.attachmentId,
    this.deleteOnTermination,
    this.deviceIndex,
    this.instanceId,
    this.instanceOwnerId,
    this.status,
  });
  factory AwsEc2NetworkInterfaceAttachment.fromJson(
          Map<String, dynamic> json) =>
      _$AwsEc2NetworkInterfaceAttachmentFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AwsEc2NetworkInterfaceAttachmentToJson(this);
}

/// Details about the network interface
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsEc2NetworkInterfaceDetails {
  /// The network interface attachment.
  @_s.JsonKey(name: 'Attachment')
  final AwsEc2NetworkInterfaceAttachment attachment;

  /// The ID of the network interface.
  @_s.JsonKey(name: 'NetworkInterfaceId')
  final String networkInterfaceId;

  /// Security groups for the network interface.
  @_s.JsonKey(name: 'SecurityGroups')
  final List<AwsEc2NetworkInterfaceSecurityGroup> securityGroups;

  /// Indicates whether traffic to or from the instance is validated.
  @_s.JsonKey(name: 'SourceDestCheck')
  final bool sourceDestCheck;

  AwsEc2NetworkInterfaceDetails({
    this.attachment,
    this.networkInterfaceId,
    this.securityGroups,
    this.sourceDestCheck,
  });
  factory AwsEc2NetworkInterfaceDetails.fromJson(Map<String, dynamic> json) =>
      _$AwsEc2NetworkInterfaceDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$AwsEc2NetworkInterfaceDetailsToJson(this);
}

/// A security group associated with the network interface.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsEc2NetworkInterfaceSecurityGroup {
  /// The ID of the security group.
  @_s.JsonKey(name: 'GroupId')
  final String groupId;

  /// The name of the security group.
  @_s.JsonKey(name: 'GroupName')
  final String groupName;

  AwsEc2NetworkInterfaceSecurityGroup({
    this.groupId,
    this.groupName,
  });
  factory AwsEc2NetworkInterfaceSecurityGroup.fromJson(
          Map<String, dynamic> json) =>
      _$AwsEc2NetworkInterfaceSecurityGroupFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AwsEc2NetworkInterfaceSecurityGroupToJson(this);
}

/// Details about an EC2 security group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsEc2SecurityGroupDetails {
  /// The ID of the security group.
  @_s.JsonKey(name: 'GroupId')
  final String groupId;

  /// The name of the security group.
  @_s.JsonKey(name: 'GroupName')
  final String groupName;

  /// The inbound rules associated with the security group.
  @_s.JsonKey(name: 'IpPermissions')
  final List<AwsEc2SecurityGroupIpPermission> ipPermissions;

  /// [VPC only] The outbound rules associated with the security group.
  @_s.JsonKey(name: 'IpPermissionsEgress')
  final List<AwsEc2SecurityGroupIpPermission> ipPermissionsEgress;

  /// The AWS account ID of the owner of the security group.
  @_s.JsonKey(name: 'OwnerId')
  final String ownerId;

  /// [VPC only] The ID of the VPC for the security group.
  @_s.JsonKey(name: 'VpcId')
  final String vpcId;

  AwsEc2SecurityGroupDetails({
    this.groupId,
    this.groupName,
    this.ipPermissions,
    this.ipPermissionsEgress,
    this.ownerId,
    this.vpcId,
  });
  factory AwsEc2SecurityGroupDetails.fromJson(Map<String, dynamic> json) =>
      _$AwsEc2SecurityGroupDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$AwsEc2SecurityGroupDetailsToJson(this);
}

/// An IP permission for an EC2 security group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsEc2SecurityGroupIpPermission {
  /// The start of the port range for the TCP and UDP protocols, or an ICMP/ICMPv6
  /// type number.
  ///
  /// A value of -1 indicates all ICMP/ICMPv6 types. If you specify all
  /// ICMP/ICMPv6 types, you must specify all codes.
  @_s.JsonKey(name: 'FromPort')
  final int fromPort;

  /// The IP protocol name (<code>tcp</code>, <code>udp</code>, <code>icmp</code>,
  /// <code>icmpv6</code>) or number.
  ///
  /// [VPC only] Use <code>-1</code> to specify all protocols.
  ///
  /// When authorizing security group rules, specifying -1 or a protocol number
  /// other than <code>tcp</code>, <code>udp</code>, <code>icmp</code>, or
  /// <code>icmpv6</code> allows traffic on all ports, regardless of any port
  /// range you specify.
  ///
  /// For <code>tcp</code>, <code>udp</code>, and <code>icmp</code>, you must
  /// specify a port range.
  ///
  /// For <code>icmpv6</code>, the port range is optional. If you omit the port
  /// range, traffic for all types and codes is allowed.
  @_s.JsonKey(name: 'IpProtocol')
  final String ipProtocol;

  /// The IPv4 ranges.
  @_s.JsonKey(name: 'IpRanges')
  final List<AwsEc2SecurityGroupIpRange> ipRanges;

  /// The IPv6 ranges.
  @_s.JsonKey(name: 'Ipv6Ranges')
  final List<AwsEc2SecurityGroupIpv6Range> ipv6Ranges;

  /// [VPC only] The prefix list IDs for an AWS service. With outbound rules, this
  /// is the AWS service to access through a VPC endpoint from instances
  /// associated with the security group.
  @_s.JsonKey(name: 'PrefixListIds')
  final List<AwsEc2SecurityGroupPrefixListId> prefixListIds;

  /// The end of the port range for the TCP and UDP protocols, or an ICMP/ICMPv6
  /// code.
  ///
  /// A value of -1 indicates all ICMP/ICMPv6 codes. If you specify all
  /// ICMP/ICMPv6 types, you must specify all codes.
  @_s.JsonKey(name: 'ToPort')
  final int toPort;

  /// The security group and AWS account ID pairs.
  @_s.JsonKey(name: 'UserIdGroupPairs')
  final List<AwsEc2SecurityGroupUserIdGroupPair> userIdGroupPairs;

  AwsEc2SecurityGroupIpPermission({
    this.fromPort,
    this.ipProtocol,
    this.ipRanges,
    this.ipv6Ranges,
    this.prefixListIds,
    this.toPort,
    this.userIdGroupPairs,
  });
  factory AwsEc2SecurityGroupIpPermission.fromJson(Map<String, dynamic> json) =>
      _$AwsEc2SecurityGroupIpPermissionFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AwsEc2SecurityGroupIpPermissionToJson(this);
}

/// A range of IPv4 addresses.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsEc2SecurityGroupIpRange {
  /// The IPv4 CIDR range. You can either specify either a CIDR range or a source
  /// security group, but not both. To specify a single IPv4 address, use the /32
  /// prefix length.
  @_s.JsonKey(name: 'CidrIp')
  final String cidrIp;

  AwsEc2SecurityGroupIpRange({
    this.cidrIp,
  });
  factory AwsEc2SecurityGroupIpRange.fromJson(Map<String, dynamic> json) =>
      _$AwsEc2SecurityGroupIpRangeFromJson(json);

  Map<String, dynamic> toJson() => _$AwsEc2SecurityGroupIpRangeToJson(this);
}

/// A range of IPv6 addresses.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsEc2SecurityGroupIpv6Range {
  /// The IPv6 CIDR range. You can either specify either a CIDR range or a source
  /// security group, but not both. To specify a single IPv6 address, use the /128
  /// prefix length.
  @_s.JsonKey(name: 'CidrIpv6')
  final String cidrIpv6;

  AwsEc2SecurityGroupIpv6Range({
    this.cidrIpv6,
  });
  factory AwsEc2SecurityGroupIpv6Range.fromJson(Map<String, dynamic> json) =>
      _$AwsEc2SecurityGroupIpv6RangeFromJson(json);

  Map<String, dynamic> toJson() => _$AwsEc2SecurityGroupIpv6RangeToJson(this);
}

/// A prefix list ID.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsEc2SecurityGroupPrefixListId {
  /// The ID of the prefix.
  @_s.JsonKey(name: 'PrefixListId')
  final String prefixListId;

  AwsEc2SecurityGroupPrefixListId({
    this.prefixListId,
  });
  factory AwsEc2SecurityGroupPrefixListId.fromJson(Map<String, dynamic> json) =>
      _$AwsEc2SecurityGroupPrefixListIdFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AwsEc2SecurityGroupPrefixListIdToJson(this);
}

/// A relationship between a security group and a user.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsEc2SecurityGroupUserIdGroupPair {
  /// The ID of the security group.
  @_s.JsonKey(name: 'GroupId')
  final String groupId;

  /// The name of the security group.
  @_s.JsonKey(name: 'GroupName')
  final String groupName;

  /// The status of a VPC peering connection, if applicable.
  @_s.JsonKey(name: 'PeeringStatus')
  final String peeringStatus;

  /// The ID of an AWS account.
  ///
  /// For a referenced security group in another VPC, the account ID of the
  /// referenced security group is returned in the response. If the referenced
  /// security group is deleted, this value is not returned.
  ///
  /// [EC2-Classic] Required when adding or removing rules that reference a
  /// security group in another AWS.
  @_s.JsonKey(name: 'UserId')
  final String userId;

  /// The ID of the VPC for the referenced security group, if applicable.
  @_s.JsonKey(name: 'VpcId')
  final String vpcId;

  /// The ID of the VPC peering connection, if applicable.
  @_s.JsonKey(name: 'VpcPeeringConnectionId')
  final String vpcPeeringConnectionId;

  AwsEc2SecurityGroupUserIdGroupPair({
    this.groupId,
    this.groupName,
    this.peeringStatus,
    this.userId,
    this.vpcId,
    this.vpcPeeringConnectionId,
  });
  factory AwsEc2SecurityGroupUserIdGroupPair.fromJson(
          Map<String, dynamic> json) =>
      _$AwsEc2SecurityGroupUserIdGroupPairFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AwsEc2SecurityGroupUserIdGroupPairToJson(this);
}

/// Information about an Elasticsearch domain.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsElasticsearchDomainDetails {
  /// IAM policy document specifying the access policies for the new Amazon ES
  /// domain.
  @_s.JsonKey(name: 'AccessPolicies')
  final String accessPolicies;

  /// Additional options for the domain endpoint.
  @_s.JsonKey(name: 'DomainEndpointOptions')
  final AwsElasticsearchDomainDomainEndpointOptions domainEndpointOptions;

  /// Unique identifier for an Amazon ES domain.
  @_s.JsonKey(name: 'DomainId')
  final String domainId;

  /// Name of an Amazon ES domain.
  ///
  /// Domain names are unique across all domains owned by the same account within
  /// an AWS Region.
  ///
  /// Domain names must start with a lowercase letter and must be between 3 and 28
  /// characters.
  ///
  /// Valid characters are a-z (lowercase only), 0-9, and – (hyphen).
  @_s.JsonKey(name: 'DomainName')
  final String domainName;

  /// Elasticsearch version.
  @_s.JsonKey(name: 'ElasticsearchVersion')
  final String elasticsearchVersion;

  /// Details about the configuration for encryption at rest.
  @_s.JsonKey(name: 'EncryptionAtRestOptions')
  final AwsElasticsearchDomainEncryptionAtRestOptions encryptionAtRestOptions;

  /// Domain-specific endpoint used to submit index, search, and data upload
  /// requests to an Amazon ES domain.
  ///
  /// The endpoint is a service URL.
  @_s.JsonKey(name: 'Endpoint')
  final String endpoint;

  /// The key-value pair that exists if the Amazon ES domain uses VPC endpoints.
  @_s.JsonKey(name: 'Endpoints')
  final Map<String, String> endpoints;

  /// Details about the configuration for node-to-node encryption.
  @_s.JsonKey(name: 'NodeToNodeEncryptionOptions')
  final AwsElasticsearchDomainNodeToNodeEncryptionOptions
      nodeToNodeEncryptionOptions;

  /// Information that Amazon ES derives based on <code>VPCOptions</code> for the
  /// domain.
  @_s.JsonKey(name: 'VPCOptions')
  final AwsElasticsearchDomainVPCOptions vPCOptions;

  AwsElasticsearchDomainDetails({
    this.accessPolicies,
    this.domainEndpointOptions,
    this.domainId,
    this.domainName,
    this.elasticsearchVersion,
    this.encryptionAtRestOptions,
    this.endpoint,
    this.endpoints,
    this.nodeToNodeEncryptionOptions,
    this.vPCOptions,
  });
  factory AwsElasticsearchDomainDetails.fromJson(Map<String, dynamic> json) =>
      _$AwsElasticsearchDomainDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$AwsElasticsearchDomainDetailsToJson(this);
}

/// Additional options for the domain endpoint, such as whether to require HTTPS
/// for all traffic.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsElasticsearchDomainDomainEndpointOptions {
  /// Whether to require that all traffic to the domain arrive over HTTPS.
  @_s.JsonKey(name: 'EnforceHTTPS')
  final bool enforceHTTPS;

  /// The TLS security policy to apply to the HTTPS endpoint of the Elasticsearch
  /// domain.
  ///
  /// Valid values:
  ///
  /// <ul>
  /// <li>
  /// <code>Policy-Min-TLS-1-0-2019-07</code>, which supports TLSv1.0 and higher
  /// </li>
  /// <li>
  /// <code>Policy-Min-TLS-1-2-2019-07</code>, which only supports TLSv1.2
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'TLSSecurityPolicy')
  final String tLSSecurityPolicy;

  AwsElasticsearchDomainDomainEndpointOptions({
    this.enforceHTTPS,
    this.tLSSecurityPolicy,
  });
  factory AwsElasticsearchDomainDomainEndpointOptions.fromJson(
          Map<String, dynamic> json) =>
      _$AwsElasticsearchDomainDomainEndpointOptionsFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AwsElasticsearchDomainDomainEndpointOptionsToJson(this);
}

/// Details about the configuration for encryption at rest.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsElasticsearchDomainEncryptionAtRestOptions {
  /// Whether encryption at rest is enabled.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  /// The KMS key ID. Takes the form 1a2a3a4-1a2a-3a4a-5a6a-1a2a3a4a5a6a.
  @_s.JsonKey(name: 'KmsKeyId')
  final String kmsKeyId;

  AwsElasticsearchDomainEncryptionAtRestOptions({
    this.enabled,
    this.kmsKeyId,
  });
  factory AwsElasticsearchDomainEncryptionAtRestOptions.fromJson(
          Map<String, dynamic> json) =>
      _$AwsElasticsearchDomainEncryptionAtRestOptionsFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AwsElasticsearchDomainEncryptionAtRestOptionsToJson(this);
}

/// Details about the configuration for node-to-node encryption.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsElasticsearchDomainNodeToNodeEncryptionOptions {
  /// Whether node-to-node encryption is enabled.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  AwsElasticsearchDomainNodeToNodeEncryptionOptions({
    this.enabled,
  });
  factory AwsElasticsearchDomainNodeToNodeEncryptionOptions.fromJson(
          Map<String, dynamic> json) =>
      _$AwsElasticsearchDomainNodeToNodeEncryptionOptionsFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AwsElasticsearchDomainNodeToNodeEncryptionOptionsToJson(this);
}

/// Information that Amazon ES derives based on <code>VPCOptions</code> for the
/// domain.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsElasticsearchDomainVPCOptions {
  /// The list of Availability Zones associated with the VPC subnets.
  @_s.JsonKey(name: 'AvailabilityZones')
  final List<String> availabilityZones;

  /// The list of security group IDs associated with the VPC endpoints for the
  /// domain.
  @_s.JsonKey(name: 'SecurityGroupIds')
  final List<String> securityGroupIds;

  /// A list of subnet IDs associated with the VPC endpoints for the domain.
  @_s.JsonKey(name: 'SubnetIds')
  final List<String> subnetIds;

  /// ID for the VPC.
  @_s.JsonKey(name: 'VPCId')
  final String vPCId;

  AwsElasticsearchDomainVPCOptions({
    this.availabilityZones,
    this.securityGroupIds,
    this.subnetIds,
    this.vPCId,
  });
  factory AwsElasticsearchDomainVPCOptions.fromJson(
          Map<String, dynamic> json) =>
      _$AwsElasticsearchDomainVPCOptionsFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AwsElasticsearchDomainVPCOptionsToJson(this);
}

/// Information about a load balancer.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsElbv2LoadBalancerDetails {
  /// The Availability Zones for the load balancer.
  @_s.JsonKey(name: 'AvailabilityZones')
  final List<AvailabilityZone> availabilityZones;

  /// The ID of the Amazon Route 53 hosted zone associated with the load balancer.
  @_s.JsonKey(name: 'CanonicalHostedZoneId')
  final String canonicalHostedZoneId;

  /// The date and time the load balancer was created.
  @_s.JsonKey(name: 'CreatedTime')
  final String createdTime;

  /// The public DNS name of the load balancer.
  @_s.JsonKey(name: 'DNSName')
  final String dNSName;

  /// The type of IP addresses used by the subnets for your load balancer. The
  /// possible values are <code>ipv4</code> (for IPv4 addresses) and
  /// <code>dualstack</code> (for IPv4 and IPv6 addresses).
  @_s.JsonKey(name: 'IpAddressType')
  final String ipAddressType;

  /// The nodes of an Internet-facing load balancer have public IP addresses.
  @_s.JsonKey(name: 'Scheme')
  final String scheme;

  /// The IDs of the security groups for the load balancer.
  @_s.JsonKey(name: 'SecurityGroups')
  final List<String> securityGroups;

  /// The state of the load balancer.
  @_s.JsonKey(name: 'State')
  final LoadBalancerState state;

  /// The type of load balancer.
  @_s.JsonKey(name: 'Type')
  final String type;

  /// The ID of the VPC for the load balancer.
  @_s.JsonKey(name: 'VpcId')
  final String vpcId;

  AwsElbv2LoadBalancerDetails({
    this.availabilityZones,
    this.canonicalHostedZoneId,
    this.createdTime,
    this.dNSName,
    this.ipAddressType,
    this.scheme,
    this.securityGroups,
    this.state,
    this.type,
    this.vpcId,
  });
  factory AwsElbv2LoadBalancerDetails.fromJson(Map<String, dynamic> json) =>
      _$AwsElbv2LoadBalancerDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$AwsElbv2LoadBalancerDetailsToJson(this);
}

/// IAM access key details related to a finding.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsIamAccessKeyDetails {
  /// The creation date/time of the IAM access key related to a finding.
  @_s.JsonKey(name: 'CreatedAt')
  final String createdAt;

  /// The ID of the principal associated with an access key.
  @_s.JsonKey(name: 'PrincipalId')
  final String principalId;

  /// The name of the principal.
  @_s.JsonKey(name: 'PrincipalName')
  final String principalName;

  /// The type of principal associated with an access key.
  @_s.JsonKey(name: 'PrincipalType')
  final String principalType;

  /// The status of the IAM access key related to a finding.
  @_s.JsonKey(name: 'Status')
  final AwsIamAccessKeyStatus status;

  /// The user associated with the IAM access key related to a finding.
  ///
  /// The <code>UserName</code> parameter has been replaced with the
  /// <code>PrincipalName</code> parameter because access keys can also be
  /// assigned to principals that are not IAM users.
  @_s.JsonKey(name: 'UserName')
  final String userName;

  AwsIamAccessKeyDetails({
    this.createdAt,
    this.principalId,
    this.principalName,
    this.principalType,
    this.status,
    this.userName,
  });
  factory AwsIamAccessKeyDetails.fromJson(Map<String, dynamic> json) =>
      _$AwsIamAccessKeyDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$AwsIamAccessKeyDetailsToJson(this);
}

enum AwsIamAccessKeyStatus {
  @_s.JsonValue('Active')
  active,
  @_s.JsonValue('Inactive')
  inactive,
}

/// Contains information about an IAM role, including all of the role's
/// policies.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsIamRoleDetails {
  /// The trust policy that grants permission to assume the role.
  @_s.JsonKey(name: 'AssumeRolePolicyDocument')
  final String assumeRolePolicyDocument;

  /// The date and time, in ISO 8601 date-time format, when the role was created.
  @_s.JsonKey(name: 'CreateDate')
  final String createDate;

  /// The maximum session duration (in seconds) that you want to set for the
  /// specified role.
  @_s.JsonKey(name: 'MaxSessionDuration')
  final int maxSessionDuration;

  /// The path to the role.
  @_s.JsonKey(name: 'Path')
  final String path;

  /// The stable and unique string identifying the role.
  @_s.JsonKey(name: 'RoleId')
  final String roleId;

  /// The friendly name that identifies the role.
  @_s.JsonKey(name: 'RoleName')
  final String roleName;

  AwsIamRoleDetails({
    this.assumeRolePolicyDocument,
    this.createDate,
    this.maxSessionDuration,
    this.path,
    this.roleId,
    this.roleName,
  });
  factory AwsIamRoleDetails.fromJson(Map<String, dynamic> json) =>
      _$AwsIamRoleDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$AwsIamRoleDetailsToJson(this);
}

/// Contains metadata about a customer master key (CMK).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsKmsKeyDetails {
  /// The twelve-digit account ID of the AWS account that owns the CMK.
  @_s.JsonKey(name: 'AWSAccountId')
  final String awsAccountId;

  /// The date and time when the CMK was created.
  @_s.JsonKey(name: 'CreationDate')
  final double creationDate;

  /// The globally unique identifier for the CMK.
  @_s.JsonKey(name: 'KeyId')
  final String keyId;

  /// The manager of the CMK. CMKs in your AWS account are either customer managed
  /// or AWS managed.
  @_s.JsonKey(name: 'KeyManager')
  final String keyManager;

  /// The state of the CMK.
  @_s.JsonKey(name: 'KeyState')
  final String keyState;

  /// The source of the CMK's key material.
  ///
  /// When this value is <code>AWS_KMS</code>, AWS KMS created the key material.
  ///
  /// When this value is <code>EXTERNAL</code>, the key material was imported from
  /// your existing key management infrastructure or the CMK lacks key material.
  ///
  /// When this value is <code>AWS_CLOUDHSM</code>, the key material was created
  /// in the AWS CloudHSM cluster associated with a custom key store.
  @_s.JsonKey(name: 'Origin')
  final String origin;

  AwsKmsKeyDetails({
    this.awsAccountId,
    this.creationDate,
    this.keyId,
    this.keyManager,
    this.keyState,
    this.origin,
  });
  factory AwsKmsKeyDetails.fromJson(Map<String, dynamic> json) =>
      _$AwsKmsKeyDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$AwsKmsKeyDetailsToJson(this);
}

/// The code for the Lambda function. You can specify either an object in Amazon
/// S3, or upload a deployment package directly.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsLambdaFunctionCode {
  /// An Amazon S3 bucket in the same AWS Region as your function. The bucket can
  /// be in a different AWS account.
  @_s.JsonKey(name: 'S3Bucket')
  final String s3Bucket;

  /// The Amazon S3 key of the deployment package.
  @_s.JsonKey(name: 'S3Key')
  final String s3Key;

  /// For versioned objects, the version of the deployment package object to use.
  @_s.JsonKey(name: 'S3ObjectVersion')
  final String s3ObjectVersion;

  /// The base64-encoded contents of the deployment package. AWS SDK and AWS CLI
  /// clients handle the encoding for you.
  @_s.JsonKey(name: 'ZipFile')
  final String zipFile;

  AwsLambdaFunctionCode({
    this.s3Bucket,
    this.s3Key,
    this.s3ObjectVersion,
    this.zipFile,
  });
  factory AwsLambdaFunctionCode.fromJson(Map<String, dynamic> json) =>
      _$AwsLambdaFunctionCodeFromJson(json);

  Map<String, dynamic> toJson() => _$AwsLambdaFunctionCodeToJson(this);
}

/// The dead-letter queue for failed asynchronous invocations.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsLambdaFunctionDeadLetterConfig {
  /// The Amazon Resource Name (ARN) of an Amazon SQS queue or Amazon SNS topic.
  @_s.JsonKey(name: 'TargetArn')
  final String targetArn;

  AwsLambdaFunctionDeadLetterConfig({
    this.targetArn,
  });
  factory AwsLambdaFunctionDeadLetterConfig.fromJson(
          Map<String, dynamic> json) =>
      _$AwsLambdaFunctionDeadLetterConfigFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AwsLambdaFunctionDeadLetterConfigToJson(this);
}

/// Details about a function's configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsLambdaFunctionDetails {
  /// An <code>AwsLambdaFunctionCode</code> object.
  @_s.JsonKey(name: 'Code')
  final AwsLambdaFunctionCode code;

  /// The SHA256 hash of the function's deployment package.
  @_s.JsonKey(name: 'CodeSha256')
  final String codeSha256;

  /// The function's dead letter queue.
  @_s.JsonKey(name: 'DeadLetterConfig')
  final AwsLambdaFunctionDeadLetterConfig deadLetterConfig;

  /// The function's environment variables.
  @_s.JsonKey(name: 'Environment')
  final AwsLambdaFunctionEnvironment environment;

  /// The name of the function.
  @_s.JsonKey(name: 'FunctionName')
  final String functionName;

  /// The function that Lambda calls to begin executing your function.
  @_s.JsonKey(name: 'Handler')
  final String handler;

  /// The KMS key that's used to encrypt the function's environment variables.
  /// This key is only returned if you've configured a customer managed CMK.
  @_s.JsonKey(name: 'KmsKeyArn')
  final String kmsKeyArn;

  /// The date and time that the function was last updated, in ISO-8601 format
  /// (YYYY-MM-DDThh:mm:ss.sTZD).
  @_s.JsonKey(name: 'LastModified')
  final String lastModified;

  /// The function's layers.
  @_s.JsonKey(name: 'Layers')
  final List<AwsLambdaFunctionLayer> layers;

  /// For Lambda@Edge functions, the ARN of the master function.
  @_s.JsonKey(name: 'MasterArn')
  final String masterArn;

  /// The memory that's allocated to the function.
  @_s.JsonKey(name: 'MemorySize')
  final int memorySize;

  /// The latest updated revision of the function or alias.
  @_s.JsonKey(name: 'RevisionId')
  final String revisionId;

  /// The function's execution role.
  @_s.JsonKey(name: 'Role')
  final String role;

  /// The runtime environment for the Lambda function.
  @_s.JsonKey(name: 'Runtime')
  final String runtime;

  /// The amount of time that Lambda allows a function to run before stopping it.
  @_s.JsonKey(name: 'Timeout')
  final int timeout;

  /// The function's AWS X-Ray tracing configuration.
  @_s.JsonKey(name: 'TracingConfig')
  final AwsLambdaFunctionTracingConfig tracingConfig;

  /// The version of the Lambda function.
  @_s.JsonKey(name: 'Version')
  final String version;

  /// The function's networking configuration.
  @_s.JsonKey(name: 'VpcConfig')
  final AwsLambdaFunctionVpcConfig vpcConfig;

  AwsLambdaFunctionDetails({
    this.code,
    this.codeSha256,
    this.deadLetterConfig,
    this.environment,
    this.functionName,
    this.handler,
    this.kmsKeyArn,
    this.lastModified,
    this.layers,
    this.masterArn,
    this.memorySize,
    this.revisionId,
    this.role,
    this.runtime,
    this.timeout,
    this.tracingConfig,
    this.version,
    this.vpcConfig,
  });
  factory AwsLambdaFunctionDetails.fromJson(Map<String, dynamic> json) =>
      _$AwsLambdaFunctionDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$AwsLambdaFunctionDetailsToJson(this);
}

/// A function's environment variable settings.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsLambdaFunctionEnvironment {
  /// An <code>AwsLambdaFunctionEnvironmentError</code> object.
  @_s.JsonKey(name: 'Error')
  final AwsLambdaFunctionEnvironmentError error;

  /// Environment variable key-value pairs.
  @_s.JsonKey(name: 'Variables')
  final Map<String, String> variables;

  AwsLambdaFunctionEnvironment({
    this.error,
    this.variables,
  });
  factory AwsLambdaFunctionEnvironment.fromJson(Map<String, dynamic> json) =>
      _$AwsLambdaFunctionEnvironmentFromJson(json);

  Map<String, dynamic> toJson() => _$AwsLambdaFunctionEnvironmentToJson(this);
}

/// Error messages for environment variables that couldn't be applied.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsLambdaFunctionEnvironmentError {
  /// The error code.
  @_s.JsonKey(name: 'ErrorCode')
  final String errorCode;

  /// The error message.
  @_s.JsonKey(name: 'Message')
  final String message;

  AwsLambdaFunctionEnvironmentError({
    this.errorCode,
    this.message,
  });
  factory AwsLambdaFunctionEnvironmentError.fromJson(
          Map<String, dynamic> json) =>
      _$AwsLambdaFunctionEnvironmentErrorFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AwsLambdaFunctionEnvironmentErrorToJson(this);
}

/// An AWS Lambda layer.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsLambdaFunctionLayer {
  /// The Amazon Resource Name (ARN) of the function layer.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The size of the layer archive in bytes.
  @_s.JsonKey(name: 'CodeSize')
  final int codeSize;

  AwsLambdaFunctionLayer({
    this.arn,
    this.codeSize,
  });
  factory AwsLambdaFunctionLayer.fromJson(Map<String, dynamic> json) =>
      _$AwsLambdaFunctionLayerFromJson(json);

  Map<String, dynamic> toJson() => _$AwsLambdaFunctionLayerToJson(this);
}

/// The function's AWS X-Ray tracing configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsLambdaFunctionTracingConfig {
  /// The tracing mode.
  @_s.JsonKey(name: 'Mode')
  final String mode;

  AwsLambdaFunctionTracingConfig({
    this.mode,
  });
  factory AwsLambdaFunctionTracingConfig.fromJson(Map<String, dynamic> json) =>
      _$AwsLambdaFunctionTracingConfigFromJson(json);

  Map<String, dynamic> toJson() => _$AwsLambdaFunctionTracingConfigToJson(this);
}

/// The VPC security groups and subnets that are attached to a Lambda function.
/// For more information, see VPC Settings.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsLambdaFunctionVpcConfig {
  /// A list of VPC security groups IDs.
  @_s.JsonKey(name: 'SecurityGroupIds')
  final List<String> securityGroupIds;

  /// A list of VPC subnet IDs.
  @_s.JsonKey(name: 'SubnetIds')
  final List<String> subnetIds;

  /// The ID of the VPC.
  @_s.JsonKey(name: 'VpcId')
  final String vpcId;

  AwsLambdaFunctionVpcConfig({
    this.securityGroupIds,
    this.subnetIds,
    this.vpcId,
  });
  factory AwsLambdaFunctionVpcConfig.fromJson(Map<String, dynamic> json) =>
      _$AwsLambdaFunctionVpcConfigFromJson(json);

  Map<String, dynamic> toJson() => _$AwsLambdaFunctionVpcConfigToJson(this);
}

/// Details about a Lambda layer version.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsLambdaLayerVersionDetails {
  /// The layer's compatible runtimes. Maximum number of 5 items.
  ///
  /// Valid values: <code>nodejs10.x</code> | <code>nodejs12.x</code> |
  /// <code>java8</code> | <code>java11</code> | <code>python2.7</code> |
  /// <code>python3.6</code> | <code>python3.7</code> | <code>python3.8</code> |
  /// <code>dotnetcore1.0</code> | <code>dotnetcore2.1</code> | <code>go1.x</code>
  /// | <code>ruby2.5</code> | <code>provided</code>
  @_s.JsonKey(name: 'CompatibleRuntimes')
  final List<String> compatibleRuntimes;

  /// The date that the version was created, in ISO 8601 format. For example,
  /// 2018-11-27T15:10:45.123+0000.
  @_s.JsonKey(name: 'CreatedDate')
  final String createdDate;

  /// The version number.
  @_s.JsonKey(name: 'Version')
  final int version;

  AwsLambdaLayerVersionDetails({
    this.compatibleRuntimes,
    this.createdDate,
    this.version,
  });
  factory AwsLambdaLayerVersionDetails.fromJson(Map<String, dynamic> json) =>
      _$AwsLambdaLayerVersionDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$AwsLambdaLayerVersionDetailsToJson(this);
}

/// An AWS Identity and Access Management (IAM) role associated with the DB
/// instance.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsRdsDbInstanceAssociatedRole {
  /// The name of the feature associated with the IAM)role.
  @_s.JsonKey(name: 'FeatureName')
  final String featureName;

  /// The Amazon Resource Name (ARN) of the IAM role that is associated with the
  /// DB instance.
  @_s.JsonKey(name: 'RoleArn')
  final String roleArn;

  /// Describes the state of the association between the IAM role and the DB
  /// instance. The <code>Status</code> property returns one of the following
  /// values:
  ///
  /// <ul>
  /// <li>
  /// <code>ACTIVE</code> - the IAM role ARN is associated with the DB instance
  /// and can be used to access other AWS services on your behalf.
  /// </li>
  /// <li>
  /// <code>PENDING</code> - the IAM role ARN is being associated with the DB
  /// instance.
  /// </li>
  /// <li>
  /// <code>INVALID</code> - the IAM role ARN is associated with the DB instance,
  /// but the DB instance is unable to assume the IAM role in order to access
  /// other AWS services on your behalf.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Status')
  final String status;

  AwsRdsDbInstanceAssociatedRole({
    this.featureName,
    this.roleArn,
    this.status,
  });
  factory AwsRdsDbInstanceAssociatedRole.fromJson(Map<String, dynamic> json) =>
      _$AwsRdsDbInstanceAssociatedRoleFromJson(json);

  Map<String, dynamic> toJson() => _$AwsRdsDbInstanceAssociatedRoleToJson(this);
}

/// Contains the details of an Amazon RDS DB instance.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsRdsDbInstanceDetails {
  /// The AWS Identity and Access Management (IAM) roles associated with the DB
  /// instance.
  @_s.JsonKey(name: 'AssociatedRoles')
  final List<AwsRdsDbInstanceAssociatedRole> associatedRoles;

  /// The identifier of the CA certificate for this DB instance.
  @_s.JsonKey(name: 'CACertificateIdentifier')
  final String cACertificateIdentifier;

  /// If the DB instance is a member of a DB cluster, contains the name of the DB
  /// cluster that the DB instance is a member of.
  @_s.JsonKey(name: 'DBClusterIdentifier')
  final String dBClusterIdentifier;

  /// Contains the name of the compute and memory capacity class of the DB
  /// instance.
  @_s.JsonKey(name: 'DBInstanceClass')
  final String dBInstanceClass;

  /// Contains a user-supplied database identifier. This identifier is the unique
  /// key that identifies a DB instance.
  @_s.JsonKey(name: 'DBInstanceIdentifier')
  final String dBInstanceIdentifier;

  /// The meaning of this parameter differs according to the database engine you
  /// use.
  ///
  /// <b>MySQL, MariaDB, SQL Server, PostgreSQL</b>
  ///
  /// Contains the name of the initial database of this instance that was provided
  /// at create time, if one was specified when the DB instance was created. This
  /// same name is returned for the life of the DB instance.
  ///
  /// <b>Oracle</b>
  ///
  /// Contains the Oracle System ID (SID) of the created DB instance. Not shown
  /// when the returned parameters do not apply to an Oracle DB instance.
  @_s.JsonKey(name: 'DBName')
  final String dBName;

  /// Specifies the port that the DB instance listens on. If the DB instance is
  /// part of a DB cluster, this can be a different port than the DB cluster port.
  @_s.JsonKey(name: 'DbInstancePort')
  final int dbInstancePort;

  /// The AWS Region-unique, immutable identifier for the DB instance. This
  /// identifier is found in AWS CloudTrail log entries whenever the AWS KMS key
  /// for the DB instance is accessed.
  @_s.JsonKey(name: 'DbiResourceId')
  final String dbiResourceId;

  /// Indicates whether the DB instance has deletion protection enabled.
  ///
  /// When deletion protection is enabled, the database cannot be deleted.
  @_s.JsonKey(name: 'DeletionProtection')
  final bool deletionProtection;

  /// Specifies the connection endpoint.
  @_s.JsonKey(name: 'Endpoint')
  final AwsRdsDbInstanceEndpoint endpoint;

  /// Provides the name of the database engine to use for this DB instance.
  @_s.JsonKey(name: 'Engine')
  final String engine;

  /// Indicates the database engine version.
  @_s.JsonKey(name: 'EngineVersion')
  final String engineVersion;

  /// True if mapping of AWS Identity and Access Management (IAM) accounts to
  /// database accounts is enabled, and otherwise false.
  ///
  /// IAM database authentication can be enabled for the following database
  /// engines.
  ///
  /// <ul>
  /// <li>
  /// For MySQL 5.6, minor version 5.6.34 or higher
  /// </li>
  /// <li>
  /// For MySQL 5.7, minor version 5.7.16 or higher
  /// </li>
  /// <li>
  /// Aurora 5.6 or higher
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'IAMDatabaseAuthenticationEnabled')
  final bool iAMDatabaseAuthenticationEnabled;

  /// Provides the date and time the DB instance was created.
  @_s.JsonKey(name: 'InstanceCreateTime')
  final String instanceCreateTime;

  /// If <code>StorageEncrypted</code> is true, the AWS KMS key identifier for the
  /// encrypted DB instance.
  @_s.JsonKey(name: 'KmsKeyId')
  final String kmsKeyId;

  /// Specifies the accessibility options for the DB instance.
  ///
  /// A value of true specifies an Internet-facing instance with a publicly
  /// resolvable DNS name, which resolves to a public IP address.
  ///
  /// A value of false specifies an internal instance with a DNS name that
  /// resolves to a private IP address.
  @_s.JsonKey(name: 'PubliclyAccessible')
  final bool publiclyAccessible;

  /// Specifies whether the DB instance is encrypted.
  @_s.JsonKey(name: 'StorageEncrypted')
  final bool storageEncrypted;

  /// The ARN from the key store with which the instance is associated for TDE
  /// encryption.
  @_s.JsonKey(name: 'TdeCredentialArn')
  final String tdeCredentialArn;

  /// A list of VPC security groups that the DB instance belongs to.
  @_s.JsonKey(name: 'VpcSecurityGroups')
  final List<AwsRdsDbInstanceVpcSecurityGroup> vpcSecurityGroups;

  AwsRdsDbInstanceDetails({
    this.associatedRoles,
    this.cACertificateIdentifier,
    this.dBClusterIdentifier,
    this.dBInstanceClass,
    this.dBInstanceIdentifier,
    this.dBName,
    this.dbInstancePort,
    this.dbiResourceId,
    this.deletionProtection,
    this.endpoint,
    this.engine,
    this.engineVersion,
    this.iAMDatabaseAuthenticationEnabled,
    this.instanceCreateTime,
    this.kmsKeyId,
    this.publiclyAccessible,
    this.storageEncrypted,
    this.tdeCredentialArn,
    this.vpcSecurityGroups,
  });
  factory AwsRdsDbInstanceDetails.fromJson(Map<String, dynamic> json) =>
      _$AwsRdsDbInstanceDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$AwsRdsDbInstanceDetailsToJson(this);
}

/// Specifies the connection endpoint.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsRdsDbInstanceEndpoint {
  /// Specifies the DNS address of the DB instance.
  @_s.JsonKey(name: 'Address')
  final String address;

  /// Specifies the ID that Amazon Route 53 assigns when you create a hosted zone.
  @_s.JsonKey(name: 'HostedZoneId')
  final String hostedZoneId;

  /// Specifies the port that the database engine is listening on.
  @_s.JsonKey(name: 'Port')
  final int port;

  AwsRdsDbInstanceEndpoint({
    this.address,
    this.hostedZoneId,
    this.port,
  });
  factory AwsRdsDbInstanceEndpoint.fromJson(Map<String, dynamic> json) =>
      _$AwsRdsDbInstanceEndpointFromJson(json);

  Map<String, dynamic> toJson() => _$AwsRdsDbInstanceEndpointToJson(this);
}

/// A VPC security groups that the DB instance belongs to.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsRdsDbInstanceVpcSecurityGroup {
  /// The status of the VPC security group.
  @_s.JsonKey(name: 'Status')
  final String status;

  /// The name of the VPC security group.
  @_s.JsonKey(name: 'VpcSecurityGroupId')
  final String vpcSecurityGroupId;

  AwsRdsDbInstanceVpcSecurityGroup({
    this.status,
    this.vpcSecurityGroupId,
  });
  factory AwsRdsDbInstanceVpcSecurityGroup.fromJson(
          Map<String, dynamic> json) =>
      _$AwsRdsDbInstanceVpcSecurityGroupFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AwsRdsDbInstanceVpcSecurityGroupToJson(this);
}

/// The details of an Amazon S3 bucket.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsS3BucketDetails {
  /// The date and time when the S3 bucket was created.
  @_s.JsonKey(name: 'CreatedAt')
  final String createdAt;

  /// The canonical user ID of the owner of the S3 bucket.
  @_s.JsonKey(name: 'OwnerId')
  final String ownerId;

  /// The display name of the owner of the S3 bucket.
  @_s.JsonKey(name: 'OwnerName')
  final String ownerName;

  /// The encryption rules that are applied to the S3 bucket.
  @_s.JsonKey(name: 'ServerSideEncryptionConfiguration')
  final AwsS3BucketServerSideEncryptionConfiguration
      serverSideEncryptionConfiguration;

  AwsS3BucketDetails({
    this.createdAt,
    this.ownerId,
    this.ownerName,
    this.serverSideEncryptionConfiguration,
  });
  factory AwsS3BucketDetails.fromJson(Map<String, dynamic> json) =>
      _$AwsS3BucketDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$AwsS3BucketDetailsToJson(this);
}

/// Specifies the default server-side encryption to apply to new objects in the
/// bucket.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsS3BucketServerSideEncryptionByDefault {
  /// AWS KMS customer master key (CMK) ID to use for the default encryption.
  @_s.JsonKey(name: 'KMSMasterKeyID')
  final String kMSMasterKeyID;

  /// Server-side encryption algorithm to use for the default encryption.
  @_s.JsonKey(name: 'SSEAlgorithm')
  final String sSEAlgorithm;

  AwsS3BucketServerSideEncryptionByDefault({
    this.kMSMasterKeyID,
    this.sSEAlgorithm,
  });
  factory AwsS3BucketServerSideEncryptionByDefault.fromJson(
          Map<String, dynamic> json) =>
      _$AwsS3BucketServerSideEncryptionByDefaultFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AwsS3BucketServerSideEncryptionByDefaultToJson(this);
}

/// The encryption configuration for the S3 bucket.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsS3BucketServerSideEncryptionConfiguration {
  /// The encryption rules that are applied to the S3 bucket.
  @_s.JsonKey(name: 'Rules')
  final List<AwsS3BucketServerSideEncryptionRule> rules;

  AwsS3BucketServerSideEncryptionConfiguration({
    this.rules,
  });
  factory AwsS3BucketServerSideEncryptionConfiguration.fromJson(
          Map<String, dynamic> json) =>
      _$AwsS3BucketServerSideEncryptionConfigurationFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AwsS3BucketServerSideEncryptionConfigurationToJson(this);
}

/// An encryption rule to apply to the S3 bucket.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsS3BucketServerSideEncryptionRule {
  /// Specifies the default server-side encryption to apply to new objects in the
  /// bucket. If a <code>PUT</code> Object request doesn't specify any server-side
  /// encryption, this default encryption is applied.
  @_s.JsonKey(name: 'ApplyServerSideEncryptionByDefault')
  final AwsS3BucketServerSideEncryptionByDefault
      applyServerSideEncryptionByDefault;

  AwsS3BucketServerSideEncryptionRule({
    this.applyServerSideEncryptionByDefault,
  });
  factory AwsS3BucketServerSideEncryptionRule.fromJson(
          Map<String, dynamic> json) =>
      _$AwsS3BucketServerSideEncryptionRuleFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AwsS3BucketServerSideEncryptionRuleToJson(this);
}

/// Details about an AWS S3 object.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsS3ObjectDetails {
  /// A standard MIME type describing the format of the object data.
  @_s.JsonKey(name: 'ContentType')
  final String contentType;

  /// The opaque identifier assigned by a web server to a specific version of a
  /// resource found at a URL.
  @_s.JsonKey(name: 'ETag')
  final String eTag;

  /// The date and time when the object was last modified.
  @_s.JsonKey(name: 'LastModified')
  final String lastModified;

  /// The identifier of the AWS Key Management Service (AWS KMS) symmetric
  /// customer managed customer master key (CMK) that was used for the object.
  @_s.JsonKey(name: 'SSEKMSKeyId')
  final String sSEKMSKeyId;

  /// If the object is stored using server-side encryption, the value of the
  /// server-side encryption algorithm used when storing this object in Amazon S3.
  @_s.JsonKey(name: 'ServerSideEncryption')
  final String serverSideEncryption;

  /// The version of the object.
  @_s.JsonKey(name: 'VersionId')
  final String versionId;

  AwsS3ObjectDetails({
    this.contentType,
    this.eTag,
    this.lastModified,
    this.sSEKMSKeyId,
    this.serverSideEncryption,
    this.versionId,
  });
  factory AwsS3ObjectDetails.fromJson(Map<String, dynamic> json) =>
      _$AwsS3ObjectDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$AwsS3ObjectDetailsToJson(this);
}

/// Provides consistent format for the contents of the Security Hub-aggregated
/// findings. <code>AwsSecurityFinding</code> format enables you to share
/// findings between AWS security services and third-party solutions, and
/// security standards checks.
/// <note>
/// A finding is a potential security issue generated either by AWS services
/// (Amazon GuardDuty, Amazon Inspector, and Amazon Macie) or by the integrated
/// third-party solutions and standards checks.
/// </note>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsSecurityFinding {
  /// The AWS account ID that a finding is generated in.
  @_s.JsonKey(name: 'AwsAccountId')
  final String awsAccountId;

  /// An ISO8601-formatted timestamp that indicates when the security-findings
  /// provider created the potential security issue that a finding captured.
  @_s.JsonKey(name: 'CreatedAt')
  final String createdAt;

  /// A finding's description.
  /// <note>
  /// In this release, <code>Description</code> is a required property.
  /// </note>
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The identifier for the solution-specific component (a discrete unit of
  /// logic) that generated a finding. In various security-findings providers'
  /// solutions, this generator can be called a rule, a check, a detector, a
  /// plug-in, etc.
  @_s.JsonKey(name: 'GeneratorId')
  final String generatorId;

  /// The security findings provider-specific identifier for a finding.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The ARN generated by Security Hub that uniquely identifies a product that
  /// generates findings. This can be the ARN for a third-party product that is
  /// integrated with Security Hub, or the ARN for a custom integration.
  @_s.JsonKey(name: 'ProductArn')
  final String productArn;

  /// A set of resource data types that describe the resources that the finding
  /// refers to.
  @_s.JsonKey(name: 'Resources')
  final List<Resource> resources;

  /// The schema version that a finding is formatted for.
  @_s.JsonKey(name: 'SchemaVersion')
  final String schemaVersion;

  /// A finding's severity.
  @_s.JsonKey(name: 'Severity')
  final Severity severity;

  /// A finding's title.
  /// <note>
  /// In this release, <code>Title</code> is a required property.
  /// </note>
  @_s.JsonKey(name: 'Title')
  final String title;

  /// One or more finding types in the format of
  /// <code>namespace/category/classifier</code> that classify a finding.
  ///
  /// Valid namespace values are: Software and Configuration Checks | TTPs |
  /// Effects | Unusual Behaviors | Sensitive Data Identifications
  @_s.JsonKey(name: 'Types')
  final List<String> types;

  /// An ISO8601-formatted timestamp that indicates when the security-findings
  /// provider last updated the finding record.
  @_s.JsonKey(name: 'UpdatedAt')
  final String updatedAt;

  /// This data type is exclusive to findings that are generated as the result of
  /// a check run against a specific rule in a supported security standard, such
  /// as CIS AWS Foundations. Contains security standard-related finding details.
  @_s.JsonKey(name: 'Compliance')
  final Compliance compliance;

  /// A finding's confidence. Confidence is defined as the likelihood that a
  /// finding accurately identifies the behavior or issue that it was intended to
  /// identify.
  ///
  /// Confidence is scored on a 0-100 basis using a ratio scale, where 0 means
  /// zero percent confidence and 100 means 100 percent confidence.
  @_s.JsonKey(name: 'Confidence')
  final int confidence;

  /// The level of importance assigned to the resources associated with the
  /// finding.
  ///
  /// A score of 0 means that the underlying resources have no criticality, and a
  /// score of 100 is reserved for the most critical resources.
  @_s.JsonKey(name: 'Criticality')
  final int criticality;

  /// An ISO8601-formatted timestamp that indicates when the security-findings
  /// provider first observed the potential security issue that a finding
  /// captured.
  @_s.JsonKey(name: 'FirstObservedAt')
  final String firstObservedAt;

  /// An ISO8601-formatted timestamp that indicates when the security-findings
  /// provider most recently observed the potential security issue that a finding
  /// captured.
  @_s.JsonKey(name: 'LastObservedAt')
  final String lastObservedAt;

  /// A list of malware related to a finding.
  @_s.JsonKey(name: 'Malware')
  final List<Malware> malware;

  /// The details of network-related information about a finding.
  @_s.JsonKey(name: 'Network')
  final Network network;

  /// A user-defined note added to a finding.
  @_s.JsonKey(name: 'Note')
  final Note note;

  /// The details of process-related information about a finding.
  @_s.JsonKey(name: 'Process')
  final ProcessDetails process;

  /// A data type where security-findings providers can include additional
  /// solution-specific details that aren't part of the defined
  /// <code>AwsSecurityFinding</code> format.
  @_s.JsonKey(name: 'ProductFields')
  final Map<String, String> productFields;

  /// The record state of a finding.
  @_s.JsonKey(name: 'RecordState')
  final RecordState recordState;

  /// A list of related findings.
  @_s.JsonKey(name: 'RelatedFindings')
  final List<RelatedFinding> relatedFindings;

  /// A data type that describes the remediation options for a finding.
  @_s.JsonKey(name: 'Remediation')
  final Remediation remediation;

  /// A URL that links to a page about the current finding in the
  /// security-findings provider's solution.
  @_s.JsonKey(name: 'SourceUrl')
  final String sourceUrl;

  /// Threat intelligence details related to a finding.
  @_s.JsonKey(name: 'ThreatIntelIndicators')
  final List<ThreatIntelIndicator> threatIntelIndicators;

  /// A list of name/value string pairs associated with the finding. These are
  /// custom, user-defined fields added to a finding.
  @_s.JsonKey(name: 'UserDefinedFields')
  final Map<String, String> userDefinedFields;

  /// Indicates the veracity of a finding.
  @_s.JsonKey(name: 'VerificationState')
  final VerificationState verificationState;

  /// Provides information about the status of the investigation into a finding.
  @_s.JsonKey(name: 'Workflow')
  final Workflow workflow;

  /// The workflow state of a finding.
  @_s.JsonKey(name: 'WorkflowState')
  final WorkflowState workflowState;

  AwsSecurityFinding({
    @_s.required this.awsAccountId,
    @_s.required this.createdAt,
    @_s.required this.description,
    @_s.required this.generatorId,
    @_s.required this.id,
    @_s.required this.productArn,
    @_s.required this.resources,
    @_s.required this.schemaVersion,
    @_s.required this.severity,
    @_s.required this.title,
    @_s.required this.types,
    @_s.required this.updatedAt,
    this.compliance,
    this.confidence,
    this.criticality,
    this.firstObservedAt,
    this.lastObservedAt,
    this.malware,
    this.network,
    this.note,
    this.process,
    this.productFields,
    this.recordState,
    this.relatedFindings,
    this.remediation,
    this.sourceUrl,
    this.threatIntelIndicators,
    this.userDefinedFields,
    this.verificationState,
    this.workflow,
    this.workflowState,
  });
  factory AwsSecurityFinding.fromJson(Map<String, dynamic> json) =>
      _$AwsSecurityFindingFromJson(json);

  Map<String, dynamic> toJson() => _$AwsSecurityFindingToJson(this);
}

/// A collection of attributes that are applied to all active Security
/// Hub-aggregated findings and that result in a subset of findings that are
/// included in this insight.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsSecurityFindingFilters {
  /// The AWS account ID that a finding is generated in.
  @_s.JsonKey(name: 'AwsAccountId')
  final List<StringFilter> awsAccountId;

  /// The name of the findings provider (company) that owns the solution (product)
  /// that generates findings.
  @_s.JsonKey(name: 'CompanyName')
  final List<StringFilter> companyName;

  /// Exclusive to findings that are generated as the result of a check run
  /// against a specific rule in a supported standard, such as CIS AWS
  /// Foundations. Contains security standard-related finding details.
  @_s.JsonKey(name: 'ComplianceStatus')
  final List<StringFilter> complianceStatus;

  /// A finding's confidence. Confidence is defined as the likelihood that a
  /// finding accurately identifies the behavior or issue that it was intended to
  /// identify.
  ///
  /// Confidence is scored on a 0-100 basis using a ratio scale, where 0 means
  /// zero percent confidence and 100 means 100 percent confidence.
  @_s.JsonKey(name: 'Confidence')
  final List<NumberFilter> confidence;

  /// An ISO8601-formatted timestamp that indicates when the security-findings
  /// provider captured the potential security issue that a finding captured.
  @_s.JsonKey(name: 'CreatedAt')
  final List<DateFilter> createdAt;

  /// The level of importance assigned to the resources associated with the
  /// finding.
  ///
  /// A score of 0 means that the underlying resources have no criticality, and a
  /// score of 100 is reserved for the most critical resources.
  @_s.JsonKey(name: 'Criticality')
  final List<NumberFilter> criticality;

  /// A finding's description.
  @_s.JsonKey(name: 'Description')
  final List<StringFilter> description;

  /// An ISO8601-formatted timestamp that indicates when the security-findings
  /// provider first observed the potential security issue that a finding
  /// captured.
  @_s.JsonKey(name: 'FirstObservedAt')
  final List<DateFilter> firstObservedAt;

  /// The identifier for the solution-specific component (a discrete unit of
  /// logic) that generated a finding. In various security-findings providers'
  /// solutions, this generator can be called a rule, a check, a detector, a
  /// plug-in, etc.
  @_s.JsonKey(name: 'GeneratorId')
  final List<StringFilter> generatorId;

  /// The security findings provider-specific identifier for a finding.
  @_s.JsonKey(name: 'Id')
  final List<StringFilter> id;

  /// A keyword for a finding.
  @_s.JsonKey(name: 'Keyword')
  final List<KeywordFilter> keyword;

  /// An ISO8601-formatted timestamp that indicates when the security-findings
  /// provider most recently observed the potential security issue that a finding
  /// captured.
  @_s.JsonKey(name: 'LastObservedAt')
  final List<DateFilter> lastObservedAt;

  /// The name of the malware that was observed.
  @_s.JsonKey(name: 'MalwareName')
  final List<StringFilter> malwareName;

  /// The filesystem path of the malware that was observed.
  @_s.JsonKey(name: 'MalwarePath')
  final List<StringFilter> malwarePath;

  /// The state of the malware that was observed.
  @_s.JsonKey(name: 'MalwareState')
  final List<StringFilter> malwareState;

  /// The type of the malware that was observed.
  @_s.JsonKey(name: 'MalwareType')
  final List<StringFilter> malwareType;

  /// The destination domain of network-related information about a finding.
  @_s.JsonKey(name: 'NetworkDestinationDomain')
  final List<StringFilter> networkDestinationDomain;

  /// The destination IPv4 address of network-related information about a finding.
  @_s.JsonKey(name: 'NetworkDestinationIpV4')
  final List<IpFilter> networkDestinationIpV4;

  /// The destination IPv6 address of network-related information about a finding.
  @_s.JsonKey(name: 'NetworkDestinationIpV6')
  final List<IpFilter> networkDestinationIpV6;

  /// The destination port of network-related information about a finding.
  @_s.JsonKey(name: 'NetworkDestinationPort')
  final List<NumberFilter> networkDestinationPort;

  /// Indicates the direction of network traffic associated with a finding.
  @_s.JsonKey(name: 'NetworkDirection')
  final List<StringFilter> networkDirection;

  /// The protocol of network-related information about a finding.
  @_s.JsonKey(name: 'NetworkProtocol')
  final List<StringFilter> networkProtocol;

  /// The source domain of network-related information about a finding.
  @_s.JsonKey(name: 'NetworkSourceDomain')
  final List<StringFilter> networkSourceDomain;

  /// The source IPv4 address of network-related information about a finding.
  @_s.JsonKey(name: 'NetworkSourceIpV4')
  final List<IpFilter> networkSourceIpV4;

  /// The source IPv6 address of network-related information about a finding.
  @_s.JsonKey(name: 'NetworkSourceIpV6')
  final List<IpFilter> networkSourceIpV6;

  /// The source media access control (MAC) address of network-related information
  /// about a finding.
  @_s.JsonKey(name: 'NetworkSourceMac')
  final List<StringFilter> networkSourceMac;

  /// The source port of network-related information about a finding.
  @_s.JsonKey(name: 'NetworkSourcePort')
  final List<NumberFilter> networkSourcePort;

  /// The text of a note.
  @_s.JsonKey(name: 'NoteText')
  final List<StringFilter> noteText;

  /// The timestamp of when the note was updated.
  @_s.JsonKey(name: 'NoteUpdatedAt')
  final List<DateFilter> noteUpdatedAt;

  /// The principal that created a note.
  @_s.JsonKey(name: 'NoteUpdatedBy')
  final List<StringFilter> noteUpdatedBy;

  /// The date/time that the process was launched.
  @_s.JsonKey(name: 'ProcessLaunchedAt')
  final List<DateFilter> processLaunchedAt;

  /// The name of the process.
  @_s.JsonKey(name: 'ProcessName')
  final List<StringFilter> processName;

  /// The parent process ID.
  @_s.JsonKey(name: 'ProcessParentPid')
  final List<NumberFilter> processParentPid;

  /// The path to the process executable.
  @_s.JsonKey(name: 'ProcessPath')
  final List<StringFilter> processPath;

  /// The process ID.
  @_s.JsonKey(name: 'ProcessPid')
  final List<NumberFilter> processPid;

  /// The date/time that the process was terminated.
  @_s.JsonKey(name: 'ProcessTerminatedAt')
  final List<DateFilter> processTerminatedAt;

  /// The ARN generated by Security Hub that uniquely identifies a third-party
  /// company (security findings provider) after this provider's product (solution
  /// that generates findings) is registered with Security Hub.
  @_s.JsonKey(name: 'ProductArn')
  final List<StringFilter> productArn;

  /// A data type where security-findings providers can include additional
  /// solution-specific details that aren't part of the defined
  /// <code>AwsSecurityFinding</code> format.
  @_s.JsonKey(name: 'ProductFields')
  final List<MapFilter> productFields;

  /// The name of the solution (product) that generates findings.
  @_s.JsonKey(name: 'ProductName')
  final List<StringFilter> productName;

  /// The recommendation of what to do about the issue described in a finding.
  @_s.JsonKey(name: 'RecommendationText')
  final List<StringFilter> recommendationText;

  /// The updated record state for the finding.
  @_s.JsonKey(name: 'RecordState')
  final List<StringFilter> recordState;

  /// The solution-generated identifier for a related finding.
  @_s.JsonKey(name: 'RelatedFindingsId')
  final List<StringFilter> relatedFindingsId;

  /// The ARN of the solution that generated a related finding.
  @_s.JsonKey(name: 'RelatedFindingsProductArn')
  final List<StringFilter> relatedFindingsProductArn;

  /// The IAM profile ARN of the instance.
  @_s.JsonKey(name: 'ResourceAwsEc2InstanceIamInstanceProfileArn')
  final List<StringFilter> resourceAwsEc2InstanceIamInstanceProfileArn;

  /// The Amazon Machine Image (AMI) ID of the instance.
  @_s.JsonKey(name: 'ResourceAwsEc2InstanceImageId')
  final List<StringFilter> resourceAwsEc2InstanceImageId;

  /// The IPv4 addresses associated with the instance.
  @_s.JsonKey(name: 'ResourceAwsEc2InstanceIpV4Addresses')
  final List<IpFilter> resourceAwsEc2InstanceIpV4Addresses;

  /// The IPv6 addresses associated with the instance.
  @_s.JsonKey(name: 'ResourceAwsEc2InstanceIpV6Addresses')
  final List<IpFilter> resourceAwsEc2InstanceIpV6Addresses;

  /// The key name associated with the instance.
  @_s.JsonKey(name: 'ResourceAwsEc2InstanceKeyName')
  final List<StringFilter> resourceAwsEc2InstanceKeyName;

  /// The date and time the instance was launched.
  @_s.JsonKey(name: 'ResourceAwsEc2InstanceLaunchedAt')
  final List<DateFilter> resourceAwsEc2InstanceLaunchedAt;

  /// The identifier of the subnet that the instance was launched in.
  @_s.JsonKey(name: 'ResourceAwsEc2InstanceSubnetId')
  final List<StringFilter> resourceAwsEc2InstanceSubnetId;

  /// The instance type of the instance.
  @_s.JsonKey(name: 'ResourceAwsEc2InstanceType')
  final List<StringFilter> resourceAwsEc2InstanceType;

  /// The identifier of the VPC that the instance was launched in.
  @_s.JsonKey(name: 'ResourceAwsEc2InstanceVpcId')
  final List<StringFilter> resourceAwsEc2InstanceVpcId;

  /// The creation date/time of the IAM access key related to a finding.
  @_s.JsonKey(name: 'ResourceAwsIamAccessKeyCreatedAt')
  final List<DateFilter> resourceAwsIamAccessKeyCreatedAt;

  /// The status of the IAM access key related to a finding.
  @_s.JsonKey(name: 'ResourceAwsIamAccessKeyStatus')
  final List<StringFilter> resourceAwsIamAccessKeyStatus;

  /// The user associated with the IAM access key related to a finding.
  @_s.JsonKey(name: 'ResourceAwsIamAccessKeyUserName')
  final List<StringFilter> resourceAwsIamAccessKeyUserName;

  /// The canonical user ID of the owner of the S3 bucket.
  @_s.JsonKey(name: 'ResourceAwsS3BucketOwnerId')
  final List<StringFilter> resourceAwsS3BucketOwnerId;

  /// The display name of the owner of the S3 bucket.
  @_s.JsonKey(name: 'ResourceAwsS3BucketOwnerName')
  final List<StringFilter> resourceAwsS3BucketOwnerName;

  /// The identifier of the image related to a finding.
  @_s.JsonKey(name: 'ResourceContainerImageId')
  final List<StringFilter> resourceContainerImageId;

  /// The name of the image related to a finding.
  @_s.JsonKey(name: 'ResourceContainerImageName')
  final List<StringFilter> resourceContainerImageName;

  /// The date/time that the container was started.
  @_s.JsonKey(name: 'ResourceContainerLaunchedAt')
  final List<DateFilter> resourceContainerLaunchedAt;

  /// The name of the container related to a finding.
  @_s.JsonKey(name: 'ResourceContainerName')
  final List<StringFilter> resourceContainerName;

  /// The details of a resource that doesn't have a specific subfield for the
  /// resource type defined.
  @_s.JsonKey(name: 'ResourceDetailsOther')
  final List<MapFilter> resourceDetailsOther;

  /// The canonical identifier for the given resource type.
  @_s.JsonKey(name: 'ResourceId')
  final List<StringFilter> resourceId;

  /// The canonical AWS partition name that the Region is assigned to.
  @_s.JsonKey(name: 'ResourcePartition')
  final List<StringFilter> resourcePartition;

  /// The canonical AWS external Region name where this resource is located.
  @_s.JsonKey(name: 'ResourceRegion')
  final List<StringFilter> resourceRegion;

  /// A list of AWS tags associated with a resource at the time the finding was
  /// processed.
  @_s.JsonKey(name: 'ResourceTags')
  final List<MapFilter> resourceTags;

  /// Specifies the type of the resource that details are provided for.
  @_s.JsonKey(name: 'ResourceType')
  final List<StringFilter> resourceType;

  /// The label of a finding's severity.
  @_s.JsonKey(name: 'SeverityLabel')
  final List<StringFilter> severityLabel;

  /// The normalized severity of a finding.
  @_s.JsonKey(name: 'SeverityNormalized')
  final List<NumberFilter> severityNormalized;

  /// The native severity as defined by the security-findings provider's solution
  /// that generated the finding.
  @_s.JsonKey(name: 'SeverityProduct')
  final List<NumberFilter> severityProduct;

  /// A URL that links to a page about the current finding in the
  /// security-findings provider's solution.
  @_s.JsonKey(name: 'SourceUrl')
  final List<StringFilter> sourceUrl;

  /// The category of a threat intelligence indicator.
  @_s.JsonKey(name: 'ThreatIntelIndicatorCategory')
  final List<StringFilter> threatIntelIndicatorCategory;

  /// The date/time of the last observation of a threat intelligence indicator.
  @_s.JsonKey(name: 'ThreatIntelIndicatorLastObservedAt')
  final List<DateFilter> threatIntelIndicatorLastObservedAt;

  /// The source of the threat intelligence.
  @_s.JsonKey(name: 'ThreatIntelIndicatorSource')
  final List<StringFilter> threatIntelIndicatorSource;

  /// The URL for more details from the source of the threat intelligence.
  @_s.JsonKey(name: 'ThreatIntelIndicatorSourceUrl')
  final List<StringFilter> threatIntelIndicatorSourceUrl;

  /// The type of a threat intelligence indicator.
  @_s.JsonKey(name: 'ThreatIntelIndicatorType')
  final List<StringFilter> threatIntelIndicatorType;

  /// The value of a threat intelligence indicator.
  @_s.JsonKey(name: 'ThreatIntelIndicatorValue')
  final List<StringFilter> threatIntelIndicatorValue;

  /// A finding's title.
  @_s.JsonKey(name: 'Title')
  final List<StringFilter> title;

  /// A finding type in the format of <code>namespace/category/classifier</code>
  /// that classifies a finding.
  @_s.JsonKey(name: 'Type')
  final List<StringFilter> type;

  /// An ISO8601-formatted timestamp that indicates when the security-findings
  /// provider last updated the finding record.
  @_s.JsonKey(name: 'UpdatedAt')
  final List<DateFilter> updatedAt;

  /// A list of name/value string pairs associated with the finding. These are
  /// custom, user-defined fields added to a finding.
  @_s.JsonKey(name: 'UserDefinedFields')
  final List<MapFilter> userDefinedFields;

  /// The veracity of a finding.
  @_s.JsonKey(name: 'VerificationState')
  final List<StringFilter> verificationState;

  /// The workflow state of a finding.
  @_s.JsonKey(name: 'WorkflowState')
  final List<StringFilter> workflowState;

  /// The status of the investigation into a finding. Allowed values are the
  /// following.
  ///
  /// <ul>
  /// <li>
  /// <code>NEW</code> - The initial state of a finding, before it is reviewed.
  /// </li>
  /// <li>
  /// <code>NOTIFIED</code> - Indicates that the resource owner has been notified
  /// about the security issue. Used when the initial reviewer is not the resource
  /// owner, and needs intervention from the resource owner.
  /// </li>
  /// <li>
  /// <code>SUPPRESSED</code> - The finding will not be reviewed again and will
  /// not be acted upon.
  /// </li>
  /// <li>
  /// <code>RESOLVED</code> - The finding was reviewed and remediated and is now
  /// considered resolved.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'WorkflowStatus')
  final List<StringFilter> workflowStatus;

  AwsSecurityFindingFilters({
    this.awsAccountId,
    this.companyName,
    this.complianceStatus,
    this.confidence,
    this.createdAt,
    this.criticality,
    this.description,
    this.firstObservedAt,
    this.generatorId,
    this.id,
    this.keyword,
    this.lastObservedAt,
    this.malwareName,
    this.malwarePath,
    this.malwareState,
    this.malwareType,
    this.networkDestinationDomain,
    this.networkDestinationIpV4,
    this.networkDestinationIpV6,
    this.networkDestinationPort,
    this.networkDirection,
    this.networkProtocol,
    this.networkSourceDomain,
    this.networkSourceIpV4,
    this.networkSourceIpV6,
    this.networkSourceMac,
    this.networkSourcePort,
    this.noteText,
    this.noteUpdatedAt,
    this.noteUpdatedBy,
    this.processLaunchedAt,
    this.processName,
    this.processParentPid,
    this.processPath,
    this.processPid,
    this.processTerminatedAt,
    this.productArn,
    this.productFields,
    this.productName,
    this.recommendationText,
    this.recordState,
    this.relatedFindingsId,
    this.relatedFindingsProductArn,
    this.resourceAwsEc2InstanceIamInstanceProfileArn,
    this.resourceAwsEc2InstanceImageId,
    this.resourceAwsEc2InstanceIpV4Addresses,
    this.resourceAwsEc2InstanceIpV6Addresses,
    this.resourceAwsEc2InstanceKeyName,
    this.resourceAwsEc2InstanceLaunchedAt,
    this.resourceAwsEc2InstanceSubnetId,
    this.resourceAwsEc2InstanceType,
    this.resourceAwsEc2InstanceVpcId,
    this.resourceAwsIamAccessKeyCreatedAt,
    this.resourceAwsIamAccessKeyStatus,
    this.resourceAwsIamAccessKeyUserName,
    this.resourceAwsS3BucketOwnerId,
    this.resourceAwsS3BucketOwnerName,
    this.resourceContainerImageId,
    this.resourceContainerImageName,
    this.resourceContainerLaunchedAt,
    this.resourceContainerName,
    this.resourceDetailsOther,
    this.resourceId,
    this.resourcePartition,
    this.resourceRegion,
    this.resourceTags,
    this.resourceType,
    this.severityLabel,
    this.severityNormalized,
    this.severityProduct,
    this.sourceUrl,
    this.threatIntelIndicatorCategory,
    this.threatIntelIndicatorLastObservedAt,
    this.threatIntelIndicatorSource,
    this.threatIntelIndicatorSourceUrl,
    this.threatIntelIndicatorType,
    this.threatIntelIndicatorValue,
    this.title,
    this.type,
    this.updatedAt,
    this.userDefinedFields,
    this.verificationState,
    this.workflowState,
    this.workflowStatus,
  });
  factory AwsSecurityFindingFilters.fromJson(Map<String, dynamic> json) =>
      _$AwsSecurityFindingFiltersFromJson(json);

  Map<String, dynamic> toJson() => _$AwsSecurityFindingFiltersToJson(this);
}

/// Identifies a finding to update using <code>BatchUpdateFindings</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsSecurityFindingIdentifier {
  /// The identifier of the finding that was specified by the finding provider.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The ARN generated by Security Hub that uniquely identifies a product that
  /// generates findings. This can be the ARN for a third-party product that is
  /// integrated with Security Hub, or the ARN for a custom integration.
  @_s.JsonKey(name: 'ProductArn')
  final String productArn;

  AwsSecurityFindingIdentifier({
    @_s.required this.id,
    @_s.required this.productArn,
  });
  factory AwsSecurityFindingIdentifier.fromJson(Map<String, dynamic> json) =>
      _$AwsSecurityFindingIdentifierFromJson(json);

  Map<String, dynamic> toJson() => _$AwsSecurityFindingIdentifierToJson(this);
}

/// A wrapper type for the topic's Amazon Resource Name (ARN).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsSnsTopicDetails {
  /// The ID of an AWS-managed customer master key (CMK) for Amazon SNS or a
  /// custom CMK.
  @_s.JsonKey(name: 'KmsMasterKeyId')
  final String kmsMasterKeyId;

  /// The subscription's owner.
  @_s.JsonKey(name: 'Owner')
  final String owner;

  /// Subscription is an embedded property that describes the subscription
  /// endpoints of an Amazon SNS topic.
  @_s.JsonKey(name: 'Subscription')
  final List<AwsSnsTopicSubscription> subscription;

  /// The name of the topic.
  @_s.JsonKey(name: 'TopicName')
  final String topicName;

  AwsSnsTopicDetails({
    this.kmsMasterKeyId,
    this.owner,
    this.subscription,
    this.topicName,
  });
  factory AwsSnsTopicDetails.fromJson(Map<String, dynamic> json) =>
      _$AwsSnsTopicDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$AwsSnsTopicDetailsToJson(this);
}

/// A wrapper type for the attributes of an Amazon SNS subscription.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsSnsTopicSubscription {
  /// The subscription's endpoint (format depends on the protocol).
  @_s.JsonKey(name: 'Endpoint')
  final String endpoint;

  /// The subscription's protocol.
  @_s.JsonKey(name: 'Protocol')
  final String protocol;

  AwsSnsTopicSubscription({
    this.endpoint,
    this.protocol,
  });
  factory AwsSnsTopicSubscription.fromJson(Map<String, dynamic> json) =>
      _$AwsSnsTopicSubscriptionFromJson(json);

  Map<String, dynamic> toJson() => _$AwsSnsTopicSubscriptionToJson(this);
}

/// Data about a queue.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsSqsQueueDetails {
  /// The Amazon Resource Name (ARN) of the dead-letter queue to which Amazon SQS
  /// moves messages after the value of <code>maxReceiveCount</code> is exceeded.
  @_s.JsonKey(name: 'DeadLetterTargetArn')
  final String deadLetterTargetArn;

  /// The length of time, in seconds, for which Amazon SQS can reuse a data key to
  /// encrypt or decrypt messages before calling AWS KMS again.
  @_s.JsonKey(name: 'KmsDataKeyReusePeriodSeconds')
  final int kmsDataKeyReusePeriodSeconds;

  /// The ID of an AWS-managed customer master key (CMK) for Amazon SQS or a
  /// custom CMK.
  @_s.JsonKey(name: 'KmsMasterKeyId')
  final String kmsMasterKeyId;

  /// The name of the new queue.
  @_s.JsonKey(name: 'QueueName')
  final String queueName;

  AwsSqsQueueDetails({
    this.deadLetterTargetArn,
    this.kmsDataKeyReusePeriodSeconds,
    this.kmsMasterKeyId,
    this.queueName,
  });
  factory AwsSqsQueueDetails.fromJson(Map<String, dynamic> json) =>
      _$AwsSqsQueueDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$AwsSqsQueueDetailsToJson(this);
}

/// Details about a WAF WebACL.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsWafWebAclDetails {
  /// The action to perform if none of the Rules contained in the WebACL match.
  @_s.JsonKey(name: 'DefaultAction')
  final String defaultAction;

  /// A friendly name or description of the WebACL. You can't change the name of a
  /// WebACL after you create it.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// An array that contains the action for each rule in a WebACL, the priority of
  /// the rule, and the ID of the rule.
  @_s.JsonKey(name: 'Rules')
  final List<AwsWafWebAclRule> rules;

  /// A unique identifier for a WebACL.
  @_s.JsonKey(name: 'WebAclId')
  final String webAclId;

  AwsWafWebAclDetails({
    this.defaultAction,
    this.name,
    this.rules,
    this.webAclId,
  });
  factory AwsWafWebAclDetails.fromJson(Map<String, dynamic> json) =>
      _$AwsWafWebAclDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$AwsWafWebAclDetailsToJson(this);
}

/// Details for a rule in a WAF WebACL.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsWafWebAclRule {
  /// Specifies the action that CloudFront or AWS WAF takes when a web request
  /// matches the conditions in the Rule.
  @_s.JsonKey(name: 'Action')
  final WafAction action;

  /// Rules to exclude from a rule group.
  @_s.JsonKey(name: 'ExcludedRules')
  final List<WafExcludedRule> excludedRules;

  /// Use the <code>OverrideAction</code> to test your RuleGroup.
  ///
  /// Any rule in a RuleGroup can potentially block a request. If you set the
  /// <code>OverrideAction</code> to <code>None</code>, the RuleGroup blocks a
  /// request if any individual rule in the RuleGroup matches the request and is
  /// configured to block that request.
  ///
  /// However, if you first want to test the RuleGroup, set the
  /// <code>OverrideAction</code> to <code>Count</code>. The RuleGroup then
  /// overrides any block action specified by individual rules contained within
  /// the group. Instead of blocking matching requests, those requests are
  /// counted.
  ///
  /// <code>ActivatedRule</code>|<code>OverrideAction</code> applies only when
  /// updating or adding a RuleGroup to a WebACL. In this case you do not use
  /// <code>ActivatedRule</code>|<code>Action</code>. For all other update
  /// requests, <code>ActivatedRule</code>|<code>Action</code> is used instead of
  /// <code>ActivatedRule</code>|<code>OverrideAction</code>.
  @_s.JsonKey(name: 'OverrideAction')
  final WafOverrideAction overrideAction;

  /// Specifies the order in which the Rules in a WebACL are evaluated. Rules with
  /// a lower value for Priority are evaluated before Rules with a higher value.
  /// The value must be a unique integer. If you add multiple Rules to a WebACL,
  /// the values do not need to be consecutive.
  @_s.JsonKey(name: 'Priority')
  final int priority;

  /// The identifier for a Rule.
  @_s.JsonKey(name: 'RuleId')
  final String ruleId;

  /// The rule type.
  ///
  /// Valid values: <code>REGULAR</code> | <code>RATE_BASED</code> |
  /// <code>GROUP</code>
  ///
  /// The default is <code>REGULAR</code>.
  @_s.JsonKey(name: 'Type')
  final String type;

  AwsWafWebAclRule({
    this.action,
    this.excludedRules,
    this.overrideAction,
    this.priority,
    this.ruleId,
    this.type,
  });
  factory AwsWafWebAclRule.fromJson(Map<String, dynamic> json) =>
      _$AwsWafWebAclRuleFromJson(json);

  Map<String, dynamic> toJson() => _$AwsWafWebAclRuleToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchDisableStandardsResponse {
  /// The details of the standards subscriptions that were disabled.
  @_s.JsonKey(name: 'StandardsSubscriptions')
  final List<StandardsSubscription> standardsSubscriptions;

  BatchDisableStandardsResponse({
    this.standardsSubscriptions,
  });
  factory BatchDisableStandardsResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchDisableStandardsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchEnableStandardsResponse {
  /// The details of the standards subscriptions that were enabled.
  @_s.JsonKey(name: 'StandardsSubscriptions')
  final List<StandardsSubscription> standardsSubscriptions;

  BatchEnableStandardsResponse({
    this.standardsSubscriptions,
  });
  factory BatchEnableStandardsResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchEnableStandardsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchImportFindingsResponse {
  /// The number of findings that failed to import.
  @_s.JsonKey(name: 'FailedCount')
  final int failedCount;

  /// The number of findings that were successfully imported.
  @_s.JsonKey(name: 'SuccessCount')
  final int successCount;

  /// The list of findings that failed to import.
  @_s.JsonKey(name: 'FailedFindings')
  final List<ImportFindingsError> failedFindings;

  BatchImportFindingsResponse({
    @_s.required this.failedCount,
    @_s.required this.successCount,
    this.failedFindings,
  });
  factory BatchImportFindingsResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchImportFindingsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchUpdateFindingsResponse {
  /// The list of findings that were updated successfully.
  @_s.JsonKey(name: 'ProcessedFindings')
  final List<AwsSecurityFindingIdentifier> processedFindings;

  /// The list of findings that were not updated.
  @_s.JsonKey(name: 'UnprocessedFindings')
  final List<BatchUpdateFindingsUnprocessedFinding> unprocessedFindings;

  BatchUpdateFindingsResponse({
    @_s.required this.processedFindings,
    @_s.required this.unprocessedFindings,
  });
  factory BatchUpdateFindingsResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchUpdateFindingsResponseFromJson(json);
}

/// A finding from a <code>BatchUpdateFindings</code> request that Security Hub
/// was unable to update.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchUpdateFindingsUnprocessedFinding {
  /// The code associated with the error.
  @_s.JsonKey(name: 'ErrorCode')
  final String errorCode;

  /// The message associated with the error.
  @_s.JsonKey(name: 'ErrorMessage')
  final String errorMessage;

  /// The identifier of the finding that was not updated.
  @_s.JsonKey(name: 'FindingIdentifier')
  final AwsSecurityFindingIdentifier findingIdentifier;

  BatchUpdateFindingsUnprocessedFinding({
    @_s.required this.errorCode,
    @_s.required this.errorMessage,
    @_s.required this.findingIdentifier,
  });
  factory BatchUpdateFindingsUnprocessedFinding.fromJson(
          Map<String, dynamic> json) =>
      _$BatchUpdateFindingsUnprocessedFindingFromJson(json);
}

/// Exclusive to findings that are generated as the result of a check run
/// against a specific rule in a supported security standard, such as CIS AWS
/// Foundations. Contains security standard-related finding details.
///
/// Values include the following:
///
/// <ul>
/// <li>
/// Allowed values are the following:
///
/// <ul>
/// <li>
/// <code>PASSED</code> - Standards check passed for all evaluated resources.
/// </li>
/// <li>
/// <code>WARNING</code> - Some information is missing or this check is not
/// supported given your configuration.
/// </li>
/// <li>
/// <code>FAILED</code> - Standards check failed for at least one evaluated
/// resource.
/// </li>
/// <li>
/// <code>NOT_AVAILABLE</code> - Check could not be performed due to a service
/// outage, API error, or because the result of the AWS Config evaluation was
/// <code>NOT_APPLICABLE</code>. If the AWS Config evaluation result was <code>
/// NOT_APPLICABLE</code>, then after 3 days, Security Hub automatically
/// archives the finding.
/// </li>
/// </ul> </li>
/// </ul>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Compliance {
  /// List of requirements that are related to a standards control.
  @_s.JsonKey(name: 'RelatedRequirements')
  final List<String> relatedRequirements;

  /// The result of a standards check.
  @_s.JsonKey(name: 'Status')
  final ComplianceStatus status;

  Compliance({
    this.relatedRequirements,
    this.status,
  });
  factory Compliance.fromJson(Map<String, dynamic> json) =>
      _$ComplianceFromJson(json);

  Map<String, dynamic> toJson() => _$ComplianceToJson(this);
}

enum ComplianceStatus {
  @_s.JsonValue('PASSED')
  passed,
  @_s.JsonValue('WARNING')
  warning,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('NOT_AVAILABLE')
  notAvailable,
}

/// Container details related to a finding.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ContainerDetails {
  /// The identifier of the image related to a finding.
  @_s.JsonKey(name: 'ImageId')
  final String imageId;

  /// The name of the image related to a finding.
  @_s.JsonKey(name: 'ImageName')
  final String imageName;

  /// The date and time when the container started.
  @_s.JsonKey(name: 'LaunchedAt')
  final String launchedAt;

  /// The name of the container related to a finding.
  @_s.JsonKey(name: 'Name')
  final String name;

  ContainerDetails({
    this.imageId,
    this.imageName,
    this.launchedAt,
    this.name,
  });
  factory ContainerDetails.fromJson(Map<String, dynamic> json) =>
      _$ContainerDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$ContainerDetailsToJson(this);
}

enum ControlStatus {
  @_s.JsonValue('ENABLED')
  enabled,
  @_s.JsonValue('DISABLED')
  disabled,
}

extension on ControlStatus {
  String toValue() {
    switch (this) {
      case ControlStatus.enabled:
        return 'ENABLED';
      case ControlStatus.disabled:
        return 'DISABLED';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateActionTargetResponse {
  /// The ARN for the custom action target.
  @_s.JsonKey(name: 'ActionTargetArn')
  final String actionTargetArn;

  CreateActionTargetResponse({
    @_s.required this.actionTargetArn,
  });
  factory CreateActionTargetResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateActionTargetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateInsightResponse {
  /// The ARN of the insight created.
  @_s.JsonKey(name: 'InsightArn')
  final String insightArn;

  CreateInsightResponse({
    @_s.required this.insightArn,
  });
  factory CreateInsightResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateInsightResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateMembersResponse {
  /// The list of AWS accounts that were not processed. For each account, the list
  /// includes the account ID and the email address.
  @_s.JsonKey(name: 'UnprocessedAccounts')
  final List<Result> unprocessedAccounts;

  CreateMembersResponse({
    this.unprocessedAccounts,
  });
  factory CreateMembersResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateMembersResponseFromJson(json);
}

/// A date filter for querying findings.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DateFilter {
  /// A date range for the date filter.
  @_s.JsonKey(name: 'DateRange')
  final DateRange dateRange;

  /// An end date for the date filter.
  @_s.JsonKey(name: 'End')
  final String end;

  /// A start date for the date filter.
  @_s.JsonKey(name: 'Start')
  final String start;

  DateFilter({
    this.dateRange,
    this.end,
    this.start,
  });
  factory DateFilter.fromJson(Map<String, dynamic> json) =>
      _$DateFilterFromJson(json);

  Map<String, dynamic> toJson() => _$DateFilterToJson(this);
}

/// A date range for the date filter.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DateRange {
  /// A date range unit for the date filter.
  @_s.JsonKey(name: 'Unit')
  final DateRangeUnit unit;

  /// A date range value for the date filter.
  @_s.JsonKey(name: 'Value')
  final int value;

  DateRange({
    this.unit,
    this.value,
  });
  factory DateRange.fromJson(Map<String, dynamic> json) =>
      _$DateRangeFromJson(json);

  Map<String, dynamic> toJson() => _$DateRangeToJson(this);
}

enum DateRangeUnit {
  @_s.JsonValue('DAYS')
  days,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeclineInvitationsResponse {
  /// The list of AWS accounts that were not processed. For each account, the list
  /// includes the account ID and the email address.
  @_s.JsonKey(name: 'UnprocessedAccounts')
  final List<Result> unprocessedAccounts;

  DeclineInvitationsResponse({
    this.unprocessedAccounts,
  });
  factory DeclineInvitationsResponse.fromJson(Map<String, dynamic> json) =>
      _$DeclineInvitationsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteActionTargetResponse {
  /// The ARN of the custom action target that was deleted.
  @_s.JsonKey(name: 'ActionTargetArn')
  final String actionTargetArn;

  DeleteActionTargetResponse({
    @_s.required this.actionTargetArn,
  });
  factory DeleteActionTargetResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteActionTargetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteInsightResponse {
  /// The ARN of the insight that was deleted.
  @_s.JsonKey(name: 'InsightArn')
  final String insightArn;

  DeleteInsightResponse({
    @_s.required this.insightArn,
  });
  factory DeleteInsightResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteInsightResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteInvitationsResponse {
  /// The list of AWS accounts for which the invitations were not deleted. For
  /// each account, the list includes the account ID and the email address.
  @_s.JsonKey(name: 'UnprocessedAccounts')
  final List<Result> unprocessedAccounts;

  DeleteInvitationsResponse({
    this.unprocessedAccounts,
  });
  factory DeleteInvitationsResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteInvitationsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteMembersResponse {
  /// The list of AWS accounts that were not deleted. For each account, the list
  /// includes the account ID and the email address.
  @_s.JsonKey(name: 'UnprocessedAccounts')
  final List<Result> unprocessedAccounts;

  DeleteMembersResponse({
    this.unprocessedAccounts,
  });
  factory DeleteMembersResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteMembersResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeActionTargetsResponse {
  /// A list of <code>ActionTarget</code> objects. Each object includes the
  /// <code>ActionTargetArn</code>, <code>Description</code>, and
  /// <code>Name</code> of a custom action target available in Security Hub.
  @_s.JsonKey(name: 'ActionTargets')
  final List<ActionTarget> actionTargets;

  /// The pagination token to use to request the next page of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  DescribeActionTargetsResponse({
    @_s.required this.actionTargets,
    this.nextToken,
  });
  factory DescribeActionTargetsResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeActionTargetsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeHubResponse {
  /// The ARN of the Hub resource that was retrieved.
  @_s.JsonKey(name: 'HubArn')
  final String hubArn;

  /// The date and time when Security Hub was enabled in the account.
  @_s.JsonKey(name: 'SubscribedAt')
  final String subscribedAt;

  DescribeHubResponse({
    this.hubArn,
    this.subscribedAt,
  });
  factory DescribeHubResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeHubResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeProductsResponse {
  /// A list of products, including details for each product.
  @_s.JsonKey(name: 'Products')
  final List<Product> products;

  /// The pagination token to use to request the next page of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  DescribeProductsResponse({
    @_s.required this.products,
    this.nextToken,
  });
  factory DescribeProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeProductsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeStandardsControlsResponse {
  /// A list of security standards controls.
  @_s.JsonKey(name: 'Controls')
  final List<StandardsControl> controls;

  /// The pagination token to use to request the next page of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  DescribeStandardsControlsResponse({
    this.controls,
    this.nextToken,
  });
  factory DescribeStandardsControlsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeStandardsControlsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeStandardsResponse {
  /// The pagination token to use to request the next page of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A list of available standards.
  @_s.JsonKey(name: 'Standards')
  final List<Standard> standards;

  DescribeStandardsResponse({
    this.nextToken,
    this.standards,
  });
  factory DescribeStandardsResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeStandardsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisableImportFindingsForProductResponse {
  DisableImportFindingsForProductResponse();
  factory DisableImportFindingsForProductResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DisableImportFindingsForProductResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisableSecurityHubResponse {
  DisableSecurityHubResponse();
  factory DisableSecurityHubResponse.fromJson(Map<String, dynamic> json) =>
      _$DisableSecurityHubResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisassociateFromMasterAccountResponse {
  DisassociateFromMasterAccountResponse();
  factory DisassociateFromMasterAccountResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DisassociateFromMasterAccountResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisassociateMembersResponse {
  DisassociateMembersResponse();
  factory DisassociateMembersResponse.fromJson(Map<String, dynamic> json) =>
      _$DisassociateMembersResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EnableImportFindingsForProductResponse {
  /// The ARN of your subscription to the product to enable integrations for.
  @_s.JsonKey(name: 'ProductSubscriptionArn')
  final String productSubscriptionArn;

  EnableImportFindingsForProductResponse({
    this.productSubscriptionArn,
  });
  factory EnableImportFindingsForProductResponse.fromJson(
          Map<String, dynamic> json) =>
      _$EnableImportFindingsForProductResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EnableSecurityHubResponse {
  EnableSecurityHubResponse();
  factory EnableSecurityHubResponse.fromJson(Map<String, dynamic> json) =>
      _$EnableSecurityHubResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetEnabledStandardsResponse {
  /// The pagination token to use to request the next page of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The list of <code>StandardsSubscriptions</code> objects that include
  /// information about the enabled standards.
  @_s.JsonKey(name: 'StandardsSubscriptions')
  final List<StandardsSubscription> standardsSubscriptions;

  GetEnabledStandardsResponse({
    this.nextToken,
    this.standardsSubscriptions,
  });
  factory GetEnabledStandardsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetEnabledStandardsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetFindingsResponse {
  /// The findings that matched the filters specified in the request.
  @_s.JsonKey(name: 'Findings')
  final List<AwsSecurityFinding> findings;

  /// The pagination token to use to request the next page of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  GetFindingsResponse({
    @_s.required this.findings,
    this.nextToken,
  });
  factory GetFindingsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetFindingsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetInsightResultsResponse {
  /// The insight results returned by the operation.
  @_s.JsonKey(name: 'InsightResults')
  final InsightResults insightResults;

  GetInsightResultsResponse({
    @_s.required this.insightResults,
  });
  factory GetInsightResultsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetInsightResultsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetInsightsResponse {
  /// The insights returned by the operation.
  @_s.JsonKey(name: 'Insights')
  final List<Insight> insights;

  /// The pagination token to use to request the next page of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  GetInsightsResponse({
    @_s.required this.insights,
    this.nextToken,
  });
  factory GetInsightsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetInsightsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetInvitationsCountResponse {
  /// The number of all membership invitations sent to this Security Hub member
  /// account, not including the currently accepted invitation.
  @_s.JsonKey(name: 'InvitationsCount')
  final int invitationsCount;

  GetInvitationsCountResponse({
    this.invitationsCount,
  });
  factory GetInvitationsCountResponse.fromJson(Map<String, dynamic> json) =>
      _$GetInvitationsCountResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetMasterAccountResponse {
  /// A list of details about the Security Hub master account for the current
  /// member account.
  @_s.JsonKey(name: 'Master')
  final Invitation master;

  GetMasterAccountResponse({
    this.master,
  });
  factory GetMasterAccountResponse.fromJson(Map<String, dynamic> json) =>
      _$GetMasterAccountResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetMembersResponse {
  /// The list of details about the Security Hub member accounts.
  @_s.JsonKey(name: 'Members')
  final List<Member> members;

  /// The list of AWS accounts that could not be processed. For each account, the
  /// list includes the account ID and the email address.
  @_s.JsonKey(name: 'UnprocessedAccounts')
  final List<Result> unprocessedAccounts;

  GetMembersResponse({
    this.members,
    this.unprocessedAccounts,
  });
  factory GetMembersResponse.fromJson(Map<String, dynamic> json) =>
      _$GetMembersResponseFromJson(json);
}

/// The list of the findings that cannot be imported. For each finding, the list
/// provides the error.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ImportFindingsError {
  /// The code of the error returned by the <code>BatchImportFindings</code>
  /// operation.
  @_s.JsonKey(name: 'ErrorCode')
  final String errorCode;

  /// The message of the error returned by the <code>BatchImportFindings</code>
  /// operation.
  @_s.JsonKey(name: 'ErrorMessage')
  final String errorMessage;

  /// The identifier of the finding that could not be updated.
  @_s.JsonKey(name: 'Id')
  final String id;

  ImportFindingsError({
    @_s.required this.errorCode,
    @_s.required this.errorMessage,
    @_s.required this.id,
  });
  factory ImportFindingsError.fromJson(Map<String, dynamic> json) =>
      _$ImportFindingsErrorFromJson(json);
}

/// Contains information about a Security Hub insight.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Insight {
  /// One or more attributes used to filter the findings included in the insight.
  /// The insight only includes findings that match the criteria defined in the
  /// filters.
  @_s.JsonKey(name: 'Filters')
  final AwsSecurityFindingFilters filters;

  /// The grouping attribute for the insight's findings. Indicates how to group
  /// the matching findings, and identifies the type of item that the insight
  /// applies to. For example, if an insight is grouped by resource identifier,
  /// then the insight produces a list of resource identifiers.
  @_s.JsonKey(name: 'GroupByAttribute')
  final String groupByAttribute;

  /// The ARN of a Security Hub insight.
  @_s.JsonKey(name: 'InsightArn')
  final String insightArn;

  /// The name of a Security Hub insight.
  @_s.JsonKey(name: 'Name')
  final String name;

  Insight({
    @_s.required this.filters,
    @_s.required this.groupByAttribute,
    @_s.required this.insightArn,
    @_s.required this.name,
  });
  factory Insight.fromJson(Map<String, dynamic> json) =>
      _$InsightFromJson(json);
}

/// The insight result values returned by the <code>GetInsightResults</code>
/// operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InsightResultValue {
  /// The number of findings returned for each <code>GroupByAttributeValue</code>.
  @_s.JsonKey(name: 'Count')
  final int count;

  /// The value of the attribute that the findings are grouped by for the insight
  /// whose results are returned by the <code>GetInsightResults</code> operation.
  @_s.JsonKey(name: 'GroupByAttributeValue')
  final String groupByAttributeValue;

  InsightResultValue({
    @_s.required this.count,
    @_s.required this.groupByAttributeValue,
  });
  factory InsightResultValue.fromJson(Map<String, dynamic> json) =>
      _$InsightResultValueFromJson(json);
}

/// The insight results returned by the <code>GetInsightResults</code>
/// operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InsightResults {
  /// The attribute that the findings are grouped by for the insight whose results
  /// are returned by the <code>GetInsightResults</code> operation.
  @_s.JsonKey(name: 'GroupByAttribute')
  final String groupByAttribute;

  /// The ARN of the insight whose results are returned by the
  /// <code>GetInsightResults</code> operation.
  @_s.JsonKey(name: 'InsightArn')
  final String insightArn;

  /// The list of insight result values returned by the
  /// <code>GetInsightResults</code> operation.
  @_s.JsonKey(name: 'ResultValues')
  final List<InsightResultValue> resultValues;

  InsightResults({
    @_s.required this.groupByAttribute,
    @_s.required this.insightArn,
    @_s.required this.resultValues,
  });
  factory InsightResults.fromJson(Map<String, dynamic> json) =>
      _$InsightResultsFromJson(json);
}

enum IntegrationType {
  @_s.JsonValue('SEND_FINDINGS_TO_SECURITY_HUB')
  sendFindingsToSecurityHub,
  @_s.JsonValue('RECEIVE_FINDINGS_FROM_SECURITY_HUB')
  receiveFindingsFromSecurityHub,
}

/// Details about an invitation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Invitation {
  /// The account ID of the Security Hub master account that the invitation was
  /// sent from.
  @_s.JsonKey(name: 'AccountId')
  final String accountId;

  /// The ID of the invitation sent to the member account.
  @_s.JsonKey(name: 'InvitationId')
  final String invitationId;

  /// The timestamp of when the invitation was sent.
  @_s.JsonKey(
      name: 'InvitedAt', fromJson: iso8601FromJson, toJson: iso8601ToJson)
  final DateTime invitedAt;

  /// The current status of the association between the member and master
  /// accounts.
  @_s.JsonKey(name: 'MemberStatus')
  final String memberStatus;

  Invitation({
    this.accountId,
    this.invitationId,
    this.invitedAt,
    this.memberStatus,
  });
  factory Invitation.fromJson(Map<String, dynamic> json) =>
      _$InvitationFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InviteMembersResponse {
  /// The list of AWS accounts that could not be processed. For each account, the
  /// list includes the account ID and the email address.
  @_s.JsonKey(name: 'UnprocessedAccounts')
  final List<Result> unprocessedAccounts;

  InviteMembersResponse({
    this.unprocessedAccounts,
  });
  factory InviteMembersResponse.fromJson(Map<String, dynamic> json) =>
      _$InviteMembersResponseFromJson(json);
}

/// The IP filter for querying findings.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class IpFilter {
  /// A finding's CIDR value.
  @_s.JsonKey(name: 'Cidr')
  final String cidr;

  IpFilter({
    this.cidr,
  });
  factory IpFilter.fromJson(Map<String, dynamic> json) =>
      _$IpFilterFromJson(json);

  Map<String, dynamic> toJson() => _$IpFilterToJson(this);
}

/// A keyword filter for querying findings.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class KeywordFilter {
  /// A value for the keyword.
  @_s.JsonKey(name: 'Value')
  final String value;

  KeywordFilter({
    this.value,
  });
  factory KeywordFilter.fromJson(Map<String, dynamic> json) =>
      _$KeywordFilterFromJson(json);

  Map<String, dynamic> toJson() => _$KeywordFilterToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListEnabledProductsForImportResponse {
  /// The pagination token to use to request the next page of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The list of ARNs for the resources that represent your subscriptions to
  /// products.
  @_s.JsonKey(name: 'ProductSubscriptions')
  final List<String> productSubscriptions;

  ListEnabledProductsForImportResponse({
    this.nextToken,
    this.productSubscriptions,
  });
  factory ListEnabledProductsForImportResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListEnabledProductsForImportResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListInvitationsResponse {
  /// The details of the invitations returned by the operation.
  @_s.JsonKey(name: 'Invitations')
  final List<Invitation> invitations;

  /// The pagination token to use to request the next page of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListInvitationsResponse({
    this.invitations,
    this.nextToken,
  });
  factory ListInvitationsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListInvitationsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListMembersResponse {
  /// Member details returned by the operation.
  @_s.JsonKey(name: 'Members')
  final List<Member> members;

  /// The pagination token to use to request the next page of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListMembersResponse({
    this.members,
    this.nextToken,
  });
  factory ListMembersResponse.fromJson(Map<String, dynamic> json) =>
      _$ListMembersResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// The tags associated with a resource.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

/// Information about the state of the load balancer.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class LoadBalancerState {
  /// The state code. The initial state of the load balancer is provisioning.
  ///
  /// After the load balancer is fully set up and ready to route traffic, its
  /// state is active.
  ///
  /// If the load balancer could not be set up, its state is failed.
  @_s.JsonKey(name: 'Code')
  final String code;

  /// A description of the state.
  @_s.JsonKey(name: 'Reason')
  final String reason;

  LoadBalancerState({
    this.code,
    this.reason,
  });
  factory LoadBalancerState.fromJson(Map<String, dynamic> json) =>
      _$LoadBalancerStateFromJson(json);

  Map<String, dynamic> toJson() => _$LoadBalancerStateToJson(this);
}

/// A list of malware related to a finding.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Malware {
  /// The name of the malware that was observed.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The file system path of the malware that was observed.
  @_s.JsonKey(name: 'Path')
  final String path;

  /// The state of the malware that was observed.
  @_s.JsonKey(name: 'State')
  final MalwareState state;

  /// The type of the malware that was observed.
  @_s.JsonKey(name: 'Type')
  final MalwareType type;

  Malware({
    @_s.required this.name,
    this.path,
    this.state,
    this.type,
  });
  factory Malware.fromJson(Map<String, dynamic> json) =>
      _$MalwareFromJson(json);

  Map<String, dynamic> toJson() => _$MalwareToJson(this);
}

enum MalwareState {
  @_s.JsonValue('OBSERVED')
  observed,
  @_s.JsonValue('REMOVAL_FAILED')
  removalFailed,
  @_s.JsonValue('REMOVED')
  removed,
}

enum MalwareType {
  @_s.JsonValue('ADWARE')
  adware,
  @_s.JsonValue('BLENDED_THREAT')
  blendedThreat,
  @_s.JsonValue('BOTNET_AGENT')
  botnetAgent,
  @_s.JsonValue('COIN_MINER')
  coinMiner,
  @_s.JsonValue('EXPLOIT_KIT')
  exploitKit,
  @_s.JsonValue('KEYLOGGER')
  keylogger,
  @_s.JsonValue('MACRO')
  macro,
  @_s.JsonValue('POTENTIALLY_UNWANTED')
  potentiallyUnwanted,
  @_s.JsonValue('SPYWARE')
  spyware,
  @_s.JsonValue('RANSOMWARE')
  ransomware,
  @_s.JsonValue('REMOTE_ACCESS')
  remoteAccess,
  @_s.JsonValue('ROOTKIT')
  rootkit,
  @_s.JsonValue('TROJAN')
  trojan,
  @_s.JsonValue('VIRUS')
  virus,
  @_s.JsonValue('WORM')
  worm,
}

/// The map filter for querying findings.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MapFilter {
  /// The condition to apply to a key value when querying for findings with a map
  /// filter.
  @_s.JsonKey(name: 'Comparison')
  final MapFilterComparison comparison;

  /// The key of the map filter.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The value for the key in the map filter.
  @_s.JsonKey(name: 'Value')
  final String value;

  MapFilter({
    this.comparison,
    this.key,
    this.value,
  });
  factory MapFilter.fromJson(Map<String, dynamic> json) =>
      _$MapFilterFromJson(json);

  Map<String, dynamic> toJson() => _$MapFilterToJson(this);
}

enum MapFilterComparison {
  @_s.JsonValue('EQUALS')
  equals,
}

/// The details about a member account.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Member {
  /// The AWS account ID of the member account.
  @_s.JsonKey(name: 'AccountId')
  final String accountId;

  /// The email address of the member account.
  @_s.JsonKey(name: 'Email')
  final String email;

  /// A timestamp for the date and time when the invitation was sent to the member
  /// account.
  @_s.JsonKey(
      name: 'InvitedAt', fromJson: iso8601FromJson, toJson: iso8601ToJson)
  final DateTime invitedAt;

  /// The AWS account ID of the Security Hub master account associated with this
  /// member account.
  @_s.JsonKey(name: 'MasterId')
  final String masterId;

  /// The status of the relationship between the member account and its master
  /// account.
  @_s.JsonKey(name: 'MemberStatus')
  final String memberStatus;

  /// The timestamp for the date and time when the member account was updated.
  @_s.JsonKey(
      name: 'UpdatedAt', fromJson: iso8601FromJson, toJson: iso8601ToJson)
  final DateTime updatedAt;

  Member({
    this.accountId,
    this.email,
    this.invitedAt,
    this.masterId,
    this.memberStatus,
    this.updatedAt,
  });
  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);
}

/// The details of network-related information about a finding.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Network {
  /// The destination domain of network-related information about a finding.
  @_s.JsonKey(name: 'DestinationDomain')
  final String destinationDomain;

  /// The destination IPv4 address of network-related information about a finding.
  @_s.JsonKey(name: 'DestinationIpV4')
  final String destinationIpV4;

  /// The destination IPv6 address of network-related information about a finding.
  @_s.JsonKey(name: 'DestinationIpV6')
  final String destinationIpV6;

  /// The destination port of network-related information about a finding.
  @_s.JsonKey(name: 'DestinationPort')
  final int destinationPort;

  /// The direction of network traffic associated with a finding.
  @_s.JsonKey(name: 'Direction')
  final NetworkDirection direction;

  /// The protocol of network-related information about a finding.
  @_s.JsonKey(name: 'Protocol')
  final String protocol;

  /// The source domain of network-related information about a finding.
  @_s.JsonKey(name: 'SourceDomain')
  final String sourceDomain;

  /// The source IPv4 address of network-related information about a finding.
  @_s.JsonKey(name: 'SourceIpV4')
  final String sourceIpV4;

  /// The source IPv6 address of network-related information about a finding.
  @_s.JsonKey(name: 'SourceIpV6')
  final String sourceIpV6;

  /// The source media access control (MAC) address of network-related information
  /// about a finding.
  @_s.JsonKey(name: 'SourceMac')
  final String sourceMac;

  /// The source port of network-related information about a finding.
  @_s.JsonKey(name: 'SourcePort')
  final int sourcePort;

  Network({
    this.destinationDomain,
    this.destinationIpV4,
    this.destinationIpV6,
    this.destinationPort,
    this.direction,
    this.protocol,
    this.sourceDomain,
    this.sourceIpV4,
    this.sourceIpV6,
    this.sourceMac,
    this.sourcePort,
  });
  factory Network.fromJson(Map<String, dynamic> json) =>
      _$NetworkFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkToJson(this);
}

enum NetworkDirection {
  @_s.JsonValue('IN')
  $in,
  @_s.JsonValue('OUT')
  out,
}

/// A user-defined note added to a finding.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Note {
  /// The text of a note.
  @_s.JsonKey(name: 'Text')
  final String text;

  /// The timestamp of when the note was updated.
  @_s.JsonKey(name: 'UpdatedAt')
  final String updatedAt;

  /// The principal that created a note.
  @_s.JsonKey(name: 'UpdatedBy')
  final String updatedBy;

  Note({
    @_s.required this.text,
    @_s.required this.updatedAt,
    @_s.required this.updatedBy,
  });
  factory Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);

  Map<String, dynamic> toJson() => _$NoteToJson(this);
}

/// The updated note.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class NoteUpdate {
  /// The updated note text.
  @_s.JsonKey(name: 'Text')
  final String text;

  /// The principal that updated the note.
  @_s.JsonKey(name: 'UpdatedBy')
  final String updatedBy;

  NoteUpdate({
    @_s.required this.text,
    @_s.required this.updatedBy,
  });
  Map<String, dynamic> toJson() => _$NoteUpdateToJson(this);
}

/// A number filter for querying findings.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class NumberFilter {
  /// The equal-to condition to be applied to a single field when querying for
  /// findings.
  @_s.JsonKey(name: 'Eq')
  final double eq;

  /// The greater-than-equal condition to be applied to a single field when
  /// querying for findings.
  @_s.JsonKey(name: 'Gte')
  final double gte;

  /// The less-than-equal condition to be applied to a single field when querying
  /// for findings.
  @_s.JsonKey(name: 'Lte')
  final double lte;

  NumberFilter({
    this.eq,
    this.gte,
    this.lte,
  });
  factory NumberFilter.fromJson(Map<String, dynamic> json) =>
      _$NumberFilterFromJson(json);

  Map<String, dynamic> toJson() => _$NumberFilterToJson(this);
}

enum Partition {
  @_s.JsonValue('aws')
  aws,
  @_s.JsonValue('aws-cn')
  awsCn,
  @_s.JsonValue('aws-us-gov')
  awsUsGov,
}

/// The details of process-related information about a finding.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ProcessDetails {
  /// The date/time that the process was launched.
  @_s.JsonKey(name: 'LaunchedAt')
  final String launchedAt;

  /// The name of the process.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The parent process ID.
  @_s.JsonKey(name: 'ParentPid')
  final int parentPid;

  /// The path to the process executable.
  @_s.JsonKey(name: 'Path')
  final String path;

  /// The process ID.
  @_s.JsonKey(name: 'Pid')
  final int pid;

  /// The date and time when the process was terminated.
  @_s.JsonKey(name: 'TerminatedAt')
  final String terminatedAt;

  ProcessDetails({
    this.launchedAt,
    this.name,
    this.parentPid,
    this.path,
    this.pid,
    this.terminatedAt,
  });
  factory ProcessDetails.fromJson(Map<String, dynamic> json) =>
      _$ProcessDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$ProcessDetailsToJson(this);
}

/// Contains details about a product.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Product {
  /// The ARN assigned to the product.
  @_s.JsonKey(name: 'ProductArn')
  final String productArn;

  /// The URL used to activate the product.
  @_s.JsonKey(name: 'ActivationUrl')
  final String activationUrl;

  /// The categories assigned to the product.
  @_s.JsonKey(name: 'Categories')
  final List<String> categories;

  /// The name of the company that provides the product.
  @_s.JsonKey(name: 'CompanyName')
  final String companyName;

  /// A description of the product.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The types of integration that the product supports. Available values are the
  /// following.
  ///
  /// <ul>
  /// <li>
  /// <code>SEND_FINDINGS_TO_SECURITY_HUB</code> - Indicates that the integration
  /// sends findings to Security Hub.
  /// </li>
  /// <li>
  /// <code>RECEIVE_FINDINGS_FROM_SECURITY_HUB</code> - Indicates that the
  /// integration receives findings from Security Hub.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'IntegrationTypes')
  final List<String> integrationTypes;

  /// The URL for the page that contains more information about the product.
  @_s.JsonKey(name: 'MarketplaceUrl')
  final String marketplaceUrl;

  /// The name of the product.
  @_s.JsonKey(name: 'ProductName')
  final String productName;

  /// The resource policy associated with the product.
  @_s.JsonKey(name: 'ProductSubscriptionResourcePolicy')
  final String productSubscriptionResourcePolicy;

  Product({
    @_s.required this.productArn,
    this.activationUrl,
    this.categories,
    this.companyName,
    this.description,
    this.integrationTypes,
    this.marketplaceUrl,
    this.productName,
    this.productSubscriptionResourcePolicy,
  });
  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}

/// A recommendation on how to remediate the issue identified in a finding.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Recommendation {
  /// Describes the recommended steps to take to remediate an issue identified in
  /// a finding.
  @_s.JsonKey(name: 'Text')
  final String text;

  /// A URL to a page or site that contains information about how to remediate a
  /// finding.
  @_s.JsonKey(name: 'Url')
  final String url;

  Recommendation({
    this.text,
    this.url,
  });
  factory Recommendation.fromJson(Map<String, dynamic> json) =>
      _$RecommendationFromJson(json);

  Map<String, dynamic> toJson() => _$RecommendationToJson(this);
}

enum RecordState {
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('ARCHIVED')
  archived,
}

extension on RecordState {
  String toValue() {
    switch (this) {
      case RecordState.active:
        return 'ACTIVE';
      case RecordState.archived:
        return 'ARCHIVED';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Details about a related finding.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RelatedFinding {
  /// The product-generated identifier for a related finding.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The ARN of the product that generated a related finding.
  @_s.JsonKey(name: 'ProductArn')
  final String productArn;

  RelatedFinding({
    @_s.required this.id,
    @_s.required this.productArn,
  });
  factory RelatedFinding.fromJson(Map<String, dynamic> json) =>
      _$RelatedFindingFromJson(json);

  Map<String, dynamic> toJson() => _$RelatedFindingToJson(this);
}

/// Details about the remediation steps for a finding.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Remediation {
  /// A recommendation on the steps to take to remediate the issue identified by a
  /// finding.
  @_s.JsonKey(name: 'Recommendation')
  final Recommendation recommendation;

  Remediation({
    this.recommendation,
  });
  factory Remediation.fromJson(Map<String, dynamic> json) =>
      _$RemediationFromJson(json);

  Map<String, dynamic> toJson() => _$RemediationToJson(this);
}

/// A resource related to a finding.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Resource {
  /// The canonical identifier for the given resource type.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The type of the resource that details are provided for. If possible, set
  /// <code>Type</code> to one of the supported resource types. For example, if
  /// the resource is an EC2 instance, then set <code>Type</code> to
  /// <code>AwsEc2Instance</code>.
  ///
  /// If the resource does not match any of the provided types, then set
  /// <code>Type</code> to <code>Other</code>.
  @_s.JsonKey(name: 'Type')
  final String type;

  /// Additional details about the resource related to a finding.
  @_s.JsonKey(name: 'Details')
  final ResourceDetails details;

  /// The canonical AWS partition name that the Region is assigned to.
  @_s.JsonKey(name: 'Partition')
  final Partition partition;

  /// The canonical AWS external Region name where this resource is located.
  @_s.JsonKey(name: 'Region')
  final String region;

  /// A list of AWS tags associated with a resource at the time the finding was
  /// processed.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  Resource({
    @_s.required this.id,
    @_s.required this.type,
    this.details,
    this.partition,
    this.region,
    this.tags,
  });
  factory Resource.fromJson(Map<String, dynamic> json) =>
      _$ResourceFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceToJson(this);
}

/// Additional details about a resource related to a finding.
///
/// To provide the details, use the object that corresponds to the resource
/// type. For example, if the resource type is <code>AwsEc2Instance</code>, then
/// you use the <code>AwsEc2Instance</code> object to provide the details.
///
/// If the type-specific object does not contain all of the fields you want to
/// populate, then you use the <code>Other</code> object to populate those
/// additional fields.
///
/// You also use the <code>Other</code> object to populate the details when the
/// selected type does not have a corresponding object.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ResourceDetails {
  /// Details about a CloudFront distribution.
  @_s.JsonKey(name: 'AwsCloudFrontDistribution')
  final AwsCloudFrontDistributionDetails awsCloudFrontDistribution;

  /// Details for an AWS CodeBuild project.
  @_s.JsonKey(name: 'AwsCodeBuildProject')
  final AwsCodeBuildProjectDetails awsCodeBuildProject;

  /// Details about an Amazon EC2 instance related to a finding.
  @_s.JsonKey(name: 'AwsEc2Instance')
  final AwsEc2InstanceDetails awsEc2Instance;

  /// Details for an AWS EC2 network interface.
  @_s.JsonKey(name: 'AwsEc2NetworkInterface')
  final AwsEc2NetworkInterfaceDetails awsEc2NetworkInterface;

  /// Details for an EC2 security group.
  @_s.JsonKey(name: 'AwsEc2SecurityGroup')
  final AwsEc2SecurityGroupDetails awsEc2SecurityGroup;

  /// Details for an Elasticsearch domain.
  @_s.JsonKey(name: 'AwsElasticsearchDomain')
  final AwsElasticsearchDomainDetails awsElasticsearchDomain;

  /// Details about a load balancer.
  @_s.JsonKey(name: 'AwsElbv2LoadBalancer')
  final AwsElbv2LoadBalancerDetails awsElbv2LoadBalancer;

  /// Details about an IAM access key related to a finding.
  @_s.JsonKey(name: 'AwsIamAccessKey')
  final AwsIamAccessKeyDetails awsIamAccessKey;

  /// Details about an IAM role.
  @_s.JsonKey(name: 'AwsIamRole')
  final AwsIamRoleDetails awsIamRole;

  /// Details about a KMS key.
  @_s.JsonKey(name: 'AwsKmsKey')
  final AwsKmsKeyDetails awsKmsKey;

  /// Details about a Lambda function.
  @_s.JsonKey(name: 'AwsLambdaFunction')
  final AwsLambdaFunctionDetails awsLambdaFunction;

  /// Details for a Lambda layer version.
  @_s.JsonKey(name: 'AwsLambdaLayerVersion')
  final AwsLambdaLayerVersionDetails awsLambdaLayerVersion;

  /// Details for an RDS database instance.
  @_s.JsonKey(name: 'AwsRdsDbInstance')
  final AwsRdsDbInstanceDetails awsRdsDbInstance;

  /// Details about an Amazon S3 Bucket related to a finding.
  @_s.JsonKey(name: 'AwsS3Bucket')
  final AwsS3BucketDetails awsS3Bucket;

  /// Details about an Amazon S3 object related to a finding.
  @_s.JsonKey(name: 'AwsS3Object')
  final AwsS3ObjectDetails awsS3Object;

  /// Details about an SNS topic.
  @_s.JsonKey(name: 'AwsSnsTopic')
  final AwsSnsTopicDetails awsSnsTopic;

  /// Details about an SQS queue.
  @_s.JsonKey(name: 'AwsSqsQueue')
  final AwsSqsQueueDetails awsSqsQueue;

  /// Details for a WAF WebACL.
  @_s.JsonKey(name: 'AwsWafWebAcl')
  final AwsWafWebAclDetails awsWafWebAcl;

  /// Details about a container resource related to a finding.
  @_s.JsonKey(name: 'Container')
  final ContainerDetails container;

  /// Details about a resource that are not available in a type-specific details
  /// object. Use the <code>Other</code> object in the following cases.
  ///
  /// <ul>
  /// <li>
  /// The type-specific object does not contain all of the fields that you want to
  /// populate. In this case, first use the type-specific object to populate those
  /// fields. Use the <code>Other</code> object to populate the fields that are
  /// missing from the type-specific object.
  /// </li>
  /// <li>
  /// The resource type does not have a corresponding object. This includes
  /// resources for which the type is <code>Other</code>.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Other')
  final Map<String, String> other;

  ResourceDetails({
    this.awsCloudFrontDistribution,
    this.awsCodeBuildProject,
    this.awsEc2Instance,
    this.awsEc2NetworkInterface,
    this.awsEc2SecurityGroup,
    this.awsElasticsearchDomain,
    this.awsElbv2LoadBalancer,
    this.awsIamAccessKey,
    this.awsIamRole,
    this.awsKmsKey,
    this.awsLambdaFunction,
    this.awsLambdaLayerVersion,
    this.awsRdsDbInstance,
    this.awsS3Bucket,
    this.awsS3Object,
    this.awsSnsTopic,
    this.awsSqsQueue,
    this.awsWafWebAcl,
    this.container,
    this.other,
  });
  factory ResourceDetails.fromJson(Map<String, dynamic> json) =>
      _$ResourceDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceDetailsToJson(this);
}

/// Details about the account that was not processed.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Result {
  /// An AWS account ID of the account that was not processed.
  @_s.JsonKey(name: 'AccountId')
  final String accountId;

  /// The reason that the account was not processed.
  @_s.JsonKey(name: 'ProcessingResult')
  final String processingResult;

  Result({
    this.accountId,
    this.processingResult,
  });
  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}

/// The severity of the finding.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Severity {
  /// The severity value of the finding. The allowed values are the following.
  ///
  /// <ul>
  /// <li>
  /// <code>INFORMATIONAL</code> - No issue was found.
  /// </li>
  /// <li>
  /// <code>LOW</code> - The issue does not require action on its own.
  /// </li>
  /// <li>
  /// <code>MEDIUM</code> - The issue must be addressed but not urgently.
  /// </li>
  /// <li>
  /// <code>HIGH</code> - The issue must be addressed as a priority.
  /// </li>
  /// <li>
  /// <code>CRITICAL</code> - The issue must be remediated immediately to avoid it
  /// escalating.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Label')
  final SeverityLabel label;

  /// Deprecated. This attribute is being deprecated. Instead of providing
  /// <code>Normalized</code>, provide <code>Label</code>.
  ///
  /// If you provide <code>Normalized</code> and do not provide
  /// <code>Label</code>, <code>Label</code> is set automatically as follows.
  ///
  /// <ul>
  /// <li>
  /// 0 - <code>INFORMATIONAL</code>
  /// </li>
  /// <li>
  /// 1–39 - <code>LOW</code>
  /// </li>
  /// <li>
  /// 40–69 - <code>MEDIUM</code>
  /// </li>
  /// <li>
  /// 70–89 - <code>HIGH</code>
  /// </li>
  /// <li>
  /// 90–100 - <code>CRITICAL</code>
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Normalized')
  final int normalized;

  /// The native severity as defined by the AWS service or integrated partner
  /// product that generated the finding.
  @_s.JsonKey(name: 'Product')
  final double product;

  Severity({
    this.label,
    this.normalized,
    this.product,
  });
  factory Severity.fromJson(Map<String, dynamic> json) =>
      _$SeverityFromJson(json);

  Map<String, dynamic> toJson() => _$SeverityToJson(this);
}

enum SeverityLabel {
  @_s.JsonValue('INFORMATIONAL')
  informational,
  @_s.JsonValue('LOW')
  low,
  @_s.JsonValue('MEDIUM')
  medium,
  @_s.JsonValue('HIGH')
  high,
  @_s.JsonValue('CRITICAL')
  critical,
}

enum SeverityRating {
  @_s.JsonValue('LOW')
  low,
  @_s.JsonValue('MEDIUM')
  medium,
  @_s.JsonValue('HIGH')
  high,
  @_s.JsonValue('CRITICAL')
  critical,
}

/// Updates to the severity information for a finding.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class SeverityUpdate {
  /// The severity value of the finding. The allowed values are the following.
  ///
  /// <ul>
  /// <li>
  /// <code>INFORMATIONAL</code> - No issue was found.
  /// </li>
  /// <li>
  /// <code>LOW</code> - The issue does not require action on its own.
  /// </li>
  /// <li>
  /// <code>MEDIUM</code> - The issue must be addressed but not urgently.
  /// </li>
  /// <li>
  /// <code>HIGH</code> - The issue must be addressed as a priority.
  /// </li>
  /// <li>
  /// <code>CRITICAL</code> - The issue must be remediated immediately to avoid it
  /// escalating.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Label')
  final SeverityLabel label;

  /// The normalized severity for the finding. This attribute is to be deprecated
  /// in favor of <code>Label</code>.
  ///
  /// If you provide <code>Normalized</code> and do not provide
  /// <code>Label</code>, <code>Label</code> is set automatically as follows.
  ///
  /// <ul>
  /// <li>
  /// 0 - <code>INFORMATIONAL</code>
  /// </li>
  /// <li>
  /// 1–39 - <code>LOW</code>
  /// </li>
  /// <li>
  /// 40–69 - <code>MEDIUM</code>
  /// </li>
  /// <li>
  /// 70–89 - <code>HIGH</code>
  /// </li>
  /// <li>
  /// 90–100 - <code>CRITICAL</code>
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Normalized')
  final int normalized;

  /// The native severity as defined by the AWS service or integrated partner
  /// product that generated the finding.
  @_s.JsonKey(name: 'Product')
  final double product;

  SeverityUpdate({
    this.label,
    this.normalized,
    this.product,
  });
  Map<String, dynamic> toJson() => _$SeverityUpdateToJson(this);
}

/// A collection of finding attributes used to sort findings.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class SortCriterion {
  /// The finding attribute used to sort findings.
  @_s.JsonKey(name: 'Field')
  final String field;

  /// The order used to sort findings.
  @_s.JsonKey(name: 'SortOrder')
  final SortOrder sortOrder;

  SortCriterion({
    this.field,
    this.sortOrder,
  });
  Map<String, dynamic> toJson() => _$SortCriterionToJson(this);
}

enum SortOrder {
  @_s.JsonValue('asc')
  asc,
  @_s.JsonValue('desc')
  desc,
}

/// Provides information about a specific standard.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Standard {
  /// A description of the standard.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// Whether the standard is enabled by default. When Security Hub is enabled
  /// from the console, if a standard is enabled by default, the check box for
  /// that standard is selected by default.
  ///
  /// When Security Hub is enabled using the <code>EnableSecurityHub</code> API
  /// operation, the standard is enabled by default unless
  /// <code>EnableDefaultStandards</code> is set to <code>false</code>.
  @_s.JsonKey(name: 'EnabledByDefault')
  final bool enabledByDefault;

  /// The name of the standard.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The ARN of a standard.
  @_s.JsonKey(name: 'StandardsArn')
  final String standardsArn;

  Standard({
    this.description,
    this.enabledByDefault,
    this.name,
    this.standardsArn,
  });
  factory Standard.fromJson(Map<String, dynamic> json) =>
      _$StandardFromJson(json);
}

/// Details for an individual security standard control.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StandardsControl {
  /// The identifier of the security standard control.
  @_s.JsonKey(name: 'ControlId')
  final String controlId;

  /// The current status of the security standard control. Indicates whether the
  /// control is enabled or disabled. Security Hub does not check against disabled
  /// controls.
  @_s.JsonKey(name: 'ControlStatus')
  final ControlStatus controlStatus;

  /// The date and time that the status of the security standard control was most
  /// recently updated.
  @_s.JsonKey(
      name: 'ControlStatusUpdatedAt',
      fromJson: iso8601FromJson,
      toJson: iso8601ToJson)
  final DateTime controlStatusUpdatedAt;

  /// The longer description of the security standard control. Provides
  /// information about what the control is checking for.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The reason provided for the most recent change in status for the control.
  @_s.JsonKey(name: 'DisabledReason')
  final String disabledReason;

  /// The list of requirements that are related to this control.
  @_s.JsonKey(name: 'RelatedRequirements')
  final List<String> relatedRequirements;

  /// A link to remediation information for the control in the Security Hub user
  /// documentation.
  @_s.JsonKey(name: 'RemediationUrl')
  final String remediationUrl;

  /// The severity of findings generated from this security standard control.
  ///
  /// The finding severity is based on an assessment of how easy it would be to
  /// compromise AWS resources if the issue is detected.
  @_s.JsonKey(name: 'SeverityRating')
  final SeverityRating severityRating;

  /// The ARN of the security standard control.
  @_s.JsonKey(name: 'StandardsControlArn')
  final String standardsControlArn;

  /// The title of the security standard control.
  @_s.JsonKey(name: 'Title')
  final String title;

  StandardsControl({
    this.controlId,
    this.controlStatus,
    this.controlStatusUpdatedAt,
    this.description,
    this.disabledReason,
    this.relatedRequirements,
    this.remediationUrl,
    this.severityRating,
    this.standardsControlArn,
    this.title,
  });
  factory StandardsControl.fromJson(Map<String, dynamic> json) =>
      _$StandardsControlFromJson(json);
}

enum StandardsStatus {
  @_s.JsonValue('PENDING')
  pending,
  @_s.JsonValue('READY')
  ready,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('DELETING')
  deleting,
  @_s.JsonValue('INCOMPLETE')
  incomplete,
}

/// A resource that represents your subscription to a supported standard.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StandardsSubscription {
  /// The ARN of a standard.
  @_s.JsonKey(name: 'StandardsArn')
  final String standardsArn;

  /// A key-value pair of input for the standard.
  @_s.JsonKey(name: 'StandardsInput')
  final Map<String, String> standardsInput;

  /// The status of the standards subscription.
  @_s.JsonKey(name: 'StandardsStatus')
  final StandardsStatus standardsStatus;

  /// The ARN of a resource that represents your subscription to a supported
  /// standard.
  @_s.JsonKey(name: 'StandardsSubscriptionArn')
  final String standardsSubscriptionArn;

  StandardsSubscription({
    @_s.required this.standardsArn,
    @_s.required this.standardsInput,
    @_s.required this.standardsStatus,
    @_s.required this.standardsSubscriptionArn,
  });
  factory StandardsSubscription.fromJson(Map<String, dynamic> json) =>
      _$StandardsSubscriptionFromJson(json);
}

/// The standard that you want to enable.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class StandardsSubscriptionRequest {
  /// The ARN of the standard that you want to enable. To view the list of
  /// available standards and their ARNs, use the <code> <a>DescribeStandards</a>
  /// </code> operation.
  @_s.JsonKey(name: 'StandardsArn')
  final String standardsArn;

  /// A key-value pair of input for the standard.
  @_s.JsonKey(name: 'StandardsInput')
  final Map<String, String> standardsInput;

  StandardsSubscriptionRequest({
    @_s.required this.standardsArn,
    this.standardsInput,
  });
  Map<String, dynamic> toJson() => _$StandardsSubscriptionRequestToJson(this);
}

/// A string filter for querying findings.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class StringFilter {
  /// The condition to be applied to a string value when querying for findings.
  @_s.JsonKey(name: 'Comparison')
  final StringFilterComparison comparison;

  /// The string filter value.
  @_s.JsonKey(name: 'Value')
  final String value;

  StringFilter({
    this.comparison,
    this.value,
  });
  factory StringFilter.fromJson(Map<String, dynamic> json) =>
      _$StringFilterFromJson(json);

  Map<String, dynamic> toJson() => _$StringFilterToJson(this);
}

enum StringFilterComparison {
  @_s.JsonValue('EQUALS')
  equals,
  @_s.JsonValue('PREFIX')
  prefix,
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

/// Details about the threat intelligence related to a finding.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ThreatIntelIndicator {
  /// The category of a threat intelligence indicator.
  @_s.JsonKey(name: 'Category')
  final ThreatIntelIndicatorCategory category;

  /// The date and time when the most recent instance of a threat intelligence
  /// indicator was observed.
  @_s.JsonKey(name: 'LastObservedAt')
  final String lastObservedAt;

  /// The source of the threat intelligence indicator.
  @_s.JsonKey(name: 'Source')
  final String source;

  /// The URL to the page or site where you can get more information about the
  /// threat intelligence indicator.
  @_s.JsonKey(name: 'SourceUrl')
  final String sourceUrl;

  /// The type of threat intelligence indicator.
  @_s.JsonKey(name: 'Type')
  final ThreatIntelIndicatorType type;

  /// The value of a threat intelligence indicator.
  @_s.JsonKey(name: 'Value')
  final String value;

  ThreatIntelIndicator({
    this.category,
    this.lastObservedAt,
    this.source,
    this.sourceUrl,
    this.type,
    this.value,
  });
  factory ThreatIntelIndicator.fromJson(Map<String, dynamic> json) =>
      _$ThreatIntelIndicatorFromJson(json);

  Map<String, dynamic> toJson() => _$ThreatIntelIndicatorToJson(this);
}

enum ThreatIntelIndicatorCategory {
  @_s.JsonValue('BACKDOOR')
  backdoor,
  @_s.JsonValue('CARD_STEALER')
  cardStealer,
  @_s.JsonValue('COMMAND_AND_CONTROL')
  commandAndControl,
  @_s.JsonValue('DROP_SITE')
  dropSite,
  @_s.JsonValue('EXPLOIT_SITE')
  exploitSite,
  @_s.JsonValue('KEYLOGGER')
  keylogger,
}

enum ThreatIntelIndicatorType {
  @_s.JsonValue('DOMAIN')
  domain,
  @_s.JsonValue('EMAIL_ADDRESS')
  emailAddress,
  @_s.JsonValue('HASH_MD5')
  hashMd5,
  @_s.JsonValue('HASH_SHA1')
  hashSha1,
  @_s.JsonValue('HASH_SHA256')
  hashSha256,
  @_s.JsonValue('HASH_SHA512')
  hashSha512,
  @_s.JsonValue('IPV4_ADDRESS')
  ipv4Address,
  @_s.JsonValue('IPV6_ADDRESS')
  ipv6Address,
  @_s.JsonValue('MUTEX')
  mutex,
  @_s.JsonValue('PROCESS')
  process,
  @_s.JsonValue('URL')
  url,
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
class UpdateActionTargetResponse {
  UpdateActionTargetResponse();
  factory UpdateActionTargetResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateActionTargetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateFindingsResponse {
  UpdateFindingsResponse();
  factory UpdateFindingsResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateFindingsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateInsightResponse {
  UpdateInsightResponse();
  factory UpdateInsightResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateInsightResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateStandardsControlResponse {
  UpdateStandardsControlResponse();
  factory UpdateStandardsControlResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateStandardsControlResponseFromJson(json);
}

enum VerificationState {
  @_s.JsonValue('UNKNOWN')
  unknown,
  @_s.JsonValue('TRUE_POSITIVE')
  truePositive,
  @_s.JsonValue('FALSE_POSITIVE')
  falsePositive,
  @_s.JsonValue('BENIGN_POSITIVE')
  benignPositive,
}

extension on VerificationState {
  String toValue() {
    switch (this) {
      case VerificationState.unknown:
        return 'UNKNOWN';
      case VerificationState.truePositive:
        return 'TRUE_POSITIVE';
      case VerificationState.falsePositive:
        return 'FALSE_POSITIVE';
      case VerificationState.benignPositive:
        return 'BENIGN_POSITIVE';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Details about the action that CloudFront or AWS WAF takes when a web request
/// matches the conditions in the Rule.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class WafAction {
  /// Specifies how you want AWS WAF to respond to requests that match the
  /// settings in a Rule.
  ///
  /// Valid settings include the following:
  ///
  /// <ul>
  /// <li>
  /// <code>ALLOW</code> - AWS WAF allows requests
  /// </li>
  /// <li>
  /// <code>BLOCK</code> - AWS WAF blocks requests
  /// </li>
  /// <li>
  /// <code>COUNT</code> - AWS WAF increments a counter of the requests that match
  /// all of the conditions in the rule. AWS WAF then continues to inspect the web
  /// request based on the remaining rules in the web ACL. You can't specify
  /// <code>COUNT</code> for the default action for a WebACL.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Type')
  final String type;

  WafAction({
    this.type,
  });
  factory WafAction.fromJson(Map<String, dynamic> json) =>
      _$WafActionFromJson(json);

  Map<String, dynamic> toJson() => _$WafActionToJson(this);
}

/// Details about a rule to exclude from a rule group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class WafExcludedRule {
  /// The unique identifier for the rule to exclude from the rule group.
  @_s.JsonKey(name: 'RuleId')
  final String ruleId;

  WafExcludedRule({
    this.ruleId,
  });
  factory WafExcludedRule.fromJson(Map<String, dynamic> json) =>
      _$WafExcludedRuleFromJson(json);

  Map<String, dynamic> toJson() => _$WafExcludedRuleToJson(this);
}

/// Details about an override action for a rule.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class WafOverrideAction {
  /// <code>COUNT</code> overrides the action specified by the individual rule
  /// within a RuleGroup .
  ///
  /// If set to <code>NONE</code>, the rule's action takes place.
  @_s.JsonKey(name: 'Type')
  final String type;

  WafOverrideAction({
    this.type,
  });
  factory WafOverrideAction.fromJson(Map<String, dynamic> json) =>
      _$WafOverrideActionFromJson(json);

  Map<String, dynamic> toJson() => _$WafOverrideActionToJson(this);
}

/// Provides information about the status of the investigation into a finding.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Workflow {
  /// The status of the investigation into the finding. The allowed values are the
  /// following.
  ///
  /// <ul>
  /// <li>
  /// <code>NEW</code> - The initial state of a finding, before it is reviewed.
  /// </li>
  /// <li>
  /// <code>NOTIFIED</code> - Indicates that you notified the resource owner about
  /// the security issue. Used when the initial reviewer is not the resource
  /// owner, and needs intervention from the resource owner.
  /// </li>
  /// <li>
  /// <code>SUPPRESSED</code> - The finding will not be reviewed again and will
  /// not be acted upon.
  /// </li>
  /// <li>
  /// <code>RESOLVED</code> - The finding was reviewed and remediated and is now
  /// considered resolved.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Status')
  final WorkflowStatus status;

  Workflow({
    this.status,
  });
  factory Workflow.fromJson(Map<String, dynamic> json) =>
      _$WorkflowFromJson(json);

  Map<String, dynamic> toJson() => _$WorkflowToJson(this);
}

@Deprecated('Deprecated')
enum WorkflowState {
  @_s.JsonValue('NEW')
  $new,
  @_s.JsonValue('ASSIGNED')
  assigned,
  @_s.JsonValue('IN_PROGRESS')
  inProgress,
  @_s.JsonValue('DEFERRED')
  deferred,
  @_s.JsonValue('RESOLVED')
  resolved,
}

enum WorkflowStatus {
  @_s.JsonValue('NEW')
  $new,
  @_s.JsonValue('NOTIFIED')
  notified,
  @_s.JsonValue('RESOLVED')
  resolved,
  @_s.JsonValue('SUPPRESSED')
  suppressed,
}

/// Used to update information about the investigation into the finding.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class WorkflowUpdate {
  /// The status of the investigation into the finding. The allowed values are the
  /// following.
  ///
  /// <ul>
  /// <li>
  /// <code>NEW</code> - The initial state of a finding, before it is reviewed.
  /// </li>
  /// <li>
  /// <code>NOTIFIED</code> - Indicates that you notified the resource owner about
  /// the security issue. Used when the initial reviewer is not the resource
  /// owner, and needs intervention from the resource owner.
  /// </li>
  /// <li>
  /// <code>RESOLVED</code> - The finding was reviewed and remediated and is now
  /// considered resolved.
  /// </li>
  /// <li>
  /// <code>SUPPRESSED</code> - The finding will not be reviewed again and will
  /// not be acted upon.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Status')
  final WorkflowStatus status;

  WorkflowUpdate({
    this.status,
  });
  Map<String, dynamic> toJson() => _$WorkflowUpdateToJson(this);
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String type, String message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class InternalException extends _s.GenericAwsException {
  InternalException({String type, String message})
      : super(type: type, code: 'InternalException', message: message);
}

class InvalidAccessException extends _s.GenericAwsException {
  InvalidAccessException({String type, String message})
      : super(type: type, code: 'InvalidAccessException', message: message);
}

class InvalidInputException extends _s.GenericAwsException {
  InvalidInputException({String type, String message})
      : super(type: type, code: 'InvalidInputException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String type, String message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class ResourceConflictException extends _s.GenericAwsException {
  ResourceConflictException({String type, String message})
      : super(type: type, code: 'ResourceConflictException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'InternalException': (type, message) =>
      InternalException(type: type, message: message),
  'InvalidAccessException': (type, message) =>
      InvalidAccessException(type: type, message: message),
  'InvalidInputException': (type, message) =>
      InvalidInputException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'ResourceConflictException': (type, message) =>
      ResourceConflictException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
};
